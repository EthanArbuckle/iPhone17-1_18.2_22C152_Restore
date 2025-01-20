@interface PKCreditAccountFeatureDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCreditAccountFeatureDescriptor:(id)a3;
- (NSArray)supportedDestinations;
- (NSArray)supportedFileFormatsForTransactionData;
- (NSDecimalNumber)savingsAPY;
- (NSDecimalNumber)savingsInterestRate;
- (NSString)paymentTermsIdentifier;
- (PKCreditAccountFeatureDescriptor)initWithCoder:(id)a3;
- (PKCreditAccountFeatureDescriptor)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)productForFeature:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)maximumAccountUsers;
- (unint64_t)minimumOwnerAge;
- (unint64_t)minimumParticipantAge;
- (unint64_t)paymentFrequencies;
- (unint64_t)paymentFundingSourceTypes;
- (unint64_t)paymentPresets;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumAccountUsers:(unint64_t)a3;
- (void)setMinimumOwnerAge:(unint64_t)a3;
- (void)setMinimumParticipantAge:(unint64_t)a3;
- (void)setPaymentFrequencies:(unint64_t)a3;
- (void)setPaymentFundingSourceTypes:(unint64_t)a3;
- (void)setPaymentPresets:(unint64_t)a3;
- (void)setPaymentTermsIdentifier:(id)a3;
- (void)setSavingsAPY:(id)a3;
- (void)setSavingsInterestRate:(id)a3;
- (void)setSupportedDestinations:(id)a3;
- (void)setSupportedFileFormatsForTransactionData:(id)a3;
@end

@implementation PKCreditAccountFeatureDescriptor

