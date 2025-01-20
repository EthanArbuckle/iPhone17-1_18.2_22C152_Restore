@interface PXStoryBaseTimeline
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3;
- ($822F6CB856AD2B5FF5331D18434BEEDC)infoForSegmentWithIdentifier:(SEL)a3;
- (BOOL)containsAllSegmentsWithIdentifiers:(id)a3;
- (BOOL)containsSegmentWithIdentifier:(int64_t)a3;
- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3;
- (CGSize)size;
- (NSString)diagnosticDescription;
- (id)clipWithIdentifier:(int64_t)a3;
- (id)clipWithResourceKind:(int64_t)a3 afterClipIdentifier:(int64_t)a4;
- (id)identifiersOfSegmentsMatchingSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4;
- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5;
- (id)segmentIdentifiersInTimeRange:(id *)a3 rect:(CGRect)a4;
- (int64_t)dataSourceIdentifier;
- (int64_t)firstSegmentIdentifier;
- (int64_t)identifierForSegmentAtIndex:(int64_t)a3;
- (int64_t)identifierForSegmentWithOffset:(id *)a3 fromEndOfSegmentWithIdentifier:(int64_t)a4 timeIntoSegment:(id *)a5;
- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)identifierOfFirstSegmentContainingAsset:(id)a3;
- (int64_t)identifierOfSegmentClosestToSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4;
- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3;
- (int64_t)lastSegmentIdentifier;
- (int64_t)numberOfClipsWithResourceKind:(int64_t)a3;
- (int64_t)numberOfSegments;
- (void)_findSegmentMatchingIdentifier:(int64_t)a3 timeRange:(id *)a4 info:(id *)a5;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4;
@end

@implementation PXStoryBaseTimeline

- (NSString)diagnosticDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(PXStoryBaseTimeline *)self timeRange];
  v6 = PXStoryTimeRangeDescription((uint64_t)v11);
  [(PXStoryBaseTimeline *)self size];
  v7 = NSStringFromCGSize(v12);
  v8 = (void *)[v3 initWithFormat:@"<%@: %p, timeRange=%@, size=%@\n", v5, self, v6, v7];

  [v8 appendFormat:@"== Clips ==\n"];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  [(PXStoryBaseTimeline *)self timeRange];
  [(PXStoryBaseTimeline *)self size];
  PXRectWithOriginAndSize();
}

void __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v22 = v5;
    uint64_t v23 = v6;
    uint64_t v8 = a2;
    uint64_t v10 = a4 + 16;
    v11 = (unint64_t *)(a5 + 8);
    do
    {
      uint64_t v12 = *(v11 - 1);
      unint64_t v13 = *v11;
      v20 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      long long v15 = a3[1];
      v21[0] = *a3;
      v21[1] = v15;
      v21[2] = a3[2];
      v16 = PXStoryTimeRangeDescription((uint64_t)v21);
      v17 = NSStringFromCGRect(*(CGRect *)(v10 - 16));
      v18 = @"??";
      if (v13 <= 5) {
        v18 = off_1E5DC4FD0[v13];
      }
      v11 += 96;
      v19 = v18;
      [v20 appendFormat:@"\t%li: %@ frame=%@ id=%li kind=%@\n", v14, v16, v17, v12, v19];

      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v10 += 32;
      a3 += 3;
      --v8;
    }
    while (v8);
  }
}

