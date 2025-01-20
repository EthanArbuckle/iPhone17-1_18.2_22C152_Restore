@interface _UIKeyboardTextSelectionInteraction
+ (void)attachToExistingRecogniser:(id)a3 owner:(id)a4 forType:(int64_t)a5;
- (BOOL)forceTouchGestureRecognizerShouldBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPlacedCarefully;
- (CGPoint)acceleratedTranslation:(CGPoint)a3 velocity:(CGPoint)a4 isActive:(BOOL)a5;
- (CGPoint)boundedTranslation:(CGPoint)a3;
- (CGPoint)cursorLocationForTranslation:(CGPoint)a3;
- (_UIKeyboardTextSelectionInteraction)initWithView:(id)a3 owner:(id)a4 forTypes:(int64_t)a5;
- (double)additionalPressDurationForTypingCadence:(id)a3;
- (id)gestures;
- (id)owner;
- (id)selectionController;
- (int64_t)layoutDirectionFromFlickDirection:(unint64_t)a3;
- (void)_beginLongForcePressTimerForGesture:(id)a3;
- (void)_cancelLongForcePressTimer;
- (void)_cancelTouchPadTimer;
- (void)_clearHiding;
- (void)_clearTouchPadCallback;
- (void)_configureLongPressAddedTouchRecognizer:(id)a3;
- (void)_configureLongPressRecognizer:(id)a3;
- (void)_configureOneFingerForcePressRecognizer:(id)a3;
- (void)_configureTwoFingerPanGestureRecognizer:(id)a3;
- (void)_configureTwoFingerTapGestureRecognizer:(id)a3;
- (void)_didEndIndirectSelectionGesture:(id)a3;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_granularityExpandingGestureWithTimeInterval:(double)a3 timeGranularity:(double)a4 isMidPan:(BOOL)a5;
- (void)_logTapCounts:(id)a3;
- (void)_longForcePressDetected:(id)a3;
- (void)_prepareForGesture;
- (void)_startTouchPadTimerWithCompletion:(id)a3;
- (void)_tidyUpGesture;
- (void)_willBeginIndirectSelectionGesture:(id)a3;
- (void)beginCursorManipulationFromRect:(CGRect)a3;
- (void)beginIndirectBlockPanWithTranslation:(CGPoint)a3 executionContext:(id)a4;
- (void)beginLongPressWithTranslation:(CGPoint)a3 touchCount:(unint64_t)a4 executionContext:(id)a5;
- (void)beginTwoFingerCursorPanWithTranslation:(CGPoint)a3 executionContext:(id)a4;
- (void)beginTwoFingerPanWithTranslation:(CGPoint)a3 isShiftKeyBeingHeld:(BOOL)a4 executionContext:(id)a5;
- (void)clearKeyboardTouchesForGesture:(id)a3;
- (void)dealloc;
- (void)detach;
- (void)disableEnclosingScrollViewScrolling;
- (void)endIndirectBlockPanWithExecutionContext:(id)a3;
- (void)endTwoFingerPanWithExecutionContext:(id)a3;
- (void)finishLongPressWithExecutionContext:(id)a3;
- (void)forwardIndirectGestureWithType:(int64_t)a3 state:(int64_t)a4 translation:(CGPoint)a5 flickDirection:(unint64_t)a6 touchCount:(unint64_t)a7;
- (void)gestureRecognizerShouldBeginResponse:(id)a3;
- (void)handleRemoteIndirectGestureWithState:(id)a3;
- (void)handleTwoFingerFlickInDirection:(int64_t)a3 executionContext:(id)a4;
- (void)hideInsideRecogniser:(id)a3;
- (void)hideRecogniser:(id)a3 forKey:(id)a4;
- (void)indirectBlockPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4;
- (void)indirectCursorPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 withFlickDirection:(unint64_t)a5;
- (void)indirectPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 withFlickDirection:(unint64_t)a5 isShiftKeyBeingHeld:(BOOL)a6;
- (void)longPressGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 touchCount:(unint64_t)a5;
- (void)oneFingerForcePan:(id)a3;
- (void)oneFingerForcePress:(id)a3;
- (void)panningGesture:(id)a3;
- (void)panningGestureAddedTouch:(id)a3;
- (void)registerOwner:(id)a3;
- (void)removeTemporaryGesture;
- (void)twoFingerTap:(id)a3;
- (void)updateIndirectBlockPanWithTranslation:(CGPoint)a3 executionContext:(id)a4;
- (void)updateLongPressWithTranslation:(CGPoint)a3 executionContext:(id)a4;
- (void)updateTwoFingerPanWithTranslation:(CGPoint)a3 executionContext:(id)a4;
@end

@implementation _UIKeyboardTextSelectionInteraction

- (void)_configureTwoFingerPanGestureRecognizer:(id)a3
{
  id v7 = a3;
  unint64_t v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  if (v4 == 1) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 18;
  }
  _setGestureKeyboardFlag(v7, v5);
  [v7 addTarget:self action:sel_panningGesture_];
  [v7 setDelaysTouchesEnded:0];
  [v7 setMinimumNumberOfTouches:2];
  [v7 setMaximumNumberOfTouches:2];
  [v7 setAllowableMovement:16.0];
  [v7 _setFailsPastHysteresisWithoutMinTouches:1];
  [v7 setAllowedFlickDirections:15];
  [v7 setMaximumFlickDuration:0.16];
  [v7 setMinimumFlickDistance:5.0];
  [v7 setResponsivenessDelay:0.13];
  if (v4 == 1)
  {
    v6 = +[_UITextSelectionSettings sharedInstance];
    [v6 allowableSeparation];
    objc_msgSend(v7, "_setAllowableSeparation:");

    [v7 setMinimumPressDuration:1.0];
    [v7 _setAllowableTouchTimeSeparation:0.06];
    [v7 _setRequiresImmediateMultipleTouches:1];
  }
  else
  {
    [v7 _setAllowableTouchTimeSeparation:0.5];
    [v7 setMinimumPressDuration:1.0];
  }
}

- (void)_configureTwoFingerTapGestureRecognizer:(id)a3
{
  id v5 = a3;
  _setGestureKeyboardFlag(v5, 2);
  [v5 addTarget:self action:sel_twoFingerTap_];
  [v5 setAllowableMovement:60.0];
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    unint64_t v4 = +[_UITextSelectionSettings sharedInstance];
    [v4 allowableSeparation];
    objc_msgSend(v5, "_setAllowableSeparation:");
  }
  [v5 setNumberOfTapsRequired:1];
  [v5 setNumberOfTouchesRequired:2];
  [v5 _setAllowableTouchTimeSeparation:0.06];
  [v5 setMaximumTapDuration:0.13];
}

- (_UIKeyboardTextSelectionInteraction)initWithView:(id)a3 owner:(id)a4 forTypes:(int64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  v10 = [(UITextInteraction *)&v23 init];
  v11 = v10;
  if (v10)
  {
    [(_UIKeyboardTextSelectionInteraction *)v10 registerOwner:v9];
    if ((v5 & 8) != 0)
    {
      v12 = objc_alloc_init(_UIPanOrFlickGestureRecognizer);
      [(UIGestureRecognizer *)v12 setName:@"com.apple.UIKit.textSpacePress"];
      [(_UIKeyboardTextSelectionInteraction *)v11 _configureLongPressRecognizer:v12];
      [(UITextInteraction *)v11 addGestureRecognizer:v12 withName:@"_UIKeyboardTextSelectionGestureLongPress"];
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
    }
    else
    {
      v12 = 0;
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
    }
    v13 = objc_alloc_init(_UITextSelectionForceGesture);
    [(_UIKeyboardTextSelectionInteraction *)v11 _configureOneFingerForcePressRecognizer:v13];
    if (_isViewKeyboardLayoutPresent(v8))
    {
      uint64_t GestureKeyboardFlag = _getGestureKeyboardFlag(v13);
      _setGestureKeyboardFlag(v13, GestureKeyboardFlag | 0x10);
    }
    [(_UITextSelectionForceGesture *)v13 setShouldFailWithoutForce:[(_UIKeyboardTextSelectionGestureController *)v11->_owner oneFingerForcePressShouldFailWithoutForce]];
    if ([(_UITextSelectionForceGesture *)v13 shouldFailWithoutForce])
    {
      v15 = [(UITextInteraction *)v11 recognizerForName:0x1ED174100];
      v16 = v15;
      if (v15) {
        [v15 requireGestureRecognizerToFail:v13];
      }
    }
    [(UIGestureRecognizer *)v13 setAllowedTouchTypes:&unk_1ED3F09B8];
    [(UIGestureRecognizer *)v13 setCancelsTouchesInView:[(_UIKeyboardTextSelectionGestureController *)v11->_owner oneFingerForcePressShouldCancelTouchesInView]];
    [(UITextInteraction *)v11 addGestureRecognizer:v13 withName:@"_UIKeyboardTextSelectionGestureForcePress"];
    if (_AXSForceTouchEnabled())
    {
      v17 = +[UIDevice currentDevice];
      int v18 = [v17 _supportsForceTouch];

      if (v18) {
        [(UIGestureRecognizer *)v12 requireGestureRecognizerToFail:v13];
      }
    }

LABEL_16:
    if ((v5 & 2) != 0)
    {
      v19 = objc_alloc_init(UITextTapRecognizer);
      [(_UIKeyboardTextSelectionInteraction *)v11 _configureTwoFingerTapGestureRecognizer:v19];
      [(UITextInteraction *)v11 addGestureRecognizer:v19 withName:@"_UIKeyboardTextSelectionGestureTwoFingerTap"];

      if ((v5 & 4) == 0)
      {
LABEL_23:

        goto LABEL_24;
      }
    }
    else if ((v5 & 4) == 0)
    {
      goto LABEL_23;
    }
    v20 = objc_alloc_init(_UIPanOrFlickGestureRecognizer);
    [(UIGestureRecognizer *)v20 setName:@"com.apple.UIKit.textPanOrFlick"];
    [(_UIKeyboardTextSelectionInteraction *)v11 _configureTwoFingerPanGestureRecognizer:v20];
    if (_isViewKeyboardLayoutPresent(v8)) {
      [(UIPanGestureRecognizer *)v20 _setHysteresis:30.0];
    }
    v21 = [(_UIKeyboardTextSelectionInteraction *)v11 owner];
    [v21 enableEnclosingScrollViewNestedPinching];

    [(UITextInteraction *)v11 addGestureRecognizer:v20 withName:@"_UIKeyboardTextSelectionGestureTwoFingerPan"];
    goto LABEL_23;
  }
LABEL_24:

  return v11;
}

