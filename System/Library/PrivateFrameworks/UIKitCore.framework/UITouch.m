@interface UITouch
+ (id)_createTouchesWithGSEvent:(__GSEvent *)a3 phase:(int64_t)a4 view:(id)a5;
- (BOOL)_edgeForceActive;
- (BOOL)_edgeForcePending;
- (BOOL)_isAbandoningForwardingRecord;
- (BOOL)_isFirstTouchForView;
- (BOOL)_isPointerTouch;
- (BOOL)_isRestingTouch;
- (BOOL)_isTapToClick;
- (BOOL)_originatesFromPointerEvent;
- (BOOL)isDelayed;
- (CGFloat)altitudeAngle;
- (CGFloat)azimuthAngleInView:(UIView *)view;
- (CGFloat)force;
- (CGFloat)majorRadius;
- (CGFloat)majorRadiusTolerance;
- (CGFloat)maximumPossibleForce;
- (CGPoint)_locationInSceneReferenceSpace;
- (CGPoint)_previousLocationInSceneReferenceSpace;
- (CGPoint)locationInView:(UIView *)view;
- (CGPoint)preciseLocationInView:(UIView *)view;
- (CGPoint)precisePreviousLocationInView:(UIView *)view;
- (CGPoint)previousLocationInView:(UIView *)view;
- (CGVector)azimuthUnitVectorInView:(UIView *)view;
- (NSArray)gestureRecognizers;
- (NSNumber)estimationUpdateIndex;
- (NSString)description;
- (NSTimeInterval)timestamp;
- (NSUInteger)tapCount;
- (SEL)_responderSelectorForPhase:(int64_t)a3;
- (UITouchPhase)phase;
- (UITouchProperties)estimatedProperties;
- (UITouchProperties)estimatedPropertiesExpectingUpdates;
- (UITouchType)type;
- (UIView)view;
- (UIWindow)window;
- (_UIEventComponentPhaseValue)_eventComponentPhase;
- (_UIGestureRecognizerContainer)_responder;
- (_UISTouchAuthenticationRecord)_touchAuthenticationRecord;
- (__IOHIDEvent)_hidEvent;
- (double)_locationInWindow:(double *)a1;
- (double)_pressure;
- (double)_previousLocationInWindow:(double *)a1;
- (double)_rollAngle;
- (double)_unclampedForce;
- (double)initialTouchTimestamp;
- (float)_pathMajorRadius;
- (float)_zGradient;
- (id)_clone;
- (id)_eventComponentPhaseForValue:(int64_t)a3;
- (id)_forwardingRecord;
- (id)_gestureRecognizers;
- (id)_mutableForwardingRecord;
- (id)_phaseDescription;
- (id)_rehitTest;
- (id)_rehitTestWithEvent:(char)a3 constrainingToCurrentWindow:;
- (id)warpedIntoView;
- (int64_t)_compareIndex:(id)a3;
- (int64_t)_edgeType;
- (int64_t)_pathIndex;
- (int64_t)info;
- (uint64_t)_effectivelyAuthentic;
- (uint64_t)_isStationaryRelativeToTouches:(uint64_t)a1;
- (uint64_t)_shouldDeliverTouchForTouchesMoved;
- (uint64_t)_supportsForce;
- (unint64_t)_edgeAim;
- (unint64_t)_eventComponentType;
- (unint64_t)_pointerSenderID;
- (unint64_t)_senderID;
- (unsigned)_forceStage;
- (unsigned)_pathIdentity;
- (unsigned)_touchIdentifier;
- (void)_abandonForwardingRecord;
- (void)_addGestureRecognizer:(uint64_t)a1;
- (void)_clearForReenteringHoverInWindow:(id)a3;
- (void)_clearForWindowIfNeeded:(uint64_t)a1;
- (void)_clearGestureRecognizers;
- (void)_clonePropertiesToTouch:(id)a3;
- (void)_computeAzimuthAngleInWindow;
- (void)_loadStateFromTouch:(id)a3;
- (void)_mightBeConsideredForForceSystemGesture;
- (void)_predictedTouchesWithEvent:(void *)a1;
- (void)_removeGestureRecognizer:(uint64_t)a1;
- (void)_setAltitudeAngle:(uint64_t)a1;
- (void)_setEdgeAim:(unint64_t)a3;
- (void)_setEdgeType:(int64_t)a3;
- (void)_setEventComponentPhase:(id)a3;
- (void)_setForceStage:(unsigned __int8)a3;
- (void)_setHidEvent:(__IOHIDEvent *)a3;
- (void)_setHitTestSecurityAnalysis:(uint64_t)a1;
- (void)_setIsFirstTouchForView:(BOOL)a3;
- (void)_setIsPointerTouch:(BOOL)a3;
- (void)_setIsRestingTouch:(BOOL)a3;
- (void)_setIsTapToClick:(BOOL)a3;
- (void)_setLocationInWindow:(CGPoint)a3 resetPrevious:(BOOL)a4;
- (void)_setPathIdentity:(unsigned __int8)a3;
- (void)_setPathIndex:(int64_t)a3;
- (void)_setPhaseChangeDelegate:(uint64_t)a1;
- (void)_setPointerSenderID:(unint64_t)a3;
- (void)_setPreviousTouch:(id)a3;
- (void)_setResponder:(id)a3;
- (void)_setRollAngle:(double)a3 resetPrevious:;
- (void)_setSenderID:(unint64_t)a3;
- (void)_setTouchAuthenticationRecord:(id)a3;
- (void)_setType:(int64_t)a3;
- (void)_setWindowServerHitTestWindow:(uint64_t)a1;
- (void)_setZGradient:(float)a3;
- (void)_updatePredictionsWithCoalescedTouches:(uint64_t)a1;
- (void)_updatePredictionsWithEvent:(void *)a1;
- (void)_updateWithChildEvent:(uint64_t)a1;
- (void)_willBeDispatchedAsEnded;
- (void)dealloc;
- (void)setInitialTouchTimestamp:(double)a3;
- (void)setIsDelayed:(BOOL)a3;
- (void)setPhase:(int64_t)a3;
- (void)setTapCount:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setWarpedIntoView:(uint64_t)a1;
- (void)setWindow:(id)a3;
@end

@implementation UITouch

