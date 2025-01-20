@interface HibernatedTab
- (BOOL)canSetPinned;
- (BOOL)hasBeenInserted;
- (BOOL)isActive;
- (BOOL)isArticle;
- (BOOL)isAudible;
- (BOOL)isBlank;
- (BOOL)isClosed;
- (BOOL)isFrontmost;
- (BOOL)isInReaderMode;
- (BOOL)isLoading;
- (BOOL)isLoadingComplete;
- (BOOL)isMuted;
- (BOOL)isPinned;
- (BOOL)isPinnedTab;
- (BOOL)isPrivateBrowsingEnabled;
- (BOOL)isReusableForURL:(id)a3 webClipURL:(id)a4;
- (BOOL)isShowingSystemStartPage;
- (BOOL)isUnread;
- (BOOL)matchedLastSearch;
- (BOOL)shouldSelectOriginatingTabWhenClosed;
- (BOOL)suppressWebExtensionEvents;
- (BrowserController)browserController;
- (CGSize)tabViewSize;
- (HibernatedTab)initWithTabDocument:(id)a3;
- (HibernatedTab)initWithWBTab:(id)a3 browserController:(id)a4;
- (LPLinkMetadata)linkMetadataForSharing;
- (NSArray)URLStringComponents;
- (NSArray)ancestorTabIdentifiers;
- (NSArray)ancestorUUIDs;
- (NSArray)shareParticipants;
- (NSArray)tabCollectionItems;
- (NSArray)titleWords;
- (NSString)URLStringForLastSearch;
- (NSString)addressForNewBookmark;
- (NSString)lastSearchTerm;
- (NSString)pinnedTitle;
- (NSString)title;
- (NSString)titleForLastSearch;
- (NSString)titleForNewBookmark;
- (NSString)uuidString;
- (NSString)windowIdentifier;
- (NSURL)committedURL;
- (NSURL)expectedOrCurrentURL;
- (NSURL)pendingURLForWebExtensions;
- (NSURL)pinnedURL;
- (NSURL)url;
- (NSURL)urlForExtensions;
- (NSURL)urlForSharing;
- (NSUUID)uuid;
- (NSUUID)webClipID;
- (SFNavigationBarItem)cachedNavigationBarItem;
- (SFNavigationBarItem)navigationBarItem;
- (SFTabStateData)tabStateData;
- (SFWebExtensionsController)webExtensionsController;
- (TabBarItem)tabBarItem;
- (TabDocumentCollectionItem)tabCollectionItem;
- (TabOverviewItem)tabOverviewItem;
- (UnifiedTabBarItem)unifiedTabBarItem;
- (WBProfile)profile;
- (WBSCloudTab)cloudTab;
- (WBSSiriIntelligenceDonorTabData)tabDataForSpotlightDonation;
- (WBSTranslationContext)translationContext;
- (WBSWebExtensionTabPosition)previousWebExtensionTabPosition;
- (WBSWebExtensionWindow)webExtensionWindow;
- (WBTab)wbTab;
- (WKWebView)webViewForExtensions;
- (double)idForWebExtensions;
- (double)lastActivationTime;
- (double)lastViewedTime;
- (double)parentTabIDForWebExtensions;
- (double)zoomFactor;
- (id)_localAttributes;
- (id)_titleAllowURLStringFallback:(BOOL)a3 allowUntitled:(BOOL)a4;
- (id)_titleForStatePersistingForTabGroupTab;
- (id)_titleForStatePersistingForTabStateData;
- (id)currentUnifiedTabBarItem;
- (id)itemForTabCollectionView:(id)a3;
- (id)parentTabForWebExtensionContext:(id)a3;
- (id)readingListAddress;
- (id)tabUpdateBlock;
- (id)titleForCloudTab;
- (id)titleForSharing;
- (id)titleForTabCollection;
- (id)topBarThemeForTabOverviewShowingThemeColor:(BOOL)a3;
- (id)urlForCloudTab;
- (id)urlForStatePersisting;
- (id)urlString;
- (id)webViewsThatCanReceiveMessages;
- (int64_t)pageStatus;
- (unint64_t)changedPropertiesForOnUpdatedWebExtensionEvent;
- (unint64_t)indexInWindowForWebExtensionContext:(id)a3;
- (void)_cancelFaviconUpdate;
- (void)_notifyDidUpdateTabCollectionItem;
- (void)_searchEngineControllerDidFinishPopulating:(id)a3;
- (void)_setIcon:(id)a3 isMonogram:(BOOL)a4;
- (void)_updateNavigationBarItem;
- (void)activateForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)clearBrowserController;
- (void)close;
- (void)closeForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)detectWebpageLocaleForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)goBackForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)goForwardForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)loadURL:(id)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)loadURL:(id)a3 title:(id)a4 skipSyncableTabUpdates:(BOOL)a5;
- (void)reloadFromOrigin:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)resetTabViewItems;
- (void)restoreStateFromTab:(id)a3;
- (void)select;
- (void)setBrowserController:(id)a3;
- (void)setClosed:(BOOL)a3;
- (void)setLastSearchTerm:(id)a3;
- (void)setLastViewedTime:(double)a3;
- (void)setMatchedLastSearch:(BOOL)a3;
- (void)setMuted:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setPinned:(BOOL)a3;
- (void)setPinned:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setPinnedTitle:(id)a3;
- (void)setPinnedURL:(id)a3;
- (void)setPreviousWebExtensionTabPosition:(id)a3;
- (void)setReaderModeActive:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setReaderModeShowing:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setSelected:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setShareParticipants:(id)a3;
- (void)setSuppressWebExtensionEvents:(BOOL)a3;
- (void)setTitleForLastSearch:(id)a3;
- (void)setTitleWords:(id)a3;
- (void)setURLStringComponents:(id)a3;
- (void)setURLStringForLastSearch:(id)a3;
- (void)setUnread:(BOOL)a3;
- (void)setWBTab:(id)a3;
- (void)setZoomFactor:(double)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)updateAncestryWithParentTab:(id)a3;
- (void)updateTabIcon;
- (void)updateTabIconWithDelay:(double)a3;
- (void)updateTabTitle;
- (void)updateUsesDarkTheme;
@end

