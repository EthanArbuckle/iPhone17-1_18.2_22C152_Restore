@interface THModelLink
+ (id)modelLinkWithChapterGUID:(id)a3 context:(id)a4;
- (BOOL)hasAssetID;
- (BOOL)isChapterGuidLink;
- (BOOL)isChapterLink;
- (BOOL)isCustom;
- (BOOL)isDynamic;
- (BOOL)isOrdinary;
- (BOOL)isPageLink;
- (BOOL)isRelative;
- (BOOL)p_fragmentIsFunction:(id)a3;
- (BOOL)p_isCustomApplePubPageLink;
- (BOOL)targetIsApplePub;
- (BOOL)targetIsiBooks;
- (NSString)target;
- (NSURL)url;
- (THModelLink)initWithPath:(id)a3 fragment:(id)a4 context:(id)a5;
- (THModelLink)initWithTarget:(id)a3 context:(id)a4;
- (id)chapterGuidString;
- (id)chapterString;
- (id)description;
- (id)docId;
- (id)docPath;
- (id)docRelativePath;
- (id)fragment;
- (id)p_parameterValueFromFragmentWithFunction:(id)a3;
- (id)pageNumberString;
- (int64_t)customPageIndex;
- (unint64_t)cachedAbsolutePageIndex;
- (void)dealloc;
- (void)setCachedAbsolutePageIndex:(unint64_t)a3;
- (void)setTarget:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation THModelLink

- (THModelLink)initWithTarget:(id)a3 context:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THModelLink;
  v5 = [(THModelLink *)&v8 initWithContext:a4];
  v6 = v5;
  if (v5)
  {
    [(THModelLink *)v5 setTarget:a3];
    [(THModelLink *)v6 setUrl:+[NSURL URLWithString:a3]];
    [(THModelLink *)v6 setCachedAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return v6;
}

- (THModelLink)initWithPath:(id)a3 fragment:(id)a4 context:(id)a5
{
  id v9 = objc_alloc_init((Class)NSURLComponents);
  [v9 setScheme:@"apub"];
  [v9 setPath:a3];
  id v10 = objc_msgSend(objc_msgSend(v9, "URL"), "absoluteString");
  id v11 = v10;
  if (a4) {
    id v11 = [v10 stringByAppendingFormat:@"#%@", a4];
  }

  return [(THModelLink *)self initWithTarget:v11 context:a5];
}

- (void)dealloc
{
  [(THModelLink *)self setUrl:0];
  [(THModelLink *)self setTarget:0];
  v3.receiver = self;
  v3.super_class = (Class)THModelLink;
  [(THModelLink *)&v3 dealloc];
}

+ (id)modelLinkWithChapterGUID:(id)a3 context:(id)a4
{
  if (!a3) {
    return 0;
  }
  v4 = [[THModelLink alloc] initWithTarget:+[NSString stringWithFormat:@"ibooks:///#chapterguid(%@)", a3] context:a4];

  return v4;
}

- (BOOL)targetIsApplePub
{
  v2 = [(NSString *)[(NSURL *)[(THModelLink *)self url] scheme] lowercaseString];
  if (![(NSString *)v2 length]) {
    return 1;
  }

  return [(NSString *)v2 isEqualToString:@"apub"];
}

- (BOOL)targetIsiBooks
{
  v2 = [(NSString *)[(NSURL *)[(THModelLink *)self url] scheme] lowercaseString];

  return [(NSString *)v2 isEqualToString:@"ibooks"];
}

- (id)docPath
{
  if (![(THModelLink *)self targetIsApplePub]) {
    return 0;
  }
  objc_super v3 = [(THModelLink *)self url];

  return [(NSURL *)v3 path];
}

- (id)docId
{
  if (![(THModelLink *)self targetIsApplePub]
    || ![(NSString *)[(NSURL *)[(THModelLink *)self url] path] hasPrefix:@"/"])
  {
    return 0;
  }
  objc_super v3 = [(NSURL *)[(THModelLink *)self url] pathComponents];
  if ([(NSArray *)v3 count] <= 3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelLink docId]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelLink.m") lineNumber:103 description:@"ApplePub URL lacks isbn/uniq/vers at %@", -[NSURL absoluteString](-[THModelLink url](self, "url"), "absoluteString")];
  }
  if ([(NSArray *)v3 count] < 4) {
    return 0;
  }
  v4 = -[NSArray subarrayWithRange:](v3, "subarrayWithRange:", 1, 3);

  return [(NSArray *)v4 componentsJoinedByString:@"/"];
}

