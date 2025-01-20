@interface PPQuickTypeContactsServant
- (PPQuickTypeContactsServant)init;
- (PPQuickTypeContactsServant)initWithOptions:(unsigned __int8)a3;
- (id)_mePredictionCacheKeyForQuery:(void *)a1;
- (id)_scoredMeContactWithMeContact:(uint64_t)a1;
- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5;
- (uint64_t)_isSemanticTagEligible:(uint64_t)result;
- (void)clearCaches;
@end

@implementation PPQuickTypeContactsServant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNameLookups, 0);
  objc_storeStrong((id *)&self->_meQuickTypeItemCache, 0);
  objc_storeStrong((id *)&self->_localContactStore, 0);
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = -[PPQuickTypeContactsServant _isSemanticTagEligible:]((uint64_t)self, [v8 semanticTag]);
  if ([v8 type] != 1 && !v10)
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_132;
  }
  v12 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, "prediction request to PPQuickTypeContactsServant-quickTypeItemsForQuery", buf, 2u);
  }

  if (([v8 fields] & 0x200000) == 0
    && !+[PPQuickTypeSettings servantShouldRespondToQuery:self])
  {
    v21 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_DEFAULT, "ignoring prediction request for Contacts due to settings", buf, 2u);
    }

    [v9 push:47];
    id v22 = 0;
    v23 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_133;
  }
  id v13 = v8;
  id v128 = v9;
  id v122 = v9;
  if (!self)
  {
    v11 = 0;
    goto LABEL_131;
  }
  id v120 = v13;
  id v14 = v13;
  id v121 = v8;
  unint64_t v123 = a4;
  if ([v14 subtype] == 1)
  {

    goto LABEL_12;
  }
  int v15 = -[PPQuickTypeContactsServant _isSemanticTagEligible:]((uint64_t)self, [v14 semanticTag]);

  if (v15)
  {
LABEL_12:
    int v16 = objc_msgSend(v14, "subtype", v120);
    id v17 = v14;
    v18 = v17;
    if (v16 != 1)
    {
      unsigned int v19 = [v17 semanticTag] - 1;
      if (v19 > 0x10) {
        uint64_t v20 = 0;
      }
      else {
        uint64_t v20 = dword_1CAB7BDBC[v19];
      }
      v80 = (void *)[v18 copy];

      [v80 setType:1];
      [v80 setSubtype:1];
      [v80 setFields:v20];
      v18 = v80;
    }
    id v66 = v18;
    id v81 = v128;
    v82 = -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v66);
    v11 = [(NSCache *)self->_meQuickTypeItemCache objectForKey:v82];
    v83 = pp_quicktype_log_handle();
    BOOL v84 = os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v84)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v83, OS_LOG_TYPE_DEBUG, "Me card prediction cache HIT", buf, 2u);
      }
    }
    else
    {
      if (v84)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v83, OS_LOG_TYPE_DEBUG, "Me card prediction cache MISS", buf, 2u);
      }

      v85 = [(PPLocalContactStore *)self->_localContactStore meCard];
      if (!v85)
      {
        v100 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v100, OS_LOG_TYPE_DEFAULT, "No Me card available to make Me prediction", buf, 2u);
        }

        [v81 push:9];
        v11 = 0;
        goto LABEL_116;
      }
      v83 = v85;
      -[PPQuickTypeContactsServant _scoredMeContactWithMeContact:]((uint64_t)self, v85);
      v86 = v132 = self;
      *(void *)&long long v138 = v86;
      v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
      v88 = [v66 label];
      unsigned int v89 = [v66 fields];
      v90 = +[PPQuickTypeFormatter formatterWithQuery:v66];
      v11 = PPQuickTypeItemsForContacts(v87, v88, v89, v90, 0x14uLL, 1, v81);

      [(NSCache *)v132->_meQuickTypeItemCache setObject:v11 forKey:v82];
    }

    if (v10 && ([v66 fields] & 4) != 0 && (unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      v91 = objc_opt_new();
      long long v134 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v92 = v11;
      uint64_t v93 = [v92 countByEnumeratingWithState:&v134 objects:buf count:16];
      if (v93)
      {
        uint64_t v94 = v93;
        uint64_t v95 = *(void *)v135;
        do
        {
          for (uint64_t i = 0; i != v94; ++i)
          {
            if (*(void *)v135 != v95) {
              objc_enumerationMutation(v92);
            }
            v97 = *(void **)(*((void *)&v134 + 1) + 8 * i);
            if (([v97 fields] & 4) != 0) {
              [v91 addObject:v97];
            }
          }
          uint64_t v94 = [v92 countByEnumeratingWithState:&v134 objects:buf count:16];
        }
        while (v94);
      }

      v11 = (void *)[v91 copy];
    }
    if ([v11 count] > v123)
    {
      v98 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v119 = [v11 count];
        *(_DWORD *)v146 = 134218240;
        *(void *)&v146[4] = v119;
        *(_WORD *)&v146[12] = 2048;
        *(void *)&v146[14] = v123;
        _os_log_debug_impl(&dword_1CA9A8000, v98, OS_LOG_TYPE_DEBUG, "Trimming down Me card prediction result from %lu to %lu", v146, 0x16u);
      }

      uint64_t v99 = objc_msgSend(v11, "subarrayWithRange:", 0, v123);

      v11 = (void *)v99;
    }
