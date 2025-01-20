@interface SSCachedViewResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
- (BOOL)supportsClearingBackendData;
- (id)buildInlineCardSections;
@end

@implementation SSCachedViewResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F22B68];
  id v4 = a3;
  v5 = [v4 valueForAttribute:v3 withType:objc_opt_class()];

  if (v5) {
    char v6 = SSAppVendedTopHitViewsEnabled();
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (BOOL)supportsClearingBackendData
{
  return 0;
}

- (id)buildInlineCardSections
{
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [SFSearchResult_SpotlightExtras alloc];
  id v4 = [(SSResultBuilder *)self result];
  v5 = [(SFSearchResult_SpotlightExtras *)v3 initWithResult:v4];

  char v6 = [(SFSearchResult_SpotlightExtras *)v5 backendData];
  uint64_t v7 = *MEMORY[0x1E4F22B68];
  [v6 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F22B68]];

  v8 = +[SSResultBuilder resultBuilderWithResult:v5];
  v9 = [(SSResultBuilder *)self queryContext];
  [v8 setQueryContext:v9];

  objc_msgSend(v8, "setIsTopHit:", -[SSResultBuilder isTopHit](self, "isTopHit"));
  v10 = objc_opt_new();
  v11 = [(SSResultBuilder *)self queryContext];
  v12 = [v11 searchString];
  [v10 setSearchString:v12];

  objc_msgSend(v10, "setIsTopHit:", -[SSResultBuilder isTopHit](self, "isTopHit"));
  v13 = [v8 buildInlineCardSection];
  [v10 setFallbackCardSection:v13];

  v14 = [v8 buildResult];
  [v10 setSpotlightBackingResult:v14];

  [(SSResultBuilder *)self buildDefaultPropertiesForCardSection:v10];
  id v15 = objc_alloc(MEMORY[0x1E4F23850]);
  v16 = [(SSResultBuilder *)self result];
  v17 = [v16 backendData];
  v18 = (void *)[v17 copy];
  v19 = (void *)[v15 initWithAttributes:v18];
  [v10 setAttributeSet:v19];

  v20 = [(SSResultBuilder *)self result];
  v21 = [v20 valueForAttribute:v7 withType:objc_opt_class()];
  [v10 setArchive:v21];

  v24[0] = v10;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];

  return v22;
}

@end