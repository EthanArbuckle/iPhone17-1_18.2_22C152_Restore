@interface ICQUICoreSpotlightQueryHelper
+ (id)defaultFetchedAttributes;
+ (id)filterItems:(id)a3 usingTrashedItems:(id)a4;
+ (id)queryForMinimumSizeInMegabytes:(id)a3;
+ (id)thresholdsForLargeFiles;
+ (id)totalSizeStringForItems:(id)a3;
+ (void)deleteiCloudDriveItem:(id)a3;
+ (void)deleteiCloudDriveItems:(id)a3;
+ (void)fetchTrashedItemsWithResults:(id)a3 minSizeInMegabytes:(id)a4 completion:(id)a5;
+ (void)fetchiCloudDriveItemsUsingThresholds:(id)a3 shouldCheckTrash:(BOOL)a4 completion:(id)a5;
+ (void)processFoundResults:(id)a3 minSizeInMegabytes:(id)a4 shouldCheckTrash:(BOOL)a5 completion:(id)a6;
+ (void)updateThresholdsForLargeFilesWithDictionary:(id)a3;
@end

@implementation ICQUICoreSpotlightQueryHelper

+ (void)updateThresholdsForLargeFilesWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [a1 thresholdsForLargeFiles];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__ICQUICoreSpotlightQueryHelper_updateThresholdsForLargeFilesWithDictionary___block_invoke;
  v7[3] = &unk_264922730;
  id v8 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __77__ICQUICoreSpotlightQueryHelper_updateThresholdsForLargeFilesWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

+ (id)thresholdsForLargeFiles
{
  if (thresholdsForLargeFiles_onceToken != -1) {
    dispatch_once(&thresholdsForLargeFiles_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)thresholdsForLargeFiles_thresholds;
  return v2;
}

void __56__ICQUICoreSpotlightQueryHelper_thresholdsForLargeFiles__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)thresholdsForLargeFiles_thresholds;
  thresholdsForLargeFiles_thresholds = v0;
}

+ (id)defaultFetchedAttributes
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F02A00];
  v7[0] = *MEMORY[0x263F02290];
  v7[1] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = objc_msgSend(MEMORY[0x263F054A8], "fp_queryFetchAttributes");
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

+ (id)queryForMinimumSizeInMegabytes:(id)a3
{
  return (id)[NSString stringWithFormat:@"(%@ = \"%@\" || %@ = \"%@\", *MEMORY[0x263F02340], @"com.apple.CloudDocs.MobileDocumentsFileProvider", *MEMORY[0x263F02340], @"com.apple.CloudDocs.iCloudDriveFileProvider"", *MEMORY[0x263F02490], *MEMORY[0x263F02348], a3];
}

+ (void)fetchiCloudDriveItemsUsingThresholds:(id)a3 shouldCheckTrash:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [a3 objectForKeyedSubscript:*MEMORY[0x263F32840]];
  v10 = (void *)v9;
  v11 = &unk_26E01ED50;
  if (v9) {
    v11 = (void *)v9;
  }
  id v12 = v11;

  id v13 = objc_alloc(MEMORY[0x263F08980]);
  [v12 doubleValue];
  double v15 = v14;

  v16 = [MEMORY[0x263F08CE0] bytes];
  v17 = (void *)[v13 initWithDoubleValue:v16 unit:v15];

  v18 = NSNumber;
  v19 = [MEMORY[0x263F08CE0] megabytes];
  v20 = [v17 measurementByConvertingToUnit:v19];
  [v20 doubleValue];
  v21 = objc_msgSend(v18, "numberWithDouble:");

  v22 = [a1 queryForMinimumSizeInMegabytes:v21];
  id v23 = objc_alloc_init(MEMORY[0x263F02B28]);
  v24 = [a1 defaultFetchedAttributes];
  [v23 setFetchAttributes:v24];

  [v23 setLowPriority:0];
  v25 = (void *)[objc_alloc(MEMORY[0x263F02B20]) initWithQueryString:v22 context:v23];
  id v26 = objc_alloc_init(MEMORY[0x263F88960]);
  v27 = objc_opt_new();
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke;
  v46[3] = &unk_264922758;
  id v28 = v26;
  id v47 = v28;
  id v29 = v27;
  id v48 = v29;
  [v25 setFoundItemsHandler:v46];
  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  v37 = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2;
  v38 = &unk_2649227A8;
  id v39 = v25;
  id v40 = v28;
  id v43 = v8;
  id v44 = a1;
  id v41 = v29;
  id v42 = v21;
  BOOL v45 = a4;
  id v30 = v21;
  id v31 = v29;
  id v32 = v28;
  id v33 = v25;
  id v34 = v8;
  [v33 setCompletionHandler:&v35];
  objc_msgSend(v33, "start", v35, v36, v37, v38);
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = [v3 count];
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Found %ld iCloud Drive items", buf, 0xCu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_20;
  void v7[3] = &unk_264921B68;
  v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v5 synchronized:v7];
}

