@interface _UIKeyboardTextSelectionGestureController
+ (_UIKeyboardTextSelectionGestureController)sharedInstance;
- (BOOL)_longPressAllowedForView:(id)a3;
- (BOOL)allowOneFingerDeepPress;
- (BOOL)didFloatCursor;
- (BOOL)didSuppressSelectionGrabbers;
- (BOOL)hadAddedTouch;
- (BOOL)isLongPressing;
- (BOOL)isPanning;
- (BOOL)isSpacePan;
- (BOOL)oneFingerForcePressShouldCancelTouchesInView;
- (BOOL)oneFingerForcePressShouldFailWithoutForce;
- (BOOL)shouldAddForceGesture;
- (BOOL)suppressTwoFingerPan;
- (BOOL)wasNestedPinchingDisabled;
- (BOOL)wasScrollingEnabled;
- (CGPoint)accumulatedAcceleration;
- (CGPoint)accumulatedBounding;
- (CGPoint)cursorLocationBase;
- (CGPoint)lastPanTranslation;
- (Class)textInteractionClass;
- (NSMutableArray)activeGestures;
- (UIDelayedAction)longForcePressAction;
- (UIDelayedAction)tapLogTimer;
- (UITextMagnifierTimeWeightedPoint)weightedPoint;
- (_UIKeyboardTextSelectionGestureController)init;
- (_UIKeyboardTextSelectionGestureControllerDelegate)delegate;
- (_UIStatesFeedbackGenerator)feedbackBehaviour;
- (double)lastPressTimestamp;
- (double)oneFingerForcePressAllowableMovement;
- (double)oneFingerForcePressMinimumDuration;
- (double)spacePanDistance;
- (double)twoFingerTapTimestamp;
- (id)addDeallocationHandler:(id)a3;
- (id)addLongPressTextSelectionInteractionsToView:(id)a3;
- (id)addOneFingerTextSelectionInteractionsToView:(id)a3;
- (id)addTwoFingerTextSelectionInteractionsToView:(id)a3;
- (id)selectionController;
- (id)textSelectionInteractionForRTIForwarding;
- (int)previousForcePressCount;
- (int64_t)panGestureState;
- (int64_t)previousRepeatedGranularity;
- (void)_cleanupDeadGesturesIfNecessary;
- (void)configureOneFingerForcePressRecognizer:(id)a3;
- (void)configureTwoFingerPanGestureRecognizer:(id)a3;
- (void)configureTwoFingerTapGestureRecognizer:(id)a3;
- (void)dealloc;
- (void)enableEnclosingScrollViewNestedPinching;
- (void)redisableEnclosingScrollViewNestedPinching;
- (void)removeDeallocationHandler:(id)a3;
- (void)setAccumulatedAcceleration:(CGPoint)a3;
- (void)setAccumulatedBounding:(CGPoint)a3;
- (void)setActiveGestures:(id)a3;
- (void)setCursorLocationBase:(CGPoint)a3;
- (void)setDelegate:(id)a3;
- (void)setDidFloatCursor:(BOOL)a3;
- (void)setDidSuppressSelectionGrabbers:(BOOL)a3;
- (void)setFeedbackBehaviour:(id)a3;
- (void)setHadAddedTouch:(BOOL)a3;
- (void)setIsLongPressing:(BOOL)a3;
- (void)setIsPanning:(BOOL)a3;
- (void)setIsSpacePan:(BOOL)a3;
- (void)setLastPanTranslation:(CGPoint)a3;
- (void)setLastPressTimestamp:(double)a3;
- (void)setLongForcePressAction:(id)a3;
- (void)setPanGestureState:(int64_t)a3;
- (void)setPreviousForcePressCount:(int)a3;
- (void)setPreviousRepeatedGranularity:(int64_t)a3;
- (void)setSpacePanDistance:(double)a3;
- (void)setSuppressTwoFingerPan:(BOOL)a3;
- (void)setTapLogTimer:(id)a3;
- (void)setTwoFingerTapTimestamp:(double)a3;
- (void)setWasNestedPinchingDisabled:(BOOL)a3;
- (void)setWasScrollingEnabled:(BOOL)a3;
- (void)setWeightedPoint:(id)a3;
- (void)willRemoveSelectionController;
@end

@implementation _UIKeyboardTextSelectionGestureController