LABEL_116:

    goto LABEL_130;
  }
  v24 = [v14 people];
  uint64_t v25 = [v24 count];

  if (!v25)
  {
    id v66 = (id)objc_opt_new();
    localContactStore = self->_localContactStore;
    *(void *)&long long v134 = 0;
    v102 = [(PPLocalContactStore *)localContactStore rankedContactsWithQuery:v66 error:&v134];
    id v103 = (id)v134;
    if (v102)
    {
      v104 = [v14 label];
      unsigned int v105 = [v14 fields];
      v106 = +[PPQuickTypeFormatter formatterWithQuery:v14];
      v11 = PPQuickTypeItemsForContacts(v102, v104, v105, v106, v123, 0, v128);
    }
    else
    {
      v117 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v103;
        _os_log_error_impl(&dword_1CA9A8000, v117, OS_LOG_TYPE_ERROR, "_predictionForPeopleQuery call to rankedContactsWithQuery with empty query returned nil and error = %@", buf, 0xCu);
      }

      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }

    goto LABEL_129;
  }
  v127 = objc_opt_new();
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v26 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v27 = [v14 people];
  v28 = (void *)[v26 initWithArray:v27];

  obuint64_t j = v28;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v138 objects:&v134 count:16];
  id v124 = v14;
  if (!v29) {
    goto LABEL_72;
  }
  uint64_t v30 = v29;
  uint64_t v129 = *(void *)v139;
  v131 = self;
  do
  {
    uint64_t v31 = 0;
    uint64_t v125 = v30;
    do
    {
      if (*(void *)v139 != v129) {
        objc_enumerationMutation(obj);
      }
      v32 = *(void **)(*((void *)&v138 + 1) + 8 * v31);
      if (objc_msgSend(v32, "length", v120))
      {
        int v33 = [v14 fields];
        if (!v33)
        {
          v34 = pp_quicktype_log_handle();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v34, OS_LOG_TYPE_DEFAULT, "query.fields is PPQuickTypeFieldNone. Setting justPreloadCache to YES.", buf, 2u);
          }
        }
        int v35 = [v14 subtype];
        v36 = [v14 timeoutSeconds];
        id v37 = v32;
        id v38 = v128;
        id v39 = v36;
        v40 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CA9A8000, v40, OS_LOG_TYPE_DEBUG, "PPQuickTypeContactsServant: lookupScoredPeopleWithNamePrefix", buf, 2u);
        }

        v133 = v38;
        if (v35 != 12)
        {
          id v41 = (id)objc_opt_new();
          [v41 setOnlyQueryMostRelevantContacts:1];
          [v41 setMatchingName:v37];
          v42 = self->_localContactStore;
          *(void *)v146 = 0;
          v43 = [(PPLocalContactStore *)v42 rankedContactsWithQuery:v41 error:v146];
          v44 = *(id *)v146;
          if (v43)
          {
            if (!v33) {
              goto LABEL_42;
            }
LABEL_38:
            if (![v43 count]) {
              goto LABEL_42;
            }
            v46 = pp_quicktype_log_handle();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v47 = [v43 count];
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v47;
              _os_log_impl(&dword_1CA9A8000, v46, OS_LOG_TYPE_DEFAULT, "found and using %tu matches in most relevant contacts", buf, 0xCu);
            }

LABEL_66:
            [v127 addObjectsFromArray:v43];

            self = v131;
            goto LABEL_67;
          }
          v45 = pp_quicktype_log_handle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v44;
            _os_log_error_impl(&dword_1CA9A8000, v45, OS_LOG_TYPE_ERROR, "error during most relevant contact lookup: %@", buf, 0xCu);
          }

          if (v33) {
            goto LABEL_38;
          }
