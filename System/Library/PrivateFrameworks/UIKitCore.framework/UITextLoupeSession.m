@interface UITextLoupeSession
+ (UITextLoupeSession)beginLoupeSessionAtPoint:(CGPoint)point fromSelectionWidgetView:(UIView *)selectionWidget inView:(UIView *)interactionView;
+ (id)_beginLoupeSessionAtPoint:(CGPoint)a3 fromSelectionWidgetView:(id)a4 inView:(id)a5 orientation:(unint64_t)a6;
+ (id)_makeLoupeViewForSourceView:(id)a3 selectionWidget:(id)a4 orientation:(unint64_t)a5;
- (CGPoint)_locationInContainerCoordinateSpace:(CGPoint)a3;
- (UITextGestureTuning)gestureTuning;
- (UIView)interactionView;
- (UIWindow)containerWindow;
- (_UITextLoupeSessionDelegate)delegate;
- (_UITextLoupeView)loupeView;
- (void)_invalidateAnimated:(BOOL)a3;
- (void)_moveToPoint:(CGPoint)a3 withCaretRect:(CGRect)a4 selectionWidget:(id)a5 trackingCaret:(BOOL)a6;
- (void)_updateStatusBarVisibility;
- (void)dealloc;
- (void)invalidate;
- (void)moveToPoint:(CGPoint)point withCaretRect:(CGRect)caretRect trackingCaret:(BOOL)tracksCaret;
- (void)setContainerWindow:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureTuning:(id)a3;
- (void)setInteractionView:(id)a3;
- (void)setLoupeView:(id)a3;
- (void)setModelPosition:(CGPoint)a3;
@end

@implementation UITextLoupeSession

+ (id)_makeLoupeViewForSourceView:(id)a3 selectionWidget:(id)a4 orientation:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
  {
    v9 = [[_UITextMagnifiedLoupeView alloc] initWithSourceView:v8];

    [(_UITextMagnifiedLoupeView *)v9 setAnimatableSelectionWidget:v7];
    [(_UITextMagnifiedLoupeView *)v9 setOrientation:a5];
  }
  else
  {
    v9 = [[_UITextLightLoupeView alloc] initWithSourceView:v8];
  }
  return v9;
}

+ (UITextLoupeSession)beginLoupeSessionAtPoint:(CGPoint)point fromSelectionWidgetView:(UIView *)selectionWidget inView:(UIView *)interactionView
{
  return (UITextLoupeSession *)objc_msgSend(a1, "_beginLoupeSessionAtPoint:fromSelectionWidgetView:inView:orientation:", selectionWidget, interactionView, 1, point.x, point.y);
}

+ (id)_beginLoupeSessionAtPoint:(CGPoint)a3 fromSelectionWidgetView:(id)a4 inView:(id)a5 orientation:(unint64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  v13 = [v12 window];
  int v14 = [v13 _isRemoteKeyboardWindow];

  if (v14)
  {
    v15 = [v12 window];
  }
  else
  {
    if (v12) {
      [v12 keyboardSceneDelegate];
    }
    else {
    v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!v16)
      {
        v53 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v58 = v12;
          _os_log_fault_impl(&dword_1853B0000, v53, OS_LOG_TYPE_FAULT, "Could not find keyboard scene delegate for interaction view %@.", buf, 0xCu);
        }
      }
    }
    else if (!v16)
    {
      v54 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1331) + 8);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v12;
        _os_log_impl(&dword_1853B0000, v54, OS_LOG_TYPE_ERROR, "Could not find keyboard scene delegate for interaction view %@.", buf, 0xCu);
      }
    }
    v15 = [v16 containerWindow];
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (v15) {
      goto LABEL_11;
    }
    v51 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "Could not find window to attach loupe view.", buf, 2u);
    }

LABEL_37:
    v49 = 0;
    goto LABEL_28;
  }
  if (!v15)
  {
    v52 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB265380) + 8);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "Could not find window to attach loupe view.", buf, 2u);
    }
    goto LABEL_37;
  }
