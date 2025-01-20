@interface UIScrollToDismissSupport
- (BOOL)isFinishingDismissTransition;
- (CGRect)addPaddingToFrame:(CGRect)a3 inView:(id)a4;
- (id)_infoForMatchMove;
- (id)cancelNotificationsForMode:(unint64_t)a3;
- (void)_updateKeyboardLayoutGuideForScrollTransitionWithSize:(CGSize)a3 hostFrame:(CGRect)a4 duration:(double)a5;
- (void)completeKeyboardDismiss:(unint64_t)a3 withDuration:(double)a4;
- (void)completedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5;
- (void)finishScrollViewTransition;
- (void)finishScrollViewTransitionForController:(id)a3;
- (void)hideScrollViewHorizontalScrollIndicator:(BOOL)a3;
- (void)scrollView:(id)a3 didFinishPanGesture:(id)a4;
- (void)scrollView:(id)a3 didPanWithGesture:(id)a4;
- (void)setInterfaceAutorotationDisabled:(BOOL)a3 forController:(id)a4;
- (void)updateScrollViewContentInsetBottom:(double)a3;
@end

@implementation UIScrollToDismissSupport

- (BOOL)isFinishingDismissTransition
{
  return self->_scrollViewTransitionFinishing;
}

- (void)updateScrollViewContentInsetBottom:(double)a3
{
  if ([(UIScrollView *)self->_scrollViewForTransition updateInsetBottomDuringKeyboardDismiss])
  {
    [(UIScrollView *)self->_scrollViewForTransition contentInset];
    scrollViewForTransition = self->_scrollViewForTransition;
    -[UIScrollView setContentInset:](scrollViewForTransition, "setContentInset:");
  }
}

- (void)hideScrollViewHorizontalScrollIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    p_scrollViewForTransition = &self->_scrollViewForTransition;
    if (![(UIScrollView *)self->_scrollViewForTransition showsHorizontalScrollIndicator])return; {
    self->_scrollViewShowsHorizontalScrollIndicator = 1;
    }
  }
  else
  {
    if (!self->_scrollViewShowsHorizontalScrollIndicator) {
      return;
    }
    self->_scrollViewShowsHorizontalScrollIndicator = 0;
    p_scrollViewForTransition = &self->_scrollViewForTransition;
  }
  v6 = *p_scrollViewForTransition;
  [(UIScrollView *)v6 setShowsHorizontalScrollIndicator:!v3];
}

- (void)finishScrollViewTransition
{
  self->_scrollViewTransitionFinishing = 0;
  [(UISplitKeyboardSource *)self->super._controller setInterfaceAutorotationDisabled:0];
  [(UIScrollToDismissSupport *)self hideScrollViewHorizontalScrollIndicator:0];
  scrollViewNotificationInfo = self->_scrollViewNotificationInfo;
  self->_scrollViewNotificationInfo = 0;

  scrollViewForTransition = self->_scrollViewForTransition;
  self->_scrollViewForTransition = 0;
}

