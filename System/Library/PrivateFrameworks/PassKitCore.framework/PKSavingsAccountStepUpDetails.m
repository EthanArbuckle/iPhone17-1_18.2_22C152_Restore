@interface PKSavingsAccountStepUpDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)thresholdExceeded;
- (NSDate)neededBy;
- (PKSavingsAccountStepUpDetails)initWithCoder:(id)a3;
- (PKSavingsAccountStepUpDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setNeededBy:(id)a3;
- (void)setThresholdExceeded:(BOOL)a3;
@end

@implementation PKSavingsAccountStepUpDetails

- (PKSavingsAccountStepUpDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKSavingsAccountStepUpDetails;
    v5 = [(PKSavingsAccountStepUpDetails *)&v10 init];
    if (v5)
    {
      v5->_thresholdExceeded = [v4 PKBoolForKey:@"thresholdExceeded"];
      uint64_t v6 = [v4 PKDateForKey:@"neededBy"];
      neededBy = v5->_neededBy;
      v5->_neededBy = (NSDate *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountStepUpDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSavingsAccountStepUpDetails *)self init];
  if (v5)
  {
    v5->_thresholdExceeded = [v4 decodeBoolForKey:@"thresholdExceeded"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"neededBy"];
    neededBy = v5->_neededBy;
    v5->_neededBy = (NSDate *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL thresholdExceeded = self->_thresholdExceeded;
  id v5 = a3;
  [v5 encodeBool:thresholdExceeded forKey:@"thresholdExceeded"];
  [v5 encodeObject:self->_neededBy forKey:@"neededBy"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_thresholdExceeded == *((unsigned __int8 *)v4 + 8))
  {
    neededBy = self->_neededBy;
    uint64_t v6 = (NSDate *)v4[2];
    if (neededBy && v6) {
      char v7 = -[NSDate isEqual:](neededBy, "isEqual:");
    }
    else {
      char v7 = neededBy == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_neededBy];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_thresholdExceeded - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_thresholdExceeded) {
    unint64_t v5 = @"YES";
  }
  else {
    unint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"thresholdExceeded: '%@'; ", v5];
  uint64_t v6 = [(NSDate *)self->_neededBy description];
  [v4 appendFormat:@"neededBy: '%@'; ", v6];

  [v4 appendFormat:@">"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[PKSavingsAccountStepUpDetails allocWithZone:a3] init];
  v4->_BOOL thresholdExceeded = self->_thresholdExceeded;
  objc_storeStrong((id *)&v4->_neededBy, self->_neededBy);
  return v4;
}

- (BOOL)thresholdExceeded
{
  return self->_thresholdExceeded;
}

- (void)setThresholdExceeded:(BOOL)a3
{
  self->_BOOL thresholdExceeded = a3;
}

- (NSDate)neededBy
{
  return self->_neededBy;
}

- (void)setNeededBy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end