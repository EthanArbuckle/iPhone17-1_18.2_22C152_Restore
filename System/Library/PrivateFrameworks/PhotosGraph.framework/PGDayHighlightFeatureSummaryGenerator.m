@interface PGDayHighlightFeatureSummaryGenerator
- (PGDayHighlightFeatureSummaryGenerator)initWithHighlightNode:(id)a3 loggingConnection:(id)a4 highlightTailorContext:(id)a5 graph:(id)a6;
- (double)durationFromDateIntervals:(id)a3;
- (id)sortedSummarizedFeaturesForMomentNodes:(id)a3;
- (unint64_t)locationGranularityScoreForSummarizedFeatureSubtype:(unsigned __int16)a3;
@end

@implementation PGDayHighlightFeatureSummaryGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_highlightTailorContext, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_highlightNode, 0);
}

- (unint64_t)locationGranularityScoreForSummarizedFeatureSubtype:(unsigned __int16)a3
{
  if ((a3 - 1) >= 5) {
    return 0;
  }
  else {
    return 5 - (unsigned __int16)(a3 - 1);
  }
}

- (double)durationFromDateIntervals:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) duration];
        double v7 = v7 + v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (id)sortedSummarizedFeaturesForMomentNodes:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30 = [(PGHighlightTailorContext *)self->_highlightTailorContext locationFeatureSummarySource];
  uint64_t v5 = [v30 summarizedFeaturesForMomentNodes:v4];
  if (![v5 count])
  {
    uint64_t v6 = [v4 addressNodes];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
      {
        highlightNode = self->_highlightNode;
        v25 = loggingConnection;
        v26 = [(PGGraphHighlightNode *)highlightNode localIdentifier];
        *(_DWORD *)buf = 138412290;
        v33 = v26;
        _os_log_error_impl(&dword_1D1805000, v25, OS_LOG_TYPE_ERROR, "No summarized features found for highlight, %@", buf, 0xCu);
      }
    }
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __80__PGDayHighlightFeatureSummaryGenerator_sortedSummarizedFeaturesForMomentNodes___block_invoke;
  v31[3] = &unk_1E68E8E88;
  v31[4] = self;
  v29 = v5;
  double v9 = [v5 sortedArrayUsingComparator:v31];
  v28 = [(PGHighlightTailorContext *)self->_highlightTailorContext meaningFeatureSummarySource];
  v10 = [v28 summarizedFeaturesForMomentNodes:v4];
  v27 = [(PGHighlightTailorContext *)self->_highlightTailorContext holidayDateFeatureSummarySource];
  long long v11 = [v27 summarizedFeaturesForMomentNodes:v4];
  long long v12 = [(PGHighlightTailorContext *)self->_highlightTailorContext publicEventFeatureSummarySource];
  long long v13 = [v12 summarizedFeaturesForMomentNodes:v4];
  long long v14 = [(PGHighlightTailorContext *)self->_highlightTailorContext businessFeatureSummarySource];
  v15 = [v14 summarizedFeaturesForMomentNodes:v4];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = v9;
  if ([v15 count] == 1)
  {
    uint64_t v18 = [v15 firstObject];
  }
  else
  {
    if (![v9 count]) {
      goto LABEL_10;
    }
    uint64_t v18 = [v9 objectAtIndexedSubscript:0];
  }
  v19 = (void *)v18;
  [v16 addObject:v18];

  double v9 = v17;
LABEL_10:
  if ([v10 count] == 1)
  {
    v20 = [v10 firstObject];
    [v16 addObject:v20];

    double v9 = v17;
  }
  if ([v11 count] == 1)
  {
    v21 = [v11 firstObject];
    [v16 addObject:v21];

    double v9 = v17;
  }
  if ([v13 count] == 1)
  {
    v22 = [v13 firstObject];
    [v16 addObject:v22];

    double v9 = v17;
  }

  return v16;
}

uint64_t __80__PGDayHighlightFeatureSummaryGenerator_sortedSummarizedFeaturesForMomentNodes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 numberOfAssets];
  unint64_t v8 = [v6 numberOfAssets];
  if (v7 <= v8)
  {
    if (v8 > v7)
    {
      uint64_t v9 = 1;
      goto LABEL_14;
    }
    v10 = [v5 intervalsPresent];
    long long v11 = [v6 intervalsPresent];
    [*(id *)(a1 + 32) durationFromDateIntervals:v10];
    double v13 = v12;
    [*(id *)(a1 + 32) durationFromDateIntervals:v11];
    if (v13 > v14) {
      goto LABEL_10;
    }
    if (v14 <= v13)
    {
      unint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "locationGranularityScoreForSummarizedFeatureSubtype:", objc_msgSend(v5, "subtype"));
      unint64_t v16 = objc_msgSend(*(id *)(a1 + 32), "locationGranularityScoreForSummarizedFeatureSubtype:", objc_msgSend(v6, "subtype"));
      if (v15 > v16)
      {
LABEL_10:
        uint64_t v9 = -1;
LABEL_13:

        goto LABEL_14;
      }
      if (v16 <= v15)
      {
        v17 = [v5 locationNode];
        [v17 centroidCoordinate];
        double v19 = v18;
        double v21 = v20;

        v22 = [v6 locationNode];
        [v22 centroidCoordinate];
        double v24 = v23;
        double v26 = v25;

        if (v19 > v24) {
          goto LABEL_10;
        }
        if (v19 >= v24)
        {
          if (v21 <= v26) {
            uint64_t v9 = 1;
          }
          else {
            uint64_t v9 = -1;
          }
          goto LABEL_13;
        }
      }
    }
    uint64_t v9 = 1;
    goto LABEL_13;
  }
  uint64_t v9 = -1;
LABEL_14:

  return v9;
}

- (PGDayHighlightFeatureSummaryGenerator)initWithHighlightNode:(id)a3 loggingConnection:(id)a4 highlightTailorContext:(id)a5 graph:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PGDayHighlightFeatureSummaryGenerator;
  unint64_t v15 = [(PGDayHighlightFeatureSummaryGenerator *)&v18 init];
  unint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_highlightNode, a3);
    objc_storeStrong((id *)&v16->_loggingConnection, a4);
    objc_storeStrong((id *)&v16->_highlightTailorContext, a5);
    objc_storeStrong((id *)&v16->_graph, a6);
  }

  return v16;
}

@end