@interface PKPayLaterPaymentRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAvailableFundingSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterPaymentRequest:(id)a3;
- (BOOL)showPeerPaymentBalance;
- (NSString)accountIdentifier;
- (NSString)defaultPassUniqueID;
- (NSString)payLaterPassUniqueID;
- (NSURL)accountBaseURL;
- (PKBankAccountInformation)defaultBankAccount;
- (PKPayLaterFinancingPlan)financingPlan;
- (PKPayLaterPaymentRequest)initWithCoder:(id)a3;
- (PKPayLaterPaymentRequest)initWithIntentDetails:(id)a3 payLaterAccount:(id)a4 financingPlan:(id)a5 intent:(unint64_t)a6 acceptedFundingSources:(id)a7 currencyAmount:(id)a8 hasAdequateAppleCashBalance:(BOOL)a9 countryCode:(id)a10;
- (id)_acceptedBankAccountsForAcceptedFundingSources:(id)a3;
- (id)acceptedPassesWithPassLibrary:(id)a3 peerPaymentAccount:(id)a4;
- (id)accountPaymentFundingSourceForBankIdentifier:(id)a3;
- (unint64_t)hash;
- (unint64_t)payLaterPaymentIntentType;
- (unint64_t)supportedRepaymentTypes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPayLaterPaymentRequest

- (PKPayLaterPaymentRequest)initWithIntentDetails:(id)a3 payLaterAccount:(id)a4 financingPlan:(id)a5 intent:(unint64_t)a6 acceptedFundingSources:(id)a7 currencyAmount:(id)a8 hasAdequateAppleCashBalance:(BOOL)a9 countryCode:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v55 = a5;
  id v56 = a7;
  id v19 = a8;
  id v20 = a10;
  v57.receiver = self;
  v57.super_class = (Class)PKPayLaterPaymentRequest;
  v21 = [(PKPaymentRequest *)&v57 init];
  if (v21)
  {
    uint64_t v22 = [v18 accountBaseURL];
    accountBaseURL = v21->_accountBaseURL;
    v21->_accountBaseURL = (NSURL *)v22;

    v21->_payLaterPaymentIntentType = a6;
    uint64_t v24 = [v18 accountIdentifier];
    accountIdentifier = v21->_accountIdentifier;
    v21->_accountIdentifier = (NSString *)v24;

    objc_storeStrong((id *)&v21->_financingPlan, a5);
    objc_storeStrong((id *)&v21->_intentDetails, a3);
    objc_storeStrong((id *)&v21->_currencyAmount, a8);
    uint64_t v26 = [v18 associatedPassUniqueID];
    payLaterPassUniqueID = v21->_payLaterPassUniqueID;
    v21->_payLaterPassUniqueID = (NSString *)v26;

    uint64_t v28 = [v17 supportedRepaymentTypes];
    BOOL v29 = a9;
    if ((v28 & 4) == 0) {
      BOOL v29 = 1;
    }
    if (v29) {
      unint64_t v30 = v28;
    }
    else {
      unint64_t v30 = v28 & 0xFFFFFFFFFFFFFFFBLL;
    }
    v21->_supportedRepaymentTypes = v30;
    [(PKPaymentRequest *)v21 setRequestType:11];
    [(PKPaymentRequest *)v21 setCountryCode:v20];
    v31 = [v19 currency];
    id v54 = v18;
    if (v31)
    {
      [(PKPaymentRequest *)v21 setCurrencyCode:v31];
    }
    else
    {
      v32 = [v18 payLaterDetails];
      v33 = [v32 currencyCode];
      [(PKPaymentRequest *)v21 setCurrencyCode:v33];
    }
    -[PKPaymentRequest setMerchantCapabilities:](v21, "setMerchantCapabilities:", [v17 merchantCapabilities]);
    v34 = [v17 merchantIdentifier];
    [(PKPaymentRequest *)v21 setMerchantIdentifier:v34];

    v35 = [v17 supportedRepaymentNetworks];
    [(PKPaymentRequest *)v21 setSupportedNetworks:v35];

    id v36 = v17;
    v37 = [v17 supportedRepaymentCountries];
    [(PKPaymentRequest *)v21 setSupportedCountries:v37];

    [(PKPaymentRequest *)v21 setClientCallbackTimeout:65.0];
    [(PKPaymentRequest *)v21 setConfirmationStyle:0];
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a6 == 1)
    {
      v39 = PKLocalizedCocoonString(&cfstr_PayApple.isa, 0);
      uint64_t v40 = [v19 amount];
    }
    else
    {
      if (a6 != 2) {
        goto LABEL_15;
      }
      v39 = PKLocalizedCocoonString(&cfstr_AuthorizeForAu.isa, 0);
      uint64_t v40 = [MEMORY[0x1E4F28C28] zero];
    }
    v41 = (void *)v40;
    v42 = +[PKPaymentSummaryItem summaryItemWithLabel:v39 amount:v40];
    [v38 addObject:v42];

