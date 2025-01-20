@interface NMSMediaQuotaManager
- (BOOL)_legacy_musicDidSkipItem;
- (NMSMediaQuotaManager)initWithItemEnumerators:(id)a3 estimatedItemSizes:(id)a4 quota:(unint64_t)a5;
- (id)_newMutableItemEnumeratorDict;
- (id)downloadInfoWithinQuota;
- (id)downloadInfoWithinQuotaForBundleIdentifier:(id)a3;
- (void)_evaluateAddedItemsIfNecessary;
@end

@implementation NMSMediaQuotaManager

- (NMSMediaQuotaManager)initWithItemEnumerators:(id)a3 estimatedItemSizes:(id)a4 quota:(unint64_t)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)NMSMediaQuotaManager;
  v10 = [(NMSMediaQuotaManager *)&v31 init];
  if (v10)
  {
    id v26 = v9;
    uint64_t v11 = [v8 mutableCopy];
    itemEnumerators = v10->_itemEnumerators;
    v10->_itemEnumerators = (NSMutableDictionary *)v11;

    objc_storeStrong((id *)&v10->_estimatedItemSizes, a4);
    v10->_quota = a5;
    v13 = objc_alloc_init(NMSMutableMediaDownloadInfo);
    downloadInfoWithinQuota = v10->_downloadInfoWithinQuota;
    v10->_downloadInfoWithinQuota = v13;

    v15 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v16 = [v8 keyEnumerator];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * v20);
          v22 = objc_alloc_init(NMSMutableMediaDownloadInfo);
          [v15 setObject:v22 forKeyedSubscript:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v18);
    }

    uint64_t v23 = [v15 copy];
    downloadInfoWithinQuotaForIdentifiers = v10->_downloadInfoWithinQuotaForIdentifiers;
    v10->_downloadInfoWithinQuotaForIdentifiers = (NSDictionary *)v23;

    *(_WORD *)&v10->_hasEvaluated = 0;
    id v9 = v26;
  }

  return v10;
}

- (id)downloadInfoWithinQuota
{
  [(NMSMediaQuotaManager *)self _evaluateAddedItemsIfNecessary];
  downloadInfoWithinQuota = self->_downloadInfoWithinQuota;

  return downloadInfoWithinQuota;
}

- (id)downloadInfoWithinQuotaForBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(NMSMediaQuotaManager *)self _evaluateAddedItemsIfNecessary];
  v5 = [(NSDictionary *)self->_downloadInfoWithinQuotaForIdentifiers objectForKeyedSubscript:v4];

  return v5;
}

- (BOOL)_legacy_musicDidSkipItem
{
  return self->_legacy_musicDidSkipItem;
}