- (CGPoint)locationInView:(UIView *)view
{
  v4 = view;
  v5 = [(UITouch *)self window];
  double v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_locationInWindow.x, self->_locationInWindow.y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (UIWindow)window
{
  return self->_window;
}

- (UITouchPhase)phase
{
  return self->_phase;
}

- (uint64_t)_shouldDeliverTouchForTouchesMoved
{
  if (result)
  {
    uint64_t v1 = result;
    __int16 v2 = *(_WORD *)(result + 236);
    if ((v2 & 0x20) == 0)
    {
      if (dyld_program_sdk_at_least())
      {
        __int16 v3 = *(_WORD *)(v1 + 236) | 0x40;
      }
      else
      {
        v4 = [(id)v1 view];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          *(_WORD *)(v1 + 236) |= 0x40u;
        }
        else
        {
          v5 = [(id)v1 window];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v6 = 64;
          }
          else {
            __int16 v6 = 0;
          }
          *(_WORD *)(v1 + 236) = *(_WORD *)(v1 + 236) & 0xFFBF | v6;
        }
        __int16 v3 = *(_WORD *)(v1 + 236);
      }
      __int16 v2 = v3 | 0x20;
      *(_WORD *)(v1 + 236) = v2;
    }
    if ((v2 & 0x40) != 0) {
      return 1;
    }
    else {
      return *(double *)(v1 + 120) != *(double *)(v1 + 136) || *(double *)(v1 + 112) != *(double *)(v1 + 128);
    }
  }
  return result;
}

- (void)_addGestureRecognizer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    id v8 = v3;
    if (!v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      __int16 v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    char v7 = [v4 containsObject:v8];
    id v3 = v8;
    if ((v7 & 1) == 0)
    {
      [*(id *)(a1 + 96) addObject:v8];
      id v3 = v8;
    }
  }
}

- (UITouchType)type
{
  return self->_type;
}

- (unint64_t)_eventComponentType
{
  return 0;
}

- (void)_removeGestureRecognizer:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    int v4 = [*(id *)(a1 + 96) containsObject:v3];
    id v3 = v5;
    if (v4)
    {
      [*(id *)(a1 + 96) removeObject:v5];
      id v3 = v5;
    }
  }
}

- (id)warpedIntoView
{
  if (a1)
  {
    a1 = (id *)a1[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setIsFirstTouchForView:(BOOL)a3
{
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xFFFE | a3;
}

- (CGFloat)majorRadius
{
  return self->_pathMajorRadius;
}

- (void)setTapCount:(unint64_t)a3
{
  self->_tapCount = a3;
}

- (void)setInitialTouchTimestamp:(double)a3
{
  self->_initialTouchTimestamp = a3;
}

- (void)_setWindowServerHitTestWindow:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 360), a2);
  }
}

- (void)_setIsPointerTouch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xFDFF | v3;
}

- (unsigned)_touchIdentifier
{
  return self->_touchIdentifier;
}

- (NSTimeInterval)timestamp
{
  return self->_timestamp;
}

- (CGPoint)_locationInSceneReferenceSpace
{
  __int16 v3 = [(UITouch *)self window];
  if (v3)
  {
    int v4 = [(UITouch *)self window];
    id v5 = [(UITouch *)self window];
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:", -[UITouch _locationInWindow:]((double *)self, v5));
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = -[UITouch _locationInWindow:]((double *)self, 0);
    double v9 = v10;
  }

  double v11 = v7;
  double v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

- (int64_t)_edgeType
{
  return self->_edgeType;
}

- (double)_locationInWindow:(double *)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = [a1 window];

    if (v4)
    {
      id v5 = [a1 window];
      objc_msgSend(v5, "convertPoint:toWindow:", v3, a1[14], a1[15]);
      double v7 = v6;
    }
    else
    {
      double v7 = a1[14];
      if (v3)
      {
        objc_msgSend(v3, "convertPoint:fromWindow:", 0, a1[14], a1[15]);
        double v7 = v8;
      }
    }
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (BOOL)_edgeForceActive
{
  hidEvent = self->_hidEvent;
  if (hidEvent) {
    return ((unint64_t)IOHIDEventGetIntegerValue() >> 15) & 1;
  }
  return (char)hidEvent;
}

- (unint64_t)_edgeAim
{
  return self->_edgeAim;
}

- (void)setWindow:(id)a3
{
  id v5 = (UIWindow *)a3;
  window = self->_window;
  if (window == v5) {
    goto LABEL_9;
  }
  v28 = v5;
  if (window)
  {
    -[UIWindow convertPoint:toWindow:](window, "convertPoint:toWindow:", v5, self->_locationInWindow.x, self->_locationInWindow.y);
    self->_locationInWindow.double x = v7;
    self->_locationInWindow.double y = v8;
    -[UIWindow convertPoint:toWindow:](self->_window, "convertPoint:toWindow:", v28, self->_previousLocationInWindow.x, self->_previousLocationInWindow.y);
    self->_previousLocationInWindow.double x = v9;
    self->_previousLocationInWindow.double y = v10;
    -[UIWindow convertPoint:toWindow:](self->_window, "convertPoint:toWindow:", v28, self->_preciseLocationInWindow.x, self->_preciseLocationInWindow.y);
    self->_preciseLocationInWindow.double x = v11;
    self->_preciseLocationInWindow.double y = v12;
    p_double y = &self->_precisePreviousLocationInWindow.y;
    double y = self->_precisePreviousLocationInWindow.y;
    p_precisePreviousLocationInWindow = &self->_precisePreviousLocationInWindow;
    double x = self->_precisePreviousLocationInWindow.x;
    v17 = self->_window;
    v18 = v28;
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    -[UIWindow convertPoint:fromWindow:](v5, "convertPoint:fromWindow:", 0, self->_locationInWindow.x, self->_locationInWindow.y);
    self->_locationInWindow.double x = v19;
    self->_locationInWindow.double y = v20;
    -[UIWindow convertPoint:fromWindow:](v28, "convertPoint:fromWindow:", 0, self->_previousLocationInWindow.x, self->_previousLocationInWindow.y);
    self->_previousLocationInWindow.double x = v21;
    self->_previousLocationInWindow.double y = v22;
    -[UIWindow convertPoint:toWindow:](v28, "convertPoint:toWindow:", 0, self->_preciseLocationInWindow.x, self->_preciseLocationInWindow.y);
    self->_preciseLocationInWindow.double x = v23;
    self->_preciseLocationInWindow.double y = v24;
    p_double y = &self->_precisePreviousLocationInWindow.y;
    double y = self->_precisePreviousLocationInWindow.y;
    p_precisePreviousLocationInWindow = &self->_precisePreviousLocationInWindow;
    double x = self->_precisePreviousLocationInWindow.x;
    v17 = v28;
    v18 = 0;
  }
  -[UIWindow convertPoint:toWindow:](v17, "convertPoint:toWindow:", v18, x, y);
  p_precisePreviousLocationInWindow->double x = v25;
  *(void *)p_double y = v26;
LABEL_7:
  objc_storeStrong((id *)&self->_window, a3);
  -[UITouch _computeAzimuthAngleInWindow]((uint64_t)self);
  BOOL v27 = [(UITouch *)self isDelayed];
  id v5 = v28;
  if (!v27) {
    *(_WORD *)&self->_touchFlags &= ~0x20u;
  }
LABEL_9:
}

- (void)_computeAzimuthAngleInWindow
{
  if (a1)
  {
    if (*(void *)(a1 + 344) == 2)
    {
      double v2 = *(double *)(a1 + 368);
      id v3 = [(id)a1 window];
      *(double *)(a1 + 376) = _UITouchConvertCADisplayAzimuthAngleToWindow(v3, v2);
    }
    else
    {
      *(void *)(a1 + 376) = 0;
    }
  }
}

- (void)_setResponder:(id)a3
{
  id v5 = (_UIGestureRecognizerContainer *)a3;
  if (self->_responder != v5)
  {
    CGFloat v8 = v5;
    objc_storeStrong((id *)&self->_responder, a3);
    cachedResponderView = self->_cachedResponderView;
    self->_cachedResponderView = 0;

    BOOL v7 = [(UITouch *)self isDelayed];
    id v5 = v8;
    if (!v7) {
      *(_WORD *)&self->_touchFlags &= ~0x20u;
    }
  }
}

- (BOOL)isDelayed
{
  return (*(_WORD *)&self->_touchFlags >> 2) & 1;
}

- (__IOHIDEvent)_hidEvent
{
  return self->_hidEvent;
}

- (void)setPhase:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &_MergedGlobals_1204);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    CGFloat v8 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      CGFloat v9 = v8;
      CGFloat v10 = [(UITouch *)self _phaseDescription];
      CGFloat v11 = _PhaseDescription(a3);
      int v15 = 134218498;
      v16 = self;
      __int16 v17 = 2112;
      v18 = v10;
      __int16 v19 = 2112;
      CGFloat v20 = v11;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%p Setting touch phase from %@ to %@", (uint8_t *)&v15, 0x20u);
    }
  }
  self->_phase = a3;
  if ((unint64_t)(a3 - 3) <= 1 && self->_touchPredictor)
  {
    unint64_t v6 = __UILogGetCategoryCachedImpl("Touch", &qword_1EB262630);
    if (*(unsigned char *)v6)
    {
      CGFloat v12 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        _PhaseDescription(a3);
        v14 = (UITouch *)objc_claimAutoreleasedReturnValue();
        int v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Clearing touch predictor for: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    touchPredictor = self->_touchPredictor;
    self->_touchPredictor = 0;
  }
  [(_UITouchPhaseChangeDelegate *)self->__phaseChangeDelegate _touchPhaseChangedForTouch:self];
}

