@interface PKPeerPaymentRecurringPaymentFrequencyDetailRowItem
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (unint64_t)frequency;
- (unint64_t)hash;
- (void)setDate:(id)a3;
- (void)setFrequency:(unint64_t)a3;
@end

@implementation PKPeerPaymentRecurringPaymentFrequencyDetailRowItem

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_date];
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentFrequencyDetailRowItem;
  [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v6 hash];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPeerPaymentRecurringPaymentFrequencyDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentFrequencyDetailRowItem;
    BOOL v7 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v9 isEqual:v6]
      && PKEqualObjects()
      && self->_frequency == v6->_frequency;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end