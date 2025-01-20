@interface PBFModalRootViewController
+ (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout;
+ (void)prewarmTopButtonLayout;
- (BOOL)_isPhotosEntryPoint;
- (BOOL)ambientEditingCollectionViewControllerDidPressDone:(id)a3;
- (BOOL)posterRackCollectionViewControllerDidPressDone:(id)a3;
- (NSString)description;
- (PBFAmbientEditingCollectionViewController)ambientEditingController;
- (PBFModalRootViewController)initWithScene:(id)a3;
- (PBFModalRootViewController)initWithScene:(id)a3 dataStore:(id)a4 behaviorAssertionProvider:(id)a5;
- (PBFPosterGalleryPreviewViewController)galleryController;
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3;
- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForFocusPosterSelectionViewController:(SEL)a3;
- (UIScene)_scene;
- (id)_actionHandlersForScene:(id)a3;
- (id)_posterLimitExceededAlertWithButtonActionHandler:(id)a3;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)_settingsDiffActionsForScene:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_createLegacyMigrationHelperWithConfiguration:(id)a3;
- (void)_displayViewControllerAsSheet:(id)a3;
- (void)_galleryEditingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)_handleNotificationForwardAction:(id)a3;
- (void)_handleSheetDidDismissWithResponse:(id)a3;
- (void)_handleSheetWillDismissWithResponse:(id)a3;
- (void)_logEditWithEditingViewController:(id)a3 posterUUID:(id)a4 lastModifiedDate:(id)a5;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_performLegacyMigration;
- (void)_presentEditingForNewPosterFromConfiguration:(id)a3;
- (void)_presentEditingForPosterConfiguration:(id)a3;
- (void)_presentEditingForPosterConfiguration:(id)a3 sessionInfo:(id)a4;
- (void)_presentEditingSceneViewController:(id)a3;
- (void)_presentGallery;
- (void)_presentLegacyAddNewAlert;
- (void)_presentLegacyMigrationAlert;
- (void)_presentLegacyMigrationFailedAlert;
- (void)_presentPartialMigrationPrompt;
- (void)_reload;
- (void)_setScene:(id)a3;
- (void)_setupGalleryDataProviderIfNeeded;
- (void)_standaloneEditingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)dataStoreDidTearDown:(id)a3;
- (void)dealloc;
- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5;
- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7;
- (void)editingSceneViewControllerDidFinalize:(id)a3;
- (void)focusPosterSelectionViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)focusPosterSelectionViewController:(id)a3 willDismissWithResponse:(id)a4;
- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5;
- (void)invalidate;
- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4;
- (void)posterRackCollectionViewControllerDidPressCancel:(id)a3;
- (void)posterSelectionViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)posterSelectionViewController:(id)a3 willDismissWithResponse:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setAmbientEditingController:(id)a3;
- (void)setGalleryController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PBFModalRootViewController

- (PBFModalRootViewController)initWithScene:(id)a3
{
  id v4 = a3;
  v5 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
  v6 = [v5 dataStore];
  v7 = +[PBFPosterExtensionDataStoreXPCServiceGlue sharedInstance];
  v8 = [(PBFModalRootViewController *)self initWithScene:v4 dataStore:v6 behaviorAssertionProvider:v7];

  return v8;
}

- (PBFModalRootViewController)initWithScene:(id)a3 dataStore:(id)a4 behaviorAssertionProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v9;
  NSClassFromString(&cfstr_Uiscene.isa);
  if (!v12)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:]();
    }
LABEL_27:
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321E310);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:UISceneClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:]();
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321E374);
  }

  id v13 = v10;
  NSClassFromString(&cfstr_Pbfposterexten.isa);
  if (!v13)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321E3D8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PBFPosterExtensionDataStoreClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321E43CLL);
  }

  id v14 = v11;
  if (!v14)
  {
    v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321E4A0);
  }
  v15 = v14;
  if (([v14 conformsToProtocol:&unk_1F2AC71E8] & 1) == 0)
  {
    v23 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(PBFBehaviorAssertionProviding)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController initWithScene:dataStore:behaviorAssertionProvider:]();
    }
    goto LABEL_27;
  }

  v28.receiver = self;
  v28.super_class = (Class)PBFModalRootViewController;
  v16 = [(PBFModalRootViewController *)&v28 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_parentScene, a3);
    parentScene = v17->_parentScene;
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [(UIScene *)parentScene _registerSceneComponent:v17 forKey:v20];

    objc_storeStrong((id *)&v17->_dataStore, a4);
    objc_storeStrong((id *)&v17->_behaviorAssertionProvider, a5);
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v17 selector:sel_dataStoreDidTearDown_ name:PBFPosterExtensionDataStoreDidTearDownNotification object:0];
  }
  return v17;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    [(UIViewController *)self dismissPresentedViewControllersAnimated:0 dismissHandler:0 completion:0];
    id v7 = [(PBFModalRootViewController *)self ambientEditingController];
    [v7 invalidate];
    [(PBFModalRootViewController *)self setAmbientEditingController:0];
    parentScene = self->_parentScene;
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(UIScene *)parentScene _unregisterSceneComponentForKey:v5];

    v6 = self->_parentScene;
    self->_parentScene = 0;
  }
}

