@interface PREditingSceneViewController
+ (NSHashTable)overrideObservingViewControllers;
+ (id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides;
+ (id)role;
- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription;
- (ATXComplicationSet)inlineComplicationSuggestionSet;
- (BOOL)_areComplicationsDisallowed;
- (BOOL)_canAddComplicationDescriptor:(id)a3 forLocation:(int64_t)a4;
- (BOOL)_hasGraphicComplications;
- (BOOL)_hasSidebarComplications;
- (BOOL)_intentHasConfigurableAttributes:(id)a3;
- (BOOL)_isPosterCoveredByModalPresentation;
- (BOOL)_posterUserInfo:(id)a3 containsUserChangesFromPrevious:(id)a4;
- (BOOL)_presentIntentConfigurationForComplicationDescriptorIfPossible:(id)a3;
- (BOOL)_shouldAllowAddComplicationsTapGestureForLocation:(int64_t)a3;
- (BOOL)_shouldAllowGalleryPresentationForLocation:(int64_t)a3;
- (BOOL)_shouldAllowInlineComplicationTapGesture;
- (BOOL)_shouldDepthEffectBeDisallowed;
- (BOOL)allowsTransparentContent;
- (BOOL)areControlsHidden;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hostApplicationHasResignedActive;
- (BOOL)isAlternateDateEnabled;
- (BOOL)isClientPresentingModalViewController;
- (BOOL)isContentHidden;
- (BOOL)isDismissing;
- (BOOL)isDisplayingEditingButtons;
- (BOOL)isDraggingComplication;
- (BOOL)isHero;
- (BOOL)isTornDown;
- (BOOL)prefersStatusBarHidden;
- (BOOL)showsContentWhenReady;
- (BOOL)usesEditingLayout;
- (BSInvalidatable)localKeyboardFocusAssertion;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (CCUISConfiguredControl)controlIntentBeingConfigured;
- (CCUISControlsGalleryViewController)presentedControlsGallery;
- (CGRect)horizontalTitleBoundingRect;
- (CGRect)leadingTopButtonFrame;
- (CGRect)trailingTopButtonFrame;
- (CGRect)verticalTitleBoundingRect;
- (CHSWidgetExtensionProvider)controlExtensionProvider;
- (CHSWidgetExtensionProvider)widgetExtensionProvider;
- (NSArray)graphicComplicationSuggestionSets;
- (NSArray)presentationDismissalGestureViews;
- (NSDate)overrideDate;
- (NSDictionary)sidebarWidgetSuggestions;
- (NSHashTable)complicationContainerViewControllers;
- (NSMutableDictionary)engagementCountsForViewedSuggestedComplications;
- (NSString)posterRole;
- (NSString)titleString;
- (PFServerPosterPath)path;
- (PRComplicationDescriptor)selectedInlineComplication;
- (PRComplicationDescriptor)widgetBeingConfigured;
- (PREditingSceneClientSettingsDiffInspector)sceneClientSettingsDiffInspector;
- (PREditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7;
- (PREditingSceneViewControllerDelegate)delegate;
- (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout;
- (PREditingSceneViewControllerTopButtonLayout)lastValidDelegateTopButtonLayout;
- (PREditingSessionModifications)modifications;
- (PRIconListLayoutProvider)listLayoutProvider;
- (PRQuickActionEditingViewController)quickActionEditingViewController;
- (PRWidgetIconViewProvider)iconViewProvider;
- (SBHAddWidgetSheetConfigurationManager)addWidgetSheetConfigurationManager;
- (SBHIconModel)iconModel;
- (SBHPadAddSheetViewController)presentedSidebarComplicationsGallery;
- (UINavigationController)presentedInlineComplicationsGallery;
- (UIView)complicationsAddGestureView;
- (UIView)inlineComplicationGestureView;
- (UIView)recycledViewsContainer;
- (UIView)recycledViewsContainerView;
- (UIView)saveIndicatorContainerView;
- (UIView)sidebarComplicationAddGestureView;
- (UIView)sidebarComplicationGallerySourceView;
- (UIViewController)presentedComplicationsGallery;
- (WFWidgetConfigurationViewController)presentedComplicationWidgetConfigurationViewController;
- (WFWidgetConfigurationViewController)presentedControlWidgetConfigurationViewController;
- (double)titledButtonsAlpha;
- (id)_configureNavigationControllerForGalleryViewController:(id)a3;
- (id)_controlsGalleryConfiguration;
- (id)_controlsGallerySuggestedControls;
- (id)_descriptorForControl:(id)a3;
- (id)_presentIntentConfigurationViewControllerWithIntent:(id)a3 descriptor:(id)a4 family:(int64_t)a5 fromViewController:(id)a6;
- (id)_presentationBackgroundColor;
- (id)_suggestedControlIdentities;
- (id)_windowFromUserInfo:(id)a3;
- (id)addComplicationGestureViewForElement:(unint64_t)a3 tapAction:(SEL)a4 initiallyAllowed:(BOOL)a5;
- (id)addWidgetSheetConfigurationManager:(id)a3 containerBundleIdentiferForDescriptor:(id)a4;
- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4;
- (id)addWidgetSheetViewController:(id)a3 detailViewControllerForWidgetCollection:(id)a4;
- (id)addWidgetSheetViewControllerForAddWidgetSheetConfigurationManager:(id)a3;
- (id)galleryViewControllerForAddWidgetSheetViewController:(id)a3;
- (id)rootFolderForAddWidgetSheetConfigurationManager:(id)a3;
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4;
- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4;
- (int64_t)acceptButtonType;
- (int64_t)destination;
- (int64_t)focusedElement;
- (int64_t)quickActionIntentEditPosition;
- (int64_t)selectedQuickActionPosition;
- (int64_t)variant;
- (unint64_t)presenterType;
- (unint64_t)supportedInterfaceOrientations;
- (void)_addWidgetIconView:(id)a3;
- (void)_complicationsSceneCreated:(id)a3;
- (void)_configureInitialSceneSettings:(id)a3;
- (void)_configureUsingPath:(id)a3;
- (void)_dismissAnyPresentedComplicationGalleryAnimated:(BOOL)a3;
- (void)_dismissAnyPresentedComplicationGalleryAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)_dismissWithAction:(int64_t)a3;
- (void)_finalize;
- (void)_insertModularComplication:(id)a3 location:(int64_t)a4 animated:(BOOL)a5;
- (void)_performWidgetDescriptorDiscovery;
- (void)_prefetchComplicationSuggestions;
- (void)_presentComplicationGallery;
- (void)_presentControlsGalleryWithSelectedControl:(id)a3;
- (void)_presentFullAlertForComplication:(id)a3;
- (void)_presentInlineComplicationGallery;
- (void)_presentIntentConfigurationForComplicationDescriptor:(id)a3;
- (void)_presentIntentConfigurationForQuickActionControl:(id)a3 withPosition:(int64_t)a4;
- (void)_presentSidebarComplicationGallery;
- (void)_presentWidgetEducationAlertIfNeeded;
- (void)_quickActionsSceneCreated:(id)a3;
- (void)_sceneContentReadinessDidChange;
- (void)_setUpDateOverriding;
- (void)_setUpRemotePresentationForContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 presentedScreenRect:(CGRect)a5;
- (void)_teardown;
- (void)_unregisterComplicationContainerViewControllerDelegates;
- (void)_updateAddComplicationsTapGestureAllowed;
- (void)_updateApplicationWidgetCollectionsForPresentedComplicationGallery;
- (void)_updateComplicationContainerVisibility;
- (void)_updateComplicationsVibrancyConfiguration;
- (void)_updateLocalControlsHiddenWithAnimationSettings:(id)a3;
- (void)_updatePresentationDismissalGestureView;
- (void)_updateQuickActionsPosterConfigurationForPosition:(int64_t)a3 withControlConfiguration:(id)a4;
- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4;
- (void)_updateSceneSettingsForConfiguredWidgets;
- (void)_updateSceneSettingsForDepthEffectDisallowed;
- (void)_updateSceneSettingsForPosterCoveredByModalPresentation;
- (void)_validateInlineComplication;
- (void)addLongSaveOperationIndicator;
- (void)addObserver:(id)a3;
- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)addWidgetSheetViewControllerDidCancel:(id)a3;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)complicationContainerViewController:(id)a3 didEditComplication:(id)a4;
- (void)complicationContainerViewController:(id)a3 didUpdateModelContentForLocation:(int64_t)a4;
- (void)complicationContainerViewController:(id)a3 isAttemptingDragToAddComplication:(id)a4;
- (void)complicationContainerViewControllerDidTapAdd:(id)a3 forLocation:(int64_t)a4;
- (void)complicationGalleryViewController:(id)a3 didBeginDraggingComplication:(id)a4;
- (void)complicationGalleryViewController:(id)a3 didEndDraggingComplication:(id)a4 withOperation:(unint64_t)a5;
- (void)complicationGalleryViewController:(id)a3 didSelectWidgetIconView:(id)a4;
- (void)complicationGalleryViewControllerDidFinish:(id)a3;
- (void)controlsGalleryViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)dismissalOverlayViewDidDismiss:(id)a3;
- (void)extensionsDidChangeForExtensionProvider:(id)a3;
- (void)forwardAppearanceNotificationName:(id)a3;
- (void)inlineComplicationGalleryViewController:(id)a3 didSelectComplication:(id)a4;
- (void)inlineComplicationGalleryViewController:(id)a3 didToggleAlternateDate:(BOOL)a4;
- (void)inlineComplicationGalleryViewControllerDidFinish:(id)a3;
- (void)inlineComplicationGestureViewTapped:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentedViewControllerDismissalDidEnd:(id)a3;
- (void)presentedViewControllerDismissalWillBegin:(id)a3;
- (void)presentedViewControllerPresentationDidBegin:(id)a3;
- (void)quickActionEditingViewController:(id)a3 didRequestIntentConfigurationForControl:(id)a4 withPosition:(int64_t)a5;
- (void)quickActionEditingViewController:(id)a3 didSetControl:(id)a4 forPosition:(int64_t)a5;
- (void)quickActionEditingViewController:(id)a3 didTapAddForPosition:(int64_t)a4;
- (void)removeLongSaveOperationIndicator;
- (void)removeObserver:(id)a3;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)setAcceptButtonType:(int64_t)a3;
- (void)setAddWidgetSheetConfigurationManager:(id)a3;
- (void)setAllowsTransparentContent:(BOOL)a3;
- (void)setAlternateDateEnabled:(BOOL)a3;
- (void)setAppProtectionSubjectMonitorSubscription:(id)a3;
- (void)setClientPresentingModalViewController:(BOOL)a3;
- (void)setComplicationContainerViewControllers:(id)a3;
- (void)setComplicationsAddGestureView:(id)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setContentHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setContentHidden:(BOOL)a3 animationSettings:(id)a4 completion:(id)a5;
- (void)setControlExtensionProvider:(id)a3;
- (void)setControlIntentBeingConfigured:(id)a3;
- (void)setControlsHidden:(BOOL)a3;
- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setControlsHidden:(BOOL)a3 animationSettings:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDestination:(int64_t)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setDraggingComplication:(BOOL)a3;
- (void)setEngagementCountsForViewedSuggestedComplications:(id)a3;
- (void)setFocusedElement:(int64_t)a3;
- (void)setGraphicComplicationSuggestionSets:(id)a3;
- (void)setHero:(BOOL)a3;
- (void)setHorizontalTitleBoundingRect:(CGRect)a3;
- (void)setHostApplicationHasResignedActive:(BOOL)a3;
- (void)setIconModel:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setInlineComplicationGestureView:(id)a3;
- (void)setInlineComplicationSuggestionSet:(id)a3;
- (void)setLastValidDelegateTopButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a3;
- (void)setLeadingTopButtonFrame:(CGRect)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setLocalKeyboardFocusAssertion:(id)a3;
- (void)setModifications:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)setPath:(id)a3;
- (void)setPosterRole:(id)a3;
- (void)setPresentationDismissalGestureViews:(id)a3;
- (void)setPresentedComplicationWidgetConfigurationViewController:(id)a3;
- (void)setPresentedComplicationsGallery:(id)a3;
- (void)setPresentedControlWidgetConfigurationViewController:(id)a3;
- (void)setPresentedControlsGallery:(id)a3;
- (void)setPresentedInlineComplicationsGallery:(id)a3;
- (void)setPresentedSidebarComplicationsGallery:(id)a3;
- (void)setQuickActionEditingViewController:(id)a3;
- (void)setQuickActionIntentEditPosition:(int64_t)a3;
- (void)setRecycledViewsContainerView:(id)a3;
- (void)setSaveIndicatorContainerView:(id)a3;
- (void)setSceneClientSettingsDiffInspector:(id)a3;
- (void)setSelectedInlineComplication:(id)a3;
- (void)setSelectedQuickActionPosition:(int64_t)a3;
- (void)setShowsContentWhenReady:(BOOL)a3;
- (void)setSidebarComplicationAddGestureView:(id)a3;
- (void)setSidebarComplicationGallerySourceView:(id)a3;
- (void)setSidebarWidgetSuggestions:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setTitledButtonsAlpha:(double)a3;
- (void)setTornDown:(BOOL)a3;
- (void)setTrailingTopButtonFrame:(CGRect)a3;
- (void)setUsesEditingLayout:(BOOL)a3;
- (void)setUsesEditingLayout:(BOOL)a3 animated:(BOOL)a4;
- (void)setUsesEditingLayout:(BOOL)a3 animationSettings:(id)a4;
- (void)setVariant:(int64_t)a3;
- (void)setVerticalTitleBoundingRect:(CGRect)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)setWidgetBeingConfigured:(id)a3;
- (void)setWidgetExtensionProvider:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4;
- (void)widgetSuggestionsViewController:(id)a3 didSelectWidgetIconView:(id)a4;
@end

@implementation PREditingSceneViewController

- (PREditingSceneViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 additionalInfo:(id)a7
{
  id v13 = a4;
  self->_usesEditingLayout = 1;
  objc_storeStrong((id *)&self->_path, a4);
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  v18 = objc_alloc_init(PREditingSessionModifications);
  modifications = self->_modifications;
  self->_modifications = v18;

  v20 = [v13 serverIdentity];
  uint64_t v21 = [v20 type];

  if ((unint64_t)(v21 - 3) > 0xFFFFFFFFFFFFFFFDLL
    || ([v13 serverIdentity],
        v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 isIncomingConfiguration],
        v22,
        v23))
  {
    int64_t v24 = 1;
    self->_acceptButtonType = 1;
  }
  else
  {
    int64_t v24 = 2;
  }
  self->_destination = v24;
  v25 = [v13 serverIdentity];
  v26 = [v25 role];

  posterRole = self->_posterRole;
  self->_posterRole = v26;
  v28 = v26;

  [(PREditingSceneViewController *)self _setUpDateOverriding];
  +[PRPosterPathModelObjectCache invalidateModelObjectCacheForPath:v13];
  v31.receiver = self;
  v31.super_class = (Class)PREditingSceneViewController;
  v29 = [(PRSceneViewController *)&v31 initWithProvider:v17 contents:v13 configurableOptions:v16 configuredProperties:v15 additionalInfo:v14];

  return v29;
}

- (void)dealloc
{
  [(CHSWidgetExtensionProvider *)self->_widgetExtensionProvider unregisterObserver:self];
  [(CHSWidgetExtensionProvider *)self->_widgetExtensionProvider invalidate];
  [(CHSWidgetExtensionProvider *)self->_controlExtensionProvider invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  [(PREditingSceneViewController *)self _finalize];
  v4.receiver = self;
  v4.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v4 dealloc];
}

- (void)_teardown
{
  v3 = PRLogEditing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "editing tear down", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v5 _teardown];
  [(BSInvalidatable *)self->_localKeyboardFocusAssertion invalidate];
  localKeyboardFocusAssertion = self->_localKeyboardFocusAssertion;
  self->_localKeyboardFocusAssertion = 0;

  [(PREditingSceneViewController *)self setTornDown:1];
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v49 viewDidLoad];
  v3 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
  objc_super v4 = [v3 addMonitor:self subjectMask:1 subscriptionOptions:1];
  objc_storeWeak((id *)&self->_appProtectionSubjectMonitorSubscription, v4);

  objc_super v5 = [(PRSceneViewController *)self configuredProperties];
  v6 = [v5 titleStyleConfiguration];
  uint64_t v7 = [v6 isAlternateDateEnabled];

  [(PREditingSceneViewController *)self setAlternateDateEnabled:v7];
  if (![(PREditingSceneViewController *)self _areComplicationsDisallowed])
  {
    v8 = (SBHIconModel *)objc_alloc_init(MEMORY[0x1E4FA62B8]);
    iconModel = self->_iconModel;
    self->_iconModel = v8;

    [(SBHIconModel *)self->_iconModel reloadIcons];
    v10 = [[PRIconListLayoutProvider alloc] initWithGridSize:65540];
    listLayoutProvider = self->_listLayoutProvider;
    self->_listLayoutProvider = v10;

    v12 = [[PRWidgetIconViewProvider alloc] initWithRecycledViewsContainerProvider:self widgetInteractionDisabled:1 useMaterialBackground:0];
    iconViewProvider = self->_iconViewProvider;
    self->_iconViewProvider = v12;

    id v14 = (CHSWidgetExtensionProvider *)objc_alloc_init(MEMORY[0x1E4F58E40]);
    widgetExtensionProvider = self->_widgetExtensionProvider;
    self->_widgetExtensionProvider = v14;

    [(CHSWidgetExtensionProvider *)self->_widgetExtensionProvider registerObserver:self];
    id v16 = [PRComplicationDescriptor alloc];
    id v17 = [v5 complicationLayout];
    v18 = [v17 inlineComplication];
    v19 = [(PRComplicationDescriptor *)v16 initWithPRSWidget:v18];

    v20 = [v5 suggestionMetadata];
    uint64_t v21 = [v20 suggestedComplicationsByIdentifier];

    v22 = [(PRComplicationDescriptor *)v19 uniqueIdentifier];
    int v23 = [v21 objectForKey:v22];
    [(PRComplicationDescriptor *)v19 setSuggestedComplication:v23];

    [(PREditingSceneViewController *)self setSelectedInlineComplication:v19];
    [(PREditingSceneViewController *)self _validateInlineComplication];
    [(PREditingSceneViewController *)self setGraphicComplicationSuggestionSets:MEMORY[0x1E4F1CBF0]];
    [(PREditingSceneViewController *)self _prefetchComplicationSuggestions];
    modifications = self->_modifications;
    if (v19)
    {
      [(PREditingSessionModifications *)self->_modifications setContainedWidgetsBeforeEdit:1];
    }
    else
    {
      v25 = [v5 complicationLayout];
      v26 = [v25 complications];
      -[PREditingSessionModifications setContainedWidgetsBeforeEdit:](modifications, "setContainedWidgetsBeforeEdit:", [v26 count] != 0);
    }
    v27 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    complicationContainerViewControllers = self->_complicationContainerViewControllers;
    self->_complicationContainerViewControllers = v27;

    v29 = [(PREditingSceneViewController *)self addComplicationGestureViewForElement:8 tapAction:sel_addComplicationTapped_ initiallyAllowed:[(PREditingSceneViewController *)self _shouldAllowAddComplicationsTapGestureForLocation:0]];
    [(PREditingSceneViewController *)self setComplicationsAddGestureView:v29];
    v30 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v31 = [v30 userInterfaceIdiom];

    if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v32 = [(PREditingSceneViewController *)self addComplicationGestureViewForElement:16 tapAction:sel_addSidebarComplicationTapped_ initiallyAllowed:[(PREditingSceneViewController *)self _shouldAllowAddComplicationsTapGestureForLocation:1]];
      [(PREditingSceneViewController *)self setSidebarComplicationAddGestureView:v32];
    }
    v33 = [(PREditingSceneViewController *)self addComplicationGestureViewForElement:4 tapAction:sel_inlineComplicationGestureViewTapped_ initiallyAllowed:[(PREditingSceneViewController *)self _shouldAllowInlineComplicationTapGesture]];
    [(PREditingSceneViewController *)self setInlineComplicationGestureView:v33];
    v34 = objc_opt_new();
    [(PREditingSceneViewController *)self setEngagementCountsForViewedSuggestedComplications:v34];

    v35 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    sidebarComplicationGallerySourceView = self->_sidebarComplicationGallerySourceView;
    self->_sidebarComplicationGallerySourceView = v35;

    [(UIView *)self->_sidebarComplicationGallerySourceView setHidden:1];
    v37 = [(PREditingSceneViewController *)self view];
    [v37 addSubview:self->_sidebarComplicationGallerySourceView];

    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v38 addObserver:self selector:sel__complicationsSceneCreated_ name:@"PRBComplicationsSceneCreatedNotification" object:0];

    v39 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v39 addObserver:self selector:sel__quickActionsSceneCreated_ name:@"PRBQuickActionsSceneCreatedNotification" object:0];
  }
  v40 = [(PREditingSceneViewController *)self view];
  BOOL v41 = [(PREditingSceneViewController *)self isContentHidden];
  double v42 = 1.0;
  if (v41) {
    double v42 = 0.0;
  }
  [v40 setAlpha:v42];

  v43 = self->_modifications;
  v44 = [MEMORY[0x1E4F1C9C8] date];
  [(PREditingSessionModifications *)v43 setStartDate:v44];

  id v45 = objc_alloc(MEMORY[0x1E4F58E40]);
  v46 = [MEMORY[0x1E4F58E50] controls];
  v47 = (CHSWidgetExtensionProvider *)[v45 initWithOptions:v46];
  controlExtensionProvider = self->_controlExtensionProvider;
  self->_controlExtensionProvider = v47;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v5 viewWillAppear:a3];
  v3 = PRLogEditing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController will appear", v4, 2u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = PRLogEditing();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController did appear", v5, 2u);
  }

  [(PREditingSceneViewController *)self _presentWidgetEducationAlertIfNeeded];
  [(PREditingSceneViewController *)self _performWidgetDescriptorDiscovery];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v5 viewWillDisappear:a3];
  v3 = PRLogEditing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController will disappear", v4, 2u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v5 viewDidDisappear:a3];
  v3 = PRLogEditing();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_18C1C4000, v3, OS_LOG_TYPE_DEFAULT, "PREditingSceneViewController did disappear", v4, 2u);
  }
}

