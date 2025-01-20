@interface PKCreditRecoveryPaymentPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)enrolled;
- (NSDate)enrollmentDate;
- (NSString)displayName;
- (NSString)identifier;
- (PKCreditRecoveryPaymentPlan)initWithCoder:(id)a3;
- (PKCreditRecoveryPaymentPlan)initWithDictionary:(id)a3 enrolled:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEnrolled:(BOOL)a3;
- (void)setEnrollmentDate:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PKCreditRecoveryPaymentPlan

- (PKCreditRecoveryPaymentPlan)initWithDictionary:(id)a3 enrolled:(BOOL)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCreditRecoveryPaymentPlan;
  v7 = [(PKCreditRecoveryPaymentPlan *)&v16 init];
  v8 = v7;
  if (v7)
  {
    v7->_enrolled = a4;
    uint64_t v9 = [v6 PKStringForKey:@"identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v6 PKStringForKey:@"displayName"];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;

    uint64_t v13 = [v6 PKDateForKey:@"enrollmentDate"];
    enrollmentDate = v8->_enrollmentDate;
    v8->_enrollmentDate = (NSDate *)v13;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditRecoveryPaymentPlan)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCreditRecoveryPaymentPlan;
  v5 = [(PKCreditRecoveryPaymentPlan *)&v13 init];
  if (v5)
  {
    v5->_enrolled = [v4 decodeBoolForKey:@"enrolled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enrollmentDate"];
    enrollmentDate = v5->_enrollmentDate;
    v5->_enrollmentDate = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL enrolled = self->_enrolled;
  id v5 = a3;
  [v5 encodeBool:enrolled forKey:@"enrolled"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_enrollmentDate forKey:@"enrollmentDate"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_enrolled) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  [v3 appendFormat:@"enrolled: '%@'; ", v5];
  [v4 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v4 appendFormat:@"displayName: '%@'; ", self->_displayName];
  [v4 appendFormat:@"enrollmentDate: '%@'; ", self->_enrollmentDate];
  [v4 appendString:@">"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PKCreditRecoveryPaymentPlan allocWithZone:a3] init];
  v4->_BOOL enrolled = self->_enrolled;
  uint64_t v5 = [(NSString *)self->_identifier copy];
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_displayName copy];
  displayName = v4->_displayName;
  v4->_displayName = (NSString *)v7;

  uint64_t v9 = [(NSDate *)self->_enrollmentDate copy];
  enrollmentDate = v4->_enrollmentDate;
  v4->_enrollmentDate = (NSDate *)v9;

  return v4;
}

- (BOOL)enrolled
{
  return self->_enrolled;
}

- (void)setEnrolled:(BOOL)a3
{
  self->_BOOL enrolled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSDate)enrollmentDate
{
  return self->_enrollmentDate;
}

- (void)setEnrollmentDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end