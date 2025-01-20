@interface PXStoryRecombinedTimeline
+ (BOOL)_isSegmentIndex:(int64_t)a3 inTimeline:(id)a4 visuallyEqualToSegmentIndex:(int64_t)a5 inTimeline:(id)a6;
+ (id)timelineByRecombiningSourceTimeline:(id)a3 withTargetTimeline:(id)a4 visibleSegmentIdentifiers:(id)a5;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)sourceTimeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)targetTimeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)targetTimeRangeInSourceTime;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetTimeOffset;
- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3;
- (CGSize)size;
- (PXCArrayStore)shiftedTimeRangesStore;
- (PXStoryRecombinedTimeline)init;
- (PXStoryRecombinedTimeline)initWithSourceTimeline:(id)a3 upToSegmentIndex:(int64_t)a4 targetTimeline:(id)a5 fromSegmentIndex:(int64_t)a6;
- (PXStoryTimeline)sourceTimeline;
- (PXStoryTimeline)targetTimeline;
- (id)clipWithIdentifier:(int64_t)a3;
- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5;
- (int64_t)dataSourceIdentifier;
- (int64_t)firstTargetSegmentIndex;
- (int64_t)identifierForSegmentAtIndex:(int64_t)a3;
- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3;
- (int64_t)lastSourceSegmentIndex;
- (int64_t)numberOfSegments;
- (void)_shiftTimeRanges:(id *)a3 count:(int64_t)a4 byTime:(id *)a5 resultHandler:(id)a6;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4;
@end

@implementation PXStoryRecombinedTimeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftedTimeRangesStore, 0);
  objc_storeStrong((id *)&self->_targetTimeline, 0);
  objc_storeStrong((id *)&self->_sourceTimeline, 0);
}

- (PXCArrayStore)shiftedTimeRangesStore
{
  return self->_shiftedTimeRangesStore;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetTimeOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)targetTimeRange
{
  long long v3 = *(_OWORD *)&self[3].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var1;
  return self;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)targetTimeRangeInSourceTime
{
  long long v3 = *(_OWORD *)&self[2].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var1;
  return self;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)sourceTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var1;
  return self;
}

- (int64_t)firstTargetSegmentIndex
{
  return self->_firstTargetSegmentIndex;
}

- (PXStoryTimeline)targetTimeline
{
  return self->_targetTimeline;
}

- (int64_t)lastSourceSegmentIndex
{
  return self->_lastSourceSegmentIndex;
}

- (PXStoryTimeline)sourceTimeline
{
  return self->_sourceTimeline;
}