void __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke_2(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  if (a2 >= 1)
  {
    uint64_t v27 = v4;
    uint64_t v28 = v5;
    uint64_t v7 = a2;
    uint64_t v9 = a4 + 48;
    do
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      long long v12 = a3[1];
      long long v20 = *a3;
      long long v21 = v12;
      long long v22 = a3[2];
      unint64_t v13 = PXStoryTimeRangeDescription((uint64_t)&v20);
      long long v14 = *(_OWORD *)(v9 + 88);
      long long v15 = *(_OWORD *)(v9 + 120);
      long long v24 = *(_OWORD *)(v9 + 104);
      long long v25 = v15;
      long long v26 = *(_OWORD *)(v9 + 136);
      long long v16 = *(_OWORD *)(v9 + 56);
      long long v20 = *(_OWORD *)(v9 + 40);
      long long v21 = v16;
      long long v22 = *(_OWORD *)(v9 + 72);
      long long v23 = v14;
      v17 = PXStoryDurationInfoDescription(&v20);
      long long v18 = *(_OWORD *)(v9 + 16);
      long long v20 = *(_OWORD *)v9;
      long long v21 = v18;
      *(void *)&long long v22 = *(void *)(v9 + 32);
      v19 = PXStoryTransitionInfoDescription((unsigned __int8 *)&v20);
      [v10 appendFormat:@"\t%li: %@ %@ %@ id=%li\n", v11, v13, v17, v19, *(void *)(v9 - 48)];

      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      v9 += 200;
      a3 += 3;
      --v7;
    }
    while (v7);
  }
}

void __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (a2 >= 1)
  {
    uint64_t v51 = v5;
    uint64_t v52 = v6;
    do
    {
      uint64_t v10 = *a5;
      uint64_t v9 = a5[1];
      uint64_t v28 = a2;
      long long v11 = *(_OWORD *)(a5 + 11);
      long long v12 = *(_OWORD *)(a5 + 15);
      long long v48 = *(_OWORD *)(a5 + 13);
      long long v49 = v12;
      long long v50 = *(_OWORD *)(a5 + 17);
      long long v13 = *(_OWORD *)(a5 + 7);
      long long v44 = *(_OWORD *)(a5 + 5);
      long long v45 = v13;
      long long v46 = *(_OWORD *)(a5 + 9);
      long long v47 = v11;
      long long v14 = *((_OWORD *)a5 + 13);
      long long v37 = *((_OWORD *)a5 + 12);
      long long v38 = v14;
      long long v15 = *((_OWORD *)a5 + 11);
      long long v35 = *((_OWORD *)a5 + 10);
      long long v36 = v15;
      long long v16 = *((_OWORD *)a5 + 18);
      long long v17 = *((_OWORD *)a5 + 16);
      long long v42 = *((_OWORD *)a5 + 17);
      long long v43 = v16;
      long long v18 = *((_OWORD *)a5 + 15);
      long long v39 = *((_OWORD *)a5 + 14);
      long long v40 = v18;
      long long v41 = v17;
      memcpy(__dst, a5 + 38, sizeof(__dst));
      long long v19 = *((_OWORD *)a5 + 43);
      long long v31 = *((_OWORD *)a5 + 42);
      long long v32 = v19;
      uint64_t v33 = a5[88];
      long long v20 = *(_OWORD *)(a5 + 91);
      v29[9] = *(_OWORD *)(a5 + 89);
      v29[10] = v20;
      v29[11] = *(_OWORD *)(a5 + 93);
      uint64_t v30 = a5[95];
      long long v21 = [*(id *)(a1 + 32) clipWithIdentifier:v10];
      long long v22 = *(void **)(a1 + 40);
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      long long v24 = [v21 resource];
      long long v25 = objc_msgSend(v24, "px_storyResourceIdentifier");
      [v22 appendFormat:@"\t%li (id=%li): resourceID=%@\n", v23, v10, v25];

      if (v9 == 1)
      {
        long long v26 = *(void **)(a1 + 40);
        v29[4] = v48;
        v29[5] = v49;
        v29[6] = v50;
        v29[0] = v44;
        v29[1] = v45;
        v29[2] = v46;
        v29[3] = v47;
        uint64_t v27 = PXStoryDurationInfoDescription(v29);
        [v26 appendFormat:@"\t\tDuration=%@\n", v27];

        PXDisplayAssetPlaybackStyleDescription();
      }
      a5 += 96;
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

      a2 = v28 - 1;
    }
    while (v28 != 1);
  }
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  return 0;
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  return 0;
}