- (void)setInterfaceAutorotationDisabled:(BOOL)a3 forController:(id)a4
{
  BOOL v4 = a3;
  v6 = (UISplitKeyboardSource *)a4;
  if (self->super._controller == v6)
  {
    interfaceAutorotationDisabledAssertion = self->_interfaceAutorotationDisabledAssertion;
    if (interfaceAutorotationDisabledAssertion) {
      LODWORD(interfaceAutorotationDisabledAssertion) = [(BSSimpleAssertion *)interfaceAutorotationDisabledAssertion isValid];
    }
    if (!v4 || (interfaceAutorotationDisabledAssertion & 1) != 0)
    {
      if (!v4 && ((interfaceAutorotationDisabledAssertion ^ 1) & 1) == 0)
      {
        [(BSSimpleAssertion *)self->_interfaceAutorotationDisabledAssertion invalidate];
        v21 = self->_interfaceAutorotationDisabledAssertion;
        self->_interfaceAutorotationDisabledAssertion = 0;
      }
    }
    else
    {
      v8 = [(UIView *)self->_scrollViewForTransition window];
      v9 = v8;
      if (v8)
      {
        [v8 beginDisablingInterfaceAutorotation];
        unint64_t v10 = 0x1E4F29000uLL;
        v11 = NSString;
        v12 = self;
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = [v11 stringWithFormat:@"<%@: %p>", v14, v12];

        if (v6)
        {
          v16 = NSString;
          v17 = v6;
          v18 = (objc_class *)objc_opt_class();
          v19 = NSStringFromClass(v18);
          v20 = [v16 stringWithFormat:@"<%@: %p>", v19, v17];

          unint64_t v10 = 0x1E4F29000;
        }
        else
        {
          v20 = @"(nil)";
        }
        v22 = *(void **)(v10 + 24);
        v23 = v12;
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [v22 stringWithFormat:@"<%@: %p>", v25, v23];

        objc_msgSend(v11, "stringWithFormat:", @"Scroll to dismiss disabling autorotation for window on behalf of controller. scrollToDismiss=%@; controller=%@; window=%@",
          v15,
          v20,
        v27 = v26);

        objc_initWeak(&location, v9);
        id v28 = objc_alloc(MEMORY[0x1E4F4F838]);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __75__UIScrollToDismissSupport_setInterfaceAutorotationDisabled_forController___block_invoke;
        v31[3] = &unk_1E52E04F8;
        objc_copyWeak(&v32, &location);
        v29 = (BSSimpleAssertion *)[v28 initWithIdentifier:@"UIScrollToDismissSupport.windowDisableInterfaceAutorotation" forReason:v27 invalidationBlock:v31];
        v30 = self->_interfaceAutorotationDisabledAssertion;
        self->_interfaceAutorotationDisabledAssertion = v29;

        objc_destroyWeak(&v32);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __75__UIScrollToDismissSupport_setInterfaceAutorotationDisabled_forController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained endDisablingInterfaceAutorotation];
}

- (void)finishScrollViewTransitionForController:(id)a3
{
  if (self->super._controller == a3) {
    [(UIScrollToDismissSupport *)self finishScrollViewTransition];
  }
}

- (void)completedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  v7 = (UISplitKeyboardSource *)a5;
  v8 = v7;
  if (self->super._controller == v7)
  {
    v14 = v7;
    id v9 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(UIScrollToDismissSupport *)self finishScrollViewTransition];
      v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v12 = [v11 responder];
      if ([v12 _requiresKeyboardWhenFirstResponder]
        && !+[UIKeyboard isKeyboardProcess])
      {
        if (+[UIKeyboard usesInputSystemUI]) {
          [v11 _setIgnoresPinning:1 allowImmediateReload:0];
        }
        [v12 resignFirstResponder];
        if (+[UIKeyboard usesInputSystemUI]) {
          [v11 _setIgnoresPinning:0 allowImmediateReload:0];
        }
      }
    }
    else
    {
      BOOL v13 = +[UIKeyboard isKeyboardProcess];
      v8 = v14;
      if (!v13) {
        goto LABEL_13;
      }
      [(UISplitKeyboardSource *)v14 removeMatchMoveAnimationIfNeeded];
    }
    v8 = v14;
  }
LABEL_13:
}

- (id)cancelNotificationsForMode:(unint64_t)a3
{
  scrollViewNotificationInfo = self->_scrollViewNotificationInfo;
  if (scrollViewNotificationInfo)
  {
    BOOL v4 = scrollViewNotificationInfo;
  }
  else
  {
    BOOL v4 = [(UISplitKeyboardSource *)self->super._controller constructNotificationInfoForScrollWithMode:a3];
  }
  v5 = v4;
  v6 = [(UIInputViewSetNotificationInfo *)v4 inverseInfo];

  return v6;
}

- (void)completeKeyboardDismiss:(unint64_t)a3 withDuration:(double)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  self->_scrollViewTransitionFinishing = 1;
  [(UISplitKeyboardSource *)self->super._controller positionConstraintConstant];
  v8 = +[_UIInputViewSetPlacementDragToDismiss placementWithOffset:a3 & 1 dismissKeyboardOnly:v7];
  id v9 = [(UISplitKeyboardSource *)self->super._controller placement];
  unint64_t v10 = v9;
  if (a3)
  {
    int v11 = [v9 accessoryViewWillAppear];
    v12 = off_1E52D3B58;
    if (v11) {
      v12 = off_1E52D3B28;
    }
  }
  else
  {
    if (!a3) {
      goto LABEL_8;
    }
    v12 = off_1E52D3B58;
  }
  uint64_t v13 = [(__objc2_class *)*v12 placement];

  unint64_t v10 = (void *)v13;
