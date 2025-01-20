@interface TLKTableColumnAlignment
- (BOOL)isEqualWidth;
- (id)description;
- (int64_t)dataAlignment;
- (int64_t)textAlignment;
- (unint64_t)columnAlignment;
- (void)setColumnAlignment:(unint64_t)a3;
- (void)setDataAlignment:(int64_t)a3;
- (void)setIsEqualWidth:(BOOL)a3;
@end

@implementation TLKTableColumnAlignment

- (void)setColumnAlignment:(unint64_t)a3
{
  if (self->_columnAlignment != a3)
  {
    self->_columnAlignment = a3;
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

- (void)setDataAlignment:(int64_t)a3
{
  if (self->_dataAlignment != a3)
  {
    self->_dataAlignment = a3;
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

- (void)setIsEqualWidth:(BOOL)a3
{
  if (self->_isEqualWidth != a3)
  {
    self->_isEqualWidth = a3;
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

- (int64_t)textAlignment
{
  unint64_t v2 = [(TLKTableColumnAlignment *)self columnAlignment];
  if (v2 == 1) {
    return 1;
  }
  else {
    return 2 * (v2 == 2);
  }
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)TLKTableColumnAlignment;
  uint64_t v4 = [(TLKTableColumnAlignment *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ dataAlignment - %d columnAlignment - %d", v4, -[TLKTableColumnAlignment dataAlignment](self, "dataAlignment"), -[TLKTableColumnAlignment columnAlignment](self, "columnAlignment")];

  return v5;
}

- (unint64_t)columnAlignment
{
  return self->_columnAlignment;
}

- (int64_t)dataAlignment
{
  return self->_dataAlignment;
}

- (BOOL)isEqualWidth
{
  return self->_isEqualWidth;
}

@end