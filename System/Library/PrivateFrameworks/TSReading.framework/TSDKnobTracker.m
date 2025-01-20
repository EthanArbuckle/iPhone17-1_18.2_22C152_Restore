@interface TSDKnobTracker
- (BOOL)allowHUDToDisplay;
- (BOOL)didBegin;
- (BOOL)didDrag;
- (BOOL)dragEnding;
- (BOOL)endedOperationDueToESC;
- (BOOL)isInspectorDrivenTracking;
- (BOOL)operationShouldBeDynamic;
- (BOOL)shouldEndMovingKnobOnESC;
- (BOOL)shouldHideOtherKnobs;
- (BOOL)shouldHideSelectionHighlight;
- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3;
- (BOOL)shouldUseKnobOffset;
- (BOOL)supportsAlignmentGuides;
- (BOOL)wantsAutoscroll;
- (CGAffineTransform)transformInRootForStandardKnobs;
- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3;
- (CGPoint)currentPosition;
- (CGPoint)knobOffset;
- (CGRect)currentBoundsForStandardKnobs;
- (TSDAutoscroll)autoscroll;
- (TSDInteractiveCanvasController)icc;
- (TSDKnob)knob;
- (TSDKnobTracker)initWithRep:(id)a3 knob:(id)a4;
- (TSDRep)rep;
- (double)delay;
- (double)unscaledStartAutoscrollThreshold;
- (int)allowedAutoscrollDirections;
- (unint64_t)enabledKnobMask;
- (void)beginMovingKnob;
- (void)changeDynamicLayoutsForReps:(id)a3;
- (void)dealloc;
- (void)endMovingKnob;
- (void)i_resetCurrentPositionToKnobPositionIfAppropriate;
- (void)i_setKnobOffset:(CGPoint)a3;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
- (void)setAutoscroll:(id)a3;
- (void)setCurrentPosition:(CGPoint)a3;
- (void)setDidDrag:(BOOL)a3;
- (void)setDragEnding:(BOOL)a3;
- (void)setIsInspectorDrivenTracking:(BOOL)a3;
- (void)setKnob:(id)a3;
- (void)setRep:(id)a3;
- (void)willEndMovingKnobDueToESC;
@end

@implementation TSDKnobTracker

- (TSDKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TSDKnobTracker;
  v6 = [(TSDKnobTracker *)&v12 init];
  if (v6)
  {
    if (a3)
    {
      if (a4)
      {
LABEL_4:
        [(TSDKnobTracker *)v6 setKnob:a4];
        [(TSDKnobTracker *)v6 setRep:a3];
        return v6;
      }
    }
    else
    {
      v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSDKnobTracker initWithRep:knob:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobTracker.m"), 27, @"invalid nil value for '%s'", "rep");
      if (a4) {
        goto LABEL_4;
      }
    }
    v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDKnobTracker initWithRep:knob:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnobTracker.m"), 28, @"invalid nil value for '%s'", "knob");
    goto LABEL_4;
  }
  return v6;
}

- (void)dealloc
{
  if ([(TSDRep *)self->mRep currentKnobTracker] == self) {
    [(TSDRep *)self->mRep setCurrentKnobTracker:0];
  }

  v3.receiver = self;
  v3.super_class = (Class)TSDKnobTracker;
  [(TSDKnobTracker *)&v3 dealloc];
}

- (void)setRep:(id)a3
{
  mRep = self->mRep;
  if (mRep != a3)
  {
    if ([(TSDRep *)mRep currentKnobTracker] == self) {
      [(TSDRep *)self->mRep setCurrentKnobTracker:0];
    }

    v6 = (TSDRep *)a3;
    self->mRep = v6;
    [(TSDRep *)v6 setCurrentKnobTracker:self];
  }
}

- (TSDInteractiveCanvasController)icc
{
  return [(TSDRep *)self->mRep interactiveCanvasController];
}

