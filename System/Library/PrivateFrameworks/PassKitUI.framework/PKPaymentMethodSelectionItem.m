@interface PKPaymentMethodSelectionItem
- (BOOL)isSelected;
- (NSCopying)identifier;
- (NSString)paymentMethodName;
- (PKCurrencyAmount)balance;
- (PKPaymentMethodSelectionItem)initWithIdentifier:(id)a3;
- (PKPaymentPass)paymentPass;
- (void)setBalance:(id)a3;
- (void)setPaymentMethodName:(id)a3;
- (void)setPaymentPass:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PKPaymentMethodSelectionItem

- (PKPaymentMethodSelectionItem)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentMethodSelectionItem;
  v6 = [(PKPaymentMethodSelectionItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_identifier;
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
}

- (NSString)paymentMethodName
{
  return self->_paymentMethodName;
}

- (void)setPaymentMethodName:(id)a3
{
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_paymentMethodName, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end