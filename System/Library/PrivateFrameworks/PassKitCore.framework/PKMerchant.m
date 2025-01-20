@interface PKMerchant
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
- (BOOL)hasBetterVisualPropertiesThanMerchant:(id)a3;
- (BOOL)hasCloudArchivableDeviceData;
- (BOOL)hasMapsMatch;
- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMerchant:(id)a3;
- (BOOL)isValid;
- (BOOL)mapsDataIsFromLocalMatch;
- (BOOL)shouldBeCombinedWithMerchant:(id)a3;
- (BOOL)useDisplayNameIgnoringBrand;
- (BOOL)useRawMerchantData;
- (NSString)city;
- (NSString)detailedCategory;
- (NSString)displayName;
- (NSString)displayNameIgnoringBrand;
- (NSString)fallbackDetailedCategory;
- (NSString)heroImageAttribution;
- (NSString)industryCategory;
- (NSString)merchantIdentifier;
- (NSString)name;
- (NSString)phoneNumber;
- (NSString)rawCANL;
- (NSString)rawCity;
- (NSString)rawCountry;
- (NSString)rawName;
- (NSString)rawState;
- (NSString)state;
- (NSString)webMerchantIdentifier;
- (NSString)webMerchantName;
- (NSString)zip;
- (NSURL)businessChatURL;
- (NSURL)fallbackLogoImageURL;
- (NSURL)heroImageURL;
- (NSURL)logoImageURL;
- (NSURL)originURL;
- (PKMapsBrand)mapsBrand;
- (PKMapsMerchant)mapsMerchant;
- (PKMerchant)initWithCloudStoreCoder:(id)a3;
- (PKMerchant)initWithCoder:(id)a3;
- (id)description;
- (id)jsonDictionaryRepresentation;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (id)uniqueIdentifier;
- (int64_t)adamIdentifier;
- (int64_t)category;
- (int64_t)cleanConfidenceLevel;
- (int64_t)fallbackcategory;
- (int64_t)industryCode;
- (unint64_t)hash;
- (unint64_t)itemType;
- (void)_encodeDeviceDataWithCloudStoreCoder:(id)a3;
- (void)_encodeServerDataWithCloudStoreCoder:(id)a3;
- (void)_regenerateDisplayName;
- (void)_regenerateDisplayNameIgnoringBrand;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamIdentifier:(int64_t)a3;
- (void)setCity:(id)a3;
- (void)setCleanConfidenceLevel:(int64_t)a3;
- (void)setFallbackDetailedCategory:(id)a3;
- (void)setFallbackLogoImageURL:(id)a3;
- (void)setFallbackcategory:(int64_t)a3;
- (void)setIndustryCategory:(id)a3;
- (void)setIndustryCode:(int64_t)a3;
- (void)setMapsBrand:(id)a3;
- (void)setMapsDataIsFromLocalMatch:(BOOL)a3;
- (void)setMapsMerchant:(id)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setOriginURL:(id)a3;
- (void)setRawCANL:(id)a3;
- (void)setRawCity:(id)a3;
- (void)setRawCountry:(id)a3;
- (void)setRawName:(id)a3;
- (void)setRawState:(id)a3;
- (void)setState:(id)a3;
- (void)setUseDisplayNameIgnoringBrand:(BOOL)a3;
- (void)setUseRawMerchantData:(BOOL)a3;
- (void)setWebMerchantIdentifier:(id)a3;
- (void)setWebMerchantName:(id)a3;
- (void)setZip:(id)a3;
@end

