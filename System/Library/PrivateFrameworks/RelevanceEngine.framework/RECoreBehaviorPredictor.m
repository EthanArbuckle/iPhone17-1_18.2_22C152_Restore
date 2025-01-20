@interface RECoreBehaviorPredictor
+ (double)updateInterval;
+ (id)supportedFeatures;
- (id)_bmtypeForShortcutType:(unint64_t)a3 filterLevel:(unint64_t)a4;
- (id)_init;
- (id)_retrieveFeatureValueForItemType:(id)a3 shortcutIdentifier:(id)a4 antecedentType:(id)a5 antecedentValue:(id)a6;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
- (void)pause;
- (void)resume;
- (void)update;
@end

@implementation RECoreBehaviorPredictor

+ (id)supportedFeatures
{
  v11[6] = *MEMORY[0x263EF8340];
  v2 = +[REFeature coreBehaviorTimePredictionFeature];
  v11[0] = v2;
  v3 = +[REFeature coreBehaviorTimeCoarsePredictionFeature];
  v11[1] = v3;
  v4 = +[REFeature coreBehaviorDayPredictionFeature];
  v11[2] = v4;
  v5 = +[REFeature coreBehaviorDayCoarsePredictionFeature];
  v11[3] = v5;
  v6 = +[REFeature coreBehaviorLocationPredictionFeature];
  v11[4] = v6;
  v7 = +[REFeature coreBehaviorLocationCoarsePredictionFeature];
  v11[5] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:6];
  v9 = +[REFeatureSet featureSetWithFeatures:v8];

  return v9;
}

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)RECoreBehaviorPredictor;
  v2 = [(REPredictor *)&v11 _init];
  if (v2)
  {
    if (BehaviorMinerLibraryCore())
    {
      uint64_t v13 = 0;
      v14 = &v13;
      uint64_t v15 = 0x2050000000;
      v3 = (void *)getBMBehaviorRetrieverClass_softClass;
      uint64_t v16 = getBMBehaviorRetrieverClass_softClass;
      if (!getBMBehaviorRetrieverClass_softClass)
      {
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __getBMBehaviorRetrieverClass_block_invoke;
        v12[3] = &unk_2644BC768;
        v12[4] = &v13;
        __getBMBehaviorRetrieverClass_block_invoke((uint64_t)v12);
        v3 = (void *)v14[3];
      }
      v4 = v3;
      _Block_object_dispose(&v13, 8);
      id v5 = objc_alloc_init(v4);
      v6 = (void *)v2[8];
      v2[8] = v5;
    }
    v7 = (void *)v2[9];
    v2[9] = MEMORY[0x263EFFA68];

    uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:512 capacity:2];
    v9 = (void *)v2[10];
    v2[10] = v8;
  }
  return v2;
}

