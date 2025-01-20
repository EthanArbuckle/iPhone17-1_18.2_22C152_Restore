@interface _UIFocusDisplayLinkScrollAnimator
- (BOOL)_canCreateDisplayLink;
- (BOOL)_shouldPushAndPopRunLoopModes;
- (BOOL)isAnimatingScrollableContainer:(id)a3;
- (CGPoint)_applyAccelerationLimitToAcceleration:(CGPoint)a3 currentOffset:(CGPoint)a4 targetOffset:(CGPoint)a5;
- (CGPoint)_hyperJumpContentOffsetIfNecessaryForEntry:(id)a3 currentOffset:(CGPoint)a4;
- (CGPoint)currentVelocityForScrollableContainer:(id)a3;
- (CGPoint)targetContentOffsetForScrollableContainer:(id)a3;
- (CGPoint)velocityToScrollFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4;
- (_UIFocusDisplayLinkScrollAnimator)initWithScreen:(id)a3;
- (double)defaultConvergenceRate;
- (id)_createEntryForEnvironmentScrollableContainer:(id)a3;
- (id)_entryForEnvironmentScrollableContainer:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_entryForScrollableContainer:(id)a3;
- (void)_commonHeartbeat;
- (void)_commonHeartbeat:(double)a3;
- (void)_displayLinkHeartbeat:(id)a3;
- (void)_processEntry:(id)a3 timeDelta:(int64_t)a4 completed:(id)a5 cancelled:(id)a6;
- (void)_removeEntry:(id)a3;
- (void)_switchToTimerScrolling;
- (void)_updateHeartbeatConfiguration;
- (void)adjustTargetContentOffsetForScrollableContainer:(id)a3 byDelta:(CGPoint)a4;
- (void)cancelScrollingForScrollableContainer:(id)a3;
- (void)dealloc;
- (void)setDefaultConvergenceRate:(double)a3;
- (void)setTargetContentOffset:(CGPoint)a3 forEnvironmentScrollableContainer:(id)a4 convergenceRate:(double)a5 completion:(id)a6;
@end

@implementation _UIFocusDisplayLinkScrollAnimator

- (_UIFocusDisplayLinkScrollAnimator)initWithScreen:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusDisplayLinkScrollAnimator;
  v6 = [(_UIFocusDisplayLinkScrollAnimator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_screen, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusDisplayLinkScrollAnimator;
  [(_UIFocusDisplayLinkScrollAnimator *)&v3 dealloc];
}

- (double)defaultConvergenceRate
{
  return self->_defaultConvergenceRate;
}

- (void)setDefaultConvergenceRate:(double)a3
{
  self->_defaultConvergenceRate = a3;
}

- (void)setTargetContentOffset:(CGPoint)a3 forEnvironmentScrollableContainer:(id)a4 convergenceRate:(double)a5 completion:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  v13 = [(_UIFocusDisplayLinkScrollAnimator *)self _entryForEnvironmentScrollableContainer:v11 createIfNeeded:1];
  v14 = v13;
  if (fabs(x) == INFINITY || (double v15 = fabs(y), v15 >= INFINITY) && v15 <= INFINITY)
  {
    v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("FocusScroll", &setTargetContentOffset_forEnvironmentScrollableContainer_convergenceRate_completion____s_category)+ 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = v16;
      v18 = [v11 scrollableContainer];
      int v19 = 134218498;
      double v20 = x;
      __int16 v21 = 2048;
      double v22 = y;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Ignoring request to scroll container to non-finite location: (%g, %g) in %@", (uint8_t *)&v19, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v13, "setTargetContentOffset:", x, y);
  }
  [v14 setConvergenceRate:a5];
  [v14 setCompletion:v12];

  [(_UIFocusDisplayLinkScrollAnimator *)self _updateHeartbeatConfiguration];
}

- (void)cancelScrollingForScrollableContainer:(id)a3
{
  v4 = [(_UIFocusDisplayLinkScrollAnimator *)self _entryForScrollableContainer:a3];
  if (v4)
  {
    id v7 = v4;
    id v5 = [v4 completion];

    if (v5)
    {
      v6 = [v7 completion];
      v6[2](v6, 0);
    }
    [(_UIFocusDisplayLinkScrollAnimator *)self _removeEntry:v7];
    [(_UIFocusDisplayLinkScrollAnimator *)self _updateHeartbeatConfiguration];
    v4 = v7;
  }
}

