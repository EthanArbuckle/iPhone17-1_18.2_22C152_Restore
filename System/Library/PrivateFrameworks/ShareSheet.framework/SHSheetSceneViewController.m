@interface SHSheetSceneViewController
+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing;
- (CGRect)_framePortrait;
- (LPLinkMetadata)remoteHeaderMetadata;
- (SHSheetContentPresenter)presenter;
- (SHSheetScene)scene;
- (SHSheetSceneViewController)initWithSession:(id)a3;
- (SHSheetScrollingTest)currentTest;
- (SHSheetSession)session;
- (UIEdgeInsets)_safeAreaInsetsPortrait;
- (UIView)sceneView;
- (id)_hostSheetPresentationController;
- (int64_t)_hostProcessType;
- (void)_installSceneView;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_willEnterForeground:(id)a3;
- (void)dealloc;
- (void)didUpdateAirDropTransferWithChange:(id)a3;
- (void)reloadActivity:(id)a3;
- (void)reloadContent;
- (void)reloadMetadata:(id)a3;
- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (void)scene:(id)a3 didReceiveAction:(id)a4;
- (void)scene:(id)a3 didReceiveDraggingAction:(id)a4;
- (void)scene:(id)a3 didReceiveMetadataUpdateAction:(id)a4;
- (void)scene:(id)a3 didReceiveSuggestionAction:(id)a4;
- (void)sceneSettingsDidChange:(id)a3;
- (void)setCurrentTest:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setRemoteHeaderMetadata:(id)a3;
- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4;
- (void)stopPulsingActivity:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithViewModel:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation SHSheetSceneViewController

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 1;
}

- (SHSheetSceneViewController)initWithSession:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SHSheetSceneViewController;
  v6 = [(SHSheetSceneViewController *)&v14 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    uint64_t v8 = [v5 remoteScene];
    scene = v7->_scene;
    v7->_scene = (SHSheetScene *)v8;

    [(SHSheetScene *)v7->_scene setDelegate:v7];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__willEnterForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__sceneWillEnterForeground_ name:*MEMORY[0x1E4FB2EB0] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel__sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2EB0] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB2E90] object:0];

  v6 = [(SHSheetSceneViewController *)self scene];
  [v6 invalidate];

  v7.receiver = self;
  v7.super_class = (Class)SHSheetSceneViewController;
  [(SHSheetSceneViewController *)&v7 dealloc];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)SHSheetSceneViewController;
  [(SHSheetSceneViewController *)&v9 viewDidLoad];
  [(SHSheetSceneViewController *)self _installSceneView];
  v3 = [(SHSheetSceneViewController *)self session];
  v4 = [v3 activityViewController];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__SHSheetSceneViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E5A21900;
  id v8 = v4;
  id v5 = v4;
  v6 = [(SHSheetSceneViewController *)self scene];
  [v6 setFenceCompletionHandler:v7];
}

uint64_t __41__SHSheetSceneViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readyToInteract];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SHSheetSceneViewController;
  [(SHSheetSceneViewController *)&v7 viewDidDisappear:a3];
  v4 = [(SHSheetSceneViewController *)self view];
  id v5 = [v4 window];
  v6 = [v5 windowScene];
  [v6 _unregisterSettingsDiffActionArrayForKey:@"SHSheetSceneViewControllerSceneSettingsDiffAction"];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)SHSheetSceneViewController;
  [(SHSheetSceneViewController *)&v18 viewIsAppearing:a3];
  v4 = objc_alloc_init(SHSheetSceneSettingsDiffAction);
  [(SHSheetSceneSettingsDiffAction *)v4 setDelegate:self];
  id v5 = [(SHSheetSceneViewController *)self view];
  v6 = [v5 window];
  objc_super v7 = [v6 windowScene];
  v19[0] = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v7 _registerSettingsDiffActionArray:v8 forKey:@"SHSheetSceneViewControllerSceneSettingsDiffAction"];

  objc_super v9 = [(SHSheetSceneViewController *)self view];
  v10 = [v9 window];
  v11 = [v10 windowScene];

  int64_t v12 = [(SHSheetSceneViewController *)self _hostProcessType];
  v13 = [(SHSheetSceneViewController *)self scene];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__SHSheetSceneViewController_viewIsAppearing___block_invoke;
  v15[3] = &unk_1E5A23190;
  v15[4] = self;
  id v16 = v11;
  int64_t v17 = v12;
  id v14 = v11;
  [v13 updateWithChange:v15];
}

