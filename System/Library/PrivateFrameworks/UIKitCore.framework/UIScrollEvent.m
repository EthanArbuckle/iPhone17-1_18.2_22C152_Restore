@interface UIScrollEvent
- (BOOL)_consumeBeforeDeliveryToGestureRecognizers:(id)a3 inWindow:(id)a4;
- (BOOL)_hasDeliveredTerminalPhase;
- (BOOL)_isHighResolution;
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (BOOL)_shouldSendEvent;
- (BOOL)directionInvertedFromDevice;
- (CGPoint)_convertPointFromSceneReferenceSpace:(CGPoint)a3 toView:(id)a4;
- (CGPoint)_convertPointToSceneReferenceSpace:(CGPoint)a3 fromView:(id)a4;
- (CGPoint)locationInView:(id)a3;
- (CGVector)_adjustedAcceleratedDeltaInView:(id)a3;
- (CGVector)_adjustedDeltaForPanWithAcceleration:(BOOL)a3 honoringScrollDirectionPreference:(BOOL)a4;
- (CGVector)_convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:(CGVector)a3;
- (CGVector)_stifledDelta;
- (CGVector)acceleratedDelta;
- (CGVector)nonAcceleratedDelta;
- (double)_beganScrollTimestamp;
- (id)_allWindows;
- (id)_cloneEvent;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_init;
- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4;
- (id)_windowServerHitTestWindow;
- (int64_t)subtype;
- (int64_t)type;
- (unint64_t)_scrollDeviceCategory;
- (unint64_t)_scrollType;
- (unint64_t)phase;
- (void)_beginStiflingDeltas;
- (void)_cleanupAfterDispatch;
- (void)_endStiflingDeltas;
- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4;
- (void)_removeGestureRecognizersFromWindows;
- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
- (void)_simulateMomentumWithDelta:(CGVector)a3 inView:(id)a4;
- (void)_wasDeliveredToGestureRecognizers;
@end

@implementation UIScrollEvent

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)UIScrollEvent;
  id v2 = [(UIEvent *)&v5 _init];
  v3 = v2;
  if (v2) {
    _UIScrollEventCommonInit(v2);
  }
  return v3;
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIScrollEvent;
  id v4 = [(UIEvent *)&v7 _init];
  objc_super v5 = v4;
  if (v4) {
    _UIScrollEventCommonInit(v4);
  }
  return v5;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)UIScrollEvent;
  -[UIEvent _setHIDEvent:](&v17, sel__setHIDEvent_);
  if ([(UIEvent *)self _hidEvent])
  {
    v6 = _UIEventHIDGetChildPointerEvent((uint64_t)a3);
    if (!v6)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"UIScrollEvent.m", 186, @"Invalid event structure for %@: missing child pointer HID event: %@", objc_opt_class(), a3 object file lineNumber description];
    }
    BKSHIDEventGetPointerAttributes();
    objc_super v7 = (BKSHIDEventPointerAttributes *)objc_claimAutoreleasedReturnValue();
    pointerAttributes = self->_pointerAttributes;
    self->_pointerAttributes = v7;

    v9 = _UIEventHIDUIWindowForHIDEvent();
    if (v9)
    {
      objc_msgSend(v9, "_convertPointToSceneReferenceSpace:", _UIEventHIDConvertPointerLocation3DToWindow((uint64_t)v6, v9));
      self->_sceneReferenceLocation.x = v10;
      self->_sceneReferenceLocation.y = v11;
    }
    else
    {
      self->_sceneReferenceLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (a3) {
        goto LABEL_10;
      }
      v15 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "unable to determine scrollEvent phase because the _hidEvent is nil", buf, 2u);
      }
    }
    else
    {
      if (a3)
      {
LABEL_10:
        int Phase = IOHIDEventGetPhase();
        switch(Phase)
        {
          case 1:
            self->_phase = 2;
            if (self->_lastReceivedPhase == 3 && ![(UIScrollEvent *)self _scrollType]) {
              self->_phase = 3;
            }
            goto LABEL_27;
          case 2:
            unint64_t v13 = 3;
            goto LABEL_26;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_25;
          case 4:
            unint64_t v13 = 4;
            goto LABEL_26;
          case 8:
            unint64_t v13 = 5;
            goto LABEL_26;
          default:
            if (Phase != 128) {
              goto LABEL_25;
            }
            unint64_t v13 = 1;
            goto LABEL_26;
        }
      }
      v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_scrollPhaseForHIDEvent___s_category) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "unable to determine scrollEvent phase because the _hidEvent is nil", buf, 2u);
      }
    }
