@interface WFGallerySessionManager
+ (WFGallerySessionManager)sharedManager;
+ (id)currentDeviceIdiom;
+ (id)defaultPreferredLocalizations;
- (BOOL)bannerIsRestricted:(id)a3;
- (BOOL)collectionIsRestricted:(id)a3;
- (BOOL)performExpensiveFetchOperations;
- (BOOL)workflowIsRestricted:(id)a3;
- (CKContainer)container;
- (CKDatabase)database;
- (NSArray)preferredLocalizations;
- (NSCache)bannerImageCache;
- (NSCache)collectionSearchCache;
- (NSCache)pageCache;
- (NSCache)workflowCache;
- (NSCache)workflowSearchCache;
- (NSString)containerDescription;
- (NSString)currentIdiom;
- (NSString)currentRegion;
- (WFGallerySessionManager)init;
- (WFGallerySessionManager)initWithContainer:(id)a3 preferredLocalizations:(id)a4 currentRegion:(id)a5 currentIdiom:(id)a6 performExpensiveFetchOperations:(BOOL)a7;
- (id)collectionWithoutRestrictedContent:(id)a3;
- (id)createItemRequest;
- (id)getImageForBanner:(id)a3 size:(int64_t)a4 completionHandler:(id)a5;
- (id)getWorkflowForIdentifier:(id)a3 completionHandler:(id)a4;
- (id)loadWorkflowInGalleryWorkflow:(id)a3 completionHandler:(id)a4;
- (id)pageWithoutRestrictedContent:(id)a3;
- (id)preferredPageInPages:(id)a3 preferredLanguages:(id)a4;
- (id)queryFilterForTokenizedKey:(id)a3 query:(id)a4;
- (id)searchCollections:(id)a3 completionHandler:(id)a4;
- (id)searchUsingWebServicesForItem:(Class)a3 query:(id)a4 queryFilter:(id)a5 completionHandler:(id)a6;
- (id)searchWorkflows:(id)a3 completionHandler:(id)a4;
- (id)searchWorkflowsAndCollections:(id)a3 completionHandler:(id)a4;
- (id)sortAndFilterSearchResults:(id)a3 query:(id)a4;
- (id)unshareSharedShortcut:(id)a3 completionHandler:(id)a4;
- (id)updateItems:(id)a3 completionHandler:(id)a4;
- (int64_t)version;
- (void)getCollectionForIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getCollectionForPersistentIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getCurrentUserIdentifierWithCompletionHandler:(id)a3;
- (void)getHomeWithCompletionHandler:(id)a3;
- (void)getHomeWithPreferredLanguages:(id)a3 completionHandler:(id)a4;
- (void)getPageWithID:(id)a3 completionHandler:(id)a4;
- (void)reportWorkflow:(id)a3 iCloudIdentifier:(id)a4 reportReason:(id)a5 reportMessage:(id)a6 completionHandler:(id)a7;
- (void)uploadWorkflow:(id)a3 withName:(id)a4 shortDescription:(id)a5 longDescription:(id)a6 private:(BOOL)a7 completionHandler:(id)a8;
@end

