@interface _SKUIViewElementTextLayoutCacheBestGuessCacheKey
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (UIFont)font;
- (int64_t)width;
- (unint64_t)hash;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
- (void)setWidth:(int64_t)a3;
@end

@implementation _SKUIViewElementTextLayoutCacheBestGuessCacheKey

- (BOOL)isEqual:(id)a3
{
  v4 = (_SKUIViewElementTextLayoutCacheBestGuessCacheKey *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && ((text = v4->_text, text == self->_text) || -[NSString isEqual:](text, "isEqual:"))
      && ((font = v4->_font, font == self->_font) || -[UIFont isEqual:](font, "isEqual:"))
      && v4->_width == self->_width;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  return [(UIFont *)self->_font hash] ^ v3 ^ self->_width;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (int64_t)width
{
  return self->_width;
}

- (void)setWidth:(int64_t)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end