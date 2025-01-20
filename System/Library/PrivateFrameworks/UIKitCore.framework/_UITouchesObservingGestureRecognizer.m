@interface _UITouchesObservingGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_allTouchesAreEndedOrCancelled:(id)a3;
- (BOOL)_wantsPartialTouchSequences;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (NSSet)touches;
- (_UITouchesObservingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_updateTouchesFromEvent:(id)a3;
- (void)reset;
- (void)setTouches:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UITouchesObservingGestureRecognizer

- (_UITouchesObservingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UITouchesObservingGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v5 _setAcceptsFailureRequiments:0];
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible) {
    [(UIGestureRecognizer *)self setState:1];
  }
  [(_UITouchesObservingGestureRecognizer *)self _updateTouchesFromEvent:v5];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible) {
    [(UIGestureRecognizer *)self setState:1];
  }
  [(_UITouchesObservingGestureRecognizer *)self _updateTouchesFromEvent:v5];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  [(_UITouchesObservingGestureRecognizer *)self _updateTouchesFromEvent:v5];
  BOOL v6 = [(_UITouchesObservingGestureRecognizer *)self _allTouchesAreEndedOrCancelled:v5];

  if (v6)
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  [(_UITouchesObservingGestureRecognizer *)self _updateTouchesFromEvent:v5];
  BOOL v6 = [(_UITouchesObservingGestureRecognizer *)self _allTouchesAreEndedOrCancelled:v5];

  if (v6)
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)reset
{
}

- (BOOL)_allTouchesAreEndedOrCancelled:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "touchesForGestureRecognizer:", self, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 phase] != 3 && objc_msgSend(v8, "phase") != 4)
        {
          BOOL v9 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)_updateTouchesFromEvent:(id)a3
{
  id v4 = [a3 touchesForGestureRecognizer:self];
  [(_UITouchesObservingGestureRecognizer *)self setTouches:v4];
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)_wantsPartialTouchSequences
{
  return 1;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (NSSet)touches
{
  return self->_touches;
}

- (void)setTouches:(id)a3
{
}

- (void).cxx_destruct
{
}

@end