@implementation WFGallerySessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerImageCache, 0);
  objc_storeStrong((id *)&self->_workflowCache, 0);
  objc_storeStrong((id *)&self->_pageCache, 0);
  objc_storeStrong((id *)&self->_collectionSearchCache, 0);
  objc_storeStrong((id *)&self->_workflowSearchCache, 0);
  objc_storeStrong((id *)&self->_currentIdiom, 0);
  objc_storeStrong((id *)&self->_currentRegion, 0);
  objc_storeStrong((id *)&self->_preferredLocalizations, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (NSCache)bannerImageCache
{
  return self->_bannerImageCache;
}

- (NSCache)workflowCache
{
  return self->_workflowCache;
}

- (NSCache)pageCache
{
  return self->_pageCache;
}

- (NSCache)collectionSearchCache
{
  return self->_collectionSearchCache;
}

- (NSCache)workflowSearchCache
{
  return self->_workflowSearchCache;
}

- (NSString)currentIdiom
{
  return self->_currentIdiom;
}

- (NSString)currentRegion
{
  return self->_currentRegion;
}

- (NSArray)preferredLocalizations
{
  return self->_preferredLocalizations;
}

- (CKDatabase)database
{
  return self->_database;
}

- (CKContainer)container
{
  return self->_container;
}

- (BOOL)performExpensiveFetchOperations
{
  return self->_performExpensiveFetchOperations;
}

- (void)uploadWorkflow:(id)a3 withName:(id)a4 shortDescription:(id)a5 longDescription:(id)a6 private:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a4;
  id v18 = a3;
  if (v9)
  {
    v19 = objc_alloc_init(WFSharedShortcut);
    [(WFSharedShortcut *)v19 setName:v17];

    v20 = [v18 icon];
    [(WFSharedShortcut *)v19 setIcon:v20];
  }
  else
  {
    v19 = objc_alloc_init(WFMutableGalleryWorkflow);
    [(WFSharedShortcut *)v19 setName:v17];

    v21 = [v18 icon];
    [(WFSharedShortcut *)v19 setIcon:v21];

    [(WFSharedShortcut *)v19 setShortDescription:v14];
    [(WFSharedShortcut *)v19 setLongDescription:v15];
  }
  [(WFSharedShortcut *)v19 setWorkflowRecord:a3];

  v22 = [WFCloudKitItemRequest alloc];
  v23 = [(WFGallerySessionManager *)self container];
  v24 = [(WFGallerySessionManager *)self database];
  v25 = [(WFCloudKitItemRequest *)v22 initWithContainer:v23 database:v24];

  v33[0] = v19;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __110__WFGallerySessionManager_uploadWorkflow_withName_shortDescription_longDescription_private_completionHandler___block_invoke;
  v30[3] = &unk_1E6558AC8;
  v31 = v19;
  id v32 = v16;
  v27 = v19;
  id v28 = v16;
  id v29 = [(WFCloudKitItemRequest *)v25 updateItems:v26 setNilValues:0 qualityOfService:25 timeoutIntervalForRequest:v30 completionHandler:30.0];
}

void __110__WFGallerySessionManager_uploadWorkflow_withName_shortDescription_longDescription_private_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_3:
    v3();
    return;
  }
  v4 = [*(id *)(a1 + 32) identifier];

  if (!v4)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_3;
  }
  v5 = [*(id *)(a1 + 32) identifier];
  v6 = [v5 recordName];
  WFGallerySharingURLForIdentifier(v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)reportWorkflow:(id)a3 iCloudIdentifier:(id)a4 reportReason:(id)a5 reportMessage:(id)a6 completionHandler:(id)a7
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, id))a7;
  id v16 = [a3 fileRepresentation];
  id v28 = 0;
  id v17 = [v16 writeToDiskWithError:&v28];
  id v18 = v28;
  if (v17)
  {
    id v27 = v13;
    v19 = [[WFShortcutConcerningReport alloc] initWithReason:v13 shortcutContent:v17];
    [(WFShortcutConcerningReport *)v19 setReportMessage:v14];
    if (v12)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v12];
      [(WFShortcutConcerningReport *)v19 setShortcut:v20];
    }
    v21 = [WFCloudKitItemRequest alloc];
    v22 = [(WFGallerySessionManager *)self container];
    v23 = [(WFGallerySessionManager *)self database];
    v24 = [(WFCloudKitItemRequest *)v21 initWithContainer:v22 database:v23];

    v29[0] = v19;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    id v26 = [(WFCloudKitItemRequest *)v24 updateItems:v25 setNilValues:0 qualityOfService:25 timeoutIntervalForRequest:v15 completionHandler:30.0];

    id v13 = v27;
  }
  else
  {
    v15[2](v15, v18);
  }
}

- (id)unshareSharedShortcut:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFGallerySessionManager *)self createItemRequest];
  BOOL v9 = [v8 deleteItem:v7 completionHandler:v6];

  return v9;
}

- (id)updateItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFGallerySessionManager *)self createItemRequest];
  BOOL v9 = [v8 updateItems:v7 setNilValues:0 completionHandler:v6];

  return v9;
}

- (void)getCurrentUserIdentifierWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFGallerySessionManager *)self container];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6557AC0;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchUserRecordIDWithCompletionHandler:v7];
}

void __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 recordName];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6557D28;
  id v7 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v7;
  id v11 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __73__WFGallerySessionManager_getCurrentUserIdentifierWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getCollectionForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFGallerySessionManager *)self createItemRequest];
  id v8 = (id)[v7 fetchItemWithID:v9 itemType:objc_opt_class() groupName:@"GalleryFetch" properties:0 completionHandler:v6];
}