- (void)adjustTargetContentOffsetForScrollableContainer:(id)a3 byDelta:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v6 = [(_UIFocusDisplayLinkScrollAnimator *)self _entryForScrollableContainer:a3];
  if (v6)
  {
    id v11 = v6;
    [v6 targetContentOffset];
    objc_msgSend(v11, "setTargetContentOffset:", x + v7, y + v8);
    [v11 lastContentOffset];
    objc_msgSend(v11, "setLastContentOffset:", x + v9, y + v10);
    v6 = v11;
  }
}

- (BOOL)isAnimatingScrollableContainer:(id)a3
{
  objc_super v3 = [(_UIFocusDisplayLinkScrollAnimator *)self _entryForScrollableContainer:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (CGPoint)targetContentOffsetForScrollableContainer:(id)a3
{
  objc_super v3 = [(_UIFocusDisplayLinkScrollAnimator *)self _entryForScrollableContainer:a3];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 targetContentOffset];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)currentVelocityForScrollableContainer:(id)a3
{
  objc_super v3 = [(_UIFocusDisplayLinkScrollAnimator *)self _entryForScrollableContainer:a3];
  BOOL v4 = v3;
  if (v3)
  {
    [v3 lastContentOffset];
    double v6 = v5;
    double v8 = v7;
    [v4 targetContentOffset];
    double v10 = v9;
    double v12 = v11;
    [v4 convergenceRate];
    long double v14 = pow(v13, 16.0);
    double v15 = (v6 * v14 + v10 * (1.0 - v14) - v6) * 0.0625;
    double v16 = (v8 * v14 + v12 * (1.0 - v14) - v8) * 0.0625;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v17 = v15;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGPoint)velocityToScrollFromOffset:(CGPoint)a3 toOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  long double v8 = pow(self->_defaultConvergenceRate, 16.0);
  long double v9 = v6 * v8 + y * (1.0 - v8) - v6;
  double v10 = (v7 * v8 + x * (1.0 - v8) - v7) * 0.0625;
  double v11 = v9 * 0.0625;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (id)_entryForScrollableContainer:(id)a3
{
  id v4 = a3;
  singleScrollableContainerEntrdouble y = self->_singleScrollableContainerEntry;
  if (singleScrollableContainerEntry
    && (-[_UIFocusEngineScrollableContainerOffsets environmentScrollableContainer](singleScrollableContainerEntry, "environmentScrollableContainer"), v6 = objc_claimAutoreleasedReturnValue(), [v6 scrollableContainer], id v7 = (id)objc_claimAutoreleasedReturnValue(), v7, v6, v7 == v4))
  {
    long double v9 = self->_singleScrollableContainerEntry;
  }
  else
  {
    scrollableContainers = self->_scrollableContainers;
    if (!scrollableContainers)
    {
      double v10 = 0;
      goto LABEL_8;
    }
    long double v9 = [(NSMapTable *)scrollableContainers objectForKey:v4];
  }
  double v10 = v9;
LABEL_8:

  return v10;
}

- (id)_entryForEnvironmentScrollableContainer:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 scrollableContainer];
  singleScrollableContainerEntrdouble y = self->_singleScrollableContainerEntry;
  if (self->_scrollableContainers) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = singleScrollableContainerEntry == 0;
  }
  if (!v9 || !v4)
  {
    double v11 = [(_UIFocusEngineScrollableContainerOffsets *)singleScrollableContainerEntry environmentScrollableContainer];
    double v12 = [v11 scrollableContainer];

    long double v13 = self->_singleScrollableContainerEntry;
    if (v12 == v7)
    {
      double v22 = v13;
    }
    else
    {
      scrollableContainers = self->_scrollableContainers;
      if (v13 && v4)
      {
        if (!scrollableContainers)
        {
          double v15 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
          double v16 = self->_scrollableContainers;
          self->_scrollableContainers = v15;
        }
        double v22 = [(_UIFocusDisplayLinkScrollAnimator *)self _createEntryForEnvironmentScrollableContainer:v6];
        [(NSMapTable *)self->_scrollableContainers setObject:v22 forKey:v7];
        double v18 = self->_singleScrollableContainerEntry;
        double v17 = self->_scrollableContainers;
        int v19 = [(_UIFocusEngineScrollableContainerOffsets *)v18 environmentScrollableContainer];
        double v20 = [v19 scrollableContainer];
        [(NSMapTable *)v17 setObject:v18 forKey:v20];

        __int16 v21 = self->_singleScrollableContainerEntry;
        self->_singleScrollableContainerEntrdouble y = 0;
      }
      else if (scrollableContainers)
      {
        double v22 = [(NSMapTable *)scrollableContainers objectForKey:v7];
        if (!v22 && v4)
        {
          double v22 = [(_UIFocusDisplayLinkScrollAnimator *)self _createEntryForEnvironmentScrollableContainer:v6];
          [(NSMapTable *)self->_scrollableContainers setObject:v22 forKey:v7];
        }
      }
      else
      {
        double v22 = 0;
      }
    }
  }
  else
  {
    double v22 = [(_UIFocusDisplayLinkScrollAnimator *)self _createEntryForEnvironmentScrollableContainer:v6];
    objc_storeStrong((id *)&self->_singleScrollableContainerEntry, v22);
  }

  return v22;
}