@implementation HibernatedTab

- (HibernatedTab)initWithTabDocument:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HibernatedTab;
  v5 = [(HibernatedTab *)&v30 init];
  if (v5)
  {
    v6 = [v4 tabGroupTab];
    uint64_t v7 = [v6 url];
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    if (v5->_url)
    {
      uint64_t v9 = [v6 title];
      title = v5->_title;
      v5->_title = (NSString *)v9;
    }
    else
    {
      title = v5->_title;
      v5->_title = 0;
    }

    wbTab = v5->_wbTab;
    v5->_wbTab = (WBTab *)v6;
    id v12 = v6;

    v13 = [v4 browserController];
    [(HibernatedTab *)v5 setBrowserController:v13];
    uint64_t v14 = [v4 unifiedTabBarItem];
    unifiedTabBarItem = v5->_unifiedTabBarItem;
    v5->_unifiedTabBarItem = (UnifiedTabBarItem *)v14;

    uint64_t v16 = [v4 tabBarItem];
    tabBarItem = v5->_tabBarItem;
    v5->_tabBarItem = (TabBarItem *)v16;

    uint64_t v18 = [v4 tabOverviewItem];
    tabOverviewItem = v5->_tabOverviewItem;
    v5->_tabOverviewItem = (TabOverviewItem *)v18;

    uint64_t v20 = [v4 tabCollectionItem];
    tabCollectionItem = v5->_tabCollectionItem;
    v5->_tabCollectionItem = (TabDocumentCollectionItem *)v20;

    [v4 idForWebExtensions];
    v5->_idForWebExtensions = v22;
    uint64_t v23 = [v4 ancestorUUIDs];
    ancestorUUIDs = v5->_ancestorUUIDs;
    v5->_ancestorUUIDs = (NSArray *)v23;

    [v4 lastViewedTime];
    v5->_lastViewedTime = v25;
    uint64_t v26 = [v4 shareParticipants];
    shareParticipants = v5->_shareParticipants;
    v5->_shareParticipants = (NSArray *)v26;

    -[HibernatedTab setUnread:](v5, "setUnread:", [v4 isUnread]);
    [(HibernatedTab *)v5 restoreStateFromTab:v12];

    v28 = v5;
  }

  return v5;
}

- (HibernatedTab)initWithWBTab:(id)a3 browserController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)HibernatedTab;
  uint64_t v9 = [(HibernatedTab *)&v33 init];
  if (v9)
  {
    uint64_t v10 = [v7 url];
    url = v9->_url;
    v9->_url = (NSURL *)v10;

    if (v9->_url)
    {
      uint64_t v12 = [v7 title];
      title = v9->_title;
      v9->_title = (NSString *)v12;
    }
    else
    {
      title = v9->_title;
      v9->_title = 0;
    }

    objc_storeStrong((id *)&v9->_wbTab, a3);
    [(HibernatedTab *)v9 setBrowserController:v8];
    uint64_t v14 = objc_alloc_init(UnifiedTabBarItem);
    unifiedTabBarItem = v9->_unifiedTabBarItem;
    v9->_unifiedTabBarItem = v14;

    uint64_t v16 = [(HibernatedTab *)v9 uuid];
    [(UnifiedTabBarItem *)v9->_unifiedTabBarItem setUUID:v16];

    [(SFUnifiedTabBarItem *)v9->_unifiedTabBarItem setMenuButtonConfigurator:v8];
    v17 = [MEMORY[0x1E4F78290] sharedFeatureManager];
    int v18 = [v17 showRectangularTabsInSeparateBar];

    if (v18)
    {
      v19 = objc_alloc_init(TabBarItem);
      tabBarItem = v9->_tabBarItem;
      v9->_tabBarItem = v19;

      v21 = [(HibernatedTab *)v9 uuid];
      [(TabBarItem *)v9->_tabBarItem setUUID:v21];
    }
    [(HibernatedTab *)v9 resetTabViewItems];
    [MEMORY[0x1E4F98FC0] nextTabID];
    v9->_idForWebExtensions = v22;
    uint64_t v23 = [v7 localAttributes];
    v24 = [v23 ancestorTabUUIDs];
    uint64_t v25 = objc_msgSend(v24, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_30);
    ancestorUUIDs = v9->_ancestorUUIDs;
    v9->_ancestorUUIDs = (NSArray *)v25;

    v27 = [v23 lastVisitTime];
    [v27 timeIntervalSinceReferenceDate];
    v9->_lastViewedTime = v28;

    shareParticipants = v9->_shareParticipants;
    v9->_shareParticipants = (NSArray *)MEMORY[0x1E4F1CBF0];

    if ([v7 isShared]) {
      uint64_t v30 = [v7 isMarkedAsRead] ^ 1;
    }
    else {
      uint64_t v30 = 0;
    }
    [(HibernatedTab *)v9 setUnread:v30];
    [(HibernatedTab *)v9 restoreStateFromTab:v7];
    v31 = v9;
  }
  return v9;
}

id __49__HibernatedTab_initWithWBTab_browserController___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (void)dealloc
{
  [(HibernatedTab *)self _cancelFaviconUpdate];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HibernatedTab;
  [(HibernatedTab *)&v4 dealloc];
}

- (void)setBrowserController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (WeakRetained != obj)
  {
    v5 = [WeakRetained tabController];
    [v5 willLoseOwnershipOfTab:self];

    objc_storeWeak((id *)&self->_browserController, obj);
    v6 = [obj tabController];
    [v6 didGainOwnershipOfTab:self];
  }
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29128]);
    v5 = [(HibernatedTab *)self uuidString];
    v6 = (NSUUID *)[v4 initWithUUIDString:v5];
    id v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (NSString)uuidString
{
  return (NSString *)[(WBTab *)self->_wbTab uuid];
}

