@interface PKPeerPaymentRecurringPaymentTransaction
+ (BOOL)supportsSecureCoding;
+ (id)transactionWithDictionary:(id)a3;
- (BOOL)exceedsAppleCashLimits;
- (BOOL)isEqual:(id)a3;
- (NSDate)executionDate;
- (NSString)identifier;
- (PKPeerPaymentRecurringPaymentTransaction)initWithCoder:(id)a3;
- (PKPeerPaymentRecurringPaymentTransaction)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)errorCode;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setExecutionDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation PKPeerPaymentRecurringPaymentTransaction

+ (id)transactionWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return v5;
}

- (PKPeerPaymentRecurringPaymentTransaction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentRecurringPaymentTransaction;
  v5 = [(PKPeerPaymentRecurringPaymentTransaction *)&v17 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"identifier"];
    uint64_t v7 = [v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = [v4 PKStringForKey:@"status"];
    v5->_status = PKPeerPaymentRecurringPaymentTransactionStatusFromString(v9);

    v10 = [v4 PKDateForKey:@"executionDate"];
    uint64_t v11 = [v10 copy];
    executionDate = v5->_executionDate;
    v5->_executionDate = (NSDate *)v11;

    v13 = [v4 PKStringForKey:@"errorCode"];
    v14 = v13;
    if (v13) {
      uint64_t v15 = [v13 integerValue];
    }
    else {
      uint64_t v15 = [v4 PKIntegerForKey:@"errorCode"];
    }
    v5->_errorCode = v15;
  }
  return v5;
}

- (BOOL)exceedsAppleCashLimits
{
  return (unint64_t)(self->_errorCode - 40305) < 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentRecurringPaymentTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentRecurringPaymentTransaction;
  v5 = [(PKPeerPaymentRecurringPaymentTransaction *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = PKPeerPaymentRecurringPaymentTransactionStatusFromString(v8);

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"executionDate"];
    executionDate = v5->_executionDate;
    v5->_executionDate = (NSDate *)v9;

    v5->_errorCode = [v4 decodeIntegerForKey:@"errorCode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"identifier"];
  v5 = PKPeerPaymentRecurringPaymentTransactionStatusToString(self->_status);
  [v6 encodeObject:v5 forKey:@"status"];

  [v6 encodeObject:self->_executionDate forKey:@"executionDate"];
  [v6 encodeInteger:self->_errorCode forKey:@"errorCode"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_executionDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_status - v4 + 32 * v4;
  unint64_t v6 = self->_errorCode - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  identifier = self->_identifier;
  unint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_14;
  }
  executionDate = self->_executionDate;
  v8 = (NSDate *)v4[3];
  if (!executionDate || !v8)
  {
    if (executionDate == v8) {
      goto LABEL_12;
    }
LABEL_14:
    BOOL v9 = 0;
    goto LABEL_15;
  }
  if ((-[NSDate isEqual:](executionDate, "isEqual:") & 1) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  if (self->_status != v4[2]) {
    goto LABEL_14;
  }
  BOOL v9 = self->_errorCode == v4[4];
LABEL_15:

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  uint64_t v4 = PKPeerPaymentRecurringPaymentTransactionStatusToString(self->_status);
  [v3 appendFormat:@"status: '%@'; ", v4];

  [v3 appendFormat:@"executionDate: '%@'; ", self->_executionDate];
  objc_msgSend(v3, "appendFormat:", @"errorCode: '%ld'; ", self->_errorCode);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPeerPaymentRecurringPaymentTransaction allocWithZone:](PKPeerPaymentRecurringPaymentTransaction, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_status = self->_status;
  uint64_t v8 = [(NSDate *)self->_executionDate copyWithZone:a3];
  executionDate = v5->_executionDate;
  v5->_executionDate = (NSDate *)v8;

  v5->_errorCode = self->_errorCode;
  return v5;
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
  self->_status = a3;
}

- (NSDate)executionDate
{
  return self->_executionDate;
}

- (void)setExecutionDate:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end