@interface _PXStoryConcreteCompanionTimelineSegmentTransition
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo;
- (_PXStoryConcreteCompanionTimelineSegmentTransition)initWithTransitionInfo:(id *)a3;
- (int64_t)kind;
@end

@implementation _PXStoryConcreteCompanionTimelineSegmentTransition

- ($D9ACF32088E97DD3D62E5CBFAE4B0A27)transitionInfo
{
  long long v3 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(double *)&retstr->var3 = self->var5.var0;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  result = [(_PXStoryConcreteCompanionTimelineSegmentTransition *)self transitionInfo];
  *retstr = v5;
  return result;
}

- (int64_t)kind
{
  [(_PXStoryConcreteCompanionTimelineSegmentTransition *)self transitionInfo];
  if (v3 > 0xAuLL) {
    return 0;
  }
  else {
    return qword_1AB35AF50[v3];
  }
}

- (_PXStoryConcreteCompanionTimelineSegmentTransition)initWithTransitionInfo:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_PXStoryConcreteCompanionTimelineSegmentTransition;
  result = [(_PXStoryConcreteCompanionTimelineSegmentTransition *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    long long v6 = *(_OWORD *)&a3->var2.var1;
    *(void *)&result->_transitionInfo.fallbackFromTransitionKind = *(void *)&a3->var3;
    *(_OWORD *)&result->_transitionInfo.duration.timescale = v6;
    *(_OWORD *)&result->_transitionInfo.orderOutTransition = v5;
  }
  return result;
}

@end