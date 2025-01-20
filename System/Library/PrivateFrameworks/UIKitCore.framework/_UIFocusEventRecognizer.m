@interface _UIFocusEventRecognizer
+ (BOOL)_canSupportFastScrolling;
- (BOOL)_attemptPanFocusMovementWithHeading:(unint64_t)a3 acceleratedVelocity:(CGPoint)a4 focusSystem:(id)a5 studyLogData:(id)a6;
- (BOOL)_attemptRotaryFocusMovementWithLinearHeading:(unint64_t)a3 directionalHeading:(unint64_t)a4 focusMovementAxis:(int64_t)a5 focusSystem:(id)a6 acceleratedVelocity:(CGPoint)a7 studyLogData:(id)a8;
- (BOOL)_attemptToRecognizeContinuousMovementRequest:(id)a3;
- (BOOL)_buttonMaskTimeHasExpired;
- (BOOL)_canMoveFocusWithRotaryInputInFocusContext:(id)a3;
- (BOOL)_didRecognizeFocusMovementRequest:(id)a3;
- (BOOL)_hasFailedMovementHeadingExpired;
- (BOOL)_hideLinearDebugOverlayIfNecessary:(BOOL)a3;
- (BOOL)_joystickAttemptFocusMovementWithRequest:(id)a3;
- (BOOL)_joystickFocusMovement:(id)a3 shouldBeConsideredEqualToFocusMovement:(id)a4;
- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4;
- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4 withEvaluator:(id)a5;
- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4 withSearchInfo:(id)a5;
- (BOOL)_moveWithEvent:(id)a3;
- (BOOL)_shouldAcceptInputType:(unint64_t)a3;
- (BOOL)_shouldPerformFocusUpdateWithCurrentMomentumStatus;
- (BOOL)focusEnginePanGestureRecognizerShouldRecognizeImmediately:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEnabled;
- (CGPoint)_applyAxisLockingForNormalizedPoint:(CGPoint)a3 toDelta:(CGPoint)a4;
- (CGPoint)_applyButtonMaskTimeToValue:(CGPoint)a3 remoteTouchSurfaceType:(unint64_t)a4;
- (CGPoint)_applyHorizontalFlipForFocusItemInfo:(id)a3 toDelta:(CGPoint)a4;
- (CGPoint)_applyPanDeadbandToValue:(CGPoint)a3 startPoint:(CGPoint)a4 currentPoint:(CGPoint)a5 remoteTouchSurfaceType:(unint64_t)a6;
- (CGPoint)_calculateDeltaForNormalizedPoint:(CGPoint)a3 studyLogData:(id)a4;
- (CGPoint)_pointForLinearValue:(double)a3 axis:(unint64_t)a4;
- (CGSize)_momentumReferenceSize;
- (CGSize)_touchSensitivityForItem:(id)a3 remoteTouchSurfaceType:(unint64_t)a4;
- (CGVector)_accelerationFactorForCurrentVelocity:(CGPoint)a3 alpha:(double)a4 isRotaryGesture:(BOOL)a5 isFocusInKeyboard:(BOOL)a6 remoteTouchSurfaceType:(unint64_t)a7;
- (CGVector)_joystickVelocityForHeading:(unint64_t)a3;
- (NSArray)keyCommands;
- (NSSet)gesturesForFailureRequirements;
- (UIMoveEvent)_moveEvent;
- (UIView)owningView;
- (_UIFocusEffectsController)_motionEffectsController;
- (_UIFocusEventRecognizer)init;
- (_UIFocusEventRecognizer)initWithOwningView:(id)a3;
- (_UIFocusEventRecognizerDelegate)delegate;
- (_UIFocusFastScrollingRecognizer)_fastScrollingRecognizer;
- (double)_joystickRepeatDurationForTimeInMovementZone:(double)a3;
- (id)_createMovementInfoForHeading:(unint64_t)a3 groupFilter:(int64_t)a4 acceleratedVelocity:(CGPoint)a5;
- (id)_createPanMovementRequestWithFocusSystem:(id)a3;
- (id)_createRotaryMovementRequestWithFocusSystem:(id)a3;
- (id)_createStudyLogDataForPanNormalizedPoint:(CGPoint)a3 reportedVelocity:(CGPoint)a4;
- (id)_createStudyLogDataForRotaryDistance:(double)a3 delta:(double)a4 reportedVelocity:(double)a5;
- (id)_focusMovementForJoystickPosition:(CGPoint)a3 usingMinimumRadius:(double)a4 focusMovementStyle:(int64_t)a5;
- (id)_focusMovementSystem;
- (id)_focusSystemSceneComponent;
- (id)_globalCoordinateSpace;
- (id)_retrieveCachedFocusItemInfo;
- (id)_uiktest_panGestureRecognizer;
- (id)currentFocusBehavior;
- (id)gestureForName:(unint64_t)a3;
- (int)_touchRegionForDigitizerLocation:(CGPoint)a3;
- (unint64_t)_calculateDirectionalHeadingForAccumulator:(CGVector)a3 studyLogData:(id)a4;
- (unint64_t)_calculateLinearHeadingForAccumulator:(CGVector)a3 studyLogData:(id)a4;
- (unint64_t)_headingForJoystickPosition:(CGPoint)a3 usingMinimumRadius:(double)a4;
- (unint64_t)_momentumFocusHeadingForAccumulator:(CGVector)a3;
- (void)_beginMomentumImmediatelyWithVelocity:(CGPoint)a3 friction:(double)a4;
- (void)_cancelAllGestureRecognizers;
- (void)_cancelShowRotaryIndicatorTimer;
- (void)_cleanupPanMomentumWithAccumulator:(CGVector)a3 movementSuccess:(BOOL)a4;
- (void)_continueTouchWithMomentum;
- (void)_continuousMovementFailedWithPrimaryHeading:(unint64_t)a3;
- (void)_continuousMovementSucceededWithDirectionalHeading:(unint64_t)a3;
- (void)_exitJoystickModeForReal:(id)a3;
- (void)_focusBehaviorDidChange:(id)a3;
- (void)_focusSystemEnabledStateDidChange:(id)a3;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handleArrowButtonGesture:(id)a3;
- (void)_handleJoystickGesture:(id)a3;
- (void)_handleJoystickRepeatMode:(id)a3;
- (void)_handleJoystickTiltMode:(id)a3;
- (void)_handleLinearDebugOverlayGesture:(id)a3;
- (void)_handlePageButtonGesture:(id)a3;
- (void)_handlePanGesture:(id)a3;
- (void)_handleRotaryBegin:(id)a3;
- (void)_handleRotaryCancelled:(id)a3;
- (void)_handleRotaryEnd:(id)a3;
- (void)_handleRotaryGesture:(id)a3;
- (void)_handleSelectGesture:(id)a3;
- (void)_handleSelectObserverGesture:(id)a3;
- (void)_handleTabulatorGesture:(id)a3;
- (void)_handleTapGesture:(id)a3;
- (void)_hideRotaryIndicator;
- (void)_joystickDisplayLinkHeartbeat:(id)a3;
- (void)_joystickGestureBegan:(id)a3;
- (void)_joystickGestureEnded:(id)a3;
- (void)_joystickGestureUpdated:(id)a3;
- (void)_joystickPerformRepeat:(id)a3;
- (void)_momentumHeartbeat:(id)a3;
- (void)_panGestureCancelled:(id)a3;
- (void)_panGestureEnd:(id)a3;
- (void)_panGestureStart:(id)a3;
- (void)_recordMomentumForPoint:(CGPoint)a3 reportedVelocity:(CGPoint)a4;
- (void)_resetCachedFocusItemInfo;
- (void)_resetContinuousMovementState;
- (void)_resetFailedMovementHeading;
- (void)_resetJoystick;
- (void)_resetMomentum;
- (void)_resetMotionEffects;
- (void)_resetPanDeadband;
- (void)_resetProgressAccumulator;
- (void)_resetProgressAccumulatorWithHeading:(unint64_t)a3;
- (void)_sendGestureBeginNotification;
- (void)_sendMomentumEndNotificationsAndAnimateRollback:(BOOL)a3;
- (void)_setMoveEvent:(id)a3;
- (void)_showLinearDebugOverlay:(BOOL)a3;
- (void)_showRotaryIndicator;
- (void)_showRotaryIndicatorAfterDelay;
- (void)_stopMomentumAndPerformRollback;
- (void)_timerFiredForShowRotaryIndicator:(id)a3;
- (void)_uiktest_setPanGestureRecognizer:(id)a3;
- (void)_updateAccumulatorsWithScaledDelta:(CGPoint)a3 unlockedDelta:(CGPoint)a4 studyLogData:(id)a5;
- (void)_updateFailedContinuousMovementHeading:(unint64_t)a3;
- (void)_updateGestureRecognizersForcingRemoval:(BOOL)a3;
- (void)_updateGestureRecognizersForcingRemoval:(BOOL)a3 studyLogData:(id)a4;
- (void)_updateMotionEffectsControllerWithProgressAccumulator:(CGVector)a3 unlockedAccumulator:(CGVector)a4;
- (void)_updatePanLocation:(CGPoint)a3 reportedVelocity:(CGPoint)a4 remoteTouchSurfaceType:(unint64_t)a5;
- (void)_updateRotaryDistance:(double)a3 delta:(double)a4 reportedVelocity:(double)a5 remoteTouchSurfaceType:(unint64_t)a6 focusMovementAxis:(int64_t)a7;
- (void)_updateRotaryIndicatorView;
- (void)dealloc;
- (void)reset;
- (void)rotaryGestureRecognizerBeganClassifyingMovement:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGesture:(id)a3 forName:(unint64_t)a4;
@end

@implementation _UIFocusEventRecognizer

- (_UIFocusEventRecognizer)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusEventRecognizer.m" lineNumber:301 description:@"-init is not a valid initializer."];

  return 0;
}

- (_UIFocusEventRecognizer)initWithOwningView:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_UIFocusEventRecognizer;
  v5 = [(_UIFocusEventRecognizer *)&v28 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningView, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:0];
    gestureRecognizers = v6->_gestureRecognizers;
    v6->_gestureRecognizers = (NSMapTable *)v7;

    v6->_enabled = 1;
    v9 = objc_alloc_init(_UIFocusEffectsController);
    motionEffectsController = v6->_motionEffectsController;
    v6->_motionEffectsController = v9;

    [(_UIFocusEffectsController *)v6->_motionEffectsController setDisplayOffsetAccumulatorEnabled:1];
    v11 = [v4 traitCollection];
    if ([v11 userInterfaceIdiom] == 2)
    {
    }
    else
    {
      v12 = [v4 traitCollection];
      uint64_t v13 = [v12 userInterfaceIdiom];

      if (v13 != 3)
      {
LABEL_16:
        [(_UIFocusEventRecognizer *)v6 _updateGestureRecognizersForcingRemoval:0];
        v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v20 addObserver:v6 selector:sel__focusSystemEnabledStateDidChange_ name:@"_UIFocusSystemEnabledStateDidChangeNotification" object:0];

        v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v21 addObserver:v6 selector:sel__focusBehaviorDidChange_ name:@"_UIFocusBehaviorDidChangeNotification" object:0];

        v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v22 addObserver:v6 selector:sel__focusDidUpdate_ name:@"UIFocusDidUpdateNotification" object:0];

        goto LABEL_17;
      }
    }
    v14 = [v4 gestureRecognizers];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (([v19 _isGestureType:8] & 1) != 0
            || [v19 _isGestureType:12])
          {
            [v4 removeGestureRecognizer:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v16);
    }

    goto LABEL_16;
  }
LABEL_17:

  return v6;
}

- (void)dealloc
{
  [(_UIFocusEventRecognizer *)self reset];
  [(_UIFocusEventRecognizer *)self _updateGestureRecognizersForcingRemoval:1];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIFocusSystemEnabledStateDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"_UIFocusBehaviorDidChangeNotification" object:0];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UIFocusDidUpdateNotification" object:0];

  v6.receiver = self;
  v6.super_class = (Class)_UIFocusEventRecognizer;
  [(_UIFocusEventRecognizer *)&v6 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    [(_UIFocusEventRecognizer *)self _updateGestureRecognizersForcingRemoval:!a3];
    self->_enabled = a3;
  }
}

- (void)reset
{
  self->_inputType = 0;
  *(_WORD *)&self->_flags &= ~0x80u;
}

- (void)setGesture:(id)a3 forName:(unint64_t)a4
{
  gestureRecognizers = self->_gestureRecognizers;
  if (a3) {
    [(NSMapTable *)gestureRecognizers setObject:a3 forKey:a4];
  }
  else {
    [(NSMapTable *)gestureRecognizers removeObjectForKey:a4];
  }
}

- (id)gestureForName:(unint64_t)a3
{
  return [(NSMapTable *)self->_gestureRecognizers objectForKey:a3];
}

- (void)_updateGestureRecognizersForcingRemoval:(BOOL)a3 studyLogData:(id)a4
{
  id v101 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  uint64_t v7 = [WeakRetained _focusBehavior];
  v8 = v7;
  if (a3) {
    int v9 = 0;
  }
  else {
    int v9 = [v7 supportsIndirectPanningMovement];
  }
  uint64_t v10 = [(_UIFocusEventRecognizer *)self gestureForName:1];
  v11 = (_UIFocusEnginePanGestureRecognizer *)v10;
  if (!v10 && v9)
  {
    v11 = [(UIPanGestureRecognizer *)[_UIFocusEnginePanGestureRecognizer alloc] initWithTarget:self action:sel__handlePanGesture_];
    [(UIGestureRecognizer *)v11 setName:@"com.apple.focus._UIFocusGesturePan"];
    [(UIPanGestureRecognizer *)v11 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v11 forName:1];
    [(UIGestureRecognizer *)v11 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v11 setCancelsTouchesInView:0];
    [(UIPanGestureRecognizer *)v11 _setHysteresis:1.0];
    [(UIGestureRecognizer *)v11 setAllowedTouchTypes:&unk_1ED3EFA40];
    [WeakRetained addGestureRecognizer:v11];
    if (!v101 || !v11) {
      goto LABEL_19;
    }
    v12 = @"add";
    goto LABEL_15;
  }
  if (v10) {
    char v13 = v9;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v10];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:1];
    if (v101)
    {
      v12 = @"remove";
LABEL_15:
      v14 = [NSNumber numberWithUnsignedLong:v11];
      [v101 setObject:v14 forKeyedSubscript:@"_UIFocusGesturePanAddress"];

      uint64_t v15 = [(UIGestureRecognizer *)v11 name];
      uint64_t v16 = (void *)v15;
      if (v15) {
        uint64_t v17 = (__CFString *)v15;
      }
      else {
        uint64_t v17 = &stru_1ED0E84C0;
      }
      [v101 setObject:v17 forKeyedSubscript:@"_UIFocusGesturePanName"];

      [v101 setObject:v12 forKeyedSubscript:@"_UIFocusGesturePanAction"];
    }
  }
LABEL_19:

  if (a3) {
    int v18 = 0;
  }
  else {
    int v18 = [v8 shouldEnableFocusOnSelect];
  }
  uint64_t v19 = [(_UIFocusEventRecognizer *)self gestureForName:3];
  v20 = (_UIFocusEnableOnSelectGestureRecognizer *)v19;
  if (!v19 && v18)
  {
    v20 = [[_UIFocusEnableOnSelectGestureRecognizer alloc] initWithTarget:self action:sel__handleSelectGesture_];
    [(UIGestureRecognizer *)v20 setName:@"com.apple.focus._UIFocusGestureSelect"];
    [(UIGestureRecognizer *)v20 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v20 forName:3];
    [WeakRetained addGestureRecognizer:v20];
    if (!v101 || !v20) {
      goto LABEL_37;
    }
    v21 = @"add";
    goto LABEL_33;
  }
  if (v19) {
    char v22 = v18;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v19];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:3];
    if (v101)
    {
      v21 = @"remove";
LABEL_33:
      v23 = [NSNumber numberWithUnsignedLong:v20];
      [v101 setObject:v23 forKeyedSubscript:@"_UIFocusGestureSelectAddress"];

      uint64_t v24 = [(UIGestureRecognizer *)v20 name];
      long long v25 = (void *)v24;
      if (v24) {
        long long v26 = (__CFString *)v24;
      }
      else {
        long long v26 = &stru_1ED0E84C0;
      }
      [v101 setObject:v26 forKeyedSubscript:@"_UIFocusGestureSelectName"];

      [v101 setObject:v21 forKeyedSubscript:@"_UIFocusGestureSelectAction"];
    }
  }
