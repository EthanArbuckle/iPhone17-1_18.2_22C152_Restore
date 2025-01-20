@interface PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSString)title;
- (unint64_t)hash;
- (void)setName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_name];
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem;
  [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v6 hash];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentFundingSourceDetailRowItem;
    if ([(PKPeerPaymentRecurringPaymentDetailRowItem *)&v9 isEqual:v6] && PKEqualObjects()) {
      char v7 = PKEqualObjects();
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
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

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end