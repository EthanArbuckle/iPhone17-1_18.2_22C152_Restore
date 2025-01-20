@interface _UIEditMenuInProcessPresentation
- (BOOL)canPresentEditMenu;
- (id)configureContainerViewWithConfiguration:(id)a3;
- (id)containerView;
- (void)teardownContainerView;
@end

@implementation _UIEditMenuInProcessPresentation

- (id)containerView
{
  return self->_menuContainerView;
}

- (BOOL)canPresentEditMenu
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIEditMenuPresentation *)self sourceView];
  v4 = +[_UIEditMenuSceneComponent sceneComponentForView:v3];

  if (!v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v6 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        goto LABEL_6;
      }
      v7 = [(_UIEditMenuPresentation *)self activeConfiguration];
      v8 = [(_UIEditMenuPresentation *)self sourceView];
      int v10 = 138412546;
      v11 = v7;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v10, 0x16u);
LABEL_5:

LABEL_6:
      goto LABEL_7;
    }
    v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &canPresentEditMenu___s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v7 = [(_UIEditMenuPresentation *)self activeConfiguration];
      v8 = [(_UIEditMenuPresentation *)self sourceView];
      int v10 = 138412546;
      v11 = v7;
      __int16 v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "The edit menu (configuration: %@) can only be presented when the view is in a window scene: %@", (uint8_t *)&v10, 0x16u);
      goto LABEL_5;
    }
  }
LABEL_7:

  return v4 != 0;
}

- (id)configureContainerViewWithConfiguration:(id)a3
{
  id v4 = a3;
  p_menuContainerView = &self->_menuContainerView;
  if (!self->_menuContainerView)
  {
    v6 = [(_UIEditMenuPresentation *)self sourceView];
    id v7 = [v6 window];

    uint64_t v8 = [v4 _overrideSourceWindow];
    v9 = (void *)v8;
    if (v8) {
      int v10 = (void *)v8;
    }
    else {
      int v10 = v7;
    }
    id v11 = v10;

    __int16 v12 = [[_UIEditMenuContainerView alloc] initWithPresentation:self enablePassthrough:v7 == v11];
    if ([v11 _isTextEffectsWindow]) {
      [v11 _usableSceneBounds];
    }
    else {
      [v11 bounds];
    }
    -[_UIEditMenuContainerView setFrame:](v12, "setFrame:");
    [(UIView *)v12 setAutoresizingMask:18];
    v13 = [(_UIEditMenuPresentation *)self sourceView];
    uint64_t v14 = [v13 traitCollection];
    v15 = _UIEditMenuGetPlatformMetrics([v14 userInterfaceIdiom]);

    v16 = [v15 containerViewConfigurator];

    if (v16)
    {
      v17 = [v15 containerViewConfigurator];
      ((void (**)(void, _UIEditMenuContainerView *))v17)[2](v17, v12);
    }
    [v11 addSubview:v12];
    objc_storeStrong((id *)&self->_menuContainerView, v12);
    if (v7 != v11)
    {
      v18 = [[_UIEditMenuContainerView alloc] initWithPresentation:self enablePassthrough:1];
      [v7 _usableSceneBounds];
      -[_UIEditMenuContainerView setFrame:](v18, "setFrame:");
      [(UIView *)v18 setAutoresizingMask:18];
      [v7 addSubview:v18];
      touchPassthroughView = self->_touchPassthroughView;
      self->_touchPassthroughView = v18;
    }
  }
  -[_UIEditMenuContainerView setIgnoresPassthroughInPresentationSource:](*p_menuContainerView, "setIgnoresPassthroughInPresentationSource:", [v4 _ignoresPassthroughInView]);
  -[_UIEditMenuContainerView setIgnoresPassthroughInPresentationSource:](self->_touchPassthroughView, "setIgnoresPassthroughInPresentationSource:", [v4 _ignoresPassthroughInView]);
  v20 = *p_menuContainerView;

  return v20;
}

- (void)teardownContainerView
{
  [(UIView *)self->_menuContainerView removeFromSuperview];
  menuContainerView = self->_menuContainerView;
  self->_menuContainerView = 0;

  [(UIView *)self->_touchPassthroughView removeFromSuperview];
  touchPassthroughView = self->_touchPassthroughView;
  self->_touchPassthroughView = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchPassthroughView, 0);
  objc_storeStrong((id *)&self->_menuContainerView, 0);
}

@end