LABEL_15:
    v43 = (void *)[v38 copy];
    [(PKPaymentRequest *)v21 setPaymentSummaryItems:v43];

    v44 = [(PKPayLaterPaymentRequest *)v21 _acceptedBankAccountsForAcceptedFundingSources:v56];
    if ([v44 count]) {
      v45 = v44;
    }
    else {
      v45 = 0;
    }
    [(PKPaymentRequest *)v21 setBankAccounts:v45];
    if ([v56 count])
    {
      v46 = [v56 objectAtIndexedSubscript:0];
    }
    else
    {
      v46 = 0;
    }
    uint64_t v47 = [v46 type];
    if (v47 == 2)
    {
      defaultPassUniqueID = [v46 accountPaymentFundingSource];
      uint64_t v51 = [defaultPassUniqueID bankAccountRepresentation];
      defaultBankAccount = v21->_defaultBankAccount;
      v21->_defaultBankAccount = (PKBankAccountInformation *)v51;
    }
    else
    {
      if (v47 != 1)
      {
LABEL_26:

        id v18 = v54;
        id v17 = v36;
        goto LABEL_27;
      }
      v48 = [v46 paymentPass];
      uint64_t v49 = [v48 uniqueID];

      defaultPassUniqueID = v21->_defaultPassUniqueID;
      v21->_defaultPassUniqueID = (NSString *)v49;
    }

    goto LABEL_26;
  }
LABEL_27:

  return v21;
}

- (id)acceptedPassesWithPassLibrary:(id)a3 peerPaymentAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = objc_alloc_init(PKPaymentService);
  v8 = [(PKPaymentService *)v24 defaultPaymentPassUniqueIdentifier];
  v25 = v7;
  v9 = [[PKPayLaterAvailableFundingSourcesFilter alloc] initWithPassLibrary:v6 peerPaymentAccount:v7 defaultPassUniqueIdentifier:v8];
  intentDetails = self->_intentDetails;
  currencyAmount = self->_currencyAmount;
  v12 = [(PKPayLaterFinancingPlan *)self->_financingPlan planIdentifier];
  v13 = [(PKPayLaterFinancingPlan *)self->_financingPlan paymentSource];
  v14 = [(PKPayLaterAvailableFundingSourcesFilter *)v9 availableFundingSourcesForPaymentIntentDetails:intentDetails currencyAmount:currencyAmount planIdentifier:v12 primaryPaymentSource:v13];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v14 count])
  {
    unint64_t v16 = 0;
    do
    {
      id v17 = [v14 objectAtIndexedSubscript:v16];
      if ([v17 type] == 1)
      {
        id v18 = [v17 paymentPass];
        id v19 = [v18 uniqueID];

        id v20 = [v6 passWithUniqueID:v19];
        v21 = [v20 paymentPass];
        [v15 safelyAddObject:v21];
      }
      ++v16;
    }
    while (v16 < [v14 count]);
  }
  uint64_t v22 = (void *)[v15 copy];

  return v22;
}

- (BOOL)showPeerPaymentBalance
{
  return (LOBYTE(self->_supportedRepaymentTypes) >> 2) & 1;
}

- (BOOL)hasAvailableFundingSource
{
  v3 = [(PKPayLaterPaymentRequest *)self defaultBankAccount];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(PKPayLaterPaymentRequest *)self defaultPassUniqueID];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)accountPaymentFundingSourceForBankIdentifier:(id)a3
{
  if (a3)
  {
    BOOL v4 = -[NSDictionary objectForKey:](self->_bankIdentifierToFundingSource, "objectForKey:");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)_acceptedBankAccountsForAcceptedFundingSources:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKPayLaterPaymentRequest__acceptedBankAccountsForAcceptedFundingSources___block_invoke;
  v12[3] = &unk_1E56E0068;
  id v13 = v6;
  id v7 = v6;
  v8 = objc_msgSend(v5, "pk_arrayBySafelyApplyingBlock:", v12);

  v9 = (NSDictionary *)[v7 copy];
  bankIdentifierToFundingSource = self->_bankIdentifierToFundingSource;
  self->_bankIdentifierToFundingSource = v9;

  return v8;
}

