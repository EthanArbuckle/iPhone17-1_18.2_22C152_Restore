@interface SSTopHitAppWithEntitiesSectionBuilder
+ (BOOL)supportsAppTopHitWithoutIndexFor:(id)a3;
+ (BOOL)supportsBonusSPI:(id)a3;
+ (BOOL)supportsFileProviderFor:(id)a3;
+ (BOOL)supportsSection:(id)a3;
- (SSApplicationResultBuilder)appResultBuilder;
- (id)buildBridgedResult;
- (id)buildCardSections;
- (id)buildCollectionStyle;
- (int64_t)maxCardSections;
- (void)setAppResultBuilder:(id)a3;
@end

@implementation SSTopHitAppWithEntitiesSectionBuilder

+ (BOOL)supportsSection:(id)a3
{
  id v3 = a3;
  v4 = [v3 results];
  v5 = [v3 bundleIdentifier];

  if ([v5 isEqualToString:@"com.apple.spotlight.tophits"])
  {
    v6 = [v4 firstObject];
    v7 = [v6 sectionBundleIdentifier];
    char v8 = [v7 isEqualToString:@"com.apple.application"];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  LOBYTE(v10) = 0;
  if ([v4 count] == 1 && (v9 & 1) == 0)
  {
    v11 = [v4 firstObject];
    if ([v11 isAppClip])
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      v12 = [v4 firstObject];
      int v10 = [v12 isWebClip] ^ 1;
    }
  }

  return v10;
}

+ (BOOL)supportsAppTopHitWithoutIndexFor:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() supportsFileProviderFor:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [(id)objc_opt_class() supportsBonusSPI:v3];
  }

  return v4;
}

+ (BOOL)supportsFileProviderFor:(id)a3
{
  uint64_t v3 = supportsFileProviderFor__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&supportsFileProviderFor__onceToken, &__block_literal_global_56);
  }
  char v5 = [(id)supportsFileProviderFor__supportedBundleIdentifiers containsObject:v4];

  return v5;
}

void __65__SSTopHitAppWithEntitiesSectionBuilder_supportsFileProviderFor___block_invoke()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.DocumentsApp";
  v4[1] = @"com.apple.Pages";
  v4[2] = @"com.apple.Keynote";
  v4[3] = @"com.apple.Numbers";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)supportsFileProviderFor__supportedBundleIdentifiers;
  supportsFileProviderFor__supportedBundleIdentifiers = v2;
}

+ (BOOL)supportsBonusSPI:(id)a3
{
  return WFTopHitContextualActionTypeForBundleIdentifier() != 0;
}

- (id)buildBridgedResult
{
  uint64_t v3 = [(SSSectionBuilder *)self section];
  id v4 = [v3 results];
  char v5 = [v4 firstObject];

  v6 = [[SSApplicationResultBuilder alloc] initWithResult:v5];
  [(SSTopHitAppWithEntitiesSectionBuilder *)self setAppResultBuilder:v6];

  v7 = [(SSSectionBuilder *)self queryContext];
  char v8 = [(SSTopHitAppWithEntitiesSectionBuilder *)self appResultBuilder];
  [v8 setQueryContext:v7];

  char v9 = [(SSTopHitAppWithEntitiesSectionBuilder *)self appResultBuilder];
  id v10 = (id)[v9 buildResult];

  v21.receiver = self;
  v21.super_class = (Class)SSTopHitAppWithEntitiesSectionBuilder;
  v11 = [(SSSectionBuilder *)&v21 buildBridgedResult];
  v12 = [v11 inlineCard];
  [v5 setInlineCard:v12];

  v13 = [v11 compactCard];
  [v5 setCompactCard:v13];

  objc_msgSend(v5, "setQueryId:", objc_msgSend(v11, "queryId"));
  v14 = [v11 sectionBundleIdentifier];
  [v5 setSectionBundleIdentifier:v14];

  v15 = [v11 resultBundleId];
  [v5 setResultBundleId:v15];

  v16 = [v11 applicationBundleIdentifier];
  [v5 setApplicationBundleIdentifier:v16];

  v17 = [(SSTopHitAppWithEntitiesSectionBuilder *)self appResultBuilder];
  v18 = [v17 matchedAlternateName];
  [v5 setCompletion:v18];

  v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResult:v5];
  return v19;
}

- (int64_t)maxCardSections
{
  if (isIpad()) {
    return 6;
  }
  if (isMacOS()) {
    return 6;
  }
  return 4;
}

- (id)buildCollectionStyle
{
  uint64_t v3 = objc_opt_new();
  objc_msgSend(v3, "setNumberOfColumns:", -[SSTopHitAppWithEntitiesSectionBuilder maxCardSections](self, "maxCardSections"));
  return v3;
}

- (id)buildCardSections
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  id v4 = [(SSTopHitAppWithEntitiesSectionBuilder *)self appResultBuilder];
  char v5 = [v4 bundleId];
  [v3 setApplicationBundleIdentifier:v5];

  v6 = [(SSTopHitAppWithEntitiesSectionBuilder *)self appResultBuilder];
  v7 = [v6 name];
  [v3 setTitle:v7];

  char v8 = [SFSearchResult_SpotlightExtras alloc];
  char v9 = [(SSSectionBuilder *)self section];
  id v10 = [v9 results];
  v11 = [v10 firstObject];
  v12 = [(SFSearchResult_SpotlightExtras *)v8 initWithResult:v11];
  [v3 setSpotlightBackingResult:v12];

  v13 = objc_opt_new();
  v14 = [v3 applicationBundleIdentifier];
  [v13 setApplicationBundleIdentifier:v14];

  [v3 setCommand:v13];
  v17[0] = v3;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  return v15;
}

- (SSApplicationResultBuilder)appResultBuilder
{
  return self->_appResultBuilder;
}

- (void)setAppResultBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end