LABEL_42:

          self = v131;
          id v38 = v133;
        }
        id v130 = v37;
        id v48 = v37;
        id v49 = v38;
        id v50 = v39;
        uint64_t v51 = [(NSCache *)self->_cachedNameLookups objectForKey:v48];
        v52 = pp_quicktype_log_handle();
        BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG);
        if (v51)
        {
          if (v53)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v48;
            _os_log_debug_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_DEBUG, "cache HIT for name prefix: %@", buf, 0xCu);
          }

          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v51 + 8), 0xFFFFFFFFFFFFFFFFLL);
          id v41 = *(id *)(v51 + 16);
          if (![v41 count]) {
            [v49 push:13];
          }
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v51 + 8));
        }
        else
        {
          if (v53)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v48;
            _os_log_debug_impl(&dword_1CA9A8000, v52, OS_LOG_TYPE_DEBUG, "cache MISS for name prefix: %@", buf, 0xCu);
          }

          v54 = (id *)objc_opt_new();
          dispatch_semaphore_t v55 = dispatch_semaphore_create(0);
          if (v54) {
            objc_storeStrong(v54 + 1, v55);
          }

          [(NSCache *)v131->_cachedNameLookups setObject:v54 forKey:v48];
          v56 = objc_opt_new();
          [v56 setMatchingName:v48];
          v57 = v131->_localContactStore;
          *(void *)buf = 0;
          if (v33) {
            [(PPLocalContactStore *)v57 contactsWithQuery:v56 explanationSet:v49 timeoutSeconds:v50 error:buf];
          }
          else {
          v58 = [(PPLocalContactStore *)v57 contactsWithQuery:v56 error:buf];
          }
          id v59 = *(id *)buf;
          if (v54)
          {
            objc_storeStrong(v54 + 2, v58);

            dispatch_semaphore_signal((dispatch_semaphore_t)v54[1]);
            id v60 = v54[2];
          }
          else
          {

            dispatch_semaphore_signal(0);
            id v60 = 0;
          }
          if (![v60 count]) {
            [v49 push:13];
          }
          if (v54) {
            id v61 = v54[2];
          }
          else {
            id v61 = 0;
          }
          id v41 = v61;

          self = v131;
        }

        v43 = [(PPLocalContactStore *)self->_localContactStore scoredContactsWithContacts:v41];
        v44 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v62 = [v43 count];
          *(_DWORD *)buf = 134218242;
          *(void *)&buf[4] = v62;
          __int16 v144 = 2112;
          v145 = v43;
          _os_log_debug_impl(&dword_1CA9A8000, v44, OS_LOG_TYPE_DEBUG, "Scored %tu name matches: %@", buf, 0x16u);
        }
        id v14 = v124;
        uint64_t v30 = v125;
        id v37 = v130;
        goto LABEL_66;
      }
LABEL_67:
      ++v31;
    }
    while (v30 != v31);
    uint64_t v63 = [obj countByEnumeratingWithState:&v138 objects:&v134 count:16];
    uint64_t v30 = v63;
  }
  while (v63);
