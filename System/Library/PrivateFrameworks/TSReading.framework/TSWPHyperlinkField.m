@interface TSWPHyperlinkField
+ (BOOL)schemeIsValidForURL:(id)a3;
+ (BOOL)schemeIsValidForURLReference:(id)a3;
+ (id)defaultFieldStyleIdentifier;
+ (id)defaultFileURL;
+ (id)defaultMailURL;
+ (id)defaultURLFromDefaultsKey:(id)a3 defaultValue:(id)a4;
+ (id)defaultWebURL;
+ (id)newURLFromURLReference:(id)a3;
+ (id)urlReferenceFromURL:(id)a3;
+ (int)schemeFromURL:(id)a3;
- (BOOL)allowsEditing;
- (BOOL)hasDisplayText;
- (BOOL)isFileURL;
- (NSString)displayText;
- (NSURL)url;
- (TSWPHyperlinkField)initWithContext:(id)a3 url:(id)a4;
- (id)canonicalRepresentationURL;
- (id)copyWithContext:(id)a3;
- (id)filePath;
- (id)fullPath;
- (id)urlPrefix;
- (id)urlReference;
- (int)elementKind;
- (int)scheme;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)dealloc;
- (void)setURL:(id)a3;
- (void)setURLReference:(id)a3;
@end

@implementation TSWPHyperlinkField

- (void)setURL:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->_url = (NSURL *)a3;
}

+ (id)defaultFieldStyleIdentifier
{
  return @"character-style-hyperlink";
}

- (NSString)displayText
{
  result = [(TSWPSmartField *)self parentStorage];
  if (result)
  {
    v4 = [(TSWPSmartField *)self parentStorage];
    uint64_t v6 = [(TSWPSmartField *)self range];
    return (NSString *)-[TSWPStorage substringWithRange:](v4, "substringWithRange:", v6, v5);
  }
  return result;
}

+ (int)schemeFromURL:(id)a3
{
  if (!a3) {
    return 8;
  }
  v4 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if (v4)
  {
    uint64_t v5 = v4;
    if (([v4 isEqualToString:@"http"] & 1) != 0
      || ([v5 isEqualToString:@"https"] & 1) != 0)
    {
      return 0;
    }
    else if (([v5 isEqualToString:@"file"] & 1) != 0 {
           || ([v5 isEqualToString:@"keynote"] & 1) != 0)
    }
    {
      return 1;
    }
    else if ([v5 isEqualToString:@"mailto"])
    {
      return 2;
    }
    else if ([v5 isEqualToString:@"tel"])
    {
      return 7;
    }
    else if ([v5 isEqualToString:@"pages"])
    {
      return 4;
    }
    else
    {
      return 8;
    }
  }
  else
  {
    v7 = (void *)[a3 absoluteString];
    int v6 = 8;
    if (v7)
    {
      v8 = v7;
      int v9 = [v7 rangeOfString:@"#"] ? 8 : 3;
      uint64_t v10 = [v8 rangeOfString:@"?slide="];
      uint64_t v11 = [v8 rangeOfString:@"?action=retreat"];
      BOOL v12 = !v10 || v11 == 0;
      int v6 = v12 ? 5 : v9;
      if (![v8 rangeOfString:@"?action=exitpresentation"]) {
        return 6;
      }
    }
  }
  return v6;
}

- (id)canonicalRepresentationURL
{
  unsigned int v3 = [(TSWPHyperlinkField *)self scheme];
  if (v3 > 7 || ((1 << v3) & 0x87) == 0) {
    return 0;
  }
  return [(TSWPHyperlinkField *)self url];
}

+ (BOOL)schemeIsValidForURL:(id)a3
{
  v4 = objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "invalidURLSchemes");
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if (v5) {
    LOBYTE(v5) = [v4 member:v5] == 0;
  }
  return v5;
}

