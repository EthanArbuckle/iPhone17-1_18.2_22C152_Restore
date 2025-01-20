@interface _UIFocusEventDelivery
- (BOOL)_movementParticipatesInCooldown:(int64_t)a3;
- (BOOL)shouldDeliverFocusKeyboardEvent:(id)a3 toResponder:(id)a4;
- (BOOL)shouldSkipKeyCommand:(id)a3 whenDeliveringFocusKeyboardEvent:(id)a4 toResponder:(id)a5;
- (NSMutableSet)keyboardPressEventForwardingMap;
- (UIFocusSystem)focusSystem;
- (_UIFocusEventDelivery)init;
- (_UIFocusEventDelivery)initWithFocusSystem:(id)a3;
- (void)willDeliverFocusKeyboardEvent:(id)a3;
@end

@implementation _UIFocusEventDelivery

- (_UIFocusEventDelivery)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Unable to initialize %@ by calling %@.", v7, v8 format];

  return 0;
}

- (_UIFocusEventDelivery)initWithFocusSystem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusEventDelivery;
  uint64_t v5 = [(_UIFocusEventDelivery *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusSystem, v4);
    uint64_t v7 = objc_opt_new();
    keyboardPressEventForwardingMap = v6->_keyboardPressEventForwardingMap;
    v6->_keyboardPressEventForwardingMap = (NSMutableSet *)v7;
  }
  return v6;
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (!WeakRetained)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIFocusEventDelivery.m" lineNumber:54 description:@"Unable to access focus system. This probably means that the focus system has been deallocated but its event delivery object is still around. This should never happen and is a UIKit bug."];
  }
  return (UIFocusSystem *)WeakRetained;
}

- (BOOL)_movementParticipatesInCooldown:(int64_t)a3
{
  return ((unint64_t)a3 > 5) | (0xEu >> a3) & 1;
}

- (BOOL)shouldDeliverFocusKeyboardEvent:(id)a3 toResponder:(id)a4
{
  id v6 = a4;
  char v16 = 0;
  id v7 = a3;
  uint64_t v8 = _UIFocusResponderMovementForPhysicalKeyboardEvent(v7, &v16);
  v9 = [(_UIFocusEventDelivery *)self keyboardPressEventForwardingMap];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    v12 = [(_UIFocusEventDelivery *)self focusSystem];
    v13 = [v12 behavior];

    uint64_t v14 = [v13 deliverKeyEventsToFocusEngine];
    if (v14 == 2)
    {
      if (self->_lastDeliveredMovement != v8
        || ![(_UIFocusEventDelivery *)self _movementParticipatesInCooldown:v8]
        || CFAbsoluteTimeGetCurrent() - self->_lastDeliveredTimestamp >= 0.5)
      {
        if (!v8)
        {
LABEL_12:
          char v11 = 0;
          goto LABEL_13;
        }
        if (!v16)
        {
          char v11 = [v6 _shouldForwardMovementToFocusEngine:v8];
          goto LABEL_13;
        }
      }
    }
    else if (v14 != 1)
    {
      goto LABEL_12;
    }
    char v11 = 1;
LABEL_13:

    goto LABEL_14;
  }
  char v11 = 1;
LABEL_14:

  return v11;
}

- (BOOL)shouldSkipKeyCommand:(id)a3 whenDeliveringFocusKeyboardEvent:(id)a4 toResponder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _UIFocusResponderMovementForPhysicalKeyboardEvent(a4, 0);
  char v11 = [(_UIFocusEventDelivery *)self focusSystem];
  v12 = [v11 behavior];

  uint64_t v13 = [v12 skipKeyCommandsForKeyEvents];
  if (v13 == 1)
  {
    LOBYTE(v10) = 1;
  }
  else if (v13 == 2)
  {
    if (v10) {
      LOBYTE(v10) = [v9 _shouldSkipKeyCommand:v8 forMovement:v10];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)willDeliverFocusKeyboardEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_lastDeliveredTimestamp = CFAbsoluteTimeGetCurrent();
  self->_lastDeliveredMovement = _UIFocusResponderMovementForPhysicalKeyboardEvent(v4, 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(v4, "allPresses", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (![v10 phase] || objc_msgSend(v10, "phase") == 1 || objc_msgSend(v10, "phase") == 2)
        {

          [(NSMutableSet *)self->_keyboardPressEventForwardingMap addObject:v4];
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  [(NSMutableSet *)self->_keyboardPressEventForwardingMap removeObject:v4];
LABEL_13:
}

- (NSMutableSet)keyboardPressEventForwardingMap
{
  return self->_keyboardPressEventForwardingMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPressEventForwardingMap, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end