- (void)getCollectionForPersistentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFGallerySessionManager *)self createItemRequest];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  uint64_t v11 = [v10 integerValue];

  id v12 = (void *)MEMORY[0x1E4F28F60];
  id v13 = +[WFGallerySessionManager defaultPreferredLocalizations];
  id v14 = [v12 predicateWithFormat:@"persistentIdentifier == %@ AND language IN %@ AND minVersion <= %ld", v7, v13, v11];

  uint64_t v15 = objc_opt_class();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__WFGallerySessionManager_getCollectionForPersistentIdentifier_completionHandler___block_invoke;
  v18[3] = &unk_1E6558040;
  v18[4] = self;
  id v19 = v6;
  id v16 = v6;
  id v17 = (id)[v8 fetchItemsWithPredicate:v14 itemType:v15 groupName:@"GalleryFetch" properties:0 completionHandler:v18];
}

void __82__WFGallerySessionManager_getCollectionForPersistentIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v8 = [v5 sortAndFilterSearchResults:a2 query:0];
  id v7 = [v8 firstObject];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v7, v6);
}

- (id)getWorkflowForIdentifier:(id)a3 completionHandler:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [WFCloudKitWebServiceRequest alloc];
  id v9 = [(WFGallerySessionManager *)self container];
  v10 = [(WFGallerySessionManager *)self database];
  uint64_t v11 = [(WFCloudKitWebServiceRequest *)v8 initWithContainer:v9 database:v10];

  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v13 = [(WFCloudKitWebServiceRequest *)v11 fetchProxiedRecordWithIdentifier:v7 possibleItemTypes:v12 completionHandler:v6];

  return v13;
}

- (id)sortAndFilterSearchResults:(id)a3 query:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v28 = a4;
  id v6 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v8) {
    goto LABEL_24;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v37 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      id v13 = [v12 persistentIdentifier];
      if (v13)
      {
        id v14 = v12;
        if (v14)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if ([(WFGallerySessionManager *)self workflowIsRestricted:v14]) {
              goto LABEL_21;
            }
          }
          else
          {

            id v15 = 0;
          }
          id v16 = v14;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([(WFGallerySessionManager *)self collectionIsRestricted:v16])
            {
LABEL_20:

              id v14 = v15;
LABEL_21:

              goto LABEL_22;
            }
LABEL_17:
            id v17 = [v6 objectForKey:v13];
            if (!v17)
            {
              id v17 = objc_opt_new();
              [v6 setObject:v17 forKey:v13];
            }
            [v17 addObject:v14];

            goto LABEL_20;
          }
        }
        else
        {
          id v15 = 0;
        }

        id v16 = 0;
        goto LABEL_17;
      }
LABEL_22:
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
  }
  while (v9);
LABEL_24:

  id v18 = [(WFGallerySessionManager *)self preferredLocalizations];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke;
  v34[3] = &unk_1E6557A70;
  id v19 = v18;
  id v35 = v19;
  [v6 enumerateKeysAndObjectsUsingBlock:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_3;
  v32[3] = &unk_1E6557A98;
  id v20 = v6;
  id v33 = v20;
  v21 = objc_msgSend(v7, "if_objectsPassingTest:", v32);

  if (v28)
  {
    v22 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    v23 = [v28 componentsSeparatedByCharactersInSet:v22];
    v24 = [v23 firstObject];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_4;
    v30[3] = &unk_1E6557A48;
    id v31 = v24;
    id v25 = v24;
    id v26 = [v21 sortedArrayUsingComparator:v30];
  }
  else
  {
    id v26 = v21;
  }

  return v26;
}

void __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_2;
  v4[3] = &unk_1E6557A48;
  id v5 = *(id *)(a1 + 32);
  [a3 sortUsingComparator:v4];
}

BOOL __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 persistentIdentifier];
  uint64_t v5 = [v3 language];
  id v6 = (void *)v5;
  BOOL v7 = 1;
  if (v4 && v5)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectForKey:v4];
    id v9 = [v8 firstObject];
    BOOL v7 = v9 == v3;
  }
  return v7;
}

uint64_t __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 name];
  uint64_t v7 = [v6 localizedStandardRangeOfString:*(void *)(a1 + 32)];

  uint64_t v8 = [v5 name];

  uint64_t v9 = [v8 localizedStandardRangeOfString:*(void *)(a1 + 32)];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:v9];
  uint64_t v12 = [v10 compare:v11];

  return v12;
}