- (void)viewDidLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PREditingSceneViewController;
  [(PREditingSceneViewController *)&v28 viewDidLayoutSubviews];
  v3 = [(PREditingSceneViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [[PREditorElementLayoutController alloc] initWithTraitEnvironment:self];
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v12, "frameForElements:variant:withBoundingRect:", 16, 2, v5, v7, v9, v11);
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v21 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
  uint64_t v22 = v14;
  uint64_t v23 = v16;
  uint64_t v24 = v18;
  uint64_t v25 = v20;
  if (v21 == 1)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v22);
    double MaxX = 0.0;
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    double MinX = v9 - MaxX;
  }
  -[UIView setFrame:](self->_sidebarComplicationGallerySourceView, "setFrame:", MaxX, 0.0, MinX, v11);
}

- (id)addComplicationGestureViewForElement:(unint64_t)a3 tapAction:(SEL)a4 initiallyAllowed:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v10 = [v9 layer];
  [v10 setHitTestsAsOpaque:1];

  double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:a4];
  [v11 setDelegate:self];
  [v9 addGestureRecognizer:v11];
  v12 = [(PREditingSceneViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = [[PREditorElementLayoutController alloc] initWithTraitEnvironment:self];
  -[PREditorElementLayoutController frameForElements:variant:withBoundingRect:](v21, "frameForElements:variant:withBoundingRect:", a3, 2, v14, v16, v18, v20);
  objc_msgSend(v9, "setFrame:");
  [v9 setHidden:!v5];
  uint64_t v22 = [(PREditingSceneViewController *)self view];
  [v22 addSubview:v9];

  return v9;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(PREditingSceneViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PREditingSceneViewController;
  id v4 = a3;
  [(PREditingSceneViewController *)&v10 traitCollectionDidChange:v4];
  BOOL v5 = [(PREditingSceneViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    scene = self->super._scene;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PREditingSceneViewController_traitCollectionDidChange___block_invoke;
    v9[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
    v9[4] = v6;
    [(FBScene *)scene updateSettingsWithBlock:v9];
  }
}

uint64_t __57__PREditingSceneViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setUserInterfaceStyle:", *(void *)(a1 + 32));
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PREditingSceneViewController;
  id v7 = a4;
  -[PRSceneViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(PREditingSceneViewController *)self _dismissAnyPresentedComplicationGalleryAnimated:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__PREditingSceneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E54DB6A0;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __83__PREditingSceneViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateComplicationContainerVisibility];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateSceneSettingsForDepthEffectDisallowed];
}

- (void)_validateInlineComplication
{
  uint64_t v3 = [(PRComplicationDescriptor *)self->_selectedInlineComplication widgetDescriptor];
  id v4 = [v3 extensionIdentity];
  id v6 = [v4 containerBundleIdentifier];

  BOOL v5 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v6];
  if (([v5 isLocked] & 1) != 0 || objc_msgSend(v5, "isHidden")) {
    [(PREditingSceneViewController *)self setSelectedInlineComplication:0];
  }
  if (![(PRComplicationDescriptor *)self->_selectedInlineComplication hasMatchingDescriptor]) {
    [(PREditingSceneViewController *)self setSelectedInlineComplication:0];
  }
}

- (void)setSelectedInlineComplication:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (PRComplicationDescriptor *)a3;
  if (![(PRComplicationDescriptor *)v4 hasMatchingDescriptor])
  {

    id v4 = 0;
  }
  if (v4 != self->_selectedInlineComplication)
  {
    objc_storeStrong((id *)&self->_selectedInlineComplication, v4);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v5 = self->_complicationContainerViewControllers;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) setInlineComplicationDescriptor:v4];
        }
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    BOOL v10 = self->_selectedInlineComplication != 0;
    scene = self->super._scene;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__PREditingSceneViewController_setSelectedInlineComplication___block_invoke;
    v12[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    BOOL v13 = v10;
    [(FBScene *)scene updateSettingsWithBlock:v12];
  }
}

uint64_t __62__PREditingSceneViewController_setSelectedInlineComplication___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pui_setInlineComplicationConfigured:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setAlternateDateEnabled:(BOOL)a3
{
  if (self->_alternateDateEnabled != a3)
  {
    self->_alternateDateEnabled = a3;
    scene = self->super._scene;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__PREditingSceneViewController_setAlternateDateEnabled___block_invoke;
    v4[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
    BOOL v5 = a3;
    [(FBScene *)scene updateSettingsWithBlock:v4];
  }
}

uint64_t __56__PREditingSceneViewController_setAlternateDateEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setAlternateDateEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setControlsHidden:(BOOL)a3
{
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    uint64_t v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(PREditingSceneViewController *)self setControlsHidden:v4 animationSettings:v6];
}

- (void)setControlsHidden:(BOOL)a3 animationSettings:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_controlsHidden != v4)
  {
    self->_controlsHidden = v4;
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
    [(PREditingSceneViewController *)self _updateLocalControlsHiddenWithAnimationSettings:v6];
    id v7 = [(PREditingSceneViewController *)self viewIfLoaded];
    uint64_t v8 = [v7 window];
    objc_super v9 = [v8 windowScene];

    scene = self->super._scene;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__PREditingSceneViewController_setControlsHidden_animationSettings___block_invoke;
    v12[3] = &unk_1E54DC428;
    BOOL v15 = v4;
    void v12[4] = self;
    id v13 = v6;
    id v14 = v9;
    id v11 = v9;
    [(FBScene *)scene updateSettingsWithTransitionBlock:v12];
  }
}

id __68__PREditingSceneViewController_setControlsHidden_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "pr_setControlsHidden:", *(unsigned __int8 *)(a1 + 56));
  if ([*(id *)(*(void *)(a1 + 32) + 1032) isActive] && *(void *)(a1 + 40))
  {
    uint64_t v3 = [MEMORY[0x1E4FB1458] transitionContext];
    [*(id *)(a1 + 48) _synchronizeDrawing];
    BOOL v4 = [*(id *)(a1 + 48) _synchronizedDrawingFence];
    [v3 setAnimationFence:v4];

    [v3 setAnimationSettings:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)setUsesEditingLayout:(BOOL)a3
{
}

- (void)setUsesEditingLayout:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    uint64_t v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(PREditingSceneViewController *)self setUsesEditingLayout:v4 animationSettings:v6];
}

- (void)setUsesEditingLayout:(BOOL)a3 animationSettings:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_usesEditingLayout != v4)
  {
    self->_usesEditingLayout = v4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = self->_complicationContainerViewControllers;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) setUsesEditingLayout:v4 animationSettings:v6];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    v12 = [(PREditingSceneViewController *)self viewIfLoaded];
    id v13 = [v12 window];
    id v14 = [v13 windowScene];

    scene = self->super._scene;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__PREditingSceneViewController_setUsesEditingLayout_animationSettings___block_invoke;
    v17[3] = &unk_1E54DC428;
    BOOL v20 = v4;
    v17[4] = self;
    id v18 = v6;
    id v19 = v14;
    id v16 = v14;
    [(FBScene *)scene updateSettingsWithTransitionBlock:v17];
  }
}

id __71__PREditingSceneViewController_setUsesEditingLayout_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "pr_setUsesEditingLayout:", *(unsigned __int8 *)(a1 + 56));
  if ([*(id *)(*(void *)(a1 + 32) + 1032) isActive] && *(void *)(a1 + 40))
  {
    uint64_t v3 = [MEMORY[0x1E4FB1458] transitionContext];
    [*(id *)(a1 + 48) _synchronizeDrawing];
    BOOL v4 = [*(id *)(a1 + 48) _synchronizedDrawingFence];
    [v3 setAnimationFence:v4];

    [v3 setAnimationSettings:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)setShowsContentWhenReady:(BOOL)a3
{
  if (self->_showsContentWhenReady != a3)
  {
    BOOL v3 = a3;
    self->_showsContentWhenReady = a3;
    [(PRSceneViewController *)self _updatePresentationBackgroundColor];
    if (v3)
    {
      uint64_t v5 = [(PRSceneViewController *)self isSceneContentReady] ^ 1;
      [(PREditingSceneViewController *)self setContentHidden:v5 animated:0 completion:0];
    }
  }
}

- (void)setAllowsTransparentContent:(BOOL)a3
{
  if (self->_allowsTransparentContent != a3)
  {
    self->_allowsTransparentContent = a3;
    [(PRSceneViewController *)self _updatePresentationBackgroundColor];
  }
}

- (void)setContentHidden:(BOOL)a3
{
}

- (void)setContentHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v9 = a5;
  if (v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.25];
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(PREditingSceneViewController *)self setContentHidden:v6 animationSettings:v8 completion:v9];
}

- (void)setContentHidden:(BOOL)a3 animationSettings:(id)a4 completion:(id)a5
{
  if (self->_contentHidden != a3)
  {
    self->_contentHidden = a3;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78__PREditingSceneViewController_setContentHidden_animationSettings_completion___block_invoke;
    v5[3] = &unk_1E54DB3F0;
    v5[4] = self;
    BOOL v6 = a3;
    [MEMORY[0x1E4F4F898] animateWithSettings:a4 actions:v5 completion:a5];
  }
}

void __78__PREditingSceneViewController_setContentHidden_animationSettings_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewIfLoaded];
  id v4 = v2;
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
}

- (void)setSelectedQuickActionPosition:(int64_t)a3
{
  if (self->_selectedQuickActionPosition != a3)
  {
    self->_selectedQuickActionPosition = a3;
    BOOL v5 = [(PREditingSceneViewController *)self viewIfLoaded];
    BOOL v6 = [v5 window];
    id v7 = [v6 windowScene];

    uint64_t v8 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.3];
    BOOL v9 = [(PREditingSceneViewController *)self _shouldDepthEffectBeDisallowed];
    scene = self->super._scene;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__PREditingSceneViewController_setSelectedQuickActionPosition___block_invoke;
    v13[3] = &unk_1E54DC450;
    BOOL v17 = v9;
    v13[4] = self;
    id v14 = v8;
    id v15 = v7;
    int64_t v16 = a3;
    id v11 = v7;
    id v12 = v8;
    [(FBScene *)scene updateSettingsWithTransitionBlock:v13];
  }
}

id __63__PREditingSceneViewController_setSelectedQuickActionPosition___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void *)(a1 + 56) != 0;
  id v4 = a2;
  objc_msgSend(v4, "pr_setControlsHidden:", v3);
  objc_msgSend(v4, "pr_setFocusedQuickActionElementPosition:", *(void *)(a1 + 56));
  objc_msgSend(v4, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 64));

  if ([*(id *)(*(void *)(a1 + 32) + 1032) isActive] && *(void *)(a1 + 40))
  {
    BOOL v5 = [MEMORY[0x1E4FB1458] transitionContext];
    [*(id *)(a1 + 48) _synchronizeDrawing];
    BOOL v6 = [*(id *)(a1 + 48) _synchronizedDrawingFence];
    [v5 setAnimationFence:v6];

    [v5 setAnimationSettings:*(void *)(a1 + 40)];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (void)setAcceptButtonType:(int64_t)a3
{
  if (self->_acceptButtonType != a3)
  {
    self->_acceptButtonType = a3;
    scene = self->super._scene;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__PREditingSceneViewController_setAcceptButtonType___block_invoke;
    v4[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
    void v4[4] = a3;
    [(FBScene *)scene updateSettingsWithBlock:v4];
  }
}

uint64_t __52__PREditingSceneViewController_setAcceptButtonType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setEditingAcceptButtonType:", *(void *)(a1 + 32));
}

- (void)setVariant:(int64_t)a3
{
  if (self->_variant != a3)
  {
    self->_variant = a3;
    scene = self->super._scene;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__PREditingSceneViewController_setVariant___block_invoke;
    v4[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
    void v4[4] = a3;
    [(FBScene *)scene updateSettingsWithBlock:v4];
  }
}

uint64_t __43__PREditingSceneViewController_setVariant___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setEditingVariant:", *(void *)(a1 + 32));
}

- (void)setLeadingTopButtonFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_leadingTopButtonFrame = &self->_leadingTopButtonFrame;
  if (!CGRectEqualToRect(a3, self->_leadingTopButtonFrame))
  {
    p_leadingTopButtonFrame->origin.CGFloat x = x;
    p_leadingTopButtonFrame->origin.CGFloat y = y;
    p_leadingTopButtonFrame->size.CGFloat width = width;
    p_leadingTopButtonFrame->size.CGFloat height = height;
    scene = self->super._scene;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__PREditingSceneViewController_setLeadingTopButtonFrame___block_invoke;
    v10[3] = &unk_1E54DBB58;
    v10[4] = self;
    [(FBScene *)scene performUpdate:v10];
  }
}

uint64_t __57__PREditingSceneViewController_setLeadingTopButtonFrame___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSceneSettings:a2 transitionContext:a3];
}

- (void)setTrailingTopButtonFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_trailingTopButtonFrame = &self->_trailingTopButtonFrame;
  if (!CGRectEqualToRect(a3, self->_trailingTopButtonFrame))
  {
    p_trailingTopButtonFrame->origin.CGFloat x = x;
    p_trailingTopButtonFrame->origin.CGFloat y = y;
    p_trailingTopButtonFrame->size.CGFloat width = width;
    p_trailingTopButtonFrame->size.CGFloat height = height;
    scene = self->super._scene;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PREditingSceneViewController_setTrailingTopButtonFrame___block_invoke;
    v10[3] = &unk_1E54DBB58;
    v10[4] = self;
    [(FBScene *)scene performUpdate:v10];
  }
}

uint64_t __58__PREditingSceneViewController_setTrailingTopButtonFrame___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSceneSettings:a2 transitionContext:a3];
}

- (void)setHorizontalTitleBoundingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_horizontalTitleBoundingRect = &self->_horizontalTitleBoundingRect;
  if (!CGRectEqualToRect(a3, self->_horizontalTitleBoundingRect))
  {
    p_horizontalTitleBoundingRect->origin.CGFloat x = x;
    p_horizontalTitleBoundingRect->origin.CGFloat y = y;
    p_horizontalTitleBoundingRect->size.CGFloat width = width;
    p_horizontalTitleBoundingRect->size.CGFloat height = height;
    int v9 = [(FBScene *)self->super._scene isActive];
    scene = self->super._scene;
    if (v9)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke;
      v12[3] = &unk_1E54DBB58;
      void v12[4] = self;
      [(FBScene *)scene performUpdate:v12];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke_2;
      v11[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
      *(CGFloat *)&v11[4] = x;
      *(CGFloat *)&v11[5] = y;
      *(CGFloat *)&v11[6] = width;
      *(CGFloat *)&v11[7] = height;
      [(FBScene *)scene updateSettingsWithBlock:v11];
    }
  }
}

uint64_t __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSceneSettings:a2 transitionContext:a3];
}

uint64_t __63__PREditingSceneViewController_setHorizontalTitleBoundingRect___block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "pr_setHorizontalTitleBoundingRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setVerticalTitleBoundingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_verticalTitleBoundingRect = &self->_verticalTitleBoundingRect;
  if (!CGRectEqualToRect(a3, self->_verticalTitleBoundingRect))
  {
    p_verticalTitleBoundingRect->origin.CGFloat x = x;
    p_verticalTitleBoundingRect->origin.CGFloat y = y;
    p_verticalTitleBoundingRect->size.CGFloat width = width;
    p_verticalTitleBoundingRect->size.CGFloat height = height;
    int v9 = [(FBScene *)self->super._scene isActive];
    scene = self->super._scene;
    if (v9)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke;
      v12[3] = &unk_1E54DBB58;
      void v12[4] = self;
      [(FBScene *)scene performUpdate:v12];
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke_2;
      v11[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
      *(CGFloat *)&v11[4] = x;
      *(CGFloat *)&v11[5] = y;
      *(CGFloat *)&v11[6] = width;
      *(CGFloat *)&v11[7] = height;
      [(FBScene *)scene updateSettingsWithBlock:v11];
    }
  }
}

uint64_t __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSceneSettings:a2 transitionContext:a3];
}

uint64_t __61__PREditingSceneViewController_setVerticalTitleBoundingRect___block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "pr_setVerticalTitleBoundingRect:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setTitleString:(id)a3
{
  id v4 = (NSString *)a3;
  BOOL v5 = v4;
  if (self->_titleString != v4)
  {
    BOOL v6 = (NSString *)[(NSString *)v4 copy];
    titleString = self->_titleString;
    self->_titleString = v6;

    int v8 = [(FBScene *)self->super._scene isActive];
    scene = self->super._scene;
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __47__PREditingSceneViewController_setTitleString___block_invoke;
      v12[3] = &unk_1E54DBB58;
      void v12[4] = self;
      [(FBScene *)scene performUpdate:v12];
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __47__PREditingSceneViewController_setTitleString___block_invoke_2;
      v10[3] = &unk_1E54DBD10;
      id v11 = v5;
      [(FBScene *)scene updateSettingsWithBlock:v10];
    }
  }
}

uint64_t __47__PREditingSceneViewController_setTitleString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSceneSettings:a2 transitionContext:a3];
}

uint64_t __47__PREditingSceneViewController_setTitleString___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setTitleString:", *(void *)(a1 + 32));
}

- (void)setOverrideDate:(id)a3
{
  id v4 = (NSDate *)a3;
  BOOL v5 = v4;
  if (self->_overrideDate != v4)
  {
    BOOL v6 = (NSDate *)[(NSDate *)v4 copy];
    overrideDate = self->_overrideDate;
    self->_overrideDate = v6;

    int v8 = [(FBScene *)self->super._scene isActive];
    scene = self->super._scene;
    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __48__PREditingSceneViewController_setOverrideDate___block_invoke;
      v12[3] = &unk_1E54DBB58;
      void v12[4] = self;
      [(FBScene *)scene performUpdate:v12];
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __48__PREditingSceneViewController_setOverrideDate___block_invoke_2;
      v10[3] = &unk_1E54DBD10;
      id v11 = v5;
      [(FBScene *)scene updateSettingsWithBlock:v10];
    }
  }
}

uint64_t __48__PREditingSceneViewController_setOverrideDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _updateSceneSettings:a2 transitionContext:a3];
}

uint64_t __48__PREditingSceneViewController_setOverrideDate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setOverrideDate:", *(void *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    BOOL v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)addLongSaveOperationIndicator
{
  v37[6] = *MEMORY[0x1E4F143B8];
  if (!self->_saveIndicatorContainerView)
  {
    v2 = [(PREditingSceneViewController *)self view];
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    [v3 setBackgroundColor:v4];

    BOOL v5 = [v3 layer];
    [v5 setCompositingFilter:*MEMORY[0x1E4F3A308]];

    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    id v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [v6 setColor:v7];

    [v6 startAnimating];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v6];
    [v3 setAlpha:0.0];
    id v8 = v2;
    [v2 addSubview:v3];
    long long v24 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [v6 centerXAnchor];
    v32 = [v3 centerXAnchor];
    uint64_t v31 = [v33 constraintEqualToAnchor:v32];
    v37[0] = v31;
    v29 = [v6 centerYAnchor];
    objc_super v28 = [v3 centerYAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v37[1] = v27;
    uint64_t v26 = [v3 topAnchor];
    uint64_t v25 = [v2 topAnchor];
    long long v23 = [v26 constraintEqualToAnchor:v25];
    v37[2] = v23;
    long long v22 = [v3 bottomAnchor];
    long long v21 = [v2 bottomAnchor];
    int v9 = [v22 constraintEqualToAnchor:v21];
    v37[3] = v9;
    uint64_t v10 = [v3 leadingAnchor];
    v30 = v2;
    id v11 = [v2 leadingAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    v37[4] = v12;
    id v13 = [v3 trailingAnchor];
    id v14 = [v8 trailingAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14];
    v37[5] = v15;
    int64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:6];
    [v24 activateConstraints:v16];

    BOOL v17 = (void *)MEMORY[0x1E4FB1EB0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __61__PREditingSceneViewController_addLongSaveOperationIndicator__block_invoke;
    v35[3] = &unk_1E54DAFB8;
    id v18 = (UIView *)v3;
    v36 = v18;
    [v17 animateWithDuration:v35 animations:0.2];
    saveIndicatorContainerView = self->_saveIndicatorContainerView;
    self->_saveIndicatorContainerView = v18;
    BOOL v20 = v18;
  }
}

uint64_t __61__PREditingSceneViewController_addLongSaveOperationIndicator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)removeLongSaveOperationIndicator
{
  saveIndicatorContainerView = self->_saveIndicatorContainerView;
  if (saveIndicatorContainerView)
  {
    [(UIView *)saveIndicatorContainerView removeFromSuperview];
    id v4 = self->_saveIndicatorContainerView;
    self->_saveIndicatorContainerView = 0;
  }
}