LABEL_72:

  id v64 = v127;
  id v65 = v128;
  memset(v146, 0, sizeof(v146));
  long long v147 = 0u;
  long long v148 = 0u;
  id v66 = v64;
  uint64_t v67 = [v66 countByEnumeratingWithState:v146 objects:buf count:16];
  v68 = v66;
  v69 = v66;
  if (!v67) {
    goto LABEL_123;
  }
  uint64_t v70 = v67;
  unint64_t v71 = 0;
  uint64_t v72 = **(void **)&v146[16];
  double v73 = -1.0;
  while (2)
  {
    for (uint64_t j = 0; j != v70; ++j)
    {
      if (**(void **)&v146[16] != v72) {
        objc_enumerationMutation(v66);
      }
      v75 = *(void **)(*(void *)&v146[8] + 8 * j);
      v76 = objc_msgSend(v75, "contact", v120);
      int v77 = [v76 source];

      if (v77 == 1)
      {
        ++v71;
        [v75 score];
        if (v73 == -1.0)
        {
          double v73 = v78;
        }
        else if (vabdd_f64(v73, v78) > 0.0001)
        {

          v68 = [v66 sortedArrayUsingComparator:&__block_literal_global_24124];
          v107 = [v68 objectAtIndexedSubscript:0];
          [v107 score];
          double v109 = v108;
          v110 = [v68 objectAtIndexedSubscript:1];
          [v110 score];
          double v112 = v111 + v111;

          if (v109 <= v112)
          {
            v69 = v66;
          }
          else
          {
            v113 = [v68 objectAtIndexedSubscript:0];
            *(void *)v142 = v113;
            v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:1];
          }
          id v14 = v124;
          goto LABEL_123;
        }
      }
    }
    uint64_t v70 = [v66 countByEnumeratingWithState:v146 objects:buf count:16];
    if (v70) {
      continue;
    }
    break;
  }

  v69 = v66;
  id v14 = v124;
  if (v71 > 2 * v123)
  {
    v79 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v142 = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v79, OS_LOG_TYPE_DEBUG, "too many ambiguous matches, not returning anything", v142, 2u);
    }

    [v65 push:14];
    v69 = objc_opt_new();
    v68 = v66;
LABEL_123:
  }
  id v103 = v69;

  v114 = [v14 label];
  unsigned int v115 = [v14 fields];
  v116 = +[PPQuickTypeFormatter formatterWithQuery:v14];
  v11 = PPQuickTypeItemsForContacts(v103, v114, v115, v116, v123, 0, v65);

LABEL_129:
LABEL_130:

  id v13 = v120;
  id v8 = v121;
LABEL_131:

  id v9 = v122;
LABEL_132:
  id v22 = v11;
  v23 = v22;
LABEL_133:

  return v22;
}

- (uint64_t)_isSemanticTagEligible:(uint64_t)result
{
  if (result)
  {
    self;
    if (_supportedPeopleSemanticTypes_onceToken != -1) {
      dispatch_once(&_supportedPeopleSemanticTypes_onceToken, &__block_literal_global_27_24145);
    }
    id v3 = (id)_supportedPeopleSemanticTypes_supportedPeopleSemanticTypes;
    v4 = [NSNumber numberWithUnsignedChar:a2];
    uint64_t v5 = [v3 containsObject:v4];

    return v5;
  }
  return result;
}

uint64_t __89__PPQuickTypeContactsServant__applySmartLimitingToCandidates_clientLimit_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (void *)MEMORY[0x1E4F89FC8];
  id v5 = a3;
  [a2 score];
  double v7 = v6;
  [v5 score];
  double v9 = v8;

  return [v4 compareDouble:v7 withDouble:v9];
}

- (id)_mePredictionCacheKeyForQuery:(void *)a1
{
  v1 = (objc_class *)NSString;
  id v2 = a1;
  id v3 = [v1 alloc];
  uint64_t v4 = [v2 fields];
  id v5 = [v2 label];
  double v6 = [v2 localeIdentifier];

  double v7 = (void *)[v3 initWithFormat:@"%lu:%@:%@", v4, v5, v6];
  return v7;
}

- (id)_scoredMeContactWithMeContact:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 8);
  double v9 = a2;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a2;
  id v5 = [v3 arrayWithObjects:&v9 count:1];
  double v6 = objc_msgSend(v2, "scoredContactsWithContacts:", v5, v9, v10);

  double v7 = [v6 firstObject];

  return v7;
}

