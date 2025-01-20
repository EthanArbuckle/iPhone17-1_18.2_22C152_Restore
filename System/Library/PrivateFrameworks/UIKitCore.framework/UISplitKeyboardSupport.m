@interface UISplitKeyboardSupport
- (BOOL)_updateKeyboardLayoutGuideForHostFrame:(CGRect)a3 animated:(BOOL)a4;
- (BOOL)completedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5;
- (BOOL)generateSplitNotificationForNewPlacement:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isSplitting;
- (BOOL)isTranslating;
- (BOOL)startedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5;
- (void)_connectController:(id)a3;
- (void)_disconnectingController:(id)a3;
- (void)_updateBounceAnimation:(id)a3;
- (void)_updateKeyboardLayoutGuideForSplitTransition:(BOOL)a3;
- (void)_updatedController;
- (void)bounceAnimationDidFinish;
- (void)cancelBounceAnimation;
- (void)cancelGestureRecognizers;
- (void)dock;
- (void)finishTransitionWithCompletion:(id)a3;
- (void)invalidateDisplayLink;
- (void)prepareForTransition;
- (void)transitionDidFinish:(BOOL)a3;
- (void)translateDetected:(id)a3;
- (void)updateProgress:(double)a3 startHeight:(double)a4 endHeight:(double)a5;
- (void)updatedControllerApplicator:(id)a3;
- (void)willPerformPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5;
@end

@implementation UISplitKeyboardSupport

- (void)_disconnectingController:(id)a3
{
  id v4 = a3;
  v5 = [v4 applicator];
  v6 = [v5 draggableView];
  [v6 removeGestureRecognizer:self->_singleFingerPanRecognizer];

  singleFingerPanRecognizer = self->_singleFingerPanRecognizer;
  self->_singleFingerPanRecognizer = 0;

  v8 = [v4 applicator];
  v9 = [v8 twoFingerDraggableView];
  [v9 removeGestureRecognizer:self->_twoFingerPanRecognizer];

  twoFingerPanRecognizer = self->_twoFingerPanRecognizer;
  self->_twoFingerPanRecognizer = 0;

  v11.receiver = self;
  v11.super_class = (Class)UISplitKeyboardSupport;
  [(UIKeyboardMotionSupport *)&v11 _disconnectingController:v4];
}

- (void)_connectController:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISplitKeyboardSupport;
  [(UIKeyboardMotionSupport *)&v15 _connectController:v4];
  v5 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel_translateDetected_];
  singleFingerPanRecognizer = self->_singleFingerPanRecognizer;
  self->_singleFingerPanRecognizer = v5;

  [(UIPanGestureRecognizer *)self->_singleFingerPanRecognizer setFailsPastMaxTouches:1];
  [(UIGestureRecognizer *)self->_singleFingerPanRecognizer setDelaysTouchesEnded:0];
  [(UIGestureRecognizer *)self->_singleFingerPanRecognizer setCancelsTouchesInView:1];
  [(UIPanGestureRecognizer *)self->_singleFingerPanRecognizer setMinimumNumberOfTouches:1];
  [(UIPanGestureRecognizer *)self->_singleFingerPanRecognizer setMaximumNumberOfTouches:1];
  [(UIPanGestureRecognizer *)self->_singleFingerPanRecognizer _setHysteresis:30.0];
  v7 = self->_singleFingerPanRecognizer;
  if (v7)
  {
    [(UIPanGestureRecognizer *)v7 setDelegate:self];
    v8 = [v4 applicator];
    v9 = [v8 draggableView];
    [v9 addGestureRecognizer:self->_singleFingerPanRecognizer];
  }
  v10 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel_translateDetected_];
  twoFingerPanRecognizer = self->_twoFingerPanRecognizer;
  self->_twoFingerPanRecognizer = v10;

  [(UIPanGestureRecognizer *)self->_twoFingerPanRecognizer setFailsPastMaxTouches:1];
  [(UIGestureRecognizer *)self->_twoFingerPanRecognizer setDelaysTouchesEnded:0];
  [(UIGestureRecognizer *)self->_twoFingerPanRecognizer setCancelsTouchesInView:1];
  [(UIPanGestureRecognizer *)self->_twoFingerPanRecognizer setMinimumNumberOfTouches:2];
  [(UIPanGestureRecognizer *)self->_twoFingerPanRecognizer setMaximumNumberOfTouches:2];
  [(UIPanGestureRecognizer *)self->_twoFingerPanRecognizer _setHysteresis:30.0];
  v12 = self->_twoFingerPanRecognizer;
  if (v12)
  {
    [(UIPanGestureRecognizer *)v12 setDelegate:self];
    v13 = [v4 applicator];
    v14 = [v13 twoFingerDraggableView];
    [v14 addGestureRecognizer:self->_twoFingerPanRecognizer];
  }
}

