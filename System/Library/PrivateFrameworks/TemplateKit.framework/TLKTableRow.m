@interface TLKTableRow
- (BOOL)isSubHeader;
- (NSArray)data;
- (void)setData:(id)a3;
- (void)setIsSubHeader:(BOOL)a3;
@end

@implementation TLKTableRow

- (void)setData:(id)a3
{
  v10 = (NSArray *)a3;
  if (self->_data != v10)
  {
    objc_storeStrong((id *)&self->_data, a3);
    uint64_t v5 = [(TLKObject *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKObject *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKObject *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setIsSubHeader:(BOOL)a3
{
  if (self->_isSubHeader != a3)
  {
    self->_isSubHeader = a3;
    uint64_t v4 = [(TLKObject *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
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

- (NSArray)data
{
  return self->_data;
}

- (BOOL)isSubHeader
{
  return self->_isSubHeader;
}

- (void).cxx_destruct
{
}

@end