+ (void)prewarmTopButtonLayout
{
  v3 = [NSString stringWithUTF8String:"+[PBFModalRootViewController prewarmTopButtonLayout]"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PBFModalRootViewController_prewarmTopButtonLayout__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a1;
  PBFDispatchAsyncWithString(v3, QOS_CLASS_UTILITY, v4);
}

uint64_t __52__PBFModalRootViewController_prewarmTopButtonLayout__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _topButtonLayout];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PBFModalRootViewController;
  [(PBFModalRootViewController *)&v5 viewDidLoad];
  v3 = [(PBFModalRootViewController *)self view];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v70.receiver = self;
  v70.super_class = (Class)PBFModalRootViewController;
  [(PBFModalRootViewController *)&v70 viewDidAppear:a3];
  if (!self->_didAppearOnce)
  {
    if (!self->_snapshotterInUseAssertion)
    {
      id v4 = [(PBFBehaviorAssertionProviding *)self->_behaviorAssertionProvider acquireSnapshotterInUseAssertionWithReason:@"modal presentation"];
      snapshotterInUseAssertion = self->_snapshotterInUseAssertion;
      self->_snapshotterInUseAssertion = v4;
    }
    self->_didAppearOnce = 1;
    v6 = [(UIScene *)self->_parentScene _FBSScene];
    id v7 = [v6 settings];
    v8 = [v7 otherSettings];

    id v9 = [v8 objectForSetting:2606278161];
    entryPoint = self->_entryPoint;
    self->_entryPoint = v9;

    int v11 = [v8 BOOLForSetting:2606278162];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [(PBFModalRootViewController *)self _setupGalleryDataProviderIfNeeded];
      id v12 = [(PBFModalRootViewController *)self view];
      id v13 = [v12 window];
      id v14 = [v13 _rootSheetPresentationController];
      [v14 _setShouldScaleDownBehindDescendantSheets:0];

      v15 = self->_entryPoint;
      v16 = [PBFFocusPosterSelectionViewController alloc];
      v17 = [(PRUISModalEntryPoint *)v15 activityUUID];
      v18 = [(PRUISModalEntryPoint *)v15 activityIdentifier];
      uint64_t v19 = [(PBFFocusPosterSelectionViewController *)v16 initWithActivityUUID:v17 activityIdentifier:v18 galleryDataProvider:self->_galleryDataProvider dataStore:self->_dataStore];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            [(PBFPosterExtensionDataStore *)self->_dataStore addObserver:self];
            [(PBFPosterExtensionDataStore *)self->_dataStore checkForGalleryUpdatesAndPrewarmSnapshots];
            [(PBFModalRootViewController *)self _presentGallery];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              v25 = self->_entryPoint;
              switch([(PRUISModalEntryPoint *)v25 editingType])
              {
                case 0:
                  v26 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
                  v27 = [v26 activeConfiguration];
                  [(PBFModalRootViewController *)self _presentEditingForPosterConfiguration:v27];

                  break;
                case 1:
                  [(PBFModalRootViewController *)self _presentEditingForNewPosterFromConfiguration:v25];
                  break;
                case 2:
                  id v28 = objc_alloc(MEMORY[0x1E4F92638]);
                  v29 = [(PRUISModalEntryPoint *)v25 serverPosterPath];
                  v30 = (void *)[v28 _initWithPath:v29];
                  [(PBFModalRootViewController *)self _presentEditingForPosterConfiguration:v30];
                  goto LABEL_23;
                case 3:
                  id v31 = objc_alloc(MEMORY[0x1E4F92638]);
                  v29 = [(PRUISModalEntryPoint *)v25 serverPosterPath];
                  v30 = (void *)[v31 _initWithPath:v29];
                  v32 = [(PRUISModalEntryPoint *)v25 updateSessionInfo];
                  [(PBFModalRootViewController *)self _presentEditingForPosterConfiguration:v30 sessionInfo:v32];

LABEL_23:
                  break;
                default:
                  break;
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              v33 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
              v34 = [v33 activeConfiguration];

              if (objc_msgSend(v34, "pbf_isLegacy"))
              {
                [(PBFModalRootViewController *)self _presentLegacyAddNewAlert];
              }
              else
              {
                v35 = objc_alloc_init(PBFActivePosterConfigurationFilter);
                v36 = objc_opt_class();
                if (v36)
                {
                  [v36 _topButtonLayout];
                }
                else
                {
                  long long v68 = 0u;
                  long long v69 = 0u;
                  long long v66 = 0u;
                  long long v67 = 0u;
                }
                v37 = +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherWithFilter:v35 delegate:self topButtonLayout:&v66];
                [(PBFModalRootViewController *)self presentViewController:v37 animated:1 completion:0];
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              v38 = self->_entryPoint;
              id v39 = objc_alloc(MEMORY[0x1E4F92638]);
              v40 = [(PRUISModalEntryPoint *)v38 serverPosterPath];
              v41 = (void *)[v39 _initWithPath:v40];

              if (objc_msgSend(v41, "pbf_isLegacy"))
              {
                [(PBFModalRootViewController *)self _presentLegacyAddNewAlert];
              }
              else
              {
                v42 = [[PBFSinglePosterConfigurationFilter alloc] initWithConfiguration:v41];
                v43 = objc_opt_class();
                if (v43)
                {
                  [v43 _topButtonLayout];
                }
                else
                {
                  long long v64 = 0u;
                  long long v65 = 0u;
                  long long v62 = 0u;
                  long long v63 = 0u;
                }
                v44 = +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherWithFilter:v42 delegate:self topButtonLayout:&v62];
                [(PBFModalRootViewController *)self presentViewController:v44 animated:1 completion:0];
              }
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              v45 = objc_alloc_init(PBFAmbientEditingCollectionViewController);
              [(PBFAmbientEditingCollectionViewController *)v45 setAmbientEditingDelegate:self];
              [(PBFAmbientEditingCollectionViewController *)v45 setModalTransitionStyle:2];
              [(PBFModalRootViewController *)self presentViewController:v45 animated:1 completion:0];
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
            {
              v46 = self->_entryPoint;
              id v47 = objc_alloc(MEMORY[0x1E4F92638]);
              v48 = [(PRUISModalEntryPoint *)v46 serverPosterPath];
              v49 = (void *)[v47 _initWithPath:v48];

              id v50 = [[PBFAmbientEditingCollectionViewController alloc] init:v49];
              [v50 setAmbientEditingDelegate:self];
              if (v11)
              {
                v51 = [(UIScene *)self->_parentScene _FBSScene];
                v52 = [v51 settings];
                v53 = [v52 displayConfiguration];

                [v50 setDisplayConfiguration:v53];
              }
              objc_msgSend(v50, "setModalTransitionStyle:", 2, v62, v63, v64, v65, v66, v67, v68, v69);
              objc_storeStrong((id *)&self->_displayConfigurationObserver, v50);
              BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
              uint64_t v55 = [(PRUISModalEntryPoint *)v46 transitionOverlayRenderId];
              uint64_t v56 = [(PRUISModalEntryPoint *)v46 transitionOverlayContextId];
              if (!IsReduceMotionEnabled && v55)
              {
                uint64_t v57 = v56;
                if (v56)
                {
                  id v58 = objc_alloc_init(MEMORY[0x1E4FB2248]);
                  v59 = [v58 portalLayer];
                  [v59 setSourceContextId:v57];

                  v60 = [v58 portalLayer];
                  [v60 setSourceLayerRenderId:v55];

                  v61 = [v58 portalLayer];
                  [v61 setAllowsGroupOpacity:1];

                  [v58 setName:@"com.apple.PosterBoard.transitionOverlayView"];
                  [v58 setAllowsHitTesting:0];
                  [v58 setMatchesPosition:0];
                  [v58 setMatchesTransform:0];
                  [v50 setTransitionOverlayView:v58];
                }
              }
              [(PBFModalRootViewController *)self setAmbientEditingController:v50];
              [(PBFModalRootViewController *)self presentViewController:v50 animated:IsReduceMotionEnabled completion:0];
            }
          }
          goto LABEL_8;
        }
      }
      [(PBFModalRootViewController *)self _setupGalleryDataProviderIfNeeded];
      v21 = [(PBFModalRootViewController *)self view];
      v22 = [v21 window];
      v23 = [v22 _rootSheetPresentationController];
      [v23 _setShouldScaleDownBehindDescendantSheets:0];

      v15 = self->_entryPoint;
      v24 = [PBFPosterSelectionViewController alloc];
      v17 = [(PRUISModalEntryPoint *)v15 allowedConfigurationUUIDs];
      v18 = [(PRUISModalEntryPoint *)v15 selectedConfigurationUUID];
      uint64_t v19 = [(PBFPosterSelectionViewController *)v24 initWithAllowedConfigurationUUIDs:v17 selectedConfigurationUUID:v18 galleryDataProvider:self->_galleryDataProvider dataStore:self->_dataStore];
    }
    v20 = (void *)v19;

    [v20 setDelegate:self];
    [(PBFModalRootViewController *)self _displayViewControllerAsSheet:v20];

LABEL_8:
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PBFModalRootViewController;
  [(PBFModalRootViewController *)&v5 viewDidDisappear:a3];
  [(BSInvalidatable *)self->_editingSessionInProgressAssertion invalidate];
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PBFModalRootViewController;
  id v7 = a4;
  -[PBFModalRootViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_galleryController);
  objc_msgSend(WeakRetained, "updatePreferredContentSizeForSize:withTransitionCoordinator:", v7, width, height, v9.receiver, v9.super_class);
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_snapshotterInUseAssertion invalidate];
  snapshotterInUseAssertion = self->_snapshotterInUseAssertion;
  self->_snapshotterInUseAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)PBFModalRootViewController;
  [(PBFModalRootViewController *)&v4 dealloc];
}

- (void)_presentEditingForPosterConfiguration:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "pbf_isLegacy"))
    {
      [(PBFModalRootViewController *)self _createLegacyMigrationHelperWithConfiguration:v6];
      if ([(PBFLegacyPosterMigrationHelper *)self->_legacyMigrationHelper canMigrateLegacyPoster])
      {
        [(PBFModalRootViewController *)self _presentLegacyMigrationAlert];
      }
      else if ([(PBFLegacyPosterMigrationHelper *)self->_legacyMigrationHelper canMigrateLegacyLockPoster])
      {
        [(PBFModalRootViewController *)self _presentPartialMigrationPrompt];
      }
      else
      {
        id v28 = [(PBFLegacyPosterMigrationHelper *)self->_legacyMigrationHelper migrationInfo];
        +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:2 migrationInfo:v28 duration:0 errorCode:-1.0];

        legacyMigrationHelper = self->_legacyMigrationHelper;
        self->_legacyMigrationHelper = 0;

        [(PBFModalRootViewController *)self _presentLegacyAddNewAlert];
      }
    }
    else
    {
      id v7 = [v6 _path];
      NSClassFromString(&cfstr_Pfserverposter_0.isa);
      if (!v7)
      {
        v35 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PBFModalRootViewController _presentEditingForPosterConfiguration:](a2);
        }
        [v35 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D321F6E0);
      }
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v36 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PBFModalRootViewController _presentEditingForPosterConfiguration:](a2);
        }
        [v36 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D321F744);
      }

      v8 = [v6 _path];
      v38 = [(PBFPosterExtensionDataStore *)self->_dataStore providerForPath:v8];
      if (v8 && v38)
      {
        objc_super v9 = (void *)MEMORY[0x1E4F924A8];
        id v10 = [v38 identity];
        int v11 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v12 = [v9 extensionInstanceForIdentity:v10 instanceIdentifier:v11];

        id v13 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
        id v14 = [v13 activeConfiguration];

        v15 = [v14 _path];
        v16 = [v15 identity];
        v17 = [v16 posterUUID];
        v18 = [v8 identity];
        uint64_t v19 = [v18 posterUUID];
        v37 = v12;
        v20 = v14;
        LODWORD(v14) = [v17 isEqual:v19];

        if (v14)
        {
          uint64_t v39 = 0;
          v40 = &v39;
          uint64_t v41 = 0x2050000000;
          v21 = (void *)getSBSWallpaperServiceClass_softClass;
          uint64_t v42 = getSBSWallpaperServiceClass_softClass;
          if (!getSBSWallpaperServiceClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v46 = __getSBSWallpaperServiceClass_block_invoke;
            id v47 = &unk_1E6980C98;
            v48 = &v39;
            __getSBSWallpaperServiceClass_block_invoke((uint64_t)&buf);
            v21 = (void *)v40[3];
          }
          v22 = v21;
          _Block_object_dispose(&v39, 8);
          id v23 = objc_alloc_init(v22);
          v24 = v20;
          v25 = v37;
          id v26 = v23;
          if (objc_opt_respondsToSelector()) {
            uint64_t v27 = [v26 posterSignificantEventsCounter];
          }
          else {
            uint64_t v27 = 0;
          }
          uint64_t v43 = *MEMORY[0x1E4F92798];
          v33 = [NSNumber numberWithUnsignedInteger:v27];
          v44 = v33;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];

          v32 = [v24 loadConfiguredPropertiesWithError:0];
          id v31 = [v24 loadConfigurableOptionsWithError:0];
          [v26 invalidate];
        }
        else
        {
          v30 = 0;
          id v31 = 0;
          v32 = 0;
          v24 = v20;
          v25 = v37;
        }
        v34 = (void *)[objc_alloc(MEMORY[0x1E4F925A8]) initWithProvider:v25 contents:v8 configurableOptions:v31 configuredProperties:v32 additionalInfo:v30];
        [(PBFModalRootViewController *)self _presentEditingSceneViewController:v34];
      }
      else
      {
        v25 = PBFLogModal();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v8;
          _os_log_impl(&dword_1D31CE000, v25, OS_LOG_TYPE_DEFAULT, "Could not find extension for path: %@", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
}

- (void)_presentEditingSceneViewController:(id)a3
{
  id v5 = a3;
  [v5 setDelegate:self];
  [v5 addObserver:self];
  [v5 setModalPresentationStyle:0];
  objc_super v4 = [v5 view];
  [v4 setTag:1];

  [(PBFModalRootViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_presentEditingForPosterConfiguration:(id)a3 sessionInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "pbf_isLegacy"))
  {
    [(PBFModalRootViewController *)self _presentLegacyAddNewAlert];
    goto LABEL_10;
  }
  v8 = [v6 _path];
  NSClassFromString(&cfstr_Pfserverposter_0.isa);
  if (!v8)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController _presentEditingForPosterConfiguration:sessionInfo:]();
    }
