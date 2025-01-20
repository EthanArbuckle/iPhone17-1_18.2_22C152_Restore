@interface SPDaemonQueryToken
- (BOOL)didReissue;
- (BOOL)gotQueryComplete;
- (BOOL)isLocalQuery;
- (BOOL)queryFinished;
- (NSString)fbq;
- (NSString)web_fbq;
- (OS_dispatch_queue)queue;
- (SPDaemonQueryDelegate)delegate;
- (SPDaemonQueryToken)initWithQuery:(id)a3 queue:(id)a4 delegate:(id)a5;
- (SPSearchQuery)query;
- (unsigned)queryID;
- (void)handleLocalQueryWithResultSet:(id)a3;
- (void)handleMessage:(id)a3;
- (void)setDidReissue:(BOOL)a3;
- (void)setIsLocalQuery:(BOOL)a3;
- (void)setQueryFinished:(BOOL)a3;
@end

@implementation SPDaemonQueryToken

- (void)handleMessage:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (handleMessage__onceToken != -1) {
    dispatch_once(&handleMessage__onceToken, &__block_literal_global_5);
  }
  v5 = [v4 info];
  v6 = [v5 objectForKey:@"QID"];
  int v7 = [v6 unsignedIntValue];
  unsigned int queryID = self->_queryID;

  if (v7 == queryID)
  {
    v9 = [v4 name];
    int v10 = [v9 isEqualToString:@"Suggestions"];

    if (v10)
    {
      v11 = [v4 rootObjectOfClasses:handleMessage__allowedSuggestions];
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_2;
      block[3] = &unk_2644B2990;
      block[4] = self;
      v81 = v11;
      id v13 = v11;
      dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      dispatch_async(queue, v14);

      v15 = v81;
LABEL_8:

      goto LABEL_9;
    }
    v16 = [v4 name];
    int v17 = [v16 isEqualToString:@"LocalSuggestions"];

    if (v17)
    {
      v18 = [v4 rootObjectOfClasses:handleMessage__allowedLocalSuggestions];
      v19 = self->_queue;
      v78[0] = MEMORY[0x263EF8330];
      v78[1] = 3221225472;
      v78[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_3;
      v78[3] = &unk_2644B2990;
      v78[4] = self;
      v79 = v18;
      id v13 = v18;
      dispatch_block_t v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v78);
      dispatch_async(v19, v20);

      v15 = v79;
      goto LABEL_8;
    }
    v21 = [v4 name];
    int v22 = [v21 isEqualToString:@"DebugRanking"];

    if (v22)
    {
      v23 = [v4 info];
      v24 = [v23 objectForKeyedSubscript:@"RD"];
      v25 = self->_queue;
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_20;
      v76[3] = &unk_2644B2990;
      v76[4] = self;
      id v77 = v24;
      id v26 = v24;
      dispatch_async(v25, v76);
    }
    else
    {
      v27 = [v4 name];
      int v28 = [v27 isEqualToString:@"SearchResults"];

      if (v28)
      {
        v61 = self;
        v60 = [v4 info];
        v29 = [v60 objectForKeyedSubscript:@"TBC"];
        int v30 = [v29 intValue];
        size_t v31 = v30;

        v32 = [MEMORY[0x263EFF980] arrayWithCapacity:v30];
        v33 = (void **)MEMORY[0x263EFFD08];
        if (v30)
        {
          uint64_t v34 = *MEMORY[0x263EFFD08];
          size_t v35 = v31;
          do
          {
            [v32 addObject:v34];
            --v35;
          }
          while (v35);
        }
        v73[0] = MEMORY[0x263EF8330];
        v73[1] = 3221225472;
        v73[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_2_28;
        v73[3] = &unk_2644B2C80;
        id v74 = v4;
        id v36 = v32;
        id v75 = v36;
        dispatch_apply(v31, 0, v73);
        v37 = objc_opt_new();
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        id v38 = v36;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v69 objects:v82 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          v41 = 0;
          uint64_t v42 = *(void *)v70;
          v43 = *v33;
          do
          {
            for (uint64_t i = 0; i != v40; ++i)
            {
              if (*(void *)v70 != v42) {
                objc_enumerationMutation(v38);
              }
              v45 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              if (v45 != v43)
              {
                v46 = [*(id *)(*((void *)&v69 + 1) + 8 * i) resultSections];
                [v37 addObjectsFromArray:v46];

                v47 = [v45 stableSections];

                if (v47)
                {
                  uint64_t v48 = [v45 stableSections];

                  v41 = (void *)v48;
                }
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }
          while (v40);
        }
        else
        {
          v41 = 0;
        }

        v55 = [[SPResultSet alloc] initWithSections:v37 stableSections:v41];
        v56 = v61->_queue;
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_3_30;
        v66[3] = &unk_2644B2B40;
        v66[4] = v61;
        id v67 = v60;
        v68 = v55;
        v57 = v55;
        id v58 = v60;
        dispatch_block_t v59 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v66);
        dispatch_async(v56, v59);
      }
      else
      {
        v49 = [v4 name];
        int v50 = [v49 isEqualToString:@"SearchReset"];

        if (v50)
        {
          v51 = self->_queue;
          v65[0] = MEMORY[0x263EF8330];
          v65[1] = 3221225472;
          v65[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_4;
          v65[3] = &unk_2644B2A50;
          v65[4] = self;
          dispatch_async(v51, v65);
        }
        else
        {
          v52 = [v4 name];
          int v53 = [v52 isEqualToString:@"SearchError"];

          if (v53)
          {
            v54 = self->_queue;
            v62[0] = MEMORY[0x263EF8330];
            v62[1] = 3221225472;
            v62[2] = __36__SPDaemonQueryToken_handleMessage___block_invoke_5;
            v62[3] = &unk_2644B2990;
            id v63 = v4;
            v64 = self;
            dispatch_async(v54, v62);
          }
        }
      }
    }
  }
LABEL_9:
}

uint64_t __36__SPDaemonQueryToken_handleMessage___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  v1 = (void *)handleMessage__allowedClasses;
  handleMessage__allowedClasses = v0;

  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = (void *)handleMessage__allowedSuggestions;
  handleMessage__allowedSuggestions = v4;

  uint64_t v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v7 = handleMessage__allowedLocalSuggestions;
  handleMessage__allowedLocalSuggestions = v6;

  return MEMORY[0x270F9A758](v6, v7);
}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 searchDaemonSuggestionsArray:*(void *)(a1 + 40)];
  }
}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_3(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_21E5D7000, v3, v4, "Local suggestions: %@", (uint8_t *)&v6, 0xCu);
  }

  if (objc_opt_respondsToSelector()) {
    [v2 searchDaemonLocalSuggestionsData:*(void *)(a1 + 40)];
  }
}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_20(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 searchDaemonRankingLog:*(void *)(a1 + 40)];
}

