
=head1 PGcourse.pl

 #
 #  Do course-specific initialization here.
 #  (E.g. loading source.pl to get "show source" buttons
 #  for example courses, and so on).
 #

=cut
sub _PGcourse_init {};

 $guest   = ($effectivePermissionLevel == -5) ; ####    practice user

 ####   Presume that faculty observers are given TA status (permission 5).
 $observe = ($effectivePermissionLevel >=  5) ; ####    TA or Professor (permission 10)

 loadMacros("PGanswermacros.pl", "problemRandomize.pl" ) ;

 ####   Allow a Guest or Observer to always get a new version of problem.

 ProblemRandomize( when => "Always", onlyAfterDue => 0, style => "Button", label => "Générer une nouvelle version de ce problème")
        if      ($guest or $observe) ;

 ####   Allow everybody else (e.g., a student) to get a new version (for more practice)
 ####   after correct answer(s) to first (scored) version OR after the assignment's due date
# $when = (time >= $main::dueDate ? "Always" : "Correct");
# ProblemRandomize( when => "Always", onlyAfterDue => 1, style => "Button", label => "Générer une nouvelle version")
 #      if      not ($guest or $observe) ;

#loadMacros("source.pl");
1;