LABEL_8:
  [(UIScrollToDismissSupport *)self hideScrollViewHorizontalScrollIndicator:1];
  v14 = (void *)MEMORY[0x1E4F1CA60];
  v24[0] = @"_UIScrollKeyboardPlacementFrom";
  v24[1] = @"_UIScrollKeyboardPlacementTo";
  v25[0] = v8;
  v25[1] = v10;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v16 = [v14 dictionaryWithDictionary:v15];

  if (a4 == 0.0)
  {
    [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo duration];
    a4 = v17;
  }
  else
  {
    v18 = [NSNumber numberWithDouble:a4];
    [v16 setObject:v18 forKey:@"_UIScrollKeyboardDuration"];
  }
  if (self->_scrollViewNotificationInfo
    && +[UIKeyboard usesInputSystemUI])
  {
    v19 = [(UIScrollToDismissSupport *)self _infoForMatchMove];
    [v16 addEntriesFromDictionary:v19];
  }
  -[UIScrollToDismissSupport _updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:](self, "_updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), a4);
  v20 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __65__UIScrollToDismissSupport_completeKeyboardDismiss_withDuration___block_invoke;
  v22[3] = &unk_1E52FC280;
  id v23 = v16;
  id v21 = v16;
  [v20 performOnDistributedControllers:v22];
}

uint64_t __65__UIScrollToDismissSupport_completeKeyboardDismiss_withDuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 completeTransition:@"_UIScrollKeyboard" withInfo:*(void *)(a1 + 32)];
}

