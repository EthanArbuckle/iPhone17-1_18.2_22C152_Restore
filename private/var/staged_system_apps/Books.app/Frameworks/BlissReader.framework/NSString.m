@interface NSString
+ (NSString)stringWithUUID;
+ (NSString)stringWithXmlString:(const char *)a3;
+ (id)stringFromNSIndexPath:(id)a3;
+ (int64_t)normalizedCompare:(id)a3 with:(id)a4;
- (BOOL)doesURLHostContainWhitespace;
- (BOOL)isEqualToXmlString:(const char *)a3;
- (BOOL)startsWithString:(id)a3;
- (CGSize)sizeWithParagraphStyle:(id)a3;
- (NSString)initWithContentOfXmlNode:(_xmlNode *)a3;
- (NSString)initWithValueOfXmlAttribute:(_xmlAttr *)a3;
- (NSString)initWithXmlString:(const char *)a3;
- (NSString)stringWithURLFromCssUriValue;
- (id)componentsSeparatedByWhitespace;
- (id)initFromXmlNode:(_xmlNode *)a3 ns:(const char *)a4 attributeName:(const char *)a5;
- (id)normalizedStringForSearch;
- (id)normalizedStringsForPrefixSearch;
- (id)stringByFixingCharactersWithLatinFontFamilyName:(id)a3 symbolFontFamilyName:(id)a4;
- (id)stringByTransformingForTHNotesSectionHeader;
- (unsigned)createQueryString;
@end

@implementation NSString

+ (id)stringFromNSIndexPath:(id)a3
{
  v4 = (char *)[a3 length];
  id v5 = +[NSMutableString string];
  if (v4)
  {
    v6 = v4 - 1;
    if (v6)
    {
      v7 = v6;
      do
      {
        [v5 appendFormat:@"%lu."];
        --v7;
      }
      while (v7);
    }
    [v5 appendFormat:@"%lu" [a3 indexAtPosition:v6]];
  }
  return v5;
}

- (CGSize)sizeWithParagraphStyle:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  CFAttributedStringRef v5 = (const __CFAttributedString *)[objc_alloc((Class)NSAttributedString) initWithString:self paragraphStyle:a3];
  CTTypesetterRef v6 = CTTypesetterCreateWithAttributedString(v5);
  if (v6)
  {
    v7 = v6;
    v16.length = (CFIndex)[(__CFAttributedString *)v5 length];
    v16.location = 0;
    Line = CTTypesetterCreateLine(v7, v16);
    if (Line)
    {
      v9 = Line;
      double v14 = 0.0;
      CGFloat ascent = 0.0;
      float TypographicBounds = CTLineGetTypographicBounds(Line, &ascent, &v14, 0);
      double width = ceilf(TypographicBounds);
      float v11 = ascent + v14;
      double height = ceilf(v11);
      CFRelease(v9);
    }
    CFRelease(v7);
  }

  double v12 = width;
  double v13 = height;
  result.double height = v13;
  result.double width = v12;
  return result;
}

+ (int64_t)normalizedCompare:(id)a3 with:(id)a4
{
  if (a3 == a4) {
    return 0;
  }
  uint64_t v12 = v5;
  uint64_t v13 = v4;
  if (!a3)
  {
    v9 = &stru_46D7E8;
    if (a4) {
      goto LABEL_4;
    }
LABEL_7:
    CFStringRef v10 = &stru_46D7E8;
    goto LABEL_8;
  }
  v9 = (__CFString *)[a3 normalizedStringForSearch];
  if (!a4) {
    goto LABEL_7;
  }
LABEL_4:
  CFStringRef v10 = (const __CFString *)[a4 normalizedStringForSearch:v12 withOptions:v13 withLocale:v6];
LABEL_8:
  return (int64_t)[(__CFString *)v9 localizedCaseInsensitiveCompare:v10];
}

- (id)normalizedStringForSearch
{
  v3 = [[(NSString *)self stringByFoldingWithOptions:1 locale:+[NSLocale currentLocale](NSLocale, "currentLocale")] componentsSeparatedByCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  id v4 = [objc_alloc((Class)NSMutableString) initWithCapacity:-[NSString length](self, "length")];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 length])
        {
          if ([v4 length]) {
            [v4 appendString:@" "];
          }
          [v4 appendString:v9];
        }
      }
      id v6 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)normalizedStringsForPrefixSearch
{
  v2 = [[(NSString *)self stringByFoldingWithOptions:1 locale:+[NSLocale currentLocale](NSLocale, "currentLocale")] componentsSeparatedByCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](v2, "count")];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 length])
        {
          if ([v3 count])
          {
            unint64_t v9 = 0;
            do
            {
              [v3 replaceObjectAtIndex:v9, objc_msgSend(objc_msgSend(v3, "objectAtIndex:", v9), "stringByAppendingFormat:", @" %@", v8) withObject];
              ++v9;
            }
            while (v9 < (unint64_t)[v3 count]);
          }
          [v3 addObject:v8];
        }
      }
      id v5 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)stringByTransformingForTHNotesSectionHeader
{
  id v3 = +[NSCharacterSet whitespaceCharacterSet];

  return [(NSString *)self stringByTrimmingCharactersInSet:v3];
}

