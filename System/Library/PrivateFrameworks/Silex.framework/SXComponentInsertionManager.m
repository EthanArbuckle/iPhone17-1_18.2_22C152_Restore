@interface SXComponentInsertionManager
- (NSMutableArray)cache;
- (SXBlueprintAnalyzer)blueprintAnalyzer;
- (SXComponentInserterManager)inserterManager;
- (SXComponentInsertionConditionEngine)conditionEngine;
- (SXComponentInsertionManager)initWithComponentInserterManager:(id)a3 conditionEngine:(id)a4 blueprintAnalyzer:(id)a5 unitConverterFactory:(id)a6;
- (SXUnitConverterFactory)unitConverterFactory;
- (id)insertComponentsForBlueprint:(id)a3 DOMObjectProvider:(id)a4;
- (id)insertForMarker:(id)a3 inserter:(id)a4 DOMObjectProvider:(id)a5 layoutProvider:(id)a6;
- (void)updateDOM:(id)a3 layoutBlueprint:(id)a4 insert:(id)a5 marker:(id)a6;
@end

@implementation SXComponentInsertionManager

- (SXComponentInsertionManager)initWithComponentInserterManager:(id)a3 conditionEngine:(id)a4 blueprintAnalyzer:(id)a5 unitConverterFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SXComponentInsertionManager;
  v15 = [(SXComponentInsertionManager *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_inserterManager, a3);
    objc_storeStrong((id *)&v16->_conditionEngine, a4);
    objc_storeStrong((id *)&v16->_blueprintAnalyzer, a5);
    objc_storeStrong((id *)&v16->_unitConverterFactory, a6);
    uint64_t v17 = [MEMORY[0x263EFF980] array];
    cache = v16->_cache;
    v16->_cache = (NSMutableArray *)v17;
  }
  return v16;
}