LABEL_11:
  if (([v11 conformsToProtocol:&unk_1ED488D50] & 1) == 0)
  {

    id v11 = 0;
  }
  v17 = [a1 _makeLoupeViewForSourceView:v12 selectionWidget:v11 orientation:a6];
  [v15 addSubview:v17];
  v18 = [v17 containerCoordinateSpace];
  if (v18)
  {
    [v11 bounds];
    double v19 = v61.origin.x;
    double v20 = v61.origin.y;
    double width = v61.size.width;
    double height = v61.size.height;
    if (!CGRectIsNull(v61) && vabdd_f64(x, v19) < 10.0)
    {
      double x = v19 + width * 0.5;
      double y = v20 + height * 0.5;
    }
    v23 = objc_alloc_init(UITextLoupeSession);
    [(UITextLoupeSession *)v23 setInteractionView:v12];
    [(UITextLoupeSession *)v23 setLoupeView:v17];
    [(UITextLoupeSession *)v23 setContainerWindow:v15];
    [v17 preferredSize];
    double v25 = v24;
    double v27 = v26;
    if (v11
      && ([v11 superview],
          v28 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v18, "convertRect:fromCoordinateSpace:", v28, v19, v20, width, height),
          double v30 = v29,
          v28,
          v30 > v27))
    {
      [(UITextLoupeSession *)v23 invalidate];
      v49 = 0;
    }
    else
    {
      objc_msgSend(v17, "setBounds:", 0.0, 0.0, v25, v27);
      -[UITextLoupeSession _locationInContainerCoordinateSpace:](v23, "_locationInContainerCoordinateSpace:", x, y);
      double v32 = v31;
      double v34 = v33;
      objc_msgSend(v17, "setModelPosition:");
      objc_msgSend(v17, "constrainedModelPositionForPosition:", v32, v34);
      objc_msgSend(v17, "setCenter:");
      v35 = [v12 tintColor];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v36 = [v12 insertionPointColor];

        v35 = (void *)v36;
      }
      [v17 setTintColor:v35];
      v37 = [v12 window];

      if (v15 != v37)
      {
        v38 = [v12 window];
        [v38 bounds];
        double v40 = v39;
        double v42 = v41;
        v43 = [v12 window];
        objc_msgSend(v15, "convertPoint:fromWindow:", v43, v40, v42);
        CGFloat v45 = v44;
        CGFloat v47 = v46;

        CATransform3DMakeTranslation(&v56, v45, v47, 0.0);
        v48 = [v17 layer];
        CATransform3D v55 = v56;
        [v48 setSublayerTransform:&v55];
      }
      [v17 setVisible:0 animated:0 completion:0];
      [v17 setVisible:1 animated:1 completion:0];
      [(UITextLoupeSession *)v23 _updateStatusBarVisibility];
      v49 = v23;
    }
  }
  else
  {
    os_variant_has_internal_diagnostics();
    v49 = 0;
  }

LABEL_28:
  return v49;
}

- (CGPoint)_locationInContainerCoordinateSpace:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UITextLoupeSession *)self interactionView];
  id v7 = [(UITextLoupeSession *)self loupeView];
  id v8 = [v7 containerCoordinateSpace];

  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v6, x, y);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)moveToPoint:(CGPoint)point withCaretRect:(CGRect)caretRect trackingCaret:(BOOL)tracksCaret
{
}

- (void)_moveToPoint:(CGPoint)a3 withCaretRect:(CGRect)a4 selectionWidget:(id)a5 trackingCaret:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v11 = a3.y;
  double v12 = a3.x;
  id v14 = a5;
  if (!self->_invalidated)
  {
    id v33 = v14;
    v15 = [(UITextLoupeSession *)self loupeView];
    v16 = [v15 containerCoordinateSpace];

    if (v16
      && ([(UITextLoupeSession *)self interactionView],
          v17 = objc_claimAutoreleasedReturnValue(),
          [v17 window],
          v18 = objc_claimAutoreleasedReturnValue(),
          v18,
          v17,
          v18))
    {
      if (v33)
      {
        double v19 = [(UITextLoupeSession *)self loupeView];
        id v20 = [v19 animatableSelectionWidget];

        if (v20 != v33)
        {
          v21 = [(UITextLoupeSession *)self loupeView];
          [v21 setAnimatableSelectionWidget:v33];

          v22 = [(UITextLoupeSession *)self loupeView];
          [v22 setVisible:0 animated:0 completion:0];

          v23 = [(UITextLoupeSession *)self loupeView];
          [v23 setVisible:1 animated:1 completion:0];
        }
      }
      v35.origin.CGFloat x = x;
      v35.origin.double y = y;
      v35.size.CGFloat width = width;
      v35.size.double height = height;
      if (CGRectIsNull(v35) || !v6) {
        double v24 = v11;
      }
      else {
        double v24 = y + height * 0.5;
      }
      -[UITextLoupeSession setModelPosition:](self, "setModelPosition:", v12, v24);
      if (self->_gestureTuning)
      {
        double v25 = [(UITextLoupeSession *)self gestureTuning];
        [v25 lineBreakProgress];
        double v27 = v26;

        v28 = [(UITextLoupeSession *)self loupeView];
        [v28 setDismissalProgress:v27];

        if (v27 >= 0.85)
        {
          double v29 = [(UITextLoupeSession *)self loupeView];
          int v30 = [v29 visible];

          if (v30)
          {
            double v31 = [(UITextLoupeSession *)self loupeView];
            [v31 setVisible:0 animated:1 completion:0];
          }
        }
      }
      [(UITextLoupeSession *)self _updateStatusBarVisibility];
    }
    else
    {
      double v32 = [(UITextLoupeSession *)self loupeView];
      [v32 setVisible:0];
    }
    id v14 = v33;
  }
}

