@interface PXStoryAutoEditClipComposabilityProvider
- ($94F468A8D4C62B317260615823C2B210)composabilityScoresForDisplayAssetIndex:(unint64_t)a3;
- (NSError)error;
- (PXDisplayAssetFetchResult)displayAssets;
- (PXStoryAutoEditClipComposabilityProvider)initWithDisplayAssets:(id)a3 chapterCollection:(id)a4;
- (PXStoryAutoEditComposabilityScorer)cropQualityScorer;
- (PXStoryAutoEditComposabilityScorer)similarityScorer;
- (PXStoryChapterCollection)chapterCollection;
- (id)diagnosticDescription;
- (id)results;
- (int64_t)count;
- (void)_computeComposabilityScores;
- (void)setSimilarityScorer:(id)a3;
@end

@implementation PXStoryAutoEditClipComposabilityProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_similarityScorer, 0);
  objc_storeStrong((id *)&self->_cropQualityScorer, 0);
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_composabilityResults, 0);
  objc_storeStrong((id *)&self->_cropScoreResults, 0);
  objc_storeStrong((id *)&self->_similarityScoreResults, 0);
}

- (void)setSimilarityScorer:(id)a3
{
}

- (PXStoryAutoEditComposabilityScorer)similarityScorer
{
  return self->_similarityScorer;
}

- (PXStoryAutoEditComposabilityScorer)cropQualityScorer
{
  return self->_cropQualityScorer;
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (NSError)error
{
  return self->_error;
}

- (id)diagnosticDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendString:@"-- Diptych Composability Results --\n"];
  [v3 appendString:@"Index\tAsset\tSimilarity\tCrop\tComposability\n"];
  for (unint64_t i = 0; (uint64_t)i < [(PXDisplayAssetFetchResult *)self->_displayAssets count]; ++i)
  {
    v5 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:i];
    v6 = [v5 uuid];
    [(PXStoryComposabilityResults *)self->_similarityScoreResults composabilityScoresAtIndex:i];
    float v8 = v7;
    double v9 = 0.0;
    if (i < [(PXStoryComposabilityResults *)self->_cropScoreResults count])
    {
      [(PXStoryComposabilityResults *)self->_cropScoreResults composabilityScoresAtIndex:i];
      double v9 = v10;
    }
    unint64_t v11 = [(PXStoryComposabilityResults *)self->_composabilityResults count];
    double v12 = 0.0;
    if (i < v11)
    {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_composabilityResults, "composabilityScoresAtIndex:", i, 0.0);
      double v12 = v13;
    }
    [v3 appendFormat:@"%lu\t%@\t%0.3f\t%0.3f\t%0.3f\n", i, v6, v8, *(void *)&v9, *(void *)&v12];
  }
  [v3 appendString:@"\n"];
  [v3 appendString:@"-- Triptych Composability Results --\n"];
  [v3 appendString:@"Index\tAsset\tSimilarity\tCrop\tComposability\n"];
  for (unint64_t j = 0; (uint64_t)j < [(PXDisplayAssetFetchResult *)self->_displayAssets count]; ++j)
  {
    v15 = [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:j];
    v16 = [v15 uuid];
    [(PXStoryComposabilityResults *)self->_similarityScoreResults composabilityScoresAtIndex:j];
    float v18 = v17;
    double v19 = 0.0;
    if (j < [(PXStoryComposabilityResults *)self->_cropScoreResults count])
    {
      [(PXStoryComposabilityResults *)self->_cropScoreResults composabilityScoresAtIndex:j];
      double v19 = v20;
    }
    unint64_t v21 = [(PXStoryComposabilityResults *)self->_composabilityResults count];
    double v22 = 0.0;
    if (j < v21)
    {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_composabilityResults, "composabilityScoresAtIndex:", j, 0.0);
      double v22 = v23;
    }
    [v3 appendFormat:@"%lu\t%@\t%0.3f\t%0.3f\t%0.3f\n", j, v16, v18, *(void *)&v19, *(void *)&v22];
  }
  [v3 appendString:@"\n"];
  if (objc_opt_respondsToSelector())
  {
    v24 = [(PXStoryAutoEditComposabilityScorer *)self->_cropQualityScorer diagnosticDescription];
    [v3 appendString:v24];
  }
  return v3;
}

- (int64_t)count
{
  return [(PXDisplayAssetFetchResult *)self->_displayAssets count];
}