- (void)enableEnclosingScrollViewNestedPinching
{
  v3 = [(_UIKeyboardTextSelectionGestureController *)self delegate];
  v4 = [v3 textSelectionController];

  if (v4)
  {
    v5 = [(_UIKeyboardTextSelectionGestureController *)self selectionController];
    v6 = [v5 textInputView];
    id v10 = [v6 _scroller];

    v7 = v10;
    if (v10)
    {
      v8 = [v10 pinchGestureRecognizer];

      v7 = v10;
      if (v8)
      {
        [(_UIKeyboardTextSelectionGestureController *)self setWasNestedPinchingDisabled:1];
        v9 = [v10 pinchGestureRecognizer];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v9 && !v9[297])
        {
          v9[297] = 1;
          -[UIScrollViewPinchGestureRecognizer _updateHysteresis](v9);
        }

        v7 = v10;
      }
    }
  }
}

- (_UIKeyboardTextSelectionGestureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIKeyboardTextSelectionGestureControllerDelegate *)WeakRetained;
}

- (id)addDeallocationHandler:(id)a3
{
  id v4 = a3;
  if (!self->_deallocHandlers)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    deallocHandlers = self->_deallocHandlers;
    self->_deallocHandlers = v5;
  }
  v7 = (void *)[v4 copy];
  v8 = self->_deallocHandlers;
  v9 = _Block_copy(v7);
  [(NSMutableArray *)v8 addObject:v9];

  id v10 = _Block_copy(v7);
  return v10;
}

- (void)removeDeallocationHandler:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObject:](self->_deallocHandlers, "removeObject:");
  }
}

- (id)addTwoFingerTextSelectionInteractionsToView:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", v4, self, 6);
  if (v5) {
    [v4 addInteraction:v5];
  }

  return v5;
}

- (_UIKeyboardTextSelectionGestureController)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardTextSelectionGestureController;
  v2 = [(_UIKeyboardTextSelectionGestureController *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeGestures = v2->_activeGestures;
    v2->_activeGestures = v3;

    v5 = objc_alloc_init(UITextMagnifierTimeWeightedPoint);
    weightedPoint = v2->_weightedPoint;
    v2->_weightedPoint = v5;

    v7 = [[_UIStatesFeedbackGenerator alloc] initWithStyle:0];
    feedbackBehaviour = v2->_feedbackBehaviour;
    v2->_feedbackBehaviour = v7;
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  [(_UIKeyboardTextSelectionGestureController *)self _cleanupDeadGesturesIfNecessary];
  objc_storeWeak((id *)&self->_delegate, obj);
}

- (void)_cleanupDeadGesturesIfNecessary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained textSelectionController];

  if (v4)
  {
    [(_UIKeyboardTextSelectionGestureController *)self redisableEnclosingScrollViewNestedPinching];
    if ([(_UIKeyboardTextSelectionGestureController *)self didSuppressSelectionGrabbers])
    {
      v5 = [(_UIKeyboardTextSelectionGestureController *)self selectionController];
      [v5 setRangedSelectionShouldShowGrabbers:1];

      [(_UIKeyboardTextSelectionGestureController *)self setDidSuppressSelectionGrabbers:0];
    }
  }
}

+ (_UIKeyboardTextSelectionGestureController)sharedInstance
{
  if (qword_1EB25B360 != -1) {
    dispatch_once(&qword_1EB25B360, &__block_literal_global_277_1);
  }
  v2 = (void *)qword_1EB25B368;
  return (_UIKeyboardTextSelectionGestureController *)v2;
}

- (Class)textInteractionClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldAddForceGesture
{
  v2 = +[UIDevice currentDevice];
  char v3 = [v2 _supportsForceTouch];

  return v3;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)[(NSMutableArray *)self->_deallocHandlers copy];
  deallocHandlers = self->_deallocHandlers;
  self->_deallocHandlers = 0;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  [(UIDelayedAction *)self->_longForcePressAction cancel];
  longForcePressAction = self->_longForcePressAction;
  self->_longForcePressAction = 0;

  feedbackBehaviour = self->_feedbackBehaviour;
  self->_feedbackBehaviour = 0;

  weightedPoint = self->_weightedPoint;
  self->_weightedPoint = 0;

  activeGestures = self->_activeGestures;
  self->_activeGestures = 0;

  tapLogTimer = self->_tapLogTimer;
  self->_tapLogTimer = 0;

  v15.receiver = self;
  v15.super_class = (Class)_UIKeyboardTextSelectionGestureController;
  [(_UIKeyboardTextSelectionGestureController *)&v15 dealloc];
}