- (id)insertComponentsForBlueprint:(id)a3 DOMObjectProvider:(id)a4
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  obuint64_t j = 0;
  v101 = v5;
  if (v5 && v6)
  {
    id v102 = v6;
    v7 = SXInsertionLog;
    if (os_log_type_enabled((os_log_t)SXInsertionLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_222AC5000, v7, OS_LOG_TYPE_DEFAULT, "Initiating component insertion for layout blueprint: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v8 = [SXComponentInsertionLayoutProvider alloc];
    v9 = [(SXComponentInsertionManager *)self unitConverterFactory];
    v92 = [(SXComponentInsertionLayoutProvider *)v8 initWithBlueprint:v5 DOMObjectProvider:v102 unitConverterFactory:v9];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v163 = 0x3032000000;
    v164 = __Block_byref_object_copy__4;
    v165 = __Block_byref_object_dispose__4;
    id v166 = [MEMORY[0x263EFF980] array];
    uint64_t v146 = 0;
    v147 = &v146;
    uint64_t v148 = 0x3032000000;
    v149 = __Block_byref_object_copy__4;
    v150 = __Block_byref_object_dispose__4;
    id v151 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    uint64_t v140 = 0;
    v141 = &v140;
    uint64_t v142 = 0x3032000000;
    v143 = __Block_byref_object_copy__4;
    v144 = __Block_byref_object_dispose__4;
    v10 = [(SXComponentInsertionManager *)self inserterManager];
    id v11 = [v10 inserters];
    id v145 = (id)[v11 mutableCopy];

    id v12 = (id)SXInsertionLog;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(id)v141[5] count];
      *(_DWORD *)v158 = 134218240;
      uint64_t v159 = v13;
      __int16 v160 = 2050;
      id v161 = v5;
      _os_log_impl(&dword_222AC5000, v12, OS_LOG_TYPE_DEFAULT, "Initial queue of inserters contains %lu inserter(s), blueprint=%{public}p", v158, 0x16u);
    }

    v98 = [MEMORY[0x263EFF980] array];
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v14 = [(SXComponentInsertionManager *)self cache];
    v15 = (void *)[v14 copy];

    uint64_t v16 = [v15 countByEnumeratingWithState:&v136 objects:v157 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v137;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v137 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v136 + 1) + 8 * i);
          objc_super v20 = -[SXFullscreenCaption caption](v19);
          v21 = -[SXTangierTextRenderCollectorItem storage](v19);
          int v22 = [v20 validateCache:v21 DOMObjectProvider:v102];

          v23 = (id)SXInsertionLog;
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v24)
            {
              v25 = -[SXFullscreenCaption text](v19);
              *(_DWORD *)v158 = 138543618;
              uint64_t v159 = (uint64_t)v25;
              __int16 v160 = 2050;
              id v161 = v101;
              _os_log_impl(&dword_222AC5000, v23, OS_LOG_TYPE_DEFAULT, "Using cached results from %{public}@ inserter, blueprint=%{public}p", v158, 0x16u);
            }
            v26 = (void *)v141[5];
            v27 = -[SXFullscreenCaption text](v19);
            [v26 removeObject:v27];

            v28 = -[SXTangierTextRenderCollectorItem storage](v19);
            [v98 addObjectsFromArray:v28];
          }
          else
          {
            if (v24)
            {
              v29 = -[SXFullscreenCaption text](v19);
              *(_DWORD *)v158 = 138543618;
              uint64_t v159 = (uint64_t)v29;
              __int16 v160 = 2050;
              id v161 = v101;
              _os_log_impl(&dword_222AC5000, v23, OS_LOG_TYPE_DEFAULT, "Cached results no longer valid for from %{public}@ inserter, blueprint=%{public}p", v158, 0x16u);
            }
            v28 = [(SXComponentInsertionManager *)self cache];
            [v28 removeObject:v19];
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v136 objects:v157 count:16];
      }
      while (v16);
    }

    v30 = [v102 components];
    v91 = [v30 allComponents];

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    id obja = (id)v141[5];
    uint64_t v31 = [obja countByEnumeratingWithState:&v132 objects:v156 count:16];
    if (v31)
    {
      uint64_t v96 = *(void *)v133;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v133 != v96) {
            objc_enumerationMutation(obja);
          }
          v33 = *(void **)(*((void *)&v132 + 1) + 8 * j);
          v34 = [v33 conditionEngine];
          char v35 = objc_opt_respondsToSelector();

          if (v35)
          {
            v36 = [v33 conditionEngine];
            [v36 prepareWithComponents:v91 layoutProvider:v92 DOMObjectProvider:v102];
          }
          v37 = [v33 conditionsForDOMObjectProvider:v102];
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          id v38 = v37;
          uint64_t v39 = [v38 countByEnumeratingWithState:&v128 objects:v155 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v129;
            do
            {
              for (uint64_t k = 0; k != v39; ++k)
              {
                if (*(void *)v129 != v40) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v42 = *(void *)(*((void *)&v128 + 1) + 8 * k);
                v43 = [(SXComponentInsertionManager *)self conditionEngine];
                [v43 addCondition:v42];
              }
              uint64_t v39 = [v38 countByEnumeratingWithState:&v128 objects:v155 count:16];
            }
            while (v39);
          }

          v44 = (void *)v147[5];
          v45 = [MEMORY[0x263EFF980] array];
          [v44 setObject:v45 forKey:v33];
        }
        uint64_t v31 = [obja countByEnumeratingWithState:&v132 objects:v156 count:16];
      }
      while (v31);
    }

    v46 = [(SXComponentInsertionManager *)self conditionEngine];
    [v46 prepareWithComponents:v91 layoutProvider:v92 DOMObjectProvider:v102];

    v47 = (id)SXInsertionLog;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = [(id)v141[5] count];
      *(_DWORD *)v158 = 134349312;
      uint64_t v159 = v48;
      __int16 v160 = 2050;
      id v161 = v101;
      _os_log_impl(&dword_222AC5000, v47, OS_LOG_TYPE_DEFAULT, "Starting blueprint analyzing with %{public}lu inserter(s), blueprint=%{public}p", v158, 0x16u);
    }

    objc_initWeak(&location, self);
    v49 = [(SXComponentInsertionManager *)self blueprintAnalyzer];
    v118[0] = MEMORY[0x263EF8330];
    v118[1] = 3221225472;
    v118[2] = __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke;
    v118[3] = &unk_2646545C0;
    objc_copyWeak(&v126, &location);
    id v87 = v98;
    id v119 = v87;
    id v120 = v101;
    p_long long buf = &buf;
    v124 = &v140;
    id v121 = v102;
    v86 = v92;
    v122 = v86;
    v125 = &v146;
    v116[4] = &v140;
    v117[0] = MEMORY[0x263EF8330];
    v117[1] = 3221225472;
    v117[2] = __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_6;
    v117[3] = &unk_2646545E8;
    v117[4] = &v140;
    v116[0] = MEMORY[0x263EF8330];
    v116[1] = 3221225472;
    v116[2] = __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_2;
    v116[3] = &unk_264654610;
    id v90 = v120;
    id v97 = v121;
    [v49 analyzeBlueprint:v120 DOMObjectProvider:v121 onMarkerFound:v118 then:v117 onEndReached:v116];

    v50 = [v97 DOM];
    obuint64_t j = (id)[v50 mutableCopy];

    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v51 = [*(id *)(*((void *)&buf + 1) + 40) reverseObjectEnumerator];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v112 objects:v154 count:16];
    if (v52)
    {
      id v88 = v51;
      uint64_t v89 = *(void *)v113;
      do
      {
        uint64_t v93 = v52;
        for (uint64_t m = 0; m != v93; ++m)
        {
          if (*(void *)v113 != v89) {
            objc_enumerationMutation(v88);
          }
          uint64_t v53 = *(void *)(*((void *)&v112 + 1) + 8 * m);
          v54 = -[SXFullscreenCaption text](v53);
          uint64_t v55 = -[SXFullscreenCaption caption](v53);
          [(SXComponentInsertionManager *)self updateDOM:obj layoutBlueprint:v90 insert:v54 marker:v55];

          v56 = [(SXComponentInsertionManager *)self conditionEngine];
          LOBYTE(v55) = objc_opt_respondsToSelector();

          if (v55)
          {
            v57 = [(SXComponentInsertionManager *)self conditionEngine];
            v58 = -[SXFullscreenCaption text](v53);
            v59 = [v58 component];
            v60 = -[SXFullscreenCaption caption](v53);
            [v60 approximateLocation];
            objc_msgSend(v57, "insertedComponent:approximateLocation:", v59);
          }
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          v61 = [(SXComponentInsertionManager *)self inserterManager];
          v62 = [v61 inserters];

          uint64_t v63 = [v62 countByEnumeratingWithState:&v108 objects:v153 count:16];
          if (v63)
          {
            uint64_t v64 = *(void *)v109;
            do
            {
              for (uint64_t n = 0; n != v63; ++n)
              {
                if (*(void *)v109 != v64) {
                  objc_enumerationMutation(v62);
                }
                v66 = *(void **)(*((void *)&v108 + 1) + 8 * n);
                v67 = [v66 conditionEngine];
                char v68 = objc_opt_respondsToSelector();

                if (v68)
                {
                  v69 = [v66 conditionEngine];
                  v70 = -[SXFullscreenCaption text](v53);
                  v71 = [v70 component];
                  v72 = -[SXFullscreenCaption caption](v53);
                  [v72 approximateLocation];
                  objc_msgSend(v69, "insertedComponent:approximateLocation:", v71);
                }
              }
              uint64_t v63 = [v62 countByEnumeratingWithState:&v108 objects:v153 count:16];
            }
            while (v63);
          }
        }
        v51 = v88;
        uint64_t v52 = [v88 countByEnumeratingWithState:&v112 objects:v154 count:16];
      }
      while (v52);
    }

    v73 = (id)SXInsertionLog;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v74 = [*(id *)(*((void *)&buf + 1) + 40) count];
      *(_DWORD *)v158 = 134349312;
      uint64_t v159 = v74;
      __int16 v160 = 2050;
      id v161 = v90;
      _os_log_impl(&dword_222AC5000, v73, OS_LOG_TYPE_DEFAULT, "Finished DOM mutation for %{public}lu insert(s), blueprint=%{public}p", v158, 0x16u);
    }

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v75 = [(SXComponentInsertionManager *)self inserterManager];
    v76 = [v75 inserters];

    uint64_t v77 = [v76 countByEnumeratingWithState:&v104 objects:v152 count:16];
    if (v77)
    {
      uint64_t v100 = *(void *)v105;
      do
      {
        for (iuint64_t i = 0; ii != v77; ++ii)
        {
          if (*(void *)v105 != v100) {
            objc_enumerationMutation(v76);
          }
          v79 = *(void **)(*((void *)&v104 + 1) + 8 * ii);
          if (objc_opt_respondsToSelector())
          {
            v80 = [(id)v147[5] objectForKey:v79];
            v81 = [v79 cacheValidatorForCache:v80 DOMObjectProvider:v97];
            if ([v80 count]) {
              BOOL v82 = v81 == 0;
            }
            else {
              BOOL v82 = 1;
            }
            if (!v82)
            {
              v83 = -[SXComponentInsertionCacheItem initWithInserter:validator:results:]((id *)[SXComponentInsertionCacheItem alloc], v79, v81, v80);
              v84 = [(SXComponentInsertionManager *)self cache];
              [v84 addObject:v83];
            }
          }
          if (objc_opt_respondsToSelector()) {
            [v79 componentInsertionCompleted];
          }
        }
        uint64_t v77 = [v76 countByEnumeratingWithState:&v104 objects:v152 count:16];
      }
      while (v77);
    }

    objc_destroyWeak(&v126);
    objc_destroyWeak(&location);

    _Block_object_dispose(&v140, 8);
    _Block_object_dispose(&v146, 8);

    _Block_object_dispose(&buf, 8);
    id v6 = v102;
  }

  return obj;
}

