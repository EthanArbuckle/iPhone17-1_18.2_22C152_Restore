@interface PKCreditAccountDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInMonthOfMerge;
- (BOOL)termsAcceptanceRequired;
- (NSDate)createdDate;
- (NSDate)lastUpdatedDate;
- (NSDate)mergeDate;
- (NSSet)installmentPlans;
- (NSSet)physicalCards;
- (NSSet)virtualCards;
- (NSString)associatedPassSerialNumber;
- (NSString)associatedPassTypeIdentifier;
- (NSString)countryCode;
- (NSString)currencyCode;
- (NSString)termsIdentifier;
- (NSTimeZone)productTimeZone;
- (NSURL)associatedPassURL;
- (NSURL)termsURL;
- (PKCreditAccountDetails)initWithCoder:(id)a3;
- (PKCreditAccountDetails)initWithDictionary:(id)a3;
- (PKCreditAccountRates)rates;
- (PKCreditAccountSummary)accountSummary;
- (PKCurrencyAmount)cardBalance;
- (PKCurrencyAmount)totalBalance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)installmentPlanWithIdentifier:(id)a3;
- (id)virtualCardWithIdentifier:(id)a3;
- (int64_t)cardType;
- (int64_t)numberOfActiveInstallments;
- (int64_t)numberOfActiveStatementedInstallments;
- (unint64_t)hash;
- (unint64_t)rewardsDestination;
- (void)addOrUpdateVirtualCard:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)ingestExtendedAccountDetails:(id)a3;
- (void)removeVirtualCard:(id)a3;
- (void)setAccountSummary:(id)a3;
- (void)setAssociatedPassSerialNumber:(id)a3;
- (void)setAssociatedPassTypeIdentifier:(id)a3;
- (void)setAssociatedPassURL:(id)a3;
- (void)setCardType:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setInstallmentPlans:(id)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setMergeDate:(id)a3;
- (void)setProductTimeZone:(id)a3;
- (void)setRates:(id)a3;
- (void)setRewardsDestination:(unint64_t)a3;
- (void)setTermsAcceptanceRequired:(BOOL)a3;
- (void)setTermsIdentifier:(id)a3;
- (void)setTermsURL:(id)a3;
- (void)setVirtualCards:(id)a3;
@end

@implementation PKCreditAccountDetails

- (PKCreditAccountDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)PKCreditAccountDetails;
  v5 = [(PKCreditAccountDetails *)&v51 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 PKDateForKey:@"mergeDate"];
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    v16 = [v4 PKStringForKey:@"productTimeZone"];
    if (v16)
    {
      uint64_t v17 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v16];
      productTimeZone = v5->_productTimeZone;
      v5->_productTimeZone = (NSTimeZone *)v17;
    }
    v19 = (void *)MEMORY[0x1E4F1CAD0];
    v20 = [v4 PKArrayContaining:objc_opt_class() forKey:@"virtualCards"];
    v21 = objc_msgSend(v20, "pk_arrayByApplyingBlock:", &__block_literal_global_81);
    uint64_t v22 = [v19 setWithArray:v21];
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSSet *)v22;

    v5->_termsAcceptanceRequired = [v4 PKBoolForKey:@"termsAcceptanceRequired"];
    uint64_t v24 = [v4 PKStringForKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 PKURLForKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v26;

    uint64_t v28 = [v4 PKURLForKey:@"associatedPassURL"];
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v28;

    if (!v5->_associatedPassURL)
    {
      uint64_t v30 = [v4 PKURLForKey:@"associatedPassUrl"];
      v31 = v5->_associatedPassURL;
      v5->_associatedPassURL = (NSURL *)v30;
    }
    uint64_t v32 = [v4 PKStringForKey:@"associatedPassTypeIdentifier"];
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v32;

    uint64_t v34 = [v4 PKStringForKey:@"associatedPassSerialNumber"];
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v34;

    v5->_cardType = [v4 PKIntegerForKey:@"cardType"];
    v36 = [PKCreditAccountSummary alloc];
    v37 = [v4 PKDictionaryForKey:@"accountSummary"];
    uint64_t v38 = [(PKCreditAccountSummary *)v36 initWithDictionary:v37];
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKCreditAccountSummary *)v38;

    v40 = [PKCreditAccountRates alloc];
    v41 = [v4 PKDictionaryForKey:@"rates"];
    uint64_t v42 = [(PKCreditAccountRates *)v40 initWithDictionary:v41];
    rates = v5->_rates;
    v5->_rates = (PKCreditAccountRates *)v42;

    v44 = [v4 PKArrayContaining:objc_opt_class() forKey:@"installmentPlans"];
    if ([v44 count])
    {
      v45 = (void *)MEMORY[0x1E4F1CAD0];
      v46 = objc_msgSend(v44, "pk_arrayByApplyingBlock:", &__block_literal_global_78);
      uint64_t v47 = [v45 setWithArray:v46];
      installmentPlans = v5->_installmentPlans;
      v5->_installmentPlans = (NSSet *)v47;
    }
    v49 = [v4 PKStringForKey:@"rewardsDestination"];
    v5->_rewardsDestination = PKAccountRewardRedemptionTypeFromString(v49);
  }
  return v5;
}