- (id)_newMutableItemEnumeratorDict
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableDictionary *)self->_itemEnumerators keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        v10 = objc_alloc_init(NMSMutableItemEnumerator);
        [v3 setObject:v10 forKeyedSubscript:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_evaluateAddedItemsIfNecessary
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  if (!self->_hasEvaluated)
  {
    v3 = NMLogForCategory(5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [MEMORY[0x263EFF910] date];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v120 = v4;
      _os_log_impl(&dword_2228FD000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Started QuotaEvaluation %@!", buf, 0x20u);
    }
    uint64_t v5 = NMLogForCategory(5);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t quota = self->_quota;
      itemEnumerators = self->_itemEnumerators;
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v120 = (uint64_t (*)(uint64_t, uint64_t))quota;
      LOWORD(v121) = 2114;
      *(void *)((char *)&v121 + 2) = itemEnumerators;
      _os_log_impl(&dword_2228FD000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluating items with quota %llu for container lists %{public}@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
    id v73 = (id)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    obuint64_t j = [(NSMutableDictionary *)self->_itemEnumerators keyEnumerator];
    uint64_t v8 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v113 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v112 + 1) + 8 * i);
          unint64_t v12 = self->_quota;
          unint64_t v13 = [(NSMutableDictionary *)self->_itemEnumerators count];
          long long v14 = [NSNumber numberWithUnsignedLongLong:v12 / v13];
          [v73 setObject:v14 forKey:v11];

          long long v15 = [NMLogActionsCoalescer alloc];
          v16 = NMLogForCategory(6);
          uint64_t v17 = [(NMLogActionsCoalescer *)v15 initWithIdentifier:v11 logCategory:v16];

          uint64_t v18 = [@"[MediaQuota]" stringByAppendingString:@" QuotaEvaluation process"];
          [(NMLogActionsCoalescer *)v17 setPrefix:v18];

          [v72 setObject:v17 forKeyedSubscript:v11];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v112 objects:v122 count:16];
      }
      while (v8);
    }

    uint64_t v19 = NMLogForCategory(5);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2114;
      v120 = (uint64_t (*)(uint64_t, uint64_t))v73;
      _os_log_impl(&dword_2228FD000, v19, OS_LOG_TYPE_DEFAULT, "%@ %s Calculated initial per bundleIdentifier quotas %{public}@", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));
    id obja = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [(NMSMediaQuotaManager *)self _newMutableItemEnumeratorDict];
    id v21 = [(NMSMediaQuotaManager *)self _newMutableItemEnumeratorDict];
    uint64_t v22 = [(NSMutableDictionary *)self->_itemEnumerators count];
    if (v22)
    {
      v67 = &v121;
      v68 = &v120;
      v63 = &v102;
      v64 = &v101;
      v62 = v96;
      v65 = v83;
      v66 = v105;
      do
      {
        context = (void *)MEMORY[0x223CA12B0](v22, v23, v24, v25, v26, v27, v28);
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v120 = __Block_byref_object_copy_;
        *(void *)&long long v121 = __Block_byref_object_dispose_;
        *((void *)&v121 + 1) = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v29 = self->_itemEnumerators;
        v104[0] = MEMORY[0x263EF8330];
        v104[1] = 3221225472;
        v105[0] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke;
        v105[1] = &unk_2646339A0;
        id v30 = v72;
        id v106 = v30;
        id v74 = v73;
        id v107 = v74;
        v108 = self;
        id v71 = v20;
        id v109 = v71;
        id v70 = v21;
        id v110 = v70;
        v111 = buf;
        -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v29, "enumerateKeysAndObjectsUsingBlock:", v104, v62, v63, v64, v65, v66, v67, v68);
        if (![*(id *)(*(void *)&buf[8] + 40) count])
        {
          uint64_t v98 = 0;
          v99 = &v98;
          uint64_t v100 = 0x3032000000;
          v101 = __Block_byref_object_copy_;
          v102 = __Block_byref_object_dispose_;
          id v103 = 0;
          v97[0] = 0;
          v97[1] = v97;
          v97[2] = 0x2020000000;
          v97[3] = 0;
          objc_super v31 = self->_itemEnumerators;
          v95[0] = MEMORY[0x263EF8330];
          v95[1] = 3221225472;
          v96[0] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_2;
          v96[1] = &unk_2646339C8;
          v96[2] = self;
          v96[3] = v97;
          v96[4] = &v98;
          [(NSMutableDictionary *)v31 enumerateKeysAndObjectsUsingBlock:v95];
          [*(id *)(*(void *)&buf[8] + 40) addObject:v99[5]];
          if ([(id)v99[5] isEqualToString:@"com.apple.NanoMusic"]) {
            self->_legacy_musicDidSkipIteuint64_t m = 1;
          }
          _Block_object_dispose(v97, 8);
          _Block_object_dispose(&v98, 8);
        }
        long long v93 = 0u;
        long long v94 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        id v32 = *(id *)(*(void *)&buf[8] + 40);
        uint64_t v33 = [v32 countByEnumeratingWithState:&v91 objects:v118 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v92;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v92 != v34) {
                objc_enumerationMutation(v32);
              }
              uint64_t v36 = *(void *)(*((void *)&v91 + 1) + 8 * j);
              v37 = [(NSMutableDictionary *)self->_itemEnumerators objectForKeyedSubscript:v36];
              [obja setObject:v37 forKeyedSubscript:v36];
              [(NSMutableDictionary *)self->_itemEnumerators removeObjectForKey:v36];
              v38 = [v30 objectForKeyedSubscript:v36];
              v39 = [NSString stringWithFormat:@"Removing item list"];
              v40 = +[NMGenericMessageLogAction logActionWithMessage:v39];
              [v38 addLogAction:v40];
            }
            uint64_t v33 = [v32 countByEnumeratingWithState:&v91 objects:v118 count:16];
          }
          while (v33);
        }

        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        v41 = [obja keyEnumerator];
        uint64_t v42 = 0;
        uint64_t v43 = [v41 countByEnumeratingWithState:&v87 objects:v117 count:16];
        if (v43)
        {
          uint64_t v44 = *(void *)v88;
          do
          {
            for (uint64_t k = 0; k != v43; ++k)
            {
              if (*(void *)v88 != v44) {
                objc_enumerationMutation(v41);
              }
              v46 = [(NSDictionary *)self->_downloadInfoWithinQuotaForIdentifiers objectForKeyedSubscript:*(void *)(*((void *)&v87 + 1) + 8 * k)];
              uint64_t v47 = [v46 totalItemSize];

              v42 += v47;
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v87 objects:v117 count:16];
          }
          while (v43);
        }

        unint64_t v48 = self->_quota;
        v49 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_itemEnumerators, "count"));

        v50 = self->_itemEnumerators;
        v82[0] = MEMORY[0x263EF8330];
        v82[1] = 3221225472;
        v83[0] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_3;
        v83[1] = &unk_2646339F0;
        uint64_t v86 = v48 - v42;
        v83[2] = self;
        id v73 = v49;
        id v84 = v73;
        id v85 = v30;
        [(NSMutableDictionary *)v50 enumerateKeysAndObjectsUsingBlock:v82];
        id v20 = v70;

        id v21 = [(NMSMediaQuotaManager *)self _newMutableItemEnumeratorDict];
        _Block_object_dispose(buf, 8);

        uint64_t v22 = [(NSMutableDictionary *)self->_itemEnumerators count];
      }
      while (v22);
    }
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    v51 = [v72 allValues];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v78 objects:v116 count:16];
    if (v52)
    {
      uint64_t v53 = *(void *)v79;
      do
      {
        for (uint64_t m = 0; m != v52; ++m)
        {
          if (*(void *)v79 != v53) {
            objc_enumerationMutation(v51);
          }
          [*(id *)(*((void *)&v78 + 1) + 8 * m) flush];
        }
        uint64_t v52 = [v51 countByEnumeratingWithState:&v78 objects:v116 count:16];
      }
      while (v52);
    }

    v55 = NMLogForCategory(5);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v56 = self->_quota;
      unint64_t v57 = [(NMSMediaDownloadInfo *)self->_downloadInfoWithinQuota totalItemCount];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v120 = (uint64_t (*)(uint64_t, uint64_t))v56;
      LOWORD(v121) = 2048;
      *(void *)((char *)&v121 + 2) = v57;
      _os_log_impl(&dword_2228FD000, v55, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota (quota: %llu) (count: %lu)", buf, 0x2Au);
    }

    v58 = NMLogForCategory(5);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v59 = [(NMSMediaDownloadInfo *)self->_downloadInfoWithinQuota totalItemSize];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v120 = (uint64_t (*)(uint64_t, uint64_t))v59;
      _os_log_impl(&dword_2228FD000, v58, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota using %llu bytes", buf, 0x20u);
    }

    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_122;
    v77[3] = &unk_264633A18;
    v77[4] = self;
    [obja enumerateKeysAndObjectsUsingBlock:v77];
    v60 = NMLogForCategory(5);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      v61 = [MEMORY[0x263EFF910] date];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v120 = v61;
      _os_log_impl(&dword_2228FD000, v60, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Finished QuotaEvaluation! %@", buf, 0x20u);
    }
    self->_hasEvaluated = 1;
  }
}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v31 = a2;
  id v29 = a3;
  id v30 = [*(id *)(a1 + 32) objectForKeyedSubscript:v31];
  uint64_t v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:v31];
  unint64_t v6 = [v5 unsignedLongLongValue];

  uint64_t v7 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:v31];
  uint64_t v8 = [v7 unsignedLongLongValue];

  uint64_t v9 = [*(id *)(*(void *)(a1 + 48) + 40) objectForKeyedSubscript:v31];
  v10 = [*(id *)(a1 + 56) objectForKeyedSubscript:v31];
  uint64_t v28 = [*(id *)(a1 + 64) objectForKeyedSubscript:v31];
  while (1)
  {
    uint64_t v11 = (void *)MEMORY[0x223CA12B0]();
    unint64_t v12 = [v10 nextItem];
    unint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [v29 nextItem];
    }
    long long v15 = v14;

    v16 = [[NMSQuotaEvaluationState alloc] initWithCurrentItem:v15 downloadInfo:v9];
    if (!v15) {
      break;
    }
    if (([*(id *)(*(void *)(a1 + 48) + 32) containsItem:v15] & 1) == 0)
    {
      if ([v15 isManuallyAdded])
      {
        uint64_t v17 = +[NMSQuotaEvaluationLogAction logActionWithActionType:2 state:v16];
        [v30 addLogAction:v17];
      }
      else
      {
        uint64_t v18 = [*(id *)(*(void *)(a1 + 48) + 32) totalItemSize];
        if ((unint64_t)([v15 size] + v18) <= *(void *)(*(void *)(a1 + 48) + 24))
        {
          uint64_t v20 = [v9 totalItemSize];
          if ([v15 size] + v20 <= v6)
          {
            uint64_t v23 = +[NMSQuotaEvaluationLogAction logActionWithActionType:0 state:v16];
            [v30 addLogAction:v23];

            [*(id *)(*(void *)(a1 + 48) + 32) addItem:v15];
            uint64_t v22 = v9;
          }
          else
          {
            id v21 = +[NMSQuotaEvaluationLogAction logActionWithActionType:1 state:v16];
            [v30 addLogAction:v21];

            uint64_t v22 = v28;
          }
          [v22 addItem:v15];
        }
        else
        {
          uint64_t v19 = +[NMSQuotaEvaluationLogAction logActionWithActionType:2 state:v16];
          [v30 addLogAction:v19];

          if ([v31 isEqualToString:@"com.apple.NanoMusic"]) {
            *(unsigned char *)(*(void *)(a1 + 48) + 49) = 1;
          }
        }
      }
    }
    if ([v9 totalItemSize] + v8 > v6)
    {
      uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"Ending iteration within %llu of list quota - estimated item size %llu", v6 - objc_msgSend(v9, "totalItemSize"), v8);
      uint64_t v26 = +[NMGenericMessageLogAction logActionWithMessage:v25];
      uint64_t v24 = v30;
      [v30 addLogAction:v26];

      goto LABEL_21;
    }
  }
  uint64_t v24 = v30;
  if ([v28 hasItems])
  {
    uint64_t v25 = +[NMGenericMessageLogAction logActionWithMessage:@"Ran out of items. Enumerator has skipped items remaining."];
    [v30 addLogAction:v25];
LABEL_21:

    goto LABEL_23;
  }
  uint64_t v27 = +[NMGenericMessageLogAction logActionWithMessage:@"Ran out of items."];
  [v30 addLogAction:v27];

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:v31];
LABEL_23:
}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_2(void *a1, void *a2)
{
  id v7 = a2;
  id v4 = objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:");
  unint64_t v5 = [v4 unsignedLongLongValue];
  unint64_t v6 = *(void *)(*(void *)(a1[5] + 8) + 24);

  if (v5 > v6) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(a1 + 56);
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  unint64_t v6 = [v4 count];
  id v7 = *(void **)(a1 + 40);
  unint64_t v8 = v3 / v6;
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:v8];
  [v7 setObject:v9 forKey:v5];

  id v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v5];

  v10 = objc_msgSend(NSString, "stringWithFormat:", @"Reset to iterate over bundle identifiers with new quota %llu", v8);
  uint64_t v11 = +[NMGenericMessageLogAction logActionWithMessage:v10];
  [v12 addLogAction:v11];
}

