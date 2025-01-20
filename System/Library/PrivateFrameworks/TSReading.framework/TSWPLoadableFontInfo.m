@interface TSWPLoadableFontInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)obfuscated;
- (CGFont)cgFont;
- (NSString)fontFamily;
- (NSString)fontName;
- (NSString)fontPath;
- (NSString)groupUID;
- (id)description;
- (void)dealloc;
- (void)setCgFont:(CGFont *)a3;
- (void)setFontFamily:(id)a3;
- (void)setFontName:(id)a3;
- (void)setFontPath:(id)a3;
- (void)setGroupUID:(id)a3;
- (void)setObfuscated:(BOOL)a3;
@end

@implementation TSWPLoadableFontInfo

- (void)dealloc
{
  [(TSWPLoadableFontInfo *)self setCgFont:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPLoadableFontInfo;
  [(TSWPLoadableFontInfo *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = [a3 isMemberOfClass:objc_opt_class()];
    if (v5)
    {
      v6 = [(TSWPLoadableFontInfo *)self fontName];
      uint64_t v7 = [a3 fontName];
      LOBYTE(v5) = [(NSString *)v6 isEqualToString:v7];
    }
  }
  return v5;
}

- (id)description
{
  v2 = @"yes";
  if (self->_obfuscated) {
    objc_super v3 = @"yes";
  }
  else {
    objc_super v3 = @"no";
  }
  if (!self->_attemptedLoad) {
    v2 = @"no";
  }
  return (id)[NSString stringWithFormat:@"<TSWPLoadableFontInfo groupUID=%@ name=%@ family=%@ obfuscated=%@ attemptedLoad=%@>", self->_groupUID, self->_fontName, self->_fontFamily, v3, v2];
}

- (void)setCgFont:(CGFont *)a3
{
  cgFont = self->_cgFont;
  if (cgFont != a3)
  {
    if (cgFont)
    {
      CFErrorRef error = 0;
      CTFontManagerUnregisterGraphicsFont(cgFont, &error);
      CGFontRelease(self->_cgFont);
    }
    CGFontRetain(a3);
    self->_cgFont = a3;
  }
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (void)setGroupUID:(id)a3
{
}

- (NSString)fontPath
{
  return self->_fontPath;
}

- (void)setFontPath:(id)a3
{
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (NSString)fontFamily
{
  return self->_fontFamily;
}

- (void)setFontFamily:(id)a3
{
}

- (CGFont)cgFont
{
  return self->_cgFont;
}

- (BOOL)obfuscated
{
  return self->_obfuscated;
}

- (void)setObfuscated:(BOOL)a3
{
  self->_obfuscated = a3;
}

@end