- (void)_updatedController
{
  v19.receiver = self;
  v19.super_class = (Class)UISplitKeyboardSupport;
  [(UIKeyboardMotionSupport *)&v19 _updatedController];
  v3 = [(UIGestureRecognizer *)self->_singleFingerPanRecognizer view];
  id v4 = [(UIKeyboardMotionSupport *)self masterController];
  v5 = [v4 applicator];
  v6 = [v5 draggableView];

  if (v3 != v6)
  {
    v7 = [(UIGestureRecognizer *)self->_singleFingerPanRecognizer view];
    [v7 removeGestureRecognizer:self->_singleFingerPanRecognizer];

    v8 = [(UIKeyboardMotionSupport *)self masterController];
    v9 = [v8 applicator];

    v10 = [v9 draggableView];
    [v10 addGestureRecognizer:self->_singleFingerPanRecognizer];
  }
  objc_super v11 = [(UIGestureRecognizer *)self->_twoFingerPanRecognizer view];
  v12 = [(UIKeyboardMotionSupport *)self masterController];
  v13 = [v12 applicator];
  v14 = [v13 twoFingerDraggableView];

  if (v11 != v14)
  {
    objc_super v15 = [(UIGestureRecognizer *)self->_twoFingerPanRecognizer view];
    [v15 removeGestureRecognizer:self->_twoFingerPanRecognizer];

    v16 = [(UIKeyboardMotionSupport *)self masterController];
    v17 = [v16 applicator];

    v18 = [v17 twoFingerDraggableView];
    [v18 addGestureRecognizer:self->_twoFingerPanRecognizer];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UIKeyboardMotionSupport *)self masterController];
  v9 = [v8 applicator];

  v10 = [v9 draggableView];
  [v6 locationInView:v10];
  double v12 = v11;
  double v14 = v13;

  LOBYTE(v6) = objc_msgSend(v9, "isGesture:inDraggableView:", v7, v12, v14);
  return (char)v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if (self->_singleFingerPanRecognizer != v4 && self->_twoFingerPanRecognizer != v4)
  {
    char v6 = 1;
    goto LABEL_12;
  }
  id v7 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
  v8 = [v7 inputView];
  if (!v8
    || ([(UISplitKeyboardSource *)self->super._controller isChangingPlacement] & 1) != 0
    || !+[UIKeyboardImpl rivenShouldUndock]
    && !+[UIKeyboardImpl isFloating])
  {
    goto LABEL_10;
  }
  v9 = +[UIKeyboardImpl activeInstance];
  if ([v9 isLongPress])
  {

LABEL_10:
LABEL_11:
    char v6 = 0;
    goto LABEL_12;
  }
  double v11 = +[UIKeyboardImpl activeInstance];
  char v12 = [v11 splitTransitionInProgress];

  if (v12) {
    goto LABEL_11;
  }
  char v43 = 0;
  double v13 = [(UIKeyboardMotionSupport *)self masterController];
  double v14 = [v13 applicator];
  int v15 = [v14 preBeginGesture:v5 shouldBegin:&v43];

  if (v15)
  {
    char v6 = v43 != 0;
  }
  else
  {
    [(UIPanGestureRecognizer *)v5 locationInView:0];
    double v17 = v16;
    double v19 = v18;
    v20 = [(UISplitKeyboardSource *)self->super._controller view];
    v21 = [v20 window];
    int v22 = [v21 _isHostedInAnotherProcess];

    if (v22)
    {
      v23 = [(UISplitKeyboardSource *)self->super._controller view];
      v24 = [v23 window];
      objc_msgSend(v24, "convertPoint:fromWindow:", 0, v17, v19);
      double v17 = v25;
      double v19 = v26;
    }
    v27 = [(UIKeyboardMotionSupport *)self masterController];
    v28 = [v27 applicator];
    v29 = [v28 draggableView];
    v30 = [(UISplitKeyboardSource *)self->super._controller view];
    v31 = [v30 window];
    objc_msgSend(v29, "convertPoint:fromView:", v31, v17, v19);
    double v33 = v32;
    double v35 = v34;

    v36 = [(UISplitKeyboardSource *)self->super._controller view];
    [(UIPanGestureRecognizer *)v5 translationInView:v36];
    double v38 = v37;
    double v40 = v39;

    v41 = [(UIKeyboardMotionSupport *)self masterController];
    v42 = [v41 applicator];
    char v6 = objc_msgSend(v42, "isGesture:inDraggableView:", v5, v33 + v38, v35 - v40);
  }
LABEL_12:

  return v6;
}

- (BOOL)generateSplitNotificationForNewPlacement:(id)a3
{
  controller = self->super._controller;
  id v4 = a3;
  v5 = [(UISplitKeyboardSource *)controller placement];
  char v6 = [v5 isUndocked];
  char v7 = [v4 isUndocked];

  return v6 ^ v7;
}

- (BOOL)isTranslating
{
  return self->_isTranslating;
}

- (BOOL)isSplitting
{
  return self->_isSplitting;
}

- (void)updatedControllerApplicator:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardMotionSupport *)self masterController];

  if (v5 == v4)
  {
    [(UISplitKeyboardSupport *)self _updatedController];
  }
}

- (void)willPerformPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  if (self->_displayLink) {
    [(UISplitKeyboardSupport *)self cancelBounceAnimation];
  }
}

- (BOOL)startedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (UISplitKeyboardSource *)a5;
  if ([v8 isUndocked]) {
    char v11 = 1;
  }
  else {
    char v11 = [v9 isUndocked];
  }
  if (self->super._controller == v10) {
    self->_isTranslating = v11;
  }
  if ((([v8 isUndocked] & 1) != 0 || objc_msgSend(v9, "isUndocked"))
    && ([v8 isFloatingAssistantView] & 1) == 0
    && ([v9 isFloating] & 1) == 0
    && [v9 isVisible])
  {
    -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForSplitTransition:](self, "_updateKeyboardLayoutGuideForSplitTransition:", [v9 isUndocked]);
    char v12 = [(UISplitKeyboardSource *)self->super._controller hostView];
    [v12 frame];
    -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 1);
  }
  return v11;
}

- (BOOL)completedPlacementFrom:(id)a3 to:(id)a4 forController:(id)a5
{
  id v8 = a4;
  id v9 = (UISplitKeyboardSource *)a5;
  if ([a3 isUndocked]) {
    char v10 = 1;
  }
  else {
    char v10 = [v8 isUndocked];
  }
  if (self->super._controller == v9) {
    self->_isTranslating = 0;
  }

  return v10;
}