- (id)_createEntryForEnvironmentScrollableContainer:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 scrollableContainer];
  if (objc_msgSend(v5, "__isKindOfUIScrollView"))
  {
    id v6 = v5;
    id v7 = [v6 delegate];
    if ([v6 _adjustsTargetsOnContentOffsetChanges]) {
      uint64_t v8 = [v6 isScrollAnimating] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  else
  {
    id v7 = 0;
    uint64_t v8 = 1;
  }
  BOOL v9 = objc_alloc_init(_UIFocusEngineScrollableContainerOffsets);
  [(_UIFocusEngineScrollableContainerOffsets *)v9 setAdjustsTargetsOnContentOffsetChanges:v8];
  [(_UIFocusEngineScrollableContainerOffsets *)v9 setEnvironmentScrollableContainer:v4];
  [(_UIFocusEngineScrollableContainerOffsets *)v9 setScrollDelegate:v7];
  [(_UIFocusEngineScrollableContainerOffsets *)v9 setConvergenceRate:self->_defaultConvergenceRate];
  [v5 contentOffset];
  double v11 = v10;
  double v13 = v12;
  -[_UIFocusEngineScrollableContainerOffsets setStartContentOffset:](v9, "setStartContentOffset:");
  -[_UIFocusEngineScrollableContainerOffsets setTargetContentOffset:](v9, "setTargetContentOffset:", v11, v13);
  -[_UIFocusEngineScrollableContainerOffsets setLastContentOffset:](v9, "setLastContentOffset:", v11, v13);
  -[_UIFocusEngineScrollableContainerOffsets setLastRoundedOffset:](v9, "setLastRoundedOffset:", v11, v13);
  if ((*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &_MergedGlobals_1053) & 1) == 0)
  {
    long double v14 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2607D8) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      double v15 = [v4 owningEnvironment];
      if (v15)
      {
        double v16 = NSString;
        double v17 = (objc_class *)objc_opt_class();
        double v18 = NSStringFromClass(v17);
        int v19 = [v16 stringWithFormat:@"<%@: %p>", v18, v15];
      }
      else
      {
        int v19 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      v31 = v19;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "Creating focus scroll animator entry for environment %@", buf, 0xCu);
    }
LABEL_13:

    goto LABEL_14;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2607D0);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    long double v14 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      double v22 = [v4 owningEnvironment];
      if (v22)
      {
        __int16 v23 = NSString;
        v24 = (objc_class *)objc_opt_class();
        uint64_t v25 = NSStringFromClass(v24);
        v26 = [v23 stringWithFormat:@"<%@: %p>", v25, v22];
      }
      else
      {
        v26 = @"(nil)";
      }
      v27 = (void *)MEMORY[0x1E4F29060];
      v28 = v26;
      v29 = [v27 callStackSymbols];
      *(_DWORD *)buf = 138412546;
      v31 = v26;
      __int16 v32 = 2114;
      v33 = v29;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Creating focus scroll animator entry for environment %@\n%{public}@", buf, 0x16u);
    }
    goto LABEL_13;
  }
