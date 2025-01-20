@interface SHSheetSession
- (BOOL)_isHeroCollaborationOnly;
- (BOOL)activitiesManager:(id)a3 shouldShowSystemActivityType:(id)a4;
- (BOOL)activityItemsManager:(id)a3 collaborationSupportsPromiseURLsForActivity:(id)a4;
- (BOOL)allowsEmbedding;
- (BOOL)canPerformSharePlay;
- (BOOL)configureForCloudSharing;
- (BOOL)configureForPhotosEdit;
- (BOOL)didExpand;
- (BOOL)hideHeaderView;
- (BOOL)hideNavigationBar;
- (BOOL)hideSuggestions;
- (BOOL)instantShareSheet;
- (BOOL)isAirdropOnly;
- (BOOL)isCollaborationRestricted;
- (BOOL)isCollaborative;
- (BOOL)isContentManaged;
- (BOOL)isExpanded;
- (BOOL)isModeSwitchDisabled;
- (BOOL)shouldSkipPeopleSuggestions;
- (BOOL)shouldSuggestFamilyMembers;
- (BOOL)showCustomScene;
- (BOOL)showHeaderSpecialization;
- (BOOL)showHeroActionsHorizontally;
- (BOOL)showKeyboardAutomatically;
- (BOOL)showOptions;
- (BOOL)showSharePlayProminently;
- (BOOL)supportsCollaboration;
- (BOOL)supportsSendCopy;
- (BOOL)useRemoteUIService;
- (BOOL)whitelistActionActivitiesOnly;
- (LPLinkMetadata)photosHeaderMetadata;
- (NSArray)activityTypeOrder;
- (NSArray)activityTypesToCreateInShareService;
- (NSArray)collaborationURLRequests;
- (NSArray)customizationGroups;
- (NSArray)excludedActivityTypes;
- (NSArray)heroActionActivityTypes;
- (NSArray)includedActivityTypes;
- (NSArray)peopleSuggestionBundleIds;
- (NSArray)selectedAssetIdentifiers;
- (NSString)customOptionsTitle;
- (NSString)identifier;
- (NSString)topContentSectionText;
- (SFCollaborationItem)collaborationItem;
- (SFCollaborationItemsProvider)collaborationItemsProvider;
- (SFPeopleSuggestion)currentPeopleSuggestion;
- (SFUILoadedMetadataCollection)metadataCollection;
- (SHSheetActivitiesManager)activitiesManager;
- (SHSheetActivityItemsManager)activityItemsManager;
- (SHSheetSession)initWithContext:(id)a3 delegate:(id)a4;
- (SHSheetSessionDelegate)delegate;
- (UIActivity)performingActivity;
- (UIActivityCollaborationModeRestriction)collaborationModeRestriction;
- (UIActivityViewController)activityViewController;
- (UIActivityViewControllerObjectManipulationDelegate)objectManipulationDelegate;
- (UISDShareSheetSessionConfiguration)configuration;
- (UIViewController)customOptionsViewController;
- (_SHSheetScene)remoteScene;
- (id)_collaborationService;
- (id)_configurationForActivity:(id)a3 forRemoteUIService:(BOOL)a4;
- (id)_createActivityMatchingContext;
- (id)_metadataValues;
- (id)activityConfigurationsForActivities:(id)a3 forRemoteUIService:(BOOL)a4;
- (id)activityItemsManager:(id)a3 collaborationActivityItemValuesForActivityItemValue:(id)a4 activity:(id)a5;
- (id)activityItemsManager:(id)a3 subjectForActivity:(id)a4;
- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4;
- (id)collaborationPlaceholderActivityItemsForActivityItemsManager:(id)a3;
- (id)createClientContext;
- (id)createContentContext;
- (id)createDiscoveryContext;
- (id)createShareServiceUIConfiguration;
- (id)urlRequestsForActivityItemsManager:(id)a3;
- (int64_t)excludedActivityCategories;
- (int64_t)numberOfVisibleActionActivities;
- (int64_t)numberOfVisibleSharingActivities;
- (int64_t)sharingStyle;
- (unint64_t)xrRenderingMode;
- (void)_configureWithContext:(id)a3;
- (void)_updateObjectManipulationSupport;
- (void)activityItemsManagerLinkMetadataValuesDidChange:(id)a3;
- (void)metadataCollection:(id)a3 didChangeMetadata:(id)a4;
- (void)metadataCollectionDidFinishLoading:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4;
- (void)setActivitiesManager:(id)a3;
- (void)setActivityItemsManager:(id)a3;
- (void)setActivityTypeOrder:(id)a3;
- (void)setActivityTypesToCreateInShareService:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setAllowsEmbedding:(BOOL)a3;
- (void)setCanPerformSharePlay:(BOOL)a3;
- (void)setCollaborationItem:(id)a3;
- (void)setCollaborationItemsProvider:(id)a3;
- (void)setCollaborationModeRestriction:(id)a3;
- (void)setCollaborationURLRequests:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigureForCloudSharing:(BOOL)a3;
- (void)setConfigureForPhotosEdit:(BOOL)a3;
- (void)setCurrentPeopleSuggestion:(id)a3;
- (void)setCustomizationGroups:(id)a3;
- (void)setDidExpand:(BOOL)a3;
- (void)setExcludedActivityCategories:(int64_t)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setHeroActionActivityTypes:(id)a3;
- (void)setHideHeaderView:(BOOL)a3;
- (void)setHideNavigationBar:(BOOL)a3;
- (void)setHideSuggestions:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIncludedActivityTypes:(id)a3;
- (void)setInstantShareSheet:(BOOL)a3;
- (void)setIsAirdropOnly:(BOOL)a3;
- (void)setIsCollaborative:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setMetadataCollection:(id)a3;
- (void)setObjectManipulationDelegate:(id)a3;
- (void)setPeopleSuggestionBundleIds:(id)a3;
- (void)setPerformingActivity:(id)a3;
- (void)setPhotosHeaderMetadata:(id)a3;
- (void)setRemoteScene:(id)a3;
- (void)setSelectedAssetIdentifiers:(id)a3;
- (void)setSharingStyle:(int64_t)a3;
- (void)setShouldSkipPeopleSuggestions:(BOOL)a3;
- (void)setShouldSuggestFamilyMembers:(BOOL)a3;
- (void)setShowCustomScene:(BOOL)a3;
- (void)setShowHeroActionsHorizontally:(BOOL)a3;
- (void)setShowKeyboardAutomatically:(BOOL)a3;
- (void)setShowOptions:(BOOL)a3;
- (void)setShowSharePlayProminently:(BOOL)a3;
- (void)setTopContentSectionText:(id)a3;
- (void)setUseRemoteUIService:(BOOL)a3;
- (void)setWhitelistActionActivitiesOnly:(BOOL)a3;
- (void)setXrRenderingMode:(unint64_t)a3;
- (void)supportsCollaboration;
- (void)supportsSendCopy;
- (void)updateWithContext:(id)a3;
@end

@implementation SHSheetSession

- (SHSheetSession)initWithContext:(id)a3 delegate:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SHSheetSession;
  v8 = [(SHSheetSession *)&v20 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
    v10 = [v9 UUIDString];
    uint64_t v11 = objc_msgSend(v10, "substringWithRange:", 24, 12);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v11;

    v8->_canPerformSharePlay = +[UISharePlayActivity _canPerform];
    v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      if (v8->_canPerformSharePlay) {
        v14 = "yes";
      }
      else {
        v14 = "no";
      }
      *(_DWORD *)buf = 136315138;
      v22 = v14;
      _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "SharePlay: App supports SharePlay: %s", buf, 0xCu);
    }

    objc_storeWeak((id *)&v8->_delegate, v7);
    [(SHSheetSession *)v8 updateWithContext:v6];
    if ([(SHSheetSession *)v8 useRemoteUIService])
    {
      int v15 = _ShareSheetPrefersModernRemoteScene();
      v16 = off_1E5A20B80;
      if (!v15) {
        v16 = off_1E5A20BB8;
      }
      uint64_t v17 = [objc_alloc(*v16) initWithSession:v8];
      remoteScene = v8->_remoteScene;
      v8->_remoteScene = (_SHSheetScene *)v17;
    }
  }

  return v8;
}

- (SFCollaborationItem)collaborationItem
{
  if ([(SHSheetSession *)self isCollaborationRestricted])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(SHSheetSession *)self collaborationItemsProvider];
    v5 = [v4 collaborationItems];
    v3 = [v5 firstObject];
  }
  return (SFCollaborationItem *)v3;
}