@implementation PKMerchant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKMerchant)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)PKMerchant;
  v5 = [(PKMerchant *)&v54 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawName"];
    rawName = v5->_rawName;
    v5->_rawName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"industryCategory"];
    industryCategory = v5->_industryCategory;
    v5->_industryCategory = (NSString *)v12;

    v5->_industryCode = [v4 decodeIntegerForKey:@"industryCode"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawCANL"];
    rawCANL = v5->_rawCANL;
    v5->_rawCANL = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawCity"];
    rawCity = v5->_rawCity;
    v5->_rawCity = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawState"];
    rawState = v5->_rawState;
    v5->_rawState = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawCountry"];
    rawCountry = v5->_rawCountry;
    v5->_rawCountry = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"city"];
    city = v5->_city;
    v5->_city = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zip"];
    zip = v5->_zip;
    v5->_zip = (NSString *)v26;

    v5->_cleanConfidenceLevel = [v4 decodeIntegerForKey:@"cleanConfidenceLevel"];
    v5->_adamIdentifier = [v4 decodeIntegerForKey:@"adamID"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originURL"];
    originURL = v5->_originURL;
    v5->_originURL = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webMerchantIdentifier"];
    webMerchantIdentifier = v5->_webMerchantIdentifier;
    v5->_webMerchantIdentifier = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"webMerchantName"];
    webMerchantName = v5->_webMerchantName;
    v5->_webMerchantName = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v34;

    v5->_useRawMerchantData = [v4 decodeBoolForKey:@"useRawMerchantDataKey"];
    v5->_mapsDataIsFromLocalMatch = [v4 decodeBoolForKey:@"localMapsMatch"];
    v5->_useDisplayNameIgnoringBrand = [v4 decodeBoolForKey:@"useDisplayNameIgnoringBrand"];
    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameIgnoringBrand"];
    displayNameIgnoringBrand = v5->_displayNameIgnoringBrand;
    v5->_displayNameIgnoringBrand = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fallbackLogoImageURL"];
    fallbackLogoImageURL = v5->_fallbackLogoImageURL;
    v5->_fallbackLogoImageURL = (NSURL *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapsMerchant"];
    mapsMerchant = v5->_mapsMerchant;
    v5->_mapsMerchant = (PKMapsMerchant *)v40;

    if (!v5->_mapsMerchant)
    {
      uint64_t v42 = [v4 decodeInt64ForKey:@"identifier"];
      if (v42)
      {
        uint64_t v43 = v42;
        v44 = objc_alloc_init(PKMapsMerchant);
        [(PKMapsMerchant *)v44 setIdentifier:v43];
        -[PKMapsMerchant setResultProviderIdentifier:](v44, "setResultProviderIdentifier:", [v4 decodeInt32ForKey:@"resultProviderIdentifier"]);
        v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapsName"];
        [(PKMapsMerchant *)v44 setName:v45];

        v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
        [(PKMapsMerchant *)v44 setPhoneNumber:v46];

        v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
        [(PKMapsMerchant *)v44 setURL:v47];

        [v4 decodeDoubleForKey:@"locationLatitude"];
        -[PKMapsMerchant setLocationLatitude:](v44, "setLocationLatitude:");
        [v4 decodeDoubleForKey:@"locationLongitude"];
        -[PKMapsMerchant setLocationLongitude:](v44, "setLocationLongitude:");
        v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postalAddress"];
        [(PKMapsMerchant *)v44 setPostalAddress:v48];

        if ([(PKMapsMerchant *)v44 isValid]) {
          objc_storeStrong((id *)&v5->_mapsMerchant, v44);
        }
      }
    }
    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapsBrand"];
    mapsBrand = v5->_mapsBrand;
    v5->_mapsBrand = (PKMapsBrand *)v49;

    v5->_fallbackcategory = [v4 decodeIntegerForKey:@"merchantFallbackCategory"];
    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantFallbackMapsCategory"];
    fallbackDetailedCategory = v5->_fallbackDetailedCategory;
    v5->_fallbackDetailedCategory = (NSString *)v51;

    if (!v5->_displayName) {
      [(PKMerchant *)v5 _regenerateDisplayName];
    }
    if (!v5->_displayNameIgnoringBrand) {
      [(PKMerchant *)v5 _regenerateDisplayNameIgnoringBrand];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKMerchant *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(PKMerchant *)self rawName];
  [v4 encodeObject:v6 forKey:@"rawName"];

  v7 = [(PKMerchant *)self displayName];
  [v4 encodeObject:v7 forKey:@"displayName"];

  uint64_t v8 = [(PKMerchant *)self industryCategory];
  [v4 encodeObject:v8 forKey:@"industryCategory"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant industryCode](self, "industryCode"), @"industryCode");
  v9 = [(PKMerchant *)self rawCANL];
  [v4 encodeObject:v9 forKey:@"rawCANL"];

  uint64_t v10 = [(PKMerchant *)self rawCity];
  [v4 encodeObject:v10 forKey:@"rawCity"];

  v11 = [(PKMerchant *)self rawState];
  [v4 encodeObject:v11 forKey:@"rawState"];

  uint64_t v12 = [(PKMerchant *)self rawCountry];
  [v4 encodeObject:v12 forKey:@"rawCountry"];

  v13 = [(PKMerchant *)self city];
  [v4 encodeObject:v13 forKey:@"city"];

  uint64_t v14 = [(PKMerchant *)self state];
  [v4 encodeObject:v14 forKey:@"state"];

  v15 = [(PKMerchant *)self zip];
  [v4 encodeObject:v15 forKey:@"zip"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant cleanConfidenceLevel](self, "cleanConfidenceLevel"), @"cleanConfidenceLevel");
  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant adamIdentifier](self, "adamIdentifier"), @"adamID");
  uint64_t v16 = [(PKMerchant *)self originURL];
  [v4 encodeObject:v16 forKey:@"originURL"];

  v17 = [(PKMerchant *)self webMerchantIdentifier];
  [v4 encodeObject:v17 forKey:@"webMerchantIdentifier"];

  uint64_t v18 = [(PKMerchant *)self webMerchantName];
  [v4 encodeObject:v18 forKey:@"webMerchantName"];

  v19 = [(PKMerchant *)self merchantIdentifier];
  [v4 encodeObject:v19 forKey:@"merchantIdentifier"];

  uint64_t v20 = [(PKMerchant *)self mapsMerchant];
  [v4 encodeObject:v20 forKey:@"mapsMerchant"];

  v21 = [(PKMerchant *)self mapsBrand];
  [v4 encodeObject:v21 forKey:@"mapsBrand"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PKMerchant fallbackcategory](self, "fallbackcategory"), @"merchantFallbackCategory");
  uint64_t v22 = [(PKMerchant *)self fallbackDetailedCategory];
  [v4 encodeObject:v22 forKey:@"merchantFallbackMapsCategory"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PKMerchant useRawMerchantData](self, "useRawMerchantData"), @"useRawMerchantDataKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[PKMerchant mapsDataIsFromLocalMatch](self, "mapsDataIsFromLocalMatch"), @"localMapsMatch");
  objc_msgSend(v4, "encodeBool:forKey:", -[PKMerchant useDisplayNameIgnoringBrand](self, "useDisplayNameIgnoringBrand"), @"useDisplayNameIgnoringBrand");
  v23 = [(PKMerchant *)self displayNameIgnoringBrand];
  [v4 encodeObject:v23 forKey:@"displayNameIgnoringBrand"];

  id v24 = [(PKMerchant *)self fallbackLogoImageURL];
  [v4 encodeObject:v24 forKey:@"fallbackLogoImageURL"];
}

