@interface PKPaymentTransactionDetailAmountLineCompletionDate
- (BOOL)completed;
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSDate)date;
- (NSString)label;
- (NSString)value;
- (PKPaymentTransactionDetailAmountLineCompletionDate)initWithDate:(id)a3 completed:(BOOL)a4;
- (id)image;
- (id)secondaryLabel;
- (id)tertiaryLabel;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKPaymentTransactionDetailAmountLineCompletionDate

- (PKPaymentTransactionDetailAmountLineCompletionDate)initWithDate:(id)a3 completed:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentTransactionDetailAmountLineCompletionDate;
  v8 = [(PKPaymentTransactionDetailAmountLineCompletionDate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_completed = a4;
    objc_storeStrong((id *)&v8->_date, a3);
  }

  return v9;
}

- (NSString)label
{
  v2 = PKLocalizedFeatureString();

  return (NSString *)v2;
}

- (NSString)value
{
  return (NSString *)PKMediumDateString();
}

- (id)image
{
  return 0;
}

- (id)secondaryLabel
{
  return 0;
}

- (id)tertiaryLabel
{
  return 0;
}

- (BOOL)isEmphasized
{
  return 1;
}

- (unint64_t)lineItemType
{
  return 11;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSDate)date
{
  return self->_date;
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