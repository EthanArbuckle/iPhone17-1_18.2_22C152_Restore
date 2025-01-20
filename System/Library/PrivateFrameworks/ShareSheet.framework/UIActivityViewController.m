@interface UIActivityViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (double)_asyncPresentationTimeout;
+ (id)collaborationModeRestrictionFromActivityItemsConfiguration:(id)a3 collaborationMode:(int64_t)a4;
+ (int64_t)_defaultPlatformPresentationStyle;
- (BOOL)_allowsStylingSheetsAsCards;
- (BOOL)_requiresCustomPresentationController;
- (BOOL)_shouldShowSystemActivityType:(id)a3;
- (BOOL)allowsCustomPresentationStyle;
- (BOOL)allowsEmbedding;
- (BOOL)allowsProminentActivity;
- (BOOL)configureForCloudSharing;
- (BOOL)configureForPhotosEdit;
- (BOOL)didEndDelayingPresentation;
- (BOOL)didStartDelayingPresentation;
- (BOOL)enableNewDesignInPhotos;
- (BOOL)hideHeaderView;
- (BOOL)hideNavigationBar;
- (BOOL)hideSuggestions;
- (BOOL)isCollaborationSelected;
- (BOOL)isContentManaged;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldSuggestFamilyMembers;
- (BOOL)showCustomScene;
- (BOOL)showHeroActionsHorizontally;
- (BOOL)showKeyboardAutomatically;
- (BOOL)whitelistActionActivitiesOnly;
- (LPLinkMetadata)photosHeaderMetadata;
- (NSArray)_selectedAssetIdentifiers;
- (NSArray)activityItems;
- (NSArray)activityTypeOrder;
- (NSArray)applicationActivities;
- (NSArray)excludedActivityTypes;
- (NSArray)heroActionActivityTypes;
- (NSArray)includedActivityTypes;
- (NSArray)peopleSuggestionBundleIds;
- (NSDictionary)_initialPhotosAssetDetails;
- (NSNumber)customViewControllerSectionHeightWrapper;
- (NSNumber)customViewControllerVerticalInsetWrapper;
- (NSSet)_photosAssetIdentifiers;
- (NSString)sessionIdentifier;
- (NSString)subject;
- (NSString)topContentSectionText;
- (NSString)userDefaultsIdentifier;
- (NSURL)managedFileURL;
- (NSUserDefaults)userDefaults;
- (SHSheetPresenter)mainPresenter;
- (UIActivity)activity;
- (UIActivityItemsConfigurationProviding)clientActivityItemsConfigurationSource;
- (UIActivityItemsConfigurationReading)cachedActivityItemsConfiguration;
- (UIActivityViewController)init;
- (UIActivityViewController)initWithActivityItems:(NSArray *)activityItems applicationActivities:(NSArray *)applicationActivities;
- (UIActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 peopleSuggestionBundleIds:(id)a5;
- (UIActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shouldSuggestFamilyMembers:(BOOL)a5;
- (UIActivityViewController)initWithActivityItemsConfiguration:(id)activityItemsConfiguration;
- (UIActivityViewController)initWithAssetIdentifiers:(id)a3 activityItems:(id)a4 applicationActivities:(id)a5;
- (UIActivityViewController)initWithCoder:(NSCoder *)coder;
- (UIActivityViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (UIActivityViewController)initWithUserDefaults:(id)a3 userDefaultsIdentifier:(id)a4 applicationActivities:(id)a5;
- (UIActivityViewControllerAirDropDelegate)airDropDelegate;
- (UIActivityViewControllerCollaborationDelegate)collaborationDelegate;
- (UIActivityViewControllerCompletionHandler)completionHandler;
- (UIActivityViewControllerCompletionWithItemsHandler)completionWithItemsHandler;
- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate;
- (UIActivityViewControllerPhotosDelegate)photosDelegate;
- (UIViewController)activityViewController;
- (UIViewController)photosCarouselViewController;
- (UIViewController)photosStackViewController;
- (_UIRemoteSheet)_remoteSheet;
- (double)_displayHeight;
- (double)customViewControllerSectionHeight;
- (double)customViewControllerVerticalInset;
- (id)_activityPresentationCompletionHandler;
- (id)_createContextFromCurrentState;
- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)_shareSheetReadyToInteractHandler;
- (id)_titleForActivity:(id)a3;
- (id)activityItemsConfiguration;
- (id)preCompletionHandler;
- (int64_t)collaborationMode;
- (int64_t)excludedActivityCategories;
- (int64_t)sharingStyle;
- (unint64_t)clientAttemptedInitialPresentationOrEmbeddingTimestamp;
- (unint64_t)creationTimestamp;
- (unint64_t)excludedActivitySectionTypes;
- (unint64_t)readyToInteractTimestamp;
- (unint64_t)viewWillAppearTimestamp;
- (void)__viewControllerWillBePresented:(BOOL)a3;
- (void)_cancel;
- (void)_createMainPresenterIfNeeded;
- (void)_delayPresentationIfNeeded;
- (void)_didResignContentViewControllerOfPopover:(id)a3;
- (void)_endDelayingPresentation;
- (void)_executeActivity;
- (void)_findSupportedActivitiesWithCompletionHandler:(id)a3;
- (void)_performActivity:(id)a3;
- (void)_performActivityWithType:(id)a3 completionHandler:(id)a4;
- (void)_prepareActivity:(id)a3 completion:(id)a4;
- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)_presentationControllerDidDismiss:(id)a3;
- (void)_primeExtensionDiscovery;
- (void)_readyToInteract;
- (void)_reloadActivity:(id)a3;
- (void)_setActivityPresentationCompletionHandler:(id)a3;
- (void)_setInitialPhotosAssetDetails:(id)a3;
- (void)_setPhotosAssetIdentifiers:(id)a3;
- (void)_setSelectedAssetIdentifiers:(id)a3;
- (void)_setShareSheetReadyToInteractHandler:(id)a3;
- (void)_updateActivityItems:(id)a3;
- (void)_updateActivityItems:(id)a3 applicationActivities:(id)a4;
- (void)_updateSheetPresentationController:(id)a3;
- (void)_viewControllerPresentationDidInitiate;
- (void)dealloc;
- (void)mainPresenter:(id)a3 didCompleteActivity:(id)a4 withSuccess:(BOOL)a5 returnedItems:(id)a6 error:(id)a7;
- (void)mainPresenter:(id)a3 willCompleteActivity:(id)a4 withSuccess:(BOOL)a5;
- (void)mainPresenterIsReadyToInteract:(id)a3;
- (void)performAddToAlbumExtensionWithCompletionHandler:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (void)setActivity:(id)a3;
- (void)setActivityItems:(id)a3;
- (void)setActivityTypeOrder:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setAirDropDelegate:(id)a3;
- (void)setAllowsCustomPresentationStyle:(BOOL)a3;
- (void)setAllowsEmbedding:(BOOL)a3;
- (void)setAllowsProminentActivity:(BOOL)allowsProminentActivity;
- (void)setApplicationActivities:(id)a3;
- (void)setCachedActivityItemsConfiguration:(id)a3;
- (void)setClientActivityItemsConfigurationSource:(id)a3;
- (void)setClientAttemptedInitialPresentationOrEmbeddingTimestamp:(unint64_t)a3;
- (void)setCollaborationDelegate:(id)a3;
- (void)setCollaborationMode:(int64_t)a3;
- (void)setCompletionHandler:(UIActivityViewControllerCompletionHandler)completionHandler;
- (void)setCompletionWithItemsHandler:(UIActivityViewControllerCompletionWithItemsHandler)completionWithItemsHandler;
- (void)setConfigureForCloudSharing:(BOOL)a3;
- (void)setConfigureForPhotosEdit:(BOOL)a3;
- (void)setCreationTimestamp:(unint64_t)a3;
- (void)setCustomViewControllerSectionHeight:(double)a3;
- (void)setCustomViewControllerSectionHeightWrapper:(id)a3;
- (void)setCustomViewControllerVerticalInset:(double)a3;
- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3;
- (void)setDidEndDelayingPresentation:(BOOL)a3;
- (void)setDidStartDelayingPresentation:(BOOL)a3;
- (void)setEnableNewDesignInPhotos:(BOOL)a3;
- (void)setExcludedActivityCategories:(int64_t)a3;
- (void)setExcludedActivitySectionTypes:(unint64_t)a3;
- (void)setExcludedActivityTypes:(NSArray *)excludedActivityTypes;
- (void)setHeroActionActivityTypes:(id)a3;
- (void)setHideHeaderView:(BOOL)a3;
- (void)setHideNavigationBar:(BOOL)a3;
- (void)setHideSuggestions:(BOOL)a3;
- (void)setIncludedActivityTypes:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setManagedFileURL:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setObjectManipulationDelegate:(id)a3;
- (void)setPeopleSuggestionBundleIds:(id)a3;
- (void)setPhotosCarouselViewController:(id)a3;
- (void)setPhotosDelegate:(id)a3;
- (void)setPhotosHeaderMetadata:(id)a3;
- (void)setPhotosStackViewController:(id)a3;
- (void)setPreCompletionHandler:(id)a3;
- (void)setReadyToInteractTimestamp:(unint64_t)a3;
- (void)setSharingStyle:(int64_t)a3;
- (void)setShouldSuggestFamilyMembers:(BOOL)a3;
- (void)setShowCustomScene:(BOOL)a3;
- (void)setShowHeroActionsHorizontally:(BOOL)a3;
- (void)setShowKeyboardAutomatically:(BOOL)a3;
- (void)setSubject:(id)a3;
- (void)setTopContentSectionText:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setUserDefaultsIdentifier:(id)a3;
- (void)setViewWillAppearTimestamp:(unint64_t)a3;
- (void)setWhitelistActionActivitiesOnly:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIActivityViewController

- (UIActivityViewController)initWithActivityItemsConfiguration:(id)activityItemsConfiguration
{
  id v4 = activityItemsConfiguration;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 _activityItems], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = (void *)MEMORY[0x1E4FB1408];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __101__UIActivityViewController_UIActivityItemsConfiguration_Private__initWithActivityItemsConfiguration___block_invoke;
    v11[3] = &unk_1E5A22520;
    id v12 = v4;
    v5 = [v6 _itemsForSystemSharingFromActivityItemsConfiguration:v12 wrapperBlock:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    v7 = [v4 applicationActivitiesForActivityItemsConfiguration];
  }
  else
  {
    v7 = 0;
  }
  v8 = [(UIActivityViewController *)self initWithActivityItems:v5 applicationActivities:v7];
  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      v9 = [v4 _excludedActivityTypes];
      [(UIActivityViewController *)v8 setExcludedActivityTypes:v9];
    }
    [(UIActivityViewController *)v8 setCachedActivityItemsConfiguration:v4];
  }

  return v8;
}