- (PKMerchant)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMerchant;
  v5 = [(PKMerchant *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [[PKMapsMerchant alloc] initWithCloudStoreCoder:v4];
    mapsMerchant = v5->_mapsMerchant;
    v5->_mapsMerchant = v6;

    uint64_t v8 = [[PKMapsBrand alloc] initWithCloudStoreCoder:v4];
    mapsBrand = v5->_mapsBrand;
    v5->_mapsBrand = v8;

    [(PKMerchant *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }
  if (![(PKMerchant *)v5 isValid])
  {

    v5 = 0;
  }

  return v5;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v45 = a3;
  id v4 = [v45 recordsWithRecordType:@"Transaction"];
  v5 = [v4 firstObject];

  if (v5)
  {
    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantName");
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v6;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantRawName");
    uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawName = self->_rawName;
    self->_rawName = v8;

    self->_industryCode = objc_msgSend(v5, "pk_encryptedIntegerForKey:", @"merchantIndustryCode");
    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantIndustryCategory");
    uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    industryCategory = self->_industryCategory;
    self->_industryCategory = v10;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantRawCANL");
    uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawCANL = self->_rawCANL;
    self->_rawCANL = v12;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantRawCity");
    uint64_t v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawCity = self->_rawCity;
    self->_rawCity = v14;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantRawState");
    uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawState = self->_rawState;
    self->_rawState = v16;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantRawCountry");
    uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    rawCountry = self->_rawCountry;
    self->_rawCountry = v18;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantCity");
    uint64_t v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    city = self->_city;
    self->_city = v20;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantZip");
    uint64_t v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    zip = self->_zip;
    self->_zip = v22;

    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantState");
    id v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    state = self->_state;
    self->_state = v24;

    self->_cleanConfidenceLevel = objc_msgSend(v5, "pk_encryptedIntegerForKey:", @"merchantCleanConfidenceLevel");
    objc_msgSend(v5, "pk_encryptedStringForKey:", @"merchantIdentifier");
    uint64_t v26 = (NSString *)objc_claimAutoreleasedReturnValue();
    merchantIdentifier = self->_merchantIdentifier;
    self->_merchantIdentifier = v26;
  }
  uint64_t v28 = [v45 recordsWithRecordType:@"TransactionDeviceData"];
  v29 = [v28 firstObject];

  if (v29)
  {
    uint64_t v30 = objc_msgSend(v29, "pk_encryptedStringForKey:", @"merchantFallbackCategory");
    self->_fallbackcategory = PKMerchantCategoryFromString(v30);

    objc_msgSend(v29, "pk_encryptedStringForKey:", @"merchantFallbackMapsCategory");
    v31 = (NSString *)objc_claimAutoreleasedReturnValue();
    fallbackDetailedCategory = self->_fallbackDetailedCategory;
    self->_fallbackDetailedCategory = v31;

    self->_adamIdentifier = objc_msgSend(v29, "pk_encryptedIntegerForKey:", @"adamID");
    objc_msgSend(v29, "pk_encryptedUrlForKey:", @"originURL");
    v33 = (NSURL *)objc_claimAutoreleasedReturnValue();
    originURL = self->_originURL;
    self->_originURL = v33;

    objc_msgSend(v29, "pk_encryptedStringForKey:", @"webMerchantIdentifier");
    v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    webMerchantIdentifier = self->_webMerchantIdentifier;
    self->_webMerchantIdentifier = v35;

    objc_msgSend(v29, "pk_encryptedStringForKey:", @"webMerchantName");
    v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    webMerchantName = self->_webMerchantName;
    self->_webMerchantName = v37;

    self->_useRawMerchantData = objc_msgSend(v29, "pk_encryptedBoolForKey:", @"useRawMerchantDataKey");
    mapsMerchant = self->_mapsMerchant;
    if (mapsMerchant)
    {
      [(PKMapsMerchant *)mapsMerchant applyPropertiesFromCloudStoreRecord:v45];
    }
    else
    {
      uint64_t v40 = [[PKMapsMerchant alloc] initWithCloudStoreCoder:v45];
      v41 = self->_mapsMerchant;
      self->_mapsMerchant = v40;
    }
    mapsBrand = self->_mapsBrand;
    if (mapsBrand)
    {
      [(PKMapsBrand *)mapsBrand applyPropertiesFromCloudStoreRecord:v45];
    }
    else
    {
      uint64_t v43 = [[PKMapsBrand alloc] initWithCloudStoreCoder:v45];
      v44 = self->_mapsBrand;
      self->_mapsBrand = v43;
    }
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v6 = a3;
  mapsMerchant = self->_mapsMerchant;
  id v10 = v6;
  if (mapsMerchant) {
    [(PKMapsMerchant *)mapsMerchant encodeWithCloudStoreCoder:v6 codingType:a4];
  }
  else {
    +[PKMapsMerchant deleteFromCloudStoreRecord:v6 codingType:a4];
  }
  mapsBrand = self->_mapsBrand;
  if (mapsBrand) {
    [(PKMapsBrand *)mapsBrand encodeWithCloudStoreCoder:v10 codingType:a4];
  }
  else {
    +[PKMapsBrand deleteFromCloudStoreRecord:v10 codingType:a4];
  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [(PKMerchant *)self _encodeDeviceDataWithCloudStoreCoder:v10];
  }
  v9 = v10;
  if (a4 - 1 <= 1)
  {
    [(PKMerchant *)self _encodeServerDataWithCloudStoreCoder:v10];
    v9 = v10;
  }
}

- (void)_encodeDeviceDataWithCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"TransactionDeviceData"];
  id v12 = [v4 firstObject];

  v5 = [v12 encryptedValues];
  id v6 = v5;
  unint64_t v7 = self->_fallbackcategory - 1;
  if (v7 > 6) {
    uint64_t v8 = @"unknown";
  }
  else {
    uint64_t v8 = off_1E56F4798[v7];
  }
  [v5 setObject:v8 forKey:@"merchantFallbackCategory"];
  [v6 setObject:self->_fallbackDetailedCategory forKey:@"merchantFallbackMapsCategory"];
  v9 = [NSNumber numberWithInteger:self->_adamIdentifier];
  [v6 setObject:v9 forKey:@"adamID"];

  id v10 = [(NSURL *)self->_originURL absoluteString];
  [v6 setObject:v10 forKey:@"originURL"];

  [v6 setObject:self->_webMerchantIdentifier forKey:@"webMerchantIdentifier"];
  [v6 setObject:self->_webMerchantName forKey:@"webMerchantName"];
  if (PKApplePayContainerEnvironment() == 2)
  {
    objc_super v11 = [NSNumber numberWithBool:self->_useRawMerchantData];
    [v6 setObject:v11 forKey:@"useRawMerchantDataKey"];
  }
}

- (void)_encodeServerDataWithCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"Transaction"];
  id v8 = [v4 firstObject];

  v5 = [v8 encryptedValues];
  [v5 setObject:self->_name forKey:@"merchantName"];
  [v5 setObject:self->_rawName forKey:@"merchantRawName"];
  id v6 = [NSNumber numberWithInteger:self->_industryCode];
  [v5 setObject:v6 forKey:@"merchantIndustryCode"];

  [v5 setObject:self->_industryCategory forKey:@"merchantIndustryCategory"];
  [v5 setObject:self->_rawCANL forKey:@"merchantRawCANL"];
  [v5 setObject:self->_rawCity forKey:@"merchantRawCity"];
  [v5 setObject:self->_rawState forKey:@"merchantRawState"];
  [v5 setObject:self->_rawCountry forKey:@"merchantRawCountry"];
  [v5 setObject:self->_city forKey:@"merchantCity"];
  [v5 setObject:self->_zip forKey:@"merchantZip"];
  [v5 setObject:self->_state forKey:@"merchantState"];
  unint64_t v7 = [NSNumber numberWithInteger:self->_cleanConfidenceLevel];
  [v5 setObject:v7 forKey:@"merchantCleanConfidenceLevel"];

  [v5 setObject:self->_merchantIdentifier forKey:@"merchantIdentifier"];
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  return 0;
}

- (id)primaryIdentifier
{
  return 0;
}

- (unint64_t)itemType
{
  return 1;
}

+ (id)recordNamePrefix
{
  return 0;
}

- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (!v4 || self->_fallbackcategory != *((void *)v4 + 21)) {
    goto LABEL_30;
  }
  id v6 = (void *)*((void *)v4 + 22);
  unint64_t v7 = self->_fallbackDetailedCategory;
  id v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_30;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_30;
    }
  }
  if (self->_adamIdentifier != *((void *)v5 + 7))
  {
LABEL_30:
    BOOL v17 = 0;
    goto LABEL_31;
  }
  originURL = self->_originURL;
  id v12 = (NSURL *)*((void *)v5 + 4);
  if (originURL && v12)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0) {
      goto LABEL_30;
    }
  }
  else if (originURL != v12)
  {
    goto LABEL_30;
  }
  webMerchantName = self->_webMerchantName;
  uint64_t v14 = (NSString *)*((void *)v5 + 6);
  if (webMerchantName && v14)
  {
    if ((-[NSString isEqual:](webMerchantName, "isEqual:") & 1) == 0) {
      goto LABEL_30;
    }
  }
  else if (webMerchantName != v14)
  {
    goto LABEL_30;
  }
  webMerchantIdentifier = self->_webMerchantIdentifier;
  uint64_t v16 = (NSString *)*((void *)v5 + 5);
  if (!webMerchantIdentifier || !v16)
  {
    if (webMerchantIdentifier == v16) {
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  if ((-[NSString isEqual:](webMerchantIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_30;
  }
LABEL_26:
  if (self->_useRawMerchantData != v5[8]
    || ![(PKMapsMerchant *)self->_mapsMerchant isCloudArchivableDeviceDataEqual:*((void *)v5 + 24)]|| ![(PKMapsBrand *)self->_mapsBrand isCloudArchivableDeviceDataEqual:*((void *)v5 + 25)])
  {
    goto LABEL_30;
  }
  BOOL v17 = self->_mapsDataIsFromLocalMatch == v5[10];
LABEL_31:

  return v17;
}

- (BOOL)hasCloudArchivableDeviceData
{
  if (self->_fallbackcategory
    || self->_fallbackDetailedCategory
    || self->_adamIdentifier
    || self->_originURL
    || self->_webMerchantIdentifier
    || self->_webMerchantName
    || self->_useRawMerchantData
    || [(PKMapsMerchant *)self->_mapsMerchant hasCloudArchivableDeviceData])
  {
    return 1;
  }
  mapsBrand = self->_mapsBrand;
  return [(PKMapsBrand *)mapsBrand hasCloudArchivableDeviceData];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_rawName];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_industryCategory];
  [v3 safelyAddObject:self->_rawCANL];
  [v3 safelyAddObject:self->_rawCity];
  [v3 safelyAddObject:self->_rawState];
  [v3 safelyAddObject:self->_rawCountry];
  [v3 safelyAddObject:self->_city];
  [v3 safelyAddObject:self->_state];
  [v3 safelyAddObject:self->_zip];
  [v3 safelyAddObject:self->_originURL];
  [v3 safelyAddObject:self->_webMerchantName];
  [v3 safelyAddObject:self->_webMerchantIdentifier];
  [v3 safelyAddObject:self->_merchantIdentifier];
  [v3 safelyAddObject:self->_mapsMerchant];
  [v3 safelyAddObject:self->_mapsBrand];
  [v3 safelyAddObject:self->_fallbackDetailedCategory];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_industryCode - v4 + 32 * v4;
  int64_t v6 = self->_cleanConfidenceLevel - v5 + 32 * v5;
  int64_t v7 = self->_adamIdentifier - v6 + 32 * v6;
  int64_t v8 = self->_fallbackcategory - v7 + 32 * v7;
  uint64_t v9 = self->_useRawMerchantData - v8 + 32 * v8;
  unint64_t v10 = self->_useDisplayNameIgnoringBrand - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKMerchant *)a3;
  int64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKMerchant *)self isEqualToMerchant:v5];

  return v6;
}

