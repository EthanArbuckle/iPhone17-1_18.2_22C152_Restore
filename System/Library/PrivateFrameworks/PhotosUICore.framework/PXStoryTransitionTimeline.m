@interface PXStoryTransitionTimeline
- ($0AC6E346AE4835514AAA8AC86D8F4844)transitionInfo;
- ($1FE1EEDD30F8401E3A9AF97812D83A51)_transitionClipInfoWithIdentifier:(SEL)a3 fromOriginalClipInfo:(int64_t)a4;
- (CGPoint)_offsetBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4;
- (PXCArrayStore)clipFrames;
- (PXCArrayStore)clipInfos;
- (PXCArrayStore)clipTimeRanges;
- (PXCArrayStore)segmentInfos;
- (PXCArrayStore)segmentTimeRanges;
- (PXStoryTransitionTimeline)initWithOriginalTimeline:(id)a3;
- (PXStoryTransitionTimeline)initWithOriginalTimeline:(id)a3 transitionInfo:(id)a4;
- (id)clipWithIdentifier:(int64_t)a3;
- (int64_t)numberOfSegments;
- (void)_modifyClipsIfNeeded:(id *)a3 frames:(const CGRect *)a4 infos:(id *)a5 count:(int64_t)a6 resultHandler:(id)a7;
- (void)_modifySegmentsIfNeeded:(id *)a3 infos:(id *)a4 count:(int64_t)a5 resultHandler:(id)a6;
- (void)_prepareForTransitionInfo:(id)a3;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4;
@end

@implementation PXStoryTransitionTimeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipInfos, 0);
  objc_storeStrong((id *)&self->_clipFrames, 0);
  objc_storeStrong((id *)&self->_clipTimeRanges, 0);
  objc_storeStrong((id *)&self->_segmentInfos, 0);
  objc_storeStrong((id *)&self->_segmentTimeRanges, 0);
  objc_storeStrong((id *)&self->_duplicateClipIdentifiersByOriginalClipIdentifiers, 0);
  objc_storeStrong((id *)&self->_originalClipIdentifiersByDuplicateClipIdentifiers, 0);
  objc_storeStrong((id *)&self->_clipIdentifiersInTransition, 0);
}

- (PXCArrayStore)clipInfos
{
  return self->_clipInfos;
}

- (PXCArrayStore)clipFrames
{
  return self->_clipFrames;
}

- (PXCArrayStore)clipTimeRanges
{
  return self->_clipTimeRanges;
}

- (PXCArrayStore)segmentInfos
{
  return self->_segmentInfos;
}

- (PXCArrayStore)segmentTimeRanges
{
  return self->_segmentTimeRanges;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)transitionInfo
{
  p_transitionInfo = &self->_transitionInfo;
  int64_t fromSegmentIdentifier = self->_transitionInfo.fromSegmentIdentifier;
  int64_t toSegmentIdentifier = p_transitionInfo->toSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- ($1FE1EEDD30F8401E3A9AF97812D83A51)_transitionClipInfoWithIdentifier:(SEL)a3 fromOriginalClipInfo:(int64_t)a4
{
  if ((unint64_t)(a5->var5 - 3) < 3) {
    int64_t var5 = 1;
  }
  else {
    int64_t var5 = a5->var5;
  }
  $0AC6E346AE4835514AAA8AC86D8F4844 result = ($1FE1EEDD30F8401E3A9AF97812D83A51 *)memcpy(retstr, a5, 0x300uLL);
  retstr->var0 = a4;
  retstr->int64_t var5 = var5;
  return result;
}

- (id)clipWithIdentifier:(int64_t)a3
{
  originalClipIdentifiersByDuplicateClipIdentifiers = self->_originalClipIdentifiersByDuplicateClipIdentifiers;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:");
  v7 = [(NSMutableDictionary *)originalClipIdentifiersByDuplicateClipIdentifiers objectForKeyedSubscript:v6];

  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)PXStoryTransitionTimeline;
    v8 = -[PXStoryDerivedTimeline clipWithIdentifier:](&v17, sel_clipWithIdentifier_, [v7 integerValue]);
    v9 = v8;
    memset(__src, 0, 512);
    if (v8) {
      [v8 info];
    }
    else {
      bzero(v15, 0x300uLL);
    }
    [(PXStoryTransitionTimeline *)self _transitionClipInfoWithIdentifier:a3 fromOriginalClipInfo:v15];
    v11 = [PXStoryTransitionClip alloc];
    memcpy(__dst, __src, sizeof(__dst));
    v10 = [(PXStoryTransitionClip *)v11 initWithClipInfo:__dst originalClip:v9];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PXStoryTransitionTimeline;
    v10 = [(PXStoryDerivedTimeline *)&v13 clipWithIdentifier:a3];
  }

  return v10;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  v12 = [(PXStoryDerivedTimeline *)self originalTimeline];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v16[3] = &unk_1E5DBC428;
  v16[4] = self;
  id v17 = v11;
  long long v13 = *(_OWORD *)&a3->var0.var3;
  v15[0] = *(_OWORD *)&a3->var0.var0;
  v15[1] = v13;
  v15[2] = *(_OWORD *)&a3->var1.var1;
  id v14 = v11;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v15, v16, x, y, width, height);
}