LABEL_16:
    [v16 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321FA10);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController _presentEditingForPosterConfiguration:sessionInfo:]();
    }
    goto LABEL_16;
  }

  objc_super v9 = [v6 _path];
  uint64_t v10 = [(PBFPosterExtensionDataStore *)self->_dataStore providerForPath:v9];
  int v11 = (void *)v10;
  if (v9 && v10)
  {
    uint64_t v12 = [MEMORY[0x1E4F92328] posterUpdatesForDecoratedSessionInfo:v7];
    dataStore = self->_dataStore;
    id v14 = [v9 serverIdentity];
    v15 = [v14 posterUUID];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke;
    v17[3] = &unk_1E69825C8;
    id v18 = v11;
    uint64_t v19 = self;
    id v20 = v9;
    [(PBFPosterExtensionDataStore *)dataStore createTemporaryPosterConfigurationForPosterMatchingUUID:v15 andApplyUpdates:v12 completion:v17];
  }
LABEL_10:
}

void __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F924A8];
  objc_super v9 = [*(id *)(a1 + 32) identity];
  uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
  int v11 = [v8 extensionInstanceForIdentity:v9 instanceIdentifier:v10];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2;
  block[3] = &unk_1E69825A0;
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(a1 + 48);
  id v18 = v6;
  uint64_t v19 = v12;
  id v20 = v7;
  id v21 = v13;
  id v22 = v11;
  id v14 = v11;
  id v15 = v7;
  id v16 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(id **)(a1 + 40);
  if (v2)
  {
    objc_storeStrong(v3 + 125, v2);
    objc_super v4 = (void *)MEMORY[0x1E4F924D0];
    id v5 = [*(id *)(a1 + 32) incomingPosterConfiguration];
    id v6 = [v5 path];
    id v7 = [v6 contentsURL];
    v8 = [*(id *)(a1 + 56) serverIdentity];
    id v25 = [v4 pathWithContainerURL:v7 identity:v8];

    id v9 = objc_alloc(MEMORY[0x1E4F925A8]);
    uint64_t v10 = *(void *)(a1 + 64);
    int v11 = [*(id *)(a1 + 32) incomingPosterConfiguration];
    uint64_t v12 = [v11 configuredProperties];
    id v13 = (void *)[v9 initWithProvider:v10 contents:v25 configurableOptions:0 configuredProperties:v12];

    [v13 setDelegate:*(void *)(a1 + 40)];
    [v13 addObserver:*(void *)(a1 + 40)];
    [v13 setModalPresentationStyle:0];
    id v14 = [v13 view];
    [v14 setTag:1];

    [*(id *)(a1 + 40) presentViewController:v13 animated:1 completion:0];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F92450] cancel];
    [v3 _handleSheetWillDismissWithResponse:v15];

    id v16 = *(void **)(a1 + 40);
    v17 = [MEMORY[0x1E4F92450] cancel];
    [v16 _handleSheetDidDismissWithResponse:v17];

    id v18 = PBFLogModal();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2_cold_1(a1, v18, v19, v20, v21, v22, v23, v24);
    }
  }
}

- (void)_presentEditingForNewPosterFromConfiguration:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 configuration];
  id v6 = [v4 extensionIdentifier];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [(PBFPosterExtensionDataStore *)self->_dataStore providerForExtensionIdentifier:v6];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F924A8];
    uint64_t v56 = v8;
    int v11 = [v8 identity];
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v55 = [v10 extensionInstanceForIdentity:v11 instanceIdentifier:v12];

    id v13 = (id)*MEMORY[0x1E4F92790];
    id v14 = (void *)MEMORY[0x1E4F925E0];
    id v15 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [v15 UUIDString];
    v17 = [v14 mutableDescriptorWithIdentifier:v16 role:v13];

    id v18 = (void *)MEMORY[0x1E4F924C8];
    uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
    id v58 = v13;
    uint64_t v20 = [v18 incomingConfigurationIdentityWithProvider:v6 role:v13 posterUUID:v19 version:1 supplement:0];

    uint64_t v21 = (void *)MEMORY[0x1E4F924D0];
    uint64_t v22 = [v17 _path];
    uint64_t v23 = [(id)v22 contentsURL];
    v54 = (void *)v20;
    uint64_t v24 = [v21 pathWithContainerURL:v23 identity:v20];

    id v67 = 0;
    LOBYTE(v22) = [v24 ensureContentsURLIsReachableAndReturnError:&v67];
    id v25 = v67;
    if ((v22 & 1) == 0)
    {
      id v26 = PBFLogModal();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:].cold.5();
      }
    }
    uint64_t v27 = [v24 contentsURL];
    id v66 = 0;
    char v28 = [v7 removeItemAtURL:v27 error:&v66];
    id v29 = v66;

    if ((v28 & 1) == 0)
    {
      v30 = PBFLogModal();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:].cold.4();
      }
    }
    uint64_t v57 = v5;
    id v31 = [v5 _path];
    v32 = [v31 contentsURL];
    v33 = [v24 contentsURL];
    id v65 = 0;
    char v34 = [v7 copyItemAtURL:v32 toURL:v33 error:&v65];
    id v35 = v65;

    if ((v34 & 1) == 0)
    {
      v36 = PBFLogModal();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:]();
      }
    }
    v37 = [MEMORY[0x1E4F92680] defaultHomeScreenConfigurationForProvider:v6 role:v58];
    v38 = [v24 supplementURL];
    uint64_t v39 = PFFileProtectionNoneAttributes();
    id v64 = 0;
    int v40 = [v7 createDirectoryAtURL:v38 withIntermediateDirectories:1 attributes:v39 error:&v64];
    id v41 = v64;

    if (v40)
    {
      id v63 = 0;
      char v42 = [MEMORY[0x1E4F926B0] storeHomeScreenConfigurationForPath:v24 homeScreenConfiguration:v37 error:&v63];
      id v43 = v63;

      if (v42)
      {
LABEL_24:
        temporaryDescriptor = self->_temporaryDescriptor;
        self->_temporaryDescriptor = (PRMutablePosterDescriptor *)v17;
        id v47 = v17;

        v45 = v55;
        v48 = (void *)[objc_alloc(MEMORY[0x1E4F925A8]) initWithProvider:v55 contents:v24];
        [v48 setDelegate:self];
        [v48 addObserver:self];
        uint64_t v49 = [v48 view];
        [v49 setTag:1];

        id v50 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v48];
        [v50 setNavigationBarHidden:1 animated:0];
        [v50 setModalPresentationStyle:0];
        BOOL v51 = [(PBFPosterExtensionDataStore *)self->_dataStore canPersistNewPosterConfiguration];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke;
        v59[3] = &unk_1E69825F0;
        BOOL v62 = v51;
        v59[4] = self;
        id v60 = v48;
        id v61 = v50;
        id v52 = v50;
        id v53 = v48;
        [(PBFModalRootViewController *)self presentViewController:v52 animated:1 completion:v59];

        id v9 = v56;
        id v5 = v57;
        goto LABEL_25;
      }
      v44 = PBFLogModal();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:]();
      }
    }
    else
    {
      v44 = PBFLogModal();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        -[PBFModalRootViewController _presentEditingForNewPosterFromConfiguration:]();
      }
      id v43 = v41;
    }

    goto LABEL_24;
  }
  v45 = PBFLogModal();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v69 = v6;
    _os_log_impl(&dword_1D31CE000, v45, OS_LOG_TYPE_DEFAULT, "Could not find extension with id: %@", buf, 0xCu);
  }
