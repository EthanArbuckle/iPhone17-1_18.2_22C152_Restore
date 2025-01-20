@interface _UIControlEventsGestureRecognizer
- (UITouch)activeTouch;
- (_UIControlEventsGestureRecognizerDelegate)controlEventsDelegate;
- (void)gestureRecognizerFailed;
- (void)reset;
- (void)sendControlEvent:(unint64_t)a3 withEvent:(id)a4;
- (void)setControlEventsDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIControlEventsGestureRecognizer

- (void)setControlEventsDelegate:(id)a3
{
}

- (void)sendControlEvent:(unint64_t)a3 withEvent:(id)a4
{
  id v7 = [(_UIControlEventsGestureRecognizer *)self controlEventsDelegate];
  [v7 controlEventsGestureRecognizer:self recognizedControlEvent:a3 withEvent:a4];
}

- (void)gestureRecognizerFailed
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateFailed
    && (*(unsigned char *)&self->_flags & 4) == 0)
  {
    [(_UIControlEventsGestureRecognizer *)self sendControlEvent:256 withEvent:0];
    *(unsigned char *)&self->_flags |= 4u;
  }
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)_UIControlEventsGestureRecognizer;
  [(UIGestureRecognizer *)&v4 reset];
  if ((*(unsigned char *)&self->_flags & 4) == 0
    && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateFailed)
  {
    [(_UIControlEventsGestureRecognizer *)self sendControlEvent:256 withEvent:0];
  }
  *(unsigned char *)&self->_flags &= ~4u;
  activeTouch = self->_activeTouch;
  self->_activeTouch = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v8 = [a3 anyObject];
  objc_storeStrong((id *)&self->_activeTouch, v8);
  v6 = v8;
  if (v8)
  {
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 1;
    [(_UIControlEventsGestureRecognizer *)self sendControlEvent:1 withEvent:a4];
    BOOL v7 = (unint64_t)[v8 tapCount] >= 2;
    v6 = v8;
    if (v7)
    {
      [(_UIControlEventsGestureRecognizer *)self sendControlEvent:2 withEvent:a4];
      v6 = v8;
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v21 = [a3 anyObject];
  objc_storeStrong((id *)&self->_activeTouch, v21);
  v6 = v21;
  if (v21)
  {
    BOOL v7 = [(UIGestureRecognizer *)self view];
    [v21 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    char flags = (char)self->_flags;
    v13 = [(UIGestureRecognizer *)self view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v15 = [(UIGestureRecognizer *)self view];
    v16 = v15;
    if (isKindOfClass) {
      int v17 = objc_msgSend(v15, "pointMostlyInside:withEvent:", a4, v9, v11);
    }
    else {
      int v17 = objc_msgSend(v15, "pointInside:withEvent:", a4, v9, v11);
    }
    int v18 = v17;

    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFC | v18 | 2;
    if (((((flags & 1) == 0) ^ v18) & 1) == 0)
    {
      if (v18) {
        uint64_t v19 = 16;
      }
      else {
        uint64_t v19 = 32;
      }
      [(_UIControlEventsGestureRecognizer *)self sendControlEvent:v19 withEvent:a4];
    }
    if (v18) {
      uint64_t v20 = 4;
    }
    else {
      uint64_t v20 = 8;
    }
    [(_UIControlEventsGestureRecognizer *)self sendControlEvent:v20 withEvent:a4];
    v6 = v21;
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6 = [a3 anyObject];
  if (v6)
  {
    id v23 = v6;
    BOOL v7 = [(UIGestureRecognizer *)self view];
    [v23 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    char flags = (char)self->_flags;
    v13 = [(UIGestureRecognizer *)self view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v15 = [(UIGestureRecognizer *)self view];
    v16 = v15;
    if (isKindOfClass) {
      int v17 = objc_msgSend(v15, "pointMostlyInside:withEvent:", a4, v9, v11);
    }
    else {
      int v17 = objc_msgSend(v15, "pointInside:withEvent:", a4, v9, v11);
    }
    int v18 = v17;

    *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFC | v18;
    if (((((flags & 1) == 0) ^ v18) & 1) == 0)
    {
      if (v18) {
        uint64_t v19 = 16;
      }
      else {
        uint64_t v19 = 32;
      }
      [(_UIControlEventsGestureRecognizer *)self sendControlEvent:v19 withEvent:a4];
    }
    if (v18) {
      uint64_t v20 = 64;
    }
    else {
      uint64_t v20 = 128;
    }
    [(_UIControlEventsGestureRecognizer *)self sendControlEvent:v20 withEvent:a4];
    id v21 = [(UIGestureRecognizer *)self _allActiveTouches];
    uint64_t v22 = [v21 count];

    v6 = v23;
    if (!v22)
    {
      [(UIGestureRecognizer *)self setState:3];
      v6 = v23;
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  [(_UIControlEventsGestureRecognizer *)self sendControlEvent:256 withEvent:a4];
  *(unsigned char *)&self->_flags |= 4u;
  [(UIGestureRecognizer *)self setState:5];
}

- (UITouch)activeTouch
{
  return self->_activeTouch;
}

- (_UIControlEventsGestureRecognizerDelegate)controlEventsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlEventsDelegate);
  return (_UIControlEventsGestureRecognizerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controlEventsDelegate);
  objc_storeStrong((id *)&self->_activeTouch, 0);
}

@end