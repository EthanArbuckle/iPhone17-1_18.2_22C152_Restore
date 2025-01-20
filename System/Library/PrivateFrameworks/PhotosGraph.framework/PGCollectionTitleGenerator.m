@interface PGCollectionTitleGenerator
- (BOOL)forDiagnostics;
- (NSSet)whitelistedMeaningLabels;
- (PGCollectionTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6;
- (PGCollectionTitleGenerator)initWithCollection:(id)a3 titleGenerationContext:(id)a4;
- (PGCollectionTitleGenerator)initWithCollection:(id)a3 whitelistedMeaningLabels:(id)a4 titleGenerationContext:(id)a5;
- (PGEventEnrichment)collection;
- (PGTitleTuple)titleTuple;
- (PHAsset)keyAsset;
- (PHAssetCollection)curatedAssetCollection;
- (id)_meaningLabelForTitle;
- (id)_sortedMeaningLabels;
- (void)_generateTitleTuples;
- (void)setCollection:(id)a3;
- (void)setCuratedAssetCollection:(id)a3;
- (void)setForDiagnostics:(BOOL)a3;
- (void)setKeyAsset:(id)a3;
- (void)setTitleTuple:(id)a3;
- (void)setWhitelistedMeaningLabels:(id)a3;
@end

@implementation PGCollectionTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedMeaningLabels, 0);
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_titleTuple, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
}

- (void)setWhitelistedMeaningLabels:(id)a3
{
}

- (NSSet)whitelistedMeaningLabels
{
  return self->_whitelistedMeaningLabels;
}

- (void)setForDiagnostics:(BOOL)a3
{
  self->_forDiagnostics = a3;
}

- (BOOL)forDiagnostics
{
  return self->_forDiagnostics;
}

- (void)setCuratedAssetCollection:(id)a3
{
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (void)setKeyAsset:(id)a3
{
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (void)setTitleTuple:(id)a3
{
}

- (void)setCollection:(id)a3
{
}

- (PGEventEnrichment)collection
{
  return self->_collection;
}

- (id)_sortedMeaningLabels
{
  if (_sortedMeaningLabels_onceToken != -1) {
    dispatch_once(&_sortedMeaningLabels_onceToken, &__block_literal_global_16933);
  }
  v2 = (void *)_sortedMeaningLabels_sortedLabels;
  return v2;
}

uint64_t __50__PGCollectionTitleGenerator__sortedMeaningLabels__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CA48];
  v1 = +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels];
  uint64_t v2 = [v0 arrayWithArray:v1];
  v3 = (void *)_sortedMeaningLabels_sortedLabels;
  _sortedMeaningLabels_sortedLabels = v2;

  [(id)_sortedMeaningLabels_sortedLabels removeObject:@"HolidayEvent"];
  v4 = (void *)_sortedMeaningLabels_sortedLabels;
  return [v4 addObject:@"HolidayEvent"];
}

- (id)_meaningLabelForTitle
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(PGEventEnrichment *)self->_collection meaningLabels];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(PGCollectionTitleGenerator *)self _sortedMeaningLabels];
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v3 containsObject:v8])
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_generateTitleTuples
{
  v3 = [(PGCollectionTitleGenerator *)self collection];
  if ([v3 isTrip])
  {
    v4 = [(PGDefaultCollectionTitleGenerator *)[PGTripCollectionTitleGenerator alloc] initWithCollection:self->_collection keyAsset:self->_keyAsset curatedAssetCollection:self->_curatedAssetCollection titleGenerationContext:self->_titleGenerationContext];
  }
  else
  {
    id v5 = [(PGCollectionTitleGenerator *)self _meaningLabelForTitle];
    if ((![(NSSet *)self->_whitelistedMeaningLabels count]
       || [(NSSet *)self->_whitelistedMeaningLabels containsObject:v5])
      && (+[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels"), uint64_t v6 = objc_claimAutoreleasedReturnValue(), v7 = [v6 containsObject:v5], v6, v7))
    {
      v8 = [(PGEventEnrichment *)self->_collection reliableMeaningLabels];
      uint64_t v9 = [v8 containsObject:v5];

      long long v10 = [[PGMeaningfulEventTitleGenerator alloc] initWithCollection:self->_collection meaningLabel:v5 meaningIsReliable:v9 titleGenerationContext:self->_titleGenerationContext];
    }
    else
    {
      long long v10 = [[PGDefaultCollectionTitleGenerator alloc] initWithCollection:self->_collection keyAsset:self->_keyAsset curatedAssetCollection:self->_curatedAssetCollection titleGenerationContext:self->_titleGenerationContext];
    }
    uint64_t v15 = (PGTripCollectionTitleGenerator *)v10;

    v4 = v15;
  }
  v16 = v4;
  [(PGDefaultCollectionTitleGenerator *)v4 setForDiagnostics:self->_forDiagnostics];
  long long v11 = [(PGTitleGenerator *)v16 title];
  long long v12 = [(PGTitleGenerator *)v16 subtitle];
  if (!v12)
  {
    long long v12 = +[PGTitle titleWithString:&stru_1F283BC78 category:0];
  }
  long long v13 = [[PGTitleTuple alloc] initWithWithTitle:v11 subtitle:v12];
  titleTuple = self->_titleTuple;
  self->_titleTuple = v13;
}

- (PGTitleTuple)titleTuple
{
  titleTuple = self->_titleTuple;
  if (!titleTuple)
  {
    [(PGCollectionTitleGenerator *)self _generateTitleTuples];
    titleTuple = self->_titleTuple;
  }
  return titleTuple;
}

- (PGCollectionTitleGenerator)initWithCollection:(id)a3 keyAsset:(id)a4 curatedAssetCollection:(id)a5 titleGenerationContext:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  long long v13 = [(PGCollectionTitleGenerator *)self initWithCollection:a3 titleGenerationContext:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_keyAsset, a4);
    objc_storeStrong((id *)&v14->_curatedAssetCollection, a5);
  }

  return v14;
}

- (PGCollectionTitleGenerator)initWithCollection:(id)a3 whitelistedMeaningLabels:(id)a4 titleGenerationContext:(id)a5
{
  id v9 = a4;
  long long v10 = [(PGCollectionTitleGenerator *)self initWithCollection:a3 titleGenerationContext:a5];
  id v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_whitelistedMeaningLabels, a4);
  }

  return v11;
}

- (PGCollectionTitleGenerator)initWithCollection:(id)a3 titleGenerationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGCollectionTitleGenerator;
  id v9 = [(PGCollectionTitleGenerator *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeStrong((id *)&v10->_titleGenerationContext, a4);
  }

  return v10;
}

@end