LABEL_37:

  if (a3) {
    int v27 = 0;
  }
  else {
    int v27 = [v8 shouldSupressIndirectMovementOnSelect];
  }
  uint64_t v28 = [(_UIFocusEventRecognizer *)self gestureForName:4];
  v29 = (_UIFocusSelectObserverGestureRecognizer *)v28;
  if (!v28 && v27)
  {
    v29 = [[_UIFocusSelectObserverGestureRecognizer alloc] initWithTarget:self action:sel__handleSelectObserverGesture_];
    [(UIGestureRecognizer *)v29 setName:@"com.apple.focus._UIFocusGestureSelectObserver"];
    [(UIGestureRecognizer *)v29 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v29 forName:4];
    [WeakRetained addGestureRecognizer:v29];
    if (!v101 || !v29) {
      goto LABEL_55;
    }
    uint64_t v30 = @"add";
    goto LABEL_51;
  }
  if (v28) {
    char v31 = v27;
  }
  else {
    char v31 = 1;
  }
  if ((v31 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v28];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:4];
    if (v101)
    {
      uint64_t v30 = @"remove";
LABEL_51:
      v32 = [NSNumber numberWithUnsignedLong:v29];
      [v101 setObject:v32 forKeyedSubscript:@"_UIFocusGestureSelectObserverAddress"];

      uint64_t v33 = [(UIGestureRecognizer *)v29 name];
      v34 = (void *)v33;
      if (v33) {
        v35 = (__CFString *)v33;
      }
      else {
        v35 = &stru_1ED0E84C0;
      }
      [v101 setObject:v35 forKeyedSubscript:@"_UIFocusGestureSelectObserverName"];

      [v101 setObject:v30 forKeyedSubscript:@"_UIFocusGestureSelectObserverAction"];
    }
  }
LABEL_55:

  if (a3) {
    int v36 = 0;
  }
  else {
    int v36 = [v8 shouldConvertIndirectTapsIntoArrowKeys];
  }
  uint64_t v37 = [(_UIFocusEventRecognizer *)self gestureForName:2];
  v38 = (UITapGestureRecognizer *)v37;
  if (v37 || !v36)
  {
    if (v37) {
      char v42 = v36;
    }
    else {
      char v42 = 1;
    }
    if ((v42 & 1) == 0)
    {
      [WeakRetained removeGestureRecognizer:v37];
      [(_UIFocusEventRecognizer *)self setGesture:0 forName:2];
      if (v101)
      {
        v41 = @"remove";
        goto LABEL_71;
      }
    }
  }
  else
  {
    v38 = [[UITapGestureRecognizer alloc] initWithTarget:self action:sel__handleTapGesture_];
    [(UIGestureRecognizer *)v38 setName:@"com.apple.focus._UIFocusGestureTap"];
    [(UIGestureRecognizer *)v38 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v38 forName:2];
    [(UITapGestureRecognizer *)v38 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
    [(UIGestureRecognizer *)v38 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v38 setCancelsTouchesInView:0];
    int v39 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusEngineTapAllowableMovement, @"FocusEngineTapAllowableMovement", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v40 = *(double *)&qword_1E8FD5180;
    if (v39) {
      double v40 = 150.0;
    }
    [(UITapGestureRecognizer *)v38 setAllowableMovement:v40];
    [(UIGestureRecognizer *)v38 setAllowedTouchTypes:&unk_1ED3EFA58];
    [WeakRetained addGestureRecognizer:v38];
    if (v101 && v38)
    {
      v41 = @"add";
LABEL_71:
      v43 = [NSNumber numberWithUnsignedLong:v38];
      [v101 setObject:v43 forKeyedSubscript:@"_UIFocusGestureTapAddress"];

      uint64_t v44 = [(UIGestureRecognizer *)v38 name];
      v45 = (void *)v44;
      if (v44) {
        v46 = (__CFString *)v44;
      }
      else {
        v46 = &stru_1ED0E84C0;
      }
      [v101 setObject:v46 forKeyedSubscript:@"_UIFocusGestureTapName"];

      [v101 setObject:v41 forKeyedSubscript:@"_UIFocusGestureTapAction"];
    }
  }

  if (a3) {
    int v47 = 0;
  }
  else {
    int v47 = [v8 supportsGameControllers];
  }
  uint64_t v48 = [(_UIFocusEventRecognizer *)self gestureForName:9];
  v49 = (_UIFocusEngineJoystickGestureRecognizer *)v48;
  if (!v48 && v47)
  {
    v49 = [[_UIFocusEngineJoystickGestureRecognizer alloc] initWithTarget:self action:sel__handleJoystickGesture_];
    [(UIGestureRecognizer *)v49 setName:@"com.apple.focus._UIFocusGestureJoystick"];
    [(UIGestureRecognizer *)v49 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v49 forName:9];
    [(UIGestureRecognizer *)v49 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v49 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v49 setAllowedTouchTypes:MEMORY[0x1E4F1CBF0]];
    [WeakRetained addGestureRecognizer:v49];
    if (!v101 || !v49) {
      goto LABEL_93;
    }
    v50 = @"add";
    goto LABEL_89;
  }
  if (v48) {
    char v51 = v47;
  }
  else {
    char v51 = 1;
  }
  if ((v51 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v48];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:9];
    if (v101)
    {
      v50 = @"remove";
LABEL_89:
      v52 = [NSNumber numberWithUnsignedLong:v49];
      [v101 setObject:v52 forKeyedSubscript:@"_UIFocusGestureJoystickAddress"];

      uint64_t v53 = [(UIGestureRecognizer *)v49 name];
      v54 = (void *)v53;
      if (v53) {
        v55 = (__CFString *)v53;
      }
      else {
        v55 = &stru_1ED0E84C0;
      }
      [v101 setObject:v55 forKeyedSubscript:@"_UIFocusGestureJoystickName"];

      [v101 setObject:v50 forKeyedSubscript:@"_UIFocusGestureJoystickAction"];
    }
  }
LABEL_93:

  if (a3) {
    int v56 = 0;
  }
  else {
    int v56 = [v8 supportsTabKey];
  }
  uint64_t v57 = [(_UIFocusEventRecognizer *)self gestureForName:8];
  v58 = (_UIFocusMovementTabulatorPressGestureRecognizer *)v57;
  if (!v57 && v56)
  {
    v58 = [(_UIFocusMovementPressGestureRecognizer *)[_UIFocusMovementTabulatorPressGestureRecognizer alloc] initWithTarget:self action:sel__handleTabulatorGesture_];
    [(UIGestureRecognizer *)v58 setName:@"com.apple.focus._UIFocusGestureTabulator"];
    [(UIGestureRecognizer *)v58 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v58 forName:8];
    [WeakRetained addGestureRecognizer:v58];
    if (!v101 || !v58) {
      goto LABEL_111;
    }
    v59 = @"add";
    goto LABEL_107;
  }
  if (v57) {
    char v60 = v56;
  }
  else {
    char v60 = 1;
  }
  if ((v60 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v57];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:8];
    if (v101)
    {
      v59 = @"remove";
LABEL_107:
      v61 = [NSNumber numberWithUnsignedLong:v58];
      [v101 setObject:v61 forKeyedSubscript:@"_UIFocusGestureTabulatorAddress"];

      uint64_t v62 = [(UIGestureRecognizer *)v58 name];
      v63 = (void *)v62;
      if (v62) {
        v64 = (__CFString *)v62;
      }
      else {
        v64 = &stru_1ED0E84C0;
      }
      [v101 setObject:v64 forKeyedSubscript:@"_UIFocusGestureTabulatorName"];

      [v101 setObject:v59 forKeyedSubscript:@"_UIFocusGestureTabulatorAction"];
    }
  }
LABEL_111:

  if (a3) {
    int v65 = 0;
  }
  else {
    int v65 = [v8 supportsArrowKeys];
  }
  uint64_t v66 = [(_UIFocusEventRecognizer *)self gestureForName:6];
  v67 = (_UIFocusMovementDirectionalPressGestureRecognizer *)v66;
  if (!v66 && v65)
  {
    v67 = [(_UIFocusMovementPressGestureRecognizer *)[_UIFocusMovementDirectionalPressGestureRecognizer alloc] initWithTarget:self action:sel__handleArrowButtonGesture_];
    [(UIGestureRecognizer *)v67 setName:@"com.apple.focus._UIFocusGestureArrowButton"];
    [(UIGestureRecognizer *)v67 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v67 forName:6];
    [WeakRetained addGestureRecognizer:v67];
    if (!v101 || !v67) {
      goto LABEL_129;
    }
    v68 = @"add";
    goto LABEL_125;
  }
  if (v66) {
    char v69 = v65;
  }
  else {
    char v69 = 1;
  }
  if ((v69 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v66];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:6];
    if (v101)
    {
      v68 = @"remove";
LABEL_125:
      v70 = [NSNumber numberWithUnsignedLong:v67];
      [v101 setObject:v70 forKeyedSubscript:@"_UIFocusGestureArrowButtonAddress"];

      uint64_t v71 = [(UIGestureRecognizer *)v67 name];
      v72 = (void *)v71;
      if (v71) {
        v73 = (__CFString *)v71;
      }
      else {
        v73 = &stru_1ED0E84C0;
      }
      [v101 setObject:v73 forKeyedSubscript:@"_UIFocusGestureArrowButtonName"];

      [v101 setObject:v68 forKeyedSubscript:@"_UIFocusGestureArrowButtonAction"];
    }
  }
LABEL_129:

  if (a3) {
    int v74 = 0;
  }
  else {
    int v74 = [v8 supportsIndirectRotaryMovement];
  }
  uint64_t v75 = [(_UIFocusEventRecognizer *)self gestureForName:5];
  v76 = (_UIRotaryGestureRecognizer *)v75;
  if (!v75 && v74)
  {
    v76 = [[_UIRotaryGestureRecognizer alloc] initWithTarget:self action:sel__handleRotaryGesture_];
    [(UIGestureRecognizer *)v76 setName:@"com.apple.focus._UIFocusGestureRotary"];
    [(_UIRotaryGestureRecognizer *)v76 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v76 forName:5];
    [(UIGestureRecognizer *)v76 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v76 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v76 setAllowedTouchTypes:&unk_1ED3EFA70];
    [WeakRetained addGestureRecognizer:v76];
    if (!v101 || !v76) {
      goto LABEL_147;
    }
    v77 = @"add";
    goto LABEL_143;
  }
  if (v75) {
    char v78 = v74;
  }
  else {
    char v78 = 1;
  }
  if ((v78 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v75];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:5];
    if (v101)
    {
      v77 = @"remove";
LABEL_143:
      v79 = [NSNumber numberWithUnsignedLong:v76];
      [v101 setObject:v79 forKeyedSubscript:@"_UIFocusGestureRotaryAddress"];

      uint64_t v80 = [(UIGestureRecognizer *)v76 name];
      v81 = (void *)v80;
      if (v80) {
        v82 = (__CFString *)v80;
      }
      else {
        v82 = &stru_1ED0E84C0;
      }
      [v101 setObject:v82 forKeyedSubscript:@"_UIFocusGestureRotaryName"];

      [v101 setObject:v77 forKeyedSubscript:@"_UIFocusGestureRotaryAction"];
    }
  }
LABEL_147:

  BOOL v83 = !a3 && [v8 pageButtonScrollingStyle] != 0;
  uint64_t v84 = [(_UIFocusEventRecognizer *)self gestureForName:7];
  v85 = (_UIFocusMovementDirectionalPressGestureRecognizer *)v84;
  if (!v84 && v83)
  {
    v85 = [(_UIFocusMovementPressGestureRecognizer *)[_UIFocusMovementDirectionalPressGestureRecognizer alloc] initWithTarget:self action:sel__handlePageButtonGesture_];
    [(UIGestureRecognizer *)v85 setName:@"com.apple.focus._UIFocusGesturePageButton"];
    [(UIGestureRecognizer *)v85 setDelegate:self];
    [(_UIFocusEventRecognizer *)self setGesture:v85 forName:7];
    [(UIGestureRecognizer *)v85 setAllowedPressTypes:&unk_1ED3EFA88];
    [WeakRetained addGestureRecognizer:v85];
    if (!v101 || !v85) {
      goto LABEL_165;
    }
    v86 = @"add";
    goto LABEL_161;
  }
  if (v84) {
    char v87 = v83;
  }
  else {
    char v87 = 1;
  }
  if ((v87 & 1) == 0)
  {
    [WeakRetained removeGestureRecognizer:v84];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:7];
    if (v101)
    {
      v86 = @"remove";
LABEL_161:
      v88 = [NSNumber numberWithUnsignedLong:v85];
      [v101 setObject:v88 forKeyedSubscript:@"_UIFocusGesturePageButtonAddress"];

      uint64_t v89 = [(UIGestureRecognizer *)v85 name];
      v90 = (void *)v89;
      if (v89) {
        v91 = (__CFString *)v89;
      }
      else {
        v91 = &stru_1ED0E84C0;
      }
      [v101 setObject:v91 forKeyedSubscript:@"_UIFocusGesturePageButtonName"];

      [v101 setObject:v86 forKeyedSubscript:@"_UIFocusGesturePageButtonAction"];
    }
  }
LABEL_165:

  if (a3) {
    int v92 = 0;
  }
  else {
    int v92 = [v8 supportsLinearMovementDebugOverlay];
  }
  uint64_t v93 = [(_UIFocusEventRecognizer *)self gestureForName:13];
  v94 = (_UIFocusLinearMovementDebugGestureRecognizer *)v93;
  if (v93 || !v92)
  {
    if (v93) {
      char v96 = v92;
    }
    else {
      char v96 = 1;
    }
    if (v96) {
      goto LABEL_183;
    }
    [WeakRetained removeGestureRecognizer:v93];
    [(_UIFocusEventRecognizer *)self setGesture:0 forName:13];
    if (!v101) {
      goto LABEL_183;
    }
    v95 = @"remove";
    goto LABEL_179;
  }
  v94 = [[_UIFocusLinearMovementDebugGestureRecognizer alloc] initWithTarget:self action:sel__handleLinearDebugOverlayGesture_];
  [(UIGestureRecognizer *)v94 setName:@"com.apple.focus._UIFocusGestureDebugOverlay"];
  [(UIGestureRecognizer *)v94 setDelegate:self];
  [(_UIFocusEventRecognizer *)self setGesture:v94 forName:13];
  [WeakRetained addGestureRecognizer:v94];
  if (v101 && v94)
  {
    v95 = @"add";
LABEL_179:
    v97 = [NSNumber numberWithUnsignedLong:v94];
    [v101 setObject:v97 forKeyedSubscript:@"_UIFocusGestureDebugOverlayAddress"];

    uint64_t v98 = [(UIGestureRecognizer *)v94 name];
    v99 = (void *)v98;
    if (v98) {
      v100 = (__CFString *)v98;
    }
    else {
      v100 = &stru_1ED0E84C0;
    }
    [v101 setObject:v100 forKeyedSubscript:@"_UIFocusGestureDebugOverlayName"];

    [v101 setObject:v95 forKeyedSubscript:@"_UIFocusGestureDebugOverlayAction"];
  }
LABEL_183:

  [(_UIFocusEventRecognizer *)self _updateRotaryIndicatorView];
}

