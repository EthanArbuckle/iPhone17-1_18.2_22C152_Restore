@interface TLKFormattedText
+ (id)formattedTextWithString:(id)a3;
- (BOOL)hasContent;
- (NSString)string;
- (id)description;
- (int64_t)encapsulationStyle;
- (int64_t)verticalTextAlignment;
- (unint64_t)maxLines;
- (void)setEncapsulationStyle:(int64_t)a3;
- (void)setMaxLines:(unint64_t)a3;
- (void)setString:(id)a3;
- (void)setVerticalTextAlignment:(int64_t)a3;
@end

@implementation TLKFormattedText

+ (id)formattedTextWithString:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setString:v3];

  return v4;
}

- (NSString)string
{
  return self->_string;
}

- (int64_t)encapsulationStyle
{
  return self->_encapsulationStyle;
}

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

- (void).cxx_destruct
{
}

- (void)setVerticalTextAlignment:(int64_t)a3
{
  if (self->_verticalTextAlignment != a3)
  {
    self->_verticalTextAlignment = a3;
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

- (void)setEncapsulationStyle:(int64_t)a3
{
  if (self->_encapsulationStyle != a3)
  {
    self->_encapsulationStyle = a3;
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TLKFormattedText;
  uint64_t v4 = [(TLKFormattedText *)&v8 description];
  uint64_t v5 = [(TLKFormattedText *)self string];
  v6 = [v3 stringWithFormat:@"%@ string:%@ isBold:%d isEmphasized:%d", v4, v5, -[TLKFormattedTextItem isBold](self, "isBold"), -[TLKFormattedTextItem isEmphasized](self, "isEmphasized")];

  return v6;
}

- (BOOL)hasContent
{
  v2 = [(TLKFormattedText *)self string];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (int64_t)verticalTextAlignment
{
  return self->_verticalTextAlignment;
}

- (unint64_t)maxLines
{
  return self->_maxLines;
}

- (void)setMaxLines:(unint64_t)a3
{
  self->_maxLines = a3;
}

@end