- (id)docRelativePath
{
  if (![(THModelLink *)self targetIsApplePub]) {
    return 0;
  }
  unsigned int v3 = [(NSString *)[(NSURL *)[(THModelLink *)self url] path] hasPrefix:@"/"];
  v4 = [(THModelLink *)self url];
  if (v3)
  {
    v5 = [(NSURL *)v4 pathComponents];
    if ([(NSArray *)v5 count] <= 3) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelLink docRelativePath]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelLink.m") lineNumber:119 description:@"ApplePub URL lacks isbn/uniq/vers at %@", -[NSURL absoluteString](-[THModelLink url](self, "url"), "absoluteString")];
    }
    if ([(NSArray *)v5 count] >= 4)
    {
      v6 = -[NSArray subarrayWithRange:](v5, "subarrayWithRange:", 4, (char *)[(NSArray *)v5 count] - 4);
      return [(NSArray *)v6 componentsJoinedByString:@"/"];
    }
    return 0;
  }

  return [(NSURL *)v4 path];
}

- (id)fragment
{
  if (![(THModelLink *)self targetIsApplePub]
    && ![(THModelLink *)self targetIsiBooks])
  {
    return 0;
  }
  unsigned int v3 = [(THModelLink *)self url];

  return [(NSURL *)v3 fragment];
}

- (BOOL)isRelative
{
  if ([(NSString *)[(NSURL *)[(THModelLink *)self url] relativeString] isEqual:[(NSURL *)[(THModelLink *)self url] absoluteString]])return ![(NSString *)[(NSURL *)[(THModelLink *)self url] path] hasPrefix:@"/"]; {
  else
  }
    return 1;
}

- (id)p_parameterValueFromFragmentWithFunction:(id)a3
{
  v4 = [(NSString *)[(NSURL *)[(THModelLink *)self url] fragment] stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet]];
  v5 = [a3 length];
  if (v5 + 2 >= (unsigned char *)[(NSString *)v4 length]) {
    return 0;
  }
  v6 = (char *)((unsigned char *)[(NSString *)v4 length] - v5 - 2);

  return -[NSString substringWithRange:](v4, "substringWithRange:", v5 + 1, v6);
}

- (BOOL)p_fragmentIsFunction:(id)a3
{
  v4 = [(NSString *)[(NSURL *)[(THModelLink *)self url] fragment] stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet]];
  unsigned int v5 = -[NSString hasPrefix:](v4, "hasPrefix:", [a3 stringByAppendingString:@"("];
  if (v5)
  {
    LOBYTE(v5) = [(NSString *)v4 hasSuffix:@""]);
  }
  return v5;
}

- (BOOL)isPageLink
{
  unsigned int v3 = [(NSString *)[(NSURL *)[(THModelLink *)self url] fragment] stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet]];
  if (![(THModelLink *)self targetIsiBooks]
    || ![(NSString *)v3 hasPrefix:@"page(")]
  {
    return 0;
  }

  return [(NSString *)v3 hasSuffix:@""]);
}

- (BOOL)isChapterLink
{
  BOOL v3 = [(THModelLink *)self targetIsiBooks];
  if (v3)
  {
    LOBYTE(v3) = [(THModelLink *)self p_fragmentIsFunction:@"chapter"];
  }
  return v3;
}