LABEL_25:
}

void __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke_2;
    v4[3] = &unk_1E69808C0;
    v2 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    v3 = [v2 _posterLimitExceededAlertWithButtonActionHandler:v4];
    [*(id *)(a1 + 48) presentViewController:v3 animated:1 completion:0];
  }
}

uint64_t __75__PBFModalRootViewController__presentEditingForNewPosterFromConfiguration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWithAction:0];
}

- (void)posterRackCollectionViewControllerDidPressCancel:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F92450], "cancel", a3);
  [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__PBFModalRootViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke;
  v6[3] = &unk_1E69808E8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PBFModalRootViewController *)self dismissViewControllerAnimated:1 completion:v6];
}

uint64_t __79__PBFModalRootViewController_posterRackCollectionViewControllerDidPressCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:*(void *)(a1 + 40)];
}

- (BOOL)posterRackCollectionViewControllerDidPressDone:(id)a3
{
  BOOL v4 = [(PBFModalRootViewController *)self _isPhotosEntryPoint];
  id v5 = [MEMORY[0x1E4F92450] done];
  [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v5];
  if (v4)
  {
    [(PBFModalRootViewController *)self _handleSheetDidDismissWithResponse:v5];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__PBFModalRootViewController_posterRackCollectionViewControllerDidPressDone___block_invoke;
    v7[3] = &unk_1E69808E8;
    v7[4] = self;
    id v8 = v5;
    id v5 = v5;
    [(PBFModalRootViewController *)self dismissViewControllerAnimated:1 completion:v7];
  }
  return 1;
}

uint64_t __77__PBFModalRootViewController_posterRackCollectionViewControllerDidPressDone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:*(void *)(a1 + 40)];
}

- (void)editingSceneViewControllerDidFinalize:(id)a3
{
  [(BSInvalidatable *)self->_editingSessionInProgressAssertion invalidate];
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForEditingSceneViewController:(SEL)a3
{
  result = (PREditingSceneViewControllerTopButtonLayout *)objc_opt_class();
  if (result)
  {
    return (PREditingSceneViewControllerTopButtonLayout *)[(PREditingSceneViewControllerTopButtonLayout *)result _topButtonLayout];
  }
  else
  {
    retstr->trailingTopButtonFrame.origin = 0u;
    retstr->trailingTopButtonFrame.size = 0u;
    retstr->leadingTopButtonFrame.origin = 0u;
    retstr->leadingTopButtonFrame.size = 0u;
  }
  return result;
}

- (void)editingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  [v18 addObserver:self];
  id v15 = [v18 view];
  uint64_t v16 = [v15 tag];

  if (v16 == 1)
  {
    [(PBFModalRootViewController *)self _standaloneEditingSceneViewController:v18 userDidDismissWithAction:a4 updatedConfiguration:v12 updatedConfiguredProperties:v13 completion:v14];
    goto LABEL_5;
  }
  if (!v16)
  {
    [(PBFModalRootViewController *)self _galleryEditingSceneViewController:v18 userDidDismissWithAction:a4 updatedConfiguration:v12 updatedConfiguredProperties:v13 completion:v14];
LABEL_5:

    return;
  }
  v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"NO"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PBFModalRootViewController editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:]();
  }
  [v17 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

- (void)_galleryEditingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a4 == 1)
  {
    id v47 = (void (**)(id, id))a7;
    id v15 = [v14 suggestionMetadata];
    uint64_t v48 = [v15 lastModifiedDate];

    uint64_t v16 = [v14 suggestionMetadata];
    uint64_t v17 = [v16 metadataBySettingLastModifiedDateToNow];

    if (!v17)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F926D8]);
      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v17 = [v18 initWithSuggestedGalleryItem:0 suggestedComplicationsByIdentifier:MEMORY[0x1E4F1CC08] lastModifiedDate:v19];
    }
    id v49 = v14;
    uint64_t v20 = (void *)[v14 mutableCopy];
    [v20 setSuggestionMetadata:v17];
    uint64_t v21 = objc_alloc_init(PBFPosterEditingIngestionManager);
    [(PBFPosterEditingIngestionManager *)v21 setDelegate:self];
    v46 = v21;
    id v22 = [(PBFPosterEditingIngestionManager *)v21 ingestConfiguration:v13 updatedConfiguredProperties:v20 editingViewController:v12 galleryViewController:0 showEditingConfirmation:1];
    id v23 = v12;
    uint64_t v24 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
    id v25 = (void *)[v24 mutableCopy];

    id v26 = [v25 configurations];
    uint64_t v27 = [v26 lastObject];

    [v25 setSelectedConfiguration:v27];
    [v25 setDesiredActiveConfiguration:v27];
    dataStore = self->_dataStore;
    id v50 = 0;
    id v29 = [(PBFPosterExtensionDataStore *)dataStore updateDataStoreForSwitcherConfiguration:v25 reason:@"update poster from modal gallery" error:&v50];
    v30 = (void *)v17;
    id v31 = v50;

    v32 = self;
    if (!v29)
    {
      v33 = PBFLogModal();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[PBFModalRootViewController _galleryEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:]();
      }

      v32 = self;
    }
    v44 = v30;
    v45 = v20;
    char v34 = [v27 _path];
    [v34 serverIdentity];
    v36 = id v35 = v13;
    v37 = [v36 posterUUID];
    v38 = [v37 UUIDString];
    uint64_t v39 = v32;
    int v40 = v23;
    id v41 = v23;
    id v42 = (id)v48;
    [(PBFModalRootViewController *)v39 _logEditWithEditingViewController:v41 posterUUID:v38 lastModifiedDate:v48];

    id v13 = v35;
    v47[2](v47, v31);

    id v12 = v40;
    id v14 = v49;
  }
  else
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __150__PBFModalRootViewController__galleryEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
    v51[3] = &unk_1E69808C0;
    id v52 = v12;
    id v43 = (void (**)(id, void))a7;
    [v52 dismissViewControllerAnimated:1 completion:v51];
    v43[2](v43, 0);

    id v42 = v52;
  }
}

