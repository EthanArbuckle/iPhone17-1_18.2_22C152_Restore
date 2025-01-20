@interface PXStoryConcreteTimeline
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3;
- ($822F6CB856AD2B5FF5331D18434BEEDC)infoForSegmentWithIdentifier:(SEL)a3;
- (CGSize)size;
- (PXStoryConcreteTimeline)init;
- (PXStoryConcreteTimeline)initWithSize:(CGSize)a3 resourcesDataSource:(id)a4;
- (PXStoryConcreteTimeline)initWithTimeline:(id)a3;
- (PXStoryResourcesDataSource)resourcesDataSource;
- (_NSRange)_smallestRangeOfClipsPotentiallyIntersectingTimeRange:(id *)a3;
- (_NSRange)_smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:(id *)a3;
- (id)_clipResourceIndexesOfKind:(int64_t)a3 inSegmentAtIndex:(int64_t)a4;
- (id)_indexesOfSegmentsContainingClipsWithResourceKind:(int64_t)a3 indexes:(id)a4;
- (id)clipWithIdentifier:(int64_t)a3;
- (id)debugDescription;
- (id)description;
- (id)identifiersOfSegmentsMatchingSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4;
- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)dataSourceIdentifier;
- (int64_t)identifierForSegmentAtIndex:(int64_t)a3;
- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)identifierOfSegmentClosestToSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4;
- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3;
- (int64_t)lastClipIdentifier;
- (int64_t)numberOfClips;
- (int64_t)numberOfSegments;
- (void)_assertConsistency;
- (void)_enumerateClipsWithResourceKind:(int64_t)a3 indexes:(id)a4 usingBlock:(id)a5;
- (void)_enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4;
- (void)dealloc;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)enumerateConcreteClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4;
- (void)setNumberOfClips:(int64_t)a3;
- (void)setNumberOfSegments:(int64_t)a3;
@end

@implementation PXStoryConcreteTimeline

- (void).cxx_destruct
{
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
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

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [PXStoryMutableConcreteTimeline alloc];
  return [(PXStoryConcreteTimeline *)v4 initWithTimeline:self];
}

