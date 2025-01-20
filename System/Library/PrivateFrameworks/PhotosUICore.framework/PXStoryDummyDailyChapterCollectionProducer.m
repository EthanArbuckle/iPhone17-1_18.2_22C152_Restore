@interface PXStoryDummyDailyChapterCollectionProducer
- (PXStoryDummyDailyChapterCollectionProducer)initWithDayInterval:(int64_t)a3 storyQueue:(id)a4;
- (PXStoryDummyDailyChapterCollectionProducer)initWithStoryQueue:(id)a3;
- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4;
- (int64_t)dayInterval;
@end

@implementation PXStoryDummyDailyChapterCollectionProducer

- (int64_t)dayInterval
{
  return self->_dayInterval;
}

- (id)workQueue_uneditedChapterCollectionWithAssets:(id)a3 keyAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8 < 1)
  {
    v11 = 0;
    v10 = 0;
  }
  else
  {
    uint64_t v9 = v8;
    v10 = 0;
    v11 = 0;
    for (uint64_t i = 0; i != v9; ++i)
    {
      v13 = [v6 objectAtIndexedSubscript:i];
      v14 = [v13 localCreationDate];

      if (v14)
      {
        if (!v10 || [v10 compare:v14] == 1)
        {
          id v15 = v14;

          v10 = v15;
        }
        if (!v11 || [v11 compare:v14] == -1)
        {
          id v16 = v14;

          v11 = v16;
        }
      }
    }
  }
  double v17 = (double)(86400 * [(PXStoryDummyDailyChapterCollectionProducer *)self dayInterval]);
  v18 = [PXStoryTimeBasedChapterCollection alloc];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke;
  v23[3] = &unk_1E5DC1648;
  id v24 = v10;
  id v25 = v11;
  double v26 = v17;
  id v19 = v11;
  id v20 = v10;
  v21 = [(PXStoryTimeBasedChapterCollection *)v18 initWithAssets:v6 keyAsset:v7 configuration:v23];

  return v21;
}

void __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v4 setDateFormat:@"MMM d, yyyy"];
    v5 = +[PXStoryChapterSettings sharedInstance];
    char v6 = [v5 dummyChaptersIncludeSubtitles];

    id v7 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C328]];
    uint64_t v8 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v7 setTimeZone:v8];

    uint64_t v9 = [v7 timeZone];
    [v4 setTimeZone:v9];

    [v3 setUsesAssetLocalCreationDates:1];
    v10 = [v7 startOfDayForDate:*(void *)(a1 + 32)];
    if ([v10 compare:*(void *)(a1 + 40)] == 1)
    {
      v11 = v10;
    }
    else
    {
      uint64_t v12 = 0;
      do
      {
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 duration:*(double *)(a1 + 48) + -1.0];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2;
        v15[3] = &unk_1E5DC1620;
        id v16 = v4;
        id v17 = v13;
        char v19 = v6;
        uint64_t v18 = v12;
        id v14 = v13;
        [v3 addChapterWithDateInterval:v14 configuration:v15];
        ++v12;

        v11 = [v10 dateByAddingTimeInterval:*(double *)(a1 + 48)];

        v10 = v11;
      }
      while ([v11 compare:*(void *)(a1 + 40)] != 1);
    }
  }
}

void __101__PXStoryDummyDailyChapterCollectionProducer_workQueue_uneditedChapterCollectionWithAssets_keyAsset___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) startDate];
  v5 = [v3 stringFromDate:v4];
  [v7 setLocalizedTitle:v5];

  if (*(unsigned char *)(a1 + 56))
  {
    char v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"Chapter %ti", *(void *)(a1 + 48) + 1);
    [v7 setLocalizedSubtitle:v6];
  }
}

- (PXStoryDummyDailyChapterCollectionProducer)initWithDayInterval:(int64_t)a3 storyQueue:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryDummyDailyChapterCollectionProducer;
  result = [(PXStoryTransientChapterCollectionProducer *)&v6 initWithStoryQueue:a4];
  if (result) {
    result->_dayInterval = a3;
  }
  return result;
}

- (PXStoryDummyDailyChapterCollectionProducer)initWithStoryQueue:(id)a3
{
  return [(PXStoryDummyDailyChapterCollectionProducer *)self initWithDayInterval:1 storyQueue:a3];
}

@end