uint64_t __150__PBFModalRootViewController__galleryEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_standaloneEditingSceneViewController:(id)a3 userDidDismissWithAction:(int64_t)a4 updatedConfiguration:(id)a5 updatedConfiguredProperties:(id)a6 completion:(id)a7
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v70 = a5;
  id v75 = a6;
  v72 = (void (**)(id, void))a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke;
  aBlock[3] = &unk_1E6982618;
  aBlock[4] = self;
  v71 = _Block_copy(aBlock);
  id v12 = self->_entryPoint;
  NSClassFromString(&cfstr_Pruismodalentr.isa);
  if (!v12)
  {
    id v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:]();
    }
    [v65 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3221708);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v66 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRUISModalEntryPointEditingClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:].cold.4();
    }
    [v66 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D322176CLL);
  }

  v73 = self->_entryPoint;
  if (a4 == 1)
  {
    id v13 = [v75 suggestionMetadata];
    v74 = [v13 lastModifiedDate];

    id v14 = [v75 suggestionMetadata];
    id v15 = [v14 metadataBySettingLastModifiedDateToNow];

    if (!v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F926D8]);
      uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = (void *)[v16 initWithSuggestedGalleryItem:0 suggestedComplicationsByIdentifier:MEMORY[0x1E4F1CC08] lastModifiedDate:v17];
    }
    long long v69 = (void *)[v75 mutableCopy];
    [v69 setSuggestionMetadata:v15];
    long long v68 = [v76 contentsIdentity];
    uint64_t v18 = [(PRUISModalEntryPoint *)v73 editingType];
    if ((unint64_t)(v18 - 2) >= 2 && v18)
    {
      if (v18 != 1)
      {
LABEL_46:

        goto LABEL_47;
      }
      uint64_t v19 = objc_alloc_init(PBFPosterEditingIngestionManager);
      [(PBFPosterEditingIngestionManager *)v19 setDelegate:self];
      id v20 = [(PBFPosterEditingIngestionManager *)v19 ingestConfiguration:v70 updatedConfiguredProperties:v69 editingViewController:v76 galleryViewController:0 showEditingConfirmation:1];
      uint64_t v21 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
      id v22 = (void *)[v21 mutableCopy];

      id v23 = [v22 configurations];
      uint64_t v24 = [v23 lastObject];

      [v22 setSelectedConfiguration:v24];
      [v22 setDesiredActiveConfiguration:v24];
      dataStore = self->_dataStore;
      id v94 = 0;
      id v26 = [(PBFPosterExtensionDataStore *)dataStore updateDataStoreForSwitcherConfiguration:v22 reason:@"Modal New Poster" error:&v94];
      id v27 = v94;
      if (v27)
      {
        char v28 = PBFLogModal();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:]();
        }
      }
      id v29 = [v24 _path];
      v30 = [v29 serverIdentity];
      id v31 = [v30 posterUUID];
      v32 = [v31 UUIDString];

      [(PBFModalRootViewController *)self _logEditWithEditingViewController:v76 posterUUID:v32 lastModifiedDate:v74];
      v72[2](v72, 0);
    }
    else
    {
      if (self->_legacyMigrationHelper)
      {
        id v67 = [MEMORY[0x1E4F1C9C8] date];
        v38 = objc_alloc_init(PBFPosterEditingIngestionManager);
        [(PBFPosterEditingIngestionManager *)v38 setDelegate:self];
        id v39 = [(PBFPosterEditingIngestionManager *)v38 ingestConfiguration:v70 updatedConfiguredProperties:v69 editingViewController:v76 galleryViewController:0 showEditingConfirmation:0];
        if (v39)
        {
          [v76 addLongSaveOperationIndicator];
          objc_initWeak(&buf, self);
          legacyMigrationHelper = self->_legacyMigrationHelper;
          id v41 = [v39 configurationUUID];
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_171;
          v86[3] = &unk_1E6982640;
          objc_copyWeak(&v91, &buf);
          id v87 = v76;
          id v67 = v67;
          id v88 = v67;
          id v39 = v39;
          id v89 = v39;
          v90 = self;
          [(PBFLegacyPosterMigrationHelper *)legacyMigrationHelper migrateHomePosterAndAssociateToConfiguration:v41 completion:v86];

          objc_destroyWeak(&v91);
          objc_destroyWeak(&buf);
        }
        else
        {
          v46 = [MEMORY[0x1E4F1C9C8] date];
          [v46 timeIntervalSinceDate:v67];
          double v48 = v47;
          id v49 = [(PBFLegacyPosterMigrationHelper *)self->_legacyMigrationHelper migrationInfo];
          +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:3 migrationInfo:v49 duration:0 errorCode:v48];

          id v50 = PBFLogLegacyPosterMigration();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            -[PBFModalRootViewController _standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:](v50);
          }

          BOOL v51 = self->_legacyMigrationHelper;
          self->_legacyMigrationHelper = 0;

          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_170;
          v93[3] = &unk_1E69808C0;
          v93[4] = self;
          [(PBFModalRootViewController *)self dismissViewControllerAnimated:1 completion:v93];
        }
        id v27 = 0;
      }
      else
      {
        BOOL v42 = [v68 type] == 3;
        id v43 = objc_alloc(MEMORY[0x1E4F925C0]);
        v44 = [v70 _path];
        if (v42)
        {
          v45 = [v68 posterUUID];
          id v67 = (id)[v43 initWithUpdatedPath:v44 updatedPosterUUID:v45 sourceIdentity:v68 configuredProperties:v69 attributes:0];
        }
        else
        {
          id v67 = (id)[v43 initWithNewPath:v44 destinationPosterUUID:0 sourceIdentity:v68 configuredProperties:v69 attributes:0];
        }

        id v52 = [(PBFPosterExtensionDataStore *)self->_dataStore switcherConfiguration];
        v38 = (PBFPosterEditingIngestionManager *)[v52 mutableCopy];

        [(PBFPosterEditingIngestionManager *)v38 ingestNewPosterConfiguration:v67];
        id v53 = [(PBFPosterConfigurationUpdateResult *)self->_temporaryConfigurationUpdateResult incomingAssocPosterConfiguration];

        if (v53)
        {
          v54 = [(PBFPosterConfigurationUpdateResult *)self->_temporaryConfigurationUpdateResult incomingAssocPosterConfiguration];
          uint64_t v55 = [v76 contentsIdentity];
          uint64_t v56 = [v55 posterUUID];
          [(PBFPosterEditingIngestionManager *)v38 ingestNewPosterConfiguration:v54 toBeAssociatedWithUUID:v56];
        }
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        uint64_t v57 = [(PBFPosterConfigurationUpdateResult *)self->_temporaryConfigurationUpdateResult postersToDelete];
        uint64_t v58 = [v57 countByEnumeratingWithState:&v82 objects:v102 count:16];
        if (v58)
        {
          uint64_t v59 = *(void *)v83;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v83 != v59) {
                objc_enumerationMutation(v57);
              }
              [(PBFPosterEditingIngestionManager *)v38 removeConfiguration:*(void *)(*((void *)&v82 + 1) + 8 * i)];
            }
            uint64_t v58 = [v57 countByEnumeratingWithState:&v82 objects:v102 count:16];
          }
          while (v58);
        }

        id v61 = self->_dataStore;
        id v81 = 0;
        id v62 = [(PBFPosterExtensionDataStore *)v61 updateDataStoreForSwitcherConfiguration:v38 reason:@"Modal Select Active Poster" error:&v81];
        id v27 = v81;
        id v63 = [MEMORY[0x1E4F92450] done];
        [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v63];
        v77[0] = MEMORY[0x1E4F143A8];
        v77[1] = 3221225472;
        v77[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_179;
        v77[3] = &unk_1E6981090;
        id v80 = v71;
        id v78 = v63;
        id v79 = v76;
        id v39 = v63;
        [v79 dismissViewControllerAnimated:1 completion:v77];
      }
      id v64 = [v68 posterUUID];
      uint64_t v19 = [v64 UUIDString];

      [(PBFModalRootViewController *)self _logEditWithEditingViewController:v76 posterUUID:v19 lastModifiedDate:v74];
      ((void (**)(id, id))v72)[2](v72, v27);
    }

    goto LABEL_46;
  }
  v74 = [MEMORY[0x1E4F92450] cancel];
  if (self->_legacyMigrationHelper)
  {
    v33 = PBFLogLegacyPosterMigration();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D31CE000, v33, OS_LOG_TYPE_INFO, "Legacy migration cancelled, clearing migration info", (uint8_t *)&buf, 2u);
    }

    char v34 = self->_legacyMigrationHelper;
    self->_legacyMigrationHelper = 0;
  }
  uint64_t v35 = [(PRUISModalEntryPoint *)v73 editingType];
  if ((unint64_t)(v35 - 2) < 2 || !v35)
  {
    [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v74];
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2;
    v95[3] = &unk_1E6981090;
    id v98 = v71;
    id v96 = v74;
    id v97 = v76;
    [v97 dismissViewControllerAnimated:1 completion:v95];
    v72[2](v72, 0);

    v37 = &v98;
    goto LABEL_23;
  }
  if (v35 == 1)
  {
    [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v74];
    (*((void (**)(void *, void *))v71 + 2))(v71, v74);
    v72[2](v72, 0);
    dispatch_time_t v36 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_166;
    block[3] = &unk_1E69808C0;
    v37 = &v100;
    id v100 = v76;
    dispatch_after(v36, MEMORY[0x1E4F14428], block);
LABEL_23:
    id v15 = *v37;
LABEL_47:
  }
}

void __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:a2];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 992);
  *(void *)(v3 + 992) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 1000);
  *(void *)(v5 + 1000) = 0;
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_166(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 40);
  return [v2 invalidate];
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_170(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentLegacyMigrationFailedAlert];
}

void __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_171(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = WeakRetained[128];
  [*(id *)(a1 + 32) removeLongSaveOperationIndicator];
  if (v4)
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v9 = v8;
    uint64_t v10 = [WeakRetained[128] migrationInfo];
    +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:migrationInfo:duration:errorCode:](PBFLegacyMigrationAnalyticsReporter, "recordWithEvent:migrationInfo:duration:errorCode:", 4, v10, [v4 code], v9);

    int v11 = PBFLogLegacyPosterMigration();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_171_cold_1();
    }

    id v12 = [*(id *)(a1 + 48) configurationUUID];
    [v6 revertMigrationWithMigratedConfigurationUUID:v12];

    id v13 = *(void **)(a1 + 56);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_172;
    v27[3] = &unk_1E69808C0;
    v27[4] = v13;
    [v13 dismissViewControllerAnimated:1 completion:v27];
  }
  else
  {
    id v14 = [*(id *)(a1 + 48) configurationUUID];
    [v6 finalizeMigrationWithMigratedConfigurationUUID:v14];

    id v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:*(void *)(a1 + 40)];
    double v16 = v15;
    if (([v6 canMigrateLegacyPoster] & 1) != 0
      || ![v6 canMigrateLegacyLockPoster])
    {
      uint64_t v17 = PBFLogLegacyPosterMigration();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "Successful legacy poster migration!", buf, 2u);
      }
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v17 = PBFLogLegacyPosterMigration();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id buf = 0;
        _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "Successful legacy poster migration! (lock only)", buf, 2u);
      }
      uint64_t v18 = 1;
    }

    uint64_t v19 = [WeakRetained[128] migrationInfo];
    +[PBFLegacyMigrationAnalyticsReporter recordWithEvent:v18 migrationInfo:v19 duration:0 errorCode:v16];

    id v20 = [MEMORY[0x1E4F92450] done];
    [*(id *)(a1 + 56) _handleSheetWillDismissWithResponse:v20];
    uint64_t v21 = *(void **)(a1 + 56);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_173;
    v24[3] = &unk_1E69808E8;
    v24[4] = v21;
    id v25 = v20;
    id v22 = v20;
    [v21 dismissViewControllerAnimated:1 completion:v24];
  }
  id v23 = WeakRetained[128];
  WeakRetained[128] = 0;
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_172(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentLegacyMigrationFailedAlert];
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_173(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:*(void *)(a1 + 40)];
}