- (void)cancelGestureRecognizers
{
  if ([(UIGestureRecognizer *)self->_singleFingerPanRecognizer isEnabled])
  {
    [(UIGestureRecognizer *)self->_singleFingerPanRecognizer setEnabled:0];
    [(UIGestureRecognizer *)self->_singleFingerPanRecognizer setEnabled:1];
  }
  if ([(UIGestureRecognizer *)self->_twoFingerPanRecognizer isEnabled])
  {
    [(UIGestureRecognizer *)self->_twoFingerPanRecognizer setEnabled:0];
    twoFingerPanRecognizer = self->_twoFingerPanRecognizer;
    [(UIGestureRecognizer *)twoFingerPanRecognizer setEnabled:1];
  }
}

- (void)translateDetected:(id)a3
{
  v186[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UISplitKeyboardSource *)self->super._controller hostView];
  if (!v5) {
    goto LABEL_116;
  }
  char v6 = (void *)v5;
  char v7 = +[UIInputSwitcherView activeInstance];
  uint64_t v8 = [v7 isVisible];

  if (v8) {
    goto LABEL_116;
  }
  uint64_t v9 = [v4 state];
  switch(v9)
  {
    case 4:
      [(UISplitKeyboardSupport *)self cancelBounceAnimation];
LABEL_10:
      [(UISplitKeyboardSource *)self->super._controller positionConstraintConstant];
      BOOL v16 = self->_initialTranslation.x == v15 && self->_initialTranslation.y == v14;
      if (v16 && !self->_isTranslating)
      {
        [(UISplitKeyboardSource *)self->super._controller setInterfaceAutorotationDisabled:0];
        goto LABEL_116;
      }
      [(UISplitKeyboardSupport *)self invalidateDisplayLink];
      double v17 = [(UIKeyboardMotionSupport *)self _intendedScreen];
      double v18 = [v17 displayLinkWithTarget:self selector:sel__updateBounceAnimation_];
      displayLink = self->_displayLink;
      self->_displayLink = v18;

      v20 = self->_displayLink;
      v21 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v20 addToRunLoop:v21 forMode:*MEMORY[0x1E4F1C4B0]];

      self->_lastBounceTime = CACurrentMediaTime();
      p_translationVelocity = &self->_translationVelocity;
      v23 = [(UISplitKeyboardSource *)self->super._controller view];
      [v4 velocityInView:v23];
      self->_translationVelocity.x = v24;
      self->_translationVelocity.y = v25;

      CGPoint v26 = (CGPoint)vdivq_f64((float64x2_t)self->_translationVelocity, (float64x2_t)vdupq_n_s64(0x408F400000000000uLL));
      self->_translationVelocity = v26;
      if (fabs(v26.x) < 0.015) {
        p_translationVelocity->x = -0.015;
      }
      if (fabs(v26.y) < 0.015) {
        self->_translationVelocity.y = -0.015;
      }
      id v27 = [(UISplitKeyboardSource *)self->super._controller placement];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      double v29 = 0.0;
      double v30 = 0.0;
      double v31 = 0.0;
      double v32 = 0.0;
      if (isKindOfClass)
      {
        [v27 chromeBuffer];
        double v32 = v33;
        double v31 = v34;
      }
      double v179 = v29;
      double v180 = v30;
      double v35 = [(UISplitKeyboardSource *)self->super._controller hostView];
      [v35 frame];
      double v178 = v36;
      double v38 = v37;

      double v39 = [(UISplitKeyboardSource *)self->super._controller view];
      [v39 bounds];
      double v41 = v40 - v38 - v32;

      v42 = [(UISplitKeyboardSource *)self->super._controller view];
      [v4 translationInView:v42];
      double v44 = v43;
      double v46 = v45;

      double v47 = v44 + self->_initialTranslation.x + p_translationVelocity->x * 110.0;
      double v48 = v46 + self->_initialTranslation.y + self->_translationVelocity.y * 110.0;
      v49 = [(UISplitKeyboardSource *)self->super._controller applicator];
      [v49 contentInsets];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;

      BOOL v58 = +[UIKeyboardImpl isFloating];
      double v59 = v31 + v53;
      double v60 = v51 + v55 - v41;
      v61 = [(UISplitKeyboardSource *)self->super._controller view];
      [v61 bounds];
      double v63 = v62 - (v179 + v178 + v57);
      double v64 = -v55 - v180;

      double v65 = v63;
      double v66 = v59;
      if (v58)
      {
        +[UIKeyboardFloatingTransitionController magneticEdgeMargin];
        double v66 = round(v59 + v67);
        +[UIKeyboardFloatingTransitionController magneticEdgeMargin];
        double v65 = round(v63 - v68);
      }
      if (v47 <= v65) {
        double v69 = v47;
      }
      else {
        double v69 = v65;
      }
      if (v47 < v66) {
        double v69 = v66;
      }
      double v70 = round(v69);
      if (v48 <= v64) {
        double v71 = v48;
      }
      else {
        double v71 = v64;
      }
      if (v48 < v60) {
        double v71 = v60;
      }
      double v72 = round(v71);
      v73 = @"NotOnEdge";
      if (!v58) {
        goto LABEL_90;
      }
      if (v70 == v66)
      {
        v74 = UIKBAnalyticsFloatingKeyboardEdgeLeft;
      }
      else
      {
        if (v70 != v65)
        {
LABEL_85:
          if (v72 == v60)
          {
            v139 = UIKBAnalyticsFloatingKeyboardEdgeTop;
LABEL_89:
            v140 = *v139;

            v73 = v140;
            double v72 = v60;
            goto LABEL_90;
          }
          if (v72 == v64)
          {
            v139 = UIKBAnalyticsFloatingKeyboardEdgeBottom;
            double v60 = v64;
            goto LABEL_89;
          }
LABEL_90:
          self->_targetTranslation.x = v70;
          self->_targetTranslation.y = v72;
          v141 = +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, v70, v72);
          v142 = [v141 objectForKey:@"PopoverRect"];
          [v142 CGRectValue];
          double v144 = v143;
          double v146 = v145;
          double v148 = v147;
          double v150 = v149;

          if (v58)
          {
            v151 = [(UISplitKeyboardSource *)self->super._controller view];
            [v4 locationInView:v151];
            +[UIKBAnalyticsDispatcher floatingKeyboardMoved:toPosition:touchPosition:](UIKBAnalyticsDispatcher, "floatingKeyboardMoved:toPosition:touchPosition:", v73, v144, v146, v152, v153);
          }
          else if (self->_shouldUpdateKLGForTransition)
          {
            -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, v144, v146, v148, v150);
            self->_shouldUpdateKLGForTransition = 0;
          }
          +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", v70, v72);
          if (self->_splitLockState) {
            goto LABEL_111;
          }
          if (+[UIKeyboardImpl rivenTranslationPreference])
          {
            v154 = [(UISplitKeyboardSource *)self->super._controller view];
            v155 = [v154 window];
            unint64_t v156 = [v155 interfaceOrientation] - 3;

            double v157 = 80.0;
            if (v156 < 2) {
              double v157 = 100.0;
            }
            double v158 = fabs(v72);
            BOOL v159 = v158 >= v157;
            if (v158 < v157)
            {
              v166 = +[UIInputViewSetPlacement placement];
              +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", 0.0, 0.0);
            }
            else
            {
              v160 = [(UISplitKeyboardSource *)self->super._controller view];
              [v160 bounds];
              double v162 = v70 / v161;
              v163 = [(UISplitKeyboardSource *)self->super._controller view];
              [v163 bounds];
              double v165 = -v72 / v164;

              v166 = +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", v162, v165, 92.0, 0.0, 0.0, 0.0);
            }
            if (v166) {
              [(UIKeyboardMotionSupport *)self translateToPlacement:v166 quietly:1 animated:1];
            }
          }
          else
          {
            BOOL v159 = 1;
          }
          if (self->_splitLockState)
          {
LABEL_111:
            v172 = 0;
          }
          else
          {
            v185 = @"_UISplitKeyboardGestureFinishSplit";
            v177 = [NSNumber numberWithBool:v159];
            v186[0] = v177;
            v172 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v186 forKeys:&v185 count:1];
          }
          v173 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
          v183[0] = MEMORY[0x1E4F143A8];
          v183[1] = 3221225472;
          v183[2] = __44__UISplitKeyboardSupport_translateDetected___block_invoke;
          v183[3] = &unk_1E52FC280;
          id v174 = v172;
          id v184 = v174;
          [v173 performOnDistributedControllers:v183];

          [(UISplitKeyboardSource *)self->super._controller setInterfaceAutorotationDisabled:0];
          v175 = +[UIKeyboard activeKeyboard];
          char v176 = [v175 isActive];

          if ((v176 & 1) == 0) {
            [(UISplitKeyboardSupport *)self cancelBounceAnimation];
          }

          goto LABEL_115;
        }
        v74 = UIKBAnalyticsFloatingKeyboardEdgeRight;
        double v59 = v63;
      }
      v138 = *v74;

      v73 = v138;
      double v70 = v59;
      goto LABEL_85;
    case 3:
      goto LABEL_10;
    case 1:
      [(UISplitKeyboardSource *)self->super._controller setInterfaceAutorotationDisabled:1];
      self->_isTranslating = 0;
      [(UISplitKeyboardSource *)self->super._controller positionConstraintConstant];
      self->_initialTranslation.x = v10;
      self->_initialTranslation.y = v11;
      self->_lastTranslationNotificationTime = 0.0;
      char v12 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
      double v13 = [v12 keyboard];
      if (v13
        && (+[UIKeyboardImpl activeInstance],
            uint64_t v8 = objc_claimAutoreleasedReturnValue(),
            [(id)v8 rivenSplitLock]))
      {
        self->_splitLockState = 1;
      }
      else
      {
        self->_splitLockState = +[UIKeyboardImpl isFloating];
        if (!v13)
        {
LABEL_78:

          [(UISplitKeyboardSupport *)self invalidateDisplayLink];
          id v27 = [(UISplitKeyboardSource *)self->super._controller placement];
          if ([v27 isFloating]) {
            [v27 updateChromeBuffer];
          }
          v128 = [(UISplitKeyboardSource *)self->super._controller hostView];
          [v128 frame];
          double v130 = v129;
          double v132 = v131;
          double v134 = v133;
          double v136 = v135;

          self->_shouldUpdateKLGForTransition = -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, v130, v132, v134, v136);
LABEL_115:

          goto LABEL_116;
        }
      }

      goto LABEL_78;
  }
  v75 = [(UISplitKeyboardSource *)self->super._controller view];
  [v4 translationInView:v75];
  double v77 = v76;
  double v79 = v78;

  v80 = [(UISplitKeyboardSource *)self->super._controller view];
  [v80 size];
  double v82 = v81;
  v83 = [(UISplitKeyboardSource *)self->super._controller hostView];
  [v83 frame];
  double v85 = v84;

  double v86 = v77 + self->_initialTranslation.x;
  if (v86 >= 0.0)
  {
    if (v86 > v82 - v85) {
      double v86 = v82 - v85 + round((v86 - (v82 - v85)) * 0.3);
    }
  }
  else
  {
    double v86 = round(v86 * 0.3);
  }
  v87 = [(UISplitKeyboardSource *)self->super._controller view];
  [v87 size];
  double v89 = v88;
  v90 = [(UISplitKeyboardSource *)self->super._controller hostView];
  [v90 frame];
  double v92 = -(v89 - v91);

  double v93 = v79 + self->_initialTranslation.y;
  double v94 = v92 - round((v92 - v93) * 0.3);
  if (v93 >= v92) {
    double v95 = v79 + self->_initialTranslation.y;
  }
  else {
    double v95 = v94;
  }
  if (self->_isTranslating)
  {
    v96 = +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, v86, v95);
    v97 = [v96 objectForKey:@"PopoverRect"];
    [v97 CGRectValue];
    double v99 = v98;
    double v101 = v100;
    double v103 = v102;
    double v105 = v104;

    if (self->_shouldUpdateKLGForTransition) {
      -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, v99, v101, v103, v105);
    }
    v106 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __44__UISplitKeyboardSupport_translateDetected___block_invoke_2;
    v181[3] = &unk_1E52FC280;
    id v27 = v96;
    id v182 = v27;
    [v106 performOnDistributedControllers:v181];

    if (v95 < 0.0)
    {
      v107 = [(UISplitKeyboardSource *)self->super._controller placement];
      char v108 = [v107 isUndocked];

      if ((v108 & 1) == 0) {
        [(UISplitKeyboardSupport *)self undock];
      }
    }
    v109 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
    uint64_t v110 = [v109 keyboard];
    if (v110)
    {
      v111 = (void *)v110;
      BOOL v112 = +[UIKeyboardImpl rivenPreference];

      if (v112)
      {
        v113 = [(UISplitKeyboardSource *)self->super._controller view];
        v114 = [v113 window];
        unint64_t v115 = [v114 interfaceOrientation] - 3;

        if (v115 >= 2) {
          double v116 = 10.0;
        }
        else {
          double v116 = 40.0;
        }
        if (v115 >= 2) {
          double v117 = 80.0;
        }
        else {
          double v117 = 100.0;
        }
        if (!self->_splitLockState) {
          goto LABEL_66;
        }
        v118 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
        char v119 = [v118 _inputViewIsSplit];

        if (((v119 & 1) != 0 || v95 < -v116) && (v95 <= -v117 ? (char v120 = v119) : (char v120 = 0), (v120 & 1) == 0))
        {
          self->_splitLockState = 1;
        }
        else
        {
          BOOL v121 = +[UIKeyboardImpl isFloating];
          self->_splitLockState = v121;
          if (!v121)
          {
LABEL_66:
            double v122 = -v117;
            double v123 = 1.0;
            if (v95 > v122)
            {
              double v123 = 0.0;
              if (v95 <= -v116 && v95 >= v122)
              {
                double v125 = fabs(v95) - v116;
                double v126 = 70.0;
                if (v115 < 2) {
                  double v126 = 60.0;
                }
                double v123 = v125 / v126 * (v125 / v126);
              }
            }
            v127 = +[UIKeyboardImpl activeInstance];
            [v127 setSplitProgress:v123];
          }
        }
      }
    }
    else
    {
    }
    [v4 locationInView:0];
    double v168 = v167;
    double v170 = v169;
    if (+[UIKeyboardImpl isFloating]
      && +[UIKeyboardFloatingTransitionController isPointWithinDockingRegion:](UIKeyboardFloatingTransitionController, "isPointWithinDockingRegion:", v168, v170))
    {
      v171 = +[UIKeyboardImpl activeInstance];
      [v171 beginFloatingTransitionFromPanGestureRecognizer:v4];
    }
    goto LABEL_115;
  }
  self->_isTranslating = 1;
  v137 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v137 performOnDistributedControllers:&__block_literal_global_363];