- (uint64_t)_effectivelyAuthentic
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    if (!_os_feature_enabled_impl()) {
      return 1;
    }
    if (v1[2]) {
      return 1;
    }
    double v2 = (void *)v1[42];
    if (!v2 || ([v2 shouldAllowEvents] & 1) != 0)
    {
      return 1;
    }
    else
    {
      id v3 = [v1 view];
      uint64_t v4 = [v3 _acceptsInauthenticTouches];

      return v4;
    }
  }
  return result;
}

- (_UIGestureRecognizerContainer)_responder
{
  return self->_responder;
}

- (NSArray)gestureRecognizers
{
  double v2 = (void *)[(NSMutableArray *)self->_gestureRecognizers copy];
  return (NSArray *)v2;
}

- (void)_setEventComponentPhase:(id)a3
{
  self->_phase = [a3 underlyingValue];
}

- (id)_eventComponentPhaseForValue:(int64_t)a3
{
  uint64_t v4 = _eventComponentPhaseMapping_1();
  id v5 = _eventComponentPhaseForValue(a3, v4);

  return v5;
}

- (CGFloat)force
{
  double v3 = -[UITouch _unclampedForce](self);
  [(UITouch *)self maximumPossibleForce];
  if (v3 < result) {
    return v3;
  }
  return result;
}

- (CGFloat)maximumPossibleForce
{
  int v3 = -[UITouch _supportsForce](self);
  CGFloat result = 0.0;
  if (v3)
  {
    if (self)
    {
      double maximumPossiblePressure = self->_maximumPossiblePressure;
      int64_t type = self->_type;
      BOOL v7 = [(UITouch *)self _isPointerTouch];
      uint64_t v8 = 3;
      if (!v7) {
        uint64_t v8 = type;
      }
      double v9 = 60.0;
      if (v8 == 2) {
        double v9 = 120.0;
      }
      if (v8 == 3) {
        double v9 = 115.0;
      }
      return maximumPossiblePressure / v9;
    }
    else
    {
      return NAN;
    }
  }
  return result;
}

- (double)_unclampedForce
{
  double v1 = 0.0;
  if (a1 && -[UITouch _supportsForce](a1))
  {
    [a1 _pressure];
    double v4 = v3;
    _AXSForceTouchSensitivity();
    double v6 = v5;
    uint64_t v7 = a1[43];
    int v8 = [a1 _isPointerTouch];
    uint64_t v9 = 3;
    if (!v8) {
      uint64_t v9 = v7;
    }
    double v10 = 60.0;
    if (v9 == 2) {
      double v10 = 120.0;
    }
    if (v9 == 3) {
      double v10 = 115.0;
    }
    double v11 = v4 / (v10 * v6);
    if (v11 >= 0.0) {
      return v11;
    }
    else {
      return 0.0;
    }
  }
  return v1;
}

