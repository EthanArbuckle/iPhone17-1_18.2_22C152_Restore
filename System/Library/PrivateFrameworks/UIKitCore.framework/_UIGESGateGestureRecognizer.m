@interface _UIGESGateGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_isAllowedToReceiveGESEvents;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)_validateTouchesFailingIfNeeded:(BOOL)result;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (_UIGESGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIGESGateGestureRecognizer

- (BOOL)_isAllowedToReceiveGESEvents
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return [a3 type] == 0;
}

- (BOOL)_validateTouchesFailingIfNeeded:(BOOL)result
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = (void *)result;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = a2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:buf count:16];
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
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if (!v8 || (*(_WORD *)(v8 + 236) & 0x2000) == 0)
          {

            objc_msgSend(v2, "setState:", 5, (void)v11);
            unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", _validateTouchesFailingIfNeeded____s_category);
            if (*(unsigned char *)CategoryCachedImpl)
            {
              v10 = *(NSObject **)(CategoryCachedImpl + 8);
              if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Opening GES Gate due to receiving touches without phase (kIOHIDEventPhaseMayBegin)", buf, 2u);
              }
            }
            return objc_msgSend(v2, "state", (void)v11) == 5;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:buf count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    return objc_msgSend(v2, "state", (void)v11) == 5;
  }
  return result;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  if ((objc_msgSend((id)UIApp, "_applicationWantsGESEvents", a3, a4) & 1) == 0)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &_shouldReceiveTouch_withEvent____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v7 = *(NSObject **)(CategoryCachedImpl + 8);
      BOOL v5 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Disabling GES Gate because the application is not currently set to receive GES events", v9, 2u);
    }
    goto LABEL_5;
  }
  if (!a3)
  {
LABEL_5:
    LOBYTE(v5) = 0;
    return v5;
  }
  return (*((unsigned __int16 *)a3 + 118) >> 13) & 1;
}

- (_UIGESGateGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIGESGateGestureRecognizer;
  uint64_t v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  BOOL v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 _setAcceptsFailureRequiments:0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesBegan:1];
    [(UIGestureRecognizer *)v5 setName:@"com.apple.UIKit.GESGate"];
  }
  return v5;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (!-[_UIGESGateGestureRecognizer _validateTouchesFailingIfNeeded:]((BOOL)self, a3))
  {
    BOOL v5 = [(UIGestureRecognizer *)self _allActiveTouches];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      [(UIGestureRecognizer *)self setState:3];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &touchesEnded_withEvent____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Closing GES Gate because all touches ended with phase (kIOHIDEventPhaseMayBegin)", v9, 2u);
        }
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (!-[_UIGESGateGestureRecognizer _validateTouchesFailingIfNeeded:]((BOOL)self, a3))
  {
    BOOL v5 = [(UIGestureRecognizer *)self _allActiveTouches];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      [(UIGestureRecognizer *)self setState:3];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Gesture", &touchesCancelled_withEvent____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Closing GES Gate because all touches cancelled with phase (kIOHIDEventPhaseMayBegin)", v9, 2u);
        }
      }
    }
  }
}

@end