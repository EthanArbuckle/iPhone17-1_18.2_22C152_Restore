@interface UIHoverGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_isPaused;
- (BOOL)_pausesWhilePanning;
- (BOOL)_shouldReceiveEvent:(id)a3;
- (BOOL)_shouldReceivePress:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)_wantsHoverEventsWhilePointerIsLocked;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (CAPoint3D)_location3DInView:(id)a3;
- (CGFloat)altitudeAngle;
- (CGFloat)azimuthAngleInView:(UIView *)view;
- (CGFloat)zOffset;
- (CGPoint)_preciseLocationInView:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (CGVector)azimuthUnitVectorInView:(UIView *)view;
- (UIHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)_hoverHeight;
- (double)_hoverTouchTimestamp;
- (double)_maximumHoverHeight;
- (double)_rollAngle;
- (id)_setAllowedTouchTypes:(id)result;
- (int64_t)_previousTrackpadFingerDownCount;
- (int64_t)_trackpadFingerDownCount;
- (void)_hoverCancelled:(id)a3 withEvent:(id)a4;
- (void)_hoverEntered:(id)a3 withEvent:(id)a4;
- (void)_hoverExited:(id)a3 withEvent:(id)a4;
- (void)_hoverMoved:(id)a3 withEvent:(id)a4;
- (void)_resetInternalState;
- (void)_setPausesWhilePanning:(BOOL)a3;
- (void)reset;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setRequiresExclusiveTouchType:(BOOL)a3;
@end

@implementation UIHoverGestureRecognizer

- (BOOL)_shouldReceiveEvent:(id)a3
{
  return [a3 type] == 11;
}

- (void)setRequiresExclusiveTouchType:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    v4 = *(id *)(__UILogGetCategoryCachedImpl("Hover", &setRequiresExclusiveTouchType____s_category)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v5 = NSString;
        v6 = self;
        v7 = (objc_class *)objc_opt_class();
        v8 = NSStringFromClass(v7);
        v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];
      }
      else
      {
        v9 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "requiresExclusiveTouchType was called on the UIHoverGestureRecognizer %@ with an unsupported value of false. UIHoverGestureRecognizer currently does not support non-exclusive touch types. This value will be ignored.", buf, 0xCu);
    }
  }
}

- (UIHoverGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIHoverGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v4->_pausesWhilePanning = 1;
    [(UIGestureRecognizer *)v4 _setAcceptsFailureRequiments:0];
  }
  return v5;
}

- (void)_setPausesWhilePanning:(BOOL)a3
{
  self->_pausesWhilePanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouch, 0);
  objc_storeStrong((id *)&self->_currentHoverEvent, 0);
}

- (void)setAllowedTouchTypes:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    v25.receiver = self;
    v25.super_class = (Class)UIHoverGestureRecognizer;
    [(UIGestureRecognizer *)&v25 setAllowedTouchTypes:v4];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v23 = v4;
      v8 = "Hover";
      v9 = (unint64_t *)&setAllowedTouchTypes____s_category;
      uint64_t v10 = *(void *)v27;
      do
      {
        uint64_t v11 = 0;
        uint64_t v24 = v7;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v26 + 1) + 8 * v11) integerValue] == 1)
          {
            uint64_t v12 = *(id *)(__UILogGetCategoryCachedImpl(v8, v9) + 8);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              if (self)
              {
                v13 = NSString;
                v14 = self;
                v15 = (objc_class *)objc_opt_class();
                NSStringFromClass(v15);
                uint64_t v16 = v10;
                id v17 = v5;
                v18 = self;
                v19 = v9;
                v21 = v20 = v8;
                v22 = [v13 stringWithFormat:@"<%@: %p>", v21, v14];

                v8 = v20;
                v9 = v19;
                self = v18;
                id v5 = v17;
                uint64_t v10 = v16;
                uint64_t v7 = v24;
              }
              else
              {
                v22 = @"(nil)";
              }
              *(_DWORD *)buf = 138412290;
              v31 = v22;
              _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "An invalid allowed touch type of UITouch.TouchType.indirect was set on the UIHoverGestureRecognizer %@. In a future release, this will render the gesture nonfunctional", buf, 0xCu);
            }
          }
          ++v11;
        }
        while (v7 != v11);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v7);

      id v4 = v23;
    }
    else
    {
    }
  }
}

- (id)_setAllowedTouchTypes:(id)result
{
  if (result)
  {
    v2.receiver = result;
    v2.super_class = (Class)UIHoverGestureRecognizer;
    return objc_msgSendSuper2(&v2, sel_setAllowedTouchTypes_, a2);
  }
  return result;
}

