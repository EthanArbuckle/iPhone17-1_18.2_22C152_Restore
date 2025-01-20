@interface UIEvent
+ (unint64_t)_inputPrecisionForTouches:(id)a3;
- (BKSHIDEventAuthenticationMessage)_authenticationMessage;
- (BOOL)_consumeBeforeDeliveryToGestureRecognizers:(id)a3 inWindow:(id)a4;
- (BOOL)_isInteractionBehaviorInactive;
- (BOOL)_isKeyDown;
- (BOOL)_isPhysicalKeyEvent;
- (BOOL)_isTouchRoutingPolicyBased;
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3;
- (CGPoint)_digitizerLocation;
- (NSArray)coalescedTouchesForTouch:(UITouch *)touch;
- (NSArray)predictedTouchesForTouch:(UITouch *)touch;
- (NSSet)_allWindows;
- (NSSet)allTouches;
- (NSSet)touchesForGestureRecognizer:(UIGestureRecognizer *)gesture;
- (NSSet)touchesForView:(UIView *)view;
- (NSSet)touchesForWindow:(UIWindow *)window;
- (NSTimeInterval)timestamp;
- (UIEventSubtype)subtype;
- (UIEventType)type;
- (__GSEvent)_gsEvent;
- (__IOHIDEvent)_hidEvent;
- (double)_initialTouchTimestamp;
- (double)_wheelVelocity;
- (id)_allGestureRecognizers;
- (id)_cloneEvent;
- (id)_componentsForGestureRecognizer:(id)a3;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_init;
- (id)_initWithEnvironment:(id)a3;
- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4;
- (id)_modifiedInput;
- (id)_screen;
- (id)_touchesForGestureRecognizer:(id)a3;
- (id)_triggeringPhysicalButton;
- (id)_unmodifiedInput;
- (int)_shakeState;
- (int64_t)_buttonMask;
- (int64_t)_modifierFlags;
- (int64_t)_moveDirection;
- (int64_t)_trackpadFingerDownCount;
- (unint64_t)_clickCount;
- (unint64_t)_currentPointerEventSource;
- (unint64_t)_focusHeading;
- (unint64_t)_inputPrecision;
- (void)_addEventObserver:(uint64_t)a1;
- (void)_cleanupAfterDispatch;
- (void)_removeGestureRecognizer:(void *)a1;
- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3;
- (void)_setGSEvent:(__GSEvent *)a3;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
- (void)_setTimestamp:(double)a3;
- (void)dealloc;
@end

@implementation UIEvent

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (int64_t)_buttonMask
{
  return self->_buttonMask;
}

- (int64_t)_modifierFlags
{
  if (self->_hasValidModifiers) {
    return self->_mzModifierFlags;
  }
  [(id)UIApp _hardwareKeyboard:0];
  unsigned int LiveModifierState = GSKeyboardGetLiveModifierState();
  if ((LiveModifierState & 0x480000) != 0) {
    unint64_t v4 = ((unint64_t)((LiveModifierState & 0x1010000) != 0) << 20) | 0x80000;
  }
  else {
    unint64_t v4 = (unint64_t)((LiveModifierState & 0x1010000) != 0) << 20;
  }
  if ((LiveModifierState & 0x900000) != 0) {
    v4 |= 0x40000uLL;
  }
  if ((LiveModifierState & 0x220000) != 0) {
    v4 |= 0x20000uLL;
  }
  return v4 | (LiveModifierState >> 3) & 0x800000 | (LiveModifierState >> 2) & 0x10000;
}

+ (unint64_t)_inputPrecisionForTouches:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        if (v8)
        {
          if (v10) {
            unint64_t v6 = *(void *)(v10 + 48);
          }
          else {
            unint64_t v6 = 0;
          }
        }
        else
        {
          if (!v6) {
            goto LABEL_19;
          }
          if (v10) {
            uint64_t v10 = *(void *)(v10 + 48);
          }
          if (v6 != v10) {
            goto LABEL_18;
          }
        }
        char v8 = 0;
        ++v9;
      }
      while (v5 != v9);
      uint64_t v11 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v11;
      char v8 = 0;
    }
    while (v11);
  }
  else
  {
LABEL_18:
    unint64_t v6 = 0;
  }