- (void)_updateRotaryIndicatorView
{
  p_owningView = &self->_owningView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  id v11 = [WeakRetained _focusBehavior];

  int v5 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_B519_ShowRotaryIndicator, @"B519_ShowRotaryIndicator", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1EB2572F4) {
    int v6 = v5;
  }
  else {
    int v6 = 1;
  }
  rotaryIndicatorView = self->_rotaryIndicatorView;
  if (rotaryIndicatorView) {
    goto LABEL_5;
  }
  if ((([v11 supportsIndirectRotaryMovement] ^ 1 | v6) & 1) == 0)
  {
    v8 = objc_loadWeakRetained((id *)p_owningView);
    int v9 = +[_UIFocusRotaryIndicatorView createRotaryIndicatorInView:v8];
    uint64_t v10 = self->_rotaryIndicatorView;
    self->_rotaryIndicatorView = v9;

LABEL_13:
    goto LABEL_14;
  }
  rotaryIndicatorView = self->_rotaryIndicatorView;
  if (rotaryIndicatorView)
  {
LABEL_5:
    if ((v6 & 1) == 0)
    {
      if ([v11 supportsIndirectRotaryMovement]) {
        goto LABEL_14;
      }
      rotaryIndicatorView = self->_rotaryIndicatorView;
    }
    [(UIView *)rotaryIndicatorView removeFromSuperview];
    v8 = self->_rotaryIndicatorView;
    self->_rotaryIndicatorView = 0;
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_updateGestureRecognizersForcingRemoval:(BOOL)a3
{
}

- (void)_cancelAllGestureRecognizers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = NSAllMapTableValues(self->_gestureRecognizers);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v8 = [v7 isEnabled];
        [v7 setEnabled:0];
        [v7 setEnabled:v8];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (NSSet)gesturesForFailureRequirements
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = NSAllMapTableValues(self->_gestureRecognizers);
  uint64_t v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (void)_focusBehaviorDidChange:(id)a3
{
}

- (void)_focusSystemEnabledStateDidChange:(id)a3
{
  id v6 = [a3 object];
  if (([v6 _isEnabled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    id v5 = [WeakRetained _focusSystem];

    if (v6 == v5)
    {
      [(_UIFocusEventRecognizer *)self _resetContinuousMovementState];
      [(_UIFocusEventRecognizer *)self _resetProgressAccumulator];
      [(_UIFocusEventRecognizer *)self _resetFailedMovementHeading];
      [(_UIFocusEventRecognizer *)self _cancelAllGestureRecognizers];
    }
  }
}

- (id)_focusMovementSystem
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained _focusMovementSystemForFocusEventRecognizer:self];
    if (!v5)
    {
      if (os_variant_has_internal_diagnostics())
      {
        long long v9 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          int v10 = 138412290;
          long long v11 = v4;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "The focus system to use for processing focus movement cannot be nil. Delegate: %@", (uint8_t *)&v10, 0xCu);
        }
      }
      else
      {
        uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_focusMovementSystem___s_category) + 8);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138412290;
          long long v11 = v4;
          _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "The focus system to use for processing focus movement cannot be nil. Delegate: %@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
    id v6 = [v5 _preferredFirstResponderFocusSystem];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_didRecognizeFocusMovementRequest:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIFocusEventRecognizer.m", 598, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v7 = WeakRetained;
  if (WeakRetained
    && [WeakRetained _focusEventRecognizer:self didRecognizeFocusMovementRequest:v5])
  {
    [(_UIFocusEventRecognizer *)self _resetFailedMovementHeading];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_moveWithEvent:(id)a3
{
  id v4 = a3;
  if (![(_UIFocusEventRecognizer *)self _shouldAcceptInputType:5])
  {
    BOOL v9 = 0;
    goto LABEL_12;
  }
  self->_inputType = 5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  id v6 = [WeakRetained traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 != 3) {
    goto LABEL_8;
  }
  if (![v4 _focusHeading])
  {
    uint64_t v10 = [v4 _moveDirection];
    if ((unint64_t)(v10 - 1) <= 3)
    {
      uint64_t v8 = qword_186B96620[v10 - 1];
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  uint64_t v8 = [v4 _focusHeading];
LABEL_9:

  [(_UIFocusEventRecognizer *)self _setMoveEvent:v4];
  long long v11 = [(_UIFocusEventRecognizer *)self currentFocusBehavior];
  uint64_t v12 = [v11 focusGroupMovementBehavior] << 60;

  uint64_t v13 = 1;
  if ((v8 & 0x330) != 0) {
    uint64_t v13 = 2;
  }
  BOOL v9 = [(_UIFocusEventRecognizer *)self _moveInDirection:v8 groupFilter:v13 & (v12 >> 63)];
  [(_UIFocusEventRecognizer *)self _setMoveEvent:0];
  self->_inputType = 0;
LABEL_12:

  return v9;
}

- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4
{
  return [(_UIFocusEventRecognizer *)self _moveInDirection:a3 groupFilter:a4 withSearchInfo:0];
}

- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4 withSearchInfo:(id)a5
{
  id v8 = a5;
  if (a3)
  {
    BOOL v9 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
    if (v9)
    {
      uint64_t v10 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v9];
      long long v11 = [[_UIFocusMovementInfo alloc] initWithHeading:a3 linearHeading:0 isInitial:1 shouldLoadScrollableContainer:1 looping:0 groupFilter:a4 inputType:self->_inputType];
      [(_UIFocusMovementRequest *)v10 setMovementInfo:v11];

      [(_UIFocusMovementRequest *)v10 setSearchInfo:v8];
      BOOL v12 = [(_UIFocusEventRecognizer *)self _didRecognizeFocusMovementRequest:v10];
    }
    else
    {
      uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_moveInDirection_groupFilter_withSearchInfo____s_category)+ 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring movement request.", buf, 2u);
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_moveInDirection:(unint64_t)a3 groupFilter:(int64_t)a4 withEvaluator:(id)a5
{
  id v8 = a5;
  BOOL v9 = [[_UIFocusSearchInfo alloc] initWithFocusEvaluator:v8];

  LOBYTE(a4) = [(_UIFocusEventRecognizer *)self _moveInDirection:a3 groupFilter:a4 withSearchInfo:v9];
  return a4;
}

- (void)_handleSelectGesture:(id)a3
{
  id v4 = [(_UIFocusEventRecognizer *)self _focusSystemSceneComponent];
  uint64_t v3 = [v4 focusSystem];
  [v3 _setNeedsNonDeferredFocusUpdate];
}

- (void)_handleSelectObserverGesture:(id)a3
{
  if ([a3 state] == 1)
  {
    [(_UIFocusEffectsController *)self->_motionEffectsController startRollbackAnimation];
    [(_UIFocusEventRecognizer *)self _resetProgressAccumulator];
    *(_WORD *)&self->_flags |= 0x80u;
  }
  else
  {
    *(_WORD *)&self->_flags &= ~0x80u;
    id v6 = [(_UIFocusEventRecognizer *)self gestureForName:1];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = [MEMORY[0x1E4F28B00] currentHandler];
        [v5 handleFailureInMethod:a2, self, @"_UIFocusEventRecognizer.m", 757, @"Unexpected gesture recognizer class: %@", objc_opt_class() object file lineNumber description];
      }
      self->_lastKnownTouchPoint = v6[25];
    }
  }
}

- (void)_handleArrowButtonGesture:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [v19 state];
  self->_lastButtonPressTime = CACurrentMediaTime();
  [(_UIFocusEventRecognizer *)self _resetProgressAccumulator];
  [(_UIFocusEffectsController *)self->_motionEffectsController reset];
  [(_UIFocusEventRecognizer *)self _resetPanDeadband];
  if ([(_UIFocusEventRecognizer *)self _shouldAcceptInputType:4])
  {
    if ((unint64_t)(v4 - 1) <= 1)
    {
      uint64_t v5 = [v19 focusHeading];
      if (v5)
      {
        uint64_t v6 = v5;
        [(_UIFocusEventRecognizer *)self _resetMomentum];
        uint64_t v7 = [(_UIFocusEventRecognizer *)self currentFocusBehavior];
        id v8 = [(_UIFocusEventRecognizer *)self gestureForName:1];
        BOOL v9 = [(_UIFocusEventRecognizer *)self gestureForName:2];
        uint64_t v10 = [(_UIFocusEventRecognizer *)self gestureForName:5];
        unsigned int v18 = [v8 isEnabled];
        uint64_t v11 = [v9 isEnabled];
        uint64_t v12 = [v10 isEnabled];
        if ([v7 indirectMovementPriority] == 2)
        {
          [v8 setEnabled:0];
          [v10 setEnabled:0];
        }
        uint64_t v13 = +[UIDevice currentDevice];
        uint64_t v14 = [v13 _remoteTouchSurfaceType];

        if (v14 == 2 && [v7 shouldConvertIndirectTapsIntoArrowKeys]) {
          [v9 setEnabled:0];
        }
        unint64_t inputType = self->_inputType;
        self->_unint64_t inputType = 4;
        if (([v7 focusGroupMovementBehavior] & 4) == 0
          || [v19 pressSource] == 2
          || (char v16 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusEmulateGameControllerWithKeyboard, @"FocusEmulateGameControllerWithKeyboard", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool), v17 = 1, (v16 & 1) == 0)&& byte_1E8FD519C)
        {
          uint64_t v17 = 0;
        }
        [(_UIFocusEventRecognizer *)self _moveInDirection:v6 groupFilter:v17];
        self->_unint64_t inputType = inputType;
        [v8 setEnabled:v18];
        [v9 setEnabled:v11];
        [v10 setEnabled:v12];
      }
    }
  }
}

- (void)_handlePageButtonGesture:(id)a3
{
  id v19 = a3;
  BOOL v4 = [(_UIFocusEventRecognizer *)self _shouldAcceptInputType:7];
  uint64_t v5 = v19;
  if (v4)
  {
    if ((unint64_t)([v19 state] - 1) > 1) {
      goto LABEL_15;
    }
    uint64_t v6 = [v19 focusHeading];
    uint64_t v5 = v19;
    if (!v6) {
      goto LABEL_17;
    }
    uint64_t v7 = [(_UIFocusEventRecognizer *)self currentFocusBehavior];
    uint64_t v8 = [v7 pageButtonScrollingStyle];

    if ([(_UIFocusEventRecognizer *)self _shouldAcceptInputType:7]
      && (unint64_t)(v8 - 1) <= 1)
    {
      *(_WORD *)&self->_flags |= 1u;
      self->_unint64_t inputType = 7;
      [(_UIFocusEventRecognizer *)self _resetFailedMovementHeading];
      uint64_t v5 = v19;
      if ((*(_WORD *)&self->_flags & 2) == 0)
      {
        if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257358, @"FocusMomentumFriction", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v9 = 0.99; {
        else
        }
          double v9 = *(double *)&qword_1EB257360;
        int v10 = _UIInternalPreferenceUsesDefault((int *)algn_1EB2573C8, @"FocusPageButtonSwipeScrollingVelocity", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        double v11 = *(double *)&qword_1EB2573D0;
        if (v10) {
          double v11 = 10.0;
        }
        double v12 = -v11;
        __asm { FMOV            V2.2D, #0.5 }
        self->_CGPoint lastMomentumTouchPoint = _Q2;
        CGPoint lastMomentumTouchPoint = self->_lastMomentumTouchPoint;
        if (!_ZF) {
          double v12 = v11;
        }
        self->_touchBeganPoint = lastMomentumTouchPoint;
        self->_lastKnownTouchPoint = lastMomentumTouchPoint;
        -[_UIFocusEventRecognizer _beginMomentumImmediatelyWithVelocity:friction:](self, "_beginMomentumImmediatelyWithVelocity:friction:", 0.0, v12, v9);
        uint64_t v5 = v19;
      }
    }
    else
    {
LABEL_15:
      uint64_t v5 = v19;
      if (self->_inputType == 7) {
        self->_unint64_t inputType = 0;
      }
    }
  }
LABEL_17:
}

- (void)_handleTabulatorGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ([(_UIFocusEventRecognizer *)self _shouldAcceptInputType:8]
    && (unint64_t)(v5 - 1) <= 1)
  {
    self->_unint64_t inputType = 8;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    uint64_t v7 = [WeakRetained _focusBehavior];

    uint64_t v8 = [v4 focusHeading];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
      if (v10)
      {
        uint64_t v11 = [v7 focusGroupMovementBehavior] & 2;
        double v12 = +[_UIFocusSearchInfo defaultInfo];
        [v12 setForceFocusToLeaveContainer:1];
        uint64_t v13 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v10];
        uint64_t v14 = -[_UIFocusMovementInfo initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:linearHeading:isInitial:shouldLoadScrollableContainer:looping:groupFilter:inputType:", v9, 0, 1, 0, [v7 tabBasedMovementLoops], v11, self->_inputType);
        [(_UIFocusMovementRequest *)v13 setMovementInfo:v14];

        [(_UIFocusMovementRequest *)v13 setSearchInfo:v12];
        [(_UIFocusEventRecognizer *)self _didRecognizeFocusMovementRequest:v13];
      }
      else
      {
        uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_handleTabulatorGesture____s_category) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring movement request.", buf, 2u);
        }
      }
      self->_unint64_t inputType = 0;
    }
    else
    {
      self->_unint64_t inputType = 0;
    }
  }
}

- (void)_handlePanGesture:(id)a3
{
  id v19 = (double *)a3;
  uint64_t v5 = [(_UIFocusEventRecognizer *)self gestureForName:1];

  if (v5 != v19)
  {
    unsigned int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UIFocusEventRecognizer.m", 957, @"Invalid parameter not satisfying: %@", @"recognizer == [self gestureForName:_UIFocusGesturePan]" object file lineNumber description];
  }
  BOOL v6 = [(_UIFocusEventRecognizer *)self _shouldAcceptInputType:1];
  uint64_t v7 = v19;
  if (v6)
  {
    if ([v19 state] == 1) {
      [(_UIFocusEventRecognizer *)self _panGestureStart:v19];
    }
    if ([v19 state] != 4 && (*(_WORD *)&self->_flags & 0x80) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
      [v19 velocityInView:WeakRetained];
      double v10 = v9;
      double v12 = v11;

      uint64_t v13 = +[UIDevice currentDevice];
      uint64_t v14 = [v13 _remoteTouchSurfaceType];

      if (v19)
      {
        double v15 = v19[50];
        double v16 = v19[51];
      }
      else
      {
        double v16 = 0.0;
        double v15 = 0.0;
      }
      -[_UIFocusEventRecognizer _updatePanLocation:reportedVelocity:remoteTouchSurfaceType:](self, "_updatePanLocation:reportedVelocity:remoteTouchSurfaceType:", v14, v15, v16, v10, v12);
    }
    if ([v19 state] == 3)
    {
      [(_UIFocusEventRecognizer *)self _panGestureEnd:v19];
    }
    else
    {
      uint64_t v17 = [v19 state];
      uint64_t v7 = v19;
      if (v17 != 4) {
        goto LABEL_16;
      }
      [(_UIFocusEventRecognizer *)self _panGestureCancelled:v19];
    }
    uint64_t v7 = v19;
  }
LABEL_16:
}

- (void)_handleTapGesture:(id)a3
{
  id v12 = a3;
  BOOL v4 = [(_UIFocusEventRecognizer *)self _shouldAcceptInputType:2];
  uint64_t v5 = v12;
  if (v4)
  {
    uint64_t v6 = [v12 state];
    uint64_t v5 = v12;
    if (v6 == 3)
    {
      self->_unint64_t inputType = 2;
      [v12 _digitizerLocation];
      int v7 = -[_UIFocusEventRecognizer _touchRegionForDigitizerLocation:](self, "_touchRegionForDigitizerLocation:") - 1;
      if (v7 <= 3)
      {
        uint64_t v8 = qword_186B96640[v7];
        double v9 = [MEMORY[0x1E4F1C9C8] date];
        [v9 timeIntervalSinceNow];
        double v11 = v10;

        +[_UIFocusEngineDelayedPressAction sendDelayedPressWithType:v8 timestamp:self sender:v11];
      }
      self->_unint64_t inputType = 0;
      uint64_t v5 = v12;
    }
  }
}

- (void)_handleJoystickGesture:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(_UIFocusEventRecognizer *)self _shouldAcceptInputType:3];
  uint64_t v5 = v7;
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v6 = [v7 state];
  if (v6 == 1)
  {
    [(_UIFocusEventRecognizer *)self _joystickGestureBegan:v7];
  }
  else if ((unint64_t)(v6 - 1) > 2)
  {
    goto LABEL_6;
  }
  [(_UIFocusEventRecognizer *)self _joystickGestureUpdated:v7];
LABEL_6:
  uint64_t v5 = v7;
  if ((unint64_t)(v6 - 3) <= 1)
  {
    [(_UIFocusEventRecognizer *)self _joystickGestureEnded:v7];
    uint64_t v5 = v7;
  }
LABEL_8:
}

- (void)_handleLinearDebugOverlayGesture:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    [(_UIFocusEventRecognizer *)self _hideLinearDebugOverlayIfNecessary:1];
  }
  else if ((unint64_t)(v4 - 1) <= 1)
  {
    linearDebugView = self->_linearDebugView;
    if (!linearDebugView
      || (int v6 = [(_UIFocusLinearMovementDebugView *)linearDebugView isGroupMode],
          v6 != [v7 isGroupMode]))
    {
      -[_UIFocusEventRecognizer _showLinearDebugOverlay:](self, "_showLinearDebugOverlay:", [v7 isGroupMode]);
    }
  }
}

