@interface USWebHistory
- (BMStream)mediaUsageStream;
- (BMStream)webUsageStream;
- (BOOL)usageTrusted;
- (USWebHistory)init;
- (USWebHistory)initWithAuditToken:(id *)a3;
- (USWebHistory)initWithEventStorage:(id)a3 mediaUsageStream:(id)a4 webUsageStream:(id)a5 usageTrusted:(BOOL)a6;
- (_DKKnowledgeEventStreamDeleting)eventStorage;
- (void)_deleteEventsWithPredicate:(id)a3 completionHandler:(id)a4;
- (void)_deleteEventsWithWebUsagePredicate:(id)a3 videoUsagePredicate:(id)a4 completionHandler:(id)a5;
- (void)deleteAllHistoryForApplication:(id)a3 completionHandler:(id)a4;
- (void)deleteAllHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5;
- (void)deleteHistoryDuringInterval:(id)a3 webApplication:(id)a4 completionHandler:(id)a5;
- (void)deleteHistoryDuringInterval:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteHistoryForDomain:(id)a3 webApplication:(id)a4 completionHandler:(id)a5;
- (void)deleteHistoryForDomain:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteHistoryForURL:(id)a3 webApplication:(id)a4 completionHandler:(id)a5;
- (void)deleteHistoryForURL:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
- (void)deleteHistoryForURLs:(id)a3 webApplication:(id)a4 completionHandler:(id)a5;
- (void)deleteHistoryForURLs:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6;
@end

@implementation USWebHistory

- (USWebHistory)initWithEventStorage:(id)a3 mediaUsageStream:(id)a4 webUsageStream:(id)a5 usageTrusted:(BOOL)a6
{
  v10 = (_DKKnowledgeEventStreamDeleting *)a3;
  v11 = (BMStream *)a4;
  v12 = (BMStream *)a5;
  v20.receiver = self;
  v20.super_class = (Class)USWebHistory;
  v13 = [(USWebHistory *)&v20 init];
  eventStorage = v13->_eventStorage;
  v13->_eventStorage = v10;
  v15 = v10;

  mediaUsageStream = v13->_mediaUsageStream;
  v13->_mediaUsageStream = v11;
  v17 = v11;

  webUsageStream = v13->_webUsageStream;
  v13->_webUsageStream = v12;

  v13->_usageTrusted = a6;
  return v13;
}

- (USWebHistory)initWithAuditToken:(id *)a3
{
  BOOL v4 = +[USUsageTrust validateTrustForSecTask:0];
  v5 = BiomeLibrary();
  v6 = [v5 App];

  v7 = [MEMORY[0x263F350B8] userKnowledgeStore];
  v8 = [v6 MediaUsage];
  v9 = [v6 WebUsage];
  v10 = [(USWebHistory *)self initWithEventStorage:v7 mediaUsageStream:v8 webUsageStream:v9 usageTrusted:v4];

  return v10;
}

- (USWebHistory)init
{
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_3);
  }
  v3 = BiomeLibrary();
  BOOL v4 = [v3 App];

  v5 = [MEMORY[0x263F350B8] userKnowledgeStore];
  v6 = [v4 MediaUsage];
  v7 = [v4 WebUsage];
  v8 = [(USWebHistory *)self initWithEventStorage:v5 mediaUsageStream:v6 webUsageStream:v7 usageTrusted:init_trusted];

  return v8;
}

BOOL __20__USWebHistory_init__block_invoke()
{
  BOOL result = +[USUsageTrust validateTrustForSecTask:0];
  init_trusted = result;
  return result;
}

- (void)deleteHistoryForURL:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
}

