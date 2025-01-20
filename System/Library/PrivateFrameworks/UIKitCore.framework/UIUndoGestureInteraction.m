@interface UIUndoGestureInteraction
+ (BOOL)_isKeyWindowSceneSessionRoleValidForTutorial;
+ (id)iWorkFamily;
+ (void)presentProductivityGestureTutorialIfNeededWithCompletion:(id)a3;
+ (void)presentProductivityGestureTutorialInlineWithCompletion:(id)a3;
+ (void)showSecurePasteConfirmationWithCompletionHandler:(id)a3;
- (BOOL)_endPanWithDirection:(int64_t)a3;
- (BOOL)bundleIniWorkFamily:(id)a3;
- (BOOL)canCopy;
- (BOOL)canCut;
- (BOOL)canPaste;
- (BOOL)canRedo;
- (BOOL)canUndo;
- (BOOL)currentInteractiveHUDVisible;
- (BOOL)currentStateHUDVisible;
- (BOOL)editingInteractionOptionsAllowGestureRecognizerToBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)interactiveHUDIsVisible;
- (BOOL)isRTLMode;
- (BOOL)multiPinchTimerOn;
- (BOOL)needUpdateHUDForContainerChange;
- (BOOL)performActionWithDirection:(int64_t)a3;
- (BOOL)performGestureWithDirection:(int64_t)a3;
- (BOOL)performGestureWithDirection:(int64_t)a3 authenticationMessage:(id)a4;
- (BOOL)textEditingOperationsAvailableWithGestureRecognizer:(id)a3;
- (BOOL)undoGestureIsMoving:(id)a3;
- (BOOL)undoManagerOperationsCutCopyPasteAvailable;
- (BOOL)undoManagerOperationsUndoRedoAvailable;
- (BOOL)undoStateHUDIsAnimating;
- (CGPoint)beginPanLocation;
- (CGPoint)previousPanLocation;
- (CGRect)actualSceneBounds;
- (CGRect)currentActuallSceneBounds;
- (NSLayoutConstraint)undoHUDContainerHeightConstraint;
- (NSLayoutConstraint)undoHUDContainerWidthConstraint;
- (NSLayoutConstraint)undoStateHUDCenterConstraint;
- (NSLayoutConstraint)undoStateHUDTopConstraint;
- (UIDelayedAction)multiPansTimer;
- (UIDelayedAction)undoStateHUDDismissTimer;
- (UIKBTextEditingTraits)editingTraits;
- (UIKBUndoInteractionHUD)undoInteractiveHUD;
- (UIKBUndoStateHUD)undoStateHUD;
- (UILayoutGuide)layoutGuide;
- (UIView)view;
- (_UIKBProductivityDoubleTapGesture)threeFingerDoubleTap;
- (_UIKBProductivityLongPressGestureRecognizer)threeFingerLongPress;
- (_UIKBProductivityPanGestureRecognizer)threeFingerSlide;
- (_UIKBProductivityPinchGestureRecognizer)threeFingerPinch;
- (_UIKBProductivitySingleTapGesture)threeFingerSingleTap;
- (_UIKBUndoGestureObserver)observerGesture;
- (double)currentTime;
- (double)initPinchableDistance;
- (double)lastTapTimestamp;
- (double)previousPinchPerimeter;
- (double)remainingDistanceToTravel;
- (id)_undoManager;
- (id)_undoManagerFlattenedGroupingInfo;
- (id)currentInteractionHUD;
- (id)currentResponder;
- (id)interactiveHUDButtonForDirection:(int64_t)a3;
- (id)pasteConfirmationAction;
- (id)responderForOperation:(SEL)a3 withSender:(id)a4;
- (id)scrollViewForInputDelegate;
- (int64_t)beginPanDirection;
- (int64_t)currentAppearance;
- (int64_t)interactiveHUDMode;
- (int64_t)keyboardAppearance;
- (int64_t)potentialPinchDirection;
- (int64_t)previousRecognizedPanDirection;
- (int64_t)slideDirectionWithGesture:(id)a3;
- (int64_t)undoControlTypeWithDirection:(int64_t)a3;
- (unint64_t)panDownStateChangedCounter;
- (unint64_t)privateEditingInteractionOptions;
- (void)_addGestureRecognizers;
- (void)_cancelPinch:(id)a3;
- (void)_createAndUpdateUndoInteractiveHUDIfNecessary;
- (void)_createAndUpdateUndoStateHUDIfNecessary;
- (void)_createGestureRecognizersIfNecessary;
- (void)_endPan:(id)a3;
- (void)_endPinch:(id)a3;
- (void)_endPinchWithDirection:(int64_t)a3;
- (void)_installUndoManagerObservers;
- (void)_removeGestureRecognizers;
- (void)_startPinch:(id)a3;
- (void)_startUndoPan:(id)a3;
- (void)_threeFingerSingleTapAction;
- (void)_uninstallUndoManagerObservers;
- (void)_updateHUDControlState;
- (void)_updatePinch:(id)a3;
- (void)_updateUndoPan:(id)a3;
- (void)animateDisplayingStateHUD;
- (void)animateInStateHUD;
- (void)animateSpringCoverWithSuccess:(BOOL)a3 direction:(int64_t)a4 remainingDistanceToTravel:(double)a5;
- (void)applicationWillSuspend;
- (void)clearHUDViews;
- (void)clearMultiPansTimer;
- (void)clearMultiPinchTimer;
- (void)clearUndoStateHUDDismissTimer;
- (void)copyOperation;
- (void)cutOperation;
- (void)deactiveActiveKeysIfNeeded:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)disableEnclosingScrollViewScrolling;
- (void)fullyCloseCoverWithComplete:(id)a3;
- (void)fullyOpenAndCloseCoverWithBeginDirection:(int64_t)a3;
- (void)layoutUndoInteractiveHUD;
- (void)layoutUndoStateHUD;
- (void)multiPansTimerElaspsed:(id)a3;
- (void)observerGestureHandler:(id)a3;
- (void)pasteOperation;
- (void)redo:(BOOL)a3;
- (void)removeAllHUDOnContainerChange;
- (void)setBeginPanDirection:(int64_t)a3;
- (void)setBeginPanLocation:(CGPoint)a3;
- (void)setCurrentActuallSceneBounds:(CGRect)a3;
- (void)setCurrentAppearance:(int64_t)a3;
- (void)setEditingTraits:(id)a3;
- (void)setInitPinchableDistance:(double)a3;
- (void)setInteractiveHUDIsVisible:(BOOL)a3;
- (void)setInteractiveHUDMode:(int64_t)a3;
- (void)setLastTapTimestamp:(double)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setMultiPansTimer:(id)a3;
- (void)setMultiPinchTimerOn:(BOOL)a3;
- (void)setObserverGesture:(id)a3;
- (void)setPanDownStateChangedCounter:(unint64_t)a3;
- (void)setPasteConfirmationAction:(id)a3;
- (void)setPasteConfirmationHUDVisibility:(BOOL)a3;
- (void)setPotentialPinchDirection:(int64_t)a3;
- (void)setPreviousPanLocation:(CGPoint)a3;
- (void)setPreviousPinchPerimeter:(double)a3;
- (void)setPreviousRecognizedPanDirection:(int64_t)a3;
- (void)setRemainingDistanceToTravel:(double)a3;
- (void)setThreeFingerDoubleTap:(id)a3;
- (void)setThreeFingerLongPress:(id)a3;
- (void)setThreeFingerPinch:(id)a3;
- (void)setThreeFingerSingleTap:(id)a3;
- (void)setThreeFingerSlide:(id)a3;
- (void)setUndoHUDContainerHeightConstraint:(id)a3;
- (void)setUndoHUDContainerWidthConstraint:(id)a3;
- (void)setUndoHUDType:(int64_t)a3 visibility:(BOOL)a4;
- (void)setUndoInteractiveHUD:(id)a3;
- (void)setUndoInteractiveHUDVisibility:(BOOL)a3;
- (void)setUndoStateHUD:(id)a3;
- (void)setUndoStateHUDCenterConstraint:(id)a3;
- (void)setUndoStateHUDDismissTimer:(id)a3;
- (void)setUndoStateHUDIsAnimating:(BOOL)a3;
- (void)setUndoStateHUDTopConstraint:(id)a3;
- (void)setUndoStateHUDVisibility:(BOOL)a3 withType:(int64_t)a4 available:(BOOL)a5;
- (void)setView:(id)a3;
- (void)startMultiPinchTimer:(double)a3;
- (void)threeFingerDoubleTap:(id)a3;
- (void)threeFingerDoubleTapUndoAction;
- (void)threeFingerLongPress:(id)a3;
- (void)threeFingerPinch:(id)a3;
- (void)threeFingerSingleTap:(id)a3;
- (void)threeFingerSlide:(id)a3;
- (void)touchMultiPansTimer;
- (void)touchUndoStateHUDDismissTimer;
- (void)undo:(BOOL)a3;
- (void)undoStateHUDDismissTimerElaspsed:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIUndoGestureInteraction

- (void)willMoveToView:(id)a3
{
  if (!a3)
  {
    [(UIUndoGestureInteraction *)self _removeGestureRecognizers];
    [(UIUndoGestureInteraction *)self clearHUDViews];
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self];
  }
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    self->_previousRecognizedPanDirection = 0;
    self->_undoStateHUDIsAnimating = 0;
    self->_panDownStateChangedCounter = 0;
    self->_lastTapTimestamp = 0.0;
    [(UIUndoGestureInteraction *)self _addGestureRecognizers];
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    v7 = [WeakRetained window];
    [v7 actualSceneBounds];
    self->_currentActuallSceneBounds.origin.x = v8;
    self->_currentActuallSceneBounds.origin.y = v9;
    self->_currentActuallSceneBounds.size.width = v10;
    self->_currentActuallSceneBounds.size.height = v11;

    v12 = +[UIDevice currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if (!v13)
    {
      v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v14 addObserver:self selector:sel_removeAllHUDOnContainerChange name:@"UIKeyboardWillChangeFrameNotification" object:0];
    }
    id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:self selector:sel_applicationWillSuspend name:@"UIApplicationSuspendedNotification" object:0];
  }
}

- (void)_addGestureRecognizers
{
  [(UIUndoGestureInteraction *)self _createGestureRecognizersIfNecessary];
  uint64_t v3 = [(UIUndoGestureInteraction *)self view];
  v4 = [(UIUndoGestureInteraction *)self observerGesture];
  [v3 addGestureRecognizer:v4];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v5 = [(UIUndoGestureInteraction *)self view];
    v6 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    [v5 addGestureRecognizer:v6];

    v7 = [(UIUndoGestureInteraction *)self view];
    CGFloat v8 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];
    [v7 addGestureRecognizer:v8];

    CGFloat v9 = [(UIUndoGestureInteraction *)self view];
    CGFloat v10 = [(UIUndoGestureInteraction *)self threeFingerSlide];
    [v9 addGestureRecognizer:v10];

    CGFloat v11 = [(UIUndoGestureInteraction *)self view];
    v12 = [(UIUndoGestureInteraction *)self threeFingerLongPress];
    [v11 addGestureRecognizer:v12];

    uint64_t v13 = [(UIUndoGestureInteraction *)self view];
    v14 = [(UIUndoGestureInteraction *)self threeFingerPinch];
    [v13 addGestureRecognizer:v14];

    id v15 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    v16 = [(UIUndoGestureInteraction *)self threeFingerSlide];
    [v15 requireGestureRecognizerToFail:v16];

    v17 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    v18 = [(UIUndoGestureInteraction *)self threeFingerLongPress];
    [v17 requireGestureRecognizerToFail:v18];

    v19 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    v20 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];
    [v19 requireGestureRecognizerToFail:v20];

    v21 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    v22 = [(UIUndoGestureInteraction *)self threeFingerPinch];
    [v21 requireGestureRecognizerToFail:v22];

    v23 = [(UIUndoGestureInteraction *)self observerGesture];
    v24 = [(UIUndoGestureInteraction *)self threeFingerSlide];
    [v23 requireGestureRecognizerToFail:v24];

    v25 = [(UIUndoGestureInteraction *)self observerGesture];
    v26 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    [v25 requireGestureRecognizerToFail:v26];

    v27 = [(UIUndoGestureInteraction *)self observerGesture];
    v28 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];
    [v27 requireGestureRecognizerToFail:v28];

    v29 = [(UIUndoGestureInteraction *)self observerGesture];
    v30 = [(UIUndoGestureInteraction *)self threeFingerLongPress];
    [v29 requireGestureRecognizerToFail:v30];

    id v32 = [(UIUndoGestureInteraction *)self observerGesture];
    v31 = [(UIUndoGestureInteraction *)self threeFingerPinch];
    [v32 requireGestureRecognizerToFail:v31];
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)_createGestureRecognizersIfNecessary
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self observerGesture];

  if (!v3)
  {
    v4 = +[_UIKBUndoGestureObserver undoGestureObserverWithTarget:self action:sel_observerGestureHandler_ delegate:self];
    [(UIUndoGestureInteraction *)self setObserverGesture:v4];
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v5 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];

    if (!v5)
    {
      v6 = +[_UIKBProductivitySingleTapGesture productivitySingleTapGestureRecognizerWithTarget:self action:sel_threeFingerSingleTap_ delegate:self];
      [(UIUndoGestureInteraction *)self setThreeFingerSingleTap:v6];
    }
    v7 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];

    if (!v7)
    {
      CGFloat v8 = +[_UIKBProductivityDoubleTapGesture productivityDoubleTapGestureRecognizerWithTarget:self action:sel_threeFingerDoubleTap_ delegate:self];
      [(UIUndoGestureInteraction *)self setThreeFingerDoubleTap:v8];
    }
    CGFloat v9 = [(UIUndoGestureInteraction *)self threeFingerSlide];

    if (!v9)
    {
      CGFloat v10 = +[_UIKBProductivityPanGestureRecognizer productivityPanGestureRecognizerWithTarget:self action:sel_threeFingerSlide_ delegate:self];
      [(UIUndoGestureInteraction *)self setThreeFingerSlide:v10];
    }
    CGFloat v11 = [(UIUndoGestureInteraction *)self threeFingerLongPress];

    if (!v11)
    {
      v12 = +[_UIKBProductivityLongPressGestureRecognizer productivityLongPressGestureRecognizerWithTarget:self action:sel_threeFingerLongPress_ delegate:self];
      [(UIUndoGestureInteraction *)self setThreeFingerLongPress:v12];
    }
    uint64_t v13 = [(UIUndoGestureInteraction *)self threeFingerPinch];

    if (!v13)
    {
      id v14 = +[_UIKBProductivityPinchGestureRecognizer productivityPinchGestureRecognizerWithTarget:self action:sel_threeFingerPinch_ delegate:self];
      [(UIUndoGestureInteraction *)self setThreeFingerPinch:v14];
    }
  }
}