- (void)_showLinearDebugOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
  if (v5)
  {
    BOOL v6 = [(_UIFocusEventRecognizer *)self _hideLinearDebugOverlayIfNecessary:0];
    id v7 = [v5 focusedItem];
    uint64_t v8 = +[_UIFocusSearchInfo defaultInfo];
    [v8 setForceFocusToLeaveContainer:1];
    double v9 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v5];
    double v10 = [(_UIFocusEventRecognizer *)self currentFocusBehavior];
    uint64_t v11 = [v10 focusGroupMovementBehavior] & 2;

    id v12 = [[_UIFocusMovementInfo alloc] initWithHeading:16 linearHeading:0 isInitial:1 shouldLoadScrollableContainer:0 looping:1 groupFilter:v11 inputType:self->_inputType];
    [(_UIFocusMovementRequest *)v9 setMovementInfo:v12];

    [(_UIFocusMovementRequest *)v9 setSearchInfo:v8];
    uint64_t v13 = [v5 _movementPerformer];
    uint64_t v14 = [v13 contextForFocusMovement:v9];

    double v15 = [v14 _focusMapSearchInfo];
    double v16 = v15;
    if (v3)
    {
      uint64_t v17 = [v15 focusGroupMap];
      unsigned int v18 = [v17 focusGroups];

      id v19 = [[_UIFocusLinearMovementDebugView alloc] initWithGroups:v18];
    }
    else
    {
      unsigned int v18 = [v15 linearSortedFocusItems];

      id v19 = [[_UIFocusLinearMovementDebugView alloc] initWithItems:v18];
    }
    v21 = v19;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    [WeakRetained bounds];
    -[UIView setFrame:](v21, "setFrame:");

    id v23 = objc_loadWeakRetained((id *)&self->_owningView);
    [v23 addSubview:v21];

    if (!v6)
    {
      [(UIView *)v21 setAlpha:0.0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __51___UIFocusEventRecognizer__showLinearDebugOverlay___block_invoke;
      v25[3] = &unk_1E52D9F70;
      long long v26 = v21;
      +[UIView animateWithDuration:0x10000 delay:v25 options:0 animations:0.1 completion:0.0];
    }
    linearDebugView = self->_linearDebugView;
    self->_linearDebugView = v21;
  }
  else
  {
    v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_showLinearDebugOverlay____s_category) + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring debug overlay presentation request.", buf, 2u);
    }
  }
}

- (BOOL)_hideLinearDebugOverlayIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = self->_linearDebugView;
  BOOL v6 = v5;
  if (v5)
  {
    if (v3)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __62___UIFocusEventRecognizer__hideLinearDebugOverlayIfNecessary___block_invoke;
      v11[3] = &unk_1E52D9F70;
      id v12 = v5;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __62___UIFocusEventRecognizer__hideLinearDebugOverlayIfNecessary___block_invoke_2;
      v9[3] = &unk_1E52DC3A0;
      double v10 = v12;
      +[UIView animateWithDuration:0x20000 delay:v11 options:v9 animations:0.2 completion:0.0];
    }
    else
    {
      [(UIView *)v5 removeFromSuperview];
    }
    linearDebugView = self->_linearDebugView;
    self->_linearDebugView = 0;
  }
  return v6 != 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIDevice currentDevice];
  uint64_t v6 = [v5 _remoteTouchSurfaceType];

  id v7 = [(_UIFocusEventRecognizer *)self gestureForName:1];
  if (v7 != v4 || (*(_WORD *)&self->_flags & 0x20) != 0)
  {
    id v9 = [(_UIFocusEventRecognizer *)self gestureForName:5];
    BOOL v8 = v9 == v4;
  }
  else
  {
    BOOL v8 = 1;
  }

  id v10 = [(_UIFocusEventRecognizer *)self gestureForName:2];

  if (v8)
  {
    uint64_t v11 = [(_UIFocusEventRecognizer *)self currentFocusBehavior];
    if ([v11 indirectMovementPriority] == 2)
    {
      double v12 = CACurrentMediaTime();
      int v13 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257318, @"B519_ButtonSupressionTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      double v14 = *(double *)&qword_1EB257320;
      if (v13) {
        double v14 = 0.25;
      }
      BOOL v15 = v12 - self->_lastButtonPressTime >= v14;
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 1;
    if (v10 == v4 && v6 == 2)
    {
      double v16 = CACurrentMediaTime();
      int v17 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257328, @"B519_TapSupressionTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      double v18 = *(double *)&qword_1EB257330;
      if (v17) {
        double v18 = 0.1;
      }
      BOOL v15 = v16 - self->_lastButtonPressTime >= v18;
    }
  }

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return (*(_WORD *)&self->_flags & 0x20) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIFocusEventRecognizer *)self gestureForName:1];

  if (v8 == v7)
  {
    id v10 = [(_UIFocusEventRecognizer *)self gestureForName:5];
    BOOL v9 = v10 == v6;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v7 = a3;
  id v4 = [(_UIFocusEventRecognizer *)self gestureForName:1];
  if (v4 == v7)
  {
    unint64_t inputType = self->_inputType;

    id v6 = v7;
    if (inputType != 1) {
      goto LABEL_6;
    }
    [(_UIFocusEventRecognizer *)self _panGestureEnd:v7];
  }
  else
  {
  }
  id v6 = v7;
LABEL_6:
}

- (void)rotaryGestureRecognizerBeganClassifyingMovement:(id)a3
{
  id v8 = a3;
  id v5 = [(_UIFocusEventRecognizer *)self gestureForName:5];

  id v6 = v8;
  if (v5 != v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UIFocusEventRecognizer.m", 1223, @"Invalid parameter not satisfying: %@", @"rotaryGesture == [self gestureForName:_UIFocusGestureRotary]" object file lineNumber description];

    id v6 = v8;
  }
  if ([v6 beganMode] == 1) {
    [(_UIFocusEventRecognizer *)self _showRotaryIndicator];
  }
  else {
    [(_UIFocusEventRecognizer *)self _showRotaryIndicatorAfterDelay];
  }
}

- (id)currentFocusBehavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  BOOL v3 = [WeakRetained _focusBehavior];

  return v3;
}

- (BOOL)_buttonMaskTimeHasExpired
{
  double v3 = CACurrentMediaTime();
  int v4 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_B519_ButtonMaskTime, @"B519_ButtonMaskTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v5 = *(double *)&qword_1E8FD5170;
  if (v4) {
    double v5 = 0.0;
  }
  return v3 - self->_lastButtonPressTime >= v5;
}

- (int)_touchRegionForDigitizerLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257368, @"FocusEngineRemoteDeadzoneCenterX", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v5 = 0.5; {
  else
  }
    double v5 = *(double *)&qword_1EB257370;
  int v6 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257378, @"FocusEngineRemoteDeadzoneCenterY", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  uint64_t v7 = qword_1EB257380;
  int v8 = _UIInternalPreferenceUsesDefault((int *)algn_1EB257388, @"FocusEngineRemoteDeadzonePercentage", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v9 = *(double *)&qword_1EB257390;
  if (v8) {
    double v9 = 0.1;
  }
  if (vabdd_f64(x, v5) < v9)
  {
    double v10 = v6 ? 0.5 : *(double *)&v7;
    if (vabdd_f64(y, v10) < v9) {
      return 0;
    }
  }
  double v12 = 1.0 - y;
  double v13 = 1.0 - x;
  if (x <= 1.0 - y && v13 <= v12) {
    return 1;
  }
  if (v13 > v12 && x <= v12) {
    return 2;
  }
  BOOL v16 = x <= v12 || v13 <= v12;
  if (v13 <= v12 && x > v12) {
    int v17 = 4;
  }
  else {
    int v17 = 0;
  }
  if (v16) {
    return v17;
  }
  else {
    return 3;
  }
}

- (CGSize)_touchSensitivityForItem:(id)a3 remoteTouchSurfaceType:(unint64_t)a4
{
  id v7 = a3;
  int v8 = [v7 containingView];
  double v9 = [v8 traitCollection];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v10 == 3)
  {
    currentCarTouchpad = self->_currentCarTouchpad;
    if (!currentCarTouchpad)
    {
      v50 = [MEMORY[0x1E4F28B00] currentHandler];
      [v50 handleFailureInMethod:a2 object:self file:@"_UIFocusEventRecognizer.m" lineNumber:1365 description:@"Attempting to retrieve sensitivity information without a touchpad."];

      currentCarTouchpad = self->_currentCarTouchpad;
    }
    [(CARInputDeviceTouchpad *)currentCarTouchpad sensitivity];
    double v13 = fmax(v12, 0.0);
    if (v13 >= 1.0) {
      double v14 = 1.5;
    }
    else {
      double v14 = v13 + 0.5;
    }
    [(CARInputDeviceTouchpad *)self->_currentCarTouchpad physicalSize];
    double v16 = v15 * v14;
    [(CARInputDeviceTouchpad *)self->_currentCarTouchpad physicalSize];
    double v18 = v14 * v17;
  }
  else
  {
    uint64_t v19 = [v7 focusTouchSensitivityStyle];
    switch(v19)
    {
      case 0:
      case 3:
        if (dyld_program_sdk_at_least())
        {
          v20 = [(_UIFocusEventRecognizer *)self _globalCoordinateSpace];
          [v7 focusedRectInCoordinateSpace:v20];
        }
        else
        {
          v20 = [v7 containingView];
          [v20 frame];
        }
        double v24 = v21;
        double v51 = v22;

        break;
      case 1:
        long long v25 = [v7 containingView];
        [v25 bounds];
        double v51 = v26;

        double v24 = 184.0;
        break;
      case 2:
        double v24 = 70.0;
        *(double *)&uint64_t v23 = 270.0;
        goto LABEL_14;
      default:
        double v24 = *MEMORY[0x1E4F1DB30];
        uint64_t v23 = *(uint64_t *)(MEMORY[0x1E4F1DB30] + 8);
LABEL_14:
        double v51 = *(double *)&v23;
        break;
    }
    if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257398, @"FocusEngineOverallSensitivityAdjustment", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v27 = 1.0; {
    else
    }
      double v27 = *(double *)&qword_1EB2573A0;
    if (a4 == 2 && (unint64_t v28 = UIFocusGetSensitivitySetting(), v28 < 3))
    {
      double v29 = dbl_186B96660[v28];
    }
    else
    {
      uint64_t SensitivitySetting = UIFocusGetSensitivitySetting();
      double v31 = 0.8;
      if (SensitivitySetting != 1) {
        double v31 = 1.0;
      }
      if (SensitivitySetting == 2) {
        double v29 = 0.65;
      }
      else {
        double v29 = v31;
      }
    }
    v32 = [v7 item];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    double v34 = 1.0;
    double v35 = 1.0;
    double v36 = 1.0;
    if (isKindOfClass)
    {
      uint64_t v37 = [v7 item];
      int v38 = [v37 _disableTouchInput];
      if (v38) {
        double v35 = 0.75;
      }
      else {
        double v35 = 1.0;
      }
      if (v38) {
        double v36 = 1.3;
      }
      else {
        double v36 = 1.0;
      }
    }
    if (v19 == 3) {
      double v34 = 1.2;
    }
    if (a4 == 2)
    {
      double v39 = 1.1;
    }
    else if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB2573B8, @"FocusEngineYSensitivityAdjustment", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))
    {
      double v39 = 1.3;
    }
    else
    {
      double v39 = *(double *)&qword_1EB2573C0;
    }
    double v40 = v27 * v29;
    int v41 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB2573A8, @"FocusEngineXSensitivityAdjustment", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v42 = *(double *)&qword_1EB2573B0;
    if (v41) {
      double v42 = 1.0;
    }
    double v43 = v35 * (v40 * v42);
    double v44 = v36 * (v34 * (v40 * v39));
    if (dyld_program_sdk_at_least())
    {
      [(_UIFocusEventRecognizer *)self _momentumReferenceSize];
      double v44 = v44 * (v46 / v45);
    }
    if (self->_inputType == 6) {
      double v47 = 1.0;
    }
    else {
      double v47 = 2.0;
    }
    double v18 = fmax(v47, fmin(v43 * _UIFocusEngineSensitivityForEdgeLength(v24), 10.0));
    double v16 = fmax(v47, fmin(v44 * _UIFocusEngineSensitivityForEdgeLength(v51), 10.0));
  }

  double v48 = v18;
  double v49 = v16;
  result.height = v49;
  result.width = v48;
  return result;
}