- (BOOL)_wantsHoverEventsWhilePointerIsLocked
{
  return 0;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)UIHoverGestureRecognizer;
  [(UIGestureRecognizer *)&v5 reset];
  currentHoverEvent = self->_currentHoverEvent;
  self->_currentHoverEvent = 0;

  currentTouch = self->_currentTouch;
  self->_currentTouch = 0;

  self->_previousTrackpadFingerDownCount = 0;
  self->_trackpadFingerDownCount = 0;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  return 0;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  currentTouch = self->_currentTouch;
  return !currentTouch || currentTouch == a3;
}

- (void)_hoverEntered:(id)a3 withEvent:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (UITouch *)a3;
  id v7 = a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HoverGesture", &_MergedGlobals_15_8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v12 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412546;
      v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "_hoverEntered: %@ withEvent: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  if (!self->_currentHoverEvent && [(UITouch *)v6 count] == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&self->_currentHoverEvent, a4);
      v9 = [(UITouch *)v6 anyObject];
      currentTouch = self->_currentTouch;
      self->_currentTouch = v9;

      self->_trackpadFingerDownCount = [(UIEvent *)self->_currentHoverEvent _trackpadFingerDownCount];
      [(UIGestureRecognizer *)self setState:1];
      unint64_t v11 = __UILogGetCategoryCachedImpl("HoverGesture", &qword_1EB25EAB8);
      if (*(unsigned char *)v11)
      {
        v13 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = self->_currentTouch;
          v15 = v13;
          uint64_t v16 = [(UIGestureRecognizer *)self view];
          [(UITouch *)v14 locationInView:v16];
          id v17 = NSStringFromCGPoint(v23);
          int v18 = 138412546;
          v19 = v14;
          __int16 v20 = 2112;
          id v21 = v17;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "_hoverEntered: BEGAN with touch %@ at %@", (uint8_t *)&v18, 0x16u);
        }
      }
    }
  }
}

- (void)_hoverMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (UITouch *)a3;
  id v7 = (UIHoverEvent *)a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HoverGesture", &qword_1EB25EAC0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "_hoverMoved: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == v7)
  {
    if ([(UITouch *)v6 containsObject:self->_currentTouch])
    {
      self->_previousTrackpadFingerDownCount = self->_trackpadFingerDownCount;
      self->_trackpadFingerDownCount = [(UIEvent *)v7 _trackpadFingerDownCount];
      [(UIGestureRecognizer *)self setState:2];
      unint64_t v9 = __UILogGetCategoryCachedImpl("HoverGesture", &qword_1EB25EAC8);
      if (*(unsigned char *)v9)
      {
        unint64_t v11 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          currentTouch = self->_currentTouch;
          v13 = v11;
          v14 = [(UIGestureRecognizer *)self view];
          [(UITouch *)currentTouch locationInView:v14];
          NSStringFromCGPoint(v21);
          v15 = (UIHoverEvent *)objc_claimAutoreleasedReturnValue();
          int v16 = 138412546;
          id v17 = currentTouch;
          __int16 v18 = 2112;
          v19 = v15;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "_hoverMoved: CHANGED with touch %@ at %@", (uint8_t *)&v16, 0x16u);
        }
      }
    }
  }
}

- (void)_hoverExited:(id)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (UITouch *)a3;
  id v7 = (UIHoverEvent *)a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HoverGesture", &qword_1EB25EAD0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "_hoverExited: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == v7)
  {
    unint64_t v9 = __UILogGetCategoryCachedImpl("HoverGesture", &qword_1EB25EAD8);
    if (*(unsigned char *)v9)
    {
      unint64_t v11 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        currentTouch = self->_currentTouch;
        v13 = v11;
        v14 = [(UIGestureRecognizer *)self view];
        [(UITouch *)currentTouch locationInView:v14];
        NSStringFromCGPoint(v21);
        v15 = (UIHoverEvent *)objc_claimAutoreleasedReturnValue();
        int v16 = 138412546;
        id v17 = currentTouch;
        __int16 v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "_hoverExited: ENDED with touch %@ at %@", (uint8_t *)&v16, 0x16u);
      }
    }
    [(UIHoverGestureRecognizer *)self _resetInternalState];
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (void)_hoverCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (UITouch *)a3;
  id v7 = (UIHoverEvent *)a4;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("HoverGesture", &qword_1EB25EAE0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v10 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "_hoverCancelled: %@ withEvent: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  if (self->_currentHoverEvent == v7)
  {
    unint64_t v9 = __UILogGetCategoryCachedImpl("HoverGesture", &qword_1EB25EAE8);
    if (*(unsigned char *)v9)
    {
      unint64_t v11 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        currentTouch = self->_currentTouch;
        v13 = v11;
        v14 = [(UIGestureRecognizer *)self view];
        [(UITouch *)currentTouch locationInView:v14];
        NSStringFromCGPoint(v21);
        v15 = (UIHoverEvent *)objc_claimAutoreleasedReturnValue();
        int v16 = 138412546;
        id v17 = currentTouch;
        __int16 v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "_hoverCancelled: CANCELLED with touch %@ at %@", (uint8_t *)&v16, 0x16u);
      }
    }
    [(UIHoverGestureRecognizer *)self _resetInternalState];
    [(UIGestureRecognizer *)self setState:4];
  }
}

