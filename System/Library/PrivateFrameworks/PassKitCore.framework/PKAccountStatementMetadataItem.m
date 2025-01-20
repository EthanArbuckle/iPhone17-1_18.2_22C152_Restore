@interface PKAccountStatementMetadataItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenProcessed;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastProcessedDate;
- (NSDate)lastReportDate;
- (NSString)identifier;
- (NSString)originatorAltDSID;
- (NSString)zoneName;
- (PKAccountStatementMetadataItem)initWithCoder:(id)a3;
- (PKAccountStatementMetadataItem)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)accountEventType;
- (int64_t)processedAttemptCount;
- (int64_t)reportCount;
- (unint64_t)error;
- (unint64_t)hash;
- (unint64_t)status;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountEventType:(int64_t)a3;
- (void)setError:(unint64_t)a3;
- (void)setHasBeenProcessed:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastProcessedDate:(id)a3;
- (void)setLastReportDate:(id)a3;
- (void)setOriginatorAltDSID:(id)a3;
- (void)setProcessedAttemptCount:(int64_t)a3;
- (void)setReportCount:(int64_t)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setType:(unint64_t)a3;
- (void)setZoneName:(id)a3;
@end

@implementation PKAccountStatementMetadataItem

- (PKAccountStatementMetadataItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountStatementMetadataItem;
  v5 = [(PKAccountStatementMetadataItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"type"];
    v5->_type = PKAccountStatementMetadataItemTypeFromString(v8);

    v9 = [v4 PKStringForKey:@"accountEventType"];
    v5->_accountEventType = PKAccountEventTypeFromString(v9);

    uint64_t v10 = [v4 PKStringForKey:@"originatorAltDSID"];
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v12;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 safelySetObject:self->_identifier forKey:@"identifier"];
  unint64_t type = self->_type;
  v5 = @"unknown";
  uint64_t v6 = @"accountEvent";
  if (type != 2) {
    uint64_t v6 = @"unknown";
  }
  if (type == 1) {
    v7 = @"transaction";
  }
  else {
    v7 = v6;
  }
  [v3 safelySetObject:v7 forKey:@"type"];
  v8 = PKAccountEventTypeToString(self->_accountEventType);
  [v3 safelySetObject:v8 forKey:@"accountEventType"];

  [v3 safelySetObject:self->_originatorAltDSID forKey:@"originatorAltDSID"];
  [v3 safelySetObject:self->_zoneName forKey:@"zoneName"];
  unint64_t status = self->_status;
  uint64_t v10 = @"missing";
  if (status != 2) {
    uint64_t v10 = @"unknown";
  }
  if (status == 1) {
    v11 = @"onDevice";
  }
  else {
    v11 = v10;
  }
  [v3 safelySetObject:v11 forKey:@"status"];
  uint64_t v12 = [NSNumber numberWithBool:self->_hasBeenProcessed];
  [v3 safelySetObject:v12 forKey:@"hasBeenProcessed"];

  v13 = [NSNumber numberWithInteger:self->_processedAttemptCount];
  [v3 safelySetObject:v13 forKey:@"processedAttemptCount"];

  v14 = PKISO8601DateStringFromDate(self->_lastProcessedDate);
  [v3 safelySetObject:v14 forKey:@"lastProcessedDate"];

  objc_super v15 = PKISO8601DateStringFromDate(self->_lastReportDate);
  [v3 safelySetObject:v15 forKey:@"lastReportDate"];

  v16 = [NSNumber numberWithInteger:self->_reportCount];
  [v3 safelySetObject:v16 forKey:@"reportCount"];

  unint64_t error = self->_error;
  if (error <= 2) {
    v5 = off_1E56F53C0[error];
  }
  [v3 safelySetObject:v5 forKey:@"error"];
  v18 = (void *)[v3 copy];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountStatementMetadataItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountStatementMetadataItem;
  v5 = [(PKAccountStatementMetadataItem *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_accountEventType = [v4 decodeIntegerForKey:@"accountEventType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatorAltDSID"];
    originatorAltDSID = v5->_originatorAltDSID;
    v5->_originatorAltDSID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneName"];
    zoneName = v5->_zoneName;
    v5->_zoneName = (NSString *)v10;

    v5->_unint64_t status = [v4 decodeIntegerForKey:@"status"];
    v5->_hasBeenProcessed = [v4 decodeBoolForKey:@"hasBeenProcessed"];
    v5->_processedAttemptCount = [v4 decodeIntegerForKey:@"processedAttemptCount"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastProcessedDate"];
    lastProcessedDate = v5->_lastProcessedDate;
    v5->_lastProcessedDate = (NSDate *)v12;

    v5->_lastReportDate = (NSDate *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastReportDate"];
    v5->_unint64_t error = [v4 decodeIntegerForKey:@"error"];
    v5->_reportCount = [v4 decodeIntegerForKey:@"reportCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_accountEventType forKey:@"accountEventType"];
  [v5 encodeObject:self->_originatorAltDSID forKey:@"originatorAltDSID"];
  [v5 encodeObject:self->_zoneName forKey:@"zoneName"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeBool:self->_hasBeenProcessed forKey:@"hasBeenProcessed"];
  [v5 encodeInteger:self->_processedAttemptCount forKey:@"processedAttemptCount"];
  [v5 encodeObject:self->_lastProcessedDate forKey:@"lastProcessedDate"];
  [v5 encodeObject:self->_lastReportDate forKey:@"lastReportDate"];
  [v5 encodeInteger:self->_error forKey:@"error"];
  [v5 encodeInteger:self->_reportCount forKey:@"reportCount"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  id v5 = (void *)v4[2];
  uint64_t v6 = self->_identifier;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    uint64_t v8 = v7;
    if (!v6 || !v7) {
      goto LABEL_19;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_20;
    }
  }
  uint64_t v10 = (void *)v4[5];
  uint64_t v6 = self->_originatorAltDSID;
  v11 = v10;
  if (v6 == v11)
  {
  }
  else
  {
    uint64_t v8 = v11;
    if (!v6 || !v11) {
      goto LABEL_19;
    }
    BOOL v12 = [(NSString *)v6 isEqualToString:v11];

    if (!v12) {
      goto LABEL_20;
    }
  }
  v13 = (void *)v4[6];
  uint64_t v6 = self->_zoneName;
  v14 = v13;
  if (v6 != v14)
  {
    uint64_t v8 = v14;
    if (v6 && v14)
    {
      BOOL v15 = [(NSString *)v6 isEqualToString:v14];

      if (!v15) {
        goto LABEL_20;
      }
      goto LABEL_23;
    }
LABEL_19:

    goto LABEL_20;
  }

LABEL_23:
  lastProcessedDate = self->_lastProcessedDate;
  v19 = (NSDate *)v4[9];
  if (lastProcessedDate && v19)
  {
    if ((-[NSDate isEqual:](lastProcessedDate, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (lastProcessedDate != v19)
  {
    goto LABEL_20;
  }
  lastReportDate = self->_lastReportDate;
  v21 = (NSDate *)v4[10];
  if (lastReportDate && v21)
  {
    if ((-[NSDate isEqual:](lastReportDate, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (lastReportDate != v21)
  {
    goto LABEL_20;
  }
  if (self->_status == v4[7]
    && self->_type == v4[3]
    && self->_accountEventType == v4[4]
    && self->_hasBeenProcessed == *((unsigned __int8 *)v4 + 8)
    && self->_processedAttemptCount == v4[8]
    && self->_reportCount == v4[11])
  {
    BOOL v16 = self->_error == v4[12];
    goto LABEL_21;
  }
LABEL_20:
  BOOL v16 = 0;
LABEL_21:

  return v16;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_originatorAltDSID];
  [v3 safelyAddObject:self->_zoneName];
  [v3 safelyAddObject:self->_lastProcessedDate];
  [v3 safelyAddObject:self->_lastReportDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_status - v4 + 32 * v4;
  unint64_t v6 = self->_type - v5 + 32 * v5;
  int64_t v7 = self->_accountEventType - v6 + 32 * v6;
  uint64_t v8 = self->_hasBeenProcessed - v7 + 32 * v7;
  int64_t v9 = self->_processedAttemptCount - v8 + 32 * v8;
  unint64_t v10 = self->_error - v9 + 32 * v9;
  unint64_t v11 = self->_reportCount - v10 + 32 * v10;

  return v11;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t type = self->_type;
  unint64_t v5 = @"unknown";
  unint64_t v6 = @"accountEvent";
  if (type != 2) {
    unint64_t v6 = @"unknown";
  }
  if (type == 1) {
    int64_t v7 = @"transaction";
  }
  else {
    int64_t v7 = v6;
  }
  [v3 appendFormat:@"type: '%@'; ", v7];
  uint64_t v8 = PKAccountEventTypeToString(self->_accountEventType);
  [v3 appendFormat:@"accountEventType: '%@'; ", v8];

  [v3 appendFormat:@"originatorAltDSID: '%@'; ", self->_originatorAltDSID];
  [v3 appendFormat:@"zoneName: '%@'; ", self->_zoneName];
  unint64_t status = self->_status;
  unint64_t v10 = @"missing";
  if (status != 2) {
    unint64_t v10 = @"unknown";
  }
  if (status == 1) {
    unint64_t v11 = @"onDevice";
  }
  else {
    unint64_t v11 = v10;
  }
  [v3 appendFormat:@"status: '%@'; ", v11];
  if (self->_hasBeenProcessed) {
    BOOL v12 = @"YES";
  }
  else {
    BOOL v12 = @"NO";
  }
  [v3 appendFormat:@"hasBeenProcessed: '%@'; ", v12];
  objc_msgSend(v3, "appendFormat:", @"processedAttemptCount: %ld; ", self->_processedAttemptCount);
  [v3 appendFormat:@"lastProcessedDate: '%@'; ", self->_lastProcessedDate];
  [v3 appendFormat:@"lastReportDate: '%@'; ", self->_lastReportDate];
  objc_msgSend(v3, "appendFormat:", @"reportCount: %ld; ", self->_reportCount);
  unint64_t error = self->_error;
  if (error <= 2) {
    unint64_t v5 = off_1E56F53C0[error];
  }
  [v3 appendFormat:@"error: '%@'; ", v5];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  int64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_originatorAltDSID copyWithZone:a3];
  int64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_zoneName copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSDate *)self->_lastProcessedDate copyWithZone:a3];
  v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  *(void *)(v5 + 56) = self->_status;
  *(void *)(v5 + 24) = self->_type;
  *(void *)(v5 + 32) = self->_accountEventType;
  *(unsigned char *)(v5 + 8) = self->_hasBeenProcessed;
  *(void *)(v5 + 64) = self->_processedAttemptCount;
  *(void *)(v5 + 96) = self->_error;
  return (id)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (int64_t)accountEventType
{
  return self->_accountEventType;
}

- (void)setAccountEventType:(int64_t)a3
{
  self->_accountEventType = a3;
}

- (NSString)originatorAltDSID
{
  return self->_originatorAltDSID;
}

- (void)setOriginatorAltDSID:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
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

- (BOOL)hasBeenProcessed
{
  return self->_hasBeenProcessed;
}

- (void)setHasBeenProcessed:(BOOL)a3
{
  self->_hasBeenProcessed = a3;
}

- (int64_t)processedAttemptCount
{
  return self->_processedAttemptCount;
}

- (void)setProcessedAttemptCount:(int64_t)a3
{
  self->_processedAttemptCount = a3;
}

- (NSDate)lastProcessedDate
{
  return self->_lastProcessedDate;
}

- (void)setLastProcessedDate:(id)a3
{
}

- (NSDate)lastReportDate
{
  return self->_lastReportDate;
}

- (void)setLastReportDate:(id)a3
{
  self->_lastReportDate = (NSDate *)a3;
}

- (int64_t)reportCount
{
  return self->_reportCount;
}

- (void)setReportCount:(int64_t)a3
{
  self->_reportCount = a3;
}

- (unint64_t)error
{
  return self->_error;
}

- (void)setError:(unint64_t)a3
{
  self->_unint64_t error = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDate, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_originatorAltDSID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end