- (BOOL)_shouldAcceptInputType:(unint64_t)a3
{
  unint64_t inputType = self->_inputType;
  unsigned int v6 = (0x4Au >> inputType) & 1;
  if (inputType > 6) {
    unsigned int v6 = 0;
  }
  if (a3 == 4) {
    unsigned int v7 = v6;
  }
  else {
    unsigned int v7 = 0;
  }
  int v8 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
  double v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 focusedItem];
    if (a3 == 6
      && ![(_UIFocusEventRecognizer *)self _canMoveFocusWithRotaryInputInFocusContext:v10])
    {
      goto LABEL_24;
    }
    unint64_t v11 = self->_inputType;
    BOOL v13 = v11 != a3 && v11 != 0;
    if (v7)
    {
      double v14 = [(_UIFocusEventRecognizer *)self currentFocusBehavior];
      BOOL v13 = [v14 indirectMovementPriority] == 0;
    }
    if (inputType != 3 && v13 || a3 == 2 && (*(_WORD *)&self->_flags & 2) != 0)
    {
LABEL_24:
      BOOL v17 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      double v16 = WeakRetained;
      BOOL v17 = !WeakRetained
         || [WeakRetained _shouldRecognizeEventsInFocusEventRecognizer:self];
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_canMoveFocusWithRotaryInputInFocusContext:(id)a3
{
  id v3 = a3;
  char isKindOfClass = 1;
  if ((_UIInternalPreferenceUsesDefault(&dword_1EB257310, @"B519_UniversalFocusMovement", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& !byte_1EB257314)
  {
    if ((_UIInternalPreferenceUsesDefault(&_MergedGlobals_909, @"B519_KeyboardFocusMovement", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) != 0|| byte_1EB25730C)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }

  return isKindOfClass & 1;
}

- (id)_focusSystemSceneComponent
{
  v2 = [(_UIFocusEventRecognizer *)self owningView];
  id v3 = [v2 _window];
  int v4 = [v3 windowScene];
  double v5 = [v4 _focusSystemSceneComponent];

  return v5;
}

- (id)_globalCoordinateSpace
{
  v2 = [(_UIFocusEventRecognizer *)self _focusSystemSceneComponent];
  id v3 = [v2 coordinateSpace];

  return v3;
}

- (void)_resetProgressAccumulator
{
  self->_unlockedAccumulator = 0u;
  self->_progressAccumulator = 0u;
}

- (id)_retrieveCachedFocusItemInfo
{
  id v3 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
  int v4 = [v3 focusedItem];
  cachedFocusItemInfo = self->_cachedFocusItemInfo;
  if (v4)
  {
    if (!cachedFocusItemInfo)
    {
      unsigned int v6 = +[_UIFocusItemInfo infoWithItem:v4];
      unsigned int v7 = self->_cachedFocusItemInfo;
      self->_cachedFocusItemInfo = v6;

      cachedFocusItemInfo = self->_cachedFocusItemInfo;
    }
    int v8 = cachedFocusItemInfo;
  }
  else
  {
    self->_cachedFocusItemInfo = 0;

    int v8 = 0;
  }

  return v8;
}

- (void)_resetCachedFocusItemInfo
{
  cachedFocusItemInfo = self->_cachedFocusItemInfo;
  self->_cachedFocusItemInfo = 0;
}

- (void)_handleRotaryGesture:(id)a3
{
  id v22 = a3;
  id v5 = [(_UIFocusEventRecognizer *)self gestureForName:5];

  if (v5 != v22)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"_UIFocusEventRecognizer.m", 1708, @"Invalid parameter not satisfying: %@", @"rotaryGesture == [self gestureForName:_UIFocusGestureRotary]" object file lineNumber description];
  }
  if ([(_UIFocusEventRecognizer *)self _shouldAcceptInputType:6])
  {
    if ([v22 state] == 1) {
      [(_UIFocusEventRecognizer *)self _handleRotaryBegin:v22];
    }
    if ([v22 state] != 4 && (*(_WORD *)&self->_flags & 0x80) == 0)
    {
      [v22 velocity];
      double v7 = v6;
      [(_UIFocusEventRecognizer *)self _momentumReferenceSize];
      double v9 = v8;
      uint64_t v10 = +[UIDevice currentDevice];
      uint64_t v11 = [v10 _remoteTouchSurfaceType];

      double v12 = [(_UIFocusEventRecognizer *)self _retrieveCachedFocusItemInfo];
      uint64_t v13 = [v12 rotaryFocusMovementAxis];

      if ((unint64_t)(v13 - 1) <= 2)
      {
        double v14 = v7 * v9;
        [v22 accumulatedDistance];
        double v16 = v15;
        [v22 delta];
        [(_UIFocusEventRecognizer *)self _updateRotaryDistance:v11 delta:v13 reportedVelocity:v16 remoteTouchSurfaceType:v17 focusMovementAxis:v14];
      }
      rotaryIndicatorView = self->_rotaryIndicatorView;
      [v22 position];
      -[_UIFocusRotaryIndicatorView updateWheelPosition:](rotaryIndicatorView, "updateWheelPosition:");
    }
    if ([v22 state] == 3)
    {
      [(_UIFocusEventRecognizer *)self _handleRotaryEnd:v22];
LABEL_18:
      uint64_t v19 = v22;
      goto LABEL_19;
    }
    BOOL v20 = [v22 state] == 4;
    uint64_t v19 = v22;
    if (v20)
    {
      [(_UIFocusEventRecognizer *)self _handleRotaryCancelled:v22];
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v19 = v22;
    if (self->_inputType == 6) {
      self->_unint64_t inputType = 0;
    }
  }
LABEL_19:
}

- (void)_handleRotaryBegin:(id)a3
{
  self->_unint64_t inputType = 6;
  [(_UIFocusEffectsController *)self->_motionEffectsController cancelRollbackAnimation];
  self->_focusUpdateCountSinceLastContinuousMovementBegan = 0;
  *(_WORD *)&self->_flags |= 0x41u;
  [(_UIFocusEventRecognizer *)self _resetProgressAccumulator];
  [(_UIFocusEventRecognizer *)self _resetFailedMovementHeading];
  [(_UIFocusEventRecognizer *)self _resetMomentum];
  [(_UIFocusEventRecognizer *)self _showRotaryIndicator];
}

- (void)_handleRotaryEnd:(id)a3
{
  *(_WORD *)&self->_flags &= ~0x80u;
  [(_UIFocusEventRecognizer *)self _resetContinuousMovementState];
  [(_UIFocusEffectsController *)self->_motionEffectsController startRollbackAnimation];
  [(_UIFocusEffectsController *)self->_motionEffectsController resetDisplayOffsetAccumulationFactor];
  [(_UIFocusEventRecognizer *)self _hideRotaryIndicator];
}

- (void)_handleRotaryCancelled:(id)a3
{
  [(_UIFocusEventRecognizer *)self _resetContinuousMovementState];
  [(_UIFocusEffectsController *)self->_motionEffectsController reset];
  [(_UIFocusEventRecognizer *)self _hideRotaryIndicator];
}

- (void)_showRotaryIndicatorAfterDelay
{
  [(_UIFocusEventRecognizer *)self _cancelShowRotaryIndicatorTimer];
  [(NSTimer *)self->_showRotaryIndicatorAfterDelayTimer invalidate];
  id v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__timerFiredForShowRotaryIndicator_ selector:0 userInfo:0 repeats:0.2];
  showRotaryIndicatorAfterDelayTimer = self->_showRotaryIndicatorAfterDelayTimer;
  self->_showRotaryIndicatorAfterDelayTimer = v3;

  if (self->_showRotaryIndicatorAfterDelayTimer)
  {
    id v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v5 addTimer:self->_showRotaryIndicatorAfterDelayTimer forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_cancelShowRotaryIndicatorTimer
{
  [(NSTimer *)self->_showRotaryIndicatorAfterDelayTimer invalidate];
  showRotaryIndicatorAfterDelayTimer = self->_showRotaryIndicatorAfterDelayTimer;
  self->_showRotaryIndicatorAfterDelayTimer = 0;
}

- (void)_timerFiredForShowRotaryIndicator:(id)a3
{
  if (self->_showRotaryIndicatorAfterDelayTimer == a3)
  {
    [(_UIFocusEventRecognizer *)self _cancelShowRotaryIndicatorTimer];
    int v4 = [(_UIFocusEventRecognizer *)self gestureForName:5];
    id v5 = v4;
    if (v4)
    {
      double v7 = v4;
      uint64_t v6 = [v4 state];
      id v5 = v7;
      if (!v6)
      {
        [(_UIFocusEventRecognizer *)self _showRotaryIndicator];
        id v5 = v7;
      }
    }
  }
}

- (void)_showRotaryIndicator
{
  [(_UIFocusEventRecognizer *)self _cancelShowRotaryIndicatorTimer];
  [(_UIFocusEventRecognizer *)self _updateRotaryIndicatorView];
  rotaryIndicatorView = self->_rotaryIndicatorView;
  if (rotaryIndicatorView)
  {
    [(_UIFocusRotaryIndicatorView *)rotaryIndicatorView updateFailedMovementHeading:0];
    int v4 = self->_rotaryIndicatorView;
    id v5 = [(_UIFocusEventRecognizer *)self gestureForName:5];
    [v5 position];
    -[_UIFocusRotaryIndicatorView updateWheelPosition:](v4, "updateWheelPosition:");

    uint64_t v6 = self->_rotaryIndicatorView;
    [(_UIFocusRotaryIndicatorView *)v6 toggleVisible:1 animated:1];
  }
}

- (void)_hideRotaryIndicator
{
  [(_UIFocusEventRecognizer *)self _cancelShowRotaryIndicatorTimer];
  rotaryIndicatorView = self->_rotaryIndicatorView;
  [(_UIFocusRotaryIndicatorView *)rotaryIndicatorView toggleVisible:0 animated:1];
}

- (void)_updateRotaryDistance:(double)a3 delta:(double)a4 reportedVelocity:(double)a5 remoteTouchSurfaceType:(unint64_t)a6 focusMovementAxis:(int64_t)a7
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  double v12 = -[_UIFocusEventRecognizer _createStudyLogDataForRotaryDistance:delta:reportedVelocity:](self, "_createStudyLogDataForRotaryDistance:delta:reportedVelocity:", a3);
  uint64_t v13 = [(_UIFocusEventRecognizer *)self _retrieveCachedFocusItemInfo];
  int v14 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257348, @"B519_FocusMovementGain", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v15 = *(double *)&qword_1EB257350;
  if (v14) {
    double v15 = 1.5;
  }
  double v16 = v15 * a4;
  int v17 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257348, @"B519_FocusMovementGain", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v18 = *(double *)&qword_1EB257350;
  if (v17) {
    double v18 = 1.5;
  }
  double v19 = v18 * a5;
  uint64_t v20 = [v13 focusTouchSensitivityStyle];
  if ((unint64_t)(a7 - 1) > 2) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = qword_186B96678[a7 - 1];
  }
  BOOL v22 = v20 == 2;
  [(_UIFocusEventRecognizer *)self _pointForLinearValue:v21 axis:v16];
  double v24 = v23;
  double v26 = v25;
  [(_UIFocusEventRecognizer *)self _pointForLinearValue:v21 axis:v19];
  double v28 = v27;
  double v30 = v29;
  -[_UIFocusEventRecognizer _applyHorizontalFlipForFocusItemInfo:toDelta:](self, "_applyHorizontalFlipForFocusItemInfo:toDelta:", v13, v24, v26);
  double v32 = v31;
  double v34 = v33;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257338, @"B519_RotaryMovementAccelerationStrength", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v35 = 0.7; {
  else
  }
    double v35 = *(double *)&qword_1EB257340;
  -[_UIFocusEventRecognizer _accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:](self, "_accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:", 1, v22, a6, v28, v30, v35);
  double v37 = v36;
  double v39 = v38;
  [(_UIFocusEventRecognizer *)self _touchSensitivityForItem:v13 remoteTouchSurfaceType:a6];
  double v42 = v41;
  double v43 = v40;
  if (v41 == *MEMORY[0x1E4F1DB30] && v40 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v51 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        goto LABEL_20;
      }
      v52 = [v13 item];
      uint64_t v53 = [v52 debugDescription];
      int v54 = 138412290;
      v55 = v53;
      _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "Focus Sensitivity for focus item must not be zero: %@", (uint8_t *)&v54, 0xCu);
    }
    else
    {
      v50 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateRotaryDistance_delta_reportedVelocity_remoteTouchSurfaceType_focusMovementAxis____s_category)+ 8);
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      double v51 = v50;
      v52 = [v13 item];
      uint64_t v53 = [v52 debugDescription];
      int v54 = 138412290;
      v55 = v53;
      _os_log_impl(&dword_1853B0000, v51, OS_LOG_TYPE_ERROR, "Focus Sensitivity for focus item must not be zero: %@", (uint8_t *)&v54, 0xCu);
    }

LABEL_20:
  }
LABEL_15:
  -[_UIFocusEventRecognizer _applyButtonMaskTimeToValue:remoteTouchSurfaceType:](self, "_applyButtonMaskTimeToValue:remoteTouchSurfaceType:", a6, v32 * v37 * v42, v34 * v39 * v43);
  -[_UIFocusEventRecognizer _updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:](self, "_updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:", v12, v45, v46, v45, v46);
  -[_UIFocusEventRecognizer _updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:](self, "_updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:", self->_progressAccumulator.dx, self->_progressAccumulator.dy, self->_unlockedAccumulator.dx, self->_unlockedAccumulator.dy);
  unint64_t v47 = -[_UIFocusEventRecognizer _calculateLinearHeadingForAccumulator:studyLogData:](self, "_calculateLinearHeadingForAccumulator:studyLogData:", v12, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
  unint64_t v48 = -[_UIFocusEventRecognizer _calculateDirectionalHeadingForAccumulator:studyLogData:](self, "_calculateDirectionalHeadingForAccumulator:studyLogData:", v12, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
  double v49 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
  -[_UIFocusEventRecognizer _attemptRotaryFocusMovementWithLinearHeading:directionalHeading:focusMovementAxis:focusSystem:acceleratedVelocity:studyLogData:](self, "_attemptRotaryFocusMovementWithLinearHeading:directionalHeading:focusMovementAxis:focusSystem:acceleratedVelocity:studyLogData:", v47, v48, a7, v49, v12, v28 * v37, v30 * v39);
}

- (id)_createStudyLogDataForRotaryDistance:(double)a3 delta:(double)a4 reportedVelocity:(double)a5
{
  return 0;
}

- (id)_createRotaryMovementRequestWithFocusSystem:(id)a3
{
  id v3 = a3;
  int v4 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v3];

  return v4;
}

- (CGPoint)_pointForLinearValue:(double)a3 axis:(unint64_t)a4
{
  double v4 = 0.0;
  if (a4) {
    double v5 = a3;
  }
  else {
    double v5 = 0.0;
  }
  if ((a4 & 2) != 0) {
    double v4 = a3;
  }
  double v6 = v5;
  result.double y = v4;
  result.double x = v6;
  return result;
}

- (unint64_t)_calculateLinearHeadingForAccumulator:(CGVector)a3 studyLogData:(id)a4
{
  BOOL v4 = a3.dy > -1.0 && a3.dx > -1.0;
  unint64_t v5 = 32;
  if (v4) {
    unint64_t v5 = 0;
  }
  if (a3.dy < 1.0 && a3.dx < 1.0) {
    return v5;
  }
  else {
    return 16;
  }
}

- (BOOL)_attemptRotaryFocusMovementWithLinearHeading:(unint64_t)a3 directionalHeading:(unint64_t)a4 focusMovementAxis:(int64_t)a5 focusSystem:(id)a6 acceleratedVelocity:(CGPoint)a7 studyLogData:(id)a8
{
  LOBYTE(v8) = 0;
  if (a5 != 3) {
    a3 = a4;
  }
  if (a6 && a3)
  {
    double y = a7.y;
    double x = a7.x;
    int v14 = [(_UIFocusEventRecognizer *)self _createRotaryMovementRequestWithFocusSystem:a6];
    double v15 = [(_UIFocusEventRecognizer *)self currentFocusBehavior];
    unint64_t v16 = ((unint64_t)[v15 focusGroupMovementBehavior] >> 5) & 1;

    int v17 = -[_UIFocusEventRecognizer _createMovementInfoForHeading:groupFilter:acceleratedVelocity:](self, "_createMovementInfoForHeading:groupFilter:acceleratedVelocity:", a3, v16, x, y);
    [v14 setMovementInfo:v17];

    BOOL v8 = [(_UIFocusEventRecognizer *)self _attemptToRecognizeContinuousMovementRequest:v14];
    if (v8) {
      [(_UIFocusEventRecognizer *)self _continuousMovementSucceededWithDirectionalHeading:a4];
    }
    else {
      [(_UIFocusEventRecognizer *)self _continuousMovementFailedWithPrimaryHeading:a4];
    }
  }
  return v8;
}

- (void)_resetPanDeadband
{
  int v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_B519_PanDeadbandSize, @"B519_PanDeadbandSize", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v4 = *(double *)&qword_1E8FD5150;
  if (v3) {
    double v4 = 0.15;
  }
  self->_panDeadBand = v4;
}

- (BOOL)focusEnginePanGestureRecognizerShouldRecognizeImmediately:(id)a3
{
  return (*(_WORD *)&self->_flags & 0x22) != 0;
}

- (void)_panGestureStart:(id)a3
{
  double v19 = a3;
  self->_unint64_t inputType = 1;
  [(_UIFocusEffectsController *)self->_motionEffectsController cancelRollbackAnimation];
  self->_focusUpdateCountSinceLastContinuousMovementBegan = 0;
  *(_WORD *)&self->_flags |= 0x41u;
  CGPoint v5 = (CGPoint)0;
  if (v19) {
    CGPoint v5 = (CGPoint)v19[25];
  }
  self->_lastKnownTouchPoint = v5;
  self->_touchBeganPoint = self->_lastKnownTouchPoint;
  [(_UIFocusEventRecognizer *)self _resetProgressAccumulator];
  [(_UIFocusEventRecognizer *)self _resetFailedMovementHeading];
  self->_previousPoints[3] = 0u;
  self->_previousPoints[4] = 0u;
  self->_previousPoints[1] = 0u;
  self->_previousPoints[2] = 0u;
  self->_previousPoints[0] = 0u;
  self->_numFrames = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  double v7 = [WeakRetained traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3)
  {
    double v9 = -[UIGestureRecognizer _activeTouchesEvent](v19);
    uint64_t v10 = [v9 touchesForGestureRecognizer:v19];
    uint64_t v11 = [v10 anyObject];

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_owningView);
      uint64_t v13 = [v12 _screen];
      int v14 = [v13 _carSession];
      double v15 = [v14 inputDeviceManager];
      objc_msgSend(v15, "touchpadWithSenderID:", objc_msgSend(v11, "_senderID"));
      unint64_t v16 = (CARInputDeviceTouchpad *)objc_claimAutoreleasedReturnValue();
      currentCarTouchpad = self->_currentCarTouchpad;
      self->_currentCarTouchpad = v16;

      if (!self->_currentCarTouchpad)
      {
        double v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:self file:@"_UIFocusEventRecognizer.m" lineNumber:2120 description:@"Attempted a pan-gesture-based focus movement without a touchpad."];
      }
    }
  }
  [(_UIFocusEventRecognizer *)self _resetMomentum];
  [(_UIFocusEventRecognizer *)self _sendGestureBeginNotification];
}