+ (NSString)stringWithUUID
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  id v3 = (__CFString *)CFUUIDCreateString(0, v2);
  CFRelease(v2);

  return (NSString *)v3;
}

- (NSString)stringWithURLFromCssUriValue
{
  id v3 = (char *)[(NSString *)self length] - 5;

  return -[NSString substringWithRange:](self, "substringWithRange:", 4, v3);
}

- (id)stringByFixingCharactersWithLatinFontFamilyName:(id)a3 symbolFontFamilyName:(id)a4
{
}

- (BOOL)startsWithString:(id)a3
{
  id v3 = [(NSString *)self rangeOfString:a3];
  return v4 && v3 == 0;
}

- (BOOL)doesURLHostContainWhitespace
{
  id v2 = [objc_alloc((Class)NSURL) initWithString:self];
  if ([v2 host]) {
    BOOL v3 = objc_msgSend(objc_msgSend(v2, "host"), "rangeOfCharacterFromSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")) != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (NSString)initWithXmlString:(const char *)a3
{
  if (a3)
  {
    return -[NSString initWithUTF8String:](self, "initWithUTF8String:");
  }
  else
  {

    return 0;
  }
}

+ (NSString)stringWithXmlString:(const char *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithXmlString:a3];

  return (NSString *)v3;
}

- (NSString)initWithValueOfXmlAttribute:(_xmlAttr *)a3
{
  String = xmlNodeListGetString(a3->doc, a3->children, 1);
  if (String)
  {
    id v5 = String;
    uint64_t v6 = [(NSString *)self initWithXmlString:String];
    xmlFree(v5);
    return v6;
  }
  else
  {
    return [(NSString *)self init];
  }
}

- (NSString)initWithContentOfXmlNode:(_xmlNode *)a3
{
  Content = xmlNodeGetContent(a3);
  if (Content)
  {
    id v5 = Content;
    uint64_t v6 = [(NSString *)self initWithXmlString:Content];
    xmlFree(v5);
    return v6;
  }
  else
  {
    return [(NSString *)self init];
  }
}

- (id)initFromXmlNode:(_xmlNode *)a3 ns:(const char *)a4 attributeName:(const char *)a5
{
  NsProp = xmlGetNsProp(a3, (const xmlChar *)a5, (const xmlChar *)a4);
  if (NsProp)
  {
    uint64_t v7 = NsProp;
    v8 = [(NSString *)self initWithXmlString:NsProp];
    xmlFree(v7);
    return v8;
  }
  else
  {

    return 0;
  }
}

- (id)componentsSeparatedByWhitespace
{
  id v3 = +[NSMutableArray array];
  unint64_t v4 = [(NSString *)self length];
  unint64_t v5 = 0;
  if (!v4) {
    goto LABEL_10;
  }
  do
  {
    unsigned int v6 = [(NSString *)self characterAtIndex:v5];
    if (v6 <= 0x7F)
    {
      if ((_DefaultRuneLocale.__runetype[v6] & 0x4000) == 0) {
        goto LABEL_8;
      }
    }
    else if (!__maskrune(v6, 0x4000uLL))
    {
      goto LABEL_8;
    }
    ++v5;
  }
  while (v4 != v5);
  unint64_t v5 = v4;
LABEL_8:
  if (v5) {
    [v3 addObject:&stru_46D7E8];
  }
LABEL_10:
  while (v5 < v4)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v7;
      uint64_t v9 = v5 + v7;
      if (v5 + v7 + 1 >= v4) {
        break;
      }
      unsigned int v10 = -[NSString characterAtIndex:](self, "characterAtIndex:");
      __uint32_t v11 = v10 <= 0x7F ? _DefaultRuneLocale.__runetype[v10] & 0x4000 : __maskrune(v10, 0x4000uLL);
      uint64_t v7 = v8 + 1;
    }
    while (!v11);
    [v3 addObject:[self substringWithRange:v5, v8 + 1]];
    unint64_t v5 = v9 + 2;
    if (v9 + 2 < v4)
    {
      do
      {
        unsigned int v12 = [(NSString *)self characterAtIndex:v5];
        if (v12 <= 0x7F)
        {
          if ((_DefaultRuneLocale.__runetype[v12] & 0x4000) == 0) {
            goto LABEL_10;
          }
        }
        else if (!__maskrune(v12, 0x4000uLL))
        {
          goto LABEL_10;
        }
        ++v5;
      }
      while (v5 < v4);
      goto LABEL_25;
    }
  }
  if (v5 != v4) {
    return v3;
  }
LABEL_25:
  [v3 addObject:&stru_46D7E8];
  return v3;
}

- (BOOL)isEqualToXmlString:(const char *)a3
{
  unint64_t v4 = +[NSString stringWithUTF8String:a3];

  return [(NSString *)self isEqualToString:v4];
}

- (unsigned)createQueryString
{
  id v3 = [(NSString *)self lowercaseString];
  NSUInteger v4 = [(NSString *)self length];
  unint64_t v5 = (unsigned __int16 *)malloc_type_calloc(v4 + 1, 2uLL, 0x1000040BDFB0063uLL);
  -[NSString getCharacters:range:](v3, "getCharacters:range:", v5, 0, v4);
  return v5;
}

@end