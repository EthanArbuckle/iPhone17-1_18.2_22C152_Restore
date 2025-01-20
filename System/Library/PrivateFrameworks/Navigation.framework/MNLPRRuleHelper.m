@interface MNLPRRuleHelper
- (id)workQueue;
- (void)_findResourceNamesForRegions:(id)a3 forceUpdate:(BOOL)a4 asyncCompletion:(id)a5;
- (void)_loadRules:(id)a3 asyncCompletion:(id)a4;
- (void)fetchRulesForWaypoints:(id)a3 forceUpdateManifest:(BOOL)a4 forceUpdateRules:(BOOL)a5 completionQueue:(id)a6 completion:(id)a7;
- (void)prefetchRulesForWaypoints:(id)a3;
@end

@implementation MNLPRRuleHelper

- (id)workQueue
{
  global_queue = (void *)geo_get_global_queue();
  return global_queue;
}

- (void)prefetchRulesForWaypoints:(id)a3
{
  id v4 = a3;
  v5 = +[MNVirtualGarageManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke;
  v7[3] = &unk_1E60FB000;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 updatedVehicleStateWithHandler:v7];
}

void __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 licensePlate];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) workQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke_2;
    v8[3] = &unk_1E60F6668;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    dispatch_async(v5, v8);
  }
}

void __45__MNLPRRuleHelper_prefetchRulesForWaypoints___block_invoke_2(uint64_t a1)
{
  _regionsFromLatLngs(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) _findResourceNamesForRegions:v2 forceUpdate:0 asyncCompletion:0];
}

- (void)fetchRulesForWaypoints:(id)a3 forceUpdateManifest:(BOOL)a4 forceUpdateRules:(BOOL)a5 completionQueue:(id)a6 completion:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke;
    v23[3] = &unk_1E60FB050;
    id v24 = v12;
    v25 = self;
    id v26 = v13;
    id v14 = a3;
    v15 = (void (**)(void, void, void))MEMORY[0x1BA99B3A0](v23);
    v16 = _regionsFromLatLngs(v14);

    if ([v16 count])
    {
      v17 = [(MNLPRRuleHelper *)self workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_3;
      block[3] = &unk_1E60FB0C8;
      BOOL v21 = a4;
      v20 = v15;
      block[4] = self;
      id v19 = v16;
      BOOL v22 = a5;
      dispatch_async(v17, block);
    }
    else
    {
      v15[2](v15, 0, 0);
    }
  }
}

void __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  global_queue = v7;
  if (!v7) {
    global_queue = geo_get_global_queue();
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_2;
  v12[3] = &unk_1E60FB028;
  id v13 = v5;
  id v14 = v6;
  id v9 = (void *)a1[6];
  uint64_t v15 = a1[5];
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(global_queue, v12);
  if (!v7) {
}
  }

uint64_t __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count]) {
    BOOL v2 = *(void *)(a1 + 40) == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    return [v6 _loadRules:v5 asyncCompletion:v7];
  }
  else
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v3();
  }
}

void __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    BOOL v2 = [MEMORY[0x1E4F64918] modernManager];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_4;
    v10[3] = &unk_1E60FB0A0;
    id v3 = *(id *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    id v12 = v3;
    v10[4] = v4;
    id v11 = v5;
    char v13 = *(unsigned char *)(a1 + 57);
    [v2 updateManifest:1 completionHandler:v10];
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v9 = *(void *)(a1 + 48);
    [v6 _findResourceNamesForRegions:v7 forceUpdate:v8 asyncCompletion:v9];
  }
}

void __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) workQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_5;
    v6[3] = &unk_1E60FB078;
    uint64_t v5 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v5;
    char v9 = *(unsigned char *)(a1 + 56);
    id v8 = *(id *)(a1 + 48);
    dispatch_async(v4, v6);
  }
}

uint64_t __106__MNLPRRuleHelper_fetchRulesForWaypoints_forceUpdateManifest_forceUpdateRules_completionQueue_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findResourceNamesForRegions:*(void *)(a1 + 40) forceUpdate:*(unsigned __int8 *)(a1 + 56) asyncCompletion:*(void *)(a1 + 48)];
}

- (void)_findResourceNamesForRegions:(id)a3 forceUpdate:(BOOL)a4 asyncCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  char v9 = (void *)MEMORY[0x1E4F64918];
  id v10 = a3;
  id v11 = [v9 modernManager];
  id v12 = [v11 activeTileGroup];

  char v13 = [v12 regionalResourcesForMapRegions:v10 resourceFilter:&__block_literal_global_34 attributionFilter:0];

  id v14 = [MEMORY[0x1E4F64928] sharedRequester];
  uint64_t v15 = [(MNLPRRuleHelper *)self workQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__MNLPRRuleHelper__findResourceNamesForRegions_forceUpdate_asyncCompletion___block_invoke_2;
  v17[3] = &unk_1E60FB110;
  id v18 = v8;
  id v16 = v8;
  [v14 fetchResources:v13 force:v5 manifestConfiguration:0 auditToken:0 queue:v15 handler:v17];
}

uint64_t __76__MNLPRRuleHelper__findResourceNamesForRegions_forceUpdate_asyncCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(v2, "filters", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 scenariosCount])
        {
          uint64_t v9 = 0;
          while ([v8 scenarioAtIndex:v9] == 4)
          {
            if (++v9 >= (unint64_t)[v8 scenariosCount]) {
              goto LABEL_10;
            }
          }
          uint64_t v11 = 0;
          goto LABEL_14;
        }
LABEL_10:
        ;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v10 = [v2 filename];
  id v3 = [v10 pathExtension];

  uint64_t v11 = [v3 isEqualToString:@"cms-lpr"];
LABEL_14:

  return v11;
}

uint64_t __76__MNLPRRuleHelper__findResourceNamesForRegions_forceUpdate_asyncCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_loadRules:(id)a3 asyncCompletion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    BOOL v22 = self;
    v23 = v7;
    id v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v25 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = dispatch_group_create();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
          dispatch_group_enter(v9);
          long long v16 = [v15 pathExtension];
          v17 = [v16 lowercaseString];

          if ([v17 isEqualToString:@"cms-lpr"])
          {
            uint64_t v18 = [MEMORY[0x1E4F64908] sharedManager];
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke;
            v31[3] = &unk_1E60FB138;
            id v32 = v26;
            id v33 = v25;
            v34 = v9;
            [v18 dataForSignedResourceWithName:v15 fallbackBundle:0 fallbackNameHandler:0 resultHandler:v31];
          }
          else
          {
            dispatch_group_leave(v9);
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v12);
    }

    id v19 = [(MNLPRRuleHelper *)v22 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke_2;
    block[3] = &unk_1E60F6BE8;
    id v28 = v25;
    id v8 = v23;
    id v29 = v26;
    id v30 = v23;
    id v20 = v26;
    id v21 = v25;
    dispatch_group_notify(v9, v19, block);

    id v6 = v24;
  }
}

void __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F64618]) initWithData:v7];
    if (v6) {
      [*(id *)(a1 + 32) addObject:v6];
    }
  }
  else if (v5)
  {
    [*(id *)(a1 + 40) addObject:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __46__MNLPRRuleHelper__loadRules_asyncCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    id v7 = [*(id *)(a1 + 32) firstObject];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v7);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
    uint64_t v6 = *(void *)(a1 + 48);
    v5(v6, v4, 0);
  }
}

@end