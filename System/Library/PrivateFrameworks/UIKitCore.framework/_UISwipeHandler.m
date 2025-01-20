@interface _UISwipeHandler
- ($A7B7FA971CD029BAA4A09478E9E1AEDA)currentSwipeConfig;
- ($B18736ADBBD355D2E16F2B3CA0B0347D)_currentSwipeInfoWithTargetOffset:(SEL)a3 animated:(double)a4 usingSpringWithStiffness:(BOOL)a5;
- (BOOL)_delegateWantsToDismissOnTouchDownForGestureRecognizer:(id)a3;
- (BOOL)_swipeRecognizerBegan:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gestureRecognizerShouldDismissForTouchUp:(id)a3;
- (BOOL)isActive;
- (BOOL)isInteracting;
- (UISwipeActionController)swipeController;
- (_UIStatesFeedbackGenerator)swipeFeedbackGenerator;
- (_UISwipeHandler)initWithSwipeController:(id)a3;
- (unint64_t)_directionForGestureRecognizer:(id)a3;
- (unint64_t)currentSwipeState;
- (void)_cancelExistingSwipe;
- (void)_cancelExistingSwipeForGestureBeganIfNecessary:(id)a3;
- (void)_dismissalRecognizerDidRecognize:(id)a3;
- (void)_moveSwipedItemToOffset:(double)a3 animated:(BOOL)a4 usingSpringWithStiffness:(double)a5 isTracking:(BOOL)a6;
- (void)_setUp;
- (void)_swipeRecognizerChanged:(id)a3;
- (void)_swipeRecognizerDidRecognize:(id)a3;
- (void)_swipeRecognizerEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)dealloc;
- (void)initiateSwipeWithDirection:(unint64_t)a3 configuration:(id)a4 location:(CGPoint)a5 userInitiated:(BOOL)a6;
- (void)resetSwipe;
- (void)setActive:(BOOL)a3;
- (void)setSwipeController:(id)a3;
- (void)setSwipeFeedbackGenerator:(id)a3;
@end

@implementation _UISwipeHandler

- (void)resetSwipe
{
  self->_resetSwipeWhileInitiating = 1;
  self->_initialTranslation = 0.0;
  self->_confirmationTranslationAdjustment = 0.0;
  *(_OWORD *)&self->_currentSwipeConfig.direction = 0u;
  *(_OWORD *)&self->_currentSwipeConfig.openThreshold = 0u;
  self->_currentSwipeState = 0;
  [(UIGestureRecognizer *)self->_dismissalGestureRecognizer setEnabled:0];
}

- (_UISwipeHandler)initWithSwipeController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISwipeHandler;
  v5 = [(_UISwipeHandler *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(_UISwipeHandler *)v5 setSwipeController:v4];
    [(_UISwipeHandler *)v6 _setUp];
  }

  return v6;
}

- (void)setSwipeController:(id)a3
{
}

- (void)_setUp
{
  v3 = [[_UISwipeActionPanGestureRecognizer alloc] initWithTarget:self action:sel__swipeRecognizerDidRecognize_];
  swipeActionPanRecognizer = self->_swipeActionPanRecognizer;
  self->_swipeActionPanRecognizer = v3;

  [(UIPanGestureRecognizer *)self->_swipeActionPanRecognizer setDelegate:self];
  [(UIPanGestureRecognizer *)self->_swipeActionPanRecognizer _setCanPanVertically:0];
  [(UIPanGestureRecognizer *)self->_swipeActionPanRecognizer _setHysteresis:25.0];
  [(UIGestureRecognizer *)self->_swipeActionPanRecognizer setAllowedTouchTypes:&unk_1ED3F1258];
  v5 = [(_UISwipeHandler *)self swipeController];
  v6 = [v5 swipeActionHost];
  v7 = [(_UISwipeHandler *)self swipeController];
  id v14 = [v6 gestureRecognizerViewForSwipeActionController:v7];

  [v14 addGestureRecognizer:self->_swipeActionPanRecognizer];
  objc_super v8 = [[_UISwipeDismissalGestureRecognizer alloc] initWithTarget:self action:sel__dismissalRecognizerDidRecognize_];
  dismissalGestureRecognizer = self->_dismissalGestureRecognizer;
  self->_dismissalGestureRecognizer = v8;

  [(UIGestureRecognizer *)self->_dismissalGestureRecognizer setDelegate:self];
  [(UIGestureRecognizer *)self->_dismissalGestureRecognizer setEnabled:0];
  [v14 addGestureRecognizer:self->_dismissalGestureRecognizer];
  v10 = [_UIStatesFeedbackGenerator alloc];
  v11 = +[_UIStatesFeedbackGeneratorSwipeActionConfiguration defaultConfiguration];
  v12 = [(_UIStatesFeedbackGenerator *)v10 initWithConfiguration:v11 view:v14];
  swipeFeedbackGenerator = self->_swipeFeedbackGenerator;
  self->_swipeFeedbackGenerator = v12;

  self->_active = 1;
}

