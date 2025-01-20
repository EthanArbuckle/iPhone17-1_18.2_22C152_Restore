@interface ABSPBPostalAddress
- (BOOL)hasCity;
- (BOOL)hasCountry;
- (BOOL)hasISOCountryCode;
- (BOOL)hasLabel;
- (BOOL)hasPostalCode;
- (BOOL)hasState;
- (BOOL)hasStreet;
- (BOOL)hasSubAdministrativeArea;
- (BOOL)hasSubLocality;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)city;
- (NSString)country;
- (NSString)iSOCountryCode;
- (NSString)label;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCity:(id)a3;
- (void)setCountry:(id)a3;
- (void)setISOCountryCode:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBPostalAddress

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasStreet
{
  return self->_street != 0;
}

- (BOOL)hasCity
{
  return self->_city != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (BOOL)hasPostalCode
{
  return self->_postalCode != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasISOCountryCode
{
  return self->_iSOCountryCode != 0;
}

- (BOOL)hasSubLocality
{
  return self->_subLocality != 0;
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBPostalAddress;
  v3 = [(ABSPBPostalAddress *)&v7 description];
  v4 = [(ABSPBPostalAddress *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  street = self->_street;
  if (street) {
    [v4 setObject:street forKey:@"street"];
  }
  city = self->_city;
  if (city) {
    [v4 setObject:city forKey:@"city"];
  }
  state = self->_state;
  if (state) {
    [v4 setObject:state forKey:@"state"];
  }
  postalCode = self->_postalCode;
  if (postalCode) {
    [v4 setObject:postalCode forKey:@"postalCode"];
  }
  country = self->_country;
  if (country) {
    [v4 setObject:country forKey:@"country"];
  }
  iSOCountryCode = self->_iSOCountryCode;
  if (iSOCountryCode) {
    [v4 setObject:iSOCountryCode forKey:@"ISOCountryCode"];
  }
  subLocality = self->_subLocality;
  if (subLocality) {
    [v4 setObject:subLocality forKey:@"subLocality"];
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea) {
    [v4 setObject:subAdministrativeArea forKey:@"subAdministrativeArea"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBPostalAddressReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_postalCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_iSOCountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subLocality)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subAdministrativeArea)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    [v4 setLabel:];
    id v4 = v5;
  }
  if (self->_street)
  {
    [v5 setStreet:];
    id v4 = v5;
  }
  if (self->_city)
  {
    [v5 setCity:];
    id v4 = v5;
  }
  if (self->_state)
  {
    [v5 setState:];
    id v4 = v5;
  }
  if (self->_postalCode)
  {
    [v5 setPostalCode:];
    id v4 = v5;
  }
  if (self->_country)
  {
    [v5 setCountry:];
    id v4 = v5;
  }
  if (self->_iSOCountryCode)
  {
    [v5 setISOCountryCode:];
    id v4 = v5;
  }
  if (self->_subLocality)
  {
    [v5 setSubLocality:];
    id v4 = v5;
  }
  if (self->_subAdministrativeArea)
  {
    [v5 setSubAdministrativeArea:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_label copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_street copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  id v10 = [(NSString *)self->_city copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(NSString *)self->_state copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  id v14 = [(NSString *)self->_postalCode copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(NSString *)self->_country copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  id v18 = [(NSString *)self->_iSOCountryCode copyWithZone:a3];
  v19 = (void *)v5[3];
  v5[3] = v18;

  id v20 = [(NSString *)self->_subLocality copyWithZone:a3];
  v21 = (void *)v5[9];
  v5[9] = v20;

  id v22 = [(NSString *)self->_subAdministrativeArea copyWithZone:a3];
  v23 = (void *)v5[8];
  v5[8] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  label = self->_label;
  if ((unint64_t)label | v4[4])
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (((street = self->_street, !((unint64_t)street | v4[7]))
     || -[NSString isEqual:](street, "isEqual:"))
    && ((city = self->_city, !((unint64_t)city | v4[1])) || -[NSString isEqual:](city, "isEqual:"))
    && ((state = self->_state, !((unint64_t)state | v4[6]))
     || -[NSString isEqual:](state, "isEqual:"))
    && ((postalCode = self->_postalCode, !((unint64_t)postalCode | v4[5]))
     || -[NSString isEqual:](postalCode, "isEqual:"))
    && ((country = self->_country, !((unint64_t)country | v4[2]))
     || -[NSString isEqual:](country, "isEqual:"))
    && ((iSOCountryCode = self->_iSOCountryCode, !((unint64_t)iSOCountryCode | v4[3]))
     || -[NSString isEqual:](iSOCountryCode, "isEqual:"))
    && ((subLocality = self->_subLocality, !((unint64_t)subLocality | v4[9]))
     || -[NSString isEqual:](subLocality, "isEqual:")))
  {
    subAdministrativeArea = self->_subAdministrativeArea;
    if ((unint64_t)subAdministrativeArea | v4[8]) {
      unsigned __int8 v14 = -[NSString isEqual:](subAdministrativeArea, "isEqual:");
    }
    else {
      unsigned __int8 v14 = 1;
    }
  }
  else
  {
LABEL_20:
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  unint64_t v4 = [(NSString *)self->_street hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_city hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_state hash];
  NSUInteger v7 = [(NSString *)self->_postalCode hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_country hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_iSOCountryCode hash];
  NSUInteger v10 = [(NSString *)self->_subLocality hash];
  return v9 ^ v10 ^ [(NSString *)self->_subAdministrativeArea hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[4]) {
    -[ABSPBPostalAddress setLabel:](self, "setLabel:");
  }
  if (v4[7]) {
    -[ABSPBPostalAddress setStreet:](self, "setStreet:");
  }
  if (v4[1]) {
    -[ABSPBPostalAddress setCity:](self, "setCity:");
  }
  if (v4[6]) {
    -[ABSPBPostalAddress setState:](self, "setState:");
  }
  if (v4[5]) {
    -[ABSPBPostalAddress setPostalCode:](self, "setPostalCode:");
  }
  if (v4[2]) {
    -[ABSPBPostalAddress setCountry:](self, "setCountry:");
  }
  if (v4[3]) {
    -[ABSPBPostalAddress setISOCountryCode:](self, "setISOCountryCode:");
  }
  if (v4[9]) {
    -[ABSPBPostalAddress setSubLocality:](self, "setSubLocality:");
  }
  if (v4[8]) {
    -[ABSPBPostalAddress setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  }
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)street
{
  return self->_street;
}

- (void)setStreet:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setCountry:(id)a3
{
}

- (NSString)iSOCountryCode
{
  return self->_iSOCountryCode;
}

- (void)setISOCountryCode:(id)a3
{
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setSubLocality:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_iSOCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);

  objc_storeStrong((id *)&self->_city, 0);
}

@end