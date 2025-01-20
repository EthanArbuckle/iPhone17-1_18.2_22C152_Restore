@interface SBWindowHidingManager
- (BOOL)_isHidingWindowLevel:(double)a3;
- (BOOL)_isHidingWindows;
- (SBWindowHidingManager)initWithWindowScene:(id)a3;
- (id)dumpHidingState;
- (id)dumpKnownWindows;
- (void)_adjustWindowsForActiveHideRange;
- (void)_captureWindow:(id)a3;
- (void)_recomputeHideRangeAndAdjustWindows;
- (void)_releaseWindow:(id)a3;
- (void)_takeNoteOfWindow:(id)a3 onScene:(id)a4;
- (void)_window:(id)a3 willDetachFromScene:(id)a4;
- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5;
- (void)setAlpha:(double)a3 forWindow:(id)a4;
- (void)startHidingWindowsExclusivelyFromLevel:(double)a3 toLevel:(double)a4 forContext:(id)a5 reason:(id)a6;
- (void)stopHidingWindowsForContext:(id)a3;
@end

@implementation SBWindowHidingManager

- (SBWindowHidingManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBWindowHidingManager;
  v5 = [(SBWindowHidingManager *)&v23 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    hidingContextMap = v6->_hidingContextMap;
    v6->_hidingContextMap = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    windowStateMap = v6->_windowStateMap;
    v6->_windowStateMap = (NSMapTable *)v9;

    v6->_hideRange = (SBWindowLevelRange_struct)xmmword_1D8FD3610;
    id v11 = objc_alloc_init(MEMORY[0x1E4F629B0]);
    v12 = [MEMORY[0x1E4F62A60] identityForIdentifier:*MEMORY[0x1E4F71DE8]];
    [v11 setIdentity:v12];

    v13 = [v4 _FBSScene];
    v14 = [v13 settings];
    v15 = [v14 displayIdentity];

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FA7970]) _initWithDefinition:v11 displayIdentity:v15];
    keyboardSceneHandle = v6->_keyboardSceneHandle;
    v6->_keyboardSceneHandle = (SBSceneHandle *)v16;

    [(SBSceneHandle *)v6->_keyboardSceneHandle addObserver:v6];
    v18 = [v4 windows];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __45__SBWindowHidingManager_initWithWindowScene___block_invoke;
    v20[3] = &unk_1E6B0E868;
    v21 = v6;
    id v22 = v4;
    [v18 enumerateObjectsUsingBlock:v20];
  }
  return v6;
}

uint64_t __45__SBWindowHidingManager_initWithWindowScene___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _takeNoteOfWindow:a2 onScene:*(void *)(a1 + 40)];
}

- (void)_window:(id)a3 willDetachFromScene:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v8 = [v6 isEqual:WeakRetained];

  if (v8) {
    [(SBWindowHidingManager *)self _releaseWindow:v9];
  }
}

- (void)setAlpha:(double)a3 forWindow:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NSMapTable *)self->_windowStateMap objectForKey:v6];
  if (!v7)
  {
    int v8 = SBLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "SBWindowManager changing alpha for an untracked window. It may be untracked if the alpha change occurred while it was still hidden.", v9, 2u);
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v6 setAlpha:a3];
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  [v6 windowLevel];
  if (!-[SBWindowHidingManager _isHidingWindowLevel:](self, "_isHidingWindowLevel:"))
  {
LABEL_7:
    [v6 setAlphaAndObeyBecauseIAmTheWindowManager:a3];
    goto LABEL_9;
  }
  [v7 setDesiredAlpha:a3];
LABEL_9:
}

- (void)startHidingWindowsExclusivelyFromLevel:(double)a3 toLevel:(double)a4 forContext:(id)a5 reason:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (a4 >= a3)
  {
    v14 = [(NSMapTable *)self->_hidingContextMap objectForKey:v10];
    if (v14)
    {
      v15 = SBLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        [v14 windowLevelRange];
        v18 = [NSString stringWithFormat:@"(%.f, %.f)", v16, v17];
        v19 = [NSString stringWithFormat:@"(%.f, %.f)", *(void *)&a3, *(void *)&a4];
        *(_DWORD *)buf = 134218754;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v10;
        __int16 v24 = 2112;
        v25 = v18;
        __int16 v26 = 2112;
        v27 = v19;
        _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "Context %p (%@) updating hide window request %@ -> %@", buf, 0x2Au);
      }
    }
    v12 = +[SBWindowHideRequest hideRequestWithWindowLevelRange:reason:](SBWindowHideRequest, "hideRequestWithWindowLevelRange:reason:", v11, a3, a4);

    [(NSMapTable *)self->_hidingContextMap setObject:v12 forKey:v10];
    [(SBWindowHidingManager *)self _recomputeHideRangeAndAdjustWindows];
  }
  else
  {
    v12 = SBLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = [NSString stringWithFormat:@"(%.f, %.f)", *(void *)&a3, *(void *)&a4];
      *(_DWORD *)buf = 134218498;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "Context %p (%@) passed an invalid window level range %@", buf, 0x20u);
    }
  }
}