void __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v12[3] = &unk_1E5DB5920;
  id v11 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = a6;
  [v11 _modifyClipsIfNeeded:a3 frames:a4 infos:a5 count:a2 resultHandler:v12];
}

uint64_t __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a5, a2, a3, a4, *(void *)(a1 + 40));
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v7 = [(PXStoryDerivedTimeline *)self originalTimeline];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke;
  v11[3] = &unk_1E5DB58F8;
  v11[4] = self;
  id v12 = v6;
  long long v8 = *(_OWORD *)&a3->var0.var3;
  v10[0] = *(_OWORD *)&a3->var0.var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a3->var1.var1;
  id v9 = v6;
  [v7 enumerateSegmentsInTimeRange:v10 usingBlock:v11];
}

void __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2;
  _OWORD v10[3] = &unk_1E5DB58D0;
  id v9 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = a5;
  [v9 _modifySegmentsIfNeeded:a3 infos:a4 count:a2 resultHandler:v10];
}

uint64_t __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a4, a2, a3, *(void *)(a1 + 40));
}

- (int64_t)numberOfSegments
{
  v3 = [(PXStoryDerivedTimeline *)self originalTimeline];
  int64_t v4 = [v3 numberOfSegments];

  if (self->_duplicateSegmentIdentifier) {
    return v4 + 1;
  }
  else {
    return v4;
  }
}

- (void)_modifyClipsIfNeeded:(id *)a3 frames:(const CGRect *)a4 infos:(id *)a5 count:(int64_t)a6 resultHandler:(id)a7
{
  id v12 = a7;
  uint64_t v13 = [(NSMutableIndexSet *)self->_clipIdentifiersInTransition count] + a6;
  uint64_t v14 = [(PXStoryTransitionTimeline *)self clipTimeRanges];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke;
  v16[3] = &unk_1E5DB5880;
  uint64_t v18 = v13;
  int64_t v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v14 accessArrayWithElementsCount:v13 accessBlock:v16];
}

void __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int64_t v4 = [*(id *)(a1 + 32) clipFrames];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_2;
  v8[3] = &unk_1E5DB58A8;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 48);
  long long v11 = v6;
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v12 = a2;
  uint64_t v13 = v7;
  id v9 = v5;
  [v4 accessArrayWithElementsCount:(void)v10 accessBlock:v8];
}

void __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  int64_t v4 = [*(id *)(a1 + 32) clipInfos];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  long long v5 = *(_OWORD *)(a1 + 80);
  long long v12 = *(_OWORD *)(a1 + 64);
  v9[2] = __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_3;
  v9[3] = &unk_1E5DB58A8;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  long long v8 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 56);
  v9[4] = v7;
  uint64_t v13 = a2;
  long long v14 = v5;
  id v10 = v8;
  [v4 accessArrayWithElementsCount:v6 accessBlock:v9];
}

