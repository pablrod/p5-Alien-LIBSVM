package Alien::LIBSVM;

use strict;
use warnings;

use parent 'Alien::Base';

sub Inline {
	return unless $_[-1] eq 'C'; # Inline's error message is good
	my $self = __PACKAGE__->new;
	+{
		LIBS => $self->libs,
		INC => $self->cflags,
		AUTO_INCLUDE => q|

#include "svm.h"

|
	};
}

sub svm_train_path {
  my ($self) = @_;
  File::Spec->catfile( $self->dist_dir , 'bin', 'svm-train' );
}

sub svm_predict_path {
  my ($self) = @_;
  File::Spec->catfile( $self->dist_dir , 'bin', 'svm-predict' );
}

sub svm_scale_path {
  my ($self) = @_;
  File::Spec->catfile( $self->dist_dir , 'bin', 'svm-scale' );
}

1;
# ABSTRACT: Alien package for the LIBSVM library

=pod

=head1 Inline support

This module supports L<Inline's with functionality|Inline/"Playing 'with' Others">.

=head1 SEE ALSO

L<LIBSVM|http://www.csie.ntu.edu.tw/~cjlin/libsvm/>

=cut