- (void)registerOwner:(id)a3
{
  p_owner = &self->_owner;
  objc_storeStrong((id *)&self->_owner, a3);
  id v6 = a3;
  id v7 = *p_owner;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53___UIKeyboardTextSelectionInteraction_registerOwner___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v10[4] = self;
  id v8 = [(_UIKeyboardTextSelectionGestureController *)v7 addDeallocationHandler:v10];
  id deallocToken = self->_deallocToken;
  self->_id deallocToken = v8;
}

- (id)owner
{
  return self->_owner;
}

- (void)dealloc
{
  [(_UIKeyboardTextSelectionInteraction *)self detach];
  [(_UIKeyboardTextSelectionInteraction *)self removeTemporaryGesture];
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  [(_UIKeyboardTextSelectionInteraction *)&v3 dealloc];
}

- (void)removeTemporaryGesture
{
  addedTouchRecognizer = self->_addedTouchRecognizer;
  if (addedTouchRecognizer)
  {
    unint64_t v4 = [(UIGestureRecognizer *)addedTouchRecognizer view];
    [v4 removeGestureRecognizer:self->_addedTouchRecognizer];

    char v5 = self->_addedTouchRecognizer;
    self->_addedTouchRecognizer = 0;
  }
  activePress = self->_activePress;
  if (activePress)
  {
    id v7 = [(UIGestureRecognizer *)activePress view];
    [v7 removeGestureRecognizer:self->_activePress];

    id v8 = self->_activePress;
    self->_activePress = 0;
  }
  [(_UIKeyboardTextSelectionInteraction *)self _cancelTouchPadTimer];
}

- (void)detach
{
  [(_UIKeyboardTextSelectionGestureController *)self->_owner removeDeallocationHandler:self->_deallocToken];
  owner = self->_owner;
  self->_owner = 0;

  [(_UIKeyboardTextSelectionInteraction *)self _clearHiding];
}

- (void)_clearHiding
{
  [(NSMapTable *)self->_weakMap removeAllObjects];
  weakMap = self->_weakMap;
  self->_weakMap = 0;
}

- (void)_cancelTouchPadTimer
{
  [(NSTimer *)self->_touchPadTimer invalidate];
  touchPadTimer = self->_touchPadTimer;
  self->_touchPadTimer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousRemoteGestureState, 0);
  objc_storeStrong((id *)&self->_activePress, 0);
  objc_storeStrong(&self->_touchPadTimerCompletion, 0);
  objc_storeStrong((id *)&self->_touchPadTimer, 0);
  objc_storeStrong((id *)&self->_addedTouchRecognizer, 0);
  objc_storeStrong(&self->_deallocToken, 0);
  objc_storeStrong((id *)&self->_weakMap, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

- (void)hideRecogniser:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  weakMap = self->_weakMap;
  if (!weakMap)
  {
    v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    v11 = self->_weakMap;
    self->_weakMap = v10;

    weakMap = self->_weakMap;
  }
  [(NSMapTable *)weakMap setObject:v7 forKey:v8];
  v13.receiver = self;
  v13.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  v12 = [(UITextInteraction *)&v13 gestureMap];
  [v12 removeObjectForKey:v8];

  objc_setAssociatedObject(v7, a2, self, (void *)0x301);
}

- (void)hideInsideRecogniser:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  [(UITextInteraction *)&v17 gestureMap];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      id v11 = [v5 objectForKey:v10];

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v10;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Didn't find gesture %@ in cluster %@", v4, self, (void)v13 format];
  id v12 = 0;
LABEL_12:
  [(_UIKeyboardTextSelectionInteraction *)self hideRecogniser:v4 forKey:v12];
}

- (id)gestures
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  objc_super v3 = [(UITextInteraction *)&v8 gestureMap];
  id v4 = v3;
  if (self->_weakMap)
  {
    id v5 = (id)[v3 mutableCopy];
    uint64_t v6 = [(NSMapTable *)self->_weakMap dictionaryRepresentation];
    [v5 addEntriesFromDictionary:v6];
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

+ (void)attachToExistingRecogniser:(id)a3 owner:(id)a4 forType:(int64_t)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init((Class)a1);
  v10 = v9;
  if (v9)
  {
    [v9 registerOwner:v8];
    switch(a5)
    {
      case 4:
        [v10 _configureTwoFingerPanGestureRecognizer:v11];
        break;
      case 2:
        [v10 _configureTwoFingerTapGestureRecognizer:v11];
        break;
      case 1:
        [v10 _configureOneFingerForcePressRecognizer:v11];
        break;
      default:
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unknown type %li", a5);
        break;
    }
    [v10 addGestureRecognizer:v11 withName:@"owner"];
    [v10 hideInsideRecogniser:v11];
  }
}

- (void)_configureOneFingerForcePressRecognizer:(id)a3
{
  id v5 = a3;
  _setGestureKeyboardFlag(v5, 1);
  id v4 = objc_alloc_init(_UILinearForceLevelClassifier);
  [v5 _setForceLevelClassifier:v4];

  [v5 setRequiredPreviewForceState:2];
  [v5 addTarget:self action:sel_oneFingerForcePan_];
  -[UIGestureRecognizer _addForceTarget:action:]((uint64_t)v5, self, sel_oneFingerForcePress_);
  [(_UIKeyboardTextSelectionGestureController *)self->_owner oneFingerForcePressMinimumDuration];
  objc_msgSend(v5, "setMinimumPressDuration:");
  [(_UIKeyboardTextSelectionGestureController *)self->_owner oneFingerForcePressAllowableMovement];
  objc_msgSend(v5, "setAllowableMovement:");
}

- (void)_configureLongPressAddedTouchRecognizer:(id)a3
{
  id v4 = a3;
  _setGestureKeyboardFlag(v4, 8);
  [v4 addTarget:self action:sel_panningGestureAddedTouch_];
}

- (void)_configureLongPressRecognizer:(id)a3
{
  id v4 = a3;
  _setGestureKeyboardFlag(v4, 100);
  [v4 addTarget:self action:sel_panningGesture_];
  [v4 setLongPressOnly:1];
  [v4 setDelaysTouchesEnded:0];
  [v4 setMinimumNumberOfTouches:1];
  [v4 setMaximumNumberOfTouches:1];
  [v4 setAllowableMovement:16.0];
  [v4 _setFailsPastHysteresisWithoutMinTouches:1];
  [v4 setAllowedFlickDirections:0];
  [v4 setMinimumPressDuration:0.375];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIKeyboardTextSelectionInteraction;
  unsigned int v5 = [(UITextInteraction *)&v15 gestureRecognizerShouldBegin:v4];
  uint64_t v6 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  uint64_t v7 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  id v8 = [v7 delegate];

  if (v5)
  {
    id v9 = [v4 view];
    BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v9);

    if (isViewKeyboardLayoutPresent)
    {
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v8 transitionInProgress])
      {
LABEL_15:
        LOBYTE(v5) = 0;
        goto LABEL_17;
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      id v11 = [v4 view];
      [v4 locationInView:v11];
      int v12 = objc_msgSend(v8, "shouldAllowSelectionGestures:atPoint:toBegin:", 1, 1);

      if (!v12) {
        goto LABEL_15;
      }
    }
    if ((_getGestureKeyboardFlag(v4) & 0x40) != 0 && !IsGestureWithinSpecialRegion(v4)
      || (_getGestureKeyboardFlag(v4) & 8) != 0 && ![v6 isPanning])
    {
      goto LABEL_15;
    }
    if (_getGestureKeyboardFlag(v4) & 2) != 0 && (objc_opt_respondsToSelector())
    {
      long long v13 = [v4 view];
      LOBYTE(v5) = [v8 shouldAllowTwoFingerSelectionGestureOnView:v13];
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
LABEL_17:

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  id v9 = [v8 delegate];

  v10 = [v6 view];
  BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v10);

  if (!isViewKeyboardLayoutPresent) {
    goto LABEL_26;
  }
  uint64_t v12 = [v6 requiredPreviewForceState];
  char v13 = objc_opt_respondsToSelector();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v12 && (v13 & 1) != 0 && (isKindOfClass & 1) != 0)
  {
    if (v7)
    {
      [v7 timestamp];
      double v16 = v15;
    }
    else
    {
      objc_super v17 = [MEMORY[0x1E4F28F80] processInfo];
      [v17 systemUptime];
      double v16 = v18;
    }
    [v9 timestampOfLastTouchesEnded];
    if (v19 + 0.5 >= v16) {
      goto LABEL_22;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_26;
  }
  BOOL v20 = v12 != 0;
  id v21 = v7 ? v7 : v6;
  v22 = [v6 view];
  [v21 locationInView:v22];
  double v24 = v23;
  double v26 = v25;

  if (!objc_msgSend(v9, "shouldAllowSelectionGestures:atPoint:toBegin:", v20, v7 == 0, v24, v26))
  {
LABEL_22:
    BOOL v34 = 0;
  }
  else
  {
    if ((_getGestureKeyboardFlag(v6) & 0x10) == 0) {
      goto LABEL_21;
    }
LABEL_26:
    id v27 = v7 ? v7 : v6;
    v28 = [v6 view];
    [v27 locationInView:v28];
    CGFloat v30 = v29;
    CGFloat v32 = v31;

    v33 = [v6 view];
    LODWORD(v28) = IsTouchPointWithinSpecialRegion(v33, v30, v32);

    if (!v28) {
      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v34 = 1;
      [v6 setShouldFailWithoutForce:1];
    }
    else
    {
LABEL_21:
      BOOL v34 = 1;
    }
  }

  return v34;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  id v9 = [v8 delegate];
  v10 = [v9 textSelectionController];

  if (v10)
  {
    char GestureKeyboardFlag = _getGestureKeyboardFlag(v6);
    if (GestureKeyboardFlag & 2 | _getGestureKeyboardFlag(v6) & 1)
    {
      long long v14 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      double v15 = [v14 textInputView];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v16 = [v15 _scroller];
        objc_super v17 = v16;
        if (v16)
        {
          id v18 = [v16 panGestureRecognizer];
          BOOL v12 = v18 == v7;
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    char v19 = _getGestureKeyboardFlag(v6);
    BOOL v13 = ((_getGestureKeyboardFlag(v7) ^ ~v19) & 0xC) == 0 || v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)gestureRecognizerShouldBeginResponse:(id)a3
{
  id v4 = a3;
  if (-[_UIKeyboardTextSelectionInteraction gestureRecognizerShouldBegin:](self, "gestureRecognizerShouldBegin:")) {
    [(_UIKeyboardTextSelectionInteraction *)self panningGesture:v4];
  }
}

- (double)additionalPressDurationForTypingCadence:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ((_getGestureKeyboardFlag(v4) & 4) != 0)
  {
    id v6 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    id v7 = [v6 delegate];

    if (objc_opt_respondsToSelector())
    {
      id v8 = [MEMORY[0x1E4F28F80] processInfo];
      [v8 systemUptime];
      double v10 = v9;

      [v7 timestampOfLastTouchesEnded];
      double v12 = v11;
      [v4 minimumPressDuration];
      if (v12 + v13 >= v10) {
        double v5 = 0.4;
      }
      else {
        double v5 = 0.0;
      }
    }
  }
  return v5;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v11 = a3;
  id v4 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 isPanning]
    && (_getGestureKeyboardFlag(v11) & 2) != 0
    && ([v4 isSpacePan] & 1) == 0)
  {
    double v5 = [v4 selectionController];
    id v6 = v11;
    [(_UIKeyboardTextSelectionInteraction *)self _didEndIndirectSelectionGesture:v6];
    if ([v4 didFloatCursor]) {
      [v5 endFloatingCursor];
    }
    [v4 setIsLongPressing:0];
    [v4 setIsPanning:0];
    [v4 setIsSpacePan:0];
    [v4 setDidFloatCursor:0];
    id v7 = [v4 activeGestures];
    [v7 removeObject:v6];

    [v5 resetCursorPosition];
  }
  if ([v4 panGestureState] && (_getGestureKeyboardFlag(v11) & 1) != 0)
  {
    id v8 = [v4 selectionController];
    id v9 = v11;
    if ([v4 panGestureState] >= 1) {
      [(_UIKeyboardTextSelectionInteraction *)self oneFingerForcePan:v9];
    }
    [v4 setPanGestureState:0];
    [v4 setPreviousForcePressCount:0];
    [v4 setDidFloatCursor:0];
    double v10 = [v4 activeGestures];
    [v10 removeObject:v9];

    [v8 resetCursorPosition];
  }
}

