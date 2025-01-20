@interface UIInteractionProgress
- (UIInteractionProgress)init;
- (double)percentComplete;
- (double)velocity;
- (id)description;
- (int64_t)numberOfObservers;
- (unint64_t)_indexOfObserver:(id)a3;
- (void)addProgressObserver:(id)a3;
- (void)endInteraction:(BOOL)a3;
- (void)removeProgressObserver:(id)a3;
- (void)setPercentComplete:(double)a3;
@end

@implementation UIInteractionProgress

- (UIInteractionProgress)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIInteractionProgress;
  v2 = [(UIInteractionProgress *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    v2->_previousUpdateTime = CACurrentMediaTime();
  }
  return v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = [(id)objc_opt_class() description];
  v5 = NSNumber;
  [(UIInteractionProgress *)self percentComplete];
  objc_super v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSPointerArray count](self->_observers, "count"));
  v8 = [v3 stringWithFormat:@"<%@: %p - percentComplete: %@, num observers: %@>", v4, self, v6, v7];

  return v8;
}

- (void)setPercentComplete:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double percentComplete = self->_percentComplete;
  self->_double percentComplete = a3;
  double mostRecentUpdateTime = self->_mostRecentUpdateTime;
  self->_previousPercentComplete = percentComplete;
  self->_previousUpdateTime = mostRecentUpdateTime;
  self->_double mostRecentUpdateTime = CACurrentMediaTime();
  int64_t atLeastTwoUpdates = self->_atLeastTwoUpdates;
  if (atLeastTwoUpdates <= 1) {
    self->_int64_t atLeastTwoUpdates = atLeastTwoUpdates + 1;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = (void *)[(NSPointerArray *)self->_observers copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 interactionProgressDidUpdate:self];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (double)velocity
{
  double result = 0.0;
  if (self->_atLeastTwoUpdates >= 2)
  {
    double v3 = self->_mostRecentUpdateTime - self->_previousUpdateTime;
    if (v3 > 0.000000001) {
      return (self->_percentComplete - self->_previousPercentComplete) / v3;
    }
  }
  return result;
}

- (void)endInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = (void *)[(NSPointerArray *)self->_observers copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [(UIInteractionProgress *)self velocity];
          objc_msgSend(v10, "interactionProgress:didEnd:finalVelocity:", self, v3);
        }
        else if (objc_opt_respondsToSelector())
        {
          [v10 interactionProgress:self didEnd:v3];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (unint64_t)_indexOfObserver:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSPointerArray *)self->_observers count];
  unint64_t v6 = v5 - 1;
  if ((uint64_t)(v5 - 1) >= 0)
  {
    uint64_t v7 = v5;
    while (1)
    {
      uint64_t v8 = [(NSPointerArray *)self->_observers pointerAtIndex:--v7];
      if ((id)v8 == v4) {
        break;
      }
      uint64_t v9 = (void *)v8;
      if (!v8) {
        [(NSPointerArray *)self->_observers removePointerAtIndex:v7];
      }

      if (v7 <= 0)
      {
        unint64_t v6 = -1;
        goto LABEL_9;
      }
    }

    unint64_t v6 = v7;
  }
LABEL_9:
  if (v6 >= 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v6;
  }

  return v10;
}

- (void)addProgressObserver:(id)a3
{
  id v4 = a3;
  if (-[UIInteractionProgress _indexOfObserver:](self, "_indexOfObserver:") == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSPointerArray *)self->_observers addPointer:v4];
  }
}

- (void)removeProgressObserver:(id)a3
{
  unint64_t v4 = [(UIInteractionProgress *)self _indexOfObserver:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = v4;
    observers = self->_observers;
    [(NSPointerArray *)observers removePointerAtIndex:v5];
  }
}

- (int64_t)numberOfObservers
{
  [(NSPointerArray *)self->_observers compact];
  observers = self->_observers;
  return [(NSPointerArray *)observers count];
}

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void).cxx_destruct
{
}

@end