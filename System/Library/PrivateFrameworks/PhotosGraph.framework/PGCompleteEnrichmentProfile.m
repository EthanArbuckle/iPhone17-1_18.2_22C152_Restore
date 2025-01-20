@interface PGCompleteEnrichmentProfile
+ (unint64_t)durationForSummary;
- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4;
- (id)curationOptions;
- (id)identifier;
- (unsigned)targetEnrichmentState;
@end

@implementation PGCompleteEnrichmentProfile

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGCompleteEnrichmentProfile;
  if ([(PGDefaultEnrichmentProfile *)&v14 canEnrichHighlight:v6 withOptions:a4])
  {
    if (a4 >> 31)
    {
      BOOL v12 = 1;
    }
    else
    {
      v7 = [(PGDefaultEnrichmentProfile *)self curationManager];
      v8 = [v7 photoLibrary];

      [v6 faceAnalysisProgressForPhotoLibrary:v8];
      double v10 = v9;
      [v6 sceneAnalysisProgressForPhotoLibrary:v8];
      BOOL v12 = v11 >= 0.9 && v10 >= 0.25;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
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
  return 4;
}

- (id)identifier
{
  return @"Complete Enrichment Profile";
}

+ (unint64_t)durationForSummary
{
  return 14;
}

@end