- (void)scrollView:(id)a3 didPanWithGesture:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[UIKeyboardImpl activeInstance];
  if ([v9 displaysCandidates])
  {
    unint64_t v10 = [v9 candidateController];
    if (([v10 activeCandidateViewType] & 4) == 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    uint64_t v11 = [v8 state];

    if (v11 == 1)
    {
      unint64_t v10 = +[UIKeyboardImpl activeInstance];
      [v10 removeAutocorrectPromptAndCandidateList];
      goto LABEL_5;
    }
  }
LABEL_6:
  v12 = [(UISplitKeyboardSource *)self->super._controller placement];
  if (![v12 showsKeyboard]
    || [(UISplitKeyboardSource *)self->super._controller isChangingPlacement])
  {

    goto LABEL_9;
  }
  uint64_t v13 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  int v14 = [v13 keyboardActive];

  if (!v14) {
    goto LABEL_9;
  }
  char v15 = 1;
  uint64_t v16 = 3;
  switch([v7 keyboardDismissMode])
  {
    case 1:
      break;
    case 2:
      char v15 = 0;
      uint64_t v16 = 5;
      break;
    case 3:
      uint64_t v16 = 2;
      break;
    case 4:
      char v15 = 0;
      uint64_t v16 = 4;
      break;
    default:
      uint64_t v16 = 0;
      char v15 = 1;
      break;
  }
  double v17 = [(UISplitKeyboardSource *)self->super._controller placement];
  if (([v17 inputViewWillAppear] & 1) == 0)
  {

    goto LABEL_9;
  }
  v18 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
  [v18 inputView];

  uint64_t v19 = [v8 numberOfTouches];
  v20 = [(UISplitKeyboardSource *)self->super._controller view];
  if (v19) {
    [v8 locationOfTouch:0 inView:v20];
  }
  else {
    [v8 locationInView:v20];
  }
  CGFloat v23 = v21;
  double v24 = v22;

  if ([v8 state] == 1)
  {
    v25 = +[UIKeyboardImpl activeInstance];
    [v25 clearAnimations];

    v26 = +[UIKeyboardImpl activeInstance];
    [v26 removeTextChoicePromptAndAutocorrection];

    v27 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v28 = [v27 containerRootController];
    [v28 clearKeyboardSnapshot];

    if (self->_scrollViewForTransition) {
      [(UIScrollToDismissSupport *)self finishScrollViewTransition];
    }
  }
  if ((v16 & 2) != 0)
  {
    if (!self->_scrollViewForTransition) {
      goto LABEL_45;
    }
  }
  else
  {
    v29 = [(UISplitKeyboardSource *)self->super._controller hostView];
    [v29 frame];
    -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v7);
    v69.x = v23;
    v69.y = v24;
    if (CGRectContainsPoint(v70, v69))
    {
      scrollViewForTransition = self->_scrollViewForTransition;

      if (!scrollViewForTransition)
      {
LABEL_45:
        v57 = [(UISplitKeyboardSource *)self->super._controller constructNotificationInfoForScrollWithMode:v16];
        scrollViewNotificationInfo = self->_scrollViewNotificationInfo;
        self->_scrollViewNotificationInfo = v57;

        if (self->_scrollViewNotificationInfo)
        {
          objc_storeStrong((id *)&self->_scrollViewForTransition, a3);
          [(UISplitKeyboardSource *)self->super._controller setInterfaceAutorotationDisabled:1];
          [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo beginFrame];
          -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v7);
          [(UIScrollToDismissSupport *)self updateScrollViewContentInsetBottom:v24 - CGRectGetMinY(v71)];
          self->_scrollViewTransitionPreviousPoint.x = v23;
          self->_scrollViewTransitionPreviousPoint.y = v24;
          v59 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
          v60 = [v59 inputAccessoryView];

          if (v60)
          {
            v61 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v61 postNotificationName:@"UITextSelectionWillInteractiveMove" object:0];
          }
          if ((v16 & 2) != 0) {
            [(UIScrollToDismissSupport *)self completeKeyboardDismiss:v16 withDuration:0.0];
          }
        }
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  if (self->_scrollViewForTransition) {
    char v31 = v15;
  }
  else {
    char v31 = 1;
  }
  if ((v31 & 1) == 0)
  {
    CGFloat v66 = v23;
    [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo beginFrame];
    double v62 = v32;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v7);
    double v40 = v39;
    [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo endFrame];
    double v42 = v41;
    double v44 = v43;
    -[UIScrollToDismissSupport addPaddingToFrame:inView:](self, "addPaddingToFrame:inView:", v7);
    double v64 = v24;
    double v65 = v45;
    double v46 = v24 - v40;
    double v47 = v42 - v40;
    double v63 = fmin(fmax(v46 / v47, 0.0), 1.0);
    [(UIScrollToDismissSupport *)self hideScrollViewHorizontalScrollIndicator:v63 > 0.01];
    double v48 = fmax(v46, 0.0);
    if (v47 > v48) {
      double v47 = v48;
    }
    -[UIScrollToDismissSupport _updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:](self, "_updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:", v44, v38 - v47, v62, v34, v36, v38, 0.0);
    v49 = +[UIInputViewSetPlacementUndocked infoWithPoint:](UIInputViewSetPlacementUndocked, "infoWithPoint:", 0.0, v47);
    v50 = (void *)[v49 mutableCopy];

    v51 = [(UIScrollToDismissSupport *)self _infoForMatchMove];
    [v50 addEntriesFromDictionary:v51];

    v52 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __57__UIScrollToDismissSupport_scrollView_didPanWithGesture___block_invoke;
    v67[3] = &unk_1E52FC280;
    id v53 = v50;
    id v68 = v53;
    [v52 performOnDistributedControllers:v67];

    double v54 = v64;
    if (v40 >= v64) {
      double v54 = v40;
    }
    if (v65 <= v54) {
      double v55 = v65;
    }
    else {
      double v55 = v54;
    }
    if (v63 > 0.0)
    {
      -[UIScrollToDismissSupport updateScrollViewContentInsetBottom:](self, "updateScrollViewContentInsetBottom:", v55 - self->_scrollViewTransitionPreviousPoint.y, v65);
      v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v56 postNotificationName:@"UIKeyboardPrivateInteractiveDismissalDidBeginNotification" object:0];
    }
    self->_scrollViewTransitionPreviousPoint.x = v66;
    self->_scrollViewTransitionPreviousPoint.y = v55;
  }
LABEL_9:
}

uint64_t __57__UIScrollToDismissSupport_scrollView_didPanWithGesture___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateTransition:@"_UIScrollKeyboard" withInfo:*(void *)(a1 + 32)];
}