void __46__SHSheetSceneViewController_viewIsAppearing___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
  v4 = *(void **)(a1 + 32);
  id v7 = a2;
  [v4 _framePortrait];
  objc_msgSend(v7, "setFramePortrait:");
  [*(id *)(a1 + 32) _safeAreaInsetsPortrait];
  objc_msgSend(v7, "setSafeAreaInsetsPortrait:");
  objc_msgSend(v7, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"));
  id v5 = [*(id *)(a1 + 40) screen];
  v6 = [v5 displayConfiguration];
  [v7 setDisplayConfiguration:v6];

  [v7 setHostProcessType:*(void *)(a1 + 48)];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SHSheetSceneViewController;
  [(SHSheetSceneViewController *)&v9 viewDidLayoutSubviews];
  v3 = [(SHSheetSceneViewController *)self view];
  v4 = [v3 window];
  id v5 = [v4 windowScene];

  if (v5)
  {
    v6 = [(SHSheetSceneViewController *)self scene];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__SHSheetSceneViewController_viewDidLayoutSubviews__block_invoke;
    v7[3] = &unk_1E5A231B8;
    void v7[4] = self;
    id v8 = v5;
    [v6 updateWithChange:v7];
  }
}

void __51__SHSheetSceneViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _framePortrait];
  objc_msgSend(v4, "setFramePortrait:");
  [v4 setPresentationStyle:SHSheetPresentationControllerPresentationStyle(*(void **)(a1 + 32))];
  [*(id *)(a1 + 32) _safeAreaInsetsPortrait];
  objc_msgSend(v4, "setSafeAreaInsetsPortrait:");
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation"));
  id v5 = [*(id *)(a1 + 40) screen];
  v6 = [v5 displayConfiguration];
  [v4 setDisplayConfiguration:v6];

  id v7 = [*(id *)(a1 + 32) traitCollection];
  objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SHSheetSceneViewController;
  [(SHSheetSceneViewController *)&v6 traitCollectionDidChange:a3];
  id v4 = [(SHSheetSceneViewController *)self scene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__SHSheetSceneViewController_traitCollectionDidChange___block_invoke;
  v5[3] = &unk_1E5A222B0;
  v5[4] = self;
  [v4 updateWithChange:v5];
}

void __55__SHSheetSceneViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 traitCollection];
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));
}

- (void)viewSafeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)SHSheetSceneViewController;
  [(SHSheetSceneViewController *)&v5 viewSafeAreaInsetsDidChange];
  id v3 = [(SHSheetSceneViewController *)self scene];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SHSheetSceneViewController_viewSafeAreaInsetsDidChange__block_invoke;
  v4[3] = &unk_1E5A222B0;
  v4[4] = self;
  [v3 updateWithChange:v4];
}

void __57__SHSheetSceneViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 _safeAreaInsetsPortrait];
  objc_msgSend(v3, "setSafeAreaInsetsPortrait:");
}

- (void)_installSceneView
{
  id v3 = [(SHSheetSceneViewController *)self scene];
  obj = [v3 sceneView];

  p_sceneView = &self->_sceneView;
  sceneView = self->_sceneView;
  if (sceneView != obj)
  {
    [(UIView *)sceneView removeFromSuperview];
    objc_super v6 = [(SHSheetSceneViewController *)self view];
    [v6 addSubview:obj];

    [(UIView *)obj setClipsToBounds:1];
    id v7 = [(UIView *)obj layer];
    [v7 setName:@"SHSheetSceneView"];

    objc_storeStrong((id *)p_sceneView, obj);
  }
}