- (void)stopHidingWindowsForContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(NSMapTable *)self->_hidingContextMap objectForKey:v4];
  id v6 = SBLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      int v12 = 134218242;
      id v13 = v4;
      __int16 v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Context %p (%@) cleared.", (uint8_t *)&v12, 0x16u);
    }
    [(NSMapTable *)self->_hidingContextMap removeObjectForKey:v4];
    [(SBWindowHidingManager *)self _recomputeHideRangeAndAdjustWindows];
  }
  else
  {
    if (v7)
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v12 = 134218242;
      id v13 = v4;
      __int16 v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Stop hiding request from unknown context %p (%{public}@) ignored", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (BOOL)_isHidingWindows
{
  return [(NSMapTable *)self->_hidingContextMap count] != 0;
}

- (void)_recomputeHideRangeAndAdjustWindows
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(SBWindowHidingManager *)self _isHidingWindows])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v3 = [(NSMapTable *)self->_hidingContextMap objectEnumerator];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      double v7 = 0.0;
      double v8 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * i) windowLevelRange];
          if (v8 < v7) {
            double v12 = v11;
          }
          else {
            double v12 = v8;
          }
          if (v8 < v7) {
            double v13 = v10;
          }
          else {
            double v13 = v7;
          }
          if (v7 >= v10) {
            double v14 = v10;
          }
          else {
            double v14 = v7;
          }
          if (v8 >= v11) {
            double v15 = v8;
          }
          else {
            double v15 = v11;
          }
          BOOL v16 = v8 < v7 || v11 < v10;
          if (v16) {
            double v8 = v12;
          }
          else {
            double v8 = v15;
          }
          if (v16) {
            double v7 = v13;
          }
          else {
            double v7 = v14;
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 0.0;
      double v8 = -1.0;
    }
  }
  else
  {
    double v7 = 0.0;
    double v8 = -1.0;
  }
  self->_hideRange.start = v7;
  self->_hideRange.end = v8;
  [(SBWindowHidingManager *)self _adjustWindowsForActiveHideRange];
}

- (void)_adjustWindowsForActiveHideRange
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F42D58] _synchronizeDrawing];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = [(NSMapTable *)self->_windowStateMap keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v9 = [(NSMapTable *)self->_windowStateMap objectForKey:v8];
        [v8 windowLevel];
        double v11 = v10;
        if ([(SBWindowHidingManager *)self _isHidingWindows]
          && (start = self->_hideRange.start, double end = self->_hideRange.end, end >= start))
        {
          BOOL v15 = end > v11 && start < v11;
          int v14 = [v9 isHidden];
          if (v15 && (v14 & 1) == 0)
          {
            [v8 alpha];
            objc_msgSend(v9, "setDesiredAlpha:");
            [v9 setHidden:1];
            double v16 = 0.0;
            goto LABEL_18;
          }
        }
        else
        {
          int v14 = [v9 isHidden];
          LOBYTE(v15) = 0;
        }
        if (!v15 && v14)
        {
          [v9 setHidden:0];
          [v9 desiredAlpha];
LABEL_18:
          [v8 setAlphaAndObeyBecauseIAmTheWindowManager:v16];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  long long v17 = [(SBSceneHandle *)self->_keyboardSceneHandle sceneIfExists];
  long long v18 = v17;
  if (v17)
  {
    long long v19 = [v17 settings];
    [v19 level];
    double v21 = v20;

    uint64_t v22 = [v18 uiPresentationManager];
    if (![(SBWindowHidingManager *)self _isHidingWindows]
      || (double v23 = self->_hideRange.start, v24 = self->_hideRange.end, v24 < v23)
      || (v23 < v21 ? (BOOL v25 = v24 <= v21) : (BOOL v25 = 1), v25))
    {
      [(UIScenePresenter *)self->_keyboardPresenter invalidate];
      keyboardPresenter = self->_keyboardPresenter;
      self->_keyboardPresenter = 0;
    }
    else
    {
      if (self->_keyboardPresenter) {
        goto LABEL_31;
      }
      v27 = [v22 createPresenterWithIdentifier:@"SBWindowHidingManager" priority:-5];
      uint64_t v28 = self->_keyboardPresenter;
      self->_keyboardPresenter = v27;

      [(UIScenePresenter *)self->_keyboardPresenter activate];
      keyboardPresenter = [(UIScenePresenter *)self->_keyboardPresenter presentationView];
      [keyboardPresenter setHidden:1];
    }

LABEL_31:
  }
}

- (void)_takeNoteOfWindow:(id)a3 onScene:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int v9 = [v7 isEqual:WeakRetained];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SBWindowHidingManager *)self _captureWindow:v6];
    }
    else
    {
      double v10 = SBLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        id v12 = v6;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "SBWindowManager: Ignoring window %p because it isn't an SBWindow", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    [(SBWindowHidingManager *)self _releaseWindow:v6];
  }
}

