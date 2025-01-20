@interface PKAccountUserPreferences
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountUserPreferences:(id)a3;
- (BOOL)monthlySpendLimitEnabled;
- (BOOL)showAvailableCredit;
- (BOOL)spendingEnabled;
- (BOOL)transactionSpendLimitEnabled;
- (NSDecimalNumber)monthlySpendLimitAmount;
- (NSDecimalNumber)transactionSpendLimitAmount;
- (PKAccountUserPreferences)initWithAccountUserPreferences:(id)a3;
- (PKAccountUserPreferences)initWithCoder:(id)a3;
- (PKAccountUserPreferences)initWithDictionary:(id)a3;
- (id)jsonRepresentationForAccountUserAccessLevel:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMonthlySpendLimitAmount:(id)a3;
- (void)setMonthlySpendLimitEnabled:(BOOL)a3;
- (void)setShowAvailableCredit:(BOOL)a3;
- (void)setSpendingEnabled:(BOOL)a3;
- (void)setTransactionSpendLimitAmount:(id)a3;
- (void)setTransactionSpendLimitEnabled:(BOOL)a3;
@end

@implementation PKAccountUserPreferences

- (PKAccountUserPreferences)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserPreferences;
  v5 = [(PKAccountUserPreferences *)&v11 init];
  if (v5)
  {
    v5->_spendingEnabled = [v4 PKBoolForKey:@"spendingEnabled"];
    v5->_showAvailableCredit = [v4 PKBoolForKey:@"showAvailableCredit"];
    v5->_transactionSpendLimitEnabled = [v4 PKBoolForKey:@"transactionLimitEnabled"];
    uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"transactionLimitAmount"];
    transactionSpendLimitAmount = v5->_transactionSpendLimitAmount;
    v5->_transactionSpendLimitAmount = (NSDecimalNumber *)v6;

    v5->_monthlySpendLimitEnabled = [v4 PKBoolForKey:@"monthlySpendLimitEnabled"];
    uint64_t v8 = [v4 PKDecimalNumberFromStringForKey:@"monthlySpendLimitAmount"];
    monthlySpendLimitAmount = v5->_monthlySpendLimitAmount;
    v5->_monthlySpendLimitAmount = (NSDecimalNumber *)v8;
  }
  return v5;
}

- (PKAccountUserPreferences)initWithAccountUserPreferences:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserPreferences;
  v5 = [(PKAccountUserPreferences *)&v11 init];
  if (v5)
  {
    v5->_spendingEnabled = [v4 spendingEnabled];
    v5->_showAvailableCredit = [v4 showAvailableCredit];
    v5->_transactionSpendLimitEnabled = [v4 transactionSpendLimitEnabled];
    uint64_t v6 = [v4 transactionSpendLimitAmount];
    transactionSpendLimitAmount = v5->_transactionSpendLimitAmount;
    v5->_transactionSpendLimitAmount = (NSDecimalNumber *)v6;

    v5->_monthlySpendLimitEnabled = [v4 monthlySpendLimitEnabled];
    uint64_t v8 = [v4 monthlySpendLimitAmount];
    monthlySpendLimitAmount = v5->_monthlySpendLimitAmount;
    v5->_monthlySpendLimitAmount = (NSDecimalNumber *)v8;
  }
  return v5;
}

- (id)jsonRepresentationForAccountUserAccessLevel:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3 == 2)
  {
    uint64_t v6 = [NSNumber numberWithBool:self->_spendingEnabled];
    [v5 setObject:v6 forKeyedSubscript:@"spendingEnabled"];

    v7 = [NSNumber numberWithBool:self->_showAvailableCredit];
    [v5 setObject:v7 forKeyedSubscript:@"showAvailableCredit"];

    uint64_t v8 = [NSNumber numberWithBool:self->_transactionSpendLimitEnabled];
    [v5 setObject:v8 forKeyedSubscript:@"transactionLimitEnabled"];

    v9 = [(NSDecimalNumber *)self->_transactionSpendLimitAmount stringValue];
    [v5 setObject:v9 forKeyedSubscript:@"transactionLimitAmount"];
  }
  v10 = [NSNumber numberWithBool:self->_monthlySpendLimitEnabled];
  [v5 setObject:v10 forKeyedSubscript:@"monthlySpendLimitEnabled"];

  objc_super v11 = [(NSDecimalNumber *)self->_monthlySpendLimitAmount stringValue];
  [v5 setObject:v11 forKeyedSubscript:@"monthlySpendLimitAmount"];

  v12 = (void *)[v5 copy];
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountUserPreferences *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountUserPreferences *)self isEqualToAccountUserPreferences:v5];

  return v6;
}

