@interface _UIContextMenuScrollObservationInteraction
+ (id)interactionWithDelegate:(id)a3;
- (BOOL)_descendentScrollView:(id)a3 shouldPreserveStartOffset:(CGPoint)a4;
- (BOOL)_descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:(id)a3;
- (BOOL)_descendentScrollViewShouldScrollHorizontally:(id)a3;
- (BOOL)_descendentScrollViewShouldScrollVertically:(id)a3;
- (CGPoint)_scrollView:(id)a3 adjustedUnconstrainedOffsetForUnconstrainedOffset:(CGPoint)a4 startOffset:(CGPoint)a5 horizontalVelocity:(double *)a6 verticalVelocity:(double *)a7 animator:(id *)a8;
- (UIView)view;
- (_UIContextMenuScrollObservationInteractionDelegate)delegate;
- (void)_descendentScrollViewDidCancelDragging:(id)a3;
- (void)_descendentScrollViewDidEndDragging:(id)a3;
- (void)_endInteractionWithTranslation:(CGPoint)a3 location:(CGPoint)a4;
- (void)didMoveToView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIContextMenuScrollObservationInteraction

+ (id)interactionWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setDelegate:v3];

  return v4;
}

- (void)willMoveToView:(id)a3
{
}

- (void)didMoveToView:(id)a3
{
}

- (BOOL)_descendentScrollViewShouldScrollHorizontally:(id)a3
{
  return 1;
}

- (BOOL)_descendentScrollViewShouldScrollVertically:(id)a3
{
  return 0;
}

- (BOOL)_descendentScrollView:(id)a3 shouldPreserveStartOffset:(CGPoint)a4
{
  double y = a4.y;
  BOOL v5 = a4.y < _scrollRange(a3);
  return y > v6 || v5;
}

- (BOOL)_descendentScrollViewShouldMaintainRelativeDistanceFromSafeArea:(id)a3
{
  return 0;
}

- (CGPoint)_scrollView:(id)a3 adjustedUnconstrainedOffsetForUnconstrainedOffset:(CGPoint)a4 startOffset:(CGPoint)a5 horizontalVelocity:(double *)a6 verticalVelocity:(double *)a7 animator:(id *)a8
{
  double y = a5.y;
  double v9 = a4.y;
  id v11 = a3;
  v12 = [v11 panGestureRecognizer];
  v13 = [(_UIContextMenuScrollObservationInteraction *)self view];
  [v12 locationInView:v13];
  self->_currentLocation.x = v14;
  self->_currentLocation.double y = v15;

  if (self->_isActive)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    double v16 = y - v9;
    long long v31 = 0u;
    v17 = [(_UIContextMenuScrollObservationInteraction *)self view];
    _UIGetTransformBetweenViews(v11, v17, 1, (uint64_t)&v31);

    double v18 = *(double *)&v33 + *(double *)&v31 * 0.0 + (y - v9) * *(double *)&v32;
    double v19 = *((double *)&v33 + 1) + *((double *)&v31 + 1) * 0.0 + v16 * *((double *)&v32 + 1);
    if (v9 < _scrollRange(v11) || v9 > v20)
    {
      double v19 = v19 - self->_consumedTranslation.y;
      v25 = [(_UIContextMenuScrollObservationInteraction *)self delegate];
      objc_msgSend(v25, "scrollObservationInteraction:didUpdateWithTranslation:location:ended:", self, 0, v18, v19, self->_currentLocation.x, self->_currentLocation.y);

      uint64_t v21 = 16;
      uint64_t v22 = 8;
    }
    else
    {
      uint64_t v21 = 32;
      uint64_t v22 = 24;
    }
    *(double *)((char *)&self->super.isa + v22) = v18;
    *(double *)((char *)&self->super.isa + v21) = v19;
  }
  else
  {
    CGPoint v23 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_currentTranslation = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_consumedTranslation = v23;
    self->_isActive = 1;
    v24 = [(_UIContextMenuScrollObservationInteraction *)self delegate];
    objc_msgSend(v24, "scrollObservationInteraction:willBeginAtLocation:", self, self->_currentLocation.x, self->_currentLocation.y);
  }
  double v26 = _scrollRange(v11);
  double v28 = fmax(v26, fmin(v9, v27));

  double v29 = 0.0;
  double v30 = v28;
  result.double y = v30;
  result.x = v29;
  return result;
}

- (void)_descendentScrollViewDidEndDragging:(id)a3
{
}

- (void)_descendentScrollViewDidCancelDragging:(id)a3
{
}

- (void)_endInteractionWithTranslation:(CGPoint)a3 location:(CGPoint)a4
{
  if (self->_isActive)
  {
    double y = a4.y;
    double x = a4.x;
    double v7 = a3.y;
    double v8 = a3.x;
    double v9 = [(_UIContextMenuScrollObservationInteraction *)self delegate];
    objc_msgSend(v9, "scrollObservationInteraction:didUpdateWithTranslation:location:ended:", self, 1, v8, v7, x, y);
  }
  self->_isActive = 0;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (_UIContextMenuScrollObservationInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIContextMenuScrollObservationInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end