- (id)segmentIdentifiersInTimeRange:(id *)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __58__PXStoryBaseTimeline_segmentIdentifiersInTimeRange_rect___block_invoke;
  long long v21 = &unk_1E5DB92A0;
  CGFloat v24 = x;
  CGFloat v25 = y;
  CGFloat v26 = width;
  CGFloat v27 = height;
  long long v22 = self;
  id v23 = v10;
  long long v11 = *(_OWORD *)&a3->var0.var3;
  long long v15 = *(_OWORD *)&a3->var0.var0;
  long long v16 = v11;
  long long v17 = *(_OWORD *)&a3->var1.var1;
  id v12 = v10;
  [(PXStoryBaseTimeline *)self enumerateSegmentsInTimeRange:&v15 usingBlock:&v18];
  long long v13 = objc_msgSend(v12, "copy", v15, v16, v17, v18, v19, v20, v21, v22);

  return v13;
}

uint64_t __58__PXStoryBaseTimeline_segmentIdentifiersInTimeRange_rect___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a2 >= 1)
  {
    uint64_t v19 = v7;
    uint64_t v20 = v6;
    uint64_t v21 = v5;
    uint64_t v22 = v4;
    uint64_t v23 = v8;
    uint64_t v24 = v9;
    uint64_t v11 = a2;
    uint64_t v12 = result;
    do
    {
      uint64_t v14 = *a4;
      a4 += 25;
      uint64_t v13 = v14;
      objc_msgSend(*(id *)(v12 + 32), "frameForSegmentWithIdentifier:", v14, v19, v20, v21, v22, v23, v24);
      v25.origin.CGFloat x = v15;
      v25.origin.CGFloat y = v16;
      v25.size.CGFloat width = v17;
      v25.size.CGFloat height = v18;
      result = CGRectIntersectsRect(*(CGRect *)(v12 + 48), v25);
      if (result) {
        result = [*(id *)(v12 + 40) addIndex:v13];
      }
      --v11;
    }
    while (v11);
  }
  return result;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  [(PXStoryBaseTimeline *)self size];
  PXRectWithOriginAndSize();
}

- (id)identifiersOfSegmentsMatchingSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  if (a4)
  {
    uint64_t v5 = AnchorableResourceIdentifiersInTimelineSegment(a4, a3);
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v7 = [(PXStoryBaseTimeline *)self numberOfSegments];
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(PXStoryBaseTimeline *)self identifierForSegmentAtIndex:i];
        uint64_t v11 = AnchorableResourceIdentifiersInTimelineSegment(self, v10);
        if (MatchingScoreBetweenResourceIdentifierSets(v11, v5) >= 1) {
          [v6 addIndex:v10];
        }
      }
    }
    uint64_t v12 = (void *)[v6 copy];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (int64_t)identifierOfSegmentClosestToSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  if (a4 && a3)
  {
    uint64_t v5 = AnchorableResourceIdentifiersInTimelineSegment(a4, a3);
    uint64_t v6 = [(PXStoryBaseTimeline *)self numberOfSegments];
    if (v6 < 1)
    {
      int64_t v9 = 0;
    }
    else
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      int64_t v9 = 0;
      int64_t v10 = 0x8000000000000001;
      do
      {
        uint64_t v11 = [(PXStoryBaseTimeline *)self identifierForSegmentAtIndex:v8];
        uint64_t v12 = AnchorableResourceIdentifiersInTimelineSegment(self, v11);
        uint64_t v13 = MatchingScoreBetweenResourceIdentifierSets(v12, v5);
        if (v13 > v10)
        {
          int64_t v10 = v13;
          int64_t v9 = v11;
        }

        ++v8;
      }
      while (v7 != v8);
    }

    return v9;
  }
  else
  {
    return [(PXStoryBaseTimeline *)self firstSegmentIdentifier];
  }
}