- (int64_t)dataSourceIdentifier
{
  v2 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
  int64_t v3 = [v2 identifier];

  return v3;
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
  int v10 = [v8 hasSameResourcesOfKind:a5 as:v9];

  if (v10 && (int64_t numberOfClips = self->_numberOfClips, numberOfClips >= 1))
  {
    uint64_t v12 = 0;
    uint64_t v13 = 8;
    while (1)
    {
      if (self->_clipResourceIndexes[v12] == a3)
      {
        clipInfos = self->_clipInfos;
        if (*(int64_t *)((char *)&clipInfos->var0 + v13) == a5) {
          break;
        }
      }
      ++v12;
      v13 += 768;
      if (numberOfClips == v12) {
        goto LABEL_7;
      }
    }
    int64_t v15 = *(&clipInfos->var0 + 96 * v12);
  }
  else
  {
LABEL_7:
    int64_t v15 = 0;
  }

  return v15;
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
  LODWORD(a5) = [v8 hasSameResourcesOfKind:a5 as:v9];

  if (a5 && (int64_t numberOfClips = self->_numberOfClips, numberOfClips >= 1))
  {
    uint64_t v11 = 0;
    clipInfos = self->_clipInfos;
    while (clipInfos->var0 != a3)
    {
      clipInfos = ($1FE1EEDD30F8401E3A9AF97812D83A51 *)((char *)clipInfos + 768);
      if (numberOfClips == ++v11) {
        goto LABEL_6;
      }
    }
    int64_t v13 = self->_clipResourceIndexes[v11];
  }
  else
  {
LABEL_6:
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
  int v10 = [v8 hasSameResourcesOfKind:a3 as:v9];

  if (v10
    && (int64_t v11 = [(PXStoryConcreteTimeline *)self indexOfSegmentWithIdentifier:a5],
        v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v12 = [(PXStoryConcreteTimeline *)self _clipResourceIndexesOfKind:a3 inSegmentAtIndex:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (id)identifiersOfSegmentsMatchingSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  id v6 = a4;
  v7 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
  id v8 = [v6 indexesOfResourcesWithKind:1 inResourcesDataSource:v7 forClipsInSegmentWithIdentifier:a3];

  if (v8)
  {
    v9 = [(PXStoryConcreteTimeline *)self _indexesOfSegmentsContainingClipsWithResourceKind:1 indexes:v8];
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89__PXStoryConcreteTimeline_identifiersOfSegmentsMatchingSegmentWithIdentifier_inTimeline___block_invoke;
    v15[3] = &unk_1E5DD1558;
    id v16 = v10;
    v17 = self;
    id v11 = v10;
    [v9 enumerateIndexesUsingBlock:v15];
    uint64_t v12 = (void *)[v11 copy];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PXStoryConcreteTimeline;
    uint64_t v12 = [(PXStoryBaseTimeline *)&v14 identifiersOfSegmentsMatchingSegmentWithIdentifier:a3 inTimeline:v6];
  }

  return v12;
}

uint64_t __89__PXStoryConcreteTimeline_identifiersOfSegmentsMatchingSegmentWithIdentifier_inTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifierForSegmentAtIndex:a2];
  return [v2 addIndex:v3];
}

- (int64_t)identifierOfSegmentClosestToSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  id v6 = a4;
  v7 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
  id v8 = [v6 indexesOfResourcesWithKind:1 inResourcesDataSource:v7 forClipsInSegmentWithIdentifier:a3];
  if (v8)
  {
    v9 = [(PXStoryConcreteTimeline *)self _indexesOfSegmentsContainingClipsWithResourceKind:1 indexes:v8];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    unint64_t v47 = 0x8000000000000001;
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke;
    v30[3] = &unk_1E5DC0150;
    v30[4] = self;
    uint64_t v35 = 1;
    id v10 = v8;
    id v31 = v10;
    v32 = &v44;
    v33 = &v36;
    v34 = &v40;
    [v9 enumerateIndexesUsingBlock:v30];
    uint64_t v11 = v41[3];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = 0;
    }
    else
    {
      if (v37[3] > v45[3])
      {
        v23 = v9;
        uint64_t v13 = [v6 indexOfSegmentWithIdentifier:a3];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke_2;
        aBlock[3] = &unk_1E5DC0178;
        id v14 = v6;
        id v26 = v14;
        uint64_t v29 = 1;
        id v27 = v7;
        id v28 = v10;
        int64_t v15 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
        uint64_t v16 = v13;
        do
        {
          uint64_t v17 = v16;
          BOOL v18 = v16-- < 1;
        }
        while (!v18 && (v15[2](v15, v16) & 1) != 0);
        uint64_t v19 = [v14 numberOfSegments];
        if (v13 <= v19 - 1) {
          uint64_t v20 = v19 - 1;
        }
        else {
          uint64_t v20 = v13;
        }
        uint64_t v21 = v13;
        while (v20 != v21)
        {
          if ((v15[2](v15, ++v21) & 1) == 0)
          {
            uint64_t v20 = v21 - 1;
            break;
          }
        }
        if (v17 < v20) {
          PXFloatNormalize();
        }

        uint64_t v11 = v41[3];
        v9 = v23;
      }
      id v12 = [(PXStoryConcreteTimeline *)self identifierForSegmentAtIndex:v11];
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PXStoryConcreteTimeline;
    id v12 = [(PXStoryBaseTimeline *)&v24 identifierOfSegmentClosestToSegmentWithIdentifier:a3 inTimeline:v6];
  }

  return (int64_t)v12;
}

void __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) _clipResourceIndexesOfKind:*(void *)(a1 + 72) inSegmentAtIndex:a2];
  uint64_t v4 = MatchingScoreBetweenClipResourceIndexes(*(void **)(a1 + 40), v7);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v4 >= v6)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v6 = *(void *)(v5 + 24);
  }
  if (v4 > v6)
  {
    *(void *)(v5 + 24) = v4;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2;
  }
}

uint64_t __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", *(void *)(a1 + 56), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "identifierForSegmentAtIndex:", a2));
  uint64_t v4 = [v3 isEqualToIndexSet:*(void *)(a1 + 48)];

  return v4;
}

