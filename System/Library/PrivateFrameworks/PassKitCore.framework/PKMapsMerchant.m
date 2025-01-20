@interface PKMapsMerchant
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (void)_deleteDeviceDataFromCloudStoreRecord:(id)a3;
+ (void)deleteFromCloudStoreRecord:(id)a3 codingType:(unint64_t)a4;
- (BOOL)hasCloudArchivableDeviceData;
- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMapsMerchant:(id)a3;
- (BOOL)isValid;
- (CLLocation)location;
- (CNPostalAddress)postalAddress;
- (NSData)stylingInfoData;
- (NSDate)lastProcessedDate;
- (NSString)detailedCategory;
- (NSString)heroImageAttributionName;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)businessChatURL;
- (NSURL)heroImageURL;
- (NSURL)url;
- (PKMapsMerchant)initWithCloudStoreCoder:(id)a3;
- (PKMapsMerchant)initWithCoder:(id)a3;
- (double)locationLatitude;
- (double)locationLongitude;
- (id)_jsonEncodedPostalAddressString;
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
- (void)setLocation:(id)a3;
- (void)setLocationLatitude:(double)a3;
- (void)setLocationLongitude:(double)a3;
- (void)setName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPostalAddress:(id)a3;
- (void)setResultProviderIdentifier:(int)a3;
- (void)setStylingInfoData:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation PKMapsMerchant

- (id)jsonRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithUnsignedLongLong:self->_identifier];
  [v3 setObject:v4 forKeyedSubscript:@"identifier"];

  v5 = [NSNumber numberWithInt:self->_resultProviderIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"resultProviderIdentifier"];

  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:self->_phoneNumber forKeyedSubscript:@"phoneNumber"];
  v6 = [(NSURL *)self->_url absoluteString];
  [v3 setObject:v6 forKeyedSubscript:@"url"];

  v7 = [NSNumber numberWithDouble:self->_locationLatitude];
  [v3 setObject:v7 forKeyedSubscript:@"locationLatitude"];

  v8 = [NSNumber numberWithDouble:self->_locationLongitude];
  [v3 setObject:v8 forKeyedSubscript:@"locationLongitude"];

  v9 = [(NSURL *)self->_heroImageURL absoluteString];
  [v3 setObject:v9 forKeyedSubscript:@"heroImageURL"];

  [v3 setObject:self->_heroImageAttributionName forKeyedSubscript:@"heroImageAttributionName"];
  v10 = PKMerchantCategoryToString(self->_category);
  [v3 setObject:v10 forKeyedSubscript:@"category"];

  [v3 setObject:self->_detailedCategory forKeyedSubscript:@"detailedCategory"];
  v11 = [(NSURL *)self->_businessChatURL absoluteString];
  [v3 setObject:v11 forKeyedSubscript:@"businessChatURL"];

  v12 = [(NSData *)self->_stylingInfoData description];
  [v3 setObject:v12 forKeyedSubscript:@"stylingInfo"];

  v13 = (void *)[v3 copy];
  return v13;
}