_UIActivityItemsConfigurationActivityItemProvider *__101__UIActivityViewController_UIActivityItemsConfiguration_Private__initWithActivityItemsConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = [[_UIActivityItemsConfigurationActivityItemProvider alloc] initWithActivityItemsConfiguration:*(void *)(a1 + 32) itemAtSourceIndex:a3];
  return v3;
}

- (UIActivityViewController)init
{
  return [(UIActivityViewController *)self initWithActivityItems:MEMORY[0x1E4F1CBF0] applicationActivities:0];
}

- (UIActivityViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  return [(UIActivityViewController *)self initWithActivityItems:MEMORY[0x1E4F1CBF0] applicationActivities:0];
}

- (UIActivityViewController)initWithCoder:(NSCoder *)coder
{
  return [(UIActivityViewController *)self initWithActivityItems:MEMORY[0x1E4F1CBF0] applicationActivities:0];
}

- (UIActivityViewController)initWithAssetIdentifiers:(id)a3 activityItems:(id)a4 applicationActivities:(id)a5
{
  id v9 = a3;
  v10 = [(UIActivityViewController *)self initWithActivityItems:a4 applicationActivities:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_selectedAssetIdentifiers, a3);
  }

  return v11;
}

- (UIActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 shouldSuggestFamilyMembers:(BOOL)a5
{
  result = [(UIActivityViewController *)self initWithActivityItems:a3 applicationActivities:a4];
  if (result) {
    result->_shouldSuggestFamilyMembers = a5;
  }
  return result;
}

- (UIActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4 peopleSuggestionBundleIds:(id)a5
{
  id v8 = a5;
  id v9 = [(UIActivityViewController *)self initWithActivityItems:a3 applicationActivities:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    peopleSuggestionBundleIds = v9->_peopleSuggestionBundleIds;
    v9->_peopleSuggestionBundleIds = (NSArray *)v10;
  }
  return v9;
}

- (UIActivityViewController)initWithUserDefaults:(id)a3 userDefaultsIdentifier:(id)a4 applicationActivities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(UIActivityViewController *)self initWithActivityItems:MEMORY[0x1E4F1CBF0] applicationActivities:a5];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userDefaults, a3);
    uint64_t v13 = [v10 copy];
    userDefaultsIdentifier = v12->_userDefaultsIdentifier;
    v12->_userDefaultsIdentifier = (NSString *)v13;
  }
  return v12;
}

- (UIActivityViewController)initWithActivityItems:(NSArray *)activityItems applicationActivities:(NSArray *)applicationActivities
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = activityItems;
  id v9 = applicationActivities;
  v26.receiver = self;
  v26.super_class = (Class)UIActivityViewController;
  id v10 = [(UIActivityViewController *)&v26 initWithNibName:0 bundle:0];
  if (v10)
  {
    v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v14 = NSString;
        id v4 = [(NSArray *)v9 valueForKeyPath:@"activityType"];
        v5 = [v4 componentsJoinedByString:@", "];
        v15 = [v14 stringWithFormat:@", applicationActivities (%@)", v5];
      }
      else
      {
        v15 = &stru_1EF308000;
      }
      *(_DWORD *)buf = 138412802;
      id v28 = v13;
      __int16 v29 = 2112;
      v30 = v8;
      __int16 v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_DEFAULT, "%@: initialized with activityItems (%@)%@", buf, 0x20u);
      if (v9)
      {
      }
    }

    v10->_creationTimestamp = mach_continuous_time();
    uint64_t v16 = [(NSArray *)v8 copy];
    v17 = v10->_activityItems;
    v10->_activityItems = (NSArray *)v16;

    uint64_t v18 = [(NSArray *)v9 copy];
    v19 = v10->_applicationActivities;
    v10->_applicationActivities = (NSArray *)v18;

    v10->_allowsProminentActivity = 1;
    v10->_collaborationMode = 6;
    v20 = share_sheet_log();
    v21 = share_sheet_log();
    os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, v10);

    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "InitializeUIAVC", " enableTelemetry=YES ", buf, 2u);
    }

    [(UIActivityViewController *)v10 setModalPresentationStyle:+[UIActivityViewController _defaultPlatformPresentationStyle]];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__UIActivityViewController_initWithActivityItems_applicationActivities___block_invoke;
    block[3] = &unk_1E5A21900;
    v25 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return v10;
}

