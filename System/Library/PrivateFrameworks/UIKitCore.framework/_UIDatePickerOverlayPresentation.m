@interface _UIDatePickerOverlayPresentation
- (BOOL)accessoryViewIgnoresDefaultInsets;
- (BOOL)defersAutomaticKeyboardAvoidanceAdjustments;
- (BOOL)ignoresPassthroughOnSourceView;
- (BOOL)isBeingDismissedOrPresented;
- (BOOL)isPresentingContainerViewController;
- (BOOL)isPresentingOverlay;
- (CGPoint)_adjustedAnchorPointForFrame:(CGRect)a3 alignment:(unint64_t)a4 anchorPoint:(CGPoint)a5;
- (CGPoint)_normalizedSourcePointForAnchorPoint:(CGPoint)a3 menuFrame:(CGRect)a4;
- (CGRect)_adjustedFrameForInputSize:(CGSize)a3 outputFrame:(CGRect)a4;
- (CGRect)resolvedSourceBounds;
- (CGRect)resolvedSourceRect;
- (CGRect)sourceRect;
- (UIDatePicker)activeDatePicker;
- (UIView)accessoryView;
- (UIView)sourceView;
- (_UIDatePickerContainerViewController)containerViewController;
- (_UIDatePickerOverlayPlatterLayout)_computedLayoutForPlatterView:(SEL)a3;
- (_UIDatePickerOverlayPlatterView)platterView;
- (_UIDatePickerOverlayPresentation)initWithSourceView:(id)a3;
- (_UIDatePickerOverlayPresentationDelegate)delegate;
- (double)_layoutArbiterAnchorAlignmentOffset;
- (id)dismissHandler;
- (int64_t)_overlayAlignment;
- (int64_t)activeMode;
- (int64_t)alignment;
- (int64_t)overlayAnchor;
- (unint64_t)_overlayAlignmentEdge;
- (void)_prepareDatePickerPresentationWithCompletion:(id)a3;
- (void)_presentNewDatePicker:(id)a3;
- (void)_transitionToDatePicker:(id)a3;
- (void)activateEmptyPresentationWithMode:(int64_t)a3 onDismiss:(id)a4;
- (void)animateDismissalWithAnimations:(id)a3 completion:(id)a4;
- (void)animatePresentWithAnimations:(id)a3 completion:(id)a4;
- (void)animateReducedMotionTransitionWithAnimations:(id)a3 completion:(id)a4;
- (void)animateTransitionWithAnimations:(id)a3 completion:(id)a4;
- (void)dismissPresentationAnimated:(BOOL)a3;
- (void)presentDatePicker:(id)a3 onDismiss:(id)a4;
- (void)retargetCurrentPresentationToSourceView;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryViewIgnoresDefaultInsets:(BOOL)a3;
- (void)setActiveMode:(int64_t)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDefersAutomaticKeyboardAvoidanceAdjustments:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setIgnoresPassthroughOnSourceView:(BOOL)a3;
- (void)setOverlayAnchor:(int64_t)a3;
- (void)setPlatterView:(id)a3;
- (void)setPresentingContainerViewController:(BOOL)a3;
- (void)setSourceRect:(CGRect)a3;
@end

@implementation _UIDatePickerOverlayPresentation

- (_UIDatePickerOverlayPresentation)initWithSourceView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDatePickerOverlayPresentation;
  v5 = [(_UIDatePickerOverlayPresentation *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sourceView, v4);
    *(_OWORD *)&v6->_alignment = xmmword_186B88DB0;
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v6->_sourceRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v6->_sourceRect.size = v7;
  }

  return v6;
}

