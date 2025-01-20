@interface LinkPreviewViewController
- (LinkPreviewViewController)initWithTabDocument:(id)a3;
- (SFScreenTimeOverlayViewController)screenTimeOverlayViewController;
- (TabDocument)previewTabDocument;
- (_SFBrowserView)browserView;
- (_SFLinkPreviewHeader)previewHeader;
- (id)currentFluidProgressStateSource;
- (void)displayHostedScreenTimeView;
- (void)loadView;
- (void)setScreenTimeOverlayViewController:(id)a3;
- (void)updatePreviewLoadingUIWithURLString:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willCommitPreviewedWebView;
@end

@implementation LinkPreviewViewController

- (LinkPreviewViewController)initWithTabDocument:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LinkPreviewViewController;
  v5 = [(LinkPreviewViewController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_previewTabDocument, v4);
    [v4 setLinkPreviewViewController:v6];
    [v4 beginSuppressingProgressAnimation];
    v7 = v6;
  }

  return v6;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4F3AF30]);
  id v4 = (_SFBrowserView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  browserView = self->_browserView;
  self->_browserView = v4;

  id v18 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  -[_SFBrowserView setBackgroundColor:](self->_browserView, "setBackgroundColor:");

  [(_SFBrowserView *)self->_browserView setContentReadyForDisplay];
  [(_SFBrowserView *)self->_browserView setAutoresizingMask:18];
  [(LinkPreviewViewController *)self setView:self->_browserView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewTabDocument);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F3AFB8]) initWithMinimumPreviewUI:0];
  [(_SFBrowserView *)self->_browserView setPreviewHeader:v6];

  v7 = [(_SFBrowserView *)self->_browserView previewHeader];
  v8 = [v7 progressView];

  objc_super v9 = [WeakRetained navigationBarItem];
  v10 = [v9 fluidProgressController];
  [v10 registerObserver:v8];

  v11 = [WeakRetained navigationBarItem];
  v12 = [v11 fluidProgressStateSource];
  v13 = [v12 progressState];
  [v8 setProgressToCurrentPositionForState:v13];

  v14 = self->_browserView;
  v15 = [WeakRetained webView];
  [(_SFBrowserView *)v14 addWebView:v15];

  v16 = [(_SFBrowserView *)self->_browserView currentWebView];
  [v16 setAutoresizingMask:18];

  v17 = [(_SFBrowserView *)self->_browserView previewHeader];
  [v17 setAccessibilityIdentifier:@"LinkPreview"];
}

- (_SFLinkPreviewHeader)previewHeader
{
  v2 = [(LinkPreviewViewController *)self view];
  id v3 = [v2 previewHeader];

  return (_SFLinkPreviewHeader *)v3;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LinkPreviewViewController;
  [(LinkPreviewViewController *)&v3 viewWillLayoutSubviews];
  [(LinkPreviewViewController *)self preferredContentSize];
  -[_SFBrowserView setUnscaledWebViewWidth:](self->_browserView, "setUnscaledWebViewWidth:");
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LinkPreviewViewController;
  [(LinkPreviewViewController *)&v6 viewDidAppear:a3];
  dispatch_time_t v4 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__LinkPreviewViewController_viewDidAppear___block_invoke;
  block[3] = &unk_1E6D79060;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __43__LinkPreviewViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  [WeakRetained endSuppressingProgressAnimationAnimated:0];
}

- (void)updatePreviewLoadingUIWithURLString:(id)a3
{
}

- (void)willCommitPreviewedWebView
{
  objc_super v3 = [(_SFBrowserView *)self->_browserView currentWebView];
  [v3 setTransform:&v6];

  dispatch_time_t v4 = [(_SFBrowserView *)self->_browserView previewHeader];
  [v4 setHidden:1];

  [(_SFBrowserView *)self->_browserView addWebView:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewTabDocument);
  [WeakRetained setLinkPreviewViewController:0];
}

- (void)displayHostedScreenTimeView
{
  objc_super v3 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController parentViewController];

  if (v3 != self) {
    [(LinkPreviewViewController *)self addChildViewController:self->_screenTimeOverlayViewController];
  }
  [(_SFBrowserView *)self->_browserView frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = [(LinkPreviewViewController *)self view];
  v14 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController view];
  v15 = [(_SFBrowserView *)self->_browserView previewHeader];
  [v13 insertSubview:v14 belowSubview:v15];

  if (v3 != self)
  {
    screenTimeOverlayViewController = self->_screenTimeOverlayViewController;
    [(SFScreenTimeOverlayViewController *)screenTimeOverlayViewController didMoveToParentViewController:self];
  }
}

- (id)currentFluidProgressStateSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewTabDocument);
  return WeakRetained;
}

- (SFScreenTimeOverlayViewController)screenTimeOverlayViewController
{
  return self->_screenTimeOverlayViewController;
}

- (void)setScreenTimeOverlayViewController:(id)a3
{
}

- (TabDocument)previewTabDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewTabDocument);
  return (TabDocument *)WeakRetained;
}

- (_SFBrowserView)browserView
{
  return self->_browserView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserView, 0);
  objc_destroyWeak((id *)&self->_previewTabDocument);
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, 0);
}

@end