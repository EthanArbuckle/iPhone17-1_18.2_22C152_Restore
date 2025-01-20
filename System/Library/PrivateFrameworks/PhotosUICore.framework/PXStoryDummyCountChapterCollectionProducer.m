@interface PXStoryDummyCountChapterCollectionProducer
- (PXStoryDummyCountChapterCollectionProducer)initWithCountInterval:(int64_t)a3 storyQueue:(id)a4;
- (PXStoryDummyCountChapterCollectionProducer)initWithStoryQueue:(id)a3;
- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4;
- (int64_t)countInterval;
@end

@implementation PXStoryDummyCountChapterCollectionProducer

- (int64_t)countInterval
{
  return self->_countInterval;
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  int64_t v7 = [(PXStoryDummyCountChapterCollectionProducer *)self countInterval];
  v8 = +[PXStoryChapterSettings sharedInstance];
  char v9 = [v8 dummyChaptersIncludeSubtitles];

  v10 = [PXStoryExplicitChapterCollection alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke;
  v13[3] = &__block_descriptor_49_e51_v16__0___PXStoryMutableExplicitChapterCollection__8l;
  v13[4] = v6;
  v13[5] = v7;
  char v14 = v9;
  v11 = [(PXStoryExplicitChapterCollection *)v10 initWithAssets:v5 configuration:v13];

  return v11;
}

uint64_t __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2 >= 2)
  {
    uint64_t v4 = result;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = *(void *)(result + 40);
    do
    {
      uint64_t v9 = v2 - v6;
      if (v8 >= v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v8;
      }
      LOBYTE(v11) = *(unsigned char *)(v4 + 48);
      result = objc_msgSend(a2, "addChapterWithAssetRange:configuration:", v6, v7, 3221225472, __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2, &__block_descriptor_57_e33_v16__0___PXStoryMutableChapter__8l, v5++, v6, v10, v11);
      uint64_t v2 = *(void *)(v4 + 32);
      uint64_t v8 = *(void *)(v4 + 40);
      v6 += v8;
    }
    while (v6 < v2 - 1);
  }
  return result;
}

void __101__PXStoryDummyCountChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"Chapter %ti", *(void *)(a1 + 32) + 1);
  [v5 setLocalizedTitle:v3];

  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"Assets %ti - %ti", *(void *)(a1 + 40), *(void *)(a1 + 40) + *(void *)(a1 + 48) - 1);
    [v5 setLocalizedSubtitle:v4];
  }
}

- (PXStoryDummyCountChapterCollectionProducer)initWithCountInterval:(int64_t)a3 storyQueue:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryDummyCountChapterCollectionProducer;
  result = [(PXStoryTransientChapterCollectionProducer *)&v6 initWithStoryQueue:a4];
  if (result) {
    result->_countInterval = a3;
  }
  return result;
}

- (PXStoryDummyCountChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  return [(PXStoryDummyCountChapterCollectionProducer *)self initWithCountInterval:1 storyQueue:a3];
}

@end