@interface PKPayLaterAccountDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)hasEligibleSpend;
- (BOOL)hasProvisionedPass;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPayLaterSupportedInCurrentRegion;
- (BOOL)requiresGenericMessaging;
- (NSArray)availableLanguages;
- (NSDate)createdDate;
- (NSDate)lastUpdatedDate;
- (NSDate)nextDueDate;
- (NSSet)products;
- (NSString)associatedPassSerialNumber;
- (NSString)associatedPassTypeIdentifier;
- (NSString)countryCode;
- (NSURL)associatedPassURL;
- (PKCurrencyAmount)amountPaid;
- (PKCurrencyAmount)currentBalance;
- (PKCurrencyAmount)nextDueAmount;
- (PKCurrencyAmount)totalFinanced;
- (PKPayLaterAccountDetails)initWithCoder:(id)a3;
- (PKPayLaterAccountDetails)initWithDictionary:(id)a3;
- (PKPayLaterAccountTermsDetails)termsDetails;
- (PKPayLaterAccountUserInfo)userInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currencyCode;
- (id)description;
- (id)localizationBundleWithMainBundle:(id)a3;
- (id)maximumEligibleSpendAmount;
- (id)maximumSinglePurchaseAmount;
- (id)minimumSinglePurchaseAmount;
- (id)odiAttributes;
- (id)perferredLanguageWithMainBundle:(id)a3;
- (id)productForProductType:(unint64_t)a3;
- (int64_t)cardNetwork;
- (int64_t)financingPlanFetchLimit;
- (unint64_t)hash;
- (unint64_t)paymentType;
- (void)encodeWithCoder:(id)a3;
- (void)setAmountPaid:(id)a3;
- (void)setAssociatedPassSerialNumber:(id)a3;
- (void)setAssociatedPassTypeIdentifier:(id)a3;
- (void)setAssociatedPassURL:(id)a3;
- (void)setAvailableLanguages:(id)a3;
- (void)setCardNetwork:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setFinancingPlanFetchLimit:(int64_t)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setNextDueAmount:(id)a3;
- (void)setNextDueDate:(id)a3;
- (void)setPaymentType:(unint64_t)a3;
- (void)setProducts:(id)a3;
- (void)setRequiresGenericMessaging:(BOOL)a3;
- (void)setTermsDetails:(id)a3;
- (void)setTotalFinanced:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PKPayLaterAccountDetails

