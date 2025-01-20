@interface PPLPeopleEntityViewController
- (CGRect)initialSceneFrame;
- (CGRect)sceneSettingsFrameFromRect:(CGRect)a3;
- (FBScene)scene;
- (NSURL)personURL;
- (PPLPeopleAppSceneManager)sceneManager;
- (PPLPeopleEntityMetadata)metadata;
- (PPLPeopleEntityViewController)initWithMetadata:(id)a3;
- (PPLPeopleEntityViewController)initWithMetadata:(id)a3 sceneManager:(id)a4;
- (PPLPeopleEntityViewControllerDelegate)delegate;
- (UIEdgeInsets)safeAreaInsetFromSceneSettings:(id)a3;
- (UIEdgeInsets)sceneSafeAreaInsetPortrait;
- (UIScenePresentation)hostView;
- (UIScenePresenter)presenter;
- (void)sceneManager:(id)a3 didGrantOwnershipOfScene:(id)a4;
- (void)sceneManager:(id)a3 didRevokeOwnershipOfScene:(id)a4;
- (void)sceneManager:(id)a3 sceneDidRequestDismissal:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHostView:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setScene:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PPLPeopleEntityViewController

- (PPLPeopleEntityViewController)initWithMetadata:(id)a3
{
  id v4 = a3;
  v5 = +[PPLPeopleAppSceneManager sharedSceneManager];
  v6 = [(PPLPeopleEntityViewController *)self initWithMetadata:v4 sceneManager:v5];

  return v6;
}

- (PPLPeopleEntityViewController)initWithMetadata:(id)a3 sceneManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPLPeopleEntityViewController;
  v9 = [(PPLPeopleEntityViewController *)&v12 initWithNibName:0 bundle:0];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    objc_storeStrong((id *)&v10->_sceneManager, a4);
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PPLPeopleEntityViewController *)self sceneManager];
  [v5 addSceneRequester:self];

  v6.receiver = self;
  v6.super_class = (Class)PPLPeopleEntityViewController;
  [(PPLPeopleEntityViewController *)&v6 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PPLPeopleEntityViewController *)self sceneManager];
  [v5 removeSceneRequester:self];

  v6.receiver = self;
  v6.super_class = (Class)PPLPeopleEntityViewController;
  [(PPLPeopleEntityViewController *)&v6 viewDidDisappear:v3];
}

- (CGRect)initialSceneFrame
{
  BOOL v3 = [(PPLPeopleEntityViewController *)self view];
  [v3 bounds];
  -[PPLPeopleEntityViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (NSURL)personURL
{
  v2 = [(PPLPeopleEntityViewController *)self metadata];
  BOOL v3 = [v2 url];

  return (NSURL *)v3;
}

- (void)sceneManager:(id)a3 didGrantOwnershipOfScene:(id)a4
{
  id v5 = a4;
  double v6 = [(PPLPeopleEntityViewController *)self scene];

  if (!v6)
  {
    [(PPLPeopleEntityViewController *)self setScene:v5];
    double v7 = [(PPLPeopleEntityViewController *)self scene];
    double v8 = [v7 uiPresentationManager];

    double v9 = NSString;
    double v10 = [v5 identifier];
    double v11 = [v9 stringWithFormat:@"%@-%p", v10, self];

    double v12 = [v8 createPresenterWithIdentifier:v11];
    [(PPLPeopleEntityViewController *)self setPresenter:v12];
    double v13 = [v12 presentationView];
    [(PPLPeopleEntityViewController *)self setHostView:v13];

    [v12 modifyPresentationContext:&__block_literal_global];
    [v12 activate];
    double v14 = [(PPLPeopleEntityViewController *)self view];
    double v15 = [(PPLPeopleEntityViewController *)self hostView];
    v16 = [(PPLPeopleEntityViewController *)self hostView];
    [v14 addSubview:v16];

    v17 = [(PPLPeopleEntityViewController *)self hostView];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

    v18 = [v15 leadingAnchor];
    v19 = [v14 leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [v15 trailingAnchor];
    v22 = [v14 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    [v23 setActive:1];

    v24 = [v15 topAnchor];
    v25 = [v14 topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [v15 bottomAnchor];
    v28 = [v14 bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v29 setActive:1];

    v30 = PPLPeopleViewServiceLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2225B4000, v30, OS_LOG_TYPE_DEFAULT, "created scene", buf, 2u);
    }

    v31 = [(PPLPeopleEntityViewController *)self view];
    [v31 layoutIfNeeded];
  }
}

void __71__PPLPeopleEntityViewController_sceneManager_didGrantOwnershipOfScene___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPresentedLayerTypes:26];
  [v2 setBackgroundColorWhileHosting:0];
}

- (void)sceneManager:(id)a3 didRevokeOwnershipOfScene:(id)a4
{
  -[PPLPeopleEntityViewController setScene:](self, "setScene:", 0, a4);
  id v5 = [(PPLPeopleEntityViewController *)self presenter];
  [v5 invalidate];

  [(PPLPeopleEntityViewController *)self setPresenter:0];
  double v6 = [(PPLPeopleEntityViewController *)self hostView];
  [v6 removeFromSuperview];

  [(PPLPeopleEntityViewController *)self setHostView:0];
}

- (void)sceneManager:(id)a3 sceneDidRequestDismissal:(id)a4
{
  id v5 = PPLPeopleViewServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_2225B4000, v5, OS_LOG_TYPE_DEFAULT, "scene requested dismissal", v7, 2u);
  }

  double v6 = [(PPLPeopleEntityViewController *)self delegate];
  [v6 peopleEntityViewControllerDidRequestDismissal:self];
}

