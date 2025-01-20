@interface SHSheetRemoteSceneViewController
+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing;
- (BOOL)didInstallHostingView;
- (LPLinkMetadata)remoteHeaderMetadata;
- (SHSheetContentPresenter)presenter;
- (SHSheetRemoteScene)scene;
- (SHSheetRemoteSceneViewController)initWithSession:(id)a3;
- (SHSheetSession)session;
- (UIViewController)sceneViewController;
- (id)_localCustomizationForRemoteProxy:(id)a3;
- (int64_t)_hostProcessType;
- (void)_applyValueFromRemoteCustomization:(id)a3 toLocalCustomization:(id)a4;
- (void)_handleCollaborationOptions;
- (void)_handleLocalOptions;
- (void)_handleOptions;
- (void)dealloc;
- (void)didUpdateAirDropTransferWithChange:(id)a3;
- (void)installSceneHostingView;
- (void)reloadActivity:(id)a3;
- (void)reloadContent;
- (void)reloadMetadata:(id)a3;
- (void)scene:(id)a3 didReceiveAction:(id)a4;
- (void)scene:(id)a3 didReceiveCollaborationOptionUpdateAction:(id)a4;
- (void)scene:(id)a3 didReceiveMetadataUpdateAction:(id)a4;
- (void)scene:(id)a3 didReceiveOptionUpdateAction:(id)a4;
- (void)scene:(id)a3 didReceiveSuggestionAction:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)setDidInstallHostingView:(BOOL)a3;
- (void)setPresenter:(id)a3;
- (void)setRemoteHeaderMetadata:(id)a3;
- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4;
- (void)stopPulsingActivity:(id)a3;
- (void)updateWithViewModel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation SHSheetRemoteSceneViewController

+ (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 1;
}

- (SHSheetRemoteSceneViewController)initWithSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHSheetRemoteSceneViewController;
  v6 = [(SHSheetRemoteSceneViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    uint64_t v8 = [v5 remoteScene];
    scene = v7->_scene;
    v7->_scene = (SHSheetRemoteScene *)v8;

    [(SHSheetRemoteScene *)v7->_scene setDelegate:v7];
    [(SHSheetRemoteSceneViewController *)v7 installSceneHostingView];
  }

  return v7;
}

- (void)installSceneHostingView
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (![(SHSheetRemoteSceneViewController *)self didInstallHostingView])
  {
    v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = self;
      _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "remote scene view controller %@ installing hosting view", buf, 0xCu);
    }

    [(SHSheetRemoteSceneViewController *)self setDidInstallHostingView:1];
    v4 = [(SHSheetRemoteSceneViewController *)self scene];
    id v5 = [v4 hostingController];
    v6 = [v5 sceneViewController];

    v23 = v6;
    [(SHSheetRemoteSceneViewController *)self addChildViewController:v6];
    v7 = [v6 view];
    uint64_t v8 = [(SHSheetRemoteSceneViewController *)self view];
    [v8 addSubview:v7];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    v22 = [v7 leadingAnchor];
    v21 = [v8 leadingAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v19 = [v7 trailingAnchor];
    v18 = [v8 trailingAnchor];
    v16 = [v19 constraintEqualToAnchor:v18];
    v24[1] = v16;
    v9 = [v7 topAnchor];
    v10 = [v8 topAnchor];
    objc_super v11 = [v9 constraintEqualToAnchor:v10];
    v24[2] = v11;
    v12 = [v7 bottomAnchor];
    v13 = [v8 bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v24[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v17 activateConstraints:v15];

    [v23 didMoveToParentViewController:self];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SHSheetRemoteSceneViewController;
  [(SHSheetRemoteSceneViewController *)&v5 viewDidLoad];
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: viewDidLoad", v4, 2u);
  }

  [(SHSheetRemoteSceneViewController *)self installSceneHostingView];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)SHSheetRemoteSceneViewController;
  [(SHSheetRemoteSceneViewController *)&v7 viewDidLayoutSubviews];
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: viewDidLayoutSubviews", buf, 2u);
  }

  v4 = [(SHSheetRemoteSceneViewController *)self scene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SHSheetRemoteSceneViewController_viewDidLayoutSubviews__block_invoke;
  v5[3] = &unk_1E5A21558;
  v5[4] = self;
  [v4 updateWithChange:v5];
}

void __57__SHSheetRemoteSceneViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setPresentationStyle:", objc_msgSend(v2, "effectivePresentationStyle"));
}

- (void)viewIsAppearing:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SHSheetRemoteSceneViewController;
  [(SHSheetRemoteSceneViewController *)&v9 viewIsAppearing:a3];
  v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: viewIsAppearing", buf, 2u);
  }

  int64_t v5 = [(SHSheetRemoteSceneViewController *)self _hostProcessType];
  v6 = [(SHSheetRemoteSceneViewController *)self scene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__SHSheetRemoteSceneViewController_viewIsAppearing___block_invoke;
  v7[3] = &__block_descriptor_40_e37_v16__0___SHSheetRemoteMutableScene__8l;
  v7[4] = v5;
  [v6 updateWithChange:v7];
}

uint64_t __52__SHSheetRemoteSceneViewController_viewIsAppearing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHostProcessType:*(void *)(a1 + 32)];
}

- (int64_t)_hostProcessType
{
  id v3 = [(SHSheetRemoteSceneViewController *)self viewIfLoaded];
  v4 = [v3 window];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(SHSheetRemoteSceneViewController *)self viewIfLoaded];
  v6 = [v5 window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: sceneDidBecomeActive", v5, 2u);
  }

  [(SHSheetRemoteSceneViewController *)self installSceneHostingView];
}

- (void)dealloc
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController: dealloc", buf, 2u);
  }

  v4 = [(SHSheetRemoteSceneViewController *)self scene];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)SHSheetRemoteSceneViewController;
  [(SHSheetRemoteSceneViewController *)&v5 dealloc];
}

- (void)scene:(id)a3 didReceiveAction:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = [v5 type];
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "did receive action with type:%ld", (uint8_t *)&v9, 0xCu);
  }

  switch([v5 type])
  {
    case 0:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
      [v7 handleCustomHeaderButton];
      goto LABEL_15;
    case 1:
      if (_ShareSheetPlatformWantsRemoteOptions())
      {
        [(SHSheetRemoteSceneViewController *)self _handleOptions];
      }
      else
      {
        objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
        [v7 handleOptions];
LABEL_15:
      }
LABEL_16:

      return;
    case 2:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
      [v7 handleCollaborationOptions];
      goto LABEL_15;
    case 3:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
      [v7 didSelectCollaborativeAction];
      goto LABEL_15;
    case 4:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
      [v7 didSelectSendCopyAction];
      goto LABEL_15;
    case 5:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
      [v7 handleClose];
      goto LABEL_15;
    case 6:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
      [v7 handleActionsEdit];
      goto LABEL_15;
    case 7:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
      [v7 handleNext];
      goto LABEL_15;
    case 8:
      objc_super v7 = [(SHSheetRemoteSceneViewController *)self session];
      uint64_t v8 = [v7 activityViewController];
      [v8 dismissViewControllerAnimated:0 completion:0];

      goto LABEL_15;
    default:
      goto LABEL_16;
  }
}

- (void)scene:(id)a3 didReceiveMetadataUpdateAction:(id)a4
{
  id v5 = a4;
  v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received metadata update", v8, 2u);
  }

  objc_super v7 = [v5 metadata];

  [(SHSheetRemoteSceneViewController *)self setRemoteHeaderMetadata:v7];
}

- (void)scene:(id)a3 didReceiveSuggestionAction:(id)a4
{
  id v5 = a4;
  v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received suggestion action", v9, 2u);
  }

  objc_super v7 = [(SHSheetRemoteSceneViewController *)self presenter];
  uint64_t v8 = [v5 suggestionReason];

  [v7 handleInfoSuggestionPress:v8];
}

