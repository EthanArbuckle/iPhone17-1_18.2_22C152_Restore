@interface STIntroductionController
- (BOOL)allowParentalControls;
- (BOOL)askForRecoveryAppleID;
- (BOOL)forceParentalControls;
- (BOOL)isChildOrNotSignedIntoiCloud;
- (BOOL)isModalPresentation;
- (BOOL)showCommunicationSafetyPane;
- (BOOL)skipAppLimitsPane;
- (BOOL)updateExistingSettings;
- (NSNumber)childAge;
- (NSNumber)dsid;
- (NSString)altDSID;
- (NSString)childName;
- (NSURL)userURI;
- (STIntroductionController)initWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5 updateExistingSettings:(BOOL)a6 restrictionsDataSource:(id)a7;
- (STIntroductionController)initWithNewUserRootViewModelCoordinator:(id)a3;
- (STIntroductionViewModel)introductionModel;
- (UINavigationController)navigationController;
- (UIViewController)initialViewController;
- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)settingsPresetViewModel;
- (id)_viewControllerFollowingViewController:(id)a3;
- (id)completionBlock;
- (void)_endIntroductionFlowWithEnablingScreenTime;
- (void)_endIntroductionFlowWithoutEnablingScreenTime;
- (void)_viewControllerCompleted:(id)a3;
- (void)presentOverViewController:(id)a3;
- (void)setAllowParentalControls:(BOOL)a3;
- (void)setAskForRecoveryAppleID:(BOOL)a3;
- (void)setChildName:(id)a3;
- (void)setChildOrNotSignedIntoiCloud:(BOOL)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setForceParentalControls:(BOOL)a3;
- (void)setIsModalPresentation:(BOOL)a3;
- (void)setNavigationController:(id)a3;
- (void)setSettingsPresetViewModel:(id)a3;
- (void)setShowCommunicationSafetyPane:(BOOL)a3;
- (void)setSkipAppLimitsPane:(BOOL)a3;
- (void)setUpdateExistingSettings:(BOOL)a3;
- (void)setUserURI:(id)a3;
@end

@implementation STIntroductionController

- (STIntroductionController)initWithDSID:(id)a3 childAge:(id)a4 childName:(id)a5 updateExistingSettings:(BOOL)a6 restrictionsDataSource:(id)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v29.receiver = self;
  v29.super_class = (Class)STIntroductionController;
  id v16 = a7;
  v17 = [(STIntroductionController *)&v29 init];
  objc_storeStrong((id *)&v17->_dsid, a3);
  objc_storeStrong((id *)&v17->_childAge, a4);
  objc_storeStrong((id *)&v17->_childName, a5);
  v17->_updateExistingSettings = v8;
  uint64_t v18 = objc_opt_new();
  introductionModel = v17->_introductionModel;
  v17->_introductionModel = (STIntroductionViewModel *)v18;

  v20 = objc_opt_new();
  BOOL v21 = !v8;
  if (v21)
  {
    v26 = [_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel alloc];
    uint64_t v27 = -[SettingsPresetViewModel initWithDsid:childAge:isInitialSetup:restrictionsToPresetMappingViewModel:restrictionsDataSource:agePresetsAnalytics:](v26, "initWithDsid:childAge:isInitialSetup:restrictionsToPresetMappingViewModel:restrictionsDataSource:agePresetsAnalytics:", v13, v14, v21, 0, v16, v20, v29.receiver, v29.super_class);

    settingsPresetViewModel = (STRestrictionsToPresetMappingViewModel *)v17->_settingsPresetViewModel;
    v17->_settingsPresetViewModel = (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *)v27;
  }
  else
  {
    v22 = [STRestrictionsToPresetMappingViewModel alloc];
    settingsPresetViewModel = -[STRestrictionsToPresetMappingViewModel initWithRestrictionsDataSource:](v22, "initWithRestrictionsDataSource:", v16, v29.receiver, v29.super_class);
    v24 = [[_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel alloc] initWithDsid:v13 childAge:v14 isInitialSetup:v21 restrictionsToPresetMappingViewModel:settingsPresetViewModel restrictionsDataSource:v16 agePresetsAnalytics:v20];

    v25 = v17->_settingsPresetViewModel;
    v17->_settingsPresetViewModel = v24;
  }
  [(SettingsPresetViewModel *)v17->_settingsPresetViewModel loadWithCompletionHandler:&__block_literal_global_12];

  return v17;
}

