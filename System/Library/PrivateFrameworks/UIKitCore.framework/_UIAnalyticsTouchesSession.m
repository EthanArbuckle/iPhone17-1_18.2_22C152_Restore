@interface _UIAnalyticsTouchesSession
- (BOOL)isValid;
- (_UIAnalyticsTouchesSession)init;
- (void)processEvent:(id)a3;
@end

@implementation _UIAnalyticsTouchesSession

- (_UIAnalyticsTouchesSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIAnalyticsTouchesSession;
  result = [(_UIAnalyticsTouchesSession *)&v3 init];
  if (result) {
    result->_valid = 1;
  }
  return result;
}

- (void)processEvent:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!self->_valid)
  {
    v21 = _uiMultitouchAnalyticsLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v41 = self;
      _os_log_error_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Analytics session %p: Session is no longer valid. Ignoring event.", buf, 0xCu);
    }
    goto LABEL_36;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v6 = [v4 allTouches];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (!v7)
  {

    if (!self->_touchesDetected) {
      goto LABEL_70;
    }
    self->_valid = 0;
    goto LABEL_48;
  }
  uint64_t v8 = v7;
  v35 = v5;
  int v9 = 0;
  char v10 = 0;
  char v11 = 0;
  char v12 = 0;
  uint64_t v13 = *(void *)v37;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v6);
      }
      v15 = *(_WORD **)(*((void *)&v36 + 1) + 8 * v14);
      if (!objc_msgSend(v15, "type", v35))
      {
        uint64_t v16 = [v15 phase];
        if (self->_touchesDetected || v16)
        {
          v10 |= v16 == 4;
          if ((unint64_t)(v16 - 5) > 0xFFFFFFFFFFFFFFFDLL) {
            goto LABEL_8;
          }
        }
        else
        {
          char v12 = 1;
          self->_touchesDetected = 1;
          self->_touchesStartTime = mach_absolute_time();
        }
        ++v9;
        if (v15) {
          BOOL v17 = !self->_allowedGestureRecognizerHasBegun;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17 && (v15[118] & 0x400) != 0)
        {
          char v11 = 1;
          self->_allowedGestureRecognizerHasBegun = 1;
        }
      }
LABEL_8:
      ++v14;
    }
    while (v8 != v14);
    uint64_t v18 = [v6 countByEnumeratingWithState:&v36 objects:v46 count:16];
    uint64_t v8 = v18;
  }
  while (v18);

  if (v9 < 1 || self->_touchesDetected | v12 & 1)
  {
    if (v12)
    {
      v19 = _uiMultitouchAnalyticsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEBUG, "Analytics session %p: Starting to track touches.", buf, 0xCu);
      }
    }
    if (self->_multitouchDetected || v9 < 2)
    {
      v5 = v35;
      if (v11) {
        goto LABEL_40;
      }
    }
    else
    {
      v20 = _uiMultitouchAnalyticsLog();
      v5 = v35;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEBUG, "Analytics session %p: Multitouch detected.", buf, 0xCu);
      }

      self->_int multitouchDetected = 1;
      if ((v11 & 1) == 0) {
        goto LABEL_70;
      }
LABEL_40:
      v22 = _uiMultitouchAnalyticsLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEBUG, "Analytics session %p: An allowed gesture recognizer has been detected.", buf, 0xCu);
      }
    }
    if (!self->_touchesDetected || v9) {
      goto LABEL_70;
    }
    self->_valid = 0;
    if (v10)
    {
      v21 = _uiMultitouchAnalyticsLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v41 = self;
        _os_log_debug_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEBUG, "Analytics session %p: Touches have been cancelled. Ignoring and invalidating session.", buf, 0xCu);
      }
LABEL_36:

      goto LABEL_70;
    }
LABEL_48:
    v23 = _uiMultitouchAnalyticsLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v41 = self;
      _os_log_debug_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEBUG, "Analytics session %p: All touches have ended. Gathering metrics and ending session.", buf, 0xCu);
    }

    if (qword_1EB265060 != -1) {
      dispatch_once(&qword_1EB265060, &__block_literal_global_38);
    }
    uint64_t v24 = mach_absolute_time();
    int multitouchDetected = self->_multitouchDetected;
    if (self->_multitouchDetected)
    {
      if (self->_allowedGestureRecognizerHasBegun) {
        int multitouchDetected = 1;
      }
      else {
        int multitouchDetected = 2;
      }
      if (self->_allowedGestureRecognizerHasBegun) {
        v26 = "HANDLED";
      }
      else {
        v26 = "NONHANDLED";
      }
      if (self->_allowedGestureRecognizerHasBegun) {
        v27 = @"handledMultitouchDuration";
      }
      else {
        v27 = @"nonHandledMultitouchDuration";
      }
    }
    else
    {
      v27 = @"singleTouchDuration";
      v26 = "SINGLE";
    }
    unint64_t v29 = (v24 - self->_touchesStartTime) * dword_1EB265058 / unk_1EB26505C / 0xF4240;
    dword_1EB265030 = multitouchDetected;
    v30 = _uiMultitouchAnalyticsLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v41 = self;
      __int16 v42 = 2080;
      v43 = v26;
      __int16 v44 = 2048;
      unint64_t v45 = v29;
      _os_log_debug_impl(&dword_1853B0000, v30, OS_LOG_TYPE_DEBUG, "Analytics session %p: Recording data point: type: %s, duration: %llu ms", buf, 0x20u);
    }

    uint64_t v31 = dword_1EB265030;
    *(void *)&_MergedGlobals_1325[8 * dword_1EB265030 + 88] += v29;
    v32 = &_MergedGlobals_1325[v31];
    int v33 = v32[2]++ + 1;
    if (v33 == 16)
    {
      AnalyticsSendEventLazy();
      uint64_t v34 = dword_1EB265030;
      _MergedGlobals_1325[dword_1EB265030 + 2] = 0;
      *(void *)&_MergedGlobals_1325[8 * v34 + 88] = 0;
    }
    goto LABEL_70;
  }
  v28 = _uiMultitouchAnalyticsLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v41 = self;
    _os_log_error_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Analytics session %p: Missed the beginning of a touch session. Invalidating.", buf, 0xCu);
  }

  self->_valid = 0;
  v5 = v35;
LABEL_70:
}

- (BOOL)isValid
{
  return self->_valid;
}

@end