- (PKPayLaterAccountDetails)initWithDictionary:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PKPayLaterAccountDetails;
  v5 = [(PKPayLaterAccountDetails *)&v56 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKDateForKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 PKCurrencyAmountForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 PKCurrencyAmountForKey:@"amountPaid"];
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 PKCurrencyAmountForKey:@"totalFinanced"];
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 PKDateForKey:@"nextDueDate"];
    nextDueDate = v5->_nextDueDate;
    v5->_nextDueDate = (NSDate *)v16;

    uint64_t v18 = [v4 PKCurrencyAmountForKey:@"nextDueAmount"];
    nextDueAmount = v5->_nextDueAmount;
    v5->_nextDueAmount = (PKCurrencyAmount *)v18;

    uint64_t v20 = [v4 PKStringForKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v20;

    uint64_t v22 = [v4 PKURLForKey:@"associatedPassURL"];
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v22;

    uint64_t v24 = [v4 PKStringForKey:@"associatedPassTypeIdentifier"];
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v24;

    uint64_t v26 = [v4 PKStringForKey:@"associatedPassSerialNumber"];
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v26;

    v28 = [v4 PKStringForKey:@"cardNetwork"];
    v5->_cardNetwork = PKPaymentCredentialTypeForPaymentNetworkName(v28);

    if (!v5->_cardNetwork)
    {
      v29 = [v4 objectForKey:@"cardType"];

      if (v29) {
        v5->_cardNetwork = [v4 PKIntegerForKey:@"cardType"];
      }
    }
    v30 = [v4 PKStringForKey:@"paymentType"];
    v5->_paymentType = PKPaymentMethodTypeForString(v30);

    v5->_financingPlanFetchLimit = [v4 PKIntegerForKey:@"financingPlanFetchLimit"];
    v5->_requiresGenericMessaging = [v4 PKBoolForKey:@"requiresGenericMessaging"];
    v31 = [v4 PKArrayContaining:objc_opt_class() forKey:@"products"];
    if ([v31 count])
    {
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v33 = v31;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v53;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v53 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v52 + 1) + 8 * v37);
            v39 = [PKPayLaterAccountProduct alloc];
            v40 = -[PKPayLaterAccountProduct initWithDictionary:](v39, "initWithDictionary:", v38, (void)v52);
            [v32 addObject:v40];

            ++v37;
          }
          while (v35 != v37);
          uint64_t v35 = [v33 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v35);
      }

      uint64_t v41 = [v32 copy];
      products = v5->_products;
      v5->_products = (NSSet *)v41;
    }
    v43 = objc_msgSend(v4, "PKDictionaryForKey:", @"termsDetails", (void)v52);
    if ([v43 count])
    {
      v44 = [[PKPayLaterAccountTermsDetails alloc] initWithDictionary:v43];
      termsDetails = v5->_termsDetails;
      v5->_termsDetails = v44;
    }
    v46 = [v4 PKDictionaryForKey:@"userInfo"];
    if ([v46 count])
    {
      v47 = [[PKPayLaterAccountUserInfo alloc] initWithDictionary:v46];
      userInfo = v5->_userInfo;
      v5->_userInfo = v47;
    }
    uint64_t v49 = [v4 PKArrayContaining:objc_opt_class() forKey:@"availableLanguages"];
    availableLanguages = v5->_availableLanguages;
    v5->_availableLanguages = (NSArray *)v49;
  }
  return v5;
}

- (id)perferredLanguageWithMainBundle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    PKPassKitBundle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(NSArray *)self->_availableLanguages count])
  {
    [v4 preferredLocalizations];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v23)
    {
      uint64_t v6 = *(void *)v30;
      uint64_t v21 = *(void *)v30;
      uint64_t v22 = self;
      uint64_t v24 = v5;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(v5);
          }
          uint64_t v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          v9 = self->_availableLanguages;
          uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v26;
            while (2)
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v26 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
                id v15 = v8;
                id v16 = v14;
                if (v15 == v16)
                {

LABEL_27:
                  v19 = (__CFString *)v15;

                  id v5 = v24;
                  goto LABEL_29;
                }
                v17 = v16;
                if (v8 && v16)
                {
                  char v18 = [v15 isEqualToString:v16];

                  if (v18) {
                    goto LABEL_27;
                  }
                }
                else
                {
                }
              }
              uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v11) {
                continue;
              }
              break;
            }
          }

          ++v7;
          self = v22;
          id v5 = v24;
          uint64_t v6 = v21;
        }
        while (v7 != v23);
        v19 = @"en";
        uint64_t v23 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v23);
    }
    else
    {
      v19 = @"en";
    }
LABEL_29:
  }
  else
  {
    v19 = @"en";
  }

  return v19;
}

