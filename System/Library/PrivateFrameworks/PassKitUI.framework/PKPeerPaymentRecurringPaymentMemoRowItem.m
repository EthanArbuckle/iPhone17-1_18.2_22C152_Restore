@interface PKPeerPaymentRecurringPaymentMemoRowItem
- (BOOL)hasIcon;
- (BOOL)isEqual:(id)a3;
- (NSString)suggestedText;
- (PKPeerPaymentRecurringPaymentMemo)memo;
- (PKPeerPaymentRecurringPaymentMemoRowItem)initWithIdentifier:(id)a3 isEditable:(BOOL)a4 titleColor:(id)a5;
- (unint64_t)hash;
- (void)setMemo:(id)a3;
- (void)setSuggestedText:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentMemoRowItem

- (PKPeerPaymentRecurringPaymentMemoRowItem)initWithIdentifier:(id)a3 isEditable:(BOOL)a4 titleColor:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRecurringPaymentMemoRowItem;
  v5 = [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v9 initWithIdentifier:a3 isEditable:a4 titleColor:a5];
  if (v5)
  {
    v6 = (PKPeerPaymentRecurringPaymentMemo *)objc_alloc_init(MEMORY[0x1E4F84DE8]);
    memo = v5->_memo;
    v5->_memo = v6;
  }
  return v5;
}

- (void)setMemo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4) {
    v5 = (PKPeerPaymentRecurringPaymentMemo *)v4;
  }
  else {
    v5 = (PKPeerPaymentRecurringPaymentMemo *)objc_alloc_init(MEMORY[0x1E4F84DE8]);
  }
  memo = self->_memo;
  self->_memo = v5;
}

- (BOOL)hasIcon
{
  v3 = [(PKPeerPaymentRecurringPaymentMemo *)self->_memo emoji];
  if ([v3 length]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(PKPeerPaymentRecurringPaymentMemo *)self->_memo color] != 0;
  }

  return v4;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_memo];
  [v3 safelyAddObject:self->_suggestedText];
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentRecurringPaymentMemoRowItem;
  [(PKPeerPaymentRecurringPaymentDetailRowItem *)&v6 hash];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPeerPaymentRecurringPaymentMemoRowItem *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_super v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)PKPeerPaymentRecurringPaymentMemoRowItem;
    if ([(PKPeerPaymentRecurringPaymentDetailRowItem *)&v14 isEqual:v6]
      && PKEqualObjects())
    {
      suggestedText = self->_suggestedText;
      v8 = v6->_suggestedText;
      objc_super v9 = suggestedText;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [(NSString *)v9 isEqualToString:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (PKPeerPaymentRecurringPaymentMemo)memo
{
  return self->_memo;
}

- (NSString)suggestedText
{
  return self->_suggestedText;
}

- (void)setSuggestedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedText, 0);

  objc_storeStrong((id *)&self->_memo, 0);
}

@end