- (void)_findSegmentMatchingIdentifier:(int64_t)a3 timeRange:(id *)a4 info:(id *)a5
{
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x5010000000;
  long long v43 = &unk_1AB5D584F;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0xE810000000;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  CGFloat v26 = &unk_1AB5D584F;
  uint64_t v39 = 0;
  [(PXStoryBaseTimeline *)self timeRange];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__PXStoryBaseTimeline__findSegmentMatchingIdentifier_timeRange_info___block_invoke;
  _OWORD v21[3] = &unk_1E5DB9228;
  v21[5] = &v23;
  v21[6] = a3;
  v21[4] = &v40;
  [(PXStoryBaseTimeline *)self enumerateSegmentsInTimeRange:v22 usingBlock:v21];
  if (a4)
  {
    long long v10 = *((_OWORD *)v41 + 3);
    long long v9 = *((_OWORD *)v41 + 4);
    *(_OWORD *)&a4->var0.var0 = *((_OWORD *)v41 + 2);
    *(_OWORD *)&a4->var0.var3 = v10;
    *(_OWORD *)&a4->var1.var1 = v9;
  }
  if (a5)
  {
    uint64_t v11 = v24;
    *(_OWORD *)&a5->var0 = *((_OWORD *)v24 + 2);
    long long v12 = *((_OWORD *)v11 + 6);
    long long v14 = *((_OWORD *)v11 + 3);
    long long v13 = *((_OWORD *)v11 + 4);
    *(_OWORD *)&a5->var2.var0 = *((_OWORD *)v11 + 5);
    *(_OWORD *)&a5->var2.var2.var1 = v12;
    *(_OWORD *)&a5->var1.var1 = v14;
    *(_OWORD *)&a5->var1.var3 = v13;
    long long v15 = *((_OWORD *)v11 + 10);
    long long v17 = *((_OWORD *)v11 + 7);
    long long v16 = *((_OWORD *)v11 + 8);
    *(_OWORD *)&a5->var3.var0.var3 = *((_OWORD *)v11 + 9);
    *(_OWORD *)&a5->var3.var1.var1 = v15;
    *(_OWORD *)&a5->var2.var3 = v17;
    *(_OWORD *)&a5->var3.var0.var0 = v16;
    long long v19 = *((_OWORD *)v11 + 12);
    long long v18 = *((_OWORD *)v11 + 13);
    long long v20 = *((_OWORD *)v11 + 11);
    a5->var3.var3.var1 = v11[28];
    *(_OWORD *)&a5->var3.var2.var3 = v19;
    *(_OWORD *)&a5->var3.var3.var0.var1 = v18;
    *(_OWORD *)&a5->var3.var2.var0 = v20;
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v40, 8);
}

__n128 __69__PXStoryBaseTimeline__findSegmentMatchingIdentifier_timeRange_info___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = 0;
    while (*(void *)a4 != a1[6])
    {
      ++v5;
      a4 += 200;
      if (a2 == v5) {
        return result;
      }
    }
    uint64_t v6 = *(_OWORD **)(a1[4] + 8);
    uint64_t v7 = (long long *)(a3 + 48 * v5);
    long long v8 = *v7;
    long long v9 = v7[2];
    v6[3] = v7[1];
    v6[4] = v9;
    v6[2] = v8;
    uint64_t v10 = *(void *)(a1[5] + 8);
    long long v11 = *(_OWORD *)(a4 + 64);
    long long v13 = *(_OWORD *)(a4 + 16);
    long long v12 = *(_OWORD *)(a4 + 32);
    *(_OWORD *)(v10 + 80) = *(_OWORD *)(a4 + 48);
    *(_OWORD *)(v10 + 96) = v11;
    *(_OWORD *)(v10 + 48) = v13;
    *(_OWORD *)(v10 + 64) = v12;
    long long v14 = *(_OWORD *)(a4 + 128);
    long long v16 = *(_OWORD *)(a4 + 80);
    long long v15 = *(_OWORD *)(a4 + 96);
    *(_OWORD *)(v10 + 144) = *(_OWORD *)(a4 + 112);
    *(_OWORD *)(v10 + 160) = v14;
    *(_OWORD *)(v10 + 112) = v16;
    *(_OWORD *)(v10 + 128) = v15;
    long long v18 = *(_OWORD *)(a4 + 160);
    long long v17 = *(_OWORD *)(a4 + 176);
    long long v19 = *(_OWORD *)(a4 + 144);
    *(void *)(v10 + 224) = *(void *)(a4 + 192);
    *(_OWORD *)(v10 + 192) = v18;
    *(_OWORD *)(v10 + 208) = v17;
    *(_OWORD *)(v10 + 176) = v19;
    __n128 result = *(__n128 *)a4;
    *(_OWORD *)(v10 + 32) = *(_OWORD *)a4;
    *a5 = 1;
  }
  return result;
}

