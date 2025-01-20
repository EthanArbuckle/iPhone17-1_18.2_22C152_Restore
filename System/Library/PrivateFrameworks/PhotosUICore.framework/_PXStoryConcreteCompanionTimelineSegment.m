@interface _PXStoryConcreteCompanionTimelineSegment
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredDuration;
- ($822F6CB856AD2B5FF5331D18434BEEDC)segmentInfo;
- (NSArray)assets;
- (PXStoryCompanionTimelineSegmentTransition)orderOutTransition;
- (PXStoryTimeline)timeline;
- (_PXStoryConcreteCompanionTimelineSegment)initWithTimeline:(id)a3 segmentIndex:(int64_t)a4;
@end

@implementation _PXStoryConcreteCompanionTimelineSegment

- (void).cxx_destruct
{
}

- ($822F6CB856AD2B5FF5331D18434BEEDC)segmentInfo
{
  long long v3 = *(_OWORD *)&self->var3.var3.var1;
  *(_OWORD *)&retstr->var3.var2.var3 = *(_OWORD *)&self->var3.var3.var0.var1;
  *(_OWORD *)&retstr->var3.var3.var0.var1 = v3;
  retstr->var3.var3.var1 = self[1].var0;
  long long v4 = *(_OWORD *)&self->var3.var1.var1;
  *(_OWORD *)&retstr->var3.var0.var0 = *(_OWORD *)&self->var3.var0.var3;
  *(_OWORD *)&retstr->var3.var0.var3 = v4;
  long long v5 = *(_OWORD *)&self->var3.var2.var3;
  *(_OWORD *)&retstr->var3.var1.var1 = *(_OWORD *)&self->var3.var2.var0;
  *(_OWORD *)&retstr->var3.var2.var0 = v5;
  long long v6 = *(_OWORD *)&self->var2.var2.var1;
  *(_OWORD *)&retstr->var1.var3 = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var2.var0 = v6;
  long long v7 = *(_OWORD *)&self->var3.var0.var0;
  *(_OWORD *)&retstr->var2.var2.var1 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var2.var3 = v7;
  long long v8 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var1.var1 = v8;
  return self;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (PXStoryCompanionTimelineSegmentTransition)orderOutTransition
{
  long long v3 = [_PXStoryConcreteCompanionTimelineSegmentTransition alloc];
  [(_PXStoryConcreteCompanionTimelineSegment *)self segmentInfo];
  v9[0] = v6;
  v9[1] = v7;
  uint64_t v10 = v8;
  long long v4 = [(_PXStoryConcreteCompanionTimelineSegmentTransition *)v3 initWithTransitionInfo:v9];
  return (PXStoryCompanionTimelineSegmentTransition *)v4;
}

- (NSArray)assets
{
  [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  long long v3 = [(_PXStoryConcreteCompanionTimelineSegment *)self timeline];
  [(_PXStoryConcreteCompanionTimelineSegment *)self segmentInfo];
  if (v3) {
    [v3 timeRangeForSegmentWithIdentifier:v5];
  }
  [v3 size];
  PXRectWithOriginAndSize();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredDuration
{
  result = [(_PXStoryConcreteCompanionTimelineSegment *)self segmentInfo];
  *retstr = v5;
  return result;
}

- (_PXStoryConcreteCompanionTimelineSegment)initWithTimeline:(id)a3 segmentIndex:(int64_t)a4
{
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_PXStoryConcreteCompanionTimelineSegment;
  uint64_t v8 = [(_PXStoryConcreteCompanionTimelineSegment *)&v25 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_timeline, a3);
    uint64_t v10 = [v7 identifierForSegmentAtIndex:a4];
    if (v7)
    {
      [v7 infoForSegmentWithIdentifier:v10];
    }
    else
    {
      int64_t v24 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
    }
    *(_OWORD *)&v9->_segmentInfo.durationInfo.maximumDuration.epoch = v22;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.preferredCue.time.timescale = v23;
    v9->_segmentInfo.durationInfo.preferredCue.rank = v24;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.minimumDuration.value = v18;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.minimumDuration.epoch = v19;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.preferredDuration.timescale = v20;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.maximumDuration.value = v21;
    *(_OWORD *)&v9->_segmentInfo.compositionInfo.mainDividerSplitRatio = v14;
    *(_OWORD *)&v9->_segmentInfo.transitionInfo.orderOutTransition = v15;
    *(_OWORD *)&v9->_segmentInfo.transitionInfo.duration.timescale = v16;
    *(_OWORD *)&v9->_segmentInfo.transitionInfo.fallbackFromTransitionKind = v17;
    *(_OWORD *)&v9->_segmentInfo.identifier = v12;
    *(_OWORD *)&v9->_segmentInfo.compositionInfo.clipFramesExtendToBounds = v13;
  }

  return v9;
}

@end