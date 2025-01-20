@interface PKPayLaterFinancingOption
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAPR;
- (BOOL)isAmountDetailsEqualToFinancingOption:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFinancingOption:(id)a3;
- (NSArray)installments;
- (NSArray)supportedRepaymentNetworks;
- (NSDecimalNumber)apr;
- (NSDictionary)financingOptionData;
- (NSSet)supportedRepaymentCountries;
- (NSSet)supportedRepaymentFundingSourceIdentifiers;
- (NSString)identifier;
- (NSString)selectionIdentifier;
- (PKCurrencyAmount)authAmount;
- (PKPayLaterFinancingAmount)dueNow;
- (PKPayLaterFinancingAmount)installmentAmount;
- (PKPayLaterFinancingAmount)installmentFees;
- (PKPayLaterFinancingAmount)totalAmount;
- (PKPayLaterFinancingAmount)totalFees;
- (PKPayLaterFinancingAmount)totalInterest;
- (PKPayLaterFinancingAmount)totalPrincipal;
- (PKPayLaterFinancingOption)initWithCoder:(id)a3;
- (PKPayLaterFinancingOption)initWithDictionary:(id)a3;
- (PKPayLaterFinancingOption)initWithDictionary:(id)a3 productType:(unint64_t)a4;
- (PKPayLaterFinancingOptionTermsDetails)termsDetails;
- (id)analyticsValueForAPR;
- (id)analyticsValueForInstallmentCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)installmentCount;
- (unint64_t)autoPayment;
- (unint64_t)hash;
- (unint64_t)merchantCapabilities;
- (unint64_t)productType;
- (unint64_t)supportedRepaymentTypes;
- (void)encodeWithCoder:(id)a3;
- (void)setApr:(id)a3;
- (void)setAuthAmount:(id)a3;
- (void)setAutoPayment:(unint64_t)a3;
- (void)setDueNow:(id)a3;
- (void)setFinancingOptionData:(id)a3;
- (void)setHasAPR:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstallmentAmount:(id)a3;
- (void)setInstallmentCount:(int64_t)a3;
- (void)setInstallmentFees:(id)a3;
- (void)setInstallments:(id)a3;
- (void)setMerchantCapabilities:(unint64_t)a3;
- (void)setProductType:(unint64_t)a3;
- (void)setSelectionIdentifier:(id)a3;
- (void)setSupportedRepaymentCountries:(id)a3;
- (void)setSupportedRepaymentFundingSourceIdentifiers:(id)a3;
- (void)setSupportedRepaymentNetworks:(id)a3;
- (void)setSupportedRepaymentTypes:(unint64_t)a3;
- (void)setTermsDetails:(id)a3;
- (void)setTotalAmount:(id)a3;
- (void)setTotalFees:(id)a3;
- (void)setTotalInterest:(id)a3;
- (void)setTotalPrincipal:(id)a3;
@end

@implementation PKPayLaterFinancingOption

- (PKPayLaterFinancingOption)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"productType"];
  uint64_t v6 = PKPayLaterAccountProductTypeFromString(v5);

  v7 = [(PKPayLaterFinancingOption *)self initWithDictionary:v4 productType:v6];
  return v7;
}

