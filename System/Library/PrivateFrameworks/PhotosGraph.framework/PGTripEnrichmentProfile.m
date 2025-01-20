@interface PGTripEnrichmentProfile
- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4;
- (double)promotionScoreWithHighlightInfo:(id)a3;
- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4;
- (id)identifier;
- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8;
@end

@implementation PGTripEnrichmentProfile

- (double)promotionScoreWithHighlightInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 highlightNode];
  uint64_t v5 = [v3 numberOfExtendedAssets];
  v6 = [v3 highlightTailorContext];

  v7 = [v6 neighborScoreComputer];
  +[PGGraphHighlightNode promotionScoreWithHighlightNode:v4 enrichmentState:4 numberOfExtendedAssets:v5 neighborScoreComputer:v7];
  double v9 = v8;

  return v9;
}

- (id)curationOptionsWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  v6 = [[PGCurationOptions alloc] initWithDuration:14];
  [(PGCurationOptions *)v6 setLastPassMovieAdditionEnabled:0];
  [(PGCurationOptions *)v6 setSharingFilter:v4];
  [(PGCurationOptions *)v6 setUseDurationBasedCuration:1];
  [(PGCurationOptions *)v6 setMinimumDuration:0.0];
  +[PGDefaultEnrichmentProfile targetCurationDurationWithHighlightInfo:v5 sharingFilter:v4 options:v6];
  -[PGCurationOptions setTargetDuration:](v6, "setTargetDuration:");
  [(PGCurationOptions *)v6 setFailIfMinimumDurationNotReached:0];
  [(PGCurationOptions *)v6 setSemanticalDedupingEnabled:1];
  [(PGCurationOptions *)v6 setMovieDedupingEnabled:1];
  v7 = [v5 uuidsOfRequiredAssetsForSharingFilter:v4];

  if ([v7 count]) {
    [(PGCurationOptions *)v6 setUuidsOfRequiredAssets:v7];
  }

  return v6;
}

- (id)titleWithHighlightInfo:(id)a3 sharingFilter:(unsigned __int16)a4 curatedAssets:(id)a5 keyAsset:(id)a6 createVerboseTitle:(BOOL)a7 error:(id *)a8
{
  id v9 = a3;
  v10 = [v9 highlightNode];
  v11 = [v9 highlightTailorContext];

  v12 = [v11 titleGenerationContext];
  v13 = [v12 locationHelper];
  id v18 = 0;
  v14 = +[PGTripTitleGenerator titleTupleForDayHighlightGroupNode:v10 locationHelper:v13 error:&v18];
  id v15 = v18;

  if (v14)
  {
    id v16 = v14;
  }
  else if (a8)
  {
    *a8 = v15;
  }

  return v14;
}

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  [a3 type];
  JUMPOUT(0x1D25FE3D0);
}

- (id)identifier
{
  return @"Trips Enrichment Profile";
}

@end