- (BOOL)isPresentingOverlay
{
  v2 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isBeingDismissedOrPresented
{
  if ([(_UIDatePickerOverlayPresentation *)self isPresentingContainerViewController])
  {
    return 1;
  }
  id v4 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
  char v5 = [v4 isBeingDismissed];

  return v5;
}

- (CGRect)resolvedSourceRect
{
  [(_UIDatePickerOverlayPresentation *)self sourceRect];
  if (CGRectIsNull(v20))
  {
    BOOL v3 = [(_UIDatePickerOverlayPresentation *)self sourceView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    [(_UIDatePickerOverlayPresentation *)self sourceRect];
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
    double v11 = v15;
  }
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)resolvedSourceBounds
{
  if ([(_UIDatePickerOverlayPresentation *)self overlayAnchor] == 2)
  {
    [(_UIDatePickerOverlayPresentation *)self resolvedSourceRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v11 = [(_UIDatePickerOverlayPresentation *)self sourceView];
    [v11 bounds];
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)presentDatePicker:(id)a3 onDismiss:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeWeak((id *)&self->_activeDatePicker, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64___UIDatePickerOverlayPresentation_presentDatePicker_onDismiss___block_invoke;
  v10[3] = &unk_1E530E190;
  double v12 = self;
  id v13 = v7;
  id v11 = v6;
  id v8 = v6;
  id v9 = v7;
  [(_UIDatePickerOverlayPresentation *)self _prepareDatePickerPresentationWithCompletion:v10];
}

- (void)activateEmptyPresentationWithMode:(int64_t)a3 onDismiss:(id)a4
{
  id v10 = a4;
  int64_t activeMode = self->_activeMode;
  if (activeMode) {
    BOOL v7 = activeMode == a3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];

    if (v8)
    {
      id v9 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];
      v9[2](v9, 1);
    }
  }
  [(_UIDatePickerOverlayPresentation *)self setActiveMode:a3];
  [(_UIDatePickerOverlayPresentation *)self setDismissHandler:v10];
}

- (void)dismissPresentationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];

  if (v5)
  {
    id v6 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];
    v6[2](v6, 0);

    [(_UIDatePickerOverlayPresentation *)self setDismissHandler:0];
  }
  BOOL v7 = [(_UIDatePickerOverlayPresentation *)self containerViewController];

  if (v7)
  {
    id v8 = [(_UIDatePickerOverlayPresentation *)self activeDatePicker];
    [v8 resignFirstResponder];

    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x3032000000;
    v48[3] = __Block_byref_object_copy__231;
    v48[4] = __Block_byref_object_dispose__231;
    id v9 = [(_UIDatePickerOverlayPresentation *)self activeDatePicker];
    id v49 = [v9 _style];

    id v10 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__231;
    v46 = __Block_byref_object_dispose__231;
    v47 = self->_platterView;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__231;
    v40 = __Block_byref_object_dispose__231;
    id v41 = 0;
    platterView = self->_platterView;
    if (platterView)
    {
      double v12 = [UIView alloc];
      id v13 = [v10 view];
      [v13 frame];
      uint64_t v14 = -[UIView initWithFrame:](v12, "initWithFrame:");
      double v15 = (void *)v37[5];
      v37[5] = v14;

      double v16 = [v10 view];
      double v17 = [v16 contentView];
      double v18 = v17;
      if (v17)
      {
        [v17 transform];
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
      }
      CGRect v20 = (void *)v37[5];
      v32[0] = v33;
      v32[1] = v34;
      v32[2] = v35;
      [v20 setTransform:v32];

      [(id)v37[5] setUserInteractionEnabled:0];
      [(id)v43[5] setUserInteractionEnabled:0];
      double v19 = self->_platterView;
    }
    else
    {
      double v19 = 0;
    }
    self->_platterView = 0;

    containerViewController = self->_containerViewController;
    self->_containerViewController = 0;

    objc_storeWeak((id *)&self->_activeDatePicker, 0);
    [(_UIDatePickerOverlayPresentation *)self setActiveMode:0];
    if (platterView)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke;
      aBlock[3] = &unk_1E52EAC30;
      aBlock[4] = v48;
      aBlock[5] = &v42;
      v22 = (void (**)(void))_Block_copy(aBlock);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_2;
      v30[3] = &unk_1E530E1B8;
      v30[4] = &v36;
      v23 = _Block_copy(v30);
      v24 = [v10 view];
      v25 = [v24 window];
      [v25 addSubview:v37[5]];

      [(id)v37[5] addSubview:v43[5]];
      v26 = [v10 presentingViewController];
      [v26 dismissViewControllerAnimated:0 completion:0];

      if (v3)
      {
        if (_AXSReduceMotionEnabled())
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_3;
          v29[3] = &unk_1E52D9900;
          v29[4] = &v42;
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __64___UIDatePickerOverlayPresentation_dismissPresentationAnimated___block_invoke_4;
          v27[3] = &unk_1E52D9FE8;
          id v28 = v23;
          [(_UIDatePickerOverlayPresentation *)self animateReducedMotionTransitionWithAnimations:v29 completion:v27];
        }
        else
        {
          [(_UIDatePickerOverlayPresentation *)self animateDismissalWithAnimations:v22 completion:v23];
        }
      }
      else
      {
        v22[2](v22);
        (*((void (**)(void *, uint64_t, void))v23 + 2))(v23, 1, 0);
      }
    }
    else
    {
      v22 = [v10 presentingViewController];
      [v22 dismissViewControllerAnimated:0 completion:0];
    }

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);

    _Block_object_dispose(v48, 8);
  }
  else
  {
    [(_UIDatePickerOverlayPresentation *)self setActiveMode:0];
  }
}

