@interface _TUIAuxiliaryItemHost
- (TUIHostingController)hostingController;
- (TUIHostingIdentifier)identifier;
- (TUIHostingViewState)viewState;
- (UIBarButtonItem)item;
- (_TUIAuxiliaryItemHost)initWithIdentifier:(id)a3 hostingController:(id)a4 item:(id)a5;
- (void)_updateHost;
- (void)dealloc;
@end

@implementation _TUIAuxiliaryItemHost

- (_TUIAuxiliaryItemHost)initWithIdentifier:(id)a3 hostingController:(id)a4 item:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_TUIAuxiliaryItemHost;
  v12 = [(_TUIAuxiliaryItemHost *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeWeak((id *)&v13->_hostingController, v10);
    objc_storeStrong((id *)&v13->_item, a5);
    id WeakRetained = objc_loadWeakRetained((id *)&v13->_hostingController);
    [WeakRetained addProviderObserver:v13 forIdentifier:v13->_identifier];
  }
  return v13;
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
  v5.super_class = (Class)_TUIAuxiliaryItemHost;
  [(_TUIAuxiliaryItemHost *)&v5 dealloc];
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
    if (*p_viewState)
    {
      id v8 = objc_loadWeakRetained((id *)p_hostingController);
      [v8 runAppearanceTransitionForViewState:self->_viewState barButtonItem:self->_item];
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

- (UIBarButtonItem)item
{
  return self->_item;
}

- (TUIHostingViewState)viewState
{
  return self->_viewState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_hostingController);
}

@end