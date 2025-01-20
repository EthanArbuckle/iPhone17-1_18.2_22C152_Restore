@interface PKPaymentSetupFeature
+ (BOOL)supportsSecureCoding;
+ (id)paymentSetupFeatureWithProtobuf:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)expiry;
- (NSDate)lastUpdated;
- (NSSet)identifiers;
- (NSString)dirtyStateIdentifier;
- (NSString)discoveryCardIdentifier;
- (NSString)localizedDisplayName;
- (NSString)notificationMessage;
- (NSString)notificationTitle;
- (NSString)partnerIdentifier;
- (NSString)productIdentifier;
- (PKPaymentSetupFeature)initWithCoder:(id)a3;
- (PKPaymentSetupFeature)initWithIdentifiers:(id)a3 localizedDisplayName:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobuf;
- (int64_t)state;
- (int64_t)supportedDevices;
- (int64_t)supportedOptions;
- (int64_t)type;
- (unint64_t)featureIdentifier;
- (unint64_t)hash;
- (unint64_t)productState;
- (unint64_t)productType;
- (void)encodeWithCoder:(id)a3;
- (void)sanitizePaymentSetupFeature;
- (void)setDirtyStateIdentifier:(id)a3;
- (void)setDiscoveryCardIdentifier:(id)a3;
- (void)setExpiry:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setIdentifiers:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setNotificationMessage:(id)a3;
- (void)setNotificationTitle:(id)a3;
- (void)setPartnerIdentifier:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setProductState:(unint64_t)a3;
- (void)setProductType:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportedDevices:(int64_t)a3;
- (void)setSupportedOptions:(int64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKPaymentSetupFeature

+ (id)paymentSetupFeatureWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentSetupFeature);
  -[PKPaymentSetupFeature setState:](v4, "setState:", [v3 state]);
  uint64_t v5 = [v3 type];

  [(PKPaymentSetupFeature *)v4 setType:v5];
  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPaymentSetupFeature);
  [(PKProtobufPaymentSetupFeature *)v3 setState:[(PKPaymentSetupFeature *)self state]];
  [(PKProtobufPaymentSetupFeature *)v3 setType:[(PKPaymentSetupFeature *)self state]];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupFeature)initWithIdentifiers:(id)a3 localizedDisplayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFeature;
  v9 = [(PKPaymentSetupFeature *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifiers, a3);
    objc_storeStrong((id *)&v10->_localizedDisplayName, a4);
  }

  return v10;
}

- (void)sanitizePaymentSetupFeature
{
  productIdentifier = self->_productIdentifier;
  self->_productIdentifier = 0;

  partnerIdentifier = self->_partnerIdentifier;
  self->_partnerIdentifier = 0;

  dirtyStateIdentifier = self->_dirtyStateIdentifier;
  self->_featureIdentifier = 0;
  self->_dirtyStateIdentifier = 0;

  self->_productType = 0;
  self->_productState = 0;
  notificationTitle = self->_notificationTitle;
  self->_notificationTitle = 0;

  notificationMessage = self->_notificationMessage;
  self->_notificationMessage = 0;

  discoveryCardIdentifier = self->_discoveryCardIdentifier;
  self->_discoveryCardIdentifier = 0;
}