LABEL_116:
}

void __44__UISplitKeyboardSupport_translateDetected___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 completeTransition:@"_UISplitKeyboardGesture" withInfo:v2];
  [v3 startTransition:@"_UISplitKeyboardBounce" withInfo:0];
}

uint64_t __44__UISplitKeyboardSupport_translateDetected___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateTransition:@"_UISplitKeyboardGesture" withInfo:*(void *)(a1 + 32)];
}

uint64_t __44__UISplitKeyboardSupport_translateDetected___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 startTransition:@"_UISplitKeyboardGesture" withInfo:0];
}

- (void)_updateKeyboardLayoutGuideForSplitTransition:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__UISplitKeyboardSupport__updateKeyboardLayoutGuideForSplitTransition___block_invoke;
  v3[3] = &unk_1E52FD420;
  BOOL v4 = a3;
  v3[4] = self;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v3];
}

void __71__UISplitKeyboardSupport__updateKeyboardLayoutGuideForSplitTransition___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isTrackingKeyboard])
  {
    if (*(unsigned char *)(a1 + 40)) {
      +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    }
    else {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 24) placement];
    }
    [v4 updateGuideForKeyboardPlacement:v3];
  }
}

- (BOOL)_updateKeyboardLayoutGuideForHostFrame:(CGRect)a3 animated:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (+[UIAssistantBarButtonItemProvider _isScribbleButtonsVisible])
  {
    return 0;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v33.origin.double x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v33))
  {
    CGFloat v11 = [(UISplitKeyboardSource *)self->super._controller containerView];
    char v12 = [v11 window];
    [v12 bounds];
    double MaxY = CGRectGetMaxY(v31);
    v32.origin.double x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double v14 = CGRectGetMaxY(v32);

    if (x > 0.0 || (double v15 = MaxY - v14, v16 = MaxY - v14 <= 0.0, v17 = width, v18 = height, v19 = x, !v16))
    {
      v20 = [(UISplitKeyboardSource *)self->super._controller containerView];
      v21 = [v20 window];
      [v21 bounds];
      CGFloat v17 = v22;

      double v15 = 0.0;
      CGFloat v18 = 0.0;
      double v19 = 0.0;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke;
    v26[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
    *(CGFloat *)&v26[4] = v17;
    *(CGFloat *)&v26[5] = v18;
    *(double *)&v26[6] = v19;
    *(double *)&v26[7] = v15;
    +[UIKeyboardSceneDelegate performOnControllers:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke_2;
    v24[3] = &unk_1E52FD468;
    *(double *)&v24[6] = x;
    *(CGFloat *)&v24[7] = y;
    *(CGFloat *)&v24[8] = width;
    *(CGFloat *)&v24[9] = height;
    v24[4] = self;
    v24[5] = &v27;
    BOOL v25 = a4;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v24];
  }
  BOOL v10 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v27, 8);
  return v10;
}

