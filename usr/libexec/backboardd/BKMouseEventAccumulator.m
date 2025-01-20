@interface BKMouseEventAccumulator
- (BKHIDEventSenderInfo)mostRecentSender;
- (BKMouseEventAccumulator)init;
- (BKMouseEventAccumulator)initWithInterpolatedEventTypeMask:(unint64_t)a3 postEventsBlock:(id)a4;
- (BOOL)_shouldHitTestForGestureBegan;
- (BOOL)absolutePositionIsValid;
- (BOOL)buttonMaskDidChange;
- (BOOL)forceDidChange;
- (BOOL)isSenderLocked;
- (BOOL)scrollPhaseDidChange;
- (BOOL)senderPostsAtHighFrequency:(unint64_t)a3;
- (BOOL)shouldScrollNaturally;
- (BOOL)shouldSwapPrimaryAndSecondaryButtons;
- (BOOL)shouldUseButtonDownRecenteringBehavior;
- (BOOL)touchingPathIndexesDidChange;
- (CGPoint)acceleratedRelativePointerPosition;
- (CGPoint)pointerAbsolutePosition;
- (CGPoint)unacceleratedRelativePointerPosition;
- (NSIndexSet)touchingPathIndexes;
- (NSMutableArray)digitizerEvents;
- (double)force;
- (id).cxx_construct;
- (id)_eventStateForSender:(id)a3;
- (int64_t)hitTestReason;
- (int64_t)positionType;
- (unint64_t)eventSequenceStartTimestamp;
- (unint64_t)eventTypeMask;
- (unint64_t)lastRemoteEventTimestamp;
- (unsigned)buttonMask;
- (unsigned)previousButtonMask;
- (unsigned)scrollPhase;
- (unsigned)stage;
- (void)_terminateAllGesturesForSender:(id)a3;
- (void)_terminateScrollingForSender:(id)a3;
- (void)_updateTouchingPathIndexesFromDeviceEventState;
- (void)addButtonEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addButtonNumber:(int64_t)a3 down:(BOOL)a4 fromSender:(id)a5;
- (void)addDigitizerEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addForceEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addRotationEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addScaleEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addScrollEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addSyntheticTopLevelEventIfNeeded;
- (void)addTopLevelEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addTopLevelScaleEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addTopLevelScrollEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)addTranslationEvent:(__IOHIDEvent *)a3 fromSender:(id)a4;
- (void)appendSubeventsForEventTypeMask:(unint64_t)a3 toTopLevelEvent:(__IOHIDEvent *)a4 interfaceOrientation:(int64_t)a5 getEventSummary:(unint64_t *)a6;
- (void)dealloc;
- (void)deviceServiceDidAppear:(id)a3;
- (void)deviceServiceDidTerminate:(id)a3;
- (void)frameDidEnd;
- (void)frameWillBegin;
- (void)invalidate;
- (void)invalidateAbsolutePosition;
- (void)nextEvent;
- (void)setDigitizerEvents:(id)a3;
- (void)setShouldScrollNaturally:(BOOL)a3;
- (void)setShouldSwapPrimaryAndSecondaryButtons:(BOOL)a3;
- (void)setShouldUseButtonDownRecenteringBehavior:(BOOL)a3;
@end

@implementation BKMouseEventAccumulator

- (id).cxx_construct
{
  *((void *)self + 26) = 0;
  *((void *)self + 47) = 0;
  *((void *)self + 63) = 0;
  *((void *)self + 75) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentSender, 0);
  objc_storeStrong((id *)&self->_touchingPathIndexes, 0);
  objc_storeStrong((id *)&self->_buttonEvents, 0);
  objc_storeStrong((id *)&self->_digitizerEvents, 0);

  objc_storeStrong((id *)&self->_doomedSenderIDs, 0);
  objc_storeStrong((id *)&self->_eventStateBySenderID, 0);

  objc_storeStrong(&self->_postEventAsyncBlock, 0);
}

- (void)setShouldUseButtonDownRecenteringBehavior:(BOOL)a3
{
  self->_shouldUseButtonDownRecenteringBehavior = a3;
}

- (BOOL)shouldUseButtonDownRecenteringBehavior
{
  return self->_shouldUseButtonDownRecenteringBehavior;
}

- (BOOL)shouldSwapPrimaryAndSecondaryButtons
{
  return self->_shouldSwapPrimaryAndSecondaryButtons;
}

- (void)setShouldScrollNaturally:(BOOL)a3
{
  self->_shouldScrollNaturally = a3;
}

- (BOOL)shouldScrollNaturally
{
  return self->_shouldScrollNaturally;
}

- (BKHIDEventSenderInfo)mostRecentSender
{
  return self->_mostRecentSender;
}

- (int64_t)positionType
{
  return self->_positionType;
}

- (BOOL)absolutePositionIsValid
{
  return self->_absolutePositionIsValid;
}

- (CGPoint)pointerAbsolutePosition
{
  double x = self->_pointerAbsolutePosition.x;
  double y = self->_pointerAbsolutePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)lastRemoteEventTimestamp
{
  return self->_lastRemoteEventTimestamp;
}

- (unsigned)scrollPhase
{
  return self->_scrollPhase;
}

- (void)setDigitizerEvents:(id)a3
{
}

- (NSMutableArray)digitizerEvents
{
  return self->_digitizerEvents;
}

- (NSIndexSet)touchingPathIndexes
{
  return self->_touchingPathIndexes;
}

- (BOOL)forceDidChange
{
  return self->_forceDidChange;
}

- (unsigned)stage
{
  return self->_stage;
}

- (double)force
{
  return self->_force;
}

- (unsigned)buttonMask
{
  return self->_buttonMask;
}

- (unsigned)previousButtonMask
{
  return self->_previousButtonMask;
}

- (unint64_t)eventTypeMask
{
  return self->_eventTypeMask;
}

- (id)_eventStateForSender:(id)a3
{
  id v5 = a3;
  v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 senderID]);
  uint64_t v7 = [(NSMutableDictionary *)self->_eventStateBySenderID objectForKeyedSubscript:v6];
  if (!v7)
  {
    v8 = [_BKMouseDeviceEventState alloc];
    id v9 = v5;
    if (v8)
    {
      v17.receiver = v8;
      v17.super_class = (Class)_BKMouseDeviceEventState;
      id v10 = [(BKMouseEventAccumulator *)&v17 init];
      uint64_t v7 = (uint64_t)v10;
      if (v10)
      {
        objc_storeStrong((id *)v10 + 3, a3);
        *(_DWORD *)(v7 + 20) = [v9 eventSource];
        if ([v9 eventSource] == 11)
        {
          uint64_t v11 = objc_opt_class();
          id v12 = v9;
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              v13 = v12;
            }
            else {
              v13 = 0;
            }
          }
          else
          {
            v13 = 0;
          }
          id v14 = v13;

          unsigned __int8 v15 = [v14 claimsToConformToUsagePage:13 usage:12];
          *(unsigned char *)(v7 + 17) = v15 ^ 1;
        }
        else
        {
          *(unsigned char *)(v7 + 17) = 0;
        }
      }
    }
    else
    {
      uint64_t v7 = 0;
    }

    [(NSMutableDictionary *)self->_eventStateBySenderID setObject:v7 forKeyedSubscript:v6];
  }

  return (id)v7;
}

- (void)_terminateScrollingForSender:(id)a3
{
  if (sub_100085AC0((uint64_t)&self->_scrollPhaseTracker, 4, a3, 0))
  {
    v4 = BKLogMousePointer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v5 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, " -> discrete scroll -- end phase (service disappeared)", v5, 2u);
    }

    ++self->_discreteScrollGeneration;
    self->_scrollPhaseTracker._sentTerminalEvent = 1;
    self->_scrollPhaseDidChange = 1;
    self->_scrollPhase = 4;
    self->_lastRemoteEventTimestamp = 0;
    self->_eventTypeMask |= 0x40uLL;
    self->_scrollUnacceleratedDelta = 0u;
    self->_scrollAcceleratedDelta = 0u;
  }
}

- (void)_terminateAllGesturesForSender:(id)a3
{
  id v4 = a3;
  -[BKMouseEventAccumulator _terminateScrollingForSender:](self, "_terminateScrollingForSender:");
  if (sub_100085DF0((uint64_t)&self->_translationPhaseTracker, 4, v4, 0))
  {
    self->_translationPhaseTracker._sentTerminalEvent = 1;
    self->_translationDelta.double x = 0.0;
    self->_translationDelta.double y = 0.0;
    self->_eventTypeMask |= 0x10uLL;
  }
  if (sub_10008602C((uint64_t)&self->_rotationPhaseTracker, 4, v4, 0))
  {
    self->_rotationPhaseTracker._sentTerminalEvent = 1;
    self->_rotationZ = 0.0;
    self->_eventTypeMask |= 0x20uLL;
  }
  if (sub_100086268((uint64_t)&self->_scalePhaseTracker, 4, v4, 0))
  {
    self->_scalePhaseTracker._sentTerminalEvent = 1;
    self->_scaleZ = 0.0;
    self->_eventTypeMask |= 0x80uLL;
  }
}

