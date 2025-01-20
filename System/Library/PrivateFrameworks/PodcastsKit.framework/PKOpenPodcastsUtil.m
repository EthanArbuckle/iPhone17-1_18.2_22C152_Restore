@interface PKOpenPodcastsUtil
+ (void)openPodcastsWithOriginBundleId:(id)a3;
@end

@implementation PKOpenPodcastsUtil

+ (void)openPodcastsWithOriginBundleId:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F83358];
  v13[0] = a3;
  v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v6 = *MEMORY[0x263F3F5D0];
  v10[0] = *MEMORY[0x263F3F598];
  v10[1] = v6;
  v11[0] = MEMORY[0x263EFFA88];
  v11[1] = v5;
  v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [MEMORY[0x263F3F790] serviceWithDefaultShellEndpoint];
  v9 = [MEMORY[0x263F3F778] optionsWithDictionary:v7];

  [v8 openApplication:@"com.apple.podcasts" withOptions:v9 completion:&__block_literal_global_7];
}

void __53__PKOpenPodcastsUtil_openPodcastsWithOriginBundleId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = _MTLogCategoryLifecycle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_23F08F000, v4, OS_LOG_TYPE_ERROR, "Error opening podcasts: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

@end