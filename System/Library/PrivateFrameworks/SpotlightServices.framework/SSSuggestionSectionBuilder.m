@interface SSSuggestionSectionBuilder
+ (id)supportedBundleIds;
- (id)buildSection;
@end

@implementation SSSuggestionSectionBuilder

+ (id)supportedBundleIds
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.searchd.suggestions";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)buildSection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)SSSuggestionSectionBuilder;
  v2 = [(SSLegacySectionBuilder *)&v17 buildSection];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(v2, "results", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v8 setUsesCompactDisplay:1];
        [v8 setShouldUseCompactDisplay:1];
        v9 = [v8 compactCard];
        v10 = [v9 cardSections];
        v11 = [v10 firstObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 setShouldUseCompactDisplay:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }

  return v2;
}

@end