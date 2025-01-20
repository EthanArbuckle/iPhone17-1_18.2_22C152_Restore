@interface CMStylingArchiveManager
- (CMStylingArchiveManager)init;
- (id)addCssStyle:(id)a3;
- (id)commitStylesheet;
- (id)cssStylesheetString;
- (void)addCssStyle:(id)a3 withName:(id)a4;
@end

@implementation CMStylingArchiveManager

- (CMStylingArchiveManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)CMStylingArchiveManager;
  v2 = [(CMArchiveManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mCssString = v2->mCssString;
    v2->mCssString = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mStyleCache = v2->mStyleCache;
    v2->mStyleCache = v5;
  }
  return v2;
}

- (id)addCssStyle:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->mStyleCache objectForKey:v4];
  if (!v5)
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"s%lu", -[NSMutableDictionary count](self->mStyleCache, "count"));
    [(NSMutableDictionary *)self->mStyleCache setObject:v5 forKey:v4];
    v6 = [NSString stringWithFormat:@".%@.%@.%@ {%@}\n", v5, v5, v5, v4];
    [(NSMutableString *)self->mCssString appendString:v6];
  }
  return v5;
}

- (void)addCssStyle:(id)a3 withName:(id)a4
{
  id v5 = [NSString stringWithFormat:@".%@ {%@}\n", a4, a3];
  -[NSMutableString appendString:](self->mCssString, "appendString:");
}

- (id)commitStylesheet
{
  if ([(NSMutableString *)self->mCssString length])
  {
    [(NSMutableString *)self->mCssString insertString:@"<style type=\"text/css\">\n" atIndex:0];
    [(NSMutableString *)self->mCssString appendString:@"</style>"];
    v3 = (void *)[(NSMutableString *)self->mCssString copy];
    id v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mCssString = self->mCssString;
    self->mCssString = v4;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)cssStylesheetString
{
  v2 = (void *)[(NSMutableString *)self->mCssString copy];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyleCache, 0);
  objc_storeStrong((id *)&self->mCssString, 0);
}

@end