- (double)delay
{
  return 0.0;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(TSDKnobTracker *)self rep];
  if (v6)
  {
    -[TSDRep convertNaturalPointFromUnscaledCanvas:](v6, "convertNaturalPointFromUnscaledCanvas:", x, y);
    -[TSDKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:");
  }
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = [(TSDKnobTracker *)self rep];
  -[TSDRep convertNaturalPointToUnscaledCanvas:](v5, "convertNaturalPointToUnscaledCanvas:", x, y);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (void)beginMovingKnob
{
  self->mDidBegin = 1;
}

- (void)endMovingKnob
{
  if ([(TSDRep *)self->mRep currentKnobTracker] == self)
  {
    mRep = self->mRep;
    [(TSDRep *)mRep setCurrentKnobTracker:0];
  }
}

- (CGRect)currentBoundsForStandardKnobs
{
  [(TSDRep *)self->mRep boundsForStandardKnobs];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGAffineTransform)transformInRootForStandardKnobs
{
  CGRect result = [(TSDRep *)self->mRep layout];
  if (result)
  {
    return (CGAffineTransform *)[(CGAffineTransform *)result transformInRoot];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  return result;
}

- (unint64_t)enabledKnobMask
{
  if (![(TSDKnobTracker *)self shouldHideOtherKnobs]) {
    return -1;
  }
  char v3 = [[(TSDKnobTracker *)self knob] tag];
  return TSDMaskForKnob(v3);
}

- (BOOL)shouldHideOtherKnobs
{
  return 1;
}

- (BOOL)shouldHideSelectionHighlight
{
  return 1;
}

- (BOOL)allowHUDToDisplay
{
  return 1;
}

- (BOOL)shouldUseKnobOffset
{
  return 1;
}

- (BOOL)shouldEndMovingKnobOnESC
{
  return 0;
}

- (void)willEndMovingKnobDueToESC
{
  self->mEndedOperationDueToESC = 1;
}

- (void)i_setKnobOffset:(CGPoint)a3
{
  self->mKnobOffset = a3;
}

- (void)i_resetCurrentPositionToKnobPositionIfAppropriate
{
  if (![(TSDKnobTracker *)self didDrag] && [(TSDKnobTracker *)self dragEnding])
  {
    char v3 = [(TSDKnobTracker *)self rep];
    [[(TSDKnobTracker *)self knob] position];
    -[TSDRep convertNaturalPointToUnscaledCanvas:](v3, "convertNaturalPointToUnscaledCanvas:");
    -[TSDKnobTracker setCurrentPosition:](self, "setCurrentPosition:");
  }
}

- (BOOL)wantsAutoscroll
{
  return 1;
}

- (double)unscaledStartAutoscrollThreshold
{
  return 20.0;
}

- (int)allowedAutoscrollDirections
{
  return 15;
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  [(TSDKnobTracker *)self i_resetCurrentPositionToKnobPositionIfAppropriate];
  BOOL mDidBegin = self->mDidBegin;
  if (!self->mDidBegin)
  {
    self->BOOL mDidBegin = 1;
    [(TSDKnobTracker *)self beginMovingKnob];
  }
  if (![(TSDKnobTracker *)self didDrag] && ![(TSDKnobTracker *)self dragEnding])
  {
    [[(TSDKnobTracker *)self knob] position];
    double v6 = v5;
    double v8 = v7;
    uint64_t v9 = [(TSDKnobTracker *)self rep];
    [(TSDKnobTracker *)self currentPosition];
    -[TSDRep convertNaturalPointFromUnscaledCanvas:](v9, "convertNaturalPointFromUnscaledCanvas:");
    if (!TSDNearlyEqualPoints(v6, v8, v10, v11)) {
      [(TSDKnobTracker *)self setDidDrag:1];
    }
  }
  if (!mDidBegin || [(TSDKnobTracker *)self didDrag])
  {
    [(TSDKnobTracker *)self currentPosition];
    -[TSDKnobTracker moveKnobToCanvasPosition:](self, "moveKnobToCanvasPosition:");
  }
}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return 1;
}

- (TSDRep)rep
{
  return self->mRep;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mIsInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mIsInspectorDrivenTracking = a3;
}

- (TSDKnob)knob
{
  return self->mKnob;
}

- (void)setKnob:(id)a3
{
}

- (BOOL)didBegin
{
  return self->mDidBegin;
}

- (BOOL)didDrag
{
  return self->mDidDrag;
}

- (void)setDidDrag:(BOOL)a3
{
  self->mDidDrag = a3;
}

- (CGPoint)currentPosition
{
  double x = self->mCurrentPosition.x;
  double y = self->mCurrentPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCurrentPosition:(CGPoint)a3
{
  self->mCurrentPosition = a3;
}

- (BOOL)dragEnding
{
  return self->mDragEnding;
}

- (void)setDragEnding:(BOOL)a3
{
  self->mDragEnding = a3;
}

- (BOOL)endedOperationDueToESC
{
  return self->mEndedOperationDueToESC;
}

- (CGPoint)knobOffset
{
  double x = self->mKnobOffset.x;
  double y = self->mKnobOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (TSDAutoscroll)autoscroll
{
  return self->mAutoscroll;
}

- (void)setAutoscroll:(id)a3
{
}

@end