- (void)setPresentedSidebarComplicationsGallery:(id)a3
{
  p_presentedSidebarComplicationsGallerCGFloat y = (id *)&self->_presentedSidebarComplicationsGallery;
  id v9 = a3;
  if ((objc_msgSend(*p_presentedSidebarComplicationsGallery, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentedSidebarComplicationsGallery, a3);
    localKeyboardFocusAssertion = self->_localKeyboardFocusAssertion;
    if (*p_presentedSidebarComplicationsGallery)
    {
      if (localKeyboardFocusAssertion) {
        goto LABEL_8;
      }
      id v7 = [(PRSceneViewController *)self _acquireLocalKeyboardFocusAssertion];
    }
    else
    {
      if (!localKeyboardFocusAssertion) {
        goto LABEL_8;
      }
      [(BSInvalidatable *)localKeyboardFocusAssertion invalidate];
      id v7 = 0;
    }
    id v8 = self->_localKeyboardFocusAssertion;
    self->_localKeyboardFocusAssertion = v7;
  }
LABEL_8:
}

+ (id)role
{
  return (id)*MEMORY[0x1E4F92838];
}

- (void)_updateSceneSettings:(id)a3 transitionContext:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PREditingSceneViewController;
  id v6 = a3;
  [(PRSceneViewController *)&v13 _updateSceneSettings:v6 transitionContext:a4];
  objc_msgSend(v6, "pr_setCoveredByModalPresentation:", -[PREditingSceneViewController _isPosterCoveredByModalPresentation](self, "_isPosterCoveredByModalPresentation"));
  objc_msgSend(v6, "pr_setEditingVariant:", -[PREditingSceneViewController variant](self, "variant"));
  objc_msgSend(v6, "pr_setEditingAcceptButtonType:", -[PREditingSceneViewController acceptButtonType](self, "acceptButtonType"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  [(PREditingSceneViewController *)self _topButtonLayout];
  objc_msgSend(v6, "pr_setLeadingTopButtonFrame:", v9, v10);
  objc_msgSend(v6, "pr_setTrailingTopButtonFrame:", v11, v12);
  [(PREditingSceneViewController *)self horizontalTitleBoundingRect];
  objc_msgSend(v6, "pr_setHorizontalTitleBoundingRect:");
  [(PREditingSceneViewController *)self verticalTitleBoundingRect];
  objc_msgSend(v6, "pr_setVerticalTitleBoundingRect:");
  id v7 = [(PREditingSceneViewController *)self titleString];
  objc_msgSend(v6, "pr_setTitleString:", v7);
  id v8 = [(PREditingSceneViewController *)self overrideDate];
  objc_msgSend(v6, "pr_setOverrideDate:", v8);
}

- (id)_presentationBackgroundColor
{
  BOOL v3 = [(PRSceneViewController *)self isSceneContentReady];
  if ([(PREditingSceneViewController *)self showsContentWhenReady] && !v3
    || [(PREditingSceneViewController *)self allowsTransparentContent] && v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PREditingSceneViewController;
    id v4 = [(PRSceneViewController *)&v6 _presentationBackgroundColor];
  }
  return v4;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (PREditingSceneViewControllerTopButtonLayout)_topButtonLayout
{
  retstr->trailingTopButtonFrame.CGSize size = 0u;
  retstr->leadingTopButtonFrame.CGPoint origin = 0u;
  retstr->leadingTopButtonFrame.CGSize size = 0u;
  retstr->trailingTopButtonFrame.CGPoint origin = 0u;
  p_trailingTopButtonFrame = &retstr->trailingTopButtonFrame;
  [(PREditingSceneViewController *)self leadingTopButtonFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  retstr->leadingTopButtonFrame.origin.CGFloat x = v6;
  retstr->leadingTopButtonFrame.origin.CGFloat y = v8;
  retstr->leadingTopButtonFrame.size.CGFloat width = v10;
  retstr->leadingTopButtonFrame.size.CGFloat height = v12;
  [(PREditingSceneViewController *)self trailingTopButtonFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  p_trailingTopButtonFrame->origin.CGFloat x = v14;
  retstr->trailingTopButtonFrame.origin.CGFloat y = v16;
  retstr->trailingTopButtonFrame.size.CGFloat width = v18;
  retstr->trailingTopButtonFrame.size.CGFloat height = v20;
  v43.origin.CGFloat x = v7;
  v43.origin.CGFloat y = v9;
  v43.size.CGFloat width = v11;
  v43.size.CGFloat height = v13;
  if (CGRectIsEmpty(v43)
    || (v44.origin.CGFloat x = v15,
        v44.origin.CGFloat y = v17,
        v44.size.CGFloat width = v19,
        v44.size.CGFloat height = v21,
        result = (PREditingSceneViewControllerTopButtonLayout *)CGRectIsEmpty(v44),
        result))
  {
    long long v23 = [(PREditingSceneViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      memset(&v42, 0, sizeof(v42));
      CGPoint v40 = (CGPoint)0;
      CGSize v41 = (CGSize)0;
      if (v23)
      {
        [v23 topButtonLayoutForEditingSceneViewController:self];
        CGFloat y = v40.y;
        CGFloat x = v40.x;
        CGFloat height = v41.height;
        CGFloat width = v41.width;
      }
      else
      {
        CGFloat height = 0.0;
        CGFloat width = 0.0;
        CGFloat y = 0.0;
        CGFloat x = 0.0;
      }
      if (CGRectIsEmpty(*(CGRect *)&x) || CGRectIsEmpty(v42))
      {
        [(PREditingSceneViewController *)self lastValidDelegateTopButtonLayout];
        CGSize v30 = v37;
        retstr->leadingTopButtonFrame.CGPoint origin = v36;
        retstr->leadingTopButtonFrame.CGSize size = v30;
        CGSize v31 = v39;
        retstr->trailingTopButtonFrame.CGPoint origin = v38;
        retstr->trailingTopButtonFrame.CGSize size = v31;
      }
      else
      {
        CGPoint v32 = v40;
        CGSize v33 = v41;
        retstr->leadingTopButtonFrame.CGPoint origin = v40;
        retstr->leadingTopButtonFrame.CGSize size = v33;
        CGPoint origin = v42.origin;
        CGSize size = v42.size;
        retstr->trailingTopButtonFrame.CGPoint origin = v42.origin;
        retstr->trailingTopButtonFrame.CGSize size = size;
        CGPoint v36 = v32;
        CGSize v37 = v33;
        CGPoint v38 = origin;
        CGSize v39 = size;
        [(PREditingSceneViewController *)self setLastValidDelegateTopButtonLayout:&v36];
      }
    }
    else
    {
      CGPoint v28 = (CGPoint)*MEMORY[0x1E4F1DB28];
      CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      p_trailingTopButtonFrame->CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      p_trailingTopButtonFrame->CGSize size = v29;
      retstr->leadingTopButtonFrame.CGPoint origin = v28;
      retstr->leadingTopButtonFrame.CGSize size = v29;
    }
  }
  return result;
}

- (void)_complicationsSceneCreated:(id)a3
{
  id v4 = a3;
  [(PREditingSceneViewController *)self _dismissAnyPresentedComplicationGalleryAnimated:1];
  BOOL v5 = [(PRSceneViewController *)self configuredProperties];
  CGFloat v6 = [v5 suggestionMetadata];
  CGFloat v7 = [v6 suggestedComplicationsByIdentifier];

  CGFloat v8 = [v5 complicationLayout];
  CGFloat v9 = [v8 complications];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__PREditingSceneViewController__complicationsSceneCreated___block_invoke;
  v32[3] = &unk_1E54DC498;
  id v10 = v7;
  id v33 = v10;
  CGFloat v11 = objc_msgSend(v9, "bs_map:", v32);

  CGFloat v12 = [v5 complicationLayout];
  CGFloat v13 = [v12 sidebarComplications];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  CGSize v29 = __59__PREditingSceneViewController__complicationsSceneCreated___block_invoke_2;
  CGSize v30 = &unk_1E54DC498;
  id v31 = v10;
  id v14 = v10;
  CGFloat v15 = objc_msgSend(v13, "bs_map:", &v27);

  CGFloat v16 = objc_msgSend(v5, "complicationLayout", v27, v28, v29, v30);
  CGFloat v17 = [v16 complicationIconLayout];

  CGFloat v18 = [v5 complicationLayout];
  CGFloat v19 = [v18 sidebarComplicationIconLayout];

  CGFloat v20 = [PRComplicationContainerViewController alloc];
  if (v11) {
    CGFloat v21 = v11;
  }
  else {
    CGFloat v21 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (v15) {
    long long v22 = v15;
  }
  else {
    long long v22 = (void *)MEMORY[0x1E4F1CBF0];
  }
  long long v23 = [(PRComplicationContainerViewController *)v20 initWithInlineComplicationDescriptor:self->_selectedInlineComplication graphicComplicationDescriptors:v21 graphicComplicationIconLayout:v17 sidebarComplicationDescriptors:v22 sidebarIconLayout:v19];
  [(PRComplicationContainerViewController *)v23 setDelegate:self];
  [(PRComplicationContainerViewController *)v23 setUsesEditingLayout:[(PREditingSceneViewController *)self usesEditingLayout]];
  long long v24 = [(PREditingSceneViewController *)self vibrancyConfiguration];
  [(PRComplicationContainerViewController *)v23 setVibrancyConfiguration:v24];

  [(NSHashTable *)self->_complicationContainerViewControllers addObject:v23];
  uint64_t v25 = [v4 userInfo];

  uint64_t v26 = [(PREditingSceneViewController *)self _windowFromUserInfo:v25];

  [v26 setRootViewController:v23];
  [v26 makeKeyAndVisible];
  [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
  [(PREditingSceneViewController *)self _updateComplicationContainerVisibility];
}

PRComplicationDescriptor *__59__PREditingSceneViewController__complicationsSceneCreated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PRComplicationDescriptor alloc] initWithPRSWidget:v3];

  BOOL v5 = *(void **)(a1 + 32);
  CGFloat v6 = [(PRComplicationDescriptor *)v4 uniqueIdentifier];
  CGFloat v7 = [v5 objectForKey:v6];
  [(PRComplicationDescriptor *)v4 setSuggestedComplication:v7];

  return v4;
}

PRComplicationDescriptor *__59__PREditingSceneViewController__complicationsSceneCreated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PRComplicationDescriptor alloc] initWithPRSWidget:v3];

  BOOL v5 = *(void **)(a1 + 32);
  CGFloat v6 = [(PRComplicationDescriptor *)v4 uniqueIdentifier];
  CGFloat v7 = [v5 objectForKey:v6];
  [(PRComplicationDescriptor *)v4 setSuggestedComplication:v7];

  return v4;
}

- (void)_quickActionsSceneCreated:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PRSceneViewController *)self configuredProperties];
  id v14 = (id)[v5 mutableCopy];

  CGFloat v6 = [(PRSceneViewController *)self configuredProperties];
  CGFloat v7 = [v6 quickActionsConfiguration];

  if (!v7)
  {
    CGFloat v7 = [[PRPosterQuickActionsConfiguration alloc] initWithLeadingControl:0 trailingControl:0];
    [v14 setQuickActionsConfiguration:v7];
    [(PRSceneViewController *)self setConfiguredProperties:v14];
  }
  CGFloat v8 = [[PRQuickActionEditingViewController alloc] initWithQuickActionsConfiguration:v7];
  CGFloat v9 = [(PRQuickActionEditingViewController *)v8 view];
  BOOL v10 = [(PREditingSceneViewController *)self areControlsHidden];
  double v11 = 1.0;
  if (v10) {
    double v11 = 0.0;
  }
  [v9 setAlpha:v11];

  [(PRQuickActionEditingViewController *)v8 setDelegate:self];
  [(PREditingSceneViewController *)self setQuickActionEditingViewController:v8];
  CGFloat v12 = [v4 userInfo];

  CGFloat v13 = [(PREditingSceneViewController *)self _windowFromUserInfo:v12];

  [v13 setRootViewController:v8];
  [v13 makeKeyAndVisible];
  [(PRQuickActionEditingViewController *)v8 validateControls];
}

- (id)_windowFromUserInfo:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"window"];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      CGFloat v6 = v5;
    }
    else {
      CGFloat v6 = 0;
    }
  }
  else
  {
    CGFloat v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)_unregisterComplicationContainerViewControllerDelegates
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_complicationContainerViewControllers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setDelegate:", 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSHashTable *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_prefetchComplicationSuggestions
{
  id v3 = objc_alloc(MEMORY[0x1E4F4B030]);
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
  long long v7 = [v6 UUIDString];
  long long v8 = [MEMORY[0x1E4F4F6E0] colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
  long long v9 = (void *)[v3 initWithIdentifier:v5 descriptorIdentifier:v7 extensionBundleIdentifier:&stru_1ED9A3120 localizedDisplayName:&stru_1ED9A3120 modeSemanticType:0 titleFontName:&stru_1ED9A3120 titleColor:v8 subtitleComplication:0 layoutType:2 complications:0 landscapeComplications:0];

  objc_initWeak(&location, self);
  long long v10 = [MEMORY[0x1E4F4B040] sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke;
  v17[3] = &unk_1E54DC4E8;
  objc_copyWeak(&v18, &location);
  [v10 fetchComplicationSetsForFaceGalleryItem:v9 completion:v17];

  double v11 = [MEMORY[0x1E4F4B040] sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_194;
  v15[3] = &unk_1E54DC510;
  objc_copyWeak(&v16, &location);
  [v11 fetchInlineComplicationSetForFaceGalleryItem:v9 completion:v15];

  uint64_t v12 = [MEMORY[0x1E4F4B040] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_197;
  v13[3] = &unk_1E54DC538;
  objc_copyWeak(&v14, &location);
  [v12 fetchLandscapeComplicationSetsForFaceGalleryItem:v9 completion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2;
  block[3] = &unk_1E54DC4C0;
  id v10 = v6;
  id v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v1 = PRLogEditing();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_cold_1();
    }
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      uint64_t v4 = WeakRetained;
      objc_storeStrong(WeakRetained + 155, *(id *)(a1 + 40));
      id WeakRetained = v4;
    }
  }
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_195;
  block[3] = &unk_1E54DC4C0;
  id v10 = v6;
  id v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_195(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v1 = PRLogEditing();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_195_cold_1();
    }
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      uint64_t v4 = WeakRetained;
      objc_storeStrong(WeakRetained + 154, *(id *)(a1 + 40));
      id WeakRetained = v4;
    }
  }
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_198;
  block[3] = &unk_1E54DC4C0;
  id v10 = v6;
  id v7 = v6;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v11 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_198(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v1 = PRLogEditing();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_198_cold_1();
    }
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      uint64_t v4 = WeakRetained;
      objc_storeStrong(WeakRetained + 156, *(id *)(a1 + 40));
      id WeakRetained = v4;
    }
  }
}

- (void)_presentWidgetEducationAlertIfNeeded
{
  id v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v5 = [(PREditingSceneViewController *)self view];
    id v6 = [v5 window];
    id v7 = [v6 windowScene];
    uint64_t v8 = [v7 interfaceOrientation];

    long long v9 = objc_alloc_init(PRComplicationDefaultsDomain);
    CGFloat v13 = v9;
    if ((unint64_t)(v8 - 3) > 1) {
      uint64_t v10 = [(PRComplicationDefaultsDomain *)v9 hasShownPortraitEducation];
    }
    else {
      uint64_t v10 = [(PRComplicationDefaultsDomain *)v9 hasShownLandscapeEducation];
    }
    id v11 = v13;
    if ((v10 & 1) == 0)
    {
      id v12 = objc_alloc_init(PRWidgetEducationViewController);
      [(PRWidgetEducationViewController *)v12 loadViewIfNeeded];
      [(PREditingSceneViewController *)self presentViewController:v12 animated:1 completion:0];
      if ((unint64_t)(v8 - 3) > 1) {
        [(PRComplicationDefaultsDomain *)v13 setHasShownPortraitEducation:1];
      }
      else {
        [(PRComplicationDefaultsDomain *)v13 setHasShownLandscapeEducation:1];
      }

      id v11 = v13;
    }
    MEMORY[0x1F41817F8](v10, v11);
  }
}

- (void)_presentControlsGalleryWithSelectedControl:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(PREditingSceneViewController *)self presentedControlsGallery];
  id v5 = v4;
  if (v4)
  {
    [v4 setSelectedControl:v14];
  }
  else
  {
    id v6 = [(PREditingSceneViewController *)self _controlsGalleryConfiguration];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F5AE90]) initWithConfiguration:v6];
    [v7 setDelegate:self];
    [v7 setSelectedControl:v14];
    uint64_t v8 = [v7 presentationController];
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = v11;

    [v12 setDelegate:self];
    [(PREditingSceneViewController *)self presentViewController:v7 animated:1 completion:0];
    [(PREditingSceneViewController *)self setPresentedControlsGallery:v7];
    [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
    [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
    CGFloat v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:self selector:sel_presentedViewControllerDismissalDidEnd_ name:*MEMORY[0x1E4FB2E60] object:v7];
    [v13 addObserver:self selector:sel_presentedViewControllerPresentationDidBegin_ name:*MEMORY[0x1E4FB2E78] object:v7];
  }
}

- (id)_controlsGalleryConfiguration
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F5AE88]);
  [v3 setAllowedControlSizes:&unk_1ED9EF058];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.GAXApp.GAXAppWidget" containerBundleIdentifier:@"com.apple.GAXApp" deviceIdentifier:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v4 kind:@"com.apple.accessibility.GuidedAccess.button" intent:0];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setDisallowedControlIdentities:v6];

  id v7 = [(PREditingSceneViewController *)self _controlsGallerySuggestedControls];
  [v3 setSuggestedControls:v7];

  return v3;
}

- (id)_controlsGallerySuggestedControls
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PREditingSceneViewController *)self _suggestedControlIdentities];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F5AE80]) initWithIdentity:*(void *)(*((void *)&v11 + 1) + 8 * i) type:0 size:0];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_suggestedControlIdentities
{
  if (_suggestedControlIdentities_onceToken != -1) {
    dispatch_once(&_suggestedControlIdentities_onceToken, &__block_literal_global_35);
  }
  v2 = (void *)_suggestedControlIdentities_controlIdentities;
  return v2;
}

void __59__PREditingSceneViewController__suggestedControlIdentities__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.Translate.TranslationWidgets" containerBundleIdentifier:@"com.apple.Translate" deviceIdentifier:0];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v27 kind:@"com.apple.Translate.ToggleSpeechTranslationIntent" intent:0];
  [v0 addObject:v26];
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.Home.HomeWidget.Interactive" containerBundleIdentifier:@"com.apple.Home" deviceIdentifier:0];
  long long v24 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v25 kind:@"com.apple.Home.LaunchHomeAppControl" intent:0];
  [v0 addObject:v24];
  long long v23 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.calculator.CalculatorWidget" containerBundleIdentifier:@"com.apple.calculator" deviceIdentifier:0];
  long long v22 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v23 kind:@"com.apple.calculator.CalculatorWidget.control" intent:0];
  [v0 addObject:v22];
  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.mobiletimer.WorldClockWidget" containerBundleIdentifier:@"com.apple.mobiletimer" deviceIdentifier:0];
  CGFloat v21 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v1 kind:@"com.apple.mobiletimer.control.alarm" intent:0];
  [v0 addObject:v21];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.ControlCenter.ControlCenterControlsExtension" containerBundleIdentifier:@"com.apple.springboard" deviceIdentifier:0];
  CGFloat v20 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v2 kind:@"com.apple.ControlCenter.ControlCenterControlsExtension.appearance" intent:0];
  [v0 addObject:v20];
  long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.shortcuts.ShortcutsWidget" containerBundleIdentifier:@"com.apple.shortcuts" deviceIdentifier:0];
  CGFloat v19 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v14 kind:@"ShortcutsControl" intent:0];
  [v0 addObject:v19];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.Magnifier.MagnifierWidgetExtension" containerBundleIdentifier:@"com.apple.Magnifier" deviceIdentifier:0];
  CGFloat v17 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v18 kind:@"com.apple.accessibility.Magnifier.button" intent:0];
  [v0 addObject:v17];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.musicrecognition.MusicRecognitionControls" containerBundleIdentifier:@"com.apple.musicrecognition" deviceIdentifier:0];
  CGFloat v15 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v16 kind:@"com.apple.musicrecognition.MusicRecognitionControls.toggle" intent:0];
  [v0 addObject:v15];
  uint64_t v3 = v1;
  long long v13 = (void *)v1;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v1 kind:@"com.apple.mobiletimer.control.timer" intent:0];
  [v0 addObject:v4];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v14 kind:@"OpenAppControl" intent:0];
  [v0 addObject:v5];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v3 kind:@"com.apple.mobiletimer.control.stopwatch" intent:0];
  [v0 addObject:v6];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.BarcodeScanner.BarcodeScannerWidgetExtension" containerBundleIdentifier:@"com.apple.BarcodeScanner" deviceIdentifier:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v7 kind:@"com.apple.BarcodeScanner.button" intent:0];
  [v0 addObject:v8];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v2 kind:@"com.apple.ControlCenter.ControlCenterControlsExtension.flashlight" intent:0];
  [v0 addObject:v9];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:@"com.apple.camera.LauncherControlExtension" containerBundleIdentifier:@"com.apple.camera" deviceIdentifier:0];
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F58C80]) initWithExtensionIdentity:v10 kind:@"com.apple.camera.deeplink.button" intent:0];
  [v0 addObject:v11];
  long long v12 = (void *)_suggestedControlIdentities_controlIdentities;
  _suggestedControlIdentities_controlIdentities = (uint64_t)v0;
}

