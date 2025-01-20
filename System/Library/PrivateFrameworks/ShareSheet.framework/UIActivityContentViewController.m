@interface UIActivityContentViewController
- (BOOL)_canShowOptions;
- (BOOL)canRenderPeople;
- (BOOL)canShowShareOptions;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)configureForCloudSharing;
- (BOOL)configureForPhotosEdit;
- (BOOL)headerLinkActionsNeedsUpdate;
- (BOOL)hideHeaderView;
- (BOOL)hideNavigationBar;
- (BOOL)ignorePersonTap;
- (BOOL)isCloseButtonOnLeadingEdge;
- (BOOL)isPresentedInPopover;
- (BOOL)isRemote;
- (BOOL)photosLandscapeMode;
- (BOOL)sharingExpanded;
- (BOOL)showHeroActionsHorizontally;
- (BSAuditToken)hostAuditToken;
- (BSInvalidatable)homeScreenIconStyleObserver;
- (LPLinkMetadata)headerMetadata;
- (LPLinkView)headerLinkView;
- (NSArray)applicationActivityTypes;
- (NSArray)heroActionActivityTypes;
- (NSDiffableDataSourceSnapshot)currentSnapshot;
- (NSMutableDictionary)identifiersToActivityImageRequestID;
- (NSMutableDictionary)identifiersToPeopleSuggestionImageRequestIDs;
- (NSMutableSet)sandboxExtensionHandles;
- (NSNumber)hostPresentationStyle;
- (NSString)pulsingLocalizedTitle;
- (NSString)topContentSectionText;
- (NSUUID)pulsingActivityIdentifier;
- (SFAirDropTransferChange)activeAirDropTransferChange;
- (SFUIActivityImageProvider)activityImageProvider;
- (SFUIPeopleSuggestionImageProvider)peopleSuggestionImageProvider;
- (SHSheetContentDataSource)dataSource;
- (SHSheetContentDataSourceManager)dataSourceManager;
- (SHSheetContentLayoutProvider)layoutProvider;
- (SHSheetContentLayoutSpec)layoutSpec;
- (SHSheetContentPresenter)presenter;
- (SHSheetContentViewModel)viewModel;
- (SLCollaborationFooterViewModel)collaborationFooterViewModel;
- (UIActivity)pulsingActivity;
- (UIActivityContentViewController)init;
- (UIActivityContentViewController)initWithContext:(id)a3;
- (UIActivityContentViewControllerDelegate)delegate;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)closeButton;
- (UIBarButtonItem)nextButton;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UIColor)tintColor;
- (UIViewController)customViewController;
- (UIVisualEffectView)backgroundView;
- (_UIActivityCollectionViewCompositionalLayout)activityCollectionViewLayout;
- (_UIActivityContentCollectionView)activityCollectionView;
- (_UIActivityContentTitleView)headerTitleView;
- (id)_activityTitleForHeroActionActivity:(id)a3;
- (id)_contextMenuPreviewForCollectionView:(id)a3 collectionViewCell:(id)a4;
- (id)_createLinkView;
- (id)_footerTextForInformationalSectionIdentifier:(id)a3;
- (id)_provideCellForCollectionView:(id)a3 indexPath:(id)a4 itemIdentifier:(id)a5;
- (id)_provideLayoutForSection:(int64_t)a3 environment:(id)a4;
- (id)_provideSupplementaryViewForCollectionView:(id)a3 kind:(id)a4 indexPath:(id)a5;
- (id)_scrollViewForScrollingType:(int64_t)a3;
- (id)_sectionIdentifierForIndex:(int64_t)a3;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)pendingUpdate;
- (id)titleForItemIdentifier:(id)a3;
- (int64_t)currentSectionTypesToExclude;
- (int64_t)effectivePresentationStyle;
- (unint64_t)_headingSizeClass;
- (void)_configureActionCell:(id)a3 itemIdentifier:(id)a4;
- (void)_configureAirDropCell:(id)a3 withChange:(id)a4;
- (void)_configureCollectionViewIfNeeded;
- (void)_configureHeaderViewIfNeeded;
- (void)_configureHeroActionCell:(id)a3 itemIdentifier:(id)a4;
- (void)_configureMagicHeadCell:(id)a3 withProxy:(id)a4;
- (void)_configurePeopleCell:(id)a3 itemIdentifier:(id)a4;
- (void)_configureSharingAppCell:(id)a3 itemIdentifier:(id)a4;
- (void)_configureWithContext:(id)a3;
- (void)_consumeURLSandboxExtensions:(id)a3 forURLRequests:(id)a4;
- (void)_updateContentWithPeopleProxies:(id)a3 shareProxies:(id)a4 actionProxies:(id)a5 activitiesByUUID:(id)a6 nearbyCountSlotID:(id)a7 animated:(BOOL)a8 reloadData:(BOOL)a9;
- (void)_updateCustomViewContent;
- (void)_updateHeaderLinkViewAction;
- (void)_updateHeaderLinkViewSizeClass;
- (void)_updateHeaderMetadataValues;
- (void)_updateHeaderSize;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)dataSourceManager:(id)a3 didPublishDataSourceWithChangeDetails:(id)a4;
- (void)dealloc;
- (void)didUpdateAirDropTransferWithChange:(id)a3;
- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4;
- (void)linkView:(id)a3 didFetchMetadata:(id)a4;
- (void)linkViewNeedsResize:(id)a3;
- (void)reloadActivity:(id)a3;
- (void)reloadContent;
- (void)reloadMetadata:(id)a3;
- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActiveAirDropTransferChange:(id)a3;
- (void)setActivityCollectionView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCanShowShareOptions:(BOOL)a3;
- (void)setCancelButton:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCollaborationFooterViewModel:(id)a3;
- (void)setCurrentSectionTypesToExclude:(int64_t)a3;
- (void)setDataSourceManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setHeaderLinkActionsNeedsUpdate:(BOOL)a3;
- (void)setHeaderLinkView:(id)a3;
- (void)setHeaderTitleView:(id)a3;
- (void)setHeroActionActivityTypes:(id)a3;
- (void)setHomeScreenIconStyleObserver:(id)a3;
- (void)setHostAuditToken:(id)a3;
- (void)setHostPresentationStyle:(id)a3;
- (void)setIgnorePersonTap:(BOOL)a3;
- (void)setIsCloseButtonOnLeadingEdge:(BOOL)a3;
- (void)setIsRemote:(BOOL)a3;
- (void)setNextButton:(id)a3;
- (void)setPendingUpdate:(id)a3;
- (void)setPhotosLandscapeMode:(BOOL)a3;
- (void)setPresenter:(id)a3;
- (void)setPulsingActivity:(id)a3;
- (void)setPulsingActivityIdentifier:(id)a3;
- (void)setPulsingLocalizedTitle:(id)a3;
- (void)setViewModel:(id)a3;
- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4;
- (void)stopPulsingActivity:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithViewModel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIActivityContentViewController

- (UIActivityContentViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIActivityContentViewController;
  v2 = [(UIActivityContentViewController *)&v5 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2) {
    [(UIActivityContentViewController *)v2 _configureWithContext:0];
  }
  return v3;
}

- (UIActivityContentViewController)initWithContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIActivityContentViewController;
  objc_super v5 = [(UIActivityContentViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(UIActivityContentViewController *)v5 _configureWithContext:v4];
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(UIActivityContentViewController *)self homeScreenIconStyleObserver];
  [v3 invalidate];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(UIActivityContentViewController *)self sandboxExtensionHandles];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v17;
    *(void *)&long long v6 = 67109378;
    long long v14 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v9), "integerValue", v14);
        if (sandbox_extension_release() == -1)
        {
          v10 = share_sheet_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            int v11 = *__error();
            v12 = __error();
            v13 = strerror(*v12);
            *(_DWORD *)buf = v14;
            int v21 = v11;
            __int16 v22 = 2080;
            v23 = v13;
            _os_log_error_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_ERROR, "Failed to release sandbox extension with error %d (%s)", buf, 0x12u);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }

  v15.receiver = self;
  v15.super_class = (Class)UIActivityContentViewController;
  [(UIActivityContentViewController *)&v15 dealloc];
}

- (void)setHostPresentationStyle:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  hostPresentationStyle = self->_hostPresentationStyle;
  uint64_t v7 = (NSNumber *)v5;
  uint64_t v8 = hostPresentationStyle;
  if (v8 == v7)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if ((v7 == 0) != (v8 != 0))
    {
      char v10 = [(NSNumber *)v7 isEqual:v8];

      if (v10) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_hostPresentationStyle, a3);
    int v11 = share_sheet_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412546;
      uint64_t v33 = objc_opt_class();
      __int16 v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_DEFAULT, "%@: setHostPresentationStyle:%@", (uint8_t *)&v32, 0x16u);
    }

    uint64_t v12 = _ShareSheetCurrentDeviceClassFromPresentationStyle([(UIActivityContentViewController *)self isPresentedInPopover]);
    v13 = [(UIActivityContentViewController *)self layoutSpec];
    uint64_t v14 = [v13 deviceClass];

    if (v14 != v12)
    {
      objc_super v15 = [SHSheetContentLayoutSpec alloc];
      long long v16 = [(UIActivityContentViewController *)self traitCollection];
      long long v17 = [(UIActivityContentViewController *)self tintColor];
      long long v18 = [(SHSheetContentLayoutSpec *)v15 initWithTraitCollection:v16 tintColor:v17 deviceClass:v12];
      layoutSpec = self->_layoutSpec;
      self->_layoutSpec = v18;

      v20 = self->_layoutSpec;
      int v21 = [(UIActivityContentViewController *)self layoutProvider];
      [v21 setLayoutSpec:v20];

      __int16 v22 = [(UIActivityContentViewController *)self peopleSuggestionImageProvider];
      [(SHSheetContentLayoutSpec *)self->_layoutSpec peopleIconWidth];
      double v24 = v23;
      [(SHSheetContentLayoutSpec *)self->_layoutSpec peopleIconWidth];
      objc_msgSend(v22, "updateTargetSize:", v24, v25);

      v26 = [(UIActivityContentViewController *)self peopleSuggestionImageProvider];
      v27 = [(SHSheetContentLayoutSpec *)self->_layoutSpec traitCollection];
      objc_msgSend(v26, "updateUserInterfaceStyle:", objc_msgSend(v27, "userInterfaceStyle"));

      v28 = [(UIActivityContentViewController *)self activityCollectionView];
      [v28 reloadData];
    }
    uint64_t v29 = [(UIActivityContentViewController *)self isPresentedInPopover] ^ 1;
    v30 = [(UIActivityContentViewController *)self headerTitleView];
    [v30 setHasCloseButton:v29];

    v31 = [(UIActivityContentViewController *)self view];
    [v31 setNeedsLayout];
  }
LABEL_12:
}

- (int64_t)effectivePresentationStyle
{
  v3 = [(UIActivityContentViewController *)self hostPresentationStyle];

  if (v3)
  {
    id v4 = [(UIActivityContentViewController *)self hostPresentationStyle];
    int64_t v5 = [v4 integerValue];

    return v5;
  }
  else
  {
    return SHSheetPresentationControllerPresentationStyle(self);
  }
}

- (BOOL)isPresentedInPopover
{
  return [(UIActivityContentViewController *)self effectivePresentationStyle] == 7;
}

- (void)_configureWithContext:(id)a3
{
  id v4 = a3;
  self->_isRemote = [v4 isRemote];
  int64_t v5 = [v4 hostAuditToken];
  hostAuditToken = self->_hostAuditToken;
  self->_hostAuditToken = v5;

  self->_canRenderPeople = [v4 canRenderPeople];
  self->_configureForCloudSharing = [v4 configureForCloudSharing];
  self->_configureForPhotosEdit = [v4 configureForPhotosEdit];
  self->_hideHeaderView = [v4 hideHeaderView];
  self->_hideNavigationBar = [v4 hideNavigationBar];
  self->_sharingExpanded = [v4 sharingExpanded];
  uint64_t v7 = [v4 topContentSectionText];
  topContentSectionText = self->_topContentSectionText;
  self->_topContentSectionText = v7;

  uint64_t v9 = [v4 applicationActivityTypes];
  applicationActivityTypes = self->_applicationActivityTypes;
  self->_applicationActivityTypes = v9;

  int v11 = [v4 heroActionActivityTypes];
  heroActionActivityTypes = self->_heroActionActivityTypes;
  self->_heroActionActivityTypes = v11;

  self->_showHeroActionsHorizontally = [v4 showHeroActionsHorizontally];
  v13 = [v4 tintColor];
  tintColor = self->_tintColor;
  self->_tintColor = v13;

  uint64_t v15 = _ShareSheetCurrentDeviceClassFromPresentationStyle([(UIActivityContentViewController *)self isPresentedInPopover]);
  long long v16 = [SHSheetContentLayoutSpec alloc];
  long long v17 = [(UIActivityContentViewController *)self traitCollection];
  long long v18 = [(UIActivityContentViewController *)self tintColor];
  long long v19 = [(SHSheetContentLayoutSpec *)v16 initWithTraitCollection:v17 tintColor:v18 deviceClass:v15];
  layoutSpec = self->_layoutSpec;
  self->_layoutSpec = v19;

  int v21 = [[SHSheetContentLayoutProvider alloc] initWithLayoutSpec:self->_layoutSpec];
  layoutProvider = self->_layoutProvider;
  self->_layoutProvider = v21;

  [(SHSheetContentLayoutProvider *)self->_layoutProvider setDelegate:self];
  id location = 0;
  objc_initWeak(&location, self);
  double v23 = [_UIActivityCollectionViewCompositionalLayout alloc];
  uint64_t v48 = MEMORY[0x1E4F143A8];
  uint64_t v49 = 3221225472;
  v50 = __57__UIActivityContentViewController__configureWithContext___block_invoke;
  v51 = &unk_1E5A22340;
  objc_copyWeak(&v52, &location);
  double v24 = [(_UIActivityCollectionViewCompositionalLayout *)v23 initWithSectionProvider:&v48];
  activityCollectionViewLayout = self->_activityCollectionViewLayout;
  self->_activityCollectionViewLayout = v24;

  v26 = (SFUIActivityImageProvider *)objc_alloc_init(getSFUIActivityImageProviderClass_1());
  activityImageProvider = self->_activityImageProvider;
  self->_activityImageProvider = v26;

  objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v48, v49, v50, v51);
  v28 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  identifiersToActivityImageRequestID = self->_identifiersToActivityImageRequestID;
  self->_identifiersToActivityImageRequestID = v28;

  v30 = [MEMORY[0x1E4F1CA60] dictionary];
  identifiersToPeopleSuggestionImageRequestIDs = self->_identifiersToPeopleSuggestionImageRequestIDs;
  self->_identifiersToPeopleSuggestionImageRequestIDs = v30;

  int v32 = [(objc_class *)getSFUIActivityImageProviderClass_1() homeScreenService];
  uint64_t v33 = [v32 addHomeScreenIconStyleObserver:self];
  homeScreenIconStyleObserver = self->_homeScreenIconStyleObserver;
  self->_homeScreenIconStyleObserver = v33;

  if (self->_canRenderPeople)
  {
    [(SHSheetContentLayoutSpec *)self->_layoutSpec peopleIconWidth];
    double v36 = v35;
    [(SHSheetContentLayoutSpec *)self->_layoutSpec peopleIconWidth];
    double v38 = v37;
    id v39 = objc_alloc(getSFUIPeopleSuggestionImageProviderClass());
    v40 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v41 = [v40 userInterfaceLayoutDirection];
    v42 = [(SHSheetContentLayoutSpec *)self->_layoutSpec traitCollection];
    v43 = (SFUIPeopleSuggestionImageProvider *)objc_msgSend(v39, "initWithTargetSize:layoutDirection:userInterfaceStyle:", v41, objc_msgSend(v42, "userInterfaceStyle"), v36, v38);
    peopleSuggestionImageProvider = self->_peopleSuggestionImageProvider;
    self->_peopleSuggestionImageProvider = v43;
  }
  self->_headerLinkActionsNeedsUpdate = 1;
  v45 = [MEMORY[0x1E4F1CA80] set];
  sandboxExtensionHandles = self->_sandboxExtensionHandles;
  self->_sandboxExtensionHandles = v45;

  if ([(UIActivityContentViewController *)self isRemote])
  {
    if (_ShareSheetPlatformPrefersPopover())
    {
      if ([(UIActivityContentViewController *)self modalPresentationStyle] == 2) {
        double v47 = _ShareSheetFormSheetSize();
      }
      else {
        double v47 = _ShareSheetPopoverSize();
      }
    }
    else
    {
      double v47 = _ShareSheetDefaultSheetSize();
    }
    [(UIActivityContentViewController *)self setPreferredContentSize:v47];
  }
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);
}

