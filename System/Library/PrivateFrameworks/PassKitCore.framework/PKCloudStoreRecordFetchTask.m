@interface PKCloudStoreRecordFetchTask
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastErrorIsSetupAssistantNotComplete;
- (NSDate)endDate;
- (NSDate)nextPossibleFetchDate;
- (NSDate)startDate;
- (NSError)lastError;
- (NSString)transactionSourceIdentifier;
- (PKCloudStoreRecordFetchTask)initWithCloudStoreZone:(id)a3 type:(unint64_t)a4;
- (PKCloudStoreRecordFetchTask)initWithCoder:(id)a3;
- (PKCloudStoreRecordFetchTask)initWithTransactionSourceIdentifier:(id)a3 type:(unint64_t)a4;
- (PKCloudStoreRecordFetchTask)initWithType:(unint64_t)a3;
- (PKCloudStoreZone)cloudStoreZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)identifier;
- (int64_t)backoffLevel;
- (unint64_t)hash;
- (unint64_t)status;
- (unint64_t)type;
- (void)completeTaskWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)queueTask;
- (void)setBackoffLevel:(int64_t)a3;
- (void)setCloudStoreZone:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setLastError:(id)a3;
- (void)setNextPossibleFetchDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTransactionSourceIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)startTask;
@end

@implementation PKCloudStoreRecordFetchTask

- (PKCloudStoreRecordFetchTask)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCloudStoreRecordFetchTask;
  result = [(PKCloudStoreRecordFetchTask *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (PKCloudStoreRecordFetchTask)initWithTransactionSourceIdentifier:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(PKCloudStoreRecordFetchTask *)self initWithType:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_transactionSourceIdentifier, a3);
  }

  return v9;
}

- (PKCloudStoreRecordFetchTask)initWithCloudStoreZone:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(PKCloudStoreRecordFetchTask *)self initWithType:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_cloudStoreZone, a3);
  }

  return v9;
}

- (id)identifier
{
  transactionSourceIdentifier = self->_transactionSourceIdentifier;
  if (transactionSourceIdentifier)
  {
    v3 = transactionSourceIdentifier;
  }
  else
  {
    cloudStoreZone = self->_cloudStoreZone;
    if (cloudStoreZone)
    {
      v3 = [(PKCloudStoreZone *)cloudStoreZone zoneName];
    }
    else
    {
      v3 = &stru_1EE0F5368;
    }
  }
  return v3;
}

- (void)startTask
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  startDate = self->_startDate;
  self->_startDate = v3;

  endDate = self->_endDate;
  self->_endDate = 0;

  lastError = self->_lastError;
  self->_lastError = 0;

  nextPossibleFetchDate = self->_nextPossibleFetchDate;
  self->_nextPossibleFetchDate = 0;

  self->_status = 1;
}

- (void)queueTask
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  startDate = self->_startDate;
  self->_startDate = v3;

  endDate = self->_endDate;
  self->_endDate = 0;

  lastError = self->_lastError;
  self->_lastError = 0;

  nextPossibleFetchDate = self->_nextPossibleFetchDate;
  self->_nextPossibleFetchDate = 0;

  self->_status = 4;
}

- (void)completeTaskWithError:(id)a3
{
  id v13 = a3;
  objc_super v5 = [MEMORY[0x1E4F1C9C8] date];
  endDate = self->_endDate;
  self->_endDate = v5;

  unint64_t v7 = 2;
  if (v13) {
    unint64_t v7 = 3;
  }
  self->_status = v7;
  objc_storeStrong((id *)&self->_lastError, a3);
  BOOL v8 = [(PKCloudStoreRecordFetchTask *)self lastErrorIsSetupAssistantNotComplete];
  if (self->_status != 3 || v8)
  {
    nextPossibleFetchDate = self->_nextPossibleFetchDate;
    self->_int64_t backoffLevel = 0;
    self->_nextPossibleFetchDate = 0;
  }
  else
  {
    int64_t backoffLevel = self->_backoffLevel;
    self->_int64_t backoffLevel = backoffLevel + 1;
    if ((unint64_t)(backoffLevel + 1) < 0xD) {
      uint64_t v10 = backoffLevel + 1;
    }
    else {
      uint64_t v10 = 13;
    }
    v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:PKCloudStoreRecordFetchTaskBackOffLevelIntervals[v10]];
    nextPossibleFetchDate = self->_nextPossibleFetchDate;
    self->_nextPossibleFetchDate = v11;
  }
}