- (void)_prepareDatePickerPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(_UIDatePickerOverlayPresentation *)self activeDatePicker];
  id v6 = [v5 _style];

  BOOL v7 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
  id v8 = [(_UIDatePickerOverlayPresentation *)self sourceView];
  id v9 = [v8 _viewControllerForAncestor];

  if (!v7)
  {
    BOOL v7 = [[_UIDatePickerContainerViewController alloc] initWithPresentation:self];
    id v10 = [(UIViewController *)v7 presentationController];
    [v10 _setContainerIgnoresDirectTouchEvents:1];

    -[UIViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", [v6 datePickerModalPresentationStyle]);
  }
  [(_UIDatePickerOverlayPresentation *)self setContainerViewController:v7];
  id v11 = [(UIViewController *)v7 presentingViewController];

  if (v11)
  {
    if ([(_UIDatePickerOverlayPresentation *)self isPresentingContainerViewController])
    {
      containerPresentCompletion = (void (**)(id, void, uint64_t))self->_containerPresentCompletion;
      if (containerPresentCompletion) {
        containerPresentCompletion[2](containerPresentCompletion, 0, 1);
      }
      id v13 = _Block_copy(v4);
      id v14 = self->_containerPresentCompletion;
      self->_containerPresentCompletion = v13;
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
      id v14 = self->_containerPresentCompletion;
      self->_containerPresentCompletion = 0;
    }

    goto LABEL_16;
  }
  double v15 = [v9 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v16 = [v9 presentedViewController];
    char v17 = [v16 isBeingDismissed];

    if (v17) {
      goto LABEL_12;
    }
    double v15 = [v9 presentedViewController];
    double v18 = [v15 presentation];
    [v18 dismissPresentationAnimated:1];
  }
LABEL_12:
  double v19 = _Block_copy(v4);
  id v20 = self->_containerPresentCompletion;
  self->_containerPresentCompletion = v19;

  if (![(_UIDatePickerOverlayPresentation *)self isPresentingContainerViewController])
  {
    [(_UIDatePickerOverlayPresentation *)self setPresentingContainerViewController:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __81___UIDatePickerOverlayPresentation__prepareDatePickerPresentationWithCompletion___block_invoke;
    v21[3] = &unk_1E52D9F70;
    v21[4] = self;
    [v9 presentViewController:v7 animated:0 completion:v21];
  }
LABEL_16:
}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    id v4 = [(_UIDatePickerOverlayPresentation *)self platterView];

    if (v4)
    {
      [(_UIDatePickerOverlayPresentation *)self _transitionToDatePicker:0];
    }
  }
}

- (void)setActiveMode:(int64_t)a3
{
  if (self->_activeMode != a3)
  {
    self->_int64_t activeMode = a3;
    id v5 = [(_UIDatePickerOverlayPresentation *)self delegate];
    [v5 _datePickerPresentation:self didChangeActiveMode:a3];
  }
}

- (void)setDefersAutomaticKeyboardAvoidanceAdjustments:(BOOL)a3
{
  if (self->_defersAutomaticKeyboardAvoidanceAdjustments != a3)
  {
    self->_defersAutomaticKeyboardAvoidanceAdjustments = a3;
    id v3 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
    [v3 didChangeKeyboardAvoidanceAdjustmentDeferral];
  }
}

- (void)setAccessoryViewIgnoresDefaultInsets:(BOOL)a3
{
  BOOL v3 = a3;
  self->_accessoryViewIgnoresDefaultInsets = a3;
  id v4 = [(_UIDatePickerOverlayPresentation *)self platterView];
  [v4 setAccessoryViewIgnoresDefaultInsets:v3];
}

