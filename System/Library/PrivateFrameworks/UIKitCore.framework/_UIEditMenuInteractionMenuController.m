@interface _UIEditMenuInteractionMenuController
- (BOOL)_shouldPassthroughInView;
- (BOOL)isMenuVisible;
- (CGRect)_targetRect;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (CGRect)menuFrame;
- (_UIEditMenuInteractionMenuController)init;
- (id)_editMenuInteraction:(id)a3 firstResponderTargetForConfiguration:(id)a4;
- (id)_targetView;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)menuItems;
- (int64_t)_resolvedEditMenuArrowDirection;
- (void)_applicationDidAddDeactivationReason:(id)a3;
- (void)_dismissEditMenu;
- (void)_prepareEditMenuInteractionIfNeeded;
- (void)_presentEditMenu;
- (void)_setTargetRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5;
- (void)dealloc;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)hideMenuFromView:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setTargetRect:(CGRect)a3 inView:(id)a4;
- (void)showMenuFromView:(id)a3 rect:(CGRect)a4;
- (void)update;
@end

@implementation _UIEditMenuInteractionMenuController

- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64___UIEditMenuInteractionMenuController_setMenuVisible_animated___block_invoke;
  v7[3] = &unk_1E52D9FC0;
  BOOL v8 = a3;
  v7[4] = self;
  v5 = _Block_copy(v7);
  v6 = v5;
  if (v4) {
    (*((void (**)(void *))v5 + 2))(v5);
  }
  else {
    +[UIView performWithoutAnimation:v5];
  }
}

- (void)_dismissEditMenu
{
}

- (_UIEditMenuInteractionMenuController)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuInteractionMenuController;
  v2 = [(UIMenuController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__applicationDidAddDeactivationReason_ name:@"_UIApplicationWillAddDeactivationReasonNotification" object:0];
  }
  return v2;
}

- (void)_applicationDidAddDeactivationReason:(id)a3
{
  BOOL v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKey:@"_UIApplicationDeactivationReasonUserInfoKey"];
  int v6 = [v5 integerValue];

  [(_UIEditMenuInteractionMenuController *)self setMenuVisible:0 animated:v6 != 5];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIApplicationWillAddDeactivationReasonNotification" object:UIApp];

  v4.receiver = self;
  v4.super_class = (Class)_UIEditMenuInteractionMenuController;
  [(_UIEditMenuInteractionMenuController *)&v4 dealloc];
}

- (BOOL)isMenuVisible
{
  return [(UIEditMenuInteraction *)self->_currentMenuInteraction isDisplayingMenu];
}

- (void)setTargetRect:(CGRect)a3 inView:(id)a4
{
}

- (void)showMenuFromView:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  BOOL v10 = +[UIView areAnimationsEnabled];
  -[_UIEditMenuInteractionMenuController _setTargetRect:inView:animated:](self, "_setTargetRect:inView:animated:", v9, v10, x, y, width, height);

  if ([(UIEditMenuInteraction *)self->_currentMenuInteraction isDisplayingMenu])
  {
    currentMenuInteraction = self->_currentMenuInteraction;
    [(UIEditMenuInteraction *)currentMenuInteraction updateVisibleMenuPositionAnimated:v10];
  }
  else
  {
    [(_UIEditMenuInteractionMenuController *)self _presentEditMenu];
  }
}

- (void)hideMenuFromView:(id)a3
{
  currentMenuInteraction = self->_currentMenuInteraction;
  id v5 = a3;
  id v6 = [(UIEditMenuInteraction *)currentMenuInteraction view];

  if (v6 == v5)
  {
    [(_UIEditMenuInteractionMenuController *)self hideMenu];
  }
}

- (id)menuItems
{
  return self->_extraMenuItems;
}

- (void)setMenuItems:(id)a3
{
  self->_menuNeedsUpdate = 1;
}

- (void)update
{
  if ([(UIEditMenuInteraction *)self->_currentMenuInteraction isDisplayingMenu])
  {
    if (self->_menuNeedsUpdate)
    {
      [(UIEditMenuInteraction *)self->_currentMenuInteraction reloadVisibleMenu];
      self->_menuNeedsUpdate = 0;
    }
    currentMenuInteraction = self->_currentMenuInteraction;
    [(UIEditMenuInteraction *)currentMenuInteraction updateVisibleMenuPositionAnimated:0];
  }
}

- (CGRect)menuFrame
{
  v3 = [(UIEditMenuInteraction *)self->_currentMenuInteraction view];
  objc_super v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 coordinateSpace];

  if (v6)
  {
    [(UIEditMenuInteraction *)self->_currentMenuInteraction menuFrameInCoordinateSpace:v6];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)_targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  return WeakRetained;
}

- (CGRect)_targetRect
{
  double x = self->_targetRect.origin.x;
  double y = self->_targetRect.origin.y;
  double width = self->_targetRect.size.width;
  double height = self->_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setTargetRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  self->_targetRect = a3;
  p_targetView = &self->_targetView;
  objc_storeWeak((id *)&self->_targetView, a4);
  id v8 = [(UIEditMenuInteraction *)self->_currentMenuInteraction view];
  id WeakRetained = objc_loadWeakRetained((id *)p_targetView);

  if (v8 == WeakRetained)
  {
    currentMenuInteraction = self->_currentMenuInteraction;
    [(UIEditMenuInteraction *)currentMenuInteraction updateVisibleMenuPositionAnimated:v5];
  }
  else
  {
    [(_UIEditMenuInteractionMenuController *)self _prepareEditMenuInteractionIfNeeded];
  }
}