LABEL_25:
    unint64_t v13 = 0;
LABEL_26:
    self->_phase = v13;
  }
  else
  {
    self->_lastReceivedint Phase = self->_phase;
    self->_phase = 0;
    self->_lastDeliveredint Phase = 0;
    v9 = self->_pointerAttributes;
    self->_pointerAttributes = 0;
  }
LABEL_27:
}

- (BOOL)_shouldSendEvent
{
  unint64_t phase = self->_phase;
  return (phase & 0xFFFFFFFFFFFFFFFELL) != 4 || phase != self->_lastReceivedPhase;
}

- (int64_t)type
{
  return 10;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_cloneEvent
{
  id v2 = self;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)UIScrollEvent;
  id v3 = [(UIEvent *)&v23 _cloneEvent];
  *((void *)v3 + 28) = v2->_phase;
  *((_OWORD *)v3 + 8) = v2->_sceneReferenceLocation;
  *((void *)v3 + 18) = v2->_lastDeliveredPhase;
  *((void *)v3 + 19) = v2->_lastReceivedPhase;
  objc_storeStrong((id *)v3 + 20, v2->_pointerAttributes);
  if (v2->_gestureRecognizersByWindow)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    objc_super v5 = (void *)*((void *)v3 + 15);
    *((void *)v3 + 15) = v4;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v6 = v2->_gestureRecognizersByWindow;
    uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      obj = v6;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v12 = [(NSMapTable *)v2->_gestureRecognizersByWindow objectForKey:v11];
          unint64_t v13 = v2;
          v14 = (void *)*((void *)v3 + 15);
          v15 = (void *)[v12 mutableCopy];
          v16 = v14;
          id v2 = v13;
          [v16 setObject:v15 forKey:v11];
        }
        v6 = obj;
        uint64_t v8 = [(NSMapTable *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v6 = (NSMapTable *)*((void *)v3 + 15);
    *((void *)v3 + 15) = 0;
  }

  return v3;
}

- (void)_cleanupAfterDispatch
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self->_isDoingAsyncDelivery = 0;
  if ((self->_phase & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    asyncDeliveryTarget = self->_asyncDeliveryTarget;
    self->_asyncDeliveryTarget = 0;

    asyncDeliveryGesture = self->_asyncDeliveryGesture;
    self->_asyncDeliveryGesture = 0;
  }
  if (self->_isCloneForAsyncDelivery)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v5 = NSAllMapTableValues(self->_gestureRecognizersByWindow);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          CGFloat v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * v15);
                if (v16) {
                  [*(id *)(v16 + 176) removeObject:self];
                }
                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v13);
          }

          ++v9;
        }
        while (v9 != v7);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UIScrollEvent;
  [(UIEvent *)&v17 _cleanupAfterDispatch];
}

