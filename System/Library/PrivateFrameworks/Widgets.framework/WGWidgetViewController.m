@interface WGWidgetViewController
- (BOOL)isWidgetExtensionVisible:(id)a3;
- (CGSize)maxSizeForWidget:(id)a3 forDisplayMode:(int64_t)a4;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (UITraitCollection)requestedTraitCollectionOverride;
- (WGWidgetHostingViewController)widgetHost;
- (WGWidgetViewController)initWithWidgetInfo:(id)a3;
- (WGWidgetViewControllerDelegate)delegate;
- (id)_platterViewIfLoaded;
- (id)_platterViewLoadingIfNecessary:(BOOL)a3;
- (int64_t)largestAvailableDisplayModeForWidget:(id)a3;
- (int64_t)userSpecifiedDisplayModeForWidget:(id)a3;
- (void)_addWidgetButtonTapped:(id)a3;
- (void)loadView;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)registerWidgetForRefreshEvents:(id)a3;
- (void)remoteViewControllerDidConnectForWidget:(id)a3;
- (void)remoteViewControllerViewDidAppearForWidget:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWidgetHost:(id)a3;
- (void)unregisterWidgetForRefreshEvents:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)widget:(id)a3 didRemoveSnapshotAtURL:(id)a4;
@end

@implementation WGWidgetViewController

- (WGWidgetViewController)initWithWidgetInfo:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetViewController;
  v5 = [(WGWidgetViewController *)&v9 init];
  if (v5)
  {
    v6 = [[WGWidgetHostingViewController alloc] initWithWidgetInfo:v4 delegate:v5 host:v5];
    widgetHost = v5->_widgetHost;
    v5->_widgetHost = v6;

    [(WGWidgetViewController *)v5 addChildViewController:v5->_widgetHost];
    [(WGWidgetHostingViewController *)v5->_widgetHost didMoveToParentViewController:v5];
  }

  return v5;
}

- (void)loadView
{
  v3 = [WGWidgetPlatterView alloc];
  v7 = -[WGWidgetPlatterView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(WGWidgetPlatterView *)v7 setBackgroundHidden:1];
  [(WGWidgetPlatterView *)v7 _setContinuousCornerRadius:0.0];
  [(WGWidgetPlatterView *)v7 setButtonMode:1];
  if (self->_widgetHost)
  {
    -[WGWidgetPlatterView setWidgetHost:](v7, "setWidgetHost:");
    id v4 = [(WGWidgetHostingViewController *)self->_widgetHost widgetInfo];
    v5 = [v4 extension];
    -[WGWidgetPlatterView setAddWidgetButtonVisible:](v7, "setAddWidgetButtonVisible:", [v5 optedIn] ^ 1);

    v6 = [(WGWidgetPlatterView *)v7 addWidgetButton];
    [v6 addTarget:self action:sel__addWidgetButtonTapped_ forControlEvents:64];
  }
  [(WGWidgetViewController *)self setView:v7];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WGWidgetViewController;
  [(WGWidgetViewController *)&v9 viewDidAppear:a3];
  double v4 = 1.0;
  if (![(WGWidgetHostingViewController *)self->_widgetHost isRemoteViewVisible])
  {
    if ([(WGWidgetHostingViewController *)self->_widgetHost isSnapshotLoaded]) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.0;
    }
  }
  v5 = [(WGWidgetViewController *)self _platterViewIfLoaded];
  v6 = [v5 contentView];
  [v6 setAlpha:v4];

  v7 = +[WGWidgetEventTracker sharedInstance];
  v8 = [(WGWidgetHostingViewController *)self->_widgetHost widgetIdentifier];
  [v7 widgetViewDidAppearWithWidget:v8];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WGWidgetViewController;
  [(WGWidgetViewController *)&v8 viewDidDisappear:a3];
  double v4 = [(WGWidgetViewController *)self _platterViewIfLoaded];
  v5 = [v4 contentView];
  [v5 setAlpha:1.0];

  v6 = +[WGWidgetEventTracker sharedInstance];
  v7 = [(WGWidgetHostingViewController *)self->_widgetHost widgetIdentifier];
  [v6 widgetViewDidDisappearWithWidget:v7];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)WGWidgetViewController;
  [(WGWidgetViewController *)&v19 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3)
  {
    v6 = [(WGWidgetViewController *)self _platterViewIfLoaded];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = objc_msgSend(v6, "requiredVisualStyleCategories", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) integerValue];
          v13 = [(WGWidgetViewController *)self _platterViewIfLoaded];
          v14 = [v13 visualStylingProviderForCategory:v12];
          [v6 setVisualStylingProvider:v14 forCategory:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (UITraitCollection)requestedTraitCollectionOverride
{
  v2 = [(WGWidgetViewController *)self widgetHost];
  v3 = [v2 widgetIdentifier];
  BOOL v4 = WGIsWidgetWithBundleIdentifierBuiltOnOrAfterSystemVersion(v3, @"13.0");

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  }
  return (UITraitCollection *)v5;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  id v5 = a3;
  [v5 preferredContentSize];
  double v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v5;
  }
  else {
    id v8 = 0;
  }
  [(WGWidgetViewController *)self maxSizeForWidget:v8 forDisplayMode:0];
  double v10 = v9;

  double v11 = v7;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  if (self->_widgetHost == a3)
  {
    id v3 = [(WGWidgetViewController *)self _platterViewIfLoaded];
    [v3 invalidateIntrinsicContentSize];
  }
}