LABEL_14:

  return v9;
}

- (BOOL)_canCreateDisplayLink
{
  return 1;
}

- (void)_switchToTimerScrolling
{
  displayLink = self->_displayLink;
  [(CADisplayLink *)displayLink invalidate];
  id v4 = self->_displayLink;
  self->_displayLink = 0;

  if (displayLink)
  {
    _UIQOSManagedCommitsEnd(self, @"FocusScrollAnimation");
    [(_UIFocusDisplayLinkScrollAnimator *)self _updateHeartbeatConfiguration];
    if ([(_UIFocusDisplayLinkScrollAnimator *)self _shouldPushAndPopRunLoopModes])
    {
      double v5 = (void *)UIApp;
      [v5 _popRunLoopMode:@"UITrackingRunLoopMode", self, @"Focus scroll animator, display link switched to timer" requester reason];
    }
  }
  else
  {
    [(_UIFocusDisplayLinkScrollAnimator *)self _updateHeartbeatConfiguration];
  }
}

- (void)_updateHeartbeatConfiguration
{
  displayLink = self->_displayLink;
  timer = self->_timer;
  if (self->_singleScrollableContainerEntry)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v5 = [(NSMapTable *)self->_scrollableContainers count] != 0;
    if (!v5) {
      goto LABEL_11;
    }
  }
  if (displayLink) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = timer == 0;
  }
  if (v6)
  {
    self->_lastHeartbeatTime = CFAbsoluteTimeGetCurrent();
    if ([(_UIFocusDisplayLinkScrollAnimator *)self _canCreateDisplayLink])
    {
      id v7 = [(UIScreen *)self->_screen displayLinkWithTarget:self selector:sel__displayLinkHeartbeat_];
      uint64_t v8 = self->_displayLink;
      self->_displayLink = v7;

      BOOL v9 = self->_displayLink;
      double v10 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v9 addToRunLoop:v10 forMode:*MEMORY[0x1E4F1C4B0]];

      _UIQOSManagedCommitsBegin(self, @"FocusScrollAnimation");
      double v11 = @"Focus scroll animator, display link";
    }
    else
    {
      double v16 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__timerHeartbeat_ selector:0 userInfo:1 repeats:0.0166666667];
      double v17 = self->_timer;
      self->_timer = v16;

      double v18 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v18 addTimer:self->_timer forMode:*MEMORY[0x1E4F1C4B0]];

      double v11 = @"Focus scroll animator, timer";
    }
    if ([(_UIFocusDisplayLinkScrollAnimator *)self _shouldPushAndPopRunLoopModes])
    {
      int v19 = (void *)UIApp;
      [v19 _pushRunLoopMode:@"UITrackingRunLoopMode" requester:self reason:v11];
    }
    return;
  }
LABEL_11:
  if (displayLink) {
    char v12 = v5;
  }
  else {
    char v12 = 1;
  }
  if ((v12 & 1) == 0)
  {
    [(CADisplayLink *)self->_displayLink invalidate];
    double v20 = self->_displayLink;
    self->_displayLink = 0;

    _UIQOSManagedCommitsEnd(self, @"FocusScrollAnimation");
    if (![(_UIFocusDisplayLinkScrollAnimator *)self _shouldPushAndPopRunLoopModes]) {
      return;
    }
    long double v14 = (void *)UIApp;
    double v15 = @"Focus scroll animator, display link";
    goto LABEL_27;
  }
  if (!timer) {
    LOBYTE(v5) = 1;
  }
  if (!v5)
  {
    [(NSTimer *)self->_timer invalidate];
    double v13 = self->_timer;
    self->_timer = 0;

    if ([(_UIFocusDisplayLinkScrollAnimator *)self _shouldPushAndPopRunLoopModes])
    {
      long double v14 = (void *)UIApp;
      double v15 = @"Focus scroll animator, timer";
LABEL_27:
      [v14 _popRunLoopMode:@"UITrackingRunLoopMode" requester:self reason:v15];
    }
  }
}