uint64_t __36__SPDaemonQueryToken_handleMessage___block_invoke_2_28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectsOfClasses:handleMessage__allowedClasses atIndex:a2];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = [*(id *)(a1 + 40) setObject:v4 atIndexedSubscript:a2];
    uint64_t v5 = v7;
  }

  return MEMORY[0x270F9A758](v4, v5);
}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_3_30(uint64_t a1)
{
  int v30 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QDC"];
    int v3 = [v2 BOOLValue];

    if (v3) {
      *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    }
    uint64_t v25 = *(void *)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 48);
    v29 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QDR"];
    unsigned int v24 = [v29 BOOLValue];
    int v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QDP"];
    unsigned int v22 = [v28 BOOLValue];
    v27 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QFP"];
    unsigned int v20 = [v27 BOOLValue];
    v23 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QDU"];
    unsigned int v19 = [v23 BOOLValue];
    v21 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QDC"];
    char v18 = [v21 BOOLValue];
    uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"DTH"];
    char v17 = [v4 BOOLValue];
    uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QNC"];
    char v6 = [v5 BOOLValue];
    uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QFS"];
    char v8 = [v7 BOOLValue];
    v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"BT"];
    [v9 doubleValue];
    double v11 = v10;
    v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"GES"];
    id v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SAS"];
    dispatch_block_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SMIA"];
    BYTE3(v16) = v8;
    BYTE2(v16) = v6;
    BYTE1(v16) = v17;
    LOBYTE(v16) = v18;
    objc_msgSend(v30, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", v25, v26, v24, v22, v20, v19, v11, v16, v12, v13, v14);

    v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"QDC"];
    LODWORD(v14) = [v15 BOOLValue];

    if (v14) {
      [*(id *)(a1 + 32) setQueryFinished:1];
    }
  }
}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_4(uint64_t a1)
{
  int v3 = [*(id *)(a1 + 32) delegate];
  LODWORD(v2) = 0;
  objc_msgSend(v3, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", *(void *)(a1 + 32), 0, 1, 0, 0, 0, 0.0, v2, &stru_26CF85E78, 0, 0);
}

void __36__SPDaemonQueryToken_handleMessage___block_invoke_5(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F087E8]);
  int v3 = [*(id *)(a1 + 32) info];
  uint64_t v4 = [v3 objectForKey:@"ERR"];
  id v6 = (id)objc_msgSend(v2, "initWithDomain:code:userInfo:", @"SearchError", objc_msgSend(v4, "unsignedIntValue"), 0);

  uint64_t v5 = [*(id *)(a1 + 40) delegate];
  [v5 searchDaemonQuery:*(void *)(a1 + 40) encounteredError:v6];
}

