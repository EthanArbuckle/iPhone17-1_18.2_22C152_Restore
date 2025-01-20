@interface PKApplyVerificationInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)skippedVerification;
- (NSArray)trialDeposits;
- (NSString)data;
- (PKApplyVerificationInformation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setSkippedVerification:(BOOL)a3;
- (void)setTrialDeposits:(id)a3;
@end

@implementation PKApplyVerificationInformation

- (PKApplyVerificationInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyVerificationInformation;
  v5 = [(PKApplyVerificationInformation *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"trialDeposits"];
    trialDeposits = v5->_trialDeposits;
    v5->_trialDeposits = (NSArray *)v11;

    v5->_skippedVerification = [v4 decodeBoolForKey:@"skippedVerification"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"data"];
  [v5 encodeObject:self->_trialDeposits forKey:@"trialDeposits"];
  [v5 encodeBool:self->_skippedVerification forKey:@"skippedVerification"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSArray)trialDeposits
{
  return self->_trialDeposits;
}

- (void)setTrialDeposits:(id)a3
{
}

- (BOOL)skippedVerification
{
  return self->_skippedVerification;
}

- (void)setSkippedVerification:(BOOL)a3
{
  self->_skippedVerification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialDeposits, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end