- (BOOL)isActive
{
  return 0;
}

- (BOOL)isShowingSystemStartPage
{
  return self->_url == 0;
}

- (BOOL)isBlank
{
  url = self->_url;
  if (!url) {
    return 1;
  }
  id v3 = extensionOverridenStartPageURLForTab(self);
  char v4 = [(NSURL *)url isEqual:v3];

  return v4;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return [(WBTab *)self->_wbTab isPrivateBrowsing];
}

- (int64_t)pageStatus
{
  if (self->_showingErrorPage) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)canSetPinned
{
  return 1;
}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    BOOL v3 = a3;
    self->_pinned = a3;
    -[TabBarItem setPinned:](self->_tabBarItem, "setPinned:");
    [(UnifiedTabBarItem *)self->_unifiedTabBarItem setPinned:v3];
    [(TabOverviewItem *)self->_tabOverviewItem setPinned:v3];
    [(TabDocumentCollectionItem *)self->_tabCollectionItem setPinned:v3];
    [(HibernatedTab *)self _notifyDidUpdateTabCollectionItem];
    if (v3)
    {
      objc_storeStrong((id *)&self->_pinnedURL, self->_url);
      v5 = [(HibernatedTab *)self title];
      pinnedTitle = self->_pinnedTitle;
      self->_pinnedTitle = v5;
    }
    else
    {
      pinnedURL = self->_pinnedURL;
      self->_pinnedURL = 0;

      pinnedTitle = self->_pinnedTitle;
      self->_pinnedTitle = 0;
    }
  }
}

- (void)loadURL:(id)a3 title:(id)a4 skipSyncableTabUpdates:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  self->_skipSyncableTabUpdates = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v11 = WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v19 = 134218499;
    uint64_t v20 = self;
    __int16 v21 = 2160;
    uint64_t v22 = 1752392040;
    __int16 v23 = 2117;
    id v24 = v8;
    _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_INFO, "Store deferred navigation: (hibernated tab: %p) %{sensitive, mask.hash}@", (uint8_t *)&v19, 0x20u);
  }
  self->_hasDeferredNavigation = 1;
  uint64_t v12 = (NSURL *)[v8 copy];
  url = self->_url;
  self->_url = v12;

  uint64_t v14 = (NSString *)[v9 copy];
  title = self->_title;
  self->_title = v14;

  [(HibernatedTab *)self updateTabTitle];
  [(HibernatedTab *)self updateTabIcon];
  uint64_t v16 = [WeakRetained tabCollectionViewProvider];
  v17 = [(HibernatedTab *)self uuid];
  [v16 removeSnapshotForTabWithUUID:v17];

  int v18 = [WeakRetained tabController];
  [v18 updateWBTabWithTab:self notify:0 persist:0];
}

- (void)restoreStateFromTab:(id)a3
{
  id v4 = a3;
  id v18 = [v4 localAttributes];
  v5 = [v18 queuedNavigation];
  v6 = [v18 sessionStateData];

  if (v6 && v5)
  {
    id v7 = (void *)MEMORY[0x1E4F1CB10];
    id v8 = [v5 objectForKeyedSubscript:@"url"];
    id v9 = [v7 URLWithString:v8];

    uint64_t v10 = [v5 objectForKeyedSubscript:@"title"];
    [(HibernatedTab *)self loadURL:v9 title:v10 skipSyncableTabUpdates:0];
  }
  -[HibernatedTab setPinned:](self, "setPinned:", [v4 isPinned]);
  v11 = [v4 pinnedTitle];
  uint64_t v12 = (NSString *)[v11 copy];
  pinnedTitle = self->_pinnedTitle;
  self->_pinnedTitle = v12;

  uint64_t v14 = [v4 pinnedURL];
  v15 = (NSURL *)[v14 copy];
  pinnedURL = self->_pinnedURL;
  self->_pinnedURL = v15;

  wbTab = self->_wbTab;
  self->_wbTab = (WBTab *)v4;
}

- (id)tabUpdateBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__HibernatedTab_tabUpdateBlock__block_invoke;
  v4[3] = &unk_1E6D7B510;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1E4E42950](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __31__HibernatedTab_tabUpdateBlock__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[24])
    {
      [v8 setPinned:WeakRetained[73] title:*((void *)WeakRetained + 14) url:*((void *)WeakRetained + 15)];
    }
    else
    {
      WeakRetained[24] = 1;
      id v5 = [WeakRetained _localAttributes];
      [v8 setLocalAttributes:v5];

      v6 = [v4 _titleForStatePersistingForTabGroupTab];
      id v7 = [v4 urlForStatePersisting];
      if (v7 && v4[25])
      {
        [v8 setLocalTitle:v6];
        [v8 setLocalURL:v7];
      }
      [v8 setPinned:v4[73] title:*((void *)v4 + 14) url:*((void *)v4 + 15)];
    }
  }
}

- (id)_localAttributes
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_lastViewedTime];
  if (self->_hasDeferredNavigation)
  {
    v12[0] = @"url";
    uint64_t v4 = [(NSURL *)self->_url absoluteString];
    id v5 = (void *)v4;
    title = (NSString *)&stru_1F3C268E8;
    if (v4) {
      id v7 = (__CFString *)v4;
    }
    else {
      id v7 = &stru_1F3C268E8;
    }
    v12[1] = @"title";
    v13[0] = v7;
    if (self->_title) {
      title = self->_title;
    }
    v13[1] = title;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(WBTab *)self->_wbTab localAttributes];
  uint64_t v10 = [v9 localAttributesWithLastVisitTime:v3 queuedNavigation:v8];

  return v10;
}