- (void)_presentNewDatePicker:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];

  if (v5)
  {
    id v6 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];
    v6[2](v6, 0);

    [(_UIDatePickerOverlayPresentation *)self setDismissHandler:0];
  }
  BOOL v7 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
  id v8 = [v7 view];

  id v9 = [[_UIDatePickerOverlayPlatterView alloc] initWithDatePicker:v4 accessoryView:self->_accessoryView];
  [(_UIDatePickerOverlayPlatterView *)v9 setAccessoryViewIgnoresDefaultInsets:[(_UIDatePickerOverlayPresentation *)self accessoryViewIgnoresDefaultInsets]];
  id v10 = [v8 contentView];
  [v10 addSubview:v9];

  objc_storeStrong((id *)&self->_platterView, v9);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v70 = 0u;
  memset(&v69, 0, sizeof(v69));
  [(_UIDatePickerOverlayPresentation *)self _computedLayoutForPlatterView:v9];
  [(UIView *)v9 setCenter:v70];
  -[_UIDatePickerOverlayPlatterView setContentBounds:](v9, "setContentBounds:", *(_OWORD *)&v69.origin, *(_OWORD *)&v69.size);
  id v11 = [(_UIDatePickerOverlayPresentation *)self activeDatePicker];
  double v12 = [v11 _style];

  [v12 overlayPlatterInitialScale];
  double v14 = v13;
  CGAffineTransformMakeScale(&v68, v13, v13);
  CGAffineTransform v67 = v68;
  [(UIView *)v9 setTransform:&v67];
  [v12 overlayPlatterInitialHeight];
  double v16 = v15;
  CGPoint origin = v69.origin;
  CGSize size = v69.size;
  double Height = CGRectGetHeight(v69);
  if (Height >= v16 / v14) {
    double v20 = v16 / v14;
  }
  else {
    double v20 = Height;
  }
  v75.CGPoint origin = origin;
  v75.CGSize size = size;
  -[UIView setBounds:](v9, "setBounds:", 0.0, 0.0, CGRectGetWidth(v75), v20);
  [(UIView *)v9 setCenter:v70];
  [(UIView *)v9 setAlpha:0.0];
  long long v21 = v71;
  v22 = [(UIView *)v9 layer];
  [v22 setAnchorPoint:v21];

  [(UIView *)v9 layoutIfNeeded];
  long long v64 = v72;
  long long v65 = v73;
  long long v66 = v74;
  v23 = [v8 contentView];
  v63[0] = v64;
  v63[1] = v65;
  v63[2] = v66;
  [v23 setTransform:v63];

  [v8 bounds];
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  v32 = [v8 contentView];
  [v32 frame];
  CGFloat y = v76.origin.y;
  CGFloat width = v76.size.width;
  CGFloat v34 = v76.size.height;
  CGFloat x = v76.origin.x;
  CGFloat rect_8 = v76.origin.x;
  double MinY = CGRectGetMinY(v76);
  v77.origin.CGFloat x = v25;
  v77.origin.CGFloat y = v27;
  v77.size.CGFloat width = v29;
  v77.size.height = v31;
  double v49 = MinY - CGRectGetMinY(v77);
  v78.origin.CGFloat x = x;
  v78.origin.CGFloat y = y;
  v78.size.CGFloat width = width;
  v78.size.height = v34;
  double MinX = CGRectGetMinX(v78);
  v79.origin.CGFloat x = v25;
  v79.origin.CGFloat y = v27;
  v79.size.CGFloat width = v29;
  v79.size.height = v31;
  double rect_24 = MinX - CGRectGetMinX(v79);
  v80.origin.CGFloat x = v25;
  v80.origin.CGFloat y = v27;
  v80.size.CGFloat width = v29;
  v80.size.height = v31;
  double MaxY = CGRectGetMaxY(v80);
  v81.origin.CGFloat x = rect_8;
  v81.origin.CGFloat y = y;
  v81.size.CGFloat width = width;
  v81.size.height = v34;
  double rect_16 = MaxY - CGRectGetMaxY(v81);
  v82.origin.CGFloat x = v25;
  v82.origin.CGFloat y = v27;
  v82.size.CGFloat width = v29;
  v82.size.height = v31;
  double MaxX = CGRectGetMaxX(v82);
  v83.origin.CGFloat x = rect_8;
  v83.origin.CGFloat y = y;
  v83.size.CGFloat width = width;
  v83.size.height = v34;
  double v40 = MaxX - CGRectGetMaxX(v83);

  id v41 = [v8 contentView];
  objc_msgSend(v41, "setHitTestInsets:", -v49, -rect_24, -rect_16, -v40);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke;
  aBlock[3] = &unk_1E530E1E0;
  uint64_t v42 = v9;
  long long v59 = v71;
  long long v60 = v72;
  long long v61 = v73;
  long long v62 = v74;
  CGRect v57 = v69;
  v56 = v42;
  long long v58 = v70;
  v43 = _Block_copy(aBlock);
  if (_AXSReduceMotionEnabled())
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_2;
    v52[3] = &unk_1E52DB330;
    id v54 = v43;
    uint64_t v44 = v42;
    v53 = v44;
    +[UIView performWithoutAnimation:v52];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __58___UIDatePickerOverlayPresentation__presentNewDatePicker___block_invoke_3;
    v50[3] = &unk_1E52D9F70;
    v51 = v44;
    [(_UIDatePickerOverlayPresentation *)self animateReducedMotionTransitionWithAnimations:v50 completion:0];
  }
  else
  {
    [(_UIDatePickerOverlayPresentation *)self animatePresentWithAnimations:v43 completion:0];
  }
}