+ (double)updateInterval
{
  return 3600.0;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  v61 = self;
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v13 = [v10 relevanceProviders];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (!v14)
  {

    v31 = 0;
    v42 = 0;
    v43 = 0;
    goto LABEL_35;
  }
  uint64_t v15 = v14;
  id v62 = v10;
  v63 = v9;
  v64 = 0;
  uint64_t v65 = 0;
  v66 = 0;
  uint64_t v16 = *(void *)v68;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v68 != v16) {
        objc_enumerationMutation(v13);
      }
      v18 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v18;
        v20 = [v19 feature];
        v21 = +[REFeature coreBehaviorShortcutTypeFeature];
        int v22 = [v20 isEqual:v21];

        if (v22)
        {
          uint64_t v65 = REIntegerValueForTaggedPointer([v19 value]);
        }
        else
        {
          v23 = [v19 feature];
          v24 = +[REFeature coreBehaviorEventIdentifierHashFeature];
          int v25 = [v23 isEqual:v24];

          if (v25)
          {
            uint64_t v26 = REStringValueForTaggedPointer([v19 value]);

            v66 = (void *)v26;
          }
          else
          {
            v27 = [v19 feature];
            v28 = +[REFeature coreBehaviorAppIdentifierHashFeature];
            int v29 = [v27 isEqual:v28];

            if (v29)
            {
              uint64_t v30 = REStringValueForTaggedPointer([v19 value]);

              v64 = (void *)v30;
            }
          }
        }
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v67 objects:v71 count:16];
  }
  while (v15);

  if (v65)
  {
    id v9 = v63;
    v31 = v66;
    if (!BehaviorMinerLibraryCore())
    {
LABEL_32:
      v43 = 0;
LABEL_33:
      id v10 = v62;
      goto LABEL_34;
    }
    v32 = +[REFeature coreBehaviorTimePredictionFeature];
    int v33 = [v63 isEqual:v32];

    if (v33)
    {
      id v34 = v66;
      v35 = [getBMItemTypeClass() hourOfDay];
      v36 = NSNumber;
      uint64_t v37 = 96;
LABEL_20:
      v38 = v61;
      uint64_t v39 = objc_msgSend(v36, "numberWithUnsignedInteger:", *(Class *)((char *)&v61->super.super.super.super.isa + v37), v61);
LABEL_21:
      v40 = (void *)v39;
      uint64_t v41 = 0;
      goto LABEL_28;
    }
    v44 = +[REFeature coreBehaviorTimeCoarsePredictionFeature];
    int v45 = [v63 isEqual:v44];

    if (v45)
    {
      id v34 = v64;
      v35 = [getBMItemTypeClass() hourOfDay];
      v46 = NSNumber;
      uint64_t v47 = 96;
    }
    else
    {
      v53 = +[REFeature coreBehaviorDayPredictionFeature];
      int v54 = [v63 isEqual:v53];

      if (v54)
      {
        id v34 = v66;
        v35 = [getBMItemTypeClass() dayOfWeek];
        v36 = NSNumber;
        uint64_t v37 = 88;
        goto LABEL_20;
      }
      v55 = +[REFeature coreBehaviorDayCoarsePredictionFeature];
      int v56 = [v63 isEqual:v55];

      if (!v56)
      {
        v57 = +[REFeature coreBehaviorLocationPredictionFeature];
        int v58 = [v63 isEqual:v57];

        if (v58)
        {
          id v34 = v66;
          v35 = [getBMItemTypeClass() locationIdentifier];
          v38 = v61;
          uint64_t v39 = [(NSMapTable *)v61->_locations objectForKey:v11];
          goto LABEL_21;
        }
        v59 = +[REFeature coreBehaviorLocationCoarsePredictionFeature];
        int v60 = [v63 isEqual:v59];

        if (!v60)
        {
          v43 = 0;
          goto LABEL_33;
        }
        id v34 = v64;
        v35 = [getBMItemTypeClass() locationIdentifier];
        v38 = v61;
        uint64_t v48 = [(NSMapTable *)v61->_locations objectForKey:v11];
LABEL_27:
        v40 = (void *)v48;
        uint64_t v41 = 1;
LABEL_28:
        v49 = -[RECoreBehaviorPredictor _bmtypeForShortcutType:filterLevel:](v38, "_bmtypeForShortcutType:filterLevel:", v65, v41, v61);
        v43 = [(RECoreBehaviorPredictor *)v38 _retrieveFeatureValueForItemType:v49 shortcutIdentifier:v34 antecedentType:v35 antecedentValue:v40];

        if (v43)
        {
          id v50 = v43;
          int v51 = 1;
        }
        else
        {
          int v51 = 0;
        }

        v31 = v66;
        if (v51) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      id v34 = v64;
      v35 = [getBMItemTypeClass() dayOfWeek];
      v46 = NSNumber;
      uint64_t v47 = 88;
    }
    v38 = v61;
    uint64_t v48 = objc_msgSend(v46, "numberWithUnsignedInteger:", *(Class *)((char *)&v61->super.super.super.super.isa + v47), v61);
    goto LABEL_27;
  }
  v43 = 0;
  id v10 = v62;
  id v9 = v63;
  v31 = v66;
LABEL_34:
  v42 = v64;
LABEL_35:

  return v43;
}