- (void)_shiftTimeRanges:(id *)a3 count:(int64_t)a4 byTime:(id *)a5 resultHandler:(id)a6
{
  id v10 = a6;
  v11 = [(PXStoryRecombinedTimeline *)self shiftedTimeRangesStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PXStoryRecombinedTimeline__shiftTimeRanges_count_byTime_resultHandler___block_invoke;
  v13[3] = &unk_1E5DB1600;
  int64_t v15 = a4;
  v16 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a5;
  id v14 = v10;
  id v12 = v10;
  [v11 accessArrayWithElementsCount:a4 accessBlock:v13];
}

uint64_t __73__PXStoryRecombinedTimeline__shiftTimeRanges_count_byTime_resultHandler___block_invoke(void *a1, uint64_t a2)
{
  if ((uint64_t)a1[5] >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    v6 = a1 + 7;
    do
    {
      uint64_t v7 = a1[6] + v4;
      *(_OWORD *)id v12 = *(_OWORD *)(v7 + 16);
      long long v8 = *(_OWORD *)(v7 + 32);
      v9 = (_OWORD *)(a2 + v4);
      CMTime duration = *(CMTime *)v7;
      *(_OWORD *)&v12[16] = v8;
      lhs.start = duration;
      *(_OWORD *)&rhs.value = *v6;
      rhs.epoch = a1[9];
      CMTimeAdd(&v14, &lhs.start, &rhs);
      CMTime duration = *(CMTime *)&v12[8];
      CMTime rhs = v14;
      CMTimeRangeMake(&lhs, &rhs, &duration);
      long long v10 = *(_OWORD *)&lhs.start.epoch;
      _OWORD *v9 = *(_OWORD *)&lhs.start.value;
      v9[1] = v10;
      v9[2] = *(_OWORD *)&lhs.duration.timescale;
      ++v5;
      v4 += 48;
    }
    while (v5 < a1[5]);
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

- (int64_t)dataSourceIdentifier
{
  v2 = [(PXStoryRecombinedTimeline *)self targetTimeline];
  int64_t v3 = [v2 dataSourceIdentifier];

  return v3;
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  uint64_t v10 = [v9 identifierOfFirstClipContainingResourceAtIndex:a3 inResourcesDataSource:v8 resourceKind:a5];

  v11 = [(PXStoryRecombinedTimeline *)self targetTimeline];
  uint64_t v12 = [v11 identifierOfFirstClipContainingResourceAtIndex:a3 inResourcesDataSource:v8 resourceKind:a5];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  [(PXStoryRecombinedTimeline *)self timeRange];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __111__PXStoryRecombinedTimeline_identifierOfFirstClipContainingResourceAtIndex_inResourcesDataSource_resourceKind___block_invoke;
  v15[3] = &unk_1E5DB15D8;
  v15[4] = &v17;
  v15[5] = v10;
  v15[6] = v12;
  -[PXStoryRecombinedTimeline enumerateClipsInTimeRange:rect:usingBlock:](self, "enumerateClipsInTimeRange:rect:usingBlock:", v16, v15, *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
  int64_t v13 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void *__111__PXStoryRecombinedTimeline_identifierOfFirstClipContainingResourceAtIndex_inResourcesDataSource_resourceKind___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, unsigned char *a6)
{
  if (a2 >= 1)
  {
    uint64_t v6 = result[5];
    while (*a5 != v6)
    {
      if (*a5 == result[6])
      {
        uint64_t v6 = *a5;
        break;
      }
      a5 += 96;
      if (!--a2) {
        return result;
      }
    }
    *(void *)(*(void *)(result[4] + 8) + 24) = v6;
    *a6 = 1;
  }
  return result;
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  int64_t v10 = [v9 indexOfResourceForClipWithIdentifier:a3 inResourcesDataSource:v8 resourceKind:a5];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = [(PXStoryRecombinedTimeline *)self targetTimeline];
    int64_t v10 = [v11 indexOfResourceForClipWithIdentifier:a3 inResourcesDataSource:v8 resourceKind:a5];
  }
  return v10;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  int64_t v10 = [v9 indexesOfResourcesWithKind:a3 inResourcesDataSource:v8 forClipsInSegmentWithIdentifier:a5];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    int64_t v13 = [(PXStoryRecombinedTimeline *)self targetTimeline];
    id v12 = [v13 indexesOfResourcesWithKind:a3 inResourcesDataSource:v8 forClipsInSegmentWithIdentifier:a5];
  }
  return v12;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  uint64_t v7 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  uint64_t v8 = [v7 indexOfSegmentWithIdentifier:a4];
  if (v8 <= [(PXStoryRecombinedTimeline *)self lastSourceSegmentIndex])
  {
    if (v7) {
      [v7 timeRangeForSegmentWithIdentifier:a4];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    long long v11 = *(_OWORD *)&lhs.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&lhs.start.value;
    *(_OWORD *)&retstr->var0.var3 = v11;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&lhs.duration.timescale;
  }
  else
  {
    v9 = [(PXStoryRecombinedTimeline *)self targetTimeline];
    uint64_t v10 = [v9 indexOfSegmentWithIdentifier:a4];
    if (v10 >= [(PXStoryRecombinedTimeline *)self firstTargetSegmentIndex])
    {
      if (v9)
      {
        [v9 timeRangeForSegmentWithIdentifier:a4];
      }
      else
      {
        memset(v16, 0, sizeof(v16));
        long long v15 = 0u;
      }
      [(PXStoryRecombinedTimeline *)self targetTimeOffset];
      *(_OWORD *)&lhs.start.value = v15;
      lhs.start.epoch = v16[0];
      CMTime rhs = v14;
      CMTimeAdd(&v18, &lhs.start, &rhs);
      CMTime duration = *(CMTime *)&v16[1];
      CMTime rhs = v18;
      CMTimeRangeMake(&lhs, &rhs, &duration);
      long long v12 = *(_OWORD *)&lhs.start.epoch;
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&lhs.start.value;
      *(_OWORD *)&retstr->var0.var3 = v12;
      *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&lhs.duration.timescale;
    }
  }
  return result;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  uint64_t v5 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  if ([v5 containsSegmentWithIdentifier:a3])
  {
    [v5 frameForSegmentWithIdentifier:a3];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    CMTime v14 = [(PXStoryRecombinedTimeline *)self targetTimeline];
    [v14 frameForSegmentWithIdentifier:a3];
    double v7 = v15;
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
  }
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  double v7 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  [(PXStoryRecombinedTimeline *)self sourceTimeRange];
  long long v8 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)CMTimeRange lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v8;
  long long v23 = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v7, "enumerateSegmentsInTimeRange:usingBlock:", v25, v6, PXStoryTimeRangeIntersection(lhs, v24, v25));

  memset(&v21, 0, sizeof(v21));
  [(PXStoryRecombinedTimeline *)self targetTimeOffset];
  memset(&v20, 0, sizeof(v20));
  CMTime rhs = v21;
  *(_OWORD *)CMTimeRange lhs = PXStoryTimeZero;
  *(void *)&lhs[16] = 0;
  CMTimeSubtract(&v20, (CMTime *)lhs, &rhs);
  double v9 = [(PXStoryRecombinedTimeline *)self targetTimeline];
  [(PXStoryRecombinedTimeline *)self targetTimeRangeInSourceTime];
  long long v10 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)CMTimeRange lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v10;
  long long v23 = *(_OWORD *)&a3->var1.var1;
  PXStoryTimeRangeIntersection(lhs, v15, &v16);
  CMTime rhs = v20;
  *(_OWORD *)CMTimeRange lhs = v16;
  *(void *)&lhs[16] = v17;
  CMTimeAdd(&v26, (CMTime *)lhs, &rhs);
  CMTime rhs = v18;
  *(CMTime *)CMTimeRange lhs = v26;
  CMTimeRangeMake(&v19, (CMTime *)lhs, &rhs);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke;
  v12[3] = &unk_1E5DB15B0;
  CMTime v14 = v21;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 enumerateSegmentsInTimeRange:&v19 usingBlock:v12];
}