- (void)_setHidEvent:(__IOHIDEvent *)a3
{
  hidEvent = self->_hidEvent;
  if (hidEvent != a3)
  {
    if (hidEvent) {
      CFRelease(hidEvent);
    }
    self->_hidEvent = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (BOOL)_originatesFromPointerEvent
{
  if ([(UITouch *)self _isPointerTouch]) {
    return 1;
  }
  if (self) {
    return self->_pointerSource != 0;
  }
  return 0;
}

- (uint64_t)_supportsForce
{
  if (!a1) {
    return 0;
  }
  if (([a1 _isPointerTouch] & 1) != 0 || a1[43] == 2) {
    return 1;
  }
  double v3 = +[UIDevice currentDevice];
  if ([v3 _supportsForceTouch]) {
    BOOL v2 = _AXSForceTouchEnabled() != 0;
  }
  else {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)_isPointerTouch
{
  return (*(_WORD *)&self->_touchFlags >> 9) & 1;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void)_setZGradient:(float)a3
{
  self->_zGradient = a3;
}

- (void)_setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void)_setSenderID:(unint64_t)a3
{
  self->_senderID = a3;
}

- (void)_setPathIndex:(int64_t)a3
{
  self->_pathIndedouble x = a3;
}

- (void)_setPathIdentity:(unsigned __int8)a3
{
  self->_pathIdentitdouble y = a3;
}

- (void)_setHitTestSecurityAnalysis:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 392), a2);
  }
}

- (void)_setEdgeType:(int64_t)a3
{
  self->_edgeType = a3;
}

- (void)_setEdgeAim:(unint64_t)a3
{
  self->_edgeAim = a3;
}

- (void)_updateWithChildEvent:(uint64_t)a1
{
  if (a1)
  {
    IOHIDEventGetFloatValue();
    -[UITouch _setAltitudeAngle:](a1, 1.57079633 - v2);
    IOHIDEventGetFloatValue();
    *(void *)(a1 + 368) = v3;
    -[UITouch _computeAzimuthAngleInWindow](a1);
  }
}

- (void)_setAltitudeAngle:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &_setAltitudeAngle____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      float v5 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v6 = 134218240;
        uint64_t v7 = a1;
        __int16 v8 = 2048;
        double v9 = a2;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%p Set altitude angle: %7.4f", (uint8_t *)&v6, 0x16u);
      }
    }
    *(double *)(a1 + 312) = a2;
  }
}

- (CGPoint)preciseLocationInView:(UIView *)view
{
  double v4 = view;
  float v5 = [(UITouch *)self window];
  double v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_preciseLocationInWindow.x, self->_preciseLocationInWindow.y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (double)_pressure
{
  return self->_pressure;
}

- (unint64_t)_senderID
{
  return self->_senderID;
}

- (_UIEventComponentPhaseValue)_eventComponentPhase
{
  int64_t phase = self->_phase;
  uint64_t v3 = _eventComponentPhaseMapping_1();
  double v4 = _eventComponentPhaseForUnderlyingValue(phase, v3);

  return (_UIEventComponentPhaseValue *)v4;
}

- (id)_mutableForwardingRecord
{
  forwardingRecord = self->_forwardingRecord;
  if (!forwardingRecord)
  {
    double v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    float v5 = self->_forwardingRecord;
    self->_forwardingRecord = v4;

    forwardingRecord = self->_forwardingRecord;
  }
  return forwardingRecord;
}

- (BOOL)_isAbandoningForwardingRecord
{
  return (*(_WORD *)&self->_touchFlags >> 4) & 1;
}

- (void)_updatePredictionsWithEvent:(void *)a1
{
  id v3 = a2;
  if (a1 && a1[30])
  {
    if (([a1 type] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &_updatePredictionsWithEvent____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        double v7 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v8 = 0;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Clearing touch predictor during update", v8, 2u);
        }
      }
      float v5 = (void *)a1[30];
      a1[30] = 0;
    }
    else
    {
      double v6 = [v3 coalescedTouchesForTouch:a1];
      -[UITouch _updatePredictionsWithCoalescedTouches:]((uint64_t)a1, v6);
    }
  }
}

- (void)_willBeDispatchedAsEnded
{
  if (a1 && (*(_WORD *)(a1 + 236) & 0x100) == 0)
  {
    if (*(double *)(a1 + 224) > 0.0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v2 = +[_UIStatistics maxForce];
        [v2 recordDistributionValue:*(double *)(a1 + 224)];
      }
    }
    *(_WORD *)(a1 + 236) |= 0x100u;
  }
}

- (int64_t)_pathIndex
{
  return self->_pathIndex;
}

- (UIView)view
{
  responder = self->_responder;
  if (responder)
  {
    cachedResponderView = self->_cachedResponderView;
    if (cachedResponderView)
    {
      float v5 = cachedResponderView;
    }
    else
    {
      double v6 = responder;
      do
      {
        if (_IsKindOfUIView((uint64_t)v6)) {
          break;
        }
        uint64_t v7 = [(UIView *)v6 nextResponder];

        double v6 = (UIView *)v7;
      }
      while (v7);
      double v8 = self->_cachedResponderView;
      self->_cachedResponderView = v6;
      double v9 = v6;

      float v5 = self->_cachedResponderView;
    }
  }
  else
  {
    float v5 = 0;
  }
  return v5;
}

- (id)_gestureRecognizers
{
  return self->_gestureRecognizers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->__authenticationMessage, 0);
  objc_storeStrong((id *)&self->__windowServerHitTestWindow, 0);
  objc_storeStrong((id *)&self->__phaseChangeDelegate, 0);
  objc_storeStrong((id *)&self->_touchAuthenticationRecord, 0);
  objc_storeStrong((id *)&self->_touchPredictor, 0);
  objc_storeStrong((id *)&self->_forwardingRecord, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
  objc_storeStrong((id *)&self->_warpedIntoView, 0);
  objc_storeStrong((id *)&self->_cachedResponderView, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

- (void)_setRollAngle:(double)a3 resetPrevious:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    double v4 = a3;
    if ((a2 & 1) == 0) {
      a3 = *(double *)(a1 + 248);
    }
    *(double *)(a1 + 256) = a3;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &_setRollAngle_resetPrevious____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v7 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134218496;
        uint64_t v9 = a1;
        __int16 v10 = 2048;
        double v11 = v4;
        __int16 v12 = 1024;
        int v13 = a2;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%p Set roll angle: %7.4f, resetPrevious: %d", (uint8_t *)&v8, 0x1Cu);
      }
    }
    *(double *)(a1 + 248) = v4;
  }
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &dealloc___s_category_8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    float v5 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int v8 = self;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Deallocating touch: %p", buf, 0xCu);
    }
  }
  hidEvent = self->_hidEvent;
  if (hidEvent) {
    CFRelease(hidEvent);
  }
  v6.receiver = self;
  v6.super_class = (Class)UITouch;
  [(UITouch *)&v6 dealloc];
}