- (BOOL)editingInteractionOptionsAllowGestureRecognizerToBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(UIUndoGestureInteraction *)self currentResponder];

  if (!v5) {
    goto LABEL_15;
  }
  id v6 = [(UIUndoGestureInteraction *)self observerGesture];

  if (v6 != v4)
  {
    uint64_t v7 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    if ((id)v7 == v4)
    {
      uint64_t v13 = 6;
    }
    else
    {
      CGFloat v8 = (void *)v7;
      id v9 = [(UIUndoGestureInteraction *)self threeFingerLongPress];

      if (v9 == v4)
      {
        uint64_t v13 = 6;
        goto LABEL_13;
      }
      uint64_t v10 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];
      if ((id)v10 != v4)
      {
        CGFloat v11 = (void *)v10;
        v12 = [(UIUndoGestureInteraction *)self threeFingerSlide];

        if (v12)
        {
          uint64_t v13 = 2;
LABEL_13:
          BOOL v14 = ([(UIUndoGestureInteraction *)self privateEditingInteractionOptions] & v13) != 0;
          goto LABEL_16;
        }
        id v15 = [(UIUndoGestureInteraction *)self threeFingerPinch];

        if (v15 == v4)
        {
          uint64_t v13 = 4;
          goto LABEL_13;
        }
LABEL_15:
        BOOL v14 = 0;
        goto LABEL_16;
      }
      uint64_t v13 = 2;
    }

    goto LABEL_13;
  }
  BOOL v14 = [(UIUndoGestureInteraction *)self currentInteractiveHUDVisible];
LABEL_16:

  return v14;
}

- (_UIKBUndoGestureObserver)observerGesture
{
  return self->_observerGesture;
}

- (id)currentResponder
{
  return +[UIResponder _globalFirstResponder];
}

- (BOOL)currentInteractiveHUDVisible
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  if (v3)
  {
    id v4 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
    id v5 = [v4 superview];
    id v6 = [(UIUndoGestureInteraction *)self view];
    if (v5 == v6)
    {
      CGFloat v8 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
      [v8 alpha];
      BOOL v7 = v9 > 0.0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (UIKBUndoInteractionHUD)undoInteractiveHUD
{
  return self->_undoInteractiveHUD;
}

- (void)setObserverGesture:(id)a3
{
}

- (void)removeAllHUDOnContainerChange
{
  if ([(UIUndoGestureInteraction *)self currentInteractiveHUDVisible]) {
    [(UIUndoGestureInteraction *)self setUndoInteractiveHUDVisibility:0];
  }
  if ([(UIUndoGestureInteraction *)self currentStateHUDVisible]) {
    [(UIUndoGestureInteraction *)self setUndoStateHUDVisibility:0 withType:1 available:1];
  }
  [(UIUndoGestureInteraction *)self clearHUDViews];
  uint64_t v3 = [(UIUndoGestureInteraction *)self layoutGuide];

  if (v3)
  {
    id v4 = [(UIUndoGestureInteraction *)self view];
    id v5 = [(UIUndoGestureInteraction *)self layoutGuide];
    [v4 removeLayoutGuide:v5];

    [(UIUndoGestureInteraction *)self setLayoutGuide:0];
  }
}

- (void)applicationWillSuspend
{
  [(UIUndoGestureInteraction *)self clearUndoStateHUDDismissTimer];
  [(UIUndoGestureInteraction *)self clearMultiPinchTimer];
  [(UIUndoGestureInteraction *)self clearHUDViews];
}

- (void)clearHUDViews
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];

  if (v3)
  {
    id v4 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
    [v4 removeFromSuperview];

    [(UIUndoGestureInteraction *)self setUndoInteractiveHUD:0];
  }
  id v5 = [(UIUndoGestureInteraction *)self undoStateHUD];

  if (v5)
  {
    id v6 = [(UIUndoGestureInteraction *)self undoStateHUD];
    [v6 removeFromSuperview];

    [(UIUndoGestureInteraction *)self setUndoStateHUD:0];
  }
}

- (int64_t)keyboardAppearance
{
  v2 = +[UIKeyboardImpl activeInstance];
  uint64_t v3 = [v2 textInputTraits];
  int64_t v4 = [v3 keyboardAppearance];

  return v4;
}

- (double)currentTime
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return result;
}

- (CGRect)actualSceneBounds
{
  v2 = [(UIUndoGestureInteraction *)self view];
  uint64_t v3 = [v2 window];
  [v3 actualSceneBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isRTLMode
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  LOBYTE(v2) = [v2 characterDirectionForLanguage:v3] == 2;

  return (char)v2;
}

- (void)layoutUndoInteractiveHUD
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];

  if (v3)
  {
    double v4 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
    [v4 removeFromSuperview];

    [(UIUndoGestureInteraction *)self setUndoInteractiveHUD:0];
  }
  [(UIUndoGestureInteraction *)self actualSceneBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[UIUndoGestureInteraction setCurrentActuallSceneBounds:](self, "setCurrentActuallSceneBounds:");
  double v13 = -[UIKBUndoInteractionHUD initWithKeyboardAppearance:isRTL:mode:sceneBounds:]([UIKBUndoInteractionHUD alloc], "initWithKeyboardAppearance:isRTL:mode:sceneBounds:", [(UIUndoGestureInteraction *)self keyboardAppearance], [(UIUndoGestureInteraction *)self isRTLMode], self->_interactiveHUDMode, v6, v8, v10, v12);
  [(UIUndoGestureInteraction *)self setUndoInteractiveHUD:v13];

  double v14 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  [v14 setActionDelegate:self];

  double v15 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  [v15 setAlpha:0.0];

  v16 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(UIUndoGestureInteraction *)self view];
  v18 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  [v17 addSubview:v18];

  v19 = [(UIUndoGestureInteraction *)self layoutGuide];

  if (!v19)
  {
    v20 = objc_alloc_init(UILayoutGuide);
    [(UIUndoGestureInteraction *)self setLayoutGuide:v20];

    v21 = [(UIUndoGestureInteraction *)self view];
    v22 = [(UIUndoGestureInteraction *)self layoutGuide];
    [v21 addLayoutGuide:v22];

    v23 = [(UIUndoGestureInteraction *)self layoutGuide];
    v24 = [v23 leftAnchor];
    v25 = [(UIUndoGestureInteraction *)self view];
    v26 = [v25 leftAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v27 setActive:1];

    v28 = [(UIUndoGestureInteraction *)self layoutGuide];
    v29 = [v28 topAnchor];
    v30 = [(UIUndoGestureInteraction *)self view];
    v31 = [v30 safeAreaLayoutGuide];
    id v32 = [v31 topAnchor];
    v33 = [v29 constraintEqualToAnchor:v32];
    [v33 setActive:1];

    v34 = [(UIUndoGestureInteraction *)self layoutGuide];
    v35 = [v34 widthAnchor];
    v36 = [v35 constraintEqualToConstant:v10];
    undoHUDContainerWidthConstraint = self->_undoHUDContainerWidthConstraint;
    self->_undoHUDContainerWidthConstraint = v36;

    [(NSLayoutConstraint *)self->_undoHUDContainerWidthConstraint setActive:1];
    v38 = [(UIUndoGestureInteraction *)self layoutGuide];
    v39 = [v38 heightAnchor];
    v40 = [v39 constraintEqualToConstant:v12];
    undoHUDContainerHeightConstraint = self->_undoHUDContainerHeightConstraint;
    self->_undoHUDContainerHeightConstraint = v40;

    [(NSLayoutConstraint *)self->_undoHUDContainerHeightConstraint setActive:1];
  }
  [(UIUndoGestureInteraction *)self currentActuallSceneBounds];
  double v43 = v42;
  v44 = [(UIUndoGestureInteraction *)self undoHUDContainerWidthConstraint];
  [v44 setConstant:v43];

  [(UIUndoGestureInteraction *)self currentActuallSceneBounds];
  double v46 = v45;
  v47 = [(UIUndoGestureInteraction *)self undoHUDContainerHeightConstraint];
  [v47 setConstant:v46];

  v48 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  v49 = [v48 centerXAnchor];
  v50 = [(UIUndoGestureInteraction *)self layoutGuide];
  v51 = [v50 centerXAnchor];
  v52 = [v49 constraintEqualToAnchor:v51];
  [v52 setActive:1];

  v53 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  v54 = [v53 topAnchor];
  v55 = [(UIUndoGestureInteraction *)self view];
  v56 = [v55 topAnchor];
  v57 = [v54 constraintGreaterThanOrEqualToAnchor:v56 constant:31.0];
  [v57 setActive:1];

  v58 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  v59 = [v58 topAnchor];
  v60 = [(UIUndoGestureInteraction *)self layoutGuide];
  v61 = [v60 topAnchor];
  id v64 = [v59 constraintEqualToAnchor:v61 constant:7.0];

  LODWORD(v62) = 1144750080;
  [v64 setPriority:v62];
  [v64 setActive:1];
  v63 = [(UIUndoGestureInteraction *)self view];
  [v63 layoutIfNeeded];
}

