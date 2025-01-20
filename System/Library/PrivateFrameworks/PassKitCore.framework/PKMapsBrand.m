@interface PKMapsBrand
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (void)_deleteDeviceDataFromCloudStoreRecord:(id)a3;
+ (void)deleteFromCloudStoreRecord:(id)a3 codingType:(unint64_t)a4;
- (BOOL)hasCloudArchivableDeviceData;
- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMapsBrand:(id)a3;
- (BOOL)isValid;
- (NSData)stylingInfoData;
- (NSDate)lastProcessedDate;
- (NSString)detailedCategory;
- (NSString)heroImageAttributionName;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)businessChatURL;
- (NSURL)heroImageURL;
- (NSURL)logoURL;
- (NSURL)url;
- (PKMapsBrand)initWithCloudStoreCoder:(id)a3;
- (PKMapsBrand)initWithCoder:(id)a3;
- (id)description;
- (id)jsonRepresentation;
- (id)primaryIdentifier;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (id)stylingInfo;
- (int)resultProviderIdentifier;
- (int64_t)category;
- (unint64_t)hash;
- (unint64_t)identifier;
- (unint64_t)itemType;
- (void)_encodeDeviceDataForCloudStoreCoder:(id)a3;
- (void)applyPropertiesFromCloudStoreRecord:(id)a3;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setBusinessChatURL:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setDetailedCategory:(id)a3;
- (void)setHeroImageAttributionName:(id)a3;
- (void)setHeroImageURL:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setLastProcessedDate:(id)a3;
- (void)setLogoURL:(id)a3;
- (void)setName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setResultProviderIdentifier:(int)a3;
- (void)setStylingInfoData:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation PKMapsBrand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKMapsBrand)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKMapsBrand;
  v5 = [(PKMapsBrand *)&v27 init];
  if (v5)
  {
    v5->_identifier = [v4 decodeInt64ForKey:@"identifier"];
    v5->_resultProviderIdentifier = [v4 decodeInt32ForKey:@"resultProviderIdentifier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v10;

    v5->_category = [v4 decodeIntegerForKey:@"brandCategory"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandMapsCategory"];
    detailedCategory = v5->_detailedCategory;
    v5->_detailedCategory = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandStylingInfo"];
    stylingInfoData = v5->_stylingInfoData;
    v5->_stylingInfoData = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandLogoURL"];
    logoURL = v5->_logoURL;
    v5->_logoURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandHeroImageURL"];
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSURL *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandHeroImageAttributionName"];
    heroImageAttributionName = v5->_heroImageAttributionName;
    v5->_heroImageAttributionName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"brandBusinessChatURL"];
    businessChatURL = v5->_businessChatURL;
    v5->_businessChatURL = (NSURL *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastProcessedDate"];
    lastProcessedDate = v5->_lastProcessedDate;
    v5->_lastProcessedDate = (NSDate *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeInt64:identifier forKey:@"identifier"];
  [v5 encodeInt32:self->_resultProviderIdentifier forKey:@"resultProviderIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_url forKey:@"url"];
  [v5 encodeInteger:self->_category forKey:@"brandCategory"];
  [v5 encodeObject:self->_detailedCategory forKey:@"brandMapsCategory"];
  [v5 encodeObject:self->_stylingInfoData forKey:@"brandStylingInfo"];
  [v5 encodeObject:self->_logoURL forKey:@"brandLogoURL"];
  [v5 encodeObject:self->_heroImageURL forKey:@"brandHeroImageURL"];
  [v5 encodeObject:self->_heroImageAttributionName forKey:@"brandHeroImageAttributionName"];
  [v5 encodeObject:self->_businessChatURL forKey:@"brandBusinessChatURL"];
  [v5 encodeObject:self->_lastProcessedDate forKey:@"lastProcessedDate"];
}

- (PKMapsBrand)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMapsBrand;
  id v5 = [(PKMapsBrand *)&v9 init];
  uint64_t v6 = v5;
  if (v5) {
    [(PKMapsBrand *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }
  if ([(PKMapsBrand *)v6 isValid]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (void)applyPropertiesFromCloudStoreRecord:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"TransactionDeviceData"];
  id v25 = [v4 firstObject];

  id v5 = v25;
  if (v25)
  {
    self->_unint64_t identifier = objc_msgSend(v25, "pk_encryptedUint64ForKey:", @"brandIdentifier");
    self->_resultProviderIdentifier = objc_msgSend(v25, "pk_encryptedIntForKey:", @"brandResultProviderIdentifier");
    objc_msgSend(v25, "pk_encryptedStringForKey:", @"brandName");
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v6;

    objc_msgSend(v25, "pk_encryptedUrlForKey:", @"brandBusinessChatURL");
    uint64_t v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    businessChatURL = self->_businessChatURL;
    self->_businessChatURL = v8;

    if (!self->_category)
    {
      uint64_t v10 = objc_msgSend(v25, "pk_encryptedStringForKey:", @"brandCategory");
      self->_category = PKMerchantCategoryFromString(v10);
    }
    if (!self->_url)
    {
      objc_msgSend(v25, "pk_encryptedUrlForKey:", @"brandURL");
      v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      self->_url = v11;
    }
    id v5 = v25;
    if (!self->_phoneNumber)
    {
      objc_msgSend(v25, "pk_encryptedStringForKey:", @"brandPhoneNumber");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      phoneNumber = self->_phoneNumber;
      self->_phoneNumber = v13;

      id v5 = v25;
    }
    if (!self->_logoURL)
    {
      objc_msgSend(v25, "pk_encryptedUrlForKey:", @"brandLogoURL");
      v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
      logoURL = self->_logoURL;
      self->_logoURL = v15;

      id v5 = v25;
    }
    if (!self->_heroImageURL)
    {
      objc_msgSend(v25, "pk_encryptedUrlForKey:", @"brandHeroImageURL");
      v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
      heroImageURL = self->_heroImageURL;
      self->_heroImageURL = v17;

      id v5 = v25;
    }
    if (!self->_heroImageAttributionName)
    {
      objc_msgSend(v25, "pk_encryptedStringForKey:", @"brandHeroImageAttributionName");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      heroImageAttributionName = self->_heroImageAttributionName;
      self->_heroImageAttributionName = v19;

      id v5 = v25;
    }
    if (!self->_detailedCategory)
    {
      objc_msgSend(v25, "pk_encryptedStringForKey:", @"brandMapsCategory");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      detailedCategory = self->_detailedCategory;
      self->_detailedCategory = v21;

      id v5 = v25;
    }
    if (!self->_stylingInfoData)
    {
      objc_msgSend(v25, "pk_encryptedDataForKey:", @"brandStylingInfo");
      v23 = (NSData *)objc_claimAutoreleasedReturnValue();
      stylingInfoData = self->_stylingInfoData;
      self->_stylingInfoData = v23;

      id v5 = v25;
    }
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [(PKMapsBrand *)self _encodeDeviceDataForCloudStoreCoder:a3];
  }
}

- (void)_encodeDeviceDataForCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"TransactionDeviceData"];
  id v13 = [v4 firstObject];

  id v5 = [v13 encryptedValues];
  uint64_t v6 = [NSNumber numberWithLongLong:self->_identifier];
  [v5 setObject:v6 forKey:@"brandIdentifier"];

  v7 = [NSNumber numberWithInt:self->_resultProviderIdentifier];
  [v5 setObject:v7 forKey:@"brandResultProviderIdentifier"];

  [v5 setObject:self->_name forKey:@"brandName"];
  [v5 setObject:self->_phoneNumber forKey:@"brandPhoneNumber"];
  uint64_t v8 = [(NSURL *)self->_url absoluteString];
  [v5 setObject:v8 forKey:@"brandURL"];

  objc_super v9 = PKMerchantCategoryToString(self->_category);
  [v5 setObject:v9 forKey:@"brandCategory"];

  [v5 setObject:self->_detailedCategory forKey:@"brandMapsCategory"];
  uint64_t v10 = [(NSURL *)self->_logoURL absoluteString];
  [v5 setObject:v10 forKey:@"brandLogoURL"];

  [v5 setObject:self->_stylingInfoData forKey:@"brandStylingInfo"];
  if (PKApplePayContainerEnvironment() == 2)
  {
    v11 = [(NSURL *)self->_businessChatURL absoluteString];
    [v5 setObject:v11 forKey:@"brandBusinessChatURL"];

    uint64_t v12 = [(NSURL *)self->_heroImageURL absoluteString];
    [v5 setObject:v12 forKey:@"brandHeroImageURL"];

    [v5 setObject:self->_heroImageAttributionName forKey:@"brandHeroImageAttributionName"];
  }
}

+ (void)deleteFromCloudStoreRecord:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [a1 _deleteDeviceDataFromCloudStoreRecord:a3];
  }
}