- ($822F6CB856AD2B5FF5331D18434BEEDC)infoForSegmentWithIdentifier:(SEL)a3
{
  retstr->var3.var3.var1 = 0;
  *(_OWORD *)&retstr->var3.var2.var3 = 0u;
  *(_OWORD *)&retstr->var3.var3.var0.var1 = 0u;
  *(_OWORD *)&retstr->var3.var1.var1 = 0u;
  *(_OWORD *)&retstr->var3.var2.int64_t var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.int64_t var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var3 = 0u;
  *(_OWORD *)&retstr->var2.var2.var1 = 0u;
  *(_OWORD *)&retstr->var2.var3 = 0u;
  *(_OWORD *)&retstr->var1.var3 = 0u;
  *(_OWORD *)&retstr->var2.int64_t var0 = 0u;
  *(_OWORD *)&retstr->int64_t var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  int64_t var0 = self->var3.var2.var0;
  if (var0 >= 1)
  {
    for (uint64_t i = *(void *)&self->var3.var1.var1; *(void *)i != a4; i += 200)
    {
      if (!--var0) {
        return self;
      }
    }
    long long v6 = *(_OWORD *)(i + 176);
    *(_OWORD *)&retstr->var3.var2.var3 = *(_OWORD *)(i + 160);
    *(_OWORD *)&retstr->var3.var3.var0.var1 = v6;
    retstr->var3.var3.var1 = *(void *)(i + 192);
    long long v7 = *(_OWORD *)(i + 112);
    *(_OWORD *)&retstr->var3.var0.int64_t var0 = *(_OWORD *)(i + 96);
    *(_OWORD *)&retstr->var3.var0.var3 = v7;
    long long v8 = *(_OWORD *)(i + 144);
    *(_OWORD *)&retstr->var3.var1.var1 = *(_OWORD *)(i + 128);
    *(_OWORD *)&retstr->var3.var2.int64_t var0 = v8;
    long long v9 = *(_OWORD *)(i + 48);
    *(_OWORD *)&retstr->var1.var3 = *(_OWORD *)(i + 32);
    *(_OWORD *)&retstr->var2.int64_t var0 = v9;
    long long v10 = *(_OWORD *)(i + 80);
    *(_OWORD *)&retstr->var2.var2.var1 = *(_OWORD *)(i + 64);
    *(_OWORD *)&retstr->var2.var3 = v10;
    long long v11 = *(_OWORD *)(i + 16);
    *(_OWORD *)&retstr->int64_t var0 = *(_OWORD *)i;
    *(_OWORD *)&retstr->var1.var1 = v11;
  }
  return self;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.int64_t var0 = 0u;
  int64_t var0 = self[3].var0.var0;
  if (var0 >= 1)
  {
    uint64_t v5 = 0;
    long long v6 = *(uint64_t **)&self[2].var1.var1;
    while (1)
    {
      uint64_t v7 = *v6;
      v6 += 25;
      if (v7 == a4) {
        break;
      }
      if (var0 == ++v5) {
        return self;
      }
    }
    long long v8 = (_OWORD *)(self[2].var1.var0 + 48 * v5);
    long long v9 = v8[1];
    *(_OWORD *)&retstr->var0.int64_t var0 = *v8;
    *(_OWORD *)&retstr->var0.var3 = v9;
    *(_OWORD *)&retstr->var1.var1 = v8[2];
  }
  return self;
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  int64_t numberOfSegments = self->_numberOfSegments;
  if (numberOfSegments < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t result = 0;
  segmentInfos = self->_segmentInfos;
  while (1)
  {
    int64_t var0 = segmentInfos->var0;
    segmentInfos = ($822F6CB856AD2B5FF5331D18434BEEDC *)((char *)segmentInfos + 200);
    if (var0 == a3) {
      break;
    }
    if (numberOfSegments == ++result) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (int64_t)identifierForSegmentAtIndex:(int64_t)a3
{
  if (a3 < 0 || self->_numberOfSegments <= a3)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimeline.m", 313, @"segment index %ti out of bounds 0 ..< %ti", a3, self->_numberOfSegments);
  }
  return *(&self->_segmentInfos->var0 + 25 * a3);
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  long long v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  [(PXStoryConcreteTimeline *)self _smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:v9];
  id v8 = v6;
  PXEnumerateSubrangesMatchingTestUsingBlock();
}

BOOL __67__PXStoryConcreteTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (_OWORD *)(*(void *)(*(void *)(a1 + 32) + 120) + 48 * a2);
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

uint64_t __67__PXStoryConcreteTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3, *(void *)(*(void *)(a1 + 32) + 120) + 48 * a2, *(void *)(*(void *)(a1 + 32) + 128) + 200 * a2, a4);
}

