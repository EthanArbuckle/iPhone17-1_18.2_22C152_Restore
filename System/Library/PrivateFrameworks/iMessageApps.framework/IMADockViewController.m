@interface IMADockViewController
- (BOOL)alwaysPresentAppsExpanded;
- (BOOL)hidesCompactAppForStickerDrag;
- (BOOL)showIconBorders;
- (IMADockViewController)init;
- (IMADockViewControllerDelegate)delegate;
- (UIViewController)currentAppViewController;
- (double)minimizedDockHeight;
- (id)appStrip;
- (id)imageViewForSticker:(id)a3;
- (void)cleanupRunningApps;
- (void)hideAppViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setAlwaysPresentAppsExpanded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHidesCompactAppForStickerDrag:(BOOL)a3;
- (void)setShowIconBorders:(BOOL)a3;
- (void)switcherView:(id)a3 didMagnify:(BOOL)a4;
- (void)switcherView:(id)a3 didSelectPluginAtIndex:(id)a4;
- (void)updateAppStripFrame;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation IMADockViewController

- (IMADockViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)IMADockViewController;
  v2 = [(IMADockViewController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(IMAAppPresenter);
    appPresenter = v2->_appPresenter;
    v2->_appPresenter = v3;

    v2->_showIconBorders = 1;
  }
  return v2;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)IMADockViewController;
  [(IMADockViewController *)&v9 viewDidLoad];
  v3 = (CKBrowserSwitcherFooterViewDataSource *)objc_alloc_init(MEMORY[0x263F31A40]);
  appStripDataSource = self->_appStripDataSource;
  self->_appStripDataSource = v3;

  id v5 = objc_alloc(MEMORY[0x263F31A38]);
  objc_super v6 = (CKBrowserSwitcherFooterView *)objc_msgSend(v5, "initWithFrame:toggleBordersOnInterfaceStyle:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  appStrip = self->_appStrip;
  self->_appStrip = v6;

  [(CKBrowserSwitcherFooterView *)self->_appStrip setAutoresizingMask:2];
  [(CKBrowserSwitcherFooterView *)self->_appStrip setDelegate:self];
  [(CKBrowserSwitcherFooterView *)self->_appStrip setDataSource:self->_appStripDataSource];
  [(CKBrowserSwitcherFooterView *)self->_appStrip setScrollsLastUsedAppIconIntoView:0];
  [(CKBrowserSwitcherFooterView *)self->_appStrip setShowBorders:[(IMADockViewController *)self showIconBorders]];
  v8 = [(IMADockViewController *)self view];
  [v8 addSubview:self->_appStrip];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)IMADockViewController;
  [(IMADockViewController *)&v3 viewDidLayoutSubviews];
  [(IMADockViewController *)self updateAppStripFrame];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)IMADockViewController;
  id v7 = a4;
  -[IMADockViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__IMADockViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_264893B20;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __76__IMADockViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) updateAppFrameForRotation];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(IMAAppPresenter *)self->_appPresenter setDelegate:obj];
  }
}

- (BOOL)alwaysPresentAppsExpanded
{
  return [(IMAAppPresenter *)self->_appPresenter alwaysPresentAppsExpanded];
}

- (void)setAlwaysPresentAppsExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(IMAAppPresenter *)self->_appPresenter alwaysPresentAppsExpanded] != a3)
  {
    [(IMAAppPresenter *)self->_appPresenter setAlwaysPresentAppsExpanded:v3];
    id v5 = [(IMADockViewController *)self view];
    [v5 setClipsToBounds:v3];
  }
}

- (void)setShowIconBorders:(BOOL)a3
{
  if (self->_showIconBorders != a3)
  {
    self->_showIconBorders = a3;
    -[CKBrowserSwitcherFooterView setShowBorders:](self->_appStrip, "setShowBorders:");
  }
}

