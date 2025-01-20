@interface UIFlickingAssistantViewSupport
- (BOOL)handlingFlickGesture;
- (BOOL)isCompact;
- (BOOL)isInputAssistantItemHidden;
- (BOOL)isRTL;
- (CGPoint)barOriginFromTouchPoint:(CGPoint)a3;
- (CGPoint)keyboardOriginFromAssistantViewPosition:(int64_t)a3;
- (CGPoint)projectedLandingPointForGestureRecognizerEnd:(id)a3;
- (CGRect)assistantFrame;
- (UIInputViewSetPlacement)remotePlacement;
- (int64_t)draggingState;
- (unint64_t)assistantPosition;
- (unint64_t)rectEdgeFromPosition:(int64_t)a3;
- (void)_connectController:(id)a3;
- (void)_disconnectingController:(id)a3;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_initalizePosition;
- (void)_updateKeyboardLayoutGuideForAssistantFrame:(CGRect)a3;
- (void)_updateKeyboardLayoutGuideForCurrentAssistantFrame;
- (void)_updatedController;
- (void)didUpdateTransition;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)panGestureHandler:(id)a3;
- (void)setCompact:(BOOL)a3;
- (void)setDraggingState:(int64_t)a3;
- (void)setPositionAndVisualStateByPersistentLocation:(BOOL)a3 minimize:(BOOL)a4;
- (void)setRemotePlacement:(id)a3;
- (void)transitToDraggingVisualState:(int64_t)a3 withTouchLocation:(CGPoint)a4;
- (void)updateTransition:(CGPoint)a3 animated:(BOOL)a4;
@end

@implementation UIFlickingAssistantViewSupport

- (void)_disconnectingController:(id)a3
{
  id v4 = a3;
  v5 = [v4 applicator];
  v6 = [v5 draggableView];
  [v6 removeGestureRecognizer:self->_panRecognizer];

  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = 0;

  remotePlacement = self->_remotePlacement;
  self->_remotePlacement = 0;

  v9 = [(UISplitKeyboardSource *)self->super._controller view];
  -[UIView _removeGeometryChangeObserver:](v9, self);

  v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v11 = [v10 systemInputAssistantViewController];

  v12 = [v11 view];
  v13 = [v12 layer];
  [v13 removeObserver:self forKeyPath:@"bounds"];

  v14.receiver = self;
  v14.super_class = (Class)UIFlickingAssistantViewSupport;
  [(UIKeyboardMotionSupport *)&v14 _disconnectingController:v4];
}

- (void)_connectController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIFlickingAssistantViewSupport;
  [(UIKeyboardMotionSupport *)&v14 _connectController:v4];
  v5 = [(UISplitKeyboardSource *)self->super._controller view];
  -[UIView _addGeometryChangeObserver:](v5, self);

  if (!+[UIKeyboardImpl isFloatingForced])
  {
    v6 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel_panGestureHandler_];
    panRecognizer = self->_panRecognizer;
    self->_panRecognizer = v6;

    [(UIPanGestureRecognizer *)self->_panRecognizer setFailsPastMaxTouches:1];
    [(UIGestureRecognizer *)self->_panRecognizer setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)self->_panRecognizer setCancelsTouchesInView:1];
    [(UIPanGestureRecognizer *)self->_panRecognizer setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)self->_panRecognizer setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)self->_panRecognizer _setHysteresis:30.0];
  }
  [(UIFlickingAssistantViewSupport *)self _initalizePosition];
  if (self->_panRecognizer)
  {
    v8 = [v4 applicator];
    v9 = [v8 draggableView];
    [v9 addGestureRecognizer:self->_panRecognizer];
  }
  v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v11 = [v10 systemInputAssistantViewController];

  v12 = [v11 view];
  v13 = [v12 layer];
  [v13 addObserver:self forKeyPath:@"bounds" options:3 context:0];
}

- (void)_updatedController
{
  v12.receiver = self;
  v12.super_class = (Class)UIFlickingAssistantViewSupport;
  [(UIKeyboardMotionSupport *)&v12 _updatedController];
  panRecognizer = self->_panRecognizer;
  if (panRecognizer)
  {
    id v4 = [(UIGestureRecognizer *)panRecognizer view];
    v5 = [(UIKeyboardMotionSupport *)self masterController];
    v6 = [v5 applicator];
    v7 = [v6 draggableView];

    if (v4 != v7)
    {
      v8 = [(UIGestureRecognizer *)self->_panRecognizer view];
      [v8 removeGestureRecognizer:self->_panRecognizer];

      v9 = [(UIKeyboardMotionSupport *)self masterController];
      v10 = [v9 applicator];

      v11 = [v10 draggableView];
      [v11 addGestureRecognizer:self->_panRecognizer];
    }
  }
  [(UIFlickingAssistantViewSupport *)self _initalizePosition];
}