- (UISwipeActionController)swipeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_swipeController);
  return (UISwipeActionController *)WeakRetained;
}

- (void)dealloc
{
  v3 = [(UIGestureRecognizer *)self->_swipeActionPanRecognizer view];
  [v3 removeGestureRecognizer:self->_swipeActionPanRecognizer];

  id v4 = [(UIGestureRecognizer *)self->_dismissalGestureRecognizer view];
  [v4 removeGestureRecognizer:self->_dismissalGestureRecognizer];

  v5.receiver = self;
  v5.super_class = (Class)_UISwipeHandler;
  [(_UISwipeHandler *)&v5 dealloc];
}

- (BOOL)isInteracting
{
  UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self->_swipeActionPanRecognizer state];
  if (v3 != UIGestureRecognizerStateBegan) {
    LOBYTE(v3) = [(UIGestureRecognizer *)self->_swipeActionPanRecognizer state] == UIGestureRecognizerStateChanged;
  }
  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v6 = (_UISwipeActionPanGestureRecognizer *)a4;
  if (self->_dismissalGestureRecognizer == a3)
  {
    objc_super v8 = [(_UISwipeHandler *)self swipeController];
    v9 = [v8 containerView];

    if (self->_swipeActionPanRecognizer == v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      v10 = [(UIGestureRecognizer *)v6 view];
      BOOL v7 = v10 == v9;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (_UISwipeActionPanGestureRecognizer *)a3;
  objc_super v5 = [(UIGestureRecognizer *)v4 view];
  [(UIPanGestureRecognizer *)v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  if (self->_swipeActionPanRecognizer == v4)
  {
    unint64_t v12 = [(_UISwipeHandler *)self _directionForGestureRecognizer:v4];

    v13 = [(_UISwipeHandler *)self swipeController];
    char v14 = objc_msgSend(v13, "swipeHandler:mayBeginSwipeAtLocation:withProposedDirection:", self, v12, v7, v9);

    return v14;
  }
  else
  {
    dismissalGestureRecognizer = self->_dismissalGestureRecognizer;

    if (dismissalGestureRecognizer == (_UISwipeDismissalGestureRecognizer *)v4)
    {
      uint64_t v15 = [(_UISwipeHandler *)self swipeController];
      char v16 = objc_msgSend((id)v15, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 1, v7, v9);

      v17 = [(_UISwipeHandler *)self swipeController];
      LOBYTE(v15) = objc_msgSend(v17, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 0, v7, v9);

      return v15 | v16;
    }
    else
    {
      return 1;
    }
  }
}

- (BOOL)gestureRecognizerShouldDismissForTouchUp:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(_UISwipeHandler *)self swipeController];
  LOBYTE(v4) = objc_msgSend(v10, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 1, v7, v9);

  return (char)v4;
}

- (void)_dismissalRecognizerDidRecognize:(id)a3
{
  if ([a3 state] == 3 && self->_currentSwipeConfig.direction)
  {
    [(_UISwipeHandler *)self _cancelExistingSwipe];
  }
}

