@interface PKSavingsAccountFeatureDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)hideCreditRewardsHubSignage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSavingsAccountFeatureDescriptor:(id)a3;
- (BOOL)showCreditDashboardBalance;
- (BOOL)showCreditRewardsHubBalance;
- (BOOL)showSettingsBalance;
- (NSArray)supportedFileFormatsForTransactionData;
- (NSString)transferTermsIdentifier;
- (PKSavingsAccountFeatureDescriptor)initWithCoder:(id)a3;
- (PKSavingsAccountFeatureDescriptor)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)contactMethod;
- (unint64_t)fundingSourceTypes;
- (unint64_t)hash;
- (unint64_t)transferFrequencies;
- (void)encodeWithCoder:(id)a3;
- (void)setContactMethod:(unint64_t)a3;
- (void)setFundingSourceTypes:(unint64_t)a3;
- (void)setHideCreditRewardsHubSignage:(BOOL)a3;
- (void)setShowCreditDashboardBalance:(BOOL)a3;
- (void)setShowCreditRewardsHubBalance:(BOOL)a3;
- (void)setShowSettingsBalance:(BOOL)a3;
- (void)setSupportedFileFormatsForTransactionData:(id)a3;
- (void)setTransferFrequencies:(unint64_t)a3;
- (void)setTransferTermsIdentifier:(id)a3;
@end

@implementation PKSavingsAccountFeatureDescriptor