- (void)_updatePanLocation:(CGPoint)a3 reportedVelocity:(CGPoint)a4 remoteTouchSurfaceType:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = a3.y;
  double v9 = a3.x;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = -[_UIFocusEventRecognizer _createStudyLogDataForPanNormalizedPoint:reportedVelocity:](self, "_createStudyLogDataForPanNormalizedPoint:reportedVelocity:");
  id v12 = [(_UIFocusEventRecognizer *)self _retrieveCachedFocusItemInfo];
  -[_UIFocusEventRecognizer _calculateDeltaForNormalizedPoint:studyLogData:](self, "_calculateDeltaForNormalizedPoint:studyLogData:", v11, v9, v8);
  -[_UIFocusEventRecognizer _applyPanDeadbandToValue:startPoint:currentPoint:remoteTouchSurfaceType:](self, "_applyPanDeadbandToValue:startPoint:currentPoint:remoteTouchSurfaceType:", a5);
  double v14 = v13;
  double v16 = v15;
  -[_UIFocusEventRecognizer _applyHorizontalFlipForFocusItemInfo:toDelta:](self, "_applyHorizontalFlipForFocusItemInfo:toDelta:", v12);
  double v69 = v9;
  double v70 = v8;
  -[_UIFocusEventRecognizer _applyAxisLockingForNormalizedPoint:toDelta:](self, "_applyAxisLockingForNormalizedPoint:toDelta:", v9, v8, v17, v18);
  double v20 = v19;
  double v22 = v21;
  -[_UIFocusEventRecognizer _accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:](self, "_accelerationFactorForCurrentVelocity:alpha:isRotaryGesture:isFocusInKeyboard:remoteTouchSurfaceType:", 0, [v12 focusTouchSensitivityStyle] == 2, a5, x, y, 1.0);
  double v24 = v23;
  double v26 = v25;
  [(_UIFocusEventRecognizer *)self _touchSensitivityForItem:v12 remoteTouchSurfaceType:a5];
  double v28 = y;
  double v30 = v29;
  double v31 = v27;
  BOOL v32 = v29 == *MEMORY[0x1E4F1DB30] && v27 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v33 = v14;
  double v34 = x;
  double v35 = v16;
  if (v32)
  {
    double v50 = v30;
    double v51 = v34;
    double v52 = v28;
    double v65 = v26;
    double v66 = v35;
    double v53 = v33;
    if (os_variant_has_internal_diagnostics())
    {
      v61 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      {
        uint64_t v62 = [v12 item];
        v63 = [v62 debugDescription];
        *(_DWORD *)buf = 138412290;
        v72 = v63;
        _os_log_fault_impl(&dword_1853B0000, v61, OS_LOG_TYPE_FAULT, "Focus Sensitivity for focus item must not be zero: %@", buf, 0xCu);
      }
      double v28 = v52;
      double v33 = v53;
      double v35 = v66;
      double v34 = v51;
      double v26 = v65;
      double v30 = v50;
    }
    else
    {
      int v54 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updatePanLocation_reportedVelocity_remoteTouchSurfaceType____s_category)+ 8);
      BOOL v55 = os_log_type_enabled(v54, OS_LOG_TYPE_ERROR);
      double v33 = v53;
      double v35 = v66;
      double v26 = v65;
      double v28 = v52;
      double v34 = v51;
      double v30 = v50;
      if (v55)
      {
        double v56 = v28;
        double v64 = v34;
        double v57 = v33;
        v58 = v54;
        v59 = [v12 item];
        char v60 = [v59 debugDescription];
        *(_DWORD *)buf = 138412290;
        v72 = v60;
        _os_log_impl(&dword_1853B0000, v58, OS_LOG_TYPE_ERROR, "Focus Sensitivity for focus item must not be zero: %@", buf, 0xCu);

        double v30 = v50;
        double v33 = v57;
        double v34 = v64;
        double v28 = v56;
        double v35 = v66;
      }
    }
  }
  double v36 = v28;
  double v67 = v34 * v24;
  double v68 = v28 * v26;
  double v37 = v33 * v24;
  double v38 = v22 * v26 * v31;
  double v39 = v37 * v30;
  double v40 = v35 * v26 * v31;
  -[_UIFocusEventRecognizer _applyButtonMaskTimeToValue:remoteTouchSurfaceType:](self, "_applyButtonMaskTimeToValue:remoteTouchSurfaceType:", a5, v20 * v24 * v30, v38);
  double v42 = v41;
  double v44 = v43;
  -[_UIFocusEventRecognizer _applyButtonMaskTimeToValue:remoteTouchSurfaceType:](self, "_applyButtonMaskTimeToValue:remoteTouchSurfaceType:", a5, v39, v40);
  -[_UIFocusEventRecognizer _updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:](self, "_updateAccumulatorsWithScaledDelta:unlockedDelta:studyLogData:", v11, v42, v44, v45, v46);
  -[_UIFocusEventRecognizer _recordMomentumForPoint:reportedVelocity:](self, "_recordMomentumForPoint:reportedVelocity:", v69, v70, v34, v36);
  -[_UIFocusEventRecognizer _updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:](self, "_updateMotionEffectsControllerWithProgressAccumulator:unlockedAccumulator:", self->_progressAccumulator.dx, self->_progressAccumulator.dy, self->_unlockedAccumulator.dx, self->_unlockedAccumulator.dy);
  unint64_t v47 = -[_UIFocusEventRecognizer _calculateDirectionalHeadingForAccumulator:studyLogData:](self, "_calculateDirectionalHeadingForAccumulator:studyLogData:", v11, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
  unint64_t v48 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
  BOOL v49 = -[_UIFocusEventRecognizer _attemptPanFocusMovementWithHeading:acceleratedVelocity:focusSystem:studyLogData:](self, "_attemptPanFocusMovementWithHeading:acceleratedVelocity:focusSystem:studyLogData:", v47, v48, v11, v67, v68);

  -[_UIFocusEventRecognizer _cleanupPanMomentumWithAccumulator:movementSuccess:](self, "_cleanupPanMomentumWithAccumulator:movementSuccess:", v49, self->_progressAccumulator.dx, self->_progressAccumulator.dy);
}

- (id)_createPanMovementRequestWithFocusSystem:(id)a3
{
  id v4 = a3;
  CGPoint v5 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  double v7 = [WeakRetained traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 3)
  {
    currentCarTouchpad = self->_currentCarTouchpad;
    if (currentCarTouchpad)
    {
      if ([(CARInputDeviceTouchpad *)currentCarTouchpad supportedFeedbackTypes])
      {
        uint64_t v10 = +[_UIFocusInputDeviceInfo infoWithSenderID:[(CARInputDeviceTouchpad *)self->_currentCarTouchpad senderID]];
        [(_UIFocusMovementRequest *)v5 setInputDeviceInfo:v10];
        [(_UIFocusMovementRequest *)v5 setShouldPerformHapticFeedback:1];
      }
    }
  }
  return v5;
}

- (id)_createStudyLogDataForPanNormalizedPoint:(CGPoint)a3 reportedVelocity:(CGPoint)a4
{
  return 0;
}

- (CGPoint)_calculateDeltaForNormalizedPoint:(CGPoint)a3 studyLogData:(id)a4
{
  CGFloat v4 = a3.x - self->_lastKnownTouchPoint.x;
  CGFloat v5 = a3.y - self->_lastKnownTouchPoint.y;
  self->_lastKnownTouchPoint = a3;
  double v6 = v4;
  double v7 = v5;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)_applyPanDeadbandToValue:(CGPoint)a3 startPoint:(CGPoint)a4 currentPoint:(CGPoint)a5 remoteTouchSurfaceType:(unint64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  if (a6 == 2)
  {
    double v8 = a5.y;
    double v9 = a5.x;
    double v10 = a4.y;
    double v11 = a4.x;
    double panDeadBand = self->_panDeadBand;
    if (panDeadBand > 0.0)
    {
      double v14 = CACurrentMediaTime() - self->_lastButtonPressTime;
      int v15 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_B519_PanDeadbandTime, @"B519_PanDeadbandTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      double v16 = *(double *)&qword_1E8FD5160;
      if (v15) {
        double v16 = 3.0;
      }
      if (v14 <= v16)
      {
        double panDeadBand = self->_panDeadBand;
      }
      else
      {
        self->_double panDeadBand = 0.0;
        double panDeadBand = 0.0;
      }
    }
    double v17 = sqrt((v9 - v11) * (v9 - v11) + (v8 - v10) * (v8 - v10));
    if (panDeadBand <= 0.0 || v17 >= panDeadBand)
    {
      if (panDeadBand > 0.0 && v17 > panDeadBand)
      {
        double v18 = (v17 - panDeadBand) / sqrt(x * x + y * y);
        double x = x * v18;
        double y = y * v18;
        self->_double panDeadBand = 0.0;
      }
    }
    else
    {
      double x = *MEMORY[0x1E4F1DAD8];
      double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
  }
  double v19 = x;
  double v20 = y;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (CGPoint)_applyHorizontalFlipForFocusItemInfo:(id)a3 toDelta:(CGPoint)a4
{
  CGFloat y = a4.y;
  double x = a4.x;
  int v6 = [a3 isFocusMovementFlippedHorizontally];
  double v7 = -x;
  if (!v6) {
    double v7 = x;
  }
  double v8 = y;
  result.CGFloat y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)_applyAxisLockingForNormalizedPoint:(CGPoint)a3 toDelta:(CGPoint)a4
{
  if (a3.x > 0.95 && self->_touchBeganPoint.x < 0.95 || (double y = 0.0, a3.x < 0.05) && self->_touchBeganPoint.x > 0.05)
  {
    double y = a4.y;
    a4.double y = 0.0;
  }
  if (a3.y >= 0.1)
  {
    double x = 0.0;
  }
  else
  {
    double v5 = self->_touchBeganPoint.y;
    if (v5 > 0.1) {
      double x = a4.x;
    }
    else {
      double x = 0.0;
    }
    if (v5 > 0.1) {
      a4.double x = 0.0;
    }
  }
  CGPoint v7 = self->_previousPoints[3];
  CGPoint v8 = self->_previousPoints[1];
  self->_previousPoints[3] = self->_previousPoints[2];
  self->_previousPoints[4] = v7;
  CGPoint lastKnownTouchPoint = self->_lastKnownTouchPoint;
  self->_previousPoints[1] = self->_previousPoints[0];
  self->_previousPoints[2] = v8;
  self->_previousPoints[0] = lastKnownTouchPoint;
  int numFrames = self->_numFrames;
  double v11 = &self->_lastKnownTouchPoint + numFrames;
  double v13 = v11->x;
  double v12 = v11->y;
  if (numFrames <= 4) {
    self->_int numFrames = numFrames + 1;
  }
  double v14 = vabdd_f64(self->_lastKnownTouchPoint.x - x, v13);
  double v15 = vabdd_f64(self->_lastKnownTouchPoint.y - y, v12);
  if (v14 + v15 > 0.05)
  {
    if (v14 >= v15) {
      a4.double y = a4.y * 0.0;
    }
    else {
      a4.double x = a4.x * 0.0;
    }
  }
  double v16 = a4.x;
  double v17 = a4.y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)_applyButtonMaskTimeToValue:(CGPoint)a3 remoteTouchSurfaceType:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (a4 == 2 && ![(_UIFocusEventRecognizer *)self _buttonMaskTimeHasExpired])
  {
    double y = 0.0;
    double x = 0.0;
  }
  double v6 = x;
  double v7 = y;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGVector)_accelerationFactorForCurrentVelocity:(CGPoint)a3 alpha:(double)a4 isRotaryGesture:(BOOL)a5 isFocusInKeyboard:(BOOL)a6 remoteTouchSurfaceType:(unint64_t)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  char v14 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusEngineUsesAccelerationCurve, @"FocusEngineUsesAccelerationCurve", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  double v15 = 1.0;
  if ((v14 & 1) != 0 || !byte_1E8FD518C)
  {
    double v16 = 1.0;
  }
  else
  {
    double v16 = 1.0;
    if ((*(_WORD *)&self->_flags & 0x40) != 0)
    {
      [(_UIFocusEventRecognizer *)self _momentumReferenceSize];
      double v18 = x / v17;
      double v20 = y / v19;
      double v21 = fabs(x / v17);
      double v22 = fabs(y / v19);
      double v23 = _UIFocusEngineAcceleratedSpeedForSpeed(a7, v9, v8, v21);
      double v24 = _UIFocusEngineAcceleratedSpeedForSpeed(a7, v9, v8, v22);
      double v16 = 1.0;
      double v15 = 1.0;
      if (v18 != 0.0) {
        double v15 = 1.0 - a4 + v23 / v21 * a4;
      }
      if (v20 != 0.0) {
        double v16 = 1.0 - a4 + v24 / v22 * a4;
      }
    }
  }
  result.ddouble y = v16;
  result.ddouble x = v15;
  return result;
}

- (void)_updateAccumulatorsWithScaledDelta:(CGPoint)a3 unlockedDelta:(CGPoint)a4 studyLogData:(id)a5
{
  ddouble y = self->_progressAccumulator.dy;
  self->_progressAccumulator.ddouble x = a3.x + self->_progressAccumulator.dx;
  self->_progressAccumulator.ddouble y = a3.y + dy;
  CGFloat v6 = a4.y + self->_unlockedAccumulator.dy;
  self->_unlockedAccumulator.ddouble x = a4.x + self->_unlockedAccumulator.dx;
  self->_unlockedAccumulator.ddouble y = v6;
}

- (void)_updateMotionEffectsControllerWithProgressAccumulator:(CGVector)a3 unlockedAccumulator:(CGVector)a4
{
  double v4 = a4.dx * 0.8;
  double v5 = a4.dy * 0.8;
  if (!self->_focusUpdateCountSinceLastContinuousMovementBegan)
  {
    a3.ddouble y = v5;
    a3.ddouble x = v4;
  }
  -[_UIFocusEffectsController updateCurrentOffset:](self->_motionEffectsController, "updateCurrentOffset:", a3.dx, a3.dy);
}

- (unint64_t)_calculateDirectionalHeadingForAccumulator:(CGVector)a3 studyLogData:(id)a4
{
  unint64_t v4 = 8;
  uint64_t v5 = 4;
  if (a3.dx > -1.0) {
    uint64_t v5 = 0;
  }
  if (a3.dx < 1.0) {
    unint64_t v4 = v5;
  }
  unint64_t v6 = 2;
  if (a3.dy < 1.0) {
    unint64_t v6 = a3.dy <= -1.0;
  }
  if (fabs(a3.dy) >= fabs(a3.dx)) {
    return v6;
  }
  else {
    return v4;
  }
}

- (BOOL)_attemptPanFocusMovementWithHeading:(unint64_t)a3 acceleratedVelocity:(CGPoint)a4 focusSystem:(id)a5 studyLogData:(id)a6
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  BOOL v11 = [(_UIFocusEventRecognizer *)self _shouldPerformFocusUpdateWithCurrentMomentumStatus];
  if (!a3) {
    goto LABEL_8;
  }
  char v12 = !v11;
  if (!v10) {
    char v12 = 1;
  }
  if (v12)
  {
    [(_UIFocusEventRecognizer *)self _stopMomentumAndPerformRollback];
LABEL_8:
    LOBYTE(v15) = 0;
    goto LABEL_11;
  }
  double v13 = [(_UIFocusEventRecognizer *)self _createPanMovementRequestWithFocusSystem:v10];
  char v14 = -[_UIFocusEventRecognizer _createMovementInfoForHeading:groupFilter:acceleratedVelocity:](self, "_createMovementInfoForHeading:groupFilter:acceleratedVelocity:", a3, 0, x, y);
  [v13 setMovementInfo:v14];

  BOOL v15 = [(_UIFocusEventRecognizer *)self _attemptToRecognizeContinuousMovementRequest:v13];
  if (v15) {
    [(_UIFocusEventRecognizer *)self _continuousMovementSucceededWithDirectionalHeading:a3];
  }
  else {
    [(_UIFocusEventRecognizer *)self _continuousMovementFailedWithPrimaryHeading:a3];
  }

LABEL_11:
  return v15;
}

- (id)_createMovementInfoForHeading:(unint64_t)a3 groupFilter:(int64_t)a4 acceleratedVelocity:(CGPoint)a5
{
  uint64_t v5 = -[_UIFocusMovementInfo initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:", a3, *(_WORD *)&self->_flags & 1, (a3 & 0x330) == 0, a4, self->_inputType, a5.x, a5.y);
  return v5;
}

- (BOOL)_attemptToRecognizeContinuousMovementRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 movementInfo];
  uint64_t v6 = [v5 heading];
  unint64_t failedContinuousMovementHeading = self->_failedContinuousMovementHeading;

  BOOL v8 = (v6 != failedContinuousMovementHeading
     || [(_UIFocusEventRecognizer *)self _hasFailedMovementHeadingExpired])
    && [(_UIFocusEventRecognizer *)self _didRecognizeFocusMovementRequest:v4];

  return v8;
}

