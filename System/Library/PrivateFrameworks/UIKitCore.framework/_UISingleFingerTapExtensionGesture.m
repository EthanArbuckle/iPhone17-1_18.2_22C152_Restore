@interface _UISingleFingerTapExtensionGesture
- (BOOL)_gestureCanBeginWithEvent:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (int64_t)_modifierFlags;
- (void)_resetGestureRecognizer;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _UISingleFingerTapExtensionGesture

- (BOOL)_gestureCanBeginWithEvent:(id)a3
{
  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UISingleFingerTapExtensionGesture;
  [(UITapGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible) {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (void)_resetGestureRecognizer
{
  v3.receiver = self;
  v3.super_class = (Class)_UISingleFingerTapExtensionGesture;
  [(UITapGestureRecognizer *)&v3 _resetGestureRecognizer];
  [(NSMutableSet *)self->_trackedEvents removeAllObjects];
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  trackedEvents = self->_trackedEvents;
  if (!trackedEvents)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v8 = self->_trackedEvents;
    self->_trackedEvents = v7;

    trackedEvents = self->_trackedEvents;
  }
  [(NSMutableSet *)trackedEvents addObject:v5];

  return 1;
}

- (int64_t)_modifierFlags
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UISingleFingerTapExtensionGesture;
  int64_t v3 = [(UIGestureRecognizer *)&v14 _modifierFlags];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = self->_trackedEvents;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 |= objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "_modifierFlags", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end