PKVirtualCard *__45__PKCreditAccountDetails_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKVirtualCard alloc] initWithDictionary:v2];

  return v3;
}

PKCreditInstallmentPlan *__45__PKCreditAccountDetails_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditInstallmentPlan alloc] initWithDictionary:v2];

  return v3;
}

- (void)ingestExtendedAccountDetails:(id)a3
{
  id v15 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [v15 PKArrayContaining:objc_opt_class() forKey:@"virtualCards"];
  uint64_t v6 = objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_81);
  v7 = [v4 setWithArray:v6];
  virtualCards = self->_virtualCards;
  self->_virtualCards = v7;

  v9 = [v15 PKArrayContaining:objc_opt_class() forKey:@"installmentPlans"];
  if ([v9 count])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    v11 = [v15 PKArrayContaining:objc_opt_class() forKey:@"installmentPlans"];
    uint64_t v12 = objc_msgSend(v11, "pk_arrayByApplyingBlock:", &__block_literal_global_83_0);
    v13 = [v10 setWithArray:v12];
    installmentPlans = self->_installmentPlans;
    self->_installmentPlans = v13;
  }
  [(PKCreditAccountSummary *)self->_accountSummary ingestExtendedAccountDetails:v15];
}

PKVirtualCard *__55__PKCreditAccountDetails_ingestExtendedAccountDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKVirtualCard alloc] initWithDictionary:v2];

  return v3;
}

PKCreditInstallmentPlan *__55__PKCreditAccountDetails_ingestExtendedAccountDetails___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditInstallmentPlan alloc] initWithDictionary:v2];

  return v3;
}

- (id)installmentPlanWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_installmentPlans;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (void)v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v4;
        uint64_t v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          int v13 = [v10 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (void)addOrUpdateVirtualCard:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_virtualCards];
  if ([(NSSet *)self->_virtualCards count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = self->_virtualCards;
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v20 = self;
      v21 = v5;
      char v9 = 0;
      uint64_t v10 = *(void *)v23;
      while (1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          int v13 = objc_msgSend(v12, "identifier", v20);
          uint64_t v14 = [v4 identifier];
          long long v15 = v14;
          if (v13) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {

            if (v13 != v15) {
              continue;
            }
          }
          else
          {
            char v17 = [v13 isEqual:v14];

            if ((v17 & 1) == 0) {
              continue;
            }
          }
          if ([v4 state] == 2)
          {
            [v21 removeObject:v12];
          }
          else
          {
            long long v18 = [v12 mergeVirtualCardWith:v4];
            [v21 removeObject:v12];
            [v21 addObject:v18];
          }
          char v9 = 1;
        }
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (!v8)
        {

          self = v20;
          v5 = v21;
          if (v9) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
      }
    }
  }
LABEL_24:
  [v5 addObject:v4];
LABEL_25:
  v19 = (void *)[v5 copy];
  [(PKCreditAccountDetails *)self setVirtualCards:v19];
}