- (id)localizationBundleWithMainBundle:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    PKPassKitBundle();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)odiAttributes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKPayLaterAccountUserInfo *)self->_userInfo firstName];
  id v5 = [v4 odiAttribute];
  uint64_t v6 = [v4 text];
  uint64_t v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8) {
    [v3 setObject:v6 forKey:v5];
  }
  v9 = [(PKPayLaterAccountUserInfo *)self->_userInfo lastName];

  uint64_t v10 = [v9 odiAttribute];

  uint64_t v11 = [v9 text];

  if (v10 && v11) {
    [v3 setObject:v11 forKey:v10];
  }
  uint64_t v12 = [(PKPayLaterAccountUserInfo *)self->_userInfo phoneNumber];

  v13 = [v12 odiAttribute];

  uint64_t v14 = [v12 text];

  if (v13 && v14) {
    [v3 setObject:v14 forKey:v13];
  }
  id v15 = [(PKPayLaterAccountUserInfo *)self->_userInfo street1];

  id v16 = [v15 odiAttribute];

  v17 = [v15 text];

  if (v16 && v17) {
    [v3 setObject:v17 forKey:v16];
  }
  char v18 = [(PKPayLaterAccountUserInfo *)self->_userInfo street2];

  v19 = [v18 odiAttribute];

  uint64_t v20 = [v18 text];

  if (v19 && v20) {
    [v3 setObject:v20 forKey:v19];
  }
  uint64_t v21 = [(PKPayLaterAccountUserInfo *)self->_userInfo city];

  uint64_t v22 = [v21 odiAttribute];

  uint64_t v23 = [v21 text];

  if (v22 && v23) {
    [v3 setObject:v23 forKey:v22];
  }
  uint64_t v24 = [(PKPayLaterAccountUserInfo *)self->_userInfo state];

  long long v25 = [v24 odiAttribute];

  long long v26 = [v24 text];

  if (v25 && v26) {
    [v3 setObject:v26 forKey:v25];
  }
  long long v27 = [(PKPayLaterAccountUserInfo *)self->_userInfo postalCode];

  long long v28 = [v27 odiAttribute];

  long long v29 = [v27 text];

  if (v28 && v29) {
    [v3 setObject:v29 forKey:v28];
  }
  if ([v3 count])
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F5C978]);
    long long v31 = (void *)[v3 copy];
    [v30 setAttributes:v31];
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (unint64_t)paymentType
{
  if (self->_paymentType) {
    return self->_paymentType;
  }
  else {
    return 2;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PKPayLaterAccountDetails;
  id v5 = [(PKPayLaterAccountDetails *)&v43 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdDate"];
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (PKCurrencyAmount *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amountPaid"];
    amountPaid = v5->_amountPaid;
    v5->_amountPaid = (PKCurrencyAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFinanced"];
    totalFinanced = v5->_totalFinanced;
    v5->_totalFinanced = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextDueDate"];
    nextDueDate = v5->_nextDueDate;
    v5->_nextDueDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextDueAmount"];
    nextDueAmount = v5->_nextDueAmount;
    v5->_nextDueAmount = (PKCurrencyAmount *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"countryCode"];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v20;

    uint64_t v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"products"];
    products = v5->_products;
    v5->_products = (NSSet *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsDetails"];
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = (PKPayLaterAccountTermsDetails *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (PKPayLaterAccountUserInfo *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassURL"];
    associatedPassURL = v5->_associatedPassURL;
    v5->_associatedPassURL = (NSURL *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassSerialNumber"];
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedPassTypeIdentifier"];
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v35;

    v5->_cardNetwork = [v4 decodeIntegerForKey:@"cardNetwork"];
    v5->_paymentType = [v4 decodeIntegerForKey:@"paymentType"];
    v5->_financingPlanFetchLimit = [v4 decodeIntegerForKey:@"financingPlanFetchLimit"];
    uint64_t v37 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v38 = objc_opt_class();
    v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    uint64_t v40 = [v4 decodeObjectOfClasses:v39 forKey:@"availableLanguages"];
    availableLanguages = v5->_availableLanguages;
    v5->_availableLanguages = (NSArray *)v40;

    v5->_requiresGenericMessaging = [v4 decodeBoolForKey:@"requiresGenericMessaging"];
  }

  return v5;
}

- (BOOL)hasProvisionedPass
{
  return self->_associatedPassURL != 0;
}

- (id)productForProductType:(unint64_t)a3
{
  products = self->_products;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PKPayLaterAccountDetails_productForProductType___block_invoke;
  v6[3] = &__block_descriptor_40_e34_B16__0__PKPayLaterAccountProduct_8l;
  v6[4] = a3;
  id v4 = [(NSSet *)products pk_anyObjectPassingTest:v6];
  return v4;
}

BOOL __50__PKPayLaterAccountDetails_productForProductType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 productType] == *(void *)(a1 + 32);
}

- (id)currencyCode
{
  id v3 = [(PKCurrencyAmount *)self->_currentBalance currency];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(PKCurrencyAmount *)self->_amountPaid currency];
    uint64_t v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      uint64_t v8 = [(PKCurrencyAmount *)self->_totalFinanced currency];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(PKCurrencyAmount *)self->_nextDueAmount currency];
      }
      id v5 = v10;
    }
  }

  return v5;
}

