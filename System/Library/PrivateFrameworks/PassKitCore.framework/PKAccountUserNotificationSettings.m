@interface PKAccountUserNotificationSettings
+ (BOOL)supportsSecureCoding;
+ (id)defaultNotificationSettings;
- (BOOL)_isEqualToAccountUserNotificationSettings:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)transactionNotificationsEnabled;
- (NSDecimalNumber)monthlySpendNotificationThreshold;
- (NSDecimalNumber)transactionNotificationThreshold;
- (PKAccountUserNotificationSettings)initWithAccountUserNotificationSettings:(id)a3;
- (PKAccountUserNotificationSettings)initWithCoder:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMonthlySpendNotificationThreshold:(id)a3;
- (void)setTransactionNotificationThreshold:(id)a3;
- (void)setTransactionNotificationsEnabled:(BOOL)a3;
@end

@implementation PKAccountUserNotificationSettings

- (PKAccountUserNotificationSettings)initWithAccountUserNotificationSettings:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserNotificationSettings;
  v5 = [(PKAccountUserNotificationSettings *)&v11 init];
  if (v5)
  {
    v5->_transactionNotificationsEnabled = [v4 transactionNotificationsEnabled];
    uint64_t v6 = [v4 transactionNotificationThreshold];
    transactionNotificationThreshold = v5->_transactionNotificationThreshold;
    v5->_transactionNotificationThreshold = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 monthlySpendNotificationThreshold];
    monthlySpendNotificationThreshold = v5->_monthlySpendNotificationThreshold;
    v5->_monthlySpendNotificationThreshold = (NSDecimalNumber *)v8;
  }
  return v5;
}

+ (id)defaultNotificationSettings
{
  v2 = objc_alloc_init((Class)a1);
  v2[8] = 1;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAccountUserNotificationSettings *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountUserNotificationSettings *)self _isEqualToAccountUserNotificationSettings:v5];

  return v6;
}

- (BOOL)_isEqualToAccountUserNotificationSettings:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || self->_transactionNotificationsEnabled != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_10;
  }
  transactionNotificationThreshold = self->_transactionNotificationThreshold;
  v7 = (NSDecimalNumber *)v5[2];
  if (!transactionNotificationThreshold || !v7)
  {
    if (transactionNotificationThreshold == v7) {
      goto LABEL_6;
    }
LABEL_10:
    char v10 = 0;
    goto LABEL_11;
  }
  if ((-[NSDecimalNumber isEqual:](transactionNotificationThreshold, "isEqual:") & 1) == 0) {
    goto LABEL_10;
  }
LABEL_6:
  monthlySpendNotificationThreshold = self->_monthlySpendNotificationThreshold;
  v9 = (NSDecimalNumber *)v5[3];
  if (monthlySpendNotificationThreshold && v9) {
    char v10 = -[NSDecimalNumber isEqual:](monthlySpendNotificationThreshold, "isEqual:");
  }
  else {
    char v10 = monthlySpendNotificationThreshold == v9;
  }
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_transactionNotificationThreshold];
  [v3 safelyAddObject:self->_monthlySpendNotificationThreshold];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_transactionNotificationsEnabled - v4 + 32 * v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountUserNotificationSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountUserNotificationSettings;
  unint64_t v5 = [(PKAccountUserNotificationSettings *)&v11 init];
  if (v5)
  {
    v5->_transactionNotificationsEnabled = [v4 decodeBoolForKey:@"transactionNotificationsEnabled"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionNotificationThreshold"];
    transactionNotificationThreshold = v5->_transactionNotificationThreshold;
    v5->_transactionNotificationThreshold = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monthlySpendNotificationThreshold"];
    monthlySpendNotificationThreshold = v5->_monthlySpendNotificationThreshold;
    v5->_monthlySpendNotificationThreshold = (NSDecimalNumber *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL transactionNotificationsEnabled = self->_transactionNotificationsEnabled;
  id v5 = a3;
  [v5 encodeBool:transactionNotificationsEnabled forKey:@"transactionNotificationsEnabled"];
  [v5 encodeObject:self->_transactionNotificationThreshold forKey:@"transactionNotificationThreshold"];
  [v5 encodeObject:self->_monthlySpendNotificationThreshold forKey:@"monthlySpendNotificationThreshold"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PKMutableAccountUserNotificationSettings allocWithZone:a3];
  return [(PKAccountUserNotificationSettings *)v4 initWithAccountUserNotificationSettings:self];
}

- (BOOL)transactionNotificationsEnabled
{
  return self->_transactionNotificationsEnabled;
}

- (void)setTransactionNotificationsEnabled:(BOOL)a3
{
  self->_BOOL transactionNotificationsEnabled = a3;
}

- (NSDecimalNumber)transactionNotificationThreshold
{
  return self->_transactionNotificationThreshold;
}

- (void)setTransactionNotificationThreshold:(id)a3
{
}

- (NSDecimalNumber)monthlySpendNotificationThreshold
{
  return self->_monthlySpendNotificationThreshold;
}

- (void)setMonthlySpendNotificationThreshold:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monthlySpendNotificationThreshold, 0);
  objc_storeStrong((id *)&self->_transactionNotificationThreshold, 0);
}

@end