- (BOOL)_shouldPushAndPopRunLoopModes
{
  return 0;
}

- (void)_displayLinkHeartbeat:(id)a3
{
  id v8 = a3;
  [v8 timestamp];
  uint64_t v5 = _UIMachTimeForMediaTime(v4);
  [v8 targetTimestamp];
  uint64_t v7 = _UIMachTimeForMediaTime(v6);
  _UIQOSProcessingBegin("UIFocusScrollAnimator", 0, v5, v7);
  [(_UIFocusDisplayLinkScrollAnimator *)self _commonHeartbeat];
  _UIQOSProcessingEnd();
}

- (void)_commonHeartbeat
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  [(_UIFocusDisplayLinkScrollAnimator *)self _commonHeartbeat:Current - self->_lastHeartbeatTime];
  self->_lastHeartbeatTime = Current;
}

- (void)_commonHeartbeat:(double)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (uint64_t)(a3 * 1000.0);
  if (v3 >= 1)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    double v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [(NSMapTable *)self->_scrollableContainers objectEnumerator];
    singleScrollableContainerEntrdouble y = self->_singleScrollableContainerEntry;
    if (singleScrollableContainerEntry) {
      [(_UIFocusDisplayLinkScrollAnimator *)self _processEntry:singleScrollableContainerEntry timeDelta:v3 completed:v5 cancelled:v6];
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v45 != v12) {
            objc_enumerationMutation(v9);
          }
          [(_UIFocusDisplayLinkScrollAnimator *)self _processEntry:*(void *)(*((void *)&v44 + 1) + 8 * i) timeDelta:v3 completed:v5 cancelled:v6];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
      }
      while (v11);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v14 = v6;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(v14);
          }
          int v19 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          double v20 = [v19 completion];

          if (v20)
          {
            __int16 v21 = [v19 completion];
            v21[2](v21, 0);
          }
          [(_UIFocusDisplayLinkScrollAnimator *)self _removeEntry:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v16);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v22 = v5;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v36 + 1) + 8 * k);
          objc_msgSend(v27, "targetContentOffset", (void)v36);
          double v29 = v28;
          double v31 = v30;
          __int16 v32 = [v27 environmentScrollableContainer];
          v33 = [v32 scrollableContainer];
          objc_msgSend(v33, "setContentOffset:", v29, v31);

          uint64_t v34 = [v27 completion];

          if (v34)
          {
            v35 = [v27 completion];
            v35[2](v35, 1);
          }
          [(_UIFocusDisplayLinkScrollAnimator *)self _removeEntry:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v24);
    }

    [(_UIFocusDisplayLinkScrollAnimator *)self _updateHeartbeatConfiguration];
  }
}

- (void)_removeEntry:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v4 = (_UIFocusEngineScrollableContainerOffsets *)a3;
  if ((*(unsigned char *)__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2607E0) & 1) == 0)
  {
    uint64_t v5 = *(id *)(__UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2607F0) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [(_UIFocusEngineScrollableContainerOffsets *)v4 environmentScrollableContainer];
      uint64_t v7 = [v6 owningEnvironment];
      if (v7)
      {
        id v8 = NSString;
        id v9 = (objc_class *)objc_opt_class();
        uint64_t v10 = NSStringFromClass(v9);
        uint64_t v11 = [v8 stringWithFormat:@"<%@: %p>", v10, v7];
      }
      else
      {
        uint64_t v11 = @"(nil)";
      }
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Removing focus scroll animator entry for environment %@", buf, 0xCu);
    }
LABEL_7:

    goto LABEL_8;
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIFocus", &qword_1EB2607E8);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    uint64_t v5 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [(_UIFocusEngineScrollableContainerOffsets *)v4 environmentScrollableContainer];
      uint64_t v17 = [v16 owningEnvironment];
      if (v17)
      {
        double v18 = NSString;
        int v19 = (objc_class *)objc_opt_class();
        double v20 = NSStringFromClass(v19);
        __int16 v21 = [v18 stringWithFormat:@"<%@: %p>", v20, v17];
      }
      else
      {
        __int16 v21 = @"(nil)";
      }
      id v22 = (void *)MEMORY[0x1E4F29060];
      uint64_t v23 = v21;
      uint64_t v24 = [v22 callStackSymbols];
      *(_DWORD *)buf = 138412546;
      v26 = v21;
      __int16 v27 = 2114;
      double v28 = v24;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Removing focus scroll animator entry for environment %@\n%{public}@", buf, 0x16u);
    }
    goto LABEL_7;
  }