- (id)_retrieveFeatureValueForItemType:(id)a3 shortcutIdentifier:(id)a4 antecedentType:(id)a5 antecedentValue:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = 0;
  if (v13 && v11 && v10 && v12)
  {
    uint64_t v15 = (void *)[objc_alloc((Class)getBMItemClass()) initWithType:v12 value:v13];
    uint64_t v16 = (void *)[objc_alloc((Class)getBMItemClass()) initWithType:v10 value:v11];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v17 = self->_rules;
    uint64_t v14 = (void *)[(NSArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      id v25 = v13;
      id v26 = v12;
      id v27 = v11;
      id v28 = v10;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v17);
          }
          v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v21 = objc_msgSend(v20, "antecedent", v25, v26, v27, v28, (void)v29);
          if ([v21 containsObject:v15])
          {
            int v22 = [v20 consequent];
            char v23 = [v22 containsObject:v16];

            if (v23)
            {
              [v20 confidence];
              uint64_t v14 = +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        uint64_t v14 = (void *)[(NSArray *)v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
LABEL_16:
      id v11 = v27;
      id v10 = v28;
      id v13 = v25;
      id v12 = v26;
    }
  }
  return v14;
}

- (id)_bmtypeForShortcutType:(unint64_t)a3 filterLevel:(unint64_t)a4
{
  if (a3 == 1)
  {
    if (a4 == 1)
    {
      id v5 = &selRef_relevanceCoarseIntentHash;
      goto LABEL_14;
    }
    if (!a4)
    {
      id v5 = &selRef_relevanceIntentHash;
      goto LABEL_14;
    }
  }
  else if (a3 == 2)
  {
    if (a4 == 1)
    {
      id v5 = &selRef_relevanceCoarseAppActivityHash;
      goto LABEL_14;
    }
    if (!a4)
    {
      id v5 = &selRef_relevanceAppActivityHash;
LABEL_14:
      uint64_t v8 = *v5;
      if (!*v5) {
        goto LABEL_18;
      }
      BMItemTypeClass = getBMItemTypeClass();
      if (!BMItemTypeClass) {
        goto LABEL_19;
      }
      getBMItemTypeClass();
      if (objc_opt_respondsToSelector())
      {
        id v9 = (void (*)(void))[getBMItemTypeClass() methodForSelector:v8];
        BMItemTypeClass = v9();
      }
      else
      {
LABEL_18:
        BMItemTypeClass = 0;
      }
LABEL_19:
      return BMItemTypeClass;
    }
  }
  BMItemTypeClass = 0;
  return BMItemTypeClass;
}

- (void)update
{
  v65[3] = *MEMORY[0x263EF8340];
  [(REPredictor *)self beginFetchingData];
  if (BehaviorMinerLibraryCore())
  {
    v2 = (void *)MEMORY[0x263EFFA08];
    v3 = [getBMItemTypeClass() hourOfDay];
    v65[0] = v3;
    uint64_t v4 = [getBMItemTypeClass() dayOfWeek];
    v65[1] = v4;
    id v5 = [getBMItemTypeClass() locationIdentifier];
    v65[2] = v5;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v65 count:3];
    id obj = [v2 setWithArray:v6];

    v7 = [MEMORY[0x263EFF9C0] set];
    uint64_t v8 = [(RECoreBehaviorPredictor *)self _bmtypeForShortcutType:1 filterLevel:0];
    if (v8) {
      [v7 addObject:v8];
    }

    id v9 = [(RECoreBehaviorPredictor *)self _bmtypeForShortcutType:1 filterLevel:1];
    if (v9) {
      [v7 addObject:v9];
    }

    id v10 = [(RECoreBehaviorPredictor *)self _bmtypeForShortcutType:2 filterLevel:0];
    if (v10) {
      [v7 addObject:v10];
    }

    id v11 = [(RECoreBehaviorPredictor *)self _bmtypeForShortcutType:2 filterLevel:1];
    if (v11) {
      [v7 addObject:v11];
    }

    id v12 = [getBMRetrievalFilterClass() filterWithOperand:1 inclusionOperator:0 types:obj];
    id v13 = [getBMRetrievalFilterClass() filterWithOperand:2 inclusionOperator:0 types:v7];
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2050000000;
    uint64_t v14 = (void *)getBMBehaviorStorageClass_softClass;
    uint64_t v61 = getBMBehaviorStorageClass_softClass;
    if (!getBMBehaviorStorageClass_softClass)
    {
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __getBMBehaviorStorageClass_block_invoke;
      v57[3] = &unk_2644BC768;
      v57[4] = &v58;
      __getBMBehaviorStorageClass_block_invoke((uint64_t)v57);
      uint64_t v14 = (void *)v59[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v58, 8);
    uint64_t v16 = [v15 defaultURL];
    if (v16
      && ([MEMORY[0x263F08850] defaultManager],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v16 path],
          uint64_t v18 = objc_claimAutoreleasedReturnValue(),
          int v19 = [v17 fileExistsAtPath:v18],
          v18,
          v17,
          v19))
    {
      retriever = self->_retriever;
      v21 = (void *)MEMORY[0x263EFFA08];
      v64[0] = v12;
      v64[1] = v13;
      int v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:2];
      char v23 = [v21 setWithArray:v22];
      v24 = [(BMBehaviorRetriever *)retriever retrieveRulesWithFilters:v23];

      id v25 = (void *)MEMORY[0x263F08B30];
      id v26 = NSStringFromSelector(sel_confidence);
      id v27 = [v25 sortDescriptorWithKey:v26 ascending:0];

      id v28 = (void *)MEMORY[0x263F08B30];
      long long v29 = NSStringFromSelector(sel_support);
      long long v30 = [v28 sortDescriptorWithKey:v29 ascending:0];

      v63[0] = v27;
      v63[1] = v30;
      uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
      long long v32 = [v24 sortedArrayUsingDescriptors:v31];

      LODWORD(v31) = [(NSArray *)self->_rules isEqualToArray:v32];
      rules = self->_rules;
      self->_rules = v32;

      int v34 = v31 ^ 1;
    }
    else
    {
      int v34 = [(NSArray *)self->_rules count] != 0;
      id v27 = self->_rules;
      self->_rules = (NSArray *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    int v34 = 0;
  }
  v35 = (void *)[(NSMapTable *)self->_locations copy];
  [(NSMapTable *)self->_locations removeAllObjects];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obja = [(REPredictor *)self engines];
  uint64_t v36 = [obja countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v36)
  {
    uint64_t v37 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v54 != v37) {
          objc_enumerationMutation(obja);
        }
        uint64_t v39 = *(void *)(*((void *)&v53 + 1) + 8 * i);
        v40 = +[RESingleton sharedInstance];
        uint64_t v41 = [v40 predictedLocationIdentifierForEngine:v39];

        [(NSMapTable *)self->_locations setObject:v41 forKey:v39];
        v42 = [v35 objectForKey:v39];
        v43 = v42;
        if (v34 & 1 | (v42 == 0)) {
          int v34 = 1;
        }
        else {
          int v34 = [v42 isEqualToString:v41] ^ 1;
        }
      }
      uint64_t v36 = [obja countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v36);
  }

  v44 = [MEMORY[0x263EFF910] date];
  int v45 = [MEMORY[0x263EFF8F0] currentCalendar];
  unint64_t v46 = [v45 component:32 fromDate:v44];
  if (v34)
  {
    self->_hourValue = v46;
    unint64_t v47 = [v45 component:16 fromDate:v44];
  }
  else
  {
    BOOL v48 = self->_hourValue == v46;
    self->_hourValue = v46;
    unint64_t v47 = [v45 component:16 fromDate:v44];
    if (v48)
    {
      BOOL v49 = self->_dayValue == v47;
      self->_dayValue = v47;
      [(REPredictor *)self finishFetchingData];
      if (v49) {
        goto LABEL_35;
      }
      goto LABEL_34;
    }
  }
  self->_dayValue = v47;
  [(REPredictor *)self finishFetchingData];
LABEL_34:
  [(REPredictor *)self updateObservers];
LABEL_35:
}

- (void)resume
{
  id v3 = +[RESingleton sharedInstance];
  [v3 addObserver:self];
}

- (void)pause
{
  id v3 = +[RESingleton sharedInstance];
  [v3 removeObserver:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_retriever, 0);
}

@end