- (void)viewDidLayoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)PPLPeopleEntityViewController;
  [(PPLPeopleEntityViewController *)&v40 viewDidLayoutSubviews];
  BOOL v3 = [(PPLPeopleEntityViewController *)self view];
  [v3 bounds];
  -[PPLPeopleEntityViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:");
  CGFloat v5 = v4;
  CGFloat v37 = v6;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  [(PPLPeopleEntityViewController *)self sceneSafeAreaInsetPortrait];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v38 = v17;
  v18 = [(PPLPeopleEntityViewController *)self scene];
  v19 = [v18 settings];
  [(PPLPeopleEntityViewController *)self safeAreaInsetFromSceneSettings:v19];
  double v21 = v20;
  double v23 = v22;
  double v35 = v24;
  double v36 = v25;

  v26 = [(PPLPeopleEntityViewController *)self scene];
  v27 = [v26 settings];
  [v27 frame];
  v42.origin.x = v28;
  v42.origin.y = v29;
  v42.size.width = v30;
  v42.size.height = v31;
  v41.origin.x = v5;
  v41.origin.y = v37;
  v41.size.width = v8;
  v41.size.height = v10;
  BOOL v32 = CGRectEqualToRect(v41, v42);

  if (!v32 || v14 != v23 || v12 != v21 || (double v33 = v38, v38 != v36) || (double v33 = v35, v16 != v35))
  {
    v34 = [(PPLPeopleEntityViewController *)self scene];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __54__PPLPeopleEntityViewController_viewDidLayoutSubviews__block_invoke;
    v39[3] = &__block_descriptor_96_e33_v16__0__FBSMutableSceneSettings_8l;
    *(CGFloat *)&v39[4] = v5;
    *(CGFloat *)&v39[5] = v37;
    *(CGFloat *)&v39[6] = v8;
    *(CGFloat *)&v39[7] = v10;
    *(double *)&v39[8] = v12;
    *(double *)&v39[9] = v14;
    *(double *)&v39[10] = v16;
    *(double *)&v39[11] = v38;
    [v34 updateSettingsWithBlock:v39];
  }
}

void __54__PPLPeopleEntityViewController_viewDidLayoutSubviews__block_invoke(double *a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
  if ([v3 isUISubclass]) {
    objc_msgSend(v3, "setSafeAreaInsetsPortrait:", a1[8], a1[9], a1[10], a1[11]);
  }
}

- (CGRect)sceneSettingsFrameFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  BOOL v12 = CGRectEqualToRect(v17, *MEMORY[0x263F001A8]);
  if (v12) {
    double v13 = v9;
  }
  else {
    double v13 = width;
  }
  if (v12) {
    double v14 = v11;
  }
  else {
    double v14 = height;
  }
  double v15 = x;
  double v16 = y;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (UIEdgeInsets)sceneSafeAreaInsetPortrait
{
  id v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  [(PPLPeopleEntityViewController *)self initialSceneFrame];
  double v9 = v8;
  double v11 = v10;

  if (v5 == v9 && v7 == v11)
  {
    CGRect v17 = [(PPLPeopleEntityViewController *)self view];
    v18 = [v17 window];
    v19 = [v18 _scene];
    double v20 = [v19 settings];

    if (v20 && ([v20 isUISubclass] & 1) != 0)
    {
      [v20 safeAreaInsetsPortrait];
      double v13 = v21;
      double v14 = v22;
      double v15 = v23;
      double v16 = v24;
    }
    else
    {
      double v13 = *MEMORY[0x263F1D1C0];
      double v14 = *(double *)(MEMORY[0x263F1D1C0] + 8);
      double v15 = *(double *)(MEMORY[0x263F1D1C0] + 16);
      double v16 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    }
  }
  else
  {
    double v13 = *MEMORY[0x263F1D1C0];
    double v14 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v15 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v16 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }
  double v25 = v13;
  double v26 = v14;
  double v27 = v15;
  double v28 = v16;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (UIEdgeInsets)safeAreaInsetFromSceneSettings:(id)a3
{
  id v3 = a3;
  if ([v3 isUISubclass])
  {
    [v3 safeAreaInsetsPortrait];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    double v5 = *MEMORY[0x263F1D1C0];
    double v7 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v9 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v11 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  }

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (PPLPeopleEntityViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PPLPeopleEntityViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (UIScenePresentation)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
}

- (UIScenePresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (PPLPeopleEntityMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (PPLPeopleAppSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end