- (id)selectionController
{
  v2 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  objc_super v3 = [v2 selectionController];

  return v3;
}

- (void)_didEndIndirectSelectionGesture:(id)a3
{
  id v4 = [a3 view];
  double v5 = _getViewKeyboardLayout(v4);
  [v5 didEndIndirectSelectionGesture];

  [(_UIKeyboardTextSelectionInteraction *)self removeTemporaryGesture];
}

- (CGPoint)acceleratedTranslation:(CGPoint)a3 velocity:(CGPoint)a4 isActive:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  id v8 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  id v9 = +[_UICubicPolyTangent keyboardTrackpadCurve];
  [v8 lastPanTranslation];
  double v11 = x - v10;
  [v8 lastPanTranslation];
  double v13 = y - v12;
  double v14 = 0.0;
  if (v5)
  {
    [v9 piecewiseCubicAcceleratedSpeed:sqrt(v11 * v11 + v13 * v13)];
    double v14 = v15;
  }
  [v8 accumulatedAcceleration];
  double v17 = v11 * v14 + v16;
  double v19 = v13 * v14 + v18;
  objc_msgSend(v8, "setAccumulatedAcceleration:", v17, v19);

  double v20 = x + v17;
  double v21 = y + v19;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (BOOL)forceTouchGestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  id v6 = [v5 delegate];

  if (![v4 requiredPreviewForceState]) {
    goto LABEL_7;
  }
  id v7 = [v4 view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = [MEMORY[0x1E4F28F80] processInfo];
    [v9 systemUptime];
    double v11 = v10;

    [v6 timestampOfLastTouchesEnded];
    double v13 = v12 + 0.4;
    [v4 minimumPressDuration];
    if (v13 + v14 >= v11)
    {
      char v16 = 0;
      goto LABEL_8;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    double v15 = [v4 view];
    [v4 locationInView:v15];
    char v16 = objc_msgSend(v6, "shouldAllowSelectionGestures:atPoint:toBegin:", 1, 1);
  }
  else
  {
LABEL_7:
    char v16 = 1;
  }
LABEL_8:

  return v16;
}

- (CGPoint)boundedTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!+[UIKeyboard isInputSystemUI])
  {
    id v6 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    id v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v6 cursorLocationBase];
    objc_msgSend(v7, "boundedDeltaForTranslation:cursorLocationBase:", x, y, v8, v9);
    double v11 = v10;
    double v13 = v12;

    [v6 accumulatedBounding];
    if (v14 <= 0.0)
    {
      double v16 = v11;
      if (v11 < v14 || (double v16 = v14, v11 <= 0.0))
      {
LABEL_9:
        if (v15 <= 0.0)
        {
          double v17 = v13;
          if (v13 < v15) {
            goto LABEL_16;
          }
          double v17 = v15;
          if (v13 <= 0.0) {
            goto LABEL_16;
          }
        }
        else
        {
          double v17 = v13;
          if (v13 > v15) {
            goto LABEL_16;
          }
          double v17 = v15;
          if (v13 >= 0.0) {
            goto LABEL_16;
          }
        }
        double v17 = v13 + v15;
LABEL_16:
        objc_msgSend(v6, "setAccumulatedBounding:", v16, v17);
        double x = x + v16;
        double y = y + v17;

        goto LABEL_17;
      }
    }
    else
    {
      double v16 = v11;
      if (v11 > v14) {
        goto LABEL_9;
      }
      double v16 = v14;
      if (v11 >= 0.0) {
        goto LABEL_9;
      }
    }
    double v16 = v11 + v14;
    goto LABEL_9;
  }
LABEL_17:
  double v18 = x;
  double v19 = y;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (void)_willBeginIndirectSelectionGesture:(id)a3
{
  id v10 = a3;
  id v4 = [v10 view];
  BOOL v5 = _getViewKeyboardLayout(v4);

  if (v5)
  {
    id v6 = [(UITextInteraction *)self recognizerForName:@"_UIKeyboardTextSelectionGestureLongPress"];
    if (v6 == v10)
    {
    }
    else
    {
      id v7 = [(UITextInteraction *)self recognizerForName:@"_UIKeyboardTextSelectionGestureForcePress"];

      if (v7 != v10)
      {
LABEL_7:
        [v5 willBeginIndirectSelectionGesture];
        goto LABEL_8;
      }
    }
    double v8 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    double v9 = [v8 feedbackBehaviour];
    [v9 transitionToState:@"preview" ended:1];

    goto LABEL_7;
  }
LABEL_8:
}

- (void)_prepareForGesture
{
  id v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  v2 = [v5 feedbackBehaviour];
  char v3 = [v2 isActive];

  if ((v3 & 1) == 0)
  {
    id v4 = [v5 feedbackBehaviour];
    [v4 activateWithCompletionBlock:0];
  }
}

- (void)_tidyUpGesture
{
  id v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  v2 = [v5 feedbackBehaviour];
  int v3 = [v2 isActive];

  if (v3)
  {
    id v4 = [v5 feedbackBehaviour];
    [v4 deactivate];
  }
}

- (BOOL)isPlacedCarefully
{
  v2 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  int v3 = [v2 weightedPoint];
  char v4 = [v3 isPlacedCarefully];

  return v4;
}

- (void)indirectCursorPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 withFlickDirection:(unint64_t)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  if (qword_1EB25B308 != -1) {
    dispatch_once(&qword_1EB25B308, &__block_literal_global_389);
  }
  id v10 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  double v11 = [v10 delegate];
  double v12 = [v11 taskQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108___UIKeyboardTextSelectionInteraction_indirectCursorPanGestureWithState_withTranslation_withFlickDirection___block_invoke_3;
  v13[3] = &unk_1E52FE658;
  v13[4] = self;
  v13[5] = a3;
  *(CGFloat *)&v13[6] = x;
  *(CGFloat *)&v13[7] = y;
  v13[8] = a5;
  [v12 addTask:v13 breadcrumb:_MergedGlobals_13_1];
}

- (void)indirectBlockPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  if (qword_1EB25B318 != -1) {
    dispatch_once(&qword_1EB25B318, &__block_literal_global_70);
  }
  double v8 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  double v9 = [v8 delegate];
  id v10 = [v9 taskQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88___UIKeyboardTextSelectionInteraction_indirectBlockPanGestureWithState_withTranslation___block_invoke_3;
  v11[3] = &unk_1E52FC8A8;
  v11[4] = self;
  v11[5] = a3;
  *(CGFloat *)&v11[6] = x;
  *(CGFloat *)&v11[7] = y;
  [v10 addTask:v11 breadcrumb:qword_1EB25B310];
}

- (void)beginIndirectBlockPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (v8)
  {
    double v9 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v9 caretRectForCursorPosition];
    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:");

    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    double v11 = v10;
    double v13 = v12;
    double v14 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v14, "beginFloatingCursorAtPoint:", v11, v13);

    double v15 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    double v16 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    uint64_t v17 = [v16 previousRepeatedGranularity];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93___UIKeyboardTextSelectionInteraction_beginIndirectBlockPanWithTranslation_executionContext___block_invoke;
    v19[3] = &unk_1E52E34C8;
    v19[4] = self;
    double v18 = [v7 childWithContinuation:v19];
    objc_msgSend(v15, "selectTextWithGranularity:atPoint:executionContext:", v17, v18, v11, v13);
  }
  else
  {
    [v7 returnExecutionToParent];
  }
}

- (void)updateIndirectBlockPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v15 = a4;
  id v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (!v7)
  {
    [v15 returnExecutionToParent];
    goto LABEL_10;
  }
  -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
  double v9 = v8;
  double v11 = v10;
  double v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  objc_msgSend(v12, "updateFloatingCursorAtPoint:", v9, v11);

  double v13 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  if ([v13 panGestureState] == 5)
  {
    double v14 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v14, "selectTextWithGranularity:atPoint:executionContext:", objc_msgSend(v13, "previousRepeatedGranularity"), v15, v9, v11);
  }
  else
  {
    if ([v13 panGestureState] != 6 && objc_msgSend(v13, "panGestureState")) {
      goto LABEL_9;
    }
    double v14 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v14, "updateSelectionWithExtentPoint:withBoundary:executionContext:", objc_msgSend(v13, "previousRepeatedGranularity"), v15, v9, v11);
  }

LABEL_9:
LABEL_10:
}

- (void)endIndirectBlockPanWithExecutionContext:(id)a3
{
  id v6 = a3;
  char v4 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v4 endFloatingCursor];

  id v5 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v5 endSelection];

  [v6 returnExecutionToParent];
}