- (CGPoint)_convertPointFromSceneReferenceSpace:(CGPoint)a3 toView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    CGFloat v10 = [(UIScrollEvent *)self _allWindows];
    id v9 = [v10 anyObject];
  }
  id v11 = [v9 _window];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
    double x = v13;
    double y = v14;
  }
  objc_msgSend(v9, "convertPoint:fromView:", 0, x, y);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (CGPoint)_convertPointToSceneReferenceSpace:(CGPoint)a3 fromView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    CGFloat v10 = [(UIScrollEvent *)self _allWindows];
    id v9 = [v10 anyObject];
  }
  id v11 = [v9 _window];
  objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
  double v14 = v12;
  double v15 = v13;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointToSceneReferenceSpace:", v12, v13);
    double v14 = v16;
    double v15 = v17;
  }

  double v18 = v14;
  double v19 = v15;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (unint64_t)_scrollType
{
  id v2 = self->_pointerAttributes;
  id v3 = v2;
  unint64_t v6 = 1;
  if (v2)
  {
    if ([(BKSHIDEventPointerAttributes *)v2 source] != 12
      && [(BKSHIDEventPointerAttributes *)v3 source] == 11)
    {
      [(BKSHIDEventPointerAttributes *)v3 digitizerSurfaceWidth];
      if (v4 <= 0.0
        || ([(BKSHIDEventPointerAttributes *)v3 digitizerSurfaceHeight], v5 <= 0.0))
      {
        unint64_t v6 = 0;
      }
    }
  }

  return v6;
}

- (BOOL)_isHighResolution
{
  pointerAttributes = self->_pointerAttributes;
  if (pointerAttributes) {
    LODWORD(pointerAttributes) = ([(BKSHIDEventPointerAttributes *)pointerAttributes options] >> 2) & 1;
  }
  return (char)pointerAttributes;
}

- (unint64_t)_scrollDeviceCategory
{
  id v3 = self->_pointerAttributes;
  double v4 = v3;
  if (!v3) {
    goto LABEL_15;
  }
  if ([(BKSHIDEventPointerAttributes *)v3 source] != 12)
  {
    if ([(BKSHIDEventPointerAttributes *)v4 source] == 11)
    {
      unint64_t v8 = [(UIScrollEvent *)self _scrollType];
      if (v8 == 1)
      {
        unint64_t v7 = 3;
        goto LABEL_16;
      }
      if (!v8)
      {
        if ([(UIScrollEvent *)self _isHighResolution]) {
          unint64_t v7 = 4;
        }
        else {
          unint64_t v7 = 5;
        }
        goto LABEL_16;
      }
    }
LABEL_15:
    unint64_t v7 = 0;
    goto LABEL_16;
  }
  [(BKSHIDEventPointerAttributes *)v4 digitizerSurfaceHeight];
  if (v5 != 3388211.0 && v5 > 3198156.0) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = 1;
  }
LABEL_16:

  return v7;
}

- (double)_beganScrollTimestamp
{
  [(BKSHIDEventPointerAttributes *)self->_pointerAttributes initialTouchTimestamp];
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  -[UIScrollEvent _convertPointFromSceneReferenceSpace:toView:](self, "_convertPointFromSceneReferenceSpace:toView:", a3, self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGVector)_convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  char v6 = [(BKSHIDEventPointerAttributes *)self->_pointerAttributes options];
  if ((v6 & 0x40) != 0)
  {
    char v7 = v6;
    unint64_t v8 = _UIEventHIDGetInterfaceOrientationForEvent((uint64_t)self->super._hidEvent);
    if (v8 == 3) {
      double v9 = -dx;
    }
    else {
      double v9 = dy;
    }
    if (v8 == 3) {
      double v10 = dy;
    }
    else {
      double v10 = dx;
    }
    if (v8 == 4)
    {
      double v9 = dx;
      double v10 = -dy;
    }
    if (v8 >= 2) {
      ddouble y = v9;
    }
    else {
      ddouble y = -dy;
    }
    if (v8 >= 2) {
      ddouble x = v10;
    }
    else {
      ddouble x = -dx;
    }
    if ((v7 & 0x20) == 0)
    {
      ddouble x = -dx;
      ddouble y = -dy;
    }
  }
  double v11 = dx;
  double v12 = dy;
  result.ddouble y = v12;
  result.ddouble x = v11;
  return result;
}

