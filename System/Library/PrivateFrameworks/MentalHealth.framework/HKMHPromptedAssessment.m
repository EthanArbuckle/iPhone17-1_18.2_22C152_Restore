@interface HKMHPromptedAssessment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKMHPromptedAssessment)initWithCoder:(id)a3;
- (HKMHPromptedAssessment)initWithEligibilityStartDate:(id)a3 reason:(int64_t)a4;
- (NSDate)eligibilityStartDate;
- (int64_t)reason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMHPromptedAssessment

- (HKMHPromptedAssessment)initWithEligibilityStartDate:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMHPromptedAssessment;
  v7 = [(HKMHPromptedAssessment *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    eligibilityStartDate = v7->_eligibilityStartDate;
    v7->_eligibilityStartDate = (NSDate *)v8;

    v7->_reason = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if ([(NSDate *)self->_eligibilityStartDate isEqualToDate:v5[1]]) {
      BOOL v6 = self->_reason == v5[2];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_reason ^ [(NSDate *)self->_eligibilityStartDate hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHPromptedAssessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibilityStartDate"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"reason"];

  v7 = [(HKMHPromptedAssessment *)self initWithEligibilityStartDate:v5 reason:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  eligibilityStartDate = self->_eligibilityStartDate;
  id v5 = a3;
  [v5 encodeObject:eligibilityStartDate forKey:@"eligibilityStartDate"];
  [v5 encodeInteger:self->_reason forKey:@"reason"];
}

- (NSDate)eligibilityStartDate
{
  return self->_eligibilityStartDate;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end