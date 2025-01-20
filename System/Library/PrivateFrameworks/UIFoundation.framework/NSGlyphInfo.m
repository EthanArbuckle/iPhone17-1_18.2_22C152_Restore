@interface NSGlyphInfo
+ (BOOL)supportsSecureCoding;
+ (NSGlyphInfo)glyphInfoWithCGGlyph:(CGGlyph)glyph forFont:(NSFont *)font baseString:(NSString *)string;
+ (NSGlyphInfo)glyphInfoWithCharacterIdentifier:(NSUInteger)cid collection:(NSCharacterCollection)characterCollection baseString:(NSString *)string;
+ (NSGlyphInfo)glyphInfoWithGlyph:(NSGlyph)glyph forFont:(NSFont *)font baseString:(NSString *)string;
+ (NSGlyphInfo)glyphInfoWithGlyphName:(NSString *)glyphName forFont:(NSFont *)font baseString:(NSString *)string;
+ (void)initialize;
- (CGGlyph)glyphID;
- (Class)classForKeyedArchiver;
- (NSCharacterCollection)characterCollection;
- (NSGlyphInfo)initWithBaseString:(id)a3;
- (NSGlyphInfo)initWithCoder:(id)a3;
- (NSString)baseString;
- (NSString)glyphName;
- (NSUInteger)characterIdentifier;
- (id)_baseString;
- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSGlyphInfo

+ (NSGlyphInfo)glyphInfoWithGlyphName:(NSString *)glyphName forFont:(NSFont *)font baseString:(NSString *)string
{
  uint64_t v8 = -[UIFont glyphWithName:](font, "glyphWithName:");
  if (![(UIFont *)font glyphWithName:glyphName]) {
    return 0;
  }
  v9 = [[NSGlyphNameGlyphInfo alloc] initWithGlyphName:glyphName glyph:v8 forFont:font baseString:string];

  return (NSGlyphInfo *)v9;
}

+ (NSGlyphInfo)glyphInfoWithCGGlyph:(CGGlyph)glyph forFont:(NSFont *)font baseString:(NSString *)string
{
  uint64_t v7 = glyph;
  uint64_t v8 = objc_opt_class();

  return (NSGlyphInfo *)[v8 glyphInfoWithGlyph:v7 forFont:font baseString:string];
}

+ (NSGlyphInfo)glyphInfoWithGlyph:(NSGlyph)glyph forFont:(NSFont *)font baseString:(NSString *)string
{
  uint64_t v7 = *(void *)&glyph;
  if ([(UIFont *)font numberOfGlyphs] <= glyph) {
    return 0;
  }

  return (NSGlyphInfo *)+[NSIdentityGlyphInfo glyphInfoWithGlyph:v7 forFont:font baseString:string];
}

+ (NSGlyphInfo)glyphInfoWithCharacterIdentifier:(NSUInteger)cid collection:(NSCharacterCollection)characterCollection baseString:(NSString *)string
{
  if (characterCollection < (NSAdobeJapan2CharacterCollection|NSAdobeGB1CharacterCollection)
    || characterCollection == 255)
  {
    return (NSGlyphInfo *)+[NSCIDGlyphInfo glyphInfoWithCharacterIdentifier:collection:baseString:](NSCIDGlyphInfo, "glyphInfoWithCharacterIdentifier:collection:baseString:", cid);
  }
  else
  {
    return 0;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __NSGlyphInfoClassObject = (uint64_t)a1;
    [a1 setVersion:1];
  }
}

- (NSGlyphInfo)initWithBaseString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NSGlyphInfo;
  v4 = [(NSGlyphInfo *)&v6 init];
  v4->_baseString = (NSString *)[a3 copy];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSGlyphInfo;
  [(NSGlyphInfo *)&v3 dealloc];
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  return 0;
}

- (id)_baseString
{
  return self->_baseString;
}

- (NSString)glyphName
{
  return 0;
}

- (NSUInteger)characterIdentifier
{
  return 0;
}

- (NSCharacterCollection)characterCollection
{
  return 0;
}

- (CGGlyph)glyphID
{
  return 0;
}

- (NSString)baseString
{
  return self->_baseString;
}

- (void)encodeWithCoder:(id)a3
{
  int v5 = [a3 allowsKeyedCoding];
  baseString = self->_baseString;
  if (v5)
  {
    if (baseString)
    {
      objc_msgSend(a3, "encodeObject:forKey:");
    }
  }
  else
  {
    [a3 encodeObject:baseString];
  }
}

- (Class)classForKeyedArchiver
{
  return (Class)__NSGlyphInfoClassObject;
}

- (NSGlyphInfo)initWithCoder:(id)a3
{
  if (![a3 allowsKeyedCoding])
  {
    if ([a3 versionForClassName:@"NSGlyphInfo"]
      || (uint64_t v11 = objc_opt_class(), v11 != objc_opt_class()))
    {
      self->_baseString = (NSString *)(id)[a3 decodeObject];
      v10 = self;
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSString"];
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSFont"];
  if (!v7)
  {
    unsigned int v14 = [a3 decodeInt32ForKey:@"NSCID_RO"];
    if (v14)
    {
      v10 = +[NSGlyphInfo glyphInfoWithCharacterIdentifier:v14 & 0xFFFFFF collection:HIBYTE(v14) baseString:v6];
      goto LABEL_9;
    }
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v8 = v7;
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSGlyphName"];
  if (v9)
  {
    v10 = +[NSGlyphInfo glyphInfoWithGlyphName:v9 forFont:v8 baseString:v6];
    goto LABEL_9;
  }
  uint64_t v15 = [a3 decodeInt32ForKey:@"NSGlyph"];
  if (!v15) {
    goto LABEL_15;
  }
  v10 = +[NSGlyphInfo glyphInfoWithGlyph:v15 forFont:v8 baseString:v6];
LABEL_9:
  v12 = v10;

  if (v12) {
    return v12;
  }
LABEL_16:
  v16 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:0.0], &stru_1EDD49F70);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end