- (CGVector)acceleratedDelta
{
  ddouble x = 0.0;
  ddouble y = 0.0;
  if (!self->_isStiflingDeltas)
  {
    if (self->_hasSimulatedMomentumDelta)
    {
      ddouble x = self->_simulatedMomentumDelta.dx;
      ddouble y = self->_simulatedMomentumDelta.dy;
    }
    else
    {
      double v5 = [(UIEvent *)self _hidEvent];
      if (_UIEventHIDGetChildScrollEvent((uint64_t)v5))
      {
        double ChildScrollVector = _UIEventGetChildScrollVector((uint64_t)v5);
      }
      else if (v5)
      {
        IOHIDEventGetFloatValue();
        double ChildScrollVector = v8;
        IOHIDEventGetFloatValue();
        double v6 = v9;
      }
      else
      {
        double v6 = 0.0;
        double ChildScrollVector = 0.0;
      }
      -[UIScrollEvent _convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:](self, "_convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:", ChildScrollVector, v6);
    }
  }
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (CGVector)nonAcceleratedDelta
{
  ddouble x = 0.0;
  ddouble y = 0.0;
  if (!self->_isStiflingDeltas)
  {
    if (self->_hasSimulatedMomentumDelta)
    {
      ddouble x = self->_simulatedMomentumDelta.dx;
      ddouble y = self->_simulatedMomentumDelta.dy;
    }
    else
    {
      if ([(UIEvent *)self _hidEvent])
      {
        IOHIDEventGetFloatValue();
        double v6 = v5;
        IOHIDEventGetFloatValue();
        double v8 = v7;
      }
      else
      {
        double v8 = 0.0;
        double v6 = 0.0;
      }
      -[UIScrollEvent _convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:](self, "_convertDeltaFromHIDDeviceSpaceToSceneReferenceSpaceIfNeeded:", v6, v8);
    }
  }
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (CGVector)_adjustedDeltaForPanWithAcceleration:(BOOL)a3 honoringScrollDirectionPreference:(BOOL)a4
{
  if (a3) {
    [(UIScrollEvent *)self acceleratedDelta];
  }
  else {
    [(UIScrollEvent *)self nonAcceleratedDelta];
  }
  v26.i64[1] = v8;
  int8x16_t v29 = v6;
  if ([(UIScrollEvent *)self _scrollType])
  {
    if (a4) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v15 = _UIInternalPreferencesRevisionVar;
  v9.i64[0] = 3.0;
  int8x16_t v16 = v29;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    int v25 = _UIInternalPreference_DiscreteScrollMinimumDelta;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_DiscreteScrollMinimumDelta)
    {
      while (v15 >= v25)
      {
        _UIInternalPreferenceSync(v15, &_UIInternalPreference_DiscreteScrollMinimumDelta, @"DiscreteScrollMinimumDelta", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        int v25 = _UIInternalPreference_DiscreteScrollMinimumDelta;
        if (v15 == _UIInternalPreference_DiscreteScrollMinimumDelta)
        {
          int8x16_t v16 = v29;
          v9.i64[0] = 3.0;
          goto LABEL_16;
        }
      }
      v9.i64[0] = qword_1E8FD5400;
      int8x16_t v16 = v29;
    }
  }
LABEL_16:
  BOOL v17 = fabs(*(double *)v16.i64) >= *(double *)v9.i64 || *(double *)v16.i64 == 0.0;
  v18.f64[0] = NAN;
  v18.f64[1] = NAN;
  int8x16_t v19 = (int8x16_t)vnegq_f64(v18);
  *(void *)&double v20 = vbslq_s8(v19, v9, v16).u64[0];
  if (!v17) {
    *(double *)v16.i64 = v20;
  }
  v29.i64[0] = v16.i64[0];
  double v21 = *(double *)v26.i64;
  BOOL v22 = fabs(*(double *)v26.i64) >= *(double *)v9.i64 || *(double *)v26.i64 == 0.0;
  unint64_t v23 = vbslq_s8(v19, v9, v26).u64[0];
  if (!v22) {
    double v21 = *(double *)&v23;
  }
  *(double *)v26.i64 = v21;
  if (!a4)
  {
LABEL_6:
    BOOL v10 = [(UIScrollEvent *)self directionInvertedFromDevice];
    double v12 = v27;
    double v11 = *(double *)v29.i64;
    if (!v10)
    {
      double v12 = -v27;
      double v11 = -*(double *)v29.i64;
    }
    *(double *)v26.i64 = v12;
    *(double *)v29.i64 = v11;
  }
LABEL_9:
  if (([(UIEvent *)self _modifierFlags] & 0x20000) != 0
    && ![(UIScrollEvent *)self _scrollType])
  {
    BOOL v24 = [(UIScrollEvent *)self _isHighResolution];
    double v14 = v28;
    double v13 = *(double *)v29.i64;
    if (!v24)
    {
      double v14 = -*(double *)v29.i64;
      double v13 = -v28;
    }
  }
  else
  {
    double v14 = v28;
    double v13 = *(double *)v29.i64;
  }
  result.ddouble y = v14;
  result.ddouble x = v13;
  return result;
}

- (CGVector)_adjustedAcceleratedDeltaInView:(id)a3
{
  id v4 = a3;
  [(UIScrollEvent *)self _adjustedDeltaForPanWithAcceleration:1 honoringScrollDirectionPreference:1];
  double v6 = v5;
  double v8 = v7;
  -[UIScrollEvent _convertPointFromSceneReferenceSpace:toView:](self, "_convertPointFromSceneReferenceSpace:toView:", v4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v10 = v9;
  double v12 = v11;
  -[UIScrollEvent _convertPointFromSceneReferenceSpace:toView:](self, "_convertPointFromSceneReferenceSpace:toView:", v4, v6, v8);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14 - v10;
  double v18 = v16 - v12;
  result.ddouble y = v18;
  result.ddouble x = v17;
  return result;
}

- (BOOL)directionInvertedFromDevice
{
  return 1;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMapTable *)self->_gestureRecognizersByWindow objectForKey:v4];
  double v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if (self->_phase - 1 > 1)
  {
    id v7 = 0;
  }
  else
  {
    double v8 = [(UIScrollEvent *)self _windowServerHitTestWindow];
    _UINonComponentEventHitTestGestureRecognizers(self, v8, (uint64_t)v8, self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
    double v10 = (void *)[v7 mutableCopy];
    [(NSMapTable *)gestureRecognizersByWindow setObject:v10 forKey:v4];
  }
  return v7;
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v6 = NSAllMapTableValues(self->_gestureRecognizersByWindow);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "removeObject:", v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_removeGestureRecognizersFromWindows
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    if (self->_isCloneForAsyncDelivery)
    {
      uint64_t v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v17 = self;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Cloned scroll event for async delivery %p should never get _removeGestureRecognizersFromWindows", buf, 0xCu);
      }
    }
  }
  else if (self->_isCloneForAsyncDelivery)
  {
    uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_removeGestureRecognizersFromWindows___s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = self;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Cloned scroll event for async delivery %p should never get _removeGestureRecognizersFromWindows", buf, 0xCu);
    }
  }
  if (![(UIScrollEvent *)self _hasDeliveredTerminalPhase] && !self->_isDoingAsyncDelivery)
  {
    double v3 = objc_opt_new();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = NSAllMapTableValues(self->_gestureRecognizersByWindow);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v3, "unionSet:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    [(UIScrollEvent *)self _removeGestureRecognizersSendingCancelledEvent:v3];
  }
  [(NSMapTable *)self->_gestureRecognizersByWindow removeAllObjects];
}

