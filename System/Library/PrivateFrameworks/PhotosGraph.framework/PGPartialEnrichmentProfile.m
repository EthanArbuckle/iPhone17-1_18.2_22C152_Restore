@interface PGPartialEnrichmentProfile
- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4;
- (id)identifier;
- (unsigned)targetEnrichmentState;
@end

@implementation PGPartialEnrichmentProfile

- (BOOL)canEnrichHighlight:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGPartialEnrichmentProfile;
  if ([(PGDefaultEnrichmentProfile *)&v13 canEnrichHighlight:v6 withOptions:a4])
  {
    if (a4 >> 31)
    {
      BOOL v11 = 1;
    }
    else
    {
      v7 = [(PGDefaultEnrichmentProfile *)self curationManager];
      v8 = [v7 photoLibrary];
      [v6 nonDefaultCurationScorePercentageForPhotoLibrary:v8];
      double v10 = v9;

      BOOL v11 = v10 >= 0.5;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unsigned)targetEnrichmentState
{
  return 2;
}

- (id)identifier
{
  return @"Partial Enrichment Profile";
}

@end