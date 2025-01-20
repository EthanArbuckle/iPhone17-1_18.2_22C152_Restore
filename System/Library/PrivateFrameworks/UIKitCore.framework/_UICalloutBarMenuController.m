@interface _UICalloutBarMenuController
- (BOOL)_menuHidden;
- (BOOL)_updateAnimated:(BOOL)a3 checkVisible:(BOOL)a4;
- (BOOL)isMenuVisible;
- (CGRect)_targetRect;
- (CGRect)menuFrame;
- (id)_targetView;
- (id)menuItems;
- (void)_hideMenuAnimated:(BOOL)a3;
- (void)_removeWindowWillRotateObserver;
- (void)_reparentCalloutBarIfNeeded;
- (void)_setTargetRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5;
- (void)_showMenuAnimated:(BOOL)a3;
- (void)calloutBar:(id)a3 didFinishAnimation:(id)a4;
- (void)calloutBar:(id)a3 willStartAnimation:(id)a4;
- (void)dealloc;
- (void)hideMenu;
- (void)hideMenuFromView:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setTargetRect:(CGRect)a3 inView:(id)a4;
- (void)showMenuFromView:(id)a3 rect:(CGRect)a4;
- (void)update;
@end

@implementation _UICalloutBarMenuController

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIWindowWillRotateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UICalloutBarMenuController;
  [(_UICalloutBarMenuController *)&v4 dealloc];
}

- (void)_removeWindowWillRotateObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIWindowWillRotateNotification" object:0];
}

- (BOOL)isMenuVisible
{
  v2 = +[UICalloutBar activeCalloutBar];
  id v3 = [v2 superview];
  if (v3)
  {
    objc_super v4 = +[UICalloutBar activeCalloutBar];
    [v4 alpha];
    BOOL v6 = v5 == 1.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_menuHidden
{
  v2 = +[UICalloutBar activeCalloutBar];
  id v3 = [v2 superview];
  if (v3)
  {
    objc_super v4 = +[UICalloutBar activeCalloutBar];
    [v4 alpha];
    BOOL v6 = v5 < 1.0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_showMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = +[UICalloutBar sharedCalloutBar];
  if ([v14 hasReplacements]) {
    [v14 setReplacements:0];
  }
  [v14 setDelegate:self];
  CGFloat v5 = *MEMORY[0x1E4F1DB28];
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v17.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v17.origin.CGFloat y = v6;
  v17.size.CGFloat width = v7;
  v17.size.CGFloat height = v8;
  if (CGRectEqualToRect(self->_targetRect, v17))
  {
    [v14 targetRect];
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    v18.origin.CGFloat x = v5;
    v18.origin.CGFloat y = v6;
    v18.size.CGFloat width = v7;
    v18.size.CGFloat height = v8;
    if (!CGRectEqualToRect(v16, v18))
    {
      self->_targetRect.origin.CGFloat x = x;
      self->_targetRect.origin.CGFloat y = y;
      self->_targetRect.size.CGFloat width = width;
      self->_targetRect.size.CGFloat height = height;
    }
  }
  if ([(_UICalloutBarMenuController *)self _updateAnimated:v3 checkVisible:0])
  {
    [(_UICalloutBarMenuController *)self _reparentCalloutBarIfNeeded];
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:self selector:sel__windowWillRotate_ name:@"UIWindowWillRotateNotification" object:0];
    [v13 postNotificationName:@"UIMenuControllerMenuFrameDidChangeNotification" object:self];
    if (v3) {
      [v14 appear];
    }
    else {
      [v14 show];
    }
    if (([v14 visible] & 1) == 0)
    {
      [v14 removeFromSuperview];
      [(_UICalloutBarMenuController *)self _removeWindowWillRotateObserver];
    }
  }
}

- (void)_hideMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_UICalloutBarMenuController *)self _menuHidden])
  {
    CGFloat v5 = +[UICalloutBar activeCalloutBar];
    id v6 = v5;
    if (v3) {
      [v5 fade];
    }
    else {
      [v5 hide];
    }
    [(_UICalloutBarMenuController *)self _removeWindowWillRotateObserver];
  }
}

- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    [(_UICalloutBarMenuController *)self _showMenuAnimated:a4];
  }
  else {
    [(_UICalloutBarMenuController *)self _hideMenuAnimated:a4];
  }
}

- (void)showMenuFromView:(id)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  p_targetRect = &self->_targetRect;
  id v10 = a3;
  p_targetRect->origin.double x = ConvertRectToScene(v10, x, y, width, height);
  p_targetRect->origin.double y = v11;
  p_targetRect->size.double width = v12;
  p_targetRect->size.double height = v13;
  objc_storeWeak((id *)&self->_targetView, v10);

  BOOL v14 = +[UIView areAnimationsEnabled];
  if ([(_UICalloutBarMenuController *)self _menuHidden])
  {
    [(_UICalloutBarMenuController *)self _showMenuAnimated:v14];
  }
  else if ([(_UICalloutBarMenuController *)self _updateAnimated:v14 checkVisible:1])
  {
    [(_UICalloutBarMenuController *)self _reparentCalloutBarIfNeeded];
  }
}