- (void)_presentComplicationGallery
{
  v71[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PREditingSceneViewController *)self presentedComplicationsGallery];

  if (v3)
  {
    uint64_t v4 = PRLogEditing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Complication gallery is already displayed, not showing another one", buf, 2u);
    }
  }
  else
  {
    [(PREditingSceneViewController *)self _performWidgetDescriptorDiscovery];
    uint64_t v5 = [(PREditingSceneViewController *)self addWidgetSheetConfigurationManager];
    [v5 setAllowedWidgetFamilies:3072];

    uint64_t v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4FA6238]);
      uint64_t v9 = [v8 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
      [v9 iconImageInfo];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      id v18 = (PRComplicationGalleryViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA62A0]), "initWithName:iconImageInfo:", @"iconImages", v11, v13, v15, v17);
      id v19 = objc_alloc(MEMORY[0x1E4FA6300]);
      CGFloat v20 = [(PREditingSceneViewController *)self listLayoutProvider];
      CGFloat v21 = [(PREditingSceneViewController *)self iconViewProvider];
      long long v22 = objc_msgSend(v19, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v20, v21, 3072, 0, v18, 1);

      [v22 setPresenter:self];
      [v22 setDelegate:self];
      [v22 setAddWidgetSheetLocation:1];
      [v22 setWantsBottomAttachedPresentation:0];
      [v22 setWantsCloseButton:1];
      [v22 setWantsSeparator:1];
      long long v23 = [v22 presentationController];
      uint64_t v24 = objc_opt_class();
      id v25 = v23;
      if (v24)
      {
        if (objc_opt_isKindOfClass()) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = 0;
        }
      }
      else
      {
        uint64_t v26 = 0;
      }
      id v34 = v26;

      v35 = [MEMORY[0x1E4FB1C30] customDetentWithIdentifier:@"ComplicationGalleryDodge" resolver:&__block_literal_global_337];
      v71[0] = v35;
      CGPoint v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      [v34 setDetents:v36];

      [v34 setLargestUndimmedDetentIdentifier:@"ComplicationGalleryDodge"];
      CGSize v37 = [v34 dimmingView];
      CGPoint v38 = [v37 layer];
      [v38 setHitTestsAsOpaque:0];

      CGSize v39 = [v34 _confinedDimmingView];
      CGPoint v40 = [v39 layer];
      [v40 setHitTestsAsOpaque:0];

      CGSize v41 = [MEMORY[0x1E4FB22B0] appearancePreferringDimmingVisible:0];
      [v34 _setStandardAppearance:v41];

      [v34 setDelegate:self];
      [v22 loadViewIfNeeded];
      CGRect v42 = [(PREditingSceneViewController *)self addWidgetSheetConfigurationManager];
      [v42 updatePresentedWidgetEditingViewController:v22];

      CGRect v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v43 addObserver:self selector:sel_presentedViewControllerDismissalWillBegin_ name:*MEMORY[0x1E4FB2E68] object:v22];
      [v43 addObserver:self selector:sel_presentedViewControllerDismissalDidEnd_ name:*MEMORY[0x1E4FB2E60] object:v22];
    }
    else
    {
      uint64_t v27 = PRIconGridSizeClassSetForWidgetFamilyMask(3072);
      uint64_t v28 = [(PREditingSceneViewController *)self addWidgetSheetConfigurationManager];
      id v67 = v27;
      id v8 = [v28 applicationWidgetCollectionsForEditingViewController:self withAllowedSizeClasses:&v67 allowingNonStackableItems:0];
      id v29 = v67;

      CGSize v30 = [PRComplicationGalleryViewController alloc];
      graphicComplicationSuggestionSets = self->_graphicComplicationSuggestionSets;
      CGPoint v32 = [(PREditingSceneViewController *)self listLayoutProvider];
      id v33 = [(PREditingSceneViewController *)self iconViewProvider];
      id v18 = [(PRComplicationGalleryViewController *)v30 initWithSuggestionSets:graphicComplicationSuggestionSets applicationWidgetCollections:v8 listLayoutProvider:v32 iconViewProvider:v33];

      [(PRComplicationGalleryViewController *)v18 setDelegate:self];
      long long v22 = [(PREditingSceneViewController *)self _configureNavigationControllerForGalleryViewController:v18];
    }

    [(PREditingSceneViewController *)self setPresentedComplicationsGallery:v22];
    v55 = v22;
    [(PREditingSceneViewController *)self presentViewController:v22 animated:1 completion:0];
    [(PREditingSceneViewController *)self setFocusedElement:2];
    [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
    [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    obj = self->_graphicComplicationSuggestionSets;
    uint64_t v58 = [(NSArray *)obj countByEnumeratingWithState:&v63 objects:v70 count:16];
    if (v58)
    {
      uint64_t v57 = *(void *)v64;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v64 != v57) {
            objc_enumerationMutation(obj);
          }
          id v45 = *(void **)(*((void *)&v63 + 1) + 8 * v44);
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          v46 = [v45 complications];
          uint64_t v47 = [v46 countByEnumeratingWithState:&v59 objects:v69 count:16];
          if (v47)
          {
            uint64_t v48 = v47;
            uint64_t v49 = *(void *)v60;
            do
            {
              uint64_t v50 = 0;
              do
              {
                if (*(void *)v60 != v49) {
                  objc_enumerationMutation(v46);
                }
                uint64_t v51 = *(void *)(*((void *)&v59 + 1) + 8 * v50);
                v52 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
                v53 = [v52 objectForKey:v51];

                if (!v53)
                {
                  v54 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
                  [v54 setObject:&unk_1ED9EEE30 forKey:v51];
                }
                ++v50;
              }
              while (v48 != v50);
              uint64_t v48 = [v46 countByEnumeratingWithState:&v59 objects:v69 count:16];
            }
            while (v48);
          }

          ++v44;
        }
        while (v44 != v58);
        uint64_t v58 = [(NSArray *)obj countByEnumeratingWithState:&v63 objects:v70 count:16];
      }
      while (v58);
    }

    uint64_t v4 = v55;
  }
}

double __59__PREditingSceneViewController__presentComplicationGallery__block_invoke(uint64_t a1, void *a2)
{
  [a2 maximumDetentValue];
  return v2 * 0.6;
}

- (SBHAddWidgetSheetConfigurationManager)addWidgetSheetConfigurationManager
{
  addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  if (!addWidgetSheetConfigurationManager)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FA61F0]) initWithWidgetExtensionProvider:self->_widgetExtensionProvider];
    uint64_t v5 = [(PREditingSceneViewController *)self iconModel];
    [v4 setIconModel:v5];

    uint64_t v6 = [(PREditingSceneViewController *)self listLayoutProvider];
    [v4 setListLayoutProvider:v6];

    [v4 setAddWidgetSheetStyle:1];
    [v4 setAllowedWidgetFamilies:3074];
    [v4 setAllowsFakeWidgets:0];
    [v4 setConfigurationManagerDelegate:self];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4FA6280], "pr_widgetDomain");
      [v4 setGridSizeClassDomain:v7];
    }
    id v8 = self->_addWidgetSheetConfigurationManager;
    self->_addWidgetSheetConfigurationManager = (SBHAddWidgetSheetConfigurationManager *)v4;

    addWidgetSheetConfigurationManager = self->_addWidgetSheetConfigurationManager;
  }
  return addWidgetSheetConfigurationManager;
}

- (void)_presentSidebarComplicationGallery
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PREditingSceneViewController *)self presentedSidebarComplicationsGallery];

  if (v3)
  {
    uint64_t v4 = PRLogEditing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18C1C4000, v4, OS_LOG_TYPE_DEFAULT, "Sidebar complication gallery is already displayed, not showing another one", buf, 2u);
    }
  }
  else
  {
    [(PREditingSceneViewController *)self _performWidgetDescriptorDiscovery];
    uint64_t v5 = objc_alloc_init(MEMORY[0x1E4FA6238]);
    uint64_t v6 = [v5 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
    [v6 iconImageInfo];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA62A0]), "initWithName:iconImageInfo:", @"iconImages", v8, v10, v12, v14);
    double v16 = [(PREditingSceneViewController *)self addWidgetSheetConfigurationManager];
    [v16 setAllowedWidgetFamilies:3074];

    double v17 = [(PREditingSceneViewController *)self complicationContainerViewControllers];
    id v18 = [v17 anyObject];
    id v19 = [v18 sidebarWidgetGridViewController];
    uint64_t v20 = [v19 dragManager];

    CGFloat v21 = [(PREditingSceneViewController *)self iconViewProvider];
    uint64_t v51 = (void *)v20;
    [v21 setDragManager:v20];

    long long v22 = [PRPadAddSheetViewController alloc];
    long long v23 = [(PREditingSceneViewController *)self listLayoutProvider];
    uint64_t v24 = [(PREditingSceneViewController *)self iconViewProvider];
    v52 = (void *)v15;
    id v25 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:](v22, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v23, v24, 3074, 256, v15, 1);

    [(PRPadAddSheetViewController *)v25 setModalPresentationStyle:2];
    [(SBHPadAddSheetViewController *)v25 setPresenter:self];
    [(SBHAddWidgetSheetViewControllerBase *)v25 setDelegate:self];
    [(SBHPadAddSheetViewController *)v25 setAddWidgetSheetLocation:1];
    [(SBHPadAddSheetViewController *)v25 setWantsBottomAttachedPresentation:0];
    [(SBHPadAddSheetViewController *)v25 setWantsCloseButton:1];
    [(SBHPadAddSheetViewController *)v25 setWantsSeparator:1];
    uint64_t v26 = [(PRPadAddSheetViewController *)v25 presentationController];
    uint64_t v27 = objc_opt_class();
    id v28 = v26;
    if (v27)
    {
      if (objc_opt_isKindOfClass()) {
        id v29 = v28;
      }
      else {
        id v29 = 0;
      }
    }
    else
    {
      id v29 = 0;
    }
    v53 = v5;
    id v30 = v29;

    id v31 = [v30 dimmingView];
    CGPoint v32 = [v31 layer];
    [v32 setHitTestsAsOpaque:0];

    id v33 = [v30 _confinedDimmingView];
    id v34 = [v33 layer];
    [v34 setHitTestsAsOpaque:0];

    v35 = [MEMORY[0x1E4FB22B0] appearancePreferringDimmingVisible:0];
    [v30 _setStandardAppearance:v35];

    [v30 setSourceView:self->_sidebarComplicationGallerySourceView];
    uint64_t v49 = v30;
    [v30 setDelegate:self];
    [(PREditingSceneViewController *)self presentViewController:v25 animated:1 completion:0];
    [(PREditingSceneViewController *)self setPresentedSidebarComplicationsGallery:v25];
    [(PREditingSceneViewController *)self setFocusedElement:3];
    [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
    [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
    CGPoint v36 = [(PREditingSceneViewController *)self addWidgetSheetConfigurationManager];
    uint64_t v50 = v25;
    [v36 updatePresentedWidgetEditingViewController:v25];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obj = self->_graphicComplicationSuggestionSets;
    uint64_t v56 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v56)
    {
      uint64_t v55 = *(void *)v62;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v62 != v55) {
            objc_enumerationMutation(obj);
          }
          CGPoint v38 = *(void **)(*((void *)&v61 + 1) + 8 * v37);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          CGSize v39 = [v38 complications];
          uint64_t v40 = [v39 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v58;
            do
            {
              uint64_t v43 = 0;
              do
              {
                if (*(void *)v58 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void *)(*((void *)&v57 + 1) + 8 * v43);
                id v45 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
                v46 = [v45 objectForKey:v44];

                if (!v46)
                {
                  uint64_t v47 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
                  [v47 setObject:&unk_1ED9EEE30 forKey:v44];
                }
                ++v43;
              }
              while (v41 != v43);
              uint64_t v41 = [v39 countByEnumeratingWithState:&v57 objects:v66 count:16];
            }
            while (v41);
          }

          ++v37;
        }
        while (v37 != v56);
        uint64_t v56 = [(NSArray *)obj countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v56);
    }

    uint64_t v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v48 addObserver:self selector:sel_presentedViewControllerDismissalWillBegin_ name:*MEMORY[0x1E4FB2E68] object:v50];
    [v48 addObserver:self selector:sel_presentedViewControllerDismissalDidEnd_ name:*MEMORY[0x1E4FB2E60] object:v50];

    uint64_t v4 = v53;
  }
}

- (void)_presentInlineComplicationGallery
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(PREditingSceneViewController *)self _performWidgetDescriptorDiscovery];
  uint64_t v3 = [[PRInlineComplicationGalleryViewController alloc] initWithSuggestionSet:self->_inlineComplicationSuggestionSet selectedComplication:self->_selectedInlineComplication alternateDateEnabled:self->_alternateDateEnabled];
  [(PRInlineComplicationGalleryViewController *)v3 setDelegate:self];
  double v14 = v3;
  uint64_t v4 = [(PREditingSceneViewController *)self _configureNavigationControllerForGalleryViewController:v3];
  [(PREditingSceneViewController *)self setPresentedInlineComplicationsGallery:v4];
  [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
  [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
  [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
  [(PREditingSceneViewController *)self presentViewController:v4 animated:1 completion:0];
  [(PREditingSceneViewController *)self setFocusedElement:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(ATXComplicationSet *)self->_inlineComplicationSuggestionSet complications];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        double v11 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
        double v12 = [v11 objectForKey:v10];

        if (!v12)
        {
          double v13 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
          [v13 setObject:&unk_1ED9EEE30 forKey:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)_performWidgetDescriptorDiscovery
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F58D08]);
  [v2 userEnteredAddGalleryForHost:@"Complications"];
}

- (void)_updateComplicationContainerVisibility
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [(PREditingSceneViewController *)self complicationContainerViewControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
          double v11 = [(PREditingSceneViewController *)self view];
          double v12 = [v11 window];
          double v13 = [v12 windowScene];
          uint64_t v14 = [v13 interfaceOrientation];

          long long v15 = [v10 widgetGridViewController];
          long long v16 = [v15 view];

          [v16 setHidden:(unint64_t)(v14 - 3) < 2];
          long long v17 = [v10 sidebarWidgetGridViewController];
          long long v18 = [v17 view];

          [v18 setHidden:(unint64_t)(v14 - 1) < 2];
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)_shouldAllowGalleryPresentationForLocation:(int64_t)a3
{
  return ![(PREditingSceneViewController *)self _areComplicationsDisallowed]
      && ![(PREditingSceneViewController *)self isClientPresentingModalViewController]&& ![(PREditingSceneViewController *)self areControlsHidden]&& ![(PREditingSceneViewController *)self _isPosterCoveredByModalPresentation]&& [(PREditingSceneViewController *)self variant] != 1;
}

- (BOOL)_shouldAllowAddComplicationsTapGestureForLocation:(int64_t)a3
{
  BOOL v5 = -[PREditingSceneViewController _shouldAllowGalleryPresentationForLocation:](self, "_shouldAllowGalleryPresentationForLocation:");
  uint64_t v6 = [(PREditingSceneViewController *)self view];
  uint64_t v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];
  uint64_t v9 = [v8 interfaceOrientation];

  if (a3 == 1)
  {
    BOOL v10 = [(PREditingSceneViewController *)self _hasSidebarComplications];
    BOOL v11 = !v5;
    unint64_t v12 = v9 - 3;
  }
  else
  {
    if (a3) {
      return v5;
    }
    BOOL v10 = [(PREditingSceneViewController *)self _hasGraphicComplications];
    BOOL v11 = !v5;
    unint64_t v12 = v9 - 1;
  }
  BOOL v13 = v12 < 2;
  BOOL v14 = !v11 && v13;
  return !v10 && v14;
}

- (BOOL)_shouldAllowInlineComplicationTapGesture
{
  if ([(PREditingSceneViewController *)self _areComplicationsDisallowed]
    || [(PREditingSceneViewController *)self isClientPresentingModalViewController]|| [(PREditingSceneViewController *)self areControlsHidden])
  {
    return 0;
  }
  uint64_t v4 = [(PREditingSceneViewController *)self presentedInlineComplicationsGallery];

  if (v4) {
    return 1;
  }
  if ([(PREditingSceneViewController *)self _isPosterCoveredByModalPresentation]) {
    return 0;
  }
  return [(PREditingSceneViewController *)self variant] != 1;
}

- (void)_updateAddComplicationsTapGestureAllowed
{
  uint64_t v3 = [(PREditingSceneViewController *)self complicationsAddGestureView];
  objc_msgSend(v3, "setHidden:", -[PREditingSceneViewController _shouldAllowAddComplicationsTapGestureForLocation:](self, "_shouldAllowAddComplicationsTapGestureForLocation:", 0) ^ 1);

  uint64_t v4 = [(PREditingSceneViewController *)self sidebarComplicationAddGestureView];
  objc_msgSend(v4, "setHidden:", -[PREditingSceneViewController _shouldAllowAddComplicationsTapGestureForLocation:](self, "_shouldAllowAddComplicationsTapGestureForLocation:", 1) ^ 1);

  LODWORD(v4) = [(PREditingSceneViewController *)self _shouldAllowInlineComplicationTapGesture];
  id v5 = [(PREditingSceneViewController *)self inlineComplicationGestureView];
  [v5 setHidden:v4 ^ 1];
}

- (void)_updateLocalControlsHiddenWithAnimationSettings:(id)a3
{
  id v4 = a3;
  if ([(PREditingSceneViewController *)self areControlsHidden]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  uint64_t v6 = [(PREditingSceneViewController *)self quickActionEditingViewController];
  uint64_t v7 = [v6 view];

  if (v4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F4F898];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __80__PREditingSceneViewController__updateLocalControlsHiddenWithAnimationSettings___block_invoke;
    v9[3] = &unk_1E54DB6C8;
    id v10 = v7;
    double v11 = v5;
    [v8 animateWithSettings:v4 actions:v9];
  }
  else
  {
    [v7 setAlpha:v5];
  }
}

uint64_t __80__PREditingSceneViewController__updateLocalControlsHiddenWithAnimationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

- (void)inlineComplicationGestureViewTapped:(id)a3
{
  id v5 = [(PREditingSceneViewController *)self selectedInlineComplication];
  if (v5
    && ([(PREditingSceneViewController *)self presentedInlineComplicationsGallery],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(PREditingSceneViewController *)self _presentIntentConfigurationForComplicationDescriptorIfPossible:v5];
  }
  else
  {
    [(PREditingSceneViewController *)self _presentInlineComplicationGallery];
  }
}

- (void)setDraggingComplication:(BOOL)a3
{
  if (self->_draggingComplication != a3)
  {
    self->_draggingComplication = a3;
    [(PREditingSceneViewController *)self _updateSceneSettingsForDepthEffectDisallowed];
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
  }
}

- (void)setClientPresentingModalViewController:(BOOL)a3
{
  if (self->_clientPresentingModalViewController != a3)
  {
    self->_clientPresentingModalViewController = a3;
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
  }
}

- (void)_dismissAnyPresentedComplicationGalleryAnimated:(BOOL)a3
{
}

