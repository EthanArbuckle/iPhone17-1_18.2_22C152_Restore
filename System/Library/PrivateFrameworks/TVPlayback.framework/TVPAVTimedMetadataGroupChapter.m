@interface TVPAVTimedMetadataGroupChapter
- (AVMetadataItem)imageMetadataItem;
- (TVPAVTimedMetadataGroupChapter)initWithAVTimedMetadataGroup:(id)a3 filterByLanguages:(id)a4;
- (void)_loadChapterNameFromMetadataItem:(id)a3;
- (void)setImageMetadataItem:(id)a3;
@end

@implementation TVPAVTimedMetadataGroupChapter

- (TVPAVTimedMetadataGroupChapter)initWithAVTimedMetadataGroup:(id)a3 filterByLanguages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TVPAVTimedMetadataGroupChapter;
  v8 = [(TVPAVTimedMetadataGroupChapter *)&v24 init];
  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    if (v6)
    {
      [v6 timeRange];
      if ((BYTE12(v21) & 1) != 0
        && (BYTE4(v23) & 1) != 0
        && !*((void *)&v23 + 1)
        && (*((void *)&v22 + 1) & 0x8000000000000000) == 0)
      {
        v9 = [TVPTimeRange alloc];
        v20[0] = v21;
        v20[1] = v22;
        v20[2] = v23;
        uint64_t v10 = [(TVPTimeRange *)v9 initWithCMTimeRange:v20];
        timeRange = v8->super.super._timeRange;
        v8->super.super._timeRange = (TVPTimeRange *)v10;

        v12 = [v6 items];
        v13 = [MEMORY[0x263EFA748] metadataItemsFromArray:v12 withKey:*MEMORY[0x263EF9DC8] keySpace:0];
        v14 = [MEMORY[0x263EFA748] metadataItemsFromArray:v12 withKey:*MEMORY[0x263EF9D90] keySpace:0];
        v15 = [v14 firstObject];
        if (v15) {
          [(TVPAVTimedMetadataGroupChapter *)v8 setImageMetadataItem:v15];
        }
        v16 = [MEMORY[0x263EFA748] metadataItemsFromArray:v13 filteredAndSortedAccordingToPreferredLanguages:v7];
        if (![v16 count])
        {
          id v17 = v13;

          v16 = v17;
        }
        v18 = [v16 firstObject];
        [(TVPAVTimedMetadataGroupChapter *)v8 _loadChapterNameFromMetadataItem:v18];
      }
    }
  }

  return v8;
}

- (void)_loadChapterNameFromMetadataItem:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 statusOfValueForKey:@"value" error:0];
    if (v6 != 1)
    {
      if (v6 == 2)
      {
        id v7 = [v5 stringValue];
        [(TVPChapter *)self setLocalizedName:v7];
      }
      else
      {
        objc_initWeak(&location, self);
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke;
        v8[3] = &unk_264CC5750;
        id v9 = v5;
        objc_copyWeak(&v10, &location);
        [v9 loadValuesAsynchronouslyForKeys:&unk_26EA26020 completionHandler:v8];
        objc_destroyWeak(&v10);

        objc_destroyWeak(&location);
      }
    }
  }
}

void __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) statusOfValueForKey:@"value" error:0] == 2)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke_2;
    v2[3] = &unk_264CC5100;
    objc_copyWeak(&v4, (id *)(a1 + 40));
    id v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v2);

    objc_destroyWeak(&v4);
  }
}

void __67__TVPAVTimedMetadataGroupChapter__loadChapterNameFromMetadataItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [*(id *)(a1 + 32) stringValue];
  [WeakRetained setLocalizedName:v2];
}

- (AVMetadataItem)imageMetadataItem
{
  return self->_imageMetadataItem;
}

- (void)setImageMetadataItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end