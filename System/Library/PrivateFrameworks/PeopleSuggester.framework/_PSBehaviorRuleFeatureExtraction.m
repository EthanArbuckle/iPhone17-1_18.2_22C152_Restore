@interface _PSBehaviorRuleFeatureExtraction
- (BMBehaviorRetriever)behaviorRetriever;
- (BOOL)constantFeaturesReady;
- (BOOL)contextFeaturesReady;
- (NSDictionary)metadata;
- (NSMutableDictionary)constantFeatures;
- (NSMutableDictionary)contextFeatures;
- (_CDInteractionStore)interactionStore;
- (_PSBehaviorRuleFeatureExtraction)initWithMetadata:(id)a3;
- (int)bucketedValue:(int)a3;
- (void)extractConstantFeaturesForMLModelIntoFeatures:(id)a3;
- (void)extractContextMatchFeatures:(id)a3 features:(id)a4;
- (void)extractFeaturesGivenRule:(id)a3 contextItems:(id)a4 features:(id)a5;
- (void)precalculateConstantFeatures;
- (void)setConstantFeatures:(id)a3;
- (void)setConstantFeaturesReady:(BOOL)a3;
- (void)setContextFeatures:(id)a3;
- (void)setContextFeaturesReady:(BOOL)a3;
- (void)transferFeaturesFrom:(id)a3 toFeatures:(id)a4;
@end

@implementation _PSBehaviorRuleFeatureExtraction

- (_PSBehaviorRuleFeatureExtraction)initWithMetadata:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PSBehaviorRuleFeatureExtraction;
  v6 = [(_PSBehaviorRuleFeatureExtraction *)&v17 init];
  if (v6)
  {
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v7 = (void *)getBMBehaviorRetrieverClass_softClass_2;
    uint64_t v26 = getBMBehaviorRetrieverClass_softClass_2;
    if (!getBMBehaviorRetrieverClass_softClass_2)
    {
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __getBMBehaviorRetrieverClass_block_invoke_2;
      v21 = &unk_1E5ADE858;
      v22 = &v23;
      BehaviorMinerLibraryCore_2();
      Class Class = objc_getClass("BMBehaviorRetriever");
      *(void *)(v22[1] + 24) = Class;
      getBMBehaviorRetrieverClass_softClass_2 = *(void *)(v22[1] + 24);
      v7 = (void *)v24[3];
    }
    v9 = v7;
    _Block_object_dispose(&v23, 8);
    v10 = (BMBehaviorRetriever *)objc_alloc_init(v9);
    behaviorRetriever = v6->_behaviorRetriever;
    v6->_behaviorRetriever = v10;

    v12 = (void *)MEMORY[0x1E4F5B400];
    v13 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    uint64_t v14 = [v12 storeWithDirectory:v13 readOnly:1];
    interactionStore = v6->_interactionStore;
    v6->_interactionStore = (_CDInteractionStore *)v14;

    *(_WORD *)&v6->_constantFeaturesReady = 0;
    objc_storeStrong((id *)&v6->_metadata, a3);
  }

  return v6;
}

- (int)bucketedValue:(int)a3
{
  int result = a3;
  if (a3 >= 11)
  {
    if (a3 > 0x64)
    {
      if (a3 > 0x3E7) {
        return 1000;
      }
      else {
        return a3 - (unsigned __int16)a3 % 0x64u;
      }
    }
    else
    {
      return a3 - a3 % 0xAu;
    }
  }
  return result;
}

