@interface WBSCachedFont
- (UIFont)font;
- (double)size;
- (int64_t)fontDesign;
- (int64_t)fontWeight;
- (void)setFont:(id)a3;
- (void)setFontDesign:(int64_t)a3;
- (void)setFontWeight:(int64_t)a3;
- (void)setSize:(double)a3;
@end

@implementation WBSCachedFont

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (int64_t)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(int64_t)a3
{
  self->_fontWeight = a3;
}

- (int64_t)fontDesign
{
  return self->_fontDesign;
}

- (void)setFontDesign:(int64_t)a3
{
  self->_fontDesign = a3;
}

- (void).cxx_destruct
{
}

@end