void __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2;
  v13[3] = &unk_1E5DB1588;
  long long v10 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = a2;
  uint64_t v16 = a4;
  uint64_t v17 = a5;
  long long v11 = *(_OWORD *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 64);
  [v10 _shiftTimeRanges:a3 count:a2 byTime:&v11 resultHandler:v13];
}

uint64_t __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, void))(a1[4] + 16))(a1[4], a1[5], a2, a1[6], a1[7]);
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  uint64_t v5 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  int64_t v6 = [v5 indexOfSegmentWithIdentifier:a3];
  int64_t v7 = [(PXStoryRecombinedTimeline *)self lastSourceSegmentIndex];
  int64_t v8 = v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 > v7)
  {
    double v9 = [(PXStoryRecombinedTimeline *)self targetTimeline];
    uint64_t v10 = [v9 indexOfSegmentWithIdentifier:a3];
    int64_t v11 = [(PXStoryRecombinedTimeline *)self firstTargetSegmentIndex];
    if (v10 < v11 || v10 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      int64_t v6 = v8 + v10 - v11 + 1;
    }
  }
  return v6;
}

- (int64_t)identifierForSegmentAtIndex:(int64_t)a3
{
  if ([(PXStoryRecombinedTimeline *)self lastSourceSegmentIndex] >= a3)
  {
    int64_t v8 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
    uint64_t v5 = v8;
    int64_t v7 = a3;
  }
  else
  {
    uint64_t v5 = [(PXStoryRecombinedTimeline *)self targetTimeline];
    int64_t v6 = ~[(PXStoryRecombinedTimeline *)self lastSourceSegmentIndex];
    int64_t v7 = v6 + a3 + [(PXStoryRecombinedTimeline *)self firstTargetSegmentIndex];
    int64_t v8 = v5;
  }
  int64_t v9 = [v8 identifierForSegmentAtIndex:v7];

  return v9;
}