- (void)extractContextMatchFeatures:(id)a3 features:(id)a4
{
  id v41 = a3;
  id v6 = a4;
  v7 = [v41 valueForKey:@"type"];
  v8 = (void *)[v7 mutableCopy];

  v9 = [(NSDictionary *)self->_metadata valueForKey:@"utiTypeInContext"];

  if (v9)
  {
    v10 = NSNumber;
    v11 = [getBMItemTypeClass_2() interactionUTIType];
    v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v8, "containsObject:", v11));
    [v6 setObject:v12 forKeyedSubscript:@"utiTypeInContext"];
  }
  v13 = [(NSDictionary *)self->_metadata valueForKey:@"contentUrlInContext"];

  if (v13)
  {
    uint64_t v14 = NSNumber;
    v15 = [getBMItemTypeClass_2() interactionContentURL];
    v16 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v8, "containsObject:", v15));
    [v6 setObject:v16 forKeyedSubscript:@"contentUrlInContext"];
  }
  objc_super v17 = [(NSDictionary *)self->_metadata valueForKey:@"sourceBundleIdInContext"];

  if (v17)
  {
    uint64_t v18 = NSNumber;
    uint64_t v19 = [getBMItemTypeClass_2() interactionSharingSourceBundleID];
    v20 = objc_msgSend(v18, "numberWithBool:", objc_msgSend(v8, "containsObject:", v19));
    [v6 setObject:v20 forKeyedSubscript:@"sourceBundleIdInContext"];
  }
  v21 = [(NSDictionary *)self->_metadata valueForKey:@"targetBundleIdInContext"];

  if (v21)
  {
    v22 = NSNumber;
    uint64_t v23 = [getBMItemTypeClass_2() interactionTargetBundleID];
    v24 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v8, "containsObject:", v23));
    [v6 setObject:v24 forKeyedSubscript:@"targetBundleIdInContext"];
  }
  uint64_t v25 = [(NSDictionary *)self->_metadata valueForKey:@"LOIInContext"];

  if (v25)
  {
    uint64_t v26 = NSNumber;
    v27 = [getBMItemTypeClass_2() locationIdentifier];
    v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v8, "containsObject:", v27));
    [v6 setObject:v28 forKeyedSubscript:@"LOIInContext"];
  }
  v29 = [(NSDictionary *)self->_metadata valueForKey:@"photoContactInContext"];

  if (v29)
  {
    v30 = [getBMItemTypeClass_2() interactionPhotoContact];
    int v31 = [v8 containsObject:v30];

    if (v31)
    {
      v32 = [v41 objectsPassingTest:&__block_literal_global_48];
      uint64_t v33 = [v32 count];

      v34 = [NSNumber numberWithInt:v33];
      [v6 setObject:v34 forKeyedSubscript:@"photoContactInContext"];
    }
    else
    {
      [v6 setObject:&unk_1EF675D80 forKeyedSubscript:@"photoContactInContext"];
    }
  }
  v35 = [(NSDictionary *)self->_metadata valueForKey:@"photoSceneInContext"];

  if (v35)
  {
    v36 = [getBMItemTypeClass_2() interactionPhotoScene];
    int v37 = [v8 containsObject:v36];

    if (v37)
    {
      v38 = [v41 objectsPassingTest:&__block_literal_global_150];
      uint64_t v39 = [v38 count];

      v40 = [NSNumber numberWithInt:v39];
      [v6 setObject:v40 forKeyedSubscript:@"photoSceneInContext"];
    }
    else
    {
      [v6 setObject:&unk_1EF675D80 forKeyedSubscript:@"photoSceneInContext"];
    }
  }
  [(_PSBehaviorRuleFeatureExtraction *)self setContextFeaturesReady:1];
}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(id)a3
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v110 = a3;
  v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_INFO, "Extracting constant features for the rule ranking ML model", buf, 2u);
  }

  v4 = (void *)MEMORY[0x1E4F28F60];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675D98, 0);
  v108 = [v4 predicateWithFormat:@"direction IN %@", v5];

  id v6 = (void *)MEMORY[0x1E4F28F60];
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675DB0, &unk_1EF675DC8, 0);
  uint64_t v8 = [v6 predicateWithFormat:@"direction IN %@", v7];

  v9 = (void *)MEMORY[0x1E4F28F60];
  v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675DB0, &unk_1EF675DC8, 0);
  v107 = [v9 predicateWithFormat:@"direction IN %@ && mechanism == %@", v10, &unk_1EF675DE0];

  v11 = [(_PSBehaviorRuleFeatureExtraction *)self interactionStore];
  id v135 = 0;
  v105 = (void *)v8;
  uint64_t v12 = [v11 countInteractionsUsingPredicate:v8 error:&v135];
  id v13 = v135;

  if (v13)
  {
    uint64_t v14 = +[_PSLogging coreBehaviorChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:]((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  v21 = [(_PSBehaviorRuleFeatureExtraction *)self interactionStore];
  id v134 = 0;
  uint64_t v22 = [v21 countInteractionsUsingPredicate:v108 error:&v134];
  id v23 = v134;

  if (v23)
  {
    v24 = +[_PSLogging coreBehaviorChannel];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:]((uint64_t)v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  int v31 = [(_PSBehaviorRuleFeatureExtraction *)self interactionStore];
  id v133 = 0;
  uint64_t v32 = [v31 countInteractionsUsingPredicate:v107 error:&v133];
  id v33 = v133;

  v106 = v33;
  if (v33)
  {
    v34 = +[_PSLogging coreBehaviorChannel];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[_PSBehaviorRuleFeatureExtraction extractConstantFeaturesForMLModelIntoFeatures:]((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40);
    }
  }
  id v41 = [(NSDictionary *)self->_metadata valueForKey:@"totalMessagesSent"];

  if (v41)
  {
    v42 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v12));
    [v110 setObject:v42 forKeyedSubscript:@"totalMessagesSent"];
  }
  v43 = [(NSDictionary *)self->_metadata valueForKey:@"totalMessagesRecieved"];

  if (v43)
  {
    v44 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v22));
    [v110 setObject:v44 forKeyedSubscript:@"totalMessagesRecieved"];
  }
  v45 = [(NSDictionary *)self->_metadata valueForKey:@"totalShares"];

  if (v45)
  {
    v46 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v32));
    [v110 setObject:v46 forKeyedSubscript:@"totalShares"];
  }
  v47 = [(_PSBehaviorRuleFeatureExtraction *)self behaviorRetriever];
  v48 = [v47 retrieveRulesWithFilters:0];

  v124 = [MEMORY[0x1E4F1CA80] set];
  v123 = [MEMORY[0x1E4F1CA80] set];
  v121 = [MEMORY[0x1E4F1CA80] set];
  v119 = [MEMORY[0x1E4F1CA80] set];
  v49 = [MEMORY[0x1E4F1CA80] set];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id obj = v48;
  uint64_t v115 = [obj countByEnumeratingWithState:&v129 objects:v138 count:16];
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  if (v115)
  {
    unsigned int v122 = 0;
    unsigned int v120 = 0;
    unsigned int v118 = 0;
    uint64_t v114 = 0;
    unsigned int v113 = 0;
    uint64_t v112 = *(void *)v130;
    v117 = v49;
    do
    {
      uint64_t v52 = 0;
      do
      {
        if (*(void *)v130 != v112) {
          objc_enumerationMutation(obj);
        }
        v53 = *(void **)(*((void *)&v129 + 1) + 8 * v52);
        [v53 confidence];
        uint64_t v116 = v52;
        if (v54 <= 0.75)
        {
          [v53 confidence];
          if (v55 <= 0.25) {
            int v56 = v114;
          }
          else {
            int v56 = v114 + 1;
          }
          if (v55 > 0.25) {
            unsigned int v57 = v113;
          }
          else {
            unsigned int v57 = v113 + 1;
          }
          unsigned int v113 = v57;
          LODWORD(v114) = v56;
        }
        else
        {
          ++HIDWORD(v114);
        }
        long long v127 = 0u;
        long long v128 = 0u;
        long long v125 = 0u;
        long long v126 = 0u;
        v58 = [v53 antecedent];
        uint64_t v59 = [v58 countByEnumeratingWithState:&v125 objects:v137 count:16];
        if (v59)
        {
          uint64_t v60 = v59;
          uint64_t v61 = *(void *)v126;
          do
          {
            for (uint64_t i = 0; i != v60; ++i)
            {
              if (*(void *)v126 != v61) {
                objc_enumerationMutation(v58);
              }
              v63 = *(void **)(*((void *)&v125 + 1) + 8 * i);
              v64 = [v63 type];
              v65 = [getBMItemTypeClass_2() interactionPhotoContact];
              int v66 = [v64 isEqual:v65];

              if (v66)
              {
                [v124 addObject:v63];
                uint64_t v50 = (v50 + 1);
              }
              else
              {
                v67 = [v63 type];
                v68 = [getBMItemTypeClass_2() interactionPhotoScene];
                int v69 = [v67 isEqual:v68];

                if (v69)
                {
                  [v123 addObject:v63];
                  uint64_t v51 = (v51 + 1);
                }
                else
                {
                  v70 = [v63 type];
                  v71 = [getBMItemTypeClass_2() interactionSharingSourceBundleID];
                  int v72 = [v70 isEqual:v71];

                  if (v72)
                  {
                    [v121 addObject:v63];
                    ++v122;
                  }
                  else
                  {
                    v73 = [v63 type];
                    v74 = [getBMItemTypeClass_2() interactionTargetBundleID];
                    int v75 = [v73 isEqual:v74];

                    if (v75)
                    {
                      [v119 addObject:v63];
                      ++v120;
                    }
                    else
                    {
                      v76 = [v63 type];
                      v77 = [getBMItemTypeClass_2() locationIdentifier];
                      int v78 = [v76 isEqual:v77];

                      if (v78)
                      {
                        [v117 addObject:v63];
                        ++v118;
                      }
                    }
                  }
                }
              }
            }
            uint64_t v60 = [v58 countByEnumeratingWithState:&v125 objects:v137 count:16];
          }
          while (v60);
        }

        uint64_t v52 = v116 + 1;
        v49 = v117;
      }
      while (v116 + 1 != v115);
      uint64_t v115 = [obj countByEnumeratingWithState:&v129 objects:v138 count:16];
    }
    while (v115);
  }
  else
  {
    unsigned int v122 = 0;
    unsigned int v120 = 0;
    unsigned int v118 = 0;
    uint64_t v114 = 0;
    unsigned int v113 = 0;
  }

  v79 = [(NSDictionary *)self->_metadata valueForKey:@"lowConfidenceRuleCount"];

  if (v79)
  {
    v80 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v113));
    [v110 setObject:v80 forKeyedSubscript:@"lowConfidenceRuleCount"];
  }
  v81 = [(NSDictionary *)self->_metadata valueForKey:@"mediumConfidenceRuleCount"];

  if (v81)
  {
    v82 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v114));
    [v110 setObject:v82 forKeyedSubscript:@"mediumConfidenceRuleCount"];
  }
  v83 = [(NSDictionary *)self->_metadata valueForKey:@"highConfidenceRuleCount"];

  if (v83)
  {
    v84 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", HIDWORD(v114)));
    [v110 setObject:v84 forKeyedSubscript:@"highConfidenceRuleCount"];
  }
  v85 = [(NSDictionary *)self->_metadata valueForKey:@"photoContactContainingRuleCount"];

  if (v85)
  {
    v86 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v50));
    [v110 setObject:v86 forKeyedSubscript:@"photoContactContainingRuleCount"];
  }
  v87 = [(NSDictionary *)self->_metadata valueForKey:@"photoSceneContainingRuleCount"];

  if (v87)
  {
    v88 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v51));
    [v110 setObject:v88 forKeyedSubscript:@"photoSceneContainingRuleCount"];
  }
  v89 = [(NSDictionary *)self->_metadata valueForKey:@"sourceBundleIdContainingRuleCount"];

  if (v89)
  {
    v90 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v122));
    [v110 setObject:v90 forKeyedSubscript:@"sourceBundleIdContainingRuleCount"];
  }
  v91 = [(NSDictionary *)self->_metadata valueForKey:@"targetBundleIdContainingRuleCount"];

  if (v91)
  {
    v92 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v120));
    [v110 setObject:v92 forKeyedSubscript:@"targetBundleIdContainingRuleCount"];
  }
  v93 = [(NSDictionary *)self->_metadata valueForKey:@"locationOfInterestContainingRuleCount"];

  if (v93)
  {
    v94 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", v118));
    [v110 setObject:v94 forKeyedSubscript:@"locationOfInterestContainingRuleCount"];
  }
  v95 = [(NSDictionary *)self->_metadata valueForKey:@"photoContactRulesCardinality"];

  if (v95)
  {
    v96 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v124, "count")));
    [v110 setObject:v96 forKeyedSubscript:@"photoContactRulesCardinality"];
  }
  v97 = [(NSDictionary *)self->_metadata valueForKey:@"photoSceneRulesCardinality"];

  if (v97)
  {
    v98 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v123, "count")));
    [v110 setObject:v98 forKeyedSubscript:@"photoSceneRulesCardinality"];
  }
  v99 = [(NSDictionary *)self->_metadata valueForKey:@"sourceBundleIdRulesCardinality"];

  if (v99)
  {
    v100 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v121, "count")));
    [v110 setObject:v100 forKeyedSubscript:@"sourceBundleIdRulesCardinality"];
  }
  v101 = [(NSDictionary *)self->_metadata valueForKey:@"targetBundleIdRulesCardinality"];

  if (v101)
  {
    v102 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v119, "count")));
    [v110 setObject:v102 forKeyedSubscript:@"targetBundleIdRulesCardinality"];
  }
  v103 = [(NSDictionary *)self->_metadata valueForKey:@"locationOfInterestRulesCardinality"];

  if (v103)
  {
    v104 = objc_msgSend(NSNumber, "numberWithInt:", -[_PSBehaviorRuleFeatureExtraction bucketedValue:](self, "bucketedValue:", objc_msgSend(v49, "count")));
    [v110 setObject:v104 forKeyedSubscript:@"locationOfInterestRulesCardinality"];
  }
  self->_constantFeaturesReady = 1;
}

