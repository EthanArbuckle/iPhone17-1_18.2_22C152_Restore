@interface TFFeedbackDataContainer
- (BOOL)isEntryWithIdentifierLoading:(id)a3;
- (BOOL)isGroupWithIdentifierIncluded:(id)a3;
- (BOOL)isLoading;
- (NSMutableArray)dirtyEntryIdentifiers;
- (NSMutableArray)dirtyGroupIdentifiers;
- (NSMutableDictionary)imageCollectionEntryMap;
- (NSMutableDictionary)numberEntryMap;
- (NSMutableDictionary)stringEntryMap;
- (NSMutableSet)includedGroupIdentifiers;
- (NSMutableSet)loadingEntryIdentifiers;
- (NSString)debugDescription;
- (NSString)name;
- (OS_dispatch_queue)accessQueue;
- (TFFeedbackDataContainer)initWithName:(id)a3;
- (TFFeedbackDataContainer)initWithName:(id)a3 includedGroupIdentifiers:(id)a4 loadingEntryIdentifiers:(id)a5 stringEntryMap:(id)a6 numberEntryMap:(id)a7 imageCollectionEntryMap:(id)a8 dirtyGroupIdentifiers:(id)a9 dirtyEntryIdentifiers:(id)a10;
- (TFFeedbackDataContainerObserver)observer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageCollectionForIdentifer:(id)a3;
- (id)numberForIdentifier:(id)a3;
- (id)objectForIdentifier:(id)a3;
- (id)stringForIdentifier:(id)a3;
- (void)_clearDirtyIdentifiers;
- (void)_markEntryIdentifierDirty:(id)a3;
- (void)_markGroupIdentifierDirty:(id)a3;
- (void)_notifyObserverOfUpdates;
- (void)overwriteWithContentsOfDataContainer:(id)a3;
- (void)performBatchUpdates:(id)a3;
- (void)performBatchUpdates:(id)a3 suppressingNotifications:(BOOL)a4;
- (void)prepareInitialValuesForForm:(id)a3;
- (void)setEntryLoadingForIdentifier:(id)a3 toValue:(BOOL)a4;
- (void)setGroupInclusionForIdentifier:(id)a3 toValue:(BOOL)a4;
- (void)setImageCollectionForIdentifier:(id)a3 toValue:(id)a4;
- (void)setNumberForIdentifier:(id)a3 toValue:(id)a4;
- (void)setObserver:(id)a3;
- (void)setStringForIdentifier:(id)a3 toValue:(id)a4;
@end

@implementation TFFeedbackDataContainer

- (TFFeedbackDataContainer)initWithName:(id)a3 includedGroupIdentifiers:(id)a4 loadingEntryIdentifiers:(id)a5 stringEntryMap:(id)a6 numberEntryMap:(id)a7 imageCollectionEntryMap:(id)a8 dirtyGroupIdentifiers:(id)a9 dirtyEntryIdentifiers:(id)a10
{
  id v16 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)TFFeedbackDataContainer;
  v18 = [(TFFeedbackDataContainer *)&v32 init];
  if (v18)
  {
    uint64_t v19 = [v16 copy];
    name = v18->_name;
    v18->_name = (NSString *)v19;

    objc_storeStrong((id *)&v18->_includedGroupIdentifiers, a4);
    objc_storeStrong((id *)&v18->_loadingEntryIdentifiers, a5);
    objc_storeStrong((id *)&v18->_stringEntryMap, a6);
    objc_storeStrong((id *)&v18->_numberEntryMap, a7);
    objc_storeStrong((id *)&v18->_imageCollectionEntryMap, a8);
    objc_storeStrong((id *)&v18->_dirtyGroupIdentifiers, a9);
    objc_storeStrong((id *)&v18->_dirtyEntryIdentifiers, a10);
    id v21 = [NSString stringWithFormat:@"com.apple.TestFlightCore.TFFeedbackDataContainer.%@", v16];
    v22 = (const char *)[v21 UTF8String];
    dispatch_queue_t v23 = dispatch_queue_create(v22, MEMORY[0x263EF83A8]);
    accessQueue = v18->_accessQueue;
    v18->_accessQueue = (OS_dispatch_queue *)v23;
  }
  return v18;
}