- (void)addForceEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v6 = a4;
  int Type = IOHIDEventGetType();
  int v8 = Type;
  if (Type == 1)
  {
    IOHIDEventGetVendorDefinedData();
    unsigned int IntegerValue = 0;
    uint64_t v11 = 0;
    v13 = 0;
    uint64_t v15 = 0;
    double v17 = 0.0;
  }
  else
  {
    if (Type != 41)
    {
      v23 = +[NSString stringWithFormat:@"need vendor defined / force stage event"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v24 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        v26 = NSStringFromClass(v25);
        *(_DWORD *)buf = 138544642;
        v28 = v24;
        __int16 v29 = 2114;
        *(void *)v30 = v26;
        *(_WORD *)&v30[8] = 2048;
        *(void *)&v30[10] = self;
        *(_WORD *)&v30[18] = 2114;
        *(void *)&v30[20] = @"BKMousePointerEventAccumulator.mm";
        *(_WORD *)&v30[28] = 1024;
        *(_DWORD *)&v30[30] = 1523;
        __int16 v31 = 2114;
        v32 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v23 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100086854);
    }
    self->_eventTypeMask |= 0x20000000000uLL;
    unsigned int IntegerValue = IOHIDEventGetIntegerValue();
    IOHIDEventGetIntegerValue();
    IOHIDEventGetDoubleValue();
    uint64_t v11 = v10;
    IOHIDEventGetDoubleValue();
    v13 = v12;
    IOHIDEventGetDoubleValue();
    uint64_t v15 = v14;
    IOHIDEventGetDoubleValue();
    double v17 = v16;
  }
  v18 = @"Vendor Defined";
  if (v8 == 41) {
    v18 = @"POR";
  }
  v19 = v18;
  v20 = BKLogMousePointer();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v22 = NSStringFromBKSHIDForceStageTransition();
    *(_DWORD *)buf = 138544898;
    v28 = v19;
    __int16 v29 = 1024;
    *(_DWORD *)v30 = IntegerValue;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v22;
    *(_WORD *)&v30[14] = 2048;
    *(double *)&v30[16] = v17;
    *(_WORD *)&v30[24] = 2048;
    *(void *)&v30[26] = v11;
    __int16 v31 = 2048;
    v32 = v13;
    __int16 v33 = 2048;
    uint64_t v34 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, " -> %{public}@ force stage:%u transition:%{public}@ progress:%f nextThreshold:%f pressedThreshold:%f releasedThreshold:%f", buf, 0x44u);
  }
  forceEvent = self->_forceEvent;
  if (forceEvent) {
    CFRelease(forceEvent);
  }
  self->_forceEvent = (__IOHIDEvent *)IOHIDEventCreateCopy();
  self->_forceDidChange = self->_force != v17;
  self->_stage = IntegerValue;
  self->_force = v17;
}

