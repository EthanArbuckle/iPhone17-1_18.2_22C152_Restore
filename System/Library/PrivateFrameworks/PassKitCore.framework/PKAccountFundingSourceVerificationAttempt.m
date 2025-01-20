@interface PKAccountFundingSourceVerificationAttempt
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)expiryDate;
- (NSDate)sentDate;
- (PKAccountFundingSourceVerificationAttempt)initWithCoder:(id)a3;
- (PKAccountFundingSourceVerificationAttempt)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)failureReason;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setFailureReason:(unint64_t)a3;
- (void)setSentDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKAccountFundingSourceVerificationAttempt

- (PKAccountFundingSourceVerificationAttempt)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountFundingSourceVerificationAttempt;
  v5 = [(PKAccountFundingSourceVerificationAttempt *)&v13 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"type"];
    v5->_type = PKApplyVerificationTypeFromString(v6);

    uint64_t v7 = [v4 PKDateForKey:@"sentDate"];
    sentDate = v5->_sentDate;
    v5->_sentDate = (NSDate *)v7;

    uint64_t v9 = [v4 PKDateForKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v9;

    v11 = [v4 PKStringForKey:@"failureReason"];
    v5->_failureReason = PKAccountFundingSourceVerificationFailureReasonFromString(v11);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFundingSourceVerificationAttempt)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountFundingSourceVerificationAttempt;
  v5 = [(PKAccountFundingSourceVerificationAttempt *)&v11 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sentDate"];
    sentDate = v5->_sentDate;
    v5->_sentDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v8;

    v5->_failureReason = [v4 decodeIntegerForKey:@"failureReason"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_sentDate forKey:@"sentDate"];
  [v5 encodeObject:self->_expiryDate forKey:@"expiryDate"];
  [v5 encodeInteger:self->_failureReason forKey:@"failureReason"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_14;
  }
  sentDate = self->_sentDate;
  uint64_t v6 = (NSDate *)v4[2];
  if (sentDate && v6)
  {
    if ((-[NSDate isEqual:](sentDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (sentDate != v6)
  {
    goto LABEL_14;
  }
  expiryDate = self->_expiryDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (!expiryDate || !v8)
  {
    if (expiryDate == v8) {
      goto LABEL_12;
    }
LABEL_14:
    BOOL v9 = 0;
    goto LABEL_15;
  }
  if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  if (self->_failureReason != v4[4]) {
    goto LABEL_14;
  }
  BOOL v9 = self->_type == v4[1];
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_sentDate];
  [v3 safelyAddObject:self->_expiryDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_failureReason - v4 + 32 * v4;
  unint64_t v6 = self->_type - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = PKApplyVerificationTypeToString(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  [v3 appendFormat:@"sentDate: '%@'; ", self->_sentDate];
  [v3 appendFormat:@"expiryDate: '%@'; ", self->_expiryDate];
  unint64_t v5 = self->_failureReason - 1;
  if (v5 > 3) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = (__CFString *)qword_1E56EF110[v5];
  }
  [v3 appendFormat:@"failureReason: '%@'; ", v6];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKAccountFundingSourceVerificationAttempt allocWithZone:](PKAccountFundingSourceVerificationAttempt, "allocWithZone:") init];
  v5->_unint64_t type = self->_type;
  uint64_t v6 = [(NSDate *)self->_sentDate copyWithZone:a3];
  sentDate = v5->_sentDate;
  v5->_sentDate = (NSDate *)v6;

  uint64_t v8 = [(NSDate *)self->_expiryDate copyWithZone:a3];
  expiryDate = v5->_expiryDate;
  v5->_expiryDate = (NSDate *)v8;

  v5->_failureReason = self->_failureReason;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSDate)sentDate
{
  return self->_sentDate;
}

- (void)setSentDate:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(unint64_t)a3
{
  self->_failureReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_sentDate, 0);
}

@end