- (id)clipWithIdentifier:(int64_t)a3
{
  int64_t numberOfClips = self->_numberOfClips;
  if (numberOfClips < 1)
  {
LABEL_5:
    long long v7 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    clipInfos = self->_clipInfos;
    while (clipInfos->var0 != a3)
    {
      clipInfos = ($1FE1EEDD30F8401E3A9AF97812D83A51 *)((char *)clipInfos + 768);
      if (numberOfClips == ++v5) {
        goto LABEL_5;
      }
    }
    id v8 = [(PXStoryConcreteTimeline *)self resourcesDataSource];
    clipResourceKinds = self->_clipResourceKinds;
    int64_t v10 = clipResourceKinds[v5];
    clipResourceIndexes = self->_clipResourceIndexes;
    int64_t v12 = clipResourceIndexes[v5];
    if (v5)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      do
      {
        if (clipResourceIndexes[v13] == v12 && clipResourceKinds[v13] == v10) {
          ++v14;
        }
        ++v13;
      }
      while (v5 != v13);
    }
    else
    {
      uint64_t v14 = 0;
    }
    int64_t v15 = [PXStoryConcreteClip alloc];
    memcpy(v17, (char *)self->_clipInfos + 768 * v5, sizeof(v17));
    long long v7 = [(PXStoryConcreteClip *)v15 initWithInfo:v17 resourceKind:v10 resourceIndex:v12 resourceOccurrenceIndex:v14 resourcesDataSource:v8];
  }
  return v7;
}

- (int64_t)lastClipIdentifier
{
  int64_t numberOfClips = self->_numberOfClips;
  if (numberOfClips < 1) {
    long long v3 = &PXStoryClipIdentifierNull;
  }
  else {
    long long v3 = (int64_t *)((char *)self->_clipInfos + 768 * numberOfClips - 768);
  }
  return *v3;
}

- (void)enumerateConcreteClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v7 = a5;
  long long v8 = *(_OWORD *)&a3->var0.var3;
  v10[0] = *(_OWORD *)&a3->var0.var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a3->var1.var1;
  [(PXStoryConcreteTimeline *)self _smallestRangeOfClipsPotentiallyIntersectingTimeRange:v10];
  id v9 = v7;
  PXEnumerateSubrangesMatchingTestUsingBlock();
}

BOOL __77__PXStoryConcreteTimeline_enumerateConcreteClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
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
    long long v8 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 80) + 32 * a2);
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

uint64_t __77__PXStoryConcreteTimeline_enumerateConcreteClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PXStoryConcreteTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v15[3] = &unk_1E5DC0128;
  id v16 = v11;
  long long v12 = *(_OWORD *)&a3->var0.var3;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  id v13 = v11;
  -[PXStoryConcreteTimeline enumerateConcreteClipsInTimeRange:rect:usingBlock:](self, "enumerateConcreteClipsInTimeRange:rect:usingBlock:", v14, v15, x, y, width, height);
}