id __57__UIActivityContentViewController__configureWithContext___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v7 = [WeakRetained _provideLayoutForSection:a2 environment:v5];

  return v7;
}

- (UIViewController)customViewController
{
  v2 = [(UIActivityContentViewController *)self viewModel];
  v3 = [v2 customViewController];

  return (UIViewController *)v3;
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  v2 = [(UIActivityContentViewController *)self dataSourceManager];
  v3 = [v2 dataSource];
  id v4 = [v3 diffableSnapshot];

  return (NSDiffableDataSourceSnapshot *)v4;
}

- (SHSheetContentDataSource)dataSource
{
  v2 = [(UIActivityContentViewController *)self dataSourceManager];
  v3 = [v2 dataSource];

  return (SHSheetContentDataSource *)v3;
}

- (int64_t)currentSectionTypesToExclude
{
  v3 = [(UIActivityContentViewController *)self customViewController];
  if (v3) {
    uint64_t v4 = [(UIActivityContentViewController *)self configureForCloudSharing];
  }
  else {
    uint64_t v4 = 1;
  }

  if ([(UIActivityContentViewController *)self photosLandscapeMode])
  {
    id v5 = [(UIActivityContentViewController *)self customViewController];

    if (v5)
    {
      int v6 = 1;
LABEL_9:
      BOOL v7 = 1;
      goto LABEL_11;
    }
  }
  if ([(UIActivityContentViewController *)self configureForPhotosEdit])
  {
    int v6 = 0;
    goto LABEL_9;
  }
  BOOL v7 = [(UIActivityContentViewController *)self configureForCloudSharing];
  int v6 = 0;
LABEL_11:
  if ([(UIActivityContentViewController *)self sharingExpanded])
  {
    BOOL v8 = [(UIActivityContentViewController *)self showHeroActionsHorizontally];
    int64_t v9 = v4 | 2;
    if (!v7) {
      int64_t v9 = v4;
    }
    if (v6) {
      v9 |= 0xCuLL;
    }
    int64_t v10 = v9 | 0x10;
    BOOL v11 = !v8;
  }
  else
  {
    int64_t v9 = v4 | 2;
    if (!v7) {
      int64_t v9 = v4;
    }
    int64_t v10 = v9 | 0xC;
    BOOL v11 = v6 == 0;
  }
  if (v11) {
    return v9;
  }
  else {
    return v10;
  }
}

- (id)_provideLayoutForSection:(int64_t)a3 environment:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(UIActivityContentViewController *)self _sectionIdentifierForIndex:a3];
  BOOL v8 = [SHSheetContentLayoutContext alloc];
  int64_t v9 = [(UIActivityContentViewController *)self currentSnapshot];
  int64_t v10 = [(SHSheetContentLayoutContext *)v8 initWithSectionIdentifier:v7 dataSourceSnapshot:v9 environment:v6];

  BOOL v11 = [(UIActivityContentViewController *)self view];
  [v11 directionalLayoutMargins];
  [(SHSheetContentLayoutContext *)v10 setViewDirectionalLayoutMargins:"setViewDirectionalLayoutMargins:"];

  uint64_t v12 = [(UIActivityContentViewController *)self topContentSectionText];
  [(SHSheetContentLayoutContext *)v10 setEnableTopContentSectionText:v12 != 0];

  if ([(UIActivityContentViewController *)self showHeroActionsHorizontally])
  {
    v13 = [(UIActivityContentViewController *)self layoutSpec];
    -[SHSheetContentLayoutContext setEnableHeroActions:](v10, "setEnableHeroActions:", [v13 isAccessibilityContentSize] ^ 1);
  }
  else
  {
    [(SHSheetContentLayoutContext *)v10 setEnableHeroActions:0];
  }
  uint64_t v14 = [(UIActivityContentViewController *)self layoutProvider];
  uint64_t v15 = [v14 layoutSectionForContext:v10];

  return v15;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)UIActivityContentViewController;
  [(UIActivityContentViewController *)&v4 viewDidLoad];
  [(UIActivityContentViewController *)self _configureHeaderViewIfNeeded];
  [(UIActivityContentViewController *)self _configureCollectionViewIfNeeded];
  [(UIActivityContentViewController *)self _updateCustomViewContent];
  v3 = [(UIActivityContentViewController *)self view];
  [v3 setBackgroundColor:0];
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)UIActivityContentViewController;
  [(UIActivityContentViewController *)&v9 viewDidLayoutSubviews];
  if (_ShareSheetPlatformPrefersPopover())
  {
    if ([(UIActivityContentViewController *)self isPresentedInPopover])
    {
      v3 = 0;
    }
    else
    {
      v3 = [(UIActivityContentViewController *)self closeButton];
    }
    BOOL v4 = [(UIActivityContentViewController *)self isCloseButtonOnLeadingEdge];
    id v5 = [(UIActivityContentViewController *)self navigationItem];
    id v6 = v5;
    if (v4) {
      [v5 setLeftBarButtonItem:v3];
    }
    else {
      [v5 setRightBarButtonItem:v3];
    }
  }
  if (_ShareSheetPlatformPrefersPopover()
    && [(UIActivityContentViewController *)self configureForCloudSharing])
  {
    BOOL v7 = [(UIActivityContentViewController *)self activityCollectionView];
    [v7 reloadData];
  }
  self->_didLayout = 1;
  BOOL v8 = [(UIActivityContentViewController *)self pendingUpdate];
  [(UIActivityContentViewController *)self setPendingUpdate:0];
  if (v8) {
    v8[2](v8);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)UIActivityContentViewController;
  id v7 = a4;
  -[UIActivityContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__UIActivityContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5A22368;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __86__UIActivityContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCustomViewContent];
}

- (void)traitCollectionDidChange:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIActivityContentViewController;
  [(UIActivityContentViewController *)&v26 traitCollectionDidChange:v4];
  id v5 = [(UIActivityContentViewController *)self traitCollection];
  id v6 = [(UIActivityContentViewController *)self layoutSpec];
  [v6 setTraitCollection:v5];

  id v7 = [v4 preferredContentSizeCategory];
  BOOL v8 = [(UIActivityContentViewController *)self traitCollection];
  objc_super v9 = [v8 preferredContentSizeCategory];

  if (v7 == v9)
  {
    int v18 = 0;
  }
  else
  {
    [(UIActivityContentViewController *)self _updateHeaderSize];
    int64_t v10 = [v4 preferredContentSizeCategory];
    int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);
    uint64_t v12 = [(UIActivityContentViewController *)self traitCollection];
    v13 = [v12 preferredContentSizeCategory];
    int v14 = UIContentSizeCategoryIsAccessibilityCategory(v13);

    uint64_t v15 = [(UIActivityContentViewController *)self currentSnapshot];
    long long v16 = [v15 sectionIdentifiers];
    int v17 = [v16 containsObject:@"SHSheetContentHeroActionsSectionIdentifier"];

    int v18 = 0;
    if (IsAccessibilityCategory != v14 && v17)
    {
      long long v19 = [(UIActivityContentViewController *)self currentSnapshot];
      v27[0] = @"SHSheetContentHeroActionsSectionIdentifier";
      int v18 = 1;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v19 reloadSectionsWithIdentifiers:v20];
    }
  }
  uint64_t v21 = [v4 userInterfaceStyle];
  __int16 v22 = [(UIActivityContentViewController *)self traitCollection];
  uint64_t v23 = [v22 userInterfaceStyle];

  if (v21 == v23)
  {
    if (v18)
    {
      double v24 = [(UIActivityContentViewController *)self diffableDataSource];
      double v25 = [(UIActivityContentViewController *)self currentSnapshot];
      [v24 applySnapshot:v25 animatingDifferences:0];
    }
  }
  else
  {
    [(UIActivityContentViewController *)self reloadContent];
  }
}

- (void)homeScreenService:(id)a3 homeScreenIconStyleConfigurationDidChange:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__UIActivityContentViewController_homeScreenService_homeScreenIconStyleConfigurationDidChange___block_invoke;
  v4[3] = &unk_1E5A21900;
  v4[4] = self;
  sh_dispatch_on_main_queue(v4);
}

uint64_t __95__UIActivityContentViewController_homeScreenService_homeScreenIconStyleConfigurationDidChange___block_invoke(uint64_t a1)
{
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "home screen icon style configuration did change", v4, 2u);
  }

  return [*(id *)(a1 + 32) reloadContent];
}

- (void)_updateHeaderMetadataValues
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(UIActivityContentViewController *)self viewModel];
  id v4 = [v3 metadataValues];

  id v5 = [(UIActivityContentViewController *)self headerLinkView];

  if (v5 && [v4 count])
  {
    id v6 = share_sheet_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v4;
      _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "update link view metadata values:%@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = [(UIActivityContentViewController *)self headerLinkView];
    [v7 _setMultipleMetadata:v4];

    BOOL v8 = [(UIActivityContentViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      int64_t v10 = [(UIActivityContentViewController *)self delegate];
      [v10 activityContentViewControllerDidUpdateHeaderMetadata:self];
    }
  }
}

- (void)linkView:(id)a3 didFetchMetadata:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "link view did fetch metadata:%@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(UIActivityContentViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(UIActivityContentViewController *)self delegate];
    [v9 activityContentViewControllerDidUpdateHeaderMetadata:self];
  }
}

- (id)_createLinkView
{
  v3 = [(UIActivityContentViewController *)self viewModel];
  id v4 = [v3 metadataValues];

  if ([v4 count]
    || ([(UIActivityContentViewController *)self viewModel],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isLoadingMetadata],
        v5,
        v6))
  {
    id v7 = (void *)[objc_alloc(getLPLinkViewClass()) _initWithMultipleMetadata:v4];
  }
  else
  {
    int v18 = [(UIActivityContentViewController *)self viewModel];
    long long v19 = [v18 urlRequests];

    id v7 = (void *)[objc_alloc(getLPLinkViewClass()) _initWithMetadataLoadedFromRequests:v19];
  }
  char v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v7 setBackgroundColor:v8];

  [v7 setPreservesSuperviewLayoutMargins:1];
  [v7 _setDisableTapGesture:1];
  [v7 _setDisableAnimations:1];
  [v7 setMaskView:0];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setDelegate:self];
  char v9 = [v4 firstObject];
  int v10 = [v9 sourceApplication];
  id v11 = [v10 bundleIdentifier];

  if (v11)
  {
    uint64_t v12 = [v4 firstObject];
    uint64_t v13 = [v12 sourceApplication];
    int v14 = [v13 bundleIdentifier];
    [v7 _setSourceBundleIdentifier:v14];
  }
  else
  {
    uint64_t v15 = [(UIActivityContentViewController *)self hostAuditToken];

    if (!v15) {
      goto LABEL_12;
    }
    long long v16 = [(UIActivityContentViewController *)self hostAuditToken];
    int v17 = v16;
    if (v16) {
      [v16 realToken];
    }

    uint64_t v12 = _ShareSheetBundleIDFromAuditToken();
    [v7 _setSourceBundleIdentifier:v12];
  }

LABEL_12:
  return v7;
}