- (void)setModelPosition:(CGPoint)a3
{
  -[UITextLoupeSession _locationInContainerCoordinateSpace:](self, "_locationInContainerCoordinateSpace:", a3.x, a3.y);
  double v5 = v4;
  double v7 = v6;
  id v8 = [(UITextLoupeSession *)self loupeView];
  objc_msgSend(v8, "setModelPosition:", v5, v7);
}

- (void)_updateStatusBarVisibility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerWindow);
  __UIStatusBarManagerForWindow(WeakRetained);
  id v21 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = [(UITextLoupeSession *)self loupeView];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [(UITextLoupeSession *)self loupeView];
  if ([v13 visible])
  {
    [v21 _statusBarFrameIgnoringVisibility];
    v24.origin.CGFloat x = v14;
    v24.origin.double y = v15;
    v24.size.CGFloat width = v16;
    v24.size.double height = v17;
    v23.origin.CGFloat x = v6;
    v23.origin.double y = v8;
    v23.size.CGFloat width = v10;
    v23.size.double height = v12;
    BOOL v18 = CGRectIntersectsRect(v23, v24);

    if (v18)
    {
      if (self->_isHidingStatusBar) {
        goto LABEL_9;
      }
      uint64_t v19 = 1;
      self->_isHidingStatusBar = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (!self->_isHidingStatusBar) {
    goto LABEL_9;
  }
  uint64_t v19 = 0;
  self->_isHidingStatusBar = 0;
LABEL_8:
  id v20 = LoupeStatusBarAnimationParameters();
  [v21 _setOverridingStatusBarHidden:v19 animationParameters:v20];

LABEL_9:
}

- (void)invalidate
{
}

- (void)_invalidateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_invalidated = 1;
  if (self->_isHidingStatusBar)
  {
    self->_isHidingStatusBar = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerWindow);
    CGFloat v6 = __UIStatusBarManagerForWindow(WeakRetained);
    double v7 = LoupeStatusBarAnimationParameters();
    [v6 _setOverridingStatusBarHidden:0 animationParameters:v7];
  }
  if (v3)
  {
    objc_initWeak(&location, self);
    CGFloat v8 = [(UITextLoupeSession *)self loupeView];
    double v9 = [(UITextLoupeSession *)self delegate];
    loupeView = self->_loupeView;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __42__UITextLoupeSession__invalidateAnimated___block_invoke;
    v14[3] = &unk_1E5310698;
    id v11 = v8;
    id v15 = v11;
    objc_copyWeak(&v17, &location);
    id v12 = v9;
    id v16 = v12;
    [(_UITextLoupeView *)loupeView setVisible:0 animated:1 completion:v14];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_UITextLoupeView *)self->_loupeView setVisible:0 animated:0 completion:0];
    [(_UITextLoupeView *)self->_loupeView removeFromSuperview];
    id v13 = objc_loadWeakRetained((id *)&self->_delegate);
    [v13 _loupeSessionDidInvalidate:self];
  }
}

void __42__UITextLoupeSession__invalidateAnimated___block_invoke(id *a1)
{
  [a1[4] removeFromSuperview];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [a1[5] _loupeSessionDidInvalidate:WeakRetained];
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(UITextLoupeSession *)self _invalidateAnimated:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)UITextLoupeSession;
  [(UITextLoupeSession *)&v3 dealloc];
}

- (UITextGestureTuning)gestureTuning
{
  return self->_gestureTuning;
}

- (void)setGestureTuning:(id)a3
{
}

- (UIView)interactionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionView);
  return (UIView *)WeakRetained;
}

- (void)setInteractionView:(id)a3
{
}

- (UIWindow)containerWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setContainerWindow:(id)a3
{
}

- (_UITextLoupeView)loupeView
{
  return self->_loupeView;
}

- (void)setLoupeView:(id)a3
{
}

- (_UITextLoupeSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextLoupeSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loupeView, 0);
  objc_destroyWeak((id *)&self->_containerWindow);
  objc_destroyWeak((id *)&self->_interactionView);
  objc_storeStrong((id *)&self->_gestureTuning, 0);
}

@end