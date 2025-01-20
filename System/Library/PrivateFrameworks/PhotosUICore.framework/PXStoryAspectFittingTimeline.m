@interface PXStoryAspectFittingTimeline
- (NSArray)keySegmentDisplayAssetClips;
- (PXStoryAspectFittingTimeline)initWithOriginalTimeline:(id)a3 keySegmentMix:(id *)a4;
- (int64_t)keySegmentIdentifier;
- (void)_enumerateClipsKeySegmentWithTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)_setupKeySegmentDisplayAssetClips;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
@end

@implementation PXStoryAspectFittingTimeline

- (void).cxx_destruct
{
}

- (NSArray)keySegmentDisplayAssetClips
{
  return self->_keySegmentDisplayAssetClips;
}

- (int64_t)keySegmentIdentifier
{
  return self->_keySegmentIdentifier;
}

- (void)_enumerateClipsKeySegmentWithTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __87__PXStoryAspectFittingTimeline__enumerateClipsKeySegmentWithTimeRange_rect_usingBlock___block_invoke;
  v34[3] = &unk_1E5DC9EE0;
  id v12 = v11;
  id v35 = v12;
  v33.receiver = self;
  v33.super_class = (Class)PXStoryAspectFittingTimeline;
  long long v13 = *(_OWORD *)&a3->var0.var3;
  v24[0] = *(_OWORD *)&a3->var0.var0;
  v24[1] = v13;
  v24[2] = *(_OWORD *)&a3->var1.var1;
  -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v33, sel_enumerateClipsInTimeRange_rect_usingBlock_, v24, v34, x, y, width, height);
  char v32 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v14 = [(PXStoryAspectFittingTimeline *)self keySegmentDisplayAssetClips];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v29 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
      [v19 clipFrame];
      v39.origin.double x = x;
      v39.origin.double y = y;
      v39.size.double width = width;
      v39.size.double height = height;
      if (CGRectIntersectsRect(v38, v39))
      {
        long long v26 = 0u;
        long long v27 = 0u;
        [v19 transformedFrame];
        *(void *)&long long v26 = v20;
        *((void *)&v26 + 1) = v21;
        *(void *)&long long v27 = v22;
        *((void *)&v27 + 1) = v23;
        memset(v25, 0, sizeof(v25));
        if (v19)
        {
          [v19 clipTimeRange];
          memset(&v24[30], 0, 32);
          objc_msgSend(v19, "clipInfo", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);
        }
        else
        {
          bzero(v24, 0x300uLL);
        }
        (*((void (**)(id, uint64_t, _OWORD *, long long *, _OWORD *, char *))v12 + 2))(v12, 1, v25, &v26, v24, &v32);
        if (v32) {
          break;
        }
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

uint64_t __87__PXStoryAspectFittingTimeline__enumerateClipsKeySegmentWithTimeRange_rect_usingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    uint64_t v8 = a2;
    uint64_t v9 = result;
    do
    {
      if (*(void *)(a5 + 8) != 1) {
        result = (*(uint64_t (**)(void))(*(void *)(v9 + 32) + 16))();
      }
      a4 += 32;
      a3 += 48;
      a5 += 768;
      --v8;
    }
    while (v8);
  }
  return result;
}

- (void)_setupKeySegmentDisplayAssetClips
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  if (!self->_keySegmentDisplayAssetClips)
  {
    v2.receiver = self;
    v2.super_class = (Class)PXStoryAspectFittingTimeline;
    [(PXStoryDerivedTimeline *)&v2 frameForSegmentWithIdentifier:[(PXStoryAspectFittingTimeline *)self keySegmentIdentifier]];
    PXSizeGetAspectRatio();
  }
}

void __65__PXStoryAspectFittingTimeline__setupKeySegmentDisplayAssetClips__block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    uint64_t v7 = a2;
    uint64_t v9 = (double *)(a4 + 16);
    do
    {
      if (a5[1] == 1)
      {
        v10 = [*(id *)(a1 + 32) clipWithIdentifier:*a5];
        id v11 = objc_alloc_init(_PXStoryAspectFittingTimeline_DisplayAssetClip);
        -[_PXStoryAspectFittingTimeline_DisplayAssetClip setClipFrame:](v11, "setClipFrame:", *(v9 - 2), *(v9 - 1), *v9, v9[1]);
        long long v12 = a3[1];
        v16[0] = *a3;
        v16[1] = v12;
        v16[2] = a3[2];
        [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)v11 setClipTimeRange:v16];
        memcpy(v15, a5, sizeof(v15));
        [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)v11 setClipInfo:v15];
        long long v13 = [v10 resource];
        v14 = objc_msgSend(v13, "px_storyResourceDisplayAsset");
        [(_PXStoryAspectFittingTimeline_DisplayAssetClip *)v11 setDisplayAsset:v14];

        [*(id *)(a1 + 40) addObject:v11];
      }
      a3 += 3;
      v9 += 4;
      a5 += 96;
      --v7;
    }
    while (v7);
  }
}

