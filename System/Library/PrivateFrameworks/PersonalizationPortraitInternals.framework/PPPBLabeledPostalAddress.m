@interface PPPBLabeledPostalAddress
- (BOOL)hasCity;
- (BOOL)hasCountry;
- (BOOL)hasIsoCountryCode;
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
- (NSString)isoCountryCode;
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
- (void)setIsoCountryCode:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)setSubAdministrativeArea:(id)a3;
- (void)setSubLocality:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBLabeledPostalAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setCountry:(id)a3
{
}

- (NSString)country
{
  return self->_country;
}

- (void)setPostalCode:(id)a3
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setState:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setSubAdministrativeArea:(id)a3
{
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setCity:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setSubLocality:(id)a3
{
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (void)setStreet:(id)a3
{
}

- (NSString)street
{
  return self->_street;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[4]) {
    -[PPPBLabeledPostalAddress setLabel:](self, "setLabel:");
  }
  if (v4[7]) {
    -[PPPBLabeledPostalAddress setStreet:](self, "setStreet:");
  }
  if (v4[9]) {
    -[PPPBLabeledPostalAddress setSubLocality:](self, "setSubLocality:");
  }
  if (v4[1]) {
    -[PPPBLabeledPostalAddress setCity:](self, "setCity:");
  }
  if (v4[8]) {
    -[PPPBLabeledPostalAddress setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  }
  if (v4[6]) {
    -[PPPBLabeledPostalAddress setState:](self, "setState:");
  }
  if (v4[5]) {
    -[PPPBLabeledPostalAddress setPostalCode:](self, "setPostalCode:");
  }
  if (v4[2]) {
    -[PPPBLabeledPostalAddress setCountry:](self, "setCountry:");
  }
  if (v4[3]) {
    -[PPPBLabeledPostalAddress setIsoCountryCode:](self, "setIsoCountryCode:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  NSUInteger v4 = [(NSString *)self->_street hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_subLocality hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_city hash];
  NSUInteger v7 = [(NSString *)self->_subAdministrativeArea hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_state hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_postalCode hash];
  NSUInteger v10 = [(NSString *)self->_country hash];
  return v9 ^ v10 ^ [(NSString *)self->_isoCountryCode hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
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
    && ((subLocality = self->_subLocality, !((unint64_t)subLocality | v4[9]))
     || -[NSString isEqual:](subLocality, "isEqual:"))
    && ((city = self->_city, !((unint64_t)city | v4[1])) || -[NSString isEqual:](city, "isEqual:"))
    && ((subAdministrativeArea = self->_subAdministrativeArea, !((unint64_t)subAdministrativeArea | v4[8]))
     || -[NSString isEqual:](subAdministrativeArea, "isEqual:"))
    && ((state = self->_state, !((unint64_t)state | v4[6]))
     || -[NSString isEqual:](state, "isEqual:"))
    && ((postalCode = self->_postalCode, !((unint64_t)postalCode | v4[5]))
     || -[NSString isEqual:](postalCode, "isEqual:"))
    && ((country = self->_country, !((unint64_t)country | v4[2]))
     || -[NSString isEqual:](country, "isEqual:")))
  {
    isoCountryCode = self->_isoCountryCode;
    if ((unint64_t)isoCountryCode | v4[3]) {
      char v14 = -[NSString isEqual:](isoCountryCode, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
LABEL_20:
    char v14 = 0;
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  NSUInteger v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_street copyWithZone:a3];
  NSUInteger v9 = (void *)v5[7];
  v5[7] = v8;

  uint64_t v10 = [(NSString *)self->_subLocality copyWithZone:a3];
  v11 = (void *)v5[9];
  v5[9] = v10;

  uint64_t v12 = [(NSString *)self->_city copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  uint64_t v14 = [(NSString *)self->_subAdministrativeArea copyWithZone:a3];
  v15 = (void *)v5[8];
  v5[8] = v14;

  uint64_t v16 = [(NSString *)self->_state copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  uint64_t v18 = [(NSString *)self->_postalCode copyWithZone:a3];
  v19 = (void *)v5[5];
  v5[5] = v18;

  uint64_t v20 = [(NSString *)self->_country copyWithZone:a3];
  v21 = (void *)v5[2];
  v5[2] = v20;

  uint64_t v22 = [(NSString *)self->_isoCountryCode copyWithZone:a3];
  v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v5;
  }
  if (self->_street)
  {
    objc_msgSend(v5, "setStreet:");
    id v4 = v5;
  }
  if (self->_subLocality)
  {
    objc_msgSend(v5, "setSubLocality:");
    id v4 = v5;
  }
  if (self->_city)
  {
    objc_msgSend(v5, "setCity:");
    id v4 = v5;
  }
  if (self->_subAdministrativeArea)
  {
    objc_msgSend(v5, "setSubAdministrativeArea:");
    id v4 = v5;
  }
  if (self->_state)
  {
    objc_msgSend(v5, "setState:");
    id v4 = v5;
  }
  if (self->_postalCode)
  {
    objc_msgSend(v5, "setPostalCode:");
    id v4 = v5;
  }
  if (self->_country)
  {
    objc_msgSend(v5, "setCountry:");
    id v4 = v5;
  }
  if (self->_isoCountryCode)
  {
    objc_msgSend(v5, "setIsoCountryCode:");
    id v4 = v5;
  }
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
  if (self->_subLocality)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_subAdministrativeArea)
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
  if (self->_isoCountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBLabeledPostalAddressReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  street = self->_street;
  if (street) {
    [v4 setObject:street forKey:@"street"];
  }
  subLocality = self->_subLocality;
  if (subLocality) {
    [v4 setObject:subLocality forKey:@"subLocality"];
  }
  city = self->_city;
  if (city) {
    [v4 setObject:city forKey:@"city"];
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea) {
    [v4 setObject:subAdministrativeArea forKey:@"subAdministrativeArea"];
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
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v4 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBLabeledPostalAddress;
  id v4 = [(PPPBLabeledPostalAddress *)&v8 description];
  id v5 = [(PPPBLabeledPostalAddress *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (BOOL)hasCountry
{
  return self->_country != 0;
}

- (BOOL)hasPostalCode
{
  return self->_postalCode != 0;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (BOOL)hasCity
{
  return self->_city != 0;
}

- (BOOL)hasSubLocality
{
  return self->_subLocality != 0;
}

- (BOOL)hasStreet
{
  return self->_street != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

@end