@interface PGSceneCompleteEnrichmentProfile
+ (unint64_t)durationForSummary;
- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4;
- (id)curationOptions;
- (id)identifier;
- (unsigned)targetEnrichmentState;
@end

@implementation PGSceneCompleteEnrichmentProfile

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PGSceneCompleteEnrichmentProfile;
  if ([(PGDefaultEnrichmentProfile *)&v19 canEnrichHighlight:v6 withOptions:a4])
  {
    if (a4 >> 31)
    {
      BOOL v17 = 1;
    }
    else
    {
      v7 = [(PGDefaultEnrichmentProfile *)self curationManager];
      v8 = [v7 photoLibrary];
      [v6 sceneAnalysisProgressForPhotoLibrary:v8];
      double v10 = v9;

      v11 = [v6 assetCollection];
      unint64_t v12 = [v11 estimatedAssetCount];

      unint64_t v13 = llround(v10 * (double)v12);
      BOOL v16 = v12 < 0xA && v13 != 0 && v12 - v13 < 3;
      BOOL v17 = v10 >= 0.9 || v16;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)curationOptions
{
  v2 = [[PGCurationOptions alloc] initWithDuration:0];
  [(PGCurationOptions *)v2 setSemanticalDedupingEnabled:1];
  [(PGCurationOptions *)v2 setMovieDedupingEnabled:1];
  [(PGCurationOptions *)v2 setLastPassMovieAdditionEnabled:0];
  return v2;
}

- (unsigned)targetEnrichmentState
{
  return 3;
}

- (id)identifier
{
  return @"Complete Scene Enrichment Profile";
}

+ (unint64_t)durationForSummary
{
  return 14;
}

@end