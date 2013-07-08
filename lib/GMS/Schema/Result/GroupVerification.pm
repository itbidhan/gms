use utf8;
package GMS::Schema::Result::GroupVerification;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

GMS::Schema::Result::GroupVerification

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<group_verifications>

=cut

__PACKAGE__->table("group_verifications");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'group_verifications_id_seq'

=head2 group_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 verification_type

  data_type: 'enum'
  extra: {custom_type_name => "group_verifications_verification_type_type",list => ["web_url","web_token","git","dns","freetext"]}
  is_nullable: 1

=head2 verification_data

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "group_verifications_id_seq",
  },
  "group_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "verification_type",
  {
    data_type => "enum",
    extra => {
      custom_type_name => "group_verifications_verification_type_type",
      list => ["web_url", "web_token", "git", "dns", "freetext"],
    },
    is_nullable => 1,
  },
  "verification_data",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 group

Type: belongs_to

Related object: L<GMS::Schema::Result::Group>

=cut

__PACKAGE__->belongs_to(
  "group",
  "GMS::Schema::Result::Group",
  { id => "group_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "RESTRICT",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-07-07 14:42:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vLCOmsJ4ClPru6Wm5Tsc7w
# You can replace this text with custom code or comments, and it will be preserved on regeneration

1;