+ (BOOL)schemeIsValidForURLReference:(id)a3
{
  uint64_t v3 = [objc_alloc(NSURL) initWithString:a3];
  if (v3)
  {
    v4 = (void *)v3;
    char v5 = [(id)objc_opt_class() schemeIsValidForURL:v3];

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (id)defaultURLFromDefaultsKey:(id)a3 defaultValue:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", a3);
  if (!v5
    || (int v6 = (void *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ![v6 length]
    || (id result = (id)[NSURL URLWithString:v6]) == 0)
  {
    v8 = NSURL;
    return (id)[v8 URLWithString:a4];
  }
  return result;
}

+ (id)defaultWebURL
{
  uint64_t v3 = [(id)TSWPBundle() localizedStringForKey:@"http://www.apple.com" value:&stru_26D688A48 table:@"TSText"];
  return (id)[a1 defaultURLFromDefaultsKey:@"DefaultWebURL" defaultValue:v3];
}

+ (id)defaultFileURL
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"DefaultFileURL");
  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v3 length]) {
    return 0;
  }
  v4 = NSURL;
  return (id)[v4 fileURLWithPath:v3];
}

+ (id)defaultMailURL
{
  return (id)[a1 defaultURLFromDefaultsKey:@"DefaultMailURL" defaultValue:@"mailto:no_reply@apple.com"];
}

+ (id)urlReferenceFromURL:(id)a3
{
  if (!a3) {
    return 0;
  }
  if ([a3 isFileURL])
  {
    v4 = (__CFString *)CFURLCopyFileSystemPath((CFURLRef)a3, kCFURLPOSIXPathStyle);
    if (v4
      && (uint64_t v5 = v4,
          CFStringRef v6 = (const __CFString *)[(__CFString *)v4 stringByAbbreviatingWithTildeInPath], CFRelease(v5), (v7 = CFURLCreateStringByAddingPercentEscapes(0, v6, 0, 0, 0x8000100u)) != 0))
    {
      CFStringRef v8 = v7;
      int v9 = (void *)[NSString stringWithFormat:@"file://%@", v7];
      CFRelease(v8);
    }
    else
    {
      int v9 = 0;
    }
    if (v9) {
      return v9;
    }
    else {
      return @"file://";
    }
  }
  else
  {
    return (id)[a3 absoluteString];
  }
}

+ (id)newURLFromURLReference:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (![a3 hasPrefix:@"file://"])
  {
    id result = (id)[objc_alloc(NSURL) initWithString:a3];
    if (result) {
      return result;
    }
    uint64_t v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"+[TSWPHyperlinkField newURLFromURLReference:]"];
    [v10 handleFailureInFunction:v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPHyperlinkField.mm"), 394, @"Failed to create an NSURL from \"%@\"", a3 file lineNumber description];
    if ([a3 hasPrefix:@"mailto:"])
    {
      id v12 = +[TSWPHyperlinkField defaultMailURL];
      goto LABEL_18;
    }
    return 0;
  }
  v4 = (__CFString *)[a3 substringFromIndex:objc_msgSend(@"file://", "length")];
  if (!v4) {
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  if (![(__CFString *)v4 length]) {
    goto LABEL_14;
  }
  CFStringRef v6 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v5, &stru_26D688A48);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFStringRef v8 = (__CFString *)[(__CFString *)v6 stringByExpandingTildeInPath];
    CFRelease(v7);
    if (!v8) {
      goto LABEL_14;
    }
  }
  else
  {
    CFStringRef v8 = (__CFString *)[(__CFString *)v5 stringByExpandingTildeInPath];
    if (!v8)
    {
LABEL_14:
      CFStringRef v8 = @"/";
      goto LABEL_15;
    }
  }
  if (![(__CFString *)v8 length]) {
    goto LABEL_14;
  }
LABEL_15:
  id result = (id)MEMORY[0x223CB7200](0, v8, 0, 0, 0);
  if (result) {
    return result;
  }
  v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v14 = [NSString stringWithUTF8String:"+[TSWPHyperlinkField newURLFromURLReference:]"];
  [v13 handleFailureInFunction:v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPHyperlinkField.mm"), 384, @"Failed to create a CFURL from path \"%@\"", v8 file lineNumber description];
  id v12 = +[TSWPHyperlinkField defaultFileURL];