- (void)setPositionAndVisualStateByPersistentLocation:(BOOL)a3 minimize:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v8 = [v7 preferencesActions];
  uint64_t v9 = [v8 compactAssistantBarPersistentLocation];

  v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v11 = [v10 systemInputAssistantViewController];
  id v23 = [v11 systemInputAssistantView];

  if (v9)
  {
    if ([v23 isInputAssistantItemHidden])
    {
      char v12 = [v23 centerViewHidden];
      uint64_t v13 = v9 & 4;
      if ((v12 & 1) != 0 || (v9 & 4) != 0)
      {
LABEL_14:
        BOOL v15 = v13 == 0;
        int64_t v16 = 3;
        if (v15) {
          int64_t v17 = 3;
        }
        else {
          int64_t v17 = 1;
        }
        self->_visualState = v17;
        objc_super v14 = v23;
        if ((v9 & 1) == 0)
        {
          if ((v9 & 2) == 0)
          {
            v18 = +[UIKeyboardImpl activeInstance];
            v19 = [v18 inputDelegate];
            v20 = [v19 textInputView];
            int v21 = [v20 _shouldReverseLayoutDirection];
            int64_t v22 = 2;
            if (v21) {
              int64_t v22 = 3;
            }
            self->_position = v22;

            goto LABEL_10;
          }
          int64_t v16 = 2;
        }
        self->_position = v16;
        goto LABEL_24;
      }
    }
    else if ((v9 & 4) != 0)
    {
      uint64_t v13 = v9 & 4;
      goto LABEL_14;
    }
  }
  if (UIAssistantViewAllowsMinimization() && v4)
  {
    self->_position = self->_lastMinimizedPosition;
    self->_visualState = 1;
LABEL_10:
    objc_super v14 = v23;
    goto LABEL_24;
  }
  objc_super v14 = v23;
  if (v5)
  {
    self->_visualState = 2;
    self->_position = 1;
  }
LABEL_24:
}

- (void)_initalizePosition
{
  remotePlacement = self->_remotePlacement;
  if (remotePlacement)
  {
    if ([(UIInputViewSetPlacement *)remotePlacement isCompactAssistantView])
    {
      self->_visualState = 1;
      int v4 = [(UIInputViewSetPlacement *)self->_remotePlacement isMemberOfClass:objc_opt_class()];
      int64_t v5 = 2;
      if (!v4) {
        int64_t v5 = 3;
      }
      self->_position = v5;
      self->_lastMinimizedPosition = v5;
      [(UIKeyboardMotionSupport *)self translateToPlacement:self->_remotePlacement animated:0];
    }
    v6 = self->_remotePlacement;
    self->_remotePlacement = 0;
  }
  else if (self->_visualState == 1 {
         && ([(UISplitKeyboardSource *)self->super._controller placement],
  }
             v7 = objc_claimAutoreleasedReturnValue(),
             char v8 = [v7 isCompactAssistantView],
             v7,
             (v8 & 1) != 0))
  {
    [(UIFlickingAssistantViewSupport *)self setPositionAndVisualStateByPersistentLocation:0 minimize:0];
  }
  else
  {
    [(UIFlickingAssistantViewSupport *)self setPositionAndVisualStateByPersistentLocation:1 minimize:0];
    self->_lastMinimizedPosition = 2;
  }
  [(UIFlickingAssistantViewSupport *)self keyboardOriginFromAssistantViewPosition:self->_position];
  -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 0);
}