void __54__NMSMediaQuotaManager__evaluateAddedItemsIfNecessary__block_invoke_122(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = NMLogForCategory(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v3];
    uint64_t v6 = [v5 totalItemSize];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:v3];
    int v8 = 138413314;
    uint64_t v9 = @"[MediaQuota]";
    __int16 v10 = 2080;
    uint64_t v11 = "-[NMSMediaQuotaManager _evaluateAddedItemsIfNecessary]_block_invoke";
    __int16 v12 = 2114;
    id v13 = v3;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2048;
    uint64_t v17 = [v7 totalItemCount];
    _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluation result: container list %{public}@ used %llu bytes for %lu items", (uint8_t *)&v8, 0x34u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadInfoWithinQuotaForIdentifiers, 0);
  objc_storeStrong((id *)&self->_downloadInfoWithinQuota, 0);
  objc_storeStrong((id *)&self->_estimatedItemSizes, 0);

  objc_storeStrong((id *)&self->_itemEnumerators, 0);
}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v36 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) objectForKey:v36];
  unint64_t v8 = [v7 unsignedLongLongValue];

  uint64_t v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v36];
  __int16 v10 = (void *)v9;
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    goto LABEL_21;
  }
  uint64_t v11 = &OBJC_METACLASS___NMSMediaSyncServiceKeepLocalResponse;
  v35 = (void *)v9;
  while (1)
  {
    __int16 v12 = [v6 currentItem];
    uint64_t v13 = [v6 sizeForCurrentIdentifier];
    uint64_t v14 = [v6 sizeForItemListWithinQuota];
    if (!v12)
    {
      id v32 = +[NMGenericMessageLogAction logActionWithMessage:@"Ran out of items"];
      [v10 addLogAction:v32];

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v4);
      goto LABEL_20;
    }
    uint64_t v15 = v14;
    if ([v12 isManuallyAdded])
    {
      __int16 v16 = [v6 evaluationState];
      uint64_t v17 = [&v11[5] logActionWithActionType:0 state:v16];
      [v10 addLogAction:v17];

      [*(id *)(a1 + 48) addObject:v12];
      uint64_t v18 = v6;
      uint64_t v19 = 0;
      goto LABEL_15;
    }
    if ([v6 estimatedItemSize] + v15 > v8) {
      break;
    }
    if (([v6 isCurrentIdentifierEstimate] & 1) == 0
      && [*(id *)(a1 + 48) containsObject:v12])
    {
      goto LABEL_14;
    }
    if ((unint64_t)(*(void *)(*(void *)(a1 + 56) + 32) + v13) <= *(void *)(*(void *)(a1 + 56) + 16))
    {
      if (v15 + v13 <= v8)
      {
        uint64_t v24 = [*(id *)(a1 + 64) containsObject:v12];
        [*(id *)(a1 + 64) removeObject:v12];
        uint64_t v25 = v4;
        uint64_t v26 = v11 + 5;
        [v6 evaluationState];
        unint64_t v27 = v8;
        v29 = uint64_t v28 = v11;
        id v30 = v26;
        id v4 = v25;
        __int16 v10 = v35;
        id v31 = [(__objc2_class *)v30 logActionWithActionType:v24 state:v29];
        [v35 addLogAction:v31];

        uint64_t v11 = v28;
        unint64_t v8 = v27;
        [*(id *)(a1 + 48) addObject:v12];
        *(void *)(*(void *)(a1 + 56) + 32) += v13;
LABEL_14:
        uint64_t v18 = v6;
        uint64_t v19 = 1;
LABEL_15:
        [v18 addCurrentIdentifierToWithinQuotaListAndCountSizeTowardsQuota:v19];
        goto LABEL_16;
      }
      [v6 skipCurrentIdentifier];
      uint64_t v22 = [v6 evaluationState];
      uint64_t v23 = [&v11[5] logActionWithActionType:2 state:v22];
      [v10 addLogAction:v23];
    }
    else
    {
      uint64_t v20 = [v6 evaluationState];
      id v21 = [&v11[5] logActionWithActionType:3 state:v20];
      [v10 addLogAction:v21];

      [v6 removeCurrentIdentifier];
    }
