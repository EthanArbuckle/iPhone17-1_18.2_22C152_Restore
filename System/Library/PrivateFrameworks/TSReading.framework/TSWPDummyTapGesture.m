@interface TSWPDummyTapGesture
- (BOOL)isDone;
- (CGPoint)boundsLocationForICC:(id)a3;
- (CGPoint)naturalLocationForRep:(id)a3;
- (CGPoint)unscaledLocationForICC:(id)a3;
- (NSString)gestureKind;
- (TSDGestureDelegate)gestureDelegate;
- (TSDGestureTarget)cachedGestureTarget;
- (TSDRep)targetRep;
- (TSWPDummyTapGesture)initWithKind:(id)a3;
- (int)gestureState;
- (void)dealloc;
- (void)setCachedGestureTarget:(id)a3;
- (void)setGestureDelegate:(id)a3;
- (void)setGestureKind:(id)a3;
- (void)setTargetRep:(id)a3;
@end

@implementation TSWPDummyTapGesture

- (TSWPDummyTapGesture)initWithKind:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPDummyTapGesture;
  v4 = [(TSWPDummyTapGesture *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TSWPDummyTapGesture *)v4 setGestureKind:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(TSWPDummyTapGesture *)self setGestureKind:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPDummyTapGesture;
  [(TSWPDummyTapGesture *)&v3 dealloc];
}

- (CGPoint)unscaledLocationForICC:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)boundsLocationForICC:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)naturalLocationForRep:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)isDone
{
  return 1;
}

- (TSDGestureTarget)cachedGestureTarget
{
  return self->cachedGestureTarget;
}

- (void)setCachedGestureTarget:(id)a3
{
}

- (TSDGestureDelegate)gestureDelegate
{
  return self->gestureDelegate;
}

- (void)setGestureDelegate:(id)a3
{
  self->gestureDelegate = (TSDGestureDelegate *)a3;
}

- (NSString)gestureKind
{
  return self->_gestureKind;
}

- (void)setGestureKind:(id)a3
{
}

- (TSDRep)targetRep
{
  return self->targetRep;
}

- (void)setTargetRep:(id)a3
{
}

- (int)gestureState
{
  return self->gestureState;
}

@end