- ($822F6CB856AD2B5FF5331D18434BEEDC)infoForSegmentWithIdentifier:(SEL)a3
{
  retstr->var3.var3.var1 = 0;
  *(_OWORD *)&retstr->var3.var2.var3 = 0u;
  *(_OWORD *)&retstr->var3.var3.var0.var1 = 0u;
  *(_OWORD *)&retstr->var3.var1.var1 = 0u;
  *(_OWORD *)&retstr->var3.var2.var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var3 = 0u;
  *(_OWORD *)&retstr->var2.var2.var1 = 0u;
  *(_OWORD *)&retstr->var2.var3 = 0u;
  *(_OWORD *)&retstr->var1.var3 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  return ($822F6CB856AD2B5FF5331D18434BEEDC *)[(PXStoryBaseTimeline *)self _findSegmentMatchingIdentifier:a4 timeRange:0 info:retstr];
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return ($28FEB1B56BB3ED5175BFC6DE64DE503F *)[(PXStoryBaseTimeline *)self _findSegmentMatchingIdentifier:a4 timeRange:retstr info:0];
}

- (BOOL)containsAllSegmentsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v8 = 0;
    long long v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__PXStoryBaseTimeline_containsAllSegmentsWithIdentifiers___block_invoke;
    v7[3] = &unk_1E5DC5478;
    v7[4] = self;
    v7[5] = &v8;
    [v4 enumerateIndexesUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

uint64_t __58__PXStoryBaseTimeline_containsAllSegmentsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsSegmentWithIdentifier:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)containsSegmentWithIdentifier:(int64_t)a3
{
  return [(PXStoryBaseTimeline *)self indexOfSegmentWithIdentifier:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)identifierOfFirstSegmentContainingAsset:(id)a3
{
  id v4 = a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  [(PXStoryBaseTimeline *)self size];
  PXRectWithOriginAndSize();
}

void __63__PXStoryBaseTimeline_identifierOfFirstSegmentContainingAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 >= 1)
  {
    uint64_t v29 = v7;
    uint64_t v30 = v6;
    uint64_t v31 = v4;
    uint64_t v32 = v5;
    uint64_t v11 = 0;
    long long v12 = 0uLL;
    do
    {
      long long v27 = v12;
      long long v28 = v12;
      long long v26 = v12;
      long long v13 = *(void **)(a1 + 32);
      uint64_t v14 = [v13 identifierForSegmentAtIndex:v11];
      if (v13)
      {
        [v13 timeRangeForSegmentWithIdentifier:v14];
      }
      else
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
      }
      long long v15 = *(void **)(a1 + 32);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __63__PXStoryBaseTimeline_identifierOfFirstSegmentContainingAsset___block_invoke_2;
      v20[3] = &unk_1E5DB9250;
      uint64_t v16 = *(void *)(a1 + 88);
      v20[4] = v15;
      uint64_t v23 = v16;
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      id v21 = v17;
      uint64_t v22 = v18;
      uint64_t v24 = a4;
      uint64_t v25 = v11;
      v19[0] = v26;
      v19[1] = v27;
      v19[2] = v28;
      objc_msgSend(v15, "enumerateClipsInTimeRange:rect:usingBlock:", v19, v20, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

      ++v11;
      long long v12 = 0uLL;
    }
    while (a2 != v11);
  }
}

void __63__PXStoryBaseTimeline_identifierOfFirstSegmentContainingAsset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a2 < 1) {
    return;
  }
  uint64_t v7 = a2;
  for (uint64_t i = (void *)(a5 + 8); *i != 1; i += 96)
  {
LABEL_6:
    if (!--v7) {
      return;
    }
  }
  uint64_t v10 = [*(id *)(a1 + 32) clipWithIdentifier:*(i - 1)];
  id v15 = [v10 resource];

  uint64_t v11 = objc_msgSend(v15, "px_storyResourceDisplayAsset");
  long long v12 = [v11 uuid];
  long long v13 = [*(id *)(a1 + 40) uuid];
  int v14 = [v12 isEqualToString:v13];

  if (!v14)
  {

    goto LABEL_6;
  }
  *a6 = 1;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 64)
                                                                          + 200 * *(void *)(a1 + 72));
}