- (void)panGestureHandler:(id)a3
{
  v101[4] = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  uint64_t v4 = [(UISplitKeyboardSource *)self->super._controller hostView];
  if (v4)
  {
    int64_t v5 = (void *)v4;
    v6 = +[UIInputSwitcherView activeInstance];
    char v7 = [v6 isVisible];

    if ((v7 & 1) == 0)
    {
      char v8 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
      uint64_t v9 = [v8 inputAccessoryView];
      if (v9)
      {
        v10 = (void *)v9;
        v11 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
        int v12 = [v11 isInputAccessoryViewPlaceholder];

        if (!v12) {
          goto LABEL_49;
        }
      }
      else
      {
      }
      if (!+[UIKeyboardImpl isFloatingForced]) {
        goto LABEL_9;
      }
      uint64_t v13 = +[UIKeyboardImpl activeInstance];
      [v13 bounds];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      int64_t v22 = +[UIKeyboardImpl activeInstance];
      [v100 locationInView:v22];
      v103.CGFloat x = v23;
      v103.CGFloat y = v24;
      v104.origin.CGFloat x = v15;
      v104.origin.CGFloat y = v17;
      v104.size.CGFloat width = v19;
      v104.size.CGFloat height = v21;
      BOOL v25 = CGRectContainsPoint(v104, v103);

      if (!v25)
      {
LABEL_9:
        uint64_t v26 = [v100 state];
        if ((unint64_t)(v26 - 3) >= 2)
        {
          if (v26 == 2)
          {
            v59 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
            v60 = [v59 systemInputAssistantViewController];
            v61 = [v60 predictionViewController];
            v62 = [v61 predictionView];
            [v62 cancelTapGestureRecognizer];

            v63 = [(UISplitKeyboardSource *)self->super._controller view];
            [v100 locationInView:v63];
            CGFloat v65 = v64;
            CGFloat v67 = v66;

            v68 = [(UISplitKeyboardSource *)self->super._controller view];
            [v68 bounds];
            uint64_t v73 = UIAssistantViewVisualStateForPointInRect(self->_visualState == 3, v69, v70, v71, v72, v65, v67);

            if ((v73 | 2) == 3) {
              -[UIFlickingAssistantViewSupport transitToDraggingVisualState:withTouchLocation:](self, "transitToDraggingVisualState:withTouchLocation:", v73, v65, v67);
            }
            v74 = [v100 view];
            [v74 setNeedsLayout];

            -[UIFlickingAssistantViewSupport barOriginFromTouchPoint:](self, "barOriginFromTouchPoint:", v65, v67);
            double v76 = v75;
            double v78 = v77;
            if (v73 == 3)
            {
              v79 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
              v80 = [v79 systemInputAssistantViewController];
              int v81 = objc_msgSend(v80, "updateFloatingAssistantRectEdge:position:", 2, v76, v78);

              if (v81) {
                double v76 = 0.0;
              }
            }
            -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 1, v76, v78);
          }
          else if (v26 == 1)
          {
            v27 = [(UISplitKeyboardSource *)self->super._controller view];
            [v100 locationInView:v27];
            self->_initalTouchPoint.CGFloat x = v28;
            self->_initalTouchPoint.CGFloat y = v29;

            if (self->_visualState >= 2uLL)
            {
              BOOL v30 = [(UIFlickingAssistantViewSupport *)self isInputAssistantItemHidden];
              int64_t v31 = 2;
              if (v30) {
                int64_t v31 = 3;
              }
              self->_visualState = v31;
            }
          }
          goto LABEL_49;
        }
        v32 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v33 = [v32 visualModeManager];
        int v34 = [v33 shouldShowWithinAppWindow];

        [(UIFlickingAssistantViewSupport *)self projectedLandingPointForGestureRecognizerEnd:v100];
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        v39 = [(UISplitKeyboardSource *)self->super._controller view];
        [v39 bounds];
        CGRect v106 = CGRectInset(v105, 16.0, 16.0);
        CGFloat x = v106.origin.x;
        CGFloat y = v106.origin.y;
        CGFloat width = v106.size.width;
        CGFloat height = v106.size.height;

        int64_t v44 = UIAssistantViewVisualStateForPointInRect(self->_visualState == 3, x, y, width, height, v36, v38);
        unint64_t v45 = v44;
        if ((v44 | 2) == 3)
        {
          v107.origin.CGFloat x = x;
          v107.origin.CGFloat y = y;
          v107.size.CGFloat width = width;
          v107.size.CGFloat height = height;
          CGFloat MaxX = CGRectGetMaxX(v107);
          v108.origin.CGFloat x = x;
          v108.origin.CGFloat y = y;
          v108.size.CGFloat width = width;
          v108.size.CGFloat height = height;
          CGFloat MaxY = CGRectGetMaxY(v108);
          v109.origin.CGFloat x = x;
          v109.origin.CGFloat y = y;
          v109.size.CGFloat width = width;
          v109.size.CGFloat height = height;
          CGFloat MinX = CGRectGetMinX(v109);
          v110.origin.CGFloat x = x;
          v110.origin.CGFloat y = y;
          v110.size.CGFloat width = width;
          v110.size.CGFloat height = height;
          CGFloat v48 = CGRectGetMaxY(v110);
          uint64_t v49 = 0;
          *(CGFloat *)v101 = MaxX;
          *(CGFloat *)&v101[1] = MaxY;
          *(CGFloat *)&v101[2] = MinX;
          *(CGFloat *)&v101[3] = v48;
          char v50 = 1;
          uint64_t v51 = 1;
          double v52 = 3.40282347e38;
          do
          {
            char v53 = v50;
            double v54 = sqrt((*(double *)&v101[2 * v49] - v36) * (*(double *)&v101[2 * v49] - v36)+ (*(double *)&v101[2 * v49 + 1] - v38) * (*(double *)&v101[2 * v49 + 1] - v38));
            if (v54 < v52)
            {
              uint64_t v51 = qword_186B9AC10[v49];
              double v52 = v54;
            }
            char v50 = 0;
            uint64_t v49 = 1;
          }
          while ((v53 & 1) != 0);
          if (v51 == 4) {
            int64_t v55 = 3;
          }
          else {
            int64_t v55 = 2 * (v51 == 8);
          }
          p_position = &self->_position;
          self->_position = v55;
          self->_visualState = v45;
          self->_draggingState = 0;
          if (v45 > 1) {
            goto LABEL_34;
          }
          v57 = &OBJC_IVAR___UIFlickingAssistantViewSupport__lastMinimizedPosition;
          uint64_t v58 = v55;
        }
        else
        {
          int64_t v55 = 0;
          v57 = &OBJC_IVAR___UIFlickingAssistantViewSupport__draggingState;
          p_position = &self->_position;
          uint64_t v58 = 1;
          self->_position = 1;
          self->_visualState = v44;
        }
        *(Class *)((char *)&self->super.super.isa + *v57) = (Class)v55;
        int64_t v55 = v58;
LABEL_34:
        v82 = UIInputViewSetPlacementFromAssistantViewVisualState(v45, v55, 0);
        if (v82)
        {
          BOOL v83 = v45 == 1;
          v84 = +[UIKeyboardPreferencesController sharedPreferencesController];
          v85 = [v84 preferencesActions];
          uint64_t v86 = [v85 compactAssistantBarPersistentLocation];

          uint64_t v87 = 4 * v83;
          unint64_t v88 = v86 & 0xFFFFFFFFFFFFFFFBLL | (4 * v83);
          uint64_t v89 = v87 | 2;
          uint64_t v90 = v87 | 1;
          if (v55 != 3) {
            uint64_t v90 = v88;
          }
          if (v55 == 2) {
            uint64_t v91 = v89;
          }
          else {
            uint64_t v91 = v90;
          }
          v92 = +[UIKeyboardPreferencesController sharedPreferencesController];
          v93 = [v92 preferencesActions];
          [v93 setCompactAssistantBarPersistentLocation:v91];

          v94 = +[UIKeyboardPreferencesController sharedPreferencesController];
          v95 = [v94 preferencesActions];
          [v95 synchronizePreferences];
        }
        v96 = [v32 visualModeManager];
        int v97 = [v96 shouldShowWithinAppWindow];

        if (v34 == v97)
        {
          if (v82) {
            [(UIKeyboardMotionSupport *)self translateToPlacement:v82 animated:1];
          }
          self->_shouldNotifyCompletion = 1;
          [(UIFlickingAssistantViewSupport *)self keyboardOriginFromAssistantViewPosition:*p_position];
          -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 1);
          [(UIFlickingAssistantViewSupport *)self assistantFrame];
          [(UIFlickingAssistantViewSupport *)self _updateKeyboardLayoutGuideForAssistantFrame:"_updateKeyboardLayoutGuideForAssistantFrame:"];
          v98 = +[UIKeyboardImpl activeInstance];
          [v98 updateAssistantView];
        }
        else
        {
          if (v82) {
            [(UIKeyboardMotionSupport *)self translateToPlacement:v82 animated:0];
          }
          v98 = [v32 responder];
          [v32 _reloadInputViewsForResponder:v98];
        }
      }
    }
  }