- (void)beginTwoFingerCursorPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v27 = a4;
  id v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (v7)
  {
    double v8 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    int v9 = [v8 hasCaretSelection];

    double v10 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    double v11 = v10;
    if (v9) {
      [v10 caretRectForCursorPosition];
    }
    else {
      [v10 caretRectForFirstSelectedPosition];
    }
    double v16 = v12;
    double v17 = v13;
    double v18 = v14;
    double v19 = v15;

    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:", v16, v17, v18, v19);
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    double v21 = v20;
    double v23 = v22;
    double v24 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v24, "beginFloatingCursorAtPoint:", v21, v23);

    double v25 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v25 beginSelection];

    double v26 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v26, "selectPositionAtPoint:executionContext:", v27, v21, v23);
  }
  else
  {
    [v27 returnExecutionToParent];
  }
}

- (void)beginTwoFingerPanWithTranslation:(CGPoint)a3 isShiftKeyBeingHeld:(BOOL)a4 executionContext:(id)a5
{
  BOOL v5 = a4;
  double y = a3.y;
  double x = a3.x;
  id v55 = a5;
  int v9 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  int v10 = [v9 hasCaretSelection];

  if (!v10 || v5)
  {
    double v20 = fabs(x);
    double v21 = fabs(y);
    uint64_t v22 = 2;
    if (x < 0.0) {
      uint64_t v22 = 3;
    }
    uint64_t v23 = 5;
    if (y < 0.0) {
      uint64_t v23 = 4;
    }
    if (v20 >= v21) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v23;
    }
    switch(v24)
    {
      case 2:
        double v25 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        [v25 caretRectForRightmostSelectedPosition];
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        double v33 = v32;

        uint64_t v24 = 3;
        break;
      case 3:
        BOOL v34 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        [v34 caretRectForLeftmostSelectedPosition];
        double v27 = v35;
        double v29 = v36;
        double v31 = v37;
        double v33 = v38;

        uint64_t v24 = 2;
        break;
      case 4:
        v39 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        [v39 caretRectForFirstSelectedPosition];
        double v27 = v40;
        double v29 = v41;
        double v31 = v42;
        double v33 = v43;

        uint64_t v24 = 5;
        break;
      case 5:
        v44 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        [v44 caretRectForLastSelectedPosition];
        double v27 = v45;
        double v29 = v46;
        double v31 = v47;
        double v33 = v48;

        uint64_t v24 = 4;
        break;
      default:
        double v27 = *MEMORY[0x1E4F1DB20];
        double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double v31 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double v33 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        break;
    }
    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:", v27, v29, v31, v33);
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    double v50 = v49;
    double v52 = v51;
    v53 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v53, "beginFloatingCursorAtPoint:", v50, v52);

    v54 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

    if (v54)
    {
      double v19 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      objc_msgSend(v19, "beginSelectionWithBaseAtSelectionBoundaryInDirection:initialExtentPoint:executionContext:", v24, v55, v50, v52);
      goto LABEL_20;
    }
  }
  else
  {
    double v11 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v11 caretRectForCursorPosition];
    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:");

    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    double v13 = v12;
    double v15 = v14;
    double v16 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v16, "beginFloatingCursorAtPoint:", v13, v15);

    double v17 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v17 beginSelection];

    double v18 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

    if (v18)
    {
      double v19 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      objc_msgSend(v19, "selectPositionAtPoint:executionContext:", v55, v13, v15);
LABEL_20:

      goto LABEL_22;
    }
  }
  [v55 returnExecutionToParent];
LABEL_22:
}

- (void)updateTwoFingerPanWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v17 = a4;
  id v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (v7)
  {
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    double v9 = v8;
    double v11 = v10;
    double v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v12, "updateFloatingCursorAtPoint:", v9, v11);

    double v13 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    int v14 = [v13 hasCaretSelection];

    double v15 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    double v16 = v15;
    if (v14) {
      objc_msgSend(v15, "selectPositionAtPoint:executionContext:", v17, v9, v11);
    }
    else {
      objc_msgSend(v15, "updateSelectionWithExtentPoint:executionContext:", v17, v9, v11);
    }
  }
  else
  {
    [v17 returnExecutionToParent];
  }
}

- (void)endTwoFingerPanWithExecutionContext:(id)a3
{
  id v7 = a3;
  char v4 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v4 endFloatingCursor];

  BOOL v5 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v5 endSelection];

  id v6 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  [v6 setDidFloatCursor:0];

  [v7 returnExecutionToParent];
}

- (void)handleTwoFingerFlickInDirection:(int64_t)a3 executionContext:(id)a4
{
  id v6 = a4;
  unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFFELL;
  double v8 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  int v9 = [v8 hasCaretSelection];

  if (v9)
  {
    BOOL v10 = v7 == 2;
    if (v7 == 2) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 3;
    }
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88___UIKeyboardTextSelectionInteraction_handleTwoFingerFlickInDirection_executionContext___block_invoke;
    v16[3] = &unk_1E52FE680;
    v16[4] = self;
    BOOL v20 = v10;
    id v17 = v6;
    uint64_t v18 = v11;
    int64_t v19 = a3;
    +[UIView animateWithDuration:50331648 delay:v16 options:0 animations:0.15 completion:0.0];
  }
  else
  {
    double v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

    if (v12)
    {
      double v13 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      int v14 = v13;
      if (v7 == 2) {
        [v13 updateSelectionWithExtentAtBoundary:4 inDirection:a3 executionContext:v6];
      }
      else {
        [v13 updateImmediateSelectionWithExtentAtBoundary:3 inDirection:a3 executionContext:v6];
      }

      double v15 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      [v15 scrollSelectionToVisible];
    }
    else
    {
      [v6 returnExecutionToParent];
    }
  }
}

- (int64_t)layoutDirectionFromFlickDirection:(unint64_t)a3
{
  int64_t v3 = 3;
  uint64_t v4 = 5;
  if ((a3 & 4) == 0) {
    uint64_t v4 = 2;
  }
  if ((a3 & 2) == 0) {
    int64_t v3 = v4;
  }
  if (a3) {
    return 4;
  }
  else {
    return v3;
  }
}

- (void)beginCursorManipulationFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  if (([v11 didFloatCursor] & 1) == 0)
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    if (CGRectIsNull(v13))
    {
      double v8 = *MEMORY[0x1E4F1DAD8];
      double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else
    {
      double v8 = x + width * 0.5;
      double v9 = y + height * 0.5;
    }
    objc_msgSend(v11, "setCursorLocationBase:", v8, v9);
    [v11 setDidFloatCursor:1];
    BOOL v10 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v10 willBeginFloatingCursor:1];
  }
}

- (CGPoint)cursorLocationForTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  [v5 cursorLocationBase];
  double v7 = v6;
  double v9 = v8;

  if (fabs(x) != INFINITY && fabs(y) != INFINITY)
  {
    double v9 = y + v9;
    double v7 = x + v7;
  }
  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (void)_cancelLongForcePressTimer
{
  id v3 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  v2 = [v3 longForcePressAction];
  [v2 cancel];

  [v3 setLongForcePressAction:0];
}

- (void)clearKeyboardTouchesForGesture:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 view];
  double v6 = _getViewKeyboardLayout(v5);

  if (!v6) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v4 touchesForTap];
LABEL_7:
    double v8 = (void *)v7;
    goto LABEL_8;
  }
  if ((_getGestureKeyboardFlag(v4) & 2) != 0)
  {
    uint64_t v7 = -[UIPanGestureRecognizer _activeTouches]((id *)v4);
    goto LABEL_7;
  }
  double v8 = 0;
LABEL_8:
  if (qword_1EB25B328 != -1) {
    dispatch_once(&qword_1EB25B328, &__block_literal_global_74_1);
  }
  double v9 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  double v10 = [v9 delegate];
  double v11 = [v10 taskQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70___UIKeyboardTextSelectionInteraction_clearKeyboardTouchesForGesture___block_invoke_3;
  v14[3] = &unk_1E52E3628;
  id v15 = v6;
  id v16 = v8;
  uint64_t v12 = qword_1EB25B320;
  id v13 = v8;
  [v11 addTask:v14 breadcrumb:v12];

LABEL_11:
}

- (void)_granularityExpandingGestureWithTimeInterval:(double)a3 timeGranularity:(double)a4 isMidPan:(BOOL)a5
{
  double v9 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  if (qword_1EB25B338 != -1) {
    dispatch_once(&qword_1EB25B338, &__block_literal_global_78_0);
  }
  double v10 = [v9 delegate];
  double v11 = [v10 taskQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109___UIKeyboardTextSelectionInteraction__granularityExpandingGestureWithTimeInterval_timeGranularity_isMidPan___block_invoke_3;
  v14[3] = &unk_1E52FE6A8;
  double v16 = a3;
  double v17 = a4;
  BOOL v18 = a5;
  void v14[4] = self;
  id v15 = v9;
  uint64_t v12 = qword_1EB25B330;
  id v13 = v9;
  [v11 addTask:v14 breadcrumb:v12];
}

- (void)disableEnclosingScrollViewScrolling
{
  id v3 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  id v4 = [v3 delegate];
  BOOL v5 = [v4 textSelectionController];

  if (v5)
  {
    double v6 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    uint64_t v7 = [v6 textInputView];
    id v10 = [v7 _scroller];

    double v8 = v10;
    if (v10)
    {
      double v9 = [v10 panGestureRecognizer];
      if ([v9 isEnabled])
      {
        [v9 setEnabled:0];
        [v9 setEnabled:1];
      }

      double v8 = v10;
    }
  }
}

- (void)longPressGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 touchCount:(unint64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  if (!+[UIKeyboard isInputSystemUI]) {
    goto LABEL_3;
  }
  id v10 = +[UIKeyboardImpl activeInstance];
  double v11 = [v10 inputDelegateManager];
  uint64_t v12 = [v11 forwardingInputDelegate];

  if (!v12)
  {
    -[_UIKeyboardTextSelectionInteraction forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:](self, "forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:", 8, a3, 0, a5, x, y);
  }
  else
  {
LABEL_3:
    if (qword_1EB25B348 != -1) {
      dispatch_once(&qword_1EB25B348, &__block_literal_global_84_0);
    }
    id v13 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    int v14 = [v13 delegate];
    id v15 = [v14 taskQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92___UIKeyboardTextSelectionInteraction_longPressGestureWithState_withTranslation_touchCount___block_invoke_3;
    v16[3] = &unk_1E52FE658;
    v16[4] = self;
    void v16[5] = a3;
    *(double *)&v16[6] = x;
    *(double *)&v16[7] = y;
    v16[8] = a5;
    [v15 addTask:v16 breadcrumb:qword_1EB25B340];
  }
}

- (void)beginLongPressWithTranslation:(CGPoint)a3 touchCount:(unint64_t)a4 executionContext:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v24 = a5;
  double v9 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (v9)
  {
    double v10 = fabs(x);
    double v11 = fabs(y);
    uint64_t v12 = 2;
    if (x < 0.0) {
      uint64_t v12 = 3;
    }
    uint64_t v13 = 5;
    if (y < 0.0) {
      uint64_t v13 = 4;
    }
    if (v10 >= v11) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = v13;
    }
    if ((unint64_t)(v14 - 2) <= 3) {
      uint64_t v14 = qword_186B9AE38[v14 - 2];
    }
    id v15 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    [v15 caretRectForCursorPosition];
    -[_UIKeyboardTextSelectionInteraction beginCursorManipulationFromRect:](self, "beginCursorManipulationFromRect:");

    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    double v17 = v16;
    double v19 = v18;
    BOOL v20 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v20, "beginFloatingCursorAtPoint:", v17, v19);

    double v21 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    uint64_t v22 = v21;
    if (a4 == 1)
    {
      [v21 beginSelection];

      uint64_t v23 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      objc_msgSend(v23, "updateSelectionWithExtentPoint:executionContext:", v24, v17, v19);
    }
    else
    {
      objc_msgSend(v21, "beginSelectionWithBaseAtSelectionBoundaryInDirection:initialExtentPoint:executionContext:", v14, v24, v17, v19);
    }
  }
  else
  {
    [v24 returnExecutionToParent];
  }
}