- (void)layoutUndoStateHUD
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoStateHUD];

  if (v3)
  {
    double v4 = [(UIUndoGestureInteraction *)self undoStateHUD];
    [v4 removeFromSuperview];

    [(UIUndoGestureInteraction *)self setUndoStateHUD:0];
  }
  double v5 = [[UIKBUndoStateHUD alloc] initWithKeyboardAppearance:[(UIUndoGestureInteraction *)self keyboardAppearance]];
  [(UIUndoGestureInteraction *)self setUndoStateHUD:v5];

  double v6 = [(UIUndoGestureInteraction *)self undoStateHUD];
  [v6 setAlpha:0.0];

  double v7 = [(UIUndoGestureInteraction *)self undoStateHUD];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v8 = [(UIUndoGestureInteraction *)self view];
  double v9 = [(UIUndoGestureInteraction *)self undoStateHUD];
  [v8 addSubview:v9];

  [(UIUndoGestureInteraction *)self actualSceneBounds];
  double v11 = v10;
  double v13 = v12;
  -[UIUndoGestureInteraction setCurrentActuallSceneBounds:](self, "setCurrentActuallSceneBounds:");
  double v14 = [(UIUndoGestureInteraction *)self layoutGuide];

  if (!v14)
  {
    double v15 = objc_alloc_init(UILayoutGuide);
    [(UIUndoGestureInteraction *)self setLayoutGuide:v15];

    v16 = [(UIUndoGestureInteraction *)self view];
    v17 = [(UIUndoGestureInteraction *)self layoutGuide];
    [v16 addLayoutGuide:v17];

    v18 = [(UIUndoGestureInteraction *)self layoutGuide];
    v19 = [v18 leftAnchor];
    v20 = [(UIUndoGestureInteraction *)self view];
    v21 = [v20 leftAnchor];
    v22 = [v19 constraintEqualToAnchor:v21];
    [v22 setActive:1];

    v23 = [(UIUndoGestureInteraction *)self layoutGuide];
    v24 = [v23 topAnchor];
    v25 = [(UIUndoGestureInteraction *)self view];
    v26 = [v25 safeAreaLayoutGuide];
    v27 = [v26 topAnchor];
    v28 = [v24 constraintEqualToAnchor:v27];
    [v28 setActive:1];

    v29 = [(UIUndoGestureInteraction *)self layoutGuide];
    v30 = [v29 widthAnchor];
    v31 = [v30 constraintEqualToConstant:v11];
    undoHUDContainerWidthConstraint = self->_undoHUDContainerWidthConstraint;
    self->_undoHUDContainerWidthConstraint = v31;

    [(NSLayoutConstraint *)self->_undoHUDContainerWidthConstraint setActive:1];
    v33 = [(UIUndoGestureInteraction *)self layoutGuide];
    v34 = [v33 heightAnchor];
    v35 = [v34 constraintEqualToConstant:v13];
    undoHUDContainerHeightConstraint = self->_undoHUDContainerHeightConstraint;
    self->_undoHUDContainerHeightConstraint = v35;

    [(NSLayoutConstraint *)self->_undoHUDContainerHeightConstraint setActive:1];
  }
  [(UIUndoGestureInteraction *)self currentActuallSceneBounds];
  double v38 = v37;
  v39 = [(UIUndoGestureInteraction *)self undoHUDContainerWidthConstraint];
  [v39 setConstant:v38];

  [(UIUndoGestureInteraction *)self currentActuallSceneBounds];
  double v41 = v40;
  double v42 = [(UIUndoGestureInteraction *)self undoHUDContainerHeightConstraint];
  [v42 setConstant:v41];

  double v43 = [(UIUndoGestureInteraction *)self undoStateHUD];
  v44 = [v43 centerYAnchor];
  double v45 = [(UIUndoGestureInteraction *)self view];
  double v46 = [v45 topAnchor];
  v47 = [v44 constraintGreaterThanOrEqualToAnchor:v46 constant:45.0];
  undoStateHUDTopConstraint = self->_undoStateHUDTopConstraint;
  self->_undoStateHUDTopConstraint = v47;

  [(NSLayoutConstraint *)self->_undoStateHUDTopConstraint setActive:1];
  v49 = [(UIUndoGestureInteraction *)self undoStateHUD];
  v50 = [v49 centerYAnchor];
  v51 = [(UIUndoGestureInteraction *)self layoutGuide];
  v52 = [v51 topAnchor];
  id v61 = [v50 constraintEqualToAnchor:v52 constant:21.0];

  LODWORD(v53) = 1144750080;
  [v61 setPriority:v53];
  [v61 setActive:1];
  v54 = [(UIUndoGestureInteraction *)self undoStateHUD];
  v55 = [v54 centerXAnchor];
  v56 = [(UIUndoGestureInteraction *)self layoutGuide];
  v57 = [v56 centerXAnchor];
  v58 = [v55 constraintEqualToAnchor:v57 constant:0.0];
  undoStateHUDCenterConstraint = self->_undoStateHUDCenterConstraint;
  self->_undoStateHUDCenterConstraint = v58;

  [(NSLayoutConstraint *)self->_undoStateHUDCenterConstraint setActive:1];
  v60 = [(UIUndoGestureInteraction *)self view];
  [v60 layoutIfNeeded];
}

- (BOOL)needUpdateHUDForContainerChange
{
  int64_t v3 = [(UIUndoGestureInteraction *)self currentAppearance];
  if (v3 != [(UIUndoGestureInteraction *)self keyboardAppearance]) {
    return 1;
  }
  [(UIUndoGestureInteraction *)self currentActuallSceneBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UIUndoGestureInteraction *)self actualSceneBounds];
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (!CGRectEqualToRect(v19, v20)) {
    return 1;
  }
  v16 = [(UIUndoGestureInteraction *)self layoutGuide];
  BOOL v17 = v16 == 0;

  return v17;
}

- (void)_createAndUpdateUndoInteractiveHUDIfNecessary
{
  int64_t v3 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  if (v3 && ![(UIUndoGestureInteraction *)self needUpdateHUDForContainerChange])
  {
    double v4 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
    uint64_t v5 = [v4 mode];
    int64_t interactiveHUDMode = self->_interactiveHUDMode;

    if (v5 == interactiveHUDMode) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(UIUndoGestureInteraction *)self layoutUndoInteractiveHUD];
  [(UIUndoGestureInteraction *)self setCurrentAppearance:[(UIUndoGestureInteraction *)self keyboardAppearance]];
LABEL_6:
  id v7 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  [v7 setNeedsLayout];
}

- (id)currentInteractionHUD
{
  return self->_undoInteractiveHUD;
}

- (void)_createAndUpdateUndoStateHUDIfNecessary
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoStateHUD];
  if (!v3
    || (double v4 = (void *)v3,
        BOOL v5 = [(UIUndoGestureInteraction *)self needUpdateHUDForContainerChange],
        v4,
        v5))
  {
    [(UIUndoGestureInteraction *)self layoutUndoStateHUD];
    [(UIUndoGestureInteraction *)self setCurrentAppearance:[(UIUndoGestureInteraction *)self keyboardAppearance]];
  }
  id v6 = [(UIUndoGestureInteraction *)self undoStateHUD];
  [v6 setNeedsLayout];
}

- (BOOL)currentStateHUDVisible
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoStateHUD];
  if (v3)
  {
    double v4 = [(UIUndoGestureInteraction *)self undoStateHUD];
    BOOL v5 = [v4 superview];
    id v6 = [(UIUndoGestureInteraction *)self view];
    if (v5 == v6)
    {
      double v8 = [(UIUndoGestureInteraction *)self undoStateHUD];
      [v8 alpha];
      BOOL v7 = v9 > 0.0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)animateInStateHUD
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoStateHUD];
  uint64_t v4 = [v3 controlType];

  if (v4 != 1)
  {
    BOOL v7 = [(UIUndoGestureInteraction *)self undoStateHUD];
    uint64_t v8 = [v7 controlType];

    if (v8 == 2)
    {
      undoStateHUDCenterConstraint = self->_undoStateHUDCenterConstraint;
      double v6 = -15.0;
      goto LABEL_5;
    }
    double v9 = [(UIUndoGestureInteraction *)self undoStateHUD];
    if ([v9 controlType] == 4)
    {
    }
    else
    {
      double v10 = [(UIUndoGestureInteraction *)self undoStateHUD];
      uint64_t v11 = [v10 controlType];

      if (v11 != 3)
      {
        CGRect v19 = [(UIUndoGestureInteraction *)self undoStateHUD];
        uint64_t v20 = [v19 controlType];

        if (v20 != 5) {
          goto LABEL_11;
        }
        v21 = [(UIUndoGestureInteraction *)self undoStateHUD];
        v22 = [v21 undoStateHUDWidthConstraint];
        [v22 setConstant:-30.0];

        CGFloat v14 = [(UIUndoGestureInteraction *)self undoStateHUD];
        CGFloat v15 = [v14 undoStateHUDHeightConstraint];
        v16 = v15;
        double v17 = -30.0;
        goto LABEL_10;
      }
    }
    CGFloat v12 = [(UIUndoGestureInteraction *)self undoStateHUD];
    CGFloat v13 = [v12 undoStateHUDWidthConstraint];
    [v13 setConstant:30.0];

    CGFloat v14 = [(UIUndoGestureInteraction *)self undoStateHUD];
    CGFloat v15 = [v14 undoStateHUDHeightConstraint];
    v16 = v15;
    double v17 = 30.0;
LABEL_10:
    [v15 setConstant:v17];

    goto LABEL_11;
  }
  undoStateHUDCenterConstraint = self->_undoStateHUDCenterConstraint;
  double v6 = 15.0;
LABEL_5:
  [(NSLayoutConstraint *)undoStateHUDCenterConstraint setConstant:v6];
LABEL_11:
  v18 = [(UIUndoGestureInteraction *)self view];
  [v18 layoutIfNeeded];

  v23[4] = self;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke;
  v24[3] = &unk_1E52D9F70;
  v24[4] = self;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke_2;
  v23[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:0 delay:v24 usingSpringWithDamping:v23 initialSpringVelocity:0.7 options:0.0 animations:0.5 completion:0.0];
}

void __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:1];
  v2 = [*(id *)(a1 + 32) undoStateHUD];
  [v2 setAlpha:1.0];

  uint64_t v3 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v3 controlType] == 1)
  {

LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 112) setConstant:0.0];
    goto LABEL_10;
  }
  uint64_t v4 = [*(id *)(a1 + 32) undoStateHUD];
  uint64_t v5 = [v4 controlType];

  if (v5 == 2) {
    goto LABEL_4;
  }
  double v6 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v6 controlType] == 4) {
    goto LABEL_8;
  }
  BOOL v7 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v7 controlType] == 3)
  {

LABEL_8:
LABEL_9:
    uint64_t v8 = [*(id *)(a1 + 32) undoStateHUD];
    double v9 = [v8 undoStateHUDWidthConstraint];
    [v9 setConstant:0.0];

    double v10 = [*(id *)(a1 + 32) undoStateHUD];
    uint64_t v11 = [v10 undoStateHUDHeightConstraint];
    [v11 setConstant:0.0];

    goto LABEL_10;
  }
  CGFloat v12 = [*(id *)(a1 + 32) undoStateHUD];
  uint64_t v13 = [v12 controlType];

  if (v13 == 5) {
    goto LABEL_9;
  }
LABEL_10:
  id v14 = [*(id *)(a1 + 32) view];
  [v14 layoutIfNeeded];
}

uint64_t __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:0];
}

- (void)animateDisplayingStateHUD
{
  uint64_t v3 = [(UIUndoGestureInteraction *)self undoStateHUD];
  uint64_t v4 = [v3 controlType];

  if (v4 == 1)
  {
    _Q0 = xmmword_186B9B0D0;
LABEL_9:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke;
    v18[3] = &unk_1E52DD178;
    v18[4] = self;
    long long v19 = _Q0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_2;
    v17[3] = &unk_1E52DA6D8;
    v17[5] = 0;
    v17[6] = 0;
    v17[4] = self;
    +[UIView animateWithDuration:v18 animations:v17 completion:0.1];
    return;
  }
  double v6 = [(UIUndoGestureInteraction *)self undoStateHUD];
  uint64_t v7 = [v6 controlType];

  if (v7 == 2)
  {
    _Q0 = xmmword_186B9B0E0;
    goto LABEL_9;
  }
  uint64_t v8 = [(UIUndoGestureInteraction *)self undoStateHUD];
  if ([v8 controlType] == 4)
  {

LABEL_8:
    __asm { FMOV            V0.2D, #-3.75 }
    goto LABEL_9;
  }
  double v9 = [(UIUndoGestureInteraction *)self undoStateHUD];
  uint64_t v10 = [v9 controlType];

  if (v10 == 3) {
    goto LABEL_8;
  }
  CGFloat v15 = [(UIUndoGestureInteraction *)self undoStateHUD];
  uint64_t v16 = [v15 controlType];

  if (v16 == 5)
  {
    __asm { FMOV            V0.2D, #3.75 }
    goto LABEL_9;
  }
}

void __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:1];
  v2 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v2 controlType] == 1)
  {

LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 112) setConstant:*(double *)(a1 + 40)];
    goto LABEL_10;
  }
  uint64_t v3 = [*(id *)(a1 + 32) undoStateHUD];
  uint64_t v4 = [v3 controlType];

  if (v4 == 2) {
    goto LABEL_4;
  }
  uint64_t v5 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v5 controlType] == 4) {
    goto LABEL_8;
  }
  double v6 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v6 controlType] == 3)
  {

LABEL_8:
LABEL_9:
    double v7 = *(double *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) undoStateHUD];
    double v9 = [v8 undoStateHUDWidthConstraint];
    [v9 setConstant:v7];

    double v10 = *(double *)(a1 + 48);
    uint64_t v11 = [*(id *)(a1 + 32) undoStateHUD];
    CGFloat v12 = [v11 undoStateHUDHeightConstraint];
    [v12 setConstant:v10];

    goto LABEL_10;
  }
  uint64_t v13 = [*(id *)(a1 + 32) undoStateHUD];
  uint64_t v14 = [v13 controlType];

  if (v14 == 5) {
    goto LABEL_9;
  }
LABEL_10:
  id v15 = [*(id *)(a1 + 32) view];
  [v15 layoutIfNeeded];
}

uint64_t __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_3;
  v4[3] = &unk_1E52DD178;
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_4;
  v3[3] = &unk_1E52DC3A0;
  v3[4] = v5;
  return +[UIView animateWithDuration:v4 animations:v3 completion:0.2];
}