- (void)addTranslationEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v5 = a4;
  IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  double v7 = v6;
  IOHIDEventGetFloatValue();
  double v9 = v8;
  uint64_t v10 = BKLogMousePointer();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v23 = BKNSStringFromIOHIDEventPhase();
    int v25 = 138543874;
    id v26 = v23;
    __int16 v27 = 2048;
    double v28 = v7;
    __int16 v29 = 2048;
    double v30 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, " -> translation phase:%{public}@ %g,%g", (uint8_t *)&v25, 0x20u);
  }
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  int Phase = IOHIDEventGetPhase();
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  if (sub_100085DF0((uint64_t)&self->_translationPhaseTracker, Phase, v5, TimeStamp))
  {
    self->_eventTypeMask |= 0x10uLL;
    if ((self->_interpolateEventTypeMask & 0x10) != 0)
    {
      uint64_t v15 = [(BKMouseEventAccumulator *)self _eventStateForSender:v5];
      double v16 = (void *)v15;
      if (v15) {
        double v17 = *(void **)(v15 + 72);
      }
      else {
        double v17 = 0;
      }
      id v18 = v17;
      uint64_t v19 = IOHIDEventGetTimeStamp();
      double v20 = sub_100086C00((uint64_t)v18);
      sub_100086C9C((uint64_t)&self->_translationInterpolator, v19, v20);
      double p1 = self->_translationInterpolator._x._p1;
      self->_translationInterpolator._x._p0 = p1;
      self->_translationInterpolator._x._double p1 = v7 + p1;
      double v22 = self->_translationInterpolator._y._p1;
      self->_translationInterpolator._y._p0 = v22;
      self->_translationInterpolator._y._double p1 = v9 + v22;
      self->_translationInterpolator._remainingInterpolations = 3;
    }
    else
    {
      CGFloat v13 = v9 + self->_translationDelta.y;
      self->_translationDelta.double x = v7 + self->_translationDelta.x;
      self->_translationDelta.double y = v13;
    }
  }
  else
  {
    uint64_t v14 = BKLogMousePointer();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v24 = [v5 senderID];
      int v25 = 134217984;
      id v26 = v24;
      _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "    ignored translation from conflicting sender %llX", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)addRotationEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v5 = a4;
  IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  double v7 = v6;
  kdebug_trace();
  kdebug_trace();
  double v8 = BKLogMousePointer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = BKNSStringFromIOHIDEventPhase();
    int v21 = 138543618;
    id v22 = v19;
    __int16 v23 = 2048;
    double v24 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, " -> rotation phase:%{public}@ %g", (uint8_t *)&v21, 0x16u);
  }
  int Phase = IOHIDEventGetPhase();
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  if (sub_10008602C((uint64_t)&self->_rotationPhaseTracker, Phase, v5, TimeStamp))
  {
    self->_eventTypeMask |= 0x20uLL;
    if ((self->_interpolateEventTypeMask & 0x20) != 0)
    {
      uint64_t v12 = [(BKMouseEventAccumulator *)self _eventStateForSender:v5];
      CGFloat v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = *(void **)(v12 + 72);
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;
      uint64_t v16 = IOHIDEventGetTimeStamp();
      double v17 = sub_100086C00((uint64_t)v15);
      sub_100086C9C((uint64_t)&self->_rotationInterpolator, v16, v17);
      double p1 = self->_rotationInterpolator._z._p1;
      self->_rotationInterpolator._z._p0 = p1;
      self->_rotationInterpolator._z._double p1 = v7 + p1;
      self->_rotationInterpolator._remainingInterpolations = 3;
    }
    else
    {
      self->_rotationZ = v7 + self->_rotationZ;
    }
  }
  else
  {
    uint64_t v11 = BKLogMousePointer();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [v5 senderID];
      int v21 = 134217984;
      id v22 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "    ignored rotation from conflicting sender %llX", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)addScaleEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v5 = a4;
  IOHIDEventGetPhase();
  IOHIDEventGetFloatValue();
  double v7 = v6;
  kdebug_trace();
  kdebug_trace();
  double v8 = BKLogMousePointer();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = BKNSStringFromIOHIDEventPhase();
    int v21 = 138543618;
    id v22 = v19;
    __int16 v23 = 2048;
    double v24 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, " -> scale phase:%{public}@ %g", (uint8_t *)&v21, 0x16u);
  }
  int Phase = IOHIDEventGetPhase();
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  if (sub_100086268((uint64_t)&self->_scalePhaseTracker, Phase, v5, TimeStamp))
  {
    self->_eventTypeMask |= 0x80uLL;
    if ((self->_interpolateEventTypeMask & 0x80) != 0)
    {
      uint64_t v12 = [(BKMouseEventAccumulator *)self _eventStateForSender:v5];
      CGFloat v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = *(void **)(v12 + 72);
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;
      uint64_t v16 = IOHIDEventGetTimeStamp();
      double v17 = sub_100086C00((uint64_t)v15);
      sub_100086C9C((uint64_t)&self->_scaleInterpolator, v16, v17);
      double p1 = self->_scaleInterpolator._z._p1;
      self->_scaleInterpolator._z._p0 = p1;
      self->_scaleInterpolator._z._double p1 = v7 + p1;
      self->_scaleInterpolator._remainingInterpolations = 3;
    }
    else
    {
      self->_scaleZ = v7 + self->_scaleZ;
    }
  }
  else
  {
    uint64_t v11 = BKLogMousePointer();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [v5 senderID];
      int v21 = 134217984;
      id v22 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "    ignored scale from conflicting sender %llX", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)addDigitizerEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v66 = a4;
  id v4 = BKLogMousePointer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    IOHIDEventGetFloatValue();
    v56 = v55;
    IOHIDEventGetFloatValue();
    *(_DWORD *)v95 = 134218240;
    id v96 = v56;
    __int16 v97 = 2048;
    v98 = v57;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, " -> digitizer %g,%g", v95, 0x16u);
  }

  self->_eventTypeMask |= 0x800uLL;
  if (!self->_digitizerEvents)
  {
    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    digitizerEvents = self->_digitizerEvents;
    self->_digitizerEvents = v5;
  }
  Copdouble y = (const void *)IOHIDEventCreateCopy();
  [(NSMutableArray *)self->_digitizerEvents addObject:Copy];
  CFRelease(Copy);
  double v8 = [(BKMouseEventAccumulator *)self _eventStateForSender:v66];
  v77 = v8;
  if (v8)
  {
    if (IOHIDEventGetType() != 11)
    {
      id v70 = +[NSString stringWithFormat:@"need digitizer event"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector("updateFromDigitizerEvent:");
        id v61 = (id)objc_claimAutoreleasedReturnValue();
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        *(_DWORD *)v95 = 138544642;
        id v96 = v61;
        __int16 v97 = 2114;
        v98 = v63;
        __int16 v99 = 2048;
        v100 = v8;
        __int16 v101 = 2114;
        CFStringRef v102 = @"BKMousePointerEventAccumulator.mm";
        __int16 v103 = 1024;
        int v104 = 509;
        __int16 v105 = 2114;
        id v106 = v70;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v95, 0x3Au);
      }
      [v70 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100087D4CLL);
    }
    id v69 = objc_alloc_init((Class)NSMutableIndexSet);
    double v9 = sub_100087F08((uint64_t)v8);
    id v65 = [v9 copy];

    uint64_t IntegerValue = IOHIDEventGetIntegerValue();
    IOHIDEventGetChildren();
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (char *)[obj countByEnumeratingWithState:&v80 objects:v95 count:16];
    if (v10)
    {
      uint64_t v73 = *(void *)v81;
      *(void *)&long long v11 = 134219522;
      long long v64 = v11;
      do
      {
        uint64_t v12 = 0;
        v74 = v10;
        do
        {
          if (*(void *)v81 != v73) {
            objc_enumerationMutation(obj);
          }
          if (IOHIDEventGetType() == 11)
          {
            unsigned int v13 = IOHIDEventGetIntegerValue();
            uint64_t v14 = IOHIDEventGetIntegerValue();
            uint64_t v15 = IOHIDEventGetIntegerValue();
            uint64_t v16 = IOHIDEventGetIntegerValue();
            unsigned int v17 = [v77[5] containsIndex:v14];
            unsigned int log = [v77[6] containsIndex:v14];
            unsigned int v72 = [v77[8] containsIndex:v14];
            if ((v13 & 0x80) != 0)
            {
              [v77[6] removeIndex:v14];
              [v77[5] removeIndex:v14];
              [v77[8] removeIndex:v14];
              unsigned int v21 = 0;
              if (!v16)
              {
                int v29 = 0;
                BOOL v31 = 0;
                goto LABEL_33;
              }
              int v27 = 1;
              int v29 = 0;
              BOOL v18 = 0;
            }
            else
            {
              BOOL v18 = log;
              if (v13)
              {
                uint64_t v19 = sub_100087FA4(v15 != 0, v14, v77[6]);
                id v20 = v77[6];
                v77[6] = (id)v19;

                BOOL v18 = v15 != 0;
              }
              unsigned int v21 = v17;
              if ((v13 & 2) != 0)
              {
                if (v16) {
                  unsigned int v22 = v17;
                }
                else {
                  unsigned int v22 = 0;
                }
                if (v22 == 1)
                {
                  __int16 v23 = BKLogMousePointer();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    id v47 = [v77[3] senderID];
                    *(_DWORD *)buf = 134218496;
                    id v85 = v47;
                    __int16 v86 = 2048;
                    uint64_t v87 = IntegerValue;
                    __int16 v88 = 1024;
                    *(_DWORD *)v89 = v14;
                    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "sender %llX gen %ld path %d received touch down, but was already down", buf, 0x1Cu);
                  }
                }
                uint64_t v24 = sub_100087FA4(v16 != 0, v14, v77[5]);
                id v25 = v77[5];
                v77[5] = (id)v24;

                unsigned int v21 = v16 != 0;
              }
              uint64_t v26 = sub_100087FA4(v21 & ((unsigned __int16)(v13 & 0x200) >> 9), v14, v77[8]);
              int v27 = v16 != 0;
              id v28 = v77[8];
              v77[8] = (id)v26;

              int v29 = (v13 >> 9) & 1;
              if (v27 == v21)
              {
LABEL_32:
                BOOL v31 = v18;
LABEL_33:
                if (v17 != v21 || ((log ^ v31) & 1) != 0 || v72 != v29)
                {
                  uint64_t v34 = BKLogMousePointer();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    loga = v34;
                    id v41 = [v77[3] senderID];
                    sub_100088030();
                    id v42 = (id)objc_claimAutoreleasedReturnValue();
                    sub_1000881A8(v77[5]);
                    id v43 = (id)objc_claimAutoreleasedReturnValue();
                    sub_1000881A8(v77[6]);
                    id v44 = (id)objc_claimAutoreleasedReturnValue();
                    v45 = sub_1000881A8(v77[8]);
                    *(_DWORD *)buf = 134220290;
                    id v85 = v41;
                    __int16 v86 = 2048;
                    uint64_t v87 = IntegerValue;
                    __int16 v88 = 1024;
                    *(_DWORD *)v89 = v14;
                    *(_WORD *)&v89[4] = 1024;
                    *(_DWORD *)&v89[6] = v21;
                    *(_WORD *)&v89[10] = 1024;
                    *(_DWORD *)&v89[12] = v31;
                    *(_WORD *)&v89[16] = 1024;
                    *(_DWORD *)&v89[18] = v21 & v29;
                    *(_WORD *)&v89[22] = 2114;
                    *(void *)v90 = v42;
                    *(_WORD *)&v90[8] = 2114;
                    *(void *)v91 = v43;
                    *(_WORD *)&v91[8] = 2114;
                    id v92 = v44;
                    __int16 v93 = 2114;
                    v94 = v45;
                    uint64_t v34 = loga;
                    _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "sender %llX gen %ld path %d now touching:%{BOOL}u in-range:%{BOOL}u resting:%{BOOL}u (%{public}@) -- down:{%{public}@} range:{%{public}@} rest:{%{public}@}", buf, 0x56u);
                  }
LABEL_45:
                }
                else if (([v77[5] containsIndex:v14] & 1) == 0)
                {
                  unsigned __int8 v32 = [v77[6] containsIndex:v14];
                  char v33 = v13 == 32 ? 1 : v32;
                  if ((v33 & 1) == 0)
                  {
                    uint64_t v34 = BKLogMousePointer();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    {
                      v35 = v34;
                      id v36 = [v77[3] senderID];
                      sub_100088030();
                      id v37 = (id)objc_claimAutoreleasedReturnValue();
                      sub_1000881A8(v77[5]);
                      id v38 = (id)objc_claimAutoreleasedReturnValue();
                      sub_1000881A8(v77[6]);
                      id v39 = (id)objc_claimAutoreleasedReturnValue();
                      v40 = sub_1000881A8(v77[8]);
                      *(_DWORD *)buf = v64;
                      id v85 = v36;
                      __int16 v86 = 2048;
                      uint64_t v87 = IntegerValue;
                      __int16 v88 = 1024;
                      *(_DWORD *)v89 = v14;
                      *(_WORD *)&v89[4] = 2114;
                      *(void *)&v89[6] = v37;
                      *(_WORD *)&v89[14] = 2114;
                      *(void *)&v89[16] = v38;
                      *(_WORD *)v90 = 2114;
                      *(void *)&v90[2] = v39;
                      *(_WORD *)v91 = 2114;
                      *(void *)&v91[2] = v40;
                      uint64_t v34 = v35;
                      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "received event from sender %llX gen %ld for path %d -- not touching or in range (%{public}@) -- down:{%{public}@} range:{%{public}@} rest:{%{public}@}", buf, 0x44u);
                    }
                    goto LABEL_45;
                  }
                }
                [v69 addIndex:v14, v64];
                goto LABEL_47;
              }
            }
            double v30 = BKLogMousePointer();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              id v46 = [v77[3] senderID];
              *(_DWORD *)buf = 134219008;
              id v85 = v46;
              __int16 v86 = 2048;
              uint64_t v87 = IntegerValue;
              __int16 v88 = 1024;
              *(_DWORD *)v89 = v14;
              *(_WORD *)&v89[4] = 1024;
              *(_DWORD *)&v89[6] = v21;
              *(_WORD *)&v89[10] = 1024;
              *(_DWORD *)&v89[12] = v27;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "sender %llX gen %ld path %d touch state mismatch:%{BOOL}u event:%{BOOL}u", buf, 0x28u);
            }

            goto LABEL_32;
          }