LABEL_18:
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPHyperlinkField;
  [(TSWPSmartField *)&v3 dealloc];
}

- (TSWPHyperlinkField)initWithContext:(id)a3 url:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPHyperlinkField;
  uint64_t v5 = [(TSWPSmartField *)&v8 initWithContext:a3];
  CFStringRef v6 = v5;
  if (v5) {
    [(TSWPHyperlinkField *)v5 setURL:a4];
  }
  return v6;
}

- (id)copyWithContext:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPHyperlinkField zone](self, "zone"));
  url = self->_url;
  return (id)[v5 initWithContext:a3 url:url];
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPHyperlinkField;
  [(TSWPSmartField *)&v4 adoptStylesheet:a3 withMapper:a4];
}

- (int)elementKind
{
  return 512;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (NSURL)url
{
  id result = self->_url;
  if (!result)
  {
    uint64_t v4 = [(TSWPSmartField *)self range];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      CFStringRef v6 = objc_msgSend((id)objc_opt_class(), "newURLFromURLReference:", -[TSWPStorage substringWithRange:](-[TSWPSmartField parentStorage](self, "parentStorage"), "substringWithRange:", v4, v5));
      return (NSURL *)v6;
    }
  }
  return result;
}

- (id)urlReference
{
  if (self->_url)
  {
    objc_super v3 = objc_opt_class();
    url = self->_url;
    return (id)[v3 urlReferenceFromURL:url];
  }
  else
  {
    uint64_t v6 = [(TSWPSmartField *)self range];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return 0;
    }
    else
    {
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = [(TSWPSmartField *)self parentStorage];
      return -[TSWPStorage substringWithRange:](v10, "substringWithRange:", v8, v9);
    }
  }
}

- (void)setURLReference:(id)a3
{
  uint64_t v4 = [(id)objc_opt_class() newURLFromURLReference:a3];
  if (v4)
  {
    id v5 = (id)v4;
    [(TSWPHyperlinkField *)self setURL:v4];
  }
}

- (int)scheme
{
  objc_super v3 = objc_opt_class();
  uint64_t v4 = [(TSWPHyperlinkField *)self url];
  return [v3 schemeFromURL:v4];
}

- (id)urlPrefix
{
  uint64_t v2 = [(NSURL *)[(TSWPHyperlinkField *)self url] absoluteString];
  if (!v2) {
    return &stru_26D688A48;
  }
  objc_super v3 = v2;
  uint64_t v4 = [(NSString *)v2 length];
  unint64_t v5 = -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 58, 0, v4);
  if (!v5) {
    return &stru_26D688A48;
  }
  unint64_t v6 = v5;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || v5 >= -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 47, 0, v4)
    || v6 >= -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 63, 0, v4)
    || v6 >= -[NSString findIndexOfCharacter:range:](v3, "findIndexOfCharacter:range:", 35, 0, v4))
  {
    return &stru_26D688A48;
  }
  return -[NSString substringWithRange:](v3, "substringWithRange:", 0, v6);
}

- (BOOL)isFileURL
{
  uint64_t v2 = [(TSWPHyperlinkField *)self url];
  return [(NSURL *)v2 isFileURL];
}

- (BOOL)hasDisplayText
{
  return self->_url != 0;
}

- (id)filePath
{
  uint64_t v2 = [(TSWPHyperlinkField *)self url];
  if (![(NSURL *)v2 isFileURL]) {
    return 0;
  }
  objc_super v3 = (__CFString *)CFURLCopyFileSystemPath((CFURLRef)v2, kCFURLPOSIXPathStyle);
  uint64_t v4 = v3;
  return v3;
}

- (id)fullPath
{
  id v2 = [(TSWPHyperlinkField *)self filePath];
  objc_super v3 = v2;
  if (!v2) {
    return v3;
  }
  if ([v2 isAbsolutePath]) {
    return v3;
  }
  uint64_t v4 = (void *)[@"~" stringByExpandingTildeInPath];
  if (!v4) {
    return v3;
  }
  return (id)[v4 stringByAppendingPathComponent:v3];
}

@end