LABEL_16:

    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
      goto LABEL_21;
    }
  }
  uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"Ending iteration within %llu of listQuota - estimated item size %llu", v8 - v15, objc_msgSend(v6, "estimatedItemSize"));
  uint64_t v34 = +[NMGenericMessageLogAction logActionWithMessage:v33];
  [v35 addLogAction:v34];

  __int16 v10 = v35;
  [v6 markAllRemainingContainersAsSkipped];
LABEL_20:

LABEL_21:
}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if ((unint64_t)[a3 estimatedItemSize] > *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24))
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  unint64_t v9 = [v6 count];
  __int16 v10 = *(void **)(a1 + 40);
  unint64_t v11 = v5 / v9;
  __int16 v12 = [NSNumber numberWithUnsignedLongLong:v11];
  [v10 setObject:v12 forKey:v8];

  [v7 resetToIterateOverQuotaIdentifiers];
  id v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:v8];

  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Reset to iterate over bundle identifiers with new quota %llu", v11);
  uint64_t v14 = +[NMGenericMessageLogAction logActionWithMessage:v13];
  [v15 addLogAction:v14];
}

void __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  id v6 = NMLogForCategory(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 sizeForItemListWithinQuota];
    id v8 = [v5 downloadInfoWithinQuota];
    int v9 = 138413314;
    __int16 v10 = @"[MediaQuota]";
    __int16 v11 = 2080;
    __int16 v12 = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v4;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = [v8 totalItemCount];
    _os_log_impl(&dword_2228FD000, v6, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluation result: container list %{public}@ used %llu bytes for %lu items", (uint8_t *)&v9, 0x34u);
  }
}

@end