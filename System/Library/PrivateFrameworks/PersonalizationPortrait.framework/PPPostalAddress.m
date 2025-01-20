@interface PPPostalAddress
+ (BOOL)supportsSecureCoding;
+ (id)normalizeAddressString:(id)a3;
+ (id)postalAddressWithThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 subAdministrativeArea:(id)a8 postalCode:(id)a9 country:(id)a10;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPostalAddress:(id)a3;
- (NSString)administrativeArea;
- (NSString)country;
- (NSString)locality;
- (NSString)postalCode;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (NSString)subThoroughfare;
- (NSString)thoroughfare;
- (PPPostalAddress)initWithCoder:(id)a3;
- (PPPostalAddress)initWithContactsPostalAddress:(id)a3;
- (PPPostalAddress)initWithFoundInAppsPostalAddress:(id)a3;
- (PPPostalAddress)initWithThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 subAdministrativeArea:(id)a8 postalCode:(id)a9 country:(id)a10;
- (id)_countryStringWithCountry:(id)a3 isoCode:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)singleLineNormalizedAddressString;
- (id)toCNPostalAddress;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPPostalAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_subThoroughfare, 0);
  objc_storeStrong((id *)&self->_thoroughfare, 0);
}

- (NSString)country
{
  return self->_country;
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (NSString)subLocality
{
  return self->_subLocality;
}

- (NSString)locality
{
  return self->_locality;
}

- (NSString)subThoroughfare
{
  return self->_subThoroughfare;
}

- (NSString)thoroughfare
{
  return self->_thoroughfare;
}

- (id)_countryStringWithCountry:(id)a3 isoCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    v7 = (void *)MEMORY[0x192F97350]();
    id v8 = [v6 uppercaseString];
  }
  else
  {
    id v8 = v5;
    if ((unint64_t)[v8 length] <= 3)
    {
      v9 = (void *)MEMORY[0x192F97350]();
      uint64_t v10 = [v8 uppercaseString];

      id v8 = (id)v10;
    }
  }

  return v8;
}

- (BOOL)isEqualToPostalAddress:(id)a3
{
  v4 = (id *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_28;
  }
  thoroughfare = self->_thoroughfare;
  v7 = (NSString *)v4[1];
  if (thoroughfare == v7)
  {
  }
  else
  {
    id v8 = v7;
    v9 = thoroughfare;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_28;
    }
  }
  subThoroughfare = self->_subThoroughfare;
  v12 = (NSString *)v5[2];
  if (subThoroughfare == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = subThoroughfare;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_28;
    }
  }
  locality = self->_locality;
  v17 = (NSString *)v5[3];
  if (locality == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = locality;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_28;
    }
  }
  subLocality = self->_subLocality;
  v22 = (NSString *)v5[4];
  if (subLocality == v22)
  {
  }
  else
  {
    v23 = v22;
    v24 = subLocality;
    char v25 = [(NSString *)v24 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_28;
    }
  }
  administrativeArea = self->_administrativeArea;
  v27 = (NSString *)v5[5];
  if (administrativeArea == v27)
  {
  }
  else
  {
    v28 = v27;
    v29 = administrativeArea;
    char v30 = [(NSString *)v29 isEqual:v28];

    if ((v30 & 1) == 0) {
      goto LABEL_28;
    }
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  v32 = (NSString *)v5[6];
  if (subAdministrativeArea == v32)
  {
  }
  else
  {
    v33 = v32;
    v34 = subAdministrativeArea;
    char v35 = [(NSString *)v34 isEqual:v33];

    if ((v35 & 1) == 0) {
      goto LABEL_28;
    }
  }
  postalCode = self->_postalCode;
  v37 = (NSString *)v5[7];
  if (postalCode == v37)
  {
  }
  else
  {
    v38 = v37;
    v39 = postalCode;
    char v40 = [(NSString *)v39 isEqual:v38];

    if ((v40 & 1) == 0)
    {
LABEL_28:
      char v41 = 0;
      goto LABEL_29;
    }
  }
  v43 = self->_country;
  v44 = v43;
  if (v43 == v5[8]) {
    char v41 = 1;
  }
  else {
    char v41 = -[NSString isEqual:](v43, "isEqual:");
  }

LABEL_29:
  return v41;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPPostalAddress *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPPostalAddress *)self isEqualToPostalAddress:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  BOOL v6 = (void *)[(NSString *)self->_thoroughfare copyWithZone:a3];
  v7 = (void *)[(NSString *)self->_subThoroughfare copyWithZone:a3];
  id v8 = (void *)[(NSString *)self->_locality copyWithZone:a3];
  v9 = (void *)[(NSString *)self->_subLocality copyWithZone:a3];
  char v10 = (void *)[(NSString *)self->_administrativeArea copyWithZone:a3];
  v11 = (void *)[(NSString *)self->_subAdministrativeArea copyWithZone:a3];
  v12 = (void *)[(NSString *)self->_postalCode copyWithZone:a3];
  v13 = (void *)[(NSString *)self->_country copyWithZone:a3];
  v14 = [v5 postalAddressWithThoroughfare:v6 subThoroughfare:v7 locality:v8 subLocality:v9 administrativeArea:v10 subAdministrativeArea:v11 postalCode:v12 country:v13];

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_thoroughfare hash];
  NSUInteger v4 = [(NSString *)self->_subThoroughfare hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_locality hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_subLocality hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_administrativeArea hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_subAdministrativeArea hash] - v7 + 32 * v7;
  NSUInteger v9 = [(NSString *)self->_postalCode hash] - v8 + 32 * v8;
  return [(NSString *)self->_country hash] - v9 + 32 * v9;
}

