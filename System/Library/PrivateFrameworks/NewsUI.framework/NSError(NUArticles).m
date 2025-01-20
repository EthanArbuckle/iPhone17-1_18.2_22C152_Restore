@interface NSError(NUArticles)
+ (id)nu_errorArticleContentTypeUnsupported:()NUArticles;
+ (id)nu_errorArticleDownloadFailed:()NUArticles underlyingError:;
+ (id)nu_errorArticleMissingContentURL:()NUArticles;
+ (id)nu_errorArticleMissingHeadline:()NUArticles;
@end

@implementation NSError(NUArticles)

+ (id)nu_errorArticleMissingHeadline:()NUArticles
{
  v13[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F087E8];
  v12[0] = @"articleId";
  uint64_t v4 = [a3 articleID];
  v5 = (void *)v4;
  v6 = @"nil";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v13[0] = v6;
  v12[1] = *MEMORY[0x263F08320];
  v7 = NUBundle();
  v8 = [v7 localizedStringForKey:@"Article did not load a headline" value:&stru_26D495918 table:0];
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = [v3 errorWithDomain:@"NUNewsUIErrorDomain" code:-1 userInfo:v9];

  return v10;
}

+ (id)nu_errorArticleContentTypeUnsupported:()NUArticles
{
  v18[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = NUBundle();
  v5 = [v4 localizedStringForKey:@"Article content type %llu is not supported by article viewer" value:&stru_26D495918 table:0];

  v6 = objc_msgSend(NSString, "stringWithFormat:", v5, objc_msgSend(v3, "contentType"));
  v7 = (void *)MEMORY[0x263F087E8];
  v17[0] = @"articleId";
  uint64_t v8 = [v3 identifier];
  v9 = (void *)v8;
  v10 = @"nil";
  if (v8) {
    v10 = (__CFString *)v8;
  }
  v18[0] = v10;
  v17[1] = @"contentType";
  v11 = NSNumber;
  uint64_t v12 = [v3 contentType];

  v13 = [v11 numberWithUnsignedLongLong:v12];
  v17[2] = *MEMORY[0x263F08320];
  v18[1] = v13;
  v18[2] = v6;
  v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];
  v15 = [v7 errorWithDomain:@"NUNewsUIErrorDomain" code:-2 userInfo:v14];

  return v15;
}

+ (id)nu_errorArticleMissingContentURL:()NUArticles
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F087E8];
  v12[0] = @"articleId";
  uint64_t v4 = [a3 identifier];
  v5 = (void *)v4;
  v6 = @"nil";
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v13[0] = v6;
  v12[1] = *MEMORY[0x263F08320];
  v7 = NUBundle();
  uint64_t v8 = [v7 localizedStringForKey:@"Article missing content URL needed to load web view" value:&stru_26D495918 table:0];
  v13[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v10 = [v3 errorWithDomain:@"NUNewsUIErrorDomain" code:-3 userInfo:v9];

  return v10;
}

+ (id)nu_errorArticleDownloadFailed:()NUArticles underlyingError:
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  uint64_t v8 = [v6 dictionary];
  v9 = [v7 articleID];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = @"nil";
  }
  [v8 setObject:v10 forKeyedSubscript:@"articleId"];

  v11 = NUBundle();
  uint64_t v12 = [v11 localizedStringForKey:@"Article download failed" value:&stru_26D495918 table:0];
  [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x263F08320]];

  if (v5) {
    [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08608]];
  }
  v13 = [MEMORY[0x263F087E8] errorWithDomain:@"NUNewsUIErrorDomain" code:-4 userInfo:v8];

  return v13;
}

@end