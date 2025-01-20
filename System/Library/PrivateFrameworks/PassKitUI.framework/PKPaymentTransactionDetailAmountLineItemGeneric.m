@interface PKPaymentTransactionDetailAmountLineItemGeneric
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemGeneric)initWithLabel:(id)a3 value:(id)a4;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
- (void)setIsEmphasized:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemGeneric

- (PKPaymentTransactionDetailAmountLineItemGeneric)initWithLabel:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionDetailAmountLineItemGeneric;
  v8 = [(PKPaymentTransactionDetailAmountLineItemGeneric *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    label = v8->_label;
    v8->_label = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v11;
  }
  return v8;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)lineItemType
{
  return 9;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (void)setIsEmphasized:(BOOL)a3
{
  self->_isEmphasized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end