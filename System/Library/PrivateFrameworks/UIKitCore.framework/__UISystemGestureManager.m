@interface __UISystemGestureManager
- (BKSTouchStream)touchStream;
- (BOOL)achievedMaximumMovement;
- (BOOL)didProcessPendingSwipeBegan;
- (BOOL)didSeeExclusiveTouchBegan;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (NSSet)gestureRecognizers;
- (NSString)description;
- (UIGestureRecognizer)catchEdgeSwipeFailureGesture;
- (UIGestureRecognizer)directTouchGesture;
- (UIGestureRecognizer)exclusiveTouchGesture;
- (UIGestureRecognizer)pendingSwipeGesture;
- (__UISystemGestureManager)initWithDisplayIdentity:(id)a3;
- (id)windowForSystemGestures;
- (unsigned)_dispatchModeForExternalGestureCompletion;
- (void)_addInternalGesturesToView:(id)a3;
- (void)_catchSwipeFailureGestureChanged:(id)a3;
- (void)_directTouchDown:(id)a3;
- (void)_exclusiveTouchGestureChanged:(id)a3;
- (void)_exclusiveTouchGestureDidTerminate:(id)a3;
- (void)_externalGestureRecognizerChanged:(id)a3;
- (void)_failedPendingSwipe;
- (void)_handleTooMuchMovementWithLastTouchTimestamp:(double)a3;
- (void)_pendingSwipeGestureChanged:(id)a3;
- (void)_pendingSwipeGestureDidBegin:(id)a3;
- (void)_pendingSwipeGestureDidTerminate:(id)a3;
- (void)_removeInternalGestures;
- (void)addGestureRecognizer:(id)a3;
- (void)addGestureRecognizer:(id)a3 recognitionEvent:(int64_t)a4;
- (void)clearTransform;
- (void)dealloc;
- (void)exclusiveTouchGestureRecognizer:(id)a3 achievedMaximumAbsoluteAccumulatedMovement:(BOOL)a4 timestamp:(double)a5;
- (void)removeGestureRecognizer:(id)a3;
- (void)setAchievedMaximumMovement:(BOOL)a3;
- (void)setCatchEdgeSwipeFailureGesture:(id)a3;
- (void)setDidProcessPendingSwipeBegan:(BOOL)a3;
- (void)setDidSeeExclusiveTouchBegan:(BOOL)a3;
- (void)setDirectTouchGesture:(id)a3;
- (void)setExclusiveTouchGesture:(id)a3;
- (void)setPendingSwipeGesture:(id)a3;
- (void)setTouchStream:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation __UISystemGestureManager

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_pendingSwipeGesture == a3 || self->_catchEdgeSwipeFailureGesture == a3 || self->_directTouchGesture == a3) {
    return 1;
  }
  id v7 = [(__UISystemGestureManager *)self exclusiveTouchGesture];

  if (v7 != a3) {
    return 0;
  }
  if ([(NSMutableSet *)self->_externalGestures containsObject:a4]) {
    return [a4 _recognitionEvent] != 1;
  }
  internalGestures = self->_internalGestures;
  return [(NSMutableSet *)internalGestures containsObject:a4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = [(__UISystemGestureManager *)self exclusiveTouchGesture];
  if (v7 == a3)
  {
    int v8 = [(NSMutableSet *)self->_externalGestures containsObject:a4];

    if (v8 && [a4 _recognitionEvent] == 1)
    {
      if (_UIApplicationProcessIsCarousel() && _UIGetLogMoarUISystemGestureLogsForCarousel())
      {
        v9 = _systemGestureLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [a3 _briefDescription];
          v11 = [a4 _briefDescription];
          int v17 = 138543618;
          v18 = v10;
          __int16 v19 = 2114;
          v20 = v11;
          v12 = "shouldRequireFailureOfGestureRecognizer: YES exclusive touch and FirstTouchDown: gestureRecognizer: %{pu"
                "blic}@; otherGestureRecognizer: %{public}@";
LABEL_15:
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, 0x16u);
        }
LABEL_16:
        BOOL v13 = 1;
        goto LABEL_22;
      }
      return 1;
    }
  }
  else
  {
  }
  if (self->_catchEdgeSwipeFailureGesture == a3
    && [(NSMutableSet *)self->_externalEdgeSwipeGestures containsObject:a4])
  {
    if (_UIApplicationProcessIsCarousel() && _UIGetLogMoarUISystemGestureLogsForCarousel())
    {
      v9 = _systemGestureLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [a3 _briefDescription];
        v11 = [a4 _briefDescription];
        int v17 = 138543618;
        v18 = v10;
        __int16 v19 = 2114;
        v20 = v11;
        v12 = "shouldRequireFailureOfGestureRecognizer: YES edge swipes: gestureRecognizer: %{public}@; otherGestureRecog"
              "nizer: %{public}@";
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    return 1;
  }
  if (!_UIApplicationProcessIsCarousel() || !_UIGetLogMoarUISystemGestureLogsForCarousel()) {
    return 0;
  }
  v9 = _systemGestureLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [a3 _briefDescription];
    v15 = [a4 _briefDescription];
    int v17 = 138543618;
    v18 = v14;
    __int16 v19 = 2114;
    v20 = v15;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "shouldRequireFailureOfGestureRecognizer: NO default: gestureRecognizer: %{public}@; otherGestureRecognizer: %{public}@",
      (uint8_t *)&v17,
      0x16u);
  }
  BOOL v13 = 0;