- (void)_configureHeaderViewIfNeeded
{
  v3 = [(UIActivityContentViewController *)self viewModel];
  if (v3)
  {
    double v35 = v3;
    if (![(UIActivityContentViewController *)self configureForCloudSharing])
    {
      id v4 = [(UIActivityContentViewController *)self headerLinkView];

      if (v4) {
        return;
      }
      uint64_t v5 = [(UIActivityContentViewController *)self hideHeaderView];
      int v6 = [_UIActivityContentTitleView alloc];
      double v35 = -[_UINavigationBarTitleView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(_UIActivityContentTitleView *)v35 setPreservesSuperviewLayoutMargins:1];
      [(_UINavigationBarTitleView *)v35 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v7 = [(UIActivityContentViewController *)self customViewController];
      BOOL v10 = v7
         && ([MEMORY[0x1E4FB16C8] currentDevice],
             char v8 = objc_claimAutoreleasedReturnValue(),
             uint64_t v9 = [v8 userInterfaceIdiom],
             v8,
             (v9 & 0xFFFFFFFFFFFFFFFBLL) != 1)
         && (unint64_t)([(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3) < 0xFFFFFFFFFFFFFFFELL;
      [(_UIActivityContentTitleView *)v35 setPhotosCarouselMode:v10];

      id v11 = [(UIActivityContentViewController *)self viewModel];
      -[_UIActivityContentTitleView setCustomButtonMode:](v35, "setCustomButtonMode:", [v11 showCustomHeaderButton]);

      [(_UIActivityContentTitleView *)v35 setHasCloseButton:[(UIActivityContentViewController *)self isPresentedInPopover] ^ 1];
      [(_UIActivityContentTitleView *)v35 setIsCloseButtonOnLeadingEdge:[(UIActivityContentViewController *)self isCloseButtonOnLeadingEdge]];
      uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
      [(_UIActivityContentTitleView *)v35 setBackgroundColor:v12];

      if ((v5 & 1) == 0)
      {
        uint64_t v13 = [(UIActivityContentViewController *)self _createLinkView];
        [(UIActivityContentViewController *)self setHeaderTitleView:v35];
        int v14 = [v13 metadata];
        uint64_t v15 = [v14 title];
        long long v16 = [(UIActivityContentViewController *)self navigationItem];
        [v16 setTitle:v15];

        int v17 = [(UIActivityContentViewController *)self navigationItem];
        [v17 setTitleView:v35];

        [(UIActivityContentViewController *)self setHeaderLinkView:v13];
        int v18 = [(UIActivityContentViewController *)self headerTitleView];
        [v18 setLinkView:v13];

        [(UIActivityContentViewController *)self _updateHeaderLinkViewSizeClass];
        [(UIActivityContentViewController *)self _updateHeaderMetadataValues];
      }
      id v19 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v20 = [(UIActivityContentViewController *)self presenter];
      uint64_t v21 = (void *)[v19 initWithBarButtonSystemItem:24 target:v20 action:sel_handleClose];
      [(UIActivityContentViewController *)self setCloseButton:v21];

      if ([(_UIActivityContentTitleView *)v35 hasCloseButton])
      {
        BOOL v22 = [(UIActivityContentViewController *)self isCloseButtonOnLeadingEdge];
        uint64_t v23 = [(UIActivityContentViewController *)self closeButton];
        double v24 = [(UIActivityContentViewController *)self navigationItem];
        double v25 = v24;
        if (v22) {
          [v24 setLeftBarButtonItem:v23];
        }
        else {
          [v24 setRightBarButtonItem:v23];
        }
      }
      objc_super v26 = [(UIActivityContentViewController *)self navigationItem];
      [v26 _setManualScrollEdgeAppearanceEnabled:1];

      if (v5) {
        [MEMORY[0x1E4FB1618] clearColor];
      }
      else {
      v27 = [MEMORY[0x1E4FB1618] separatorColor];
      }
      id v28 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
      [v28 configureWithTransparentBackground];
      [v28 setShadowColor:v27];
      uint64_t v29 = [(UIActivityContentViewController *)self navigationItem];
      [v29 setScrollEdgeAppearance:v28];

      if (v5)
      {
        id v30 = [(UIActivityContentViewController *)self navigationItem];
        [v30 setStandardAppearance:v28];
      }
      else
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
        [v30 configureWithDefaultBackground];
        v31 = [MEMORY[0x1E4FB1618] separatorColor];
        [v30 setShadowColor:v31];

        int v32 = [(UIActivityContentViewController *)self navigationItem];
        [v32 setStandardAppearance:v30];
      }
      uint64_t v33 = [(UIActivityContentViewController *)self navigationItem];
      [v33 _setManualScrollEdgeAppearanceProgress:0.0];

      if ([(UIActivityContentViewController *)self hideNavigationBar])
      {
        __int16 v34 = [(UIActivityContentViewController *)self navigationController];
        [v34 setNavigationBarHidden:1];
      }
    }
    v3 = v35;
  }
}

- (void)linkViewNeedsResize:(id)a3
{
  id v4 = [(UIActivityContentViewController *)self headerTitleView];
  [v4 setNeedsUpdateConstraints];

  uint64_t v5 = [(UIActivityContentViewController *)self headerTitleView];
  [v5 setNeedsLayout];

  id v6 = [(UIActivityContentViewController *)self activityCollectionView];
  [v6 setNeedsUpdateConstraints];
}

- (void)_configureCollectionViewIfNeeded
{
  v3 = [(UIActivityContentViewController *)self activityCollectionView];
  if (v3)
  {
  }
  else if ([(UIActivityContentViewController *)self isViewLoaded])
  {
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v5 = [(UIActivityContentViewController *)self view];
    [v5 setBackgroundColor:v4];

    id v6 = [(UIActivityContentViewController *)self traitCollection];
    unint64_t v7 = [v6 userInterfaceIdiom];

    if (v7 <= 1 && ![(UIActivityContentViewController *)self configureForCloudSharing])
    {
      char v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v8];
      [(UIActivityContentViewController *)self setBackgroundView:v9];
      BOOL v10 = [(UIActivityContentViewController *)self backgroundView];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v11 = [(UIActivityContentViewController *)self view];
      uint64_t v12 = [(UIActivityContentViewController *)self backgroundView];
      [v11 addSubview:v12];
    }
    uint64_t v13 = [_UIActivityContentCollectionView alloc];
    int v14 = [(UIActivityContentViewController *)self view];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    uint64_t v23 = [(UIActivityContentViewController *)self activityCollectionViewLayout];
    double v24 = -[_UIActivityContentCollectionView initWithFrame:collectionViewLayout:](v13, "initWithFrame:collectionViewLayout:", v23, v16, v18, v20, v22);

    [(UIActivityContentViewController *)self setActivityCollectionView:v24];
    [(_UIActivityContentCollectionView *)v24 setDelegate:self];
    [(_UIActivityContentCollectionView *)v24 setPrefetchDataSource:self];
    [(_UIActivityContentCollectionView *)v24 setDelaysContentTouches:0];
    [(_UIActivityContentCollectionView *)v24 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIActivityContentCustomViewCellIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIActivityContentShareCellIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIActivityContentMagicHeadCellIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIActivityContentAirDropCellIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIActivityContentHeroActionCellIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"UIActivityContentActionCellIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"UIActivityContentHeaderSectionKind" withReuseIdentifier:@"UIActivityContentHeaderViewIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"UIActivityContentFooterSectionKind" withReuseIdentifier:@"UIActivityContentEditViewIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"UIActivityContentFooterSectionKind" withReuseIdentifier:@"UIActivityContentFooterViewIdentifier"];
    [(_UIActivityContentCollectionView *)v24 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"UIActivityContentFooterSectionKind" withReuseIdentifier:@"UIActivityContentInformationalActionFooterViewIdentifier"];
    [(_UIActivityContentCollectionView *)v24 setBackgroundColor:0];
    [(_UIActivityContentCollectionView *)v24 setAlwaysBounceVertical:1];
    [(_UIActivityContentCollectionView *)v24 setShowsVerticalScrollIndicator:0];
    [(_UIActivityContentCollectionView *)v24 setShowsHorizontalScrollIndicator:0];
    [(_UIActivityContentCollectionView *)v24 setContentInsetAdjustmentBehavior:1];
    -[_UIActivityContentCollectionView _setVisibleRectEdgeInsets:](v24, "_setVisibleRectEdgeInsets:", 0.0, 0.0, -400.0, 0.0);
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      -[_UIActivityContentCollectionView setContentInset:](v24, "setContentInset:", 72.0, 0.0, 0.0, 0.0);
    }
    double v25 = [(UIActivityContentViewController *)self view];
    [v25 addSubview:v24];

    id location = 0;
    objc_initWeak(&location, self);
    id v26 = objc_alloc(MEMORY[0x1E4FB1598]);
    v27 = [(UIActivityContentViewController *)self activityCollectionView];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke;
    v70[3] = &unk_1E5A22390;
    objc_copyWeak(&v71, &location);
    id v28 = (void *)[v26 initWithCollectionView:v27 cellProvider:v70];
    [(UIActivityContentViewController *)self setDiffableDataSource:v28];

    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke_2;
    v68[3] = &unk_1E5A223B8;
    objc_copyWeak(&v69, &location);
    uint64_t v29 = [(UIActivityContentViewController *)self diffableDataSource];
    [v29 setSupplementaryViewProvider:v68];

    id v30 = objc_opt_new();
    v31 = [(UIActivityContentViewController *)self backgroundView];

    if (v31)
    {
      int v32 = [(UIActivityContentViewController *)self backgroundView];
      uint64_t v33 = [v32 leadingAnchor];
      __int16 v34 = [(UIActivityContentViewController *)self view];
      double v35 = [v34 leadingAnchor];
      double v36 = [v33 constraintEqualToAnchor:v35];
      [v30 addObject:v36];

      double v37 = [(UIActivityContentViewController *)self backgroundView];
      double v38 = [v37 trailingAnchor];
      id v39 = [(UIActivityContentViewController *)self view];
      v40 = [v39 trailingAnchor];
      uint64_t v41 = [v38 constraintEqualToAnchor:v40];
      [v30 addObject:v41];

      v42 = [(UIActivityContentViewController *)self backgroundView];
      v43 = [v42 topAnchor];
      v44 = [(UIActivityContentViewController *)self view];
      v45 = [v44 topAnchor];
      v46 = [v43 constraintEqualToAnchor:v45];
      [v30 addObject:v46];

      double v47 = [(UIActivityContentViewController *)self backgroundView];
      uint64_t v48 = [v47 bottomAnchor];
      uint64_t v49 = [(UIActivityContentViewController *)self view];
      v50 = [v49 bottomAnchor];
      v51 = [v48 constraintEqualToAnchor:v50];
      [v30 addObject:v51];
    }
    id v52 = [(_UIActivityContentCollectionView *)v24 leadingAnchor];
    v53 = [(UIActivityContentViewController *)self view];
    v54 = [v53 leadingAnchor];
    v55 = [v52 constraintEqualToAnchor:v54];
    [v30 addObject:v55];

    v56 = [(_UIActivityContentCollectionView *)v24 trailingAnchor];
    v57 = [(UIActivityContentViewController *)self view];
    v58 = [v57 trailingAnchor];
    v59 = [v56 constraintEqualToAnchor:v58];
    [v30 addObject:v59];

    v60 = [(_UIActivityContentCollectionView *)v24 topAnchor];
    v61 = [(UIActivityContentViewController *)self view];
    v62 = [v61 topAnchor];
    v63 = [v60 constraintEqualToAnchor:v62];
    [v30 addObject:v63];

    v64 = [(_UIActivityContentCollectionView *)v24 bottomAnchor];
    v65 = [(UIActivityContentViewController *)self view];
    v66 = [v65 bottomAnchor];
    v67 = [v64 constraintEqualToAnchor:v66];
    [v30 addObject:v67];

    [MEMORY[0x1E4F28DC8] activateConstraints:v30];
    objc_destroyWeak(&v69);
    objc_destroyWeak(&v71);
    objc_destroyWeak(&location);
  }
}

id __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained _provideCellForCollectionView:v9 indexPath:v8 itemIdentifier:v7];

  return v11;
}

id __67__UIActivityContentViewController__configureCollectionViewIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v11 = [WeakRetained _provideSupplementaryViewForCollectionView:v9 kind:v8 indexPath:v7];

  return v11;
}

- (void)_configureMagicHeadCell:(id)a3 withProxy:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a4 identifier];
  [(UIActivityContentViewController *)self _configurePeopleCell:v6 itemIdentifier:v7];

  id v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 displayName];
    BOOL v10 = [v6 subtitle];
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    int v14 = v10;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "_configureMagicHeadCell: displayName:%@ subtitle:%@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_configureAirDropCell:(id)a3 withChange:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 displayName];
  uint64_t v8 = [v6 status];
  id v9 = share_sheet_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "configure AirDrop cell with change:%@", (uint8_t *)&v20, 0xCu);
  }

  if (v7 | v8)
  {
    uint64_t v10 = [v6 state];
    [v6 progress];
    [v5 setProgress:v10 != 5 animated:v11 / 100.0];
    uint64_t v12 = [(id)v7 slotIdentifier];
    uint64_t v13 = [(id)v8 slotIdentifier];
    int v14 = [(id)v7 text];
    [v5 setDisplayName:v14];

    [v5 setTextSlotID:v12];
    uint64_t v15 = [(id)v8 text];
    [v5 setSubtitle:v15];

    [v5 setSubtitleSlotID:v13];
    if ((unint64_t)(v10 - 5) > 1)
    {
      if (v10 == 4)
      {
        double v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
        [v5 setSubtitleTextColor:v16];
        goto LABEL_13;
      }
      double v16 = 0;
    }
    else
    {
      double v16 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    [v5 setSubtitleTextColor:v16];
    if ((unint64_t)(v10 - 1) <= 1)
    {
      [v5 startPulsing];
LABEL_14:
      double v17 = share_sheet_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        double v18 = [v5 displayName];
        double v19 = [v5 subtitle];
        int v20 = 138412546;
        id v21 = v18;
        __int16 v22 = 2112;
        uint64_t v23 = v19;
        _os_log_impl(&dword_1A0AD8000, v17, OS_LOG_TYPE_DEFAULT, "did update airdrop cell with displayName:%@ subtitle:%@", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_17;
    }
LABEL_13:
    [v5 stopPulsing];
    goto LABEL_14;
  }
  [v5 stopPulsing];
  double v16 = share_sheet_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    -[UIActivityContentViewController _configureAirDropCell:withChange:]();
  }
LABEL_17:
}

- (void)_configurePeopleCell:(id)a3 itemIdentifier:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 setStateBeingRestored:1];
  uint64_t v8 = [(UIActivityContentViewController *)self dataSourceManager];
  id v9 = [v8 dataSource];

  uint64_t v10 = [v9 peopleProxyForIdentifier:v7];
  if (!v10)
  {
    uint64_t v10 = [v9 airDropProxy];
  }
  double v11 = share_sheet_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v10;
    _os_log_impl(&dword_1A0AD8000, v11, OS_LOG_TYPE_DEFAULT, "configure people cell for proxy:%@", buf, 0xCu);
  }

  uint64_t v12 = [v10 identifier];
  [v6 setNode:v10];
  uint64_t v13 = [(UIActivityContentViewController *)self activeAirDropTransferChange];
  int v14 = [v13 proxyIdentifier];
  int v15 = [v12 isEqual:v14];

  if (v15)
  {
    [(UIActivityContentViewController *)self _configureAirDropCell:v6 withChange:v13];
  }
  else
  {
    int v16 = [v10 isPlaceholder];
    [v6 setIdentifier:v12];
    objc_msgSend(v6, "setImageSlotID:", objc_msgSend(v10, "avatarImageSlotID"));
    objc_msgSend(v6, "setTransportSlotID:", objc_msgSend(v10, "transportImageSlotID"));
    double v17 = [v10 displayName];
    objc_msgSend(v6, "setTextSlotID:", objc_msgSend(v17, "slotIdentifier"));

    double v18 = [v10 subtitle];
    objc_msgSend(v6, "setSubtitleSlotID:", objc_msgSend(v18, "slotIdentifier"));

    double v19 = [v10 displayName];
    int v20 = [v19 text];
    [v6 setDisplayName:v20];

    id v21 = [v10 subtitle];
    __int16 v22 = [v21 text];
    [v6 setSubtitle:v22];

    objc_msgSend(v6, "setDisabled:", objc_msgSend(v10, "isDisabled"));
    [v6 setLongPressable:1];
    uint64_t v23 = [v10 peopleSuggestion];
    objc_msgSend(v6, "setIsGroup:", objc_msgSend(v23, "isGroup"));
    if (!v23 || (v16 & 1) != 0)
    {
      [v6 setImage:0];
      [v6 setTransportImage:0];
    }
    else
    {
      double v37 = [MEMORY[0x1E4F1CA80] set];
      if ([v23 isTapToRadar])
      {
        uint64_t v24 = (void *)MEMORY[0x1E4FB1818];
        double v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v26 = [v24 imageNamed:@"FramedBugIcon" inBundle:v25];

        [v6 setImage:v26];
        v27 = v37;
      }
      else
      {
        id v28 = [(UIActivityContentViewController *)self peopleSuggestionImageProvider];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke;
        v41[3] = &unk_1E5A217F8;
        id v36 = v6;
        id v42 = v36;
        id v35 = v12;
        id v43 = v35;
        uint64_t v29 = [v28 requestAvatarImageForPeopleSuggestion:v23 resultHandler:v41];

        if (v29)
        {
          id v30 = [MEMORY[0x1E4F28ED0] numberWithInt:v29];
          [v37 addObject:v30];
        }
        v31 = [(UIActivityContentViewController *)self peopleSuggestionImageProvider];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke_2;
        v38[3] = &unk_1E5A217F8;
        id v39 = v36;
        id v40 = v35;
        uint64_t v32 = [v31 requestTransportImageForPeopleSuggestion:v23 resultHandler:v38];

        v27 = v37;
        if (v32)
        {
          uint64_t v33 = [MEMORY[0x1E4F28ED0] numberWithInt:v32];
          [v37 addObject:v33];
        }
        id v26 = v42;
      }

      __int16 v34 = [(UIActivityContentViewController *)self identifiersToPeopleSuggestionImageRequestIDs];
      [v34 setObject:v27 forKeyedSubscript:v7];
    }
  }
  [v6 setStateBeingRestored:0];
}

void __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  if (v10)
  {
    if ((a3 & 1) == 0)
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      int v9 = [v8 isEqual:*(void *)(a1 + 40)];

      if (v9) {
        [*(id *)(a1 + 32) setImage:v10];
      }
    }
  }
}

void __71__UIActivityContentViewController__configurePeopleCell_itemIdentifier___block_invoke_2(uint64_t a1, void *a2, char a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  if (v10)
  {
    if ((a3 & 1) == 0)
    {
      uint64_t v8 = [*(id *)(a1 + 32) identifier];
      int v9 = [v8 isEqual:*(void *)(a1 + 40)];

      if (v9) {
        [*(id *)(a1 + 32) setTransportImage:v10];
      }
    }
  }
}

- (void)_configureSharingAppCell:(id)a3 itemIdentifier:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIActivityContentViewController *)self dataSourceManager];
  int v9 = [v8 dataSource];

  id v10 = [v9 activityForIdentifier:v7];
  uint64_t v46 = v9;
  double v11 = [v9 shareProxyForIdentifier:v7];
  uint64_t v12 = share_sheet_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v10;
    __int16 v58 = 2112;
    v59 = v11;
    _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "configure sharing cell for activity:%@ proxy:%@", buf, 0x16u);
  }

  uint64_t v13 = [v10 activityType];

  int v14 = [v11 activityTitle];
  uint64_t v15 = [v14 text];

  if (v10 && !v15)
  {
    int v16 = [(UIActivityContentViewController *)self presenter];
    double v17 = [v10 activityType];
    double v18 = [v16 customTitleForActivityType:v17];
    double v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [v10 activityTitle];
    }
    uint64_t v21 = (uint64_t)v20;

    uint64_t v15 = v21;
  }
  if ([v11 isUserDefaultsActivity]) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = [v11 isDisabled] ^ 1;
  }
  [v6 setIdentifier:v7];
  [v6 setActivityProxy:v11];
  [v6 setTitle:v15];
  objc_msgSend(v6, "setImageSlotID:", objc_msgSend(v11, "iconImageSlotID"));
  uint64_t v23 = [v11 activityTitle];
  objc_msgSend(v6, "setTitleSlotID:", objc_msgSend(v23, "slotIdentifier"));

  v45 = (void *)v15;
  if (v13 == @"com.apple.UIKit.activity.AirDrop") {
    uint64_t v24 = [v46 nearbyCountSlotID];
  }
  else {
    uint64_t v24 = 0;
  }
  [v6 setBadgeSlotID:v24];
  [v6 setLongPressable:v22];
  objc_msgSend(v6, "setDisabled:", objc_msgSend(v11, "isDisabled"));
  double v25 = [(UIActivityContentViewController *)self layoutSpec];
  id v26 = [v25 traitCollection];
  v27 = [v26 preferredContentSizeCategory];

  id v28 = [(UIActivityContentViewController *)self layoutSpec];
  uint64_t v29 = [v28 traitCollection];
  uint64_t v30 = [v29 userInterfaceStyle];

  uint64_t v31 = [v11 applicationBundleIdentifier];
  uint64_t v32 = [v10 _activityImageUTI];
  v44 = (void *)v31;
  if ([v11 iconImageSlotID])
  {
    [v6 setImage:0];
LABEL_17:
    uint64_t v33 = 0;
    goto LABEL_25;
  }
  if (v32)
  {
    __int16 v34 = [(UIActivityContentViewController *)self activityImageProvider];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke;
    v53[3] = &unk_1E5A217F8;
    id v54 = v6;
    id v55 = v7;
    uint64_t v33 = [v34 requestImageForUTI:v32 activityCategory:1 contentSizeCategory:v27 userInterfaceStyle:v30 iconFormat:10 synchronous:0 resultHandler:v53];

    id v35 = v54;
  }
  else if (v31)
  {
    id v36 = [(UIActivityContentViewController *)self activityImageProvider];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke_2;
    v50[3] = &unk_1E5A217F8;
    id v51 = v6;
    id v52 = v7;
    uint64_t v33 = [v36 requestImageForBundleIdentifier:v31 activityCategory:1 contentSizeCategory:v27 userInterfaceStyle:v30 iconFormat:10 synchronous:0 resultHandler:v50];

    id v35 = v51;
  }
  else
  {
    if (!v10)
    {
      [v6 setImage:0];
      id v43 = share_sheet_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        -[UIActivityContentViewController _configureSharingAppCell:itemIdentifier:]();
      }

      goto LABEL_17;
    }
    double v37 = [(UIActivityContentViewController *)self activityImageProvider];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke_3;
    v47[3] = &unk_1E5A217F8;
    id v48 = v6;
    id v49 = v7;
    uint64_t v33 = [v37 requestImageForActivity:v10 contentSizeCategory:v27 userInterfaceStyle:v30 imageSymbolConfiguration:0 synchronous:0 resultHandler:v47];

    id v35 = v48;
  }