- (void)deleteHistoryForURL:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  v60[3] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v46 = a6;
  id v12 = a3;
  v48 = objc_opt_new();
  v13 = [v48 normalizeURL:v12];

  v14 = [v13 absoluteString];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [v13 relativeString];
  }
  v17 = v16;

  v18 = [(USWebHistory *)self mediaUsageStream];
  v19 = [v18 pruner];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke;
  v54[3] = &unk_26431E7B0;
  id v20 = v10;
  id v55 = v20;
  id v21 = v11;
  id v56 = v21;
  id v22 = v17;
  id v57 = v22;
  v58 = self;
  [v19 deleteWithPolicy:@"delete-web-history" eventsPassingTest:v54];

  v23 = [(USWebHistory *)self webUsageStream];
  v24 = [v23 pruner];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke_2;
  v49[3] = &unk_26431E7B0;
  id v25 = v20;
  id v50 = v25;
  id v26 = v21;
  id v51 = v26;
  id v44 = v22;
  id v52 = v44;
  v53 = self;
  v47 = self;
  [v24 deleteWithPolicy:@"delete-web-history" eventsPassingTest:v49];

  v45 = v25;
  v27 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:v25];
  id v28 = v26;
  v29 = [MEMORY[0x263F35080] safariProfileID];
  if (v28)
  {
    v30 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v29 andStringValue:v28];
  }
  else
  {
    v31 = (void *)MEMORY[0x263F08730];
    v32 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v29];
    v30 = [v31 notPredicateWithSubpredicate:v32];
  }
  v33 = [MEMORY[0x263F35080] webpageURL];
  v34 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v33 andValue:v13];
  v43 = v13;
  v35 = (void *)MEMORY[0x263F08730];
  v60[0] = v27;
  v60[1] = v30;
  v60[2] = v34;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:3];
  v37 = [v35 andPredicateWithSubpredicates:v36];

  v38 = [MEMORY[0x263F35018] URL];
  v39 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v38 andValue:v13];
  v40 = (void *)MEMORY[0x263F08730];
  v59[0] = v27;
  v59[1] = v30;
  v59[2] = v39;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
  v42 = [v40 andPredicateWithSubpredicates:v41];

  [(USWebHistory *)v47 _deleteEventsWithWebUsagePredicate:v37 videoUsagePredicate:v42 completionHandler:v46];
}

uint64_t __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 bundleID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 safariProfileID];
    id v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {
    }
    else
    {
      v7 = v6;
      int v8 = [v5 isEqual:v6];

      if (!v8)
      {
        uint64_t v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    id v10 = [v3 URL];
    if ([v10 isEqualToString:*(void *)(a1 + 48)])
    {
      int v11 = [v3 isUsageTrusted];
      uint64_t v9 = v11 ^ [*(id *)(a1 + 56) usageTrusted] ^ 1;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

uint64_t __87__USWebHistory_deleteHistoryForURL_webApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 applicationID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 safariProfileID];
    id v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {
    }
    else
    {
      v7 = v6;
      int v8 = [v5 isEqual:v6];

      if (!v8)
      {
        uint64_t v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    id v10 = [v3 webpageURL];
    if ([v10 isEqualToString:*(void *)(a1 + 48)])
    {
      int v11 = [v3 isUsageTrusted];
      uint64_t v9 = v11 ^ [*(id *)(a1 + 56) usageTrusted] ^ 1;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (void)deleteHistoryForURLs:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
}

- (void)deleteHistoryForURLs:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v55 = a4;
  id v53 = a5;
  id v58 = a6;
  uint64_t v10 = [v9 count];
  v63 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
  v62 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
  int v11 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:v10];
  v61 = objc_opt_new();
  v60 = [MEMORY[0x263F35080] webpageURL];
  id v12 = [MEMORY[0x263F35018] URL];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id obj = v9;
  uint64_t v13 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v75 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = [v61 normalizeURL:*(void *)(*((void *)&v74 + 1) + 8 * i)];
        v18 = [v17 absoluteString];
        v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [v17 relativeString];
        }
        id v21 = v20;

        [v11 addObject:v21];
        id v22 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v60 andValue:v17];
        [v63 addObject:v22];
        v23 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v12 andValue:v17];
        [v62 addObject:v23];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v74 objects:v80 count:16];
    }
    while (v14);
  }

  v24 = [(USWebHistory *)self mediaUsageStream];
  id v25 = [v24 pruner];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke;
  v69[3] = &unk_26431E7B0;
  id v26 = v55;
  id v70 = v26;
  id v27 = v53;
  id v71 = v27;
  id v28 = v11;
  id v72 = v28;
  v73 = self;
  [v25 deleteWithPolicy:@"delete-web-history" eventsPassingTest:v69];

  v29 = [(USWebHistory *)self webUsageStream];
  v30 = [v29 pruner];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke_2;
  v64[3] = &unk_26431E7B0;
  id v31 = v26;
  id v65 = v31;
  id v32 = v27;
  id v66 = v32;
  id v54 = v28;
  id v67 = v54;
  v68 = self;
  [v30 deleteWithPolicy:@"delete-web-history" eventsPassingTest:v64];

  uint64_t v33 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v63];
  uint64_t v34 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v62];
  id v56 = v31;
  v35 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:v31];
  id v36 = v32;
  v37 = [MEMORY[0x263F35080] safariProfileID];
  if (v36)
  {
    v38 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v37 andStringValue:v36];
  }
  else
  {
    uint64_t v39 = v33;
    v40 = (void *)MEMORY[0x263F08730];
    [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v37];
    v42 = uint64_t v41 = v34;
    v43 = v40;
    uint64_t v33 = v39;
    v38 = [v43 notPredicateWithSubpredicate:v42];

    uint64_t v34 = v41;
  }

  id v44 = (void *)MEMORY[0x263F08730];
  v79[0] = v35;
  v79[1] = v38;
  v79[2] = v33;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v79 count:3];
  id v52 = v36;
  id v46 = v45 = (void *)v33;
  v47 = [v44 andPredicateWithSubpredicates:v46];

  v48 = (void *)MEMORY[0x263F08730];
  v78[0] = v35;
  v78[1] = v38;
  v78[2] = v34;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:3];
  id v50 = v49 = (void *)v34;
  id v51 = [v48 andPredicateWithSubpredicates:v50];

  [(USWebHistory *)self _deleteEventsWithWebUsagePredicate:v47 videoUsagePredicate:v51 completionHandler:v58];
}