LABEL_22:

  return v13;
}

- (UIGestureRecognizer)exclusiveTouchGesture
{
  return self->_exclusiveTouchGesture;
}

- (void)addGestureRecognizer:(id)a3 recognitionEvent:(int64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"__UISystemGestureManager.m", 311, @"Invalid parameter not satisfying: %@", @"recognitionEvent != _UISystemGestureRecognitionEventUnknown" object file lineNumber description];
  }
  int v8 = self->_systemGestureWindow;
  if (!v8)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"__UISystemGestureManager.m", 314, @"failed to find a rootWindow for displayIdentity=%@", self->_displayIdentity object file lineNumber description];
  }
  v9 = [(_UISystemGestureWindow *)v8 _systemGestureView];
  if (_UIApplicationProcessIsCarousel() && _UIGetLogMoarUISystemGestureLogsForCarousel())
  {
    v10 = _systemGestureLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [a3 _briefDescription];
      v12 = (void *)v11;
      if ((unint64_t)a4 > 3) {
        BOOL v13 = "<nil>";
      }
      else {
        BOOL v13 = off_1E52F0E60[a4];
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v11;
      __int16 v28 = 2082;
      v29 = v13;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "Adding gesture to system gesture manager: %{public}@; with recognition event: %{public}s",
        buf,
        0x16u);
    }
  }
  if (![(NSMutableSet *)self->_externalGestures count])
  {
    v14 = +[UIScreen _screenWithFBSDisplayIdentity:self->_displayIdentity];
    v15 = [v14 displayConfiguration];

    if (!v15)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      displayIdentity = self->_displayIdentity;
      v25 = +[UIScreen _screens]();
      [v23 handleFailureInMethod:a2, self, @"__UISystemGestureManager.m", 323, @"failed to find the hardwareIdentifier for displayIdentity=%@ -> displays=%@", displayIdentity, v25 object file lineNumber description];
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F4F3A8]);
    id v17 = objc_alloc(MEMORY[0x1E4F4F3F8]);
    uint64_t v18 = [(UIWindow *)v8 _contextId];
    __int16 v19 = [v15 hardwareIdentifier];
    v20 = (void *)[v17 initWithContextID:v18 displayUUID:v19 identifier:1 policy:v16];

    [(__UISystemGestureManager *)self setTouchStream:v20];
    [(__UISystemGestureManager *)self _addInternalGesturesToView:v9];
  }
  [a3 _setRecognitionEvent:a4];
  if (a4 == 3)
  {
    [(NSMutableSet *)self->_externalEdgeSwipeGestures addObject:a3];
    [(UIGestureRecognizer *)self->_catchEdgeSwipeFailureGesture setEnabled:1];
    [(UIGestureRecognizer *)self->_pendingSwipeGesture setEnabled:1];
  }
  [(NSMutableSet *)self->_externalGestures addObject:a3];
  [a3 addTarget:self action:sel__externalGestureRecognizerChanged_];
  [a3 _setRequiresSystemGesturesToFail:0];
  [v9 addGestureRecognizer:a3];
}

- (id)windowForSystemGestures
{
  return self->_systemGestureWindow;
}

- (void)setAchievedMaximumMovement:(BOOL)a3
{
  self->_achievedMaximumMovement = a3;
}

