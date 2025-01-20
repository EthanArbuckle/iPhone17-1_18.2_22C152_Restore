@interface NSCIDGlyphInfo
+ (BOOL)supportsSecureCoding;
+ (id)glyphInfoWithCharacterIdentifier:(unint64_t)a3 collection:(unint64_t)a4 baseString:(id)a5;
+ (void)initialize;
- (NSCIDGlyphInfo)initWithCharacterIdentifier:(unint64_t)a3 collection:(unint64_t)a4 baseString:(id)a5;
- (NSCIDGlyphInfo)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)characterCollection;
- (unint64_t)characterIdentifier;
- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSCIDGlyphInfo

+ (id)glyphInfoWithCharacterIdentifier:(unint64_t)a3 collection:(unint64_t)a4 baseString:(id)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCharacterIdentifier:a3 collection:a4 baseString:a5];

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (NSCIDGlyphInfo)initWithCharacterIdentifier:(unint64_t)a3 collection:(unint64_t)a4 baseString:(id)a5
{
  unsigned __int16 v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NSCIDGlyphInfo;
  result = [(NSGlyphInfo *)&v8 initWithBaseString:a5];
  result->_cid = v6;
  result->_collection = a4;
  return result;
}

- (unsigned)_glyphForFont:(id)a3 baseString:(id)a4
{
  LODWORD(v6) = [a4 isEqualToString:self->super._baseString];
  if (v6)
  {
    if (self->_collection || (unint64_t cid = self->_cid, [a3 numberOfGlyphs] <= cid))
    {
      CGFontRef v6 = CTFontCopyGraphicsFont((CTFontRef)a3, 0);
      if (v6)
      {
        CGFontRef v8 = v6;
        if (self->_collection == 255
          || CGFontGetRegistryOrderingSupplement()
          && CFEqual(0, @"Adobe")
          && ((unint64_t v9 = self->_collection - 1, v9 <= 4) ? (v10 = __NSOrderingTable[v9]) : (v10 = &stru_1EDD49F70),
              CFEqual(0, v10)))
        {
          CGFontGetGlyphsForCIDs();
        }
        CFRelease(v8);
        LODWORD(v6) = 0;
      }
    }
    else
    {
      LODWORD(v6) = self->_cid;
    }
  }
  return v6;
}

- (unint64_t)characterIdentifier
{
  return self->_cid;
}

- (unint64_t)characterCollection
{
  return self->_collection;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = self->_cid | (LODWORD(self->_collection) << 24);
  int v6 = self->_cid | (LODWORD(self->_collection) << 24);
  v5.receiver = self;
  v5.super_class = (Class)NSCIDGlyphInfo;
  -[NSGlyphInfo encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if ([a3 allowsKeyedCoding])
  {
    if (v4) {
      [a3 encodeInt32:v4 forKey:@"NSCID_RO"];
    }
  }
  else
  {
    [a3 encodeValueOfObjCType:"i" at:&v6];
  }
}

- (NSCIDGlyphInfo)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    v14.receiver = self;
    v14.super_class = (Class)NSCIDGlyphInfo;
    return [(NSGlyphInfo *)&v14 initWithCoder:a3];
  }
  uint64_t v6 = [a3 versionForClassName:@"NSCIDGlyphInfo"];
  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class() || v6 != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)NSCIDGlyphInfo;
    objc_super v5 = [(NSGlyphInfo *)&v13 initWithCoder:a3];
    unsigned int v12 = 0;
    [a3 decodeValueOfObjCType:"i" at:&v12 size:4];
    unint64_t v9 = v12;
    if (v12)
    {
      v5->_unint64_t cid = v12;
      v5->_collection = v9 >> 24;
    }
    return v5;
  }
  v11 = +[NSGlyphInfo glyphInfoWithGlyph:forFont:baseString:](NSGlyphInfo, "glyphInfoWithGlyph:forFont:baseString:", 0, +[UIFont userFontOfSize:0.0], &stru_1EDD49F70);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  unint64_t collection = self->_collection;
  if (!collection) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"GID 0x%04X", self->_cid, v11, v12, v13);
  }
  unint64_t v4 = collection - 1;
  if (v4 <= 4) {
    CFStringRef v5 = __NSOrderingTable[v4];
  }
  else {
    CFStringRef v5 = &stru_1EDD49F70;
  }
  uint64_t v7 = NSString;
  uint64_t cid = self->_cid;
  CFIndex Length = CFStringGetLength(v5);
  v10 = @"Unspecified";
  if (Length > 0) {
    v10 = @"Adobe-";
  }
  return (id)[v7 stringWithFormat:@"CID 0x%04X, collection %@%@, string \"%@\"", cid, v10, v5, self->super._baseString];
}

@end