uint64_t __69__PXStoryConcreteTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_assertConsistency
{
  uint64_t v3 = [(PXStoryConcreteTimeline *)self numberOfClips];
  if (v3 >= 2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = v3 - 1;
    do
    {
      id v7 = &self->_clipTimeRanges[v4];
      long long v19 = *(_OWORD *)&v7->var0.var0;
      CMTimeEpoch var3 = v7->var0.var3;
      long long v17 = *(_OWORD *)&v7[1].var0.var0;
      CMTimeEpoch v18 = v7[1].var0.var3;
      *(_OWORD *)&time1.var0.int64_t var0 = v19;
      time1.var0.CMTimeEpoch var3 = var3;
      *(_OWORD *)&time2.var0.int64_t var0 = v17;
      time2.var0.CMTimeEpoch var3 = v18;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1) {
        PXAssertGetLog();
      }
      $28FEB1B56BB3ED5175BFC6DE64DE503F time2 = self->_clipTimeRanges[self->_clipIndicesSortedByTimeRangeEnd[v5]];
      $28FEB1B56BB3ED5175BFC6DE64DE503F time1 = time2;
      CMTimeRangeGetEnd(&v16, (CMTimeRange *)&time1);
      $28FEB1B56BB3ED5175BFC6DE64DE503F time2 = self->_clipTimeRanges[self->_clipIndicesSortedByTimeRangeEnd[v5 + 1]];
      $28FEB1B56BB3ED5175BFC6DE64DE503F time1 = time2;
      CMTimeRangeGetEnd(&v14, (CMTimeRange *)&time1);
      time1.int64_t var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v16;
      time2.int64_t var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v14;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1) {
        PXAssertGetLog();
      }
      ++v5;
      ++v4;
    }
    while (v6 != v5);
  }
  uint64_t v8 = [(PXStoryConcreteTimeline *)self numberOfSegments];
  if (v8 >= 2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v8 - 1;
    do
    {
      id v11 = &self->_segmentTimeRanges[v9];
      long long v19 = *(_OWORD *)&v11->var0.var0;
      CMTimeEpoch var3 = v11->var0.var3;
      long long v17 = *(_OWORD *)&v11[1].var0.var0;
      CMTimeEpoch v18 = v11[1].var0.var3;
      *(_OWORD *)&time1.var0.int64_t var0 = v19;
      time1.var0.CMTimeEpoch var3 = var3;
      *(_OWORD *)&time2.var0.int64_t var0 = v17;
      time2.var0.CMTimeEpoch var3 = v18;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1) {
        PXAssertGetLog();
      }
      $28FEB1B56BB3ED5175BFC6DE64DE503F time2 = self->_segmentTimeRanges[v9];
      $28FEB1B56BB3ED5175BFC6DE64DE503F time1 = time2;
      CMTimeRangeGetEnd(&v13, (CMTimeRange *)&time1);
      $28FEB1B56BB3ED5175BFC6DE64DE503F time2 = self->_segmentTimeRanges[v9 + 1];
      $28FEB1B56BB3ED5175BFC6DE64DE503F time1 = time2;
      CMTimeRangeGetEnd(&v12, (CMTimeRange *)&time1);
      time1.int64_t var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v13;
      time2.int64_t var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v12;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1) {
        PXAssertGetLog();
      }
      ++v9;
      --v10;
    }
    while (v10);
  }
}

- (void)_enumerateClipsWithResourceKind:(int64_t)a3 indexes:(id)a4 usingBlock:(id)a5
{
  id v10 = a4;
  uint64_t v8 = (void (**)(id, int64_t))a5;
  if (self->_numberOfClips >= 1)
  {
    int64_t v9 = 0;
    do
    {
      if (self->_clipResourceKinds[v9] == a3
        && [v10 containsIndex:self->_clipResourceIndexes[v9]])
      {
        v8[2](v8, v9);
      }
      ++v9;
    }
    while (v9 < self->_numberOfClips);
  }
}

- (void)_enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  long long v7 = *(_OWORD *)&a3->var0.var3;
  long long v16 = *(_OWORD *)&a3->var0.var0;
  long long v17 = v7;
  long long v18 = *(_OWORD *)&a3->var1.var1;
  uint64_t v8 = [(PXStoryConcreteTimeline *)self _smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:&v16];
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    uint64_t v12 = v8;
    do
    {
      CMTime v13 = &self->_segmentTimeRanges[v12];
      long long v16 = *(_OWORD *)&v13->var0.var0;
      long long v17 = *(_OWORD *)&v13->var0.var3;
      long long v18 = *(_OWORD *)&v13->var1.var1;
      long long v14 = *(_OWORD *)&a3->var0.var3;
      v15[0] = *(_OWORD *)&a3->var0.var0;
      v15[1] = v14;
      v15[2] = *(_OWORD *)&a3->var1.var1;
      if (PXStoryTimeRangeIntersectsTimeRange(&v16, v15)) {
        v6[2](v6, v10);
      }
      ++v10;
      ++v12;
      --v11;
    }
    while (v11);
  }
}

- (id)_indexesOfSegmentsContainingClipsWithResourceKind:(int64_t)a3 indexes:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F28E60];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  long long v14 = __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke;
  uint64_t v15 = &unk_1E5DD2470;
  long long v16 = self;
  id v17 = v8;
  id v9 = v8;
  [(PXStoryConcreteTimeline *)self _enumerateClipsWithResourceKind:a3 indexes:v7 usingBlock:&v12];

  uint64_t v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);
  return v10;
}

void __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = (long long *)(v2[8] + 48 * a2);
  long long v4 = v3[1];
  long long v8 = *v3;
  long long v9 = v4;
  long long v10 = v3[2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke_2;
  _OWORD v6[3] = &unk_1E5DCF720;
  id v7 = *(id *)(a1 + 40);
  v5[0] = v8;
  v5[1] = v9;
  v5[2] = v10;
  [v2 _enumerateSegmentsInTimeRange:v5 usingBlock:v6];
}