- (BOOL)_consumeBeforeDeliveryToGestureRecognizers:(id)a3 inWindow:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_isCloneForAsyncDelivery) {
    goto LABEL_2;
  }
  if (!self->_asyncDeliveryTarget)
  {
    if (self->_phase - 1 > 1) {
      goto LABEL_21;
    }
    uint64_t v25 = 168;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            BOOL v22 = [v21 _asyncDeliveryTargetForScrollEvent:self];
            if (v22)
            {
              asyncDeliveryTarget = self->_asyncDeliveryTarget;
              self->_asyncDeliveryTarget = v22;
              BOOL v24 = v22;

              objc_storeStrong((id *)&self->_asyncDeliveryGesture, v21);
              goto LABEL_20;
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    if (!self->_asyncDeliveryTarget)
    {
LABEL_21:
      objc_msgSend(v6, "count", v25);
LABEL_2:
      BOOL v8 = 0;
      goto LABEL_7;
    }
  }
  uint64_t v9 = [(UIScrollEvent *)self _cloneEvent];
  v9[185] = 1;
  self->_isDoingAsyncDeliverdouble y = 1;
  outstandingSnapshotEventsForAsyncDeliverdouble y = self->_outstandingSnapshotEventsForAsyncDelivery;
  if (!outstandingSnapshotEventsForAsyncDelivery)
  {
    long long v11 = [MEMORY[0x1E4F1CA80] set];
    long long v12 = self->_outstandingSnapshotEventsForAsyncDelivery;
    self->_outstandingSnapshotEventsForAsyncDeliverdouble y = v11;

    outstandingSnapshotEventsForAsyncDeliverdouble y = self->_outstandingSnapshotEventsForAsyncDelivery;
  }
  [(NSMutableSet *)outstandingSnapshotEventsForAsyncDelivery addObject:v9];
  long long v13 = self->_asyncDeliveryTarget;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__UIScrollEvent__consumeBeforeDeliveryToGestureRecognizers_inWindow___block_invoke;
  v26[3] = &unk_1E52DAF68;
  v26[4] = self;
  id v27 = v9;
  id v28 = v7;
  long long v14 = v9;
  [(_UIScrollEventAsyncDeliveryTarget *)v13 _asynchronouslyDeliverScrollEvent:v14 completion:v26];

  BOOL v8 = 1;
LABEL_7:

  return v8;
}