- (WBSCloudTab)cloudTab
{
  id v3 = objc_alloc(MEMORY[0x1E4F98A40]);
  uint64_t v4 = [(HibernatedTab *)self urlForCloudTab];
  id v5 = (void *)[v3 initWithURL:v4];

  v6 = [(HibernatedTab *)self uuid];
  [v5 setUuid:v6];

  id v7 = [(HibernatedTab *)self titleForCloudTab];
  [v5 setTitle:v7];

  id v8 = [(WBTab *)self->_wbTab localAttributes];
  objc_msgSend(v5, "setShowingReader:", objc_msgSend(v8, "isShowingReader"));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v10 = [WeakRetained windowState];
  v11 = [v10 sceneID];
  [v5 setSceneID:v11];

  [v5 setLastViewedTime:self->_lastViewedTime];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F98A28]) initWithParameters:v5];

  return (WBSCloudTab *)v12;
}

- (SFTabStateData)tabStateData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F783E0]);
  uint64_t v4 = [(HibernatedTab *)self urlForStatePersisting];
  uint64_t v5 = objc_msgSend(v4, "safari_originalDataAsString");
  v6 = (void *)v5;
  id v7 = &stru_1F3C268E8;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  id v8 = v7;

  id v9 = [(HibernatedTab *)self uuid];
  uint64_t v10 = [v9 UUIDString];
  [v3 setUUIDString:v10];

  v11 = [(HibernatedTab *)self _titleForStatePersistingForTabStateData];
  [v3 setTitle:v11];

  [v3 setUrl:v8];
  uint64_t v12 = [(WBTab *)self->_wbTab localAttributes];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (self->_hasDeferredNavigation)
  {
    [v3 setUserVisibleURL:v8];
    [v3 setLastViewedTime:-1.0];
    [v3 setReadingListBookmarkID:0];
    [v3 setShowingReader:0];
    [v3 setReaderViewTopScrollOffset:0];
    [v3 setDisplayingStandaloneImage:0];
    uint64_t v14 = 0;
  }
  else
  {
    if ([v4 isFileURL])
    {
      v15 = [(HibernatedTab *)self urlString];
      [v3 setUserVisibleURL:v15];
    }
    else
    {
      [v3 setUserVisibleURL:v8];
    }
    [(HibernatedTab *)self lastActivationTime];
    objc_msgSend(v3, "setLastViewedTime:");
    objc_msgSend(v3, "setReadingListBookmarkID:", objc_msgSend(v12, "readingListBookmarkID"));
    objc_msgSend(v3, "setShowingReader:", objc_msgSend(v12, "isShowingReader"));
    [v12 readerViewTopScrollOffset];
    [v3 setReaderViewTopScrollOffset:(uint64_t)v16];
    objc_msgSend(v3, "setDisplayingStandaloneImage:", objc_msgSend(v12, "isDisplayingStandaloneImage"));
    uint64_t v14 = [v12 wasOpenedFromLink];
  }
  [v3 setWasOpenedFromLink:v14];
  objc_msgSend(v3, "setPrivateBrowsing:", -[HibernatedTab isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
  v17 = [v12 sessionStateData];
  [v3 setSessionStateData:v17];

  id v18 = [WeakRetained UUID];
  int v19 = [v18 UUIDString];
  [v3 setOwningBrowserWindowUUIDString:v19];

  objc_msgSend(v3, "setOrderIndex:", objc_msgSend(WeakRetained, "orderIndexForTab:", self));
  uint64_t v20 = [v3 sessionStateData];
  objc_msgSend(v3, "setUncompressedSessionStateDataSize:", objc_msgSend(v20, "length"));

  __int16 v21 = [(WBTab *)self->_wbTab tabGroupUUID];
  [v3 setTabGroupUUID:v21];

  uint64_t v22 = [WeakRetained effectiveProfileIdentifier];
  [v3 setProfileIdentifier:v22];

  return (SFTabStateData *)v3;
}

- (void)updateAncestryWithParentTab:(id)a3
{
  id v4 = a3;
  id v8 = [v4 ancestorUUIDs];
  uint64_t v5 = [v4 uuid];

  v6 = [v8 arrayByAddingObject:v5];
  ancestorUUIDs = self->_ancestorUUIDs;
  self->_ancestorUUIDs = v6;
}

- (SFNavigationBarItem)navigationBarItem
{
  cachedNavigationBarItem = self->_cachedNavigationBarItem;
  if (!cachedNavigationBarItem)
  {
    id v4 = (SFNavigationBarItem *)objc_alloc_init(MEMORY[0x1E4F782E8]);
    uint64_t v5 = self->_cachedNavigationBarItem;
    self->_cachedNavigationBarItem = v4;

    [(HibernatedTab *)self _updateNavigationBarItem];
    cachedNavigationBarItem = self->_cachedNavigationBarItem;
  }
  return cachedNavigationBarItem;
}

- (void)_updateNavigationBarItem
{
  if ([(HibernatedTab *)self isBlank])
  {
    uint64_t v3 = 0;
  }
  else if ([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 2;
  }
  [(SFNavigationBarItem *)self->_cachedNavigationBarItem setLockdownModeAnnotation:v3];
  id v14 = [(HibernatedTab *)self urlString];
  if ([(NSURL *)self->_url safari_isSafariWebExtensionURL])
  {

    id v14 = 0;
  }
  id v4 = [MEMORY[0x1E4F3B060] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "defaultSearchEngineIfPopulatedForPrivateBrowsing:", -[HibernatedTab isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v7 = *MEMORY[0x1E4F3B1D8];
    [v6 removeObserver:self name:*MEMORY[0x1E4F3B1D8] object:0];

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__searchEngineControllerDidFinishPopulating_ name:v7 object:0];
  }
  id v9 = [v5 userVisibleQueryFromSearchURL:self->_url];
  objc_msgSend(v14, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(NSURL *)self->_url safari_isDataURL])
  {
    v11 = @"data:";
  }
  else
  {
    if (v9) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = v10;
    }
    v11 = v12;
  }
  [(SFNavigationBarItem *)self->_cachedNavigationBarItem setText:v11 textWhenExpanded:0 startIndex:0x7FFFFFFFFFFFFFFFLL];
  [(SFNavigationBarItem *)self->_cachedNavigationBarItem setShowsPageFormatButton:self->_url != 0];
  BOOL v13 = v11 == v9 || self->_url == 0;
  [(SFNavigationBarItem *)self->_cachedNavigationBarItem setShowsSearchIndicator:v13];
}