- (void)_continuousMovementSucceededWithDirectionalHeading:(unint64_t)a3
{
  [(_UIFocusEventRecognizer *)self _resetProgressAccumulatorWithHeading:a3];
  [(_UIFocusEffectsController *)self->_motionEffectsController adjustDisplayOffsetAccumulationFactorForFocusTransfer];
  motionEffectsController = self->_motionEffectsController;
  ddouble x = self->_progressAccumulator.dx;
  ddouble y = self->_progressAccumulator.dy;
  double v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  -[_UIFocusEffectsController updateCurrentOffset:overrideDisplayOffset:](motionEffectsController, "updateCurrentOffset:overrideDisplayOffset:", v7, dx, dy);

  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | (self->_inputType == 7);
  ++self->_focusUpdateCountSinceLastContinuousMovementBegan;
}

- (void)_continuousMovementFailedWithPrimaryHeading:(unint64_t)a3
{
  __asm
  {
    FMOV            V1.2D, #1.0
    FMOV            V2.2D, #-1.0
  }
  self->_progressAccumulator = (CGVector)vmaxnmq_f64(vminnmq_f64((float64x2_t)self->_progressAccumulator, _Q1), _Q2);
  self->_unlockedAccumulator = (CGVector)vmaxnmq_f64(vminnmq_f64((float64x2_t)self->_unlockedAccumulator, _Q1), _Q2);
  [(_UIFocusEventRecognizer *)self _resetCachedFocusItemInfo];
  [(_UIFocusEventRecognizer *)self _updateFailedContinuousMovementHeading:a3];
}

- (void)_updateFailedContinuousMovementHeading:(unint64_t)a3
{
  if (self->_failedContinuousMovementHeading != a3
    || [(_UIFocusEventRecognizer *)self _hasFailedMovementHeadingExpired])
  {
    self->_unint64_t failedContinuousMovementHeading = a3;
    [(_UIFocusRotaryIndicatorView *)self->_rotaryIndicatorView updateFailedMovementHeading:a3];
    if (self->_failedContinuousMovementHeading) {
      CFTimeInterval v5 = CACurrentMediaTime();
    }
    else {
      CFTimeInterval v5 = 0.0;
    }
    self->_failedContinuousMovementTime = v5;
  }
}

- (BOOL)_hasFailedMovementHeadingExpired
{
  double v2 = CACurrentMediaTime() - self->_failedContinuousMovementTime;
  int v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusFailedMovementHeadingTimeout, @"FocusFailedMovementHeadingTimeout", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v4 = *(double *)&qword_1EB257300;
  if (v3) {
    double v4 = 0.5;
  }
  return v2 > v4;
}

- (void)_cleanupPanMomentumWithAccumulator:(CGVector)a3 movementSuccess:(BOOL)a4
{
  if (!a4)
  {
    double v5 = hypot(a3.dx, a3.dy);
    if ((*(_WORD *)&self->_flags & 2) != 0 && v5 > 2.0)
    {
      [(_UIFocusEventRecognizer *)self _stopMomentumAndPerformRollback];
    }
  }
}

- (void)_panGestureEnd:(id)a3
{
  *(_WORD *)&self->_flags &= ~0x80u;
  [(_UIFocusEventRecognizer *)self _continueTouchWithMomentum];
  [(_UIFocusEventRecognizer *)self _resetContinuousMovementState];
}

- (void)_panGestureCancelled:(id)a3
{
  [(_UIFocusEventRecognizer *)self _resetContinuousMovementState];
  motionEffectsController = self->_motionEffectsController;
  [(_UIFocusEffectsController *)motionEffectsController reset];
}

- (void)_resetProgressAccumulatorWithHeading:(unint64_t)a3
{
  double v5 = +[UIDevice currentDevice];
  BOOL v6 = [v5 _remoteTouchSurfaceType] == 2;

  if ((a3 & 0xC) != 0)
  {
    if ((a3 & 3) != 0) {
      return;
    }
    uint64_t v7 = 184;
    uint64_t v8 = 168;
    uint64_t v9 = 8;
  }
  else
  {
    if ((a3 & 3) == 0) {
      return;
    }
    uint64_t v7 = 192;
    uint64_t v8 = 176;
    uint64_t v9 = 2;
  }
  double v10 = dbl_186B965B0[v6];
  double v11 = 2.0 - v10;
  double v12 = v10 + -2.0;
  if ((v9 & a3) != 0) {
    double v12 = v11;
  }
  *(double *)((char *)&self->super.isa + v8) = *(double *)((char *)&self->super.isa + v8) - v12;
  *(double *)((char *)&self->super.isa + v7) = *(double *)((char *)&self->super.isa + v7) - v12;
}

- (void)_resetContinuousMovementState
{
  *(_WORD *)&self->_flags &= ~0x40u;
  self->_unint64_t inputType = 0;
}

- (void)_resetFailedMovementHeading
{
}

- (void)_joystickGestureBegan:(id)a3
{
  self->_unint64_t inputType = 3;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFA | 1;
  joystickModeExitTimer = self->_joystickModeExitTimer;
  if (joystickModeExitTimer)
  {
    [(NSTimer *)joystickModeExitTimer invalidate];
    double v5 = self->_joystickModeExitTimer;
    self->_joystickModeExitTimer = 0;
  }
  else
  {
    [(_UIFocusEffectsController *)self->_motionEffectsController cancelRollbackAnimation];
    [(_UIFocusEventRecognizer *)self _resetMomentum];
    [(_UIFocusEventRecognizer *)self _sendGestureBeginNotification];
    [(CADisplayLink *)self->_joystickFocusDirectionDisplayLink invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    uint64_t v7 = [WeakRetained _screen];
    uint64_t v8 = [v7 displayLinkWithTarget:self selector:sel__joystickDisplayLinkHeartbeat_];
    joystickFocusDirectionDisplayLink = self->_joystickFocusDirectionDisplayLink;
    self->_joystickFocusDirectionDisplayLink = v8;

    double v10 = self->_joystickFocusDirectionDisplayLink;
    double v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v10 addToRunLoop:v11 forMode:*MEMORY[0x1E4F1C4B0]];
    double v5 = v11;
  }
}

- (void)_joystickGestureUpdated:(id)a3
{
  if ((*(_WORD *)&self->_flags & 8) != 0) {
    [(_UIFocusEventRecognizer *)self _handleJoystickRepeatMode:a3];
  }
  else {
    [(_UIFocusEventRecognizer *)self _handleJoystickTiltMode:a3];
  }
}

- (void)_joystickGestureEnded:(id)a3
{
  [(NSTimer *)self->_joystickModeExitTimer invalidate];
  _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_JoystickModeExitInterval, @"JoystickModeExitInterval", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  _UIFocusEngineJoystickTimer((uint64_t)self, (uint64_t)sel__exitJoystickModeForReal_);
  double v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  joystickModeExitTimer = self->_joystickModeExitTimer;
  self->_joystickModeExitTimer = v4;

  [(NSTimer *)self->_joystickModeRepeatTimer invalidate];
  joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
  self->_joystickModeRepeatTimer = 0;
}

- (void)_exitJoystickModeForReal:(id)a3
{
  self->_unint64_t inputType = 0;
  joystickModeExitTimer = self->_joystickModeExitTimer;
  self->_joystickModeExitTimer = 0;

  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF3 | 4;
  self->_joystickRepeatCount = 0;
}

- (void)_handleJoystickRepeatMode:(id)a3
{
  id v4 = a3;
  *(_WORD *)&self->_flags &= ~0x10u;
  [v4 stickPosition];
  long double v6 = v5;
  long double v8 = v7;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB2573F8, @"JoystickTiltModeRadius", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v9 = 0.6; {
  else
  }
    double v9 = *(double *)&qword_1EB257400;
  double v10 = [(_UIFocusEventRecognizer *)self _retrieveCachedFocusItemInfo];
  double v11 = -[_UIFocusEventRecognizer _focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:](self, "_focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:", [v10 inheritedFocusMovementStyle], (double)v6, (double)v8, v9);
  if (![(_UIFocusEventRecognizer *)self _joystickFocusMovement:v11 shouldBeConsideredEqualToFocusMovement:self->_previousJoystickFocusMovementInfo])
  {
    *(_WORD *)&self->_flags &= ~8u;
    self->_joystickRepeatCount = 0;
    [(_UIFocusEventRecognizer *)self _handleJoystickTiltMode:v4];
    goto LABEL_17;
  }
  if (hypot(v6, v8) >= v9)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v14 = v13 - self->_previousJoystickFocusMovementTime;
    [(_UIFocusEventRecognizer *)self _joystickRepeatDurationForTimeInMovementZone:v13 - self->_previousJoystickRegionEntryTime];
    if (v14 < v15)
    {
LABEL_16:
      [(NSTimer *)self->_joystickModeRepeatTimer invalidate];
      _UIFocusEngineJoystickTimer((uint64_t)self, (uint64_t)sel__joystickPerformRepeat_);
      double v20 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
      self->_joystickModeRepeatTimer = v20;

      goto LABEL_17;
    }
    double v16 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
    if (v16)
    {
      double v17 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v16];
      [(_UIFocusMovementRequest *)v17 setMovementInfo:v11];
      BOOL v18 = [(_UIFocusEventRecognizer *)self _joystickAttemptFocusMovementWithRequest:v17];

      if (v18)
      {
        ++self->_joystickRepeatCount;
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      double v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_handleJoystickRepeatMode____s_category) + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v22 = 0;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring joystick movement request.", v22, 2u);
      }
    }
    -[_UIFocusEventRecognizer _continuousMovementFailedWithPrimaryHeading:](self, "_continuousMovementFailedWithPrimaryHeading:", [v11 heading]);
    goto LABEL_15;
  }
  *(_WORD *)&self->_flags &= ~8u;
  [(NSTimer *)self->_joystickModeRepeatTimer invalidate];
  double v12 = self->_joystickModeRepeatTimer;
  self->_joystickModeRepeatTimer = 0;

  self->_joystickRepeatCount = 0;
LABEL_17:
}

- (void)_handleJoystickTiltMode:(id)a3
{
  id v4 = a3;
  [v4 stickPosition];
  double v6 = v5;
  double v8 = v7;
  [v4 previousStickPosition];
  double v10 = v9;
  double v12 = v11;

  double v13 = [(_UIFocusEventRecognizer *)self _retrieveCachedFocusItemInfo];
  uint64_t v14 = [v13 inheritedFocusMovementStyle];
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB2573F8, @"JoystickTiltModeRadius", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v15 = 0.6; {
  else
  }
    double v15 = *(double *)&qword_1EB257400;
  double v16 = -[_UIFocusEventRecognizer _focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:](self, "_focusMovementForJoystickPosition:usingMinimumRadius:focusMovementStyle:", v14, v6, v8, v15);
  if (v16)
  {
    unint64_t v17 = -[_UIFocusEventRecognizer _headingForJoystickPosition:usingMinimumRadius:](self, "_headingForJoystickPosition:usingMinimumRadius:", v10, v12, v15);
    uint64_t v18 = [v16 heading];
    double v19 = self->_previousJoystickFocusMovementInfo;
    double v20 = v19;
    if (v18 == v17 || v19 == 0)
    {
      if (v18 == v17) {
        goto LABEL_22;
      }
    }
    else if ([(_UIFocusEventRecognizer *)self _joystickFocusMovement:v16 shouldBeConsideredEqualToFocusMovement:v19])
    {
      goto LABEL_22;
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_previousJoystickRegionEntryTime = v24;
    self->_joystickRepeatingHeading = [v16 heading];
    [(NSTimer *)self->_joystickModeRepeatTimer invalidate];
    joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
    self->_joystickModeRepeatTimer = 0;

    double v26 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
    if (v26)
    {
      double v27 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v26];
      [(_UIFocusMovementRequest *)v27 setMovementInfo:v16];
      BOOL v28 = [(_UIFocusEventRecognizer *)self _joystickAttemptFocusMovementWithRequest:v27];

      if (v28)
      {
        objc_storeStrong((id *)&self->_previousJoystickFocusMovementInfo, v16);
        _UIInternalPreferenceUsesDefault((int *)&unk_1EB2573D8, @"JoystickRepeatStartTime", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
        _UIFocusEngineJoystickTimer((uint64_t)self, (uint64_t)sel__joystickPerformRepeat_);
        double v29 = (NSTimer *)objc_claimAutoreleasedReturnValue();
        double v30 = self->_joystickModeRepeatTimer;
        self->_joystickModeRepeatTimer = v29;

LABEL_21:
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {
      double v31 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_handleJoystickTiltMode____s_category) + 8);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v32 = 0;
        _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring joystick movement request.", v32, 2u);
      }
    }
    -[_UIFocusEventRecognizer _continuousMovementFailedWithPrimaryHeading:](self, "_continuousMovementFailedWithPrimaryHeading:", [v16 heading]);
    goto LABEL_21;
  }
  previousJoystickFocusMovementInfo = self->_previousJoystickFocusMovementInfo;
  if (previousJoystickFocusMovementInfo)
  {
    self->_previousJoystickFocusMovementInfo = 0;
  }
LABEL_23:
}

