@interface PPEventKitImporter
+ (id)_escapedDomainIdentifierForIdentifier:(uint64_t)a1;
+ (id)defaultInstance;
+ (uint64_t)_shouldImport;
- (BOOL)deleteAndReimportAllData;
- (PPEventKitImporter)initWithEventStore:(id)a3 namedEntityStore:(id)a4 locationStore:(id)a5 topicStore:(id)a6 urlStore:(id)a7 urlDissector:(id)a8 namedEntityDissector:(id)a9 dataDetectorMatchClass:(Class)a10 sqlDatabase:(id)a11;
- (id)_timeRangeForReimport;
- (id)importEventData;
- (id)importEventDataWithShouldContinueBlock:(id)a3;
- (void)_donateContainerContents:(uint64_t)a1;
- (void)_flush;
- (void)_importEvent:(int)a3 isMostRelevantOccurrence:;
- (void)_importEvents:(uint64_t)a1;
- (void)importChangedEvents:(id)a3;
- (void)importEvent:(id)a3;
@end

@implementation PPEventKitImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neDissector, 0);
  objc_storeStrong((id *)&self->_urlDissector, 0);
  objc_storeStrong((id *)&self->_sqlDatabase, 0);
  objc_storeStrong((id *)&self->_urlStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (BOOL)deleteAndReimportAllData
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  uint64_t v92 = os_transaction_create();
  v3 = (uint64_t *)MEMORY[0x1E4F8A040];
  v98 = self;
  if (self)
  {
    v4 = -[PPEventKitImporter _timeRangeForReimport]();
    uint64_t v5 = [v4 startDate];
    v90 = v4;
    uint64_t v6 = [v4 endDate];
    uint64_t v7 = objc_opt_new();
    v8 = objc_opt_new();
    v9 = (void *)MEMORY[0x1CB79D060]();
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = *v3;
    v12 = objc_msgSend(v10, "initWithObjects:", *v3, 0);
    [v8 setMatchingSourceBundleIds:v12];

    v95 = (void *)v5;
    [v8 setFromDate:v5];
    obuint64_t j = (void *)v6;
    [v8 setToDate:v6];
    [v8 setFilterByRelevanceDate:1];
    namedEntityStore = self->_namedEntityStore;
    *(void *)v119 = 0;
    *(void *)&long long v115 = MEMORY[0x1E4F143A8];
    *((void *)&v115 + 1) = 3221225472;
    *(void *)&long long v116 = __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke;
    *((void *)&v116 + 1) = &unk_1E65DBE80;
    id v14 = (id)v7;
    *(void *)&long long v117 = v14;
    LOBYTE(v7) = [(PPLocalNamedEntityStore *)namedEntityStore iterNamedEntityRecordsWithQuery:v8 error:v119 block:&v115];
    id v15 = *(id *)v119;
    if ((v7 & 1) == 0)
    {
      v16 = pp_default_log_handle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = v15;
        _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPEventKitImporter: _eventIdentifiersToReimport: error from NE store: %@", (uint8_t *)&block, 0xCu);
      }
    }
    v17 = objc_opt_new();
    v18 = (void *)MEMORY[0x1CB79D060]();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v11, 0);
    [v17 setMatchingSourceBundleIds:v19];

    [v17 setFromDate:v95];
    [v17 setToDate:obj];
    [v17 setFilterByRelevanceDate:1];
    locationStore = self->_locationStore;
    id v102 = v15;
    v107 = MEMORY[0x1E4F143A8];
    uint64_t v108 = 3221225472;
    v109 = __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_153;
    v110 = &unk_1E65DC710;
    v21 = (PPEventKitImporter *)v14;
    v111 = v21;
    LOBYTE(locationStore) = [(PPLocalLocationStore *)locationStore iterLocationRecordsWithQuery:v17 error:&v102 block:&v107];
    id v22 = v102;

    if ((locationStore & 1) == 0)
    {
      v23 = pp_default_log_handle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = v22;
        _os_log_error_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_ERROR, "PPEventKitImporter: _eventIdentifiersToReimport: error from Location store: %@", (uint8_t *)&block, 0xCu);
      }
    }
    v24 = objc_opt_new();
    v25 = (void *)MEMORY[0x1CB79D060]();
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v11, 0);
    [v24 setMatchingSourceBundleIds:v26];

    [v24 setFromDate:v95];
    [v24 setToDate:obj];
    [v24 setFilterByRelevanceDate:1];
    topicStore = self->_topicStore;
    id v101 = v22;
    *(void *)&long long v103 = MEMORY[0x1E4F143A8];
    *((void *)&v103 + 1) = 3221225472;
    *(void *)&long long v104 = __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_156;
    *((void *)&v104 + 1) = &unk_1E65DBEA8;
    v28 = v21;
    *(void *)&long long v105 = v28;
    LOBYTE(topicStore) = [(PPLocalTopicStore *)topicStore iterTopicRecordsWithQuery:v24 error:&v101 block:&v103];
    id v29 = v101;

    if ((topicStore & 1) == 0)
    {
      v30 = pp_default_log_handle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = v29;
        _os_log_error_impl(&dword_1CA9A8000, v30, OS_LOG_TYPE_ERROR, "PPEventKitImporter: _eventIdentifiersToReimport: error from Topic store: %@", (uint8_t *)&block, 0xCu);
      }
    }
    v31 = [MEMORY[0x1E4F5DF90] urlsFoundBetweenStartDate:v95 endDate:obj bundleIdentifier:v11 entityStore:self->_urlStore];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v120 objects:&block count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v121;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v121 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v120 + 1) + 8 * i) groupIdentifier];
          if (v37)
          {
            v38 = (void *)MEMORY[0x1CB79D060]();
            id v39 = [v37 stringByRemovingPercentEncoding];
            if (!v39)
            {
              v40 = pp_default_log_handle();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v37;
                _os_log_fault_impl(&dword_1CA9A8000, v40, OS_LOG_TYPE_FAULT, "PPEventKitImporter: failed to remove percent encoding from %@", (uint8_t *)&buf, 0xCu);
              }

              id v39 = v37;
            }
            [(PPEventKitImporter *)v28 addObject:v39];
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v120 objects:&block count:16];
      }
      while (v34);
    }

    v41 = pp_default_log_handle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = [(PPEventKitImporter *)v28 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v42;
      _os_log_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: documentIds to reimport count: %tu", (uint8_t *)&buf, 0xCu);
    }

    v43 = [(PPEventKitImporter *)v28 _pas_mappedSetWithTransform:&__block_literal_global_162];
  }
  else
  {
    v43 = 0;
  }
  v44 = (void *)v92;
  v45 = pp_default_log_handle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(block) = 138412290;
    *(void *)((char *)&block + 4) = v43;
    _os_log_debug_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleteAndReimportAllData will reimport %@", (uint8_t *)&block, 0xCu);
  }

  if (v98)
  {
    v46 = v98->_namedEntityStore;
    uint64_t v47 = *MEMORY[0x1E4F8A040];
    *(void *)&long long v120 = 0;
    BOOL v48 = [(PPLocalNamedEntityStore *)v46 deleteAllNamedEntitiesFromSourcesWithBundleId:v47 deletedCount:0 error:&v120];
    id v49 = (id)v120;
    if (v48)
    {
      if ([MEMORY[0x1E4F5DF90] deleteAllURLsWithBundleIdentifier:v47 entityStore:0])
      {
        v50 = v98->_locationStore;
        *(void *)&long long v115 = v49;
        BOOL v51 = [(PPLocalLocationStore *)v50 deleteAllLocationsFromSourcesWithBundleId:v47 deletedCount:0 error:&v115];
        v52 = (id)v115;

        if (v51)
        {
          v53 = v98->_topicStore;
          v107 = v52;
          BOOL v54 = [(PPLocalTopicStore *)v53 deleteAllTopicsFromSourcesWithBundleId:v47 deletedCount:0 error:&v107];
          v55 = v107;

          if (v54)
          {
            -[PPEventKitImporter _flush]((uint64_t)v98);
            v56 = pp_default_log_handle();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block) = 0;
              _os_log_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted all extractions", (uint8_t *)&block, 2u);
            }
          }
          else
          {
            v56 = pp_default_log_handle();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              LODWORD(block) = 138412290;
              *(void *)((char *)&block + 4) = v55;
              _os_log_error_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all topics: %@", (uint8_t *)&block, 0xCu);
            }
          }
          v52 = v55;
        }
        else
        {
          v56 = pp_default_log_handle();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            LODWORD(block) = 138412290;
            *(void *)((char *)&block + 4) = v52;
            _os_log_error_impl(&dword_1CA9A8000, v56, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all locations: %@", (uint8_t *)&block, 0xCu);
          }
        }
        goto LABEL_46;
      }
      v60 = pp_default_log_handle();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LOWORD(block) = 0;
        _os_log_error_impl(&dword_1CA9A8000, v60, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all URLs", (uint8_t *)&block, 2u);
      }

      v58 = +[PPMetricsUtils loggingQueue];
      *(void *)&blocuint64_t k = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3221225472;
      v59 = __43__PPEventKitImporter__deleteAllExtractions__block_invoke_184;
    }
    else
    {
      v57 = pp_default_log_handle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = v49;
        _os_log_error_impl(&dword_1CA9A8000, v57, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete all named entities: %@", (uint8_t *)&block, 0xCu);
      }

      v58 = +[PPMetricsUtils loggingQueue];
      *(void *)&blocuint64_t k = MEMORY[0x1E4F143A8];
      *((void *)&block + 1) = 3221225472;
      v59 = __43__PPEventKitImporter__deleteAllExtractions__block_invoke;
    }
    v130 = v59;
    v131 = &unk_1E65DBE30;
    v52 = v49;
    v132 = v52;
    dispatch_async(v58, &block);

    v56 = v132;