LABEL_25:
  double v38 = [(UIActivityContentViewController *)self pulsingActivityIdentifier];
  int v39 = [v38 isEqual:v7];

  if (v39)
  {
    id v40 = [(UIActivityContentViewController *)self pulsingLocalizedTitle];
    [v6 setTitle:v40];

    [v6 startPulsing];
  }
  if (v33)
  {
    uint64_t v41 = [MEMORY[0x1E4F28ED0] numberWithInt:v33];
    id v42 = [(UIActivityContentViewController *)self identifiersToActivityImageRequestID];
    [v42 setObject:v41 forKeyedSubscript:v7];
  }
}

void __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 32) setImage:v5];
  }
}

void __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 32) setImage:v5];
  }
}

void __75__UIActivityContentViewController__configureSharingAppCell_itemIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 32) setImage:v5];
  }
}

- (void)_configureHeroActionCell:(id)a3 itemIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIActivityContentViewController *)self dataSourceManager];
  int v9 = [v8 dataSource];

  id v10 = [v9 activityForIdentifier:v7];

  objc_msgSend(v6, "setDisabled:", objc_msgSend(v10, "_isDisabled"));
  double v11 = [(UIActivityContentViewController *)self _activityTitleForHeroActionActivity:v10];
  uint64_t v12 = [v6 titleLabel];
  [v12 setText:v11];

  uint64_t v13 = share_sheet_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    uint64_t v23 = v10;
    _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "configure hero action cell for activity:%@", (uint8_t *)&v22, 0xCu);
  }

  int v14 = [v10 _systemImageName];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4FB1818];
    int v16 = [v10 _systemImageName];
    double v17 = [v15 _systemImageNamed:v16];
    double v18 = [(UIActivityContentViewController *)self layoutSpec];
    double v19 = [v18 activityImageSymbolConfiguration];
    id v20 = [v17 imageByApplyingSymbolConfiguration:v19];
  }
  else
  {
    int v16 = [v10 _actionImage];
    id v20 = [v16 imageWithRenderingMode:2];
  }

  uint64_t v21 = [v6 activityImageView];
  [v21 setImage:v20];
}

- (void)_configureActionCell:(id)a3 itemIdentifier:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIActivityContentViewController *)self dataSourceManager];
  int v9 = [v8 dataSource];

  id v10 = [v9 activityForIdentifier:v7];
  v77 = v9;
  v78 = v7;
  double v11 = [v9 actionProxyForIdentifier:v7];
  uint64_t v12 = share_sheet_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v89 = v10;
    __int16 v90 = 2112;
    v91 = v11;
    _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "configure action cell for activity:%@ proxy:%@", buf, 0x16u);
  }

  uint64_t v13 = [(id)objc_opt_class() _activityStyle];
  int v14 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1E20];
  int v16 = [(UIActivityContentViewController *)self traitCollection];
  double v17 = objc_msgSend(v15, "traitCollectionWithUserInterfaceStyle:", objc_msgSend(v16, "userInterfaceStyle"));
  double v18 = [v14 resolvedColorWithTraitCollection:v17];

  if (v13 == 1)
  {
    id v19 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else
  {
    id v19 = v18;
  }
  id v20 = v19;
  uint64_t v21 = v18;
  [v6 setIdentifier:v7];
  [v6 setActivityProxy:v11];
  int v22 = [v11 activityTitle];
  [v22 slotTextHeight];
  objc_msgSend(v6, "setPlatterTextHeight:");

  uint64_t v23 = [v11 activityTitle];
  uint64_t v24 = [v23 text];

  v76 = v20;
  if (v10 && !v24)
  {
    double v25 = [(UIActivityContentViewController *)self heroActionActivityTypes];
    id v26 = [v10 activityType];
    int v27 = [v25 containsObject:v26];

    if (v27)
    {
      uint64_t v24 = [(UIActivityContentViewController *)self _activityTitleForHeroActionActivity:v10];
      id v28 = share_sheet_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v24;
        _os_log_impl(&dword_1A0AD8000, v28, OS_LOG_TYPE_DEFAULT, "hero action title:%@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v29 = [(UIActivityContentViewController *)self presenter];
      uint64_t v30 = [v10 activityType];
      id v28 = [v29 customTitleForActivityType:v30];

      if (v28)
      {
        id v28 = v28;
        uint64_t v31 = share_sheet_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v89 = v28;
          _os_log_impl(&dword_1A0AD8000, v31, OS_LOG_TYPE_DEFAULT, "custom action title:%@", buf, 0xCu);
        }

        uint64_t v24 = v28;
      }
      else
      {
        uint64_t v24 = [v10 activityTitle];
      }
    }
  }
  [v6 setTitle:v24];
  uint64_t v32 = [(UIActivityContentViewController *)self layoutSpec];
  uint64_t v33 = [v32 traitCollection];
  uint64_t v34 = [v33 preferredContentSizeCategory];

  id v35 = [(UIActivityContentViewController *)self layoutSpec];
  id v36 = [v35 traitCollection];
  double v37 = v10;
  uint64_t v38 = [v36 userInterfaceStyle];

  uint64_t v39 = [v11 applicationBundleIdentifier];
  v72 = v37;
  uint64_t v40 = [v37 _activityImageUTI];
  v74 = (void *)v39;
  v75 = (void *)v34;
  v70 = v24;
  id v71 = v21;
  id v69 = v11;
  v73 = (void *)v40;
  if (v40)
  {
    uint64_t v41 = v40;
    id v42 = [(UIActivityContentViewController *)self activityImageProvider];
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke;
    v85[3] = &unk_1E5A217F8;
    id v43 = &v86;
    id v86 = v6;
    v44 = &v87;
    id v87 = v78;
    uint64_t v45 = [v42 requestImageForUTI:v41 activityCategory:0 contentSizeCategory:v34 userInterfaceStyle:v38 iconFormat:10 synchronous:0 resultHandler:v85];
LABEL_21:
    uint64_t v47 = v45;
    id v48 = v72;
    goto LABEL_22;
  }
  uint64_t v68 = v38;
  if (v39)
  {
    [(UIActivityContentViewController *)self activityImageProvider];
    id v42 = v46 = v39;
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke_2;
    v82[3] = &unk_1E5A217F8;
    id v43 = &v83;
    id v83 = v6;
    v44 = &v84;
    id v84 = v78;
    uint64_t v45 = [v42 requestImageForBundleIdentifier:v46 activityCategory:0 contentSizeCategory:v34 userInterfaceStyle:v38 iconFormat:10 synchronous:0 resultHandler:v82];
    goto LABEL_21;
  }
  if (!v37)
  {
    [v6 setImage:0];
    id v48 = 0;
    goto LABEL_24;
  }
  id v42 = [(UIActivityContentViewController *)self activityImageProvider];
  v65 = [(UIActivityContentViewController *)self layoutSpec];
  uint64_t v66 = [v65 activityImageSymbolConfiguration];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke_3;
  v79[3] = &unk_1E5A217F8;
  id v43 = &v80;
  id v80 = v6;
  v44 = &v81;
  id v81 = v78;
  v67 = (void *)v66;
  uint64_t v47 = [v42 requestImageForActivity:v72 contentSizeCategory:v34 userInterfaceStyle:v68 imageSymbolConfiguration:v66 synchronous:0 resultHandler:v79];

  id v48 = v72;
LABEL_22:

  uint64_t v24 = v70;
  uint64_t v21 = v71;
  double v11 = v69;
  if (v47)
  {
    id v49 = [MEMORY[0x1E4F28ED0] numberWithInt:v47];
    v50 = [(UIActivityContentViewController *)self identifiersToActivityImageRequestID];
    [v50 setObject:v49 forKeyedSubscript:v78];
  }
LABEL_24:
  [v6 setContentTintColor:v76];
  if ([v48 _isDisabled]) {
    uint64_t v51 = 1;
  }
  else {
    uint64_t v51 = [v11 isDisabled];
  }
  [v6 setDisabled:v51];
  id v52 = [v48 _activitySubtitle];
  [v6 setSubtitle:v52];

  v53 = [v48 _activityStatusImage];
  [v6 setStatusImage:v53];

  objc_msgSend(v6, "setImageSlotID:", objc_msgSend(v11, "iconImageSlotID"));
  id v54 = [v11 activityTitle];
  objc_msgSend(v6, "setTitleSlotID:", objc_msgSend(v54, "slotIdentifier"));

  id v55 = [v48 _activityStatusTintColor];
  [v6 setStatusImageTintColor:v55];

  v56 = [v48 _activityBadgeText];
  v57 = [v48 _activityBadgeTextColor];
  __int16 v58 = v57;
  if (v57)
  {
    id v59 = v57;
  }
  else
  {
    id v59 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  uint64_t v60 = v59;

  v61 = [v48 _activityBadgeColor];
  v62 = v61;
  if (v61)
  {
    id v63 = v61;
  }
  else
  {
    id v63 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  v64 = v63;

  [v6 setBadgeText:v56 textColor:v60 backgroundColor:v64];
}

void __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 32) setImage:v5];
  }
}

void __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 32) setImage:v5];
  }
}

void __71__UIActivityContentViewController__configureActionCell_itemIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  int v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if (v4) {
    [*(id *)(a1 + 32) setImage:v5];
  }
}

- (id)_provideCellForCollectionView:(id)a3 indexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(UIActivityContentViewController *)self currentSnapshot];
  uint64_t v12 = [v11 sectionIdentifierForSectionContainingItemIdentifier:v10];

  uint64_t v13 = [(UIActivityContentViewController *)self dataSourceManager];
  int v14 = [v13 dataSource];

  uint64_t v15 = [(UIActivityContentViewController *)self layoutSpec];
  BOOL v16 = ([v15 isAccessibilityContentSize] & 1) == 0
     && [(UIActivityContentViewController *)self showHeroActionsHorizontally];

  double v17 = share_sheet_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[UIActivityContentViewController _provideCellForCollectionView:indexPath:itemIdentifier:]();
  }

  if ([v12 isEqualToString:@"SHSheetContentCustomViewSectionIdentifier"])
  {
    double v18 = [v8 dequeueReusableCellWithReuseIdentifier:@"UIActivityContentCustomViewCellIdentifier" forIndexPath:v9];
  }
  else if ([v12 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"])
  {
    id v19 = [v14 airDropProxy];
    id v20 = [v19 identifier];
    int v21 = [v10 isEqual:v20];

    if (v21)
    {
      double v18 = [v8 dequeueReusableCellWithReuseIdentifier:@"UIActivityContentMagicHeadCellIdentifier" forIndexPath:v9];
      int v22 = [(UIActivityContentViewController *)self layoutSpec];
      [v18 configureLayoutIfNeeded:v22];

      uint64_t v23 = [v19 identifier];
      [v18 setIdentifier:v23];

      [v18 setNode:v19];
    }
    else
    {
      double v18 = [v8 dequeueReusableCellWithReuseIdentifier:@"UIActivityContentAirDropCellIdentifier" forIndexPath:v9];
      double v25 = [(UIActivityContentViewController *)self layoutSpec];
      [v18 configureLayoutIfNeeded:v25];

      [(UIActivityContentViewController *)self _configurePeopleCell:v18 itemIdentifier:v10];
    }
  }
  else if ([v12 isEqualToString:@"SHSheetContentAppsSectionIdentifier"])
  {
    double v18 = [v8 dequeueReusableCellWithReuseIdentifier:@"UIActivityContentShareCellIdentifier" forIndexPath:v9];
    uint64_t v24 = [(UIActivityContentViewController *)self layoutSpec];
    [v18 configureLayoutIfNeeded:v24];

    [(UIActivityContentViewController *)self _configureSharingAppCell:v18 itemIdentifier:v10];
  }
  else if (v16 {
         && [v12 isEqualToString:@"SHSheetContentHeroActionsSectionIdentifier"])
  }
  {
    double v18 = [v8 dequeueReusableCellWithReuseIdentifier:@"UIActivityContentHeroActionCellIdentifier" forIndexPath:v9];
    [(UIActivityContentViewController *)self _configureHeroActionCell:v18 itemIdentifier:v10];
  }
  else
  {
    double v18 = [v8 dequeueReusableCellWithReuseIdentifier:@"UIActivityContentActionCellIdentifier" forIndexPath:v9];
    [(UIActivityContentViewController *)self _configureActionCell:v18 itemIdentifier:v10];
  }

  return v18;
}

- (id)_provideSupplementaryViewForCollectionView:(id)a3 kind:(id)a4 indexPath:(id)a5
{
  v36[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(UIActivityContentViewController *)self currentSnapshot];
  uint64_t v12 = [v11 sectionIdentifiers];

  uint64_t v13 = -[UIActivityContentViewController _sectionIdentifierForIndex:](self, "_sectionIdentifierForIndex:", [v10 section]);
  v36[0] = @"SHSheetContentCustomViewSectionIdentifier";
  v36[1] = @"SHSheetContentAppsSectionIdentifier";
  v36[2] = @"SHSheetContentPeopleSectionIdentifier";
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
  if ((([v13 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"] & 1) != 0
     || [v13 isEqualToString:@"SHSheetContentAppsSectionIdentifier"])
    && [v9 isEqualToString:@"UIActivityContentHeaderSectionKind"])
  {
    uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"UIActivityContentHeaderViewIdentifier" forIndexPath:v10];
    BOOL v16 = [(UIActivityContentViewController *)self topContentSectionText];
    [v15 titleLabel];
    v18 = double v17 = v12;
    [v18 setText:v16];

    uint64_t v12 = v17;
    id v19 = [(UIActivityContentViewController *)self layoutSpec];
    [v19 topContentSectionHeaderInsets];
    objc_msgSend(v15, "setDirectionalLayoutMargins:");
  }
  else if ([v13 hasPrefix:@"SHSheetContentInformationalActionsSectionIdentifier_"] {
         && [v9 isEqualToString:@"UIActivityContentFooterSectionKind"])
  }
  {
    uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"UIActivityContentInformationalActionFooterViewIdentifier" forIndexPath:v10];
    id v19 = [(UIActivityContentViewController *)self _footerTextForInformationalSectionIdentifier:v13];
    id v20 = [v15 footerTextView];
    [v20 setAttributedText:v19];
  }
  else
  {
    int v21 = [v12 lastObject];
    if ([v13 isEqualToString:v21])
    {
      char v22 = [v14 containsObject:v13];

      if ((v22 & 1) == 0)
      {
        id v35 = v12;
        uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"UIActivityContentEditViewIdentifier" forIndexPath:v10];
        uint64_t v23 = [MEMORY[0x1E4FB16C8] currentDevice];
        uint64_t v24 = [v23 userInterfaceIdiom];

        if (v24 == 6)
        {
          double v25 = @"SHARE_SHEET_EDIT_ACTIONS_BUTTON_TITLE";
        }
        else
        {
          int v27 = [v15 editButton];
          id v28 = [(UIActivityContentViewController *)self layoutSpec];
          uint64_t v29 = [v28 editTintColor];
          [v27 setTitleColor:v29 forState:0];

          double v25 = @"SHARE_SHEET_EDIT_ACTIONS_BUTTON_TITLE_WITH_ELLIPSIS";
        }
        uint64_t v30 = [v15 editButton];
        uint64_t v31 = _ShareSheetBundle();
        uint64_t v32 = [v31 localizedStringForKey:v25 value:&stru_1EF308000 table:@"Localizable"];
        [v30 setTitle:v32 forState:0];

        id v19 = [v15 editButton];
        uint64_t v33 = [(UIActivityContentViewController *)self presenter];
        [v19 addTarget:v33 action:sel_handleActionsEdit forEvents:64];

        uint64_t v12 = v35;
        goto LABEL_18;
      }
    }
    else
    {
    }
    if (![v9 isEqualToString:@"UIActivityContentFooterSectionKind"])
    {
      uint64_t v15 = 0;
      goto LABEL_19;
    }
    uint64_t v15 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"UIActivityContentFooterViewIdentifier" forIndexPath:v10];
    id v19 = [(UIActivityContentViewController *)self layoutSpec];
    id v26 = [v19 footerBackgroundColor];
    [v15 setBackgroundColor:v26];
  }
LABEL_18:

LABEL_19:
  return v15;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v15 = a4;
  id v7 = -[UIActivityContentViewController _sectionIdentifierForIndex:](self, "_sectionIdentifierForIndex:", [a5 section]);
  if ([v7 isEqualToString:@"SHSheetContentCustomViewSectionIdentifier"])
  {
    id v8 = [(UIActivityContentViewController *)self customViewController];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 view];
      double v11 = [v15 contentView];
      [v11 bounds];
      objc_msgSend(v10, "setFrame:");
      [v10 setAutoresizingMask:18];
      getPUCarouselSharingViewControllerClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v9 view];
        [v12 setBackgroundColor:0];

        uint64_t v13 = [v9 mainCollectionView];
        [v13 setBackgroundColor:0];
      }
      int v14 = [v11 subviews];
      [v14 makeObjectsPerformSelector:sel_removeFromSuperview];

      [v9 willMoveToParentViewController:self];
      [(UIActivityContentViewController *)self addChildViewController:v9];
      [v11 addSubview:v10];
      [v9 didMoveToParentViewController:self];
    }
  }
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        double v11 = [(UIActivityContentViewController *)self diffableDataSource];
        uint64_t v12 = [v11 itemIdentifierForIndexPath:v10];

        uint64_t v13 = [(UIActivityContentViewController *)self dataSource];
        int v14 = [v13 peopleProxyForIdentifier:v12];

        id v15 = [v14 peopleSuggestion];
        if (v15)
        {
          BOOL v16 = [(UIActivityContentViewController *)self peopleSuggestionImageProvider];
          [v16 requestAvatarImageForPeopleSuggestion:v15 resultHandler:0];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = a4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v27 = *(void *)v33;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v33 != v27) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * v7);
        uint64_t v9 = [(UIActivityContentViewController *)self diffableDataSource];
        uint64_t v10 = [v9 itemIdentifierForIndexPath:v8];

        double v11 = [(UIActivityContentViewController *)self identifiersToPeopleSuggestionImageRequestIDs];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];

        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v29;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              long long v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
              long long v19 = [(UIActivityContentViewController *)self peopleSuggestionImageProvider];
              objc_msgSend(v19, "cancelImageRequest:", objc_msgSend(v18, "intValue"));

              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v15);
        }

        long long v20 = [(UIActivityContentViewController *)self identifiersToActivityImageRequestID];
        int v21 = [v20 objectForKeyedSubscript:v10];

        if (v21)
        {
          uint64_t v22 = [(UIActivityContentViewController *)self identifiersToActivityImageRequestID];
          uint64_t v23 = [v22 objectForKeyedSubscript:v10];
          uint64_t v24 = [v23 intValue];

          double v25 = [(UIActivityContentViewController *)self activityImageProvider];
          [v25 cancelImageRequest:v24];
        }
        ++v7;
      }
      while (v7 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a4;
  id v8 = a3;
  [v8 deselectItemAtIndexPath:v7 animated:0];
  uint64_t v9 = [v8 cellForItemAtIndexPath:v7];

  uint64_t v10 = [(UIActivityContentViewController *)self currentSnapshot];
  double v11 = [(UIActivityContentViewController *)self diffableDataSource];
  uint64_t v12 = [v11 itemIdentifierForIndexPath:v7];
  id v13 = [v10 sectionIdentifierForSectionContainingItemIdentifier:v12];

  if ([v13 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"])
  {
    id v14 = v9;
    uint64_t v15 = [v14 identifier];
    uint64_t v16 = [(UIActivityContentViewController *)self dataSource];
    uint64_t v17 = [v16 airDropProxy];
    id v18 = [v17 identifier];
    id v19 = v15;
    id v20 = v19;
    if (v18 == v19)
    {
    }
    else
    {
      if ((v19 != 0) == (v18 == 0))
      {
      }
      else
      {
        char v21 = [v18 isEqual:v19];

        if (v21) {
          goto LABEL_14;
        }
      }
      if ([v14 isLongPressable])
      {
        long long v30 = (void *)MEMORY[0x1E4FB1678];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2;
        v39[3] = &unk_1E5A22428;
        v39[4] = self;
        id v20 = v20;
        id v40 = v20;
        long long v29 = [v30 configurationWithIdentifier:v7 previewProvider:&__block_literal_global_13 actionProvider:v39];

        goto LABEL_15;
      }
    }
LABEL_14:
    long long v29 = 0;
    goto LABEL_15;
  }
  if (![v13 isEqualToString:@"SHSheetContentAppsSectionIdentifier"])
  {
    long long v29 = 0;
    goto LABEL_16;
  }
  id v14 = [MEMORY[0x1E4F1CA48] array];
  id v20 = v9;
  if (![v20 isLongPressable]) {
    goto LABEL_14;
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5;
  v38[3] = &unk_1E5A22450;
  void v38[4] = self;
  uint64_t v22 = (void *)MEMORY[0x1A6229A90](v38);
  uint64_t v23 = [(UIActivityContentViewController *)self dataSource];
  uint64_t v24 = [v20 identifier];
  double v25 = [v23 shareProxyForIdentifier:v24];

  id v26 = (void *)MEMORY[0x1E4FB1678];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7;
  v32[3] = &unk_1E5A224C8;
  id v33 = v25;
  long long v34 = self;
  id v35 = v7;
  id v37 = v22;
  id v14 = v14;
  id v36 = v14;
  id v27 = v22;
  id v28 = v25;
  long long v29 = [v26 configurationWithIdentifier:v35 previewProvider:&__block_literal_global_146 actionProvider:v32];

LABEL_15:
LABEL_16:

  return v29;
}

uint64_t __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke()
{
  return 0;
}

id __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = _ShareSheetBundle();
  v3 = [v2 localizedStringForKey:@"SHARE_SHEET_REMOVE_PERSON_TITLE" value:&stru_1EF308000 table:@"Localizable"];

  int v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.thumbsdown"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
  v21[3] = &unk_1E5A22400;
  uint64_t v6 = *(void **)(a1 + 40);
  v21[4] = *(void *)(a1 + 32);
  id v22 = v6;
  id v7 = [v4 actionWithTitle:v3 image:v5 identifier:0 handler:v21];

  [v7 setAttributes:2];
  v24[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  if (IsAppleInternalBuild())
  {
    uint64_t v9 = _ShareSheetBundle();
    uint64_t v10 = [v9 localizedStringForKey:@"SHARE_SHEET_SUGGESTION_INFO_TITLE" value:&stru_1EF308000 table:@"Localizable"];

    double v11 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4;
    v19[3] = &unk_1E5A22400;
    id v13 = *(void **)(a1 + 40);
    v19[4] = *(void *)(a1 + 32);
    id v20 = v13;
    id v14 = [v11 actionWithTitle:v10 image:v12 identifier:0 handler:v19];

    uint64_t v23 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    uint64_t v16 = [v15 arrayByAddingObject:v7];

    id v8 = (void *)v16;
  }
  uint64_t v17 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF308000 children:v8];

  return v17;
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v2 peopleProxyForIdentifier:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) presenter];
  [v3 removePeopleSuggestionProxy:v5];

  int v4 = [*(id *)(a1 + 32) dataSourceManager];
  [v4 suggestLessPeopleProxyForIdentifier:*(void *)(a1 + 40)];
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v2 peopleProxyForIdentifier:*(void *)(a1 + 40)];

  v3 = [v5 suggestionReason];
  int v4 = [*(id *)(a1 + 32) presenter];
  [v4 handleInfoSuggestionPress:v3];
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 dataSource];
  id v11 = [v9 shareProxyForIdentifier:v8];

  uint64_t v10 = [*(id *)(a1 + 32) presenter];
  [v10 performShareActivityProxy:v11 activityIdentifier:v7];
}

uint64_t __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_6()
{
  return 0;
}

id __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_7(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) activityIdentifierShare];
  if (v2)
  {

LABEL_3:
    v3 = _ShareSheetBundle();
    int v4 = [v3 localizedStringForKey:@"SHARE_EXTENSION_TITLE" value:&stru_1EF308000 table:@"Localizable"];

    id v5 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8;
    v36[3] = &unk_1E5A22478;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void **)(a1 + 48);
    id v37 = v7;
    uint64_t v38 = v8;
    id v39 = v9;
    id v40 = *(id *)(a1 + 64);
    uint64_t v10 = [v5 actionWithTitle:v4 image:v6 identifier:0 handler:v36];

    [*(id *)(a1 + 56) addObject:v10];
    goto LABEL_7;
  }
  id v11 = [*(id *)(a1 + 32) activityIdentifierOpen];
  if (v11)
  {
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 32) activityIdentifierCopy];

    if (!v12) {
      goto LABEL_3;
    }
  }
LABEL_7:
  id v13 = [*(id *)(a1 + 32) activityIdentifierOpen];

  if (v13)
  {
    id v14 = _ShareSheetBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"OPEN_IN_ACTIVITY_TITLE" value:&stru_1EF308000 table:@"Localizable"];

    uint64_t v16 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9;
    v33[3] = &unk_1E5A224A0;
    id v35 = *(id *)(a1 + 64);
    id v34 = *(id *)(a1 + 32);
    id v18 = [v16 actionWithTitle:v15 image:v17 identifier:0 handler:v33];

    [*(id *)(a1 + 56) addObject:v18];
  }
  id v19 = [*(id *)(a1 + 32) activityIdentifierCopy];

  if (v19)
  {
    id v20 = _ShareSheetBundle();
    char v21 = [v20 localizedStringForKey:@"COPY_TO_ACTIVITY_TITLE" value:&stru_1EF308000 table:@"Localizable"];

    id v22 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.doc"];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    long long v29 = __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_10;
    long long v30 = &unk_1E5A224A0;
    id v32 = *(id *)(a1 + 64);
    id v31 = *(id *)(a1 + 32);
    uint64_t v24 = [v22 actionWithTitle:v21 image:v23 identifier:0 handler:&v27];

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v24, v27, v28, v29, v30);
  }
  double v25 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1EF308000 children:*(void *)(a1 + 56)];
  return v25;
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_8(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 activityIdentifierShare];
  uint64_t v6 = v5;
  if (v5)
  {
    id v10 = v5;
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) diffableDataSource];
    id v10 = [v7 itemIdentifierForIndexPath:*(void *)(a1 + 48)];
  }
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = [*(id *)(a1 + 32) identifier];
  (*(void (**)(uint64_t, id, void *, id))(v8 + 16))(v8, v4, v9, v10);
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_9(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v4 identifier];
  uint64_t v6 = [*(id *)(a1 + 32) activityIdentifierOpen];
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);
}

void __99__UIActivityContentViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_10(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  id v7 = [v4 identifier];
  uint64_t v6 = [*(id *)(a1 + 32) activityIdentifierCopy];
  (*(void (**)(uint64_t, id, id, void *))(v3 + 16))(v3, v5, v7, v6);
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  uint64_t v8 = [(UIActivityContentViewController *)self currentSnapshot];
  uint64_t v9 = [(UIActivityContentViewController *)self diffableDataSource];
  id v10 = [v9 itemIdentifierForIndexPath:v7];
  id v11 = [v8 sectionIdentifierForSectionContainingItemIdentifier:v10];

  uint64_t v12 = [v6 cellForItemAtIndexPath:v7];
  if ([v11 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"]) {
    [v12 setTransportIconHidden:1 animated:1 useDelay:0];
  }
  id v13 = [(UIActivityContentViewController *)self _contextMenuPreviewForCollectionView:v6 collectionViewCell:v12];

  return v13;
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  uint64_t v8 = [v6 cellForItemAtIndexPath:v7];
  uint64_t v9 = [(UIActivityContentViewController *)self _contextMenuPreviewForCollectionView:v6 collectionViewCell:v8];

  return v9;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [a4 identifier];
  uint64_t v9 = [(UIActivityContentViewController *)self diffableDataSource];
  id v10 = [v9 itemIdentifierForIndexPath:v8];

  if (v10)
  {
    id v11 = [(UIActivityContentViewController *)self currentSnapshot];
    uint64_t v12 = [v11 sectionIdentifierForSectionContainingItemIdentifier:v10];

    if ([v12 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"])
    {
      id v13 = [v7 cellForItemAtIndexPath:v8];
      [v13 setTransportIconHidden:0 animated:1 useDelay:1];
    }
  }
  else
  {
    uint64_t v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[UIActivityContentViewController collectionView:willEndContextMenuInteractionWithConfiguration:animator:]();
    }
  }
}

- (id)_contextMenuPreviewForCollectionView:(id)a3 collectionViewCell:(id)a4
{
  id v6 = a4;
  id v7 = [a3 indexPathForCell:v6];
  uint64_t v8 = [(UIActivityContentViewController *)self diffableDataSource];
  uint64_t v9 = [v8 itemIdentifierForIndexPath:v7];

  if (v9)
  {
    id v10 = [(UIActivityContentViewController *)self currentSnapshot];
    id v11 = [v10 sectionIdentifierForSectionContainingItemIdentifier:v9];

    if (([v11 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"] & 1) != 0
      || [v11 isEqualToString:@"SHSheetContentAppsSectionIdentifier"])
    {
      uint64_t v12 = [v6 createTargetedPreview];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    id v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[UIActivityContentViewController _contextMenuPreviewForCollectionView:collectionViewCell:]();
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v4 = [a3 cellForItemAtIndexPath:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v5 = [v4 isDisabled] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:0];
  id v7 = [(UIActivityContentViewController *)self currentSnapshot];
  uint64_t v8 = [(UIActivityContentViewController *)self diffableDataSource];
  uint64_t v9 = [v8 itemIdentifierForIndexPath:v6];
  id v10 = [v7 sectionIdentifierForSectionContainingItemIdentifier:v9];

  id v11 = [(UIActivityContentViewController *)self diffableDataSource];
  uint64_t v12 = [v11 itemIdentifierForIndexPath:v6];

  id v13 = share_sheet_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    long long v29 = v10;
    _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "User selected node in section %@", (uint8_t *)&v28, 0xCu);
  }

  if ([v10 isEqualToString:@"SHSheetContentPeopleSectionIdentifier"])
  {
    if ([(UIActivityContentViewController *)self ignorePersonTap])
    {
      id v14 = share_sheet_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        uint64_t v15 = "Ignore person tap currently enabled. Ignore selection.";
        uint64_t v16 = v14;
        uint32_t v17 = 2;
LABEL_23:
        _os_log_impl(&dword_1A0AD8000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v28, v17);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    uint64_t v23 = [(UIActivityContentViewController *)self dataSource];
    id v14 = [v23 peopleProxyForIdentifier:v12];

    uint64_t v24 = share_sheet_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      long long v29 = v14;
      _os_log_impl(&dword_1A0AD8000, v24, OS_LOG_TYPE_DEFAULT, "People proxy selected:%@", (uint8_t *)&v28, 0xCu);
    }

    if ([v14 isTapToRadar])
    {
      id v22 = [(objc_class *)getSFUITTRReporterClass() reporterForPeopleSuggestions];
      [v22 report];
    }
    else
    {
      id v22 = [(UIActivityContentViewController *)self presenter];
      [v22 performPeopleSuggestionProxy:v14];
    }
LABEL_20:

    goto LABEL_24;
  }
  int v18 = [v10 isEqualToString:@"SHSheetContentAppsSectionIdentifier"];
  id v19 = [(UIActivityContentViewController *)self dataSource];
  id v20 = v19;
  if (v18)
  {
    id v14 = [v19 shareProxyForIdentifier:v12];

    char v21 = share_sheet_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      long long v29 = v14;
      _os_log_impl(&dword_1A0AD8000, v21, OS_LOG_TYPE_DEFAULT, "Share proxy selected:%@", (uint8_t *)&v28, 0xCu);
    }

    id v22 = [(UIActivityContentViewController *)self presenter];
    [v22 performShareActivityProxy:v14 activityIdentifier:0];
    goto LABEL_20;
  }
  int v25 = [v19 containsSectionForIdentifier:v10];

  if (v25)
  {
    id v26 = [(UIActivityContentViewController *)self dataSource];
    id v14 = [v26 actionProxyForIdentifier:v12];

    uint64_t v27 = share_sheet_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      long long v29 = v14;
      _os_log_impl(&dword_1A0AD8000, v27, OS_LOG_TYPE_DEFAULT, "Action proxy selected:%@", (uint8_t *)&v28, 0xCu);
    }

    id v22 = [(UIActivityContentViewController *)self presenter];
    [v22 performActionActivityProxy:v14];
    goto LABEL_20;
  }
  id v14 = share_sheet_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    long long v29 = v10;
    uint64_t v15 = "Unexpected path: section %@ is not supported. Ignore selection.";
    uint64_t v16 = v14;
    uint32_t v17 = 12;
    goto LABEL_23;
  }
LABEL_24:
}

- (UIBarButtonItem)cancelButton
{
  cancelButton = self->_cancelButton;
  if (!cancelButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    int v5 = [(UIActivityContentViewController *)self presenter];
    id v6 = (UIBarButtonItem *)[v4 initWithBarButtonSystemItem:1 target:v5 action:sel_handleClose];
    id v7 = self->_cancelButton;
    self->_cancelButton = v6;

    cancelButton = self->_cancelButton;
  }
  return cancelButton;
}

- (UIBarButtonItem)nextButton
{
  nextButton = self->_nextButton;
  if (!nextButton)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    int v5 = _ShareSheetBundle();
    id v6 = [v5 localizedStringForKey:@"SHARE_SHEET_NEXT_BUTTON_TITLE" value:@"Next" table:@"Localizable"];
    id v7 = [(UIActivityContentViewController *)self presenter];
    uint64_t v8 = (UIBarButtonItem *)[v4 initWithTitle:v6 style:0 target:v7 action:sel_handleNext];
    uint64_t v9 = self->_nextButton;
    self->_nextButton = v8;

    nextButton = self->_nextButton;
  }
  return nextButton;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v15 = a3;
  id v4 = [(UIActivityContentViewController *)self activityCollectionView];

  int v5 = v15;
  if (v4 == v15)
  {
    id v6 = [(UIActivityContentViewController *)self headerLinkView];
    [v6 size];
    if (v7 == 0.0) {
      double v8 = 72.0;
    }
    else {
      double v8 = v7;
    }

    [v15 contentOffset];
    if (v9 <= -v8)
    {
      uint64_t v12 = [(UIActivityContentViewController *)self navigationItem];
      id v13 = v12;
      double v14 = 0.0;
    }
    else
    {
      [v15 contentOffset];
      double v11 = fmin((v8 + v10) * 10.0, 100.0) / 100.0;
      uint64_t v12 = [(UIActivityContentViewController *)self navigationItem];
      id v13 = v12;
      double v14 = v11;
    }
    [v12 _setManualScrollEdgeAppearanceProgress:v14];

    int v5 = v15;
  }
}

- (void)didUpdateAirDropTransferWithChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "did update airdrop transfer with change:%@", (uint8_t *)&v20, 0xCu);
  }

  [(UIActivityContentViewController *)self setActiveAirDropTransferChange:v4];
  id v6 = [v4 proxyIdentifier];
  double v7 = [(UIActivityContentViewController *)self dataSource];
  double v8 = [v7 airDropProxy];
  uint64_t v9 = [v8 identifier];
  double v10 = (void *)v9;
  if (v9) {
    double v11 = (void *)v9;
  }
  else {
    double v11 = v6;
  }
  id v12 = v11;

  id v13 = [(UIActivityContentViewController *)self diffableDataSource];
  double v14 = [v13 indexPathForItemIdentifier:v12];

  id v15 = [(UIActivityContentViewController *)self activityCollectionView];
  uint64_t v16 = [v15 cellForItemAtIndexPath:v14];

  uint32_t v17 = [v16 identifier];
  int v18 = [v17 isEqual:v6];

  if (v18)
  {
    [(UIActivityContentViewController *)self _configureAirDropCell:v16 withChange:v4];
  }
  else
  {
    id v19 = share_sheet_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(UIActivityContentViewController *)v16 didUpdateAirDropTransferWithChange:v19];
    }
  }
}

- (void)startPulsingActivity:(id)a3 localizedTitle:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(UIActivityContentViewController *)self pulsingActivity];

  if (v8)
  {
    uint64_t v9 = [(UIActivityContentViewController *)self pulsingActivity];
    [(UIActivityContentViewController *)self stopPulsingActivity:v9];
  }
  double v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "start pulsing activity:%@", (uint8_t *)&v17, 0xCu);
  }

  double v11 = [(UIActivityContentViewController *)self dataSource];
  id v12 = [v11 identifierForActivity:v6];

  [(UIActivityContentViewController *)self setPulsingActivityIdentifier:v12];
  [(UIActivityContentViewController *)self setPulsingActivity:v6];
  [(UIActivityContentViewController *)self setPulsingLocalizedTitle:v7];
  id v13 = [(UIActivityContentViewController *)self diffableDataSource];
  double v14 = [v13 indexPathForItemIdentifier:v12];

  id v15 = [(UIActivityContentViewController *)self activityCollectionView];
  uint64_t v16 = [v15 cellForItemAtIndexPath:v14];

  [v16 setTitle:v7];
  [v16 startPulsing];
}

- (void)stopPulsingActivity:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(UIActivityContentViewController *)self pulsingActivity];
  id v6 = [v5 activityUUID];
  id v7 = [v4 activityUUID];
  id v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

LABEL_6:
    id v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "stop pulsing activity:%@", (uint8_t *)&v15, 0xCu);
    }

    int v5 = [(UIActivityContentViewController *)self pulsingActivityIdentifier];
    [(UIActivityContentViewController *)self setPulsingActivityIdentifier:0];
    id v13 = [(UIActivityContentViewController *)self diffableDataSource];
    id v8 = [v13 indexPathForItemIdentifier:v5];

    double v14 = [(UIActivityContentViewController *)self activityCollectionView];
    double v10 = [v14 cellForItemAtIndexPath:v8];

    if (v10)
    {
      [v10 stopPulsing];
      [(UIActivityContentViewController *)self _configureSharingAppCell:v10 itemIdentifier:v5];
    }
    [(UIActivityContentViewController *)self setPulsingActivity:0];
    [(UIActivityContentViewController *)self setPulsingLocalizedTitle:0];
    goto LABEL_12;
  }
  double v10 = v9;
  if ((v8 == 0) != (v9 != 0))
  {
    char v11 = [v8 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_6;
  }

LABEL_12:
LABEL_13:
}

- (id)_activityTitleForHeroActionActivity:(id)a3
{
  id v4 = a3;
  int v5 = [v4 _heroActionTitle];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [v4 _heroActionTitle];
  }
  else
  {
    id v8 = [(UIActivityContentViewController *)self presenter];
    id v9 = [v4 activityType];
    double v10 = [v8 customTitleForActivityType:v9];
    char v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v4 activityTitle];
    }
    id v7 = v12;
  }
  return v7;
}

- (void)setHeroActionActivityTypes:(id)a3
{
  id v10 = a3;
  if ((unint64_t)[v10 count] >= 6)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Cannot set more than %d hero action types", 5);
    id v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];

    objc_exception_throw(v9);
  }
  id v4 = (NSArray *)[v10 copy];
  heroActionActivityTypes = self->_heroActionActivityTypes;
  self->_heroActionActivityTypes = v4;
}

- (void)dataSourceManager:(id)a3 didPublishDataSourceWithChangeDetails:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v6 = a4;
  if (([v6 snapshotChanged] & 1) != 0
    || ([v6 airDropBadgeChanged] & 1) != 0
    || ([v6 modifiedIdentifiers],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    uint64_t v46 = [v47 dataSource];
    [v46 logCurrentState];
    id v9 = [v47 dataSource];
    uint64_t v45 = [v9 diffableSnapshot];

    if (([v6 sectionsChanged] & 1) != 0 || objc_msgSend(v6, "peopleCountChanged"))
    {
      id v10 = [(UIActivityContentViewController *)self presentedViewController];
      BOOL v11 = v10 == 0;
    }
    else
    {
      BOOL v11 = 0;
    }
    if ([v6 forceReload])
    {
      unsigned int v44 = 0;
    }
    else
    {
      id v12 = [(UIActivityContentViewController *)self diffableDataSource];
      id v13 = [v12 snapshot];
      if (v13) {
        unsigned int v44 = [v6 animateDifferences] | v11;
      }
      else {
        unsigned int v44 = 0;
      }
    }
    int v14 = [v6 forceReload];
    if ([v6 peopleCountChanged])
    {
      [(UIActivityContentViewController *)self setIgnorePersonTap:1];
      *(void *)id location = 0;
      objc_initWeak((id *)location, self);
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke;
      v48[3] = &unk_1E5A21998;
      objc_copyWeak(&v49, (id *)location);
      int v15 = (void *)MEMORY[0x1A6229A90](v48);
      id v16 = [(UIActivityContentViewController *)self activeAirDropTransferChange];
      uint64_t v17 = [v46 airDropProxy];
      id v18 = [v17 identifier];
      uint64_t v19 = [v16 proxyIdentifier];
      char v20 = [v18 isEqual:v19];

      if ((v20 & 1) == 0) {
        [(UIActivityContentViewController *)self setActiveAirDropTransferChange:0];
      }

      objc_destroyWeak(&v49);
      objc_destroyWeak((id *)location);
    }
    else
    {
      int v15 = 0;
    }
    id v21 = share_sheet_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v22)
      {
        *(_WORD *)id location = 0;
        _os_log_impl(&dword_1A0AD8000, v21, OS_LOG_TYPE_DEFAULT, "apply new snapshot using reload data", location, 2u);
      }

      uint64_t v23 = [(UIActivityContentViewController *)self diffableDataSource];
      [v23 applySnapshotUsingReloadData:v45 completion:v15];
LABEL_35:

      goto LABEL_36;
    }
    if (v22)
    {
      uint64_t v24 = NSStringFromBOOL();
      *(_DWORD *)id location = 138412290;
      *(void *)&location[4] = v24;
      _os_log_impl(&dword_1A0AD8000, v21, OS_LOG_TYPE_DEFAULT, "apply new snapshot with animation:%@", location, 0xCu);
    }
    int v25 = [(UIActivityContentViewController *)self diffableDataSource];
    [v25 applySnapshot:v45 animatingDifferences:v44 completion:v15];

    id v26 = [v6 modifiedIdentifiers];
    uint64_t v27 = [v26 count];

    if ([v6 airDropBadgeChanged])
    {
      int v28 = [v46 containsSectionForIdentifier:@"SHSheetContentAppsSectionIdentifier"];
      if (v27) {
        goto LABEL_30;
      }
    }
    else
    {
      int v28 = 0;
      if (v27)
      {
LABEL_30:
        BOOL v29 = v27 != 0;
        uint64_t v23 = (void *)[v45 copy];
        if (v29)
        {
          uint64_t v30 = [v6 modifiedIdentifiers];
          [v23 reconfigureItemsWithIdentifiers:v30];
        }
        if (v28)
        {
          id v31 = [v46 shareProxies];
          id v32 = [v31 firstObject];
          id v33 = [v32 identifier];
          v50 = v33;
          id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
          [v23 reconfigureItemsWithIdentifiers:v34];
        }
        id v35 = [(UIActivityContentViewController *)self diffableDataSource];
        [v35 applySnapshot:v23 animatingDifferences:v44 completion:v15];

        goto LABEL_35;
      }
    }
    if (!v28)
    {
LABEL_36:
      id v36 = [(UIActivityContentViewController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        id v37 = share_sheet_log();
        uint64_t v38 = share_sheet_log();
        os_signpost_id_t v39 = os_signpost_id_make_with_pointer(v38, self);

        if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)id location = 0;
          _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v37, OS_SIGNPOST_INTERVAL_END, v39, "UpdateContentView", (const char *)&unk_1A0BA1E03, location, 2u);
        }

        [v36 activityContentViewControllerDidUpdateDataSource:self];
      }
      [(UIActivityContentViewController *)self _updateHeaderLinkViewAction];

      id v40 = v46;
      goto LABEL_42;
    }
    goto LABEL_30;
  }
  uint64_t v41 = share_sheet_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id location = 0;
    _os_log_impl(&dword_1A0AD8000, v41, OS_LOG_TYPE_DEFAULT, "The new data source published don't require to update the current snapshot.", location, 2u);
  }

  id v40 = share_sheet_log();
  id v42 = share_sheet_log();
  os_signpost_id_t v43 = os_signpost_id_make_with_pointer(v42, self);

  if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)id location = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v40, OS_SIGNPOST_INTERVAL_END, v43, "UpdateContentView", "update not needed", location, 2u);
  }
LABEL_42:
}

void __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke_2;
  block[3] = &unk_1E5A21998;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __91__UIActivityContentViewController_dataSourceManager_didPublishDataSourceWithChangeDetails___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIgnorePersonTap:0];
}

- (id)titleForItemIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(UIActivityContentViewController *)self dataSource];
  id v6 = [v5 activityForIdentifier:v4];

  uint64_t v7 = [(UIActivityContentViewController *)self _activityTitleForHeroActionActivity:v6];

  return v7;
}