- (void)_searchEngineControllerDidFinishPopulating:(id)a3
{
  [(HibernatedTab *)self _updateNavigationBarItem];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F3B1D8] object:0];
}

- (id)topBarThemeForTabOverviewShowingThemeColor:(BOOL)a3
{
  if (a3) {
    themeColor = self->_themeColor;
  }
  else {
    themeColor = 0;
  }
  uint64_t v5 = themeColor;
  v6 = [(TabOverviewItem *)self->_tabOverviewItem cachedTopBarTheme];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v8 = [WeakRetained configuration];

  if (!v6
    || (uint64_t v9 = [v8 barTintStyle], v9 != objc_msgSend(v6, "tintStyle"))
    || ([v6 preferredBarTintColor],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = WBSIsEqual(),
        v10,
        (v11 & 1) == 0))
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F78548], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", objc_msgSend(v8, "barTintStyle"), v5, 0);

    [(TabOverviewItem *)self->_tabOverviewItem setCachedTopBarTheme:v12];
    v6 = (void *)v12;
  }

  return v6;
}

- (void)updateUsesDarkTheme
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v3 = [WeakRetained tabCollectionViewProvider];
  [v3 invalidateSnapshotForTab:self];
}

- (void)clearBrowserController
{
  p_browserController = &self->_browserController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v5 = [WeakRetained tabController];
  [v5 willLoseOwnershipOfTab:self];

  objc_storeWeak((id *)p_browserController, 0);
}

- (BOOL)isReusableForURL:(id)a3 webClipURL:(id)a4
{
  id v6 = a4;
  url = self->_url;
  id v8 = a3;
  uint64_t v9 = [(NSURL *)url _webkit_URLByRemovingFragment];
  LOBYTE(url) = [v9 isEqual:v8];

  if (url)
  {
    char v10 = 1;
  }
  else if (v6)
  {
    char v10 = [v9 isEqual:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)hasBeenInserted
{
  return 0;
}

- (NSArray)tabCollectionItems
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unifiedTabBarItem = self->_unifiedTabBarItem;
  tabOverviewItem = self->_tabOverviewItem;
  tabCollectionItem = self->_tabCollectionItem;
  id v8 = tabOverviewItem;
  if (unifiedTabBarItem)
  {
    tabBarItem = [(HibernatedTab *)self currentUnifiedTabBarItem];
  }
  else
  {
    tabBarItem = self->_tabBarItem;
  }
  uint64_t v9 = tabBarItem;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&tabCollectionItem count:3];
  if (unifiedTabBarItem) {

  }
  return (NSArray *)v5;
}

- (id)currentUnifiedTabBarItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = [WeakRetained tabBarManager];
  uint64_t v5 = [v4 displayMode];

  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v5 == 2)
  {
    uint64_t v7 = [(UnifiedTabBarItem *)unifiedTabBarItem secondaryItem];
  }
  else
  {
    uint64_t v7 = unifiedTabBarItem;
  }
  return v7;
}

- (void)resetTabViewItems
{
  uint64_t v3 = objc_alloc_init(TabDocumentCollectionItem);
  tabCollectionItem = self->_tabCollectionItem;
  self->_tabCollectionItem = v3;

  uint64_t v5 = [(HibernatedTab *)self uuid];
  [(TabDocumentCollectionItem *)self->_tabCollectionItem setUUID:v5];

  [(TabDocumentCollectionItem *)self->_tabCollectionItem setPinned:self->_pinned];
  id v10 = [(TabOverviewItem *)self->_tabOverviewItem icon];
  id v6 = [TabOverviewItem alloc];
  uint64_t v7 = [(HibernatedTab *)self uuid];
  id v8 = [(TabOverviewItem *)v6 initWithUUID:v7];
  tabOverviewItem = self->_tabOverviewItem;
  self->_tabOverviewItem = v8;

  [(TabOverviewItem *)self->_tabOverviewItem setPinned:self->_pinned];
  [(TabOverviewItem *)self->_tabOverviewItem setIcon:v10];
  [(HibernatedTab *)self updateTabTitle];
}

- (void)_notifyDidUpdateTabCollectionItem
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = objc_msgSend(WeakRetained, "tabCollectionViewProvider", 0);
  uint64_t v5 = [v4 tabCollectionViews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          char v11 = [(HibernatedTab *)self itemForTabCollectionView:v10];
          [v10 didUpdateItem:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)itemForTabCollectionView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tabOverviewItem = self->_tabOverviewItem;
LABEL_9:
    uint64_t v8 = tabOverviewItem;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tabOverviewItem = self->_tabBarItem;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    tabOverviewItem = self->_tabCollectionItem;
    goto LABEL_9;
  }
  int v6 = [v4 isStandalone];
  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v6)
  {
    uint64_t v8 = [(UnifiedTabBarItem *)unifiedTabBarItem secondaryItem];
  }
  else
  {
    uint64_t v8 = unifiedTabBarItem;
  }
LABEL_10:
  uint64_t v9 = v8;

  return v9;
}

- (void)updateTabIconWithDelay:(double)a3
{
  [(HibernatedTab *)self _cancelFaviconUpdate];
  objc_initWeak(&location, self);
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB00];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__HibernatedTab_updateTabIconWithDelay___block_invoke;
  v7[3] = &unk_1E6D7B538;
  objc_copyWeak(&v8, &location);
  int v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v7 block:a3];
  objc_storeWeak((id *)&self->_updateFaviconTimer, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__HibernatedTab_updateTabIconWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateTabIcon];
}