LABEL_46:
  }
  id v61 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v62 = [(PPEventKitImporter *)v98 importEventData];
  v63 = (void *)[v61 initWithArray:v62];

  v64 = pp_default_log_handle();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(block) = 138412290;
    *(void *)((char *)&block + 4) = v63;
    _os_log_debug_impl(&dword_1CA9A8000, v64, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleteAndReimportAllData found in standard time window: %@", (uint8_t *)&block, 0xCu);
  }

  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __46__PPEventKitImporter_deleteAndReimportAllData__block_invoke;
  v99[3] = &unk_1E65DBE58;
  id v100 = v63;
  id v65 = v63;
  objc_msgSend(v43, "_pas_filteredSetWithTest:", v99);
  id v66 = (id)objc_claimAutoreleasedReturnValue();
  if (v98)
  {
    if (+[PPEventKitImporter _shouldImport]())
    {
      id v89 = v65;
      v91 = v43;
      v96 = -[PPEventKitImporter _timeRangeForReimport]();
      v97 = objc_opt_new();
      long long v115 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      id v88 = v66;
      id obja = v66;
      uint64_t v67 = [obja countByEnumeratingWithState:&v115 objects:&block count:16];
      if (v67)
      {
        uint64_t v68 = v67;
        uint64_t v69 = *(void *)v116;
        do
        {
          for (uint64_t j = 0; j != v68; ++j)
          {
            if (*(void *)v116 != v69) {
              objc_enumerationMutation(obja);
            }
            uint64_t v71 = *(void *)(*((void *)&v115 + 1) + 8 * j);
            v72 = (void *)MEMORY[0x1CB79D060]();
            eventStore = v98->_eventStore;
            v107 = MEMORY[0x1E4F143A8];
            uint64_t v108 = 3221225472;
            v109 = __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke;
            v110 = &unk_1E65DC758;
            v111 = v98;
            uint64_t v112 = v71;
            v113 = v96;
            id v114 = v97;
            [(PPLocalEventStore *)eventStore runBlockWithPurgerDisabled:&v107];
            [(PPLocalEventStore *)v98->_eventStore attemptToPurgeImmediately];
          }
          uint64_t v68 = [obja countByEnumeratingWithState:&v115 objects:&block count:16];
        }
        while (v68);
      }

      v74 = objc_opt_new();
      v75 = objc_opt_new();
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v125 = __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_3;
      v126 = &unk_1E65DBF18;
      id v127 = v74;
      id v128 = v75;
      id v76 = v75;
      id v77 = v74;
      v78 = objc_msgSend(v97, "_pas_mappedArrayWithTransform:", &buf);

      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      id v79 = v78;
      uint64_t v80 = [v79 countByEnumeratingWithState:&v103 objects:&v120 count:16];
      if (v80)
      {
        uint64_t v81 = v80;
        uint64_t v82 = *(void *)v104;
        do
        {
          for (uint64_t k = 0; k != v81; ++k)
          {
            if (*(void *)v104 != v82) {
              objc_enumerationMutation(v79);
            }
            uint64_t v84 = *(void *)(*((void *)&v103 + 1) + 8 * k);
            v85 = pp_default_log_handle();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v119 = 138739971;
              *(void *)&v119[4] = v84;
              _os_log_debug_impl(&dword_1CA9A8000, v85, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: Reimported PPEvent: %{sensitive}@", v119, 0xCu);
            }
          }
          uint64_t v81 = [v79 countByEnumeratingWithState:&v103 objects:&v120 count:16];
        }
        while (v81);
      }

      -[PPEventKitImporter _importEvents:]((uint64_t)v98, v79);
      v43 = v91;
      v44 = (void *)v92;
      id v66 = v88;
      id v65 = v89;
      v86 = v96;
    }
    else
    {
      v86 = pp_default_log_handle();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(block) = 0;
        _os_log_impl(&dword_1CA9A8000, v86, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _reimportEventsWithEventIdentifiers disabled due to settings", (uint8_t *)&block, 2u);
      }
    }
  }
  return 1;
}

uint64_t __46__PPEventKitImporter_deleteAndReimportAllData__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (uint64_t)_shouldImport
{
  self;
  v0 = +[PPSettings sharedInstance];
  uint64_t v1 = [v0 bundleIdentifierIsEnabledForDonation:*MEMORY[0x1E4F8A040]];

  return v1;
}

- (id)_timeRangeForReimport
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:1209600.0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v0 endDate:v1];

  return v2;
}

void __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v7[0] = *(void *)(a1 + 40);
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_2;
  v5[3] = &unk_1E65DBEF0;
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 enumerateEventsFromEKObjectIDs:v3 expandingRecurrencesInRange:v4 usingBlock:v5];
}

uint64_t __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_importEvents:(uint64_t)a1
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (!a1 || ![v3 count]) {
    goto LABEL_33;
  }
  uint64_t v38 = a1;
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v37 = v4;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (!v8) {
    goto LABEL_16;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v52;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      v13 = (void *)MEMORY[0x1CB79D060]();
      id v14 = [v12 objectID];
      id v15 = [v6 objectForKeyedSubscript:v14];

      if (!v15) {
        goto LABEL_13;
      }
      v16 = [v12 startDate];
      [v16 timeIntervalSinceDate:v5];
      double v18 = v17;

      v19 = [v15 startDate];
      [v19 timeIntervalSinceDate:v5];
      double v21 = v20;

      if (v18 > 0.0 == v21 <= 0.0)
      {
        if (v18 <= 0.0) {
          goto LABEL_14;
        }
LABEL_13:
        id v22 = [v12 objectID];
        [v6 setObject:v12 forKeyedSubscript:v22];

        goto LABEL_14;
      }
      if (fabs(v18) < fabs(v21)) {
        goto LABEL_13;
      }
LABEL_14:
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v51 objects:v56 count:16];
  }
  while (v9);
LABEL_16:

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PPEventKitImporter__importEvents___block_invoke;
  aBlock[3] = &unk_1E65DBD98;
  id v23 = v6;
  uint64_t v49 = v38;
  v50 = sel__importEvents_;
  id v48 = v23;
  v24 = _Block_copy(aBlock);
  uint64_t v25 = *(void *)(v38 + 48);
  v26 = pp_default_log_handle();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _importEvents beginning SQL transaction", buf, 2u);
    }

    v28 = *(void **)(v38 + 16);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __36__PPEventKitImporter__importEvents___block_invoke_102;
    v43[3] = &unk_1E65DBDE8;
    v43[4] = v38;
    id v44 = v7;
    id v45 = v24;
    [v28 runWithLockAcquired:v43];
    id v29 = pp_default_log_handle();
    uint64_t v4 = v37;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v29, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _importEvents ended SQL transaction", buf, 2u);
    }
  }
  else
  {
    if (v27)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _importEvents no SQL transaction due to no _sqlDatabase (this can cause some extra per-event overhead)", buf, 2u);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v30 = v7;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v40 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v39 + 1) + 8 * j);
          v36 = (void *)MEMORY[0x1CB79D060]();
          (*((void (**)(void *, uint64_t))v24 + 2))(v24, v35);
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v32);
    }

    uint64_t v4 = v37;
  }
  -[PPEventKitImporter _flush](v38);

