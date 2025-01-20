@interface SUDocumentationAssetMatcher
+ (id)matcherDocumentationFromAsset:(id)a3;
+ (id)matcherForInstalledDocumentationFromAsset:(id)a3;
- (SUDocumentationAssetMatcher)initWithSoftwareUpdateAsset:(id)a3;
- (SUDocumentationAssetMatcher)initWithSoftwareUpdateAsset:(id)a3 limitingToStates:(int)a4;
- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4;
- (id)_queryPredicateForProperties:(id)a3;
- (id)_sortedMatcherPredicatesFromSoftwareUpdateAsset:(id)a3;
- (void)_modifyMADownloadOptions:(id)a3;
- (void)dealloc;
@end

@implementation SUDocumentationAssetMatcher

+ (id)matcherForInstalledDocumentationFromAsset:(id)a3
{
  v3 = [[SUDocumentationAssetMatcher alloc] initWithSoftwareUpdateAsset:a3 limitingToStates:4];
  return v3;
}

+ (id)matcherDocumentationFromAsset:(id)a3
{
  v3 = [[SUDocumentationAssetMatcher alloc] initWithSoftwareUpdateAsset:a3];
  return v3;
}

- (SUDocumentationAssetMatcher)initWithSoftwareUpdateAsset:(id)a3
{
  return [(SUDocumentationAssetMatcher *)self initWithSoftwareUpdateAsset:a3 limitingToStates:0];
}

- (SUDocumentationAssetMatcher)initWithSoftwareUpdateAsset:(id)a3 limitingToStates:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUDocumentationAssetMatcher;
  v5 = [(SUAssetStateMatcher *)&v7 initWithType:@"com.apple.MobileAsset.SoftwareUpdateDocumentation" interestedStates:*(void *)&a4];
  if (v5) {
    v5->_suAsset = (MAAsset *)a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUDocumentationAssetMatcher;
  [(SUDocumentationAssetMatcher *)&v3 dealloc];
}

- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v22 = [(SUDocumentationAssetMatcher *)self _sortedMatcherPredicatesFromSoftwareUpdateAsset:self->_suAsset];
  uint64_t v6 = [v22 count];
  if (v6)
  {
    unint64_t v7 = v6;
    for (unint64_t i = 0; i < v7; ++i)
    {
      v9 = (void *)[v22 objectAtIndex:i];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v10 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(a3);
          }
          v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x223C18220]();
          if (objc_msgSend(v9, "evaluateWithObject:", objc_msgSend(v14, "attributes"))) {
            break;
          }
          if (v11 == ++v13)
          {
            uint64_t v11 = [a3 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v11) {
              goto LABEL_5;
            }
            goto LABEL_13;
          }
        }
        id v16 = v14;
        if (v16) {
          return v16;
        }
      }
LABEL_13:
      uint64_t v17 = [v9 predicateFormat];
      v18 = [(SUAssetStateMatcher *)self assetType];
      [(SUAssetStateMatcher *)self assetType];
      uint64_t v19 = ASServerURLForAssetType();
      NSLog(&cfstr_FailedToFindAs.isa, v17, v18, v19);
    }
  }
  id v16 = 0;
  if (a4) {
    *a4 = +[SUUtility errorWithCode:38];
  }
  return v16;
}

- (void)_modifyMADownloadOptions:(id)a3
{
  if (MGGetBoolAnswer()) {
    uint64_t v5 = 60;
  }
  else {
    uint64_t v5 = 30;
  }
  [a3 setTimeoutIntervalForResource:v5];
  [a3 setDiscretionary:0];
  [a3 setAllowsCellularAccess:1];
  [a3 setAllowsExpensiveAccess:1];
  uint64_t v6 = objc_msgSend((id)-[MAAsset attributes](self->_suAsset, "attributes"), "objectForKey:", @"SUDocumentationID");
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", v6, @"SUDocumentationID", +[SUUtility currentProductCategory](SUUtility, "currentProductCategory"), @"Device", 0);
  [a3 setAdditionalServerParams:v7];
}

- (id)_queryPredicateForProperties:(id)a3
{
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__SUDocumentationAssetMatcher__queryPredicateForProperties___block_invoke;
  v6[3] = &unk_26447CA70;
  v6[4] = v4;
  [a3 enumerateKeysAndObjectsUsingBlock:v6];
  return (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v4];
}

uint64_t __60__SUDocumentationAssetMatcher__queryPredicateForProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", a2, a3];
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 addObject:v4];
}

- (id)_sortedMatcherPredicatesFromSoftwareUpdateAsset:(id)a3
{
  uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectForKey:", @"SUDocumentationID");
  id v8 = +[SUUtility currentDeviceName];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setValue:v7 forKey:@"SUDocumentationID"];
    }
  }
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 setValue:v8 forKey:@"Device"];
    }
  }
  id v9 = [(SUDocumentationAssetMatcher *)self _queryPredicateForProperties:v6];
  if (v9) {
    [v5 addObject:v9];
  }

  return v5;
}

@end