- (void)updateLongPressWithTranslation:(CGPoint)a3 executionContext:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v14 = a4;
  uint64_t v7 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];

  if (v7)
  {
    -[_UIKeyboardTextSelectionInteraction cursorLocationForTranslation:](self, "cursorLocationForTranslation:", x, y);
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v12, "updateFloatingCursorAtPoint:", v9, v11);

    uint64_t v13 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    objc_msgSend(v13, "updateSelectionWithExtentPoint:executionContext:", v14, v9, v11);
  }
  else
  {
    [v14 returnExecutionToParent];
  }
}

- (void)finishLongPressWithExecutionContext:(id)a3
{
  id v6 = a3;
  id v4 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v4 endFloatingCursor];

  BOOL v5 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v5 endSelection];

  [v6 returnExecutionToParent];
}

- (void)forwardIndirectGestureWithType:(int64_t)a3 state:(int64_t)a4 translation:(CGPoint)a5 flickDirection:(unint64_t)a6 touchCount:(unint64_t)a7
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v13 = +[UIKeyboardImpl activeInstance];
  id v14 = [v13 inputDelegateManager];
  id v18 = [v14 inputSystemSourceSession];

  if (v18)
  {
    id v15 = [v18 textOperations];
    double v16 = objc_alloc_init(_UIKeyboardIndirectTextSelectionGestureState);
    [(_UIKeyboardIndirectTextSelectionGestureState *)v16 setType:a3];
    [(_UIKeyboardIndirectTextSelectionGestureState *)v16 setState:a4];
    -[_UIKeyboardIndirectTextSelectionGestureState setTranslation:](v16, "setTranslation:", x, y);
    [(_UIKeyboardIndirectTextSelectionGestureState *)v16 setFlickDirection:a6];
    [(_UIKeyboardIndirectTextSelectionGestureState *)v16 setTouchCount:a7];
    double v17 = +[UIKeyboardImpl activeInstance];
    -[_UIKeyboardIndirectTextSelectionGestureState setIsShiftKeyBeingHeld:](v16, "setIsShiftKeyBeingHeld:", [v17 isShiftKeyBeingHeld]);

    [v15 setCustomInfoType:0x1ED14BAE0];
    [v15 setCustomInfo:v16];
    [v18 flushOperations];
  }
}

- (void)handleRemoteIndirectGestureWithState:(id)a3
{
  id v4 = (_UIKeyboardIndirectTextSelectionGestureState *)a3;
  if ([(_UIKeyboardIndirectTextSelectionGestureState *)v4 type] == 2)
  {
    [(_UIKeyboardTextSelectionInteraction *)self twoFingerTap:0];
  }
  else
  {
    [(_UIKeyboardIndirectTextSelectionGestureState *)v4 translation];
    -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:");
    double v6 = v5;
    double v8 = v7;
    if ([(_UIKeyboardIndirectTextSelectionGestureState *)v4 type] == 4)
    {
      if ([(_UIKeyboardIndirectTextSelectionGestureState *)v4 state] == 1)
      {
        double v9 = *MEMORY[0x1E4F1DAD8];
        double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double v11 = [(_UIKeyboardTextSelectionInteraction *)self owner];
        objc_msgSend(v11, "setAccumulatedBounding:", v9, v10);

        -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 1, 2, v9, v10);
      }
      -[_UIKeyboardTextSelectionInteraction indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:](self, "indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:", [(_UIKeyboardIndirectTextSelectionGestureState *)v4 state], [(_UIKeyboardIndirectTextSelectionGestureState *)v4 flickDirection], [(_UIKeyboardIndirectTextSelectionGestureState *)v4 isShiftKeyBeingHeld], v6, v8);
    }
    else if ([(_UIKeyboardIndirectTextSelectionGestureState *)v4 type] == 8)
    {
      if ([(_UIKeyboardIndirectTextSelectionGestureState *)self->_previousRemoteGestureState type] == 4
        && [(_UIKeyboardIndirectTextSelectionGestureState *)self->_previousRemoteGestureState state] == 2
        && [(_UIKeyboardIndirectTextSelectionGestureState *)v4 state] == 2)
      {
        uint64_t v12 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        [v12 restartSelection];
      }
      -[_UIKeyboardTextSelectionInteraction longPressGestureWithState:withTranslation:touchCount:](self, "longPressGestureWithState:withTranslation:touchCount:", [(_UIKeyboardIndirectTextSelectionGestureState *)v4 state], [(_UIKeyboardIndirectTextSelectionGestureState *)v4 touchCount], v6, v8);
    }
    else if (os_variant_has_internal_diagnostics())
    {
      double v17 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Unknown gesture type", buf, 2u);
      }
    }
    else
    {
      uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteIndirectGestureWithState____s_category)
                         + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Unknown gesture type", v18, 2u);
      }
    }
    if ([(_UIKeyboardIndirectTextSelectionGestureState *)v4 state] >= 3)
    {
      id v14 = [(_UIKeyboardTextSelectionInteraction *)self owner];
      [v14 setDidFloatCursor:0];

      id v15 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      [v15 resetCursorPosition];
    }
  }
  previousRemoteGestureState = self->_previousRemoteGestureState;
  self->_previousRemoteGestureState = v4;
}

- (void)indirectPanGestureWithState:(int64_t)a3 withTranslation:(CGPoint)a4 withFlickDirection:(unint64_t)a5 isShiftKeyBeingHeld:(BOOL)a6
{
  double y = a4.y;
  double x = a4.x;
  if (!+[UIKeyboard isInputSystemUI]) {
    goto LABEL_3;
  }
  uint64_t v12 = +[UIKeyboardImpl activeInstance];
  uint64_t v13 = [v12 inputDelegateManager];
  id v14 = [v13 forwardingInputDelegate];

  if (!v14)
  {
    -[_UIKeyboardTextSelectionInteraction forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:](self, "forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:", 4, a3, a5, 0, x, y);
  }
  else
  {
LABEL_3:
    if (qword_1EB25B358 != -1) {
      dispatch_once(&qword_1EB25B358, &__block_literal_global_95);
    }
    id v15 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    double v16 = [v15 delegate];
    double v17 = [v16 taskQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __122___UIKeyboardTextSelectionInteraction_indirectPanGestureWithState_withTranslation_withFlickDirection_isShiftKeyBeingHeld___block_invoke_3;
    v18[3] = &unk_1E52FE6F8;
    v18[4] = self;
    v18[5] = a3;
    *(double *)&v18[6] = x;
    *(double *)&v18[7] = y;
    BOOL v19 = a6;
    v18[8] = a5;
    [v17 addTask:v18 breadcrumb:qword_1EB25B350];
  }
}

- (void)_beginLongForcePressTimerForGesture:(id)a3
{
  id v4 = a3;
  id v8 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  double v5 = [v8 longForcePressAction];

  if (v5)
  {
    double v6 = [v8 longForcePressAction];
    [v6 cancel];
  }
  double v7 = [[UIDelayedAction alloc] initWithTarget:self action:sel__longForcePressDetected_ userInfo:v4 delay:0.2];

  [v8 setLongForcePressAction:v7];
}

- (void)_longForcePressDetected:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  objc_msgSend(v5, "setPreviousForcePressCount:", objc_msgSend(v5, "previousForcePressCount") - 1);
  [(_UIKeyboardTextSelectionInteraction *)self _cancelLongForcePressTimer];
  [(_UIKeyboardTextSelectionInteraction *)self oneFingerForcePress:v4];
}

- (void)_logTapCounts:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForKey:@"tapLogValue"];
  uint64_t v6 = [v5 intValue];

  double v7 = [v4 valueForKey:@"isOnKeyboard"];

  +[_UIKeyboardUsageTracking keyboardGestureTwoFingerTap:withTapCount:](_UIKeyboardUsageTracking, "keyboardGestureTwoFingerTap:withTapCount:", [v7 BOOLValue], v6);
  id v9 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  id v8 = [v9 tapLogTimer];
  [v8 cancel];

  [v9 setTapLogTimer:0];
}

