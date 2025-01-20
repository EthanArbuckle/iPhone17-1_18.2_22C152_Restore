@interface WFWebPageDecorator
+ (id)_plainTextWithSelector:(SEL)a3 object:(id)a4;
+ (id)plainTextWithWebPageData:(id)a3;
+ (id)plainTextWithWebPageString:(id)a3;
+ (id)webPageWithData:(id)a3;
+ (id)webPageWithData:(id)a3 URLString:(id)a4;
+ (id)webPageWithString:(id)a3;
+ (id)webPageWithString:(id)a3 URLString:(id)a4;
- (BOOL)hasFrameset;
- (BOOL)hasShortRefresh;
- (NSString)URLString;
- (WFWebPageDecorator)initWithWebPageData:(id)a3;
- (WFWebPageDecorator)initWithWebPageString:(id)a3;
- (WFWebPageDecorator)initWithWebPageStripper:(id)a3;
- (id)imageAltsText;
- (id)images;
- (id)linkTitlesText;
- (id)links;
- (id)metaTagDescription;
- (id)metaTagKeywords;
- (id)metaTagsLabeled;
- (id)metaTagsUnlabeled;
- (id)pageContent;
- (id)pageTitle;
- (id)plainText;
- (id)plainTextAttributeWithSelector:(SEL)a3 title:(id)a4;
- (id)plainTextAttributeWithSelector:(SEL)a3 title:(id)a4 weight:(int)a5;
- (id)rawPlainText;
- (id)scriptBlocks;
- (id)tags;
- (int64_t)numberOfImages;
- (int64_t)numberOfKnownImagePixels;
- (int64_t)numberOfUnknownSizedImages;
- (int64_t)wordCount;
- (void)_cacheImgProperties;
- (void)dealloc;
- (void)setURLString:(id)a3;
@end

@implementation WFWebPageDecorator

+ (id)_plainTextWithSelector:(SEL)a3 object:(id)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  if (objc_opt_respondsToSelector())
  {
    v7 = (void *)[v6 performSelector:a3 withObject:a4];
    v8 = (void *)[v7 plainText];

    return v8;
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() description];
    v11 = NSStringFromSelector(a3);
    NSLog(&cfstr_DoesnTAsnwerTo.isa, v10, v11);
    return &stru_26C7AC028;
  }
}

+ (id)plainTextWithWebPageData:(id)a3
{
  v4 = objc_opt_class();
  return (id)[v4 _plainTextWithSelector:sel_initWithWebPageData_ object:a3];
}

+ (id)plainTextWithWebPageString:(id)a3
{
  v4 = objc_opt_class();
  return (id)[v4 _plainTextWithSelector:sel_initWithWebPageString_ object:a3];
}

+ (id)webPageWithData:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWebPageData:a3];
  return v3;
}

+ (id)webPageWithData:(id)a3 URLString:(id)a4
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWebPageData:a3];
  [v5 setURLString:a4];
  return v5;
}

+ (id)webPageWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWebPageString:a3];
  return v3;
}

+ (id)webPageWithString:(id)a3 URLString:(id)a4
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWebPageString:a3];
  [v5 setURLString:a4];
  return v5;
}

- (WFWebPageDecorator)initWithWebPageData:(id)a3
{
  id v4 = +[WFTreeHTMLStripper treeStripperWithData:a3];
  return [(WFWebPageDecorator *)self initWithWebPageStripper:v4];
}

- (WFWebPageDecorator)initWithWebPageString:(id)a3
{
  id v4 = +[WFTreeHTMLStripper treeStripperWithString:a3];
  return [(WFWebPageDecorator *)self initWithWebPageStripper:v4];
}

- (WFWebPageDecorator)initWithWebPageStripper:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFWebPageDecorator;
  id v4 = [(WFWebPageDecorator *)&v6 init];
  if (v4) {
    v4->webPageStripper = (WFWebPageProtocol *)a3;
  }
  return v4;
}

- (id)pageTitle
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper pageTitle];
}

- (id)metaTagDescription
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper metaTagDescription];
}

- (id)metaTagKeywords
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper metaTagKeywords];
}

- (id)metaTagsLabeled
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper metaTagsLabeled];
}

