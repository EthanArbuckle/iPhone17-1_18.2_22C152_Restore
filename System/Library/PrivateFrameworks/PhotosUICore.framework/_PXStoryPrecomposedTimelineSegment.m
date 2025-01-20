@interface _PXStoryPrecomposedTimelineSegment
- (PXStoryClipComposition)clipComposition;
- (_PXStoryPrecomposedTimelineSegment)initWithClipComposition:(id)a3 transitionKind:(char)a4;
- (char)transitionKind;
- (void)setClipComposition:(id)a3;
- (void)setTransitionKind:(char)a3;
@end

@implementation _PXStoryPrecomposedTimelineSegment

- (void).cxx_destruct
{
}

- (void)setTransitionKind:(char)a3
{
  self->_transitionKind = a3;
}

- (char)transitionKind
{
  return self->_transitionKind;
}

- (void)setClipComposition:(id)a3
{
}

- (PXStoryClipComposition)clipComposition
{
  return self->_clipComposition;
}

- (_PXStoryPrecomposedTimelineSegment)initWithClipComposition:(id)a3 transitionKind:(char)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PXStoryPrecomposedTimelineSegment;
  v8 = [(_PXStoryPrecomposedTimelineSegment *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clipComposition, a3);
    v9->_transitionKind = a4;
  }

  return v9;
}

@end