LABEL_19:

  return v6;
}

- (__IOHIDEvent)_hidEvent
{
  return self->_hidEvent;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  if (self->_hidEvent == a3) {
    return;
  }
  cachedScreen = self->_cachedScreen;
  self->_cachedScreen = 0;

  hidEvent = self->_hidEvent;
  if (hidEvent) {
    CFRelease(hidEvent);
  }
  BOOL hasValidModifiers = self->_hasValidModifiers;
  self->_BOOL hasValidModifiers = 0;
  self->_isInteractionBehaviorInactive = 0;
  if (!a3)
  {
    self->_hidEvent = 0;
    goto LABEL_14;
  }
  [(UIEvent *)self _setGSEvent:0];
  self->_hidEvent = (__IOHIDEvent *)CFRetain(a3);
  unint64_t TimeStamp = IOHIDEventGetTimeStamp();
  [(UIEvent *)self _setTimestamp:_UIMediaTimeForMachTime(TimeStamp)];
  uint64_t v9 = _UIEventHIDGetDescendantPointerEvent((uint64_t)a3);
  if (v9)
  {
    self->_mzClickCount = 0;
    self->_buttonMask = _UIEventHIDButtonMaskFromPointerEventAndChildren(v9);
    uint64_t v10 = BKSHIDEventGetPointerAttributes();
    uint64_t v11 = v10;
    if (v10) {
      uint64_t v10 = (void *)[v10 fingerDownCount];
    }
    self->_trackpadFingerDownCount = (int64_t)v10;
    self->_lastPointerSenderID = IOHIDEventGetSenderID();
    if (!v11) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (IOHIDEventGetType() == 11)
  {
    uint64_t v11 = BKSHIDEventGetDigitizerAttributes();
    if (v11)
    {
LABEL_13:
      self->_BOOL hasValidModifiers = 1;
      self->_mzModifierFlags = _UIEventGetHIDModifierFlags((uint64_t)a3, v11);
      self->_isInteractionBehaviorInactive = [v11 sceneTouchBehavior] == 1;
    }
  }
LABEL_14:
  if (hasValidModifiers && !self->_hasValidModifiers)
  {
    self->_trackpadFingerDownCount = 0;
    self->_mzClickCount = 0;
    self->_buttonMask = 0;
    self->_mzModifierFlags = 0;
  }
}

- (void)_setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)_setGSEvent:(__GSEvent *)a3
{
  gsEvent = self->_gsEvent;
  if (gsEvent) {
    CFRelease(gsEvent);
  }
  if (a3)
  {
    [(UIEvent *)self _setHIDEvent:0];
    self->_gsEvent = (__GSEvent *)CFRetain(a3);
    GSEventGetTimestamp();
    -[UIEvent _setTimestamp:](self, "_setTimestamp:");
  }
  else
  {
    self->_gsEvent = 0;
  }
}

- (void)_cleanupAfterDispatch
{
}

- (UIEventSubtype)subtype
{
  return 0;
}

- (BOOL)_isTouchRoutingPolicyBased
{
  return 0;
}

- (BOOL)_isPhysicalKeyEvent
{
  return 0;
}

- (BOOL)_consumeBeforeDeliveryToGestureRecognizers:(id)a3 inWindow:(id)a4
{
  return 0;
}

- (__GSEvent)_gsEvent
{
  return self->_gsEvent;
}

- (void)dealloc
{
  gsEvent = self->_gsEvent;
  if (gsEvent) {
    CFRelease(gsEvent);
  }
  hidEvent = self->_hidEvent;
  if (hidEvent) {
    CFRelease(hidEvent);
  }
  v5.receiver = self;
  v5.super_class = (Class)UIEvent;
  [(UIEvent *)&v5 dealloc];
}