void __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:1];
  v2 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v2 controlType] == 1)
  {

LABEL_4:
    [*(id *)(*(void *)(a1 + 32) + 112) setConstant:*(double *)(a1 + 40)];
    goto LABEL_10;
  }
  uint64_t v3 = [*(id *)(a1 + 32) undoStateHUD];
  uint64_t v4 = [v3 controlType];

  if (v4 == 2) {
    goto LABEL_4;
  }
  uint64_t v5 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v5 controlType] == 4) {
    goto LABEL_8;
  }
  long long v6 = [*(id *)(a1 + 32) undoStateHUD];
  if ([v6 controlType] == 3)
  {

LABEL_8:
LABEL_9:
    double v7 = *(double *)(a1 + 40);
    uint64_t v8 = [*(id *)(a1 + 32) undoStateHUD];
    double v9 = [v8 undoStateHUDWidthConstraint];
    [v9 setConstant:v7];

    double v10 = *(double *)(a1 + 48);
    uint64_t v11 = [*(id *)(a1 + 32) undoStateHUD];
    CGFloat v12 = [v11 undoStateHUDHeightConstraint];
    [v12 setConstant:v10];

    goto LABEL_10;
  }
  uint64_t v13 = [*(id *)(a1 + 32) undoStateHUD];
  uint64_t v14 = [v13 controlType];

  if (v14 == 5) {
    goto LABEL_9;
  }
LABEL_10:
  id v15 = [*(id *)(a1 + 32) view];
  [v15 layoutIfNeeded];
}

uint64_t __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:0];
}

- (void)_installUndoManagerObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateHUDControlState name:*MEMORY[0x1E4F28A80] object:0];
  [v3 addObserver:self selector:sel__updateHUDControlState name:*MEMORY[0x1E4F28A78] object:0];
  [v3 addObserver:self selector:sel__updateHUDControlState name:*MEMORY[0x1E4F28A68] object:0];
}

- (void)_uninstallUndoManagerObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F28A80] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F28A78] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F28A68] object:0];
}

- (void)setUndoHUDType:(int64_t)a3 visibility:(BOOL)a4
{
  int v4 = a4;
  BOOL v7 = [(UIUndoGestureInteraction *)self currentStateHUDVisible];
  int v8 = [(UIUndoGestureInteraction *)self currentInteractiveHUDVisible];
  if (a3)
  {
    if (a3 == 1)
    {
      if (v4)
      {
        [(UIUndoGestureInteraction *)self touchUndoStateHUDDismissTimer];
        if (v7) {
          [(UIUndoGestureInteraction *)self animateDisplayingStateHUD];
        }
        else {
          [(UIUndoGestureInteraction *)self animateInStateHUD];
        }
      }
      else
      {
        BOOL v13 = [(UIUndoGestureInteraction *)self undoStateHUDIsAnimating];
        double v14 = 0.0;
        if (v13) {
          double v14 = 0.2;
        }
        v39[4] = self;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke;
        v40[3] = &unk_1E52D9CD0;
        v40[4] = self;
        v40[5] = 0;
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_2;
        v39[3] = &unk_1E52DC3A0;
        +[UIView animateWithDuration:0 delay:v40 options:v39 animations:0.2 completion:v14];
      }
    }
  }
  else if (v8 != v4)
  {
    if (v4) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
    if (v4)
    {
      double v10 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
      [v10 updateHUDControlState];
    }
    if (v7)
    {
      [(UIUndoGestureInteraction *)self _uninstallUndoManagerObservers];
      [(UIUndoGestureInteraction *)self touchUndoStateHUDDismissTimer];
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_3;
      double v37 = &unk_1E52D9F70;
      double v38 = self;
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      v29 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_4;
      v30 = &unk_1E52FEEA8;
      v31 = self;
      double v32 = v9;
      LOBYTE(v33) = v4;
      uint64_t v11 = &v34;
      CGFloat v12 = &v27;
    }
    else
    {
      [(UIUndoGestureInteraction *)self _installUndoManagerObservers];
      uint64_t v21 = MEMORY[0x1E4F143A8];
      uint64_t v22 = 3221225472;
      v23 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_9;
      v24 = &unk_1E52D9CD0;
      v25 = self;
      double v26 = v9;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_10;
      long long v19 = &__block_descriptor_33_e8_v12__0B8l;
      LOBYTE(v20) = v4;
      uint64_t v11 = &v21;
      CGFloat v12 = &v16;
    }
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v12, 0.2, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, *(void *)&v26, v27, v28, v29,
      v30,
      v31,
      *(void *)&v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38);
  }
  id v15 = [(UIUndoGestureInteraction *)self view];
  [v15 layoutIfNeeded];
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:1];
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) undoStateHUD];
  [v3 setAlpha:v2];
}

uint64_t __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:0];
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:1];
  double v2 = [*(id *)(a1 + 32) undoStateHUDTopConstraint];
  [v2 setConstant:60.0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

uint64_t __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_4(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_5;
  v4[3] = &unk_1E52D9CD0;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_6;
  v2[3] = &unk_1E52E0478;
  v2[4] = v5;
  char v3 = *(unsigned char *)(a1 + 48);
  return +[UIView animateWithDuration:v4 animations:v2 completion:0.2];
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:1];
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) undoInteractiveHUD];
  [v3 setAlpha:v2];
}

uint64_t __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_6(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_7;
  v4[3] = &unk_1E52D9F70;
  uint64_t v5 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_8;
  v2[3] = &unk_1E52E0478;
  v2[4] = v5;
  char v3 = *(unsigned char *)(a1 + 40);
  return +[UIView animateWithDuration:v4 animations:v2 completion:0.2];
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:1];
  id v2 = [*(id *)(a1 + 32) undoStateHUD];
  [v2 setAlpha:0.0];
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:0];
  id v2 = [*(id *)(a1 + 32) undoStateHUDTopConstraint];
  [v2 setConstant:31.0];

  [*(id *)(a1 + 32) clearUndoStateHUDDismissTimer];
  if (!*(unsigned char *)(a1 + 40))
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v3, "set_mimicShiftBeingHeld:", 0);
  }
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_9(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) undoInteractiveHUD];
  [v2 setAlpha:v1];
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_10(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 32))
  {
    id v1 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v1, "set_mimicShiftBeingHeld:", 0);
  }
}

- (void)setUndoInteractiveHUDVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    self->_int64_t interactiveHUDMode = 0;
    [(UIUndoGestureInteraction *)self _createAndUpdateUndoInteractiveHUDIfNecessary];
    uint64_t v5 = [(UIUndoGestureInteraction *)self view];
    uint64_t v6 = +[_UIEditMenuSceneComponent sceneComponentForView:v5];
    [v6 dismissCurrentMenu];
  }
  [(UIUndoGestureInteraction *)self setUndoHUDType:0 visibility:v3];
}

- (void)setPasteConfirmationHUDVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    self->_int64_t interactiveHUDMode = 1;
    [(UIUndoGestureInteraction *)self _createAndUpdateUndoInteractiveHUDIfNecessary];
  }
  [(UIUndoGestureInteraction *)self setUndoHUDType:0 visibility:v3];
}