uint64_t __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_179(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(a1 + 40);
  return [v2 invalidate];
}

- (void)focusPosterSelectionViewController:(id)a3 willDismissWithResponse:(id)a4
{
}

- (void)focusPosterSelectionViewController:(id)a3 didDismissWithResponse:(id)a4
{
}

- (PREditingSceneViewControllerTopButtonLayout)topButtonLayoutForFocusPosterSelectionViewController:(SEL)a3
{
  result = (PREditingSceneViewControllerTopButtonLayout *)objc_opt_class();
  if (result)
  {
    return (PREditingSceneViewControllerTopButtonLayout *)[(PREditingSceneViewControllerTopButtonLayout *)result _topButtonLayout];
  }
  else
  {
    retstr->trailingTopButtonFrame.origin = 0u;
    retstr->trailingTopButtonFrame.size = 0u;
    retstr->leadingTopButtonFrame.origin = 0u;
    retstr->leadingTopButtonFrame.size = 0u;
  }
  return result;
}

- (void)posterSelectionViewController:(id)a3 willDismissWithResponse:(id)a4
{
}

- (void)posterSelectionViewController:(id)a3 didDismissWithResponse:(id)a4
{
}

- (void)presentationControllerWillDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F92450], "cancel", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v4];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F92450], "cancel", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(PBFModalRootViewController *)self _handleSheetDidDismissWithResponse:v4];
}

- (BOOL)ambientEditingCollectionViewControllerDidPressDone:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F92450], "done", a3);
  [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v4];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PBFModalRootViewController_ambientEditingCollectionViewControllerDidPressDone___block_invoke;
  v8[3] = &unk_1E69808E8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [(PBFModalRootViewController *)self dismissViewControllerAnimated:IsReduceMotionEnabled completion:v8];

  return 1;
}

uint64_t __81__PBFModalRootViewController_ambientEditingCollectionViewControllerDidPressDone___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:*(void *)(a1 + 40)];
}

+ (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout
{
  if (_topButtonLayout_onceToken != -1) {
    dispatch_once(&_topButtonLayout_onceToken, &__block_literal_global_5);
  }
  CGSize v4 = (CGSize)unk_1EBD70AB8;
  retstr->leadingTopButtonFrame.origin = (CGPoint)_topButtonLayout_layout;
  retstr->leadingTopButtonFrame.size = v4;
  CGSize v5 = (CGSize)unk_1EBD70AD8;
  retstr->trailingTopButtonFrame.origin = (CGPoint)xmmword_1EBD70AC8;
  retstr->trailingTopButtonFrame.size = v5;
  return result;
}

double __46__PBFModalRootViewController__topButtonLayout__block_invoke()
{
  SBSTopButtonFramesForPosters();
  double result = 0.0;
  _topButtonLayout_layout = 0u;
  unk_1EBD70AB8 = 0u;
  xmmword_1EBD70AC8 = 0u;
  unk_1EBD70AD8 = 0u;
  return result;
}

- (void)_displayViewControllerAsSheet:(id)a3
{
  CGSize v4 = (objc_class *)MEMORY[0x1E4FB19E8];
  id v5 = a3;
  id v7 = (id)[[v4 alloc] initWithRootViewController:v5];

  [v7 setModalPresentationStyle:2];
  id v6 = [v7 sheetPresentationController];
  [v6 setDelegate:self];
  [(PBFModalRootViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_handleSheetWillDismissWithResponse:(id)a3
{
  CGSize v4 = (objc_class *)MEMORY[0x1E4F92498];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initWithResponse:v5];

  id v6 = [(UIScene *)self->_parentScene _FBSScene];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [v6 sendActions:v7];
}

- (void)_handleSheetDidDismissWithResponse:(id)a3
{
  CGSize v4 = (objc_class *)MEMORY[0x1E4F923E8];
  id v5 = a3;
  id v8 = (id)[[v4 alloc] initWithResponse:v5];

  id v6 = [(UIScene *)self->_parentScene _FBSScene];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [v6 sendActions:v7];
}

- (void)dataStoreDidTearDown:(id)a3
{
}

void __51__PBFModalRootViewController_dataStoreDidTearDown___block_invoke(uint64_t a1)
{
  v2 = PBFLogModal();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1D31CE000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing modal sheet due to data store tear down", buf, 2u);
  }

  uint64_t v3 = [MEMORY[0x1E4F92450] cancel];
  [*(id *)(a1 + 32) _handleSheetWillDismissWithResponse:v3];
  int v4 = [*(id *)(a1 + 32) _isPhotosEntryPoint];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _handleSheetDidDismissWithResponse:v3];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PBFModalRootViewController_dataStoreDidTearDown___block_invoke_183;
    v6[3] = &unk_1E69808E8;
    v6[4] = v5;
    id v7 = v3;
    [v5 dismissPresentedViewControllersAnimated:1 dismissHandler:0 completion:v6];
  }
}

uint64_t __51__PBFModalRootViewController_dataStoreDidTearDown___block_invoke_183(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:*(void *)(a1 + 40)];
}

- (void)_presentLegacyAddNewAlert
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  int v4 = PBFLocalizedString(@"CANNOT_MIGRATE_LEGACY_ALERT_TITLE");
  id v5 = PBFLocalizedString(@"CANNOT_MIGRATE_LEGACY_ALERT_MESSAGE");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PBFLocalizedString(@"CANNOT_MIGRATE_LEGACY_ALERT_BUTTON_ADD_NEW");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke;
  v14[3] = &unk_1E6982668;
  v14[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v14];

  [v6 addAction:v9];
  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  int v11 = PBFLocalizedString(@"CANCEL");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke_2;
  v13[3] = &unk_1E6982668;
  v13[4] = self;
  id v12 = [v10 actionWithTitle:v11 style:1 handler:v13];

  [v6 addAction:v12];
  [(PBFModalRootViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentGallery];
}

void __55__PBFModalRootViewController__presentLegacyAddNewAlert__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F92450] cancel];
  [*(id *)(a1 + 32) _handleSheetWillDismissWithResponse:v2];
  [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:v2];
}

- (void)_presentPartialMigrationPrompt
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  int v4 = PBFLocalizedString(@"CANNOT_MIGRATE_LEGACY_HOME_ALERT_TITLE");
  id v5 = PBFLocalizedString(@"CANNOT_MIGRATE_LEGACY_HOME_ALERT_MESSAGE");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PBFLocalizedString(@"CANNOT_MIGRATE_LEGACY_HOME_ALERT_BUTTON_CUSTOMIZE_LOCK");
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke;
  v18[3] = &unk_1E6982668;
  v18[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:2 handler:v18];

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  int v11 = PBFLocalizedString(@"CANNOT_MIGRATE_LEGACY_ALERT_BUTTON_ADD_NEW");
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_2;
  v17[3] = &unk_1E6982668;
  void v17[4] = self;
  id v12 = [v10 actionWithTitle:v11 style:0 handler:v17];

  [v6 addAction:v9];
  [v6 addAction:v12];
  id v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = PBFLocalizedString(@"CANCEL");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_3;
  v16[3] = &unk_1E6982668;
  v16[4] = self;
  double v15 = [v13 actionWithTitle:v14 style:1 handler:v16];

  [v6 addAction:v15];
  [(PBFModalRootViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performLegacyMigration];
}

uint64_t __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentGallery];
}

void __60__PBFModalRootViewController__presentPartialMigrationPrompt__block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F92450] cancel];
  [*(id *)(a1 + 32) _handleSheetWillDismissWithResponse:v2];
  [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:v2];
}

- (void)_presentLegacyMigrationAlert
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  int v4 = PBFLocalizedString(@"MIGRATE_LEGACY_ALERT_TITLE");
  id v5 = PBFLocalizedString(@"MIGRATE_LEGACY_ALERT_MESSAGE");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PBFLocalizedString(@"MIGRATE_LEGACY_ALERT_BUTTON_MIGRATE_EXISTING");
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke;
  v18[3] = &unk_1E6982668;
  v18[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v18];

  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  int v11 = PBFLocalizedString(@"MIGRATE_LEGACY_ALERT_BUTTON_ADD_NEW");
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_2;
  v17[3] = &unk_1E6982668;
  void v17[4] = self;
  id v12 = [v10 actionWithTitle:v11 style:0 handler:v17];

  [v6 addAction:v9];
  [v6 addAction:v12];
  id v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = PBFLocalizedString(@"CANCEL");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_3;
  v16[3] = &unk_1E6982668;
  v16[4] = self;
  double v15 = [v13 actionWithTitle:v14 style:1 handler:v16];

  [v6 addAction:v15];
  [(PBFModalRootViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performLegacyMigration];
}