- (void)_transitionToDatePicker:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__231;
  v46 = __Block_byref_object_dispose__231;
  id v47 = [(_UIDatePickerOverlayPresentation *)self platterView];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__231;
  v40[4] = __Block_byref_object_dispose__231;
  id v5 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
  id v41 = [v5 view];

  [(id)v43[5] prepareDatePickerTransitionWithDatePicker:v4];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  [(_UIDatePickerOverlayPresentation *)self _computedLayoutForPlatterView:v43[5]];
  [(id)v43[5] frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(id)v43[5] layer];
  objc_msgSend(v14, "setAnchorPoint:", 0.0, 0.0);

  objc_msgSend((id)v43[5], "setFrame:", v7, v9, v11, v13);
  objc_msgSend((id)v43[5], "setContentBounds:", (unsigned __int128)0, (unsigned __int128)0);
  double v15 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];

  if (v15)
  {
    double v16 = [(_UIDatePickerOverlayPresentation *)self dismissHandler];
    v16[2](v16, 1);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke;
  aBlock[3] = &unk_1E530E208;
  long long v30 = v37;
  long long v31 = v38;
  long long v32 = v39;
  long long v26 = v33;
  long long v27 = v34;
  long long v28 = v35;
  long long v29 = v36;
  void aBlock[4] = v40;
  aBlock[5] = &v42;
  char v17 = _Block_copy(aBlock);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_2;
  v24[3] = &unk_1E530E1B8;
  v24[4] = &v42;
  double v18 = _Block_copy(v24);
  if (_AXSReduceMotionEnabled())
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_3;
    v23[3] = &unk_1E52D9900;
    v23[4] = &v42;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60___UIDatePickerOverlayPresentation__transitionToDatePicker___block_invoke_4;
    v19[3] = &unk_1E530E230;
    v19[4] = self;
    id v20 = v17;
    v22 = &v42;
    id v21 = v18;
    [(_UIDatePickerOverlayPresentation *)self animateReducedMotionTransitionWithAnimations:v23 completion:v19];
  }
  else
  {
    [(_UIDatePickerOverlayPresentation *)self animateTransitionWithAnimations:v17 completion:v18];
  }
  objc_storeStrong((id *)&self->_platterView, (id)v43[5]);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);
}

- (void)retargetCurrentPresentationToSourceView
{
  BOOL v3 = [(_UIDatePickerOverlayPresentation *)self platterView];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  [(_UIDatePickerOverlayPresentation *)self _computedLayoutForPlatterView:v3];
  objc_msgSend(v3, "setContentBounds:", v4, v5);
  objc_msgSend(v3, "setBounds:", v4, v5);
  [v3 setCenter:v6];
  [v3 layoutIfNeeded];
}