uint64_t __72__UIActivityViewController_initWithActivityItems_applicationActivities___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createMainPresenterIfNeeded];
}

- (void)dealloc
{
  v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating UIAVC", buf, 2u);
  }

  +[_UIActivityItemMapping _clearActivityItems:self];
  v4.receiver = self;
  v4.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v4 dealloc];
}

- (void)_createMainPresenterIfNeeded
{
  if (!self->_mainPresenter)
  {
    id v5 = [(UIActivityViewController *)self _createContextFromCurrentState];
    v3 = +[SHSheetFactory createMainPresenterWithContext:v5];
    mainPresenter = self->_mainPresenter;
    self->_mainPresenter = v3;

    [(SHSheetPresenter *)self->_mainPresenter setDelegate:self];
  }
}

- (id)_createContextFromCurrentState
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [SHSheetContext alloc];
  objc_super v4 = [(UIActivityViewController *)self activityItems];
  id v5 = [(SHSheetContext *)v3 initWithActivityViewController:self activityItems:v4];

  v6 = [(UIActivityViewController *)self applicationActivities];
  [(SHSheetContext *)v5 setApplicationActivities:v6];

  v7 = [(UIActivityViewController *)self excludedActivityTypes];
  [(SHSheetContext *)v5 setExcludedActivityTypes:v7];

  id v8 = [(UIActivityViewController *)self includedActivityTypes];
  [(SHSheetContext *)v5 setIncludedActivityTypes:v8];

  [(SHSheetContext *)v5 setExcludedActivityCategories:[(UIActivityViewController *)self excludedActivityCategories]];
  id v9 = [(UIActivityViewController *)self activityTypeOrder];
  [(SHSheetContext *)v5 setActivityTypeOrder:v9];

  [(SHSheetContext *)v5 setShowKeyboardAutomatically:[(UIActivityViewController *)self showKeyboardAutomatically]];
  [(SHSheetContext *)v5 setWhitelistActionActivitiesOnly:[(UIActivityViewController *)self whitelistActionActivitiesOnly]];
  [(SHSheetContext *)v5 setSharingStyle:[(UIActivityViewController *)self sharingStyle]];
  id v10 = [(UIActivityViewController *)self heroActionActivityTypes];
  [(SHSheetContext *)v5 setHeroActionActivityTypes:v10];

  [(SHSheetContext *)v5 setShowHeroActionsHorizontally:[(UIActivityViewController *)self showHeroActionsHorizontally]];
  [(SHSheetContext *)v5 setIsContentManaged:[(UIActivityViewController *)self isContentManaged]];
  [(SHSheetContext *)v5 setAllowsEmbedding:[(UIActivityViewController *)self allowsEmbedding]];
  v11 = [(UIActivityViewController *)self objectManipulationDelegate];
  [(SHSheetContext *)v5 setObjectManipulationDelegate:v11];

  [(SHSheetContext *)v5 setShouldSuggestFamilyMembers:[(UIActivityViewController *)self shouldSuggestFamilyMembers]];
  [(SHSheetContext *)v5 setAllowsProminentActivity:[(UIActivityViewController *)self allowsProminentActivity]];
  id v12 = [(UIActivityViewController *)self photosHeaderMetadata];
  [(SHSheetContext *)v5 setPhotosHeaderMetadata:v12];

  [(SHSheetContext *)v5 setConfigureForCloudSharing:[(UIActivityViewController *)self configureForCloudSharing]];
  [(SHSheetContext *)v5 setConfigureForPhotosEdit:[(UIActivityViewController *)self configureForPhotosEdit]];
  [(SHSheetContext *)v5 setHideHeaderView:[(UIActivityViewController *)self hideHeaderView]];
  [(SHSheetContext *)v5 setHideNavigationBar:[(UIActivityViewController *)self hideNavigationBar]];
  [(SHSheetContext *)v5 setHideSuggestions:[(UIActivityViewController *)self hideSuggestions]];
  id v13 = [(UIActivityViewController *)self topContentSectionText];
  [(SHSheetContext *)v5 setTopContentSectionText:v13];

  v14 = [(UIActivityViewController *)self _selectedAssetIdentifiers];
  [(SHSheetContext *)v5 setSelectedAssetIdentifiers:v14];

  v15 = [(UIActivityViewController *)self peopleSuggestionBundleIds];
  [(SHSheetContext *)v5 setPeopleSuggestionBundleIds:v15];

  uint64_t v16 = [(UIActivityViewController *)self cachedActivityItemsConfiguration];
  v17 = +[UIActivityViewController collaborationModeRestrictionFromActivityItemsConfiguration:v16 collaborationMode:[(UIActivityViewController *)self collaborationMode]];
  [(SHSheetContext *)v5 setCollaborationModeRestriction:v17];

  uint64_t v18 = [(UIActivityViewController *)self managedFileURL];
  [(SHSheetContext *)v5 setManagedFileURL:v18];

  [(SHSheetContext *)v5 setShowCustomScene:[(UIActivityViewController *)self showCustomScene]];
  v19 = share_sheet_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    os_signpost_id_t v22 = v5;
    _os_log_impl(&dword_1A0AD8000, v19, OS_LOG_TYPE_DEFAULT, "UIAVC: create context:%@", (uint8_t *)&v21, 0xCu);
  }

  return v5;
}

- (_UIRemoteSheet)_remoteSheet
{
  v2 = [(UIActivityViewController *)self mainPresenter];
  v3 = [v2 remoteSheet];

  return (_UIRemoteSheet *)v3;
}

- (UIActivity)activity
{
  v2 = [(UIActivityViewController *)self mainPresenter];
  v3 = [v2 currentActivity];

  return (UIActivity *)v3;
}

- (void)setAllowsEmbedding:(BOOL)a3
{
  if (self->_allowsEmbedding != a3) {
    self->_allowsEmbedding = a3;
  }
}

- (void)setCustomViewControllerVerticalInset:(double)a3
{
  objc_super v4 = [NSNumber numberWithDouble:a3];
  [(UIActivityViewController *)self setCustomViewControllerVerticalInsetWrapper:v4];

  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 updateCustomView];
}

- (double)customViewControllerVerticalInset
{
  v2 = [(UIActivityViewController *)self customViewControllerVerticalInsetWrapper];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (void)setCustomViewControllerSectionHeight:(double)a3
{
  double v4 = [NSNumber numberWithDouble:a3];
  [(UIActivityViewController *)self setCustomViewControllerSectionHeightWrapper:v4];

  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 updateCustomView];
}