- (unint64_t)_directionForGestureRecognizer:(id)a3
{
  if (_UISwipeActionGestureRecognizerEffectiveVelocity(a3) < 0.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)_swipeRecognizerDidRecognize:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke;
  aBlock[3] = &unk_1E52FC080;
  aBlock[4] = self;
  id v5 = v4;
  id v13 = v5;
  double v6 = (unsigned int (**)(void))_Block_copy(aBlock);
  switch([v5 state])
  {
    case 1:
      *(unsigned char *)&self->_flags &= 0xFCu;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48___UISwipeHandler__swipeRecognizerDidRecognize___block_invoke_2;
      block[3] = &unk_1E52DA040;
      v11 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);

      break;
    case 2:
      if (v6[2](v6)) {
        [(_UISwipeHandler *)self _swipeRecognizerChanged:v5];
      }
      break;
    case 3:
      if (v6[2](v6))
      {
        double v7 = self;
        id v8 = v5;
        uint64_t v9 = 0;
        goto LABEL_7;
      }
      break;
    case 4:
      if (v6[2](v6))
      {
        double v7 = self;
        id v8 = v5;
        uint64_t v9 = 1;
LABEL_7:
        [(_UISwipeHandler *)v7 _swipeRecognizerEnded:v8 wasCancelled:v9];
      }
      break;
    default:
      break;
  }
}

