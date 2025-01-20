@interface PKDashboardSpendingSummaryItem
+ (id)identifier;
- (BOOL)isEqual:(id)a3;
- (PKSpendingSummary)spendingSummary;
- (unint64_t)hash;
- (void)setSpendingSummary:(id)a3;
@end

@implementation PKDashboardSpendingSummaryItem

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = PKEqualObjects();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_spendingSummary];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

+ (id)identifier
{
  return @"spendingSummary";
}

- (PKSpendingSummary)spendingSummary
{
  return self->_spendingSummary;
}

- (void)setSpendingSummary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end