- (void)exclusiveTouchGestureRecognizer:(id)a3 achievedMaximumAbsoluteAccumulatedMovement:(BOOL)a4 timestamp:(double)a5
{
  if (a4)
  {
    BSRunLoopPerformRelativeToCACommit();
  }
  else
  {
    -[__UISystemGestureManager setAchievedMaximumMovement:](self, "setAchievedMaximumMovement:", 0, a5);
  }
}

- (void)_exclusiveTouchGestureChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  switch([a3 state])
  {
    case 1:
      [(NSMutableSet *)self->_recognizingGestures addObject:a3];
      kdebug_trace();
      if ([(NSMutableSet *)self->_recognizingGestures count] == 1)
      {
        uint64_t v5 = [(__UISystemGestureManager *)self _dispatchModeForExternalGestureCompletion];
        v6 = _systemGestureLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          if (v5 > 3) {
            v12 = @"<unknown>";
          }
          else {
            v12 = off_1E52F0E80[(char)v5];
          }
          int v14 = 138543362;
          v15 = v12;
          _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "Exclusive touch began -- moving to dispatch mode:%{public}@", (uint8_t *)&v14, 0xCu);
        }

        touchStream = self->_touchStream;
        [a3 lastTouchTimestamp];
        -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", v5, 2);
      }
      else
      {
        uint64_t v11 = _systemGestureLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          int v13 = [(NSMutableSet *)self->_recognizingGestures count];
          int v14 = 67109120;
          LODWORD(v15) = v13;
          _os_log_debug_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEBUG, "Exclusive touch began, with %d simultaneous gesture(s)", (uint8_t *)&v14, 8u);
        }
      }
      self->_didSeeExclusiveTouchBegan = 1;
      return;
    case 3:
      v9 = _systemGestureLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v14) = 0;
      v10 = "Exclusive touch ended";
      break;
    case 4:
      v9 = _systemGestureLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v14) = 0;
      v10 = "Exclusive touch cancelled";
      break;
    case 5:
      v9 = _systemGestureLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v14) = 0;
      v10 = "Exclusive touch failed";
      break;
    default:
      int v8 = _systemGestureLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 67109120;
        LODWORD(v15) = [a3 state];
        _os_log_debug_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEBUG, "Exclusive touch ignored state:%d", (uint8_t *)&v14, 8u);
      }

      return;
  }
  _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 2u);
LABEL_13:

  [(__UISystemGestureManager *)self _exclusiveTouchGestureDidTerminate:a3];
}

- (void)_exclusiveTouchGestureDidTerminate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  -[NSMutableSet removeObject:](self->_recognizingGestures, "removeObject:");
  if (!self->_didSeeExclusiveTouchBegan)
  {
    uint64_t v5 = [(__UISystemGestureManager *)self _dispatchModeForExternalGestureCompletion];
    v6 = _systemGestureLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v5 > 3) {
        id v7 = @"<unknown>";
      }
      else {
        id v7 = off_1E52F0E80[(char)v5];
      }
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_INFO, ">>>>> Exclusive touch terminated without .Began, posting remedial state dispatch mode change:%{public}@", (uint8_t *)&v9, 0xCu);
    }

    touchStream = self->_touchStream;
    [a3 lastTouchTimestamp];
    -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", v5, 2);
  }
  self->_didSeeExclusiveTouchBegan = 0;
}