- (NSString)description
{
  id v3 = [(UITouch *)self _phaseDescription];
  if (_IsKindOfUIView((uint64_t)self->_responder))
  {
    double v4 = NSString;
    float v5 = NSStringFromCGPoint(self->_locationInWindow);
    objc_super v6 = NSStringFromCGPoint(self->_previousLocationInWindow);
    [(UITouch *)self locationInView:self->_responder];
    uint64_t v7 = NSStringFromCGPoint(v23);
    [(UITouch *)self previousLocationInView:self->_responder];
    int v8 = NSStringFromCGPoint(v24);
    objc_msgSend(v4, "stringWithFormat:", @"location in window: %@; previous location in window: %@; location in view: %@; previous location in view: %@",
      v5,
      v6,
      v7,
      v8);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = &stru_1ED0E84C0;
  }
  __int16 v10 = NSString;
  NSStringFromBOOL();
  id v11 = objc_claimAutoreleasedReturnValue();
  __int16 v12 = objc_msgSend(v10, "stringWithFormat:", @" is pointer: %s", objc_msgSend(v11, "UTF8String"));;

  int v13 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)UITouch;
  uint64_t v14 = [(UITouch *)&v21 description];
  unint64_t type = self->_type;
  if (type > 3) {
    v16 = @"Unknown";
  }
  else {
    v16 = off_1E5304418[type];
  }
  unint64_t tapCount = self->_tapCount;
  [(UITouch *)self force];
  objc_msgSend(v13, "stringWithFormat:", @"%@ type: %@; phase: %@;%@ tap count: %lu; force: %0.3f; window: %@; responder: %@; %@",
    v14,
    v16,
    v3,
    v12,
    tapCount,
    v18,
    self->_window,
    self->_responder,
  __int16 v19 = v9);

  return (NSString *)v19;
}

- (CGPoint)previousLocationInView:(UIView *)view
{
  double v4 = view;
  float v5 = [(UITouch *)self window];
  double v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_previousLocationInWindow.x, self->_previousLocationInWindow.y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (id)_phaseDescription
{
  return _PhaseDescription(self->_phase);
}

- (id)_clone
{
  id v3 = objc_alloc_init(UITouch);
  [(UITouch *)self _clonePropertiesToTouch:v3];
  return v3;
}

- (void)_clonePropertiesToTouch:(id)a3
{
  CGPoint v23 = (char *)a3;
  *((_DWORD *)v23 + 14) = self->_touchIdentifier;
  *((void *)v23 + 34) = *(void *)&self->_timestamp;
  *((void *)v23 + 50) = *(void *)&self->_initialTouchTimestamp;
  *((void *)v23 + 2) = self->_phase;
  *((void *)v23 + 3) = self->_tapCount;
  *((void *)v23 + 4) = self->_edgeType;
  *((void *)v23 + 5) = self->_edgeAim;
  *((void *)v23 + 6) = self->_precision;
  *((void *)v23 + 43) = self->_type;
  objc_storeStrong((id *)v23 + 42, self->_touchAuthenticationRecord);
  double v4 = (id *)v23;
  window = self->_window;
  if (*((UIWindow **)v23 + 8) != window)
  {
    objc_storeStrong((id *)v23 + 8, window);
    double v4 = (id *)v23;
  }
  responder = self->_responder;
  if (v4[9] != responder)
  {
    objc_storeStrong(v4 + 9, responder);
    objc_storeStrong((id *)v23 + 10, self->_cachedResponderView);
    double v4 = (id *)v23;
  }
  warpedIntoView = self->_warpedIntoView;
  if (v4[11] != warpedIntoView)
  {
    objc_storeStrong(v4 + 11, warpedIntoView);
    double v4 = (id *)v23;
  }
  if (([v4[12] isEqualToArray:self->_gestureRecognizers] & 1) == 0)
  {
    uint64_t v8 = [(NSMutableArray *)self->_gestureRecognizers mutableCopy];
    double v9 = (void *)*((void *)v23 + 12);
    *((void *)v23 + 12) = v8;
  }
  double v10 = v23;
  windowServerHitTestWindow = self->__windowServerHitTestWindow;
  if (*((UIWindow **)v23 + 45) != windowServerHitTestWindow)
  {
    objc_storeStrong((id *)v23 + 45, windowServerHitTestWindow);
    double v10 = v23;
  }
  *((_OWORD *)v10 + 7) = self->_locationInWindow;
  *((_OWORD *)v10 + 9) = self->_preciseLocationInWindow;
  *((void *)v10 + 27) = *(void *)&self->_pressure;
  *((void *)v10 + 28) = *(void *)&self->_maxObservedPressure;
  *((_DWORD *)v10 + 58) = LODWORD(self->_zGradient);
  *(CGSize *)(v10 + 408) = self->_displacement;
  *((_OWORD *)v10 + 8) = self->_previousLocationInWindow;
  *((_OWORD *)v10 + 10) = self->_precisePreviousLocationInWindow;
  *((void *)v10 + 22) = *(void *)&self->_previousPressure;
  *((void *)v10 + 36) = *(void *)&self->_maximumPossiblePressure;
  *((void *)v10 + 23) = self->_pathIndex;
  v10[192] = self->_pathIdentity;
  *((void *)v10 + 25) = *(void *)&self->_pathMajorRadius;
  *((void *)v10 + 26) = *(void *)&self->_majorRadiusTolerance;
  int v12 = *((_WORD *)v10 + 118) & 0xFFFE | *(_WORD *)&self->_touchFlags & 1;
  *((_WORD *)v10 + 118) = *((_WORD *)v10 + 118) & 0xFFFE | *(_WORD *)&self->_touchFlags & 1;
  unsigned int v13 = v12 & 0xFFFFFFFD | (2 * ((*(_WORD *)&self->_touchFlags >> 1) & 1));
  *((_WORD *)v10 + 118) = v13;
  unsigned int v14 = v13 & 0xFFFFFFFB | (4 * ((*(_WORD *)&self->_touchFlags >> 2) & 1));
  *((_WORD *)v10 + 118) = v14;
  unsigned int v15 = v14 & 0xFFFFFFF7 | (8 * ((*(_WORD *)&self->_touchFlags >> 3) & 1));
  *((_WORD *)v10 + 118) = v15;
  unsigned int v16 = v15 & 0xFFFFFFEF | (16 * ((*(_WORD *)&self->_touchFlags >> 4) & 1));
  *((_WORD *)v10 + 118) = v16;
  unsigned int v17 = v16 & 0xFFFFFFDF | (32 * ((*(_WORD *)&self->_touchFlags >> 5) & 1));
  *((_WORD *)v10 + 118) = v17;
  unsigned int v18 = v17 & 0xFFFFFFBF | (((*(_WORD *)&self->_touchFlags >> 6) & 1) << 6);
  *((_WORD *)v10 + 118) = v18;
  unsigned int v19 = v18 & 0xFFFFFDFF | (((*(_WORD *)&self->_touchFlags >> 9) & 1) << 9);
  *((_WORD *)v10 + 118) = v19;
  unsigned int v20 = v19 & 0xFFFFF7FF | (((*(_WORD *)&self->_touchFlags >> 11) & 1) << 11);
  *((_WORD *)v10 + 118) = v20;
  unsigned int v21 = v20 & 0xFFFFEFFF | (((*(_WORD *)&self->_touchFlags >> 12) & 1) << 12);
  *((_WORD *)v10 + 118) = v21;
  unsigned int v22 = v21 & 0xFFFFDFFF | (((*(_WORD *)&self->_touchFlags >> 13) & 1) << 13);
  *((_WORD *)v10 + 118) = v22;
  *((_WORD *)v10 + 118) = v22 & 0xBFFF | *(_WORD *)&self->_touchFlags & 0x4000;
  *((void *)v10 + 46) = *(void *)&self->_azimuthAngleInCADisplay;
  *((void *)v10 + 47) = *(void *)&self->_azimuthAngleInWindow;
  *((void *)v10 + 39) = *(void *)&self->_altitudeAngle;
  *((void *)v10 + 31) = *(void *)&self->_rollAngle;
  *((void *)v10 + 32) = *(void *)&self->_previousRollAngle;
  v10[268] = self->_needsRollUpdate;
  v10[269] = self->_hasRollUpdate;
  *((void *)v10 + 35) = self->_updateCorrelationToken;
  v10[265] = self->_needsForceUpdate;
  v10[266] = self->_hasForceUpdate;
  *((void *)v10 + 37) = self->_senderID;
  *((void *)v10 + 40) = self->_pointerSenderID;
  *((void *)v10 + 41) = self->_pointerSource;
  v10[267] = self->_forceStage;
  [v10 _setHidEvent:self->_hidEvent];
  *((double *)v23 + 1) = (*((double *)v23 + 14) - *((double *)v23 + 16))
                       * (*((double *)v23 + 14) - *((double *)v23 + 16))
                       + (*((double *)v23 + 15) - *((double *)v23 + 17))
                       * (*((double *)v23 + 15) - *((double *)v23 + 17));
}

- (void)setIsDelayed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xFFFB | v3;
}