- (void)hideMenuFromView:(id)a3
{
  id v4 = a3;
  CGFloat v5 = +[UICalloutBar activeCalloutBar];
  int v6 = [v5 _isOwnedByView:v4];

  if (v6)
  {
    [(_UICalloutBarMenuController *)self hideMenu];
  }
}

- (void)hideMenu
{
  BOOL v3 = +[UIView areAnimationsEnabled];
  [(_UICalloutBarMenuController *)self _hideMenuAnimated:v3];
}

- (void)setTargetRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_targetRect = &self->_targetRect;
  id v10 = a4;
  p_targetRect->origin.double x = ConvertRectToScene(v10, x, y, width, height);
  p_targetRect->origin.double y = v11;
  p_targetRect->size.double width = v12;
  p_targetRect->size.double height = v13;
  objc_storeWeak((id *)&self->_targetView, v10);

  if ([(_UICalloutBarMenuController *)self _updateAnimated:1 checkVisible:1])
  {
    [(_UICalloutBarMenuController *)self _reparentCalloutBarIfNeeded];
  }
}

- (void)_setTargetRect:(CGRect)a3 inView:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  p_targetRect = &self->_targetRect;
  self->_targetRect.origin.double x = ConvertRectToScene(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  p_targetRect->origin.double y = v8;
  p_targetRect->size.double width = v9;
  p_targetRect->size.double height = v10;
  if ([(_UICalloutBarMenuController *)self _updateAnimated:v5 checkVisible:1])
  {
    [(_UICalloutBarMenuController *)self _reparentCalloutBarIfNeeded];
  }
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

- (void)setMenuItems:(id)a3
{
  id v3 = a3;
  id v4 = +[UICalloutBar sharedCalloutBar];
  [v4 setExtraItems:v3];

  [v4 resetPage];
}

- (id)menuItems
{
  v2 = +[UICalloutBar sharedCalloutBar];
  id v3 = [v2 extraItems];

  return v3;
}

- (void)update
{
}

- (CGRect)menuFrame
{
  v2 = +[UICalloutBar sharedCalloutBar];
  [v2 bounds];
  double v7 = ConvertRectToScene(v2, v3, v4, v5, v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_reparentCalloutBarIfNeeded
{
  p_targetView = &self->_targetView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_targetView);
    id v8 = [v4 keyboardSceneDelegate];
  }
  else
  {
    id v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  }

  double v5 = [v8 containerWindow];
  double v6 = +[UICalloutBar sharedCalloutBar];
  double v7 = [v6 superview];

  if (v5 != v7) {
    [v5 addSubview:v6];
  }
}

- (BOOL)_updateAnimated:(BOOL)a3 checkVisible:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(_UICalloutBarMenuController *)self _menuHidden];
  BOOL v8 = v7;
  if (!v4 || !v7)
  {
    double v10 = +[UICalloutBar sharedCalloutBar];
    double v11 = v10;
    if (v4)
    {
      double v12 = [v10 delegate];
      if (v12)
      {
        double v13 = v12;
        if (v12 != self)
        {
          BOOL v9 = 0;
LABEL_22:

LABEL_23:
          return v9;
        }
      }
      else
      {
        [v11 setDelegate:self];
      }
      double v14 = [v11 superview];

      if (!v14)
      {
        BOOL v9 = 0;
        goto LABEL_23;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_targetView);
    if (WeakRetained)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_targetView);
      double v17 = [v16 keyboardSceneDelegate];
    }
    else
    {
      double v17 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    }

    id v18 = objc_loadWeakRetained((id *)&self->_targetView);
    v71 = v17;
    v19 = [(_UICalloutBarMenuController *)v17 containerWindow];
    double x = self->_targetRect.origin.x;
    double y = self->_targetRect.origin.y;
    double width = self->_targetRect.size.width;
    double height = self->_targetRect.size.height;
    id v24 = v18;
    v25 = [v19 windowScene];
    v26 = [v25 _topVisibleWindowPassingTest:&__block_literal_global_400];

    v27 = [v24 window];

    v28 = [v27 windowScene];
    v29 = [v28 coordinateSpace];
    objc_msgSend(v26, "convertRect:fromCoordinateSpace:", v29, x, y, width, height);
    objc_msgSend(v19, "convertRect:fromWindow:", v26);
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;

    if (v8)
    {
      double v39 = *MEMORY[0x1E4F1DB28];
      CGFloat v38 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v41 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v40 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      CGFloat v69 = v38;
      CGFloat v70 = *MEMORY[0x1E4F1DB28];
      CGFloat v67 = v40;
      CGFloat v68 = v41;
    }
    else
    {
      [v11 bounds];
      double v39 = ConvertRectToScene(v11, v42, v43, v44, v45);
      CGFloat v38 = v46;
      CGFloat v41 = v47;
      CGFloat v40 = v48;
      [v11 targetRect];
      CGFloat v69 = v50;
      CGFloat v70 = v49;
      CGFloat v67 = v52;
      CGFloat v68 = v51;
    }
    double v13 = v71;
    id v53 = objc_loadWeakRetained((id *)&self->_targetView);
    objc_msgSend(v11, "setTargetRect:view:arrowDirection:", v53, -[UIMenuController arrowDirection](self, "arrowDirection"), v31, v33, v35, v37);

    if (!v8 && ![(_UICalloutBarMenuController *)self _menuHidden])
    {
      [v11 updateAnimated:v5];
      [v11 bounds];
      v74.origin.double x = ConvertRectToScene(v11, v54, v55, v56, v57);
      v74.origin.double y = v58;
      v74.size.double width = v59;
      v74.size.double height = v60;
      v72.origin.double x = v39;
      v72.origin.double y = v38;
      v72.size.double width = v41;
      v72.size.double height = v40;
      if (!CGRectEqualToRect(v72, v74)) {
        goto LABEL_20;
      }
      [v11 targetRect];
      v75.origin.double x = v61;
      v75.origin.double y = v62;
      v75.size.double width = v63;
      v75.size.double height = v64;
      v73.origin.double y = v69;
      v73.origin.double x = v70;
      v73.size.double height = v67;
      v73.size.double width = v68;
      if (!CGRectEqualToRect(v73, v75))
      {
LABEL_20:
        v65 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", *(void *)&v67, *(void *)&v68, *(void *)&v69, *(void *)&v70);
        [v65 postNotificationName:@"UIMenuControllerMenuFrameDidChangeNotification" object:self];
      }
    }
    BOOL v9 = 1;
    goto LABEL_22;
  }
  return 0;
}