- (void)encodeWithCoder:(id)a3
{
  thoroughfare = self->_thoroughfare;
  id v5 = a3;
  [v5 encodeObject:thoroughfare forKey:@"tho"];
  [v5 encodeObject:self->_subThoroughfare forKey:@"sth"];
  [v5 encodeObject:self->_locality forKey:@"loc"];
  [v5 encodeObject:self->_subLocality forKey:@"slo"];
  [v5 encodeObject:self->_administrativeArea forKey:@"aaa"];
  [v5 encodeObject:self->_subAdministrativeArea forKey:@"saa"];
  [v5 encodeObject:self->_postalCode forKey:@"pco"];
  [v5 encodeObject:self->_country forKey:@"cou"];
}

- (PPPostalAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  NSUInteger v6 = [v4 decodeObjectOfClass:v5 forKey:@"tho"];
  NSUInteger v7 = [v4 decodeObjectOfClass:v5 forKey:@"sth"];
  NSUInteger v8 = [v4 decodeObjectOfClass:v5 forKey:@"loc"];
  NSUInteger v9 = [v4 decodeObjectOfClass:v5 forKey:@"slo"];
  char v10 = [v4 decodeObjectOfClass:v5 forKey:@"aaa"];
  v11 = [v4 decodeObjectOfClass:v5 forKey:@"saa"];
  v12 = [v4 decodeObjectOfClass:v5 forKey:@"pco"];
  v13 = [v4 decodeObjectOfClass:v5 forKey:@"cou"];

  v14 = [(PPPostalAddress *)self initWithThoroughfare:v6 subThoroughfare:v7 locality:v8 subLocality:v9 administrativeArea:v10 subAdministrativeArea:v11 postalCode:v12 country:v13];
  return v14;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPPostalAddress t:'%@' st:'%@' l:'%@' sl:'%@' a:'%@' sa:'%@' pc:'%@' c:'%@'>", self->_thoroughfare, self->_subThoroughfare, self->_locality, self->_subLocality, self->_administrativeArea, self->_subAdministrativeArea, self->_postalCode, self->_country];
  return v2;
}

- (id)singleLineNormalizedAddressString
{
  v2 = [(PPPostalAddress *)self toCNPostalAddress];
  uint64_t v3 = [MEMORY[0x1E4F1BA88] singleLineStringFromPostalAddress:v2 addCountryName:0];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = +[PPPostalAddress normalizeAddressString:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)toCNPostalAddress
{
  uint64_t v3 = objc_opt_new();
  if ([(NSString *)self->_thoroughfare length] && [(NSString *)self->_subThoroughfare length])
  {
    id v4 = (void *)[[NSString alloc] initWithFormat:@"%@\n%@", self->_thoroughfare, self->_subThoroughfare];
    [v3 setStreet:v4];
  }
  else
  {
    [v3 setStreet:self->_thoroughfare];
  }
  [v3 setCity:self->_locality];
  [v3 setSubLocality:self->_subLocality];
  [v3 setState:self->_administrativeArea];
  [v3 setSubAdministrativeArea:self->_subAdministrativeArea];
  NSUInteger v5 = [(NSString *)self->_country length];
  country = self->_country;
  if (v5 == 2) {
    [v3 setISOCountryCode:country];
  }
  else {
    [v3 setCountry:country];
  }
  [v3 setPostalCode:self->_postalCode];
  return v3;
}

- (PPPostalAddress)initWithFoundInAppsPostalAddress:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PPPostalAddress.m", 69, @"Invalid parameter not satisfying: %@", @"[postalAddress respondsToSelector:@selector(components)]" object file lineNumber description];
  }
  NSUInteger v6 = [v5 performSelector:sel_components];
  NSUInteger v7 = [v6 street];
  NSUInteger v8 = (void *)MEMORY[0x192F97350]();
  NSUInteger v9 = [v6 street];
  char v10 = [v9 componentsSeparatedByString:@"\n"];

  char v25 = v5;
  if ([v10 count] == 2)
  {
    v11 = [v10 objectAtIndexedSubscript:0];

    v24 = [v10 objectAtIndexedSubscript:1];
  }
  else
  {
    v24 = 0;
    v11 = v7;
  }
  v12 = [v6 country];
  v13 = [v6 isoCountryCode];
  v14 = [(PPPostalAddress *)self _countryStringWithCountry:v12 isoCode:v13];

  char v15 = [v6 city];
  v16 = [v6 subLocality];
  v17 = [v6 state];
  [v6 subAdministrativeArea];
  v19 = v18 = self;
  char v20 = [v6 postalCode];
  v21 = [(PPPostalAddress *)v18 initWithThoroughfare:v11 subThoroughfare:v24 locality:v15 subLocality:v16 administrativeArea:v17 subAdministrativeArea:v19 postalCode:v20 country:v14];

  return v21;
}