- (id)metaTagsUnlabeled
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper metaTagsUnlabeled];
}

- (id)scriptBlocks
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper scriptBlocks];
}

- (id)images
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper images];
}

- (id)pageContent
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper pageContent];
}

- (id)links
{
  return (id)[(WFWebPageProtocol *)self->webPageStripper links];
}

- (BOOL)hasFrameset
{
  return [(WFWebPageProtocol *)self->webPageStripper hasFrameset];
}

- (BOOL)hasShortRefresh
{
  return [(WFWebPageProtocol *)self->webPageStripper hasShortRefresh];
}

- (void)_cacheImgProperties
{
  if (!self->pageImagesPropertyCache) {
    self->pageImagesPropertyCache = [[WFImgArrayCache alloc] initWithArray:[(WFWebPageDecorator *)self images]];
  }
}

- (int64_t)numberOfImages
{
  id v2 = [(WFWebPageDecorator *)self images];
  return [v2 count];
}

- (id)imageAltsText
{
  [(WFWebPageDecorator *)self _cacheImgProperties];
  pageImagesPropertyCache = self->pageImagesPropertyCache;
  return [(WFImgArrayCache *)pageImagesPropertyCache imageAlternativeDescriptions];
}

- (int64_t)numberOfUnknownSizedImages
{
  [(WFWebPageDecorator *)self _cacheImgProperties];
  pageImagesPropertyCache = self->pageImagesPropertyCache;
  return [(WFImgArrayCache *)pageImagesPropertyCache numberOfUnknownSizedImages];
}

- (int64_t)numberOfKnownImagePixels
{
  [(WFWebPageDecorator *)self _cacheImgProperties];
  pageImagesPropertyCache = self->pageImagesPropertyCache;
  return [(WFImgArrayCache *)pageImagesPropertyCache numberOfKnownImagePixels];
}

- (id)linkTitlesText
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263F089D8] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(WFWebPageDecorator *)self links];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) title];
        if (v9) {
          [v3 appendFormat:@"%@\n", v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (int64_t)wordCount
{
  return 0;
}

- (id)tags
{
  return +[WFTagFactory tagsForWebpage:self];
}

- (id)plainTextAttributeWithSelector:(SEL)a3 title:(id)a4
{
  return [(WFWebPageDecorator *)self plainTextAttributeWithSelector:a3 title:a4 weight:1];
}

- (id)plainTextAttributeWithSelector:(SEL)a3 title:(id)a4 weight:(int)a5
{
  uint64_t v9 = objc_opt_new();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (uint64_t v10 = [(WFWebPageDecorator *)self performSelector:a3]) != 0)
  {
    long long v11 = (__CFString *)v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v11 = (__CFString *)objc_msgSend(NSString, "WF_stringFromArray:", v11);
    }
  }
  else
  {
    long long v11 = &stru_26C7AC028;
  }
  [v9 appendString:a4];
  [v9 appendString:@"\n"];
  if (a5 >= 1)
  {
    do
    {
      [v9 appendString:v11];
      [v9 appendString:@"\n"];
      --a5;
    }
    while (a5);
  }
  return v9;
}

- (id)rawPlainText
{
  v3 = objc_opt_new();
  [v3 appendString:@"[WFWebPageDecorator rawPlainText]"];
  [v3 appendString:@"\n"];
  [v3 appendString:@"\n"];
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageTitle, @"======= pageTitle ======="));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_tags, @"======= tags ======="));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_metaTagDescription, @"======= metaTagDescription =======\n"));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_metaTagKeywords, @"======= metaTagKeywords =======\n"));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_scriptBlocks, @"======= scriptBlocks (array) =======\n"));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_imageAltsText, @"======= imageAltsText (array) =======\n"));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageContent, @"======= pageContent =======\n"));
  return v3;
}

- (id)plainText
{
  id v2 = [(WFWebPageDecorator *)self rawPlainText];
  return +[WFPostprocessor postprocessPlainTextWebPage:v2];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFWebPageDecorator;
  [(WFWebPageDecorator *)&v3 dealloc];
}

- (NSString)URLString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setURLString:(id)a3
{
}

@end