- (double)minimizedDockHeight
{
  int v2 = CKIsRunningInCameraAppsClient();
  BOOL v3 = [MEMORY[0x263F31AB0] sharedBehaviors];
  v4 = v3;
  if (v2) {
    [v3 cameraAppsMinimizedDockHeight];
  }
  else {
    [v3 chatChromeBottomInset];
  }
  double v6 = v5;

  return v6;
}

- (UIViewController)currentAppViewController
{
  return [(IMAAppPresenter *)self->_appPresenter currentAppViewController];
}

- (BOOL)hidesCompactAppForStickerDrag
{
  return [(IMAAppPresenter *)self->_appPresenter hidesCompactAppForStickerDrag];
}

- (void)setHidesCompactAppForStickerDrag:(BOOL)a3
{
}

- (id)imageViewForSticker:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F31A88]);
  double v5 = [v3 fileURL];
  double v6 = (void *)[v4 initWithURL:v5];

  id v7 = [v6 durationsWithMaxCount:0x7FFFFFFFLL];
  v8 = [MEMORY[0x263EFF980] array];
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = objc_msgSend(v6, "thumbnailAtIndex:fillToSize:maxCount:", v9, 0x7FFFFFFFLL, 1.79769313e308, 1.79769313e308);
      if (v10) {
        [v8 addObject:v10];
      }

      ++v9;
    }
    while (v9 < [v6 count]);
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263F319F8]) initWithImages:v8 durations:v7];
  id v12 = objc_alloc_init(MEMORY[0x263F31A00]);
  [v12 setAnimatedImage:v11];
  [v12 setAutomaticallyObserveWindowForAnimationTimer:1];

  return v12;
}

- (void)hideAppViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)cleanupRunningApps
{
  int v2 = [MEMORY[0x263F31A18] sharedInstance];
  [v2 invalidateAllActivePlugins];

  id v3 = [MEMORY[0x263F31A18] sharedInstance];
  [v3 forceKillRemoteExtensionsWithDelay:1];
}

- (void)updateAppStripFrame
{
  [(CKBrowserSwitcherFooterView *)self->_appStrip contentHeight];
  double v4 = v3;
  double v5 = [(IMADockViewController *)self view];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.double width = v11;
  v18.size.double height = v13;
  double v14 = CGRectGetMaxY(v18) - v4;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.double width = v11;
  v19.size.double height = v13;
  double Width = CGRectGetWidth(v19);
  appStrip = self->_appStrip;
  -[CKBrowserSwitcherFooterView setFrame:](appStrip, "setFrame:", 0.0, v14, Width, v4);
}

- (void)switcherView:(id)a3 didSelectPluginAtIndex:(id)a4
{
  double v5 = (void *)MEMORY[0x263F31A18];
  id v6 = a4;
  CGFloat v7 = [v5 sharedInstance];
  double v8 = [v7 visibleDrawerPlugins];
  uint64_t v9 = [v6 item];

  double v10 = [v8 objectAtIndexedSubscript:v9];

  appPresenter = self->_appPresenter;
  double v12 = [v10 identifier];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__IMADockViewController_switcherView_didSelectPluginAtIndex___block_invoke;
  v13[3] = &unk_264893B48;
  v13[4] = self;
  [(IMAAppPresenter *)appPresenter presentAppWithBundleIdentifier:v12 completion:v13];
}

uint64_t __61__IMADockViewController_switcherView_didSelectPluginAtIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 976) clearSelection];
}

- (void)switcherView:(id)a3 didMagnify:(BOOL)a4
{
  BOOL v4 = a4;
  [(IMADockViewController *)self updateAppStripFrame];
  id v6 = [(IMADockViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 dockDidMagnify:v4];
  }
}

- (id)appStrip
{
  return self->_appStrip;
}

- (IMADockViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMADockViewControllerDelegate *)WeakRetained;
}

- (BOOL)showIconBorders
{
  return self->_showIconBorders;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appPresenter, 0);
  objc_storeStrong((id *)&self->_appStripDataSource, 0);
  objc_storeStrong((id *)&self->_appStrip, 0);
}

@end