LABEL_47:
          ++v12;
        }
        while (v74 != v12);
        v48 = (char *)[obj countByEnumeratingWithState:&v80 objects:v95 count:16];
        uint64_t v10 = v48;
      }
      while (v48);
    }

    uint64_t v49 = (uint64_t)v77;
    id v50 = v77[5];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000882E4;
    v78[3] = &unk_1000F8380;
    id v51 = v69;
    id v79 = v51;
    v52 = [v50 indexesPassingTest:v78];
    if ([v52 count])
    {
      v53 = BKLogMousePointer();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        id v58 = [v77[3] senderID];
        v59 = sub_1000881A8(v52);
        v60 = BKSHIDEventGetConciseDescription();
        *(_DWORD *)buf = 134218754;
        id v85 = v58;
        __int16 v86 = 2048;
        uint64_t v87 = IntegerValue;
        __int16 v88 = 2114;
        *(void *)v89 = v59;
        *(_WORD *)&v89[8] = 2114;
        *(void *)&v89[10] = v60;
        _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "sender %llX gen %ld missing expected touching paths:{%{public}@} event:%{public}@", buf, 0x2Au);
      }
      uint64_t v49 = (uint64_t)v77;
    }
    v54 = sub_100087F08(v49);
    [v65 isEqualToIndexSet:v54];

    double v8 = v77;
  }
  [(BKMouseEventAccumulator *)self _updateTouchingPathIndexesFromDeviceEventState];
}

- (void)_updateTouchingPathIndexesFromDeviceEventState
{
  v3 = [(NSMutableDictionary *)self->_eventStateBySenderID allValues];
  id v4 = +[NSMutableIndexSet indexSet];
  [v3 bs_reduce:v4 block:&stru_1000F8400];
  id obj = (id)objc_claimAutoreleasedReturnValue();

  p_touchingPathIndexes = &self->_touchingPathIndexes;
  if (!self->_touchingPathIndexes)
  {
    uint64_t v6 = +[NSMutableIndexSet indexSet];
    double v7 = *p_touchingPathIndexes;
    *p_touchingPathIndexes = (NSIndexSet *)v6;
  }
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_touchingPathIndexes, obj);
    self->_touchingPathIndexesDidChange = 1;
  }
}

- (void)addButtonEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v15 = a4;
  uint64_t v5 = -[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:");
  uint64_t v6 = (unsigned char *)v5;
  if (v5) {
    uint64_t v7 = *(void *)(v5 + 32);
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t IntegerValue = IOHIDEventGetIntegerValue();
  unint64_t v9 = IntegerValue;
  if (v6 && self->_shouldSwapPrimaryAndSecondaryButtons && v6[17]) {
    unint64_t v9 = IntegerValue & 0xFFFFFFFFFFFFFFFCLL | (2 * (IntegerValue & 1)) | (IntegerValue >> 1) & 1;
  }
  uint64_t v10 = 0;
  do
  {
    uint64_t v11 = v10 + 1;
    uint64_t v12 = 1 << v10;
    BOOL v13 = (v12 & v7) == 0;
    unint64_t v14 = v12 & v9;
    if (((v13 ^ (v14 != 0)) & 1) == 0) {
      [(BKMouseEventAccumulator *)self addButtonNumber:v11 down:v14 != 0 fromSender:v15];
    }
    uint64_t v10 = v11;
  }
  while (v11 != 32);
}

- (void)setShouldSwapPrimaryAndSecondaryButtons:(BOOL)a3
{
  if (self->_shouldSwapPrimaryAndSecondaryButtons != a3)
  {
    self->_shouldSwapPrimaryAndSecondaryButtons = a3;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = [(NSMutableDictionary *)self->_eventStateBySenderID allValues];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * (void)v6);
          if (v7)
          {
            if (*(unsigned char *)(v7 + 17)) {
              *(void *)(v7 + 32) = *(void *)(v7 + 32) & 0xFFFFFFFFFFFFFFFCLL | (2 * (*(void *)(v7 + 32) & 1)) | (*(void *)(v7 + 32) >> 1) & 1;
            }
          }
          uint64_t v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)addButtonNumber:(int64_t)a3 down:(BOOL)a4 fromSender:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  long long v9 = BKLogMousePointer();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v31 = a3;
    __int16 v32 = 1024;
    BOOL v33 = v5;
    __int16 v34 = 2048;
    id v35 = [v8 senderID];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "  ->  button number:%d down:%{BOOL}u (sender %llX)", buf, 0x18u);
  }

  self->_eventTypeMask |= 4uLL;
  if (!self->_buttonEvents)
  {
    long long v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    buttonEvents = self->_buttonEvents;
    self->_buttonEvents = v10;
  }
  uint64_t v12 = [(BKMouseEventAccumulator *)self _eventStateForSender:v8];
  BOOL v13 = (id *)v12;
  if (v12)
  {
    uint64_t v14 = *(void *)(v12 + 32);
    uint64_t v15 = 1 << (a3 - 1);
    uint64_t v16 = v14 | v15;
    uint64_t v17 = v14 & ~v15;
    if (v5) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v17;
    }
    *(void *)(v12 + 32) = v18;
  }
  else if (v5)
  {
    uint64_t v18 = 1 << (a3 - 1);
  }
  else
  {
    uint64_t v18 = 0;
  }
  uint64_t v19 = sub_100087F08(v12);
  if (v13) {
    objc_storeStrong(v13 + 7, v19);
  }

  id v20 = self->_buttonEvents;
  unsigned int v21 = +[NSNumber numberWithInteger:a3];
  v29[0] = v21;
  unsigned int v22 = +[NSNumber numberWithBool:v5];
  v29[1] = v22;
  __int16 v23 = +[NSNumber numberWithInteger:v18];
  v29[2] = v23;
  uint64_t v24 = +[NSArray arrayWithObjects:v29 count:3];
  [(NSMutableArray *)v20 addObject:v24];

  kdebug_trace();
  id v25 = [(NSMutableDictionary *)self->_eventStateBySenderID allValues];
  uint64_t v26 = [v25 bs_reduce:&off_100103700 block:&stru_1000F83C0];

  unsigned int v27 = [v26 unsignedIntValue];
  unsigned int buttonMask = self->_buttonMask;
  self->_buttonMaskDidChange = buttonMask != v27;
  self->_previousButtonMask = buttonMask;
  self->_unsigned int buttonMask = v27;
  [(BKMouseEventAccumulator *)self _updateTouchingPathIndexesFromDeviceEventState];
}

- (BOOL)senderPostsAtHighFrequency:(unint64_t)a3
{
  if (self->_shouldUseButtonDownRecenteringBehavior) {
    return 0;
  }
  eventStateBySenderID = self->_eventStateBySenderID;
  BOOL v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v6 = [(NSMutableDictionary *)eventStateBySenderID objectForKeyedSubscript:v5];

  if (v6) {
    BOOL v3 = sub_100086C00(v6[9]) < 0.0111111111;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)deviceServiceDidTerminate:(id)a3
{
  id v12 = a3;
  id v4 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 senderID]);
  doomedSenderIDs = self->_doomedSenderIDs;
  if (!doomedSenderIDs)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uint64_t v7 = self->_doomedSenderIDs;
    self->_doomedSenderIDs = v6;

    doomedSenderIDs = self->_doomedSenderIDs;
  }
  [(NSMutableSet *)doomedSenderIDs addObject:v4];
  [(BKMouseEventAccumulator *)self _terminateAllGesturesForSender:v12];
  uint64_t v8 = [(NSMutableDictionary *)self->_eventStateBySenderID objectForKeyedSubscript:v4];
  long long v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = *(void *)(v8 + 32);
    if (v10)
    {
      for (uint64_t i = 1; i != 32; ++i)
      {
        if ((v10 & (1 << (i - 1))) != 0) {
          [(BKMouseEventAccumulator *)self addButtonNumber:i down:0 fromSender:v12];
        }
      }
    }
  }
}

- (void)deviceServiceDidAppear:(id)a3
{
  id v3 = [(BKMouseEventAccumulator *)self _eventStateForSender:a3];
}

