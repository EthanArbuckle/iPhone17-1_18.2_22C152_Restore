@interface _UIContainerWindowPortalInteraction
- (BOOL)_isSwiftUI:(id)a3;
- (BOOL)_portalViewEnabled;
- (BOOL)_viewIsVisibleInContainer:(id)a3;
- (BOOL)attemptsToUseAncestorViewContainer;
- (BOOL)isEnabled;
- (CGRect)_unionFrameForView:(id)a3;
- (UIView)view;
- (UIWindow)containerWindow;
- (_UIContainerWindowPortalView)portalView;
- (id)_makePortalView;
- (id)_visibleViewContainer;
- (void)_setPortalViewEnabled:(BOOL)a3;
- (void)_viewVisibilityDidChange;
- (void)didMoveToView:(id)a3;
- (void)ensureVisibilityInContainerWindow;
- (void)setAttemptsToUseAncestorViewContainer:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPortalView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIContainerWindowPortalInteraction

- (UIWindow)containerWindow
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (!WeakRetained
    || (id v4 = objc_loadWeakRetained((id *)p_view),
        [v4 keyboardSceneDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 containerWindow],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v6))
  {
    v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v6 = [v7 containerWindow];
  }
  return (UIWindow *)v6;
}

- (CGRect)_unionFrameForView:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 bounds];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = objc_msgSend(v3, "subviews", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v26;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v16) frame];
        v34.origin.CGFloat x = v17;
        v34.origin.CGFloat y = v18;
        v34.size.CGFloat width = v19;
        v34.size.CGFloat height = v20;
        v31.origin.CGFloat x = x;
        v31.origin.CGFloat y = y;
        v31.size.CGFloat width = width;
        v31.size.CGFloat height = height;
        CGRect v32 = CGRectUnion(v31, v34);
        CGFloat x = v32.origin.x;
        CGFloat y = v32.origin.y;
        CGFloat width = v32.size.width;
        CGFloat height = v32.size.height;
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (BOOL)_viewIsVisibleInContainer:(id)a3
{
  if (!a3) {
    return 0;
  }
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  [(_UIContainerWindowPortalInteraction *)self _unionFrameForView:WeakRetained];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  id v15 = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v5, "convertRect:fromView:", v15, v8, v10, v12, v14);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;

  [v5 visibleBounds];
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;

  uint64_t v32 = v25;
  uint64_t v33 = v27;
  uint64_t v34 = v29;
  uint64_t v35 = v31;
  uint64_t v36 = v17;
  uint64_t v37 = v19;
  uint64_t v38 = v21;
  uint64_t v39 = v23;
  return CGRectContainsRect(*(CGRect *)&v32, *(CGRect *)&v36);
}

- (BOOL)_isSwiftUI:(id)a3
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v4 = [v3 bundlePath];

  LOBYTE(v3) = [v4 containsString:@"SwiftUI"];
  return (char)v3;
}

- (id)_visibleViewContainer
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v5 = [WeakRetained superview];

  if (v5)
  {
    do
    {
      if ([(_UIContainerWindowPortalInteraction *)self _viewIsVisibleInContainer:v5]
        && ![(_UIContainerWindowPortalInteraction *)self _isSwiftUI:v5])
      {
        break;
      }
      uint64_t v6 = [v5 superview];

      id v5 = (void *)v6;
    }
    while (v6);
  }
  [v5 safeAreaInsets];
  if (v7 > 0.0)
  {
    double v8 = [v5 _viewControllerForAncestor];
    double v9 = [v8 navigationController];
    double v10 = v9;
    if (v9)
    {
      double v11 = [v9 navigationBar];
      id v12 = objc_loadWeakRetained((id *)p_view);
      [(_UIContainerWindowPortalInteraction *)self _unionFrameForView:v12];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;

      id v21 = objc_loadWeakRetained((id *)p_view);
      objc_msgSend(v11, "convertRect:fromView:", v21, v14, v16, v18, v20);
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;

      [v11 bounds];
      v40.origin.CGFloat x = v23;
      v40.origin.CGFloat y = v25;
      v40.size.CGFloat width = v27;
      v40.size.CGFloat height = v29;
      if (CGRectIntersectsRect(v39, v40))
      {
        uint64_t v30 = [v11 superview];

        id v5 = (void *)v30;
      }
    }
  }
  uint64_t v31 = -[UIView __viewDelegate]((id *)v5);
  char v32 = objc_opt_respondsToSelector();

  if (v32)
  {
    uint64_t v33 = -[UIView __viewDelegate]((id *)v5);
    uint64_t v34 = [v33 _containerForContainerWindowPortalInteraction];

    if (v34)
    {
      id v35 = v34;

      id v5 = v35;
    }
  }
  if (!v5)
  {
    id v5 = [(_UIContainerWindowPortalInteraction *)self containerWindow];
    if (!v5)
    {
      id v36 = objc_loadWeakRetained((id *)p_view);
      id v5 = [v36 window];
    }
  }
  return v5;
}