- (unsigned)_dispatchModeForExternalGestureCompletion
{
  if ([(NSMutableSet *)self->_externalEdgeSwipeGestures count]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_directTouchDown:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v4 = self->_recognizingGestures;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v29;
    *(void *)&long long v6 = 138412290;
    long long v27 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        if (-[NSMutableSet containsObject:](self->_externalGestures, "containsObject:", v10, v27, (void)v28))
        {
          uint64_t v11 = _systemGestureLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v16 = [v10 name];
            id v17 = v16;
            if (v16)
            {
              id v19 = v16;
            }
            else
            {
              uint64_t v18 = (objc_class *)objc_opt_class();
              NSStringFromClass(v18);
              id v19 = (id)objc_claimAutoreleasedReturnValue();
            }
            v20 = v19;

            *(_DWORD *)buf = v27;
            v33 = v20;
            _os_log_debug_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEBUG, "check recognizing %@", buf, 0xCu);
          }
          v12 = [v10 allowedTouchTypes];
          if ([v12 containsObject:&unk_1ED3F4260])
          {
            if (v10)
            {
              unint64_t v13 = v10[9] - 1;

              if (v13 < 3) {
                goto LABEL_19;
              }
            }
            else
            {
            }
            int v14 = _systemGestureLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v21 = [v10 name];
              v22 = v21;
              if (v21)
              {
                id v24 = v21;
              }
              else
              {
                v23 = (objc_class *)objc_opt_class();
                NSStringFromClass(v23);
                id v24 = (id)objc_claimAutoreleasedReturnValue();
              }
              v25 = v24;

              *(_DWORD *)buf = v27;
              v33 = v25;
              _os_log_debug_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEBUG, "CANCEL indirect %@", buf, 0xCu);
            }
            if (v10 && (v10[1] & 0x200000000) != 0) {
              [v10 setState:5];
            }
            exclusiveTouchGesture = self->_exclusiveTouchGesture;
            if (exclusiveTouchGesture && (*(void *)&exclusiveTouchGesture->_gestureFlags & 0x200000000) != 0) {
              [(UIGestureRecognizer *)exclusiveTouchGesture setState:5];
            }
          }
          else
          {
          }
        }
LABEL_19:
        ++v9;
      }
      while (v7 != v9);
      uint64_t v26 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
      uint64_t v7 = v26;
    }
    while (v26);
  }
}

