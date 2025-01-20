@interface TLKMultilineText
+ (TLKMultilineText)textWithString:(id)a3;
- (NSString)text;
- (id)description;
- (unint64_t)maxLines;
- (void)setMaxLines:(unint64_t)a3;
- (void)setText:(id)a3;
@end

@implementation TLKMultilineText

- (NSString)text
{
  return self->_text;
}

- (unint64_t)maxLines
{
  return self->_maxLines;
}

+ (TLKMultilineText)textWithString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_opt_new();
    [v4 setText:v3];

    [v4 setMaxLines:0];
  }
  else
  {
    v4 = 0;
  }
  return (TLKMultilineText *)v4;
}

- (void)setMaxLines:(unint64_t)a3
{
  if (self->_maxLines != a3)
  {
    self->_maxLines = a3;
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

- (void)setText:(id)a3
{
  v10 = (NSString *)a3;
  if (self->_text != v10)
  {
    objc_storeStrong((id *)&self->_text, a3);
    uint64_t v5 = [(TLKObject *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKObject *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKObject *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TLKMultilineText;
  uint64_t v4 = [(TLKMultilineText *)&v8 description];
  uint64_t v5 = [(TLKMultilineText *)self text];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end