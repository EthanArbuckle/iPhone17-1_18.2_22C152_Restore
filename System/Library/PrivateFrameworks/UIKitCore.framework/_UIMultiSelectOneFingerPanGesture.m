@interface _UIMultiSelectOneFingerPanGesture
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_preventsDragInteractionGestures;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (UIEvent)activeEvent;
- (UITouch)activeTouch;
- (_UIMultiSelectOneFingerPanGestureDelegate)oneFingerPanDelegate;
- (void)reset;
- (void)setOneFingerPanDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _UIMultiSelectOneFingerPanGesture

- (void)setOneFingerPanDelegate:(id)a3
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIMultiSelectOneFingerPanGesture;
  [(UIPanGestureRecognizer *)&v11 touchesBegan:v6 withEvent:v7];
  if (!self->_activeTouch)
  {
    v8 = [v6 anyObject];
    activeTouch = self->_activeTouch;
    self->_activeTouch = v8;

    objc_storeStrong((id *)&self->_activeEvent, a4);
  }
  [(UIPanGestureRecognizer *)self _hysteresis];
  if (v10 < 0.00000011920929
    || [(_UIMultiSelectOneFingerPanGesture *)self _preventsDragInteractionGestures])
  {
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)reset
{
  activeTouch = self->_activeTouch;
  self->_activeTouch = 0;

  activeEvent = self->_activeEvent;
  self->_activeEvent = 0;
}

- (BOOL)_preventsDragInteractionGestures
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oneFingerPanDelegate);
  LOBYTE(v2) = [WeakRetained multiSelectOneFingerPanGestureShouldPreventDragInteractionGesture:v2];

  return (char)v2;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStateBegan
    && [v4 _isGestureType:8])
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    activeTouch = self->_activeTouch;
    id v7 = v4;
    v8 = [v5 setWithObject:activeTouch];
    -[UIPanGestureRecognizer _ignoreTouches:forEvent:](v7, v8, (uint64_t)self->_activeEvent);
  }
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  BOOL v5 = ![(_UIMultiSelectOneFingerPanGesture *)self _preventsDragInteractionGestures]
    && (_isDragInteractionGestureRecognizer(v4) & 1) != 0;

  return v5;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIMultiSelectOneFingerPanGesture *)self _preventsDragInteractionGestures]
    && (_isDragInteractionGestureRecognizer(v4) & 1) != 0;

  return v5;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return _isDragInteractionGestureRecognizer(a3);
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (UIEvent)activeEvent
{
  return self->_activeEvent;
}

- (_UIMultiSelectOneFingerPanGestureDelegate)oneFingerPanDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_oneFingerPanDelegate);
  return (_UIMultiSelectOneFingerPanGestureDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_oneFingerPanDelegate);
  objc_storeStrong((id *)&self->_activeEvent, 0);
  objc_storeStrong((id *)&self->_activeTouch, 0);
}

@end