void __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "updateTrackingElementsForSize:", v3, v4);
  objc_msgSend(v5, "updateTrackingElementsForOffset:", a1[6], a1[7]);
}

void __74__UISplitKeyboardSupport__updateKeyboardLayoutGuideForHostFrame_animated___block_invoke_2(uint64_t a1, void *a2)
{
  id v31 = a2;
  if ([v31 isTrackingKeyboard])
  {
    [v31 frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v11 = [*(id *)(*(void *)(a1 + 32) + 24) containerView];
    char v12 = [v11 window];
    objc_msgSend(v31, "convertRect:fromWindow:", v12, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v33.origin.double x = v4;
    v33.origin.double y = v6;
    v33.size.double width = v8;
    v33.size.double height = v10;
    v39.origin.double x = v14;
    v39.origin.double y = v16;
    v39.size.double width = v18;
    v39.size.double height = v20;
    CGRect v34 = CGRectIntersection(v33, v39);
    double x = v34.origin.x;
    double y = v34.origin.y;
    double width = v34.size.width;
    double height = v34.size.height;
    if (CGRectIsEmpty(v34))
    {
      [v31 insetForDismissedKeyboardGuide];
      double height = v25;
      v35.origin.double x = v4;
      v35.origin.double y = v6;
      v35.size.double width = v8;
      v35.size.double height = v10;
      double x = CGRectGetMinX(v35);
      v36.origin.double x = v4;
      v36.origin.double y = v6;
      v36.size.double width = v8;
      v36.size.double height = v10;
      double y = CGRectGetMaxY(v36) - height;
      double width = v8;
    }
    CGPoint v26 = [v31 _primaryKeyboardTrackingGuide];
    v37.origin.double x = v4;
    v37.origin.double y = v6;
    v37.size.double width = v8;
    v37.size.double height = v10;
    double MaxY = CGRectGetMaxY(v37);
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    int v28 = objc_msgSend(v26, "changeOffsetConstants:", x, MaxY - CGRectGetMaxY(v38));

    uint64_t v29 = [v31 _primaryKeyboardTrackingGuide];
    int v30 = objc_msgSend(v29, "changeSizingConstants:", width, height);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (*(unsigned char *)(a1 + 80) && v28 | v30) {
      [v31 layoutViewsForTrackedGuides];
    }
  }
}

- (void)cancelBounceAnimation
{
  double v3 = +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, self->_targetTranslation.x, self->_targetTranslation.y);
  CGFloat v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__UISplitKeyboardSupport_cancelBounceAnimation__block_invoke;
  v6[3] = &unk_1E52FC280;
  id v7 = v3;
  id v5 = v3;
  [v4 performOnDistributedControllers:v6];

  [(UISplitKeyboardSupport *)self invalidateDisplayLink];
  [(UISplitKeyboardSupport *)self bounceAnimationDidFinish];
}

uint64_t __47__UISplitKeyboardSupport_cancelBounceAnimation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateTransition:@"_UISplitKeyboardBounce" withInfo:*(void *)(a1 + 32)];
}