- (void)_resetInternalState
{
  currentHoverEvent = self->_currentHoverEvent;
  self->_currentHoverEvent = 0;

  currentTouch = self->_currentTouch;
  self->_currentTouch = 0;

  self->_previousTrackpadFingerDownCount = self->_trackpadFingerDownCount;
  self->_trackpadFingerDownCount = 0;
}

- (CGPoint)locationInView:(id)a3
{
  currentTouch = self->_currentTouch;
  if (currentTouch)
  {
    [(UITouch *)currentTouch locationInView:a3];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)_preciseLocationInView:(id)a3
{
  currentTouch = self->_currentTouch;
  if (currentTouch)
  {
    [(UITouch *)currentTouch preciseLocationInView:a3];
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (CAPoint3D)_location3DInView:(id)a3
{
  [(UIHoverGestureRecognizer *)self locationInView:a3];
  double v5 = v4;
  double v7 = v6;
  [(UIHoverGestureRecognizer *)self _hoverHeight];
  double v9 = v8;
  double v10 = v5;
  double v11 = v7;
  result.z = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)_affectedByGesture:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIHoverGestureRecognizer;
  if ([(UIGestureRecognizer *)&v7 _affectedByGesture:v4])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)_isPaused
{
  currentTouch = self->_currentTouch;
  if (currentTouch && (unint64_t)([(UITouch *)currentTouch phase] - 3) >= 5)
  {
    return [(UIHoverGestureRecognizer *)self _pausesWhilePanning];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIHoverGestureRecognizer;
    return [(UIGestureRecognizer *)&v5 _isPaused];
  }
}

- (double)_rollAngle
{
  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent) {
    return currentHoverEvent->_hoverRollAngle;
  }
  else {
    return 0.0;
  }
}

- (CGFloat)altitudeAngle
{
  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent) {
    return 1.57079633 - currentHoverEvent->_hoverAltitudeAngle;
  }
  else {
    return 0.0;
  }
}

- (CGFloat)azimuthAngleInView:(UIView *)view
{
  id v4 = view;
  double v5 = 0.0;
  if (self->_currentHoverEvent)
  {
    [(UIHoverGestureRecognizer *)self _azimuthUnitVectorInView:v4];
    if (v6 != 0.0 || v7 != 0.0) {
      double v5 = atan2(v7, v6);
    }
  }

  return v5;
}

- (CGVector)azimuthUnitVectorInView:(UIView *)view
{
  if (self->_currentHoverEvent)
  {
    id v4 = view;
    double v5 = [(UIView *)v4 window];
    long double v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      double v10 = [(UIGestureRecognizer *)self view];
      id v7 = [v10 window];
    }
    currentHoverEvent = self->_currentHoverEvent;
    if (currentHoverEvent) {
      double hoverAzimuthAngle = currentHoverEvent->_hoverAzimuthAngle;
    }
    else {
      double hoverAzimuthAngle = 0.0;
    }
    double v13 = _UITouchConvertCADisplayAzimuthAngleToWindow(v7, hoverAzimuthAngle);
    double v8 = _UITouchAzimuthUnitVectorInView(v7, v4, v13);
    double v9 = v14;
  }
  else
  {
    double v8 = 0.0;
    double v9 = 0.0;
  }
  double v15 = v8;
  double v16 = v9;
  result.dy = v16;
  result.dx = v15;
  return result;
}

- (double)_hoverHeight
{
  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent) {
    return currentHoverEvent->_positionZ;
  }
  else {
    return 0.0;
  }
}

- (double)_hoverTouchTimestamp
{
  [(UITouch *)self->_currentTouch timestamp];
  return result;
}

- (double)_maximumHoverHeight
{
  currentHoverEvent = self->_currentHoverEvent;
  if (currentHoverEvent) {
    return currentHoverEvent->_maximumPositionZ;
  }
  else {
    return 0.0;
  }
}

- (CGFloat)zOffset
{
  [(UIHoverGestureRecognizer *)self _hoverHeight];
  double v4 = v3;
  [(UIHoverGestureRecognizer *)self _maximumHoverHeight];
  if (v5 == 0.0) {
    double v5 = 15.0;
  }
  CGFloat result = v4 / v5;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (BOOL)_pausesWhilePanning
{
  return self->_pausesWhilePanning;
}

- (int64_t)_previousTrackpadFingerDownCount
{
  return self->_previousTrackpadFingerDownCount;
}

- (int64_t)_trackpadFingerDownCount
{
  return self->_trackpadFingerDownCount;
}

@end