- (void)scrollView:(id)a3 didFinishPanGesture:(id)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_scrollViewTransitionFinishing && self->_scrollViewForTransition)
  {
    uint64_t v8 = [v6 keyboardDismissMode];
    if ((unint64_t)(v8 - 1) > 3) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_186B9AC20[v8 - 1];
    }
    [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo beginFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo endFrame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    uint64_t v24 = [v7 numberOfTouches];
    v25 = [(UISplitKeyboardSource *)self->super._controller view];
    if (v24) {
      [v7 locationOfTouch:0 inView:v25];
    }
    else {
      [v7 locationInView:v25];
    }
    double v27 = v26;

    double v28 = fmin(fmax((v27 - v13) / (v19 - v13), 0.0), 1.0);
    v29 = [(UISplitKeyboardSource *)self->super._controller view];
    [v7 velocityInView:v29];
    double v31 = v30;

    if (v31 <= 0.0)
    {
      self->_scrollViewTransitionFinishing = 1;
      [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo duration];
      double v34 = v28 * v33;
      -[UIScrollToDismissSupport _updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:](self, "_updateKeyboardLayoutGuideForScrollTransitionWithSize:hostFrame:duration:", v21, v23, v11, v13, v15, v17, v28 * v33);
      v44[0] = @"_UIScrollKeyboardDuration";
      double v35 = [NSNumber numberWithDouble:v34];
      v44[1] = @"_UIScrollKeyboardCancelInfo";
      v45[0] = v35;
      double v36 = [NSNumber numberWithUnsignedInteger:v9];
      v45[1] = v36;
      double v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
      double v38 = (void *)[v37 mutableCopy];

      if (+[UIKeyboard usesInputSystemUI])
      {
        double v39 = [(UIScrollToDismissSupport *)self _infoForMatchMove];
        [v38 addEntriesFromDictionary:v39];
      }
      double v40 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __59__UIScrollToDismissSupport_scrollView_didFinishPanGesture___block_invoke;
      v42[3] = &unk_1E52FC280;
      id v43 = v38;
      id v41 = v38;
      [v40 performOnDistributedControllers:v42];
    }
    else
    {
      [(UIInputViewSetNotificationInfo *)self->_scrollViewNotificationInfo duration];
      [(UIScrollToDismissSupport *)self completeKeyboardDismiss:v9 withDuration:v28 * v32];
    }
  }
}

uint64_t __59__UIScrollToDismissSupport_scrollView_didFinishPanGesture___block_invoke(uint64_t a1, void *a2)
{
  return [a2 completeTransition:@"_UIScrollKeyboard" withInfo:*(void *)(a1 + 32)];
}

