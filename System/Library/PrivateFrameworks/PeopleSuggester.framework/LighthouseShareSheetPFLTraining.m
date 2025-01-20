@interface LighthouseShareSheetPFLTraining
+ (id)processDataForStore:(id)a3 recipeInfo:(id)a4;
+ (id)processDataForStore:(id)a3 taskParameters:(id)a4;
+ (id)taskResultFromDict:(id)a3;
+ (void)initialize;
- (FidesPHSEvaluatorDataSource)dataSource;
- (NSDictionary)processDataReturnDict;
- (NSDictionary)selectedFeaturesConfig;
- (NSMutableArray)featureMatricesForAllShareEvents;
- (NSMutableDictionary)featureNameDict;
- (NSString)configBoltTaskIDSpecification;
- (NSString)configDepthSpecification;
- (NSString)configTreeSpecification;
- (_DKKnowledgeStore)knowledgeStore;
- (float)sigmoid:(float)a3;
- (id)createDataSourceForDodMLRecipe:(id)a3 error:(id *)a4;
- (id)createDataSourceForRecipe:(id)a3 error:(id *)a4;
- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3;
- (id)evaluateMetricsWithModelURL:(id)a3;
- (id)generateResultsDictionayWithModelURL:(id)a3 error:(id *)a4;
- (id)runTask:(id)a3 knowledgeStore:(id)a4 error:(id *)a5;
- (id)runWithRecipeInfo:(id)a3 knowledgeStore:(id)a4 error:(id *)a5;
- (void)processDataForMetricEvaluationForStore:(id)a3;
- (void)setConfigBoltTaskIDSpecification:(id)a3;
- (void)setConfigDepthSpecification:(id)a3;
- (void)setConfigTreeSpecification:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFeatureMatricesForAllShareEvents:(id)a3;
- (void)setFeatureNameDict:(id)a3;
- (void)setKnowledgeStore:(id)a3;
- (void)setProcessDataReturnDict:(id)a3;
- (void)setSelectedFeaturesConfig:(id)a3;
@end

@implementation LighthouseShareSheetPFLTraining

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sLog_2 = (uint64_t)os_log_create("com.apple.LighthouseShareSheetPFLPlugin", "Training");
    MEMORY[0x1F41817F8]();
  }
}

+ (id)taskResultFromDict:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v27 = (void *)[v26 mutableCopy];
  v3 = [v27 objectForKeyedSubscript:@"ModelDeltas"];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v48 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v3);
        }
        v5 += [*(id *)(*((void *)&v37 + 1) + 8 * i) count];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }
    while (v4);
    size_t v8 = 4 * v5;
  }
  else
  {
    size_t v8 = 0;
  }
  size_t v25 = v8;
  v9 = malloc_type_malloc(v8, 0x100004052888210uLL);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v3;
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v15 = v14;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v46 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v30;
          do
          {
            for (uint64_t k = 0; k != v16; ++k)
            {
              if (*(void *)v30 != v17) {
                objc_enumerationMutation(v15);
              }
              objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * k), "floatValue", v25);
              v9[v11 + k] = v19;
            }
            uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v46 count:16];
            v11 += k;
          }
          while (v16);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v47 count:16];
    }
    while (v10);
  }

  v20 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v9 length:v25];
  free(v9);
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2050000000;
  v21 = (void *)getMLRTaskResultClass_softClass;
  uint64_t v45 = getMLRTaskResultClass_softClass;
  if (!getMLRTaskResultClass_softClass)
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __getMLRTaskResultClass_block_invoke;
    v41[3] = &unk_1E5ADE858;
    v41[4] = &v42;
    __getMLRTaskResultClass_block_invoke((uint64_t)v41);
    v21 = (void *)v43[3];
  }
  v22 = v21;
  _Block_object_dispose(&v42, 8);
  v23 = (void *)[[v22 alloc] initWithJSONResult:v27 unprivatizedVector:v20];

  return v23;
}

+ (id)processDataForStore:(id)a3 taskParameters:(id)a4
{
  v127[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  p_vtable = &OBJC_METACLASS____PSConstants.vtable;
  size_t v8 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "In processData", buf, 2u);
  }
  v97 = objc_opt_new();
  v113 = objc_opt_new();
  v111 = objc_opt_new();
  v9 = objc_opt_new();
  v112 = objc_opt_new();
  LODWORD(v10) = -1.0;
  [v6 floatValueForKey:@"PositiveSampleWeight" defaultValue:v10];
  float v12 = v11;
  int v94 = [v6 BOOLValueForKey:@"BalanceSamplesByClass" defaultValue:0];
  uint64_t v95 = [v6 integerValueForKey:@"MaxSamples" defaultValue:0];
  v96 = v6;
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  id v98 = v5;
  uint64_t v104 = [v6 integerValueForKey:@"MaxSessions" defaultValue:0];
  do
  {
    v101 = (void *)MEMORY[0x1A6243860]();
    id v15 = objc_alloc_init((Class)get_DKEventQueryClass());
    uint64_t v16 = [get_DKEventStreamClass() eventStreamWithName:@"/sharesheet/behavioralRuleFeatures"];
    v127[0] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:1];
    [v15 setEventStreams:v17];

    v18 = v15;
    [v15 setLimit:20];
    unint64_t v100 = v14;
    [v15 setOffset:v14];
    id v122 = 0;
    v103 = [v5 executeQuery:v15 error:&v122];
    id v19 = v122;
    v20 = p_vtable[456];
    id v102 = v19;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v126 = v102;
        _os_log_error_impl(&dword_1A314B000, v20, OS_LOG_TYPE_ERROR, "knowledgeStore executeQuery failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      id v99 = v15;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = NSNumber;
        v22 = v20;
        v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v103, "count"));
        *(_DWORD *)buf = 138412290;
        id v126 = v23;
        _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "Fetched %@ number of events from CoreDuet store", buf, 0xCu);
      }
      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      id v24 = v103;
      uint64_t v109 = [v24 countByEnumeratingWithState:&v118 objects:v124 count:16];
      if (v109)
      {
        uint64_t v25 = *(void *)v119;
        uint64_t v105 = *(void *)v119;
        id v106 = v24;
        while (2)
        {
          for (uint64_t i = 0; i != v109; ++i)
          {
            if (*(void *)v119 != v25) {
              objc_enumerationMutation(v24);
            }
            v27 = *(void **)(*((void *)&v118 + 1) + 8 * i);
            if (v27)
            {
              uint64_t v110 = i;
              v28 = [v27 metadata];
              long long v29 = [v28 objectForKeyedSubscript:@"_DKBehavioralRuleFeaturesMetadataKey-featureDict"];

              if (v29 && [v29 count])
              {
                uint64_t v107 = v13;
                long long v30 = p_vtable[456];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  long long v31 = NSNumber;
                  long long v32 = v30;
                  long long v33 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
                  *(_DWORD *)buf = 138412290;
                  id v126 = v33;
                  _os_log_impl(&dword_1A314B000, v32, OS_LOG_TYPE_INFO, "Number of rows in event: %@", buf, 0xCu);
                }
                if ([v29 count])
                {
                  unint64_t v34 = 0;
                  do
                  {
                    long long v35 = v9;
                    long long v36 = objc_opt_new();
                    long long v114 = 0u;
                    long long v115 = 0u;
                    long long v116 = 0u;
                    long long v117 = 0u;
                    uint64_t v37 = [&unk_1EF6765C0 countByEnumeratingWithState:&v114 objects:v123 count:16];
                    if (v37)
                    {
                      uint64_t v38 = v37;
                      uint64_t v39 = *(void *)v115;
                      do
                      {
                        for (uint64_t j = 0; j != v38; ++j)
                        {
                          if (*(void *)v115 != v39) {
                            objc_enumerationMutation(&unk_1EF6765C0);
                          }
                          uint64_t v41 = *(void *)(*((void *)&v114 + 1) + 8 * j);
                          uint64_t v42 = [v29 objectAtIndexedSubscript:v34];
                          v43 = [v42 objectForKeyedSubscript:v41];
                          [v36 addObject:v43];
                        }
                        uint64_t v38 = [&unk_1EF6765C0 countByEnumeratingWithState:&v114 objects:v123 count:16];
                      }
                      while (v38);
                    }
                    uint64_t v44 = [v29 objectAtIndexedSubscript:v34];
                    uint64_t v45 = [v44 objectForKeyedSubscript:@"personAndAppMatched"];

                    int v46 = [v45 intValue];
                    BOOL v47 = v46 == 1;
                    v9 = v35;
                    if (v46 == 1) {
                      v48 = v113;
                    }
                    else {
                      v48 = v35;
                    }
                    if (v47) {
                      uint64_t v49 = v111;
                    }
                    else {
                      uint64_t v49 = v112;
                    }
                    [v48 addObject:v36];
                    [v49 addObject:v45];

                    ++v34;
                  }
                  while ([v29 count] > v34);
                }
                uint64_t v13 = v107 + 1;
                if (v104 < 1)
                {
                  p_vtable = (void **)(&OBJC_METACLASS____PSConstants + 24);
                  uint64_t v25 = v105;
                  id v24 = v106;
                }
                else
                {
                  uint64_t v25 = v105;
                  id v24 = v106;
                  if (v13 >= v104)
                  {

                    p_vtable = &OBJC_METACLASS____PSConstants.vtable;
                    goto LABEL_48;
                  }
                  p_vtable = (void **)(&OBJC_METACLASS____PSConstants + 24);
                }
              }
              else
              {
                v50 = p_vtable[456];
                if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A314B000, v50, OS_LOG_TYPE_INFO, "Received an event with a nil or empty feature dictionary...", buf, 2u);
                }
              }

              uint64_t i = v110;
            }
            else
            {
              v51 = p_vtable[456];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A314B000, v51, OS_LOG_TYPE_INFO, "Received a nil event...", buf, 2u);
              }
            }
          }
          uint64_t v109 = [v24 countByEnumeratingWithState:&v118 objects:v124 count:16];
          if (v109) {
            continue;
          }
          break;
        }
      }