- (void)_dismissAnyPresentedComplicationGalleryAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  BOOL v13 = (void (**)(void))a4;
  uint64_t v6 = [(PREditingSceneViewController *)self presentedComplicationsGallery];
  if (v6
    || ([(PREditingSceneViewController *)self presentedSidebarComplicationsGallery], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v12 = [(PREditingSceneViewController *)self presentedInlineComplicationsGallery];

    if (v12)
    {
      BOOL v7 = 0;
      goto LABEL_5;
    }
    uint64_t v6 = [(PREditingSceneViewController *)self presentedControlsGallery];
    BOOL v7 = v6 == 0;
  }

LABEL_5:
  uint64_t v8 = [(PREditingSceneViewController *)self presentedViewController];
  char v9 = [v8 isBeingDismissed];

  if (v7 || (v9 & 1) != 0)
  {
    if (v13) {
      v13[2]();
    }
  }
  else
  {
    [(PREditingSceneViewController *)self dismissViewControllerAnimated:v4 completion:v13];
  }
  [(PREditingSceneViewController *)self setPresentedComplicationsGallery:0];
  [(PREditingSceneViewController *)self setPresentedSidebarComplicationsGallery:0];
  [(PREditingSceneViewController *)self setPresentedInlineComplicationsGallery:0];
  [(PREditingSceneViewController *)self setPresentedControlsGallery:0];
  [(PREditingSceneViewController *)self setSelectedQuickActionPosition:0];
  id v10 = [(PREditingSceneViewController *)self quickActionEditingViewController];
  [v10 setGalleryPresented:0];

  [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
  [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
  [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
  widgetBeingAdded = self->_widgetBeingAdded;
  self->_widgetBeingAdded = 0;
}

- (void)presentedViewControllerPresentationDidBegin:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(PREditingSceneViewController *)self presentedControlsGallery];

  id v5 = v7;
  if (v7 == v4)
  {
    uint64_t v6 = [(PREditingSceneViewController *)self quickActionEditingViewController];
    [v6 setGalleryPresented:1];

    id v5 = v7;
  }
}

- (void)presentedViewControllerDismissalWillBegin:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(PREditingSceneViewController *)self presentedViewController];

  if (v7 == v4) {
    [(PREditingSceneViewController *)self setFocusedElement:0];
  }
  id v5 = [(PREditingSceneViewController *)self iconViewProvider];
  uint64_t v6 = [v5 dragManager];
  [v6 cancelAllDrags];
}

- (void)presentedViewControllerDismissalDidEnd:(id)a3
{
  id v12 = a3;
  id v4 = [v12 object];
  id v5 = [(PREditingSceneViewController *)self presentedViewController];

  if (v4 == v5)
  {
    uint64_t v6 = [v12 userInfo];
    id v7 = [v6 objectForKey:*MEMORY[0x1E4FB2E58]];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:*MEMORY[0x1E4FB2E68] object:v4];
      [v9 removeObserver:self name:*MEMORY[0x1E4FB2E60] object:v4];

      goto LABEL_11;
    }
    if (v4 == (UINavigationController *)self->_presentedComplicationsGallery)
    {
      id v10 = self;
      uint64_t v11 = 2;
    }
    else if (v4 == (UINavigationController *)self->_presentedSidebarComplicationsGallery)
    {
      id v10 = self;
      uint64_t v11 = 3;
    }
    else
    {
      if (v4 != self->_presentedInlineComplicationsGallery) {
        goto LABEL_11;
      }
      id v10 = self;
      uint64_t v11 = 1;
    }
    [(PREditingSceneViewController *)v10 setFocusedElement:v11];
  }
LABEL_11:
}

- (void)setFocusedElement:(int64_t)a3
{
  self->_focusedElement = a3;
  id v5 = [(PREditingSceneViewController *)self viewIfLoaded];
  uint64_t v6 = [v5 window];
  id v7 = [v6 windowScene];

  int v8 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.3];
  BOOL v9 = [(PREditingSceneViewController *)self _shouldDepthEffectBeDisallowed];
  scene = self->super._scene;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__PREditingSceneViewController_setFocusedElement___block_invoke;
  v13[3] = &unk_1E54DC450;
  BOOL v17 = v9;
  void v13[4] = self;
  id v14 = v8;
  id v15 = v7;
  int64_t v16 = a3;
  id v11 = v7;
  id v12 = v8;
  [(FBScene *)scene updateSettingsWithTransitionBlock:v13];
}

id __50__PREditingSceneViewController_setFocusedElement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_msgSend(v3, "pr_setControlsHidden:", *(void *)(a1 + 56) != 0);
  objc_msgSend(v3, "pr_setFocusedComplicationElement:", *(void *)(a1 + 56));
  objc_msgSend(v3, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 64));
  if ([*(id *)(*(void *)(a1 + 32) + 1032) isActive] && *(void *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4FB1458] transitionContext];
    [*(id *)(a1 + 48) _synchronizeDrawing];
    id v5 = [*(id *)(a1 + 48) _synchronizedDrawingFence];
    [v4 setAnimationFence:v5];

    [v4 setAnimationSettings:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 1208);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "setFocusedElement:animationSettings:", *(void *)(a1 + 56), *(void *)(a1 + 40), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)_configureNavigationControllerForGalleryViewController:(id)a3
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    [v6 configureWithOpaqueBackground];
  }
  else
  {
    [v6 configureWithDefaultBackground];
    uint64_t v7 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:16.0];
    v31[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [v6 setBackgroundEffects:v8];
  }
  uint64_t v9 = [v5 navigationBar];
  [v9 setStandardAppearance:v6];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if (v12 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (isKindOfClass)
  {
    [v5 setModalPresentationStyle:7];
    long long v13 = [v5 popoverPresentationController];
    long long v14 = [(PREditingSceneViewController *)self view];
    [v13 setSourceView:v14];

    +[PREditorElementLayoutController frameForElements:4 variant:3];
    objc_msgSend(v13, "setSourceRect:");
    [v13 setPermittedArrowDirections:1];
    long long v15 = [(PREditingSceneViewController *)self inlineComplicationGestureView];
    id v30 = v15;
    int64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    [v13 setPassthroughViews:v16];

    [v13 setDelegate:self];
  }
  else
  {
    uint64_t v17 = [v5 presentationController];
    uint64_t v18 = objc_opt_class();
    id v19 = v17;
    if (v18)
    {
      if (objc_opt_isKindOfClass()) {
        long long v20 = v19;
      }
      else {
        long long v20 = 0;
      }
    }
    else
    {
      long long v20 = 0;
    }
    id v21 = v20;

    long long v13 = [MEMORY[0x1E4FB1C30] customDetentWithIdentifier:@"ComplicationGalleryDodge" resolver:&__block_literal_global_357];
    id v29 = v13;
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [v21 setDetents:v22];

    [v21 setLargestUndimmedDetentIdentifier:@"ComplicationGalleryDodge"];
    [v21 setPreferredCornerRadius:PRSheetCornerRadius()];
    long long v23 = [v21 dimmingView];
    uint64_t v24 = [v23 layer];
    [v24 setHitTestsAsOpaque:0];

    id v25 = [v21 _confinedDimmingView];
    uint64_t v26 = [v25 layer];
    [v26 setHitTestsAsOpaque:0];

    [v21 setDelegate:self];
    [v21 _setShouldScaleDownBehindDescendantSheets:1];
  }
  uint64_t v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v27 addObserver:self selector:sel_presentedViewControllerDismissalWillBegin_ name:*MEMORY[0x1E4FB2E68] object:v5];
  [v27 addObserver:self selector:sel_presentedViewControllerDismissalDidEnd_ name:*MEMORY[0x1E4FB2E60] object:v5];

  return v5;
}

double __87__PREditingSceneViewController__configureNavigationControllerForGalleryViewController___block_invoke(uint64_t a1, void *a2)
{
  [a2 maximumDetentValue];
  return v2 * 0.6;
}

- (void)_dismissWithAction:(int64_t)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (![(PREditingSceneViewController *)self isDismissing])
  {
    id v5 = PRLogEditing();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v80 = a3;
      _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "Dismiss with action %li", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    [(PREditingSceneViewController *)self setDismissing:1];
    [(PREditingSceneViewController *)self _unregisterComplicationContainerViewControllerDelegates];
    uint64_t v55 = [(PREditingSceneViewController *)self delegate];
    if (a3 == 1 && !v55)
    {
      id v6 = PRLogEditing();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "Discarding updated configuration because no delegate is set", v76, 2u);
      }

      a3 = 0;
    }
    uint64_t v7 = [(PREditingSceneViewController *)self presentedViewController];
    BOOL v8 = v7 == 0;

    if (!v8) {
      [(PREditingSceneViewController *)self _dismissAnyPresentedComplicationGalleryAnimated:1];
    }
    if (a3 == 1)
    {
      uint64_t v51 = [(PRComplicationDescriptor *)self->_selectedInlineComplication PRSWidget];
      uint64_t v9 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
      id v10 = [v9 widgetGridViewController];
      v54 = [v10 model];

      id v11 = [v54 complicationDescriptors];
      uint64_t v12 = objc_msgSend(v11, "bs_map:", &__block_literal_global_360);
      [v54 saveIconStateIfNeeded];
      uint64_t v48 = [v54 iconLayout];
      uint64_t v49 = (void *)v12;
      long long v13 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
      long long v14 = [v13 sidebarWidgetGridViewController];
      v53 = [v14 model];

      long long v15 = [v53 complicationDescriptors];
      uint64_t v16 = objc_msgSend(v15, "bs_map:", &__block_literal_global_362);
      [v53 saveIconStateIfNeeded];
      v46 = [v53 iconLayout];
      uint64_t v47 = (void *)v16;
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v18 = [(PRComplicationDescriptor *)self->_selectedInlineComplication suggestedComplication];

      if (v18)
      {
        id v19 = [(PRComplicationDescriptor *)self->_selectedInlineComplication suggestedComplication];
        long long v20 = [(PRComplicationDescriptor *)self->_selectedInlineComplication uniqueIdentifier];
        [v17 setObject:v19 forKey:v20];
      }
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v21 = v11;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v72 objects:v78 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v73 != v23) {
              objc_enumerationMutation(v21);
            }
            id v25 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            uint64_t v26 = [v25 suggestedComplication];

            if (v26)
            {
              uint64_t v27 = [v25 suggestedComplication];
              id v28 = [v25 uniqueIdentifier];
              [v17 setObject:v27 forKey:v28];
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v72 objects:v78 count:16];
        }
        while (v22);
      }

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v29 = v15;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v68 objects:v77 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v69;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v69 != v31) {
              objc_enumerationMutation(v29);
            }
            id v33 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            id v34 = [v33 suggestedComplication];

            if (v34)
            {
              v35 = [v33 suggestedComplication];
              CGPoint v36 = [v33 uniqueIdentifier];
              [v17 setObject:v35 forKey:v36];
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v68 objects:v77 count:16];
        }
        while (v30);
      }

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __51__PREditingSceneViewController__dismissWithAction___block_invoke_3;
      v58[3] = &unk_1E54DC5F0;
      id v59 = v55;
      long long v60 = self;
      objc_copyWeak(v67, (id *)buf);
      id v37 = v51;
      id v61 = v37;
      id v38 = v46;
      id v62 = v38;
      id v52 = v47;
      id v63 = v52;
      id v39 = v48;
      id v64 = v39;
      id v50 = v49;
      id v65 = v50;
      id v40 = v17;
      id v66 = v40;
      v67[1] = (id)1;
      uint64_t v41 = +[PREditingDidDismissAction acceptChangesWithCompletion:v58];
      scene = self->super._scene;
      uint64_t v43 = [MEMORY[0x1E4F1CAD0] setWithObject:v41];
      [(FBScene *)scene sendActions:v43];

      objc_destroyWeak(v67);
    }
    else
    {
      id v37 = +[PREditingDidDismissAction cancelAction];
      uint64_t v44 = self->super._scene;
      id v45 = [MEMORY[0x1E4F1CAD0] setWithObject:v37];
      [(FBScene *)v44 sendActions:v45];

      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __51__PREditingSceneViewController__dismissWithAction___block_invoke_382;
      v56[3] = &unk_1E54DC618;
      objc_copyWeak(&v57, (id *)buf);
      [v55 editingSceneViewController:self userDidDismissWithAction:a3 updatedConfiguration:0 updatedConfiguredProperties:0 completion:v56];
      objc_destroyWeak(&v57);
    }

    objc_destroyWeak((id *)buf);
  }
}

uint64_t __51__PREditingSceneViewController__dismissWithAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 PRSWidget];
}

uint64_t __51__PREditingSceneViewController__dismissWithAction___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 PRSWidget];
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_3(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v7;
  id v11 = v8;
  id v12 = a1[4];
  objc_copyWeak(v20, a1 + 12);
  id v13 = a1[6];
  id v14 = a1[7];
  id v15 = a1[8];
  id v16 = a1[9];
  id v17 = a1[10];
  id v18 = a1[11];
  v20[1] = a1[13];
  id v19 = v9;
  BSDispatchMain();

  objc_destroyWeak(v20);
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 32) && *(void *)(a1 + 40))
  {
    id WeakRetained = [*(id *)(a1 + 56) configuredProperties];
    id v3 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v4 = [[PRPosterComplicationLayout alloc] initWithInlineComplication:*(void *)(a1 + 64) sidebarComplicationIconLayout:*(void *)(a1 + 72) sidebarComplications:*(void *)(a1 + 80) complicationIconLayout:*(void *)(a1 + 88) complications:*(void *)(a1 + 96)];
    [v3 setComplicationLayout:v4];
    id v5 = [WeakRetained focusConfiguration];
    [v3 setFocusConfiguration:v5];

    long long v72 = [WeakRetained renderingConfiguration];
    objc_msgSend(v3, "setRenderingConfiguration:");
    id v6 = [*(id *)(a1 + 32) role];
    int v7 = [v6 isEqual:@"PRPosterRoleLockScreen"];

    long long v73 = v4;
    if (v7)
    {
      id v8 = [WeakRetained homeScreenConfiguration];
      id v9 = [*(id *)(a1 + 40) homeScreenConfiguration];
      if (v8)
      {
        uint64_t v10 = [v8 configurationApplyingColorPickerConfigurationsFromConfiguration:v9];

        id v9 = (void *)v10;
      }
      if (!v9)
      {
        id v11 = [*(id *)(a1 + 56) path];
        id v12 = [v11 identity];
        id v13 = [v12 provider];
        id v14 = [*(id *)(a1 + 32) role];
        id v9 = +[PRPosterHomeScreenConfiguration defaultHomeScreenConfigurationForProvider:v13 role:v14];
      }
      id v15 = [*(id *)(a1 + 56) path];
      id v16 = +[PRPosterPathUtilities loadHomeScreenConfigurationForPath:v15 error:0];
      id v17 = [v16 customizationConfiguration];

      if (v17)
      {
        id v18 = (void *)[v9 mutableCopy];
        [v18 setCustomizationConfiguration:v17];
        uint64_t v19 = [v18 copy];

        id v9 = (void *)v19;
      }
      [v3 setHomeScreenConfiguration:v9];

      id v4 = v73;
    }
    uint64_t v20 = [WeakRetained quickActionsConfiguration];
    [v3 setQuickActionsConfiguration:v20];
    id v21 = [WeakRetained suggestionMetadata];
    uint64_t v22 = [PRPosterSuggestionMetadata alloc];
    uint64_t v23 = [v21 suggestedGalleryItem];
    uint64_t v24 = *(void *)(a1 + 104);
    long long v70 = v21;
    id v25 = [v21 lastModifiedDate];
    uint64_t v26 = [(PRPosterSuggestionMetadata *)v22 initWithSuggestedGalleryItem:v23 suggestedComplicationsByIdentifier:v24 lastModifiedDate:v25];

    [v3 setSuggestionMetadata:v26];
    uint64_t v27 = [*(id *)(a1 + 32) displayNameLocalizationKey];

    id v28 = [WeakRetained otherMetadata];
    id v29 = v28;
    long long v71 = (void *)v20;
    long long v69 = (void *)v26;
    if (v27)
    {
      uint64_t v30 = (void *)[v28 mutableCopy];

      uint64_t v31 = [*(id *)(a1 + 32) displayNameLocalizationKey];
      [v30 setDisplayNameLocalizationKey:v31];

      id v29 = v30;
    }
    [v3 setOtherMetadata:v29];

    CGPoint v32 = [WeakRetained titleStyleConfiguration];
    if (!v32)
    {
      id v33 = +[PRPosterTimeFontConfiguration defaultConfiguration];
      id v34 = [PRPosterTitleStyleConfiguration alloc];
      v35 = +[PRPosterTitleStyleConfiguration defaultTitleColor];
      CGPoint v36 = +[PRPosterTitleStyleConfiguration defaultTimeNumberingSystem];
      CGPoint v32 = [(PRPosterTitleStyleConfiguration *)v34 initWithTimeFontConfiguration:v33 titleColor:v35 timeNumberingSystem:v36];
    }
    id v37 = *(void **)(*(void *)(a1 + 56) + 1160);
    id v38 = [(PRPosterTitleStyleConfiguration *)v32 effectiveTitleColor];
    id v39 = [*(id *)(a1 + 40) titleStyleConfiguration];
    id v40 = [v39 effectiveTitleColor];
    objc_msgSend(v37, "setColorModified:", objc_msgSend(v38, "isEqual:", v40) ^ 1);

    uint64_t v41 = *(void **)(*(void *)(a1 + 56) + 1160);
    uint64_t v42 = [(PRPosterTitleStyleConfiguration *)v32 timeFontConfiguration];
    uint64_t v43 = [*(id *)(a1 + 40) titleStyleConfiguration];
    uint64_t v44 = [v43 timeFontConfiguration];
    objc_msgSend(v41, "setFontModified:", objc_msgSend(v42, "isEqual:", v44) ^ 1);

    id v45 = *(void **)(*(void *)(a1 + 56) + 1160);
    v46 = [(PRPosterTitleStyleConfiguration *)v32 effectiveTimeNumberingSystem];
    uint64_t v47 = [*(id *)(a1 + 40) titleStyleConfiguration];
    uint64_t v48 = [v47 effectiveTimeNumberingSystem];
    objc_msgSend(v45, "setNumberingSystemModified:", objc_msgSend(v46, "isEqualToString:", v48) ^ 1);

    uint64_t v49 = *(void **)(*(void *)(a1 + 56) + 1160);
    id v50 = [WeakRetained complicationLayout];
    objc_msgSend(v49, "setWidgetsModified:", objc_msgSend(v50, "isEqualToComplicationLayout:", v4) ^ 1);

    uint64_t v51 = [*(id *)(a1 + 32) role];
    LODWORD(v50) = [v51 isEqual:@"PRPosterRoleAmbient"];

    id v52 = v3;
    if (v50)
    {
      v53 = [WeakRetained ambientConfiguration];
      [v3 setAmbientConfiguration:v53];

      v54 = [WeakRetained ambientWidgetLayout];
      [v3 setAmbientWidgetLayout:v54];
    }
    uint64_t v55 = [*(id *)(a1 + 56) path];
    uint64_t v56 = [v55 loadUserInfoWithError:0];

    id v57 = [*(id *)(a1 + 32) loadUserInfoWithError:0];
    long long v68 = (void *)v56;
    objc_msgSend(*(id *)(*(void *)(a1 + 56) + 1160), "setPosterContentModified:", objc_msgSend(*(id *)(a1 + 56), "_posterUserInfo:containsUserChangesFromPrevious:", v57, v56));
    [*(id *)(a1 + 56) setConfiguredProperties:v3];
    if (objc_opt_respondsToSelector())
    {
      long long v58 = *(void **)(a1 + 48);
      uint64_t v59 = *(void *)(a1 + 56);
      uint64_t v60 = *(void *)(a1 + 128);
      id v61 = *(void **)(a1 + 32);
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 3221225472;
      v75[2] = __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_376;
      v75[3] = &unk_1E54DC5A0;
      id v76 = v61;
      id v77 = v3;
      id v78 = *(id *)(a1 + 112);
      objc_copyWeak(&v79, (id *)(a1 + 120));
      [v58 editingSceneViewController:v59 userDidDismissWithAction:v60 updatedConfiguration:v76 updatedConfiguredProperties:v77 completion:v75];
      objc_destroyWeak(&v79);

      id v4 = v73;
      id v52 = v3;
      id v63 = v70;
      id v62 = v71;
    }
    else
    {
      id v65 = PRLogEditing();
      id v63 = v70;
      id v62 = v71;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C1C4000, v65, OS_LOG_TYPE_DEFAULT, "dismissing editing scene view controller without saving because the delegate doesn't want to", buf, 2u);
      }

      [*(id *)(a1 + 112) invalidate];
      [*(id *)(a1 + 56) _finalize];
    }
    id v66 = [MEMORY[0x1E4F4B040] sharedInstance];
    id v67 = [*(id *)(a1 + 56) engagementCountsForViewedSuggestedComplications];
    [v66 logComplicationsSeenInGalleryWithEngagements:v67 completion:&__block_literal_global_379];
  }
  else
  {
    id v64 = PRLogEditing();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      __51__PREditingSceneViewController__dismissWithAction___block_invoke_4_cold_1(v64);
    }

    [*(id *)(a1 + 48) editingSceneViewController:*(void *)(a1 + 56) userDidDismissWithAction:0 updatedConfiguration:0 updatedConfiguredProperties:0 completion:&__block_literal_global_367];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained _finalize];
  }
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_376(uint64_t a1, void *a2)
{
  id v3 = a2;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    id v4 = PRLogEditing();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_376_cold_1();
    }
  }
  [*(id *)(a1 + 48) invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _finalize];
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_377(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = PRLogEditing();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __51__PREditingSceneViewController__dismissWithAction___block_invoke_377_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_382(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finalize];
}