uint64_t __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 88));
  id v4 = objc_loadWeakRetained(&to);
  BOOL v5 = v4 == 0;

  if (v5)
  {
    uint64_t v19 = 0;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v11 = -[SXFullscreenCaption caption](v10);
          int v12 = objc_msgSend(v11, "isEqualToMarker:", v3, (void)v24);

          if (v12)
          {
            objc_super v20 = (id)SXInsertionLog;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = -[SXFullscreenCaption text](v10);
              int v22 = *(void **)(a1 + 40);
              *(_DWORD *)long long buf = 138543874;
              v30 = v21;
              __int16 v31 = 2114;
              id v32 = v3;
              __int16 v33 = 2050;
              id v34 = v22;
              _os_log_impl(&dword_222AC5000, v20, OS_LOG_TYPE_DEFAULT, "Inserting cached insert %{public}@ for marker: %{public}@, blueprint=%{public}p", buf, 0x20u);
            }
            [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v10];
            uint64_t v19 = 2;
            goto LABEL_17;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v37 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) firstObject];
    id v13 = objc_loadWeakRetained(&to);
    id v14 = [v13 insertForMarker:v3 inserter:v6 DOMObjectProvider:*(void *)(a1 + 48) layoutProvider:*(void *)(a1 + 56)];

    if (v14)
    {
      v15 = SXInsertionLog;
      if (os_log_type_enabled((os_log_t)SXInsertionLog, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138544130;
        v30 = v14;
        __int16 v31 = 2114;
        id v32 = v3;
        __int16 v33 = 2114;
        id v34 = v6;
        __int16 v35 = 2050;
        uint64_t v36 = v16;
        _os_log_impl(&dword_222AC5000, v15, OS_LOG_TYPE_DEFAULT, "Adding insert %{public}@ at marker %{public}@ for inserter: %{public}@, blueprint=%{public}p", buf, 0x2Au);
      }
      uint64_t v17 = -[SXComponentInsertionResult initWithInsert:marker:]((id *)[SXComponentInsertionResult alloc], v14, v3);
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v17];
      v18 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) objectForKey:v6];
      [v18 addObject:v17];

      uint64_t v19 = 1;
    }
    else
    {
      uint64_t v19 = 0;
    }