- (BOOL)supportsCollaboration
{
  if ([(SHSheetSession *)self isCollaborationRestricted])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = [(SHSheetSession *)self collaborationItemsProvider];
    LODWORD(v3) = [v4 supportsCollaboration];

    v5 = [(SHSheetSession *)self collaborationItemsProvider];
    int v6 = [v5 supportsSendCopy];

    id v7 = [(SHSheetSession *)self collaborationModeRestriction];
    if (v7)
    {
      v8 = [(SHSheetSession *)self collaborationModeRestriction];
      if ([v8 disabledMode] == 1)
      {
        v9 = [(SHSheetSession *)self collaborationModeRestriction];
        v10 = [v9 alertTitle];
        BOOL v11 = v10 != 0;
      }
      else
      {
        BOOL v11 = 1;
      }

      if ((v3 ^ 1 | v11 | v6))
      {
        LOBYTE(v3) = v3 & v11;
      }
      else
      {
        uint64_t v3 = share_sheet_log();
        if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR)) {
          -[SHSheetSession supportsCollaboration]((os_log_t)v3);
        }

        LOBYTE(v3) = 1;
      }
    }
    else
    {
    }
  }
  return v3;
}

- (BOOL)isCollaborationRestricted
{
  uint64_t v3 = [(SHSheetSession *)self collaborationItemsProvider];
  v4 = [v3 collaborationItems];
  v5 = [v4 firstObject];
  if ([v5 type] == 2)
  {
    int v6 = [(SHSheetSession *)self configuration];
    id v7 = [v6 restrictedActivityTypes];
    char v8 = [v7 containsObject:@"com.apple.Collaboration.Internal"];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)supportsSendCopy
{
  v5 = [(SHSheetSession *)self collaborationItemsProvider];
  int v3 = [v5 supportsCollaboration];

  v4 = [(SHSheetSession *)self collaborationItemsProvider];
  LODWORD(v5) = [v4 supportsSendCopy];

  int v6 = [(SHSheetSession *)self collaborationModeRestriction];
  if (v6)
  {
    id v7 = [(SHSheetSession *)self collaborationModeRestriction];
    if ([v7 disabledMode])
    {
      BOOL v8 = 1;
    }
    else
    {
      v9 = [(SHSheetSession *)self collaborationModeRestriction];
      v10 = [v9 alertTitle];
      BOOL v8 = v10 != 0;
    }
    if ((v5 ^ 1 | v8 | v3))
    {
      LOBYTE(v5) = v5 & v8;
    }
    else
    {
      v5 = share_sheet_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SHSheetSession supportsSendCopy](v5);
      }

      LOBYTE(v5) = 1;
    }
  }
  else
  {
  }
  return (char)v5;
}

- (void)setIsCollaborative:(BOOL)a3
{
  if (self->_isCollaborative != a3)
  {
    self->_isCollaborative = a3;
    v4 = [(SHSheetSession *)self activityItemsManager];
    [v4 invalidateCache];

    id v5 = [(SHSheetSession *)self delegate];
    [v5 isCollaborativeDidChangeForSession:self];
  }
}

- (id)_collaborationService
{
  int v3 = [(SHSheetSession *)self delegate];
  v4 = [v3 collaborationServiceForSession:self];

  return v4;
}

- (id)collaborationItemsProvider:(id)a3 resolveActivityItem:(id)a4
{
  id v5 = a4;
  int v6 = [(SHSheetSession *)self activityViewController];
  id v7 = +[SHSheetActivityItemsManager placeholderActivityItemValuesForActivityItem:v5 activityViewController:v6];

  return v7;
}

- (void)updateWithContext:(id)a3
{
  [(SHSheetSession *)self _configureWithContext:a3];
  [(SHSheetSession *)self _updateObjectManipulationSupport];
  id v5 = [(SHSheetSession *)self _createActivityMatchingContext];
  v4 = [(SHSheetSession *)self activitiesManager];
  [v4 updateActivitiesWithContext:v5];
}