- (__UISystemGestureManager)initWithDisplayIdentity:(id)a3
{
  if (!a3)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"__UISystemGestureManager.m", 135, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];
  }
  v42.receiver = self;
  v42.super_class = (Class)__UISystemGestureManager;
  uint64_t v5 = [(__UISystemGestureManager *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [a3 copy];
    displayIdentity = v5->_displayIdentity;
    v5->_displayIdentity = (FBSDisplayIdentity *)v6;

    uint64_t v8 = +[UIScreen _screenWithFBSDisplayIdentity:v5->_displayIdentity];
    uint64_t v9 = [v8 displayConfiguration];

    v33 = (void *)v9;
    v10 = [[_UISystemGestureWindow alloc] initWithDisplayConfiguration:v9];
    systemGestureWindow = v5->_systemGestureWindow;
    v5->_systemGestureWindow = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    recognizingGestures = v5->_recognizingGestures;
    v5->_recognizingGestures = v12;

    int v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    internalGestures = v5->_internalGestures;
    v5->_internalGestures = v14;

    uint64_t v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    externalGestures = v5->_externalGestures;
    v5->_externalGestures = v16;

    uint64_t v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    externalEdgeSwipeGestures = v5->_externalEdgeSwipeGestures;
    v5->_externalEdgeSwipeGestures = v18;

    v20 = objc_alloc_init(_UIExclusiveTouchGestureRecognizer);
    [(UIGestureRecognizer *)v20 _setRequiresSystemGesturesToFail:0];
    [(UIGestureRecognizer *)v20 setRequiresExclusiveTouchType:0];
    uint64_t v21 = [(UIGestureRecognizer *)v20 allowedTouchTypes];
    v22 = (void *)[v21 mutableCopy];

    [v22 removeObject:&unk_1ED3F4260];
    [(UIGestureRecognizer *)v20 setAllowedTouchTypes:v22];
    [(UIGestureRecognizer *)v20 addTarget:v5 action:sel__exclusiveTouchGestureChanged_];
    [(UIGestureRecognizer *)v20 setDelegate:v5];
    -[_UIExclusiveTouchGestureRecognizer setMaximumAbsoluteAccumulatedMovement:](v20, "setMaximumAbsoluteAccumulatedMovement:", 10.0, 10.0);
    [(__UISystemGestureManager *)v5 setExclusiveTouchGesture:v20];
    [(NSMutableSet *)v5->_internalGestures addObject:v20];
    v23 = objc_alloc_init(_UIPendingEdgeSwipeGestureRecognizer);
    [(UIGestureRecognizer *)v23 _setRequiresSystemGesturesToFail:0];
    [(UIGestureRecognizer *)v23 setRequiresExclusiveTouchType:0];
    [(UIGestureRecognizer *)v23 addTarget:v5 action:sel__pendingSwipeGestureChanged_];
    [(UIGestureRecognizer *)v23 setDelegate:v5];
    [(__UISystemGestureManager *)v5 setPendingSwipeGesture:v23];
    [(NSMutableSet *)v5->_internalGestures addObject:v23];
    id v24 = objc_alloc_init(UIImmediateEdgeSwipeGestureRecognizer);
    [(UIGestureRecognizer *)v24 _setRequiresSystemGesturesToFail:0];
    [(UIGestureRecognizer *)v24 setRequiresExclusiveTouchType:0];
    [(UIGestureRecognizer *)v24 addTarget:v5 action:sel__catchSwipeFailureGestureChanged_];
    [(UIGestureRecognizer *)v24 setDelegate:v5];
    [(__UISystemGestureManager *)v5 setCatchEdgeSwipeFailureGesture:v24];
    [(NSMutableSet *)v5->_internalGestures addObject:v24];
    v25 = objc_alloc_init(_UIDirectTouchObserverGestureRecognizer);
    [(UIGestureRecognizer *)v25 setAllowedTouchTypes:&unk_1ED3EFBC0];
    [(UIGestureRecognizer *)v25 _setRequiresSystemGesturesToFail:0];
    [(UIGestureRecognizer *)v25 setRequiresExclusiveTouchType:0];
    [(UIGestureRecognizer *)v25 setDelegate:v5];
    [(UIGestureRecognizer *)v25 addTarget:v5 action:sel__directTouchDown_];
    [(__UISystemGestureManager *)v5 setDirectTouchGesture:v25];
    [(NSMutableSet *)v5->_internalGestures addObject:v25];
    [(UIGestureRecognizer *)v24 setEnabled:0];
    [(UIGestureRecognizer *)v23 setEnabled:0];
    objc_initWeak(&location, v5->_internalGestures);
    objc_initWeak(&v40, v5->_externalGestures);
    objc_initWeak(&v39, v5->_externalEdgeSwipeGestures);
    objc_initWeak(&from, v5->_systemGestureWindow);
    id v26 = MEMORY[0x1E4F14428];
    long long v27 = [NSString stringWithFormat:@"UIKit - SystemGestureState - %@", a3];
    objc_copyWeak(&v34, &from);
    objc_copyWeak(&v35, &location);
    objc_copyWeak(&v36, &v40);
    objc_copyWeak(&v37, &v39);
    uint64_t v28 = BSLogAddStateCaptureBlockWithTitle();
    stateCaptureToken = v5->_stateCaptureToken;
    v5->_stateCaptureToken = (BSInvalidatable *)v28;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)_addInternalGesturesToView:(id)a3
{
  internalGestures = self->_internalGestures;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55____UISystemGestureManager__addInternalGesturesToView___block_invoke;
  v4[3] = &unk_1E52F0E40;
  v4[4] = a3;
  [(NSMutableSet *)internalGestures enumerateObjectsUsingBlock:v4];
}

- (void)_removeInternalGestures
{
  internalGestures = self->_internalGestures;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51____UISystemGestureManager__removeInternalGestures__block_invoke;
  v3[3] = &unk_1E52F0E40;
  v3[4] = self;
  [(NSMutableSet *)internalGestures enumerateObjectsUsingBlock:v3];
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureToken invalidate];
  [(__UISystemGestureManager *)self _removeInternalGestures];
  [(BKSTouchStream *)self->_touchStream invalidate];
  [(UIWindow *)self->_systemGestureWindow setWindowScene:0];
  v3.receiver = self;
  v3.super_class = (Class)__UISystemGestureManager;
  [(__UISystemGestureManager *)&v3 dealloc];
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)__UISystemGestureManager;
  objc_super v3 = [(__UISystemGestureManager *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"displayIdentity = %@\n", self->_displayIdentity];
  [v4 appendFormat:@"internalGestures = %@\n", self->_internalGestures];
  [v4 appendFormat:@"externalGestures = %@\n", self->_externalGestures];
  [v4 appendFormat:@"externalEdgeSwipeGestures = %@\n", self->_externalEdgeSwipeGestures];
  [v4 appendFormat:@"recognizingGestures = %@\n", self->_recognizingGestures];
  return (NSString *)v4;
}

- (NSSet)gestureRecognizers
{
  v2 = (void *)[(NSMutableSet *)self->_externalGestures copy];
  return (NSSet *)v2;
}