- (int64_t)identifierForSegmentWithOffset:(id *)a3 fromEndOfSegmentWithIdentifier:(int64_t)a4 timeIntoSegment:(id *)a5
{
  int64_t v6 = a4;
  int64_t v9 = [(PXStoryBaseTimeline *)self indexOfSegmentWithIdentifier:a4];
  CMTime v19 = *(CMTime *)a3;
  if (v9 >= [(PXStoryBaseTimeline *)self numberOfSegments] - 1)
  {
    [(PXStoryBaseTimeline *)self timeRangeForSegmentWithIdentifier:v6];
    CMTime v19 = v13;
  }
  else
  {
    int64_t v10 = [(PXStoryBaseTimeline *)self identifierForSegmentAtIndex:v9 + 1];
    int64_t v11 = [(PXStoryBaseTimeline *)self indexOfSegmentWithIdentifier:v6] + 1;
    [(PXStoryBaseTimeline *)self timeRangeForSegmentWithIdentifier:v10];
    *(_OWORD *)&v18.value = v16;
    v18.epoch = v17;
    int64_t v6 = v10;
    while (1)
    {
      CMTime time1 = v19;
      CMTime time2 = v18;
      if (CMTimeCompare(&time1, &time2) < 1) {
        break;
      }
      if (v11 < [(PXStoryBaseTimeline *)self numberOfSegments] - 1)
      {
        CMTime time1 = v19;
        CMTime time2 = v18;
        CMTimeSubtract(&v19, &time1, &time2);
        int64_t v6 = [(PXStoryBaseTimeline *)self identifierForSegmentAtIndex:++v11];
        [(PXStoryBaseTimeline *)self timeRangeForSegmentWithIdentifier:v6];
        *(_OWORD *)&v18.value = v14;
        v18.epoch = v15;
      }
      else
      {
        CMTime v19 = v18;
      }
    }
  }
  *(CMTime *)a5 = v19;
  return v6;
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  uint64_t v10 = 0;
  int64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  [(PXStoryBaseTimeline *)self timeRange];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PXStoryBaseTimeline_indexOfSegmentWithIdentifier___block_invoke;
  v7[3] = &unk_1E5DB9228;
  v7[5] = v9;
  void v7[6] = a3;
  v7[4] = &v10;
  [(PXStoryBaseTimeline *)self enumerateSegmentsInTimeRange:v8 usingBlock:v7];
  int64_t v5 = v11[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void *__52__PXStoryBaseTimeline_indexOfSegmentWithIdentifier___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned char *a5)
{
  if (a2 >= 1)
  {
    while (1)
    {
      uint64_t v5 = *a4;
      a4 += 25;
      uint64_t v6 = *(void *)(result[5] + 8);
      uint64_t v7 = *(void *)(v6 + 24);
      if (v5 == result[6]) {
        break;
      }
      *(void *)(v6 + 24) = v7 + 1;
      if (!--a2) {
        return result;
      }
    }
    *(void *)(*(void *)(result[4] + 8) + 24) = v7;
    *a5 = 1;
  }
  return result;
}

- (int64_t)identifierForSegmentAtIndex:(int64_t)a3
{
  uint64_t v10 = 0;
  int64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  [(PXStoryBaseTimeline *)self timeRange];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PXStoryBaseTimeline_identifierForSegmentAtIndex___block_invoke;
  v7[3] = &unk_1E5DB9228;
  v7[5] = &v10;
  void v7[6] = a3;
  v7[4] = v9;
  [(PXStoryBaseTimeline *)self enumerateSegmentsInTimeRange:v8 usingBlock:v7];
  int64_t v5 = v11[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void *__51__PXStoryBaseTimeline_identifierForSegmentAtIndex___block_invoke(void *result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      uint64_t v6 = *(void *)(result[4] + 8);
      uint64_t v7 = *(void *)(v6 + 24);
      if (v7 == result[6]) {
        break;
      }
      *(void *)(v6 + 24) = v7 + 1;
      if (a2 == ++v5) {
        return result;
      }
    }
    *(void *)(*(void *)(result[5] + 8) + 24) = *(void *)(a4 + 200 * v5);
    *a5 = 1;
  }
  return result;
}

- (int64_t)lastSegmentIdentifier
{
  if ([(PXStoryBaseTimeline *)self numberOfSegments] < 1) {
    return 0;
  }
  int64_t v3 = [(PXStoryBaseTimeline *)self numberOfSegments] - 1;
  return [(PXStoryBaseTimeline *)self identifierForSegmentAtIndex:v3];
}

- (int64_t)firstSegmentIdentifier
{
  if ([(PXStoryBaseTimeline *)self numberOfSegments] < 1) {
    return 0;
  }
  return [(PXStoryBaseTimeline *)self identifierForSegmentAtIndex:0];
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v8 = (objc_class *)objc_opt_class();
  int64_t v9 = NSStringFromClass(v8);
  [v7 handleFailureInMethod:a2, self, @"PXStoryBaseTimeline.m", 117, @"Method %s is a responsibility of subclass %@", "-[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:]", v9 object file lineNumber description];

  abort();
}

- (int64_t)numberOfSegments
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXStoryBaseTimeline.m", 113, @"Method %s is a responsibility of subclass %@", "-[PXStoryBaseTimeline numberOfSegments]", v6 object file lineNumber description];

  abort();
}