- (void)_configureWithContext:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 activityViewController];
  objc_storeWeak((id *)&self->_activityViewController, v5);

  int v6 = [v4 activityItems];
  id v7 = [v4 collaborationModeRestriction];
  collaborationModeRestriction = self->_collaborationModeRestriction;
  self->_collaborationModeRestriction = v7;

  if (dyld_program_sdk_at_least())
  {
    v9 = [(SHSheetSession *)self collaborationItemsProvider];
    if (!v9) {
      goto LABEL_4;
    }
    v10 = [(SHSheetSession *)self collaborationItemsProvider];
    BOOL v11 = [v10 activityItems];
    v12 = [v4 activityItems];
    char v13 = [v11 isEqualToArray:v12];

    if ((v13 & 1) == 0)
    {
LABEL_4:
      [(SHSheetSession *)self setCollaborationURLRequests:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
      int v15 = [WeakRetained collaborationDelegate];

      id v16 = objc_alloc(MEMORY[0x1E4F9F6A8]);
      uint64_t v17 = [v4 activityItems];
      v18 = [v4 managedFileURL];
      v19 = (void *)[v16 initWithActivityItems:v17 delegate:self managedFileURL:v18 isURLProviderSupported:v15 != 0];

      [(SHSheetSession *)self setCollaborationItemsProvider:v19];
      if ([(SHSheetSession *)self supportsCollaboration])
      {
        objc_super v20 = [(SHSheetSession *)self collaborationItem];
        [v20 registerChangeObserver:self];

        BOOL v21 = [(SHSheetSession *)self supportsSendCopy];
        v22 = [(SHSheetSession *)self collaborationModeRestriction];
        uint64_t v23 = [v22 alertTitle];

        if (v23)
        {
          if (v21)
          {
            v24 = [(SHSheetSession *)self collaborationModeRestriction];
            -[SHSheetSession setIsCollaborative:](self, "setIsCollaborative:", [v24 disabledMode] == 0);
          }
          else
          {
            [(SHSheetSession *)self setIsCollaborative:1];
          }
        }
        else
        {
          v25 = [(SHSheetSession *)self collaborationItem];
          LODWORD(v82) = [v25 defaultCollaboration];

          v26 = [(SHSheetSession *)self collaborationItem];
          uint64_t v27 = [v26 type];

          if (v27)
          {
            HIDWORD(v82) = 0;
          }
          else
          {
            v28 = [(SHSheetSession *)self collaborationItem];
            HIDWORD(v82) = [v28 isiCloudDrive] ^ 1;
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v87 = __Block_byref_object_copy__5;
          *(void *)&long long v88 = __Block_byref_object_dispose__5;
          *((void *)&v88 + 1) = 0;
          v29 = [(SHSheetSession *)self _collaborationService];
          v30 = [(SHSheetSession *)self collaborationItem];
          v31 = [v30 contentIdentifier];
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __40__SHSheetSession__configureWithContext___block_invoke;
          v85[3] = &unk_1E5A23630;
          v85[4] = buf;
          [v29 requestCollaborativeModeForContentIdentifier:v31 completionHandler:v85];

          if (v84)
          {
            unsigned int v32 = 0;
          }
          else
          {
            v33 = *(void **)(*(void *)&buf[8] + 40);
            if (v33) {
              unsigned int v32 = [v33 BOOLValue];
            }
            else {
              unsigned int v32 = v83;
            }
          }
          [(SHSheetSession *)self setIsCollaborative:!v21 | v32];
          _Block_object_dispose(buf, 8);
        }
      }
    }
  }
  activityItemsManager = self->_activityItemsManager;
  if (!activityItemsManager
    || ([(SHSheetActivityItemsManager *)activityItemsManager activityItems],
        v35 = objc_claimAutoreleasedReturnValue(),
        char v36 = [v6 isEqualToArray:v35],
        v35,
        (v36 & 1) == 0))
  {
    [(SHSheetSession *)self setCollaborationURLRequests:0];
    v37 = [SHSheetActivityItemsManager alloc];
    id v38 = objc_loadWeakRetained((id *)&self->_activityViewController);
    if ([(SHSheetSession *)self supportsCollaboration]) {
      v39 = self;
    }
    else {
      v39 = 0;
    }
    v40 = [(SHSheetActivityItemsManager *)v37 initWithActivityItems:v6 activityViewController:v38 delegate:self collaborationDelegate:v39];

    v41 = self->_activityItemsManager;
    self->_activityItemsManager = v40;
  }
  if (!self->_activitiesManager
    || ([v4 applicationActivities],
        v42 = objc_claimAutoreleasedReturnValue(),
        [(SHSheetActivitiesManager *)self->_activitiesManager applicationActivities],
        v43 = objc_claimAutoreleasedReturnValue(),
        char v44 = [v42 isEqualToArray:v43],
        v43,
        v42,
        (v44 & 1) == 0))
  {
    v45 = [SHSheetActivitiesManager alloc];
    identifier = self->_identifier;
    v47 = [v4 applicationActivities];
    v48 = [(SHSheetActivitiesManager *)v45 initWithSessionIdentifier:identifier applicationActivities:v47];
    activitiesManager = self->_activitiesManager;
    self->_activitiesManager = v48;

    [(SHSheetActivitiesManager *)self->_activitiesManager setDelegate:self];
  }
  v50 = [v4 activityTypesToCreateInShareService];
  activityTypesToCreateInShareService = self->_activityTypesToCreateInShareService;
  self->_activityTypesToCreateInShareService = v50;

  v52 = [v4 includedActivityTypes];
  includedActivityTypes = self->_includedActivityTypes;
  self->_includedActivityTypes = v52;

  v54 = [v4 excludedActivityTypes];
  excludedActivityTypes = self->_excludedActivityTypes;
  self->_excludedActivityTypes = v54;

  v56 = [v4 activityTypeOrder];
  activityTypeOrder = self->_activityTypeOrder;
  self->_activityTypeOrder = v56;

  v58 = [v4 heroActionActivityTypes];
  heroActionActivityTypes = self->_heroActionActivityTypes;
  self->_heroActionActivityTypes = v58;

  self->_showHeroActionsHorizontally = [v4 showHeroActionsHorizontally];
  self->_excludedActivityCategories = [v4 excludedActivityCategories];
  self->_allowsEmbedding = [v4 allowsEmbedding];
  self->_shouldSuggestFamilyMembers = [v4 shouldSuggestFamilyMembers];
  BOOL canPerformSharePlay = self->_canPerformSharePlay;
  if (canPerformSharePlay)
  {
    if ([v4 allowsProminentActivity]) {
      BOOL canPerformSharePlay = ![(NSArray *)self->_excludedActivityTypes containsObject:@"com.apple.UIKit.activity.SharePlay"];
    }
    else {
      BOOL canPerformSharePlay = 0;
    }
  }
  self->_showSharePlayProminently = canPerformSharePlay;
  v61 = share_sheet_log();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    if (self->_showSharePlayProminently) {
      v78 = "yes";
    }
    else {
      v78 = "no";
    }
    if (self->_canPerformSharePlay) {
      v79 = "yes";
    }
    else {
      v79 = "no";
    }
    if ([v4 allowsProminentActivity]) {
      v80 = "yes";
    }
    else {
      v80 = "no";
    }
    if ([(NSArray *)self->_excludedActivityTypes containsObject:@"com.apple.UIKit.activity.SharePlay"])
    {
      v81 = "no";
    }
    else
    {
      v81 = "yes";
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v78;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v79;
    *(_WORD *)&buf[22] = 2080;
    v87 = (uint64_t (*)(uint64_t, uint64_t))v80;
    LOWORD(v88) = 2080;
    *(void *)((char *)&v88 + 2) = v81;
    _os_log_debug_impl(&dword_1A0AD8000, v61, OS_LOG_TYPE_DEBUG, "SharePlay: Setting showSharePlayProminently to %s: canPerformSharePlay (%s) && allowsProminentActivity (%s) && excludedActivityTypes does not contain SharePlay (%s)", buf, 0x2Au);
  }

  self->_showKeyboardAutomatically = [v4 showKeyboardAutomatically];
  self->_whitelistActionActivitiesOnly = [v4 whitelistActionActivitiesOnly];
  self->_isContentManaged = [v4 isContentManaged];
  self->_sharingStyle = [v4 sharingStyle];
  v62 = [v4 includedActivityTypes];
  if ([v62 containsObject:@"com.apple.UIKit.activity.AirDrop"])
  {
    v63 = [v4 includedActivityTypes];
    self->_isAirdropOnly = [v63 count] == 1;
  }
  else
  {
    self->_isAirdropOnly = 0;
  }

  v64 = [v4 photosHeaderMetadata];
  photosHeaderMetadata = self->_photosHeaderMetadata;
  self->_photosHeaderMetadata = v64;

  v66 = [v4 objectManipulationDelegate];
  objc_storeWeak((id *)&self->_objectManipulationDelegate, v66);

  self->_configureForCloudSharing = [v4 configureForCloudSharing];
  self->_configureForPhotosEdit = [v4 configureForPhotosEdit];
  self->_hideHeaderView = [v4 hideHeaderView];
  self->_hideNavigationBar = [v4 hideNavigationBar];
  self->_hideSuggestions = [v4 hideSuggestions];
  v67 = [v4 topContentSectionText];
  topContentSectionText = self->_topContentSectionText;
  self->_topContentSectionText = v67;

  self->_instantShareSheet = [v4 instantShareSheet];
  v69 = [v4 selectedAssetIdentifiers];
  selectedAssetIdentifiers = self->_selectedAssetIdentifiers;
  self->_selectedAssetIdentifiers = v69;

  self->_useRemoteUIService = [v4 useRemoteUIService];
  self->_showCustomScene = [v4 showCustomScene];
  v71 = [v4 peopleSuggestionBundleIds];
  v72 = (NSArray *)[v71 copy];
  peopleSuggestionBundleIds = self->_peopleSuggestionBundleIds;
  self->_peopleSuggestionBundleIds = v72;

  id v74 = objc_alloc(getSFUILoadedMetadataCollectionClass());
  v75 = [(SHSheetSession *)self _metadataValues];
  v76 = (SFUILoadedMetadataCollection *)[v74 initWithMetadatas:v75];
  metadataCollection = self->_metadataCollection;
  self->_metadataCollection = v76;

  [(SFUILoadedMetadataCollection *)self->_metadataCollection setDelegate:self];
  self->_xrRenderingMode = [v4 xrRenderingMode];
}

void __40__SHSheetSession__configureWithContext___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_updateObjectManipulationSupport
{
  BOOL showOptions = self->_showOptions;
  p_objectManipulationDelegate = &self->_objectManipulationDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectManipulationDelegate);
  self->_objectManipulationDelegateFlags.respondsToCustomizationAvailable = objc_opt_respondsToSelector() & 1;

  id v6 = objc_loadWeakRetained((id *)p_objectManipulationDelegate);
  self->_objectManipulationDelegateFlags.respondsToCustomLocalizedActionTitle = objc_opt_respondsToSelector() & 1;

  id v7 = objc_loadWeakRetained((id *)p_objectManipulationDelegate);
  self->_objectManipulationDelegateFlags.respondsToCustomActionViewController = objc_opt_respondsToSelector() & 1;

  if (self->_objectManipulationDelegateFlags.respondsToCustomizationAvailable)
  {
    BOOL v8 = [(SHSheetSession *)self objectManipulationDelegate];
    id v9 = objc_loadWeakRetained((id *)&self->_activityViewController);
    self->_BOOL showOptions = [v8 _customizationAvailableForActivityViewController:v9];
  }
  else
  {
    id v10 = objc_loadWeakRetained((id *)p_objectManipulationDelegate);

    if (!v10) {
      goto LABEL_6;
    }
    BOOL v8 = [(SHSheetSession *)self customizationGroups];
    self->_BOOL showOptions = [v8 count] != 0;
  }

LABEL_6:
  if (showOptions != self->_showOptions)
  {
    id v11 = [(SHSheetSession *)self delegate];
    [v11 showOptionsDidChangeForSession:self];
  }
}

- (id)createDiscoveryContext
{
  v2 = [(SHSheetSession *)self activityItemsManager];
  int v3 = [v2 activityItemValuesForActivity:0];

  id v4 = _NSExtensionItemsFromActivityItemValues(v3);
  id v5 = objc_alloc_init(_UIActivityDiscoveryContext);
  id v6 = +[_UIActivityApplicationExtensionDiscovery extensionMatchingDictionariesForExtensionItems:v4];
  [(_UIActivityDiscoveryContext *)v5 setActivityItemValueExtensionMatchingDictionaries:v6];

  return v5;
}

