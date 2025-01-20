@interface NMSMediaQuotaManager_Legacy
- (BOOL)isItemGroupWithinQuota:(id)a3;
- (NMSMediaQuotaManager_Legacy)initWithGroupIterators:(id)a3 quota:(unint64_t)a4;
- (id)_containerListForBundleIdentifier:(id)a3;
- (id)downloadInfoWithinQuota;
- (id)downloadInfoWithinQuotaForBundleIdentifier:(id)a3;
- (id)groupIteratorForBundleIdentifier:(id)a3;
- (unint64_t)sizeOfItemsWithinQuota;
- (unint64_t)sizeOfItemsWithinQuotaForBundleIdentifier:(id)a3;
- (unint64_t)sizeOfNominatedItemsForBundleIdentifier:(id)a3;
- (void)_evaluateAddedItemsIfNecessary;
@end

@implementation NMSMediaQuotaManager_Legacy

- (NMSMediaQuotaManager_Legacy)initWithGroupIterators:(id)a3 quota:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NMSMediaQuotaManager_Legacy;
  v7 = [(NMSMediaQuotaManager_Legacy *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    groupIterators = v7->_groupIterators;
    v7->_groupIterators = (NSDictionary *)v8;

    v7->_quota = a4;
    v10 = [NMSMediaDownloadInfo alloc];
    v11 = objc_opt_new();
    uint64_t v12 = [(NMSMediaDownloadInfo *)v10 initWithItems:v11];
    downloadInfoWithinQuota = v7->_downloadInfoWithinQuota;
    v7->_downloadInfoWithinQuota = (NMSMediaDownloadInfo *)v12;

    v7->_quotaUsage = 0;
    v7->_hasEvaluated = 0;
  }

  return v7;
}

- (id)groupIteratorForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [(NSDictionary *)self->_groupIterators objectForKey:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)downloadInfoWithinQuota
{
  [(NMSMediaQuotaManager_Legacy *)self _evaluateAddedItemsIfNecessary];
  downloadInfoWithinQuota = self->_downloadInfoWithinQuota;

  return downloadInfoWithinQuota;
}

- (id)downloadInfoWithinQuotaForBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(NMSMediaQuotaManager_Legacy *)self _evaluateAddedItemsIfNecessary];
  v5 = [(NMSMediaQuotaManager_Legacy *)self _containerListForBundleIdentifier:v4];

  id v6 = [v5 downloadInfoWithinQuota];

  return v6;
}

- (unint64_t)sizeOfItemsWithinQuota
{
  return self->_quotaUsage;
}

- (unint64_t)sizeOfItemsWithinQuotaForBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(NMSMediaQuotaManager_Legacy *)self _evaluateAddedItemsIfNecessary];
  v5 = [(NMSMediaQuotaManager_Legacy *)self _containerListForBundleIdentifier:v4];

  unint64_t v6 = [v5 sizeForItemListWithinQuota];
  return v6;
}

- (unint64_t)sizeOfNominatedItemsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(NMSMediaQuotaManager_Legacy *)self _evaluateAddedItemsIfNecessary];
  v5 = [(NMSMediaQuotaManager_Legacy *)self _containerListForBundleIdentifier:v4];

  unint64_t v6 = [v5 nominatedItemSize];
  return v6;
}

- (BOOL)isItemGroupWithinQuota:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v34 = a3;
  [(NMSMediaQuotaManager_Legacy *)self _evaluateAddedItemsIfNecessary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = [(NSDictionary *)self->_groupIterators allValues];
  uint64_t v29 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v29)
  {
    uint64_t v5 = *(void *)v40;
    v31 = v4;
    uint64_t v28 = *(void *)v40;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v40 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v30 = v6;
        v7 = *(void **)(*((void *)&v39 + 1) + 8 * v6);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v8 = [v7 itemGroups];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (!v9) {
          goto LABEL_24;
        }
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v36;
        v33 = v8;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v14 = [v7 iteratingOrder];
            if (v14 == 1)
            {
              objc_super v15 = [v13 quotaData];
              if ([v15 numItemsAdded]) {
                goto LABEL_21;
              }
              v21 = [v13 quotaData];
              if (([v21 hasItemsAboveQuota] & 1) == 0)
              {

LABEL_21:
                continue;
              }
              v22 = [v13 quotaData];
              v23 = [v22 quotaRefObj];
              v24 = [v34 quotaData];
              v25 = [v24 quotaRefObj];
              char v32 = [v23 isEqual:v25];

              uint64_t v8 = v33;
              if (v32)
              {
LABEL_27:

                BOOL v26 = 0;
                id v4 = v31;
                goto LABEL_29;
              }
            }
            else
            {
              if (v14) {
                continue;
              }
              objc_super v15 = [v13 quotaData];
              if (![v15 hasItemsAboveQuota]) {
                goto LABEL_21;
              }
              v16 = [v13 quotaData];
              v17 = [v16 quotaRefObj];
              v18 = [v34 quotaData];
              v19 = [v18 quotaRefObj];
              char v20 = [v17 isEqual:v19];

              uint64_t v8 = v33;
              if (v20) {
                goto LABEL_27;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v10) {
            continue;
          }
          break;
        }
LABEL_24:

        uint64_t v6 = v30 + 1;
        id v4 = v31;
        uint64_t v5 = v28;
      }
      while (v30 + 1 != v29);
      BOOL v26 = 1;
      uint64_t v29 = [v31 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (!v29) {
        goto LABEL_29;
      }
    }
  }
  BOOL v26 = 1;
