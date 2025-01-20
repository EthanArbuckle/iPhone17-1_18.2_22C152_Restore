@interface SBHWidgetIntroductionFeatureIntroductionItem
- (BOOL)deviceTypeSupportModalWidgetIntroduction;
- (BOOL)forceShowWidgetIntroduction;
- (BOOL)isVerticalWidgetIntroduction;
- (BOOL)overrideShouldAddDefaultWidgetsToHomeScreenWhenNeeded;
- (BOOL)shouldDeferAlertsAtLocations:(unint64_t)a3;
- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3;
- (BOOL)shouldDisplayWidgetIntroduction;
- (BOOL)shouldPauseUserInteractionAtLocations:(unint64_t)a3;
- (BOOL)shouldSetupFeatureIntroductionAtLocations:(unint64_t)a3;
- (BOOL)stopUpdatingDefaultWidgetsBumpedIconRecord;
- (BOOL)widgetDiscoverabilityIsRunning;
- (BOOL)widgetDiscoverabilityServerSideEnabled;
- (NSDictionary)originalIconStateBeforeWidgetDiscoverability;
- (NSMutableArray)defaultWidgetsBumpedIconUsageRanking;
- (NSMutableArray)defaultWidgetsIconsRestoringRecordOriginalIndex;
- (NSMutableDictionary)defaultWidgetsIconsRestoringRecord;
- (NSString)featureIntroductionIdentifier;
- (SBHIconManager)iconManager;
- (SBHTrialClientManager)trialClientManager;
- (SBHWidgetIntroductionFeatureIntroductionItem)init;
- (SBHomeScreenDefaults)homeScreenDefaults;
- (SBModalWidgetIntroductionViewController)modalIntroductionViewController;
- (id)defaultWidgetsIconsRestoringRecordKeyForIcon:(id)a3;
- (id)prewarmModalWidgetIntroductionWithCompletion:(id)a3;
- (void)animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion:(id)a3 dismissCompletion:(id)a4;
- (void)displayFeatureIntroductionAtLocations:(unint64_t)a3 presentCompletion:(id)a4 dismissCompletion:(id)a5;
- (void)immediateDownloadSpringBoardHomeTrialSettingsWhenNeeded;
- (void)prewarmModalWidgetIntroductionViewController;
- (void)resetDefaultWidgetsUndoInfo;
- (void)setDefaultWidgetsBumpedIconUsageRanking:(id)a3;
- (void)setDefaultWidgetsIconsRestoringRecord:(id)a3;
- (void)setDefaultWidgetsIconsRestoringRecordOriginalIndex:(id)a3;
- (void)setForceShowWidgetIntroduction:(BOOL)a3;
- (void)setIconManager:(id)a3;
- (void)setIsVerticalWidgetIntroduction:(BOOL)a3;
- (void)setModalIntroductionViewController:(id)a3;
- (void)setOriginalIconStateBeforeWidgetDiscoverability:(id)a3;
- (void)setShouldDisplayWidgetIntroduction:(BOOL)a3;
- (void)setStopUpdatingDefaultWidgetsBumpedIconRecord:(BOOL)a3;
- (void)setTrialClientManager:(id)a3;
- (void)setWidgetDiscoverabilityIsRunning:(BOOL)a3;
- (void)setupFeatureIntroductionAtLocations:(unint64_t)a3;
@end

@implementation SBHWidgetIntroductionFeatureIntroductionItem

- (SBHWidgetIntroductionFeatureIntroductionItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBHWidgetIntroductionFeatureIntroductionItem;
  v2 = [(SBHWidgetIntroductionFeatureIntroductionItem *)&v6 init];
  if (v2)
  {
    v3 = (SBHomeScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60A0]);
    homeScreenDefaults = v2->_homeScreenDefaults;
    v2->_homeScreenDefaults = v3;
  }
  return v2;
}

- (void)resetDefaultWidgetsUndoInfo
{
  if (!self->_defaultWidgetsIconsRestoringRecordOriginalIndex)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    defaultWidgetsIconsRestoringRecordOriginalIndex = self->_defaultWidgetsIconsRestoringRecordOriginalIndex;
    self->_defaultWidgetsIconsRestoringRecordOriginalIndex = v3;
  }
  v5 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self defaultWidgetsIconsRestoringRecordOriginalIndex];
  [v5 removeAllObjects];

  if (!self->_defaultWidgetsBumpedIconUsageRanking)
  {
    objc_super v6 = [MEMORY[0x1E4F1CA48] array];
    defaultWidgetsBumpedIconUsageRanking = self->_defaultWidgetsBumpedIconUsageRanking;
    self->_defaultWidgetsBumpedIconUsageRanking = v6;
  }
  v8 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self defaultWidgetsBumpedIconUsageRanking];
  [v8 removeAllObjects];

  if (!self->_defaultWidgetsIconsRestoringRecord)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    defaultWidgetsIconsRestoringRecord = self->_defaultWidgetsIconsRestoringRecord;
    self->_defaultWidgetsIconsRestoringRecord = v9;
  }
  v11 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self defaultWidgetsIconsRestoringRecord];
  [v11 removeAllObjects];

  v12 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Clear onboarding widgets record", v13, 2u);
  }
}

