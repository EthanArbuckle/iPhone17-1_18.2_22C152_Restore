@interface TSWPFont
+ (BOOL)isKeyValueProxyLeafType;
+ (id)fontWithName:(id)a3;
+ (id)fontWithName:(id)a3 compatibilityName:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)compatibilityName;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)fontName;
- (TSWPFont)init;
- (TSWPFont)initWithFontName:(id)a3;
- (TSWPFont)initWithFontName:(id)a3 compatibilityName:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setCompatibilityName:(id)a3;
- (void)setFontName:(id)a3;
@end

@implementation TSWPFont

+ (id)fontWithName:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithFontName:a3 compatibilityName:0];

  return v3;
}

+ (id)fontWithName:(id)a3 compatibilityName:(id)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithFontName:a3 compatibilityName:a4];

  return v4;
}

- (TSWPFont)initWithFontName:(id)a3
{
  return [(TSWPFont *)self initWithFontName:a3 compatibilityName:0];
}

- (TSWPFont)initWithFontName:(id)a3 compatibilityName:(id)a4
{
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPFont initWithFontName:compatibilityName:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 51, @"invalid nil value for '%s'", "fontName");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSWPFont initWithFontName:compatibilityName:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 52, @"Wrong class for fontName");
  }
  v14.receiver = self;
  v14.super_class = (Class)TSWPFont;
  v11 = [(TSWPFont *)&v14 init];
  v12 = v11;
  if (v11)
  {
    if (a3)
    {
      [(TSWPFont *)v11 setFontName:a3];
      [(TSWPFont *)v12 setCompatibilityName:a4];
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

- (TSWPFont)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSWPFont init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 73, @"Failed to call designated initializer");
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPFont;
  [(TSWPFont *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TSWPFont alloc];
  v5 = [(TSWPFont *)self fontName];
  v6 = [(TSWPFont *)self compatibilityName];

  return [(TSWPFont *)v4 initWithFontName:v5 compatibilityName:v6];
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (!result)
  {
    NSUInteger v4 = [(NSString *)[(TSWPFont *)self fontName] hash];
    unint64_t result = [(NSString *)[(TSWPFont *)self compatibilityName] hash] + v4;
    self->_hash = result;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    unint64_t v6 = [(TSWPFont *)self fontName];
    uint64_t v7 = [v5 fontName];
    if (!(v6 | v7) || (LODWORD(v4) = [(id)v6 isEqual:v7], v4))
    {
      unint64_t v8 = [(TSWPFont *)self compatibilityName];
      uint64_t v9 = [v5 compatibilityName];
      if (v8 | v9)
      {
        LOBYTE(v4) = [(id)v8 isEqual:v9];
      }
      else
      {
        LOBYTE(v4) = 1;
      }
    }
  }
  return v4;
}

- (NSString)compatibilityName
{
  if (-[NSString isEqualToString:](self->_compatibilityName, "isEqualToString:", objc_msgSend(+[TSWPFontCache sharedCache](TSWPFontCache, "sharedCache"), "displayNameForFontFamily:", -[TSWPFont familyName](self, "familyName"))))
  {
    return 0;
  }
  else
  {
    return self->_compatibilityName;
  }
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    displayName = (NSString *)objc_msgSend(+[TSWPFontCache sharedCache](TSWPFontCache, "sharedCache"), "displayNameForFontFamily:", -[TSWPFont familyName](self, "familyName"));
    if (!displayName)
    {
      uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPFont displayName]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 131, @"invalid nil value for '%s'", "result");
    }
    unint64_t v6 = [(TSWPFont *)self compatibilityName];
    if (v6) {
      displayName = (NSString *)[NSString stringWithFormat:objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", @"%@ (%@)", &stru_26D688A48, @"TSText", displayName, v6];
    }
    self->_displayName = (NSString *)[(NSString *)displayName copy];
  }
  return displayName;
}

- (NSString)familyName
{
  familyName = self->_familyName;
  if (familyName) {
    return familyName;
  }
  fontName = self->_fontName;
  if (!fontName)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPFont familyName]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 152, @"invalid nil value for '%s'", "_fontName");
    fontName = self->_fontName;
    if (!fontName) {
      return 0;
    }
  }
  uint64_t v7 = CTFontDescriptorCreateWithNameAndSize((CFStringRef)fontName, 0.0);
  if (!v7)
  {
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPFont familyName]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 156, @"invalid nil value for '%s'", "desc");
    return 0;
  }
  unint64_t v8 = v7;
  uint64_t v9 = (NSString *)CTFontDescriptorCopyAttribute(v7, (CFStringRef)*MEMORY[0x263F03A80]);
  if (v9)
  {
    familyName = v9;
    self->_familyName = v9;
  }
  else
  {
    v12 = (const __CTFont *)TSWPCreateFontWithName((uint64_t)self->_fontName, 0.0);
    if (!v12)
    {
      v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v14 = [NSString stringWithUTF8String:"-[TSWPFont familyName]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFont.mm"), 167, @"invalid nil value for '%s'", "ctFont");
    }
    familyName = (NSString *)CTFontCopyFamilyName(v12);
    self->_familyName = familyName;
    self->_compatibilityName = (NSString *)[(NSString *)self->_fontName copy];
    CFRelease(v12);
  }
  CFRelease(v8);
  return familyName;
}

+ (BOOL)isKeyValueProxyLeafType
{
  return 1;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (void)setCompatibilityName:(id)a3
{
}

@end