LABEL_33:
}

void __36__PPEventKitImporter__importEvents___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)a1[4];
  id v8 = v3;
  uint64_t v5 = [v3 objectID];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a1[6], a1[5], @"PPEventKitImporter.m", 309, @"Invalid parameter not satisfying: %@", @"mostRelevantOccurrence" object file lineNumber description];
  }
  -[PPEventKitImporter _importEvent:isMostRelevantOccurrence:](a1[5], v8, v6 == v8);
}

void __36__PPEventKitImporter__importEvents___block_invoke_102(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__PPEventKitImporter__importEvents___block_invoke_2;
  v3[3] = &unk_1E65DBDC0;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 writeTransactionWithClient:9 block:v3];
}

- (void)_flush
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 16);
    id v5 = 0;
    char v2 = [v1 flushDonationsWithError:&v5];
    id v3 = v5;
    if ((v2 & 1) == 0)
    {
      id v4 = pp_default_log_handle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v7 = v3;
        _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter failed to flush donations: %@", buf, 0xCu);
      }
    }
  }
}

void __36__PPEventKitImporter__importEvents___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)MEMORY[0x1CB79D060](v5);
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

- (void)_importEvent:(int)a3 isMostRelevantOccurrence:
{
  uint64_t v295 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 objectID];
    uint64_t v8 = [v7 URIRepresentation];
    uint64_t v9 = [v8 absoluteString];

    long long v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = @"no";
      *(_DWORD *)long long buf = 138412803;
      *(void *)&uint8_t buf[4] = v9;
      if (a3) {
        long long v11 = @"yes";
      }
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2117;
      v293 = v6;
      _os_log_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importing event %@ (isMostRelevantOccurrence=%@, %{sensitive}@)", buf, 0x20u);
    }

    if (!v9)
    {
      long long v12 = pp_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: suppressing import of event with nil objectID", buf, 2u);
      }
      goto LABEL_147;
    }
    long long v12 = [v6 startDate];
    if (!v12)
    {
      uint64_t v80 = pp_default_log_handle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v80, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: suppressing import of event with nil startDate", buf, 2u);
      }
LABEL_146:

LABEL_147:
      goto LABEL_148;
    }
    uint64_t v13 = [v6 organizerIsCurrentUser];
    id v14 = [v6 attendees];
    uint64_t v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_112);

    uint64_t v266 = a1;
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F48]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, 0, 0, (unsigned __int16)-[NSObject count](v15, "count"), v13);
    id v17 = objc_alloc(MEMORY[0x1E4F89F40]);
    int v267 = a3;
    double v18 = v6;
    uint64_t v19 = *MEMORY[0x1E4F8A040];
    double v20 = [v18 calendar];
    double v21 = [v20 calendarIdentifier];
    id v22 = objc_opt_new();
    uint64_t v258 = v19;
    v261 = (void *)v16;
    uint64_t v248 = v16;
    id v23 = (void *)v266;
    uint64_t v24 = v19;
    uint64_t v6 = v18;
    v263 = v12;
    v264 = v9;
    v262 = v15;
    uint64_t v25 = (void *)[v17 initWithBundleId:v24 groupId:v21 documentId:v9 date:v22 relevanceDate:v12 contactHandles:v15 language:0 metadata:v248];

    v265 = v18;
    if (!v267)
    {
LABEL_100:
      id v179 = v6;
      id v180 = v25;
      memset(v285, 0, sizeof(v285));
      long long v286 = 0u;
      long long v287 = 0u;
      v181 = [v179 attendees];
      uint64_t v182 = [v181 countByEnumeratingWithState:v285 objects:buf count:16];
      if (v182)
      {
        uint64_t v183 = v182;
        uint64_t v184 = **(void **)&v285[16];
LABEL_102:
        uint64_t v185 = 0;
        while (1)
        {
          if (**(void **)&v285[16] != v184) {
            objc_enumerationMutation(v181);
          }
          v186 = *(void **)(*(void *)&v285[8] + 8 * v185);
          if ([v186 isCurrentUser]) {
            break;
          }
          if (v183 == ++v185)
          {
            uint64_t v183 = [v181 countByEnumeratingWithState:v285 objects:buf count:16];
            if (v183) {
              goto LABEL_102;
            }
            goto LABEL_113;
          }
        }
        if ([v186 status] != 3) {
          goto LABEL_113;
        }
        v187 = pp_default_log_handle();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
        {
          v188 = [v179 eventIdentifier];
          *(_DWORD *)v280 = 138412290;
          *(void *)&v280[4] = v188;
          _os_log_impl(&dword_1CA9A8000, v187, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: ignoring declined event: %@", v280, 0xCu);
        }
        v189 = v261;
        uint64_t v80 = v262;
      }
      else
      {
LABEL_113:

        v190 = [v179 startDate];
        if (v190)
        {
          v191 = [v179 endDate];
          if (v191)
          {
            v192 = [v179 endDate];
            v193 = [v179 startDate];
            [v192 timeIntervalSinceDate:v193];
            double v195 = v194;
          }
          else
          {
            double v195 = 0.0;
          }
        }
        else
        {
          double v195 = 0.0;
        }

        id v196 = [NSString alloc];
        v197 = [v180 documentId];
        v198 = [v179 startDate];
        [v198 timeIntervalSinceReferenceDate];
        v181 = (void *)[v196 initWithFormat:@"%@:%f", v197, v199];

        v200 = [v179 objectID];
        v201 = [v200 URIRepresentation];
        v202 = [v201 absoluteString];

        if (v202)
        {
          uint64_t v271 = +[PPEventKitImporter _escapedDomainIdentifierForIdentifier:]((uint64_t)PPEventKitImporter, v202);

          v203 = [v179 url];
          v204 = [v203 absoluteString];
          uint64_t v205 = [v204 length];

          if (v205)
          {
            v206 = pp_default_log_handle();
            if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
            {
              v207 = [v179 eventIdentifier];
              v208 = [v179 url];
              v209 = [v208 absoluteString];
              uint64_t v210 = [v209 length];
              *(_DWORD *)v280 = 138412546;
              *(void *)&v280[4] = v207;
              __int16 v281 = 2048;
              uint64_t v282 = v210;
              _os_log_impl(&dword_1CA9A8000, v206, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: event %@ has URL length: %tu", v280, 0x16u);
            }
            v211 = (void *)v23[7];
            v212 = [v179 url];
            *(void *)&long long v288 = v212;
            v213 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v288 count:1];
            v214 = [v180 bundleId];
            v215 = [v179 title];
            [v179 startDate];
            v217 = id v216 = v180;
            v218 = objc_opt_new();
            LOBYTE(v249) = 0;
            v219 = [v211 urlsFromURLs:v213 handle:0 bundleIdentifier:v214 domainIdentifier:v271 uniqueIdentifier:v181 documentTitle:v215 documentDate:v195 documentTimeInterval:v217 receivedAt:v218 isOutgoingDocument:v249];

            id v180 = v216;
            [v219 writeWithEntityStore:*(void *)(v266 + 40)];

            uint64_t v6 = v265;
          }
          v220 = [v179 notes];
          uint64_t v221 = [v220 length];

          if (v221)
          {
            v222 = objc_opt_new();
            id v223 = [NSString alloc];
            v224 = [v179 notes];
            v225 = (void *)[v223 initWithFormat:@"%@\n", v224];
            [v222 appendString:v225];
          }
          else
          {
            v222 = 0;
          }
          v187 = v271;
          v226 = [v179 location];
          uint64_t v227 = [v226 length];

          if (v227)
          {
            if (!v222) {
              v222 = objc_opt_new();
            }
            id v228 = [NSString alloc];
            v229 = [v179 location];
            v230 = (void *)[v228 initWithFormat:@"%@\n", v229];
            [v222 appendString:v230];
          }
          if ([v222 length])
          {
            v231 = pp_default_log_handle();
            if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
            {
              v232 = [v179 eventIdentifier];
              uint64_t v233 = [v222 length];
              *(_DWORD *)v280 = 138412546;
              *(void *)&v280[4] = v232;
              __int16 v281 = 2048;
              uint64_t v282 = v233;
              _os_log_impl(&dword_1CA9A8000, v231, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: event %@ has text length: %tu", v280, 0x16u);
            }
            v234 = [*(id *)(v266 + 72) detectionsInPlainText:v222 baseDate:0];
            if ([v234 count])
            {
              v235 = pp_default_log_handle();
              if (os_log_type_enabled(v235, OS_LOG_TYPE_DEFAULT))
              {
                v236 = [v179 eventIdentifier];
                uint64_t v237 = [v234 count];
                *(_DWORD *)v280 = 138412546;
                *(void *)&v280[4] = v236;
                __int16 v281 = 2048;
                uint64_t v282 = v237;
                _os_log_impl(&dword_1CA9A8000, v235, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: _dissectAndDonateURLsFromEvent: event %@ has data detection count: %tu", v280, 0x16u);
              }
              v238 = *(void **)(v266 + 56);
              [v180 bundleId];
              v239 = v260 = v234;
              v240 = [v179 title];
              v241 = [v179 startDate];
              id v242 = v180;
              v243 = objc_opt_new();
              LOBYTE(v250) = 0;
              v187 = v271;
              v244 = [v238 urlsFromText:v222 handle:0 dataDetectorMatches:v260 bundleIdentifier:v239 domainIdentifier:v271 uniqueIdentifier:v181 documentTitle:v195 documentDate:v240 documentTimeInterval:v241 receivedAt:v243 isOutgoingDocument:v250];

              id v180 = v242;
              v234 = v260;
              [v244 writeWithEntityStore:*(void *)(v266 + 40)];

              uint64_t v6 = v265;
            }
          }
          v189 = v261;
          uint64_t v80 = v262;
        }
        else
        {
          v187 = pp_default_log_handle();
          v189 = v261;
          uint64_t v80 = v262;
          if (os_log_type_enabled(v187, OS_LOG_TYPE_FAULT))
          {
            v246 = [v179 objectID];
            *(_DWORD *)v280 = 138412290;
            *(void *)&v280[4] = v246;
            _os_log_fault_impl(&dword_1CA9A8000, v187, OS_LOG_TYPE_FAULT, "PPEventKitImporter: can't generate URL string from object id %@ (will ignore event)", v280, 0xCu);
          }
        }
      }

      v245 = pp_default_log_handle();
      uint64_t v9 = v264;
      if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v264;
        _os_log_impl(&dword_1CA9A8000, v245, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: completed import of event %@", buf, 0xCu);
      }

      long long v12 = v263;
      goto LABEL_146;
    }
    id v26 = v18;
    v257 = v25;
    id v27 = v25;
    v28 = +[PPConfiguration sharedInstance];
    id v29 = [v27 bundleId];
    id v30 = [v27 language];
    uint64_t v31 = [v28 extractionAlgorithmsForBundleId:v29 sourceLanguage:v30 conservative:0 domain:1];

    if (![v31 containsObject:&unk_1F256A2B0])
    {
LABEL_41:

      id v82 = v26;
      id v83 = v27;
      uint64_t v84 = [v82 structuredLocationTitle];
      if (PPStringAllWhiteSpace())
      {
LABEL_58:

LABEL_59:
        id v111 = v82;
        id v112 = v83;
        v113 = +[PPConfiguration sharedInstance];
        id v114 = [v112 bundleId];
        long long v115 = [v112 language];
        long long v116 = [v113 extractionAlgorithmsForBundleId:v114 sourceLanguage:v115 conservative:1 domain:1];

        uint64_t v117 = [v111 title];
        if (v117
          && (long long v118 = (void *)v117,
              [v111 title],
              v119 = objc_claimAutoreleasedReturnValue(),
              uint64_t v120 = [v119 length],
              v119,
              v118,
              v120))
        {
          long long v121 = (void *)v23[8];
          long long v122 = [v111 title];
          long long v123 = [v121 entitiesInPlainText:v122 eligibleRegions:0 source:v112 cloudSync:1 algorithms:v116];

          v124 = pp_default_log_handle();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
          {
            v125 = [v111 eventIdentifier];
            v126 = [v111 location];
            uint64_t v127 = [v126 length];
            uint64_t v128 = [v123 count];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v125;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v127;
            *(_WORD *)&buf[22] = 2048;
            v293 = (void *)v128;
            _os_log_impl(&dword_1CA9A8000, v124, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: location on event %@ with length %tu generated %tu containers", buf, 0x20u);
          }
          long long v290 = 0u;
          long long v291 = 0u;
          long long v288 = 0u;
          long long v289 = 0u;
          id v129 = v123;
          uint64_t v130 = [v129 countByEnumeratingWithState:&v288 objects:buf count:16];
          if (v130)
          {
            uint64_t v131 = v130;
            uint64_t v132 = *(void *)v289;
            do
            {
              for (uint64_t i = 0; i != v131; ++i)
              {
                if (*(void *)v289 != v132) {
                  objc_enumerationMutation(v129);
                }
                v134 = *(void **)(*((void *)&v288 + 1) + 8 * i);
                v135 = (void *)MEMORY[0x1CB79D060]();
                -[PPEventKitImporter _donateContainerContents:]((uint64_t)v23, v134);
              }
              uint64_t v131 = [v129 countByEnumeratingWithState:&v288 objects:buf count:16];
            }
            while (v131);
          }

          uint64_t v6 = v265;
        }
        else
        {
          id v129 = 0;
        }
        uint64_t v136 = [v111 location];
        if (v136)
        {
          v137 = (void *)v136;
          v138 = [v111 location];
          uint64_t v139 = [v138 length];

          if (v139)
          {
            v140 = (void *)v23[8];
            v141 = [v111 location];
            v142 = [v140 entitiesInPlainText:v141 eligibleRegions:0 source:v112 cloudSync:1 algorithms:v116];

            v143 = pp_default_log_handle();
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
            {
              v144 = [v111 eventIdentifier];
              v145 = [v111 location];
              uint64_t v146 = [v145 length];
              uint64_t v147 = [v142 count];
              *(_DWORD *)v285 = 138412802;
              *(void *)&v285[4] = v144;
              *(_WORD *)&v285[12] = 2048;
              *(void *)&v285[14] = v146;
              *(_WORD *)&v285[22] = 2048;
              *(void *)&v285[24] = v147;
              _os_log_impl(&dword_1CA9A8000, v143, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: location on event %@ with length %tu generated %tu containers", v285, 0x20u);
            }
            long long v278 = 0u;
            long long v279 = 0u;
            long long v276 = 0u;
            long long v277 = 0u;
            id v129 = v142;
            uint64_t v148 = [v129 countByEnumeratingWithState:&v276 objects:v285 count:16];
            if (v148)
            {
              uint64_t v149 = v148;
              uint64_t v150 = *(void *)v277;
              do
              {
                for (uint64_t j = 0; j != v149; ++j)
                {
                  if (*(void *)v277 != v150) {
                    objc_enumerationMutation(v129);
                  }
                  v152 = *(void **)(*((void *)&v276 + 1) + 8 * j);
                  v153 = (void *)MEMORY[0x1CB79D060]();
                  -[PPEventKitImporter _donateContainerContents:]((uint64_t)v23, v152);
                }
                uint64_t v149 = [v129 countByEnumeratingWithState:&v276 objects:v285 count:16];
              }
              while (v149);
            }

            uint64_t v6 = v265;
          }
        }
        v154 = [v111 notes];

        if (v154)
        {
          v270 = v116;
          v155 = [v111 notes];
          unint64_t v156 = [v155 length];

          v157 = +[PPConfiguration sharedInstance];
          v158 = [v112 bundleId];
          v159 = [v112 language];
          v160 = [v157 extractionAlgorithmsForBundleId:v158 sourceLanguage:v159 conservative:v156 < 0x40 domain:1];

          id v23 = (void *)v266;
          if (v156 >= 0x40)
          {
            v161 = pp_default_log_handle();
            if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
            {
              v162 = [v111 eventIdentifier];
              v163 = [v111 notes];
              uint64_t v164 = [v163 length];
              *(_DWORD *)v280 = 138412546;
              *(void *)&v280[4] = v162;
              __int16 v281 = 2048;
              uint64_t v282 = v164;
              _os_log_impl(&dword_1CA9A8000, v161, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: using all taggers since notes on %@ has length %tu", v280, 0x16u);
            }
          }
          v165 = *(void **)(v266 + 64);
          v166 = [v111 notes];
          v167 = [v165 entitiesInPlainText:v166 eligibleRegions:0 source:v112 cloudSync:1 algorithms:v160];

          v168 = pp_default_log_handle();
          if (os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
          {
            v169 = [v111 eventIdentifier];
            v170 = [v111 notes];
            uint64_t v171 = [v170 length];
            uint64_t v172 = [v167 count];
            *(_DWORD *)v280 = 138412802;
            *(void *)&v280[4] = v169;
            __int16 v281 = 2048;
            uint64_t v282 = v171;
            __int16 v283 = 2048;
            uint64_t v284 = v172;
            _os_log_impl(&dword_1CA9A8000, v168, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: notes on event %@ with length %tu generated %tu containers", v280, 0x20u);
          }
          long long v274 = 0u;
          long long v275 = 0u;
          long long v272 = 0u;
          long long v273 = 0u;
          id v129 = v167;
          uint64_t v173 = [v129 countByEnumeratingWithState:&v272 objects:v280 count:16];
          if (v173)
          {
            uint64_t v174 = v173;
            uint64_t v175 = *(void *)v273;
            do
            {
              for (uint64_t k = 0; k != v174; ++k)
              {
                if (*(void *)v273 != v175) {
                  objc_enumerationMutation(v129);
                }
                v177 = *(void **)(*((void *)&v272 + 1) + 8 * k);
                v178 = (void *)MEMORY[0x1CB79D060]();
                -[PPEventKitImporter _donateContainerContents:](v266, v177);
              }
              uint64_t v174 = [v129 countByEnumeratingWithState:&v272 objects:v280 count:16];
            }
            while (v174);
          }

          uint64_t v6 = v265;
          long long v116 = v270;
        }

        uint64_t v25 = v257;
        goto LABEL_100;
      }
      v85 = [v82 structuredLocationTitle];
      char v86 = PPStringLooksLikeNumber();

      if (v86) {
        goto LABEL_59;
      }
      v87 = +[PPConfiguration sharedInstance];
      uint64_t v84 = [v87 extractionAlgorithmsForBundleId:v258 sourceLanguage:0 conservative:0 domain:2];

      if (([v84 containsObject:&unk_1F256A2C8] & 1) == 0)
      {
        v91 = pp_default_log_handle();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v91, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: not importing locations from eventkit as it is disabled in configuration.", buf, 2u);
        }
        goto LABEL_57;
      }
      id v88 = (void *)MEMORY[0x1E4F89E68];
      id v89 = [v82 structuredLocationTitle];
      v90 = [v82 structuredLocationCoordinates];
      v91 = [v88 placemarkWithName:v89 clLocation:v90];

      if (!v91)
      {
LABEL_57:

        goto LABEL_58;
      }
      uint64_t v259 = [objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v91 category:3 mostRelevantRecord:0];
      uint64_t v92 = [objc_alloc(MEMORY[0x1E4F89F10]) initWithLocation:v259 score:1.0 sentimentScore:0.0];
      v93 = (void *)v23[3];
      v256 = (void *)v92;
      *(void *)v285 = v92;
      v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v285 count:1];
      v269 = [v82 title];
      uint64_t v95 = [v269 length];
      if (v95)
      {
        v254 = v93;
        uint64_t v96 = MEMORY[0x1CB79D060]();
        v97 = v94;
        id v98 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        v99 = [v82 title];
        id v100 = v98;
        v94 = v97;
        id v101 = objc_msgSend(v100, "initWithObjects:", v99, 0);

        id v102 = (void *)v96;
        v93 = v254;
      }
      else
      {
        id v101 = 0;
      }
      *(void *)v280 = 0;
      int v103 = [v93 donateLocations:v94 source:v83 contextualNamedEntities:v101 algorithm:9 cloudSync:0 error:v280];
      id v104 = *(id *)v280;
      if (v95) {

      }
      long long v105 = pp_default_log_handle();
      long long v106 = v105;
      if (v103)
      {
        v107 = (void *)v259;
        uint64_t v108 = v256;
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          [v82 structuredLocationTitle];
          v110 = id v109 = v104;
          *(_DWORD *)long long buf = 138739971;
          *(void *)&uint8_t buf[4] = v110;
          _os_log_debug_impl(&dword_1CA9A8000, v106, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: successfully harvested location: %{sensitive}@", buf, 0xCu);
LABEL_150:

          id v104 = v109;
        }
      }
      else
      {
        v107 = (void *)v259;
        uint64_t v108 = v256;
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          [v82 structuredLocationTitle];
          v110 = id v109 = v104;
          *(_DWORD *)long long buf = 138740227;
          *(void *)&uint8_t buf[4] = v110;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v109;
          _os_log_error_impl(&dword_1CA9A8000, v106, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to harvest location: %{sensitive}@; error: %@",
            buf,
            0x16u);
          goto LABEL_150;
        }
      }

      id v23 = (void *)v266;
      goto LABEL_57;
    }
    v253 = v31;
    id v255 = v27;
    id v251 = v26;
    id v32 = v26;
    v268 = objc_opt_new();
    uint64_t v33 = [v32 title];
    if (v33)
    {
      uint64_t v34 = (void *)v33;
      uint64_t v35 = [v32 title];
      uint64_t v36 = [v35 length];

      if (v36)
      {
        id v37 = objc_alloc(MEMORY[0x1E4F89F00]);
        id v38 = objc_alloc(MEMORY[0x1E4F89E90]);
        long long v39 = [v32 title];
        long long v40 = [MEMORY[0x1E4F1CA20] currentLocale];
        long long v41 = [v40 languageCode];
        long long v42 = (void *)[v38 initWithName:v39 category:14 language:v41];
        v43 = (void *)[v37 initWithItem:v42 score:0.5];
        [v268 addObject:v43];
      }
    }
    long long v286 = 0u;
    long long v287 = 0u;
    memset(v285, 0, sizeof(v285));
    v252 = v32;
    id v44 = [v32 attendees];
    uint64_t v45 = [v44 countByEnumeratingWithState:v285 objects:buf count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = **(void **)&v285[16];
      do
      {
        for (uint64_t m = 0; m != v46; ++m)
        {
          if (**(void **)&v285[16] != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void **)(*(void *)&v285[8] + 8 * m);
          v50 = (void *)MEMORY[0x1CB79D060]();
          uint64_t v51 = [v49 name];
          if (v51)
          {
            long long v52 = (void *)v51;
            long long v53 = [v49 name];
            uint64_t v54 = [v53 length];

            if (v54)
            {
              id v55 = objc_alloc(MEMORY[0x1E4F89F00]);
              id v56 = objc_alloc(MEMORY[0x1E4F89E90]);
              uint64_t v57 = [v49 name];
              v58 = [MEMORY[0x1E4F1CA20] currentLocale];
              v59 = [v58 languageCode];
              v60 = (void *)[v56 initWithName:v57 category:1 language:v59];
              id v61 = (void *)[v55 initWithItem:v60 score:0.5];
              [v268 addObject:v61];
            }
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:v285 objects:buf count:16];
      }
      while (v46);
    }

    uint64_t v62 = [v252 structuredLocationTitle];
    id v23 = (void *)v266;
    id v27 = v255;
    if (v62)
    {
      v63 = (void *)v62;
      v64 = [v252 structuredLocationTitle];
      if (![v64 length])
      {
LABEL_29:

        goto LABEL_30;
      }
      id v65 = [v252 structuredLocationTitle];
      if (PPStringAllWhiteSpace())
      {
LABEL_28:

        id v27 = v255;
        goto LABEL_29;
      }
      id v66 = [v252 structuredLocationTitle];
      char v67 = PPStringLooksLikeNumber();

      id v27 = v255;
      if ((v67 & 1) == 0)
      {
        id v68 = objc_alloc(MEMORY[0x1E4F89F00]);
        id v69 = objc_alloc(MEMORY[0x1E4F89E90]);
        v63 = [v252 structuredLocationTitle];
        v64 = [MEMORY[0x1E4F1CA20] currentLocale];
        id v65 = [v64 languageCode];
        v70 = (void *)[v69 initWithName:v63 category:3 language:v65];
        uint64_t v71 = (void *)[v68 initWithItem:v70 score:0.5];
        [v268 addObject:v71];

        goto LABEL_28;
      }
    }
LABEL_30:

    v72 = *(void **)(v266 + 16);
    *(void *)v285 = 0;
    char v73 = [v72 donateNamedEntities:v268 source:v27 algorithm:10 cloudSync:0 sentimentScore:v285 error:0.0];
    id v74 = *(id *)v285;
    v75 = pp_default_log_handle();
    id v76 = v75;
    if (v73)
    {
      uint64_t v6 = v265;
      id v26 = v251;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v77 = [v268 count];
        v78 = [v27 groupId];
        id v79 = [v27 documentId];
        *(_DWORD *)long long buf = 134218498;
        *(void *)&uint8_t buf[4] = v77;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v78;
        *(_WORD *)&buf[22] = 2112;
        v293 = v79;
        _os_log_impl(&dword_1CA9A8000, v76, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: donated %tu entities from %@ / %@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v6 = v265;
      id v26 = v251;
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        v247 = [v252 eventIdentifier];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v247;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v74;
        _os_log_error_impl(&dword_1CA9A8000, v76, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to donate EventKit data for %@: %@", buf, 0x16u);
      }
      uint64_t v81 = +[PPMetricsUtils loggingQueue];
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = __65__PPEventKitImporter__donateEntitiesForPropertiesOfEvent_source___block_invoke;
      v293 = &unk_1E65DBE30;
      v294 = v74;
      dispatch_async(v81, buf);

      id v76 = v294;
    }

    uint64_t v31 = v253;
    goto LABEL_41;
  }
LABEL_148:
}

+ (id)_escapedDomainIdentifierForIdentifier:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = self;
  id v4 = (void *)MEMORY[0x1CB79D060](v3);
  id v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"%."];
  uint64_t v6 = [v5 invertedSet];

  uint64_t v7 = [v2 stringByAddingPercentEncodingWithAllowedCharacters:v6];
  if (!v7)
  {
    uint64_t v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      long long v10 = [v2 dataUsingEncoding:10];
      [v10 bytes];
      [v10 length];
      long long v11 = _PASBytesToHex();

      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_fault_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_FAULT, "PPEventKitImporter: could not properly escape identifier with UTF-16 code units: %@", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v7 = (void *)[v2 copy];
  }

  return v7;
}

- (void)_donateContainerContents:(uint64_t)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v47 = a1;
  id v4 = *(void **)(a1 + 16);
  id v5 = [v3 entities];
  uint64_t v6 = [v3 source];
  uint64_t v7 = [v3 entityAlgorithm];
  uint64_t v8 = [v3 cloudSync];
  [v3 sentimentScore];
  id v54 = 0;
  LOBYTE(v4) = objc_msgSend(v4, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v5, v6, v7, v8, &v54);
  id v9 = v54;

  if ((v4 & 1) == 0)
  {
    long long v10 = pp_default_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v37 = [v3 entities];
      uint64_t v38 = [v37 count];
      long long v39 = [v3 source];
      *(_DWORD *)long long buf = 134218498;
      uint64_t v57 = v38;
      __int16 v58 = 2112;
      v59 = v39;
      __int16 v60 = 2112;
      id v61 = v9;
      _os_log_debug_impl(&dword_1CA9A8000, v10, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: failed to donate %tu named entities from container (%@): %@", buf, 0x20u);
    }
  }
  long long v11 = *(void **)(v47 + 32);
  int v12 = [v3 topics];
  uint64_t v13 = [v3 source];
  uint64_t v14 = [v3 topicAlgorithm];
  uint64_t v15 = [v3 cloudSync];
  [v3 sentimentScore];
  id v53 = 0;
  LOBYTE(v11) = objc_msgSend(v11, "donateTopics:source:algorithm:cloudSync:sentimentScore:exactMatchesInSourceText:error:", v12, v13, v14, v15, 0, &v53);
  id v16 = v53;

  if ((v11 & 1) == 0)
  {
    id v17 = pp_default_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      long long v40 = [v3 topics];
      uint64_t v41 = [v40 count];
      long long v42 = [v3 source];
      *(_DWORD *)long long buf = 134218498;
      uint64_t v57 = v41;
      __int16 v58 = 2112;
      v59 = v42;
      __int16 v60 = 2112;
      id v61 = v16;
      _os_log_debug_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: failed to donate %tu topics from container (%@): %@", buf, 0x20u);
    }
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  double v18 = [v3 locations];
  uint64_t v19 = [v18 allKeys];

  obuint64_t j = v19;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    id v43 = v16;
    id v44 = v9;
    id v22 = 0;
    uint64_t v46 = *(void *)v50;
    do
    {
      uint64_t v23 = 0;
      uint64_t v24 = v22;
      do
      {
        if (*(void *)v50 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void **)(*((void *)&v49 + 1) + 8 * v23);
        id v26 = *(void **)(v47 + 24);
        id v27 = objc_msgSend(v3, "locations", v43, v44);
        v28 = [v27 objectForKeyedSubscript:v25];
        id v29 = [v3 source];
        unsigned __int16 v30 = [v25 unsignedIntegerValue];
        uint64_t v31 = [v3 cloudSync];
        id v48 = v24;
        LOBYTE(v30) = [v26 donateLocations:v28 source:v29 contextualNamedEntities:0 algorithm:v30 cloudSync:v31 error:&v48];
        id v22 = v48;

        if ((v30 & 1) == 0)
        {
          id v32 = pp_default_log_handle();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v33 = [v3 locations];
            uint64_t v34 = [v33 objectForKeyedSubscript:v25];
            uint64_t v35 = [v34 count];
            uint64_t v36 = [v3 source];
            *(_DWORD *)long long buf = 134218498;
            uint64_t v57 = v35;
            __int16 v58 = 2112;
            v59 = v36;
            __int16 v60 = 2112;
            id v61 = v22;
            _os_log_debug_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: failed to donate %tu locations from container (%@): %@", buf, 0x20u);
          }
        }
        ++v23;
        uint64_t v24 = v22;
      }
      while (v21 != v23);
      uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v21);

    id v16 = v43;
    id v9 = v44;
  }
}