- (void)scene:(id)a3 didReceiveOptionUpdateAction:(id)a4
{
  id v5 = a4;
  v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received option update", v10, 2u);
  }

  objc_super v7 = [v5 customization];

  uint64_t v8 = [(SHSheetRemoteSceneViewController *)self _localCustomizationForRemoteProxy:v7];
  if (v8)
  {
    [(SHSheetRemoteSceneViewController *)self _applyValueFromRemoteCustomization:v7 toLocalCustomization:v8];
  }
  else
  {
    int v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SHSheetRemoteSceneViewController scene:didReceiveOptionUpdateAction:](v9);
    }
  }
}

- (void)scene:(id)a3 didReceiveCollaborationOptionUpdateAction:(id)a4
{
  id v5 = a4;
  v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController received collaboration options update", v9, 2u);
  }

  objc_super v7 = [(SHSheetRemoteSceneViewController *)self session];
  uint64_t v8 = [v7 collaborationItem];
  [v8 setShareOptions:v5];
}

- (id)_localCustomizationForRemoteProxy:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SHSheetRemoteSceneViewController *)self session];
  v6 = [v5 customizationGroups];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  uint64_t v23 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v8 = *(void *)v30;
    v24 = v7;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v7);
        }
        uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v11 = [v10 customizations];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v25 + 1) + 8 * j);
              v17 = [v16 identifier];
              v18 = [v4 identifier];
              char v19 = [v17 isEqualToString:v18];

              if (v19)
              {
                id v20 = v16;

                id v7 = v24;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v7 = v24;
        uint64_t v8 = v22;
      }
      id v20 = 0;
      uint64_t v23 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
  else
  {
    id v20 = 0;
  }
LABEL_19:

  return v20;
}

- (void)_applyValueFromRemoteCustomization:(id)a3 toLocalCustomization:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = v7;
    -[NSObject _setValue:](v8, "_setValue:", [v6 value]);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = v7;
      -[NSObject _setSelectedOptionIndex:](v8, "_setSelectedOptionIndex:", [v6 selectedOptionIndex]);
    }
    else
    {
      uint64_t v8 = share_sheet_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SHSheetRemoteSceneViewController _applyValueFromRemoteCustomization:toLocalCustomization:]((uint64_t)v6, (uint64_t)v7, v8);
      }
    }
    goto LABEL_9;
  }
  id v9 = v7;
  uint64_t v10 = [v6 text];
  [v9 _setText:v10];

LABEL_10:
  [(SHSheetRemoteSceneViewController *)self _handleOptions];
}

- (void)_handleOptions
{
  id v3 = [(SHSheetRemoteSceneViewController *)self session];
  int v4 = [v3 supportsCollaboration];

  if (v4)
  {
    [(SHSheetRemoteSceneViewController *)self _handleCollaborationOptions];
  }
  else
  {
    [(SHSheetRemoteSceneViewController *)self _handleLocalOptions];
  }
}

- (void)_handleLocalOptions
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController sending options to remote", buf, 2u);
  }

  int v4 = [(SHSheetRemoteSceneViewController *)self session];
  id v5 = [v4 customizationGroups];

  id v6 = [(SHSheetRemoteSceneViewController *)self scene];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SHSheetRemoteSceneViewController__handleLocalOptions__block_invoke;
  v8[3] = &unk_1E5A21558;
  id v9 = v5;
  id v7 = v5;
  [v6 updateWithChange:v8];
}

uint64_t __55__SHSheetRemoteSceneViewController__handleLocalOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCustomizationGroups:*(void *)(a1 + 32)];
}

- (void)_handleCollaborationOptions
{
  id v3 = [(SHSheetRemoteSceneViewController *)self session];
  int v4 = [v3 collaborationItem];
  id v5 = [v4 shareOptions];

  id v6 = [(SHSheetRemoteSceneViewController *)self scene];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__SHSheetRemoteSceneViewController__handleCollaborationOptions__block_invoke;
  v8[3] = &unk_1E5A21558;
  id v9 = v5;
  id v7 = v5;
  [v6 updateWithChange:v8];
}

