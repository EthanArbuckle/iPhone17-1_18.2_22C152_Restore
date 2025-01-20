@interface PPLabelMatcher
+ (id)sharedInstance;
- (PPLabelMatcher)init;
- (id)_generateMap;
- (unint64_t)matchFromLabel:(id)a3 toLabel:(id)a4;
@end

@implementation PPLabelMatcher

- (void).cxx_destruct
{
}

- (id)_generateMap
{
  v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:14];
  v3 = (void *)MEMORY[0x1CB79D060]();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v74 = *MEMORY[0x1E4F1B6F0];
  uint64_t v5 = *MEMORY[0x1E4F1B700];
  uint64_t v6 = *MEMORY[0x1E4F1B720];
  uint64_t v76 = *MEMORY[0x1E4F1B758];
  uint64_t v75 = *MEMORY[0x1E4F1B728];
  v7 = objc_msgSend(v4, "initWithObjects:", *MEMORY[0x1E4F1B700], *MEMORY[0x1E4F1B720], *MEMORY[0x1E4F1B758], *MEMORY[0x1E4F1B728], 0);
  v8 = (void *)MEMORY[0x1CB79D060]();
  id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v10 = *MEMORY[0x1E4F1B6F8];
  v11 = objc_msgSend(v9, "initWithObjects:", *MEMORY[0x1E4F1B6F8], 0);
  v12 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:v7 strongSet:v11];
  [v2 setObject:v12 forKeyedSubscript:v10];

  v13 = (void *)MEMORY[0x1CB79D060]();
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, 0);
  v15 = (void *)MEMORY[0x1CB79D060]();
  id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = *MEMORY[0x1E4F1B770];
  v18 = objc_msgSend(v16, "initWithObjects:", *MEMORY[0x1E4F1B770], v6, 0);
  v19 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:v14 strongSet:v18];
  [v2 setObject:v19 forKeyedSubscript:v17];

  v20 = (void *)MEMORY[0x1CB79D060]();
  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v10, v17, v6, 0);
  v22 = (void *)MEMORY[0x1CB79D060]();
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, 0);
  v24 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:v21 strongSet:v23];
  [v2 setObject:v24 forKeyedSubscript:v5];

  v25 = (void *)MEMORY[0x1CB79D060]();
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v10, v5, 0);
  v27 = (void *)MEMORY[0x1CB79D060]();
  v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v74, 0);
  v29 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:v26 strongSet:v28];
  [v2 setObject:v29 forKeyedSubscript:v74];

  v30 = (void *)MEMORY[0x1CB79D060]();
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, 0);
  v32 = (void *)MEMORY[0x1CB79D060]();
  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, v17, 0);
  v34 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:v31 strongSet:v33];
  [v2 setObject:v34 forKeyedSubscript:v6];

  v35 = (void *)MEMORY[0x1CB79D060]();
  id v36 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v37 = *MEMORY[0x1E4F1B738];
  v38 = objc_msgSend(v36, "initWithObjects:", *MEMORY[0x1E4F1B738], 0);
  v39 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:0 strongSet:v38];
  [v2 setObject:v39 forKeyedSubscript:v37];

  v40 = (void *)MEMORY[0x1CB79D060]();
  v41 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v10, v5, v6, 0);
  v42 = (void *)MEMORY[0x1CB79D060]();
  v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v76, v75, 0);
  v44 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:v41 strongSet:v43];
  [v2 setObject:v44 forKeyedSubscript:v76];

  v45 = (void *)MEMORY[0x1CB79D060]();
  v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v10, v5, v6, 0);
  v47 = (void *)MEMORY[0x1CB79D060]();
  v48 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v76, v75, 0);
  v49 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:v46 strongSet:v48];
  [v2 setObject:v49 forKeyedSubscript:v75];

  v50 = (void *)MEMORY[0x1CB79D060]();
  id v51 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v52 = *MEMORY[0x1E4F1B710];
  uint64_t v53 = *MEMORY[0x1E4F1B730];
  uint64_t v54 = *MEMORY[0x1E4F1B750];
  v55 = objc_msgSend(v51, "initWithObjects:", *MEMORY[0x1E4F1B710], *MEMORY[0x1E4F1B730], *MEMORY[0x1E4F1B750], 0);
  v56 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:0 strongSet:v55];
  [v2 setObject:v56 forKeyedSubscript:v52];

  v57 = (void *)MEMORY[0x1CB79D060]();
  v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v52, v53, v54, 0);
  v59 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:0 strongSet:v58];
  [v2 setObject:v59 forKeyedSubscript:v54];

  v60 = (void *)MEMORY[0x1CB79D060]();
  v61 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v52, v53, v54, 0);
  v62 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:0 strongSet:v61];
  [v2 setObject:v62 forKeyedSubscript:v53];

  v63 = (void *)MEMORY[0x1CB79D060]();
  id v64 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v65 = *MEMORY[0x1E4F1B768];
  v66 = objc_msgSend(v64, "initWithObjects:", *MEMORY[0x1E4F1B768], 0);
  v67 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:0 strongSet:v66];
  [v2 setObject:v67 forKeyedSubscript:v65];

  v68 = (void *)MEMORY[0x1CB79D060]();
  id v69 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v70 = *MEMORY[0x1E4F1B6E8];
  v71 = objc_msgSend(v69, "initWithObjects:", *MEMORY[0x1E4F1B6E8], 0);
  v72 = +[PPLabelStrengthSets labelStrengthSetsWithWeakSet:0 strongSet:v71];
  [v2 setObject:v72 forKeyedSubscript:v70];

  return v2;
}

- (unint64_t)matchFromLabel:(id)a3 toLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  unint64_t v9 = 1;
  if (v6 && v7)
  {
    uint64_t v10 = [(NSDictionary *)self->_map objectForKeyedSubscript:v7];

    if (v10)
    {
      v11 = [(NSDictionary *)self->_map objectForKeyedSubscript:v6];
      v12 = [v11 strong];
      char v13 = [v12 containsObject:v8];

      if (v13)
      {
        unint64_t v9 = 2;
      }
      else
      {
        v14 = [(NSDictionary *)self->_map objectForKeyedSubscript:v6];
        v15 = [v14 weak];
        unsigned int v16 = [v15 containsObject:v8];

        unint64_t v9 = v16;
      }
    }
    else if ([v6 caseInsensitiveCompare:v8])
    {
      unint64_t v9 = 1;
    }
    else
    {
      unint64_t v9 = 2;
    }
  }

  return v9;
}

- (PPLabelMatcher)init
{
  v7.receiver = self;
  v7.super_class = (Class)PPLabelMatcher;
  v2 = [(PPLabelMatcher *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(PPLabelMatcher *)v2 _generateMap];
    map = v3->_map;
    v3->_map = (NSDictionary *)v4;
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_26243 != -1) {
    dispatch_once(&sharedInstance_once_26243, &__block_literal_global_26244);
  }
  v2 = (void *)sharedInstance_shared_26245;
  return v2;
}

uint64_t __32__PPLabelMatcher_sharedInstance__block_invoke()
{
  sharedInstance_shared_26245 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end