- (void)handleLocalQueryWithResultSet:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__SPDaemonQueryToken_handleLocalQueryWithResultSet___block_invoke;
  v8[3] = &unk_2644B2990;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, v8);
  dispatch_async(queue, v7);
}

void __52__SPDaemonQueryToken_handleLocalQueryWithResultSet___block_invoke(uint64_t a1)
{
  int v3 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = 1;
    LODWORD(v2) = 1;
    objc_msgSend(v3, "searchDaemonQuery:gotResultSet:replace:partiallyComplete:priorityFastPath:update:complete:delayedTopHit:unchanged:forceStable:blendingDuration:geoEntityString:supportedAppScopes:showMoreInAppInfo:", *(void *)(a1 + 32), *(void *)(a1 + 40), 1, 0, 0, 0, 0.0, v2, &stru_26CF85E78, 0, 0);
    [*(id *)(a1 + 32) setQueryFinished:1];
  }
}

- (SPDaemonQueryToken)initWithQuery:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SPDaemonQueryToken;
  v12 = [(SPDaemonQueryToken *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_query, a3);
    v13->_unsigned int queryID = atomic_fetch_add(__queryTokenGen, 1u);
    objc_storeStrong((id *)&v13->_queue, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
  }

  return v13;
}

- (SPDaemonQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SPDaemonQueryDelegate *)WeakRetained;
}

- (unsigned)queryID
{
  return self->_queryID;
}

- (SPSearchQuery)query
{
  return self->_query;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)queryFinished
{
  return self->_queryFinished;
}

- (void)setQueryFinished:(BOOL)a3
{
  self->_queryFinished = a3;
}

- (NSString)fbq
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)web_fbq
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)gotQueryComplete
{
  return self->_gotQueryComplete;
}

- (BOOL)didReissue
{
  return self->_didReissue;
}

- (void)setDidReissue:(BOOL)a3
{
  self->_didReissue = a3;
}

- (BOOL)isLocalQuery
{
  return self->_isLocalQuery;
}

- (void)setIsLocalQuery:(BOOL)a3
{
  self->_isLocalQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_web_fbq, 0);
  objc_storeStrong((id *)&self->_fbq, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_query, 0);
}

@end