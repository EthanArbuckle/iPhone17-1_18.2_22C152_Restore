@interface UIDragGestureRecognizer
- (BOOL)_shouldReceivePress:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (UIDragEvent)_dragEvent;
- (UIDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_UIDropSessionImpl)dropSession;
- (_UIInternalDraggingSessionDestination)sessionDestination;
@end

@implementation UIDragGestureRecognizer

- (BOOL)_shouldReceiveTouch:(id)a3 forEvent:(id)a4 recognizerView:(id)a5
{
  return 0;
}

- (UIDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIDragGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v5 setCancelsTouchesInView:0];
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [(UIGestureRecognizer *)v5 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v5 setAllowedPressTypes:v6];
    [(UIGestureRecognizer *)v5 _setRequiresSystemGesturesToFail:0];
    *(void *)&v5->super._gestureFlags |= 0x100000000000uLL;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (_UIInternalDraggingSessionDestination)sessionDestination
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
  v3 = [WeakRetained _sessionDestination];

  return (_UIInternalDraggingSessionDestination *)v3;
}

- (_UIDropSessionImpl)dropSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
  v3 = [WeakRetained _dropSession];

  return (_UIDropSessionImpl *)v3;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 9)
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
    v7 = WeakRetained;
    if (self && WeakRetained != v5 && (*(void *)&self->super._gestureFlags & 0x400000000000) != 0)
    {
      v10 = [v5 _dynamicGestureRecognizers];
      int v11 = [v10 containsObject:self];

      if (!v11)
      {
        BOOL v9 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
    }
    objc_super v8 = [(UIGestureRecognizer *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ![v8 _gestureRecognizer:self shouldReceiveDragEvent:v5])
    {
      BOOL v9 = 0;
    }
    else
    {
      objc_storeWeak((id *)&self->_dragEvent, v5);
      BOOL v9 = 1;
    }

    goto LABEL_14;
  }
  BOOL v9 = 0;
LABEL_15:

  return v9;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 _dragEvent];
    uint64_t v6 = [(UIDragGestureRecognizer *)self _dragEvent];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 _dragEvent];
    uint64_t v6 = [(UIDragGestureRecognizer *)self _dragEvent];
    BOOL v7 = v5 == v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDragGestureRecognizer *)self _dragEvent];
  [v5 locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIDragEvent)_dragEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragEvent);
  return (UIDragEvent *)WeakRetained;
}

@end