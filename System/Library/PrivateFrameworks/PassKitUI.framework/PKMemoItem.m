@interface PKMemoItem
- (NSCopying)identifier;
- (PKMemoItem)initWithMemo:(id)a3 type:(unint64_t)a4;
- (PKPeerPaymentRecurringPaymentMemo)memo;
- (unint64_t)type;
- (void)setMemo:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKMemoItem

- (PKMemoItem)initWithMemo:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKMemoItem;
  v8 = [(PKMemoItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    objc_storeStrong((id *)&v8->_memo, a3);
  }

  return v9;
}

- (NSCopying)identifier
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F87260];
  unint64_t type = self->_type;
  if (type - 1 < 3)
  {
LABEL_2:
    uint64_t v2 = PKIntegerHash();
    goto LABEL_3;
  }
  if (!type)
  {
    if (self->_memo)
    {
      v7[0] = self->_memo;
      v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
      PKCombinedHash();
    }
    goto LABEL_2;
  }
LABEL_3:
  v4 = [NSNumber numberWithUnsignedInteger:v2];

  return (NSCopying *)v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (PKPeerPaymentRecurringPaymentMemo)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end