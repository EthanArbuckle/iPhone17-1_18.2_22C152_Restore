@interface PKAccountServicingEvent
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSArray)linkedCaseIdentifiers;
- (NSDate)lastUpdatedDate;
- (NSDate)openDate;
- (NSString)activityIdentifier;
- (NSString)claimIdentifier;
- (NSString)description;
- (NSString)identifier;
- (NSString)reasonCode;
- (PKAccountServicingEvent)initWithCoder:(id)a3;
- (PKAccountServicingEvent)initWithDictionary:(id)a3;
- (PKAccountServicingEvent)initWithRecord:(id)a3;
- (PKAccountServicingEventStatusDetails)statusDetails;
- (PKCurrencyAmount)amount;
- (unint64_t)activityType;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setActivityType:(unint64_t)a3;
- (void)setAmount:(id)a3;
- (void)setClaimIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setLinkedCaseIdentifiers:(id)a3;
- (void)setOpenDate:(id)a3;
- (void)setReasonCode:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusDetails:(id)a3;
@end

@implementation PKAccountServicingEvent

- (PKAccountServicingEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountServicingEvent;
  v5 = [(PKAccountServicingEvent *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"status"];
    v5->_status = PKAccountServicingEventStatusFromString(v8);

    v9 = [v4 PKStringForKey:@"currencyCode"];
    v10 = [v4 PKDecimalNumberFromStringForKey:@"amount"];
    uint64_t v11 = PKCurrencyAmountCreate(v10, v9, 0);
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v11;

    uint64_t v13 = [v4 PKStringForKey:@"activityIdentifier"];
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v13;

    v15 = [v4 PKStringForKey:@"activityType"];
    v5->_activityType = PKAccountServicingEventActivityTypeFromString(v15);

    uint64_t v16 = [v4 PKDateForKey:@"openDate"];
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v16;

    uint64_t v18 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v18;

    uint64_t v20 = [v4 PKStringForKey:@"reasonCode"];
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v20;

    uint64_t v22 = [v4 PKStringForKey:@"claimIdentifier"];
    claimIdentifier = v5->_claimIdentifier;
    v5->_claimIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 PKArrayContaining:objc_opt_class() forKey:@"linkedCaseIdentifiers"];
    linkedCaseIdentifiers = v5->_linkedCaseIdentifiers;
    v5->_linkedCaseIdentifiers = (NSArray *)v24;

    v26 = [[PKAccountServicingEventStatusDetails alloc] initWithDictionary:v4 currencyCode:v9];
    statusDetails = v5->_statusDetails;
    v5->_statusDetails = v26;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicingEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAccountServicingEvent;
  v5 = [(PKAccountServicingEvent *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openDate"];
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v10;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityIdentifier"];
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v12;

    v5->_activityType = [v4 decodeIntegerForKey:@"activityType"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reasonCode"];
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"claimIdentifier"];
    claimIdentifier = v5->_claimIdentifier;
    v5->_claimIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"linkedCaseIdentifiers"];
    linkedCaseIdentifiers = v5->_linkedCaseIdentifiers;
    v5->_linkedCaseIdentifiers = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusDetails"];
    statusDetails = v5->_statusDetails;
    v5->_statusDetails = (PKAccountServicingEventStatusDetails *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_openDate forKey:@"openDate"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_activityIdentifier forKey:@"activityIdentifier"];
  [v5 encodeInteger:self->_activityType forKey:@"activityType"];
  [v5 encodeObject:self->_amount forKey:@"currencyAmount"];
  [v5 encodeObject:self->_reasonCode forKey:@"reasonCode"];
  [v5 encodeObject:self->_claimIdentifier forKey:@"claimIdentifier"];
  [v5 encodeObject:self->_linkedCaseIdentifiers forKey:@"linkedCaseIdentifiers"];
  [v5 encodeObject:self->_statusDetails forKey:@"statusDetails"];
}

- (PKAccountServicingEvent)initWithRecord:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountServicingEvent;
  id v5 = [(PKAccountServicingEvent *)&v30 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"identifier");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"openDate");
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v8;

    uint64_t v10 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"lastUpdatedDate");
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v10;

    objc_msgSend(v4, "pk_encryptedStringForKey:", @"currencyCode");
    uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"amount");
    uint64_t v13 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = PKCurrencyAmountCreate(v13, v12, 0);
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v14;

    uint64_t v16 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"status");
    v5->_status = PKAccountServicingEventStatusFromString(v16);

    uint64_t v17 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"activityIdentifier");
    activityIdentifier = v5->_activityIdentifier;
    v5->_activityIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"activityType");
    v5->_activityType = PKAccountServicingEventActivityTypeFromString(v19);

    uint64_t v20 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"reasonCode");
    reasonCode = v5->_reasonCode;
    v5->_reasonCode = (NSString *)v20;

    uint64_t v22 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"claimIdentifier");
    claimIdentifier = v5->_claimIdentifier;
    v5->_claimIdentifier = (NSString *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
    uint64_t v25 = objc_msgSend(v4, "pk_encryptedArrayOfClasses:forKey:", v24, @"linkedCaseIdentifiers");
    linkedCaseIdentifiers = v5->_linkedCaseIdentifiers;
    v5->_linkedCaseIdentifiers = (NSArray *)v25;

    v27 = [[PKAccountServicingEventStatusDetails alloc] initWithRecord:v4 currencyCode:v12];
    statusDetails = v5->_statusDetails;
    v5->_statusDetails = v27;
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v15 = a3;
  id v4 = [v15 encryptedValues];
  [v4 setObject:self->_identifier forKey:@"identifier"];
  [v4 setObject:self->_openDate forKey:@"openDate"];
  [v4 setObject:self->_lastUpdatedDate forKey:@"lastUpdatedDate"];
  unint64_t status = self->_status;
  if (status > 7) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E56F5B78[status];
  }
  [v4 setObject:v6 forKey:@"status"];
  [v4 setObject:self->_activityIdentifier forKey:@"activityIdentifier"];
  unint64_t activityType = self->_activityType;
  if (activityType > 5) {
    uint64_t v8 = @"unknown";
  }
  else {
    uint64_t v8 = off_1E56F5BB8[activityType];
  }
  [v4 setObject:v8 forKey:@"activityType"];
  v9 = [(PKCurrencyAmount *)self->_amount currency];
  [v4 setObject:v9 forKey:@"currencyCode"];

  uint64_t v10 = [(PKCurrencyAmount *)self->_amount amount];
  uint64_t v11 = [v10 stringValue];
  [v4 setObject:v11 forKey:@"amount"];

  [v4 setObject:self->_reasonCode forKey:@"reasonCode"];
  [v4 setObject:self->_claimIdentifier forKey:@"claimIdentifier"];
  if (self->_linkedCaseIdentifiers)
  {
    id v12 = [NSString alloc];
    uint64_t v13 = [MEMORY[0x1E4F28D90] dataWithJSONObject:self->_linkedCaseIdentifiers options:0 error:0];
    uint64_t v14 = (void *)[v12 initWithData:v13 encoding:4];

    [v4 setObject:v14 forKey:@"linkedCaseIdentifiers"];
  }
  [(PKAccountServicingEventStatusDetails *)self->_statusDetails encodeWithRecord:v15];
}