- (id)maximumEligibleSpendAmount
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = self->_products;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "eligibleSpend", (void)v15);
        v9 = [v8 availableToSpend];
        id v10 = v9;
        if (v5)
        {
          if (v9)
          {
            uint64_t v11 = [v9 amount];
            int v12 = objc_msgSend(v11, "pk_isPositiveNumber");

            if (v12)
            {
              uint64_t v13 = +[PKCurrencyAmount maximumCurrencyAmount:v5 otherCurrencyAmount:v10];

              id v5 = (id)v13;
            }
          }
        }
        else
        {
          id v5 = v9;
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasEligibleSpend
{
  v2 = [(PKPayLaterAccountDetails *)self maximumEligibleSpendAmount];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 amount];
    char v5 = objc_msgSend(v4, "pk_isPositiveNumber");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isPayLaterSupportedInCurrentRegion
{
  uint64_t v3 = PKCurrentRegion();
  LOBYTE(self) = [v3 compare:self->_countryCode options:1] == 0;

  return (char)self;
}

- (id)minimumSinglePurchaseAmount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_products;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_16;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v14;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v7), "productDetails", (void)v13);
      v9 = [v8 minimumSinglePurchaseAmount];

      if (v5)
      {
        if (!v9) {
          goto LABEL_9;
        }
LABEL_8:
        uint64_t v10 = +[PKCurrencyAmount minimumCurrencyAmount:v5 otherCurrencyAmount:v9];

        id v5 = (id)v10;
        goto LABEL_9;
      }
      id v5 = v9;
      if (v9) {
        goto LABEL_8;
      }
LABEL_9:

      ++v7;
    }
    while (v4 != v7);
    uint64_t v11 = [(NSSet *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    uint64_t v4 = v11;
  }
  while (v11);
LABEL_16:

  return v5;
}

- (id)maximumSinglePurchaseAmount
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_products;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_16;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v14;
  do
  {
    uint64_t v7 = 0;
    do
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v7), "productDetails", (void)v13);
      v9 = [v8 maximumSinglePurchaseAmount];

      if (v5)
      {
        if (!v9) {
          goto LABEL_9;
        }
LABEL_8:
        uint64_t v10 = +[PKCurrencyAmount maximumCurrencyAmount:v5 otherCurrencyAmount:v9];

        id v5 = (id)v10;
        goto LABEL_9;
      }
      id v5 = v9;
      if (v9) {
        goto LABEL_8;
      }