- (BOOL)isCloudArchivableDeviceDataEqual:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if (!v4 || self->_identifier != v4[3] || self->_resultProviderIdentifier != *((_DWORD *)v4 + 4)) {
    goto LABEL_46;
  }
  v6 = (void *)v4[4];
  v7 = self->_name;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_45;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_46;
    }
  }
  v11 = (void *)*((void *)v5 + 5);
  v7 = self->_phoneNumber;
  v12 = v11;
  if (v7 == v12)
  {
  }
  else
  {
    v9 = v12;
    if (!v7 || !v12) {
      goto LABEL_45;
    }
    BOOL v13 = [(NSString *)v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_46;
    }
  }
  url = self->_url;
  v15 = (NSURL *)*((void *)v5 + 6);
  if (url && v15)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (url != v15)
  {
    goto LABEL_46;
  }
  if (self->_locationLatitude != *((double *)v5 + 7) || self->_locationLongitude != *((double *)v5 + 8)) {
    goto LABEL_46;
  }
  postalAddress = self->_postalAddress;
  v17 = (CNPostalAddress *)*((void *)v5 + 9);
  if (postalAddress && v17)
  {
    if ((-[CNPostalAddress isEqual:](postalAddress, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (postalAddress != v17)
  {
    goto LABEL_46;
  }
  heroImageURL = self->_heroImageURL;
  v19 = (NSURL *)*((void *)v5 + 10);
  if (heroImageURL && v19)
  {
    if ((-[NSURL isEqual:](heroImageURL, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (heroImageURL != v19)
  {
    goto LABEL_46;
  }
  v20 = (void *)*((void *)v5 + 11);
  v7 = self->_heroImageAttributionName;
  v21 = v20;
  if (v7 == v21)
  {
  }
  else
  {
    v9 = v21;
    if (!v7 || !v21) {
      goto LABEL_45;
    }
    BOOL v22 = [(NSString *)v7 isEqualToString:v21];

    if (!v22) {
      goto LABEL_46;
    }
  }
  if (self->_category != *((void *)v5 + 12)) {
    goto LABEL_46;
  }
  v23 = (void *)*((void *)v5 + 13);
  v7 = self->_detailedCategory;
  v24 = v23;
  if (v7 == v24)
  {

    goto LABEL_49;
  }
  v9 = v24;
  if (!v7 || !v24)
  {
LABEL_45:

    goto LABEL_46;
  }
  BOOL v25 = [(NSString *)v7 isEqualToString:v24];

  if (!v25) {
    goto LABEL_46;
  }
LABEL_49:
  stylingInfoData = self->_stylingInfoData;
  v29 = (NSData *)*((void *)v5 + 14);
  if (stylingInfoData && v29)
  {
    if (-[NSData isEqual:](stylingInfoData, "isEqual:")) {
      goto LABEL_54;
    }
LABEL_46:
    char v26 = 0;
    goto LABEL_47;
  }
  if (stylingInfoData != v29) {
    goto LABEL_46;
  }
LABEL_54:
  businessChatURL = self->_businessChatURL;
  v31 = (NSURL *)*((void *)v5 + 15);
  if (businessChatURL && v31) {
    char v26 = -[NSURL isEqual:](businessChatURL, "isEqual:");
  }
  else {
    char v26 = businessChatURL == v31;
  }
LABEL_47:

  return v26;
}

- (BOOL)hasCloudArchivableDeviceData
{
  BOOL result = self->_identifier
        || self->_resultProviderIdentifier > 0
        || self->_name
        || self->_phoneNumber
        || self->_url
        || (CLLocationCoordinate2D v4 = CLLocationCoordinate2DMake(self->_locationLatitude, self->_locationLongitude),
            CLLocationCoordinate2DIsValid(v4))
        || self->_postalAddress
        || self->_heroImageURL
        || self->_heroImageAttributionName
        || self->_category
        || self->_detailedCategory
        || self->_stylingInfoData
        || self->_businessChatURL != 0;
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
    CLLocationCoordinate2D v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:getMKWalletMerchantStylingInfoClass_1[0]() fromData:self->_stylingInfoData error:0];
    id v5 = self->_lazyStylingInfo;
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

- (CLLocation)location
{
  CLLocationCoordinate2D v8 = CLLocationCoordinate2DMake(self->_locationLatitude, self->_locationLongitude);
  double latitude = v8.latitude;
  double longitude = v8.longitude;
  if (!CLLocationCoordinate2DIsValid(v8) || self->_locationLatitude == 0.0 && self->_locationLongitude == 0.0) {
    id v5 = 0;
  }
  else {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
  }
  return (CLLocation *)v5;
}

- (void)setLocation:(id)a3
{
  [a3 coordinate];
  double latitude = v6.latitude;
  double longitude = v6.longitude;
  if (CLLocationCoordinate2DIsValid(v6))
  {
    self->_locationLatitude = latitude;
    self->_locationLongitude = longitude;
  }
}

- (BOOL)isValid
{
  return self->_identifier && [(NSString *)self->_name length] != 0;
}

- (PKMapsMerchant)initWithCloudStoreCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMapsMerchant;
  id v5 = [(PKMapsMerchant *)&v9 init];
  CLLocationCoordinate2D v6 = v5;
  if (v5) {
    [(PKMapsMerchant *)v5 applyPropertiesFromCloudStoreRecord:v4];
  }
  if ([(PKMapsMerchant *)v6 isValid]) {
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
  id v27 = [v4 firstObject];

  id v5 = v27;
  if (v27)
  {
    self->_identifier = objc_msgSend(v27, "pk_encryptedUint64ForKey:", @"merchantMapsIdentifier");
    self->_resultProviderIdentifier = objc_msgSend(v27, "pk_encryptedIntForKey:", @"merchantResultProviderIdentifier");
    objc_msgSend(v27, "pk_encryptedStringForKey:", @"merchantMapsName");
    CLLocationCoordinate2D v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v6;

    objc_msgSend(v27, "pk_encryptedUrlForKey:", @"merchantBusinessChatURL");
    CLLocationCoordinate2D v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    businessChatURL = self->_businessChatURL;
    self->_businessChatURL = v8;

    BOOL v10 = objc_msgSend(v27, "pk_encryptedLocationForKey:", @"merchantLocation");
    [v10 coordinate];
    self->_locationLatitude = v11;
    self->_locationLongitude = v12;
    if (!self->_phoneNumber)
    {
      objc_msgSend(v27, "pk_encryptedStringForKey:", @"merchantPhoneNumber");
      BOOL v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      phoneNumber = self->_phoneNumber;
      self->_phoneNumber = v13;
    }
    if (!self->_url)
    {
      objc_msgSend(v27, "pk_encryptedUrlForKey:", @"merchantURL");
      v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
      url = self->_url;
      self->_url = v15;
    }
    if (!self->_postalAddress)
    {
      objc_msgSend(v27, "pk_encryptedDictionaryForKey:", @"merchantPostalAddress");
      v17 = (CNPostalAddress *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        v17 = [MEMORY[0x1E4F1BA80] postalAddressWithDictionaryRepresentation:v17];
      }
      postalAddress = self->_postalAddress;
      self->_postalAddress = v17;
    }
    if (!self->_heroImageURL)
    {
      objc_msgSend(v27, "pk_encryptedUrlForKey:", @"merchantHeroImageURL");
      v20 = (NSURL *)objc_claimAutoreleasedReturnValue();
      heroImageURL = self->_heroImageURL;
      self->_heroImageURL = v20;
    }
    if (!self->_heroImageAttributionName)
    {
      objc_msgSend(v27, "pk_encryptedStringForKey:", @"merchantHeroImageAttributionName");
      BOOL v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      heroImageAttributionName = self->_heroImageAttributionName;
      self->_heroImageAttributionName = v22;
    }
    if (!self->_category)
    {
      v24 = objc_msgSend(v27, "pk_encryptedStringForKey:", @"merchantCategory");
      self->_category = PKMerchantCategoryFromString(v24);
    }
    if (!self->_stylingInfoData)
    {
      objc_msgSend(v27, "pk_encryptedDataForKey:", @"merchantStylingInfo");
      BOOL v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      stylingInfoData = self->_stylingInfoData;
      self->_stylingInfoData = v25;
    }
    id v5 = v27;
  }
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    [(PKMapsMerchant *)self _encodeDeviceDataForCloudStoreCoder:a3];
  }
}

- (void)_encodeDeviceDataForCloudStoreCoder:(id)a3
{
  id v4 = [a3 recordsWithRecordType:@"TransactionDeviceData"];
  id v14 = [v4 firstObject];

  id v5 = [v14 encryptedValues];
  CLLocationCoordinate2D v6 = [NSNumber numberWithLongLong:self->_identifier];
  [v5 setObject:v6 forKey:@"merchantMapsIdentifier"];

  v7 = [NSNumber numberWithInt:self->_resultProviderIdentifier];
  [v5 setObject:v7 forKey:@"merchantResultProviderIdentifier"];

  [v5 setObject:self->_name forKey:@"merchantMapsName"];
  [v5 setObject:self->_phoneNumber forKey:@"merchantPhoneNumber"];
  CLLocationCoordinate2D v8 = [(NSURL *)self->_url absoluteString];
  [v5 setObject:v8 forKey:@"merchantURL"];

  objc_super v9 = [(PKMapsMerchant *)self location];
  [v5 setObject:v9 forKey:@"merchantLocation"];

  BOOL v10 = [(PKMapsMerchant *)self _jsonEncodedPostalAddressString];
  [v5 setObject:v10 forKey:@"merchantPostalAddress"];

  double v11 = [(NSURL *)self->_heroImageURL absoluteString];
  [v5 setObject:v11 forKey:@"merchantHeroImageURL"];

  double v12 = PKMerchantCategoryToString(self->_category);
  [v5 setObject:v12 forKey:@"merchantCategory"];

  [v5 setObject:self->_detailedCategory forKey:@"merchantMapsCategory"];
  [v5 setObject:self->_heroImageAttributionName forKey:@"merchantHeroImageAttributionName"];
  [v5 setObject:self->_stylingInfoData forKey:@"merchantStylingInfo"];
  if (PKApplePayContainerEnvironment() == 2)
  {
    BOOL v13 = [(NSURL *)self->_businessChatURL absoluteString];
    [v5 setObject:v13 forKey:@"merchantBusinessChatURL"];
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
  id v3 = [a3 recordsWithRecordType:@"TransactionDeviceData"];
  id v5 = [v3 firstObject];

  id v4 = [v5 encryptedValues];
  [v4 setObject:0 forKey:@"merchantMapsIdentifier"];
  [v4 setObject:0 forKey:@"merchantResultProviderIdentifier"];
  [v4 setObject:0 forKey:@"merchantMapsName"];
  [v4 setObject:0 forKey:@"merchantPhoneNumber"];
  [v4 setObject:0 forKey:@"merchantURL"];
  [v4 setObject:0 forKey:@"merchantLocation"];
  [v4 setObject:0 forKey:@"merchantPostalAddress"];
  [v4 setObject:0 forKey:@"merchantHeroImageURL"];
  [v4 setObject:0 forKey:@"merchantCategory"];
  [v4 setObject:0 forKey:@"merchantMapsCategory"];
  [v4 setObject:0 forKey:@"merchantHeroImageAttributionName"];
  [v4 setObject:0 forKey:@"merchantStylingInfo"];
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKMapsMerchant)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKMapsMerchant;
  id v5 = [(PKMapsMerchant *)&v29 init];
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

    [v4 decodeDoubleForKey:@"locationLatitude"];
    v5->_locationLatitude = v12;
    [v4 decodeDoubleForKey:@"locationLongitude"];
    v5->_locationLongitude = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"postalAddress"];
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heroImageURL"];
    heroImageURL = v5->_heroImageURL;
    v5->_heroImageURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantHeroImageAttributionName"];
    heroImageAttributionName = v5->_heroImageAttributionName;
    v5->_heroImageAttributionName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantStylingInfo"];
    stylingInfoData = v5->_stylingInfoData;
    v5->_stylingInfoData = (NSData *)v20;

    v5->_category = [v4 decodeIntegerForKey:@"merchantCategory"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantMapsCategory"];
    detailedCategory = v5->_detailedCategory;
    v5->_detailedCategory = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantBusinessChatURL"];
    businessChatURL = v5->_businessChatURL;
    v5->_businessChatURL = (NSURL *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastProcessedDate"];
    lastProcessedDate = v5->_lastProcessedDate;
    v5->_lastProcessedDate = (NSDate *)v26;
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
  [v5 encodeDouble:@"locationLatitude" forKey:self->_locationLatitude];
  [v5 encodeDouble:@"locationLongitude" forKey:self->_locationLongitude];
  [v5 encodeObject:self->_postalAddress forKey:@"postalAddress"];
  [v5 encodeObject:self->_heroImageURL forKey:@"heroImageURL"];
  [v5 encodeObject:self->_heroImageAttributionName forKey:@"merchantHeroImageAttributionName"];
  [v5 encodeObject:self->_stylingInfoData forKey:@"merchantStylingInfo"];
  [v5 encodeInteger:self->_category forKey:@"merchantCategory"];
  [v5 encodeObject:self->_detailedCategory forKey:@"merchantMapsCategory"];
  [v5 encodeObject:self->_businessChatURL forKey:@"merchantBusinessChatURL"];
  [v5 encodeObject:self->_lastProcessedDate forKey:@"lastProcessedDate"];
}

- (id)description
{
  id v3 = [(PKMapsMerchant *)self jsonRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(NSDate *)self->_lastProcessedDate description];
  [v4 setObject:v5 forKeyedSubscript:@"lastProcessedDate"];

  uint64_t v6 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:2 error:0];
  if (v6) {
    v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else {
    v7 = 0;
  }
  uint64_t v8 = NSString;
  objc_super v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  double v11 = [v8 stringWithFormat:@"<%@: %p; %@>", v10, self, v7];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKMapsMerchant *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKMapsMerchant *)self isEqualToMapsMerchant:v5];

  return v6;
}

- (BOOL)isEqualToMapsMerchant:(id)a3
{
  id v4 = a3;
  name = self->_name;
  BOOL v6 = (NSString *)v4[4];
  if (name) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (name != v6) {
      goto LABEL_41;
    }
  }
  else
  {
    char v8 = -[NSString isEqual:](name, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_41;
    }
  }
  phoneNumber = self->_phoneNumber;
  uint64_t v10 = (NSString *)v4[5];
  if (phoneNumber && v10)
  {
    if ((-[NSString isEqual:](phoneNumber, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (phoneNumber != v10)
  {
    goto LABEL_41;
  }
  url = self->_url;
  double v12 = (NSURL *)v4[6];
  if (url && v12)
  {
    if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (url != v12)
  {
    goto LABEL_41;
  }
  postalAddress = self->_postalAddress;
  uint64_t v14 = (CNPostalAddress *)v4[9];
  if (postalAddress && v14)
  {
    if ((-[CNPostalAddress isEqual:](postalAddress, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (postalAddress != v14)
  {
    goto LABEL_41;
  }
  heroImageURL = self->_heroImageURL;
  uint64_t v16 = (NSURL *)v4[10];
  if (heroImageURL && v16)
  {
    if ((-[NSURL isEqual:](heroImageURL, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (heroImageURL != v16)
  {
    goto LABEL_41;
  }
  v17 = (void *)v4[13];
  uint64_t v18 = self->_detailedCategory;
  v19 = v17;
  if (v18 == v19)
  {
  }
  else
  {
    uint64_t v20 = v19;
    if (!v18 || !v19) {
      goto LABEL_40;
    }
    BOOL v21 = [(NSString *)v18 isEqualToString:v19];

    if (!v21) {
      goto LABEL_41;
    }
  }
  uint64_t v22 = (void *)v4[11];
  uint64_t v18 = self->_heroImageAttributionName;
  v23 = v22;
  if (v18 != v23)
  {
    uint64_t v20 = v23;
    if (v18 && v23)
    {
      BOOL v24 = [(NSString *)v18 isEqualToString:v23];

      if (!v24) {
        goto LABEL_41;
      }
      goto LABEL_44;
    }
LABEL_40:

    goto LABEL_41;
  }

LABEL_44:
  businessChatURL = self->_businessChatURL;
  v28 = (NSURL *)v4[15];
  if (businessChatURL && v28)
  {
    if ((-[NSURL isEqual:](businessChatURL, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (businessChatURL != v28)
  {
    goto LABEL_41;
  }
  if (self->_category == v4[12]
    && self->_identifier == v4[3]
    && self->_resultProviderIdentifier == *((_DWORD *)v4 + 4)
    && self->_locationLatitude == *((double *)v4 + 7)
    && self->_locationLongitude == *((double *)v4 + 8))
  {
    BOOL v25 = (self->_stylingInfoData != 0) ^ (v4[14] == 0);
    goto LABEL_42;
  }
LABEL_41:
  BOOL v25 = 0;
LABEL_42:

  return v25;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_name];
  [v3 safelyAddObject:self->_phoneNumber];
  [v3 safelyAddObject:self->_url];
  [v3 safelyAddObject:self->_postalAddress];
  [v3 safelyAddObject:self->_heroImageURL];
  [v3 safelyAddObject:self->_heroImageAttributionName];
  [v3 safelyAddObject:self->_detailedCategory];
  [v3 safelyAddObject:self->_businessChatURL];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_identifier - v4 + 32 * v4;
  uint64_t v6 = self->_resultProviderIdentifier - v5 + 32 * v5;
  unint64_t v7 = (unint64_t)self->_locationLatitude - v6 + 32 * v6;
  unint64_t v8 = (unint64_t)self->_locationLongitude - v7 + 32 * v7;
  unint64_t v9 = self->_category - v8 + 32 * v8;

  return v9;
}

- (id)_jsonEncodedPostalAddressString
{
  v2 = [(CNPostalAddress *)self->_postalAddress dictionaryRepresentation];
  if (v2
    && ([MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v4 = (void *)v3;
    unint64_t v5 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
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

- (double)locationLatitude
{
  return self->_locationLatitude;
}

- (void)setLocationLatitude:(double)a3
{
  self->_locationLatitude = a3;
}

- (double)locationLongitude
{
  return self->_locationLongitude;
}

- (void)setLocationLongitude:(double)a3
{
  self->_locationLongitude = a3;
}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (void)setPostalAddress:(id)a3
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
  objc_storeStrong((id *)&self->_stylingInfoData, 0);
  objc_storeStrong((id *)&self->_detailedCategory, 0);
  objc_storeStrong((id *)&self->_heroImageAttributionName, 0);
  objc_storeStrong((id *)&self->_heroImageURL, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lazyStylingInfo, 0);
}

@end