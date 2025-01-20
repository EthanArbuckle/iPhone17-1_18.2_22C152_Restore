@interface PGMeaningfulEventAggregationMemoryTitleGenerator
+ (id)_momentNodesFromMeaningfulEvents:(id)a3;
- (NSSet)features;
- (NSSet)meaningfulEvents;
- (PGMeaningfulEventAggregationMemoryTitleGenerator)initWithMeaning:(unint64_t)a3 features:(id)a4 meaningfulEvents:(id)a5 titleGenerationContext:(id)a6;
- (double)unreliableMeaningRatioThresholdForSpecificTitle;
- (id)_meaningLabelForTitle;
- (id)_subtitle;
- (unint64_t)meaning;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
- (void)setUnreliableMeaningRatioThresholdForSpecificTitle:(double)a3;
@end

@implementation PGMeaningfulEventAggregationMemoryTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningfulEvents, 0);
  objc_storeStrong((id *)&self->_features, 0);
}

- (void)setUnreliableMeaningRatioThresholdForSpecificTitle:(double)a3
{
  self->_unreliableMeaningRatioThresholdForSpecificTitle = a3;
}

- (double)unreliableMeaningRatioThresholdForSpecificTitle
{
  return self->_unreliableMeaningRatioThresholdForSpecificTitle;
}

- (NSSet)meaningfulEvents
{
  return self->_meaningfulEvents;
}

- (NSSet)features
{
  return self->_features;
}

- (unint64_t)meaning
{
  return self->_meaning;
}

- (id)_meaningLabelForTitle
{
  return +[PGMeaningAggregationMemoryGenerator mostSpecificLabelForMeaning:self->_meaning];
}

- (id)_subtitle
{
  v3 = objc_alloc_init(PGTimeTitleOptions);
  v4 = [(PGTitleGenerator *)self momentNodes];
  [(PGTimeTitleOptions *)v3 setMomentNodes:v4];

  [(PGTimeTitleOptions *)v3 setAllowedFormats:20];
  [(PGTimeTitleOptions *)v3 setFilterDates:0];
  v5 = [(PGTitleGenerator *)self locale];
  [(PGTimeTitleOptions *)v3 setLocale:v5];

  v6 = [(PGTitleGenerator *)self featuredYearNodes];
  [(PGTimeTitleOptions *)v3 setFeaturedYearNodes:v6];

  v7 = +[PGTimeTitleUtility timeTitleWithOptions:v3];
  v8 = +[PGTitle titleWithString:v7 category:5];

  return v8;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *))a3;
  v5 = [(PGMeaningfulEventAggregationMemoryTitleGenerator *)self _meaningLabelForTitle];
  v6 = [PGSpecBasedTitleGenerator alloc];
  v7 = [(PGTitleGenerator *)self momentNodes];
  features = self->_features;
  v9 = [(PGTitleGenerator *)self titleGenerationContext];
  v10 = [(PGSpecBasedTitleGenerator *)v6 initWithMomentNodes:v7 features:features meaningLabel:v5 isAggregation:1 titleGenerationContext:v9];

  v11 = [(PGSpecBasedTitleGenerator *)v10 title];
  v12 = [(PGMeaningfulEventAggregationMemoryTitleGenerator *)self _subtitle];
  if (!v11)
  {
    v13 = +[PGLogging sharedLogging];
    v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = self->_features;
      int v16 = 138412546;
      v17 = v5;
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "Title for meaningful aggregation nil (meaning: \"%@\", features: %@. Please press \"Provide Feedback\" from Memory Detail View.", (uint8_t *)&v16, 0x16u);
    }
  }
  if (v4) {
    v4[2](v4, v11, v12);
  }
}

- (PGMeaningfulEventAggregationMemoryTitleGenerator)initWithMeaning:(unint64_t)a3 features:(id)a4 meaningfulEvents:(id)a5 titleGenerationContext:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(id)objc_opt_class() _momentNodesFromMeaningfulEvents:v12];
  v17.receiver = self;
  v17.super_class = (Class)PGMeaningfulEventAggregationMemoryTitleGenerator;
  v15 = [(PGTitleGenerator *)&v17 initWithMomentNodes:v14 referenceDateInterval:0 keyAsset:0 curatedAssetCollection:0 assetCollection:0 type:0 titleGenerationContext:v13];

  if (v15)
  {
    v15->_meaning = a3;
    objc_storeStrong((id *)&v15->_features, a4);
    objc_storeStrong((id *)&v15->_meaningfulEvents, a5);
    v15->_unreliableMeaningRatioThresholdForSpecificTitle = 1.0;
  }

  return v15;
}

+ (id)_momentNodesFromMeaningfulEvents:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "eventCollection", (void)v14);
        id v11 = [v10 eventMomentNodes];
        id v12 = [v11 temporarySet];
        [v4 unionSet:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end