- (BOOL)_posterUserInfo:(id)a3 containsUserChangesFromPrevious:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v8 = [v6 allKeys];
  uint64_t v9 = [v7 setWithArray:v8];

  uint64_t v10 = (void *)MEMORY[0x1E4F1CA80];
  id v11 = [v5 allKeys];
  id v12 = [v10 setWithArray:v11];
  [v9 intersectSet:v12];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v18 = objc_msgSend(v5, "valueForKey:", v17, (void)v22);
        uint64_t v19 = [v6 valueForKey:v17];
        int v20 = BSEqualObjects();

        if (!v20)
        {
          LOBYTE(v14) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v14;
}

- (BOOL)_isPosterCoveredByModalPresentation
{
  id v3 = [(PREditingSceneViewController *)self presentedComplicationsGallery];

  if (v3) {
    return 1;
  }
  uint64_t v4 = [(PREditingSceneViewController *)self presentedSidebarComplicationsGallery];

  if (v4) {
    return 1;
  }
  id v5 = [(PREditingSceneViewController *)self presentedInlineComplicationsGallery];

  if (v5) {
    return 1;
  }
  uint64_t v8 = [(PREditingSceneViewController *)self presentedControlsGallery];
  BOOL v6 = v8 != 0;

  return v6;
}

- (BOOL)_areComplicationsDisallowed
{
  id v2 = [(PREditingSceneViewController *)self posterRole];
  char v3 = [v2 isEqual:@"PRPosterRoleIncomingCall"];

  return v3;
}

- (void)_configureUsingPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PREditingSceneViewController;
  id v4 = a3;
  [(PRSceneViewController *)&v6 _configureUsingPath:v4];
  id v5 = +[PRPosterPathUtilities loadProactiveGalleryOptions:error:](PRPosterPathUtilities, "loadProactiveGalleryOptions:error:", v4, 0, v6.receiver, v6.super_class);

  -[PREditingSceneViewController setHero:](self, "setHero:", [v5 isHero]);
}

- (void)_configureInitialSceneSettings:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PREditingSceneViewController;
  id v4 = a3;
  [(PRSceneViewController *)&v9 _configureInitialSceneSettings:v4];
  id v5 = [(PRSceneViewController *)self contentsIdentity];
  uint64_t v6 = [v5 type];
  if ([(PREditingSceneViewController *)self isHero]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = (unint64_t)(v6 - 1) < 2;
  }
  objc_msgSend(v4, "pr_setEditingContext:", v7);
  objc_msgSend(v4, "pr_setEditingVariant:", -[PREditingSceneViewController variant](self, "variant"));
  objc_msgSend(v4, "pr_setEditingAcceptButtonType:", -[PREditingSceneViewController acceptButtonType](self, "acceptButtonType"));
  objc_msgSend(v4, "pr_setControlsHidden:", -[PREditingSceneViewController areControlsHidden](self, "areControlsHidden"));
  objc_msgSend(v4, "pr_setUsesEditingLayout:", -[PREditingSceneViewController usesEditingLayout](self, "usesEditingLayout"));
  objc_msgSend(v4, "pr_setComplicationsDisallowed:", -[PREditingSceneViewController _areComplicationsDisallowed](self, "_areComplicationsDisallowed"));
  uint64_t v8 = [(PREditingSceneViewController *)self traitCollection];
  objc_msgSend(v4, "pui_setUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
}

- (void)_updateSceneSettingsForPosterCoveredByModalPresentation
{
  BOOL v3 = [(PREditingSceneViewController *)self _isPosterCoveredByModalPresentation];
  scene = self->super._scene;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__PREditingSceneViewController__updateSceneSettingsForPosterCoveredByModalPresentation__block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  BOOL v6 = v3;
  [(FBScene *)scene updateSettingsWithBlock:v5];
}

uint64_t __87__PREditingSceneViewController__updateSceneSettingsForPosterCoveredByModalPresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setCoveredByModalPresentation:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateSceneSettingsForConfiguredWidgets
{
  BOOL v3 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
  id v4 = [v3 widgetGridViewController];
  id v5 = [v4 model];

  BOOL v6 = [v5 complicationDescriptors];
  BOOL v7 = [v6 count] != 0;

  uint64_t v8 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
  objc_super v9 = [v8 sidebarWidgetGridViewController];
  uint64_t v10 = [v9 model];

  id v11 = [v10 complicationDescriptors];
  LOBYTE(v9) = [v11 count] != 0;

  scene = self->super._scene;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PREditingSceneViewController__updateSceneSettingsForConfiguredWidgets__block_invoke;
  v13[3] = &__block_descriptor_34_e33_v16__0__FBSMutableSceneSettings_8l;
  BOOL v14 = v7;
  char v15 = (char)v9;
  [(FBScene *)scene updateSettingsWithBlock:v13];
}

void __72__PREditingSceneViewController__updateSceneSettingsForConfiguredWidgets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "pui_setComplicationRowConfigured:", v3);
  objc_msgSend(v4, "pui_setComplicationSidebarConfigured:", *(unsigned __int8 *)(a1 + 33));
}

- (void)_updatePresentationDismissalGestureView
{
  v46[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PREditingSceneViewController *)self presentationDismissalGestureViews];
  BOOL v4 = [(PREditingSceneViewController *)self _isPosterCoveredByModalPresentation];
  if (v4 && !v3)
  {
    id v5 = [(PREditingSceneViewController *)self presentedComplicationsGallery];

    if (v5)
    {
      uint64_t v6 = 8;
    }
    else
    {
      id v13 = [(PREditingSceneViewController *)self presentedSidebarComplicationsGallery];

      if (v13)
      {
        uint64_t v6 = 16;
      }
      else
      {
        BOOL v14 = [(PREditingSceneViewController *)self presentedInlineComplicationsGallery];

        if (!v14)
        {
          double x = *MEMORY[0x1E4F1DB28];
          double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
          goto LABEL_22;
        }
        uint64_t v6 = 4;
      }
    }
    +[PREditorElementLayoutController frameForElements:v6 variant:2];
    double x = v15;
    double y = v17;
    double width = v19;
    double height = v21;
LABEL_22:
    v47.origin.double x = x;
    v47.origin.double y = y;
    v47.size.double width = width;
    v47.size.double height = height;
    if (!CGRectIsEmpty(v47))
    {
      v48.origin.double x = x;
      v48.origin.double y = y;
      v48.size.double width = width;
      v48.size.double height = height;
      CGRect v49 = CGRectInset(v48, -20.0, -20.0);
      double x = v49.origin.x;
      double y = v49.origin.y;
      double width = v49.size.width;
      double height = v49.size.height;
    }
    long long v23 = objc_alloc_init(PRDismissalOverlayView);
    -[PRDismissalOverlayView setTouchPassthroughRect:](v23, "setTouchPassthroughRect:", x, y, width, height);
    [(PRDismissalOverlayView *)v23 setDelegate:self];
    [(PRDismissalOverlayView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v46[0] = v23;
    long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    [(PREditingSceneViewController *)self setPresentationDismissalGestureViews:v24];

    long long v25 = [(PREditingSceneViewController *)self view];
    [v25 addSubview:v23];
    id v34 = (void *)MEMORY[0x1E4F28DC8];
    id v39 = [(PRDismissalOverlayView *)v23 leadingAnchor];
    id v38 = [v25 leadingAnchor];
    id v37 = [v39 constraintEqualToAnchor:v38];
    v45[0] = v37;
    CGPoint v36 = [(PRDismissalOverlayView *)v23 trailingAnchor];
    v35 = [v25 trailingAnchor];
    uint64_t v26 = [v36 constraintEqualToAnchor:v35];
    v45[1] = v26;
    uint64_t v27 = [(PRDismissalOverlayView *)v23 topAnchor];
    id v28 = [v25 topAnchor];
    id v29 = [v27 constraintEqualToAnchor:v28];
    v45[2] = v29;
    uint64_t v30 = [(PRDismissalOverlayView *)v23 bottomAnchor];
    uint64_t v31 = [v25 bottomAnchor];
    CGPoint v32 = [v30 constraintEqualToAnchor:v31];
    v45[3] = v32;
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
    [v34 activateConstraints:v33];

    uint64_t v3 = 0;
    goto LABEL_25;
  }
  if (v3) {
    char v7 = v4;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v3;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v10);
    }

    [(PREditingSceneViewController *)self setPresentationDismissalGestureViews:0];
  }
LABEL_25:
}

- (BOOL)_hasGraphicComplications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = self->_complicationContainerViewControllers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "widgetGridViewController", (void)v11);
        char v7 = [v6 model];
        id v8 = [v7 complicationDescriptors];

        uint64_t v9 = [v8 count];
        if (v9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_hasSidebarComplications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = self->_complicationContainerViewControllers;
  uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "sidebarWidgetGridViewController", (void)v11);
        char v7 = [v6 model];
        id v8 = [v7 complicationDescriptors];

        uint64_t v9 = [v8 count];
        if (v9)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSHashTable *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_shouldDepthEffectBeDisallowed
{
  int64_t v3 = [(PREditingSceneViewController *)self variant];
  if (v3 != 1)
  {
    uint64_t v4 = [(PREditingSceneViewController *)self view];
    id v5 = [v4 window];
    uint64_t v6 = [v5 windowScene];
    uint64_t v7 = [v6 interfaceOrientation];

    LOBYTE(v3) = (unint64_t)(v7 - 1) <= 1
              && [(PREditingSceneViewController *)self _hasGraphicComplications]
              || [(PREditingSceneViewController *)self focusedElement] == 2;
  }
  return v3;
}

- (void)_updateSceneSettingsForDepthEffectDisallowed
{
  BOOL v3 = [(PREditingSceneViewController *)self _shouldDepthEffectBeDisallowed];
  scene = self->super._scene;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PREditingSceneViewController__updateSceneSettingsForDepthEffectDisallowed__block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  BOOL v6 = v3;
  [(FBScene *)scene updateSettingsWithBlock:v5];
}

uint64_t __76__PREditingSceneViewController__updateSceneSettingsForDepthEffectDisallowed__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pr_setDepthEffectDisallowed:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_insertModularComplication:(id)a3 location:(int64_t)a4 animated:(BOOL)a5
{
  id v11 = a3;
  if (!-[PREditingSceneViewController _canAddComplicationDescriptor:forLocation:](self, "_canAddComplicationDescriptor:forLocation:"))
  {
    [(PREditingSceneViewController *)self _presentFullAlertForComplication:v11];
    goto LABEL_10;
  }
  if (a4 == 1)
  {
    uint64_t v7 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
    uint64_t v8 = [v7 sidebarWidgetGridViewController];
  }
  else
  {
    if (a4)
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
    uint64_t v8 = [v7 widgetGridViewController];
  }
  uint64_t v9 = (void *)v8;

LABEL_9:
  uint64_t v10 = [v9 model];
  [v10 addComplicationDescriptor:v11];

LABEL_10:
}

- (void)_presentFullAlertForComplication:(id)a3
{
  id v4 = a3;
  id v5 = PRSharedWidgetDescriptorProvider();
  BOOL v6 = [v4 widget];

  id v21 = [v5 descriptorForPersonality:v6];

  uint64_t v7 = NSString;
  uint64_t v8 = PRBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"COMPLICATION_GALLERY_FULL_MESSAGE" value:&stru_1ED9A3120 table:@"PosterKit"];
  uint64_t v10 = [v21 displayName];
  id v11 = objc_msgSend(v7, "stringWithFormat:", v9, v10);

  long long v12 = (void *)MEMORY[0x1E4FB1418];
  long long v13 = PRBundle();
  long long v14 = [v13 localizedStringForKey:@"COMPLICATION_GALLERY_FULL_TITLE" value:&stru_1ED9A3120 table:@"PosterKit"];
  double v15 = [v12 alertControllerWithTitle:v14 message:v11 preferredStyle:1];

  uint64_t v16 = (void *)MEMORY[0x1E4FB1410];
  double v17 = PRBundle();
  id v18 = [v17 localizedStringForKey:@"OK" value:&stru_1ED9A3120 table:@"PosterKit"];
  double v19 = [v16 actionWithTitle:v18 style:0 handler:0];

  [v15 addAction:v19];
  int v20 = [(PREditingSceneViewController *)self bs_topPresentedViewController];
  [v20 presentViewController:v15 animated:1 completion:0];
}

- (BOOL)_canAddComplicationDescriptor:(id)a3 forLocation:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
    uint64_t v8 = [v7 sidebarWidgetGridViewController];
  }
  else
  {
    if (a4)
    {
      uint64_t v9 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
    uint64_t v8 = [v7 widgetGridViewController];
  }
  uint64_t v9 = (void *)v8;

LABEL_7:
  uint64_t v10 = [v9 model];
  char v11 = [v10 canAddComplicationDescriptor:v6];

  return v11;
}

- (void)setVibrancyConfiguration:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    [(PREditingSceneViewController *)self _updateComplicationsVibrancyConfiguration];
  }
}

- (void)_updateComplicationsVibrancyConfiguration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PREditingSceneViewController *)self vibrancyConfiguration];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_complicationContainerViewControllers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setVibrancyConfiguration:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)_presentIntentConfigurationForComplicationDescriptorIfPossible:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 widget];
  uint64_t v6 = [v5 intentReference];
  uint64_t v7 = [v6 intent];

  if (v7
    && [(PREditingSceneViewController *)self _intentHasConfigurableAttributes:v7])
  {
    [(PREditingSceneViewController *)self _presentIntentConfigurationForComplicationDescriptor:v4];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_presentIntentConfigurationForComplicationDescriptor:(id)a3
{
  id v15 = a3;
  uint64_t v5 = [v15 widget];
  uint64_t v6 = PRSharedWidgetDescriptorProvider();
  uint64_t v7 = [v6 descriptorForPersonality:v5];

  if (!self->_presentedComplicationWidgetConfigurationViewController)
  {
    BOOL v8 = [v7 intentType];

    if (v8)
    {
      long long v9 = [v5 intentReference];
      long long v10 = [v9 intent];
      uint64_t v11 = [v5 family];
      long long v12 = [(PREditingSceneViewController *)self bs_topPresentedViewController];
      long long v13 = [(PREditingSceneViewController *)self _presentIntentConfigurationViewControllerWithIntent:v10 descriptor:v7 family:v11 fromViewController:v12];

      objc_storeStrong((id *)&self->_widgetBeingConfigured, a3);
      presentedComplicationWidgetConfigurationViewController = self->_presentedComplicationWidgetConfigurationViewController;
      self->_presentedComplicationWidgetConfigurationViewController = v13;
    }
  }
}

- (void)_presentIntentConfigurationForQuickActionControl:(id)a3 withPosition:(int64_t)a4
{
  id v17 = a3;
  uint64_t v6 = [v17 identity];
  uint64_t v7 = [v6 intentReference];
  BOOL v8 = [v7 intent];

  if (v8
    && [(PREditingSceneViewController *)self _intentHasConfigurableAttributes:v8])
  {
    [(PREditingSceneViewController *)self setControlIntentBeingConfigured:v17];
    [(PREditingSceneViewController *)self setQuickActionIntentEditPosition:a4];
    long long v9 = [v17 identity];
    long long v10 = [(PREditingSceneViewController *)self _descriptorForControl:v17];
    uint64_t v11 = v10;
    if (!self->_presentedControlWidgetConfigurationViewController)
    {
      long long v12 = [v10 intentType];

      if (v12)
      {
        long long v13 = [v9 intentReference];
        uint64_t v14 = [v13 intent];
        id v15 = [(PREditingSceneViewController *)self _presentIntentConfigurationViewControllerWithIntent:v14 descriptor:v11 family:0 fromViewController:self];

        presentedControlWidgetConfigurationViewController = self->_presentedControlWidgetConfigurationViewController;
        self->_presentedControlWidgetConfigurationViewController = v15;
      }
    }
  }
}

- (id)_descriptorForControl:(id)a3
{
  id v4 = [a3 identity];
  controlExtensionProvider = self->_controlExtensionProvider;
  uint64_t v6 = [v4 extensionIdentity];
  uint64_t v7 = [v6 extensionBundleIdentifier];
  BOOL v8 = [(CHSWidgetExtensionProvider *)controlExtensionProvider widgetExtensionContainerForExtensionBundleIdentifier:v7];

  long long v9 = [v4 extensionIdentity];
  long long v10 = [v8 extensionForExtensionIdentity:v9];

  uint64_t v11 = [v10 orderedControlDescriptors];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__PREditingSceneViewController__descriptorForControl___block_invoke;
  v15[3] = &unk_1E54DAF40;
  id v16 = v4;
  id v12 = v4;
  long long v13 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v15);

  return v13;
}

uint64_t __54__PREditingSceneViewController__descriptorForControl___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 kind];
  id v4 = [*(id *)(a1 + 32) kind];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)_presentIntentConfigurationViewControllerWithIntent:(id)a3 descriptor:(id)a4 family:(int64_t)a5 fromViewController:(id)a6
{
  long long v10 = (objc_class *)MEMORY[0x1E4FB74D8];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  [v14 setIntent:v13];

  id v15 = [v12 displayName];
  [v14 setWidgetDisplayName:v15];

  id v16 = [v12 widgetDescription];
  [v14 setWidgetDescription:v16];

  uint64_t v17 = objc_msgSend(v12, "pr_configurationType");
  [v14 setWidgetConfigurationType:v17];
  [v14 setFamily:a5];
  id v18 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v19 = [v18 userInterfaceIdiom];

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    [v14 setWidgetConfigurationStyle:1];
  }
  int v20 = (void *)[objc_alloc(MEMORY[0x1E4FB74E0]) initWithOptions:v14];
  [v20 setDelegate:self];
  id v21 = [v20 sheetPresentationController];
  [v21 setDelegate:self];

  [v11 presentViewController:v20 animated:1 completion:0];
  return v20;
}

- (BOOL)_intentHasConfigurableAttributes:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [v3 _codableDescription];
    uint64_t v6 = [v5 attributes];
    uint64_t v7 = [v6 allValues];

    char v4 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &__block_literal_global_411);
  }

  return v4;
}

uint64_t __65__PREditingSceneViewController__intentHasConfigurableAttributes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isConfigurable];
}

- (void)_sceneContentReadinessDidChange
{
  v8.receiver = self;
  v8.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v8 _sceneContentReadinessDidChange];
  if ([(PREditingSceneViewController *)self showsContentWhenReady])
  {
    objc_initWeak(&location, self);
    BOOL v3 = [(PRSceneViewController *)self isSceneContentReady];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __63__PREditingSceneViewController__sceneContentReadinessDidChange__block_invoke;
    v4[3] = &unk_1E54DC680;
    objc_copyWeak(&v5, &location);
    BOOL v6 = v3;
    [(PREditingSceneViewController *)self setContentHidden:v3 ^ 1 animated:v3 completion:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __63__PREditingSceneViewController__sceneContentReadinessDidChange__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained && *(unsigned char *)(a1 + 40))
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    char v4 = objc_msgSend(WeakRetained[134], "copy", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          if (objc_opt_respondsToSelector()) {
            [v9 editingSceneViewControllerDidFinishShowingContent:v3];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updateQuickActionsPosterConfigurationForPosition:(int64_t)a3 withControlConfiguration:(id)a4
{
  id v11 = a4;
  uint64_t v6 = [(PRSceneViewController *)self configuredProperties];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(PRSceneViewController *)self configuredProperties];
  long long v9 = [v8 quickActionsConfiguration];
  long long v10 = (PRPosterMutableQuickActionsConfiguration *)[v9 mutableCopy];

  if (!v10) {
    long long v10 = [(PRPosterQuickActionsConfiguration *)[PRPosterMutableQuickActionsConfiguration alloc] initWithLeadingControl:0 trailingControl:0];
  }
  if (a3 == 2)
  {
    [(PRPosterQuickActionsConfiguration *)v10 setTrailingControl:v11];
  }
  else if (a3 == 1)
  {
    [(PRPosterQuickActionsConfiguration *)v10 setLeadingControl:v11];
  }
  [v7 setQuickActionsConfiguration:v10];
  [(PRSceneViewController *)self setConfiguredProperties:v7];
}

- (void)_addWidgetIconView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PREditingSceneViewController *)self focusedElement] == 3;
  uint64_t v6 = [v4 icon];

  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      long long v9 = v8;
    }
    else {
      long long v9 = 0;
    }
  }
  else
  {
    long long v9 = 0;
  }
  id v10 = v9;

  id v34 = [v10 activeWidget];
  id v11 = [v10 gridSizeClass];

  uint64_t v12 = PRWidgetFamilyForIconGridSizeClass(v11);
  id v13 = objc_alloc(MEMORY[0x1E4F58DD8]);
  id v14 = [v34 extensionBundleIdentifier];
  uint64_t v15 = [v34 containerBundleIdentifier];
  id v16 = [v34 kind];
  uint64_t v17 = (void *)[v13 initWithExtensionBundleIdentifier:v14 containerBundleIdentifier:v15 kind:v16 family:v12 intent:0];

  id v18 = [PRComplicationDescriptor alloc];
  uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
  int v20 = [v19 UUIDString];
  id v21 = [(PRComplicationDescriptor *)v18 initWithUniqueIdentifier:v20 widget:v17];

  [(PREditingSceneViewController *)self _insertModularComplication:v21 location:v5 animated:1];
  long long v22 = [(PRComplicationDescriptor *)v21 suggestedComplication];

  if (v22)
  {
    long long v23 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
    long long v24 = [(PRComplicationDescriptor *)v21 suggestedComplication];
    uint64_t v25 = [v23 objectForKey:v24];
    uint64_t v26 = (void *)v25;
    uint64_t v27 = &unk_1ED9EEE30;
    if (v25) {
      uint64_t v27 = (void *)v25;
    }
    id v28 = v27;

    id v29 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
    uint64_t v30 = NSNumber;
    int v31 = [v28 intValue];

    CGPoint v32 = [v30 numberWithInt:(v31 + 1)];
    id v33 = [(PRComplicationDescriptor *)v21 suggestedComplication];
    [v29 setObject:v32 forKey:v33];
  }
}