uint64_t __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentGallery];
}

void __58__PBFModalRootViewController__presentLegacyMigrationAlert__block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F92450] cancel];
  [*(id *)(a1 + 32) _handleSheetWillDismissWithResponse:v2];
  [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:v2];
}

- (void)_presentLegacyMigrationFailedAlert
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB1418];
  int v4 = PBFLocalizedString(@"ERROR_MIGRATING_LEGACY_ALERT_TITLE");
  id v5 = PBFLocalizedString(@"ERROR_MIGRATING_LEGACY_ALERT_MESSAGE");
  id v6 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:0];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = PBFLocalizedString(@"ERROR_MIGRATING_LEGACY_ALERT_BUTTON_ADD_NEW");
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke;
  v14[3] = &unk_1E6982668;
  v14[4] = self;
  id v9 = [v7 actionWithTitle:v8 style:0 handler:v14];

  [v6 addAction:v9];
  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  int v11 = PBFLocalizedString(@"CANCEL");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke_2;
  v13[3] = &unk_1E6982668;
  v13[4] = self;
  id v12 = [v10 actionWithTitle:v11 style:1 handler:v13];

  [v6 addAction:v12];
  [(PBFModalRootViewController *)self presentViewController:v6 animated:1 completion:0];
}

uint64_t __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentGallery];
}

void __64__PBFModalRootViewController__presentLegacyMigrationFailedAlert__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F92450] cancel];
  [*(id *)(a1 + 32) _handleSheetWillDismissWithResponse:v2];
  [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:v2];
}

- (void)_setupGalleryDataProviderIfNeeded
{
  if (!self->_galleryDataProvider)
  {
    uint64_t v3 = objc_alloc_init(PBFGalleryMutableDataProvider);
    galleryDataProvider = self->_galleryDataProvider;
    self->_galleryDataProvider = v3;

    [(PBFModalRootViewController *)self _reload];
  }
}

- (void)_reload
{
  id v3 = [(PBFPosterExtensionDataStore *)self->_dataStore currentGalleryConfiguration];
  [(PBFGalleryMutableDataProvider *)self->_galleryDataProvider configureForGallery:v3];
}

- (void)_presentGallery
{
  id v3 = [(PBFModalRootViewController *)self view];
  int v4 = [v3 window];
  id v5 = [v4 _rootSheetPresentationController];
  [v5 _setShouldScaleDownBehindDescendantSheets:0];

  [(PBFModalRootViewController *)self _setupGalleryDataProviderIfNeeded];
  obj = [[PBFPosterGalleryPreviewViewController alloc] initWithNibName:0 bundle:0];
  [(PBFPosterGalleryPreviewViewController *)obj setDelegate:self];
  [(PBFPosterGalleryPreviewViewController *)obj setEditingSceneDelegate:self];
  [(PBFPosterGalleryPreviewViewController *)obj setDataProvider:self->_galleryDataProvider];
  PFCurrentDeviceClass();
  [(PBFPosterGalleryPreviewViewController *)obj setModalPresentationStyle:2];
  id v6 = [(PBFPosterGalleryPreviewViewController *)obj sheetPresentationController];
  +[PBFPosterGalleryPreviewViewController configureSheetPresentationController:v6];
  [v6 setDelegate:self];
  [(PBFModalRootViewController *)self presentViewController:obj animated:1 completion:0];

  objc_storeWeak((id *)&self->_galleryController, obj);
  id v7 = [(PBFPosterExtensionDataStore *)self->_dataStore currentGalleryConfiguration];
  id v8 = [v7 suggestedLayout];
  id v9 = [v8 proactiveRepresentation];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F4B040] sharedInstance];
    [v10 logFaceGalleryDidAppearWithFaceGalleryConfiguration:v9];
  }
}

- (void)_createLegacyMigrationHelperWithConfiguration:(id)a3
{
  if (a3 && !self->_legacyMigrationHelper)
  {
    id v4 = a3;
    id v7 = [[PBFPosterPair alloc] initWithConfiguration:v4 associatedConfiguration:0];

    id v5 = [[PBFLegacyPosterMigrationHelper alloc] initWithDataStore:self->_dataStore legacyPosterPair:v7];
    legacyMigrationHelper = self->_legacyMigrationHelper;
    self->_legacyMigrationHelper = v5;
  }
}

- (void)_performLegacyMigration
{
  id v3 = [(PBFLegacyPosterMigrationHelper *)self->_legacyMigrationHelper lockScreenMigrationViewController];
  if (v3)
  {
    id v4 = v3;
    [(PBFModalRootViewController *)self _presentEditingSceneViewController:v3];
    id v3 = v4;
  }
}

- (BOOL)_isPhotosEntryPoint
{
  entryPoint = self->_entryPoint;
  uint64_t v3 = objc_opt_class();
  id v4 = entryPoint;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [(PRUISModalEntryPoint *)v6 editingType];
  return v7 == 1;
}

- (void)_logEditWithEditingViewController:(id)a3 posterUUID:(id)a4 lastModifiedDate:(id)a5
{
  id v30 = a3;
  id v8 = a5;
  id v9 = a4;
  objc_opt_class();
  id v29 = v9;
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    switch([(PRUISModalEntryPoint *)self->_entryPoint editingType])
    {
      case 0:
        unsigned int v27 = 0;
        uint64_t v10 = @"modalEditingActivePosterConfiguration";
        goto LABEL_13;
      case 1:
        int v11 = @"modalEditingNewPosterFromConfiguration";
        goto LABEL_10;
      case 2:
        unsigned int v27 = 0;
        uint64_t v10 = @"modalEditingEditPosterFromConfiguration";
        goto LABEL_13;
      case 3:
        unsigned int v27 = 0;
        uint64_t v10 = @"modalEditingEditPosterFromConfigurationWithUpdateSessionInfo";
        goto LABEL_13;
      default:
        goto LABEL_8;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    int v11 = @"modalGallery";
LABEL_10:
    char v28 = v11;
    unsigned int v27 = 1;
  }
  else
  {
LABEL_8:
    unsigned int v27 = 0;
    uint64_t v10 = @"unknown";
LABEL_13:
    char v28 = v10;
  }
  id v12 = [v30 modifications];
  id v13 = objc_alloc(MEMORY[0x1E4F4B278]);
  [v8 timeIntervalSinceNow];
  double v15 = v14;

  uint64_t v16 = [v12 colorModified];
  char v17 = [v12 fontModified];
  char v18 = [v12 numberingSystemModified];
  char v19 = [v12 posterContentModified];
  char v20 = [v12 widgetsModified];
  char v21 = [v12 containedWidgetsBeforeEdit];
  id v22 = [v12 startDate];
  [v22 timeIntervalSinceNow];
  BYTE4(v26) = v21;
  BYTE3(v26) = v20;
  BYTE2(v26) = v19;
  BYTE1(v26) = v18;
  LOBYTE(v26) = v17;
  uint64_t v24 = objc_msgSend(v13, "initWithLockscreenId:entryPoint:newlyCreated:secondsSinceLastEdit:outcome:userChangedColor:userChangedFont:userChangedNumberingSystem:userChangedPosterContent:userChangedWidgets:didLockscreenHaveWidgetsBeforeEdit:duration:", v29, v28, v27, (uint64_t)-v15, @"accepted", v16, v26, (unint64_t)-v23);

  id v25 = [MEMORY[0x1E4F4B040] sharedInstance];
  [v25 logPosterEdit:v24 completion:&__block_literal_global_258];
}

void __92__PBFModalRootViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = PBFLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __103__PBFFocusPosterSelectionViewController__logEditWithEditingViewController_posterUUID_lastModifiedDate___block_invoke_cold_1();
    }
  }
}

- (id)_posterLimitExceededAlertWithButtonActionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = PBFLocalizedString(@"TOO_MANY_CONFIGURATIONS_TITLE");
  id v6 = PBFLocalizedString(@"TOO_MANY_CONFIGURATIONS_MESSAGE");
  uint64_t v7 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  id v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = PBFLocalizedString(@"OK");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PBFModalRootViewController__posterLimitExceededAlertWithButtonActionHandler___block_invoke;
  v13[3] = &unk_1E6982690;
  id v14 = v3;
  id v10 = v3;
  int v11 = [v8 actionWithTitle:v9 style:0 handler:v13];
  [v7 addAction:v11];

  return v7;
}

uint64_t __79__PBFModalRootViewController__posterLimitExceededAlertWithButtonActionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleNotificationForwardAction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 notificationName];
  id v5 = [(PBFModalRootViewController *)self presentedViewController];
  if (objc_opt_respondsToSelector())
  {
    id v6 = PBFLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      id v8 = v4;
      __int16 v9 = 2114;
      id v10 = v5;
      _os_log_impl(&dword_1D31CE000, v6, OS_LOG_TYPE_DEFAULT, "Forwarding appearance notification %{public}@ to presented view controller: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    [v5 forwardAppearanceNotificationName:v4];
  }
}