- (TFFeedbackDataContainer)initWithName:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13 = [(TFFeedbackDataContainer *)self initWithName:v5 includedGroupIdentifiers:v6 loadingEntryIdentifiers:v7 stringEntryMap:v8 numberEntryMap:v9 imageCollectionEntryMap:v10 dirtyGroupIdentifiers:v11 dirtyEntryIdentifiers:v12];

  return v13;
}

- (NSString)debugDescription
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  v3 = [(TFFeedbackDataContainer *)self includedGroupIdentifiers];
  if (!v3)
  {
    v4 = +[TFLogConfiguration defaultConfiguration];
    id v5 = [v4 generatedLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v131 = (id)objc_opt_class();
      id v6 = v131;
      _os_log_impl(&dword_223064000, v5, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property includedGroupIdentifiers", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = +[TFLogConfiguration defaultConfiguration];
    id v8 = [v7 generatedLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      id v11 = objc_opt_class();
      id v12 = v11;
      v13 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v131 = v9;
      __int16 v132 = 2114;
      v133 = v11;
      __int16 v134 = 2114;
      v135 = v13;
      id v14 = v13;
      _os_log_impl(&dword_223064000, v8, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property includedGroupIdentifiers", buf, 0x20u);
    }
  }
  v15 = +[TFLogConfiguration defaultConfiguration];
  id v16 = [v15 generatedLogger];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v131 = v17;
    id v18 = v17;
    _os_log_impl(&dword_223064000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property includedGroupIdentifiers", buf, 0xCu);
  }
  v129 = [v3 description];

  uint64_t v19 = [(TFFeedbackDataContainer *)self loadingEntryIdentifiers];
  if (!v19)
  {
    v20 = +[TFLogConfiguration defaultConfiguration];
    id v21 = [v20 generatedLogger];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v131 = v22;
      id v23 = v22;
      _os_log_impl(&dword_223064000, v21, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property loadingEntryIdentifiers", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = +[TFLogConfiguration defaultConfiguration];
    v25 = [v24 generatedLogger];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = objc_opt_class();
      id v27 = v26;
      id v28 = objc_opt_class();
      id v29 = v28;
      id v30 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v131 = v26;
      __int16 v132 = 2114;
      v133 = v28;
      __int16 v134 = 2114;
      v135 = v30;
      id v31 = v30;
      _os_log_impl(&dword_223064000, v25, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property loadingEntryIdentifiers", buf, 0x20u);
    }
  }
  objc_super v32 = +[TFLogConfiguration defaultConfiguration];
  v33 = [v32 generatedLogger];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v131 = v34;
    id v35 = v34;
    _os_log_impl(&dword_223064000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property loadingEntryIdentifiers", buf, 0xCu);
  }
  v128 = [v19 description];

  v36 = [(TFFeedbackDataContainer *)self stringEntryMap];
  if (!v36)
  {
    v37 = +[TFLogConfiguration defaultConfiguration];
    v38 = [v37 generatedLogger];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v131 = v39;
      id v40 = v39;
      _os_log_impl(&dword_223064000, v38, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property stringEntryMap", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = +[TFLogConfiguration defaultConfiguration];
    v42 = [v41 generatedLogger];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = objc_opt_class();
      id v44 = v43;
      v45 = objc_opt_class();
      id v46 = v45;
      v47 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v131 = v43;
      __int16 v132 = 2114;
      v133 = v45;
      __int16 v134 = 2114;
      v135 = v47;
      id v48 = v47;
      _os_log_impl(&dword_223064000, v42, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property stringEntryMap", buf, 0x20u);
    }
  }
  v49 = +[TFLogConfiguration defaultConfiguration];
  v50 = [v49 generatedLogger];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v131 = v51;
    id v52 = v51;
    _os_log_impl(&dword_223064000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property stringEntryMap", buf, 0xCu);
  }
  v127 = [v36 description];

  v53 = [(TFFeedbackDataContainer *)self numberEntryMap];
  if (!v53)
  {
    v54 = +[TFLogConfiguration defaultConfiguration];
    v55 = [v54 generatedLogger];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      v56 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v131 = v56;
      id v57 = v56;
      _os_log_impl(&dword_223064000, v55, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property numberEntryMap", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v58 = +[TFLogConfiguration defaultConfiguration];
    v59 = [v58 generatedLogger];
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v60 = objc_opt_class();
      id v61 = v60;
      v62 = objc_opt_class();
      id v63 = v62;
      v64 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v131 = v60;
      __int16 v132 = 2114;
      v133 = v62;
      __int16 v134 = 2114;
      v135 = v64;
      id v65 = v64;
      _os_log_impl(&dword_223064000, v59, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property numberEntryMap", buf, 0x20u);
    }
  }
  v66 = +[TFLogConfiguration defaultConfiguration];
  v67 = [v66 generatedLogger];
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v131 = v68;
    id v69 = v68;
    _os_log_impl(&dword_223064000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property numberEntryMap", buf, 0xCu);
  }
  v126 = [v53 description];

  v70 = [(TFFeedbackDataContainer *)self imageCollectionEntryMap];
  if (!v70)
  {
    v71 = +[TFLogConfiguration defaultConfiguration];
    v72 = [v71 generatedLogger];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    {
      v73 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v131 = v73;
      id v74 = v73;
      _os_log_impl(&dword_223064000, v72, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property imageCollectionEntryMap", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v75 = +[TFLogConfiguration defaultConfiguration];
    v76 = [v75 generatedLogger];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v77 = objc_opt_class();
      id v78 = v77;
      v79 = objc_opt_class();
      id v80 = v79;
      v81 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v131 = v77;
      __int16 v132 = 2114;
      v133 = v79;
      __int16 v134 = 2114;
      v135 = v81;
      id v82 = v81;
      _os_log_impl(&dword_223064000, v76, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property imageCollectionEntryMap", buf, 0x20u);
    }
  }
  v83 = +[TFLogConfiguration defaultConfiguration];
  v84 = [v83 generatedLogger];
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    v85 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v131 = v85;
    id v86 = v85;
    _os_log_impl(&dword_223064000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property imageCollectionEntryMap", buf, 0xCu);
  }
  v125 = [v70 description];

  v87 = [(TFFeedbackDataContainer *)self dirtyGroupIdentifiers];
  if (!v87)
  {
    v88 = +[TFLogConfiguration defaultConfiguration];
    v89 = [v88 generatedLogger];
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      v90 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v131 = v90;
      id v91 = v90;
      _os_log_impl(&dword_223064000, v89, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property dirtyGroupIdentifiers", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v92 = +[TFLogConfiguration defaultConfiguration];
    v93 = [v92 generatedLogger];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = objc_opt_class();
      id v95 = v94;
      v96 = objc_opt_class();
      id v97 = v96;
      v98 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v131 = v94;
      __int16 v132 = 2114;
      v133 = v96;
      __int16 v134 = 2114;
      v135 = v98;
      id v99 = v98;
      _os_log_impl(&dword_223064000, v93, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property dirtyGroupIdentifiers", buf, 0x20u);
    }
  }
  v100 = +[TFLogConfiguration defaultConfiguration];
  v101 = [v100 generatedLogger];
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
  {
    v102 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v131 = v102;
    id v103 = v102;
    _os_log_impl(&dword_223064000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property dirtyGroupIdentifiers", buf, 0xCu);
  }
  v104 = [v87 description];

  v105 = [(TFFeedbackDataContainer *)self dirtyEntryIdentifiers];
  if (!v105)
  {
    v106 = +[TFLogConfiguration defaultConfiguration];
    v107 = [v106 generatedLogger];
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      v108 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v131 = v108;
      id v109 = v108;
      _os_log_impl(&dword_223064000, v107, OS_LOG_TYPE_ERROR, "%{public}@: unexpected nil instance of property dirtyEntryIdentifiers", buf, 0xCu);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v110 = +[TFLogConfiguration defaultConfiguration];
    v111 = [v110 generatedLogger];
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      v112 = objc_opt_class();
      id v113 = v112;
      v114 = objc_opt_class();
      id v115 = v114;
      v116 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      id v131 = v112;
      __int16 v132 = 2114;
      v133 = v114;
      __int16 v134 = 2114;
      v135 = v116;
      id v117 = v116;
      _os_log_impl(&dword_223064000, v111, OS_LOG_TYPE_ERROR, "%{public}@: unexpected type of type %{public}@ (expected %{public}@) for property dirtyEntryIdentifiers", buf, 0x20u);
    }
  }
  v118 = +[TFLogConfiguration defaultConfiguration];
  v119 = [v118 generatedLogger];
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
  {
    v120 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v131 = v120;
    id v121 = v120;
    _os_log_impl(&dword_223064000, v119, OS_LOG_TYPE_DEFAULT, "%{public}@: fetching description of property dirtyEntryIdentifiers", buf, 0xCu);
  }
  v122 = [v105 description];

  v123 = [NSString stringWithFormat:@"includedGroupIdentifiers: %@\nloadingEntryIdentifiers: %@\nstringEntryMap: %@\nnumberEntryMap: %@\nimageCollectionEntryMap: %@\ndirtyGroupIdentifiers: %@\ndirtyEntryIdentifiers: %@\n", v129, v128, v127, v126, v125, v104, v122];

  return (NSString *)v123;
}

- (void)prepareInitialValuesForForm:(id)a3
{
  id v4 = a3;
  id v5 = [(TFFeedbackDataContainer *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__TFFeedbackDataContainer_prepareInitialValuesForForm___block_invoke;
  v7[3] = &unk_26468E890;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __55__TFFeedbackDataContainer_prepareInitialValuesForForm___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "entryGroups", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        BOOL v8 = ([v7 election] & 0xFFFFFFFFFFFFFFFDLL) == 0;
        id v9 = *(void **)(a1 + 40);
        id v10 = [v7 identifier];
        [v9 setGroupInclusionForIdentifier:v10 toValue:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (BOOL)isGroupWithIdentifierIncluded:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(TFFeedbackDataContainer *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__TFFeedbackDataContainer_isGroupWithIdentifierIncluded___block_invoke;
  block[3] = &unk_26468E908;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __57__TFFeedbackDataContainer_isGroupWithIdentifierIncluded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) includedGroupIdentifiers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (BOOL)isEntryWithIdentifierLoading:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(TFFeedbackDataContainer *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__TFFeedbackDataContainer_isEntryWithIdentifierLoading___block_invoke;
  block[3] = &unk_26468E908;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__TFFeedbackDataContainer_isEntryWithIdentifierLoading___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadingEntryIdentifiers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (id)stringForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = [(TFFeedbackDataContainer *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TFFeedbackDataContainer_stringForIdentifier___block_invoke;
  block[3] = &unk_26468E908;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__TFFeedbackDataContainer_stringForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stringEntryMap];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)numberForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(TFFeedbackDataContainer *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__TFFeedbackDataContainer_numberForIdentifier___block_invoke;
  block[3] = &unk_26468E908;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__TFFeedbackDataContainer_numberForIdentifier___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) numberEntryMap];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)imageCollectionForIdentifer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  id v5 = [(TFFeedbackDataContainer *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__TFFeedbackDataContainer_imageCollectionForIdentifer___block_invoke;
  block[3] = &unk_26468E908;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__TFFeedbackDataContainer_imageCollectionForIdentifer___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) imageCollectionEntryMap];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)isLoading
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(TFFeedbackDataContainer *)self accessQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__TFFeedbackDataContainer_isLoading__block_invoke;
  v5[3] = &unk_26468E930;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __36__TFFeedbackDataContainer_isLoading__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) loadingEntryIdentifiers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

- (void)performBatchUpdates:(id)a3
{
}

- (void)performBatchUpdates:(id)a3 suppressingNotifications:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(TFFeedbackDataContainer *)self accessQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__TFFeedbackDataContainer_performBatchUpdates_suppressingNotifications___block_invoke;
  block[3] = &unk_26468E958;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);
}

void __72__TFFeedbackDataContainer_performBatchUpdates_suppressingNotifications___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _clearDirtyIdentifiers];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = +[TFLogConfiguration defaultConfiguration];
  uint64_t v3 = [v2 generatedLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = objc_opt_class();
    id v5 = *(void **)(a1 + 32);
    id v6 = v4;
    id v7 = [v5 name];
    id v8 = [*(id *)(a1 + 32) debugDescription];
    int v9 = 138543874;
    id v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_223064000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: [%@] performBatchUpdates did update:\n%@", (uint8_t *)&v9, 0x20u);
  }
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _notifyObserverOfUpdates];
  }
}

- (void)setGroupInclusionForIdentifier:(id)a3 toValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    id v7 = [(TFFeedbackDataContainer *)self includedGroupIdentifiers];
    id v8 = v7;
    if (v4) {
      [v7 addObject:v9];
    }
    else {
      [v7 removeObject:v9];
    }

    [(TFFeedbackDataContainer *)self _markGroupIdentifierDirty:v9];
    id v6 = v9;
  }
}

- (void)setEntryLoadingForIdentifier:(id)a3 toValue:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v9 = v6;
    id v7 = [(TFFeedbackDataContainer *)self loadingEntryIdentifiers];
    id v8 = v7;
    if (v4) {
      [v7 addObject:v9];
    }
    else {
      [v7 removeObject:v9];
    }

    [(TFFeedbackDataContainer *)self _markEntryIdentifierDirty:v9];
    id v6 = v9;
  }
}

