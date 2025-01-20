@interface WebAppEligibilityViewController
- (BOOL)overrideShowAlert;
- (UIWebClip)webClip;
- (WebAppEligibilityViewController)initWithWebClip:(id)a3 scene:(id)a4;
- (void)_openURLAndDestroySceneIfNeeded;
- (void)loadView;
- (void)presentAlertIfNeeded;
- (void)setOverrideShowAlert:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WebAppEligibilityViewController

- (WebAppEligibilityViewController)initWithWebClip:(id)a3 scene:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WebAppEligibilityViewController;
  v9 = [(WebAppEligibilityViewController *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_webClip, a3);
    objc_storeStrong((id *)&v10->_scene, a4);
    webClip = v10->_webClip;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__WebAppEligibilityViewController_initWithWebClip_scene___block_invoke;
    v17[3] = &unk_264EA4990;
    v12 = v10;
    v18 = v12;
    uint64_t v13 = [(UIWebClip *)webClip eligibilityAlert:v17];
    alertController = v12->_alertController;
    v12->_alertController = (UIAlertController *)v13;

    v15 = v12;
  }

  return v10;
}

void __57__WebAppEligibilityViewController_initWithWebClip_scene___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = (void *)MEMORY[0x263F79480];
    v4 = [*(id *)(*(void *)(a1 + 32) + 1008) identifier];
    [v3 launchWebClipWithIdentifier:v4];

    *(unsigned char *)(*(void *)(a1 + 32) + 1000) = 1;
  }
  else
  {
    v5 = *(void **)(*(void *)(a1 + 32) + 992);
    objc_msgSend(v5, "_sf_destroyScene");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WebAppEligibilityViewController;
  [(WebAppEligibilityViewController *)&v4 viewDidAppear:a3];
  [(WebAppEligibilityViewController *)self presentAlertIfNeeded];
  [(WebAppEligibilityViewController *)self _openURLAndDestroySceneIfNeeded];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WebAppEligibilityViewController;
  [(WebAppEligibilityViewController *)&v4 viewWillDisappear:a3];
  if (self->_hasPendingDestroyScene) {
    [(UIScene *)self->_scene _sf_destroyScene];
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1C578]);
  objc_super v4 = [MEMORY[0x263F1C570] emptyConfiguration];
  v5 = (UIContentUnavailableView *)[v3 initWithConfiguration:v4];
  unavailableView = self->_unavailableView;
  self->_unavailableView = v5;

  [(UIContentUnavailableView *)self->_unavailableView setAutoresizingMask:18];
  id v7 = [MEMORY[0x263F1C550] systemBackgroundColor];
  [(UIContentUnavailableView *)self->_unavailableView setBackgroundColor:v7];

  id v8 = self->_unavailableView;

  [(WebAppEligibilityViewController *)self setView:v8];
}

- (void)presentAlertIfNeeded
{
  if ([(UIWebClip *)self->_webClip eligibilityStatus] == 1
    || ![(UIWebClip *)self->_webClip eligibilityStatus] && self->_overrideShowAlert)
  {
    id v3 = [(UIAlertController *)self->_alertController presentingViewController];

    if (!v3)
    {
      alertController = self->_alertController;
      [(WebAppEligibilityViewController *)self presentViewController:alertController animated:1 completion:0];
    }
  }
}

- (void)_openURLAndDestroySceneIfNeeded
{
  if ([(UIWebClip *)self->_webClip eligibilityStatus] == 2)
  {
    id v3 = (void *)MEMORY[0x263F79480];
    objc_super v4 = [(UIWebClip *)self->_webClip identifier];
    [v3 launchWebClipWithIdentifier:v4];

    self->_hasPendingDestroyScene = 1;
  }
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (BOOL)overrideShowAlert
{
  return self->_overrideShowAlert;
}

- (void)setOverrideShowAlert:(BOOL)a3
{
  self->_overrideShowAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_unavailableView, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end