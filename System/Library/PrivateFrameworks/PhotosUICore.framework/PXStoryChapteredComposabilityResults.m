@interface PXStoryChapteredComposabilityResults
- ($94F468A8D4C62B317260615823C2B210)composabilityScoresAtIndex:(unint64_t)a3;
- (PXDisplayAssetFetchResult)displayAssets;
- (PXStoryChapterCollection)chapterCollection;
- (PXStoryChapteredComposabilityResults)init;
- (PXStoryChapteredComposabilityResults)initWithDisplayAssets:(id)a3 originalResults:(id)a4 chapterCollection:(id)a5;
- (PXStoryComposabilityResults)originalResults;
- (unint64_t)count;
@end

@implementation PXStoryChapteredComposabilityResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chapterCollection, 0);
  objc_storeStrong((id *)&self->_originalResults, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

- (PXStoryChapterCollection)chapterCollection
{
  return self->_chapterCollection;
}

- (PXStoryComposabilityResults)originalResults
{
  return self->_originalResults;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- ($94F468A8D4C62B317260615823C2B210)composabilityScoresAtIndex:(unint64_t)a3
{
  v5 = [(PXStoryChapteredComposabilityResults *)self originalResults];
  [v5 composabilityScoresAtIndex:a3];
  float v7 = v6;
  float v9 = v8;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PXStoryChapteredComposabilityResults_composabilityScoresAtIndex___block_invoke;
  aBlock[3] = &unk_1E5DC99E8;
  aBlock[4] = self;
  v10 = (uint64_t (**)(void *, unint64_t))_Block_copy(aBlock);
  if ((v10[2](v10, a3 - 1) & 1) != 0 || v10[2](v10, a3))
  {
    float v9 = 0.0;
    float v7 = 0.0;
  }
  if (v10[2](v10, a3 + 1)) {
    float v9 = 0.0;
  }

  float v11 = v7;
  float v12 = v9;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

uint64_t __67__PXStoryChapteredComposabilityResults_composabilityScoresAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 < -1) {
    return 0;
  }
  uint64_t v3 = a2 + 1;
  v4 = [*(id *)(a1 + 32) displayAssets];
  uint64_t v5 = [v4 count];

  if (v3 >= v5) {
    return 0;
  }
  float v6 = [*(id *)(a1 + 32) chapterCollection];
  float v7 = [*(id *)(a1 + 32) displayAssets];
  float v8 = [v7 objectAtIndexedSubscript:v3];
  uint64_t v9 = [v6 containsChapterBeginningWithAsset:v8];

  return v9;
}

- (unint64_t)count
{
  v2 = [(PXStoryChapteredComposabilityResults *)self originalResults];
  unint64_t v3 = [v2 count];

  return v3;
}

- (PXStoryChapteredComposabilityResults)initWithDisplayAssets:(id)a3 originalResults:(id)a4 chapterCollection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryChapteredComposabilityResults;
  float v12 = [(PXStoryChapteredComposabilityResults *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_displayAssets, a3);
    objc_storeStrong((id *)&v13->_originalResults, a4);
    objc_storeStrong((id *)&v13->_chapterCollection, a5);
  }

  return v13;
}

- (PXStoryChapteredComposabilityResults)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryChapteredComposabilityResults.m", 26, @"%s is not available as initializer", "-[PXStoryChapteredComposabilityResults init]");

  abort();
}

@end