- (void)frameDidEnd
{
  unint64_t v3 = (unint64_t)(self->_pointerInterpolator._interpolator._remainingInterpolations > 0) << 17;
  self->_eventTypeMask = v3;
  if (self->_scrollInterpolator._interpolator._remainingInterpolations < 1)
  {
    if ((self->_scrollPhaseTracker._inputPhase & 0xC) != 0
      && self->_scrollPhaseTracker._eventSender
      && self->_scrollPhaseTracker._outputPhase)
    {
      *(_OWORD *)&self->_scrollInterpolator._interpolator._y._pN = 0u;
      self->_scrollInterpolator._accelerationFactor = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._x._double p1 = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._y._p0 = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._time._eventTimestamp = 0u;
      *(_OWORD *)&self->_scrollInterpolator._interpolator._time._eventDeltaTimestamp = 0u;
      uint64_t v24 = BKLogMousePointer();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        int v30 = 138543362;
        uint64_t Name = IOHIDEventTypeGetName();
        _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v30, 0xCu);
      }

      eventSender = self->_scrollPhaseTracker._eventSender;
      self->_scrollPhaseTracker._eventSender = 0;

      *(_DWORD *)&self->_scrollPhaseTracker._inputint Phase = 0;
      self->_scrollPhaseTracker._sentTerminalEvent = 0;
    }
  }
  else
  {
    self->_eventTypeMask = v3 | 0x40;
  }
  if ((self->_scalePhaseTracker._inputPhase & 0xC) != 0
    && self->_scalePhaseTracker._eventSender
    && self->_scalePhaseTracker._outputPhase)
  {
    id v4 = BKLogMousePointer();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = IOHIDEventTypeGetName();
      int v30 = 138543362;
      uint64_t Name = v26;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v30, 0xCu);
    }

    BOOL v5 = self->_scalePhaseTracker._eventSender;
    self->_scalePhaseTracker._eventSender = 0;

    *(_DWORD *)&self->_scalePhaseTracker._inputint Phase = 0;
    self->_scalePhaseTracker._sentTerminalEvent = 0;
  }
  if ((self->_rotationPhaseTracker._inputPhase & 0xC) != 0
    && self->_rotationPhaseTracker._eventSender
    && self->_rotationPhaseTracker._outputPhase)
  {
    uint64_t v6 = BKLogMousePointer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = IOHIDEventTypeGetName();
      int v30 = 138543362;
      uint64_t Name = v27;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v30, 0xCu);
    }

    uint64_t v7 = self->_rotationPhaseTracker._eventSender;
    self->_rotationPhaseTracker._eventSender = 0;

    *(_DWORD *)&self->_rotationPhaseTracker._inputint Phase = 0;
    self->_rotationPhaseTracker._sentTerminalEvent = 0;
  }
  if ((self->_translationPhaseTracker._inputPhase & 0xC) != 0
    && self->_translationPhaseTracker._eventSender
    && self->_translationPhaseTracker._outputPhase)
  {
    uint64_t v8 = BKLogMousePointer();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = IOHIDEventTypeGetName();
      int v30 = 138543362;
      uint64_t Name = v28;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "unlocking %{public}@ event sender (end)", (uint8_t *)&v30, 0xCu);
    }

    long long v9 = self->_translationPhaseTracker._eventSender;
    self->_translationPhaseTracker._eventSender = 0;

    *(_DWORD *)&self->_translationPhaseTracker._inputint Phase = 0;
    self->_translationPhaseTracker._sentTerminalEvent = 0;
  }
  self->_translationDelta.double x = 0.0;
  self->_translationDelta.double y = 0.0;
  self->_rotationZ = 0.0;
  self->_scaleZ = 0.0;
  self->_pointerUnacceleratedDelta = 0u;
  self->_pointerAcceleratedDelta = 0u;
  self->_scrollUnacceleratedDelta = 0u;
  self->_scrollAcceleratedDelta = 0u;
  buttonEvents = self->_buttonEvents;
  self->_buttonEvents = 0;

  digitizerEvents = self->_digitizerEvents;
  self->_digitizerEvents = 0;

  *(_WORD *)&self->_touchingPathIndexesDidChange = 0;
  self->_scrollPhaseDidChange = 0;
  self->_shouldUseButtonDownRecenteringBehavior = 0;
  self->_forceDidChange = 0;
  forceEvent = self->_forceEvent;
  if (forceEvent)
  {
    CFRelease(forceEvent);
    self->_forceEvent = 0;
  }
  if ([(NSMutableSet *)self->_doomedSenderIDs count])
  {
    eventStateBySenderID = self->_eventStateBySenderID;
    uint64_t v14 = [(NSMutableSet *)self->_doomedSenderIDs allObjects];
    [(NSMutableDictionary *)eventStateBySenderID removeObjectsForKeys:v14];

    mostRecentSender = self->_mostRecentSender;
    if (mostRecentSender)
    {
      doomedSenderIDs = self->_doomedSenderIDs;
      uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:[(BKHIDEventSenderInfo *)mostRecentSender senderID]];
      LODWORD(doomedSenderIDs) = [(NSMutableSet *)doomedSenderIDs containsObject:v17];

      if (doomedSenderIDs)
      {
        if ([(NSMutableDictionary *)self->_eventStateBySenderID count])
        {
          uint64_t v18 = [(NSMutableDictionary *)self->_eventStateBySenderID allValues];
          uint64_t v19 = [v18 lastObject];
          id v20 = (void *)v19;
          if (v19) {
            unsigned int v21 = *(void **)(v19 + 24);
          }
          else {
            unsigned int v21 = 0;
          }
          objc_storeStrong((id *)&self->_mostRecentSender, v21);
        }
        unsigned int v22 = BKLogMousePointer();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          int v29 = self->_mostRecentSender;
          int v30 = 138543362;
          uint64_t Name = (uint64_t)v29;
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "fixup mostRecentSender:%{public}@", (uint8_t *)&v30, 0xCu);
        }
      }
    }
    __int16 v23 = self->_doomedSenderIDs;
    self->_doomedSenderIDs = 0;
  }
}

- (void)frameWillBegin
{
  mach_absolute_time();
  if (self->_pointerInterpolator._interpolator._remainingInterpolations >= 1
    && (self->_interpolateEventTypeMask & 0x20000) != 0)
  {
    sub_1000893D0((uint64_t)&self->_pointerInterpolator);
    self->_pointerUnacceleratedDelta.double x = v3.f64[0];
    self->_pointerUnacceleratedDelta.double y = v4;
    v3.f64[1] = v4;
    self->_pointerAcceleratedDelta = (CGPoint)vmulq_f64(v3, (float64x2_t)self->_pointerInterpolator._accelerationFactor);
  }
  if (self->_scrollInterpolator._interpolator._remainingInterpolations >= 1
    && (self->_interpolateEventTypeMask & 0x40) != 0)
  {
    sub_1000893D0((uint64_t)&self->_scrollInterpolator);
    self->_scrollUnacceleratedDelta.double x = v5.f64[0];
    self->_scrollUnacceleratedDelta.double y = v6;
    v5.f64[1] = v6;
    self->_scrollAcceleratedDelta = (CGPoint)vmulq_f64(v5, (float64x2_t)self->_scrollInterpolator._accelerationFactor);
  }
  if (self->_scaleInterpolator._remainingInterpolations >= 1 && (self->_interpolateEventTypeMask & 0x80) != 0) {
    self->_scaleZ = sub_100089314((uint64_t)&self->_scaleInterpolator);
  }
  if (self->_translationInterpolator._remainingInterpolations >= 1 && (self->_interpolateEventTypeMask & 0x10) != 0)
  {
    sub_1000893D0((uint64_t)&self->_translationInterpolator);
    self->_translationDelta.double x = v7;
    self->_translationDelta.double y = v8;
  }
  if (self->_rotationInterpolator._remainingInterpolations >= 1 && (self->_interpolateEventTypeMask & 0x20) != 0) {
    self->_rotationZ = sub_100089314((uint64_t)&self->_rotationInterpolator);
  }
  self->_scrollPhaseTracker._sentTerminalEvent = 0;
  if (self->_scrollPhaseTracker._reportBeganPhase)
  {
    self->_scrollPhaseTracker._outputint Phase = 1;
    self->_scrollPhaseTracker._reportBeganint Phase = 0;
  }
  else
  {
    inputint Phase = self->_scrollPhaseTracker._inputPhase;
    if (inputPhase) {
      inputint Phase = 2;
    }
    self->_scrollPhaseTracker._outputint Phase = inputPhase;
  }
  self->_rotationPhaseTracker._sentTerminalEvent = 0;
  if (self->_rotationPhaseTracker._reportBeganPhase)
  {
    self->_rotationPhaseTracker._outputint Phase = 1;
    self->_rotationPhaseTracker._reportBeganint Phase = 0;
  }
  else
  {
    unsigned __int16 v10 = self->_rotationPhaseTracker._inputPhase;
    if (v10) {
      unsigned __int16 v10 = 2;
    }
    self->_rotationPhaseTracker._outputint Phase = v10;
  }
  self->_translationPhaseTracker._sentTerminalEvent = 0;
  if (self->_translationPhaseTracker._reportBeganPhase)
  {
    self->_translationPhaseTracker._outputint Phase = 1;
    self->_translationPhaseTracker._reportBeganint Phase = 0;
  }
  else
  {
    unsigned __int16 v11 = self->_translationPhaseTracker._inputPhase;
    if (v11) {
      unsigned __int16 v11 = 2;
    }
    self->_translationPhaseTracker._outputint Phase = v11;
  }
  self->_scalePhaseTracker._sentTerminalEvent = 0;
  if (self->_scalePhaseTracker._reportBeganPhase)
  {
    self->_scalePhaseTracker._outputint Phase = 1;
    self->_scalePhaseTracker._reportBeganint Phase = 0;
  }
  else
  {
    unsigned __int16 v12 = self->_scalePhaseTracker._inputPhase;
    if (v12) {
      unsigned __int16 v12 = 2;
    }
    self->_scalePhaseTracker._outputint Phase = v12;
  }
}