+ (void)_deleteDeviceDataFromCloudStoreRecord:(id)a3
{
  v3 = [a3 recordsWithRecordType:@"TransactionDeviceData"];
  id v5 = [v3 firstObject];

  id v4 = [v5 encryptedValues];
  [v4 setObject:0 forKey:@"brandIdentifier"];
  [v4 setObject:0 forKey:@"brandResultProviderIdentifier"];
  [v4 setObject:0 forKey:@"brandName"];
  [v4 setObject:0 forKey:@"brandPhoneNumber"];
  [v4 setObject:0 forKey:@"brandURL"];
  [v4 setObject:0 forKey:@"brandCategory"];
  [v4 setObject:0 forKey:@"brandMapsCategory"];
  [v4 setObject:0 forKey:@"brandLogoURL"];
  [v4 setObject:0 forKey:@"brandStylingInfo"];
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

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKMapsBrand *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKMapsBrand *)self isEqualToMapsBrand:v5];

  return v6;
}

- (BOOL)isEqualToMapsBrand:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[4];
  BOOL v6 = self->_name;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      goto LABEL_25;
    }
    BOOL v10 = [(NSString *)v6 isEqualToString:v7];

    if (!v10) {
      goto LABEL_26;
    }
  }
  v11 = (void *)v4[5];
  BOOL v6 = self->_phoneNumber;
  uint64_t v12 = v11;
  if (v6 == v12)
  {
  }
  else
  {
    uint64_t v8 = v12;
    if (!v6 || !v12) {
      goto LABEL_25;
    }
    BOOL v13 = [(NSString *)v6 isEqualToString:v12];

    if (!v13) {
      goto LABEL_26;
    }
  }
  url = self->_url;
  v15 = (NSURL *)v4[6];
  if (url && v15)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (url != v15)
  {
    goto LABEL_26;
  }
  uint64_t v16 = (void *)v4[8];
  BOOL v6 = self->_detailedCategory;
  v17 = v16;
  if (v6 != v17)
  {
    uint64_t v8 = v17;
    if (v6 && v17)
    {
      BOOL v18 = [(NSString *)v6 isEqualToString:v17];

      if (!v18) {
        goto LABEL_26;
      }
      goto LABEL_29;
    }
LABEL_25:

    goto LABEL_26;
  }