- (double)customViewControllerSectionHeight
{
  v2 = [(UIActivityViewController *)self customViewControllerSectionHeightWrapper];
  [v2 floatValue];
  double v4 = v3;

  return v4;
}

- (void)setPhotosCarouselViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  if (!_ShareSheetCanUseCustomViewController())
  {
    id v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[UIActivityViewController setPhotosCarouselViewController:]((uint64_t)v5, v10);
    }
    goto LABEL_9;
  }
  if (self->_photosCarouselViewController != v5)
  {
    objc_storeStrong((id *)&self->_photosCarouselViewController, a3);
    v6 = [(UIActivityViewController *)self presentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [(UIActivityViewController *)self presentationController];
      [(UIActivityViewController *)self _updateSheetPresentationController:v8];
      id v9 = [(UIActivityViewController *)self mainPresenter];

      if (v9)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __60__UIActivityViewController_setPhotosCarouselViewController___block_invoke;
        v11[3] = &unk_1E5A21900;
        void v11[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v11 animations:0.5];
        goto LABEL_10;
      }
    }
    id v10 = [(UIActivityViewController *)self mainPresenter];
    [v10 updateCustomView];
LABEL_9:
  }
LABEL_10:
}

void __60__UIActivityViewController_setPhotosCarouselViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _window];
  [v2 layoutIfNeeded];

  id v3 = [*(id *)(a1 + 32) mainPresenter];
  [v3 updateCustomView];
}

+ (int64_t)_defaultPlatformPresentationStyle
{
  if (_ShareSheetPlatformPrefersPopover()) {
    return 7;
  }
  if ((dyld_program_sdk_at_least() & 1) != 0 || [a1 isMemberOfClass:objc_opt_class()]) {
    return 2;
  }
  return 5;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  if (![(UIActivityViewController *)self allowsEmbedding]
    && ![(UIActivityViewController *)self allowsCustomPresentationStyle])
  {
    a3 = +[UIActivityViewController _defaultPlatformPresentationStyle];
  }
  if (_ShareSheetPlatformPrefersPopover())
  {
    if (a3 == 2) {
      double v5 = _ShareSheetFormSheetSize();
    }
    else {
      double v5 = _ShareSheetPopoverSize();
    }
  }
  else
  {
    double v5 = _ShareSheetDefaultSheetSize();
  }
  [(UIActivityViewController *)self setPreferredContentSize:v5];
  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v6 setModalPresentationStyle:a3];
}

- (void)setIsContentManaged:(BOOL)a3
{
  if (self->_isContentManaged != a3)
  {
    BOOL v3 = a3;
    self->_isContentManaged = a3;
    id v4 = [(UIActivityViewController *)self mainPresenter];
    [v4 setIsContentManaged:v3];
  }
}

- (void)setAllowsProminentActivity:(BOOL)allowsProminentActivity
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_allowsProminentActivity != allowsProminentActivity)
  {
    BOOL v3 = allowsProminentActivity;
    double v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v6 = "no";
      if (v3) {
        objc_super v6 = "yes";
      }
      int v7 = 136315138;
      id v8 = v6;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "SharePlay: Setting allowsProminentActivity to %s", (uint8_t *)&v7, 0xCu);
    }

    self->_allowsProminentActivity = v3;
  }
}

- (NSString)sessionIdentifier
{
  v2 = [(UIActivityViewController *)self mainPresenter];
  BOOL v3 = [v2 sessionIdentifier];

  return (NSString *)v3;
}

- (id)activityItemsConfiguration
{
  BOOL v3 = [(UIActivityViewController *)self mainPresenter];
  int v4 = [v3 isCollaborationSelected];

  if (v4)
  {
    double v5 = [(UIActivityViewController *)self clientActivityItemsConfigurationSource];
    [v5 activityItemsConfiguration];
  }
  else
  {
    double v5 = [(UIActivityViewController *)self mainPresenter];
    [v5 createActivityItemsConfiguration];
  objc_super v6 = };

  return v6;
}

+ (id)collaborationModeRestrictionFromActivityItemsConfiguration:(id)a3 collaborationMode:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = 0;
  if (a4 != 6)
  {
    if (a4 != 4)
    {
      if (a4 != 2) {
        goto LABEL_8;
      }
    }
    objc_super v6 = [[UIActivityCollaborationModeRestriction alloc] initWithDisabledMode:0];
  }
  if (v5)
  {
    int v7 = +[_UIActivityItemsConfigurationActivityItemProvider metadataForKey:@"collaborationModeRestrictions" expectedClass:objc_opt_class() activityItemsConfiguration:v5 itemAtSourceIndex:0];
    uint64_t v8 = [v7 firstObject];

    objc_super v6 = (UIActivityCollaborationModeRestriction *)v8;
  }
LABEL_8:

  return v6;
}

- (void)setExcludedActivitySectionTypes:(unint64_t)a3
{
}

