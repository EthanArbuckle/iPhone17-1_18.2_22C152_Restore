@interface PKPaymentTransactionDetailAmountLineItemReceipt
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)secondaryLabel;
- (NSString)tertiaryLabel;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineItemReceipt)initWithReceiptLineItem:(id)a3;
- (UIImage)image;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineItemReceipt

- (PKPaymentTransactionDetailAmountLineItemReceipt)initWithReceiptLineItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionDetailAmountLineItemReceipt;
  v6 = [(PKPaymentTransactionDetailAmountLineItemReceipt *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lineItem, a3);
  }

  return v7;
}

- (NSString)label
{
  return (NSString *)[(PKTransactionReceiptLineItem *)self->_lineItem title];
}

- (NSString)value
{
  v2 = [(PKTransactionReceiptLineItem *)self->_lineItem currencyAmount];
  v3 = [v2 formattedStringValue];

  return (NSString *)v3;
}

- (UIImage)image
{
  v2 = [(PKTransactionReceiptLineItem *)self->_lineItem image];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1818] imageWithPKImage:v2];
  }
  else
  {
    v3 = 0;
  }

  return (UIImage *)v3;
}

- (NSString)secondaryLabel
{
  return (NSString *)[(PKTransactionReceiptLineItem *)self->_lineItem subtitle];
}

- (NSString)tertiaryLabel
{
  return (NSString *)[(PKTransactionReceiptLineItem *)self->_lineItem secondarySubtitle];
}

- (BOOL)isEmphasized
{
  return 0;
}

- (unint64_t)lineItemType
{
  return 10;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (void).cxx_destruct
{
}

@end