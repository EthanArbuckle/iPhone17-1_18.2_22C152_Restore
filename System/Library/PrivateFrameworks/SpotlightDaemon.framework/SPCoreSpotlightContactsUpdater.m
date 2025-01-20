@interface SPCoreSpotlightContactsUpdater
+ (id)sharedInstance;
- (SPCoreSpotlightContactsUpdater)init;
- (id)updatedCountsFromExisting:(id)a3 result:(int64_t *)a4 shouldUpdateMonth:(BOOL)a5;
- (void)updateContactCounts:(id)a3;
@end

@implementation SPCoreSpotlightContactsUpdater

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_updater;
  return v2;
}

uint64_t __48__SPCoreSpotlightContactsUpdater_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_updater;
  sharedInstance_updater = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (SPCoreSpotlightContactsUpdater)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPCoreSpotlightContactsUpdater;
  return [(SPCoreSpotlightContactsUpdater *)&v3 init];
}

- (id)updatedCountsFromExisting:(id)a3 result:(int64_t *)a4 shouldUpdateMonth:(BOOL)a5
{
  BOOL v5 = a5;
  v23[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 count] == 4)
  {
    v7 = [v6 objectAtIndexedSubscript:3];
    uint64_t v8 = [v7 unsignedIntegerValue];

    v9 = [v6 objectAtIndexedSubscript:2];
    unint64_t v10 = [v9 unsignedIntegerValue];

    v11 = [v6 objectAtIndexedSubscript:1];
    unint64_t v12 = [v11 unsignedIntegerValue];

    v13 = [v6 objectAtIndexedSubscript:0];
    uint64_t v14 = [v13 unsignedIntegerValue];

    unint64_t v15 = v10 >> 2;
    if (!v5) {
      unint64_t v15 = 0;
    }
    unint64_t v16 = v15 + v8;
    unint64_t v17 = v10 - v15 + v12 / 7;
    v23[0] = &unk_26D0C9040;
    v18 = [NSNumber numberWithUnsignedInteger:v12 - ((4 * (v12 / 7)) >> 2) + v14];
    v23[1] = v18;
    v19 = [NSNumber numberWithUnsignedInteger:v17];
    v23[2] = v19;
    v20 = [NSNumber numberWithUnsignedInteger:v16];
    v23[3] = v20;
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)updateContactCounts:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v28 = a3;
  objc_super v3 = objc_opt_new();
  [v3 setInternal:1];
  uint64_t v27 = *MEMORY[0x263F02410];
  uint64_t v4 = *MEMORY[0x263F02410];
  v37[0] = *MEMORY[0x263F02938];
  v37[1] = v4;
  uint64_t v25 = *MEMORY[0x263F02420];
  uint64_t v5 = *MEMORY[0x263F02420];
  uint64_t v38 = *MEMORY[0x263F025D0];
  uint64_t v26 = v38;
  uint64_t v39 = v5;
  uint64_t v7 = *MEMORY[0x263F02428];
  uint64_t v40 = *MEMORY[0x263F025E0];
  uint64_t v6 = v40;
  uint64_t v41 = v7;
  uint64_t v9 = *MEMORY[0x263F02408];
  uint64_t v42 = *MEMORY[0x263F025E8];
  uint64_t v8 = v42;
  uint64_t v43 = v9;
  uint64_t v11 = *MEMORY[0x263F02418];
  uint64_t v44 = *MEMORY[0x263F025C8];
  uint64_t v10 = v44;
  uint64_t v45 = v11;
  uint64_t v13 = *MEMORY[0x263F01FD0];
  uint64_t v46 = *MEMORY[0x263F025D8];
  uint64_t v12 = v46;
  uint64_t v47 = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:12];
  [v3 setFetchAttributes:v14];

  v36 = @"com.apple.MobileAddressBook";
  unint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v36 count:1];
  [v3 setBundleIDs:v15];

  unint64_t v16 = [v3 fetchAttributes];
  uint64_t v17 = [v16 count];

  v18 = [NSString stringWithFormat:@"((%@=\"*\"", v27, v26, v25, v6, v7, v8, v9, v10, v11, v12, *MEMORY[0x263F01FC8], *MEMORY[0x263F01FC8]];
  v19 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.0];
  v20 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v28;
    _os_log_impl(&dword_21F1CE000, v20, OS_LOG_TYPE_INFO, "3 Enter group %p", buf, 0xCu);
  }

  if (v28) {
    dispatch_group_enter(v28);
  }
  v21 = +[SPCoreSpotlightIndexer sharedInstance];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke;
  v30[3] = &unk_2645091A0;
  uint64_t v33 = v17;
  v30[4] = self;
  id v31 = v19;
  v22 = v28;
  v32 = v22;
  id v23 = v19;
  v24 = [v21 startQuery:v18 withContext:v3 handler:v30];

  if (v28 && !v24) {
    dispatch_group_leave(v22);
  }
}

void __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a6;
  if (a2 == 1)
  {
    uint64_t v17 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v18;
      _os_log_impl(&dword_21F1CE000, v17, OS_LOG_TYPE_INFO, "3 Leave group %p", buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else if (!a2)
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = *(void *)(a1 + 56);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_2;
    v21[3] = &unk_264509178;
    uint64_t v12 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v12;
    id v13 = v10;
    id v23 = v13;
    [a5 enumerateQueryResults:v11 stringCache:0 usingBlock:v21];
    uint64_t v14 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v15;
      _os_log_impl(&dword_21F1CE000, v14, OS_LOG_TYPE_INFO, "4 Enter group %p", buf, 0xCu);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
    unint64_t v16 = +[SPCoreSpotlightIndexer sharedInstance];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_17;
    v19[3] = &unk_264506B90;
    id v20 = *(id *)(a1 + 48);
    [v16 indexSearchableItems:v13 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:0 forBundleID:@"com.apple.MobileAddressBook" options:0 completionHandler:v19];
  }
}

