@interface MSDStoreInfo
- (BOOL)confirmStoreSelection;
- (BOOL)isHQ;
- (BOOL)isNearby;
- (CLLocation)storeLocation;
- (MSDStoreInfo)initWithDict:(id)a3;
- (NSString)appleID;
- (NSString)companyName;
- (NSString)confirmationCode;
- (NSString)fullAddress;
- (NSString)storeDescription;
- (NSString)storeName;
- (id)_buildFullAddress:(id)a3;
- (id)_buildStoreDescription:(id)a3;
- (id)description;
@end

@implementation MSDStoreInfo

- (MSDStoreInfo)initWithDict:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MSDStoreInfo;
  v5 = [(MSDStoreInfo *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"hq"];
    uint64_t v7 = [v4 objectForKey:@"confirm_store_selection"];
    v8 = [v4 objectForKey:@"confirmation_code"];
    v9 = [v4 objectForKey:@"apple_id"];
    v10 = [v4 objectForKey:@"store_name"];
    v11 = [v4 objectForKey:@"company_name"];
    v12 = [v4 objectForKey:@"latitude"];
    v13 = [v4 objectForKey:@"longitude"];
    uint64_t v14 = [v4 objectForKey:@"nearby"];
    v28 = (void *)v6;
    v15 = (void *)v6;
    v16 = (void *)v7;
    v17 = (void *)v14;
    v5->_isHQ = [v15 BOOLValue];
    v5->_confirmStoreSelection = [v16 BOOLValue];
    objc_storeStrong((id *)&v5->_confirmationCode, v8);
    objc_storeStrong((id *)&v5->_appleID, v9);
    objc_storeStrong((id *)&v5->_storeName, v10);
    objc_storeStrong((id *)&v5->_companyName, v11);
    uint64_t v18 = [(MSDStoreInfo *)v5 _buildFullAddress:v4];
    fullAddress = v5->_fullAddress;
    v5->_fullAddress = (NSString *)v18;

    v5->_isNearby = [v17 BOOLValue];
    if (v12 && v13)
    {
      [v12 doubleValue];
      double v21 = v20;
      [v13 doubleValue];
      uint64_t v23 = [objc_alloc(MEMORY[0x263F00A50]) initWithLatitude:v21 longitude:v22];
      storeLocation = v5->_storeLocation;
      v5->_storeLocation = (CLLocation *)v23;
    }
    else
    {
      storeLocation = v5->_storeLocation;
      v5->_storeLocation = 0;
    }

    uint64_t v25 = [(MSDStoreInfo *)v5 _buildStoreDescription:v4];
    storeDescription = v5->_storeDescription;
    v5->_storeDescription = (NSString *)v25;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MSDStoreInfo *)self storeName];
  uint64_t v7 = [(MSDStoreInfo *)self appleID];
  v8 = [(MSDStoreInfo *)self storeLocation];
  [v8 coordinate];
  uint64_t v10 = v9;
  v11 = [(MSDStoreInfo *)self storeLocation];
  [v11 coordinate];
  v13 = [v3 stringWithFormat:@"<%@: %@;%@ (%lf,%lf)>", v5, v6, v7, v10, v12];

  return v13;
}

- (id)_buildFullAddress:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"address"];
  v5 = [v3 objectForKey:@"city"];
  uint64_t v6 = [v3 objectForKey:@"state"];
  uint64_t v7 = [v3 objectForKey:@"country_name"];
  v8 = [v3 objectForKey:@"country_code"];
  uint64_t v9 = [v3 objectForKey:@"zip"];

  uint64_t v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v11 = [v4 stringByTrimmingCharactersInSet:v10];

  uint64_t v12 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v13 = [v5 stringByTrimmingCharactersInSet:v12];

  uint64_t v14 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v15 = [v6 stringByTrimmingCharactersInSet:v14];

  v16 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v17 = [v7 stringByTrimmingCharactersInSet:v16];

  uint64_t v18 = [v9 uppercaseString];

  v19 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  double v20 = [v18 stringByTrimmingCharactersInSet:v19];

  id v21 = objc_alloc_init(MEMORY[0x263EFEB38]);
  id v22 = objc_alloc_init(MEMORY[0x263EFEB18]);
  uint64_t v23 = v22;
  if (v11) {
    [v22 setStreet:v11];
  }
  if (v13) {
    [v23 setCity:v13];
  }
  if (v15 && ([v11 isEqualToString:v15] & 1) == 0) {
    [v23 setState:v15];
  }
  if (v20) {
    [v23 setPostalCode:v20];
  }
  if (v8) {
    [v23 setISOCountryCode:v8];
  }
  if (v17) {
    [v23 setCountry:v17];
  }
  v24 = [v21 stringFromPostalAddress:v23];

  return v24;
}

- (id)_buildStoreDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"address"];
  uint64_t v5 = [v3 objectForKey:@"city"];
  uint64_t v6 = [v3 objectForKey:@"distance_unit"];
  uint64_t v7 = [v3 objectForKey:@"distance_in_unit"];

  v8 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v9 = [v4 stringByTrimmingCharactersInSet:v8];

  uint64_t v10 = objc_opt_new();
  if (v7 && v6)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F108C8]);
    uint64_t v12 = [NSString stringWithFormat:@"%@ %@", v7, v6];
    [v11 distanceFromString:v12];
    v13 = objc_msgSend(v11, "stringFromDistance:");

    [v10 appendString:v13];
  }
  if (v9 | v5)
  {
    if ([v10 length]) {
      [v10 appendString:@" • "];
    }
    if (v9 && v5)
    {
      uint64_t v14 = [NSString stringWithFormat:@"%@, %@", v9, v5];
      [v10 appendString:v14];

      goto LABEL_15;
    }
    if (v9)
    {
      v15 = v10;
      uint64_t v16 = v9;
    }
    else
    {
      if (!v5) {
        goto LABEL_15;
      }
      v15 = v10;
      uint64_t v16 = v5;
    }
    [v15 appendString:v16];
  }
LABEL_15:

  return v10;
}

- (BOOL)isHQ
{
  return self->_isHQ;
}

- (BOOL)confirmStoreSelection
{
  return self->_confirmStoreSelection;
}

- (NSString)confirmationCode
{
  return self->_confirmationCode;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)storeName
{
  return self->_storeName;
}

- (NSString)companyName
{
  return self->_companyName;
}

- (NSString)fullAddress
{
  return self->_fullAddress;
}

- (CLLocation)storeLocation
{
  return self->_storeLocation;
}

- (NSString)storeDescription
{
  return self->_storeDescription;
}

- (BOOL)isNearby
{
  return self->_isNearby;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeDescription, 0);
  objc_storeStrong((id *)&self->_storeLocation, 0);
  objc_storeStrong((id *)&self->_fullAddress, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_storeName, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_confirmationCode, 0);
}

@end