- (void)_cancelFaviconUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateFaviconTimer);
  if (([WeakRetained isValid] & 1) != 0 || self->_faviconToken)
  {
    cachedURLForIconUpdate = self->_cachedURLForIconUpdate;
    self->_cachedURLForIconUpdate = 0;
  }
  [WeakRetained invalidate];
  id v4 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  [v4 cancelRequestWithToken:self->_faviconToken];

  id faviconToken = self->_faviconToken;
  self->_id faviconToken = 0;
}

- (void)updateTabIcon
{
  p_cachedURLForIconUpdate = &self->_cachedURLForIconUpdate;
  if ([(NSURL *)self->_url isEqual:self->_cachedURLForIconUpdate]) {
    return;
  }
  [(HibernatedTab *)self _cancelFaviconUpdate];
  objc_storeStrong((id *)p_cachedURLForIconUpdate, self->_url);
  url = self->_url;
  if (url)
  {
    uint64_t v5 = [(NSURL *)url absoluteString];
    int v6 = [v5 isEqualToString:@"about:blank"];

    if (!v6)
    {
      if (![(NSURL *)self->_url safari_isSafariWebExtensionURL])
      {
        char v11 = (void *)[objc_alloc(MEMORY[0x1E4F98AE8]) initWithURL:self->_url iconSize:2 fallbackType:+[TabIconAndTitleView defaultTabIconSize]()];
        objc_initWeak(&location, self);
        long long v12 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __30__HibernatedTab_updateTabIcon__block_invoke;
        v16[3] = &unk_1E6D78D98;
        objc_copyWeak(&v17, &location);
        long long v13 = [v12 registerRequest:v11 priority:2 responseHandler:v16];
        id faviconToken = self->_faviconToken;
        self->_id faviconToken = v13;

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);

        return;
      }
      id v8 = [(HibernatedTab *)self webExtensionsController];
      uint64_t v9 = [(NSURL *)self->_url host];
      id v15 = [v8 webExtensionForBaseURIHost:v9];

      id v10 = [v15 icon];
      [(HibernatedTab *)self _setIcon:v10 isMonogram:0];

      goto LABEL_7;
    }
    uint64_t v7 = [MEMORY[0x1E4F78580] fallbackFavicon];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F78580] favoritesFavicon];
  }
  id v15 = (id)v7;
  [(HibernatedTab *)self _setIcon:v7 isMonogram:0];
LABEL_7:
}

void __30__HibernatedTab_updateTabIcon__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = v9;
    uint64_t v5 = [v4 favicon];
    int v6 = [WeakRetained browserController];
    uint64_t v7 = [v6 rootViewController];
    id v8 = [v7 tabBar];

    if (v8) {
      objc_msgSend(v5, "sf_registerFaviconForDarkUserInterfaceStyle");
    }
    objc_msgSend(WeakRetained, "_setIcon:isMonogram:", v5, objc_msgSend(v4, "faviconType") == 0);
  }
}

- (void)_setIcon:(id)a3 isMonogram:(BOOL)a4
{
  BOOL v4 = a4;
  tabBarItem = self->_tabBarItem;
  id v8 = a3;
  [(TabBarItem *)tabBarItem setIcon:v8];
  [(UnifiedTabBarItem *)self->_unifiedTabBarItem setIcon:v8];
  if (v4) {
    id v7 = 0;
  }
  else {
    id v7 = v8;
  }
  [(TabOverviewItem *)self->_tabOverviewItem setIcon:v7];
  [(TabDocumentCollectionItem *)self->_tabCollectionItem setIcon:v7];
}

- (void)updateTabTitle
{
  id v4 = [(TabDocumentCollectionItem *)self->_tabCollectionItem title];
  uint64_t v3 = [(HibernatedTab *)self titleForTabCollection];
  [(TabBarItem *)self->_tabBarItem setTitle:v3];
  [(UnifiedTabBarItem *)self->_unifiedTabBarItem setTitle:v3];
  [(TabOverviewItem *)self->_tabOverviewItem setTitle:v3];
  [(TabDocumentCollectionItem *)self->_tabCollectionItem setTitle:v3];
  if ((WBSIsEqual() & 1) == 0) {
    [(HibernatedTab *)self _notifyDidUpdateTabCollectionItem];
  }
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    BOOL v3 = a3;
    self->_unread = a3;
    -[TabBarItem setUnread:](self->_tabBarItem, "setUnread:");
    [(SFUnifiedTabBarItem *)self->_unifiedTabBarItem setUnread:v3];
    [(TabOverviewItem *)self->_tabOverviewItem setUnread:v3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained updateTabOverviewButton];
  }
}

- (void)setShareParticipants:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v6 copy];
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    [(TabBarItem *)self->_tabBarItem setShareParticipants:v6];
    [(SFUnifiedTabBarItem *)self->_unifiedTabBarItem setShareParticipants:v6];
    [(TabOverviewItem *)self->_tabOverviewItem setShareParticipants:v6];
  }
}

- (NSUUID)webClipID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(WBTab *)self->_wbTab localAttributes];
  uint64_t v5 = [v4 webClipIDString];
  id v6 = (void *)[v3 initWithUUIDString:v5];

  return (NSUUID *)v6;
}

- (id)readingListAddress
{
  id v3 = [(WBTab *)self->_wbTab localAttributes];
  uint64_t v4 = [v3 readingListBookmarkID];

  if ([(NSURL *)self->_url isFileURL]) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v8 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    id v7 = [v6 bookmarkWithID:v4];
    id v8 = [v7 address];
  }
  return v8;
}

- (id)urlString
{
  id v3 = [(HibernatedTab *)self readingListAddress];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSURL *)self->_url safari_userVisibleStringConsideringLongURLs];
  }
  id v6 = v5;

  return v6;
}

- (NSString)addressForNewBookmark
{
  v2 = [(HibernatedTab *)self urlForSharing];
  id v3 = objc_msgSend(v2, "safari_originalDataAsString");

  return (NSString *)v3;
}

- (id)urlForCloudTab
{
  if ([(NSURL *)self->_url isFileURL])
  {
    id v3 = [(HibernatedTab *)self urlString];
    objc_msgSend(v3, "safari_bestURLForUserTypedString");
    uint64_t v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = self->_url;
  }
  return v4;
}