- (unint64_t)excludedActivitySectionTypes
{
  return [(UIActivityViewController *)self hideSuggestions];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v6 viewDidLoad];
  [(UIActivityViewController *)self _createMainPresenterIfNeeded];
  BOOL v3 = [(UIActivityViewController *)self mainPresenter];
  [v3 prepareViewIfNeeded];

  int v4 = [(UIActivityViewController *)self mainPresenter];
  [v4 updateCustomView];

  id v5 = [(UIActivityViewController *)self view];
  [v5 setTintAdjustmentMode:1];

  if ([(UIActivityViewController *)self allowsEmbedding]) {
    [(UIActivityViewController *)self setModalPresentationStyle:-1];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v7 viewIsAppearing:a3];
  int v4 = [(UIActivityViewController *)self view];
  id v5 = [v4 window];

  if (v5)
  {
    objc_super v6 = [(UIActivityViewController *)self mainPresenter];
    [v6 present];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  -[UIActivityViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 activityViewControllerSizeWillChange:self];
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  id v4 = a3;
  [(UIActivityViewController *)&v6 traitCollectionDidChange:v4];
  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 activityViewController:self traitCollectionDidChange:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v16[3] = *MEMORY[0x1E4F143B8];
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "UIAVC: view will appear", buf, 2u);
  }

  v15[0] = @"Process-ID";
  objc_super v6 = [NSNumber numberWithInt:getpid()];
  v16[0] = v6;
  v16[1] = &unk_1EF33A108;
  v15[1] = @"Status";
  v15[2] = @"Timestamp";
  objc_super v7 = [MEMORY[0x1E4F1C9C8] date];
  v16[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  softLinkPLLogRegisteredEvent(23, @"UIKit-Activity", (uint64_t)v8, 0);
  if (![(UIActivityViewController *)self viewWillAppearTimestamp]) {
    [(UIActivityViewController *)self setViewWillAppearTimestamp:mach_continuous_time()];
  }
  uint64_t v9 = [(UIActivityViewController *)self presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v11 = 1;
    [v10 _setIgnoresKeyboardNotifications:1];
    [v10 _setBackgroundBlurDisabled:1];
    if (([v10 _centersPopoverIfSourceViewNotSet] & 1) == 0) {
      uint64_t v11 = dyld_program_sdk_at_least() ^ 1;
    }
    [v10 _setCentersPopoverIfSourceViewNotSet:v11];
  }
  id v12 = [(UIActivityViewController *)self mainPresenter];
  [v12 activityViewControllerWillAppear:self];

  v13.receiver = self;
  v13.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v13 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v11 viewDidAppear:a3];
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC: view did appear", v10, 2u);
  }

  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 activityViewControllerDidAppear:self];

  objc_super v6 = [(UIActivityViewController *)self view];
  objc_super v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];

  uint64_t v9 = [v8 activityItemsConfigurationSource];
  [(UIActivityViewController *)self setClientActivityItemsConfigurationSource:v9];

  [v8 setActivityItemsConfigurationSource:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v14 viewWillDisappear:a3];
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v13 = 0;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC: view will disappear", v13, 2u);
  }

  v15[0] = @"Process-ID";
  id v5 = [NSNumber numberWithInt:getpid()];
  v16[0] = v5;
  v16[1] = &unk_1EF33A120;
  v15[1] = @"Status";
  v15[2] = @"Timestamp";
  objc_super v6 = [MEMORY[0x1E4F1C9C8] date];
  v16[2] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  softLinkPLLogRegisteredEvent(23, @"UIKit-Activity", (uint64_t)v7, 0);
  uint64_t v8 = [(UIActivityViewController *)self mainPresenter];
  [v8 activityViewControllerWillDisappear:self];

  uint64_t v9 = [(UIActivityViewController *)self view];
  id v10 = [v9 window];
  objc_super v11 = [v10 windowScene];

  id v12 = [(UIActivityViewController *)self clientActivityItemsConfigurationSource];
  [v11 setActivityItemsConfigurationSource:v12];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v7 viewDidDisappear:a3];
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC: view did disappear", v6, 2u);
  }

  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 activityViewControllerDidDisappear:self];

  [(UIActivityViewController *)self setDidStartDelayingPresentation:0];
  [(UIActivityViewController *)self setDidEndDelayingPresentation:0];
  [(UIActivityViewController *)self setClientAttemptedInitialPresentationOrEmbeddingTimestamp:0];
  [(UIActivityViewController *)self setViewWillAppearTimestamp:0];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v4 viewSafeAreaInsetsDidChange];
  BOOL v3 = [(UIActivityViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)_viewControllerPresentationDidInitiate
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: viewControllerPresnetationDidInitiate", v6, 2u);
  }

  [(UIActivityViewController *)self _createMainPresenterIfNeeded];
  objc_super v4 = [(UIActivityViewController *)self mainPresenter];
  int v5 = [v4 useRemoteUIService];

  if (v5) {
    [(UIActivityViewController *)self loadViewIfNeeded];
  }
  [(UIActivityViewController *)self _delayPresentationIfNeeded];
}

- (void)_delayPresentationIfNeeded
{
  id v8 = [(UIActivityViewController *)self mainPresenter];
  if ([v8 useRemoteUIService]
    && ![(UIActivityViewController *)self didStartDelayingPresentation])
  {
    BOOL v3 = [(UIActivityViewController *)self didEndDelayingPresentation];

    if (!v3)
    {
      [(UIActivityViewController *)self setDidStartDelayingPresentation:1];
      objc_super v4 = share_sheet_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Beginning presentation delay", buf, 2u);
      }

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__UIActivityViewController__delayPresentationIfNeeded__block_invoke;
      v9[3] = &unk_1E5A22550;
      v9[4] = self;
      [(UIActivityViewController *)self _beginDelayingPresentation:v9 cancellationHandler:3.0];
      int v5 = share_sheet_log();
      objc_super v6 = share_sheet_log();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PresentShareSheetDelayed", " enableTelemetry=YES ", buf, 2u);
      }
    }
  }
  else
  {
  }
}

uint64_t __54__UIActivityViewController__delayPresentationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = NSStringFromBOOL();
    int v10 = 138412290;
    objc_super v11 = v5;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Presentation delay cancellation handler didTimeout: %@", (uint8_t *)&v10, 0xCu);
  }
  if (a2)
  {
    objc_super v6 = share_sheet_log();
    os_signpost_id_t v7 = share_sheet_log();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v10) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v6, OS_SIGNPOST_EVENT, v8, "ShareSheetDelayPresentationDidTimeout", (const char *)&unk_1A0BA1E03, (uint8_t *)&v10, 2u);
    }
  }
  return a2;
}

- (void)_readyToInteract
{
  BOOL v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: ready to interact", buf, 2u);
  }

  objc_super v4 = [(UIActivityViewController *)self _shareSheetReadyToInteractHandler];
  [(UIActivityViewController *)self _setShareSheetReadyToInteractHandler:0];
  int v5 = (void *)*MEMORY[0x1E4FB2608];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__UIActivityViewController__readyToInteract__block_invoke;
  v7[3] = &unk_1E5A22578;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 _performBlockAfterCATransactionCommits:v7];
}

uint64_t __44__UIActivityViewController__readyToInteract__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setReadyToInteractTimestamp:mach_continuous_time()];
  if ([*(id *)(a1 + 32) clientAttemptedInitialPresentationOrEmbeddingTimestamp])
  {
    v2 = share_sheet_log();
    if (os_signpost_enabled(v2))
    {
      uint64_t v3 = [*(id *)(a1 + 32) clientAttemptedInitialPresentationOrEmbeddingTimestamp];
      int v7 = 134349056;
      uint64_t v8 = v3;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetLoad", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v7, 0xCu);
    }

    objc_super v4 = share_sheet_log();
    if (os_signpost_enabled(v4))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetLoad", (const char *)&unk_1A0BA1E03, (uint8_t *)&v7, 2u);
    }

    int v5 = share_sheet_log();
    if (os_signpost_enabled(v5))
    {
      LOWORD(v7) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "InitialContentUpdate", (const char *)&unk_1A0BA1E03, (uint8_t *)&v7, 2u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_endDelayingPresentation
{
  if (![(UIActivityViewController *)self didEndDelayingPresentation])
  {
    uint64_t v3 = share_sheet_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Ending presentation delay", buf, 2u);
    }

    [(UIActivityViewController *)self setDidEndDelayingPresentation:1];
    objc_super v4 = share_sheet_log();
    int v5 = share_sheet_log();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PresentShareSheetDelayed", " enableTelemetry=YES ", buf, 2u);
    }

    v7.receiver = self;
    v7.super_class = (Class)UIActivityViewController;
    [(UIActivityViewController *)&v7 _endDelayingPresentation];
  }
}

- (void)__viewControllerWillBePresented:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v9 __viewControllerWillBePresented:a3];
  if (![(UIActivityViewController *)self clientAttemptedInitialPresentationOrEmbeddingTimestamp])
  {
    [(UIActivityViewController *)self setClientAttemptedInitialPresentationOrEmbeddingTimestamp:mach_continuous_time()];
    objc_super v4 = share_sheet_log();
    int v5 = share_sheet_log();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, self);

    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PresentShareSheet", " enableTelemetry=YES ", v8, 2u);
    }
  }
  [(UIActivityViewController *)self _createMainPresenterIfNeeded];
  objc_super v7 = [(UIActivityViewController *)self mainPresenter];
  [v7 activityViewControllerWillBePresented:self];
}

