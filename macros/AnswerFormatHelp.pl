=head1 NAME

AnswerFormatHelp.pl

=head1 SYNOPSIS

Creates links for students to help documentation on formatting 
answers and allows for custom help links. 

=head1 DESCRIPTION

There are 15 predefined help links: angles, decimals, equations, 
exponents, formulas, fractions, inequalities, intervals, limits, 
logarithms, numbers, points, syntax, units, vectors.

Usage:

     DOCUMENT();
     loadMacros("PGstandard.pl","AnswerFormatHelp.pl",);
     TEXT(beginproblem());
     BEGIN_TEXT
     \{ ans_rule(20) \} 
     \{ AnswerFormatHelp("formulas") \} $PAR
     \{ ans_rule(20) \}
     \{ AnswerFormatHelp("equations","help entering equations") \} $PAR
     END_TEXT
     ENDDOCUMENT();


The first example use defaults and displays the help link right next to 
the answer blank, which is recommended.  The second example customizes 
the link text displayed to the student, but the actual help document
is unaffected.

=head1 AUTHOR

Paul Pearson, Fort Lewis College, Department of Mathematics

=cut



###########################



sub _AnswerFormatHelp_init {}; # don't reload this file

sub AnswerFormatHelp {

#
#  Define some local variables
#
my $helptype = shift;
my $customstring = shift;

my $helpstring = "";





####################################
#  Angles

if ($helptype =~ m/angle/i) {

if ($angleHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpAngles() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des angles</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des angles</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Les angles sans unités sont en radians par défaut:</font><blockquote>Pour un angle de  60 degrés, entrez le en radians par &nbsp; <code>pi/3</code> &nbsp; ou &nbsp; <code>1.04719...</code>, mais <b>pas 60</b><br />Par défaut, les fonctions trigonométriques sont évaluées en radians et donc  <code>cos(pi/3) = 1/2</code>, mais <code>cos(60) = -0.9524</code> puisque les unités sont en radians. Vous devez convertir vos degrés en radians avant de pouvoir appliquer une fonction trigonométrique à un angle.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, il est nécessaire de préciser les unités des angles:</font><blockquote>Lorsque c'est le cas, entrez, par exemple, <br /><code>pi/6 rad</code> &nbsp; (incluant rad)<br /><code>30 deg</code> &nbsp; (incluant deg)</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemples de constantes disponibles:</font><blockquote><code>pi</code>, &nbsp; <code>e = e^1</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>parfois, les décimales ne sont pas autorisées:</font><blockquote>Parfois &nbsp; <code>pi/6</code> &nbsp; est autorisé, mais &nbsp; <code>0.524</code> &nbsp; ne l'est pas</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les fonctions trigonométriques ne sont pas autorisées:</font><blockquote>parfois &nbsp; <code>0.866025403784</code> &nbsp; est autorisé, mais &nbsp; <code>cos(pi/6)</code> &nbsp; ne l'est pas</blockquote></li>")
OpenWindow.document.write("<li><a href='http://webwork.maa.org/wiki/Available_Functions' target='_new'>Lien vers une liste de toutes les fonctions disponibles (en anglais)</a><br /><br /></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $angleHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (angles)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpAngles()';");
} else { return; }








####################################
#  Decimals

} elsif ($helptype =~ m/decimal/i) {

if ($decimalHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpDecimals() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des décimales</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des décimales</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>En général, écrivez au moins 5 décimales.</font><blockquote>Normalement, si votre réponse est correcte à 5 décimales près, elle va être considérée comme correcte.  Cependant, le nombre de décimales requis peut varier d'un problème à l'autre.  Dans le doute, donnez plus de décimales à vos réponses.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Si plus d'une bonne réponse existe, écrivez vos réponses séparées par des virgules.</font><blockquote>par exemple, si vos réponses sont <nobr><code>-3/2, 4/3, 2pi, e^3, 5</code></nobr> écrivez les <nobr><code>-1.5, 1.3333333, 6.2831853, 20.0855369, 5</code></nobr></blockquote>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les fractions et certaines opérations ne sont pas permises.</font><blockquote>En général, les opérations qui sont restreintes sont l'addition <code>+</code>, soustraction <code>-</code>, multiplication <code>*</code>, division <code>/</code>, et l'exponentiation <code>^</code> (ou <code>**</code>).  Quand ces opération ne sont pas autorisées, c'est généralement parce que vous devez être capable d'effectuer les simplifications par vous-même.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines fonctions ne sont pas autorisées.</font> <blockquote>En général, les fonctions qui ne sont pas autorisées comprennent  racine carrée <code>sqrt( )</code>, valeur absolue <code>| |</code> (ou <code>abs( )</code>), ou les autres fonctions de type <code>sin( )</code>, <code>ln( )</code>, etc.  Quand ces fonctions ne sont pas autorisées, c'est généralement signe que vous devez être capable de simplifier la réponse vous même, sans avoir recours à une calculatrice.</blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $decimalHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (décimales)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpDecimals()';");
} else { return; }





#########################################
#  Equations

} elsif ($helptype =~ m/equation/i) {

if ($equationHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpEquations() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des équations</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des équations</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Les équations doivent comporter un symbole d'égalité et être en fonction des bonnes variables.:</font><blockquote><code>y = 5x+2</code> &nbsp; sera jugé faux si la réponse est &nbsp; <code>w = 5y+2</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemple d'équations valides qui sont équivalentes:</font><blockquote><code>32 = 5*x + 2</code> &nbsp; est équivalent à &nbsp; <code>30 = 5x</code> &nbsp; ou &nbsp; <code>x = 6</code></code><br /><code>y = (x-1)^2 + 3</code> &nbsp; est équivalent à &nbsp; <code>y - 3 = (x-1)^2</code><br /><code>x^2 + xy + y^2 = 13x</code> &nbsp; est équivalent à &nbsp; <code>y*(y+x) = 13x - x^2</code><br /></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Si aucune équation ne résout la question:</font><blockquote>Écrivez &nbsp; <code>NONE</code> &nbsp; ou &nbsp; <code>DNE</code> &nbsp; </blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemples de constantes utilisées dans les équations:</font><blockquote><code>pi</code>, <code>e = e^1</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Les fonctions peuvent être utilisées dans les équations mais ne s'appliquent pas sur un symbole d'égalité:</font><blockquote><code>sqrt(x) = sqrt(5)</code> &nbsp; est valide, mais &nbsp; <code>sqrt(x=5)</code> &nbsp; ne l'est pas</blockquote></li>")
OpenWindow.document.write("<li><a href='http://webwork.maa.org/wiki/Available_Functions' target='_new'>Lien vers une liste complète des fonctions (en anglais)</a><br /><br /></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $equationHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (équations)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpEquations()';");
} else { return; }





###############################################
#  Exponents

} elsif ($helptype =~ m/exponent/i) {

if ($exponentHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpExponents() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des exposants</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des exposants</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Vous pouvez utiliser <code>^</code> ou <code>**</code> pour effectuer une mise en exposant.</font><blockquote>par exemple, <code>x^2</code> et <code>x**2</code> sont équivalents, tout comme <code>e^(-x/2)</code> et <code>1/(e**(x/2))</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Les racines carrées ont des fonctions associées, mais les autres racines sont effectuées en utilisant des exposants fractionnaires.</font><blockquote>Par exemple, la racine carrée de 2 peut être entrée par <code>sqrt(2)</code>, <code>2^(1/2)</code>, ou <code>2**(1/2)</code>, mais la racine cubique de 2 doit être entrée en utilisant <code>2^(1/3)</code> ou <code>2**(1/3)</code>. Les parenthèses dans <code>2^(1/3)</code> sont importantes puisque <code>2^1/3</code> sera interprété comme <code>(2^1)/3 = 2/3</code>.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les exposants fractionnaires et certaines opérations ne sont pas permises.</font><blockquote>Normalement, les opérations qui ne sont pas permises incluent l'addition <code>+</code>, la soustraction <code>-</code>, la multiplication <code>*</code>,la division <code>/</code>.  Ces opérations ne sont pas permises en général dans les contextes où vous devez effectuer des simplifications sans l'aide d'une calculatrice.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines fonctions ne sont pas autorisées.</font> <blockquote>En général, les fonctions qui ne sont pas autorisées comprennent  racine carrée <code>sqrt( )</code>, valeur absolue <code>| |</code> (ou <code>abs( )</code>), ou les autres fonctions de type <code>sin( )</code>, <code>ln( )</code>, etc.  Quand ces fonctions ne sont pas autorisées, c'est généralement signe que vous devez être capable de simplifier la réponse vous même, sans avoir recours à une calculatrice.</blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $exponentHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (exposants)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpExponents()';");
} else { return; }






#######################################
#  Formulas

} elsif ($helptype =~ m/formula/i) {

#  my $local1UseBaseTenLogHelp = Context()->flags->get("useBaseTenLog");
 # my $local2UseBaseTenLogHelp = Context()->flags->get("useBaseTenLog");
  my $globalUseBaseTenLogHelp = 1;

  #if ($local1UseBaseTenLogHelp == 1 || $local2UseBaseTenLogHelp == 1 || $globalUseBaseTenLogHelp == 1) {
   if ($globalUseBaseTenLogHelp == 1) {
      $useBaseTenLogHelpString = "<li><font color='#222255'>Entrer des logarithmes:</font> <blockquote>Dans cette question, utilisez <code>ln(x)</code> pour le logarithme naturel et <code>log(x), logten(x)</code> ou <code>log10(x)</code> pour le logarithme en base 10.  Entrer le logarithme en base b par <code>ln(x)/ln(b)</code></blockquote><br /></li>";
  } else {
      $useBaseTenLogHelpString = "<li><font color='#222255'>Entrer des logarithmes:</font> <blockquote><font color='#ff0000'><b>Attention:</b></font> Dans cette question, utilisez <code>ln(x)</code> ou <code>log(x)</code> pour le logarithme naturel, et <code>logten(x)</code> ou <code>log10(x)</code> pour le logarithme en base 10.  Entrer le logarithme en base b par <code>ln(x)/ln(b)</code></blockquote><br /></li>";
  }

if ($formulaHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpFormulas() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des formules</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des formules</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><a href='http://webwork.maa.org/wiki/Available_Functions' target='_new'>Lien vers une liste complète des fonctions (en anglais)</a><br /><br /></li>")
OpenWindow.document.write("<li><font color='#222255'>Les formules doivent être exprimées en fonction des bonnes variables:</font><blockquote>Par exemple, une fonction du temps &nbsp; <code>t</code> &nbsp; devra s'écrire &nbsp; <code>-16t^2 + 12</code>, alors que &nbsp; <code>-16x^2 + 12</code> &nbsp; sera considéré comme fautif. </blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemple de formulations valides:</font><blockquote><code>5*sin((pi*x)/2)</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>5 sin(pi x/2)</code><br /><code>e^(-x)</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>e**(-x)</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>1/(e^x)</code><br /><code>abs(5y)</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>|5y|</code><br /><code>sqrt(9 - z^2)</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>(9 - z^2)^(1/2)</code><br /><code>24</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>4!</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>4 * 3 * 2 * 1</code><br /><code>pi</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>4 arctan(1)</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>4 atan(1)</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>4 tan^(-1)(1)</code><br /></blockquote></li>")
OpenWindow.document.write("$useBaseTenLogHelpString")
OpenWindow.document.write("<li><font color='#222255'>Exemples de constantes utilisées dans les formules:</font><blockquote><code>pi</code>, <code>e = e^1</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemples d'opérations utilisées dans les formules:</font><blockquote>Addition <code>+</code>, soustraction <code>-</code>, multiplication <code>*</code>, division <code>/</code>, exponentiation <code>^</code> (ou <code>**</code>), factorielle <code>!</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemples de fonctions utilisées dans les formules:</font><blockquote><code>sqrt(x) = x^(1/2)</code>, <code>abs(x) = | x |</code><br /><code>2^x, e^x, ln(x), log10(x)</code> <br /><code>sin(x), cos(x), tan(x), csc(x), sec(x), cot(x)</code><br /><code>arcsin(x) = asin(x) = sin^(-1)(x)</code><br /> <code>arccos(x) = acos(x) = cos^(-1)(x)</code><br /><code>arctan(x) = atan(x) = tan^(-1)(x)</code><br /></blockquote>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les formules doivent être simplifiées:</font><blockquote>For , &nbsp; <code>6x + 5 - 2x</code> &nbsp; pourrait être simplifiée par &nbsp; <code>4x + 5</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines opérations ne sont pas permises.</font><blockquote>Normalement, les opérations qui ne sont pas permises incluent l'addition <code>+</code>, la soustraction <code>-</code>, la multiplication <code>*</code>,la division <code>/</code> et l'exponentiation <code>^</code> (ou <code>**</code>).  Ces opérations ne sont pas permises en général dans les contextes où vous devez effectuer des simplifications sans l'aide d'une calculatrice.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines fonctions ne sont pas autorisées.</font> <blockquote>En général, les fonctions qui ne sont pas autorisées comprennent  racine carrée <code>sqrt( )</code>, valeur absolue <code>| |</code> (ou <code>abs( )</code>), ou les autres fonctions de type <code>sin( )</code>, <code>ln( )</code>, etc.  Quand ces fonctions ne sont pas autorisées, c'est généralement signe que vous devez être capable de simplifier la réponse vous même, sans avoir recours à une calculatrice.</blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $formulaHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (formules)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpFormulas()';");
} else { return; }



#########################################
#  Fractions

} elsif ($helptype =~ m/fraction/i) {

if ($fractionHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpFractions() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des fractions</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des fractions</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Exemples de fractions de la forme a / b pour des nombres non-décimaux a et b qui n'ont pas de facteurs communs:</font><blockquote><code>5/2, -1/3, pi/3, 4, sqrt(2)/2</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemples de fractions qui peuvent être simplifiées:</font><blockquote><code>15/6, (3-4)/3, 2*pi/6, (16/2)/2</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les décimales ne sont pas autorisées:</font><blockquote>Autorisées: &nbsp;&nbsp; <code>5/2, -1/3, pi/3, 4, sqrt(2)/2, 2^(1/2)</code><br />Non-autorisées: &nbsp;&nbsp; <code>2.5, -0.33333, 3.14159/3, 0.707106/2, 2^(0.5)</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, une fraction avec une partie entière est requise:</font><blockquote>Entrez <code>1 2/3</code> (pour 1 et 2/3) avec un espace entre le 1 et le 2 plutôt que <code>5/3</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, vous devez transformer un entier en fraction:</font><blockquote>Entrez <code>4/1</code> plutôt que <code>4</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Si plus d'une réponse sont correctes, entrez vos réponses en les séparant par des virgules.</font><blockquote>Par exemple, si vos réponses sont <nobr><code>-3/2, 4/3, 2pi, e^3, 5</code></nobr> entrez<nobr> <code>-3/2, 4/3, 2*pi, e^3, 5</code></nobr></blockquote>")
OpenWindow.document.write("<li><font color='#222255'>S'il n'y a pas de solution:</font><blockquote>Entrez &nbsp; <code>NONE</code> &nbsp; ou &nbsp; <code>DNE</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines opérations ne sont pas permises.</font><blockquote>Normalement, les opérations qui ne sont pas permises incluent l'addition <code>+</code>, la soustraction <code>-</code>, la multiplication <code>*</code>,la division <code>/</code> et l'exponentiation <code>^</code> (ou <code>**</code>).  Ces opérations ne sont pas permises en général dans les contextes où vous devez effectuer des simplifications sans l'aide d'une calculatrice.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines fonctions ne sont pas autorisées.</font> <blockquote>En général, les fonctions qui ne sont pas autorisées comprennent  racine carrée <code>sqrt( )</code>, valeur absolue <code>| |</code> (ou <code>abs( )</code>), ou les autres fonctions de type <code>sin( )</code>, <code>ln( )</code>, etc.  Quand ces fonctions ne sont pas autorisées, c'est généralement signe que vous devez être capable de simplifier la réponse vous même, sans avoir recours à une calculatrice.</blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

$fractionHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (fractions)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpFractions()';");
} else { return; }







###########################################
#  Inequalities

} elsif ($helptype =~ m/inequalit/i) {

if ($inequalitiesHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpInequalities() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des inégalités</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des inégalités</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Types d'opérateurs:</font><blockquote><table border='0' cellspacing='2'><tr><td><code>&lt;</code></td><td>&nbsp;&nbsp;&nbsp; inférieur à</td></tr><tr><td><code>&lt;=</code> &nbsp; ou &nbsp; <code>=&lt;</code></td><td>&nbsp;&nbsp;&nbsp; inférieur ou égal à</td></tr><tr><td><code>=</code></td><td>&nbsp;&nbsp;&nbsp; égal</td></tr><tr><td><code>!=</code></td><td>&nbsp;&nbsp;&nbsp; différent de </td></tr><tr><td><code>&gt;</code></td><td>&nbsp;&nbsp;&nbsp; plus grand que</td></tr><tr><td><code>&gt;=</code> &nbsp; ou &nbsp; <code>=&gt;</code></td><td>&nbsp;&nbsp;&nbsp; plus grand ou égal à</td></tr></table></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Symboles spéciaux:</font><blockquote><code>infinity</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>inf</code> &nbsp;&nbsp;signifie l'infini positif<br /><code>-infinity</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>-inf</code> &nbsp;&nbsp;signifie l'infini négatif<br /><code>R</code> &nbsp;&nbsp;signifie l'ensemble des réels<br /><code>R</code> &nbsp;&nbsp;est équivalent à&nbsp;&nbsp; <code>-inf < x < inf</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>(-inf,inf)</code><br /><code>{2,4,5}</code> &nbsp;&nbsp;l'utilisation d'accolades dénote un ensemble fini<br /> <code>NONE</code> &nbsp;&nbsp;ou une paire d'accolades&nbsp;&nbsp; <code>{}</code> &nbsp;&nbsp;représente l'ensemble vide<br /><code>U</code> &nbsp;&nbsp;représente l'union d'ensembles</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Entrez vos réponses en utilisant les inégalités ou la notation en intervalles:</font><blockquote><table border='1' cellspacing='0' cellpadding='5'><tr><td>Notation inégalité</td><td><font color='#FF0000'>* </font>Notation intervalles</td><td>Remarque</td></tr><tr><td><code>x&LT;2</code></td><td><code>(-infinity,2)</code></td>    <td>Utilisez les parenthèses<nobr><code>(</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>)</code></nobr> aux extrémités infinies</td></tr><tr><td><code>x&GT;2</code></td><td><code>(2,infinity)</code></td><td>&nbsp;</td></tr><tr><td><code>x&LT;=2</code></td><td><code>(-infinity,2]</code></td><td>&nbsp;</td></tr><tr><td><code>x&GT;=2</code></td><td><code>[2,infinity)</code></td><td>&nbsp;</td></tr><tr><td><code>0&LT;x&LT;=2</code></td><td><code>(0,2]</code></td><td>&nbsp;</td></tr><tr><td><nobr><code>0&LT;x et x&LT;2</code></nobr></td><td><code>(0,2)</code></td>    <td><code>et</code> &nbsp;&nbsp;est spécial</td></tr><tr><td><nobr><code>x&LT;0 ou x&GT;2</code></nobr></td><td><code>(-inf,0)U(2,inf)</code></td>    <td><code>ou</code> &nbsp;&nbsp;est spécial<br /><code>U</code> &nbsp;&nbsp;signifie l'union</td></tr><tr><td><nobr><code>x=0 ou x=2</code></nobr></td><td><code>{0,2}</code></td>   <td>les ensembles finis sont notés avec des accolades&nbsp;&nbsp; <code>{a,b,c}</code></td></tr><tr><td><nobr><code>x<3 ou x>3</code></nobr></td><td><code>(-inf,3)U(3,inf)</code><br /><code>x != 3</code><br /><code>R-{3}</code></td><td>la soustraction d'ensemble est autorisée</td></tr></table><br /><font color='#FF0000'>* Certaines questions exigent les réponses sous la forme d'inégalités</font></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Trucs pour entrer des inégalité ou des intervalles:</font><blockquote>Si un intervalle inclut une extremité, utilisez le crochet: <nobr><code>[</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>]</code></nobr><br /><br />Si un intervalle exclut l'extremité, utilisez la parenthèse: <nobr><code>(</code> &nbsp;&nbsp;ou&nbsp;&nbsp; <code>)</code></nobr><br /><br />Utilisez les accolades pour exprimer les ensembles finis et les virgules pour séparer les éléments de l'ensemble: <nobr><code>{ -3, pi, 2/5, 0.75 }</code></nobr><br /><br />Les ensembles doivent être exprimés sous leur forme la plus simple sans inclure de chevauchement.  Par exemple,&nbsp;&nbsp; <code>[2,4]U[3,5]</code> &nbsp;&nbsp;n'est pas équivalent à&nbsp;&nbsp; <code>[2,5]</code></br /><br />Si vous devez écrire l'image d'une fonction <code>y = f(x)</code>, votre inégalité devra être écrite en terme de la variable <code>y</code></blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $inequalitiesHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (inégalités)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpInequalities()';");
} else { return; }



#######################################
#  Intervals

} elsif ($helptype =~ m/interval/i) {

if ($intervalHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpIntervals() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des intervalles</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des intervalles</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Points extrêmaux des intervalles:</font> Si un point extrêmal est inclus, utilisez <code>[</code> ou<code>]</code>.  S'il n'est pas inclus, utilisez plutôt <code>(</code> ou <code>)</code>.  Par exemple, l'intervalle de -3 à 7 qui comprend 7 mais pas -3 est exprimé <code>(-3,7]</code>.  <br /> <br /></li>")
OpenWindow.document.write("<li><font color='#222255'>Intervalle ayant des bornes infinies:</font> Pour écrire les infinis, utilisez <code>Inf</code> pour <font size='+2'>&#8734;</font> (infinity) ou <code>-Inf</code> pour <font size='+2'>-&#8734;</font> (-Infinity).  Par exemple, pour exprimer l'intervalle contenant tous les point plus grand ou égaux à 6, écrivez <code>[6,Inf)</code>.<br /><br /></li>")
OpenWindow.document.write("<li><font color='#222255'>Unions d'intervalles:</font> Si un ensemble inclut plus d'un intervalle, ils peuvent être rejoint en utilisant le symbole d'union U. Par exemple, l'ensemble contenant les points de (-3,7] et ceux de [-8,-5) est exprimé <code>[-8,-5)U(-3,7]</code>.  WeBWorK ne vas <b>pas</b> interpréter <code>[2,4]U[3,5]</code> comme équivalent à <code>[2,5]</code>, sauf lorsqu'un problème l'exgige.  Les ensembles doivent être exprimés sous la notation d'intervalle la plus simple, sans chevauchement. <br /> <br /></li>")
OpenWindow.document.write("<li><font color='#222255'>Intervalle vide:</font> Lorsque la réponse est l'ensemble vide, vous pouvez l'exprimer à l'aide de deux accolades: <code> { }</code> <br /> <br /></li>")
OpenWindow.document.write("<li><font color='#222255'>Symboles spéciaux:</font> Vous pouvez utiliser <code>R</code> pour représenter l'ensemble des nombres réels.  Cette notation est équivalente à <code>(-Inf, Inf)</code>.  <br /> <br /></li>")
OpenWindow.document.write("<li><font color='#222255'>Notation ensembliste: </font> Vous pouvez utiliser la soustraction d'ensembles. Par exemple, pour décrire l'ensemble des réels sauf 3, vous pouvez utiliser <code>R-{3}</code> ou <code>(-Inf, 3)U(3,Inf)</code>. De manière similaire, <code>[1,10)-{3,4}</code> est équivalent à <code>[1,3)U(3,4)U(4,10)</code>.  <br /> <br /></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $intervalHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (intervalles)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpIntervals()';");
} else { return; }







##############################################
#  Limits

} elsif ($helptype =~ m/limit/i) {

if ($limitsHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpLimits() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des limites</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des limites</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Limites dont la valeur est réelle:</font><blockquote>Par exemple, lim<sub>x &rarr; &infin;</sub> arctan(x) = &pi;/2, est entrée &nbsp; <code>pi/2</code> </blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Limite dont la valeur est infinie:</font><blockquote>Entrez &nbsp; <code>infinity</code>, &nbsp; <code>inf</code>, &nbsp; <code>-infinity</code>, &nbsp; <code>-inf</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Limite qui n'existent pas:</font><blockquote>Entrez &nbsp; <code>DNE</code> &nbsp; ou &nbsp; <code>NONE</code> &nbsp;</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Limites dont la valeur est une fonction:</font><blockquote>Entrez la fonction en utilisant la syntaxe appropriée, par exemple:<br /><code>sqrt(x) = x^(1/2)</code>, <code>abs(x) = | x |</code><br /><code>2^x, e^x, ln(x), log10(x)</code> <br /><code>sin(x), cos(x), tan(x), csc(x), sec(x), cot(x)</code><br /><code>arcsin(x) = asin(x) = sin^(-1)(x)</code><br /> <code>arccos(x) = acos(x) = cos^(-1)(x)</code><br /><code>arctan(x) = atan(x) = tan^(-1)(x)</code><br /></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les réponses doivent être simplifiées:</font><blockquote>Par exemple, &nbsp; <code>6x+5-2x+7</code> &nbsp; doit être simplifié en; <code>4x+12</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines opérations ne sont pas permises.</font><blockquote>Normalement, les opérations qui ne sont pas permises incluent l'addition <code>+</code>, la soustraction <code>-</code>, la multiplication <code>*</code>,la division <code>/</code> et l'exponentiation <code>^</code> (ou <code>**</code>).  Ces opérations ne sont pas permises en général dans les contextes où vous devez effectuer des simplifications sans l'aide d'une calculatrice.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines fonctions ne sont pas autorisées.</font> <blockquote>En général, les fonctions qui ne sont pas autorisées comprennent  racine carrée <code>sqrt( )</code>, valeur absolue <code>| |</code> (ou <code>abs( )</code>), ou les autres fonctions de type <code>sin( )</code>, <code>ln( )</code>, etc.  Quand ces fonctions ne sont pas autorisées, c'est généralement signe que vous devez être capable de simplifier la réponse vous même, sans avoir recours à une calculatrice.</blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $limitsHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (limites)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpLimits()';");
} else { return; }








###############################################
#  Logarithms

} elsif ($helptype =~ m/log/i) {

#  my $local1UseBaseTenLogHelp = Context()->flags->get("useBaseTenLog");
#  my $local2UseBaseTenLogHelp = Context()->flags->get("useBaseTenLog");
  my $globalUseBaseTenLogHelp = 1;

    #if ($local1UseBaseTenLogHelp == 1 || $local2UseBaseTenLogHelp == 1 || $globalUseBaseTenLogHelp == 1) {
  if ($globalUseBaseTenLogHelp == 1) {
      $naturalLogHelpString = "<li><font color='#222255'>Entrer un logarithme naturel:</font> Dans cette question, utilisez <code>ln(x)</code><br /><br /></li>";
      $basetenLogHelpString = "<li><font color='#222255'>Entrer un logarithme en base 10:</font> Dans cette question, utilisez <code>log(x)</code>, <code>log10(x)</code>, ou <code>logten(x)</code>.<br /><br /></li>";
  } else {
      $naturalLogHelpString = "<li><font color='#FF0000'><b>Attention:</b></font> Dans cette question <b><code>log(x)</code></b> est équivalent à <b><code>ln(x)</code></b><br /><br /></li><li><font color='#222255'>Enter un logarithme naturel:</font> Dans cette question, utilisez <code>ln(x)</code> ou <code>log(x)</code><br /><br /></li>";
      $basetenLogHelpString = "<li><font color='#222255'>Entrer un loggarithme en base 10:</font> Dans cette question, utilisez <code>log10(x)</code> ou <code>logten(x)</code>.<br /><br /></li>";
  }

if ($logarithmsHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpLogarithms() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos de logarithme</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos de logarithme</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("$naturalLogHelpString")
OpenWindow.document.write("$basetenLogHelpString")
OpenWindow.document.write("<li><font color='#222255'>Entrer un logarithme en base b:</font>  &nbsp; <code>ln(x)/ln(b)</code> &nbsp; ou &nbsp; <code>log(x)/log(b)</code><blockquote>WeBWorK ne reconnait pas les logarithmes dans les autres bases.  Vous devez donc utiliser la formule de changement de base afin d'exprimer votre réponse.  Par exemple, pour entrer le log en base 2 de x, écrivez <br /><br /><code>ln(x)/ln(2)</code> &nbsp;&nbsp; ou &nbsp;&nbsp; <code>log(x)/log(2)</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Utilisez les parentheses autour des arguments des logarithmes:</font><blockquote><code>ln(2x+8)</code> &nbsp; et &nbsp; <code>ln2x+8 = ln(2)*x+8</code> &nbsp; sont très différents.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les logarithmes doivent être simplifiés ou développés:</font><blockquote>Par exemple, la réponse souhaitée pourrait être &nbsp; <code>ln(6) + ln(x)</code> &nbsp; ou &nbsp; <code>ln(6x)</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines opérations ne sont pas permises.</font><blockquote>Normalement, les opérations qui ne sont pas permises incluent l'addition <code>+</code>, la soustraction <code>-</code>, la multiplication <code>*</code>,la division <code>/</code> et l'exponentiation <code>^</code> (ou <code>**</code>).  Ces opérations ne sont pas permises en général dans les contextes où vous devez effectuer des simplifications sans l'aide d'une calculatrice.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines fonctions ne sont pas autorisées.</font> <blockquote>En général, les fonctions qui ne sont pas autorisées comprennent  racine carrée <code>sqrt( )</code>, valeur absolue <code>| |</code> (ou <code>abs( )</code>), ou les autres fonctions de type <code>sin( )</code>, <code>ln( )</code>, etc.  Quand ces fonctions ne sont pas autorisées, c'est généralement signe que vous devez être capable de simplifier la réponse vous même, sans avoir recours à une calculatrice.</blockquote></li>")
OpenWindow.document.write("<li><a href='http://webwork.maa.org/wiki/Available_Functions' target='_new'>Lien vers une liste complète des fonctions (en anglais)</a><br /><br /></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
sself.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $logarithmsHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (logarithmes)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpLogarithms()';");
} else { return; }









##########################################
#  Numbers

} elsif ($helptype =~ m/number/i) {

if ($numberHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpNumbers() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des nombres</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des nombres</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Exemple de nombres (réels):</font><blockquote><code>4, 5/2, -1/3, pi/3, e^3, 3.1415926535, sqrt(2) = 2^(1/2), ln(2), sin(2pi/3)</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Si plus d'une réponse est possible, séparez les avec des virgules.</font><blockquote>Par exemple, entrez &nbsp; <nobr><code>-1.5, 4/3, 2pi, e^3, 5</code></nobr><br />N'utilisez pas les virgules dans les grands nombres: entrez &nbsp; <code>4321</code> &nbsp; (et non &nbsp; <code>4,321</code>)</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>S'il n'existe aucune solution:</font><blockquote>Entrez &nbsp; <code>NONE</code> &nbsp; ou &nbsp; <code>DNE</code> &nbsp;</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Si votre réponse est décimale, donnez au moins 5 décimales.</font><blockquote>En général, si votre réponse est juste à 5 décimales près, elle sera évaluée comme correcte.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, les fractions et certaines opérations ne sont pas permises.</font><blockquote>Normalement, les opérations qui ne sont pas permises incluent l'addition <code>+</code>, la soustraction <code>-</code>, la multiplication <code>*</code>,la division <code>/</code> et l'exponentiation <code>^</code> (ou <code>**</code>).  Ces opérations ne sont pas permises en général dans les contextes où vous devez effectuer des simplifications sans l'aide d'une calculatrice.</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Parfois, certaines fonctions ne sont pas autorisées.</font> <blockquote>En général, les fonctions qui ne sont pas autorisées comprennent  racine carrée <code>sqrt( )</code>, valeur absolue <code>| |</code> (ou <code>abs( )</code>), ou les autres fonctions de type <code>sin( )</code>, <code>ln( )</code>, etc.  Quand ces fonctions ne sont pas autorisées, c'est généralement signe que vous devez être capable de simplifier la réponse vous même, sans avoir recours à une calculatrice.</blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $numberHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (nombres)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpNumbers()';");
} else { return; }






#######################################
#  Points

} elsif ($helptype =~ m/point/i) {

if ($pointsHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpPoints() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des points</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des points</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Un point est exprimé à l'aide de parenthèses et de virgules:</font><blockquote><code>(4.5, 3/7)</code> &nbsp; est un point valide en 2 dimensions<br /><code>(pi,e,2)</code> &nbsp; est un point valide en 3 dimensions </blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Si votre réponse comporte plusieurs points:</font><blockquote>Entrez votre réponse en séparant chaque point par une virgule, par exemple: &nbsp;&nbsp;<code>(4,3), (5,10)</code> </blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>S'il n'y a pas de solutions:</font><blockquote>Entrez &nbsp; <code>NONE</code> &nbsp; ou &nbsp; <code>DNE</code> &nbsp;</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemples de constantes utilisées dans les points:</font><blockquote><code>pi</code>, <code>e = e^1</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Les fonctions peuvent être utilisées dans l'expression de chaque coordonnée d'un point, mais ne s'appliquent pas directement sur un point.:</font><blockquote><code>(sqrt(2),sqrt(5))</code> &nbsp; est valide, mais &nbsp; <code>(sqrt(2,5))</code> &nbsp; ne l'est pas</blockquote></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $pointsHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (points)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpPoints()';");
} else { return; }









####################################
#  Units

} elsif ($helptype =~ m/unit/i) {

if ($unitsHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpUnits() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Abbréviations pour les unités</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Abbréviations pour les unités</h2></center>")
OpenWindow.document.write("<ul><li>Certains problèmes de WeBWorK demandent une réponse comportant des unités. Voici une liste des principales unités et l'abbréviation qui doit être utilisée dans les réponses. Dans certains problèmes, vous serez appelé à combiner les unités (e.g, la vitesse peut être en <code>m/s</code> pour mètres/seconde).</li></ul><br /><br /><center><table border='1' cellpadding='4' cellspacing='0'><tr><th>Unité</th><th>Abbréviation</th></tr><tr><td colspan='2' align='center'><b>Temps</b></td></tr><tr><td> Secondes  </td><td align='center'>  s</td></tr><tr><td> Minutes  </td><td align='center'>  min</td></tr><tr><td> Heures  </td><td align='center'>  hr</td></tr><tr><td> Jour  </td><td align='center'>  day</td></tr><tr><td> An  </td><td align='center'>  year</td></tr><tr><td> Millisecondes  </td><td align='center'>  ms</td></tr><tr><td colspan='2' align='center'><b>Distance</b></td></tr><tr><td> Pied  </td><td align='center'>  ft</td></tr><tr><td> Pouces  </td><td align='center'>  in</td></tr><tr><td> Miles  </td><td align='center'>  mi</td></tr><tr><td> Mètres  </td><td align='center'>  m</td></tr><tr><td> Centimètres  </td><td align='center'>  cm</td></tr><tr><td> Millimètres  </td><td align='center'>  mm</td></tr><tr><td> Kilomètres  </td><td align='center'>  km</td></tr><tr><td> Angstroms  </td><td align='center'>  A</td></tr><tr><td> Année lumière  </td><td align='center'>  light-year</td></tr><tr><td colspan='2' align='center'><b>Masse</b></td></tr><tr><td> Grammes  </td><td align='center'>  g</td></tr><tr><td> Kilogrammes  </td><td align='center'>  kg</td></tr><tr><td> Slugs  </td><td align='center'>  slug</td></tr><tr><td colspan='2' align='center'><b>Volume</b></td></tr><tr><td> Litres  </td><td align='center'>  L</td></tr><tr><td> Centimètres cube  </td><td align='center'>  cc</td></tr><tr><td> Millilitres  </td><td align='center'>  ml</td></tr><tr><td colspan='2' align='center'><b>Force</b></td></tr><tr><td> Newtons  </td><td align='center'>  N</td></tr><tr><td> Dynes  </td><td align='center'>  dyne</td></tr><tr><td> Livres  </td><td align='center'>  lb</td></tr><tr><td> Tonnes  </td><td align='center'>  ton</td></tr><tr><td colspan='2' align='center'><b>Travail/Energie</b></td></tr><tr><td> Joules  </td><td align='center'>  J</td></tr><tr><td> kilo Joule  </td><td align='center'>  kJ</td></tr><tr><td> ergs  </td><td align='center'>  erg</td></tr><tr><td> Pied-livre  </td><td align='center'>  lbf</td></tr><tr><td> calories  </td><td align='center'>  cal</td></tr><tr><td> kilo calories  </td><td align='center'>  kcal</td></tr><tr><td> électron volts  </td><td align='center'>  eV</td></tr><tr><td> kilo Watt heures  </td><td align='center'>  kWh</td></tr><tr><td colspan='2' align='center'><b>Autres</b></td></tr><tr><td> Ampères  </td><td align='center'>  amp</td></tr><tr><td> Moles  </td><td align='center'>  mol</td></tr><tr><td> Degrées Celcius  </td><td align='center'>  degC</td></tr><tr><td> Degrés Fahrenheit  </td><td align='center'>  degF</td></tr><tr><td> Degrés Kelvin  </td><td align='center'>  degK</td></tr><tr><td> degrés (angles) </td><td align='center'>  deg</td></tr><tr><td>radians </td><td align='center'>  rad</td></tr></table></center><br /><br />")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $unitsHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (unités)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpUnits()';");
} else { return; }







########################################
#  Vectors

} elsif ($helptype =~ m/vector/i) {

if ($vectorsHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpVectors() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Aide à propos des vecteurs</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Aide à propos des vecteurs</h2></center>")
OpenWindow.document.write("<ul>")
OpenWindow.document.write("<li><font color='#222255'>Les vecteurs prédéfinis i, j, et k</font><blockquote><code>i</code> &nbsp; est défini par &nbsp; <code>&lt;1,0,0&gt;</code> &nbsp;&nbsp; ou &nbsp;&nbsp; <code>&lt;1,0&gt;</code><br /><code>j</code> &nbsp; est défini par &nbsp; <code>&lt;0,1,0&gt;</code> &nbsp;&nbsp; ou &nbsp;&nbsp; <code>&lt;1,0&gt;</code><br /><code>k</code> &nbsp; est défini par &nbsp; <code>&lt;0,0,1&gt;</code><br /></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Un vecteur est précisé par des chevrons et des virgules, ou en additionnant des multiples de   i, j, et k:</font><blockquote><code>&lt;4.5, 3/7&gt;</code> &nbsp; et &nbsp; <code>4.5i + 3/7j</code> &nbsp; sont des vecteurs en 2 dimensions<br /><code>&lt;pi,e,2&gt;</code> &nbsp; et &nbsp; <code>pi i + e j + 2 k</code> &nbsp; sont des vecteurs en 3 dimensions </blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Si votre réponse comporte plus d'un vecteur:</font><blockquote>Entrez votre réponse en séparant chaque vecteur par une virgule. Par exemple: &nbsp;&nbsp;<code>&lt;4,3&gt;, &lt;5,10&gt;</code> </blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>S'il n'y a pas de solutions:</font><blockquote>Enter &nbsp; <code>NONE</code> &nbsp; ou &nbsp; <code>DNE</code> &nbsp;</blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Exemples de constantes utilisées dans les vecteurs:</font><blockquote><code>pi</code>, <code>e = e^1</code></blockquote></li>")
OpenWindow.document.write("<li><font color='#222255'>Les fonctions peuvent être utilisées dans chaque coordonnée d'un vecteur, mais ne s'appliquent pas sur les chevrons ou les virgules:</font><blockquote><code>&lt;sqrt(2),sqrt(5)&gt;</code> &nbsp; est valide, mais &nbsp; <code>&lt;sqrt(2,5)&gt;</code> &nbsp; ne l'est pas<br /> <br /></blockquote></li>")
OpenWindow.document.write("<li><a href='http://webwork.maa.org/wiki/Available_Functions' target='_new'>Lien vers une liste complète des fonctions (en anglais)</a><br /><br /></li>")
OpenWindow.document.write("</ul>")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $vectorsHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (vecteurs)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpVectors()';");
} else { return; }








#########################################
#  Syntax (the catch all)

#} elsif ($helptype =~ m/syntax/i) {
} else {

if ($syntaxHelpExists != 1) {

HEADER_TEXT(<<END_HEADER_TEXT);
<script type="text/javascript">
<!--
function openhelpSyntax() {
OpenWindow=window.open("","answer_format_help","width=550,height=550,status=0,toolbar=0,location=0,menubar=0,directories=0,resizeable=1,scrollbars=1");
OpenWindow.document.write("<title>Syntaxe pour entrer des réponses</title>")
OpenWindow.document.write("<body bgcolor='#ffffff'>")
OpenWindow.document.write("<center><h2>Syntax for Entering Answers</h2></center>")
OpenWindow.document.write("<ul><li> + Addition</li><li> - Soustraction</li><li> * La multiplication peut aussi être exprimée par un espace ou une juxtaposition, par exemple 2x, 2 x ou 2*x, ou encore 2(3+4).</li><li> / Division</li><li> ^ ou ** Vous pouvez utiliser ^ ou ** pour la mise en exposant, par exemple 3^2 ou 3**2</li><li> Parenthèses: ( ) - Vous pouvez aussi utiliser les crochets, [ ], et les accolades, { }, pour regrouper, par exemple [1+2]/[3(4+5)]</li></ul><a name='Syntax_for_entering_expressions'></a><h3>Syntaxe pour entrer des expressions</h4><ul><li> Soyez prdent lorsque vous entrez des expressions comme vous le feriez avec une calculatrice.</li><li> <b>Utilisez le bouton 'Visualiser' pour visualiser l'interprétation de la réponse que vous avez entré. Par exemple, pour voir la différence entre 1+2/3*4 et [1+2]/[3*4] cliquez sur le bouton 'Visualiser'.</b></li><li> Parfois, le fais d'utiliser le symbole * pour la mutiplication rend la lecture de la réponse plus facile. Par exemple (1+2)*(3+4) et (1+2)(3+4) sont valides tout comme 3*4 et 3&nbsp;4 (3 espace 4, pas 34) mais l'utilsation de * rend les choses plus claires.</li><li> L'utilisation des ( et ) permet également une meilleure lisibilité. Vous pouvez également utiliser les [ et ] et les { et }.</li><li> N'entrez pas 2/4+5 (qui vaut 5.5) quand vous voulez en réalité 2/(4+5) (qui vaut 2/9).</li><li> N'écrivez pas 2/3*4 (qui vaut 8/3) quand vous voulez 2/(3*4) (qui vaut 2/12).</li><li> Une bonne habitude est d'écrire les grosses fractions à l'aide des crochets, par exemple [1+2+3+4]/[5+6+7+8].</li><li> Attention lorsque vous entrez des fonctions. Il est préférable d'utiliser des parenthèses quand vous entrez des fonctions. Écrivez sin(t) plutôt que sint ou sin t même si WeBWorK est assez intelligent pour <b>normalement</b> interpréter correctement sin t ou même sint. Par exemple, sin 2t est interprété comme  sin(2)t, i.e. (sin(2))*t.</li><li> Vous pouvez écrire sin^2(t) pour représenter (sin(t))^2(le carré de sin de t).</li><li> Est-ce que -5^2 est positif ou négatif? C'est négatif. En effet, l'opération multiplication (le carré) est effectuée avant que le signe négatif soit appliqué.  Utilisez (-5)^2 si vous voulez effectuer le carré de -5.</li><li> Dans le doute, utilisez des parenthèses!!!&nbsp;:-)</li><li> Les règles complètes pour la priorité des opération  sont<ul><li> Les multiplications et divisions sont effectuées de gauche à droite: 2/3*4 = (2/3)*4 = 8/3.</li><li> Les addition et soustractions sont effectuées de gauche à droite: 1-2+3 = (1-2)+3 = 2.</li><li> Les exposants sont effectués de droite à gauche: 2^3^4 = 2^(3^4) = 2^81 = un gros nombre.</li></ul></li><li> <b>Utilisez le bouton 'Visualiser' pour voir exactement à quoi ressemble votre réponse.</b></li></ul><a name='Mathematical_Constants_Available_In_WeBWorK'></a><h4>&nbsp;&nbsp;Constantes mathématiques disponibles dans WeBWorK</h4><ul><li> pi donne 3.14159265358979, e.g. cos(pi) est -1</li><li> e donne 2.71828182845905, e.g. ln(e*2) est 1 + ln(2)</li></ul><a name='Scientific_Notation_Available_In_WeBWorK'></a><h4>&nbsp;&nbsp;Notation scientifique disponible dans WeBWorK</h4><ul><li> 2.1E2 est équivalent à  210</li><li> 2.1E-2 est équivalent à .021</li></ul><a name='Mathematical_Functions_Available_In_WeBWorK'></a><h4>&nbsp;&nbsp;Fonctions math.matiques disponibles dans WeBWorK</h4><p>Veuillez noter que certaines fonctions peuvent être désactivées dans un problème particulier parce que le concepteur du problème veut que vous répondiez en utilisant une autre méthode que de remplacer dans une fonction.</p><ul><li> abs( ) La valeur absolue</li><li> cos( ) Remarque: cos( ) utilise des angles en radians</li><li> sin( ) Remarque: sin( ) utilise des angles en radians</li><li> tan( ) Remarque: tan( ) utilise des angles en radians</li><li> sec( ) Remarque: sec( ) utilise des angles en radians</li><li> cot( ) Remarque: cot( ) utilise des angles en radians</li><li> csc( ) Remarque: csc( ) utilise des angles en radians</li><li> exp( ) est la même fonction que e^x</li><li> log( ) est normalement le logarithme naturel</li><li> ln( ) Le logarithmen naturel</li><li> logten( ) Le logarithme en base 10</li><li> arcsin( )</li><li> asin( ) ou sin^-1() Un autre nom pour la fonction arcsin</li><li> arccos( )</li><li> acos( ) ou cos^-1() un autre nom pour la fonction arccos</li><li> arctan( )</li><li> atan( ) ou tan^-1() un autre nom pour la fonction arctan</li><li> arccot( )</li><li> acot( ) ou cot^-1() un autre nom pour la fonction arccot</li><li> arcsec( )</li><li> asec( ) ou sec^-1() un autre nom pour la fonction arcsec</li><li> arccsc( )</li><li> acsc( ) ou csc^-1() un autre nom pour la fonction arccsc</li><li> sinh( )</li><li> cosh( )</li><li> tanh( )</li><li> sech( )</li><li> csch( )</li><li> coth( )</li><li> arcsinh( )</li><li> asinh( ) ou sinh^-1() un autre nom pour la fonction arcsinh</li><li> arccosh( )</li><li> acosh( ) ou cosh^-1()un autre nom pour la fonction arccosh</li><li> arctanh( )</li><li> atanh( ) ou tanh^-1()un autre nom pour la fonction arctanh</li><li> arcsech( )</li><li> asech( ) ou sech^-1()un autre nom pour la fonction arcsech</li><li> arccsch( )</li><li> acsch( ) ou csch^-1() un autre nom pour la fonction arccsch</li><li> arccoth( )</li><li> acoth( ) ou coth^-1() un autre nom pour la fonction arccoth</li><li> sqrt( )</li><li> n!  (n factoriel -- définie pour les entiers non négatifs)</li><li>Ces fonctions peuvent ne pas être définie pour tous les problèmes.<ul><li> sgn( ) La fonction signe qui vaut -1, 0, ou 1</li><li> step(x) La fonction escalier (0 si x &lt; 0, et 1 si x &ge; 0)</li><li> fact(n) La fonction factorielle n! (définie pour les entiers non-négatifs)</li><li> P(n,k) = n*(n-1)*(n-2)...(n-k+1) Le nombre d'arrangements de k éléments choisis dans un ensemble de n éléments</li><li> C(n,k) = 'n dans k' le nombre de combinaisons de k éléments choisis dans un ensemble de n éléments</li></ul></li></ul>pour plus d'information (en anglais):<a href='http://webwork.maa.org/wiki/Available_Functions' target='_new'>http://webwork.maa.org/wiki/Available_Functions</a><br /><br />")
OpenWindow.document.write("</body>")
OpenWindow.document.write("</html>")
OpenWindow.document.close()
self.name="main"
if (window.focus) {OpenWindow.focus()}
return false;
}
-->
</script>
END_HEADER_TEXT

our $syntaxHelpExists = 1;
}

if (!$customstring) { $helpstring = "Aide (syntaxe)"; } else { $helpstring = $customstring; }

if ($main::displayMode ne "TeX") { 
    return htmlLink( "#", "$helpstring","onClick='openhelpSyntax()';");
} else { return; }

}






} # end AnswerFormatHelp

1;