- (void)setUndoStateHUDVisibility:(BOOL)a3 withType:(int64_t)a4 available:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  if (![(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
  {
    if (v7)
    {
      [(UIUndoGestureInteraction *)self _createAndUpdateUndoStateHUDIfNecessary];
      double v9 = [(UIUndoGestureInteraction *)self undoStateHUD];
      [v9 updateUndoStateHUDControlType:a4 available:v5];
    }
    [(UIUndoGestureInteraction *)self setUndoHUDType:1 visibility:v7];
  }
}

- (void)touchUndoStateHUDDismissTimer
{
  BOOL v3 = [(UIUndoGestureInteraction *)self undoStateHUDDismissTimer];

  if (v3)
  {
    int v4 = [(UIUndoGestureInteraction *)self undoStateHUDDismissTimer];
    [(UIDelayedAction *)v4 touch];
  }
  else
  {
    int v4 = [[UIDelayedAction alloc] initWithTarget:self action:sel_undoStateHUDDismissTimerElaspsed_ userInfo:0 delay:2.0];
    -[UIUndoGestureInteraction setUndoStateHUDDismissTimer:](self, "setUndoStateHUDDismissTimer:");
  }
}

- (void)clearUndoStateHUDDismissTimer
{
  BOOL v3 = [(UIUndoGestureInteraction *)self undoStateHUDDismissTimer];
  [v3 cancel];

  [(UIUndoGestureInteraction *)self setUndoStateHUDDismissTimer:0];
}

- (void)undoStateHUDDismissTimerElaspsed:(id)a3
{
  if ([(UIUndoGestureInteraction *)self currentStateHUDVisible]
    && [(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
  {
    [(UIUndoGestureInteraction *)self touchUndoStateHUDDismissTimer];
  }
  else
  {
    [(UIUndoGestureInteraction *)self setUndoStateHUDVisibility:0 withType:0 available:1];
    id v4 = [(UIUndoGestureInteraction *)self undoStateHUDTopConstraint];
    [v4 setConstant:31.0];
  }
}

- (void)_removeGestureRecognizers
{
  BOOL v3 = [(UIUndoGestureInteraction *)self view];
  id v4 = [(UIUndoGestureInteraction *)self observerGesture];
  [v3 removeGestureRecognizer:v4];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v5 = [(UIUndoGestureInteraction *)self view];
    uint64_t v6 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    [v5 removeGestureRecognizer:v6];

    BOOL v7 = [(UIUndoGestureInteraction *)self view];
    int v8 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];
    [v7 removeGestureRecognizer:v8];

    double v9 = [(UIUndoGestureInteraction *)self view];
    double v10 = [(UIUndoGestureInteraction *)self threeFingerSlide];
    [v9 removeGestureRecognizer:v10];

    uint64_t v11 = [(UIUndoGestureInteraction *)self view];
    CGFloat v12 = [(UIUndoGestureInteraction *)self threeFingerLongPress];
    [v11 removeGestureRecognizer:v12];

    id v14 = [(UIUndoGestureInteraction *)self view];
    BOOL v13 = [(UIUndoGestureInteraction *)self threeFingerPinch];
    [v14 removeGestureRecognizer:v13];
  }
}

- (id)_undoManager
{
  id v2 = [(UIUndoGestureInteraction *)self currentResponder];
  BOOL v3 = [v2 undoManager];

  return v3;
}

- (unint64_t)privateEditingInteractionOptions
{
  uint64_t v2 = [(UIUndoGestureInteraction *)self currentResponder];
  if (!v2) {
    return 6;
  }
  BOOL v3 = (void *)v2;
  unint64_t v4 = 6;
  while (1)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([v3 editingInteractionConfiguration]) {
        uint64_t v5 = 6;
      }
      else {
        uint64_t v5 = 0;
      }
      v4 &= v5;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      break;
    }
    uint64_t v6 = [v3 nextResponder];

    BOOL v3 = (void *)v6;
    if (!v6) {
      return v4;
    }
  }

  return v4;
}

- (id)_undoManagerFlattenedGroupingInfo
{
  return 0;
}

- (BOOL)undoManagerOperationsUndoRedoAvailable
{
  if ([(UIUndoGestureInteraction *)self canUndo]) {
    return 1;
  }
  return [(UIUndoGestureInteraction *)self canRedo];
}

- (BOOL)undoManagerOperationsCutCopyPasteAvailable
{
  if ([(UIUndoGestureInteraction *)self canCut] || [(UIUndoGestureInteraction *)self canCopy]) {
    return 1;
  }
  return [(UIUndoGestureInteraction *)self canPaste];
}

- (BOOL)textEditingOperationsAvailableWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  if (![(UIUndoGestureInteraction *)self editingInteractionOptionsAllowGestureRecognizerToBegin:v4])goto LABEL_9; {
  id v5 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
  }

  uint64_t v6 = self;
  if (v5 == v4) {
    goto LABEL_13;
  }
  id v7 = [(UIUndoGestureInteraction *)self threeFingerLongPress];

  if (v7 == v4)
  {
    if ([(UIUndoGestureInteraction *)self interactiveHUDIsVisible])
    {
LABEL_9:
      BOOL v12 = 0;
      goto LABEL_16;
    }
    uint64_t v6 = self;
LABEL_13:
    if ([(UIUndoGestureInteraction *)v6 undoManagerOperationsUndoRedoAvailable])
    {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  uint64_t v8 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];
  if ((id)v8 == v4)
  {

    goto LABEL_11;
  }
  double v9 = (void *)v8;
  id v10 = [(UIUndoGestureInteraction *)self threeFingerSlide];

  if (v10 == v4)
  {
LABEL_11:
    BOOL v13 = [(UIUndoGestureInteraction *)self undoManagerOperationsUndoRedoAvailable];
LABEL_15:
    BOOL v12 = v13;
    goto LABEL_16;
  }
  id v11 = [(UIUndoGestureInteraction *)self threeFingerPinch];

  if (v11 == v4)
  {
LABEL_14:
    BOOL v13 = [(UIUndoGestureInteraction *)self undoManagerOperationsCutCopyPasteAvailable];
    goto LABEL_15;
  }
LABEL_7:
  BOOL v12 = 1;
LABEL_16:

  return v12;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = +[UIWindowScene _keyWindowScene]();
  uint64_t v6 = [v5 _visibleWindows];

  id v7 = [(UIUndoGestureInteraction *)self view];
  uint64_t v8 = [v7 window];

  if (v6 && [v6 count] && objc_msgSend(v6, "containsObject:", v8))
  {
    id v9 = [(UIUndoGestureInteraction *)self observerGesture];

    if (v9 == v4) {
      BOOL v10 = [(UIUndoGestureInteraction *)self currentInteractiveHUDVisible];
    }
    else {
      BOOL v10 = [(UIUndoGestureInteraction *)self textEditingOperationsAvailableWithGestureRecognizer:v4];
    }
    BOOL v11 = v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)iWorkFamily
{
  if (_MergedGlobals_1168 != -1) {
    dispatch_once(&_MergedGlobals_1168, &__block_literal_global_399);
  }
  uint64_t v2 = (void *)qword_1EB261FF0;
  return v2;
}

void __39__UIUndoGestureInteraction_iWorkFamily__block_invoke()
{
  v0 = (void *)qword_1EB261FF0;
  qword_1EB261FF0 = (uint64_t)&unk_1ED3F0B80;
}

- (BOOL)bundleIniWorkFamily:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend((id)objc_opt_class(), "iWorkFamily", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isEqualToString:v3])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
  if ((id)v8 == v6)
  {

    goto LABEL_7;
  }
  long long v9 = (void *)v8;
  id v10 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];

  if (v10 == v6)
  {
LABEL_7:
    int v15 = [v7 _isGestureType:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v15)
    {
      char v17 = isKindOfClass;
      v18 = _UIMainBundleIdentifier();
      char v19 = [(UIUndoGestureInteraction *)self bundleIniWorkFamily:v18];

      uint64_t v20 = [v7 numberOfTouchesRequired];
      uint64_t v21 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
      uint64_t v22 = [v21 numberOfTouchesRequired];

      if ((v17 & 1) == 0)
      {
        BOOL v14 = (v20 == v22) & ~v19;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  id v11 = [(UIUndoGestureInteraction *)self threeFingerSlide];

  if (v11 != v6 || ![v7 _isGestureType:8])
  {
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = [v7 minimumNumberOfTouches];
  BOOL v13 = [(UIUndoGestureInteraction *)self threeFingerSlide];
  BOOL v14 = v12 == [v13 minimumNumberOfTouches];

LABEL_10:
  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [(UIUndoGestureInteraction *)self threeFingerLongPress];
  if (v11 == v9)
  {
    id v4 = [(UIUndoGestureInteraction *)self threeFingerSlide];
    if (v4 == v10)
    {
      BOOL v16 = 1;
      id v4 = v10;
LABEL_21:

      goto LABEL_22;
    }
  }
  id v12 = [(UIUndoGestureInteraction *)self threeFingerSlide];
  if (v12 == v9)
  {
    int v17 = 0;
    int v18 = 0;
  }
  else
  {
    uint64_t v13 = [(UIUndoGestureInteraction *)self threeFingerSingleTap];
    if ((id)v13 == v9)
    {
      int v17 = 0;
      int v18 = 0;
      uint64_t v5 = v9;
    }
    else
    {
      uint64_t v5 = (void *)v13;
      uint64_t v14 = [(UIUndoGestureInteraction *)self threeFingerDoubleTap];
      if ((id)v14 == v9)
      {
        int v18 = 0;
        int v17 = 1;
        id v6 = v9;
      }
      else
      {
        id v6 = (void *)v14;
        id v15 = [(UIUndoGestureInteraction *)self threeFingerLongPress];
        if (v15 != v9)
        {

          BOOL v16 = 0;
          goto LABEL_18;
        }
        int v17 = 1;
        int v18 = 1;
      }
    }
  }
  id v19 = [(UIUndoGestureInteraction *)self threeFingerPinch];
  BOOL v16 = v19 == v10;

  if (v18)
  {

    if ((v17 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v17) {
LABEL_14:
  }

LABEL_15:
  if (v12 != v9) {

  }
LABEL_18:
  if (v11 == v9) {
    goto LABEL_21;
  }
LABEL_22:

  return v16;
}

- (void)touchMultiPansTimer
{
  id v3 = [(UIUndoGestureInteraction *)self multiPansTimer];

  if (v3)
  {
    id v4 = [(UIUndoGestureInteraction *)self multiPansTimer];
    [(UIDelayedAction *)v4 touch];
  }
  else
  {
    id v4 = [[UIDelayedAction alloc] initWithTarget:self action:sel_multiPansTimerElaspsed_ userInfo:0 delay:0.5];
    -[UIUndoGestureInteraction setMultiPansTimer:](self, "setMultiPansTimer:");
  }
}

- (void)clearMultiPansTimer
{
  [(UIUndoGestureInteraction *)self setPreviousRecognizedPanDirection:0];
  [(UIUndoGestureInteraction *)self setPanDownStateChangedCounter:0];
  id v3 = [(UIUndoGestureInteraction *)self multiPansTimer];
  [v3 cancel];

  [(UIUndoGestureInteraction *)self setMultiPansTimer:0];
}

- (void)multiPansTimerElaspsed:(id)a3
{
  [(UIUndoGestureInteraction *)self setPreviousRecognizedPanDirection:0];
  [(UIUndoGestureInteraction *)self setPanDownStateChangedCounter:0];
}

- (void)observerGestureHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
  LOBYTE(v5) = objc_msgSend(v10, "pointInside:withEvent:", 0, v7, v9);

  if ((v5 & 1) == 0 && [(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
  {
    [(UIUndoGestureInteraction *)self setUndoInteractiveHUDVisibility:0];
    id v11 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    [v11 logBlock:&__block_literal_global_56_6 domain:@"com.apple.keyboard.UIKit"];
  }
  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIUndoGestureInteraction_observerGestureHandler___block_invoke_2;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_after(v12, MEMORY[0x1E4F14428], block);
}

id __51__UIUndoGestureInteraction_observerGestureHandler___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"KeyboardEventType";
  v2[1] = @"Operation";
  v3[0] = @"TextEditing";
  v3[1] = @"Hide editing HUD";
  v2[2] = @"TriggerType";
  v3[2] = @"Tap to dismiss";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  return v0;
}

uint64_t __51__UIUndoGestureInteraction_observerGestureHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearMultiPinchTimer];
}

- (void)deactiveActiveKeysIfNeeded:(id)a3
{
  if ([a3 state] >= 3)
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    [v3 _deactiveActiveKeys];
  }
}

- (void)threeFingerSingleTap:(id)a3
{
  [(UIUndoGestureInteraction *)self deactiveActiveKeysIfNeeded:a3];
  [(UIUndoGestureInteraction *)self _threeFingerSingleTapAction];
}

- (void)_threeFingerSingleTapAction
{
  [(UIUndoGestureInteraction *)self currentTime];
  double v4 = v3;
  [(UIUndoGestureInteraction *)self lastTapTimestamp];
  double v6 = v4 - v5;
  if (v6 < 1.2
    && [(UIUndoGestureInteraction *)self currentStateHUDVisible]
    && ([(UIUndoGestureInteraction *)self undoStateHUD],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 controlType],
        v7,
        v8 == 1))
  {
    [(UIUndoGestureInteraction *)self threeFingerDoubleTapUndoAction];
    +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Undo" trigger:@"UndoHUDGestureDoubleTapShortHand"];
  }
  else
  {
    if (![(UIUndoGestureInteraction *)self currentInteractiveHUDVisible]
      && (![(UIUndoGestureInteraction *)self currentStateHUDVisible]
       || [(UIUndoGestureInteraction *)self currentStateHUDVisible]
       && (([(UIUndoGestureInteraction *)self undoStateHUD],
            dispatch_time_t v12 = objc_claimAutoreleasedReturnValue(),
            uint64_t v13 = [v12 controlType],
            v12,
            v6 >= 1.2)
         ? (BOOL v14 = v13 == 1)
         : (BOOL v14 = 0),
           v14)))
    {
      [(UIUndoGestureInteraction *)self setUndoInteractiveHUDVisibility:1];
      double v9 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      id v10 = v9;
      id v11 = &__block_literal_global_60_0;
    }
    else
    {
      double v9 = [MEMORY[0x1E4FA8AA0] sharedInstance];
      id v10 = v9;
      id v11 = &__block_literal_global_62_1;
    }
    [v9 logBlock:v11 domain:@"com.apple.keyboard.UIKit"];
  }
  [(UIUndoGestureInteraction *)self currentTime];
  -[UIUndoGestureInteraction setLastTapTimestamp:](self, "setLastTapTimestamp:");
}

id __55__UIUndoGestureInteraction__threeFingerSingleTapAction__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"KeyboardEventType";
  v2[1] = @"Operation";
  v3[0] = @"TextEditing";
  v3[1] = @"Show editing HUD";
  v2[2] = @"TriggerType";
  v3[2] = @"Three finger tap gesture";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  return v0;
}

id __55__UIUndoGestureInteraction__threeFingerSingleTapAction__block_invoke_2()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"KeyboardEventType";
  v2[1] = @"Operation";
  v3[0] = @"TextEditing";
  v3[1] = @"Editing HUD already shown";
  v2[2] = @"TriggerType";
  v3[2] = @"Three finger tap gesture";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  return v0;
}

- (void)threeFingerDoubleTapUndoAction
{
  [(UIUndoGestureInteraction *)self setUndoStateHUDVisibility:1 withType:1 available:[(UIUndoGestureInteraction *)self canUndo]];
  [(UIUndoGestureInteraction *)self undo:0];
  [(UIUndoGestureInteraction *)self currentTime];
  -[UIUndoGestureInteraction setLastTapTimestamp:](self, "setLastTapTimestamp:");
}

- (void)threeFingerDoubleTap:(id)a3
{
  [(UIUndoGestureInteraction *)self deactiveActiveKeysIfNeeded:a3];
  [(UIUndoGestureInteraction *)self threeFingerDoubleTapUndoAction];
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Undo" trigger:@"UndoHUDGestureDoubleTap"];
}

- (void)threeFingerSlide:(id)a3
{
  id v7 = a3;
  [(UIUndoGestureInteraction *)self deactiveActiveKeysIfNeeded:v7];
  if ([v7 state] == 1) {
    [(UIUndoGestureInteraction *)self disableEnclosingScrollViewScrolling];
  }
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    [(UIUndoGestureInteraction *)self _endPan:v7];
    goto LABEL_10;
  }
  if (v4 == 2)
  {
    [(UIUndoGestureInteraction *)self _updateUndoPan:v7];
    goto LABEL_10;
  }
  BOOL v5 = v4 == 1;
  double v6 = v7;
  if (v5)
  {
    [(UIUndoGestureInteraction *)self _startUndoPan:v7];
LABEL_10:
    double v6 = v7;
  }
}