- (id)_createActivityMatchingContext
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v3 = [(SHSheetSession *)self activityItemsManager];
  id v4 = [v3 activityItemValuesForActivity:0];

  if ([(SHSheetSession *)self isCollaborative])
  {
    id v5 = [(SHSheetSession *)self collaborationItemsProvider];
    id v6 = [v5 collaborationItems];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = [(SHSheetSession *)self excludedActivityTypes];
  if ([(SHSheetSession *)self supportsCollaboration]
    && ![(SHSheetSession *)self supportsSendCopy])
  {
    BOOL v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "Excluding AirDrop for collaboration only mode", buf, 2u);
    }

    if (v7)
    {
      uint64_t v9 = [v7 mutableCopy];

      id v7 = (void *)v9;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA48] array];
    }
    [v7 addObject:@"com.apple.UIKit.activity.AirDrop"];
  }
  if ([v7 count])
  {
    id v10 = share_sheet_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v7 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Excluded activity types (%@)", buf, 0xCu);
    }
  }
  v12 = [(SHSheetSession *)self includedActivityTypes];
  int64_t v13 = [(SHSheetSession *)self excludedActivityCategories];
  if ([(SHSheetSession *)self _isHeroCollaborationOnly])
  {
    v28 = @"com.apple.UIKit.activity.Message";
    int64_t v13 = 1;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];

    v12 = (void *)v14;
  }
  int v15 = [(SHSheetSession *)self collaborationModeRestriction];
  if (v15)
  {
    id v16 = [(SHSheetSession *)self collaborationModeRestriction];
    if ([v16 disabledMode] == 1)
    {
      uint64_t v17 = [(SHSheetSession *)self collaborationModeRestriction];
      v18 = [v17 alertTitle];
      BOOL v19 = v18 == 0;
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  objc_super v20 = [_UIActivityMatchingContext alloc];
  BOOL v21 = [(SHSheetSession *)self activityItemsManager];
  v22 = [v21 activityItems];
  uint64_t v23 = [(_UIActivityMatchingContext *)v20 initWithActivityItems:v22 itemValues:v4 collaborationItems:v6];

  [(_UIActivityMatchingContext *)v23 setIsContentManaged:[(SHSheetSession *)self isContentManaged]];
  [(_UIActivityMatchingContext *)v23 setIsCollaborative:[(SHSheetSession *)self isCollaborative]];
  [(_UIActivityMatchingContext *)v23 setShouldMatchOnlyUserElectedExtensions:1];
  [(_UIActivityMatchingContext *)v23 setWhitelistActionActivitiesOnly:[(SHSheetSession *)self whitelistActionActivitiesOnly]];
  v24 = [(SHSheetSession *)self activitiesManager];
  v25 = [v24 applicationActivities];
  [(_UIActivityMatchingContext *)v23 setApplicationActivities:v25];

  v26 = [(SHSheetSession *)self activityTypeOrder];
  [(_UIActivityMatchingContext *)v23 setActivityTypeOrder:v26];

  [(_UIActivityMatchingContext *)v23 setIncludedActivityTypes:v12];
  [(_UIActivityMatchingContext *)v23 setExcludedActivityTypes:v7];
  [(_UIActivityMatchingContext *)v23 setExcludedActivityCategories:v13];
  [(_UIActivityMatchingContext *)v23 setSharingStyle:[(SHSheetSession *)self sharingStyle]];
  [(_UIActivityMatchingContext *)v23 setShowSharePlayProminently:[(SHSheetSession *)self showSharePlayProminently]];
  [(_UIActivityMatchingContext *)v23 setShouldExcludeiCloudSharingActivity:[(SHSheetSession *)self supportsCollaboration] | v19];

  return v23;
}

- (id)createShareServiceUIConfiguration
{
  int v3 = objc_alloc_init(UISUIActivityViewControllerConfiguration);
  id v4 = [(SHSheetSession *)self identifier];
  [(UISUIActivityViewControllerConfiguration *)v3 setSessionID:v4];

  id v5 = [(SHSheetSession *)self activityItemsManager];
  id v6 = [v5 activityItemValuesForActivity:0];

  id v7 = objc_msgSend(v6, "sh_allClassNames");
  [(UISUIActivityViewControllerConfiguration *)v3 setActivityItemValueClassNames:v7];

  BOOL v8 = [(SHSheetSession *)self activityItemsManager];
  uint64_t v9 = [v8 activityItemURLValuesForActivity:0];
  [(UISUIActivityViewControllerConfiguration *)v3 setUrlsBeingShared:v9];

  id v10 = [(SHSheetSession *)self activityItemsManager];
  id v11 = [v10 securityScopedURLsForActivity:0];
  [(UISUIActivityViewControllerConfiguration *)v3 setSecurityScopedURLsForMatching:v11];

  v12 = [(SHSheetSession *)self activityViewController];
  int64_t v13 = [v12 viewIfLoaded];
  uint64_t v14 = [v13 window];
  int v15 = [v14 tintColor];
  [(UISUIActivityViewControllerConfiguration *)v3 setHostTintColor:v15];

  id v16 = [(SHSheetSession *)self activitiesManager];
  uint64_t v17 = [v16 orderedActivities];
  v18 = [(SHSheetSession *)self activityConfigurationsForActivities:v17 forRemoteUIService:0];
  [(UISUIActivityViewControllerConfiguration *)v3 setHostActivityConfigurations:v18];

  BOOL v19 = [(SHSheetSession *)self activitiesManager];
  objc_super v20 = [v19 hiddenActivities];
  BOOL v21 = [(SHSheetSession *)self activityConfigurationsForActivities:v20 forRemoteUIService:0];
  [(UISUIActivityViewControllerConfiguration *)v3 setHostHiddenActivityConfigurations:v21];

  v22 = [(SHSheetSession *)self activityTypesToCreateInShareService];
  [(UISUIActivityViewControllerConfiguration *)v3 setActivityTypesToCreateInShareService:v22];

  uint64_t v23 = [(SHSheetSession *)self activityViewController];
  v24 = [v23 traitCollection];
  [(UISUIActivityViewControllerConfiguration *)v3 setHostTraitCollection:v24];

  v25 = [(SHSheetSession *)self activityViewController];
  v26 = [v25 viewIfLoaded];
  [v26 directionalLayoutMargins];
  [(UISUIActivityViewControllerConfiguration *)v3 setHostLayoutMargins:"setHostLayoutMargins:"];

  uint64_t v27 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(UISUIActivityViewControllerConfiguration *)v3 setHostLocale:v27];

  v28 = [(SHSheetSession *)self activityViewController];
  [v28 preferredContentSize];
  -[UISUIActivityViewControllerConfiguration setPreferredWidth:](v3, "setPreferredWidth:");

  v29 = [MEMORY[0x1E4F28B50] mainBundle];
  v30 = [v29 preferredLocalizations];
  [(UISUIActivityViewControllerConfiguration *)v3 setPreferredLocalizations:v30];

  uint64_t v31 = [MEMORY[0x1E4FB16C8] currentDevice];
  -[UISUIActivityViewControllerConfiguration setHostIdiom:](v3, "setHostIdiom:", [v31 userInterfaceIdiom]);

  [(UISUIActivityViewControllerConfiguration *)v3 setNumberOfVisibleSharingActivities:[(SHSheetSession *)self numberOfVisibleSharingActivities]];
  [(UISUIActivityViewControllerConfiguration *)v3 setNumberOfVisibleActionActivities:[(SHSheetSession *)self numberOfVisibleActionActivities]];
  unsigned int v32 = _NSExtensionItemsFromActivityItemValues(v6);
  v33 = +[_UIActivityApplicationExtensionDiscovery extensionMatchingDictionariesForExtensionItems:v32];
  [(UISUIActivityViewControllerConfiguration *)v3 setActivityItemValueExtensionMatchingDictionaries:v33];

  [(UISUIActivityViewControllerConfiguration *)v3 setAllowsEmbedding:[(SHSheetSession *)self allowsEmbedding]];
  [(UISUIActivityViewControllerConfiguration *)v3 setIsContentManaged:[(SHSheetSession *)self isContentManaged]];
  BOOL v34 = 1;
  [(UISUIActivityViewControllerConfiguration *)v3 setShouldMatchOnlyUserElectedExtensions:1];
  [(UISUIActivityViewControllerConfiguration *)v3 setWhitelistActionActivitiesOnly:[(SHSheetSession *)self whitelistActionActivitiesOnly]];
  [(UISUIActivityViewControllerConfiguration *)v3 setLinkedBeforeYukon:dyld_program_sdk_at_least() ^ 1];
  if (![(SHSheetSession *)self shouldSkipPeopleSuggestions]) {
    BOOL v34 = [(SHSheetSession *)self hideSuggestions];
  }
  [(UISUIActivityViewControllerConfiguration *)v3 setShouldSkipPeopleSuggestions:v34];
  v35 = [(SHSheetSession *)self activityItemsManager];
  char v36 = [v35 recipientsForActivity:0];
  [(UISUIActivityViewControllerConfiguration *)v3 setRecipients:v36];

  v37 = [(SHSheetSession *)self activityItemsManager];
  id v38 = [v37 activityItemURLValuesForActivity:0];

  [(UISUIActivityViewControllerConfiguration *)v3 setShouldExcludeiCloudSharingActivity:_UIActivityHelperActivityItemsIncludeICloudDriveURL(v38) ^ 1];
  v39 = [(SHSheetSession *)self activitiesManager];
  v40 = [v39 excludedActivityTypes];
  [(UISUIActivityViewControllerConfiguration *)v3 setExcludedActivityTypes:v40];

  v41 = [(SHSheetSession *)self includedActivityTypes];
  [(UISUIActivityViewControllerConfiguration *)v3 setIncludedActivityTypes:v41];

  v42 = [(SHSheetSession *)self activityTypeOrder];
  [(UISUIActivityViewControllerConfiguration *)v3 setActivityTypeOrder:v42];

  [(UISUIActivityViewControllerConfiguration *)v3 setExcludedActivityCategories:[(SHSheetSession *)self excludedActivityCategories]];
  [(UISUIActivityViewControllerConfiguration *)v3 setCanExcludeExtensionActivities:_UICanExcludeExtensionActivities()];
  [(UISUIActivityViewControllerConfiguration *)v3 setSharingStyle:[(SHSheetSession *)self sharingStyle]];
  [(UISUIActivityViewControllerConfiguration *)v3 setCanShowShareSheetPlugIns:1];
  v43 = [(SHSheetSession *)self selectedAssetIdentifiers];
  char v44 = [(SHSheetSession *)self activityItemsManager];
  v45 = [v44 suggestionAssetIdentifiers];

  if ([v45 count])
  {
    v46 = [MEMORY[0x1E4F1CA80] setWithArray:v45];
    [v46 addObjectsFromArray:v43];
    uint64_t v47 = [v46 allObjects];

    v43 = (void *)v47;
  }
  [(UISUIActivityViewControllerConfiguration *)v3 setInitialPhotosAssetDetails:v43];
  v48 = [(SHSheetSession *)self activityViewController];
  v49 = [v48 traitCollection];
  v50 = [v49 preferredContentSizeCategory];

  +[UIActivity imageWidthForContentSizeCategory:v50];
  double v52 = round(v51 * 0.75);
  -[UISUIActivityViewControllerConfiguration setIconSize:](v3, "setIconSize:", v52, v52);
  v53 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v53 scale];
  -[UISUIActivityViewControllerConfiguration setIconScale:](v3, "setIconScale:");

  if ([(SHSheetSession *)self supportsCollaboration]
    && ![(SHSheetSession *)self supportsSendCopy])
  {
    v65 = v32;
    v54 = share_sheet_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0AD8000, v54, OS_LOG_TYPE_DEFAULT, "Excluding AirDrop for collaboration only mode", buf, 2u);
    }
    v55 = v6;

    v56 = [(UISUIActivityViewControllerConfiguration *)v3 excludedActivityTypes];
    if (v56)
    {
      v57 = [(UISUIActivityViewControllerConfiguration *)v3 excludedActivityTypes];
      v58 = (void *)[v57 mutableCopy];
    }
    else
    {
      v58 = [MEMORY[0x1E4F1CA48] array];
    }

    [v58 addObject:@"com.apple.UIKit.activity.AirDrop"];
    v59 = (void *)[v58 copy];
    [(UISUIActivityViewControllerConfiguration *)v3 setExcludedActivityTypes:v59];

    id v6 = v55;
    unsigned int v32 = v65;
  }
  if ([(SHSheetSession *)self _isHeroCollaborationOnly])
  {
    [(UISUIActivityViewControllerConfiguration *)v3 setIncludedActivityTypes:&unk_1EF3399C0];
    [(UISUIActivityViewControllerConfiguration *)v3 setWhitelistActionActivitiesOnly:0];
  }
  [(UISUIActivityViewControllerConfiguration *)v3 setIsCollaborative:[(SHSheetSession *)self isCollaborative]];
  if ([(SHSheetSession *)self isCollaborative])
  {
    [(SHSheetSession *)self activityTypesToCreateInShareService];
    v60 = v32;
    v62 = v61 = v6;
    v63 = (void *)[v62 mutableCopy];

    id v6 = v61;
    unsigned int v32 = v60;
    [v63 removeObject:@"com.apple.UIKit.activity.RemoteOpenInApplication"];
    [(UISUIActivityViewControllerConfiguration *)v3 setActivityTypesToCreateInShareService:v63];
  }
  return v3;
}