void __59__PPQuickTypeContactsServant__supportedPeopleSemanticTypes__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F256A070, &unk_1F256A088, &unk_1F256A0A0, &unk_1F256A0B8, &unk_1F256A0D0, &unk_1F256A0E8, &unk_1F256A100, &unk_1F256A118, &unk_1F256A130, &unk_1F256A148, &unk_1F256A160, 0);
  id v2 = (void *)_supportedPeopleSemanticTypes_supportedPeopleSemanticTypes;
  _supportedPeopleSemanticTypes_supportedPeopleSemanticTypes = v1;
}

- (PPQuickTypeContactsServant)initWithOptions:(unsigned __int8)a3
{
  v66[4] = *(id *)MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)PPQuickTypeContactsServant;
  id v4 = [(PPQuickTypeContactsServant *)&v55 init];
  if (v4)
  {
    id v5 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_INFO, "PPQuickTypeContactsServant initializing", buf, 2u);
    }

    uint64_t v6 = +[PPLocalContactStore defaultStore];
    localContactStore = v4->_localContactStore;
    v4->_localContactStore = (PPLocalContactStore *)v6;

    uint64_t v8 = objc_opt_new();
    meQuickTypeItemCache = v4->_meQuickTypeItemCache;
    v4->_meQuickTypeItemCache = (NSCache *)v8;

    [(NSCache *)v4->_meQuickTypeItemCache setCountLimit:6];
    if ((a3 & 1) == 0)
    {
      id location = 0;
      objc_initWeak(&location, v4->_cachedNameLookups);
      id from = 0;
      objc_initWeak(&from, v4->_meQuickTypeItemCache);
      uint64_t v10 = (void *)MEMORY[0x1E4F89EC0];
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v63 = 3221225472;
      id v64 = __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke;
      id v65 = &unk_1E65DC540;
      objc_copyWeak(v66, &from);
      [v10 addMeCardObserverForLifetimeOfObject:v4 block:buf];
      v11 = (void *)MEMORY[0x1E4F89EC0];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_15;
      v60[3] = &unk_1E65DC540;
      objc_copyWeak(&v61, &location);
      [v11 addContactsObserverForLifetimeOfObject:v4 block:v60];
      v12 = (void *)MEMORY[0x1E4F89EC0];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_16;
      v58[3] = &unk_1E65DC540;
      objc_copyWeak(&v59, &location);
      [v12 addSuggestionsObserverForLifetimeOfObject:v4 block:v58];
      objc_destroyWeak(&v59);
      objc_destroyWeak(&v61);
      objc_destroyWeak(v66);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
      id v13 = objc_opt_new();
      id v14 = v13;
      objc_storeStrong((id *)&v4->_cachedNameLookups, v13);

      id v15 = +[PPLabelMatcher sharedInstance];
      int v16 = (void *)MEMORY[0x1E4F89EE8];
      id v17 = [MEMORY[0x1E4F1CA20] currentLocale];
      v18 = [v17 localeIdentifier];
      unsigned int v19 = [v16 quickTypeQueryWithType:0 subtype:0 semanticTag:0 fields:0 time:0 options:0 subFields:0 label:0 people:0 localeIdentifier:v18 bundleIdentifier:0 recipients:0];
      uint64_t v20 = +[PPQuickTypeFormatter formatterWithQuery:v19];

      id v21 = (id)[v20 makeBirthdayFormatter];
      if ([(PPLocalContactStore *)v4->_localContactStore chineseBirthdayFound])
      {
        id v22 = (id)[v20 makeChineseBirthdayFormatter];
        id v23 = (id)[v20 makeYearlessChineseBirthdayFormatter];
      }
      uint64_t v24 = *MEMORY[0x1E4F1B770];
      *(void *)buf = *MEMORY[0x1E4F1B6F8];
      uint64_t v63 = v24;
      uint64_t v25 = (void *)*MEMORY[0x1E4F1B6F0];
      id v64 = (void (*)(uint64_t))*MEMORY[0x1E4F1B700];
      id v65 = v25;
      id v26 = (void *)*MEMORY[0x1E4F1B758];
      v66[0] = *(id *)MEMORY[0x1E4F1B720];
      v66[1] = v26;
      v66[2] = *(id *)MEMORY[0x1E4F1B728];
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:7];
      id v28 = (id)[v20 formattedStringsForLabels:v27];

      id v29 = [(PPLocalContactStore *)v4->_localContactStore meCard];
      if (v29)
      {
        uint64_t v54 = -[PPQuickTypeContactsServant _scoredMeContactWithMeContact:]((uint64_t)v4, v29);
        uint64_t v30 = pp_quicktype_log_handle();
        uint64_t v31 = v30;
        if (v54)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_DEFAULT, "Precalculating basic Me card predictions", buf, 2u);
          }

          v32 = [MEMORY[0x1E4F1CA20] currentLocale];
          uint64_t v31 = [v32 localeIdentifier];

          [(NSCache *)v4->_meQuickTypeItemCache removeAllObjects];
          BOOL v53 = [MEMORY[0x1E4F89EE8] quickTypeQueryWithType:1 subtype:1 semanticTag:0 fields:1 time:0 options:0 subFields:0 label:0 people:0 localeIdentifier:v31 bundleIdentifier:0 recipients:0];
          int v33 = v4->_meQuickTypeItemCache;
          *(void *)buf = v54;
          v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:1];
          int v35 = +[PPQuickTypeFormatter formatterWithQuery:v53];
          v36 = PPQuickTypeItemsForContacts(v34, 0, 1u, v35, 0x14uLL, 1, 0);
          id v37 = -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v53);
          [(NSCache *)v33 setObject:v36 forKey:v37];

          v52 = [MEMORY[0x1E4F89EE8] quickTypeQueryWithType:1 subtype:1 semanticTag:0 fields:2 time:0 options:0 subFields:0 label:0 people:0 localeIdentifier:v31 bundleIdentifier:0 recipients:0];
          id v38 = v4->_meQuickTypeItemCache;
          v60[0] = v54;
          id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:1];
          v40 = +[PPQuickTypeFormatter formatterWithQuery:v52];
          id v41 = PPQuickTypeItemsForContacts(v39, 0, 2u, v40, 0x14uLL, 1, 0);
          v42 = -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v52);
          [(NSCache *)v38 setObject:v41 forKey:v42];

          v43 = [MEMORY[0x1E4F89EE8] quickTypeQueryWithType:1 subtype:1 semanticTag:0 fields:4 time:0 options:0 subFields:0 label:0 people:0 localeIdentifier:v31 bundleIdentifier:0 recipients:0];
          v44 = v4->_meQuickTypeItemCache;
          v58[0] = v54;
          v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
          v46 = +[PPQuickTypeFormatter formatterWithQuery:v43];
          uint64_t v47 = PPQuickTypeItemsForContacts(v45, 0, 4u, v46, 0x14uLL, 1, 0);
          id v48 = -[PPQuickTypeContactsServant _mePredictionCacheKeyForQuery:](v43);
          [(NSCache *)v44 setObject:v47 forKey:v48];
        }
        else if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CA9A8000, v31, OS_LOG_TYPE_ERROR, "failed to score me card so cannot preload me card item cache", buf, 2u);
        }

        id v49 = v54;
      }
      else
      {
        id v49 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v49, OS_LOG_TYPE_DEFAULT, "No me card available during preloading in Contacts servant", buf, 2u);
        }
      }
    }
    id v50 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA9A8000, v50, OS_LOG_TYPE_INFO, "PPQuickTypeContactsServant initialization complete", buf, 2u);
    }
  }
  return v4;
}

void __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke(uint64_t a1)
{
  id v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "clearing Me card cache due to Me Card change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeAllObjects];
}

void __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_15(uint64_t a1)
{
  id v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "clearing PQT name lookup cache due to Contacts change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeAllObjects];
}

void __55__PPQuickTypeContactsServant__registerForNotifications__block_invoke_16(uint64_t a1)
{
  id v2 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1CA9A8000, v2, OS_LOG_TYPE_DEFAULT, "Notification: FoD contacts did change", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeAllObjects];
}

- (PPQuickTypeContactsServant)init
{
  return [(PPQuickTypeContactsServant *)self initWithOptions:0];
}

- (void)clearCaches
{
}

@end