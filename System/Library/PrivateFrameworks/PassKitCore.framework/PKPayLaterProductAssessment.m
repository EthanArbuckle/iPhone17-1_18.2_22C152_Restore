@interface PKPayLaterProductAssessment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEligible;
- (BOOL)isEqual:(id)a3;
- (NSArray)financingOptions;
- (PKPayLaterPreliminaryAssessment)preliminaryAssessment;
- (PKPayLaterProductAssessment)initWithCoder:(id)a3;
- (PKPayLaterProductAssessment)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)financingOptionWithIdentifier:(id)a3;
- (unint64_t)financingEligibility;
- (unint64_t)hash;
- (unint64_t)productType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPayLaterProductAssessment

- (PKPayLaterProductAssessment)initWithDictionary:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_59;
  }
  v5 = [v4 PKStringForKey:@"financingEligibility"];
  v6 = v5;
  if (v5 == @"eligible")
  {
LABEL_5:
    uint64_t v8 = 1;
    goto LABEL_6;
  }
  if (!v5) {
    goto LABEL_58;
  }
  char v7 = [(__CFString *)v5 isEqualToString:@"eligible"];

  if (v7) {
    goto LABEL_5;
  }
  v25 = v6;
  if (v25 == @"disqualified"
    || (v26 = v25,
        char v27 = [(__CFString *)v25 isEqualToString:@"disqualified"],
        v26,
        (v27 & 1) != 0))
  {
    uint64_t v8 = 2;
    goto LABEL_6;
  }
  v41 = v26;
  if (v41 == @"noApplicableOffers"
    || (v42 = v41,
        char v43 = [(__CFString *)v41 isEqualToString:@"noApplicableOffers"],
        v42,
        (v43 & 1) != 0))
  {
    uint64_t v8 = 3;
    goto LABEL_6;
  }
  v44 = v42;
  if (v44 == @"ineligibleRegion"
    || (v45 = v44,
        char v46 = [(__CFString *)v44 isEqualToString:@"ineligibleRegion"],
        v45,
        (v46 & 1) != 0))
  {
    uint64_t v8 = 4;
    goto LABEL_6;
  }
  v47 = v45;
  if (v47 == @"ineligibleMerchant"
    || (v48 = v47,
        char v49 = [(__CFString *)v47 isEqualToString:@"ineligibleMerchant"],
        v48,
        (v49 & 1) != 0))
  {
    uint64_t v8 = 5;
    goto LABEL_6;
  }
  v50 = v48;
  if (v50 == @"aboveMaximumPurchaseCount"
    || (v51 = v50,
        char v52 = [(__CFString *)v50 isEqualToString:@"aboveMaximumPurchaseCount"],
        v51,
        (v52 & 1) != 0))
  {
    uint64_t v8 = 6;
    goto LABEL_6;
  }
  v53 = v51;
  if (v53 == @"aboveAvailableSpend"
    || (v54 = v53,
        char v55 = [(__CFString *)v53 isEqualToString:@"aboveAvailableSpend"],
        v54,
        (v55 & 1) != 0))
  {
    uint64_t v8 = 7;
    goto LABEL_6;
  }
  v56 = v54;
  if (v56 == @"aboveMaximumRejection"
    || (v57 = v56,
        char v58 = [(__CFString *)v56 isEqualToString:@"aboveMaximumRejection"],
        v57,
        (v58 & 1) != 0))
  {
    uint64_t v8 = 8;
    goto LABEL_6;
  }
  v59 = v57;
  if (v59 != @"currencyNotSupported")
  {
    v60 = v59;
    char v61 = [(__CFString *)v59 isEqualToString:@"currencyNotSupported"];

    if ((v61 & 1) == 0)
    {
LABEL_58:

LABEL_59:
      v10 = 0;
      goto LABEL_60;
    }
  }
  uint64_t v8 = 9;
LABEL_6:

  v9 = [v4 PKStringForKey:@"productType"];
  v10 = (PKPayLaterProductAssessment *)PKPayLaterAccountProductTypeFromString(v9);

  if (v10)
  {
    v71.receiver = self;
    v71.super_class = (Class)PKPayLaterProductAssessment;
    v11 = [(PKPayLaterProductAssessment *)&v71 init];
    v12 = v11;
    if (v11)
    {
      v11->_productType = (unint64_t)v10;
      v11->_financingEligibility = v8;
      v13 = [v4 PKArrayContaining:objc_opt_class() forKey:@"financingOptions"];
      if ([v13 count])
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v67 objects:v74 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v68;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v68 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = [[PKPayLaterFinancingOption alloc] initWithDictionary:*(void *)(*((void *)&v67 + 1) + 8 * i) productType:v12->_productType];
              [v14 safelyAddObject:v20];
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v67 objects:v74 count:16];
          }
          while (v17);
        }

        v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"installmentAmount.currencyAmount.amount" ascending:0];
        v73 = v21;
        v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
        [v14 sortUsingDescriptors:v22];

        if ([v14 count])
        {
          uint64_t v23 = [v14 copy];
          financingOptions = v12->_financingOptions;
          v12->_financingOptions = (NSArray *)v23;
        }
        else
        {
          financingOptions = v12->_financingOptions;
          v12->_financingOptions = 0;
        }
      }
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v29 = v12->_financingOptions;
      uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v64;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v64 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            v35 = objc_msgSend(v34, "identifier", (void)v63);
            [v28 setObject:v34 forKey:v35];
          }
          uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v63 objects:v72 count:16];
        }
        while (v31);
      }

      if ([v28 count])
      {
        uint64_t v36 = [v28 copy];
        financingOptionIdentifierMap = v12->_financingOptionIdentifierMap;
        v12->_financingOptionIdentifierMap = (NSDictionary *)v36;
      }
      else
      {
        financingOptionIdentifierMap = v12->_financingOptionIdentifierMap;
        v12->_financingOptionIdentifierMap = 0;
      }

      v38 = [v4 PKDictionaryForKey:@"preliminaryAssessment"];
      if ([v38 count])
      {
        v39 = [[PKPayLaterPreliminaryAssessment alloc] initWithDictionary:v38 productType:v12->_productType];
        preliminaryAssessment = v12->_preliminaryAssessment;
        v12->_preliminaryAssessment = v39;
      }
    }
    self = v12;
    v10 = self;
  }