LABEL_49:
}

- (BOOL)isInputAssistantItemHidden
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v3 = [v2 systemInputAssistantViewController];
  char v4 = [v3 isInputAssistantItemEmpty];

  return v4;
}

- (void)transitToDraggingVisualState:(int64_t)a3 withTouchLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if ([(UIFlickingAssistantViewSupport *)self draggingState] != a3)
  {
    [(UIFlickingAssistantViewSupport *)self setDraggingState:a3];
    UIInputViewSetPlacementFromAssistantViewVisualState(a3, 0, 1);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if ([v9 isMemberOfClass:objc_opt_class()])
    {
      id v8 = v9;
      -[UIFlickingAssistantViewSupport barOriginFromTouchPoint:](self, "barOriginFromTouchPoint:", x, y);
      objc_msgSend(v8, "setOffset:");
    }
    if (v9) {
      [(UIKeyboardMotionSupport *)self translateToPlacement:v9 animated:1];
    }
  }
}

- (CGPoint)projectedLandingPointForGestureRecognizerEnd:(id)a3
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(UISplitKeyboardSource *)self->super._controller view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(UISplitKeyboardSource *)self->super._controller view];
  [v4 velocityInView:v10];
  double v12 = v11;
  double v14 = v13;

  double v15 = sqrt(v12 * v12 + v14 * v14);
  double v16 = [(UISplitKeyboardSource *)self->super._controller view];
  [v16 bounds];
  CGRect v55 = CGRectInset(v54, 16.0, 16.0);
  CGFloat x = v55.origin.x;
  CGFloat y = v55.origin.y;
  CGFloat width = v55.size.width;
  CGFloat height = v55.size.height;

  if (v15 >= 2100.0)
  {
    double v20 = *MEMORY[0x1E4F1DAD8];
    double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v12 != *MEMORY[0x1E4F1DAD8] || v14 != v21)
    {
      double v20 = v12 * (1.0 / v15);
      double v21 = v14 * (1.0 / v15);
    }
    double v23 = v7 + v20;
    double v45 = v9 + v21;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v56);
    v57.origin.CGFloat x = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    *(CGFloat *)uint64_t v51 = MaxX;
    v51[1] = CGRectGetMinY(v57);
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = y;
    v58.size.CGFloat width = width;
    v58.size.CGFloat height = height;
    CGFloat v25 = CGRectGetMaxX(v58);
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    *(CGFloat *)&v51[2] = v25;
    v51[3] = CGRectGetMaxY(v59);
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v60);
    v61.origin.CGFloat x = x;
    v61.origin.CGFloat y = y;
    v61.size.CGFloat width = width;
    v61.size.CGFloat height = height;
    *(CGFloat *)char v50 = MinX;
    v50[1] = CGRectGetMaxY(v61);
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    CGFloat v27 = CGRectGetMaxX(v62);
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    *(CGFloat *)&v50[2] = v27;
    v50[3] = CGRectGetMaxY(v63);
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    CGFloat v28 = CGRectGetMinX(v64);
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    *(CGFloat *)uint64_t v49 = v28;
    v49[1] = CGRectGetMinY(v65);
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.CGFloat width = width;
    v66.size.CGFloat height = height;
    CGFloat v29 = CGRectGetMinX(v66);
    double v46 = x;
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    uint64_t v30 = 0;
    *(CGFloat *)&v49[2] = v29;
    v49[3] = CGRectGetMaxY(v67);
    v48[0] = v51;
    v48[1] = v50;
    double v31 = v23 - v7;
    double v32 = v45 - v9;
    v48[2] = v49;
    while (1)
    {
      v33 = (double *)v48[v30];
      double v34 = ((v33[2] - *v33) * (v33[1] - v9) + (v7 - *v33) * (v33[3] - v33[1]))
          / (v32 * (v33[2] - *v33) - v31 * (v33[3] - v33[1]));
      if (v34 >= 0.0)
      {
        double v35 = v9 + v32 * v34;
        double v36 = v7 + v31 * v34;
        double v37 = [(UISplitKeyboardSource *)self->super._controller view];
        [v37 bounds];
        v53.CGFloat x = v36;
        v53.CGFloat y = v35;
        BOOL v38 = CGRectContainsPoint(v68, v53);

        if (v38) {
          break;
        }
      }
      if (++v30 == 3)
      {
        double v35 = v9;
        double v36 = v7;
        break;
      }
    }
    double v9 = v35;
    double v7 = v36;
    CGFloat x = v46;
  }
  UIAssistantViewClosestReferencePointFromPointInRect(x, y, width, height, v7, v9);
  double v40 = v39;
  double v42 = v41;

  double v43 = v40;
  double v44 = v42;
  result.CGFloat y = v44;
  result.CGFloat x = v43;
  return result;
}