uint64_t __69__UIScrollEvent__consumeBeforeDeliveryToGestureRecognizers_inWindow___block_invoke(uint64_t a1, int a2)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 192) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 192) removeObject:*(void *)(a1 + 40)];
    if ((unint64_t)([*(id *)(a1 + 40) phase] - 1) <= 2 && a2 != 0) {
      [*(id *)(a1 + 40) _beginStiflingDeltas];
    }
    id v6 = [(id)UIApp _gestureEnvironment];
    -[UIGestureEnvironment _updateForEvent:window:]((uint64_t)v6, *(void **)(a1 + 40), *(void *)(a1 + 48));

    if (a2) {
      [*(id *)(a1 + 40) _endStiflingDeltas];
    }
    id v7 = *(void **)(a1 + 40);
    return [v7 _cleanupAfterDispatch];
  }
  return result;
}

- (void)_beginStiflingDeltas
{
  p_stifledDelta = &self->_stifledDelta;
  [(UIScrollEvent *)self acceleratedDelta];
  p_stifledDelta->ddouble x = v4;
  p_stifledDelta->ddouble y = v5;
  self->_isStiflingDeltas = 1;
}

- (void)_endStiflingDeltas
{
  self->_stifledDelta.ddouble x = 0.0;
  self->_stifledDelta.ddouble y = 0.0;
  self->_isStiflingDeltas = 0;
}

