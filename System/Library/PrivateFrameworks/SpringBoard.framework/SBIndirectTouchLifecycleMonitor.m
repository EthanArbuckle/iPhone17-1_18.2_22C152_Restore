@interface SBIndirectTouchLifecycleMonitor
- (CGPoint)systemGestureHoverLocationInView:(id)a3;
- (NSHashTable)observers;
- (SBIndirectTouchLifecycleMonitor)initWithSystemGestureManager:(id)a3;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (void)addObserver:(id)a3;
- (void)handleHoverEvent:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setHoverGestureRecognizer:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation SBIndirectTouchLifecycleMonitor

- (SBIndirectTouchLifecycleMonitor)initWithSystemGestureManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIndirectTouchLifecycleMonitor;
  v5 = [(SBIndirectTouchLifecycleMonitor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v5 action:sel_handleHoverEvent_];
    hoverGestureRecognizer = v5->_hoverGestureRecognizer;
    v5->_hoverGestureRecognizer = (UIHoverGestureRecognizer *)v6;

    [(UIHoverGestureRecognizer *)v5->_hoverGestureRecognizer setDelegate:v5];
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;

    [v4 addGestureRecognizer:v5->_hoverGestureRecognizer withType:109];
  }

  return v5;
}

- (void)handleHoverEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 _activeEventOfType:11];
  [v4 _hidEvent];
  if (SBPointerHIDSubEventFromEvent())
  {
    v5 = BKSHIDEventGetPointerAttributes();
  }
  else
  {
    v5 = 0;
  }
  if (SBPointerEventRepresentsTrackpadTouchUp(v5))
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "trackpadDidTouchUpWithEvent:", v4, (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (CGPoint)systemGestureHoverLocationInView:(id)a3
{
  _UISystemGestureLocationInView();
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:")) {
    [(NSHashTable *)self->_observers addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:")) {
    [(NSHashTable *)self->_observers removeObject:v4];
  }
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
}

@end