void __65__PPEventKitImporter__donateEntitiesForPropertiesOfEvent_source___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setSource:9];
  [v3 setErrorMessage:@"PPEventKitImporter: failed to donate EventKit data."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

id __60__PPEventKitImporter__importEvent_isMostRelevantOccurrence___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 emailAddress];
  if ([v3 length])
  {
    id v4 = [v2 emailAddress];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __51__PPEventKitImporter__reimportEventsWithObjectIDs___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F89E00] deferredAllocationEventFromEKEvent:a2];
  [v2 addObject:v3];
}

void __43__PPEventKitImporter__deleteAllExtractions__block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setSource:9];
  [v3 setErrorMessage:@"PPEventKitImporter: failed to delete all named entities."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

void __43__PPEventKitImporter__deleteAllExtractions__block_invoke_184(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setSource:9];
  [v3 setErrorMessage:@"PPEventKitImporter: failed to delete all URLs."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

void __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 source];
  id v3 = [v4 documentId];
  [v2 addObject:v3];
}

void __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_153(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 source];
  id v3 = [v4 documentId];
  [v2 addObject:v3];
}

void __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_156(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 source];
  id v3 = [v4 documentId];
  [v2 addObject:v3];
}

id __49__PPEventKitImporter__eventIdentifiersToReimport__block_invoke_159(uint64_t a1, uint64_t a2)
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:a2];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F25598] objectIDWithURL:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)importEvent:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[PPEventKitImporter _shouldImport]())
  {
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    -[PPEventKitImporter _importEvents:]((uint64_t)self, v5);
  }
  else
  {
    id v5 = pp_default_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEvent disabled due to settings", v6, 2u);
    }
  }
}

