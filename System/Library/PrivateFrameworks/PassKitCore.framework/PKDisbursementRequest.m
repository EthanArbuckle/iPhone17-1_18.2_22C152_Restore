@interface PKDisbursementRequest
+ (BOOL)supportsSecureCoding;
+ (NSError)disbursementCardUnsupportedError;
+ (NSError)disbursementContactInvalidErrorWithContactField:(PKContactField)field localizedDescription:(NSString *)localizedDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDisbursementRequest:(id)a3;
- (NSArray)requiredRecipientContactFields;
- (NSArray)summaryItems;
- (NSArray)supportedNetworks;
- (NSArray)supportedRegions;
- (NSData)applicationData;
- (NSString)currencyCode;
- (NSString)merchantIdentifier;
- (NSString)regionCode;
- (PKContact)recipientContact;
- (PKDisbursementRequest)init;
- (PKDisbursementRequest)initWithCoder:(id)a3;
- (PKDisbursementRequest)initWithMerchantIdentifier:(NSString *)merchantIdentifier currencyCode:(NSString *)currencyCode regionCode:(NSString *)regionCode supportedNetworks:(NSArray *)supportedNetworks merchantCapabilities:(PKMerchantCapability)merchantCapabilities summaryItems:(NSArray *)summaryItems;
- (PKMerchantCapability)merchantCapabilities;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationData:(NSData *)applicationData;
- (void)setCurrencyCode:(NSString *)currencyCode;
- (void)setMerchantCapabilities:(PKMerchantCapability)merchantCapabilities;
- (void)setMerchantIdentifier:(NSString *)merchantIdentifier;
- (void)setRecipientContact:(PKContact *)recipientContact;
- (void)setRegionCode:(NSString *)regionCode;
- (void)setRequiredRecipientContactFields:(NSArray *)requiredRecipientContactFields;
- (void)setSummaryItems:(NSArray *)summaryItems;
- (void)setSupportedNetworks:(NSArray *)supportedNetworks;
- (void)setSupportedRegions:(NSArray *)supportedRegions;
@end

@implementation PKDisbursementRequest

- (PKDisbursementRequest)initWithMerchantIdentifier:(NSString *)merchantIdentifier currencyCode:(NSString *)currencyCode regionCode:(NSString *)regionCode supportedNetworks:(NSArray *)supportedNetworks merchantCapabilities:(PKMerchantCapability)merchantCapabilities summaryItems:(NSArray *)summaryItems
{
  v14 = merchantIdentifier;
  v15 = currencyCode;
  v16 = regionCode;
  v17 = supportedNetworks;
  v18 = summaryItems;
  v31.receiver = self;
  v31.super_class = (Class)PKDisbursementRequest;
  v19 = [(PKDisbursementRequest *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [(NSString *)v14 copy];
    v21 = v19->_merchantIdentifier;
    v19->_merchantIdentifier = (NSString *)v20;

    uint64_t v22 = [(NSString *)v15 copy];
    v23 = v19->_currencyCode;
    v19->_currencyCode = (NSString *)v22;

    uint64_t v24 = [(NSString *)v16 copy];
    v25 = v19->_regionCode;
    v19->_regionCode = (NSString *)v24;

    uint64_t v26 = [(NSArray *)v17 copy];
    v27 = v19->_supportedNetworks;
    v19->_supportedNetworks = (NSArray *)v26;

    v19->_merchantCapabilities = merchantCapabilities;
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v18 copyItems:1];
    v29 = v19->_summaryItems;
    v19->_summaryItems = (NSArray *)v28;
  }
  return v19;
}