- (id)clipWithIdentifier:(int64_t)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXStoryBaseTimeline.m", 109, @"Method %s is a responsibility of subclass %@", "-[PXStoryBaseTimeline clipWithIdentifier:]", v7 object file lineNumber description];

  abort();
}

- (id)clipWithResourceKind:(int64_t)a3 afterClipIdentifier:(int64_t)a4
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__96947;
  v8[4] = __Block_byref_object_dispose__96948;
  v8[5] = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  BOOL v7 = a4 == 0;
  [(PXStoryBaseTimeline *)self timeRange];
  [(PXStoryBaseTimeline *)self size];
  PXRectWithOriginAndSize();
}

void __64__PXStoryBaseTimeline_clipWithResourceKind_afterClipIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    for (uint64_t i = (void *)(a5 + 8); ; i += 96)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      if (*(unsigned char *)(v10 + 24))
      {
        if (*i == *(void *)(a1 + 56)) {
          break;
        }
      }
      if (*(i - 1) == *(void *)(a1 + 64)) {
        *(unsigned char *)(v10 + 24) = 1;
      }
      if (a2 == ++v8) {
        return;
      }
    }
    uint64_t v11 = [*(id *)(a1 + 32) clipWithIdentifier:*(void *)(a5 + 768 * v8)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a6 = 1;
  }
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v7 = a5;
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  int64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  [v8 handleFailureInMethod:a2, self, @"PXStoryBaseTimeline.m", 87, @"Method %s is a responsibility of subclass %@", "-[PXStoryBaseTimeline enumerateClipsInTimeRange:rect:usingBlock:]", v10 object file lineNumber description];

  abort();
}

- (int64_t)numberOfClipsWithResourceKind:(int64_t)a3
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  [(PXStoryBaseTimeline *)self timeRange];
  [(PXStoryBaseTimeline *)self size];
  PXRectWithOriginAndSize();
}

uint64_t __53__PXStoryBaseTimeline_numberOfClipsWithResourceKind___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 >= 1)
  {
    uint64_t v5 = (void *)(a5 + 8);
    do
    {
      if (*v5 == *(void *)(result + 40)) {
        ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
      }
      v5 += 96;
      --a2;
    }
    while (a2);
  }
  return result;
}

- (CGSize)size
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXStoryBaseTimeline.m", 71, @"Method %s is a responsibility of subclass %@", "-[PXStoryBaseTimeline size]", v6 object file lineNumber description];

  abort();
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a3, self, @"PXStoryBaseTimeline.m", 67, @"Method %s is a responsibility of subclass %@", "-[PXStoryBaseTimeline timeRange]", v7 object file lineNumber description];

  abort();
}

- (int64_t)dataSourceIdentifier
{
  return *(void *)off_1E5DAAED8;
}

@end