id __75__PKPayLaterPaymentRequest__acceptedBankAccountsForAcceptedFundingSources___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 2)
  {
    BOOL v4 = [v3 accountPaymentFundingSource];
    id v5 = [v4 bankAccountRepresentation];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v5 identifier];
    [v6 setObject:v4 forKey:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PKPayLaterPaymentRequest *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterPaymentRequest *)self isEqualToPayLaterPaymentRequest:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterPaymentRequest:(id)a3
{
  BOOL v4 = a3;
  if (!v4) {
    goto LABEL_43;
  }
  v34.receiver = self;
  v34.super_class = (Class)PKPayLaterPaymentRequest;
  if (![(PKPaymentRequest *)&v34 isEqual:v4]) {
    goto LABEL_43;
  }
  intentDetails = self->_intentDetails;
  BOOL v6 = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)v4[69];
  if (intentDetails) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (intentDetails != v6) {
      goto LABEL_43;
    }
  }
  else if (!-[PKAccountWebServiceFinancingPlanPaymentIntentResponse isEqual:](intentDetails, "isEqual:"))
  {
    goto LABEL_43;
  }
  payLaterPassUniqueID = self->_payLaterPassUniqueID;
  v10 = (NSString *)v4[73];
  if (payLaterPassUniqueID) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (payLaterPassUniqueID != v10) {
      goto LABEL_43;
    }
  }
  else
  {
    char v12 = -[NSString isEqual:](payLaterPassUniqueID, "isEqual:");
    if ((v12 & 1) == 0) {
      goto LABEL_43;
    }
  }
  id v13 = (void *)v4[74];
  v14 = self->_defaultPassUniqueID;
  id v15 = v13;
  if (v14 == v15)
  {
  }
  else
  {
    unint64_t v16 = v15;
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17) {
      goto LABEL_25;
    }
    BOOL v18 = [(NSString *)v14 isEqualToString:v15];

    if (!v18) {
      goto LABEL_43;
    }
  }
  defaultBankAccount = self->_defaultBankAccount;
  id v20 = (PKBankAccountInformation *)v4[75];
  if (defaultBankAccount && v20)
  {
    if ((-[PKBankAccountInformation isEqual:](defaultBankAccount, "isEqual:") & 1) == 0) {
      goto LABEL_43;
    }
  }
  else if (defaultBankAccount != v20)
  {
    goto LABEL_43;
  }
  financingPlan = self->_financingPlan;
  uint64_t v22 = (PKPayLaterFinancingPlan *)v4[71];
  if (financingPlan && v22)
  {
    if (!-[PKPayLaterFinancingPlan isEqual:](financingPlan, "isEqual:")) {
      goto LABEL_43;
    }
  }
  else if (financingPlan != v22)
  {
    goto LABEL_43;
  }
  accountBaseURL = self->_accountBaseURL;
  uint64_t v24 = (NSURL *)v4[78];
  if (accountBaseURL && v24)
  {
    if ((-[NSURL isEqual:](accountBaseURL, "isEqual:") & 1) == 0) {
      goto LABEL_43;
    }
  }
  else if (accountBaseURL != v24)
  {
    goto LABEL_43;
  }
  v27 = (void *)v4[72];
  v14 = self->_accountIdentifier;
  uint64_t v28 = v27;
  if (v14 != v28)
  {
    unint64_t v16 = v28;
    if (v14 && v28)
    {
      BOOL v29 = [(NSString *)v14 isEqualToString:v28];

      if (!v29) {
        goto LABEL_43;
      }
      goto LABEL_51;
    }
LABEL_25:

    goto LABEL_43;
  }

LABEL_51:
  bankIdentifierToFundingSource = self->_bankIdentifierToFundingSource;
  v31 = (NSDictionary *)v4[68];
  if (bankIdentifierToFundingSource && v31)
  {
    if ((-[NSDictionary isEqual:](bankIdentifierToFundingSource, "isEqual:") & 1) == 0) {
      goto LABEL_43;
    }
  }
  else if (bankIdentifierToFundingSource != v31)
  {
    goto LABEL_43;
  }
  currencyAmount = self->_currencyAmount;
  v33 = (PKCurrencyAmount *)v4[70];
  if (currencyAmount && v33)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:")) {
      goto LABEL_43;
    }
  }
  else if (currencyAmount != v33)
  {
    goto LABEL_43;
  }
  if (self->_payLaterPaymentIntentType == v4[77])
  {
    BOOL v25 = self->_supportedRepaymentTypes == v4[76];
    goto LABEL_44;
  }