- (PKPayLaterFinancingOption)initWithDictionary:(id)a3 productType:(unint64_t)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v81.receiver = self;
  v81.super_class = (Class)PKPayLaterFinancingOption;
  v7 = [(PKPayLaterFinancingOption *)&v81 init];
  v8 = v7;
  if (v7)
  {
    v7->_productType = a4;
    uint64_t v9 = [v6 PKStringForKey:@"identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v6 PKStringForKey:@"selectionIdentifier"];
    selectionIdentifier = v8->_selectionIdentifier;
    v8->_selectionIdentifier = (NSString *)v11;

    v8->_installmentCount = [v6 PKIntegerForKey:@"installmentCount"];
    v13 = [v6 PKStringForKey:@"autoPayment"];
    v8->_autoPayment = PKPayLaterFinancingOptionAutoPaymentFromString(v13);

    v8->_hasAPR = [v6 PKBoolForKey:@"hasAPR"];
    uint64_t v14 = [v6 PKDecimalNumberFromStringForKey:@"apr"];
    apr = v8->_apr;
    v8->_apr = (NSDecimalNumber *)v14;

    v16 = [v6 PKDictionaryForKey:@"authAmount"];
    if ((unint64_t)[v16 count] >= 2)
    {
      v17 = (void *)MEMORY[0x1E4F28C28];
      v18 = [v16 PKStringForKey:@"amount"];
      v19 = [v17 decimalNumberWithString:v18];

      v20 = [v16 PKStringForKey:@"amountCurrency"];
      v21 = v20;
      if (v19 && v20)
      {
        uint64_t v22 = PKCurrencyAmountCreate(v19, v20, 0);
        authAmount = v8->_authAmount;
        v8->_authAmount = (PKCurrencyAmount *)v22;
      }
    }
    v24 = [PKPayLaterFinancingAmount alloc];
    v25 = [v6 PKDictionaryForKey:@"totalAmount"];
    uint64_t v26 = [(PKPayLaterFinancingAmount *)v24 initWithDictionary:v25];
    totalAmount = v8->_totalAmount;
    v8->_totalAmount = (PKPayLaterFinancingAmount *)v26;

    v28 = [PKPayLaterFinancingAmount alloc];
    v29 = [v6 PKDictionaryForKey:@"totalFees"];
    uint64_t v30 = [(PKPayLaterFinancingAmount *)v28 initWithDictionary:v29];
    totalFees = v8->_totalFees;
    v8->_totalFees = (PKPayLaterFinancingAmount *)v30;

    v32 = [PKPayLaterFinancingAmount alloc];
    v33 = [v6 PKDictionaryForKey:@"dueNow"];
    uint64_t v34 = [(PKPayLaterFinancingAmount *)v32 initWithDictionary:v33];
    dueNow = v8->_dueNow;
    v8->_dueNow = (PKPayLaterFinancingAmount *)v34;

    v36 = [PKPayLaterFinancingAmount alloc];
    v37 = [v6 PKDictionaryForKey:@"installmentAmount"];
    uint64_t v38 = [(PKPayLaterFinancingAmount *)v36 initWithDictionary:v37];
    installmentAmount = v8->_installmentAmount;
    v8->_installmentAmount = (PKPayLaterFinancingAmount *)v38;

    v40 = [PKPayLaterFinancingAmount alloc];
    v41 = [v6 PKDictionaryForKey:@"installmentFees"];
    uint64_t v42 = [(PKPayLaterFinancingAmount *)v40 initWithDictionary:v41];
    installmentFees = v8->_installmentFees;
    v8->_installmentFees = (PKPayLaterFinancingAmount *)v42;

    v44 = [PKPayLaterFinancingAmount alloc];
    v45 = [v6 PKDictionaryForKey:@"totalPrincipal"];
    uint64_t v46 = [(PKPayLaterFinancingAmount *)v44 initWithDictionary:v45];
    totalPrincipal = v8->_totalPrincipal;
    v8->_totalPrincipal = (PKPayLaterFinancingAmount *)v46;

    v48 = [PKPayLaterFinancingAmount alloc];
    v49 = [v6 PKDictionaryForKey:@"totalInterest"];
    uint64_t v50 = [(PKPayLaterFinancingAmount *)v48 initWithDictionary:v49];
    totalInterest = v8->_totalInterest;
    v8->_totalInterest = (PKPayLaterFinancingAmount *)v50;

    v52 = [v6 PKArrayContaining:objc_opt_class() forKey:@"installments"];
    if ([v52 count])
    {
      v76 = v16;
      id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v54 = v52;
      uint64_t v55 = [v54 countByEnumeratingWithState:&v77 objects:v82 count:16];
      if (v55)
      {
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v56; ++i)
          {
            if (*(void *)v78 != v57) {
              objc_enumerationMutation(v54);
            }
            v59 = [[PKPayLaterFinancingOptionInstallment alloc] initWithDictionary:*(void *)(*((void *)&v77 + 1) + 8 * i)];
            [v53 safelyAddObject:v59];
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v77 objects:v82 count:16];
        }
        while (v56);
      }

      if ([v53 count])
      {
        uint64_t v60 = [v53 copy];
        installments = v8->_installments;
        v8->_installments = (NSArray *)v60;
      }
      else
      {
        installments = v8->_installments;
        v8->_installments = 0;
      }
      v16 = v76;
    }
    v62 = [v6 PKDictionaryForKey:@"termsDetails"];
    if ([v62 count])
    {
      v63 = [[PKPayLaterFinancingOptionTermsDetails alloc] initWithDictionary:v62];
      termsDetails = v8->_termsDetails;
      v8->_termsDetails = v63;
    }
    uint64_t v65 = [v6 PKArrayContaining:objc_opt_class() forKey:@"supportedRepaymentNetworks"];
    supportedRepaymentNetworks = v8->_supportedRepaymentNetworks;
    v8->_supportedRepaymentNetworks = (NSArray *)v65;

    v67 = [v6 PKArrayContaining:objc_opt_class() forKey:@"merchantCapabilities"];
    v8->_merchantCapabilities = PKMerchantCapabilityFromStrings(v67);

    v68 = [v6 PKArrayContaining:objc_opt_class() forKey:@"supportedRepaymentTypes"];
    v8->_supportedRepaymentTypes = PKPayLaterFundingSourcePaymentTypeFromStrings(v68);

    uint64_t v69 = [v6 PKSetContaining:objc_opt_class() forKey:@"supportedRepaymentCountries"];
    supportedRepaymentCountries = v8->_supportedRepaymentCountries;
    v8->_supportedRepaymentCountries = (NSSet *)v69;

    uint64_t v71 = [v6 PKSetContaining:objc_opt_class() forKey:@"supportedRepaymentFundingSourceIdentifiers"];
    supportedRepaymentFundingSourceIdentifiers = v8->_supportedRepaymentFundingSourceIdentifiers;
    v8->_supportedRepaymentFundingSourceIdentifiers = (NSSet *)v71;

    uint64_t v73 = [v6 PKDictionaryForKey:@"financingOptionData"];
    financingOptionData = v8->_financingOptionData;
    v8->_financingOptionData = (NSDictionary *)v73;
  }
  return v8;
}

