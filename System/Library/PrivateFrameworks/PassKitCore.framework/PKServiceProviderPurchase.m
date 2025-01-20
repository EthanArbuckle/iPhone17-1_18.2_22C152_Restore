@interface PKServiceProviderPurchase
+ (BOOL)supportsSecureCoding;
+ (PKServiceProviderPurchase)purchaseWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServiceProviderPurchase:(id)a3;
- (NSArray)actions;
- (NSDate)purchaseDate;
- (NSString)deviceIdentifier;
- (NSString)identifier;
- (NSString)partnerMetadata;
- (NSString)regionIdentifier;
- (NSString)serviceProviderIdentifier;
- (NSString)signature;
- (NSString)visibleTransactionIdentifier;
- (PKServiceProviderPurchase)initWithCoder:(id)a3;
- (PKServiceProviderPurchase)initWithDictionary:(id)a3;
- (PKServiceProviderPurchaseData)serviceProviderData;
- (id)description;
- (unint64_t)hash;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPartnerMetadata:(id)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setRegionIdentifier:(id)a3;
- (void)setServiceProviderData:(id)a3;
- (void)setServiceProviderIdentifier:(id)a3;
- (void)setSignature:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setVisibleTransactionIdentifier:(id)a3;
@end

@implementation PKServiceProviderPurchase

+ (PKServiceProviderPurchase)purchaseWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return (PKServiceProviderPurchase *)v5;
}

- (PKServiceProviderPurchase)initWithDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKServiceProviderPurchase;
  v5 = [(PKServiceProviderPurchase *)&v45 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 PKStringForKey:@"visibleTransactionIdentifier"];
    uint64_t v10 = [v9 copy];
    visibleTransactionIdentifier = v5->_visibleTransactionIdentifier;
    v5->_visibleTransactionIdentifier = (NSString *)v10;

    v12 = [v4 PKStringForKey:@"state"];
    v5->_state = PKServiceProviderPurchaseStateFromString(v12);

    v13 = [v4 PKStringForKey:@"deviceIdentifier"];
    uint64_t v14 = [v13 copy];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v14;

    v16 = [v4 PKStringForKey:@"serviceProviderIdentifier"];
    uint64_t v17 = [v16 copy];
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v17;

    v19 = [v4 PKDictionaryForKey:@"serviceProviderData"];
    uint64_t v20 = [v19 copy];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (PKServiceProviderPurchaseData *)v20;

    v22 = [v4 PKStringForKey:@"signature"];
    uint64_t v23 = [v22 copy];
    signature = v5->_signature;
    v5->_signature = (NSString *)v23;

    v25 = [v4 PKDateForKey:@"datePurchased"];
    uint64_t v26 = [v25 copy];
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v26;

    v28 = [v4 PKStringForKey:@"partnerMetadata"];
    uint64_t v29 = [v28 copy];
    partnerMetadata = v5->_partnerMetadata;
    v5->_partnerMetadata = (NSString *)v29;

    v31 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v32 = objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), @"actions", 0);
    uint64_t v33 = [v32 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v42;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v42 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = +[PKServiceProviderPurchaseAction actionWithDictionary:*(void *)(*((void *)&v41 + 1) + 8 * v36)];
          if (v37) {
            [v31 addObject:v37];
          }

          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v34);
    }

    uint64_t v38 = [v31 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v38;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKServiceProviderPurchase)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKServiceProviderPurchase;
  v5 = [(PKServiceProviderPurchase *)&v41 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visibleTransactionIdentifier"];
    uint64_t v10 = [v9 copy];
    visibleTransactionIdentifier = v5->_visibleTransactionIdentifier;
    v5->_visibleTransactionIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    v5->_state = PKServiceProviderPurchaseStateFromString(v12);

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    uint64_t v14 = [v13 copy];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionIdentifier"];
    uint64_t v17 = [v16 copy];
    regionIdentifier = v5->_regionIdentifier;
    v5->_regionIdentifier = (NSString *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderIdentifier"];
    uint64_t v20 = [v19 copy];
    serviceProviderIdentifier = v5->_serviceProviderIdentifier;
    v5->_serviceProviderIdentifier = (NSString *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceProviderData"];
    uint64_t v23 = [v22 copy];
    serviceProviderData = v5->_serviceProviderData;
    v5->_serviceProviderData = (PKServiceProviderPurchaseData *)v23;

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    uint64_t v26 = [v25 copy];
    signature = v5->_signature;
    v5->_signature = (NSString *)v26;

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"datePurchased"];
    uint64_t v29 = [v28 copy];
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v29;

    v31 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"actions"];
    uint64_t v35 = [v34 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v35;

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerMetadata"];
    uint64_t v38 = [v37 copy];
    partnerMetadata = v5->_partnerMetadata;
    v5->_partnerMetadata = (NSString *)v38;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  [v6 encodeObject:self->_visibleTransactionIdentifier forKey:@"visibleTransactionIdentifier"];
  unint64_t v4 = self->_state - 1;
  if (v4 > 2) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56E57C0[v4];
  }
  [v6 encodeObject:v5 forKey:@"identifier"];
  [v6 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v6 encodeObject:self->_regionIdentifier forKey:@"regionIdentifier"];
  [v6 encodeObject:self->_serviceProviderIdentifier forKey:@"serviceProviderIdentifier"];
  [v6 encodeObject:self->_serviceProviderData forKey:@"serviceProviderData"];
  [v6 encodeObject:self->_signature forKey:@"signature"];
  [v6 encodeObject:self->_purchaseDate forKey:@"datePurchased"];
  [v6 encodeObject:self->_actions forKey:@"actions"];
  [v6 encodeObject:self->_partnerMetadata forKey:@"partnerMetadata"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_visibleTransactionIdentifier];
  [v3 safelyAddObject:self->_deviceIdentifier];
  [v3 safelyAddObject:self->_regionIdentifier];
  [v3 safelyAddObject:self->_serviceProviderIdentifier];
  [v3 safelyAddObject:self->_serviceProviderData];
  [v3 safelyAddObject:self->_purchaseDate];
  [v3 safelyAddObject:self->_signature];
  [v3 safelyAddObject:self->_actions];
  [v3 safelyAddObject:self->_partnerMetadata];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_state - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(PKServiceProviderPurchase *)self isEqualToServiceProviderPurchase:v4];

  return v5;
}

