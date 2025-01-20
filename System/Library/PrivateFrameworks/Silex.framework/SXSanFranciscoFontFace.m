@interface SXSanFranciscoFontFace
- (NSDictionary)fontDescriptorAttributes;
- (NSString)fontName;
- (SXFontAttributes)fontAttributes;
- (SXSanFranciscoFontFace)initWithFontName:(id)a3 fontAttributes:(id)a4 fontDescriptorAttributes:(id)a5;
@end

@implementation SXSanFranciscoFontFace

- (SXSanFranciscoFontFace)initWithFontName:(id)a3 fontAttributes:(id)a4 fontDescriptorAttributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SXSanFranciscoFontFace;
  v12 = [(SXSanFranciscoFontFace *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fontName, a3);
    objc_storeStrong((id *)&v13->_fontAttributes, a4);
    objc_storeStrong((id *)&v13->_fontDescriptorAttributes, a5);
  }

  return v13;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (SXFontAttributes)fontAttributes
{
  return self->_fontAttributes;
}

- (NSDictionary)fontDescriptorAttributes
{
  return self->_fontDescriptorAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontDescriptorAttributes, 0);
  objc_storeStrong((id *)&self->_fontAttributes, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end