- (NSURL)urlForSharing
{
  id v3 = [(HibernatedTab *)self readingListAddress];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  }
  else
  {
    uint64_t v4 = self->_url;
  }
  id v5 = v4;
  id v6 = [(HibernatedTab *)self titleForSharing];
  if (v6) {
    [(NSURL *)v5 _setTitle:v6];
  }

  return v5;
}

- (LPLinkMetadata)linkMetadataForSharing
{
  return 0;
}

- (id)urlForStatePersisting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL hasDeferredNavigation = self->_hasDeferredNavigation;
  url = self->_url;
  if (hasDeferredNavigation)
  {
    id v5 = url;
  }
  else
  {
    if ([(NSURL *)url safari_isSafariWebExtensionURL])
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = +[Application sharedApplication];
      id v7 = [v6 allWebExtensionsControllers];

      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) _persistentStateURLForExtensionURL:self->_url];
            if (v12)
            {
              long long v13 = (void *)v12;

              goto LABEL_15;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
    id v5 = self->_url;
  }
  long long v13 = v5;
LABEL_15:
  return v13;
}

- (NSString)title
{
  return (NSString *)[(HibernatedTab *)self _titleAllowURLStringFallback:0 allowUntitled:1];
}

- (NSString)titleForNewBookmark
{
  return (NSString *)[(HibernatedTab *)self _titleAllowURLStringFallback:0 allowUntitled:0];
}

- (id)titleForCloudTab
{
  return [(HibernatedTab *)self _titleAllowURLStringFallback:1 allowUntitled:1];
}

- (id)titleForTabCollection
{
  id v3 = [(WBTab *)self->_wbTab localAttributes];
  char v4 = [v3 isDisplayingStandaloneImage];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(HibernatedTab *)self _titleAllowURLStringFallback:1 allowUntitled:1];
  }
  return v5;
}

- (id)titleForSharing
{
  if (self->_showingErrorPage)
  {
    v2 = 0;
  }
  else
  {
    v2 = [(HibernatedTab *)self _titleAllowURLStringFallback:0 allowUntitled:0];
  }
  return v2;
}

- (id)_titleForStatePersistingForTabGroupTab
{
  id v3 = [(HibernatedTab *)self _titleAllowURLStringFallback:0 allowUntitled:0];
  if (![v3 length])
  {
    url = self->_url;
    if (url) {
      [(NSURL *)url safari_userVisibleHostWithoutWWWSubdomain];
    }
    else {
    uint64_t v5 = _WBSLocalizedString();
    }

    id v3 = (void *)v5;
  }
  id v6 = v3;

  return v6;
}

- (id)_titleForStatePersistingForTabStateData
{
  title = self->_title;
  if (self->_hasDeferredNavigation)
  {
    id v3 = title;
LABEL_3:
    char v4 = v3;
    goto LABEL_6;
  }
  if (!title)
  {
    id v3 = [(HibernatedTab *)self _titleAllowURLStringFallback:1 allowUntitled:0];
    goto LABEL_3;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B88], "safari_lockRelatedEmojiCharacterSet");
  char v4 = [(NSString *)title safari_stringByRemovingCharactersInSet:v5];

LABEL_6:
  return v4;
}

- (id)_titleAllowURLStringFallback:(BOOL)a3 allowUntitled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(NSString *)self->_title length])
  {
    id v7 = self->_title;
LABEL_3:
    uint64_t v8 = (__CFString *)v7;
    goto LABEL_4;
  }
  if (v5
    && ([(HibernatedTab *)self urlString],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    char v11 = [(HibernatedTab *)self urlString];
    objc_msgSend(v11, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      _WBSLocalizedString();
      id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    uint64_t v8 = &stru_1F3C268E8;
  }
LABEL_4:
  return v8;
}

- (NSURL)committedURL
{
  return 0;
}

- (BOOL)isLoading
{
  return 0;
}

- (NSArray)ancestorTabIdentifiers
{
  return (NSArray *)[(NSArray *)self->_ancestorUUIDs safari_mapObjectsUsingBlock:&__block_literal_global_57];
}

uint64_t __39__HibernatedTab_ancestorTabIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (NSString)windowIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v3 = [WeakRetained UUID];
  BOOL v4 = [v3 UUIDString];

  return (NSString *)v4;
}

- (BOOL)isPinnedTab
{
  return [(WBTab *)self->_wbTab isPinned];
}

- (double)lastActivationTime
{
  return self->_lastViewedTime;
}

- (SFWebExtensionsController)webExtensionsController
{
  id v3 = +[Application sharedApplication];
  BOOL v4 = [(HibernatedTab *)self isPrivateBrowsingEnabled];
  BOOL v5 = [(HibernatedTab *)self profile];
  id v6 = [v3 webExtensionsControllerForTabWithPrivateBrowsingEnabled:v4 profile:v5];

  return (SFWebExtensionsController *)v6;
}

- (WKWebView)webViewForExtensions
{
  return 0;
}

- (id)webViewsThatCanReceiveMessages
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (double)parentTabIDForWebExtensions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v4 = [WeakRetained tabController];
  BOOL v5 = [v4 originatingTabForTab:self];

  if (v5)
  {
    [v5 idForWebExtensions];
    double v7 = v6;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F99770];
  }

  return v7;
}

- (NSURL)urlForExtensions
{
  return self->_url;
}

- (NSURL)expectedOrCurrentURL
{
  return 0;
}

- (NSURL)pendingURLForWebExtensions
{
  return 0;
}

- (BOOL)isLoadingComplete
{
  return 1;
}

- (BOOL)isAudible
{
  return 0;
}

- (BOOL)isMuted
{
  return 0;
}

- (BOOL)isFrontmost
{
  return 0;
}

- (BOOL)isArticle
{
  return 0;
}

- (BOOL)isInReaderMode
{
  return 0;
}

