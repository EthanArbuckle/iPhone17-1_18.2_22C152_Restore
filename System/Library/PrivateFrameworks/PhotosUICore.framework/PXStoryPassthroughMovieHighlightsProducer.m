@interface PXStoryPassthroughMovieHighlightsProducer
- (id)requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6;
@end

@implementation PXStoryPassthroughMovieHighlightsProducer

- (id)requestMovieHighlightsForAssets:(id)a3 partialCollection:(id)a4 options:(unint64_t)a5 resultHandler:(id)a6
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a6;
  v9 = objc_alloc_init(PXStoryMovieHighlightsConcreteMutableCollection);
  if ([v7 count])
  {
    unint64_t v10 = 0;
    do
    {
      v11 = [v7 objectAtIndexedSubscript:v10];
      if ((unint64_t)([v11 playbackStyle] - 3) <= 2)
      {
        v12 = +[PXStoryFallbackMovieHighlightCuration movieHighlightCurationForDisplayAsset:v11];
        [(PXStoryMovieHighlightsConcreteMutableCollection *)v9 setMovieHighlightCuration:v12 forDisplayAsset:v11];
      }
      ++v10;
    }
    while (v10 < [v7 count]);
  }
  v13 = [PXStoryProducerResult alloc];
  v14 = (void *)[(PXStoryMovieHighlightsConcreteMutableCollection *)v9 copy];
  v15 = [(PXStoryProducerResult *)v13 initWithObject:v14];

  v8[2](v8, v15);
  return 0;
}

@end