- (void)transferFeaturesFrom:(id)a3 toFeatures:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = [v5 objectForKeyedSubscript:v11];
        [v6 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)precalculateConstantFeatures
{
  if (![(_PSBehaviorRuleFeatureExtraction *)self constantFeaturesReady])
  {
    v3 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_PSBehaviorRuleFeatureExtraction *)self setConstantFeatures:v3];

    id v4 = [(_PSBehaviorRuleFeatureExtraction *)self constantFeatures];
    [(_PSBehaviorRuleFeatureExtraction *)self extractConstantFeaturesForMLModelIntoFeatures:v4];
  }
}

- (void)extractFeaturesGivenRule:(id)a3 contextItems:(id)a4 features:(id)a5
{
  id v117 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(_PSBehaviorRuleFeatureExtraction *)self contextFeaturesReady])
  {
    v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_PSBehaviorRuleFeatureExtraction *)self setContextFeatures:v10];

    uint64_t v11 = [(_PSBehaviorRuleFeatureExtraction *)self contextFeatures];
    [(_PSBehaviorRuleFeatureExtraction *)self extractContextMatchFeatures:v8 features:v11];
  }
  uint64_t v12 = [(_PSBehaviorRuleFeatureExtraction *)self contextFeatures];
  [(_PSBehaviorRuleFeatureExtraction *)self transferFeaturesFrom:v12 toFeatures:v9];

  if (![(_PSBehaviorRuleFeatureExtraction *)self constantFeaturesReady])
  {
    long long v13 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_PSBehaviorRuleFeatureExtraction *)self setConstantFeatures:v13];

    long long v14 = [(_PSBehaviorRuleFeatureExtraction *)self constantFeatures];
    [(_PSBehaviorRuleFeatureExtraction *)self extractConstantFeaturesForMLModelIntoFeatures:v14];
  }
  long long v15 = [(_PSBehaviorRuleFeatureExtraction *)self constantFeatures];
  [(_PSBehaviorRuleFeatureExtraction *)self transferFeaturesFrom:v15 toFeatures:v9];

  long long v16 = [v117 consequent];
  uint64_t v17 = [v16 valueForKey:@"type"];

  uint64_t v18 = [(NSDictionary *)self->_metadata valueForKey:@"targetBundleIDInConsequent"];

  if (v18)
  {
    uint64_t v19 = NSNumber;
    uint64_t v20 = [getBMItemTypeClass_2() interactionTargetBundleID];
    v21 = objc_msgSend(v19, "numberWithBool:", objc_msgSend(v17, "containsObject:", v20));
    [v9 setObject:v21 forKeyedSubscript:@"targetBundleIDInConsequent"];
  }
  uint64_t v22 = [v117 antecedent];
  id v23 = [v22 valueForKey:@"type"];
  v24 = (void *)[v23 mutableCopy];

  uint64_t v25 = [(NSDictionary *)self->_metadata valueForKey:@"isWeekendInRule"];

  if (v25)
  {
    uint64_t v26 = NSNumber;
    uint64_t v27 = [getBMItemTypeClass_2() isWeekend];
    uint64_t v28 = objc_msgSend(v26, "numberWithBool:", objc_msgSend(v24, "containsObject:", v27));
    [v9 setObject:v28 forKeyedSubscript:@"isWeekendInRule"];
  }
  uint64_t v29 = [(NSDictionary *)self->_metadata valueForKey:@"timeOfDaySlotInRule"];

  if (v29)
  {
    uint64_t v30 = NSNumber;
    int v31 = [getBMItemTypeClass_2() hourOfDaySlot];
    uint64_t v32 = objc_msgSend(v30, "numberWithBool:", objc_msgSend(v24, "containsObject:", v31));
    [v9 setObject:v32 forKeyedSubscript:@"timeOfDaySlotInRule"];
  }
  id v33 = [(NSDictionary *)self->_metadata valueForKey:@"utiTypeInRule"];

  if (v33)
  {
    v34 = NSNumber;
    uint64_t v35 = [getBMItemTypeClass_2() interactionUTIType];
    uint64_t v36 = objc_msgSend(v34, "numberWithBool:", objc_msgSend(v24, "containsObject:", v35));
    [v9 setObject:v36 forKeyedSubscript:@"utiTypeInRule"];
  }
  uint64_t v37 = [(NSDictionary *)self->_metadata valueForKey:@"contentUrlInRule"];

  if (v37)
  {
    uint64_t v38 = NSNumber;
    uint64_t v39 = [getBMItemTypeClass_2() interactionContentURL];
    uint64_t v40 = objc_msgSend(v38, "numberWithBool:", objc_msgSend(v24, "containsObject:", v39));
    [v9 setObject:v40 forKeyedSubscript:@"contentUrlInRule"];
  }
  id v41 = [(NSDictionary *)self->_metadata valueForKey:@"sourceBundleIdInRule"];

  if (v41)
  {
    v42 = NSNumber;
    v43 = [getBMItemTypeClass_2() interactionSharingSourceBundleID];
    v44 = objc_msgSend(v42, "numberWithBool:", objc_msgSend(v24, "containsObject:", v43));
    [v9 setObject:v44 forKeyedSubscript:@"sourceBundleIdInRule"];
  }
  v45 = [(NSDictionary *)self->_metadata valueForKey:@"targetBundleIdInRule"];

  if (v45)
  {
    v46 = NSNumber;
    v47 = [getBMItemTypeClass_2() interactionTargetBundleID];
    v48 = objc_msgSend(v46, "numberWithBool:", objc_msgSend(v24, "containsObject:", v47));
    [v9 setObject:v48 forKeyedSubscript:@"targetBundleIdInRule"];
  }
  v49 = [(NSDictionary *)self->_metadata valueForKey:@"LOIInRule"];

  if (v49)
  {
    uint64_t v50 = NSNumber;
    uint64_t v51 = [getBMItemTypeClass_2() locationIdentifier];
    uint64_t v52 = objc_msgSend(v50, "numberWithBool:", objc_msgSend(v24, "containsObject:", v51));
    [v9 setObject:v52 forKeyedSubscript:@"LOIInRule"];
  }
  v53 = [(NSDictionary *)self->_metadata valueForKey:@"photoContactInRule"];

  if (v53)
  {
    double v54 = [getBMItemTypeClass_2() interactionPhotoContact];
    int v55 = [v24 containsObject:v54];

    if (v55)
    {
      int v56 = [v117 antecedent];
      unsigned int v57 = [v56 objectsPassingTest:&__block_literal_global_247];
      uint64_t v58 = [v57 count];

      uint64_t v59 = [NSNumber numberWithInt:v58];
      [v9 setObject:v59 forKeyedSubscript:@"photoContactInRule"];
    }
    else
    {
      [v9 setObject:&unk_1EF675D80 forKeyedSubscript:@"photoContactInRule"];
    }
  }
  uint64_t v60 = [(NSDictionary *)self->_metadata valueForKey:@"photoSceneInRule"];

  if (v60)
  {
    uint64_t v61 = [getBMItemTypeClass_2() interactionPhotoScene];
    int v62 = [v24 containsObject:v61];

    if (v62)
    {
      v63 = [v117 antecedent];
      v64 = [v63 objectsPassingTest:&__block_literal_global_252];
      uint64_t v65 = [v64 count];

      int v66 = [NSNumber numberWithInt:v65];
      [v9 setObject:v66 forKeyedSubscript:@"photoSceneInRule"];
    }
    else
    {
      [v9 setObject:&unk_1EF675D80 forKeyedSubscript:@"photoSceneInRule"];
    }
  }
  v67 = [v117 antecedent];
  v68 = (void *)[v67 mutableCopy];

  [v68 intersectSet:v8];
  int v69 = [v68 valueForKey:@"type"];
  v70 = (void *)[v69 mutableCopy];

  v71 = [(NSDictionary *)self->_metadata valueForKey:@"isWeekendOverlap"];

  if (v71)
  {
    int v72 = NSNumber;
    v73 = [getBMItemTypeClass_2() isWeekend];
    v74 = objc_msgSend(v72, "numberWithBool:", objc_msgSend(v70, "containsObject:", v73));
    [v9 setObject:v74 forKeyedSubscript:@"isWeekendOverlap"];
  }
  int v75 = [(NSDictionary *)self->_metadata valueForKey:@"timeOfDaySlotOverlap"];

  if (v75)
  {
    v76 = NSNumber;
    v77 = [getBMItemTypeClass_2() hourOfDaySlot];
    int v78 = objc_msgSend(v76, "numberWithBool:", objc_msgSend(v70, "containsObject:", v77));
    [v9 setObject:v78 forKeyedSubscript:@"timeOfDaySlotOverlap"];
  }
  v79 = [(NSDictionary *)self->_metadata valueForKey:@"utiTypeOverlap"];

  if (v79)
  {
    v80 = NSNumber;
    v81 = [getBMItemTypeClass_2() interactionUTIType];
    v82 = objc_msgSend(v80, "numberWithBool:", objc_msgSend(v70, "containsObject:", v81));
    [v9 setObject:v82 forKeyedSubscript:@"utiTypeOverlap"];
  }
  v83 = [(NSDictionary *)self->_metadata valueForKey:@"contentUrlOverlap"];

  if (v83)
  {
    v84 = NSNumber;
    v85 = [getBMItemTypeClass_2() interactionContentURL];
    v86 = objc_msgSend(v84, "numberWithBool:", objc_msgSend(v70, "containsObject:", v85));
    [v9 setObject:v86 forKeyedSubscript:@"contentUrlOverlap"];
  }
  v87 = [(NSDictionary *)self->_metadata valueForKey:@"sourceBundleIdOverlap"];

  if (v87)
  {
    v88 = NSNumber;
    v89 = [getBMItemTypeClass_2() interactionSharingSourceBundleID];
    v90 = objc_msgSend(v88, "numberWithBool:", objc_msgSend(v70, "containsObject:", v89));
    [v9 setObject:v90 forKeyedSubscript:@"sourceBundleIdOverlap"];
  }
  v91 = [(NSDictionary *)self->_metadata valueForKey:@"targetBundleIdOverlap"];

  if (v91)
  {
    v92 = NSNumber;
    v93 = [getBMItemTypeClass_2() interactionTargetBundleID];
    v94 = objc_msgSend(v92, "numberWithBool:", objc_msgSend(v70, "containsObject:", v93));
    [v9 setObject:v94 forKeyedSubscript:@"targetBundleIdOverlap"];
  }
  v95 = [(NSDictionary *)self->_metadata valueForKey:@"LOIOverlap"];

  if (v95)
  {
    v96 = NSNumber;
    v97 = [getBMItemTypeClass_2() locationIdentifier];
    v98 = objc_msgSend(v96, "numberWithBool:", objc_msgSend(v70, "containsObject:", v97));
    [v9 setObject:v98 forKeyedSubscript:@"LOIOverlap"];
  }
  v99 = [(NSDictionary *)self->_metadata valueForKey:@"photoContactOverlap"];

  if (v99)
  {
    v100 = [getBMItemTypeClass_2() interactionPhotoContact];
    int v101 = [v70 containsObject:v100];

    if (v101)
    {
      v102 = [v68 objectsPassingTest:&__block_literal_global_278];
      uint64_t v103 = [v102 count];

      v104 = [NSNumber numberWithInt:v103];
      [v9 setObject:v104 forKeyedSubscript:@"photoContactOverlap"];
    }
    else
    {
      [v9 setObject:&unk_1EF675D80 forKeyedSubscript:@"photoContactOverlap"];
    }
  }
  v105 = [(NSDictionary *)self->_metadata valueForKey:@"photoSceneOverlap"];

  if (v105)
  {
    v106 = [getBMItemTypeClass_2() interactionPhotoScene];
    int v107 = [v70 containsObject:v106];

    if (v107)
    {
      v108 = [v68 objectsPassingTest:&__block_literal_global_283];
      uint64_t v109 = [v108 count];

      id v110 = [NSNumber numberWithInt:v109];
      [v9 setObject:v110 forKeyedSubscript:@"photoSceneOverlap"];
    }
    else
    {
      [v9 setObject:&unk_1EF675D80 forKeyedSubscript:@"photoSceneOverlap"];
    }
  }
  v111 = [(NSDictionary *)self->_metadata valueForKey:@"support"];

  if (v111)
  {
    uint64_t v112 = NSNumber;
    [v117 support];
    unsigned int v113 = objc_msgSend(v112, "numberWithDouble:");
    [v9 setObject:v113 forKeyedSubscript:@"support"];
  }
  uint64_t v114 = [(NSDictionary *)self->_metadata valueForKey:@"confidence"];

  if (v114)
  {
    uint64_t v115 = NSNumber;
    [v117 confidence];
    uint64_t v116 = objc_msgSend(v115, "numberWithDouble:");
    [v9 setObject:v116 forKeyedSubscript:@"confidence"];
  }
}

- (BOOL)constantFeaturesReady
{
  return self->_constantFeaturesReady;
}

- (void)setConstantFeaturesReady:(BOOL)a3
{
  self->_constantFeaturesReady = a3;
}

- (BOOL)contextFeaturesReady
{
  return self->_contextFeaturesReady;
}

- (void)setContextFeaturesReady:(BOOL)a3
{
  self->_contextFeaturesReady = a3;
}

- (NSMutableDictionary)constantFeatures
{
  return self->_constantFeatures;
}

- (void)setConstantFeatures:(id)a3
{
}

- (NSMutableDictionary)contextFeatures
{
  return self->_contextFeatures;
}

- (void)setContextFeatures:(id)a3
{
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_contextFeatures, 0);

  objc_storeStrong((id *)&self->_constantFeatures, 0);
}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)extractConstantFeaturesForMLModelIntoFeatures:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end