- (void)addGestureRecognizer:(id)a3
{
  if ([a3 _isTouchGestureRecognizer]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [(__UISystemGestureManager *)self addGestureRecognizer:a3 recognitionEvent:v5];
}

- (void)removeGestureRecognizer:(id)a3
{
  uint64_t v5 = [(NSMutableSet *)self->_externalGestures count];
  objc_super v6 = [a3 view];
  [v6 removeGestureRecognizer:a3];

  [a3 removeTarget:self action:0];
  [(NSMutableSet *)self->_externalGestures removeObject:a3];
  [(NSMutableSet *)self->_externalEdgeSwipeGestures removeObject:a3];
  [(NSMutableSet *)self->_recognizingGestures removeObject:a3];
  BOOL v7 = [(NSMutableSet *)self->_externalEdgeSwipeGestures count] != 0;
  [(UIGestureRecognizer *)self->_catchEdgeSwipeFailureGesture setEnabled:v7];
  [(UIGestureRecognizer *)self->_pendingSwipeGesture setEnabled:v7];
  if (![(NSMutableSet *)self->_externalGestures count] && v5)
  {
    [(BKSTouchStream *)self->_touchStream invalidate];
    [(__UISystemGestureManager *)self setTouchStream:0];
    [(__UISystemGestureManager *)self _removeInternalGestures];
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  objc_super v6 = self->_systemGestureWindow;
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"__UISystemGestureManager.m", 381, @"failed to find a rootWindow for displayIdentity=%@, cannot set transform", self->_displayIdentity object file lineNumber description];
  }
  BOOL v7 = [(_UISystemGestureWindow *)v6 _systemGestureView];
  long long v8 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a3->tx;
  [v7 setTransform:v10];
}

- (void)clearTransform
{
  v4 = self->_systemGestureWindow;
  if (!v4)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"__UISystemGestureManager.m", 386, @"failed to find a rootWindow for displayIdentity=%@, cannot remove transform", self->_displayIdentity object file lineNumber description];
  }
  uint64_t v5 = [(_UISystemGestureWindow *)v4 _systemGestureView];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v5 setTransform:v8];
}

- (void)_failedPendingSwipe
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIGestureRecognizer *)self->_pendingSwipeGesture isEnabled];
  v4 = _systemGestureLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
    {
      BOOL v6 = !self->_didProcessPendingSwipeBegan;
      int v8 = 67109120;
      BOOL v9 = v6;
      _os_log_debug_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEBUG, "Caught edge swipe gesture failure (early:%{BOOL}u)", (uint8_t *)&v8, 8u);
    }

    [(UIGestureRecognizer *)self->_pendingSwipeGesture setEnabled:0];
    [(UIGestureRecognizer *)self->_pendingSwipeGesture setEnabled:1];
  }
  else
  {
    if (v5)
    {
      BOOL v7 = !self->_didProcessPendingSwipeBegan;
      int v8 = 67109120;
      BOOL v9 = v7;
      _os_log_debug_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEBUG, "Caught edge swipe gesture failure (early:%{BOOL}u), but we already disabled _pendingSwipeGesture", (uint8_t *)&v8, 8u);
    }
  }
}

- (void)_pendingSwipeGestureDidBegin:(id)a3
{
  if (!self->_didProcessPendingSwipeBegan)
  {
    self->_didProcessPendingSwipeBegan = 1;
    BOOL v5 = _systemGestureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "Pending swipe began -- moving to send / defer", v7, 2u);
    }

    [(NSMutableSet *)self->_recognizingGestures addObject:a3];
    kdebug_trace();
    touchStream = self->_touchStream;
    [a3 lastTouchTimestamp];
    -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", 2, 1);
  }
}

- (void)_pendingSwipeGestureDidTerminate:(id)a3
{
  if (self->_didProcessPendingSwipeBegan)
  {
    self->_didProcessPendingSwipeBegan = 0;
    BOOL v5 = _systemGestureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "Pending swipe terminate -- moving to send / process", v7, 2u);
    }

    touchStream = self->_touchStream;
    [a3 lastTouchTimestamp];
    -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](touchStream, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", 2, 2);
    if (a3) {
      [(NSMutableSet *)self->_recognizingGestures removeObject:a3];
    }
  }
}

