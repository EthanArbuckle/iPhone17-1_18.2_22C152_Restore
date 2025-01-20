@interface NSGlyphNameGlyphInfo
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (NSGlyphNameGlyphInfo)initWithCoder:(id)a3;
- (NSGlyphNameGlyphInfo)initWithGlyphName:(id)a3 glyph:(unsigned int)a4 forFont:(id)a5 baseString:(id)a6;
- (id)description;
- (id)glyphName;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSGlyphNameGlyphInfo

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (NSGlyphNameGlyphInfo)initWithGlyphName:(id)a3 glyph:(unsigned int)a4 forFont:(id)a5 baseString:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)NSGlyphNameGlyphInfo;
  v7 = [(NSIdentityGlyphInfo *)&v9 initWithGlyph:*(void *)&a4 forFont:a5 baseString:a6];
  v7->_name = (NSString *)a3;
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSGlyphNameGlyphInfo;
  [(NSIdentityGlyphInfo *)&v3 dealloc];
}

- (id)glyphName
{
  return self->_name;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSGlyphNameGlyphInfo;
  -[NSIdentityGlyphInfo encodeWithCoder:](&v7, sel_encodeWithCoder_);
  int v5 = [a3 allowsKeyedCoding];
  name = self->_name;
  if (v5)
  {
    if (name) {
      [a3 encodeObject:name forKey:@"NSGlyphName"];
    }
  }
  else
  {
    [a3 encodeObject:name];
  }
}

- (NSGlyphNameGlyphInfo)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    v12.receiver = self;
    v12.super_class = (Class)NSGlyphNameGlyphInfo;
    return [(NSIdentityGlyphInfo *)&v12 initWithCoder:a3];
  }
  uint64_t v6 = [a3 versionForClassName:@"NSGlyphNameGlyphInfo"];
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class() || v6 != 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSGlyphNameGlyphInfo;
    int v5 = [(NSIdentityGlyphInfo *)&v11 initWithCoder:a3];
    v5->_name = (NSString *)(id)[a3 decodeObject];
    return v5;
  }
  v10 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:0.0], &stru_1EDD49F70);

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"glyph \"%@\", font %@, string \"%@\"", self->_name, self->super._font, self->super.super._baseString];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end