- (void)importChangedEvents:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 first];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v6 count];
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importing %tu changed events", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v7 = [v4 second];
  id v8 = [v7 allObjects];
  id v9 = v8;
  if (self && [v8 count])
  {
    long long v10 = objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_171);
    uint64_t v61 = 0;
    namedEntityStore = self->_namedEntityStore;
    uint64_t v12 = *MEMORY[0x1E4F8A040];
    id v60 = 0;
    uint64_t v48 = v12;
    BOOL v13 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:](namedEntityStore, "deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:");
    id v14 = v60;
    uint64_t v15 = pp_default_log_handle();
    id v16 = v15;
    if (!v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v14;
        _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete named entities: %@", (uint8_t *)&buf, 0xCu);
      }

      id v37 = +[PPMetricsUtils loggingQueue];
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v63 = __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_172;
      v64 = &unk_1E65DBE30;
      uint64_t v24 = v14;
      id v65 = v24;
      dispatch_async(v37, &buf);

      uint64_t v21 = v65;
      goto LABEL_39;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v61;
      _os_log_debug_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleted %tu named entities", (uint8_t *)&buf, 0xCu);
    }

    locationStore = self->_locationStore;
    id v59 = v14;
    uint64_t v47 = v10;
    BOOL v18 = [(PPLocalLocationStore *)locationStore deleteAllLocationsFromSourcesWithBundleId:v48 documentIds:v10 deletedCount:&v61 error:&v59];
    uint64_t v19 = v59;

    uint64_t v20 = pp_default_log_handle();
    uint64_t v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v61;
        _os_log_debug_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleted %tu locations", (uint8_t *)&buf, 0xCu);
      }

      topicStore = self->_topicStore;
      __int16 v58 = v19;
      BOOL v23 = [(PPLocalTopicStore *)topicStore deleteAllTopicsFromSourcesWithBundleId:v48 documentIds:v47 deletedCount:&v61 error:&v58];
      uint64_t v24 = v58;

      uint64_t v25 = pp_default_log_handle();
      uint64_t v21 = v25;
      if (v23)
      {
        id v43 = v7;
        id v44 = v24;
        uint64_t v45 = self;
        id v46 = v4;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v61;
          _os_log_debug_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEBUG, "PPEventKitImporter: deleted %tu topics", (uint8_t *)&buf, 0xCu);
        }

        uint64_t v21 = objc_opt_new();
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v26 = v9;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:&buf count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v55 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              id v32 = (void *)MEMORY[0x1CB79D060]();
              uint64_t v33 = [v31 URIRepresentation];
              uint64_t v34 = [v33 absoluteString];

              if (v34)
              {
                uint64_t v35 = +[PPEventKitImporter _escapedDomainIdentifierForIdentifier:]((uint64_t)PPEventKitImporter, v34);
                [v21 addDomain:v35];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:&buf count:16];
          }
          while (v28);
        }

        if ([MEMORY[0x1E4F5DF90] deleteAllURLsWithBundleIdentifier:v48 domainSelection:v21 entityStore:0])
        {
          self = v45;
          -[PPEventKitImporter _flush]((uint64_t)v45);
          uint64_t v36 = pp_default_log_handle();
          id v4 = v46;
          long long v10 = v47;
          uint64_t v24 = v44;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)blocuint64_t k = 0;
            _os_log_impl(&dword_1CA9A8000, v36, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted some extractions", block, 2u);
          }
        }
        else
        {
          uint64_t v38 = pp_default_log_handle();
          self = v45;
          id v4 = v46;
          long long v10 = v47;
          uint64_t v24 = v44;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)blocuint64_t k = 0;
            _os_log_error_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete URLs", block, 2u);
          }

          long long v39 = +[PPMetricsUtils loggingQueue];
          *(void *)blocuint64_t k = MEMORY[0x1E4F143A8];
          uint64_t v50 = 3221225472;
          long long v51 = __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_177;
          long long v52 = &unk_1E65DBE30;
          id v53 = v44;
          dispatch_async(v39, block);

          uint64_t v36 = v53;
        }
        uint64_t v7 = v43;

        goto LABEL_39;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_error_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete topics: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v19;
        _os_log_error_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete locations: %@", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v24 = v19;
    }
    long long v10 = v47;