- (void)_pendingSwipeGestureChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  switch([a3 state])
  {
    case 1:
      [(__UISystemGestureManager *)self _pendingSwipeGestureDidBegin:a3];
      return;
    case 3:
      BOOL v6 = _systemGestureLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v8[0]) = 0;
      BOOL v7 = "Pending swipe ended";
      break;
    case 4:
      BOOL v6 = _systemGestureLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v8[0]) = 0;
      BOOL v7 = "Pending swipe cancelled";
      break;
    case 5:
      BOOL v6 = _systemGestureLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_13;
      }
      LOWORD(v8[0]) = 0;
      BOOL v7 = "Pending swipe failed";
      break;
    default:
      BOOL v5 = _systemGestureLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v8[0] = 67109120;
        v8[1] = [a3 state];
        _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "Pending swipe ignored state:%d", (uint8_t *)v8, 8u);
      }

      return;
  }
  _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)v8, 2u);
LABEL_13:

  [(__UISystemGestureManager *)self _pendingSwipeGestureDidTerminate:a3];
}

- (void)_catchSwipeFailureGestureChanged:(id)a3
{
  if ([a3 state] == 3)
  {
    [(__UISystemGestureManager *)self _failedPendingSwipe];
  }
}

- (void)_externalGestureRecognizerChanged:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [a3 _recognitionEvent];
  if (v6 != 2)
  {
    uint64_t v7 = v6;
    switch([a3 state])
    {
      case 1:
        kdebug_trace();
        [(NSMutableSet *)self->_recognizingGestures addObject:a3];
        int v8 = [a3 cancelsTouchesInView];
        uint64_t v9 = _systemGestureLog();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
        if (v8)
        {
          if (v10)
          {
            _UIGestureLogDescription(a3);
            v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            objc_super v42 = v33;
            _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "EX %{public}@ began & stealing touches", buf, 0xCu);
          }
          uint64_t v11 = v7 == 3;
          uint64_t v12 = 3;
        }
        else
        {
          if (v10)
          {
            _UIGestureLogDescription(a3);
            id v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            objc_super v42 = v34;
            _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "EX %{public}@ began & also allowing touches to reach app", buf, 0xCu);
          }
          uint64_t v11 = 2;
          uint64_t v12 = 2;
        }
        touchStream = self->_touchStream;
        [a3 lastTouchTimestamp];
        uint64_t v16 = touchStream;
        uint64_t v18 = v12;
        uint64_t v19 = v11;
        goto LABEL_29;
      case 2:
        unint64_t v13 = _systemGestureLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          _UIGestureLogDescription(a3);
          uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          objc_super v42 = v28;
          _os_log_debug_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEBUG, "EX changed %{public}@", buf, 0xCu);
        }
        break;
      case 3:
        kdebug_trace();
        int v14 = _systemGestureLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          _UIGestureLogDescription(a3);
          long long v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          objc_super v42 = v29;
          _os_log_debug_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEBUG, "EX ended %{public}@", buf, 0xCu);
        }
        goto LABEL_16;
      case 4:
        v15 = _systemGestureLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          _UIGestureLogDescription(a3);
          long long v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          objc_super v42 = v30;
          _os_log_debug_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEBUG, "EX cancelled %{public}@", buf, 0xCu);
        }
        kdebug_trace();
LABEL_16:
        [(NSMutableSet *)self->_recognizingGestures removeObject:a3];
        uint64_t v16 = self->_touchStream;
        double v17 = 0.0;
        uint64_t v18 = 2;
        uint64_t v19 = 2;