LABEL_43:
  BOOL v25 = 0;
LABEL_44:

  return v25;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_intentDetails];
  [v3 safelyAddObject:self->_payLaterPassUniqueID];
  [v3 safelyAddObject:self->_defaultPassUniqueID];
  [v3 safelyAddObject:self->_defaultBankAccount];
  [v3 safelyAddObject:self->_financingPlan];
  [v3 safelyAddObject:self->_accountBaseURL];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_bankIdentifierToFundingSource];
  [v3 safelyAddObject:self->_currencyAmount];
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterPaymentRequest;
  id v4 = [(PKPayLaterPaymentRequest *)&v9 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  unint64_t v6 = self->_payLaterPaymentIntentType - v5 + 32 * v5;
  unint64_t v7 = self->_supportedRepaymentTypes - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterPaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKPayLaterPaymentRequest;
  uint64_t v5 = [(PKPaymentRequest *)&v29 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentDetails"];
    intentDetails = v5->_intentDetails;
    v5->_intentDetails = (PKAccountWebServiceFinancingPlanPaymentIntentResponse *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payLaterPassUniqueID"];
    payLaterPassUniqueID = v5->_payLaterPassUniqueID;
    v5->_payLaterPassUniqueID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultPassUniqueID"];
    defaultPassUniqueID = v5->_defaultPassUniqueID;
    v5->_defaultPassUniqueID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultBankAccount"];
    defaultBankAccount = v5->_defaultBankAccount;
    v5->_defaultBankAccount = (PKBankAccountInformation *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlan"];
    financingPlan = v5->_financingPlan;
    v5->_financingPlan = (PKPayLaterFinancingPlan *)v14;

    v5->_payLaterPaymentIntentType = [v4 decodeIntegerForKey:@"payLaterPaymentIntentType"];
    v5->_supportedRepaymentTypes = [v4 decodeIntegerForKey:@"supportedRepaymentTypes"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountBaseURL"];
    accountBaseURL = v5->_accountBaseURL;
    v5->_accountBaseURL = (NSURL *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v18;

    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"bankIdentifierToFundingSource"];
    bankIdentifierToFundingSource = v5->_bankIdentifierToFundingSource;
    v5->_bankIdentifierToFundingSource = (NSDictionary *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmount"];
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterPaymentRequest;
  id v4 = a3;
  [(PKPaymentRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentDetails, @"intentDetails", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_defaultPassUniqueID forKey:@"defaultPassUniqueID"];
  [v4 encodeObject:self->_payLaterPassUniqueID forKey:@"payLaterPassUniqueID"];
  [v4 encodeObject:self->_defaultBankAccount forKey:@"defaultBankAccount"];
  [v4 encodeObject:self->_financingPlan forKey:@"financingPlan"];
  [v4 encodeInteger:self->_payLaterPaymentIntentType forKey:@"payLaterPaymentIntentType"];
  [v4 encodeInteger:self->_supportedRepaymentTypes forKey:@"supportedRepaymentTypes"];
  [v4 encodeObject:self->_accountBaseURL forKey:@"accountBaseURL"];
  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_bankIdentifierToFundingSource forKey:@"bankIdentifierToFundingSource"];
  [v4 encodeObject:self->_currencyAmount forKey:@"currencyAmount"];
}

- (PKPayLaterFinancingPlan)financingPlan
{
  return self->_financingPlan;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)payLaterPassUniqueID
{
  return self->_payLaterPassUniqueID;
}

- (NSString)defaultPassUniqueID
{
  return self->_defaultPassUniqueID;
}

- (PKBankAccountInformation)defaultBankAccount
{
  return self->_defaultBankAccount;
}

- (unint64_t)supportedRepaymentTypes
{
  return self->_supportedRepaymentTypes;
}

- (unint64_t)payLaterPaymentIntentType
{
  return self->_payLaterPaymentIntentType;
}

- (NSURL)accountBaseURL
{
  return self->_accountBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountBaseURL, 0);
  objc_storeStrong((id *)&self->_defaultBankAccount, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueID, 0);
  objc_storeStrong((id *)&self->_payLaterPassUniqueID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_intentDetails, 0);
  objc_storeStrong((id *)&self->_bankIdentifierToFundingSource, 0);
}

@end