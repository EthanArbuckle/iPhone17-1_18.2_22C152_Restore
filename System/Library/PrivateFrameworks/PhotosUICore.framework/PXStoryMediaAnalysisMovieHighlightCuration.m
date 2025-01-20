@interface PXStoryMediaAnalysisMovieHighlightCuration
+ (id)movieHighlightCurationsFromMediaAnalysisResults:(id)a3;
- (NSArray)highlights;
- (PXStoryMediaAnalysisMovieHighlightCuration)init;
- (PXStoryMediaAnalysisMovieHighlightCuration)initWithMediaAnalysis:(id)a3;
- (PXStoryMovieHighlight)bestHighlight;
- (PXStoryMovieHighlight)defaultHighlight;
- (PXStoryMovieHighlight)fullMovie;
- (PXStoryMovieHighlight)livePhoto;
- (PXStoryMovieHighlight)movieSummary;
@end

@implementation PXStoryMediaAnalysisMovieHighlightCuration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRangeCache, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

- (PXStoryMovieHighlight)defaultHighlight
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight defaultHighlightFromMediaAnalysis:self->_analysis timeRangeCache:self->_timeRangeCache];
}

- (PXStoryMovieHighlight)fullMovie
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight fullMovieFromMediaAnalysis:self->_analysis timeRangeCache:self->_timeRangeCache];
}

- (PXStoryMovieHighlight)livePhoto
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight livePhotoFromMediaAnalysis:self->_analysis timeRangeCache:self->_timeRangeCache];
}

- (PXStoryMovieHighlight)movieSummary
{
  return (PXStoryMovieHighlight *)+[PXStoryMediaAnalysisMovieHighlight movieSummaryFromMediaAnalysis:self->_analysis timeRangeCache:self->_timeRangeCache];
}

- (PXStoryMovieHighlight)bestHighlight
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(PXStoryMediaAnalysisMovieHighlightCuration *)self highlights];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v8 qualityScore];
        float v10 = v9;
        [v5 qualityScore];
        if (v10 > v11)
        {
          id v12 = v8;

          v5 = v12;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (PXStoryMovieHighlight *)v5;
}

- (NSArray)highlights
{
  return (NSArray *)+[PXStoryMediaAnalysisMovieHighlight movieHighlightsFromMediaAnalysis:self->_analysis timeRangeCache:self->_timeRangeCache];
}

- (PXStoryMediaAnalysisMovieHighlightCuration)initWithMediaAnalysis:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXStoryMediaAnalysisMovieHighlightCuration;
  v5 = [(PXStoryMediaAnalysisMovieHighlightCuration *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    analysis = v5->_analysis;
    v5->_analysis = (NSDictionary *)v6;

    v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    timeRangeCache = v5->_timeRangeCache;
    v5->_timeRangeCache = v8;
  }
  return v5;
}

- (PXStoryMediaAnalysisMovieHighlightCuration)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryMovieHighlight.m", 957, @"%s is not available as initializer", "-[PXStoryMediaAnalysisMovieHighlightCuration init]");

  abort();
}

+ (id)movieHighlightCurationsFromMediaAnalysisResults:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
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
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_super v11 = [PXStoryMediaAnalysisMovieHighlightCuration alloc];
        id v12 = -[PXStoryMediaAnalysisMovieHighlightCuration initWithMediaAnalysis:](v11, "initWithMediaAnalysis:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

@end