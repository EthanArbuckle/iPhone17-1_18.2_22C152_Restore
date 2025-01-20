@interface PKCreditAccountMergeSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCreditAccountMergeSummary:(id)a3;
- (NSDate)mergeDate;
- (NSDecimalNumber)totalBalance;
- (NSSet)accountDetails;
- (PKCreditAccountMergeSummary)initWithCoder:(id)a3;
- (PKCreditAccountMergeSummary)initWithDictionary:(id)a3;
- (id)accountDetailsForAccountIdentifier:(id)a3;
- (id)accountDetailsForAltDSID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountDetails:(id)a3;
- (void)setMergeDate:(id)a3;
- (void)setTotalBalance:(id)a3;
@end

@implementation PKCreditAccountMergeSummary

- (PKCreditAccountMergeSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKCreditAccountMergeSummary;
  v5 = [(PKCreditAccountMergeSummary *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"mergeDate"];
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v6;

    uint64_t v8 = [v4 PKDecimalNumberFromStringForKey:@"totalBalance"];
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v8;

    v10 = [v4 PKSetContaining:objc_opt_class() forKey:@"accountDetails"];
    uint64_t v11 = objc_msgSend(v10, "pk_setByApplyingBlock:", &__block_literal_global_59);
    accountDetails = v5->_accountDetails;
    v5->_accountDetails = (NSSet *)v11;
  }
  return v5;
}

PKCreditAccountMergeSummaryAccountDetails *__50__PKCreditAccountMergeSummary_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKCreditAccountMergeSummaryAccountDetails alloc] initWithDictionary:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCreditAccountMergeSummary *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditAccountMergeSummary *)self isEqualToCreditAccountMergeSummary:v5];

  return v6;
}

- (BOOL)isEqualToCreditAccountMergeSummary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_17;
  }
  mergeDate = self->_mergeDate;
  BOOL v6 = (NSDate *)v4[1];
  if (mergeDate) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (mergeDate != v6) {
      goto LABEL_17;
    }
  }
  else if ((-[NSDate isEqual:](mergeDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  totalBalance = self->_totalBalance;
  v9 = (NSDecimalNumber *)v4[2];
  if (!totalBalance || !v9)
  {
    if (totalBalance == v9) {
      goto LABEL_13;
    }
LABEL_17:
    char v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSDecimalNumber isEqual:](totalBalance, "isEqual:") & 1) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  accountDetails = self->_accountDetails;
  uint64_t v11 = (NSSet *)v4[3];
  if (accountDetails && v11) {
    char v12 = -[NSSet isEqual:](accountDetails, "isEqual:");
  }
  else {
    char v12 = accountDetails == v11;
  }
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_mergeDate];
  [v3 safelyAddObject:self->_totalBalance];
  [v3 safelyAddObject:self->_accountDetails];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"mergeDate: '%@'; ", self->_mergeDate];
  unint64_t v4 = [(NSDecimalNumber *)self->_totalBalance stringValue];
  [v3 appendFormat:@"totalBalance: '%@'; ", v4];

  [v3 appendFormat:@"accountDetails: '%@'; ", self->_accountDetails];
  [v3 appendFormat:@">"];
  v5 = (void *)[v3 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountMergeSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCreditAccountMergeSummary;
  v5 = [(PKCreditAccountMergeSummary *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mergeDate"];
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalBalance"];
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v8;

    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    char v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"accountDetails"];
    accountDetails = v5->_accountDetails;
    v5->_accountDetails = (NSSet *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  mergeDate = self->_mergeDate;
  id v5 = a3;
  [v5 encodeObject:mergeDate forKey:@"mergeDate"];
  [v5 encodeObject:self->_totalBalance forKey:@"totalBalance"];
  [v5 encodeObject:self->_accountDetails forKey:@"accountDetails"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDate *)self->_mergeDate copyWithZone:a3];
  BOOL v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_totalBalance copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSSet *)self->_accountDetails copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)accountDetailsForAccountIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accountDetails = self->_accountDetails;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PKCreditAccountMergeSummary_accountDetailsForAccountIdentifier___block_invoke;
    v9[3] = &unk_1E56E2768;
    id v10 = v4;
    BOOL v7 = [(NSSet *)accountDetails pk_anyObjectPassingTest:v9];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __66__PKCreditAccountMergeSummary_accountDetailsForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accountIdentifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  BOOL v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)accountDetailsForAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accountDetails = self->_accountDetails;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PKCreditAccountMergeSummary_accountDetailsForAltDSID___block_invoke;
    v9[3] = &unk_1E56E2768;
    id v10 = v4;
    BOOL v7 = [(NSSet *)accountDetails pk_anyObjectPassingTest:v9];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __56__PKCreditAccountMergeSummary_accountDetailsForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 ownerAltDSID];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  BOOL v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (NSDate)mergeDate
{
  return self->_mergeDate;
}

- (void)setMergeDate:(id)a3
{
}

- (NSDecimalNumber)totalBalance
{
  return self->_totalBalance;
}

- (void)setTotalBalance:(id)a3
{
}

- (NSSet)accountDetails
{
  return self->_accountDetails;
}

- (void)setAccountDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDetails, 0);
  objc_storeStrong((id *)&self->_totalBalance, 0);
  objc_storeStrong((id *)&self->_mergeDate, 0);
}

@end