- (_UIDatePickerOverlayPlatterLayout)_computedLayoutForPlatterView:(SEL)a3
{
  id v6 = a4;
  long long v7 = [(_UIDatePickerOverlayPresentation *)self activeDatePicker];
  long long v8 = [v7 _style];

  long long v9 = [_UIContextMenuLayoutArbiter alloc];
  long long v10 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
  double v11 = [v10 view];
  double v12 = [(_UIContextMenuLayoutArbiter *)v9 initWithContainerView:v11 layout:1];

  double v13 = objc_opt_new();
  [(_UIDatePickerOverlayPresentation *)self resolvedSourceRect];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [(_UIDatePickerOverlayPresentation *)self sourceView];
  v23 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
  double v24 = [v23 view];
  objc_msgSend(v22, "convertRect:toView:", v24, v15, v17, v19, v21);
  double v26 = v25;
  double v28 = v27;

  long long v29 = objc_alloc_init(UIPreviewParameters);
  long long v30 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v15, v17, v19, v21);
  [(UIPreviewParameters *)v29 setVisiblePath:v30];

  if ([(_UIDatePickerOverlayPresentation *)self overlayAnchor] == 2)
  {
    long long v31 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v15, v17, v19, v21);
    long long v32 = [UIPreviewTarget alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    long long v34 = -[UIPreviewTarget initWithContainer:center:](v32, "initWithContainer:center:", WeakRetained, v15 + v19 * 0.5, v17 + v21 * 0.5);

    long long v35 = [[UITargetedPreview alloc] initWithView:v31 parameters:v29 target:v34];
    [v13 setSourcePreview:v35];
  }
  else
  {
    long long v36 = [UITargetedPreview alloc];
    long long v31 = (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
    long long v34 = [(UITargetedPreview *)v36 initWithView:v31 parameters:v29];
    [v13 setSourcePreview:v34];
  }

  [v13 setShouldUpdateAttachment:1];
  objc_msgSend(v13, "setPreferredPreviewSize:", v26, v28);
  [v6 preferredPlatterSize];
  double v38 = v37;
  double v40 = v39;

  objc_msgSend(v13, "setPreferredMenuSize:", v38, v40);
  [v8 overlayPlatterDefaultSpacing];
  objc_msgSend(v13, "setPreferredContentSpacing:");
  unint64_t v41 = [(_UIDatePickerOverlayPresentation *)self _overlayAlignmentEdge];
  [(_UIDatePickerOverlayPresentation *)self _layoutArbiterAnchorAlignmentOffset];
  v110[0] = 0x7FFFFFFFFFFFFFFFLL;
  v110[1] = v41;
  v110[2] = 0;
  v110[3] = v42;
  v110[4] = 1;
  [v13 setPreferredAnchor:v110];
  v43 = [(_UIContextMenuLayoutArbiter *)v12 computedLayoutWithInput:v13];
  uint64_t v44 = v43;
  if (v43)
  {
    [v43 menu];
  }
  else
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    memset(&v103, 0, sizeof(v103));
  }
  _UIContextMenuItemFrameFromLayout(&v103);
  double v46 = v45;
  double v48 = v47;
  [v13 preferredMenuSize];
  -[_UIDatePickerOverlayPresentation _adjustedFrameForInputSize:outputFrame:](self, "_adjustedFrameForInputSize:outputFrame:");
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  if (v44)
  {
    [v44 anchor];
    uint64_t v57 = *((void *)&v100 + 1);
    [v44 menu];
    double v58 = *((double *)&v95 + 1);
    double v59 = *(double *)&v96;
  }
  else
  {
    uint64_t v57 = 0;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    double v59 = 0.0;
    double v58 = 0.0;
    uint64_t v102 = 0;
  }
  -[_UIDatePickerOverlayPresentation _adjustedAnchorPointForFrame:alignment:anchorPoint:](self, "_adjustedAnchorPointForFrame:alignment:anchorPoint:", v57, v50, v52, v54, v56, v58, v59);
  double v61 = v60;
  double v63 = v62;
  [v13 preferredMenuSize];
  double v65 = v46 / v64;
  [v13 preferredMenuSize];
  retstr->var0.CGPoint origin = 0u;
  retstr->var0.CGSize size = 0u;
  retstr->var1 = 0u;
  retstr->var2 = 0u;
  *(_OWORD *)&retstr->var3.a = 0u;
  *(_OWORD *)&retstr->var3.c = 0u;
  *(_OWORD *)&retstr->var3.tCGFloat x = 0u;
  retstr->var0.size.CGFloat width = v54;
  retstr->var0.size.height = v56;
  double v67 = fmin(v65, v48 / v66);
  retstr->var2.CGFloat x = v61;
  retstr->var2.CGFloat y = v63;
  -[_UIDatePickerOverlayPresentation _normalizedSourcePointForAnchorPoint:menuFrame:](self, "_normalizedSourcePointForAnchorPoint:menuFrame:", v61, v63, v50, v52, v54, v56);
  retstr->var1.CGFloat x = v68;
  retstr->var1.CGFloat y = v69;
  if (v67 >= 1.0)
  {
    uint64_t v74 = MEMORY[0x1E4F1DAB8];
    long long v75 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->var3.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->var3.c = v75;
    long long v76 = *(_OWORD *)(v74 + 32);
  }
  else
  {
    memset(&v91, 0, sizeof(v91));
    CGAffineTransformMakeScale(&v91, v67, v67);
    CGAffineTransform v90 = v91;
    v111.origin.CGFloat x = v50;
    v111.origin.CGFloat y = v52;
    v111.size.CGFloat width = v54;
    v111.size.height = v56;
    CGRect v112 = CGRectApplyAffineTransform(v111, &v90);
    double v70 = v50 + (v54 - v112.size.width) * 0.5;
    double v71 = v52 + (v56 - v112.size.height) * 0.5;
    [v13 setPreferredMenuSize:v112.size.width];
    long long v72 = [(_UIContextMenuLayoutArbiter *)v12 computedLayoutWithInput:v13];
    long long v73 = v72;
    if (v72)
    {
      [v72 menu];
    }
    else
    {
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      memset(&v83, 0, sizeof(v83));
    }
    double v77 = _UIContextMenuItemFrameFromLayout(&v83);
    double v79 = v78;

    CGAffineTransform v82 = v91;
    CGAffineTransformTranslate(&v90, &v82, v77 - v70, v79 - v71);
    long long v80 = *(_OWORD *)&v90.c;
    long long v76 = *(_OWORD *)&v90.tx;
    CGAffineTransform v91 = v90;
    *(_OWORD *)&retstr->var3.a = *(_OWORD *)&v90.a;
    *(_OWORD *)&retstr->var3.c = v80;
  }
  *(_OWORD *)&retstr->var3.tCGFloat x = v76;

  return result;
}

- (int64_t)_overlayAlignment
{
  int64_t v3 = 1;
  switch([(_UIDatePickerOverlayPresentation *)self alignment])
  {
    case 1:
      int64_t v3 = 0;
      break;
    case 2:
      int64_t v3 = 2;
      break;
    case 4:
      long long v4 = [(_UIDatePickerOverlayPresentation *)self sourceView];
      unint64_t v5 = (unint64_t)v4[28] >> 18;
      goto LABEL_6;
    case 5:
      long long v4 = [(_UIDatePickerOverlayPresentation *)self sourceView];
      LODWORD(v5) = ~(v4[28] >> 18);
LABEL_6:
      int64_t v3 = v5 & 2;

      break;
    default:
      return v3;
  }
  return v3;
}