- ($94F468A8D4C62B317260615823C2B210)composabilityScoresForDisplayAssetIndex:(unint64_t)a3
{
  if ([(PXDisplayAssetFetchResult *)self->_displayAssets count] <= a3)
  {
    float v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXStoryAutoEditClipComposabilityProvider.mm", 129, @"Invalid parameter not satisfying: %@", @"index < _displayAssets.count" object file lineNumber description];
  }
  v6 = [(PXStoryAutoEditClipComposabilityProvider *)self results];
  [v6 composabilityScoresAtIndex:a3];
  float v8 = v7;
  float v10 = v9;

  float v11 = v8;
  float v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (id)results
{
  composabilityResults = self->_composabilityResults;
  if (!composabilityResults)
  {
    [(PXStoryAutoEditClipComposabilityProvider *)self _computeComposabilityScores];
    composabilityResults = self->_composabilityResults;
  }
  return composabilityResults;
}

- (void)_computeComposabilityScores
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer((os_log_t)self->_log, self);
  v4 = self->_log;
  v5 = v4;
  unint64_t v6 = v3 - 1;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    float v7 = self->_log;
  }
  else
  {
    if (os_signpost_enabled((os_log_t)v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipComposabilityScoreRequest", "", buf, 2u);
    }

    float v7 = self->_log;
    if (os_signpost_enabled((os_log_t)v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, (os_log_t)v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipSimilarityScoreRequest", "", buf, 2u);
    }
  }

  similarityScorer = self->_similarityScorer;
  displayAssets = self->_displayAssets;
  id v45 = 0;
  float v10 = [(PXStoryAutoEditComposabilityScorer *)similarityScorer computeComposabilityScoresForDisplayAssets:displayAssets error:&v45];
  id v11 = v45;
  similarityScoreResults = self->_similarityScoreResults;
  self->_similarityScoreResults = v10;

  if (!self->_similarityScoreResults)
  {
    float v13 = PLStoryGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v47 = v11;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Similarity composability scorer error: %{public}@", buf, 0xCu);
    }
  }
  v14 = self->_log;
  v15 = v14;
  if (v6 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v16 = self->_log;
  }
  else
  {
    if (os_signpost_enabled((os_log_t)v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipSimilarityScoreRequest", "", buf, 2u);
    }

    v16 = self->_log;
    if (os_signpost_enabled((os_log_t)v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, (os_log_t)v16, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipCropQualityScoreRequest", "", buf, 2u);
    }
  }

  cropQualityScorer = self->_cropQualityScorer;
  float v18 = self->_displayAssets;
  id v44 = 0;
  double v19 = [(PXStoryAutoEditComposabilityScorer *)cropQualityScorer computeComposabilityScoresForDisplayAssets:v18 error:&v44];
  id v20 = v44;
  cropScoreResults = self->_cropScoreResults;
  self->_cropScoreResults = v19;

  if (!self->_cropScoreResults)
  {
    double v22 = PLStoryGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v47 = v20;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_ERROR, "Crop composability scorer error: %{public}@", buf, 0xCu);
    }
  }
  float v23 = self->_log;
  v24 = v23;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v24, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipCropQualityScoreRequest", "", buf, 2u);
  }

  v25 = [(PXStoryComposabilityScoresArray *)[PXStoryComposabilityScoresMutableArray alloc] initWithCapacity:[(PXDisplayAssetFetchResult *)self->_displayAssets count]];
  for (unint64_t i = 0; (uint64_t)i < [(PXDisplayAssetFetchResult *)self->_displayAssets count]; ++i)
  {
    float v27 = 0.0;
    float v28 = 0.0;
    if (i < [(PXStoryComposabilityResults *)self->_similarityScoreResults count])
    {
      [(PXStoryComposabilityResults *)self->_similarityScoreResults composabilityScoresAtIndex:i];
      float v27 = v29;
      float v28 = v30;
    }
    unint64_t v31 = [(PXStoryComposabilityResults *)self->_cropScoreResults count];
    double v32 = 0.0;
    double v33 = 0.0;
    if (i < v31) {
      -[PXStoryComposabilityResults composabilityScoresAtIndex:](self->_cropScoreResults, "composabilityScoresAtIndex:", i, 0.0, 0.0);
    }
    *(float *)&double v32 = v27 * *(float *)&v32;
    *(float *)&double v33 = v28 * *(float *)&v33;
    -[PXStoryComposabilityScoresMutableArray addComposabilityScores:](v25, "addComposabilityScores:", v32, v33);
  }
  v34 = (PXStoryComposabilityScoresArray *)[(PXStoryComposabilityScoresMutableArray *)v25 copy];
  v35 = self->_log;
  v36 = v35;
  if (v6 > 0xFFFFFFFFFFFFFFFDLL)
  {

    v37 = self->_log;
  }
  else
  {
    if (os_signpost_enabled((os_log_t)v35))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v36, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipComposabilityScoreRequest", "", buf, 2u);
    }

    v37 = self->_log;
    if (os_signpost_enabled((os_log_t)v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, (os_log_t)v37, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryAutoEditClipChapteredScoreRequest", "", buf, 2u);
    }
  }

  v38 = [(PXStoryAutoEditClipComposabilityProvider *)self chapterCollection];
  if (v38)
  {
    v39 = [[PXStoryChapteredComposabilityResults alloc] initWithDisplayAssets:self->_displayAssets originalResults:v34 chapterCollection:v38];
    v40 = [[PXStoryComposabilityScoresArray alloc] initWithComposabilityResults:v39];

    v34 = v40;
  }
  v41 = self->_log;
  v42 = v41;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v42, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryAutoEditClipChapteredScoreRequest", "", buf, 2u);
  }

  composabilityResults = self->_composabilityResults;
  self->_composabilityResults = (PXStoryComposabilityResults *)v34;
}

- (PXStoryAutoEditClipComposabilityProvider)initWithDisplayAssets:(id)a3 chapterCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryAutoEditClipComposabilityProvider;
  float v9 = [(PXStoryAutoEditClipComposabilityProvider *)&v21 init];
  float v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayAssets, a3);
    objc_storeStrong((id *)&v10->_chapterCollection, a4);
    id v11 = objc_alloc_init(PXStoryPhotoAnalysisComposabilityScorer);
    similarityScorer = v10->_similarityScorer;
    v10->_similarityScorer = (PXStoryAutoEditComposabilityScorer *)v11;

    float v13 = objc_alloc_init(PXStoryCropQualityComposabilityScorer);
    cropQualityScorer = v10->_cropQualityScorer;
    v10->_cropQualityScorer = (PXStoryAutoEditComposabilityScorer *)v13;

    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    float v17 = (const char *)[v16 UTF8String];
    os_log_t v18 = os_log_create((const char *)*MEMORY[0x1E4F8C518], v17);
    log = v10->_log;
    v10->_log = (OS_os_log *)v18;
  }
  return v10;
}

@end