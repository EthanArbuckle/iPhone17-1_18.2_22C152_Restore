@interface PSTimeZoneTableCell
- (ALCity)city;
- (id)_contentString;
- (void)prepareForReuse;
- (void)setCity:(id)a3;
@end

@implementation PSTimeZoneTableCell

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PSTimeZoneTableCell;
  [(PSTimeZoneTableCell *)&v4 prepareForReuse];
  city = self->_city;
  self->_city = 0;
}

- (void)setCity:(id)a3
{
  p_city = &self->_city;
  objc_storeStrong((id *)&self->_city, a3);
  id v6 = a3;
  id v8 = [(ALCity *)*p_city displayNameIncludingCountry:1];

  v7 = [(PSTimeZoneTableCell *)self textLabel];
  [v7 setText:v8];
}

- (id)_contentString
{
  return (id)[(ALCity *)self->_city displayNameIncludingCountry:1 withFormat:@"%@\n%@"];
}

- (ALCity)city
{
  return self->_city;
}

- (void).cxx_destruct
{
}

@end