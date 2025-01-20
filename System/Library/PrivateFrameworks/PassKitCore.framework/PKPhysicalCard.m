@interface PKPhysicalCard
+ (BOOL)physicalCard:(id)a3 matchesActivationCode:(id)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpiredInCalendar:(id)a3;
- (NSDate)lastUpdated;
- (NSSet)orderActivity;
- (NSSet)shippingActivity;
- (NSString)FPANSuffix;
- (NSString)accountUserAltDSID;
- (NSString)activationCodeHash;
- (NSString)identifier;
- (NSString)nameOnCard;
- (NSString)shippingCompany;
- (NSString)trackingNumber;
- (NSURL)frontFaceImageURL;
- (PKImage)frontFaceImage;
- (PKPhysicalCard)initWithCoder:(id)a3;
- (PKPhysicalCard)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)expirationDateInCalendar:(id)a3;
- (id)formattedExpiration;
- (id)jsonDictionaryRepresentation;
- (id)latestOrderActivity;
- (id)latestShippingActivity;
- (id)shipmentTrackingURL;
- (unint64_t)expirationMonth;
- (unint64_t)expirationYear;
- (unint64_t)hash;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setActivationCodeHash:(id)a3;
- (void)setExpirationMonth:(unint64_t)a3;
- (void)setExpirationYear:(unint64_t)a3;
- (void)setFPANSuffix:(id)a3;
- (void)setFrontFaceImage:(id)a3;
- (void)setFrontFaceImageURL:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setNameOnCard:(id)a3;
- (void)setOrderActivity:(id)a3;
- (void)setShippingActivity:(id)a3;
- (void)setShippingCompany:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTrackingNumber:(id)a3;
@end

@implementation PKPhysicalCard

- (PKPhysicalCard)initWithDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPhysicalCard;
  v5 = [(PKPhysicalCard *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v8;

    v10 = [v4 PKStringForKey:@"state"];
    v5->_state = PKPhysicalCardStateFromString(v10);

    uint64_t v11 = [v4 PKStringForKey:@"FPANSuffix"];
    FPANSuffix = v5->_FPANSuffix;
    v5->_FPANSuffix = (NSString *)v11;

    uint64_t v13 = [v4 PKStringForKey:@"trackingNumber"];
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v13;

    uint64_t v15 = [v4 PKStringForKey:@"shippingCompany"];
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v15;

    v17 = [v4 PKDictionaryForKey:@"customizationOptions"];
    uint64_t v18 = [v17 PKURLForKey:@"frontFaceImageURL"];
    frontFaceImageURL = v5->_frontFaceImageURL;
    v5->_frontFaceImageURL = (NSURL *)v18;

    uint64_t v20 = [v17 PKStringForKey:@"name"];
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v20;

    uint64_t v22 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v25 = [v4 PKArrayContaining:objc_opt_class() forKey:@"orderActivity"];
    v26 = objc_msgSend(v25, "pk_arrayByApplyingBlock:", &__block_literal_global_53);
    v27 = [v24 setWithArray:v26];

    if ([v27 count]) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    objc_storeStrong((id *)&v5->_orderActivity, v28);
    uint64_t v29 = [v4 PKStringForKey:@"activationCodeHash"];
    activationCodeHash = v5->_activationCodeHash;
    v5->_activationCodeHash = (NSString *)v29;

    v5->_expirationMonth = [v4 PKIntegerForKey:@"expirationMonth"];
    v5->_expirationYear = [v4 PKIntegerForKey:@"expirationYear"];
  }
  return v5;
}

PKPhysicalCardOrderActivityEvent *__37__PKPhysicalCard_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKPhysicalCardOrderActivityEvent alloc] initWithDictionary:v2];

  return v3;
}