- (void)nextEvent
{
  self->_eventTypeMask = 0;
  self->_previousButtonMask = self->_buttonMask;
  if ((self->_interpolateEventTypeMask & 0x40) != 0
    && (self->_scrollPhaseTracker._inputPhase & 0xC) != 0
    && self->_scrollPhaseTracker._eventSender
    && self->_scrollPhaseTracker._outputPhase
    && !self->_scrollPhaseTracker._sentTerminalEvent)
  {
    self->_eventTypeMask = 64;
    self->_scrollPhaseTracker._sentTerminalEvent = 1;
  }
}

- (void)appendSubeventsForEventTypeMask:(unint64_t)a3 toTopLevelEvent:(__IOHIDEvent *)a4 interfaceOrientation:(int64_t)a5 getEventSummary:(unint64_t *)a6
{
  IOHIDEventSetIntegerValue();
  if (a6) {
    *a6 = 0;
  }
  unint64_t v8 = self->_eventTypeMask & a3;
  if (v8)
  {
    IOHIDEventGetTimeStamp();
    IOHIDEventGetSenderID();
    unint64_t v32 = v8;
    if ((v8 & 0x40) != 0)
    {
      outputint Phase = self->_scrollPhaseTracker._outputPhase;
      ScrollEvent = (const void *)IOHIDEventCreateScrollEvent();
      IOHIDEventSetSenderID();
      IOHIDEventSetPhase();
      unsigned __int16 v11 = (const void *)IOHIDEventCreateScrollEvent();
      IOHIDEventSetSenderID();
      IOHIDEventSetPhase();
      IOHIDEventAppendEvent();
      CFRelease(v11);
      IOHIDEventAppendEvent();
      CFRelease(ScrollEvent);
      if (a6)
      {
        if ((outputPhase & 0xC) != 0) {
          *a6 |= 2uLL;
        }
      }
    }
    if ((v32 & 0x20) != 0)
    {
      RotationEvent = (const void *)IOHIDEventCreateRotationEvent();
      IOHIDEventSetSenderID();
      unsigned __int16 v13 = self->_rotationPhaseTracker._outputPhase;
      IOHIDEventSetPhase();
      IOHIDEventAppendEvent();
      CFRelease(RotationEvent);
      if (a6)
      {
        if ((v13 & 0xC) != 0) {
          *a6 |= 0x10uLL;
        }
      }
    }
    if ((v32 & 0x80) != 0)
    {
      ScaleEvent = (const void *)IOHIDEventCreateScaleEvent();
      IOHIDEventSetSenderID();
      unsigned __int16 v15 = self->_scalePhaseTracker._outputPhase;
      IOHIDEventSetPhase();
      IOHIDEventAppendEvent();
      CFRelease(ScaleEvent);
      if (a6)
      {
        if ((v15 & 0xC) != 0) {
          *a6 |= 4uLL;
        }
      }
    }
    if ((v32 & 0x10) != 0)
    {
      TranslationEvent = (const void *)IOHIDEventCreateTranslationEvent();
      IOHIDEventSetSenderID();
      unsigned __int16 v17 = self->_translationPhaseTracker._outputPhase;
      IOHIDEventSetPhase();
      IOHIDEventAppendEvent();
      CFRelease(TranslationEvent);
      if (a6)
      {
        if ((v17 & 0xC) != 0) {
          *a6 |= 8uLL;
        }
      }
    }
    if ((v32 & 4) != 0 && !self->_shouldUseButtonDownRecenteringBehavior)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = self->_buttonEvents;
      id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v18; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v41 != v19) {
              objc_enumerationMutation(obj);
            }
            unsigned int v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            unsigned int v22 = [v21 objectAtIndexedSubscript:0];
            [v22 integerValue];

            __int16 v23 = [v21 objectAtIndexedSubscript:1];
            unsigned __int8 v24 = [v23 BOOLValue];

            id v25 = [v21 objectAtIndexedSubscript:2];
            [v25 unsignedIntValue];

            ButtonEvent = (const void *)IOHIDEventCreateButtonEvent();
            IOHIDEventSetSenderID();
            IOHIDEventSetIntegerValue();
            IOHIDEventSetIntegerValue();
            IOHIDEventSetIntegerValue();
            IOHIDEventAppendEvent();
            CFRelease(ButtonEvent);
            if (a6) {
              char v27 = v24;
            }
            else {
              char v27 = 1;
            }
            if ((v27 & 1) == 0) {
              *a6 |= 0x20uLL;
            }
          }
          id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v18);
      }
    }
    unint64_t v28 = v32;
    if ((v32 & 0x800) != 0)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      obja = self->_digitizerEvents;
      int v29 = (char *)[(NSMutableArray *)obja countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v37;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(void *)v37 != v30) {
              objc_enumerationMutation(obja);
            }
            IOHIDEventAppendEvent();
            if (a6 && (IOHIDEventGetIntegerValue() & 2) != 0 && !IOHIDEventGetIntegerValue()) {
              *a6 |= 0x40uLL;
            }
          }
          int v29 = (char *)[(NSMutableArray *)obja countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v29);
      }

      unint64_t v28 = v32;
    }
    if ((v28 & 0x20000000002) != 0)
    {
      if (self->_forceEvent) {
        IOHIDEventAppendEvent();
      }
    }
  }
}