uint64_t __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_3(void *a1, uint64_t a2)
{
  if ((uint64_t)a1[6] >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      if ([*(id *)(a1[4] + 16) containsIndex:*(void *)(a1[7] + v6)]) {
        PXRectGetCenter();
      }
      id v9 = (_OWORD *)(a1[9] + 32 * v7);
      id v10 = (_OWORD *)(a1[8] + v5);
      long long v11 = v10[1];
      _OWORD *v9 = *v10;
      v9[1] = v11;
      long long v12 = (_OWORD *)(a1[10] + 48 * v7);
      uint64_t v13 = (long long *)(a1[11] + v4);
      long long v14 = *v13;
      long long v15 = v13[2];
      v12[1] = v13[1];
      v12[2] = v15;
      _OWORD *v12 = v14;
      memcpy((void *)(a2 + 768 * v7), (const void *)(a1[7] + v6), 0x300uLL);
      ++v8;
      v6 += 768;
      v5 += 32;
      v4 += 48;
      ++v7;
    }
    while (v8 < a1[6]);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)_modifySegmentsIfNeeded:(id *)a3 infos:(id *)a4 count:(int64_t)a5 resultHandler:(id)a6
{
  id v10 = a6;
  int64_t v11 = a5 + 1;
  uint64_t v12 = [(PXStoryTransitionTimeline *)self transitionInfo];
  uint64_t v13 = [(PXStoryTransitionTimeline *)self segmentTimeRanges];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke;
  _OWORD v15[3] = &unk_1E5DB5880;
  int64_t v17 = a5 + 1;
  int64_t v18 = a5;
  int64_t v19 = a4;
  v20 = a3;
  uint64_t v21 = v12;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 accessArrayWithElementsCount:v11 accessBlock:v15];
}

void __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) segmentInfos];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke_2;
  _OWORD v10[3] = &unk_1E5DB5880;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = a2;
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v16 = v7;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  uint64_t v12 = v5;
  void v10[4] = v8;
  id v11 = v9;
  [v4 accessArrayWithElementsCount:v6 accessBlock:v10];
}

uint64_t __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke_2(void *a1, uint64_t a2)
{
  if ((uint64_t)a1[6] >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1[7] + v3);
      uint64_t v7 = (_OWORD *)(a1[8] + 48 * v5);
      uint64_t v8 = (long long *)(a1[9] + v2);
      long long v9 = *v8;
      long long v10 = v8[2];
      v7[1] = v8[1];
      v7[2] = v10;
      _OWORD *v7 = v9;
      uint64_t v11 = a2 + 200 * v5;
      uint64_t v12 = a1[7] + v3;
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
      long long v13 = *(_OWORD *)(v12 + 16);
      long long v14 = *(_OWORD *)(v12 + 32);
      long long v15 = *(_OWORD *)(v12 + 64);
      *(_OWORD *)(v11 + 48) = *(_OWORD *)(v12 + 48);
      *(_OWORD *)(v11 + 64) = v15;
      *(_OWORD *)(v11 + 16) = v13;
      *(_OWORD *)(v11 + 32) = v14;
      long long v16 = *(_OWORD *)(v12 + 80);
      long long v17 = *(_OWORD *)(v12 + 96);
      long long v18 = *(_OWORD *)(v12 + 128);
      *(_OWORD *)(v11 + 112) = *(_OWORD *)(v12 + 112);
      *(_OWORD *)(v11 + 128) = v18;
      *(_OWORD *)(v11 + 80) = v16;
      *(_OWORD *)(v11 + 96) = v17;
      long long v19 = *(_OWORD *)(v12 + 144);
      long long v20 = *(_OWORD *)(v12 + 160);
      long long v21 = *(_OWORD *)(v12 + 176);
      *(void *)(v11 + 192) = *(void *)(v12 + 192);
      *(_OWORD *)(v11 + 160) = v20;
      *(_OWORD *)(v11 + 176) = v21;
      *(_OWORD *)(v11 + 144) = v19;
      uint64_t v22 = v5 + 1;
      if (v6 == a1[10])
      {
        v23 = (_OWORD *)(a1[8] + 48 * v22);
        v24 = (long long *)(a1[9] + v2);
        long long v25 = *v24;
        long long v26 = v24[2];
        v23[1] = v24[1];
        v23[2] = v26;
        _OWORD *v23 = v25;
        uint64_t v27 = a2 + 200 * v22;
        uint64_t v28 = a1[7] + v3;
        *(_OWORD *)uint64_t v27 = *(_OWORD *)v28;
        long long v29 = *(_OWORD *)(v28 + 16);
        long long v30 = *(_OWORD *)(v28 + 32);
        long long v31 = *(_OWORD *)(v28 + 64);
        *(_OWORD *)(v27 + 48) = *(_OWORD *)(v28 + 48);
        *(_OWORD *)(v27 + 64) = v31;
        *(_OWORD *)(v27 + 16) = v29;
        *(_OWORD *)(v27 + 32) = v30;
        long long v32 = *(_OWORD *)(v28 + 80);
        long long v33 = *(_OWORD *)(v28 + 96);
        long long v34 = *(_OWORD *)(v28 + 128);
        *(_OWORD *)(v27 + 112) = *(_OWORD *)(v28 + 112);
        *(_OWORD *)(v27 + 128) = v34;
        *(_OWORD *)(v27 + 80) = v32;
        *(_OWORD *)(v27 + 96) = v33;
        long long v35 = *(_OWORD *)(v28 + 144);
        long long v36 = *(_OWORD *)(v28 + 160);
        long long v37 = *(_OWORD *)(v28 + 176);
        *(void *)(v27 + 192) = *(void *)(v28 + 192);
        *(_OWORD *)(v27 + 160) = v36;
        *(_OWORD *)(v27 + 176) = v37;
        *(_OWORD *)(v27 + 144) = v35;
        *(void *)uint64_t v27 = *(void *)(a1[4] + 88);
        uint64_t v22 = v5 + 2;
      }
      ++v4;
      v3 += 200;
      v2 += 48;
      uint64_t v5 = v22;
    }
    while (v4 < a1[6]);
  }
  return (*(uint64_t (**)(void, void, uint64_t))(a1[5] + 16))(a1[5], a1[8], a2);
}