- (STIntroductionController)initWithNewUserRootViewModelCoordinator:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewModel];
  v6 = [v5 me];
  v7 = [v6 dsid];
  BOOL v8 = [v6 givenName];
  v9 = [(STIntroductionController *)self initWithDSID:v7 childAge:0 childName:v8 updateExistingSettings:0 restrictionsDataSource:v4];

  BOOL v10 = 1;
  v9->_allowParentalControls = 1;
  v9->_forceParentalControls = [v5 forceParentalControls];
  v9->_askForRecoveryAppleID = [v6 needsRecoveryAppleID];
  if (([v6 isChild] & 1) == 0) {
    BOOL v10 = [v6 type] == 0;
  }
  v9->_childOrNotSignedIntoiCloud = v10;
  if ([v6 isRemoteUser]) {
    v9->_showCommunicationSafetyPane = 1;
  }

  return v9;
}

- (void)presentOverViewController:(id)a3
{
  id v4 = a3;
  [(STIntroductionController *)self setIsModalPresentation:1];
  v5 = [(STIntroductionController *)self _viewControllerFollowingViewController:0];
  v6 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v5];
  v7 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (!v8) {
    [v6 setSupportedInterfaceOrientations:2];
  }
  [v6 setModalPresentationStyle:2];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__STIntroductionController_presentOverViewController___block_invoke;
  v10[3] = &unk_264767078;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v4 presentViewController:v9 animated:1 completion:v10];
}

uint64_t __54__STIntroductionController_presentOverViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNavigationController:*(void *)(a1 + 40)];
}

- (UIViewController)initialViewController
{
  return (UIViewController *)[(STIntroductionController *)self _viewControllerFollowingViewController:0];
}

