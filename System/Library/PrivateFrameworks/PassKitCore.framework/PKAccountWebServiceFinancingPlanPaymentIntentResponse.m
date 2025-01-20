@interface PKAccountWebServiceFinancingPlanPaymentIntentResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFinancingPlanPaymentIntentResponse:(id)a3;
- (NSArray)acceptedFundingSources;
- (NSArray)lastUsedFundingSources;
- (NSArray)supportedRepaymentNetworks;
- (NSSet)supportedRepaymentCountries;
- (NSString)merchantIdentifier;
- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)initWithCoder:(id)a3;
- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)initWithData:(id)a3;
- (PKCurrencyAmount)minimumAmount;
- (PKCurrencyAmount)payoffAmount;
- (PKCurrencyAmount)totalSavedInterest;
- (id)bankAcceptedFundingSources;
- (id)description;
- (unint64_t)hash;
- (unint64_t)merchantCapabilities;
- (unint64_t)supportedRepaymentTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptedFundingSources:(id)a3;
- (void)setLastUsedFundingSources:(id)a3;
- (void)setMerchantCapabilities:(unint64_t)a3;
- (void)setMerchantIdentifier:(id)a3;
- (void)setMinimumAmount:(id)a3;
- (void)setPayoffAmount:(id)a3;
- (void)setSupportedRepaymentCountries:(id)a3;
- (void)setSupportedRepaymentNetworks:(id)a3;
- (void)setSupportedRepaymentTypes:(unint64_t)a3;
- (void)setTotalSavedInterest:(id)a3;
@end

@implementation PKAccountWebServiceFinancingPlanPaymentIntentResponse

- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)initWithData:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v64.receiver = self;
  v64.super_class = (Class)PKAccountWebServiceFinancingPlanPaymentIntentResponse;
  v3 = [(PKPaginatedWebServiceResponse *)&v64 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_39:
    v24 = v4;
    goto LABEL_40;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = [v5 objectForKey:@"acceptedFundingSources"];
    objc_opt_class();
    v54 = (void *)v7;
    v55 = v5;
    if (objc_opt_isKindOfClass())
    {
      v8 = v4;
      id v9 = v54;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v61 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v14;
              v16 = [[PKAccountPaymentFundingSource alloc] initWithDictionary:v15];

              [v6 safelyAddObject:v16];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v11);
      }

      v4 = v8;
      v5 = v55;
    }
    uint64_t v17 = [v6 count];
    if (v17) {
      v18 = (void *)[v6 copy];
    }
    else {
      v18 = 0;
    }
    objc_storeStrong((id *)&v4->_acceptedFundingSources, v18);
    if (v17) {

    }
    uint64_t v25 = [v5 PKArrayContaining:objc_opt_class() forKey:@"supportedRepaymentNetworks"];
    supportedRepaymentNetworks = v4->_supportedRepaymentNetworks;
    v4->_supportedRepaymentNetworks = (NSArray *)v25;

    v27 = [v5 PKArrayContaining:objc_opt_class() forKey:@"merchantCapabilities"];
    v4->_merchantCapabilities = PKMerchantCapabilityFromStrings(v27);

    v28 = [v5 PKArrayContaining:objc_opt_class() forKey:@"supportedRepaymentTypes"];
    v4->_supportedRepaymentTypes = PKPayLaterFundingSourcePaymentTypeFromStrings(v28);

    uint64_t v29 = [v5 PKSetContaining:objc_opt_class() forKey:@"supportedRepaymentCountries"];
    supportedRepaymentCountries = v4->_supportedRepaymentCountries;
    v4->_supportedRepaymentCountries = (NSSet *)v29;

    uint64_t v31 = [v5 PKStringForKey:@"merchantIdentifier"];
    merchantIdentifier = v4->_merchantIdentifier;
    v4->_merchantIdentifier = (NSString *)v31;

    uint64_t v33 = [v5 PKCurrencyAmountForKey:@"totalSavedInterest"];
    totalSavedInterest = v4->_totalSavedInterest;
    v4->_totalSavedInterest = (PKCurrencyAmount *)v33;

    uint64_t v35 = [v5 PKCurrencyAmountForKey:@"payoffAmount"];
    payoffAmount = v4->_payoffAmount;
    v4->_payoffAmount = (PKCurrencyAmount *)v35;

    uint64_t v37 = [v5 PKCurrencyAmountForKey:@"minimumAmount"];
    minimumAmount = v4->_minimumAmount;
    v4->_minimumAmount = (PKCurrencyAmount *)v37;

    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v40 = [v5 objectForKey:@"lastUsedFundingSources"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v52 = v40;
      v53 = v4;
      id v41 = v40;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v57 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v47 = v46;
              v48 = [[PKPayLaterLastUsedFundingSource alloc] initWithDictionary:v47];

              [v39 safelyAddObject:v48];
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v43);
      }

      v40 = v52;
      v4 = v53;
    }
    uint64_t v49 = objc_msgSend(v39, "count", v52, v53);
    if (v49) {
      v50 = (void *)[v39 copy];
    }
    else {
      v50 = 0;
    }
    objc_storeStrong((id *)&v4->_lastUsedFundingSources, v50);
    if (v49) {

    }
    goto LABEL_39;
  }
  v19 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543618;
    v68 = v21;
    __int16 v69 = 2114;
    v70 = v23;
    _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
  }
  v24 = 0;