- (void)setStringForIdentifier:(id)a3 toValue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    if (v6)
    {
      id v7 = (void *)[v6 copy];
      id v8 = [(TFFeedbackDataContainer *)self stringEntryMap];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
    else
    {
      id v7 = [(TFFeedbackDataContainer *)self stringEntryMap];
      [v7 removeObjectForKey:v9];
    }

    [(TFFeedbackDataContainer *)self _markEntryIdentifierDirty:v9];
  }
}

- (void)setNumberForIdentifier:(id)a3 toValue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    if (v6)
    {
      id v7 = (void *)[v6 copy];
      id v8 = [(TFFeedbackDataContainer *)self numberEntryMap];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
    else
    {
      id v7 = [(TFFeedbackDataContainer *)self numberEntryMap];
      [v7 removeObjectForKey:v9];
    }

    [(TFFeedbackDataContainer *)self _markEntryIdentifierDirty:v9];
  }
}

- (void)setImageCollectionForIdentifier:(id)a3 toValue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    if (v6)
    {
      id v7 = (void *)[v6 copy];
      id v8 = [(TFFeedbackDataContainer *)self imageCollectionEntryMap];
      [v8 setObject:v7 forKeyedSubscript:v9];
    }
    else
    {
      id v7 = [(TFFeedbackDataContainer *)self imageCollectionEntryMap];
      [v7 removeObjectForKey:v9];
    }

    [(TFFeedbackDataContainer *)self _markEntryIdentifierDirty:v9];
  }
}