LABEL_48:

      id v5 = v98;
      v18 = v99;
    }

    if (v102) {
      goto LABEL_78;
    }
    unint64_t v14 = v100 + 20;
  }
  while (v100 <= 0x4F);
  unint64_t v52 = [v113 count];
  unint64_t v53 = [v9 count];
  uint64_t v54 = [v113 count];
  uint64_t v55 = [v9 count];
  if (v12 == -1.0 || v95 == 1) {
    int v57 = 1;
  }
  else {
    int v57 = v94;
  }
  if (v57 == 1)
  {
    if (!v52 || !v53)
    {
      v64 = p_vtable[456];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v64, OS_LOG_TYPE_INFO, "Returning nil from processDataForStore because no positive or negative samples were found, and we need to balance classes, compute weights, or randomly select one of two classes, which will fail.", buf, 2u);
      }
LABEL_78:
      id v65 = 0;
      v66 = v111;
      v67 = v112;
      v68 = v9;
      v69 = v113;
      v70 = v97;
      goto LABEL_108;
    }
    if (v95 == 1)
    {
      uint64_t v108 = v13;
      double v58 = (double)arc4random() / 4294967300.0;
      unint64_t v59 = v58 >= 0.5;
      unint64_t v60 = v58 < 0.5;
LABEL_73:
      unint64_t v63 = 0x1E4F28000;
      goto LABEL_88;
    }
  }
  uint64_t v108 = v13;
  if (v95 > 0) {
    int v61 = v94;
  }
  else {
    int v61 = 0;
  }
  if (v61 == 1)
  {
    if (v53 >= v52) {
      unint64_t v62 = v52;
    }
    else {
      unint64_t v62 = v53;
    }
    if ((unint64_t)v95 >> 1 >= v62) {
      unint64_t v60 = v62;
    }
    else {
      unint64_t v60 = (unint64_t)v95 >> 1;
    }
    unint64_t v59 = v60;
    goto LABEL_73;
  }
  unint64_t v63 = 0x1E4F28000uLL;
  if (v95 < 1)
  {
    if (v52 >= v53) {
      unint64_t v71 = v53;
    }
    else {
      unint64_t v71 = v52;
    }
    if (v94) {
      unint64_t v60 = v71;
    }
    else {
      unint64_t v60 = v55;
    }
    if (v94) {
      unint64_t v59 = v71;
    }
    else {
      unint64_t v59 = v54;
    }
  }
  else
  {
    unint64_t v59 = (int)(float)((float)((float)v52 / (float)(v53 + v52)) * (float)v95);
    unint64_t v60 = v95 - v59;
  }
LABEL_88:
  v69 = v113;
  if ([v113 count] <= v59)
  {
    v66 = v111;
  }
  else
  {
    v69 = objc_opt_new();
    v66 = objc_opt_new();
    v72 = objc_opt_new();
    while ([v69 count] < v59)
    {
      v73 = objc_msgSend(*(id *)(v63 + 3792), "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v113, "count")));
      if (([v72 containsObject:v73] & 1) == 0)
      {
        [v72 addObject:v73];
        v74 = objc_msgSend(v113, "objectAtIndex:", (int)objc_msgSend(v73, "intValue"));
        [v69 addObject:v74];

        v75 = objc_msgSend(v111, "objectAtIndex:", (int)objc_msgSend(v73, "intValue"));
        [v66 addObject:v75];
      }
    }
  }
  v68 = v9;
  if ([v9 count] <= v60)
  {
    v67 = v112;
  }
  else
  {
    v68 = objc_opt_new();
    v67 = objc_opt_new();
    for (uint64_t k = objc_opt_new(); [v68 count] < v60; v63 = 0x1E4F28000)
    {
      v77 = objc_msgSend(*(id *)(v63 + 3792), "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v9, "count")));
      if (([k containsObject:v77] & 1) == 0)
      {
        [k addObject:v77];
        v78 = objc_msgSend(v9, "objectAtIndex:", (int)objc_msgSend(v77, "intValue"));
        [v68 addObject:v78];

        v79 = objc_msgSend(v112, "objectAtIndex:", (int)objc_msgSend(v77, "intValue"));
        [v67 addObject:v79];
      }
    }
  }
  if (v12 == -1.0)
  {
    float v80 = (float)(unint64_t)[v68 count];
    float v12 = v80 / (float)(unint64_t)[v69 count];
  }
  v81 = objc_opt_new();
  v82 = objc_opt_new();
  [v81 addObjectsFromArray:v69];
  [v81 addObjectsFromArray:v68];
  [v82 addObjectsFromArray:v66];
  [v82 addObjectsFromArray:v67];
  [v97 setObject:v81 forKeyedSubscript:@"inputVectors"];
  [v97 setObject:v82 forKeyedSubscript:@"targetVector"];
  v83 = [NSNumber numberWithInt:v108];
  [v97 setObject:v83 forKeyedSubscript:@"NumberTrainingSessions"];

  v84 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v81, "count"));
  [v97 setObject:v84 forKeyedSubscript:@"NumberTrainingRecords"];

  v85 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v68, "count"));
  [v97 setObject:v85 forKeyedSubscript:@"NumberTrainingRecordsClass0"];

  v86 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v69, "count"));
  [v97 setObject:v86 forKeyedSubscript:@"NumberTrainingRecordsClass1"];

  *(float *)&double v87 = v12;
  v88 = [NSNumber numberWithFloat:v87];
  [v97 setObject:v88 forKeyedSubscript:@"CalculatedPositiveSampleWeight"];

  v89 = p_vtable[456];
  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
  {
    v90 = NSNumber;
    v91 = v89;
    v92 = [v90 numberWithInteger:v108];
    *(_DWORD *)buf = 138412290;
    id v126 = v92;
    _os_log_impl(&dword_1A314B000, v91, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);
  }
  v70 = v97;
  id v65 = v97;

  id v5 = v98;
LABEL_108:

  return v65;
}

