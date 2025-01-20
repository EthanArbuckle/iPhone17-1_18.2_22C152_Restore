@interface PGMeaningfulEventSceneCollectionTrait
- (BOOL)accumulateHighConfidenceAssetCounts;
- (PGMeaningfulEventSceneCollectionTrait)initWithNodes:(id)a3;
- (PGMeaningfulEventSceneCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4;
- (double)minimumRatioOfHighConfidenceAssets;
- (id)debugDescriptionWithMomentNode:(id)a3;
- (unint64_t)minimumNumberOfHighConfidenceAssets;
- (unint64_t)minimumNumberOfNegativeHighConfidenceAssets;
- (void)setAccumulateHighConfidenceAssetCounts:(BOOL)a3;
- (void)setMinimumNumberOfHighConfidenceAssets:(unint64_t)a3;
- (void)setMinimumNumberOfNegativeHighConfidenceAssets:(unint64_t)a3;
- (void)setMinimumRatioOfHighConfidenceAssets:(double)a3;
@end

@implementation PGMeaningfulEventSceneCollectionTrait

- (void)setAccumulateHighConfidenceAssetCounts:(BOOL)a3
{
  self->_accumulateHighConfidenceAssetCounts = a3;
}

- (BOOL)accumulateHighConfidenceAssetCounts
{
  return self->_accumulateHighConfidenceAssetCounts;
}

- (void)setMinimumRatioOfHighConfidenceAssets:(double)a3
{
  self->_minimumRatioOfHighConfidenceAssets = a3;
}

- (double)minimumRatioOfHighConfidenceAssets
{
  return self->_minimumRatioOfHighConfidenceAssets;
}

- (void)setMinimumNumberOfNegativeHighConfidenceAssets:(unint64_t)a3
{
  self->_minimumNumberOfNegativeHighConfidenceAssets = a3;
}

- (unint64_t)minimumNumberOfNegativeHighConfidenceAssets
{
  return self->_minimumNumberOfNegativeHighConfidenceAssets;
}

- (void)setMinimumNumberOfHighConfidenceAssets:(unint64_t)a3
{
  self->_minimumNumberOfHighConfidenceAssets = a3;
}

- (unint64_t)minimumNumberOfHighConfidenceAssets
{
  return self->_minimumNumberOfHighConfidenceAssets;
}

- (id)debugDescriptionWithMomentNode:(id)a3
{
  id v4 = a3;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __72__PGMeaningfulEventSceneCollectionTrait_debugDescriptionWithMomentNode___block_invoke;
  v25 = &unk_1E68EE098;
  id v26 = v4;
  id v5 = v4;
  v6 = (void (**)(void *, void *))_Block_copy(&aBlock);
  v7 = [(PGMeaningfulEventCollectionTrait *)self nodes];
  v8 = [v7 set];
  v9 = v6[2](v6, v8);

  v10 = [(PGMeaningfulEventCollectionTrait *)self negativeNodes];
  v11 = [v10 set];
  v6[2](v6, v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = [(__CFString *)v12 count];
  v14 = NSString;
  v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  v17 = (void *)v16;
  v18 = @" ";
  v19 = &stru_1F283BC78;
  if (v13) {
    v19 = v12;
  }
  else {
    v18 = &stru_1F283BC78;
  }
  v20 = [v14 stringWithFormat:@"<%@: %p> %@%@%@", v16, self, v9, v18, v19, aBlock, v23, v24, v25];

  return v20;
}

id __72__PGMeaningfulEventSceneCollectionTrait_debugDescriptionWithMomentNode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v24 = [*(id *)(a1 + 32) collection];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v9 = [v8 collection];
        v10 = +[PGGraphEdgeCollection edgesFromNodes:v24 toNodes:v9];
        v11 = [v10 anyEdge];

        LODWORD(v9) = [v11 isReliable];
        uint64_t v12 = [v11 numberOfAssets];
        uint64_t v13 = [v11 numberOfHighConfidenceAssets];
        uint64_t v14 = [v11 numberOfSearchConfidenceAssets];
        v15 = NSString;
        uint64_t v16 = [v8 label];
        [v11 confidence];
        v18 = @"NO";
        if (v9) {
          v18 = @"YES";
        }
        v19 = [v15 stringWithFormat:@"%@ (confidence %.2f, #assets %lu, #highConf. %lu, #searchConf. %lu, reliable %@)", v16, v17, v12, v13, v14, v18];

        v20 = [NSNumber numberWithUnsignedInteger:v13];
        [v25 setObject:v20 forKeyedSubscript:v19];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }

  v21 = [v25 keysSortedByValueUsingSelector:sel_compare_];

  return v21;
}

- (PGMeaningfulEventSceneCollectionTrait)initWithNodes:(id)a3 negativeNodes:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGMeaningfulEventSceneCollectionTrait;
  result = [(PGMeaningfulEventCollectionTrait *)&v5 initWithNodes:a3 negativeNodes:a4];
  if (result)
  {
    result->_minimumNumberOfHighConfidenceAssets = 1;
    result->_minimumNumberOfNegativeHighConfidenceAssets = 1;
    result->_minimumRatioOfHighConfidenceAssets = 0.0;
  }
  return result;
}

- (PGMeaningfulEventSceneCollectionTrait)initWithNodes:(id)a3
{
  return [(PGMeaningfulEventSceneCollectionTrait *)self initWithNodes:a3 negativeNodes:0];
}

@end