- (BOOL)_swipeRecognizerBegan:(id)a3
{
  id v4 = a3;
  [(_UISwipeHandler *)self _cancelExistingSwipeForGestureBeganIfNecessary:v4];
  unint64_t direction = self->_currentSwipeConfig.direction;
  double v6 = [(_UISwipeHandler *)self swipeController];
  double v7 = [v6 currentSwipeOccurrence];

  if (direction && v7)
  {
    if (([v7 state] & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      BOOL v8 = 0;
      goto LABEL_10;
    }
  }
  else if (!direction)
  {
    unint64_t v9 = [(_UISwipeHandler *)self _directionForGestureRecognizer:v4];
    v10 = [v4 view];
    [v4 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    -[_UISwipeHandler initiateSwipeWithDirection:configuration:location:userInitiated:](self, "initiateSwipeWithDirection:configuration:location:userInitiated:", v9, 0, 1, v12, v14);
  }
  if (self->_currentSwipeConfig.direction)
  {
    uint64_t v15 = [(_UISwipeHandler *)self swipeController];
    [v15 swipeHandlerDidBeginSwipe:self];

    char v16 = [(_UISwipeHandler *)self swipeFeedbackGenerator];
    [v16 activateWithCompletionBlock:0];

    [(UIGestureRecognizer *)self->_dismissalGestureRecognizer setEnabled:0];
  }
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (void)_swipeRecognizerChanged:(id)a3
{
  id v4 = a3;
  if (!self->_currentSwipeConfig.direction) {
    goto LABEL_42;
  }
  id v53 = v4;
  double v5 = _UISwipeActionGestureRecognizerEffectiveTranslation(v4);
  unint64_t v6 = -[UIPanGestureRecognizer _scrollDeviceCategory](v53) - 1;
  if (v6 <= 2) {
    double v5 = v5 / dbl_186B9D2F0[v6] * fabs(self->_currentSwipeConfig.confirmationThreshold);
  }
  double v7 = v5 + self->_initialTranslation + self->_confirmationTranslationAdjustment;
  BOOL v8 = [v53 view];
  [v53 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = _UISwipeActionGestureRecognizerEffectiveVelocity(v53);
  double confirmationThreshold = self->_currentSwipeConfig.confirmationThreshold;
  double v15 = -confirmationThreshold;
  if (confirmationThreshold >= 0.0) {
    double v15 = self->_currentSwipeConfig.confirmationThreshold;
  }
  if (v15 > 0.0)
  {
    BOOL primaryActionCanBeTriggeredBySwipe = self->_currentSwipeConfig.primaryActionCanBeTriggeredBySwipe;
    if (!primaryActionCanBeTriggeredBySwipe) {
      goto LABEL_21;
    }
    unint64_t direction = self->_currentSwipeConfig.direction;
    if (direction == 2 && confirmationThreshold <= v7)
    {
      uint64_t v18 = 0;
      BOOL primaryActionCanBeTriggeredBySwipe = 1;
LABEL_11:
      unint64_t v19 = 1;
      goto LABEL_23;
    }
    if (direction == 1 && confirmationThreshold >= v7) {
      goto LABEL_15;
    }
    BOOL primaryActionCanBeTriggeredBySwipe = self->_currentSwipeConfig.primaryActionIsDestructive;
    if (primaryActionCanBeTriggeredBySwipe)
    {
      v20 = [(_UISwipeHandler *)self swipeController];
      v21 = [v20 swipeActionHost];
      v22 = [(_UISwipeHandler *)self swipeController];
      v23 = [v21 itemContainerViewForSwipeActionController:v22];
      unint64_t v24 = self->_currentSwipeConfig.direction;
      double v25 = self->_currentSwipeConfig.confirmationThreshold;
      id v26 = v23;
      [v26 frame];
      double Width = CGRectGetWidth(v55);
      id v28 = v26;
      [v28 frame];
      double v29 = CGRectGetWidth(v56);
      if (v29 >= 414.0)
      {
        v39 = [v28 traitCollection];
        BOOL v40 = [v39 userInterfaceIdiom] == 6;

        double v30 = dbl_186B9D2E0[v40];
      }
      else if (v29 == 375.0)
      {
        double v30 = 75.0;
      }
      else
      {
        double v30 = 50.0;
      }

      if (v24 == 1)
      {
        BOOL v41 = v30 > v10;
      }
      else
      {
        [v28 frame];
        BOOL v41 = v42 - v30 < v10;
      }
      double v43 = -v13;
      if (v13 >= 0.0) {
        double v43 = v13;
      }
      double v44 = 0.66;
      if (Width >= 414.0) {
        double v44 = 0.5;
      }
      double v45 = fmax(v44, v43 / 2500.0);
      double v46 = 0.8;
      if (Width >= 414.0) {
        double v46 = 0.75;
      }
      double v47 = fmin(v45, v46);
      double v48 = -v7;
      if (v7 >= 0.0) {
        double v48 = v7;
      }
      double v49 = -v25;
      if (v25 >= 0.0) {
        double v49 = v25;
      }
      double v50 = v48 - v49 * v47;

      if (v50 > 0.00000011920929 && v41)
      {
        if (self->_confirmationTranslationAdjustment == 0.0)
        {
          double v52 = self->_currentSwipeConfig.confirmationThreshold - v7;
          self->_confirmationTranslationAdjustment = v52;
          double v7 = v7 + v52;
          uint64_t v18 = 1;
          BOOL primaryActionCanBeTriggeredBySwipe = 1;
          goto LABEL_11;
        }
LABEL_15:
        uint64_t v18 = 0;
        unint64_t v19 = 1;
        BOOL primaryActionCanBeTriggeredBySwipe = 1;
        goto LABEL_23;
      }
      uint64_t v18 = 0;
      BOOL primaryActionCanBeTriggeredBySwipe = 0;
    }
    else
    {
LABEL_21:
      uint64_t v18 = 0;
    }
    unint64_t v19 = 0;
LABEL_23:
    unint64_t currentSwipeState = self->_currentSwipeState;
    if (currentSwipeState != v19)
    {
      if (primaryActionCanBeTriggeredBySwipe)
      {
        v32 = &_UIStatesFeedbackGeneratorSwipeActionStateConfirm;
LABEL_28:
        v33 = [(_UISwipeHandler *)self swipeFeedbackGenerator];
        objc_msgSend(v33, "transitionToState:ended:atLocation:", *v32, 1, v10, v12);

        goto LABEL_29;
      }
      if (currentSwipeState == 1)
      {
        v32 = _UIStatesFeedbackGeneratorSwipeActionStateOpen;
        goto LABEL_28;
      }
    }
LABEL_29:
    self->_unint64_t currentSwipeState = v19;
    double confirmationThreshold = self->_currentSwipeConfig.confirmationThreshold;
    goto LABEL_30;
  }
  uint64_t v18 = 0;
LABEL_30:
  if (!self->_currentSwipeConfig.primaryActionCanBeTriggeredBySwipe) {
    double confirmationThreshold = self->_currentSwipeConfig.openThreshold;
  }
  if (confirmationThreshold <= 0.0) {
    double v34 = confirmationThreshold;
  }
  else {
    double v34 = 0.0;
  }
  double v35 = fmax(confirmationThreshold, 0.0);
  if (v7 <= v35)
  {
    if (v7 < v34)
    {
      double v37 = v7 - v34;
      if (v7 - v34 < 0.0) {
        double v37 = -(v7 - v34);
      }
      float v38 = v37;
      double v7 = v34 - powf(v38, 0.7);
    }
  }
  else
  {
    float v36 = v7 - v35;
    double v7 = v35 + powf(v36, 0.7);
  }
  [(_UISwipeHandler *)self _moveSwipedItemToOffset:v18 animated:1 usingSpringWithStiffness:v7 isTracking:1.0];
  id v4 = v53;
LABEL_42:
}

- (void)_swipeRecognizerEnded:(id)a3 wasCancelled:(BOOL)a4
{
  if (self->_currentSwipeConfig.direction)
  {
    self->_confirmationTranslationAdjustment = 0.0;
    id v6 = a3;
    double v7 = _UISwipeActionGestureRecognizerEffectiveVelocity(v6);
    double v8 = _UISwipeActionGestureRecognizerEffectiveTranslation(v6);
    uint64_t v9 = -[UIPanGestureRecognizer _scrollDeviceCategory](v6);

    if ((unint64_t)(v9 - 1) <= 2) {
      double v8 = v8 / dbl_186B9D2F0[v9 - 1] * fabs(self->_currentSwipeConfig.confirmationThreshold);
    }
    if (!a4 && self->_currentSwipeState == 1)
    {
      self->_unint64_t currentSwipeState = 2;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
      [(_UISwipeHandler *)self _currentSwipeInfoWithTargetOffset:1 animated:0.0 usingSpringWithStiffness:1.0];
      double v10 = [(_UISwipeHandler *)self swipeController];
      long long v18 = v21;
      long long v19 = v22;
      long long v20 = v23;
      [v10 swipeHandler:self didConfirmSwipeWithInfo:&v18];
LABEL_19:

LABEL_20:
      v17 = [(_UISwipeHandler *)self swipeFeedbackGenerator];
      [v17 deactivate];

      return;
    }
    double openThreshold = self->_currentSwipeConfig.openThreshold;
    double v12 = -openThreshold;
    if (openThreshold >= 0.0) {
      double v12 = self->_currentSwipeConfig.openThreshold;
    }
    if (v12 > 0.0)
    {
      double v13 = -v7;
      if (v7 >= 0.0) {
        double v13 = v7;
      }
      unint64_t direction = self->_currentSwipeConfig.direction;
      if (v13 <= 50.0)
      {
        double v15 = v8 + self->_initialTranslation;
        double v16 = openThreshold * 0.5;
        if (direction == 1)
        {
          if (v15 >= v16) {
            goto LABEL_18;
          }
        }
        else if (v15 <= v16)
        {
          goto LABEL_18;
        }
LABEL_25:
        [(_UISwipeHandler *)self _moveSwipedItemToOffset:1 animated:0 usingSpringWithStiffness:self->_currentSwipeConfig.openThreshold isTracking:1.0];
        [(UIGestureRecognizer *)self->_dismissalGestureRecognizer setEnabled:1];
        self->_initialTranslation = openThreshold;
        goto LABEL_20;
      }
      if (direction == 1)
      {
        if (v7 < -50.0) {
          goto LABEL_25;
        }
      }
      else if (v7 > 50.0)
      {
        goto LABEL_25;
      }
    }
LABEL_18:
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    [(_UISwipeHandler *)self _currentSwipeInfoWithTargetOffset:1 animated:0.0 usingSpringWithStiffness:1.0];
    double v10 = [(_UISwipeHandler *)self swipeController];
    long long v18 = v21;
    long long v19 = v22;
    long long v20 = v23;
    [v10 swipeHandler:self didGenerateSwipeWithInfo:&v18 isTracking:0];
    goto LABEL_19;
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[UIGestureRecognizer setEnabled:](self->_swipeActionPanRecognizer, "setEnabled:");
    if (!self->_active)
    {
      dismissalGestureRecognizer = self->_dismissalGestureRecognizer;
      [(UIGestureRecognizer *)dismissalGestureRecognizer setEnabled:0];
    }
  }
}

- (void)initiateSwipeWithDirection:(unint64_t)a3 configuration:(id)a4 location:(CGPoint)a5 userInitiated:(BOOL)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a4;
  double v12 = [(_UISwipeHandler *)self swipeController];
  objc_msgSend(v12, "prepareForSwipeDirection:startingAtTouchLocation:", a3, x, y);

  self->_resetSwipeWhileInitiating = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  double v13 = [(_UISwipeHandler *)self swipeController];
  double v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "configureForSwipeDirection:configuration:startingAtTouchLocation:", a3, v11, x, y);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
  }

  if (self->_resetSwipeWhileInitiating)
  {
    if (a6) {
      goto LABEL_10;
    }
  }
  else
  {
    *(_OWORD *)&self->_currentSwipeConfig.unint64_t direction = v15;
    *(_OWORD *)&self->_currentSwipeConfig.double openThreshold = v16;
    if (a6) {
      goto LABEL_10;
    }
  }
  if (self->_currentSwipeConfig.direction)
  {
    [(UIGestureRecognizer *)self->_dismissalGestureRecognizer setEnabled:1];
    self->_initialTranslation = self->_currentSwipeConfig.openThreshold;
  }
LABEL_10:
}

- (void)_cancelExistingSwipeForGestureBeganIfNecessary:(id)a3
{
  id v4 = a3;
  [(_UISwipeHandler *)self currentSwipeConfig];
  if (v5
    && [(_UISwipeHandler *)self _delegateWantsToDismissOnTouchDownForGestureRecognizer:v4])
  {
    [(_UISwipeHandler *)self _cancelExistingSwipe];
  }
}

- (void)_cancelExistingSwipe
{
  id v3 = [(_UISwipeHandler *)self swipeController];
  v2 = [v3 currentSwipeOccurrence];
  if (([v2 state] & 0xFFFFFFFFFFFFFFFELL) != 4) {
    [v3 resetSwipedItemAnimated:1 completion:0];
  }
}

- (BOOL)_delegateWantsToDismissOnTouchDownForGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(_UISwipeHandler *)self swipeController];
  LOBYTE(v4) = objc_msgSend(v10, "touchAtLocationShouldDismissSwipedItem:isTouchUp:", 0, v7, v9);

  return (char)v4;
}