- (double)_displayHeight
{
  if (![(UIActivityViewController *)self clientAttemptedInitialPresentationOrEmbeddingTimestamp])[(UIActivityViewController *)self setClientAttemptedInitialPresentationOrEmbeddingTimestamp:mach_continuous_time()]; {
  [(UIActivityViewController *)self _createMainPresenterIfNeeded];
  }
  uint64_t v3 = [(UIActivityViewController *)self mainPresenter];
  [v3 activityViewControllerWillBeEmbedded:self];

  [(UIActivityViewController *)self preferredContentSize];
  return v4;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  double v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return a3 != 2 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIActivityViewController *)self _updateSheetPresentationController:v5];
  }
}

- (id)_presentationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  objc_super v7 = (objc_class *)MEMORY[0x1E4FB2130];
  id v8 = a4;
  id v9 = a3;
  int v10 = (void *)[[v7 alloc] initWithPresentedViewController:v9 presentingViewController:v8];

  [(UIActivityViewController *)self _updateSheetPresentationController:v10];
  return v10;
}

- (void)_updateSheetPresentationController:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 _setShouldDismissWhenTappedOutside:1];
  id v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    objc_super v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 _referenceBounds];
    double v9 = v8;
    double v11 = v10;

    uint64_t v12 = [(UIActivityViewController *)self customViewController];
    if (v12) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v9 != 320.0 || v11 != 568.0;
    }
    [v4 _setWantsBottomAttachedInCompactHeight:v13];

    [v4 _setWidthFollowsPreferredContentSizeWhenBottomAttached:1];
    objc_super v14 = [(UIActivityViewController *)self includedActivityTypes];
    if ([v14 containsObject:@"com.apple.UIKit.activity.AirDrop"])
    {
      v15 = [(UIActivityViewController *)self includedActivityTypes];
      BOOL v16 = [v15 count] == 1;
    }
    else
    {
      BOOL v16 = 0;
    }

    v17 = [(UIActivityViewController *)self traitCollection];
    uint64_t v18 = [v17 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v18))
    {
    }
    else
    {
      v19 = [(UIActivityViewController *)self customViewController];

      if (!v19)
      {
        if (v16) {
          goto LABEL_15;
        }
        v20 = [MEMORY[0x1E4FB22A0] _mediumDetent];
        int v21 = objc_msgSend(MEMORY[0x1E4FB22A0], "_largeDetent", v20);
        v23[1] = v21;
        os_signpost_id_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        [v4 _setDetents:v22];

        goto LABEL_14;
      }
    }
    v20 = [MEMORY[0x1E4FB22A0] _largeDetent];
    v24[0] = v20;
    int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v4 _setDetents:v21];
LABEL_14:
  }
LABEL_15:
}

- (void)_performActivity:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 activityType];
    int v8 = 138412290;
    double v9 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "UIAVC: perform activity:%@", (uint8_t *)&v8, 0xCu);
  }
  objc_super v7 = [(UIActivityViewController *)self mainPresenter];
  [v7 performActivity:v4];
}

- (void)_executeActivity
{
  uint64_t v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: execute activity", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"_UIActivityViewControllerExecuteActivityNotification" object:self userInfo:0];
}

- (void)_primeExtensionDiscovery
{
  [(UIActivityViewController *)self _createMainPresenterIfNeeded];
  id v3 = [(UIActivityViewController *)self mainPresenter];
  [v3 preheatExtensionDiscovery];
}

- (void)_setSelectedAssetIdentifiers:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToArray:self->_selectedAssetIdentifiers] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedAssetIdentifiers, a3);
    id v5 = [(UIActivityViewController *)self mainPresenter];
    [v5 setSelectedAssetIdentifiers:v6];
  }
}

- (void)_updateActivityItems:(id)a3
{
  id v4 = a3;
  id v5 = [(UIActivityViewController *)self applicationActivities];
  [(UIActivityViewController *)self _updateActivityItems:v4 applicationActivities:v5];
}

- (void)_reloadActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 reloadActivity:v4];
}

- (void)_updateActivityItems:(id)a3 applicationActivities:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = self->_activityItems;
  double v9 = (NSArray *)v6;
  uint64_t v10 = v9;
  if (v8 == v9)
  {
    int v11 = 0;
  }
  else if ((v9 != 0) == (v8 == 0))
  {
    int v11 = 1;
  }
  else
  {
    int v11 = [(NSArray *)v8 isEqual:v9] ^ 1;
  }

  uint64_t v12 = self->_applicationActivities;
  BOOL v13 = (NSArray *)v7;
  objc_super v14 = v13;
  if (v12 == v13)
  {
    int v15 = 0;
LABEL_10:

    if ((v11 | v15) != 1) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if ((v13 != 0) != (v12 == 0))
  {
    int v15 = [(NSArray *)v12 isEqual:v13] ^ 1;
    goto LABEL_10;
  }

LABEL_13:
  BOOL v16 = share_sheet_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138478083;
    v20 = v10;
    __int16 v21 = 2112;
    os_signpost_id_t v22 = v14;
    _os_log_impl(&dword_1A0AD8000, v16, OS_LOG_TYPE_DEFAULT, "UIAVC: update activity items:%{private}@ applicationActivities:%@", (uint8_t *)&v19, 0x16u);
  }

  [(UIActivityViewController *)self setActivityItems:v10];
  [(UIActivityViewController *)self setApplicationActivities:v14];
  v17 = [(UIActivityViewController *)self _createContextFromCurrentState];
  uint64_t v18 = [(UIActivityViewController *)self mainPresenter];
  [v18 updateWithContext:v17];

LABEL_16:
}

- (void)_cancel
{
  id v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "UIAVC: cancel", v5, 2u);
  }

  id v4 = [(UIActivityViewController *)self mainPresenter];
  [v4 dismiss];
}

- (id)_titleForActivity:(id)a3
{
  return 0;
}

- (void)_prepareActivity:(id)a3 completion:(id)a4
{
  id v7 = a4;
  [(UIActivityViewController *)self _prepareActivity:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return 1;
}

+ (double)_asyncPresentationTimeout
{
  return 0.5;
}

- (void)setCollaborationMode:(int64_t)a3
{
  self->_collaborationMode = a3;
  id v5 = [(UIActivityViewController *)self _createContextFromCurrentState];
  id v4 = [(UIActivityViewController *)self mainPresenter];
  [v4 updateWithContext:v5];
}

- (void)performAddToAlbumExtensionWithCompletionHandler:(id)a3
{
}

- (void)_performActivityWithType:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_ShareSheetHostCanPerformActivitySkippingShareSheet())
  {
    id v12 = v6;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    [(UIActivityViewController *)self setIncludedActivityTypes:v8];

    [(UIActivityViewController *)self _createMainPresenterIfNeeded];
    double v9 = [(UIActivityViewController *)self mainPresenter];
    [v9 prepareNonUIShareSheet];

    uint64_t v10 = [(UIActivityViewController *)self mainPresenter];
    [v10 performActivityWithType:v6 completionHandler:v7];

    id v7 = v10;
  }
  else
  {
    int v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_DEFAULT, "Not performing activity '%@' because entitlement is needed", buf, 0xCu);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)_findSupportedActivitiesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(UIActivityViewController *)self _createMainPresenterIfNeeded];
  id v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 prepareNonUIShareSheet];

  id v6 = [(UIActivityViewController *)self mainPresenter];
  [v6 _findSupportedActivitiesWithCompletionHandler:v4];
}

