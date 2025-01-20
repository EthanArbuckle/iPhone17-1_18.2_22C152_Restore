@interface TLKInlineRoundedText
- (NSString)string;
- (unint64_t)_itemType;
- (void)setString:(id)a3;
@end

@implementation TLKInlineRoundedText

- (void)setString:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_string != v10)
  {
    objc_storeStrong((id *)&self->_string, a3);
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

- (unint64_t)_itemType
{
  return 2;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end