uint64_t __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_20(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a1 + 40)];
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_2(v3, v4);
  }

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else if ([*(id *)(a1 + 32) foundItemCount])
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    id v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    id v25 = 0;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_26;
    v17 = &unk_264922780;
    v19 = &v20;
    v5 = *(void **)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    [v5 synchronized:&v14];
    id v6 = *(void **)(a1 + 72);
    uint64_t v7 = v21[5];
    int v8 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 56);
    v10 = objc_msgSend(*(id *)(a1 + 64), "copy", v14, v15, v16, v17);
    [v6 processFoundResults:v7 minSizeInMegabytes:v9 shouldCheckTrash:v8 != 0 completion:v10];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    uint64_t v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_1(v11);
    }

    uint64_t v12 = *(void *)(a1 + 64);
    id v13 = ICQCreateErrorWithMessage();
    (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v13);
  }
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_26(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

+ (void)fetchTrashedItemsWithResults:(id)a3 minSizeInMegabytes:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (objc_class *)MEMORY[0x263F054A8];
  id v10 = a3;
  id v11 = [v9 alloc];
  uint64_t v12 = [v10 firstObject];

  id v13 = (void *)[v11 initWithSearchableItem:v12];
  uint64_t v14 = [v13 providerDomainID];

  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F054B8]);
    v16 = [v13 providerDomainID];
    v17 = (void *)[v15 initWithProviderDomainID:v16 itemIdentifier:*MEMORY[0x263F053F8]];

    id v18 = [MEMORY[0x263F054C0] defaultManager];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke;
    v20[3] = &unk_264922820;
    id v22 = v8;
    id v21 = v7;
    [v18 fetchURLForItemID:v17 completionHandler:v20];
  }
  else
  {
    v19 = _ICQGetLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[ICQUICoreSpotlightQueryHelper fetchTrashedItemsWithResults:minSizeInMegabytes:completion:](v19);
    }

    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v42[2] = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = *MEMORY[0x263EFF6A8];
    v42[0] = *MEMORY[0x263EFF750];
    v42[1] = v7;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:2];
    id v40 = 0;
    uint64_t v9 = [v6 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:v8 options:1 error:&v40];
    id v10 = v40;

    if (v10)
    {
      id v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_2(v10);
      }
    }
    v24 = v10;
    id v25 = v5;
    uint64_t v12 = objc_opt_new();
    id v13 = objc_alloc_init(MEMORY[0x263F88960]);
    uint64_t v14 = dispatch_group_create();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          dispatch_group_enter(v14);
          uint64_t v20 = [MEMORY[0x263F054C0] defaultManager];
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_31;
          v31[3] = &unk_2649227D0;
          id v32 = *(id *)(a1 + 32);
          id v33 = v13;
          id v34 = v12;
          uint64_t v35 = v14;
          [v20 fetchItemForURL:v19 completionHandler:v31];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v16);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_2;
    block[3] = &unk_2649227F8;
    id v21 = *(id *)(a1 + 40);
    id v29 = v12;
    id v30 = v21;
    id v22 = v12;
    dispatch_group_notify(v14, MEMORY[0x263EF83A0], block);

    id v5 = v25;
  }
  else
  {
    id v23 = _ICQGetLogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_1(v5);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_31_cold_1(v6);
    }
  }
  if (v5)
  {
    if (([v5 isFolder] & 1) == 0)
    {
      id v8 = [v5 documentSize];
      [v8 doubleValue];
      double v10 = v9;
      [*(id *)(a1 + 32) doubleValue];
      double v12 = v11;

      if (v10 > v12)
      {
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_32;
        v14[3] = &unk_264921B68;
        id v13 = *(void **)(a1 + 40);
        id v15 = *(id *)(a1 + 48);
        id v16 = v5;
        [v13 synchronized:v14];
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_32(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  id v3 = [v1 itemIdentifier];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

+ (void)processFoundResults:(id)a3 minSizeInMegabytes:(id)a4 shouldCheckTrash:(BOOL)a5 completion:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = _ICQGetLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v10 count];
    _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "Found total of %ld iCloud Drive items", buf, 0xCu);
  }

  if (a5)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __100__ICQUICoreSpotlightQueryHelper_processFoundResults_minSizeInMegabytes_shouldCheckTrash_completion___block_invoke;
    v15[3] = &unk_264922848;
    id v19 = a1;
    id v16 = v10;
    id v18 = v12;
    id v17 = v11;
    [a1 fetchTrashedItemsWithResults:v16 minSizeInMegabytes:v17 completion:v15];

    uint64_t v14 = v16;
  }
  else
  {
    uint64_t v14 = [a1 filterItems:v10 usingTrashedItems:0];
    (*((void (**)(id, id, void *, void))v12 + 2))(v12, v11, v14, 0);
  }
}

