@interface UIHBDownGestureRecognizer
- (BOOL)_allRequiredButtonsDown;
- (UIHBDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)maximumIntervalBetweenPresses;
- (void)_fail;
- (void)_processPresses:(id)a3;
- (void)_resetGestureRecognizer;
- (void)_succeed;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)setAllowedPressTypes:(id)a3;
- (void)setMaximumIntervalBetweenPresses:(double)a3;
@end

@implementation UIHBDownGestureRecognizer

- (UIHBDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIHBDownGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v11 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_maximumIntervalBetweenPresses = 0.25;
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    requiredPressTypes = v5->_requiredPressTypes;
    v5->_requiredPressTypes = (NSSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    currentlyPressedTypes = v5->_currentlyPressedTypes;
    v5->_currentlyPressedTypes = (NSMutableSet *)v8;

    [(UIGestureRecognizer *)v5 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [(UIHBDownGestureRecognizer *)v5 setAllowedPressTypes:&unk_1ED3EFB90];
  }
  return v5;
}

- (void)setAllowedPressTypes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIHBDownGestureRecognizer;
  -[UIGestureRecognizer setAllowedPressTypes:](&v7, sel_setAllowedPressTypes_);
  v5 = [MEMORY[0x1E4F1CAD0] setWithArray:a3];
  requiredPressTypes = self->_requiredPressTypes;
  self->_requiredPressTypes = v5;
}

- (void)_resetGestureRecognizer
{
  v3.receiver = self;
  v3.super_class = (Class)UIHBDownGestureRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
  [(NSMutableSet *)self->_currentlyPressedTypes removeAllObjects];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if ([(NSSet *)self->_requiredPressTypes count] && !self->_delayedAction)
  {
    uint64_t v6 = [UIDelayedAction alloc];
    objc_super v7 = [(UIDelayedAction *)v6 initWithTarget:self action:sel__fail userInfo:0 delay:*MEMORY[0x1E4F1C4B0] mode:self->_maximumIntervalBetweenPresses];
    delayedAction = self->_delayedAction;
    self->_delayedAction = v7;
  }
  [(UIHBDownGestureRecognizer *)self _processPresses:a3];
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
  [(UIDelayedAction *)self->_delayedAction cancel];
  delayedAction = self->_delayedAction;
  self->_delayedAction = 0;

  [(UIGestureRecognizer *)self setState:3];
}

- (void)_fail
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    [(UIDelayedAction *)self->_delayedAction cancel];
    delayedAction = self->_delayedAction;
    self->_delayedAction = 0;

    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)_processPresses:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "phase", (void)v14))
        {
          if ([v9 phase] == 3)
          {
            currentlyPressedTypes = self->_currentlyPressedTypes;
            objc_super v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "type"));
            [(NSMutableSet *)currentlyPressedTypes removeObject:v11];

            [(UIHBDownGestureRecognizer *)self _fail];
          }
        }
        else
        {
          v12 = self->_currentlyPressedTypes;
          v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "type"));
          [(NSMutableSet *)v12 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    if ([(UIHBDownGestureRecognizer *)self _allRequiredButtonsDown]) {
      [(UIHBDownGestureRecognizer *)self _succeed];
    }
  }
}

- (BOOL)_allRequiredButtonsDown
{
  return [(NSSet *)self->_requiredPressTypes isEqual:self->_currentlyPressedTypes];
}

- (double)maximumIntervalBetweenPresses
{
  return self->_maximumIntervalBetweenPresses;
}

- (void)setMaximumIntervalBetweenPresses:(double)a3
{
  self->_maximumIntervalBetweenPresses = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredPressTypes, 0);
  objc_storeStrong((id *)&self->_currentlyPressedTypes, 0);
  objc_storeStrong((id *)&self->_delayedAction, 0);
}

@end