LABEL_29:
  logoURL = self->_logoURL;
  uint64_t v22 = (NSURL *)v4[10];
  if (logoURL && v22)
  {
    if ((-[NSURL isEqual:](logoURL, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (logoURL != v22)
  {
    goto LABEL_26;
  }
  heroImageURL = self->_heroImageURL;
  uint64_t v24 = (NSURL *)v4[11];
  if (heroImageURL && v24)
  {
    if ((-[NSURL isEqual:](heroImageURL, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (heroImageURL != v24)
  {
    goto LABEL_26;
  }
  heroImageAttributionName = self->_heroImageAttributionName;
  v26 = (NSString *)v4[12];
  if (heroImageAttributionName && v26)
  {
    if ((-[NSString isEqual:](heroImageAttributionName, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (heroImageAttributionName != v26)
  {
    goto LABEL_26;
  }
  businessChatURL = self->_businessChatURL;
  v28 = (NSURL *)v4[13];
  if (businessChatURL && v28)
  {
    if ((-[NSURL isEqual:](businessChatURL, "isEqual:") & 1) == 0) {
      goto LABEL_26;
    }
  }
  else if (businessChatURL != v28)
  {
    goto LABEL_26;
  }
  if (self->_category == v4[7] && self->_identifier == v4[3] && self->_resultProviderIdentifier == *((_DWORD *)v4 + 4))
  {
    BOOL v19 = (self->_stylingInfoData != 0) ^ (v4[9] == 0);
    goto LABEL_27;
  }
LABEL_26:
  BOOL v19 = 0;
LABEL_27:

  return v19;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_phoneNumber];
  [v3 safelyAddObject:self->_url];
  [v3 safelyAddObject:self->_detailedCategory];
  [v3 safelyAddObject:self->_logoURL];
  [v3 safelyAddObject:self->_heroImageURL];
  [v3 safelyAddObject:self->_heroImageAttributionName];
  [v3 safelyAddObject:self->_businessChatURL];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_identifier - v4 + 32 * v4;
  uint64_t v6 = self->_resultProviderIdentifier - v5 + 32 * v5;
  unint64_t v7 = self->_category - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = [(PKMapsBrand *)self jsonRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [(NSDate *)self->_lastProcessedDate description];
  [v4 setObject:v5 forKeyedSubscript:@"lastProcessedDate"];

  uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:2 error:0];
  if (v6) {
    unint64_t v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else {
    unint64_t v7 = 0;
  }
  uint64_t v8 = NSString;
  BOOL v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  v11 = [v8 stringWithFormat:@"<%@: %p; %@>", v10, self, v7];

  return v11;
}

- (id)jsonRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = [NSNumber numberWithUnsignedLongLong:self->_identifier];
  [v3 setObject:v4 forKeyedSubscript:@"identifier"];

  unint64_t v5 = [NSNumber numberWithInt:self->_resultProviderIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"resultProviderIdentifier"];

  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:self->_phoneNumber forKeyedSubscript:@"phoneNumber"];
  uint64_t v6 = [(NSURL *)self->_url absoluteString];
  [v3 setObject:v6 forKeyedSubscript:@"url"];

  unint64_t v7 = PKMerchantCategoryToString(self->_category);
  [v3 setObject:v7 forKeyedSubscript:@"category"];

  [v3 setObject:self->_detailedCategory forKeyedSubscript:@"detailedCategory"];
  uint64_t v8 = [(NSURL *)self->_logoURL absoluteString];
  [v3 setObject:v8 forKeyedSubscript:@"logoURL"];

  BOOL v9 = [(NSURL *)self->_heroImageURL absoluteString];
  [v3 setObject:v9 forKeyedSubscript:@"heroImageURL"];

  [v3 setObject:self->_heroImageAttributionName forKeyedSubscript:@"heroImageAttributionName"];
  BOOL v10 = [(NSURL *)self->_businessChatURL absoluteString];
  [v3 setObject:v10 forKeyedSubscript:@"businessChatURL"];

  v11 = [(NSData *)self->_stylingInfoData description];
  [v3 setObject:v11 forKeyedSubscript:@"stylingInfoData"];

  uint64_t v12 = (void *)[v3 copy];
  return v12;
}

- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3
{
  uint64_t v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_33;
  }
  uint64_t v6 = (void *)v4[4];
  unint64_t v7 = self->_name;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    BOOL v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_32;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_33;
    }
  }
  v11 = (void *)*((void *)v5 + 5);
  unint64_t v7 = self->_phoneNumber;
  uint64_t v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    BOOL v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_32;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_33;
    }
  }
  url = self->_url;
  v15 = (NSURL *)*((void *)v5 + 6);
  if (url && v15)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (url != v15)
  {
    goto LABEL_33;
  }
  if (self->_category != *((void *)v5 + 7)
    || self->_identifier != *((void *)v5 + 3)
    || self->_resultProviderIdentifier != *((_DWORD *)v5 + 4))
  {
    goto LABEL_33;
  }
  logoURL = self->_logoURL;
  v17 = (NSURL *)*((void *)v5 + 10);
  if (logoURL && v17)
  {
    if ((-[NSURL isEqual:](logoURL, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (logoURL != v17)
  {
    goto LABEL_33;
  }
  BOOL v18 = (void *)*((void *)v5 + 8);
  unint64_t v7 = self->_detailedCategory;
  BOOL v19 = v18;
  if (v7 != v19)
  {
    BOOL v9 = v19;
    if (v7 && v19)
    {
      BOOL v20 = [(NSString *)v7 isEqualToString:v19];

      if (v20) {
        goto LABEL_55;
      }
LABEL_33:
      int v21 = 0;
      goto LABEL_34;
    }
LABEL_32:

    goto LABEL_33;
  }

LABEL_55:
  stylingInfoData = self->_stylingInfoData;
  v32 = (NSData *)*((void *)v5 + 9);
  if (stylingInfoData && v32) {
    int v21 = -[NSData isEqual:](stylingInfoData, "isEqual:");
  }
  else {
    int v21 = stylingInfoData == v32;
  }
LABEL_34:
  uint64_t v22 = PKApplePayContainerEnvironment();
  if (v22 == 2) {
    char v23 = 0;
  }
  else {
    char v23 = v21;
  }
  if (v22 == 2 && v21)
  {
    businessChatURL = self->_businessChatURL;
    id v25 = (NSURL *)*((void *)v5 + 13);
    if (businessChatURL && v25)
    {
      if ((-[NSURL isEqual:](businessChatURL, "isEqual:") & 1) == 0) {
        goto LABEL_51;
      }
    }
    else if (businessChatURL != v25)
    {
      goto LABEL_51;
    }
    heroImageURL = self->_heroImageURL;
    objc_super v27 = (NSURL *)*((void *)v5 + 11);
    if (heroImageURL && v27)
    {
      if (-[NSURL isEqual:](heroImageURL, "isEqual:"))
      {
LABEL_47:
        heroImageAttributionName = self->_heroImageAttributionName;
        v29 = (NSString *)*((void *)v5 + 12);
        if (heroImageAttributionName && v29) {
          char v23 = -[NSString isEqual:](heroImageAttributionName, "isEqual:");
        }
        else {
          char v23 = heroImageAttributionName == v29;
        }
        goto LABEL_52;
      }
    }
    else if (heroImageURL == v27)
    {
      goto LABEL_47;
    }
LABEL_51:
    char v23 = 0;
  }
LABEL_52:

  return v23;
}

- (BOOL)hasCloudArchivableDeviceData
{
  BOOL v3 = self->_identifier
    || self->_resultProviderIdentifier > 0
    || self->_name
    || self->_phoneNumber
    || self->_url
    || self->_category
    || self->_detailedCategory
    || self->_logoURL
    || self->_stylingInfoData != 0;
  uint64_t v4 = PKApplePayContainerEnvironment();
  BOOL v5 = v4 == 2;
  BOOL result = v4 == 2 || v3;
  if (v5 && !v3) {
    return self->_businessChatURL || self->_heroImageURL || self->_heroImageAttributionName != 0;
  }
  return result;
}

- (void)setStylingInfoData:(id)a3
{
  objc_storeStrong((id *)&self->_stylingInfoData, a3);
  id v6 = a3;
  lazyStylingInfo = self->_lazyStylingInfo;
  self->_lazyStylingInfo = 0;
}

- (id)stylingInfo
{
  lazyStylingInfo = self->_lazyStylingInfo;
  if (lazyStylingInfo) {
    goto LABEL_4;
  }
  if (self->_stylingInfoData)
  {
    uint64_t v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:getMKWalletMerchantStylingInfoClass[0]() fromData:self->_stylingInfoData error:0];
    BOOL v5 = self->_lazyStylingInfo;
    self->_lazyStylingInfo = v4;

    lazyStylingInfo = self->_lazyStylingInfo;
LABEL_4:
    id v6 = lazyStylingInfo;
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_5:
  return v6;
}

- (BOOL)isValid
{
  return self->_identifier && [(NSString *)self->_name length] != 0;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (int)resultProviderIdentifier
{
  return self->_resultProviderIdentifier;
}

- (void)setResultProviderIdentifier:(int)a3
{
  self->_resultProviderIdentifier = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (NSString)detailedCategory
{
  return self->_detailedCategory;
}

- (void)setDetailedCategory:(id)a3
{
}

- (NSData)stylingInfoData
{
  return self->_stylingInfoData;
}

- (NSURL)logoURL
{
  return self->_logoURL;
}

- (void)setLogoURL:(id)a3
{
}

- (NSURL)heroImageURL
{
  return self->_heroImageURL;
}

- (void)setHeroImageURL:(id)a3
{
}

- (NSString)heroImageAttributionName
{
  return self->_heroImageAttributionName;
}

- (void)setHeroImageAttributionName:(id)a3
{
}

- (NSURL)businessChatURL
{
  return self->_businessChatURL;
}

- (void)setBusinessChatURL:(id)a3
{
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_businessChatURL, 0);
  objc_storeStrong((id *)&self->_heroImageAttributionName, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_logoURL, 0);
  objc_storeStrong((id *)&self->_stylingInfoData, 0);
  objc_storeStrong((id *)&self->_detailedCategory, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lazyStylingInfo, 0);
}

@end