LABEL_39:
  }
  if ((+[PPEventKitImporter _shouldImport]() & 1) == 0)
  {
    long long v42 = pp_default_log_handle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CA9A8000, v42, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEvent disabled due to settings", (uint8_t *)&buf, 2u);
    }
    goto LABEL_45;
  }
  long long v40 = [v4 first];
  uint64_t v41 = [v40 count];

  if (v41)
  {
    long long v42 = [v4 first];
    -[PPEventKitImporter _importEvents:]((uint64_t)self, v42);
LABEL_45:
  }
}

void __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_172(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setSource:9];
  [v3 setErrorMessage:@"PPEventKitImporter: failed to delete named entities."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

void __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke_177(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setSource:9];
  [v3 setErrorMessage:@"PPEventKitImporter: failed to delete URLs."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

id __53__PPEventKitImporter__deleteExtractionsForObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 URIRepresentation];
  id v3 = [v2 absoluteString];

  return v3;
}

- (id)importEventDataWithShouldContinueBlock:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(void))a3;
  id v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEventData", buf, 2u);
  }

  if ((atomic_exchange(&self->_fullImportInProgress._Value, 1u) & 1) == 0)
  {
    if (+[PPEventKitImporter _shouldImport]())
    {
      uint64_t v6 = pp_default_log_handle();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      id v8 = (uint64_t *)MEMORY[0x1E4F8A040];
      if (v7)
      {
        uint64_t v9 = *MEMORY[0x1E4F8A040];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 129600;
        _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: beginning import of named entities and URLs from %@, looking ahead %d seconds", buf, 0x12u);
      }

      if (self)
      {
        long long v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
        namedEntityStore = self->_namedEntityStore;
        uint64_t v12 = *v8;
        id v41 = 0;
        BOOL v13 = [(PPLocalNamedEntityStore *)namedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:v12 groupId:0 olderThan:v10 deletedCount:0 error:&v41];
        id v14 = v41;
        uint64_t v15 = pp_default_log_handle();
        id v16 = v15;
        if (v13)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v10;
            _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted old named entities (before %@)", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v14;
            _os_log_error_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete old named entities: %@", buf, 0xCu);
          }

          uint64_t v20 = +[PPMetricsUtils loggingQueue];
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&buf[16] = __40__PPEventKitImporter__deleteOldEntities__block_invoke;
          id v43 = &unk_1E65DBE30;
          id v44 = v14;
          dispatch_async(v20, buf);

          id v16 = v44;
        }
      }
      if (!v4[2](v4)) {
        goto LABEL_42;
      }
      if (self)
      {
        uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
        locationStore = self->_locationStore;
        uint64_t v23 = *v8;
        id v41 = 0;
        BOOL v24 = [(PPLocalLocationStore *)locationStore deleteAllLocationsFromSourcesWithBundleId:v23 groupId:0 olderThan:v21 deletedCount:0 error:&v41];
        id v25 = v41;
        id v26 = pp_default_log_handle();
        uint64_t v27 = v26;
        if (v24)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v21;
            _os_log_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted old locations (before %@)", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v25;
          _os_log_error_impl(&dword_1CA9A8000, v27, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete old locations: %@", buf, 0xCu);
        }
      }
      if (!v4[2](v4)) {
        goto LABEL_42;
      }
      if (self)
      {
        uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-2592000.0];
        topicStore = self->_topicStore;
        uint64_t v30 = *v8;
        id v41 = 0;
        BOOL v31 = [(PPLocalTopicStore *)topicStore deleteAllTopicsFromSourcesWithBundleId:v30 groupId:0 olderThan:v28 deletedCount:0 error:&v41];
        id v32 = v41;
        uint64_t v33 = pp_default_log_handle();
        uint64_t v34 = v33;
        if (v31)
        {
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v28;
            _os_log_impl(&dword_1CA9A8000, v34, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: deleted old topics (before %@)", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v32;
          _os_log_error_impl(&dword_1CA9A8000, v34, OS_LOG_TYPE_ERROR, "PPEventKitImporter: failed to delete old topics: %@", buf, 0xCu);
        }
      }
      if (!v4[2](v4))
      {
LABEL_42:
        BOOL v18 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_43;
      }
      uint64_t v19 = objc_opt_new();
      eventStore = self->_eventStore;
      uint64_t v36 = [v19 dateByAddingTimeInterval:129600.0];
      id v37 = [(PPLocalEventStore *)eventStore eventsFromDate:v19 toDate:v36];

      -[PPEventKitImporter _importEvents:]((uint64_t)self, v37);
      BOOL v18 = objc_msgSend(v37, "_pas_mappedArrayWithTransform:", &__block_literal_global_86_25086);
      -[PPEventKitImporter _flush]((uint64_t)self);
      uint64_t v38 = pp_default_log_handle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = [v37 count];
        *(_DWORD *)long long buf = 134217984;
        *(void *)&uint8_t buf[4] = v39;
        _os_log_impl(&dword_1CA9A8000, v38, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: completed import of %tu events", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v19 = pp_default_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: importEventData disabled due to settings", buf, 2u);
      }
      BOOL v18 = (void *)MEMORY[0x1E4F1CBF0];
    }