- (void)oneFingerForcePan:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  uint64_t v6 = [v5 textInputView];
  [v4 _translationInView:v6];
  long double v8 = v7;
  long double v10 = v9;

  double v11 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  uint64_t v12 = [v11 longForcePressAction];

  if (v12)
  {
    double v13 = hypot(v8, v10);
    id v14 = +[_UITextSelectionSettings sharedInstance];
    [v14 allowableForceMovement];
    double v16 = v15;

    if (v13 > v16) {
      [(_UIKeyboardTextSelectionInteraction *)self _cancelLongForcePressTimer];
    }
  }
  if ([v4 state] == 1)
  {
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v11, "setAccumulatedAcceleration:", *MEMORY[0x1E4F1DAD8], v18);
    objc_msgSend(v11, "setAccumulatedBounding:", v17, v18);
    objc_msgSend(v11, "setLastPanTranslation:", (double)v8, (double)v10);
    BOOL v19 = [v11 weightedPoint];
    [v19 clearHistory];

    BOOL v20 = [v11 weightedPoint];
    objc_msgSend(v20, "addPoint:", (double)v8, (double)v10);

    double v21 = [v4 view];
    +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePan:_isViewKeyboardLayoutPresent(v21)];

    uint64_t v22 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke;
    v59[3] = &unk_1E52E1988;
    v59[4] = self;
    long double v62 = v8;
    long double v63 = v10;
    id v60 = v11;
    id v61 = v4;
    [v22 logBlock:v59 domain:@"com.apple.keyboard.UIKit"];

    [(_UIKeyboardTextSelectionInteraction *)self _prepareForGesture];
  }
  if ([v4 state] >= 2)
  {
    uint64_t v23 = +[_UITextSelectionSettings sharedInstance];
    id v24 = [v23 shouldUseAcceleration];
    int v25 = [v24 BOOLValue];

    if (v25)
    {
      double v26 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      double v27 = [v26 textInputView];
      [v4 velocityInView:v27];
      double v29 = v28;
      double v31 = v30;

      if ([v11 panGestureState])
      {
        id v32 = v4;
        BOOL v33 = [v32 state] != 3 && objc_msgSend(v32, "state") != 4 && objc_msgSend(v32, "state") != 5;
      }
      else
      {
        BOOL v33 = 0;
      }
      -[_UIKeyboardTextSelectionInteraction acceleratedTranslation:velocity:isActive:](self, "acceleratedTranslation:velocity:isActive:", v33, (double)v8, (double)v10, v29, v31);
      double v35 = v34;
      double v37 = v36;
      objc_msgSend(v11, "setLastPanTranslation:", (double)v8, (double)v10);
      long double v10 = v37;
      long double v8 = v35;
    }
    double v38 = [v11 weightedPoint];
    objc_msgSend(v38, "addPoint:", (double)v8, (double)v10);

    id v39 = v4;
    if ([v39 state] == 3 || objc_msgSend(v39, "state") == 4)
    {
    }
    else
    {
      uint64_t v43 = [v39 state];

      if (v43 != 5)
      {
LABEL_22:
        -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:", (double)v8, (double)v10);
        long double v8 = v44;
        long double v10 = v45;
        goto LABEL_23;
      }
    }
    if ([(_UIKeyboardTextSelectionInteraction *)self isPlacedCarefully])
    {
      double v40 = [v11 weightedPoint];
      [v40 weightedPoint];
      long double v8 = v41;
      long double v10 = v42;
    }
    goto LABEL_22;
  }
LABEL_23:
  if ([v11 panGestureState] == 1)
  {
    id v46 = v4;
    if ([v46 state] == 3 || objc_msgSend(v46, "state") == 4)
    {
    }
    else
    {
      uint64_t v53 = [v46 state];

      if (v53 != 5)
      {
        -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 2, 0, (double)v8, (double)v10);
        goto LABEL_34;
      }
    }
    [v11 setDidFloatCursor:0];
    -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", [v46 state], 0, (double)v8, (double)v10);
    goto LABEL_33;
  }
  if ([v11 panGestureState] == 6)
  {
    id v47 = v4;
    if ([v47 state] == 3 || objc_msgSend(v47, "state") == 4)
    {
    }
    else
    {
      uint64_t v54 = [v47 state];

      if (v54 != 5)
      {
        -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", 2, (double)v8, (double)v10);
        goto LABEL_34;
      }
    }
    [v11 setDidFloatCursor:0];
    -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", [v47 state], (double)v8, (double)v10);
LABEL_33:
    [v11 setPanGestureState:0];
  }
LABEL_34:
  id v48 = v4;
  if ([v48 state] == 3 || objc_msgSend(v48, "state") == 4)
  {
  }
  else
  {
    uint64_t v52 = [v48 state];

    if (v52 != 5) {
      goto LABEL_38;
    }
  }
  [v11 setDidFloatCursor:0];
  [v11 setPreviousForcePressCount:0];
  [v11 setPanGestureState:0];
  [(_UIKeyboardTextSelectionInteraction *)self _didEndIndirectSelectionGesture:v48];
  double v49 = [v11 activeGestures];
  [v49 removeObject:v48];

  double v50 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  [v50 resetCursorPosition];

  [(_UIKeyboardTextSelectionInteraction *)self _tidyUpGesture];
  double v51 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __57___UIKeyboardTextSelectionInteraction_oneFingerForcePan___block_invoke_2;
  v55[3] = &unk_1E52FE720;
  v55[4] = self;
  long double v57 = v8;
  long double v58 = v10;
  id v56 = v48;
  [v51 logBlock:v55 domain:@"com.apple.keyboard.UIKit"];

LABEL_38:
}

- (void)twoFingerTap:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  double Current = CFAbsoluteTimeGetCurrent();
  [v5 twoFingerTapTimestamp];
  double v8 = v7;
  [(_UIKeyboardTextSelectionInteraction *)self clearKeyboardTouchesForGesture:v4];
  if (+[UIKeyboard isInputSystemUI])
  {
    uint64_t v9 = [v4 state];
    -[_UIKeyboardTextSelectionInteraction forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:](self, "forwardIndirectGestureWithType:state:translation:flickDirection:touchCount:", 2, v9, 0, 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  else
  {
    [(_UIKeyboardTextSelectionInteraction *)self _granularityExpandingGestureWithTimeInterval:0 timeGranularity:Current - v8 isMidPan:0.667];
  }
  [v5 setTwoFingerTapTimestamp:Current];
  long double v10 = [v5 delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [v5 delegate];
    [v12 setTwoFingerTapTimestamp:Current];
  }
  double v13 = [v5 tapLogTimer];

  if (!v13)
  {
    int v25 = [v4 view];
    BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v25);

    v40[0] = &unk_1ED3F5790;
    v39[0] = @"tapLogValue";
    v39[1] = @"isOnKeyboard";
    double v27 = [NSNumber numberWithBool:isViewKeyboardLayoutPresent];
    v40[1] = v27;
    double v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    double v15 = (void *)[v28 mutableCopy];

    double v29 = [UIDelayedAction alloc];
    double v30 = [(UIDelayedAction *)v29 initWithTarget:self action:sel__logTapCounts_ userInfo:v15 delay:*MEMORY[0x1E4F1C3A0] mode:0.667];
    [v5 setTapLogTimer:v30];

    double v21 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke;
    v35[3] = &unk_1E52FE748;
    uint64_t v22 = &v36;
    id v36 = v5;
    BOOL v38 = isViewKeyboardLayoutPresent;
    uint64_t v23 = &v37;
    id v37 = v4;
    id v24 = v35;
    goto LABEL_10;
  }
  id v14 = [v5 tapLogTimer];
  double v15 = [v14 userInfo];

  double v16 = [v15 objectForKey:@"tapLogValue"];
  int v17 = [v16 intValue];
  uint64_t v18 = (v17 + 1);

  BOOL v19 = [NSNumber numberWithInt:v18];
  [v15 setValue:v19 forKey:@"tapLogValue"];

  BOOL v20 = [v5 tapLogTimer];
  [v20 touch];

  if (v17 >= 1)
  {
    double v21 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52___UIKeyboardTextSelectionInteraction_twoFingerTap___block_invoke_2;
    v31[3] = &unk_1E52FE770;
    uint64_t v22 = &v32;
    id v32 = v5;
    uint64_t v23 = &v33;
    id v33 = v4;
    int v34 = v18;
    id v24 = v31;
LABEL_10:
    [v21 logBlock:v24 domain:@"com.apple.keyboard.UIKit"];
  }
}

- (void)panningGestureAddedTouch:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 1)
  {
    id v4 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    int v5 = [v4 isPanning];

    if (v5)
    {
      uint64_t v6 = [(_UIKeyboardTextSelectionInteraction *)self owner];
      [v6 setHadAddedTouch:1];
    }
  }
  else if ([v9 state] == 3)
  {
    double v7 = [(_UIKeyboardTextSelectionInteraction *)self owner];
    char v8 = [v7 isPanning];

    if ((v8 & 1) == 0)
    {
      if (self->_touchPadTimerCompletion)
      {
        [(_UIKeyboardTextSelectionInteraction *)self _cancelTouchPadTimer];
        (*((void (**)(void))self->_touchPadTimerCompletion + 2))();
      }
    }
  }
}