LABEL_60:

  return v10;
}

- (id)financingOptionWithIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKey:](self->_financingOptionIdentifierMap, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)isEligible
{
  return self->_financingEligibility < 0xA && (self->_financingEligibility & 0x3FF) == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong((id *)(v5 + 8), self->_financingOptionIdentifierMap);
  *(void *)(v5 + 40) = self->_productType;
  *(void *)(v5 + 48) = self->_financingEligibility;
  uint64_t v6 = [(NSArray *)self->_financingOptions copyWithZone:a3];
  char v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  id v8 = [(PKPayLaterPreliminaryAssessment *)self->_preliminaryAssessment copyWithZone:a3];
  v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterProductAssessment *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        char v7 = v6;
        if (self->_productType != v6->_productType || self->_financingEligibility != v6->_financingEligibility) {
          goto LABEL_20;
        }
        financingOptionIdentifierMap = self->_financingOptionIdentifierMap;
        v9 = v7->_financingOptionIdentifierMap;
        if (financingOptionIdentifierMap && v9)
        {
          if ((-[NSDictionary isEqual:](financingOptionIdentifierMap, "isEqual:") & 1) == 0) {
            goto LABEL_20;
          }
        }
        else if (financingOptionIdentifierMap != v9)
        {
          goto LABEL_20;
        }
        financingOptions = self->_financingOptions;
        v12 = v7->_financingOptions;
        if (financingOptions && v12)
        {
          if (-[NSArray isEqual:](financingOptions, "isEqual:"))
          {
LABEL_16:
            preliminaryAssessment = self->_preliminaryAssessment;
            id v14 = v7->_preliminaryAssessment;
            if (preliminaryAssessment && v14) {
              char v10 = -[PKPayLaterPreliminaryAssessment isEqual:](preliminaryAssessment, "isEqual:");
            }
            else {
              char v10 = preliminaryAssessment == v14;
            }
            goto LABEL_21;
          }
        }
        else if (financingOptions == v12)
        {
          goto LABEL_16;
        }
LABEL_20:
        char v10 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    char v10 = 0;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_financingOptions];
  [v3 safelyAddObject:self->_preliminaryAssessment];
  [v3 safelyAddObject:self->_financingOptionIdentifierMap];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_productType - v4 + 32 * v4;
  unint64_t v6 = self->_financingEligibility - v5 + 32 * v5;

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t productType = self->_productType;
  id v5 = a3;
  [v5 encodeInteger:productType forKey:@"productType"];
  [v5 encodeInteger:self->_financingEligibility forKey:@"financingEligibility"];
  [v5 encodeObject:self->_financingOptionIdentifierMap forKey:@"financingOptionIdentifierMap"];
  [v5 encodeObject:self->_preliminaryAssessment forKey:@"preliminaryAssessment"];
  [v5 encodeObject:self->_financingOptions forKey:@"financingOptions"];
}

- (PKPayLaterProductAssessment)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterProductAssessment;
  id v5 = [(PKPayLaterProductAssessment *)&v20 init];
  if (v5)
  {
    v5->_unint64_t productType = [v4 decodeIntegerForKey:@"productType"];
    v5->_financingEligibility = [v4 decodeIntegerForKey:@"financingEligibility"];
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"financingOptionIdentifierMap"];
    financingOptionIdentifierMap = v5->_financingOptionIdentifierMap;
    v5->_financingOptionIdentifierMap = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preliminaryAssessment"];
    preliminaryAssessment = v5->_preliminaryAssessment;
    v5->_preliminaryAssessment = (PKPayLaterPreliminaryAssessment *)v12;

    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"financingOptions"];
    financingOptions = v5->_financingOptions;
    v5->_financingOptions = (NSArray *)v17;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = PKPayLaterAccountProductTypeToString(self->_productType);
  [v3 appendFormat:@"productType: %@; ", v4];

  unint64_t v5 = self->_financingEligibility - 1;
  if (v5 > 8) {
    unint64_t v6 = @"unknown";
  }
  else {
    unint64_t v6 = off_1E56DC160[v5];
  }
  [v3 appendFormat:@"financingEligibility: %@; ", v6];
  if (self->_preliminaryAssessment) {
    [v3 appendFormat:@"preliminaryAssessment: %@; ", self->_preliminaryAssessment];
  }
  if ([(NSArray *)self->_financingOptions count]) {
    [v3 appendFormat:@"financingOptions: %@; ", self->_financingOptions];
  }
  [v3 appendFormat:@">"];
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (unint64_t)financingEligibility
{
  return self->_financingEligibility;
}

- (NSArray)financingOptions
{
  return self->_financingOptions;
}

- (PKPayLaterPreliminaryAssessment)preliminaryAssessment
{
  return self->_preliminaryAssessment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preliminaryAssessment, 0);
  objc_storeStrong((id *)&self->_financingOptions, 0);
  objc_storeStrong((id *)&self->_maximumAPR, 0);
  objc_storeStrong((id *)&self->_minimumAPR, 0);
  objc_storeStrong((id *)&self->_lowestPossibleInstallmentSummary, 0);
  objc_storeStrong((id *)&self->_financingOptionIdentifierMap, 0);
}

@end