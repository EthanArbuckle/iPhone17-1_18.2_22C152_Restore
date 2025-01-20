@interface NSCTGlyphInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (id)_baseString;
- (unint64_t)characterCollection;
- (unint64_t)characterIdentifier;
- (unsigned)_glyph;
- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCTGlyphInfo

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  if (objc_msgSend(a4, "isEqualToString:", -[NSCTGlyphInfo _baseString](self, "_baseString")))
  {
    unint64_t v6 = [(NSCTGlyphInfo *)self characterCollection];
    if (v6)
    {
      unint64_t v7 = v6;
      CGFontRef v8 = CTFontCopyGraphicsFont((CTFontRef)a3, 0);
      if (v8)
      {
        v9 = v8;
        CTGlyphInfoGetCharacterCollection((CTGlyphInfoRef)self);
        if ((v7 == 255
           || CGFontGetRegistryOrderingSupplement()
           && CFEqual(0, @"Adobe")
           && CFEqual(0, __NSOrderingTable[v7 - 1]))
          && CGFontGetGlyphsForCIDs())
        {
          unsigned int CharacterIdentifier = 0;
LABEL_22:
          CFRelease(v9);
          return CharacterIdentifier;
        }
LABEL_19:
        unsigned int CharacterIdentifier = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t Font = _CTGlyphInfoGetFont();
      if (Font) {
        v12 = (const __CTFont *)Font;
      }
      else {
        v12 = (const __CTFont *)a3;
      }
      CFStringRef v13 = CTFontCopyPostScriptName(v12);
      if (v13)
      {
        v9 = v13;
        if (objc_msgSend((id)objc_msgSend(a3, "fontName"), "isEqualToString:", v13))
        {
          CTFontDescriptorRef v14 = CTFontCopyFontDescriptor(v12);
          if (objc_msgSend((id)objc_msgSend(a3, "fontDescriptor"), "isEqual:", v14))
          {
            unsigned int CharacterIdentifier = MEMORY[0x192FAE0E0](self);
            if (!CharacterIdentifier) {
              unsigned int CharacterIdentifier = CTGlyphInfoGetCharacterIdentifier((CTGlyphInfoRef)self);
            }
          }
          else
          {
            unsigned int CharacterIdentifier = 0;
          }
          CFRelease(v14);
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
  }
  return 0;
}

- (id)_baseString
{
  return (id)MEMORY[0x1F40DF9E8](self, a2);
}

- (unsigned)_glyph
{
  return MEMORY[0x192FAE0E0](self, a2);
}

- (unint64_t)characterIdentifier
{
  return CTGlyphInfoGetCharacterIdentifier((CTGlyphInfoRef)self);
}

- (unint64_t)characterCollection
{
  return CTGlyphInfoGetCharacterCollection((CTGlyphInfoRef)self);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t v5 = [(NSCTGlyphInfo *)self characterCollection];
  id v6 = [(NSCTGlyphInfo *)self _baseString];
  if (v5)
  {
    unint64_t v7 = +[NSGlyphInfo glyphInfoWithCharacterIdentifier:[(NSCTGlyphInfo *)self characterIdentifier] collection:v5 baseString:v6];
  }
  else
  {
    uint64_t Font = (const __CTFont *)_CTGlyphInfoGetFont();
    CTFontDescriptorRef v9 = CTFontCopyFontDescriptor(Font);
    v10 = +[UIFont fontWithDescriptor:v9 size:0.0];
    CFRelease(v9);
    if (v10)
    {
      id v11 = [(NSCTGlyphInfo *)self glyphName];
      if (v11) {
        unint64_t v7 = +[NSGlyphInfo glyphInfoWithGlyphName:v11 forFont:v10 baseString:v6];
      }
      else {
        unint64_t v7 = +[NSGlyphInfo glyphInfoWithGlyph:MEMORY[0x192FAE0E0](self) forFont:v10 baseString:v6];
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
  }

  [(NSGlyphInfo *)v7 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end