- (id)latestOrderActivity
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = self->_orderActivity;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v5)
        {
          v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "date", (void)v14);
          v10 = [v5 date];
          uint64_t v11 = [v9 compare:v10];

          if (v11 != 1) {
            continue;
          }
        }
        id v12 = v8;

        v5 = v12;
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)latestShippingActivity
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = self->_shippingActivity;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v5)
        {
          v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "timestamp", (void)v14);
          v10 = [v5 timestamp];
          uint64_t v11 = [v9 compare:v10];

          if (v11 != 1) {
            continue;
          }
        }
        id v12 = v8;

        v5 = v12;
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)physicalCard:(id)a3 matchesActivationCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 identifier];
  uint64_t v8 = (void *)v7;
  LOBYTE(v9) = 0;
  if (v5 && v6 && v7)
  {
    v10 = [v5 activationCodeHash];
    uint64_t v11 = [NSString stringWithFormat:@"%@%@", v6, v8];
    id v12 = [v11 dataUsingEncoding:4];
    v9 = v12;
    if (v12)
    {
      uint64_t v13 = [v12 SHA256Hash];

      long long v14 = [v13 hexEncoding];
      id v15 = v10;
      id v16 = v14;
      long long v17 = v16;
      if (v15 == v16)
      {
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
        if (v15 && v16) {
          LOBYTE(v9) = [v15 isEqualToString:v16];
        }
      }
    }
  }

  return (char)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicalCard)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPhysicalCard;
  id v5 = [(PKPhysicalCard *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v8;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FPANSuffix"];
    FPANSuffix = v5->_FPANSuffix;
    v5->_FPANSuffix = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"frontFaceImageURL"];
    frontFaceImageURL = v5->_frontFaceImageURL;
    v5->_frontFaceImageURL = (NSURL *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    nameOnCard = v5->_nameOnCard;
    v5->_nameOnCard = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"orderActivity"];
    orderActivity = v5->_orderActivity;
    v5->_orderActivity = (NSSet *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"shippingActivity"];
    shippingActivity = v5->_shippingActivity;
    v5->_shippingActivity = (NSSet *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingNumber"];
    trackingNumber = v5->_trackingNumber;
    v5->_trackingNumber = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingCompany"];
    shippingCompany = v5->_shippingCompany;
    v5->_shippingCompany = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activationCodeHash"];
    activationCodeHash = v5->_activationCodeHash;
    v5->_activationCodeHash = (NSString *)v32;

    v5->_expirationMonth = [v4 decodeIntegerForKey:@"expirationMonth"];
    v5->_expirationYear = [v4 decodeIntegerForKey:@"expirationYear"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_accountUserAltDSID forKey:@"accountUserAltDSID"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeObject:self->_FPANSuffix forKey:@"FPANSuffix"];
  [v5 encodeObject:self->_frontFaceImageURL forKey:@"frontFaceImageURL"];
  [v5 encodeObject:self->_nameOnCard forKey:@"name"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_orderActivity forKey:@"orderActivity"];
  [v5 encodeObject:self->_shippingActivity forKey:@"shippingActivity"];
  [v5 encodeObject:self->_trackingNumber forKey:@"trackingNumber"];
  [v5 encodeObject:self->_shippingCompany forKey:@"shippingCompany"];
  [v5 encodeObject:self->_activationCodeHash forKey:@"activationCodeHash"];
  [v5 encodeInteger:self->_expirationMonth forKey:@"expirationMonth"];
  [v5 encodeInteger:self->_expirationYear forKey:@"expirationYear"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_60;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_60;
  }
  accountUserAltDSID = self->_accountUserAltDSID;
  uint64_t v8 = (NSString *)v4[2];
  if (accountUserAltDSID && v8)
  {
    if ((-[NSString isEqual:](accountUserAltDSID, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (accountUserAltDSID != v8)
  {
    goto LABEL_60;
  }
  frontFaceImageURL = self->_frontFaceImageURL;
  uint64_t v10 = (NSURL *)v4[5];
  if (frontFaceImageURL && v10)
  {
    if ((-[NSURL isEqual:](frontFaceImageURL, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (frontFaceImageURL != v10)
  {
    goto LABEL_60;
  }
  nameOnCard = self->_nameOnCard;
  uint64_t v12 = (NSString *)v4[6];
  if (nameOnCard && v12)
  {
    if ((-[NSString isEqual:](nameOnCard, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (nameOnCard != v12)
  {
    goto LABEL_60;
  }
  lastUpdated = self->_lastUpdated;
  uint64_t v14 = (NSDate *)v4[7];
  if (lastUpdated && v14)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (lastUpdated != v14)
  {
    goto LABEL_60;
  }
  FPANSuffix = self->_FPANSuffix;
  uint64_t v16 = (NSString *)v4[4];
  if (FPANSuffix && v16)
  {
    if ((-[NSString isEqual:](FPANSuffix, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (FPANSuffix != v16)
  {
    goto LABEL_60;
  }
  trackingNumber = self->_trackingNumber;
  uint64_t v18 = (NSString *)v4[8];
  if (trackingNumber && v18)
  {
    if ((-[NSString isEqual:](trackingNumber, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (trackingNumber != v18)
  {
    goto LABEL_60;
  }
  shippingCompany = self->_shippingCompany;
  uint64_t v20 = (NSString *)v4[9];
  if (shippingCompany && v20)
  {
    if ((-[NSString isEqual:](shippingCompany, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (shippingCompany != v20)
  {
    goto LABEL_60;
  }
  orderActivity = self->_orderActivity;
  uint64_t v22 = (NSSet *)v4[10];
  if (orderActivity && v22)
  {
    if ((-[NSSet isEqual:](orderActivity, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (orderActivity != v22)
  {
    goto LABEL_60;
  }
  shippingActivity = self->_shippingActivity;
  uint64_t v24 = (NSSet *)v4[11];
  if (shippingActivity && v24)
  {
    if ((-[NSSet isEqual:](shippingActivity, "isEqual:") & 1) == 0) {
      goto LABEL_60;
    }
  }
  else if (shippingActivity != v24)
  {
    goto LABEL_60;
  }
  if (self->_state != v4[3]) {
    goto LABEL_60;
  }
  activationCodeHash = self->_activationCodeHash;
  uint64_t v26 = (NSString *)v4[12];
  if (!activationCodeHash || !v26)
  {
    if (activationCodeHash == v26) {
      goto LABEL_58;
    }
LABEL_60:
    BOOL v27 = 0;
    goto LABEL_61;
  }
  if ((-[NSString isEqual:](activationCodeHash, "isEqual:") & 1) == 0) {
    goto LABEL_60;
  }
LABEL_58:
  if (self->_expirationMonth != v4[13]) {
    goto LABEL_60;
  }
  BOOL v27 = self->_expirationYear == v4[14];
LABEL_61:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_accountUserAltDSID];
  [v3 safelyAddObject:self->_frontFaceImageURL];
  [v3 safelyAddObject:self->_nameOnCard];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_FPANSuffix];
  [v3 safelyAddObject:self->_orderActivity];
  [v3 safelyAddObject:self->_shippingActivity];
  [v3 safelyAddObject:self->_trackingNumber];
  [v3 safelyAddObject:self->_shippingCompany];
  [v3 safelyAddObject:self->_activationCodeHash];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_state - v4 + 32 * v4;
  unint64_t v6 = self->_expirationMonth - v5 + 32 * v5;
  unint64_t v7 = self->_expirationYear - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"accountUserAltDSID: '%@'; ", self->_accountUserAltDSID];
  unint64_t v4 = self->_state - 1;
  if (v4 > 4) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56E2328[v4];
  }
  [v3 appendFormat:@"state: '%@'; ", v5];
  unint64_t v6 = [(NSURL *)self->_frontFaceImageURL description];
  [v3 appendFormat:@"frontFaceImageURL: '%@'; ", v6];

  unint64_t v7 = [(NSString *)self->_nameOnCard description];
  [v3 appendFormat:@"nameOnCard: '%@'; ", v7];

  uint64_t v8 = [(NSDate *)self->_lastUpdated description];
  [v3 appendFormat:@"lastUpdated: '%@'; ", v8];

  v9 = [(NSString *)self->_FPANSuffix description];
  [v3 appendFormat:@"FPANSuffix: '%@'; ", v9];

  uint64_t v10 = [(NSSet *)self->_orderActivity description];
  [v3 appendFormat:@"orderActivity: '%@'; ", v10];

  uint64_t v11 = [(NSSet *)self->_shippingActivity description];
  [v3 appendFormat:@"shippingActivity: '%@'; ", v11];

  uint64_t v12 = [(NSString *)self->_activationCodeHash description];
  [v3 appendFormat:@"activationCodeHash: '%@'; ", v12];

  objc_msgSend(v3, "appendFormat:", @"expirationMonth: %lu; ", self->_expirationMonth);
  objc_msgSend(v3, "appendFormat:", @"expirationYear: %lu; ", self->_expirationYear);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPhysicalCard allocWithZone:](PKPhysicalCard, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_accountUserAltDSID copyWithZone:a3];
  accountUserAltDSID = v5->_accountUserAltDSID;
  v5->_accountUserAltDSID = (NSString *)v8;

  v5->_state = self->_state;
  uint64_t v10 = [(NSURL *)self->_frontFaceImageURL copyWithZone:a3];
  frontFaceImageURL = v5->_frontFaceImageURL;
  v5->_frontFaceImageURL = (NSURL *)v10;

  uint64_t v12 = [(NSString *)self->_nameOnCard copyWithZone:a3];
  nameOnCard = v5->_nameOnCard;
  v5->_nameOnCard = (NSString *)v12;

  uint64_t v14 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v14;

  uint64_t v16 = [(NSString *)self->_FPANSuffix copyWithZone:a3];
  FPANSuffix = v5->_FPANSuffix;
  v5->_FPANSuffix = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_trackingNumber copyWithZone:a3];
  trackingNumber = v5->_trackingNumber;
  v5->_trackingNumber = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_shippingCompany copyWithZone:a3];
  shippingCompany = v5->_shippingCompany;
  v5->_shippingCompany = (NSString *)v20;

  uint64_t v22 = [(NSSet *)self->_orderActivity copyWithZone:a3];
  orderActivity = v5->_orderActivity;
  v5->_orderActivity = (NSSet *)v22;

  uint64_t v24 = [(NSSet *)self->_shippingActivity copyWithZone:a3];
  shippingActivity = v5->_shippingActivity;
  v5->_shippingActivity = (NSSet *)v24;

  uint64_t v26 = [(NSString *)self->_activationCodeHash copyWithZone:a3];
  activationCodeHash = v5->_activationCodeHash;
  v5->_activationCodeHash = (NSString *)v26;

  v5->_expirationMonth = self->_expirationMonth;
  v5->_expirationYear = self->_expirationYear;
  return v5;
}

- (id)jsonDictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  unint64_t v6 = self->_state - 1;
  if (v6 > 4) {
    unint64_t v7 = @"unknown";
  }
  else {
    unint64_t v7 = off_1E56E2328[v6];
  }
  [v4 setObject:v7 forKeyedSubscript:@"state"];
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  frontFaceImageURL = self->_frontFaceImageURL;
  if (frontFaceImageURL)
  {
    uint64_t v10 = [(NSURL *)frontFaceImageURL absoluteString];
    [v8 setObject:v10 forKeyedSubscript:@"frontFaceImageURL"];
  }
  nameOnCard = self->_nameOnCard;
  if (nameOnCard) {
    [v8 setObject:nameOnCard forKeyedSubscript:@"name"];
  }
  [v4 setObject:v8 forKeyedSubscript:@"customizationOptions"];
  uint64_t v12 = (void *)[v4 copy];

  return v12;
}

- (id)shipmentTrackingURL
{
  if ([(NSString *)self->_shippingCompany length] && [(NSString *)self->_trackingNumber length])
  {
    uint64_t v3 = [NSString stringWithFormat:@"https://trackingshipment.apple.com/?Company=%@&TrackingNumber=%@", self->_shippingCompany, self->_trackingNumber];
    unint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (id)formattedExpiration
{
  unint64_t expirationYear = self->_expirationYear;
  if (expirationYear && (unint64_t expirationMonth = self->_expirationMonth) != 0)
  {
    unint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%02lu/%lu", expirationMonth, expirationYear);
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (BOOL)isExpiredInCalendar:(id)a3
{
  unint64_t v4 = [(PKPhysicalCard *)self expirationDateInCalendar:a3];
  if (v4 && self->_state == 5)
  {
    unint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    [v5 timeIntervalSinceDate:v4];
    BOOL v7 = v6 > 0.0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)expirationDateInCalendar:(id)a3
{
  id v4 = a3;
  if (self->_expirationYear && self->_expirationMonth)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v5 setYear:self->_expirationYear];
    [v5 setMonth:self->_expirationMonth + 1];
    [v5 setSecond:-1];
    double v6 = [v4 dateFromComponents:v5];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
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

- (NSString)FPANSuffix
{
  return self->_FPANSuffix;
}

- (void)setFPANSuffix:(id)a3
{
}

- (NSURL)frontFaceImageURL
{
  return self->_frontFaceImageURL;
}

- (void)setFrontFaceImageURL:(id)a3
{
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void)setNameOnCard:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void)setTrackingNumber:(id)a3
{
}

- (NSString)shippingCompany
{
  return self->_shippingCompany;
}

- (void)setShippingCompany:(id)a3
{
}

- (NSSet)orderActivity
{
  return self->_orderActivity;
}

- (void)setOrderActivity:(id)a3
{
}

- (NSSet)shippingActivity
{
  return self->_shippingActivity;
}

- (void)setShippingActivity:(id)a3
{
}

- (NSString)activationCodeHash
{
  return self->_activationCodeHash;
}

- (void)setActivationCodeHash:(id)a3
{
}

- (unint64_t)expirationMonth
{
  return self->_expirationMonth;
}

- (void)setExpirationMonth:(unint64_t)a3
{
  self->_unint64_t expirationMonth = a3;
}

- (unint64_t)expirationYear
{
  return self->_expirationYear;
}

- (void)setExpirationYear:(unint64_t)a3
{
  self->_unint64_t expirationYear = a3;
}

- (PKImage)frontFaceImage
{
  return self->_frontFaceImage;
}

- (void)setFrontFaceImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontFaceImage, 0);
  objc_storeStrong((id *)&self->_activationCodeHash, 0);
  objc_storeStrong((id *)&self->_shippingActivity, 0);
  objc_storeStrong((id *)&self->_orderActivity, 0);
  objc_storeStrong((id *)&self->_shippingCompany, 0);
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_frontFaceImageURL, 0);
  objc_storeStrong((id *)&self->_FPANSuffix, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end