uint64_t __60__WFGallerySessionManager_sortAndFilterSearchResults_query___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 language];
  if (v7
    && (uint64_t v8 = (void *)v7,
        [v6 language],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v5 language];
    unint64_t v12 = [v10 indexOfObject:v11];

    id v13 = *(void **)(a1 + 32);
    id v14 = [v6 language];
    unint64_t v15 = [v13 indexOfObject:v14];

    if (v12 >= v15)
    {
      if (v12 > v15)
      {
        uint64_t v16 = 1;
      }
      else
      {
        id v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "minVersion"));
        id v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "minVersion"));
        uint64_t v16 = [v18 compare:v19];
      }
    }
    else
    {
      uint64_t v16 = -1;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)searchCollections:(id)a3 completionHandler:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v9 = [v6 stringByTrimmingCharactersInSet:v8];

  uint64_t v10 = [(WFGallerySessionManager *)self collectionSearchCache];
  uint64_t v11 = [v10 objectForKey:v9];

  if (v11)
  {
    v7[2](v7, v11, 0);
    unint64_t v12 = 0;
  }
  else
  {
    id v13 = [(WFGallerySessionManager *)self queryFilterForTokenizedKey:@"name" query:v9];
    id v14 = [(WFGallerySessionManager *)self preferredLocalizations];
    unint64_t v15 = +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:@"language" toStringArray:v14 by:1];

    v23[0] = v13;
    v23[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v17 = +[WFCloudKitWebServiceQueryFilter filterWithCombinationOf:v16 by:0];

    uint64_t v18 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__WFGallerySessionManager_searchCollections_completionHandler___block_invoke;
    v20[3] = &unk_1E6557A18;
    v22 = v7;
    v20[4] = self;
    id v21 = v9;
    unint64_t v12 = [(WFGallerySessionManager *)self searchUsingWebServicesForItem:v18 query:v6 queryFilter:v17 completionHandler:v20];
  }
  return v12;
}

void __63__WFGallerySessionManager_searchCollections_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (a3)
  {
    uint64_t v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 48);
    v4(v5, 0);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) sortAndFilterSearchResults:a2 query:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
}

- (id)queryFilterForTokenizedKey:(id)a3 query:(id)a4
{
  return +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:a3 toString:a4 by:3];
}

- (id)searchUsingWebServicesForItem:(Class)a3 query:(id)a4 queryFilter:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [WFCloudKitWebServiceRequest alloc];
  id v14 = [(WFGallerySessionManager *)self container];
  uint64_t v15 = [(WFGallerySessionManager *)self database];
  uint64_t v16 = [(WFCloudKitWebServiceRequest *)v13 initWithContainer:v14 database:v15];

  id v17 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  LOBYTE(v15) = [v17 BOOLForKey:@"WFDisableGallerySearchEdgeCaching"];

  if (v15)
  {
    uint64_t v18 = 0;
  }
  else
  {
    id v19 = NSString;
    id v20 = [(WFGallerySessionManager *)self container];
    id v21 = [v20 containerIdentifier];
    v22 = [(objc_class *)a3 recordType];
    uint64_t v18 = [v19 stringWithFormat:@"%@-%@-%li", v21, v22, objc_msgSend(v10, "hash")];
  }
  v23 = [(WFCloudKitWebServiceRequest *)v16 fetchRecordsWithItemType:a3 filter:v11 cacheKey:v18 completionHandler:v12];

  return v23;
}

- (id)searchWorkflows:(id)a3 completionHandler:(id)a4
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v9 = [v6 stringByTrimmingCharactersInSet:v8];

  id v10 = [(WFGallerySessionManager *)self workflowSearchCache];
  id v11 = [v10 objectForKey:v9];

  if (v11)
  {
    v7[2](v7, v11, 0);
    id v12 = 0;
  }
  else
  {
    id v13 = [(WFGallerySessionManager *)self queryFilterForTokenizedKey:@"name" query:v9];
    id v14 = +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:@"searchable" toInt:1 by:0];
    uint64_t v15 = [(WFGallerySessionManager *)self preferredLocalizations];
    uint64_t v16 = +[WFCloudKitWebServiceQueryFilter filterWithComparisonOf:@"language" toStringArray:v15 by:1];

    v24[0] = v13;
    v24[1] = v14;
    v24[2] = v16;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    uint64_t v18 = +[WFCloudKitWebServiceQueryFilter filterWithCombinationOf:v17 by:0];

    uint64_t v19 = objc_opt_class();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__WFGallerySessionManager_searchWorkflows_completionHandler___block_invoke;
    v21[3] = &unk_1E6557A18;
    v23 = v7;
    v21[4] = self;
    id v22 = v9;
    id v12 = [(WFGallerySessionManager *)self searchUsingWebServicesForItem:v19 query:v6 queryFilter:v18 completionHandler:v21];
  }
  return v12;
}