- (void)_simulateMomentumWithDelta:(CGVector)a3 inView:(id)a4
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  self->_hasSimulatedMomentumDelta = 1;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v9 = a4;
  -[UIScrollEvent _convertPointToSceneReferenceSpace:fromView:](self, "_convertPointToSceneReferenceSpace:fromView:", v9, v7, v8);
  double v11 = v10;
  double v13 = v12;
  -[UIScrollEvent _convertPointToSceneReferenceSpace:fromView:](self, "_convertPointToSceneReferenceSpace:fromView:", v9, dx, dy);
  double v15 = v14;
  double v17 = v16;

  self->_simulatedMomentumDelta.ddouble x = v15 - v11;
  self->_simulatedMomentumDelta.ddouble y = v17 - v13;
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  return 1;
}

- (void)_wasDeliveredToGestureRecognizers
{
  v3.receiver = self;
  v3.super_class = (Class)UIScrollEvent;
  [(UIEvent *)&v3 _wasDeliveredToGestureRecognizers];
  self->_lastDeliveredint Phase = self->_phase;
}

- (BOOL)_hasDeliveredTerminalPhase
{
  return (self->_lastDeliveredPhase & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (void)_removeGestureRecognizersSendingCancelledEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    double v16 = v19;
    id v17 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v9 && (*(void *)(v9 + 8) & 0x200000000) != 0)
        {
          unint64_t phase = self->_phase;
          self->_unint64_t phase = 5;
          -[UIScrollEvent _sendEventToGestureRecognizer:](self, "_sendEventToGestureRecognizer:", v9, v16);
          self->_unint64_t phase = phase;
        }
        if ((UIGestureRecognizer *)v9 == self->_asyncDeliveryGesture
          && !self->_isCloneForAsyncDelivery
          && ![(UIScrollEvent *)self _hasDeliveredTerminalPhase])
        {
          if ([(NSMutableSet *)self->_outstandingSnapshotEventsForAsyncDelivery count]) {
            [(NSMutableSet *)self->_outstandingSnapshotEventsForAsyncDelivery removeAllObjects];
          }
          if (self->_asyncDeliveryTarget)
          {
            double v11 = [(UIScrollEvent *)self _cloneEvent];
            v11[185] = 1;
            *((void *)v11 + 28) = 5;
            asyncDeliveryTarget = self->_asyncDeliveryTarget;
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v19[0] = __64__UIScrollEvent__removeGestureRecognizersSendingCancelledEvent___block_invoke;
            v19[1] = &unk_1E52DA660;
            v19[2] = self;
            id v20 = v11;
            double v13 = v11;
            [(_UIScrollEventAsyncDeliveryTarget *)asyncDeliveryTarget _asynchronouslyDeliverScrollEvent:v13 completion:v18];
            double v14 = self->_asyncDeliveryTarget;
            self->_asyncDeliveryTarget = 0;

            asyncDeliveryGesture = self->_asyncDeliveryGesture;
            self->_asyncDeliveryGesture = 0;

            id v4 = v17;
          }
        }
        -[UIScrollEvent _removeGestureRecognizer:fromComponents:](self, "_removeGestureRecognizer:fromComponents:", v9, 0, v16);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }
}

void __64__UIScrollEvent__removeGestureRecognizersSendingCancelledEvent___block_invoke()
{
}

- (id)_allWindows
{
  id v2 = [(UIScrollEvent *)self _windowServerHitTestWindow];
  if (v2)
  {
    objc_super v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (id)_windowServerHitTestWindow
{
  [(UIEvent *)self _hidEvent];
  return _UIEventHIDUIWindowForHIDEvent();
}

- (unint64_t)phase
{
  return self->_phase;
}

- (CGVector)_stifledDelta
{
  ddouble x = self->_stifledDelta.dx;
  ddouble y = self->_stifledDelta.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingSnapshotEventsForAsyncDelivery, 0);
  objc_storeStrong((id *)&self->_asyncDeliveryGesture, 0);
  objc_storeStrong((id *)&self->_asyncDeliveryTarget, 0);
  objc_storeStrong((id *)&self->_pointerAttributes, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersByWindow, 0);
}

@end