+ (id)processDataForStore:(id)a3 recipeInfo:(id)a4
{
  v133[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  p_vtable = &OBJC_METACLASS____PSConstants.vtable;
  size_t v8 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "In processData", buf, 2u);
  }
  v9 = objc_opt_new();
  long long v119 = objc_opt_new();
  long long v116 = objc_opt_new();
  uint64_t v10 = objc_opt_new();
  long long v117 = objc_opt_new();
  float v11 = [v6 objectForKey:@"PositiveSampleWeight"];
  if (v11)
  {
    id v102 = [v6 objectForKey:@"PositiveSampleWeight"];
  }
  else
  {
    id v102 = &unk_1EF6767F8;
  }

  float v12 = [v6 objectForKey:@"BalanceSamplesByClass"];
  if (v12)
  {
    v101 = [v6 objectForKey:@"BalanceSamplesByClass"];
  }
  else
  {
    v101 = (void *)MEMORY[0x1E4F1CC28];
  }

  uint64_t v13 = [v6 objectForKey:@"MaxSamples"];
  if (v13)
  {
    unint64_t v100 = [v6 objectForKey:@"MaxSamples"];
  }
  else
  {
    unint64_t v100 = &unk_1EF675C00;
  }
  long long v118 = (void *)v10;

  unint64_t v14 = [v6 objectForKey:@"MaxSessions"];
  id v99 = v6;
  if (v14)
  {
    id v15 = [v6 objectForKey:@"MaxSessions"];
  }
  else
  {
    id v15 = &unk_1EF675C00;
  }

  [v102 floatValue];
  float v17 = v16;
  int v96 = [v101 BOOLValue];
  int v97 = [v100 intValue];
  id v98 = v15;
  uint64_t v18 = 0;
  unint64_t v19 = 0;
  v103 = v5;
  uint64_t v109 = [v15 intValue];
  uint64_t v110 = v9;
  do
  {
    id v106 = (void *)MEMORY[0x1A6243860]();
    id v20 = objc_alloc_init((Class)get_DKEventQueryClass());
    v21 = [get_DKEventStreamClass() eventStreamWithName:@"/sharesheet/behavioralRuleFeatures"];
    v133[0] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:1];
    [v20 setEventStreams:v22];

    [v20 setLimit:20];
    unint64_t v105 = v19;
    [v20 setOffset:v19];
    id v128 = 0;
    uint64_t v108 = [v5 executeQuery:v20 error:&v128];
    id v23 = v128;
    id v24 = p_vtable[456];
    id v107 = v23;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v132 = v107;
        _os_log_error_impl(&dword_1A314B000, v24, OS_LOG_TYPE_ERROR, "knowledgeStore executeQuery failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      id v104 = v20;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = NSNumber;
        id v26 = v24;
        v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
        *(_DWORD *)buf = 138412290;
        id v132 = v27;
        _os_log_impl(&dword_1A314B000, v26, OS_LOG_TYPE_INFO, "Fetched %@ number of events from CoreDuet store", buf, 0xCu);
      }
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v28 = v108;
      uint64_t v115 = [v28 countByEnumeratingWithState:&v124 objects:v130 count:16];
      if (v115)
      {
        uint64_t v114 = *(void *)v125;
        id v111 = v28;
        do
        {
          for (uint64_t i = 0; i != v115; ++i)
          {
            if (*(void *)v125 != v114) {
              objc_enumerationMutation(v28);
            }
            long long v30 = *(void **)(*((void *)&v124 + 1) + 8 * i);
            if (v30)
            {
              long long v31 = [v30 metadata];
              long long v32 = [v31 objectForKeyedSubscript:@"_DKBehavioralRuleFeaturesMetadataKey-featureDict"];

              if (v32 && [v32 count])
              {
                uint64_t v112 = v18;
                long long v33 = p_vtable[456];
                if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                {
                  unint64_t v34 = NSNumber;
                  long long v35 = v33;
                  long long v36 = objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v32, "count"));
                  *(_DWORD *)buf = 138412290;
                  id v132 = v36;
                  _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_INFO, "Number of rows in event: %@", buf, 0xCu);
                }
                if ([v32 count])
                {
                  unint64_t v37 = 0;
                  do
                  {
                    uint64_t v38 = objc_opt_new();
                    long long v120 = 0u;
                    long long v121 = 0u;
                    long long v122 = 0u;
                    long long v123 = 0u;
                    uint64_t v39 = [&unk_1EF6765D8 countByEnumeratingWithState:&v120 objects:v129 count:16];
                    if (v39)
                    {
                      uint64_t v40 = v39;
                      uint64_t v41 = *(void *)v121;
                      do
                      {
                        for (uint64_t j = 0; j != v40; ++j)
                        {
                          if (*(void *)v121 != v41) {
                            objc_enumerationMutation(&unk_1EF6765D8);
                          }
                          uint64_t v43 = *(void *)(*((void *)&v120 + 1) + 8 * j);
                          uint64_t v44 = [v32 objectAtIndexedSubscript:v37];
                          uint64_t v45 = [v44 objectForKeyedSubscript:v43];
                          [v38 addObject:v45];
                        }
                        uint64_t v40 = [&unk_1EF6765D8 countByEnumeratingWithState:&v120 objects:v129 count:16];
                      }
                      while (v40);
                    }
                    int v46 = [v32 objectAtIndexedSubscript:v37];
                    BOOL v47 = [v46 objectForKeyedSubscript:@"personAndAppMatched"];

                    int v48 = [v47 intValue];
                    BOOL v49 = v48 == 1;
                    if (v48 == 1) {
                      v50 = v119;
                    }
                    else {
                      v50 = v118;
                    }
                    if (v49) {
                      v51 = v116;
                    }
                    else {
                      v51 = v117;
                    }
                    [v50 addObject:v38];
                    [v51 addObject:v47];

                    ++v37;
                  }
                  while ([v32 count] > v37);
                }
                uint64_t v18 = v112 + 1;
                if ((int)v109 < 1)
                {
                  v9 = v110;
                  id v28 = v111;
                }
                else
                {
                  v9 = v110;
                  id v28 = v111;
                  if (v18 >= v109)
                  {

                    p_vtable = &OBJC_METACLASS____PSConstants.vtable;
                    goto LABEL_59;
                  }
                }
                p_vtable = (void **)(&OBJC_METACLASS____PSConstants + 24);
              }
              else
              {
                unint64_t v52 = p_vtable[456];
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A314B000, v52, OS_LOG_TYPE_INFO, "Received an event with a nil or empty feature dictionary...", buf, 2u);
                }
              }
            }
            else
            {
              unint64_t v53 = p_vtable[456];
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A314B000, v53, OS_LOG_TYPE_INFO, "Received a nil event...", buf, 2u);
              }
            }
          }
          uint64_t v115 = [v28 countByEnumeratingWithState:&v124 objects:v130 count:16];
        }
        while (v115);
      }
LABEL_59:

      id v5 = v103;
      id v20 = v104;
    }

    if (v107) {
      goto LABEL_88;
    }
    unint64_t v19 = v105 + 20;
  }
  while (v105 <= 0x4F);
  unint64_t v54 = [v119 count];
  uint64_t v55 = v118;
  unint64_t v56 = [v118 count];
  uint64_t v57 = [v119 count];
  uint64_t v58 = [v118 count];
  if (v17 == -1.0 || v97 == 1) {
    int v60 = 1;
  }
  else {
    int v60 = v96;
  }
  if (v60 != 1) {
    goto LABEL_73;
  }
  if (!v54 || !v56)
  {
    v66 = p_vtable[456];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v66, OS_LOG_TYPE_INFO, "Returning nil from processDataForStore because no positive or negative samples were found, and we need to balance classes, compute weights, or randomly select one of two classes, which will fail.", buf, 2u);
    }
LABEL_88:
    id v67 = 0;
    v69 = v117;
    v68 = v118;
    v70 = v116;
    unint64_t v71 = v119;
    goto LABEL_118;
  }
  if (v97 == 1)
  {
    uint64_t v113 = v18;
    double v61 = (double)arc4random() / 4294967300.0;
    unint64_t v62 = v61 < 0.5;
    unint64_t v63 = v61 >= 0.5;
  }
  else
  {
LABEL_73:
    if (v97 > 0) {
      int v64 = v96;
    }
    else {
      int v64 = 0;
    }
    uint64_t v113 = v18;
    if (v64 == 1)
    {
      if (v56 >= v54) {
        unint64_t v65 = v54;
      }
      else {
        unint64_t v65 = v56;
      }
      if (v65 >= v97 >> 1) {
        unint64_t v63 = v97 >> 1;
      }
      else {
        unint64_t v63 = v65;
      }
      unint64_t v62 = v63;
    }
    else if (v97 < 1)
    {
      if (v54 >= v56) {
        unint64_t v72 = v56;
      }
      else {
        unint64_t v72 = v54;
      }
      if (v96) {
        unint64_t v63 = v72;
      }
      else {
        unint64_t v63 = v57;
      }
      if (v96) {
        unint64_t v62 = v72;
      }
      else {
        unint64_t v62 = v58;
      }
    }
    else
    {
      unint64_t v63 = (int)(float)((float)((float)v54 / (float)(v56 + v54)) * (float)v97);
      unint64_t v62 = v97 - v63;
    }
  }
  unint64_t v73 = 0x1E4F28000uLL;
  unint64_t v71 = v119;
  if ([v119 count] <= v63)
  {
    v70 = v116;
  }
  else
  {
    unint64_t v71 = objc_opt_new();
    v70 = objc_opt_new();
    v74 = objc_opt_new();
    while ([v71 count] < v63)
    {
      v75 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v119, "count")));
      if (([v74 containsObject:v75] & 1) == 0)
      {
        [v74 addObject:v75];
        v76 = objc_msgSend(v119, "objectAtIndex:", (int)objc_msgSend(v75, "intValue"));
        [v71 addObject:v76];

        v77 = objc_msgSend(v116, "objectAtIndex:", (int)objc_msgSend(v75, "intValue"));
        [v70 addObject:v77];
      }
    }

    uint64_t v55 = v118;
  }
  if ([v55 count] <= v62)
  {
    v68 = v55;
    v69 = v117;
  }
  else
  {
    v68 = objc_opt_new();
    v69 = objc_opt_new();
    for (uint64_t k = objc_opt_new(); [v68 count] < v62; v73 = 0x1E4F28000)
    {
      v79 = objc_msgSend(*(id *)(v73 + 3792), "numberWithUnsignedInt:", arc4random_uniform(objc_msgSend(v118, "count")));
      if (([k containsObject:v79] & 1) == 0)
      {
        [k addObject:v79];
        float v80 = objc_msgSend(v118, "objectAtIndex:", (int)objc_msgSend(v79, "intValue"));
        [v68 addObject:v80];

        v81 = objc_msgSend(v117, "objectAtIndex:", (int)objc_msgSend(v79, "intValue"));
        [v69 addObject:v81];
      }
    }
  }
  if (v17 == -1.0)
  {
    float v82 = (float)(unint64_t)[v68 count];
    float v17 = v82 / (float)(unint64_t)[v71 count];
  }
  v83 = objc_opt_new();
  v84 = objc_opt_new();
  [v83 addObjectsFromArray:v71];
  [v83 addObjectsFromArray:v68];
  [v84 addObjectsFromArray:v70];
  [v84 addObjectsFromArray:v69];
  [v9 setObject:v83 forKeyedSubscript:@"inputVectors"];
  [v9 setObject:v84 forKeyedSubscript:@"targetVector"];
  v85 = [NSNumber numberWithInt:v113];
  [v9 setObject:v85 forKeyedSubscript:@"NumberTrainingSessions"];

  v86 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v83, "count"));
  [v9 setObject:v86 forKeyedSubscript:@"NumberTrainingRecords"];

  double v87 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v68, "count"));
  [v9 setObject:v87 forKeyedSubscript:@"NumberTrainingRecordsClass0"];

  v88 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v71, "count"));
  [v9 setObject:v88 forKeyedSubscript:@"NumberTrainingRecordsClass1"];

  *(float *)&double v89 = v17;
  v90 = [NSNumber numberWithFloat:v89];
  [v9 setObject:v90 forKeyedSubscript:@"CalculatedPositiveSampleWeight"];

  v91 = (void *)sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    v92 = NSNumber;
    v93 = v91;
    int v94 = [v92 numberWithInteger:v113];
    *(_DWORD *)buf = 138412290;
    id v132 = v94;
    _os_log_impl(&dword_1A314B000, v93, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);
  }
  id v67 = v9;

