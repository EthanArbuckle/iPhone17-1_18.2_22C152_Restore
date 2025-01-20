@interface UIInputSetHostView
+ (BOOL)_notifyOnExplicitLayout;
+ (BOOL)_shouldHitTestInputViewFirst;
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int)textEffectsVisibilityLevel;
- (unint64_t)_clipCornersOfView:(id)a3;
- (void)_didChangeKeyplaneWithContext:(id)a3;
- (void)_updateSafeAreaInsets;
- (void)layoutIfNeeded;
@end

@implementation UIInputSetHostView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)_updateSafeAreaInsets
{
  [(UIView *)self safeAreaInsets];
  double v4 = v3;
  v9.receiver = self;
  v9.super_class = (Class)UIInputSetHostView;
  [(UIView *)&v9 _updateSafeAreaInsets];
  [(UIView *)self safeAreaInsets];
  if (v4 != v5)
  {
    v6 = [(UIView *)self _rootInputWindowController];
    v7 = [v6 bottomEdgeView];

    if (v7 == self)
    {
      v8 = [(UIView *)self _rootInputWindowController];
      [v8 updateSupportsDockViewController];
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(UIView *)self _rootInputWindowController];
  if (![(id)objc_opt_class() _shouldHitTestInputViewFirst])
  {
    v18 = [v8 placement];
    int v19 = [v18 isFloatingAssistantView];

    if (v19)
    {
      v20 = [v8 inputViewSet];
      v12 = [v20 assistantViewController];

      if (([v12 isInputAssistantItemEmpty] & 1) != 0
        || ([v8 placement],
            v21 = objc_claimAutoreleasedReturnValue(),
            int v22 = [v21 isCompactAssistantView],
            v21,
            v22))
      {
        v23 = [v12 view];
        v24 = [v23 superview];

        v25 = [(UIView *)v24 superview];

        if (v25 == self)
        {
          [v12 barFrame];
          double v27 = v26;
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          v34 = [v12 view];
          -[UIView convertRect:fromView:](self, "convertRect:fromView:", v34, v27, v29, v31, v33);
          CGFloat v36 = v35;
          CGFloat v38 = v37;
          CGFloat v40 = v39;
          double v42 = v41;

          v51.origin.double x = v36;
          v51.origin.double y = v38;
          v51.size.width = v40;
          v51.size.height = v42;
          CGRect v52 = CGRectInset(v51, -v42, 0.0);
          v49.double x = x;
          v49.double y = y;
          if (CGRectContainsPoint(v52, v49))
          {
            v53.origin.double x = v36;
            v53.origin.double y = v38;
            v53.size.width = v40;
            v53.size.height = v42;
            v50.double x = x;
            v50.double y = y;
            if (!CGRectContainsPoint(v53, v50)) {
              goto LABEL_25;
            }
          }
        }
      }
      goto LABEL_15;
    }
LABEL_16:
    v12 = 0;
LABEL_17:
    v47.receiver = self;
    v47.super_class = (Class)UIInputSetHostView;
    -[UIView hitTest:withEvent:](&v47, sel_hitTest_withEvent_, v7, x, y);
    v17 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_super v9 = [v8 inputViewSet];
  char v10 = [v9 isInputViewPlaceholder];

  if (v10) {
    goto LABEL_16;
  }
  v11 = [v8 inputViewSet];
  v12 = [v11 inputView];

  if (+[UIKeyboard usesInputSystemUI]
    && ([v12 isDescendantOfView:self] & 1) == 0)
  {
LABEL_15:

    goto LABEL_16;
  }
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v12, x, y);
  if (!v12) {
    goto LABEL_17;
  }
  double v15 = v13;
  double v16 = v14;
  if (!objc_msgSend(v12, "pointInside:withEvent:", v7)) {
    goto LABEL_17;
  }
  objc_msgSend(v12, "hitTest:withEvent:", v7, v15, v16);
  v17 = (UIInputSetHostView *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v43 = v17;
  if (v17 == self)
  {
    v44 = [(UIView *)self layer];
    v45 = [v44 animationKeys];
    if ([v45 count]) {
      v24 = self;
    }
    else {
      v24 = 0;
    }
  }
  else
  {
    v24 = v17;
  }

LABEL_25:
  return v24;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = [(UIView *)self _rootInputWindowController];
  [v8 clearKeyboardSnapshot];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v9 = [(UIView *)self subviews];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v14 isUserInteractionEnabled])
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          if (objc_msgSend(v14, "pointInside:withEvent:", v7))
          {
            BOOL v15 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_12:

  return v15;
}

+ (BOOL)_shouldHitTestInputViewFirst
{
  return 1;
}

- (int)textEffectsVisibilityLevel
{
  v2 = +[UIKeyboardImpl activeInstance];
  if ([v2 isEmojiPopoverPresented]
    && ([v2 _showsScribbleIconsInAssistantView] & 1) != 0)
  {
    int v3 = 301;
  }
  else
  {
    int v3 = 10;
  }

  return v3;
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v3 = a3;
  double v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__UIInputSetHostView__didChangeKeyplaneWithContext___block_invoke;
  v6[3] = &unk_1E52FBDD8;
  id v7 = v3;
  id v5 = v3;
  [v4 performOnControllers:v6];
}

uint64_t __52__UIInputSetHostView__didChangeKeyplaneWithContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateForKeyplaneChangeWithContext:*(void *)(a1 + 32)];
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  if (!a3) {
    return -1;
  }
  id v4 = a3;
  id v5 = [(UIView *)self _rootInputWindowController];
  unint64_t v6 = [v5 _clipCornersOfView:v4];

  return v6;
}

+ (BOOL)_notifyOnExplicitLayout
{
  return 1;
}

- (void)layoutIfNeeded
{
  if ([(id)objc_opt_class() _notifyOnExplicitLayout])
  {
    id v3 = [(UIView *)self _rootInputWindowController];
    [v3 _forcePreLayoutHostViewFrame];
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v5 = [v4 remoteInputViewHost];

    unint64_t v6 = [v5 inputViewSet];
    id v7 = [v6 hostedCustomInputView];

    if (v7)
    {
      v8 = [v5 inputViewWindow];
      [v8 layoutIfNeeded];
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UIInputSetHostView;
  [(UIView *)&v9 layoutIfNeeded];
}

@end