- (void)overwriteWithContentsOfDataContainer:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [v4 stringEntryMap];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v12 = [v4 stringForIdentifier:v11];
        [(TFFeedbackDataContainer *)self setStringForIdentifier:v11 toValue:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v8);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  __int16 v13 = [v4 numberEntryMap];
  uint64_t v14 = [v13 allKeys];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * j);
        v20 = [v4 numberForIdentifier:v19];
        [(TFFeedbackDataContainer *)self setNumberForIdentifier:v19 toValue:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v16);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = objc_msgSend(v4, "imageCollectionEntryMap", 0);
  v22 = [v21 allKeys];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v29 + 1) + 8 * k);
        id v28 = [v4 imageCollectionForIdentifer:v27];
        [(TFFeedbackDataContainer *)self setImageCollectionForIdentifier:v27 toValue:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v24);
  }
}

- (void)_markGroupIdentifierDirty:(id)a3
{
  id v7 = a3;
  id v4 = [(TFFeedbackDataContainer *)self dirtyGroupIdentifiers];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    id v6 = [(TFFeedbackDataContainer *)self dirtyGroupIdentifiers];
    [v6 addObject:v7];
  }
}

- (void)_markEntryIdentifierDirty:(id)a3
{
  id v7 = a3;
  id v4 = [(TFFeedbackDataContainer *)self dirtyEntryIdentifiers];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    id v6 = [(TFFeedbackDataContainer *)self dirtyEntryIdentifiers];
    [v6 addObject:v7];
  }
}

