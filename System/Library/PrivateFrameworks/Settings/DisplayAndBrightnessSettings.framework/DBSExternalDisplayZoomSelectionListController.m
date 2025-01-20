@interface DBSExternalDisplayZoomSelectionListController
- (SBSConnectedDisplayInfo)externalDisplayInfo;
- (SBSDisplayModeSettings)selectedDisplayModeSettings;
- (SBSExternalDisplayService)displayService;
- (id)supportedDisplayZoomOptions;
- (unint64_t)displayZoomTableViewCellCurrentlySelectedDisplayZoomOption:(id)a3;
- (void)displayZoomTableViewCell:(id)a3 userDidTapOnDisplayZoomOption:(unint64_t)a4;
- (void)setDisplayService:(id)a3;
- (void)setExternalDisplayInfo:(id)a3;
- (void)setSelectedDisplayModeSettings:(id)a3;
- (void)supportedDisplayZoomOptions;
- (void)updateNavigationButtonStateWithCurrentState;
- (void)userDidTapDone:(id)a3;
@end

@implementation DBSExternalDisplayZoomSelectionListController

- (void)updateNavigationButtonStateWithCurrentState
{
  id v4 = [(DBSExternalDisplayZoomSelectionListController *)self externalDisplayInfo];
  v3 = [v4 displayModeSettings];
  [(DBSExternalDisplayZoomSelectionListController *)self _updateNavigationButtonStateWithNewDisplayModeSettings:v3];
}

- (void)userDidTapDone:(id)a3
{
  id v4 = a3;
  v5 = [(DBSExternalDisplayZoomSelectionListController *)self selectedDisplayModeSettings];
  v6 = [(DBSExternalDisplayZoomSelectionListController *)self externalDisplayInfo];
  v7 = [v6 displayModeSettings];

  if ([v7 isEqual:v5])
  {
    v8 = [(DBSExternalDisplayZoomSelectionListController *)self navigationController];
    [v8 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = [(DBSExternalDisplayZoomSelectionListController *)self displayService];
    v10 = [(DBSExternalDisplayZoomSelectionListController *)self externalDisplayInfo];
    v11 = [v10 identifier];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke;
    v12[3] = &unk_264C7AA08;
    objc_copyWeak(&v13, &location);
    [v9 setSettings:v5 forDisplay:v11 options:2 completionHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = DBSLogForCategory(1uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_168;
  block[3] = &unk_264C7A940;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
}

void __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_168(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 displayZoomDidUpdate];
}

- (id)supportedDisplayZoomOptions
{
  id v3 = objc_opt_new();
  id v4 = [(DBSExternalDisplayZoomSelectionListController *)self externalDisplayInfo];
  char v5 = [v4 supportedScales];

  if (v5)
  {
    [v3 addObject:&unk_26E9390E0];
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:&unk_26E9390F8];
  if ((v5 & 4) != 0) {
LABEL_4:
  }
    [v3 addObject:&unk_26E939110];
LABEL_5:
  id v6 = DBSLogForCategory(1uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    [(DBSExternalDisplayZoomSelectionListController *)self supportedDisplayZoomOptions];
  }

  return v3;
}

- (void)displayZoomTableViewCell:(id)a3 userDidTapOnDisplayZoomOption:(unint64_t)a4
{
  if (a4 <= 2)
  {
    uint64_t v6 = qword_235DA5BD0[a4];
    id v7 = objc_alloc(MEMORY[0x263F793D0]);
    v8 = [(DBSExternalDisplayZoomSelectionListController *)self externalDisplayInfo];
    v9 = [v8 displayModeSettings];
    id v10 = (id)[v7 initWithSettings:v9];

    [v10 setScale:v6];
    [(DBSExternalDisplayZoomSelectionListController *)self _updateNavigationButtonStateWithNewDisplayModeSettings:v10];
  }
}

- (unint64_t)displayZoomTableViewCellCurrentlySelectedDisplayZoomOption:(id)a3
{
  id v3 = [(DBSExternalDisplayZoomSelectionListController *)self selectedDisplayModeSettings];
  unint64_t v4 = [v3 scale];

  if (v4 > 2) {
    return 0;
  }
  else {
    return qword_235DA5BD0[v4];
  }
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  return self->_externalDisplayInfo;
}

- (void)setExternalDisplayInfo:(id)a3
{
}

- (SBSExternalDisplayService)displayService
{
  return self->_displayService;
}

- (void)setDisplayService:(id)a3
{
}

- (SBSDisplayModeSettings)selectedDisplayModeSettings
{
  return self->_selectedDisplayModeSettings;
}

- (void)setSelectedDisplayModeSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDisplayModeSettings, 0);
  objc_storeStrong((id *)&self->_displayService, 0);
  objc_storeStrong((id *)&self->_externalDisplayInfo, 0);
}

void __64__DBSExternalDisplayZoomSelectionListController_userDidTapDone___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235D7B000, a2, OS_LOG_TYPE_ERROR, "Failed to modify external display zoom: %@", (uint8_t *)&v2, 0xCu);
}

- (void)supportedDisplayZoomOptions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 displayService];
  id v7 = [a1 externalDisplayInfo];
  int v8 = 138412802;
  v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_235D7B000, a3, OS_LOG_TYPE_DEBUG, "displayService %@, displayInfo %@, supported display zooms %@", (uint8_t *)&v8, 0x20u);
}

@end