uint64_t __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 bundleID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 safariProfileID];
    id v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {
    }
    else
    {
      v7 = v6;
      int v8 = [v5 isEqual:v6];

      if (!v8)
      {
        uint64_t v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    uint64_t v10 = *(void **)(a1 + 48);
    int v11 = [v3 URL];
    if ([v10 containsObject:v11])
    {
      int v12 = [v3 isUsageTrusted];
      uint64_t v9 = v12 ^ [*(id *)(a1 + 56) usageTrusted] ^ 1;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

uint64_t __88__USWebHistory_deleteHistoryForURLs_webApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 applicationID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 safariProfileID];
    id v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {
    }
    else
    {
      v7 = v6;
      int v8 = [v5 isEqual:v6];

      if (!v8)
      {
        uint64_t v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    uint64_t v10 = *(void **)(a1 + 48);
    int v11 = [v3 webpageURL];
    if ([v10 containsObject:v11])
    {
      int v12 = [v3 isUsageTrusted];
      uint64_t v9 = v12 ^ [*(id *)(a1 + 56) usageTrusted] ^ 1;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (void)deleteHistoryForDomain:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
}

- (void)deleteHistoryForDomain:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  v37[3] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v30 = a6;
  id v12 = a3;
  id v31 = objc_opt_new();
  uint64_t v13 = [v31 normalizeDomainName:v12];

  uint64_t v14 = [(USWebHistory *)self webUsageStream];
  uint64_t v15 = [v14 pruner];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __90__USWebHistory_deleteHistoryForDomain_webApplication_profileIdentifier_completionHandler___block_invoke;
  v32[3] = &unk_26431E7B0;
  id v16 = v10;
  id v33 = v16;
  id v17 = v11;
  id v34 = v17;
  id v18 = v13;
  id v35 = v18;
  id v36 = self;
  [v15 deleteWithPolicy:@"delete-web-history" eventsPassingTest:v32];

  v19 = [MEMORY[0x263F35080] webDomain];
  id v20 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v19 andStringValue:v18];
  id v21 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:v16];
  id v22 = v17;
  v23 = [MEMORY[0x263F35080] safariProfileID];
  if (v22)
  {
    v24 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v23 andStringValue:v22];
  }
  else
  {
    id v25 = (void *)MEMORY[0x263F08730];
    id v26 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v23];
    v24 = [v25 notPredicateWithSubpredicate:v26];
  }
  id v27 = (void *)MEMORY[0x263F08730];
  v37[0] = v20;
  v37[1] = v21;
  v37[2] = v24;
  id v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];
  v29 = [v27 andPredicateWithSubpredicates:v28];

  [(USWebHistory *)self _deleteEventsWithPredicate:v29 completionHandler:v30];
}