- (void)_prepareEditMenuInteractionIfNeeded
{
  p_targetView = &self->_targetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  if (WeakRetained)
  {
    BOOL v5 = WeakRetained;
    id v6 = [(UIEditMenuInteraction *)self->_currentMenuInteraction view];
    id v7 = objc_loadWeakRetained((id *)p_targetView);

    if (v6 != v7)
    {
      currentMenuInteraction = self->_currentMenuInteraction;
      if (currentMenuInteraction)
      {
        double v9 = [(UIEditMenuInteraction *)currentMenuInteraction view];
        [v9 removeInteraction:self->_currentMenuInteraction];
      }
      double v10 = [[UIEditMenuInteraction alloc] initWithDelegate:self];
      [(UIEditMenuInteraction *)v10 setPresentsContextMenuAsSecondaryAction:0];
      [(UIEditMenuInteraction *)v10 set_includeMenuControllerItems:1];
      [(UIEditMenuInteraction *)v10 _setUseSenderAsResponderSender:1];
      double v11 = +[UIMenuController sharedMenuController];
      [(UIEditMenuInteraction *)v10 _setProxySender:v11];

      [(UIEditMenuInteraction *)v10 _setEnforcesMenuControllerLifecycle:1];
      id v12 = objc_loadWeakRetained((id *)p_targetView);
      [v12 addInteraction:v10];

      double v13 = self->_currentMenuInteraction;
      self->_currentMenuInteraction = v10;
    }
  }
}

- (void)_presentEditMenu
{
  if (self->_currentMenuInteraction)
  {
    __asm { FMOV            V2.2D, #0.5 }
    id v8 = +[UIEditMenuConfiguration configurationWithIdentifier:0 sourcePoint:vaddq_f64((float64x2_t)self->_targetRect.origin, vmulq_f64((float64x2_t)self->_targetRect.size, _Q2))];
    objc_msgSend(v8, "setPreferredArrowDirection:", -[_UIEditMenuInteractionMenuController _resolvedEditMenuArrowDirection](self, "_resolvedEditMenuArrowDirection"));
    objc_msgSend(v8, "set_ignoresPassthroughInView:", -[_UIEditMenuInteractionMenuController _shouldPassthroughInView](self, "_shouldPassthroughInView") ^ 1);
    [(UIEditMenuInteraction *)self->_currentMenuInteraction presentEditMenuWithConfiguration:v8];
    self->_menuNeedsUpdate = 0;
  }
}

- (BOOL)_shouldPassthroughInView
{
  id v2 = objc_loadWeakRetained((id *)&self->_targetView);
  v3 = [v2 window];
  objc_super v4 = [v3 _firstResponder];

  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v4 textInputView];
  }
  else
  {
    BOOL v5 = 0;
  }
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = v4;
  }
  if (v2 == v6)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v7 = [v2 isDescendantOfView:v4] ^ 1;
    }
    else {
      LOBYTE(v7) = 1;
    }
  }

  return v7;
}

- (int64_t)_resolvedEditMenuArrowDirection
{
  int64_t result = [(UIMenuController *)self arrowDirection];
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  double x = self->_targetRect.origin.x;
  double y = self->_targetRect.origin.y;
  double width = self->_targetRect.size.width;
  double height = self->_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a5;
  id v8 = [v6 defaultCenter];
  [v8 postNotificationName:@"UIMenuControllerWillShowMenuNotification" object:self];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __101___UIEditMenuInteractionMenuController_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke;
  v9[3] = &unk_1E52D9F70;
  v9[4] = self;
  [v7 addCompletion:v9];
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F28EB8];
  id v9 = a5;
  double v10 = [v8 defaultCenter];
  [v10 postNotificationName:@"UIMenuControllerWillHideMenuNotification" object:self];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101___UIEditMenuInteractionMenuController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v12[3] = &unk_1E52D9F98;
  id v13 = v7;
  double v14 = self;
  id v11 = v7;
  [v9 addCompletion:v12];
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6 = a5;
  id v7 = +[UIKeyboardImpl activeInstance];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  id v9 = [v7 stopDictationMenuElementsForTextInputView:WeakRetained];

  if (v9)
  {
    double v10 = [v9 arrayByAddingObjectsFromArray:v6];
    id v11 = +[UIMenu menuWithChildren:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_editMenuInteraction:(id)a3 firstResponderTargetForConfiguration:(id)a4
{
  BOOL v5 = +[UIWindow _externalKeyWindow];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(_UIEditMenuInteractionMenuController *)self _targetView];
    id v9 = [v8 window];
    double v10 = [v9 windowScene];
    -[UIWindowScene _keyWindow](v10);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = [v7 firstResponder];
  id v12 = [v11 _responderForEditing];

  id v13 = +[UIKeyboardImpl activeInstance];
  double v14 = [v13 inputDelegateManager];
  double v15 = [v14 forwardingInputDelegate];

  if (v15)
  {
    double v16 = +[UIKeyboardImpl activeInstance];
    double v17 = [v16 inputDelegateManager];
    double v18 = [v17 forwardingInputDelegate];
    uint64_t v19 = [v18 _responderForEditing];

    id v12 = (void *)v19;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_extraMenuItems, 0);
  objc_storeStrong((id *)&self->_currentMenuInteraction, 0);
}

@end