LABEL_9:

      ++v7;
    }
    while (v4 != v7);
    uint64_t v11 = [(NSSet *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    uint64_t v4 = v11;
  }
  while (v11);
LABEL_16:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  lastUpdatedDate = self->_lastUpdatedDate;
  id v5 = a3;
  [v5 encodeObject:lastUpdatedDate forKey:@"lastUpdatedDate"];
  [v5 encodeObject:self->_createdDate forKey:@"createdDate"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_amountPaid forKey:@"amountPaid"];
  [v5 encodeObject:self->_totalFinanced forKey:@"totalFinanced"];
  [v5 encodeObject:self->_nextDueDate forKey:@"nextDueDate"];
  [v5 encodeObject:self->_nextDueAmount forKey:@"nextDueAmount"];
  [v5 encodeObject:self->_countryCode forKey:@"countryCode"];
  [v5 encodeObject:self->_products forKey:@"products"];
  [v5 encodeObject:self->_termsDetails forKey:@"termsDetails"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
  [v5 encodeObject:self->_associatedPassURL forKey:@"associatedPassURL"];
  [v5 encodeObject:self->_associatedPassSerialNumber forKey:@"associatedPassSerialNumber"];
  [v5 encodeObject:self->_associatedPassTypeIdentifier forKey:@"associatedPassTypeIdentifier"];
  [v5 encodeInteger:self->_cardNetwork forKey:@"cardNetwork"];
  [v5 encodeInteger:self->_paymentType forKey:@"paymentType"];
  [v5 encodeInteger:self->_financingPlanFetchLimit forKey:@"financingPlanFetchLimit"];
  [v5 encodeObject:self->_availableLanguages forKey:@"availableLanguages"];
  [v5 encodeBool:self->_requiresGenericMessaging forKey:@"requiresGenericMessaging"];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_75;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  uint64_t v6 = (NSDate *)v4[2];
  if (lastUpdatedDate && v6)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0) {
      goto LABEL_75;
    }
  }
  else if (lastUpdatedDate != v6)
  {
    goto LABEL_75;
  }
  createdDate = self->_createdDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (createdDate && v8)
  {
    if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0) {
      goto LABEL_75;
    }
  }
  else if (createdDate != v8)
  {
    goto LABEL_75;
  }
  currentBalance = self->_currentBalance;
  uint64_t v10 = (PKCurrencyAmount *)v4[10];
  if (currentBalance && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](currentBalance, "isEqual:")) {
      goto LABEL_75;
    }
  }
  else if (currentBalance != v10)
  {
    goto LABEL_75;
  }
  amountPaid = self->_amountPaid;
  int v12 = (PKCurrencyAmount *)v4[11];
  if (amountPaid && v12)
  {
    if (!-[PKCurrencyAmount isEqual:](amountPaid, "isEqual:")) {
      goto LABEL_75;
    }
  }
  else if (amountPaid != v12)
  {
    goto LABEL_75;
  }
  totalFinanced = self->_totalFinanced;
  long long v14 = (PKCurrencyAmount *)v4[12];
  if (totalFinanced && v14)
  {
    if (!-[PKCurrencyAmount isEqual:](totalFinanced, "isEqual:")) {
      goto LABEL_75;
    }
  }
  else if (totalFinanced != v14)
  {
    goto LABEL_75;
  }
  nextDueDate = self->_nextDueDate;
  long long v16 = (NSDate *)v4[13];
  if (nextDueDate && v16)
  {
    if ((-[NSDate isEqual:](nextDueDate, "isEqual:") & 1) == 0) {
      goto LABEL_75;
    }
  }
  else if (nextDueDate != v16)
  {
    goto LABEL_75;
  }
  nextDueAmount = self->_nextDueAmount;
  uint64_t v18 = (PKCurrencyAmount *)v4[14];
  if (nextDueAmount && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](nextDueAmount, "isEqual:")) {
      goto LABEL_75;
    }
  }
  else if (nextDueAmount != v18)
  {
    goto LABEL_75;
  }
  products = self->_products;
  uint64_t v20 = (NSSet *)v4[17];
  if (products && v20)
  {
    if ((-[NSSet isEqual:](products, "isEqual:") & 1) == 0) {
      goto LABEL_75;
    }
  }
  else if (products != v20)
  {
    goto LABEL_75;
  }
  termsDetails = self->_termsDetails;
  uint64_t v22 = (PKPayLaterAccountTermsDetails *)v4[18];
  if (termsDetails && v22)
  {
    if (!-[PKPayLaterAccountTermsDetails isEqual:](termsDetails, "isEqual:")) {
      goto LABEL_75;
    }
  }
  else if (termsDetails != v22)
  {
    goto LABEL_75;
  }
  userInfo = self->_userInfo;
  uint64_t v24 = (PKPayLaterAccountUserInfo *)v4[19];
  if (userInfo && v24)
  {
    if (!-[PKPayLaterAccountUserInfo isEqual:](userInfo, "isEqual:")) {
      goto LABEL_75;
    }
  }
  else if (userInfo != v24)
  {
    goto LABEL_75;
  }
  uint64_t v25 = (void *)v4[15];
  long long v26 = self->_countryCode;
  uint64_t v27 = v25;
  if (v26 == v27)
  {
  }
  else
  {
    long long v28 = v27;
    if (!v26 || !v27) {
      goto LABEL_74;
    }
    BOOL v29 = [(NSString *)v26 isEqualToString:v27];

    if (!v29) {
      goto LABEL_75;
    }
  }
  associatedPassURL = self->_associatedPassURL;
  uint64_t v31 = (NSURL *)v4[4];
  if (associatedPassURL && v31)
  {
    if ((-[NSURL isEqual:](associatedPassURL, "isEqual:") & 1) == 0) {
      goto LABEL_75;
    }
  }
  else if (associatedPassURL != v31)
  {
    goto LABEL_75;
  }
  long long v32 = (void *)v4[6];
  long long v26 = self->_associatedPassSerialNumber;
  uint64_t v33 = v32;
  if (v26 == v33)
  {
  }
  else
  {
    long long v28 = v33;
    if (!v26 || !v33) {
      goto LABEL_74;
    }
    BOOL v34 = [(NSString *)v26 isEqualToString:v33];

    if (!v34) {
      goto LABEL_75;
    }
  }
  uint64_t v35 = (void *)v4[5];
  long long v26 = self->_associatedPassTypeIdentifier;
  uint64_t v36 = v35;
  if (v26 != v36)
  {
    long long v28 = v36;
    if (v26 && v36)
    {
      BOOL v37 = [(NSString *)v26 isEqualToString:v36];

      if (!v37) {
        goto LABEL_75;
      }
      goto LABEL_78;
    }
LABEL_74:

    goto LABEL_75;
  }