uint64_t __90__USWebHistory_deleteHistoryForDomain_webApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 applicationID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 safariProfileID];
    id v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {
    }
    else
    {
      v7 = v6;
      int v8 = [v5 isEqual:v6];

      if (!v8)
      {
        uint64_t v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    id v10 = [v3 webDomain];
    if ([v10 isEqualToString:*(void *)(a1 + 48)])
    {
      int v11 = [v3 isUsageTrusted];
      uint64_t v9 = v11 ^ [*(id *)(a1 + 56) usageTrusted] ^ 1;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_11;
  }
  uint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (void)deleteHistoryDuringInterval:(id)a3 webApplication:(id)a4 completionHandler:(id)a5
{
}

- (void)deleteHistoryDuringInterval:(id)a3 webApplication:(id)a4 profileIdentifier:(id)a5 completionHandler:(id)a6
{
  v27[3] = *MEMORY[0x263EF8340];
  id v10 = a5;
  int v11 = (void *)MEMORY[0x263F35110];
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v14 startDate];
  id v16 = [v14 endDate];

  id v17 = [v11 predicateForEventsIntersectingDateRangeFrom:v15 to:v16];

  id v18 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:v13];

  id v19 = v10;
  id v20 = [MEMORY[0x263F35080] safariProfileID];
  if (v19)
  {
    id v21 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v20 andStringValue:v19];
  }
  else
  {
    id v22 = (void *)MEMORY[0x263F08730];
    v23 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v20];
    id v21 = [v22 notPredicateWithSubpredicate:v23];
  }
  v24 = (void *)MEMORY[0x263F08730];
  v27[0] = v17;
  v27[1] = v18;
  v27[2] = v21;
  id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
  id v26 = [v24 andPredicateWithSubpredicates:v25];

  [(USWebHistory *)self _deleteEventsWithWebUsagePredicate:v26 videoUsagePredicate:v26 completionHandler:v12];
}

- (void)deleteAllHistoryForApplication:(id)a3 completionHandler:(id)a4
{
}

- (void)deleteAllHistoryForApplication:(id)a3 profileIdentifier:(id)a4 completionHandler:(id)a5
{
  v36[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(USWebHistory *)self mediaUsageStream];
  id v12 = [v11 pruner];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke;
  v32[3] = &unk_26431E7D8;
  id v13 = v8;
  id v33 = v13;
  id v14 = v9;
  id v34 = v14;
  id v35 = self;
  [v12 deleteWithPolicy:@"delete-web-history" eventsPassingTest:v32];

  uint64_t v15 = [(USWebHistory *)self webUsageStream];
  id v16 = [v15 pruner];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2;
  v28[3] = &unk_26431E7D8;
  id v17 = v13;
  id v29 = v17;
  id v18 = v14;
  id v30 = v18;
  id v31 = self;
  [v16 deleteWithPolicy:@"delete-web-history" eventsPassingTest:v28];

  id v19 = [MEMORY[0x263F35110] predicateForEventsWithStringValue:v17];
  id v20 = v18;
  id v21 = [MEMORY[0x263F35080] safariProfileID];
  if (v20)
  {
    id v22 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v21 andStringValue:v20];
  }
  else
  {
    v23 = (void *)MEMORY[0x263F08730];
    v24 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v21];
    id v22 = [v23 notPredicateWithSubpredicate:v24];
  }
  id v25 = (void *)MEMORY[0x263F08730];
  v36[0] = v19;
  v36[1] = v22;
  id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  id v27 = [v25 andPredicateWithSubpredicates:v26];

  [(USWebHistory *)self _deleteEventsWithWebUsagePredicate:v27 videoUsagePredicate:v27 completionHandler:v10];
}

