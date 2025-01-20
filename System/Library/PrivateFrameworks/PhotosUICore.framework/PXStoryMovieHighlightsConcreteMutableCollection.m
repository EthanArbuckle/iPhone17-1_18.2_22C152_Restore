@interface PXStoryMovieHighlightsConcreteMutableCollection
- (void)setMovieHighlightCuration:(id)a3 forDisplayAsset:(id)a4;
- (void)setMovieHighlightCurations:(id)a3 forDisplayAssets:(id)a4;
@end

@implementation PXStoryMovieHighlightsConcreteMutableCollection

- (void)setMovieHighlightCurations:(id)a3 forDisplayAssets:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  uint64_t v8 = [v13 count];
  if (v8 != [v7 count])
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXStoryMovieHighlightsConcreteCollection.m", 71, @"Invalid parameter not satisfying: %@", @"movieHighlightCurations.count == displayAssets.count" object file lineNumber description];
  }
  if ([v7 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v13 objectAtIndexedSubscript:v9];
      v11 = [v7 objectAtIndexedSubscript:v9];
      [(PXStoryMovieHighlightsConcreteMutableCollection *)self setMovieHighlightCuration:v10 forDisplayAsset:v11];

      ++v9;
    }
    while (v9 < [v7 count]);
  }
}

- (void)setMovieHighlightCuration:(id)a3 forDisplayAsset:(id)a4
{
  highlightsByAssetId = self->super._highlightsByAssetId;
  id v6 = a3;
  id v7 = [a4 uuid];
  [(NSMutableDictionary *)highlightsByAssetId setObject:v6 forKeyedSubscript:v7];
}

@end