void __61__WFGallerySessionManager_searchWorkflows_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (a3)
  {
    uint64_t v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 48);
    v4(v5, 0);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) sortAndFilterSearchResults:a2 query:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
}

- (id)searchWorkflowsAndCollections:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__66330;
  v28[4] = __Block_byref_object_dispose__66331;
  id v29 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke;
  v22[3] = &unk_1E65579C8;
  id v9 = v8;
  id v23 = v9;
  id v10 = v7;
  id v26 = v10;
  v24 = self;
  id v11 = v6;
  id v25 = v11;
  id v27 = v28;
  id v12 = [(WFGallerySessionManager *)self searchWorkflows:v11 completionHandler:v22];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_6;
  v18[3] = &unk_1E65579F0;
  id v13 = v12;
  id v19 = v13;
  id v21 = v28;
  id v14 = v10;
  id v20 = v14;
  [v9 setCancellationHandler:v18];
  uint64_t v15 = v20;
  id v16 = v9;

  _Block_object_dispose(v28, 8);
  return v16;
}

void __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      if (v5)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_2;
        void v23[3] = &unk_1E6557920;
        v23[4] = *(void *)(a1 + 40);
        id v7 = objc_msgSend(v5, "if_objectsPassingTest:", v23);

        uint64_t v8 = [*(id *)(a1 + 40) workflowSearchCache];
        [v8 setObject:v7 forKey:*(void *)(a1 + 48)];
      }
      else
      {
        id v7 = 0;
      }
      id v9 = *(void **)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_3;
      v17[3] = &unk_1E65579A0;
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = *(void **)(a1 + 48);
      id v18 = v11;
      uint64_t v19 = v12;
      id v20 = v13;
      id v22 = *(id *)(a1 + 56);
      id v5 = v7;
      id v21 = v5;
      uint64_t v14 = [v9 searchCollections:v10 completionHandler:v17];
      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      id v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
  }
}

void __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cancel];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCloudKitErrorDomain" code:0 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v2 + 16))(v2, 0, 0, v3);
}

uint64_t __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) workflowIsRestricted:a2] ^ 1;
}

void __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_4;
      v7[3] = &unk_1E6557978;
      void v7[4] = *(void *)(a1 + 40);
      uint64_t v4 = objc_msgSend(v3, "if_objectsPassingTest:", v7);

      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_5;
      v6[3] = &unk_1E65578D0;
      v6[4] = *(void *)(a1 + 40);
      objc_msgSend(v4, "if_map:", v6);
      id v3 = (id)objc_claimAutoreleasedReturnValue();

      id v5 = [*(id *)(a1 + 40) collectionSearchCache];
      [v5 setObject:v3 forKey:*(void *)(a1 + 48)];
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) collectionIsRestricted:a2] ^ 1;
}

uint64_t __75__WFGallerySessionManager_searchWorkflowsAndCollections_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) collectionWithoutRestrictedContent:a2];
}

- (id)loadWorkflowInGalleryWorkflow:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  uint64_t v8 = [(WFGallerySessionManager *)self workflowCache];
  id v9 = [v6 identifier];
  uint64_t v10 = [v9 recordName];
  id v11 = [v8 objectForKey:v10];

  if (v11)
  {
    v7[2](v7, v11, 0);
LABEL_5:
    uint64_t v14 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = [v6 workflowRecord];

  if (v12)
  {
    id v13 = [v6 workflowRecord];
    v7[2](v7, v13, 0);

    goto LABEL_5;
  }
  id v16 = [(WFGallerySessionManager *)self createItemRequest];
  id v17 = [v6 identifier];
  uint64_t v18 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__WFGallerySessionManager_loadWorkflowInGalleryWorkflow_completionHandler___block_invoke;
  v19[3] = &unk_1E6557950;
  v19[4] = self;
  id v20 = v7;
  uint64_t v14 = [v16 fetchItemWithID:v17 itemType:v18 groupName:@"GalleryFetch" properties:&unk_1F2317BF8 completionHandler:v19];

LABEL_6:
  return v14;
}