- (void)_presentationControllerDidDismiss:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = self;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "UIAVC:%@ was dismissed manually.", (uint8_t *)&v5, 0xCu);
  }

  [(UIActivityViewController *)self _cancel];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v5 preferredContentSizeDidChangeForChildContentContainer:a3];
  id v4 = [(UIActivityViewController *)self view];
  [v4 setNeedsLayout];
}

- (BOOL)_allowsStylingSheetsAsCards
{
  uint64_t v3 = objc_opt_class();
  return [(UIActivityViewController *)self isMemberOfClass:v3];
}

- (BOOL)_requiresCustomPresentationController
{
  return [(UIActivityViewController *)self modalPresentationStyle] == 2;
}

- (void)_didResignContentViewControllerOfPopover:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIActivityViewController *)self mainPresenter];
  [v5 activityViewControllerDidResignContentViewControllerOfPopover:self];

  v6.receiver = self;
  v6.super_class = (Class)UIActivityViewController;
  [(UIActivityViewController *)&v6 _didResignContentViewControllerOfPopover:v4];
}

- (void)mainPresenterIsReadyToInteract:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(UIActivityViewController *)self _readyToInteract];
}

- (void)mainPresenter:(id)a3 willCompleteActivity:(id)a4 withSuccess:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = NSStringFromBOOL();
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "UIAVC: will complete activity:%@ success:%@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v10 = [(UIActivityViewController *)self preCompletionHandler];
  if (v10)
  {
    int v11 = [v7 activityType];
    ((void (**)(void, void *, BOOL))v10)[2](v10, v11, v5);

    [(UIActivityViewController *)self setPreCompletionHandler:0];
  }
}

- (void)mainPresenter:(id)a3 didCompleteActivity:(id)a4 withSuccess:(BOOL)a5 returnedItems:(id)a6 error:(id)a7
{
  BOOL v9 = a5;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  BOOL v14 = 1;
  if (dyld_program_sdk_at_least()
    && !v9
    && ([(UIActivityViewController *)self isBeingDismissed] & 1) == 0)
  {
    uint64_t v15 = [(UIActivityViewController *)self presentingViewController];
    BOOL v14 = v15 == 0;
  }
  uint64_t v16 = share_sheet_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromBOOL();
    uint64_t v18 = [v11 activityType];
    int v19 = NSStringFromBOOL();
    int v25 = 138413314;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v17;
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 2112;
    v32 = v18;
    __int16 v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_1A0AD8000, v16, OS_LOG_TYPE_DEFAULT, "UIAVC: did complete activity:%@ (success=%{public}@, error=%{public}@) activityType:%@ shouldCallCompletionHandler:%@", (uint8_t *)&v25, 0x34u);
  }
  if (v14)
  {
    v20 = [(UIActivityViewController *)self completionWithItemsHandler];
    uint64_t v21 = [(UIActivityViewController *)self completionHandler];
    os_signpost_id_t v22 = (void (**)(void, void, void))v21;
    if (v20)
    {
      uint64_t v23 = [v11 activityType];
      ((void (**)(void, void *, BOOL, id, id))v20)[2](v20, v23, v9, v12, v13);

      [(UIActivityViewController *)self setCompletionWithItemsHandler:0];
    }
    else if (v21)
    {
      v24 = [v11 activityType];
      ((void (**)(void, void *, BOOL))v22)[2](v22, v24, v9);

      [(UIActivityViewController *)self setCompletionHandler:0];
    }
  }
}

- (BOOL)isCollaborationSelected
{
  v2 = [(UIActivityViewController *)self mainPresenter];
  char v3 = [v2 isCollaborationSelected];

  return v3;
}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(UIActivityViewController *)self mainPresenter];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__UIActivityViewController_runScrollingTestWithName_type_completionHandler___block_invoke;
  v13[3] = &unk_1E5A225A0;
  id v15 = v9;
  int64_t v16 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  [v10 runScrollingTestWithName:v12 type:a4 completionHandler:v13];
}

uint64_t __76__UIActivityViewController_runScrollingTestWithName_type_completionHandler___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[6];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "did complete scrolling test with name:%@ type:%ld", (uint8_t *)&v6, 0x16u);
  }

  uint64_t result = a1[5];
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (UIActivityViewControllerCompletionHandler)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(UIActivityViewControllerCompletionHandler)completionHandler
{
}

- (UIActivityViewControllerCompletionWithItemsHandler)completionWithItemsHandler
{
  return self->_completionWithItemsHandler;
}

- (void)setCompletionWithItemsHandler:(UIActivityViewControllerCompletionWithItemsHandler)completionWithItemsHandler
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(NSArray *)excludedActivityTypes
{
}

- (BOOL)allowsProminentActivity
{
  return self->_allowsProminentActivity;
}

- (NSArray)activityItems
{
  return self->_activityItems;
}

- (void)setActivityItems:(id)a3
{
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
}

- (NSString)userDefaultsIdentifier
{
  return self->_userDefaultsIdentifier;
}

- (void)setUserDefaultsIdentifier:(id)a3
{
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
}

- (UIActivityItemsConfigurationReading)cachedActivityItemsConfiguration
{
  return self->_cachedActivityItemsConfiguration;
}

- (void)setCachedActivityItemsConfiguration:(id)a3
{
}

- (UIActivityItemsConfigurationProviding)clientActivityItemsConfigurationSource
{
  return self->_clientActivityItemsConfigurationSource;
}

- (void)setClientActivityItemsConfigurationSource:(id)a3
{
}

- (SHSheetPresenter)mainPresenter
{
  return self->_mainPresenter;
}

- (id)_activityPresentationCompletionHandler
{
  return self->_activityPresentationCompletionHandler;
}

- (void)_setActivityPresentationCompletionHandler:(id)a3
{
}

- (unint64_t)viewWillAppearTimestamp
{
  return self->_viewWillAppearTimestamp;
}

- (void)setViewWillAppearTimestamp:(unint64_t)a3
{
  self->_viewWillAppearTimestamp = a3;
}

- (unint64_t)readyToInteractTimestamp
{
  return self->_readyToInteractTimestamp;
}

- (void)setReadyToInteractTimestamp:(unint64_t)a3
{
  self->_readyToInteractTimestamp = a3;
}

- (unint64_t)creationTimestamp
{
  return self->_creationTimestamp;
}

- (void)setCreationTimestamp:(unint64_t)a3
{
  self->_creationTimestamp = a3;
}

- (unint64_t)clientAttemptedInitialPresentationOrEmbeddingTimestamp
{
  return self->_clientAttemptedInitialPresentationOrEmbeddingTimestamp;
}

- (void)setClientAttemptedInitialPresentationOrEmbeddingTimestamp:(unint64_t)a3
{
  self->_clientAttemptedInitialPresentationOrEmbeddingTimestamp = a3;
}