- (BOOL)isRTL
{
  v2 = +[UIKeyboardImpl activeInstance];
  v3 = [v2 remoteTextInputPartner];
  id v4 = [v3 rtiDocumentTraits];

  if (+[UIKeyboard isInputSystemUI]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v5 = [v4 shouldReverseLayoutDirection];
  }
  else
  {
    double v6 = +[UIKeyboardImpl activeInstance];
    double v7 = [v6 inputDelegate];
    double v8 = [v7 textInputView];
    char v5 = [v8 _shouldReverseLayoutDirection];
  }
  return v5;
}

- (CGPoint)barOriginFromTouchPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UISplitKeyboardSource *)self->super._controller view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  double v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v12 = [v11 systemInputAssistantViewController];
  [v12 barFrame];
  double v14 = v13;
  double v16 = v15;

  CGFloat v17 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v18 = [v17 visualModeManager];
  int v19 = [v18 shouldShowWithinAppWindow];

  if (v19)
  {
    double v20 = v8 + -16.0;
    if (x < v8 + -16.0) {
      double v20 = x;
    }
    double x = fmax(v20, 16.0);
    double v21 = v10 + -16.0;
    if (y < v10 + -16.0) {
      double v21 = y;
    }
    double y = fmax(v21, 16.0);
  }
  switch([(UIFlickingAssistantViewSupport *)self draggingState])
  {
    case 0:
    case 2:
      double v22 = x - self->_initalTouchPoint.x;
      break;
    case 1:
      double v22 = x + v8 * -0.5;
      break;
    case 3:
      BOOL v23 = [(UIFlickingAssistantViewSupport *)self isRTL];
      double v24 = v8 - x;
      if (!v23) {
        double v24 = x;
      }
      double v22 = v24 + v14 * -0.5;
      break;
    default:
      break;
  }
  double v25 = v10 - (v16 * 0.5 + y);
  result.double y = v25;
  result.double x = v22;
  return result;
}

- (void)updateTransition:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if (self->_visualState == 3 && a3.x != 0.0)
  {
    double v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v9 = [v8 systemInputAssistantViewController];
    int v10 = objc_msgSend(v9, "updateFloatingAssistantRectEdge:position:", -[UIFlickingAssistantViewSupport rectEdgeFromPosition:](self, "rectEdgeFromPosition:", self->_position), x, y);

    if (v10) {
      double x = 0.0;
    }
  }
  double v11 = @"_UIFlickingAssistantViewGestureWithoutAnimation";
  if (v4) {
    double v11 = @"_UIFlickingAssistantViewGesture";
  }
  double v12 = v11;
  double v13 = +[UIInputViewSetPlacementAssistantOnScreen infoWithPoint:isCompact:frame:position:](UIInputViewSetPlacementAssistantOnScreen, "infoWithPoint:isCompact:frame:position:", self->_visualState == 1, 0, x, y, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (!v4)
  {
    [(UIFlickingAssistantViewSupport *)self assistantFrame];
    [(UIFlickingAssistantViewSupport *)self _updateKeyboardLayoutGuideForAssistantFrame:"_updateKeyboardLayoutGuideForAssistantFrame:"];
  }
  double v14 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__UIFlickingAssistantViewSupport_updateTransition_animated___block_invoke;
  v17[3] = &unk_1E52EBE18;
  double v18 = v12;
  id v19 = v13;
  id v15 = v13;
  double v16 = v12;
  [v14 performOnLocalDistributedControllers:v17];
}