LABEL_40:

  return v24;
}

- (id)bankAcceptedFundingSources
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  bankAcceptedFundingSources = self->_bankAcceptedFundingSources;
  if (bankAcceptedFundingSources)
  {
    v4 = [(NSDictionary *)bankAcceptedFundingSources allValues];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = self->_acceptedFundingSources;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v11, "type", (void)v18) == 1)
          {
            uint64_t v12 = [[PKPayLaterBankPaymentSource alloc] initWithAccountPaymentFundingSource:v11];
            v13 = v12;
            if (v12)
            {
              v14 = [(PKPayLaterBankPaymentSource *)v12 identifier];
              [v5 setObject:v13 forKey:v14];
            }
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    id v15 = (NSDictionary *)[v5 copy];
    v16 = self->_bankAcceptedFundingSources;
    self->_bankAcceptedFundingSources = v15;

    v4 = [(NSDictionary *)self->_bankAcceptedFundingSources allValues];
  }
  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"acceptedFundingSources: '%@'; ", self->_acceptedFundingSources];
  [v3 appendFormat:@"merchantIdentifier: '%@'; ", self->_merchantIdentifier];
  [v3 appendFormat:@"supportedRepaymentNetworks: %@; ", self->_supportedRepaymentNetworks];
  v4 = PKMerchantCapabilityToStrings(self->_merchantCapabilities);
  [v3 appendFormat:@"merchantCapabilities: %@; ", v4];

  id v5 = PKPayLaterFundingSourcePaymentTypeToStrings(self->_supportedRepaymentTypes);
  [v3 appendFormat:@"supportedRepaymentTypes: %@; ", v5];

  [v3 appendFormat:@"supportedRepaymentCountries: '%@'; ", self->_supportedRepaymentCountries];
  [v3 appendFormat:@"totalSavedInterest: '%@'; ", self->_totalSavedInterest];
  [v3 appendFormat:@"payoffAmount: '%@'; ", self->_payoffAmount];
  [v3 appendFormat:@"lastUsedFundingSources: '%@'; ", self->_lastUsedFundingSources];
  [v3 appendFormat:@">"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountWebServiceFinancingPlanPaymentIntentResponse *)self isEqualToFinancingPlanPaymentIntentResponse:v5];

  return v6;
}