+ (id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_onceToken != -1) {
    dispatch_once(&_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_onceToken, block);
  }
  id v2 = [(id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain data];
  BOOL v3 = [v2 customOverrides];

  return v3;
}

uint64_t __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA94F0]);
  BOOL v3 = (void *)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain;
  _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain = (uint64_t)v2;

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_2;
  v5[3] = &__block_descriptor_40_e46_v16__0__STStatusBarOverridesStatusDomainData_8l;
  void v5[4] = *(void *)(a1 + 32);
  return [(id)_startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides_sOverrideDomain observeDataWithBlock:v5];
}

void __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 customOverrides];
  if ([v3 dateFromEntriesIncludesTime])
  {
    id v4 = [v3 dateFromEntries];
  }
  else
  {
    id v4 = 0;
  }
  BOOL v5 = [*(id *)(a1 + 32) overrideObservingViewControllers];
  uint64_t v6 = [v5 allObjects];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_3;
  v9[3] = &unk_1E54DAA08;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __100__PREditingSceneViewController__startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides__block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setOverrideDate:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (NSHashTable)overrideObservingViewControllers
{
  if (overrideObservingViewControllers_onceToken[0] != -1) {
    dispatch_once(overrideObservingViewControllers_onceToken, &__block_literal_global_426);
  }
  id v2 = (void *)overrideObservingViewControllers_sOverrideObservingViewControllers;
  return (NSHashTable *)v2;
}

uint64_t __64__PREditingSceneViewController_overrideObservingViewControllers__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v1 = overrideObservingViewControllers_sOverrideObservingViewControllers;
  overrideObservingViewControllers_sOverrideObservingViewControllers = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_setUpDateOverriding
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [v3 overrideObservingViewControllers];
  [v4 addObject:self];

  id v6 = [v3 _startObservingSystemStatusOverridesIfNeededAndFetchInitialOverrides];
  if ([v6 dateFromEntriesIncludesTime])
  {
    uint64_t v5 = [v6 dateFromEntries];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(PREditingSceneViewController *)self setOverrideDate:v5];
}

- (void)_setUpRemotePresentationForContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 presentedScreenRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v10 = *(void *)&a3;
  uint64_t v15 = objc_alloc_init(PREditingRemotePresentationView);
  uint64_t v12 = [(PREditingRemotePresentationView *)v15 portalLayer];
  [v12 setSourceContextId:v10];
  [v12 setSourceLayerRenderId:a4];
  id v13 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  [v13 setView:v15];
  id v14 = [(PREditingSceneViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v14, "editingSceneViewController:wantsRemotePresentationOfViewController:contentScreenRect:", self, v13, x, y, width, height);
  }
}

- (void)_finalize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_didFinalize)
  {
    self->_didFinalize = 1;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = (void *)[(NSHashTable *)self->_observers copy];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            [v8 editingSceneViewControllerDidFinalize:self];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PREditingSceneViewController;
  uint64_t v7 = [(PRSceneViewController *)&v28 scene:a3 handleActions:v6];
  long long v23 = v7;
  if (v7) {
    id v8 = (id)[v7 mutableCopy];
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  long long v9 = v8;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v16 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v18 = [v15 sourceContextId];
          uint64_t v19 = [v15 sourceLayerRenderId];
          [v15 presentedViewScreenRect];
          -[PREditingSceneViewController _setUpRemotePresentationForContextId:layerRenderId:presentedScreenRect:](self, "_setUpRemotePresentationForContextId:layerRenderId:presentedScreenRect:", v18, v19);
        }
        else
        {
          int v20 = self;
          char v21 = objc_opt_isKindOfClass();

          if ((v21 & 1) == 0) {
            continue;
          }
          -[PREditingSceneViewController _dismissWithAction:](self, "_dismissWithAction:", [v15 userAcceptedChanges]);
        }
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v12);
  }

  return v9;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 clientSettings];
  if ((objc_msgSend(v11, "pr_parallaxEnabledDidChange") & 1) != 0
    || objc_msgSend(v11, "pr_depthEffectDisabledDidChange"))
  {
    uint64_t v15 = -[PRPosterRenderingConfiguration initWithDepthEffectDisabled:parallaxEnabled:]([PRPosterRenderingConfiguration alloc], "initWithDepthEffectDisabled:parallaxEnabled:", objc_msgSend(v14, "pr_isDepthEffectDisabled"), objc_msgSend(v14, "pr_isParallaxEnabled"));
    id v16 = [(PRSceneViewController *)self configuredProperties];
    uint64_t v17 = (void *)[v16 mutableCopy];

    [v17 setRenderingConfiguration:v15];
    [(PRSceneViewController *)self setConfiguredProperties:v17];
  }
  v23.receiver = self;
  v23.super_class = (Class)PREditingSceneViewController;
  [(PRSceneViewController *)&v23 scene:v10 didUpdateClientSettingsWithDiff:v11 oldClientSettings:v12 transitionContext:v13];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  long long v22 = v10;
  id v18 = v10;
  _UISceneSettingsDiffActionPerformChangesWithTransitionContext();

  uint64_t v19 = objc_msgSend(v18, "clientSettings", v21, 3221225472, __106__PREditingSceneViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke, &unk_1E54DC6C8);
  uint64_t v20 = objc_msgSend(v19, "pr_areContentsCoveredByModalPresentation");

  [(PREditingSceneViewController *)self setClientPresentingModalViewController:v20];
}

void __106__PREditingSceneViewController_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) clientSettings];
  objc_msgSend(v2, "pr_vibrancyConfiguration");
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 40) setVibrancyConfiguration:v3];
}

- (void)complicationContainerViewController:(id)a3 didUpdateModelContentForLocation:(int64_t)a4
{
  [(PREditingSceneViewController *)self _updateSceneSettingsForDepthEffectDisallowed];
  [(PREditingSceneViewController *)self _updateSceneSettingsForConfiguredWidgets];
  [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
}

- (void)complicationContainerViewControllerDidTapAdd:(id)a3 forLocation:(int64_t)a4
{
  if ([(PREditingSceneViewController *)self _shouldAllowGalleryPresentationForLocation:a4])
  {
    if (a4 == 1)
    {
      [(PREditingSceneViewController *)self _presentSidebarComplicationGallery];
    }
    else if (!a4)
    {
      [(PREditingSceneViewController *)self _presentComplicationGallery];
    }
  }
  else
  {
    id v6 = PRLogEditing();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_18C1C4000, v6, OS_LOG_TYPE_DEFAULT, "Gallery presentation disallowed, ignoring tap", v7, 2u);
    }
  }
}

- (void)complicationContainerViewController:(id)a3 didEditComplication:(id)a4
{
}

- (void)complicationContainerViewController:(id)a3 isAttemptingDragToAddComplication:(id)a4
{
  id v8 = (PRComplicationDescriptor *)a4;
  uint64_t v5 = [(PRComplicationDescriptor *)v8 widget];
  widgetBeingAdded = v8;
  if (!v5) {
    widgetBeingAdded = self->_widgetBeingAdded;
  }
  uint64_t v7 = widgetBeingAdded;

  if (![(PREditingSceneViewController *)self _canAddComplicationDescriptor:v7 forLocation:[(PREditingSceneViewController *)self focusedElement] == 3])[(PREditingSceneViewController *)self _presentFullAlertForComplication:v7]; {
}
  }

- (void)complicationGalleryViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
}

- (void)complicationGalleryViewControllerDidFinish:(id)a3
{
  uint64_t v4 = [a3 navigationController];
  uint64_t v5 = [(PREditingSceneViewController *)self presentedComplicationsGallery];

  if (v4 == v5)
  {
    [(PREditingSceneViewController *)self setPresentedComplicationsGallery:0];
    [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
    [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
  }
}

- (void)complicationGalleryViewController:(id)a3 didBeginDraggingComplication:(id)a4
{
  uint64_t v5 = (PRComplicationDescriptor *)a4;
  [(PREditingSceneViewController *)self setDraggingComplication:1];
  widgetBeingAdded = self->_widgetBeingAdded;
  self->_widgetBeingAdded = v5;
}

- (void)complicationGalleryViewController:(id)a3 didEndDraggingComplication:(id)a4 withOperation:(unint64_t)a5
{
}

- (void)inlineComplicationGalleryViewController:(id)a3 didSelectComplication:(id)a4
{
  id v17 = a4;
  [(PREditingSceneViewController *)self setSelectedInlineComplication:v17];
  uint64_t v5 = [v17 suggestedComplication];

  if (v5)
  {
    id v6 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
    uint64_t v7 = [v17 suggestedComplication];
    uint64_t v8 = [v6 objectForKey:v7];
    long long v9 = (void *)v8;
    id v10 = &unk_1ED9EEE30;
    if (v8) {
      id v10 = (void *)v8;
    }
    id v11 = v10;

    id v12 = [(PREditingSceneViewController *)self engagementCountsForViewedSuggestedComplications];
    id v13 = NSNumber;
    int v14 = [v11 intValue];

    uint64_t v15 = [v13 numberWithInt:(v14 + 1)];
    id v16 = [v17 suggestedComplication];
    [v12 setObject:v15 forKey:v16];
  }
}

- (void)inlineComplicationGalleryViewController:(id)a3 didToggleAlternateDate:(BOOL)a4
{
}

- (void)inlineComplicationGalleryViewControllerDidFinish:(id)a3
{
  uint64_t v4 = [a3 navigationController];
  uint64_t v5 = [(PREditingSceneViewController *)self presentedInlineComplicationsGallery];

  if (v4 == v5)
  {
    [(PREditingSceneViewController *)self setPresentedInlineComplicationsGallery:0];
    [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
    [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
  }
}

- (void)widgetConfigurationViewController:(id)a3 didFinishWithIntent:(id)a4
{
  v35 = (WFWidgetConfigurationViewController *)a3;
  id v6 = a4;
  if (self->_presentedComplicationWidgetConfigurationViewController != v35)
  {
    if (self->_presentedControlWidgetConfigurationViewController != v35) {
      goto LABEL_19;
    }
    int64_t v7 = [(PREditingSceneViewController *)self quickActionIntentEditPosition];
    uint64_t v8 = [(PREditingSceneViewController *)self controlIntentBeingConfigured];
    id v9 = objc_alloc(MEMORY[0x1E4F58C80]);
    id v10 = [v8 identity];
    id v11 = [v10 extensionIdentity];
    id v12 = [v8 identity];
    id v13 = [v12 kind];
    int v14 = (void *)[v9 initWithExtensionIdentity:v11 kind:v13 intent:v6];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5AE80]), "initWithIdentity:type:size:", v14, objc_msgSend(v8, "type"), objc_msgSend(v8, "size"));
    if (v7 == 2)
    {
      id v16 = [(PREditingSceneViewController *)self quickActionEditingViewController];
      [v16 setTrailingControl:v15];
    }
    else
    {
      if (v7 != 1)
      {
LABEL_17:
        controlIntentBeingConfigured = self->_controlIntentBeingConfigured;
        self->_controlIntentBeingConfigured = 0;

        presentedControlWidgetConfigurationViewController = self->_presentedControlWidgetConfigurationViewController;
        self->_presentedControlWidgetConfigurationViewController = 0;

        self->_quickActionIntentEditPosition = 0;
        [(WFWidgetConfigurationViewController *)v35 dismissViewControllerAnimated:1 completion:0];

        goto LABEL_18;
      }
      id v16 = [(PREditingSceneViewController *)self quickActionEditingViewController];
      [v16 setLeadingControl:v15];
    }

    goto LABEL_17;
  }
  id v17 = [(PRComplicationDescriptor *)self->_widgetBeingConfigured widget];
  uint64_t v8 = [v17 widgetByReplacingIntent:v6];

  int v14 = (void *)[(PRComplicationDescriptor *)self->_widgetBeingConfigured copy];
  [v14 setWidget:v8];
  if (self->_widgetBeingConfigured != self->_selectedInlineComplication)
  {
    id v33 = v14;
    id v18 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
    uint64_t v19 = [v18 widgetGridViewController];
    uint64_t v20 = [v19 model];

    uint64_t v21 = [(NSHashTable *)self->_complicationContainerViewControllers anyObject];
    long long v22 = [v21 sidebarWidgetGridViewController];
    objc_super v23 = [v22 model];

    long long v24 = [v20 complicationDescriptors];
    long long v25 = [v23 complicationDescriptors];
    uint64_t v26 = [v24 indexOfObject:self->_widgetBeingConfigured];
    uint64_t v27 = [v25 indexOfObject:self->_widgetBeingConfigured];
    id v34 = v20;
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v14 = v33;
      if (v27 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_super v28 = [(PRComplicationDescriptor *)self->_widgetBeingConfigured uniqueIdentifier];
      [v23 updateIntent:v6 forWidgetWithIdentifier:v28];
    }
    else
    {
      objc_super v28 = [(PRComplicationDescriptor *)self->_widgetBeingConfigured uniqueIdentifier];
      [v20 updateIntent:v6 forWidgetWithIdentifier:v28];
      int v14 = v33;
    }

    goto LABEL_13;
  }
  [(PREditingSceneViewController *)self setSelectedInlineComplication:v14];
LABEL_14:
  widgetBeingConfigured = self->_widgetBeingConfigured;
  self->_widgetBeingConfigured = 0;

  presentedComplicationWidgetConfigurationViewController = self->_presentedComplicationWidgetConfigurationViewController;
  self->_presentedComplicationWidgetConfigurationViewController = 0;

  [(WFWidgetConfigurationViewController *)v35 dismissViewControllerAnimated:1 completion:0];
LABEL_18:

LABEL_19:
}

- (void)quickActionEditingViewController:(id)a3 didTapAddForPosition:(int64_t)a4
{
  id v6 = a3;
  id v9 = v6;
  if (a4 == 2)
  {
    uint64_t v7 = [v6 trailingControl];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    uint64_t v7 = [v6 leadingControl];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:
  [(PREditingSceneViewController *)self setSelectedQuickActionPosition:a4];
  [(PREditingSceneViewController *)self _presentControlsGalleryWithSelectedControl:v8];
}

- (void)quickActionEditingViewController:(id)a3 didRequestIntentConfigurationForControl:(id)a4 withPosition:(int64_t)a5
{
}

- (void)quickActionEditingViewController:(id)a3 didSetControl:(id)a4 forPosition:(int64_t)a5
{
  id v10 = a4;
  uint64_t v7 = [PRQuickActionControlConfiguration alloc];
  if (v10)
  {
    uint64_t v8 = [v10 identity];
    id v9 = -[PRQuickActionControlConfiguration initWithControlIdentity:type:](v7, "initWithControlIdentity:type:", v8, [v10 type]);
  }
  else
  {
    id v9 = [(PRQuickActionControlConfiguration *)v7 initWithCategory:0];
  }
  [(PREditingSceneViewController *)self _updateQuickActionsPosterConfigurationForPosition:a5 withControlConfiguration:v9];
}

- (void)controlsGalleryViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 control];
  if (!v8)
  {
    int64_t v17 = [(PREditingSceneViewController *)self selectedQuickActionPosition];
    if (v17)
    {
      if (v17 == 2)
      {
        id v18 = [(PREditingSceneViewController *)self quickActionEditingViewController];
        [v18 setTrailingControl:v9];
      }
      else
      {
        if (v17 != 1)
        {
LABEL_12:
          int64_t v19 = [(PREditingSceneViewController *)self selectedQuickActionPosition];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          id v20[2] = __88__PREditingSceneViewController_controlsGalleryViewController_didFinishWithResult_error___block_invoke;
          v20[3] = &unk_1E54DC6F0;
          uint64_t v21 = v7;
          long long v22 = self;
          id v23 = v9;
          int64_t v24 = v19;
          [(PREditingSceneViewController *)self _dismissAnyPresentedComplicationGalleryAnimated:1 withCompletion:v20];

          id v10 = v21;
          goto LABEL_13;
        }
        id v18 = [(PREditingSceneViewController *)self quickActionEditingViewController];
        [v18 setLeadingControl:v9];
      }
    }
    else
    {
      id v18 = PRLogEditing();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18C1C4000, v18, OS_LOG_TYPE_DEFAULT, "Do nothing since we finished with control from no position. But how did we get here?", buf, 2u);
      }
    }

    goto LABEL_12;
  }
  id v10 = PRLogEditing();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[PREditingSceneViewController controlsGalleryViewController:didFinishWithResult:error:]((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);
  }
LABEL_13:
}

uint64_t __88__PREditingSceneViewController_controlsGalleryViewController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) promptsForUserConfiguration];
  if (result)
  {
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _presentIntentConfigurationForQuickActionControl:v4 withPosition:v5];
  }
  return result;
}

- (void)forwardAppearanceNotificationName:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PRLogEditing();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v4;
    _os_log_impl(&dword_18C1C4000, v5, OS_LOG_TYPE_DEFAULT, "Forwarding appearance notification to extension: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v6 = [(FBScene *)self->super._scene isActive];
  id v7 = PRLogEditing();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [NSNumber numberWithBool:v6];
    int v13 = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_18C1C4000, v7, OS_LOG_TYPE_DEFAULT, "Scene active: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  if (v6)
  {
    id v9 = [[PREditingForwardExtensionAppearanceNotificationAction alloc] initWithNotificationName:v4];
    scene = self->super._scene;
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [(FBScene *)scene sendActions:v11];
  }
  uint64_t v12 = [v4 isEqualToString:*MEMORY[0x1E4F28288]];
  if ((v12 & 1) != 0 || [v4 isEqualToString:*MEMORY[0x1E4F28270]]) {
    [(PREditingSceneViewController *)self setHostApplicationHasResignedActive:v12];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v11 = [a3 presentedViewController];
  id v4 = [(PREditingSceneViewController *)self presentedComplicationsGallery];

  if (v11 == v4)
  {
    [(PREditingSceneViewController *)self setPresentedComplicationsGallery:0];
LABEL_10:
    [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
    [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
    uint64_t isKindOfClass = [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
    goto LABEL_11;
  }
  uint64_t v5 = [(PREditingSceneViewController *)self presentedSidebarComplicationsGallery];

  if (v11 == v5)
  {
    [(PREditingSceneViewController *)self setPresentedSidebarComplicationsGallery:0];
    goto LABEL_10;
  }
  uint64_t v6 = [(PREditingSceneViewController *)self presentedInlineComplicationsGallery];

  if (v11 == v6)
  {
    [(PREditingSceneViewController *)self setPresentedInlineComplicationsGallery:0];
    goto LABEL_10;
  }
  id v7 = [(PREditingSceneViewController *)self presentedControlsGallery];

  if (v11 == v7)
  {
    [(PREditingSceneViewController *)self setPresentedControlsGallery:0];
    [(PREditingSceneViewController *)self _updateSceneSettingsForPosterCoveredByModalPresentation];
    [(PREditingSceneViewController *)self _updatePresentationDismissalGestureView];
    [(PREditingSceneViewController *)self _updateAddComplicationsTapGestureAllowed];
    [(PREditingSceneViewController *)self setSelectedQuickActionPosition:0];
    id v10 = [(PREditingSceneViewController *)self quickActionEditingViewController];
    [v10 setGalleryPresented:0];
  }
  else
  {
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    id v9 = v11;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_12;
    }
    uint64_t isKindOfClass = [v11 finishWithCurrentConfiguration];
  }
LABEL_11:
  id v9 = v11;
LABEL_12:
  MEMORY[0x1F41817F8](isKindOfClass, v9);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  uint64_t v6 = [(PREditingSceneViewController *)self complicationsAddGestureView];

  if (v5 == v6)
  {
    uint64_t v12 = self;
    uint64_t v13 = 0;
LABEL_7:
    BOOL v14 = [(PREditingSceneViewController *)v12 _shouldAllowAddComplicationsTapGestureForLocation:v13];
LABEL_9:
    BOOL v11 = v14;
    goto LABEL_10;
  }
  id v7 = [v4 view];
  id v8 = [(PREditingSceneViewController *)self sidebarComplicationAddGestureView];

  if (v7 == v8)
  {
    uint64_t v12 = self;
    uint64_t v13 = 1;
    goto LABEL_7;
  }
  id v9 = [v4 view];
  id v10 = [(PREditingSceneViewController *)self inlineComplicationGestureView];

  if (v9 == v10)
  {
    BOOL v14 = [(PREditingSceneViewController *)self _shouldAllowInlineComplicationTapGesture];
    goto LABEL_9;
  }
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
}

uint64_t __72__PREditingSceneViewController_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentedSidebarComplicationsGallery];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 presentedSidebarComplicationsGallery];
  }
  else
  {
    id v7 = [v3 presentedComplicationsGallery];

    if (!v7) {
      goto LABEL_9;
    }
    id v8 = [*(id *)(a1 + 32) presentedComplicationsGallery];
    int v9 = [v8 conformsToProtocol:&unk_1EDA37B28];

    id v10 = *(void **)(a1 + 32);
    if (!v9)
    {
      [v10 _updateApplicationWidgetCollectionsForPresentedComplicationGallery];
      goto LABEL_9;
    }
    uint64_t v4 = [v10 presentedComplicationsGallery];
  }
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) addWidgetSheetConfigurationManager];
    [v6 updatePresentedWidgetEditingViewController:v5];
  }