- (id)_makePortalView
{
  id v3 = [_UIContainerWindowPortalView alloc];
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  uint64_t v6 = [(_UIPortalView *)v3 initWithSourceView:WeakRetained];

  [(_UIPortalView *)v6 setForwardsClientHitTestingToSourceView:1];
  [(_UIPortalView *)v6 _setGeometryFrozen:1];
  [(_UIPortalView *)v6 setHidesSourceView:1];
  [(_UIPortalView *)v6 setMatchesPosition:1];
  [(_UIPortalView *)v6 setMatchesTransform:1];
  [(_UIPortalView *)v6 setMatchesAlpha:1];
  double v7 = NSString;
  id v8 = objc_loadWeakRetained((id *)p_view);
  uint64_t v9 = objc_opt_class();
  id v10 = objc_loadWeakRetained((id *)p_view);
  double v11 = [v7 stringWithFormat:@"source: <%@: %p>", v9, v10];

  [(_UIPortalView *)v6 setName:v11];
  return v6;
}

- (void)ensureVisibilityInContainerWindow
{
  if (self->_portalViewEnabled)
  {
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    char v5 = [WeakRetained isHidden];

    if ((v5 & 1) == 0)
    {
      if (self->_attemptsToUseAncestorViewContainer
        || (id v6 = objc_loadWeakRetained((id *)p_view),
            [v6 window],
            double v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v7 _isRemoteKeyboardWindow],
            v7,
            v6,
            v8))
      {
        uint64_t v9 = [(_UIContainerWindowPortalInteraction *)self _visibleViewContainer];
      }
      else
      {
        uint64_t v9 = [(_UIContainerWindowPortalInteraction *)self containerWindow];
      }
      id v13 = (id)v9;
      id v10 = [(UIView *)self->_portalView superview];

      if (v13 != v10)
      {
        [(UIView *)self->_portalView removeFromSuperview];
        double v11 = [(_UIContainerWindowPortalInteraction *)self _makePortalView];
        portalView = self->_portalView;
        self->_portalView = v11;

        [v13 addSubview:self->_portalView];
      }
    }
  }
}

- (void)_setPortalViewEnabled:(BOOL)a3
{
  if (self->_portalViewEnabled != a3)
  {
    self->_portalViewEnabled = a3;
    if (a3
      && (id WeakRetained = objc_loadWeakRetained((id *)&self->_view),
          char v5 = [WeakRetained isHidden],
          WeakRetained,
          (v5 & 1) == 0))
    {
      [(UIView *)self->_portalView removeFromSuperview];
      double v7 = [(_UIContainerWindowPortalInteraction *)self _makePortalView];
      portalView = self->_portalView;
      self->_portalView = v7;

      [(_UIContainerWindowPortalInteraction *)self ensureVisibilityInContainerWindow];
    }
    else
    {
      [(UIView *)self->_portalView removeFromSuperview];
      id v6 = self->_portalView;
      self->_portalView = 0;
    }
  }
}

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);

  if (WeakRetained != v5)
  {
    [(_UIContainerWindowPortalInteraction *)self _setPortalViewEnabled:0];
  }
}

- (void)didMoveToView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    [(_UIContainerWindowPortalInteraction *)self _setPortalViewEnabled:0];
    objc_storeWeak((id *)&self->_view, obj);
    id v5 = obj;
    if (obj)
    {
      [(_UIContainerWindowPortalInteraction *)self _setPortalViewEnabled:[(_UIContainerWindowPortalInteraction *)self isEnabled]];
      id v5 = obj;
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_enabled = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
  {
    [(_UIContainerWindowPortalInteraction *)self _setPortalViewEnabled:v3];
  }
}

- (void)_viewVisibilityDidChange
{
  if ([(_UIContainerWindowPortalInteraction *)self isEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    uint64_t v4 = [WeakRetained isHidden] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(_UIContainerWindowPortalInteraction *)self _setPortalViewEnabled:v4];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)_portalViewEnabled
{
  return self->_portalViewEnabled;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)attemptsToUseAncestorViewContainer
{
  return self->_attemptsToUseAncestorViewContainer;
}

- (void)setAttemptsToUseAncestorViewContainer:(BOOL)a3
{
  self->_attemptsToUseAncestorViewContainer = a3;
}

- (_UIContainerWindowPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end