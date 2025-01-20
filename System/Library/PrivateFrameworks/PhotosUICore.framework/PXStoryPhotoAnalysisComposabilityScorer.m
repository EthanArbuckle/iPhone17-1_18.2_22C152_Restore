@interface PXStoryPhotoAnalysisComposabilityScorer
- (id)computeComposabilityScoresForDisplayAssets:(id)a3 error:(id *)a4;
@end

@implementation PXStoryPhotoAnalysisComposabilityScorer

- (id)computeComposabilityScoresForDisplayAssets:(id)a3 error:(id *)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  for (uint64_t i = 0; i < [v6 count]; ++i)
  {
    v9 = [v6 objectAtIndexedSubscript:i];
    [v7 addObject:v9];
  }
  uint64_t v10 = *MEMORY[0x1E4F39380];
  v28[0] = *MEMORY[0x1E4F39378];
  v28[1] = v10;
  v29[0] = MEMORY[0x1E4F1CC38];
  v29[1] = MEMORY[0x1E4F1CC38];
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v11 = [(id)objc_opt_class() composabilityScoresOfAssets:v7 options:v27 error:a4];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F39398]];
  uint64_t v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F393A0]];
  v14 = (void *)v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    v17 = 0;
  }
  else
  {
    v17 = -[PXStoryComposabilityScoresArray initWithCapacity:]([PXStoryComposabilityScoresMutableArray alloc], "initWithCapacity:", [v7 count]);
    for (unint64_t j = 0; j < [v7 count]; ++j)
    {
      unint64_t v19 = [v12 count];
      int v20 = 0;
      if (j < v19)
      {
        v4 = [v12 objectAtIndexedSubscript:j];
        [v4 floatValue];
        int v20 = v21;
      }
      int v24 = 0;
      if (j < [v14 count])
      {
        v25 = [v14 objectAtIndexedSubscript:j];
        [v25 floatValue];
        int v24 = v26;
      }
      if (j < v19) {

      }
      LODWORD(v22) = v20;
      LODWORD(v23) = v24;
      -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v17, "addComposabilityScores:", v22, v23);
    }
  }

  return v17;
}

@end