- (void)threeFingerLongPress:(id)a3
{
  [(UIUndoGestureInteraction *)self deactiveActiveKeysIfNeeded:a3];
  if (![(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
  {
    [(UIUndoGestureInteraction *)self setUndoInteractiveHUDVisibility:1];
  }
}

- (void)clearMultiPinchTimer
{
  if ([(UIUndoGestureInteraction *)self multiPinchTimerOn]) {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_tooSlow_ object:0];
  }
  [(UIUndoGestureInteraction *)self setMultiPinchTimerOn:0];
}

- (void)startMultiPinchTimer:(double)a3
{
  [(UIUndoGestureInteraction *)self clearMultiPinchTimer];
  [(UIUndoGestureInteraction *)self setMultiPinchTimerOn:1];
  [(UIUndoGestureInteraction *)self performSelector:sel_tooSlow_ withObject:0 afterDelay:a3];
}

- (void)threeFingerPinch:(id)a3
{
  id v4 = a3;
  [(UIUndoGestureInteraction *)self deactiveActiveKeysIfNeeded:v4];
  if ([v4 state] == 1) {
    [(UIUndoGestureInteraction *)self disableEnclosingScrollViewScrolling];
  }
  switch([v4 state])
  {
    case 1:
      [(UIUndoGestureInteraction *)self _startPinch:v4];
      break;
    case 2:
      [(UIUndoGestureInteraction *)self _updatePinch:v4];
      break;
    case 3:
      [(UIUndoGestureInteraction *)self _endPinch:v4];
      break;
    case 4:
    case 5:
      [(UIUndoGestureInteraction *)self _cancelPinch:v4];
      break;
    default:
      break;
  }
}

- (id)interactiveHUDButtonForDirection:(int64_t)a3
{
  double v3 = 0;
  switch(a3)
  {
    case 2:
      BOOL v5 = [(UIUndoGestureInteraction *)self isRTLMode];
      double v6 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_3;
    case 3:
      BOOL v8 = [(UIUndoGestureInteraction *)self isRTLMode];
      double v6 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
      if (v8)
      {
LABEL_5:
        uint64_t v7 = [v6 leftButtonView];
      }
      else
      {
LABEL_3:
        uint64_t v7 = [v6 rightButtonView];
      }
      goto LABEL_9;
    case 8:
      double v6 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
      uint64_t v7 = [v6 aCopyButtonView];
      goto LABEL_9;
    case 9:
      double v6 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
      uint64_t v7 = [v6 aCutButtonView];
      goto LABEL_9;
    case 10:
      double v6 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
      uint64_t v7 = [v6 aPasteButtonView];
LABEL_9:
      double v3 = (void *)v7;

      break;
    default:
      break;
  }
  return v3;
}

- (void)_startPinch:(id)a3
{
  [a3 avgTouchesToCentroidDistance];
  -[UIUndoGestureInteraction setInitPinchableDistance:](self, "setInitPinchableDistance:");
}

- (void)_updatePinch:(id)a3
{
  id v4 = a3;
  if ([(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
  {
    -[UIUndoGestureInteraction setPotentialPinchDirection:](self, "setPotentialPinchDirection:", [v4 pinchDirection]);
    [v4 avgTouchesToCentroidDistance];
    double v6 = v5;
    if ([(UIUndoGestureInteraction *)self multiPinchTimerOn])
    {
      uint64_t v7 = 9;
    }
    else
    {
      [(UIUndoGestureInteraction *)self initPinchableDistance];
      if (v6 <= v8) {
        uint64_t v7 = 8;
      }
      else {
        uint64_t v7 = 10;
      }
    }
    [(UIUndoGestureInteraction *)self setPotentialPinchDirection:v7];
    if ([(UIUndoGestureInteraction *)self potentialPinchDirection])
    {
      if (![(UIUndoGestureInteraction *)self currentInteractiveHUDVisible]
        || (-[UIUndoGestureInteraction interactiveHUDButtonForDirection:](self, "interactiveHUDButtonForDirection:", -[UIUndoGestureInteraction potentialPinchDirection](self, "potentialPinchDirection")), double v9 = objc_claimAutoreleasedReturnValue(), v10 = [v9 state], v9, v10 != 2))
      {
        [(UIUndoGestureInteraction *)self initPinchableDistance];
        double v12 = vabdd_f64(v6, v11);
        [(UIUndoGestureInteraction *)self initPinchableDistance];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __41__UIUndoGestureInteraction__updatePinch___block_invoke;
        v14[3] = &unk_1E52D9CD0;
        v14[4] = self;
        v14[5] = fmin(v12 / (v13 * 0.1), 1.0);
        +[UIView animateWithDuration:v14 animations:0.2];
      }
    }
  }
}

void __41__UIUndoGestureInteraction__updatePinch___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) undoInteractiveHUD];
  objc_msgSend(v2, "updateControlWithDirection:travelProgress:isRTL:", objc_msgSend(*(id *)(a1 + 32), "potentialPinchDirection"), objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), *(double *)(a1 + 40));
}

- (void)_endPinch:(id)a3
{
  uint64_t v4 = [a3 pinchDirection];
  [(UIUndoGestureInteraction *)self _endPinchWithDirection:v4];
}

- (void)_endPinchWithDirection:(int64_t)a3
{
  if (![(UIUndoGestureInteraction *)self currentInteractiveHUDVisible]
    || ([(UIUndoGestureInteraction *)self interactiveHUDButtonForDirection:a3],
        double v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 state],
        v5,
        v6 != 2))
  {
    if (a3 == 8)
    {
      [(UIUndoGestureInteraction *)self setUndoStateHUDVisibility:1 withType:[(UIUndoGestureInteraction *)self undoControlTypeWithDirection:8] available:[(UIUndoGestureInteraction *)self performActionWithDirection:8]];
      if (![(UIUndoGestureInteraction *)self multiPinchTimerOn])
      {
        [(UIUndoGestureInteraction *)self startMultiPinchTimer:2.0];
        a3 = 8;
LABEL_13:
        [(UIUndoGestureInteraction *)self fullyOpenAndCloseCoverWithBeginDirection:a3];
        if (![(UIUndoGestureInteraction *)self multiPinchTimerOn])
        {
          [(UIUndoGestureInteraction *)self setInitPinchableDistance:0.0];
          [(UIUndoGestureInteraction *)self setPotentialPinchDirection:0];
        }
        return;
      }
      [(UIUndoGestureInteraction *)self clearMultiPinchTimer];
      a3 = 9;
      BOOL v7 = [(UIUndoGestureInteraction *)self performActionWithDirection:9];
      double v8 = self;
      int64_t v9 = 9;
LABEL_8:
      [(UIUndoGestureInteraction *)self setUndoStateHUDVisibility:1 withType:[(UIUndoGestureInteraction *)v8 undoControlTypeWithDirection:v9] available:v7];
      goto LABEL_13;
    }
    [(UIUndoGestureInteraction *)self clearMultiPinchTimer];
    if (a3)
    {
      BOOL v7 = [(UIUndoGestureInteraction *)self performActionWithDirection:a3];
      double v8 = self;
      int64_t v9 = a3;
      goto LABEL_8;
    }
  }
  [(UIUndoGestureInteraction *)self fullyCloseCoverWithComplete:0];
}

- (void)_cancelPinch:(id)a3
{
  [(UIUndoGestureInteraction *)self fullyCloseCoverWithComplete:0];
  if (![(UIUndoGestureInteraction *)self multiPinchTimerOn])
  {
    [(UIUndoGestureInteraction *)self setInitPinchableDistance:0.0];
    [(UIUndoGestureInteraction *)self setPotentialPinchDirection:0];
    if ([(UIUndoGestureInteraction *)self undoStateHUDIsAnimating])
    {
      void v4[4] = self;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __41__UIUndoGestureInteraction__cancelPinch___block_invoke;
      v5[3] = &unk_1E52D9F70;
      v5[4] = self;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __41__UIUndoGestureInteraction__cancelPinch___block_invoke_2;
      v4[3] = &unk_1E52DC3A0;
      +[UIView animateWithDuration:v5 animations:v4 completion:0.2];
    }
  }
}

void __41__UIUndoGestureInteraction__cancelPinch___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 112) setConstant:0.0];
  id v2 = [*(id *)(a1 + 32) undoStateHUD];
  double v3 = [v2 undoStateHUDWidthConstraint];
  [v3 setConstant:0.0];

  uint64_t v4 = [*(id *)(a1 + 32) undoStateHUD];
  double v5 = [v4 undoStateHUDHeightConstraint];
  [v5 setConstant:0.0];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 layoutIfNeeded];
}

uint64_t __41__UIUndoGestureInteraction__cancelPinch___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUndoStateHUDIsAnimating:0];
}

- (int64_t)slideDirectionWithGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(UIUndoGestureInteraction *)self view];
  [v4 translationInView:v5];
  double v7 = v6;

  double v8 = fabs(v7);
  int64_t v9 = 2;
  if (v7 > 0.0) {
    int64_t v9 = 3;
  }
  if (v8 >= 5.0) {
    return v9;
  }
  else {
    return 0;
  }
}

- (BOOL)undoGestureIsMoving:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = objc_msgSend(a3, "_allActiveTouches", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) phase] == 2)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (id)scrollViewForInputDelegate
{
  id v2 = +[UIKeyboardImpl activeInstance];
  double v3 = [v2 inputDelegate];

  if (v3
    || (+[UIKeyboardImpl activeInstance],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 delegateAsResponder],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v3 _scroller];
      goto LABEL_10;
    }
    if ([v3 conformsToProtocol:&unk_1ED42F658]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v6 = [v3 textInputView];
      double v7 = v6;
      if (v6)
      {
        uint64_t v5 = [v6 _scroller];
      }
      else
      {
        uint64_t v5 = 0;
      }

      goto LABEL_10;
    }
  }
  uint64_t v5 = 0;
LABEL_10:

  return v5;
}

- (void)disableEnclosingScrollViewScrolling
{
  id v2 = [(UIUndoGestureInteraction *)self scrollViewForInputDelegate];
  if (v2)
  {
    id v4 = v2;
    double v3 = [v2 panGestureRecognizer];
    if ([v3 isEnabled])
    {
      [v3 setEnabled:0];
      [v3 setEnabled:1];
    }

    id v2 = v4;
  }
}

- (void)_startUndoPan:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIUndoGestureInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  -[UIUndoGestureInteraction setPreviousPanLocation:](self, "setPreviousPanLocation:", v7, v9);
  [(UIUndoGestureInteraction *)self setBeginPanDirection:0];
  [(UIUndoGestureInteraction *)self setPanDownStateChangedCounter:[(UIUndoGestureInteraction *)self panDownStateChangedCounter] + 1];
  long long v10 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__UIUndoGestureInteraction__startUndoPan___block_invoke;
  v12[3] = &unk_1E52DCC28;
  id v13 = v4;
  id v11 = v4;
  [v10 logBlock:v12 domain:@"com.apple.keyboard.UIKit"];
}

id __42__UIUndoGestureInteraction__startUndoPan___block_invoke(uint64_t a1)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"TextEditing";
  v4[0] = @"KeyboardEventType";
  v4[1] = @"Operation";
  id v1 = UIKBAnalyticsUndoPanForState([*(id *)(a1 + 32) state]);
  v4[2] = @"TriggerType";
  v5[1] = v1;
  v5[2] = @"Three finger pan gesture";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (void)_updateUndoPan:(id)a3
{
  id v4 = a3;
  if ([(UIUndoGestureInteraction *)self undoGestureIsMoving:v4])
  {
    uint64_t v5 = [(UIUndoGestureInteraction *)self view];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    int64_t v10 = [(UIUndoGestureInteraction *)self slideDirectionWithGesture:v4];
    if (v10)
    {
      int64_t v11 = v10;
      if (![(UIUndoGestureInteraction *)self beginPanDirection])
      {
        if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          [(UIUndoGestureInteraction *)self setRemainingDistanceToTravel:100.0];
          -[UIUndoGestureInteraction setPreviousPanLocation:](self, "setPreviousPanLocation:", v7, v9);
        }
        [(UIUndoGestureInteraction *)self setBeginPanDirection:v11];
      }
      if ([(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
      {
        long long v12 = [(UIUndoGestureInteraction *)self interactiveHUDButtonForDirection:[(UIUndoGestureInteraction *)self beginPanDirection]];
        uint64_t v13 = [v12 state];

        if (v13 != 2)
        {
          if ([(UIUndoGestureInteraction *)self beginPanDirection] == 2)
          {
            [(UIUndoGestureInteraction *)self previousPanLocation];
            double v15 = vabdd_f64(v7, v14);
            if (v11 != 3)
            {
              if (v11 != 2) {
                goto LABEL_23;
              }
              goto LABEL_16;
            }
LABEL_19:
            [(UIUndoGestureInteraction *)self remainingDistanceToTravel];
            double v18 = 100.0;
            if (v15 + v21 <= 100.0)
            {
              [(UIUndoGestureInteraction *)self remainingDistanceToTravel];
              double v18 = v15 + v22;
            }
            goto LABEL_21;
          }
          if ([(UIUndoGestureInteraction *)self beginPanDirection] != 3)
          {
            double v18 = 0.0;
            double v20 = 1.0;
LABEL_22:
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __43__UIUndoGestureInteraction__updateUndoPan___block_invoke;
            v24[3] = &unk_1E52D9CD0;
            v24[4] = self;
            *(double *)&void v24[5] = v20;
            +[UIView animateWithDuration:v24 animations:0.2];
            [(UIUndoGestureInteraction *)self setRemainingDistanceToTravel:v18];
            -[UIUndoGestureInteraction setPreviousPanLocation:](self, "setPreviousPanLocation:", v7, v9);
            v23 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
            [v23 layoutIfNeeded];

            goto LABEL_23;
          }
          [(UIUndoGestureInteraction *)self previousPanLocation];
          double v15 = vabdd_f64(v7, v16);
          if (v11 == 2) {
            goto LABEL_19;
          }
          if (v11 == 3)
          {
LABEL_16:
            [(UIUndoGestureInteraction *)self remainingDistanceToTravel];
            double v18 = 0.0;
            if (v17 - v15 >= 0.0)
            {
              [(UIUndoGestureInteraction *)self remainingDistanceToTravel];
              double v18 = v19 - v15;
            }
LABEL_21:
            double v20 = v18 / 100.0;
            goto LABEL_22;
          }
        }
      }
    }
  }
LABEL_23:
}

void __43__UIUndoGestureInteraction__updateUndoPan___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) undoInteractiveHUD];
  objc_msgSend(v2, "updateControlWithDirection:travelProgress:isRTL:", objc_msgSend(*(id *)(a1 + 32), "beginPanDirection"), objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 1.0 - *(double *)(a1 + 40));
}

