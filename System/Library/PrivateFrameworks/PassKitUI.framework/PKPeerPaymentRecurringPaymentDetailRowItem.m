@interface PKPeerPaymentRecurringPaymentDetailRowItem
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (PKPeerPaymentRecurringPaymentDetailRowItem)initWithIdentifier:(id)a3 isEditable:(BOOL)a4 titleColor:(id)a5;
- (UIColor)titleColor;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setTitleColor:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentDetailRowItem

- (PKPeerPaymentRecurringPaymentDetailRowItem)initWithIdentifier:(id)a3 isEditable:(BOOL)a4 titleColor:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentRecurringPaymentDetailRowItem;
  v11 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_isEditable = a4;
    objc_storeStrong((id *)&v12->_titleColor, a5);
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_titleColor];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPeerPaymentRecurringPaymentDetailRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects() && self->_isEditable == v6[8]) {
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (void)setIsEditable:(BOOL)a3
{
  self->_isEditable = a3;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleColor, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end