void __75__WFGallerySessionManager_loadWorkflowInGalleryWorkflow_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  id v6 = [v5 domain];
  if ([v6 isEqualToString:@"WFCloudKitErrorDomain"])
  {
    uint64_t v7 = [v5 code];

    if (!v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_11;
    }
  }
  else
  {
  }
  uint64_t v8 = [v15 workflowRecord];
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) workflowCache];
    uint64_t v10 = [v15 identifier];
    id v11 = [v10 recordName];
    [v9 setObject:v8 forKey:v11];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    id v13 = WFLocalizedString(@"Unable to load this shortcut. Please try again later.");
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F28568]];

    if (v5) {
      [v12 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFGalleryErrorDomain" code:1 userInfo:v12];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_11:
}

- (BOOL)workflowIsRestricted:(id)a3
{
  id v4 = a3;
  id v5 = [v4 hiddenRegions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(WFGallerySessionManager *)self currentRegion];
    if (v7)
    {
      uint64_t v8 = [v4 hiddenRegions];
      id v9 = [(WFGallerySessionManager *)self currentRegion];
      char v10 = [v8 containsObject:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }
  id v11 = [v4 supportedIdioms];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = [(WFGallerySessionManager *)self currentIdiom];
    if (v13)
    {
      uint64_t v14 = [v4 supportedIdioms];
      id v15 = [(WFGallerySessionManager *)self currentIdiom];
      int v16 = [v14 containsObject:v15] ^ 1;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v10 | v16;
}

- (BOOL)collectionIsRestricted:(id)a3
{
  id v4 = a3;
  id v5 = [v4 supportedIdioms];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(WFGallerySessionManager *)self currentIdiom];
    if (v7)
    {
      uint64_t v8 = [v4 supportedIdioms];
      id v9 = [(WFGallerySessionManager *)self currentIdiom];
      int v10 = [v8 containsObject:v9] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)bannerIsRestricted:(id)a3
{
  id v4 = a3;
  id v5 = [v4 supportedIdioms];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(WFGallerySessionManager *)self currentIdiom];
    if (v7)
    {
      uint64_t v8 = [v4 supportedIdioms];
      id v9 = [(WFGallerySessionManager *)self currentIdiom];
      int v10 = [v8 containsObject:v9] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)collectionWithoutRestrictedContent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = [v4 workflows];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__WFGallerySessionManager_collectionWithoutRestrictedContent___block_invoke;
  v9[3] = &unk_1E6557920;
  v9[4] = self;
  uint64_t v7 = objc_msgSend(v6, "if_objectsPassingTest:", v9);
  [v5 setWorkflows:v7];

  return v5;
}

uint64_t __62__WFGallerySessionManager_collectionWithoutRestrictedContent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) workflowIsRestricted:a2] ^ 1;
}

- (id)pageWithoutRestrictedContent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = [v4 collections];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke;
  v12[3] = &unk_1E65578D0;
  v12[4] = self;
  uint64_t v7 = objc_msgSend(v6, "if_compactMap:", v12);
  [v5 setCollections:v7];

  uint64_t v8 = [v4 banners];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke_2;
  v11[3] = &unk_1E65578F8;
  v11[4] = self;
  id v9 = objc_msgSend(v8, "if_compactMap:", v11);
  [v5 setBanners:v9];

  return v5;
}

id __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) collectionIsRestricted:v3])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) collectionWithoutRestrictedContent:v3];
  }

  return v4;
}

id __56__WFGallerySessionManager_pageWithoutRestrictedContent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) bannerIsRestricted:v3]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }

  return v4;
}

- (id)preferredPageInPages:(id)a3 preferredLanguages:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 sortedArrayUsingComparator:&__block_literal_global_237];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(v6, "objectMatchingKey:value:", @"language", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v12)
        {
          id v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

uint64_t __67__WFGallerySessionManager_preferredPageInPages_preferredLanguages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 minVersion];
  uint64_t v6 = [v4 minVersion];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)getImageForBanner:(id)a3 size:(int64_t)a4 completionHandler:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, uint64_t, void))a5;
  uint64_t v10 = NSString;
  id v11 = [v8 identifier];
  uint64_t v12 = [v11 recordName];
  id v13 = [v10 stringWithFormat:@"%@-%ld", v12, a4];

  uint64_t v14 = [(WFGallerySessionManager *)self bannerImageCache];
  long long v15 = [v14 objectForKey:v13];

  if (v15)
  {
    v9[2](v9, v15, 1, 0);
    long long v16 = objc_alloc_init(WFCloudKitTask);
  }
  else
  {
    long long v17 = [(WFGallerySessionManager *)self createItemRequest];
    long long v18 = [v8 identifier];
    uint64_t v22 = objc_opt_class();
    uint64_t v19 = +[WFGalleryBanner propertyForSize:a4];
    v27[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __68__WFGallerySessionManager_getImageForBanner_size_completionHandler___block_invoke;
    void v23[3] = &unk_1E6557888;
    int64_t v26 = a4;
    v23[4] = self;
    id v24 = v13;
    id v25 = v9;
    long long v16 = [v17 fetchItemWithID:v18 itemType:v22 groupName:@"GalleryFetch" properties:v20 completionHandler:v23];
  }
  return v16;
}

