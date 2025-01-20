@interface SearchUISearchInAppHandler
- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUISearchInAppHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 searchInAppType] == 1)
  {
    v10 = [v8 applicationBundleIdentifier];
    v11 = [v8 searchString];
    +[SearchUIMarketplaceKitUtilities requestSearchPageWithDistributorID:v10 searchString:v11 completionHandler:&__block_literal_global_44];
  }
  else
  {
    v12 = [v8 applicationBundleIdentifier];
    v13 = +[SearchUIUtilities bundleIdentifierForApp:1];
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v15 setScheme:@"itms-apps"];
      [v15 setHost:&stru_1F40279D8];
      v16 = [MEMORY[0x1E4F1CA48] array];
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"action" value:@"search"];
      [v16 addObject:v17];

      id v18 = objc_alloc(MEMORY[0x1E4F290C8]);
      v19 = [v8 searchString];
      v20 = (void *)[v18 initWithName:@"term" value:v19];
      [v16 addObject:v20];

      [v15 setQueryItems:v16];
      v21 = (void *)MEMORY[0x1E4F9A2F8];
      v22 = [v15 URL];
      v23 = [v21 punchoutWithURL:v22];
      +[SearchUIUtilities openPunchout:v23];
    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)SearchUISearchInAppHandler;
      [(SearchUIOpenUserActivityHandler *)&v24 performCommand:v8 triggerEvent:a4 environment:v9];
    }
  }
}

- (void)getUserActivityForCommand:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E4F22488];
  id v8 = (void (**)(id, void *, void *))a5;
  id v9 = [v7 alloc];
  v10 = (void *)[v9 initWithActivityType:*MEMORY[0x1E4F229D8]];
  v11 = [v6 searchString];
  v12 = [v6 searchString];

  if (!v12)
  {
    v13 = SearchUITapLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[SearchUISearchInAppHandler getUserActivityForCommand:environment:completionHandler:](v6, v13);
    }

    v11 = &stru_1F40279D8;
  }
  uint64_t v17 = *MEMORY[0x1E4F229E8];
  int v14 = [v6 searchString];
  v18[0] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  [v10 setUserInfo:v15];

  v16 = [v6 applicationBundleIdentifier];
  v8[2](v8, v10, v16);
}

- (void)getUserActivityForCommand:(void *)a1 environment:(NSObject *)a2 completionHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 applicationBundleIdentifier];
  int v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1E45B5000, a2, OS_LOG_TYPE_FAULT, "SearchUISearchInAppHandler has nil string for app: %@", (uint8_t *)&v4, 0xCu);
}

@end