- (PKCreditAccountFeatureDescriptor)initWithDictionary:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)PKCreditAccountFeatureDescriptor;
  v5 = [(PKAccountFeatureDescriptor *)&v64 initWithDictionary:v4];
  v6 = v5;
  if (v5)
  {
    v60 = v5;
    v61 = v4;
    v7 = [v4 PKArrayContaining:objc_opt_class() forKey:@"paymentPresets"];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (!v8)
    {
      unint64_t v10 = 0;
      goto LABEL_22;
    }
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v66;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v66 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = (__CFString *)*(id *)(*((void *)&v65 + 1) + 8 * v12);
        if (v13 == @"fixedAmount") {
          goto LABEL_10;
        }
        v14 = v13;
        if (!v13) {
          goto LABEL_11;
        }
        int v15 = [@"fixedAmount" isEqualToString:v13];

        if (v15)
        {
LABEL_10:
          v10 |= 1uLL;
        }
        else
        {
          v16 = v14;
          if (v16 == @"minimumDue"
            || (v17 = v16, int v18 = [@"minimumDue" isEqualToString:v16], v17, v18))
          {
            v10 |= 2uLL;
          }
          else
          {
            v19 = v17;
            if (v19 == @"statementBalance"
              || (v20 = v19,
                  int v21 = [@"statementBalance" isEqualToString:v19],
                  v20,
                  v21))
            {
              v10 |= 4uLL;
            }
          }
        }
LABEL_11:
        ++v12;
      }
      while (v9 != v12);
      uint64_t v22 = [v7 countByEnumeratingWithState:&v65 objects:v69 count:16];
      uint64_t v9 = v22;
      if (!v22)
      {
LABEL_22:
        v60->_paymentPresets = v10;

        v23 = [v61 PKArrayContaining:objc_opt_class() forKey:@"paymentFrequencies"];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        id obj = v23;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (!v24)
        {
          unint64_t v26 = 0;
          goto LABEL_53;
        }
        uint64_t v25 = v24;
        unint64_t v26 = 0;
        uint64_t v63 = *(void *)v66;
        v27 = @"once";
        v28 = @"weekly";
        while (1)
        {
          uint64_t v29 = 0;
          do
          {
            v30 = v27;
            v31 = v28;
            if (*(void *)v66 != v63) {
              objc_enumerationMutation(obj);
            }
            v32 = (__CFString *)*(id *)(*((void *)&v65 + 1) + 8 * v29);
            if (v32 == @"now") {
              goto LABEL_30;
            }
            v33 = v32;
            if (!v32) {
              goto LABEL_31;
            }
            int v34 = [@"now" isEqualToString:v32];

            if (v34)
            {
LABEL_30:
              v26 |= 1uLL;
              goto LABEL_31;
            }
            v35 = v33;
            v27 = v30;
            if (v35 != v30)
            {
              v36 = v35;
              int v37 = [(__CFString *)v30 isEqualToString:v35];

              v27 = v30;
              if (!v37)
              {
                v38 = v36;
                v28 = v31;
                if (v38 == v31
                  || (v39 = v38,
                      int v40 = [(__CFString *)v31 isEqualToString:v38],
                      v39,
                      v28 = v31,
                      v40))
                {
                  v26 |= 4uLL;
                }
                else
                {
                  v41 = v39;
                  if (v41 == @"biweekly"
                    || (int v42 = [@"biweekly" isEqualToString:v41], v41, v42))
                  {
                    v26 |= 8uLL;
                  }
                  else
                  {
                    v43 = v41;
                    if (v43 == @"monthly"
                      || (int v44 = [@"monthly" isEqualToString:v43], v43, v44))
                    {
                      v26 |= 0x10uLL;
                    }
                    else
                    {
                      v45 = v43;
                      if (v45 == @"paymentDueDate"
                        || (int v46 = [@"paymentDueDate" isEqualToString:v45], v45, v46))
                      {
                        v26 |= 0x20uLL;
                      }
                    }
                  }
LABEL_31:
                  v28 = v31;
                }
                v27 = v30;
                goto LABEL_33;
              }
            }
            v26 |= 2uLL;
            v28 = v31;
LABEL_33:
            ++v29;
          }
          while (v25 != v29);
          uint64_t v47 = [obj countByEnumeratingWithState:&v65 objects:v69 count:16];
          uint64_t v25 = v47;
          v27 = v30;
          v28 = v31;
          if (!v47)
          {
LABEL_53:
            v6 = v60;
            v60->_paymentFrequencies = v26;

            id v4 = v61;
            v48 = [v61 PKArrayContaining:objc_opt_class() forKey:@"paymentFundingSourceTypes"];
            v60->_paymentFundingSourceTypes = PKAccountFundingSourceTypeFromStrings(v48);

            uint64_t v49 = [v61 PKStringForKey:@"paymentTermsIdentifier"];
            paymentTermsIdentifier = v60->_paymentTermsIdentifier;
            v60->_paymentTermsIdentifier = (NSString *)v49;

            uint64_t v51 = [v61 PKArrayContaining:objc_opt_class() forKey:@"supportedFileFormatsForTransactionData"];
            supportedFileFormatsForTransactionData = v60->_supportedFileFormatsForTransactionData;
            v60->_supportedFileFormatsForTransactionData = (NSArray *)v51;

            v60->_maximumAccountUsers = [v61 PKIntegerForKey:@"maximumAccountUsers"];
            v60->_minimumOwnerAge = [v61 PKIntegerForKey:@"minimumOwnerAge"];
            v60->_minimumParticipantAge = [v61 PKIntegerForKey:@"minimumParticipantAge"];
            uint64_t v53 = [v61 PKArrayContaining:objc_opt_class() forKey:@"supportedDestinations"];
            supportedDestinations = v60->_supportedDestinations;
            v60->_supportedDestinations = (NSArray *)v53;

            uint64_t v55 = [v61 PKDecimalNumberFromStringForKey:@"savingsApy"];
            savingsAPY = v60->_savingsAPY;
            v60->_savingsAPY = (NSDecimalNumber *)v55;

            uint64_t v57 = [v61 PKDecimalNumberFromStringForKey:@"savingsInterestRate"];
            savingsInterestRate = v60->_savingsInterestRate;
            v60->_savingsInterestRate = (NSDecimalNumber *)v57;

            goto LABEL_54;
          }
        }
      }
    }
  }