- (id)_sectionIdentifierForIndex:(int64_t)a3
{
  id v4 = [(UIActivityContentViewController *)self currentSnapshot];
  int v5 = [v4 sectionIdentifiers];

  id v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (id)_footerTextForInformationalSectionIdentifier:(id)a3
{
  id v4 = [a3 componentsSeparatedByString:@"_"];
  int v5 = [v4 lastObject];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    if (v6)
    {
      uint64_t v7 = [(UIActivityContentViewController *)self dataSource];
      uint64_t v8 = [v7 actionProxyForIdentifier:v6];

      id v9 = [v8 activityFooter];
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v12 = [v8 activity];
        id v11 = [v12 _activityFooterText];
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)updateWithViewModel:(id)a3
{
  id v4 = a3;
  int v5 = share_sheet_log();
  id v6 = share_sheet_log();
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v6, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UpdateContentView", " enableTelemetry=YES ", buf, 2u);
  }

  uint64_t v8 = [(UIActivityContentViewController *)self viewModel];
  id v9 = [v8 metadataValues];
  id v10 = [v4 metadataValues];
  id v11 = v9;
  id v12 = v10;
  id v13 = v12;
  if (v11 == v12)
  {
    char v106 = 1;
  }
  else if ((v11 == 0) == (v12 != 0))
  {
    char v106 = 0;
  }
  else
  {
    char v106 = [v11 isEqual:v12];
  }

  int v14 = [(UIActivityContentViewController *)self viewModel];
  int v15 = [v14 urlRequests];
  id v16 = [v4 urlRequests];
  id v17 = v15;
  id v18 = v16;
  uint64_t v19 = v18;
  if (v17 == v18)
  {
    char v105 = 1;
  }
  else if ((v17 == 0) == (v18 != 0))
  {
    char v105 = 0;
  }
  else
  {
    char v105 = [v17 isEqual:v18];
  }

  char v20 = [(UIActivityContentViewController *)self viewModel];
  id v21 = [v20 urlSandboxExtensions];
  BOOL v22 = [v4 urlSandboxExtensions];
  id v23 = v21;
  id v24 = v22;
  int v25 = v24;
  if (v23 == v24)
  {
    char v26 = 1;
  }
  else if ((v23 == 0) == (v24 != 0))
  {
    char v26 = 0;
  }
  else
  {
    char v26 = [v23 isEqual:v24];
  }

  uint64_t v27 = [(UIActivityContentViewController *)self viewModel];
  int v97 = [v27 showOptions];
  int v102 = [v4 showOptions];

  int v28 = [(UIActivityContentViewController *)self viewModel];
  BOOL v29 = [v28 customOptionsTitle];
  uint64_t v30 = [v4 customOptionsTitle];
  id v31 = v29;
  id v32 = v30;
  id v33 = v32;
  if (v31 == v32)
  {
    int v103 = 0;
  }
  else
  {
    if ((v31 == 0) == (v32 != 0)) {
      int v34 = 1;
    }
    else {
      int v34 = [v31 isEqual:v32] ^ 1;
    }
    int v103 = v34;
  }

  id v35 = [(UIActivityContentViewController *)self viewModel];
  int v100 = [v35 showCustomHeaderButton];
  int v99 = [v4 showCustomHeaderButton];

  id v36 = [(UIActivityContentViewController *)self viewModel];
  id v37 = [v36 customHeaderButtonTitle];
  uint64_t v38 = [v4 customHeaderButtonTitle];
  id v39 = v37;
  id v40 = v38;
  uint64_t v41 = v40;
  if (v39 == v40)
  {
    int v101 = 0;
  }
  else
  {
    if ((v39 == 0) == (v40 != 0)) {
      int v42 = 1;
    }
    else {
      int v42 = [v39 isEqual:v40] ^ 1;
    }
    int v101 = v42;
  }

  os_signpost_id_t v43 = [(UIActivityContentViewController *)self viewModel];
  unsigned int v44 = [v43 customHeaderButtonColor];
  uint64_t v45 = [v4 customHeaderButtonColor];
  id v46 = v44;
  id v47 = v45;
  id v48 = v47;
  char v104 = v26;
  if (v46 == v47)
  {
    int v98 = 0;
  }
  else
  {
    if ((v46 == 0) == (v47 != 0)) {
      int v49 = 1;
    }
    else {
      int v49 = [v46 isEqual:v47] ^ 1;
    }
    int v98 = v49;
  }

  v50 = [(UIActivityContentViewController *)self viewModel];
  int v51 = [v50 showHeaderSpecialization];
  int v52 = [v4 showHeaderSpecialization];

  v53 = [(UIActivityContentViewController *)self viewModel];
  int v54 = [v53 isCollaborative];
  int v55 = [v4 isCollaborative];

  v56 = [(UIActivityContentViewController *)self viewModel];
  v57 = [v56 collaborationModeTitle];
  __int16 v58 = [v4 collaborationModeTitle];
  id v59 = v57;
  id v60 = v58;
  v61 = v60;
  if (v59 == v60)
  {
    int v62 = 1;
  }
  else if ((v59 == 0) == (v60 != 0))
  {
    int v62 = 0;
  }
  else
  {
    int v62 = [v59 isEqual:v60];
  }

  HIDWORD(v96) = v62;
  if ((v62 & 1) == 0) {
    [(UIActivityContentViewController *)self setHeaderLinkActionsNeedsUpdate:1];
  }
  int v63 = v51 ^ v52;
  int v64 = v54 ^ v55;
  v65 = [(UIActivityContentViewController *)self viewModel];
  uint64_t v66 = [v65 collaborationFooterViewModel];
  v67 = [v4 collaborationFooterViewModel];
  id v68 = v66;
  id v69 = v67;
  v70 = v69;
  if (v68 == v69)
  {
    int v71 = 0;
  }
  else if ((v68 == 0) == (v69 != 0))
  {
    int v71 = 1;
  }
  else
  {
    int v71 = [v68 isEqual:v69] ^ 1;
  }

  if ((v97 ^ v102 | v103 | v100 ^ v99 | v101 | v98 | v63 | v64)) {
    int v72 = 1;
  }
  else {
    int v72 = HIDWORD(v96) ^ 1 | v71;
  }
  v73 = [(UIActivityContentViewController *)self viewModel];
  v74 = [v73 customViewController];
  v75 = [v4 customViewController];

  v76 = [v4 customViewControllerVerticalInsetWrapper];

  if (v76)
  {
    v77 = [v4 customViewControllerVerticalInsetWrapper];
    [v77 floatValue];
    double v79 = v78;
    id v80 = [(UIActivityContentViewController *)self layoutSpec];
    [v80 setCustomViewVerticalInset:v79];
  }
  id v81 = [v4 customViewControllerSectionHeightWrapper];

  if (v81)
  {
    v82 = [v4 customViewControllerSectionHeightWrapper];
    [v82 floatValue];
    double v84 = v83;
    v85 = [(UIActivityContentViewController *)self layoutSpec];
    [v85 setCustomViewSectionHeight:v84];
  }
  [(UIActivityContentViewController *)self setViewModel:v4];
  if ((v104 & 1) == 0 && [(UIActivityContentViewController *)self isRemote])
  {
    id v86 = [v4 urlSandboxExtensions];
    id v87 = [v4 urlRequests];
    [(UIActivityContentViewController *)self _consumeURLSandboxExtensions:v86 forURLRequests:v87];
  }
  if (v72) {
    [(UIActivityContentViewController *)self _updateHeaderLinkViewAction];
  }
  if (((v106 & v105) & v104 & 1) == 0) {
    [(UIActivityContentViewController *)self _updateHeaderMetadataValues];
  }
  if (v74 != v75) {
    [(UIActivityContentViewController *)self _updateCustomViewContent];
  }
  v88 = [v4 applicationActivityTypes];
  v89 = [(UIActivityContentViewController *)self dataSourceManager];
  [v89 setApplicationActivityTypes:v88];

  __int16 v90 = [v4 peopleSuggestionProxies];
  v91 = [v4 shareProxies];
  uint64_t v92 = [v4 actionProxies];
  v93 = [v4 activitiesByUUID];
  v94 = [v4 nearbyCountSlotID];
  uint64_t v95 = [v4 updateProxiesWithAnimation];
  LOBYTE(v96) = [v4 reloadData];
  [(UIActivityContentViewController *)self _updateContentWithPeopleProxies:v90 shareProxies:v91 actionProxies:v92 activitiesByUUID:v93 nearbyCountSlotID:v94 animated:v95 reloadData:v96];
}

- (void)_consumeURLSandboxExtensions:(id)a3 forURLRequests:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v11) bytes];
        uint64_t v12 = sandbox_extension_consume();
        if (v12 == -1)
        {
          int v14 = share_sheet_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v16 = *__error();
            id v17 = __error();
            id v18 = strerror(*v17);
            *(_DWORD *)buf = 138412802;
            id v24 = v7;
            __int16 v25 = 1024;
            int v26 = v16;
            __int16 v27 = 2080;
            int v28 = v18;
            _os_log_error_impl(&dword_1A0AD8000, v14, OS_LOG_TYPE_ERROR, "Failed to extend sandbox for one of the URL requests %@ with error %d (%s)", buf, 0x1Cu);
          }
        }
        else
        {
          uint64_t v13 = v12;
          int v14 = [(UIActivityContentViewController *)self sandboxExtensionHandles];
          int v15 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v13];
          [v14 addObject:v15];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v9);
  }
}

- (void)reloadMetadata:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(UIActivityContentViewController *)self _updateHeaderMetadataValues];
  uint64_t v4 = [(UIActivityContentViewController *)self customViewController];
  if (v4)
  {
    int v5 = (void *)v4;
    id v6 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      uint64_t v8 = [v10 title];
      uint64_t v9 = [(UIActivityContentViewController *)self navigationItem];
      [v9 setTitle:v8];
    }
  }
}

- (void)reloadContent
{
  id v4 = [(UIActivityContentViewController *)self currentSnapshot];
  if (v4)
  {
    uint64_t v3 = [(UIActivityContentViewController *)self diffableDataSource];
    [v3 applySnapshotUsingReloadData:v4];
  }
}

- (void)reloadActivity:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(UIActivityContentViewController *)self diffableDataSource];
  id v6 = [v4 activityUUID];
  uint64_t v7 = [v5 indexPathForItemIdentifier:v6];

  if (v7)
  {
    uint64_t v8 = [(UIActivityContentViewController *)self currentSnapshot];
    uint64_t v9 = [v4 activityUUID];
    v13[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v8 reloadItemsWithIdentifiers:v10];

    uint64_t v11 = [(UIActivityContentViewController *)self diffableDataSource];
    uint64_t v12 = [(UIActivityContentViewController *)self currentSnapshot];
    [v11 applySnapshotUsingReloadData:v12];
  }
}

- (LPLinkMetadata)headerMetadata
{
  dispatch_time_t v2 = [(UIActivityContentViewController *)self headerLinkView];
  uint64_t v3 = [v2 metadata];

  return (LPLinkMetadata *)v3;
}

- (void)_updateHeaderSize
{
  uint64_t v3 = [(UIActivityContentViewController *)self headerLinkView];
  if (v3)
  {
    id v6 = v3;
    id v4 = [(UIActivityContentViewController *)self headerLinkView];
    [v4 setDelegate:0];

    [(UIActivityContentViewController *)self setHeaderLinkView:0];
    int v5 = [(UIActivityContentViewController *)self headerTitleView];
    [v5 removeFromSuperview];

    [(UIActivityContentViewController *)self setHeaderTitleView:0];
    [(UIActivityContentViewController *)self _configureHeaderViewIfNeeded];
    uint64_t v3 = v6;
  }
}

- (void)_updateHeaderLinkViewAction
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_initWeak(&location, self);
  id v4 = (id *)[(UIActivityContentViewController *)self _canShowOptions];
  [(UIActivityContentViewController *)self _configureHeaderViewIfNeeded];
  int v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4)
    {
      id v6 = @"Options link";
    }
    else
    {
      dispatch_time_t v2 = [(UIActivityContentViewController *)self viewModel];
      int v7 = [v2 showCustomHeaderButton];
      id v6 = @"no button";
      if (v7) {
        id v6 = @"custom header button";
      }
    }
    *(_DWORD *)buf = 138412290;
    float v83 = v6;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "updating header action to %@", buf, 0xCu);
    if ((v4 & 1) == 0) {
  }
    }
  if ((v4 & 1) != 0
    || ([(UIActivityContentViewController *)self viewModel],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 supportsCollaboration],
        v8,
        v9))
  {
    [(UIActivityContentViewController *)self _updateHeaderLinkViewSizeClass];
    id v10 = [(UIActivityContentViewController *)self viewModel];
    int v11 = [v10 supportsCollaboration];

    if (v11)
    {
      if ([(UIActivityContentViewController *)self headerLinkActionsNeedsUpdate])
      {
        uint64_t v12 = [(UIActivityContentViewController *)self viewModel];
        char v13 = [v12 supportsSendCopy];

        [(UIActivityContentViewController *)self viewModel];
        if (v13) {
          int v14 = {;
        }
          uint64_t v15 = [v14 isCollaborative];
          int v16 = [(UIActivityContentViewController *)self viewModel];
          id v17 = [v16 collaborationModeTitle];
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke;
          v78[3] = &unk_1E5A21998;
          objc_copyWeak(&v79, &location);
          id v18 = UIActivityContentHelperCollaborationButtonAction(v15, v17, v78);

          long long v19 = [(UIActivityContentViewController *)self viewModel];
          LODWORD(v16) = [v19 isCollaborative];
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_2;
          v76[3] = &unk_1E5A21998;
          objc_copyWeak(&v77, &location);
          long long v20 = UIActivityContentHelperCopyButtonAction((int)v16, v76);

          long long v21 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v18, v20, 0);
          long long v22 = [(UIActivityContentViewController *)self headerLinkView];
          [v22 _setButtonActions:v21];

          id v23 = [(UIActivityContentViewController *)self headerLinkView];
          [v23 _setOverrideActionButtonColor:0];

          objc_destroyWeak(&v77);
          objc_destroyWeak(&v79);
        }
        else {
          uint64_t v45 = {;
        }
          id v46 = [v45 collaborationModeTitle];
          id v47 = UIActivityContentHelperCollaborationSubtitle(v46);

          id v48 = [(UIActivityContentViewController *)self headerLinkView];
          [v48 _setOverrideSubtitle:v47];
        }
        [(UIActivityContentViewController *)self setHeaderLinkActionsNeedsUpdate:0];
      }
      int v49 = [(UIActivityContentViewController *)self viewModel];
      int v50 = [v49 isCollaborative];

      if (!v50)
      {
        int v64 = [(UIActivityContentViewController *)self headerLinkView];
        char v65 = objc_opt_respondsToSelector();

        if (v65)
        {
          uint64_t v66 = [(UIActivityContentViewController *)self headerLinkView];
          [v66 _setCollaborationFooterViewModel:0 action:0];
          [(UIActivityContentViewController *)self setCollaborationFooterViewModel:0];
        }
        goto LABEL_15;
      }
      int v51 = [(UIActivityContentViewController *)self headerLinkView];
      char v52 = objc_opt_respondsToSelector();

      if (v52)
      {
        v53 = [(UIActivityContentViewController *)self headerLinkView];
        int v54 = [(UIActivityContentViewController *)self viewModel];
        int v55 = [v54 collaborationFooterViewModel];

        v56 = [(UIActivityContentViewController *)self collaborationFooterViewModel];
        if (![v55 isEqual:v56])
        {
LABEL_36:

          goto LABEL_37;
        }
        v57 = [v55 optionsSummary];
        __int16 v58 = [(UIActivityContentViewController *)self collaborationFooterViewModel];
        id v59 = [v58 optionsSummary];
        id v60 = v57;
        id v61 = v59;
        int v62 = v61;
        if (v60 == v61)
        {
        }
        else
        {
          if ((v60 == 0) == (v61 != 0))
          {

LABEL_35:
            goto LABEL_36;
          }
          int v63 = [v60 isEqual:v61];

          if (!v63) {
            goto LABEL_35;
          }
        }
        BOOL v67 = [(UIActivityContentViewController *)self canShowShareOptions];

        if (((v4 ^ v67) & 1) == 0)
        {
LABEL_45:

          goto LABEL_15;
        }
LABEL_37:
        [(UIActivityContentViewController *)self setCanShowShareOptions:v4];
        [(UIActivityContentViewController *)self setCollaborationFooterViewModel:v55];
        if (v55) {
          int v68 = (int)v4;
        }
        else {
          int v68 = 0;
        }
        if (v68 == 1)
        {
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_3;
          v74[3] = &unk_1E5A21998;
          id v4 = &v75;
          objc_copyWeak(&v75, &location);
          id v69 = v74;
        }
        else
        {
          id v69 = 0;
        }
        [v53 _setCollaborationFooterViewModel:v55 action:v69];
        if (v68) {
          objc_destroyWeak(v4);
        }
        goto LABEL_45;
      }
    }
    else
    {
      id v24 = [(UIActivityContentViewController *)self viewModel];
      __int16 v25 = [v24 customOptionsTitle];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_4;
      v72[3] = &unk_1E5A21998;
      objc_copyWeak(&v73, &location);
      int v26 = UIActivityContentHelperOptionsButtonAction((int)v4, v25, v72);

      __int16 v27 = [(UIActivityContentViewController *)self headerLinkView];
      id v81 = v26;
      int v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
      [v27 _setButtonActions:v28];

      BOOL v29 = [(UIActivityContentViewController *)self headerLinkView];
      [v29 _setAction:0 withText:&stru_1EF308000];

      objc_destroyWeak(&v73);
    }
LABEL_15:
    id v30 = objc_alloc_init(getLPLinkRendererSizeClassParametersClass());
    [v30 setAlignButtonWithCaptionTextLeadingEdge:1];
    id v31 = [(UIActivityContentViewController *)self headerLinkView];
    [v31 _setSizeClassParameters:v30];

    goto LABEL_16;
  }
  id v32 = [(UIActivityContentViewController *)self viewModel];
  int v33 = [v32 showCustomHeaderButton];

  if (v33)
  {
    int v34 = [(UIActivityContentViewController *)self headerLinkView];
    [v34 _setPreferredSizeClass:12];

    id v35 = [(UIActivityContentViewController *)self headerLinkView];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_5;
    v70[3] = &unk_1E5A21998;
    objc_copyWeak(&v71, &location);
    id v36 = [(UIActivityContentViewController *)self viewModel];
    id v37 = [v36 customHeaderButtonTitle];
    [v35 _setAction:v70 withAttributedText:v37 buttonType:1];

    uint64_t v38 = [(UIActivityContentViewController *)self headerLinkView];
    id v39 = [(UIActivityContentViewController *)self viewModel];
    id v40 = [v39 customHeaderButtonColor];
    [v38 _setOverrideActionButtonColor:v40];

    objc_destroyWeak(&v71);
  }
  else
  {
    unint64_t v41 = [(UIActivityContentViewController *)self _headingSizeClass];
    int v42 = [(UIActivityContentViewController *)self headerLinkView];
    [v42 _setPreferredSizeClass:v41];

    os_signpost_id_t v43 = [(UIActivityContentViewController *)self headerLinkView];
    [v43 _setAction:0 withText:&stru_1EF308000];

    unsigned int v44 = [(UIActivityContentViewController *)self headerLinkView];
    [v44 _setOverrideActionButtonColor:0];
  }
LABEL_16:
  objc_destroyWeak(&location);
}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presenter];
  [v1 didSelectCollaborativeAction];

  dispatch_time_t v2 = [WeakRetained viewModel];
  int v3 = [v2 isModeSwitchDisabled];

  if (v3)
  {
    [WeakRetained setHeaderLinkActionsNeedsUpdate:1];
    [WeakRetained _updateHeaderLinkViewAction];
  }
}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presenter];
  [v1 didSelectSendCopyAction];

  dispatch_time_t v2 = [WeakRetained viewModel];
  int v3 = [v2 isModeSwitchDisabled];

  if (v3)
  {
    [WeakRetained setHeaderLinkActionsNeedsUpdate:1];
    [WeakRetained _updateHeaderLinkViewAction];
  }
}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presenter];
  [v1 handleOptions];
}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presenter];
  [v1 handleOptions];
}

void __62__UIActivityContentViewController__updateHeaderLinkViewAction__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presenter];
  [v1 handleCustomHeaderButton];
}

- (unint64_t)_headingSizeClass
{
  int v3 = [(UIActivityContentViewController *)self viewModel];
  if ([v3 showCustomHeaderButton]) {
    goto LABEL_4;
  }
  id v4 = [(UIActivityContentViewController *)self viewModel];
  if ([v4 supportsCollaboration])
  {

LABEL_4:
LABEL_5:
    unint64_t v5 = 12;
    goto LABEL_6;
  }
  int v7 = [(UIActivityContentViewController *)self viewModel];
  char v8 = [v7 showHeaderSpecialization];

  if (v8) {
    goto LABEL_5;
  }
  unint64_t v5 = 2;
LABEL_6:
  if ([(UIActivityContentViewController *)self _canShowOptions]) {
    return 12;
  }
  else {
    return v5;
  }
}