- (CGRect)_framePortrait
{
  id v3 = [(SHSheetSceneViewController *)self view];
  id v4 = [v3 window];
  objc_super v5 = [v4 windowScene];

  objc_super v6 = [(SHSheetSceneViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [v5 interfaceOrientation];
  if ((unint64_t)(v15 - 3) >= 2) {
    double v16 = v14;
  }
  else {
    double v16 = v12;
  }
  if ((unint64_t)(v15 - 3) < 2) {
    double v12 = v14;
  }

  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (UIEdgeInsets)_safeAreaInsetsPortrait
{
  id v3 = [(SHSheetSceneViewController *)self view];
  id v4 = [v3 window];
  objc_super v5 = [v4 windowScene];

  objc_super v6 = [(SHSheetSceneViewController *)self view];
  [v6 safeAreaInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [v5 traitCollection];
  uint64_t v16 = [v15 userInterfaceIdiom];

  if (v16 == 1) {
    goto LABEL_6;
  }
  uint64_t v17 = [v5 interfaceOrientation];
  if (v17 == 2)
  {
    double v18 = v10;
    double v19 = v8;
    double v20 = v14;
    double v14 = v12;
    goto LABEL_7;
  }
  if (v17 == 3)
  {
    double v18 = v8;
    double v19 = v14;
    double v20 = v12;
    double v14 = v10;
    goto LABEL_7;
  }
  if (v17 != 4)
  {
LABEL_6:
    double v18 = v14;
    double v19 = v12;
    double v20 = v10;
    double v14 = v8;
  }
  else
  {
    double v18 = v12;
    double v19 = v10;
    double v20 = v8;
  }
LABEL_7:

  double v21 = v14;
  double v22 = v20;
  double v23 = v19;
  double v24 = v18;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (void)sceneSettingsDidChange:(id)a3
{
  id v4 = [(SHSheetSceneViewController *)self view];
  objc_super v5 = [v4 window];

  if (v5)
  {
    objc_super v6 = [(SHSheetSceneViewController *)self scene];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__SHSheetSceneViewController_sceneSettingsDidChange___block_invoke;
    v7[3] = &unk_1E5A222B0;
    void v7[4] = self;
    [v6 updateWithChange:v7];
  }
}

void __53__SHSheetSceneViewController_sceneSettingsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_super v5 = [v3 view];
  objc_super v6 = [v5 window];
  double v7 = [v6 windowScene];
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v7, "interfaceOrientation"));

  id v12 = [*(id *)(a1 + 32) view];
  double v8 = [v12 window];
  double v9 = [v8 windowScene];
  double v10 = [v9 screen];
  double v11 = [v10 displayConfiguration];
  [v4 setDisplayConfiguration:v11];
}

- (void)_willEnterForeground:(id)a3
{
  id v4 = [(SHSheetSceneViewController *)self scene];
  char v5 = [v4 isActive];

  if ((v5 & 1) == 0)
  {
    id v6 = [(SHSheetSceneViewController *)self scene];
    [v6 activate];
  }
}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v9 = a3;
  id v4 = [(SHSheetSceneViewController *)self view];
  char v5 = [v4 window];
  id v6 = [v5 windowScene];

  if (v6)
  {
    double v7 = [v9 object];

    if (v7 == v6)
    {
      double v8 = [(SHSheetSceneViewController *)self scene];
      [v8 updateWithChange:&__block_literal_global_33];
    }
  }
}

uint64_t __56__SHSheetSceneViewController__sceneWillEnterForeground___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setForeground:1];
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  char v5 = [(SHSheetSceneViewController *)self view];
  id v6 = [v5 window];
  double v7 = [v6 windowScene];

  if (v7)
  {
    double v8 = [v4 object];
    if (v8 == v7)
    {
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __55__SHSheetSceneViewController__sceneDidEnterBackground___block_invoke;
        v10[3] = &unk_1E5A21900;
        v10[4] = self;
        [v7 _performAfterSystemSnapshotsComplete:v10];
      }
    }
    else
    {
    }
  }
}

void __55__SHSheetSceneViewController__sceneDidEnterBackground___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) scene];
  [v1 updateWithChange:&__block_literal_global_31];
}

uint64_t __55__SHSheetSceneViewController__sceneDidEnterBackground___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setForeground:0];
}

