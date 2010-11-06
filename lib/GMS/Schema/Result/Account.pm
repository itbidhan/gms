package GMS::Schema::Result::Account;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

GMS::Schema::Result::Account

=cut

__PACKAGE__->table("accounts");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'accounts_id_seq'

=head2 accountname

  data_type: 'varchar'
  is_nullable: 1
  size: 32

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "accounts_id_seq",
  },
  "accountname",
  { data_type => "varchar", is_nullable => 1, size => 32 },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 contact

Type: might_have

Related object: L<GMS::Schema::Result::Contact>

=cut

__PACKAGE__->might_have(
  "contact",
  "GMS::Schema::Result::Contact",
  { "foreign.account_id" => "self.id" },
  {},
);

=head2 user_roles

Type: has_many

Related object: L<GMS::Schema::Result::UserRole>

=cut

__PACKAGE__->has_many(
  "user_roles",
  "GMS::Schema::Result::UserRole",
  { "foreign.account_id" => "self.id" },
  {},
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2010-11-06 23:44:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MJ39LFnAAdEIfuiv6bv03w

# You can replace this text with custom content, and it will be preserved on regeneration

# Pseudo-relations not added by Schema::Loader
__PACKAGE__->many_to_many(roles => 'user_roles', 'role');

1;