uint64_t __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

- (id)_clipResourceIndexesOfKind:(int64_t)a3 inSegmentAtIndex:(int64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v8 = &self->_segmentTimeRanges[a4];
  long long v9 = *(_OWORD *)&v8->var1.var1;
  long long v10 = *(_OWORD *)&v8->var0.var0;
  long long v24 = *(_OWORD *)&v8->var0.var3;
  long long v25 = v9;
  long long v23 = v10;
  long long v20 = v10;
  long long v21 = v24;
  long long v22 = v9;
  uint64_t v11 = [(PXStoryConcreteTimeline *)self _smallestRangeOfClipsPotentiallyIntersectingTimeRange:&v20];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = v11;
    uint64_t v15 = v11;
    do
    {
      if (self->_clipResourceKinds[v14] == a3)
      {
        long long v16 = &self->_clipTimeRanges[v15];
        long long v20 = *(_OWORD *)&v16->var0.var0;
        long long v21 = *(_OWORD *)&v16->var0.var3;
        long long v22 = *(_OWORD *)&v16->var1.var1;
        v19[0] = v23;
        v19[1] = v24;
        v19[2] = v25;
        if (PXStoryTimeRangeIntersectsTimeRange(&v20, v19)) {
          [v7 addIndex:self->_clipResourceIndexes[v14]];
        }
      }
      ++v14;
      ++v15;
      --v13;
    }
    while (v13);
  }
  id v17 = (void *)[v7 copy];

  return v17;
}

- (_NSRange)_smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:(id *)a3
{
  [(PXStoryConcreteTimeline *)self numberOfSegments];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  long long v11 = *(_OWORD *)&a3->var0.var0;
  long long v8 = __84__PXStoryConcreteTimeline__smallestRangeOfSegmentsPotentiallyIntersectingTimeRange___block_invoke;
  long long v9 = &unk_1E5DC0100;
  long long v10 = self;
  long long v12 = v5;
  long long v13 = *(_OWORD *)&a3->var1.var1;
  PXFirstIndexInSortedRangePassingTest();
}

BOOL __84__PXStoryConcreteTimeline__smallestRangeOfSegmentsPotentiallyIntersectingTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  CMTimeRange v4 = *(CMTimeRange *)(*(void *)(*(void *)(a1 + 32) + 120) + 48 * a2);
  CMTimeRange range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  *(_OWORD *)&v4.start.value = *(_OWORD *)(a1 + 40);
  v4.start.epoch = *(void *)(a1 + 56);
  range.start = v5;
  return CMTimeCompare(&range.start, &v4.start) > 0;
}

BOOL __84__PXStoryConcreteTimeline__smallestRangeOfSegmentsPotentiallyIntersectingTimeRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 120) + 48 * a2;
  *(_OWORD *)&v4.value = *(_OWORD *)v2;
  v4.epoch = *(void *)(v2 + 16);
  CMTime time2 = *(CMTime *)(a1 + 40);
  CMTime time1 = v4;
  return CMTimeCompare(&time1, &time2) < 1;
}

- (_NSRange)_smallestRangeOfClipsPotentiallyIntersectingTimeRange:(id *)a3
{
  [(PXStoryConcreteTimeline *)self numberOfClips];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  long long v11 = *(_OWORD *)&a3->var0.var0;
  long long v8 = __81__PXStoryConcreteTimeline__smallestRangeOfClipsPotentiallyIntersectingTimeRange___block_invoke;
  long long v9 = &unk_1E5DC0100;
  long long v10 = self;
  long long v12 = v5;
  long long v13 = *(_OWORD *)&a3->var1.var1;
  PXFirstIndexInSortedRangePassingTest();
}

BOOL __81__PXStoryConcreteTimeline__smallestRangeOfClipsPotentiallyIntersectingTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  CMTimeRange v4 = *(CMTimeRange *)(*(void *)(*(void *)(a1 + 32) + 64)
                      + 48 * *(void *)(*(void *)(*(void *)(a1 + 32) + 72) + 8 * a2));
  CMTimeRange range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  *(_OWORD *)&v4.start.value = *(_OWORD *)(a1 + 40);
  v4.start.epoch = *(void *)(a1 + 56);
  range.start = v5;
  return CMTimeCompare(&range.start, &v4.start) > 0;
}