- (BOOL)isAmountDetailsEqualToFinancingOption:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_57;
  }
  selectionIdentifier = self->_selectionIdentifier;
  id v6 = (NSString *)v4[4];
  if (selectionIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (selectionIdentifier != v6) {
      goto LABEL_57;
    }
  }
  else if ((-[NSString isEqual:](selectionIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_57;
  }
  apr = self->_apr;
  uint64_t v9 = (NSDecimalNumber *)v4[15];
  if (apr && v9)
  {
    if ((-[NSDecimalNumber isEqual:](apr, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (apr != v9)
  {
    goto LABEL_57;
  }
  totalAmount = self->_totalAmount;
  uint64_t v11 = (PKPayLaterFinancingAmount *)v4[8];
  if (totalAmount && v11)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalAmount, "isEqual:")) {
      goto LABEL_57;
    }
  }
  else if (totalAmount != v11)
  {
    goto LABEL_57;
  }
  installmentAmount = self->_installmentAmount;
  v13 = (PKPayLaterFinancingAmount *)v4[11];
  if (installmentAmount && v13)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentAmount, "isEqual:")) {
      goto LABEL_57;
    }
  }
  else if (installmentAmount != v13)
  {
    goto LABEL_57;
  }
  installmentFees = self->_installmentFees;
  v15 = (PKPayLaterFinancingAmount *)v4[12];
  if (installmentFees && v15)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentFees, "isEqual:")) {
      goto LABEL_57;
    }
  }
  else if (installmentFees != v15)
  {
    goto LABEL_57;
  }
  totalInterest = self->_totalInterest;
  v17 = (PKPayLaterFinancingAmount *)v4[14];
  if (totalInterest && v17)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalInterest, "isEqual:")) {
      goto LABEL_57;
    }
  }
  else if (totalInterest != v17)
  {
    goto LABEL_57;
  }
  totalPrincipal = self->_totalPrincipal;
  v19 = (PKPayLaterFinancingAmount *)v4[13];
  if (totalPrincipal && v19)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalPrincipal, "isEqual:")) {
      goto LABEL_57;
    }
  }
  else if (totalPrincipal != v19)
  {
    goto LABEL_57;
  }
  dueNow = self->_dueNow;
  v21 = (PKPayLaterFinancingAmount *)v4[10];
  if (dueNow && v21)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](dueNow, "isEqual:")) {
      goto LABEL_57;
    }
  }
  else if (dueNow != v21)
  {
    goto LABEL_57;
  }
  totalFees = self->_totalFees;
  v23 = (PKPayLaterFinancingAmount *)v4[9];
  if (totalFees && v23)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalFees, "isEqual:")) {
      goto LABEL_57;
    }
  }
  else if (totalFees != v23)
  {
    goto LABEL_57;
  }
  authAmount = self->_authAmount;
  v25 = (PKCurrencyAmount *)v4[7];
  if (!authAmount || !v25)
  {
    if (authAmount == v25) {
      goto LABEL_55;
    }
LABEL_57:
    BOOL v26 = 0;
    goto LABEL_58;
  }
  if (!-[PKCurrencyAmount isEqual:](authAmount, "isEqual:")) {
    goto LABEL_57;
  }
