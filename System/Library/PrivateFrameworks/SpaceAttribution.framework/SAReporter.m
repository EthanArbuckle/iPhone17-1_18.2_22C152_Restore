@interface SAReporter
+ (void)collectSAFAppSizeResults:(id)a3;
+ (void)reportSnapshot:(id)a3;
@end

@implementation SAReporter

+ (void)collectSAFAppSizeResults:(id)a3
{
  v40[1] = *MEMORY[0x263EF8340];
  v3 = (void (**)(id, uint64_t, uint64_t))a3;
  v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[SAReporter collectSAFAppSizeResults:].cold.4(v4);
  }

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  id v31 = 0;
  v5 = objc_opt_new();
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __39__SAReporter_collectSAFAppSizeResults___block_invoke;
  v22[3] = &unk_26551E6C0;
  v24 = &v26;
  v25 = &v32;
  v7 = v6;
  v23 = v7;
  [v5 startObservingWithScanOptions:17889 updateHandler:v22];
  dispatch_time_t v8 = dispatch_time(0, 120000000000);
  if (dispatch_group_wait(v7, v8))
  {
    v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[SAReporter collectSAFAppSizeResults:](v9);
    }

    v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v39 = *MEMORY[0x263F08320];
    v11 = [MEMORY[0x263F086E0] mainBundle];
    v12 = [v11 localizedStringForKey:@"Timeout reached while collecting SpaceAttributionFramework report" value:&stru_270B070D8 table:0];
    v40[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    uint64_t v14 = [v10 errorWithDomain:*MEMORY[0x263F08438] code:60 userInfo:v13];
    v15 = (void *)v27[5];
    v27[5] = v14;

    uint64_t v16 = 0;
    v17 = v27;
LABEL_11:
    uint64_t v20 = v17[5];
    goto LABEL_12;
  }
  if (v27[5])
  {
    v18 = SALog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [(id)v27[5] localizedDescription];
      +[SAReporter collectSAFAppSizeResults:v18];
    }

    uint64_t v16 = 0;
    v17 = v27;
    goto LABEL_11;
  }
  v21 = SALog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    +[SAReporter collectSAFAppSizeResults:](v21);
  }

  uint64_t v20 = 0;
  uint64_t v16 = v33[5];
LABEL_12:
  v3[2](v3, v16, v20);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