- (void)_endPan:(id)a3
{
  id v10 = a3;
  if ([v10 state] == 3) {
    [(UIUndoGestureInteraction *)self clearMultiPinchTimer];
  }
  if ([(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
  {
    double v4 = 0.8;
    if ([(UIUndoGestureInteraction *)self beginPanDirection] == 2
      || [(UIUndoGestureInteraction *)self beginPanDirection] == 3)
    {
      uint64_t v5 = 0x4059000000000000;
    }
    else
    {
      if ([(UIUndoGestureInteraction *)self beginPanDirection] != 4
        && [(UIUndoGestureInteraction *)self beginPanDirection] != 5
        && [(UIUndoGestureInteraction *)self beginPanDirection] != 6)
      {
        double v6 = 0.0;
        double v4 = 0.0;
        if ([(UIUndoGestureInteraction *)self beginPanDirection] != 7) {
          goto LABEL_15;
        }
      }
      double v4 = 0.95;
      uint64_t v5 = 0x4049000000000000;
    }
    double v6 = *(double *)&v5;
LABEL_15:
    [(UIUndoGestureInteraction *)self remainingDistanceToTravel];
    double v8 = v7 / v6;
    int64_t v9 = [(UIUndoGestureInteraction *)self beginPanDirection];
    [(UIUndoGestureInteraction *)self remainingDistanceToTravel];
    -[UIUndoGestureInteraction animateSpringCoverWithSuccess:direction:remainingDistanceToTravel:](self, "animateSpringCoverWithSuccess:direction:remainingDistanceToTravel:", v8 < v4, v9);
    goto LABEL_16;
  }
  if ([v10 state] == 3) {
    [(UIUndoGestureInteraction *)self _endPanWithDirection:[(UIUndoGestureInteraction *)self beginPanDirection]];
  }
LABEL_16:
}

- (BOOL)_endPanWithDirection:(int64_t)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v5 = -[UIUndoGestureInteraction performActionWithDirection:](self, "performActionWithDirection:");
  int64_t v6 = [(UIUndoGestureInteraction *)self undoControlTypeWithDirection:a3];
  [(UIUndoGestureInteraction *)self setUndoStateHUDVisibility:1 withType:v6 available:v5];
  if (!v5) {
    return 0;
  }
  double v7 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__UIUndoGestureInteraction__endPanWithDirection___block_invoke;
  v9[3] = &__block_descriptor_40_e5__8__0l;
  v9[4] = v6;
  [v7 logBlock:v9 domain:@"com.apple.keyboard.UIKit"];

  return 1;
}

id __49__UIUndoGestureInteraction__endPanWithDirection___block_invoke(uint64_t a1)
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"TextEditing";
  v5[0] = @"KeyboardEventType";
  v5[1] = @"Operation";
  id v1 = UIKBAnalyticsOperationForControlType(*(void *)(a1 + 32));
  v6[1] = v1;
  v6[2] = @"Three finger pan gesture";
  v5[2] = @"TriggerType";
  v5[3] = @"GestureState";
  id v2 = _UIGestureRecognizerStateString(3uLL);
  v6[3] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:4];

  return v3;
}

- (int64_t)undoControlTypeWithDirection:(int64_t)a3
{
  int64_t result = 4;
  switch(a3)
  {
    case 2:
      if ([(UIUndoGestureInteraction *)self isRTLMode]) {
        int64_t result = 2;
      }
      else {
        int64_t result = 1;
      }
      break;
    case 3:
      if ([(UIUndoGestureInteraction *)self isRTLMode]) {
        int64_t result = 1;
      }
      else {
        int64_t result = 2;
      }
      break;
    case 8:
      return result;
    case 9:
      int64_t result = 3;
      break;
    case 10:
      int64_t result = 5;
      break;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (BOOL)performActionWithDirection:(int64_t)a3
{
  BOOL v3 = 0;
  switch(a3)
  {
    case 2:
      if (![(UIUndoGestureInteraction *)self isRTLMode]) {
        goto LABEL_5;
      }
      goto LABEL_3;
    case 3:
      if ([(UIUndoGestureInteraction *)self isRTLMode])
      {
LABEL_5:
        BOOL v3 = [(UIUndoGestureInteraction *)self canUndo];
        [(UIUndoGestureInteraction *)self undo:0];
        BOOL v5 = UIKBAnalyticsTextEditingOperationUndo;
      }
      else
      {
LABEL_3:
        BOOL v3 = [(UIUndoGestureInteraction *)self canRedo];
        [(UIUndoGestureInteraction *)self redo:0];
        BOOL v5 = UIKBAnalyticsTextEditingOperationRedo;
      }
      goto LABEL_9;
    case 8:
      BOOL v3 = [(UIUndoGestureInteraction *)self canCopy];
      [(UIUndoGestureInteraction *)self copyOperation];
      BOOL v5 = UIKBAnalyticsTextEditingOperationCopy;
      goto LABEL_9;
    case 9:
      BOOL v3 = [(UIUndoGestureInteraction *)self canCut];
      [(UIUndoGestureInteraction *)self cutOperation];
      BOOL v5 = UIKBAnalyticsTextEditingOperationCut;
      goto LABEL_9;
    case 10:
      BOOL v3 = [(UIUndoGestureInteraction *)self canPaste];
      [(UIUndoGestureInteraction *)self pasteOperation];
      BOOL v5 = UIKBAnalyticsTextEditingOperationPaste;
LABEL_9:
      +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:*v5 trigger:@"UndoHUDGesturePan"];
      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)performGestureWithDirection:(int64_t)a3
{
  return [(UIUndoGestureInteraction *)self performGestureWithDirection:a3 authenticationMessage:0];
}

- (BOOL)performGestureWithDirection:(int64_t)a3 authenticationMessage:(id)a4
{
  id v6 = a4;
  if (a3 != 1)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if ([(UIUndoGestureInteraction *)self undoManagerOperationsUndoRedoAvailable])
      {
        BOOL v7 = [(UIUndoGestureInteraction *)self _endPanWithDirection:a3];
        goto LABEL_16;
      }
    }
    else if ((a3 | 2) == 0xA {
           && [(UIUndoGestureInteraction *)self undoManagerOperationsCutCopyPasteAvailable])
    }
    {
      if (a3 == 10 && v6) {
        +[UIPasteboard _attemptAuthenticationWithMessage:v6];
      }
      [(UIUndoGestureInteraction *)self _endPinchWithDirection:a3];
      goto LABEL_5;
    }
LABEL_15:
    BOOL v7 = 0;
    goto LABEL_16;
  }
  if (![(UIUndoGestureInteraction *)self undoManagerOperationsUndoRedoAvailable]&& ![(UIUndoGestureInteraction *)self undoManagerOperationsCutCopyPasteAvailable])
  {
    goto LABEL_15;
  }
  [(UIUndoGestureInteraction *)self _threeFingerSingleTapAction];
LABEL_5:
  BOOL v7 = 1;
LABEL_16:

  return v7;
}

- (void)fullyOpenAndCloseCoverWithBeginDirection:(int64_t)a3
{
  void v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke;
  void v4[3] = &unk_1E52D9CD0;
  void v4[4] = self;
  void v4[5] = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke_2;
  v3[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:0 delay:v4 options:v3 animations:0.1 completion:0.0];
}

void __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  id v2 = *(void **)(a1 + 32);
  if (*(void *)(v3 + 8) == 10) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  BOOL v5 = [v2 undoInteractiveHUD];
  objc_msgSend(v5, "updateControlWithDirection:travelProgress:isRTL:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), v4);

  id v6 = [*(id *)(a1 + 32) undoInteractiveHUD];
  [v6 layoutIfNeeded];
}

uint64_t __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fullyCloseCoverWithComplete:0];
}

- (void)fullyCloseCoverWithComplete:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__UIUndoGestureInteraction_fullyCloseCoverWithComplete___block_invoke;
  v3[3] = &unk_1E52D9F70;
  void v3[4] = self;
  +[UIView animateWithDuration:0 delay:v3 options:a3 animations:0.1 completion:0.0];
}

void __56__UIUndoGestureInteraction_fullyCloseCoverWithComplete___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) undoInteractiveHUD];
  objc_msgSend(v2, "updateControlWithDirection:travelProgress:isRTL:", 2, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  uint64_t v3 = [*(id *)(a1 + 32) undoInteractiveHUD];
  objc_msgSend(v3, "updateControlWithDirection:travelProgress:isRTL:", 3, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  double v4 = [*(id *)(a1 + 32) undoInteractiveHUD];
  objc_msgSend(v4, "updateControlWithDirection:travelProgress:isRTL:", 8, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  BOOL v5 = [*(id *)(a1 + 32) undoInteractiveHUD];
  objc_msgSend(v5, "updateControlWithDirection:travelProgress:isRTL:", 9, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  id v6 = [*(id *)(a1 + 32) undoInteractiveHUD];
  objc_msgSend(v6, "updateControlWithDirection:travelProgress:isRTL:", 10, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 1.0);

  id v7 = [*(id *)(a1 + 32) undoInteractiveHUD];
  [v7 layoutIfNeeded];
}

- (void)animateSpringCoverWithSuccess:(BOOL)a3 direction:(int64_t)a4 remainingDistanceToTravel:(double)a5
{
  if (a3
    && ([(UIUndoGestureInteraction *)self performActionWithDirection:a4], a5 > 0.0))
  {
    [(UIUndoGestureInteraction *)self fullyOpenAndCloseCoverWithBeginDirection:a4];
  }
  else
  {
    -[UIUndoGestureInteraction fullyCloseCoverWithComplete:](self, "fullyCloseCoverWithComplete:", 0, a4, a5);
  }
}

- (BOOL)canUndo
{
  id v2 = [(UIUndoGestureInteraction *)self _undoManager];
  char v3 = [v2 canUndo];

  return v3;
}

- (BOOL)canRedo
{
  id v2 = [(UIUndoGestureInteraction *)self _undoManager];
  char v3 = [v2 canRedo];

  return v3;
}

- (void)_updateHUDControlState
{
  if ([(UIUndoGestureInteraction *)self currentInteractiveHUDVisible])
  {
    char v3 = +[UIKeyboardImpl activeInstance];
    [v3 setEditingTraitsMarkedDirty:1];

    id v4 = [(UIUndoGestureInteraction *)self undoInteractiveHUD];
    [v4 updateHUDControlState];
  }
}

- (void)undo:(BOOL)a3
{
  id v3 = [(UIUndoGestureInteraction *)self _undoManager];
  if ([v3 canUndo]) {
    [v3 undo];
  }
}

- (void)redo:(BOOL)a3
{
  id v3 = [(UIUndoGestureInteraction *)self _undoManager];
  if ([v3 canRedo]) {
    [v3 redo];
  }
}

- (id)responderForOperation:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  id v7 = [(UIUndoGestureInteraction *)self currentResponder];
  if (([v7 canPerformAction:a3 withSender:v6] & 1) == 0)
  {
    double v8 = [(id)UIApp _unswizzledTargetInChainForAction:a3 sender:v6];
    if (!v8) {
      goto LABEL_5;
    }

    id v7 = v8;
  }
  id v7 = v7;
  double v8 = v7;
LABEL_5:

  return v8;
}

- (UIKBTextEditingTraits)editingTraits
{
  id v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [(UIUndoGestureInteraction *)self currentResponder];
  BOOL v5 = [(UIKBTextEditingTraits *)self->_editingTraits firstResponder];

  id v6 = _UIMainBundleIdentifier();
  BOOL v7 = [(UIUndoGestureInteraction *)self bundleIniWorkFamily:v6];

  if (v4
    && (!self->_editingTraits
     || v5 != v4
     || !v3
     || ([v3 editingTraitsMarkedDirty] | v7) == 1))
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__UIUndoGestureInteraction_editingTraits__block_invoke;
    v12[3] = &unk_1E52FD0C8;
    void v12[4] = self;
    double v8 = +[UIKBTextEditingTraits traitsForEditingInteractionWithFirstResponder:v4 canRespondBlock:v12 keyMaskFlags:2];
    editingTraits = self->_editingTraits;
    self->_editingTraits = v8;

    if (v3 && self->_editingTraits) {
      [v3 setEditingTraitsMarkedDirty:0];
    }
  }
  id v10 = self->_editingTraits;

  return v10;
}

BOOL __41__UIUndoGestureInteraction_editingTraits__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) responderForOperation:a2 withSender:0x1ED1499A0];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canCut
{
  BOOL v3 = [(UIUndoGestureInteraction *)self editingTraits];
  if (v3)
  {
    id v4 = [(UIUndoGestureInteraction *)self editingTraits];
    char v5 = [v4 canCut];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canCopy
{
  BOOL v3 = [(UIUndoGestureInteraction *)self editingTraits];
  if (v3)
  {
    id v4 = [(UIUndoGestureInteraction *)self editingTraits];
    char v5 = [v4 canCopy];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canPaste
{
  BOOL v3 = [(UIUndoGestureInteraction *)self editingTraits];
  if (v3)
  {
    id v4 = [(UIUndoGestureInteraction *)self editingTraits];
    char v5 = [v4 canPaste];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)cutOperation
{
  BOOL v3 = [(UIUndoGestureInteraction *)self responderForOperation:sel_cut_ withSender:0x1ED1499A0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _dataOwnerForCopy];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__UIUndoGestureInteraction_cutOperation__block_invoke;
    v6[3] = &unk_1E52D9F70;
    id v7 = v4;
    +[UIPasteboard _performAsDataOwner:v5 block:v6];
  }
  [(UIUndoGestureInteraction *)self _updateHUDControlState];
}

uint64_t __40__UIUndoGestureInteraction_cutOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cut:*(void *)(a1 + 32)];
}

- (void)copyOperation
{
  BOOL v3 = [(UIUndoGestureInteraction *)self responderForOperation:sel_copy_ withSender:0x1ED1499A0];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 _dataOwnerForCopy];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__UIUndoGestureInteraction_copyOperation__block_invoke;
    v6[3] = &unk_1E52D9F70;
    id v7 = v4;
    +[UIPasteboard _performAsDataOwner:v5 block:v6];
  }
  [(UIUndoGestureInteraction *)self _updateHUDControlState];
}

