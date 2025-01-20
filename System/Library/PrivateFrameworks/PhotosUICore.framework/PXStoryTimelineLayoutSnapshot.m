@interface PXStoryTimelineLayoutSnapshot
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange;
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)clipCornerRadius;
- (CGRect)timelineRect;
- (PXStoryTimeline)timeline;
- (PXStoryTimelineLayoutSnapshot)init;
- (PXStoryTimelineLayoutSnapshot)initWithTimeline:(id)a3 timelineRect:(CGRect)a4 timeRange:(id *)a5 clipCornerRadius:(id)a6;
@end

@implementation PXStoryTimelineLayoutSnapshot

- (void).cxx_destruct
{
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)clipCornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)timeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- (CGRect)timelineRect
{
  double x = self->_timelineRect.origin.x;
  double y = self->_timelineRect.origin.y;
  double width = self->_timelineRect.size.width;
  double height = self->_timelineRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (PXStoryTimelineLayoutSnapshot)initWithTimeline:(id)a3 timelineRect:(CGRect)a4 timeRange:(id *)a5 clipCornerRadius:(id)a6
{
  float v10 = v9;
  float v11 = v8;
  float v12 = v7;
  float v13 = v6;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v21 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXStoryTimelineLayoutSnapshot;
  v22 = [(PXStoryTimelineLayoutSnapshot *)&v27 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_timeline, a3);
    v23->_timelineRect.origin.CGFloat x = x;
    v23->_timelineRect.origin.CGFloat y = y;
    v23->_timelineRect.size.CGFloat width = width;
    v23->_timelineRect.size.CGFloat height = height;
    long long v24 = *(_OWORD *)&a5->var0.var0;
    long long v25 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v23->_timeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v23->_timeRange.duration.timescale = v25;
    *(_OWORD *)&v23->_timeRange.start.value = v24;
    v23->_clipCornerRadius.var0.var0.topLeft = v13;
    v23->_clipCornerRadius.var0.var0.topRight = v12;
    v23->_clipCornerRadius.var0.var0.bottomLeft = v11;
    v23->_clipCornerRadius.var0.var0.bottomRight = v10;
  }

  return v23;
}

- (PXStoryTimelineLayoutSnapshot)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTimelineLayoutSnapshot.m", 14, @"%s is not available as initializer", "-[PXStoryTimelineLayoutSnapshot init]");

  abort();
}

@end