LABEL_29:
        [(BKSTouchStream *)v16 setEventDispatchMode:v18 ambiguityRecommendation:v19 lastTouchTimestamp:v17];
        break;
      case 5:
        v20 = _systemGestureLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          _UIGestureLogDescription(a3);
          long long v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          objc_super v42 = v31;
          _os_log_debug_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEBUG, "EX failed %{public}@", buf, 0xCu);
        }
        kdebug_trace();
        [(NSMutableSet *)self->_recognizingGestures removeObject:a3];
        externalGestures = self->_externalGestures;
        uint64_t v35 = MEMORY[0x1E4F143A8];
        uint64_t v36 = 3221225472;
        id v37 = __62____UISystemGestureManager__externalGestureRecognizerChanged___block_invoke;
        v38 = &unk_1E52F0DF0;
        id v39 = a3;
        v22 = v5;
        id v40 = v22;
        [(NSMutableSet *)externalGestures enumerateObjectsUsingBlock:&v35];
        v23 = _systemGestureLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          objc_super v42 = v22;
          _os_log_debug_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEBUG, "EX remaining possible: %{public}@", buf, 0xCu);
        }

        if ([(__CFString *)v22 count])
        {
          uint64_t v24 = [(__UISystemGestureManager *)self _dispatchModeForExternalGestureCompletion];
          v25 = _systemGestureLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            if (v24 > 3) {
              v32 = @"<unknown>";
            }
            else {
              v32 = off_1E52F0E80[(char)v24];
            }
            *(_DWORD *)buf = 138543362;
            objc_super v42 = v32;
            _os_log_debug_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEBUG, "External recognizer failed -- moving to dispatch mode:%{public}@", buf, 0xCu);
          }

          id v26 = self->_touchStream;
          if (v7 == 3) {
            [(BKSTouchStream *)v26 setEventDispatchMode:v24 ambiguityRecommendation:2 lastTouchTimestamp:0.0];
          }
          else {
            [(BKSTouchStream *)v26 setEventDispatchMode:v24 lastTouchTimestamp:0.0];
          }
        }

        break;
      default:
        break;
    }
  }
}

- (void)_handleTooMuchMovementWithLastTouchTimestamp:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_recognizingGestures count])
  {
    BOOL v5 = objc_opt_new();
    recognizingGestures = self->_recognizingGestures;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73____UISystemGestureManager__handleTooMuchMovementWithLastTouchTimestamp___block_invoke;
    v11[3] = &unk_1E52F0E18;
    id v7 = v5;
    id v12 = v7;
    [v7 appendCollection:recognizingGestures withName:0 itemBlock:v11];
    int v8 = _systemGestureLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v7 description];
      *(_DWORD *)buf = 138543362;
      int v14 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "UIKit magic hysteresis reached. Gestures still recognizing: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    kdebug_trace();
    BOOL v10 = _systemGestureLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "UIKit magic hysteresis reached with no gestures still recognizing. Moving to send/process.", buf, 2u);
    }

    [(BKSTouchStream *)self->_touchStream setEventDispatchMode:2 ambiguityRecommendation:2 lastTouchTimestamp:a3];
  }
}

- (void)setExclusiveTouchGesture:(id)a3
{
}

- (UIGestureRecognizer)pendingSwipeGesture
{
  return self->_pendingSwipeGesture;
}

- (void)setPendingSwipeGesture:(id)a3
{
}

- (UIGestureRecognizer)catchEdgeSwipeFailureGesture
{
  return self->_catchEdgeSwipeFailureGesture;
}

- (void)setCatchEdgeSwipeFailureGesture:(id)a3
{
}

- (UIGestureRecognizer)directTouchGesture
{
  return self->_directTouchGesture;
}

- (void)setDirectTouchGesture:(id)a3
{
}

- (BOOL)achievedMaximumMovement
{
  return self->_achievedMaximumMovement;
}

- (BOOL)didSeeExclusiveTouchBegan
{
  return self->_didSeeExclusiveTouchBegan;
}

- (void)setDidSeeExclusiveTouchBegan:(BOOL)a3
{
  self->_didSeeExclusiveTouchBegan = a3;
}

- (BOOL)didProcessPendingSwipeBegan
{
  return self->_didProcessPendingSwipeBegan;
}

- (void)setDidProcessPendingSwipeBegan:(BOOL)a3
{
  self->_didProcessPendingSwipeBegan = a3;
}

- (BKSTouchStream)touchStream
{
  return self->_touchStream;
}

- (void)setTouchStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchStream, 0);
  objc_storeStrong((id *)&self->_directTouchGesture, 0);
  objc_storeStrong((id *)&self->_catchEdgeSwipeFailureGesture, 0);
  objc_storeStrong((id *)&self->_pendingSwipeGesture, 0);
  objc_storeStrong((id *)&self->_exclusiveTouchGesture, 0);
  objc_storeStrong((id *)&self->_stateCaptureToken, 0);
  objc_storeStrong((id *)&self->_externalGestures, 0);
  objc_storeStrong((id *)&self->_internalGestures, 0);
  objc_storeStrong((id *)&self->_externalEdgeSwipeGestures, 0);
  objc_storeStrong((id *)&self->_recognizingGestures, 0);
  objc_storeStrong((id *)&self->_systemGestureWindow, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

@end