- (void)bounceAnimationDidFinish
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  bounceCompletionBlock = (void (**)(void))self->_bounceCompletionBlock;
  if (bounceCompletionBlock)
  {
    bounceCompletionBlock[2]();
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"_UISplitKeyboardRefreshPresentation"];
    id v5 = self->_bounceCompletionBlock;
    self->_bounceCompletionBlock = 0;
  }
  CGFloat v6 = [(UISplitKeyboardSource *)self->super._controller hostView];
  [v6 frame];
  id v7 = [(UISplitKeyboardSource *)self->super._controller view];
  [v7 bounds];

  CGFloat v8 = +[UIKeyboardImpl activeInstance];
  if ([v8 rivenSplitLock])
  {
  }
  else
  {
    BOOL v9 = +[UIKeyboardImpl isFloating];

    if (!v9)
    {
      CGFloat v10 = [(UISplitKeyboardSource *)self->super._controller view];
      CGFloat v11 = [v10 window];
      [v11 interfaceOrientation];
    }
  }
  char v12 = [(UISplitKeyboardSource *)self->super._controller hostView];
  [v12 frame];
  +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:");

  self->_isTranslating = 0;
  self->_isSplitting = 0;
  if (self->_targetTranslation.y != 0.0) {
    goto LABEL_12;
  }
  double v13 = [(UISplitKeyboardSource *)self->super._controller placement];
  if (([v13 isUndocked] & 1) == 0)
  {

    goto LABEL_12;
  }
  CGFloat v14 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
  char v15 = [v14 _inputViewIsSplit];

  if (v15)
  {
LABEL_12:
    [v3 setObject:MEMORY[0x1E4F1CC28] forKey:@"_UISplitKeyboardGenerateNotification"];
    goto LABEL_13;
  }
  [(UISplitKeyboardSupport *)self dock];
LABEL_13:
  CGFloat v16 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__UISplitKeyboardSupport_bounceAnimationDidFinish__block_invoke;
  v18[3] = &unk_1E52FC280;
  id v19 = v3;
  id v17 = v3;
  [v16 performOnDistributedControllers:v18];
}

