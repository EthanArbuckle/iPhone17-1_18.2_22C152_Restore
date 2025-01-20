@interface SearchQueryBuilder
+ (id)searchQueryBuilderWithQuery:(id)a3 forPrivateBrowsing:(BOOL)a4;
+ (id)searchQueryBuilderWithXWebSearchURL:(id)a3 forPrivateBrowsing:(BOOL)a4;
- (SearchQueryBuilder)initWithQueryString:(id)a3 forPrivateBrowsing:(BOOL)a4;
- (SearchQueryBuilder)initWithSearchEngineInfo:(id)a3 queryString:(id)a4;
- (SearchQueryBuilder)initWithXWebSearchURL:(id)a3 forPrivateBrowsing:(BOOL)a4;
- (id)queryString;
- (id)searchEngineInfo;
- (id)searchURL;
@end

@implementation SearchQueryBuilder

- (SearchQueryBuilder)initWithSearchEngineInfo:(id)a3 queryString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SearchQueryBuilder;
  v9 = [(SearchQueryBuilder *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->queryString, a4);
    objc_storeStrong((id *)&v10->engineInfo, a3);
    v11 = v10;
  }

  return v10;
}

- (SearchQueryBuilder)initWithQueryString:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)MEMORY[0x1E4F3B060];
  id v7 = a3;
  id v8 = [v6 sharedInstance];
  v9 = [v8 defaultSearchEngineForPrivateBrowsing:v4];
  v10 = [(SearchQueryBuilder *)self initWithSearchEngineInfo:v9 queryString:v7];

  return v10;
}

- (SearchQueryBuilder)initWithXWebSearchURL:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (objc_msgSend(v6, "safari_isXWebSearchURL"))
  {
    id v7 = [v6 query];
    id v8 = [v7 stringByRemovingPercentEncoding];

    if (v8)
    {
      v9 = [MEMORY[0x1E4F3B060] sharedInstance];
      uint64_t v10 = [v6 host];
      if (v10)
      {
        v11 = (void *)v10;
        uint64_t v12 = [v9 engineInfoForScriptName:v10];
      }
      else
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserSharedDefaults");
        v15 = v14;
        v16 = (void *)MEMORY[0x1E4F789A0];
        if (!v4) {
          v16 = (void *)MEMORY[0x1E4F789C8];
        }
        v11 = [v14 objectForKey:*v16];

        uint64_t v12 = [v9 engineInfoFor:v11];
      }
      v17 = (void *)v12;
      if (!v12)
      {
        v18 = [MEMORY[0x1E4F3B060] sharedInstance];
        v17 = [v18 defaultSearchEngineForPrivateBrowsing:v4];
      }
      self = [(SearchQueryBuilder *)self initWithSearchEngineInfo:v17 queryString:v8];

      objc_super v13 = self;
    }
    else
    {
      objc_super v13 = 0;
    }
  }
  else
  {
    objc_super v13 = 0;
  }

  return v13;
}

+ (id)searchQueryBuilderWithQuery:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[SearchQueryBuilder alloc] initWithQueryString:v5 forPrivateBrowsing:v4];

  return v6;
}

+ (id)searchQueryBuilderWithXWebSearchURL:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[SearchQueryBuilder alloc] initWithXWebSearchURL:v5 forPrivateBrowsing:v4];

  return v6;
}

- (id)searchURL
{
  return (id)[(_SFSearchEngineInfo *)self->engineInfo searchURLForUserTypedString:self->queryString];
}

- (id)queryString
{
  return self->queryString;
}

- (id)searchEngineInfo
{
  return self->engineInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->engineInfo, 0);
  objc_storeStrong((id *)&self->queryString, 0);
}

@end