- (void)_loadStateFromTouch:(id)a3
{
  self->_touchIdentifier = *((_DWORD *)a3 + 14);
  self->_timestamp = *((double *)a3 + 34);
  self->_int64_t phase = *((void *)a3 + 2);
  self->_unint64_t tapCount = *((void *)a3 + 3);
  float v5 = (_UIGestureRecognizerContainer *)*((id *)a3 + 9);
  responder = self->_responder;
  self->_responder = v5;
  id v7 = a3;

  objc_storeStrong((id *)&self->_cachedResponderView, *((id *)v7 + 10));
  objc_storeStrong((id *)&self->_window, *((id *)v7 + 8));
  self->_locationInWindow = (CGPoint)*((_OWORD *)v7 + 7);
  self->_previousLocationInWindow = (CGPoint)*((_OWORD *)v7 + 8);
  self->_preciseLocationInWindow = (CGPoint)*((_OWORD *)v7 + 9);
  self->_precisePreviousLocationInWindow = (CGPoint)*((_OWORD *)v7 + 10);
  LODWORD(responder) = *((_DWORD *)v7 + 59);

  self->_touchFlags = ($AA67F7BCECD28A4E6697E4855137C5D0)responder;
  *(_WORD *)&self->_touchFlags = (unsigned __int16)responder & 0x9FFF;
}

- (double)_rollAngle
{
  return self->_rollAngle;
}

- (id)_forwardingRecord
{
  return self->_forwardingRecord;
}

- (void)_setPreviousTouch:(id)a3
{
  self->_previousLocationInWindow = (CGPoint)*((_OWORD *)a3 + 7);
  self->_precisePreviousLocationInWindow = (CGPoint)*((_OWORD *)a3 + 9);
  self->_previousPressure = *((double *)a3 + 27);
  self->_previousRollAngle = *((double *)a3 + 31);
  self->_movementMagnitudeSquared = (self->_locationInWindow.x - self->_previousLocationInWindow.x)
                                  * (self->_locationInWindow.x - self->_previousLocationInWindow.x)
                                  + (self->_locationInWindow.y - self->_previousLocationInWindow.y)
                                  * (self->_locationInWindow.y - self->_previousLocationInWindow.y);
}

- (int64_t)info
{
  return 0;
}

- (NSUInteger)tapCount
{
  return self->_tapCount;
}

- (CGPoint)precisePreviousLocationInView:(UIView *)view
{
  double v4 = view;
  float v5 = [(UITouch *)self window];
  double v6 = _UITouchConvertLocationInWindowToView((uint64_t)v5, v4, self->_precisePreviousLocationInWindow.x, self->_precisePreviousLocationInWindow.y);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGFloat)azimuthAngleInView:(UIView *)view
{
  double v4 = view;
  double azimuthAngleInWindow = 0.0;
  if (self->_type == 2)
  {
    double v6 = [(UITouch *)self window];

    if (v4 && v6)
    {
      [(UITouch *)self azimuthUnitVectorInView:v4];
      double azimuthAngleInWindow = atan2(v8, v7);
    }
    else
    {
      double azimuthAngleInWindow = self->_azimuthAngleInWindow;
    }
  }

  return azimuthAngleInWindow;
}

- (CGVector)azimuthUnitVectorInView:(UIView *)view
{
  double v4 = view;
  float v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  if (self->_type == 2)
  {
    double azimuthAngleInWindow = self->_azimuthAngleInWindow;
    double v9 = [(UIView *)v4 window];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(UITouch *)self window];
    }
    int v12 = v11;

    unsigned int v13 = [(UITouch *)self window];

    if (v12 != v13) {
      double azimuthAngleInWindow = _UITouchConvertCADisplayAzimuthAngleToWindow(v12, self->_azimuthAngleInCADisplay);
    }
    double v6 = _UITouchAzimuthUnitVectorInView(v12, v5, azimuthAngleInWindow);
    double v7 = v14;
  }
  double v15 = v6;
  double v16 = v7;
  result.ddouble y = v16;
  result.ddouble x = v15;
  return result;
}

