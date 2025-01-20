@interface SSAppGridSectionBuilder
+ (BOOL)supportsSection:(id)a3;
- (id)buildSection;
@end

@implementation SSAppGridSectionBuilder

+ (BOOL)supportsSection:(id)a3
{
  id v3 = a3;
  if (isMacOS())
  {
    char v4 = 0;
  }
  else
  {
    v5 = [v3 bundleIdentifier];
    if ([v5 isEqualToString:@"com.apple.spotlight.tophits"])
    {
      v6 = [v3 results];
      v7 = [v6 firstObject];
      v8 = [v7 sectionBundleIdentifier];
      char v4 = [v8 isEqualToString:@"com.apple.application"];
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

- (id)buildSection
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SSAppGridSectionBuilder;
  v2 = [(SSLegacySectionBuilder *)&v13 buildSection];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(v2, "results", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) setRenderHorizontallyWithOtherResultsInCategory:1];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

@end