void __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_2(uint64_t a1, id *a2)
{
  v77[1] = *MEMORY[0x263EF8340];
  id v46 = *a2;
  id v4 = a2[1];
  id v5 = a2[2];
  id v6 = a2[3];
  id v53 = a2[4];
  id v7 = a2[5];
  id v8 = a2[6];
  id v52 = a2[7];
  id v51 = a2[8];
  id v50 = a2[9];
  id v49 = a2[10];
  id v48 = a2[11];
  [v48 timeIntervalSinceNow];
  double v10 = v9;
  BOOL v11 = v9 > 604800.0;
  id v12 = objc_alloc_init(MEMORY[0x263F02AE8]);
  uint64_t v45 = v4;
  id v13 = [*(id *)(a1 + 32) updatedCountsFromExisting:v4 result:0 shouldUpdateMonth:v11];
  uint64_t v44 = v5;
  uint64_t v14 = [*(id *)(a1 + 32) updatedCountsFromExisting:v5 result:0 shouldUpdateMonth:v11];
  if ([v13 count])
  {
    uint64_t v76 = *MEMORY[0x263F02410];
    v77[0] = v13;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v77 forKeys:&v76 count:1];
    [v12 addAttributesFromDictionary:v15];
  }
  if ([v14 count])
  {
    uint64_t v74 = *MEMORY[0x263F025D0];
    v75 = v14;
    unint64_t v16 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    [v12 addAttributesFromDictionary:v16];
  }
  id v17 = v6;
  uint64_t v18 = [*(id *)(a1 + 32) updatedCountsFromExisting:v6 result:0 shouldUpdateMonth:v10 > 604800.0];
  uint64_t v47 = [*(id *)(a1 + 32) updatedCountsFromExisting:v53 result:0 shouldUpdateMonth:v10 > 604800.0];
  if ([v18 count])
  {
    uint64_t v72 = *MEMORY[0x263F02420];
    v73 = v18;
    v19 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    [v12 addAttributesFromDictionary:v19];
  }
  if (objc_msgSend(v47, "count", v18))
  {
    uint64_t v70 = *MEMORY[0x263F025E0];
    v71 = v47;
    id v20 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    [v12 addAttributesFromDictionary:v20];
  }
  uint64_t v42 = v7;
  v21 = [*(id *)(a1 + 32) updatedCountsFromExisting:v7 result:0 shouldUpdateMonth:v10 > 604800.0];
  uint64_t v41 = v8;
  id v22 = [*(id *)(a1 + 32) updatedCountsFromExisting:v8 result:0 shouldUpdateMonth:v10 > 604800.0];
  if ([v21 count])
  {
    uint64_t v68 = *MEMORY[0x263F02428];
    v69 = v21;
    id v23 = [NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    [v12 addAttributesFromDictionary:v23];
  }
  uint64_t v39 = v14;
  uint64_t v40 = v13;
  if ([v22 count])
  {
    uint64_t v66 = *MEMORY[0x263F025E8];
    v67 = v22;
    v24 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    [v12 addAttributesFromDictionary:v24];
  }
  uint64_t v25 = [*(id *)(a1 + 32) updatedCountsFromExisting:v52 result:0 shouldUpdateMonth:v10 > 604800.0];
  uint64_t v26 = [*(id *)(a1 + 32) updatedCountsFromExisting:v51 result:0 shouldUpdateMonth:v10 > 604800.0];
  if ([v25 count])
  {
    uint64_t v64 = *MEMORY[0x263F02408];
    v65 = v25;
    uint64_t v27 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
    [v12 addAttributesFromDictionary:v27];
  }
  uint64_t v43 = v17;
  if ([v26 count])
  {
    uint64_t v62 = *MEMORY[0x263F025C8];
    v63 = v26;
    v28 = [NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    [v12 addAttributesFromDictionary:v28];
  }
  v29 = [*(id *)(a1 + 32) updatedCountsFromExisting:v50 result:0 shouldUpdateMonth:v10 > 604800.0];
  v30 = [*(id *)(a1 + 32) updatedCountsFromExisting:v49 result:0 shouldUpdateMonth:v10 > 604800.0];
  if ([v29 count])
  {
    uint64_t v60 = *MEMORY[0x263F02418];
    v61 = v29;
    id v31 = [NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    [v12 addAttributesFromDictionary:v31];
  }
  if ([v30 count])
  {
    uint64_t v58 = *MEMORY[0x263F025D8];
    v59 = v30;
    v32 = [NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    [v12 addAttributesFromDictionary:v32];
  }
  if (!v48 || v10 > 604800.0)
  {
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v56 = *MEMORY[0x263F01FD0];
    uint64_t v57 = v33;
    v34 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    [v12 addAttributesFromDictionary:v34];
  }
  uint64_t v35 = *(void *)(a1 + 40);
  uint64_t v54 = *MEMORY[0x263F01FC8];
  uint64_t v55 = v35;
  v36 = [NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  [v12 addAttributesFromDictionary:v36];

  id v37 = objc_alloc_init(MEMORY[0x263F02AE0]);
  [v37 setUniqueIdentifier:v46];
  [v37 setIsUpdate:1];
  [v37 setAttributeSet:v12];
  [*(id *)(a1 + 48) addObject:v37];
}

void __54__SPCoreSpotlightContactsUpdater_updateContactCounts___block_invoke_17(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_21F1CE000, v2, OS_LOG_TYPE_INFO, "4 Leave group %p", (uint8_t *)&v4, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end