- (PKSavingsAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  v5 = [(PKAccountFeatureDescriptor *)&v14 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 PKArrayContaining:objc_opt_class() forKey:@"fundingSourceTypes"];
    v5->_fundingSourceTypes = PKAccountFundingSourceTypeFromStrings(v6);

    v7 = [v4 PKArrayContaining:objc_opt_class() forKey:@"transferFrequencies"];
    v5->_transferFrequencies = PKAccountTransferFrequencyFromStrings(v7);

    uint64_t v8 = [v4 PKStringForKey:@"transferTermsIdentifier"];
    transferTermsIdentifier = v5->_transferTermsIdentifier;
    v5->_transferTermsIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 PKArrayContaining:objc_opt_class() forKey:@"supportedFileFormatsForTransactionData"];
    supportedFileFormatsForTransactionData = v5->_supportedFileFormatsForTransactionData;
    v5->_supportedFileFormatsForTransactionData = (NSArray *)v10;

    v12 = [v4 PKStringForKey:@"contactMethod"];
    v5->_contactMethod = PKAccountAddBeneficiariesContactMethodFromString(v12);

    v5->_showCreditRewardsHubBalance = [v4 PKBoolForKey:@"showCreditRewardsHubBalance"];
    v5->_showCreditDashboardBalance = [v4 PKBoolForKey:@"showCreditDashboardBalance"];
    v5->_showSettingsBalance = [v4 PKBoolForKey:@"showSettingsBalance"];
    v5->_hideCreditRewardsHubSignage = [v4 PKBoolForKey:@"hideCreditRewardsHubSignage"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountFeatureDescriptor)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  v5 = [(PKAccountFeatureDescriptor *)&v14 initWithCoder:v4];
  if (v5)
  {
    v5->_fundingSourceTypes = [v4 decodeIntegerForKey:@"fundingSourceTypes"];
    v5->_transferFrequencies = [v4 decodeIntegerForKey:@"transferFrequencies"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferTermsIdentifier"];
    transferTermsIdentifier = v5->_transferTermsIdentifier;
    v5->_transferTermsIdentifier = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedFileFormatsForTransactionData"];
    supportedFileFormatsForTransactionData = v5->_supportedFileFormatsForTransactionData;
    v5->_supportedFileFormatsForTransactionData = (NSArray *)v11;

    v5->_contactMethod = [v4 decodeIntegerForKey:@"contactMethod"];
    v5->_showCreditRewardsHubBalance = [v4 decodeBoolForKey:@"showCreditRewardsHubBalance"];
    v5->_showCreditDashboardBalance = [v4 decodeBoolForKey:@"showCreditDashboardBalance"];
    v5->_showSettingsBalance = [v4 decodeBoolForKey:@"showSettingsBalance"];
    v5->_hideCreditRewardsHubSignage = [v4 decodeBoolForKey:@"hideCreditRewardsHubSignage"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  id v4 = a3;
  [(PKAccountFeatureDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_fundingSourceTypes, @"fundingSourceTypes", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_transferFrequencies forKey:@"transferFrequencies"];
  [v4 encodeObject:self->_transferTermsIdentifier forKey:@"transferTermsIdentifier"];
  [v4 encodeObject:self->_supportedFileFormatsForTransactionData forKey:@"supportedFileFormatsForTransactionData"];
  [v4 encodeInteger:self->_contactMethod forKey:@"contactMethod"];
  [v4 encodeBool:self->_showCreditRewardsHubBalance forKey:@"showCreditRewardsHubBalance"];
  [v4 encodeBool:self->_showCreditDashboardBalance forKey:@"showCreditDashboardBalance"];
  [v4 encodeBool:self->_showSettingsBalance forKey:@"showSettingsBalance"];
  [v4 encodeBool:self->_hideCreditRewardsHubSignage forKey:@"hideCreditRewardsHubSignage"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKAccountFeatureDescriptor *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];
  if (([v4 isEqualToString:@"scheduleOneTimeDeposit"] & 1) != 0
    || [v4 isEqualToString:@"scheduleOneTimeWithdrawal"])
  {
    objc_super v5 = [(PKAccountFeatureDescriptor *)self minimumAmount];
    [v3 appendFormat:@"minimumAmount: '%@'; ", v5];

    uint64_t v6 = [(PKAccountFeatureDescriptor *)self maximumAmount];
    [v3 appendFormat:@"maximumAmount: '%@'; ", v6];

    v7 = [(PKAccountFeatureDescriptor *)self merchantIdentifier];
    [v3 appendFormat:@"merchantIdentifier: '%@'; ", v7];

    uint64_t v8 = [(PKAccountFeatureDescriptor *)self supportedNetworks];
    [v3 appendFormat:@"supportedNetworks: '%@'; ", v8];

    v9 = PKAccountFundingSourceTypeToStrings(self->_fundingSourceTypes);
    [v3 appendFormat:@"fundingSourceTypes: '%@'; ", v9];

    uint64_t v10 = PKAccountTransferFrequencyToStrings(self->_transferFrequencies);
    [v3 appendFormat:@"transferFrequencies: '%@'; ", v10];

    [v3 appendFormat:@"transferTermsIdentifier: '%@'; ", self->_transferTermsIdentifier];
    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"addFundingSource"])
  {
    v12 = [(PKAccountFeatureDescriptor *)self fundingSourceTermsIdentifier];
    [v3 appendFormat:@"fundingSourceTermsIdentifier: '%@'; ", v12];
LABEL_13:

    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"exportTransactionData"])
  {
    objc_msgSend(v3, "appendFormat:", @"supportedFileFormatsForTransactionData: '%@'; ",
      self->_supportedFileFormatsForTransactionData);
    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"addBeneficiaries"])
  {
    v12 = PKAccountAddBeneficiariesContactMethodToString(self->_contactMethod);
    [v3 appendFormat:@"contactMethod: '%@'", v12];
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"FDICBehaviors"])
  {
    if (self->_showCreditRewardsHubBalance) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    [v3 appendFormat:@"showCreditRewardsHubBalance: '%@'", v13];
    if (self->_showCreditDashboardBalance) {
      objc_super v14 = @"YES";
    }
    else {
      objc_super v14 = @"NO";
    }
    [v3 appendFormat:@"showCreditDashboardBalance: '%@'", v14];
    if (self->_showSettingsBalance) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    [v3 appendFormat:@"showSettingsBalance: '%@'", v15];
    if (self->_hideCreditRewardsHubSignage) {
      v16 = @"YES";
    }
    else {
      v16 = @"NO";
    }
    [v3 appendFormat:@"hideCreditRewardsHubSignage: '%@'", v16];
  }
LABEL_4:
  [v3 appendFormat:@">"];

  return v3;
}

- (unint64_t)hash
{
  v14.receiver = self;
  v14.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  unint64_t v3 = [(PKAccountFeatureDescriptor *)&v14 hash];
  unint64_t v4 = self->_fundingSourceTypes - v3 + 32 * v3;
  unint64_t v5 = self->_transferFrequencies - v4 + 32 * v4;
  unint64_t v6 = self->_contactMethod - v5 + 32 * v5;
  uint64_t v7 = self->_showCreditRewardsHubBalance - v6 + 32 * v6;
  uint64_t v8 = self->_showCreditDashboardBalance - v7 + 32 * v7;
  uint64_t v9 = self->_showSettingsBalance - v8 + 32 * v8;
  uint64_t v10 = self->_hideCreditRewardsHubSignage - v9 + 32 * v9;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v11 safelyAddObject:self->_transferTermsIdentifier];
  [v11 safelyAddObject:self->_supportedFileFormatsForTransactionData];
  unint64_t v12 = PKCombinedHash(v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKSavingsAccountFeatureDescriptor *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKSavingsAccountFeatureDescriptor *)self isEqualToSavingsAccountFeatureDescriptor:v5];

  return v6;
}