- (BOOL)didStartDelayingPresentation
{
  return self->_didStartDelayingPresentation;
}

- (void)setDidStartDelayingPresentation:(BOOL)a3
{
  self->_didStartDelayingPresentation = a3;
}

- (BOOL)didEndDelayingPresentation
{
  return self->_didEndDelayingPresentation;
}

- (void)setDidEndDelayingPresentation:(BOOL)a3
{
  self->_didEndDelayingPresentation = a3;
}

- (NSNumber)customViewControllerVerticalInsetWrapper
{
  return self->_customViewControllerVerticalInsetWrapper;
}

- (void)setCustomViewControllerVerticalInsetWrapper:(id)a3
{
}

- (NSNumber)customViewControllerSectionHeightWrapper
{
  return self->_customViewControllerSectionHeightWrapper;
}

- (void)setCustomViewControllerSectionHeightWrapper:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (id)_shareSheetReadyToInteractHandler
{
  return self->_shareSheetReadyToInteractHandler;
}

- (void)_setShareSheetReadyToInteractHandler:(id)a3
{
}

- (id)preCompletionHandler
{
  return self->_preCompletionHandler;
}

- (void)setPreCompletionHandler:(id)a3
{
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
}

- (int64_t)excludedActivityCategories
{
  return self->_excludedActivityCategories;
}

- (void)setExcludedActivityCategories:(int64_t)a3
{
  self->_excludedActivityCategories = a3;
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
}

- (BOOL)allowsCustomPresentationStyle
{
  return self->_allowsCustomPresentationStyle;
}

- (void)setAllowsCustomPresentationStyle:(BOOL)a3
{
  self->_allowsCustomPresentationStyle = a3;
}

- (BOOL)allowsEmbedding
{
  return self->_allowsEmbedding;
}

- (BOOL)showKeyboardAutomatically
{
  return self->_showKeyboardAutomatically;
}

- (void)setShowKeyboardAutomatically:(BOOL)a3
{
  self->_showKeyboardAutomatically = a3;
}

- (BOOL)whitelistActionActivitiesOnly
{
  return self->_whitelistActionActivitiesOnly;
}

- (void)setWhitelistActionActivitiesOnly:(BOOL)a3
{
  self->_whitelistActionActivitiesOnly = a3;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (void)setHideHeaderView:(BOOL)a3
{
  self->_hideHeaderView = a3;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (void)setHideNavigationBar:(BOOL)a3
{
  self->_hideNavigationBar = a3;
}

- (BOOL)hideSuggestions
{
  return self->_hideSuggestions;
}

- (void)setHideSuggestions:(BOOL)a3
{
  self->_hideSuggestions = a3;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (void)setTopContentSectionText:(id)a3
{
}

- (int64_t)sharingStyle
{
  return self->_sharingStyle;
}

- (void)setSharingStyle:(int64_t)a3
{
  self->_sharingStyle = a3;
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (void)setHeroActionActivityTypes:(id)a3
{
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (void)setShowHeroActionsHorizontally:(BOOL)a3
{
  self->_showHeroActionsHorizontally = a3;
}

- (BOOL)showCustomScene
{
  return self->_showCustomScene;
}

- (void)setShowCustomScene:(BOOL)a3
{
  self->_showCustomScene = a3;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (void)setActivity:(id)a3
{
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (UIActivityViewControllerAirDropDelegate)airDropDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airDropDelegate);
  return (UIActivityViewControllerAirDropDelegate *)WeakRetained;
}

- (void)setAirDropDelegate:(id)a3
{
}

- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectManipulationDelegate);
  return (UIActivityViewControllerObjectManipulationDelegate *)WeakRetained;
}

- (void)setObjectManipulationDelegate:(id)a3
{
}

- (UIActivityViewControllerCollaborationDelegate)collaborationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collaborationDelegate);
  return (UIActivityViewControllerCollaborationDelegate *)WeakRetained;
}

- (void)setCollaborationDelegate:(id)a3
{
}

- (int64_t)collaborationMode
{
  return self->_collaborationMode;
}

- (UIViewController)photosCarouselViewController
{
  return self->_photosCarouselViewController;
}

- (LPLinkMetadata)photosHeaderMetadata
{
  return self->_photosHeaderMetadata;
}

- (void)setPhotosHeaderMetadata:(id)a3
{
}

- (UIViewController)photosStackViewController
{
  return self->_photosStackViewController;
}

- (void)setPhotosStackViewController:(id)a3
{
}

- (UIActivityViewControllerPhotosDelegate)photosDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photosDelegate);
  return (UIActivityViewControllerPhotosDelegate *)WeakRetained;
}

- (void)setPhotosDelegate:(id)a3
{
}

- (BOOL)enableNewDesignInPhotos
{
  return self->_enableNewDesignInPhotos;
}

- (void)setEnableNewDesignInPhotos:(BOOL)a3
{
  self->_enableNewDesignInPhotos = a3;
}

- (NSDictionary)_initialPhotosAssetDetails
{
  return self->_initialPhotosAssetDetails;
}

- (void)_setInitialPhotosAssetDetails:(id)a3
{
}

- (NSArray)_selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (NSSet)_photosAssetIdentifiers
{
  return self->_photosAssetIdentifiers;
}

- (void)_setPhotosAssetIdentifiers:(id)a3
{
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (void)setConfigureForPhotosEdit:(BOOL)a3
{
  self->_configureForPhotosEdit = a3;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (void)setConfigureForCloudSharing:(BOOL)a3
{
  self->_configureForCloudSharing = a3;
}

- (NSURL)managedFileURL
{
  return self->_managedFileURL;
}

- (void)setManagedFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedFileURL, 0);
  objc_storeStrong((id *)&self->_photosAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_initialPhotosAssetDetails, 0);
  objc_destroyWeak((id *)&self->_photosDelegate);
  objc_storeStrong((id *)&self->_photosStackViewController, 0);
  objc_storeStrong((id *)&self->_photosHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_photosCarouselViewController, 0);
  objc_destroyWeak((id *)&self->_collaborationDelegate);
  objc_destroyWeak((id *)&self->_objectManipulationDelegate);
  objc_destroyWeak((id *)&self->_airDropDelegate);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong(&self->_preCompletionHandler, 0);
  objc_storeStrong(&self->_shareSheetReadyToInteractHandler, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_customViewControllerSectionHeightWrapper, 0);
  objc_storeStrong((id *)&self->_customViewControllerVerticalInsetWrapper, 0);
  objc_storeStrong(&self->_activityPresentationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mainPresenter, 0);
  objc_storeStrong((id *)&self->_clientActivityItemsConfigurationSource, 0);
  objc_storeStrong((id *)&self->_cachedActivityItemsConfiguration, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_userDefaultsIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_applicationActivities, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong(&self->_completionWithItemsHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_remoteSheet, 0);
}

- (void)setPhotosCarouselViewController:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl(&dword_1A0AD8000, a2, OS_LOG_TYPE_ERROR, "setting a customViewController:%@ requires the entitlement  \"com.apple.sharesheet.allow-custom-view\"", (uint8_t *)&v5, 0xCu);
}

@end