- (void)panningGesture:(id)a3
{
  id v4 = a3;
  int v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  uint64_t v6 = [v5 delegate];
  uint64_t v7 = [v4 state];
  if ((_getGestureKeyboardFlag(v4) & 2) == 0) {
    goto LABEL_12;
  }
  if (([v5 suppressTwoFingerPan] & 1) == 0 && v7 <= 1)
  {
    char v8 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    id v9 = [v8 textInputView];
    long double v10 = [v9 _scroller];

    if ([v10 isZooming]) {
      [v5 setSuppressTwoFingerPan:1];
    }
  }
  if (![v5 suppressTwoFingerPan])
  {
LABEL_12:
    [(_UIKeyboardTextSelectionInteraction *)self _cancelTouchPadTimer];
    double Current = CFAbsoluteTimeGetCurrent();
    id v14 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
    double v15 = [v14 textInputView];
    [v4 translationInView:v15];
    double v17 = v16;
    double v19 = v18;

    BOOL v20 = (id *)&OBJC_IVAR____UIEventSessionHoverAction__tapDragState;
    if (([v5 isPanning] & 1) != 0
      || v7 > 1
      || (objc_opt_respondsToSelector() & 1) != 0
      && ([v4 view],
          double v21 = objc_claimAutoreleasedReturnValue(),
          [v4 locationInView:v21],
          int v22 = objc_msgSend(v6, "shouldAllowSelectionGestures:atPoint:toBegin:", 0, 1),
          v21,
          !v22))
    {
      if ([v5 isPanning])
      {
        double v40 = +[_UITextSelectionSettings sharedInstance];
        double v41 = [v40 shouldUseAcceleration];
        int v42 = [v41 BOOLValue];

        if (v42)
        {
          uint64_t v43 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
          double v44 = [v43 textInputView];
          [v4 velocityInView:v44];
          double v46 = v45;
          double v48 = v47;

          id v49 = v4;
          BOOL v50 = [v49 state] == 3 || objc_msgSend(v49, "state") == 4 || objc_msgSend(v49, "state") == 5;

          -[_UIKeyboardTextSelectionInteraction acceleratedTranslation:velocity:isActive:](self, "acceleratedTranslation:velocity:isActive:", !v50, v17, v19, v46, v48);
          double v53 = v52;
          double v55 = v54;
          objc_msgSend(v5, "setLastPanTranslation:", v17, v19);
          double v19 = v55;
          double v17 = v53;
        }
        -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:", v17, v19);
        double v17 = v56;
        double v19 = v57;
        long double v58 = [v5 weightedPoint];
        objc_msgSend(v58, "addPoint:", v17, v19);

        id v59 = v4;
        if ([v59 state] == 3 || objc_msgSend(v59, "state") == 4)
        {
        }
        else
        {
          uint64_t v63 = [v59 state];

          if (v63 != 5) {
            goto LABEL_53;
          }
        }
        if ([(_UIKeyboardTextSelectionInteraction *)self isPlacedCarefully])
        {
          id v60 = [v5 weightedPoint];
          [v60 weightedPoint];
          double v17 = v61;
          double v19 = v62;
        }
      }
      else if (self->_touchPadTimerCompletion)
      {
        [(_UIKeyboardTextSelectionInteraction *)self _clearTouchPadCallback];
      }
    }
    else
    {
      uint64_t v23 = [v5 activeGestures];
      [v23 addObject:v4];

      id v24 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      int v25 = [v24 textInputView];
      double v26 = *MEMORY[0x1E4F1DAD8];
      double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      objc_msgSend(v4, "setTranslation:inView:", v25, *MEMORY[0x1E4F1DAD8], v27);

      objc_msgSend(v5, "setLastPanTranslation:", v26, v27);
      double v28 = -1.0;
      if (v17 < 0.0) {
        double v29 = -1.0;
      }
      else {
        double v29 = v17;
      }
      if (v17 <= 0.0) {
        double v17 = v29;
      }
      else {
        double v17 = 1.0;
      }
      if (v19 >= 0.0) {
        double v28 = v19;
      }
      if (v19 <= 0.0) {
        double v19 = v28;
      }
      else {
        double v19 = 1.0;
      }
      objc_msgSend(v5, "setIsPanning:", 1, 1.0, v28, v29);
      [v5 setIsSpacePan:((unint64_t)_getGestureKeyboardFlag(v4) >> 2) & 1];
      [v5 setSpacePanDistance:0.0];
      [v5 setHadAddedTouch:0];
      [v5 setIsLongPressing:0];
      objc_msgSend(v5, "setLastPanTranslation:", v17, v19);
      objc_msgSend(v5, "setAccumulatedAcceleration:", v26, v27);
      objc_msgSend(v5, "setAccumulatedBounding:", v26, v27);
      [(_UIKeyboardTextSelectionInteraction *)self clearKeyboardTouchesForGesture:v4];
      [(_UIKeyboardTextSelectionInteraction *)self _willBeginIndirectSelectionGesture:v4];
      [(_UIKeyboardTextSelectionInteraction *)self disableEnclosingScrollViewScrolling];
      [(_UIKeyboardTextSelectionInteraction *)self _prepareForGesture];
      double v30 = [v5 weightedPoint];
      [v30 clearHistory];

      double v31 = [v5 weightedPoint];
      objc_msgSend(v31, "addPoint:", v17, v19);

      if ((_getGestureKeyboardFlag(v4) & 4) != 0)
      {
        id v32 = [v4 view];
        BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v32);

        if (isViewKeyboardLayoutPresent && !self->_addedTouchRecognizer)
        {
          int v34 = objc_alloc_init(_UIKeyboardTextSelectionTouchesObservingGestureRecognizer);
          addedTouchRecognizer = self->_addedTouchRecognizer;
          self->_addedTouchRecognizer = &v34->super;

          [(_UIKeyboardTextSelectionInteraction *)self _configureLongPressAddedTouchRecognizer:self->_addedTouchRecognizer];
          id v36 = +[UIKeyboard activeKeyboard];
          [v36 addGestureRecognizer:self->_addedTouchRecognizer];
        }
      }
      if ((_getGestureKeyboardFlag(v4) & 0x20) != 0 && !self->_touchPadTimerCompletion)
      {
        id v37 = +[UIKeyboardImpl activeInstance];
        char v38 = [v37 isShiftKeyBeingHeld];

        if ((v38 & 1) == 0) {
          -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 1, 2, v26, v27);
        }
      }
      id v39 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke;
      v115[3] = &unk_1E52FE720;
      id v116 = v5;
      id v117 = v4;
      double v118 = v17;
      double v119 = v19;
      [v39 logBlock:v115 domain:@"com.apple.keyboard.UIKit"];
    }
LABEL_53:
    if ([v5 isSpacePan])
    {
      double v64 = sqrt(v19 * v19 + v17 * v17);
      [v5 spacePanDistance];
      if (v64 > v65) {
        [v5 setSpacePanDistance:v64];
      }
    }
    if (objc_opt_respondsToSelector()) {
      int v66 = [v6 hasMarkedText];
    }
    else {
      int v66 = 0;
    }
    if (![v5 isPanning]) {
      goto LABEL_67;
    }
    if ((_getGestureKeyboardFlag(v4) & 2) != 0)
    {
      if ([v4 didLongPress])
      {
        int v67 = 1;
        goto LABEL_66;
      }
    }
    else if ((_getGestureKeyboardFlag(v4) & 4) == 0)
    {
      int v67 = 0;
      goto LABEL_66;
    }
    int v67 = [v5 hadAddedTouch];
LABEL_66:
    v68 = +[UIKeyboardImpl activeInstance];
    int v69 = [v68 isShiftKeyBeingHeld];

    if ((((v69 | v67) ^ 1 | v66) & 1) == 0)
    {
      if ([v5 hadAddedTouch])
      {
        v73 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        [v73 restartSelection];
      }
      if (([v5 isLongPressing] & 1) == 0)
      {
        [v5 setIsLongPressing:1];
        v74 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
        [v74 switchToRangedSelection];
      }
      if ((_getGestureKeyboardFlag(v4) & 4) != 0) {
        uint64_t v75 = 1;
      }
      else {
        uint64_t v75 = 2;
      }
      -[_UIKeyboardTextSelectionInteraction longPressGestureWithState:withTranslation:touchCount:](self, "longPressGestureWithState:withTranslation:touchCount:", v7, v75, v17, v19);
      goto LABEL_81;
    }
LABEL_67:
    if (![v5 isPanning]) {
      goto LABEL_81;
    }
    [v5 twoFingerTapTimestamp];
    if (Current - v70 > 0.667)
    {
      v71 = +[_UITextSelectionSettings sharedInstance];
      v72 = [v71 allowExtendingSelections];
      if ([v72 BOOLValue])
      {
      }
      else
      {
        char GestureKeyboardFlag = _getGestureKeyboardFlag(v4);

        if ((GestureKeyboardFlag & 0x10) != 0)
        {
          -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", [v4 state], objc_msgSend(v4, "recognizedFlickDirection"), v17, v19);
LABEL_81:
          id v80 = v4;
          if ([v80 state] == 3 || objc_msgSend(v80, "state") == 4)
          {
          }
          else
          {
            uint64_t v99 = [v80 state];

            if (v99 != 5) {
              goto LABEL_109;
            }
          }
          if ([v5 isPanning])
          {
            v81 = [v80 view];
            BOOL v82 = _isViewKeyboardLayoutPresent(v81);

            v83 = (id *)MEMORY[0x1E4FAEE70];
            if (!v82) {
              v83 = (id *)MEMORY[0x1E4FAEE68];
            }
            id v84 = *v83;
            v85 = [v6 textSelectionController];
            int v86 = [v85 hasRangedSelection];
            v87 = (id *)MEMORY[0x1E4FAEE58];
            if (!v86) {
              v87 = (id *)MEMORY[0x1E4FAEE60];
            }
            id v88 = *v87;

            v89 = TIStatisticsGetKeyForGesture();
            TIStatisticScalarIncrement();

            v90 = [MEMORY[0x1E4FA8AA0] sharedInstance];
            v110[0] = MEMORY[0x1E4F143A8];
            v110[1] = 3221225472;
            v110[2] = __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_2;
            v110[3] = &unk_1E52FE720;
            id v111 = v5;
            id v91 = v80;

            id v112 = v91;
            double v113 = v17;
            double v114 = v19;
            [v90 logBlock:v110 domain:@"com.apple.keyboard.UIKit"];
          }
          [v5 setDidFloatCursor:0];
          [v5 setIsLongPressing:0];
          [v5 setIsPanning:0];
          [v5 setIsSpacePan:0];
          v92 = [v5 activeGestures];
          [v92 removeObject:v80];

          v93 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
          [v93 resetCursorPosition];

          [(_UIKeyboardTextSelectionInteraction *)self _tidyUpGesture];
          touchPadTimerCompletion = self->_touchPadTimerCompletion;
          v95 = touchPadTimerCompletion;
          if (!touchPadTimerCompletion)
          {
            v95 = v107;
            v107[0] = MEMORY[0x1E4F143A8];
            v107[1] = 3221225472;
            v107[2] = __54___UIKeyboardTextSelectionInteraction_panningGesture___block_invoke_3;
            v107[3] = &unk_1E52DCB30;
            v107[4] = self;
            v106 = &v108;
            id v108 = v5;
            BOOL v20 = &v109;
            id v109 = v80;
          }
          v96 = (void (**)(void))_Block_copy(v95);
          if ((_getGestureKeyboardFlag(v80) & 4) != 0)
          {
            v97 = [v80 view];
            [v80 locationInView:v97];
            [v80 velocityInView:v97];
            [v97 bounds];
            if (![(_UIKeyboardTextSelectionInteraction *)self isPlacedCarefully]
              && (self->_touchPadTimerCompletion || ([v5 spacePanDistance], v100 > 16.0))
              || ([v5 spacePanDistance], v98 < 16.0) && IsGestureWithinSpecialRegion(v80))
            {
              if (!self->_activePress)
              {
                v101 = objc_alloc_init(_UIPanOrFlickGestureRecognizer);
                activePress = self->_activePress;
                self->_activePress = v101;

                [(_UIKeyboardTextSelectionInteraction *)self _configureLongPressRecognizer:self->_activePress];
                v103 = self->_activePress;
                uint64_t v104 = _getGestureKeyboardFlag(v103);
                _setGestureKeyboardFlag(v103, v104 & 0xFFFFFFFFFFFFFFBFLL);
                [(UIPanGestureRecognizer *)self->_activePress setDelegate:self];
                [(_UIPanOrFlickGestureRecognizer *)self->_activePress setMinimumPressDuration:0.0];
                v105 = +[UIKeyboard activeKeyboard];
                -[UIView _addGestureRecognizer:atEnd:]((uint64_t)v105, self->_activePress, 0);
              }
              [(_UIKeyboardTextSelectionInteraction *)self _startTouchPadTimerWithCompletion:v96];

              v96 = 0;
            }
          }
          if (v96) {
            v96[2](v96);
          }

          if (!touchPadTimerCompletion)
          {
          }
          goto LABEL_109;
        }
      }
    }
    uint64_t v77 = [v4 state];
    uint64_t v78 = [v4 recognizedFlickDirection];
    v79 = +[UIKeyboardImpl activeInstance];
    -[_UIKeyboardTextSelectionInteraction indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:](self, "indirectPanGestureWithState:withTranslation:withFlickDirection:isShiftKeyBeingHeld:", v77, v78, [v79 isShiftKeyBeingHeld], v17, v19);

    goto LABEL_81;
  }
  id v11 = v4;
  if ([v11 state] == 3 || objc_msgSend(v11, "state") == 4)
  {
  }
  else
  {
    uint64_t v51 = [v11 state];

    if (v51 != 5) {
      goto LABEL_109;
    }
  }
  [v5 setDidFloatCursor:0];
  [v5 setSuppressTwoFingerPan:0];
  uint64_t v12 = [v5 activeGestures];
  [v12 removeObject:v11];

