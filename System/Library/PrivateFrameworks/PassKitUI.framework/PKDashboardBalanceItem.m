@interface PKDashboardBalanceItem
+ (id)identifier;
- (BOOL)topUpEnabled;
- (NSString)availableCredit;
- (NSString)balance;
- (NSString)title;
- (NSString)topUpTitle;
- (UIColor)titleColor;
- (id)topUpAction;
- (void)setAvailableCredit:(id)a3;
- (void)setBalance:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleColor:(id)a3;
- (void)setTopUpAction:(id)a3;
- (void)setTopUpEnabled:(BOOL)a3;
- (void)setTopUpTitle:(id)a3;
@end

@implementation PKDashboardBalanceItem

+ (id)identifier
{
  return @"balanceItem";
}

- (NSString)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (NSString)availableCredit
{
  return self->_availableCredit;
}

- (void)setAvailableCredit:(id)a3
{
}

- (NSString)topUpTitle
{
  return self->_topUpTitle;
}

- (void)setTopUpTitle:(id)a3
{
}

- (id)topUpAction
{
  return self->_topUpAction;
}

- (void)setTopUpAction:(id)a3
{
}

- (BOOL)topUpEnabled
{
  return self->_topUpEnabled;
}

- (void)setTopUpEnabled:(BOOL)a3
{
  self->_topUpEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_topUpAction, 0);
  objc_storeStrong((id *)&self->_topUpTitle, 0);
  objc_storeStrong((id *)&self->_availableCredit, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_balance, 0);
}

@end