- (void)_captureWindow:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_windowStateMap objectForKey:v4];
  id v6 = SBLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v8 = 134217984;
      id v9 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "SBWindowManager: already tracking window %p", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      int v8 = 134217984;
      id v9 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "SBWindowManager now tracking window %p", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = objc_alloc_init(SBWindowHideState);
    [(SBWindowHideState *)v5 setHidden:0];
    [v4 alpha];
    -[SBWindowHideState setDesiredAlpha:](v5, "setDesiredAlpha:");
    [(NSMapTable *)self->_windowStateMap setObject:v5 forKey:v4];
  }
}

- (BOOL)_isHidingWindowLevel:(double)a3
{
  double start = self->_hideRange.start;
  double end = self->_hideRange.end;
  if (end < start) {
    return 0;
  }
  if (end > a3) {
    return start < a3;
  }
  return 0;
}

- (void)_releaseWindow:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_windowStateMap objectForKey:v4];
  if (v5)
  {
    id v6 = SBLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      id v11 = v4;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "SBWindowManager is releasing window %p", (uint8_t *)&v10, 0xCu);
    }

    if ([v5 isHidden])
    {
      BOOL v7 = SBLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        [v5 desiredAlpha];
        int v10 = 134218240;
        id v11 = v8;
        __int16 v12 = 2048;
        id v13 = v4;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "SBWindowManager restoring alpha to %.f for released window %p", (uint8_t *)&v10, 0x16u);
      }

      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      [v5 desiredAlpha];
      if (isKindOfClass) {
        objc_msgSend(v4, "setAlphaAndObeyBecauseIAmTheWindowManager:");
      }
      else {
        objc_msgSend(v4, "setAlpha:");
      }
    }
    [(NSMapTable *)self->_windowStateMap removeObjectForKey:v4];
  }
}

- (id)dumpHidingState
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = v3;
  double end = self->_hideRange.end;
  if (end >= self->_hideRange.start)
  {
    id v6 = [NSString stringWithFormat:@"(%.f, %.f)", *(void *)&self->_hideRange.start, *(void *)&end];
    [v4 appendFormat:@"Active hide range is: %@\n", v6];
  }
  else
  {
    [v3 appendFormat:@"Active hide range is: %@\n", @"OFF"];
  }
  [v4 appendString:@"These are our active hide requests:\n"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v7 = [(NSMapTable *)self->_hidingContextMap keyEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [(NSMapTable *)self->_hidingContextMap objectForKey:v12];
        uint64_t v14 = (objc_class *)objc_opt_class();
        BOOL v15 = NSStringFromClass(v14);
        [v4 appendFormat:@"Context %p (%@): %@\n", v12, v15, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)dumpKnownWindows
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v17 = [MEMORY[0x1E4F28E78] string];
  [v17 appendString:@"These are our known windows:\n"];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(NSMapTable *)self->_windowStateMap keyEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = [(NSMapTable *)self->_windowStateMap objectForKey:v8];
        uint64_t v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        [v17 appendFormat:@"Window %p [%@]: %@\n", v8, v11, v9];

        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }

  uint64_t v12 = (void *)MEMORY[0x1E4F1CA80];
  id v13 = [MEMORY[0x1E4F43058] allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];
  uint64_t v14 = [v12 setWithArray:v13];

  [v14 minusSet:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if ([v14 count])
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__SBWindowHidingManager_dumpKnownWindows__block_invoke;
    v18[3] = &unk_1E6B0E890;
    id v19 = WeakRetained;
    double v21 = v22;
    id v20 = v17;
    [v14 enumerateObjectsUsingBlock:v18];

    _Block_object_dispose(v22, 8);
  }

  return v17;
}

void __41__SBWindowHidingManager_dumpKnownWindows__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = [v10 windowScene];
  int v4 = [v3 isEqual:*(void *)(a1 + 32)];

  if (v4)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [*(id *)(a1 + 40) appendString:@"There are additional UIKit windows that we don't know about:\n"];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = (objc_class *)objc_opt_class();
    BOOL v7 = NSStringFromClass(v6);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v9 = @"NOT an SBWindow";
    if (isKindOfClass) {
      uint64_t v9 = @"SBWindow";
    }
    [v5 appendFormat:@"%p: %@ (%@)\n", v10, v7, v9];
  }
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v7 = a5;
  id v14 = [a3 scene];
  uint64_t v8 = [v14 settings];
  [v8 level];
  double v10 = v9;
  [v7 level];
  double v12 = v11;

  if (v10 == v12)
  {
  }
  else
  {
    BOOL v13 = [(SBWindowHidingManager *)self _isHidingWindows];

    if (v13)
    {
      [(SBWindowHidingManager *)self _adjustWindowsForActiveHideRange];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardPresenter, 0);
  objc_storeStrong((id *)&self->_keyboardSceneHandle, 0);
  objc_storeStrong((id *)&self->_hidingContextMap, 0);
  objc_storeStrong((id *)&self->_windowStateMap, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end