- (CGSize)tabViewSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained webExtensionTabSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (WBSWebExtensionWindow)webExtensionWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v4 = [WeakRetained webExtensionWindowForTab:self];

  return (WBSWebExtensionWindow *)v4;
}

- (WBProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v3 = [WeakRetained effectiveProfile];

  return (WBProfile *)v3;
}

- (unint64_t)changedPropertiesForOnUpdatedWebExtensionEvent
{
  return 0;
}

- (double)zoomFactor
{
  return 1.0;
}

- (void)close
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v4 = [WeakRetained tabController];
  [v4 closeTab:self animated:1];

  id v5 = [MEMORY[0x1E4F98E50] sharedInstance];
  [v5 setTabNeedsSpotlightDeletion:self];
}

- (void)select
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v3 = [WeakRetained tabController];
  [v3 setActiveTab:self];
}

- (WBSTranslationContext)translationContext
{
  return 0;
}

- (unint64_t)indexInWindowForWebExtensionContext:(id)a3
{
  double v4 = [(HibernatedTab *)self webExtensionWindow];
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 webExtensionTabs];
    unint64_t v7 = [v6 indexOfObjectIdenticalTo:self];
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)parentTabForWebExtensionContext:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v5 = [WeakRetained tabController];
  double v6 = [v5 originatingTabForTab:self];

  return v6;
}

- (void)setPinned:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  [(HibernatedTab *)self setPinned:v5];
  v7[2](v7, 0);
}

- (void)setReaderModeShowing:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  if ([(HibernatedTab *)self isInReaderMode] != v5) {
    [(HibernatedTab *)self toggleReader];
  }
  v7[2](v7, 0);
}

- (void)setReaderModeActive:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  if ([(HibernatedTab *)self isInReaderMode] != v5) {
    [(HibernatedTab *)self toggleReader];
  }
  v7[2](v7, 0);
}

- (void)setMuted:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  if (v5) {
    [(HibernatedTab *)self mute];
  }
  else {
    [(HibernatedTab *)self unmute];
  }
  v7[2](v7, 0);
}

- (void)setZoomFactor:(double)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  unint64_t v7 = (void (**)(id, void))a5;
  [(HibernatedTab *)self setZoomFactor:a3];
  v7[2](v7, 0);
}

- (void)detectWebpageLocaleForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
}

- (void)loadURL:(id)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  unint64_t v7 = (void (**)(id, void))a5;
  [(HibernatedTab *)self loadURL:a3];
  v7[2](v7, 0);
}

- (void)reloadFromOrigin:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  if (v5) {
    [(HibernatedTab *)self reloadFromOrigin];
  }
  else {
    [(HibernatedTab *)self reload];
  }
  v7[2](v7, 0);
}

- (void)goBackForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  [(HibernatedTab *)self goBack];
  v5[2](v5, 0);
}

- (void)goForwardForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  [(HibernatedTab *)self goForward];
  v5[2](v5, 0);
}

- (void)activateForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  [(HibernatedTab *)self select];
  v5[2](v5, 0);
}

- (void)setSelected:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  if (v5) {
    [(HibernatedTab *)self select];
  }
  v7[2](v7, 0);
}

- (void)closeForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  BOOL v5 = (void (**)(id, void))a4;
  [(HibernatedTab *)self close];
  v5[2](v5, 0);
}

- (WBSSiriIntelligenceDonorTabData)tabDataForSpotlightDonation
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F98E68]);
  return (WBSSiriIntelligenceDonorTabData *)v2;
}

- (NSArray)ancestorUUIDs
{
  return self->_ancestorUUIDs;
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (WBTab)wbTab
{
  return self->_wbTab;
}

- (void)setWBTab:(id)a3
{
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (NSString)pinnedTitle
{
  return self->_pinnedTitle;
}

- (void)setPinnedTitle:(id)a3
{
}

- (NSURL)pinnedURL
{
  return self->_pinnedURL;
}

- (void)setPinnedURL:(id)a3
{
}

- (TabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (TabOverviewItem)tabOverviewItem
{
  return self->_tabOverviewItem;
}

- (UnifiedTabBarItem)unifiedTabBarItem
{
  return self->_unifiedTabBarItem;
}

- (TabDocumentCollectionItem)tabCollectionItem
{
  return self->_tabCollectionItem;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)shouldSelectOriginatingTabWhenClosed
{
  return self->_shouldSelectOriginatingTabWhenClosed;
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
}

- (BOOL)matchedLastSearch
{
  return self->_matchedLastSearch;
}

- (void)setMatchedLastSearch:(BOOL)a3
{
  self->_matchedLastSearch = a3;
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
{
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
}

- (BOOL)suppressWebExtensionEvents
{
  return self->_suppressWebExtensionEvents;
}

- (void)setSuppressWebExtensionEvents:(BOOL)a3
{
  self->_suppressWebExtensionEvents = a3;
}

- (double)idForWebExtensions
{
  return self->_idForWebExtensions;
}

- (WBSWebExtensionTabPosition)previousWebExtensionTabPosition
{
  return self->_previousWebExtensionTabPosition;
}

- (void)setPreviousWebExtensionTabPosition:(id)a3
{
}

- (SFNavigationBarItem)cachedNavigationBarItem
{
  return self->_cachedNavigationBarItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedNavigationBarItem, 0);
  objc_storeStrong((id *)&self->_previousWebExtensionTabPosition, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_tabCollectionItem, 0);
  objc_storeStrong((id *)&self->_unifiedTabBarItem, 0);
  objc_storeStrong((id *)&self->_tabOverviewItem, 0);
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_storeStrong((id *)&self->_pinnedURL, 0);
  objc_storeStrong((id *)&self->_pinnedTitle, 0);
  objc_storeStrong((id *)&self->_wbTab, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_ancestorUUIDs, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_destroyWeak((id *)&self->_updateFaviconTimer);
  objc_storeStrong(&self->_faviconToken, 0);
  objc_storeStrong((id *)&self->_cachedURLForIconUpdate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end