- (unint64_t)_overlayAlignmentEdge
{
  int64_t v2 = [(_UIDatePickerOverlayPresentation *)self _overlayAlignment];
  unint64_t v3 = 2;
  if (v2 == 2) {
    unint64_t v3 = 8;
  }
  if (v2 == 1) {
    return 0;
  }
  else {
    return v3;
  }
}

- (CGRect)_adjustedFrameForInputSize:(CGSize)a3 outputFrame:(CGRect)a4
{
  double v4 = (a3.width - a4.size.width) * 0.5;
  if (a4.size.width == a3.width)
  {
    double v5 = 0.0;
  }
  else
  {
    a4.size.double width = a3.width;
    double v5 = v4;
  }
  double v6 = a4.origin.x - v5;
  double v7 = (a3.height - a4.size.height) * 0.5;
  if (a4.size.height == a3.height)
  {
    double v8 = 0.0;
  }
  else
  {
    a4.size.double height = a3.height;
    double v8 = v7;
  }
  double v9 = a4.origin.y - v8;
  double width = a4.size.width;
  double height = a4.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v6;
  return result;
}

- (double)_layoutArbiterAnchorAlignmentOffset
{
  unint64_t v3 = [(_UIDatePickerOverlayPresentation *)self activeDatePicker];
  double v4 = [v3 _style];

  int64_t v5 = [(_UIDatePickerOverlayPresentation *)self _overlayAlignment];
  if (v5 == 2)
  {
    [(_UIDatePickerOverlayPresentation *)self resolvedSourceBounds];
    double MaxX = CGRectGetMaxX(v25);
    [(_UIDatePickerOverlayPresentation *)self resolvedSourceRect];
    double v13 = MaxX - CGRectGetMaxX(v26);
    [v4 overlayPlatterDefaultSpacing];
    double v6 = v13 - v14;
    if ([(_UIDatePickerOverlayPresentation *)self overlayAnchor] == 1)
    {
      long long v10 = [(_UIDatePickerOverlayPresentation *)self sourceView];
      [v10 layoutMargins];
      double v6 = v6 - v15;
      goto LABEL_8;
    }
  }
  else
  {
    if (v5 == 1)
    {
      [(_UIDatePickerOverlayPresentation *)self resolvedSourceBounds];
      double MidX = CGRectGetMidX(v27);
      [(_UIDatePickerOverlayPresentation *)self resolvedSourceRect];
      double v6 = MidX - CGRectGetMidX(v28);
      goto LABEL_10;
    }
    double v6 = 0.0;
    if (!v5)
    {
      [(_UIDatePickerOverlayPresentation *)self resolvedSourceBounds];
      double MinX = CGRectGetMinX(v23);
      [(_UIDatePickerOverlayPresentation *)self resolvedSourceRect];
      double v8 = MinX - CGRectGetMinX(v24);
      [v4 overlayPlatterDefaultSpacing];
      double v6 = v8 + v9;
      if ([(_UIDatePickerOverlayPresentation *)self overlayAnchor] == 1)
      {
        long long v10 = [(_UIDatePickerOverlayPresentation *)self sourceView];
        [v10 layoutMargins];
        double v6 = v6 + v11;
LABEL_8:
      }
    }
  }
LABEL_10:
  double v17 = [(_UIDatePickerOverlayPresentation *)self sourceView];
  double v18 = [v17 traitCollection];
  [v18 displayScale];
  UIRoundToScale(v6, v19);
  double v21 = v20;

  return v21;
}

- (CGPoint)_normalizedSourcePointForAnchorPoint:(CGPoint)a3 menuFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a3.y;
  CGFloat v7 = a4.origin.x + a4.size.width * 0.5;
  CGFloat v8 = a4.origin.y + a4.size.height * 0.5;
  CGFloat v9 = a3.x + -0.5;
  v14.origin.CGFloat x = 0.0;
  v14.origin.double y = 0.0;
  v14.size.CGFloat width = a4.size.width;
  v14.size.CGFloat height = a4.size.height;
  double v10 = v7 + v9 * CGRectGetWidth(v14);
  v15.origin.CGFloat x = 0.0;
  v15.origin.double y = 0.0;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v11 = v8 + (y + -0.5) * CGRectGetHeight(v15);
  double v12 = v10;
  result.double y = v11;
  result.CGFloat x = v12;
  return result;
}