- (BOOL)_joystickAttemptFocusMovementWithRequest:(id)a3
{
  id v4 = a3;
  double v5 = [v4 movementInfo];
  uint64_t v6 = [v5 heading];

  if (v6
    && [(_UIFocusEventRecognizer *)self _attemptToRecognizeContinuousMovementRequest:v4])
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_previousJoystickFocusMovementTime = v7;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_joystickPerformRepeat:(id)a3
{
  *(_WORD *)&self->_flags |= 0x18u;
}

- (double)_joystickRepeatDurationForTimeInMovementZone:(double)a3
{
  if (_UIInternalPreferenceUsesDefault((int *)algn_1EB257428, @"JoystickAccelerationBaseline", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v4 = 0.1; {
  else
  }
    double v4 = *(double *)&qword_1EB257430;
  if (_UIInternalPreferenceUsesDefault((int *)algn_1EB257438, @"JoystickAccelerationMinimum", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v5 = 0.05; {
  else
  }
    double v5 = *(double *)&qword_1EB257440;
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257408, @"JoystickAccelerationBreakpointA", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v6 = 0.75; {
  else
  }
    double v6 = *(double *)&qword_1EB257410;
  if (_UIInternalPreferenceUsesDefault((int *)algn_1EB257418, @"JoystickAccelerationBreakpointB", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v7 = 2.0; {
  else
  }
    double v7 = *(double *)&qword_1EB257420;
  if (v6 > a3 || v7 <= a3)
  {
    if (v7 <= a3) {
      return v5;
    }
  }
  else
  {
    double v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    double v10 = v9;
    double v11 = 0.0;
    if (v6 <= a3)
    {
      LODWORD(v11) = 1.0;
      if (v7 >= a3)
      {
        double v11 = (a3 - v6) / (v7 - v6) + 0.0;
        *(float *)&double v11 = v11;
      }
    }
    [v9 _solveForInput:v11];
    if (v12 >= 0.0)
    {
      if (v12 <= 1.0) {
        double v4 = v4 + (v5 - v4) * v12;
      }
      else {
        double v4 = v5;
      }
    }
  }
  return v4;
}

- (BOOL)_joystickFocusMovement:(id)a3 shouldBeConsideredEqualToFocusMovement:(id)a4
{
  BOOL result = 0;
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    [v7 _velocity];
    long double v9 = v8;
    [v7 _velocity];
    long double v11 = v10;

    double v12 = atan2(v9, v11);
    [v6 _velocity];
    long double v14 = v13;
    [v6 _velocity];
    long double v16 = v15;

    double v17 = atan2(v14, v16) - v12;
    if (v17 <= 3.14159265)
    {
      if (v17 >= -3.14159265) {
        return fabs(v17) <= 0.523598776;
      }
      double v18 = 6.28318531;
    }
    else
    {
      double v18 = -6.28318531;
    }
    double v17 = v17 + v18;
    return fabs(v17) <= 0.523598776;
  }
  return result;
}

- (id)_focusMovementForJoystickPosition:(CGPoint)a3 usingMinimumRadius:(double)a4 focusMovementStyle:(int64_t)a5
{
  double y = a3.y;
  CGFloat x = a3.x;
  if (hypot(a3.x, a3.y) <= a4)
  {
    long double v16 = 0;
  }
  else
  {
    if (a5 == 2
      && (long double v10 = hypot(x, -y),
          double v11 = x / v10 * 2500.0,
          double v12 = -y / v10 * 2500.0,
          fabs(atan2(fabs(v12), fabs(v11)) + -0.785398163) <= 0.6981))
    {
      unint64_t v13 = 0;
    }
    else
    {
      unint64_t v13 = -[_UIFocusEventRecognizer _headingForJoystickPosition:usingMinimumRadius:](self, "_headingForJoystickPosition:usingMinimumRadius:", x, y, a4);
      [(_UIFocusEventRecognizer *)self _joystickVelocityForHeading:v13];
      double v11 = v14;
      double v12 = v15;
    }
    long double v16 = -[_UIFocusMovementInfo initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:]([_UIFocusMovementInfo alloc], "initWithHeading:velocity:isInitial:shouldLoadScrollableContainer:groupFilter:inputType:", v13, *(_WORD *)&self->_flags & 1, 1, 0, self->_inputType, v11, v12);
  }
  return v16;
}

- (CGVector)_joystickVelocityForHeading:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  double v4 = 0.0;
  double v5 = 0.0;
  if (a3 - 1 <= 7)
  {
    double v4 = dbl_186B966A8[v3];
    double v5 = dbl_186B966E8[v3];
  }
  result.ddouble y = v4;
  result.dCGFloat x = v5;
  return result;
}

- (unint64_t)_headingForJoystickPosition:(CGPoint)a3 usingMinimumRadius:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  if (hypot(a3.x, a3.y) <= a4) {
    return 0;
  }
  double v6 = -x;
  BOOL v7 = y >= x && y >= -x;
  if (v7) {
    return 1;
  }
  BOOL v8 = y >= -x;
  if (y >= x) {
    BOOL v8 = 0;
  }
  if (v8) {
    return 8;
  }
  BOOL v9 = y >= x;
  if (y >= v6) {
    BOOL v9 = 1;
  }
  int v10 = y < x || !v9;
  if (y >= v6) {
    int v10 = 1;
  }
  BOOL v7 = !v9;
  unint64_t v11 = 2;
  if (!v7) {
    unint64_t v11 = 0;
  }
  if (v10) {
    return v11;
  }
  else {
    return 4;
  }
}

- (void)_joystickDisplayLinkHeartbeat:(id)a3
{
  [(_UIFocusEffectsController *)self->_motionEffectsController currentOffset];
  if (fabs(v4) < 0.05)
  {
    [(_UIFocusEffectsController *)self->_motionEffectsController currentOffset];
    if (fabs(v5) < 0.05 && (*(_WORD *)&self->_flags & 4) != 0)
    {
      [(_UIFocusEffectsController *)self->_motionEffectsController reset];
      [(CADisplayLink *)self->_joystickFocusDirectionDisplayLink invalidate];
      joystickFocusDirectionDisplayLink = self->_joystickFocusDirectionDisplayLink;
      self->_joystickFocusDirectionDisplayLink = 0;
    }
  }
  BOOL v7 = [(_UIFocusEventRecognizer *)self gestureForName:9];
  id v19 = v7;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
    [(_UIFocusEventRecognizer *)self _handleJoystickRepeatMode:v7];
    BOOL v7 = v19;
  }
  [v7 stickPosition];
  double v9 = v8;
  double v11 = v10;
  int v12 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB2573F8, @"JoystickTiltModeRadius", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v13 = *(double *)&qword_1EB257400;
  if (v12) {
    double v13 = 0.6;
  }
  double v14 = -1.0;
  double v15 = -1.0;
  if (v9 >= -v13)
  {
    double v15 = 1.0;
    if (v9 <= v13) {
      double v15 = (v9 + v13) / (v13 + v13) + (v9 + v13) / (v13 + v13) + -1.0;
    }
  }
  if (v11 <= v13)
  {
    double v14 = 1.0;
    if (v13 >= -v11) {
      double v14 = (v13 - v11) / (v13 + v13) + (v13 - v11) / (v13 + v13) + -1.0;
    }
  }
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB2573E8, @"JoystickLerp", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v16 = 0.2; {
  else
  }
    double v16 = *(double *)&qword_1EB2573F0;
  [(_UIFocusEffectsController *)self->_motionEffectsController currentOffset];
  -[_UIFocusEffectsController updateCurrentOffset:](self->_motionEffectsController, "updateCurrentOffset:", v15 * v16 + (1.0 - v16) * v17, v14 * v16 + (1.0 - v16) * v18);
}

- (void)_resetJoystick
{
  self->_unint64_t inputType = 0;
  *(_WORD *)&self->_flags &= ~4u;
  [(CADisplayLink *)self->_joystickFocusDirectionDisplayLink invalidate];
  joystickFocusDirectionDisplayLink = self->_joystickFocusDirectionDisplayLink;
  self->_joystickFocusDirectionDisplayLink = 0;

  [(NSTimer *)self->_joystickModeRepeatTimer invalidate];
  joystickModeRepeatTimer = self->_joystickModeRepeatTimer;
  self->_joystickModeRepeatTimer = 0;

  [(NSTimer *)self->_joystickModeExitTimer invalidate];
  joystickModeExitTimer = self->_joystickModeExitTimer;
  self->_joystickModeExitTimer = 0;

  self->_joystickRepeatCount = 0;
}

- (void)_resetMotionEffects
{
}

- (CGSize)_momentumReferenceSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  unint64_t v3 = [WeakRetained _screen];

  if (!v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Unable to get screen from owning view for focus momentum calculations.", buf, 2u);
      }
    }
    else
    {
      double v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_momentumReferenceSize___s_category) + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v12[0] = 0;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Unable to get screen from owning view for focus momentum calculations.", (uint8_t *)v12, 2u);
      }
    }
    unint64_t v3 = +[UIScreen mainScreen];
  }
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_resetMomentum
{
  CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  CGPoint touchBeganPoint = self->_touchBeganPoint;
  self->_firstMomentumTouchPoint = touchBeganPoint;
  self->_CGPoint lastMomentumTouchPoint = touchBeganPoint;
  self->_momentumVelocitdouble y = v3;
  [(CADisplayLink *)self->_momentumDisplayLink invalidate];
  momentumDisplayLink = self->_momentumDisplayLink;
  self->_momentumDisplayLink = 0;

  *(_WORD *)&self->_flags &= ~2u;
}

- (void)_recordMomentumForPoint:(CGPoint)a3 reportedVelocity:(CGPoint)a4
{
  if ((*(_WORD *)&self->_flags & 2) == 0)
  {
    double y = a4.y;
    double x = a4.x;
    self->_CGPoint lastMomentumTouchPoint = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
    [(_UIFocusEventRecognizer *)self _momentumReferenceSize];
    self->_momentumVelocity.double x = x / v7;
    self->_momentumVelocity.double y = y / v8;
  }
}

- (void)_continueTouchWithMomentum
{
  unint64_t focusUpdateCountSinceLastContinuousMovementBegan = self->_focusUpdateCountSinceLastContinuousMovementBegan;
  if (focusUpdateCountSinceLastContinuousMovementBegan > 1) {
    goto LABEL_13;
  }
  double v4 = hypot(self->_momentumVelocity.x, self->_momentumVelocity.y);
  if (fabs(self->_progressAccumulator.dx) >= 1.0 || v4 < 0.5) {
    goto LABEL_13;
  }
  if (focusUpdateCountSinceLastContinuousMovementBegan)
  {
    [(_UIFocusEventRecognizer *)self _sendMomentumEndNotificationsAndAnimateRollback:1];
    return;
  }
  unint64_t v6 = -[_UIFocusEventRecognizer _momentumFocusHeadingForAccumulator:](self, "_momentumFocusHeadingForAccumulator:");
  if (!v6)
  {
LABEL_13:
    float64x2_t v12 = vabdq_f64((float64x2_t)self->_lastKnownTouchPoint, *((float64x2_t *)&self->_lastKnownTouchPoint + self->_numFrames));
    if (vmovn_s64(vcgtq_f64(v12, (float64x2_t)vdupq_laneq_s64((int64x2_t)v12, 1))).u8[0])
    {
      double x = self->_momentumVelocity.x;
      double y = 0.0;
    }
    else
    {
      double y = self->_momentumVelocity.y;
      double x = 0.0;
    }
    if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257358, @"FocusMomentumFriction", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v15 = 0.99; {
    else
    }
      double v15 = *(double *)&qword_1EB257360;
    -[_UIFocusEventRecognizer _beginMomentumImmediatelyWithVelocity:friction:](self, "_beginMomentumImmediatelyWithVelocity:friction:", x, y, v15);
  }
  else
  {
    unint64_t v7 = v6;
    double v8 = [(_UIFocusEventRecognizer *)self _focusMovementSystem];
    if (v8)
    {
      double v9 = [[_UIFocusMovementRequest alloc] initWithFocusSystem:v8];
      double v10 = +[_UIFocusMovementInfo _movementWithHeading:v7 isInitial:*(_WORD *)&self->_flags & 1];
      [(_UIFocusMovementRequest *)v9 setMovementInfo:v10];

      LODWORD(v10) = [(_UIFocusEventRecognizer *)self _attemptToRecognizeContinuousMovementRequest:v9];
      uint64_t v11 = v10 ^ 1;
    }
    else
    {
      double v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &_continueTouchWithMomentum___s_category) + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v17 = 0;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Focus event recognizer is no longer connected to a focus system. Ignoring movement request.", v17, 2u);
      }
      uint64_t v11 = 1;
    }
    [(_UIFocusEventRecognizer *)self _sendMomentumEndNotificationsAndAnimateRollback:v11];
  }
}

- (void)_beginMomentumImmediatelyWithVelocity:(CGPoint)a3 friction:(double)a4
{
  self->_momentumVelocitdouble y = a3;
  self->_momentumFriction = a4;
  *(_WORD *)&self->_flags |= 2u;
  momentumDisplayLink = self->_momentumDisplayLink;
  if (momentumDisplayLink)
  {
    [(CADisplayLink *)momentumDisplayLink invalidate];
    unint64_t v6 = self->_momentumDisplayLink;
    self->_momentumDisplayLink = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  double v8 = [WeakRetained _screen];
  double v9 = [v8 displayLinkWithTarget:self selector:sel__momentumHeartbeat_];
  double v10 = self->_momentumDisplayLink;
  self->_momentumDisplayLink = v9;

  uint64_t v11 = self->_momentumDisplayLink;
  id v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [(CADisplayLink *)v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];
}

- (unint64_t)_momentumFocusHeadingForAccumulator:(CGVector)a3
{
  if (a3.dx > -0.5 && a3.dx < 0.5)
  {
    unint64_t v5 = 2;
    if (a3.dy <= 0.0) {
      unint64_t v5 = 1;
    }
    if (a3.dy > -0.5 && a3.dy < 0.5) {
      return 0;
    }
    else {
      return v5;
    }
  }
  else if (a3.dx <= 0.0)
  {
    return 4;
  }
  else
  {
    return 8;
  }
}

- (void)_momentumHeartbeat:(id)a3
{
  id v32 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  uint64_t v5 = [WeakRetained _screen];
  if (!v5)
  {

    goto LABEL_13;
  }
  unint64_t v6 = (void *)v5;
  id v7 = objc_loadWeakRetained((id *)&self->_owningView);
  double v8 = [v7 _window];
  double v9 = [v8 windowScene];

  if (!v9)
  {
LABEL_13:
    [(CADisplayLink *)self->_momentumDisplayLink invalidate];
    momentumDisplayLink = self->_momentumDisplayLink;
    self->_momentumDisplayLink = 0;

    goto LABEL_14;
  }
  double x = self->_lastMomentumTouchPoint.x;
  double y = self->_lastMomentumTouchPoint.y;
  [v32 duration];
  double v13 = v12;
  double v15 = self->_momentumVelocity.x;
  double v14 = self->_momentumVelocity.y;
  if (self->_inputType != 7)
  {
    long double v16 = pow(self->_momentumFriction, v12 * 1000.0);
    double v15 = v15 * v16;
    double v14 = v14 * v16;
  }
  CGFloat v17 = x + v13 * v15;
  CGFloat v18 = y + v13 * v14;
  [(_UIFocusEventRecognizer *)self _momentumReferenceSize];
  double v20 = v15 * v19;
  double v22 = v14 * v21;
  double v23 = +[UIDevice currentDevice];
  uint64_t v24 = [v23 _remoteTouchSurfaceType];

  -[_UIFocusEventRecognizer _updatePanLocation:reportedVelocity:remoteTouchSurfaceType:](self, "_updatePanLocation:reportedVelocity:remoteTouchSurfaceType:", v24, v17, v18, v20, v22);
  self->_lastMomentumTouchPoint.double x = v17;
  self->_lastMomentumTouchPoint.double y = v18;
  double v25 = fabs(v15);
  self->_momentumVelocity.double x = v15;
  self->_momentumVelocity.double y = v14;
  int v26 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusMomentumCutoff, @"FocusMomentumCutoff", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v27 = *(double *)&qword_1E8FD51B8;
  if (v26) {
    double v27 = 1.0;
  }
  if (v25 < v27)
  {
    double v28 = fabs(v14);
    int v29 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusMomentumCutoff, @"FocusMomentumCutoff", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v30 = *(double *)&qword_1E8FD51B8;
    if (v29) {
      double v30 = 1.0;
    }
    if (v28 < v30) {
      [(_UIFocusEventRecognizer *)self _stopMomentumAndPerformRollback];
    }
  }
LABEL_14:
}

- (BOOL)_shouldPerformFocusUpdateWithCurrentMomentumStatus
{
  int v3 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusMomentumCutoffStraggler, @"FocusMomentumCutoffStraggler", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v4 = *(double *)&qword_1E8FD51C8;
  if (v3) {
    double v4 = 1.0;
  }
  return (*(_WORD *)&self->_flags & 2) == 0
      || fabs(self->_momentumVelocity.x) > v4
      || fabs(self->_momentumVelocity.y) > v4;
}

- (void)_stopMomentumAndPerformRollback
{
  [(CADisplayLink *)self->_momentumDisplayLink invalidate];
  momentumDisplayLink = self->_momentumDisplayLink;
  self->_momentumDisplayLink = 0;

  [(_UIFocusEventRecognizer *)self _sendMomentumEndNotificationsAndAnimateRollback:1];
}

- (void)_sendMomentumEndNotificationsAndAnimateRollback:(BOOL)a3
{
  if (a3)
  {
    [(_UIFocusEffectsController *)self->_motionEffectsController startRollbackAnimation];
    [(_UIFocusEffectsController *)self->_motionEffectsController resetDisplayOffsetAccumulationFactor];
  }
  *(_WORD *)&self->_flags &= ~2u;
}

+ (BOOL)_canSupportFastScrolling
{
  return (byte_1E8FD5194 != 0) & ~_UIInternalPreferenceUsesDefault(&_UIInternalPreference_FocusFastScrollingEnabled, @"FocusFastScrollingEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
}

- (void)_sendGestureBeginNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIFocusEngineGestureDidBeginNotification" object:self userInfo:0];
}

- (void)_uiktest_setPanGestureRecognizer:(id)a3
{
}

- (id)_uiktest_panGestureRecognizer
{
  return [(_UIFocusEventRecognizer *)self gestureForName:1];
}

- (UIView)owningView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningView);
  return (UIView *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (_UIFocusEventRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIFocusEventRecognizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIMoveEvent)_moveEvent
{
  return self->_moveEvent;
}

- (void)_setMoveEvent:(id)a3
{
}

- (_UIFocusEffectsController)_motionEffectsController
{
  return self->_motionEffectsController;
}

- (_UIFocusFastScrollingRecognizer)_fastScrollingRecognizer
{
  return self->_fastScrollingRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastScrollingRecognizer, 0);
  objc_storeStrong((id *)&self->_motionEffectsController, 0);
  objc_storeStrong((id *)&self->_moveEvent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_destroyWeak((id *)&self->_owningView);
  objc_storeStrong((id *)&self->_currentCarTouchpad, 0);
  objc_storeStrong((id *)&self->_cachedFocusItemInfo, 0);
  objc_storeStrong((id *)&self->_lastScrolledScroll, 0);
  objc_storeStrong((id *)&self->_previousJoystickFocusMovementInfo, 0);
  objc_storeStrong((id *)&self->_joystickFocusDirectionDisplayLink, 0);
  objc_storeStrong((id *)&self->_joystickModeRepeatTimer, 0);
  objc_storeStrong((id *)&self->_joystickModeExitTimer, 0);
  objc_storeStrong((id *)&self->_momentumDisplayLink, 0);
  objc_storeStrong((id *)&self->_linearDebugView, 0);
  objc_storeStrong((id *)&self->_showRotaryIndicatorAfterDelayTimer, 0);
  objc_storeStrong((id *)&self->_rotaryIndicatorView, 0);
  objc_storeStrong((id *)&self->_gestureRecognizers, 0);
}

@end