LABEL_55:
  if (self->_installmentCount != v4[5]) {
    goto LABEL_57;
  }
  BOOL v26 = self->_hasAPR == *((unsigned __int8 *)v4 + 8);
LABEL_58:

  return v26;
}

- (id)analyticsValueForAPR
{
  return 0;
}

- (id)analyticsValueForInstallmentCount
{
  return 0;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_selectionIdentifier];
  [v3 safelyAddObject:self->_apr];
  [v3 safelyAddObject:self->_totalAmount];
  [v3 safelyAddObject:self->_authAmount];
  [v3 safelyAddObject:self->_totalFees];
  [v3 safelyAddObject:self->_dueNow];
  [v3 safelyAddObject:self->_installmentAmount];
  [v3 safelyAddObject:self->_installmentFees];
  [v3 safelyAddObject:self->_totalInterest];
  [v3 safelyAddObject:self->_totalPrincipal];
  [v3 safelyAddObject:self->_installments];
  [v3 safelyAddObject:self->_termsDetails];
  [v3 safelyAddObject:self->_supportedRepaymentNetworks];
  [v3 safelyAddObject:self->_supportedRepaymentCountries];
  [v3 safelyAddObject:self->_supportedRepaymentFundingSourceIdentifiers];
  [v3 safelyAddObject:self->_financingOptionData];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_productType - v4 + 32 * v4;
  int64_t v6 = self->_installmentCount - v5 + 32 * v5;
  unint64_t v7 = self->_autoPayment - v6 + 32 * v6;
  uint64_t v8 = self->_hasAPR - v7 + 32 * v7;
  unint64_t v9 = self->_merchantCapabilities - v8 + 32 * v8;
  unint64_t v10 = self->_supportedRepaymentTypes - v9 + 32 * v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPayLaterFinancingOption *)a3;
  unint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFinancingOption *)self isEqualToFinancingOption:v5];

  return v6;
}

- (BOOL)isEqualToFinancingOption:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = v4;
  if (!v4
    || self->_productType != v4[2]
    || self->_installmentCount != v4[5]
    || self->_autoPayment != v4[6]
    || self->_hasAPR != *((unsigned __int8 *)v4 + 8)
    || self->_supportedRepaymentTypes != v4[20]
    || self->_merchantCapabilities != v4[19])
  {
    goto LABEL_20;
  }
  BOOL v6 = (void *)v4[3];
  unint64_t v7 = self->_identifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    unint64_t v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_19;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_20;
    }
  }
  uint64_t v11 = (void *)v5[4];
  unint64_t v7 = self->_selectionIdentifier;
  v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_23;
  }
  unint64_t v9 = v12;
  if (!v7 || !v12)
  {
LABEL_19:

    goto LABEL_20;
  }
  BOOL v13 = [(NSString *)v7 isEqualToString:v12];

  if (!v13) {
    goto LABEL_20;
  }
