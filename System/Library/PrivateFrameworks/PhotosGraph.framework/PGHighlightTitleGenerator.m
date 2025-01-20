@interface PGHighlightTitleGenerator
+ (id)commonMeaningLabelForTitleUsingMomentNodes:(id)a3;
+ (id)meaningLabelsSortedByPriority;
- (BOOL)createVerboseTitle;
- (PGEventEnrichment)collection;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGHighlightTitleGenerator)initWithCollection:(id)a3 curatedAssetCollection:(id)a4 keyAsset:(id)a5 createVerboseTitle:(BOOL)a6 titleGenerationContext:(id)a7;
- (PGHighlightTitleGenerator)initWithCollection:(id)a3 filteredMomentNodes:(id)a4 curatedAssetCollection:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 titleGenerationContext:(id)a8;
- (PGTitleTuple)titleTuple;
- (PHAsset)keyAsset;
- (PHAssetCollection)curatedAssetCollection;
- (void)_generateTitleTuples;
- (void)setCollection:(id)a3;
- (void)setCreateVerboseTitle:(BOOL)a3;
- (void)setCuratedAssetCollection:(id)a3;
- (void)setKeyAsset:(id)a3;
- (void)setMomentNodes:(id)a3;
- (void)setTitleTuple:(id)a3;
@end

@implementation PGHighlightTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTuple, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

- (void)setCreateVerboseTitle:(BOOL)a3
{
  self->_createVerboseTitle = a3;
}

- (BOOL)createVerboseTitle
{
  return self->_createVerboseTitle;
}

- (void)setTitleTuple:(id)a3
{
}

- (void)setKeyAsset:(id)a3
{
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setCuratedAssetCollection:(id)a3
{
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (void)setMomentNodes:(id)a3
{
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (void)setCollection:(id)a3
{
}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (void)_generateTitleTuples
{
  v3 = [(PGHighlightTitleGenerator *)self collection];
  if ([v3 isAggregation])
  {
    titleTuple = self->_titleTuple;
    self->_titleTuple = 0;

    v5 = +[PGLogging sharedLogging];
    v6 = [v5 loggingConnection];

    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1805000, &v6->super.super, OS_LOG_TYPE_INFO, "Collection is aggregation, skipping title generation", buf, 2u);
    }
    goto LABEL_23;
  }
  if (![v3 isTrip])
  {
    v7 = [(MAElementCollection *)self->_momentNodes temporarySet];
    v8 = [(id)objc_opt_class() commonMeaningLabelForTitleUsingMomentNodes:v7];
    if (!v8) {
      goto LABEL_15;
    }
    v9 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
    int v10 = [v9 containsObject:v8];

    if (!v10) {
      goto LABEL_15;
    }
    if (+[PGUserDefaults isAlwaysShowingHolidayCalendarEvents])
    {
      if (([v8 isEqualToString:@"HolidayEvent"] & 1) == 0)
      {
LABEL_14:
        v6 = [[PGSpecBasedHighlightTitleGenerator alloc] initWithMomentNodes:v7 meaningLabel:v8 createVerboseTitle:self->_createVerboseTitle titleGenerationContext:self->_titleGenerationContext];
        if (v6)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_15:
        v12 = [(PGGraphMomentNodeCollection *)self->_momentNodes publicEventNodes];
        v13 = [v12 categoryNodes];
        v14 = [(PGTitleGenerationContext *)self->_titleGenerationContext appleEventsCategoryNodes];
        int v15 = [v13 intersectsCollection:v14];

        if (!v15
          || (v16 = [PGSpecBasedHighlightTitleGenerator alloc],
              [MEMORY[0x1E4F76D68] appleEvents],
              v17 = objc_claimAutoreleasedReturnValue(),
              v6 = [(PGSpecBasedHighlightTitleGenerator *)v16 initWithMomentNodes:v7 meaningLabel:v17 createVerboseTitle:self->_createVerboseTitle titleGenerationContext:self->_titleGenerationContext], v17, !v6))
        {
          v18 = [PGTitleGenerator alloc];
          v19 = [(PGHighlightTitleGenerator *)self keyAsset];
          v6 = [(PGTitleGenerator *)v18 initWithMomentNodes:v7 referenceDateInterval:0 keyAsset:v19 curatedAssetCollection:self->_curatedAssetCollection assetCollection:self->_curatedAssetCollection type:0 titleGenerationContext:self->_titleGenerationContext];

          [(PGTitleGenerator *)v6 setIsForHighlight:1];
        }
        goto LABEL_18;
      }
    }
    else
    {
      BOOL v11 = +[PGUserDefaults isShowingHolidayCalendarEvents];
      if (([v8 isEqualToString:@"HolidayEvent"] & 1) == 0) {
        goto LABEL_14;
      }
      if (!v11) {
        goto LABEL_15;
      }
    }
    if (self->_createVerboseTitle) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v6 = [[PGTripHighlightTitleGenerator alloc] initWithCollection:v3 titleGenerationContext:self->_titleGenerationContext];
LABEL_19:
  [(PGTitleGenerator *)v6 setLineBreakBehavior:2];
  if (self->_createVerboseTitle) {
    uint64_t v20 = 3;
  }
  else {
    uint64_t v20 = 2;
  }
  [(PGTitleGenerator *)v6 setPreferredTitleType:v20];
  v21 = [(PGTitleGenerator *)v6 title];
  v22 = +[PGTitle titleWithString:&stru_1F283BC78 category:0];
  v23 = [[PGTitleTuple alloc] initWithWithTitle:v21 subtitle:v22];
  v24 = self->_titleTuple;
  self->_titleTuple = v23;

LABEL_23:
}

- (PGTitleTuple)titleTuple
{
  titleTuple = self->_titleTuple;
  if (!titleTuple)
  {
    [(PGHighlightTitleGenerator *)self _generateTitleTuples];
    titleTuple = self->_titleTuple;
  }
  return titleTuple;
}

- (PGHighlightTitleGenerator)initWithCollection:(id)a3 filteredMomentNodes:(id)a4 curatedAssetCollection:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 titleGenerationContext:(id)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)PGHighlightTitleGenerator;
  v18 = [(PGHighlightTitleGenerator *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_collection, a3);
    objc_storeStrong((id *)&v19->_momentNodes, a4);
    objc_storeStrong((id *)&v19->_curatedAssetCollection, a5);
    objc_storeStrong((id *)&v19->_keyAsset, a6);
    v19->_createVerboseTitle = a7;
    objc_storeStrong((id *)&v19->_titleGenerationContext, a8);
  }

  return v19;
}