uint64_t __60__UIFlickingAssistantViewSupport_updateTransition_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateTransition:*(void *)(a1 + 32) withInfo:*(void *)(a1 + 40)];
}

- (CGPoint)keyboardOriginFromAssistantViewPosition:(int64_t)a3
{
  char v5 = [(UISplitKeyboardSource *)self->super._controller view];
  [v5 bounds];

  double v6 = UIInputViewSetPlacementFromAssistantViewVisualState(self->_visualState, a3, 0);
  double v7 = [(UISplitKeyboardSource *)self->super._controller inputViewSet];
  [v6 inputAssistantViewHeightForInputViewSet:v7];

  if (self->_visualState == 3)
  {
    double v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v9 = [v8 systemInputAssistantViewController];

    int v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v11 = [v10 preferencesActions];
    [v11 compactAssistantBarPersistentLocation];

    if (a3 == 1)
    {
      if (os_variant_has_internal_diagnostics())
      {
        CGFloat v17 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Empty bar must not be put at the center", buf, 2u);
        }
      }
      else
      {
        double v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &keyboardOriginFromAssistantViewPosition____s_category)+ 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v18 = 0;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Empty bar must not be put at the center", v18, 2u);
        }
      }
    }
    double v13 = *(double *)&UIFloatingAssistantBottomMargin;

    double v14 = 16.0;
  }
  else
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      double v13 = 16.0;
    }
    else {
      double v13 = *(double *)&UIFloatingAssistantBottomMargin;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      double v14 = 16.0;
    }
    else {
      double v14 = 0.0;
    }
  }

  double v15 = v14;
  double v16 = v13;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)setCompact:(BOOL)a3
{
  [(UIFlickingAssistantViewSupport *)self setPositionAndVisualStateByPersistentLocation:1 minimize:a3];
  UIInputViewSetPlacementFromAssistantViewVisualState(self->_visualState, self->_position, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v6 = [v5 systemInputAssistantViewController];
  double v7 = [v6 systemInputAssistantView];

  uint64_t v8 = [v7 centerViewHidden] ^ 1;
  int v9 = [v7 isInputAssistantItemHidden];
  if (v10) {
    [(UIKeyboardMotionSupport *)self translateToPlacement:v10 animated:v8];
  }
  if (!a3 && self->_position == 1 && v9 != [v7 isInputAssistantItemHidden]) {
    [(UIFlickingAssistantViewSupport *)self setPositionAndVisualStateByPersistentLocation:1 minimize:0];
  }
  [(UIFlickingAssistantViewSupport *)self keyboardOriginFromAssistantViewPosition:self->_position];
  -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", v8);
  [(UIFlickingAssistantViewSupport *)self assistantFrame];
  [(UIFlickingAssistantViewSupport *)self _updateKeyboardLayoutGuideForAssistantFrame:"_updateKeyboardLayoutGuideForAssistantFrame:"];
}

- (unint64_t)assistantPosition
{
  if ([(UIFlickingAssistantViewSupport *)self draggingState]
    || (self->_visualState | 2) != 3
    && ![(UIFlickingAssistantViewSupport *)self isInputAssistantItemHidden])
  {
    return 0;
  }
  if (self->_position == 3) {
    return 4;
  }
  return 8;
}

- (CGRect)assistantFrame
{
  v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v4 = [v3 systemInputAssistantViewController];

  [v4 barFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(UIKeyboardMotionSupport *)self masterController];
  double v14 = [v13 view];
  double v15 = [v4 view];
  objc_msgSend(v14, "convertRect:fromView:", v15, v6, v8, v10, v12);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)didUpdateTransition
{
  if (self->_shouldNotifyCompletion)
  {
    [(UIFlickingAssistantViewSupport *)self keyboardOriginFromAssistantViewPosition:self->_position];
    double v4 = v3;
    double v6 = v5;
    int64_t visualState = self->_visualState;
    if (visualState == 3)
    {
      double v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v9 = [v8 systemInputAssistantViewController];
      int v10 = objc_msgSend(v9, "updateFloatingAssistantRectEdge:position:", -[UIFlickingAssistantViewSupport rectEdgeFromPosition:](self, "rectEdgeFromPosition:", self->_position), v4, v6);

      if (v10) {
        double v4 = 0.0;
      }
      int64_t visualState = self->_visualState;
    }
    BOOL v11 = visualState == 1;
    [(UIFlickingAssistantViewSupport *)self assistantFrame];
    double v16 = +[UIInputViewSetPlacementAssistantOnScreen infoWithPoint:isCompact:frame:position:](UIInputViewSetPlacementAssistantOnScreen, "infoWithPoint:isCompact:frame:position:", v11, [(UIFlickingAssistantViewSupport *)self assistantPosition], v4, v6, v12, v13, v14, v15);
    double v17 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__UIFlickingAssistantViewSupport_didUpdateTransition__block_invoke;
    v19[3] = &unk_1E52FC280;
    id v20 = v16;
    id v18 = v16;
    [v17 performOnLocalDistributedControllers:v19];

    self->_shouldNotifyCompletion = 0;
  }
}

uint64_t __53__UIFlickingAssistantViewSupport_didUpdateTransition__block_invoke(uint64_t a1, void *a2)
{
  return [a2 completeTransition:@"_UIFlickingAssistantViewGesture" withInfo:*(void *)(a1 + 32)];
}

- (unint64_t)rectEdgeFromPosition:(int64_t)a3
{
  if (a3 == 2)
  {
    BOOL v3 = ![(UIFlickingAssistantViewSupport *)self isRTL];
    unint64_t v4 = 8;
    unint64_t v5 = 2;
  }
  else
  {
    if (a3 != 3) {
      return 4;
    }
    BOOL v3 = ![(UIFlickingAssistantViewSupport *)self isRTL];
    unint64_t v4 = 2;
    unint64_t v5 = 8;
  }
  if (v3) {
    return v4;
  }
  else {
    return v5;
  }
}

- (void)_updateKeyboardLayoutGuideForAssistantFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(UIFlickingAssistantViewSupport *)self draggingState]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = self->_position == 1;
  }
  if ([(UIFlickingAssistantViewSupport *)self draggingState] == 1) {
    int64_t visualState = [(UIFlickingAssistantViewSupport *)self draggingState];
  }
  else {
    int64_t visualState = self->_visualState;
  }
  int v10 = UIInputViewSetPlacementFromAssistantViewVisualState(visualState, self->_position, 0);
  if (y > 0.0 && height <= width * 1.5)
  {
    BOOL v11 = [(UIKeyboardMotionSupport *)self masterController];
    double v12 = [v11 view];
    double v13 = [v12 window];

    v22.origin.CGFloat x = x;
    v22.origin.double y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v22))
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke;
      v14[3] = &unk_1E52FD4E0;
      id v15 = v13;
      CGFloat v17 = x;
      double v18 = y;
      double v19 = width;
      double v20 = height;
      BOOL v21 = v8;
      id v16 = v10;
      +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v14];
    }
  }
}