- (NSArray)customizationGroups
{
  int v3 = [(SHSheetSession *)self objectManipulationDelegate];
  id v4 = [(SHSheetSession *)self activityViewController];
  id v5 = [v3 _customizationGroupsForActivityViewController:v4];

  return (NSArray *)v5;
}

- (NSString)customOptionsTitle
{
  if (self->_objectManipulationDelegateFlags.respondsToCustomLocalizedActionTitle)
  {
    int v3 = [(SHSheetSession *)self objectManipulationDelegate];
    id v4 = [(SHSheetSession *)self activityViewController];
    id v5 = [v3 customLocalizedActionTitleForActivityViewController:v4];
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

- (UIViewController)customOptionsViewController
{
  if (self->_objectManipulationDelegateFlags.respondsToCustomActionViewController)
  {
    int v3 = [(SHSheetSession *)self objectManipulationDelegate];
    id v4 = [(SHSheetSession *)self activityViewController];
    id v5 = [v3 customActionViewControllerForActivityViewController:v4];
  }
  else
  {
    id v5 = 0;
  }
  return (UIViewController *)v5;
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
  id v6 = a3;
  if ([v6 isEqualToArray:self->_selectedAssetIdentifiers])
  {
    self->_shouldSkipPeopleSuggestions = 1;
  }
  else
  {
    self->_shouldSkipPeopleSuggestions = 0;
    id v4 = (NSArray *)[v6 copy];
    selectedAssetIdentifiers = self->_selectedAssetIdentifiers;
    self->_selectedAssetIdentifiers = v4;
  }
}

- (void)setIsContentManaged:(BOOL)a3
{
  if (self->_isContentManaged != a3)
  {
    BOOL v3 = a3;
    self->_isContentManaged = a3;
    id v4 = [(SHSheetSession *)self activityItemsManager];
    [v4 setIsContentManaged:v3];
  }
}

- (id)_metadataValues
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SHSheetSession *)self photosHeaderMetadata];
  id v4 = (void *)v3;
  if (v3)
  {
    v14[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    id v6 = [(SHSheetSession *)self activityItemsManager];
    id v5 = [v6 linkMetadataValues];

    if (![v5 count])
    {
      id v7 = [(SHSheetSession *)self collaborationItem];
      BOOL v8 = [v7 linkMetadata];

      if (v8)
      {
        uint64_t v9 = [(SHSheetSession *)self collaborationItem];
        id v10 = [v9 linkMetadata];
        int64_t v13 = v10;
        uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];

        id v5 = (void *)v11;
      }
    }
  }

  return v5;
}

- (id)createClientContext
{
  v2 = [[SHSheetUIServiceClientContext alloc] initWithSession:self];
  return v2;
}

- (BOOL)_isHeroCollaborationOnly
{
  uint64_t v3 = [(SHSheetSession *)self collaborationItem];
  if ([v3 type] == 1)
  {
    id v4 = [(SHSheetSession *)self collaborationItem];
    int v5 = [v4 isServiceManatee];
  }
  else
  {
    int v5 = 0;
  }

  id v6 = [(SHSheetSession *)self collaborationItem];
  if ([v6 type] == 2)
  {
    id v7 = [(SHSheetSession *)self collaborationItem];
    int v8 = [v7 isURLProviderSupported] ^ 1;
  }
  else
  {
    int v8 = 0;
  }

  if ((v5 | v8) != 1) {
    return 0;
  }
  return [(SHSheetSession *)self isCollaborative];
}