- (PKPaymentSetupFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKPaymentSetupFeature;
  uint64_t v5 = [(PKPaymentSetupFeature *)&v28 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"identifiers"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSSet *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDisplayName"];
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v11;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_supportedOptions = [v4 decodeIntegerForKey:@"supportedOptions"];
    v5->_supportedDevices = [v4 decodeIntegerForKey:@"supportedDevices"];
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productIdentifier"];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerIdentifier"];
    partnerIdentifier = v5->_partnerIdentifier;
    v5->_partnerIdentifier = (NSString *)v15;

    v5->_featureIdentifier = [v4 decodeIntegerForKey:@"featureIdentifier"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiry"];
    expiry = v5->_expiry;
    v5->_expiry = (NSDate *)v19;

    v5->_productType = [v4 decodeIntegerForKey:@"productType"];
    v5->_productState = [v4 decodeIntegerForKey:@"productState"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationTitle"];
    notificationTitle = v5->_notificationTitle;
    v5->_notificationTitle = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationMessage"];
    notificationMessage = v5->_notificationMessage;
    v5->_notificationMessage = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveryCardIdentifier"];
    discoveryCardIdentifier = v5->_discoveryCardIdentifier;
    v5->_discoveryCardIdentifier = (NSString *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifiers = self->_identifiers;
  id v5 = a3;
  [v5 encodeObject:identifiers forKey:@"identifiers"];
  [v5 encodeObject:self->_localizedDisplayName forKey:@"localizedDisplayName"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_supportedOptions forKey:@"supportedOptions"];
  [v5 encodeInteger:self->_supportedDevices forKey:@"supportedDevices"];
  [v5 encodeObject:self->_productIdentifier forKey:@"productIdentifier"];
  [v5 encodeObject:self->_partnerIdentifier forKey:@"partnerIdentifier"];
  [v5 encodeInteger:self->_featureIdentifier forKey:@"featureIdentifier"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeObject:self->_expiry forKey:@"expiry"];
  [v5 encodeInteger:self->_productType forKey:@"productType"];
  [v5 encodeInteger:self->_productState forKey:@"productState"];
  [v5 encodeObject:self->_notificationTitle forKey:@"notificationTitle"];
  [v5 encodeObject:self->_notificationMessage forKey:@"notificationMessage"];
  [v5 encodeObject:self->_discoveryCardIdentifier forKey:@"discoveryCardIdentifier"];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifiers: %@ ", self->_identifiers];
  [v3 appendFormat:@"productIdentifier: %@ ", self->_productIdentifier];
  [v3 appendFormat:@"localizedDisplayName: %@ ", self->_localizedDisplayName];
  unint64_t type = self->_type;
  if (type > 3) {
    id v5 = @"unknown";
  }
  else {
    id v5 = off_1E56F32D8[type];
  }
  [v3 appendFormat:@"type: %@ ", v5];
  unint64_t state = self->_state;
  if (state > 3) {
    uint64_t v7 = @"unknown";
  }
  else {
    uint64_t v7 = off_1E56F32F8[state];
  }
  [v3 appendFormat:@"state: %@ ", v7];
  [v3 appendFormat:@">"];
  id v8 = (void *)[v3 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentSetupFeature allocWithZone:](PKPaymentSetupFeature, "allocWithZone:") init];
  uint64_t v6 = [(NSSet *)self->_identifiers copyWithZone:a3];
  identifiers = v5->_identifiers;
  v5->_identifiers = (NSSet *)v6;

  uint64_t v8 = [(NSString *)self->_localizedDisplayName copyWithZone:a3];
  localizedDisplayName = v5->_localizedDisplayName;
  v5->_localizedDisplayName = (NSString *)v8;

  v5->_unint64_t type = self->_type;
  v5->_unint64_t state = self->_state;
  v5->_supportedOptions = self->_supportedOptions;
  v5->_supportedDevices = self->_supportedDevices;
  uint64_t v10 = [(NSString *)self->_productIdentifier copyWithZone:a3];
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_partnerIdentifier copyWithZone:a3];
  partnerIdentifier = v5->_partnerIdentifier;
  v5->_partnerIdentifier = (NSString *)v12;

  v5->_featureIdentifier = self->_featureIdentifier;
  uint64_t v14 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v14;

  uint64_t v16 = [(NSDate *)self->_expiry copyWithZone:a3];
  expiry = v5->_expiry;
  v5->_expiry = (NSDate *)v16;

  v5->_productType = self->_productType;
  v5->_productState = self->_productState;
  uint64_t v18 = [(NSString *)self->_notificationTitle copyWithZone:a3];
  notificationTitle = v5->_notificationTitle;
  v5->_notificationTitle = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_notificationMessage copyWithZone:a3];
  notificationMessage = v5->_notificationMessage;
  v5->_notificationMessage = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_discoveryCardIdentifier copyWithZone:a3];
  discoveryCardIdentifier = v5->_discoveryCardIdentifier;
  v5->_discoveryCardIdentifier = (NSString *)v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_53;
  }
  id v5 = (NSSet *)*((void *)v4 + 1);
  identifiers = self->_identifiers;
  if (v5) {
    BOOL v7 = identifiers == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v5 != identifiers) {
      goto LABEL_53;
    }
  }
  else
  {
    char v8 = -[NSSet isEqual:](v5, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_53;
    }
  }
  localizedDisplayName = self->_localizedDisplayName;
  uint64_t v10 = (NSString *)*((id *)v4 + 2);
  uint64_t v11 = localizedDisplayName;
  if (v10 == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    if (!v10 || !v11) {
      goto LABEL_52;
    }
    BOOL v13 = [(NSString *)v10 isEqualToString:v11];

    if (!v13) {
      goto LABEL_53;
    }
  }
  if (*((void *)v4 + 4) != self->_state
    || *((void *)v4 + 3) != self->_type
    || *((void *)v4 + 5) != self->_supportedOptions
    || *((void *)v4 + 6) != self->_supportedDevices)
  {
    goto LABEL_53;
  }
  productIdentifier = self->_productIdentifier;
  uint64_t v10 = (NSString *)*((id *)v4 + 7);
  uint64_t v15 = productIdentifier;
  if (v10 == v15)
  {
  }
  else
  {
    uint64_t v12 = v15;
    if (!v10 || !v15) {
      goto LABEL_52;
    }
    BOOL v16 = [(NSString *)v10 isEqualToString:v15];

    if (!v16) {
      goto LABEL_53;
    }
  }
  partnerIdentifier = self->_partnerIdentifier;
  uint64_t v10 = (NSString *)*((id *)v4 + 8);
  uint64_t v18 = partnerIdentifier;
  if (v10 == v18)
  {
  }
  else
  {
    uint64_t v12 = v18;
    if (!v10 || !v18) {
      goto LABEL_52;
    }
    BOOL v19 = [(NSString *)v10 isEqualToString:v18];

    if (!v19) {
      goto LABEL_53;
    }
  }
  if (*((void *)v4 + 9) != self->_featureIdentifier
    || *((void *)v4 + 13) != self->_productType
    || *((void *)v4 + 14) != self->_productState)
  {
    goto LABEL_53;
  }
  notificationTitle = self->_notificationTitle;
  uint64_t v10 = (NSString *)*((id *)v4 + 15);
  uint64_t v21 = notificationTitle;
  if (v10 == v21)
  {
  }
  else
  {
    uint64_t v12 = v21;
    if (!v10 || !v21) {
      goto LABEL_52;
    }
    BOOL v22 = [(NSString *)v10 isEqualToString:v21];

    if (!v22) {
      goto LABEL_53;
    }
  }
  notificationMessage = self->_notificationMessage;
  uint64_t v10 = (NSString *)*((id *)v4 + 16);
  v24 = notificationMessage;
  if (v10 == v24)
  {
  }
  else
  {
    uint64_t v12 = v24;
    if (!v10 || !v24) {
      goto LABEL_52;
    }
    BOOL v25 = [(NSString *)v10 isEqualToString:v24];

    if (!v25) {
      goto LABEL_53;
    }
  }
  discoveryCardIdentifier = self->_discoveryCardIdentifier;
  uint64_t v10 = (NSString *)*((id *)v4 + 17);
  v27 = discoveryCardIdentifier;
  if (v10 != v27)
  {
    uint64_t v12 = v27;
    if (v10 && v27)
    {
      BOOL v28 = [(NSString *)v10 isEqualToString:v27];

      if (!v28) {
        goto LABEL_53;
      }
      goto LABEL_56;
    }
LABEL_52:

    goto LABEL_53;
  }