LABEL_118:

  return v67;
}

- (id)runWithRecipeInfo:(id)a3 knowledgeStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(LighthouseShareSheetPFLTraining *)self setKnowledgeStore:v9];
  uint64_t v10 = [v8 objectForKeyedSubscript:@"Tree"];
  [(LighthouseShareSheetPFLTraining *)self setConfigTreeSpecification:v10];

  float v11 = [v8 objectForKeyedSubscript:@"Depth"];
  [(LighthouseShareSheetPFLTraining *)self setConfigDepthSpecification:v11];

  float v12 = [v8 objectForKeyedSubscript:@"BoltTaskID"];
  [(LighthouseShareSheetPFLTraining *)self setConfigBoltTaskIDSpecification:v12];

  uint64_t v13 = +[LighthouseShareSheetPFLTraining processDataForStore:v9 recipeInfo:v8];

  [(LighthouseShareSheetPFLTraining *)self setProcessDataReturnDict:v13];
  unint64_t v14 = [(LighthouseShareSheetPFLTraining *)self processDataReturnDict];

  if (v14)
  {
    id v15 = [@"/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/" stringByAppendingString:@"com.apple.PeopleSuggester.Config.SelectedFeatures.plist"];
    float v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v15];
    [(LighthouseShareSheetPFLTraining *)self setSelectedFeaturesConfig:v16];

    float v17 = [(LighthouseShareSheetPFLTraining *)self createDataSourceForRecipe:v8 error:a5];
    [(LighthouseShareSheetPFLTraining *)self setDataSource:v17];

    uint64_t v18 = [(LighthouseShareSheetPFLTraining *)self dataSource];
    if (!v18 || (id v19 = *a5, v18, v19))
    {
      id v20 = sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:]((uint64_t)a5, v20, v21, v22, v23, v24, v25, v26);
      }
      v27 = 0;
      goto LABEL_25;
    }
    id v28 = (void *)MEMORY[0x1E4F1CB10];
    long long v29 = [v8 objectForKey:@"ModelFileName"];
    long long v30 = [v28 URLWithString:v29];

    if (!v30)
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:]();
      }
      v27 = 0;
      goto LABEL_24;
    }
    long long v31 = NSTemporaryDirectory();
    long long v32 = [v30 absoluteString];
    long long v33 = [v32 lastPathComponent];
    unint64_t v34 = [v31 stringByAppendingPathComponent:v33];

    long long v35 = [MEMORY[0x1E4F28CB8] defaultManager];
    LODWORD(v33) = [v35 fileExistsAtPath:v34];

    if (v33
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          long long v36 = objc_claimAutoreleasedReturnValue(),
          [v36 removeItemAtPath:v34 error:a5],
          v36,
          *a5))
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.5();
      }
    }
    else
    {
      unint64_t v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v38 = [v30 absoluteString];
      [v37 copyItemAtPath:v38 toPath:v34 error:a5];

      if (!*a5)
      {
        uint64_t v39 = [MEMORY[0x1E4F1CB10] URLWithString:v34];
        v27 = [(LighthouseShareSheetPFLTraining *)self generateResultsDictionayWithModelURL:v39 error:a5];

        goto LABEL_23;
      }
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:].cold.4();
      }
    }
    v27 = (void *)MEMORY[0x1E4F1CC08];
LABEL_23:

LABEL_24:
LABEL_25:

    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
    -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:]();
  }
  v27 = 0;
LABEL_26:

  return v27;
}

- (id)runTask:(id)a3 knowledgeStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(LighthouseShareSheetPFLTraining *)self setKnowledgeStore:v9];
  uint64_t v10 = NSString;
  float v11 = [v8 parameters];
  float v12 = objc_msgSend(v10, "stringWithFormat:", @"%d", objc_msgSend(v11, "integerValueForKey:defaultValue:", @"Tree", -1));
  [(LighthouseShareSheetPFLTraining *)self setConfigTreeSpecification:v12];

  uint64_t v13 = NSString;
  unint64_t v14 = [v8 parameters];
  id v15 = objc_msgSend(v13, "stringWithFormat:", @"%d", objc_msgSend(v14, "integerValueForKey:defaultValue:", @"Depth", -1));
  [(LighthouseShareSheetPFLTraining *)self setConfigDepthSpecification:v15];

  float v16 = [v8 parameters];
  float v17 = [v16 stringValueForKey:@"BoltTaskID" defaultValue:@"nil"];
  [(LighthouseShareSheetPFLTraining *)self setConfigBoltTaskIDSpecification:v17];

  uint64_t v18 = [v8 parameters];
  id v19 = +[LighthouseShareSheetPFLTraining processDataForStore:v9 taskParameters:v18];

  [(LighthouseShareSheetPFLTraining *)self setProcessDataReturnDict:v19];
  id v20 = [(LighthouseShareSheetPFLTraining *)self processDataReturnDict];

  if (v20)
  {
    uint64_t v21 = [@"/System/Library/DistributedEvaluation/Plugins/PeopleSuggesterDESPlugin.desPlugin/" stringByAppendingString:@"com.apple.PeopleSuggester.Config.SelectedFeatures.plist"];
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v21];
    [(LighthouseShareSheetPFLTraining *)self setSelectedFeaturesConfig:v22];

    uint64_t v23 = [v8 parameters];
    uint64_t v24 = [(LighthouseShareSheetPFLTraining *)self createDataSourceForDodMLRecipe:v23 error:a5];
    [(LighthouseShareSheetPFLTraining *)self setDataSource:v24];

    uint64_t v25 = [(LighthouseShareSheetPFLTraining *)self dataSource];
    if (v25 && (id v26 = *a5, v25, !v26))
    {
      long long v35 = [v8 parameters];
      long long v36 = [v35 stringValueForKey:@"ModelFileName" defaultValue:0];

      if (v36)
      {
        unint64_t v37 = [v8 attachments];
        uint64_t v38 = [v37 attachmentURLsForBasename:v36];

        if ([v38 count] == 1)
        {
          uint64_t v39 = [v38 objectAtIndexedSubscript:0];
          unint64_t v34 = [(LighthouseShareSheetPFLTraining *)self generateResultsDictionayWithModelURL:v39 error:a5];
        }
        else
        {
          uint64_t v40 = (void *)sLog_2;
          if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
            -[LighthouseShareSheetPFLTraining runTask:knowledgeStore:error:].cold.4(v40, v38);
          }
          unint64_t v34 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
          -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:]();
        }
        unint64_t v34 = 0;
      }
    }
    else
    {
      v27 = sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        -[LighthouseShareSheetPFLTraining runWithRecipeInfo:knowledgeStore:error:]((uint64_t)a5, v27, v28, v29, v30, v31, v32, v33);
      }
      unint64_t v34 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
      -[LighthouseShareSheetPFLTraining runTask:knowledgeStore:error:]();
    }
    unint64_t v34 = 0;
  }

  return v34;
}

- (id)generateResultsDictionayWithModelURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  id v8 = [(LighthouseShareSheetPFLTraining *)self dataSource];
  id v9 = [(LighthouseShareSheetPFLTraining *)self processDataReturnDict];
  uint64_t v10 = [v7 evaluateWithModelURL:v6 dataSource:v8 processDataReturnDict:v9 error:a4];
  float v11 = (void *)[v10 mutableCopy];

  if (v11 && !*a4)
  {
    id v20 = [(LighthouseShareSheetPFLTraining *)self knowledgeStore];
    [(LighthouseShareSheetPFLTraining *)self processDataForMetricEvaluationForStore:v20];

    uint64_t v21 = [(LighthouseShareSheetPFLTraining *)self evaluateMetricsWithModelURL:v6];
    if (v21)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __78__LighthouseShareSheetPFLTraining_generateResultsDictionayWithModelURL_error___block_invoke;
      v27[3] = &unk_1E5AE06E0;
      id v22 = v11;
      id v28 = v22;
      [v21 enumerateKeysAndObjectsUsingBlock:v27];
      uint64_t v23 = [(LighthouseShareSheetPFLTraining *)self configTreeSpecification];
      [v22 setObject:v23 forKey:@"Tree"];

      uint64_t v24 = [(LighthouseShareSheetPFLTraining *)self configDepthSpecification];
      [v22 setObject:v24 forKey:@"Depth"];

      uint64_t v25 = [(LighthouseShareSheetPFLTraining *)self configBoltTaskIDSpecification];
      [v22 setObject:v25 forKey:@"BoltTaskID"];

      id v19 = v22;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        -[LighthouseShareSheetPFLTraining generateResultsDictionayWithModelURL:error:]();
      }
      id v19 = 0;
    }
  }
  else
  {
    float v12 = sLog_2;
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
      -[LighthouseShareSheetPFLTraining generateResultsDictionayWithModelURL:error:]((uint64_t)a4, v12, v13, v14, v15, v16, v17, v18);
    }
    id v19 = 0;
  }

  return v19;
}

uint64_t __78__LighthouseShareSheetPFLTraining_generateResultsDictionayWithModelURL_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

- (id)createMLFeatureProviderArrayFromSingleShareEventData:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v36 = [MEMORY[0x1E4F1CA48] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v3;
  uint64_t v39 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v39)
  {
    id v5 = 0;
    uint64_t v38 = *(void *)v55;
    *(void *)&long long v4 = 138412290;
    long long v35 = v4;
    do
    {
      uint64_t v6 = 0;
      int v46 = v5;
      do
      {
        if (*(void *)v55 != v38)
        {
          uint64_t v7 = v6;
          objc_enumerationMutation(obj);
          uint64_t v6 = v7;
        }
        uint64_t v40 = v6;
        id v8 = *(void **)(*((void *)&v54 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1A6243860]();
        int v48 = (void *)[v8 mutableCopy];
        id v9 = [(LighthouseShareSheetPFLTraining *)self featureNameDict];
        uint64_t v45 = [v9 objectForKeyedSubscript:@"personAndAppMatched"];

        uint64_t v44 = objc_msgSend(v48, "objectAtIndexedSubscript:", (int)objc_msgSend(v45, "intValue"));
        uint64_t v58 = 0;
        unint64_t v59 = &v58;
        uint64_t v60 = 0x2050000000;
        uint64_t v10 = (void *)getMLFeatureValueClass_softClass_1;
        uint64_t v61 = getMLFeatureValueClass_softClass_1;
        if (!getMLFeatureValueClass_softClass_1)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          unint64_t v65 = __getMLFeatureValueClass_block_invoke_1;
          v66 = &unk_1E5ADE858;
          id v67 = &v58;
          CoreMLLibraryCore_6();
          Class Class = objc_getClass("MLFeatureValue");
          *(void *)(v67[1] + 24) = Class;
          getMLFeatureValueClass_softClass_1 = *(void *)(v67[1] + 24);
          uint64_t v10 = (void *)v59[3];
        }
        id v12 = v10;
        _Block_object_dispose(&v58, 8);
        [v44 floatValue];
        uint64_t v42 = [v12 featureValueWithInt64:(int)v13];
        uint64_t v14 = [(LighthouseShareSheetPFLTraining *)self featureNameDict];
        uint64_t v43 = [v14 objectForKeyedSubscript:@"predictedClass"];

        objc_msgSend(v48, "setObject:atIndexedSubscript:", v42, (int)objc_msgSend(v43, "intValue"));
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v16 = [(LighthouseShareSheetPFLTraining *)self featureNameDict];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v51 != v18) {
                objc_enumerationMutation(v16);
              }
              id v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
              uint64_t v21 = [(LighthouseShareSheetPFLTraining *)self featureNameDict];
              id v22 = [v21 objectForKeyedSubscript:v20];

              uint64_t v23 = [v22 stringValue];
              int v24 = [v20 isEqualToString:@"predictedClass"];
              uint64_t v25 = objc_msgSend(v48, "objectAtIndexedSubscript:", (int)objc_msgSend(v22, "intValue"));
              if (v24) {
                id v26 = v20;
              }
              else {
                id v26 = v23;
              }
              [v15 setValue:v25 forKey:v26];
            }
            uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v62 count:16];
          }
          while (v17);
        }

        uint64_t v58 = 0;
        unint64_t v59 = &v58;
        uint64_t v60 = 0x2050000000;
        v27 = (void *)getMLDictionaryFeatureProviderClass_softClass_5;
        uint64_t v61 = getMLDictionaryFeatureProviderClass_softClass_5;
        if (!getMLDictionaryFeatureProviderClass_softClass_5)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          unint64_t v65 = __getMLDictionaryFeatureProviderClass_block_invoke_5;
          v66 = &unk_1E5ADE858;
          id v67 = &v58;
          CoreMLLibraryCore_6();
          Class v28 = objc_getClass("MLDictionaryFeatureProvider");
          *(void *)(v67[1] + 24) = v28;
          getMLDictionaryFeatureProviderClass_softClass_5 = *(void *)(v67[1] + 24);
          v27 = (void *)v59[3];
        }
        uint64_t v29 = v27;
        _Block_object_dispose(&v58, 8);
        id v30 = [v29 alloc];
        uint64_t v31 = (void *)[v15 copy];
        id v49 = v46;
        uint64_t v32 = (void *)[v30 initWithDictionary:v31 error:&v49];
        id v5 = v49;

        if (v5)
        {
          uint64_t v33 = sLog_2;
          if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v35;
            *(void *)((char *)&buf + 4) = v5;
            _os_log_error_impl(&dword_1A314B000, v33, OS_LOG_TYPE_ERROR, "Error getting sample point into MLDictionaryFeatureProvider format with error:%@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          [v36 addObject:v32];
        }

        uint64_t v6 = v40 + 1;
        int v46 = v5;
      }
      while (v40 + 1 != v39);
      uint64_t v39 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v39);
  }

  return v36;
}