- (id)selectionController
{
  v2 = [(_UIKeyboardTextSelectionGestureController *)self delegate];
  char v3 = [v2 textSelectionController];

  return v3;
}

- (void)willRemoveSelectionController
{
  id v3 = (id)[(NSMutableArray *)self->_activeGestures copy];
  [v3 enumerateObjectsUsingBlock:&__block_literal_global_286_0];
  [(_UIKeyboardTextSelectionGestureController *)self _cleanupDeadGesturesIfNecessary];
}

- (void)redisableEnclosingScrollViewNestedPinching
{
  id v3 = [(_UIKeyboardTextSelectionGestureController *)self delegate];
  id v4 = [v3 textSelectionController];

  if (v4 && [(_UIKeyboardTextSelectionGestureController *)self wasNestedPinchingDisabled])
  {
    id v5 = [(_UIKeyboardTextSelectionGestureController *)self selectionController];
    uint64_t v6 = [v5 textInputView];
    id v9 = [v6 _scroller];

    uint64_t v7 = v9;
    if (v9)
    {
      [(_UIKeyboardTextSelectionGestureController *)self setWasNestedPinchingDisabled:0];
      uint64_t v8 = [v9 pinchGestureRecognizer];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v8 && v8[297])
      {
        v8[297] = 0;
        -[UIScrollViewPinchGestureRecognizer _updateHysteresis](v8);
      }

      uint64_t v7 = v9;
    }
  }
}

- (double)oneFingerForcePressMinimumDuration
{
  return 0.35;
}

- (BOOL)oneFingerForcePressShouldFailWithoutForce
{
  return 0;
}

- (BOOL)oneFingerForcePressShouldCancelTouchesInView
{
  return 0;
}

- (double)oneFingerForcePressAllowableMovement
{
  return 1.79769313e308;
}

- (BOOL)allowOneFingerDeepPress
{
  return 0;
}

- (BOOL)_longPressAllowedForView:(id)a3
{
  return [a3 conformsToProtocol:&unk_1ED5C1090];
}

- (id)textSelectionInteractionForRTIForwarding
{
  v2 = objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", 0, self, 0);
  return v2;
}

- (id)addOneFingerTextSelectionInteractionsToView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIKeyboardTextSelectionGestureController *)self shouldAddForceGesture];
  if ([(_UIKeyboardTextSelectionGestureController *)self _longPressAllowedForView:v4]) {
    v5 |= 8uLL;
  }
  uint64_t v6 = objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", v4, self, v5);
  if (v6) {
    [v4 addInteraction:v6];
  }

  return v6;
}

- (id)addLongPressTextSelectionInteractionsToView:(id)a3
{
  id v4 = a3;
  if ([(_UIKeyboardTextSelectionGestureController *)self _longPressAllowedForView:v4])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(-[_UIKeyboardTextSelectionGestureController textInteractionClass](self, "textInteractionClass")), "initWithView:owner:forTypes:", v4, self, 8);
    if (v5) {
      [v4 addInteraction:v5];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)configureTwoFingerPanGestureRecognizer:(id)a3
{
  id v4 = a3;
  [(objc_class *)[(_UIKeyboardTextSelectionGestureController *)self textInteractionClass] attachToExistingRecogniser:v4 owner:self forType:4];
}

- (void)configureTwoFingerTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  [(objc_class *)[(_UIKeyboardTextSelectionGestureController *)self textInteractionClass] attachToExistingRecogniser:v4 owner:self forType:2];
}

- (void)configureOneFingerForcePressRecognizer:(id)a3
{
  id v4 = a3;
  [(objc_class *)[(_UIKeyboardTextSelectionGestureController *)self textInteractionClass] attachToExistingRecogniser:v4 owner:self forType:1];
}