- (void)addTopLevelEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->_mostRecentSender, a4);
  self->_lastRemoteEventTimestamp = BKSHIDEventGetRemoteTimestamp();
  if (IOHIDEventGetType() != 17)
  {
    v55 = +[NSString stringWithFormat:@"you know better"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v56 = (id)objc_claimAutoreleasedReturnValue();
      v57 = (objc_class *)objc_opt_class();
      id v58 = NSStringFromClass(v57);
      *(_DWORD *)id v66 = 138544642;
      *(void *)&v66[4] = v56;
      *(_WORD *)&v66[12] = 2114;
      *(void *)&v66[14] = v58;
      __int16 v67 = 2048;
      v68 = self;
      __int16 v69 = 2114;
      CFStringRef v70 = @"BKMousePointerEventAccumulator.mm";
      __int16 v71 = 1024;
      int v72 = 931;
      __int16 v73 = 2114;
      v74 = v55;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v66, 0x3Au);
    }
    [v55 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10008A400);
  }
  BOOL v8 = [(BKMouseEventAccumulator *)self isSenderLocked] || self->_buttonMask != 0;
  BOOL v59 = v8;
  IOHIDEventGetFloatValue();
  double v10 = v9;
  IOHIDEventGetFloatValue();
  double v12 = v11;
  kdebug_trace();
  self->_eventTypeMask |= 0x20000uLL;
  uint64_t v13 = [(BKMouseEventAccumulator *)self _eventStateForSender:v7];
  uint64_t v14 = v13;
  v60 = (uint64_t *)v13;
  if (v13)
  {
    if (!*(void *)(v13 + 72))
    {
      unsigned __int16 v15 = [_BKMovingMedian alloc];
      if (v15)
      {
        *(void *)id v66 = v15;
        *(void *)&v66[8] = _BKMovingMedian;
        uint64_t v16 = [super init];
        unsigned __int16 v17 = v16;
        if (v16)
        {
          v16[1] = 100;
          id v18 = [objc_alloc((Class)NSMutableArray) initWithCapacity:100];
          uint64_t v19 = (void *)v17[2];
          v17[2] = v18;

          id v20 = [objc_alloc((Class)NSMutableArray) initWithCapacity:100];
          unsigned int v21 = (void *)v17[3];
          v17[3] = v20;
        }
      }
      else
      {
        unsigned __int16 v17 = 0;
      }
      unsigned int v22 = (void *)v60[9];
      v60[9] = (uint64_t)v17;

      uint64_t v14 = (uint64_t)v60;
      sub_10008A5A0(v60[9], 0.01499925);
    }
    uint64_t TimeStamp = IOHIDEventGetTimeStamp();
    BSMonotonicReferencedTimeFromMachTime();
    double v25 = v24;
    *(void *)(v14 + 8) = TimeStamp;
    double v26 = sub_100086C00(*(void *)(v14 + 72));
    if (v25 / v26 > 0.2 && v25 / v26 < 5.0)
    {
      sub_10008A5A0(*(void *)(v14 + 72), v25);
      kdebug_trace();
      unint64_t v28 = BKLogMousePointer();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v66 = 134218240;
        *(double *)&v66[4] = v26 * 1000.0;
        *(_WORD *)&v66[12] = 2048;
        *(double *)&v66[14] = v25 * 1000.0;
        int v29 = "updatePeriodFromEvent: period:%g - delta: %g";
        goto LABEL_68;
      }
    }
    else
    {
      unint64_t v28 = BKLogMousePointer();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v66 = 134218240;
        *(double *)&v66[4] = v26 * 1000.0;
        *(_WORD *)&v66[12] = 2048;
        *(double *)&v66[14] = v25 * 1000.0;
        int v29 = "updatePeriodFromEvent: period:%g - delta: %g - outlier filtered";
LABEL_68:
        _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, v29, v66, 0x16u);
      }
    }
  }
  IOHIDEventGetChildren();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = [v30 countByEnumeratingWithState:&v61 objects:v65 count:16];
  double v32 = v10;
  double v33 = v12;
  if (v31)
  {
    uint64_t v34 = *(void *)v62;
    double v32 = v10;
    double v33 = v12;
    do
    {
      for (uint64_t i = 0; i != v31; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v62 != v34) {
          objc_enumerationMutation(v30);
        }
        uint64_t v36 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        int Type = IOHIDEventGetType();
        switch(Type)
        {
          case 1:
            uint64_t IntegerValue = IOHIDEventGetIntegerValue();
            uint64_t v39 = IOHIDEventGetIntegerValue();
            if (IntegerValue == 65280 && v39 == 17) {
              goto LABEL_32;
            }
            break;
          case 2:
            [(BKMouseEventAccumulator *)self addButtonEvent:v36 fromSender:v7];
            break;
          case 3:
          case 8:
          case 9:
          case 10:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
            continue;
          case 4:
            [(BKMouseEventAccumulator *)self addTranslationEvent:v36 fromSender:v7];
            break;
          case 5:
            [(BKMouseEventAccumulator *)self addRotationEvent:v36 fromSender:v7];
            break;
          case 6:
            [(BKMouseEventAccumulator *)self addScrollEvent:v36 fromSender:v7];
            break;
          case 7:
            [(BKMouseEventAccumulator *)self addScaleEvent:v36 fromSender:v7];
            break;
          case 11:
            [(BKMouseEventAccumulator *)self addDigitizerEvent:v36 fromSender:v7];
            break;
          case 17:
            IOHIDEventGetFloatValue();
            double v32 = v41;
            IOHIDEventGetFloatValue();
            double v33 = v42;
            break;
          default:
            if (Type == 41) {
LABEL_32:
            }
              [(BKMouseEventAccumulator *)self addForceEvent:v36 fromSender:v7];
            break;
        }
      }
      id v31 = [v30 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v31);
  }

  if ([(BKMouseEventAccumulator *)self isSenderLocked] || self->_buttonMask)
  {
    if (v59) {
      goto LABEL_48;
    }
    unint64_t v43 = IOHIDEventGetTimeStamp();
  }
  else
  {
    unint64_t v43 = 0;
  }
  self->_eventSequenceStartTimestamp = v43;
LABEL_48:
  kdebug_trace();
  kdebug_trace();
  char EventFlags = IOHIDEventGetEventFlags();
  positionint Type = self->_positionType;
  if (EventFlags)
  {
    if (positionType != 1)
    {
      id v50 = BKLogMousePointer();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v66 = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "switching to absolute coordinates", v66, 2u);
      }

      self->_positionint Type = 1;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventTimestamp = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventDeltaTimestamp = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._x._double p1 = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._y._p0 = 0u;
      *(_OWORD *)&self->_pointerInterpolator._interpolator._y._pN = 0u;
      self->_pointerInterpolator._accelerationFactor = 0u;
      self->_pointerUnacceleratedDelta = 0u;
      self->_pointerAcceleratedDelta = 0u;
    }
    self->_pointerAbsolutePosition.double x = v10;
    self->_pointerAbsolutePosition.double y = v12;
    self->_absolutePositionIsValid = 1;
  }
  else
  {
    if (positionType)
    {
      id v46 = BKLogMousePointer();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v66 = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "switching to relative coordinates", v66, 2u);
      }

      self->_positionint Type = 0;
    }
    kdebug_trace();
    kdebug_trace();
    uint64_t v47 = IOHIDEventGetTimeStamp();
    if ((self->_interpolateEventTypeMask & 0x20000) != 0)
    {
      uint64_t v51 = v47;
      v52 = v60;
      if (v10 == 0.0 && v12 == 0.0)
      {
        self->_pointerInterpolator._accelerationFactor = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._y._pN = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._y._p0 = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._x._double p1 = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventDeltaTimestamp = 0u;
        *(_OWORD *)&self->_pointerInterpolator._interpolator._time._eventTimestamp = 0u;
      }
      if (v60) {
        v52 = (uint64_t *)v60[9];
      }
      v53 = v52;
      double v54 = sub_100086C00((uint64_t)v53);
      sub_10008A50C((uint64_t)&self->_pointerInterpolator, v51, v10, v12, v32, v33, v54);
    }
    else
    {
      CGFloat v48 = v12 + self->_pointerUnacceleratedDelta.y;
      self->_pointerUnacceleratedDelta.double x = v10 + self->_pointerUnacceleratedDelta.x;
      self->_pointerUnacceleratedDelta.double y = v48;
      CGFloat v49 = v33 + self->_pointerAcceleratedDelta.y;
      self->_pointerAcceleratedDelta.double x = v32 + self->_pointerAcceleratedDelta.x;
      self->_pointerAcceleratedDelta.double y = v49;
    }
  }
}

- (void)invalidateAbsolutePosition
{
  self->_absolutePositionIsValid = 0;
}

- (void)addSyntheticTopLevelEventIfNeeded
{
  if (!self->_eventTypeMask)
  {
    self->_eventTypeMask = 0x20000;
    self->_pointerUnacceleratedDelta = 0u;
    self->_pointerAcceleratedDelta = 0u;
  }
}

- (void)addTopLevelScaleEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->_mostRecentSender, a4);
  self->_lastRemoteEventTimestamp = BKSHIDEventGetRemoteTimestamp();
  [(BKMouseEventAccumulator *)self addScaleEvent:a3 fromSender:v7];
}