- (BOOL)isChapterGuidLink
{
  BOOL v3 = [(THModelLink *)self targetIsiBooks];
  if (v3)
  {
    LOBYTE(v3) = [(THModelLink *)self p_fragmentIsFunction:@"chapterguid"];
  }
  return v3;
}

- (BOOL)hasAssetID
{
  return [[NSURL assetIDFromURL:[self url]] integerValue] != 0;
}

- (id)pageNumberString
{
  if (![(THModelLink *)self isPageLink]) {
    return 0;
  }
  BOOL v3 = [(NSString *)[(NSURL *)[(THModelLink *)self url] fragment] stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceCharacterSet]];
  if (!-[NSString hasPrefix:](v3, "hasPrefix:", @"page(")
    || ![(NSString *)v3 hasSuffix:@""]))
  {
    return 0;
  }
  v4 = (char *)[(NSString *)v3 length] - 6;

  return -[NSString substringWithRange:](v3, "substringWithRange:", 5, v4);
}

- (id)chapterString
{
  if (![(THModelLink *)self isChapterLink]) {
    return 0;
  }

  return [(THModelLink *)self p_parameterValueFromFragmentWithFunction:@"chapter"];
}

- (id)chapterGuidString
{
  if (![(THModelLink *)self isChapterGuidLink]) {
    return 0;
  }

  return [(THModelLink *)self p_parameterValueFromFragmentWithFunction:@"chapterguid"];
}

- (BOOL)p_isCustomApplePubPageLink
{
  unsigned int v3 = [(THModelLink *)self targetIsApplePub];
  if (v3)
  {
    id v4 = [(THModelLink *)self fragment];
    LOBYTE(v3) = [v4 hasPrefix:@"x-apple-internal-absolutepageindex-"];
  }
  return v3;
}

- (BOOL)isCustom
{
  unsigned int v3 = [(THModelLink *)self targetIsApplePub];
  if (v3)
  {
    id v4 = [(THModelLink *)self fragment];
    LOBYTE(v3) = [v4 hasPrefix:@"x-apple-"];
  }
  return v3;
}

- (int64_t)customPageIndex
{
  if (![(THModelLink *)self p_isCustomApplePubPageLink]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v3 = [[-[THModelLink fragment](self, "fragment") substringFromIndex:[@"x-apple-internal-absolutepageindex-" length]]];

  return (int64_t)[v3 integerValue];
}

- (BOOL)isDynamic
{
  unsigned int v3 = [(THModelLink *)self targetIsApplePub];
  if (v3)
  {
    id v4 = [(THModelLink *)self fragment];
    LOBYTE(v3) = [v4 hasPrefix:@"xpointer"];
  }
  return v3;
}

- (BOOL)isOrdinary
{
  if ([(THModelLink *)self isCustom]) {
    return 0;
  }
  else {
    return ![(THModelLink *)self isDynamic];
  }
}

- (id)description
{
  unsigned int v3 = [(THModelLink *)self target];
  if ([(THModelLink *)self cachedAbsolutePageIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    CFStringRef v4 = &stru_46D7E8;
  }
  else {
    CFStringRef v4 = +[NSString stringWithFormat:@" @p%ud", [(THModelLink *)self cachedAbsolutePageIndex]];
  }
  return +[NSString stringWithFormat:@"<link:%@%@>", v3, v4];
}

- (NSString)target
{
  return self->mTarget;
}

- (void)setTarget:(id)a3
{
}

- (NSURL)url
{
  return self->mURL;
}

- (void)setUrl:(id)a3
{
}

- (unint64_t)cachedAbsolutePageIndex
{
  return self->mCachedAbsolutePageIndex;
}

- (void)setCachedAbsolutePageIndex:(unint64_t)a3
{
  self->mCachedAbsolutePageIndex = a3;
}

@end