- (PGHighlightTitleGenerator)initWithCollection:(id)a3 curatedAssetCollection:(id)a4 keyAsset:(id)a5 createVerboseTitle:(BOOL)a6 titleGenerationContext:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [v15 eventEnrichmentMomentNodes];
  id v17 = [(PGHighlightTitleGenerator *)self initWithCollection:v15 filteredMomentNodes:v16 curatedAssetCollection:v14 keyAsset:v13 createVerboseTitle:v7 titleGenerationContext:v12];

  return v17;
}

+ (id)meaningLabelsSortedByPriority
{
  if (meaningLabelsSortedByPriority_onceToken != -1) {
    dispatch_once(&meaningLabelsSortedByPriority_onceToken, &__block_literal_global_16734);
  }
  v2 = (void *)meaningLabelsSortedByPriority_sortedLabels;
  return v2;
}

void __58__PGHighlightTitleGenerator_meaningLabelsSortedByPriority__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", @"Birthday", @"HolidayEvent", 0);
  v1 = (void *)meaningLabelsSortedByPriority_sortedLabels;
  meaningLabelsSortedByPriority_sortedLabels = v0;

  v2 = (void *)MEMORY[0x1E4F1CA48];
  v3 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
  id v4 = [v2 arrayWithArray:v3];

  [v4 removeObjectsInArray:meaningLabelsSortedByPriority_sortedLabels];
  [(id)meaningLabelsSortedByPriority_sortedLabels addObjectsFromArray:v4];
}

+ (id)commonMeaningLabelForTitleUsingMomentNodes:(id)a3
{
  id v25 = a1;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v3;
  uint64_t v28 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  uint64_t v5 = 0;
  if (v28)
  {
    uint64_t v27 = *(void *)v43;
    do
    {
      uint64_t v6 = 0;
      do
      {
        uint64_t v30 = v5;
        if (*(void *)v43 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        BOOL v7 = *(void **)(*((void *)&v42 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "numberOfAssets", v25);
        v9 = [v7 meaningLabels];
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v39 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              id v15 = [v4 objectForKeyedSubscript:v14];
              id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + v8);
              [v4 setObject:v16 forKeyedSubscript:v14];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v11);
        }
        uint64_t v5 = v8 + v30;

        uint64_t v6 = v29 + 1;
      }
      while (v29 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v28);
  }

  id v17 = [MEMORY[0x1E4F1CA80] set];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __72__PGHighlightTitleGenerator_commonMeaningLabelForTitleUsingMomentNodes___block_invoke;
  v35[3] = &unk_1E68E7CF8;
  uint64_t v37 = v5;
  id v18 = v17;
  id v36 = v18;
  [v4 enumerateKeysAndObjectsUsingBlock:v35];
  [(id)objc_opt_class() meaningLabelsSortedByPriority];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = (id)[v19 countByEnumeratingWithState:&v31 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v32;
    while (2)
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v19);
        }
        objc_super v23 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        if (objc_msgSend(v18, "containsObject:", v23, v25))
        {
          id v20 = v23;
          goto LABEL_25;
        }
      }
      id v20 = (id)[v19 countByEnumeratingWithState:&v31 objects:v46 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  return v20;
}

void __72__PGHighlightTitleGenerator_commonMeaningLabelForTitleUsingMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  [a3 doubleValue];
  double v6 = v5 / (double)*(unint64_t *)(a1 + 40);
  if (v6 >= 0.75 || v6 >= 0.5 && [v7 isEqualToString:@"Birthday"]) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

@end