void __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 _isTextEffectsWindow] & 1) == 0)
  {
    unint64_t v4 = [*(id *)(a1 + 32) windowScene];
    unint64_t v5 = [v4 coordinateSpace];
    double v6 = [v3 windowScene];
    double v7 = [v6 coordinateSpace];
    objc_msgSend(v5, "convertRect:toCoordinateSpace:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    CGFloat x = v8;
    CGFloat y = v10;
    CGFloat width = v12;
    double height = v14;

    [v3 bounds];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    [*(id *)(a1 + 32) bounds];
    v78.origin.CGFloat x = v24;
    v78.origin.CGFloat y = v25;
    v78.size.CGFloat width = v26;
    v78.size.double height = v27;
    v66.origin.CGFloat x = v17;
    v66.origin.CGFloat y = v19;
    v66.size.CGFloat width = v21;
    v66.size.double height = v23;
    if (!CGRectEqualToRect(v66, v78))
    {
      [v3 bounds];
      v79.origin.CGFloat x = x;
      v79.origin.CGFloat y = y;
      v79.size.CGFloat width = width;
      v79.size.double height = height;
      CGRect v68 = CGRectIntersection(v67, v79);
      CGFloat x = v68.origin.x;
      CGFloat y = v68.origin.y;
      CGFloat width = v68.size.width;
      double height = v68.size.height;
    }
    double v28 = 0.0;
    if (height != 0.0)
    {
      [v3 bounds];
      double MaxY = CGRectGetMaxY(v69);
      v70.origin.CGFloat x = x;
      v70.origin.CGFloat y = y;
      v70.size.CGFloat width = width;
      v70.size.double height = height;
      double v28 = MaxY - CGRectGetMaxY(v70);
    }
    [v3 bounds];
    uint64_t v31 = v30;
    if (*(unsigned char *)(a1 + 80))
    {
      [v3 safeAreaInsets];
      double v33 = height + v32;
    }
    else
    {
      double v33 = height + v28;
      if (v28 >= height) {
        double v33 = height;
      }
    }
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke_2;
    v65[3] = &__block_descriptor_64_e33_v16__0__UIKeyboardSceneDelegate_8l;
    v65[4] = v31;
    *(double *)&v65[5] = v33;
    v65[6] = 0;
    v65[7] = 0;
    +[UIKeyboardSceneDelegate performOnControllers:v65];
  }
  if ([v3 isTrackingKeyboard])
  {
    [v3 updateGuideForKeyboardPlacement:*(void *)(a1 + 40)];
    double v34 = [v3 _primaryKeyboardTrackingGuide];
    [v34 setAddsHeightWhenUndocked:*(unsigned __int8 *)(a1 + 80)];

    [v3 frame];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    objc_msgSend(*(id *)(a1 + 32), "convertRect:toWindow:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v80.origin.CGFloat x = v43;
    v80.origin.CGFloat y = v44;
    v80.size.CGFloat width = v45;
    v80.size.double height = v46;
    v71.origin.CGFloat x = v36;
    v71.origin.CGFloat y = v38;
    v71.size.CGFloat width = v40;
    v71.size.double height = v42;
    CGRect v72 = CGRectIntersection(v71, v80);
    double v47 = v72.origin.x;
    CGFloat v48 = v72.origin.y;
    double v49 = v72.size.width;
    double v50 = v72.size.height;
    if (!CGRectIsEmpty(v72) || ([*(id *)(a1 + 32) _isHostedInAnotherProcess] & 1) == 0)
    {
      v73.origin.CGFloat x = v36;
      v73.origin.CGFloat y = v38;
      v73.size.CGFloat width = v40;
      v73.size.double height = v42;
      double v63 = CGRectGetMaxY(v73);
      v74.origin.CGFloat x = v47;
      v74.origin.CGFloat y = v48;
      v74.size.CGFloat width = v49;
      v74.size.double height = v50;
      CGFloat v64 = v42;
      CGFloat v51 = v38;
      double v52 = CGRectGetMaxY(v74);
      v75.origin.CGFloat x = v47;
      v75.origin.CGFloat y = v48;
      v75.size.CGFloat width = v49;
      v75.size.double height = v50;
      if (CGRectIsEmpty(v75))
      {
        [v3 insetForDismissedKeyboardGuide];
        double v50 = v53;
        v76.origin.CGFloat x = v36;
        v76.origin.CGFloat y = v51;
        v76.size.CGFloat width = v40;
        v76.size.double height = v64;
        CGRectGetMinX(v76);
        v77.origin.CGFloat x = v36;
        v77.origin.CGFloat y = v51;
        v77.size.CGFloat width = v40;
        v77.size.double height = v64;
        double v54 = CGRectGetMaxY(v77);
        double v47 = 0.0;
        double v49 = v40;
        double v55 = v50;
      }
      else
      {
        double v54 = v63;
        double v55 = v63 - v52;
      }
      CGRect v56 = objc_msgSend(v3, "_primaryKeyboardTrackingGuide", v54, *(void *)&v63);
      [v56 enableAnimations:0];

      char v57 = 0;
      if (v55 < v50)
      {
        CGRect v58 = [v3 _primaryKeyboardTrackingGuide];
        char v57 = objc_msgSend(v58, "changeOffsetConstants:", v47, v55);
      }
      CGRect v59 = [v3 _primaryKeyboardTrackingGuide];
      int v60 = objc_msgSend(v59, "changeSizingConstants:", v49, v50);

      CGRect v61 = [v3 _primaryKeyboardTrackingGuide];
      [v61 setAddsHeightWhenUndocked:0];

      if ((v57 & 1) != 0 || v60) {
        [v3 layoutViewsForTrackedGuides];
      }
      CGRect v62 = [v3 _primaryKeyboardTrackingGuide];
      [v62 enableAnimations:1];
    }
  }
}

void __78__UIFlickingAssistantViewSupport__updateKeyboardLayoutGuideForAssistantFrame___block_invoke_2(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "updateTrackingElementsForSize:", v3, v4);
  objc_msgSend(v5, "updateTrackingElementsForOffset:", a1[6], a1[7]);
}

