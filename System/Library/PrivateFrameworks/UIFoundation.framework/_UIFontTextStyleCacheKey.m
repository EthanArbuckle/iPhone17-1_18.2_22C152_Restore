@interface _UIFontTextStyleCacheKey
- (BOOL)_isEqualToKey:(id)a3;
- (BOOL)textLegibility;
- (NSString)contentSizeCategory;
- (NSString)textStyle;
- (id)description;
- (unint64_t)_hash;
- (void)dealloc;
- (void)setContentSizeCategory:(id)a3;
- (void)setTextLegibility:(BOOL)a3;
- (void)setTextStyle:(id)a3;
@end

@implementation _UIFontTextStyleCacheKey

- (void)setTextStyle:(id)a3
{
}

- (void)setTextLegibility:(BOOL)a3
{
  self->_textLegibility = a3;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (unint64_t)_hash
{
  NSUInteger v3 = [(NSString *)self->_textStyle hash];
  return [(NSString *)self->_contentSizeCategory hash] ^ v3 ^ self->_textLegibility;
}

- (BOOL)_isEqualToKey:(id)a3
{
  if (self->super._hash == *((void *)a3 + 1))
  {
    textStyle = self->_textStyle;
    if (textStyle == *((NSString **)a3 + 3) || (BOOL v6 = -[NSString isEqualToString:](textStyle, "isEqualToString:")))
    {
      contentSizeCategory = self->_contentSizeCategory;
      if (contentSizeCategory == *((NSString **)a3 + 4)
        || (BOOL v6 = -[NSString isEqualToString:](contentSizeCategory, "isEqualToString:")))
      {
        LOBYTE(v6) = self->_textLegibility == *((unsigned __int8 *)a3 + 16);
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFontTextStyleCacheKey;
  [(_UIFontTextStyleCacheKey *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"textStyle: %@, contentSizeCategory: %@, legibilityWeight: %ld", self->_textStyle, self->_contentSizeCategory, self->_textLegibility];
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (BOOL)textLegibility
{
  return self->_textLegibility;
}

@end