- (void)_updateHeaderLinkViewSizeClass
{
  unint64_t v3 = [(UIActivityContentViewController *)self _headingSizeClass];
  id v4 = [(UIActivityContentViewController *)self headerLinkView];
  [v4 _setPreferredSizeClass:v3];
}

- (void)_updateCustomViewContent
{
  unint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  unint64_t v5 = [(UIActivityContentViewController *)self customViewController];

  if (!v5 || v4 == 1) {
    return;
  }
  id v6 = [(UIActivityContentViewController *)self presentingViewController];
  char v7 = ~[v6 supportedInterfaceOrientations];

  unint64_t v8 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 3;
  BOOL v10 = (v7 & 0x18) == 0 && v8 < 0xFFFFFFFFFFFFFFFELL;
  BOOL v11 = [(UIActivityContentViewController *)self isPresentedInPopover];
  [(UIActivityContentViewController *)self _configureHeaderViewIfNeeded];
  [(UIActivityContentViewController *)self _configureCollectionViewIfNeeded];
  if (v10)
  {
    uint64_t v12 = 1;
    [(UIActivityContentViewController *)self setPhotosLandscapeMode:1];
    char v13 = [(UIActivityContentViewController *)self headerTitleView];
    [v13 setPhotosCarouselMode:1];

    int v14 = [(UIActivityContentViewController *)self cancelButton];
    uint64_t v15 = [(UIActivityContentViewController *)self navigationItem];
    [v15 setLeftBarButtonItem:v14];

    int v16 = [(UIActivityContentViewController *)self nextButton];
    id v17 = [(UIActivityContentViewController *)self navigationItem];
    [v17 setRightBarButtonItem:v16];
  }
  else
  {
    [(UIActivityContentViewController *)self setPhotosLandscapeMode:0];
    id v18 = [(UIActivityContentViewController *)self headerTitleView];
    [v18 setPhotosCarouselMode:0];

    if (v11)
    {
      uint64_t v12 = 2;
      goto LABEL_24;
    }
    BOOL v19 = [(UIActivityContentViewController *)self isCloseButtonOnLeadingEdge];
    if (v19)
    {
      long long v20 = 0;
    }
    else
    {
      long long v20 = [(UIActivityContentViewController *)self closeButton];
    }
    long long v21 = [(UIActivityContentViewController *)self navigationItem];
    [v21 setRightBarButtonItem:v20];

    if (!v19) {
    BOOL v22 = [(UIActivityContentViewController *)self isCloseButtonOnLeadingEdge];
    }
    BOOL v23 = v22;
    if (v22)
    {
      int v16 = [(UIActivityContentViewController *)self closeButton];
    }
    else
    {
      int v16 = 0;
    }
    id v24 = [(UIActivityContentViewController *)self navigationItem];
    [v24 setLeftBarButtonItem:v16];

    uint64_t v12 = 2;
    if (!v23) {
      goto LABEL_24;
    }
  }

LABEL_24:
  id v30 = [MEMORY[0x1E4FB1588] defaultConfiguration];
  [v30 setContentInsetsReference:v12];
  __int16 v25 = [(UIActivityContentViewController *)self activityCollectionView];
  int v26 = [v25 collectionViewLayout];
  [v26 setConfiguration:v30];

  __int16 v27 = [(UIActivityContentViewController *)self dataSource];
  int v28 = [v27 createChangeRequestFromCurrentState];

  [v28 setAnimated:v10];
  objc_msgSend(v28, "setExcludeSectionTypes:", -[UIActivityContentViewController currentSectionTypesToExclude](self, "currentSectionTypesToExclude"));
  BOOL v29 = [(UIActivityContentViewController *)self dataSourceManager];
  [v29 updateWithChangeRequest:v28];
}

- (void)_updateContentWithPeopleProxies:(id)a3 shareProxies:(id)a4 actionProxies:(id)a5 activitiesByUUID:(id)a6 nearbyCountSlotID:(id)a7 animated:(BOOL)a8 reloadData:(BOOL)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  if (self->_didLayout)
  {
    [(UIActivityContentViewController *)self _configureHeaderViewIfNeeded];
    [(UIActivityContentViewController *)self _configureCollectionViewIfNeeded];
    long long v20 = +[SHSheetContentDataSourceChangeRequest changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:](SHSheetContentDataSourceChangeRequest, "changeRequestForPeopleProxies:shareProxies:actionProxies:nearbyCountSlotID:activitiesByUUID:", v15, v16, v17, [v19 unsignedIntValue], v18);
    objc_msgSend(v20, "setExcludeSectionTypes:", -[UIActivityContentViewController currentSectionTypesToExclude](self, "currentSectionTypesToExclude"));
    [v20 setAnimated:v9];
    [v20 setForceReload:a9];
    long long v21 = [(UIActivityContentViewController *)self dataSourceManager];

    if (!v21)
    {
      BOOL v22 = [SHSheetContentDataSourceManager alloc];
      BOOL v23 = [(UIActivityContentViewController *)self applicationActivityTypes];
      id v24 = [(UIActivityContentViewController *)self heroActionActivityTypes];
      __int16 v25 = [(SHSheetContentDataSourceManager *)v22 initWithApplicationActivityTypes:v23 heroActionActivityTypes:v24];
      [(UIActivityContentViewController *)self setDataSourceManager:v25];

      int v26 = [(UIActivityContentViewController *)self dataSourceManager];
      [v26 setDelegate:self];
    }
    __int16 v27 = [(UIActivityContentViewController *)self dataSourceManager];
    [v27 updateWithChangeRequest:v20];
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __149__UIActivityContentViewController__updateContentWithPeopleProxies_shareProxies_actionProxies_activitiesByUUID_nearbyCountSlotID_animated_reloadData___block_invoke;
    v28[3] = &unk_1E5A224F0;
    objc_copyWeak(&v34, &location);
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v19;
    BOOL v35 = v9;
    BOOL v36 = a9;
    [(UIActivityContentViewController *)self setPendingUpdate:v28];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
}

void __149__UIActivityContentViewController__updateContentWithPeopleProxies_shareProxies_actionProxies_activitiesByUUID_nearbyCountSlotID_animated_reloadData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  LOBYTE(v2) = *(unsigned char *)(a1 + 81);
  [WeakRetained _updateContentWithPeopleProxies:*(void *)(a1 + 32) shareProxies:*(void *)(a1 + 40) actionProxies:*(void *)(a1 + 48) activitiesByUUID:*(void *)(a1 + 56) nearbyCountSlotID:*(void *)(a1 + 64) animated:*(unsigned __int8 *)(a1 + 80) reloadData:v2];
}

- (BOOL)_canShowOptions
{
  unint64_t v3 = [(UIActivityContentViewController *)self viewModel];
  if ([v3 showOptions])
  {
    uint64_t v4 = [(UIActivityContentViewController *)self heroActionActivityTypes];
    if ([v4 count])
    {
      unint64_t v5 = [(UIActivityContentViewController *)self viewModel];
      char v6 = [v5 isSharingExpanded];
    }
    else
    {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)runScrollingTestWithName:(id)a3 type:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (void (**)(void))a5;
  if ([(objc_class *)getRPTTestRunnerClass() isRecapAvailable])
  {
    BOOL v10 = [(UIActivityContentViewController *)self _scrollViewForScrollingType:a4];
    BOOL v11 = share_sheet_log();
    uint64_t v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v8;
        __int16 v22 = 2112;
        BOOL v23 = v10;
        _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "run scrolling test with name:%@ scrollview:%@", buf, 0x16u);
      }

      id v13 = objc_alloc(getRPTScrollViewTestParametersClass());
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __83__UIActivityContentViewController_runScrollingTestWithName_type_completionHandler___block_invoke;
      v16[3] = &unk_1E5A21D20;
      id v17 = v8;
      id v18 = v10;
      id v19 = v9;
      int v14 = (void *)[v13 initWithTestName:v17 scrollView:v18 completionHandler:v16];
      [v14 setPreventSheetDismissal:1];
      [v14 setShouldFlick:0];
      [(objc_class *)getRPTTestRunnerClass() runTestWithParameters:v14];
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[UIActivityContentViewController runScrollingTestWithName:type:completionHandler:]();
      }

      v9[2](v9);
    }
  }
  else
  {
    id v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[UIActivityContentViewController runScrollingTestWithName:type:completionHandler:]();
    }

    v9[2](v9);
  }
}

uint64_t __83__UIActivityContentViewController_runScrollingTestWithName_type_completionHandler___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "did complete scrolling test for name:%@ scrollview:%@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (id)_scrollViewForScrollingType:(int64_t)a3
{
  unint64_t v5 = [(UIActivityContentViewController *)self activityCollectionView];
  int v6 = v5;
  if (a3)
  {
    if (a3 == 3)
    {
      uint64_t v7 = [(UIActivityContentViewController *)self customViewController];
      __int16 v8 = [v7 view];

      uint64_t v9 = SHSheetContentHelperFindScrollView(v8);
      int v6 = v8;
LABEL_6:
      uint64_t v11 = [v9 firstObject];
LABEL_7:
      uint64_t v12 = (void *)v11;
LABEL_11:

      int v6 = v12;
      goto LABEL_12;
    }
    uint64_t v10 = SHSheetContentHelperFindScrollView(v5);
    uint64_t v9 = v10;
    if (a3 == 2)
    {
      if ((unint64_t)[v10 count] >= 2)
      {
        uint64_t v11 = [v9 objectAtIndexedSubscript:1];
        goto LABEL_7;
      }
    }
    else if (a3 == 1)
    {
      goto LABEL_6;
    }
    uint64_t v12 = 0;
    goto LABEL_11;
  }
LABEL_12:
  return v6;
}

- (UIActivityContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIActivityContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSheetContentPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SHSheetContentPresenter *)WeakRetained;
}

- (void)setPresenter:(id)a3
{
}

- (BOOL)canRenderPeople
{
  return self->_canRenderPeople;
}

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (BOOL)hideHeaderView
{
  return self->_hideHeaderView;
}

- (BOOL)hideNavigationBar
{
  return self->_hideNavigationBar;
}

- (BOOL)sharingExpanded
{
  return self->_sharingExpanded;
}

- (NSString)topContentSectionText
{
  return self->_topContentSectionText;
}

- (NSArray)applicationActivityTypes
{
  return self->_applicationActivityTypes;
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (void)setIsRemote:(BOOL)a3
{
  self->_isRemote = a3;
}

- (BSAuditToken)hostAuditToken
{
  return self->_hostAuditToken;
}

- (void)setHostAuditToken:(id)a3
{
}

- (NSNumber)hostPresentationStyle
{
  return self->_hostPresentationStyle;
}

- (SHSheetContentViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  return self->_layoutSpec;
}

- (SHSheetContentLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (_UIActivityCollectionViewCompositionalLayout)activityCollectionViewLayout
{
  return self->_activityCollectionViewLayout;
}

- (SHSheetContentDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
}

- (void)setCurrentSectionTypesToExclude:(int64_t)a3
{
  self->_currentSectionTypesToExclude = a3;
}

- (_UIActivityContentCollectionView)activityCollectionView
{
  return self->_activityCollectionView;
}

- (void)setActivityCollectionView:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (SFAirDropTransferChange)activeAirDropTransferChange
{
  return self->_activeAirDropTransferChange;
}

- (void)setActiveAirDropTransferChange:(id)a3
{
}

- (LPLinkView)headerLinkView
{
  return self->_headerLinkView;
}

- (void)setHeaderLinkView:(id)a3
{
}

- (_UIActivityContentTitleView)headerTitleView
{
  return self->_headerTitleView;
}

- (void)setHeaderTitleView:(id)a3
{
}

- (void)setCancelButton:(id)a3
{
}

- (void)setNextButton:(id)a3
{
}

- (UIBarButtonItem)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (BOOL)isCloseButtonOnLeadingEdge
{
  return self->_isCloseButtonOnLeadingEdge;
}

- (void)setIsCloseButtonOnLeadingEdge:(BOOL)a3
{
  self->_isCloseButtonOnLeadingEdge = a3;
}

- (BOOL)headerLinkActionsNeedsUpdate
{
  return self->_headerLinkActionsNeedsUpdate;
}

- (void)setHeaderLinkActionsNeedsUpdate:(BOOL)a3
{
  self->_headerLinkActionsNeedsUpdate = a3;
}

- (SFUIPeopleSuggestionImageProvider)peopleSuggestionImageProvider
{
  return self->_peopleSuggestionImageProvider;
}

- (NSMutableDictionary)identifiersToPeopleSuggestionImageRequestIDs
{
  return self->_identifiersToPeopleSuggestionImageRequestIDs;
}

- (SFUIActivityImageProvider)activityImageProvider
{
  return self->_activityImageProvider;
}

- (NSMutableDictionary)identifiersToActivityImageRequestID
{
  return self->_identifiersToActivityImageRequestID;
}

- (BOOL)photosLandscapeMode
{
  return self->_photosLandscapeMode;
}

- (void)setPhotosLandscapeMode:(BOOL)a3
{
  self->_photosLandscapeMode = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (BOOL)ignorePersonTap
{
  return self->_ignorePersonTap;
}

- (void)setIgnorePersonTap:(BOOL)a3
{
  self->_ignorePersonTap = a3;
}

- (NSMutableSet)sandboxExtensionHandles
{
  return self->_sandboxExtensionHandles;
}

- (id)pendingUpdate
{
  return self->_pendingUpdate;
}

- (void)setPendingUpdate:(id)a3
{
}

- (UIActivity)pulsingActivity
{
  return self->_pulsingActivity;
}

- (void)setPulsingActivity:(id)a3
{
}

- (NSString)pulsingLocalizedTitle
{
  return self->_pulsingLocalizedTitle;
}

- (void)setPulsingLocalizedTitle:(id)a3
{
}

- (NSUUID)pulsingActivityIdentifier
{
  return self->_pulsingActivityIdentifier;
}

- (void)setPulsingActivityIdentifier:(id)a3
{
}

- (SLCollaborationFooterViewModel)collaborationFooterViewModel
{
  return self->_collaborationFooterViewModel;
}

- (void)setCollaborationFooterViewModel:(id)a3
{
}

- (BOOL)canShowShareOptions
{
  return self->_canShowShareOptions;
}

- (void)setCanShowShareOptions:(BOOL)a3
{
  self->_canShowShareOptions = a3;
}

- (BSInvalidatable)homeScreenIconStyleObserver
{
  return self->_homeScreenIconStyleObserver;
}

- (void)setHomeScreenIconStyleObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenIconStyleObserver, 0);
  objc_storeStrong((id *)&self->_collaborationFooterViewModel, 0);
  objc_storeStrong((id *)&self->_pulsingActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_pulsingLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_pulsingActivity, 0);
  objc_storeStrong(&self->_pendingUpdate, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_identifiersToActivityImageRequestID, 0);
  objc_storeStrong((id *)&self->_activityImageProvider, 0);
  objc_storeStrong((id *)&self->_identifiersToPeopleSuggestionImageRequestIDs, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionImageProvider, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_headerTitleView, 0);
  objc_storeStrong((id *)&self->_headerLinkView, 0);
  objc_storeStrong((id *)&self->_activeAirDropTransferChange, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_activityCollectionView, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_activityCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_layoutSpec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_hostPresentationStyle, 0);
  objc_storeStrong((id *)&self->_hostAuditToken, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_applicationActivityTypes, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_configureAirDropCell:withChange:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_FAULT, "update AirDrop progress for cell:%@ without top/bottom text.", v1, 0xCu);
}

- (void)_configureSharingAppCell:itemIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_ERROR, "No activity or bundle idenfifier for proxy:%@", v1, 0xCu);
}

- (void)_provideCellForCollectionView:indexPath:itemIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_DEBUG, "_provideCellForCollectionView at indexPath:%@ with itemIdentifier: %@", v1, 0x16u);
}

- (void)collectionView:willEndContextMenuInteractionWithConfiguration:animator:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_FAULT, "No item identifier found at indexPath:%@", v1, 0xCu);
}

- (void)_contextMenuPreviewForCollectionView:collectionViewCell:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_FAULT, "No item identifier found for cell:%@ at indexPath:%@", v1, 0x16u);
}

- (void)didUpdateAirDropTransferWithChange:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a1 identifier];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A0AD8000, a3, OS_LOG_TYPE_ERROR, "AirDrop cell identifier:%@ mismatches update proxy identifier:%@", (uint8_t *)&v6, 0x16u);
}

- (void)runScrollingTestWithName:type:completionHandler:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A0AD8000, v1, OS_LOG_TYPE_ERROR, "run scrolling test with name:%@ failed to retrieve scrollview for type:%ld", v2, 0x16u);
}

- (void)runScrollingTestWithName:type:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A0AD8000, v0, OS_LOG_TYPE_ERROR, "run scrolling test with name:%@ failed because recap framework is not available", v1, 0xCu);
}

@end