- (CGPoint)_adjustedAnchorPointForFrame:(CGRect)a3 alignment:(unint64_t)a4 anchorPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat v8 = a3.origin.y;
  CGFloat v9 = a3.origin.x;
  [(_UIDatePickerOverlayPresentation *)self resolvedSourceRect];
  double v12 = v11;
  double v14 = v13;
  [(_UIDatePickerOverlayPresentation *)self resolvedSourceBounds];
  switch(a4)
  {
    case 1uLL:
    case 4uLL:
      double v17 = v15;
      double v18 = v16;
      double v19 = v12 + v14 * 0.5;
      int64_t v20 = [(_UIDatePickerOverlayPresentation *)self _overlayAlignment];
      switch(v20)
      {
        case 2:
          double x = 1.0 - (v17 + v18 - v19) / width;
          break;
        case 1:
          double x = (v19 - (v17 + v18 * 0.5)) / width + 0.5;
          break;
        case 0:
          double x = (v19 - v17) / width;
          break;
      }
      break;
    case 2uLL:
    case 8uLL:
      double v21 = [(_UIDatePickerOverlayPresentation *)self containerViewController];
      v22 = [v21 view];

      CGRect v23 = [(_UIDatePickerOverlayPresentation *)self sourceView];
      [(_UIDatePickerOverlayPresentation *)self resolvedSourceRect];
      objc_msgSend(v23, "convertPoint:toView:", v22, v25 + v24 * 0.5, v27 + v26 * 0.5);
      double v29 = v28;
      double v31 = v30;

      v39.origin.double x = v9;
      v39.origin.double y = v8;
      v39.size.double width = width;
      v39.size.CGFloat height = height;
      double v32 = v29 - CGRectGetMinX(v39);
      v40.origin.double x = v9;
      v40.origin.double y = v8;
      v40.size.double width = width;
      v40.size.CGFloat height = height;
      double x = v32 / CGRectGetWidth(v40);
      v41.origin.double x = v9;
      v41.origin.double y = v8;
      v41.size.double width = width;
      v41.size.CGFloat height = height;
      double v33 = v31 - CGRectGetMinY(v41);
      v42.origin.double x = v9;
      v42.origin.double y = v8;
      v42.size.double width = width;
      v42.size.CGFloat height = height;
      double y = v33 / CGRectGetHeight(v42);

      break;
    default:
      break;
  }
  double v34 = fmax(fmin(x, 1.0), 0.0);
  double v35 = fmax(fmin(y, 1.0), 0.0);
  result.double y = v35;
  result.double x = v34;
  return result;
}

- (void)animatePresentWithAnimations:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76___UIDatePickerOverlayPresentation_animatePresentWithAnimations_completion___block_invoke;
  v7[3] = &unk_1E52DA040;
  id v8 = v5;
  id v6 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v7 tracking:a4 dampingRatioSmoothing:0.8 responseSmoothing:0.32 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

- (void)animateTransitionWithAnimations:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79___UIDatePickerOverlayPresentation_animateTransitionWithAnimations_completion___block_invoke;
  v7[3] = &unk_1E52DA040;
  id v8 = v5;
  id v6 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:0 response:v7 tracking:a4 dampingRatioSmoothing:1.0 responseSmoothing:0.25 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

- (void)animateDismissalWithAnimations:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78___UIDatePickerOverlayPresentation_animateDismissalWithAnimations_completion___block_invoke;
  v7[3] = &unk_1E52DA040;
  id v8 = v5;
  id v6 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:0 response:v7 tracking:a4 dampingRatioSmoothing:0.85 responseSmoothing:0.35 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
}

- (void)animateReducedMotionTransitionWithAnimations:(id)a3 completion:(id)a4
{
}

- (int64_t)activeMode
{
  return self->_activeMode;
}

- (UIDatePicker)activeDatePicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeDatePicker);
  return (UIDatePicker *)WeakRetained;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  return (UIView *)WeakRetained;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (BOOL)defersAutomaticKeyboardAvoidanceAdjustments
{
  return self->_defersAutomaticKeyboardAvoidanceAdjustments;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (int64_t)overlayAnchor
{
  return self->_overlayAnchor;
}

- (void)setOverlayAnchor:(int64_t)a3
{
  self->_overlayAnchor = a3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
}

- (BOOL)accessoryViewIgnoresDefaultInsets
{
  return self->_accessoryViewIgnoresDefaultInsets;
}

- (_UIDatePickerContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (BOOL)isPresentingContainerViewController
{
  return self->_presentingContainerViewController;
}

- (void)setPresentingContainerViewController:(BOOL)a3
{
  self->_presentingContainerViewController = a3;
}

- (_UIDatePickerOverlayPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (_UIDatePickerOverlayPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDatePickerOverlayPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)ignoresPassthroughOnSourceView
{
  return self->_ignoresPassthroughOnSourceView;
}

- (void)setIgnoresPassthroughOnSourceView:(BOOL)a3
{
  self->_ignoresPassthroughOnSourceView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_activeDatePicker);
  objc_storeStrong(&self->_containerPresentCompletion, 0);
}

@end