- (id)_initWithEnvironment:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIEvent *)self _init];
  unint64_t v6 = v5;
  if (v5) {
    objc_storeWeak(v5 + 12, v4);
  }

  return v6;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UIEvent;
  return [(UIEvent *)&v3 init];
}

- (void)_addEventObserver:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
      unint64_t v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)_cloneEvent
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  gsEvent = self->_gsEvent;
  if (gsEvent) {
    gsEvent = CFRetain(gsEvent);
  }
  *((void *)v3 + 1) = gsEvent;
  hidEvent = self->_hidEvent;
  if (hidEvent) {
    hidEvent = CFRetain(hidEvent);
  }
  *((void *)v3 + 2) = hidEvent;
  [(UIEvent *)self timestamp];
  objc_msgSend(v3, "_setTimestamp:");
  objc_storeStrong((id *)v3 + 7, self->_cachedScreen);
  *((unsigned char *)v3 + 24) = self->_hasValidModifiers;
  *((void *)v3 + 4) = self->_mzModifierFlags;
  *((void *)v3 + 5) = self->_mzClickCount;
  *((void *)v3 + 6) = self->_buttonMask;
  *((void *)v3 + 10) = self->_lastPointerSenderID;
  *((void *)v3 + 13) = self->_trackpadFingerDownCount;
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_eventEnvironment);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_cachedScreen, 0);
}

- (UIEventType)type
{
  return -1;
}

- (NSSet)allTouches
{
  return 0;
}

- (NSSet)touchesForWindow:(UIWindow *)window
{
  return 0;
}

- (NSSet)touchesForView:(UIView *)view
{
  return 0;
}

- (NSSet)touchesForGestureRecognizer:(UIGestureRecognizer *)gesture
{
  return 0;
}

- (NSArray)coalescedTouchesForTouch:(UITouch *)touch
{
  return 0;
}

- (NSArray)predictedTouchesForTouch:(UITouch *)touch
{
  return 0;
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{
  return 0;
}

- (id)_touchesForGestureRecognizer:(id)a3
{
  return 0;
}

- (int)_shakeState
{
  return -1;
}

- (int64_t)_moveDirection
{
  return 0;
}

- (unint64_t)_focusHeading
{
  return 0;
}

- (id)_triggeringPhysicalButton
{
  if (os_variant_has_internal_diagnostics())
  {
    id v4 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF UIKIT: Using deprecated _triggeringPhysicalButton: instead of inspecting presses and their phases directly. This will become an assert in future builds.", buf, 2u);
    }
  }
  else
  {
    v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_triggeringPhysicalButton___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "BUG IN CLIENT OF UIKIT: Using deprecated _triggeringPhysicalButton: instead of inspecting presses and their phases directly. This will become an assert in future builds.", v5, 2u);
    }
  }
  return 0;
}

- (id)_modifiedInput
{
  return 0;
}

- (id)_unmodifiedInput
{
  return 0;
}

- (unint64_t)_clickCount
{
  return self->_mzClickCount;
}

- (unint64_t)_currentPointerEventSource
{
  return 0;
}

- (BOOL)_isKeyDown
{
  return 0;
}

- (CGPoint)_digitizerLocation
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)_isInteractionBehaviorInactive
{
  return self->_isInteractionBehaviorInactive;
}

- (id)_screen
{
  p_cachedScreen = &self->_cachedScreen;
  id v4 = self->_cachedScreen;
  if (!v4)
  {
    _UIEventHIDUIScreenForHIDEvent((uint64_t)[(UIEvent *)self _hidEvent]);
    id v4 = (UIScreen *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      id v4 = +[UIScreen mainScreen];
    }
    objc_storeStrong((id *)p_cachedScreen, v4);
  }
  return v4;
}

- (NSSet)_allWindows
{
  double v2 = (void *)UIApp;
  double v3 = [(UIEvent *)self _screen];
  id v4 = [v2 _keyWindowForScreen:v3];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSSet *)v5;
}