- (UIScene)_scene
{
  return self->_parentScene;
}

- (void)_setScene:(id)a3
{
  id v4 = (UIScene *)a3;
  if (v4 && self->_parentScene != v4)
  {
    id v5 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"scene == _parentScene"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFModalRootViewController _setScene:]();
    }
    [v5 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
  }
}

- (id)_settingsDiffActionsForScene:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  return v3;
}

- (id)_actionHandlersForScene:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = self;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  return v3;
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  objc_msgSend(a4, "settings", a3);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  __int16 v9 = [v15 otherSettings];
  int v10 = [v9 BOOLForSetting:2606278162];

  if (self->_displayConfigurationObserver) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    id v12 = [(UIScene *)self->_parentScene _FBSScene];
    id v13 = [v12 settings];
    id v14 = [v13 displayConfiguration];

    [(PBFDisplayConfigurationUpdatable *)self->_displayConfigurationObserver setDisplayConfiguration:v14];
  }
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v7 = a3;
  id v8 = objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_276);
  if (v8)
  {
    __int16 v9 = [(PBFModalRootViewController *)self presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 dismiss];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 dismissWithAction:0];
      }
      else
      {
        int v10 = [MEMORY[0x1E4F92450] cancel];
        [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v10];
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        uint64_t v16 = __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2;
        char v17 = &unk_1E69808E8;
        char v18 = self;
        id v19 = v10;
        id v11 = v10;
        [(PBFModalRootViewController *)self dismissViewControllerAnimated:1 completion:&v14];
      }
    }
  }
  id v12 = objc_msgSend(v7, "bs_firstObjectPassingTest:", &__block_literal_global_279, v14, v15, v16, v17, v18);
  if (v12) {
    [(PBFModalRootViewController *)self _handleNotificationForwardAction:v12];
  }

  return v7;
}

uint64_t __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:*(void *)(a1 + 40)];
}

uint64_t __92__PBFModalRootViewController__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)description
{
  return (NSString *)[(PBFModalRootViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(PBFModalRootViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)succinctDescription
{
  id v2 = [(PBFModalRootViewController *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void)posterExtensionDataStore:(id)a3 didUpdateGalleryConfiguration:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PBFModalRootViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke;
  block[3] = &unk_1E69826D8;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __85__PBFModalRootViewController_posterExtensionDataStore_didUpdateGalleryConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[127] configureForGallery:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)galleryViewController:(id)a3 didSelectPreview:(id)a4 fromPreviewView:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(PBFPosterExtensionDataStore *)self->_dataStore canPersistNewPosterConfiguration])
  {
    [v15 presentPreview:v8 withMode:2 fromView:v9];
    [(BSInvalidatable *)self->_editingSessionInProgressAssertion invalidate];
    int v10 = [v8 posterDescriptorLookupInfo];
    id v11 = [v10 posterDescriptorExtension];
    id v12 = [v11 posterExtensionBundleIdentifier];

    id v13 = [(PBFBehaviorAssertionProviding *)self->_behaviorAssertionProvider acquireEditingSessionAssertionForProvider:v12 withReason:@"Modal root view controller is starting an editing session"];
    editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
    self->_editingSessionInProgressAssertion = v13;
  }
  else
  {
    id v12 = [(PBFModalRootViewController *)self _posterLimitExceededAlertWithButtonActionHandler:0];
    [v15 presentViewController:v12 animated:1 completion:0];
  }
}

- (id)galleryViewController:(id)a3 willUseAnimationController:(id)a4 forDismissingEditingViewControllerWithAction:(int64_t)a5
{
  editingSessionInProgressAssertion = self->_editingSessionInProgressAssertion;
  id v8 = a4;
  [(BSInvalidatable *)editingSessionInProgressAssertion invalidate];
  id v9 = self->_editingSessionInProgressAssertion;
  self->_editingSessionInProgressAssertion = 0;

  if (a5 == 1) {
    int v10 = 0;
  }
  else {
    int v10 = v8;
  }
  id v11 = v10;

  return v11;
}

- (void)editingIngestionManager:(id)a3 didAccept:(id)a4 userChoice:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self->_legacyMigrationHelper) {
    goto LABEL_12;
  }
  if (!a5)
  {
    if ([(PBFModalRootViewController *)self _isPhotosEntryPoint])
    {
      temporaryDescriptor = self->_temporaryDescriptor;
      self->_temporaryDescriptor = 0;

      id v12 = [MEMORY[0x1E4F92450] done];
      [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v12];
      [(PBFModalRootViewController *)self _handleSheetDidDismissWithResponse:v12];
    }
    else
    {
      char v18 = [MEMORY[0x1E4F92450] done];
      [(PBFModalRootViewController *)self _handleSheetWillDismissWithResponse:v18];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75__PBFModalRootViewController_editingIngestionManager_didAccept_userChoice___block_invoke;
      v21[3] = &unk_1E69808E8;
      v21[4] = self;
      id v22 = v18;
      id v12 = v18;
      [(PBFModalRootViewController *)self dismissViewControllerAnimated:1 completion:v21];
    }
    goto LABEL_12;
  }
  [v8 dismissViewController];
  int v10 = objc_opt_class();
  if (v10) {
    [v10 _topButtonLayout];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  id v13 = +[PBFPosterRackCollectionViewController simplifiedHomeScreenSwitcherFor:v9 delegate:self topButtonLayout:v20];
  uint64_t v14 = [v8 editingViewController];
  id v15 = [v14 navigationController];

  if (v15)
  {
    uint64_t v16 = [v8 editingViewController];
    char v17 = [v16 navigationController];
    [v17 pushViewController:v13 animated:1];

LABEL_12:
    return;
  }
  id v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[[manager editingViewController] navigationController]"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PBFModalRootViewController editingIngestionManager:didAccept:userChoice:]();
  }
  [v19 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __75__PBFModalRootViewController_editingIngestionManager_didAccept_userChoice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSheetDidDismissWithResponse:*(void *)(a1 + 40)];
}

- (PBFPosterGalleryPreviewViewController)galleryController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_galleryController);
  return (PBFPosterGalleryPreviewViewController *)WeakRetained;
}

- (void)setGalleryController:(id)a3
{
}

- (PBFAmbientEditingCollectionViewController)ambientEditingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ambientEditingController);
  return (PBFAmbientEditingCollectionViewController *)WeakRetained;
}

- (void)setAmbientEditingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ambientEditingController);
  objc_destroyWeak((id *)&self->_galleryController);
  objc_storeStrong((id *)&self->_displayConfigurationObserver, 0);
  objc_storeStrong((id *)&self->_behaviorAssertionProvider, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_editingSessionInProgressAssertion, 0);
  objc_storeStrong((id *)&self->_snapshotterInUseAssertion, 0);
  objc_storeStrong((id *)&self->_legacyMigrationHelper, 0);
  objc_storeStrong((id *)&self->_galleryDataProvider, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
  objc_storeStrong((id *)&self->_temporaryConfigurationUpdateResult, 0);
  objc_storeStrong((id *)&self->_temporaryDescriptor, 0);
  objc_storeStrong((id *)&self->_parentScene, 0);
}

- (void)initWithScene:dataStore:behaviorAssertionProvider:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithScene:dataStore:behaviorAssertionProvider:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithScene:dataStore:behaviorAssertionProvider:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_presentEditingForPosterConfiguration:(const char *)a1 .cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_presentEditingForPosterConfiguration:(const char *)a1 .cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_presentEditingForPosterConfiguration:sessionInfo:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __80__PBFModalRootViewController__presentEditingForPosterConfiguration_sessionInfo___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not apply default Home Screen configuration: %@", v2, v3, v4, v5, v6);
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not create supplements directory for staged configuration: %@", v2, v3, v4, v5, v6);
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not copy contents: %@", v2, v3, v4, v5, v6);
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not remove temporary contents folder: %@", v2, v3, v4, v5, v6);
}

- (void)_presentEditingForNewPosterFromConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not create configuration contents: %@", v2, v3, v4, v5, v6);
}

- (void)editingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_galleryEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not set poster configuration ingested from modal gallery as selected and active: %@", v2, v3, v4, v5, v6);
}

- (void)_standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Could not make poster active/selected: %@", v2, v3, v4, v5, v6);
}

- (void)_standaloneEditingSceneViewController:(os_log_t)log userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "Unable to migrate lock poster, reverting migration", v1, 2u);
}

- (void)_standaloneEditingSceneViewController:userDidDismissWithAction:updatedConfiguration:updatedConfiguredProperties:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __153__PBFModalRootViewController__standaloneEditingSceneViewController_userDidDismissWithAction_updatedConfiguration_updatedConfiguredProperties_completion___block_invoke_2_171_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D31CE000, v0, v1, "Unable to migrate home poster, reverting migration %@", v2, v3, v4, v5, v6);
}

- (void)_setScene:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)editingIngestionManager:didAccept:userChoice:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end