- ($A7B7FA971CD029BAA4A09478E9E1AEDA)currentSwipeConfig
{
  long long v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var3 = v3;
  return self;
}

- ($B18736ADBBD355D2E16F2B3CA0B0347D)_currentSwipeInfoWithTargetOffset:(SEL)a3 animated:(double)a4 usingSpringWithStiffness:(BOOL)a5
{
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var2 = a5;
  unint64_t currentSwipeState = self->_currentSwipeState;
  retstr->var0 = self->_currentSwipeConfig.direction;
  retstr->var1 = currentSwipeState;
  id v11 = [(_UISwipeHandler *)self swipeController];
  double v12 = [(_UISwipeHandler *)self swipeController];
  double v13 = [v12 swipedIndexPath];
  id v32 = [v11 _swipedViewForItemAtIndexPath:v13];

  if (v32)
  {
    double v14 = [(_UISwipeHandler *)self swipeController];
    [v14 swipeHandlerRestingFrame:self];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v34.origin.double x = v16;
    v34.origin.double y = v18;
    v34.size.width = v20;
    v34.size.height = v22;
    double v23 = 0.0;
    if (!CGRectIsNull(v34))
    {
      v35.origin.double x = v16;
      v35.origin.double y = v18;
      v35.size.width = v20;
      v35.size.height = v22;
      double v24 = CGRectGetMidX(v35) + a4;
      double v25 = _UISwipeActionGestureRecognizerEffectiveVelocity(self->_swipeActionPanRecognizer);
      id v26 = [v32 layer];
      v27 = [v26 presentationLayer];
      [v27 position];
      double v29 = v28;

      double v30 = -(v24 - v29);
      if (v24 - v29 >= 0.0) {
        double v30 = v24 - v29;
      }
      if (v30 > 0.00000011920929) {
        double v23 = fmax(fmin(v25 / (v24 - v29), 200.0), 0.0);
      }
    }
    retstr->var3 = a4;
    retstr->var4 = v23;
    retstr->var5 = a6;
  }

  return result;
}

- (void)_moveSwipedItemToOffset:(double)a3 animated:(BOOL)a4 usingSpringWithStiffness:(double)a5 isTracking:(BOOL)a6
{
  BOOL v6 = a6;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  [(_UISwipeHandler *)self _currentSwipeInfoWithTargetOffset:a4 animated:a3 usingSpringWithStiffness:a5];
  double v8 = [(_UISwipeHandler *)self swipeController];
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  [v8 swipeHandler:self didGenerateSwipeWithInfo:v9 isTracking:v6];
}

- (unint64_t)currentSwipeState
{
  return self->_currentSwipeState;
}

- (_UIStatesFeedbackGenerator)swipeFeedbackGenerator
{
  return self->_swipeFeedbackGenerator;
}

- (void)setSwipeFeedbackGenerator:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_swipeController);
  objc_storeStrong((id *)&self->_swipeFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_swipeActionPanRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalGestureRecognizer, 0);
}

@end