- (CGPoint)_offsetBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4
{
  uint64_t v6 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v6 frameForSegmentWithIdentifier:a3];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 frameForSegmentWithIdentifier:a4];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  v24.origin.double x = v8;
  v24.origin.double y = v10;
  v24.size.double width = v12;
  v24.size.double height = v14;
  CGRectGetMinX(v24);
  v25.origin.double x = v8;
  v25.origin.double y = v10;
  v25.size.double width = v12;
  v25.size.double height = v14;
  CGRectGetMinY(v25);
  v26.origin.double x = v16;
  v26.origin.double y = v18;
  v26.size.double width = v20;
  v26.size.double height = v22;
  CGRectGetMinX(v26);
  v27.origin.double x = v16;
  v27.origin.double y = v18;
  v27.size.double width = v20;
  v27.size.double height = v22;
  CGRectGetMinY(v27);
  PXPointSubtract();
}

- (void)_prepareForTransitionInfo:(id)a3
{
  if (a3.var0 | a3.var1)
  {
    uint64_t v4 = [(PXStoryDerivedTimeline *)self originalTimeline];
    uint64_t v5 = [(PXStoryTransitionTimeline *)self transitionInfo];
    uint64_t v7 = v6;
    [v4 frameForSegmentWithIdentifier:v5];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    p_fromSegmentTimeRange = &self->_fromSegmentTimeRange;
    if (v4)
    {
      [v4 timeRangeForSegmentWithIdentifier:v5];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v22 = 0u;
    }
    long long v17 = v23;
    *(_OWORD *)&p_fromSegmentTimeRange->start.value = v22;
    *(_OWORD *)&self->_fromSegmentTimeRange.start.epoch = v17;
    *(_OWORD *)&self->_fromSegmentTimeRange.duration.timescale = v24;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __55__PXStoryTransitionTimeline__prepareForTransitionInfo___block_invoke;
    v21[3] = &unk_1E5DBF840;
    v21[4] = self;
    long long v18 = *(_OWORD *)&self->_fromSegmentTimeRange.start.epoch;
    long long v22 = *(_OWORD *)&p_fromSegmentTimeRange->start.value;
    long long v23 = v18;
    long long v24 = *(_OWORD *)&self->_fromSegmentTimeRange.duration.timescale;
    objc_msgSend(v4, "enumerateClipsInTimeRange:rect:usingBlock:", &v22, v21, v9, v11, v13, v15);
    [(PXStoryTransitionTimeline *)self _offsetBetweenSegmentWithIdentifier:v5 andSegmentWithIdentifier:v7];
    self->_fromSegmentClipOffset.double x = v19;
    self->_fromSegmentClipOffset.double y = v20;
    self->_duplicateSegmentIdentifier = v5 + 1000000;
  }
}