LABEL_8:
  if (self->_singleScrollableContainerEntry == v4)
  {
    self->_singleScrollableContainerEntrdouble y = 0;
  }
  scrollableContainers = self->_scrollableContainers;
  if (scrollableContainers)
  {
    double v13 = [(_UIFocusEngineScrollableContainerOffsets *)v4 environmentScrollableContainer];
    id v14 = [v13 scrollableContainer];
    [(NSMapTable *)scrollableContainers removeObjectForKey:v14];
  }
}

- (void)_processEntry:(id)a3 timeDelta:(int64_t)a4 completed:(id)a5 cancelled:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = [v10 environmentScrollableContainer];
  id v14 = [v13 owningEnvironment];

  uint64_t v15 = _UIFocusEnvironmentRootAncestorEnvironment(v14);

  if (!v15)
  {
    v61 = v12;
LABEL_20:
    [v61 addObject:v10];
    goto LABEL_23;
  }
  [v10 lastContentOffset];
  double v17 = v16;
  double v19 = v18;
  [v10 targetContentOffset];
  double v21 = v20;
  double v23 = v22;
  double v24 = vabdd_f64(v19, v22);
  if (vabdd_f64(v17, v20) < 0.5 && v24 < 0.5)
  {
    v61 = v11;
    goto LABEL_20;
  }
  [v10 convergenceRate];
  long double v27 = pow(v26, (double)a4);
  long double v28 = v17 * v27 + v21 * (1.0 - v27);
  long double v29 = v19 * v27 + v23 * (1.0 - v27);
  [v10 lastVelocity];
  double v31 = v30;
  double v33 = v32;
  -[_UIFocusDisplayLinkScrollAnimator _applyAccelerationLimitToAcceleration:currentOffset:targetOffset:](self, "_applyAccelerationLimitToAcceleration:currentOffset:targetOffset:", (double)(v28 - v17 - v30), (double)(v29 - v19 - v32), v17, v19, v21, v23);
  double v35 = v31 + v34;
  double v37 = v33 + v36;
  -[_UIFocusDisplayLinkScrollAnimator _hyperJumpContentOffsetIfNecessaryForEntry:currentOffset:](self, "_hyperJumpContentOffsetIfNecessaryForEntry:currentOffset:", v10, v17, v19);
  double v39 = v38 + v35;
  double v41 = v40 + v37;
  long long v42 = [v10 environmentScrollableContainer];
  long long v43 = [v42 scrollableContainer];

  [v43 contentOffset];
  double v45 = v44;
  double v47 = v46;
  [v10 lastRoundedOffset];
  double v49 = v45 - v48;
  double v51 = v47 - v50;
  if ((v49 != *MEMORY[0x1E4F1DAD8] || v51 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    && [v10 adjustsTargetsOnContentOffsetChanges])
  {
    double v39 = v39 + v49;
    double v41 = v41 + v51;
    [v10 targetContentOffset];
    objc_msgSend(v10, "setTargetContentOffset:", v49 + v52, v51 + v53);
  }
  v54 = +[UIWindow _applicationKeyWindow];
  [v54 _currentScreenScale];
  double v56 = UIPointRoundToScale(v39, v41, v55);
  double v58 = v57;

  if (fabs(v39) == INFINITY
    || fabs(v41) == INFINITY
    || fabs(v56) == INFINITY
    || (double v59 = fabs(v58), v59 >= INFINITY) && v59 <= INFINITY)
  {
    v60 = *(NSObject **)(__UILogGetCategoryCachedImpl("FocusScroll", &_processEntry_timeDelta_completed_cancelled____s_category)+ 8);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      int v62 = 134219010;
      double v63 = v39;
      __int16 v64 = 2048;
      double v65 = v41;
      __int16 v66 = 2048;
      double v67 = v56;
      __int16 v68 = 2048;
      double v69 = v58;
      __int16 v70 = 2112;
      v71 = v43;
      _os_log_impl(&dword_1853B0000, v60, OS_LOG_TYPE_ERROR, "Focus entry attempted to scroll container to non-finite location: (%g, %g) rounded to (%g, %g) in container %@", (uint8_t *)&v62, 0x34u);
    }
    [v11 addObject:v10];
  }
  else
  {
    objc_msgSend(v10, "setLastContentOffset:", v39, v41);
    objc_msgSend(v10, "setLastRoundedOffset:", v56, v58);
    objc_msgSend(v43, "setContentOffset:", v56, v58);
    objc_msgSend(v10, "setLastVelocity:", v35, v37);
  }

