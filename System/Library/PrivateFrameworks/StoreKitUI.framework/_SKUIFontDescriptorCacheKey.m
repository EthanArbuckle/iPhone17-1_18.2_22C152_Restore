@interface _SKUIFontDescriptorCacheKey
- (BOOL)isEqual:(id)a3;
- (NSString)sizeCategory;
- (_SKUIFontDescriptorCacheKey)initWithTextStyle:(__CFString *)a3 sizeCategory:(id)a4;
- (__CFString)textStyle;
- (unint64_t)hash;
@end

@implementation _SKUIFontDescriptorCacheKey

- (_SKUIFontDescriptorCacheKey)initWithTextStyle:(__CFString *)a3 sizeCategory:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SKUIFontDescriptorCacheKey;
  v8 = [(_SKUIFontDescriptorCacheKey *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_textStyle = a3;
    objc_storeStrong((id *)&v8->_sizeCategory, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  CFHashCode v3 = CFHash(self->_textStyle);
  return [(NSString *)self->_sizeCategory hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (_SKUIFontDescriptorCacheKey *)v4;
    if (self == v5)
    {
      char v8 = 1;
    }
    else if (CFEqual([(_SKUIFontDescriptorCacheKey *)self textStyle], [(_SKUIFontDescriptorCacheKey *)v5 textStyle]))
    {
      v6 = [(_SKUIFontDescriptorCacheKey *)self sizeCategory];
      id v7 = [(_SKUIFontDescriptorCacheKey *)v5 sizeCategory];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (__CFString)textStyle
{
  return self->_textStyle;
}

- (NSString)sizeCategory
{
  return self->_sizeCategory;
}

- (void).cxx_destruct
{
}

@end