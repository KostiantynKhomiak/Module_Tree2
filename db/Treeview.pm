package Treeview::db::Treeview;

use strict;
use parent qw(dbcore);
use Abills::Base qw(_bp);
#**********************************************************
=head2 new($db, $admin, \%conf) - Constructor for Treeview
  Returns:
    $self
=cut
#**********************************************************
sub new {
  my ($class, $db, $admin, $CONF) = @_;
  my $self = {
    db    => $db,
    admin => $admin,
    conf  => $CONF
  };
  bless($self, $class);
  return $self;
}
#**********************************************************
=head2 get_country() - Get info about country from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_country {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,name FROM tr_country;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 country_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub country_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('tr_country', $attr);
  return $self;
}
#**********************************************************
=head2 region_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub region_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('tr_region', $attr);
  return $self;
}
#**********************************************************
=head2 get_region() - Get info about region from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_region {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,name,country_id FROM tr_region;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 get_region_country() - Get info about region and country from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_region_country {
  my $self = shift;
  my ($attr) = @_;
  $self->query(
    "SELECT tr_region.id,
    tr_region.name,
    tr_country.name as country_name
    FROM  tr_region 
    LEFT JOIN tr_country ON tr_country.id = tr_region.country_id ;",
    undef, { COLS_NAME => 1 }
  );
  return $self->{list};
}
#**********************************************************
=head2 city_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub city_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('tr_city', $attr);
  return $self;
}
#**********************************************************
=head2 get_city() - Get info about city from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_city {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,name,region_id FROM tr_city;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 get_city_region_country() - Get info about city, region and country from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_city_region_country {
  my $self = shift;
  my ($attr) = @_;
  $self->query(
    "SELECT 
    tr_city.id,
    tr_city.name,
    tr_region.name as region_name,
    tr_country.name as country_name
    FROM  tr_city 
    LEFT JOIN tr_region ON tr_city.region_id=tr_region.id  
    LEFT JOIN tr_country ON tr_region.country_id=tr_country.id;",
    undef, { COLS_NAME => 1 }
  );
  return $self->{list};
}
#**********************************************************
=head2 district_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub district_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('tr_district', $attr);
  return $self;
}
#**********************************************************
=head2 get_district() - Get info about district from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_district {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,name,city_id FROM tr_district;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 get_district_city_region_country() - Get info about district, city, region and country from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_district_city_region_country {
  my $self = shift;
  my ($attr) = @_;
  $self->query(
    "SELECT 
    tr_district.id,
    tr_district.name,
    tr_city.name as city_name,
    tr_region.name as region_name,
    tr_country.name as country_name
    FROM  tr_district 
    LEFT JOIN tr_city ON tr_district.city_id=tr_city.id 
    LEFT JOIN tr_region ON tr_city.region_id=tr_region.id  
    LEFT JOIN tr_country ON tr_region.country_id=tr_country.id;",
    undef, { COLS_NAME => 1 }
  );
  return $self->{list};
}
#**********************************************************
=head2 street_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub street_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('tr_street', $attr);
  return $self;
}
#**********************************************************
=head2 get_street() - Get info about street from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_street {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,name,district_id FROM tr_street;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 get_street_district_city_region_country() - Get info about street, district, city, region and country from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_street_district_city_region_country {
  my $self = shift;
  my ($attr) = @_;
  $self->query(
    "SELECT 
    tr_street.id,
    tr_street.name as street_name,
    tr_district.name as district_name,
    tr_city.name as city_name,
    tr_region.name as region_name,
    tr_country.name as country_name
    FROM  tr_street 
    LEFT JOIN tr_district ON tr_street.district_id=tr_district.id  
    LEFT JOIN tr_city ON tr_district.city_id=tr_city.id 
    LEFT JOIN tr_region ON tr_city.region_id=tr_region.id  
    LEFT JOIN tr_country ON tr_region.country_id=tr_country.id;",
    undef, { COLS_NAME => 1 }
  );
  return $self->{list};
}
#**********************************************************
=head2 building_add() - Add info into DB

  Arguments:
     
  Returns:
    $self
=cut
#**********************************************************
sub building_add {
  my $self = shift;
  my ($attr) = @_;
  $self->query_add('tr_building', $attr);
  return $self;
}
#**********************************************************
=head2 get_building() - Get info about building from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_building {
  my $self = shift;
  my ($attr) = @_;
  $self->query("SELECT id,name,street_id FROM tr_building;", undef, { COLS_NAME => 1 });
  return $self->{list};
}
#**********************************************************
=head2 get_building_street_district_city_region_country() - Get info about building, street, district, city, region and country from DB

  Arguments:
     
  Returns:
    $self->{list}
=cut
#**********************************************************
sub get_building_street_district_city_region_country {
  my $self = shift;
  my ($attr) = @_;
  $self->query(
    "SELECT 
    tr_building.id,
    tr_building.name,
    tr_street.name as street_name ,
    tr_district.name as district_name,
    tr_city.name as city_name,
    tr_region.name as region_name,
    tr_country.name as country_name
    FROM  tr_building 
    LEFT JOIN tr_street ON tr_building.street_id=tr_street.id 
    LEFT JOIN tr_district ON tr_street.district_id=tr_district.id 
    LEFT JOIN tr_city ON tr_district.city_id=tr_city.id 
    LEFT JOIN tr_region ON tr_city.region_id=tr_region.id  
    LEFT JOIN tr_country ON tr_region.country_id=tr_country.id;",
    undef, { COLS_NAME => 1 }
  );
  return $self->{list};
}


1;