void __100__ICQUICoreSpotlightQueryHelper_processFoundResults_minSizeInMegabytes_shouldCheckTrash_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 56) filterItems:*(void *)(a1 + 32) usingTrashedItems:a2];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)filterItems:(id)a3 usingTrashedItems:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (void *)[objc_alloc(MEMORY[0x263F054A8]) initWithSearchableItem:*(void *)(*((void *)&v20 + 1) + 8 * v12)];
        if ([v13 isShared])
        {
          int v14 = [v13 isSharedByCurrentUser];
          if (!v13) {
            goto LABEL_17;
          }
        }
        else
        {
          int v14 = 1;
          if (!v13) {
            goto LABEL_17;
          }
        }
        if (([v13 isFolder] & 1) == 0 && ((v14 ^ 1) & 1) == 0)
        {
          id v15 = [v13 itemIdentifier];
          id v16 = [v6 objectForKey:v15];

          if (v16)
          {
            id v17 = _ICQGetLogSystem();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              +[ICQUICoreSpotlightQueryHelper filterItems:&v25 usingTrashedItems:v17];
            }
          }
          else
          {
            [v7 addObject:v13];
          }
        }
LABEL_17:

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }

  id v18 = (void *)[v7 copy];
  return v18;
}

+ (void)deleteiCloudDriveItems:(id)a3
{
  id v3 = (void *)MEMORY[0x263F054C0];
  id v4 = a3;
  id v6 = [v3 defaultManager];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F05560]) initWithItems:v4];

  [v6 scheduleAction:v5];
}

+ (void)deleteiCloudDriveItem:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  objc_msgSend(a1, "deleteiCloudDriveItems:", v6, v7, v8);
}

+ (id)totalSizeStringForItems:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v31 + 1) + 8 * i) documentSize];
        [v9 doubleValue];
        double v7 = v7 + v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }
  id v11 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v12 = [MEMORY[0x263F08CE0] bytes];
  id v13 = (void *)[v11 initWithDoubleValue:v12 unit:v7];

  id v14 = objc_alloc_init(MEMORY[0x263F08988]);
  [v14 setUnitStyle:1];
  id v15 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v15 setMaximumFractionDigits:0];
  id v16 = NSNumber;
  id v17 = [MEMORY[0x263F08CE0] megabytes];
  id v18 = [v13 measurementByConvertingToUnit:v17];
  [v18 doubleValue];
  id v19 = objc_msgSend(v16, "numberWithDouble:");

  [v19 doubleValue];
  if (v20 >= 1000.0)
  {
    uint64_t v25 = NSNumber;
    id v26 = [MEMORY[0x263F08CE0] gigabytes];
    uint64_t v27 = [v13 measurementByConvertingToUnit:v26];
    [v27 doubleValue];
    long long v21 = objc_msgSend(v25, "numberWithDouble:");

    [v15 setMaximumFractionDigits:1];
    long long v23 = [v15 stringFromNumber:v21];
    id v28 = [MEMORY[0x263F08CE0] gigabytes];
    id v29 = [v14 stringFromUnit:v28];

    v24 = [NSString stringWithFormat:@"%@ %@", v23, v29];
  }
  else
  {
    long long v21 = [v15 stringFromNumber:v19];
    long long v22 = [MEMORY[0x263F08CE0] megabytes];
    long long v23 = [v14 stringFromUnit:v22];

    v24 = [NSString stringWithFormat:@"%@ %@", v21, v23];
  }

  return v24;
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "+[ICQUICoreSpotlightQueryHelper fetchiCloudDriveItemsUsingThresholds:shouldCheckTrash:completion:]_block_invoke";
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "%s completed with 0 item count. ", (uint8_t *)&v1, 0xCu);
}

void __98__ICQUICoreSpotlightQueryHelper_fetchiCloudDriveItemsUsingThresholds_shouldCheckTrash_completion___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 136315394;
  uint64_t v5 = "+[ICQUICoreSpotlightQueryHelper fetchiCloudDriveItemsUsingThresholds:shouldCheckTrash:completion:]_block_invoke_2";
  __int16 v6 = 2112;
  double v7 = v3;
  _os_log_debug_impl(&dword_22C821000, a2, OS_LOG_TYPE_DEBUG, "%s completed with error: %@", (uint8_t *)&v4, 0x16u);
}

+ (void)fetchTrashedItemsWithResults:(os_log_t)log minSizeInMegabytes:completion:.cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "First item does not have a providerDomainID", v1, 2u);
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v2, v3, "There is no trash directory for this user. Error: %@", v4, v5, v6, v7, 2u);
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_cold_2(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v2, v3, "Can't read the trash: %@", v4, v5, v6, v7, 2u);
}

void __92__ICQUICoreSpotlightQueryHelper_fetchTrashedItemsWithResults_minSizeInMegabytes_completion___block_invoke_31_cold_1(void *a1)
{
  int v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0_2(&dword_22C821000, v2, v3, "Can't read trash contents: %@", v4, v5, v6, v7, 2u);
}

+ (void)filterItems:(void *)a3 usingTrashedItems:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 displayName];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_22C821000, a4, OS_LOG_TYPE_DEBUG, "This item was already deleted. Skipping %@", a1, 0xCu);
}

@end