LABEL_78:
  availableLanguages = self->_availableLanguages;
  uint64_t v41 = (NSArray *)v4[16];
  if (availableLanguages && v41)
  {
    if ((-[NSArray isEqual:](availableLanguages, "isEqual:") & 1) == 0) {
      goto LABEL_75;
    }
  }
  else if (availableLanguages != v41)
  {
    goto LABEL_75;
  }
  if (self->_cardNetwork == v4[7])
  {
    unint64_t v42 = [(PKPayLaterAccountDetails *)self paymentType];
    if (v42 == [v4 paymentType] && self->_financingPlanFetchLimit == v4[9])
    {
      BOOL v38 = self->_requiresGenericMessaging == *((unsigned __int8 *)v4 + 8);
      goto LABEL_76;
    }
  }
LABEL_75:
  BOOL v38 = 0;
LABEL_76:

  return v38;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_lastUpdatedDate];
  [v3 safelyAddObject:self->_createdDate];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_amountPaid];
  [v3 safelyAddObject:self->_totalFinanced];
  [v3 safelyAddObject:self->_nextDueDate];
  [v3 safelyAddObject:self->_nextDueAmount];
  [v3 safelyAddObject:self->_countryCode];
  [v3 safelyAddObject:self->_products];
  [v3 safelyAddObject:self->_termsDetails];
  [v3 safelyAddObject:self->_userInfo];
  [v3 safelyAddObject:self->_associatedPassURL];
  [v3 safelyAddObject:self->_associatedPassSerialNumber];
  [v3 safelyAddObject:self->_associatedPassTypeIdentifier];
  [v3 safelyAddObject:self->_availableLanguages];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_cardNetwork - v4 + 32 * v4;
  unint64_t v6 = [(PKPayLaterAccountDetails *)self paymentType];
  int64_t v7 = self->_financingPlanFetchLimit - (v6 - v5 + 32 * v5) + 32 * (v6 - v5 + 32 * v5);
  unint64_t v8 = self->_requiresGenericMessaging - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDate *)self->_lastUpdatedDate description];
  [v3 appendFormat:@"lastUpdateDate: '%@'; ", v4];

  int64_t v5 = [(NSDate *)self->_createdDate description];
  [v3 appendFormat:@"createdDate: '%@'; ", v5];

  [v3 appendFormat:@"currentBalance: '%@'; ", self->_currentBalance];
  [v3 appendFormat:@"amountPaid: '%@'; ", self->_amountPaid];
  [v3 appendFormat:@"totalFinanced: '%@'; ", self->_totalFinanced];
  unint64_t v6 = [(NSDate *)self->_nextDueDate description];
  [v3 appendFormat:@"nextDueDate: '%@'; ", v6];

  [v3 appendFormat:@"nextDueAmount: '%@'; ", self->_nextDueAmount];
  [v3 appendFormat:@"countryCode: '%@'; ", self->_countryCode];
  [v3 appendFormat:@"products: '%@'; ", self->_products];
  [v3 appendFormat:@"termsDetails: '%@'; ", self->_termsDetails];
  [v3 appendFormat:@"userInfo: '%@'; ", self->_userInfo];
  [v3 appendFormat:@"associatedPassURL: '%@'; ", self->_associatedPassURL];
  [v3 appendFormat:@"associatedPassSerialNumber: '%@'; ", self->_associatedPassSerialNumber];
  [v3 appendFormat:@"associatedPassTypeIdentifier: '%@'; ", self->_associatedPassTypeIdentifier];
  int64_t v7 = PKPaymentNetworkNameForPaymentCredentialType(self->_cardNetwork);
  [v3 appendFormat:@"cardNetwork: '%@'; ", v7];

  unint64_t v8 = PKPaymentMethodTypeToString(self->_paymentType);
  [v3 appendFormat:@"paymentType: '%@'; ", v8];

  objc_msgSend(v3, "appendFormat:", @"financingPlanFetchLimit: %ld; ", self->_financingPlanFetchLimit);
  [v3 appendFormat:@"availableLanguages: '%@'; ", self->_availableLanguages];
  if (self->_requiresGenericMessaging) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 appendFormat:@"requiresGenericMessaging: '%@'; ", v9];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [+[PKPayLaterAccountDetails allocWithZone:](PKPayLaterAccountDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSDate *)self->_lastUpdatedDate copyWithZone:a3];
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  uint64_t v8 = [(NSDate *)self->_createdDate copyWithZone:a3];
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  uint64_t v10 = [(PKCurrencyAmount *)self->_currentBalance copyWithZone:a3];
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = v10;

  int v12 = [(PKCurrencyAmount *)self->_amountPaid copyWithZone:a3];
  amountPaid = v5->_amountPaid;
  v5->_amountPaid = v12;

  long long v14 = [(PKCurrencyAmount *)self->_totalFinanced copyWithZone:a3];
  totalFinanced = v5->_totalFinanced;
  v5->_totalFinanced = v14;

  uint64_t v16 = [(NSDate *)self->_nextDueDate copyWithZone:a3];
  nextDueDate = v5->_nextDueDate;
  v5->_nextDueDate = (NSDate *)v16;

  uint64_t v18 = [(PKCurrencyAmount *)self->_nextDueAmount copyWithZone:a3];
  nextDueAmount = v5->_nextDueAmount;
  v5->_nextDueAmount = v18;

  uint64_t v20 = [(NSString *)self->_countryCode copyWithZone:a3];
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v20;

  uint64_t v22 = [(NSSet *)self->_products copyWithZone:a3];
  products = v5->_products;
  v5->_products = (NSSet *)v22;

  uint64_t v24 = [(PKPayLaterAccountTermsDetails *)self->_termsDetails copyWithZone:a3];
  termsDetails = v5->_termsDetails;
  v5->_termsDetails = v24;

  long long v26 = [(PKPayLaterAccountUserInfo *)self->_userInfo copyWithZone:a3];
  userInfo = v5->_userInfo;
  v5->_userInfo = v26;

  uint64_t v28 = [(NSURL *)self->_associatedPassURL copyWithZone:a3];
  associatedPassURL = v5->_associatedPassURL;
  v5->_associatedPassURL = (NSURL *)v28;

  uint64_t v30 = [(NSString *)self->_associatedPassSerialNumber copyWithZone:a3];
  associatedPassSerialNumber = v5->_associatedPassSerialNumber;
  v5->_associatedPassSerialNumber = (NSString *)v30;

  uint64_t v32 = [(NSString *)self->_associatedPassTypeIdentifier copyWithZone:a3];
  associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
  v5->_associatedPassTypeIdentifier = (NSString *)v32;

  uint64_t v34 = [(NSArray *)self->_availableLanguages copyWithZone:a3];
  availableLanguages = v5->_availableLanguages;
  v5->_availableLanguages = (NSArray *)v34;

  v5->_cardNetwork = self->_cardNetwork;
  v5->_paymentType = self->_paymentType;
  v5->_financingPlanFetchLimit = self->_financingPlanFetchLimit;
  v5->_requiresGenericMessaging = self->_requiresGenericMessaging;
  return v5;
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