LABEL_43:
    atomic_store(0, (unsigned __int8 *)&self->_fullImportInProgress);
    goto LABEL_44;
  }
  id v17 = pp_default_log_handle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: full import already in progress when importEventData called.", buf, 2u);
  }

  BOOL v18 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_44:

  return v18;
}

uint64_t __61__PPEventKitImporter_importEventDataWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

void __40__PPEventKitImporter__deleteOldEntities__block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  [v3 setSource:9];
  [v3 setErrorMessage:@"PPEventKitImporter: failed to delete old named entities."];
  objc_msgSend(v3, "setErrorCode:", objc_msgSend(*(id *)(a1 + 32), "code"));
  id v2 = [MEMORY[0x1E4F93728] sharedInstance];
  [v2 trackScalarForMessage:v3];
}

- (id)importEventData
{
  return [(PPEventKitImporter *)self importEventDataWithShouldContinueBlock:&__block_literal_global_25099];
}

uint64_t __37__PPEventKitImporter_importEventData__block_invoke()
{
  return 1;
}

- (PPEventKitImporter)initWithEventStore:(id)a3 namedEntityStore:(id)a4 locationStore:(id)a5 topicStore:(id)a6 urlStore:(id)a7 urlDissector:(id)a8 namedEntityDissector:(id)a9 dataDetectorMatchClass:(Class)a10 sqlDatabase:(id)a11
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v41 = a5;
  id v40 = a6;
  id v39 = a7;
  id v38 = a11;
  v42.receiver = self;
  v42.super_class = (Class)PPEventKitImporter;
  uint64_t v19 = [(PPEventKitImporter *)&v42 init];
  uint64_t v20 = v19;
  if (!v19) {
    goto LABEL_14;
  }
  id v36 = v18;
  id v37 = v17;
  objc_storeStrong((id *)&v19->_eventStore, a3);
  objc_storeStrong((id *)&v20->_namedEntityStore, a4);
  objc_storeStrong((id *)&v20->_locationStore, a5);
  objc_storeStrong((id *)&v20->_topicStore, a6);
  objc_storeStrong((id *)&v20->_urlStore, a7);
  objc_storeStrong((id *)&v20->_sqlDatabase, a11);
  v20->_dataDetectorMatchClass = (Class)objc_opt_class();
  uint64_t v21 = [MEMORY[0x1E4F5DF70] fullPipeline];
  uint64_t v22 = +[PPNamedEntityDissector sharedInstance];
  neDissector = v20->_neDissector;
  v20->_neDissector = (PPNamedEntityDissector *)v22;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  BOOL v24 = [v21 dissectors];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v44 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v30 = (void *)MEMORY[0x1CB79D060]();
        if (objc_opt_respondsToSelector()) {
          objc_storeStrong((id *)&v20->_urlDissector, v29);
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v26);
  }

  if (v20->_neDissector && v20->_urlDissector)
  {

    atomic_store(0, (unsigned __int8 *)&v20->_fullImportInProgress);
    id v18 = v36;
    id v17 = v37;
LABEL_14:
    BOOL v31 = v20;
    goto LABEL_18;
  }
  id v32 = pp_default_log_handle();
  id v18 = v36;
  id v17 = v37;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    urlDissector = v20->_urlDissector;
    uint64_t v34 = v20->_neDissector;
    *(_DWORD *)long long buf = 138412802;
    uint64_t v48 = v34;
    __int16 v49 = 2112;
    uint64_t v50 = urlDissector;
    __int16 v51 = 2112;
    long long v52 = v21;
    _os_log_fault_impl(&dword_1CA9A8000, v32, OS_LOG_TYPE_FAULT, "PPEventKitImporter failed to get all dissectors (%@ && %@) out of the pipeline: %@", buf, 0x20u);
  }

  BOOL v31 = 0;
LABEL_18:

  return v31;
}

+ (id)defaultInstance
{
  if (+[PPEventKitImporter _shouldImport]())
  {
    id v2 = +[PPLocalNamedEntityStore defaultStore];
    id v3 = +[PPLocalLocationStore defaultStore];
    uint64_t v4 = +[PPLocalTopicStore defaultStore];
    id v5 = (void *)v4;
    if (v2)
    {
      if (v3)
      {
        if (v4)
        {
          uint64_t v6 = +[PPSQLDatabase sharedInstance];
          if (!v6)
          {
            BOOL v7 = pp_default_log_handle();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_fault_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_FAULT, "PPEventKitImporter: [PPSQLDatabase sharedInstance] is somehow nil even though ne, location, and topic stores are non-nil???", buf, 2u);
            }
          }
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __37__PPEventKitImporter_defaultInstance__block_invoke;
          v13[3] = &unk_1E65DC758;
          id v14 = v2;
          id v15 = v3;
          id v16 = v5;
          id v17 = v6;
          uint64_t v8 = defaultInstance__pasOnceToken9;
          uint64_t v9 = v6;
          if (v8 != -1) {
            dispatch_once(&defaultInstance__pasOnceToken9, v13);
          }
          id v10 = (id)defaultInstance__pasExprOnceResult_25120;

          goto LABEL_23;
        }
        uint64_t v9 = pp_default_log_handle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          long long v11 = "PPEventKitImporter: giving up on initialization due to Topic store not getting initialized. Device may b"
                "e Class C locked.";
          goto LABEL_21;
        }
LABEL_22:
        id v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
      uint64_t v9 = pp_default_log_handle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)long long buf = 0;
      long long v11 = "PPEventKitImporter: giving up on initialization due to Location store not getting initialized. Device may be"
            " Class C locked.";
    }
    else
    {
      uint64_t v9 = pp_default_log_handle();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_WORD *)long long buf = 0;
      long long v11 = "PPEventKitImporter: giving up on initialization due to Named Entity store not getting initialized. Device ma"
            "y be Class C locked.";
    }
LABEL_21:
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_22;
  }
  id v2 = pp_default_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "PPEventKitImporter: defaultInstance bypassed due to settings", buf, 2u);
  }
  id v10 = 0;
LABEL_24:

  return v10;
}

void __37__PPEventKitImporter_defaultInstance__block_invoke(void *a1)
{
  id v2 = (void *)MEMORY[0x1CB79D060]();
  id v3 = [PPEventKitImporter alloc];
  uint64_t v4 = +[PPLocalEventStore defaultStore];
  uint64_t v5 = [(PPEventKitImporter *)v3 initWithEventStore:v4 namedEntityStore:a1[4] locationStore:a1[5] topicStore:a1[6] urlStore:0 urlDissector:0 namedEntityDissector:0 dataDetectorMatchClass:0 sqlDatabase:a1[7]];
  uint64_t v6 = (void *)defaultInstance__pasExprOnceResult_25120;
  defaultInstance__pasExprOnceResult_25120 = v5;
}

@end