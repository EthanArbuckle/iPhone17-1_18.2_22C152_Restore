@interface NUWebContentContentRuleProvider
- (FCHeadlineProviding)headline;
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (NUWebContentContentRuleProvider)initWithAppConfigurationManager:(id)a3 headline:(id)a4;
- (id)contentRules;
@end

@implementation NUWebContentContentRuleProvider

- (NUWebContentContentRuleProvider)initWithAppConfigurationManager:(id)a3 headline:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUWebContentContentRuleProvider;
  v9 = [(NUWebContentContentRuleProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appConfigurationManager, a3);
    objc_storeStrong((id *)&v10->_headline, a4);
  }

  return v10;
}

- (id)contentRules
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v4 = [v3 objectForKey:@"newsarticles.anf.content_blockers_enabled"];

  if (v4 && ([v4 BOOLValue] & 1) == 0 && (NFInternalBuild() & 1) != 0
    || ([(NUWebContentContentRuleProvider *)self headline],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isLocalDraft],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [(NUWebContentContentRuleProvider *)self appConfigurationManager];
    v9 = [v8 appConfiguration];

    v10 = [MEMORY[0x263EFF980] array];
    v11 = [v9 webEmbedContentBlockers];
    objc_super v12 = [v11 dataUsingEncoding:4];

    if (v12)
    {
      uint64_t v26 = 0;
      v13 = [MEMORY[0x263F08900] JSONObjectWithData:v12 options:0 error:&v26];
      if (!v26)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 addObjectsFromArray:v13];
        }
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v14 = [v9 webEmbedContentBlockerOverrides];
      v15 = [v14 dataUsingEncoding:4];

      if (v15)
      {
        uint64_t v25 = 0;
        v16 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:&v25];
        if (!v25)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v17 = [v16 objectForKey:@"channels"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [(NUWebContentContentRuleProvider *)self headline];
              v18 = [v23 sourceChannel];
              v19 = [v18 identifier];
              v22 = [v17 objectForKey:v19];

              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v10 addObjectsFromArray:v22];
              }
            }
          }
        }
      }
    }
    uint64_t v24 = 0;
    v20 = [MEMORY[0x263F08900] dataWithJSONObject:v10 options:0 error:&v24];
    if (v20) {
      id v7 = (void *)[[NSString alloc] initWithData:v20 encoding:4];
    }
    else {
      id v7 = 0;
    }
  }

  return v7;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCHeadlineProviding)headline
{
  return self->_headline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headline, 0);

  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
}

@end