LABEL_54:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountFeatureDescriptor)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKCreditAccountFeatureDescriptor;
  v5 = [(PKAccountFeatureDescriptor *)&v23 initWithCoder:v4];
  if (v5)
  {
    v5->_paymentPresets = [v4 decodeIntegerForKey:@"paymentPresets"];
    v5->_paymentFrequencies = [v4 decodeIntegerForKey:@"paymentFrequencies"];
    v5->_paymentFundingSourceTypes = [v4 decodeIntegerForKey:@"paymentFundingSourceTypes"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentTermsIdentifier"];
    paymentTermsIdentifier = v5->_paymentTermsIdentifier;
    v5->_paymentTermsIdentifier = (NSString *)v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    unint64_t v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedFileFormatsForTransactionData"];
    supportedFileFormatsForTransactionData = v5->_supportedFileFormatsForTransactionData;
    v5->_supportedFileFormatsForTransactionData = (NSArray *)v11;

    v5->_maximumAccountUsers = [v4 decodeIntegerForKey:@"maximumAccountUsers"];
    v5->_minimumOwnerAge = [v4 decodeIntegerForKey:@"minimumOwnerAge"];
    v5->_minimumParticipantAge = [v4 decodeIntegerForKey:@"minimumParticipantAge"];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    int v15 = [v13 setWithArray:v14];
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"supportedDestinations"];
    supportedDestinations = v5->_supportedDestinations;
    v5->_supportedDestinations = (NSArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savingsApy"];
    savingsAPY = v5->_savingsAPY;
    v5->_savingsAPY = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"savingsInterestRate"];
    savingsInterestRate = v5->_savingsInterestRate;
    v5->_savingsInterestRate = (NSDecimalNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCreditAccountFeatureDescriptor;
  id v4 = a3;
  [(PKAccountFeatureDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_paymentPresets, @"paymentPresets", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_paymentFrequencies forKey:@"paymentFrequencies"];
  [v4 encodeInteger:self->_paymentFundingSourceTypes forKey:@"paymentFundingSourceTypes"];
  [v4 encodeObject:self->_paymentTermsIdentifier forKey:@"paymentTermsIdentifier"];
  [v4 encodeObject:self->_supportedFileFormatsForTransactionData forKey:@"supportedFileFormatsForTransactionData"];
  [v4 encodeInteger:self->_maximumAccountUsers forKey:@"maximumAccountUsers"];
  [v4 encodeInteger:self->_minimumOwnerAge forKey:@"minimumOwnerAge"];
  [v4 encodeInteger:self->_minimumParticipantAge forKey:@"minimumParticipantAge"];
  [v4 encodeObject:self->_supportedDestinations forKey:@"supportedDestinations"];
  [v4 encodeObject:self->_savingsAPY forKey:@"savingsApy"];
  [v4 encodeObject:self->_savingsInterestRate forKey:@"savingsInterestRate"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKAccountFeatureDescriptor *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];
  if (([v4 isEqualToString:@"schedulePayment"] & 1) != 0
    || [v4 isEqualToString:@"scheduleRecurringPayments"])
  {
    objc_super v5 = [(PKAccountFeatureDescriptor *)self minimumAmount];
    [v3 appendFormat:@"minimumAmount: '%@'; ", v5];

    uint64_t v6 = [(PKAccountFeatureDescriptor *)self maximumAmount];
    [v3 appendFormat:@"maximumAmount: '%@'; ", v6];

    v7 = [(PKAccountFeatureDescriptor *)self merchantIdentifier];
    [v3 appendFormat:@"merchantIdentifier: '%@'; ", v7];

    uint64_t v8 = [(PKAccountFeatureDescriptor *)self supportedNetworks];
    [v3 appendFormat:@"supportedNetworks: '%@'; ", v8];

    uint64_t v9 = PKMerchantCapabilityToStrings([(PKAccountFeatureDescriptor *)self merchantCapabilities]);
    [v3 appendFormat:@"merchantCapabilities: '%@'; ", v9];

    unint64_t v10 = PKAccountFundingSourceTypeToStrings(self->_paymentFundingSourceTypes);
    [v3 appendFormat:@"fundingSourceTypes: '%@'; ", v10];

    unint64_t paymentPresets = self->_paymentPresets;
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    v13 = v12;
    if (paymentPresets)
    {
      [v12 addObject:@"fixedAmount"];
      if ((paymentPresets & 2) == 0)
      {
LABEL_5:
        if ((paymentPresets & 4) == 0) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
    else if ((paymentPresets & 2) == 0)
    {
      goto LABEL_5;
    }
    [v13 addObject:@"minimumDue"];
    if ((paymentPresets & 4) == 0)
    {
LABEL_7:
      v14 = (void *)[v13 copy];

      [v3 appendFormat:@"paymentPresets: '%@'; ", v14];
      unint64_t paymentFrequencies = self->_paymentFrequencies;
      uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
      v17 = v16;
      if (paymentFrequencies)
      {
        [v16 addObject:@"now"];
        if ((paymentFrequencies & 2) == 0)
        {
LABEL_9:
          if ((paymentFrequencies & 4) == 0) {
            goto LABEL_10;
          }
          goto LABEL_23;
        }
      }
      else if ((paymentFrequencies & 2) == 0)
      {
        goto LABEL_9;
      }
      [v17 addObject:@"once"];
      if ((paymentFrequencies & 4) == 0)
      {
LABEL_10:
        if ((paymentFrequencies & 8) == 0) {
          goto LABEL_11;
        }
        goto LABEL_24;
      }
LABEL_23:
      [v17 addObject:@"weekly"];
      if ((paymentFrequencies & 8) == 0)
      {
LABEL_11:
        if ((paymentFrequencies & 0x10) == 0) {
          goto LABEL_12;
        }
        goto LABEL_25;
      }
LABEL_24:
      [v17 addObject:@"biweekly"];
      if ((paymentFrequencies & 0x10) == 0)
      {
LABEL_12:
        if ((paymentFrequencies & 0x20) == 0)
        {
LABEL_14:
          uint64_t v18 = (void *)[v17 copy];

          [v3 appendFormat:@"paymentFrequencies: '%@'; ", v18];
          [v3 appendFormat:@"paymentTermsIdentifier: '%@'; ", self->_paymentTermsIdentifier];
          goto LABEL_15;
        }
LABEL_13:
        [v17 addObject:@"paymentDueDate"];
        goto LABEL_14;
      }
LABEL_25:
      [v17 addObject:@"monthly"];
      if ((paymentFrequencies & 0x20) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
LABEL_6:
    [v13 addObject:@"statementBalance"];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"addFundingSource"])
  {
    uint64_t v20 = [(PKAccountFeatureDescriptor *)self fundingSourceTermsIdentifier];
    [v3 appendFormat:@"fundingSourceTermsIdentifier: '%@'; ", v20];
LABEL_29:

    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"exportTransactionData"])
  {
    objc_msgSend(v3, "appendFormat:", @"supportedFileFormatsForTransactionData: '%@'; ",
      self->_supportedFileFormatsForTransactionData);
  }
  else if ([v4 isEqualToString:@"accountUserInvitationAllowed"])
  {
    int v21 = [NSNumber numberWithUnsignedInteger:self->_maximumAccountUsers];
    [v3 appendFormat:@"maximumAccountUsers: '%@'; ", v21];

    uint64_t v22 = [NSNumber numberWithUnsignedInteger:self->_minimumOwnerAge];
    [v3 appendFormat:@"minimumOwnerAge: '%@'; ", v22];

    objc_super v23 = [NSNumber numberWithUnsignedInteger:self->_minimumParticipantAge];
    [v3 appendFormat:@"minimumParticipantAge: '%@'; ", v23];

    uint64_t v24 = [(PKAccountFeatureDescriptor *)self osVersionRange];

    if (v24)
    {
      uint64_t v20 = [(PKAccountFeatureDescriptor *)self osVersionRange];
      uint64_t v25 = [v20 asDictionary];
      [v3 appendFormat:@"osVersionRange: '%@'; ", v25];

      goto LABEL_29;
    }
  }
  else
  {
    unint64_t v26 = v4;
    if (v26 == @"redeemRewards"
      || (v27 = v26) != 0
      && (int v28 = [(__CFString *)v26 isEqualToString:@"redeemRewards"], v27, v28))
    {
      uint64_t v29 = [(NSArray *)self->_supportedDestinations componentsJoinedByString:@", "];
      [v3 appendFormat:@"supportedDestinations: '%@'; ", v29];

      v30 = [(NSDecimalNumber *)self->_savingsAPY stringValue];
      [v3 appendFormat:@"savingsAPY: '%@'; ", v30];

      uint64_t v20 = [(NSDecimalNumber *)self->_savingsInterestRate stringValue];
      [v3 appendFormat:@"savingsInterestRate: '%@'; ", v20];
      goto LABEL_29;
    }
  }
LABEL_15:
  [v3 appendFormat:@">"];

  return v3;
}

- (unint64_t)hash
{
  v13.receiver = self;
  v13.super_class = (Class)PKCreditAccountFeatureDescriptor;
  unint64_t v3 = [(PKAccountFeatureDescriptor *)&v13 hash];
  unint64_t v4 = self->_paymentFundingSourceTypes - v3 + 32 * v3;
  unint64_t v5 = self->_paymentPresets - v4 + 32 * v4;
  unint64_t v6 = self->_paymentFrequencies - v5 + 32 * v5;
  unint64_t v7 = self->_maximumAccountUsers - v6 + 32 * v6;
  unint64_t v8 = self->_minimumOwnerAge - v7 + 32 * v7;
  uint64_t v9 = self->_minimumParticipantAge - v8 + 32 * v8;
  unint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  [v10 safelyAddObject:self->_paymentTermsIdentifier];
  [v10 safelyAddObject:self->_supportedFileFormatsForTransactionData];
  [v10 safelyAddObject:self->_supportedDestinations];
  [v10 safelyAddObject:self->_savingsAPY];
  [v10 safelyAddObject:self->_savingsInterestRate];
  unint64_t v11 = PKCombinedHash(v9, v10);

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKCreditAccountFeatureDescriptor *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditAccountFeatureDescriptor *)self isEqualToCreditAccountFeatureDescriptor:v5];

  return v6;
}

- (BOOL)isEqualToCreditAccountFeatureDescriptor:(id)a3
{
  unint64_t v4 = a3;
  if (![(PKAccountFeatureDescriptor *)self isEqualToAccountFeatureDescriptor:v4]
    || self->_paymentFundingSourceTypes != v4[9]
    || self->_paymentPresets != v4[10]
    || self->_paymentFrequencies != v4[11])
  {
    goto LABEL_34;
  }
  paymentTermsIdentifier = self->_paymentTermsIdentifier;
  BOOL v6 = (NSString *)v4[13];
  if (paymentTermsIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (paymentTermsIdentifier != v6) {
      goto LABEL_34;
    }
  }
  else if ((-[NSString isEqual:](paymentTermsIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_34;
  }
  supportedFileFormatsForTransactionData = self->_supportedFileFormatsForTransactionData;
  uint64_t v9 = (NSArray *)v4[12];
  if (supportedFileFormatsForTransactionData) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (supportedFileFormatsForTransactionData != v9) {
      goto LABEL_34;
    }
  }
  else if ((-[NSArray isEqual:](supportedFileFormatsForTransactionData, "isEqual:") & 1) == 0)
  {
    goto LABEL_34;
  }
  if (self->_maximumAccountUsers != v4[14]
    || self->_minimumOwnerAge != v4[15]
    || self->_minimumParticipantAge != v4[16])
  {
    goto LABEL_34;
  }
  supportedDestinations = self->_supportedDestinations;
  uint64_t v12 = (NSArray *)v4[17];
  if (supportedDestinations && v12)
  {
    if ((-[NSArray isEqual:](supportedDestinations, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (supportedDestinations != v12)
  {
    goto LABEL_34;
  }
  savingsAPY = self->_savingsAPY;
  v14 = (NSDecimalNumber *)v4[18];
  if (!savingsAPY || !v14)
  {
    if (savingsAPY == v14) {
      goto LABEL_36;
    }
LABEL_34:
    char v15 = 0;
    goto LABEL_35;
  }
  if (!-[NSDecimalNumber isEqual:](savingsAPY, "isEqual:")) {
    goto LABEL_34;
  }
  savingsAPY = self->_savingsAPY;
LABEL_36:
  v17 = (NSDecimalNumber *)v4[19];
  if (savingsAPY && v17) {
    char v15 = -[NSDecimalNumber isEqual:](savingsAPY, "isEqual:");
  }
  else {
    char v15 = savingsAPY == v17;
  }
LABEL_35:

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PKCreditAccountFeatureDescriptor;
  unint64_t v5 = -[PKAccountFeatureDescriptor copyWithZone:](&v17, sel_copyWithZone_);
  v5[9] = self->_paymentFundingSourceTypes;
  v5[10] = self->_paymentPresets;
  v5[11] = self->_paymentFrequencies;
  uint64_t v6 = [(NSString *)self->_paymentTermsIdentifier copyWithZone:a3];
  BOOL v7 = (void *)v5[13];
  v5[13] = v6;

  uint64_t v8 = [(NSArray *)self->_supportedFileFormatsForTransactionData copyWithZone:a3];
  uint64_t v9 = (void *)v5[12];
  v5[12] = v8;

  v5[14] = self->_maximumAccountUsers;
  v5[15] = self->_minimumOwnerAge;
  v5[16] = self->_minimumParticipantAge;
  uint64_t v10 = [(NSArray *)self->_supportedDestinations copyWithZone:a3];
  unint64_t v11 = (void *)v5[17];
  v5[17] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_savingsAPY copyWithZone:a3];
  objc_super v13 = (void *)v5[18];
  v5[18] = v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_savingsInterestRate copyWithZone:a3];
  char v15 = (void *)v5[19];
  v5[19] = v14;

  return v5;
}

- (id)productForFeature:(unint64_t)a3
{
  v51[2] = *MEMORY[0x1E4F143B8];
  if (a3 != 5 || !self->_savingsAPY)
  {
    char v15 = 0;
    goto LABEL_18;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = +[PKPaymentWebService sharedService];
  uint64_t v6 = [v5 context];

  BOOL v7 = PKPassKitBundle();
  uint64_t v8 = [v6 applyServicePreferredLanguageForFeatureIdentifier:5 mainLanguageBundle:v7];

  uint64_t v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v10 = [(PKDynamicProvisioningPageContent *)v9 languageCode];
  id v11 = v8;
  uint64_t v12 = v11;
  if (v10 == v11)
  {

    uint64_t v14 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (!v11 || !v10)
  {

    goto LABEL_11;
  }
  char v13 = [v10 isEqualToString:v11];

  if ((v13 & 1) == 0)
  {
LABEL_11:
    uint64_t v9 = objc_alloc_init(PKDynamicProvisioningPageContent);
    [(PKDynamicProvisioningPageContent *)v9 setPageNumber:0];
    int v21 = PKLocalizedFeatureString(@"LANGUAGE_NOTICE_TITLE", 5, 0, v16, v17, v18, v19, v20, v46);
    [(PKDynamicProvisioningPageContent *)v9 setTitle:v21];

    v27 = PKLocalizedFeatureString(@"LANGUAGE_NOTICE_BODY", 5, 0, v22, v23, v24, v25, v26, v47);
    [(PKDynamicProvisioningPageContent *)v9 setSubtitle:v27];

    v33 = PKLocalizedFeatureString(@"CONTINUE", 5, 0, v28, v29, v30, v31, v32, v48);
    [(PKDynamicProvisioningPageContent *)v9 setPrimaryActionTitle:v33];

    v39 = PKLocalizedFeatureString(@"CANCEL", 5, 0, v34, v35, v36, v37, v38, v49);
    [(PKDynamicProvisioningPageContent *)v9 setSecondaryActionTitle:v39];

    [(PKDynamicProvisioningPageContent *)v9 setIdentifier:@"languageNotice"];
    [(PKDynamicProvisioningPageContent *)v9 setHeroImageURL:&stru_1EE0F5368];
    [(PKDynamicProvisioningPageContent *)v9 setContentAlignment:2];
    [v4 addObject:v9];
    uint64_t v14 = 1;
    goto LABEL_12;
  }
  uint64_t v14 = 0;
LABEL_13:
  int v40 = objc_alloc_init(PKDynamicProvisioningPageContent);
  [(PKDynamicProvisioningPageContent *)v40 setPageNumber:v14];
  [(PKDynamicProvisioningPageContent *)v40 setIdentifier:@"mainFeatureOnboardingPageIdentifier"];
  [v4 addObject:v40];
  char v15 = [[PKPaymentSetupProduct alloc] initWithFeatureIdentifier:5];
  savingsAPY = self->_savingsAPY;
  v51[0] = savingsAPY;
  v50[0] = @"apy";
  v50[1] = @"interestRate";
  savingsInterestRate = self->_savingsInterestRate;
  v43 = savingsInterestRate;
  if (!savingsInterestRate)
  {
    v43 = PKAPRFromAPY(savingsAPY, 365);
  }
  v51[1] = v43;
  int v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  [(PKPaymentSetupProduct *)v15 setClientInfo:v44];

  if (!savingsInterestRate) {
  [(PKPaymentSetupProduct *)v15 setOnboardingItems:v4];
  }

LABEL_18:
  return v15;
}

- (unint64_t)paymentFundingSourceTypes
{
  return self->_paymentFundingSourceTypes;
}

- (void)setPaymentFundingSourceTypes:(unint64_t)a3
{
  self->_paymentFundingSourceTypes = a3;
}

- (unint64_t)paymentPresets
{
  return self->_paymentPresets;
}

- (void)setPaymentPresets:(unint64_t)a3
{
  self->_unint64_t paymentPresets = a3;
}

- (unint64_t)paymentFrequencies
{
  return self->_paymentFrequencies;
}

- (void)setPaymentFrequencies:(unint64_t)a3
{
  self->_unint64_t paymentFrequencies = a3;
}

- (NSArray)supportedFileFormatsForTransactionData
{
  return self->_supportedFileFormatsForTransactionData;
}

- (void)setSupportedFileFormatsForTransactionData:(id)a3
{
}

- (NSString)paymentTermsIdentifier
{
  return self->_paymentTermsIdentifier;
}

- (void)setPaymentTermsIdentifier:(id)a3
{
}

- (unint64_t)maximumAccountUsers
{
  return self->_maximumAccountUsers;
}

- (void)setMaximumAccountUsers:(unint64_t)a3
{
  self->_maximumAccountUsers = a3;
}

- (unint64_t)minimumOwnerAge
{
  return self->_minimumOwnerAge;
}

- (void)setMinimumOwnerAge:(unint64_t)a3
{
  self->_minimumOwnerAge = a3;
}

- (unint64_t)minimumParticipantAge
{
  return self->_minimumParticipantAge;
}

- (void)setMinimumParticipantAge:(unint64_t)a3
{
  self->_minimumParticipantAge = a3;
}

- (NSArray)supportedDestinations
{
  return self->_supportedDestinations;
}

- (void)setSupportedDestinations:(id)a3
{
}

- (NSDecimalNumber)savingsAPY
{
  return self->_savingsAPY;
}

- (void)setSavingsAPY:(id)a3
{
}

- (NSDecimalNumber)savingsInterestRate
{
  return self->_savingsInterestRate;
}

- (void)setSavingsInterestRate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savingsInterestRate, 0);
  objc_storeStrong((id *)&self->_savingsAPY, 0);
  objc_storeStrong((id *)&self->_supportedDestinations, 0);
  objc_storeStrong((id *)&self->_paymentTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedFileFormatsForTransactionData, 0);
}

@end