- (id)_platterViewLoadingIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(WGWidgetViewController *)self isViewLoaded] & 1) != 0 || v3)
  {
    id v5 = [(WGWidgetViewController *)self view];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_platterViewIfLoaded
{
  return [(WGWidgetViewController *)self _platterViewLoadingIfNecessary:0];
}

- (void)_addWidgetButtonTapped:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  BOOL v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  double v7 = @"WGWidgetViewControllerAddRequestBundleIdentifierKey";
  id v5 = [(WGWidgetHostingViewController *)self->_widgetHost widgetIdentifier];
  v8[0] = v5;
  double v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 postNotificationName:@"WGWidgetViewControllerAddRequestNotification" object:self userInfo:v6];
}

- (CGSize)maxSizeForWidget:(id)a3 forDisplayMode:(int64_t)a4
{
  BOOL v4 = [(WGWidgetViewController *)self _platterViewIfLoaded];
  id v5 = v4;
  if (v4)
  {
    [v4 bounds];
    CGFloat Width = CGRectGetWidth(v12);
  }
  else
  {
    CGFloat Width = 0.0;
  }
  +[WGWidgetInfo maximumContentHeightForCompactDisplayMode];
  double v8 = v7;

  double v9 = Width;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)registerWidgetForRefreshEvents:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained widgetViewControllerNeedsToBeRegisteredForRefreshNotification:self];
  }
}

- (void)unregisterWidgetForRefreshEvents:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained widgetViewControllerNeedsToBeUnregisteredForRefreshNotification:self];
  }
}

- (void)remoteViewControllerDidConnectForWidget:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteViewControllerDidConnectForWidgetViewController:self];
  }
}

- (void)remoteViewControllerViewDidAppearForWidget:(id)a3
{
  if ([(UIViewController *)self wg_isAppearingOrAppeared])
  {
    BOOL v4 = [(WGWidgetViewController *)self _platterViewIfLoaded];
    id v5 = v4;
    if (v4)
    {
      double v6 = [v4 contentView];
      [v6 alpha];
      double v8 = v7;

      if (v8 == 0.0)
      {
        double v9 = (void *)MEMORY[0x263F1CB60];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __69__WGWidgetViewController_remoteViewControllerViewDidAppearForWidget___block_invoke;
        v11[3] = &unk_264676588;
        id v12 = v5;
        [v9 animateWithDuration:v11 animations:0.25];
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteViewControllerViewDidAppearForWidgetViewController:self];
  }
}

void __69__WGWidgetViewController_remoteViewControllerViewDidAppearForWidget___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 setAlpha:1.0];
}

- (int64_t)userSpecifiedDisplayModeForWidget:(id)a3
{
  return 0;
}

- (int64_t)largestAvailableDisplayModeForWidget:(id)a3
{
  return 0;
}

- (void)widget:(id)a3 didRemoveSnapshotAtURL:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  double v6 = (void *)MEMORY[0x263F08A00];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 defaultCenter];
  v12[0] = @"WGWidgetViewControllerRemovedSnapshotWidgetIdentifierKey";
  double v10 = [v8 widgetIdentifier];

  v12[1] = @"WGWidgetViewControllerRemovedSnapshotURLKey";
  v13[0] = v10;
  v13[1] = v7;
  double v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  [v9 postNotificationName:@"WGWidgetViewControllerDidRemoveSnapshotNotification" object:self userInfo:v11];
}

- (BOOL)isWidgetExtensionVisible:(id)a3
{
  id v4 = a3;
  if ([(WGWidgetViewController *)self _appearState])
  {
    id v5 = [(WGWidgetHostingViewController *)self->_widgetHost widgetIdentifier];
    char v6 = [v5 isEqualToString:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (WGWidgetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WGWidgetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WGWidgetHostingViewController)widgetHost
{
  return self->_widgetHost;
}

- (void)setWidgetHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetHost, 0);
}

@end