uint64_t __81__PXStoryConcreteTimeline__smallestRangeOfClipsPotentiallyIntersectingTimeRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 64) + 48 * a2;
  *(_OWORD *)&v4.value = *(_OWORD *)v2;
  v4.epoch = *(void *)(v2 + 16);
  CMTime time2 = *(CMTime *)(a1 + 40);
  CMTime time1 = v4;
  return CMTimeCompare(&time1, &time2) >> 31;
}

- (void)setNumberOfSegments:(int64_t)a3
{
  if (self->_numberOfSegments != a3)
  {
    self->_int64_t numberOfSegments = a3;
    _PXGArrayCapacityResizeToCount();
  }
}

- (void)setNumberOfClips:(int64_t)a3
{
  if (self->_numberOfClips != a3)
  {
    self->_int64_t numberOfClips = a3;
    _PXGArrayCapacityResizeToCount();
  }
}

- (void)dealloc
{
  free(self->_clipTimeRanges);
  free(self->_clipIndicesSortedByTimeRangeEnd);
  free(self->_clipFrames);
  free(self->_clipInfos);
  free(self->_clipResourceKinds);
  free(self->_clipResourceIndexes);
  free(self->_segmentTimeRanges);
  free(self->_segmentInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryConcreteTimeline;
  [(PXStoryConcreteTimeline *)&v3 dealloc];
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  CMTime v4 = [(PXStoryConcreteTimeline *)self description];
  CMTime v5 = (void *)[v3 initWithString:v4];

  if ([(PXStoryConcreteTimeline *)self numberOfSegments] >= 1)
  {
    int64_t v6 = 0;
    do
    {
      [(PXStoryConcreteTimeline *)self infoForSegmentWithIdentifier:[(PXStoryConcreteTimeline *)self identifierForSegmentAtIndex:v6]];
      uint64_t v7 = PXStorySegmentInfoDescription(v10);
      [v5 appendFormat:@"\n\t%@", v7];

      ++v6;
    }
    while (v6 < [(PXStoryConcreteTimeline *)self numberOfSegments]);
  }
  long long v8 = (void *)[v5 copy];

  return v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  CMTime v4 = (objc_class *)objc_opt_class();
  CMTime v5 = NSStringFromClass(v4);
  [(PXStoryConcreteTimeline *)self size];
  int64_t v6 = NSStringFromCGSize(v12);
  [(PXStoryConcreteTimeline *)self timeRange];
  uint64_t v7 = PXStoryTimeRangeDescription((uint64_t)v10);
  long long v8 = (void *)[v3 initWithFormat:@"<%@ %p; Size: %@; Time Range: %@>", v5, self, v6, v7];

  return v8;
}

- (PXStoryConcreteTimeline)initWithTimeline:(id)a3
{
  id v4 = a3;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  long long v9 = [v4 resourcesDataSource];
  long long v10 = -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](self, "initWithSize:resourcesDataSource:", v9, v6, v8);

  if (v10)
  {
    -[PXStoryConcreteTimeline setNumberOfClips:](v10, "setNumberOfClips:", [v4 numberOfClips]);
    [(PXStoryConcreteTimeline *)v10 numberOfClips];
    _PXGArrayCopyRangeToArray();
  }

  return 0;
}

- (PXStoryConcreteTimeline)initWithSize:(CGSize)a3 resourcesDataSource:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryConcreteTimeline;
  long long v9 = [(PXStoryConcreteTimeline *)&v15 init];
  long long v10 = v9;
  if (v9)
  {
    v9->_size.CGFloat width = width;
    v9->_size.CGFloat height = height;
    objc_storeStrong((id *)&v9->_resourcesDataSource, a4);
    *(_OWORD *)&start.value = PXStoryTimeZero;
    start.epoch = 0;
    *(_OWORD *)&duration.value = PXStoryTimeZero;
    duration.epoch = 0;
    CMTimeRangeMake(&v14, &start, &duration);
    long long v11 = *(_OWORD *)&v14.start.value;
    long long v12 = *(_OWORD *)&v14.duration.timescale;
    *(_OWORD *)&v10->_timeRange.start.epoch = *(_OWORD *)&v14.start.epoch;
    *(_OWORD *)&v10->_timeRange.duration.timescale = v12;
    *(_OWORD *)&v10->_timeRange.start.value = v11;
  }

  return v10;
}

- (PXStoryConcreteTimeline)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteTimeline.m", 72, @"%s is not available as initializer", "-[PXStoryConcreteTimeline init]");

  abort();
}

@end