- (PPPostalAddress)initWithContactsPostalAddress:(id)a3
{
  id v4 = a3;
  id v5 = [v4 street];
  NSUInteger v6 = (void *)MEMORY[0x192F97350]();
  NSUInteger v7 = [v4 street];
  NSUInteger v8 = [v7 componentsSeparatedByString:@"\n"];

  v23 = v8;
  if ([v8 count] == 2)
  {
    uint64_t v9 = [v8 objectAtIndexedSubscript:0];

    char v10 = [v8 objectAtIndexedSubscript:1];
    id v5 = (void *)v9;
  }
  else
  {
    char v10 = 0;
  }
  v11 = [v4 country];
  v12 = [v4 ISOCountryCode];
  v13 = [(PPPostalAddress *)self _countryStringWithCountry:v11 isoCode:v12];

  v14 = [v4 city];
  char v15 = [v4 subLocality];
  v16 = [v4 state];
  v17 = [v4 subAdministrativeArea];
  uint64_t v18 = [v4 postalCode];
  v19 = self;
  char v20 = (void *)v18;
  v21 = [(PPPostalAddress *)v19 initWithThoroughfare:v5 subThoroughfare:v10 locality:v14 subLocality:v15 administrativeArea:v16 subAdministrativeArea:v17 postalCode:v18 country:v13];

  return v21;
}

- (PPPostalAddress)initWithThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 subAdministrativeArea:(id)a8 postalCode:(id)a9 country:(id)a10
{
  id v27 = a3;
  id v26 = a4;
  id v25 = a5;
  id v24 = a6;
  id v23 = a7;
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)PPPostalAddress;
  uint64_t v18 = [(PPPostalAddress *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_thoroughfare, a3);
    objc_storeStrong((id *)&v19->_subThoroughfare, a4);
    objc_storeStrong((id *)&v19->_locality, a5);
    objc_storeStrong((id *)&v19->_subLocality, a6);
    objc_storeStrong((id *)&v19->_administrativeArea, a7);
    objc_storeStrong((id *)&v19->_subAdministrativeArea, a8);
    objc_storeStrong((id *)&v19->_postalCode, a9);
    objc_storeStrong((id *)&v19->_country, a10);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)normalizeAddressString:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x192F97350]();
  id v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  NSUInteger v6 = [v3 componentsSeparatedByCharactersInSet:v5];
  NSUInteger v7 = (void *)[v6 mutableCopy];

  NSUInteger v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_8685];
  [v7 filterUsingPredicate:v8];

  uint64_t v9 = objc_msgSend(v7, "_pas_componentsJoinedByString:", @" ");
  char v10 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  v11 = [v9 componentsSeparatedByCharactersInSet:v10];
  v12 = objc_msgSend(v11, "_pas_componentsJoinedByString:", &stru_1EDA56F70);

  return v12;
}

BOOL __42__PPPostalAddress_normalizeAddressString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

+ (id)postalAddressWithThoroughfare:(id)a3 subThoroughfare:(id)a4 locality:(id)a5 subLocality:(id)a6 administrativeArea:(id)a7 subAdministrativeArea:(id)a8 postalCode:(id)a9 country:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (void *)[objc_alloc((Class)a1) initWithThoroughfare:v24 subThoroughfare:v23 locality:v22 subLocality:v21 administrativeArea:v20 subAdministrativeArea:v19 postalCode:v18 country:v17];

  return v25;
}

@end