LABEL_23:
  apr = self->_apr;
  v17 = (NSDecimalNumber *)v5[15];
  if (apr && v17)
  {
    if ((-[NSDecimalNumber isEqual:](apr, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (apr != v17)
  {
    goto LABEL_20;
  }
  totalAmount = self->_totalAmount;
  v19 = (PKPayLaterFinancingAmount *)v5[8];
  if (totalAmount && v19)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalAmount, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (totalAmount != v19)
  {
    goto LABEL_20;
  }
  authAmount = self->_authAmount;
  v21 = (PKCurrencyAmount *)v5[7];
  if (authAmount && v21)
  {
    if (!-[PKCurrencyAmount isEqual:](authAmount, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (authAmount != v21)
  {
    goto LABEL_20;
  }
  totalFees = self->_totalFees;
  v23 = (PKPayLaterFinancingAmount *)v5[9];
  if (totalFees && v23)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalFees, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (totalFees != v23)
  {
    goto LABEL_20;
  }
  dueNow = self->_dueNow;
  v25 = (PKPayLaterFinancingAmount *)v5[10];
  if (dueNow && v25)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](dueNow, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (dueNow != v25)
  {
    goto LABEL_20;
  }
  installmentAmount = self->_installmentAmount;
  v27 = (PKPayLaterFinancingAmount *)v5[11];
  if (installmentAmount && v27)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentAmount, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (installmentAmount != v27)
  {
    goto LABEL_20;
  }
  installmentFees = self->_installmentFees;
  v29 = (PKPayLaterFinancingAmount *)v5[12];
  if (installmentFees && v29)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](installmentFees, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (installmentFees != v29)
  {
    goto LABEL_20;
  }
  totalPrincipal = self->_totalPrincipal;
  v31 = (PKPayLaterFinancingAmount *)v5[13];
  if (totalPrincipal && v31)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalPrincipal, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (totalPrincipal != v31)
  {
    goto LABEL_20;
  }
  totalInterest = self->_totalInterest;
  v33 = (PKPayLaterFinancingAmount *)v5[14];
  if (totalInterest && v33)
  {
    if (!-[PKPayLaterFinancingAmount isEqual:](totalInterest, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (totalInterest != v33)
  {
    goto LABEL_20;
  }
  installments = self->_installments;
  v35 = (NSArray *)v5[16];
  if (installments && v35)
  {
    if ((-[NSArray isEqual:](installments, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (installments != v35)
  {
    goto LABEL_20;
  }
  termsDetails = self->_termsDetails;
  v37 = (PKPayLaterFinancingOptionTermsDetails *)v5[17];
  if (termsDetails && v37)
  {
    if (!-[PKPayLaterFinancingOptionTermsDetails isEqual:](termsDetails, "isEqual:")) {
      goto LABEL_20;
    }
  }
  else if (termsDetails != v37)
  {
    goto LABEL_20;
  }
  supportedRepaymentNetworks = self->_supportedRepaymentNetworks;
  v39 = (NSArray *)v5[18];
  if (supportedRepaymentNetworks && v39)
  {
    if ((-[NSArray isEqual:](supportedRepaymentNetworks, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (supportedRepaymentNetworks != v39)
  {
    goto LABEL_20;
  }
  supportedRepaymentCountries = self->_supportedRepaymentCountries;
  v41 = (NSSet *)v5[21];
  if (supportedRepaymentCountries && v41)
  {
    if ((-[NSSet isEqual:](supportedRepaymentCountries, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (supportedRepaymentCountries != v41)
  {
    goto LABEL_20;
  }
  supportedRepaymentFundingSourceIdentifiers = self->_supportedRepaymentFundingSourceIdentifiers;
  v43 = (NSSet *)v5[22];
  if (supportedRepaymentFundingSourceIdentifiers && v43)
  {
    if (-[NSSet isEqual:](supportedRepaymentFundingSourceIdentifiers, "isEqual:")) {
      goto LABEL_93;
    }
LABEL_20:
    char v14 = 0;
    goto LABEL_21;
  }
  if (supportedRepaymentFundingSourceIdentifiers != v43) {
    goto LABEL_20;
  }
LABEL_93:
  financingOptionData = self->_financingOptionData;
  v45 = (NSDictionary *)v5[23];
  if (financingOptionData && v45) {
    char v14 = -[NSDictionary isEqual:](financingOptionData, "isEqual:");
  }
  else {
    char v14 = financingOptionData == v45;
  }
LABEL_21:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)PKPayLaterFinancingOption;
  unint64_t v5 = [(PKPayLaterFinancingOption *)&v58 init];
  if (v5)
  {
    v5->_productType = [v4 decodeIntegerForKey:@"productType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectionIdentifier"];
    selectionIdentifier = v5->_selectionIdentifier;
    v5->_selectionIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apr"];
    apr = v5->_apr;
    v5->_apr = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalAmount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKPayLaterFinancingAmount *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authAmount"];
    authAmount = v5->_authAmount;
    v5->_authAmount = (PKCurrencyAmount *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalFees"];
    totalFees = v5->_totalFees;
    v5->_totalFees = (PKPayLaterFinancingAmount *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueNow"];
    dueNow = v5->_dueNow;
    v5->_dueNow = (PKPayLaterFinancingAmount *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentAmount"];
    installmentAmount = v5->_installmentAmount;
    v5->_installmentAmount = (PKPayLaterFinancingAmount *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentFees"];
    installmentFees = v5->_installmentFees;
    v5->_installmentFees = (PKPayLaterFinancingAmount *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalInterest"];
    totalInterest = v5->_totalInterest;
    v5->_totalInterest = (PKPayLaterFinancingAmount *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalPrincipal"];
    totalPrincipal = v5->_totalPrincipal;
    v5->_totalPrincipal = (PKPayLaterFinancingAmount *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"installments"];
    installments = v5->_installments;
    v5->_installments = (NSArray *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsDetails"];
    termsDetails = v5->_termsDetails;
    v5->_termsDetails = (PKPayLaterFinancingOptionTermsDetails *)v33;

    v35 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"supportedRepaymentNetworks"];
    supportedRepaymentNetworks = v5->_supportedRepaymentNetworks;
    v5->_supportedRepaymentNetworks = (NSArray *)v38;

    v40 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v41 = objc_opt_class();
    uint64_t v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    uint64_t v43 = [v4 decodeObjectOfClasses:v42 forKey:@"supportedRepaymentCountries"];
    supportedRepaymentCountries = v5->_supportedRepaymentCountries;
    v5->_supportedRepaymentCountries = (NSSet *)v43;

    v45 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"supportedRepaymentFundingSourceIdentifiers"];
    supportedRepaymentFundingSourceIdentifiers = v5->_supportedRepaymentFundingSourceIdentifiers;
    v5->_supportedRepaymentFundingSourceIdentifiers = (NSSet *)v48;

    uint64_t v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    uint64_t v52 = objc_opt_class();
    uint64_t v53 = objc_opt_class();
    id v54 = objc_msgSend(v50, "setWithObjects:", v51, v52, v53, objc_opt_class(), 0);
    uint64_t v55 = [v4 decodeObjectOfClasses:v54 forKey:@"financingOptionData"];
    financingOptionData = v5->_financingOptionData;
    v5->_financingOptionData = (NSDictionary *)v55;

    v5->_installmentCount = [v4 decodeIntegerForKey:@"installmentCount"];
    v5->_autoPayment = [v4 decodeIntegerForKey:@"autoPayment"];
    v5->_hasAPR = [v4 decodeBoolForKey:@"hasAPR"];
    v5->_supportedRepaymentTypes = [v4 decodeIntegerForKey:@"supportedRepaymentTypes"];
    v5->_merchantCapabilities = [v4 decodeIntegerForKey:@"merchantCapabilities"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_selectionIdentifier forKey:@"selectionIdentifier"];
  [v5 encodeObject:self->_apr forKey:@"apr"];
  [v5 encodeObject:self->_totalAmount forKey:@"totalAmount"];
  [v5 encodeObject:self->_authAmount forKey:@"authAmount"];
  [v5 encodeObject:self->_totalFees forKey:@"totalFees"];
  [v5 encodeObject:self->_dueNow forKey:@"dueNow"];
  [v5 encodeObject:self->_installmentAmount forKey:@"installmentAmount"];
  [v5 encodeObject:self->_installmentFees forKey:@"installmentFees"];
  [v5 encodeObject:self->_totalInterest forKey:@"totalInterest"];
  [v5 encodeObject:self->_totalPrincipal forKey:@"totalPrincipal"];
  [v5 encodeObject:self->_installments forKey:@"installments"];
  [v5 encodeObject:self->_termsDetails forKey:@"termsDetails"];
  [v5 encodeObject:self->_supportedRepaymentNetworks forKey:@"supportedRepaymentNetworks"];
  [v5 encodeObject:self->_supportedRepaymentCountries forKey:@"supportedRepaymentCountries"];
  [v5 encodeObject:self->_supportedRepaymentFundingSourceIdentifiers forKey:@"supportedRepaymentFundingSourceIdentifiers"];
  [v5 encodeObject:self->_financingOptionData forKey:@"financingOptionData"];
  [v5 encodeInteger:self->_installmentCount forKey:@"installmentCount"];
  [v5 encodeInteger:self->_autoPayment forKey:@"autoPayment"];
  [v5 encodeInteger:self->_productType forKey:@"productType"];
  [v5 encodeBool:self->_hasAPR forKey:@"hasAPR"];
  [v5 encodeInteger:self->_merchantCapabilities forKey:@"merchantCapabilities"];
  [v5 encodeInteger:self->_supportedRepaymentTypes forKey:@"supportedRepaymentTypes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_selectionIdentifier copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_apr copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v10;

  id v12 = [(PKPayLaterFinancingAmount *)self->_totalAmount copyWithZone:a3];
  BOOL v13 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v12;

  id v14 = [(PKCurrencyAmount *)self->_authAmount copyWithZone:a3];
  v15 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v14;

  id v16 = [(PKPayLaterFinancingAmount *)self->_totalFees copyWithZone:a3];
  v17 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v16;

  id v18 = [(PKPayLaterFinancingAmount *)self->_dueNow copyWithZone:a3];
  v19 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v18;

  id v20 = [(PKPayLaterFinancingAmount *)self->_installmentAmount copyWithZone:a3];
  v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  id v22 = [(PKPayLaterFinancingAmount *)self->_installmentFees copyWithZone:a3];
  v23 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v22;

  id v24 = [(PKPayLaterFinancingAmount *)self->_totalInterest copyWithZone:a3];
  v25 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v24;

  id v26 = [(PKPayLaterFinancingAmount *)self->_totalPrincipal copyWithZone:a3];
  v27 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v26;

  uint64_t v28 = [(NSArray *)self->_installments copyWithZone:a3];
  uint64_t v29 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v28;

  id v30 = [(PKPayLaterFinancingOptionTermsDetails *)self->_termsDetails copyWithZone:a3];
  uint64_t v31 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v30;

  uint64_t v32 = [(NSArray *)self->_supportedRepaymentNetworks copyWithZone:a3];
  uint64_t v33 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v32;

  uint64_t v34 = [(NSSet *)self->_supportedRepaymentCountries copyWithZone:a3];
  v35 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v34;

  uint64_t v36 = [(NSSet *)self->_supportedRepaymentFundingSourceIdentifiers copyWithZone:a3];
  v37 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v36;

  uint64_t v38 = [(NSDictionary *)self->_financingOptionData copyWithZone:a3];
  v39 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v38;

  *(void *)(v5 + 40) = self->_installmentCount;
  *(void *)(v5 + 48) = self->_autoPayment;
  *(unsigned char *)(v5 + 8) = self->_hasAPR;
  *(void *)(v5 + 160) = self->_supportedRepaymentTypes;
  *(void *)(v5 + 152) = self->_merchantCapabilities;
  *(void *)(v5 + 16) = self->_productType;
  return (id)v5;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"selectionIdentifier: '%@'; ", self->_selectionIdentifier];
  id v4 = PKPayLaterAccountProductTypeToString(self->_productType);
  [v3 appendFormat:@"productType: '%@'; ", v4];

  [v3 appendFormat:@"totalAmount: %@; ", self->_totalAmount];
  [v3 appendFormat:@"authAmount: %@; ", self->_authAmount];
  [v3 appendFormat:@"totalFees: %@; ", self->_totalFees];
  [v3 appendFormat:@"dueNow: %@; ", self->_dueNow];
  [v3 appendFormat:@"installmentAmount: %@; ", self->_installmentAmount];
  [v3 appendFormat:@"installmentFees: %@; ", self->_installmentFees];
  [v3 appendFormat:@"totalInterest: %@; ", self->_totalInterest];
  [v3 appendFormat:@"totalPrincipal: %@; ", self->_totalPrincipal];
  objc_msgSend(v3, "appendFormat:", @"installmentCount: %ld; ", self->_installmentCount);
  if (self->_autoPayment == 1) {
    uint64_t v5 = @"required";
  }
  else {
    uint64_t v5 = @"available";
  }
  [v3 appendFormat:@"autoPayment: %@; ", v5];
  [v3 appendFormat:@"apr: %@; ", self->_apr];
  if (self->_hasAPR) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  [v3 appendFormat:@"hasAPR: %@; ", v6];
  [v3 appendFormat:@"supportedRepaymentNetworks: %@; ", self->_supportedRepaymentNetworks];
  [v3 appendFormat:@"supportedRepaymentCountries: %@; ", self->_supportedRepaymentCountries];
  objc_msgSend(v3, "appendFormat:", @"supportedRepaymentFundingSourceIdentifiers: %@; ",
    self->_supportedRepaymentFundingSourceIdentifiers);
  unint64_t v7 = PKMerchantCapabilityToStrings(self->_merchantCapabilities);
  [v3 appendFormat:@"merchantCapabilities: %@; ", v7];

  uint64_t v8 = PKPayLaterFundingSourcePaymentTypeToStrings(self->_supportedRepaymentTypes);
  [v3 appendFormat:@"supportedRepaymentTypes: %@; ", v8];

  [v3 appendFormat:@"termsDetails: %@; ", self->_termsDetails];
  [v3 appendFormat:@"installments: %@; ", self->_installments];
  [v3 appendFormat:@"financingOptionData: %@; ", self->_financingOptionData];
  [v3 appendFormat:@">"];
  unint64_t v9 = (void *)[v3 copy];

  return v9;
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)selectionIdentifier
{
  return self->_selectionIdentifier;
}

- (void)setSelectionIdentifier:(id)a3
{
}

- (int64_t)installmentCount
{
  return self->_installmentCount;
}

- (void)setInstallmentCount:(int64_t)a3
{
  self->_installmentCount = a3;
}

- (unint64_t)autoPayment
{
  return self->_autoPayment;
}

- (void)setAutoPayment:(unint64_t)a3
{
  self->_autoPayment = a3;
}

- (PKCurrencyAmount)authAmount
{
  return self->_authAmount;
}

- (void)setAuthAmount:(id)a3
{
}

- (PKPayLaterFinancingAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
}

- (PKPayLaterFinancingAmount)totalFees
{
  return self->_totalFees;
}

- (void)setTotalFees:(id)a3
{
}

- (PKPayLaterFinancingAmount)dueNow
{
  return self->_dueNow;
}

- (void)setDueNow:(id)a3
{
}

- (PKPayLaterFinancingAmount)installmentAmount
{
  return self->_installmentAmount;
}

- (void)setInstallmentAmount:(id)a3
{
}

- (PKPayLaterFinancingAmount)installmentFees
{
  return self->_installmentFees;
}

- (void)setInstallmentFees:(id)a3
{
}

- (PKPayLaterFinancingAmount)totalPrincipal
{
  return self->_totalPrincipal;
}

- (void)setTotalPrincipal:(id)a3
{
}

- (PKPayLaterFinancingAmount)totalInterest
{
  return self->_totalInterest;
}

- (void)setTotalInterest:(id)a3
{
}

- (BOOL)hasAPR
{
  return self->_hasAPR;
}

- (void)setHasAPR:(BOOL)a3
{
  self->_hasAPR = a3;
}

- (NSDecimalNumber)apr
{
  return self->_apr;
}

- (void)setApr:(id)a3
{
}

- (NSArray)installments
{
  return self->_installments;
}

- (void)setInstallments:(id)a3
{
}

- (PKPayLaterFinancingOptionTermsDetails)termsDetails
{
  return self->_termsDetails;
}

- (void)setTermsDetails:(id)a3
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

- (NSSet)supportedRepaymentFundingSourceIdentifiers
{
  return self->_supportedRepaymentFundingSourceIdentifiers;
}

- (void)setSupportedRepaymentFundingSourceIdentifiers:(id)a3
{
}

- (NSDictionary)financingOptionData
{
  return self->_financingOptionData;
}

- (void)setFinancingOptionData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_financingOptionData, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentFundingSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentCountries, 0);
  objc_storeStrong((id *)&self->_supportedRepaymentNetworks, 0);
  objc_storeStrong((id *)&self->_termsDetails, 0);
  objc_storeStrong((id *)&self->_installments, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_totalInterest, 0);
  objc_storeStrong((id *)&self->_totalPrincipal, 0);
  objc_storeStrong((id *)&self->_installmentFees, 0);
  objc_storeStrong((id *)&self->_installmentAmount, 0);
  objc_storeStrong((id *)&self->_dueNow, 0);
  objc_storeStrong((id *)&self->_totalFees, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_authAmount, 0);
  objc_storeStrong((id *)&self->_selectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end