- (id)createContentContext
{
  uint64_t v3 = objc_alloc_init(UIActivityContentContext);
  BOOL v4 = [(SHSheetSession *)self instantShareSheet]
    || [(SHSheetSession *)self useRemoteUIService];
  [(UIActivityContentContext *)v3 setCanRenderPeople:v4];
  [(UIActivityContentContext *)v3 setConfigureForCloudSharing:[(SHSheetSession *)self configureForCloudSharing]];
  [(UIActivityContentContext *)v3 setConfigureForPhotosEdit:[(SHSheetSession *)self configureForPhotosEdit]];
  [(UIActivityContentContext *)v3 setHideHeaderView:[(SHSheetSession *)self hideHeaderView]];
  [(UIActivityContentContext *)v3 setHideNavigationBar:[(SHSheetSession *)self hideNavigationBar]];
  int v5 = [(SHSheetSession *)self topContentSectionText];
  [(UIActivityContentContext *)v3 setTopContentSectionText:v5];

  [(UIActivityContentContext *)v3 setSharingExpanded:[(SHSheetSession *)self isExpanded]];
  id v6 = [(SHSheetSession *)self activitiesManager];
  id v7 = [v6 applicationActivityTypes];
  [(UIActivityContentContext *)v3 setApplicationActivityTypes:v7];

  int v8 = [(SHSheetSession *)self heroActionActivityTypes];
  [(UIActivityContentContext *)v3 setHeroActionActivityTypes:v8];

  [(UIActivityContentContext *)v3 setShowHeroActionsHorizontally:[(SHSheetSession *)self showHeroActionsHorizontally]];
  return v3;
}

- (BOOL)isExpanded
{
  if (![(SHSheetSession *)self sharingStyle]) {
    return 1;
  }
  return [(SHSheetSession *)self didExpand];
}

- (BOOL)showHeaderSpecialization
{
  v2 = [(SHSheetSession *)self activityItemsManager];
  uint64_t v3 = [v2 linkMetadataValues];
  BOOL v4 = [v3 firstObject];

  LOBYTE(v2) = +[SHSheetActivityItemUtilities shouldShowHeaderSpecializationForMetadata:v4];
  return (char)v2;
}

- (BOOL)isModeSwitchDisabled
{
  uint64_t v3 = [(SHSheetSession *)self collaborationModeRestriction];
  if (v3)
  {
    BOOL v4 = [(SHSheetSession *)self collaborationModeRestriction];
    int v5 = [v4 alertTitle];
    if (v5)
    {
      id v6 = [(SHSheetSession *)self collaborationModeRestriction];
      int v7 = [v6 allowContinueToMode] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)setConfiguration:(id)a3
{
  int v5 = (UISDShareSheetSessionConfiguration *)a3;
  configuration = self->_configuration;
  if (!configuration)
  {
    int v7 = share_sheet_log();
    int v8 = share_sheet_log();
    uint64_t v9 = [(SHSheetSession *)self activityViewController];
    os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v8, v9);

    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v7, OS_SIGNPOST_INTERVAL_END, v10, "SendInitialConfiguration", (const char *)&unk_1A0BA1E03, buf, 2u);
    }

    uint64_t v11 = share_sheet_log();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "InitialContentUpdate", (const char *)&unk_1A0BA1E03, v14, 2u);
    }

    configuration = self->_configuration;
  }
  if (configuration != v5)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    if ([(SHSheetSession *)self isCollaborationRestricted]) {
      [(SHSheetSession *)self setIsCollaborative:0];
    }
    goto LABEL_13;
  }
  BOOL v12 = [(SHSheetSession *)self useRemoteUIService];
  if (!v5 && v12)
  {
LABEL_13:
    int64_t v13 = [(SHSheetSession *)self delegate];
    [v13 sessionConfigurationDidChangeForSession:self];
  }
}

- (id)activityConfigurationsForActivities:(id)a3 forRemoteUIService:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        int64_t v13 = -[SHSheetSession _configurationForActivity:forRemoteUIService:](self, "_configurationForActivity:forRemoteUIService:", *(void *)(*((void *)&v15 + 1) + 8 * i), v4, (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_configurationForActivity:(id)a3 forRemoteUIService:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = +[UISUIActivityConfiguration configurationForActivity:v6 forRemoteUIService:v4];
  id v8 = [(SHSheetSession *)self activityViewController];
  uint64_t v9 = [v6 activityType];
  uint64_t v10 = [v8 _titleForActivity:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v6 activityTitle];
  }
  int64_t v13 = v12;

  uint64_t v14 = [v7 activityTitle];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0) {
    [v7 updateConfigurationWithOverrideTitle:v13];
  }

  return v7;
}

- (BOOL)activitiesManager:(id)a3 shouldShowSystemActivityType:(id)a4
{
  id v5 = a4;
  id v6 = [(SHSheetSession *)self activityViewController];
  char v7 = [v6 _shouldShowSystemActivityType:v5];

  return v7;
}

- (void)metadataCollectionDidFinishLoading:(id)a3
{
  id v4 = [(SHSheetSession *)self delegate];
  [v4 headerMetadataDidChangeForSession:self];
}

- (void)metadataCollection:(id)a3 didChangeMetadata:(id)a4
{
  id v5 = a4;
  id v6 = [(SHSheetSession *)self delegate];
  [v6 session:self didChangeMetadata:v5];
}

- (void)activityItemsManagerLinkMetadataValuesDidChange:(id)a3
{
  id v4 = objc_alloc(getSFUILoadedMetadataCollectionClass());
  id v5 = [(SHSheetSession *)self _metadataValues];
  id v6 = (void *)[v4 initWithMetadatas:v5];
  [(SHSheetSession *)self setMetadataCollection:v6];

  id v7 = [(SHSheetSession *)self delegate];
  [v7 headerMetadataDidChangeForSession:self];
}

- (id)urlRequestsForActivityItemsManager:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  collaborationURLRequests = self->_collaborationURLRequests;
  if (collaborationURLRequests)
  {
    id v4 = collaborationURLRequests;
  }
  else
  {
    uint64_t v6 = [(SHSheetSession *)self collaborationItem];
    id v7 = (void *)v6;
    if (v6)
    {
      id v8 = (void *)MEMORY[0x1E4F9F6B8];
      v13[0] = v6;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      uint64_t v10 = [v8 urlRequestsForCollaborationItems:v9];
      uint64_t v11 = self->_collaborationURLRequests;
      self->_collaborationURLRequests = v10;
    }
    id v4 = self->_collaborationURLRequests;
  }
  return v4;
}