- (id)evaluateMetricsWithModelURL:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v108 = 0;
  uint64_t v109 = &v108;
  uint64_t v110 = 0x2050000000;
  long long v4 = (void *)getMLModelClass_softClass_7;
  uint64_t v111 = getMLModelClass_softClass_7;
  if (!getMLModelClass_softClass_7)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    uint64_t v114 = __getMLModelClass_block_invoke_7;
    uint64_t v115 = &unk_1E5ADE858;
    long long v116 = &v108;
    CoreMLLibraryCore_6();
    Class Class = objc_getClass("MLModel");
    *(void *)(v116[1] + 24) = Class;
    getMLModelClass_softClass_7 = *(void *)(v116[1] + 24);
    long long v4 = (void *)v109[3];
  }
  id v6 = v4;
  _Block_object_dispose(&v108, 8);
  id v107 = 0;
  v91 = v3;
  v92 = [v6 compileModelAtURL:v3 error:&v107];
  id v7 = v107;
  id v8 = v92;
  if (v92) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v20 = [v92 path];
    v93 = +[_PSBehaviorRuleRankingUtilities loadMLModel:v20 modelConfig:0];

    uint64_t v21 = (void *)sLog_2;
    if (!v93)
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR)) {
        -[LighthouseShareSheetPFLTraining evaluateMetricsWithModelURL:]();
      }
      uint64_t v18 = 0;
      id v19 = 0;
      goto LABEL_61;
    }
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
    {
      id v22 = v21;
      uint64_t v23 = [v92 path];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v23;
      _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_INFO, "Loaded model from %@", (uint8_t *)&buf, 0xCu);
    }
    int v24 = sLog_2;
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"predictedValue";
      _os_log_impl(&dword_1A314B000, v24, OS_LOG_TYPE_INFO, "Using prediction label name: %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v95 = [(LighthouseShareSheetPFLTraining *)self featureMatricesForAllShareEvents];
    uint64_t v25 = (void *)sLog_2;
    if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
    {
      id v26 = v25;
      uint64_t v27 = [v95 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_1A314B000, v26, OS_LOG_TYPE_INFO, "Amount of data for evaluation: %ld", (uint8_t *)&buf, 0xCu);
    }
    if (![v95 count])
    {
      uint64_t v99 = 0;
      uint64_t v100 = 0;
      int v98 = 0;
      int v103 = 0;
      uint64_t v90 = 0;
LABEL_58:
      id v19 = objc_opt_new();
      v76 = objc_msgSend(NSNumber, "numberWithDouble:", (double)v90 / (double)(unint64_t)objc_msgSend(v95, "count"));
      [v19 setObject:v76 forKey:@"engagementRate"];

      v77 = [NSNumber numberWithInt:v90];
      [v19 setObject:v77 forKey:@"engagementRate_NumPositiveSamples"];

      v78 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v95, "count"));
      [v19 setObject:v78 forKey:@"engagementRate_NumSamples"];

      v79 = [NSNumber numberWithDouble:(double)SHIDWORD(v100) / (double)v103];
      [v19 setObject:v79 forKey:@"binaryAccuracy"];

      float v80 = [NSNumber numberWithInt:HIDWORD(v100)];
      [v19 setObject:v80 forKey:@"binaryAccuracy_NumPositiveSamples"];

      v81 = [NSNumber numberWithInt:v103];
      [v19 setObject:v81 forKey:@"binaryAccuracy_NumSamples"];

      float v82 = [NSNumber numberWithDouble:(double)(int)v99 / (double)SHIDWORD(v99)];
      [v19 setObject:v82 forKey:@"binaryAccuracyClass1"];

      v83 = [NSNumber numberWithInt:v99];
      [v19 setObject:v83 forKey:@"binaryAccuracyClass1_NumPositiveSamples"];

      v84 = [NSNumber numberWithInt:HIDWORD(v99)];
      [v19 setObject:v84 forKey:@"binaryAccuracyClass1_NumSamples"];

      v85 = [NSNumber numberWithDouble:(double)v98 / (double)(int)v100];
      [v19 setObject:v85 forKey:@"binaryAccuracyClass0"];

      v86 = [NSNumber numberWithInt:v98];
      [v19 setObject:v86 forKey:@"binaryAccuracyClass0_NumPositiveSamples"];

      double v87 = [NSNumber numberWithInt:v100];
      [v19 setObject:v87 forKey:@"binaryAccuracyClass0_NumSamples"];

      uint64_t v18 = 0;
      goto LABEL_60;
    }
    uint64_t v99 = 0;
    uint64_t v100 = 0;
    int v103 = 0;
    int v98 = 0;
    uint64_t v96 = 0;
    uint64_t v90 = 0;
    *(void *)&long long v28 = 138412290;
    long long v89 = v28;
    while (1)
    {
      context = (void *)MEMORY[0x1A6243860]();
      id v102 = [v95 objectAtIndexedSubscript:v96];
      int v97 = [(LighthouseShareSheetPFLTraining *)self createMLFeatureProviderArrayFromSingleShareEventData:v102];
      uint64_t v108 = 0;
      uint64_t v109 = &v108;
      uint64_t v110 = 0x2050000000;
      uint64_t v29 = (void *)getMLArrayBatchProviderClass_softClass_2;
      uint64_t v111 = getMLArrayBatchProviderClass_softClass_2;
      if (!getMLArrayBatchProviderClass_softClass_2)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        uint64_t v114 = __getMLArrayBatchProviderClass_block_invoke_2;
        uint64_t v115 = &unk_1E5ADE858;
        long long v116 = &v108;
        CoreMLLibraryCore_6();
        Class v30 = objc_getClass("MLArrayBatchProvider");
        *(void *)(v116[1] + 24) = v30;
        getMLArrayBatchProviderClass_softClass_2 = *(void *)(v116[1] + 24);
        uint64_t v29 = (void *)v109[3];
      }
      uint64_t v31 = v29;
      _Block_object_dispose(&v108, 8);
      unint64_t v105 = (void *)[[v31 alloc] initWithFeatureProviderArray:v97];
      id v106 = 0;
      uint64_t v32 = [v93 predictionsFromBatch:v105 error:&v106];
      id v33 = v106;
      unint64_t v34 = sLog_2;
      if (v33)
      {
        if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = v89;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_error_impl(&dword_1A314B000, v34, OS_LOG_TYPE_ERROR, "ML model load to predict with error：%@", (uint8_t *)&buf, 0xCu);
        }
        goto LABEL_50;
      }
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
      {
        long long v35 = v34;
        uint64_t v36 = [v32 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v36;
        _os_log_impl(&dword_1A314B000, v35, OS_LOG_TYPE_INFO, "Amount of predictions, %ld", (uint8_t *)&buf, 0xCu);
      }
      if (objc_msgSend(v32, "count", v89) >= 1) {
        break;
      }
LABEL_37:
      id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([v32 count] >= 1)
      {
        uint64_t v49 = 0;
        do
        {
          long long v50 = [v102 objectAtIndexedSubscript:v49];
          long long v51 = [v32 featuresAtIndex:v49];
          long long v52 = [v51 featureValueForName:@"classProbability"];
          long long v53 = [v52 dictionaryValue];

          long long v54 = [v53 objectForKeyedSubscript:&unk_1EF675C18];
          [v54 floatValue];
          float v56 = v55;

          long long v57 = [(LighthouseShareSheetPFLTraining *)self featureNameDict];
          uint64_t v58 = [v57 objectForKeyedSubscript:@"recipientAndBundleIDAsInteger"];

          unint64_t v59 = [evaluatedRule alloc];
          uint64_t v60 = [v105 featuresAtIndex:v49];
          uint64_t v61 = [v60 featureValueForName:@"predictedClass"];
          uint64_t v62 = [v61 int64Value];
          unint64_t v63 = objc_msgSend(v50, "objectAtIndexedSubscript:", (int)objc_msgSend(v58, "intValue"));
          *(float *)&double v64 = v56 * 100.0;
          unint64_t v65 = [(evaluatedRule *)v59 initWithLabel:v62 score:v63 recipientUniqueID:v64];

          [v101 addObject:v65];
          ++v49;
        }
        while (v49 < [v32 count]);
      }
      v66 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:0 selector:sel_compare_];
      uint64_t v112 = v66;
      id v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
      uint64_t v68 = [v101 sortedArrayUsingDescriptors:v67];

      id v69 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      if ([v68 count])
      {
        uint64_t v70 = 0;
        unint64_t v71 = 1;
        while (1)
        {
          unint64_t v72 = [v68 objectAtIndexedSubscript:v71 - 1];
          if ([v72 ruleLabel] == 1) {
            break;
          }
          unint64_t v73 = [v72 recipientUniqueID];
          char v74 = [v69 containsObject:v73];

          if ((v74 & 1) == 0)
          {
            v75 = [v72 recipientUniqueID];
            [v69 addObject:v75];

            ++v70;
          }

          if (v71 < [v68 count])
          {
            ++v71;
            if (v70 < 5) {
              continue;
            }
          }
          goto LABEL_49;
        }

        ++v90;
      }
LABEL_49:

      id v33 = 0;
LABEL_50:
      uint64_t v18 = v33;

      if (v33)
      {
        id v19 = 0;
LABEL_60:

LABEL_61:
        goto LABEL_62;
      }
      if (++v96 >= (unint64_t)[v95 count]) {
        goto LABEL_58;
      }
    }
    uint64_t v37 = 0;
    while (1)
    {
      uint64_t v38 = [v32 featuresAtIndex:v37];
      uint64_t v39 = [v38 featureValueForName:@"predictedValue"];
      [v39 doubleValue];
      double v41 = v40;

      *(float *)&double v42 = v41;
      [(LighthouseShareSheetPFLTraining *)self sigmoid:v42];
      float v44 = v43;
      uint64_t v45 = v43 > 0.5;
      int v46 = [v105 featuresAtIndex:v37];
      BOOL v47 = [v46 featureValueForName:@"predictedClass"];
      uint64_t v48 = [v47 int64Value];

      if (v48 == v45)
      {
        ++HIDWORD(v100);
        if (v44 <= 0.5)
        {
          ++v98;
          ++v103;
          goto LABEL_34;
        }
        LODWORD(v99) = v99 + 1;
      }
      ++v103;
      if (v48 == 1)
      {
        ++HIDWORD(v99);
        goto LABEL_36;
      }
      if (v48) {
        goto LABEL_36;
      }
LABEL_34:
      LODWORD(v100) = v100 + 1;
LABEL_36:
      if (++v37 >= [v32 count]) {
        goto LABEL_37;
      }
    }
  }
  uint64_t v10 = (uint64_t)v7;
  float v11 = sLog_2;
  if (!os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = (void *)v10;
    id v19 = 0;
    goto LABEL_63;
  }
  uint64_t v18 = (void *)v10;
  -[LighthouseShareSheetPFLTraining evaluateMetricsWithModelURL:](v10, v11, v12, v13, v14, v15, v16, v17);
  id v19 = 0;
