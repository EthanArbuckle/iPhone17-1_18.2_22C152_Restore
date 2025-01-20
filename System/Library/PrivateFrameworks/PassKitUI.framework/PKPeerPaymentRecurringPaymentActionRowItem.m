@interface PKPeerPaymentRecurringPaymentActionRowItem
- (BOOL)actionInProgress;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (unint64_t)action;
- (unint64_t)hash;
- (void)setAction:(unint64_t)a3;
- (void)setActionInProgress:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentActionRowItem

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_title];
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentActionRowItem;
  [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v6 hash];
  PKCombinedHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPeerPaymentRecurringPaymentActionRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    v9.receiver = self;
    v9.super_class = (Class)PKPeerPaymentRecurringPaymentActionRowItem;
    BOOL v7 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v9 isEqual:v6]
      && PKEqualObjects()
      && self->_actionInProgress == v6->_actionInProgress
      && self->_action == v6->_action;
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

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (BOOL)actionInProgress
{
  return self->_actionInProgress;
}

- (void)setActionInProgress:(BOOL)a3
{
  self->_actionInProgress = a3;
}

- (void).cxx_destruct
{
}

@end