- (id)defaultWidgetsIconsRestoringRecordKeyForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__19;
  v18 = __Block_byref_object_dispose__19;
  id v19 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self defaultWidgetsIconsRestoringRecord];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __93__SBHWidgetIntroductionFeatureIntroductionItem_defaultWidgetsIconsRestoringRecordKeyForIcon___block_invoke;
    v11[3] = &unk_1E6AB3A78;
    id v12 = v4;
    v13 = &v14;
    [v5 enumerateKeysAndObjectsUsingBlock:v11];

    objc_super v6 = v12;
  }
  else
  {
    v7 = v15;
    id v8 = v4;
    objc_super v6 = (void *)v7[5];
    v7[5] = (uint64_t)v8;
  }

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __93__SBHWidgetIntroductionFeatureIntroductionItem_defaultWidgetsIconsRestoringRecordKeyForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  v7 = [v10 uniqueIdentifier];
  id v8 = [*(id *)(a1 + 32) uniqueIdentifier];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)deviceTypeSupportModalWidgetIntroduction
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  BOOL v4 = (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1 && SBHScreenTypeForCurrentDevice() != 0;
  v5 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    BOOL v8 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Device type support onboarding = %ld", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (void)immediateDownloadSpringBoardHomeTrialSettingsWhenNeeded
{
  if ([(SBHWidgetIntroductionFeatureIntroductionItem *)self deviceTypeSupportModalWidgetIntroduction])
  {
    trialClientManager = self->_trialClientManager;
    if (!trialClientManager)
    {
      BOOL v4 = objc_alloc_init(SBHTrialClientManager);
      v5 = self->_trialClientManager;
      self->_trialClientManager = v4;

      trialClientManager = self->_trialClientManager;
    }
    [(SBHTrialClientManager *)trialClientManager immediatelyFetchSpringBoardHomeNamespace];
  }
}

- (BOOL)widgetDiscoverabilityServerSideEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self trialClientManager];

  if (v3)
  {
    BOOL v4 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self trialClientManager];
    unsigned int v5 = [v4 widgetDiscoverabilityGoSwitchEnabled];
  }
  else
  {
    unsigned int v5 = 0;
  }
  objc_super v6 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Onboarding server side enabled = %ld", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (id)prewarmModalWidgetIntroductionWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = SBLogWidgetDiscoverabilityMigration();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Prewarm modal widget discoverability introduction vc", v15, 2u);
  }

  objc_super v6 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self modalIntroductionViewController];

  if (!v6)
  {
    int v7 = objc_alloc_init(SBModalWidgetIntroductionViewController);
    [(SBHWidgetIntroductionFeatureIntroductionItem *)self setModalIntroductionViewController:v7];

    int v8 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self modalIntroductionViewController];
    [v8 setModalPresentationStyle:5];
  }
  uint64_t v9 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self modalIntroductionViewController];
  [v9 appendDismissCompletion:v4];

  uint64_t v10 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self iconManager];
  v11 = [v10 captureHomeScreenOnboardingSnapshot];
  [v10 prepareModalWidgetIntroductionWidgetViewSnapshots];
  id v12 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self modalIntroductionViewController];
  [v12 setHomeScreenPreview:v11];

  v13 = self->_modalIntroductionViewController;
  return v13;
}

- (void)animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion:(id)a3 dismissCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self iconManager];
  if ([(SBHWidgetIntroductionFeatureIntroductionItem *)self deviceTypeSupportModalWidgetIntroduction]&& ([(SBHWidgetIntroductionFeatureIntroductionItem *)self modalIntroductionViewController], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    if (v7)
    {
      uint64_t v10 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self modalIntroductionViewController];
      [v10 appendDismissCompletion:v7];
    }
    v11 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Present modal widget discoverabilit introduction", buf, 2u);
    }

    id v12 = [v8 rootViewController];
    v13 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self modalIntroductionViewController];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __143__SBHWidgetIntroductionFeatureIntroductionItem_animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion_dismissCompletion___block_invoke;
    v14[3] = &unk_1E6AAC8E8;
    v14[4] = self;
    id v15 = v6;
    [v12 presentViewController:v13 animated:0 completion:v14];
  }
  else
  {
    [(SBHWidgetIntroductionFeatureIntroductionItem *)self setModalIntroductionViewController:0];
    [v8 invalidateOnboardingWidgetPreviewViewControllers];
    [v8 enableUserInteractionForWidgetDiscoverability];
  }
}

