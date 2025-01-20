@interface _SFPBAirport
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)city;
- (NSString)code;
- (NSString)country;
- (NSString)countryCode;
- (NSString)district;
- (NSString)name;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (_SFPBAirport)initWithDictionary:(id)a3;
- (_SFPBAirport)initWithFacade:(id)a3;
- (_SFPBAirport)initWithJSON:(id)a3;
- (_SFPBLatLng)location;
- (_SFPBTimeZone)timezone;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setCity:(id)a3;
- (void)setCode:(id)a3;
- (void)setCountry:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDistrict:(id)a3;
- (void)setLocation:(id)a3;
- (void)setName:(id)a3;
- (void)setPostalCode:(id)a3;
- (void)setState:(id)a3;
- (void)setStreet:(id)a3;
- (void)setTimezone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAirport

- (_SFPBAirport)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBAirport *)self init];
  if (v5)
  {
    v6 = [v4 code];

    if (v6)
    {
      v7 = [v4 code];
      [(_SFPBAirport *)v5 setCode:v7];
    }
    v8 = [v4 timezone];

    if (v8)
    {
      v9 = [_SFPBTimeZone alloc];
      v10 = [v4 timezone];
      v11 = [(_SFPBTimeZone *)v9 initWithNSTimeZone:v10];
      [(_SFPBAirport *)v5 setTimezone:v11];
    }
    v12 = [v4 location];

    if (v12)
    {
      v13 = [_SFPBLatLng alloc];
      v14 = [v4 location];
      v15 = [(_SFPBLatLng *)v13 initWithFacade:v14];
      [(_SFPBAirport *)v5 setLocation:v15];
    }
    v16 = [v4 city];

    if (v16)
    {
      v17 = [v4 city];
      [(_SFPBAirport *)v5 setCity:v17];
    }
    v18 = [v4 street];

    if (v18)
    {
      v19 = [v4 street];
      [(_SFPBAirport *)v5 setStreet:v19];
    }
    v20 = [v4 district];

    if (v20)
    {
      v21 = [v4 district];
      [(_SFPBAirport *)v5 setDistrict:v21];
    }
    v22 = [v4 state];

    if (v22)
    {
      v23 = [v4 state];
      [(_SFPBAirport *)v5 setState:v23];
    }
    v24 = [v4 postalCode];

    if (v24)
    {
      v25 = [v4 postalCode];
      [(_SFPBAirport *)v5 setPostalCode:v25];
    }
    v26 = [v4 countryCode];

    if (v26)
    {
      v27 = [v4 countryCode];
      [(_SFPBAirport *)v5 setCountryCode:v27];
    }
    v28 = [v4 country];

    if (v28)
    {
      v29 = [v4 country];
      [(_SFPBAirport *)v5 setCountry:v29];
    }
    v30 = [v4 name];

    if (v30)
    {
      v31 = [v4 name];
      [(_SFPBAirport *)v5 setName:v31];
    }
    v32 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_district, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_code, 0);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)district
{
  return self->_district;
}

- (NSString)street
{
  return self->_street;
}

- (NSString)city
{
  return self->_city;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (_SFPBTimeZone)timezone
{
  return self->_timezone;
}

- (NSString)code
{
  return self->_code;
}

- (_SFPBAirport)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_SFPBAirport;
  v5 = [(_SFPBAirport *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"code"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBAirport *)v5 setCode:v7];
    }
    v33 = v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"timezone"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBTimeZone alloc] initWithDictionary:v8];
      [(_SFPBAirport *)v5 setTimezone:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"location"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBLatLng alloc] initWithDictionary:v10];
      [(_SFPBAirport *)v5 setLocation:v11];
    }
    v31 = (void *)v10;
    v12 = [v4 objectForKeyedSubscript:@"city"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(_SFPBAirport *)v5 setCity:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"street"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBAirport *)v5 setStreet:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"district"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBAirport *)v5 setDistrict:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)[v18 copy];
      [(_SFPBAirport *)v5 setState:v19];
    }
    v20 = objc_msgSend(v4, "objectForKeyedSubscript:", @"postalCode", v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (void *)[v20 copy];
      [(_SFPBAirport *)v5 setPostalCode:v21];
    }
    v32 = (void *)v8;
    v22 = [v4 objectForKeyedSubscript:@"countryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(_SFPBAirport *)v5 setCountryCode:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"country"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = (void *)[v24 copy];
      [(_SFPBAirport *)v5 setCountry:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBAirport *)v5 setName:v27];
    }
    v28 = v5;
  }
  return v5;
}