- (BOOL)lastErrorIsSetupAssistantNotComplete
{
  lastError = self->_lastError;
  if (lastError)
  {
    v4 = [(NSError *)lastError domain];
    objc_super v5 = @"PKPassKitErrorDomain";
    if (v4 != v5)
    {
      v6 = v5;
      if (v4) {
        BOOL v7 = v5 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (v7)
      {
      }
      else
      {
        int v9 = [(__CFString *)v4 isEqualToString:v5];

        if (v9) {
          goto LABEL_12;
        }
      }
      BOOL v8 = 0;
      goto LABEL_14;
    }

LABEL_12:
    BOOL v8 = [(NSError *)self->_lastError code] == -4016;
LABEL_14:

    return v8;
  }
  return 0;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  unint64_t v5 = self->_type - 1;
  if (v5 > 2) {
    v6 = @"unknown";
  }
  else {
    v6 = off_1E56EC2B8[v5];
  }
  [v3 setObject:v6 forKeyedSubscript:@"type"];
  unint64_t v7 = self->_status - 1;
  if (v7 > 3) {
    BOOL v8 = @"unknown";
  }
  else {
    BOOL v8 = off_1E56EC2D0[v7];
  }
  [v4 setObject:v8 forKeyedSubscript:@"status"];
  [v4 setObject:self->_transactionSourceIdentifier forKeyedSubscript:@"transactionSourceIdentifier"];
  int v9 = [(PKCloudStoreZone *)self->_cloudStoreZone zoneName];
  [v4 setObject:v9 forKeyedSubscript:@"cloudStoreZone"];

  uint64_t v10 = [(NSDate *)self->_startDate description];
  [v4 setObject:v10 forKeyedSubscript:@"startDate"];

  v11 = [(NSDate *)self->_endDate description];
  [v4 setObject:v11 forKeyedSubscript:@"endDate"];

  v12 = [NSNumber numberWithInteger:self->_backoffLevel];
  [v4 setObject:v12 forKeyedSubscript:@"backoffLevel"];

  id v13 = [(NSDate *)self->_nextPossibleFetchDate description];
  [v4 setObject:v13 forKeyedSubscript:@"nextPossibleFetchDate"];

  v14 = [(NSError *)self->_lastError description];
  [v4 setObject:v14 forKeyedSubscript:@"lastError"];

  v15 = (void *)[v4 copy];
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreRecordFetchTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKCloudStoreRecordFetchTask;
  unint64_t v5 = [(PKCloudStoreRecordFetchTask *)&v19 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionSourceIdentifier"];
    transactionSourceIdentifier = v5->_transactionSourceIdentifier;
    v5->_transactionSourceIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cloudStoreZone"];
    cloudStoreZone = v5->_cloudStoreZone;
    v5->_cloudStoreZone = (PKCloudStoreZone *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    v5->_int64_t backoffLevel = [v4 decodeIntegerForKey:@"backoffLevel"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextPossibleFetchDate"];
    nextPossibleFetchDate = v5->_nextPossibleFetchDate;
    v5->_nextPossibleFetchDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastError"];
    lastError = v5->_lastError;
    v5->_lastError = (NSError *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_transactionSourceIdentifier forKey:@"transactionSourceIdentifier"];
  [v5 encodeObject:self->_cloudStoreZone forKey:@"cloudStoreZone"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeInteger:self->_backoffLevel forKey:@"backoffLevel"];
  [v5 encodeObject:self->_nextPossibleFetchDate forKey:@"nextPossibleFetchDate"];
  [v5 encodeObject:self->_lastError forKey:@"lastError"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKCloudStoreRecordFetchTask allocWithZone:](PKCloudStoreRecordFetchTask, "allocWithZone:") init];
  v5->_unint64_t type = self->_type;
  v5->_status = self->_status;
  uint64_t v6 = [(NSString *)self->_transactionSourceIdentifier copyWithZone:a3];
  transactionSourceIdentifier = v5->_transactionSourceIdentifier;
  v5->_transactionSourceIdentifier = (NSString *)v6;

  uint64_t v8 = [(PKCloudStoreZone *)self->_cloudStoreZone copyWithZone:a3];
  cloudStoreZone = v5->_cloudStoreZone;
  v5->_cloudStoreZone = v8;

  uint64_t v10 = [(NSDate *)self->_startDate copyWithZone:a3];
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v10;

  uint64_t v12 = [(NSDate *)self->_endDate copyWithZone:a3];
  endDate = v5->_endDate;
  v5->_endDate = (NSDate *)v12;

  v5->_int64_t backoffLevel = self->_backoffLevel;
  uint64_t v14 = [(NSDate *)self->_nextPossibleFetchDate copyWithZone:a3];
  nextPossibleFetchDate = v5->_nextPossibleFetchDate;
  v5->_nextPossibleFetchDate = (NSDate *)v14;

  uint64_t v16 = [(NSError *)self->_lastError copyWithZone:a3];
  lastError = v5->_lastError;
  v5->_lastError = (NSError *)v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;
  unint64_t v7 = v6;
  if (!v6 || self->_type != v6[1] || self->_status != v6[2]) {
    goto LABEL_37;
  }
  uint64_t v8 = (void *)v6[3];
  int v9 = self->_transactionSourceIdentifier;
  uint64_t v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
    {

      goto LABEL_37;
    }
    BOOL v12 = [(NSString *)v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_37;
    }
  }
  cloudStoreZone = self->_cloudStoreZone;
  uint64_t v14 = (PKCloudStoreZone *)v7[4];
  if (cloudStoreZone && v14)
  {
    if (!-[PKCloudStoreZone isEqual:](cloudStoreZone, "isEqual:")) {
      goto LABEL_37;
    }
  }
  else if (cloudStoreZone != v14)
  {
    goto LABEL_37;
  }
  startDate = self->_startDate;
  uint64_t v16 = (NSDate *)v7[5];
  if (startDate && v16)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_37;
    }
  }
  else if (startDate != v16)
  {
    goto LABEL_37;
  }
  endDate = self->_endDate;
  v18 = (NSDate *)v7[6];
  if (endDate && v18)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0) {
      goto LABEL_37;
    }
  }
  else if (endDate != v18)
  {
    goto LABEL_37;
  }
  if (self->_backoffLevel != v7[7]) {
    goto LABEL_37;
  }
  nextPossibleFetchDate = self->_nextPossibleFetchDate;
  v20 = (NSDate *)v7[8];
  if (!nextPossibleFetchDate || !v20)
  {
    if (nextPossibleFetchDate == v20) {
      goto LABEL_33;
    }
LABEL_37:
    char v23 = 0;
    goto LABEL_38;
  }
  if ((-[NSDate isEqual:](nextPossibleFetchDate, "isEqual:") & 1) == 0) {
    goto LABEL_37;
  }