uint64_t __143__SBHWidgetIntroductionFeatureIntroductionItem_animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion_dismissCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) modalIntroductionViewController];
  [v2 displayPreviewAndButton];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)prewarmModalWidgetIntroductionViewController
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __92__SBHWidgetIntroductionFeatureIntroductionItem_prewarmModalWidgetIntroductionViewController__block_invoke;
  v3[3] = &unk_1E6AAC810;
  v3[4] = self;
  id v2 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self prewarmModalWidgetIntroductionWithCompletion:v3];
}

void __92__SBHWidgetIntroductionFeatureIntroductionItem_prewarmModalWidgetIntroductionViewController__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) iconManager];
  [v2 displayPronouncedContainerViewVisibility:1 isVertical:0];
  [*(id *)(a1 + 32) setModalIntroductionViewController:0];
  [v2 invalidateOnboardingWidgetPreviewViewControllers];
}

- (BOOL)overrideShouldAddDefaultWidgetsToHomeScreenWhenNeeded
{
  uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }
  unsigned int v5 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self homeScreenDefaults];
  char v6 = [v5 enableModalWidgetDiscoverabilityForTesting];

  return v6;
}

- (NSString)featureIntroductionIdentifier
{
  return (NSString *)@"SBFeatureIntroductionLocationNone";
}

- (BOOL)shouldSetupFeatureIntroductionAtLocations:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((a3 & 2) == 0) {
    return 0;
  }
  uint64_t v4 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self homeScreenDefaults];
  int v5 = [v4 shouldAddDefaultWidgetsToHomeScreen];

  BOOL v6 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self overrideShouldAddDefaultWidgetsToHomeScreenWhenNeeded];
  BOOL v7 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self widgetDiscoverabilityIsRunning];
  if (v5)
  {
    int v8 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    char v10 = (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1 || v6;
    if ((v10 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else if (!v6)
  {
LABEL_7:
    v11 = SBLogWidgetDiscoverabilityMigration();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109632;
      v13[1] = v5;
      __int16 v14 = 1024;
      int v15 = 0;
      __int16 v16 = 1024;
      BOOL v17 = v7;
      _os_log_impl(&dword_1D7F0A000, v11, OS_LOG_TYPE_DEFAULT, "Should setup feature introduction userDefault = %d, testingOverride = %d, isRunning = %d.", (uint8_t *)v13, 0x14u);
    }

    return 0;
  }
  return !v7;
}

- (void)setupFeatureIntroductionAtLocations:(unint64_t)a3
{
  [(SBHWidgetIntroductionFeatureIntroductionItem *)self setWidgetDiscoverabilityIsRunning:1];
  id v5 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self iconManager];
  if ([v5 addDefaultWidgetsToHomeScreen])
  {
    [v5 scrollToDefaultWidgets];
    [(SBHWidgetIntroductionFeatureIntroductionItem *)self setShouldDisplayWidgetIntroduction:1];
  }
  else
  {
    [(SBHWidgetIntroductionFeatureIntroductionItem *)self setWidgetDiscoverabilityIsRunning:0];
    [(SBHWidgetIntroductionFeatureIntroductionItem *)self setShouldDisplayWidgetIntroduction:0];
    uint64_t v4 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self homeScreenDefaults];
    [v4 setShouldAddDefaultWidgetsToHomeScreen:0];
  }
}

- (BOOL)shouldDisplayFeatureIntroductionAtLocations:(unint64_t)a3
{
  return (a3 & 4) != 0
      && [(SBHWidgetIntroductionFeatureIntroductionItem *)self shouldDisplayWidgetIntroduction];
}

