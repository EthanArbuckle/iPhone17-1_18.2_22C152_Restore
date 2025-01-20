@interface _TUIAuxiliaryViewHost
- (BOOL)visible;
- (TUICancellable)visibilityObserver;
- (TUIHostingController)hostingController;
- (TUIHostingIdentifier)identifier;
- (TUIHostingViewState)viewState;
- (UIView)view;
- (_TUIAuxiliaryViewHost)initWithIdentifier:(id)a3 hostingController:(id)a4 viewVisibilityController:(id)a5 view:(id)a6;
- (void)_updateHost;
- (void)_updatePopoverLayout;
- (void)_updateVisible:(BOOL)a3;
- (void)dealloc;
- (void)setVisible:(BOOL)a3;
@end

@implementation _TUIAuxiliaryViewHost

- (_TUIAuxiliaryViewHost)initWithIdentifier:(id)a3 hostingController:(id)a4 viewVisibilityController:(id)a5 view:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)_TUIAuxiliaryViewHost;
  v15 = [(_TUIAuxiliaryViewHost *)&v28 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeWeak((id *)&v16->_hostingController, v12);
    objc_storeStrong((id *)&v16->_view, a6);
    id WeakRetained = objc_loadWeakRetained((id *)&v16->_hostingController);
    [WeakRetained addProviderObserver:v16 forIdentifier:v16->_identifier];

    objc_initWeak(&location, v16);
    v18 = +[TUIVisibilityOptions modalAnchorOptions];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_125460;
    v25 = &unk_253FE8;
    objc_copyWeak(&v26, &location);
    uint64_t v19 = [v13 observeNavigationBarView:v14 options:v18 block:&v22];
    visibilityObserver = v16->_visibilityObserver;
    v16->_visibilityObserver = (TUICancellable *)v19;

    [(_TUIAuxiliaryViewHost *)v16 _updateHost];
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)dealloc
{
  if (self->_viewState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
    [WeakRetained runDisappearanceTransitionForViewState:self->_viewState];
  }
  id v4 = objc_loadWeakRetained((id *)&self->_hostingController);
  [v4 removeProviderObserver:self forIdentifier:self->_identifier];

  v5.receiver = self;
  v5.super_class = (Class)_TUIAuxiliaryViewHost;
  [(_TUIAuxiliaryViewHost *)&v5 dealloc];
}

- (void)_updatePopoverLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  [WeakRetained updatePopoverLayoutForViewState:self->_viewState superview:self->_view];
}

- (void)_updateVisible:(BOOL)a3
{
  self->_visible = a3;
  viewState = self->_viewState;
  if (a3)
  {
    if (!viewState) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
    [WeakRetained runAppearanceTransitionForViewState:self->_viewState superview:self->_view];
  }
  else
  {
    if (!viewState) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
    [WeakRetained runDisappearanceTransitionForViewState:self->_viewState];
  }
}

- (void)_updateHost
{
  p_hostingController = &self->_hostingController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  obj = [WeakRetained viewStateForIdentifier:self->_identifier];

  p_viewState = &self->_viewState;
  viewState = self->_viewState;
  if (viewState != obj)
  {
    if (viewState)
    {
      id v7 = objc_loadWeakRetained((id *)p_hostingController);
      [v7 runDisappearanceTransitionForViewState:*p_viewState];
    }
    objc_storeStrong((id *)&self->_viewState, obj);
    if (*p_viewState && self->_visible)
    {
      id v8 = objc_loadWeakRetained((id *)p_hostingController);
      [v8 runAppearanceTransitionForViewState:self->_viewState superview:self->_view];
    }
  }
}

- (TUIHostingController)hostingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);

  return (TUIHostingController *)WeakRetained;
}

- (TUIHostingIdentifier)identifier
{
  return self->_identifier;
}

- (UIView)view
{
  return self->_view;
}

- (TUIHostingViewState)viewState
{
  return self->_viewState;
}

- (TUICancellable)visibilityObserver
{
  return self->_visibilityObserver;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityObserver, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_hostingController);
}

@end