+ (id)recordType
{
  return @"Servicing";
}

+ (id)recordNamePrefix
{
  return @"servicing-";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_46;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_46;
  }
  openDate = self->_openDate;
  uint64_t v8 = (NSDate *)v4[5];
  if (openDate && v8)
  {
    if ((-[NSDate isEqual:](openDate, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (openDate != v8)
  {
    goto LABEL_46;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  uint64_t v10 = (NSDate *)v4[6];
  if (lastUpdatedDate && v10)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (lastUpdatedDate != v10)
  {
    goto LABEL_46;
  }
  activityIdentifier = self->_activityIdentifier;
  id v12 = (NSString *)v4[4];
  if (activityIdentifier && v12)
  {
    if ((-[NSString isEqual:](activityIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (activityIdentifier != v12)
  {
    goto LABEL_46;
  }
  amount = self->_amount;
  uint64_t v14 = (PKCurrencyAmount *)v4[7];
  if (amount && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](amount, "isEqual:")) {
      goto LABEL_46;
    }
  }
  else if (amount != v14)
  {
    goto LABEL_46;
  }
  reasonCode = self->_reasonCode;
  uint64_t v16 = (NSString *)v4[8];
  if (reasonCode && v16)
  {
    if ((-[NSString isEqual:](reasonCode, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (reasonCode != v16)
  {
    goto LABEL_46;
  }
  if (self->_activityType != v4[3] || self->_status != v4[2]) {
    goto LABEL_46;
  }
  claimIdentifier = self->_claimIdentifier;
  uint64_t v18 = (NSString *)v4[9];
  if (claimIdentifier && v18)
  {
    if ((-[NSString isEqual:](claimIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_46;
    }
  }
  else if (claimIdentifier != v18)
  {
    goto LABEL_46;
  }
  linkedCaseIdentifiers = self->_linkedCaseIdentifiers;
  uint64_t v20 = (NSArray *)v4[10];
  if (!linkedCaseIdentifiers || !v20)
  {
    if (linkedCaseIdentifiers == v20) {
      goto LABEL_42;
    }
LABEL_46:
    BOOL v23 = 0;
    goto LABEL_47;
  }
  if ((-[NSArray isEqual:](linkedCaseIdentifiers, "isEqual:") & 1) == 0) {
    goto LABEL_46;
  }
LABEL_42:
  statusDetails = self->_statusDetails;
  uint64_t v22 = (PKAccountServicingEventStatusDetails *)v4[11];
  if (statusDetails && v22) {
    BOOL v23 = -[PKAccountServicingEventStatusDetails isEqual:](statusDetails, "isEqual:");
  }
  else {
    BOOL v23 = statusDetails == v22;
  }
LABEL_47:

  return v23;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_openDate];
  [v3 safelyAddObject:self->_lastUpdatedDate];
  [v3 safelyAddObject:self->_activityIdentifier];
  [v3 safelyAddObject:self->_amount];
  [v3 safelyAddObject:self->_reasonCode];
  [v3 safelyAddObject:self->_claimIdentifier];
  [v3 safelyAddObject:self->_linkedCaseIdentifiers];
  [v3 safelyAddObject:self->_statusDetails];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_status - v4 + 32 * v4;
  unint64_t v6 = self->_activityType - v5 + 32 * v5;

  return v6;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  uint64_t v4 = [(NSDate *)self->_openDate description];
  [v3 appendFormat:@"openDate: '%@'; ", v4];

  unint64_t v5 = [(NSDate *)self->_lastUpdatedDate description];
  [v3 appendFormat:@"lastUpdatedDate: '%@'; ", v5];

  unint64_t status = self->_status;
  if (status > 7) {
    v7 = @"unknown";
  }
  else {
    v7 = off_1E56F5B78[status];
  }
  [v3 appendFormat:@"status: '%@'; ", v7];
  [v3 appendFormat:@"activityIdentifier: '%@'; ", self->_activityIdentifier];
  unint64_t activityType = self->_activityType;
  if (activityType > 5) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E56F5BB8[activityType];
  }
  [v3 appendFormat:@"activityType: '%@'; ", v9];
  uint64_t v10 = [(PKCurrencyAmount *)self->_amount description];
  [v3 appendFormat:@"amount: '%@'; ", v10];

  [v3 appendFormat:@"reasonCode: '%@'; ", self->_reasonCode];
  [v3 appendFormat:@"claimIdentifier: '%@'; ", self->_claimIdentifier];
  [v3 appendFormat:@"linkedCaseIdentifiers: '%@'; ", self->_linkedCaseIdentifiers];
  [v3 appendFormat:@"statusDetails: '%@'; ", self->_statusDetails];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(unint64_t)a3
{
  self->_unint64_t activityType = a3;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSDate)openDate
{
  return self->_openDate;
}

- (void)setOpenDate:(id)a3
{
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)reasonCode
{
  return self->_reasonCode;
}

- (void)setReasonCode:(id)a3
{
}

- (NSString)claimIdentifier
{
  return self->_claimIdentifier;
}

- (void)setClaimIdentifier:(id)a3
{
}

- (NSArray)linkedCaseIdentifiers
{
  return self->_linkedCaseIdentifiers;
}

- (void)setLinkedCaseIdentifiers:(id)a3
{
}

- (PKAccountServicingEventStatusDetails)statusDetails
{
  return self->_statusDetails;
}

- (void)setStatusDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDetails, 0);
  objc_storeStrong((id *)&self->_linkedCaseIdentifiers, 0);
  objc_storeStrong((id *)&self->_claimIdentifier, 0);
  objc_storeStrong((id *)&self->_reasonCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_openDate, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end