- (void)displayFeatureIntroductionAtLocations:(unint64_t)a3 presentCompletion:(id)a4 dismissCompletion:(id)a5
{
  char v6 = a3;
  v13 = (void (**)(void))a4;
  int v8 = (void (**)(void))a5;
  if ((v6 & 0xC) != 0)
  {
    uint64_t v9 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self iconManager];
    char v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v11 = [v10 userInterfaceIdiom];

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(v9, "displayPronouncedContainerViewVisibility:isVertical:", -[SBHWidgetIntroductionFeatureIntroductionItem forceShowWidgetIntroduction](self, "forceShowWidgetIntroduction"), -[SBHWidgetIntroductionFeatureIntroductionItem isVerticalWidgetIntroduction](self, "isVerticalWidgetIntroduction"));
      [v9 enableUserInteractionForWidgetDiscoverability];
      if (v13) {
        v13[2](v13);
      }
      if (v8) {
        v8[2](v8);
      }
    }
    else
    {
      [(SBHWidgetIntroductionFeatureIntroductionItem *)self prewarmModalWidgetIntroductionViewController];
      [(SBHWidgetIntroductionFeatureIntroductionItem *)self animateModalWidgetDiscoverabilityIntroductionWhenNeededWithPresentCompletion:v13 dismissCompletion:v8];
      id v12 = [(SBHWidgetIntroductionFeatureIntroductionItem *)self homeScreenDefaults];
      [v12 setShouldAddDefaultWidgetsToHomeScreen:0];
    }
  }
}

- (BOOL)shouldPauseUserInteractionAtLocations:(unint64_t)a3
{
  return (a3 >> 2) & 1;
}

- (BOOL)shouldDeferAlertsAtLocations:(unint64_t)a3
{
  return (a3 >> 2) & 1;
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void)setIconManager:(id)a3
{
}

- (NSMutableArray)defaultWidgetsIconsRestoringRecordOriginalIndex
{
  return self->_defaultWidgetsIconsRestoringRecordOriginalIndex;
}

- (void)setDefaultWidgetsIconsRestoringRecordOriginalIndex:(id)a3
{
}

- (NSMutableArray)defaultWidgetsBumpedIconUsageRanking
{
  return self->_defaultWidgetsBumpedIconUsageRanking;
}

- (void)setDefaultWidgetsBumpedIconUsageRanking:(id)a3
{
}

- (NSMutableDictionary)defaultWidgetsIconsRestoringRecord
{
  return self->_defaultWidgetsIconsRestoringRecord;
}

- (void)setDefaultWidgetsIconsRestoringRecord:(id)a3
{
}

- (BOOL)stopUpdatingDefaultWidgetsBumpedIconRecord
{
  return self->_stopUpdatingDefaultWidgetsBumpedIconRecord;
}

- (void)setStopUpdatingDefaultWidgetsBumpedIconRecord:(BOOL)a3
{
  self->_stopUpdatingDefaultWidgetsBumpedIconRecord = a3;
}

- (BOOL)isVerticalWidgetIntroduction
{
  return self->_isVerticalWidgetIntroduction;
}

- (void)setIsVerticalWidgetIntroduction:(BOOL)a3
{
  self->_isVerticalWidgetIntroduction = a3;
}

- (BOOL)forceShowWidgetIntroduction
{
  return self->_forceShowWidgetIntroduction;
}

- (void)setForceShowWidgetIntroduction:(BOOL)a3
{
  self->_forceShowWidgetIntroduction = a3;
}

- (SBModalWidgetIntroductionViewController)modalIntroductionViewController
{
  return self->_modalIntroductionViewController;
}

- (void)setModalIntroductionViewController:(id)a3
{
}

- (NSDictionary)originalIconStateBeforeWidgetDiscoverability
{
  return self->_originalIconStateBeforeWidgetDiscoverability;
}

- (void)setOriginalIconStateBeforeWidgetDiscoverability:(id)a3
{
}

- (SBHTrialClientManager)trialClientManager
{
  return self->_trialClientManager;
}

- (void)setTrialClientManager:(id)a3
{
}

- (SBHomeScreenDefaults)homeScreenDefaults
{
  return self->_homeScreenDefaults;
}

- (BOOL)shouldDisplayWidgetIntroduction
{
  return self->_shouldDisplayWidgetIntroduction;
}

- (void)setShouldDisplayWidgetIntroduction:(BOOL)a3
{
  self->_shouldDisplayWidgetIntroduction = a3;
}

- (BOOL)widgetDiscoverabilityIsRunning
{
  return self->_widgetDiscoverabilityIsRunning;
}

- (void)setWidgetDiscoverabilityIsRunning:(BOOL)a3
{
  self->_widgetDiscoverabilityIsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenDefaults, 0);
  objc_storeStrong((id *)&self->_trialClientManager, 0);
  objc_storeStrong((id *)&self->_originalIconStateBeforeWidgetDiscoverability, 0);
  objc_storeStrong((id *)&self->_modalIntroductionViewController, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsIconsRestoringRecord, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsBumpedIconUsageRanking, 0);
  objc_storeStrong((id *)&self->_defaultWidgetsIconsRestoringRecordOriginalIndex, 0);
  objc_destroyWeak((id *)&self->_iconManager);
}

@end