void __68__WFGallerySessionManager_getImageForBanner_size_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 imageForSize:*(void *)(a1 + 56)];
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) bannerImageCache];
    [v6 setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getPageWithID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [(WFGallerySessionManager *)self pageCache];
  uint64_t v9 = [v6 recordName];
  uint64_t v10 = [v8 objectForKey:v9];

  if (v10)
  {
    v7[2](v7, v10, 0);
  }
  else
  {
    id v11 = [(WFGallerySessionManager *)self createItemRequest];
    uint64_t v12 = objc_opt_class();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__WFGallerySessionManager_getPageWithID_completionHandler___block_invoke;
    v14[3] = &unk_1E6557860;
    v14[4] = self;
    id v15 = v6;
    long long v16 = v7;
    id v13 = (id)[v11 fetchItemWithID:v15 itemType:v12 groupName:@"GalleryFetch" properties:0 completionHandler:v14];
  }
}

void __59__WFGallerySessionManager_getPageWithID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v9 = [*(id *)(a1 + 32) pageWithoutRestrictedContent:v5];

    id v7 = [*(id *)(a1 + 32) pageCache];
    id v8 = [*(id *)(a1 + 40) recordName];
    [v7 setObject:v9 forKey:v8];
  }
  else
  {
    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)getHomeWithPreferredLanguages:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isRoot = 1 AND language IN %@ AND minVersion <= %ld", v6, -[WFGallerySessionManager version](self, "version")];
  id v9 = [(WFGallerySessionManager *)self createItemRequest];
  uint64_t v10 = objc_opt_class();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__WFGallerySessionManager_getHomeWithPreferredLanguages_completionHandler___block_invoke;
  v14[3] = &unk_1E6557A18;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = (id)[v9 fetchItemsWithPredicate:v8 itemType:v10 groupName:@"GalleryPageQuery" properties:&unk_1F2317BE0 completionHandler:v14];
}

void __75__WFGallerySessionManager_getHomeWithPreferredLanguages_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (v11
    && !v5
    && ([*(id *)(a1 + 32) preferredPageInPages:v11 preferredLanguages:*(void *)(a1 + 40)],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = v6;
    id v8 = *(void **)(a1 + 32);
    id v9 = [v6 identifier];
    [v8 getPageWithID:v9 completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v9 = WFLocalizedString(@"The gallery is not available right now.");
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    if (v5) {
      [v10 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFGalleryErrorDomain" code:0 userInfo:v10];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)getHomeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFGallerySessionManager *)self preferredLocalizations];
  [(WFGallerySessionManager *)self getHomeWithPreferredLanguages:v5 completionHandler:v4];
}

- (id)createItemRequest
{
  id v3 = [WFCloudKitItemRequest alloc];
  id v4 = [(WFGallerySessionManager *)self container];
  id v5 = [(WFGallerySessionManager *)self database];
  id v6 = [(WFCloudKitItemRequest *)v3 initWithContainer:v4 database:v5];

  [(WFCloudKitItemRequest *)v6 setPerformExpensiveFetchOperations:[(WFGallerySessionManager *)self performExpensiveFetchOperations]];
  return v6;
}

- (NSString)containerDescription
{
  if (!os_variant_has_internal_content()) {
    return 0;
  }
  id v3 = [(WFGallerySessionManager *)self container];
  id v4 = [v3 containerIdentifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F5ABD8]];

  id v6 = [(WFGallerySessionManager *)self container];
  id v7 = [v6 containerID];
  uint64_t v8 = [v7 environment];

  if (v5)
  {
    if (v8 == 2) {
      return (NSString *)@"Dev";
    }
    else {
      return 0;
    }
  }
  else if (v8 == 2)
  {
    return (NSString *)@"QA (Dev)";
  }
  else
  {
    return (NSString *)@"QA";
  }
}

- (int64_t)version
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v2 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  int64_t v4 = [v3 integerValue];

  if (VCIsInternalBuild())
  {
    int v5 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
    if ([v5 BOOLForKey:@"WFGalleryOverrideBuildKey"])
    {
      id v6 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
      int64_t v4 = [v6 integerForKey:@"WFGalleryOverrideBuildVersionKey"];
    }
  }
  id v7 = getWFGalleryLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[WFGallerySessionManager version]";
    __int16 v11 = 2048;
    int64_t v12 = v4;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s using build version: %li", (uint8_t *)&v9, 0x16u);
  }

  return v4;
}

- (WFGallerySessionManager)initWithContainer:(id)a3 preferredLocalizations:(id)a4 currentRegion:(id)a5 currentIdiom:(id)a6 performExpensiveFetchOperations:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v39.receiver = self;
  v39.super_class = (Class)WFGallerySessionManager;
  long long v17 = [(WFGallerySessionManager *)&v39 init];
  long long v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_container, a3);
    uint64_t v19 = [(CKContainer *)v18->_container publicCloudDatabase];
    database = v18->_database;
    v18->_database = (CKDatabase *)v19;

    if (v14)
    {
      id v21 = (NSArray *)v14;
    }
    else
    {
      id v21 = +[WFGallerySessionManager defaultPreferredLocalizations];
    }
    preferredLocalizations = v18->_preferredLocalizations;
    v18->_preferredLocalizations = v21;

    uint64_t v23 = [v15 copy];
    currentRegion = v18->_currentRegion;
    v18->_currentRegion = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    currentIdiom = v18->_currentIdiom;
    v18->_currentIdiom = (NSString *)v25;

    v18->_performExpensiveFetchOperations = a7;
    uint64_t v27 = objc_opt_new();
    workflowSearchCache = v18->_workflowSearchCache;
    v18->_workflowSearchCache = (NSCache *)v27;

    uint64_t v29 = objc_opt_new();
    collectionSearchCache = v18->_collectionSearchCache;
    v18->_collectionSearchCache = (NSCache *)v29;

    uint64_t v31 = objc_opt_new();
    pageCache = v18->_pageCache;
    v18->_pageCache = (NSCache *)v31;

    uint64_t v33 = objc_opt_new();
    workflowCache = v18->_workflowCache;
    v18->_workflowCache = (NSCache *)v33;

    uint64_t v35 = objc_opt_new();
    bannerImageCache = v18->_bannerImageCache;
    v18->_bannerImageCache = (NSCache *)v35;

    long long v37 = v18;
  }

  return v18;
}