- (BOOL)isEqualToSavingsAccountFeatureDescriptor:(id)a3
{
  unint64_t v4 = a3;
  if (![(PKAccountFeatureDescriptor *)self isEqualToAccountFeatureDescriptor:v4]
    || self->_fundingSourceTypes != v4[10]
    || self->_transferFrequencies != v4[11])
  {
    goto LABEL_25;
  }
  transferTermsIdentifier = self->_transferTermsIdentifier;
  BOOL v6 = (NSString *)v4[12];
  if (transferTermsIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (transferTermsIdentifier != v6) {
      goto LABEL_25;
    }
  }
  else if ((-[NSString isEqual:](transferTermsIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_25;
  }
  supportedFileFormatsForTransactionData = self->_supportedFileFormatsForTransactionData;
  uint64_t v9 = (NSArray *)v4[13];
  if (supportedFileFormatsForTransactionData) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (supportedFileFormatsForTransactionData == v9) {
      goto LABEL_20;
    }
LABEL_25:
    BOOL v11 = 0;
    goto LABEL_26;
  }
  if ((-[NSArray isEqual:](supportedFileFormatsForTransactionData, "isEqual:") & 1) == 0) {
    goto LABEL_25;
  }
LABEL_20:
  if (self->_contactMethod != v4[14]
    || self->_showCreditRewardsHubBalance != *((unsigned __int8 *)v4 + 72)
    || self->_showCreditDashboardBalance != *((unsigned __int8 *)v4 + 73)
    || self->_showSettingsBalance != *((unsigned __int8 *)v4 + 74))
  {
    goto LABEL_25;
  }
  BOOL v11 = self->_hideCreditRewardsHubSignage == *((unsigned __int8 *)v4 + 75);
LABEL_26:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKSavingsAccountFeatureDescriptor;
  unint64_t v5 = -[PKAccountFeatureDescriptor copyWithZone:](&v11, sel_copyWithZone_);
  v5[10] = self->_fundingSourceTypes;
  v5[11] = self->_transferFrequencies;
  uint64_t v6 = [(NSString *)self->_transferTermsIdentifier copyWithZone:a3];
  BOOL v7 = (void *)v5[12];
  v5[12] = v6;

  uint64_t v8 = [(NSArray *)self->_supportedFileFormatsForTransactionData copyWithZone:a3];
  uint64_t v9 = (void *)v5[13];
  v5[13] = v8;

  v5[14] = self->_contactMethod;
  *((unsigned char *)v5 + 72) = self->_showCreditRewardsHubBalance;
  *((unsigned char *)v5 + 73) = self->_showCreditDashboardBalance;
  *((unsigned char *)v5 + 74) = self->_showSettingsBalance;
  *((unsigned char *)v5 + 75) = self->_hideCreditRewardsHubSignage;
  return v5;
}

- (unint64_t)fundingSourceTypes
{
  return self->_fundingSourceTypes;
}

- (void)setFundingSourceTypes:(unint64_t)a3
{
  self->_fundingSourceTypes = a3;
}

- (unint64_t)transferFrequencies
{
  return self->_transferFrequencies;
}

- (void)setTransferFrequencies:(unint64_t)a3
{
  self->_transferFrequencies = a3;
}

- (NSString)transferTermsIdentifier
{
  return self->_transferTermsIdentifier;
}

- (void)setTransferTermsIdentifier:(id)a3
{
}

- (NSArray)supportedFileFormatsForTransactionData
{
  return self->_supportedFileFormatsForTransactionData;
}

- (void)setSupportedFileFormatsForTransactionData:(id)a3
{
}

- (unint64_t)contactMethod
{
  return self->_contactMethod;
}

- (void)setContactMethod:(unint64_t)a3
{
  self->_contactMethod = a3;
}

- (BOOL)showCreditRewardsHubBalance
{
  return self->_showCreditRewardsHubBalance;
}

- (void)setShowCreditRewardsHubBalance:(BOOL)a3
{
  self->_showCreditRewardsHubBalance = a3;
}

- (BOOL)showCreditDashboardBalance
{
  return self->_showCreditDashboardBalance;
}

- (void)setShowCreditDashboardBalance:(BOOL)a3
{
  self->_showCreditDashboardBalance = a3;
}

- (BOOL)showSettingsBalance
{
  return self->_showSettingsBalance;
}

- (void)setShowSettingsBalance:(BOOL)a3
{
  self->_showSettingsBalance = a3;
}

- (BOOL)hideCreditRewardsHubSignage
{
  return self->_hideCreditRewardsHubSignage;
}

- (void)setHideCreditRewardsHubSignage:(BOOL)a3
{
  self->_hideCreditRewardsHubSignage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFileFormatsForTransactionData, 0);
  objc_storeStrong((id *)&self->_transferTermsIdentifier, 0);
}

@end