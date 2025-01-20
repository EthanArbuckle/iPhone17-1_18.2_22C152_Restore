@interface NSIdentityGlyphInfo
+ (BOOL)supportsSecureCoding;
+ (id)glyphInfoWithGlyph:(unsigned int)a3 forFont:(id)a4 baseString:(id)a5;
+ (void)initialize;
- (NSIdentityGlyphInfo)initWithCoder:(id)a3;
- (NSIdentityGlyphInfo)initWithGlyph:(unsigned int)a3 forFont:(id)a4 baseString:(id)a5;
- (id)_font;
- (id)description;
- (unsigned)_glyph;
- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4;
- (unsigned)glyph;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSIdentityGlyphInfo

+ (id)glyphInfoWithGlyph:(unsigned int)a3 forFont:(id)a4 baseString:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGlyph:*(void *)&a3 forFont:a4 baseString:a5];

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (NSIdentityGlyphInfo)initWithGlyph:(unsigned int)a3 forFont:(id)a4 baseString:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NSIdentityGlyphInfo;
  v7 = [(NSGlyphInfo *)&v9 initWithBaseString:a5];
  v7->_font = (NSFont *)a4;
  v7->_glyph = a3;
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSIdentityGlyphInfo;
  [(NSGlyphInfo *)&v3 dealloc];
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  unsigned int result = [a4 isEqualToString:self->super._baseString];
  if (result)
  {
    if ([a3 isEqual:self->_font]) {
      return self->_glyph;
    }
    [(UIFont *)self->_font pointSize];
    unsigned int result = objc_msgSend((id)objc_msgSend(a3, "fontWithSize:"), "isEqual:", self->_font);
    if (result) {
      return self->_glyph;
    }
  }
  return result;
}

- (id)_font
{
  return self->_font;
}

- (unsigned)_glyph
{
  return self->_glyph;
}

- (unsigned)glyph
{
  return self->_glyph;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSIdentityGlyphInfo;
  -[NSGlyphInfo encodeWithCoder:](&v8, sel_encodeWithCoder_);
  int v5 = [a3 allowsKeyedCoding];
  font = self->_font;
  if (v5)
  {
    if (font) {
      [a3 encodeObject:font forKey:@"NSFont"];
    }
    uint64_t glyph = self->_glyph;
    if (glyph) {
      [a3 encodeInt32:glyph forKey:@"NSGlyph"];
    }
  }
  else
  {
    [a3 encodeObject:font];
    [a3 encodeValueOfObjCType:"I" at:&self->_glyph];
  }
}

- (NSIdentityGlyphInfo)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    v12.receiver = self;
    v12.super_class = (Class)NSIdentityGlyphInfo;
    return [(NSGlyphInfo *)&v12 initWithCoder:a3];
  }
  uint64_t v6 = [a3 versionForClassName:@"NSIdentityGlyphInfo"];
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class() || v6 != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSIdentityGlyphInfo;
    int v5 = [(NSGlyphInfo *)&v11 initWithCoder:a3];
    v5->_font = (NSFont *)(id)[a3 decodeObject];
    [a3 decodeValueOfObjCType:"I" at:&v5->_glyph size:4];
    return v5;
  }
  v10 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:0.0], &stru_1EDD49F70);

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"glyph 0x%04X, font %@, string \"%@\"", self->_glyph, self->_font, self->super._baseString];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end