- (BOOL)activityItemsManager:(id)a3 collaborationSupportsPromiseURLsForActivity:(id)a4
{
  id v4 = a4;
  if ([(id)objc_opt_class() activityCategory])
  {
    char v5 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    char v5 = [v4 _activitySupportsPromiseURLs];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)collaborationPlaceholderActivityItemsForActivityItemsManager:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(SHSheetSession *)self collaborationItem];
  if (v4
    && (char v5 = (void *)v4,
        BOOL v6 = [(SHSheetSession *)self supportsCollaboration],
        v5,
        v6))
  {
    id v7 = [(SHSheetSession *)self collaborationItem];
    id v8 = [v7 placeholderActivityItem];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v12 = [(SHSheetSession *)self collaborationItem];
      id v10 = [v12 activityItem];
    }
    if ([(SHSheetSession *)self isCollaborative])
    {
      v15[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    }
    else
    {
      int64_t v13 = [(SHSheetSession *)self collaborationItem];
      uint64_t v11 = [v13 sendCopyItems];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)activityItemsManager:(id)a3 collaborationActivityItemValuesForActivityItemValue:(id)a4 activity:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(SHSheetSession *)self supportsCollaboration])
  {
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  uint64_t v11 = (void *)[v9 mutableCopy];
  id v12 = [(SHSheetSession *)self collaborationItem];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  uint64_t v51 = -1;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __100__SHSheetSession_activityItemsManager_collaborationActivityItemValuesForActivityItemValue_activity___block_invoke;
  v40[3] = &unk_1E5A23658;
  v42 = &v44;
  id v13 = v12;
  id v41 = v13;
  v43 = &v48;
  [v9 enumerateObjectsUsingBlock:v40];
  if (*((unsigned char *)v45 + 24))
  {
    [v11 removeObjectAtIndex:v49[3]];
    v49[3] = -1;
  }
  if ([(SHSheetSession *)self isCollaborative])
  {
    uint64_t v14 = [v10 activityType];
    int v15 = [v14 isEqual:@"com.apple.UIKit.activity.Message"];

    if (v15)
    {
      [v11 removeAllObjects];
      goto LABEL_21;
    }
    long long v16 = [v10 activityType];
    int v17 = [v16 isEqual:@"com.apple.UIKit.activity.Mail"];

    if (v17)
    {
      [v11 removeAllObjects];
      long long v18 = [(SHSheetSession *)self delegate];
      BOOL v19 = [v18 collaborationSharingResultForActivity:v10];

      uint64_t v20 = [v19 mailResult];
      BOOL v21 = [v20 body];

      if (!v21)
      {
LABEL_20:

        goto LABEL_21;
      }
      v22 = [v19 mailResult];
      uint64_t v23 = [v22 body];
      [v11 addObject:v23];
    }
    else
    {
      if ([(id)objc_opt_class() activityCategory] != 1) {
        goto LABEL_21;
      }
      v24 = [(SHSheetSession *)self delegate];
      BOOL v19 = [v24 collaborationSharingResultForActivity:v10];

      if (v19)
      {
        [v11 removeAllObjects];
        v25 = [v19 sharingURL];

        if (v25)
        {
          v22 = [v19 sharingURL];
          [v11 addObject:v22];
        }
        else
        {
          v22 = share_sheet_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v27 = [v19 collaborationItemIdentifier];
            v28 = [v19 error];
            -[SHSheetSession activityItemsManager:collaborationActivityItemValuesForActivityItemValue:activity:](v27, v28, buf, v22);
          }
        }
      }
      else
      {
        v22 = share_sheet_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v26 = [v10 activityType];
          *(_DWORD *)buf = 138412290;
          v53 = v26;
          _os_log_impl(&dword_1A0AD8000, v22, OS_LOG_TYPE_DEFAULT, "No sharingResult for activity type:%@", buf, 0xCu);
        }
      }
    }

    goto LABEL_20;
  }
LABEL_21:
  if (![(SHSheetSession *)self isCollaborative]
    || ![(id)objc_opt_class() activityCategory])
  {
    v29 = [v10 activityType];
    char v30 = [v29 isEqualToString:@"com.apple.InCallService.ShareExtension"];

    if ((v30 & 1) == 0 && (v49[3] & 0x8000000000000000) == 0)
    {
      uint64_t v31 = [(SHSheetSession *)self collaborationItem];
      BOOL v32 = [v31 type] == 0;

      if (!v32)
      {
        v33 = [v13 itemProvider];
        int v34 = [v33 supportsShareSheetSendCopyRepresentation];

        if (v34)
        {
          v35 = [v13 sendCopyRepresentation];
          char v36 = v35;
          if (v35)
          {
            id v37 = v35;
          }
          else
          {
            id v37 = [v13 itemProvider];
          }
          id v38 = v37;

          [v11 replaceObjectAtIndex:v49[3] withObject:v38];
        }
        else
        {
          [v11 removeObjectAtIndex:v49[3]];
        }
      }
    }
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);

LABEL_33:
  return v11;
}

void __100__SHSheetSession_activityItemsManager_collaborationActivityItemValuesForActivityItemValue_activity___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = +[_UIActivityItemMapping _originalActivityItemForActivityItem:v13];
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = v13;
  }
  id v9 = v8;

  id v10 = [*(id *)(a1 + 32) placeholderActivityItem];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 isEqual:v9];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || ([*(id *)(a1 + 32) activityItem],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 isEqual:v9],
        v11,
        v12))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)activityItemsManager:(id)a3 subjectForActivity:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(SHSheetSession *)self supportsCollaboration]
    && [(SHSheetSession *)self isCollaborative]
    && ([v5 activityType],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqual:@"com.apple.UIKit.activity.Mail"],
        v6,
        v7))
  {
    id v8 = [(SHSheetSession *)self delegate];
    id v9 = [v8 collaborationSharingResultForActivity:v5];

    id v10 = [v9 mailResult];
    uint64_t v11 = [v10 subject];

    int v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      int v15 = v11;
      _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "Collaboration Mail Subject:%@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (int64_t)numberOfVisibleSharingActivities
{
  unint64_t v3 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 5;
  uint64_t v4 = [(SHSheetSession *)self activityViewController];
  id v5 = [v4 customViewController];

  BOOL v6 = v3 < 0xFFFFFFFFFFFFFFFELL || v5 == 0;
  if (!v6 || ![(SHSheetSession *)self isExpanded]) {
    return 0;
  }
  int v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8 == 1)
  {
    id v9 = [(SHSheetSession *)self activityViewController];
    id v10 = [v9 _existingPresentationControllerImmediate:0 effective:1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      return 5;
    }
    else {
      return 7;
    }
  }
  else if (v3 >= 0xFFFFFFFFFFFFFFFELL)
  {
    return 7;
  }
  else
  {
    return 5;
  }
}

- (int64_t)numberOfVisibleActionActivities
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  id v5 = [(SHSheetSession *)self activityViewController];
  BOOL v6 = [v5 _existingPresentationControllerImmediate:0 effective:1];

  unint64_t v7 = [(id)*MEMORY[0x1E4FB2608] activeInterfaceOrientation] - 5;
  uint64_t v8 = [(SHSheetSession *)self activityViewController];
  id v9 = [v8 customViewController];

  if (v7 < 0xFFFFFFFFFFFFFFFELL || v9 == 0)
  {
    if ([(SHSheetSession *)self isExpanded])
    {
      if (v4 == 1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int64_t v11 = 7;
        }
        else {
          int64_t v11 = 4;
        }
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        int64_t v11 = 2;
        if (!v9 && (isKindOfClass & 1) != 0)
        {
          id v18 = v6;
          BOOL v19 = [v18 selectedDetentIdentifier];
          if (v19)
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            uint64_t v20 = objc_msgSend(v18, "detents", 0);
            BOOL v21 = (void *)[v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v31;
              while (2)
              {
                for (uint64_t i = 0; i != v21; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v31 != v22) {
                    objc_enumerationMutation(v20);
                  }
                  v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                  v25 = [v24 _identifier];
                  int v26 = [v25 isEqualToString:v19];

                  if (v26)
                  {
                    id v27 = v24;
                    goto LABEL_33;
                  }
                }
                BOOL v21 = (void *)[v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
            }
          }
          else
          {
            uint64_t v20 = [v18 detents];
            id v27 = [v20 firstObject];
LABEL_33:
            BOOL v21 = v27;
          }

          v28 = [MEMORY[0x1E4FB1C30] largeDetent];
          int v29 = [v21 isEqual:v28];

          if (v29) {
            int64_t v11 = 10;
          }
          else {
            int64_t v11 = 3;
          }
        }
      }
    }
    else
    {
      if (v4 == 1) {
        uint64_t v12 = 9;
      }
      else {
        uint64_t v12 = 8;
      }
      id v13 = [(SHSheetSession *)self activityViewController];
      int v14 = [v13 heroActionActivityTypes];
      uint64_t v15 = [v14 count];

      if (v15) {
        int64_t v11 = v12 - 2;
      }
      else {
        int64_t v11 = v12;
      }
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (![(SHSheetSession *)self isCollaborationRestricted])
  {
    if ((v4 & 4) != 0)
    {
      id v9 = [v6 options];

      if (v9)
      {
        id location = 0;
        objc_initWeak(&location, self);
        id v10 = (void *)MEMORY[0x1E4F9F6B8];
        int64_t v11 = [(SHSheetSession *)self collaborationItem];
        uint64_t v12 = [(SHSheetSession *)self _collaborationService];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        void v14[2] = __39__SHSheetSession_observable_didChange___block_invoke;
        v14[3] = &unk_1E5A218B8;
        objc_copyWeak(&v15, &location);
        [v10 canShowShareOptionsForCollaborationItem:v11 service:v12 completionHandler:v14];

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
        goto LABEL_10;
      }
    }
    else if ((v4 & 2) == 0)
    {
      if ((v4 & 0x10) == 0) {
        goto LABEL_10;
      }
      unint64_t v7 = [v6 canAddPeople];
      char v8 = [v7 BOOLValue];

      if (v8) {
        goto LABEL_10;
      }
    }
    id v13 = [(SHSheetSession *)self delegate];
    [v13 collaborationFooterViewModelDidChangeForSession:self];
  }
LABEL_10:
}