uint64_t __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 bundleID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 safariProfileID];
    id v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {
    }
    else
    {
      v7 = v6;
      int v8 = [v5 isEqual:v6];

      if (!v8)
      {
        uint64_t v9 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int v10 = [v3 isUsageTrusted];
    uint64_t v9 = v10 ^ [*(id *)(a1 + 48) usageTrusted] ^ 1;
    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

uint64_t __83__USWebHistory_deleteAllHistoryForApplication_profileIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  BOOL v4 = [v3 applicationID];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    id v5 = [v3 safariProfileID];
    id v6 = *(id *)(a1 + 40);
    if (v5 == v6)
    {
    }
    else
    {
      v7 = v6;
      int v8 = [v5 isEqual:v6];

      if (!v8)
      {
        uint64_t v9 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    int v10 = [v3 isUsageTrusted];
    uint64_t v9 = v10 ^ [*(id *)(a1 + 48) usageTrusted] ^ 1;
    goto LABEL_8;
  }
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (void)_deleteEventsWithPredicate:(id)a3 completionHandler:(id)a4
{
  v34[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(USWebHistory *)self eventStorage];
  uint64_t v9 = [MEMORY[0x263F35148] appWebUsageStream];
  int v10 = (void *)MEMORY[0x263F35110];
  int v11 = [v9 name];
  id v12 = [v10 predicateForEventsWithStreamName:v11];

  BOOL v13 = [(USWebHistory *)self usageTrusted];
  id v14 = [MEMORY[0x263F35080] isUsageTrusted];
  uint64_t v15 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v14 andIntegerValue:v13];
  unint64_t v16 = 0x263EFF000;
  if (v13)
  {
    id v17 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v14];
    [MEMORY[0x263F08730] notPredicateWithSubpredicate:v17];
    id v29 = v7;
    id v30 = v9;
    id v18 = v12;
    id v19 = v8;
    v21 = id v20 = v6;
    id v22 = (void *)MEMORY[0x263F08730];
    v34[0] = v15;
    v34[1] = v21;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    uint64_t v24 = [v22 orPredicateWithSubpredicates:v23];

    id v6 = v20;
    int v8 = v19;
    id v12 = v18;
    id v7 = v29;

    unint64_t v16 = 0x263EFF000uLL;
    uint64_t v15 = (void *)v24;
    uint64_t v9 = v30;
  }
  id v25 = (void *)MEMORY[0x263F08730];
  v33[0] = v12;
  v33[1] = v15;
  v33[2] = v6;
  id v26 = [*(id *)(v16 + 2240) arrayWithObjects:v33 count:3];
  id v27 = [v25 andPredicateWithSubpredicates:v26];

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __61__USWebHistory__deleteEventsWithPredicate_completionHandler___block_invoke;
  v31[3] = &unk_26431E800;
  id v32 = v7;
  id v28 = v7;
  [v8 deleteAllEventsMatchingPredicate:v27 responseQueue:0 withCompletion:v31];
}

void __61__USWebHistory__deleteEventsWithPredicate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Deleted %lu web usage events", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_deleteEventsWithWebUsagePredicate:(id)a3 videoUsagePredicate:(id)a4 completionHandler:(id)a5
{
  v44[2] = *MEMORY[0x263EF8340];
  id v38 = a3;
  id v37 = a4;
  id v8 = a5;
  id v36 = [(USWebHistory *)self eventStorage];
  LODWORD(a5) = [(USWebHistory *)self usageTrusted];
  uint64_t v9 = [MEMORY[0x263F35080] isUsageTrusted];
  int v10 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v9 andIntegerValue:a5];
  id v35 = (void *)v9;
  if (a5)
  {
    int v11 = [MEMORY[0x263F35110] predicateForObjectsWithMetadataKey:v9];
    id v12 = [MEMORY[0x263F08730] notPredicateWithSubpredicate:v11];
    id v13 = v8;
    id v14 = (void *)MEMORY[0x263F08730];
    v44[0] = v10;
    v44[1] = v12;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:2];
    uint64_t v16 = [v14 orPredicateWithSubpredicates:v15];

    int v10 = (void *)v16;
    id v8 = v13;
  }
  id v34 = [MEMORY[0x263F35148] appWebUsageStream];
  id v17 = (void *)MEMORY[0x263F35110];
  id v18 = [v34 name];
  id v33 = [v17 predicateForEventsWithStreamName:v18];

  id v19 = (void *)MEMORY[0x263F08730];
  v43[0] = v33;
  v43[1] = v38;
  v43[2] = v10;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
  id v21 = [v19 andPredicateWithSubpredicates:v20];

  id v22 = [MEMORY[0x263F35148] appMediaUsageStream];
  v23 = (void *)MEMORY[0x263F35110];
  uint64_t v24 = [v22 name];
  id v25 = [v23 predicateForEventsWithStreamName:v24];

  id v26 = (void *)MEMORY[0x263F08730];
  v42[0] = v25;
  v42[1] = v37;
  v42[2] = v10;
  id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
  id v28 = [v26 andPredicateWithSubpredicates:v27];

  id v29 = (void *)MEMORY[0x263F08730];
  v41[0] = v21;
  v41[1] = v28;
  id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  id v31 = [v29 orPredicateWithSubpredicates:v30];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __89__USWebHistory__deleteEventsWithWebUsagePredicate_videoUsagePredicate_completionHandler___block_invoke;
  v39[3] = &unk_26431E800;
  id v40 = v8;
  id v32 = v8;
  [v36 deleteAllEventsMatchingPredicate:v31 responseQueue:0 withCompletion:v39];
}

void __89__USWebHistory__deleteEventsWithWebUsagePredicate_videoUsagePredicate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = a2;
    _os_log_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Deleted %lu web and video usage events", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (_DKKnowledgeEventStreamDeleting)eventStorage
{
  return (_DKKnowledgeEventStreamDeleting *)objc_getProperty(self, a2, 16, 1);
}

- (BMStream)mediaUsageStream
{
  return (BMStream *)objc_getProperty(self, a2, 24, 1);
}

- (BMStream)webUsageStream
{
  return (BMStream *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webUsageStream, 0);
  objc_storeStrong((id *)&self->_mediaUsageStream, 0);
  objc_storeStrong((id *)&self->_eventStorage, 0);
}

@end