void __55__PXStoryTransitionTimeline__prepareForTransitionInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (a2 >= 1)
  {
    uint64_t v28 = v14;
    uint64_t v29 = v13;
    uint64_t v30 = v12;
    uint64_t v31 = v11;
    uint64_t v32 = v10;
    uint64_t v33 = v9;
    uint64_t v34 = v8;
    uint64_t v35 = v7;
    uint64_t v36 = v6;
    uint64_t v37 = v5;
    uint64_t v38 = v15;
    uint64_t v39 = v16;
    uint64_t v18 = a2;
    do
    {
      uint64_t v20 = *a5;
      uint64_t v21 = *a5 + 1000000;
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "addIndex:", *a5, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
      long long v22 = [NSNumber numberWithInteger:v20];
      long long v23 = *(void **)(*(void *)(a1 + 32) + 96);
      long long v24 = [NSNumber numberWithInteger:v21];
      [v23 setObject:v22 forKeyedSubscript:v24];

      CGRect v25 = [NSNumber numberWithInteger:v21];
      CGRect v26 = *(void **)(*(void *)(a1 + 32) + 104);
      CGRect v27 = [NSNumber numberWithInteger:v20];
      [v26 setObject:v25 forKeyedSubscript:v27];

      a5 += 96;
      --v18;
    }
    while (v18);
  }
}

- (PXStoryTransitionTimeline)initWithOriginalTimeline:(id)a3 transitionInfo:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  v24.receiver = self;
  v24.super_class = (Class)PXStoryTransitionTimeline;
  uint64_t v6 = [(PXStoryDerivedTimeline *)&v24 initWithOriginalTimeline:a3];
  if (v6)
  {
    uint64_t v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    clipIdentifiersInTransition = v6->_clipIdentifiersInTransition;
    v6->_clipIdentifiersInTransition = v7;

    uint64_t v9 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:48];
    segmentTimeRanges = v6->_segmentTimeRanges;
    v6->_segmentTimeRanges = (PXCArrayStore *)v9;

    uint64_t v11 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:200];
    segmentInfos = v6->_segmentInfos;
    v6->_segmentInfos = (PXCArrayStore *)v11;

    uint64_t v13 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:48];
    clipTimeRanges = v6->_clipTimeRanges;
    v6->_clipTimeRanges = (PXCArrayStore *)v13;

    uint64_t v15 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:32];
    clipFrames = v6->_clipFrames;
    v6->_clipFrames = (PXCArrayStore *)v15;

    uint64_t v17 = [objc_alloc((Class)off_1E5DA57C0) initWithElementSize:768];
    clipInfos = v6->_clipInfos;
    v6->_clipInfos = (PXCArrayStore *)v17;

    v6->_transitionInfo.int64_t fromSegmentIdentifier = var0;
    v6->_transitionInfo.int64_t toSegmentIdentifier = var1;
    v6->_duplicateSegmentIdentifier = 0;
    CGFloat v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    originalClipIdentifiersByDuplicateClipIdentifiers = v6->_originalClipIdentifiersByDuplicateClipIdentifiers;
    v6->_originalClipIdentifiersByDuplicateClipIdentifiers = v19;

    uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    duplicateClipIdentifiersByOriginalClipIdentifiers = v6->_duplicateClipIdentifiersByOriginalClipIdentifiers;
    v6->_duplicateClipIdentifiersByOriginalClipIdentifiers = v21;

    -[PXStoryTransitionTimeline _prepareForTransitionInfo:](v6, "_prepareForTransitionInfo:", var0, var1);
  }
  return v6;
}

- (PXStoryTransitionTimeline)initWithOriginalTimeline:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTransitionTimeline.m", 53, @"%s is not available as initializer", "-[PXStoryTransitionTimeline initWithOriginalTimeline:]");

  abort();
}

@end