LABEL_56:
  if ((NSDate *)*((void *)v4 + 11) == self->_lastUpdated)
  {
    BOOL v29 = (NSDate *)*((void *)v4 + 12) == self->_expiry;
    goto LABEL_54;
  }
LABEL_53:
  BOOL v29 = 0;
LABEL_54:

  return v29;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifiers];
  [v3 safelyAddObject:self->_localizedDisplayName];
  [v3 safelyAddObject:self->_productIdentifier];
  [v3 safelyAddObject:self->_partnerIdentifier];
  [v3 safelyAddObject:self->_notificationTitle];
  [v3 safelyAddObject:self->_notificationMessage];
  [v3 safelyAddObject:self->_discoveryCardIdentifier];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_expiry];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_type - v4 + 32 * v4;
  int64_t v6 = self->_state - v5 + 32 * v5;
  int64_t v7 = self->_supportedOptions - v6 + 32 * v6;
  int64_t v8 = self->_supportedDevices - v7 + 32 * v7;
  unint64_t v9 = self->_featureIdentifier - v8 + 32 * v8;
  unint64_t v10 = self->_productType - v9 + 32 * v9;
  unint64_t v11 = self->_productState - v10 + 32 * v10;

  return v11;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_unint64_t state = a3;
}

- (int64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (void)setSupportedOptions:(int64_t)a3
{
  self->_supportedOptions = a3;
}

- (int64_t)supportedDevices
{
  return self->_supportedDevices;
}

- (void)setSupportedDevices:(int64_t)a3
{
  self->_supportedDevices = a3;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)partnerIdentifier
{
  return self->_partnerIdentifier;
}

- (void)setPartnerIdentifier:(id)a3
{
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (NSString)dirtyStateIdentifier
{
  return self->_dirtyStateIdentifier;
}

- (void)setDirtyStateIdentifier:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setExpiry:(id)a3
{
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (unint64_t)productState
{
  return self->_productState;
}

- (void)setProductState:(unint64_t)a3
{
  self->_productState = a3;
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
}

- (NSString)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
}

- (NSString)discoveryCardIdentifier
{
  return self->_discoveryCardIdentifier;
}

- (void)setDiscoveryCardIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryCardIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationMessage, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_dirtyStateIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end