LABEL_23:
}

- (CGPoint)_applyAccelerationLimitToAcceleration:(CGPoint)a3 currentOffset:(CGPoint)a4 targetOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  int8x16_t v22 = *(int8x16_t *)&a3.y;
  int v9 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_FocusScrollAccelerationLimit, @"FocusScrollAccelerationLimit");
  double v13 = a3.x;
  if (v9) {
    double v14 = 10.0;
  }
  else {
    double v14 = *(double *)&qword_1E8FD5250;
  }
  *(double *)v11.i64 = x - v8;
  v10.i64[0] = 1.0;
  v15.f64[0] = NAN;
  v15.f64[1] = NAN;
  int8x16_t v16 = (int8x16_t)vnegq_f64(v15);
  BOOL v17 = *(double *)vbslq_s8(v16, v10, (int8x16_t)a3).i64 == *(double *)vbslq_s8(v16, v10, v11).i64;
  double v18 = -v14;
  if (v17)
  {
    if (a3.x <= v18) {
      double v19 = -v14;
    }
    else {
      double v19 = a3.x;
    }
    if (v14 <= v19) {
      double v13 = v14;
    }
    else {
      double v13 = v19;
    }
  }
  double v20 = *(double *)v22.i64;
  *(double *)v12.i64 = y - v7;
  if (*(double *)vbslq_s8(v16, v10, v22).i64 == *(double *)vbslq_s8(v16, v10, v12).i64)
  {
    if (*(double *)v22.i64 <= v18) {
      double v20 = -v14;
    }
    if (v14 <= v20) {
      double v20 = v14;
    }
  }
  result.double y = v20;
  result.double x = v13;
  return result;
}

- (CGPoint)_hyperJumpContentOffsetIfNecessaryForEntry:(id)a3 currentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  if (_UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_FocusScrollPageLimit, @"FocusScrollPageLimit"))double v7 = 2.0; {
  else
  }
    double v7 = *(double *)&qword_1E8FD5260;
  [v6 startContentOffset];
  double v31 = v8;
  double v10 = v9;
  [v6 targetContentOffset];
  double v12 = v11;
  double v14 = v13;
  float64x2_t v15 = [v6 environmentScrollableContainer];

  int8x16_t v16 = [v15 scrollableContainer];
  [v16 visibleSize];
  double v18 = v17;
  double v20 = v19;

  *(double *)v22.i64 = v14 - y;
  double v23 = fabs(v12 - x);
  *(double *)v24.i64 = v7 * v18;
  BOOL v25 = vabdd_f64(x, v31) < v18 || v23 < *(double *)v24.i64;
  v26.f64[0] = NAN;
  v26.f64[1] = NAN;
  int8x16_t v27 = (int8x16_t)vnegq_f64(v26);
  *(double *)v21.i64 = v12 - x;
  *(double *)v21.i64 = v12 - *(double *)vbslq_s8(v27, v24, v21).i64;
  if (v25) {
    *(double *)v21.i64 = x;
  }
  double v28 = fabs(*(double *)v22.i64);
  *(double *)v24.i64 = v7 * v20;
  BOOL v29 = fabs(y - v10) < v20 || v28 < *(double *)v24.i64;
  double v30 = v14 - *(double *)vbslq_s8(v27, v24, v22).i64;
  if (v29) {
    double v30 = y;
  }
  result.double x = *(double *)v21.i64;
  result.double y = v30;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_scrollableContainers, 0);
  objc_storeStrong((id *)&self->_singleScrollableContainerEntry, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end