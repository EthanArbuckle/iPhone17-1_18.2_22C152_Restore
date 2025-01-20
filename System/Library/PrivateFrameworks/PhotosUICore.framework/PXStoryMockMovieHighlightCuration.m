@interface PXStoryMockMovieHighlightCuration
- (NSArray)highlights;
- (PXStoryMockMovieHighlightCuration)init;
- (PXStoryMockMovieHighlightCuration)initWithFullMovie:(id)a3;
- (PXStoryMockMovieHighlightCuration)initWithHighlights:(id)a3 fallback:(id)a4 summary:(id)a5 live:(id)a6 full:(id)a7;
- (PXStoryMockMovieHighlightCuration)initWithLivePhoto:(id)a3;
- (PXStoryMockMovieHighlightCuration)initWithMovieHighlights:(id)a3;
- (PXStoryMockMovieHighlightCuration)initWithMovieSummary:(id)a3;
- (PXStoryMovieHighlight)bestHighlight;
- (PXStoryMovieHighlight)defaultHighlight;
- (PXStoryMovieHighlight)fullMovie;
- (PXStoryMovieHighlight)livePhoto;
- (PXStoryMovieHighlight)movieSummary;
@end

@implementation PXStoryMockMovieHighlightCuration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallback, 0);
  objc_storeStrong((id *)&self->_movie, 0);
  objc_storeStrong((id *)&self->_live, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
}

- (PXStoryMovieHighlight)defaultHighlight
{
  return self->_fallback;
}

- (PXStoryMovieHighlight)fullMovie
{
  return self->_movie;
}

- (PXStoryMovieHighlight)livePhoto
{
  return self->_live;
}

- (PXStoryMovieHighlight)movieSummary
{
  return self->_summary;
}

- (PXStoryMovieHighlight)bestHighlight
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = self->_highlights;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        if (v5)
        {
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "qualityScore", (void)v14);
          float v10 = v9;
          [v5 qualityScore];
          if (v10 <= v11) {
            continue;
          }
        }
        id v12 = v8;

        v5 = v12;
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  return self->_highlights;
}

- (PXStoryMockMovieHighlightCuration)initWithHighlights:(id)a3 fallback:(id)a4 summary:(id)a5 live:(id)a6 full:(id)a7
{
  id v13 = a3;
  id v22 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXStoryMovieHighlight.m", 191, @"Invalid parameter not satisfying: %@", @"highlights != nil" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)PXStoryMockMovieHighlightCuration;
  long long v17 = [(PXStoryMockMovieHighlightCuration *)&v23 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    highlights = v17->_highlights;
    v17->_highlights = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_fallback, a4);
    objc_storeStrong((id *)&v17->_summary, a5);
    objc_storeStrong((id *)&v17->_live, a6);
    objc_storeStrong((id *)&v17->_movie, a7);
  }

  return v17;
}

- (PXStoryMockMovieHighlightCuration)initWithFullMovie:(id)a3
{
  return [(PXStoryMockMovieHighlightCuration *)self initWithHighlights:MEMORY[0x1E4F1CBF0] fallback:0 summary:0 live:0 full:a3];
}

- (PXStoryMockMovieHighlightCuration)initWithLivePhoto:(id)a3
{
  return [(PXStoryMockMovieHighlightCuration *)self initWithHighlights:MEMORY[0x1E4F1CBF0] fallback:0 summary:0 live:a3 full:0];
}

- (PXStoryMockMovieHighlightCuration)initWithMovieSummary:(id)a3
{
  return [(PXStoryMockMovieHighlightCuration *)self initWithHighlights:MEMORY[0x1E4F1CBF0] fallback:0 summary:a3 live:0 full:0];
}

- (PXStoryMockMovieHighlightCuration)initWithMovieHighlights:(id)a3
{
  return [(PXStoryMockMovieHighlightCuration *)self initWithHighlights:a3 fallback:0 summary:0 live:0 full:0];
}

- (PXStoryMockMovieHighlightCuration)init
{
  return [(PXStoryMockMovieHighlightCuration *)self initWithHighlights:MEMORY[0x1E4F1CBF0] fallback:0 summary:0 live:0 full:0];
}

@end