- (void)removeVirtualCard:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:self->_virtualCards];
  if ([(NSSet *)self->_virtualCards count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = self->_virtualCards;
    uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      char v17 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = [v11 identifier];
          id v13 = v4;
          uint64_t v14 = v13;
          if (v12 == v13)
          {

LABEL_17:
            v5 = v17;
            [v17 removeObject:v11];
            goto LABEL_18;
          }
          if (v4 && v12)
          {
            int v15 = [v12 isEqualToString:v13];

            if (v15) {
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        v5 = v17;
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  BOOL v16 = (void *)[v5 copy];
  [(PKCreditAccountDetails *)self setVirtualCards:v16];
}

- (id)virtualCardWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = self->_virtualCards;
  id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (void)v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v4;
        id v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          char v13 = [v10 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = (id)[(NSSet *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKCreditAccountDetails;
  v5 = [(PKCreditAccountDetails *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mergeDate"];
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productTimeZone"];
    productTimeZone = v5->_productTimeZone;
    v5->_productTimeZone = (NSTimeZone *)v16;

    long long v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"virtualCards"];
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSSet *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsURL"];
    termsURL = v5->_termsURL;
    v5->_termsURL = (NSURL *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v25;

    v5->_termsAcceptanceRequired = [v4 decodeBoolForKey:@"termsAcceptanceRequired"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassURL"];
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassTypeIdentifier"];
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassSerialNumber"];
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v31;

    v5->_cardType = [v4 decodeIntegerForKey:@"cardType"];
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountSummary"];
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKCreditAccountSummary *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rates"];
    rates = v5->_rates;
    v5->_rates = (PKCreditAccountRates *)v35;

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"installmentPlans"];
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = (NSSet *)v40;

    v5->_rewardsDestination = [v4 decodeIntegerForKey:@"rewardsDestination"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lastUpdatedDate = self->_lastUpdatedDate;
  id v5 = a3;
  [v5 encodeObject:lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_createdDate forKey:@"createdDate"];
  [v5 encodeObject:self->_mergeDate forKey:@"mergeDate"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_productTimeZone forKey:@"productTimeZone"];
  [v5 encodeObject:self->_virtualCards forKey:@"virtualCards"];
  [v5 encodeObject:self->_termsURL forKey:@"termsURL"];
  [v5 encodeObject:self->_termsIdentifier forKey:@"termsIdentifier"];
  [v5 encodeBool:self->_termsAcceptanceRequired forKey:@"termsAcceptanceRequired"];
  [v5 encodeObject:self->_associatedPassURL forKey:@"associatedPassURL"];
  [v5 encodeObject:self->_associatedPassTypeIdentifier forKey:@"associatedPassTypeIdentifier"];
  [v5 encodeObject:self->_associatedPassSerialNumber forKey:@"associatedPassSerialNumber"];
  [v5 encodeInteger:self->_cardType forKey:@"cardType"];
  [v5 encodeObject:self->_accountSummary forKey:@"accountSummary"];
  [v5 encodeObject:self->_rates forKey:@"rates"];
  [v5 encodeObject:self->_installmentPlans forKey:@"installmentPlans"];
  [v5 encodeInteger:self->_rewardsDestination forKey:@"rewardsDestination"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_78;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  uint64_t v6 = (NSDate *)v4[2];
  if (lastUpdatedDate && v6)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (lastUpdatedDate != v6)
  {
    goto LABEL_78;
  }
  createdDate = self->_createdDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (createdDate && v8)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (createdDate != v8)
  {
    goto LABEL_78;
  }
  mergeDate = self->_mergeDate;
  uint64_t v10 = (NSDate *)v4[4];
  if (mergeDate && v10)
  {
    if ((-[NSDate isEqual:](mergeDate, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (mergeDate != v10)
  {
    goto LABEL_78;
  }
  countryCode = self->_countryCode;
  uint64_t v12 = (NSString *)v4[5];
  if (countryCode && v12)
  {
    if ((-[NSString isEqual:](countryCode, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (countryCode != v12)
  {
    goto LABEL_78;
  }
  currencyCode = self->_currencyCode;
  uint64_t v14 = (NSString *)v4[6];
  if (currencyCode && v14)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (currencyCode != v14)
  {
    goto LABEL_78;
  }
  productTimeZone = self->_productTimeZone;
  uint64_t v16 = (NSTimeZone *)v4[7];
  if (productTimeZone && v16)
  {
    if ((-[NSTimeZone isEqual:](productTimeZone, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (productTimeZone != v16)
  {
    goto LABEL_78;
  }
  termsURL = self->_termsURL;
  long long v18 = (NSURL *)v4[11];
  if (termsURL && v18)
  {
    if ((-[NSURL isEqual:](termsURL, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (termsURL != v18)
  {
    goto LABEL_78;
  }
  termsIdentifier = self->_termsIdentifier;
  uint64_t v20 = (NSString *)v4[10];
  if (termsIdentifier && v20)
  {
    if ((-[NSString isEqual:](termsIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (termsIdentifier != v20)
  {
    goto LABEL_78;
  }
  associatedPassURL = self->_associatedPassURL;
  long long v22 = (NSURL *)v4[12];
  if (associatedPassURL && v22)
  {
    if ((-[NSURL isEqual:](associatedPassURL, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (associatedPassURL != v22)
  {
    goto LABEL_78;
  }
  associatedPassTypeIdentifier = self->_associatedPassTypeIdentifier;
  long long v24 = (NSString *)v4[13];
  if (associatedPassTypeIdentifier && v24)
  {
    if ((-[NSString isEqual:](associatedPassTypeIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (associatedPassTypeIdentifier != v24)
  {
    goto LABEL_78;
  }
  associatedPassSerialNumber = self->_associatedPassSerialNumber;
  uint64_t v26 = (NSString *)v4[14];
  if (associatedPassSerialNumber && v26)
  {
    if ((-[NSString isEqual:](associatedPassSerialNumber, "isEqual:") & 1) == 0) {
      goto LABEL_78;
    }
  }
  else if (associatedPassSerialNumber != v26)
  {
    goto LABEL_78;
  }
  accountSummary = self->_accountSummary;
  uint64_t v28 = (PKCreditAccountSummary *)v4[16];
  if (accountSummary && v28)
  {
    if (!-[PKCreditAccountSummary isEqual:](accountSummary, "isEqual:")) {
      goto LABEL_78;
    }
  }
  else if (accountSummary != v28)
  {
    goto LABEL_78;
  }
  rates = self->_rates;
  uint64_t v30 = (PKCreditAccountRates *)v4[17];
  if (rates && v30)
  {
    if (!-[PKCreditAccountRates isEqual:](rates, "isEqual:")) {
      goto LABEL_78;
    }
  }
  else if (rates != v30)
  {
    goto LABEL_78;
  }
  virtualCards = self->_virtualCards;
  uint64_t v32 = (NSSet *)v4[9];
  if (!virtualCards || !v32)
  {
    if (virtualCards == v32) {
      goto LABEL_72;
    }
LABEL_78:
    char v35 = 0;
    goto LABEL_79;
  }
  if ((-[NSSet isEqual:](virtualCards, "isEqual:") & 1) == 0) {
    goto LABEL_78;
  }
LABEL_72:
  if (self->_termsAcceptanceRequired != *((unsigned __int8 *)v4 + 8)
    || self->_cardType != v4[15]
    || self->_rewardsDestination != v4[19])
  {
    goto LABEL_78;
  }
  installmentPlans = self->_installmentPlans;
  uint64_t v34 = (NSSet *)v4[18];
  if (installmentPlans && v34) {
    char v35 = -[NSSet isEqual:](installmentPlans, "isEqual:");
  }
  else {
    char v35 = installmentPlans == v34;
  }
LABEL_79:

  return v35;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_lastUpdatedDate];
  [v3 safelyAddObject:self->_createdDate];
  [v3 safelyAddObject:self->_mergeDate];
  [v3 safelyAddObject:self->_countryCode];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_productTimeZone];
  [v3 safelyAddObject:self->_termsURL];
  [v3 safelyAddObject:self->_termsIdentifier];
  [v3 safelyAddObject:self->_associatedPassURL];
  [v3 safelyAddObject:self->_associatedPassTypeIdentifier];
  [v3 safelyAddObject:self->_associatedPassSerialNumber];
  [v3 safelyAddObject:self->_accountSummary];
  [v3 safelyAddObject:self->_rates];
  [v3 safelyAddObject:self->_virtualCards];
  [v3 safelyAddObject:self->_installmentPlans];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_cardType - v4 + 32 * v4;
  uint64_t v6 = self->_termsAcceptanceRequired - v5 + 32 * v5;
  unint64_t v7 = self->_rewardsDestination - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDate *)self->_lastUpdatedDate description];
  [v3 appendFormat:@"lastUpdateDate: '%@'; ", v4];

  int64_t v5 = [(NSDate *)self->_createdDate description];
  [v3 appendFormat:@"createdDate: '%@'; ", v5];

  mergeDate = self->_mergeDate;
  if (mergeDate)
  {
    unint64_t v7 = [(NSDate *)mergeDate description];
    [v3 appendFormat:@"mergeDate: '%@'; ", v7];
  }
  [v3 appendFormat:@"countryCode: '%@'; ", self->_countryCode];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  uint64_t v8 = [(NSTimeZone *)self->_productTimeZone name];
  [v3 appendFormat:@"productTimeZone: '%@'; ", v8];

  uint64_t v9 = [(NSSet *)self->_virtualCards description];
  [v3 appendFormat:@"virtualCards: '%@'; ", v9];

  [v3 appendFormat:@"termsURL: '%@'; ", self->_termsURL];
  [v3 appendFormat:@"termsIdentifier: '%@'; ", self->_termsIdentifier];
  if (self->_termsAcceptanceRequired) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v3 appendFormat:@"termsAcceptanceRequired: '%@'; ", v10];
  [v3 appendFormat:@"passURL: '%@'; ", self->_associatedPassURL];
  [v3 appendFormat:@"passSerialNumber: '%@'; ", self->_associatedPassSerialNumber];
  [v3 appendFormat:@"passTypeIdentifier: '%@'; ", self->_associatedPassTypeIdentifier];
  id v11 = PKPaymentNetworkNameForPaymentCredentialType(self->_cardType);
  [v3 appendFormat:@"cardType: '%@'; ", v11];

  uint64_t v12 = [(PKCreditAccountSummary *)self->_accountSummary description];
  [v3 appendFormat:@"summary: '%@'; ", v12];

  char v13 = [(PKCreditAccountRates *)self->_rates description];
  [v3 appendFormat:@"rates: '%@'; ", v13];

  uint64_t v14 = [(NSSet *)self->_installmentPlans description];
  [v3 appendFormat:@"installmentPlans: '%@'; ", v14];

  long long v15 = PKAccountRewardRedemptionTypeToString(self->_rewardsDestination);
  [v3 appendFormat:@"rewardsDestination: '%@'; ", v15];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [+[PKCreditAccountDetails allocWithZone:](PKCreditAccountDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_lastUpdatedDate copyWithZone:a3];
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  uint64_t v8 = [(NSDate *)self->_createdDate copyWithZone:a3];
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  uint64_t v10 = [(NSDate *)self->_mergeDate copyWithZone:a3];
  mergeDate = v5->_mergeDate;
  v5->_mergeDate = (NSDate *)v10;

  uint64_t v12 = [(NSString *)self->_countryCode copyWithZone:a3];
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v14;

  uint64_t v16 = [(NSTimeZone *)self->_productTimeZone copyWithZone:a3];
  productTimeZone = v5->_productTimeZone;
  v5->_productTimeZone = (NSTimeZone *)v16;

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v19 = self->_virtualCards;
  uint64_t v20 = [(NSSet *)v19 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v56;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v56 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * v23) copy];
        [v18 addObject:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSSet *)v19 countByEnumeratingWithState:&v55 objects:v60 count:16];
    }
    while (v21);
  }

  uint64_t v25 = [MEMORY[0x1E4F1CAD0] setWithSet:v18];
  virtualCards = v5->_virtualCards;
  v5->_virtualCards = (NSSet *)v25;

  uint64_t v27 = [(NSURL *)self->_termsURL copyWithZone:a3];
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v27;

  uint64_t v29 = [(NSString *)self->_termsIdentifier copyWithZone:a3];
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v29;

  v5->_termsAcceptanceRequired = self->_termsAcceptanceRequired;
  uint64_t v31 = [(NSURL *)self->_associatedPassURL copyWithZone:a3];
  associatedPassURL = v5->_associatedPassURL;
  v5->_associatedPassURL = (NSURL *)v31;

  uint64_t v33 = [(NSString *)self->_associatedPassSerialNumber copyWithZone:a3];
  associatedPassSerialNumber = v5->_associatedPassSerialNumber;
  v5->_associatedPassSerialNumber = (NSString *)v33;

  uint64_t v35 = [(NSString *)self->_associatedPassTypeIdentifier copyWithZone:a3];
  associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
  v5->_associatedPassTypeIdentifier = (NSString *)v35;

  v5->_cardType = self->_cardType;
  v37 = [(PKCreditAccountSummary *)self->_accountSummary copyWithZone:a3];
  accountSummary = v5->_accountSummary;
  v5->_accountSummary = v37;

  v39 = [(PKCreditAccountRates *)self->_rates copyWithZone:a3];
  rates = v5->_rates;
  v5->_rates = v39;

  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v42 = self->_installmentPlans;
  uint64_t v43 = [(NSSet *)v42 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v52;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v52 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * v46), "copy", (void)v51);
        [v41 addObject:v47];

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [(NSSet *)v42 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v44);
  }

  if ([v41 count])
  {
    uint64_t v48 = [v41 copy];
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = (NSSet *)v48;
  }
  else
  {
    installmentPlans = v5->_installmentPlans;
    v5->_installmentPlans = 0;
  }

  v5->_rewardsDestination = self->_rewardsDestination;
  return v5;
}

- (PKCurrencyAmount)cardBalance
{
  if (!self->_currencyCode)
  {
    unint64_t v7 = 0;
    goto LABEL_13;
  }
  v3 = [(PKCreditAccountSummary *)self->_accountSummary adjustedBalance];
  uint64_t v4 = [(PKCreditAccountSummary *)self->_accountSummary balanceSummary];
  int64_t v5 = [v4 pendingPurchases];

  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v8 = [(NSDecimalNumber *)v3 decimalNumberByAdding:v5];
LABEL_11:
    uint64_t v9 = v8;
    unint64_t v7 = PKCurrencyAmountCreate(v8, self->_currencyCode, 0);

    goto LABEL_12;
  }
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
    goto LABEL_11;
  }
  unint64_t v7 = PKCurrencyAmountCreate(v3, self->_currencyCode, 0);
LABEL_12:

LABEL_13:
  return (PKCurrencyAmount *)v7;
}

- (PKCurrencyAmount)totalBalance
{
  if (!self->_currencyCode)
  {
    unint64_t v7 = 0;
    goto LABEL_13;
  }
  v3 = [(PKCreditAccountSummary *)self->_accountSummary currentBalance];
  uint64_t v4 = [(PKCreditAccountSummary *)self->_accountSummary balanceSummary];
  int64_t v5 = [v4 pendingPurchases];

  if (v3) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v8 = [(NSDecimalNumber *)v3 decimalNumberByAdding:v5];
LABEL_11:
    uint64_t v9 = v8;
    unint64_t v7 = PKCurrencyAmountCreate(v8, self->_currencyCode, 0);

    goto LABEL_12;
  }
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
    goto LABEL_11;
  }
  unint64_t v7 = PKCurrencyAmountCreate(v3, self->_currencyCode, 0);
LABEL_12:

LABEL_13:
  return (PKCurrencyAmount *)v7;
}

- (int64_t)numberOfActiveInstallments
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = self->_installmentPlans;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "state", (void)v9) == 2) {
          ++v5;
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)numberOfActiveStatementedInstallments
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = self->_installmentPlans;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "state", (void)v15);
        long long v10 = [v8 payments];
        long long v11 = [v10 firstObject];
        long long v12 = [v11 statementIdentifier];

        if (v9 == 2 && v12 != 0) {
          ++v5;
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isInMonthOfMerge
{
  if (!self->_mergeDate) {
    return 0;
  }
  uint64_t v3 = [(PKCreditAccountSummary *)self->_accountSummary balanceSummary];
  uint64_t v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 openingDate];
    uint64_t v6 = [v4 closingDate];
    unint64_t v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    BOOL v9 = !v8 && PKDateIsBetweenDates(self->_mergeDate, v5, v6, 0);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (NSDate)mergeDate
{
  return self->_mergeDate;
}

- (void)setMergeDate:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSTimeZone)productTimeZone
{
  return self->_productTimeZone;
}

- (void)setProductTimeZone:(id)a3
{
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (NSSet)virtualCards
{
  return self->_virtualCards;
}

- (void)setVirtualCards:(id)a3
{
}

- (BOOL)termsAcceptanceRequired
{
  return self->_termsAcceptanceRequired;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_termsAcceptanceRequired = a3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (NSURL)associatedPassURL
{
  return self->_associatedPassURL;
}

- (void)setAssociatedPassURL:(id)a3
{
}

- (NSString)associatedPassTypeIdentifier
{
  return self->_associatedPassTypeIdentifier;
}

- (void)setAssociatedPassTypeIdentifier:(id)a3
{
}

- (NSString)associatedPassSerialNumber
{
  return self->_associatedPassSerialNumber;
}

- (void)setAssociatedPassSerialNumber:(id)a3
{
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (PKCreditAccountSummary)accountSummary
{
  return self->_accountSummary;
}

- (void)setAccountSummary:(id)a3
{
}

- (PKCreditAccountRates)rates
{
  return self->_rates;
}

- (void)setRates:(id)a3
{
}

- (NSSet)installmentPlans
{
  return self->_installmentPlans;
}

- (void)setInstallmentPlans:(id)a3
{
}

- (unint64_t)rewardsDestination
{
  return self->_rewardsDestination;
}

- (void)setRewardsDestination:(unint64_t)a3
{
  self->_rewardsDestination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentPlans, 0);
  objc_storeStrong((id *)&self->_rates, 0);
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPassURL, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_termsIdentifier, 0);
  objc_storeStrong((id *)&self->_virtualCards, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_mergeDate, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end