- (int64_t)numberOfSegments
{
  int64_t v3 = [(PXStoryRecombinedTimeline *)self lastSourceSegmentIndex];
  uint64_t v4 = [(PXStoryRecombinedTimeline *)self targetTimeline];
  int64_t v5 = v3 + [v4 numberOfSegments];
  int64_t v6 = v5 - [(PXStoryRecombinedTimeline *)self firstTargetSegmentIndex] + 1;

  return v6;
}

- (id)clipWithIdentifier:(int64_t)a3
{
  int64_t v5 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  int64_t v6 = [v5 clipWithIdentifier:a3];
  int64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    int64_t v9 = [(PXStoryRecombinedTimeline *)self targetTimeline];
    id v8 = [v9 clipWithIdentifier:a3];
  }
  return v8;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  uint64_t v12 = [(PXStoryRecombinedTimeline *)self sourceTimeline];
  [(PXStoryRecombinedTimeline *)self sourceTimeRange];
  long long v13 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)CMTimeRange lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v13;
  long long v28 = *(_OWORD *)&a3->var1.var1;
  PXStoryTimeRangeIntersection(lhs, v29, v30);
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v30, v11, x, y, width, height);

  memset(&v26, 0, sizeof(v26));
  [(PXStoryRecombinedTimeline *)self targetTimeOffset];
  memset(&v25, 0, sizeof(v25));
  CMTime rhs = v26;
  *(_OWORD *)CMTimeRange lhs = PXStoryTimeZero;
  *(void *)&lhs[16] = 0;
  CMTimeSubtract(&v25, (CMTime *)lhs, &rhs);
  id v14 = [(PXStoryRecombinedTimeline *)self targetTimeline];
  [(PXStoryRecombinedTimeline *)self targetTimeRangeInSourceTime];
  long long v15 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)CMTimeRange lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v15;
  long long v28 = *(_OWORD *)&a3->var1.var1;
  PXStoryTimeRangeIntersection(lhs, v20, &v21);
  CMTime rhs = v25;
  *(_OWORD *)CMTimeRange lhs = v21;
  *(void *)&lhs[16] = v22;
  CMTimeAdd(&v31, (CMTime *)lhs, &rhs);
  CMTime rhs = v23;
  *(CMTime *)CMTimeRange lhs = v31;
  CMTimeRangeMake(&v24, (CMTime *)lhs, &rhs);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v17[3] = &unk_1E5DB1560;
  CMTime v19 = v26;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  objc_msgSend(v14, "enumerateClipsInTimeRange:rect:usingBlock:", &v24, v17, x, y, width, height);
}

void __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  _OWORD v15[3] = &unk_1E5DB1538;
  uint64_t v12 = *(void **)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = a2;
  uint64_t v18 = a4;
  uint64_t v19 = a5;
  uint64_t v20 = a6;
  long long v13 = *(_OWORD *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 64);
  [v12 _shiftTimeRanges:a3 count:a2 byTime:&v13 resultHandler:v15];
}

uint64_t __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, void, void))(a1[4] + 16))(a1[4], a1[5], a2, a1[6], a1[7], a1[8]);
}

- (CGSize)size
{
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  [(PXStoryRecombinedTimeline *)self sourceTimeRange];
  [(PXStoryRecombinedTimeline *)self targetTimeRangeInSourceTime];
  return ($28FEB1B56BB3ED5175BFC6DE64DE503F *)PXStoryTimeRangeUnion(&v7, (uint64_t)&v6, (uint64_t)retstr);
}

