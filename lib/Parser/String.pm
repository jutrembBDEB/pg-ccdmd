#########################################################################
#
#  Implements constant string values
#    (Used for things like INFINITY, and so on)
#
package Parser::String;
use strict; use vars qw(@ISA);
@ISA = qw(Parser::Item);

#
#  Mark the created word as infinity or negative infinity, and so on.
#
sub new {
  my $self = shift; my $class = ref($self) || $self;
  my $equation = shift;
  my ($value, $ref) = @_;
  my $def = $equation->{context}{strings}{$value};
  $value = $def->{alias}, $def = $equation->{context}{strings}{$value}
    if defined($def->{alias});
  my $str = bless {
    value => $value, type => $Value::Type{string}, isConstant => 1,
    def => $def, ref => $ref, equation => $equation,
  }, $class;
  $str->{isInfinite} = 1 if ($def->{infinite});
  $str->{isInfinity} = 1 if ($def->{infinite} && !$def->{negative});
  $str->{isNegativeInfinity} = 1 if ($def->{infinite} && $def->{negative});
  return $str;
}

#
#  Just return the value of the string
#
sub eval {
  my $self = shift;
  return $self->{value} unless $self->{isInfinite};
  my $I = Value::Infinity->new();
  $I = $I->neg if $self->{isNegativeInfinity};
  return $I;
}

#
#  Just return the value
#
sub string {
  my $self = shift;
  return $self->{def}{string} if defined($self->{def}{string});
  my $value = $self->eval;
  return $value unless Value::isValue($value);
  return $value->string($self->{equation});
}

#
#  Typeset the value in \rm
#
sub TeX {
  my $self = shift;
  return $self->{def}{TeX} if defined($self->{def}{TeX});
  my $value = $self->eval;
  return '{\rm '.$value.'}' unless Value::isValue($value);
  return $value->TeX($self->{equation});
}

#
#  Put the value in quotes
#
sub perl {
  my $self = shift;
  return $self->{def}{perl} if defined($self->{def}{perl});
  my $value = $self->eval;
  return "'".$value."'" unless Value::isValue($value);
  return $value->perl;
}

#########################################################################

1;