- (CGFloat)altitudeAngle
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", altitudeAngle___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    float v5 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      double altitudeAngle = self->_altitudeAngle;
      int v7 = 134218240;
      long double v8 = self;
      __int16 v9 = 2048;
      double v10 = altitudeAngle;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%p Altitude angle: %7.4f", (uint8_t *)&v7, 0x16u);
    }
  }
  return self->_altitudeAngle;
}

- (float)_pathMajorRadius
{
  [(UITouch *)self majorRadius];
  return v2;
}

- (NSNumber)estimationUpdateIndex
{
  if (self->_needsRollUpdate || self->_hasRollUpdate || self->_needsForceUpdate || self->_hasForceUpdate)
  {
    double v2 = [NSNumber numberWithLong:self->_updateCorrelationToken];
  }
  else
  {
    double v2 = 0;
  }
  return (NSNumber *)v2;
}

- (UITouchProperties)estimatedProperties
{
  if ((*(_WORD *)&self->_touchFlags & 0x80) != 0) {
    return 15;
  }
  if (self->_needsForceUpdate)
  {
    if (self->_hasForceUpdate)
    {
LABEL_4:
      UITouchProperties v2 = 0;
      goto LABEL_8;
    }
  }
  else if (!self->_hasForceUpdate)
  {
    goto LABEL_4;
  }
  UITouchProperties v2 = 1;
LABEL_8:
  if (self->_needsRollUpdate)
  {
    if (self->_hasRollUpdate) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (self->_hasRollUpdate) {
LABEL_10:
  }
    v2 |= 0x10uLL;
LABEL_11:
  if (self->_hidEvent)
  {
    unint64_t IntegerValue = IOHIDEventGetIntegerValue();
    uint64_t v4 = (IntegerValue >> 28) & 2;
    uint64_t v5 = (IntegerValue >> 26) & 4;
    BOOL v6 = IOHIDEventGetIntegerValue() == 11;
    return v4 | v5 | v6 | (IOHIDEventGetEventFlags() >> 11) & 8 | (unint64_t)v2;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __30__UITouch_estimatedProperties__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    if (estimatedProperties_once != -1) {
      dispatch_once(&estimatedProperties_once, block);
    }
  }
  return v2;
}

void __30__UITouch_estimatedProperties__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  UITouchProperties v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UITouchStandardForceAmount_block_invoke___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    uint64_t v5 = "-[UITouch estimatedProperties]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "%s Touch is missing a HID Event: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (UITouchProperties)estimatedPropertiesExpectingUpdates
{
  UITouchProperties result = self->_needsForceUpdate && !self->_hasForceUpdate;
  if (self->_needsRollUpdate && !self->_hasRollUpdate) {
    return result | 0x10;
  }
  return result;
}

- (BOOL)_edgeForcePending
{
  hidEvent = self->_hidEvent;
  if (hidEvent) {
    return ((unint64_t)IOHIDEventGetIntegerValue() >> 14) & 1;
  }
  return (char)hidEvent;
}

- (void)_mightBeConsideredForForceSystemGesture
{
  if (result)
  {
    double v1 = result;
    if (([result _edgeForcePending] & 1) != 0
      || (UITouchProperties result = (void *)[v1 _edgeForceActive], result))
    {
      UITouchProperties v2 = [*((id *)v1 + 8) traitCollection];
      uint64_t v3 = [v2 forceTouchCapability];

      if (v3 == 2)
      {
        double v4 = *((double *)v1 + 14);
        [*((id *)v1 + 8) bounds];
        BOOL v5 = v4 < CGRectGetMidX(v6);
        return (void *)(v5 ^ ([(id)UIApp userInterfaceLayoutDirection] != 0));
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)_updatePredictionsWithCoalescedTouches:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = v3;
  if (*(void *)(a1 + 240))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(a1 + 240) addTouch:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_predictedTouchesWithEvent:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([a1 phase] == 3
      || [a1 phase] == 4
      || ([a1 type] & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      a1 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v5 = (void *)a1[30];
      if (!v5)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("Touch", &_predictedTouchesWithEvent____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          long long v10 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long v11 = 0;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Creating touch predictor", v11, 2u);
          }
        }
        uint64_t v7 = objc_alloc_init(_UITouchPredictor);
        uint64_t v8 = (void *)a1[30];
        a1[30] = v7;

        long long v9 = [v3 coalescedTouchesForTouch:a1];
        -[UITouch _updatePredictionsWithCoalescedTouches:]((uint64_t)a1, v9);

        uint64_t v5 = (void *)a1[30];
      }
      a1 = [v5 predictedTouchesForTouch:a1];
    }
  }

  return a1;
}

+ (id)_createTouchesWithGSEvent:(__GSEvent *)a3 phase:(int64_t)a4 view:(id)a5
{
  id v6 = a5;
  uint64_t v7 = objc_alloc_init(UITouch);
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v7, 0);
  [(UITouch *)v7 setPhase:a4];
  GSEventGetTimestamp();
  -[UITouch setTimestamp:](v7, "setTimestamp:");
  [(UITouch *)v7 setTapCount:1];
  long long v9 = [v6 window];
  [(UITouch *)v7 setWindow:v9];

  [(UITouch *)v7 setView:v6];
  GSEventGetLocationInWindow();
  -[UITouch _setLocationInWindow:resetPrevious:](v7, "_setLocationInWindow:resetPrevious:", 1);
  [(UITouch *)v7 _setIsFirstTouchForView:1];

  return v8;
}

- (BOOL)_isFirstTouchForView
{
  return *(_WORD *)&self->_touchFlags & 1;
}

- (void)_setLocationInWindow:(CGPoint)a3 resetPrevious:(BOOL)a4
{
  if (self)
  {
    if (a4)
    {
      self->_previousLocationInWindow = a3;
      self->_precisePreviousLocationInWindow = a3;
    }
    else
    {
      self->_previousLocationInWindow = self->_locationInWindow;
      self->_precisePreviousLocationInWindow = self->_preciseLocationInWindow;
    }
    self->_locationInWindow = a3;
    self->_preciseLocationInWindow = a3;
  }
}

- (void)_clearGestureRecognizers
{
}