- (PXStoryRecombinedTimeline)initWithSourceTimeline:(id)a3 upToSegmentIndex:(int64_t)a4 targetTimeline:(id)a5 fromSegmentIndex:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v43.receiver = self;
  v43.super_class = (Class)PXStoryRecombinedTimeline;
  long long v13 = [(PXStoryRecombinedTimeline *)&v43 init];
  uint64_t v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceTimeline, a3);
    v14->_lastSourceSegmentIndedouble x = a4;
    objc_storeStrong((id *)&v14->_targetTimeline, a5);
    v14->_firstTargetSegmentIndedouble x = a6;
    uint64_t v15 = [v11 identifierForSegmentAtIndex:a4];
    memset(&v42, 0, sizeof(v42));
    if (v11)
    {
      [v11 timeRangeForSegmentWithIdentifier:v15];
      [v11 timeRange];
    }
    else
    {
      long long v38 = 0uLL;
      long long v39 = 0uLL;
      long long v40 = 0uLL;
    }
    *(_OWORD *)&start.start.value = v38;
    start.start.CMTimeEpoch epoch = v39;
    *(_OWORD *)&duration.start.value = PXStoryTimeZero;
    duration.start.CMTimeEpoch epoch = 0;
    CMTimeRangeMake(&v41, &start.start, &duration.start);
    CMTimeRange start = v42;
    PXStoryTimeRangeUnion(&v41, (uint64_t)&start, (uint64_t)&range);
    long long v16 = *(_OWORD *)&range.start.value;
    long long v17 = *(_OWORD *)&range.duration.timescale;
    *(_OWORD *)&v14->_sourceTimeRange.start.CMTimeEpoch epoch = *(_OWORD *)&range.start.epoch;
    *(_OWORD *)&v14->_sourceTimeRange.duration.timescale = v17;
    *(_OWORD *)&v14->_sourceTimeRange.start.value = v16;
    uint64_t v18 = [v12 identifierForSegmentAtIndex:a6];
    memset(&start, 0, sizeof(start));
    if (v12)
    {
      [v12 timeRangeForSegmentWithIdentifier:v18];
      [v12 timeRange];
    }
    else
    {
      memset(&v33, 0, sizeof(v33));
    }
    CMTimeRange range = v33;
    CMTimeRangeGetEnd(&v34, &range);
    range.CMTimeRange start = v34;
    *(_OWORD *)&v44.value = PXStoryTimeZero;
    v44.CMTimeEpoch epoch = 0;
    CMTimeRangeMake(&v35, &range.start, &v44);
    CMTimeRange range = start;
    PXStoryTimeRangeUnion(&range, (uint64_t)&v35, (uint64_t)&duration);
    long long v19 = *(_OWORD *)&duration.start.value;
    long long v20 = *(_OWORD *)&duration.duration.timescale;
    *(_OWORD *)&v14->_targetTimeRange.start.CMTimeEpoch epoch = *(_OWORD *)&duration.start.epoch;
    *(_OWORD *)&v14->_targetTimeRange.duration.timescale = v20;
    *(_OWORD *)&v14->_targetTimeRange.start.value = v19;
    CMTimeRange duration = (CMTimeRange)v14->_sourceTimeRange;
    CMTimeRange range = duration;
    CMTimeRangeGetEnd(&v32, &range);
    long long v31 = *(_OWORD *)&v14->_targetTimeRange.duration.value;
    CMTimeEpoch epoch = v14->_targetTimeRange.duration.epoch;
    duration.CMTimeRange start = v32;
    *(_OWORD *)&v44.value = v31;
    v44.CMTimeEpoch epoch = epoch;
    CMTimeRangeMake(&range, &duration.start, &v44);
    long long v22 = *(_OWORD *)&range.start.value;
    long long v23 = *(_OWORD *)&range.duration.timescale;
    *(_OWORD *)&v14->_targetTimeRangeInSourceTime.start.CMTimeEpoch epoch = *(_OWORD *)&range.start.epoch;
    *(_OWORD *)&v14->_targetTimeRangeInSourceTime.duration.timescale = v23;
    *(_OWORD *)&v14->_targetTimeRangeInSourceTime.start.value = v22;
    CMTimeEpoch v24 = v14->_targetTimeRangeInSourceTime.start.epoch;
    long long v25 = *(_OWORD *)&v14->_targetTimeRange.start.value;
    CMTimeEpoch v26 = v14->_targetTimeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&v14->_targetTimeRangeInSourceTime.start.value;
    range.start.CMTimeEpoch epoch = v24;
    *(_OWORD *)&duration.start.value = v25;
    duration.start.CMTimeEpoch epoch = v26;
    CMTimeSubtract(&v44, &range.start, &duration.start);
    long long v27 = *(_OWORD *)&v44.value;
    v14->_targetTimeOffset.CMTimeEpoch epoch = v44.epoch;
    *(_OWORD *)&v14->_targetTimeOffset.value = v27;
    uint64_t v28 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:48];
    shiftedTimeRangesStore = v14->_shiftedTimeRangesStore;
    v14->_shiftedTimeRangesStore = (PXCArrayStore *)v28;
  }
  return v14;
}