- (int64_t)_hostProcessType
{
  id v3 = [(SHSheetSceneViewController *)self viewIfLoaded];
  id v4 = [v3 window];

  if (!v4) {
    return 0;
  }
  char v5 = [(SHSheetSceneViewController *)self viewIfLoaded];
  id v6 = [v5 window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)scene:(id)a3 didReceiveAction:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    uint64_t v12 = [v5 type];
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "did receive action with type:%ld", (uint8_t *)&v11, 0xCu);
  }

  switch([v5 type])
  {
    case 0:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 handleCustomHeaderButton];
      goto LABEL_13;
    case 1:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 handleOptions];
      goto LABEL_13;
    case 2:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 handleCollaborationOptions];
      goto LABEL_13;
    case 3:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 didSelectCollaborativeAction];
      goto LABEL_13;
    case 4:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 didSelectSendCopyAction];
      goto LABEL_13;
    case 5:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 handleClose];
      goto LABEL_13;
    case 6:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 handleActionsEdit];
      goto LABEL_13;
    case 7:
      double v7 = [(SHSheetSceneViewController *)self presenter];
      [v7 handleNext];
      goto LABEL_13;
    case 8:
      double v7 = [(SHSheetSceneViewController *)self session];
      double v8 = [v7 activityViewController];
      [v8 dismissViewControllerAnimated:0 completion:0];

LABEL_13:
      break;
    case 9:
      char v9 = [(SHSheetSceneViewController *)self currentTest];
      double v10 = [v9 completionHandler];
      v10[2]();

      [(SHSheetSceneViewController *)self setCurrentTest:0];
      break;
    default:
      break;
  }
}

- (id)_hostSheetPresentationController
{
  id v3 = [(SHSheetSceneViewController *)self sheetPresentationController];
  if (!v3)
  {
    id v4 = [(SHSheetSceneViewController *)self session];
    id v5 = [v4 activityViewController];
    id v3 = [v5 _existingPresentationControllerImmediate:1 effective:1];
  }
  return v3;
}

- (void)scene:(id)a3 didReceiveMetadataUpdateAction:(id)a4
{
  objc_msgSend(a4, "metadata", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(SHSheetSceneViewController *)self setRemoteHeaderMetadata:v5];
}

- (void)scene:(id)a3 didReceiveSuggestionAction:(id)a4
{
  id v5 = a4;
  id v7 = [(SHSheetSceneViewController *)self presenter];
  id v6 = [v5 suggestionReason];

  [v7 handleInfoSuggestionPress:v6];
}

- (void)scene:(id)a3 didReceiveDraggingAction:(id)a4
{
  id v5 = a4;
  id v19 = [(SHSheetSceneViewController *)self _hostSheetPresentationController];
  id v6 = [v5 draggingEvent];

  uint64_t v7 = [v6 type];
  switch(v7)
  {
    case 2:
      [v19 _remoteSheetInteractionDraggingDidEnd];
      break;
    case 1:
      [v6 translation];
      double v14 = v13;
      double v16 = v15;
      [v6 velocity];
      objc_msgSend(v19, "_remoteSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", objc_msgSend(v6, "shouldAnimate"), objc_msgSend(v6, "dismissible"), v14, v16, v17, v18);
      break;
    case 0:
      [v6 rubberBandCoefficient];
      double v9 = v8;
      uint64_t v10 = [v6 dismissible];
      [v6 interruptedOffset];
      objc_msgSend(v19, "_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v10, v9, v11, v12);
      break;
  }
}

- (void)updateWithViewModel:(id)a3
{
  id v4 = [(SHSheetSceneViewController *)self session];
  id v5 = [v4 createClientContext];

  id v6 = [(SHSheetSceneViewController *)self scene];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SHSheetSceneViewController_updateWithViewModel___block_invoke;
  v8[3] = &unk_1E5A222B0;
  id v9 = v5;
  id v7 = v5;
  [v6 updateWithChange:v8];
}

uint64_t __50__SHSheetSceneViewController_updateWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSessionContext:*(void *)(a1 + 32)];
}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4 = a3;
  id v6 = [[SHSheetAirDropTransferUpdateAction alloc] initWithAirDropTransferChange:v4];

  id v5 = [(SHSheetSceneViewController *)self scene];
  [v5 sendAction:v6];
}

