@interface WFiTunesSessionManager
- (NSURL)baseURL;
- (NSURLSession)session;
- (WFiTunesSessionManager)init;
- (WFiTunesSessionManager)initWithSessionConfiguration:(id)a3;
- (void)getMediaWithURL:(id)a3 completion:(id)a4;
- (void)lookupMediaWithBundleIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5;
- (void)lookupMediaWithISBN:(unint64_t)a3 completion:(id)a4;
- (void)lookupMediaWithIdentifiers:(id)a3 countryCode:(id)a4 completion:(id)a5;
- (void)lookupMediaWithUPC:(unint64_t)a3 completion:(id)a4;
- (void)searchForMediaOfType:(id)a3 limitedToEntityType:(id)a4 withTerm:(id)a5 forAttribute:(id)a6 countryCode:(id)a7 limit:(unint64_t)a8 completion:(id)a9;
@end

@implementation WFiTunesSessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)getMediaWithURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFiTunesSessionManager *)self session];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__WFiTunesSessionManager_getMediaWithURL_completion___block_invoke;
  v11[3] = &unk_1E65543A0;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 dataTaskWithURL:v7 completionHandler:v11];

  [v10 resume];
}

void __53__WFiTunesSessionManager_getMediaWithURL_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if ([v6 length])
  {
    id v15 = v7;
    v8 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v15];
    id v9 = v15;

    if (v8)
    {
      v10 = [v8 objectForKeyedSubscript:@"results"];
      uint64_t v11 = *(void *)(a1 + 32);
      if (v10)
      {
        id v14 = v9;
        id v12 = +[MTLJSONAdapter modelsOfClass:objc_opt_class() fromJSONArray:v10 error:&v14];
        id v13 = v14;

        (*(void (**)(uint64_t, void *, id))(v11 + 16))(v11, v12, v13);
        id v9 = v13;
      }
      else
      {
        (*(void (**)(uint64_t, void, id))(v11 + 16))(v11, 0, v9);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }

    id v7 = v9;
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)lookupMediaWithISBN:(unint64_t)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F29088];
  id v7 = a4;
  v8 = [(WFiTunesSessionManager *)self baseURL];
  id v9 = [v6 componentsWithURL:v8 resolvingAgainstBaseURL:0];

  [v9 setPath:@"/lookup"];
  v10 = (void *)MEMORY[0x1E4F290C8];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  id v12 = [v10 queryItemWithName:@"isbn" value:v11];
  v15[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v9 setQueryItems:v13];

  id v14 = [v9 URL];
  [(WFiTunesSessionManager *)self getMediaWithURL:v14 completion:v7];
}

- (void)lookupMediaWithUPC:(unint64_t)a3 completion:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F29088];
  id v7 = a4;
  v8 = [(WFiTunesSessionManager *)self baseURL];
  id v9 = [v6 componentsWithURL:v8 resolvingAgainstBaseURL:0];

  [v9 setPath:@"/lookup"];
  v10 = (void *)MEMORY[0x1E4F290C8];
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  id v12 = [v10 queryItemWithName:@"upc" value:v11];
  v15[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [v9 setQueryItems:v13];

  id v14 = [v9 URL];
  [(WFiTunesSessionManager *)self getMediaWithURL:v14 completion:v7];
}

- (void)lookupMediaWithBundleIdentifier:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  id v17 = a4;
  v8 = (void *)MEMORY[0x1E4F29088];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(WFiTunesSessionManager *)self baseURL];
  id v12 = [v8 componentsWithURL:v11 resolvingAgainstBaseURL:0];

  [v12 setPath:@"/lookup"];
  id v13 = objc_opt_new();
  id v14 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bundleId" value:v10];

  [v13 addObject:v14];
  if (v17)
  {
    id v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"country" value:v17];
    [v13 addObject:v15];
  }
  [v12 setQueryItems:v13];
  v16 = [v12 URL];
  [(WFiTunesSessionManager *)self getMediaWithURL:v16 completion:v9];
}

- (void)lookupMediaWithIdentifiers:(id)a3 countryCode:(id)a4 completion:(id)a5
{
  id v19 = a4;
  v8 = (void *)MEMORY[0x1E4F29088];
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(WFiTunesSessionManager *)self baseURL];
  id v12 = [v8 componentsWithURL:v11 resolvingAgainstBaseURL:0];

  [v12 setPath:@"/lookup"];
  id v13 = objc_opt_new();
  id v14 = (void *)MEMORY[0x1E4F290C8];
  id v15 = [v10 componentsJoinedByString:@","];

  v16 = [v14 queryItemWithName:@"id" value:v15];
  [v13 addObject:v16];

  if (v19)
  {
    id v17 = [MEMORY[0x1E4F290C8] queryItemWithName:@"country" value:v19];
    [v13 addObject:v17];
  }
  [v12 setQueryItems:v13];
  v18 = [v12 URL];
  [(WFiTunesSessionManager *)self getMediaWithURL:v18 completion:v9];
}

- (void)searchForMediaOfType:(id)a3 limitedToEntityType:(id)a4 withTerm:(id)a5 forAttribute:(id)a6 countryCode:(id)a7 limit:(unint64_t)a8 completion:(id)a9
{
  id v36 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (!v18)
  {
    v20 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v18 = [v20 objectForKey:*MEMORY[0x1E4F1C400]];
  }
  v21 = (void *)MEMORY[0x1E4F1CA48];
  v35 = v16;
  v22 = [MEMORY[0x1E4F290C8] queryItemWithName:@"term" value:v16];
  v23 = [MEMORY[0x1E4F290C8] queryItemWithName:@"country" value:v18];
  v24 = objc_msgSend(v21, "arrayWithObjects:", v22, v23, 0);

  if (v36)
  {
    v25 = [MEMORY[0x1E4F290C8] queryItemWithName:@"media" value:v36];
    [v24 addObject:v25];
  }
  if (v15)
  {
    v26 = [MEMORY[0x1E4F290C8] queryItemWithName:@"entity" value:v15];
    [v24 addObject:v26];
  }
  if (v17)
  {
    v27 = [MEMORY[0x1E4F290C8] queryItemWithName:@"attribute" value:v17];
    [v24 addObject:v27];
  }
  if (a8)
  {
    v28 = (void *)MEMORY[0x1E4F290C8];
    v29 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a8);
    v30 = [v28 queryItemWithName:@"limit" value:v29];
    [v24 addObject:v30];
  }
  v31 = (void *)MEMORY[0x1E4F29088];
  v32 = [(WFiTunesSessionManager *)self baseURL];
  v33 = [v31 componentsWithURL:v32 resolvingAgainstBaseURL:0];

  [v33 setPath:@"/search"];
  [v33 setQueryItems:v24];
  v34 = [v33 URL];
  [(WFiTunesSessionManager *)self getMediaWithURL:v34 completion:v19];
}

- (WFiTunesSessionManager)initWithSessionConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFiTunesSessionManager;
  v5 = [(WFiTunesSessionManager *)&v14 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F290E0];
    id v7 = v4;
    if (!v4)
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F290F0], "wf_defaultSessionConfiguration");
    }
    uint64_t v8 = [v6 sessionWithConfiguration:v7];
    session = v5->_session;
    v5->_session = (NSURLSession *)v8;

    if (!v4) {
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://itunes.apple.com/"];
    }
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    id v12 = v5;
  }

  return v5;
}

- (WFiTunesSessionManager)init
{
  return [(WFiTunesSessionManager *)self initWithSessionConfiguration:0];
}

@end