- (void)calloutBar:(id)a3 willStartAnimation:(id)a4
{
  id v5 = a4;
  double v6 = [v5 objectForKey:@"UICalloutBarInfoKeyWillDidShowReplacements"];
  int v7 = [v6 BOOLValue];

  BOOL v8 = [v5 objectForKey:@"UICalloutBarInfoKeyDidPromptForReplacements"];
  int v9 = [v8 BOOLValue];

  double v10 = [v5 objectForKey:@"UICalloutBarInfoKeyAnimationID"];

  int v11 = [v10 isEqualToString:@"UICalloutBarAnimationAppear"];
  if (!v7 || (v9 & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v14 = v12;
    if (!v11)
    {
      double v13 = @"UIMenuControllerWillHideMenuNotification";
      goto LABEL_8;
    }
    [v12 postNotificationName:@"UIMenuControllerWillShowMenuNotification" object:self];
  }
  if ((v11 & v7 ^ 1 | v9)) {
    return;
  }
  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v13 = @"_UIMenuControllerWillShowReplacementsMenuNotification";
  id v14 = v12;
LABEL_8:
  [v12 postNotificationName:v13 object:self];
}

- (void)calloutBar:(id)a3 didFinishAnimation:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  int v7 = [v6 objectForKey:@"UICalloutBarInfoKeyWillDidShowReplacements"];
  int v8 = [v7 BOOLValue];

  int v9 = [v6 objectForKey:@"UICalloutBarInfoKeyDidPromptForReplacements"];
  int v10 = [v9 BOOLValue];

  int v11 = [v6 objectForKey:@"UICalloutBarInfoKeyAnimationID"];

  int v12 = [v11 isEqualToString:@"UICalloutBarAnimationAppear"];
  if (v8 && (v10 & 1) != 0)
  {
LABEL_5:
    if (((v12 & v8 ^ 1 | v10) & 1) == 0)
    {
      double v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:@"_UIMenuControllerDidShowReplacementsMenuNotification" object:self];
    }
    goto LABEL_9;
  }
  double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v14 = v13;
  if (v12)
  {
    [v13 postNotificationName:@"UIMenuControllerDidShowMenuNotification" object:self];

    goto LABEL_5;
  }
  [v13 postNotificationName:@"UIMenuControllerDidHideMenuNotification" object:self];

  id v16 = [v17 delegate];

  if (v16 == self) {
    [v17 setDelegate:0];
  }
LABEL_9:
}

- (void).cxx_destruct
{
}

@end