- (BOOL)isEqualToServiceProviderPurchase:(id)a3
{
  id v4 = (PKServiceProviderPurchase *)a3;
  if (self != v4)
  {
    identifier = self->_identifier;
    id v6 = v4->_identifier;
    if (identifier) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (identifier != v6) {
        goto LABEL_56;
      }
    }
    else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
    {
      goto LABEL_56;
    }
    visibleTransactionIdentifier = self->_visibleTransactionIdentifier;
    uint64_t v10 = v4->_visibleTransactionIdentifier;
    if (visibleTransactionIdentifier && v10)
    {
      if ((-[NSString isEqual:](visibleTransactionIdentifier, "isEqual:") & 1) == 0) {
        goto LABEL_56;
      }
    }
    else if (visibleTransactionIdentifier != v10)
    {
      goto LABEL_56;
    }
    deviceIdentifier = self->_deviceIdentifier;
    v12 = v4->_deviceIdentifier;
    if (deviceIdentifier && v12)
    {
      if ((-[NSString isEqual:](deviceIdentifier, "isEqual:") & 1) == 0) {
        goto LABEL_56;
      }
    }
    else if (deviceIdentifier != v12)
    {
      goto LABEL_56;
    }
    regionIdentifier = self->_regionIdentifier;
    uint64_t v14 = v4->_regionIdentifier;
    if (regionIdentifier && v14)
    {
      if ((-[NSString isEqual:](regionIdentifier, "isEqual:") & 1) == 0) {
        goto LABEL_56;
      }
    }
    else if (regionIdentifier != v14)
    {
      goto LABEL_56;
    }
    serviceProviderIdentifier = self->_serviceProviderIdentifier;
    v16 = v4->_serviceProviderIdentifier;
    if (serviceProviderIdentifier && v16)
    {
      if ((-[NSString isEqual:](serviceProviderIdentifier, "isEqual:") & 1) == 0) {
        goto LABEL_56;
      }
    }
    else if (serviceProviderIdentifier != v16)
    {
      goto LABEL_56;
    }
    serviceProviderData = self->_serviceProviderData;
    v18 = v4->_serviceProviderData;
    if (serviceProviderData && v18)
    {
      if (!-[PKServiceProviderPurchaseData isEqual:](serviceProviderData, "isEqual:")) {
        goto LABEL_56;
      }
    }
    else if (serviceProviderData != v18)
    {
      goto LABEL_56;
    }
    purchaseDate = self->_purchaseDate;
    uint64_t v20 = v4->_purchaseDate;
    if (purchaseDate && v20)
    {
      if ((-[NSDate isEqual:](purchaseDate, "isEqual:") & 1) == 0) {
        goto LABEL_56;
      }
    }
    else if (purchaseDate != v20)
    {
      goto LABEL_56;
    }
    signature = self->_signature;
    v22 = v4->_signature;
    if (signature && v22)
    {
      if ((-[NSString isEqual:](signature, "isEqual:") & 1) == 0) {
        goto LABEL_56;
      }
    }
    else if (signature != v22)
    {
      goto LABEL_56;
    }
    actions = self->_actions;
    v24 = v4->_actions;
    if (actions && v24)
    {
      if ((-[NSArray isEqual:](actions, "isEqual:") & 1) == 0) {
        goto LABEL_56;
      }
    }
    else if (actions != v24)
    {
      goto LABEL_56;
    }
    partnerMetadata = self->_partnerMetadata;
    uint64_t v26 = v4->_partnerMetadata;
    if (partnerMetadata && v26)
    {
      if (-[NSString isEqual:](partnerMetadata, "isEqual:"))
      {
LABEL_54:
        BOOL v8 = self->_state == v4->_state;
        goto LABEL_57;
      }
    }
    else if (partnerMetadata == v26)
    {
      goto LABEL_54;
    }
LABEL_56:
    BOOL v8 = 0;
    goto LABEL_57;
  }
  BOOL v8 = 1;