- (int64_t)cardNetwork
{
  return self->_cardNetwork;
}

- (void)setCardNetwork:(int64_t)a3
{
  self->_cardNetwork = a3;
}

- (void)setPaymentType:(unint64_t)a3
{
  self->_paymentType = a3;
}

- (int64_t)financingPlanFetchLimit
{
  return self->_financingPlanFetchLimit;
}

- (void)setFinancingPlanFetchLimit:(int64_t)a3
{
  self->_financingPlanFetchLimit = a3;
}

- (PKCurrencyAmount)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (PKCurrencyAmount)amountPaid
{
  return self->_amountPaid;
}

- (void)setAmountPaid:(id)a3
{
}

- (PKCurrencyAmount)totalFinanced
{
  return self->_totalFinanced;
}

- (void)setTotalFinanced:(id)a3
{
}

- (NSDate)nextDueDate
{
  return self->_nextDueDate;
}

- (void)setNextDueDate:(id)a3
{
}

- (PKCurrencyAmount)nextDueAmount
{
  return self->_nextDueAmount;
}

- (void)setNextDueAmount:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSArray)availableLanguages
{
  return self->_availableLanguages;
}

- (void)setAvailableLanguages:(id)a3
{
}

- (BOOL)requiresGenericMessaging
{
  return self->_requiresGenericMessaging;
}

- (void)setRequiresGenericMessaging:(BOOL)a3
{
  self->_requiresGenericMessaging = a3;
}

- (NSSet)products
{
  return self->_products;
}

- (void)setProducts:(id)a3
{
}

- (PKPayLaterAccountTermsDetails)termsDetails
{
  return self->_termsDetails;
}

- (void)setTermsDetails:(id)a3
{
}

- (PKPayLaterAccountUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_termsDetails, 0);
  objc_storeStrong((id *)&self->_products, 0);
  objc_storeStrong((id *)&self->_availableLanguages, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_nextDueAmount, 0);
  objc_storeStrong((id *)&self->_nextDueDate, 0);
  objc_storeStrong((id *)&self->_totalFinanced, 0);
  objc_storeStrong((id *)&self->_amountPaid, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedPassURL, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end