- (void)_viewControllerCompleted:(id)a3
{
  id v10 = a3;
  id v4 = -[STIntroductionController _viewControllerFollowingViewController:](self, "_viewControllerFollowingViewController:");
  if (v4)
  {
    v5 = [v10 navigationController];
    [v5 pushViewController:v4 animated:1];
  }
  else
  {
    if ([(STIntroductionController *)self isModalPresentation])
    {
      v6 = [v10 navigationController];
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
    v7 = [(STIntroductionController *)self completionBlock];

    if (v7)
    {
      uint64_t v8 = [(STIntroductionController *)self completionBlock];
      id v9 = [(STIntroductionController *)self introductionModel];
      ((void (**)(void, uint64_t, void *))v8)[2](v8, 1, v9);
    }
    [(STIntroductionController *)self setNavigationController:0];
  }
}

- (void)_endIntroductionFlowWithoutEnablingScreenTime
{
  if ([(STIntroductionController *)self isModalPresentation])
  {
    v3 = [(STIntroductionController *)self navigationController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
  id v4 = [(STIntroductionController *)self completionBlock];

  if (v4)
  {
    v5 = [(STIntroductionController *)self completionBlock];
    v5[2](v5, 0, 0);
  }

  [(STIntroductionController *)self setNavigationController:0];
}

- (void)_endIntroductionFlowWithEnablingScreenTime
{
  v3 = [(STIntroductionController *)self completionBlock];

  if (v3)
  {
    id v4 = [(STIntroductionController *)self completionBlock];
    v5 = [(STIntroductionController *)self introductionModel];
    ((void (**)(void, uint64_t, void *))v4)[2](v4, 1, v5);
  }

  [(STIntroductionController *)self setNavigationController:0];
}

- (id)_viewControllerFollowingViewController:(id)a3
{
  id v4 = a3;
  uint64_t v34 = 0;
  v35 = (id *)&v34;
  uint64_t v36 = 0x3042000000;
  v37 = __Block_byref_object_copy__2;
  v38 = __Block_byref_object_dispose__2;
  id v39 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__STIntroductionController__viewControllerFollowingViewController___block_invoke;
  aBlock[3] = &unk_264767D70;
  aBlock[4] = self;
  aBlock[5] = &v34;
  v5 = _Block_copy(aBlock);
  if (!v4)
  {
    if (![(STIntroductionController *)self updateExistingSettings])
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_2;
      v32[3] = &unk_264766F30;
      v32[4] = self;
      uint64_t v8 = _Block_copy(v32);
      id v9 = [(STIntroductionController *)self childName];
      id v11 = +[STIntroductionViewControllersFactory makeIntroductionWelcomeViewControllerWithChildName:v9 forceParentalControls:[(STIntroductionController *)self forceParentalControls] continueHandler:v5 endHandler:v8];
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v8 = [(STIntroductionController *)self introductionModel];
    id v9 = [(STIntroductionController *)self settingsPresetViewModel];
    id v10 = [(STIntroductionController *)self childName];
    id v11 = +[STIntroductionViewControllersFactory makeIntroPresetsViewControllerWithIntroductionModel:v8 settingsPresetViewModel:v9 name:v10 updateExistingSettings:[(STIntroductionController *)self updateExistingSettings] continueHandler:v5];

LABEL_12:
LABEL_13:

    goto LABEL_26;
  }
  if (+[STIntroductionViewControllersFactory isOfTypeWelcomeViewController:v4])
  {
    if ([(STIntroductionController *)self allowParentalControls])
    {
      if ([(STIntroductionController *)self forceParentalControls]) {
        goto LABEL_10;
      }
      id v14 = [STIntroIdentityViewController alloc];
      uint64_t v8 = [(STIntroductionController *)self introductionModel];
      uint64_t v15 = [(STIntroIdentityViewController *)v14 initWithIntroductionModel:v8 continueHandler:v5];
LABEL_18:
      id v11 = (id)v15;
      goto LABEL_13;
    }
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (+[STIntroductionViewControllersFactory isOfTypePresetsViewController:v4])
    {
      if ([(STIntroductionController *)self showCommunicationSafetyPane])
      {
        uint64_t v8 = [(STIntroductionController *)self introductionModel];
        v12 = [(STIntroductionController *)self childName];
        uint64_t v13 = +[STIntroductionViewControllersFactory makeIntroductionCommunicationSafetyViewControllerWithIntroductionModel:v8 childName:v12 continueHandler:v5];
LABEL_33:
        id v11 = (id)v13;
        goto LABEL_34;
      }
      if ([(STIntroductionController *)self updateExistingSettings]) {
        goto LABEL_25;
      }
    }
    else
    {
      if (+[STIntroductionViewControllersFactory isOfTypeCommunicationSafetyViewController:v4])
      {
        objc_initWeak(&location, self);
        uint64_t v25 = MEMORY[0x263EF8330];
        uint64_t v26 = 3221225472;
        uint64_t v27 = __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_3;
        v28 = &unk_264767D98;
        objc_copyWeak(&v30, &location);
        id v29 = v5;
        id v16 = _Block_copy(&v25);
        v17 = [STEyeReliefIntroHowItWorksViewController alloc];
        id v11 = -[STEyeReliefIntroHowItWorksViewController initForChecklistFlow:withCompletionHandler:](v17, "initForChecklistFlow:withCompletionHandler:", 1, v16, v25, v26, v27, v28);

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (+[STIntroductionViewControllersFactory isOfTypeAppAndWebsiteActivityViewController:v4])
        {
          v19 = [(STIntroductionController *)self introductionModel];
          v20 = [v19 appAndWebsiteActivityEnabled];
          int v21 = [v20 BOOLValue];

          if (v21)
          {
            uint64_t v8 = [(STIntroductionController *)self introductionModel];
            uint64_t v15 = +[STIntroductionViewControllersFactory makeIntroductionDowntimeViewControllerWithIntroductionModel:v8 continueHandler:v5];
            goto LABEL_18;
          }
        }
        else if (+[STIntroductionViewControllersFactory isOfTypeDowntimeViewController:v4])
        {
          if (![(STIntroductionController *)self skipAppLimitsPane])
          {
            v24 = [STIntroAppLimitsViewController alloc];
            uint64_t v8 = [(STIntroductionController *)self introductionModel];
            uint64_t v15 = [(STIntroAppLimitsViewController *)v24 initWithIntroductionModel:v8 continueHandler:v5];
            goto LABEL_18;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
        }
        uint64_t v8 = [(STIntroductionController *)self introductionModel];
        BOOL v22 = [(STIntroductionController *)self askForRecoveryAppleID];
        v12 = [(STIntroductionController *)self altDSID];
        v23 = [(STIntroductionController *)self userURI];
        id v11 = +[STIntroductionViewControllersFactory makeIntroductionPasscodeViewControllerWithIntroductionModel:v8 askForRecoveryForAppleID:v22 altDSID:v12 userURI:v23 isChildOrNotSignedIntoiCloud:[(STIntroductionController *)self isChildOrNotSignedIntoiCloud] continueHandler:v5];

LABEL_34:
        goto LABEL_13;
      }
      if ([(STIntroductionController *)self updateExistingSettings]) {
        goto LABEL_25;
      }
    }
    uint64_t v8 = [(STIntroductionController *)self introductionModel];
    v12 = [(STIntroductionController *)self childName];
    uint64_t v13 = +[STIntroductionViewControllersFactory makeIntroductionAppAndWebsiteActivityViewControllerWithIntroductionModel:v8 childName:v12 continueHandler:v5];
    goto LABEL_33;
  }
  v6 = [(STIntroductionController *)self introductionModel];
  int v7 = [v6 deviceForChild];

  if (v7) {
    goto LABEL_10;
  }
LABEL_25:
  id v11 = 0;
LABEL_26:
  objc_storeWeak(v35 + 5, v11);

  _Block_object_dispose(&v34, 8);
  objc_destroyWeak(&v39);

  return v11;
}

void __67__STIntroductionController__viewControllerFollowingViewController___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v1 _viewControllerCompleted:WeakRetained];
}

uint64_t __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endIntroductionFlowWithoutEnablingScreenTime];
}