- (PKDisbursementRequest)init
{
  return [(PKDisbursementRequest *)self initWithMerchantIdentifier:&stru_1EE0F5368 currencyCode:&stru_1EE0F5368 regionCode:&stru_1EE0F5368 supportedNetworks:MEMORY[0x1E4F1CBF0] merchantCapabilities:0 summaryItems:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self || -[PKDisbursementRequest isEqualToDisbursementRequest:](self, "isEqualToDisbursementRequest:");
}

- (BOOL)isEqualToDisbursementRequest:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_32;
  }
  v5 = (void *)v4[1];
  v6 = self->_merchantIdentifier;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (!v6 || !v7) {
      goto LABEL_31;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_32;
    }
  }
  v10 = (void *)v4[2];
  v6 = self->_regionCode;
  v11 = v10;
  if (v6 == v11)
  {
  }
  else
  {
    v8 = v11;
    if (!v6 || !v11) {
      goto LABEL_31;
    }
    BOOL v12 = [(NSString *)v6 isEqualToString:v11];

    if (!v12) {
      goto LABEL_32;
    }
  }
  supportedNetworks = self->_supportedNetworks;
  v14 = (NSArray *)v4[3];
  if (supportedNetworks && v14)
  {
    if ((-[NSArray isEqual:](supportedNetworks, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (supportedNetworks != v14)
  {
    goto LABEL_32;
  }
  if (self->_merchantCapabilities != v4[4]) {
    goto LABEL_32;
  }
  summaryItems = self->_summaryItems;
  v16 = (NSArray *)v4[5];
  if (summaryItems && v16)
  {
    if ((-[NSArray isEqual:](summaryItems, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (summaryItems != v16)
  {
    goto LABEL_32;
  }
  v17 = (void *)v4[6];
  v6 = self->_currencyCode;
  v18 = v17;
  if (v6 == v18)
  {

    goto LABEL_35;
  }
  v8 = v18;
  if (!v6 || !v18)
  {
LABEL_31:

    goto LABEL_32;
  }
  BOOL v19 = [(NSString *)v6 isEqualToString:v18];

  if (!v19) {
    goto LABEL_32;
  }
LABEL_35:
  requiredRecipientContactFields = self->_requiredRecipientContactFields;
  v23 = (NSArray *)v4[7];
  if (requiredRecipientContactFields && v23)
  {
    if ((-[NSArray isEqual:](requiredRecipientContactFields, "isEqual:") & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (requiredRecipientContactFields != v23)
  {
    goto LABEL_32;
  }
  recipientContact = self->_recipientContact;
  v25 = (PKContact *)v4[8];
  if (recipientContact && v25)
  {
    if (!-[PKContact isEqual:](recipientContact, "isEqual:")) {
      goto LABEL_32;
    }
  }
  else if (recipientContact != v25)
  {
    goto LABEL_32;
  }
  supportedRegions = self->_supportedRegions;
  v27 = (NSArray *)v4[9];
  if (supportedRegions && v27)
  {
    if (-[NSArray isEqual:](supportedRegions, "isEqual:")) {
      goto LABEL_50;
    }
LABEL_32:
    char v20 = 0;
    goto LABEL_33;
  }
  if (supportedRegions != v27) {
    goto LABEL_32;
  }
LABEL_50:
  applicationData = self->_applicationData;
  v29 = (NSData *)v4[10];
  if (applicationData && v29) {
    char v20 = -[NSData isEqual:](applicationData, "isEqual:");
  }
  else {
    char v20 = applicationData == v29;
  }
LABEL_33:

  return v20;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_merchantIdentifier];
  [v3 safelyAddObject:self->_regionCode];
  [v3 safelyAddObject:self->_supportedNetworks];
  [v3 safelyAddObject:self->_summaryItems];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_requiredRecipientContactFields];
  [v3 safelyAddObject:self->_recipientContact];
  [v3 safelyAddObject:self->_supportedRegions];
  [v3 safelyAddObject:self->_applicationData];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_merchantCapabilities - v4 + 32 * v4;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKDisbursementRequest allocWithZone:](PKDisbursementRequest, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_merchantIdentifier copyWithZone:a3];
  merchantIdentifier = v5->_merchantIdentifier;
  v5->_merchantIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_regionCode copyWithZone:a3];
  regionCode = v5->_regionCode;
  v5->_regionCode = (NSString *)v8;

  uint64_t v10 = [(NSArray *)self->_supportedNetworks copyWithZone:a3];
  supportedNetworks = v5->_supportedNetworks;
  v5->_supportedNetworks = (NSArray *)v10;

  v5->_merchantCapabilities = self->_merchantCapabilities;
  uint64_t v12 = [(NSArray *)self->_summaryItems copyWithZone:a3];
  summaryItems = v5->_summaryItems;
  v5->_summaryItems = (NSArray *)v12;

  uint64_t v14 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v14;

  uint64_t v16 = [(NSArray *)self->_requiredRecipientContactFields copyWithZone:a3];
  requiredRecipientContactFields = v5->_requiredRecipientContactFields;
  v5->_requiredRecipientContactFields = (NSArray *)v16;

  v18 = [(PKContact *)self->_recipientContact copyWithZone:a3];
  recipientContact = v5->_recipientContact;
  v5->_recipientContact = v18;

  uint64_t v20 = [(NSArray *)self->_supportedRegions copyWithZone:a3];
  supportedRegions = v5->_supportedRegions;
  v5->_supportedRegions = (NSArray *)v20;

  uint64_t v22 = [(NSData *)self->_applicationData copyWithZone:a3];
  applicationData = v5->_applicationData;
  v5->_applicationData = (NSData *)v22;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDisbursementRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PKDisbursementRequest;
  unint64_t v5 = [(PKDisbursementRequest *)&v37 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionCode"];
    regionCode = v5->_regionCode;
    v5->_regionCode = (NSString *)v8;

    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"supportedNetworks"];
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSArray *)v13;

    v5->_merchantCapabilities = [v4 decodeIntegerForKey:@"merchantCapabilities"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"summaryItems"];
    summaryItems = v5->_summaryItems;
    v5->_summaryItems = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v20;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"requiredRecipientContactFields"];
    requiredRecipientContactFields = v5->_requiredRecipientContactFields;
    v5->_requiredRecipientContactFields = (NSArray *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientContact"];
    recipientContact = v5->_recipientContact;
    v5->_recipientContact = (PKContact *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    objc_super v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"supportedRegions"];
    supportedRegions = v5->_supportedRegions;
    v5->_supportedRegions = (NSArray *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationData"];
    applicationData = v5->_applicationData;
    v5->_applicationData = (NSData *)v34;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  merchantIdentifier = self->_merchantIdentifier;
  id v5 = a3;
  [v5 encodeObject:merchantIdentifier forKey:@"merchantIdentifier"];
  [v5 encodeObject:self->_regionCode forKey:@"regionCode"];
  [v5 encodeObject:self->_supportedNetworks forKey:@"supportedNetworks"];
  [v5 encodeInteger:self->_merchantCapabilities forKey:@"merchantCapabilities"];
  [v5 encodeObject:self->_summaryItems forKey:@"summaryItems"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_requiredRecipientContactFields forKey:@"requiredRecipientContactFields"];
  [v5 encodeObject:self->_recipientContact forKey:@"recipientContact"];
  [v5 encodeObject:self->_supportedRegions forKey:@"supportedRegions"];
  [v5 encodeObject:self->_applicationData forKey:@"applicationData"];
}

+ (NSError)disbursementContactInvalidErrorWithContactField:(PKContactField)field localizedDescription:(NSString *)localizedDescription
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F28C58];
  uint64_t v6 = localizedDescription;
  v7 = field;
  id v8 = [v5 alloc];
  v13[0] = *MEMORY[0x1E4F28568];
  v13[1] = @"PKDisbursementErrorContactField";
  BOOL v9 = &stru_1EE0F5368;
  if (v6) {
    BOOL v9 = (__CFString *)v6;
  }
  v14[0] = v9;
  v14[1] = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  uint64_t v11 = (void *)[v8 initWithDomain:@"PKDisbursementErrorDomain" code:2 userInfo:v10];
  return (NSError *)v11;
}

+ (NSError)disbursementCardUnsupportedError
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = &stru_1EE0F5368;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = (void *)[v2 initWithDomain:@"PKDisbursementErrorDomain" code:1 userInfo:v3];

  return (NSError *)v4;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (void)setRegionCode:(NSString *)regionCode
{
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void)setSupportedNetworks:(NSArray *)supportedNetworks
{
}

- (PKMerchantCapability)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(PKMerchantCapability)merchantCapabilities
{
  self->_merchantCapabilities = merchantCapabilities;
}

- (NSArray)summaryItems
{
  return self->_summaryItems;
}

- (void)setSummaryItems:(NSArray *)summaryItems
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(NSString *)currencyCode
{
}

- (NSArray)requiredRecipientContactFields
{
  return self->_requiredRecipientContactFields;
}

- (void)setRequiredRecipientContactFields:(NSArray *)requiredRecipientContactFields
{
}

- (PKContact)recipientContact
{
  return self->_recipientContact;
}

- (void)setRecipientContact:(PKContact *)recipientContact
{
}

- (NSArray)supportedRegions
{
  return self->_supportedRegions;
}

- (void)setSupportedRegions:(NSArray *)supportedRegions
{
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(NSData *)applicationData
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_supportedRegions, 0);
  objc_storeStrong((id *)&self->_recipientContact, 0);
  objc_storeStrong((id *)&self->_requiredRecipientContactFields, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_summaryItems, 0);
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end