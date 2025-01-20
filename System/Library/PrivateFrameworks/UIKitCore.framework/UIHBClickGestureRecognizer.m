@interface UIHBClickGestureRecognizer
- (BOOL)recognizesOnPressPhaseBegan;
- (UIHBClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (unint64_t)clickCount;
- (void)_fail;
- (void)_processPresses:(id)a3;
- (void)_resetGestureRecognizer;
- (void)_succeed;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEventDidReceiveTerminal:(id)a3;
- (void)setClickCount:(unint64_t)a3;
- (void)setRecognizesOnPressPhaseBegan:(BOOL)a3;
@end

@implementation UIHBClickGestureRecognizer

- (UIHBClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIHBClickGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_clickCount = 1;
    v4->_lastSeenClickCount = 0;
    v4->_recognizesOnPressPhaseBegan = 0;
    [(UIGestureRecognizer *)v4 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v5 setAllowedPressTypes:&unk_1ED3EFB78];
  }
  return v5;
}

- (void)_resetGestureRecognizer
{
  v4.receiver = self;
  v4.super_class = (Class)UIHBClickGestureRecognizer;
  [(UIGestureRecognizer *)&v4 _resetGestureRecognizer];
  [(UIPressesEvent *)self->_registeredEventForTerminalEvents _unregisterForTerminalEvent:self];
  registeredEventForTerminalEvents = self->_registeredEventForTerminalEvents;
  self->_registeredEventForTerminalEvents = 0;

  self->_lastSeenClickCount = 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  p_registeredEventForTerminalEvents = &self->_registeredEventForTerminalEvents;
  if (!*p_registeredEventForTerminalEvents)
  {
    objc_storeStrong((id *)p_registeredEventForTerminalEvents, a4);
    [a4 _registerForTerminalEvent:self];
  }
  -[UIHBClickGestureRecognizer _processPresses:](self, "_processPresses:", a3, a4);
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(UIGestureRecognizer *)self state] > UIGestureRecognizerStatePossible) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 5;
  }
  [(UIGestureRecognizer *)self setState:v5];
}

- (void)_succeed
{
}

- (void)_fail
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)_processPresses:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        self->_lastSeenClickCount = objc_msgSend(v9, "clickCount", (void)v11);
        if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
        {
          if ([v9 clickCount] == self->_clickCount)
          {
            if (self->_recognizesOnPressPhaseBegan || [v9 phase] == 3) {
              [(UIHBClickGestureRecognizer *)self _succeed];
            }
          }
          else if ([v9 clickCount] > self->_clickCount)
          {
            [(UIHBClickGestureRecognizer *)self _fail];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v10 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v6 = v10;
    }
    while (v10);
  }
}

- (void)pressesEventDidReceiveTerminal:(id)a3
{
  if (self
    && (*(void *)&self->super._gestureFlags & 0x200000000) != 0
    && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible
    && self->_lastSeenClickCount != self->_clickCount)
  {
    [(UIHBClickGestureRecognizer *)self _fail];
  }
}

- (unint64_t)clickCount
{
  return self->_clickCount;
}

- (void)setClickCount:(unint64_t)a3
{
  self->_clickCount = a3;
}

- (BOOL)recognizesOnPressPhaseBegan
{
  return self->_recognizesOnPressPhaseBegan;
}

- (void)setRecognizesOnPressPhaseBegan:(BOOL)a3
{
  self->_recognizesOnPressPhaseBegan = a3;
}

- (void).cxx_destruct
{
}

@end