@interface SearchUISearchWebHandler
+ (id)webSearchURLForQueryString:(id)a3;
- (id)destinationPunchout;
@end

@implementation SearchUISearchWebHandler

- (id)destinationPunchout
{
  v2 = [(SearchUICommandHandler *)self command];
  v3 = [v2 searchString];

  v4 = (void *)MEMORY[0x1E4F9A2F8];
  v5 = [(id)objc_opt_class() webSearchURLForQueryString:v3];
  v6 = [v4 punchoutWithURL:v5];

  return v6;
}

+ (id)webSearchURLForQueryString:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E4F1CB18];
    id v4 = a3;
    v5 = objc_msgSend(v3, "_sf_safariSharedDefaults");
    v6 = v5;
    if (v5)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__SearchUISearchWebHandler_webSearchURLForQueryString___block_invoke;
      block[3] = &unk_1E6E72730;
      id v12 = v5;
      if (webSearchURLForQueryString__onceToken != -1) {
        dispatch_once(&webSearchURLForQueryString__onceToken, block);
      }
    }
    v7 = [MEMORY[0x1E4F3B060] sharedInstance];
    v8 = [v7 defaultSearchEngine];
    v9 = [v8 searchURLForUserTypedString:v4];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

uint64_t __55__SearchUISearchWebHandler_webSearchURLForQueryString___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)webSearchURLForQueryString__safariObserver;
  webSearchURLForQueryString__safariObserver = v2;

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = webSearchURLForQueryString__safariObserver;
  uint64_t v6 = *MEMORY[0x1E4F3B1E0];
  return [v4 addObserver:v5 forKeyPath:v6 options:3 context:0];
}

@end