LABEL_17:
  }
  objc_destroyWeak(&to);

  return v19;
}

uint64_t __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return 0;
  }
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] < 2) {
    return 0;
  }
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) firstObject];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeObject:v3];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 1;
}

uint64_t __78__SXComponentInsertionManager_insertComponentsForBlueprint_DOMObjectProvider___block_invoke_2(uint64_t a1)
{
  if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] < 2) {
    return 2;
  }
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) firstObject];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) removeObjectAtIndex:0];

  return 1;
}

- (id)insertForMarker:(id)a3 inserter:(id)a4 DOMObjectProvider:(id)a5 layoutProvider:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(SXComponentInsertionManager *)self conditionEngine];
  int v15 = objc_msgSend(v14, "validateMarker:componentTraits:layoutProvider:", v10, objc_msgSend(v11, "componentTraits"), v13);

  if (!v15) {
    goto LABEL_10;
  }
  uint64_t v16 = [v11 conditionEngine];
  if (objc_msgSend(v16, "validateMarker:componentTraits:layoutProvider:", v10, objc_msgSend(v11, "componentTraits"), v13))
  {
  }
  else
  {
    uint64_t v17 = [v11 conditionEngine];

    if (v17)
    {
LABEL_10:
      uint64_t v19 = 0;
      goto LABEL_11;
    }
  }
  if (![v11 validateMarker:v10 DOMObjectProvider:v12 layoutProvider:v13]) {
    goto LABEL_10;
  }
  v18 = [v11 componentInsertForMarker:v10 DOMObjectProvider:v12 layoutProvider:v13];
  uint64_t v19 = v18;
  if (!v18
    || ([v18 component], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v21 = (void *)v20,
        [v19 componentLayout],
        int v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v21,
        !v22))
  {

    goto LABEL_10;
  }