- (BOOL)handlingFlickGesture
{
  return [(UIGestureRecognizer *)self->_panRecognizer state] != UIGestureRecognizerStatePossible;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if (!self->_isHandlingGeometryChange)
  {
    self->_isHandlingGeometryChange = 1;
    -[UIFlickingAssistantViewSupport keyboardOriginFromAssistantViewPosition:](self, "keyboardOriginFromAssistantViewPosition:", self->_position, a4);
    -[UIFlickingAssistantViewSupport updateTransition:animated:](self, "updateTransition:animated:", 0);
    [(UIFlickingAssistantViewSupport *)self _updateKeyboardLayoutGuideForCurrentAssistantFrame];
    self->_isHandlingGeometryChange = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v26 = a5;
  if ([a3 isEqualToString:@"bounds"])
  {
    double v8 = [v26 objectForKey:*MEMORY[0x1E4F284C8]];
    [v8 CGRectValue];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    CGFloat v17 = [v26 objectForKey:*MEMORY[0x1E4F284E0]];
    [v17 CGRectValue];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;

    v28.origin.CGFloat x = v10;
    v28.origin.CGFloat y = v12;
    v28.size.CGFloat width = v14;
    v28.size.double height = v16;
    v29.origin.CGFloat x = v19;
    v29.origin.CGFloat y = v21;
    v29.size.CGFloat width = v23;
    v29.size.double height = v25;
    if (!CGRectEqualToRect(v28, v29)) {
      [(UIFlickingAssistantViewSupport *)self performSelector:sel__updateKeyboardLayoutGuideForCurrentAssistantFrame withObject:0 afterDelay:0.0];
    }
  }
}

- (void)_updateKeyboardLayoutGuideForCurrentAssistantFrame
{
  [(UIFlickingAssistantViewSupport *)self assistantFrame];
  [(UIFlickingAssistantViewSupport *)self _updateKeyboardLayoutGuideForAssistantFrame:"_updateKeyboardLayoutGuideForAssistantFrame:"];
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (UIInputViewSetPlacement)remotePlacement
{
  return self->_remotePlacement;
}

- (void)setRemotePlacement:(id)a3
{
}

- (int64_t)draggingState
{
  return self->_draggingState;
}

- (void)setDraggingState:(int64_t)a3
{
  self->_draggingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePlacement, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
}

@end