- (BOOL)isEqualToFinancingPlanPaymentIntentResponse:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_56;
  }
  acceptedFundingSources = self->_acceptedFundingSources;
  BOOL v6 = (NSArray *)v4[8];
  if (acceptedFundingSources) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (acceptedFundingSources != v6) {
      goto LABEL_56;
    }
  }
  else if ((-[NSArray isEqual:](acceptedFundingSources, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  supportedRepaymentNetworks = self->_supportedRepaymentNetworks;
  uint64_t v9 = (NSArray *)v4[9];
  if (supportedRepaymentNetworks) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (supportedRepaymentNetworks != v9) {
      goto LABEL_56;
    }
  }
  else if ((-[NSArray isEqual:](supportedRepaymentNetworks, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  supportedRepaymentCountries = self->_supportedRepaymentCountries;
  uint64_t v12 = (NSSet *)v4[12];
  if (supportedRepaymentCountries) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (supportedRepaymentCountries != v12) {
      goto LABEL_56;
    }
  }
  else if ((-[NSSet isEqual:](supportedRepaymentCountries, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  merchantIdentifier = self->_merchantIdentifier;
  id v15 = (NSString *)v4[13];
  if (merchantIdentifier) {
    BOOL v16 = v15 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (merchantIdentifier != v15) {
      goto LABEL_56;
    }
  }
  else if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_56;
  }
  totalSavedInterest = self->_totalSavedInterest;
  long long v18 = (PKCurrencyAmount *)v4[14];
  if (totalSavedInterest && v18)
  {
    if (!-[PKCurrencyAmount isEqual:](totalSavedInterest, "isEqual:")) {
      goto LABEL_56;
    }
  }
  else if (totalSavedInterest != v18)
  {
    goto LABEL_56;
  }
  payoffAmount = self->_payoffAmount;
  long long v20 = (PKCurrencyAmount *)v4[15];
  if (payoffAmount && v20)
  {
    if (!-[PKCurrencyAmount isEqual:](payoffAmount, "isEqual:")) {
      goto LABEL_56;
    }
  }
  else if (payoffAmount != v20)
  {
    goto LABEL_56;
  }
  minimumAmount = self->_minimumAmount;
  v22 = (PKCurrencyAmount *)v4[16];
  if (minimumAmount && v22)
  {
    if (!-[PKCurrencyAmount isEqual:](minimumAmount, "isEqual:")) {
      goto LABEL_56;
    }
  }
  else if (minimumAmount != v22)
  {
    goto LABEL_56;
  }
  lastUsedFundingSources = self->_lastUsedFundingSources;
  v24 = (NSArray *)v4[17];
  if (!lastUsedFundingSources || !v24)
  {
    if (lastUsedFundingSources == v24) {
      goto LABEL_54;
    }
LABEL_56:
    BOOL v25 = 0;
    goto LABEL_57;
  }
  if ((-[NSArray isEqual:](lastUsedFundingSources, "isEqual:") & 1) == 0) {
    goto LABEL_56;
  }
LABEL_54:
  if (self->_merchantCapabilities != v4[10]) {
    goto LABEL_56;
  }
  BOOL v25 = self->_supportedRepaymentTypes == v4[11];
LABEL_57:

  return v25;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_acceptedFundingSources];
  [v3 safelyAddObject:self->_supportedRepaymentNetworks];
  [v3 safelyAddObject:self->_supportedRepaymentCountries];
  [v3 safelyAddObject:self->_merchantIdentifier];
  [v3 safelyAddObject:self->_totalSavedInterest];
  [v3 safelyAddObject:self->_payoffAmount];
  [v3 safelyAddObject:self->_minimumAmount];
  [v3 safelyAddObject:self->_lastUsedFundingSources];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_merchantCapabilities - v4 + 32 * v4;
  unint64_t v6 = self->_supportedRepaymentTypes - v5 + 32 * v5;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountWebServiceFinancingPlanPaymentIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKAccountWebServiceFinancingPlanPaymentIntentResponse;
  unint64_t v5 = [(PKAccountWebServiceFinancingPlanPaymentIntentResponse *)&v35 init];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"acceptedFundingSources"];
    acceptedFundingSources = v5->_acceptedFundingSources;
    v5->_acceptedFundingSources = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    BOOL v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"supportedRepaymentNetworks"];
    supportedRepaymentNetworks = v5->_supportedRepaymentNetworks;
    v5->_supportedRepaymentNetworks = (NSArray *)v14;

    v5->_merchantCapabilities = [v4 decodeIntegerForKey:@"merchantCapabilities"];
    v5->_supportedRepaymentTypes = [v4 decodeIntegerForKey:@"supportedRepaymentTypes"];
    BOOL v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    long long v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"supportedRepaymentCountries"];
    supportedRepaymentCountries = v5->_supportedRepaymentCountries;
    v5->_supportedRepaymentCountries = (NSSet *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantIdentifier"];
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalSavedInterest"];
    totalSavedInterest = v5->_totalSavedInterest;
    v5->_totalSavedInterest = (PKCurrencyAmount *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payoffAmount"];
    payoffAmount = v5->_payoffAmount;
    v5->_payoffAmount = (PKCurrencyAmount *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"minimumAmount"];
    minimumAmount = v5->_minimumAmount;
    v5->_minimumAmount = (PKCurrencyAmount *)v27;

    uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    uint64_t v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"lastUsedFundingSources"];
    lastUsedFundingSources = v5->_lastUsedFundingSources;
    v5->_lastUsedFundingSources = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  acceptedFundingSources = self->_acceptedFundingSources;
  id v5 = a3;
  [v5 encodeObject:acceptedFundingSources forKey:@"acceptedFundingSources"];
  [v5 encodeObject:self->_supportedRepaymentNetworks forKey:@"supportedRepaymentNetworks"];
  [v5 encodeInteger:self->_merchantCapabilities forKey:@"merchantCapabilities"];
  [v5 encodeInteger:self->_supportedRepaymentTypes forKey:@"supportedRepaymentTypes"];
  [v5 encodeObject:self->_supportedRepaymentCountries forKey:@"supportedRepaymentCountries"];
  [v5 encodeObject:self->_merchantIdentifier forKey:@"merchantIdentifier"];
  [v5 encodeObject:self->_totalSavedInterest forKey:@"totalSavedInterest"];
  [v5 encodeObject:self->_payoffAmount forKey:@"payoffAmount"];
  [v5 encodeObject:self->_minimumAmount forKey:@"minimumAmount"];
  [v5 encodeObject:self->_lastUsedFundingSources forKey:@"lastUsedFundingSources"];
}

- (NSArray)acceptedFundingSources
{
  return self->_acceptedFundingSources;
}

- (void)setAcceptedFundingSources:(id)a3
{
}

- (NSArray)supportedRepaymentNetworks
{
  return self->_supportedRepaymentNetworks;
}

- (void)setSupportedRepaymentNetworks:(id)a3
{
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(unint64_t)a3
{
  self->_merchantCapabilities = a3;
}

- (unint64_t)supportedRepaymentTypes
{
  return self->_supportedRepaymentTypes;
}

- (void)setSupportedRepaymentTypes:(unint64_t)a3
{
  self->_supportedRepaymentTypes = a3;
}

- (NSSet)supportedRepaymentCountries
{
  return self->_supportedRepaymentCountries;
}

- (void)setSupportedRepaymentCountries:(id)a3
{
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
}

- (PKCurrencyAmount)totalSavedInterest
{
  return self->_totalSavedInterest;
}

- (void)setTotalSavedInterest:(id)a3
{
}

- (PKCurrencyAmount)payoffAmount
{
  return self->_payoffAmount;
}

- (void)setPayoffAmount:(id)a3
{
}

- (PKCurrencyAmount)minimumAmount
{
  return self->_minimumAmount;
}

- (void)setMinimumAmount:(id)a3
{
}

- (NSArray)lastUsedFundingSources
{
  return self->_lastUsedFundingSources;
}

- (void)setLastUsedFundingSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedFundingSources, 0);
  objc_storeStrong((id *)&self->_minimumAmount, 0);
  objc_storeStrong((id *)&self->_payoffAmount, 0);
  objc_storeStrong((id *)&self->_totalSavedInterest, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentCountries, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentNetworks, 0);
  objc_storeStrong((id *)&self->_acceptedFundingSources, 0);
  objc_storeStrong((id *)&self->_bankAcceptedFundingSources, 0);
}

@end