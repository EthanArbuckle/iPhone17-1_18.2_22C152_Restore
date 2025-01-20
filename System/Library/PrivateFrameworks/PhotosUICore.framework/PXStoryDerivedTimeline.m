@interface PXStoryDerivedTimeline
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3;
- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3;
- (CGSize)originalSize;
- (CGSize)size;
- (PXStoryDerivedTimeline)init;
- (PXStoryDerivedTimeline)initWithOriginalTimeline:(id)a3;
- (PXStoryTimeline)originalTimeline;
- (id)clipWithIdentifier:(int64_t)a3;
- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5;
- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5;
- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3;
- (int64_t)numberOfSegments;
- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5;
- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4;
@end

@implementation PXStoryDerivedTimeline

- (void).cxx_destruct
{
}

- (PXStoryTimeline)originalTimeline
{
  return self->_originalTimeline;
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryDerivedTimeline *)self originalTimeline];
  int64_t v10 = [v9 identifierOfFirstClipContainingResourceAtIndex:a3 inResourcesDataSource:v8 resourceKind:a5];

  return v10;
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryDerivedTimeline *)self originalTimeline];
  int64_t v10 = [v9 indexOfResourceForClipWithIdentifier:a3 inResourcesDataSource:v8 resourceKind:a5];

  return v10;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  id v8 = a4;
  v9 = [(PXStoryDerivedTimeline *)self originalTimeline];
  int64_t v10 = [v9 indexesOfResourcesWithKind:a3 inResourcesDataSource:v8 forClipsInSegmentWithIdentifier:a5];

  return v10;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  v6 = [(PXStoryDerivedTimeline *)self originalTimeline];
  if (v6)
  {
    id v8 = v6;
    [v6 timeRangeForSegmentWithIdentifier:a4];
    v6 = v8;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  v4 = [(PXStoryDerivedTimeline *)self originalTimeline];
  int64_t v5 = [v4 indexOfSegmentWithIdentifier:a3];

  return v5;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  v4 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v4 frameForSegmentWithIdentifier:a3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6 = a4;
  double v7 = [(PXStoryDerivedTimeline *)self originalTimeline];
  long long v8 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  [v7 enumerateSegmentsInTimeRange:v9 usingBlock:v6];
}

- (int64_t)numberOfSegments
{
  v2 = [(PXStoryDerivedTimeline *)self originalTimeline];
  int64_t v3 = [v2 numberOfSegments];

  return v3;
}

- (id)clipWithIdentifier:(int64_t)a3
{
  v4 = [(PXStoryDerivedTimeline *)self originalTimeline];
  double v5 = [v4 clipWithIdentifier:a3];

  return v5;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  double v12 = [(PXStoryDerivedTimeline *)self originalTimeline];
  long long v13 = *(_OWORD *)&a3->var0.var3;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v14, v11, x, y, width, height);
}

- (CGSize)originalSize
{
  v2 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v2 originalSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)size
{
  v2 = [(PXStoryDerivedTimeline *)self originalTimeline];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  double v4 = [(PXStoryDerivedTimeline *)self originalTimeline];
  if (v4)
  {
    double v6 = v4;
    [v4 timeRange];
    double v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (PXStoryDerivedTimeline)initWithOriginalTimeline:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryDerivedTimeline;
  double v6 = [(PXStoryDerivedTimeline *)&v9 init];
  double v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_originalTimeline, a3);
  }

  return v7;
}

- (PXStoryDerivedTimeline)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryDerivedTimeline.m", 14, @"%s is not available as initializer", "-[PXStoryDerivedTimeline init]");

  abort();
}

@end