uint64_t __50__UISplitKeyboardSupport_bounceAnimationDidFinish__block_invoke(uint64_t a1, void *a2)
{
  return [a2 completeTransition:@"_UISplitKeyboardBounce" withInfo:*(void *)(a1 + 32)];
}

- (void)invalidateDisplayLink
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    CGFloat v4 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_updateBounceAnimation:(id)a3
{
  [a3 timestamp];
  double v5 = v4;
  double v6 = (v4 - self->_lastBounceTime) * 1000.0;
  if (v6 > 1.0)
  {
    [(UISplitKeyboardSource *)self->super._controller positionConstraintConstant];
    double v8 = v7;
    p_targetTranslation = &self->_targetTranslation;
    +[UIPeripheralHost gridViewRubberBandValueForValue:target:timeInterval:velocity:](UIPeripheralHost, "gridViewRubberBandValueForValue:target:timeInterval:velocity:", &self->_translationVelocity);
    double x = v10;
    +[UIPeripheralHost gridViewRubberBandValueForValue:&self->_translationVelocity.y target:v8 timeInterval:self->_targetTranslation.y velocity:v6];
    double y = v12;
    if (vabdd_f64(self->_targetTranslation.x, x) < 3.0 && fabs(self->_translationVelocity.x) < 0.01) {
      double x = p_targetTranslation->x;
    }
    if (vabdd_f64(self->_targetTranslation.y, v12) < 3.0 && fabs(self->_translationVelocity.y) < 0.01) {
      double y = self->_targetTranslation.y;
    }
    CGFloat v14 = +[UIInputViewSetPlacementFloating infoWithPoint:forOwner:](UIInputViewSetPlacementFloating, "infoWithPoint:forOwner:", self->super._controller, x, y);
    char v15 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__UISplitKeyboardSupport__updateBounceAnimation___block_invoke;
    v17[3] = &unk_1E52FC280;
    id v16 = v14;
    id v18 = v16;
    [v15 performOnDistributedControllers:v17];

    if (x == p_targetTranslation->x && y == self->_targetTranslation.y)
    {
      [(UISplitKeyboardSupport *)self invalidateDisplayLink];
      [(UISplitKeyboardSupport *)self bounceAnimationDidFinish];
    }
    self->_lastBounceTime = v5;
  }
}

uint64_t __49__UISplitKeyboardSupport__updateBounceAnimation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateTransition:@"_UISplitKeyboardBounce" withInfo:*(void *)(a1 + 32)];
}

- (void)dock
{
  uint64_t v2 = [(UISplitKeyboardSource *)self->super._controller placement];
  int v3 = [v2 isUndocked];

  if (v3)
  {
    double v4 = +[UIKeyboardImpl activeInstance];
    char v5 = [v4 rivenSplitLock];

    if ((v5 & 1) == 0)
    {
      +[UIKeyboardImpl setPersistentSplitProgress:0.0];
    }
  }
}

- (void)prepareForTransition
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  double v4 = v3;
  if (self->_isSplitting)
  {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKey:@"_UISplitKeyboardTransitionInhibitStart"];
  }
  else
  {
    [(UISplitKeyboardSource *)self->super._controller setInterfaceAutorotationDisabled:1];
    char v5 = [(UISplitKeyboardSource *)self->super._controller placement];
    char v6 = [v5 isUndocked];

    if (v6) {
      [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"_UISplitKeyboardGenerateNotification"];
    }
    else {
      [(UISplitKeyboardSupport *)self undock];
    }
    self->_isSplitting = 1;
    double v7 = [(UIKeyboardMotionSupport *)self masterController];
    [v7 prepareForSplitTransition];
  }
  [(UISplitKeyboardSupport *)self _updateKeyboardLayoutGuideForSplitTransition:1];
  double v8 = [(UISplitKeyboardSource *)self->super._controller hostView];
  [v8 frame];
  self->_shouldUpdateKLGForTransition = -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0);

  BOOL v9 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__UISplitKeyboardSupport_prepareForTransition__block_invoke;
  v11[3] = &unk_1E52FC280;
  id v12 = v4;
  id v10 = v4;
  [v9 performOnDistributedControllers:v11];
}

uint64_t __46__UISplitKeyboardSupport_prepareForTransition__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startTransition:@"_UISplitKeyboardTransition" withInfo:*(void *)(a1 + 32)];
}

- (void)updateProgress:(double)a3 startHeight:(double)a4 endHeight:(double)a5
{
  v32[3] = *MEMORY[0x1E4F143B8];
  if (!self->_isTranslating && self->_shouldUpdateKLGForTransition)
  {
    double v9 = a4 - (a4 - a5) * a3;
    id v10 = [(UISplitKeyboardSource *)self->super._controller placement];
    CGFloat v11 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
    [v10 inputAssistantViewHeightForInputViewSet:v11];
    double v13 = v12;

    double v14 = v9 + v13;
    char v15 = [(UISplitKeyboardSource *)self->super._controller view];
    [v15 bounds];
    double v17 = v16;
    [(UISplitKeyboardSource *)self->super._controller offsetForSplitTransition];
    double v19 = v17 - (v14 - v18);

    CGFloat v20 = [(UISplitKeyboardSource *)self->super._controller view];
    [v20 bounds];
    double v22 = v21;

    -[UISplitKeyboardSupport _updateKeyboardLayoutGuideForHostFrame:animated:](self, "_updateKeyboardLayoutGuideForHostFrame:animated:", 0, 0.0, v19, v22, v14);
  }
  v31[0] = @"_UISplitKeyboardTransitionProgress";
  v23 = [NSNumber numberWithDouble:a3];
  v32[0] = v23;
  v31[1] = @"_UISplitKeyboardTransitionStartHeight";
  CGFloat v24 = [NSNumber numberWithDouble:a4];
  v32[1] = v24;
  v31[2] = @"_UISplitKeyboardTransitionEndHeight";
  double v25 = [NSNumber numberWithDouble:a5];
  v32[2] = v25;
  CGPoint v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];

  uint64_t v27 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63__UISplitKeyboardSupport_updateProgress_startHeight_endHeight___block_invoke;
  v29[3] = &unk_1E52FC280;
  id v30 = v26;
  id v28 = v26;
  [v27 performOnDistributedControllers:v29];
}