uint64_t __63__SHSheetRemoteSceneViewController__handleCollaborationOptions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setCollaborationOptions:*(void *)(a1 + 32)];
}

- (void)updateWithViewModel:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "SHSheetRemoteSceneViewController updating remote with view model: %@", buf, 0xCu);
  }

  id v6 = [(SHSheetRemoteSceneViewController *)self session];
  id v7 = [v6 createClientContext];

  uint64_t v8 = [(SHSheetRemoteSceneViewController *)self scene];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SHSheetRemoteSceneViewController_updateWithViewModel___block_invoke;
  v10[3] = &unk_1E5A21558;
  id v11 = v7;
  id v9 = v7;
  [v8 updateWithChange:v10];
}

uint64_t __56__SHSheetRemoteSceneViewController_updateWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSessionContext:*(void *)(a1 + 32)];
}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  id v4 = a3;
  id v6 = [[SHSheetAirDropTransferUpdateAction alloc] initWithAirDropTransferChange:v4];

  id v5 = [(SHSheetRemoteSceneViewController *)self scene];
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
  v7[2] = __51__SHSheetRemoteSceneViewController_reloadMetadata___block_invoke;
  v7[3] = &unk_1E5A215C8;
  v7[4] = self;
  softLinkSFUILinkMetadataSerializationForLocalUseOnly(v6, v7);
}

void __51__SHSheetRemoteSceneViewController_reloadMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v2 = v3;
  sf_dispatch_on_main_queue();
}

void __51__SHSheetRemoteSceneViewController_reloadMetadata___block_invoke_2(uint64_t a1)
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
  id v3 = [(SHSheetRemoteSceneViewController *)self scene];
  [v3 sendAction:v4];
}

- (void)reloadActivity:(id)a3
{
  id v4 = a3;
  id v5 = [SHSheetContentReloadAction alloc];
  id v6 = [v4 activityUUID];

  uint64_t v8 = [(SHSheetContentReloadAction *)v5 initWithActivityUUID:v6];
  id v7 = [(SHSheetRemoteSceneViewController *)self scene];
  [v7 sendAction:v8];
}

- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4
{
  id v6 = a4;
  id v7 = [a3 activityUUID];
  id v10 = +[SHSheetPulsingEvent startPulsingEventWithActivityUUID:v7 localizedTitle:v6];

  uint64_t v8 = [[SHSheetPulsingAction alloc] initWithEvent:v10];
  id v9 = [(SHSheetRemoteSceneViewController *)self scene];
  [v9 sendAction:v8];
}

- (void)stopPulsingActivity:(id)a3
{
  id v4 = [a3 activityUUID];
  id v7 = +[SHSheetPulsingEvent stopPulsingEventWithActivityUUID:v4];

  id v5 = [[SHSheetPulsingAction alloc] initWithEvent:v7];
  id v6 = [(SHSheetRemoteSceneViewController *)self scene];
  [v6 sendAction:v5];
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

- (SHSheetRemoteScene)scene
{
  return self->_scene;
}

- (UIViewController)sceneViewController
{
  return self->_sceneViewController;
}

- (LPLinkMetadata)remoteHeaderMetadata
{
  return self->_remoteHeaderMetadata;
}

- (void)setRemoteHeaderMetadata:(id)a3
{
}

- (BOOL)didInstallHostingView
{
  return self->_didInstallHostingView;
}

- (void)setDidInstallHostingView:(BOOL)a3
{
  self->_didInstallHostingView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)scene:(os_log_t)log didReceiveOptionUpdateAction:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Could not find local counterpart to remote customization", v1, 2u);
}

- (void)_applyValueFromRemoteCustomization:(os_log_t)log toLocalCustomization:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Could not apply value from remote customization %@ to local customization %@", (uint8_t *)&v3, 0x16u);
}

@end