@interface SBDeviceApplicationRemoteTransientOverlayContainerViewController
- (BOOL)_canShowWhileLocked;
- (SBDeviceApplicationRemoteTransientOverlayContainerViewController)initWithViewProvider:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewWillLayoutSubviews;
@end

@implementation SBDeviceApplicationRemoteTransientOverlayContainerViewController

- (SBDeviceApplicationRemoteTransientOverlayContainerViewController)initWithViewProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayContainerViewController;
  v5 = [(SBDeviceApplicationRemoteTransientOverlayContainerViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_viewProvider, v4);
  }

  return v6;
}

- (int64_t)preferredStatusBarStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  int64_t v3 = [WeakRetained preferredStatusBarStyle];

  return v3;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  int64_t v3 = [WeakRetained preferredInterfaceOrientationForPresentation];

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  unint64_t v3 = [WeakRetained supportedInterfaceOrientations];

  return v3;
}

- (void)viewWillLayoutSubviews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)SBDeviceApplicationRemoteTransientOverlayContainerViewController;
  [(SBDeviceApplicationRemoteTransientOverlayContainerViewController *)&v14 viewWillLayoutSubviews];
  unint64_t v3 = [(SBDeviceApplicationRemoteTransientOverlayContainerViewController *)self view];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "subviews", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        [v3 bounds];
        objc_msgSend(v9, "setFrame:");
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end