uint64_t __63__UISplitKeyboardSupport_updateProgress_startHeight_endHeight___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateTransition:@"_UISplitKeyboardTransition" withInfo:*(void *)(a1 + 32)];
}

- (void)finishTransitionWithCompletion:(id)a3
{
  double v4 = (void (**)(void))a3;
  char v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(UISplitKeyboardSupport *)self isTranslating])
  {
    char v6 = (void *)[v4 copy];
    bounceCompletionBlock = self->_bounceCompletionBlock;
    self->_bounceCompletionBlock = v6;
  }
  else
  {
    if (v4)
    {
      v4[2](v4);
      [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"_UISplitKeyboardRefreshPresentation"];
    }
    double v8 = [(UISplitKeyboardSource *)self->super._controller hostView];
    [v8 frame];
    double v11 = v9 + v10;
    double v12 = [(UISplitKeyboardSource *)self->super._controller view];
    [v12 bounds];
    double v14 = v11 - v13;

    char v15 = [(UISplitKeyboardSource *)self->super._controller hostView];
    [v15 frame];
    double v18 = v16 + v17;
    double v19 = [(UISplitKeyboardSource *)self->super._controller view];
    [v19 bounds];
    double v21 = v18 - v20;

    +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", v14, v21);
    [v5 setObject:MEMORY[0x1E4F1CC28] forKey:@"_UISplitKeyboardGenerateNotification"];
    bounceCompletionBlock = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", dispatch_time(0, 100000000));
    [v5 setObject:bounceCompletionBlock forKey:@"_UISplitKeyboardGenerateNotificationTime"];
  }

  double v22 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__UISplitKeyboardSupport_finishTransitionWithCompletion___block_invoke;
  v24[3] = &unk_1E52FC280;
  id v25 = v5;
  id v23 = v5;
  [v22 performOnDistributedControllers:v24];

  [(UISplitKeyboardSource *)self->super._controller setInterfaceAutorotationDisabled:0];
}

uint64_t __57__UISplitKeyboardSupport_finishTransitionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 completeTransition:@"_UISplitKeyboardTransition" withInfo:*(void *)(a1 + 32)];
}

- (void)transitionDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  bounceCompletionBlock = (void (**)(id, SEL))self->_bounceCompletionBlock;
  if (bounceCompletionBlock)
  {
    bounceCompletionBlock[2](bounceCompletionBlock, a2);
    id v6 = self->_bounceCompletionBlock;
    self->_bounceCompletionBlock = 0;
  }
  double v7 = [MEMORY[0x1E4F1CA60] dictionary];
  double v8 = [NSNumber numberWithBool:v3];
  [v7 setObject:v8 forKey:@"_UISplitKeyboardTransitionCallback"];

  self->_isSplitting = 0;
  if (!self->_isTranslating || self->_targetTranslation.y != 0.0) {
    goto LABEL_9;
  }
  double v9 = [(UISplitKeyboardSource *)self->super._controller placement];
  if (![v9 isUndocked]) {
    goto LABEL_8;
  }
  double v10 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
  if ([v10 _inputViewIsSplit])
  {

LABEL_8:
LABEL_9:
    [v7 setObject:MEMORY[0x1E4F1CC28] forKey:@"_UISplitKeyboardGenerateNotification"];
    double v11 = 0;
    BOOL v12 = 0;
    goto LABEL_10;
  }
  BOOL v18 = +[UIKeyboardImpl isFloating];

  if (v18) {
    goto LABEL_9;
  }
  [(UISplitKeyboardSource *)self->super._controller positionConstraintConstant];
  double v20 = v19;
  double v21 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
  [v21 splitHeightDelta];
  BOOL v12 = v20 < floor(v22 * -0.5);

  double v11 = +[UIInputViewSetPlacement placement];
  +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", 0.0, 0.0);
  if (v11)
  {
    BOOL v13 = [(UISplitKeyboardSupport *)self generateSplitNotificationForNewPlacement:v11];
    goto LABEL_11;
  }
LABEL_10:
  BOOL v13 = 0;
LABEL_11:
  double v14 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __46__UISplitKeyboardSupport_transitionDidFinish___block_invoke;
  v23[3] = &unk_1E52FD490;
  id v24 = v7;
  id v25 = v11;
  BOOL v26 = v12;
  BOOL v27 = v13;
  id v15 = v11;
  id v16 = v7;
  [v14 performOnDistributedControllers:v23];

  self->_shouldUpdateKLGForTransition = 0;
  double v17 = [(UIKeyboardMotionSupport *)self masterController];
  [v17 finishSplitTransition];
}

void __46__UISplitKeyboardSupport_transitionDidFinish___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 completeTransition:@"_UISplitKeyboardTransition" withInfo:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v4 setPlacement:v3 quietly:0 animated:*(unsigned __int8 *)(a1 + 48) generateSplitNotification:*(unsigned __int8 *)(a1 + 49)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bounceCompletionBlock, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_twoFingerPanRecognizer, 0);
  objc_storeStrong((id *)&self->_singleFingerPanRecognizer, 0);
}

@end