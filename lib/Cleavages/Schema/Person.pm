package Cleavages::Schema::Person;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("person");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => "nextval('person_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "username",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "password",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "email",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 0,
    size => undef,
  },
  "first_name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "last_name",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("person_email_key", ["email"]);
__PACKAGE__->add_unique_constraint("person_pkey", ["id"]);
__PACKAGE__->add_unique_constraint("person_username_key", ["username"]);
__PACKAGE__->has_many(
  "files",
  "Cleavages::Schema::File",
  { "foreign.uploaded_by" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-02-06 22:22:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RqY3clJPA/jYG24qk7AcCA

sub upload_count {
    my $record = shift;

    return $record->files->count;
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