- (double)_previousLocationInWindow:(double *)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = [a1 window];

    if (v4)
    {
      uint64_t v5 = [a1 window];
      objc_msgSend(v5, "convertPoint:toWindow:", v3, a1[16], a1[17]);
      double v7 = v6;
    }
    else
    {
      double v7 = a1[16];
      if (v3)
      {
        objc_msgSend(v3, "convertPoint:fromWindow:", 0, a1[16], a1[17]);
        double v7 = v8;
      }
    }
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (CGPoint)_previousLocationInSceneReferenceSpace
{
  id v3 = [(UITouch *)self window];
  if (v3)
  {
    double v4 = [(UITouch *)self window];
    uint64_t v5 = [(UITouch *)self window];
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:", -[UITouch _previousLocationInWindow:]((double *)self, v5));
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    double v7 = -[UITouch _previousLocationInWindow:]((double *)self, 0);
    double v9 = v10;
  }

  double v11 = v7;
  double v12 = v9;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (int64_t)_compareIndex:(id)a3
{
  id v4 = a3;
  if ([v4 _pathIndex] <= self->_pathIndex) {
    int64_t v5 = [v4 _pathIndex] < self->_pathIndex;
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (void)_abandonForwardingRecord
{
  *(_WORD *)&self->_touchFlags |= 0x10u;
  forwardingRecord = self->_forwardingRecord;
  self->_forwardingRecord = 0;
}

- (SEL)_responderSelectorForPhase:(int64_t)a3
{
  SEL result = 0;
  switch(a3)
  {
    case 0:
      SEL result = sel_touchesBegan_withEvent_;
      break;
    case 1:
      SEL result = sel_touchesMoved_withEvent_;
      break;
    case 3:
      SEL result = sel_touchesEnded_withEvent_;
      break;
    case 4:
      SEL result = sel_touchesCancelled_withEvent_;
      break;
    default:
      return result;
  }
  return result;
}

- (void)setWarpedIntoView:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v6 = *(id *)(a1 + 88);
    int64_t v5 = (id *)(a1 + 88);
    if (v6 != v4)
    {
      id v7 = v4;
      objc_storeStrong(v5, a2);
      id v4 = v7;
    }
  }
}

- (uint64_t)_isStationaryRelativeToTouches:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (v8 < *(double *)(v10 + 8)) {
            double v8 = *(double *)(v10 + 8);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }
    double v11 = *(double *)(a1 + 8);
    if (v11 == 0.0) {
      a1 = v8 > 2.0;
    }
    else {
      a1 = v11 < v8 * 0.1;
    }
  }

  return a1;
}

- (id)_rehitTest
{
  if (a1)
  {
    a1 = -[UITouch _rehitTestWithEvent:constrainingToCurrentWindow:]((uint64_t)a1, 0, 0);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_rehitTestWithEvent:(char)a3 constrainingToCurrentWindow:
{
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 64);
    id v7 = *(id *)(a1 + 360);
    id v8 = a2;
    [(id)a1 majorRadius];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__UITouch__rehitTestWithEvent_constrainingToCurrentWindow___block_invoke;
    v12[3] = &unk_1E53043B8;
    v12[4] = a1;
    uint64_t v10 = _UIHitTestGestureContainer((uint64_t)v8, v6, (uint64_t)v7, a3, (uint64_t)v12, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

uint64_t __59__UITouch__rehitTestWithEvent_constrainingToCurrentWindow___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) locationInView:a2];
}

- (void)_clearForWindowIfNeeded:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = (objc_class *)objc_opt_class();
    Name = class_getName(v4);
    uint64_t v6 = (objc_class *)objc_opt_class();
    id v7 = class_getName(v6);
    id v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("EventEnvironment", &_clearForWindowIfNeeded____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = v8;
      int v10 = 136447234;
      double v11 = Name;
      __int16 v12 = 2050;
      uint64_t v13 = a1;
      __int16 v14 = 2082;
      long long v15 = v7;
      __int16 v16 = 2050;
      unsigned int v17 = a2;
      __int16 v18 = 1026;
      int v19 = [a2 _contextId];
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Clearing window reference from touch: <%{public}s: %{public}p>; window: <%{public}s: %{public}p>, contextId: 0x%{public}X",
        (uint8_t *)&v10,
        0x30u);
    }
    if (*(void **)(a1 + 64) == a2)
    {
      *(void *)(a1 + 64) = 0;
    }
    if (*(void **)(a1 + 360) == a2)
    {
      *(void *)(a1 + 360) = 0;
    }
  }
}

- (void)_clearForReenteringHoverInWindow:(id)a3
{
  uint64_t v5 = (UIWindow *)a3;
  objc_storeStrong((id *)&self->_window, a3);
  responder = self->_responder;
  self->_responder = 0;

  cachedResponderView = self->_cachedResponderView;
  self->_cachedResponderView = 0;

  windowServerHitTestWindow = self->__windowServerHitTestWindow;
  self->__windowServerHitTestWindow = v5;
  double v9 = v5;

  warpedIntoView = self->_warpedIntoView;
  self->_warpedIntoView = 0;

  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0x204 | ((~*(_WORD *)&self->_touchFlags & 5) == 0);
  self->_unint64_t tapCount = 0;
  forwardingRecord = self->_forwardingRecord;
  self->_forwardingRecord = 0;

  self->_eaten = 0;
}

- (BOOL)_isRestingTouch
{
  return (*(_WORD *)&self->_touchFlags >> 11) & 1;
}

- (void)_setIsRestingTouch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xF7FF | v3;
}

- (BOOL)_isTapToClick
{
  return (*(_WORD *)&self->_touchFlags >> 12) & 1;
}

- (void)_setIsTapToClick:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_touchFlags = *(_WORD *)&self->_touchFlags & 0xEFFF | v3;
}

- (unsigned)_pathIdentity
{
  return self->_pathIdentity;
}

- (CGFloat)majorRadiusTolerance
{
  return self->_majorRadiusTolerance;
}

- (float)_zGradient
{
  return self->_zGradient;
}

- (unint64_t)_pointerSenderID
{
  return self->_pointerSenderID;
}

- (void)_setPointerSenderID:(unint64_t)a3
{
  self->_pointerSenderID = a3;
}

- (unsigned)_forceStage
{
  return self->_forceStage;
}

- (void)_setForceStage:(unsigned __int8)a3
{
  self->_forceStage = a3;
}

- (_UISTouchAuthenticationRecord)_touchAuthenticationRecord
{
  return self->_touchAuthenticationRecord;
}

- (void)_setTouchAuthenticationRecord:(id)a3
{
}

- (void)_setPhaseChangeDelegate:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 352), a2);
  }
}

- (double)initialTouchTimestamp
{
  return self->_initialTouchTimestamp;
}

@end