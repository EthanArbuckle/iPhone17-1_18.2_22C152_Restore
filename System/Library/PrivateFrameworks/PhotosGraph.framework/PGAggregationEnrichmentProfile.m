@interface PGAggregationEnrichmentProfile
- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4;
- (PGAggregationEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4;
- (PLDateRangeTitleGenerator)dateRangeTitleGenerator;
- (double)promotionScoreWithHighlightInfo:(id)a3;
- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)identifier;
- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8;
- (void)setDateRangeTitleGenerator:(id)a3;
@end

@implementation PGAggregationEnrichmentProfile

- (void).cxx_destruct
{
}

- (void)setDateRangeTitleGenerator:(id)a3
{
}

- (PLDateRangeTitleGenerator)dateRangeTitleGenerator
{
  return self->_dateRangeTitleGenerator;
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  v6 = [[PGCurationOptions alloc] initWithDuration:12];
  [(PGCurationOptions *)v6 setSemanticalDedupingEnabled:1];
  [(PGCurationOptions *)v6 setMovieDedupingEnabled:1];
  [(PGCurationOptions *)v6 setLastPassMovieAdditionEnabled:0];
  [(PGCurationOptions *)v6 setFocusOnInterestingItems:1];
  v7 = [v5 uuidsOfRequiredAssetsForSharingFilter:v4];

  if ([v7 count]) {
    [(PGCurationOptions *)v6 setUuidsOfRequiredAssets:v7];
  }

  return v6;
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  uint64_t v11 = a4;
  v47[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v46 = a6;
  id v13 = a5;
  v14 = [v12 highlightNode];
  v15 = +[PGHighlightEnrichmentUtilities filteredAssetsInAssets:withSharingComposition:forSharingFilter:](PGHighlightEnrichmentUtilities, "filteredAssetsInAssets:withSharingComposition:forSharingFilter:", v13, [v14 sharingComposition], v11);

  if ([v15 count])
  {
    v16 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v15 title:0];
  }
  else
  {
    v16 = 0;
  }
  v17 = +[PGHighlightEnrichmentUtilities filteredMomentNodesWithHighlightNode:v14 forSharingFilter:v11];
  v45 = v14;
  if ([v17 count])
  {
    v44 = v16;
    v18 = [PGAggregationHighlightTitleGenerator alloc];
    v19 = [v17 temporarySet];
    v20 = [v12 highlightTailorContext];
    [v20 titleGenerationContext];
    v21 = id v42 = v12;
    v22 = [(PGAggregationHighlightTitleGenerator *)v18 initWithMomentNodes:v19 keyAsset:v46 curatedAssetCollection:v44 titleGenerationContext:v21];

    [(PGTitleGenerator *)v22 setLineBreakBehavior:2];
    [(PGTitleGenerator *)v22 setPreferredTitleType:2];
    v41 = [(PGTitleGenerator *)v22 title];
    v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v47[0] = v23;
    v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v47[1] = v24;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];

    v25 = [v15 sortedArrayUsingDescriptors:v40];
    v26 = [v25 firstObject];
    v27 = [v26 localCreationDate];

    v28 = [v25 lastObject];
    v29 = [v28 localCreationDate];

    v30 = [(PLDateRangeTitleGenerator *)self->_dateRangeTitleGenerator dateRangeTitleWithStartDate:v27 endDate:v29 category:0 kind:3 type:3];
    v31 = +[PGTitle titleWithString:v30 category:0];
    v32 = [[PGTitleTuple alloc] initWithWithTitle:v41 subtitle:v31];

    v16 = v44;
    id v12 = v42;
  }
  else
  {
    if (a8)
    {
      v33 = v16;
      v34 = (void *)MEMORY[0x1E4F28C58];
      v35 = NSString;
      v36 = PHDescriptionForSharingFilter();
      v37 = [v35 stringWithFormat:@"No moment nodes for sharing filter %@", v36];
      v38 = v34;
      v16 = v33;
      *a8 = [v38 errorWithDescription:v37];
    }
    v32 = 0;
  }

  return v32;
}

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "childHighlights", 0);
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
        [*(id *)(*((void *)&v11 + 1) + 8 * i) promotionScore];
        if (v7 < v9) {
          double v7 = v9;
        }
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

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  return [a3 type] == 3;
}

- (id)identifier
{
  return @"Aggregation Enrichment Profile";
}

- (PGAggregationEnrichmentProfile)initWithCurationManager:(id)a3 loggingConnection:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PGAggregationEnrichmentProfile;
  uint64_t v4 = [(PGDayGroupAbstractEnrichmentProfile *)&v8 initWithCurationManager:a3 loggingConnection:a4];
  if (v4)
  {
    uint64_t v5 = (PLDateRangeTitleGenerator *)objc_alloc_init(MEMORY[0x1E4F8A7A0]);
    dateRangeTitleGenerator = v4->_dateRangeTitleGenerator;
    v4->_dateRangeTitleGenerator = v5;
  }
  return v4;
}

@end