LABEL_9:
  BOOL v11 = [*(id *)(a1 + 32) quickActionEditingViewController];
  [v11 validateControls];

  uint64_t v12 = *(void **)(a1 + 32);
  return [v12 _validateInlineComplication];
}

- (void)_updateApplicationWidgetCollectionsForPresentedComplicationGallery
{
  id v3 = [(PREditingSceneViewController *)self presentedComplicationsGallery];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 viewControllers];

  int v9 = [v8 firstObject];
  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  BOOL v14 = [(PREditingSceneViewController *)self addWidgetSheetConfigurationManager];
  uint64_t v15 = PRIconGridSizeClassSetForWidgetFamilyMask([v14 allowedWidgetFamilies]);

  uint64_t v16 = [(PREditingSceneViewController *)self addWidgetSheetConfigurationManager];
  id v19 = v15;
  int64_t v17 = [v16 applicationWidgetCollectionsForEditingViewController:self withAllowedSizeClasses:&v19 allowingNonStackableItems:0];
  id v18 = v19;

  [v13 setApplicationWidgetCollections:v17];
}

- (unint64_t)presenterType
{
  return 3;
}

- (BOOL)isDisplayingEditingButtons
{
  return 0;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
}

- (id)addWidgetSheetViewController:(id)a3 detailViewControllerForWidgetCollection:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FA6238];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  uint64_t v10 = [v9 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
  [v10 iconImageInfo];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA62A0]), "initWithName:iconImageInfo:", @"iconImages", v12, v14, v16, v18);
  id v20 = [(PREditingSceneViewController *)self presentedSidebarComplicationsGallery];

  if (v20 == v8) {
    uint64_t v21 = 3074;
  }
  else {
    uint64_t v21 = 3072;
  }
  long long v22 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  BOOL v24 = (v23 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  long long v25 = [PRComplicationGalleryDetailViewController alloc];
  uint64_t v26 = [(PREditingSceneViewController *)self listLayoutProvider];
  uint64_t v27 = [(PREditingSceneViewController *)self iconViewProvider];
  objc_super v28 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:](v25, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v26, v27, v21, 256, v19, v24);

  [(SBHAddWidgetSheetViewControllerBase *)v28 setDelegate:self];
  [(PRComplicationGalleryDetailViewController *)v28 setApplicationWidgetCollection:v7];

  [(PRComplicationGalleryDetailViewController *)v28 setShowsCloseButton:0];
  [(PRComplicationGalleryDetailViewController *)v28 setShowsBackgroundView:0];

  return v28;
}

- (id)galleryViewControllerForAddWidgetSheetViewController:(id)a3
{
  uint64_t v4 = [(PREditingSceneViewController *)self presentedSidebarComplicationsGallery];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = [(PREditingSceneViewController *)self sidebarWidgetSuggestions];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4AD78]];
    objc_msgSend(v5, "bs_safeAddObject:", v7);

    id v8 = [(PREditingSceneViewController *)self sidebarWidgetSuggestions];
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4AD68]];
    objc_msgSend(v5, "bs_safeAddObject:", v9);

    uint64_t v10 = [(PREditingSceneViewController *)self sidebarWidgetSuggestions];
    double v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F4AD70]];
    objc_msgSend(v5, "bs_safeAddObject:", v11);

    double v12 = (void *)[v5 copy];
  }
  else
  {
    double v12 = [(PREditingSceneViewController *)self graphicComplicationSuggestionSets];
  }
  double v13 = [PRWidgetSuggestionsViewController alloc];
  double v14 = [(PREditingSceneViewController *)self listLayoutProvider];
  double v15 = [(PREditingSceneViewController *)self iconViewProvider];
  double v16 = [(PRWidgetSuggestionsViewController *)v13 initWithSuggestionSets:v12 listLayoutProvider:v14 iconViewProvider:v15 widgetDragHandler:self usingSidebarLayout:v4 != 0];

  [(PRWidgetSuggestionsViewController *)v16 setDelegate:self];
  return v16;
}

- (void)widgetSuggestionsViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
}

- (id)widgetIconForGalleryItem:(id)a3 sizeClass:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    double v11 = [(PREditingSceneViewController *)self widgetIconForDescriptor:v10 sizeClass:a4];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)widgetIconForDescriptor:(id)a3 sizeClass:(int64_t)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6488];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = objc_msgSend(MEMORY[0x1E4FA6280], "pr_widgetDomain");
  id v9 = (void *)[v7 initWithCHSWidgetDescriptor:v6 inDomain:v8];

  id v10 = PRIconGridSizeClassForWidgetFamily(a4);
  [v9 setGridSizeClass:v10];

  return v9;
}

- (id)widgetIconForDescriptors:(id)a3 sizeClass:(int64_t)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FA6488];
  id v6 = a3;
  id v7 = [v5 alloc];
  id v8 = objc_msgSend(MEMORY[0x1E4FA6280], "pr_widgetDomain");
  id v9 = (void *)[v7 initWithCHSWidgetDescriptors:v6 inDomain:v8];

  id v10 = PRIconGridSizeClassForWidgetFamily(a4);
  [v9 setGridSizeClass:v10];

  return v9;
}

- (UIView)recycledViewsContainer
{
  recycledViewsContainerView = self->_recycledViewsContainerView;
  if (!recycledViewsContainerView)
  {
    uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v5 = self->_recycledViewsContainerView;
    self->_recycledViewsContainerView = v4;

    [(UIView *)self->_recycledViewsContainerView setHidden:1];
    [(UIView *)self->_recycledViewsContainerView setAlpha:0.0];
    [(UIView *)self->_recycledViewsContainerView setUserInteractionEnabled:0];
    id v6 = [(PREditingSceneViewController *)self view];
    [v6 addSubview:self->_recycledViewsContainerView];

    recycledViewsContainerView = self->_recycledViewsContainerView;
  }
  return recycledViewsContainerView;
}

- (id)addWidgetSheetViewControllerForAddWidgetSheetConfigurationManager:(id)a3
{
  return 0;
}

- (id)rootFolderForAddWidgetSheetConfigurationManager:(id)a3
{
  return 0;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 vendorNameForAppWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PREditingSceneViewController *)self iconModel];
  id v7 = [v6 applicationIconForBundleIdentifier:v5];

  id v8 = [v7 application];

  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 vendorName];
  }
  else
  {
    id v9 = 0;
  }
  if (![(__CFString *)v9 length]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v8 isAppleApplication])
  {

    id v9 = @"Apple";
  }

  return v9;
}

- (id)addWidgetSheetConfigurationManager:(id)a3 containerBundleIdentiferForDescriptor:(id)a4
{
  id v4 = a4;
  id v5 = [v4 extensionIdentity];
  id v6 = [v5 containerBundleIdentifier];

  id v7 = [v4 extensionIdentity];

  id v8 = [v7 extensionBundleIdentifier];

  id v9 = +[PRWidgetGridModel effectiveContainerBundleIdentifierForContainerBundleIdentifier:v6 extensionBundleIdentifier:v8];

  return v9;
}

- (void)dismissalOverlayViewDidDismiss:(id)a3
{
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PREditingSceneViewController_appProtectionSubjectsChanged_forSubscription___block_invoke;
  v7[3] = &unk_1E54DAA08;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __77__PREditingSceneViewController_appProtectionSubjectsChanged_forSubscription___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 1168));
  LODWORD(v2) = [v2 isEqual:WeakRetained];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 40) quickActionEditingViewController];
    [v4 validateControls];

    id v5 = *(void **)(a1 + 40);
    [v5 _validateInlineComplication];
  }
}

- (double)titledButtonsAlpha
{
  return self->_titledButtonsAlpha;
}

- (void)setTitledButtonsAlpha:(double)a3
{
  self->_titledButtonsAlpha = a3;
}

- (PREditingSceneViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingSceneViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)variant
{
  return self->_variant;
}

- (int64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(int64_t)a3
{
  self->_destination = a3;
}

- (int64_t)acceptButtonType
{
  return self->_acceptButtonType;
}

- (CGRect)leadingTopButtonFrame
{
  double x = self->_leadingTopButtonFrame.origin.x;
  double y = self->_leadingTopButtonFrame.origin.y;
  double width = self->_leadingTopButtonFrame.size.width;
  double height = self->_leadingTopButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)trailingTopButtonFrame
{
  double x = self->_trailingTopButtonFrame.origin.x;
  double y = self->_trailingTopButtonFrame.origin.y;
  double width = self->_trailingTopButtonFrame.size.width;
  double height = self->_trailingTopButtonFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)horizontalTitleBoundingRect
{
  double x = self->_horizontalTitleBoundingRect.origin.x;
  double y = self->_horizontalTitleBoundingRect.origin.y;
  double width = self->_horizontalTitleBoundingRect.size.width;
  double height = self->_horizontalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)verticalTitleBoundingRect
{
  double x = self->_verticalTitleBoundingRect.origin.x;
  double y = self->_verticalTitleBoundingRect.origin.y;
  double width = self->_verticalTitleBoundingRect.size.width;
  double height = self->_verticalTitleBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden;
}

- (BOOL)usesEditingLayout
{
  return self->_usesEditingLayout;
}

- (BOOL)showsContentWhenReady
{
  return self->_showsContentWhenReady;
}

- (BOOL)allowsTransparentContent
{
  return self->_allowsTransparentContent;
}

- (BOOL)isContentHidden
{
  return self->_contentHidden;
}

- (PREditingSessionModifications)modifications
{
  return self->_modifications;
}

- (void)setModifications:(id)a3
{
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (void)setAppProtectionSubjectMonitorSubscription:(id)a3
{
}

- (WFWidgetConfigurationViewController)presentedComplicationWidgetConfigurationViewController
{
  return self->_presentedComplicationWidgetConfigurationViewController;
}

- (void)setPresentedComplicationWidgetConfigurationViewController:(id)a3
{
}

- (PRComplicationDescriptor)widgetBeingConfigured
{
  return self->_widgetBeingConfigured;
}

- (void)setWidgetBeingConfigured:(id)a3
{
}

- (WFWidgetConfigurationViewController)presentedControlWidgetConfigurationViewController
{
  return self->_presentedControlWidgetConfigurationViewController;
}

- (void)setPresentedControlWidgetConfigurationViewController:(id)a3
{
}

- (PREditingSceneClientSettingsDiffInspector)sceneClientSettingsDiffInspector
{
  return self->_sceneClientSettingsDiffInspector;
}

- (void)setSceneClientSettingsDiffInspector:(id)a3
{
}

- (NSHashTable)complicationContainerViewControllers
{
  return self->_complicationContainerViewControllers;
}

- (void)setComplicationContainerViewControllers:(id)a3
{
}

- (BOOL)isAlternateDateEnabled
{
  return self->_alternateDateEnabled;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (UIView)sidebarComplicationGallerySourceView
{
  return self->_sidebarComplicationGallerySourceView;
}

- (void)setSidebarComplicationGallerySourceView:(id)a3
{
}

- (ATXComplicationSet)inlineComplicationSuggestionSet
{
  return self->_inlineComplicationSuggestionSet;
}

- (void)setInlineComplicationSuggestionSet:(id)a3
{
}

- (NSArray)graphicComplicationSuggestionSets
{
  return self->_graphicComplicationSuggestionSets;
}

- (void)setGraphicComplicationSuggestionSets:(id)a3
{
}

- (NSDictionary)sidebarWidgetSuggestions
{
  return self->_sidebarWidgetSuggestions;
}

- (void)setSidebarWidgetSuggestions:(id)a3
{
}

- (PRComplicationDescriptor)selectedInlineComplication
{
  return self->_selectedInlineComplication;
}

- (UIViewController)presentedComplicationsGallery
{
  return self->_presentedComplicationsGallery;
}

- (void)setPresentedComplicationsGallery:(id)a3
{
}

- (SBHPadAddSheetViewController)presentedSidebarComplicationsGallery
{
  return self->_presentedSidebarComplicationsGallery;
}

- (UINavigationController)presentedInlineComplicationsGallery
{
  return self->_presentedInlineComplicationsGallery;
}

- (void)setPresentedInlineComplicationsGallery:(id)a3
{
}

- (int64_t)selectedQuickActionPosition
{
  return self->_selectedQuickActionPosition;
}

- (int64_t)quickActionIntentEditPosition
{
  return self->_quickActionIntentEditPosition;
}

- (void)setQuickActionIntentEditPosition:(int64_t)a3
{
  self->_quickActionIntentEditPosition = a3;
}

- (CCUISControlsGalleryViewController)presentedControlsGallery
{
  return self->_presentedControlsGallery;
}

- (void)setPresentedControlsGallery:(id)a3
{
}

- (CCUISConfiguredControl)controlIntentBeingConfigured
{
  return self->_controlIntentBeingConfigured;
}

- (void)setControlIntentBeingConfigured:(id)a3
{
}

- (CHSWidgetExtensionProvider)controlExtensionProvider
{
  return self->_controlExtensionProvider;
}

- (void)setControlExtensionProvider:(id)a3
{
}

- (PRQuickActionEditingViewController)quickActionEditingViewController
{
  return self->_quickActionEditingViewController;
}

- (void)setQuickActionEditingViewController:(id)a3
{
}

- (PRIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
}

- (PRWidgetIconViewProvider)iconViewProvider
{
  return self->_iconViewProvider;
}

- (void)setIconViewProvider:(id)a3
{
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (void)setIconModel:(id)a3
{
}

- (CHSWidgetExtensionProvider)widgetExtensionProvider
{
  return self->_widgetExtensionProvider;
}

- (void)setWidgetExtensionProvider:(id)a3
{
}

- (void)setAddWidgetSheetConfigurationManager:(id)a3
{
}

- (UIView)recycledViewsContainerView
{
  return self->_recycledViewsContainerView;
}

- (void)setRecycledViewsContainerView:(id)a3
{
}

- (NSArray)presentationDismissalGestureViews
{
  return self->_presentationDismissalGestureViews;
}

- (void)setPresentationDismissalGestureViews:(id)a3
{
}

- (PREditingSceneViewControllerTopButtonLayout)lastValidDelegateTopButtonLayout
{
  CGSize size = self[25].leadingTopButtonFrame.size;
  retstr->leadingTopButtonFrame.CGPoint origin = self[25].leadingTopButtonFrame.origin;
  retstr->leadingTopButtonFrame.CGSize size = size;
  CGSize v4 = self[25].trailingTopButtonFrame.size;
  retstr->trailingTopButtonFrame.CGPoint origin = self[25].trailingTopButtonFrame.origin;
  retstr->trailingTopButtonFrame.CGSize size = v4;
  return self;
}

- (void)setLastValidDelegateTopButtonLayout:(PREditingSceneViewControllerTopButtonLayout *)a3
{
  CGSize size = a3->trailingTopButtonFrame.size;
  CGPoint origin = a3->leadingTopButtonFrame.origin;
  CGSize v4 = a3->leadingTopButtonFrame.size;
  self->_lastValidDelegateTopButtonLayout.trailingTopButtonFrame.CGPoint origin = a3->trailingTopButtonFrame.origin;
  self->_lastValidDelegateTopButtonLayout.trailingTopButtonFrame.CGSize size = size;
  self->_lastValidDelegateTopButtonLayout.leadingTopButtonFrame.CGPoint origin = origin;
  self->_lastValidDelegateTopButtonLayout.leadingTopButtonFrame.CGSize size = v4;
}

- (BOOL)isHero
{
  return self->_hero;
}

- (void)setHero:(BOOL)a3
{
  self->_hero = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)isTornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (UIView)inlineComplicationGestureView
{
  return self->_inlineComplicationGestureView;
}

- (void)setInlineComplicationGestureView:(id)a3
{
}

- (UIView)complicationsAddGestureView
{
  return self->_complicationsAddGestureView;
}

- (void)setComplicationsAddGestureView:(id)a3
{
}

- (UIView)sidebarComplicationAddGestureView
{
  return self->_sidebarComplicationAddGestureView;
}

- (void)setSidebarComplicationAddGestureView:(id)a3
{
}

- (BOOL)isClientPresentingModalViewController
{
  return self->_clientPresentingModalViewController;
}

- (BOOL)isDraggingComplication
{
  return self->_draggingComplication;
}

- (int64_t)focusedElement
{
  return self->_focusedElement;
}

- (BSInvalidatable)localKeyboardFocusAssertion
{
  return self->_localKeyboardFocusAssertion;
}

- (void)setLocalKeyboardFocusAssertion:(id)a3
{
}

- (NSMutableDictionary)engagementCountsForViewedSuggestedComplications
{
  return self->_engagementCountsForViewedSuggestedComplications;
}

- (void)setEngagementCountsForViewedSuggestedComplications:(id)a3
{
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)posterRole
{
  return self->_posterRole;
}

- (void)setPosterRole:(id)a3
{
}

- (UIView)saveIndicatorContainerView
{
  return self->_saveIndicatorContainerView;
}

- (void)setSaveIndicatorContainerView:(id)a3
{
}

- (BOOL)hostApplicationHasResignedActive
{
  return self->_hostApplicationHasResignedActive;
}

- (void)setHostApplicationHasResignedActive:(BOOL)a3
{
  self->_hostApplicationHasResignedActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_posterRole, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_engagementCountsForViewedSuggestedComplications, 0);
  objc_storeStrong((id *)&self->_localKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationAddGestureView, 0);
  objc_storeStrong((id *)&self->_complicationsAddGestureView, 0);
  objc_storeStrong((id *)&self->_inlineComplicationGestureView, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_presentationDismissalGestureViews, 0);
  objc_storeStrong((id *)&self->_recycledViewsContainerView, 0);
  objc_storeStrong((id *)&self->_addWidgetSheetConfigurationManager, 0);
  objc_storeStrong((id *)&self->_widgetExtensionProvider, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_storeStrong((id *)&self->_iconViewProvider, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_quickActionEditingViewController, 0);
  objc_storeStrong((id *)&self->_controlExtensionProvider, 0);
  objc_storeStrong((id *)&self->_controlIntentBeingConfigured, 0);
  objc_storeStrong((id *)&self->_presentedControlsGallery, 0);
  objc_storeStrong((id *)&self->_presentedInlineComplicationsGallery, 0);
  objc_storeStrong((id *)&self->_presentedSidebarComplicationsGallery, 0);
  objc_storeStrong((id *)&self->_presentedComplicationsGallery, 0);
  objc_storeStrong((id *)&self->_selectedInlineComplication, 0);
  objc_storeStrong((id *)&self->_sidebarWidgetSuggestions, 0);
  objc_storeStrong((id *)&self->_graphicComplicationSuggestionSets, 0);
  objc_storeStrong((id *)&self->_inlineComplicationSuggestionSet, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationGallerySourceView, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_complicationContainerViewControllers, 0);
  objc_storeStrong((id *)&self->_sceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_presentedControlWidgetConfigurationViewController, 0);
  objc_storeStrong((id *)&self->_widgetBeingConfigured, 0);
  objc_storeStrong((id *)&self->_presentedComplicationWidgetConfigurationViewController, 0);
  objc_destroyWeak((id *)&self->_appProtectionSubjectMonitorSubscription);
  objc_storeStrong((id *)&self->_modifications, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_widgetBeingAdded, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_6(&dword_18C1C4000, v0, v1, "Error fetching complication suggestions: %@", v2, v3, v4, v5, v6);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_195_cold_1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_6(&dword_18C1C4000, v0, v1, "Error fetching inline complication suggestions: %@", v2, v3, v4, v5, v6);
}

void __64__PREditingSceneViewController__prefetchComplicationSuggestions__block_invoke_2_198_cold_1()
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_0_6(&dword_18C1C4000, v0, v1, "Error fetching sidebar complication suggestions: %@", v2, v3, v4, v5, v6);
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_4_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18C1C4000, log, OS_LOG_TYPE_ERROR, "Error saving data from extension process: updatedConfiguration or updatedConfiguredProperties are nil!", v1, 2u);
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_2_376_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_15();
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_18C1C4000, v2, OS_LOG_TYPE_ERROR, "Error saving updated configuration %@ with properties %@: %@", v3, 0x20u);
}

void __51__PREditingSceneViewController__dismissWithAction___block_invoke_377_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)controlsGalleryViewController:(uint64_t)a3 didFinishWithResult:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end