LABEL_109:
}

- (void)_startTouchPadTimerWithCompletion:(id)a3
{
  id v4 = a3;
  [(_UIKeyboardTextSelectionInteraction *)self _cancelTouchPadTimer];
  if (v4)
  {
    int v5 = (void *)[v4 copy];
    id touchPadTimerCompletion = self->_touchPadTimerCompletion;
    self->_id touchPadTimerCompletion = v5;

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73___UIKeyboardTextSelectionInteraction__startTouchPadTimerWithCompletion___block_invoke;
    v9[3] = &unk_1E52EC0A8;
    v9[4] = self;
    uint64_t v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v9 block:0.5];
    touchPadTimer = self->_touchPadTimer;
    self->_touchPadTimer = v7;
  }
}

- (void)_clearTouchPadCallback
{
  id touchPadTimerCompletion = self->_touchPadTimerCompletion;
  self->_id touchPadTimerCompletion = 0;
}

- (void)oneFingerForcePress:(id)a3
{
  id v4 = a3;
  int v5 = [(_UIKeyboardTextSelectionInteraction *)self owner];
  uint64_t v6 = [v4 view];
  if (!v6) {
    goto LABEL_73;
  }
  uint64_t v7 = (void *)v6;
  char v8 = [v5 delegate];
  id v9 = [v8 textSelectionController];

  if (!v9) {
    goto LABEL_73;
  }
  long double v10 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  id v11 = [v10 textInputView];
  [v4 velocityInView:v11];
  long double v13 = v12;
  long double v15 = v14;

  double v16 = hypot(v13, v15);
  int v17 = 1;
  if ([v5 panGestureState] && v16 > 65.0) {
    int v17 = [v4 touchEclipsesVelocity];
  }
  if (!v4)
  {
    [v5 previousForcePressCount];
LABEL_12:
    BOOL v19 = 0;
    if (!v17) {
      goto LABEL_9;
    }
    goto LABEL_13;
  }
  unint64_t v18 = v4[18];
  if (v18 <= (int)[v5 previousForcePressCount]) {
    goto LABEL_12;
  }
  BOOL v19 = v4[18] == 1;
  if (!v17)
  {
LABEL_9:
    [(_UIKeyboardTextSelectionInteraction *)self _cancelLongForcePressTimer];
LABEL_10:
    char v20 = 1;
    goto LABEL_18;
  }
LABEL_13:
  if ([v5 panGestureState] <= 0
    && ![(_UIKeyboardTextSelectionInteraction *)self forceTouchGestureRecognizerShouldBegin:v4])
  {
    if (v19)
    {
      [(_UIKeyboardTextSelectionInteraction *)self _beginLongForcePressTimerForGesture:v4];
      id v37 = [v4 view];
      BOOL isViewKeyboardLayoutPresent = _isViewKeyboardLayoutPresent(v37);
      if (v4) {
        uint64_t v39 = v4[18];
      }
      else {
        uint64_t v39 = 0;
      }
      +[_UIKeyboardUsageTracking keyboardGestureOneFingerForcePress:isViewKeyboardLayoutPresent withPressCount:v39];
    }
    goto LABEL_10;
  }
  if (!v19) {
    [(_UIKeyboardTextSelectionInteraction *)self _cancelLongForcePressTimer];
  }
  char v20 = 0;
LABEL_18:
  double v21 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
  int v22 = [v21 textInputView];
  [v4 _translationInView:v22];
  double v24 = v23;
  double v26 = v25;

  int v27 = [v4 state] == 1 || v19;
  if (v27 == 1)
  {
    double v28 = *MEMORY[0x1E4F1DAD8];
    double v29 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    objc_msgSend(v5, "setAccumulatedAcceleration:", *MEMORY[0x1E4F1DAD8], v29);
    objc_msgSend(v5, "setAccumulatedBounding:", v28, v29);
    objc_msgSend(v5, "setLastPanTranslation:", v24, v26);
    [(_UIKeyboardTextSelectionInteraction *)self _prepareForGesture];
  }
  if ([v4 currentPreviewForceState] < 1) {
    goto LABEL_70;
  }
  unint64_t v30 = v4 ? v4[18] : 0;
  char v31 = v30 <= (int)[v5 previousForcePressCount] ? 1 : v20;
  if (v31) {
    goto LABEL_70;
  }
  if ([v4 state] >= 2)
  {
    id v32 = +[_UITextSelectionSettings sharedInstance];
    id v33 = [v32 shouldUseAcceleration];
    int v34 = [v33 BOOLValue];

    if (v34)
    {
      if ([v5 panGestureState])
      {
        double v35 = v4;
        BOOL v36 = [v35 state] != 3 && objc_msgSend(v35, "state") != 4 && objc_msgSend(v35, "state") != 5;
      }
      else
      {
        BOOL v36 = 0;
      }
      -[_UIKeyboardTextSelectionInteraction acceleratedTranslation:velocity:isActive:](self, "acceleratedTranslation:velocity:isActive:", v36, v24, v26, (double)v13, (double)v15);
      double v41 = v40;
      double v43 = v42;
      objc_msgSend(v5, "setLastPanTranslation:", v24, v26);
      double v26 = v43;
      double v24 = v41;
    }
    double v44 = [v5 weightedPoint];
    objc_msgSend(v44, "addPoint:", v24, v26);

    double v45 = v4;
    if ([v45 state] == 3 || objc_msgSend(v45, "state") == 4)
    {
    }
    else
    {
      uint64_t v49 = [v45 state];

      if (v49 != 5)
      {
LABEL_50:
        -[_UIKeyboardTextSelectionInteraction boundedTranslation:](self, "boundedTranslation:", v24, v26);
        double v24 = v50;
        double v26 = v51;
        goto LABEL_51;
      }
    }
    if ([(_UIKeyboardTextSelectionInteraction *)self isPlacedCarefully])
    {
      double v46 = [v5 weightedPoint];
      [v46 weightedPoint];
      double v24 = v47;
      double v26 = v48;
    }
    goto LABEL_50;
  }
LABEL_51:
  double Current = CFAbsoluteTimeGetCurrent();
  [v5 lastPressTimestamp];
  double v54 = v53;
  double v55 = [v5 delegate];
  if (objc_opt_respondsToSelector())
  {
    double v56 = [v5 delegate];
    char v57 = [v56 hasMarkedText];
  }
  else
  {
    char v57 = 0;
  }

  if ([v5 panGestureState] == 6)
  {
    double v58 = Current - v54;
    if (Current - v54 <= 0.8)
    {
      -[_UIKeyboardTextSelectionInteraction _granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:](self, "_granularityExpandingGestureWithTimeInterval:timeGranularity:isMidPan:", 1, v58);
    }
    else
    {
      objc_msgSend(v5, "setPanGestureState:", 0, v58);
      -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", 3, v24, v26);
    }
  }
  if ([v5 panGestureState])
  {
    if ([v5 panGestureState] == 1) {
      char v59 = v57;
    }
    else {
      char v59 = 1;
    }
    if ((v59 & 1) == 0)
    {
      id v60 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      [v60 endSelection];

      double v61 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      [v61 switchToRangedSelection];

      [v5 setPreviousRepeatedGranularity:1];
      [v5 setPanGestureState:6];
      -[_UIKeyboardTextSelectionInteraction indirectBlockPanGestureWithState:withTranslation:](self, "indirectBlockPanGestureWithState:withTranslation:", 1, v24, v26);
    }
  }
  else
  {
    double v62 = [v5 activeGestures];
    char v63 = [v62 containsObject:v4];

    if ((v63 & 1) == 0)
    {
      double v64 = [v5 activeGestures];
      [v64 addObject:v4];
    }
    if (v19)
    {
      double v65 = [(_UIKeyboardTextSelectionInteraction *)self selectionController];
      int v66 = [v65 textInputView];
      double v24 = *MEMORY[0x1E4F1DAD8];
      double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      objc_msgSend(v4, "_setTranslation:inView:", v66, *MEMORY[0x1E4F1DAD8], v26);

      objc_msgSend(v5, "setLastPanTranslation:", v24, v26);
    }
    [v5 setPanGestureState:1];
    [(_UIKeyboardTextSelectionInteraction *)self clearKeyboardTouchesForGesture:v4];
    [(_UIKeyboardTextSelectionInteraction *)self _willBeginIndirectSelectionGesture:v4];
    -[_UIKeyboardTextSelectionInteraction indirectCursorPanGestureWithState:withTranslation:withFlickDirection:](self, "indirectCursorPanGestureWithState:withTranslation:withFlickDirection:", 1, 0, v24, v26);
  }
  [v5 setLastPressTimestamp:Current];
  int v67 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __59___UIKeyboardTextSelectionInteraction_oneFingerForcePress___block_invoke;
  v69[3] = &unk_1E52E1988;
  v69[4] = self;
  double v72 = v24;
  double v73 = v26;
  id v70 = v5;
  v71 = v4;
  [v67 logBlock:v69 domain:@"com.apple.keyboard.UIKit"];

LABEL_70:
  if (v4) {
    uint64_t v68 = *((unsigned int *)v4 + 36);
  }
  else {
    uint64_t v68 = 0;
  }
  [v5 setPreviousForcePressCount:v68];
LABEL_73:
}

@end