LABEL_29:

  return v26;
}

- (id)_containerListForBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(NMSMediaQuotaManager_Legacy *)self _evaluateAddedItemsIfNecessary];
  uint64_t v5 = [(NSDictionary *)self->_groupIterators objectForKeyedSubscript:v4];

  return v5;
}

- (void)_evaluateAddedItemsIfNecessary
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  if (!self->_hasEvaluated)
  {
    context = (void *)MEMORY[0x223CA12B0]();
    v2 = NMLogForCategory(5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x263EFF910], "date", context);
      v3 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v87 = v3;
      _os_log_impl(&dword_2228FD000, v2, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Started QuotaEvaluation %@!", buf, 0x20u);
    }
    id v4 = NMLogForCategory(5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      groupIterators = self->_groupIterators;
      unint64_t quota = self->_quota;
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v87 = (uint64_t (*)(uint64_t, uint64_t))quota;
      LOWORD(v88) = 2114;
      *(void *)((char *)&v88 + 2) = groupIterators;
      _os_log_impl(&dword_2228FD000, v4, OS_LOG_TYPE_DEFAULT, "%@ %s Evaluating items with quota %llu for container lists %{public}@", buf, 0x2Au);
    }

    id v53 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](self->_groupIterators, "count"));
    id v55 = (id)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](self->_groupIterators, "count"));
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    obuint64_t j = self->_groupIterators;
    uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v80 objects:v89 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v81 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v80 + 1) + 8 * i);
          unint64_t v11 = self->_quota;
          NSUInteger v12 = [(NSDictionary *)self->_groupIterators count];
          v13 = [NSNumber numberWithUnsignedLongLong:v11 / v12];
          [v55 setObject:v13 forKey:v10];

          uint64_t v14 = [NMLogActionsCoalescer alloc];
          objc_super v15 = NMLogForCategory(6);
          v16 = [(NMLogActionsCoalescer *)v14 initWithIdentifier:v10 logCategory:v15];

          v17 = [@"[MediaQuota]" stringByAppendingString:@" QuotaEvaluation process"];
          [(NMLogActionsCoalescer *)v16 setPrefix:v17];

          [v54 setObject:v16 forKeyedSubscript:v10];
        }
        uint64_t v7 = [(NSDictionary *)obj countByEnumeratingWithState:&v80 objects:v89 count:16];
      }
      while (v7);
    }

    v18 = NMLogForCategory(5);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2114;
      v87 = (uint64_t (*)(uint64_t, uint64_t))v55;
      _os_log_impl(&dword_2228FD000, v18, OS_LOG_TYPE_DEFAULT, "%@ %s Calculated initial per bundleIdentifier quotas %{public}@", buf, 0x20u);
    }

    v19 = (void *)[(NSDictionary *)self->_groupIterators mutableCopy];
    v49 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSDictionary count](self->_groupIterators, "count"));
    id obja = [MEMORY[0x263EFF9C0] set];
    if ([v19 count])
    {
      v48 = v62;
      uint64_t v20 = MEMORY[0x263EF8330];
      do
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v87 = __Block_byref_object_copy__1;
        *(void *)&long long v88 = __Block_byref_object_dispose__1;
        *((void *)&v88 + 1) = 0;
        do
        {
          v73[0] = v20;
          v73[1] = 3221225472;
          v73[2] = __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke;
          v73[3] = &unk_264633BB0;
          id v21 = v55;
          id v74 = v21;
          id v22 = v54;
          id v75 = v22;
          v79 = buf;
          id v76 = v53;
          v77 = self;
          id v78 = obja;
          [v19 enumerateKeysAndObjectsUsingBlock:v73];
          if (!*(void *)(*(void *)&buf[8] + 40))
          {
            v72[0] = 0;
            v72[1] = v72;
            v72[2] = 0x2020000000;
            v72[3] = 0;
            v71[0] = MEMORY[0x263EF8330];
            v71[1] = 3221225472;
            v71[2] = __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_2;
            v71[3] = &unk_264633BD8;
            v71[4] = v72;
            v71[5] = buf;
            [v19 enumerateKeysAndObjectsUsingBlock:v71];
            _Block_object_dispose(v72, 8);
          }
        }
        while (!*(void *)(*(void *)&buf[8] + 40));
        v50 = objc_msgSend(v19, "objectForKeyedSubscript:");
        [v49 setObject:v50 forKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
        [v19 removeObjectForKey:*(void *)(*(void *)&buf[8] + 40)];
        v23 = [v22 objectForKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
        v24 = [NSString stringWithFormat:@"Removing item list"];
        v25 = +[NMGenericMessageLogAction logActionWithMessage:v24];
        [v23 addLogAction:v25];

        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        BOOL v26 = [v49 allValues];
        uint64_t v27 = 0;
        uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v85 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v68;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v68 != v29) {
                objc_enumerationMutation(v26);
              }
              v27 += objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * j), "sizeForItemListWithinQuota", context, v48);
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v85 count:16];
          }
          while (v28);
        }

        unint64_t v31 = self->_quota;
        char v32 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));

        v61[0] = MEMORY[0x263EF8330];
        v61[1] = 3221225472;
        v62[0] = __61__NMSMediaQuotaManager_Legacy__evaluateAddedItemsIfNecessary__block_invoke_3;
        v62[1] = &unk_264633C00;
        uint64_t v66 = v31 - v27;
        id v33 = v19;
        id v63 = v33;
        id v55 = v32;
        id v64 = v55;
        id v65 = v22;
        [v33 enumerateKeysAndObjectsUsingBlock:v61];

        _Block_object_dispose(buf, 8);
      }
      while ([v33 count]);
    }
    id v34 = [[NMSMediaDownloadInfo alloc] initWithItems:v53];
    downloadInfoWithinQuota = self->_downloadInfoWithinQuota;
    self->_downloadInfoWithinQuota = v34;

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v36 = [v54 allValues];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v84 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v58;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v58 != v38) {
            objc_enumerationMutation(v36);
          }
          objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * k), "flush", context);
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v57 objects:v84 count:16];
      }
      while (v37);
    }

    long long v40 = NMLogForCategory(5);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v41 = self->_quota;
      unint64_t v42 = [(NMSMediaDownloadInfo *)self->_downloadInfoWithinQuota totalItemCount];
      *(_DWORD *)buf = 138413058;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v87 = (uint64_t (*)(uint64_t, uint64_t))v41;
      LOWORD(v88) = 2048;
      *(void *)((char *)&v88 + 2) = v42;
      _os_log_impl(&dword_2228FD000, v40, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota (quota: %llu) (count: %lu)", buf, 0x2Au);
    }

    v43 = NMLogForCategory(5);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t quotaUsage = self->_quotaUsage;
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2048;
      v87 = (uint64_t (*)(uint64_t, uint64_t))quotaUsage;
      _os_log_impl(&dword_2228FD000, v43, OS_LOG_TYPE_DEFAULT, "%@ %s QuotaEvaluation result: downloadInfoWithinQuota using %llu bytes", buf, 0x20u);
    }

    [(NSDictionary *)self->_groupIterators enumerateKeysAndObjectsUsingBlock:&__block_literal_global_0];
    uint64_t v45 = NMLogForCategory(5);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = [MEMORY[0x263EFF910] date];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = @"[MediaQuota]";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[NMSMediaQuotaManager_Legacy _evaluateAddedItemsIfNecessary]";
      *(_WORD *)&buf[22] = 2112;
      v87 = v46;
      _os_log_impl(&dword_2228FD000, v45, OS_LOG_TYPE_DEFAULT, "%@ %s ****** Finished QuotaEvaluation! %@", buf, 0x20u);
    }
    self->_hasEvaluated = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadInfoWithinQuota, 0);

  objc_storeStrong((id *)&self->_groupIterators, 0);
}

@end