- (id)_infoForMatchMove
{
  void v25[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  if (+[UIKeyboard usesInputSystemUI])
  {
    BOOL v4 = [(UISplitKeyboardSource *)self->super._controller scrollTrackingView];
    v5 = [v4 layer];
    id v6 = [v5 context];
    uint64_t v7 = [v6 contextId];

    uint64_t v8 = [v4 layer];
    uint64_t RenderId = CALayerGetRenderId();

    double v10 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
    uint64_t v11 = [v10 inputAccessoryView];
    if (v11)
    {
      double v12 = (void *)v11;
      [v4 bounds];
      double v14 = v13;

      double v15 = 0.0;
      if (v14 <= 0.0)
      {
LABEL_7:
        v24[0] = @"_UIKeyboardContextID";
        double v19 = [NSNumber numberWithUnsignedInteger:v7];
        v25[0] = v19;
        v24[1] = @"_UIKeyboardLayerID";
        double v20 = [NSNumber numberWithUnsignedInteger:RenderId];
        v25[1] = v20;
        void v24[2] = @"_UIScrollKeyboardIAVOffset";
        double v21 = [NSNumber numberWithDouble:v15];
        v25[2] = v21;
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

        BOOL v3 = (void *)v22;
        goto LABEL_8;
      }
      double v10 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
      [v10 inputAccessoryViewBounds];
      double v17 = v16;
      [v4 bounds];
      double v15 = v17 / v18;
    }
    else
    {
      double v15 = 0.0;
    }

    goto LABEL_7;
  }
LABEL_8:
  return v3;
}

- (CGRect)addPaddingToFrame:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [a4 window];
  [v8 keyboardLayoutGuideScrollViewOffset];
  double v10 = v9;

  double v11 = y - fmax(v10, 0.0);
  double v12 = -0.0;
  if (v10 > 0.0) {
    double v12 = v10;
  }
  double v13 = height + v12;
  double v14 = x;
  double v15 = width;
  result.size.double height = v13;
  result.size.CGFloat width = v15;
  result.origin.double y = v11;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)_updateKeyboardLayoutGuideForScrollTransitionWithSize:(CGSize)a3 hostFrame:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = a3.height;
  double width = a3.width;
  double v12 = +[UIInputViewAnimationStyle animationStyleAnimated:duration:](UIInputViewAnimationStyle, "animationStyleAnimated:duration:", 1, a5, a3.height, a4.origin.x, a4.origin.y, a4.size.width);
  double v13 = v12;
  if (v9 > 0.0) {
    [v12 setExtraOptions:0];
  }
  double v14 = y + height - v9;
  v51[0] = MEMORY[0x1E4F143A8];
  double v47 = a5;
  v51[1] = 3221225472;
  v51[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke;
  v51[3] = &unk_1E52FD4B8;
  double v53 = x;
  double v54 = v14;
  double v55 = width;
  double v56 = v9;
  double v57 = a5;
  id v15 = v13;
  id v52 = v15;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v51];
  double v16 = [(UISplitKeyboardSource *)self->super._controller containerView];
  double v17 = [v16 _window];

  [v17 bounds];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v26 = [v17 screen];
  [v26 bounds];
  v61.origin.double x = v27;
  v61.origin.double y = v28;
  v61.size.double width = v29;
  v61.size.double height = v30;
  v58.origin.double x = v19;
  v58.origin.double y = v21;
  v58.size.double width = v23;
  v58.size.double height = v25;
  BOOL v31 = CGRectEqualToRect(v58, v61);

  if (!v31)
  {
    double v32 = [v17 screen];
    double v33 = [v32 coordinateSpace];
    double v34 = [v17 windowScene];
    double v35 = [v34 coordinateSpace];
    objc_msgSend(v33, "convertRect:toCoordinateSpace:", v35, x, v14, width, v9);
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;

    [v17 bounds];
    v62.origin.double x = v37;
    v62.origin.double y = v39;
    v62.size.double width = v41;
    v62.size.double height = v43;
    CGRect v60 = CGRectIntersection(v59, v62);
    double x = v60.origin.x;
    double v14 = v60.origin.y;
    double width = v60.size.width;
    double v9 = v60.size.height;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_3;
  aBlock[3] = &__block_descriptor_64_e5_v8__0l;
  *(double *)&aBlock[4] = x;
  *(double *)&aBlock[5] = v14;
  *(double *)&aBlock[6] = width;
  *(double *)&aBlock[7] = v9;
  double v44 = _Block_copy(aBlock);
  double v45 = v44;
  if (v47 <= 0.0)
  {
    (*((void (**)(void *))v44 + 2))(v44);
  }
  else
  {
    uint64_t v46 = [v15 extraOptions];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_5;
    v48[3] = &unk_1E52DA040;
    id v49 = v45;
    +[UIView animateWithDuration:v46 delay:v48 options:0 animations:v47 completion:0.0];
  }
}

void __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isTrackingKeyboard])
  {
    BOOL v4 = [v3 screen];
    v5 = [v4 coordinateSpace];
    id v6 = [v3 windowScene];
    uint64_t v7 = [v6 coordinateSpace];
    objc_msgSend(v5, "convertRect:toCoordinateSpace:", v7, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    [v3 frame];
    v29.origin.double x = v16;
    v29.origin.double y = v17;
    v29.size.double width = v18;
    v29.size.double height = v19;
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    CGRect v28 = CGRectIntersection(v27, v29);
    double width = v28.size.width;
    double height = v28.size.height;
    double v22 = objc_msgSend(v3, "_primaryKeyboardTrackingGuide", v28.origin.x, v28.origin.y);
    LODWORD(v5) = objc_msgSend(v22, "changeSizingConstants:", width, height);

    if (v5)
    {
      double v23 = *(double *)(a1 + 72);
      if (v23 > 0.0)
      {
        uint64_t v24 = [*(id *)(a1 + 32) extraOptions];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_2;
        void v25[3] = &unk_1E52D9F70;
        id v26 = v3;
        +[UIView animateWithDuration:v24 delay:v25 options:0 animations:v23 completion:0.0];
      }
    }
  }
}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutViewsForTrackedGuides];
}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_4;
  v3[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
  long long v1 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v5 = v1;
  return +[UIKeyboardSceneDelegate performOnControllers:v3];
}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __101__UIScrollToDismissSupport__updateKeyboardLayoutGuideForScrollTransitionWithSize_hostFrame_duration___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollViewNotificationInfo, 0);
  objc_storeStrong((id *)&self->_interfaceAutorotationDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_scrollViewForTransition, 0);
}

@end