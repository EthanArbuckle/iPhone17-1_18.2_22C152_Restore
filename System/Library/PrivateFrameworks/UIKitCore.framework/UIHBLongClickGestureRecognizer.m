@interface UIHBLongClickGestureRecognizer
- (BOOL)_requiredClickCountMetForPress:(id)a3;
- (UIHBLongClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (unint64_t)_effectiveNumberOfClicksRequired;
- (unint64_t)numberOfClicksRequired;
- (void)_fail;
- (void)_processPresses:(id)a3;
- (void)_resetGestureRecognizer;
- (void)_succeed;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEventDidReceiveTerminal:(id)a3;
- (void)setNumberOfClicksRequired:(unint64_t)a3;
@end

@implementation UIHBLongClickGestureRecognizer

- (UIHBLongClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIHBLongClickGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_lastSeenClickCount = 0;
    [(UIGestureRecognizer *)v4 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v5 setAllowedPressTypes:&unk_1ED3EFBA8];
  }
  return v5;
}

- (void)_resetGestureRecognizer
{
  v4.receiver = self;
  v4.super_class = (Class)UIHBLongClickGestureRecognizer;
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
  -[UIHBLongClickGestureRecognizer _processPresses:](self, "_processPresses:", a3, a4);
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
}

- (unint64_t)_effectiveNumberOfClicksRequired
{
  return self->_numberOfClicksRequired + 1;
}

- (BOOL)_requiredClickCountMetForPress:(id)a3
{
  unint64_t v4 = [(UIHBLongClickGestureRecognizer *)self _effectiveNumberOfClicksRequired];
  return v4 == [a3 clickCount];
}

- (void)_processPresses:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * v8);
        self->_lastSeenClickCount = objc_msgSend(v9, "clickCount", (void)v13);
        if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
        {
          BOOL v10 = [(UIHBLongClickGestureRecognizer *)self _requiredClickCountMetForPress:v9];
          int v11 = [v9 isLongClick];
          if (!v10)
          {
            if (!v11) {
              goto LABEL_7;
            }
LABEL_15:
            [(UIHBLongClickGestureRecognizer *)self _fail];
            goto LABEL_7;
          }
          if (v11)
          {
            [(UIHBLongClickGestureRecognizer *)self _succeed];
            goto LABEL_7;
          }
          if ([v9 phase] == 3) {
            goto LABEL_15;
          }
        }
LABEL_7:
        ++v8;
      }
      while (v6 != v8);
      uint64_t v12 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v6 = v12;
    }
    while (v12);
  }
}

- (void)pressesEventDidReceiveTerminal:(id)a3
{
  if (self)
  {
    if ((*(void *)&self->super._gestureFlags & 0x200000000) != 0
      && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
    {
      unint64_t lastSeenClickCount = self->_lastSeenClickCount;
      if (lastSeenClickCount != [(UIHBLongClickGestureRecognizer *)self _effectiveNumberOfClicksRequired])
      {
        [(UIHBLongClickGestureRecognizer *)self _fail];
      }
    }
  }
}

- (unint64_t)numberOfClicksRequired
{
  return self->_numberOfClicksRequired;
}

- (void)setNumberOfClicksRequired:(unint64_t)a3
{
  self->_numberOfClicksRequired = a3;
}

- (void).cxx_destruct
{
}

@end