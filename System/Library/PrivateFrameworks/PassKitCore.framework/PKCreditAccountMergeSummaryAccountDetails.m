@interface PKCreditAccountMergeSummaryAccountDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCreditAccountMergeSummaryAccountDetails:(id)a3;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)statementBalance;
- (NSString)accountIdentifier;
- (NSString)ownerAltDSID;
- (PKCreditAccountMergeSummaryAccountDetails)initWithCoder:(id)a3;
- (PKCreditAccountMergeSummaryAccountDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setOwnerAltDSID:(id)a3;
- (void)setStatementBalance:(id)a3;
@end

@implementation PKCreditAccountMergeSummaryAccountDetails

- (PKCreditAccountMergeSummaryAccountDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCreditAccountMergeSummaryAccountDetails;
  v5 = [(PKCreditAccountMergeSummaryAccountDetails *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"ownerAltDSID"];
    ownerAltDSID = v5->_ownerAltDSID;
    v5->_ownerAltDSID = (NSString *)v8;

    uint64_t v10 = [v4 PKDecimalNumberFromStringForKey:@"statementBalance"];
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 PKDecimalNumberFromStringForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCreditAccountMergeSummaryAccountDetails *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCreditAccountMergeSummaryAccountDetails *)self isEqualToCreditAccountMergeSummaryAccountDetails:v5];

  return v6;
}

- (BOOL)isEqualToCreditAccountMergeSummaryAccountDetails:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_accountIdentifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_13;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_14;
    }
  }
  v11 = (void *)v5[2];
  v7 = self->_ownerAltDSID;
  uint64_t v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_17;
  }
  v9 = v12;
  if (!v7 || !v12)
  {
LABEL_13:

    goto LABEL_14;
  }
  BOOL v13 = [(NSString *)v7 isEqualToString:v12];

  if (!v13) {
    goto LABEL_14;
  }
LABEL_17:
  statementBalance = self->_statementBalance;
  v17 = (NSDecimalNumber *)v5[3];
  if (statementBalance && v17)
  {
    if (-[NSDecimalNumber isEqual:](statementBalance, "isEqual:")) {
      goto LABEL_22;
    }
LABEL_14:
    char v14 = 0;
    goto LABEL_15;
  }
  if (statementBalance != v17) {
    goto LABEL_14;
  }
LABEL_22:
  currentBalance = self->_currentBalance;
  v19 = (NSDecimalNumber *)v5[4];
  if (currentBalance && v19) {
    char v14 = -[NSDecimalNumber isEqual:](currentBalance, "isEqual:");
  }
  else {
    char v14 = currentBalance == v19;
  }
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_ownerAltDSID];
  [v3 safelyAddObject:self->_statementBalance];
  [v3 safelyAddObject:self->_currentBalance];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@: %p; ",
                 objc_opt_class(),
                 self);
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@"ownerAltDSID: '%@'; ", self->_ownerAltDSID];
  unint64_t v4 = [(NSDecimalNumber *)self->_statementBalance stringValue];
  [v3 appendFormat:@"statementBalance: '%@'; ", v4];

  v5 = [(NSDecimalNumber *)self->_currentBalance stringValue];
  [v3 appendFormat:@"currentBalance: '%@'; ", v5];

  [v3 appendFormat:@">"];
  BOOL v6 = (void *)[v3 copy];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountMergeSummaryAccountDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCreditAccountMergeSummaryAccountDetails;
  v5 = [(PKCreditAccountMergeSummaryAccountDetails *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerAltDSID"];
    ownerAltDSID = v5->_ownerAltDSID;
    v5->_ownerAltDSID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementBalance"];
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  accountIdentifier = self->_accountIdentifier;
  id v5 = a3;
  [v5 encodeObject:accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeObject:self->_ownerAltDSID forKey:@"ownerAltDSID"];
  [v5 encodeObject:self->_statementBalance forKey:@"statementBalance"];
  [v5 encodeObject:self->_currentBalance forKey:@"currentBalance"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_ownerAltDSID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_statementBalance copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_currentBalance copyWithZone:a3];
  BOOL v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)ownerAltDSID
{
  return self->_ownerAltDSID;
}

- (void)setOwnerAltDSID:(id)a3
{
}

- (NSDecimalNumber)statementBalance
{
  return self->_statementBalance;
}

- (void)setStatementBalance:(id)a3
{
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_statementBalance, 0);
  objc_storeStrong((id *)&self->_ownerAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end