LABEL_62:
  id v8 = v92;
LABEL_63:

  return v19;
}

- (void)processDataForMetricEvaluationForStore:(id)a3
{
  v135[1] = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v107 = self;
  [(LighthouseShareSheetPFLTraining *)self setFeatureMatricesForAllShareEvents:v4];

  id v5 = sLog_2;
  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "In processData", buf, 2u);
  }
  uint64_t v6 = 0;
  unsigned int v101 = 0;
  uint64_t v7 = 20;
  id v8 = @"predictedClass";
  while (1)
  {
    unint64_t v93 = v7;
    context = (void *)MEMORY[0x1A6243860]();
    id v9 = objc_alloc_init(MEMORY[0x1E4F5B518]);
    uint64_t v10 = [NSString stringWithUTF8String:"LighthouseShareSheetPFLTraining.m"];
    float v11 = objc_msgSend(v10, "stringByAppendingFormat:", @":%d", 850);
    [v9 setClientName:v11];

    [v9 setTracker:&__block_literal_global_44];
    uint64_t v12 = [MEMORY[0x1E4F5B5F8] behavioralRuleFeaturesStream];
    v135[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:1];
    [v9 setEventStreams:v13];

    [v9 setLimit:20];
    uint64_t v94 = v6;
    [v9 setOffset:v6];
    id v128 = 0;
    uint64_t v95 = v9;
    int v98 = [v92 executeQuery:v9 error:&v128];
    id v14 = v128;
    uint64_t v15 = sLog_2;
    id v97 = v14;
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v134 = v97;
        _os_log_error_impl(&dword_1A314B000, v15, OS_LOG_TYPE_ERROR, "knowledgeStore executeQuery failed with error: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = NSNumber;
        uint64_t v17 = v15;
        uint64_t v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v98, "count"));
        *(_DWORD *)long long buf = 138412290;
        id v134 = v18;
        _os_log_impl(&dword_1A314B000, v17, OS_LOG_TYPE_INFO, "knowledgeEvents parsing, number of events: %@", buf, 0xCu);
      }
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      id v19 = v98;
      uint64_t v102 = [v19 countByEnumeratingWithState:&v124 objects:v132 count:16];
      if (v102)
      {
        uint64_t v20 = *(void *)v125;
        uint64_t v99 = *(void *)v125;
        id v100 = v19;
        do
        {
          for (uint64_t i = 0; i != v102; ++i)
          {
            if (*(void *)v125 != v20) {
              objc_enumerationMutation(v19);
            }
            id v22 = *(void **)(*((void *)&v124 + 1) + 8 * i);
            if (v22)
            {
              uint64_t v103 = i;
              uint64_t v23 = [v22 metadata];
              int v24 = [MEMORY[0x1E4F5B4C0] featureDict];
              uint64_t v25 = [v23 objectForKeyedSubscript:v24];

              if (v25 && [v25 count])
              {
                id v26 = (void *)sLog_2;
                if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                {
                  uint64_t v27 = NSNumber;
                  long long v28 = v26;
                  uint64_t v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
                  *(_DWORD *)long long buf = 138412290;
                  id v134 = v29;
                  _os_log_impl(&dword_1A314B000, v28, OS_LOG_TYPE_INFO, "number of data points: %@", buf, 0xCu);
                }
                if ([v25 count])
                {
                  ++v101;
                  Class v30 = (void *)sLog_2;
                  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v31 = NSNumber;
                    uint64_t v32 = v30;
                    id v33 = [v25 objectAtIndexedSubscript:0];
                    unint64_t v34 = objc_msgSend(v31, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
                    *(_DWORD *)long long buf = 138412290;
                    id v134 = v34;
                    _os_log_impl(&dword_1A314B000, v32, OS_LOG_TYPE_INFO, "data point dimension: %@", buf, 0xCu);
                  }
                }
                long long v35 = (void *)sLog_2;
                if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                {
                  uint64_t v36 = NSNumber;
                  uint64_t v37 = v35;
                  uint64_t v38 = [v36 numberWithInt:v101];
                  *(_DWORD *)long long buf = 138412290;
                  id v134 = v38;
                  _os_log_impl(&dword_1A314B000, v37, OS_LOG_TYPE_INFO, "countEvents: %@", buf, 0xCu);
                }
                if (v101 == 1 && [v25 count])
                {
                  uint64_t v39 = [(LighthouseShareSheetPFLTraining *)v107 selectedFeaturesConfig];
                  double v40 = [v39 objectForKeyedSubscript:@"_PSRuleMiningModelFeatureSet"];

                  id v41 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  [(LighthouseShareSheetPFLTraining *)v107 setFeatureNameDict:v41];

                  long long v122 = 0u;
                  long long v123 = 0u;
                  long long v120 = 0u;
                  long long v121 = 0u;
                  id v42 = v40;
                  uint64_t v43 = [v42 countByEnumeratingWithState:&v120 objects:v131 count:16];
                  if (v43)
                  {
                    uint64_t v110 = v25;
                    uint64_t v44 = 0;
                    uint64_t v45 = *(void *)v121;
                    do
                    {
                      uint64_t v46 = 0;
                      uint64_t v47 = v44;
                      do
                      {
                        if (*(void *)v121 != v45) {
                          objc_enumerationMutation(v42);
                        }
                        uint64_t v48 = *(void *)(*((void *)&v120 + 1) + 8 * v46);
                        uint64_t v49 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                        long long v50 = [NSNumber numberWithInt:v47 + v46];
                        [v49 setValue:v50 forKey:v48];

                        ++v46;
                      }
                      while (v43 != v46);
                      uint64_t v43 = [v42 countByEnumeratingWithState:&v120 objects:v131 count:16];
                      uint64_t v44 = (v47 + v46);
                    }
                    while (v43);
                    uint64_t v43 = (v47 + v46);
                    uint64_t v25 = v110;
                  }

                  long long v51 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                  long long v52 = [NSNumber numberWithInt:v43];
                  [v51 setValue:v52 forKey:@"personAndAppMatched"];

                  long long v53 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                  long long v54 = [NSNumber numberWithInt:(v43 + 1)];
                  [v53 setValue:v54 forKey:@"recipientAndBundleIDAsInteger"];

                  float v55 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                  float v56 = [NSNumber numberWithInt:(v43 + 2)];
                  [v55 setValue:v56 forKey:v8];

                  long long v57 = (void *)sLog_2;
                  if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v58 = v57;
                    unint64_t v59 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                    *(_DWORD *)long long buf = 138412290;
                    id v134 = v59;
                    _os_log_impl(&dword_1A314B000, v58, OS_LOG_TYPE_INFO, "featureNameDict: %@", buf, 0xCu);
                  }
                }
                id v104 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                if ([v25 count])
                {
                  uint64_t v60 = 0;
                  while (1)
                  {
                    id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v116 = 0u;
                    long long v117 = 0u;
                    long long v118 = 0u;
                    long long v119 = 0u;
                    uint64_t v62 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                    uint64_t v63 = [v62 countByEnumeratingWithState:&v116 objects:v130 count:16];
                    if (v63)
                    {
                      uint64_t v64 = v63;
                      uint64_t v65 = *(void *)v117;
                      do
                      {
                        for (uint64_t j = 0; j != v64; ++j)
                        {
                          if (*(void *)v117 != v65) {
                            objc_enumerationMutation(v62);
                          }
                          if (([*(id *)(*((void *)&v116 + 1) + 8 * j) isEqualToString:v8] & 1) == 0)
                          {
                            id v67 = objc_opt_new();
                            [v61 addObject:v67];
                          }
                        }
                        uint64_t v64 = [v62 countByEnumeratingWithState:&v116 objects:v130 count:16];
                      }
                      while (v64);
                    }
                    id v106 = v61;

                    long long v114 = 0u;
                    long long v115 = 0u;
                    long long v112 = 0u;
                    long long v113 = 0u;
                    obuint64_t j = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                    uint64_t v68 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
                    if (v68) {
                      break;
                    }
LABEL_61:

                    v86 = (void *)[v106 copy];
                    [v104 addObject:v86];

                    if ([v25 count] <= (unint64_t)++v60) {
                      goto LABEL_62;
                    }
                  }
                  uint64_t v69 = v68;
                  uint64_t v70 = *(void *)v113;
                  uint64_t v105 = v60;
                  while (2)
                  {
                    uint64_t v71 = 0;
                    uint64_t v108 = v69;
LABEL_51:
                    if (*(void *)v113 != v70) {
                      objc_enumerationMutation(obj);
                    }
                    unint64_t v72 = *(void **)(*((void *)&v112 + 1) + 8 * v71);
                    if (([v72 isEqualToString:v8] & 1) == 0)
                    {
                      unint64_t v73 = [v25 objectAtIndexedSubscript:v60];
                      uint64_t v74 = [v73 objectForKey:v72];
                      if (v74)
                      {
                        v75 = (void *)v74;
                        v76 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                        [v76 objectForKeyedSubscript:v72];
                        uint64_t v77 = v70;
                        v79 = v78 = v25;
                        int v111 = [v79 intValue];
                        float v80 = v8;
                        unint64_t v81 = [v106 count];

                        uint64_t v25 = v78;
                        uint64_t v70 = v77;
                        uint64_t v69 = v108;

                        BOOL v82 = v81 > v111;
                        id v8 = v80;
                        uint64_t v60 = v105;
                        if (!v82) {
                          goto LABEL_59;
                        }
                        unint64_t v73 = [v25 objectAtIndexedSubscript:v105];
                        v83 = [v73 objectForKeyedSubscript:v72];
                        v84 = [(LighthouseShareSheetPFLTraining *)v107 featureNameDict];
                        v85 = [v84 objectForKeyedSubscript:v72];
                        objc_msgSend(v106, "setObject:atIndexedSubscript:", v83, (int)objc_msgSend(v85, "intValue"));

                        uint64_t v69 = v108;
                      }
                    }
LABEL_59:
                    if (v69 == ++v71)
                    {
                      uint64_t v69 = [obj countByEnumeratingWithState:&v112 objects:v129 count:16];
                      if (!v69) {
                        goto LABEL_61;
                      }
                      continue;
                    }
                    goto LABEL_51;
                  }
                }
LABEL_62:
                double v87 = [(LighthouseShareSheetPFLTraining *)v107 featureMatricesForAllShareEvents];
                [v87 addObject:v104];

                uint64_t v20 = v99;
                id v19 = v100;
              }

              uint64_t i = v103;
            }
          }
          uint64_t v102 = [v19 countByEnumeratingWithState:&v124 objects:v132 count:16];
        }
        while (v102);
      }
    }
    if (v97) {
      break;
    }
    uint64_t v6 = v94 + 20;
    uint64_t v7 = v93 + 20;
    if (v93 >= 0x51)
    {
      v88 = (void *)sLog_2;
      if (os_log_type_enabled((os_log_t)sLog_2, OS_LOG_TYPE_INFO))
      {
        long long v89 = NSNumber;
        uint64_t v90 = v88;
        v91 = [v89 numberWithInt:v101];
        *(_DWORD *)long long buf = 138412290;
        id v134 = v91;
        _os_log_impl(&dword_1A314B000, v90, OS_LOG_TYPE_INFO, "knowledge store events with data: %@", buf, 0xCu);
      }
      break;
    }
  }
}