uint64_t __67__STIntroductionController__viewControllerFollowingViewController___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = [WeakRetained introductionModel];
    [v5 setScreenDistanceEnabled:v3];
  }
  v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v6();
}

- (BOOL)updateExistingSettings
{
  return self->_updateExistingSettings;
}

- (void)setUpdateExistingSettings:(BOOL)a3
{
  self->_updateExistingSettings = a3;
}

- (BOOL)skipAppLimitsPane
{
  return self->_skipAppLimitsPane;
}

- (void)setSkipAppLimitsPane:(BOOL)a3
{
  self->_skipAppLimitsPane = a3;
}

- (BOOL)showCommunicationSafetyPane
{
  return self->_showCommunicationSafetyPane;
}

- (void)setShowCommunicationSafetyPane:(BOOL)a3
{
  self->_showCommunicationSafetyPane = a3;
}

- (BOOL)allowParentalControls
{
  return self->_allowParentalControls;
}

- (void)setAllowParentalControls:(BOOL)a3
{
  self->_allowParentalControls = a3;
}

- (BOOL)forceParentalControls
{
  return self->_forceParentalControls;
}

- (void)setForceParentalControls:(BOOL)a3
{
  self->_forceParentalControls = a3;
}

- (BOOL)askForRecoveryAppleID
{
  return self->_askForRecoveryAppleID;
}

- (void)setAskForRecoveryAppleID:(BOOL)a3
{
  self->_askForRecoveryAppleID = a3;
}

- (BOOL)isChildOrNotSignedIntoiCloud
{
  return self->_childOrNotSignedIntoiCloud;
}

- (void)setChildOrNotSignedIntoiCloud:(BOOL)a3
{
  self->_childOrNotSignedIntoiCloud = a3;
}

- (NSString)childName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setChildName:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSURL)userURI
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserURI:(id)a3
{
}

- (NSNumber)childAge
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (STIntroductionViewModel)introductionModel
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isModalPresentation
{
  return self->_isModalPresentation;
}

- (void)setIsModalPresentation:(BOOL)a3
{
  self->_isModalPresentation = a3;
}

- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)settingsPresetViewModel
{
  return self->_settingsPresetViewModel;
}

- (void)setSettingsPresetViewModel:(id)a3
{
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_settingsPresetViewModel, 0);
  objc_storeStrong((id *)&self->_introductionModel, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_childAge, 0);
  objc_storeStrong((id *)&self->_userURI, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_childName, 0);
}

@end