- (void)reloadMetadata:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:v8 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SHSheetSceneViewController_reloadMetadata___block_invoke;
  v7[3] = &unk_1E5A215C8;
  void v7[4] = self;
  softLinkSFUILinkMetadataSerializationForLocalUseOnly_0(v6, v7);
}

void __45__SHSheetSceneViewController_reloadMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  sf_dispatch_on_main_queue();
}

void __45__SHSheetSceneViewController_reloadMetadata___block_invoke_2(uint64_t a1)
{
  id v2 = [SHSheetMetadataChangedAction alloc];
  id v3 = [*(id *)(a1 + 32) firstObject];
  id v5 = [(SHSheetMetadataChangedAction *)v2 initWithSerializedMetadata:v3];

  id v4 = [*(id *)(a1 + 40) scene];
  [v4 sendAction:v5];
}

- (void)reloadContent
{
  id v4 = [[SHSheetContentReloadAction alloc] initWithActivityUUID:0];
  id v3 = [(SHSheetSceneViewController *)self scene];
  [v3 sendAction:v4];
}

- (void)reloadActivity:(id)a3
{
  id v4 = a3;
  id v5 = [SHSheetContentReloadAction alloc];
  id v6 = [v4 activityUUID];

  double v8 = [(SHSheetContentReloadAction *)v5 initWithActivityUUID:v6];
  id v7 = [(SHSheetSceneViewController *)self scene];
  [v7 sendAction:v8];
}

- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4
{
  id v6 = a4;
  id v7 = [a3 activityUUID];
  id v10 = +[SHSheetPulsingEvent startPulsingEventWithActivityUUID:v7 localizedTitle:v6];

  double v8 = [[SHSheetPulsingAction alloc] initWithEvent:v10];
  id v9 = [(SHSheetSceneViewController *)self scene];
  [v9 sendAction:v8];
}

- (void)stopPulsingActivity:(id)a3
{
  id v4 = [a3 activityUUID];
  id v7 = +[SHSheetPulsingEvent stopPulsingEventWithActivityUUID:v4];

  id v5 = [[SHSheetPulsingAction alloc] initWithEvent:v7];
  id v6 = [(SHSheetSceneViewController *)self scene];
  [v6 sendAction:v5];
}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(SHSheetSceneViewController *)self currentTest];

  if (v10)
  {
    share_sheet_log();
    double v11 = (SHSheetScrollingTest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR)) {
      -[SHSheetSceneViewController runScrollingTestWithName:type:completionHandler:]((uint64_t)v8, self, &v11->super);
    }
  }
  else
  {
    double v11 = [[SHSheetScrollingTest alloc] initWithName:v8 type:a4 completionHandler:v9];
    [(SHSheetSceneViewController *)self setCurrentTest:v11];
    double v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v8;
      __int16 v17 = 2048;
      int64_t v18 = a4;
      _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "sending scrolling test action with test name:%@ type:%ld", (uint8_t *)&v15, 0x16u);
    }

    double v13 = [[SHSheetScrollingTestAction alloc] initWithTest:v11];
    double v14 = [(SHSheetSceneViewController *)self scene];
    [v14 sendAction:v13];
  }
}

- (SHSheetSession)session
{
  return self->_session;
}

- (SHSheetContentPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SHSheetContentPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (SHSheetScene)scene
{
  return self->_scene;
}

- (UIView)sceneView
{
  return self->_sceneView;
}

- (LPLinkMetadata)remoteHeaderMetadata
{
  return self->_remoteHeaderMetadata;
}

- (void)setRemoteHeaderMetadata:(id)a3
{
}

- (SHSheetScrollingTest)currentTest
{
  return self->_currentTest;
}

- (void)setCurrentTest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTest, 0);
  objc_storeStrong((id *)&self->_remoteHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)runScrollingTestWithName:(uint64_t)a1 type:(void *)a2 completionHandler:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 currentTest];
  id v6 = [v5 name];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "request to run scrolling test with name:%@ failed because we already have a running test:%@", (uint8_t *)&v7, 0x16u);
}

@end