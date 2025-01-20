@interface TLKFormattedTextItem
- (BOOL)hasContent;
- (BOOL)isBold;
- (BOOL)isEmphasized;
- (int64_t)color;
- (unint64_t)_itemType;
- (void)setColor:(int64_t)a3;
- (void)setIsBold:(BOOL)a3;
- (void)setIsEmphasized:(BOOL)a3;
@end

@implementation TLKFormattedTextItem

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (int64_t)color
{
  return self->_color;
}

- (void)setIsBold:(BOOL)a3
{
  if (self->_isBold != a3)
  {
    self->_isBold = a3;
    uint64_t v4 = [(TLKObject *)self observer];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(TLKObject *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKObject *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setIsEmphasized:(BOOL)a3
{
  if (self->_isEmphasized != a3)
  {
    self->_isEmphasized = a3;
    uint64_t v4 = [(TLKObject *)self observer];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(TLKObject *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKObject *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (BOOL)hasContent
{
  return 1;
}

- (unint64_t)_itemType
{
  return 0;
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
}

@end