LABEL_57:

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_identifier) {
    [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  }
  if (self->_visibleTransactionIdentifier) {
    [v4 appendFormat:@"visibleOrderIdentifier: '%@'; ", self->_visibleTransactionIdentifier];
  }
  if (self->_deviceIdentifier) {
    [v4 appendFormat:@"deviceIdentifier: '%@'; ", self->_deviceIdentifier];
  }
  if (self->_regionIdentifier) {
    [v4 appendFormat:@"regionIdentifier: '%@'; ", self->_regionIdentifier];
  }
  if (self->_serviceProviderIdentifier) {
    [v4 appendFormat:@"serviceProviderIdentifier: '%@'; ", self->_serviceProviderIdentifier];
  }
  if (self->_serviceProviderData) {
    [v4 appendFormat:@"serviceProviderData: '%@'; ", self->_serviceProviderData];
  }
  purchaseDate = self->_purchaseDate;
  if (purchaseDate)
  {
    id v6 = PKShortDateString((uint64_t)purchaseDate);
    [v4 appendFormat:@"purchaseDate: %@;", v6];
  }
  if (self->_signature) {
    [v4 appendFormat:@"signature: '%@'; ", self->_signature];
  }
  if (self->_actions) {
    [v4 appendFormat:@"_actions: '%@'; ", self->_actions];
  }
  if (self->_partnerMetadata) {
    [v4 appendFormat:@"partnerMetadata: '%@'; ", self->_partnerMetadata];
  }
  [v4 appendFormat:@">"];
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)visibleTransactionIdentifier
{
  return self->_visibleTransactionIdentifier;
}

- (void)setVisibleTransactionIdentifier:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)regionIdentifier
{
  return self->_regionIdentifier;
}

- (void)setRegionIdentifier:(id)a3
{
}

- (NSString)serviceProviderIdentifier
{
  return self->_serviceProviderIdentifier;
}

- (void)setServiceProviderIdentifier:(id)a3
{
}

- (PKServiceProviderPurchaseData)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSString)partnerMetadata
{
  return self->_partnerMetadata;
}

- (void)setPartnerMetadata:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_partnerMetadata, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_serviceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_visibleTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end