LABEL_33:
  lastError = self->_lastError;
  v22 = (NSError *)v7[9];
  if (lastError && v22) {
    char v23 = -[NSError isEqual:](lastError, "isEqual:");
  }
  else {
    char v23 = lastError == v22;
  }
LABEL_38:

  return v23;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_transactionSourceIdentifier];
  [v3 safelyAddObject:self->_cloudStoreZone];
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  [v3 safelyAddObject:self->_lastError];
  [v3 safelyAddObject:self->_nextPossibleFetchDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;
  unint64_t v6 = self->_status - v5 + 32 * v5;
  unint64_t v7 = self->_backoffLevel - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  unint64_t v5 = self->_type - 1;
  if (v5 > 2) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56EC2B8[v5];
  }
  [v3 appendFormat:@"type: '%@'; ", v6];
  unint64_t v7 = self->_status - 1;
  if (v7 > 3) {
    uint64_t v8 = @"unknown";
  }
  else {
    uint64_t v8 = off_1E56EC2D0[v7];
  }
  [v4 appendFormat:@"status: '%@'; ", v8];
  if (self->_transactionSourceIdentifier) {
    [v4 appendFormat:@"transactionSourceIdentifier: '%@'; ", self->_transactionSourceIdentifier];
  }
  cloudStoreZone = self->_cloudStoreZone;
  if (cloudStoreZone)
  {
    uint64_t v10 = [(PKCloudStoreZone *)cloudStoreZone zoneName];
    [v4 appendFormat:@"cloudStoreZone: '%@'; ", v10];
  }
  [v4 appendFormat:@"startDate: '%@'; ", self->_startDate];
  if (self->_endDate) {
    [v4 appendFormat:@"endDate: '%@'; ", self->_endDate];
  }
  if (self->_lastError) {
    [v4 appendFormat:@"lastError: '%@'; ", self->_lastError];
  }
  if (self->_backoffLevel >= 1) {
    objc_msgSend(v4, "appendFormat:", @"backoffLevel: %ld; ", self->_backoffLevel);
  }
  if (self->_nextPossibleFetchDate) {
    [v4 appendFormat:@"nextPossibleFetchDate: '%@'; ", self->_nextPossibleFetchDate];
  }
  [v4 appendFormat:@">"];
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
}

- (PKCloudStoreZone)cloudStoreZone
{
  return self->_cloudStoreZone;
}

- (void)setCloudStoreZone:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)backoffLevel
{
  return self->_backoffLevel;
}

- (void)setBackoffLevel:(int64_t)a3
{
  self->_int64_t backoffLevel = a3;
}

- (NSDate)nextPossibleFetchDate
{
  return self->_nextPossibleFetchDate;
}

- (void)setNextPossibleFetchDate:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_nextPossibleFetchDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_cloudStoreZone, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
}

@end