uint64_t __39__SAReporter_collectSAFAppSizeResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v7 = SALog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __39__SAReporter_collectSAFAppSizeResults___block_invoke_cold_1(a1 + 40, v7);
    }
  }
  else
  {
    id v63 = v6;
    dispatch_time_t v8 = [v5 appData];
    v9 = [v5 hiddenAppsData];
    [v5 clonesInfo];
    v67 = id v66 = v5;
    v64 = v9;
    uint64_t v65 = a1;
    v62 = v8;
    if (v8)
    {
      v7 = objc_opt_new();
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      obuint64_t j = v8;
      uint64_t v71 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
      if (v71)
      {
        uint64_t v68 = *(void *)v91;
        v69 = v7;
        do
        {
          for (uint64_t i = 0; i != v71; ++i)
          {
            if (*(void *)v91 != v68) {
              objc_enumerationMutation(obj);
            }
            v11 = *(void **)(*((void *)&v90 + 1) + 8 * i);
            v76 = NSDictionary;
            v74 = [v11 allObjects];
            v12 = NSNumber;
            id v80 = [obj objectForKeyedSubscript:v11];
            v13 = objc_msgSend(v12, "numberWithUnsignedLongLong:", objc_msgSend(v80, "fixedSize"));
            uint64_t v14 = NSNumber;
            v78 = [obj objectForKeyedSubscript:v11];
            v15 = objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v78, "dataSize"));
            uint64_t v16 = NSNumber;
            v73 = [obj objectForKeyedSubscript:v11];
            v17 = objc_msgSend(v16, "numberWithUnsignedLongLong:", objc_msgSend(v73, "cloneSize"));
            v18 = NSNumber;
            v19 = [obj objectForKeyedSubscript:v11];
            uint64_t v20 = objc_msgSend(v18, "numberWithUnsignedLongLong:", objc_msgSend(v19, "purgeableSize"));
            v21 = [obj objectForKeyedSubscript:v11];
            v22 = [v21 vendorName];
            v23 = objc_msgSend(v76, "dictionaryWithObjectsAndKeys:", v74, @"Bundles", v13, @"fixedSize", v15, @"dataSize", v17, @"cloneSize", v20, @"purgeableSize", v22, @"vendorName", 0);

            v7 = v69;
            [v69 addObject:v23];
          }
          uint64_t v71 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
        }
        while (v71);
      }

      a1 = v65;
      id v5 = v66;
      v9 = v64;
    }
    else
    {
      v7 = 0;
    }
    v70 = v7;
    if (v9)
    {
      v77 = objc_opt_new();
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v81 = v9;
      uint64_t v79 = [v81 countByEnumeratingWithState:&v86 objects:v95 count:16];
      if (v79)
      {
        uint64_t v75 = *(void *)v87;
        do
        {
          for (uint64_t j = 0; j != v79; ++j)
          {
            if (*(void *)v87 != v75) {
              objc_enumerationMutation(v81);
            }
            uint64_t v25 = *(void *)(*((void *)&v86 + 1) + 8 * j);
            uint64_t v26 = +[SAUtilities breakCommaSeparatedStringToComponents:v25];
            v27 = [v81 objectForKeyedSubscript:v25];
            uint64_t v28 = NSDictionary;
            v29 = [v26 allObjects];
            v30 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "fixedSize"));
            id v31 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "dataSize"));
            uint64_t v32 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "cloneSize"));
            v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v27, "purgeableSize"));
            uint64_t v34 = [v27 vendorName];
            v35 = objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v29, @"Bundles", v30, @"fixedSize", v31, @"dataSize", v32, @"cloneSize", v33, @"purgeableSize", v34, @"vendorName", 0);

            [v77 addObject:v35];
          }
          uint64_t v79 = [v81 countByEnumeratingWithState:&v86 objects:v95 count:16];
        }
        while (v79);
      }

      a1 = v65;
      id v5 = v66;
      v7 = v70;
    }
    else
    {
      v77 = 0;
    }
    if (v67)
    {
      v36 = objc_opt_new();
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v37 = v67;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v82 objects:v94 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v83;
        do
        {
          for (uint64_t k = 0; k != v39; ++k)
          {
            if (*(void *)v83 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v82 + 1) + 8 * k);
            v43 = [v37 objectForKeyedSubscript:v42];
            if ([v43 count])
            {
              v44 = [v42 allObjects];
              v45 = [v44 componentsJoinedByString:@","];

              v46 = [v37 objectForKeyedSubscript:v42];
              [v36 setObject:v46 forKeyedSubscript:v45];
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v82 objects:v94 count:16];
        }
        while (v39);
      }

      a1 = v65;
      id v5 = v66;
      v7 = v70;
    }
    else
    {
      v36 = 0;
    }
    v47 = NSDictionary;
    v48 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "diskCapacity"));
    v49 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "diskUsed"));
    v50 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "totalCDAvailable"));
    v51 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "totalPurgeableClones"));
    v52 = objc_msgSend(v47, "dictionaryWithObjectsAndKeys:", v48, @"Disk Capacity", v49, @"Disk Used", v50, @"TotalCDAvailable", v51, @"TotalPurgeableClones", v7, @"Apps Data", v77, @"Hidden Apps Data", 0);

    v53 = [v5 pathsList];
    v54 = [v5 attributionTags];
    v55 = [v5 FSPurgeableData];
    v56 = [v5 appsList];
    v57 = [v5 systemDetails];
    uint64_t v58 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v52, @"App Sizer", v53, @"Paths List", v54, @"Attribution Tags", v36, @"Clones Data", v55, @"FS Purgeable Data", v57, @"System Details", v56, @"Apps List", 0);
    uint64_t v59 = *(void *)(*(void *)(a1 + 48) + 8);
    v60 = *(void **)(v59 + 40);
    *(void *)(v59 + 40) = v58;

    id v6 = v63;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return 1;
}

+ (void)reportSnapshot:(id)a3
{
  v3 = (void (**)(id, void))a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  dispatch_time_t v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__SAReporter_reportSnapshot___block_invoke;
  v4[3] = &unk_26551E6E8;
  v4[4] = &v5;
  v4[5] = &v11;
  +[SAReporter collectSAFAppSizeResults:v4];
  if (v12[5]) {
    v3[2](v3, 0);
  }
  else {
    v3[2](v3, v6[5]);
  }
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

void __29__SAReporter_reportSnapshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

+ (void)collectSAFAppSizeResults:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[SAReporter collectSAFAppSizeResults:]";
  _os_log_debug_impl(&dword_25E2BB000, log, OS_LOG_TYPE_DEBUG, "%s: Finished collecting SpaceAttributionFramework report", (uint8_t *)&v1, 0xCu);
}

+ (void)collectSAFAppSizeResults:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "+[SAReporter collectSAFAppSizeResults:]";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "%s: Encountered an error while collecting SpaceAttributionFramework report: %@", buf, 0x16u);
}

+ (void)collectSAFAppSizeResults:(os_log_t)log .cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[SAReporter collectSAFAppSizeResults:]";
  _os_log_error_impl(&dword_25E2BB000, log, OS_LOG_TYPE_ERROR, "%s: Timeout reached while collecting SpaceAttributionFramework report", (uint8_t *)&v1, 0xCu);
}

+ (void)collectSAFAppSizeResults:(os_log_t)log .cold.4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "+[SAReporter collectSAFAppSizeResults:]";
  _os_log_debug_impl(&dword_25E2BB000, log, OS_LOG_TYPE_DEBUG, "%s: Started to collect SpaceAttributionFramework report...", (uint8_t *)&v1, 0xCu);
}

void __39__SAReporter_collectSAFAppSizeResults___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) localizedDescription];
  int v4 = 136315394;
  id v5 = "+[SAReporter collectSAFAppSizeResults:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_25E2BB000, a2, OS_LOG_TYPE_ERROR, "%s: Encountered error while running app sizer: %@", (uint8_t *)&v4, 0x16u);
}

@end