LABEL_11:

  return v19;
}

- (void)updateDOM:(id)a3 layoutBlueprint:(id)a4 insert:(id)a5 marker:(id)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x263EFF980] array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v14 = objc_msgSend(v12, "path", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v44;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v44 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [*(id *)(*((void *)&v43 + 1) + 8 * v18) identifier];
        [v13 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [v9 components];
  v21 = [v20 componentsForContainerComponentWithPath:v13];

  int v22 = [v11 component];
  v23 = [v22 identifier];

  if (!v23)
  {
    long long v24 = [v11 component];
    long long v25 = [MEMORY[0x263F08C38] UUID];
    long long v26 = [v25 UUIDString];
    [v24 setIdentifier:v26];
  }
  long long v27 = [v22 layout];

  if (!v27)
  {
    v28 = [v11 component];
    v29 = [MEMORY[0x263F08C38] UUID];
    v30 = [v29 UUIDString];
    [v28 setLayout:v30];
  }
  __int16 v31 = [v22 anchor];

  if (!v31)
  {
    id v32 = [v11 component];
    __int16 v33 = [v12 componentAnchor];
    [v32 setAnchor:v33];
  }
  id v34 = [v11 component];
  __int16 v35 = [v12 leadingComponent];
  [v21 insertComponent:v34 afterComponent:v35];

  uint64_t v36 = [v9 componentLayouts];
  v37 = [v11 componentLayout];
  uint64_t v38 = [v22 layout];
  [v36 setObject:v37 forKey:v38];

  uint64_t v39 = [v12 componentAnchor];
  uint64_t v40 = [v39 targetComponentIdentifier];

  if (v40)
  {
    v41 = [v12 componentAnchor];
    uint64_t v42 = [v41 targetComponentIdentifier];
    [v10 invalidateSizeForComponentWithIdentifier:v42];
  }
}

- (SXComponentInsertionConditionEngine)conditionEngine
{
  return self->_conditionEngine;
}

- (SXComponentInserterManager)inserterManager
{
  return self->_inserterManager;
}

- (SXBlueprintAnalyzer)blueprintAnalyzer
{
  return self->_blueprintAnalyzer;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (NSMutableArray)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_blueprintAnalyzer, 0);
  objc_storeStrong((id *)&self->_inserterManager, 0);
  objc_storeStrong((id *)&self->_conditionEngine, 0);
}

@end