uint64_t __74__LighthouseShareSheetPFLTraining_processDataForMetricEvaluationForStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)createDataSourceForRecipe:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  id v8 = +[FidesPHSEvaluatorDataSource defaultRecipeParams];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __67__LighthouseShareSheetPFLTraining_createDataSourceForRecipe_error___block_invoke;
  id v22 = &unk_1E5AE17C0;
  id v9 = v6;
  id v23 = v9;
  id v10 = v7;
  id v24 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v19];

  float v11 = [FidesPHSEvaluatorDataSource alloc];
  uint64_t v12 = [(LighthouseShareSheetPFLTraining *)self processDataReturnDict];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"inputVectors"];
  id v14 = [(LighthouseShareSheetPFLTraining *)self processDataReturnDict];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"targetVector"];
  uint64_t v16 = [(FidesPHSEvaluatorDataSource *)v11 initWithRecipe:v10 inputVectors:v13 targetVector:v15 error:a4];

  if (v16 && !*a4) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }

  return v17;
}

void __67__LighthouseShareSheetPFLTraining_createDataSourceForRecipe_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  id v10 = (id)v8;
  if (v8) {
    id v9 = (id)v8;
  }
  else {
    id v9 = v6;
  }
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
}

- (id)createDataSourceForDodMLRecipe:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = +[FidesPHSEvaluatorDataSource defaultRecipeParams];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __72__LighthouseShareSheetPFLTraining_createDataSourceForDodMLRecipe_error___block_invoke;
  id v22 = &unk_1E5AE17C0;
  id v9 = v6;
  id v23 = v9;
  id v10 = v7;
  id v24 = v10;
  [v8 enumerateKeysAndObjectsUsingBlock:&v19];

  float v11 = [FidesPHSEvaluatorDataSource alloc];
  uint64_t v12 = [(LighthouseShareSheetPFLTraining *)self processDataReturnDict];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"inputVectors"];
  id v14 = [(LighthouseShareSheetPFLTraining *)self processDataReturnDict];
  uint64_t v15 = [v14 objectForKeyedSubscript:@"targetVector"];
  uint64_t v16 = [(FidesPHSEvaluatorDataSource *)v11 initWithRecipe:v10 inputVectors:v13 targetVector:v15 error:a4];

  if (v16 && !*a4) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0;
  }

  return v17;
}

void __72__LighthouseShareSheetPFLTraining_createDataSourceForDodMLRecipe_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  id v10 = (id)v8;
  if (v8) {
    id v9 = (id)v8;
  }
  else {
    id v9 = v6;
  }
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
}

- (float)sigmoid:(float)a3
{
  return 1.0 / (exp((float)-a3) + 1.0);
}

- (_DKKnowledgeStore)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
}

- (FidesPHSEvaluatorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSDictionary)processDataReturnDict
{
  return self->_processDataReturnDict;
}

- (void)setProcessDataReturnDict:(id)a3
{
}

- (NSMutableArray)featureMatricesForAllShareEvents
{
  return self->_featureMatricesForAllShareEvents;
}

- (void)setFeatureMatricesForAllShareEvents:(id)a3
{
}

- (NSMutableDictionary)featureNameDict
{
  return self->_featureNameDict;
}

- (void)setFeatureNameDict:(id)a3
{
}

- (NSDictionary)selectedFeaturesConfig
{
  return self->_selectedFeaturesConfig;
}

- (void)setSelectedFeaturesConfig:(id)a3
{
}

- (NSString)configTreeSpecification
{
  return self->_configTreeSpecification;
}

- (void)setConfigTreeSpecification:(id)a3
{
}

- (NSString)configDepthSpecification
{
  return self->_configDepthSpecification;
}

- (void)setConfigDepthSpecification:(id)a3
{
}

- (NSString)configBoltTaskIDSpecification
{
  return self->_configBoltTaskIDSpecification;
}

- (void)setConfigBoltTaskIDSpecification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configBoltTaskIDSpecification, 0);
  objc_storeStrong((id *)&self->_configDepthSpecification, 0);
  objc_storeStrong((id *)&self->_configTreeSpecification, 0);
  objc_storeStrong((id *)&self->_selectedFeaturesConfig, 0);
  objc_storeStrong((id *)&self->_featureNameDict, 0);
  objc_storeStrong((id *)&self->_featureMatricesForAllShareEvents, 0);
  objc_storeStrong((id *)&self->_processDataReturnDict, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Got nil return from processDataForStore:recipeInfo:", v2, v3, v4, v5, v6);
}

- (void)runWithRecipeInfo:(uint64_t)a3 knowledgeStore:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "No model file specified for key 'ModelFileName' in Trial attachment", v2, v3, v4, v5, v6);
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Failed to copy model file to temporary directory.", v2, v3, v4, v5, v6);
}

- (void)runWithRecipeInfo:knowledgeStore:error:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Failed to remove old model file.", v2, v3, v4, v5, v6);
}

- (void)runTask:knowledgeStore:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Got nil return from processDataForStore:taskParameters:", v2, v3, v4, v5, v6);
}

- (void)runTask:(void *)a1 knowledgeStore:(void *)a2 error:.cold.4(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 count];
  _os_log_error_impl(&dword_1A314B000, v3, OS_LOG_TYPE_ERROR, "modelURLs had a length not equal to 1: %lu", (uint8_t *)&v4, 0xCu);
}

- (void)generateResultsDictionayWithModelURL:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)generateResultsDictionayWithModelURL:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Failed to run evaluateMetricsWithModelURL", v2, v3, v4, v5, v6);
}

- (void)evaluateMetricsWithModelURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)evaluateMetricsWithModelURL:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Failed to load model", v2, v3, v4, v5, v6);
}

@end