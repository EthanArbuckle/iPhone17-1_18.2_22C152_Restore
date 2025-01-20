@interface TSUFont
+ (id)boldSystemFontOfSize:(double)a3;
+ (id)fontWithName:(id)a3 size:(double)a4;
+ (id)fontWithPlatformFont:(id)a3;
+ (id)italicSystemFontOfSize:(double)a3;
+ (id)systemFontOfSize:(double)a3;
+ (id)systemFontOfSize:(double)a3 weight:(double)a4;
- (NSString)familyName;
- (NSString)fontName;
- (TSUFont)fontWithScale:(double)a3;
- (TSUFont)fontWithSize:(double)a3;
- (TSUFont)initWithCTFont:(__CTFont *)a3;
- (UIFont)platformFont;
- (__CTFont)CTFont;
- (double)ascender;
- (double)capHeight;
- (double)descender;
- (double)lineHeight;
- (double)pointSize;
- (double)xHeight;
- (id)convertFontToBold:(BOOL)a3 italic:(BOOL)a4;
- (void)dealloc;
@end

@implementation TSUFont

- (TSUFont)initWithCTFont:(__CTFont *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSUFont;
  v4 = [(TSUFont *)&v8 init];
  if (v4)
  {
    if (a3)
    {
      v4->_ctFont = (__CTFont *)CFRetain(a3);
    }
    else
    {
      id v5 = +[TSUAssertionHandler currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSUFont initWithCTFont:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFont.m"), 32, @"can't create TSUFont without a CTFontRef");

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  ctFont = self->_ctFont;
  if (ctFont)
  {
    CFRelease(ctFont);
    self->_ctFont = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUFont;
  [(TSUFont *)&v4 dealloc];
}

+ (id)fontWithName:(id)a3 size:(double)a4
{
  id result = CTFontCreateWithName((CFStringRef)a3, a4, 0);
  if (result)
  {
    id v5 = result;
    id v6 = (id)[objc_alloc((Class)objc_opt_class()) initWithCTFont:result];
    CFRelease(v5);
    return v6;
  }
  return result;
}

+ (id)systemFontOfSize:(double)a3
{
  uint64_t v3 = [MEMORY[0x263F1C658] systemFontOfSize:a3];
  return +[TSUFont fontWithPlatformFont:v3];
}

+ (id)boldSystemFontOfSize:(double)a3
{
  uint64_t v3 = [MEMORY[0x263F1C658] boldSystemFontOfSize:a3];
  return +[TSUFont fontWithPlatformFont:v3];
}

+ (id)italicSystemFontOfSize:(double)a3
{
  uint64_t v3 = [MEMORY[0x263F1C658] italicSystemFontOfSize:a3];
  return +[TSUFont fontWithPlatformFont:v3];
}

+ (id)systemFontOfSize:(double)a3 weight:(double)a4
{
  uint64_t v4 = [MEMORY[0x263F1C658] systemFontOfSize:a3 weight:a4];
  return +[TSUFont fontWithPlatformFont:v4];
}

- (NSString)familyName
{
  v2 = (__CFString *)CTFontCopyFamilyName(self->_ctFont);
  return (NSString *)v2;
}

- (NSString)fontName
{
  v2 = (__CFString *)CTFontCopyPostScriptName(self->_ctFont);
  return (NSString *)v2;
}

- (double)pointSize
{
  return CTFontGetSize(self->_ctFont);
}

- (double)ascender
{
  return CTFontGetAscent(self->_ctFont);
}

- (double)descender
{
  return CTFontGetDescent(self->_ctFont);
}

- (double)capHeight
{
  return CTFontGetCapHeight(self->_ctFont);
}

- (double)xHeight
{
  return CTFontGetXHeight(self->_ctFont);
}

- (double)lineHeight
{
  [(TSUFont *)self ascender];
  double v4 = v3;
  [(TSUFont *)self descender];
  return v4 + v5;
}

- (TSUFont)fontWithSize:(double)a3
{
  id result = (TSUFont *)CTFontCreateCopyWithAttributes(self->_ctFont, a3, 0, 0);
  if (result)
  {
    double v4 = result;
    double v5 = (TSUFont *)(id)[objc_alloc((Class)objc_opt_class()) initWithCTFont:result];
    CFRelease(v4);
    return v5;
  }
  return result;
}

- (TSUFont)fontWithScale:(double)a3
{
  double v4 = self;
  if (a3 != 1.0)
  {
    [(TSUFont *)self pointSize];
    double v6 = v5 * a3;
    return [(TSUFont *)v4 fontWithSize:v6];
  }
  return self;
}

- (id)convertFontToBold:(BOOL)a3 italic:(BOOL)a4
{
  if (a3) {
    int v4 = 2;
  }
  else {
    int v4 = 0;
  }
  id result = CTFontCreateCopyWithSymbolicTraits(self->_ctFont, 0.0, 0, v4 | a4, 3u);
  if (result)
  {
    id v6 = result;
    v7 = [[TSUFont alloc] initWithCTFont:result];
    CFRelease(v6);
    return v7;
  }
  return result;
}

- (__CTFont)CTFont
{
  return self->_ctFont;
}

+ (id)fontWithPlatformFont:(id)a3
{
  double v3 = (void *)[objc_alloc((Class)a1) initWithPlatformFont:a3];
  return v3;
}

- (UIFont)platformFont
{
  v2 = [(TSUFont *)self CTFont];
  return (UIFont *)v2;
}

@end