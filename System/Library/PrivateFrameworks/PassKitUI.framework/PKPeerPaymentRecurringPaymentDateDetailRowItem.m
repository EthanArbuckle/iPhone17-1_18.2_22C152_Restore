@interface PKPeerPaymentRecurringPaymentDateDetailRowItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelected;
- (NSDate)date;
- (NSString)title;
- (unint64_t)hash;
- (void)setDate:(id)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentDateDetailRowItem

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_date];
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentDateDetailRowItem;
  [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v6 hash];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPeerPaymentRecurringPaymentDateDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentDateDetailRowItem;
    BOOL v7 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v9 isEqual:v6]
      && PKEqualObjects()
      && PKEqualObjects()
      && self->_isSelected == v6[32];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end