- (PXStoryRecombinedTimeline)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryRecombinedTimeline.m", 131, @"%s is not available as initializer", "-[PXStoryRecombinedTimeline init]");

  abort();
}

+ (BOOL)_isSegmentIndex:(int64_t)a3 inTimeline:(id)a4 visuallyEqualToSegmentIndex:(int64_t)a5 inTimeline:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 1;
  uint64_t v11 = [v9 identifierForSegmentAtIndex:a3];
  if (v9) {
    [v9 timeRangeForSegmentWithIdentifier:v11];
  }
  uint64_t v12 = [v10 identifierForSegmentAtIndex:a5];
  if (v10) {
    [v10 timeRangeForSegmentWithIdentifier:v12];
  }
  [v9 size];
  PXRectWithOriginAndSize();
}

uint64_t __95__PXStoryRecombinedTimeline__isSegmentIndex_inTimeline_visuallyEqualToSegmentIndex_inTimeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__PXStoryRecombinedTimeline__isSegmentIndex_inTimeline_visuallyEqualToSegmentIndex_inTimeline___block_invoke_2;
  _OWORD v15[3] = &unk_1E5DB14E8;
  uint64_t v6 = *(void **)(a1 + 32);
  void v15[4] = *(void *)(a1 + 40);
  v15[5] = a2;
  v15[6] = a4;
  void v15[7] = a3;
  long long v7 = *(_OWORD *)(a1 + 144);
  long long v8 = *(_OWORD *)(a1 + 160);
  long long v9 = *(_OWORD *)(a1 + 112);
  long long v16 = *(_OWORD *)(a1 + 128);
  long long v17 = v7;
  long long v10 = *(_OWORD *)(a1 + 80);
  long long v11 = *(_OWORD *)(a1 + 112);
  long long v20 = *(_OWORD *)(a1 + 96);
  long long v21 = v11;
  long long v12 = *(_OWORD *)(a1 + 80);
  long long v18 = v8;
  long long v19 = v12;
  v15[8] = a5;
  v15[9] = a6;
  v14[0] = v10;
  v14[1] = v20;
  v14[2] = v9;
  return objc_msgSend(v6, "enumerateClipsInTimeRange:rect:usingBlock:", v14, v15, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __95__PXStoryRecombinedTimeline__isSegmentIndex_inTimeline_visuallyEqualToSegmentIndex_inTimeline___block_invoke_2(uint64_t result, uint64_t a2, long long *a3, CGRect *a4, uint64_t a5, unsigned char *a6)
{
  uint64_t v7 = result;
  if (*(void *)(result + 40) != a2) {
    goto LABEL_16;
  }
  if (a2 < 1) {
    goto LABEL_18;
  }
  long long v25 = (CMTime *)(result + 128);
  CMTimeEpoch v26 = (CMTime *)(result + 80);
  CGRect result = CGRectEqualToRect(*(CGRect *)*(void *)(result + 48), *a4);
  if (result)
  {
    long long v10 = *(long long **)(v7 + 56);
    long long v11 = v10[1];
    long long v48 = *v10;
    long long v49 = v11;
    long long v50 = v10[2];
    long long v12 = a3[1];
    long long v45 = *a3;
    long long v46 = v12;
    long long v14 = *a3;
    long long v13 = a3[1];
    long long v47 = a3[2];
    long long lhs = v48;
    *(_OWORD *)lhs_16 = v10[1];
    *(_OWORD *)&lhs_16[16] = v10[2];
    CMTime time1 = *(CMTime *)&lhs_16[8];
    long long lhs = v14;
    *(_OWORD *)lhs_16 = v13;
    *(_OWORD *)&lhs_16[16] = a3[2];
    CMTime time2 = *(CMTime *)&lhs_16[8];
    CGRect result = CMTimeCompare(&time1, &time2);
    if (!result)
    {
      long long lhs = v48;
      *(void *)lhs_16 = v49;
      CMTime time1 = *v26;
      CMTimeSubtract(&v44, (CMTime *)&lhs, &time1);
      long long lhs = v45;
      *(void *)lhs_16 = v46;
      CMTime time1 = *v25;
      CMTimeSubtract(&v43, (CMTime *)&lhs, &time1);
      long long lhs = *(_OWORD *)&v44.value;
      *(void *)lhs_16 = v44.epoch;
      CMTime time1 = v43;
      CGRect result = CMTimeCompare((CMTime *)&lhs, &time1);
      if (!result)
      {
        uint64_t v15 = *(void *)(v7 + 64);
        if (*(void *)(v15 + 152) == *(void *)(a5 + 152))
        {
          int32x2_t v16 = vmovn_s64(vceqq_f64(*(float64x2_t *)(v15 + 16), *(float64x2_t *)(a5 + 16)));
          if ((v16.i32[0] & v16.i32[1] & 1) != 0
            && ((*(_DWORD *)(a5 + 32) ^ *(_DWORD *)(v15 + 32)) & 0xDLL) == 0
            && *(double *)(v15 + 160) == *(double *)(a5 + 160)
            && *(double *)(v15 + 168) == *(double *)(a5 + 168))
          {
            CGFloat v17 = *(double *)(v15 + 208);
            CGFloat v18 = *(double *)(v15 + 216);
            CGFloat v19 = *(double *)(v15 + 224);
            CGFloat v20 = *(double *)(v15 + 232);
            CGFloat v41 = *(double *)(v15 + 248);
            CGFloat v42 = *(double *)(v15 + 240);
            CGFloat v39 = *(double *)(v15 + 264);
            CGFloat v40 = *(double *)(v15 + 256);
            CGFloat v33 = *(double *)(v15 + 280);
            CGFloat v34 = *(double *)(v15 + 272);
            CGFloat v31 = *(double *)(v15 + 296);
            CGFloat v32 = *(double *)(v15 + 288);
            CGFloat v21 = *(double *)(a5 + 208);
            CGFloat v22 = *(double *)(a5 + 216);
            CGFloat v23 = *(double *)(a5 + 224);
            CGFloat v24 = *(double *)(a5 + 232);
            CGFloat v37 = *(double *)(a5 + 248);
            CGFloat v38 = *(double *)(a5 + 240);
            CGFloat v35 = *(double *)(a5 + 264);
            CGFloat v36 = *(double *)(a5 + 256);
            CGFloat v29 = *(double *)(a5 + 280);
            CGFloat v30 = *(double *)(a5 + 272);
            CGFloat v27 = *(double *)(a5 + 296);
            CGFloat v28 = *(double *)(a5 + 288);
            CGRect result = CGRectEqualToRect(*(CGRect *)(v15 + 176), *(CGRect *)(a5 + 176));
            if (result)
            {
              v55.origin.double x = v17;
              v55.origin.double y = v18;
              v55.size.double width = v19;
              v55.size.double height = v20;
              v58.origin.double x = v21;
              v58.origin.double y = v22;
              v58.size.double width = v23;
              v58.size.double height = v24;
              CGRect result = CGRectEqualToRect(v55, v58);
              if (result)
              {
                v56.origin.double y = v41;
                v56.origin.double x = v42;
                v56.size.double height = v39;
                v56.size.double width = v40;
                v59.origin.double y = v37;
                v59.origin.double x = v38;
                v59.size.double height = v35;
                v59.size.double width = v36;
                CGRect result = CGRectEqualToRect(v56, v59);
                if (result)
                {
                  v57.origin.double y = v33;
                  v57.origin.double x = v34;
                  v57.size.double height = v31;
                  v57.size.double width = v32;
                  v60.origin.double y = v29;
                  v60.origin.double x = v30;
                  v60.size.double height = v27;
                  v60.size.double width = v28;
                  CGRect result = CGRectEqualToRect(v57, v60);
                  if (result) {
                    PXEdgeInsetsEqualToEdgeInsets();
                  }
                }
              }
            }
          }
        }
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(v7 + 32) + 8) + 24) = 0;
  }
  else
  {
LABEL_16:
    *(unsigned char *)(*(void *)(*(void *)(v7 + 32) + 8) + 24) = 0;
  }
LABEL_18:
  if (!*(unsigned char *)(*(void *)(*(void *)(v7 + 32) + 8) + 24))
  {
    *a6 = 1;
    **(unsigned char **)(v7 + 72) = 1;
  }
  return result;
}

+ (id)timelineByRecombiningSourceTimeline:(id)a3 withTargetTimeline:(id)a4 visibleSegmentIdentifiers:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  long long v13 = +[PXStorySettings sharedInstance];
  int v14 = [v13 allowsTimelineRecombination];
  uint64_t v15 = [v11 count];
  [v12 size];
  double v17 = v16;
  double v19 = v18;
  [v9 size];
  double v21 = v20;
  double v23 = v22;
  uint64_t v24 = [v12 dataSourceIdentifier];
  uint64_t v25 = [v9 dataSourceIdentifier];
  id v26 = v12;
  if (v9)
  {
    id v26 = v12;
    if (v12 != v9)
    {
      id v26 = v12;
      if (v24 == v25)
      {
        id v26 = v12;
        if (v17 == v21)
        {
          id v26 = v12;
          if (v19 == v23)
          {
            id v26 = v12;
            if (v15)
            {
              id v26 = v12;
              if (v14)
              {
                id v26 = v12;
                if (([v12 containsAllSegmentsWithIdentifiers:v11] & 1) == 0)
                {
                  uint64_t v45 = 0;
                  long long v46 = &v45;
                  uint64_t v47 = 0x2020000000;
                  uint64_t v48 = 0x7FFFFFFFFFFFFFFFLL;
                  v40[0] = MEMORY[0x1E4F143A8];
                  v40[1] = 3221225472;
                  v40[2] = __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke;
                  v40[3] = &unk_1E5DCD888;
                  id v27 = v9;
                  SEL v43 = a2;
                  id v44 = a1;
                  id v41 = v27;
                  CGFloat v42 = &v45;
                  [v11 enumerateIndexesUsingBlock:v40];
                  id v26 = v12;
                  if (v46[3] != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    CGFloat v28 = objc_msgSend(v12, "identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:", objc_msgSend(v27, "identifierForSegmentAtIndex:"), v27);
                    uint64_t v36 = 0;
                    CGFloat v37 = &v36;
                    uint64_t v38 = 0x2020000000;
                    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
                    v33[0] = MEMORY[0x1E4F143A8];
                    v33[1] = 3221225472;
                    v33[2] = __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke_1;
                    v33[3] = &unk_1E5DC5478;
                    id v26 = v12;
                    id v34 = v26;
                    CGFloat v35 = &v36;
                    [v28 enumerateIndexesUsingBlock:v33];
                    uint64_t v29 = v37[3];
                    if (v29 != 0x7FFFFFFFFFFFFFFFLL
                      && v29 < [v26 numberOfSegments] - 1
                      && (([v13 shouldRecombineTimelineWithSameVisibleSegments] & 1) != 0
                       || [v11 count] != 1
                       || ([a1 _isSegmentIndex:v46[3] inTimeline:v27 visuallyEqualToSegmentIndex:v37[3] inTimeline:v26] & 1) == 0))
                    {
                      id v30 = objc_alloc((Class)a1);
                      uint64_t v31 = [v30 initWithSourceTimeline:v27 upToSegmentIndex:v46[3] targetTimeline:v26 fromSegmentIndex:v37[3] + 1];

                      id v26 = (id)v31;
                    }

                    _Block_object_dispose(&v36, 8);
                  }

                  _Block_object_dispose(&v45, 8);
                }
              }
            }
          }
        }
      }
    }
  }

  return v26;
}

uint64_t __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfSegmentWithIdentifier:a2];
  if (result == 0x7FFFFFFFFFFFFFFFLL) {
    PXAssertGetLog();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(v4 + 24) = result;
  }
  else
  {
    if (v5 <= result) {
      uint64_t v6 = result;
    }
    else {
      uint64_t v6 = *(void *)(v4 + 24);
    }
    *(void *)(v4 + 24) = v6;
  }
  return result;
}

uint64_t __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke_1(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfSegmentWithIdentifier:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || result > v5) {
    *(void *)(v4 + 24) = result;
  }
  return result;
}

@end