void __39__SHSheetSession_observable_didChange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v4 = WeakRetained;
  if (WeakRetained && ([WeakRetained isCollaborationRestricted] & 1) == 0)
  {
    id v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "no";
      if (a2) {
        id v6 = "yes";
      }
      int v8 = 136315138;
      id v9 = v6;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "canShowShareOptions:%s", (uint8_t *)&v8, 0xCu);
    }

    [v4 setShowOptions:a2];
    unint64_t v7 = [v4 delegate];
    [v7 collaborationFooterViewModelDidChangeForSession:v4];
  }
}

- (UISDShareSheetSessionConfiguration)configuration
{
  return self->_configuration;
}

- (SFPeopleSuggestion)currentPeopleSuggestion
{
  return self->_currentPeopleSuggestion;
}

- (void)setCurrentPeopleSuggestion:(id)a3
{
}

- (SHSheetSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetSessionDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIActivityViewController)activityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
  return (UIActivityViewController *)WeakRetained;
}

- (void)setActivityViewController:(id)a3
{
}

- (SHSheetActivitiesManager)activitiesManager
{
  return self->_activitiesManager;
}

- (void)setActivitiesManager:(id)a3
{
}

- (SHSheetActivityItemsManager)activityItemsManager
{
  return self->_activityItemsManager;
}

- (void)setActivityItemsManager:(id)a3
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

- (BOOL)didExpand
{
  return self->_didExpand;
}

- (void)setDidExpand:(BOOL)a3
{
  self->_didExpand = a3;
}

- (NSArray)includedActivityTypes
{
  return self->_includedActivityTypes;
}

- (void)setIncludedActivityTypes:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (NSArray)activityTypeOrder
{
  return self->_activityTypeOrder;
}

- (void)setActivityTypeOrder:(id)a3
{
}

- (NSArray)heroActionActivityTypes
{
  return self->_heroActionActivityTypes;
}

- (void)setHeroActionActivityTypes:(id)a3
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

- (BOOL)allowsEmbedding
{
  return self->_allowsEmbedding;
}

- (void)setAllowsEmbedding:(BOOL)a3
{
  self->_allowsEmbedding = a3;
}

- (BOOL)shouldSuggestFamilyMembers
{
  return self->_shouldSuggestFamilyMembers;
}

- (void)setShouldSuggestFamilyMembers:(BOOL)a3
{
  self->_shouldSuggestFamilyMembers = a3;
}

- (BOOL)showSharePlayProminently
{
  return self->_showSharePlayProminently;
}

- (void)setShowSharePlayProminently:(BOOL)a3
{
  self->_showSharePlayProminently = a3;
}

- (BOOL)canPerformSharePlay
{
  return self->_canPerformSharePlay;
}

- (void)setCanPerformSharePlay:(BOOL)a3
{
  self->_BOOL canPerformSharePlay = a3;
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

- (BOOL)configureForCloudSharing
{
  return self->_configureForCloudSharing;
}

- (void)setConfigureForCloudSharing:(BOOL)a3
{
  self->_configureForCloudSharing = a3;
}

- (BOOL)configureForPhotosEdit
{
  return self->_configureForPhotosEdit;
}

- (void)setConfigureForPhotosEdit:(BOOL)a3
{
  self->_configureForPhotosEdit = a3;
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

- (BOOL)showOptions
{
  return self->_showOptions;
}

- (void)setShowOptions:(BOOL)a3
{
  self->_BOOL showOptions = a3;
}

- (BOOL)isAirdropOnly
{
  return self->_isAirdropOnly;
}

- (void)setIsAirdropOnly:(BOOL)a3
{
  self->_isAirdropOnly = a3;
}

- (BOOL)instantShareSheet
{
  return self->_instantShareSheet;
}

- (void)setInstantShareSheet:(BOOL)a3
{
  self->_instantShareSheet = a3;
}

- (BOOL)showHeroActionsHorizontally
{
  return self->_showHeroActionsHorizontally;
}

- (void)setShowHeroActionsHorizontally:(BOOL)a3
{
  self->_showHeroActionsHorizontally = a3;
}

- (NSArray)selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (UIActivity)performingActivity
{
  return self->_performingActivity;
}

- (void)setPerformingActivity:(id)a3
{
}

- (void)setCollaborationItem:(id)a3
{
}

- (NSArray)collaborationURLRequests
{
  return self->_collaborationURLRequests;
}

- (void)setCollaborationURLRequests:(id)a3
{
}

- (BOOL)isCollaborative
{
  return self->_isCollaborative;
}

- (SFCollaborationItemsProvider)collaborationItemsProvider
{
  return self->_collaborationItemsProvider;
}

- (void)setCollaborationItemsProvider:(id)a3
{
}

- (UIActivityCollaborationModeRestriction)collaborationModeRestriction
{
  return self->_collaborationModeRestriction;
}

- (void)setCollaborationModeRestriction:(id)a3
{
}

- (void)setCustomizationGroups:(id)a3
{
}

- (BOOL)shouldSkipPeopleSuggestions
{
  return self->_shouldSkipPeopleSuggestions;
}

- (void)setShouldSkipPeopleSuggestions:(BOOL)a3
{
  self->_shouldSkipPeopleSuggestions = a3;
}

- (LPLinkMetadata)photosHeaderMetadata
{
  return self->_photosHeaderMetadata;
}

- (void)setPhotosHeaderMetadata:(id)a3
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

- (NSArray)activityTypesToCreateInShareService
{
  return self->_activityTypesToCreateInShareService;
}

- (void)setActivityTypesToCreateInShareService:(id)a3
{
}

- (BOOL)useRemoteUIService
{
  return self->_useRemoteUIService;
}

- (void)setUseRemoteUIService:(BOOL)a3
{
  self->_useRemoteUIService = a3;
}

- (BOOL)showCustomScene
{
  return self->_showCustomScene;
}

- (void)setShowCustomScene:(BOOL)a3
{
  self->_showCustomScene = a3;
}

- (_SHSheetScene)remoteScene
{
  return self->_remoteScene;
}

- (void)setRemoteScene:(id)a3
{
}

- (NSArray)peopleSuggestionBundleIds
{
  return self->_peopleSuggestionBundleIds;
}

- (void)setPeopleSuggestionBundleIds:(id)a3
{
}

- (SFUILoadedMetadataCollection)metadataCollection
{
  return self->_metadataCollection;
}

- (void)setMetadataCollection:(id)a3
{
}

- (unint64_t)xrRenderingMode
{
  return self->_xrRenderingMode;
}

- (void)setXrRenderingMode:(unint64_t)a3
{
  self->_xrRenderingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataCollection, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionBundleIds, 0);
  objc_storeStrong((id *)&self->_remoteScene, 0);
  objc_storeStrong((id *)&self->_activityTypesToCreateInShareService, 0);
  objc_destroyWeak((id *)&self->_objectManipulationDelegate);
  objc_storeStrong((id *)&self->_photosHeaderMetadata, 0);
  objc_storeStrong((id *)&self->_customizationGroups, 0);
  objc_storeStrong((id *)&self->_collaborationModeRestriction, 0);
  objc_storeStrong((id *)&self->_collaborationItemsProvider, 0);
  objc_storeStrong((id *)&self->_collaborationURLRequests, 0);
  objc_storeStrong((id *)&self->_collaborationItem, 0);
  objc_storeStrong((id *)&self->_performingActivity, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_topContentSectionText, 0);
  objc_storeStrong((id *)&self->_heroActionActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityTypeOrder, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_includedActivityTypes, 0);
  objc_storeStrong((id *)&self->_activityItemsManager, 0);
  objc_storeStrong((id *)&self->_activitiesManager, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentPeopleSuggestion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)supportsCollaboration
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Items support collaborate but client does not and items do not support send as copy, defaulting to collaborate.", v1, 2u);
}

- (void)supportsSendCopy
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "Items support send as copy but client does not and items do not support collaborate, defaulting to send copy.", v1, 2u);
}

- (void)activityItemsManager:(uint8_t *)buf collaborationActivityItemValuesForActivityItemValue:(os_log_t)log activity:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A0AD8000, log, OS_LOG_TYPE_ERROR, "No sharingURL for sharingResult:%@ error:%@", buf, 0x16u);
}

@end