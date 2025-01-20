@interface PXStoryDummyTimeline
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- (CGSize)size;
- (PXStoryDummyTimeline)init;
- (PXStoryDummyTimeline)initWithSize:(CGSize)a3;
- (PXStoryDummyTimeline)initWithTimeline:(id)a3;
- (id)clipWithIdentifier:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)numberOfClips;
- (int64_t)numberOfSegments;
- (void)dealloc;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4;
- (void)setNumberOfClips:(int64_t)a3;
- (void)setNumberOfSegments:(int64_t)a3;
@end

@implementation PXStoryDummyTimeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceOccurrenceCounts, 0);
  objc_storeStrong((id *)&self->_clipsByIdentifier, 0);
}

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
}

- (int64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [PXStoryMutableDummyTimeline alloc];
  return [(PXStoryDummyTimeline *)v4 initWithTimeline:self];
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v5 = a4;
  [(PXStoryDummyTimeline *)self numberOfSegments];
  id v6 = v5;
  PXEnumerateSubrangesMatchingTestUsingBlock();
}

BOOL __64__PXStoryDummyTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (_OWORD *)(*(void *)(*(void *)(a1 + 32) + 96) + 48 * a2);
  long long v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  long long v4 = v2[1];
  v6[0] = *v2;
  v6[1] = v4;
  v6[2] = v2[2];
  return PXStoryTimeRangeIntersectsTimeRange(v7, v6);
}

uint64_t __64__PXStoryDummyTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(*(void *)(a1 + 32) + 96) + 48 * a2, *(void *)(*(void *)(a1 + 32) + 104) + 200 * a2, a4);
}

- (id)clipWithIdentifier:(int64_t)a3
{
  clipsByIdentifier = self->_clipsByIdentifier;
  long long v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)clipsByIdentifier objectForKeyedSubscript:v4];

  return v5;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v6 = a5;
  [(PXStoryDummyTimeline *)self numberOfClips];
  id v7 = v6;
  PXEnumerateSubrangesMatchingTestUsingBlock();
}

BOOL __66__PXStoryDummyTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v4 = (_OWORD *)(*(void *)(*(void *)(a1 + 32) + 64) + 48 * a2);
  long long v5 = v4[1];
  v18[0] = *v4;
  v18[1] = v5;
  v18[2] = v4[2];
  long long v6 = *(_OWORD *)(a1 + 88);
  v17[0] = *(_OWORD *)(a1 + 72);
  v17[1] = v6;
  v17[2] = *(_OWORD *)(a1 + 104);
  BOOL result = PXStoryTimeRangeIntersectsTimeRange(v18, v17);
  if (result)
  {
    v8 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 72) + 32 * a2);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    uint64_t v11 = v8[2];
    uint64_t v12 = v8[3];
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    return CGRectIntersectsRect(*(CGRect *)&v9, *(CGRect *)&v13);
  }
  return result;
}

uint64_t __66__PXStoryDummyTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(*(void *)(a1 + 32) + 64) + 48 * a2, *(void *)(*(void *)(a1 + 32) + 72) + 32 * a2, *(void *)(*(void *)(a1 + 32) + 80) + 768 * a2, a4);
}

- (void)setNumberOfSegments:(int64_t)a3
{
  if (self->_numberOfSegments != a3)
  {
    self->_numberOfSegments = a3;
    int64_t segmentCapacity = self->_segmentCapacity;
    if (segmentCapacity < a3)
    {
      if (segmentCapacity)
      {
        do
        {
          segmentCapacity *= 2;
          self->_int64_t segmentCapacity = segmentCapacity;
        }
        while (segmentCapacity < self->_numberOfSegments);
      }
      else
      {
        self->_int64_t segmentCapacity = a3;
      }
      _PXGArrayResize();
    }
  }
}

- (void)setNumberOfClips:(int64_t)a3
{
  if (self->_numberOfClips != a3)
  {
    self->_numberOfClips = a3;
    int64_t clipCapacity = self->_clipCapacity;
    if (clipCapacity < a3)
    {
      if (clipCapacity)
      {
        do
        {
          clipCapacity *= 2;
          self->_int64_t clipCapacity = clipCapacity;
        }
        while (clipCapacity < self->_numberOfClips);
      }
      else
      {
        self->_int64_t clipCapacity = a3;
      }
      _PXGArrayResize();
    }
  }
}

- (void)dealloc
{
  free(self->_clipTimeRanges);
  free(self->_clipFrames);
  free(self->_clipInfos);
  free(self->_segmentTimeRanges);
  free(self->_segmentInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryDummyTimeline;
  [(PXStoryDummyTimeline *)&v3 dealloc];
}

- (PXStoryDummyTimeline)initWithTimeline:(id)a3
{
  long long v4 = (char *)a3;
  [v4 size];
  long long v5 = -[PXStoryDummyTimeline initWithSize:](self, "initWithSize:");
  long long v6 = v5;
  if (v5)
  {
    long long v8 = *(_OWORD *)(v4 + 24);
    long long v7 = *(_OWORD *)(v4 + 40);
    *(_OWORD *)&v5->_timeRange.start.value = *(_OWORD *)(v4 + 8);
    *(_OWORD *)&v5->_timeRange.start.epoch = v8;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v7;
    uint64_t v9 = [v4 numberOfClips];
    [(PXStoryDummyTimeline *)v6 setNumberOfClips:v9];
    if (v9 >= 1)
    {
      memcpy(v6->_clipTimeRanges, *((const void **)v4 + 8), 48 * v9);
      memcpy(v6->_clipFrames, *((const void **)v4 + 9), 32 * v9);
      memcpy(v6->_clipInfos, *((const void **)v4 + 10), 768 * v9);
    }
    uint64_t v10 = [v4 numberOfSegments];
    [(PXStoryDummyTimeline *)v6 setNumberOfSegments:v10];
    if (v10 >= 1)
    {
      memcpy(v6->_segmentTimeRanges, *((const void **)v4 + 12), 48 * v10);
      memcpy(v6->_segmentInfos, *((const void **)v4 + 13), 200 * v10);
    }
    [(NSMutableDictionary *)v6->_clipsByIdentifier setDictionary:*((void *)v4 + 14)];
    uint64_t v11 = [*((id *)v4 + 15) copy];
    resourceOccurrenceCounts = v6->_resourceOccurrenceCounts;
    v6->_resourceOccurrenceCounts = (NSCountedSet *)v11;
  }
  return v6;
}

- (PXStoryDummyTimeline)initWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryDummyTimeline;
  long long v5 = [(PXStoryDummyTimeline *)&v12 init];
  long long v6 = (PXStoryDummyTimeline *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *((CGFloat *)v5 + 18) = width;
    *((CGFloat *)v5 + 19) = height;
    long long v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clipsByIdentifier = v6->_clipsByIdentifier;
    v6->_clipsByIdentifier = v7;

    uint64_t v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    resourceOccurrenceCounts = v6->_resourceOccurrenceCounts;
    v6->_resourceOccurrenceCounts = v9;
  }
  return v6;
}

- (PXStoryDummyTimeline)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDummyTimeline.m", 40, @"%s is not available as initializer", "-[PXStoryDummyTimeline init]");

  abort();
}

@end