- (BOOL)_shouldSkipEventDeliveryWithIgnoreInteractionEvents:(BOOL)a3
{
  return a3;
}

- (double)_wheelVelocity
{
  return 0.0;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  return 0;
}

- (id)_allGestureRecognizers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v2 = objc_opt_new();
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v3 = objc_msgSend(a1, "_allWindows", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = [a1 _gestureRecognizersForWindow:*(void *)(*((void *)&v10 + 1) + 8 * i)];
          if (v2) {
            [v2 unionSet:v8];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    double v2 = 0;
  }
  return v2;
}

- (id)_componentsForGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  return 0;
}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = a3;
  uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v45;
    v33 = self;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v4;
        v35 = *(void **)(*((void *)&v44 + 1) + 8 * v4);
        uint64_t v5 = -[UIEvent _componentsForGestureRecognizer:](self, "_componentsForGestureRecognizer:");
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v55 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          char v8 = 0;
          uint64_t v9 = *(void *)v49;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v49 != v9) {
                objc_enumerationMutation(v5);
              }
              long long v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              long long v12 = [v11 _eventComponentPhase];
              uint64_t v13 = [v12 value];

              if (v13 <= 2)
              {
                if (!v8) {
                  char v8 = objc_opt_new();
                }
                [v8 addObject:v11];
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v55 count:16];
          }
          while (v7);
        }
        else
        {
          char v8 = 0;
        }
        if ([v8 count])
        {
          long long v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
          long long v40 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v15 = v8;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v53 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v41;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v41 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = *(void **)(*((void *)&v40 + 1) + 8 * j);
                v21 = [v20 _eventComponentPhase];
                [v14 setObject:v21 forKey:v20];

                v22 = [v20 _eventComponentPhaseForValue:4];
                [v20 _setEventComponentPhase:v22];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v53 count:16];
            }
            while (v17);
          }

          [v35 _componentsCancelled:v15 withEvent:v33];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id v23 = v15;
          uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v52 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v37;
            do
            {
              for (uint64_t k = 0; k != v25; ++k)
              {
                if (*(void *)v37 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = *(void **)(*((void *)&v36 + 1) + 8 * k);
                v29 = [v14 objectForKey:v28];
                [v28 _setEventComponentPhase:v29];
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v36 objects:v52 count:16];
            }
            while (v25);
          }

          self = v33;
        }
        [(UIEvent *)self _removeGestureRecognizer:v35 fromComponents:v5];

        uint64_t v4 = v34 + 1;
      }
      while (v34 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v32);
  }
}

- (void)_removeGestureRecognizer:(void *)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [a1 _componentsForGestureRecognizer:v3];
    [a1 _removeGestureRecognizer:v3 fromComponents:v4];
  }
}

- (unint64_t)_inputPrecision
{
  return 0;
}

- (BKSHIDEventAuthenticationMessage)_authenticationMessage
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(UIEvent *)self _hidEvent]) {
    goto LABEL_16;
  }
  if (IOHIDEventGetType() == 11 && !IOHIDEventGetEvent())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = [(UIEvent *)self allTouches];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
LABEL_6:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        if (v8)
        {
          id v9 = *(id *)(v8 + 384);
          if (v9) {
            goto LABEL_18;
          }
        }
        if (v5 == ++v7)
        {
          uint64_t v10 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
          uint64_t v5 = v10;
          if (v10) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

LABEL_16:
    long long v11 = 0;
    goto LABEL_19;
  }
  id v3 = BKSHIDEventGetBaseAttributes();
  id v9 = [v3 authenticationMessage];
LABEL_18:
  long long v11 = v9;

LABEL_19:
  return (BKSHIDEventAuthenticationMessage *)v11;
}

- (int64_t)_trackpadFingerDownCount
{
  return self->_trackpadFingerDownCount;
}

- (double)_initialTouchTimestamp
{
  return self->__initialTouchTimestamp;
}

@end