- (_SFPBAirport)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAirport *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAirport *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_city)
  {
    id v4 = [(_SFPBAirport *)self city];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"city"];
  }
  if (self->_code)
  {
    v6 = [(_SFPBAirport *)self code];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"code"];
  }
  if (self->_country)
  {
    uint64_t v8 = [(_SFPBAirport *)self country];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"country"];
  }
  if (self->_countryCode)
  {
    uint64_t v10 = [(_SFPBAirport *)self countryCode];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"countryCode"];
  }
  if (self->_district)
  {
    v12 = [(_SFPBAirport *)self district];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"district"];
  }
  if (self->_location)
  {
    v14 = [(_SFPBAirport *)self location];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"location"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"location"];
    }
  }
  if (self->_name)
  {
    v17 = [(_SFPBAirport *)self name];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"name"];
  }
  if (self->_postalCode)
  {
    v19 = [(_SFPBAirport *)self postalCode];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"postalCode"];
  }
  if (self->_state)
  {
    v21 = [(_SFPBAirport *)self state];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"state"];
  }
  if (self->_street)
  {
    v23 = [(_SFPBAirport *)self street];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"street"];
  }
  if (self->_timezone)
  {
    v25 = [(_SFPBAirport *)self timezone];
    v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"timezone"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"timezone"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_code hash];
  unint64_t v4 = [(_SFPBTimeZone *)self->_timezone hash] ^ v3;
  unint64_t v5 = [(_SFPBLatLng *)self->_location hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_city hash];
  NSUInteger v7 = [(NSString *)self->_street hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_district hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_state hash];
  NSUInteger v10 = [(NSString *)self->_postalCode hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_countryCode hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_country hash];
  return v9 ^ v12 ^ [(NSString *)self->_name hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  unint64_t v5 = [(_SFPBAirport *)self code];
  NSUInteger v6 = [v4 code];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v7 = [(_SFPBAirport *)self code];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBAirport *)self code];
    NSUInteger v10 = [v4 code];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self timezone];
  NSUInteger v6 = [v4 timezone];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v12 = [(_SFPBAirport *)self timezone];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBAirport *)self timezone];
    v15 = [v4 timezone];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self location];
  NSUInteger v6 = [v4 location];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v17 = [(_SFPBAirport *)self location];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBAirport *)self location];
    v20 = [v4 location];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self city];
  NSUInteger v6 = [v4 city];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v22 = [(_SFPBAirport *)self city];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBAirport *)self city];
    v25 = [v4 city];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self street];
  NSUInteger v6 = [v4 street];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v27 = [(_SFPBAirport *)self street];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBAirport *)self street];
    v30 = [v4 street];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self district];
  NSUInteger v6 = [v4 district];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v32 = [(_SFPBAirport *)self district];
  if (v32)
  {
    v33 = (void *)v32;
    objc_super v34 = [(_SFPBAirport *)self district];
    v35 = [v4 district];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self state];
  NSUInteger v6 = [v4 state];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v37 = [(_SFPBAirport *)self state];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(_SFPBAirport *)self state];
    v40 = [v4 state];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self postalCode];
  NSUInteger v6 = [v4 postalCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v42 = [(_SFPBAirport *)self postalCode];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBAirport *)self postalCode];
    v45 = [v4 postalCode];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self countryCode];
  NSUInteger v6 = [v4 countryCode];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v47 = [(_SFPBAirport *)self countryCode];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_SFPBAirport *)self countryCode];
    v50 = [v4 countryCode];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self country];
  NSUInteger v6 = [v4 country];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_56;
  }
  uint64_t v52 = [(_SFPBAirport *)self country];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_SFPBAirport *)self country];
    v55 = [v4 country];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBAirport *)self name];
  NSUInteger v6 = [v4 name];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v57 = [(_SFPBAirport *)self name];
    if (!v57)
    {

LABEL_60:
      BOOL v62 = 1;
      goto LABEL_58;
    }
    v58 = (void *)v57;
    v59 = [(_SFPBAirport *)self name];
    v60 = [v4 name];
    char v61 = [v59 isEqual:v60];

    if (v61) {
      goto LABEL_60;
    }
  }
  else
  {
LABEL_56:
  }
LABEL_57:
  BOOL v62 = 0;
LABEL_58:

  return v62;
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  id v4 = [(_SFPBAirport *)self code];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  unint64_t v5 = [(_SFPBAirport *)self timezone];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v6 = [(_SFPBAirport *)self location];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBAirport *)self city];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v8 = [(_SFPBAirport *)self street];
  if (v8) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v9 = [(_SFPBAirport *)self district];
  if (v9) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v10 = [(_SFPBAirport *)self state];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBAirport *)self postalCode];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  uint64_t v12 = [(_SFPBAirport *)self countryCode];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  v13 = [(_SFPBAirport *)self country];
  if (v13) {
    PBDataWriterWriteStringField();
  }

  v14 = [(_SFPBAirport *)self name];
  if (v14) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAirportReadFrom(self, (uint64_t)a3);
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCountry:(id)a3
{
  self->_country = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCountryCode:(id)a3
{
  self->_countryCode = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPostalCode:(id)a3
{
  self->_postalCode = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setState:(id)a3
{
  self->_state = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDistrict:(id)a3
{
  self->_district = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setStreet:(id)a3
{
  self->_street = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setCity:(id)a3
{
  self->_city = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLocation:(id)a3
{
}

- (void)setTimezone:(id)a3
{
}

- (void)setCode:(id)a3
{
  self->_code = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end