uint64_t __41__UIUndoGestureInteraction_copyOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) copy:*(void *)(a1 + 32)];
}

- (void)pasteOperation
{
  id pasteConfirmationAction = self->_pasteConfirmationAction;
  if (pasteConfirmationAction)
  {
    id v4 = (void (**)(void))_Block_copy(pasteConfirmationAction);
    id v5 = self->_pasteConfirmationAction;
    self->_id pasteConfirmationAction = 0;

    v4[2](v4);
    [(UIUndoGestureInteraction *)self setPasteConfirmationHUDVisibility:0];
  }
  id v6 = [(UIUndoGestureInteraction *)self responderForOperation:sel_paste_ withSender:0x1ED1499A0];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 _dataOwnerForPaste];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__UIUndoGestureInteraction_pasteOperation__block_invoke;
    v9[3] = &unk_1E52D9F70;
    id v10 = v7;
    +[UIPasteboard _performAsDataOwner:v8 block:v9];
  }
  [(UIUndoGestureInteraction *)self _updateHUDControlState];
}

uint64_t __42__UIUndoGestureInteraction_pasteOperation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) paste:*(void *)(a1 + 32)];
}

+ (void)showSecurePasteConfirmationWithCompletionHandler:(id)a3
{
  BOOL v3 = (void *)UIApp;
  id v4 = a3;
  id v5 = [v3 keyWindow];
  id v9 = [v5 windowScene];

  id v6 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v9];
  id v7 = [v6 editingOverlayViewController];
  uint64_t v8 = [v7 undoInteraction];

  [v8 setPasteConfirmationAction:v4];
  [v8 setPasteConfirmationHUDVisibility:1];
}

+ (BOOL)_isKeyWindowSceneSessionRoleValidForTutorial
{
  id v2 = +[UIWindow _applicationKeyWindow];
  BOOL v3 = [v2 windowScene];
  id v4 = [v3 session];
  id v5 = [v4 role];

  if (v5) {
    int v6 = [v5 isEqualToString:@"SBSUIWindowSceneSessionRoleSystemNotes"] ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (void)presentProductivityGestureTutorialIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = _UIMainBundleIdentifier();
  int v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v7 = [v6 preferencesActions];
  if ([v7 oneTimeActionCompleted:*MEMORY[0x1E4FAE868]])
  {
  }
  else
  {
    char v8 = [v5 isEqualToString:@"com.apple.purplebuddy"];

    if ((v8 & 1) == 0 && [a1 _isKeyWindowSceneSessionRoleValidForTutorial])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__UIUndoGestureInteraction_presentProductivityGestureTutorialIfNeededWithCompletion___block_invoke;
      block[3] = &unk_1E52DA040;
      id v10 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_8;
    }
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_8:
}

void __85__UIUndoGestureInteraction_presentProductivityGestureTutorialIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  id v5 = [[UIUndoTutorialViewController alloc] initWithCompletionHandler:*(void *)(a1 + 32)];
  [(UIViewController *)v5 setModalPresentationStyle:5];
  id v1 = +[UIWindow _applicationKeyWindow];
  id v2 = [v1 rootViewController];
  [v2 presentViewController:v5 animated:(UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 completion:0];

  BOOL v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v4 = [v3 preferencesActions];
  [v4 didTriggerOneTimeAction:*MEMORY[0x1E4FAE868]];
}

+ (void)presentProductivityGestureTutorialInlineWithCompletion:(id)a3
{
  id v10 = (void (**)(void))a3;
  if (!+[UIKeyboard isOnScreen]
    || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || +[UIKeyboardImpl isFloating])
  {
    [(id)objc_opt_class() presentProductivityGestureTutorialIfNeededWithCompletion:v10];
    goto LABEL_5;
  }
  id v4 = _UIMainBundleIdentifier();
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int v6 = [v5 preferencesActions];
  uint64_t v7 = *MEMORY[0x1E4FAE868];
  if (([v6 oneTimeActionCompleted:*MEMORY[0x1E4FAE868]] & 1) == 0)
  {
    char v8 = [v4 isEqualToString:@"com.apple.purplebuddy"];

    if ((v8 & 1) != 0 || ![a1 _isKeyWindowSceneSessionRoleValidForTutorial]) {
      goto LABEL_13;
    }
    id v9 = +[UIKeyboardImpl activeInstance];
    [v9 presentEditingIntroductionView];

    id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    int v6 = [v5 preferencesActions];
    [v6 didTriggerOneTimeAction:v7];
  }

LABEL_13:
  if (v10) {
    v10[2]();
  }

LABEL_5:
}

- (void)setView:(id)a3
{
}

- (_UIKBProductivitySingleTapGesture)threeFingerSingleTap
{
  return self->_threeFingerSingleTap;
}

- (void)setThreeFingerSingleTap:(id)a3
{
}

- (_UIKBProductivityDoubleTapGesture)threeFingerDoubleTap
{
  return self->_threeFingerDoubleTap;
}

- (void)setThreeFingerDoubleTap:(id)a3
{
}

- (_UIKBProductivityPanGestureRecognizer)threeFingerSlide
{
  return self->_threeFingerSlide;
}

- (void)setThreeFingerSlide:(id)a3
{
}

- (_UIKBProductivityLongPressGestureRecognizer)threeFingerLongPress
{
  return self->_threeFingerLongPress;
}

- (void)setThreeFingerLongPress:(id)a3
{
}

- (_UIKBProductivityPinchGestureRecognizer)threeFingerPinch
{
  return self->_threeFingerPinch;
}

- (void)setThreeFingerPinch:(id)a3
{
}

- (void)setUndoInteractiveHUD:(id)a3
{
}

- (int64_t)interactiveHUDMode
{
  return self->_interactiveHUDMode;
}

- (void)setInteractiveHUDMode:(int64_t)a3
{
  self->_int64_t interactiveHUDMode = a3;
}

- (id)pasteConfirmationAction
{
  return self->_pasteConfirmationAction;
}

- (void)setPasteConfirmationAction:(id)a3
{
}

- (UIKBUndoStateHUD)undoStateHUD
{
  return self->_undoStateHUD;
}

- (void)setUndoStateHUD:(id)a3
{
}

- (NSLayoutConstraint)undoStateHUDTopConstraint
{
  return self->_undoStateHUDTopConstraint;
}

- (void)setUndoStateHUDTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)undoStateHUDCenterConstraint
{
  return self->_undoStateHUDCenterConstraint;
}

- (void)setUndoStateHUDCenterConstraint:(id)a3
{
}

- (NSLayoutConstraint)undoHUDContainerWidthConstraint
{
  return self->_undoHUDContainerWidthConstraint;
}

- (void)setUndoHUDContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)undoHUDContainerHeightConstraint
{
  return self->_undoHUDContainerHeightConstraint;
}

- (void)setUndoHUDContainerHeightConstraint:(id)a3
{
}

- (UIDelayedAction)undoStateHUDDismissTimer
{
  return self->_undoStateHUDDismissTimer;
}

- (void)setUndoStateHUDDismissTimer:(id)a3
{
}

- (int64_t)currentAppearance
{
  return self->_currentAppearance;
}

- (void)setCurrentAppearance:(int64_t)a3
{
  self->_currentAppearance = a3;
}

- (CGRect)currentActuallSceneBounds
{
  double x = self->_currentActuallSceneBounds.origin.x;
  double y = self->_currentActuallSceneBounds.origin.y;
  double width = self->_currentActuallSceneBounds.size.width;
  double height = self->_currentActuallSceneBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentActuallSceneBounds:(CGRect)a3
{
  self->_currentActuallSceneBounds = a3;
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (BOOL)interactiveHUDIsVisible
{
  return self->_interactiveHUDIsVisible;
}

- (void)setInteractiveHUDIsVisible:(BOOL)a3
{
  self->_interactiveHUDIsVisible = a3;
}

- (int64_t)previousRecognizedPanDirection
{
  return self->_previousRecognizedPanDirection;
}

- (void)setPreviousRecognizedPanDirection:(int64_t)a3
{
  self->_previousRecognizedPanDirection = a3;
}

- (UIDelayedAction)multiPansTimer
{
  return self->_multiPansTimer;
}

- (void)setMultiPansTimer:(id)a3
{
}

- (double)remainingDistanceToTravel
{
  return self->_remainingDistanceToTravel;
}

- (void)setRemainingDistanceToTravel:(double)a3
{
  self->_remainingDistanceToTravel = a3;
}

- (CGPoint)previousPanLocation
{
  double x = self->_previousPanLocation.x;
  double y = self->_previousPanLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviousPanLocation:(CGPoint)a3
{
  self->_previousPanLocation = a3;
}

- (CGPoint)beginPanLocation
{
  double x = self->_beginPanLocation.x;
  double y = self->_beginPanLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBeginPanLocation:(CGPoint)a3
{
  self->_beginPanLocation = a3;
}

- (int64_t)beginPanDirection
{
  return self->_beginPanDirection;
}

- (void)setBeginPanDirection:(int64_t)a3
{
  self->_beginPanDirection = a3;
}

- (unint64_t)panDownStateChangedCounter
{
  return self->_panDownStateChangedCounter;
}

- (void)setPanDownStateChangedCounter:(unint64_t)a3
{
  self->_panDownStateChangedCounter = a3;
}

- (BOOL)undoStateHUDIsAnimating
{
  return self->_undoStateHUDIsAnimating;
}

- (void)setUndoStateHUDIsAnimating:(BOOL)a3
{
  self->_undoStateHUDIsAnimating = a3;
}

- (double)lastTapTimestamp
{
  return self->_lastTapTimestamp;
}

- (void)setLastTapTimestamp:(double)a3
{
  self->_lastTapTimestamp = a3;
}

- (BOOL)multiPinchTimerOn
{
  return self->_multiPinchTimerOn;
}

- (void)setMultiPinchTimerOn:(BOOL)a3
{
  self->_multiPinchTimerOn = a3;
}

- (double)initPinchableDistance
{
  return self->_initPinchableDistance;
}

- (void)setInitPinchableDistance:(double)a3
{
  self->_initPinchableDistance = a3;
}

- (double)previousPinchPerimeter
{
  return self->_previousPinchPerimeter;
}

- (void)setPreviousPinchPerimeter:(double)a3
{
  self->_previousPinchPerimeter = a3;
}

- (int64_t)potentialPinchDirection
{
  return self->_potentialPinchDirection;
}

- (void)setPotentialPinchDirection:(int64_t)a3
{
  self->_potentialPinchDirection = a3;
}

- (void)setEditingTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingTraits, 0);
  objc_storeStrong((id *)&self->_multiPansTimer, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_undoStateHUDDismissTimer, 0);
  objc_storeStrong((id *)&self->_undoHUDContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_undoHUDContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_undoStateHUDCenterConstraint, 0);
  objc_storeStrong((id *)&self->_undoStateHUDTopConstraint, 0);
  objc_storeStrong((id *)&self->_undoStateHUD, 0);
  objc_storeStrong(&self->_pasteConfirmationAction, 0);
  objc_storeStrong((id *)&self->_undoInteractiveHUD, 0);
  objc_storeStrong((id *)&self->_threeFingerPinch, 0);
  objc_storeStrong((id *)&self->_threeFingerLongPress, 0);
  objc_storeStrong((id *)&self->_threeFingerSlide, 0);
  objc_storeStrong((id *)&self->_threeFingerDoubleTap, 0);
  objc_storeStrong((id *)&self->_threeFingerSingleTap, 0);
  objc_storeStrong((id *)&self->_observerGesture, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end