- (BOOL)isEqualToMerchant:(id)a3
{
  uint64_t v4 = a3;
  name = self->_name;
  BOOL v6 = (NSString *)v4[10];
  if (name) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (name != v6) {
      goto LABEL_106;
    }
  }
  else if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
  {
    goto LABEL_106;
  }
  rawName = self->_rawName;
  uint64_t v9 = (NSString *)v4[11];
  if (rawName && v9)
  {
    if ((-[NSString isEqual:](rawName, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (rawName != v9)
  {
    goto LABEL_106;
  }
  displayName = self->_displayName;
  objc_super v11 = (NSString *)v4[2];
  if (displayName && v11)
  {
    if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (displayName != v11)
  {
    goto LABEL_106;
  }
  industryCategory = self->_industryCategory;
  v13 = (NSString *)v4[9];
  if (industryCategory && v13)
  {
    if ((-[NSString isEqual:](industryCategory, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (industryCategory != v13)
  {
    goto LABEL_106;
  }
  rawCANL = self->_rawCANL;
  v15 = (NSString *)v4[13];
  if (rawCANL && v15)
  {
    if ((-[NSString isEqual:](rawCANL, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (rawCANL != v15)
  {
    goto LABEL_106;
  }
  rawCity = self->_rawCity;
  BOOL v17 = (NSString *)v4[14];
  if (rawCity && v17)
  {
    if ((-[NSString isEqual:](rawCity, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (rawCity != v17)
  {
    goto LABEL_106;
  }
  rawState = self->_rawState;
  v19 = (NSString *)v4[15];
  if (rawState && v19)
  {
    if ((-[NSString isEqual:](rawState, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (rawState != v19)
  {
    goto LABEL_106;
  }
  rawCountry = self->_rawCountry;
  v21 = (NSString *)v4[16];
  if (rawCountry && v21)
  {
    if ((-[NSString isEqual:](rawCountry, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (rawCountry != v21)
  {
    goto LABEL_106;
  }
  city = self->_city;
  v23 = (NSString *)v4[17];
  if (city && v23)
  {
    if ((-[NSString isEqual:](city, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (city != v23)
  {
    goto LABEL_106;
  }
  state = self->_state;
  v25 = (NSString *)v4[18];
  if (state && v25)
  {
    if ((-[NSString isEqual:](state, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (state != v25)
  {
    goto LABEL_106;
  }
  zip = self->_zip;
  v27 = (NSString *)v4[19];
  if (zip && v27)
  {
    if ((-[NSString isEqual:](zip, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (zip != v27)
  {
    goto LABEL_106;
  }
  originURL = self->_originURL;
  v29 = (NSURL *)v4[4];
  if (originURL && v29)
  {
    if ((-[NSURL isEqual:](originURL, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (originURL != v29)
  {
    goto LABEL_106;
  }
  webMerchantName = self->_webMerchantName;
  v31 = (NSString *)v4[6];
  if (webMerchantName && v31)
  {
    if ((-[NSString isEqual:](webMerchantName, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (webMerchantName != v31)
  {
    goto LABEL_106;
  }
  webMerchantIdentifier = self->_webMerchantIdentifier;
  v33 = (NSString *)v4[5];
  if (webMerchantIdentifier && v33)
  {
    if ((-[NSString isEqual:](webMerchantIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (webMerchantIdentifier != v33)
  {
    goto LABEL_106;
  }
  merchantIdentifier = self->_merchantIdentifier;
  v35 = (NSString *)v4[12];
  if (merchantIdentifier && v35)
  {
    if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (merchantIdentifier != v35)
  {
    goto LABEL_106;
  }
  mapsMerchant = self->_mapsMerchant;
  v37 = (PKMapsMerchant *)v4[24];
  if (mapsMerchant && v37)
  {
    if (!-[PKMapsMerchant isEqual:](mapsMerchant, "isEqual:")) {
      goto LABEL_106;
    }
  }
  else if (mapsMerchant != v37)
  {
    goto LABEL_106;
  }
  mapsBrand = self->_mapsBrand;
  v39 = (PKMapsBrand *)v4[25];
  if (mapsBrand && v39)
  {
    if (!-[PKMapsBrand isEqual:](mapsBrand, "isEqual:")) {
      goto LABEL_106;
    }
  }
  else if (mapsBrand != v39)
  {
    goto LABEL_106;
  }
  fallbackDetailedCategory = self->_fallbackDetailedCategory;
  v41 = (NSString *)v4[22];
  if (fallbackDetailedCategory && v41)
  {
    if ((-[NSString isEqual:](fallbackDetailedCategory, "isEqual:") & 1) == 0) {
      goto LABEL_106;
    }
  }
  else if (fallbackDetailedCategory != v41)
  {
    goto LABEL_106;
  }
  fallbackLogoImageURL = self->_fallbackLogoImageURL;
  uint64_t v43 = (NSURL *)v4[23];
  if (!fallbackLogoImageURL || !v43)
  {
    if (fallbackLogoImageURL == v43) {
      goto LABEL_99;
    }
LABEL_106:
    BOOL v44 = 0;
    goto LABEL_107;
  }
  if ((-[NSURL isEqual:](fallbackLogoImageURL, "isEqual:") & 1) == 0) {
    goto LABEL_106;
  }
LABEL_99:
  if (self->_industryCode != v4[8]
    || self->_cleanConfidenceLevel != v4[20]
    || self->_adamIdentifier != v4[7]
    || self->_fallbackcategory != v4[21]
    || self->_useRawMerchantData != *((unsigned __int8 *)v4 + 8)
    || self->_useDisplayNameIgnoringBrand != *((unsigned __int8 *)v4 + 9))
  {
    goto LABEL_106;
  }
  BOOL v44 = self->_mapsDataIsFromLocalMatch == *((unsigned __int8 *)v4 + 10);
LABEL_107:

  return v44;
}

- (id)description
{
  v3 = [(PKMerchant *)self jsonDictionaryRepresentation];
  uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:2 error:0];
  if (v4) {
    int64_t v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else {
    int64_t v5 = 0;
  }
  BOOL v6 = NSString;
  BOOL v7 = (objc_class *)objc_opt_class();
  int64_t v8 = NSStringFromClass(v7);
  uint64_t v9 = [v6 stringWithFormat:@"<%@: %p; %@>", v8, self, v5];

  return v9;
}

- (id)jsonDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [NSNumber numberWithInteger:self->_industryCode];
  [v3 setObject:v4 forKeyedSubscript:@"industryCode"];

  [v3 setObject:self->_industryCategory forKeyedSubscript:@"industryCategory"];
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:self->_rawName forKeyedSubscript:@"rawName"];
  [v3 setObject:self->_displayName forKeyedSubscript:@"displayName"];
  [v3 setObject:self->_rawCANL forKeyedSubscript:@"rawCANL"];
  [v3 setObject:self->_rawCity forKeyedSubscript:@"rawCity"];
  [v3 setObject:self->_rawState forKeyedSubscript:@"rawState"];
  [v3 setObject:self->_rawCountry forKeyedSubscript:@"rawCountry"];
  [v3 setObject:self->_city forKeyedSubscript:@"city"];
  [v3 setObject:self->_state forKeyedSubscript:@"state"];
  [v3 setObject:self->_zip forKeyedSubscript:@"zip"];
  int64_t v5 = [NSNumber numberWithInteger:self->_cleanConfidenceLevel];
  [v3 setObject:v5 forKeyedSubscript:@"cleanConfidenceLevel"];

  BOOL v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PKMerchant isValid](self, "isValid"));
  [v3 setObject:v6 forKeyedSubscript:@"isValid"];

  BOOL v7 = [(PKMerchant *)self originURL];
  int64_t v8 = [v7 absoluteString];
  [v3 setObject:v8 forKeyedSubscript:@"originURL"];

  [v3 setObject:self->_webMerchantIdentifier forKeyedSubscript:@"webMerchantID"];
  [v3 setObject:self->_webMerchantName forKeyedSubscript:@"webMerchantName"];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKMerchant adamIdentifier](self, "adamIdentifier"));
  [v3 setObject:v9 forKeyedSubscript:@"adamID"];

  unint64_t v10 = [(PKMerchant *)self merchantIdentifier];
  [v3 setObject:v10 forKeyedSubscript:@"merchantIdentifier"];

  objc_super v11 = [(PKMapsMerchant *)self->_mapsMerchant jsonRepresentation];
  [v3 setObject:v11 forKeyedSubscript:@"mapsMerchant"];

  id v12 = [(PKMapsBrand *)self->_mapsBrand jsonRepresentation];
  [v3 setObject:v12 forKeyedSubscript:@"mapsBrand"];

  unint64_t v13 = self->_fallbackcategory - 1;
  if (v13 > 6) {
    uint64_t v14 = @"unknown";
  }
  else {
    uint64_t v14 = off_1E56F4798[v13];
  }
  [v3 setObject:v14 forKeyedSubscript:@"fallbackCategory"];
  [v3 setObject:self->_fallbackDetailedCategory forKeyedSubscript:@"fallbackDetailedCategory"];
  v15 = [NSNumber numberWithBool:self->_useRawMerchantData];
  [v3 setObject:v15 forKeyedSubscript:@"useRawMerchantData"];

  uint64_t v16 = [NSNumber numberWithBool:self->_useDisplayNameIgnoringBrand];
  [v3 setObject:v16 forKeyedSubscript:@"useDisplayNameIgnoringBrand"];

  [v3 setObject:self->_displayNameIgnoringBrand forKeyedSubscript:@"displayNameIgnoringBrand"];
  BOOL v17 = [(NSURL *)self->_fallbackLogoImageURL absoluteString];
  [v3 setObject:v17 forKeyedSubscript:@"fallbackLogoImageURL"];

  uint64_t v18 = (void *)[v3 copy];
  return v18;
}

- (void)setMapsMerchant:(id)a3
{
  int64_t v5 = (PKMapsMerchant *)a3;
  if (self->_mapsMerchant != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_mapsMerchant, a3);
    [(PKMerchant *)self _regenerateDisplayName];
    [(PKMerchant *)self _regenerateDisplayNameIgnoringBrand];
    int64_t v5 = v6;
  }
}

- (void)setMapsBrand:(id)a3
{
  int64_t v5 = (PKMapsBrand *)a3;
  if (self->_mapsBrand != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_mapsBrand, a3);
    [(PKMerchant *)self _regenerateDisplayName];
    int64_t v5 = v6;
  }
}

- (void)setName:(id)a3
{
  if (self->_name != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    name = self->_name;
    self->_name = v4;

    [(PKMerchant *)self _regenerateDisplayName];
  }
}

- (void)setRawName:(id)a3
{
  if (self->_rawName != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    rawName = self->_rawName;
    self->_rawName = v4;

    [(PKMerchant *)self _regenerateDisplayName];
  }
}

- (void)setUseRawMerchantData:(BOOL)a3
{
  if (((!self->_useRawMerchantData ^ a3) & 1) == 0)
  {
    self->_useRawMerchantData = a3;
    [(PKMerchant *)self _regenerateDisplayName];
  }
}

- (void)setWebMerchantName:(id)a3
{
  int64_t v5 = (NSString *)a3;
  if (self->_webMerchantName != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_webMerchantName, a3);
    [(PKMerchant *)self _regenerateDisplayName];
    int64_t v5 = v6;
  }
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    [(PKMerchant *)self _regenerateDisplayName];
    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)displayNameIgnoringBrand
{
  displayNameIgnoringBrand = self->_displayNameIgnoringBrand;
  if (!displayNameIgnoringBrand)
  {
    [(PKMerchant *)self _regenerateDisplayNameIgnoringBrand];
    displayNameIgnoringBrand = self->_displayNameIgnoringBrand;
  }
  return displayNameIgnoringBrand;
}

- (BOOL)isValid
{
  return [(NSString *)self->_name length] || [(NSString *)self->_rawName length] != 0;
}

- (BOOL)hasMapsMatch
{
  return self->_mapsMerchant || self->_mapsBrand != 0;
}

- (NSURL)heroImageURL
{
  if (self->_useRawMerchantData)
  {
    v2 = 0;
  }
  else
  {
    uint64_t v4 = [(PKMapsMerchant *)self->_mapsMerchant heroImageURL];
    int64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(PKMapsBrand *)self->_mapsBrand heroImageURL];
    }
    v2 = v6;
  }
  return (NSURL *)v2;
}

- (NSURL)logoImageURL
{
  if (self->_useRawMerchantData
    || ([(PKMapsBrand *)self->_mapsBrand logoURL], (id v3 = (NSURL *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = self->_fallbackLogoImageURL;
  }
  return v3;
}

- (NSString)heroImageAttribution
{
  if (self->_useRawMerchantData) {
    goto LABEL_2;
  }
  p_mapsMerchant = &self->_mapsMerchant;
  int64_t v5 = [(PKMapsMerchant *)self->_mapsMerchant heroImageURL];

  if (!v5)
  {
    mapsBrand = self->_mapsBrand;
    p_mapsBrand = &self->_mapsBrand;
    int64_t v8 = [(PKMapsBrand *)mapsBrand heroImageURL];

    if (!v8)
    {
LABEL_2:
      v2 = 0;
      goto LABEL_7;
    }
    p_mapsMerchant = (PKMapsMerchant **)p_mapsBrand;
  }
  v2 = [(PKMapsMerchant *)*p_mapsMerchant heroImageAttributionName];
LABEL_7:
  return (NSString *)v2;
}

- (NSString)phoneNumber
{
  if (self->_useRawMerchantData)
  {
    v2 = 0;
  }
  else
  {
    uint64_t v4 = [(PKMapsMerchant *)self->_mapsMerchant phoneNumber];
    int64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(PKMapsBrand *)self->_mapsBrand phoneNumber];
    }
    v2 = v6;
  }
  return (NSString *)v2;
}

- (NSURL)businessChatURL
{
  if (self->_useRawMerchantData)
  {
    v2 = 0;
  }
  else
  {
    uint64_t v4 = [(PKMapsMerchant *)self->_mapsMerchant businessChatURL];
    int64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(PKMapsBrand *)self->_mapsBrand businessChatURL];
    }
    v2 = v6;
  }
  return (NSURL *)v2;
}

- (int64_t)category
{
  if (self->_useRawMerchantData) {
    return self->_fallbackcategory;
  }
  int64_t v3 = [(PKMapsBrand *)self->_mapsBrand category];
  int64_t result = [(PKMapsMerchant *)self->_mapsMerchant category];
  int64_t v5 = result;
  if (v3) {
    int64_t result = v3;
  }
  if (!(v3 | v5)) {
    return self->_fallbackcategory;
  }
  return result;
}

- (NSString)detailedCategory
{
  if (!self->_useRawMerchantData
    && (([(PKMapsBrand *)self->_mapsBrand detailedCategory],
         uint64_t v4 = objc_claimAutoreleasedReturnValue(),
         [(PKMapsMerchant *)self->_mapsMerchant detailedCategory],
         uint64_t v5 = objc_claimAutoreleasedReturnValue(),
         id v6 = (void *)v5,
         (BOOL v7 = v4) != 0)
     || (BOOL v7 = (void *)v5) != 0))
  {
    int64_t v3 = v7;
  }
  else
  {
    int64_t v3 = self->_fallbackDetailedCategory;
  }
  return v3;
}

- (void)_regenerateDisplayName
{
  if (self->_useRawMerchantData)
  {
    id v3 = 0;
    goto LABEL_19;
  }
  uint64_t v4 = [(PKMapsMerchant *)self->_mapsMerchant name];
  uint64_t v5 = [(PKMapsBrand *)self->_mapsBrand name];
  uint64_t v6 = [v5 length];
  uint64_t v7 = [v4 length];
  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    char v10 = [v4 containsString:v5];
    uint64_t v9 = v5;
    if ((v10 & 1) == 0)
    {
      if ([v5 containsString:v4]) {
        uint64_t v9 = v5;
      }
      else {
        uint64_t v9 = v4;
      }
    }
    goto LABEL_17;
  }
  if (v6) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = v4;
  }
  if (v7 | v6)
  {
LABEL_17:
    id v3 = v9;
    goto LABEL_18;
  }
  id v3 = 0;
LABEL_18:

LABEL_19:
  if (![v3 length])
  {
    objc_super v11 = self->_webMerchantName;

    if (![(NSString *)v11 length])
    {
      name = self->_name;
      if (!name) {
        name = self->_rawName;
      }
      unint64_t v13 = name;

      objc_super v11 = v13;
    }
    PKMerchantFormattedDisplayName(v11);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  displayName = self->_displayName;
  self->_displayName = (NSString *)v3;
}

- (void)_regenerateDisplayNameIgnoringBrand
{
  id v5 = [(PKMapsMerchant *)self->_mapsMerchant name];
  PKMerchantFormattedDisplayName(v5);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayNameIgnoringBrand = self->_displayNameIgnoringBrand;
  self->_displayNameIgnoringBrand = v3;
}

- (id)uniqueIdentifier
{
  if (self->_mapsBrand)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"mapsBrand-%lu", -[PKMapsBrand identifier](self->_mapsBrand, "identifier"), v4);
  }
  else if (self->_mapsMerchant)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"mapsMerchant-%lu", -[PKMapsMerchant identifier](self->_mapsMerchant, "identifier"), v4);
  }
  else
  {
    [NSString stringWithFormat:@"merchant-%@-%@", self->_rawName, self->_name];
  v2 = };
  return v2;
}

- (BOOL)shouldBeCombinedWithMerchant:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [v8 mapsBrand];
  if (([v8 useRawMerchantData] & 1) != 0 || self->_useRawMerchantData) {
    goto LABEL_87;
  }
  if (v9 && self->_mapsBrand)
  {
    uint64_t v10 = [v9 identifier];
    if (v10 != [(PKMapsBrand *)self->_mapsBrand identifier])
    {
      objc_super v11 = [v8 displayName];
      id v12 = [(PKMerchant *)self displayName];
      unint64_t v13 = v11;
      uint64_t v14 = v12;
      if (v13 == v14)
      {
      }
      else
      {
        v15 = v14;
        if (!v13 || !v14)
        {

          goto LABEL_18;
        }
        id v3 = (void *)[v13 caseInsensitiveCompare:v14];

        if (v3) {
          goto LABEL_83;
        }
      }
      uint64_t v16 = [(PKMapsBrand *)self->_mapsBrand url];
      if (v16)
      {
        id v5 = [(PKMapsBrand *)self->_mapsBrand url];
        uint64_t v17 = [v9 url];
        uint64_t v6 = (void *)v17;
        if (v5 && v17)
        {
          char v18 = [v5 isEqual:v17];
          v19 = v6;
          if (v18) {
            goto LABEL_29;
          }
        }
        else
        {
          v19 = v5;
          if (v5 == (void *)v17) {
            goto LABEL_29;
          }
        }
      }
      uint64_t v20 = [(PKMapsBrand *)self->_mapsBrand detailedCategory];
      if (!v20) {
        goto LABEL_31;
      }
      v21 = [(PKMapsBrand *)self->_mapsBrand detailedCategory];
      uint64_t v22 = [v9 detailedCategory];
      id v4 = v21;
      id v23 = v22;
      if (v4 != v23)
      {
        id v3 = v23;
        if (v4 && v23)
        {
          char v24 = [v4 isEqualToString:v23];

          if (v24)
          {
            char v25 = 1;
            goto LABEL_77;
          }
        }
        else
        {
        }
LABEL_31:
        v62 = v20;
        uint64_t v26 = [(PKMapsBrand *)self->_mapsBrand phoneNumber];
        if (v26)
        {
          uint64_t v20 = [(PKMapsBrand *)self->_mapsBrand phoneNumber];
          uint64_t v27 = [v9 phoneNumber];
          v59 = v20;
          if (v20 && v27)
          {
            v58 = (void *)v27;
            if ([v20 isEqual:v27])
            {
              char v61 = 1;
LABEL_74:

              goto LABEL_75;
            }
          }
          else
          {
            if (v20 == (void *)v27)
            {
              char v61 = 1;

LABEL_75:
LABEL_76:

              uint64_t v20 = v62;
              char v25 = v61;
              if (!v62)
              {
LABEL_78:

                if (v16)
                {
                }
                if (v25) {
                  goto LABEL_98;
                }
                unint64_t v13 = PKLogFacilityTypeGetObject(0);
                if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_82;
                }
                v15 = [v8 displayName];
                *(_DWORD *)buf = 138412290;
                v64 = v15;
                _os_log_error_impl(&dword_190E10000, v13, OS_LOG_TYPE_ERROR, "We found 2 brands with the same name but they didn't match on any properties: %@", buf, 0xCu);
LABEL_18:

LABEL_82:
                goto LABEL_83;
              }
LABEL_77:

              goto LABEL_78;
            }
            v58 = (void *)v27;
          }
        }
        uint64_t v60 = [(PKMapsBrand *)self->_mapsBrand logoURL];
        if (v60)
        {
          uint64_t v20 = [(PKMapsBrand *)self->_mapsBrand logoURL];
          uint64_t v28 = [v9 logoURL];
          v56 = v20;
          if (v20 && v28)
          {
            v55 = (void *)v28;
            if ([v20 isEqual:v28])
            {
              char v61 = 1;
LABEL_68:
              uint64_t v36 = (void *)v60;
LABEL_72:

LABEL_73:
              if (!v26) {
                goto LABEL_76;
              }
              goto LABEL_74;
            }
          }
          else
          {
            if (v20 == (void *)v28)
            {
              char v61 = 1;
              v55 = v20;
              goto LABEL_68;
            }
            v55 = (void *)v28;
          }
          v57 = v3;
        }
        else
        {
          v57 = v3;
        }
        v29 = [(PKMapsBrand *)self->_mapsBrand heroImageURL];
        if (v29)
        {
          uint64_t v20 = [(PKMapsBrand *)self->_mapsBrand heroImageURL];
          uint64_t v30 = [v9 heroImageURL];
          if (v20 && v30)
          {
            uint64_t v51 = (void *)v30;
            if (objc_msgSend(v20, "isEqual:"))
            {
              char v61 = 1;
              goto LABEL_70;
            }
          }
          else
          {
            if (v20 == (void *)v30)
            {
              char v61 = 1;
              uint64_t v51 = v20;
              goto LABEL_70;
            }
            uint64_t v51 = (void *)v30;
          }
          v52 = v26;
          v53 = v6;
          objc_super v54 = v5;
        }
        else
        {
          v52 = v26;
          v53 = v6;
          objc_super v54 = v5;
        }
        uint64_t v31 = [(PKMapsBrand *)self->_mapsBrand businessChatURL];
        if (v31)
        {
          uint64_t v32 = (void *)v31;
          v33 = [(PKMapsBrand *)self->_mapsBrand businessChatURL];
          uint64_t v34 = [v9 businessChatURL];
          v35 = (void *)v34;
          if (v33 && v34) {
            char v61 = [v33 isEqual:v34];
          }
          else {
            char v61 = v33 == (void *)v34;
          }
        }
        else
        {
          char v61 = 0;
        }
        uint64_t v6 = v53;
        id v5 = v54;
        uint64_t v26 = v52;
        if (!v29)
        {
LABEL_71:
          id v3 = v57;
          uint64_t v36 = (void *)v60;
          if (!v60) {
            goto LABEL_73;
          }
          goto LABEL_72;
        }
LABEL_70:

        goto LABEL_71;
      }

      v19 = v6;
      if (v16)
      {
LABEL_29:

LABEL_94:
      }
    }
LABEL_98:
    BOOL v44 = 1;
    goto LABEL_107;
  }
LABEL_83:
  objc_msgSend(v8, "mapsMerchant", v51);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v37;
  if (v37)
  {
    if (self->_mapsMerchant)
    {
      uint64_t v38 = [(NSString *)v37 identifier];
      if (v38 == [(PKMapsMerchant *)self->_mapsMerchant identifier]) {
        goto LABEL_94;
      }
    }
  }

LABEL_87:
  if (self->_rawCANL)
  {
    v39 = [v8 rawCANL];
    rawCANL = self->_rawCANL;
    uint64_t v16 = v39;
    v41 = rawCANL;
    if (v16 == v41)
    {

      goto LABEL_94;
    }
    uint64_t v42 = v41;
    if (v16 && v41)
    {
      uint64_t v43 = [(NSString *)v16 caseInsensitiveCompare:v41];

      if (!v43) {
        goto LABEL_98;
      }
    }
    else
    {
    }
  }
  if (self->_adamIdentifier && [v8 adamIdentifier] == self->_adamIdentifier) {
    goto LABEL_98;
  }
  webMerchantIdentifier = self->_webMerchantIdentifier;
  if (webMerchantIdentifier)
  {
    v46 = [v8 webMerchantIdentifier];
    v47 = webMerchantIdentifier;
    v48 = v46;
    uint64_t v49 = v48;
    if (v47 == v48)
    {
      BOOL v44 = 1;
    }
    else if (v48)
    {
      BOOL v44 = [(NSString *)v47 caseInsensitiveCompare:v48] == NSOrderedSame;
    }
    else
    {
      BOOL v44 = 0;
    }
  }
  else
  {
    BOOL v44 = 0;
  }
LABEL_107:

  return v44;
}

- (BOOL)hasBetterVisualPropertiesThanMerchant:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mapsBrand];
  if (!v5 || (mapsBrand = self->_mapsBrand, v5, !mapsBrand))
  {
    if (self->_mapsBrand)
    {
      uint64_t v16 = [v4 mapsBrand];

      if (!v16) {
        goto LABEL_21;
      }
      if (self->_mapsBrand) {
        goto LABEL_13;
      }
    }
    uint64_t v17 = [v4 mapsBrand];

    if (v17) {
      goto LABEL_13;
    }
    v19 = [v4 mapsMerchant];
    if (v19)
    {

      goto LABEL_16;
    }
    if (!self->_mapsMerchant)
    {
LABEL_16:
      uint64_t v20 = [v4 mapsMerchant];
      if (!v20) {
        goto LABEL_13;
      }
      mapsMerchant = self->_mapsMerchant;

      if (!mapsMerchant) {
        goto LABEL_13;
      }
      uint64_t v22 = [(PKMapsMerchant *)self->_mapsMerchant heroImageURL];
      if (!v22) {
        goto LABEL_13;
      }
      id v12 = (void *)v22;
      unint64_t v13 = [v4 mapsMerchant];
      uint64_t v14 = [v13 heroImageURL];
      goto LABEL_7;
    }
LABEL_21:
    BOOL v18 = 1;
    goto LABEL_22;
  }
  uint64_t v7 = [(PKMapsBrand *)self->_mapsBrand heroImageURL];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [v4 mapsBrand];
    uint64_t v10 = [v9 heroImageURL];

    if (!v10) {
      goto LABEL_21;
    }
  }
  uint64_t v11 = [(PKMapsBrand *)self->_mapsBrand logoURL];
  if (!v11) {
    goto LABEL_13;
  }
  id v12 = (void *)v11;
  unint64_t v13 = [v4 mapsBrand];
  uint64_t v14 = [v13 logoURL];
LABEL_7:
  v15 = v14;

  if (!v15) {
    goto LABEL_21;
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_22:

  return v18;
}

- (NSURL)originURL
{
  return self->_originURL;
}

- (void)setOriginURL:(id)a3
{
}

- (NSString)webMerchantIdentifier
{
  return self->_webMerchantIdentifier;
}

- (void)setWebMerchantIdentifier:(id)a3
{
}

- (NSString)webMerchantName
{
  return self->_webMerchantName;
}

- (int64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void)setAdamIdentifier:(int64_t)a3
{
  self->_adamIdentifier = a3;
}

- (int64_t)industryCode
{
  return self->_industryCode;
}

- (void)setIndustryCode:(int64_t)a3
{
  self->_industryCode = a3;
}

- (NSString)industryCategory
{
  return self->_industryCategory;
}

- (void)setIndustryCategory:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSString)rawName
{
  return self->_rawName;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (NSString)rawCANL
{
  return self->_rawCANL;
}

- (void)setRawCANL:(id)a3
{
}

- (NSString)rawCity
{
  return self->_rawCity;
}

- (void)setRawCity:(id)a3
{
}

- (NSString)rawState
{
  return self->_rawState;
}

- (void)setRawState:(id)a3
{
}

- (NSString)rawCountry
{
  return self->_rawCountry;
}

- (void)setRawCountry:(id)a3
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

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
}

- (int64_t)cleanConfidenceLevel
{
  return self->_cleanConfidenceLevel;
}

- (void)setCleanConfidenceLevel:(int64_t)a3
{
  self->_cleanConfidenceLevel = a3;
}

- (BOOL)useRawMerchantData
{
  return self->_useRawMerchantData;
}

- (BOOL)useDisplayNameIgnoringBrand
{
  return self->_useDisplayNameIgnoringBrand;
}

- (void)setUseDisplayNameIgnoringBrand:(BOOL)a3
{
  self->_useDisplayNameIgnoringBrand = a3;
}

- (int64_t)fallbackcategory
{
  return self->_fallbackcategory;
}

- (void)setFallbackcategory:(int64_t)a3
{
  self->_fallbackcategory = a3;
}

- (NSString)fallbackDetailedCategory
{
  return self->_fallbackDetailedCategory;
}

- (void)setFallbackDetailedCategory:(id)a3
{
}

- (NSURL)fallbackLogoImageURL
{
  return self->_fallbackLogoImageURL;
}

- (void)setFallbackLogoImageURL:(id)a3
{
}

- (PKMapsMerchant)mapsMerchant
{
  return self->_mapsMerchant;
}

- (PKMapsBrand)mapsBrand
{
  return self->_mapsBrand;
}

- (BOOL)mapsDataIsFromLocalMatch
{
  return self->_mapsDataIsFromLocalMatch;
}

- (void)setMapsDataIsFromLocalMatch:(BOOL)a3
{
  self->_mapsDataIsFromLocalMatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsBrand, 0);
  objc_storeStrong((id *)&self->_mapsMerchant, 0);
  objc_storeStrong((id *)&self->_fallbackLogoImageURL, 0);
  objc_storeStrong((id *)&self->_fallbackDetailedCategory, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_rawCountry, 0);
  objc_storeStrong((id *)&self->_rawState, 0);
  objc_storeStrong((id *)&self->_rawCity, 0);
  objc_storeStrong((id *)&self->_rawCANL, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_rawName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_industryCategory, 0);
  objc_storeStrong((id *)&self->_webMerchantName, 0);
  objc_storeStrong((id *)&self->_webMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originURL, 0);
  objc_storeStrong((id *)&self->_displayNameIgnoringBrand, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end