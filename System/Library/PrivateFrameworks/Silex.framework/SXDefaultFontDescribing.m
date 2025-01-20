@interface SXDefaultFontDescribing
- (NSString)fontName;
- (SXDefaultFontDescribing)init;
- (SXTextStyleFontAttributes)fontAttributes;
@end

@implementation SXDefaultFontDescribing

- (SXDefaultFontDescribing)init
{
  v8.receiver = self;
  v8.super_class = (Class)SXDefaultFontDescribing;
  v2 = [(SXDefaultFontDescribing *)&v8 init];
  v3 = v2;
  if (v2)
  {
    fontName = v2->_fontName;
    v2->_fontName = (NSString *)@"Helvetica";

    v5 = objc_alloc_init(SXDefaultFontAttributes);
    fontAttributes = v3->_fontAttributes;
    v3->_fontAttributes = (SXTextStyleFontAttributes *)v5;
  }
  return v3;
}

- (SXTextStyleFontAttributes)fontAttributes
{
  return self->_fontAttributes;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_fontAttributes, 0);
}

@end