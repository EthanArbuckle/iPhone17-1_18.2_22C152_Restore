@interface SUAssetStateMatcher
- (BOOL)_matchesFilterType:(id)a3;
- (NSDictionary)matcherInfo;
- (NSString)assetType;
- (SUAssetStateMatcher)initWithType:(id)a3 interestedStates:(int)a4;
- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4;
- (id)findMatchFromCandidates:(id)a3 error:(id *)a4;
- (int)interestedStates;
@end

@implementation SUAssetStateMatcher

- (SUAssetStateMatcher)initWithType:(id)a3 interestedStates:(int)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUAssetStateMatcher;
  v8 = [(SUAssetStateMatcher *)&v14 init];
  if (v8)
  {
    if (!v7)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:v8 file:@"SUAssetStateMatcher.m" lineNumber:23 description:@"Asset type must be non-nil for a matcher."];
    }
    uint64_t v9 = [v7 copy];
    assetType = v8->_assetType;
    v8->_assetType = (NSString *)v9;

    v8->_interestedStates = a4;
    matcherInfo = v8->_matcherInfo;
    v8->_matcherInfo = 0;
  }
  return v8;
}

- (id)findMatchFromCandidates:(id)a3 error:(id *)a4
{
  int interestedStates = self->_interestedStates;
  id v7 = (objc_class *)MEMORY[0x263EFF980];
  id v8 = a3;
  if (interestedStates)
  {
    id v9 = objc_alloc_init(v7);
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    v15 = __53__SUAssetStateMatcher_findMatchFromCandidates_error___block_invoke;
    v16 = &unk_26447C850;
    v17 = self;
    id v10 = v9;
    id v18 = v10;
    [v8 enumerateObjectsUsingBlock:&v13];
  }
  else
  {
    id v10 = (id)[[v7 alloc] initWithArray:v8];
  }
  v11 = -[SUAssetStateMatcher _findMatchFromCandidates:error:](self, "_findMatchFromCandidates:error:", v10, a4, v13, v14, v15, v16, v17);

  return v11;
}

void __53__SUAssetStateMatcher_findMatchFromCandidates_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_matchesFilterType:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (id)_findMatchFromCandidates:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 objectAtIndex:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_matchesFilterType:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_interestedStates)
  {
    uint64_t v6 = [v4 state];
    BOOL v7 = (unint64_t)(v6 - 1) <= 3 && (self->_interestedStates & dword_21DDCF4D0[v6 - 1]) != 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (int)interestedStates
{
  return self->_interestedStates;
}

- (NSDictionary)matcherInfo
{
  return self->_matcherInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherInfo, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
}

@end