- (BOOL)isEqualToAccountUserPreferences:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  id v5 = v4;
  if (!v4
    || self->_spendingEnabled != v4[8]
    || self->_showAvailableCredit != v4[9]
    || self->_transactionSpendLimitEnabled != v4[10])
  {
    goto LABEL_14;
  }
  transactionSpendLimitAmount = self->_transactionSpendLimitAmount;
  v7 = (NSDecimalNumber *)*((void *)v5 + 2);
  if (transactionSpendLimitAmount && v7)
  {
    if ((-[NSDecimalNumber isEqual:](transactionSpendLimitAmount, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (transactionSpendLimitAmount != v7)
  {
LABEL_14:
    char v10 = 0;
    goto LABEL_15;
  }
  if (self->_monthlySpendLimitEnabled != v5[11]) {
    goto LABEL_14;
  }
  monthlySpendLimitAmount = self->_monthlySpendLimitAmount;
  v9 = (NSDecimalNumber *)*((void *)v5 + 3);
  if (monthlySpendLimitAmount && v9) {
    char v10 = -[NSDecimalNumber isEqual:](monthlySpendLimitAmount, "isEqual:");
  }
  else {
    char v10 = monthlySpendLimitAmount == v9;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_transactionSpendLimitAmount];
  [v3 safelyAddObject:self->_monthlySpendLimitAmount];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_spendingEnabled - v4 + 32 * v4;
  uint64_t v6 = self->_showAvailableCredit - v5 + 32 * v5;
  uint64_t v7 = self->_transactionSpendLimitEnabled - v6 + 32 * v6;
  unint64_t v8 = self->_monthlySpendLimitEnabled - v7 + 32 * v7;

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[PKMutableAccountUserPreferences allocWithZone:a3];
  return [(PKAccountUserPreferences *)v4 initWithAccountUserPreferences:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserPreferences;
  uint64_t v5 = [(PKAccountUserPreferences *)&v11 init];
  if (v5)
  {
    v5->_spendingEnabled = [v4 decodeBoolForKey:@"spendingEnabled"];
    v5->_showAvailableCredit = [v4 decodeBoolForKey:@"showAvailableCredit"];
    v5->_transactionSpendLimitEnabled = [v4 decodeBoolForKey:@"transactionLimitEnabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionLimitAmount"];
    transactionSpendLimitAmount = v5->_transactionSpendLimitAmount;
    v5->_transactionSpendLimitAmount = (NSDecimalNumber *)v6;

    v5->_monthlySpendLimitEnabled = [v4 decodeBoolForKey:@"monthlySpendLimitEnabled"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monthlySpendLimitAmount"];
    monthlySpendLimitAmount = v5->_monthlySpendLimitAmount;
    v5->_monthlySpendLimitAmount = (NSDecimalNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL spendingEnabled = self->_spendingEnabled;
  id v5 = a3;
  [v5 encodeBool:spendingEnabled forKey:@"spendingEnabled"];
  [v5 encodeBool:self->_showAvailableCredit forKey:@"showAvailableCredit"];
  [v5 encodeBool:self->_transactionSpendLimitEnabled forKey:@"transactionLimitEnabled"];
  [v5 encodeObject:self->_transactionSpendLimitAmount forKey:@"transactionLimitAmount"];
  [v5 encodeBool:self->_monthlySpendLimitEnabled forKey:@"monthlySpendLimitEnabled"];
  [v5 encodeObject:self->_monthlySpendLimitAmount forKey:@"monthlySpendLimitAmount"];
}

- (BOOL)spendingEnabled
{
  return self->_spendingEnabled;
}

- (void)setSpendingEnabled:(BOOL)a3
{
  self->_BOOL spendingEnabled = a3;
}

- (BOOL)showAvailableCredit
{
  return self->_showAvailableCredit;
}

- (void)setShowAvailableCredit:(BOOL)a3
{
  self->_showAvailableCredit = a3;
}

- (BOOL)transactionSpendLimitEnabled
{
  return self->_transactionSpendLimitEnabled;
}

- (void)setTransactionSpendLimitEnabled:(BOOL)a3
{
  self->_transactionSpendLimitEnabled = a3;
}

- (NSDecimalNumber)transactionSpendLimitAmount
{
  return self->_transactionSpendLimitAmount;
}

- (void)setTransactionSpendLimitAmount:(id)a3
{
}

- (BOOL)monthlySpendLimitEnabled
{
  return self->_monthlySpendLimitEnabled;
}

- (void)setMonthlySpendLimitEnabled:(BOOL)a3
{
  self->_monthlySpendLimitEnabled = a3;
}

- (NSDecimalNumber)monthlySpendLimitAmount
{
  return self->_monthlySpendLimitAmount;
}

- (void)setMonthlySpendLimitAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlySpendLimitAmount, 0);
  objc_storeStrong((id *)&self->_transactionSpendLimitAmount, 0);
}

@end