- (WFGallerySessionManager)init
{
  id v3 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  uint64_t v4 = [v3 stringForKey:@"WFGalleryEnvironment"];
  int v5 = (void *)v4;
  id v6 = (void *)*MEMORY[0x1E4F5ABD8];
  if (v4) {
    id v6 = (void *)v4;
  }
  id v7 = v6;

  uint64_t v8 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  if ([v8 BOOLForKey:@"WFGallerySandbox"]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }

  id v10 = [MEMORY[0x1E4F19EC8] containerIDForContainerIdentifier:v7 environment:v9];

  __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v10];
  objc_msgSend(v11, "wf_setShortcutsAppAttribution");
  int64_t v12 = (void *)MGCopyAnswer();
  id v13 = +[WFGallerySessionManager currentDeviceIdiom];
  id v14 = [(WFGallerySessionManager *)self initWithContainer:v11 preferredLocalizations:0 currentRegion:v12 currentIdiom:v13 performExpensiveFetchOperations:0];

  return v14;
}

+ (id)defaultPreferredLocalizations
{
  uint64_t v2 = [MEMORY[0x1E4F5A7A0] sharedContext];
  id v3 = [v2 applicationBundle];

  uint64_t v4 = [v3 localizations];
  int v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_opt_new();
  while ([v6 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v4 forPreferences:v6];
    uint64_t v9 = [v8 firstObject];

    if (v9) {
      [v7 addObject:v9];
    }
    [v6 removeObjectAtIndex:0];
  }
  [v7 addObject:@"en"];
  id v10 = [v7 array];

  return v10;
}

+ (WFGallerySessionManager)sharedManager
{
  if (sharedManager_onceToken_66407 != -1) {
    dispatch_once(&sharedManager_onceToken_66407, &__block_literal_global_66408);
  }
  uint64_t v2 = (void *)sharedManager_sharedManager_66409;
  return (WFGallerySessionManager *)v2;
}

void __40__WFGallerySessionManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(WFGallerySessionManager);
  v1 = (void *)sharedManager_sharedManager_66409;
  sharedManager_sharedManager_66409 = (uint64_t)v0;
}

+ (id)currentDeviceIdiom
{
  uint64_t v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  unint64_t v3 = [v2 idiom];

  if (v3 > 4) {
    return 0;
  }
  else {
    return off_1E6557AE0[v3];
  }
}

@end