- (void)_clearDirtyIdentifiers
{
  uint64_t v3 = [(TFFeedbackDataContainer *)self dirtyGroupIdentifiers];
  [v3 removeAllObjects];

  id v4 = [(TFFeedbackDataContainer *)self dirtyEntryIdentifiers];
  [v4 removeAllObjects];
}

- (void)_notifyObserverOfUpdates
{
  uint64_t v3 = [(TFFeedbackDataContainer *)self dirtyGroupIdentifiers];
  id v4 = (void *)[v3 copy];

  char v5 = [(TFFeedbackDataContainer *)self dirtyEntryIdentifiers];
  id v6 = (void *)[v5 copy];

  [(TFFeedbackDataContainer *)self _clearDirtyIdentifiers];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__TFFeedbackDataContainer__notifyObserverOfUpdates__block_invoke;
  block[3] = &unk_26468E980;
  block[4] = self;
  id v10 = v4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__TFFeedbackDataContainer__notifyObserverOfUpdates__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 feedbackDataContainer:*(void *)(a1 + 32) didUpdateValuesForGroupIdentifiers:*(void *)(a1 + 40) entryIdentifiers:*(void *)(a1 + 48)];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  id v4 = [(TFFeedbackDataContainer *)self accessQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__TFFeedbackDataContainer_copyWithZone___block_invoke;
  v7[3] = &unk_26468E930;
  void v7[4] = self;
  v7[5] = &v8;
  dispatch_barrier_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __40__TFFeedbackDataContainer_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v14 = [TFFeedbackDataContainer alloc];
  id v20 = [*(id *)(a1 + 32) name];
  id v18 = [*(id *)(a1 + 32) includedGroupIdentifiers];
  uint64_t v19 = (void *)[v18 mutableCopy];
  uint64_t v17 = [*(id *)(a1 + 32) loadingEntryIdentifiers];
  id v2 = (void *)[v17 mutableCopy];
  uint64_t v16 = [*(id *)(a1 + 32) stringEntryMap];
  uint64_t v3 = (void *)[v16 mutableCopy];
  uint64_t v15 = [*(id *)(a1 + 32) numberEntryMap];
  id v4 = (void *)[v15 mutableCopy];
  id v5 = [*(id *)(a1 + 32) imageCollectionEntryMap];
  id v6 = (void *)[v5 mutableCopy];
  id v7 = [*(id *)(a1 + 32) dirtyGroupIdentifiers];
  uint64_t v8 = (void *)[v7 mutableCopy];
  uint64_t v9 = [*(id *)(a1 + 32) dirtyEntryIdentifiers];
  uint64_t v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = [(TFFeedbackDataContainer *)v14 initWithName:v20 includedGroupIdentifiers:v19 loadingEntryIdentifiers:v2 stringEntryMap:v3 numberEntryMap:v4 imageCollectionEntryMap:v6 dirtyGroupIdentifiers:v8 dirtyEntryIdentifiers:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

- (TFFeedbackDataContainerObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (TFFeedbackDataContainerObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSMutableSet)includedGroupIdentifiers
{
  return self->_includedGroupIdentifiers;
}

- (NSMutableSet)loadingEntryIdentifiers
{
  return self->_loadingEntryIdentifiers;
}

- (NSMutableDictionary)stringEntryMap
{
  return self->_stringEntryMap;
}

- (NSMutableDictionary)numberEntryMap
{
  return self->_numberEntryMap;
}

- (NSMutableDictionary)imageCollectionEntryMap
{
  return self->_imageCollectionEntryMap;
}

- (NSMutableArray)dirtyGroupIdentifiers
{
  return self->_dirtyGroupIdentifiers;
}

- (NSMutableArray)dirtyEntryIdentifiers
{
  return self->_dirtyEntryIdentifiers;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_dirtyEntryIdentifiers, 0);
  objc_storeStrong((id *)&self->_dirtyGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageCollectionEntryMap, 0);
  objc_storeStrong((id *)&self->_numberEntryMap, 0);
  objc_storeStrong((id *)&self->_stringEntryMap, 0);
  objc_storeStrong((id *)&self->_loadingEntryIdentifiers, 0);
  objc_storeStrong((id *)&self->_includedGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_observer);
}

- (id)objectForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TFFeedbackDataContainer *)self stringForIdentifier:v4];
  if (!v5)
  {
    id v5 = [(TFFeedbackDataContainer *)self numberForIdentifier:v4];
    if (!v5)
    {
      id v5 = [(TFFeedbackDataContainer *)self imageCollectionForIdentifer:v4];
    }
  }

  return v5;
}

@end