@interface PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (NSDate)maximumDate;
- (NSDate)minimumDate;
- (unint64_t)hash;
- (void)setDate:(id)a3;
- (void)setMaximumDate:(id)a3;
- (void)setMinimumDate:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_date];
  [v3 safelyAddObject:self->_maximumDate];
  [v3 safelyAddObject:self->_minimumDate];
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem;
  [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v6 hash];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentDateSelectorDetailRowItem;
    if ([(PKPeerPaymentRecurringPaymentDetailRowItem *)&v9 isEqual:v6]
      && PKEqualObjects()
      && PKEqualObjects())
    {
      char v7 = PKEqualObjects();
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (void)setMaximumDate:(id)a3
{
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (void)setMinimumDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end