void __65__PXStoryAspectFittingTimeline__setupKeySegmentDisplayAssetClips__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setWeight:", (float)(1.0 / (float)*(unint64_t *)(a1 + 40)), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  memset(&v26[1], 0, sizeof(CMTimeRange));
  [(PXStoryDerivedTimeline *)self timeRangeForSegmentWithIdentifier:[(PXStoryAspectFittingTimeline *)self keySegmentIdentifier]];
  long long v12 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs.start.epoch = v12;
  *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
  v26[0] = v26[1];
  if (PXStoryTimeRangeIntersectsTimeRange(&lhs, v26))
  {
    memset(v26, 0, 48);
    long long v13 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&lhs.start.epoch = v13;
    *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRange v24 = v26[1];
    PXStoryTimeRangeIntersection(&lhs, &v24, v26);
    memset(&v24, 0, sizeof(v24));
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v26[0].start.value;
    lhs.start.epoch = v26[0].start.epoch;
    *(_OWORD *)&rhs.start.value = *(_OWORD *)&a3->var0.var0;
    rhs.start.epoch = a3->var0.var3;
    CMTimeSubtract(&v23, &lhs.start, &rhs.start);
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&v26[0].start.value;
    lhs.start.epoch = v26[0].start.epoch;
    rhs.start = v23;
    CMTimeRangeMake(&v24, &lhs.start, &rhs.start);
    memset(&rhs, 0, sizeof(rhs));
    CMTimeRange lhs = v26[0];
    CMTimeRangeGetEnd(&v21, &lhs);
    long long v14 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&lhs.start.epoch = v14;
    *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v19, &lhs);
    CMTimeRange lhs = v26[0];
    CMTimeRangeGetEnd(&v18, &lhs);
    lhs.start = v19;
    CMTime duration = v18;
    CMTimeSubtract(&v20, &lhs.start, &duration);
    lhs.start = v21;
    CMTime duration = v20;
    CMTimeRangeMake(&rhs, &lhs.start, &duration);
    v17.receiver = self;
    v17.super_class = (Class)PXStoryAspectFittingTimeline;
    CMTimeRange lhs = v24;
    -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v17, sel_enumerateClipsInTimeRange_rect_usingBlock_, &lhs, v11, x, y, width, height);
    CMTimeRange lhs = v26[0];
    -[PXStoryAspectFittingTimeline _enumerateClipsKeySegmentWithTimeRange:rect:usingBlock:](self, "_enumerateClipsKeySegmentWithTimeRange:rect:usingBlock:", &lhs, v11, x, y, width, height);
    CMTimeRange lhs = rhs;
    -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v16, sel_enumerateClipsInTimeRange_rect_usingBlock_, &lhs, v11, x, y, width, height, self, PXStoryAspectFittingTimeline);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)PXStoryAspectFittingTimeline;
    long long v15 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&lhs.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&lhs.start.epoch = v15;
    *(_OWORD *)&lhs.duration.timescale = *(_OWORD *)&a3->var1.var1;
    -[PXStoryDerivedTimeline enumerateClipsInTimeRange:rect:usingBlock:](&v25, sel_enumerateClipsInTimeRange_rect_usingBlock_, &lhs, v11, x, y, width, height, v16.receiver, v16.super_class);
  }
}

- (PXStoryAspectFittingTimeline)initWithOriginalTimeline:(id)a3 keySegmentMix:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PXStoryAspectFittingTimeline;
  uint64_t v5 = [(PXStoryDerivedTimeline *)&v9 initWithOriginalTimeline:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    p_var2 = ($7DA682ECC7253F641496E0B6E9C98204 *)&a4->var2;
    if (a4->var1 <= 0.5) {
      p_var2 = a4;
    }
    v5->_keySegmentIdentifier = p_var2->var0;
    [(PXStoryAspectFittingTimeline *)v5 _setupKeySegmentDisplayAssetClips];
  }
  return v6;
}

@end