- (CGPoint)lastPanTranslation
{
  double x = self->_lastPanTranslation.x;
  double y = self->_lastPanTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastPanTranslation:(CGPoint)a3
{
  self->_lastPanTranslation = a3;
}

- (CGPoint)accumulatedAcceleration
{
  double x = self->_accumulatedAcceleration.x;
  double y = self->_accumulatedAcceleration.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAccumulatedAcceleration:(CGPoint)a3
{
  self->_accumulatedAcceleration = a3;
}

- (CGPoint)accumulatedBounding
{
  double x = self->_accumulatedBounding.x;
  double y = self->_accumulatedBounding.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAccumulatedBounding:(CGPoint)a3
{
  self->_accumulatedBounding = a3;
}

- (double)lastPressTimestamp
{
  return self->_lastPressTimestamp;
}

- (void)setLastPressTimestamp:(double)a3
{
  self->_lastPressTimestamp = a3;
}

- (UITextMagnifierTimeWeightedPoint)weightedPoint
{
  return self->_weightedPoint;
}

- (void)setWeightedPoint:(id)a3
{
}

- (double)twoFingerTapTimestamp
{
  return self->_twoFingerTapTimestamp;
}

- (void)setTwoFingerTapTimestamp:(double)a3
{
  self->_twoFingerTapTimestamp = a3;
}

- (int64_t)previousRepeatedGranularity
{
  return self->_previousRepeatedGranularity;
}

- (void)setPreviousRepeatedGranularity:(int64_t)a3
{
  self->_previousRepeatedGranularitdouble y = a3;
}

- (int64_t)panGestureState
{
  return self->_panGestureState;
}

- (void)setPanGestureState:(int64_t)a3
{
  self->_panGestureState = a3;
}

- (BOOL)wasScrollingEnabled
{
  return self->_wasScrollingEnabled;
}

- (void)setWasScrollingEnabled:(BOOL)a3
{
  self->_wasScrollingEnabled = a3;
}

- (BOOL)wasNestedPinchingDisabled
{
  return self->_wasNestedPinchingDisabled;
}

- (void)setWasNestedPinchingDisabled:(BOOL)a3
{
  self->_wasNestedPinchingDisabled = a3;
}

- (BOOL)suppressTwoFingerPan
{
  return self->_suppressTwoFingerPan;
}

- (void)setSuppressTwoFingerPan:(BOOL)a3
{
  self->_suppressTwoFingerPan = a3;
}

- (BOOL)didSuppressSelectionGrabbers
{
  return self->_didSuppressSelectionGrabbers;
}

- (void)setDidSuppressSelectionGrabbers:(BOOL)a3
{
  self->_didSuppressSelectionGrabbers = a3;
}

- (BOOL)isLongPressing
{
  return self->_isLongPressing;
}

- (void)setIsLongPressing:(BOOL)a3
{
  self->_isLongPressing = a3;
}

- (BOOL)isPanning
{
  return self->_isPanning;
}

- (void)setIsPanning:(BOOL)a3
{
  self->_isPanning = a3;
}

- (BOOL)isSpacePan
{
  return self->_isSpacePan;
}

- (void)setIsSpacePan:(BOOL)a3
{
  self->_isSpacePan = a3;
}

- (BOOL)hadAddedTouch
{
  return self->_hadAddedTouch;
}

- (void)setHadAddedTouch:(BOOL)a3
{
  self->_hadAddedTouch = a3;
}

- (double)spacePanDistance
{
  return self->_spacePanDistance;
}

- (void)setSpacePanDistance:(double)a3
{
  self->_spacePanDistance = a3;
}

- (NSMutableArray)activeGestures
{
  return self->_activeGestures;
}

- (void)setActiveGestures:(id)a3
{
}

- (BOOL)didFloatCursor
{
  return self->_didFloatCursor;
}

- (void)setDidFloatCursor:(BOOL)a3
{
  self->_didFloatCursor = a3;
}

- (CGPoint)cursorLocationBase
{
  double x = self->_cursorLocationBase.x;
  double y = self->_cursorLocationBase.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCursorLocationBase:(CGPoint)a3
{
  self->_cursorLocationBase = a3;
}

- (UIDelayedAction)tapLogTimer
{
  return self->_tapLogTimer;
}

- (void)setTapLogTimer:(id)a3
{
}

- (int)previousForcePressCount
{
  return self->_previousForcePressCount;
}

- (void)setPreviousForcePressCount:(int)a3
{
  self->_previousForcePressCount = a3;
}

- (UIDelayedAction)longForcePressAction
{
  return self->_longForcePressAction;
}

- (void)setLongForcePressAction:(id)a3
{
}

- (_UIStatesFeedbackGenerator)feedbackBehaviour
{
  return self->_feedbackBehaviour;
}

- (void)setFeedbackBehaviour:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackBehaviour, 0);
  objc_storeStrong((id *)&self->_longForcePressAction, 0);
  objc_storeStrong((id *)&self->_tapLogTimer, 0);
  objc_storeStrong((id *)&self->_activeGestures, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_deallocHandlers, 0);
}

@end