- (void)addScrollEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v36 = a4;
  uint64_t v5 = -[BKMouseEventAccumulator _eventStateForSender:](self, "_eventStateForSender:");
  int Phase = IOHIDEventGetPhase();
  kdebug_trace();
  int64_t discreteScrollGeneration = self->_discreteScrollGeneration;
  self->_int64_t discreteScrollGeneration = discreteScrollGeneration + 1;
  unsigned __int16 v8 = Phase;
  if (!Phase)
  {
    if (v5) {
      __int16 v9 = *(_WORD *)(v5 + 18);
    }
    else {
      LOBYTE(v9) = 0;
    }
    int64_t v10 = discreteScrollGeneration + 2;
    self->_int64_t discreteScrollGeneration = v10;
    postEventAsyncBlock = (void (**)(id, void *, double))self->_postEventAsyncBlock;
    if (postEventAsyncBlock)
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10008AF88;
      v41[3] = &unk_1000F8F60;
      int64_t v44 = v10;
      v41[4] = self;
      id v42 = (id)v5;
      id v43 = v36;
      postEventAsyncBlock[2](postEventAsyncBlock, v41, 0.2);
    }
    if ((v9 & 3) != 0) {
      unsigned __int16 v8 = 2;
    }
    else {
      unsigned __int16 v8 = 1;
    }
  }
  if (v5)
  {
    *(unsigned char *)(v5 + 16) = Phase == 0;
    *(_WORD *)(v5 + 18) = v8;
  }
  uint64_t TimeStamp = IOHIDEventGetTimeStamp();
  if (sub_100085AC0((uint64_t)&self->_scrollPhaseTracker, v8, v36, TimeStamp))
  {
    self->_eventTypeMask |= 0x40uLL;
    IOHIDEventGetFloatValue();
    double v14 = v13;
    IOHIDEventGetFloatValue();
    double v16 = v15;
    IOHIDEventGetChildren();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unsigned __int16 v17 = (id)objc_claimAutoreleasedReturnValue();
    id v18 = (char *)[v17 countByEnumeratingWithState:&v37 objects:v55 count:16];
    double v19 = v14;
    double v20 = v16;
    if (v18)
    {
      uint64_t v21 = *(void *)v38;
      double v19 = v14;
      double v20 = v16;
      do
      {
        unsigned int v22 = 0;
        do
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(v17);
          }
          if (IOHIDEventGetType() == 6)
          {
            IOHIDEventGetFloatValue();
            double v19 = v23;
            IOHIDEventGetFloatValue();
            double v20 = v24;
          }
          ++v22;
        }
        while (v18 != v22);
        id v18 = (char *)[v17 countByEnumeratingWithState:&v37 objects:v55 count:16];
      }
      while (v18);
    }

    kdebug_trace();
    kdebug_trace();
    kdebug_trace();
    kdebug_trace();
    if (Phase)
    {
      double v25 = BKLogMousePointer();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v34 = BKNSStringFromIOHIDEventPhase();
        *(_DWORD *)buf = 138544386;
        id v46 = v34;
        __int16 v47 = 2048;
        double v48 = v16;
        __int16 v49 = 2048;
        double v50 = v16;
        __int16 v51 = 2048;
        double v52 = v19;
        __int16 v53 = 2048;
        double v54 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, " -> scroll (%{public}@) %g,%g accel:%g,%g", buf, 0x34u);
      }
      if ((self->_interpolateEventTypeMask & 0x40) != 0)
      {
        if (v5) {
          double v26 = *(void **)(v5 + 72);
        }
        else {
          double v26 = 0;
        }
        id v27 = v26;
        uint64_t v28 = IOHIDEventGetTimeStamp();
        double v29 = sub_100086C00((uint64_t)v27);
        sub_10008A50C((uint64_t)&self->_scrollInterpolator, v28, v14, v16, v19, v20, v29);

        goto LABEL_34;
      }
    }
    else
    {
      id v31 = BKLogMousePointer();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        id v35 = BKNSStringFromIOHIDEventPhase();
        *(_DWORD *)buf = 138544386;
        id v46 = v35;
        __int16 v47 = 2048;
        double v48 = v14;
        __int16 v49 = 2048;
        double v50 = v16;
        __int16 v51 = 2048;
        double v52 = v19;
        __int16 v53 = 2048;
        double v54 = v20;
        _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, " -> discrete scroll (%{public}@) %g,%g accel:%g,%g", buf, 0x34u);
      }
    }
    CGFloat v32 = v16 + self->_scrollUnacceleratedDelta.y;
    self->_scrollUnacceleratedDelta.double x = v14 + self->_scrollUnacceleratedDelta.x;
    self->_scrollUnacceleratedDelta.double y = v32;
    CGFloat v33 = v20 + self->_scrollAcceleratedDelta.y;
    self->_scrollAcceleratedDelta.double x = v19 + self->_scrollAcceleratedDelta.x;
    self->_scrollAcceleratedDelta.double y = v33;
LABEL_34:
    self->_scrollPhaseDidChange |= self->_scrollPhase != self->_scrollPhaseTracker._inputPhase;
    self->_scrollint Phase = v8;
    goto LABEL_35;
  }
  unsigned __int16 v17 = BKLogMousePointer();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    id v30 = [v36 senderID];
    *(_DWORD *)buf = 134217984;
    id v46 = v30;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, " -> scroll rejected from sender:%llX", buf, 0xCu);
  }
LABEL_35:
}

- (void)addTopLevelScrollEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->_mostRecentSender, a4);
  self->_lastRemoteEventTimestamp = BKSHIDEventGetRemoteTimestamp();
  [(BKMouseEventAccumulator *)self addScrollEvent:a3 fromSender:v7];
}

- (CGPoint)unacceleratedRelativePointerPosition
{
  double x = self->_pointerUnacceleratedDelta.x;
  double y = self->_pointerUnacceleratedDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)acceleratedRelativePointerPosition
{
  double x = self->_pointerAcceleratedDelta.x;
  double y = self->_pointerAcceleratedDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)touchingPathIndexesDidChange
{
  return self->_touchingPathIndexesDidChange;
}

- (BOOL)buttonMaskDidChange
{
  return self->_buttonMaskDidChange && !self->_shouldUseButtonDownRecenteringBehavior;
}

- (unint64_t)eventSequenceStartTimestamp
{
  return self->_eventSequenceStartTimestamp;
}

- (BOOL)scrollPhaseDidChange
{
  return self->_scrollPhaseDidChange;
}

- (int64_t)hitTestReason
{
  unsigned int v3 = [(BKMouseEventAccumulator *)self isSenderLocked];
  unsigned int buttonMask = self->_buttonMask;
  if (v3)
  {
    if (buttonMask || ![(BKMouseEventAccumulator *)self _shouldHitTestForGestureBegan]) {
      return 0;
    }
    else {
      return 6;
    }
  }
  else if (buttonMask)
  {
    if (self->_previousButtonMask)
    {
      if (self->_shouldUseButtonDownRecenteringBehavior) {
        return 3;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 2;
    }
  }
  else
  {
    return 1;
  }
}

- (BOOL)_shouldHitTestForGestureBegan
{
  __int16 v15 = 0;
  outputint Phase = self->_scrollPhaseTracker._outputPhase;
  if (outputPhase == 1)
  {
    CGFloat v4 = &v15;
    goto LABEL_9;
  }
  if (outputPhase == 4 || outputPhase == 2)
  {
    CGFloat v4 = (__int16 *)((char *)&v15 + 1);
LABEL_9:
    *(unsigned char *)CGFloat v4 = 1;
  }
  int v5 = self->_translationPhaseTracker._outputPhase;
  if (v5 == 1)
  {
    id v7 = &v15;
    goto LABEL_18;
  }
  if (v5 == 4 || v5 == 2)
  {
    id v7 = (__int16 *)((char *)&v15 + 1);
LABEL_18:
    *(unsigned char *)id v7 = 1;
  }
  int v8 = self->_rotationPhaseTracker._outputPhase;
  if (v8 == 1)
  {
    int64_t v10 = &v15;
    goto LABEL_27;
  }
  if (v8 == 4 || v8 == 2)
  {
    int64_t v10 = (__int16 *)((char *)&v15 + 1);
LABEL_27:
    *(unsigned char *)int64_t v10 = 1;
  }
  int v11 = self->_scalePhaseTracker._outputPhase;
  if (v11 == 1)
  {
    double v12 = &v15;
  }
  else
  {
    if (v11 != 4 && v11 != 2) {
      goto LABEL_34;
    }
    double v12 = (__int16 *)((char *)&v15 + 1);
  }
  *(unsigned char *)double v12 = 1;
LABEL_34:
  if (HIBYTE(v15)) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v15 == 0;
  }
  return !v13;
}

- (BOOL)isSenderLocked
{
  if (self->_scrollPhaseTracker._eventSender && self->_scrollPhaseTracker._outputPhase
    || self->_translationPhaseTracker._eventSender && self->_translationPhaseTracker._outputPhase
    || self->_rotationPhaseTracker._eventSender && self->_rotationPhaseTracker._outputPhase)
  {
    return 1;
  }
  if (self->_scalePhaseTracker._eventSender) {
    return self->_scalePhaseTracker._outputPhase != 0;
  }
  return 0;
}

- (void)invalidate
{
  self->_isInvalid = 1;
  id postEventAsyncBlock = self->_postEventAsyncBlock;
  self->_id postEventAsyncBlock = 0;
}

- (void)dealloc
{
  if (!self->_isInvalid)
  {
    CGFloat v4 = +[NSString stringWithFormat:@"forgot to invalidate %@", objc_opt_class()];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      CGFloat v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      double v12 = v7;
      __int16 v13 = 2048;
      double v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKMousePointerEventAccumulator.mm";
      __int16 v17 = 1024;
      int v18 = 721;
      __int16 v19 = 2114;
      double v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10008B43CLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKMouseEventAccumulator;
  [(BKMouseEventAccumulator *)&v8 dealloc];
}

- (BKMouseEventAccumulator)initWithInterpolatedEventTypeMask:(unint64_t)a3 postEventsBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(BKMouseEventAccumulator *)self init];
  objc_super v8 = v7;
  if (v7)
  {
    v7->_interpolateEventTypeMask = a3;
    id v9 = [v6 copy];
    id postEventAsyncBlock = v8->_postEventAsyncBlock;
    v8->_id postEventAsyncBlock = v9;
  }
  return v8;
}

- (BKMouseEventAccumulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKMouseEventAccumulator;
  v2 = [(BKMouseEventAccumulator *)&v6 init];
  if (v2)
  {
    unsigned int v3 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
    eventStateBySenderID = v2->_eventStateBySenderID;
    v2->_eventStateBySenderID = v3;

    v2->_shouldScrollNaturalldouble y = 1;
  }
  return v2;
}

@end