@interface BrowserController
+ (WKProcessPool)newProcessPool;
+ (void)_sendABGroupIdentifierToProcessPool:(uint64_t)a1;
+ (void)_sendABTestingEnabledStateToProcessPool:(uint64_t)a1;
- (ApplicationShortcutController)shortcutController;
- (BOOL)_animationsAreEnabled;
- (BOOL)_canScrollToTopInView:(uint64_t)a1;
- (BOOL)_hasPresentedViewController;
- (BOOL)_isInContinuousMode;
- (BOOL)_isScrolledToThresholdForContinuousPrefetching;
- (BOOL)_isTabBarShown;
- (BOOL)_isVerticallyConstrained;
- (BOOL)_shouldUseNarrowLayout;
- (BOOL)_showingTabDocumentWithURL;
- (BOOL)_tabViewCanSearchTabs;
- (BOOL)activeTabIsBlank;
- (BOOL)activeWebExtensionWindowIsFocused;
- (BOOL)activeWindowIsForeground;
- (BOOL)activityViewControllerSupportsDownloads:(id)a3;
- (BOOL)addBookmarkActivityCanSaveBookmarkChanges:(id)a3;
- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3;
- (BOOL)addReadingListBookmarkForCurrentTab;
- (BOOL)areCustomTabGroupsEnabled;
- (BOOL)avoidSnapshotOfActiveTabIfPossible;
- (BOOL)backgroundColorInTabBarEnabled;
- (BOOL)barManager:(id)a3 canHandleLongPressForBarItem:(int64_t)a4;
- (BOOL)browserViewControllerShouldFreezeWebViewUpdatesForSizeTransition:(id)a3;
- (BOOL)browserViewControllerShouldTemporarilyHideBottomToolbar:(id)a3;
- (BOOL)canAddToBookmarks;
- (BOOL)canAddToQuickNote;
- (BOOL)canAddToReadingList;
- (BOOL)canAutoFocusURLField;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canCloseActiveTab;
- (BOOL)canCloseTab;
- (BOOL)canCreateNewPrivateTab;
- (BOOL)canCreateNewTab;
- (BOOL)canFindOnTabWithUUID:(id)a3;
- (BOOL)canFocusNavigationBarURL;
- (BOOL)canHideBars;
- (BOOL)canMoveToTabGroup;
- (BOOL)canNavigateContinuousReadingListInDirection:(unint64_t)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformPostLaunchActions;
- (BOOL)canPrintCurrentTab;
- (BOOL)canReadActiveLanguage;
- (BOOL)canReadThis;
- (BOOL)canShowProfileInNavigationBar;
- (BOOL)canShowProfileInTabOverviewToolbar;
- (BOOL)canShowSidebar;
- (BOOL)canTogglePinningTab;
- (BOOL)canToggleVisibilityForView:(unint64_t)a3;
- (BOOL)catalogPopoverIsShowing;
- (BOOL)catalogViewControllerPresentingInPortraitAspectRatio:(id)a3;
- (BOOL)catalogViewControllerShouldRequestNetworkedSuggestions:(id)a3;
- (BOOL)catalogViewControllerShouldSuppressPopover:(id)a3;
- (BOOL)catalogViewControllerShouldUsePopoverForCompletions:(id)a3;
- (BOOL)catalogViewControllerUnifiedFieldCanBecomeFirstResponder:(id)a3;
- (BOOL)cloudTabsViewController:(id)a3 tabItem:(id)a4 matchesSearchText:(id)a5;
- (BOOL)currentTabIsPinned;
- (BOOL)dismissTransientUIAnimated:(BOOL)a3;
- (BOOL)dismissTransientUIAnimated:(BOOL)a3 options:(unint64_t)a4;
- (BOOL)dynamicBarAnimator:(id)a3 canTransitionToState:(int64_t)a4 byDraggingWithOffset:(double)a5;
- (BOOL)favoritesAreEmbedded;
- (BOOL)favoritesAreShowingInPopover;
- (BOOL)favoritesFieldShouldBeExpanded;
- (BOOL)favoritesFieldShouldBeExpandedForFavoritesState:(int64_t)a3;
- (BOOL)fullScreenInPortrait;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)getContextForCurrentPageWithCompletionHandler:(id)a3;
- (BOOL)hasDedicatedDownloadsToolbarItem;
- (BOOL)hasDedicatedExtensionsButton;
- (BOOL)hasDedicatedMediaStateButton;
- (BOOL)hasMultipleProfiles;
- (BOOL)hasUnviewedDownloads;
- (BOOL)interfaceFillsScreen;
- (BOOL)isAnyPageLoaded;
- (BOOL)isBackgrounded;
- (BOOL)isContinuousReadingDocument:(id)a3;
- (BOOL)isControlledByAutomation;
- (BOOL)isFavoritesFieldFocused;
- (BOOL)isInDefaultProfile;
- (BOOL)isPresentingModalBookmarksController;
- (BOOL)isPrivateBrowsingAvailable;
- (BOOL)isPrivateBrowsingEnabled;
- (BOOL)isReaderAvailable;
- (BOOL)isReaderViewStale;
- (BOOL)isShowingAppInfoOverlay;
- (BOOL)isShowingCompletionDetail;
- (BOOL)isShowingContinuousReadingList;
- (BOOL)isShowingFavorites;
- (BOOL)isShowingInOneThirdMode;
- (BOOL)isShowingPrivateTabs;
- (BOOL)isShowingReader;
- (BOOL)isShowingStartPage;
- (BOOL)isSuspendedOrSuspending;
- (BOOL)isViewVisible:(unint64_t)a3;
- (BOOL)keepBarsMinimized;
- (BOOL)overridesUndoManagerForClosedTabs;
- (BOOL)previewController:(id)a3 shouldOpenURL:(id)a4 forPreviewItem:(id)a5;
- (BOOL)readerShouldBeShownIfPossible;
- (BOOL)readerViewIsVisibleForMailContentProvider:(id)a3;
- (BOOL)saveToFilesOperationSupportsDownloads:(id)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldDeferHistoryUpdatesForWKWebView:(id)a3;
- (BOOL)shouldIncreaseTopSpacingForStartPageController:(id)a3;
- (BOOL)shouldKeepKeyboardFocused;
- (BOOL)shouldReportUnifiedTabBarAnalytics;
- (BOOL)shouldShowListeningControls;
- (BOOL)shouldShowTurnOnLockedPrivateBrowsingSheet;
- (BOOL)shouldShowWhatsNewInPrivateBrowsingSheet;
- (BOOL)shouldSnapshotActiveTab;
- (BOOL)shouldStayInFocusedTabGroupForExternalLinks;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)showDemoModeFeatureDisabledAlert;
- (BOOL)supportsPrivacyReport;
- (BOOL)supportsSiriReadThis;
- (BOOL)suppressWebExtensionEvents;
- (BOOL)tabBarIsCurrentlyScrollable;
- (BOOL)tabDocument:(id)a3 canShowDownload:(id)a4;
- (BOOL)tabDocumentCanBecomeCurrentUserActivity:(id)a3;
- (BOOL)tabDocumentCanBeginInputSessionForStreamlinedLogin:(id)a3;
- (BOOL)tabDocumentCanCloseWindow:(id)a3;
- (BOOL)tabDocumentCanDisplayModalUI:(id)a3;
- (BOOL)tabDocumentCanDownloadFile:(id)a3;
- (BOOL)tabDocumentCanFindNextOrPrevious:(id)a3;
- (BOOL)tabDocumentCanRedirectToExternalApplication:(id)a3;
- (BOOL)tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:(id)a3;
- (BOOL)tabDocumentIsBackgroundPreloading:(id)a3;
- (BOOL)tabDocumentShouldDeferAppBannerRemoval:(id)a3;
- (BOOL)tabDocumentShouldFillStringForFind:(id)a3;
- (BOOL)tabDocumentShouldHandleAuthentication:(id)a3;
- (BOOL)tabDocumentShouldHandleCertificateError:(id)a3;
- (BOOL)tabItem:(id)a3 matchesSearchText:(id)a4;
- (BOOL)tabViewPinchActive;
- (BOOL)tabsShowOnlyIcons;
- (BOOL)usesNarrowLayout;
- (BOOL)usesTabBar;
- (BOOL)wantsUnifiedFieldFocused;
- (BannerController)bannerController;
- (BookmarksNavigationController)_newModalBookmarksControllerWithCollection:(uint64_t)a3 showsOnlyActiveCollection:;
- (BookmarksNavigationController)bookmarksNavigationController;
- (BrowserController)initWithStateData:(id)a3 browserWindowController:(id)a4 savedState:(id)a5 controlledByAutomation:(BOOL)a6;
- (BrowserController)initWithUUID:(id)a3 sceneID:(id)a4 browserWindowController:(id)a5 tabGroupManager:(id)a6 controlledByAutomation:(BOOL)a7;
- (BrowserController)initWithWindowState:(id)a3 browserWindowController:(id)a4 tabGroupManager:(id)a5;
- (BrowserController)initWithWindowState:(id)a3 browserWindowController:(id)a4 tabGroupManager:(id)a5 controlledByAutomation:(BOOL)a6;
- (BrowserRootViewController)rootViewController;
- (BrowserWindowController)browserWindowController;
- (CGRect)webExtensionWindowGeometry;
- (CGSize)webExtensionTabSize;
- (CGSize)windowSize;
- (ContinuousReadingController)continuousReadingController;
- (LibraryController)libraryController;
- (LoadProgressObserver)loadProgressObserver;
- (NSArray)preferredFocusEnvironments;
- (NSArray)tabDocumentsForActiveTabThatCanReceiveMessages;
- (NSArray)webExtensionWindows;
- (NSString)activeLibraryType;
- (NSString)activeProfileIdentifier;
- (NSString)currentBookmarksCollection;
- (NSString)effectiveProfileIdentifier;
- (NSString)extractedArticleText;
- (NSUUID)UUID;
- (NSUUID)appIntentRequestIdentifier;
- (SFSiriLinkCoordinator)siriLinkCoordinator;
- (SidebarUIProxy)sidebarUIProxy;
- (TabBarManager)tabBarManager;
- (TabCollectionViewProviding)tabCollectionViewProvider;
- (TabController)tabController;
- (TabDocument)cachedDocumentOnContinuousTransition;
- (TabDocument)nextContinuousItemDocument;
- (TabDocument)previousContinuousItemDocument;
- (TabDocument)speculativeLoadDocument;
- (TabDocument)tabDocumentPlayingPIPVideo;
- (TabGroupProvider)tabGroupProvider;
- (TabHoverPreview)tabHoverPreview;
- (UIAction)sidebarAction;
- (UIEdgeInsets)finalObscuredInsetsForScrollView:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (UIPinchGestureRecognizer)tabViewPinchRecognizer;
- (UITextRange)textRangeToRestoreAfterCompletionDetailIsDismissed;
- (UIViewController)viewControllerToPresentFrom;
- (UIWindowScene)scene;
- (UnifiedField)unifiedField;
- (UniversalSearchSession)universalSearchSession;
- (UserActivityController)userActivityController;
- (WBProfile)activeProfile;
- (WBProfile)effectiveProfile;
- (WBSAppReviewPromptManager)appReviewPromptManager;
- (WBSCloudTabDeviceProvider)cloudTabStore;
- (WBSDigitalHealthManager)digitalHealthManager;
- (WBSWebExtensionTab)activeTabForExtensions;
- (WBSWebExtensionWindow)activeWebExtensionWindow;
- (WBTabGroup)unnamedTabGroup;
- (WBTabGroupManager)tabGroupManager;
- (WBWindowState)windowState;
- (WKPreferences)wkPreferences;
- (WKProcessPool)processPool;
- (_SFActivityViewController)presentedActivityViewController;
- (_SFBarManager)barManager;
- (_SFBrowserConfiguration)configuration;
- (_SFBrowserDocument)activeDocument;
- (_SFBrowserSavedState)savedState;
- (_SFBrowserWindowStateData)windowStateData;
- (_SFPageFormatMenuController)pageFormatMenuController;
- (_SFPageZoomPreferenceManager)pageZoomManager;
- (_SFPerSitePreferencesVendor)perSitePreferencesVendor;
- (_SFSearchEngineInfo)activeSearchEngine;
- (_SFWebView)webView;
- (double)_frameForCurrentPageBannerView;
- (double)_frameForScreenTimeOverlayViewControllerView;
- (double)_offsetToPositionToastViewControllerOffscreen:(uint64_t)a1;
- (double)_popoverPresentationVerticalOffset;
- (double)_refreshControlHeight;
- (double)_verticalOffsetForContinuousReadingBanner;
- (double)additionalContentHeightForBanners;
- (double)browserViewController:(id)a3 adjustedBottomContentInset:(double)a4;
- (double)browserViewController:(id)a3 adjustedBottomObscuredInset:(double)a4;
- (double)browserViewController:(id)a3 adjustedTopObscuredInsetForBanners:(double)a4;
- (double)catalogViewControllerPopoverMaxHeight:(id)a3;
- (double)catalogViewControllerPopoverWidth:(id)a3;
- (double)continuousReadingViewControllerNextWebViewLandingOffset:(id)a3 includeBottomBar:(BOOL)a4;
- (double)dynamicBarAnimator:(id)a3 minimumTopBarHeightForOffset:(double)a4;
- (double)verticalScrollOffsetForReaderViewInTabDocument:(id)a3;
- (float)zoomScale;
- (id)_addAllTabsToBookmarksLabel;
- (id)_bookmarksNavigationController;
- (id)_cachedDocumentForContinuousReadingItem:(void *)a1;
- (id)_catalogViewController;
- (id)_closeAllTabsLabel;
- (id)_closeAllTabsMatchingSearchLabel;
- (id)_discoverabilityTitleForCommandTapModifierFollowingUserPreference:(uint64_t)a1;
- (id)_findCommandTitle;
- (id)_formatMenuButtonPopoverSourceInfo;
- (id)_lastClosedTabStateData;
- (id)_navigationControllerForTabGroupPicker;
- (id)_nonBlankCurrentTabs;
- (id)_openURLNavigationIntentForSceneConnectionOptions:(uint64_t)a1;
- (id)_participantsListForCollaborationView:(id *)a1;
- (id)_popoverSourceInfoForBarItem:(id *)a1;
- (id)_screenTimeHostingViewControllerForTabDocument:(id *)a1;
- (id)_screenTimeOverlayViewControllerForTabDocument:(id *)a1;
- (id)_sidebarViewController;
- (id)_stringByRemovingContentBetweenZeroWidthSpacesForText:(uint64_t)a1;
- (id)_tabDocumentForNextContinuousItem;
- (id)_titleForToggleBookmarksKeyCommand;
- (id)_titleForToggleCloudTabsKeyCommand;
- (id)_titleForToggleFavoritesBarKeyCommand;
- (id)_titleForToggleHistoryKeyCommand;
- (id)_titleForToggleReadingListKeyCommand;
- (id)_titleForToggleSharedWithYouKeyCommand;
- (id)_titleForToggleWebpageStatusBar;
- (id)_topContinuousReadingBanner;
- (id)_topNavigationBar;
- (id)_updateContinuousReadingViewControllerFrame;
- (id)_visibleAppBanner;
- (id)activeTabUUIDString;
- (id)activityItemsConfiguration;
- (id)addBookmarkActivityTabGroupProvider;
- (id)animationPendingDynamicBarAnimatorSteadyState;
- (id)barManager:(id)a3 visibleBarItemsForLayout:(int64_t)a4 availableItems:(id)a5;
- (id)bookmarksNavigationControllerCurrentContinuousReadingItem:(id)a3;
- (id)borrowContentViewControllerForTab:(id)a3;
- (id)borrowContentViewForTab:(id)a3 withTopBackdropView:(id *)a4 ofHeight:(double)a5;
- (id)catalogViewControllerStartPageVisualStyleProvider:(id)a3;
- (id)contentContainerView;
- (id)continuousReadingViewControllerForBrowserViewController:(id)a3;
- (id)createCatalogViewControllerIfNeeded;
- (id)createNewTabGroupWithTitle:(id)a3;
- (id)currentContentUUIDForNavigationBar:(id)a3;
- (id)detachFromScene;
- (id)downloadsViewControllerForActionPanel:(id)a3;
- (id)existingUnnamedTabGroupForProfileWithIdentifier:(id)a3;
- (id)intentSceneConfigurationCompletion;
- (id)itemProviderForNavigationBar:(id)a3;
- (id)itemTitleForCloudSharingController:(id)a3;
- (id)linkPreviewViewControllerForNavigationIntent:(id)a3;
- (id)linkPreviewViewControllerForURL:(id)a3;
- (id)loadURLInNewTab:(id)a3 inBackground:(BOOL)a4;
- (id)loadURLInNewTab:(id)a3 inBackground:(BOOL)a4 animated:(BOOL)a5;
- (id)loadURLInNewTab:(id)a3 title:(id)a4 UUID:(id)a5 inBackground:(BOOL)a6 animated:(BOOL)a7 restoringCloudTab:(BOOL)a8;
- (id)makeSidebarButton;
- (id)makeTabOverview;
- (id)moveMenuOnPageMenuWithDismissHandler:(id)a3;
- (id)navigationBarURLForSharing:(id)a3;
- (id)newCollaborationButton;
- (id)newCollaborationButtonWithActiveTabGroup:(id)a3 existingShare:(id)a4;
- (id)nextResponder;
- (id)pageZoomPreferenceManagerForTabDocument:(id)a3;
- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4;
- (id)printControllerForContentProvider:(id)a3;
- (id)readerControllerForMailContentProvider:(id)a3;
- (id)showTabGroupPicker:(id)a3;
- (id)sidebarContentViewControllerForSidebarUIProxy:(id)a3;
- (id)tabContentContainerView;
- (id)undoManager;
- (id)webExtensionWindowForTab:(id)a3;
- (id)webExtensionWindowWithID:(double)a3;
- (id)webViewForMailContentProvider:(id)a3;
- (id)windowScene:(id *)a1 performActionForShortcutItem:completionHandler:;
- (int64_t)_bookmarksPresentationStyle;
- (int64_t)analyticsLayoutProvenance;
- (int64_t)bookmarksPresentationStyleForViewOfSize:(CGSize)a3;
- (int64_t)browserPersonaForActivityViewController:(id)a3;
- (int64_t)browserViewController:(id)a3 sidebarStyleForViewSize:(CGSize)a4;
- (int64_t)browserViewController:(id)a3 toolbarPlacementForViewSize:(CGSize)a4;
- (int64_t)dataOwnerForNavigationBar:(id)a3;
- (int64_t)favoritesState;
- (int64_t)idOfParsecQueryOriginatingFromSearchSuggestion;
- (int64_t)orderIndexForTab:(id)a3;
- (int64_t)overrideBarTintStyleForUnifiedBar;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (int64_t)siriReaderPlaybackStateForActiveTab;
- (int64_t)tabBarDisplayMode;
- (int64_t)unifiedTabBarLayoutStyle;
- (int64_t)updatePolicyForStartPageController:(id)a3;
- (uint64_t)_bookmarksBarLabelButtonDisplayStyle;
- (uint64_t)_canPrintForTabDocument:(uint64_t)a1;
- (uint64_t)_canSaveWebpage;
- (uint64_t)_canUpdateInterfaceWithTabDocument:(uint64_t)a1;
- (uint64_t)_commitSpeculativeLoadForURL:(uint64_t)a1;
- (uint64_t)_currentBarContentMode;
- (uint64_t)_currentlyEditingText;
- (uint64_t)_dismissTransientUIAnimated:(uint64_t)a3 dismissalOptions:(void *)a4 completionHandler:;
- (uint64_t)_isReaderModeFormatMenuItemAvailable;
- (uint64_t)_isShowingCollectionInSidebar:(id *)a1;
- (uint64_t)_isStartPageOverriddenByExtensionInTabDocument:(uint64_t)a1;
- (uint64_t)_isTabDocumentFrontMostForDigitalHealth:(uint64_t)a1;
- (uint64_t)_isWindowLockedForPrivateBrowsing;
- (uint64_t)_notFocusedEmbeddedState;
- (uint64_t)_obscuredInsetsIncludeRefreshControl;
- (uint64_t)_prefersShowingBookmarksBar;
- (uint64_t)_setShowingOverlayForBanner:(int)a3 showing:;
- (uint64_t)_shareButtonEnabled;
- (uint64_t)_shouldHideBarsForSizeChange;
- (uint64_t)_shouldHideCatalogViewControllerForSizeChange;
- (uint64_t)_shouldPresentViewControllerUsingAdaptivePopover:(uint64_t)IsPad;
- (uint64_t)_shouldShowBackgroundViewForTabDocument:(uint64_t)a1;
- (uint64_t)_shouldShowBarsForSizeChange;
- (uint64_t)_shouldShowBookmarksBar;
- (uint64_t)_shouldShowBookmarksBarForViewSize:(uint64_t)a1;
- (uint64_t)_shouldShowNewReadingListBehaviorAlert;
- (uint64_t)_shouldShowSidebarForSizeChange;
- (uint64_t)_shouldShowSidebarForSizeChangeToSize:(double)a3;
- (uint64_t)_shouldShowTabGroupSwitcher;
- (uint64_t)_shouldUseTabBar;
- (uint64_t)_spawnNewTabFromPinnedTabIfNeededForSpeculativeDocument:(uint64_t)a1;
- (uint64_t)_tabIndexForKeyCommand:(uint64_t)a1;
- (uint64_t)_updateConfiguration;
- (uint64_t)_updateDisableBarHiding;
- (uint64_t)_updateLibraryTypeForNewDocument;
- (uint64_t)_wantsURLFieldAutoFocus;
- (uint64_t)handleOpenURLContextsForReadingListWidget:(void *)a1;
- (uint64_t)shouldShowSidebarInLandscape;
- (unint64_t)_shouldShowTabBar;
- (unint64_t)downloadsCount;
- (unint64_t)numberOfTabsInCurrentTabBar;
- (unint64_t)popUpPolicyForTabDocument:(id)a3;
- (void)_ABGroupIdentifierDidChange:(id)a3;
- (void)_actuallyPresentToastViewController:(uint64_t)a1;
- (void)_addBookmarkForCurrentTabKeyPressed:(id *)a1;
- (void)_addBookmarkForCurrentTabKeyPressed:(void *)a3 title:;
- (void)_addBookmarkForCurrentTabKeyPressed:(void *)a3 title:(int)a4 addToFavorites:;
- (void)_addInteractionsForTabBar:(uint64_t)a1;
- (void)_automaticPasswordInputViewAutoFillContextProviderRequiredNotification:(id)a3;
- (void)_automaticPasswordInputViewNotification:(id)a3;
- (void)_backgroundImageFileModifiedRemotely:(id)a3;
- (void)_backgroundImageNeedsCloudKitUpdate:(id)a3;
- (void)_beganSharingTabGroup:(id)a3;
- (void)_bookmarksDidReload:(id)a3;
- (void)_cancelContentScrollGestures;
- (void)_cancelPendingAutoFillInternalFeedbackToastDismissal;
- (void)_cancelSpeculativeLoadForDocument:(uint64_t)a1;
- (void)_checkWebViewVisibilityAfterExitingTabView;
- (void)_clearNextContinuousItemDocument;
- (void)_clearPreviousContinuousItemDocument;
- (void)_closePreviewDocumentTimerFired:(id)a3;
- (void)_closeSpeculativelyLoadedDocument:(uint64_t)a1;
- (void)_commitToSpeculativeLoad;
- (void)_commitToSpeculativeLoadForDocument:(id *)a1;
- (void)_commitToTabDocumentForNextContinuousItem;
- (void)_commitToTabDocumentForPreviousContinuousItem;
- (void)_completionItem:(void *)a3 wasAcceptedForString:;
- (void)_contentBlockersPerSitePreferenceDidChange:(id)a3;
- (void)_contentContainerViewFrameDidChange;
- (void)_deactivateTabViewIfNeededForEvent:(uint64_t)a1;
- (void)_debugAutoFillConsoleLoggingEnabledPreferenceDidChange:(id)a3;
- (void)_defaultSearchEngineDidChange:(id)a3;
- (void)_didChangePowerState;
- (void)_didChangeToFirstResponder:(id)a3;
- (void)_didDismissManageExtensionsViewController:(id)a3;
- (void)_dismissAutoFillInternalFeedbackToast:(id *)a1;
- (void)_doSearch:(void *)a1;
- (void)_downloadManagerDidFinishLastDownload:(id)a3;
- (void)_downloadsDidChange:(id)a3;
- (void)_downloadsTotalProgressDidChange:(id)a3;
- (void)_emailCurrentPageWithPreferredContentType:(uint64_t)a1;
- (void)_enterYttriumStateTimerFired;
- (void)_extractTextFromReaderWebViewOfTab:(uint64_t)a1;
- (void)_flushPendingSnapshotsDidComplete;
- (void)_focusNavigationBarForVoiceSearch:(void *)a3 completionHandler:;
- (void)_focusNavigationBarWithCompletionHandler:(unsigned char *)a1;
- (void)_fullyRemoveDigitalHealthTreatmentForTabDocumentIfNecessary:(id *)a1;
- (void)_goBackAllowingNewTabToSpawnIfNeeded:(id *)a1;
- (void)_goForwardAllowingNewTabToSpawnIfNeeded:(id *)a1;
- (void)_hasUnviewedDownloadsDidChange:(id)a3;
- (void)_hideCrashBanner;
- (void)_hideDigitalHealthOverlayForTabDocument:(id *)a1;
- (void)_initSubviews;
- (void)_insertScreenTimeLockoutShieldIntoContentViewForTab:(uint64_t)a3 animated:;
- (void)_invalidatePreviewDocumentCloseTimer;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_loadAddressAsSpeculativeLoadIfNeeded:(void *)a1;
- (void)_loadIntentAsSpeculativeLoadIfNeeded:(void *)a1;
- (void)_loadPreviousContinuousDocumentIfNeeded;
- (void)_loadURL:(int)a3 inExternalApplication:(int)a4 forImageAttribution:;
- (void)_lockedPrivateBrowsingStateDidChange;
- (void)_logTabClosingWithEventSender:(uint64_t)a3 tabClosingAction:(uint64_t)a4 numberOfTabsClosed:;
- (void)_logTabClosingWithKeyboardShortcut:(uint64_t)a3 tabClosingAction:(uint64_t)a4 numberOfTabsClosed:;
- (void)_mailContentProvider;
- (void)_navigationGestureDidBegin;
- (void)_navigationGestureDidEndWithNavigation:(uint64_t)a1;
- (void)_navigationGestureWillEndWithNavigationToBackForwardListItem:(uint64_t)a1;
- (void)_newReadingListBehaviorAlertControllerWithCompletion:(void *)a1;
- (void)_observeInitializedWebKitFeatures;
- (void)_openDownload:(uint64_t)a1;
- (void)_pasteAndNavigate;
- (void)_perSiteAutomaticReaderActivationPreferenceDidChange:(id)a3;
- (void)_perSiteLockdownModePreferenceDidChange:(id)a3;
- (void)_perSitePageZoomPreferenceDidChange:(id)a3;
- (void)_perSitePreferencesDidChange:(id)a3;
- (void)_postUserDidAcceptCloudKitShareActivityNoticeWithMetadata:(uint64_t)a1;
- (void)_prepareExtensionsForEffectiveProfile;
- (void)_preparePreviousContinuousDocumentIfNeeded;
- (void)_prepareTabDocumentForNextContinuousItemIfNeeded;
- (void)_prepareToPresentActivityViewController;
- (void)_presentActionPanelIfReady;
- (void)_presentActivityViewController;
- (void)_presentAttributedSharedTabNoticeWithMessage:(void *)a3 forParticipantWithRecordID:(void *)a4 inSharedTabGroupWithUUID:;
- (void)_presentModalViewController:(id *)a1;
- (void)_presentModalViewController:(id)a3 fromBarItem:(int64_t)a4 completion:(id)a5;
- (void)_presentModalViewController:(uint64_t)a3 fromBarItem:(uint64_t)a4 animated:(void *)a5 completion:;
- (void)_presentModalViewController:(void *)a3 fromPopoverSource:(uint64_t)a4 useAdaptivePresentationInCompact:(uint64_t)a5 animated:(void *)a6 completion:;
- (void)_presentPendingViewControllerForActiveTab;
- (void)_presentReaderTriggeredAppReviewPromptIfNeeded;
- (void)_presentSaveWebpageViewController;
- (void)_presentSharedTabGroupErrorWithTitle:(void *)a3 message:;
- (void)_presentSharedTabGroupsPendingAcceptanceError;
- (void)_presentSharedTabGroupsUnsupportedError;
- (void)_presentToastViewControllerQueuingIfNecessary:(uint64_t)a1;
- (void)_pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded:(char)a3 positionOptions:(char)a4 isKeyboardShortcut:;
- (void)_previewDownloadInQuickLook:(void *)a3 url:(uint64_t)a4 isContentManaged:;
- (void)_profileWallpaperDidChange:(id)a3;
- (void)_readSavedState;
- (void)_readerButtonTapped;
- (void)_readerVisibilityDidChange;
- (void)_recordIgnoredSiriSuggestedSitesWithURL:(uint64_t)a1;
- (void)_reloadPresentedPreferencesListViewController;
- (void)_reloadProfileSwitcherIfNeeded;
- (void)_replaceActiveDocument:(void *)a3 withSpeculativeDocument:;
- (void)_requestActivationOfBrowserController:(id *)a1;
- (void)_requestQueryResultsOnTabDocument:(void *)a3 forText:(uint64_t)a4 contentType:(void *)a5 pageMetadata:;
- (void)_resetCapsuleMinimizationStyleIfNeeded;
- (void)_restoreDigitalHealthFunctionalityAfterAppTransition;
- (void)_rootViewControllerViewTransitionFromSize:(uint64_t)a1 includingSidebar:(int)a2 animated:(uint64_t)a3;
- (void)_sceneSession;
- (void)_scheduleAutoFillInternalFeedbackToastDismissal;
- (void)_searchTabs;
- (void)_sendPDFRepresentationForScreenshotWithTabDocument:(void *)a1;
- (void)_setContinuousReadingContentViewFromTabDocument:(int)a3 useReaderView:;
- (void)_setContinuousReadingPreviewView:(id *)a1;
- (void)_setNeedsSnapshotUpdateForActiveTab;
- (void)_setPresentingModalBookmarksController:(int)a3 exclusively:(void *)a4 importHandler:(void *)a5 withCollection:(void *)a6 bookmarkUUIDString:(uint64_t)a7 animated:(void *)a8 completion:;
- (void)_setProgressSuppressingDocument:(uint64_t)a1;
- (void)_setReaderVisible:(void *)a3 forTabDocument:(uint64_t)a4 deactivationMode:(char)a5 animated:;
- (void)_setSheetPresentationIfNeededForController:(uint64_t)a1;
- (void)_setShowBookmarksBar:(uint64_t)a1;
- (void)_setShowingAppBanner:(int)a3 isShowing:;
- (void)_setShowingPrivateBrowsingPrivacyProtectionsBanner:(int)a3 isShowing:;
- (void)_setShowingTabBar:(char)a3 animated:;
- (void)_setSidebarUIProxy:(uint64_t)a1;
- (void)_showDefaultBrowserSheetIfNecessary;
- (void)_showDigitalHealthOverlayForTabDocument:(uint64_t)a3 withPolicy:(uint64_t)a4 animated:;
- (void)_showLockedPrivateBrowsingViewIfNecessaryWithAuthentication:(id *)a1;
- (void)_showOrHideSidebarInLandscapeIfNecessary;
- (void)_showPrivateBrowsingExplanationSheetIfNecessary;
- (void)_showSummarizeButtonIfNeeded;
- (void)_siriReadThisMenuInvocation;
- (void)_siriReadThisVocalInvocation;
- (void)_startLoadDocument:(void *)a3 continuousReadingItem:;
- (void)_switchTabsByRelativeIndex:(void *)a3 withKeyCommand:;
- (void)_switchToCollectionOrToggleSidebar:(id *)a1;
- (void)_switchToCollectionOrToggleSidebar:(void *)a3 completion:;
- (void)_tabViewPinch:(id)a3;
- (void)_toggleDigitalHealthOverlayGivenOverlayStates:(void *)a3 forTabDocuments:;
- (void)_toggleVisibilityOfStartPageCollection:(uint64_t)a1;
- (void)_trialABGroupIdentifierDidChange:(id)a3;
- (void)_unhideCapsuleFromPageMenu;
- (void)_updateAddTabMenuProvider;
- (void)_updateAppInfoOverlayFrame;
- (void)_updateBookmarksMenuProvider;
- (void)_updateButtonsAnimatingTabBar:(uint64_t)a1;
- (void)_updateCurrentContinuousReadingItem;
- (void)_updateCurrentPageBannerView;
- (void)_updateCurrentPageBannerViewBeforeContinuousTransition;
- (void)_updateCurrentPageBannerViewIfNeeded;
- (void)_updateDigitalHealthOverlayAfterExitingTabSwitcher;
- (void)_updateDigitalHealthOverlayForTabDocuments:(void *)a1;
- (void)_updateDigitalHealthViewFrame;
- (void)_updateMediaCaptureConfiguration;
- (void)_updateNavigationBarSeparator;
- (void)_updateParticipantsListForCollaborationButton:(void *)a3 contacts:;
- (void)_updatePrivateBrowsingAvailability:(BOOL)a3;
- (void)_updateRefreshControlHeight;
- (void)_updateSceneTitle;
- (void)_updateScribbleOverlayIfNeeded;
- (void)_updateScrollOffsetForReplacementWebView:(id *)a1;
- (void)_updateSidebarStickinessAfterUserAction;
- (void)_updateSpeculativeLoadURL:(uint64_t)a1;
- (void)_updateTabGroupBanner;
- (void)_updateTabOverviewBarPlacement;
- (void)_updateUnifiedBar;
- (void)_updateUnifiedBarBackgroundVisibility;
- (void)_updateUsesNarrowLayout;
- (void)_voiceSearchAvailabilityDidChange:(id)a3;
- (void)actionPanel:(id)a3 prepareForMailActivityWithMailController:(id)a4 completionHandler:(id)a5;
- (void)actionPanelAddTabDocumentToReadingList:(id)a3 activityDidFinish:(id)a4;
- (void)activateWebClipWithID:(id)a3;
- (void)addAllTabsToBookmarks:(id)a3;
- (void)addBookmarkActivityFailedToAcquireBookmarkLock:(id)a3;
- (void)addBookmarkFolderForCurrentTabs;
- (void)addBookmarkFolderForTabs:(id)a3;
- (void)addBookmarkForCurrentTab;
- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5;
- (void)addToBookmarks:(id)a3;
- (void)addToFavorites;
- (void)addToQuickNote;
- (void)addToReadingList:(id)a3;
- (void)adoptSceneID:(id)a3;
- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6;
- (void)attachToScene:(id)a3;
- (void)authenticateToUnlockPrivateBrowsing;
- (void)autoFillFormKeyPressed;
- (void)autoFillInternalFeedbackActivityNotice:(id)a3 shouldPresentFeedbackForm:(BOOL)a4;
- (void)autoFillStateChangedMessageReceived;
- (void)barManager:(id)a3 didReceiveLongPressForBarItem:(int64_t)a4;
- (void)barManager:(id)a3 didReceiveTapForBarItem:(int64_t)a4;
- (void)barManager:(id)a3 didReceiveTouchDownForBarItem:(int64_t)a4;
- (void)barManager:(id)a3 willRegisterBarWithToken:(id)a4;
- (void)beginIgnoringUserInteraction:(id)a3;
- (void)beginTrackingDropSessionForTabBarVisibility:(id)a3;
- (void)bookmarksBarView:(id)a3 bookmarksNavigationControllerViewDidAppear:(id)a4;
- (void)bookmarksBarView:(id)a3 bookmarksNavigationControllerViewDidDisappear:(id)a4;
- (void)bookmarksNavigationController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5;
- (void)bookmarksNavigationController:(id)a3 updateReadingListUnreadFilterShowingAllBookmarks:(BOOL)a4;
- (void)bookmarksNavigationControllerContentDidBecomeDirty:(id)a3;
- (void)bookmarksNavigationControllerDidPressDoneButton:(id)a3;
- (void)bookmarksNavigationControllerReloadDidFail:(id)a3;
- (void)bookmarksNavigationControllerViewDidAppear:(id)a3;
- (void)bookmarksNavigationControllerViewDidDisappear:(id)a3;
- (void)browserViewController:(id)a3 didChangeShowingSidebar:(BOOL)a4;
- (void)browserViewController:(id)a3 didChangeSidebarStyle:(int64_t)a4;
- (void)browserViewController:(id)a3 didCreateNavigationBar:(id)a4;
- (void)browserViewController:(id)a3 didCreateToolbar:(id)a4;
- (void)browserViewController:(id)a3 didCreateUnifiedBar:(id)a4;
- (void)browserViewController:(id)a3 didUpdateBannerTheme:(id)a4;
- (void)browserViewController:(id)a3 traitCollectionDidChange:(id)a4;
- (void)browserViewControllerDidChangeBarInsets:(id)a3;
- (void)browserViewControllerDidChangeToolbarPlacement:(id)a3;
- (void)browserViewControllerDidLayOutSubviews:(id)a3;
- (void)cancelFavorites;
- (void)cancelFavoritesAnimated:(BOOL)a3;
- (void)cancelKeyPressed;
- (void)cancelSpeculativeLoad;
- (void)carrierBundledChanged;
- (void)catalogViewController:(id)a3 cacheSearchQueryID:(int64_t)a4;
- (void)catalogViewController:(id)a3 completionItem:(id)a4 wasAcceptedForString:(id)a5;
- (void)catalogViewController:(id)a3 didFinishVoiceSearchWithNavigation:(BOOL)a4;
- (void)catalogViewController:(id)a3 didPasteText:(id)a4;
- (void)catalogViewController:(id)a3 didSelectAddress:(id)a4;
- (void)catalogViewController:(id)a3 didSelectSearch:(id)a4;
- (void)catalogViewController:(id)a3 focusNextKeyView:(BOOL)a4;
- (void)catalogViewController:(id)a3 loadURL:(id)a4 inExternalApplication:(BOOL)a5 forImageAttribution:(BOOL)a6;
- (void)catalogViewController:(id)a3 mightSelectCompletionItem:(id)a4 forString:(id)a5;
- (void)catalogViewController:(id)a3 presentViewControllerWithinPopover:(id)a4 completionHandler:(id)a5;
- (void)catalogViewController:(id)a3 willPresentCustomizationViewController:(id)a4;
- (void)catalogViewController:(id)a3 willPresentDetailViewController:(id)a4;
- (void)catalogViewController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)catalogViewControllerDidAppear:(id)a3;
- (void)catalogViewControllerDidBeginEditing:(id)a3;
- (void)catalogViewControllerDidEndEditing:(id)a3;
- (void)catalogViewControllerDidScroll:(id)a3 animated:(BOOL)a4;
- (void)catalogViewControllerDidSelectFindOnPage:(id)a3;
- (void)catalogViewControllerMakeWindowKey:(id)a3;
- (void)catalogViewControllerPopoverWillDismiss:(id)a3 dismissalReason:(int64_t)a4;
- (void)catalogViewControllerSuppressSelectedItemUnfocus:(id)a3;
- (void)catalogViewControllerWillUnfocusUnifiedField:(id)a3;
- (void)clearBadgeOnPageFormatMenu;
- (void)clearCachedTabCompletionData;
- (void)clearContinuousItemDocuments;
- (void)clearDocumentForContinuousReading:(id)a3;
- (void)clearParsecQueryOriginatingFromSearchSuggestion;
- (void)clearParticipantsList;
- (void)clearReaderViews;
- (void)clearSpeculativeLoadDocument;
- (void)closeActiveTab:(id)a3;
- (void)closeAllTabs:(id)a3;
- (void)closeAllTabsMatchingSearch:(id)a3;
- (void)closeOtherTabsKeyPressed;
- (void)closePreviewDocument;
- (void)closeStartPage;
- (void)closeTabDocument:(id)a3 animated:(BOOL)a4;
- (void)closeTabGroupKeyPressed;
- (void)closeTabWithUUID:(id)a3;
- (void)closeWindow;
- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4;
- (void)cloudSharingControllerDidStopSharing:(id)a3;
- (void)cloudTabsEnabledDidChange;
- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3;
- (void)commitLinkPreviewViewController:(id)a3;
- (void)completionDetailViewControllerDidDismiss:(id)a3;
- (void)compressedNavigationBarWasTapped:(id)a3;
- (void)configureMenuAndAdoptButton:(id)a3;
- (void)continuousReadingViewController:(id)a3 didCommitToLoadItem:(id)a4;
- (void)continuousReadingViewController:(id)a3 scrollViewDidScroll:(id)a4;
- (void)continuousReadingViewControllerCommitToLoadPreviousItem:(id)a3;
- (void)continuousReadingViewControllerDidObserveScrollToTopTap:(id)a3;
- (void)continuousReadingViewControllerWillCommitToLoadNextItem:(id)a3;
- (void)createNewBookmarkWithTitle:(id)a3;
- (void)createNewPrivateTab;
- (void)createNewTabWithCompletionHandler:(id)a3;
- (void)createNewTabWithURL:(id)a3 isPrivate:(BOOL)a4 completionHandler:(id)a5;
- (void)createProfileWindow;
- (void)createReadingListItem;
- (void)dealloc;
- (void)decreaseSize:(id)a3;
- (void)didAddTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6;
- (void)didBecomeActive;
- (void)didCancelDismissingTabOverview;
- (void)didChangeBackgroundImageInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4;
- (void)didChangeContinuousReadingItemInActiveDocument;
- (void)didChangeScopedFavoritesInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4;
- (void)didCloseBrowserWindow;
- (void)didCompleteScrolling;
- (void)didEnterBackground;
- (void)didFocusTabGroup:(id)a3;
- (void)didNavigateInTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6;
- (void)didReceiveMemoryWarning;
- (void)didRemoveTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6;
- (void)dismissAutoFillInternalFeedbackToastImmediately:(BOOL)a3;
- (void)dismissCatalogViewController:(id)a3;
- (void)dismissCompletionDetail;
- (void)dismissPageFormatMenu;
- (void)dismissToastViewController:(id)a3;
- (void)dispatchNavigationIntent:(id)a3;
- (void)document:(id)a3 willMakeReaderVisible:(BOOL)a4;
- (void)dynamicBarAnimatorOutputsDidChange:(id)a3;
- (void)dynamicBarAnimatorStateDidChange:(id)a3;
- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3;
- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3;
- (void)editBookmark:(id)a3;
- (void)editBookmarksKeyPressed;
- (void)emailCurrentPage;
- (void)endIgnoringUserInteraction:(id)a3;
- (void)endTrackingDropSessionForTabBarVisibility:(id)a3;
- (void)filteredArticleTextDidBecomeReadyInTabDocument:(id)a3;
- (void)find:(id)a3;
- (void)findString:(id)a3 onTabWithUUID:(id)a4;
- (void)focusAddressFieldKeyPressed;
- (void)fraudWarningsToggled;
- (void)goBack;
- (void)goForward;
- (void)handleNavigationIntent:(id)a3 completion:(id)a4;
- (void)handleSearchResult:(id)a3;
- (void)handleTabViewPinch;
- (void)hideBarsForRotation;
- (void)hideReaderForTabDocument:(id)a3 animated:(BOOL)a4 deactivationMode:(unint64_t)a5;
- (void)hideTabGroupPicker;
- (void)increaseSize:(id)a3;
- (void)invalidateSourceApplication;
- (void)linkPreviewProviderWillDismissPreview;
- (void)loadBackgroundImageIfNeededForIdentifier:(id)a3;
- (void)loadCloudTabsForDeviceRestoration:(id)a3;
- (void)loadNextContinuousDocumentIfNeeded;
- (void)loadURL:(id)a3;
- (void)makeSpaceForTabWithPrivateBrowsing:(BOOL)a3 resultHandler:(id)a4;
- (void)markReadingListBookmark:(id)a3 asRead:(BOOL)a4 postNotification:(BOOL)a5;
- (void)mergeAllWindows:(id)a3;
- (void)navigateContinuousReadingListToDirection:(unint64_t)a3;
- (void)navigationBar:(id)a3 didCreateLeadingToolbar:(id)a4 trailingToolbar:(id)a5;
- (void)navigationBar:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4;
- (void)navigationBar:(id)a3 didProduceNavigationIntent:(id)a4;
- (void)navigationBar:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5;
- (void)navigationBar:(id)a3 multipleExtensionsButtonTapped:(id)a4;
- (void)navigationBarCancelButtonWasTapped:(id)a3;
- (void)navigationBarDidLayoutSubviews:(id)a3;
- (void)navigationBarFormatMenuButtonBecameUnavailable:(id)a3;
- (void)navigationBarFormatMenuButtonStartedInteraction:(id)a3;
- (void)navigationBarFormatMenuButtonWasTapped:(id)a3;
- (void)navigationBarMediaStateMuteButtonWasTapped:(id)a3 forItem:(id)a4;
- (void)navigationBarMetricsDidChange:(id)a3;
- (void)navigationBarMinimizationChanged;
- (void)navigationBarReaderButtonWasTapped:(id)a3;
- (void)navigationBarReloadButtonWasTapped:(id)a3;
- (void)navigationBarStopLoadingButtonWasTapped:(id)a3;
- (void)navigationBarTranslateButtonWasTapped:(id)a3;
- (void)navigationBarTranslateButtonWasTappedWithSourceInfo:(id)a3;
- (void)navigationBarURLWasTapped:(id)a3 completionHandler:(id)a4;
- (void)newTabAlternativeKeyPressed;
- (void)newTabGroupKeyPressed;
- (void)newTabWithAlternativeOrderingKeyPressed;
- (void)nextReadingListItemKeyPressed;
- (void)nextTabGroupKeyPressed;
- (void)nextTabKeyPressed:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openBookmarkWithUUIDString:(id)a3;
- (void)openBookmarkWithUUIDString:(id)a3 inTabWithUUID:(id)a4;
- (void)openClearHistoryViewControllerFor:(id)a3;
- (void)openDownload:(id)a3;
- (void)openLibrary:(id)a3;
- (void)openNewPrivateTab:(id)a3;
- (void)openNewPrivateWindow:(id)a3;
- (void)openNewTab:(id)a3;
- (void)openNewWindow:(id)a3;
- (void)openNewWindowInFrontmostProfile:(id)a3;
- (void)openStartPage;
- (void)openTabGroupOfKind:(int64_t)a3 uuidString:(id)a4;
- (void)openTabWithUUID:(id)a3;
- (void)overlayDidHide:(id)a3;
- (void)participants:(id)a3 didJoinSharedTabGroupWithUUID:(id)a4;
- (void)participants:(id)a3 didLeaveSharedTabGroupWithUUID:(id)a4;
- (void)performSearchUsingQuery:(id)a3;
- (void)performTabSearchUsingQuery:(id)a3;
- (void)performWebExtensionCommandForKeyCommand:(id)a3;
- (void)playbackContentIdentifierDidChangeForSiriReaderPlaybackController:(id)a3;
- (void)playbackStateDidChangeForSiriReaderPlaybackController:(id)a3;
- (void)policyDidChangeForDigitalHealthManager:(id)a3;
- (void)prefetchNextContinuousItemIfNeeded;
- (void)prepareForTabDocumentWebViewFullscreenMayReturnToInline:;
- (void)prepareForTabDocumentWebViewFullscreenMayReturnToInline:(id)a3;
- (void)prepareIntentInteractionWithCompletionHandler:(id)a3;
- (void)prepareToNavigateInTabDocument:(id)a3;
- (void)presentAutoFillInternalFeedbackToastWithDiagnosticsDataWithoutPageContents:(id)a3;
- (void)presentAutomaticTabClosingAlertController;
- (void)presentBookmarkPickerWithImportHandler:(id)a3;
- (void)presentCloudTabsPickerWithPrimaryDeviceUUID:(id)a3;
- (void)presentDownloadsViewController;
- (void)presentModalViewController:(id)a3 completion:(id)a4;
- (void)presentModalViewController:(id)a3 fromPopoverSource:(id)a4;
- (void)presentPrintControllerForCurrentTab;
- (void)presentPrintControllerForTabDocument:(id)a3 frame:(id)a4 initiatedByWebContent:(BOOL)a5;
- (void)presentPrivacyReport;
- (void)presentPromptForAppReviewPromptManager:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)previewControllerDidDismiss:(id)a3;
- (void)previousReadingListItemKeyPressed;
- (void)previousTabGroupKeyPressed;
- (void)previousTabKeyPressed:(id)a3;
- (void)profileWindow:(id)a3 selectProfile:(id)a4;
- (void)profileWindow:(id)a3 selectTabGroup:(id)a4;
- (void)reinsertBorrowedContentViewForTab:(id)a3;
- (void)reloadFromOriginKeyPressed;
- (void)reloadKeyPressed;
- (void)reloadSidebarAnimated:(BOOL)a3;
- (void)removeAppBannerFromTabDocument:(id)a3 animated:(BOOL)a4;
- (void)removeCachedSearchStateForActiveTabDocument;
- (void)renameTabGroupKeyPressed;
- (void)reopenLastClosedTabPressed;
- (void)reportScribbleFeedbackForSelectedRowIndex:(int64_t)a3;
- (void)resetPageZoomLevelAndFontSize;
- (void)resetPendingAutoFillInternalFeedbackToastDismissalTimer;
- (void)resetWhatsNewInPrivateBrowsingStartPageModule;
- (void)restoreInterfaceAfterElementFullscreen;
- (void)rootViewControllerViewDidTransitionFromSize:(CGSize)a3 animated:(BOOL)a4;
- (void)rootViewControllerViewTransitionFromSize:(CGSize)a3 includingSidebar:(BOOL)a4 animated:(BOOL)a5;
- (void)rootViewControllerViewWillTransitionToSize:(CGSize)a3;
- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)scene:openURLContexts:;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)screenTimeOverlayViewController:(id)a3 didFinishDismissingBlockingViewController:(id)a4;
- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4;
- (void)scribbleDoneKeyPressed;
- (void)scrollSidebarToTopAnimated:(BOOL)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActiveProfileIdentifier:(id)a3;
- (void)setAnimationPendingDynamicBarAnimatorSteadyState:(id)a3;
- (void)setAppBannerPinnedToTop:(BOOL)a3 forTabDocument:(id)a4;
- (void)setAppIntentRequestIdentifier:(id)a3;
- (void)setAppReviewPromptManager:(id)a3;
- (void)setBackgrounded:(BOOL)a3;
- (void)setCachedDocumentOnContinuousTransition:(id)a3;
- (void)setCanFocusNavigationBarURL:(BOOL)a3;
- (void)setCookiePolicyMessageReceived;
- (void)setCurrentBookmarksCollection:(id)a3;
- (void)setCurrentContinuousReadingItem:(id *)a1;
- (void)setFavoritesAreEmbedded:(BOOL)a3 animated:(BOOL)a4;
- (void)setFavoritesFieldFocused:(BOOL)a3 animated:(BOOL)a4;
- (void)setFavoritesFieldFocused:(BOOL)a3 forVoiceSearch:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)setFavoritesState:(int64_t)a3;
- (void)setFavoritesState:(int64_t)a3 animated:(BOOL)a4;
- (void)setFavoritesState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)setFavoritesState:(int64_t)a3 forVoiceSearch:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)setIntentSceneConfigurationCompletion:(id)a3;
- (void)setKeepBarsMinimized:(BOOL)a3;
- (void)setNeedsFocusUpdate;
- (void)setNeedsSnapshotUpdateForActiveTab;
- (void)setNeedsSnapshotUpdateForActiveTabIfTabIsBlank;
- (void)setNextContinuousItemDocument:(id)a3;
- (void)setOverridesUndoManagerForClosedTabs:(BOOL)a3;
- (void)setPresentingModalBookmarksController:(BOOL)a3 withExclusiveCollection:(id)a4 bookmarkUUIDString:(id)a5 animated:(BOOL)a6;
- (void)setPreviousContinuousItemDocument:(id)a3;
- (void)setPrivateBrowsingEnabled:(BOOL)a3;
- (void)setProgressEnabled:(BOOL)a3;
- (void)setReaderModeEnabled:(BOOL)a3;
- (void)setReaderShouldBeShownIfPossible:(BOOL)a3;
- (void)setReaderViewStale:(BOOL)a3;
- (void)setScrollViewZoomEnabled:(BOOL)a3;
- (void)setShouldKeepKeyboardFocused:(BOOL)a3;
- (void)setShouldShowListeningControls:(BOOL)a3;
- (void)setShowingCrashBanner:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4 forTabDocument:(id)a5;
- (void)setSuppressWebExtensionEvents:(BOOL)a3;
- (void)setTabDocumentPlayingPIPVideo:(id)a3;
- (void)setTextRangeToRestoreAfterCompletionDetailIsDismissed:(id)a3;
- (void)setUpWithURL:(id)a3 launchOptions:(id)a4;
- (void)setUsesNarrowLayout:(BOOL)a3;
- (void)setView:(unint64_t)a3 visible:(BOOL)a4;
- (void)setWantsUnifiedFieldFocused:(BOOL)a3;
- (void)setWebView:(uint64_t)a1;
- (void)setWebViewFromTabDocument:(void *)a1;
- (void)setZoomScale:(float)a3;
- (void)shareDidUpdateForTabGroupWithUUID:(id)a3;
- (void)showBars;
- (void)showBookmarksCollectionKeyPressed;
- (void)showBookmarksPanelWithNonAnimatedTransition;
- (void)showCloudTabsCollectionKeyPressed;
- (void)showCrashBanner:(id)a3 animated:(BOOL)a4;
- (void)showExtensionPermissionBannerForExtensions:(id)a3;
- (void)showHistoryCollectionAlternativeKeyPressed;
- (void)showHistoryCollectionKeyPressed;
- (void)showPopupOrPerSitePermissionsForWebExtension:(id)a3;
- (void)showPrivateBrowsingPrivacyProtectionsBanner:(id)a3;
- (void)showReaderForTabDocument:(id)a3 animated:(BOOL)a4;
- (void)showReadingListAutomaticArchiveAlertIfNeededWithCompletion:(id)a3;
- (void)showReadingListCollectionKeyPressed;
- (void)showSharedWithYouCollectionKeyPressed;
- (void)showTabView;
- (void)showWebExtensionBanner:(id)a3;
- (void)sidebarTrailingButtonWasTapped;
- (void)siriReadThisMenuInvocation;
- (void)siriReadThisVocalInvocation;
- (void)snapshotTabDocument:(id)a3 size:(CGSize)a4 topBackdropHeight:(double)a5 options:(unint64_t)a6 completion:(id)a7;
- (void)statusBarHeightChanged;
- (void)switchFromTabDocument:(id)a3 toTabDocument:(id)a4;
- (void)switchToProfileKeyPressed:(id)a3;
- (void)switchToTabKeyPressed:(id)a3;
- (void)switchToTabWithUUID:(id)a3 inWindowWithUUID:(id)a4 forTabGroupWithUUID:(id)a5;
- (void)tabBarManager:(id)a3 didCreateTabBar:(id)a4;
- (void)tabBarManagerDidUpdateDisplayMode:(id)a3;
- (void)tabCollectionViewDidDismiss:(id)a3;
- (void)tabCollectionViewWillDismiss:(id)a3;
- (void)tabCollectionViewWillPresent:(id)a3;
- (void)tabController:(id)a3 didSwitchFromTabDocument:(id)a4 toTabDocument:(id)a5;
- (void)tabController:(id)a3 didSwitchFromTabGroup:(id)a4;
- (void)tabControllerDocumentCountDidChange:(id)a3;
- (void)tabDocument:(id)a3 didChangePIPState:(BOOL)a4;
- (void)tabDocument:(id)a3 didClearLibraryType:(id)a4;
- (void)tabDocument:(id)a3 didCreateNewTabDocument:(id)a4;
- (void)tabDocument:(id)a3 didCreatePreviewDocument:(id)a4;
- (void)tabDocument:(id)a3 didDetectReaderAvailability:(BOOL)a4;
- (void)tabDocument:(id)a3 didExtractArticleText:(id)a4 withMetadata:(id)a5;
- (void)tabDocument:(id)a3 didFinishLoadingWithError:(BOOL)a4;
- (void)tabDocument:(id)a3 didReceiveAssistantContentOptions:(unint64_t)a4;
- (void)tabDocument:(id)a3 dismissViewControllerAnimated:(id)a4;
- (void)tabDocument:(id)a3 presentViewControllerAnimated:(id)a4;
- (void)tabDocumentCommitPreviewedDocument:(id)a3;
- (void)tabDocumentCommitPreviewedDocumentAsNewTab:(id)a3 inBackground:(BOOL)a4;
- (void)tabDocumentDidAddAlert:(id)a3;
- (void)tabDocumentDidCancelRedirectToExternalApplication:(id)a3;
- (void)tabDocumentDidChangeCanStopLoadingState:(id)a3;
- (void)tabDocumentDidChangeMediaState:(id)a3 needsUpdateGlobalAudioState:(BOOL)a4;
- (void)tabDocumentDidChangeSafeAreaInsets:(id)a3;
- (void)tabDocumentDidChangeSafeAreaShouldAffectObscuredInsets:(id)a3;
- (void)tabDocumentDidCommitNavigation:(id)a3;
- (void)tabDocumentDidCompleteCheckForAppBanner:(id)a3;
- (void)tabDocumentDidDimissPreviewedDocument:(id)a3;
- (void)tabDocumentDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4;
- (void)tabDocumentDidStartLoading:(id)a3;
- (void)tabDocumentDidUpdateBackForward:(id)a3;
- (void)tabDocumentDidUpdateIsScribbling:(id)a3;
- (void)tabDocumentDidUpdateShowingContinuous:(id)a3;
- (void)tabDocumentDidUpdateTabCollectionItem:(id)a3;
- (void)tabDocumentDidUpdateThemeColor:(id)a3;
- (void)tabDocumentDidUpdateTitle:(id)a3;
- (void)tabDocumentDidUpdateURL:(id)a3;
- (void)tabDocumentFluidProgressRocketAnimationDidComplete:(id)a3;
- (void)tabDocumentShouldBecomeActive:(id)a3;
- (void)tabDocumentShouldCloseAndSwitchToParentTab:(id)a3;
- (void)tabDocumentWillBeginDragSession:(id)a3;
- (void)tabDocumentWillDisableLinkPreview;
- (void)tabDocumentWillDismissInlineDialog:(id)a3;
- (void)tabDocumentWillEndDragSession:(id)a3;
- (void)tabDocumentWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4;
- (void)tabDocumentWillShowInlineDialog:(id)a3;
- (void)tabGroupManager:(id)a3 didBeginAcceptingTabGroupShareWithMetadata:(id)a4;
- (void)tabGroupManager:(id)a3 didFinishAcceptingTabGroupShareWithMetadata:(id)a4 result:(int64_t)a5;
- (void)tabGroupManager:(id)a3 didUpadateActiveParticipants:(id)a4 inTabGroupWithUUID:(id)a5;
- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5;
- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4;
- (void)tabGroupManager:(id)a3 selectProfileIdentifierForShareMetadata:(id)a4 completionHandler:(id)a5;
- (void)takeFindStringKeyPressed;
- (void)takeOwnershipOfStepperContainer:(id)a3;
- (void)toggleAlwaysShowBookmarksBarMessageReceived;
- (void)toggleBookmarksPresentation;
- (void)toggleBookmarksPresentationWithCollection:(void *)a3 completion:;
- (void)toggleDownloadsKeyPressed;
- (void)togglePinningCurrentTab;
- (void)togglePrivateBrowsingEnabled;
- (void)toggleShowWebpageStatusBar;
- (void)toggleShowingFavoritesBarKeyPressed;
- (void)toggleShowingReaderForUserAction;
- (void)toggleTabView;
- (void)toggleVoiceSearch;
- (void)unhideCapsuleFromPageMenuIfNeeded;
- (void)unifiedTabBarActiveTabWasTapped;
- (void)updateApplePayPreferences;
- (void)updateCollaborationButton;
- (void)updateContinuousPreviewViewFrame;
- (void)updateDynamicBarGeometry;
- (void)updateExposedScrollViewRect;
- (void)updateFavoritesForNewDocument;
- (void)updateFirstResponderOrFocus;
- (void)updateFocusForTab:(id)a3 webViewCanTakeFocus:(BOOL)a4;
- (void)updateFocusIfNeeded;
- (void)updateInsetsForBackgroundWebView:(id)a3;
- (void)updateInterface;
- (void)updateJavaScriptPreferences;
- (void)updatePopoverPositionAfterSizeTransition;
- (void)updatePresenceForActiveUser;
- (void)updatePrivateBrowsingAvailabilityWithCompletionHandler:(id)a3;
- (void)updatePullToRefreshIsEnabled;
- (void)updateScrollToTopView;
- (void)updateSearchEngineIfNeeded;
- (void)updateShowingTabBarAnimated:(BOOL)a3;
- (void)updateSpeculativeLoadingPreferences;
- (void)updateTabGroupButtonsVisibility;
- (void)updateTabGroupHeading;
- (void)updateTabOverviewButton;
- (void)updateTabViewPinchRecognizer;
- (void)updateUnifiedBarVisibility;
- (void)updateUsesTabBar;
- (void)updateViewsAfterStatusBarChange;
- (void)updateWebViewObscuredInsets;
- (void)userDefaultsDidChangeValueForKey:(id)a3;
- (void)validateCommand:(id)a3;
- (void)validateExtensionToolbarItemsInWindow:(id)a3;
- (void)webClipCacheDidChange;
- (void)webExtensionButtonTapped:(id)a3 extension:(id)a4;
- (void)webExtensionWasRemotelyEnabled:(id)a3;
- (void)webExtensionsButtonTapped:(id)a3;
- (void)webViewDidFirstVisuallyNonEmptyLayoutForTabDocument:(id)a3;
- (void)willDismissBrowsingAssistantInSheet:(BOOL)a3;
- (void)willEnterForeground;
- (void)willPresentBrowsingAssistantInSheet:(BOOL)a3;
- (void)willResignActive;
- (void)willSelectTabGroupWithUUID:(id)a3;
- (void)willStartLoadFromUserTap:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4;
- (void)writePrivateBrowsingEnabled:(BOOL)a3;
@end

@implementation BrowserController

- (BOOL)isShowingReader
{
  v2 = [(TabController *)self->_tabController activeTabDocument];
  char v3 = [v2 isShowingReader];

  return v3;
}

- (NSString)activeLibraryType
{
  v2 = [(TabController *)self->_tabController activeTabDocument];
  char v3 = [v2 libraryType];

  return (NSString *)v3;
}

- (void)updateWebViewObscuredInsets
{
  if (a1 && ([*(id *)(a1 + 920) _isInFullscreen] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 344) activeTabDocument];
    id v3 = [v2 view];

    [v3 setWebViewGeometryNeedsUpdate];
    if (*(unsigned char *)(a1 + 122) || *(unsigned char *)(a1 + 168)) {
      [v3 layoutIfNeeded];
    }
  }
}

- (WBProfile)activeProfile
{
  tabGroupManager = self->_tabGroupManager;
  id v3 = [(BrowserController *)self activeProfileIdentifier];
  v4 = [(WBTabGroupManager *)tabGroupManager profileWithIdentifier:v3];

  return (WBProfile *)v4;
}

- (WBProfile)effectiveProfile
{
  tabGroupManager = self->_tabGroupManager;
  id v3 = [(BrowserController *)self effectiveProfileIdentifier];
  v4 = [(WBTabGroupManager *)tabGroupManager profileWithIdentifier:v3];

  return (WBProfile *)v4;
}

- (NSString)effectiveProfileIdentifier
{
  if (self->_privateBrowsingEnabled)
  {
    id v2 = (id)*MEMORY[0x1E4F980C8];
  }
  else
  {
    id v2 = [(BrowserController *)self activeProfileIdentifier];
  }
  return (NSString *)v2;
}

- (NSString)activeProfileIdentifier
{
  return (NSString *)[(WBProfileWindow *)self->_profileWindow activeProfileIdentifier];
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

- (UserActivityController)userActivityController
{
  return self->_userActivityController;
}

- (BOOL)interfaceFillsScreen
{
  if ([(ContinuousReadingViewController *)self->_continuousReadingViewController isScrollingToNextContinuousDocument]|| [(BrowserRootViewController *)self->_rootViewController keepBarsMinimized])
  {
    return 0;
  }
  if ([(BrowserRootViewController *)self->_rootViewController usingLoweredBar])
  {
    v4 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
    v5 = [v4 capsuleCollectionView];
    uint64_t v6 = [v5 minimizationStyle];

    if (v6 == 1)
    {
      v7 = [(_SFPageFormatMenuController *)self->_pageFormatMenuController viewController];
      v8 = [v7 presentingViewController];

      if (!v8) {
        return 1;
      }
    }
  }
  if ([(BrowserRootViewController *)self->_rootViewController isInYttriumMode]
    || [(BrowserController *)self fullScreenInPortrait]
    || -[BrowserController _isVerticallyConstrained]((uint64_t)self))
  {
    return 1;
  }
  v10 = [(TabController *)self->_tabController activeTabDocument];
  char v3 = [v10 isShowingReader];

  return v3;
}

- (BOOL)fullScreenInPortrait
{
  return self->_fullScreenInPortrait;
}

- (BOOL)_isVerticallyConstrained
{
  if (!a1) {
    return 0;
  }
  v1 = [*(id *)(a1 + 280) traitCollection];
  BOOL v2 = [v1 verticalSizeClass] == 1;

  return v2;
}

- (BOOL)isShowingInOneThirdMode
{
  if (!_SFDeviceIsPad()) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (objc_opt_respondsToSelector() & 1) != 0 && ([WeakRetained _enhancedWindowingEnabled])
  {
    BOOL v4 = 0;
  }
  else
  {
    [(BrowserRootViewController *)self->_rootViewController contentFrameInPageView];
    BOOL v4 = CGRectGetWidth(v6) <= 375.0;
  }

  return v4;
}

- (UIWindowScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIWindowScene *)WeakRetained;
}

- (TabCollectionViewProviding)tabCollectionViewProvider
{
  return self->_tabCollectionViewProvider;
}

- (void)loadBackgroundImageIfNeededForIdentifier:(id)a3
{
  id v5 = a3;
  char v3 = [MEMORY[0x1E4F98E88] defaultManager];
  if (([v3 isCorrectBackgroundImageLoadedForIdentifier:v5] & 1) == 0) {
    [v3 loadImageFromDiskForIdentifier:v5];
  }
  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4F99658] object:v3];
}

- (void)clearCachedTabCompletionData
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v3 = +[Application sharedApplication];
  [v3 clearCachedTabCompletionData];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = [(BrowserController *)self browserWindowController];
  id v5 = [v4 browserControllers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = -[BrowserController _catalogViewController](*(id **)(*((void *)&v10 + 1) + 8 * v8));
        [v9 clearCachedTabCompletionData];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BrowserWindowController)browserWindowController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  return (BrowserWindowController *)WeakRetained;
}

- (void)reloadSidebarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(LibraryController *)self->_libraryController sidebarViewController];
  [v5 setNeedsReloadSectionControllersAnimated:v3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupPickerViewController);
  [WeakRetained setNeedsReloadData];
}

- (_SFBarManager)barManager
{
  return self->_barManager;
}

- (void)updateTabGroupHeading
{
  -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 updateTabGroupHeading];
}

- (void)updateTabGroupButtonsVisibility
{
  id v13 = +[FeatureManager sharedFeatureManager];
  char v3 = [v13 isTabGroupButtonEnabled];

  if (v3)
  {
    BOOL v4 = [(BrowserRootViewController *)self->_rootViewController isShowingSidebar];
    BOOL v5 = !v4 || [(BrowserRootViewController *)self->_rootViewController sidebarStyle] != 0;
    id v14 = [(BrowserRootViewController *)self->_rootViewController view];
    int v6 = objc_msgSend(v14, "_sf_hasLandscapeAspectRatio");
    BOOL v7 = ([(TabController *)self->_tabController isPrivateBrowsingEnabled] & v6) == 1
      && [(BrowserController *)self tabBarDisplayMode] != 2;
    BOOL v8 = [(TabController *)self->_tabController canRenameActiveTabGroup]
      || v7
      || [(BrowserController *)self canShowProfileInNavigationBar];
    [(_SFBarManager *)self->_barManager setBarItem:2 hidden:!v5 || !v8];
    barManager = self->_barManager;
    BOOL v10 = !v5 && [(BrowserRootViewController *)self->_rootViewController toolbarPlacement] == 0;
    [(_SFBarManager *)barManager setBarItem:3 hidden:v10];
    long long v11 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabOverview];
    long long v12 = [v11 toolbar];

    [v12 setBarButton:0 hidden:v4];
    [v12 setBarButton:0 enabled:v4 ^ 1];
  }
}

- (LibraryController)libraryController
{
  return self->_libraryController;
}

- (BOOL)canShowProfileInTabOverviewToolbar
{
  BOOL v3 = [(BrowserController *)self hasMultipleProfiles];
  if (v3)
  {
    if (-[BrowserController _shouldShowTabGroupSwitcher]((uint64_t)self)) {
      LOBYTE(v3) = 1;
    }
    else {
      LOBYTE(v3) = ![(BrowserController *)self isPrivateBrowsingEnabled];
    }
  }
  return v3;
}

- (BOOL)canShowProfileInNavigationBar
{
  BOOL v3 = [(BrowserController *)self hasMultipleProfiles];
  if (v3) {
    LOBYTE(v3) = ![(BrowserController *)self isPrivateBrowsingEnabled];
  }
  return v3;
}

- (BOOL)hasMultipleProfiles
{
  if (![MEMORY[0x1E4F97EA0] isSafariProfilesEnabled]) {
    return 0;
  }
  BOOL v3 = [(WBTabGroupManager *)self->_tabGroupManager profiles];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)isPrivateBrowsingAvailable
{
  return self->_privateBrowsingAvailable;
}

- (WBTabGroup)unnamedTabGroup
{
  return (WBTabGroup *)[(WBProfileWindow *)self->_profileWindow unnamedTabGroupForActiveProfile];
}

- (void)_updatePrivateBrowsingAvailability:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  id v13 = [v5 toolbar];

  int v6 = [(TabController *)self->_tabController tabGroupsMenuForTabGroupButton:0];
  [v13 setMenu:v6 forBarButton:0];

  [v13 setBarButton:0 enabled:1];
  if (self->_privateBrowsingAvailable != v3)
  {
    self->_privateBrowsingAvailable = v3;
    [(TabController *)self->_tabController privateBrowsingAvailabilityDidChange];
    if (self->_privateBrowsingAvailable)
    {
      BOOL v7 = +[LaunchStateController sharedController];
      if (([v7 hasCompletedLaunch] & 1) == 0)
      {

        if (v3)
        {
LABEL_11:
          [(BrowserController *)self reloadSidebarAnimated:1];
          long long v11 = [(BrowserRootViewController *)self->_rootViewController tabSwitcherViewController];
          long long v12 = [(TabController *)self->_tabController activeTabGroup];
          [v11 setNeedsScrollToTabGroup:v12];

          goto LABEL_12;
        }
LABEL_9:
        if (self->_privateBrowsingEnabled) {
          [(TabController *)self->_tabController selectLocalTabGroup];
        }
        goto LABEL_11;
      }
      BOOL firedExtensionOpenEventForPrivateWindow = self->_firedExtensionOpenEventForPrivateWindow;

      if (!firedExtensionOpenEventForPrivateWindow)
      {
        v9 = +[Application sharedApplication];
        BOOL v10 = [v9 defaultWebExtensionsController];
        [v10 didOpenWindow:self->_privateExtensionWindow];

        self->_BOOL firedExtensionOpenEventForPrivateWindow = 1;
      }
    }
    if (v3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_12:
}

- (void)_updateUnifiedBarBackgroundVisibility
{
  if (a1)
  {
    if (([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari] & 1) != 0
      || ![a1 isShowingFavorites]
      || ([a1 favoritesAreShowingInPopover] & 1) != 0)
    {
      uint64_t v2 = 0;
    }
    else
    {
      id v5 = [a1 tabBarManager];
      unint64_t v3 = [v5 displayMode];

      uint64_t v2 = 2 * (v3 < 2);
    }
    id v4 = [a1[35] unifiedBar];
    [v4 setBackgroundVisibility:v2];
  }
}

- (BOOL)_animationsAreEnabled
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 888));
  int v2 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  if (WeakRetained) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  BOOL v4 = v3 == 1 && [WeakRetained activationState] == 0;

  return v4;
}

- (void)_updateButtonsAnimatingTabBar:(uint64_t)a1
{
  if (a1)
  {
    LODWORD(v2) = a2;
    BOOL v4 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
    uint64_t v5 = [v4 presentationState];

    if (v5) {
      uint64_t v2 = 0;
    }
    else {
      uint64_t v2 = v2;
    }
    [*(id *)(a1 + 928) updateTabViewsAnimatingTabBar:v2];
    int v6 = [*(id *)(a1 + 344) activeTabDocument];
    BOOL v7 = *(void **)(a1 + 832);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__BrowserController__updateButtonsAnimatingTabBar___block_invoke;
    v9[3] = &unk_1E6D791E8;
    id v10 = v6;
    uint64_t v11 = a1;
    id v8 = v6;
    [v7 performCoalescedUpdatesAnimated:v2 updates:v9];
  }
}

- (BrowserController)initWithWindowState:(id)a3 browserWindowController:(id)a4 tabGroupManager:(id)a5 controlledByAutomation:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v15 = [v11 uuid];
  v16 = (void *)[v14 initWithUUIDString:v15];
  v17 = [v11 sceneID];
  v18 = [(BrowserController *)self initWithUUID:v16 sceneID:v17 browserWindowController:v12 tabGroupManager:v13 controlledByAutomation:v6];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_windowState, a3);
    [(TabController *)v18->_tabController setWindowState:v11];
    -[BrowserController createProfileWindow]((uint64_t)v18);
    if (![(BrowserController *)v18 isInDefaultProfile])
    {
      v19 = [(TabController *)v18->_tabController pinnedTabsManager];
      v20 = [(BrowserController *)v18 activeProfileIdentifier];
      [v19 willSelectProfileWithIdentifier:v20];
    }
    -[BrowserController _prepareExtensionsForEffectiveProfile](v18);
    -[BrowserController _readSavedState]((uint64_t)v18);
    [(BrowserController *)v18 updateCollaborationButton];
    v21 = v18;
  }

  return v18;
}

- (void)updateCollaborationButton
{
  int v3 = +[LaunchStateController sharedController];
  char v4 = [v3 hasCompletedLaunch];

  if (v4)
  {
    uint64_t v5 = [(TabController *)self->_tabController activeTabGroupOrTabGroupVisibleInSwitcher];
    if ([v5 isSyncable])
    {
      tabGroupManager = self->_tabGroupManager;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __46__BrowserController_updateCollaborationButton__block_invoke;
      v7[3] = &unk_1E6D79998;
      v7[4] = self;
      id v8 = v5;
      [(WBTabGroupManager *)tabGroupManager shareRecordForTabGroup:v8 completionHandler:v7];
    }
    else
    {
      [(_SFBarManager *)self->_barManager setBarItem:16 hidden:1];
    }
  }
}

- (BOOL)isInDefaultProfile
{
  uint64_t v2 = [(BrowserController *)self activeProfileIdentifier];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F980C8]];

  return v3;
}

- (void)_updateTabGroupBanner
{
  if (a1)
  {
    uint64_t v2 = +[LaunchStateController sharedController];
    char v3 = [v2 hasCompletedLaunch];

    if (v3)
    {
      char v4 = [a1[43] activeTabGroup];
      uint64_t v5 = [a1[35] capsuleCollectionViewLayout];
      if (v5 && (char v6 = [v4 isNamed], v5, (v6 & 1) != 0))
      {
        id v7 = [a1[96] tabGroupBanner];
        if (!v7)
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F783B0]);
          objc_msgSend(a1[96], "setTabGroupBanner:animated:");
        }
        [v7 setTabGroup:v4];
        objc_initWeak(&location, a1);
        id v8 = (void *)MEMORY[0x1E4FB13F0];
        uint64_t v9 = *MEMORY[0x1E4F787E8];
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        v16 = __42__BrowserController__updateTabGroupBanner__block_invoke;
        v17 = &unk_1E6D791C0;
        objc_copyWeak(&v18, &location);
        id v10 = [v8 actionWithTitle:&stru_1F3C268E8 image:0 identifier:v9 handler:&v14];
        objc_msgSend(v7, "setTabGroupTapAction:", v10, v14, v15, v16, v17);

        id v11 = +[FeatureManager sharedFeatureManager];
        LOBYTE(v9) = [v11 areSharedTabGroupsEnabled];

        if (v9)
        {
          id v12 = [v7 collaborationButton];

          if (!v12)
          {
            id v13 = (void *)[a1 newCollaborationButton];
            [v7 setCollaborationButton:v13];
          }
        }
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        [a1[96] setTabGroupBanner:0 animated:0];
      }
    }
  }
}

- (int64_t)updatePolicyForStartPageController:(id)a3
{
  char v4 = +[LaunchStateController sharedController];
  if ([v4 hasCompletedLaunch])
  {
  }
  else
  {
    uint64_t v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    uint64_t v6 = [v5 presentationState];

    if (v6) {
      return 0;
    }
  }
  -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  id v8 = (CatalogViewController *)objc_claimAutoreleasedReturnValue();
  cachedCatalogViewController = v8;
  if (!v8) {
    cachedCatalogViewController = self->_cachedCatalogViewController;
  }
  id v10 = cachedCatalogViewController;

  if ([(BrowserController *)self favoritesAreShowingInPopover]
    || [(CatalogViewController *)v10 startPageDidAppearAtLeastOnce])
  {
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (BOOL)favoritesAreShowingInPopover
{
  if ([(BrowserController *)self favoritesAreEmbedded]) {
    return 0;
  }
  else {
    return ![(BrowserController *)self _shouldUseNarrowLayout];
  }
}

- (BOOL)favoritesAreEmbedded
{
  return (unint64_t)(self->_favoritesState - 3) < 3;
}

- (void)createProfileWindow
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 728));
    id v2 = objc_alloc(MEMORY[0x1E4FB6090]);
    char v3 = [(id)a1 windowState];
    uint64_t v4 = *(void *)(a1 + 776);
    uint64_t v5 = [WeakRetained frontmostProfileIdentifier];
    uint64_t v6 = [v2 initWithWindowState:v3 tabGroupManager:v4 preferredProfileIdentifier:v5];
    int64_t v7 = *(void **)(a1 + 248);
    *(void *)(a1 + 248) = v6;

    [*(id *)(a1 + 248) setCanSwitchProfiles:1];
    [*(id *)(a1 + 248) setDelegate:a1];
    id v8 = [*(id *)(a1 + 344) unnamedTabGroupDisplayTitleProvider];
    [*(id *)(a1 + 248) setUnnamedTabGroupDisplayTitleProvider:v8];

    [WeakRetained setFrontmostProfileIdentifier:0];
  }
}

- (void)_prepareExtensionsForEffectiveProfile
{
  if (a1)
  {
    id v6 = [a1 effectiveProfile];
    v1 = +[Application sharedApplication];
    id v2 = [v6 identifierForExtensions];
    char v3 = [v1 webExtensionsControllerForProfileServerID:v2];
    uint64_t v4 = [MEMORY[0x1E4F781F8] sharedProvider];
    [v4 setWebExtensionsController:v3];

    uint64_t v5 = +[Application sharedApplication];
    [v5 loadExtensionsInProfileIfNecessary:v6];
  }
}

- (void)_observeInitializedWebKitFeatures
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_standardUserDefaultsWithOptimizedKeyValueObserving");
    char v11 = objc_msgSend(v2, "safari_resetWebKitExperimentalFeaturesIfNeeded:", 0);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v3 = [MEMORY[0x1E4F46688] _features];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_shouldObserveWebKitFeature:", v7))
          {
            id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_keyForWebKitFeature:", v7);
            if ((v11 & 1) == 0)
            {
              uint64_t v9 = [v2 objectForKey:v8];
              BOOL v10 = v9 == 0;

              if (!v10) {
                objc_msgSend(*(id *)(a1 + 840), "_setEnabled:forFeature:", objc_msgSend(v2, "BOOLForKey:", v8), v7);
              }
            }
            [v2 addObserver:a1 forKeyPath:v8 options:1 context:webFeatureObserverContext];
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v4);
    }
  }
}

uint64_t __61__BrowserController_catalogViewControllerDidScroll_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 280) updateUnifiedBarChromelessScrollDistance];
}

- (void)updateShowingTabBarAnimated:(BOOL)a3
{
  unint64_t shouldShowTab = -[BrowserController _shouldShowTabBar](self);
  -[BrowserController _setShowingTabBar:animated:]((id *)&self->super.super.super.isa, shouldShowTab, a3);
}

- (unint64_t)_shouldShowTabBar
{
  unint64_t v1 = (unint64_t)a1;
  if (a1)
  {
    if (a1[709]
      || ([a1 tabBarManager],
          id v2 = objc_claimAutoreleasedReturnValue(),
          [v2 standaloneTabBar],
          char v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v2,
          v3))
    {
      uint64_t v4 = [*(id *)(v1 + 344) currentTabs];
      unint64_t v1 = (unint64_t)[v4 count] > 1 || objc_msgSend(*(id *)(v1 + 112), "count") != 0;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (void)_setShowingTabBar:(char)a3 animated:
{
  if (a1)
  {
    if ([a1[35] isShowingTabBar] != a2)
    {
      [a1[35] willToggleTabBar];
      id v6 = [a1[35] tabBar];
      uint64_t v7 = -[BrowserController _catalogViewController](a1);
      id v8 = [v7 view];

      [v8 layoutIfNeeded];
      uint64_t v9 = [a1[35] navigationBar];
      [v9 layoutIfNeeded];
      [a1[35] setShowingTabBar:a2];
      [v6 setHidesTitles:a2 ^ 1];
      [a1[115] layoutIfNeeded];
      uint64_t v10 = MEMORY[0x1E4FB1EB0];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __48__BrowserController__setShowingTabBar_animated___block_invoke;
      uint64_t v17 = &unk_1E6D79148;
      id v18 = a1;
      id v11 = v6;
      id v19 = v11;
      id v12 = v9;
      id v20 = v12;
      id v13 = v8;
      id v21 = v13;
      +[UIView safari_animate:withDuration:animations:](0.25, v10, a3, &v14);
      objc_msgSend(a1[35], "didToggleTabBar", v14, v15, v16, v17, v18);
    }
  }
}

- (BOOL)favoritesFieldShouldBeExpanded
{
  return [(BrowserController *)self favoritesFieldShouldBeExpandedForFavoritesState:self->_favoritesState];
}

- (BOOL)favoritesFieldShouldBeExpandedForFavoritesState:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x2Eu >> a3);
}

- (void)browserViewControllerDidLayOutSubviews:(id)a3
{
  if ([(UIScrollView *)self->_scrollView isDragging]
    || [(UIScrollView *)self->_scrollView isDecelerating])
  {
    char v4 = 1;
  }
  else
  {
    int shouldShowBookmarks = -[BrowserController _shouldShowBookmarksBar]((id *)&self->super.super.super.isa);
    -[BrowserController _setShowBookmarksBar:]((uint64_t)self, shouldShowBookmarks);
    char v4 = 0;
  }
  -[BrowserController _contentContainerViewFrameDidChange]((uint64_t)self);
  if ((v4 & 1) == 0 && self->_interactivelyChangingObscuredInsets)
  {
    [(UIScrollView *)self->_scrollView contentOffset];
    double v7 = v6;
    double v9 = v8;
    [(UIScrollView *)self->_scrollView contentInset];
    if (v9 <= -v10) {
      double v11 = -v10;
    }
    else {
      double v11 = v9;
    }
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v7, v11);
  }
  id v12 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  int v13 = [v12 popoverIsShowing];

  if (v13)
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v19 = *MEMORY[0x1E4F1DB20];
    long long v20 = v14;
    uint64_t v15 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
    id v18 = 0;
    [(BrowserController *)self catalogViewController:v15 willRepositionPopoverToRect:&v19 inView:&v18];
    id v16 = v18;
    uint64_t v17 = [v15 popoverPresentationController];
    [v17 setSourceView:v16];
    objc_msgSend(v17, "setSourceRect:", v19, v20);
  }
}

- (id)_catalogViewController
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 48);
    id v1 = [WeakRetained browserControllerCatalogViewController:v1];
  }
  return v1;
}

- (void)_contentContainerViewFrameDidChange
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 384));
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserControllerContentContainerViewFrameDidChange:a1];
    }
  }
}

- (UIViewController)viewControllerToPresentFrom
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained viewControllerToPresentFromForBrowserController:self];
  }
  else
  {
    char v4 = self->_rootViewController;
  }
  uint64_t v5 = v4;

  return (UIViewController *)v5;
}

- (TabBarManager)tabBarManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  char v4 = [WeakRetained browserControllerTabBarManager:self];

  return (TabBarManager *)v4;
}

- (id)nextResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained browserControllerNextResponder:self];
  }
  else
  {
    char v4 = self->_rootViewController;
  }
  uint64_t v5 = v4;

  return v5;
}

- (BrowserRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (uint64_t)_shouldShowBookmarksBar
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    id v2 = -[BrowserController contentContainerView](a1);
    [v2 bounds];
    double v4 = v3;
    int IsPad = _SFDeviceIsPad();
    if (v4 > *MEMORY[0x1E4F787F8]) {
      int v6 = IsPad;
    }
    else {
      int v6 = 0;
    }
    if (v6 == 1) {
      uint64_t v1 = -[BrowserController _prefersShowingBookmarksBar](v1);
    }
    else {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (id)contentContainerView
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 48);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserControllerContentContainerView:v1];
    }
    else {
    uint64_t v1 = [v1[35] contentContainerView];
    }
  }
  return v1;
}

- (void)_setShowBookmarksBar:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 280) bookmarksBar];
    uint64_t v5 = (BookmarksBarView *)v4;
    if (((v4 == 0) ^ a2))
    {
      double v7 = (BookmarksBarView *)v4;
    }
    else if (a2)
    {
      int v6 = [BookmarksBarView alloc];
      double v7 = -[BookmarksBarView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

      [(BookmarksBarView *)v7 setDelegate:a1];
      [(BookmarksBarView *)v7 setLinkPreviewProvider:a1];
      [(BookmarksBarView *)v7 setNavigationIntentHandler:a1];
      [(BookmarksBarView *)v7 setBrowserController:a1];
      -[BookmarksBarView setButtonStyle:](v7, "setButtonStyle:", -[BrowserController _bookmarksBarLabelButtonDisplayStyle](a1));
      objc_msgSend(*(id *)(a1 + 280), "setBookmarksBar:");
    }
    else
    {
      [*(id *)(a1 + 280) setBookmarksBar:0];
      double v7 = v5;
    }
  }
}

- (int64_t)browserViewController:(id)a3 toolbarPlacementForViewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (_SFDeviceIsPad() && width >= 506.0) {
    return 0;
  }
  int IsPad = _SFDeviceIsPad();
  int64_t result = 0;
  if (((width > height) & ~IsPad) == 0)
  {
    if (self) {
      return _SFWidthIsCompactSizeClass();
    }
  }
  return result;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)usesNarrowLayout
{
  return self->_usesNarrowLayout;
}

- (BOOL)usesTabBar
{
  return self->_usesTabBar;
}

- (TabController)tabController
{
  return self->_tabController;
}

- (void)browserViewController:(id)a3 didUpdateBannerTheme:(id)a4
{
}

- (double)browserViewController:(id)a3 adjustedTopObscuredInsetForBanners:(double)a4
{
  if (![(ContinuousReadingViewController *)self->_continuousReadingViewController isCommittingToContinuousDocument])
  {
    [(_SFWebView *)self->_webView bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    long long v14 = -[BrowserController _topContinuousReadingBanner]((id *)&self->super.super.super.isa);
    uint64_t v15 = v14;
    if (v14)
    {
      webView = self->_webView;
      [v14 bounds];
      -[_SFWebView convertRect:fromView:](webView, "convertRect:fromView:", v15);
      double MaxY = CGRectGetMaxY(v27);
      v28.origin.x = v7;
      v28.origin.y = v9;
      v28.size.double width = v11;
      v28.size.double height = v13;
      double v18 = MaxY - CGRectGetMinY(v28);
      if (v18 <= a4) {
        double v19 = a4;
      }
      else {
        double v19 = v18;
      }
      a4 = v19;
    }
    long long v20 = [(BannerController *)self->_bannerController topBanners];
    id v21 = [v20 lastObject];

    if (v21)
    {
      v22 = self->_webView;
      [v21 bounds];
      -[_SFWebView convertRect:fromView:](v22, "convertRect:fromView:", v21);
      double v23 = CGRectGetMaxY(v29);
      v30.origin.x = v7;
      v30.origin.y = v9;
      v30.size.double width = v11;
      v30.size.double height = v13;
      double v24 = v23 - CGRectGetMinY(v30);
      if (v24 <= a4) {
        double v25 = a4;
      }
      else {
        double v25 = v24;
      }
      a4 = v25;
    }
    if (-[BrowserController _obscuredInsetsIncludeRefreshControl]((uint64_t)self)) {
      a4 = a4 + -[BrowserController _refreshControlHeight]((uint64_t)self);
    }
  }
  return a4;
}

- (uint64_t)_obscuredInsetsIncludeRefreshControl
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 338) || ![*(id *)(result + 304) _isVerticalBouncing]) {
      return 1;
    }
    else {
      return [*(id *)(v1 + 304) isDragging] ^ 1;
    }
  }
  return result;
}

- (BannerController)bannerController
{
  return self->_bannerController;
}

- (id)_topContinuousReadingBanner
{
  if (a1)
  {
    a1 = [a1[11] topBannerView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)additionalContentHeightForBanners
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = [*(id *)(a1 + 88) topBannerView];
  [v1 bounds];
  double Height = CGRectGetHeight(v4);

  return Height;
}

- (double)_refreshControlHeight
{
  if (!a1) {
    return 0.0;
  }
  id v2 = [*(id *)(a1 + 280) refreshControl];
  if (v2)
  {
    [*(id *)(a1 + 304) contentOffset];
    double v4 = v3;
    [*(id *)(a1 + 304) adjustedContentInset];
    double v6 = -v4 - v5;
    if ([v2 isRefreshing])
    {
      [v2 bounds];
      double v6 = v6 + CGRectGetHeight(v9);
    }
    double v7 = fmax(v6, 0.0);
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (int64_t)overrideBarTintStyleForUnifiedBar
{
  if (![(BrowserController *)self isShowingFavorites]) {
    return 0;
  }
  if ([(BrowserController *)self favoritesAreShowingInPopover]) {
    return 0;
  }
  double v3 = [(BrowserController *)self tabBarManager];
  uint64_t v4 = [v3 displayMode];

  if (v4 == 2) {
    return 0;
  }
  double v7 = [MEMORY[0x1E4F98E88] defaultManager];
  double v8 = [v7 image];

  if (v8)
  {
    CGRect v9 = [(BrowserController *)self configuration];
    [v9 barTintStyle];

    if ([v7 appearanceIfImageExists:1] == 2) {
      uint64_t v10 = _SFDarkTintStyleForStyle();
    }
    else {
      uint64_t v10 = _SFLightTintStyleForStyle();
    }
    int64_t v5 = v10;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)continuousReadingViewControllerForBrowserViewController:(id)a3
{
  return self->_continuousReadingViewController;
}

- (BOOL)_shouldUseNarrowLayout
{
  id v2 = [(BrowserRootViewController *)self->_rootViewController view];
  [v2 bounds];
  char IsCompactSizeClass = _SFWidthIsCompactSizeClass();

  return IsCompactSizeClass;
}

- (BOOL)isShowingFavorites
{
  return self->_favoritesState != 0;
}

- (UIPinchGestureRecognizer)tabViewPinchRecognizer
{
  return self->_tabViewPinchRecognizer;
}

- (BOOL)browserViewControllerShouldFreezeWebViewUpdatesForSizeTransition:(id)a3
{
  return self->_freezeWebViewUpdatesForSizeTransition;
}

- (double)browserViewController:(id)a3 adjustedBottomContentInset:(double)a4
{
  int64_t v5 = [(ContinuousReadingViewController *)self->_continuousReadingViewController previewView];
  [v5 rubberBandingHeight];
  double v7 = v6 + a4;

  return v7;
}

- (double)browserViewController:(id)a3 adjustedBottomObscuredInset:(double)a4
{
  uint64_t v6 = [(ContinuousReadingViewController *)self->_continuousReadingViewController previewView];
  if (v6)
  {
    double v7 = (void *)v6;
    BOOL v8 = [(ContinuousReadingViewController *)self->_continuousReadingViewController isCommittingToContinuousDocument];

    if (!v8)
    {
      [(_SFWebView *)self->_webView bounds];
      double MaxY = CGRectGetMaxY(v24);
      webView = self->_webView;
      CGFloat v11 = [(ContinuousReadingViewController *)self->_continuousReadingViewController previewView];
      [v11 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      long long v20 = [(ContinuousReadingViewController *)self->_continuousReadingViewController previewView];
      -[_SFWebView convertRect:fromView:](webView, "convertRect:fromView:", v20, v13, v15, v17, v19);
      double v21 = MaxY - CGRectGetMinY(v25);

      if (v21 >= a4) {
        return v21;
      }
      else {
        return a4;
      }
    }
  }
  return a4;
}

- (id)barManager:(id)a3 visibleBarItemsForLayout:(int64_t)a4 availableItems:(id)a5
{
  id v7 = a5;
  if ([(BrowserRootViewController *)self->_rootViewController toolbarPlacement] == 1)
  {
    if (a4 == 1)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3C73830];
    }
    else
    {
      if (a4) {
        goto LABEL_7;
      }
      uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
    }
    CGRect v9 = (void *)v8;

    id v7 = v9;
  }
LABEL_7:
  return v7;
}

- (void)browserViewControllerDidChangeBarInsets:(id)a3
{
  -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
  [(BrowserController *)self updateExposedScrollViewRect];
  [(BrowserRootViewController *)self->_rootViewController layOutTopBars];
  [(BrowserRootViewController *)self->_rootViewController updateWebViewSizeAttributes];
  [(BrowserController *)self updateScrollToTopView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserControllerLayOutCatalogView:self];

  -[BrowserController _updateDigitalHealthViewFrame]((id *)&self->super.super.super.isa);
  [(BrowserController *)self updateContinuousPreviewViewFrame];
  -[BrowserController _updateAppInfoOverlayFrame]((uint64_t)self);
}

- (void)_updateDigitalHealthViewFrame
{
  if (a1)
  {
    id v14 = [a1[35] screenTimeOverlayViewController];
    if (v14)
    {
      double v2 = -[BrowserController _frameForScreenTimeOverlayViewControllerView](a1);
      double v4 = v3;
      double v6 = v5;
      double v8 = v7;
      CGRect v9 = [v14 view];
      objc_msgSend(v9, "setFrame:", v2, v4, v6, v8);

      int shouldShowTab = -[BrowserController _shouldShowTabBar](a1);
      double v11 = 0.0;
      if (shouldShowTab) {
        +[TabBar defaultHeight];
      }
      [v14 setAdditionalVerticalSafeAreaMargin:v11];
      double v12 = [a1[35] capsuleViewController];
      double v13 = [v12 capsuleCollectionView];
      [v13 obscuredInsets];
      objc_msgSend(v14, "setAdditionalSafeAreaInsets:");
    }
  }
}

- (void)catalogViewControllerDidScroll:(id)a3 animated:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__BrowserController_catalogViewControllerDidScroll_animated___block_invoke;
  v4[3] = &unk_1E6D79060;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:usingDefaultTimingWithOptions:animations:completion:", a4, 50331648, v4, 0);
}

- (BOOL)isControlledByAutomation
{
  return self->_controlledByAutomation;
}

- (TabGroupProvider)tabGroupProvider
{
  return (TabGroupProvider *)self->_tabController;
}

void __56__BrowserController__setNeedsSnapshotUpdateForActiveTab__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 169) = 0;
  if ([*(id *)(a1 + 32) shouldSnapshotActiveTab])
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
    char v2 = [v4 isBlank];
    uint64_t v3 = *(void *)(a1 + 32);
    if ((v2 & 1) != 0 || !*(unsigned char *)(v3 + 170))
    {
      *(unsigned char *)(v3 + 170) = 0;
      [v4 setNeedsNewTabSnapshot];
    }
  }
}

- (BOOL)shouldSnapshotActiveTab
{
  char v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  LOBYTE(v2) = [WeakRetained browserControllerShouldUpdateSnapshotForActiveTab:v2];

  return (char)v2;
}

- (void)updateInterface
{
  if ([(BrowserRootViewController *)self->_rootViewController isViewLoaded])
  {
    -[BrowserController _updateCurrentPageBannerView]((id *)&self->super.super.super.isa);
    -[BrowserController _updateCurrentContinuousReadingItem]((id *)&self->super.super.super.isa);
    id v9 = [(TabController *)self->_tabController activeTabDocument];
    [v9 updateTabTitle];
    BOOL v3 = -[BrowserController _animationsAreEnabled]((uint64_t)self);
    -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, v3);
    -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
    -[BrowserController _updateAppInfoOverlayFrame]((uint64_t)self);
    [(BrowserRootViewController *)self->_rootViewController safari_updateApplicationBackgroundStyle];
    id v4 = [v9 navigationBarItem];
    double v5 = [(BrowserRootViewController *)self->_rootViewController tabBarManager];
    double v6 = [v5 lockdownStatusBar];
    [v6 setNavigationBarItem:v4];

    double v7 = [(TabController *)self->_tabController activeTabDocument];
    -[BrowserRootViewController setInYttriumMode:](self->_rootViewController, "setInYttriumMode:", [v7 inWebClipScope]);

    if ([(NSTimer *)self->_enterYttriumStateTimer isValid])
    {
      double v8 = [v9 view];
      [v8 setInteractionHintPresented:0 animated:0];
    }
  }
}

- (void)_updateSceneTitle
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 888));
    if (WeakRetained)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __38__BrowserController__updateSceneTitle__block_invoke;
      v4[3] = &unk_1E6D79948;
      v4[4] = a1;
      BOOL v3 = __38__BrowserController__updateSceneTitle__block_invoke((uint64_t)v4);
      [WeakRetained setTitle:v3];
    }
  }
}

id __38__BrowserController__updateSceneTitle__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 719))
  {
    char v2 = _WBSLocalizedString();
    goto LABEL_30;
  }
  id v4 = [*(id *)(v1 + 344) activeTabDocument];
  double v5 = [v4 URL];
  double v6 = objc_msgSend(v5, "safari_highLevelDomain");
  double v7 = v6;
  if (!v6)
  {
    double v7 = [v4 title];
  }
  char v2 = objc_msgSend(v7, "safari_stringByAddingSoftBreaksBeforePeriods");
  if (!v6) {

  }
  double v8 = [*(id *)(*(void *)(a1 + 32) + 344) currentTabs];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabGroup];
  double v11 = [*(id *)(*(void *)(a1 + 32) + 344) activeProfile];
  uint64_t v12 = [v11 title];
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 624);
  *(void *)(v13 + 624) = v12;

  uint64_t v15 = v9 - 1;
  if ([*(id *)(a1 + 32) hasMultipleProfiles] && (objc_msgSend(v10, "isNamed") & 1) == 0)
  {
    if (v9 == 1)
    {
      CGRect v29 = NSString;
      double v16 = _WBSLocalizedString();
      uint64_t v25 = objc_msgSend(v29, "localizedStringWithFormat:", v16, *(void *)(*(void *)(a1 + 32) + 624), v2);
      goto LABEL_27;
    }
    if (v9 == 2)
    {
      v26 = NSString;
      double v16 = _WBSLocalizedString();
      objc_msgSend(v26, "localizedStringWithFormat:", v16, *(void *)(*(void *)(a1 + 32) + 624), v2);
    }
    else
    {
      CGRect v30 = NSString;
      double v16 = _WBSLocalizedString();
      objc_msgSend(v30, "localizedStringWithFormat:", v16, *(void *)(*(void *)(a1 + 32) + 624), v2, v15);
    }
    uint64_t v25 = LABEL_17:;
LABEL_27:
    CGRect v28 = (void *)v25;
LABEL_28:

    char v2 = v28;
    goto LABEL_29;
  }
  if ([v10 isNamed])
  {
    double v16 = [v10 displayTitle];
    uint64_t v17 = *(void *)(a1 + 32);
    double v18 = *(void **)(v17 + 624);
    *(void *)(v17 + 624) = 0;

    if (v9 == 1)
    {
      CGRect v27 = NSString;
      long long v20 = _WBSLocalizedString();
      uint64_t v21 = objc_msgSend(v27, "localizedStringWithFormat:", v20, v16, v2);
    }
    else
    {
      double v19 = NSString;
      _WBSLocalizedString();
      if (v9 == 2) {
        long long v20 = {;
      }
        objc_msgSend(v19, "localizedStringWithFormat:", v20, v16, v2);
      }
      else {
        long long v20 = {;
      }
        objc_msgSend(v19, "localizedStringWithFormat:", v20, v16, v2, v15);
      uint64_t v21 = };
    }
    CGRect v28 = (void *)v21;

    goto LABEL_28;
  }
  uint64_t v22 = *(void *)(a1 + 32);
  double v23 = *(void **)(v22 + 624);
  *(void *)(v22 + 624) = 0;

  if (v9 != 1)
  {
    CGRect v24 = NSString;
    double v16 = _WBSLocalizedString();
    if (v9 == 2) {
      objc_msgSend(v24, "localizedStringWithFormat:", v16, v2);
    }
    else {
      objc_msgSend(v24, "localizedStringWithFormat:", v16, v2, v9 - 1);
    }
    goto LABEL_17;
  }
LABEL_29:

LABEL_30:
  return v2;
}

- (void)_restoreDigitalHealthFunctionalityAfterAppTransition
{
  if (a1)
  {
    [a1[107] startObserving];
    id v5 = [a1[43] activeTabDocument];
    if (v5)
    {
      [a1 updatePrivateBrowsingAvailabilityWithCompletionHandler:0];
      if ([v5 shouldObscureForDigitalHealth]) {
        -[BrowserController _showDigitalHealthOverlayForTabDocument:withPolicy:animated:]((uint64_t)a1, v5, [v5 policy], 1);
      }
      [a1[43] updateUsageTrackingInformationIfNecessary];
      char v2 = (void *)MEMORY[0x1E4F1CAD0];
      BOOL v3 = [a1[43] activeTabDocument];
      id v4 = [v2 setWithObject:v3];
      -[BrowserController _updateDigitalHealthOverlayForTabDocuments:](a1, v4);
    }
  }
}

- (void)updatePrivateBrowsingAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = +[FeatureManager sharedFeatureManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__BrowserController_updatePrivateBrowsingAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D79238;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 determineIfPrivateBrowsingIsAvailableWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_updateDigitalHealthOverlayForTabDocuments:(void *)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v20 = a2;
  if (a1 && [v20 count])
  {
    BOOL v3 = [MEMORY[0x1E4F1CA80] set];
    id v4 = [MEMORY[0x1E4F1CA80] set];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v30 = 0u;
    long long v29 = 0u;
    id v5 = v20;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "URL", v20);
          double v11 = objc_msgSend(v10, "safari_canonicalURL");

          if (v11)
          {
            [v3 addObject:v11];
            [v4 addObject:v9];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v6);
    }

    uint64_t v12 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v13 = v4;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v12, "addPointer:", *(void *)(*((void *)&v25 + 1) + 8 * j), v20);
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v14);
    }

    objc_initWeak(&location, a1);
    uint64_t v17 = (void *)a1[107];
    double v18 = [v3 allObjects];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__BrowserController__updateDigitalHealthOverlayForTabDocuments___block_invoke;
    v21[3] = &unk_1E6D79E30;
    objc_copyWeak(&v23, &location);
    id v19 = v12;
    id v22 = v19;
    [v17 getOverlayStateForURLs:v18 withCompletionHandler:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (uint64_t)_isStartPageOverriddenByExtensionInTabDocument:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v5 = [v3 webExtensionsController];
    if ([v3 isPrivateBrowsingEnabled]
      && ([v5 tabOverridePreferencesManager],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 shouldNewTabPageOverriddenByAnEnabledExtensionApplyInPrivateBrowsingWithUserDefaults:v4], v6, (v7 & 1) == 0))
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v8 = [v5 tabOverridePreferencesManager];
      uint64_t v9 = [v8 isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:v4];

      [v4 setBool:v9 ^ 1 forKey:*MEMORY[0x1E4F78740]];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (TabDocument)tabDocumentPlayingPIPVideo
{
  return self->_tabDocumentPlayingPIPVideo;
}

- (BOOL)tabDocumentIsBackgroundPreloading:(id)a3
{
  id v4 = (TabDocument *)a3;
  BOOL v5 = self->_speculativeLoadDocument == v4
    || [(BrowserController *)self isContinuousReadingDocument:v4];

  return v5;
}

- (BOOL)isContinuousReadingDocument:(id)a3
{
  id v4 = (TabDocument *)a3;
  if (v4) {
    BOOL v5 = self->_previousContinuousItemDocument == v4 || self->_nextContinuousItemDocument == v4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSuspendedOrSuspending
{
  return self->_suspendedOrSuspending;
}

- (void)tabControllerDocumentCountDidChange:(id)a3
{
  BOOL v4 = -[BrowserController _animationsAreEnabled]((uint64_t)self);
  -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, v4);
  -[BrowserController _updateSceneTitle]((uint64_t)self);
}

- (void)setNeedsSnapshotUpdateForActiveTabIfTabIsBlank
{
  BOOL v2 = self->_needsSnapshotUpdateForBlankTabs || !self->_needsSnapshotUpdateForActiveTab;
  self->_needsSnapshotUpdateForBlankTabs = v2;
  -[BrowserController _setNeedsSnapshotUpdateForActiveTab]((uint64_t)self);
}

- (void)_setNeedsSnapshotUpdateForActiveTab
{
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 169))
    {
      *(unsigned char *)(a1 + 169) = 1;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__BrowserController__setNeedsSnapshotUpdateForActiveTab__block_invoke;
      block[3] = &unk_1E6D79060;
      block[4] = a1;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (uint64_t)_dismissTransientUIAnimated:(uint64_t)a3 dismissalOptions:(void *)a4 completionHandler:
{
  id v39 = a4;
  if (!a1)
  {
    uint64_t v33 = 0;
    v34 = v39;
    goto LABEL_48;
  }
  group = dispatch_group_create();
  id v7 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
  BOOL v8 = [v7 presentationState] == 1 || objc_msgSend(v7, "presentationState") == 2;

  if ((a3 & 2) == 0) {
    [v7 dismissAnimated:a2];
  }
  uint64_t v9 = [*(id *)(a1 + 344) activeTabDocument];
  int v10 = [v9 hideFindOnPage];

  int v11 = [(id)a1 favoritesAreEmbedded];
  int v12 = [(id)a1 favoritesFieldShouldBeExpanded];
  LODWORD(v13) = v10 | v8;
  if ((a3 & 1) == 0)
  {
    int v14 = v12;
    if (v11 ^ 1 | v12)
    {
      if (v11) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = 0;
      }
      dispatch_group_enter(group);
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke;
      v52[3] = &unk_1E6D79060;
      double v16 = group;
      v53 = v16;
      [(id)a1 setFavoritesState:v15 animated:a2 completionHandler:v52];
      [*(id *)(a1 + 456) setFavoritesState:0];
      LODWORD(v13) = v13 | v14;
      if (((v11 | v13) & 1) == 0)
      {
        uint64_t v13 = [*(id *)(a1 + 280) capsuleViewController];

        if (v13)
        {
          dispatch_group_enter(v16);
          uint64_t v17 = [*(id *)(a1 + 280) capsuleViewController];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_2;
          v50[3] = &unk_1E6D79060;
          v51 = v16;
          LOBYTE(v13) = [v17 transitionToState:0 animated:a2 completionHandler:v50];
        }
      }
    }
  }
  double v18 = -[BrowserController _catalogViewController]((id *)a1);
  [v18 dismissUniversalSearchFirstTimeExperienceViewControllerIfNeeded];

  if (!*(unsigned char *)(a1 + 578)
    && [*(id *)(a1 + 752) isShowingSidebar]
    && [(id)a1 _bookmarksPresentationStyle] == 1)
  {
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_3;
    v48[3] = &unk_1E6D791E8;
    v48[4] = a1;
    id v19 = group;
    v49 = v19;
    id v20 = (void (**)(void))MEMORY[0x1E4E42950](v48);
    dispatch_group_enter(v19);
    if (a2) {
      v20[2](v20);
    }
    else {
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
    }

    LOBYTE(v13) = 1;
  }
  uint64_t v21 = [*(id *)(a1 + 344) activeTabDocument];
  id v22 = [v21 dialogController];

  id v23 = [v22 presentedDialog];
  CGRect v24 = v23;
  if (v23 && [v23 presentationStyle] == 1)
  {
    [v22 cancelPresentedDialogIfNeeded];
LABEL_27:
    char v25 = 1;
    goto LABEL_29;
  }
  if (v13) {
    goto LABEL_27;
  }
  char v25 = [(id)a1 isPresentingModalBookmarksController];
LABEL_29:
  dispatch_group_enter(group);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_4;
  v46[3] = &unk_1E6D79060;
  long long v26 = group;
  v47 = v26;
  -[BrowserController _setPresentingModalBookmarksController:exclusively:importHandler:withCollection:bookmarkUUIDString:animated:completion:]((id *)a1, 0, 0, 0, 0, 0, a2, v46);
  long long v27 = [(id)a1 viewControllerToPresentFrom];
  long long v28 = [v27 presentedViewController];

  if (!v28) {
    goto LABEL_44;
  }
  if ((a3 & 4) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_44;
    }
  }
  if ([v28 isBeingDismissed]) {
    goto LABEL_44;
  }
  long long v29 = v28;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        && (!NSClassFromString((NSString *)@"OBWelcomeController") || (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v37 = [v29 viewControllers];
          v38 = [v37 firstObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            goto LABEL_44;
          }
        }
        else
        {
        }
        dispatch_group_enter(v26);
        long long v30 = [v29 presentingViewController];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_5;
        v44[3] = &unk_1E6D79060;
        v45 = v26;
        [v30 dismissViewControllerAnimated:a2 completion:v44];

        char v25 = 1;
        long long v29 = v45;
      }
    }
  }

LABEL_44:
  long long v31 = [*(id *)(a1 + 344) activeTabDocument];
  long long v32 = [v31 printController];

  if (v25) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = [v32 isDisplayingPrintUI];
  }
  [v32 dismissPrintInteractionControllerAnimated:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_6;
  block[3] = &unk_1E6D799E8;
  block[4] = a1;
  uint64_t v43 = a3;
  v34 = v39;
  id v42 = v39;
  dispatch_group_notify(v26, MEMORY[0x1E4F14428], block);

LABEL_48:
  return v33;
}

- (void)showBars
{
  if (![(BrowserRootViewController *)self->_rootViewController isInYttriumState])
  {
    id v8 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
    id v3 = [v8 capsuleCollectionView];
    int v4 = [v3 selectedItemIsMinimized];

    if (v4) {
      [v8 transitionToState:0 animated:1 completionHandler:0];
    }
    BOOL v5 = [(BrowserController *)self tabBarManager];
    uint64_t v6 = [v5 inlineTabBar];
    [v6 revealActiveItemIfNeeded];

    id v7 = [(BrowserRootViewController *)self->_rootViewController dynamicBarAnimator];
    [v7 attemptTransitionToState:1 animated:1];
  }
}

- (void)_setPresentingModalBookmarksController:(int)a3 exclusively:(void *)a4 importHandler:(void *)a5 withCollection:(void *)a6 bookmarkUUIDString:(uint64_t)a7 animated:(void *)a8 completion:
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  double v18 = a8;
  if (a1)
  {
    if ([a1 isPresentingModalBookmarksController] == a2
      || [a1[35] isShowingDefaultBrowserSheet])
    {
      if (v18) {
        v18[2](v18);
      }
    }
    else
    {
      id v19 = a1[20];
      if (a2)
      {
        if (!v19)
        {
          id v20 = -[BrowserController _newModalBookmarksControllerWithCollection:showsOnlyActiveCollection:]((uint64_t)a1, v16, v15 != 0);
          id v21 = a1[20];
          a1[20] = v20;
        }
        if (v15) {
          a3 = 1;
        }
        if (a3 == 1 && v16)
        {
          [a1[20] setCurrentCollection:v16];
        }
        else if (v16)
        {
          [a1 setCurrentBookmarksCollection:v16];
        }
        [a1[20] setRootBookmarkUUIDString:v17];
        [a1[20] setImportHandler:v15];
        [a1[20] setPrefersHalfHeightSheetPresentationWithLoweredBar:a3 ^ 1u];
        char v25 = [a1[20] presentationController];
        [v25 setDelegate:a1];

        -[BrowserController _presentModalViewController:fromBarItem:animated:completion:](a1, a1[20], 3, a7, v18);
      }
      else
      {
        id v22 = v19;
        id v23 = a1[20];
        a1[20] = 0;

        if (([v22 isBeingDismissed] & 1) == 0)
        {
          CGRect v24 = [v22 presentedViewController];
          if (v24)
          {
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __140__BrowserController__setPresentingModalBookmarksController_exclusively_importHandler_withCollection_bookmarkUUIDString_animated_completion___block_invoke;
            v26[3] = &unk_1E6D79A10;
            id v27 = v22;
            char v29 = a7;
            long long v28 = v18;
            [v24 dismissViewControllerAnimated:0 completion:v26];
          }
          else
          {
            [v22 dismissViewControllerAnimated:a7 completion:v18];
          }
        }
      }
    }
  }
}

- (BOOL)isPresentingModalBookmarksController
{
  BOOL v2 = [(BookmarksNavigationController *)self->_modalBookmarksController presentingViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

void __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_4(uint64_t a1)
{
}

- (double)catalogViewControllerPopoverWidth:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserControllerCatalogViewPopoverWidth:self];
  double v6 = v5;

  return v6;
}

- (double)catalogViewControllerPopoverMaxHeight:(id)a3
{
  return 1.79769313e308;
}

void __76__BrowserController_updatePrivateBrowsingAvailabilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (!v4) {
      goto LABEL_7;
    }
    BOOL v3 = (unsigned __int8 *)(a1 + 48);
    goto LABEL_6;
  }
  BOOL v3 = (unsigned __int8 *)(a1 + 48);
  [WeakRetained _updatePrivateBrowsingAvailability:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
LABEL_6:
  }
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *v3);
LABEL_7:
}

- (SFSiriLinkCoordinator)siriLinkCoordinator
{
  siriLinkCoordinator = self->_siriLinkCoordinator;
  if (!siriLinkCoordinator)
  {
    uint64_t v4 = (SFSiriLinkCoordinator *)objc_alloc_init(MEMORY[0x1E4F78358]);
    id v5 = self->_siriLinkCoordinator;
    self->_siriLinkCoordinator = v4;

    [(SFSiriLinkCoordinator *)self->_siriLinkCoordinator setActionPerformer:self];
    siriLinkCoordinator = self->_siriLinkCoordinator;
  }
  return siriLinkCoordinator;
}

- (BrowserController)initWithUUID:(id)a3 sceneID:(id)a4 browserWindowController:(id)a5 tabGroupManager:(id)a6 controlledByAutomation:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  obuint64_t j = a5;
  id v94 = a6;
  v110.receiver = self;
  v110.super_class = (Class)BrowserController;
  id v15 = [(BrowserController *)&v110 init];
  if (v15)
  {
    objc_initWeak(&location, v15);
    objc_storeWeak((id *)&v15->_browserWindowController, obj);
    objc_storeStrong((id *)&v15->_UUID, a3);
    v15->_controlledByAutomation = a7;
    id v92 = v14;
    id v93 = v13;
    v95 = [obj uiDelegateForBrowserController:v15];
    objc_storeWeak((id *)&v15->_uiDelegate, v95);
    id v16 = objc_alloc_init(BannerController);
    bannerController = v15->_bannerController;
    v15->_bannerController = v16;

    double v18 = objc_alloc_init(StatusBarSpinnerController);
    spinnerController = v15->_spinnerController;
    v15->_spinnerController = v18;

    id v20 = [[UserActivityController alloc] initWithBrowserController:v15];
    userActivityController = v15->_userActivityController;
    v15->_userActivityController = v20;

    id v22 = objc_alloc_init(ApplicationShortcutController);
    shortcutController = v15->_shortcutController;
    v15->_shortcutController = v22;

    [(ApplicationShortcutController *)v15->_shortcutController setBrowserController:v15];
    v15->_suspendedOrSuspending = 1;
    objc_storeStrong((id *)&v15->_sceneID, a4);
    CGRect v24 = (WKPreferences *)objc_alloc_init(MEMORY[0x1E4F46688]);
    wkPreferences = v15->_wkPreferences;
    v15->_wkPreferences = v24;

    [(WKPreferences *)v15->_wkPreferences _setTelephoneNumberDetectionIsEnabled:1];
    [(WKPreferences *)v15->_wkPreferences _setShouldSuppressKeyboardInputDuringProvisionalNavigation:1];
    [(WKPreferences *)v15->_wkPreferences _setDiagnosticLoggingEnabled:1];
    [(WKPreferences *)v15->_wkPreferences _setShouldAllowUserInstalledFonts:0];
    [(WKPreferences *)v15->_wkPreferences _setShouldIgnoreMetaViewport:_SFDeviceSupportsDesktopSitesByDefault()];
    [(WKPreferences *)v15->_wkPreferences setShouldPrintBackgrounds:1];
    [(WKPreferences *)v15->_wkPreferences sf_applySafariStorageBlockingPolicy];
    [(BrowserController *)v15 updateSpeculativeLoadingPreferences];
    long long v26 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    -[WKPreferences _setNeedsSiteSpecificQuirks:](v15->_wkPreferences, "_setNeedsSiteSpecificQuirks:", [v26 BOOLForKey:*MEMORY[0x1E4F789F8]]);

    [(WKPreferences *)v15->_wkPreferences _setMediaDevicesEnabled:1];
    id v27 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    -[WKPreferences _setMediaSourceEnabled:](v15->_wkPreferences, "_setMediaSourceEnabled:", [v27 BOOLForKey:*MEMORY[0x1E4F78980]]);

    if (objc_opt_respondsToSelector())
    {
      long long v28 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v28 doubleForKey:*MEMORY[0x1E4F78968]];
      double v30 = v29;

      if (v30 != 0.0) {
        [(WKPreferences *)v15->_wkPreferences _setManagedMediaSourceLowThreshold:v30];
      }
      long long v31 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      [v31 doubleForKey:*MEMORY[0x1E4F78960]];
      double v33 = v32;

      if (v33 != 0.0) {
        [(WKPreferences *)v15->_wkPreferences _setManagedMediaSourceHighThreshold:v33];
      }
    }
    [(WKPreferences *)v15->_wkPreferences setElementFullscreenEnabled:_SFDeviceSupportsWebKitFullscreenAPI()];
    if (objc_opt_respondsToSelector()) {
      -[WKPreferences _setTextExtractionEnabled:](v15->_wkPreferences, "_setTextExtractionEnabled:", [MEMORY[0x1E4F97EA0] isWebKitTextExtractionEnabled]);
    }
    -[BrowserController _updateMediaCaptureConfiguration]((uint64_t)v15);
    v15->_canFocusNavigationBarURL = 1;
    v34 = [[BrowserRootViewController alloc] initWithBrowserController:v15];
    rootViewController = v15->_rootViewController;
    v15->_rootViewController = v34;

    [(BrowserRootViewController *)v15->_rootViewController setDelegate:v15];
    v36 = [v95 browserController:v15 delegateForBannerController:v15->_bannerController];
    [(BannerController *)v15->_bannerController setDelegate:v36];

    v37 = [v95 sidebarUIProxyForBrowserController:v15];
    -[BrowserController _setSidebarUIProxy:]((uint64_t)v15, v37);

    objc_storeStrong((id *)&v15->_tabGroupManager, a6);
    v38 = [[TabController alloc] initWithBrowserController:v15];
    tabController = v15->_tabController;
    v15->_tabController = v38;

    uint64_t v40 = [(TabController *)v15->_tabController tabCollectionViewProvider];
    tabCollectionViewProvider = v15->_tabCollectionViewProvider;
    v15->_tabCollectionViewProvider = (TabCollectionViewProviding *)v40;

    [(TabCollectionViewProviding *)v15->_tabCollectionViewProvider setSnapshotsEnabled:0];
    [(TabController *)v15->_tabController addDocumentObserver:v15];
    id v42 = [MEMORY[0x1E4F78558] settings];
    uint64_t v43 = [(BrowserController *)v15 UUID];
    -[TabController setPrivateBrowsingEnabled:](v15->_tabController, "setPrivateBrowsingEnabled:", [v42 privateBrowsingEnabledForWindowWithUUID:v43]);

    v44 = [obj pinnedTabsManager];
    [(TabController *)v15->_tabController setPinnedTabsManager:v44];

    v45 = (_SFBarManager *)objc_alloc_init(MEMORY[0x1E4F3AF18]);
    barManager = v15->_barManager;
    v15->_barManager = v45;

    [(_SFBarManager *)v15->_barManager setDelegate:v15];
    v47 = [MEMORY[0x1E4F3AF68] sharedManager];
    [v47 totalProgress];
    -[_SFBarManager setDownloadsItemProgress:](v15->_barManager, "setDownloadsItemProgress:");

    v48 = v15->_barManager;
    v49 = (void *)MEMORY[0x1E4FB1970];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke;
    v107[3] = &unk_1E6D797E0;
    objc_copyWeak(&v108, &location);
    v50 = objc_msgSend(v49, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", &stru_1F3C268E8, 0, 0, 8, v107);
    [(_SFBarManager *)v48 setBarItem:0 menu:v50];

    v51 = v15->_barManager;
    v52 = (void *)MEMORY[0x1E4FB1970];
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_2;
    v105[3] = &unk_1E6D797E0;
    objc_copyWeak(&v106, &location);
    v53 = objc_msgSend(v52, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", &stru_1F3C268E8, 0, 0, 8, v105);
    [(_SFBarManager *)v51 setBarItem:1 menu:v53];

    v54 = v15->_barManager;
    v55 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_bookmarkMenu");
    [(_SFBarManager *)v54 setBarItem:3 menu:v55];

    v56 = v15->_barManager;
    v57 = (void *)MEMORY[0x1E4FB1970];
    v103[0] = MEMORY[0x1E4F143A8];
    v103[1] = 3221225472;
    v103[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_3;
    v103[3] = &unk_1E6D797E0;
    objc_copyWeak(&v104, &location);
    v58 = objc_msgSend(v57, "safari_menuWithTitle:uncachedChildrenProvider:", @"Debug (Internal Only)", v103);
    [(_SFBarManager *)v56 setBarItem:6 menu:v58];

    -[BrowserController _updateAddTabMenuProvider](v15);
    -[BrowserController _updateBookmarksMenuProvider]((uint64_t)v15);
    v59 = v15->_barManager;
    v60 = [(TabController *)v15->_tabController tabExposeMenu];
    [(_SFBarManager *)v59 setBarItem:8 menu:v60];

    v61 = v15->_barManager;
    v62 = [(TabController *)v15->_tabController tabGroupsMenuForTabGroupButton:1];
    [(_SFBarManager *)v61 setBarItem:2 menu:v62];

    [(_SFBarManager *)v15->_barManager setBarItem:11 hidden:1];
    v63 = [(BrowserController *)v15 tabBarManager];
    [v63 addObserver:v15];
    [(TabCollectionViewProviding *)v15->_tabCollectionViewProvider setTabBarManager:v63];
    v64 = objc_alloc_init(LibraryConfiguration);
    [(LibraryConfiguration *)v64 setNavigationIntentHandler:v15];
    [(LibraryConfiguration *)v64 setLinkPreviewProvider:v15];
    [(LibraryConfiguration *)v64 setTabGroupProvider:v15->_tabController];
    [(LibraryConfiguration *)v64 setDownloadOpenHandler:v15];
    [(LibraryConfiguration *)v64 setLibraryItemOpenHandler:v15];
    [(LibraryConfiguration *)v64 setBookmarksNavigationControllerDelegate:v15];
    v65 = [obj pinnedTabsManager];
    [(LibraryConfiguration *)v64 setPinnedTabsManager:v65];

    v66 = [(TabCollectionViewProviding *)v15->_tabCollectionViewProvider iconPool];
    [(LibraryConfiguration *)v64 setTabIconPool:v66];

    v67 = [[LibraryController alloc] initWithConfiguration:v64];
    libraryController = v15->_libraryController;
    v15->_libraryController = v67;

    [(LibraryController *)v15->_libraryController setSidebarUIProxy:v15->_sidebarUIProxy];
    -[BrowserController _updateConfiguration]((uint64_t)v15);
    v69 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v69 addObserver:v15 selector:sel__perSitePreferencesDidChange_ name:*MEMORY[0x1E4F789C0] object:0];

    v70 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v70 addObserver:v15 selector:sel__perSitePreferencesDidChangeRemotely_ name:*MEMORY[0x1E4F99450] object:0];

    v71 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v71 addObserver:v15 selector:sel__contentBlockersPerSitePreferenceDidChange_ name:*MEMORY[0x1E4F99378] object:0];
    [v71 addObserver:v15 selector:sel__automaticPasswordInputViewNotification_ name:*MEMORY[0x1E4F3B100] object:0];
    [v71 addObserver:v15 selector:sel__automaticPasswordInputViewAutoFillContextProviderRequiredNotification_ name:*MEMORY[0x1E4F3B0F8] object:0];
    [v71 addObserver:v15 selector:sel__defaultSearchEngineDidChange_ name:*MEMORY[0x1E4F3B1D0] object:0];
    [v71 addObserver:v15 selector:sel__trialABGroupIdentifierDidChange_ name:*MEMORY[0x1E4F981E8] object:0];
    [v71 addObserver:v15 selector:sel__didDismissManageExtensionsViewController_ name:*MEMORY[0x1E4F78718] object:0];
    [v71 addObserver:v15 selector:sel__perSiteLockdownModePreferenceDidChange_ name:*MEMORY[0x1E4F99380] object:0];
    [v71 addObserver:v15 selector:sel__voiceSearchAvailabilityDidChange_ name:*MEMORY[0x1E4F78868] object:0];
    [v71 addObserver:v15 selector:sel__profileWallpaperDidChange_ name:*MEMORY[0x1E4F993C0] object:0];
    v72 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v72 addObserver:v15 selector:sel__backgroundImageFileModifiedRemotely_ name:*MEMORY[0x1E4FB6100] object:0];

    v73 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v73 addObserver:v15 selector:sel__backgroundImageNeedsCloudKitUpdate_ name:*MEMORY[0x1E4F99670] object:0];

    [v71 addObserver:v15 selector:sel__beganSharingTabGroup_ name:*MEMORY[0x1E4F787E0] object:0];
    uint64_t v74 = [MEMORY[0x1E4F1CA48] array];
    queuedToastViewControllers = v15->_queuedToastViewControllers;
    v15->_queuedToastViewControllers = (NSMutableArray *)v74;

    uint64_t v76 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    cachedParticipantLists = v15->_cachedParticipantLists;
    v15->_cachedParticipantLists = (NSMapTable *)v76;

    v78 = +[Application sharedApplication];
    [v71 addObserver:v15 selector:sel__lockedPrivateBrowsingStateDidChange name:@"lockedPrivateBrowsingStateDidChangeNotification" object:v78];

    objc_initWeak(&v102, v15->_barManager);
    objc_initWeak(&from, v15->_rootViewController);
    v79 = [MEMORY[0x1E4F3AF68] sharedManager];
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_15;
    v97[3] = &unk_1E6D79920;
    id v80 = v79;
    id v98 = v80;
    objc_copyWeak(&v99, &from);
    objc_copyWeak(&v100, &v102);
    [v80 getDownloadsWithCompletionHandler:v97];
    [(BrowserController *)v15 updateJavaScriptPreferences];
    -[BrowserController _updateMediaCaptureConfiguration]((uint64_t)v15);
    -[BrowserController _observeInitializedWebKitFeatures]((uint64_t)v15);
    [(BrowserController *)v15 updateApplePayPreferences];
    if (v15->_controlledByAutomation)
    {
      v81 = +[Application sharedApplication];
      v82 = [v81 automationController];
      [v82 updatePreferencesForAutomation:v15->_wkPreferences];
    }
    v15->_suppressWebExtensionEvents = 1;
    v83 = [[WebExtensionWindow alloc] initWithBrowserController:v15 isPrivateWindow:0];
    normalExtensionWindow = v15->_normalExtensionWindow;
    v15->_normalExtensionWindow = v83;

    v85 = [[WebExtensionWindow alloc] initWithBrowserController:v15 isPrivateWindow:1];
    privateExtensionWindow = v15->_privateExtensionWindow;
    v15->_privateExtensionWindow = v85;

    [(SFBrowserController *)v15 setProxy:v15];
    if ([MEMORY[0x1E4F97EA0] isInternalInstall])
    {
      objc_msgSend(v71, "safari_addObserver:selector:forUserDefaultKey:", v15, sel__debugAutoFillConsoleLoggingEnabledPreferenceDidChange_, *MEMORY[0x1E4F99100]);
      [(BrowserController *)v15 _debugAutoFillConsoleLoggingEnabledPreferenceDidChange:0];
    }
    id v87 = objc_alloc_init(MEMORY[0x1E4F466F8]);
    uint64_t v88 = [v87 defaultWebpagePreferences];
    defaultWebpagePreferences = v15->_defaultWebpagePreferences;
    v15->_defaultWebpagePreferences = (WKWebpagePreferences *)v88;

    [(WKWebpagePreferences *)v15->_defaultWebpagePreferences addObserver:v15 forKeyPath:*MEMORY[0x1E4F99298] options:4 context:lockdownModeObserverContext];
    v90 = v15;
    objc_destroyWeak(&v100);
    objc_destroyWeak(&v99);

    objc_destroyWeak(&from);
    objc_destroyWeak(&v102);

    objc_destroyWeak(&v104);
    objc_destroyWeak(&v106);
    objc_destroyWeak(&v108);

    objc_destroyWeak(&location);
    id v14 = v92;
    id v13 = v93;
  }

  return v15;
}

- (void)_updateMediaCaptureConfiguration
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 840), "_setMockCaptureDevicesEnabled:", objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E4F78920]));
    objc_msgSend(*(id *)(a1 + 840), "_setMediaCaptureRequiresSecureConnection:", objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E4F78890]) ^ 1);
    objc_msgSend(*(id *)(a1 + 840), "_setEnumeratingAllNetworkInterfacesEnabled:", objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E4F78910]));
    objc_msgSend(*(id *)(a1 + 840), "_setICECandidateFilteringEnabled:", objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E4F788F8]) ^ 1);
  }
}

- (void)updateJavaScriptPreferences
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WKPreferences setJavaScriptEnabled:](self->_wkPreferences, "setJavaScriptEnabled:", objc_msgSend(v3, "safari_isJavaScriptEnabled"));
  -[WKPreferences setJavaScriptCanOpenWindowsAutomatically:](self->_wkPreferences, "setJavaScriptCanOpenWindowsAutomatically:", objc_msgSend(v3, "safari_javaScriptCanOpenWindowsAutomatically"));
}

- (void)updateApplePayPreferences
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WKPreferences _setApplePayCapabilityDisclosureAllowed:](self->_wkPreferences, "_setApplePayCapabilityDisclosureAllowed:", [v3 BOOLForKey:*MEMORY[0x1E4F78898]]);
}

- (void)didBecomeActive
{
  [(TabCollectionViewProviding *)self->_tabCollectionViewProvider setSnapshotsEnabled:1];
  [(TabCollectionViewProviding *)self->_tabCollectionViewProvider setPostponedSnapshotInvalidationCondition:0];
  [(UIScrollView *)self->_scrollView flashScrollIndicators];
  id v13 = [(TabController *)self->_tabController activeTabDocument];
  [(NSDate *)self->_resignActiveDate timeIntervalSinceNow];
  if (v3 < -480.0)
  {
    [(BrowserController *)self showBars];
    uint64_t v4 = [(BrowserRootViewController *)self->_rootViewController tabBar];
    id v5 = [v13 tabBarItem];
    [v4 scrollToItem:v5 animated:0];

    [v13 stopAdvertisingProactiveActivityContent];
  }
  double v6 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  [v6 resume];

  -[BrowserController _restoreDigitalHealthFunctionalityAfterAppTransition]((id *)&self->super.super.super.isa);
  id v7 = [v13 appBanner];
  -[BrowserController _setShowingAppBanner:isShowing:]((uint64_t)self, v7, 1);

  if (!self->_suppressWebExtensionEvents)
  {
    id v8 = [v13 webExtensionsController];
    uint64_t v9 = v8;
    if (self->_privateBrowsingEnabled) {
      int v10 = &OBJC_IVAR___BrowserController__privateExtensionWindow;
    }
    else {
      int v10 = &OBJC_IVAR___BrowserController__normalExtensionWindow;
    }
    [v8 didActivateWindow:*(Class *)((char *)&self->super.super.super.isa + *v10)];
  }
  [(BrowserController *)self updatePresenceForActiveUser];
  int v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v12 = [(BrowserController *)self activeProfileIdentifier];
  [v11 setObject:v12 forKey:*MEMORY[0x1E4F78700]];

  setPrimaryWindowEntityFromBrowserController(self);
}

- (void)updatePresenceForActiveUser
{
  tabGroupManager = self->_tabGroupManager;
  id v5 = [(TabController *)self->_tabController activeTabDocument];
  double v3 = [v5 uuid];
  uint64_t v4 = [v3 UUIDString];
  [(WBTabGroupManager *)tabGroupManager movePresenceForParticipantToTabWithUUID:v4];
}

- (void)_updateBookmarksMenuProvider
{
  if (!a1) {
    return;
  }
  if ((_SFDeviceIsPad() & 1) == 0)
  {
    double v3 = *(void **)(a1 + 832);
    goto LABEL_6;
  }
  id v5 = [(id)a1 tabBarManager];
  uint64_t v2 = [v5 displayMode];

  double v3 = *(void **)(a1 + 832);
  if (!v2)
  {
LABEL_6:
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_bookmarkMenu");
    goto LABEL_7;
  }
  uint64_t v4 = [*(id *)(a1 + 344) tabGroupsMenuForTabGroupButton:0];
LABEL_7:
  id v6 = (id)v4;
  [v3 setBarItem:3 menu:v4];
}

- (void)_updateAddTabMenuProvider
{
  if (val)
  {
    objc_initWeak(&location, val);
    uint64_t v2 = (void *)*((void *)val + 104);
    double v3 = (void *)MEMORY[0x1E4FB1970];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __46__BrowserController__updateAddTabMenuProvider__block_invoke;
    id v8 = &unk_1E6D797E0;
    objc_copyWeak(&v9, &location);
    uint64_t v4 = objc_msgSend(v3, "safari_menuWithUncachedChildrenProvider:", &v5);
    objc_msgSend(v2, "setBarItem:menu:", 7, v4, v5, v6, v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_debugAutoFillConsoleLoggingEnabledPreferenceDidChange:(id)a3
{
  id v16 = a3;
  if (([MEMORY[0x1E4F97EA0] isInternalInstall] & 1) == 0)
  {
    id v8 = [NSString stringWithFormat:&stru_1F3C268E8];
    id v9 = NSString;
    int v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Safari/iOS/MobileSafari/BrowserController.mm"];
    int v11 = [v10 lastPathComponent];
    uint64_t v12 = [v8 length];
    if (v12)
    {
      id v13 = [NSString stringWithFormat:@", %@", v8];
    }
    else
    {
      id v13 = &stru_1F3C268E8;
    }
    uint64_t v14 = [v9 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "WBSFeatureAvailability.isInternalInstall", "-[BrowserController _debugAutoFillConsoleLoggingEnabledPreferenceDidChange:]", v11, 15467, v13];
    if (v12) {

    }
    id v15 = [MEMORY[0x1E4F29060] callStackSymbols];
    NSLog((NSString *)@"%@\n%@", v14, v15);

    abort();
  }
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = *MEMORY[0x1E4F99100];
  uint64_t v5 = [v3 BOOLForKey:*MEMORY[0x1E4F99100]];

  uint64_t v6 = +[Application sharedApplication];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
  [v6 setObject:v7 forInjectedBundleParameter:v4];
}

- (BOOL)shouldIncreaseTopSpacingForStartPageController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained browserControllerShouldIncreaseTopPaddingForStartPage:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (uint64_t)_updateConfiguration
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    uint64_t v2 = *(void **)(result + 56);
    *(void *)(result + 56) = 0;

    double v3 = [v1 configuration];
    uint64_t v4 = [v3 allowsKeyboardCorrectionLearning];
    char v5 = [MEMORY[0x1E4FB18E0] activeKeyboard];
    [v5 setCorrectionLearningAllowed:v4];

    uint64_t v6 = [v1 configuration];
    [v1[35] setConfiguration:v6];

    return [v1 updateSpeculativeLoadingPreferences];
  }
  return result;
}

- (void)updateSpeculativeLoadingPreferences
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v4 BOOLForKey:@"SpeculativeLoading"])
  {
    double v3 = [(BrowserController *)self configuration];
    self->_isSpeculativeLoadingEnabled = [v3 allowsSpeculativeLoading];

    if (self->_isSpeculativeLoadingEnabled) {
      goto LABEL_6;
    }
  }
  else
  {
    self->_isSpeculativeLoadingEnabled = 0;
  }
  [(BrowserController *)self clearSpeculativeLoadDocument];
LABEL_6:
}

- (_SFBrowserConfiguration)configuration
{
  cachedConfiguration = self->_cachedConfiguration;
  if (!cachedConfiguration)
  {
    id v4 = (_SFBrowserConfiguration *)[objc_alloc(MEMORY[0x1E4F3AF28]) initWithPrivateBrowsingEnabled:self->_privateBrowsingEnabled traitEnvironment:self->_rootViewController controlledByAutomation:self->_controlledByAutomation];
    char v5 = self->_cachedConfiguration;
    self->_cachedConfiguration = v4;

    cachedConfiguration = self->_cachedConfiguration;
  }
  return cachedConfiguration;
}

- (_SFPerSitePreferencesVendor)perSitePreferencesVendor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  double v3 = [WeakRetained perSitePreferencesVendor];

  return (_SFPerSitePreferencesVendor *)v3;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (LoadProgressObserver)loadProgressObserver
{
  return (LoadProgressObserver *)self->_spinnerController;
}

- (WKProcessPool)processPool
{
  double v3 = +[Application sharedApplication];
  id v4 = [(BrowserController *)self effectiveProfileIdentifier];
  char v5 = [v3 processPoolForProfileIdentifier:v4];

  return (WKProcessPool *)v5;
}

- (WKPreferences)wkPreferences
{
  return self->_wkPreferences;
}

- (void)dynamicBarAnimatorOutputsDidChange:(id)a3
{
}

- (void)browserViewController:(id)a3 traitCollectionDidChange:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 userInterfaceStyle];
  id v9 = [v6 traitCollection];
  uint64_t v10 = [v9 userInterfaceStyle];

  if (v8 != v10)
  {
    [(TabCollectionViewProviding *)self->_tabCollectionViewProvider setSnapshotInvalidationIsPostponed:1];
    -[BrowserController _updateConfiguration]((uint64_t)self);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v11 = [(TabController *)self->_tabController normalAndPrivateTabs];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * v14++) updateUsesDarkTheme];
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    [(TabCollectionViewProviding *)self->_tabCollectionViewProvider flushPendingSnapshotsWithCompletion:&__block_literal_global_867];
    [(TabCollectionViewProviding *)self->_tabCollectionViewProvider setSnapshotInvalidationIsPostponed:0];
  }
  id v15 = [v7 preferredContentSizeCategory];
  id v16 = [v6 traitCollection];
  id v17 = [v16 preferredContentSizeCategory];
  BOOL v18 = UIContentSizeCategoryCompareToCategory(v15, v17) == NSOrderedSame;

  if (!v18)
  {
    id v19 = -[BrowserController _visibleAppBanner]((uint64_t)self);
    [v19 invalidateBannerLayout];
    [v19 contentSizeCategoryDidChange];
    -[BrowserController _updateAppInfoOverlayFrame]((uint64_t)self);
  }
}

- (WBSCloudTabDeviceProvider)cloudTabStore
{
  return [(TabController *)self->_tabController profileCloudTabStore];
}

- (BOOL)canPerformPostLaunchActions
{
  return self->_canPerformPostLaunchActions;
}

- (BOOL)catalogViewControllerShouldUsePopoverForCompletions:(id)a3
{
  double v3 = [(BrowserController *)self viewControllerToPresentFrom];
  id v4 = [v3 traitCollection];
  BOOL v5 = [v4 horizontalSizeClass] != 1;

  return v5;
}

- (BOOL)catalogViewControllerShouldRequestNetworkedSuggestions:(id)a3
{
  id v4 = a3;
  if (self->_canPerformPostLaunchActions
    && ([(BrowserController *)self configuration],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 allowsNetworkedSearchSuggestions],
        v5,
        (v6 & 1) != 0))
  {
    id v7 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
    char v8 = [v7 isWebFilterEnabled];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)catalogViewControllerStartPageVisualStyleProvider:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [WeakRetained browserControllerStartPageVisualStyleProvider:self];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)tabDocumentDidUpdateTabCollectionItem:(id)a3
{
  id v3 = [(BrowserRootViewController *)self->_rootViewController tabSwitcherViewController];
  [v3 setNeedsApplyContentAnimated:1];
}

- (void)_initSubviews
{
  [(BrowserRootViewController *)self->_rootViewController safari_updateApplicationBackgroundStyle];
  id v8 = [(BrowserRootViewController *)self->_rootViewController contentContainerView];
  [v8 setNextResponder:self parentFocusEnvironment:self];
  id v3 = objc_alloc_init(ContinuousReadingViewController);
  continuousReadingViewController = self->_continuousReadingViewController;
  self->_continuousReadingViewController = v3;

  [(ContinuousReadingViewController *)self->_continuousReadingViewController setDelegate:self];
  BOOL v5 = [(ContinuousReadingViewController *)self->_continuousReadingViewController view];
  [v5 setClipsToBounds:0];
  char v6 = [(BrowserRootViewController *)self->_rootViewController documentAndTopBarsContainerView];
  if (![(BrowserController *)self _shouldUseNarrowLayout])
  {
    [v6 bounds];
    objc_msgSend(v5, "setFrame:");
  }
  [v6 addSubview:v5];
  id v7 = [(BrowserRootViewController *)self->_rootViewController dynamicBarAnimator];
  [v7 setDelegate:self];

  -[BrowserController _updateDisableBarHiding]((uint64_t)self);
  [(BrowserController *)self updateDynamicBarGeometry];
  self->_usesNarrowLayout = [(BrowserController *)self _shouldUseNarrowLayout];
  -[BrowserController updateUsesTabBar]((uint64_t)self);
  -[BrowserController _updateUnifiedBar]((id *)&self->super.super.super.isa);
  -[BrowserController _updateUsesNarrowLayout]((uint64_t)self);
  -[BrowserController _contentContainerViewFrameDidChange]((uint64_t)self);
  -[BrowserController _updateContinuousReadingViewControllerFrame]((id *)&self->super.super.super.isa);
  -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 0);
  [(BrowserRootViewController *)self->_rootViewController updateUsesLockdownStatusBar];
  [(BrowserRootViewController *)self->_rootViewController updateWebViewSizeAttributes];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v29 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (!self->_isPerformingRootViewControllerSizeTransition) {
    [(BrowserController *)self updateDynamicBarGeometry];
  }
  BOOL v5 = [(BannerController *)self->_bannerController crashBanner];
  BOOL v6 = [(UIScrollView *)self->_scrollView isDragging];
  if (v5) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v8 = [(BrowserRootViewController *)self->_rootViewController documentAndTopBarsContainerView];
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", v8);
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(BrowserRootViewController *)self->_rootViewController navigationBarFrameInCoordinateSpace:v8];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    v31.origin.x = v10;
    v31.origin.y = v12;
    v31.size.double width = v14;
    v31.size.double height = v16;
    double MaxY = CGRectGetMaxY(v31);
    v32.origin.x = v18;
    v32.origin.y = v20;
    v32.size.double width = v22;
    v32.size.double height = v24;
    if (MaxY <= CGRectGetMinY(v32)) {
      [(BrowserController *)self setShowingCrashBanner:0 animated:0];
    }
  }
  if (self->_scrollViewIsDragging)
  {
    if (self->_shouldShowBarsAfterDraggingDownward)
    {
      if ([(BrowserRootViewController *)self->_rootViewController toolbarPlacement] == 1
        && objc_msgSend(v29, "_sf_isScrolledToOrPastBottom")
        && !-[BrowserController _isInContinuousMode]((uint64_t)self))
      {
        [(BrowserController *)self showBars];
      }
      self->_shouldShowBarsAfterDraggingDownward = 0;
    }
    long long v26 = [(TabController *)self->_tabController activeTabDocument];
    [v26 webViewDidScroll];
  }
  if (![(BrowserRootViewController *)self->_rootViewController isInteractivelyMinimizingBars]&& !self->_isUpdatingBarAnimatorDragOffset)
  {
    self->_isUpdatingBarAnimatorDragOffset = 1;
    id v27 = [(BrowserRootViewController *)self->_rootViewController currentBarAnimator];
    [v29 contentOffset];
    [v27 updateDraggingWithOffset:v28];

    self->_isUpdatingBarAnimatorDragOffset = 0;
  }
  -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
  -[BrowserController _updateAppInfoOverlayFrame]((uint64_t)self);
  if ([WeakRetained browserControllerShouldUpdateWebViewGeometryOnScroll:self]) {
    [(BrowserController *)self updateExposedScrollViewRect];
  }
  [WeakRetained browserController:self scrollViewDidScroll:v29];
  [(BrowserController *)self updateScrollToTopView];
  if (-[BrowserController _isInContinuousMode]((uint64_t)self))
  {
    [(BrowserController *)self updateContinuousPreviewViewFrame];
    -[BrowserController _updateCurrentPageBannerView]((id *)&self->super.super.super.isa);
  }
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:self];
  [(ContinuousReadingViewController *)self->_continuousReadingViewController innerScrollViewDidScroll:v29];
  -[BrowserController _updateRefreshControlHeight]((uint64_t)self);
  -[BrowserController _updateScribbleOverlayIfNeeded]((id *)&self->super.super.super.isa);
}

- (void)updateDynamicBarGeometry
{
  if (![(BrowserRootViewController *)self->_rootViewController usingLoweredBar])
  {
    [(BrowserRootViewController *)self->_rootViewController navigationBarDesiredHeight];
    uint64_t v4 = v3;
    BOOL v5 = [(BrowserRootViewController *)self->_rootViewController dynamicBarAnimator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__BrowserController_updateDynamicBarGeometry__block_invoke;
    v7[3] = &unk_1E6D79260;
    void v7[4] = self;
    id v8 = v5;
    uint64_t v9 = v4;
    id v6 = v5;
    [v6 performBatchUpdates:v7];
  }
}

- (void)updateScrollToTopView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v3 = [WeakRetained statusBarManager];
  if ((([v3 isStatusBarHidden] & 1) != 0 || self->_scrollingStatusBar)
    && -[BrowserController _canScrollToTopInView:]((uint64_t)self, self->_scrollView))
  {
    uint64_t v4 = [(BrowserController *)self isShowingFavorites] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(BrowserRootViewController *)self->_rootViewController setNeedsScrollToTopView:v4];
}

- (void)updateExposedScrollViewRect
{
  if (([(_SFWebView *)self->_webView _isInFullscreen] & 1) == 0)
  {
    -[BrowserController updateWebViewObscuredInsets]((uint64_t)self);
    continuousReadingViewController = self->_continuousReadingViewController;
    [(ContinuousReadingViewController *)continuousReadingViewController updateContinuousPreviewViewSizeAttributes];
  }
}

- (void)_updateScribbleOverlayIfNeeded
{
  if (a1)
  {
    id v7 = [a1[43] activeTabDocument];
    uint64_t v2 = [v7 sfScribbleControllerIfLoaded];
    int v3 = [v2 isScribbling];

    if (v3)
    {
      uint64_t v4 = [v7 sfScribbleControllerIfLoaded];
      BOOL v5 = [a1 webView];
      id v6 = [v5 scrollView];
      [v4 updateOverlayInScrollView:v6];
    }
  }
}

- (void)_updateRefreshControlHeight
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 338)
      || ![*(id *)(a1 + 304) _isVerticalBouncing]
      || (char v2 = [*(id *)(a1 + 304) isDragging], refreshed = 0.0, (v2 & 1) == 0))
    {
      double refreshed = -[BrowserController _refreshControlHeight](a1);
    }
    if (refreshed != *(double *)(a1 + 136))
    {
      *(double *)(a1 + 136) = refreshed;
      -[BrowserController updateWebViewObscuredInsets](a1);
    }
  }
}

- (BOOL)_isInContinuousMode
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 88) currentItem];
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)_updateCurrentPageBannerViewIfNeeded
{
  if (a1)
  {
    BOOL v2 = [a1[11] currentItem];

    if (v2)
    {
      -[BrowserController _updateCurrentPageBannerView](a1);
    }
  }
}

- (void)updateContinuousPreviewViewFrame
{
  id v22 = [(ContinuousReadingViewController *)self->_continuousReadingViewController previewView];
  if (v22)
  {
    [(UIScrollView *)self->_scrollView bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    rootViewController = self->_rootViewController;
    [(UIScrollView *)self->_scrollView bounds];
    -[BrowserRootViewController sidebarObscuredInsetsForRect:inCoordinateSpace:](rootViewController, "sidebarObscuredInsetsForRect:inCoordinateSpace:", self->_scrollView);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(UIScrollView *)self->_scrollView contentSize];
    double v19 = v18;
    [(UIScrollView *)self->_scrollView bounds];
    if (v19 <= v20) {
      double v21 = v20;
    }
    else {
      double v21 = v19;
    }
    objc_msgSend(v22, "setFrame:", v4 + v13, v21, v6 - (v13 + v17), v8 - (v11 + v15));
  }
}

void __68__BrowserController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == lockdownModeObserverContext)
  {
    if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F99298]])
    {
      [*(id *)(*(void *)(a1 + 40) + 280) updateUsesLockdownStatusBar];
      double v3 = *(void **)(a1 + 40);
      [v3 updateDynamicBarGeometry];
      return;
    }
    uint64_t v2 = *(void *)(a1 + 48);
  }
  if (v2 == webFeatureObserverContext)
  {
    id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    double v4 = observableWebKitFeaturesByDefaultsKey();
    double v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    double v6 = [v9 objectForKey:*(void *)(a1 + 32)];
    if (v6) {
      uint64_t v7 = [v9 BOOLForKey:*(void *)(a1 + 32)];
    }
    else {
      uint64_t v7 = [v5 defaultValue];
    }
    uint64_t v8 = v7;

    [*(id *)(*(void *)(a1 + 40) + 840) _setEnabled:v8 forFeature:v5];
  }
}

- (void)switchFromTabDocument:(id)a3 toTabDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v8 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BrowserController switchFromTabDocument:toTabDocument:]();
    }
  }
  if (v6 == v7)
  {
    [(BrowserController *)self updateInterface];
  }
  else
  {
    [v6 updateUserActivity];
    if (([v6 isShowingReader] & 1) != 0 || objc_msgSend(v6, "shouldRestoreReader")) {
      [(BrowserController *)self hideReaderForTabDocument:v6 animated:0 deactivationMode:2];
    }
    [(UIScrollView *)self->_scrollView _stopScrollingAndZoomingAnimations];
    [(UIScrollView *)self->_scrollView contentOffset];
    objc_msgSend(v6, "setScrollPoint:");
    -[BrowserController setWebViewFromTabDocument:](self, v7);
    if ([v7 shouldShowReaderOnActivate]) {
      [(BrowserController *)self setShowingReader:1 animated:0];
    }
    [(BrowserController *)self updateInterface];
    id v9 = [v6 appBanner];
    -[BrowserController _setShowingAppBanner:isShowing:]((uint64_t)self, v9, 0);

    double v10 = [v7 appBanner];
    -[BrowserController _setShowingAppBanner:isShowing:]((uint64_t)self, v10, 1);

    double v11 = [v6 privateBrowsingPrivacyProtectionsBanner];
    -[BrowserController _setShowingPrivateBrowsingPrivacyProtectionsBanner:isShowing:]((uint64_t)self, v11, 0);

    double v12 = [v7 privateBrowsingPrivacyProtectionsBanner];
    -[BrowserController _setShowingPrivateBrowsingPrivacyProtectionsBanner:isShowing:]((uint64_t)self, v12, 1);

    double v13 = [v7 navigationBarItem];
    double v14 = [(BrowserRootViewController *)self->_rootViewController navigationBar];
    [v14 setItem:v13];

    double v15 = [(BrowserRootViewController *)self->_rootViewController view];
    [v15 setNeedsLayout];

    -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
    if (v6) {
      [(BrowserController *)self updateFavoritesForNewDocument];
    }
    -[BrowserController _updateLibraryTypeForNewDocument]((uint64_t)self);
    double v16 = [v7 dialogController];
    [v16 presentNextDialogIfNeeded];

    if (v7)
    {
      id v17 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
      if ([v17 presentationState] == 1)
      {
      }
      else
      {
        uint64_t v18 = [v17 presentationState];

        if (v18 != 2)
        {
          double v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
          -[BrowserController _updateDigitalHealthOverlayForTabDocuments:](self, v19);

          -[BrowserController _presentPendingViewControllerForActiveTab]((id *)&self->super.super.super.isa);
        }
      }
    }
    [(BrowserRootViewController *)self->_rootViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
    -[BrowserController _updateSceneTitle]((uint64_t)self);
    double v20 = [MEMORY[0x1E4F3AF68] sharedManager];
    [v20 totalProgress];
    double v22 = v21;
    double v23 = [v7 unifiedTabBarItem];
    [v23 setDownloadProgress:v22];

    -[BrowserController _updateUnifiedBarBackgroundVisibility]((id *)&self->super.super.super.isa);
    [(BrowserRootViewController *)self->_rootViewController updateThemeColorIfNeededAnimated:0];
  }
}

- (void)_setShowingAppBanner:(int)a3 isShowing:
{
  id v6 = a2;
  if (a1)
  {
    -[BrowserController _updateNavigationBarSeparator](a1);
    if (v6)
    {
      if ((-[BrowserController _setShowingOverlayForBanner:showing:](a1, v6, a3) & 1) == 0)
      {
        if (a3) {
          id v5 = v6;
        }
        else {
          id v5 = 0;
        }
        [*(id *)(a1 + 768) setAppBanner:v5 animated:0];
      }
    }
  }
}

- (void)_updateNavigationBarSeparator
{
  if (a1)
  {
    -[BrowserController _visibleAppBanner](a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 280) setUsesFaintTopSeparator:v2 != 0];
  }
}

- (id)_visibleAppBanner
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 344) activeTabDocument];
    id v2 = [v1 appBanner];

    double v3 = [v2 overlayProvider];
    if ([v3 isAvailable]) {
      double v4 = 0;
    }
    else {
      double v4 = v2;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_updateAppInfoOverlayFrame
{
  if (a1)
  {
    id v2 = [*(id *)(a1 + 344) activeTabDocument];
    id v19 = [v2 appBanner];

    double v3 = [v19 overlayProvider];
    double v4 = [v3 overlayViewController];
    id v5 = [v4 view];

    if (v5)
    {
      [*(id *)(a1 + 304) bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v14 = *(void **)(a1 + 280);
      [*(id *)(a1 + 920) bounds];
      objc_msgSend(v14, "obscuredInsetsWithComponents:forRect:inCoordinateSpace:", 10, *(void *)(a1 + 920));
      objc_msgSend(v5, "setFrame:", v7 + v18, v9 + v15, v11 - (v18 + v16), v13 - (v15 + v17));
    }
  }
}

- (void)_setShowingPrivateBrowsingPrivacyProtectionsBanner:(int)a3 isShowing:
{
  id v6 = a2;
  if (a1)
  {
    -[BrowserController _updateNavigationBarSeparator](a1);
    if (v6)
    {
      if (a3) {
        id v5 = v6;
      }
      else {
        id v5 = 0;
      }
      [*(id *)(a1 + 768) setPrivateBrowsingPrivacyProtectionsBanner:v5 animated:0];
    }
  }
}

- (void)setWebViewFromTabDocument:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    double v4 = [v3 webView];
    if (v4 != (void *)a1[115])
    {
      [a1 setShowingCrashBanner:0 animated:0];
      -[BrowserController setWebView:]((uint64_t)a1, v4);
    }

    id v3 = v5;
  }
}

- (void)updateUnifiedBarVisibility
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserControllerShouldUpdateUnifiedBarVisibility:self];
  }
}

- (void)updateTabViewPinchRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:self];
}

- (void)setWebView:(uint64_t)a1
{
  id v4 = a2;
  id v5 = v4;
  if (!a1 || *(id *)(a1 + 920) == v4) {
    goto LABEL_24;
  }
  [v4 _beginPinningInputViews];
  [*(id *)(a1 + 920) _endAnimatedResize];
  id v6 = [*(id *)(a1 + 768) crashBanner];
  if (v6)
  {
    double v7 = [*(id *)(a1 + 768) crashBanner];
    BOOL v22 = [v7 messageType] == 0;
  }
  else
  {
    BOOL v22 = 0;
  }

  [(id)a1 setShowingCrashBanner:0 animated:0];
  if (*(unsigned char *)(a1 + 122)) {
    [*(id *)(a1 + 920) _endInteractiveObscuredInsetsChange];
  }
  double v8 = [*(id *)(a1 + 920) scrollView];
  [v8 setDelegate:0];

  double v9 = +[TabDocument tabDocumentForWKWebView:*(void *)(a1 + 920)];
  objc_storeStrong((id *)(a1 + 920), a2);
  double v10 = +[TabDocument tabDocumentForWKWebView:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 384));
  if (v9 != v10)
  {
    double v12 = [v9 view];
    [v12 removeFromSuperview];
    [v12 setGeometryProvider:0];
    double v13 = [v10 view];
    double v14 = [WeakRetained browserController:a1 tabDocumentViewGeometryProviderForTabDocumentView:v13];
    [v13 setGeometryProvider:v14];

    [WeakRetained browserController:a1 updateViewForActiveTabDocument:v10];
    [*(id *)(a1 + 280) updateUnifiedBarChromelessScrollDistance];
  }
  if (!*(unsigned char *)(a1 + 577) && objc_msgSend((id)a1, "sf_inResponderChain"))
  {
    id v15 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
    if ([v15 presentationState] == 1)
    {

LABEL_16:
      goto LABEL_17;
    }
    uint64_t v16 = [v15 presentationState];

    if (v16 != 2)
    {
      id v15 = [*(id *)(a1 + 344) activeTabDocument];
      objc_msgSend((id)a1, "updateFocusForTab:webViewCanTakeFocus:", v15, objc_msgSend(*(id *)(a1 + 896), "isSelectingItem") ^ 1);
      goto LABEL_16;
    }
  }
LABEL_17:
  [*(id *)(a1 + 88) setCurrentWebView:*(void *)(a1 + 920)];
  uint64_t v17 = [*(id *)(a1 + 920) scrollView];
  double v18 = *(void **)(a1 + 304);
  *(void *)(a1 + 304) = v17;

  [*(id *)(a1 + 280) setWebView:v5];
  -[BrowserController _resetCapsuleMinimizationStyleIfNeeded](a1);
  [*(id *)(a1 + 304) _setIndicatorInsetAdjustmentBehavior:2];
  [*(id *)(a1 + 304) setClipsToBounds:0];
  [*(id *)(a1 + 304) setDelegate:a1];
  if (*(unsigned char *)(a1 + 122)) {
    [*(id *)(a1 + 920) _beginInteractiveObscuredInsetsChange];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __32__BrowserController_setWebView___block_invoke;
  v23[3] = &unk_1E6D793C0;
  v23[4] = a1;
  BOOL v25 = v22;
  id v24 = v5;
  id v19 = (void (**)(void))MEMORY[0x1E4E42950](v23);
  if (([*(id *)(a1 + 88) isCommittingToContinuousDocument] & 1) != 0
    || (double v20 = *(void **)(a1 + 920),
        [*(id *)(a1 + 200) webView],
        double v21 = objc_claimAutoreleasedReturnValue(),
        v21,
        v20 == v21))
  {
    v19[2](v19);
    [(id)a1 updateExposedScrollViewRect];
    -[BrowserController _updateContinuousReadingViewControllerFrame]((id *)a1);
  }
  else
  {
    [*(id *)(a1 + 920) _resizeWhileHidingContentWithUpdates:v19];
  }

LABEL_24:
}

- (void)setShowingCrashBanner:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(BannerController *)self->_bannerController crashBanner];
  double v8 = v7;
  if (v7) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = !v5;
  }
  if (!v9)
  {
    BOOL v10 = !v7 || !v5;
    double v13 = v7;
    if (v10 || (v11 = [v7 messageType], double v8 = v13, v11))
    {
      if (v5) {
        id v12 = objc_alloc_init(MEMORY[0x1E4F78258]);
      }
      else {
        id v12 = 0;
      }
      [(BrowserController *)self showCrashBanner:v12 animated:v4];

      double v8 = v13;
    }
  }
}

- (void)updateFirstResponderOrFocus
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  -[BrowserController updateFocusForTab:webViewCanTakeFocus:](self, "updateFocusForTab:webViewCanTakeFocus:");
}

- (uint64_t)_isWindowLockedForPrivateBrowsing
{
  if (!a1 || !*(unsigned char *)(a1 + 719)) {
    return 0;
  }
  uint64_t v1 = +[Application sharedApplication];
  uint64_t v2 = [v1 isPrivateBrowsingLocked];

  return v2;
}

- (void)sceneWillEnterForeground:(id)a3
{
  [(BrowserController *)self willEnterForeground];
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 updateUserActivity];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserControllerDidEndObfuscating:self];
}

- (void)willEnterForeground
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_backgrounded = 0;
  -[BrowserController _restoreDigitalHealthFunctionalityAfterAppTransition]((id *)&self->super.super.super.isa);
  id v3 = +[MediaCaptureStatusBarManager sharedManager];
  [v3 browserControllerWillEnterForeground:self];

  [(TabController *)self->_tabController updateFocusProfileEnteringForeground];
  [(TabController *)self->_tabController updateFocusedTabGroupEnteringForeground];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = +[Application sharedApplication];
  BOOL v5 = [v4 allWebExtensionsControllers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        BOOL v10 = [(BrowserController *)self viewControllerToPresentFrom];
        [v9 setViewControllerToPresentDialogsFrom:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)tabDocumentCanBecomeCurrentUserActivity:(id)a3
{
  id v4 = a3;
  if ([(BrowserController *)self sf_inResponderChain]
    && ([v4 isControlledByAutomation] & 1) == 0)
  {
    int v5 = [v4 isPrivateBrowsingEnabled] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_updateUsesNarrowLayout
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 280) view];
    [v2 setNeedsLayout];

    id v3 = -[BrowserController contentContainerView]((id *)a1);
    if (!*(void *)(a1 + 816))
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:a1 action:sel__tabViewPinch_];
      int v5 = *(void **)(a1 + 816);
      *(void *)(a1 + 816) = v4;

      [*(id *)(a1 + 816) setDelegate:a1];
      [*(id *)(a1 + 816) _setEndsOnSingleTouch:1];
      [v3 addGestureRecognizer:*(void *)(a1 + 816)];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 384));
      [WeakRetained updateTabViewPinchRecognizerForBrowserController:a1];
    }
    uint64_t v7 = [*(id *)(a1 + 280) navigationBar];
    uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __44__BrowserController__updateUsesNarrowLayout__block_invoke;
    long long v13 = &unk_1E6D791E8;
    uint64_t v14 = a1;
    id v9 = v7;
    id v15 = v9;
    [v8 performWithoutAnimation:&v10];
    objc_msgSend(v9, "setUsesNarrowLayout:", *(unsigned __int8 *)(a1 + 708), v10, v11, v12, v13, v14);
  }
}

- (void)_updateUnifiedBar
{
  if (a1)
  {
    if ([a1[35] usingUnifiedBar])
    {
      uint64_t v2 = [a1 tabBarDisplayMode];
      id v3 = [a1 tabBarManager];
      [v3 setDisplayMode:v2];
    }
    -[BrowserController _updateUnifiedBarBackgroundVisibility](a1);
  }
}

- (void)_presentPendingViewControllerForActiveTab
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Trying to present pending view controller when it is already presented by: %{public}@", v5);
}

- (void)_updateCurrentContinuousReadingItem
{
  if (a1)
  {
    id v11 = [a1[43] activeTabDocument];
    uint64_t v2 = [a1 continuousReadingController];
    if ([v11 isShowingContinuous])
    {
      uint64_t v3 = [v2 currentReadingListItem];
      [v2 nextReadingListItem];
      v5 = os_log_t v4 = (void *)v3;
    }
    else
    {
      os_log_t v4 = 0;
      int v5 = 0;
    }
    -[BrowserController setCurrentContinuousReadingItem:](a1, v4);
    uint64_t v6 = [a1[11] previewView];
    uint64_t v7 = [v6 continuousReadingItem];
    char v8 = [v7 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      id v9 = [a1 nextContinuousItemDocument];
      [a1 clearDocumentForContinuousReading:v9];

      if (v5) {
        uint64_t v10 = [[ContinuousReadingPreviewView alloc] initWithContinuousReadingItem:v5 previewingNextDocument:1];
      }
      else {
        uint64_t v10 = 0;
      }
      -[BrowserController _setContinuousReadingPreviewView:](a1, v10);
      -[BrowserController _prepareTabDocumentForNextContinuousItemIfNeeded](a1);
    }
  }
}

- (void)setCurrentContinuousReadingItem:(id *)a1
{
  id v6 = a2;
  if (a1)
  {
    id v3 = [a1[11] currentItem];
    if (v3 == v6)
    {
    }
    else
    {
      os_log_t v4 = [a1[11] currentItem];
      char v5 = [v4 isEqual:v6];

      if ((v5 & 1) == 0)
      {
        [a1[11] setCurrentItem:v6];
        -[BrowserController _updateCurrentPageBannerView](a1);
        [a1 didChangeContinuousReadingItemInActiveDocument];
      }
    }
  }
}

- (TabDocument)nextContinuousItemDocument
{
  return self->_nextContinuousItemDocument;
}

- (void)clearDocumentForContinuousReading:(id)a3
{
  os_log_t v4 = (TabDocument *)a3;
  if (-[BrowserController isContinuousReadingDocument:](self, "isContinuousReadingDocument:"))
  {
    if (self->_previousContinuousItemDocument == v4)
    {
      -[BrowserController _clearPreviousContinuousItemDocument]((uint64_t)self);
    }
    else if (self->_nextContinuousItemDocument == v4)
    {
      -[BrowserController _clearNextContinuousItemDocument]((uint64_t)self);
    }
  }
}

- (void)_setContinuousReadingPreviewView:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v3 = [a1[11] previewView];
    if (v3 != v4)
    {
      [v3 removeFromSuperview];
      [a1[11] setPreviewView:v4];
      [v4 setAutoresizingMask:10];
      [a1 updateContinuousPreviewViewFrame];
      [a1[38] addSubview:v4];
      [a1[35] updateWebViewSizeAttributes];
    }
  }
}

- (void)_prepareTabDocumentForNextContinuousItemIfNeeded
{
  if (a1 && !a1[22])
  {
    uint64_t v2 = [a1 continuousReadingController];
    id v13 = [v2 nextReadingListItem];

    id v3 = v13;
    if (v13)
    {
      id v4 = [v13 URL];
      if (v4)
      {
        uint64_t v5 = -[BrowserController _cachedDocumentForContinuousReadingItem:](a1, v13);
        id v6 = a1[22];
        a1[22] = (id)v5;

        id v7 = a1[22];
        if (!v7)
        {
          id v8 = [[TabDocument alloc] initForBackgroundLoadingWithBrowserController:a1 relatedWebView:0 webViewToCloneSessionStorageFrom:0];
          id v9 = a1[22];
          a1[22] = v8;

          id v7 = a1[22];
        }
        [v7 beginSuppressingProgressAnimation];
        [a1[22] setAllowsRemoteInspection:0];
        if ([a1 readerShouldBeShownIfPossible]
          && ([a1[22] readerWebView], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v11 = [a1[22] readerWebView];
        }
        else
        {
          id v11 = [a1[22] webView];
        }
        [a1[11] didCreateWebViewForNextDocument:v11];
        if (([a1[22] suppressWebExtensionEvents] & 1) == 0)
        {
          long long v12 = [a1[22] webExtensionsController];
          [v12 didOpenTab:a1[22]];
        }
      }

      id v3 = v13;
    }
  }
}

- (ContinuousReadingController)continuousReadingController
{
  continuousReadingController = self->_continuousReadingController;
  if (!continuousReadingController)
  {
    id v4 = [[ContinuousReadingController alloc] initWithTabController:self->_tabController];
    uint64_t v5 = self->_continuousReadingController;
    self->_continuousReadingController = v4;

    continuousReadingController = self->_continuousReadingController;
  }
  return continuousReadingController;
}

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v9 = [WeakRetained interfaceOrientation];

  if (v9 != a5)
  {
    barManager = self->_barManager;
    [(_SFBarManager *)barManager setDownloadsItemNeedsLayout];
  }
}

uint64_t __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_updateContinuousReadingViewControllerFrame
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = -[BrowserController tabContentContainerView](result);
    [v2 bounds];
    double v4 = v3;
    double v6 = v5;

    objc_msgSend(v1[35], "contentContainerViewFrameForBrowserSize:", v4, v6);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = [v1[11] view];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    [v1[11] updateOuterScrollView];
    return (id *)[v1 updateContinuousPreviewViewFrame];
  }
  return result;
}

- (id)tabContentContainerView
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 48);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserControllerTabContentContainerView:v1];
    }
    else {
    uint64_t v1 = [v1[35] contentContainerView];
    }
  }
  return v1;
}

void __76__BrowserController_updatePrivateBrowsingAvailabilityWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__BrowserController_updatePrivateBrowsingAvailabilityWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6D79210;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

- (void)_resetCapsuleMinimizationStyleIfNeeded
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 280) capsuleViewController];
    id v3 = [v2 capsuleCollectionView];

    if (([v3 alwaysShowTopBackdrop] & 1) == 0) {
      [*(id *)(a1 + 280) updateCapsuleMinimizationStyle];
    }
  }
}

void __56__BrowserController__showDefaultBrowserSheetIfNecessary__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(v2 + 280);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__BrowserController__showDefaultBrowserSheetIfNecessary__block_invoke_4;
    v10[3] = &unk_1E6D793E8;
    v10[4] = v2;
    [v3 showDefaultBrowserSheetWithDisplayHandler:v10];
  }
  else
  {
    [*(id *)(v2 + 696) setHidden:1];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 696);
    *(void *)(v5 + 696) = 0;

    [*(id *)(a1 + 40) didCompleteBrowserSheet];
    char v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__BrowserController__showDefaultBrowserSheetIfNecessary__block_invoke_2;
    v11[3] = &unk_1E6D79790;
    id v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    id v12 = v8;
    uint64_t v13 = v9;
    [v8 determineIfBrowserIconSwapAlertNeedsDisplayWithCompletionHandler:v11];
  }
}

- (void)_didChangeToFirstResponder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BrowserController;
  [(BrowserController *)&v7 _didChangeToFirstResponder:v4];
  tabController = self->_tabController;
  id v6 = [(TabController *)tabController activeTabDocument];
  [(TabController *)tabController saveTabDocumentUserActivitySoon:v6];
}

- (void)tabController:(id)a3 didSwitchFromTabDocument:(id)a4 toTabDocument:(id)a5
{
  id v31 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 != v10)
  {
    if (!self->_isMakingFocusedTabDocumentActive)
    {
      double v11 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
      id v12 = (void *)[v11 presentationState];

      if (!v12)
      {
        BOOL v13 = [(TabController *)self->_tabController updatingTabGroupTabs];
        if (v13)
        {
          int v14 = 0;
          BOOL v15 = 1;
        }
        else
        {
          id v12 = [v9 libraryType];
          if (v12)
          {
            int v14 = 0;
            BOOL v15 = 1;
          }
          else
          {
            uint64_t v5 = [v10 libraryType];
            id v12 = 0;
            BOOL v15 = v5 != 0;
            int v14 = 1;
          }
        }
        [(BrowserController *)self dismissTransientUIAnimated:v15];
        if (v14) {

        }
        if (!v13) {
        if (![(BrowserRootViewController *)self->_rootViewController isShowingPrivateBrowsingExplanationSheet]&& ![(BrowserRootViewController *)self->_rootViewController isShowingDefaultBrowserSheet])
        }
        {
          [(BrowserRootViewController *)self->_rootViewController dismissViewControllerAnimated:1 completion:0];
        }
        [(BrowserController *)self showBars];
      }
    }
    [v9 hideFindOnPage];
    if ([v10 shouldObscureForDigitalHealth]) {
      -[BrowserController _showDigitalHealthOverlayForTabDocument:withPolicy:animated:]((uint64_t)self, v10, [v10 policy], 0);
    }
    else {
      -[BrowserController _hideDigitalHealthOverlayForTabDocument:]((id *)&self->super.super.super.isa, v10);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
    [WeakRetained browserControllerMakeKey:self];
  }
  [(BrowserController *)self switchFromTabDocument:v9 toTabDocument:v10];
  [v10 updateTabTitle];
  [v10 updateTabIcon];
  if (v9 != v10)
  {
    uint64_t v17 = [(BrowserRootViewController *)self->_rootViewController tabBar];
    double v18 = [v10 tabBarItem];
    id v19 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    BOOL v20 = [v19 presentationState] == 1 || objc_msgSend(v19, "presentationState") == 2;

    [v17 scrollToItem:v18 animated:!v20];
    double v21 = [(BrowserController *)self tabBarManager];
    id v22 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    BOOL v23 = [v22 presentationState] != 1 && objc_msgSend(v22, "presentationState") != 2;

    [v21 scrollToActiveItemAnimated:v23];
    id v24 = [(BrowserController *)self tabBarManager];
    BOOL v25 = [v24 minimizedProgressView];

    long long v26 = [v9 navigationBarItem];
    id v27 = [v26 fluidProgressController];
    [v27 unregisterObserver:v25];

    double v28 = [v10 navigationBarItem];
    id v29 = [v28 fluidProgressController];
    [v29 registerObserver:v25];
  }
  BOOL v30 = ([(SidebarUIProxy *)self->_sidebarUIProxy isShowingSidebar] & 1) == 0
     && [(BrowserController *)self isShowingStartPage];
  self->_allowsAutoDismissSidebar = v30;
  [(BrowserController *)self updatePresenceForActiveUser];
  [(BrowserController *)self dismissAutoFillInternalFeedbackToastImmediately:1];
}

void __51__BrowserController__updateButtonsAnimatingTabBar___block_invoke(uint64_t a1)
{
  id v17 = [*(id *)(a1 + 32) webExtensionsController];
  id v3 = [v17 extensions];
  uint64_t v4 = [v3 count];

  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 832), "setBarItem:enabled:", 0, objc_msgSend(*(id *)(a1 + 32), "canGoBack"));
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 832), "setBarItem:enabled:", 1, objc_msgSend(*(id *)(a1 + 32), "canGoForward"));
  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 832);
  uint64_t v18 = [*(id *)(a1 + 32) urlForSharing];
  [v5 setBarItem:5 enabled:(v18 | v4) != 0];

  uint64_t v6 = *(void *)(a1 + 40);
  objc_super v7 = *(void **)(v6 + 832);
  [v7 setBarItem:6 enabled:-[BrowserController _shareButtonEnabled](v6)];
  id v8 = *(void **)(*(void *)(a1 + 40) + 832);
  id v19 = [MEMORY[0x1E4F78500] sharedManager];
  uint64_t v9 = [v19 availability];
  if (v9)
  {
    objc_super v7 = [*(id *)(a1 + 32) URL];
    if (v7)
    {
      uint64_t v1 = [*(id *)(a1 + 32) navigationBarItem];
      uint64_t v10 = [v1 showsSearchIndicator];
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
      uint64_t v10 = 1;
    }
  }
  else
  {
    int v11 = 0;
    uint64_t v10 = 0;
  }
  [v8 setBarItem:4 enabled:v10];
  if (v11) {

  }
  if (v9) {
  id v12 = *(void **)(*(void *)(a1 + 40) + 832);
  }
  id v20 = [*(id *)(a1 + 32) navigationBarItem];
  objc_msgSend(v12, "setBarItem:selected:", 5, objc_msgSend(v20, "menuButtonSelected"));

  [*(id *)(*(void *)(a1 + 40) + 832) setContentMode:-[BrowserController _currentBarContentMode](*(void *)(a1 + 40))];
  BOOL v13 = *(void **)(a1 + 40);
  if (v13)
  {
    if ([*(id *)(a1 + 40) favoritesFieldShouldBeExpanded]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = [v13 isShowingStartPage];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  [*(id *)(*(void *)(a1 + 40) + 832) setState:v14];
  id v21 = [*(id *)(*(void *)(a1 + 40) + 344) activeTabDocument];
  BOOL v15 = [v21 navigationBarItem];
  uint64_t v16 = [v15 overlayConfiguration];
  [*(id *)(*(void *)(a1 + 40) + 832) setAllBarItemsAreDisabled:v16 != 0];
}

- (BOOL)isShowingStartPage
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  if (-[BrowserController _isStartPageOverriddenByExtensionInTabDocument:]((uint64_t)self, v3))
  {
    if (![v3 isBlank])
    {
      BOOL v5 = 0;
      goto LABEL_7;
    }
    char v4 = [v3 isShowingStartPageOverriddenByExtension];
  }
  else
  {
    char v4 = [v3 isBlank];
  }
  BOOL v5 = v4;
LABEL_7:

  return v5;
}

- (uint64_t)_shareButtonEnabled
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 344) activeTabDocument];
    if ([v2 isBlank])
    {
      id v3 = +[FeatureManager sharedFeatureManager];
      if ([v3 areSharedTabGroupsEnabled])
      {
        char v4 = [*(id *)(v1 + 344) activeTabGroup];
        uint64_t v1 = [v4 isNamed];
      }
      else
      {
        uint64_t v1 = 0;
      }
    }
    else
    {
      id v3 = [v2 urlForSharing];
      uint64_t v1 = v3 != 0;
    }
  }
  return v1;
}

- (uint64_t)_currentBarContentMode
{
  if (result)
  {
    uint64_t v1 = (unsigned __int8 *)result;
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v3 = [v2 BOOLForKey:*MEMORY[0x1E4F786E0]];

    int IsPad = _SFDeviceIsPad();
    if (v3)
    {
      if (IsPad) {
        return v1[708];
      }
      BOOL v5 = [v1 usesNarrowLayout] == 0;
      uint64_t v6 = 2;
    }
    else
    {
      if (!IsPad) {
        return 6;
      }
      BOOL v5 = v1[708] == 0;
      uint64_t v6 = 4;
    }
    if (v5) {
      return v6;
    }
    else {
      return v6 + 1;
    }
  }
  return result;
}

- (SidebarUIProxy)sidebarUIProxy
{
  return self->_sidebarUIProxy;
}

- (id)makeSidebarButton
{
  uint64_t v2 = [(BrowserController *)self sidebarAction];
  int v3 = +[BarButton sidebarButtonWithPrimaryAction:v2];

  return v3;
}

- (UIAction)sidebarAction
{
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x1E4FB13F0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__BrowserController_sidebarAction__block_invoke;
  v5[3] = &unk_1E6D791C0;
  objc_copyWeak(&v6, &location);
  int v3 = [v2 actionWithHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return (UIAction *)v3;
}

- (BOOL)dismissTransientUIAnimated:(BOOL)a3
{
  return -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:]((uint64_t)self, a3, 0, 0);
}

- (void)dismissAutoFillInternalFeedbackToastImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAutoFillInternalFeedbackToastController);
  if (WeakRetained)
  {
    if (v3)
    {
      -[BrowserController _cancelPendingAutoFillInternalFeedbackToastDismissal]((uint64_t)self);
      -[BrowserController _dismissAutoFillInternalFeedbackToast:]((id *)&self->super.super.super.isa, WeakRetained);
    }
    else
    {
      [(BrowserController *)self resetPendingAutoFillInternalFeedbackToastDismissalTimer];
    }
  }
}

- (BOOL)canAutoFocusURLField
{
  if ([(BrowserRootViewController *)self->_rootViewController isShowingPrivateBrowsingExplanationSheet]|| [(BrowserController *)self isPrivateBrowsingEnabled]&& [(BrowserController *)self shouldShowWhatsNewInPrivateBrowsingSheet])
  {
    return 0;
  }
  if ([(BrowserController *)self isPrivateBrowsingEnabled]
    && [(BrowserController *)self shouldShowTurnOnLockedPrivateBrowsingSheet])
  {
    return 0;
  }
  if ([(BrowserRootViewController *)self->_rootViewController isShowingDefaultBrowserSheet])
  {
    return 0;
  }
  if (self->_eligibilityCheckBlockingWindow)
  {
    BOOL v3 = [MEMORY[0x1E4F3AE80] sharedController];
    char v4 = [v3 shouldPerformPromptCheck];

    if (v4) {
      return 0;
    }
  }
  objc_super v7 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  BOOL v5 = [v7 presentationState] == 0;

  return v5;
}

- (uint64_t)_updateLibraryTypeForNewDocument
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    uint64_t result = [*(id *)(result + 344) updatingTabGroupTabs];
    if ((result & 1) == 0)
    {
      uint64_t v2 = [v1 activeLibraryType];
      BOOL v3 = -[BrowserController _catalogViewController]((id *)v1);
      [v3 setLibraryType:v2];

      return [v1 updateUnifiedBarVisibility];
    }
  }
  return result;
}

- (void)updateFavoritesForNewDocument
{
  if (![(TabController *)self->_tabController updatingTabGroupTabs])
  {
    id v10 = [(TabController *)self->_tabController activeTabDocument];
    BOOL v3 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
    char v4 = [v10 libraryType];
    [v3 setLibraryType:v4];

    if ([(BrowserController *)self isControlledByAutomation])
    {
      [(BrowserController *)self setFavoritesState:0];
    }
    else
    {
      if ([v10 isBlank] && (objc_msgSend(v10, "isPreparingForNewUserActivity") & 1) == 0)
      {
        [v3 resetFavorites];
        if ((-[BrowserController _wantsURLFieldAutoFocus](self) & 1) != 0
          || [(BrowserController *)self isFavoritesFieldFocused])
        {
          uint64_t v5 = 3;
        }
        else
        {
          uint64_t v5 = 4;
        }
        if (-[BrowserController _isStartPageOverriddenByExtensionInTabDocument:]((uint64_t)self, v10))
        {
          id v6 = [v10 libraryType];
          if (v6)
          {
          }
          else if ([v10 isShowingStartPageOverriddenByExtension])
          {
            uint64_t v5 = 0;
          }
        }
        objc_super v7 = [(BrowserController *)self tabBarManager];
        if ([v7 displayMode] == 1)
        {
          BOOL v8 = 1;
        }
        else
        {
          uint64_t v9 = [(BrowserController *)self tabBarManager];
          BOOL v8 = [v9 displayMode] == 2;
        }
        [(BrowserController *)self setFavoritesState:v5 animated:v8];
      }
      else
      {
        [(BrowserController *)self setFavoritesState:0];
      }
      if (!self->_isMakingFirstActiveTabDocumentActive) {
        -[BrowserController _showOrHideSidebarInLandscapeIfNecessary](self);
      }
    }
  }
}

- (void)setFavoritesState:(int64_t)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)setFavoritesState:(int64_t)a3 animated:(BOOL)a4
{
}

- (uint64_t)_wantsURLFieldAutoFocus
{
  if (!a1
    || ![a1 canAutoFocusURLField]
    || ![MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
  {
    return 0;
  }
  return _SFDeviceIsPad();
}

- (uint64_t)_updateDisableBarHiding
{
  if (result)
  {
    uint64_t v1 = (unsigned char *)result;
    uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1[706] = [v2 integerForKey:@"DebugBarCollapsingBehavior"] == 1;

    BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v1[408] = [v3 integerForKey:@"DebugBarCollapsingBehavior"] == 2;

    return [v1 updateDynamicBarGeometry];
  }
  return result;
}

- (void)_showOrHideSidebarInLandscapeIfNecessary
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (void *)[result _bookmarksPresentationStyle];
    if (result == (void *)2)
    {
      v2[0] = MEMORY[0x1E4F143A8];
      v2[1] = 3221225472;
      v2[2] = __61__BrowserController__showOrHideSidebarInLandscapeIfNecessary__block_invoke;
      v2[3] = &unk_1E6D79060;
      v2[4] = v1;
      return (void *)[MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
    }
  }
  return result;
}

- (int64_t)bookmarksPresentationStyleForViewOfSize:(CGSize)a3
{
  int64_t result = 0;
  if (a3.width > *MEMORY[0x1E4F787F8] && a3.height >= 441.0)
  {
    if (a3.width <= 1366.0)
    {
      if (a3.width / a3.height <= 1.3) {
        return 1;
      }
      else {
        return 2;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

- (void)_hideDigitalHealthOverlayForTabDocument:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v8 = v3;
    char v4 = -[BrowserController _isTabDocumentFrontMostForDigitalHealth:]((uint64_t)a1, v3);
    id v3 = v8;
    if (v4)
    {
      uint64_t v5 = -[BrowserController _screenTimeOverlayViewControllerForTabDocument:](a1, v8);
      id v6 = v5;
      if (v5)
      {
        [v5 willMoveToParentViewController:0];
        objc_super v7 = [v6 view];
        [v7 removeFromSuperview];

        [v6 removeFromParentViewController];
        if (([a1[43] hasTabsThatShouldBeObscuredForDigitalHealth] & 1) == 0)
        {

          id v6 = 0;
        }
        [v8 removeMediaSuspensionReason:1];
      }

      id v3 = v8;
    }
  }
}

- (id)_screenTimeOverlayViewControllerForTabDocument:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = -[BrowserController _screenTimeHostingViewControllerForTabDocument:](a1, v3);
    uint64_t v5 = [v4 screenTimeOverlayViewController];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_screenTimeHostingViewControllerForTabDocument:(id *)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    if (a1[25] == v3)
    {
      uint64_t v5 = [v3 linkPreviewViewController];
    }
    else
    {
      uint64_t v5 = (id *)a1[35];
    }
    a1 = v5;
  }

  return a1;
}

- (uint64_t)_isTabDocumentFrontMostForDigitalHealth:(uint64_t)a1
{
  id v3 = a2;
  char v4 = v3;
  if (a1)
  {
    id v5 = *(id *)(a1 + 200);
    if (v5)
    {
      a1 = v5 == v3;
    }
    else
    {
      id v6 = [*(id *)(a1 + 344) activeTabDocument];
      a1 = v6 == v4;
    }
  }

  return a1;
}

- (int64_t)_bookmarksPresentationStyle
{
  return [(SidebarUIProxy *)self->_sidebarUIProxy bookmarksPresentationStyle];
}

- (void)tabDocumentDidChangeSafeAreaInsets:(id)a3
{
}

- (void)updateUsesTabBar
{
  if (a1)
  {
    if ([*(id *)(a1 + 280) isViewLoaded])
    {
      [*(id *)(a1 + 280) updateSuppressesStandaloneTabBar];
      int shouldUseTab = -[BrowserController _shouldUseTabBar]((void *)a1);
      if (*(unsigned __int8 *)(a1 + 709) != shouldUseTab)
      {
        int v3 = shouldUseTab;
        *(unsigned char *)(a1 + 709) = shouldUseTab;
        if (shouldUseTab) {
          char v4 = objc_alloc_init(TabBar);
        }
        else {
          char v4 = 0;
        }
        uint64_t v9 = v4;
        objc_msgSend(*(id *)(a1 + 280), "setTabBar:");
        [*(id *)(a1 + 928) setTabBar:v9];
        [(id)a1 updateShowingTabBarAnimated:0];
        if (v3)
        {
          id v5 = [*(id *)(a1 + 928) tabDragDropController];
          id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v5];
          [(TabBar *)v9 addInteraction:v6];

          objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v5];
          [v7 setEnabled:1];
          [(TabBar *)v9 addInteraction:v7];

          BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v5];
          [(TabBar *)v9 addInteraction:v8];
        }
      }
    }
  }
}

void __44__BrowserController__updateUsesNarrowLayout__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 928) tabThumbnailCollectionView];
  if (SFEnhancedTabOverviewEnabled()) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [*(id *)(*(void *)(a1 + 32) + 928) setTabThumbnailCollectionViewStyle:v3];
  char v4 = [*(id *)(*(void *)(a1 + 32) + 928) tabOverview];
  [v4 setPresentedTabLayout:0];

  -[BrowserController _updateTabOverviewBarPlacement](*(void *)(a1 + 32));
  id v5 = [*(id *)(*(void *)(a1 + 32) + 928) tabThumbnailCollectionView];
  if (v2 != v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 addPresentationObserver:*(void *)(a1 + 32)];
  }
  id v6 = [*(id *)(*(void *)(a1 + 32) + 928) tabThumbnailCollectionView];
  [*(id *)(*(void *)(a1 + 32) + 280) setTabThumbnailCollectionView:v6];
  [*(id *)(a1 + 32) updateShowingTabBarAnimated:0];
  [*(id *)(a1 + 40) setUnifiedFieldShowsProgressView:1];
  [*(id *)(a1 + 32) updatePrivateBrowsingAvailabilityWithCompletionHandler:0];
  if (v2 != v6)
  {
    objc_super v7 = [*(id *)(*(void *)(a1 + 32) + 928) tabDragDropController];
    if (+[TabDragDropInteractionController canDelegateDragDropForTabCollectionView:v6])
    {
      BOOL v8 = [v6 view];
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v7];
      [v8 addInteraction:v9];

      id v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v7];
      [v10 setEnabled:1];
      [v8 addInteraction:v10];
      +[TabCollectionViewSpringLoadingBehavior addSpringLoadedInteractionToTabView:v6];
      int v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v7];
      [v8 addInteraction:v11];
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v12 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __44__BrowserController__updateUsesNarrowLayout__block_invoke_2;
    uint64_t v18 = &unk_1E6D791C0;
    objc_copyWeak(&v19, &location);
    BOOL v13 = [v12 actionWithHandler:&v15];
    uint64_t v14 = objc_msgSend(v6, "toolbar", v15, v16, v17, v18);
    [v14 addPrimaryAction:v13 forBarButton:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)barManager:(id)a3 willRegisterBarWithToken:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_initWeak(&location, self);
  id v6 = [UserNavigationDropInteraction alloc];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__BrowserController_barManager_willRegisterBarWithToken___block_invoke;
  v21[3] = &unk_1E6D79A38;
  objc_copyWeak(&v22, &location);
  objc_super v7 = [(UserNavigationDropInteraction *)v6 initWithOpensNewTab:1 tabOrder:0 navigationHandler:v21];
  v25[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];

  objc_destroyWeak(&v22);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v5 UIBarButtonItemForItem:3];
    [v9 setSpringLoaded:1];

    id v10 = [v5 UIBarButtonItemForItem:7];
    [v10 _setInteractions:v8];
LABEL_11:

    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    int v11 = [v5 viewForBarItem:3];
    [v11 setSpringLoaded:1];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v8;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
          uint64_t v16 = objc_msgSend(v5, "viewForBarItem:", 7, (void)v17);
          [v16 addInteraction:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v24 count:16];
      }
      while (v12);
    }
    goto LABEL_11;
  }
LABEL_12:

  objc_destroyWeak(&location);
}

- (void)_updateTabOverviewBarPlacement
{
  if (a1)
  {
    id v8 = [*(id *)(a1 + 280) view];
    [v8 bounds];
    uint64_t ShouldUseCompactAppearanceForSize = SFTabOverviewShouldUseCompactAppearanceForSize();

    uint64_t shouldShowTabGroup = -[BrowserController _shouldShowTabGroupSwitcher](a1);
    char v4 = [*(id *)(a1 + 928) tabOverview];
    uint64_t v5 = 2;
    if (!shouldShowTabGroup) {
      uint64_t v5 = 0;
    }
    if (ShouldUseCompactAppearanceForSize) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    id v9 = v4;
    [v4 setBarPlacement:v6];
    [v9 setTargetItemLiftsFromGrid:ShouldUseCompactAppearanceForSize];
    if (SFTabGroupSwitcherEnabled())
    {
      objc_super v7 = [*(id *)(a1 + 928) tabViewContainerView];
      [v7 setShowsTabGroupSwitcherToolbar:shouldShowTabGroup];
    }
  }
}

- (uint64_t)_shouldShowTabGroupSwitcher
{
  if (!a1 || !SFTabGroupSwitcherEnabled() || (_SFDeviceIsPad() & 1) != 0) {
    return 0;
  }
  uint64_t v3 = [*(id *)(a1 + 280) view];
  [v3 bounds];
  uint64_t ShouldUseCompactAppearanceForSize = SFTabOverviewShouldUseCompactAppearanceForSize();

  return ShouldUseCompactAppearanceForSize;
}

- (BOOL)isShowingPrivateTabs
{
  uint64_t v2 = [(TabController *)self->_tabController activeTabGroupOrTabGroupVisibleInSwitcher];
  char v3 = [v2 isPrivateBrowsing];

  return v3;
}

- (uint64_t)_shouldUseTabBar
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  if (![v2 showRectangularTabsInSeparateBar]) {
    goto LABEL_8;
  }
  uint64_t v3 = [a1 tabBarDisplayMode];

  if (v3 != 2) {
    return 0;
  }
  char IsPad = _SFDeviceIsPad();
  if ((IsPad & 1) != 0
    || ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 BOOLForKey:*MEMORY[0x1E4F78A18]]))
  {
    uint64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 bounds];
    uint64_t v8 = isScreenSizeCurrentlyBigEnoughForTabBar(v6, v7);

    if (IsPad) {
      return v8;
    }
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v8 = 0;
LABEL_9:

  return v8;
}

- (int64_t)tabBarDisplayMode
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v3 = [v2 BOOLForKey:*MEMORY[0x1E4F786E0]];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)setFavoritesState:(int64_t)a3 forVoiceSearch:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke;
  v128[3] = &unk_1E6D79320;
  id v11 = v10;
  id v129 = v11;
  uint64_t v12 = MEMORY[0x1E4E42950](v128);
  uint64_t v13 = (void *)v12;
  if (self->_favoritesState == a3)
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
    goto LABEL_88;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  dispatch_block_t v79 = v13;
  id v80 = v11;
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self willChangeToFavoritesState:a3];
  }
  id v14 = objc_loadWeakRetained((id *)&self->_scene);
  BOOL v91 = 0;
  v78 = v14;
  if (v6 && v14) {
    BOOL v91 = [v14 activationState] == 0;
  }
  int v15 = [(BrowserController *)self browserViewControllerShouldTemporarilyHideBottomToolbar:self->_rootViewController];
  int v81 = [(BrowserController *)self isShowingFavorites];
  BOOL v73 = [(BrowserController *)self isFavoritesFieldFocused];
  BOOL v75 = [(BrowserController *)self favoritesFieldShouldBeExpanded];
  self->_favoritesState = a3;
  int v16 = [(BrowserController *)self browserViewControllerShouldTemporarilyHideBottomToolbar:self->_rootViewController];
  int v90 = [(BrowserController *)self isShowingFavorites];
  BOOL v88 = [(BrowserController *)self isFavoritesFieldFocused];
  BOOL v89 = [(BrowserController *)self favoritesFieldShouldBeExpanded];
  if ((unint64_t)a3 < 6) {
    self->_wantsUnifiedFieldFocused = 0x1000100uLL >> (8 * a3);
  }
  group = dispatch_group_create();
  if (v15 != v16)
  {
    long long v17 = [(BrowserRootViewController *)self->_rootViewController view];
    [v17 setNeedsLayout];
  }
  if (!v89) {
    [(BrowserController *)self clearSpeculativeLoadDocument];
  }
  if (v88)
  {
    dispatch_group_enter(group);
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_2;
    v126[3] = &unk_1E6D79060;
    v127 = group;
    -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:]((uint64_t)self, v91, 1, v126);
  }
  v86 = -[BrowserController _topNavigationBar]((id *)&self->super.super.super.isa);
  long long v18 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  id v87 = [v18 view];
  long long v19 = [v18 popoverPresentationController];
  BOOL v74 = v7;
  int v20 = [v19 dismissing];

  BOOL v21 = [(BrowserController *)self _shouldUseNarrowLayout];
  BOOL v84 = [(BrowserController *)self favoritesAreShowingInPopover];
  id v22 = [(TabController *)self->_tabController activeTabDocument];
  v77 = v22;
  BOOL v23 = [v22 sfScribbleControllerIfLoaded];
  int v24 = [v23 isScribbling];

  if (v24)
  {
    BOOL v25 = [v22 sfScribbleControllerIfLoaded];
    [v25 endScribblingAndSaveChanges:0];
  }
  if (((a3 != 4) & v90) != 0) {
    long long v26 = v22;
  }
  else {
    long long v26 = 0;
  }
  -[BrowserController _setProgressSuppressingDocument:]((uint64_t)self, v26);
  if (v81 != v90)
  {
    if (v18) {
      int v27 = v84 ^ [v18 usesPopoverStyleForFavorites];
    }
    else {
      int v27 = 1;
    }
    if ((v90 & v27) == 1)
    {
      if ([self->_cachedCatalogViewController usesPopoverStyleForFavorites]|| v84)
      {
        cachedCatalogViewController = self->_cachedCatalogViewController;
        self->_cachedCatalogViewController = 0;
      }
      id v29 = [(BrowserController *)self createCatalogViewControllerIfNeeded];

      [v29 setUsesPopoverStyleForFavorites:v84];
      [WeakRetained browserController:self setCatalogViewController:v29];
      uint64_t v30 = [v29 view];

      id v87 = (void *)v30;
      long long v18 = v29;
    }
    if (v90)
    {
      [v18 resetFavorites];
      id v31 = [v18 startPageController];
      [v31 updatePrivacyReportIfEnabled];

      [v18 setNavigationBar:v86];
      -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
      if (!v84)
      {
        CGRect v32 = [(BrowserRootViewController *)self->_rootViewController documentAndTopBarsContainerView];
        [v32 addSubview:v87];
      }
      [WeakRetained browserControllerLayOutCatalogView:self];
      double v33 = [(SearchStateCache *)self->_searchStateCache cachedCompletionListForTabDocument:v22];
      v34 = v33;
      if (v33)
      {
        [v33 setDelegate:v18];
        [v34 restoreCachedCompletions];
        [v18 setShowingCompletions:1];
        [v18 setCompletionList:v34];
      }

      [v87 setAlpha:(double)!v91];
    }
    else
    {
      [v18 setHasScheduledCompletionListDismissal:1];
      if (((v21 | v20) & 1) == 0) {
        [v18 stopCompleting];
      }
      dispatch_group_enter(group);
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_3;
      v118[3] = &unk_1E6D79348;
      char v125 = v20;
      id v119 = v18;
      v120 = self;
      v121 = group;
      id v35 = v87;
      id v122 = v35;
      id v123 = v86;
      id v124 = WeakRetained;
      uint64_t v36 = MEMORY[0x1E4E42950](v118);
      v37 = (void *)v36;
      if (v91)
      {
        v38 = (void *)MEMORY[0x1E4FB1EB0];
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v116[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_4;
        v116[3] = &unk_1E6D79060;
        id v117 = v35;
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_5;
        v114[3] = &unk_1E6D79370;
        id v115 = v37;
        [v38 animateWithDuration:5 delay:v116 options:v114 animations:0.3 completion:0.0];
      }
      else
      {
        (*(void (**)(uint64_t))(v36 + 16))(v36);
      }
    }
    [(BrowserRootViewController *)self->_rootViewController updateThemeColorIfNeededAnimated:v91];
    if ((v91 & v90 & 1) == 0) {
      -[BrowserController _updateUnifiedBarBackgroundVisibility]((id *)&self->super.super.super.isa);
    }
  }
  id v39 = (void *)MEMORY[0x1E4FB1EB0];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_6;
  v109[3] = &unk_1E6D79398;
  int64_t v112 = a3;
  char v113 = v20;
  uint64_t v40 = group;
  objc_super v110 = v40;
  id v41 = v18;
  id v111 = v41;
  [v39 performWithoutAnimation:v109];
  id v42 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  if (v42)
  {
    dispatch_group_enter(v40);
    if (v89) {
      uint64_t v43 = 2;
    }
    else {
      uint64_t v43 = 0;
    }
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_9;
    v107[3] = &unk_1E6D79060;
    id v108 = v40;
    [v42 transitionToState:v43 animated:v91 completionHandler:v107];
  }
  if (v88 && -[BrowserController _animationsAreEnabled]((uint64_t)self)) {
    [v87 layoutIfNeeded];
  }
  v44 = [v86 textField];
  v45 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  v46 = [v45 unifiedField];

  if (v46)
  {
    id v47 = v46;

    [v41 setTextField:v47];
    v44 = v47;
  }
  v83 = v44;

  v48 = [(BrowserController *)self tabBarManager];
  uint64_t v49 = [v48 displayMode];
  v50 = [v48 itemArrangement];
  v51 = [v50 activeItem];
  v52 = [(TabController *)self->_tabController activeTabDocument];
  v53 = [v52 unifiedTabBarItem];

  if (v49 && ((v75 ^ v89 ^ 1) & 1) == 0 && v51 == v53)
  {
    dispatch_group_enter(v40);
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_10;
    v105[3] = &unk_1E6D79060;
    id v106 = v40;
    [v48 setActiveItemIsExpanded:v89 animated:v91 completionHandler:v105];
    v54 = v106;
    v55 = v77;
LABEL_72:

    goto LABEL_73;
  }
  if (v49) {
    int v56 = 0;
  }
  else {
    int v56 = v75 ^ v89;
  }
  v55 = v77;
  if (v56 == 1)
  {
    v57 = [(BrowserRootViewController *)self->_rootViewController navigationBar];
    v54 = v57;
    if (v91)
    {
      v58 = [v57 item];
      v59 = [v58 textWhenExpanded];

      uint64_t v76 = v59;
      if (v89)
      {
        uint64_t v60 = [v59 length];
        uint64_t v61 = 0;
      }
      else
      {
        v64 = [v83 text];
        int v65 = [v64 isEqualToString:v59];

        if (v65)
        {
          v72 = [v83 selectedTextRange];
          v66 = [v83 beginningOfDocument];
          v67 = [v72 start];
          uint64_t v61 = [v83 offsetFromPosition:v66 toPosition:v67];

          v68 = [v83 beginningOfDocument];
          v69 = [v72 end];
          uint64_t v70 = [v83 offsetFromPosition:v68 toPosition:v69];

          uint64_t v60 = v70 - v61;
        }
        else
        {
          uint64_t v60 = 0;
          uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }

      if (!v54) {
        goto LABEL_72;
      }
      dispatch_group_enter(v40);
      v103[0] = MEMORY[0x1E4F143A8];
      v103[1] = 3221225472;
      v103[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_11;
      v103[3] = &unk_1E6D79060;
      id v104 = v40;
      -[NSObject setExpanded:textFieldSelectionRange:completionHandler:](v54, "setExpanded:textFieldSelectionRange:completionHandler:", v89, v61, v60, v103);
      v63 = (id *)&v104;
    }
    else
    {
      if (!v57) {
        goto LABEL_72;
      }
      dispatch_group_enter(v40);
      v62 = (void *)MEMORY[0x1E4FB1EB0];
      v99[0] = MEMORY[0x1E4F143A8];
      v99[1] = 3221225472;
      v99[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_12;
      v99[3] = &unk_1E6D793C0;
      id v100 = v54;
      BOOL v102 = v89;
      v101 = v40;
      [v62 performWithoutAnimation:v99];
      v63 = (id *)&v100;
    }
    goto LABEL_72;
  }
LABEL_73:
  if (v84 || !v91 || (v81 | v90 ^ 1) == 1 && (v73 || !v88))
  {
    if (v74)
    {
      [v41 toggleVoiceSearch];
    }
    else if (v88)
    {
      [v83 becomeFirstResponder];
    }
    else
    {
      [v83 resignFirstResponder];
    }
  }
  else
  {
    dispatch_group_enter(v40);
    dispatch_time_t v71 = dispatch_time(0, 10000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_14;
    block[3] = &unk_1E6D79410;
    BOOL v96 = v73;
    void block[4] = self;
    BOOL v97 = v74;
    id v93 = v83;
    char v98 = v81;
    id v94 = v87;
    v95 = v40;
    dispatch_after(v71, MEMORY[0x1E4F14428], block);
  }
  [(BrowserController *)self updateDynamicBarGeometry];
  [(BrowserController *)self updateScrollToTopView];
  -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, v91);
  if ([(BrowserRootViewController *)self->_rootViewController usingUnifiedBar]
    && self->_usesNarrowLayout)
  {
    [(_SFBarManager *)self->_barManager performCoalescedUpdatesNowAnimated:v91];
  }
  if ((v90 & 1) == 0) {
    [v55 presentNextDialogIfNeeded];
  }
  uint64_t v13 = v79;
  dispatch_group_notify(v40, MEMORY[0x1E4F14428], v79);

  id v11 = v80;
LABEL_88:
}

- (BOOL)isFavoritesFieldFocused
{
  return ((self->_favoritesState - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)browserViewControllerShouldTemporarilyHideBottomToolbar:(id)a3
{
  id v4 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabOverview];
  if ([v4 presentationState] == 1)
  {
  }
  else
  {
    uint64_t v5 = [v4 presentationState];

    if (v5 != 2)
    {

      goto LABEL_7;
    }
  }
  BOOL contentBorrowedForTab = self->_contentBorrowedForTab;

  if (!contentBorrowedForTab) {
    return 1;
  }
LABEL_7:
  unint64_t favoritesState = self->_favoritesState;
  BOOL v9 = favoritesState > 5;
  uint64_t v10 = (1 << favoritesState) & 0x2E;
  if (v9 || v10 == 0) {
    return 0;
  }
  else {
    return [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] ^ 1;
  }
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_9(uint64_t a1)
{
}

- (id)createCatalogViewControllerIfNeeded
{
  p_cachedCatalogViewController = &self->_cachedCatalogViewController;
  cachedCatalogViewController = self->_cachedCatalogViewController;
  if (cachedCatalogViewController)
  {
    [cachedCatalogViewController startPageUpdatePolicyDidChange];
    uint64_t v5 = *p_cachedCatalogViewController;
  }
  else
  {
    uint64_t v5 = [[CatalogViewController alloc] initWithDelegate:self browserController:self];
    [(CatalogViewController *)v5 setLoadProgressObserver:self->_spinnerController];
    objc_storeStrong((id *)p_cachedCatalogViewController, v5);
  }
  return v5;
}

- (void)clearSpeculativeLoadDocument
{
  [(BrowserController *)self cancelSpeculativeLoad];
  -[BrowserController _closeSpeculativelyLoadedDocument:]((uint64_t)self, self->_speculativeLoadDocument);
  speculativeLoadDocument = self->_speculativeLoadDocument;
  self->_speculativeLoadDocument = 0;

  speculativeLoadURL = self->_speculativeLoadURL;
  self->_speculativeLoadURL = 0;

  objc_storeWeak((id *)&self->_backForwardListItemNeedingSnapshot, 0);
}

- (void)cancelSpeculativeLoad
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_speculativeLoadURL)
  {
    int v3 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      speculativeLoadURL = self->_speculativeLoadURL;
      int v6 = 141558275;
      uint64_t v7 = 1752392040;
      __int16 v8 = 2117;
      BOOL v9 = speculativeLoadURL;
      _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Cancelling speculative load: %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x16u);
    }
    -[BrowserController _cancelSpeculativeLoadForDocument:]((uint64_t)self, self->_speculativeLoadDocument);
    [(TabDocument *)self->_speculativeLoadDocument endSuppressingProgressAnimation];
    uint64_t v5 = self->_speculativeLoadURL;
    self->_speculativeLoadURL = 0;
  }
}

- (WBSWebExtensionWindow)activeWebExtensionWindow
{
  if (self->_privateBrowsingEnabled && self->_privateBrowsingAvailable) {
    uint64_t v2 = &OBJC_IVAR___BrowserController__privateExtensionWindow;
  }
  else {
    uint64_t v2 = &OBJC_IVAR___BrowserController__normalExtensionWindow;
  }
  return (WBSWebExtensionWindow *)*(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)_topNavigationBar
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 48);
    id v1 = [WeakRetained browserControllerNavigationBar:v1];
  }
  return v1;
}

- (void)_showDefaultBrowserSheetIfNecessary
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F3AE80] sharedController];
    if ([v2 shouldPerformPromptCheck])
    {
      if (!*(void *)(a1 + 696))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 888));
        uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB1F48]) initWithWindowScene:WeakRetained];
        uint64_t v5 = *(void **)(a1 + 696);
        *(void *)(a1 + 696) = v4;

        int v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        [*(id *)(a1 + 696) setBackgroundColor:v6];

        [*(id *)(a1 + 696) setWindowLevel:*MEMORY[0x1E4FB3118] + -1.0];
        [*(id *)(a1 + 696) makeKeyAndVisible];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __56__BrowserController__showDefaultBrowserSheetIfNecessary__block_invoke;
        v7[3] = &unk_1E6D797B8;
        void v7[4] = a1;
        id v8 = v2;
        [v8 determineIfBrowserSheetNeedsDisplayWithCompletionHandler:v7];
      }
    }
  }
}

- (void)_setProgressSuppressingDocument:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    id v4 = *(id *)(a1 + 256);
    if (v4 != v5)
    {
      [v4 endSuppressingProgressAnimation];
      objc_storeStrong((id *)(a1 + 256), a2);
      [*(id *)(a1 + 256) beginSuppressingProgressAnimation];
    }
  }
}

- (void)_closeSpeculativelyLoadedDocument:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 448);
      int v6 = 141558275;
      uint64_t v7 = 1752392040;
      __int16 v8 = 2117;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_INFO, "Closing speculative load TabDocument: %{sensitive, mask.hash}@", (uint8_t *)&v6, 0x16u);
    }
    [v3 setClosed:1];
    [v3 willClose];
  }
}

+ (WKProcessPool)newProcessPool
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = objc_alloc_init(MEMORY[0x1E4F46780]);
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariInjectedBundleURL");
  [v4 setInjectedBundleURL:v5];

  v18[0] = *MEMORY[0x1E4F3B1A0];
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 setCachePartitionedURLSchemes:v6];

  objc_msgSend(v4, "setShouldCaptureAudioInUIProcess:", objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E4F789D0]));
  [v4 setPrewarmsProcessesAutomatically:1];
  [v4 setUsesWebProcessCache:1];
  objc_msgSend(v4, "setJITEnabled:", objc_msgSend(v3, "BOOLForKey:", *MEMORY[0x1E4F99110]) ^ 1);
  uint64_t v7 = (WKProcessPool *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v4];
  __int16 v8 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
  int v9 = [v8 isWebFilterEnabled];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F3B060] sharedInstance];
    id v11 = [v10 engines];
    [(WKProcessPool *)v7 _setObject:v11 forBundleParameter:*MEMORY[0x1E4F997C0]];
  }
  if ([(id)*MEMORY[0x1E4FB2608] launchedToTest]) {
    [(WKProcessPool *)v7 _setObject:MEMORY[0x1E4F1CC38] forBundleParameter:@"launchedToTest"];
  }
  SafariShared::ReaderAvailabilityController::configureProcessPool((SafariShared::ReaderAvailabilityController *)v7, v12);
  uint64_t v13 = [v3 stringForKey:@"JavaScriptConsoleOutputPath"];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
    int v15 = v14;
    if (v14)
    {
      int v16 = [v14 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:0];
      [(WKProcessPool *)v7 _setObject:v16 forBundleParameter:@"JavaScriptConsoleOutputURLBookmarkData"];
    }
  }
  else
  {
    int v15 = 0;
  }
  [(WKProcessPool *)v7 _setObject:MEMORY[0x1E4F1CC38] forBundleParameter:*MEMORY[0x1E4F78888]];
  +[BrowserController _sendABGroupIdentifierToProcessPool:]((uint64_t)a1, v7);

  return v7;
}

- (void)_defaultSearchEngineDidChange:(id)a3
{
  id v5 = +[Application sharedApplication];
  id v4 = [(BrowserController *)self activeSearchEngine];
  [v5 setObject:v4 forInjectedBundleParameter:*MEMORY[0x1E4F997B8]];
}

- (_SFSearchEngineInfo)activeSearchEngine
{
  id v3 = [MEMORY[0x1E4F3B060] sharedInstance];
  id v4 = [v3 defaultSearchEngineForPrivateBrowsing:self->_privateBrowsingEnabled];

  return (_SFSearchEngineInfo *)v4;
}

+ (void)_sendABGroupIdentifierToProcessPool:(uint64_t)a1
{
  id v5 = a2;
  self;
  if ([MEMORY[0x1E4F97EA0] defaultSearchEngineMatchesExperiment])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F28ED0];
    id v3 = [MEMORY[0x1E4F98F50] shared];
    id v4 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "trialABGroupIdentifier"));
    [v5 _setObject:v4 forBundleParameter:*MEMORY[0x1E4F997A8]];
  }
}

- (void)_updateCurrentPageBannerView
{
  if (a1)
  {
    id v13 = [a1[11] previousItemPreviewView];
    uint64_t v2 = [a1[11] currentItem];
    id v3 = a1[11];
    if (v2)
    {
      id v4 = [v3 topBannerView];
      id v5 = [v4 continuousReadingItem];
      char v6 = [v5 isEqual:v2];

      if ((v6 & 1) == 0)
      {
        uint64_t v7 = [a1 previousContinuousItemDocument];
        [a1 clearDocumentForContinuousReading:v7];

        __int16 v8 = [[ContinuousReadingPreviewView alloc] initWithContinuousReadingItem:v2 previewingNextDocument:0];
        [a1[11] setPreviousItemPreviewView:v8];

        -[BrowserController _preparePreviousContinuousDocumentIfNeeded](a1);
      }
      int v9 = [a1[11] previousItemPreviewView];
      id v10 = [v9 superview];
      id v11 = a1[38];

      if (v10 != v11) {
        [a1[38] addSubview:v9];
      }
      [v9 setFrame:-[BrowserController _frameForCurrentPageBannerView]((uint64_t)a1)];
    }
    else
    {
      [v3 setPreviousItemPreviewView:0];
    }
    id v12 = [a1[11] previousItemPreviewView];

    if (v13 != v12)
    {
      [a1[35] updateWebViewSizeAttributes];
      [a1[11] updateOuterScrollView];
    }
  }
}

- (void)_setSidebarUIProxy:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 752), a2);
    [*(id *)(a1 + 752) setSidebarUIProxyDelegate:a1];
  }
}

- (void)writePrivateBrowsingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [MEMORY[0x1E4F78558] settings];
  id v5 = [(BrowserController *)self UUID];
  [v6 setPrivateBrowsingEnabled:v3 forWindowWithUUID:v5];
}

void __34__BrowserController_adoptSceneID___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    BOOL v3 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __34__BrowserController_adoptSceneID___block_invoke_cold_1(a1, v3, v4);
    }
  }
}

void __34__BrowserController_adoptSceneID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1_1(&dword_1E102C000, a2, a3, "Failed to save window state for scene ID: %{public}@", (uint8_t *)&v4);
}

- (BrowserController)initWithWindowState:(id)a3 browserWindowController:(id)a4 tabGroupManager:(id)a5
{
  return [(BrowserController *)self initWithWindowState:a3 browserWindowController:a4 tabGroupManager:a5 controlledByAutomation:0];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v78 = a4;
  id v8 = a5;
  int v9 = (id)WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v78 persistentIdentifier];
    id v11 = [(BrowserController *)self UUID];
    *(_DWORD *)buf = 138543618;
    BOOL v84 = v10;
    __int16 v85 = 2114;
    v86 = v11;
    _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Connecting to scene session with sceneID = %{public}@, uuid = %{public}@", buf, 0x16u);
  }
  id v12 = v75;
  [v12 setDelegate:self];
  id v13 = [v12 screenshotService];
  [v13 setDelegate:self];

  [v12 setActivityItemsConfigurationSource:self];
  objc_storeWeak((id *)&self->_scene, v12);
  intentSceneConfigurationCompletion = (void (**)(id, id))self->_intentSceneConfigurationCompletion;
  if (intentSceneConfigurationCompletion)
  {
    intentSceneConfigurationCompletion[2](intentSceneConfigurationCompletion, v12);
    id v15 = self->_intentSceneConfigurationCompletion;
    self->_intentSceneConfigurationCompletion = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserController:self willConnectToScene:v12 session:v78 options:v8];
  if (!self->_didConnectToScene)
  {
    [(BrowserController *)self setUpWithURL:0 launchOptions:0];
    self->_didConnectToScene = 1;
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self didConnectToScene:v12 session:v78 options:v8];
  }
  [(WBWindowState *)self->_windowState setNewlyCreated:0];
  id v76 = objc_loadWeakRetained((id *)&self->_browserWindowController);
  if (!v8)
  {
    int v16 = 0;
LABEL_14:
    BOOL v17 = 0;
    goto LABEL_16;
  }
  int v16 = objc_msgSend(MEMORY[0x1E4F22488], "_sf_windowCreationActivityFromSceneConnectionOptions:", v8);
  if (v16)
  {
    if ([v76 modeForNewWindowUserActivity:v16] == 1) {
      [(BrowserController *)self setPrivateBrowsingEnabled:1];
    }
    goto LABEL_14;
  }
  long long v18 = [v8 userActivities];
  int v16 = [v18 anyObject];

  userActivityController = self->_userActivityController;
  int v20 = [v16 activityType];
  BOOL v17 = [(UserActivityController *)userActivityController willContinueUserActivityWithType:v20];

LABEL_16:
  BOOL v21 = [v8 shortcutItem];
  if (v21)
  {
    id v22 = (id)WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v23 = [v21 type];
      *(_DWORD *)buf = 138543362;
      BOOL v84 = v23;
      _os_log_impl(&dword_1E102C000, v22, OS_LOG_TYPE_DEFAULT, "Handling session connection as shortcutItem of type: %{public}@", buf, 0xCu);
    }
    [(BrowserController *)self windowScene:v12 performActionForShortcutItem:v21 completionHandler:&__block_literal_global_995];
    goto LABEL_42;
  }
  if (!v17)
  {
    long long v26 = objc_msgSend(v16, "_sf_windowCreationNavigationIntent");
    if (v26
      || (-[BrowserController _openURLNavigationIntentForSceneConnectionOptions:]((uint64_t)self, v8),
          (long long v26 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      int v27 = (id)WBS_LOG_CHANNEL_PREFIXTabs();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        double v28 = [v26 privacyPreservingDescription];
        *(_DWORD *)buf = 138543362;
        BOOL v84 = v28;
        _os_log_impl(&dword_1E102C000, v27, OS_LOG_TYPE_DEFAULT, "Handling session connection as navigationIntent: %{public}@", buf, 0xCu);
      }
      if ([v26 policy] == 4)
      {
        id v29 = [(BrowserController *)self browserWindowController];
        uint64_t v30 = [v26 sourceWindowUUID];
        id v31 = [v29 browserControllerWithUUID:v30];
        CGRect v32 = [v31 activeProfileIdentifier];

        if ([v32 length]) {
          [(TabController *)self->_tabController setActiveProfileIdentifier:v32];
        }
      }
      if ([v26 type] == 9)
      {
        double v33 = [v26 URL];
        v34 = objc_msgSend(v33, "safari_composedIdentifierAndProfileIdentifierInSafariWebExtensionURL");
        id v35 = [v34 second];

        if ([v35 length]) {
          [(TabController *)self->_tabController setActiveProfileIdentifier:v35];
        }
      }
      if (![(BrowserController *)self shouldStayInFocusedTabGroupForExternalLinks])[(TabController *)self->_tabController switchOutOfSyncedTabGroup]; {
      uint64_t v36 = [v8 URLContexts];
      }
      char v37 = -[BrowserController handleOpenURLContextsForReadingListWidget:](self, v36);

      if ((v37 & 1) == 0) {
        [(BrowserController *)self handleNavigationIntent:v26 completion:0];
      }
      objc_msgSend(v16, "_sf_invalidateWindowCreationData");
      goto LABEL_41;
    }
    id v42 = objc_msgSend(v16, "_sf_windowCreationTabUUID");
    if (v42)
    {
    }
    else
    {
      uint64_t v43 = objc_msgSend(v16, "_sf_windowCreationTabGroupUUID");
      BOOL v44 = v43 == 0;

      if (v44)
      {
        uint64_t v60 = objc_msgSend(v16, "_sf_windowCreationRecentlyClosedTabUUID");
        if (v60)
        {
          uint64_t v61 = [(_SFBrowserSavedState *)self->_savedState tabStateDataForUUID:v60];
          if (v61)
          {
            v62 = WBS_LOG_CHANNEL_PREFIXTabs();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1E102C000, v62, OS_LOG_TYPE_DEFAULT, "Handling session connection as window creation from recently closed tab", buf, 2u);
            }
            [(_SFBrowserSavedState *)self->_savedState loadSessionStateDataAndRemoveRecentlyClosedTab:v61];
            v63 = [[TabDocument alloc] initWithTabStateData:v61 hibernated:0 browserController:self];
            [(TabController *)self->_tabController replaceBlankActiveTabWithTab:v63];
          }
          else
          {
            v68 = WBS_LOG_CHANNEL_PREFIXTabs();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
              -[BrowserController scene:willConnectToSession:options:]();
            }
          }
        }
        else
        {
          v67 = WBS_LOG_CHANNEL_PREFIXTabs();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E102C000, v67, OS_LOG_TYPE_INFO, "Not handling session connection as a navigation", buf, 2u);
          }
        }
        goto LABEL_82;
      }
    }
    v45 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v45, OS_LOG_TYPE_DEFAULT, "Handling session connection as window creation from tab", buf, 2u);
    }
    v46 = objc_msgSend(v16, "_sf_windowCreationTabUUID");
    v72 = v46;
    if (v46)
    {
      tabController = self->_tabController;
      v48 = [v46 UUIDString];
      uint64_t v49 = [(TabController *)tabController wbTabWithUUID:v48];
    }
    else
    {
      uint64_t v49 = 0;
    }
    dispatch_time_t v71 = v49;
    BOOL v74 = objc_msgSend(v16, "_sf_windowCreationTabGroupUUID");
    uint64_t v50 = [v74 UUIDString];
    if (v50)
    {
      v51 = (void *)v50;
    }
    else
    {
      v51 = [v49 tabGroupUUID];
      if (!v51)
      {
        if (!v72)
        {
          v51 = 0;
          BOOL v73 = 0;
          [(TabController *)self->_tabController setActiveProfileIdentifier:0];
LABEL_60:
          if (v74)
          {
            v54 = WBS_LOG_CHANNEL_PREFIXTabs();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              BOOL v84 = v74;
              _os_log_impl(&dword_1E102C000, v54, OS_LOG_TYPE_DEFAULT, "Connecting a scene session with explicit tab group: %{public}@", buf, 0xCu);
            }
            if (v72)
            {
              v55 = [(BrowserController *)self tabController];
              [v55 switchToTabWithUUID:v72 inTabGroupWithUUID:v74];
LABEL_80:

              goto LABEL_81;
            }
            v55 = [v74 UUIDString];
            v59 = [(BrowserController *)self tabController];
            [v59 setActiveTabGroupUUID:v55];
LABEL_79:

            goto LABEL_80;
          }
          if (!v72)
          {
LABEL_81:

            uint64_t v60 = v72;
LABEL_82:

            long long v26 = 0;
LABEL_41:

            goto LABEL_42;
          }
          int v56 = objc_msgSend(v16, "_sf_windowCreationSourceBrowserControllerUUID");
          v57 = [v76 browserControllerWithUUID:v56];
          v55 = [v57 tabController];

          v58 = [v55 tabWithUUID:v72];
          v59 = v58;
          if (v58)
          {
            uint64_t v70 = v58;
            -[BrowserController setPrivateBrowsingEnabled:](self, "setPrivateBrowsingEnabled:", [v58 isPrivateBrowsingEnabled]);
            [(TabController *)self->_tabController replaceBlankActiveTabWithTab:v70];
          }
          else
          {
            if (!v71) {
              goto LABEL_79;
            }
            uint64_t v70 = 0;
            -[BrowserController setPrivateBrowsingEnabled:](self, "setPrivateBrowsingEnabled:", [v71 isPrivateBrowsing]);
            int v65 = self->_tabController;
            v82 = v71;
            v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
            v66 = [(TabController *)self->_tabController activeTabGroup];
            [(TabController *)v65 moveWBTabs:v69 toTabGroup:v66];

            [(TabController *)self->_tabController removeSingleBlankTabFromActiveTabGroup];
          }
          v59 = v70;
          goto LABEL_79;
        }
        v52 = [(TabController *)self->_tabController pinnedTabsManager];
        v53 = [v72 UUIDString];
        v64 = [v52 containerForTabWithUUID:v53];
        BOOL v73 = [v64 activeProfileIdentifier];

        v51 = 0;
LABEL_59:

        [(TabController *)self->_tabController setActiveProfileIdentifier:v73];
        goto LABEL_60;
      }
    }
    v52 = [(TabController *)self->_tabController tabGroupManager];
    v53 = [v52 tabGroupWithUUID:v51];
    BOOL v73 = [v53 profileIdentifier];
    goto LABEL_59;
  }
  int v24 = (id)WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v25 = [v16 activityType];
    *(_DWORD *)buf = 138543362;
    BOOL v84 = v25;
    _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_DEFAULT, "Handling session connection as generic NSUserActivity of type: %{public}@", buf, 0xCu);
  }
  [(BrowserController *)self scene:v12 continueUserActivity:v16];
LABEL_42:

  -[BrowserController _updateSceneTitle]((uint64_t)self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__BrowserController_scene_willConnectToSession_options___block_invoke_996;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  if (-[BrowserController scene:willConnectToSession:options:]::onceToken != -1) {
    dispatch_once(&-[BrowserController scene:willConnectToSession:options:]::onceToken, block);
  }
  -[BrowserController _showDefaultBrowserSheetIfNecessary]((uint64_t)self);
  v38 = +[LaunchStateController sharedController];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __56__BrowserController_scene_willConnectToSession_options___block_invoke_997;
  v79[3] = &unk_1E6D791E8;
  v79[4] = self;
  id v39 = v78;
  id v80 = v39;
  [v38 doAfterUIBecomesActive:v79];

  uint64_t v40 = [v8 cloudKitShareMetadata];
  if (v40) {
    [(BrowserController *)self windowScene:v12 userDidAcceptCloudKitShareWithMetadata:v40];
  }

  id v41 = [MEMORY[0x1E4FB60C8] sharedProxy];
  [v41 addSyncObserver:self];

  [(WBTabGroupManager *)self->_tabGroupManager addTabGroupObserver:self];
}

- (void)setUpWithURL:(id)a3 launchOptions:(id)a4
{
  id v34 = a3;
  id v33 = a4;
  uint64_t v6 = [MEMORY[0x1E4F78558] settings];
  uint64_t v7 = [(BrowserController *)self UUID];
  uint64_t v8 = [v6 privateBrowsingEnabledForWindowWithUUID:v7];

  [(BrowserController *)self _initSubviews];
  [(BrowserController *)self setPrivateBrowsingEnabled:v8];
  CGRect v32 = [(BrowserRootViewController *)self->_rootViewController navigationBar];
  -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
  int v9 = [(BrowserRootViewController *)self->_rootViewController view];
  [v9 safeAreaInsets];
  objc_msgSend(v32, "setContentUnderStatusBarHeight:");

  [(TabController *)self->_tabController openInitialBlankTabDocumentIfNeeded];
  id v35 = [(TabController *)self->_tabController activeTabDocument];
  id v10 = [v35 navigationBarItem];
  [v32 setItem:v10];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v11 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  [v11 addObserver:self selector:sel__didChangePowerState name:*MEMORY[0x1E4F287E8] object:0];
  [v11 addObserver:self selector:sel__bookmarksDidReload_ name:*MEMORY[0x1E4FB6148] object:0];
  [v11 addObserver:self selector:sel__bookmarksDidReload_ name:@"bookmarkCollectionHasBecomeAvailableNotification" object:0];
  [v11 addObserver:self selector:sel__perSiteAutomaticReaderActivationPreferenceDidChange_ name:*MEMORY[0x1E4F99370] object:0];
  [v11 addObserver:self selector:sel__perSitePageZoomPreferenceDidChange_ name:*MEMORY[0x1E4F992F8] object:0];
  [v11 addObserver:self selector:sel__downloadsDidChange_ name:*MEMORY[0x1E4F3B170] object:0];
  [v11 addObserver:self selector:sel__downloadsTotalProgressDidChange_ name:*MEMORY[0x1E4F3B168] object:0];
  [v11 addObserver:self selector:sel__downloadManagerDidFinishLastDownload_ name:*MEMORY[0x1E4F3B158] object:0];
  [v11 addObserver:self selector:sel__hasUnviewedDownloadsDidChange_ name:*MEMORY[0x1E4F3B160] object:0];
  id v12 = +[Application sharedApplication];
  int v13 = [v12 isRunningPPT];

  id v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v15 = [v14 BOOLForKey:@"disableFavoritesGridForPurpleTests"];

  int v16 = +[Application sharedApplication];
  int v17 = [v16 shouldRestoreStateForPPT];

  if (((v13 ^ 1 | v15 | v17) & 1) == 0)
  {
    [(BrowserController *)self updateFavoritesForNewDocument];
LABEL_8:
    if (!v8) {
      goto LABEL_21;
    }
    goto LABEL_9;
  }
  if ((v13 ^ 1 | v17) != 1) {
    goto LABEL_8;
  }
  id v31 = v34;
  if (self->_didRestoreState)
  {
    long long v18 = [v35 _backForwardList];
    long long v19 = [v18 currentItem];
    [v35 goToBackForwardListItem:v19];
  }
  if (self->_usesTabBar)
  {
    [(TabCollectionViewProviding *)self->_tabCollectionViewProvider updateTabBarAnimated:0];
  }
  else if (self->_didRestoreState)
  {
    [(TabCollectionViewProviding *)self->_tabCollectionViewProvider updateTabViewsAnimatingTabBar:0];
  }
  BOOL v23 = objc_msgSend(v33, "safari_dictionaryForKey:", *MEMORY[0x1E4FB26B0]);
  int v24 = objc_msgSend(v23, "safari_stringForKey:", *MEMORY[0x1E4FB26B8]);
  int v25 = [v24 isEqualToString:*MEMORY[0x1E4F28AC0]];

  long long v26 = [(TabController *)self->_tabController activeTabDocument];
  int v27 = v26;
  if (v25) {
    [v26 setPreparingForNewUserActivity:1];
  }
  [(BrowserController *)self updateFavoritesForNewDocument];
  if (v25) {
    [v27 setPreparingForNewUserActivity:0];
  }
  if (!v31)
  {
    double v28 = [MEMORY[0x1E4F78558] settings];
    id v29 = [(BrowserController *)self UUID];
    int v30 = [v28 isShowingTabViewForWindowWithUUID:v29];

    if (v30)
    {
      [(TabCollectionViewProviding *)self->_tabCollectionViewProvider setSnapshotsEnabled:1];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __48__BrowserController_setUpWithURL_launchOptions___block_invoke;
      v37[3] = &unk_1E6D79060;
      v37[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v37];
    }
  }

  if (v8)
  {
LABEL_9:
    int v20 = +[FeatureManager sharedFeatureManager];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __48__BrowserController_setUpWithURL_launchOptions___block_invoke_2;
    v36[3] = &unk_1E6D793E8;
    v36[4] = self;
    [v20 determineIfPrivateBrowsingIsAvailableWithCompletionHandler:v36];

    BOOL v21 = +[Application sharedApplication];
    int v22 = [v21 isPrivateBrowsingLocked];

    if (v22) {
      [(BrowserRootViewController *)self->_rootViewController showLockedPrivateBrowsingView];
    }
  }
LABEL_21:
  [MEMORY[0x1E4F3B038] registerReaderCustomProtocols];
}

- (void)setPrivateBrowsingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TabController *)self->_tabController activeTabGroup];
  id v15 = v5;
  if (v3)
  {
    if (([v5 isPrivateBrowsing] & 1) == 0) {
      [(TabController *)self->_tabController selectPrivateTabGroup];
    }
  }
  else if ([v5 isPrivateBrowsing])
  {
    [(TabController *)self->_tabController selectLocalTabGroup];
  }
  if (self->_privateBrowsingEnabled != v3)
  {
    [(BrowserController *)self writePrivateBrowsingEnabled:v3];
    self->_privateBrowsingEnabled = v3;
    -[BrowserController _updateConfiguration]((uint64_t)self);
    -[BrowserController _updateAddTabMenuProvider](self);
    uint64_t v6 = +[Application sharedApplication];
    -[_SFBrowserSavedState setSecureDeleteEnabled:](self->_savedState, "setSecureDeleteEnabled:", [v6 usesPrivateBrowsingModeInAnyWindow]);
    [(TabController *)self->_tabController setPrivateBrowsingEnabled:v3];
    uint64_t v7 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v7 didSetPrivateBrowsingEnabled:v3];

    -[BrowserController _updateSceneTitle]((uint64_t)self);
    cachedCatalogViewController = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
    int v9 = cachedCatalogViewController;
    if (!cachedCatalogViewController) {
      cachedCatalogViewController = self->_cachedCatalogViewController;
    }
    [cachedCatalogViewController didTogglePrivateBrowsing];

    -[BrowserController _prepareExtensionsForEffectiveProfile](self);
    if (!self->_suppressWebExtensionEvents)
    {
      id v10 = [(BrowserController *)self effectiveProfileIdentifier];
      id v11 = [v6 webExtensionsControllerForProfileServerID:v10];

      id v12 = [(BrowserController *)self activeWebExtensionWindow];
      [v11 didActivateWindow:v12];
    }
    int v13 = [(BrowserRootViewController *)self->_rootViewController bookmarksBar];
    [v13 setNeedsReloadData];

    id v14 = [(BrowserController *)self unifiedField];
    [v14 clearUserTypedText];
  }
}

- (void)adoptSceneID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 copy];
  [(WBWindowState *)self->_windowState setSceneID:v5];

  tabGroupManager = self->_tabGroupManager;
  windowState = self->_windowState;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __34__BrowserController_adoptSceneID___block_invoke;
  v13[3] = &unk_1E6D793E8;
  id v8 = v4;
  id v14 = v8;
  [(WBTabGroupManager *)tabGroupManager saveWindowState:windowState completionHandler:v13];
  int v9 = (NSString *)[v8 copy];
  sceneID = self->_sceneID;
  self->_sceneID = v9;

  savedState = self->_savedState;
  id v12 = [(BrowserController *)self windowStateData];
  [(_SFBrowserSavedState *)savedState updateSceneID:v12];
}

- (_SFBrowserWindowStateData)windowStateData
{
  id v3 = objc_alloc(MEMORY[0x1E4F78560]);
  id v4 = [(NSUUID *)self->_UUID UUIDString];
  uint64_t v5 = (void *)[v3 initWithUUIDString:v4 sceneID:self->_sceneID];

  return (_SFBrowserWindowStateData *)v5;
}

- (void)_readSavedState
{
  if (a1)
  {
    id v2 = +[Application sharedApplication];
    if ([v2 isRunningPPT] && !objc_msgSend(v2, "shouldRestoreStateForPPT")) {
      [*(id *)(a1 + 344) openInitialBlankTabDocumentIfNeeded];
    }
    else {
      *(unsigned char *)(a1 + 97) = [*(id *)(a1 + 344) readState];
    }
  }
}

- (id)_openURLNavigationIntentForSceneConnectionOptions:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 webClipID];
      if (v4)
      {
        uint64_t v5 = objc_msgSend(MEMORY[0x1E4FB1F10], "_sf_webClipWithUUID:", v4);
        if (v5)
        {
          uint64_t v6 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
          uint64_t v7 = [v6 navigationIntentWithWebClip:v5];
          goto LABEL_9;
        }
      }
    }
    id v4 = [v3 URLContexts];
    if (![v4 count])
    {
      id v8 = 0;
      goto LABEL_11;
    }
    uint64_t v5 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
    uint64_t v6 = [v4 allObjects];
    uint64_t v7 = [v5 navigationIntentWithOpenURLContexts:v6];
LABEL_9:
    id v8 = (void *)v7;

LABEL_11:
    goto LABEL_12;
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

- (WBWindowState)windowState
{
  return self->_windowState;
}

- (void)browserViewController:(id)a3 didCreateToolbar:(id)a4
{
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v5 = a3;
  self->_suspendedOrSuspending = 0;
  if (!self->_canPerformPostLaunchActions)
  {
    self->_canPerformPostLaunchActions = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserControllerStartPageUpdatePolicyDidChange:self];
    }
  }
  [(BrowserController *)self didBecomeActive];
}

- (void)catalogViewControllerDidAppear:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserControllerStartPageUpdatePolicyDidChange:self];
  }
}

void __64__BrowserController__updateDigitalHealthOverlayForTabDocuments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__BrowserController__updateDigitalHealthOverlayForTabDocuments___block_invoke_2;
    block[3] = &unk_1E6D79E08;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v7);
  }
}

- (void)updateTabOverviewButton
{
  uint64_t v3 = [(BrowserRootViewController *)self->_rootViewController capsuleCollectionViewLayout];
  if (v3
    && (v9 = (id)v3, BOOL v4 = [(TabController *)self->_tabController hasUnreadTab], v9, v4))
  {
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.on.square.badge"];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4FB1818], "sf_imageNamed:", @"square.on.square.badge");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v10 = v7;

    uint64_t v8 = (uint64_t)v10;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.on.square"];
  }
  id v11 = (id)v8;
  [(_SFBarManager *)self->_barManager setImage:v8 forBarItem:8];
}

- (void)browserViewControllerDidChangeToolbarPlacement:(id)a3
{
  [(_SFBarManager *)self->_barManager visibleBarItemsNeedUpdate];
  -[BrowserController _updateTabGroupBanner]((id *)&self->super.super.super.isa);
  [(BrowserController *)self updateTabOverviewButton];
}

void __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_15(id *a1)
{
  id v4 = [a1[4] downloads];
  uint64_t v2 = [v4 count];

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    [WeakRetained loadViewIfNeeded];
    uint64_t v3 = [WeakRetained navigationBar];
    [v3 setHasToolbar:1];
  }
  id v6 = objc_loadWeakRetained(a1 + 6);
  [v6 setBarItem:11 hidden:v2 == 0];
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 5)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_8;
    v6[3] = &unk_1E6D79060;
    uint64_t v3 = &v7;
    id v5 = *(void **)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v5 setShowingCompletions:1 completionHandler:v6];
    goto LABEL_6;
  }
  if (v2 == 4 && !*(unsigned char *)(a1 + 56))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_7;
    v8[3] = &unk_1E6D79060;
    uint64_t v3 = &v9;
    id v4 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    [v4 setShowingCompletions:0 completionHandler:v8];
LABEL_6:
  }
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_7(uint64_t a1)
{
}

void __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_6(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 384));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:a1[4] didDismissTransientUIWithOptions:a1[6]];
  }
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)dynamicBarAnimatorStateDidChange:(id)a3
{
  id v4 = a3;
  if ([(BrowserRootViewController *)self->_rootViewController keepBarsMinimized]
    && [v4 state] == 1
    && ![(BrowserRootViewController *)self->_rootViewController isPerformingSizeTransition])
  {
    [(BrowserRootViewController *)self->_rootViewController setKeepBarsMinimized:0];
    [(BrowserRootViewController *)self->_rootViewController updateWebViewSizeAttributes];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__BrowserController_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E6D79260;
  id v12 = self;
  int v13 = a6;
  id v11 = v8;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)canBecomeFirstResponder
{
  int isWindowLockedForPrivate = -[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self);
  id v4 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v4 presentationState] == 1)
  {

LABEL_6:
    LOBYTE(v7) = 1;
    goto LABEL_7;
  }
  uint64_t v5 = [v4 presentationState];

  if (v5 == 2) {
    goto LABEL_6;
  }
  webView = self->_webView;
  if (!webView) {
    goto LABEL_6;
  }
  int v7 = [(_SFWebView *)webView canBecomeFirstResponder] | isWindowLockedForPrivate;
LABEL_7:

  return v7;
}

uint64_t __32__BrowserController_setWebView___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 280) view];
  [v2 setNeedsLayout];

  -[BrowserController _contentContainerViewFrameDidChange](*(void *)(a1 + 32));
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) setShowingCrashBanner:1 animated:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 384));
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:*(void *)(a1 + 32)];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 280) view];
  [v4 layoutIfNeeded];

  uint64_t v5 = *(void **)(a1 + 40);
  return [v5 _endPinningInputViews];
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(TabController *)self->_tabController clearBrowserController];
  tabController = self->_tabController;
  self->_tabController = 0;

  tabCollectionViewProvider = self->_tabCollectionViewProvider;
  self->_tabCollectionViewProvider = 0;

  [(_SFBarManager *)self->_barManager cancelCoalescedUpdates];
  uint64_t v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 removeObserver:self];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  [(WKWebpagePreferences *)self->_defaultWebpagePreferences removeObserver:self forKeyPath:*MEMORY[0x1E4F99298]];
  int v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_standardUserDefaultsWithOptimizedKeyValueObserving");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = observableWebKitFeaturesByDefaultsKey();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        [v7 removeObserver:self forKeyPath:*(void *)(*((void *)&v14 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(NSTimer *)self->_lastTimerForDelayingSpeculativelyPreloadingTopHit invalidate];
  lastTimerForDelayingSpeculativelyPreloadingTopHit = self->_lastTimerForDelayingSpeculativelyPreloadingTopHit;
  self->_lastTimerForDelayingSpeculativelyPreloadingTopHit = 0;

  v13.receiver = self;
  v13.super_class = (Class)BrowserController;
  [(BrowserController *)&v13 dealloc];
}

- (void)restoreInterfaceAfterElementFullscreen
{
  if (!self->_isPerformingRootViewControllerSizeTransition)
  {
    self->_isRestoringInterfaceAfterElementFullscreen = 1;
    uint64_t v3 = [(BrowserRootViewController *)self->_rootViewController view];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;

    -[BrowserController rootViewControllerViewWillTransitionToSize:](self, "rootViewControllerViewWillTransitionToSize:", v5, v7);
    -[BrowserController rootViewControllerViewTransitionFromSize:includingSidebar:animated:](self, "rootViewControllerViewTransitionFromSize:includingSidebar:animated:", 1, 0, v5, v7);
    -[BrowserController rootViewControllerViewDidTransitionFromSize:animated:](self, "rootViewControllerViewDidTransitionFromSize:animated:", 0, v5, v7);
    self->_isRestoringInterfaceAfterElementFullscreen = 0;
  }
}

- (void)statusBarHeightChanged
{
  self->_statusBarHeightChangedWhilePerformingRootViewControllerSizeTransition = self->_isPerformingRootViewControllerSizeTransition;
  if (!self->_isPerformingRootViewControllerSizeTransition) {
    -[BrowserController updateViewsAfterStatusBarChange]((id *)&self->super.super.super.isa);
  }
  [(BrowserController *)self updateScrollToTopView];
}

- (void)updateViewsAfterStatusBarChange
{
  if (a1)
  {
    id v31 = [a1[35] viewIfLoaded];
    if (v31)
    {
      id v2 = a1[38];
      [v2 bounds];
      objc_msgSend(v2, "convertRect:toView:", 0);
      double v4 = v3;
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      [v31 setNeedsLayout];
      [v31 layoutIfNeeded];
      -[BrowserController _contentContainerViewFrameDidChange]((uint64_t)a1);
      if (([a1[115] _isInFullscreen] & 1) == 0)
      {
        [a1[38] bounds];
        double v12 = v11;
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        objc_msgSend(a1[38], "convertRect:fromView:", 0, v4, v6, v8, v10);
        double v20 = v19;
        double v22 = v21;
        [a1[38] contentInset];
        double v25 = -v24;
        if (-(v20 - v12 * 2.0) >= -v24) {
          double v25 = -(v20 - v12 * 2.0);
        }
        double v26 = -v23;
        if (-(v22 - v14 * 2.0) >= -v23) {
          double v26 = -(v22 - v14 * 2.0);
        }
        objc_msgSend(a1[38], "setBounds:", v25, v26, v16, v18);
      }
      -[BrowserController _updateContinuousReadingViewControllerFrame](a1);
      -[BrowserController _updateCurrentPageBannerViewIfNeeded](a1);
      [a1 updateExposedScrollViewRect];
      -[BrowserController _updateAppInfoOverlayFrame]((uint64_t)a1);
      int v27 = [a1[35] navigationBar];
      [v27 layoutIfNeeded];

      id WeakRetained = objc_loadWeakRetained(a1 + 48);
      [WeakRetained browserControllerLayOutCatalogView:a1];

      id v29 = -[BrowserController _catalogViewController](a1);
      int v30 = [v29 view];
      [v30 layoutIfNeeded];
    }
  }
}

- (BOOL)_canScrollToTopInView:(uint64_t)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    [v3 contentOffset];
    double v6 = v5;
    [v4 contentInset];
    if (v6 > -v7)
    {
      BOOL v9 = 1;
    }
    else
    {
      double v8 = [*(id *)(a1 + 280) dynamicBarAnimator];
      BOOL v9 = [v8 state] == 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)willResignActive
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  resignActiveDate = self->_resignActiveDate;
  self->_resignActiveDate = v3;

  [(WBTabGroupManager *)self->_tabGroupManager movePresenceForParticipantToTabWithUUID:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  [WeakRetained saveBrowserState];
}

- (void)didEnterBackground
{
  objc_initWeak(&location, self);
  self->_backgrounded = 1;
  [(BrowserRootViewController *)self->_rootViewController setInYttriumState:0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__BrowserController_didEnterBackground__block_invoke;
  v14[3] = &unk_1E6D79060;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v14);
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = *MEMORY[0x1E4FB2748];
  id v3 = (void *)*MEMORY[0x1E4FB2608];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__BrowserController_didEnterBackground__block_invoke_2;
  v9[3] = &unk_1E6D79088;
  void v9[4] = &v10;
  uint64_t v4 = [v3 beginBackgroundTaskWithName:@"com.apple.mobilesafari.FlushTabSnapshots" expirationHandler:v9];
  v11[3] = v4;
  tabCollectionViewProvider = self->_tabCollectionViewProvider;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__BrowserController_didEnterBackground__block_invoke_60;
  v7[3] = &unk_1E6D790B0;
  objc_copyWeak(&v8, &location);
  void v7[4] = &v10;
  [(TabCollectionViewProviding *)tabCollectionViewProvider flushPendingSnapshotsWithCompletion:v7];
  [(TabController *)self->_tabController closeTabsAutomaticallyIfNecessary];
  [(TabController *)self->_tabController deactivateAllUsageTrackingInformationIfNecessary];
  if (!self->_tabDocumentPlayingPIPVideo) {
    [(WBSDigitalHealthManager *)self->_digitalHealthManager stopObservingWithCompletionHandler:0];
  }
  double v6 = +[MediaCaptureStatusBarManager sharedManager];
  [v6 browserControllerDidEnterBackground:self];

  objc_destroyWeak(&v8);
  _Block_object_dispose(&v10, 8);
  objc_destroyWeak(&location);
}

uint64_t __39__BrowserController_didEnterBackground__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 344) switchToTabGroupVisibleInSwitcherIfNeeded];
}

uint64_t __39__BrowserController_didEnterBackground__block_invoke_2(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __39__BrowserController_didEnterBackground__block_invoke_2_cold_1();
  }
  return [(id)*MEMORY[0x1E4FB2608] endBackgroundTask:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __39__BrowserController_didEnterBackground__block_invoke_60(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    -[BrowserController _flushPendingSnapshotsDidComplete](WeakRetained);
  }
  uint64_t v4 = (void *)*MEMORY[0x1E4FB2608];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return [v4 endBackgroundTask:v5];
}

- (void)_flushPendingSnapshotsDidComplete
{
  if (val)
  {
    objc_initWeak(&location, val);
    if (*((unsigned char *)val + 718))
    {
      id v2 = [val[35] traitCollection];
      id v3 = (void *)[v2 userInterfaceStyle];

      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __54__BrowserController__flushPendingSnapshotsDidComplete__block_invoke;
      v4[3] = &unk_1E6D790D8;
      objc_copyWeak(v5, &location);
      v5[1] = v3;
      [val[116] setPostponedSnapshotInvalidationCondition:v4];
      [val[116] setSnapshotsEnabled:0];
      objc_destroyWeak(v5);
    }
    objc_destroyWeak(&location);
  }
}

BOOL __54__BrowserController__flushPendingSnapshotsDidComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained[35] traitCollection];
    BOOL v5 = [v4 userInterfaceStyle] != *(void *)(a1 + 40);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)invalidateSourceApplication
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = [(TabController *)self->_tabController allTabDocuments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) invalidateSourceApplication];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (BOOL)isAnyPageLoaded
{
  id v2 = [(TabController *)self->_tabController windowState];
  uint64_t v3 = [v2 localTabGroup];
  uint64_t v4 = [v3 tabs];
  if (objc_msgSend(v4, "safari_containsObjectPassingTest:", &__block_literal_global_9))
  {
    char v5 = 1;
  }
  else
  {
    long long v6 = [v2 privateTabGroup];
    long long v7 = [v6 tabs];
    char v5 = objc_msgSend(v7, "safari_containsObjectPassingTest:", &__block_literal_global_9);
  }
  return v5;
}

BOOL __36__BrowserController_isAnyPageLoaded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 url];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_showDigitalHealthOverlayForTabDocument:(uint64_t)a3 withPolicy:(uint64_t)a4 animated:
{
  id v15 = a2;
  if (a1)
  {
    [v15 addMediaSuspensionReason:1];
    if (!*(unsigned char *)(a1 + 710))
    {
      id v7 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
      if ([v7 presentationState] == 1)
      {
        uint64_t v8 = (uint64_t)v7;
        goto LABEL_5;
      }
      uint64_t v9 = [v7 presentationState];

      if (v9 == 2) {
        goto LABEL_8;
      }
      char v10 = -[BrowserController _isTabDocumentFrontMostForDigitalHealth:](a1, v15);

      if (v10)
      {
        uint64_t v8 = [v15 URL];
        if (!v8) {
          goto LABEL_6;
        }
        [(id)a1 showBars];
        uint64_t v11 = [*(id *)(a1 + 920) firstResponder];
        [v11 resignFirstResponder];

        -[BrowserController _screenTimeHostingViewControllerForTabDocument:]((id *)a1, v15);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = [v7 screenTimeOverlayViewController];
        if (!v12)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F78340]);
          [v7 setScreenTimeOverlayViewController:v13];
          uint64_t v12 = v13;
          [v13 setDelegate:a1];
        }
        -[BrowserController _updateDigitalHealthViewFrame]((id *)a1);
        double v14 = [v12 showBlockingViewControllerForURL:v8 withPolicy:a3 animated:a4];
        [v15 setAssociatedBlockingViewController:v14];
        if (v14) {
          -[BrowserController _insertScreenTimeLockoutShieldIntoContentViewForTab:animated:]((id *)a1, v15, a4);
        }
        [v15 dismissSiriReaderMediaSessionImmediately:0];

LABEL_5:
LABEL_6:
        id v7 = (id)v8;
LABEL_8:
      }
    }
  }
}

- (void)loadURL:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(TabController *)self->_tabController activeTabDocument];
  id v5 = (id)[v4 loadURL:v6 userDriven:0];
}

- (BOOL)showDemoModeFeatureDisabledAlert
{
  int v3 = [MEMORY[0x1E4FB1438] isRunningInStoreDemoMode];
  if (v3 && !self->_showingDemoModeAlert)
  {
    self->_showingDemoModeAlert = 1;
    uint64_t v4 = (void *)MEMORY[0x1E4FB1418];
    id v5 = _WBSLocalizedString();
    id v6 = [v4 alertControllerWithTitle:v5 message:0 preferredStyle:1];

    id v7 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v8 = _WBSLocalizedString();
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__BrowserController_showDemoModeFeatureDisabledAlert__block_invoke;
    v12[3] = &unk_1E6D79120;
    v12[4] = self;
    uint64_t v9 = [v7 actionWithTitle:v8 style:1 handler:v12];
    [v6 addAction:v9];

    char v10 = [(BrowserController *)self viewControllerToPresentFrom];
    [v10 presentViewController:v6 animated:1 completion:0];
  }
  return v3;
}

uint64_t __53__BrowserController_showDemoModeFeatureDisabledAlert__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 339) = 0;
  return result;
}

- (_SFPageFormatMenuController)pageFormatMenuController
{
  pageFormatMenuController = self->_pageFormatMenuController;
  if (!pageFormatMenuController)
  {
    uint64_t v4 = (_SFPageFormatMenuController *)[objc_alloc(MEMORY[0x1E4F3AFE8]) initWithBrowserContentController:self];
    id v5 = self->_pageFormatMenuController;
    self->_pageFormatMenuController = v4;

    pageFormatMenuController = self->_pageFormatMenuController;
  }
  return pageFormatMenuController;
}

uint64_t __48__BrowserController__setShowingTabBar_animated___block_invoke(id *a1)
{
  [a1[4] updateDynamicBarGeometry];
  id v2 = [*((id *)a1[4] + 35) view];
  [v2 layoutIfNeeded];

  -[BrowserController _contentContainerViewFrameDidChange]((uint64_t)a1[4]);
  -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)a1[4]);
  [a1[5] layoutBelowIfNeeded];
  [a1[6] layoutSubviews];
  [a1[7] setNeedsLayout];
  id v3 = a1[7];
  return [v3 layoutBelowIfNeeded];
}

- (void)showCrashBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(BannerController *)self->_bannerController crashBanner];
  if ((v10 != 0) == (v6 == 0) || (uint64_t v7 = [v10 messageType], v7 != objc_msgSend(v6, "messageType")))
  {
    uint64_t v8 = _SFBackdropGroupNameForOwner();
    [v10 setBackdropGroupName:v8];

    uint64_t v9 = [v10 closeButton];
    [v9 addTarget:self action:sel__hideCrashBanner forControlEvents:64];

    [(BannerController *)self->_bannerController setCrashBanner:v10 animated:v4];
  }
}

- (void)_hideCrashBanner
{
}

- (uint64_t)_shouldShowBackgroundViewForTabDocument:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1) {
    a1 = [v3 isPDFDocument] ^ 1;
  }

  return a1;
}

- (BOOL)canHideBars
{
  id v2 = [(BrowserRootViewController *)self->_rootViewController dynamicBarAnimator];
  char v3 = [v2 canTransitionToState:0];

  return v3;
}

- (void)setUsesNarrowLayout:(BOOL)a3
{
  if (((!self->_usesNarrowLayout ^ a3) & 1) == 0)
  {
    self->_usesNarrowLayout = a3;
    -[BrowserController _updateUsesNarrowLayout]((uint64_t)self);
  }
}

- (BOOL)canShowSidebar
{
  return (unint64_t)([(BrowserController *)self _bookmarksPresentationStyle] - 1) < 2;
}

- (uint64_t)_shouldHideCatalogViewControllerForSizeChange
{
  id v1 = a1;
  if (a1)
  {
    unint64_t v2 = a1[103];
    if (v2 <= 5)
    {
      if (((1 << v2) & 0x19) != 0)
      {
        char v3 = -[BrowserController _catalogViewController]((id *)a1);
        if ([v3 isShowingCompletions])
        {
          LOBYTE(v1) = 1;
        }
        else
        {
          BOOL v4 = [v1 unifiedField];
          LOBYTE(v1) = [v4 isFirstResponder];
        }
      }
      else
      {
        LOBYTE(v1) = *((unsigned char *)a1 + 489) != 0;
      }
    }
  }
  return v1 & 1;
}

- (void)_downloadsTotalProgressDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F3AF68], "sharedManager", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 totalProgress];
  double v5 = v4;

  [(_SFBarManager *)self->_barManager setDownloadsItemProgress:v5];
  id v8 = [(TabController *)self->_tabController activeTabDocument];
  id v6 = [v8 unifiedTabBarItem];
  [v6 setDownloadProgress:1 animated:v5];
}

- (void)_downloadManagerDidFinishLastDownload:(id)a3
{
  double v4 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  if ([v4 capsuleIsMinimized])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __59__BrowserController__downloadManagerDidFinishLastDownload___block_invoke;
    v5[3] = &unk_1E6D79060;
    void v5[4] = self;
    [v4 transitionToState:0 animated:1 completionHandler:v5];
  }
  else
  {
    [(_SFBarManager *)self->_barManager pulseDownloadsItem];
  }
}

uint64_t __59__BrowserController__downloadManagerDidFinishLastDownload___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 832) pulseDownloadsItem];
}

- (void)_hasUnviewedDownloadsDidChange:(id)a3
{
  double v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 updateMenuButtonShowsBadge];

  -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 0);
}

- (uint64_t)_shouldShowSidebarForSizeChange
{
  uint64_t v1 = a1;
  if (a1)
  {
    unint64_t v2 = [*(id *)(a1 + 280) view];
    [v2 bounds];
    uint64_t v1 = [(BrowserController *)v1 _shouldShowSidebarForSizeChangeToSize:v4];
  }
  return v1;
}

- (uint64_t)_shouldShowSidebarForSizeChangeToSize:(double)a3
{
  if (result)
  {
    uint64_t v5 = result;
    id v6 = [*(id *)(result + 928) tabThumbnailCollectionView];
    if ([v6 presentationState] == 1)
    {

      return 0;
    }
    uint64_t v7 = [v6 presentationState];

    if (v7 == 2) {
      return 0;
    }
    uint64_t v8 = objc_msgSend((id)v5, "bookmarksPresentationStyleForViewOfSize:", a2, a3);
    if ([*(id *)(v5 + 752) isShowingSidebar])
    {
      if (!v8) {
        return 0;
      }
      if (*(void *)(v5 + 480) == v8) {
        return 1;
      }
      if (v8 != 2) {
        return 0;
      }
      return -[BrowserController shouldShowSidebarInLandscape]((void *)v5);
    }
    else
    {
      if (a2 <= a3) {
        return 0;
      }
      LODWORD(result) = -[BrowserController shouldShowSidebarInLandscape]((void *)v5);
      if (v8 == 2) {
        return result;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (uint64_t)shouldShowSidebarInLandscape
{
  if (!a1 || ([a1 usesNarrowLayout] & 1) != 0) {
    return 0;
  }
  unint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v2 BOOLForKey:@"ShowSidebar"];

  return v1;
}

- (uint64_t)_shouldShowBarsForSizeChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(a1, "viewControllerToPresentFrom", 0, 0);
  unint64_t v2 = [v1 presentedViewController];
  double v3 = [v2 childViewControllers];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v4 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (uint64_t)_shouldHideBarsForSizeChange
{
  uint64_t isVertically = a1;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if ([*(id *)(a1 + 280) isInYttriumMode]) {
      return 0;
    }
    unint64_t v2 = [(id)isVertically viewControllerToPresentFrom];
    double v3 = [v2 presentedViewController];
    uint64_t v4 = [v3 popoverPresentationController];
    uint64_t v5 = [v4 sourceView];

    if (v5)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = objc_msgSend(*(id *)(isVertically + 280), "bars", 0);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v29;
LABEL_7:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          if ([v5 isDescendantOfView:*(void *)(*((void *)&v28 + 1) + 8 * v9)]) {
            goto LABEL_21;
          }
          if (v7 == ++v9)
          {
            uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
            if (v7) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
    }
    uint64_t v5 = [*(id *)(isVertically + 344) activeTabDocument];
    if (([v5 isBlank] & 1) != 0
      || ([v5 hasQuickLookContent] & 1) != 0
      || ([v5 shouldObscureForDigitalHealth] & 1) != 0)
    {
      uint64_t isVertically = 0;
LABEL_23:

      return isVertically;
    }
    long long v10 = [v5 webView];
    id v6 = [v10 scrollView];

    if ([v6 isScrollEnabled])
    {
      [v6 contentSize];
      double v12 = v11;
      [v6 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      [v6 contentInset];
      CGFloat v22 = v16 + v21;
      CGFloat v25 = v18 - (v23 + v24);
      v34.size.double height = v20 - (v21 + v26);
      v34.origin.x = v14 + v23;
      v34.origin.y = v22;
      v34.size.double width = v25;
      if (v12 > CGRectGetHeight(v34) && *(void *)(isVertically + 472) != 1)
      {
        uint64_t isVertically = -[BrowserController _isVerticallyConstrained](isVertically);
        goto LABEL_22;
      }
    }
LABEL_21:
    uint64_t isVertically = 0;
LABEL_22:

    goto LABEL_23;
  }
  return isVertically;
}

- (void)_rootViewControllerViewTransitionFromSize:(uint64_t)a1 includingSidebar:(int)a2 animated:(uint64_t)a3
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 384));
    id v6 = [*(id *)(a1 + 280) view];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;

    if ([(id)a1 isPresentingModalBookmarksController]
      && objc_msgSend((id)a1, "bookmarksPresentationStyleForViewOfSize:", v8, v10)
      && ([*(id *)(a1 + 160) importHandler],
          double v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          !v11))
    {
      [(id)a1 setPresentingModalBookmarksController:0 withExclusiveCollection:0 bookmarkUUIDString:0 animated:a3];
    }
    else if (-[BrowserController _shouldHideCatalogViewControllerForSizeChange]((void *)a1))
    {
      double v12 = objc_alloc_init(CatalogViewControllerState);
      double v13 = *(void **)(a1 + 456);
      *(void *)(a1 + 456) = v12;

      [*(id *)(a1 + 456) setFavoritesState:*(void *)(a1 + 824)];
      double v14 = -[BrowserController _catalogViewController]((id *)a1);
      [v14 beginTransitionToNewSizeClassWithState:*(void *)(a1 + 456)];
      if ([(id)a1 favoritesAreEmbedded])
      {
        [v14 dismissCompletionsForSizeClassTransition];
      }
      else
      {
        [(id)a1 setFavoritesState:0];
        [WeakRetained browserController:a1 setCatalogViewController:0];
      }
    }
    if ((_SFDeviceIsPad() & 1) == 0) {
      [*(id *)(a1 + 184) dismissMenu];
    }
    id v15 = objc_loadWeakRetained((id *)(a1 + 368));
    double v16 = [v15 navigationController];
    double v17 = [v16 presentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [v15 dismissViewControllerAnimated:1 completion:0];
    }
    double v19 = [*(id *)(a1 + 280) view];
    [v19 layoutIfNeeded];

    objc_msgSend((id)a1, "setUsesNarrowLayout:", objc_msgSend((id)a1, "_shouldUseNarrowLayout"));
    double v20 = *MEMORY[0x1E4F1DAD8];
    double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat v22 = *(void **)(a1 + 280);
    double v23 = -[BrowserController tabContentContainerView]((id *)a1);
    [v23 bounds];
    objc_msgSend(v22, "contentContainerViewFrameForBrowserSize:", v24, v25);
    double v27 = v26;
    double v29 = v28;

    long long v30 = *(void **)(a1 + 280);
    long long v31 = [v30 contentContainerView];
    objc_msgSend(v30, "sidebarObscuredInsetsForRect:inCoordinateSpace:", v31, v20, v21, v27, v29);
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    uint64_t v40 = [*(id *)(a1 + 344) activeTabDocument];
    id v41 = [v40 view];
    objc_msgSend(v41, "setFrame:", v20 + v35, v21 + v33, v27 - (v35 + v39), v29 - (v33 + v37));

    if (a2) {
      [*(id *)(a1 + 752) setShowingSidebar:-[BrowserController _shouldShowSidebarForSizeChange](a1) completion:0];
    }
    [(id)a1 updateContinuousPreviewViewFrame];
    [(id)a1 updateDynamicBarGeometry];
    if (-[BrowserController _shouldShowBarsForSizeChange]((void *)a1))
    {
      [(id)a1 showBars];
    }
    else if (-[BrowserController _shouldHideBarsForSizeChange](a1))
    {
      -[BrowserController hideBarsForRotation](a1);
    }
    -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)a1);
    -[BrowserController _updateContinuousReadingViewControllerFrame]((id *)a1);
    [(id)a1 updateExposedScrollViewRect];
    [*(id *)(a1 + 280) updateWebViewSizeAttributes];
    int v42 = *(unsigned __int8 *)(a1 + 709);
    -[BrowserController updateUsesTabBar](a1);
    -[BrowserController _updateUnifiedBar]((id *)a1);
    -[BrowserController _updateTabOverviewBarPlacement](a1);
    [(id)a1 updateCollaborationButton];
    [WeakRetained browserControllerLayOutCatalogView:a1];
    uint64_t v43 = -[BrowserController _catalogViewController]((id *)a1);
    [v43 updatePreferredContentSize];
    [v43 didUpdateObscuredInsetsForSizeTransition];
    BOOL v44 = [v43 view];
    [v44 layoutIfNeeded];

    v45 = -[BrowserController _topNavigationBar]((id *)a1);
    if (v45) {
      [v43 setNavigationBar:v45];
    }

    [v43 updateStartPageTopSpacing];
    -[BrowserController _updateButtonsAnimatingTabBar:](a1, v42 != 0);
    v46 = [*(id *)(a1 + 280) view];
    [v46 layoutMargins];
    double v48 = v47;
    double v50 = v49;
    double v52 = v51;
    double v54 = v53;
    v55 = [*(id *)(a1 + 344) activeTabDocument];
    int v56 = [v55 appBanner];
    objc_msgSend(v56, "setLayoutMargins:", v48, v50, v52, v54);

    -[BrowserController _updateAppInfoOverlayFrame](a1);
    [(id)a1 updateScrollToTopView];
    v57 = [*(id *)(a1 + 280) tabBar];
    v58 = [*(id *)(a1 + 344) activeTabDocument];
    v59 = [v58 tabBarItem];
    [v57 scrollToItem:v59 animated:0];

    if (([(id)a1 _shouldUseNarrowLayout] & 1) == 0
      && [(id)a1 isShowingReader])
    {
      -[BrowserController _contentContainerViewFrameDidChange](a1);
    }
    -[BrowserController _updateDigitalHealthViewFrame]((id *)a1);
    uint64_t v60 = [*(id *)(a1 + 280) contentContainerView];
    [v60 layoutIfNeeded];

    -[BrowserController updateWebViewObscuredInsets](a1);
    -[BrowserController _updateScribbleOverlayIfNeeded]((id *)a1);
  }
}

- (void)hideBarsForRotation
{
  if (a1)
  {
    id v1 = [*(id *)(a1 + 280) dynamicBarAnimator];
    [v1 setMinimumTopBarHeight:-1.79769313e308];
    [v1 attemptTransitionToState:0 animated:0];
  }
}

- (BOOL)_hasPresentedViewController
{
  if (!a1) {
    return 0;
  }
  id v1 = [a1 viewControllerToPresentFrom];
  unint64_t v2 = [v1 presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)rootViewControllerViewWillTransitionToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->_freezeWebViewUpdatesForSizeTransition = 1;
  int v6 = -[BrowserController _shouldShowBookmarksBarForViewSize:]((uint64_t)self, a3.width);
  -[BrowserController _setShowBookmarksBar:]((uint64_t)self, v6);
  self->_isPerformingRootViewControllerSizeTransition = 1;
  id objb = [(BrowserRootViewController *)self->_rootViewController traitCollection];
  self->_rootViewControllerVerticalSizeClassBeforeSizeTransition = [objb verticalSizeClass];

  self->_bookmarksPresentationStyleBeforeSizeTransition = [(BrowserController *)self _bookmarksPresentationStyle];
  obuint64_t j = [(BrowserRootViewController *)self->_rootViewController view];
  [obj bounds];
  BOOL v8 = width != v7;
  if (height != v9) {
    BOOL v8 = 1;
  }
  self->_rootViewWillChangeDimensions = v8;

  queryStringWhilePerformingRootViewControllerSizeTransition = self->_queryStringWhilePerformingRootViewControllerSizeTransition;
  self->_queryStringWhilePerformingRootViewControllerSizeTransition = 0;

  double v11 = [(BrowserRootViewController *)self->_rootViewController catalogViewController];
  id obja = [v11 queryString];

  if ([obja length] && self->_rootViewWillChangeDimensions) {
    objc_storeStrong((id *)&self->_queryStringWhilePerformingRootViewControllerSizeTransition, obja);
  }
  double v12 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  [v12 willUpdateObscuredInsetsForSizeTransition];

  double v13 = [(BrowserRootViewController *)self->_rootViewController contentContainerView];
  [v13 layoutIfNeeded];

  double v14 = [(BrowserRootViewController *)self->_rootViewController view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;

  if (width != v16 || height != v18)
  {
    double v19 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabOverview];
    [v19 endAnimation];
  }
}

- (uint64_t)_shouldShowBookmarksBarForViewSize:(uint64_t)a1
{
  if (!a1 || !_SFDeviceIsPad() || a2 <= *MEMORY[0x1E4F787F8]) {
    return 0;
  }
  return -[BrowserController _prefersShowingBookmarksBar](a1);
}

- (void)rootViewControllerViewTransitionFromSize:(CGSize)a3 includingSidebar:(BOOL)a4 animated:(BOOL)a5
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__BrowserController_rootViewControllerViewTransitionFromSize_includingSidebar_animated___block_invoke;
  v12[3] = &unk_1E6D79170;
  v12[4] = self;
  CGSize v13 = a3;
  BOOL v14 = a4;
  BOOL v15 = a5;
  int v6 = (void *)MEMORY[0x1E4E42950](v12, a2);
  double v7 = [(BrowserRootViewController *)self->_rootViewController view];
  BOOL v8 = [v7 window];
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v9 presentationState] == 1)
  {

LABEL_4:
    goto LABEL_5;
  }
  uint64_t v11 = [v9 presentationState];

  if (v11 != 2)
  {
    self->_isTrackingWebViewAnimatedResize = 1;
    double v10 = [(BrowserController *)self webView];
    [v10 _beginAnimatedResizeWithUpdates:v6];
    goto LABEL_6;
  }
LABEL_5:
  double v10 = [(BrowserController *)self webView];
  [v10 _resizeWhileHidingContentWithUpdates:v6];
LABEL_6:
}

void __88__BrowserController_rootViewControllerViewTransitionFromSize_includingSidebar_animated___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  -[BrowserController _rootViewControllerViewTransitionFromSize:includingSidebar:animated:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 1;
}

- (void)rootViewControllerViewDidTransitionFromSize:(CGSize)a3 animated:(BOOL)a4
{
  if (self->_isTrackingWebViewAnimatedResize)
  {
    self->_isTrackingWebViewAnimatedResize = 0;
    id v9 = [(BrowserController *)self webView];
    [v9 _endAnimatedResize];
  }
  self->_isPerformingRootViewControllerSizeTransition = 0;
  if (self->_statusBarHeightChangedWhilePerformingRootViewControllerSizeTransition)
  {
    -[BrowserController updateViewsAfterStatusBarChange]((id *)&self->super.super.super.isa);
    self->_statusBarHeightChangedWhilePerformingRootViewControllerSizeTransition = 0;
  }
  -[BrowserController _contentContainerViewFrameDidChange]((uint64_t)self);
  -[BrowserController _updateDigitalHealthViewFrame]((id *)&self->super.super.super.isa);
  -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
  id v10 = [(TabController *)self->_tabController activeTabDocument];
  uint64_t v5 = [v10 appBanner];
  [v5 invalidateBannerLayout];

  -[BrowserController _updateAppInfoOverlayFrame]((uint64_t)self);
  [(BrowserRootViewController *)self->_rootViewController layOutTopBars];
  -[BrowserController _updateTabGroupBanner]((id *)&self->super.super.super.isa);
  [(BrowserController *)self updateTabOverviewButton];
  [(BrowserRootViewController *)self->_rootViewController updateWebViewSizeAttributes];
  self->_freezeWebViewUpdatesForSizeTransition = 0;
  catalogViewControllerStateForSizeChange = self->_catalogViewControllerStateForSizeChange;
  if (catalogViewControllerStateForSizeChange)
  {
    [(BrowserController *)self setFavoritesState:[(CatalogViewControllerState *)catalogViewControllerStateForSizeChange favoritesState]];
    -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v11 endTransitionToNewSizeClassWithState:self->_catalogViewControllerStateForSizeChange];
    double v7 = self->_catalogViewControllerStateForSizeChange;
    self->_catalogViewControllerStateForSizeChange = 0;
  }
  if ([(BrowserController *)self favoritesFieldShouldBeExpanded])
  {
    if (self->_queryStringWhilePerformingRootViewControllerSizeTransition)
    {
      id v12 = [(BrowserController *)self unifiedField];
      [v12 setText:self->_queryStringWhilePerformingRootViewControllerSizeTransition];

      queryStringWhilePerformingRootViewControllerSizeTransition = self->_queryStringWhilePerformingRootViewControllerSizeTransition;
      self->_queryStringWhilePerformingRootViewControllerSizeTransition = 0;
    }
    id v13 = [(BrowserController *)self unifiedField];
    [v13 becomeFirstResponder];
  }
  id v14 = [(TabController *)self->_tabController activeTabDocument];
  [v14 webViewDidChangeSize];
}

- (CGSize)windowSize
{
  unint64_t v2 = [(BrowserController *)self viewControllerToPresentFrom];
  BOOL v3 = [v2 view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (TabHoverPreview)tabHoverPreview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  double v4 = [WeakRetained browserControllerTabHoverPreview:self];

  return (TabHoverPreview *)v4;
}

- (UnifiedField)unifiedField
{
  BOOL v3 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  double v4 = [v3 unifiedField];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    double v7 = -[BrowserController _topNavigationBar]((id *)&self->super.super.super.isa);
    id v6 = [v7 textField];
  }
  return (UnifiedField *)v6;
}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "browserController:animateLinkImage:fromRect:inView:toBarItem:", self, a3, v14, a6, x, y, width, height);
  }
}

- (id)_popoverSourceInfoForBarItem:(id *)a1
{
  if (a1)
  {
    BOOL v3 = a1;
    double v4 = [a1[116] tabThumbnailCollectionView];
    if ([v4 presentationState])
    {

      if ((unint64_t)(a2 - 7) < 2)
      {
        double v5 = off_1E6D76130;
LABEL_7:
        a1 = (id *)[objc_alloc(*v5) initWithBrowserController:v3 barItem:a2];
        goto LABEL_8;
      }
    }
    else
    {
    }
    double v5 = off_1E6D756B8;
    goto LABEL_7;
  }
LABEL_8:
  return a1;
}

- (id)_formatMenuButtonPopoverSourceInfo
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v1 = objc_alloc(MEMORY[0x1E4F781E0]);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__BrowserController__formatMenuButtonPopoverSourceInfo__block_invoke;
    v4[3] = &unk_1E6D79198;
    objc_copyWeak(&v5, &location);
    unint64_t v2 = (void *)[v1 initWithSourceInfoProvider:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v2 = 0;
  }
  return v2;
}

id __55__BrowserController__formatMenuButtonPopoverSourceInfo__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = [WeakRetained[35] primaryNavigationBar];
    double v4 = [v3 formatMenuButtonPopoverSourceInfo];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

void __44__BrowserController__updateUsesNarrowLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = [v6 sender];
  id v5 = (id)[WeakRetained showTabGroupPicker:v4];
}

void __45__BrowserController_updateDynamicBarGeometry__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 888));
  BOOL v3 = [WeakRetained statusBarManager];
  objc_msgSend(v3, "defaultStatusBarHeightInOrientation:", objc_msgSend(WeakRetained, "interfaceOrientation"));
  double v5 = v4;

  [*(id *)(a1 + 40) setTopBarHeight:1 forState:*(double *)(a1 + 48)];
  id v6 = *(void **)(a1 + 40);
  int v7 = [*(id *)(a1 + 32) interfaceFillsScreen];
  double v8 = *(void **)(*(void *)(a1 + 32) + 280);
  if (v7)
  {
    id v1 = [v8 view];
    [v1 safeAreaInsets];
    if (v9 <= v5) {
      double v10 = v5;
    }
    else {
      double v10 = v9;
    }
    double v11 = -v10;
  }
  else
  {
    [v8 navigationBarSquishedHeight];
  }
  [v6 setTopBarHeight:0 forState:v11];
  if (v7) {

  }
  [*(id *)(a1 + 40) setBottomBarOffset:1 forState:0.0];
  id v12 = *(void **)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 280) maximumHeightObscuredByBottomToolbar];
  double v14 = v13;
  _SFOnePixel();
  [v12 setBottomBarOffset:0 forState:v14 + v15];
  double v16 = *(id **)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  [v16[35] offsetForDynamicBarAnimator];
  objc_msgSend(v16, "dynamicBarAnimator:minimumTopBarHeightForOffset:", v17);
  objc_msgSend(*(id *)(a1 + 40), "setMinimumTopBarHeight:");
}

- (double)dynamicBarAnimator:(id)a3 minimumTopBarHeightForOffset:(double)a4
{
  [(BrowserRootViewController *)self->_rootViewController navigationBarDesiredHeight];
  double v7 = v6;
  if ([(BrowserRootViewController *)self->_rootViewController toolbarPlacement] != 1
    && ![(BrowserController *)self isShowingFavorites]
    && !self->_disableBarHiding)
  {
    if ([(BrowserRootViewController *)self->_rootViewController keepBarsMinimized])
    {
      return -9999.0;
    }
    else if ([(BrowserRootViewController *)self->_rootViewController isInYttriumMode])
    {
      return -1.79769313e308;
    }
    else
    {
      [(UIScrollView *)self->_scrollView contentInset];
      return v7 - v8 - a4;
    }
  }
  return v7;
}

- (BOOL)dynamicBarAnimator:(id)a3 canTransitionToState:(int64_t)a4 byDraggingWithOffset:(double)a5
{
  id v9 = a3;
  if (a4 == 1)
  {
    char v5 = ![(BrowserRootViewController *)self->_rootViewController keepBarsMinimized];
  }
  else if (!a4)
  {
    if ([(BrowserRootViewController *)self->_rootViewController isInteractivelyMinimizingBars])
    {
      char v5 = 1;
    }
    else
    {
      [(UIScrollView *)self->_scrollView contentSize];
      double v11 = v10;
      [(UIScrollView *)self->_scrollView contentInset];
      double v13 = v12;
      [(UIScrollView *)self->_scrollView bounds];
      double MaxY = CGRectGetMaxY(v17);
      [(BrowserRootViewController *)self->_rootViewController maximumHeightObscuredByBottomToolbar];
      char v5 = v11 + v13 - MaxY - a5 > v15;
    }
  }

  return v5 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_tabViewPinchRecognizer == a3)
  {
    id v8 = [(UIScrollView *)self->_scrollView panGestureRecognizer];
    if (v8 == v6)
    {
      char v7 = 1;
      double v10 = v6;
    }
    else
    {
      id v9 = [(UIScrollView *)self->_scrollView pinchGestureRecognizer];

      if (v9 == v6)
      {
        char v7 = 1;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_2;
      }
      double v10 = [v6 view];
      double v11 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
      double v12 = [v11 view];
      char v7 = [v10 isDescendantOfView:v12];
    }
    goto LABEL_10;
  }
LABEL_2:
  char v7 = 0;
LABEL_10:

  return v7;
}

- (void)updateSearchEngineIfNeeded
{
  if ((-[BrowserController updateSearchEngineIfNeeded]::didInit & 1) == 0) {
    -[BrowserController updateSearchEngineIfNeeded]::didInit = 1;
  }
}

- (void)_ABGroupIdentifierDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = +[Application sharedApplication];
  double v4 = [v3 allProcessPools];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        +[BrowserController _sendABGroupIdentifierToProcessPool:]((uint64_t)BrowserController, *(void **)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

+ (void)_sendABTestingEnabledStateToProcessPool:(uint64_t)a1
{
  id v4 = a2;
  self;
  uint64_t v2 = [MEMORY[0x1E4F97EA0] defaultSearchEngineMatchesExperiment];
  BOOL v3 = [MEMORY[0x1E4F28ED0] numberWithBool:v2];
  [v4 _setObject:v3 forBundleParameter:*MEMORY[0x1E4F997B0]];
}

- (void)_trialABGroupIdentifierDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = +[Application sharedApplication];
  id v4 = [v3 allProcessPools];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        +[BrowserController _sendABGroupIdentifierToProcessPool:]((uint64_t)BrowserController, v8);
        +[BrowserController _sendABTestingEnabledStateToProcessPool:]((uint64_t)BrowserController, v8);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_tabViewPinch:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained handleTabViewPinchForBrowserController:self];
}

- (void)handleTabViewPinch
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_tabViewPinchRecognizer;
  [(UIPinchGestureRecognizer *)v3 scale];
  double v5 = v4;
  double v6 = fabs(v4);
  if (v6 < 0.0001 || v6 == INFINITY)
  {
    [(UIPinchGestureRecognizer *)v3 locationInView:0];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    long long v12 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v31.double x = v9;
      v31.double y = v11;
      double v23 = NSStringFromCGPoint(v31);
      int v24 = 134218498;
      double v25 = v5;
      __int16 v26 = 2112;
      double v27 = v23;
      __int16 v28 = 2112;
      double v29 = v3;
      _os_log_fault_impl(&dword_1E102C000, v12, OS_LOG_TYPE_FAULT, "Unexpected scale in _tabViewPinch: scale=%f; locationInWindow=%@; gesture=%@",
        (uint8_t *)&v24,
        0x20u);
    }
  }
  double v13 = 99.0;
  if (v5 <= 99.0) {
    double v13 = v5;
  }
  if (v13 >= 0.0001) {
    double v14 = v13;
  }
  else {
    double v14 = 0.0001;
  }
  double v15 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabOverview];
  double v16 = v15;
  if (v14 >= 1.0)
  {
    id v18 = v15;
    BOOL v17 = [v18 presentationState] == 1 || objc_msgSend(v18, "presentationState") == 2;
  }
  else
  {
    BOOL v17 = 1;
  }
  uint64_t v19 = [(UIPinchGestureRecognizer *)v3 state];
  if ((unint64_t)(v19 - 1) < 2)
  {
    if (v17)
    {
      if (!self->_tabViewPinchActive)
      {
        [(UIPinchGestureRecognizer *)v3 locationInView:v16];
        objc_msgSend(v16, "beginInteractivePresentationWithOffset:scale:");
        self->_tabViewPinchActive = 1;
        goto LABEL_35;
      }
    }
    else if (!self->_tabViewPinchActive)
    {
      goto LABEL_35;
    }
    [(UIPinchGestureRecognizer *)v3 locationInView:v16];
    objc_msgSend(v16, "updateInteractivePresentationWithOffset:scale:");
    goto LABEL_35;
  }
  if (v19 == 3)
  {
    if (self->_tabViewPinchActive)
    {
      [v16 endInteractivePresentation];
      self->_tabViewPinchActive = 0;
      id v20 = v16;
      if ([v20 presentationState] == 1)
      {
      }
      else
      {
        BOOL v21 = [v20 presentationState] == 2;

        if (!v21) {
          goto LABEL_35;
        }
      }
      CGFloat v22 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v22 didEnterTabViewWithMethod:1];
    }
  }
  else if (v19 == 4 && self->_tabViewPinchActive)
  {
    [v16 cancelInteractivePresentation];
    self->_tabViewPinchActive = 0;
  }
LABEL_35:
}

- (void)_updateScrollOffsetForReplacementWebView:(id *)a1
{
  id v6 = a2;
  if (a1)
  {
    BOOL v3 = [a1[35] dynamicBarAnimator];
    [v3 attemptTransitionToState:1 animated:0];

    double v4 = -[BrowserController tabContentContainerView](a1);
    [a1[35] navigationBarFrameInCoordinateSpace:v4];
    CGRectGetMaxY(v8);
    [v4 frame];
    CGRectGetMinY(v9);
    double v5 = [v6 scrollView];
    [v5 contentOffset];
    objc_msgSend(v5, "setContentOffset:");
  }
}

- (UIEdgeInsets)finalObscuredInsetsForScrollView:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  -[BrowserController scrollViewWillEndDragging:withVelocity:targetContentOffset:](self, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
  [(BrowserRootViewController *)self->_rootViewController obscuredScrollViewInsetsConsideringTargetState:1 insetsDueToSafeArea:0];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (uint64_t)_notFocusedEmbeddedState
{
  if (!a1) {
    return 0;
  }
  id v1 = -[BrowserController _catalogViewController](a1);
  if ([v1 isShowingCompletions]) {
    uint64_t v2 = 5;
  }
  else {
    uint64_t v2 = 4;
  }

  return v2;
}

- (void)setFavoritesAreEmbedded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(BrowserController *)self favoritesAreEmbedded] != a3)
  {
    if ([(BrowserController *)self isFavoritesFieldFocused])
    {
      if (v5) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 1;
      }
    }
    else if (v5)
    {
      uint64_t v7 = -[BrowserController _notFocusedEmbeddedState]((id *)&self->super.super.super.isa);
    }
    else
    {
      uint64_t v7 = 0;
    }
    [(BrowserController *)self setFavoritesState:v7 animated:v4];
  }
}

- (void)setFavoritesFieldFocused:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setFavoritesFieldFocused:(BOOL)a3 forVoiceSearch:(BOOL)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  double v15 = (void (**)(void))a6;
  if ([(BrowserController *)self isFavoritesFieldFocused] == v8)
  {
    if (v15) {
      v15[2]();
    }
  }
  else
  {
    if ([(BrowserController *)self favoritesAreEmbedded])
    {
      if (v8) {
        uint64_t v10 = 3;
      }
      else {
        uint64_t v10 = -[BrowserController _notFocusedEmbeddedState]((id *)&self->super.super.super.isa);
      }
    }
    else if (v8)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 2;
    }
    [(BrowserController *)self setFavoritesState:v10 forVoiceSearch:v7 animated:v6 completionHandler:v15];
    double v11 = +[Application sharedApplication];
    if ((([v11 isRunningPPT] | !v8) & 1) == 0
      && !v7
      && !+[UniversalSearchFirstTimeExperienceViewController hasShownParsecFirstTimeUserExperience])
    {
      double v12 = +[WBSParsecDSession sharedPARSession];
      double v13 = [v12 bag];
      int v14 = [v13 isEnabled];

      if (!v14) {
        goto LABEL_17;
      }
      double v11 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
      [v11 showUniversalSearchFirstTimeExperienceIfNotShowing];
    }
  }
LABEL_17:
}

- (void)cancelFavorites
{
}

- (void)cancelFavoritesAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BrowserController *)self favoritesAreEmbedded])
  {
    if ([(BrowserController *)self favoritesState] == 3 && self->_shouldKeepKeyboardFocused)
    {
      BOOL v5 = self;
      uint64_t v6 = 3;
    }
    else
    {
      BOOL v5 = self;
      uint64_t v6 = 4;
    }
  }
  else
  {
    BOOL v5 = self;
    uint64_t v6 = 0;
  }
  [(BrowserController *)v5 setFavoritesState:v6 animated:v3];
}

- (void)_bookmarksDidReload:(id)a3
{
  if (!self->_favoritesState) {
    [(BrowserController *)self updateFavoritesForNewDocument];
  }
}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  id v7 = a4;
  BOOL v5 = [(TabController *)self->_tabController activeTabGroupUUID];
  char v6 = WBSIsEqual();

  if (v6) {
    -[BrowserController _updateTabGroupBanner]((id *)&self->super.super.super.isa);
  }
}

- (void)participants:(id)a3 didJoinSharedTabGroupWithUUID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(TabController *)self->_tabController activeTabGroup];
  BOOL v8 = [v7 uuid];
  char v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F782A0]);
    double v11 = [v19 anyObject];
    double v12 = objc_msgSend(v11, "safari_contact");
    double v13 = (void *)[v10 initWithContact:v12];

    int v14 = NSString;
    double v15 = _WBSLocalizedString();
    double v16 = [v7 title];
    double v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);
    [v13 setMessageText:v17];

    double v18 = (void *)[objc_alloc(MEMORY[0x1E4F78478]) initWithContentViewController:v13];
    [v18 setDelegate:self];
    -[BrowserController _presentToastViewControllerQueuingIfNecessary:]((uint64_t)self, v18);
  }
}

- (void)_presentToastViewControllerQueuingIfNecessary:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 552)) {
      [*(id *)(a1 + 560) addObject:v3];
    }
    else {
      -[BrowserController _actuallyPresentToastViewController:](a1, v3);
    }
  }
}

- (void)participants:(id)a3 didLeaveSharedTabGroupWithUUID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [(TabController *)self->_tabController activeTabGroup];
  BOOL v8 = [v7 uuid];
  char v9 = [v6 isEqual:v8];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F782A0]);
    double v11 = [v19 anyObject];
    double v12 = objc_msgSend(v11, "safari_contact");
    double v13 = (void *)[v10 initWithContact:v12];

    int v14 = NSString;
    double v15 = _WBSLocalizedString();
    double v16 = [v7 title];
    double v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);
    [v13 setMessageText:v17];

    double v18 = (void *)[objc_alloc(MEMORY[0x1E4F78478]) initWithContentViewController:v13];
    [v18 setDelegate:self];
    -[BrowserController _presentToastViewControllerQueuingIfNecessary:]((uint64_t)self, v18);
  }
}

- (void)tabGroupManager:(id)a3 didUpadateActiveParticipants:(id)a4 inTabGroupWithUUID:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if ([(NSMapTable *)self->_cachedParticipantLists count])
  {
    char v9 = [(TabController *)self->_tabController activeTabGroup];
    id v10 = [v9 uuid];
    char v11 = [v8 isEqual:v10];

    if (v11)
    {
      double v12 = [v7 allObjects];
      double v13 = objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_130);

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      int v14 = [(NSMapTable *)self->_cachedParticipantLists objectEnumerator];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v32;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * v17++) setContacts:v13];
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v15);
      }

      double v18 = [(_SFBarManager *)self->_barManager collaborationButton];
      -[BrowserController _updateParticipantsListForCollaborationButton:contacts:]((id *)&self->super.super.super.isa, v18, v13);

      id v19 = [(TabController *)self->_tabController tabOverviewCollaborationButton];
      -[BrowserController _updateParticipantsListForCollaborationButton:contacts:]((id *)&self->super.super.super.isa, v19, v13);

      double v20 = [(BannerController *)self->_bannerController tabGroupBanner];
      double v21 = [v20 collaborationButton];
      -[BrowserController _updateParticipantsListForCollaborationButton:contacts:]((id *)&self->super.super.super.isa, v21, v13);

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      CGFloat v22 = -[TabController cachedTabSwitcherShareConfigurationForTabGroup:](self->_tabController, "cachedTabSwitcherShareConfigurationForTabGroup:", v9, 0);
      double v23 = [v22 allCollaborationButtons];

      uint64_t v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v28;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v28 != v25) {
              objc_enumerationMutation(v23);
            }
            -[BrowserController _updateParticipantsListForCollaborationButton:contacts:]((id *)&self->super.super.super.isa, *(void **)(*((void *)&v27 + 1) + 8 * v26++), v13);
          }
          while (v24 != v26);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v24);
      }
    }
  }
}

id __85__BrowserController_tabGroupManager_didUpadateActiveParticipants_inTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "safari_contact");
  return v2;
}

- (void)_updateParticipantsListForCollaborationButton:(void *)a3 contacts:
{
  id v7 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = -[BrowserController _participantsListForCollaborationView:](a1, v7);
    [v7 setDetailViewListContent:v6];
    [v6 setContacts:v5];
  }
}

- (void)_actuallyPresentToastViewController:(uint64_t)a1
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 552), a2);
    [*(id *)(a1 + 280) addToastViewController:v4];
    id v5 = [v4 view];
    [v5 layoutIfNeeded];

    int v6 = [*(id *)(a1 + 280) usingUnifiedBar];
    id v7 = *(void **)(a1 + 280);
    if (v6)
    {
      id v8 = [v7 unifiedBar];
      char v9 = [v8 bottomAnchor];
      id v10 = [v8 centerXAnchor];
    }
    else
    {
      if (![v7 usingLoweredBar])
      {
        char v9 = 0;
        id v10 = 0;
        goto LABEL_9;
      }
      char v11 = [*(id *)(a1 + 280) view];
      id v8 = [v11 safeAreaLayoutGuide];

      id v10 = [v8 centerXAnchor];
      double v12 = [*(id *)(a1 + 280) capsuleCollectionViewLayout];
      uint64_t v13 = [v12 integerValue];

      if (v13 == 2)
      {
        int v14 = [*(id *)(a1 + 280) topBackdrop];
        char v9 = [v14 bottomAnchor];
      }
      else
      {
        char v9 = [v8 topAnchor];
      }
    }

LABEL_9:
    uint64_t v15 = [v4 view];
    uint64_t v16 = [v15 topAnchor];
    uint64_t v17 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v9, -[BrowserController _offsetToPositionToastViewControllerOffscreen:](a1, v4));
    double v18 = *(void **)(a1 + 568);
    *(void *)(a1 + 568) = v17;

    id v19 = (void *)MEMORY[0x1E4F28DC8];
    v26[0] = *(void *)(a1 + 568);
    double v20 = [v4 view];
    double v21 = [v20 centerXAnchor];
    CGFloat v22 = [v21 constraintEqualToAnchor:v10];
    v26[1] = v22;
    double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    [v19 activateConstraints:v23];

    uint64_t v24 = [*(id *)(a1 + 280) view];
    [v24 layoutIfNeeded];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __57__BrowserController__actuallyPresentToastViewController___block_invoke;
    v25[3] = &unk_1E6D79060;
    v25[4] = a1;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithDampingRatio:1 response:v25 tracking:0 dampingRatioSmoothing:0.9 responseSmoothing:0.6 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.99];
  }
}

- (double)_offsetToPositionToastViewControllerOffscreen:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 view];
    [v5 frame];
    double v7 = v6;

    id v8 = [*(id *)(a1 + 280) capsuleCollectionViewLayout];
    uint64_t v9 = [v8 integerValue];

    id v10 = *(void **)(a1 + 280);
    if (v9 == 1)
    {
      char v11 = [v10 view];
      [v11 safeAreaInsets];
      double v13 = -v12;
    }
    else
    {
      int v14 = [v10 usingUnifiedBar];
      uint64_t v15 = *(void **)(a1 + 280);
      if (v14) {
        [v15 unifiedBar];
      }
      else {
      uint64_t v16 = [v15 topBackdrop];
      }
      [v16 frame];
      double v18 = v17;
      double v20 = v19;

      double v13 = -v20 - v18;
    }
    double v21 = v13 - v7;
  }
  else
  {
    double v21 = 0.0;
  }

  return v21;
}

void __57__BrowserController__actuallyPresentToastViewController___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 568) setConstant:12.0];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 280) view];
  [v2 layoutIfNeeded];
}

- (void)didAddTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a6;
  char v11 = NSString;
  double v12 = _WBSLocalizedString();
  double v13 = objc_msgSend(v11, "stringWithFormat:", v12, v14);
  -[BrowserController _presentAttributedSharedTabNoticeWithMessage:forParticipantWithRecordID:inSharedTabGroupWithUUID:]((uint64_t)self, v13, v10, v9);
}

- (void)_presentAttributedSharedTabNoticeWithMessage:(void *)a3 forParticipantWithRecordID:(void *)a4 inSharedTabGroupWithUUID:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = [*(id *)(a1 + 344) activeTabGroup];
    char v11 = [v10 uuid];
    char v12 = [v9 isEqual:v11];

    if (v12)
    {
      double v13 = *(void **)(a1 + 776);
      id v14 = [*(id *)(a1 + 344) activeTabGroup];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __118__BrowserController__presentAttributedSharedTabNoticeWithMessage_forParticipantWithRecordID_inSharedTabGroupWithUUID___block_invoke;
      v15[3] = &unk_1E6D792D0;
      id v16 = v8;
      id v17 = v7;
      uint64_t v18 = a1;
      [v13 shareRecordForTabGroup:v14 completionHandler:v15];
    }
  }
}

- (void)didNavigateInTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = [(TabController *)self->_tabController activeTabDocument];
  id v14 = [v13 uuid];
  uint64_t v15 = [v14 UUIDString];
  int v16 = [v15 isEqualToString:v20];

  if (v16)
  {
    id v17 = NSString;
    uint64_t v18 = _WBSLocalizedString();
    double v19 = objc_msgSend(v17, "stringWithFormat:", v18, v10);
    -[BrowserController _presentAttributedSharedTabNoticeWithMessage:forParticipantWithRecordID:inSharedTabGroupWithUUID:]((uint64_t)self, v19, v12, v11);
  }
}

- (void)didRemoveTabWithUUID:(id)a3 title:(id)a4 inSharedTabGroupWithUUID:(id)a5 byParticipantWithRecordID:(id)a6
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a6;
  id v11 = NSString;
  id v12 = _WBSLocalizedString();
  double v13 = objc_msgSend(v11, "stringWithFormat:", v12, v14);
  -[BrowserController _presentAttributedSharedTabNoticeWithMessage:forParticipantWithRecordID:inSharedTabGroupWithUUID:]((uint64_t)self, v13, v10, v9);
}

- (void)didChangeScopedFavoritesInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = _WBSLocalizedString();
  -[BrowserController _presentAttributedSharedTabNoticeWithMessage:forParticipantWithRecordID:inSharedTabGroupWithUUID:]((uint64_t)self, v7, v6, v8);
}

- (void)didChangeBackgroundImageInSharedTabGroupWithUUID:(id)a3 byParticipantWithRecordID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = _WBSLocalizedString();
  -[BrowserController _presentAttributedSharedTabNoticeWithMessage:forParticipantWithRecordID:inSharedTabGroupWithUUID:]((uint64_t)self, v7, v6, v8);
}

void __118__BrowserController__presentAttributedSharedTabNoticeWithMessage_forParticipantWithRecordID_inSharedTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __118__BrowserController__presentAttributedSharedTabNoticeWithMessage_forParticipantWithRecordID_inSharedTabGroupWithUUID___block_invoke_2;
  v7[3] = &unk_1E6D79148;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __118__BrowserController__presentAttributedSharedTabNoticeWithMessage_forParticipantWithRecordID_inSharedTabGroupWithUUID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) participants];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __118__BrowserController__presentAttributedSharedTabNoticeWithMessage_forParticipantWithRecordID_inSharedTabGroupWithUUID___block_invoke_3;
  v10[3] = &unk_1E6D792A8;
  id v11 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "safari_firstObjectPassingTest:", v10);

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) currentUserParticipant];
    char v5 = [v3 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F782A0]);
      id v7 = objc_msgSend(v3, "safari_contact");
      id v8 = (void *)[v6 initWithContact:v7];

      [v8 setMessageText:*(void *)(a1 + 48)];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F78478]) initWithContentViewController:v8];
      [v9 setDelegate:*(void *)(a1 + 56)];
      -[BrowserController _presentToastViewControllerQueuingIfNecessary:](*(void *)(a1 + 56), v9);
    }
  }
}

uint64_t __118__BrowserController__presentAttributedSharedTabNoticeWithMessage_forParticipantWithRecordID_inSharedTabGroupWithUUID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 userIdentity];
  id v4 = [v3 userRecordID];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

- (void)dismissToastViewController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__BrowserController_dismissToastViewController___block_invoke;
  v9[3] = &unk_1E6D791E8;
  void v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BrowserController_dismissToastViewController___block_invoke_2;
  v7[3] = &unk_1E6D792F8;
  void v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [v5 _animateUsingSpringWithDampingRatio:1 response:v9 tracking:v7 dampingRatioSmoothing:0.9 responseSmoothing:0.6 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.99];
}

void __48__BrowserController_dismissToastViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 568), "setConstant:", -[BrowserController _offsetToPositionToastViewControllerOffscreen:](*(void *)(a1 + 32), *(void **)(a1 + 40)));
  id v2 = [*(id *)(*(void *)(a1 + 32) + 280) view];
  [v2 layoutIfNeeded];
}

void __48__BrowserController_dismissToastViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 280) removeToastViewController:*(void *)(a1 + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 560) count])
  {
    dispatch_time_t v2 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__BrowserController_dismissToastViewController___block_invoke_3;
    block[3] = &unk_1E6D79060;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 552);
    *(void *)(v3 + 552) = 0;
  }
}

void __48__BrowserController_dismissToastViewController___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 560) firstObject];
  [*(id *)(*(void *)(a1 + 32) + 560) removeObjectAtIndex:0];
  -[BrowserController _actuallyPresentToastViewController:](*(void *)(a1 + 32), v2);
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  uint64_t v3 = [(TabController *)self->_tabController activeTabGroup];
  id v4 = [v3 title];

  return v4;
}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[BrowserController cloudSharingController:failedToSaveShareWithError:]();
  }
}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
}

- (void)setFavoritesState:(int64_t)a3
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_2(uint64_t a1)
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80)) {
    [*(id *)(a1 + 32) stopCompleting];
  }
  if (!*(void *)(*(void *)(a1 + 40) + 824))
  {
    [*(id *)(a1 + 56) removeFromSuperview];
    [*(id *)(a1 + 32) setNavigationBar:0];
    [*(id *)(a1 + 64) resignFirstResponder];
    id v2 = -[BrowserController _catalogViewController](*(id **)(a1 + 40));
    uint64_t v3 = *(void **)(a1 + 32);

    if (v2 == v3)
    {
      [*(id *)(a1 + 72) browserController:*(void *)(a1 + 40) setCatalogViewController:0];
      -[BrowserController _updateCurrentPageBannerViewIfNeeded](*(id **)(a1 + 40));
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      id v6 = [*(id *)(v4 + 344) activeTabDocument];
      id v7 = objc_msgSend(v5, "setWithObjects:", v6, 0);
      -[BrowserController _updateDigitalHealthOverlayForTabDocuments:]((void *)v4, v7);
    }
  }
  id v8 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v8);
}

uint64_t __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_8(uint64_t a1)
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_10(uint64_t a1)
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_11(uint64_t a1)
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_12(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_13;
  v3[3] = &unk_1E6D79060;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 setExpanded:v1 completionHandler:v3];
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_13(uint64_t a1)
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_14(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64) && [*(id *)(a1 + 32) isFavoritesFieldFocused])
  {
    if (*(unsigned char *)(a1 + 65))
    {
      id v2 = -[BrowserController _catalogViewController](*(id **)(a1 + 32));
      [v2 toggleVoiceSearch];
    }
    else
    {
      [*(id *)(a1 + 40) becomeFirstResponder];
    }
  }
  if (!*(unsigned char *)(a1 + 66) && [*(id *)(a1 + 32) isShowingFavorites])
  {
    [*(id *)(a1 + 48) layoutBelowIfNeeded];
    [*(id *)(a1 + 48) setAlpha:0.0];
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
    uint64_t v3 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_15;
    v10[3] = &unk_1E6D79060;
    id v11 = *(id *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_16;
    v8[3] = &unk_1E6D793E8;
    id v9 = *(id *)(a1 + 56);
    [v3 animateWithDuration:327682 delay:v10 options:v8 animations:0.2 completion:0.0];
    if (([*(id *)(a1 + 32) favoritesAreShowingInPopover] & 1) == 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
      id v4 = (void *)MEMORY[0x1E4FB1EB0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_17;
      v7[3] = &unk_1E6D79060;
      void v7[4] = *(void *)(a1 + 32);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      id v5[2] = __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_18;
      v5[3] = &unk_1E6D793E8;
      id v6 = *(id *)(a1 + 56);
      [v4 animateWithDuration:327680 delay:v7 options:v5 animations:0.2 completion:0.1];
    }
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

      return;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_15(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_16(uint64_t a1)
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_17(uint64_t a1)
{
}

void __81__BrowserController_setFavoritesState_forVoiceSearch_animated_completionHandler___block_invoke_18(uint64_t a1)
{
}

- (void)unifiedTabBarActiveTabWasTapped
{
}

- (void)_focusNavigationBarWithCompletionHandler:(unsigned char *)a1
{
  id v3 = a2;
  if (a1) {
    -[BrowserController _focusNavigationBarForVoiceSearch:completionHandler:](a1, 0, v3);
  }
}

- (void)toggleVoiceSearch
{
  if ([(BrowserController *)self isFavoritesFieldFocused]
    || ([(BrowserRootViewController *)self->_rootViewController capsuleViewController],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        [v6 capsuleCollectionView],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 selectedItemState],
        v3,
        v6,
        v4 == 2))
  {
    -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 toggleVoiceSearch];
LABEL_4:

    return;
  }
  id v8 = [MEMORY[0x1E4F78500] sharedManager];
  char v5 = [v8 presentDictationDiscoveryAlertIfNeeded];

  if (v5) {
    return;
  }
  if ([(BrowserRootViewController *)self->_rootViewController usingLoweredBar])
  {
    id v7 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
    [v7 transitionToState:2 options:1 animated:1 completionHandler:0];
    goto LABEL_4;
  }
  -[BrowserController _focusNavigationBarForVoiceSearch:completionHandler:](self, 1, 0);
}

- (void)_focusNavigationBarForVoiceSearch:(void *)a3 completionHandler:
{
  char v5 = a3;
  id v6 = v5;
  if (a1)
  {
    if (a1[715])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__BrowserController__focusNavigationBarForVoiceSearch_completionHandler___block_invoke;
      v7[3] = &unk_1E6D79320;
      id v8 = v5;
      [a1 setFavoritesFieldFocused:1 forVoiceSearch:a2 animated:1 completionHandler:v7];
    }
    else if (v5)
    {
      v5[2](v5);
    }
  }
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
}

- (void)prepareForTabDocumentWebViewFullscreenMayReturnToInline:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self->_tabController activeTabDocument];

  if (v5 == v4)
  {
    id v8 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    [(BrowserController *)v8 dismissAnimated:1];
LABEL_12:

    goto LABEL_13;
  }
  if ([(BrowserController *)self isPrivateBrowsingEnabled]
    || ![v4 isPrivateBrowsingEnabled]
    || (+[Application sharedApplication],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isPrivateBrowsingLocked],
        v6,
        (v7 & 1) == 0))
  {
    id v8 = self;
    v17[0] = v8;
    id v9 = v4;
    v17[1] = v9;
    id v10 = [(TabCollectionViewProviding *)v8->_tabCollectionViewProvider tabThumbnailCollectionView];
    if ([v10 presentationState] == 1)
    {
    }
    else
    {
      uint64_t v11 = [v10 presentationState];

      if (v11 != 2)
      {
        id v12 = (void *)MEMORY[0x1E4FB1EB0];
        double v13 = [(BrowserRootViewController *)v8->_rootViewController view];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3321888768;
        v14[2] = __77__BrowserController_prepareForTabDocumentWebViewFullscreenMayReturnToInline___block_invoke;
        v14[3] = &__block_descriptor_48_ea8_32c89_ZTSZ77__BrowserController_prepareForTabDocumentWebViewFullscreenMayReturnToInline__E3__0_e5_v8__0l;
        uint64_t v15 = v8;
        id v16 = v9;
        [v12 transitionWithView:v13 duration:5242880 options:v14 animations:0 completion:0.2];

        goto LABEL_11;
      }
    }
    -[BrowserController prepareForTabDocumentWebViewFullscreenMayReturnToInline:]::$_0::operator()(v17, 1);
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
}

- (void)prepareForTabDocumentWebViewFullscreenMayReturnToInline:
{
  id v4 = [a1[1] tabGroupTab];
  id v8 = [v4 tabGroupUUID];

  id v5 = [*((id *)*a1 + 43) activeTabGroupUUID];
  char v6 = WBSIsEqual();

  if ((v6 & 1) == 0) {
    [*((id *)*a1 + 43) setActiveTabGroupUUID:v8];
  }
  [*((id *)*a1 + 43) setActiveTabDocument:a1[1] animated:a2];
  char v7 = [*((id *)*a1 + 116) tabThumbnailCollectionView];
  [v7 dismissAnimated:a2];
}

void __77__BrowserController_prepareForTabDocumentWebViewFullscreenMayReturnToInline___block_invoke(uint64_t a1)
{
}

- (void)_didChangePowerState
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  char v4 = [v3 isLowPowerModeEnabled];

  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__BrowserController__didChangePowerState__block_invoke;
    block[3] = &unk_1E6D79060;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __41__BrowserController__didChangePowerState__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 904) isLoading]) {
    [*(id *)(a1 + 32) clearSpeculativeLoadDocument];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 224) isLoading]) {
    -[BrowserController _clearPreviousContinuousItemDocument](*(void *)(a1 + 32));
  }
  if ([*(id *)(*(void *)(a1 + 32) + 176) isLoading])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    -[BrowserController _clearNextContinuousItemDocument](v2);
  }
}

- (void)_clearPreviousContinuousItemDocument
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 224);
    if (v2)
    {
      -[BrowserController _cancelSpeculativeLoadForDocument:](a1, v2);
      id v4 = [*(id *)(a1 + 88) previousItemPreviewView];
      [v4 replaceContentViewWithItsSnapshot];
      [v4 setContentView:0];
      [v4 setPrefetchingDisabled:1];
      -[BrowserController _closeSpeculativelyLoadedDocument:](a1, *(void **)(a1 + 224));
      id v3 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = 0;
    }
  }
}

- (void)_clearNextContinuousItemDocument
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 176);
    if (v2)
    {
      -[BrowserController _cancelSpeculativeLoadForDocument:](a1, v2);
      id v4 = [*(id *)(a1 + 88) previewView];
      [v4 replaceContentViewWithItsSnapshot];
      [v4 setContentView:0];
      [v4 setPrefetchingDisabled:1];
      -[BrowserController _closeSpeculativelyLoadedDocument:](a1, *(void **)(a1 + 176));
      id v3 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = 0;
    }
  }
}

- (void)_completionItem:(void *)a3 wasAcceptedForString:
{
  id v9 = a2;
  id v5 = a3;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v9;
      if ([v6 matchLocation] != 9)
      {
        char v7 = +[History sharedHistory];
        id v8 = [v6 originalURLString];
        [v7 addAutocompleteTrigger:v5 forURLString:v8];
      }
    }
  }
}

- (void)catalogViewController:(id)a3 didSelectSearch:(id)a4
{
  id v5 = a4;
  [(BrowserController *)self clearSpeculativeLoadDocument];
  [(BrowserController *)self clearContinuousItemDocuments];
  -[BrowserController _doSearch:](self, v5);
  [(BrowserController *)self setFavoritesState:0 animated:1];
}

- (void)_doSearch:(void *)a1
{
  id v5 = a2;
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F78598] builder];
    id v4 = [v3 navigationIntentWithSearchText:v5];

    [v4 setProvenance:1];
    [a1 dispatchNavigationIntent:v4];
  }
}

- (int64_t)idOfParsecQueryOriginatingFromSearchSuggestion
{
  searchStateCache = self->_searchStateCache;
  if (!searchStateCache) {
    return 0;
  }
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  int64_t v4 = [(SearchStateCache *)searchStateCache idOfParsecQueryOriginatingFromSearchSuggestionInTabDocument:v3];

  return v4;
}

- (void)clearParsecQueryOriginatingFromSearchSuggestion
{
  searchStateCache = self->_searchStateCache;
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  -[SearchStateCache clearParsecQueryOriginatingFromSearchSuggestionInTabDocument:](searchStateCache, "clearParsecQueryOriginatingFromSearchSuggestionInTabDocument:");
}

- (void)removeCachedSearchStateForActiveTabDocument
{
  searchStateCache = self->_searchStateCache;
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  -[SearchStateCache removeCachedSearchStateForTabDocument:](searchStateCache, "removeCachedSearchStateForTabDocument:");
}

- (void)catalogViewControllerDidSelectFindOnPage:(id)a3
{
  self->_shouldFillStringForFind = 0;
  [(BrowserController *)self setFavoritesState:0 animated:1];
  int64_t v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 showFindOnPage];

  [(BrowserController *)self clearSpeculativeLoadDocument];
  [(BrowserController *)self clearContinuousItemDocuments];
}

- (void)catalogViewController:(id)a3 didSelectAddress:(id)a4
{
  id v5 = a4;
  -[BrowserController _loadAddressAsSpeculativeLoadIfNeeded:](self, v5);
  [(BrowserController *)self setFavoritesState:0 animated:1];
}

- (void)_loadAddressAsSpeculativeLoadIfNeeded:(void *)a1
{
  id v3 = a2;
  id v8 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "_web_isUserVisibleURL") & 1) == 0)
    {
      int64_t v4 = objc_msgSend(v8, "safari_bestURLForUserTypedString");
      uint64_t v5 = objc_msgSend(v4, "safari_userVisibleString");

      id v8 = (id)v5;
    }
    id v6 = [MEMORY[0x1E4F78598] builder];
    char v7 = [v6 navigationIntentWithText:v8];

    [v7 setProvenance:1];
    -[BrowserController _loadIntentAsSpeculativeLoadIfNeeded:](a1, v7);
  }
}

- (void)catalogViewController:(id)a3 loadURL:(id)a4 inExternalApplication:(BOOL)a5 forImageAttribution:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  -[BrowserController _loadURL:inExternalApplication:forImageAttribution:]((uint64_t)self, v10, v7, v6);
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F98E20] sharedRecorder];
    [v9 didActualizeImpressionForURL:v10 provenance:1];
  }
}

- (void)_loadURL:(int)a3 inExternalApplication:(int)a4 forImageAttribution:
{
  id v10 = a2;
  if (a1)
  {
    if (a3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 888));
      [WeakRetained openURL:v10 options:0 completionHandler:0];
      id v8 = WeakRetained;
    }
    else
    {
      [MEMORY[0x1E4F78598] builder];
      if (a4) {
        id v9 = {;
      }
        [v9 navigationIntentWithImageAttributionURL:v10];
      }
      else {
        id v9 = {;
      }
        [v9 navigationIntentWithURL:v10];
      id v8 = };

      [v8 setProvenance:1];
      -[BrowserController _loadIntentAsSpeculativeLoadIfNeeded:]((void *)a1, v8);
      [(id)a1 setFavoritesState:0 animated:1];
    }
  }
}

- (void)_loadIntentAsSpeculativeLoadIfNeeded:(void *)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = v3;
  if (a1)
  {
    if ([v3 policy])
    {
LABEL_3:
      [a1 clearSpeculativeLoadDocument];
      [a1 dispatchNavigationIntent:v4];
      goto LABEL_9;
    }
    uint64_t v5 = [v4 URL];
    BOOL v6 = objc_msgSend(v5, "safari_userVisibleString");
    int v7 = -[BrowserController _commitSpeculativeLoadForURL:]((uint64_t)a1, v6);

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F98E20] sharedRecorder];
      id v9 = [v4 URL];
      objc_msgSend(v8, "didActualizeImpressionForURL:provenance:", v9, objc_msgSend(v4, "provenance"));
    }
    else
    {
      id v10 = [v4 text];
      int v11 = -[BrowserController _commitSpeculativeLoadForURL:]((uint64_t)a1, v10);

      if (!v11)
      {
        id v14 = (id)WBS_LOG_CHANNEL_PREFIXTabs();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = a1[56];
          uint64_t v16 = a1[113];
          id v17 = [v4 URL];
          uint64_t v18 = objc_msgSend(v17, "safari_userVisibleString");
          double v19 = [v4 text];
          int v20 = 138740739;
          uint64_t v21 = v15;
          __int16 v22 = 2117;
          uint64_t v23 = v16;
          __int16 v24 = 2117;
          uint64_t v25 = v18;
          __int16 v26 = 2117;
          long long v27 = v19;
          _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_INFO, "Cached speculative load URL %{sensitive}@ or document %{sensitive}@ doesn't match either expectation %{sensitive}@ or %{sensitive}@", (uint8_t *)&v20, 0x2Au);
        }
        goto LABEL_3;
      }
      id v8 = [MEMORY[0x1E4F98E20] sharedRecorder];
      id v12 = (void *)MEMORY[0x1E4F1CB10];
      id v9 = [v4 text];
      double v13 = [v12 URLWithString:v9];
      objc_msgSend(v8, "didActualizeImpressionForURL:provenance:", v13, objc_msgSend(v4, "provenance"));
    }
  }
LABEL_9:
}

- (void)catalogViewController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  uint64_t v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  int v7 = -[BrowserController _topNavigationBar]((id *)&self->super.super.super.isa);
  id v8 = [v7 URLOutlinePopoverSourceInfo];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  id v10 = _SFContextInfoWithComment();
  _SFPopoverSourceInfoUnwrap();

  *a5 = (id) v12[5];
  _Block_object_dispose(&v11, 8);
}

void __78__BrowserController_catalogViewController_willRepositionPopoverToRect_inView___block_invoke(uint64_t *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  double v12 = -[BrowserController _popoverPresentationVerticalOffset](a1[4]);
  uint64_t v13 = (double *)a1[6];
  *uint64_t v13 = a3;
  v13[1] = a4 + v12;
  v13[2] = a5;
  v13[3] = a6;
  uint64_t v14 = *(void *)(a1[5] + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v11;
}

- (double)_popoverPresentationVerticalOffset
{
  if (!a1) {
    return 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 888));
  uint64_t v2 = [WeakRetained statusBarManager];
  if ([v2 isStatusBarHidden]) {
    double v3 = 7.0;
  }
  else {
    double v3 = 10.0;
  }

  return v3;
}

- (void)catalogViewController:(id)a3 mightSelectCompletionItem:(id)a4 forString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v7, "shouldPrefetchWithMatchLength:", objc_msgSend(v8, "length")))
  {
    id v9 = [v7 userVisibleURLString];
  }
  else
  {
    id v9 = 0;
  }
  objc_initWeak(&location, self);
  id v10 = (void *)MEMORY[0x1E4F1CB00];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__BrowserController_catalogViewController_mightSelectCompletionItem_forString___block_invoke;
  v15[3] = &unk_1E6D794A0;
  objc_copyWeak(&v17, &location);
  id v11 = v9;
  id v16 = v11;
  double v12 = [v10 timerWithTimeInterval:0 repeats:v15 block:0.2];
  lastTimerForDelayingSpeculativelyPreloadingTopHit = self->_lastTimerForDelayingSpeculativelyPreloadingTopHit;
  self->_lastTimerForDelayingSpeculativelyPreloadingTopHit = v12;

  uint64_t v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v14 addTimer:self->_lastTimerForDelayingSpeculativelyPreloadingTopHit forMode:*MEMORY[0x1E4F1C4B0]];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __79__BrowserController_catalogViewController_mightSelectCompletionItem_forString___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v4 = WeakRetained;
  if (WeakRetained && (id)WeakRetained[76] == v6)
  {
    -[BrowserController _updateSpeculativeLoadURL:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
    uint64_t v5 = (void *)v4[76];
    v4[76] = 0;
  }
}

- (void)_updateSpeculativeLoadURL:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 440))
    {
      int64_t v4 = [MEMORY[0x1E4F28F80] processInfo];
      char v5 = [v4 isLowPowerModeEnabled];

      if ((v5 & 1) == 0 && ([*(id *)(a1 + 448) isEqualToString:v3] & 1) == 0)
      {
        id v6 = [(id)a1 tabController];
        id v7 = [v6 activeTabDocument];
        id v8 = [v7 webView];

        if (!v8 || ([v8 _isBeingInspected] & 1) == 0)
        {
          [(id)a1 cancelSpeculativeLoad];
          uint64_t v9 = [v3 copy];
          id v10 = *(void **)(a1 + 448);
          *(void *)(a1 + 448) = v9;

          if (*(void *)(a1 + 448))
          {
            id v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
            if (objc_msgSend(v11, "safari_isHTTPFamilyURL"))
            {
              id v12 = v8;
              uint64_t v13 = *(void **)(a1 + 904);
              if (v13)
              {
                uint64_t v14 = [v13 URL];
                uint64_t v15 = [v14 host];
                id v16 = objc_msgSend(v15, "safari_highLevelDomainFromHost");

                id v17 = [v11 host];
                uint64_t v18 = objc_msgSend(v17, "safari_highLevelDomainFromHost");

                uint64_t v40 = v12;
                if (v18)
                {
                  uint64_t v40 = v12;
                  if (![v18 caseInsensitiveCompare:v16])
                  {
                    double v19 = WBS_LOG_CHANNEL_PREFIXPageLoading();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1E102C000, v19, OS_LOG_TYPE_INFO, "Using the related web view off the speculative load TabDocument", buf, 2u);
                    }
                    uint64_t v40 = [*(id *)(a1 + 904) webView];
                  }
                }

                int v20 = *(void **)(a1 + 904);
              }
              else
              {
                int v20 = 0;
                uint64_t v40 = v12;
              }
              id v22 = v20;
              id v23 = [[TabDocument alloc] initForBackgroundLoadingWithBrowserController:a1 relatedWebView:v40 webViewToCloneSessionStorageFrom:v12];
              __int16 v24 = *(void **)(a1 + 904);
              *(void *)(a1 + 904) = v23;

              [*(id *)(a1 + 904) setShouldKeepIgnoredSiriSuggestedSitesOnLoad:1];
              uint64_t v25 = [(id)a1 unifiedField];
              __int16 v26 = [v25 text];
              BOOL v27 = v26 == 0;

              if (!v27)
              {
                uint64_t v28 = [v25 text];
                long long v29 = [*(id *)(a1 + 904) personalizationData];
                [v29 setSearchQuery:v28];

                long long v30 = [*(id *)(a1 + 904) personalizationData];
                [v30 setPosition:0];
              }
              long long v31 = [*(id *)(a1 + 904) webView];
              [(id)a1 updateInsetsForBackgroundWebView:v31];

              [*(id *)(a1 + 904) setAllowsRemoteInspection:0];
              long long v32 = [*(id *)(a1 + 344) activeTabDocument];
              long long v33 = [v32 sessionState];

              [*(id *)(a1 + 904) restoreSessionState:v33 andNavigate:0];
              long long v34 = [*(id *)(a1 + 904) _backForwardList];
              double v35 = [v34 currentItem];
              objc_storeWeak((id *)(a1 + 40), v35);

              double v36 = googleSearchEngine();
              uint64_t v37 = [v36 urlAttributingToSafariIfValidSearchURL:v11];

              id v11 = (void *)v37;
              double v38 = WBS_LOG_CHANNEL_PREFIXPageLoading();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 141558275;
                uint64_t v42 = 1752392040;
                __int16 v43 = 2117;
                uint64_t v44 = v37;
                _os_log_impl(&dword_1E102C000, v38, OS_LOG_TYPE_INFO, "Speculatively load URL: %{sensitive, mask.hash}@", buf, 0x16u);
              }
              id v39 = (id)[*(id *)(a1 + 904) loadURL:v37 userDriven:1];
              [*(id *)(a1 + 904) beginSuppressingProgressAnimation];
              if (v22) {
                -[BrowserController _closeSpeculativelyLoadedDocument:](a1, v22);
              }
            }
            else
            {
              uint64_t v21 = *(void **)(a1 + 448);
              *(void *)(a1 + 448) = 0;
            }
          }
        }
      }
    }
  }
}

- (void)catalogViewController:(id)a3 completionItem:(id)a4 wasAcceptedForString:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_searchStateCache)
  {
    id v10 = objc_alloc_init(SearchStateCache);
    searchStateCache = self->_searchStateCache;
    self->_searchStateCache = v10;
  }
  if ((unint64_t)[v9 length] >= 2
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v8 restoresSearchState])
  {
    id v12 = self->_searchStateCache;
    uint64_t v13 = [v15 completionList];
    uint64_t v14 = [(TabController *)self->_tabController activeTabDocument];
    [(SearchStateCache *)v12 cacheAcceptanceOfCompletionItem:v8 withCompletionList:v13 forTabDocument:v14];
  }
  else
  {
    [(BrowserController *)self removeCachedSearchStateForActiveTabDocument];
  }
  -[BrowserController _completionItem:wasAcceptedForString:]((uint64_t)self, v8, v9);
}

- (void)catalogViewControllerSuppressSelectedItemUnfocus:(id)a3
{
  id v4 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  id v3 = [v4 capsuleCollectionView];
  [v3 setSuppressesSelectedItemUnfocus:1];
}

- (void)catalogViewController:(id)a3 cacheSearchQueryID:(int64_t)a4
{
  id v10 = a3;
  searchStateCache = self->_searchStateCache;
  if (!searchStateCache)
  {
    id v7 = objc_alloc_init(SearchStateCache);
    id v8 = self->_searchStateCache;
    self->_searchStateCache = v7;

    searchStateCache = self->_searchStateCache;
  }
  id v9 = [(TabController *)self->_tabController activeTabDocument];
  [(SearchStateCache *)searchStateCache cacheSearchQueryID:a4 forTab:v9];
}

- (void)catalogViewControllerDidBeginEditing:(id)a3
{
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 clearFindOnPageMatchesCounter];

  [(BrowserController *)self setFavoritesFieldFocused:1 animated:1];
}

- (void)catalogViewControllerDidEndEditing:(id)a3
{
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 clearFindOnPageMatchesCounter];

  [(BrowserController *)self setFavoritesFieldFocused:0 animated:1];
}

- (void)catalogViewControllerPopoverWillDismiss:(id)a3 dismissalReason:(int64_t)a4
{
  id v7 = a3;
  -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 1);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self catalogViewController:v7 willDismissPopoverWithReason:a4];
  }
  if ((unint64_t)a4 >= 2) {
    [(BrowserController *)self cancelFavorites];
  }
}

- (void)catalogViewController:(id)a3 presentViewControllerWithinPopover:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v8 = a4;
  id v30 = a5;
  id v9 = [(BrowserController *)self viewControllerToPresentFrom];
  id v10 = [v9 presentedViewController];

  if (v10)
  {
    id v11 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [(BrowserController *)self viewControllerToPresentFrom];
      uint64_t v13 = [v12 presentedViewController];
      -[BrowserController catalogViewController:presentViewControllerWithinPopover:completionHandler:].cold.4(v13, (uint64_t)v38, (uint64_t)v11, v12);
    }
  }
  uint64_t v14 = [v8 presentingViewController];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    id v16 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      [v8 presentingViewController];
      objc_claimAutoreleasedReturnValue();
      -[BrowserController catalogViewController:presentViewControllerWithinPopover:completionHandler:]();
    }
  }
  id v17 = [v8 popoverPresentationController];
  [v17 setPermittedArrowDirections:1];
  CGSize v18 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v37.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v37.size = v18;
  id v36 = 0;
  [(BrowserController *)self catalogViewController:v31 willRepositionPopoverToRect:&v37 inView:&v36];
  id v19 = v36;
  int v20 = dispatch_group_create();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __96__BrowserController_catalogViewController_presentViewControllerWithinPopover_completionHandler___block_invoke;
  v34[3] = &unk_1E6D79320;
  id v21 = v30;
  id v35 = v21;
  id v22 = (void (**)(void))MEMORY[0x1E4E42950](v34);
  if (!v19)
  {
    __int16 v24 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BrowserController catalogViewController:presentViewControllerWithinPopover:completionHandler:]();
    }
    goto LABEL_15;
  }
  if (CGRectIsNull(v37))
  {
    id v23 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BrowserController catalogViewController:presentViewControllerWithinPopover:completionHandler:]();
    }
LABEL_15:
    v22[2](v22);
    goto LABEL_19;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self catalogViewController:v31 willPresentViewControllerWithinPopover:v8];
  }
  objc_msgSend(v17, "setSourceRect:", *(_OWORD *)&v37.origin, *(_OWORD *)&v37.size);
  [v17 setSourceView:v19];
  __int16 v26 = -[BrowserController _topNavigationBar]((id *)&self->super.super.super.isa);
  BOOL v27 = [v26 popoverPassthroughViews];
  [v17 setPassthroughViews:v27];

  dispatch_group_enter(v20);
  uint64_t v28 = [(BrowserController *)self viewControllerToPresentFrom];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __96__BrowserController_catalogViewController_presentViewControllerWithinPopover_completionHandler___block_invoke_184;
  v32[3] = &unk_1E6D79060;
  long long v29 = v20;
  long long v33 = v29;
  [v28 presentViewController:v8 animated:0 completion:v32];

  [v17 _setShouldHideArrow:1];
  [v17 _setIgnoresKeyboardNotifications:1];
  -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 1);
  dispatch_group_notify(v29, MEMORY[0x1E4F14428], v22);

LABEL_19:
}

uint64_t __96__BrowserController_catalogViewController_presentViewControllerWithinPopover_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __96__BrowserController_catalogViewController_presentViewControllerWithinPopover_completionHandler___block_invoke_184(uint64_t a1)
{
}

- (void)catalogViewController:(id)a3 focusNextKeyView:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(BrowserController *)self favoritesAreShowingInPopover])
  {
    id v6 = [(TabController *)self->_tabController activeTabDocument];
    id v7 = [v6 frontWebView];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__BrowserController_catalogViewController_focusNextKeyView___block_invoke;
    v8[3] = &unk_1E6D793E8;
    void v8[4] = self;
    [v7 _becomeFirstResponderWithSelectionMovingForward:v4 completionHandler:v8];
  }
}

uint64_t __60__BrowserController_catalogViewController_focusNextKeyView___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) cancelFavoritesAnimated:0];
  }
  return result;
}

- (void)catalogViewControllerMakeWindowKey:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserControllerMakeKey:self];
}

- (BOOL)catalogViewControllerShouldSuppressPopover:(id)a3
{
  id v3 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  BOOL v4 = [v3 presentationState] == 1 || objc_msgSend(v3, "presentationState") == 2;

  return v4;
}

- (void)catalogViewController:(id)a3 didPasteText:(id)a4
{
  id v7 = a4;
  char v5 = [MEMORY[0x1E4F78598] builder];
  id v6 = [v5 navigationIntentWithText:v7];
  [(BrowserController *)self dispatchNavigationIntent:v6];
}

- (void)dismissCatalogViewController:(id)a3
{
  if ([(BrowserController *)self favoritesAreShowingInPopover])
  {
    id v4 = [(BrowserController *)self unifiedField];
    [v4 resignFirstResponder];
  }
  else
  {
    [(BrowserController *)self cancelFavorites];
  }
}

- (BOOL)catalogViewControllerUnifiedFieldCanBecomeFirstResponder:(id)a3
{
  if (self->_contentBorrowedForTab) {
    return -[BrowserController _wantsURLFieldAutoFocus](self) ^ 1;
  }
  else {
    return 1;
  }
}

- (void)catalogViewControllerWillUnfocusUnifiedField:(id)a3
{
  id v9 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  if (([v4 isShowingSystemStartPage] & 1) == 0)
  {

    goto LABEL_5;
  }
  char v5 = [v9 unifiedField];
  id v6 = [v5 text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
LABEL_5:
    id v8 = [v9 capsuleCollectionView];
    [v8 setSuppressesSelectedItemUnfocus:1];
  }
}

- (BOOL)catalogViewControllerPresentingInPortraitAspectRatio:(id)a3
{
  id v3 = [(BrowserRootViewController *)self->_rootViewController view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  return v5 <= v7;
}

- (void)catalogViewController:(id)a3 willPresentDetailViewController:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self willPresentAutocompletionDetailViewController:v6];
  }
}

- (void)catalogViewController:(id)a3 willPresentCustomizationViewController:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self willPresentStartPageCustomizationViewController:v6];
  }
}

- (void)catalogViewController:(id)a3 didFinishVoiceSearchWithNavigation:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self didFinishVoiceSearchWithNavigation:v4];
  }
}

- (void)beginTrackingDropSessionForTabBarVisibility:(id)a3
{
  id v4 = a3;
  dropSessionsForTabBarVisibilitdouble y = self->_dropSessionsForTabBarVisibility;
  id v9 = v4;
  if (dropSessionsForTabBarVisibility)
  {
    [(NSMutableSet *)dropSessionsForTabBarVisibility addObject:v4];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
    double v7 = self->_dropSessionsForTabBarVisibility;
    self->_dropSessionsForTabBarVisibilitdouble y = v6;
  }
  -[BrowserController updateShowingTabBarAnimated:](self, "updateShowingTabBarAnimated:", [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self tabBarExpansionViewDidBeginTrackingDropSession:v9];
  }
}

- (void)endTrackingDropSessionForTabBarVisibility:(id)a3
{
  id v5 = a3;
  -[NSMutableSet removeObject:](self->_dropSessionsForTabBarVisibility, "removeObject:");
  -[BrowserController updateShowingTabBarAnimated:](self, "updateShowingTabBarAnimated:", [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self tabBarExpansionViewDidEndTrackingDropSession:v5];
  }
}

- (void)tabDocumentWillBeginDragSession:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self tabDocumentWillBeginDragSession:v5];
  }
}

- (void)tabDocumentWillEndDragSession:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self tabDocumentWillEndDragSession:v5];
  }
}

- (int64_t)analyticsLayoutProvenance
{
  int IsPad = _SFDeviceIsPad();
  rootViewController = self->_rootViewController;
  if (IsPad)
  {
    id v5 = [(BrowserRootViewController *)rootViewController capsuleViewController];

    if (v5)
    {
      return 3;
    }
    else
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      int v11 = [v10 BOOLForKey:*MEMORY[0x1E4F786E0]];

      if (v11) {
        return 2;
      }
      else {
        return 1;
      }
    }
  }
  else if ([(BrowserRootViewController *)rootViewController usingLoweredBar])
  {
    double v7 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
    id v8 = [v7 capsuleCollectionView];
    uint64_t v9 = [v8 layoutStyle];

    if (v9 == 1) {
      return 5;
    }
    else {
      return 4;
    }
  }
  else
  {
    return 2;
  }
}

- (void)_addInteractionsForTabBar:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    id v9 = v3;
    id v4 = [*(id *)(a1 + 928) tabDragDropController];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v4];
    [v9 addInteraction:v5];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v4];
    [v9 addInteraction:v6];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v4];
    id v8 = *(void **)(a1 + 360);
    *(void *)(a1 + 360) = v7;

    [v9 addInteraction:*(void *)(a1 + 360)];
    +[TabCollectionViewSpringLoadingBehavior addSpringLoadedInteractionToTabView:v9];

    id v3 = v9;
  }
}

- (BookmarksNavigationController)bookmarksNavigationController
{
  id v3 = [(BrowserController *)self _bookmarksPresentationStyle];
  if ((unint64_t)&v3[-1]._tableSeparatorInset.right + 7 >= 2)
  {
    if (!v3)
    {
      if ([(BrowserController *)self isPresentingModalBookmarksController]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        modalBookmarksController = self->_modalBookmarksController;
      }
      else
      {
        modalBookmarksController = 0;
      }
      id v3 = modalBookmarksController;
    }
  }
  else if ([(SidebarUIProxy *)self->_sidebarUIProxy isShowingSidebar])
  {
    -[BrowserController _sidebarViewController]((uint64_t)self);
    id v3 = (BookmarksNavigationController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_sidebarViewController
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 280) sidebarViewController];
    uint64_t v2 = [v1 contentViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_reloadProfileSwitcherIfNeeded
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 896) sidebarViewController];
    id v3 = [v2 profilesInSwitcherMenu];

    id v4 = [*(id *)(a1 + 344) profiles];
    uint64_t v5 = [v3 count];
    if (v5 == [v4 count])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __51__BrowserController__reloadProfileSwitcherIfNeeded__block_invoke;
      v7[3] = &unk_1E6D794C8;
      void v7[4] = a1;
      objc_msgSend(v3, "safari_enumerateZippedValuesWithArray:withBlock:", v4, v7);
    }
    else
    {
      id v6 = [*(id *)(a1 + 896) sidebarViewController];
      [v6 setNeedsReloadForProfileSwitcher];
    }
  }
}

void __51__BrowserController__reloadProfileSwitcherIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v15 = a2;
  id v8 = a3;
  id v9 = [v15 title];
  id v10 = [v8 title];
  if (([v9 isEqualToString:v10] & 1) == 0)
  {

    goto LABEL_5;
  }
  int v11 = [v15 symbolImageName];
  id v12 = [v8 symbolImageName];
  char v13 = [v11 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
LABEL_5:
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 896) sidebarViewController];
    [v14 setNeedsReloadForProfileSwitcher];

    *a5 = 1;
  }
}

- (void)_profileWallpaperDidChange:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F98E88], "defaultManager", a3);
  tabGroupManager = self->_tabGroupManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BrowserController__profileWallpaperDidChange___block_invoke;
  v7[3] = &unk_1E6D791E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(WBTabGroupManager *)tabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:v7];
}

void __48__BrowserController__profileWallpaperDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 776) profiles];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__BrowserController__profileWallpaperDidChange___block_invoke_2;
  v3[3] = &unk_1E6D794F0;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __48__BrowserController__profileWallpaperDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 identifier];
  if ([v3 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    id v4 = &stru_1F3C268E8;
  }
  else
  {
    id v4 = [v5 identifier];
  }

  [*(id *)(a1 + 32) loadImageFromDiskForIdentifier:v4];
}

- (void)scrollSidebarToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(LibraryController *)self->_libraryController sidebarViewController];
  [v4 scrollToTopAnimated:v3];
}

- (void)sidebarTrailingButtonWasTapped
{
}

void __34__BrowserController_sidebarAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained barManager:WeakRetained[104] didReceiveTapForBarItem:3];
  }
}

- (id)_navigationControllerForTabGroupPicker
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = [[TabGroupPickerViewController alloc] initWithTabGroupProvider:a1[43]];
    objc_storeWeak(v1 + 46, v2);
    uint64_t v1 = (id *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v2];
  }
  return v1;
}

- (void)hideTabGroupPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupPickerViewController);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (id)showTabGroupPicker:(id)a3
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = -[BrowserController _navigationControllerForTabGroupPicker]((id *)&self->super.super.super.isa);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupPickerViewController);
  if (![(BrowserController *)self usesNarrowLayout])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      uint64_t v7 = [v6 superview];
      if (!v7)
      {

        goto LABEL_20;
      }
      [v5 setModalPresentationStyle:7];
      id v8 = [v5 popoverPresentationController];
      [v8 setSourceView:v7];
      [v6 frame];
      objc_msgSend(v8, "setSourceRect:");
      [v8 setPermittedArrowDirections:3];
    }
  }
  id v9 = [v5 presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    if ([(BrowserController *)self hasMultipleProfiles])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB15F0]);
      id v12 = [v11 defaultContentConfiguration];
      [v11 setContentConfiguration:v12];

      objc_msgSend(v11, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
      double v14 = v13;
      id v15 = [(BrowserController *)self tabGroupProvider];
      id v16 = [v15 tabGroups];
      uint64_t v17 = [v16 count];

      CGSize v18 = [(BrowserController *)self tabGroupProvider];
      id v19 = [v18 moveLocalTabsToNewGroupTitle];

      double v20 = -0.0;
      if (v19) {
        double v20 = v14;
      }
      double v21 = (double)(unint64_t)(v17 - 1) * v14 + 54.0 + (v14 + 24.0) * 3.0 + 48.0 + v20;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __40__BrowserController_showTabGroupPicker___block_invoke;
      v36[3] = &__block_descriptor_40_e16_d16__0__UIView_8l;
      *(double *)&v36[4] = v21;
      id v22 = [MEMORY[0x1E4FB22A0] _detentWithContainerViewBlock:v36];
      id v23 = [(BrowserRootViewController *)self->_rootViewController view];
      [v23 bounds];
      double v25 = v24;

      __int16 v26 = [(BrowserRootViewController *)self->_rootViewController view];
      [v26 bounds];
      double v28 = v27;

      if (v21 >= v25 * 0.5)
      {
        if (v21 <= v28 * 0.935)
        {
          v38[0] = v22;
          long long v29 = [MEMORY[0x1E4FB22A0] _largeDetent];
          v38[1] = v29;
          [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
        }
        else
        {
          long long v29 = [MEMORY[0x1E4FB22A0] _largeDetent];
          uint64_t v39 = v29;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
        id v30 = };
        [v10 _setDetents:v30];
      }
      else
      {
        long long v29 = [MEMORY[0x1E4FB22A0] _mediumDetent];
        v40[0] = v29;
        id v30 = [MEMORY[0x1E4FB22A0] _largeDetent];
        v40[1] = v30;
        id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
        [v10 _setDetents:v31];
      }
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB22A0] _mediumDetent];
      v37[0] = v11;
      id v22 = [MEMORY[0x1E4FB22A0] _largeDetent];
      v37[1] = v22;
      long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      [v10 _setDetents:v29];
    }
  }
  long long v32 = [v5 view];
  [v32 layoutIfNeeded];

  long long v33 = [(BrowserController *)self viewControllerToPresentFrom];
  [v33 presentViewController:v5 animated:1 completion:0];

LABEL_20:
  return WeakRetained;
}

double __40__BrowserController_showTabGroupPicker___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

void __48__BrowserController_setUpWithURL_launchOptions___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 928) tabThumbnailCollectionView];
  [v1 presentAnimated:0];
}

void __48__BrowserController_setUpWithURL_launchOptions___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__BrowserController_setUpWithURL_launchOptions___block_invoke_3;
    block[3] = &unk_1E6D79060;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __48__BrowserController_setUpWithURL_launchOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) togglePrivateBrowsingEnabled];
}

- (void)userDefaultsDidChangeValueForKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F789E0]]) {
    [(BrowserController *)self fraudWarningsToggled];
  }
  if (([v4 isEqualToString:*MEMORY[0x1E4F78860]] & 1) == 0)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F785D8]])
    {
      [(BrowserController *)self toggleAlwaysShowBookmarksBarMessageReceived];
      goto LABEL_13;
    }
    if ([v4 isEqualToString:@"SpeculativeLoading"])
    {
      [(BrowserController *)self updateSpeculativeLoadingPreferences];
      goto LABEL_13;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F78A18]])
    {
      -[BrowserController updateUsesTabBar]((uint64_t)self);
      goto LABEL_13;
    }
    if (([v4 isEqualToString:*MEMORY[0x1E4F78940]] & 1) != 0
      || [v4 isEqualToString:*MEMORY[0x1E4F78938]])
    {
      [(BrowserController *)self updateJavaScriptPreferences];
      goto LABEL_13;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FB6F30]])
    {
      [(BrowserController *)self setCookiePolicyMessageReceived];
      goto LABEL_13;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F78898]])
    {
      [(BrowserController *)self updateApplePayPreferences];
      goto LABEL_13;
    }
    if (([v4 isEqualToString:*MEMORY[0x1E4F78830]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F78850]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F78840]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F78828]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F78848]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F78838]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F78820]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4F78810]] & 1) != 0
      || [v4 isEqualToString:*MEMORY[0x1E4F78818]])
    {
      id v5 = [(BrowserController *)self tabBarManager];
      id v6 = [v5 inlineTabBar];
      [v6 updateLayout];

      uint64_t v7 = [v5 standaloneTabBar];
      [v7 updateLayout];
LABEL_28:

LABEL_29:
      goto LABEL_13;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F786D0]])
    {
      [(BrowserRootViewController *)self->_rootViewController updateThemeColorIfNeededAnimated:0];
      goto LABEL_13;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F78710]])
    {
      id v5 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
      uint64_t v7 = [v5 capsuleCollectionView];
      [v7 updateVerticalSwipeThreshold];
      goto LABEL_28;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F78708]])
    {
      id v8 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
      [v8 updateAdditionalBottomObscuredInset];

      id v5 = [(BrowserRootViewController *)self->_rootViewController view];
      [v5 setNeedsLayout];
      goto LABEL_29;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4F78748]])
    {
      id v9 = (id)WBS_LOG_CHANNEL_PREFIXLayout();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = stringForCurrentCapsuleLayoutPreference();
        int v15 = 138543362;
        id v16 = v10;
        _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Changing Capsule Layout to: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      [(BrowserRootViewController *)self->_rootViewController updateCapsuleLayoutStyle];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F786E0]])
    {
      id v11 = (id)WBS_LOG_CHANNEL_PREFIXLayout();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = stringForCurrentTabBarLayoutPreference();
        int v15 = 138543362;
        id v16 = v12;
        _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "Changing Tab Bar Layout to: %{public}@", (uint8_t *)&v15, 0xCu);
      }
      -[BrowserController updateUsesTabBar]((uint64_t)self);
      -[BrowserController _updateUnifiedBar]((id *)&self->super.super.super.isa);
      -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 0);
      [(BrowserRootViewController *)self->_rootViewController updateThemeColorIfNeededAnimated:0];
      double v13 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
      [v13 updateStartPageTopSpacing];
    }
    else
    {
      if ([v4 isEqualToString:*MEMORY[0x1E4F78758]])
      {
        [(BrowserRootViewController *)self->_rootViewController updateUsesWebpageStatusBar];
        goto LABEL_13;
      }
      if ([v4 isEqualToString:*MEMORY[0x1E4F78738]])
      {
        id v5 = [MEMORY[0x1E4F781F8] sharedProvider];
        [v5 clearCachedMenuForPersona:0];
        goto LABEL_29;
      }
      if ([v4 isEqualToString:*MEMORY[0x1E4F785E8]])
      {
        uint64_t v14 = -[BrowserController _bookmarksBarLabelButtonDisplayStyle]((uint64_t)self);
        id v5 = [(BrowserRootViewController *)self->_rootViewController bookmarksBar];
        [v5 setButtonStyle:v14];
        goto LABEL_29;
      }
      if ([v4 isEqualToString:@"DebugBarCollapsingBehavior"]) {
        -[BrowserController _updateDisableBarHiding]((uint64_t)self);
      }
    }
  }
LABEL_13:
}

- (uint64_t)_bookmarksBarLabelButtonDisplayStyle
{
  if (!a1) {
    return 0;
  }
  id v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v2 = [v1 objectForKey:*MEMORY[0x1E4F785E8]];
  uint64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)carrierBundledChanged
{
  uint64_t v2 = [BookmarkImporter alloc];
  uint64_t v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  id v4 = [(BookmarkImporter *)v2 initWithBookmarkCollection:v3];

  [(BookmarkImporter *)v4 importBuiltinBookmarks];
}

- (void)didFocusTabGroup:(id)a3
{
  id v9 = a3;
  id v4 = +[Application sharedApplication];
  if ([v9 isPrivateBrowsing] && objc_msgSend(v4, "isPrivateBrowsingLocked"))
  {
    -[BrowserController _showLockedPrivateBrowsingViewIfNecessaryWithAuthentication:]((id *)&self->super.super.super.isa, ![(BrowserController *)self shouldShowWhatsNewInPrivateBrowsingSheet]);
  }
  else
  {
    char v5 = [v9 isPrivateBrowsing];
    if (self) {
      char v6 = v5;
    }
    else {
      char v6 = 1;
    }
    if ((v6 & 1) == 0
      && [(BrowserRootViewController *)self->_rootViewController isShowingLockedPrivateBrowsingView])
    {
      [(BrowserRootViewController *)self->_rootViewController hideLockedPrivateBrowsingView];
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:self];

  [v4 updateShouldLockPrivateBrowsingWithTimerIfNecessary];
  if ([v9 isPrivateBrowsing]) {
    -[BrowserController _showPrivateBrowsingExplanationSheetIfNecessary](self);
  }
  id v8 = [(LibraryController *)self->_libraryController sidebarViewController];
  [v8 updateSelectionByIgnoringExistingSelection:1];
}

- (void)_showLockedPrivateBrowsingViewIfNecessaryWithAuthentication:(id *)a1
{
  if (a1)
  {
    if (([a1[35] isShowingLockedPrivateBrowsingView] & 1) == 0)
    {
      [a1[35] showLockedPrivateBrowsingView];
      objc_initWeak(&location, a1);
      id v4 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      id v9 = __81__BrowserController__showLockedPrivateBrowsingViewIfNecessaryWithAuthentication___block_invoke;
      id v10 = &unk_1E6D791C0;
      objc_copyWeak(&v11, &location);
      char v5 = [v4 actionWithHandler:&v7];
      char v6 = objc_msgSend(a1[35], "lockedPrivateBrowsingView", v7, v8, v9, v10);
      [v6 setTabGroupPickerAction:v5];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    if (a2) {
      [a1 authenticateToUnlockPrivateBrowsing];
    }
  }
}

- (void)_showPrivateBrowsingExplanationSheetIfNecessary
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v1 = (void *)*MEMORY[0x1E4FB2608];
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __68__BrowserController__showPrivateBrowsingExplanationSheetIfNecessary__block_invoke;
    v2[3] = &unk_1E6D79768;
    objc_copyWeak(&v3, &location);
    [v1 _performBlockAfterCATransactionCommits:v2];
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)togglePrivateBrowsingEnabled
{
  uint64_t v3 = [(BrowserController *)self isPrivateBrowsingEnabled] ^ 1;
  [(BrowserController *)self setPrivateBrowsingEnabled:v3];
}

- (BOOL)activeWindowIsForeground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    BOOL v4 = (unint64_t)[WeakRetained activationState] < 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_lockedPrivateBrowsingStateDidChange
{
  uint64_t v3 = +[Application sharedApplication];
  int v4 = [v3 isPrivateBrowsingLocked];

  [(TabController *)self->_tabController updateLockedBrowsingState];
  char v5 = [(LibraryController *)self->_libraryController sidebarViewController];
  [v5 setNeedsReloadSectionControllersAnimated:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:self];

  uint64_t v7 = [(BrowserRootViewController *)self->_rootViewController tabSwitcherViewController];
  [v7 setNeedsApplyContentAnimated:v4 ^ 1u];

  if (v4)
  {
    uint64_t v8 = [(BrowserRootViewController *)self->_rootViewController tabSwitcherViewController];
    [v8 applyContentIfNeeded];
  }
  if (self->_privateBrowsingEnabled)
  {
    [(BrowserRootViewController *)self->_rootViewController updateUsesWebpageStatusBar];
    if (v4)
    {
      [(BrowserController *)self dismissTransientUIAnimated:0 options:2];
      [(_SFWebView *)self->_webView resignFirstResponder];
      -[BrowserController _showLockedPrivateBrowsingViewIfNecessaryWithAuthentication:]((id *)&self->super.super.super.isa, 0);
    }
    else
    {
      if ([(BrowserRootViewController *)self->_rootViewController isShowingLockedPrivateBrowsingView])
      {
        [(BrowserRootViewController *)self->_rootViewController hideLockedPrivateBrowsingView];
      }
      [(BrowserController *)self becomeFirstResponder];
    }
  }
}

void __81__BrowserController__showLockedPrivateBrowsingViewIfNecessaryWithAuthentication___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = [v6 sender];
  id v5 = (id)[WeakRetained showTabGroupPicker:v4];
}

- (void)authenticateToUnlockPrivateBrowsing
{
  id v2 = +[Application sharedApplication];
  [v2 authenticateToUnlockPrivateBrowsingWithCompletionHandler:0];
}

- (void)cloudTabsEnabledDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  if (([WeakRetained cloudTabsEnabled] & 1) == 0)
  {
    int v4 = -[BrowserController _isShowingCollectionInSidebar:]((id *)&self->super.super.super.isa, @"CloudTabsCollection");

    if (!v4) {
      goto LABEL_5;
    }
    id WeakRetained = [(TabController *)self->_tabController activeTabGroupUUID];
    [(TabController *)self->_tabController setActiveTabGroupUUID:WeakRetained];
  }

LABEL_5:
  [(BrowserController *)self reloadSidebarAnimated:1];
}

- (uint64_t)_isShowingCollectionInSidebar:(id *)a1
{
  id v3 = a2;
  if (a1
    && (([a1 isPresentingModalBookmarksController] & 1) != 0
     || ([a1[94] isShowingSidebar] & 1) != 0))
  {
    int v4 = [a1[112] currentCollection];
    uint64_t v5 = [v4 isEqualToString:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isScrolledToThresholdForContinuousPrefetching
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 304) bounds];
    double MaxY = CGRectGetMaxY(v6);
    [*(id *)(v1 + 304) contentSize];
    double v4 = v3;
    [*(id *)(v1 + 304) contentInset];
    return MaxY / (v4 + v5) >= 0.75;
  }
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v10 = a3;
  self->_scrollViewIsDragging = 1;
  double v4 = [(BrowserRootViewController *)self->_rootViewController currentBarAnimator];
  [v10 contentOffset];
  [v4 beginDraggingWithOffset:v5];

  int v6 = objc_msgSend(v10, "_sf_isScrolledToOrPastBottom");
  self->_shouldShowBarsAfterDraggingDownward = v6;
  if (v6)
  {
    BOOL v7 = [(BrowserRootViewController *)self->_rootViewController keepBarsMinimized];
    self->_shouldShowBarsAfterDraggingDownward = !v7;
    if (v7) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = ![(BrowserRootViewController *)self->_rootViewController usingLoweredBar];
    }
  }
  else
  {
    BOOL v8 = 0;
    self->_shouldShowBarsAfterDraggingDownward = 0;
  }
  self->_shouldShowBarsAfterDraggingDownward = v8;
  id v9 = [(TabController *)self->_tabController activeTabDocument];
  [v9 userDidManipulateVisibleRegion];

  [(ContinuousReadingViewController *)self->_continuousReadingViewController setSuppressingAutoScroll:0];
}

- (void)didCompleteScrolling
{
  self->_obscuredInsetsIncludeRefreshControlDuringBounce = 0;
  if (-[BrowserController _isInContinuousMode]((uint64_t)self)
    && -[BrowserController _isScrolledToThresholdForContinuousPrefetching]((BOOL)self))
  {
    -[BrowserController prefetchNextContinuousItemIfNeeded]((id *)&self->super.super.super.isa);
  }
  [(ContinuousReadingViewController *)self->_continuousReadingViewController setSuppressingAutoScroll:1];
  id v3 = [(BrowserRootViewController *)self->_rootViewController currentBarAnimator];
  [v3 endScrolling];

  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 webViewDidScroll];
}

- (void)prefetchNextContinuousItemIfNeeded
{
  if (a1)
  {
    id v6 = [a1[11] currentItem];
    if (v6)
    {
      id v2 = [a1[11] previewView];

      if (v2)
      {
        id v7 = [a1[11] previewView];
        id v3 = [v7 contentView];

        if (v3)
        {
          -[BrowserController loadNextContinuousDocumentIfNeeded](a1);
        }
        else
        {
          id v8 = [a1 nextContinuousItemDocument];
          objc_msgSend(a1, "clearDocumentForContinuousReading:");

          id v4 = [a1 continuousReadingController];
          id v9 = [v4 nextReadingListItem];

          if (v9)
          {
            double v5 = -[BrowserController _tabDocumentForNextContinuousItem](a1);
            -[BrowserController _setContinuousReadingContentViewFromTabDocument:useReaderView:](a1, v5, 0);

            -[BrowserController loadNextContinuousDocumentIfNeeded](a1);
          }
        }
      }
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)BrowserController;
  [(BrowserController *)&v8 pressesEnded:v6 withEvent:v7];
  -[BrowserController _deactivateTabViewIfNeededForEvent:]((uint64_t)self, v7);
}

- (void)_deactivateTabViewIfNeededForEvent:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && ([v3 modifierFlags] & *(_DWORD *)(a1 + 144) & 0x140000) == 0) {
    [*(id *)(a1 + 928) setTabViewDefersActivation:0];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)BrowserController;
  [(BrowserController *)&v8 pressesCancelled:v6 withEvent:v7];
  -[BrowserController _deactivateTabViewIfNeededForEvent:]((uint64_t)self, v7);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self->_scrollViewIsDragging)
  {
    double y = a4.y;
    self->_scrollViewIsDragging = 0;
    id v7 = [(BrowserRootViewController *)self->_rootViewController currentBarAnimator];
    [v7 endDraggingWithTargetOffset:a5->y velocity:y * 1000.0];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (a4)
  {
    BOOL v5 = -[BrowserController _refreshControlHeight]((uint64_t)self) != 0.0;
  }
  else
  {
    [(BrowserController *)self didCompleteScrolling];
    BOOL v5 = 0;
  }
  self->_obscuredInsetsIncludeRefreshControlDuringBounce = v5;
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = (UIScrollView *)a3;
  if ([(ContinuousReadingViewController *)self->_continuousReadingViewController interceptsScrollToTopTap])
  {
    goto LABEL_2;
  }
  scrollView = self->_scrollView;
  if (scrollView == v4)
  {
    id v12 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    uint64_t v13 = [v12 presentationState];

    if (v13)
    {
LABEL_2:
      BOOL v5 = 0;
      goto LABEL_17;
    }
    scrollView = self->_scrollView;
  }
  if (scrollView == v4)
  {
    uint64_t v14 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);

    if (v14) {
      goto LABEL_2;
    }
  }
  if ([(SidebarUIProxy *)self->_sidebarUIProxy isShowingSidebar]
    && [(BrowserController *)self _bookmarksPresentationStyle] == 1)
  {
    id v7 = [(_SFWebView *)self->_webView scrollView];
    BOOL v5 = v7 != v4;
  }
  else
  {
    id v7 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
    objc_super v8 = [(UIScrollView *)v7 capsuleCollectionView];
    if ([(BrowserRootViewController *)self->_rootViewController usingLoweredBar]
      && [v8 selectedItemIsMinimized]
      && (-[UIScrollView transitionToState:animated:completionHandler:](v7, "transitionToState:animated:completionHandler:", 0, 1, 0), [v8 layoutStyle] != 1))
    {
      BOOL v5 = 0;
    }
    else
    {
      id v9 = [(BrowserRootViewController *)self->_rootViewController dynamicBarAnimator];
      if ([(BrowserRootViewController *)self->_rootViewController usingLoweredBar]
        || [v9 state])
      {
        id v10 = [(TabController *)self->_tabController activeTabDocument];
        [v10 setSuppressingProgressAnimationForNavigationGesture:0];

        BOOL v5 = 1;
      }
      else
      {
        [(BrowserController *)self showBars];
        BOOL v5 = 0;
      }
    }
  }

LABEL_17:
  return v5;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v6 = a3;
  [(BrowserController *)self updatePullToRefreshIsEnabled];
  [(ContinuousReadingViewController *)self->_continuousReadingViewController setSuppressingAutoScroll:1];
  +[Application postTestNotificationName:@"ScrollViewWillBeginZoomingNotification" object:self];
  [v6 zoomScale];
  self->_scrollViewStartZoomScale = v5;
  -[BrowserController _updateScribbleOverlayIfNeeded]((id *)&self->super.super.super.isa);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  [(BrowserController *)self updatePullToRefreshIsEnabled];
  [(ContinuousReadingViewController *)self->_continuousReadingViewController setSuppressingAutoScroll:0];
  +[Application postTestNotificationName:@"ScrollViewDidEndZoomingNotification" object:self];
  if (self->_scrollViewStartZoomScale < a5)
  {
    id v7 = [(TabController *)self->_tabController activeTabDocument];
    [v7 webViewDidIncreaseZoom];
  }
}

- (void)goBack
{
}

- (void)_goBackAllowingNewTabToSpawnIfNeeded:(id *)a1
{
  if (a1)
  {
    [a1 dismissTransientUIAnimated:1];
    id v4 = [a1[43] activeTabDocument];
    [v4 goBackAllowingNewTabToSpawnIfNeeded:a2];

    -[BrowserController _presentReaderTriggeredAppReviewPromptIfNeeded]((uint64_t)a1);
  }
}

- (void)_presentReaderTriggeredAppReviewPromptIfNeeded
{
  if (a1 && [(id)a1 isShowingReader])
  {
    id v5 = [(id)a1 appReviewPromptManager];
    [*(id *)(a1 + 304) contentOffset];
    double v3 = v2;
    [*(id *)(a1 + 304) contentSize];
    [v5 didDismissReaderWithScrollPercentage:*(void *)(a1 + 584) dateReaderOpened:v3 / v4];
  }
}

- (void)goForward
{
}

- (void)_goForwardAllowingNewTabToSpawnIfNeeded:(id *)a1
{
  if (a1)
  {
    [a1 dismissTransientUIAnimated:1];
    id v4 = [a1[43] activeTabDocument];
    [v4 goForwardAllowingNewTabToSpawnIfNeeded:a2];
  }
}

- (uint64_t)_commitSpeculativeLoadForURL:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = googleSearchEngine();
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    id v6 = [v4 urlAttributingToSafariIfValidSearchURL:v5];
    id v7 = [v6 absoluteString];

    objc_super v8 = [*(id *)(a1 + 904) URLString];
    LODWORD(v5) = [v8 isEqualToString:v7];

    if (([*(id *)(a1 + 448) isEqualToString:v3] | v5) == 1
      && *(void *)(a1 + 448))
    {
      -[BrowserController _commitToSpeculativeLoad](a1);
      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (void)_commitToSpeculativeLoad
{
  if (a1)
  {
    id v10 = [*(id *)(a1 + 904) url];
    -[BrowserController _recordIgnoredSiriSuggestedSitesWithURL:](a1, v10);

    if (!*(unsigned char *)(a1 + 719))
    {
      id v11 = [MEMORY[0x1E4F98BB8] sharedController];
      double v2 = [*(id *)(a1 + 904) url];
      id v3 = [v2 host];
      id v4 = [(id)a1 activeProfileIdentifier];
      [v11 removeIgnoredSiriSuggestedSitesWithURLHost:v3 inProfile:v4];
    }
    id v12 = *(id *)(a1 + 904);
    id v5 = *(void **)(a1 + 904);
    *(void *)(a1 + 904) = 0;

    id v6 = *(void **)(a1 + 448);
    *(void *)(a1 + 448) = 0;

    id v7 = *(void **)(a1 + 344);
    objc_super v8 = [v12 URL];
    LODWORD(v7) = [v7 trySwitchingToPinnedTabOnNavigationToURL:v8];

    if (v7)
    {
      -[BrowserController _cancelSpeculativeLoadForDocument:](a1, v12);
    }
    else if ((-[BrowserController _spawnNewTabFromPinnedTabIfNeededForSpeculativeDocument:](a1, v12) & 1) == 0)
    {
      id v9 = [*(id *)(a1 + 344) activeTabDocument];
      -[BrowserController _commitToSpeculativeLoadForDocument:]((id *)a1, v12);
      [v9 willClose];
    }
  }
}

- (void)setProgressEnabled:(BOOL)a3
{
}

- (float)zoomScale
{
  [(UIScrollView *)self->_scrollView zoomScale];
  return v2;
}

- (void)setZoomScale:(float)a3
{
}

- (void)didReceiveMemoryWarning
{
  [(BrowserController *)self clearReaderViews];
  [(BrowserController *)self clearSpeculativeLoadDocument];
}

- (void)clearReaderViews
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v2 = [(TabController *)self->_tabController allTabDocuments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isShowingReader])
        {
          id v7 = [v6 readerContext];
          if ([v7 isLoadingNextPage]) {
            [v7 stopLoadingNextPage];
          }
        }
        else
        {
          [v6 clearReaderView];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (void)_cancelSpeculativeLoadForDocument:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    [v3 stopLoading];
    [v5 clearBackForwardList];
    [v5 setAppBanner:0];
    uint64_t v4 = +[History sharedHistory];
    [v4 cancelDeferredUpdates];

    id v3 = v5;
  }
}

- (void)_recordIgnoredSiriSuggestedSitesWithURL:(uint64_t)a1
{
  id v5 = a2;
  if (a1 && !*(unsigned char *)(a1 + 719))
  {
    id v3 = -[BrowserController _catalogViewController]((id *)a1);
    uint64_t v4 = [v3 completionList];
    [v4 recordIgnoredSiriSuggestedSitesWithURL:v5];
  }
}

- (uint64_t)_spawnNewTabFromPinnedTabIfNeededForSpeculativeDocument:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 344) activeTabDocument];
    id v5 = [v3 URL];
    uint64_t v6 = [v4 shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:v5];

    if (v6)
    {
      [v3 setUpBackClosesSpawnedTabWithParent:v4];
      [v3 updateAncestryWithParentTab:v4];
      [v3 setAllowsRemoteInspection:1];
      [v3 setSuppressWebExtensionEvents:0];
      [*(id *)(a1 + 344) insertNewTabDocument:v3 forcingOrderAfterTabDocument:v4 inBackground:0 animated:1];
      id v7 = [v4 history];
      [v7 commitDeferredUpdates];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_commitToSpeculativeLoadForDocument:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v11 = v3;
    [v3 setAllowsRemoteInspection:1];
    uint64_t v4 = [a1[43] activeTabDocument];
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    if (WeakRetained)
    {
      uint64_t v6 = [v4 webView];
      [v6 _saveBackForwardSnapshotForItem:WeakRetained];

      objc_storeWeak(a1 + 5, 0);
    }
    id v7 = [v4 libraryType];

    if (v7)
    {
      id v8 = a1[43];
      long long v9 = [v4 libraryType];
      [v8 openTab:v11 navigatedFromLibraryType:v9];
    }
    else
    {
      -[BrowserController _replaceActiveDocument:withSpeculativeDocument:]((uint64_t)a1, v4, v11);
    }
    [a1 updateDynamicBarGeometry];
    long long v10 = [a1[109] tabDocumentPendingUserActivityPayload];

    if (v10 == v4) {
      [a1[109] setTabDocumentPendingUserActivityPayload:0];
    }

    id v3 = v11;
  }
}

- (void)_replaceActiveDocument:(void *)a3 withSpeculativeDocument:
{
  id v8 = a2;
  id v5 = a3;
  if (a1)
  {
    [(id)a1 setFavoritesState:0 animated:1];
    [*(id *)(a1 + 344) replaceTabDocument:v8 withTabDocument:v5 committingSpeculativeLoad:1];
    uint64_t v6 = [*(id *)(a1 + 280) navigationBar];
    [v6 setNeedsLayout];
    [v6 layoutIfNeeded];
    [v8 hideFindOnPage];
    if (*(id *)(a1 + 200) != v5)
    {
      [v5 endSuppressingProgressAnimation];
      [v5 animateProgressForCompletedDocument];
    }
    -[BrowserController _updateButtonsAnimatingTabBar:](a1, 1);
    id v7 = [v8 history];
    [v7 commitDeferredUpdates];
  }
}

- (void)autoFillStateChangedMessageReceived
{
}

- (void)setCookiePolicyMessageReceived
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self) {
    [(WKPreferences *)self->_wkPreferences sf_applySafariStorageBlockingPolicy];
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = objc_msgSend(MEMORY[0x1E4F46710], "safari_allPersistentDataStores", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v7 = [v6 httpCookieStore];
        objc_msgSend(v7, "sf_applySafariCookieStoragePolicy");

        id v8 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
        objc_msgSend(v6, "_setResourceLoadStatisticsEnabled:", objc_msgSend(v8, "webui_trackerProtectionEnabled"));
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  long long v9 = [MEMORY[0x1E4F46710] nonPersistentDataStore];
  long long v10 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  objc_msgSend(v9, "_setResourceLoadStatisticsEnabled:", objc_msgSend(v10, "webui_trackerProtectionEnabled"));
}

- (void)toggleAlwaysShowBookmarksBarMessageReceived
{
  int shouldShowBookmarks = -[BrowserController _shouldShowBookmarksBar]((id *)&self->super.super.super.isa);
  id v4 = [(BrowserRootViewController *)self->_rootViewController bookmarksBar];
  if (((shouldShowBookmarks ^ (v4 == 0)) & 1) == 0)
  {
    -[BrowserController _setShowBookmarksBar:]((uint64_t)self, shouldShowBookmarks);
    -[BrowserController _contentContainerViewFrameDidChange]((uint64_t)self);
    -[BrowserController _updateCurrentPageBannerViewIfNeeded]((id *)&self->super.super.super.isa);
    [(BrowserController *)self updateDynamicBarGeometry];
  }
}

- (uint64_t)_prefersShowingBookmarksBar
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v2 = [v1 BOOLForKey:*MEMORY[0x1E4F785D8]];

  return v2;
}

- (id)_titleForToggleFavoritesBarKeyCommand
{
  if (a1)
  {
    -[BrowserController _prefersShowingBookmarksBar]((uint64_t)a1);
    a1 = _WBSLocalizedString();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setCurrentBookmarksCollection:(id)a3
{
  id v6 = a3;
  if (_SFDeviceIsPad()
    && ([(BrowserRootViewController *)self->_rootViewController capsuleViewController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    [(LibraryController *)self->_libraryController setCurrentCollection:v6];
  }
  else
  {
    id v5 = -[BrowserController _bookmarksNavigationController](self);
    [v5 setCurrentCollection:v6];
  }
}

- (id)_bookmarksNavigationController
{
  if (a1)
  {
    uint64_t v2 = (uint64_t)a1;
    uint64_t v3 = [a1 _bookmarksPresentationStyle];
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
        a1 = 0;
      }
      else {
        a1 = *(id *)(v2 + 160);
      }
    }
    else
    {
      -[BrowserController _sidebarViewController](v2);
      a1 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSString)currentBookmarksCollection
{
  if (_SFDeviceIsPad()
    && ([(BrowserRootViewController *)self->_rootViewController capsuleViewController],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    id v5 = [(LibraryController *)self->_libraryController currentCollection];
  }
  else
  {
    id v4 = -[BrowserController _bookmarksNavigationController](self);
    id v5 = [v4 currentCollection];
  }
  return (NSString *)v5;
}

- (id)_titleForToggleBookmarksKeyCommand
{
  if (a1)
  {
    uint64_t v1 = [a1 currentBookmarksCollection];
    [v1 isEqualToString:@"BookmarksCollection"];
    uint64_t v2 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)_titleForToggleReadingListKeyCommand
{
  if (a1)
  {
    uint64_t v1 = [a1 currentBookmarksCollection];
    [v1 isEqualToString:@"ReadingListCollection"];
    uint64_t v2 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)_titleForToggleHistoryKeyCommand
{
  if (a1)
  {
    uint64_t v1 = [a1 currentBookmarksCollection];
    [v1 isEqualToString:@"HistoryCollection"];
    uint64_t v2 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)_titleForToggleSharedWithYouKeyCommand
{
  if (a1)
  {
    -[BrowserController _isShowingCollectionInSidebar:](a1, @"SharedWithYouCollection");
    _WBSLocalizedString();
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_titleForToggleCloudTabsKeyCommand
{
  if (a1)
  {
    -[BrowserController _isShowingCollectionInSidebar:](a1, @"CloudTabsCollection");
    _WBSLocalizedString();
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_titleForToggleWebpageStatusBar
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 280) statusBarView];
    uint64_t v2 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)setScrollViewZoomEnabled:(BOOL)a3
{
}

- (void)_downloadsDidChange:(id)a3
{
  id v7 = [a3 object];
  id v4 = [v7 downloads];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(BrowserRootViewController *)self->_rootViewController navigationBar];
    [v6 setHasToolbar:1];
  }
  [(_SFBarManager *)self->_barManager setBarItem:11 hidden:v5 == 0];
}

- (void)_backgroundImageFileModifiedRemotely:(id)a3
{
  id v8 = a3;
  uint64_t v3 = [v8 userInfo];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB6108]];

  if (v4)
  {
    uint64_t v5 = [v8 userInfo];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB6118]];

    id v7 = [MEMORY[0x1E4F98E88] defaultManager];
    if (v6) {
      [v7 reloadProfileSpecificBackgroundImageFromDisk:v4];
    }
    else {
      [v7 reloadTabGroupSpecificBackgroundImageFromDisk:v4];
    }
  }
}

- (void)_backgroundImageNeedsCloudKitUpdate:(id)a3
{
  id v9 = a3;
  id v4 = [v9 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F99668]];

  if (v5 && [v5 length])
  {
    id v6 = [v9 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F993C8]];

    tabController = self->_tabController;
    if (v7) {
      [(TabController *)tabController updateBackgroundImageForProfile:v5];
    }
    else {
      [(TabController *)tabController updateBackgroundImageForTabGroup:v5];
    }
  }
}

- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(TabController *)self->_tabController activeTabDocument];
  -[BrowserController setShowingReader:animated:forTabDocument:](self, "setShowingReader:animated:forTabDocument:", v5, v4);
}

- (void)setShowingReader:(BOOL)a3 animated:(BOOL)a4 forTabDocument:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v19 = v8;
  if (!a3)
  {
    [(BrowserController *)self hideReaderForTabDocument:v8 animated:v5 deactivationMode:1];
    dateReaderOpened = [(BrowserController *)self appReviewPromptManager];
    long long v12 = [(TabController *)self->_tabController activeTabDocument];
    uint64_t v13 = [v12 readerViewTopScrollOffset];
    [(UIScrollView *)self->_scrollView contentSize];
    [dateReaderOpened didDismissReaderWithScrollPercentage:self->_dateReaderOpened dateReaderOpened:(double)v13 / v14];

LABEL_7:
    [v19 updateAccessibilityIdentifier];
    goto LABEL_8;
  }
  [v8 prepareToUseReader];
  id v9 = [v19 readerContext];
  if ([v9 isReaderAvailable])
  {

    id v10 = v19;
LABEL_6:
    [(BrowserController *)self showReaderForTabDocument:v10 animated:v5];
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
    dateReaderOpened = self->_dateReaderOpened;
    self->_dateReaderOpened = v16;
    goto LABEL_7;
  }
  id v15 = [(TabController *)self->_tabController activeTabDocument];

  id v10 = v19;
  if (v15 != v19) {
    goto LABEL_6;
  }
  uint64_t v17 = [(BrowserRootViewController *)self->_rootViewController navigationBar];
  CGSize v18 = [v17 item];
  [v18 setShowsReaderButton:0];

LABEL_8:
}

- (void)_readerButtonTapped
{
  if (a1)
  {
    int v2 = [a1 isShowingReader];
    char v3 = v2;
    [a1 setShowingReader:v2 ^ 1u animated:1];
    if ((v3 & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v4 didActivateReaderWithTrigger:0];
    }
  }
}

- (void)_readerVisibilityDidChange
{
  if (a1)
  {
    -[BrowserController _contentContainerViewFrameDidChange]((uint64_t)a1);
    [a1 updateInterface];
    [a1[35] updateThemeColorIfNeededAnimated:1];
    [a1 updatePullToRefreshIsEnabled];
    int v2 = [a1[23] viewController];
    if ([MEMORY[0x1E4F97EA0] isBrowsingAssistantEnabled]) {
      [v2 readerVisibilityDidChange];
    }
    else {
      [v2 dismissViewControllerAnimated:1 completion:0];
    }
    char v3 = [a1[43] activeTabDocument];
    id v4 = [v3 assistantController];
    BOOL v5 = [v4 webpageIdentifier];
    id v6 = [v3 readerContext];
    [v6 setWebpageIdentifier:v5];

    if (([v3 isShowingReader] & 1) == 0) {
      goto LABEL_20;
    }
    if (([v4 isSummaryAvailable] & 1) == 0
      && [MEMORY[0x1E4F97EA0] isOnDeviceSummarizationEnabled])
    {
      BOOL v5 = [v3 readerContext];
      id v7 = [v5 readerTextForSummarization];
      uint64_t v8 = [v7 length];

      if (v8)
      {
        -[BrowserController _showSummarizeButtonIfNeeded]((uint64_t)a1);
      }
      else
      {
        id v9 = [v3 readerWebView];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        id v17[2] = __47__BrowserController__readerVisibilityDidChange__block_invoke;
        v17[3] = &unk_1E6D79538;
        id v18 = v5;
        id v19 = a1;
        [v9 _getContentsAsStringWithCompletionHandler:v17];
      }
    }
    if (![v3 allowsBrowsingAssistant]) {
      goto LABEL_20;
    }
    char v10 = [v4 isSummaryAvailable];
    if ((v10 & 1) != 0
      || ([v4 result],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          [v5 tableOfContentsAvailable]))
    {
      uint64_t v11 = [MEMORY[0x1E4F989E8] userConsentState];
      if ((v10 & 1) == 0) {

      }
      if (v11 != 1) {
        goto LABEL_20;
      }
      long long v12 = [v3 assistantController];
      uint64_t v13 = [v3 url];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__BrowserController__readerVisibilityDidChange__block_invoke_305;
      v14[3] = &unk_1E6D79560;
      id v15 = v3;
      id v16 = v4;
      [v12 fetchAssistantContentFromPegasusForURL:v13 withCompletionHandler:v14];

      BOOL v5 = v15;
    }

LABEL_20:
  }
}

- (void)_showSummarizeButtonIfNeeded
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 344) activeTabDocument];
    int v2 = [v1 readerContext];
    char v3 = [v2 readerTextForSummarization];
    id v4 = objc_msgSend(v3, "safari_bestLanguageTag");
    char v5 = [v4 isEqualToString:@"en"];

    if (v5)
    {
      if ([v1 isShowingReader])
      {
        id v6 = (void *)MEMORY[0x1E4F782F8];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __49__BrowserController__showSummarizeButtonIfNeeded__block_invoke;
        v7[3] = &unk_1E6D793E8;
        id v8 = v1;
        [v6 checkSummarizationAvailabilityWithCompletionHandler:v7];
      }
    }
  }
}

void __47__BrowserController__readerVisibilityDidChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __47__BrowserController__readerVisibilityDidChange__block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setReaderTextForSummarization:v5];
    -[BrowserController _showSummarizeButtonIfNeeded](*(void *)(a1 + 40));
  }
}

void __47__BrowserController__readerVisibilityDidChange__block_invoke_305(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) readerContext];
  int v2 = [*(id *)(a1 + 40) summary];
  char v3 = _WBSLocalizedString();
  id v4 = _WBSLocalizedString();
  id v5 = [*(id *)(a1 + 32) URLString];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"https://" withString:@"safari-reader://"];
  id v7 = [*(id *)(a1 + 40) tableOfContentsTitles];
  id v8 = [*(id *)(a1 + 40) tableOfContentsPaths];
  id v9 = [*(id *)(a1 + 40) tableOfContentsTrailingTexts];
  [v10 setArticleSummary:v2 withSummaryHeader:v3 tableOfContentsHeader:v4 readerURLString:v6 titles:v7 paths:v8 trailingText:v9];
}

void __49__BrowserController__showSummarizeButtonIfNeeded__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BrowserController__showSummarizeButtonIfNeeded__block_invoke_2;
    block[3] = &unk_1E6D79060;
    id v3 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __49__BrowserController__showSummarizeButtonIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) readerContext];
  int v2 = _WBSLocalizedString();
  [v1 setOnDeviceSummaryButtonWithTitle:v2];

  id v3 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Safari displayed summarize button", v4, 2u);
  }
}

- (void)showReaderForTabDocument:(id)a3 animated:(BOOL)a4
{
}

- (void)_setReaderVisible:(void *)a3 forTabDocument:(uint64_t)a4 deactivationMode:(char)a5 animated:
{
  id v9 = a3;
  if (!a1) {
    goto LABEL_17;
  }
  id v10 = [a1[43] activeTabDocument];

  if (v10 == v9) {
    [v9 hideFindOnPage];
  }
  if (a2)
  {
    [v9 createBrowserReaderViewIfNeeded];
    if (v10 == v9)
    {
      [a1[38] contentOffset];
      objc_msgSend(v9, "setScrollPoint:");
    }
    goto LABEL_8;
  }
  uint64_t v11 = [v9 readerContext];
  [v11 deactivateReaderNow:a4];

  [a1 verticalScrollOffsetForReaderViewInTabDocument:v9];
  [v9 setReaderViewTopScrollOffset:(uint64_t)v12];
  if (a4 != 2) {
LABEL_8:
  }
    [v9 setShowingReader:a2];
  [a1 document:v9 willMakeReaderVisible:a2];
  id WeakRetained = objc_loadWeakRetained(a1 + 48);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:a1 didChangeReaderVisibilityForTabDocument:v9];
  }
  if (v10 == v9)
  {
    objc_initWeak(&location, a1);
    if (a2 && ([a1[11] isCommittingToContinuousDocument] & 1) == 0)
    {
      [a1[38] contentOffset];
      objc_msgSend(a1[38], "setContentOffset:", v14, (double)objc_msgSend(v9, "readerViewTopScrollOffset"));
    }
    id v15 = [a1[115] window];
    [v15 setUserInteractionEnabled:0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__BrowserController__setReaderVisible_forTabDocument_deactivationMode_animated___block_invoke;
    v20[3] = &unk_1E6D79588;
    id v16 = v15;
    id v21 = v16;
    id v17 = v9;
    id v22 = v17;
    char v24 = a2;
    char v25 = a5;
    objc_copyWeak(&v23, &location);
    id v18 = (void *)MEMORY[0x1E4E42950](v20);
    id v19 = [v17 readerContext];
    [v19 setUpReaderWebViewIfNeededAndPerformBlock:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

LABEL_17:
}

- (void)hideReaderForTabDocument:(id)a3 animated:(BOOL)a4 deactivationMode:(unint64_t)a5
{
  id v8 = a3;
  -[BrowserController _setReaderVisible:forTabDocument:deactivationMode:animated:]((id *)&self->super.super.super.isa, 0, v8, a5, a4);
  [(BrowserController *)self updatePullToRefreshIsEnabled];
}

- (double)verticalScrollOffsetForReaderViewInTabDocument:(id)a3
{
  id v3 = a3;
  if ([v3 isShowingReader])
  {
    id v4 = [v3 readerWebView];
    id v5 = [v4 scrollView];
    [v5 contentOffset];
    double v7 = v6;
  }
  else
  {
    if ([v3 shouldRestoreReader]) {
      uint64_t v8 = [v3 readerViewTopScrollOffset];
    }
    else {
      uint64_t v8 = 0;
    }
    double v7 = (double)v8;
  }

  return v7;
}

void __80__BrowserController__setReaderVisible_forTabDocument_deactivationMode_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  id v3 = [*(id *)(a1 + 40) view];
  [v3 setShowingReader:*(unsigned __int8 *)(a1 + 56) animated:*(unsigned __int8 *)(a1 + 57) completion:&__block_literal_global_329];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  -[BrowserController _readerVisibilityDidChange](WeakRetained);
}

- (void)setReaderShouldBeShownIfPossible:(BOOL)a3
{
  if (self->_readerShouldBeShownIfPossible == a3) {
    return;
  }
  self->_readerShouldBeShownIfPossible = a3;
  if (!-[BrowserController _isInContinuousMode]((uint64_t)self)) {
    return;
  }
  id v7 = [(BrowserController *)self nextContinuousItemDocument];
  id v4 = [(BrowserController *)self previousContinuousItemDocument];
  if (!self->_readerShouldBeShownIfPossible) {
    goto LABEL_9;
  }
  if (![v7 isReaderAvailable])
  {
    if ([v4 isReaderAvailable])
    {
      [v4 createBrowserReaderViewIfNeeded];
      int v5 = 1;
      double v6 = v4;
      goto LABEL_10;
    }
LABEL_9:
    -[BrowserController _setContinuousReadingContentViewFromTabDocument:useReaderView:]((id *)&self->super.super.super.isa, v7, 0);
    int v5 = 0;
    double v6 = v4;
    goto LABEL_10;
  }
  [v7 createBrowserReaderViewIfNeeded];
  int v5 = 1;
  double v6 = v7;
LABEL_10:
  -[BrowserController _setContinuousReadingContentViewFromTabDocument:useReaderView:]((id *)&self->super.super.super.isa, v6, v5);
}

- (void)_setContinuousReadingContentViewFromTabDocument:(int)a3 useReaderView:
{
  id v6 = a2;
  if (a1)
  {
    if (a3) {
      [v6 readerWebView];
    }
    else {
    int v5 = [v6 webView];
    }
    if (a1[28] == v6)
    {
      [a1[11] didCreateWebViewForPreviousDocument:v5];
    }
    else if (a1[22] == v6)
    {
      [a1[11] didCreateWebViewForNextDocument:v5];
    }
  }
}

- (void)_perSiteAutomaticReaderActivationPreferenceDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__BrowserController__perSiteAutomaticReaderActivationPreferenceDidChange___block_invoke;
  v6[3] = &unk_1E6D791E8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __74__BrowserController__perSiteAutomaticReaderActivationPreferenceDidChange___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
  if ([v9 isReaderAvailable])
  {
    int v2 = [*(id *)(a1 + 40) userInfo];
    id v3 = objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E4F99178]);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
    id v5 = [v4 URLForPerSitePreferences];
    id v6 = objc_msgSend(v5, "safari_userVisibleHostWithoutWWWSubdomain");

    if ([v6 isEqualToString:v3])
    {
      uint64_t v7 = objc_msgSend(v2, "safari_BOOLForKey:", *MEMORY[0x1E4F997C8]);
      if (v7 != [*(id *)(a1 + 32) isShowingReader])
      {
        [*(id *)(a1 + 32) setShowingReader:v7 animated:1];
        if (v7)
        {
          uint64_t v8 = [MEMORY[0x1E4F97E48] sharedLogger];
          [v8 didActivateReaderWithTrigger:1];
        }
      }
    }
  }
}

- (void)_perSitePageZoomPreferenceDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__BrowserController__perSitePageZoomPreferenceDidChange___block_invoke;
  v6[3] = &unk_1E6D791E8;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__BrowserController__perSitePageZoomPreferenceDidChange___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) userInfo];
  int v2 = [*(id *)(*(void *)(a1 + 40) + 344) activeTabDocument];
  id v3 = [*(id *)(a1 + 32) object];
  id v4 = [*(id *)(a1 + 40) pageZoomPreferenceManagerForTabDocument:v2];

  if (v3 == v4)
  {
    id v5 = objc_msgSend(v11, "safari_stringForKey:", *MEMORY[0x1E4F99170]);
    id v6 = [v2 URLForPerSitePreferences];
    id v7 = objc_msgSend(v6, "safari_userVisibleHostWithoutWWWSubdomain");

    if ([v7 isEqualToString:v5])
    {
      uint64_t v8 = objc_msgSend(v11, "safari_numberForKey:", *MEMORY[0x1E4F992F0]);
      [v8 doubleValue];
      double v10 = v9;

      [v2 setPageZoomFactor:v10];
      -[BrowserController _reloadPresentedPreferencesListViewController](*(void **)(a1 + 40));
    }
  }
}

- (void)_reloadPresentedPreferencesListViewController
{
  if (a1)
  {
    uint64_t v1 = [a1 viewControllerToPresentFrom];
    id v4 = [v1 presentedViewController];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v2 = [v4 viewControllers];
      id v3 = [v2 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 reloadPreferences];
      }
    }
  }
}

- (BOOL)addReadingListBookmarkForCurrentTab
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  if ([v3 isBlank])
  {
    char v4 = 0;
  }
  else
  {
    id v5 = -[BrowserController _sidebarViewController]((uint64_t)self);
    id v6 = [v5 topReadingListViewController];

    int v7 = [v3 hasDoneReaderDetection];
    uint64_t v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    double v9 = [v3 titleForNewBookmark];
    double v10 = [v3 cachedCanonicalURLOrURLForSharing];
    char v4 = -[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:previewText:thumbnailURL:siteName:tabDocument:didFetchPage:updateController:savedBookmarkID:shouldFetchMetadata:](v8, v9, v10, 0, 0, 0, v3, v7, v6, 0, 1u);
  }
  return v4;
}

- (void)showReadingListAutomaticArchiveAlertIfNeededWithCompletion:(id)a3
{
  id v5 = (void (**)(void))a3;
  if (-[BrowserController _shouldShowNewReadingListBehaviorAlert]((uint64_t)self))
  {
    char v4 = -[BrowserController _newReadingListBehaviorAlertControllerWithCompletion:](self, v5);
    [(BrowserController *)self presentModalViewController:v4 completion:&__block_literal_global_331];
  }
  else if (v5)
  {
    v5[2]();
  }
}

- (uint64_t)_shouldShowNewReadingListBehaviorAlert
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if (([v1 BOOLForKey:@"HasShownAutomaticReadingListArchivingAlert"] & 1) == 0)
  {
    if (!objc_msgSend(v1, "safari_shouldAutomaticallyDownloadReadingListItems"))
    {
      uint64_t v2 = 1;
      goto LABEL_7;
    }
    [v1 setBool:1 forKey:@"HasShownAutomaticReadingListArchivingAlert"];
  }
  uint64_t v2 = 0;
LABEL_7:

  return v2;
}

- (void)_newReadingListBehaviorAlertControllerWithCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = (void *)MEMORY[0x1E4FB1418];
    id v5 = _WBSLocalizedString();
    a1 = [v4 alertControllerWithTitle:0 message:v5 preferredStyle:1];

    id v6 = (void *)MEMORY[0x1E4FB1410];
    int v7 = _WBSLocalizedString();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74__BrowserController__newReadingListBehaviorAlertControllerWithCompletion___block_invoke;
    v19[3] = &unk_1E6D795B0;
    id v8 = v3;
    id v20 = v8;
    double v9 = [v6 actionWithTitle:v7 style:0 handler:v19];

    double v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = _WBSLocalizedString();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __74__BrowserController__newReadingListBehaviorAlertControllerWithCompletion___block_invoke_2;
    id v17 = &unk_1E6D795B0;
    id v18 = v8;
    double v12 = [v10 actionWithTitle:v11 style:1 handler:&v14];

    objc_msgSend(a1, "addAction:", v9, v14, v15, v16, v17);
    [a1 addAction:v12];
  }
  return a1;
}

void __80__BrowserController_showReadingListAutomaticArchiveAlertIfNeededWithCompletion___block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 setBool:1 forKey:@"HasShownAutomaticReadingListArchivingAlert"];
}

uint64_t __74__BrowserController__newReadingListBehaviorAlertControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  objc_msgSend(v2, "safari_setShouldAutomaticallyDownloadReadingListItems:", 1);

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __74__BrowserController__newReadingListBehaviorAlertControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setNeedsSnapshotUpdateForActiveTab
{
  self->_needsSnapshotUpdateForBlankTabs = 0;
  -[BrowserController _setNeedsSnapshotUpdateForActiveTab]((uint64_t)self);
}

- (void)snapshotTabDocument:(id)a3 size:(CGSize)a4 topBackdropHeight:(double)a5 options:(unint64_t)a6 completion:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  uint64_t v14 = (void (**)(id, void))a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  id v16 = WeakRetained;
  if (!v13)
  {
    id v23 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[BrowserController snapshotTabDocument:size:topBackdropHeight:options:completion:]();
    }
    goto LABEL_15;
  }
  id v17 = [WeakRetained browserController:self tabSnapshotContentProviderForTabDocument:v13];
  if (!v17)
  {
LABEL_15:
    v14[2](v14, 0);
    goto LABEL_16;
  }
  id v18 = objc_alloc_init(TabSnapshotGenerator);
  id v19 = [v16 tabSnapshotGeneratorDelegateForBrowserController:self];
  [(TabSnapshotGenerator *)v18 setDelegate:v19];

  if (![v13 isActive]
    || (objc_opt_respondsToSelector() & 1) != 0
    && [v17 checkAndResetIfNextSnapshotRequiresScreenUpdates])
  {
    a6 |= 0x20uLL;
  }
  if ([v13 isShowingSystemStartPage]
    && [(BrowserRootViewController *)self->_rootViewController usingLoweredBar])
  {
    a6 |= 0x40uLL;
  }
  if ([v13 isShowingSystemStartPage]) {
    a6 |= 0x20uLL;
  }
  id v20 = [TabSnapshotRequest alloc];
  id v21 = [v13 uuid];
  id v22 = -[TabSnapshotRequest initWithSize:topBackdropHeight:options:identifier:](v20, "initWithSize:topBackdropHeight:options:identifier:", a6, v21, width, height, a5);

  [(TabSnapshotGenerator *)v18 snapshotWithRequest:v22 contentProvider:v17 completion:v14];
LABEL_16:
}

- (BOOL)avoidSnapshotOfActiveTabIfPossible
{
  uint64_t v2 = [(TabController *)self->_tabController activeTabDocument];
  char v3 = [v2 isBlank];

  return v3;
}

- (void)_cancelContentScrollGestures
{
  if (a1)
  {
    [(id)*MEMORY[0x1E4FB2608] _cancelGestureRecognizersForView:*(void *)(a1 + 304)];
    -[BrowserController _catalogViewController]((id *)a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v2 cancelFavoritesGestures];
  }
}

- (id)makeTabOverview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = [WeakRetained createTabOverviewForBrowserController:self];
  }
  else
  {
    char v4 = -[TabOverview initWithFrame:]([TabOverview alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  }
  id v5 = v4;

  return v5;
}

- (void)tabCollectionViewWillPresent:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  id v5 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);

  if (!v5)
  {
    id v6 = [(BrowserController *)self createCatalogViewControllerIfNeeded];
    [WeakRetained browserController:self setCatalogViewController:v6];
  }
  int v7 = [(_SFWebView *)self->_webView firstResponder];
  [v7 resignFirstResponder];

  id v8 = [MEMORY[0x1E4F78558] settings];
  double v9 = [(BrowserController *)self UUID];
  [v8 setIsShowingTabView:1 forWindowWithUUID:v9];

  [(BrowserRootViewController *)self->_rootViewController tabCollectionViewWillPresent:v11];
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:self];
  -[BrowserController _cancelContentScrollGestures]((uint64_t)self);
  [WeakRetained browserControllerMakeKey:self];
  double v10 = +[MediaCaptureStatusBarManager sharedManager];
  [v10 browserControllerWillEnterTabView:self];

  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserControllerStartPageUpdatePolicyDidChange:self];
  }
}

- (void)tabCollectionViewWillDismiss:(id)a3
{
  id v7 = a3;
  char v4 = [MEMORY[0x1E4F78558] settings];
  id v5 = [(BrowserController *)self UUID];
  [v4 setIsShowingTabView:0 forWindowWithUUID:v5];

  [(BrowserRootViewController *)self->_rootViewController tabCollectionViewWillDismiss:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:self];
  [(UIScrollView *)self->_scrollView flashScrollIndicators];
  [WeakRetained browserControllerMakeKey:self];
}

- (void)tabCollectionViewDidDismiss:(id)a3
{
  id v9 = a3;
  char v4 = [(TabController *)self->_tabController activeTabDocument];
  if (-[BrowserController _wantsURLFieldAutoFocus](self) && [v4 isBlank])
  {
    id v5 = [v4 URL];
    if (v5)
    {
    }
    else
    {
      id v6 = [v4 libraryType];

      if (!v6) {
        [(BrowserController *)self setFavoritesFieldFocused:1 animated:1];
      }
    }
  }
  -[BrowserController _updateDigitalHealthOverlayAfterExitingTabSwitcher]((id *)&self->super.super.super.isa);
  [(BrowserRootViewController *)self->_rootViewController tabCollectionViewDidDismiss:v9];
  if (([(BrowserController *)self sf_inResponderChain] & 1) == 0) {
    [(BrowserController *)self becomeFirstResponder];
  }
  [v4 presentNextDialogIfNeeded];
  -[BrowserController _presentPendingViewControllerForActiveTab]((id *)&self->super.super.super.isa);
  id v7 = +[MediaCaptureStatusBarManager sharedManager];
  [v7 browserControllerWillExitTabView:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (![(BrowserController *)self isShowingFavorites]) {
    [WeakRetained browserController:self setCatalogViewController:0];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserControllerStartPageUpdatePolicyDidChange:self];
  }
  -[BrowserController _checkWebViewVisibilityAfterExitingTabView]((id *)&self->super.super.super.isa);
}

- (void)_updateDigitalHealthOverlayAfterExitingTabSwitcher
{
  if (a1)
  {
    if ([a1 isShowingFavorites])
    {
      id v5 = [a1[43] tabDocumentBeingActivated];
      -[BrowserController _hideDigitalHealthOverlayForTabDocument:](a1, v5);
    }
    else
    {
      id v2 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = [a1[43] activeTabDocument];
      char v3 = [a1[43] tabDocumentBeingActivated];
      char v4 = objc_msgSend(v2, "setWithObjects:", v5, v3, 0);
      -[BrowserController _updateDigitalHealthOverlayForTabDocuments:](a1, v4);
    }
  }
}

- (void)_checkWebViewVisibilityAfterExitingTabView
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Active web view does not match Reader state after exiting tab view", v2, v3, v4, v5, v6);
}

- (void)didCancelDismissingTabOverview
{
  uint64_t v3 = [MEMORY[0x1E4F78558] settings];
  uint64_t v4 = [(BrowserController *)self UUID];
  [v3 setIsShowingTabView:1 forWindowWithUUID:v4];

  rootViewController = self->_rootViewController;
  uint8_t v6 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  [(BrowserRootViewController *)rootViewController tabCollectionViewDidCancelDismissal:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained updateTabViewPinchRecognizerForBrowserController:self];

  -[BrowserController _cancelContentScrollGestures]((uint64_t)self);
}

- (id)borrowContentViewControllerForTab:(id)a3
{
  id v4 = a3;
  self->_BOOL contentBorrowedForTab = 1;
  if (objc_opt_respondsToSelector()) {
    [(_SFWebView *)self->_webView _exitFullScreenImmediately];
  }
  uint64_t v5 = [(BrowserRootViewController *)self->_rootViewController navigationBar];
  [v5 setBackdropGroupDisabled:1];

  [(BrowserRootViewController *)self->_rootViewController setDocumentSafeAreaInsetsFrozen:1];
  if ([v4 shouldObscureForDigitalHealth]) {
    -[BrowserController _insertScreenTimeLockoutShieldIntoContentViewForTab:animated:]((id *)&self->super.super.super.isa, v4, 1);
  }
  uint8_t v6 = [(BrowserRootViewController *)self->_rootViewController documentAndTopBarsContainerView];
  [v6 setHidden:0];
  id v7 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  id v8 = [v7 capsuleCollectionView];

  if (v8)
  {
    id v9 = [v8 lockdownStatusBar];
    if (v9 && [v8 layoutStyle] == 2)
    {
      [v9 bounds];
      objc_msgSend(v6, "convertRect:fromView:", v9);
      objc_msgSend(v9, "setFrame:");
      [v6 addSubview:v9];
    }
    double v10 = [v8 minimizedProgressView];
    [v10 bounds];
    objc_msgSend(v6, "convertRect:toView:", v10);
    objc_msgSend(v10, "setFrame:");
    [v6 addSubview:v10];
  }
  [v6 setUserInteractionEnabled:0];
  [v6 setUserInteractionEnabled:1];
  id v11 = [(BrowserRootViewController *)self->_rootViewController documentAndTopBarsContainerViewController];

  return v11;
}

- (void)_insertScreenTimeLockoutShieldIntoContentViewForTab:(uint64_t)a3 animated:
{
  id v5 = a2;
  if (a1)
  {
    id v11 = v5;
    uint8_t v6 = -[BrowserController _screenTimeHostingViewControllerForTabDocument:](a1, v5);
    id v7 = [v6 screenTimeOverlayViewController];
    uint64_t v8 = [v11 URL];
    id v9 = (void *)v8;
    if (v7 && v8)
    {
      id v10 = (id)objc_msgSend(v7, "showBlockingViewControllerForURL:withPolicy:animated:", v8, objc_msgSend(v11, "policy"), a3);
      [v6 displayHostedScreenTimeView];
    }

    id v5 = v11;
  }
}

- (id)borrowContentViewForTab:(id)a3 withTopBackdropView:(id *)a4 ofHeight:(double)a5
{
  id v7 = a3;
  id v30 = [(BrowserRootViewController *)self->_rootViewController topBar];
  uint64_t v8 = -[BrowserController tabContentContainerView]((id *)&self->super.super.super.isa);
  id v9 = [v7 view];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  id v11 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  objc_msgSend(v10, "setUserInteractionEnabled:", objc_msgSend(v11, "presentationState") == 3);

  double v12 = [v8 tintColor];
  [v10 setTintColor:v12];

  [v9 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  rootViewController = self->_rootViewController;
  id v20 = [(BrowserRootViewController *)rootViewController view];
  [(BrowserRootViewController *)rootViewController navigationBarFrameInCoordinateSpace:v20];
  double MaxY = CGRectGetMaxY(v32);

  objc_msgSend(v10, "setBounds:", v14, MaxY, v16, v18);
  if ([(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionViewStyle] == 1)
  {
    id v22 = [v10 layer];
    objc_msgSend(v22, "setAnchorPoint:", 0.5, 0.0);

    [v8 bounds];
    objc_msgSend(v10, "setCenter:", CGRectGetMidX(v33), 0.0);
  }
  [(BrowserRootViewController *)self->_rootViewController setClipperView:v10];
  id v23 = [(BrowserRootViewController *)self->_rootViewController view];
  [v23 addSubview:v10];

  if (-[BrowserController _shouldShowBackgroundViewForTabDocument:]((uint64_t)self, v7))
  {
    [v9 bounds];
    objc_msgSend(v9, "convertRect:toView:", v10);
    char v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v14, CGRectGetMaxY(v34), v16, 100000.0);
    char v25 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [v24 setBackgroundColor:v25];

    [v10 addSubview:v24];
  }
  else
  {
    char v24 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_defaultWebContentBackgroundColor");
    [v10 setBackgroundColor:v24];
  }

  if (a4) {
    *a4 = v30;
  }
  __int16 v26 = [(BrowserController *)self borrowContentViewControllerForTab:v7];
  double v27 = [v26 view];
  [v10 addSubview:v27];

  double v28 = [(BrowserRootViewController *)self->_rootViewController bottomToolbar];
  if ([(BrowserRootViewController *)self->_rootViewController toolbarPlacement] == 1 && v28)
  {
    [v28 _setSafeAreaInsetsFrozen:1];
    [v10 addSubview:v28];
  }

  return v10;
}

- (void)reinsertBorrowedContentViewForTab:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  self->_BOOL contentBorrowedForTab = 0;
  if (objc_opt_respondsToSelector()) {
    [(_SFWebView *)self->_webView _exitFullScreenImmediately];
  }
  id v4 = [(BrowserRootViewController *)self->_rootViewController navigationBar];
  [v4 setBackdropGroupDisabled:0];

  [(BrowserRootViewController *)self->_rootViewController setDocumentSafeAreaInsetsFrozen:0];
  id v5 = [(BrowserRootViewController *)self->_rootViewController documentAndTopBarsContainerView];
  uint64_t v6 = 928;
  __int16 v26 = v5;
  id v7 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  double v28 = v7;
  objc_msgSend(v5, "setHidden:", objc_msgSend(v7, "presentationState") != 0);
  BOOL v8 = [(BrowserRootViewController *)self->_rootViewController isShowingSidebar];
  id v9 = [(BrowserRootViewController *)self->_rootViewController bottomToolbar];
  char v25 = v9;
  [v9 _setSafeAreaInsetsFrozen:0];
  if ((SFEnhancedTabOverviewEnabled() & 1) != 0 || !SFTabGroupSwitcherEnabled())
  {
    uint64_t v10 = [v7 view];
  }
  else
  {
    uint64_t v10 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabViewContainerView];
  }
  id v11 = (void *)v10;
  long long v29 = [(BrowserRootViewController *)self->_rootViewController documentAndTopBarsContainerViewController];
  double v27 = v11;
  double v12 = [v29 parentViewController];
  double v13 = [(BrowserRootViewController *)self->_rootViewController contentContainerViewController];

  if (v12 != v13)
  {
    uint64_t v6 = [(BrowserRootViewController *)self->_rootViewController contentContainerViewController];
    [(id)v6 addChildViewController:v29];
  }
  double v14 = [v11 superview];
  if (v14) {
    double v15 = v11;
  }
  else {
    double v15 = 0;
  }
  v30[0] = v15;
  v30[1] = v5;
  v30[2] = v9;
  if (v8)
  {
    id v5 = [(BrowserRootViewController *)self->_rootViewController sidebarContentDimmingView];
    id v31 = v5;
    uint64_t v6 = [(BrowserRootViewController *)self->_rootViewController sidebarViewController];
    double v16 = [(id)v6 view];
  }
  else
  {
    double v16 = 0;
    id v31 = 0;
  }
  CGRect v32 = v16;
  double v17 = +[FeatureManager sharedFeatureManager];
  if ([v17 isFloatingSidebarButtonEnabled])
  {
    id v33 = [(BrowserRootViewController *)self->_rootViewController floatingSidebarButton];
  }
  else
  {
    id v33 = 0;
  }

  if (v8)
  {
  }
  double v18 = [(BrowserRootViewController *)self->_rootViewController contentContainerView];
  objc_msgSend(v18, "_sf_setOrderedSubviews:count:", v30, 6);

  if (v12 != v13)
  {
    id v19 = [(BrowserRootViewController *)self->_rootViewController contentContainerViewController];
    [v29 didMoveToParentViewController:v19];
  }
  id v20 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  id v21 = [v20 capsuleCollectionView];
  [v21 reattachControls];

  id v22 = [(BrowserRootViewController *)self->_rootViewController view];
  [v22 setNeedsLayout];

  [(BrowserController *)self updateExposedScrollViewRect];
  if (self->_wantsUnifiedFieldFocused && -[BrowserController _wantsURLFieldAutoFocus](self))
  {
    id v23 = [(BrowserRootViewController *)self->_rootViewController primaryNavigationBar];
    char v24 = [v23 textField];
    [v24 becomeFirstResponder];
  }
}

- (void)_navigationGestureDidBegin
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 384));
    [WeakRetained browserControllerWillBeginNavigationGesture:a1];

    uint64_t v3 = [*(id *)(a1 + 344) activeTabDocument];
    [v3 freezeForNavigationGesture];

    id v4 = [*(id *)(a1 + 280) dynamicBarAnimator];
    *(void *)(a1 + 416) = [v4 state];

    *(unsigned char *)(a1 + 377) = 1;
    id v5 = [*(id *)(a1 + 344) activeTabDocument];
    uint64_t v6 = [v5 appBanner];
    id v7 = [v6 overlayProvider];

    [v7 webViewBackforwardGestureNavigationWillBegin];
  }
}

- (void)_navigationGestureWillEndWithNavigationToBackForwardListItem:(uint64_t)a1
{
  id v6 = a2;
  if (a1)
  {
    -[BrowserController _presentReaderTriggeredAppReviewPromptIfNeeded](a1);
    if (v6)
    {
      uint64_t v3 = [*(id *)(a1 + 344) activeTabDocument];
      int v4 = [v3 mustShowBarsForBackForwardListItem:v6];

      if (v4) {
        [(id)a1 showBars];
      }
    }
    else
    {
      id v5 = [*(id *)(a1 + 280) dynamicBarAnimator];
      [v5 attemptTransitionToState:*(void *)(a1 + 416) animated:1];
    }
  }
}

- (void)_navigationGestureDidEndWithNavigation:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 384));
    [WeakRetained browserControllerDidEndNavigationGesture:a1];

    id v8 = [*(id *)(a1 + 344) activeTabDocument];
    int v4 = [v8 appBanner];
    id v5 = [v4 overlayProvider];

    [v5 webViewBackforwardGestureNavigationDidEnd];
    if (a2)
    {
      id v6 = [v8 appBanner];

      if (v6) {
        [(id)a1 removeAppBannerFromTabDocument:v8 animated:0];
      }
    }
    [v8 unfreezeAfterNavigationGesture:a2];
    *(unsigned char *)(a1 + 377) = 0;
  }
}

- (void)updatePullToRefreshIsEnabled
{
  BOOL v3 = ![(BrowserRootViewController *)self->_rootViewController isInYttriumMode]
    && ![(BrowserController *)self isShowingReader]
    && !-[BrowserController _isInContinuousMode]((uint64_t)self)
    && ![(UIScrollView *)self->_scrollView isZooming]
    && [(_SFWebView *)self->_webView fullscreenState] == 0;
  rootViewController = self->_rootViewController;
  [(BrowserRootViewController *)rootViewController setPullToRefreshIsEnabled:v3];
}

- (void)clearContinuousItemDocuments
{
  -[BrowserController _clearNextContinuousItemDocument]((uint64_t)self);
  -[BrowserController _clearPreviousContinuousItemDocument]((uint64_t)self);
}

- (void)didChangeContinuousReadingItemInActiveDocument
{
  BOOL v3 = -[BrowserController _sidebarViewController]((uint64_t)self);
  id v4 = [v3 topReadingListViewController];

  [v4 updateAndScrollToCurrentSelectedItemIfNeeded:1];
  [(BrowserController *)self updatePullToRefreshIsEnabled];
}

- (void)updateFocusForTab:(id)a3 webViewCanTakeFocus:(BOOL)a4
{
  id v18 = a3;
  id v6 = [(TabController *)self->_tabController activeTabDocument];
  id v7 = [v6 uuid];
  id v8 = [v18 uuid];
  char v9 = WBSIsEqual();

  if ((v9 & 1) == 0
    || [(BrowserController *)self isFavoritesFieldFocused]
    || -[BrowserController _hasPresentedViewController](self))
  {
    goto LABEL_19;
  }
  int isWindowLockedForPrivate = -[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self);
  if (self->_webView)
  {
    int v11 = isWindowLockedForPrivate;
    id v12 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    if ([v12 presentationState] == 1)
    {
    }
    else
    {
      uint64_t v14 = [v12 presentationState];

      if (v14 != 2)
      {
        int v13 = ([v6 isShowingSystemStartPage] | v11) ^ 1;
        goto LABEL_11;
      }
    }
    int v13 = 0;
LABEL_11:

    goto LABEL_12;
  }
  int v13 = 0;
LABEL_12:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  double v16 = [WeakRetained focusSystem];
  if (v16)
  {

    if ((v13 & a4 & 1) == 0)
    {
      double v17 = [(BrowserController *)self parentFocusEnvironment];
      [v17 setNeedsFocusUpdate];

      goto LABEL_19;
    }
  }
  else
  {
  }
  if (v13) {
    [(_SFWebView *)self->_webView becomeFirstResponder];
  }
  else {
    [(BrowserController *)self becomeFirstResponder];
  }
LABEL_19:
}

- (id)undoManager
{
  if (self->_overridesUndoManagerForClosedTabs)
  {
    uint64_t v2 = [(TabController *)self->_tabController undoManager];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)BrowserController;
    uint64_t v2 = [(BrowserController *)&v4 undoManager];
  }
  return v2;
}

- (NSArray)preferredFocusEnvironments
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  objc_super v4 = [WeakRetained browserControllerPreferredFocusEnvironments:self];

  return (NSArray *)v4;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  objc_super v4 = [WeakRetained browserControllerParentFocusEnvironment:self];

  return (UIFocusEnvironment *)v4;
}

- (UIFocusItemContainer)focusItemContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  objc_super v4 = [WeakRetained browserControllerFocusItemContainer:self];

  return (UIFocusItemContainer *)v4;
}

- (void)setNeedsFocusUpdate
{
  id v3 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  id v2 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)setActiveProfileIdentifier:(id)a3
{
  id v19 = a3;
  objc_super v4 = [(BrowserController *)self activeProfileIdentifier];
  char v5 = [v4 isEqualToString:v19];

  if ((v5 & 1) == 0)
  {
    [(BrowserController *)self clearContinuousItemDocuments];
    [(BrowserController *)self clearSpeculativeLoadDocument];
    id v6 = [(BrowserController *)self activeProfile];
    id v7 = [v6 identifier];

    [(TabController *)self->_tabController willSelectProfileWithIdentifier:v19];
    [(WBProfileWindow *)self->_profileWindow setActiveProfileIdentifier:v19];
    [(TabController *)self->_tabController didSelectProfileWithIdentifier:v19 previousProfileIdentifier:v7];
    id v8 = [(LibraryController *)self->_libraryController sidebarViewController];
    [v8 setNeedsReloadForProfileSwitcher];

    char v9 = [(LibraryController *)self->_libraryController sidebarViewController];
    uint64_t v10 = [v9 presentedItemController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v12 = [(LibraryController *)self->_libraryController sidebarViewController];
      int v13 = [v12 navigationController];
      id v14 = (id)[v13 popToRootViewControllerAnimated:0];
    }
    double v15 = [(BrowserRootViewController *)self->_rootViewController bookmarksBar];
    [v15 setNeedsReloadData];

    -[BrowserController _prepareExtensionsForEffectiveProfile](self);
    double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:@"ProfileDidChange" object:self];

    double v17 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v18 = [(BrowserController *)self activeProfileIdentifier];
    [v17 setObject:v18 forKey:*MEMORY[0x1E4F78700]];
  }
}

- (id)existingUnnamedTabGroupForProfileWithIdentifier:(id)a3
{
  id v3 = [(WBProfileWindow *)self->_profileWindow existingUnnamedTabGroupForProfileWithIdentifier:a3];
  return v3;
}

- (void)willSelectTabGroupWithUUID:(id)a3
{
}

- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5
{
  id v25 = a4;
  id v7 = a5;
  id v8 = [(BrowserController *)self activeProfileIdentifier];
  char v9 = [v8 isEqualToString:v25];

  if ((v9 & 1) == 0) {
    goto LABEL_23;
  }
  if ([(BrowserController *)self hasMultipleProfiles])
  {
    uint64_t v10 = [(TabController *)self->_tabController activeTabGroup];
    int v11 = [v10 isNamed] ^ 1;
  }
  else
  {
    int v11 = 0;
  }
  profileTitleInScene = self->_profileTitleInScene;
  int v13 = [(BrowserController *)self activeProfile];
  id v14 = [v13 title];
  if ([(NSString *)profileTitleInScene isEqualToString:v14]
    && ((double v15 = self->_profileTitleInScene) == 0 ? (v16 = 1) : (v16 = v11), v16 == 1))
  {
    if (v15) {
      char v17 = 0;
    }
    else {
      char v17 = v11;
    }

    if ((v17 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  -[BrowserController _updateSceneTitle]((uint64_t)self);
LABEL_17:
  if (([v7 result] & 3) != 0 || !objc_msgSend(v7, "result")) {
    [(TabController *)self->_tabController updateSelectedTabGroupName];
  }
  id v18 = [(BrowserController *)self activeProfile];
  id v19 = [v18 customFavoritesFolderServerID];
  id v20 = [(BrowserRootViewController *)self->_rootViewController bookmarksBar];
  id v21 = [v20 currentRootBookmark];
  id v22 = [v21 serverID];
  char v23 = WBSIsEqual();

  if ((v23 & 1) == 0 && ([v7 result] & 4) != 0)
  {
    char v24 = [(BrowserRootViewController *)self->_rootViewController bookmarksBar];
    [v24 setNeedsReloadData];
  }
LABEL_23:
}

- (uint64_t)_currentlyEditingText
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 344) activeTabDocument];
  id v2 = [v1 webView];
  if (objc_msgSend(v2, "sf_inResponderChain"))
  {
    uint64_t v3 = [v1 hasFormControlInteraction];
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4FB1900] activeInstance];
    char v5 = [v4 inputDelegate];
    uint64_t v3 = v5 != 0;
  }
  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  int isWindowLockedForPrivate = -[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [MEMORY[0x1E4F781F8] sharedProvider];
    if ([v8 commandConflictsWithTextEditing:v6])
    {
      char v9 = -[BrowserController _currentlyEditingText]((uint64_t)self);

      if (v9) {
        goto LABEL_34;
      }
    }
    else
    {
    }
  }
  id v10 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  BOOL v11 = [v10 presentationState] == 1 || objc_msgSend(v10, "presentationState") == 2;

  if (sel_focusAddressFieldKeyPressed == a3 || sel_focusAddressFieldAlternativeKeyPressed == a3)
  {
    if (!v11)
    {
LABEL_35:
      int v16 = [(BrowserController *)self activeLibraryType];
      if (v16) {
        LOBYTE(v15) = 0;
      }
      else {
        LOBYTE(v15) = isWindowLockedForPrivate ^ 1;
      }
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  if (sel_toggleBookmarksKeyPressed == a3 || sel_editBookmarksKeyPressed == a3)
  {
    LOBYTE(v17) = v11 | isWindowLockedForPrivate;
    goto LABEL_40;
  }
  if (sel_toggleShowingFavoritesBarKeyPressed == a3)
  {
    if (!v11)
    {
      id v18 = -[BrowserController contentContainerView]((id *)&self->super.super.super.isa);
      [v18 bounds];
      double v20 = v19;
      char IsPad = _SFDeviceIsPad();
      if (v20 > *MEMORY[0x1E4F787F8]) {
        char v22 = IsPad;
      }
      else {
        char v22 = 0;
      }
      LOBYTE(v15) = v22 & (isWindowLockedForPrivate ^ 1);
      goto LABEL_59;
    }
    goto LABEL_34;
  }
  if (sel_reloadKeyPressed == a3 || sel_reloadFromOriginKeyPressed == a3 || sel_takeFindStringKeyPressed == a3)
  {
    char isReaderModeFormatMenuItem = -[BrowserController _showingTabDocumentWithURL]((uint64_t)self);
    goto LABEL_47;
  }
  if (sel_printKeyPressed == a3)
  {
    if (v11) {
      goto LABEL_34;
    }
    id v18 = [(TabController *)self->_tabController activeTabDocument];
    char v24 = -[BrowserController _canPrintForTabDocument:]((uint64_t)self, v18);
LABEL_58:
    LOBYTE(v15) = v24 & (isWindowLockedForPrivate ^ 1);
    goto LABEL_59;
  }
  if (sel_find_ == a3)
  {
    if (![(BrowserController *)self canFindOnPage])
    {
      int CanSearch = -[BrowserController _tabViewCanSearchTabs]((uint64_t)self);
      goto LABEL_52;
    }
LABEL_53:
    LOBYTE(v15) = isWindowLockedForPrivate ^ 1;
    goto LABEL_60;
  }
  if (sel_navigateBackKeyPressed == a3)
  {
    if (v11) {
      goto LABEL_34;
    }
    id v18 = [(TabController *)self->_tabController activeTabDocument];
    char v24 = [v18 canGoBack];
    goto LABEL_58;
  }
  if (sel_navigateForwardKeyPressed == a3)
  {
    if (v11) {
      goto LABEL_34;
    }
    id v18 = [(TabController *)self->_tabController activeTabDocument];
    char v24 = [v18 canGoForward];
    goto LABEL_58;
  }
  if (sel_toggleReaderKeyPressed == a3)
  {
    char isReaderModeFormatMenuItem = -[BrowserController _isReaderModeFormatMenuItemAvailable]((uint64_t)self);
    goto LABEL_47;
  }
  if (sel_closeActiveTab_ == a3)
  {
    char isReaderModeFormatMenuItem = [(TabController *)self->_tabController canCloseTab];
    goto LABEL_47;
  }
  if (sel_closeOtherTabsKeyPressed == a3)
  {
    char isReaderModeFormatMenuItem = [(TabController *)self->_tabController canCloseOtherTabs];
    goto LABEL_47;
  }
  if (sel_nextTabKeyPressed_ != a3 && sel_previousTabKeyPressed_ != a3 && sel_switchToTabKeyPressed_ != a3)
  {
    if (sel_addToBookmarks_ == a3)
    {
      char isReaderModeFormatMenuItem = [(BrowserController *)self canAddToBookmarks];
    }
    else
    {
      if (sel_addToReadingList_ != a3)
      {
        if (sel_previousReadingListItemKeyPressed == a3)
        {
          if (v11 || !-[BrowserController _isInContinuousMode]((uint64_t)self)) {
            goto LABEL_34;
          }
          id v18 = [(BrowserController *)self continuousReadingController];
          double v27 = [v18 previousReadingListItem];
        }
        else
        {
          if (sel_nextReadingListItemKeyPressed != a3)
          {
            int v12 = [(_SFBarManager *)self->_barManager isBarItemEnabled:7];
            int v67 = isWindowLockedForPrivate ^ 1;
            if (SFEnhancedTabOverviewEnabled())
            {
              tabController = self->_tabController;
              id v14 = [(TabController *)tabController activeTabGroupOrTabGroupVisibleInSwitcher];
              int v15 = [(TabController *)tabController canAddNewTabInTabGroup:v14] & v67;
            }
            else
            {
              int v15 = v12 & (isWindowLockedForPrivate ^ 1);
            }
            if (sel_reopenLastClosedTabPressed == a3)
            {
              if (!v15) {
                goto LABEL_60;
              }
              if ([(BrowserController *)self isPrivateBrowsingEnabled]) {
                goto LABEL_34;
              }
              int v16 = -[BrowserController _lastClosedTabStateData](self);
              LOBYTE(v15) = v16 != 0;
LABEL_38:

              goto LABEL_60;
            }
            if (sel_openNewTab_ != a3)
            {
              if (sel_newTabAlternativeKeyPressed == a3) {
                goto LABEL_60;
              }
              BOOL v28 = !v11;
              if (sel_openNewPrivateTab_ == a3)
              {
                if ([(BrowserController *)self isPrivateBrowsingAvailable]
                  && [(TabController *)self->_tabController canAddNewTabForPrivateBrowsing:1])
                {
                  objc_opt_class();
                  LOBYTE(v15) = (objc_opt_isKindOfClass() | v28) & v67;
                  goto LABEL_60;
                }
                goto LABEL_34;
              }
              long long v29 = (char *)a3;
              if (sel_toggleTabViewKeyPressed != a3)
              {
                id v30 = +[FeatureManager sharedFeatureManager];
                id v31 = v30;
                if (sel_newTabGroupKeyPressed == v29
                  || sel_previousTabGroupKeyPressed == v29
                  || sel_nextTabGroupKeyPressed == v29)
                {
                  LOBYTE(v67) = [v30 isCustomTabGroupsEnabled];
                  goto LABEL_147;
                }
                if (sel_closeTabGroupKeyPressed == v29 || sel_renameTabGroupKeyPressed == v29)
                {
                  int v39 = SFEnhancedTabOverviewEnabled();
                  uint64_t v40 = self->_tabController;
                  if (!v39)
                  {
                    char canSave = [(TabController *)v40 canRenameActiveTabGroup];
                    goto LABEL_142;
                  }
                  id v41 = [(TabController *)v40 activeTabGroupOrTabGroupVisibleInSwitcher];
                  char v42 = [v41 isNamed];
                }
                else
                {
                  if (sel_emptySelectorForOpenInNewTabModifierLinkTap == v29
                    || sel_emptySelectorForOpenInNewTabOppositePreferenceModifierLinkTap == v29)
                  {
                    LOBYTE(v45) = v28 & v15;
                    goto LABEL_146;
                  }
                  if (sel_emptySelectorForAddLinkToReadingListModifierLinkTap != v29)
                  {
                    if (sel_emptySelectorForDownloadModifierLinkTap == v29) {
                      goto LABEL_145;
                    }
                    if (sel_showBookmarksCollectionKeyPressed == v29)
                    {
                      id v41 = +[FeatureManager sharedFeatureManager];
                      char v42 = [v41 isBookmarksAvailable];
                    }
                    else
                    {
                      if (sel_showReadingListCollectionKeyPressed != v29)
                      {
                        if (sel_showHistoryCollectionKeyPressed != v29
                          && sel_showHistoryCollectionAlternativeKeyPressed != v29)
                        {
                          if (sel_showSharedWithYouCollectionKeyPressed != v29)
                          {
                            if (sel_showCloudTabsCollectionKeyPressed == v29)
                            {
                              id v41 = +[CloudTabStore sharedCloudTabStore];
                              double v47 = [v41 syncedCloudTabDevices];
                              uint64_t v48 = [v47 count];
                              goto LABEL_155;
                            }
                            if (sel_toggleShowWebpageStatusBar != v29)
                            {
                              if (sel_emailCurrentPage == v29)
                              {
                                if (CPCanSendMail()) {
                                  char v50 = v11;
                                }
                                else {
                                  char v50 = 1;
                                }
                                if (v50) {
                                  goto LABEL_144;
                                }
                                goto LABEL_164;
                              }
                              if (sel_increaseSize_ == v29
                                || sel_decreaseSize_ == v29
                                || sel_resetPageZoomLevelAndFontSize == v29)
                              {
                                if (v11) {
                                  goto LABEL_144;
                                }
                                id v41 = [(TabController *)self->_tabController activeTabDocument];
                                double v51 = [v41 URL];
                                goto LABEL_167;
                              }
                              if (sel_toggleDownloadsKeyPressed != v29)
                              {
                                if (sel_saveKeyPressed != v29 && sel_saveWebpageAlternativeKeyPressed != v29)
                                {
                                  if (sel_autoFillFormKeyPressed != v29)
                                  {
                                    CGRect v32 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
                                    id v33 = [v32 searchController];
                                    uint64_t v34 = [v33 searchTerm];
                                    uint64_t v35 = [v34 length];

                                    if (sel_closeAllTabsMatchingSearch_ == v29)
                                    {
                                      if (!v35) {
                                        goto LABEL_144;
                                      }
                                      id v41 = [(TabController *)self->_tabController tabsMatchingSearchTerm];
                                      uint64_t v53 = [v41 count];
                                      LOBYTE(v44) = v67;
                                      if (!v53) {
                                        LOBYTE(v44) = 0;
                                      }
LABEL_138:
                                      LOBYTE(v67) = v44;
LABEL_139:

                                      goto LABEL_147;
                                    }
                                    unint64_t v36 = [(TabController *)self->_tabController numberOfTabsForCloseAllAction];
                                    if (sel_closeAllTabs_ == v29)
                                    {
                                      if (!v35)
                                      {
                                        if (v36) {
                                          char v54 = v11;
                                        }
                                        else {
                                          char v54 = 0;
                                        }
                                        if (v36 > 1) {
                                          char v54 = 1;
                                        }
                                        LOBYTE(v67) = v54 & v67;
                                        goto LABEL_147;
                                      }
                                      goto LABEL_144;
                                    }
                                    if (sel_addAllTabsToBookmarks_ == v29)
                                    {
                                      id v55 = +[FeatureManager sharedFeatureManager];
                                      if (![v55 isBookmarksAvailable])
                                      {
                                        LOBYTE(v67) = 0;
                                        goto LABEL_195;
                                      }
                                      int v56 = -[BrowserController _nonBlankCurrentTabs]((uint64_t)self);
                                      unint64_t v57 = [v56 count];
                                      BOOL v58 = v67;
                                      if (v57 <= 1) {
                                        BOOL v58 = 0;
                                      }
LABEL_190:
                                      LOBYTE(v67) = v58;

LABEL_195:
                                      goto LABEL_147;
                                    }
                                    CGRect v37 = [MEMORY[0x1E4FB1438] sharedApplication];
                                    int v38 = [v37 supportsMultipleScenes];

                                    if (sel_openNewWindow_ == v29) {
                                      goto LABEL_191;
                                    }
                                    if (sel_openNewPrivateWindow_ == v29)
                                    {
                                      if (v38)
                                      {
                                        if ([(BrowserController *)self isPrivateBrowsingAvailable])
                                        {
                                          if (self->_privateBrowsingEnabled) {
                                            goto LABEL_147;
                                          }
                                          objc_opt_class();
                                          if (objc_opt_isKindOfClass()) {
                                            goto LABEL_147;
                                          }
                                        }
                                      }
                                      goto LABEL_144;
                                    }
                                    if (sel_mergeAllWindows_ == v29)
                                    {
                                      if (v38)
                                      {
                                        v59 = [MEMORY[0x1E4FB1438] sharedApplication];
                                        uint64_t v60 = [v59 openSessions];
                                        if ((unint64_t)[v60 count] < 2)
                                        {
                                          LOBYTE(v67) = 0;
                                        }
                                        else
                                        {
                                          uint64_t v61 = [(BrowserController *)self browserWindowController];
                                          v62 = [v61 browserControllers];
                                          BOOL v63 = (unint64_t)[v62 count] > 1 && v35 == 0;
                                          char v64 = v67;
                                          if (!v63) {
                                            char v64 = 0;
                                          }
                                          LOBYTE(v67) = v64;
                                        }
                                        goto LABEL_147;
                                      }
                                      goto LABEL_144;
                                    }
                                    if (sel_shareCurrentTabURL_ != v29)
                                    {
                                      if (sel_pasteAndGo_ != v29 && sel_pasteAndSearch_ != v29)
                                      {
                                        if (sel_performWebExtensionCommandForKeyCommand_ == v29)
                                        {
LABEL_147:

                                          LOBYTE(v15) = v67;
                                          goto LABEL_60;
                                        }
                                        if (sel_switchToProfileKeyPressed_ != v29)
                                        {
                                          if (sel_openNewWindowInFrontmostProfile_ != v29)
                                          {
                                            if (sel_scribbleDoneKeyPressed != v29)
                                            {
                                              v68.receiver = self;
                                              v68.super_class = (Class)BrowserController;
                                              LOBYTE(v67) = [(BrowserController *)&v68 canPerformAction:v29 withSender:v6];
                                              goto LABEL_147;
                                            }
                                            id v41 = [(TabController *)self->_tabController activeTabDocument];
                                            double v47 = [v41 sfScribbleControllerIfLoaded];
                                            LOBYTE(v67) = [v47 isScribbling];
                                            goto LABEL_158;
                                          }
LABEL_191:
                                          if (v38)
                                          {
                                            if (self->_privateBrowsingEnabled)
                                            {
                                              objc_opt_class();
                                              LOBYTE(v67) = objc_opt_isKindOfClass();
                                              goto LABEL_147;
                                            }
                                            LOBYTE(v45) = 1;
                                            goto LABEL_146;
                                          }
LABEL_144:
                                          LOBYTE(v67) = 0;
                                          goto LABEL_147;
                                        }
                                        if (![(BrowserController *)self hasMultipleProfiles]) {
                                          goto LABEL_144;
                                        }
                                        objc_opt_class();
                                        if ((objc_opt_isKindOfClass() & 1) == 0) {
                                          goto LABEL_144;
                                        }
                                        id v55 = v6;
                                        int v65 = [v55 propertyList];
                                        unint64_t v66 = [v65 integerValue];

                                        int v56 = [(TabController *)self->_tabController profiles];
                                        BOOL v58 = v66 < [v56 count];
                                        goto LABEL_190;
                                      }
                                      objc_opt_class();
                                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                                        goto LABEL_144;
                                      }
                                      id v41 = [MEMORY[0x1E4FB1A78] generalPasteboard];
                                      char v42 = objc_msgSend(v41, "safari_canPasteAndNavigate");
                                      goto LABEL_136;
                                    }
                                    id v41 = [(TabController *)self->_tabController activeTabDocument];
                                    double v51 = [v41 urlForSharing];
LABEL_167:
                                    char v52 = v67;
                                    if (!v51) {
                                      char v52 = 0;
                                    }
                                    LOBYTE(v67) = v52;

                                    goto LABEL_139;
                                  }
                                  if (v11) {
                                    goto LABEL_144;
                                  }
LABEL_164:
                                  id v41 = [(TabController *)self->_tabController activeTabDocument];
                                  int v44 = ([v41 isBlank] | isWindowLockedForPrivate) ^ 1;
                                  goto LABEL_138;
                                }
                                if (v11) {
                                  goto LABEL_144;
                                }
                                char canSave = -[BrowserController _canSaveWebpage]((uint64_t)self);
                                goto LABEL_142;
                              }
                              if (v11) {
                                goto LABEL_144;
                              }
                              id v41 = [MEMORY[0x1E4F3AF68] sharedManager];
                              double v47 = [v41 downloads];
                              uint64_t v48 = [v47 count];
LABEL_155:
                              char v49 = v67;
                              if (!v48) {
                                char v49 = 0;
                              }
                              LOBYTE(v67) = v49;
LABEL_158:

                              goto LABEL_139;
                            }
                            char canSave = [MEMORY[0x1E4F78290] supportsWebpageStatusBar];
LABEL_142:
                            LOBYTE(v45) = canSave & v67;
                            goto LABEL_146;
                          }
                          if (v11) {
                            goto LABEL_144;
                          }
                          int v45 = ([(BrowserController *)self isPresentingModalBookmarksController] | isWindowLockedForPrivate) ^ 1;
LABEL_146:
                          LOBYTE(v67) = v45;
                          goto LABEL_147;
                        }
LABEL_145:
                        LOBYTE(v45) = v28 & v67;
                        goto LABEL_146;
                      }
                      id v41 = +[FeatureManager sharedFeatureManager];
                      char v42 = [v41 isReadingListAvailable];
                    }
                    char v43 = (v11 | isWindowLockedForPrivate) ^ 1;
                    goto LABEL_137;
                  }
                  if (v11) {
                    goto LABEL_144;
                  }
                  id v41 = +[FeatureManager sharedFeatureManager];
                  char v42 = [v41 isReadingListAvailable];
                }
LABEL_136:
                char v43 = v67;
LABEL_137:
                LOBYTE(v44) = v42 & v43;
                goto LABEL_138;
              }
              goto LABEL_35;
            }
            if (!v15) {
              goto LABEL_60;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              LOBYTE(v15) = 1;
              goto LABEL_60;
            }
            int v17 = [(BrowserController *)self isPrivateBrowsingEnabled] || v11;
LABEL_40:
            LOBYTE(v15) = v17 ^ 1;
            goto LABEL_60;
          }
          if (v11 || !-[BrowserController _isInContinuousMode]((uint64_t)self)) {
            goto LABEL_34;
          }
          id v18 = [(BrowserController *)self continuousReadingController];
          double v27 = [v18 nextReadingListItem];
        }
        if (v27) {
          LOBYTE(v15) = isWindowLockedForPrivate ^ 1;
        }
        else {
          LOBYTE(v15) = 0;
        }

LABEL_59:
        goto LABEL_60;
      }
      char isReaderModeFormatMenuItem = [(BrowserController *)self canAddToReadingList];
    }
LABEL_47:
    LOBYTE(v15) = isReaderModeFormatMenuItem & (isWindowLockedForPrivate ^ 1);
    goto LABEL_60;
  }
  if (!v11) {
    goto LABEL_53;
  }
  int CanSearch = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabViewDefersActivation];
LABEL_52:
  if (CanSearch) {
    goto LABEL_53;
  }
LABEL_34:
  LOBYTE(v15) = 0;
LABEL_60:

  return v15 & 1;
}

- (BOOL)_showingTabDocumentWithURL
{
  if (!a1) {
    return 0;
  }
  id v2 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
  if ([v2 presentationState] == 1)
  {
    BOOL v3 = 0;
    objc_super v4 = v2;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v5 = [v2 presentationState];

  if (v5 != 2)
  {
    objc_super v4 = [*(id *)(a1 + 344) activeTabDocument];
    id v6 = [v4 URL];
    BOOL v3 = v6 != 0;

    goto LABEL_7;
  }
  BOOL v3 = 0;
LABEL_8:

  return v3;
}

- (uint64_t)_canPrintForTabDocument:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    int isWindowLockedForPrivate = -[BrowserController _isWindowLockedForPrivateBrowsing](a1);
    uint64_t v5 = [v3 URL];
    if (v5) {
      uint64_t v6 = ([v3 shouldObscureForDigitalHealth] | isWindowLockedForPrivate) ^ 1;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_tabViewCanSearchTabs
{
  if (!a1) {
    return 0;
  }
  id v1 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
  BOOL v2 = [v1 presentationState] == 1 || objc_msgSend(v1, "presentationState") == 2;

  return v2;
}

- (uint64_t)_isReaderModeFormatMenuItemAvailable
{
  if (!a1) {
    return 0;
  }
  int isWindowLockedForPrivate = -[BrowserController _isWindowLockedForPrivateBrowsing](a1);
  id v3 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
  if ([v3 presentationState] == 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v6 = [v3 presentationState];

  if (v6 != 2)
  {
    uint64_t v5 = [*(id *)(a1 + 344) activeTabDocument];
    uint64_t v4 = [v5 canShowPageFormatMenu] & (isWindowLockedForPrivate ^ 1);
    goto LABEL_7;
  }
  uint64_t v4 = 0;
LABEL_8:

  return v4;
}

- (id)_lastClosedTabStateData
{
  if (a1)
  {
    BOOL v2 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
    id v3 = [a1 tabController];
    uint64_t v4 = [v3 activeProfile];
    uint64_t v5 = [v4 identifier];
    uint64_t v6 = [v2 recentlyClosedTabsForProfileWithIdentifier:v5];
    id v7 = [v6 firstObject];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (uint64_t)_canSaveWebpage
{
  if (!a1 || *(void *)(a1 + 296) || (-[BrowserController _isWindowLockedForPrivateBrowsing](a1) & 1) != 0) {
    return 0;
  }
  uint64_t v4 = [*(id *)(a1 + 344) activeTabDocument];
  if ([v4 shouldObscureForDigitalHealth]) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = [v4 isBlank] ^ 1;
  }

  return v2;
}

- (id)_nonBlankCurrentTabs
{
  if (a1)
  {
    id v1 = [*(id *)(a1 + 344) currentTabs];
    uint64_t v2 = objc_msgSend(v1, "safari_filterObjectsUsingBlock:", &__block_literal_global_918);
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (void)performWebExtensionCommandForKeyCommand:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(TabController *)self->_tabController activeTabDocument];
    uint64_t v5 = [v4 webExtensionsController];
    [v5 performCommandForKeyCommand:v6];
  }
}

- (BOOL)canAddToBookmarks
{
  int isWindowLockedForPrivate = -[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self);
  uint64_t v4 = +[FeatureManager sharedFeatureManager];
  if ([v4 isBookmarksAvailable])
  {
    id v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    if ([v5 presentationState] == 1)
    {
      LOBYTE(v6) = 0;
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = [v5 presentationState];

      if (v8 == 2)
      {
        LOBYTE(v6) = 0;
LABEL_9:

        goto LABEL_10;
      }
      id v7 = [(TabController *)self->_tabController activeTabDocument];
      int v6 = ([v7 isBlank] | isWindowLockedForPrivate) ^ 1;
    }

    goto LABEL_9;
  }
  LOBYTE(v6) = 0;
LABEL_10:

  return v6;
}

- (BOOL)canAddToReadingList
{
  int isWindowLockedForPrivate = -[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self);
  uint64_t v4 = +[FeatureManager sharedFeatureManager];
  if ([v4 isReadingListAvailable])
  {
    id v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    if ([v5 presentationState] == 1)
    {
      LOBYTE(v6) = 0;
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = [v5 presentationState];

      if (v8 == 2)
      {
        LOBYTE(v6) = 0;
LABEL_9:

        goto LABEL_10;
      }
      id v7 = [(TabController *)self->_tabController activeTabDocument];
      int v6 = ([v7 isBlank] | isWindowLockedForPrivate) ^ 1;
    }

    goto LABEL_9;
  }
  LOBYTE(v6) = 0;
LABEL_10:

  return v6;
}

- (void)validateCommand:(id)a3
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BrowserController;
  [(BrowserController *)&v26 validateCommand:v6];
  id v7 = (char *)[v6 action];
  if (v7 == sel_closeAllTabsMatchingSearch_)
  {
    id WeakRetained = -[BrowserController _closeAllTabsMatchingSearchLabel]((uint64_t)self);
    [v6 setTitle:WeakRetained];
LABEL_54:

    goto LABEL_55;
  }
  if (v7 == sel_closeAllTabs_)
  {
    id WeakRetained = -[BrowserController _closeAllTabsLabel]((uint64_t)self);
    [v6 setTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_addAllTabsToBookmarks_)
  {
    id WeakRetained = -[BrowserController _addAllTabsToBookmarksLabel]((uint64_t)self);
    [v6 setTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_find_)
  {
    id WeakRetained = -[BrowserController _findCommandTitle](self);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_saveKeyPressed)
  {
    id WeakRetained = _WBSLocalizedString();
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_toggleBookmarksKeyPressed)
  {
    if ([(SidebarUIProxy *)self->_sidebarUIProxy isShowingSidebar]) {
      WBSLocalizedStringWithValue((NSString *)@"Hide Sidebar", v13);
    }
    else {
      WBSLocalizedStringWithValue((NSString *)@"Show Sidebar", v13);
    }
    goto LABEL_32;
  }
  if (v7 == sel_toggleShowingFavoritesBarKeyPressed)
  {
    id WeakRetained = -[BrowserController _titleForToggleFavoritesBarKeyCommand](self);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_toggleReaderKeyPressed)
  {
    id WeakRetained = [(TabController *)self->_tabController activeTabDocument];
    if ([WeakRetained isShowingReader]) {
      WBSLocalizedStringWithValue((NSString *)@"Hide Reader", v15);
    }
    else {
    int v17 = WBSLocalizedStringWithValue((NSString *)@"Show Reader", v15);
    }
    [v6 setDiscoverabilityTitle:v17];

    goto LABEL_54;
  }
  if (v7 == sel_toggleTabViewKeyPressed)
  {
    if ([(TabCollectionViewProviding *)self->_tabCollectionViewProvider isShowingTabView])WBSLocalizedStringWithValue((NSString *)@"Hide Tab Overview", v16); {
    else
    }
      WBSLocalizedStringWithValue((NSString *)@"Show Tab Overview", v16);
    uint64_t v14 = LABEL_32:;
    [v6 setDiscoverabilityTitle:v14];
    id WeakRetained = (void *)v14;
    goto LABEL_54;
  }
  if (v7 == sel_emptySelectorForOpenInNewTabModifierLinkTap)
  {
    id WeakRetained = -[BrowserController _discoverabilityTitleForCommandTapModifierFollowingUserPreference:]((uint64_t)self, 1);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_emptySelectorForOpenInNewTabOppositePreferenceModifierLinkTap)
  {
    id WeakRetained = -[BrowserController _discoverabilityTitleForCommandTapModifierFollowingUserPreference:]((uint64_t)self, 0);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_showBookmarksCollectionKeyPressed)
  {
    id WeakRetained = -[BrowserController _titleForToggleBookmarksKeyCommand](self);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_showReadingListCollectionKeyPressed)
  {
    id WeakRetained = -[BrowserController _titleForToggleReadingListKeyCommand](self);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_showHistoryCollectionKeyPressed)
  {
    id WeakRetained = -[BrowserController _titleForToggleHistoryKeyCommand](self);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_showSharedWithYouCollectionKeyPressed)
  {
    id WeakRetained = -[BrowserController _titleForToggleSharedWithYouKeyCommand]((id *)&self->super.super.super.isa);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_showCloudTabsCollectionKeyPressed)
  {
    id WeakRetained = -[BrowserController _titleForToggleCloudTabsKeyCommand]((id *)&self->super.super.super.isa);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_toggleShowWebpageStatusBar)
  {
    id WeakRetained = -[BrowserController _titleForToggleWebpageStatusBar]((uint64_t)self);
    [v6 setDiscoverabilityTitle:WeakRetained];
    goto LABEL_54;
  }
  if (v7 == sel_toggleDownloadsKeyPressed)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadsViewController);
    id v3 = [WeakRetained presentingViewController];
    if (v3) {
      WBSLocalizedStringWithValue((NSString *)@"Hide Downloads", v18);
    }
    else {
    id v25 = WBSLocalizedStringWithValue((NSString *)@"Show Downloads", v18);
    }
    [v6 setDiscoverabilityTitle:v25];

    goto LABEL_53;
  }
  if (v7 == sel_switchToProfileKeyPressed_)
  {
    double v19 = [(TabController *)self->_tabController profiles];
    double v20 = [v6 propertyList];
    id WeakRetained = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v20, "integerValue"));

    id v21 = NSString;
    id v3 = WBSLocalizedStringWithValue((NSString *)@"Show %@ Profile", v22);
    char v23 = [WeakRetained title];
    char v24 = objc_msgSend(v21, "localizedStringWithFormat:", v3, v23);
    [v6 setDiscoverabilityTitle:v24];

LABEL_53:
    goto LABEL_54;
  }
  if (v7 == sel_openNewWindowInFrontmostProfile_)
  {
    BOOL v9 = [(BrowserController *)self hasMultipleProfiles];
    if (v9)
    {
      id v10 = NSString;
      id WeakRetained = WBSLocalizedStringWithValue((NSString *)@"New %@ Window", v8);
      id v3 = [(TabController *)self->_tabController activeProfile];
      uint64_t v4 = [v3 title];
      int v12 = objc_msgSend(v10, "localizedStringWithFormat:", WeakRetained, v4);
    }
    else
    {
      int v12 = WBSLocalizedStringWithValue((NSString *)@"New Window", v8);
      id WeakRetained = v12;
    }
    [v6 setDiscoverabilityTitle:v12];
    if (!v9) {
      goto LABEL_54;
    }

    goto LABEL_53;
  }
LABEL_55:
}

- (id)_closeAllTabsMatchingSearchLabel
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 928) tabThumbnailCollectionView];
    id v3 = [v2 searchController];
    uint64_t v4 = [v3 searchTerm];

    id v5 = [*(id *)(a1 + 344) tabsMatchingSearchTerm];
    uint64_t v6 = [v5 count];

    if (v6 == 1)
    {
      id v7 = NSString;
      uint64_t v8 = _WBSLocalizedString();
      BOOL v9 = objc_msgSend(v7, "stringWithFormat:", v8, v4);
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28EE0];
      BOOL v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v6];
      uint64_t v8 = [v10 localizedStringFromNumber:v11 numberStyle:1];

      int v12 = NSString;
      int v13 = _WBSLocalizedString();
      BOOL v9 = objc_msgSend(v12, "stringWithFormat:", v13, v8, v4);
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  return v9;
}

- (id)_closeAllTabsLabel
{
  if (a1)
  {
    unint64_t v1 = [*(id *)(a1 + 344) numberOfTabsForCloseAllAction];
    if (v1 <= 1 || (unint64_t v2 = v1, v1 == 2))
    {
      id v3 = _WBSLocalizedString();
    }
    else
    {
      uint64_t v4 = NSString;
      id v5 = _WBSLocalizedString();
      id v3 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v2);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_addAllTabsToBookmarksLabel
{
  if (a1)
  {
    unint64_t v1 = -[BrowserController _nonBlankCurrentTabs](a1);
    unint64_t v2 = [v1 count];

    if (v2 > 1)
    {
      uint64_t v4 = NSString;
      id v5 = _WBSLocalizedString();
      id v3 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v2);
    }
    else
    {
      id v3 = _WBSLocalizedString();
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)_findCommandTitle
{
  if (a1)
  {
    -[BrowserController _showingTabDocumentWithURL]((uint64_t)a1);
    a1 = _WBSLocalizedString();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_discoverabilityTitleForCommandTapModifierFollowingUserPreference:(uint64_t)a1
{
  if (a1)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v4 = [v3 BOOLForKey:*MEMORY[0x1E4F78990]];

    id v5 = _WBSLocalizedString();
    uint64_t v6 = _WBSLocalizedString();
    id v7 = (void *)v6;
    if (v4) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v5;
    }
    if (v4) {
      BOOL v9 = v5;
    }
    else {
      BOOL v9 = (void *)v6;
    }
    if (!a2) {
      uint64_t v8 = v9;
    }
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (void)switchToTabKeyPressed:(id)a3
{
  uint64_t v4 = -[BrowserController _tabIndexForKeyCommand:]((uint64_t)self, a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [(TabController *)self->_tabController currentTabs];
    id v8 = [v6 objectAtIndexedSubscript:v5];

    id v7 = [(TabController *)self->_tabController activeTabDocument];

    if (v8 != v7) {
      [(TabController *)self->_tabController setActiveTab:v8 animated:1 deferActivation:1];
    }
  }
}

- (uint64_t)_tabIndexForKeyCommand:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 input];
    uint64_t v6 = [v5 integerValue];

    id v7 = [*(id *)(a1 + 344) currentTabs];
    unint64_t v8 = [v7 count];
    unint64_t v9 = v6 - 1;

    unint64_t v10 = v8 - 1;
    if (v9 < v8 && v9 != 8) {
      unint64_t v10 = v9;
    }
    if (v10 >= v8) {
      a1 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      a1 = v10;
    }
  }

  return a1;
}

- (void)switchToProfileKeyPressed:(id)a3
{
  id v11 = [a3 input];
  uint64_t v4 = [v11 integerValue];

  uint64_t v5 = [(TabController *)self->_tabController profiles];
  id v12 = [v5 objectAtIndexedSubscript:v4];

  uint64_t v6 = [v12 identifier];
  id v7 = [(TabController *)self->_tabController activeProfile];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
    tabController = self->_tabController;
    unint64_t v10 = [v12 identifier];
    [(TabController *)tabController setActiveProfileIdentifier:v10];
  }
}

- (void)showBookmarksCollectionKeyPressed
{
}

- (void)_switchToCollectionOrToggleSidebar:(id *)a1
{
  id v3 = a2;
  if (a1) {
    -[BrowserController _switchToCollectionOrToggleSidebar:completion:](a1, v3, 0);
  }
}

- (void)showReadingListCollectionKeyPressed
{
}

- (void)showHistoryCollectionKeyPressed
{
}

- (void)showHistoryCollectionAlternativeKeyPressed
{
}

- (void)showSharedWithYouCollectionKeyPressed
{
}

- (void)_toggleVisibilityOfStartPageCollection:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    id v3 = *(void **)(a1 + 344);
    if (*(unsigned char *)(a1 + 719)) {
      [v3 selectPrivateTabGroup];
    }
    else {
      [v3 selectLocalTabGroup];
    }
    uint64_t v4 = [(id)a1 currentBookmarksCollection];
    int v5 = WBSIsEqual();

    if (v5) {
      id v6 = 0;
    }
    else {
      id v6 = v7;
    }
    [(id)a1 setCurrentBookmarksCollection:v6];
  }
}

- (void)showCloudTabsCollectionKeyPressed
{
}

- (void)_switchToCollectionOrToggleSidebar:(void *)a3 completion:
{
  id v8 = a2;
  int v5 = a3;
  if (a1)
  {
    if ((([a1 isPresentingModalBookmarksController] & 1) != 0
       || [a1[94] isShowingSidebar])
      && ([a1 currentBookmarksCollection],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 isEqualToString:v8],
          v6,
          (v7 & 1) == 0))
    {
      [a1 setCurrentBookmarksCollection:v8];
      if (v5) {
        v5[2](v5, 1);
      }
    }
    else
    {
      -[BrowserController toggleBookmarksPresentationWithCollection:completion:]((uint64_t)a1, v8, v5);
    }
  }
}

- (void)toggleBookmarksPresentationWithCollection:(void *)a3 completion:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if ([*(id *)(a1 + 752) isShowingSidebar]) {
      char v7 = 1;
    }
    else {
      char v7 = [(id)a1 isPresentingModalBookmarksController];
    }
    uint64_t v8 = [(id)a1 _bookmarksPresentationStyle];
    if (v7)
    {
      unint64_t v9 = 0;
    }
    else
    {
      int v10 = *(unsigned __int8 *)(a1 + 376);
      *(unsigned char *)(a1 + 376) = 1;
      id v11 = WBS_LOG_CHANNEL_PREFIXSignposts();
      if (os_signpost_enabled(v11))
      {
        id v12 = @"modal";
        if (v8 == 1) {
          id v12 = @"overlay";
        }
        if (v8 == 2) {
          id v12 = @"embedded";
        }
        int v13 = v12;
        uint64_t v14 = @"NO";
        if (!v10) {
          uint64_t v14 = @"YES";
        }
        int v15 = v14;
        *(_DWORD *)buf = 138412546;
        objc_super v26 = v13;
        __int16 v27 = 2112;
        BOOL v28 = v15;
        _os_signpost_emit_with_name_impl(&dword_1E102C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShowBookmarks", "presentationStyle=%@; firstPresentation=%@",
          buf,
          0x16u);
      }
      unint64_t v9 = &__block_literal_global_900;
    }
    -[UIResponder safari_becomeFirstResponderIfNeeded](a1);
    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (!v8)
      {
        -[BrowserController _setPresentingModalBookmarksController:exclusively:importHandler:withCollection:bookmarkUUIDString:animated:completion:]((id *)a1, [(id)a1 isPresentingModalBookmarksController] ^ 1, 0, 0, v5, 0, 1, v9);
        if (v6) {
          v6[2](v6, 1);
        }
      }
    }
    else
    {
      objc_initWeak((id *)buf, (id)a1);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __74__BrowserController_toggleBookmarksPresentationWithCollection_completion___block_invoke_901;
      v22[3] = &unk_1E6D79A60;
      objc_copyWeak(&v24, (id *)buf);
      id v23 = v5;
      int v16 = (void (**)(void))MEMORY[0x1E4E42950](v22);
      int v17 = *(void **)(a1 + 752);
      uint64_t v18 = [v17 isShowingSidebar] ^ 1;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74__BrowserController_toggleBookmarksPresentationWithCollection_completion___block_invoke_2;
      v19[3] = &unk_1E6D79A88;
      id v20 = v9;
      id v21 = v6;
      [v17 setShowingSidebar:v18 completion:v19];
      v16[2](v16);

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)addToBookmarks:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      objc_msgSend(v4, "sf_commandSource");
      char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = @"Unknown";
    }
    int v9 = 138543618;
    int v10 = @"Add to Bookmarks";
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ via %{public}@", (uint8_t *)&v9, 0x16u);
    if (v6) {
  }
    }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  -[BrowserController _addBookmarkForCurrentTabKeyPressed:]((id *)&self->super.super.super.isa, isKindOfClass & 1);
}

- (void)_addBookmarkForCurrentTabKeyPressed:(id *)a1
{
  if (a1)
  {
    id v5 = [a1[43] activeTabDocument];
    id v4 = [v5 titleForNewBookmark];
    -[BrowserController _addBookmarkForCurrentTabKeyPressed:title:](a1, a2, v4);
  }
}

- (void)focusAddressFieldKeyPressed
{
  if ([(BrowserController *)self isFavoritesFieldFocused])
  {
    -[BrowserController _topNavigationBar]((id *)&self->super.super.super.isa);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [v4 textField];
    [v3 selectAll:0];
  }
  else
  {
    [(BrowserController *)self setFavoritesFieldFocused:1 animated:1];
  }
}

- (void)toggleShowingFavoritesBarKeyPressed
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 setBool:-[BrowserController _prefersShowingBookmarksBar]((uint64_t)self) ^ 1 forKey:*MEMORY[0x1E4F785D8]];
}

- (void)toggleTabView
{
  id v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v5 presentationState] == 1)
  {

LABEL_4:
    [v5 dismissAnimated:1];
    goto LABEL_6;
  }
  uint64_t v3 = [v5 presentationState];

  if (v3 == 2) {
    goto LABEL_4;
  }
  [(BrowserController *)self cancelFavoritesAnimated:0];
  [(BrowserController *)self becomeFirstResponder];
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didEnterTabViewWithMethod:2];

  [v5 presentAnimated:1];
LABEL_6:
}

- (void)showTabView
{
}

- (void)addToReadingList:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      objc_msgSend(v4, "sf_commandSource");
      char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = @"Unknown";
    }
    *(_DWORD *)buf = 138543618;
    id v12 = @"Add to Reading List";
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ via %{public}@", buf, 0x16u);
    if (v6) {
  }
    }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__BrowserController_addToReadingList___block_invoke;
  v9[3] = &unk_1E6D791E8;
  void v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  [(BrowserController *)self showReadingListAutomaticArchiveAlertIfNeededWithCompletion:v9];
}

void __38__BrowserController_addToReadingList___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) addReadingListBookmarkForCurrentTab])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 3;
    }
    id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v4 didAddReadingListItemWithMethod:v2];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 384));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    [*(id *)(v3 + 920) bounds];
    UIRectGetCenter();
    objc_msgSend(WeakRetained, "browserController:animateSafariIconLinkFromPoint:inView:", v3, *(void *)(*(void *)(a1 + 32) + 920));
  }
}

- (void)nextReadingListItemKeyPressed
{
  uint64_t v3 = [(BrowserController *)self continuousReadingController];
  id v4 = [v3 nextReadingListItem];

  if (v4)
  {
    continuousReadingViewController = self->_continuousReadingViewController;
    [(ContinuousReadingViewController *)continuousReadingViewController loadNextItem];
  }
}

- (void)previousReadingListItemKeyPressed
{
  uint64_t v3 = [(BrowserController *)self continuousReadingController];
  id v4 = [v3 previousReadingListItem];

  if (v4)
  {
    continuousReadingViewController = self->_continuousReadingViewController;
    [(ContinuousReadingViewController *)continuousReadingViewController loadPreviousItem];
  }
}

- (void)_pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded:(char)a3 positionOptions:(char)a4 isKeyboardShortcut:
{
  if (a1)
  {
    [(id)a1 cancelFavoritesAnimated:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    id v17[2] = __108__BrowserController__pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded_positionOptions_isKeyboardShortcut___block_invoke;
    v17[3] = &unk_1E6D795D8;
    char v18 = a4;
    void v17[4] = a1;
    id v8 = (void (**)(void))MEMORY[0x1E4E42950](v17);
    if (a2)
    {
      int v9 = *(unsigned __int8 *)(a1 + 719);
      [*(id *)(a1 + 344) selectPrivateTabGroup];
      if (!v9)
      {
        id v10 = [*(id *)(a1 + 344) privateActiveTabDocument];
        int v11 = [v10 isBlank];

        if (v11)
        {
          v8[2](v8);
LABEL_9:

          return;
        }
      }
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v13 = v12 | a3 & 0xC;
    uint64_t v14 = *(void **)(a1 + 344);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __108__BrowserController__pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded_positionOptions_isKeyboardShortcut___block_invoke_2;
    v15[3] = &unk_1E6D79370;
    int v16 = v8;
    [v14 openNewTabWithOptions:v13 completionHandler:v15];

    goto LABEL_9;
  }
}

uint64_t __108__BrowserController__pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded_positionOptions_isKeyboardShortcut___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v3, "didOpenNewBlankTabWithTrigger:tabCollectionViewType:", v2 == 0, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 928), "visibleTabCollectionViewType"));

  uint64_t result = -[BrowserController _wantsURLFieldAutoFocus](*(void **)(a1 + 32));
  if (result)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 setFavoritesFieldFocused:1 animated:0];
  }
  return result;
}

uint64_t __108__BrowserController__pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded_positionOptions_isKeyboardShortcut___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)openNewTab:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(TabController *)self->_tabController switchToTabGroupVisibleInSwitcherIfNeeded];
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      objc_msgSend(v4, "sf_commandSource");
      char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = @"Unknown";
    }
    int v10 = 138543618;
    int v11 = @"Open new tab";
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ via %{public}@", (uint8_t *)&v10, 0x16u);
    if (v6) {
  }
    }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((v4 == 0) | isKindOfClass & 1) {
    char v9 = 4;
  }
  else {
    char v9 = 8;
  }
  -[BrowserController _pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded:positionOptions:isKeyboardShortcut:]((uint64_t)self, 0, v9, isKindOfClass & 1);
}

- (void)newTabAlternativeKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Open new tab via alternate keyboard shortcut", v4, 2u);
  }
  -[BrowserController _pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded:positionOptions:isKeyboardShortcut:]((uint64_t)self, 0, 4, 1);
}

- (void)openNewPrivateTab:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    char v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      objc_msgSend(v4, "sf_commandSource");
      char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v7 = @"Unknown";
    }
    int v9 = 138543618;
    int v10 = @"Open new Private tab";
    __int16 v11 = 2114;
    __int16 v12 = v7;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "%{public}@ via %{public}@", (uint8_t *)&v9, 0x16u);
    if (v6) {
  }
    }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (self) {
    -[BrowserController _pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded:positionOptions:isKeyboardShortcut:]((uint64_t)self, 1, 4, isKindOfClass & 1);
  }
}

- (void)newTabGroupKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Create new Empty Tab Group via keyboard shortcut", buf, 2u);
  }
  tabController = self->_tabController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __42__BrowserController_newTabGroupKeyPressed__block_invoke;
  v5[3] = &unk_1E6D79600;
  void v5[4] = self;
  [(TabController *)tabController createTabGroupFromExistingTabs:0 completionHandler:v5];
}

void __42__BrowserController_newTabGroupKeyPressed__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v3 didCreateTabGroupFromLocation:8 prepopulatedWithTabs:0];

    if (SFEnhancedTabOverviewEnabled())
    {
      if ([*(id *)(*(void *)(a1 + 32) + 928) isShowingTabView])
      {
        id v4 = [*(id *)(*(void *)(a1 + 32) + 928) tabSwitcherViewController];
        [v4 setNeedsApplyContentAnimated:1];

        id v5 = [*(id *)(*(void *)(a1 + 32) + 928) tabSwitcherViewController];
        [v5 setNeedsScrollToTabGroup:v6];
      }
    }
  }
}

- (void)closeTabGroupKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Closing Tab Group via keyboard shortcut", v6, 2u);
  }
  tabController = self->_tabController;
  id v5 = [(TabController *)tabController activeTabGroupOrTabGroupVisibleInSwitcher];
  [(TabController *)tabController closeTabGroup:v5];
}

- (void)renameTabGroupKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Renaming Tab Group via keyboard shortcut", v6, 2u);
  }
  if (SFEnhancedTabOverviewEnabled()
    && [(TabCollectionViewProviding *)self->_tabCollectionViewProvider isShowingTabView])
  {
    id v4 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabSwitcherViewController];
    [v4 beginRenamingVisibleTabGroup];
  }
  else
  {
    tabController = self->_tabController;
    id v4 = [(TabController *)tabController activeTabGroup];
    [(TabController *)tabController renameTabGroup:v4];
  }
}

- (void)previousTabGroupKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Switching to previous Tab Group via keyboard shortcut", v6, 2u);
  }
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didSwitchToTabGroupFromLocation:8];

  if (SFEnhancedTabOverviewEnabled()
    && [(TabCollectionViewProviding *)self->_tabCollectionViewProvider isShowingTabView])
  {
    id v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabSwitcherViewController];
    [v5 scrollToPreviousTabGroup];
  }
  else
  {
    [(TabController *)self->_tabController selectPreviousTabGroup];
  }
}

- (void)nextTabGroupKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Switching to next Tab Group via keyboard shortcut", v6, 2u);
  }
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didSwitchToTabGroupFromLocation:8];

  if (SFEnhancedTabOverviewEnabled()
    && [(TabCollectionViewProviding *)self->_tabCollectionViewProvider isShowingTabView])
  {
    id v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabSwitcherViewController];
    [v5 scrollToNextTabGroup];
  }
  else
  {
    [(TabController *)self->_tabController selectNextTabGroup];
  }
}

- (void)newTabWithAlternativeOrderingKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Open new tab with alternative ordering keyboard shortcut", v4, 2u);
  }
  -[BrowserController _pressedNewTabKeySwitchingToPrivateBrowsingIfNeeded:positionOptions:isKeyboardShortcut:]((uint64_t)self, 0, 0, 1);
}

- (void)_searchTabs
{
  if (a1)
  {
    int v2 = SFEnhancedTabOverviewEnabled();
    uint64_t v3 = *(void **)(a1 + 928);
    if (v2)
    {
      id v6 = [v3 tabSwitcherViewController];
      [v6 beginSearching];
    }
    else
    {
      id v7 = [v3 tabOverview];
      if ([v7 presentationState] == 1)
      {
      }
      else
      {
        uint64_t v4 = [v7 presentationState];

        if (v4 != 2) {
          return;
        }
      }
      id v6 = [*(id *)(a1 + 928) tabOverview];
      id v5 = [v6 searchController];
      [v5 beginSearching];
    }
  }
}

- (void)_logTabClosingWithEventSender:(uint64_t)a3 tabClosingAction:(uint64_t)a4 numberOfTabsClosed:
{
  id v8 = a2;
  if (a1)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    -[BrowserController _logTabClosingWithKeyboardShortcut:tabClosingAction:numberOfTabsClosed:](a1, isKindOfClass & 1, a3, a4);
  }
}

- (void)_logTabClosingWithKeyboardShortcut:(uint64_t)a3 tabClosingAction:(uint64_t)a4 numberOfTabsClosed:
{
  if (a1)
  {
    uint64_t v7 = [*(id *)(a1 + 928) visibleTabCollectionViewType];
    if (a2) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    id v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v9 didCloseTabWithTrigger:v8 tabClosingAction:a3 numberOfTabsClosed:a4 tabCollectionViewType:v7];
  }
}

- (void)closeActiveTab:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      objc_msgSend(v4, "sf_commandSource");
      uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = @"Unknown";
    }
    int v10 = 138543618;
    __int16 v11 = @"Close tab";
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ via %{public}@", (uint8_t *)&v10, 0x16u);
    if (v6) {
  }
    }
  -[BrowserController _logTabClosingWithEventSender:tabClosingAction:numberOfTabsClosed:]((uint64_t)self, v4, 1, 1);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [(TabController *)self->_tabController activeTabDocument];
    if ([v8 isPinned])
    {
      BOOL v9 = [(TabController *)self->_tabController selectFirstUnpinnedTab];

      if (v9) {
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  [(TabController *)self->_tabController closeTab];
LABEL_13:
}

- (void)closeOtherTabsKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Close Other Tabs via keyboard", v5, 2u);
  }
  [(BrowserController *)self showBars];
  id v4 = [(TabController *)self->_tabController currentTabs];
  -[BrowserController _logTabClosingWithKeyboardShortcut:tabClosingAction:numberOfTabsClosed:]((uint64_t)self, 1, 2, [v4 count] - 1);

  [(TabController *)self->_tabController closeOtherTabs];
}

- (void)_switchTabsByRelativeIndex:(void *)a3 withKeyCommand:
{
  id v13 = a3;
  if (a1)
  {
    id v5 = [*(id *)(a1 + 344) currentTabs];
    uint64_t v6 = [v5 count];
    uint64_t v7 = [*(id *)(a1 + 344) tabBeingActivated];
    uint64_t v8 = [v5 indexOfObject:v7];

    if (v8 + a2 >= v6) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8 + a2;
    }
    if (v8 + a2 >= 0) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = v6 - 1;
    }
    if (v10 != v8)
    {
      *(void *)(a1 + 144) = [v13 modifierFlags];
      __int16 v11 = *(void **)(a1 + 344);
      __int16 v12 = [v5 objectAtIndexedSubscript:v10];
      [v11 setActiveTab:v12 animated:1 deferActivation:1];
    }
  }
}

- (void)nextTabKeyPressed:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  -[BrowserController _switchTabsByRelativeIndex:withKeyCommand:]((uint64_t)self, 1, v4);
}

- (void)previousTabKeyPressed:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v5;
  }
  else {
    id v4 = 0;
  }
  -[BrowserController _switchTabsByRelativeIndex:withKeyCommand:]((uint64_t)self, -1, v4);
}

- (void)reopenLastClosedTabPressed
{
  [(TabController *)self->_tabController switchToTabGroupVisibleInSwitcherIfNeeded];
  -[BrowserController _lastClosedTabStateData](self);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
  [v3 loadSessionStateDataAndRemoveRecentlyClosedTab:v9];

  id v4 = [[TabDocument alloc] initWithTabStateData:v9 hibernated:0 browserController:self];
  tabController = self->_tabController;
  uint64_t v6 = [(TabController *)tabController activeTabDocument];
  [(TabController *)tabController insertTab:v4 afterTab:v6 inBackground:0 animated:1];

  uint64_t v7 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v7, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 4, -[TabCollectionViewProviding visibleTabCollectionViewType](self->_tabCollectionViewProvider, "visibleTabCollectionViewType"));

  uint64_t v8 = [(TabController *)self->_tabController undoManager];
  [v8 removeAllActions];
}

- (void)toggleDownloadsKeyPressed
{
  uint64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Open downloads via keyboard shortcut", v4, 2u);
  }
  [(BrowserController *)self presentDownloadsViewController];
}

- (void)reloadKeyPressed
{
  [(BrowserController *)self dismissTransientUIAnimated:1];
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  [v3 reloadUserInitiated];
}

- (void)reloadFromOriginKeyPressed
{
  [(BrowserController *)self dismissTransientUIAnimated:1];
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  [v3 reloadFromOriginUserInitiated];
}

- (void)find:(id)a3
{
  if (-[BrowserController _showingTabDocumentWithURL]((uint64_t)self))
  {
    id v5 = [(BrowserController *)self tabController];
    id v4 = [v5 activeTabDocument];
    [v4 showFindOnPage];

    id v6 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v6 didFindOnPageWithTrigger:0];
  }
  else
  {
    -[BrowserController _searchTabs]((uint64_t)self);
  }
}

- (void)takeFindStringKeyPressed
{
  self->_shouldFillStringForFind = 1;
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  int v2 = [v3 activeWebView];
  [v2 _takeFindStringFromSelection:0];
}

- (void)cancelKeyPressed
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  id v9 = [v3 sfScribbleControllerIfLoaded];

  if ([v9 isScribbling])
  {
    [v9 endScribblingAndSaveChanges:0];
    goto LABEL_16;
  }
  id v4 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v4 presentationState] == 1)
  {
  }
  else
  {
    uint64_t v5 = [v4 presentationState];

    if (v5 != 2)
    {
      if ([(BrowserController *)self isShowingFavorites])
      {
        [(BrowserController *)self cancelFavorites];
        goto LABEL_15;
      }
      if ([(BrowserController *)self isShowingReader])
      {
        [(BrowserController *)self setShowingReader:0 animated:1];
        goto LABEL_15;
      }
      if ([(BrowserController *)self dismissTransientUIAnimated:1]) {
        goto LABEL_15;
      }
      uint64_t v8 = [(TabController *)self->_tabController activeTabDocument];
      [v8 stopLoadingUserInitiated];
      goto LABEL_8;
    }
  }
  id v6 = [v4 searchController];
  int v7 = [v6 isSearching];

  if (!v7)
  {
    [v4 dismissAnimated:1];
    goto LABEL_15;
  }
  uint64_t v8 = [v4 searchController];
  [v8 endSearching];
LABEL_8:

LABEL_15:
LABEL_16:
}

- (void)emailCurrentPage
{
}

- (void)_emailCurrentPageWithPreferredContentType:(uint64_t)a1
{
  if (a1)
  {
    id v4 = [*(id *)(a1 + 344) activeTabDocument];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    id v5[2] = __63__BrowserController__emailCurrentPageWithPreferredContentType___block_invoke;
    v5[3] = &unk_1E6D79650;
    void v5[4] = a1;
    void v5[5] = a2;
    [v4 fetchCanonicalURLWithCompletionHandler:v5];
  }
}

void __63__BrowserController__emailCurrentPageWithPreferredContentType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = -[BrowserController _mailContentProvider](*(void **)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__BrowserController__emailCurrentPageWithPreferredContentType___block_invoke_2;
  v6[3] = &unk_1E6D79628;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  [v4 getMailComposeViewControllerWithMailToURL:0 contentURL:v3 preferredContentType:v5 completionHandler:v6];
}

- (void)_mailContentProvider
{
  if (a1)
  {
    int v2 = a1;
    id v3 = (void *)a1[8];
    if (!v3)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F3AFC8]);
      uint64_t v5 = (void *)v2[8];
      v2[8] = v4;

      [(id)v2[8] setDataSource:v2];
      id v3 = (void *)v2[8];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

void __63__BrowserController__emailCurrentPageWithPreferredContentType___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_presentModalViewController:(id *)a1
{
  id v3 = a2;
  if (a1) {
    -[BrowserController _presentModalViewController:fromBarItem:animated:completion:](a1, v3, *MEMORY[0x1E4F788B8], 1, 0);
  }
}

- (void)increaseSize:(id)a3
{
  id v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Zoom In via keyboard shortcut", v7, 2u);
  }
  uint64_t v5 = [(TabController *)self->_tabController activeTabDocument];
  if ([v5 isShowingReader])
  {
    id v6 = [v5 readerContext];
    if ([v6 canIncreaseReaderTextSize]) {
      [v6 increaseReaderTextSize];
    }
  }
  else
  {
    [v5 increasePageZoomSetting];
  }
}

- (void)decreaseSize:(id)a3
{
  id v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "Zoom Out via keyboard shortcut", v7, 2u);
  }
  uint64_t v5 = [(TabController *)self->_tabController activeTabDocument];
  if ([v5 isShowingReader])
  {
    id v6 = [v5 readerContext];
    if ([v6 canDecreaseReaderTextSize]) {
      [v6 decreaseReaderTextSize];
    }
  }
  else
  {
    [v5 decreasePageZoomSetting];
  }
}

- (void)resetPageZoomLevelAndFontSize
{
  id v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Reset Zoom via keyboard shortcut", v6, 2u);
  }
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  if ([v4 isShowingReader])
  {
    uint64_t v5 = [v4 readerContext];
    [v5 resetReaderTextSize];
  }
  else
  {
    [v4 resetPageZoomSetting];
  }
}

- (void)_presentSaveWebpageViewController
{
  if (a1 && -[BrowserController _canSaveWebpage](a1))
  {
    int v2 = [*(id *)(a1 + 344) activeTabDocument];
    id v5 = +[ActionPanel createActivityItemProviderCollectionForTabDocument:v2];

    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F3B058]) initWithActivityItemProviderCollection:v5];
    id v4 = *(void **)(a1 + 296);
    *(void *)(a1 + 296) = v3;

    [*(id *)(a1 + 296) setDelegate:a1];
    [*(id *)(a1 + 296) start];
  }
}

- (void)autoFillFormKeyPressed
{
  id v2 = [(TabController *)self->_tabController activeTabDocument];
  [v2 performPageLevelAutoFill];
}

- (void)closeAllTabsMatchingSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self->_tabController tabsMatchingSearchTerm];
  -[BrowserController _logTabClosingWithEventSender:tabClosingAction:numberOfTabsClosed:]((uint64_t)self, v4, 4, [v5 count]);
  tabController = self->_tabController;
  int v7 = _WBSLocalizedString();
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __48__BrowserController_closeAllTabsMatchingSearch___block_invoke;
  uint64_t v14 = &unk_1E6D791E8;
  uint64_t v15 = self;
  id v8 = v5;
  id v16 = v8;
  [(TabController *)tabController registerUndoWithName:v7 actions:&v11];

  id v9 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  uint64_t v10 = [v9 searchController];
  [v10 endSearching];
}

uint64_t __48__BrowserController_closeAllTabsMatchingSearch___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 344) closeTabs:*(void *)(a1 + 40)];
}

- (void)closeAllTabs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1418];
  id v6 = -[BrowserController _closeAllTabsLabel]((uint64_t)self);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __34__BrowserController_closeAllTabs___block_invoke;
  id v16 = &unk_1E6D791E8;
  id v7 = v4;
  id v17 = v7;
  char v18 = self;
  id v8 = objc_msgSend(v5, "safari_closeAllTabsConfirmationWithCloseAllLabel:closeHandler:", v6, &v13);

  id v9 = [(BrowserController *)self tabBarManager];
  if ([v9 displayMode] == 1)
  {
    uint64_t v10 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    uint64_t v11 = [v10 presentationState];

    if (v11) {
      uint64_t v12 = 8;
    }
    else {
      uint64_t v12 = 7;
    }
  }
  else
  {

    uint64_t v12 = 8;
  }
  [(BrowserController *)self _presentModalViewController:v8 fromBarItem:v12 completion:0];
}

uint64_t __34__BrowserController_closeAllTabs___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = objc_opt_respondsToSelector();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "sf_commandSource");
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = @"Unknown";
    }
    int v9 = 138543618;
    uint64_t v10 = @"Close all tab";
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ via %{public}@", (uint8_t *)&v9, 0x16u);
    if (v3) {
  }
    }
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = [*(id *)(v5 + 344) currentTabs];
  -[BrowserController _logTabClosingWithEventSender:tabClosingAction:numberOfTabsClosed:](v5, v6, 3, [v7 count]);

  return [*(id *)(*(void *)(a1 + 40) + 344) closeAllOpenTabsAnimated:1];
}

- (void)addAllTabsToBookmarks:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = objc_opt_respondsToSelector();
    if (v6)
    {
      objc_msgSend(v4, "sf_commandSource");
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v7 = @"Unknown";
    }
    int v8 = 138543618;
    int v9 = @"Add all to bookmarks";
    __int16 v10 = 2114;
    __int16 v11 = v7;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ via %{public}@", (uint8_t *)&v8, 0x16u);
    if (v6) {
  }
    }
  [(BrowserController *)self addBookmarkFolderForCurrentTabs];
}

- (void)openNewWindow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  [WeakRetained openNewWindowWithPrivateBrowsingEnabled:0 fromWindow:self];
}

- (void)openNewWindowInFrontmostProfile:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  [WeakRetained openNewWindowInFrontmostProfileWithPrivateBrowsingEnabled:0 fromWindow:self];
}

- (void)openNewPrivateWindow:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  [WeakRetained openNewWindowWithPrivateBrowsingEnabled:1 fromWindow:self];
}

- (void)mergeAllWindows:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  [WeakRetained mergeAllWindowsIntoWindow:self];
}

- (void)_presentActivityViewController
{
  if (a1)
  {
    -[BrowserController _prepareToPresentActivityViewController](a1);
    *(unsigned char *)(a1 + 121) = 1;
    -[BrowserController _presentActionPanelIfReady](a1);
  }
}

- (void)_pasteAndNavigate
{
  if (val)
  {
    objc_initWeak(&location, val);
    uint64_t v1 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __38__BrowserController__pasteAndNavigate__block_invoke;
    v2[3] = &unk_1E6D79678;
    objc_copyWeak(&v3, &location);
    objc_msgSend(v1, "safari_bestStringForPastingIntoURLFieldCompletionHandler:", v2);

    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

void __38__BrowserController__pasteAndNavigate__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [MEMORY[0x1E4F78598] builder];
  uint64_t v5 = [v4 navigationIntentWithText:v6];
  [WeakRetained dispatchNavigationIntent:v5];
}

- (void)scribbleDoneKeyPressed
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  id v2 = [v3 sfScribbleControllerIfLoaded];
  [v2 endScribblingAndSaveChanges:1];
}

- (void)_keyboardWillShow:(id)a3
{
  id v7 = [a3 userInfo];
  if (_SFDeviceIsPad())
  {
    id v4 = [(TabController *)self->_tabController activeTabDocument];
    int v5 = [v4 isShowingFindOnPage];

    if (v5) {
      [(UIScrollView *)self->_scrollView _adjustForAutomaticKeyboardInfo:v7 animated:1 lastAdjustment:&self->_lastAdjustmentForKeyboard];
    }
  }
  id v6 = [(BrowserController *)self firstResponder];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 isDescendantOfView:self->_webView]) {
    [(BrowserController *)self setOverridesUndoManagerForClosedTabs:0];
  }
  if (!self->_isPerformingRootViewControllerSizeTransition) {
    [(BrowserRootViewController *)self->_rootViewController updateWebViewSizeAttributes];
  }
}

- (void)_keyboardWillHide:(id)a3
{
  id v7 = a3;
  id v4 = [v7 userInfo];
  [(BrowserRootViewController *)self->_rootViewController updateWebViewSizeAttributes];
  int v5 = [(TabController *)self->_tabController activeTabDocument];
  if ([v5 isShowingFindOnPage]) {
    [(UIScrollView *)self->_scrollView _adjustForAutomaticKeyboardInfo:v4 animated:1 lastAdjustment:&self->_lastAdjustmentForKeyboard];
  }
  [v5 keyboardWillHide:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserControllerLayOutCatalogView:self];
}

- (_SFBrowserDocument)activeDocument
{
  return (_SFBrowserDocument *)[(TabController *)self->_tabController activeTabDocument];
}

- (WBSWebExtensionTab)activeTabForExtensions
{
  return (WBSWebExtensionTab *)[(TabController *)self->_tabController activeTabDocument];
}

- (BOOL)hasDedicatedExtensionsButton
{
  int IsPad = _SFDeviceIsPad();
  if (IsPad)
  {
    int IsPad = [(BrowserRootViewController *)self->_rootViewController usingUnifiedBar];
    if (IsPad) {
      LOBYTE(IsPad) = [(BrowserController *)self tabBarDisplayMode] != 1;
    }
  }
  return IsPad;
}

- (void)clearBadgeOnPageFormatMenu
{
  id v2 = [(BrowserController *)self tabController];
  id v4 = [v2 activeTabDocument];

  id v3 = [v4 webExtensionsController];
  [v3 didViewToolbarItemBadgesInTab:v4];
}

- (void)toggleShowingReaderForUserAction
{
  [(BrowserController *)self cancelFavorites];
  BOOL v3 = [(BrowserController *)self isShowingReader];
  BOOL v4 = v3;
  [(BrowserController *)self setShowingReader:!v3 animated:1];
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v5 didActivateReaderWithTrigger:0];
  }
}

- (void)setKeepBarsMinimized:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BrowserRootViewController *)self->_rootViewController keepBarsMinimized] != a3)
  {
    [(BrowserRootViewController *)self->_rootViewController setKeepBarsMinimized:v3];
    if (v3)
    {
      id v5 = [(BrowserRootViewController *)self->_rootViewController dynamicBarAnimator];
      [(BrowserController *)self updateDynamicBarGeometry];
      [v5 attemptTransitionToState:0 animated:1];
      id v6 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
      [v6 transitionToState:1 animated:1 completionHandler:0];
    }
    rootViewController = self->_rootViewController;
    [(BrowserRootViewController *)rootViewController updateAccessibilityIdentifier];
  }
}

- (BOOL)keepBarsMinimized
{
  return [(BrowserRootViewController *)self->_rootViewController keepBarsMinimized];
}

- (BOOL)hasUnviewedDownloads
{
  id v2 = [MEMORY[0x1E4F3AF68] sharedManager];
  char v3 = [v2 hasUnviewedDownloads];

  return v3;
}

- (unint64_t)downloadsCount
{
  id v2 = [MEMORY[0x1E4F3AF68] sharedManager];
  char v3 = [v2 downloads];
  unint64_t v4 = [v3 count];

  return v4;
}

- (_SFPageZoomPreferenceManager)pageZoomManager
{
  char v3 = [(TabController *)self->_tabController activeTabDocument];
  unint64_t v4 = [(BrowserController *)self pageZoomPreferenceManagerForTabDocument:v3];

  return (_SFPageZoomPreferenceManager *)v4;
}

- (BOOL)supportsPrivacyReport
{
  return 1;
}

- (BOOL)supportsSiriReadThis
{
  return 1;
}

- (BOOL)hasDedicatedMediaStateButton
{
  int IsPad = _SFDeviceIsPad();
  if (IsPad)
  {
    rootViewController = self->_rootViewController;
    LOBYTE(IsPad) = [(BrowserRootViewController *)rootViewController usingUnifiedBar];
  }
  return IsPad;
}

- (BOOL)hasDedicatedDownloadsToolbarItem
{
  id v2 = [(BrowserController *)self tabBarManager];
  char v3 = [v2 inlineTabBar];

  int IsPad = _SFDeviceIsPad();
  if (v3) {
    int v5 = IsPad;
  }
  else {
    int v5 = 0;
  }
  if (v5 == 1) {
    int v6 = [v3 usesMoreMenu] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)willPresentBrowsingAssistantInSheet:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
    char v3 = [v4 capsuleCollectionView];
    [v3 setForceHidden:1];
    [v3 setMinimizationStyle:1];
    [v3 setAlwaysShowTopBackdrop:1];
    [v4 transitionToState:1 animated:1 completionHandler:0];
  }
}

- (void)willDismissBrowsingAssistantInSheet:(BOOL)a3
{
  if (a3)
  {
    id v7 = [(TabController *)self->_tabController activeTabDocument];
    id v4 = [MEMORY[0x1E4F989B0] sharedManager];
    int v5 = [v7 assistantController];
    int v6 = [v5 webpageIdentifier];
    [v4 donateBrowsingAssistantVisualComponentPresentationEndedWithWebPageID:v6 componentType:1 componentIdentifier:&unk_1F3C73800 hideReason:0];

    if ((-[_SFPageFormatMenuController stepperIsInTransitionView](self->_pageFormatMenuController, "stepperIsInTransitionView") & 1) == 0)-[BrowserController _unhideCapsuleFromPageMenu]((id *)&self->super.super.super.isa); {
  }
    }
}

- (void)_unhideCapsuleFromPageMenu
{
  if (a1)
  {
    id v3 = [a1[35] capsuleViewController];
    id v2 = [v3 capsuleCollectionView];
    [v2 setForceHidden:0];
    [a1[35] updateCapsuleMinimizationStyle];
    if ([a1 keepBarsMinimized])
    {
      [v3 transitionToState:0 animated:0 completionHandler:0];
      [v2 setAlwaysShowTopBackdrop:0];
      [v3 transitionToState:1 animated:1 completionHandler:0];
      [a1 setKeepBarsMinimized:1];
    }
    else
    {
      [v3 transitionToState:0 animated:1 completionHandler:0];
      [v2 setAlwaysShowTopBackdrop:0];
    }
  }
}

- (void)unhideCapsuleFromPageMenuIfNeeded
{
  if (self->_stepperMovedToRootView)
  {
    self->_stepperMovedToRootView = 0;
    -[BrowserController _unhideCapsuleFromPageMenu]((id *)&self->super.super.super.isa);
  }
}

- (void)takeOwnershipOfStepperContainer:(id)a3
{
  self->_stepperMovedToRootView = 1;
}

- (void)addToFavorites
{
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  id v3 = [v4 titleForNewBookmark];
  -[BrowserController _addBookmarkForCurrentTabKeyPressed:title:addToFavorites:]((id *)&self->super.super.super.isa, 0, v3, 1);
}

- (void)_addBookmarkForCurrentTabKeyPressed:(void *)a3 title:(int)a4 addToFavorites:
{
  id v7 = a3;
  if (a1)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F3B080]);
    int v9 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    if (a4) {
      uint64_t v10 = [v8 initForAddingToFavoritesInCollection:v9];
    }
    else {
      uint64_t v10 = [v8 initWithCollection:v9];
    }
    __int16 v11 = (void *)v10;

    [v11 setSyntheticBookmarkProvider:a1[43]];
    if ([v11 prepareForPresentationForAddingBookmark:1])
    {
      uint64_t v12 = [a1[43] activeTabDocument];
      uint64_t v13 = [v12 cachedCanonicalURLOrURLForSharing];
      uint64_t v14 = [v13 absoluteString];
      id v15 = (id)[v11 addBookmarkWithTitle:v7 address:v14 parentBookmark:0];

      [v11 setBookmarkNavDelegate:a1];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __78__BrowserController__addBookmarkForCurrentTabKeyPressed_title_addToFavorites___block_invoke;
      v19[3] = &__block_descriptor_33_e5_v8__0l;
      char v20 = a2;
      [v11 setAddBookmarkAnalyticsHandler:v19];
      [a1 _presentModalViewController:v11 fromBarItem:*MEMORY[0x1E4F788B8] completion:0];
    }
    else
    {

      id v16 = (void *)MEMORY[0x1E4F781E8];
      id v17 = [a1 viewControllerToPresentFrom];
      [v16 showLockedDatabaseAlertForAction:1 fromViewController:v17];

      char v18 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v18 didPreventBookmarkActionWithBookmarkType:0 actionType:0];

      __int16 v11 = 0;
    }
  }
}

- (BOOL)canAddToQuickNote
{
  id v3 = +[Application sharedApplication];
  id v4 = [v3 systemNoteTakingController];
  int v5 = [(TabController *)self->_tabController activeTabDocument];
  char v6 = objc_msgSend(v4, "isNoteTakingSupportedWithPrivateBrowsing:", objc_msgSend(v5, "isPrivateBrowsingEnabled"));

  return v6;
}

- (void)addToQuickNote
{
  id v2 = [(TabController *)self->_tabController activeTabDocument];
  [v2 addAppHighlightCreatingLink:1];
}

- (BOOL)canPrintCurrentTab
{
  id v2 = self;
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  LOBYTE(v2) = -[BrowserController _canPrintForTabDocument:]((uint64_t)v2, v3);

  return (char)v2;
}

- (BOOL)canMoveToTabGroup
{
  id v2 = [(TabController *)self->_tabController activeTabDocument];
  id v3 = +[FeatureManager sharedFeatureManager];
  if ([v3 isCustomTabGroupsEnabled]
    && ([v2 isPrivateBrowsingEnabled] & 1) == 0)
  {
    int v4 = [v2 isPinned] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)moveMenuOnPageMenuWithDismissHandler:(id)a3
{
  id v3 = [(TabController *)self->_tabController moveMenuOnPageMenuWithDismissHandler:a3];
  return v3;
}

- (BOOL)canTogglePinningTab
{
  tabController = self->_tabController;
  id v3 = [(TabController *)tabController activeTabDocument];
  int v4 = [v3 wbTab];
  LOBYTE(tabController) = [(TabController *)tabController isTabPinnable:v4];

  return (char)tabController;
}

- (BOOL)currentTabIsPinned
{
  id v2 = [(TabController *)self->_tabController activeTabDocument];
  char v3 = [v2 isPinned];

  return v3;
}

- (void)togglePinningCurrentTab
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  -[TabController setTab:isPinned:](self->_tabController, "setTab:isPinned:", v3, [v3 isPinned] ^ 1);
}

- (void)presentPrintControllerForCurrentTab
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  -[BrowserController presentPrintControllerForTabDocument:frame:initiatedByWebContent:](self, "presentPrintControllerForTabDocument:frame:initiatedByWebContent:");
}

- (void)reportScribbleFeedbackForSelectedRowIndex:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    int64_t v4 = 3;
  }
  else {
    int64_t v4 = a3;
  }
  id v31 = [MEMORY[0x1E4F1CA60] dictionary];
  int v5 = [(TabController *)self->_tabController activeTabDocument];
  char v6 = [v5 committedURL];
  id v7 = [v6 absoluteString];
  [v31 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F99570]];

  id v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:v4];
  [v31 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F99558]];

  int v9 = [MEMORY[0x1E4F97E88] currentDevice];
  int v10 = [v9 deviceClass];

  if (v10 == 3) {
    __int16 v11 = @"iPad";
  }
  else {
    __int16 v11 = @"iPhone";
  }
  [v31 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F99550]];
  uint64_t v12 = [(TabController *)self->_tabController activeTabDocument];
  uint64_t v13 = [v12 webView];

  [v13 bounds];
  double v15 = v14;
  id v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:v16];
  [v31 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F99580]];

  char v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:v15];
  [v31 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F99578]];

  double v19 = (void *)MEMORY[0x1E4F28ED0];
  char v20 = [v13 scrollView];
  [v20 zoomScale];
  id v21 = objc_msgSend(v19, "numberWithDouble:");
  [v31 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F99590]];

  char v22 = (void *)MEMORY[0x1E4F28ED0];
  [v13 _viewScale];
  id v23 = objc_msgSend(v22, "numberWithDouble:");
  [v31 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F99588]];

  id v24 = [MEMORY[0x1E4F28F80] processInfo];
  id v25 = objc_msgSend(v24, "safari_operatingSystemVersionString");
  [v31 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F99560]];

  objc_super v26 = [MEMORY[0x1E4F28B50] mainBundle];
  __int16 v27 = objc_msgSend(v26, "safari_normalizedVersion");
  [v31 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F99568]];

  BOOL v28 = +[Application sharedApplication];
  uint64_t v29 = [v28 scribbleFeedbackSyncEngine];
  id v30 = (void *)[v31 copy];
  [v29 syncScribbleFeedbackUp:v30 withCompletion:&__block_literal_global_638];
}

- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3
{
  id v6 = a3;
  int64_t v4 = [(TabController *)self->_tabController activeTabDocument];
  int v5 = [v4 autoFillController];
  [v5 collectDiagnosticsForAutoFillWithCompletionHandler:v6];
}

- (void)presentAutoFillInternalFeedbackToastWithDiagnosticsDataWithoutPageContents:(id)a3
{
  id v6 = a3;
  int64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F781C8]) initWithDiagnosticsData:v6];
  [v4 setDelegate:self];
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F78478]) initWithContentViewController:v4];
  [v5 setDelegate:self];
  [v5 setDismissalMode:1];
  objc_storeWeak((id *)&self->_activeAutoFillInternalFeedbackToastController, v5);
  -[BrowserController _presentToastViewControllerQueuingIfNecessary:]((uint64_t)self, v5);
  -[BrowserController _scheduleAutoFillInternalFeedbackToastDismissal]((uint64_t)self);
}

- (void)_scheduleAutoFillInternalFeedbackToastDismissal
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 648));
    if (WeakRetained)
    {
      objc_initWeak(&location, (id)a1);
      id v3 = (void *)MEMORY[0x1E4F1CB00];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __68__BrowserController__scheduleAutoFillInternalFeedbackToastDismissal__block_invoke;
      v6[3] = &unk_1E6D794A0;
      objc_copyWeak(&v8, &location);
      id v7 = WeakRetained;
      uint64_t v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:10.0];
      int v5 = *(void **)(a1 + 640);
      *(void *)(a1 + 640) = v4;

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_cancelPendingAutoFillInternalFeedbackToastDismissal
{
  if (a1)
  {
    [*(id *)(a1 + 640) invalidate];
    id v2 = *(void **)(a1 + 640);
    *(void *)(a1 + 640) = 0;
  }
}

- (void)_dismissAutoFillInternalFeedbackToast:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 81);

    if (WeakRetained == v4)
    {
      objc_storeWeak(a1 + 81, 0);
      if (a1[69] == v4) {
        [a1 dismissToastViewController:v4];
      }
      else {
        [a1[70] removeObject:v4];
      }
    }
  }
}

- (void)resetPendingAutoFillInternalFeedbackToastDismissalTimer
{
  if ([(NSTimer *)self->_activeAutoFillInternalFeedbackToastDismissalTimer isValid])
  {
    -[BrowserController _cancelPendingAutoFillInternalFeedbackToastDismissal]((uint64_t)self);
    -[BrowserController _scheduleAutoFillInternalFeedbackToastDismissal]((uint64_t)self);
  }
}

void __68__BrowserController__scheduleAutoFillInternalFeedbackToastDismissal__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[BrowserController _dismissAutoFillInternalFeedbackToast:](WeakRetained, *(void **)(a1 + 32));
}

- (void)autoFillInternalFeedbackActivityNotice:(id)a3 shouldPresentFeedbackForm:(BOOL)a4
{
  id v6 = a3;
  [(BrowserController *)self dismissToastViewController:self->_currentlyPresentedToastViewController];
  if (a4)
  {
    id v7 = [v6 diagnosticsData];
    id v8 = objc_alloc(MEMORY[0x1E4F3AEF8]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __86__BrowserController_autoFillInternalFeedbackActivityNotice_shouldPresentFeedbackForm___block_invoke;
    v11[3] = &unk_1E6D796A0;
    void v11[4] = self;
    int v9 = (void *)[v8 initWithDiagnosticsData:v7 reportHandler:v11];
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
    [v10 setModalPresentationStyle:1];
    [(BrowserController *)self presentModalViewController:v10 completion:0];
  }
}

void __86__BrowserController_autoFillInternalFeedbackActivityNotice_shouldPresentFeedbackForm___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) activeDocument];
  id v4 = [v3 activeWebView];
  int v5 = [v4 window];
  id v6 = [v5 windowScene];
  [v6 openURL:v7 options:0 completionHandler:0];
}

- (void)navigationBarMetricsDidChange:(id)a3
{
  if (!self->_isPerformingRootViewControllerSizeTransition)
  {
    id v4 = [(BrowserRootViewController *)self->_rootViewController view];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;

    -[BrowserController rootViewControllerViewWillTransitionToSize:](self, "rootViewControllerViewWillTransitionToSize:", v6, v8);
    [(BrowserController *)self updateDynamicBarGeometry];
    -[BrowserController rootViewControllerViewTransitionFromSize:includingSidebar:animated:](self, "rootViewControllerViewTransitionFromSize:includingSidebar:animated:", 0, 0, v6, v8);
    -[BrowserController rootViewControllerViewDidTransitionFromSize:animated:](self, "rootViewControllerViewDidTransitionFromSize:animated:", 0, v6, v8);
  }
}

- (void)compressedNavigationBarWasTapped:(id)a3
{
  if ([(BrowserController *)self scrollViewShouldScrollToTop:self->_scrollView])
  {
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView _scrollToTopIfPossible:1];
  }
}

- (void)navigationBarURLWasTapped:(id)a3 completionHandler:(id)a4
{
}

uint64_t __73__BrowserController__focusNavigationBarForVoiceSearch_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)navigationBarReaderButtonWasTapped:(id)a3
{
  -[BrowserController _readerButtonTapped](self);
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v4, "reportIOSToolbarButtonUsage:withLayout:", 25, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
}

- (void)navigationBarTranslateButtonWasTapped:(id)a3
{
  -[BrowserController _formatMenuButtonPopoverSourceInfo](self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BrowserController navigationBarTranslateButtonWasTappedWithSourceInfo:](self, "navigationBarTranslateButtonWasTappedWithSourceInfo:");
}

- (void)navigationBarTranslateButtonWasTappedWithSourceInfo:(id)a3
{
  id v11 = a3;
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  double v5 = [v4 translationContext];

  double v6 = [v5 availableTargetLocaleIdentifiers];
  uint64_t v7 = [v6 count];
  if (v7)
  {
    if (v7 == 1)
    {
      double v8 = [v6 objectAtIndexedSubscript:0];
      [v5 requestTranslatingWebpageToLocale:v8 completionHandler:0];
    }
    else
    {
      double v8 = (void *)[objc_alloc(MEMORY[0x1E4F3B098]) initWithTranslationContext:v5];
      if (v11) {
        [v8 configurePopoverWithSourceInfo:v11];
      }
      int v9 = [(BrowserController *)self viewControllerToPresentFrom];
      [v9 presentViewController:v8 animated:1 completion:0];
    }
  }
  int v10 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v10, "reportIOSToolbarButtonUsage:withLayout:", 27, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
}

- (void)navigationBarFormatMenuButtonStartedInteraction:(id)a3
{
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  id v3 = [v4 readerContext];
  [v3 checkReaderAvailability];
}

- (void)navigationBarCancelButtonWasTapped:(id)a3
{
  [(BrowserController *)self removeCachedSearchStateForActiveTabDocument];
  -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 reportUnifiedFieldSearchDidCancel];

  [(BrowserController *)self cancelFavorites];
  id v5 = [(TabController *)self->_tabController activeTabDocument];
  [v5 hideFindOnPage];
}

- (void)navigationBarReloadButtonWasTapped:(id)a3
{
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 reloadUserInitiated];

  id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v5, "reportIOSToolbarButtonUsage:withLayout:", 22, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
}

- (void)navigationBarMinimizationChanged
{
}

- (void)navigationBarStopLoadingButtonWasTapped:(id)a3
{
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 stopLoadingUserInitiated];

  id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v5, "reportIOSToolbarButtonUsage:withLayout:", 23, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
}

- (void)navigationBarMediaStateMuteButtonWasTapped:(id)a3 forItem:(id)a4
{
  id v10 = a4;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0;
  double v6 = v10;
  if (v5) {
    double v6 = 0;
  }
  tabController = self->_tabController;
  double v8 = [v6 UUID];
  int v9 = [(TabController *)tabController tabDocumentWithUUID:v8];

  [v9 toggleMediaStateMuted];
}

- (void)navigationBarFormatMenuButtonWasTapped:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F97E48], "sharedLogger", a3);
  [v4 didToggleMagicMenuSBA];

  BOOL v5 = [(BrowserController *)self pageFormatMenuController];
  double v6 = [v5 viewController];
  uint64_t v7 = [v6 presentingViewController];

  if (!v7)
  {
    double v8 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v8, "reportIOSToolbarButtonUsage:withLayout:", 35, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
  }
  int v9 = [(BrowserController *)self viewControllerToPresentFrom];
  id v10 = -[BrowserController _formatMenuButtonPopoverSourceInfo](self);
  char v11 = [v5 presentMenuFromViewController:v9 withSourceInfo:v10 fromSafariViewController:0];

  if (v11)
  {
    uint64_t v12 = [(TabController *)self->_tabController activeTabDocument];
    uint64_t v13 = [v12 assistantController];
    double v14 = [v13 result];
    int v15 = [v14 remoteContentAvailableForFetching];

    if (v15)
    {
      double v16 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v16 didClickSparkleSBA];

      id v17 = [MEMORY[0x1E4F989B0] sharedManager];
      char v18 = [v12 assistantController];
      double v19 = [v18 webpageIdentifier];
      [v17 donateBrowsingAssistantUserInteractionDetectedWithWebPageID:v19 componentType:0 componentIdentifier:&unk_1F3C73818 tableOfContentsArrayLength:0 tableOfContentsTextIndex:0 readerSectionExpanded:0];
    }
    char v20 = [v12 assistantController];
    id v21 = [v12 url];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__BrowserController_navigationBarFormatMenuButtonWasTapped___block_invoke;
    v22[3] = &unk_1E6D793E8;
    void v22[4] = self;
    [v20 updateAssistantContentForURL:v21 completionHandler:v22];
  }
}

uint64_t __60__BrowserController_navigationBarFormatMenuButtonWasTapped___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(*(void *)(result + 32) + 184) updateReaderCardWithSummaryIfNeeded];
    id v3 = *(void **)(*(void *)(v2 + 32) + 184);
    return [v3 reloadBrowsingAssistantIfNeeded];
  }
  return result;
}

- (void)tabDocument:(id)a3 didReceiveAssistantContentOptions:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  id v7 = [(TabController *)self->_tabController activeTabDocument];

  if ((v4 & 0x1F) != 0 && v7 == v6)
  {
    double v8 = [(_SFPageFormatMenuController *)self->_pageFormatMenuController viewController];
    if (([v8 isBeingPresented] & 1) == 0)
    {
      int v9 = [v8 presentingViewController];
      if (v9)
      {
      }
      else if (([v6 isShowingReader] & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    id v10 = [v6 assistantController];
    char v11 = [v6 url];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__BrowserController_tabDocument_didReceiveAssistantContentOptions___block_invoke;
    v13[3] = &unk_1E6D796C8;
    void v13[4] = self;
    id v14 = v6;
    id v12 = v10;
    id v15 = v12;
    [v12 updateAssistantContentForURL:v11 completionHandler:v13];

    goto LABEL_8;
  }
LABEL_9:
}

void __67__BrowserController_tabDocument_didReceiveAssistantContentOptions___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 184) reloadBrowsingAssistantIfNeeded];
    if ([*(id *)(a1 + 40) isShowingReader])
    {
      id v11 = [*(id *)(a1 + 40) readerContext];
      id v3 = [*(id *)(a1 + 48) summary];
      char v4 = _WBSLocalizedString();
      BOOL v5 = _WBSLocalizedString();
      id v6 = [*(id *)(a1 + 40) URLString];
      id v7 = [v6 stringByReplacingOccurrencesOfString:@"https://" withString:@"safari-reader://"];
      double v8 = [*(id *)(a1 + 48) tableOfContentsTitles];
      int v9 = [*(id *)(a1 + 48) tableOfContentsPaths];
      id v10 = [*(id *)(a1 + 48) tableOfContentsTrailingTexts];
      [v11 setArticleSummary:v3 withSummaryHeader:v4 tableOfContentsHeader:v5 readerURLString:v7 titles:v8 paths:v9 trailingText:v10];
    }
  }
}

- (void)handleSearchResult:(id)a3
{
  objc_msgSend(a3, "_sf_punchoutURL");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BrowserController _loadURL:inExternalApplication:forImageAttribution:]((uint64_t)self, v4, 0, 0);
}

- (void)navigationBarFormatMenuButtonBecameUnavailable:(id)a3
{
  id v3 = [(_SFPageFormatMenuController *)self->_pageFormatMenuController viewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (id)navigationBarURLForSharing:(id)a3
{
  id v3 = [(BrowserController *)self tabController];
  id v4 = [v3 activeTabDocument];
  BOOL v5 = [v4 urlForSharing];

  return v5;
}

- (void)navigationBar:(id)a3 didFinishShowingAvailabilityLabelOfType:(int64_t)a4
{
  id v6 = [(TabController *)self->_tabController activeTabDocument];
  BOOL v5 = [v6 navigationBarItem];
  [v5 setDidFinishShowingAvailabilityLabel:1 ofType:a4];
}

- (void)navigationBar:(id)a3 multipleExtensionsButtonTapped:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(BrowserController *)self tabBarDisplayMode] == 2
    || ([(TabController *)self->_tabController activeTabDocument],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isBlank],
        v7,
        v8))
  {
    [(BrowserController *)self webExtensionsButtonTapped:v6];
  }
  else
  {
    [(BrowserController *)self navigationBarFormatMenuButtonWasTapped:v9];
  }
}

- (void)webExtensionsButtonTapped:(id)a3
{
  id v4 = a3;
  [self->_extensionActionPanel _cancel];
  BOOL v5 = [ActionPanel alloc];
  id v6 = [(BrowserController *)self tabController];
  id v7 = [v6 activeTabDocument];
  int v8 = [(ActionPanel *)v5 initWithTabDocument:v7 activityDelegate:self menuStyle:1];
  extensionActionPanel = self->_extensionActionPanel;
  self->_extensionActionPanel = v8;

  [(_SFActivityViewController *)self->_extensionActionPanel setDelegate:self];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:v4];
  [(BrowserController *)self setCanFocusNavigationBarURL:0];
  id v11 = self->_extensionActionPanel;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__BrowserController_webExtensionsButtonTapped___block_invoke;
  v13[3] = &unk_1E6D79060;
  void v13[4] = self;
  -[BrowserController _presentModalViewController:fromPopoverSource:useAdaptivePresentationInCompact:animated:completion:](self, v11, v10, 1, 1, v13);
  id v12 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v12, "reportIOSToolbarButtonUsage:withLayout:", 34, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
}

void __47__BrowserController_webExtensionsButtonTapped___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanFocusNavigationBarURL:1];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 528);
  *(void *)(v2 + 528) = 0;
}

- (void)_presentModalViewController:(void *)a3 fromPopoverSource:(uint64_t)a4 useAdaptivePresentationInCompact:(uint64_t)a5 animated:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a6;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector()) {
      objc_msgSend(v11, "setProvenance:", objc_msgSend(v12, "provenance"));
    }
    uint64_t v14 = [v11 modalPresentationStyle];
    if (v12 && -[BrowserController _shouldPresentViewControllerUsingAdaptivePopover:]((uint64_t)a1, v11))
    {
      [v11 setModalPresentationStyle:7];
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F3B010]) initWithSourceInfo:v12];
      [v15 setPopoverUsesAdaptivePresentationInCompact:a4];
      double v16 = [v11 popoverPresentationController];
      [v15 attachToPopoverPresentationController:v16];
    }
    else if ([v11 modalPresentationStyle] == 7)
    {
      [v11 setModalPresentationStyle:0];
    }
    else if ((unint64_t)(v14 - 1) <= 1)
    {
      -[BrowserController _setSheetPresentationIfNeededForController:]((uint64_t)a1, v11);
    }
    id v17 = [v11 presentingViewController];

    if (v17)
    {
      char v18 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        [v11 presentingViewController];
        objc_claimAutoreleasedReturnValue();
        -[BrowserController _presentModalViewController:fromPopoverSource:useAdaptivePresentationInCompact:animated:completion:]();
      }
    }
    double v19 = [a1 viewControllerToPresentFrom];
    char v20 = objc_msgSend(v19, "_sf_viewControllerToPresentFrom");
    [v20 presentViewController:v11 animated:a5 completion:v13];
  }
}

- (void)navigationBar:(id)a3 extensionButtonTapped:(id)a4 extension:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  [(BrowserController *)self webExtensionButtonTapped:v9 extension:v7];
  int v8 = [MEMORY[0x1E4F97E48] sharedLogger];
  objc_msgSend(v8, "reportIOSToolbarButtonUsage:withLayout:", 20, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
}

- (void)webExtensionButtonTapped:(id)a3 extension:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:v11];
  int v8 = [v6 toolbarItem];
  id v9 = [(BrowserController *)self activeTabForExtensions];
  id v10 = [(BrowserController *)self viewControllerToPresentFrom];
  [v8 performActionForTab:v9 parentViewController:v10 popoverSourceInfo:v7];
}

- (void)showPopupOrPerSitePermissionsForWebExtension:(id)a3
{
  id v11 = a3;
  id v4 = [(BrowserController *)self tabController];
  BOOL v5 = [v4 activeTabDocument];

  id v6 = [v11 toolbarItem];
  id v7 = [v5 unifiedTabBarItem];
  int v8 = [v7 bestButtonForExtensionPopoverSource:v11];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F785C8]) initWithView:v8];
  id v10 = [(BrowserController *)self viewControllerToPresentFrom];
  [v6 showPopupOrPerSitePermissionsForTab:v5 parentViewController:v10 popoverSourceInfo:v9];
}

- (void)showWebExtensionBanner:(id)a3
{
}

- (void)webExtensionWasRemotelyEnabled:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BannerController *)self->_bannerController remotelyEnabledExtensionBanner];
  id v6 = v5;
  if (v5)
  {
    [v5 addExtension:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F78518]) initWithExtension:v4];
    objc_initWeak(&from, self->_bannerController);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__BrowserController_webExtensionWasRemotelyEnabled___block_invoke;
    v10[3] = &unk_1E6D796F0;
    objc_copyWeak(&v11, &from);
    [v6 setDismissButtonHandler:v10];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__BrowserController_webExtensionWasRemotelyEnabled___block_invoke_2;
    v7[3] = &unk_1E6D79718;
    objc_copyWeak(&v8, &location);
    objc_copyWeak(&v9, &from);
    [v6 setOpenActionHandler:v7];
    [(BannerController *)self->_bannerController setRemotelyEnabledExtensionBanner:v6 animated:0];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __52__BrowserController_webExtensionWasRemotelyEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained setRemotelyEnabledExtensionBanner:0 animated:0];
  }
}

void __52__BrowserController_webExtensionWasRemotelyEnabled___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = v3;
    if (v3)
    {
      [v3 setRemotelyEnabledExtensionBanner:0 animated:0];
      id v5 = objc_loadWeakRetained(v11 + 48);
      id v6 = [v5 viewControllerToPresentFromForBrowserController:v11];

      id v7 = (void *)MEMORY[0x1E4F782D8];
      id v8 = [v11 tabController];
      id v9 = [v8 activeTabDocument];
      id v10 = [v7 createManageExtensionsNavigationControllerFromPageFormatMenu:0 activeDocument:v9];

      [v6 presentViewController:v10 animated:1 completion:0];
    }

    id WeakRetained = v11;
  }
}

- (void)showExtensionPermissionBannerForExtensions:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F3B060] sharedInstance];
  id v6 = [v5 defaultSearchEngineForPrivateBrowsing:0];
  id v7 = [v6 searchURLForUserTypedString:@"a"];
  id v8 = [v7 host];
  id v9 = objc_msgSend(v8, "safari_highLevelDomainFromHost");

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F78528]) initWithExtensions:v4 grantedHost:v9];
  objc_initWeak(&location, self->_bannerController);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __64__BrowserController_showExtensionPermissionBannerForExtensions___block_invoke;
  v18[3] = &unk_1E6D796F0;
  objc_copyWeak(&v19, &location);
  [v10 setAllowButtonHandler:v18];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __64__BrowserController_showExtensionPermissionBannerForExtensions___block_invoke_2;
  id v15 = &unk_1E6D79740;
  objc_copyWeak(&v17, &location);
  id v11 = v4;
  id v16 = v11;
  [v10 setResetExtensionPermissionsHandler:&v12];
  -[BannerController setWebExtensionPermissionGrantedBanner:animated:](self->_bannerController, "setWebExtensionPermissionGrantedBanner:animated:", v10, 0, v12, v13, v14, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __64__BrowserController_showExtensionPermissionBannerForExtensions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setWebExtensionPermissionGrantedBanner:0 animated:0];
}

void __64__BrowserController_showExtensionPermissionBannerForExtensions___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v15 = WeakRetained;
    [WeakRetained setWebExtensionPermissionGrantedBanner:0 animated:0];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v2 = +[Application sharedApplication];
    id v3 = [v2 allWebExtensionsControllers];

    obuint64_t j = v3;
    uint64_t v19 = [v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v19)
    {
      uint64_t v17 = *(void *)v27;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v26 + 1) + 8 * v20);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v21 = *(id *)(a1 + 32);
          uint64_t v5 = [v21 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v5)
          {
            uint64_t v6 = *(void *)v23;
            do
            {
              uint64_t v7 = 0;
              do
              {
                if (*(void *)v23 != v6) {
                  objc_enumerationMutation(v21);
                }
                id v8 = [*(id *)(*((void *)&v22 + 1) + 8 * v7) extension];
                id v9 = [v4 webExtensionForExtension:v8];

                id v10 = [MEMORY[0x1E4F1CAD0] set];
                id v11 = (void *)MEMORY[0x1E4F1CAD0];
                uint64_t v12 = [v9 grantedPermissionOrigins];
                uint64_t v13 = [v12 allKeys];
                uint64_t v14 = [v11 setWithArray:v13];
                [v9 removeGrantedPermissions:v10 origins:v14 exactPatternMatchesOnly:1];

                ++v7;
              }
              while (v5 != v7);
              uint64_t v5 = [v21 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v5);
          }

          ++v20;
        }
        while (v20 != v19);
        uint64_t v19 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v19);
    }

    id WeakRetained = v15;
  }
}

- (void)showPrivateBrowsingPrivacyProtectionsBanner:(id)a3
{
}

void __68__BrowserController__showPrivateBrowsingExplanationSheetIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([WeakRetained shouldShowWhatsNewInPrivateBrowsingSheet])
    {
      [WeakRetained[35] showWhatsNewInPrivateBrowsingSheet];
    }
    else if ([WeakRetained shouldShowTurnOnLockedPrivateBrowsingSheet])
    {
      [WeakRetained[35] showTurnOnLockedPrivateBrowsingSheet];
    }
  }
}

void __56__BrowserController__showDefaultBrowserSheetIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) browserIconReplacementAlertController:a2 completionHandler:&__block_literal_global_654];
  if (v3)
  {
    id v5 = v3;
    id v4 = [*(id *)(a1 + 40) viewControllerToPresentFrom];
    [v4 presentViewController:v5 animated:1 completion:0];

    id v3 = v5;
  }
}

void __56__BrowserController__showDefaultBrowserSheetIfNecessary__block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 696) setHidden:1];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 696);
  *(void *)(v2 + 696) = 0;
}

- (BOOL)shouldShowWhatsNewInPrivateBrowsingSheet
{
  return 0;
}

- (BOOL)shouldShowTurnOnLockedPrivateBrowsingSheet
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([MEMORY[0x1E4F97EA0] isLockedPrivateBrowsingEnabled]
    && [v2 BOOLForKey:*MEMORY[0x1E4F99340]]
    && [v2 BOOLForKey:*MEMORY[0x1E4F99048]]
    && ([v2 BOOLForKey:*MEMORY[0x1E4F993B8]] & 1) == 0)
  {
    int v3 = [v2 BOOLForKey:*MEMORY[0x1E4F99150]] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)resetWhatsNewInPrivateBrowsingStartPageModule
{
  -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 resetPrivateBrowsingExplanation];
}

- (id)itemProviderForNavigationBar:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F28D78];
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  id v5 = objc_msgSend(v3, "safari_itemProviderForTabDocument:", v4);

  return v5;
}

- (int64_t)dataOwnerForNavigationBar:(id)a3
{
  int v3 = [(BrowserController *)self tabController];
  id v4 = [v3 activeTabDocument];

  if ([v4 hasQuickLookContent])
  {
    id v5 = [v4 quickLookDocument];
    uint64_t v6 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v7 = [v5 sourceURL];
    if ([v6 isURLManaged:v7]) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 3;
    }
  }
  else
  {
    int64_t v8 = 3;
  }

  return v8;
}

- (id)currentContentUUIDForNavigationBar:(id)a3
{
  int v3 = [(BrowserController *)self tabController];
  id v4 = [v3 activeTabDocument];
  id v5 = [v4 uuid];

  return v5;
}

- (void)navigationBar:(id)a3 didProduceNavigationIntent:(id)a4
{
}

- (void)navigationBar:(id)a3 didCreateLeadingToolbar:(id)a4 trailingToolbar:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  [(_SFBarManager *)self->_barManager registerToolbar:v8 withLayout:0 persona:0];
  [(_SFBarManager *)self->_barManager registerToolbar:v7 withLayout:1 persona:0];
}

- (void)navigationBarDidLayoutSubviews:(id)a3
{
}

- (void)_updateSidebarStickinessAfterUserAction
{
  if (a1 && [a1 _bookmarksPresentationStyle] == 2)
  {
    id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    objc_msgSend(v2, "setBool:forKey:", objc_msgSend(a1[94], "isShowingSidebar"), @"ShowSidebar");
  }
}

uint64_t __61__BrowserController__showOrHideSidebarInLandscapeIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (void *)v1[94];
  uint64_t v3 = -[BrowserController shouldShowSidebarInLandscape](v1);
  return [v2 setShowingSidebar:v3 completion:0];
}

- (void)_perSitePreferencesDidChange:(id)a3
{
  id v7 = a3;
  if (objc_msgSend(v7, "_sf_perSitePreferenceNotificationWasSentFromAnotherProcess"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
    id v5 = [WeakRetained perSitePreferencesVendor];
    uint64_t v6 = [v5 sharedUserMediaPermissionController];
    [v6 reloadPreferences];

    -[BrowserController _reloadPresentedPreferencesListViewController](self);
  }
}

- (void)_contentBlockersPerSitePreferenceDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__BrowserController__contentBlockersPerSitePreferenceDidChange___block_invoke;
  v6[3] = &unk_1E6D791E8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __64__BrowserController__contentBlockersPerSitePreferenceDidChange___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E4F99160]);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 344), "allTabDocuments", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 URL];
        id v10 = objc_msgSend(v9, "safari_userVisibleHostWithoutWWWSubdomain");
        int v11 = [v10 isEqualToString:v3];

        if (v11) {
          [v8 reload];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_perSiteLockdownModePreferenceDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__BrowserController__perSiteLockdownModePreferenceDidChange___block_invoke;
  v6[3] = &unk_1E6D791E8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __61__BrowserController__perSiteLockdownModePreferenceDidChange___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E4F99168]);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 344), "allTabDocuments", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 URL];
        id v10 = objc_msgSend(v9, "safari_userVisibleHostWithoutWWWSubdomain");
        int v11 = [v10 isEqualToString:v3];

        if (v11) {
          [v8 reload];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (BOOL)isShowingCompletionDetail
{
  id v2 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  char v3 = [v2 isShowingCompletionDetail];

  return v3;
}

- (void)prepareToNavigateInTabDocument:(id)a3
{
  id v6 = a3;
  id v4 = [(BrowserController *)self tabController];
  id v5 = [v4 activeTabDocument];

  if (v5 == v6) {
    [(BrowserController *)self dismissTransientUIAnimated:1];
  }
}

- (void)configureMenuAndAdoptButton:(id)a3
{
  id v5 = a3;
  id v4 = [(BrowserController *)self pageFormatMenuController];
  [v4 configureMenuAndAdoptButton:v5];
}

- (BrowserController)initWithStateData:(id)a3 browserWindowController:(id)a4 savedState:(id)a5 controlledByAutomation:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [v10 UUID];
  long long v14 = [v10 sceneID];
  long long v15 = [(BrowserController *)self initWithUUID:v13 sceneID:v14 browserWindowController:v11 tabGroupManager:0 controlledByAutomation:v6];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_savedState, a5);
    -[BrowserController _readSavedState]((uint64_t)v15);
    id v16 = v15;
  }

  return v15;
}

id __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained[43] activeTabDocument];
    id v4 = [v3 backListMenuWithLimit:30];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

id __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    char v3 = [WeakRetained[43] activeTabDocument];
    id v4 = [v3 forwardListMenuWithLimit:30];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

id __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_3(uint64_t a1)
{
  v74[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (SFDebugMenuEnabled() & 1) != 0)
  {
    char v3 = [WeakRetained[43] activeTabDocument];
    id v4 = (void *)MEMORY[0x1E4FB13F0];
    id v55 = [v3 frontWebView];
    char v54 = objc_msgSend(v4, "_sf_debugKillWebProcessActionForWebView:", v55);
    v74[0] = v54;
    id v5 = (void *)MEMORY[0x1E4FB13F0];
    BOOL v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari"];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_4;
    v69[3] = &unk_1E6D79808;
    id v57 = v3;
    id v70 = v57;
    id v7 = WeakRetained;
    dispatch_time_t v71 = v7;
    id v8 = [v5 actionWithTitle:@"View in SFSafariViewController" image:v6 identifier:0 handler:v69];
    v74[1] = v8;
    id v9 = (void *)MEMORY[0x1E4FB13F0];
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"sparkles.square.filled.on.square"];
    id v11 = [v9 actionWithTitle:@"Start Automation Session" image:v10 identifier:0 handler:&__block_literal_global_694];
    v74[2] = v11;
    id v12 = (void *)MEMORY[0x1E4FB13F0];
    long long v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lifepreserver"];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_6;
    v67[3] = &unk_1E6D79830;
    long long v14 = v7;
    objc_super v68 = v14;
    long long v15 = [v12 actionWithTitle:@"Show Crash Banner" image:v13 identifier:0 handler:v67];
    v74[3] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    int v56 = (void *)[v16 mutableCopy];

    uint64_t v17 = [v57 appBanner];
    char v18 = v17;
    if (v17)
    {
      int v19 = [v17 isPinnedToTop];
      char v20 = v19;
      id v21 = @"Pin App Banner";
      if (v19)
      {
        id v21 = @"Unpin App Banner";
        long long v22 = @"pin.slash";
      }
      else
      {
        long long v22 = @"pin";
      }
      long long v23 = v21;
      long long v24 = [MEMORY[0x1E4FB1818] systemImageNamed:v22];
      char v25 = v20 ^ 1;
      long long v26 = (void *)MEMORY[0x1E4FB13F0];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_7;
      v63[3] = &unk_1E6D79858;
      char v64 = v14;
      char v66 = v25;
      id v65 = v57;
      long long v27 = [v26 actionWithTitle:v23 image:v24 identifier:0 handler:v63];
      [v56 addObject:v27];
    }
    id v28 = v14[97];
    long long v29 = [WeakRetained[43] activeTabGroup];
    id v30 = [v28 shareRecordForTabGroup:v29];
    LOBYTE(v28) = v30 == 0;

    if ((v28 & 1) == 0)
    {
      id v31 = (void *)MEMORY[0x1E4FB1970];
      uint64_t v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.checkmark"];
      int v33 = [v57 isUnread];
      char v34 = v33;
      uint64_t v35 = @"Mark Unread";
      if (v33)
      {
        uint64_t v35 = @"Mark Read";
        unint64_t v36 = @"envelope.badge";
      }
      else
      {
        unint64_t v36 = @"envelope.open";
      }
      CGRect v37 = v35;
      int v38 = [MEMORY[0x1E4FB1818] systemImageNamed:v36];
      int v39 = (void *)MEMORY[0x1E4FB13F0];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_8;
      v60[3] = &unk_1E6D79880;
      id v61 = v57;
      char v62 = v34;
      uint64_t v40 = [v39 actionWithTitle:v37 image:v38 identifier:0 handler:v60];

      BOOL v73 = v40;
      id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      char v42 = [v31 menuWithTitle:@"Shared Tab Group" image:v32 identifier:0 options:0 children:v41];
      [v56 addObject:v42];

      if ([v14[97] enableSharedTabGroupsFastSyncPresence])
      {
        char v43 = (void *)MEMORY[0x1E4FB1970];
        int v44 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.checkmark"];
        int v45 = (void *)MEMORY[0x1E4FB16B8];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_9;
        v58[3] = &unk_1E6D798F8;
        objc_copyWeak(&v59, v1);
        v46 = [v45 elementWithUncachedProvider:v58];
        v72 = v46;
        double v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        uint64_t v48 = [v43 menuWithTitle:@"FastSync Presence" image:v44 identifier:0 options:0 children:v47];

        [v48 setSubtitle:@"Enabled"];
        [v56 addObject:v48];

        objc_destroyWeak(&v59);
      }
      else
      {
        char v50 = (void *)MEMORY[0x1E4FB13F0];
        double v51 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.xmark"];
        char v52 = [v50 actionWithTitle:@"FastSync Presence" image:v51 identifier:0 handler:&__block_literal_global_770];

        [v52 setSubtitle:@"Disabled"];
        [v52 setAttributes:1];
        [v56 addObject:v52];
      }
    }
    char v49 = (void *)[v56 copy];
  }
  else
  {
    char v49 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v49;
}

void __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_4(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F3AEB8]);
  char v3 = [*(id *)(a1 + 32) URL];
  id v4 = (id)[v2 initWithURL:v3];

  [*(id *)(a1 + 40) _presentModalViewController:v4 fromBarItem:*MEMORY[0x1E4F788B8] completion:0];
}

void __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_5()
{
  id v1 = +[Application sharedApplication];
  id v0 = [v1 automationController];
  [v0 createAutomationSessionWithIdentifier:@"InternalActionSession"];
}

uint64_t __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowingCrashBanner:1 animated:1];
}

uint64_t __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAppBannerPinnedToTop:*(unsigned __int8 *)(a1 + 48) forTabDocument:*(void *)(a1 + 40)];
}

uint64_t __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUnread:*(unsigned char *)(a1 + 40) == 0];
}

void __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = (void *)*((void *)WeakRetained + 97);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_10;
    v7[3] = &unk_1E6D798D0;
    id v8 = v3;
    [v6 getCurrentConnectionStateWithCompletionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, MEMORY[0x1E4F1CBF0]);
  }
}

void __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 allKeys];
  id v5 = [v4 sortedArrayUsingSelector:sel_compare_];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_11;
  v8[3] = &unk_1E6D798A8;
  id v6 = v3;
  id v9 = v6;
  id v7 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 integerValue];

  if ([v3 length])
  {
    id v6 = v3;
    if (v5 == -1)
    {
      id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.questionmark"];
      id v8 = @"Not Connected";
    }
    else if (v5 == -2)
    {
      id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.xmark"];
      id v8 = @"Paused";
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.checkmark"];
      objc_msgSend(NSString, "stringWithFormat:", @"%zd connections", v5);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v12 = (void *)MEMORY[0x1E4FB13F0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_13;
    v16[3] = &unk_1E6D79830;
    id v13 = v6;
    id v17 = v13;
    id v9 = [v12 actionWithTitle:v13 image:v7 identifier:0 handler:v16];
    [v9 setSubtitle:v8];
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB13F0] actionWithTitle:@"Personal" image:0 identifier:0 handler:&__block_literal_global_744];
    [v9 setAttributes:1];
    if (v5 == -1)
    {
      long long v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.questionmark"];
      [v9 setImage:v14];

      [v9 setSubtitle:@"Not Connected"];
    }
    else
    {
      id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.checkmark"];
      [v9 setImage:v10];

      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%zu connections", v5);
      [v9 setSubtitle:v11];
    }
    id v8 = &stru_1F3C268E8;
  }

  return v9;
}

void __105__BrowserController_initWithUUID_sceneID_browserWindowController_tabGroupManager_controlledByAutomation___block_invoke_13(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:v1];
}

- (void)closeWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  uint64_t v5 = [WeakRetained session];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v9 = [v8 openSessions];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3321888768;
    v12[2] = __32__BrowserController_closeWindow__block_invoke;
    v12[3] = &__block_descriptor_40_ea8_32c45_ZTSKZ32__BrowserController_closeWindow_E3__1_e24_B16__0__UISceneSession_8l;
    id v10 = self->_sceneID;
    id v13 = v10;
    objc_msgSend(v9, "safari_anyObjectPassingTest:", v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v2 = (id *)&v13;
  }
  id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v11 requestSceneSessionDestruction:v7 options:0 errorHandler:&__block_literal_global_817];

  if (!v6) {
}
  }

uint64_t __32__BrowserController_closeWindow__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 persistentIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __32__BrowserController_closeWindow__block_invoke_814(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __32__BrowserController_closeWindow__block_invoke_814_cold_1();
  }
}

- (void)attachToScene:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 session];
  [(BrowserController *)self scene:v5 willConnectToSession:v4 options:0];
}

- (id)detachFromScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  [(BrowserController *)self sceneDidDisconnect:WeakRetained];
  return WeakRetained;
}

- (void)_sceneSession
{
  uint64_t v1 = a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a1[40])
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 111);
      id v3 = WeakRetained;
      if (WeakRetained)
      {
        uint64_t v1 = [WeakRetained session];
      }
      else
      {
        uint64_t v4 = [MEMORY[0x1E4FB1438] sharedApplication];
        id v5 = [v4 openSessions];

        long long v16 = 0u;
        long long v17 = 0u;
        long long v14 = 0u;
        long long v15 = 0u;
        id v6 = v5;
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v15;
          while (2)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v15 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
              id v11 = (void *)v1[40];
              id v12 = objc_msgSend(v10, "persistentIdentifier", (void)v14);
              LOBYTE(v11) = [v11 isEqualToString:v12];

              if (v11)
              {
                uint64_t v1 = v10;
                goto LABEL_16;
              }
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
        uint64_t v1 = 0;
LABEL_16:
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)updateInsetsForBackgroundWebView:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(TabController *)self->_tabController activeTabDocument];
  id v5 = [v4 view];
  [v5 applyGeometryToWebView:v6];
}

- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3
{
  [(_SFWebView *)self->_webView _endInteractiveObscuredInsetsChange];
  self->_interactivelyChangingObscuredInsets = 0;
  uint64_t v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 webViewDidChangeSize];

  animationPendingDynamicBarAnimatorSteadyState = (void (**)(void))self->_animationPendingDynamicBarAnimatorSteadyState;
  if (animationPendingDynamicBarAnimatorSteadyState)
  {
    animationPendingDynamicBarAnimatorSteadyState[2]();
    id v6 = self->_animationPendingDynamicBarAnimatorSteadyState;
    self->_animationPendingDynamicBarAnimatorSteadyState = 0;
  }
}

- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3
{
  self->_interactivelyChangingObscuredInsets = 1;
}

- (void)document:(id)a3 willMakeReaderVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  id v6 = [(TabController *)self->_tabController activeTabDocument];

  uint64_t v7 = v13;
  if (v6 == v13)
  {
    if (v4) {
      [v13 readerWebView];
    }
    else {
    uint64_t v8 = [v13 webView];
    }
    -[BrowserController setWebView:]((uint64_t)self, v8);
    if (!v4
      && ![(BrowserRootViewController *)self->_rootViewController keepBarsMinimized]
      && ![(BrowserRootViewController *)self->_rootViewController isInYttriumState])
    {
      id v9 = [(BrowserRootViewController *)self->_rootViewController dynamicBarAnimator];
      [v9 attemptTransitionToState:1 animated:0];
    }
    id v10 = [(ContinuousReadingViewController *)self->_continuousReadingViewController previewView];
    [v10 removeFromSuperview];
    [(UIScrollView *)self->_scrollView addSubview:v10];
    id v11 = [(ContinuousReadingViewController *)self->_continuousReadingViewController previousItemPreviewView];
    [v11 removeFromSuperview];
    [(UIScrollView *)self->_scrollView addSubview:v11];
    id v12 = -[BrowserController _visibleAppBanner]((uint64_t)self);
    [v12 removeFromSuperview];
    -[BrowserController _setShowingAppBanner:isShowing:]((uint64_t)self, v12, 1);

    uint64_t v7 = v13;
  }
}

- (BOOL)shouldDeferHistoryUpdatesForWKWebView:(id)a3
{
  id v4 = a3;
  id v5 = [(TabDocument *)self->_speculativeLoadDocument webView];
  if (v5 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v6 = [(TabDocument *)self->_previewDocument webView];
    BOOL v7 = v6 == v4;
  }
  return v7;
}

- (double)_verticalOffsetForContinuousReadingBanner
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0.0;
  }
  id v2 = [*(id *)(a1 + 88) topBannerView];
  id v3 = v2;
  if (v2)
  {
    [v2 frame];
    double v5 = v4;
    id v6 = [*(id *)(a1 + 768) topBannersSeparableFromStatusBar];
    if ([v6 count])
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v32;
        double v10 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v31 + 1) + 8 * i) bounds];
            double v10 = v10 + CGRectGetHeight(v38);
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v8);
      }
      else
      {
        double v10 = 0.0;
      }

      double v12 = -v10 - v5;
    }
    else
    {
      id v13 = *(void **)(a1 + 280);
      long long v14 = [v13 documentAndTopBarsContainerView];
      [v13 navigationBarFrameInCoordinateSpace:v14];
      double MaxY = CGRectGetMaxY(v39);

      double v16 = -[BrowserController additionalContentHeightForBanners](a1);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v17 = objc_msgSend(*(id *)(a1 + 768), "topBannersAnchoredToStatusBar", 0);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      double v19 = MaxY + v16;
      if (v18)
      {
        uint64_t v20 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * j) bounds];
            double v19 = v19 + CGRectGetHeight(v40);
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v18);
      }

      long long v22 = *(void **)(a1 + 304);
      long long v23 = [*(id *)(a1 + 280) documentAndTopBarsContainerView];
      objc_msgSend(v22, "convertPoint:fromView:", v23, 0.0, v19);
      double v25 = v24;

      if (v25 >= 0.0 || ([*(id *)(a1 + 88) isUserInteractingWithContainer] & 1) != 0) {
        double v12 = -v5;
      }
      else {
        double v12 = v25 - v5;
      }
    }
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

- (uint64_t)_setShowingOverlayForBanner:(int)a3 showing:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    id v7 = [v5 overlayProvider];
    uint64_t v8 = [v7 isAvailable];
    if (v8)
    {
      if (a3)
      {
        uint64_t v9 = [v7 overlayViewController];
        double v10 = [v9 view];

        id v11 = [v10 superview];
        double v12 = *(void **)(a1 + 304);

        if (v11 != v12)
        {
          id v13 = [*(id *)(a1 + 280) hostViewControllerForOverlay];
          [v7 setDelegate:a1];
          [v7 showOverlayInScrollView:*(void *)(a1 + 304) viewController:v13];
          -[BrowserController _updateAppInfoOverlayFrame](a1);
        }
      }
      else
      {
        [v7 hideOverlayAnimated:0];
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isShowingAppInfoOverlay
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  double v4 = [v3 appBanner];
  id v5 = [v4 overlayProvider];
  if ([v5 isAvailable])
  {
    id v6 = [v5 overlayViewController];
    id v7 = [v6 view];

    if (v7)
    {
      uint64_t v8 = [v7 superview];
      BOOL v9 = v8 == self->_scrollView;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __42__BrowserController__updateTabGroupBanner__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained showTabView];
  }
}

void __46__BrowserController_updateCollaborationButton__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__BrowserController_updateCollaborationButton__block_invoke_2;
  block[3] = &unk_1E6D79970;
  double v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__BrowserController_updateCollaborationButton__block_invoke_2(uint64_t a1)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabGroupOrTabGroupVisibleInSwitcher];
  char v2 = WBSIsEqual();

  if (v2)
  {
    if (*(void *)(a1 + 48))
    {
      id v9 = +[FeatureManager sharedFeatureManager];
      int v3 = [v9 areSharedTabGroupsEnabled];

      uint64_t v4 = v3 ^ 1u;
    }
    else
    {
      uint64_t v4 = 1;
    }
    [*(id *)(*(void *)(a1 + 32) + 832) setBarItem:16 hidden:v4];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 832) collaborationButton];

    if (!v5)
    {
      id v10 = (id)[*(id *)(a1 + 32) newCollaborationButtonWithActiveTabGroup:*(void *)(a1 + 40) existingShare:*(void *)(a1 + 48)];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 832), "setCollaborationButton:");
    }
    id v11 = [*(id *)(*(void *)(a1 + 32) + 768) tabGroupBanner];
    id v6 = [v11 collaborationButton];

    if (!v6)
    {
      id v7 = (void *)[*(id *)(a1 + 32) newCollaborationButtonWithActiveTabGroup:*(void *)(a1 + 40) existingShare:*(void *)(a1 + 48)];
      [v11 setCollaborationButton:v7];
    }
  }
}

- (void)_beganSharingTabGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__BrowserController__beganSharingTabGroup___block_invoke;
  v7[3] = &unk_1E6D791E8;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __43__BrowserController__beganSharingTabGroup___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(*(void *)(a1 + 40) + 344) activeTabGroup];
  id v4 = [v3 uuid];
  LOBYTE(v2) = [v2 isEqualToString:v4];

  if (v2)
  {
    id v5 = *(void **)(a1 + 40);
    [v5 updateCollaborationButton];
  }
}

- (void)shareDidUpdateForTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  [(TabController *)self->_tabController clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID:v4];
  id v5 = [(TabController *)self->_tabController activeTabGroup];
  id v6 = [v5 uuid];
  char v7 = [v6 isEqualToString:v4];

  if (v7)
  {
    tabGroupManager = self->_tabGroupManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__BrowserController_shareDidUpdateForTabGroupWithUUID___block_invoke;
    v9[3] = &unk_1E6D79060;
    void v9[4] = self;
    [(WBTabGroupManager *)tabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:v9];
  }
}

uint64_t __55__BrowserController_shareDidUpdateForTabGroupWithUUID___block_invoke(uint64_t a1)
{
  -[BrowserController _updateTabGroupBanner](*(id **)(a1 + 32));
  [*(id *)(a1 + 32) updateTabOverviewButton];
  char v2 = *(void **)(a1 + 32);
  return [v2 updateCollaborationButton];
}

- (id)linkPreviewViewControllerForNavigationIntent:(id)a3
{
  id v4 = [a3 URL];
  id v5 = [(BrowserController *)self linkPreviewViewControllerForURL:v4];

  return v5;
}

- (id)linkPreviewViewControllerForURL:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self->_tabController activeTabDocument];
  id v6 = [v5 previewViewControllerForURL:v4];

  return v6;
}

- (void)commitLinkPreviewViewController:(id)a3
{
  id v5 = a3;
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 commitPreviewViewController:v5];
}

- (void)linkPreviewProviderWillDismissPreview
{
  id v2 = [(TabController *)self->_tabController activeTabDocument];
  [v2 willDismissLinkPreviewViewController];
}

- (void)browserViewController:(id)a3 didCreateNavigationBar:(id)a4
{
  id v7 = a4;
  id v5 = [(TabController *)self->_tabController activeTabDocument];
  id v6 = [v5 navigationBarItem];
  [v7 setItem:v6];
}

- (void)browserViewController:(id)a3 didCreateUnifiedBar:(id)a4
{
}

- (int64_t)browserViewController:(id)a3 sidebarStyleForViewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  int64_t v8 = -[BrowserController bookmarksPresentationStyleForViewOfSize:](self, "bookmarksPresentationStyleForViewOfSize:", width, height);
  if (v8) {
    int64_t v9 = v8 != 2;
  }
  else {
    int64_t v9 = [v7 sidebarStyle];
  }

  return v9;
}

- (void)browserViewController:(id)a3 didChangeShowingSidebar:(BOOL)a4
{
  [(_SFBarManager *)self->_barManager setBarItem:3 selected:a4];
  [(BrowserController *)self updateTabGroupButtonsVisibility];
}

- (void)browserViewController:(id)a3 didChangeSidebarStyle:(int64_t)a4
{
  [(LibraryController *)self->_libraryController browserViewControllerDidChangeSidebarStyle];
  [(BrowserController *)self updateTabGroupButtonsVisibility];
}

- (id)sidebarContentViewControllerForSidebarUIProxy:(id)a3
{
  id v4 = objc_alloc_init(LibraryViewController);
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [(LibraryController *)self->_libraryController setSidebarViewController:v4];

  return v5;
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 presentingViewController];
  id v11 = (void *)v10;
  if (v10) {
    double v12 = (void *)v10;
  }
  else {
    double v12 = v8;
  }
  id v13 = v12;

  [v13 dismissViewControllerAnimated:1 completion:0];
  if (a4)
  {
    uint64_t v14 = [v8 addBookmarkAnalyticsHandler];
    long long v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
    double v16 = (void *)MEMORY[0x1E4F98C08];
    webView = self->_webView;
    uint64_t v18 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__BrowserController_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke;
    v19[3] = &unk_1E6D799C0;
    id v20 = v9;
    [v16 saveLeadImageFromWebView:webView toLeadImageCacheRegisteredWithMetadataManager:v18 completionHandler:v19];
  }
}

void __75__BrowserController_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__BrowserController_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_875;
    v9[3] = &unk_1E6D791E8;
    uint64_t v10 = *(id *)(a1 + 32);
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v9);

    id v8 = v10;
  }
  else
  {
    if (!v6) {
      goto LABEL_4;
    }
    id v8 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__BrowserController_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1();
    }
  }

LABEL_4:
}

void __75__BrowserController_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_875(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  -[WebBookmarkCollection updateBookmark:withLeadImageURL:](v2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  return ![(BrowserController *)self showDemoModeFeatureDisabledAlert];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [a3 presentedViewController];
  modalBookmarksController = self->_modalBookmarksController;

  if (v4 == modalBookmarksController)
  {
    id v6 = self->_modalBookmarksController;
    self->_modalBookmarksController = 0;
  }
}

- (WBSAppReviewPromptManager)appReviewPromptManager
{
  appReviewPromptManager = self->_appReviewPromptManager;
  if (!appReviewPromptManager)
  {
    id v4 = +[Application sharedApplication];
    id v5 = [v4 webExtensionsControllerForProfileServerID:*MEMORY[0x1E4F980C8]];

    id v6 = (WBSAppReviewPromptManager *)[objc_alloc(MEMORY[0x1E4F98958]) initWithPresenter:self extensionsController:v5];
    id v7 = self->_appReviewPromptManager;
    self->_appReviewPromptManager = v6;

    appReviewPromptManager = self->_appReviewPromptManager;
  }
  return appReviewPromptManager;
}

- (void)presentPromptForAppReviewPromptManager:(id)a3
{
  id v5 = +[AppStoreReviewController sharedController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  [v5 showAppReviewPromptInSceneIfNeeded:WeakRetained];
}

- (void)dismissCompletionDetail
{
  int v3 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  [v3 dismissCompletionDetailWindowAndResumeEditingIfNeeded:0 completionHandler:0];

  [(BrowserController *)self setFavoritesState:0];
}

- (void)completionDetailViewControllerDidDismiss:(id)a3
{
  -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 dismissCompletionDetailWindowAndResumeEditingIfNeeded:1 completionHandler:0];
}

- (void)didCloseBrowserWindow
{
  [(WBProfileWindow *)self->_profileWindow willClose];
  -[BrowserController setWebView:]((uint64_t)self, 0);
  [(TabController *)self->_tabController clearBrowserController];
  tabController = self->_tabController;
  self->_tabController = 0;

  tabCollectionViewProvider = self->_tabCollectionViewProvider;
  self->_tabCollectionViewProvider = 0;

  barManager = self->_barManager;
  [(_SFBarManager *)barManager cancelCoalescedUpdates];
}

- (void)fraudWarningsToggled
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v17 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v17 synchronize];
  uint64_t v3 = objc_msgSend(v17, "safari_warnAboutFraudulentWebsites");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(BrowserController *)self browserWindowController];
  id v5 = [v4 browserControllers];

  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v9 = [v8 tabController];
        uint64_t v10 = [v9 allTabDocuments];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v21;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = [*(id *)(*((void *)&v20 + 1) + 8 * v13) webView];
              long long v15 = [v14 configuration];
              double v16 = [v15 preferences];
              [v16 _setSafeBrowsingEnabled:v3];

              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v6);
      id v5 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
}

- (BOOL)dismissTransientUIAnimated:(BOOL)a3 options:(unint64_t)a4
{
  return -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:]((uint64_t)self, a3, a4, 0);
}

void __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke(uint64_t a1)
{
}

void __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_2(uint64_t a1)
{
}

void __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 752) setShowingSidebar:0 completion:0];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __84__BrowserController__dismissTransientUIAnimated_dismissalOptions_completionHandler___block_invoke_5(uint64_t a1)
{
}

- (void)dismissPageFormatMenu
{
}

- (void)presentModalViewController:(id)a3 fromPopoverSource:(id)a4
{
}

- (void)_presentModalViewController:(uint64_t)a3 fromBarItem:(uint64_t)a4 animated:(void *)a5 completion:
{
  id v11 = a2;
  id v9 = a5;
  if (a1)
  {
    if (*MEMORY[0x1E4F788B8] == a3 || a3 == 11 && ![a1 hasDedicatedDownloadsToolbarItem])
    {
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = -[BrowserController _popoverSourceInfoForBarItem:](a1, a3);
    }
    -[BrowserController _presentModalViewController:fromPopoverSource:useAdaptivePresentationInCompact:animated:completion:](a1, v11, v10, a3 != 11, a4, v9);
  }
}

- (void)presentModalViewController:(id)a3 completion:(id)a4
{
}

- (void)_presentModalViewController:(id)a3 fromBarItem:(int64_t)a4 completion:(id)a5
{
}

- (uint64_t)_shouldPresentViewControllerUsingAdaptivePopover:(uint64_t)IsPad
{
  id v3 = a2;
  if (IsPad)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int IsPad = _SFDeviceIsPad();
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = [v3 viewControllers];
        id v5 = [v4 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_8;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (_SFDeviceIsPad() & 1) == 0 && (objc_msgSend(v3, "_sf_isPKAddPassesViewController") & 1) != 0)
      {
LABEL_8:
        int IsPad = 0;
      }
      else
      {
        int IsPad = objc_msgSend(v3, "_sf_isMFMailComposeViewController") ^ 1;
      }
    }
  }

  return IsPad;
}

- (void)_setSheetPresentationIfNeededForController:(uint64_t)a1
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if ((_SFDeviceIsPad() & 1) == 0 && (SFDeviceIsAlwaysReachable() & 1) == 0)
    {
      id v4 = [*(id *)(a1 + 280) capsuleCollectionViewLayout];
      char v5 = WBSIsEqual();

      if (v5)
      {
        if (objc_msgSend(v3, "safari_prefersHalfHeightSheetPresentationWithLoweredBar"))
        {
          uint64_t v6 = [v3 presentationController];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v7 = v6;
            id v8 = [MEMORY[0x1E4FB1C30] mediumDetent];
            v11[0] = v8;
            id v9 = [MEMORY[0x1E4FB1C30] largeDetent];
            v11[1] = v9;
            uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
            [v7 setDetents:v10];
          }
        }
      }
    }
  }
}

- (void)setPresentingModalBookmarksController:(BOOL)a3 withExclusiveCollection:(id)a4 bookmarkUUIDString:(id)a5 animated:(BOOL)a6
{
  -[BrowserController _setPresentingModalBookmarksController:exclusively:importHandler:withCollection:bookmarkUUIDString:animated:completion:]((id *)&self->super.super.super.isa, a3, a4 != 0, 0, a4, a5, a6, 0);
}

- (BookmarksNavigationController)_newModalBookmarksControllerWithCollection:(uint64_t)a3 showsOnlyActiveCollection:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [[BookmarksNavigationController alloc] initWithBookmarksDelegate:a1 linkPreviewProvider:a1 collection:v5 showsOnlyActiveCollection:a3];
    [(BookmarksNavigationController *)v6 setNavigationIntentHandler:a1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __140__BrowserController__setPresentingModalBookmarksController_exclusively_importHandler_withCollection_bookmarkUUIDString_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)showBookmarksPanelWithNonAnimatedTransition
{
  int64_t v3 = [(BrowserController *)self _bookmarksPresentationStyle];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (!v3)
    {
      [(BrowserController *)self setPresentingModalBookmarksController:1 withExclusiveCollection:0 bookmarkUUIDString:0 animated:0];
    }
  }
  else
  {
    sidebarUIProxdouble y = self->_sidebarUIProxy;
    [(SidebarUIProxy *)sidebarUIProxy setShowingSidebar:1 completion:0];
  }
}

- (void)makeSpaceForTabWithPrivateBrowsing:(BOOL)a3 resultHandler:(id)a4
{
  BOOL v4 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  if ([(TabController *)self->_tabController canAddNewTabForPrivateBrowsing:v4])
  {
    v8[2](v8, 1);
  }
  else
  {
    id v6 = [[TabLimitCleanupWizard alloc] initForPrivateBrowsing:v4 withBrowserController:self resultHandler:v8];
    id v7 = [v6 makeViewController];
    [(BrowserController *)self _presentModalViewController:v7 fromBarItem:7 completion:0];
  }
}

- (void)barManager:(id)a3 didReceiveTapForBarItem:(int64_t)a4
{
  id v6 = [(BrowserController *)self tabBarManager];
  objc_msgSend(v6, "setActiveItemIsExpanded:animated:completionHandler:", 0, objc_msgSend(v6, "displayMode") != 2, 0);
  if (a4 != 12)
  {
    if (a4 == 13) {
      uint64_t v7 = 6;
    }
    else {
      uint64_t v7 = 2;
    }
    -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:]((uint64_t)self, 0, v7, 0);
  }
  id v8 = [(BrowserRootViewController *)self->_rootViewController primaryNavigationBar];
  switch(a4)
  {
    case 0:
      -[BrowserController _goBackAllowingNewTabToSpawnIfNeeded:]((id *)&self->super.super.super.isa, 1);
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "Tap back button from the toolbar", buf, 2u);
      }
      long long v15 = [MEMORY[0x1E4F97E48] sharedLogger];
      objc_msgSend(v15, "reportIOSToolbarButtonUsage:withLayout:", 0, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
      goto LABEL_40;
    case 1:
      -[BrowserController _goForwardAllowingNewTabToSpawnIfNeeded:]((id *)&self->super.super.super.isa, 1);
      double v16 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_DEFAULT, "Tap forward button from the toolbar", buf, 2u);
      }
      long long v15 = [MEMORY[0x1E4F97E48] sharedLogger];
      objc_msgSend(v15, "reportIOSToolbarButtonUsage:withLayout:", 1, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
      goto LABEL_40;
    case 2:
      [(BrowserController *)self toggleBookmarksPresentation];
      long long v17 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v17, OS_LOG_TYPE_DEFAULT, "Tap tab group button from the toolbar", buf, 2u);
      }
      goto LABEL_41;
    case 3:
      [(BrowserController *)self toggleBookmarksPresentation];
      uint64_t v18 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v18, OS_LOG_TYPE_DEFAULT, "Tap bookmarks button from the toolbar", buf, 2u);
      }
      long long v15 = [MEMORY[0x1E4F97E48] sharedLogger];
      objc_msgSend(v15, "reportIOSToolbarButtonUsage:withLayout:", 33, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
      goto LABEL_40;
    case 4:
      [(BrowserController *)self toggleVoiceSearch];
      goto LABEL_41;
    case 5:
    case 6:
      id v9 = [(TabController *)self->_tabController activeTabDocument];
      if (![v9 isBlank]) {
        goto LABEL_35;
      }
      uint64_t v10 = +[FeatureManager sharedFeatureManager];
      if ([v10 areSharedTabGroupsEnabled])
      {
        id v11 = [(TabController *)self->_tabController activeTabGroup];
        int v12 = [v11 isSyncable];

        if (v12)
        {
          uint64_t v13 = [(TabController *)self->_tabController tabGroupShareSheetForCurrentTabGroup];
          [(BrowserController *)self _presentModalViewController:v13 fromBarItem:a4 completion:0];

          goto LABEL_37;
        }
      }
      else
      {

LABEL_35:
      }
      -[BrowserController _presentActivityViewController]((uint64_t)self);
LABEL_37:
      long long v24 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_DEFAULT, "Tap actions button from the toolbar", buf, 2u);
      }
      long long v15 = [MEMORY[0x1E4F97E48] sharedLogger];
      objc_msgSend(v15, "reportIOSToolbarButtonUsage:withLayout:", 3, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
LABEL_40:

LABEL_41:
      return;
    case 7:
      tabController = self->_tabController;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __56__BrowserController_barManager_didReceiveTapForBarItem___block_invoke;
      v25[3] = &unk_1E6D793E8;
      v25[4] = self;
      [(TabController *)tabController openNewTabWithOptions:0 completionHandler:v25];
      goto LABEL_41;
    case 8:
      long long v20 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
      [v20 presentAnimated:1];

      long long v21 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v21, OS_LOG_TYPE_DEFAULT, "Tap tab expose button from the toolbar", buf, 2u);
      }
      long long v22 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v22 didEnterTabViewWithMethod:0];

      long long v15 = [MEMORY[0x1E4F97E48] sharedLogger];
      objc_msgSend(v15, "reportIOSToolbarButtonUsage:withLayout:", 8, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
      goto LABEL_40;
    case 11:
      long long v23 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v23, OS_LOG_TYPE_DEFAULT, "Tap downloads button from the toolbar", buf, 2u);
      }
      [(BrowserController *)self presentDownloadsViewController];
      long long v15 = [MEMORY[0x1E4F97E48] sharedLogger];
      objc_msgSend(v15, "reportIOSToolbarButtonUsage:withLayout:", 21, -[BrowserController analyticsLayoutProvenance](self, "analyticsLayoutProvenance"));
      goto LABEL_40;
    case 12:
      [(BrowserController *)self navigationBarCancelButtonWasTapped:0];
      goto LABEL_41;
    case 13:
      [(BrowserController *)self navigationBarFormatMenuButtonWasTapped:v8];
      goto LABEL_41;
    case 14:
      [(BrowserController *)self navigationBarStopLoadingButtonWasTapped:v8];
      goto LABEL_41;
    case 15:
      [(BrowserController *)self navigationBarReloadButtonWasTapped:v8];
      goto LABEL_41;
    default:
      goto LABEL_41;
  }
}

void __56__BrowserController_barManager_didReceiveTapForBarItem___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    int64_t v3 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Tap new tab button from the toolbar", v6, 2u);
    }
    BOOL v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v4, "didOpenNewBlankTabWithTrigger:tabCollectionViewType:", 2, objc_msgSend(*(id *)(*(void *)(a1 + 32) + 928), "visibleTabCollectionViewType"));

    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v5, "reportIOSToolbarButtonUsage:withLayout:", 4, objc_msgSend(*(id *)(a1 + 32), "analyticsLayoutProvenance"));
  }
}

- (BOOL)barManager:(id)a3 canHandleLongPressForBarItem:(int64_t)a4
{
  return ((a4 - 5) & 0xFFFFFFFFFFFFFFF7) == 0;
}

- (void)barManager:(id)a3 didReceiveTouchDownForBarItem:(int64_t)a4
{
  if ((a4 | 8) == 0xD)
  {
    id v5 = [(TabController *)self->_tabController activeTabDocument];
    BOOL v4 = [v5 readerContext];
    [v4 checkReaderAvailability];
  }
}

- (void)barManager:(id)a3 didReceiveLongPressForBarItem:(int64_t)a4
{
  -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:]((uint64_t)self, 0, 4 * (a4 == 13), 0);
  if (a4 == 13)
  {
    id v7 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
    id v6 = [v7 selectedItemNavigationBar];
    [(BrowserController *)self navigationBarReaderButtonWasTapped:v6];
  }
  else if (a4 == 5)
  {
    -[BrowserController _readerButtonTapped](self);
  }
}

void __57__BrowserController_barManager_willRegisterBarWithToken___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained dispatchNavigationIntent:v3];
}

- (void)_didDismissManageExtensionsViewController:(id)a3
{
  id v9 = [a3 object];
  BOOL v4 = [v9 presentingPageFormatMenu];
  id v5 = +[Application sharedApplication];
  if ([v5 isPrivateBrowsingLocked])
  {
    id v6 = [(_SFPageFormatMenuController *)v4 browserContentController];
    id v7 = [v6 activeDocument];
    char v8 = [v7 isPrivateBrowsingEnabled];
  }
  else
  {
    char v8 = 0;
  }

  if ((v8 & 1) == 0 && v4 && v4 == self->_pageFormatMenuController) {
    [(BrowserController *)self barManager:self->_barManager didReceiveTapForBarItem:13];
  }
}

id __46__BrowserController__updateAddTabMenuProvider__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F1CA48] array];
    if (_SFDeviceIsPad())
    {
      id v3 = [WeakRetained tabBarManager];
      uint64_t v4 = [v3 displayMode];

      if (v4 == 1)
      {
        id v5 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_tabMenu");
        [v2 addObject:v5];
      }
    }
    if (!*((unsigned char *)WeakRetained + 719))
    {
      id v6 = (void *)*((void *)WeakRetained + 43);
      id v7 = [WeakRetained tabController];
      char v8 = [v7 activeTabGroupUUID];
      id v9 = [v6 recentlyClosedTabsMenuForTabGroupWithUUID:v8];
      [v2 addObject:v9];
    }
  }
  else
  {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v2;
}

void __74__BrowserController_toggleBookmarksPresentationWithCollection_completion___block_invoke()
{
  id v0 = WBS_LOG_CHANNEL_PREFIXSignposts();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E102C000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShowBookmarks", " enableTelemetry=YES ", v1, 2u);
  }
}

void __74__BrowserController_toggleBookmarksPresentationWithCollection_completion___block_invoke_901(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v2 = [WeakRetained currentBookmarksCollection];
      char v3 = [v2 isEqualToString:*(void *)(a1 + 32)];

      if ((v3 & 1) == 0) {
        [WeakRetained setCurrentBookmarksCollection:*(void *)(a1 + 32)];
      }
    }
    -[BrowserController _updateSidebarStickinessAfterUserAction]((id *)WeakRetained);
  }
}

uint64_t __74__BrowserController_toggleBookmarksPresentationWithCollection_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)toggleBookmarksPresentation
{
}

- (void)editBookmarksKeyPressed
{
  int64_t v3 = [(BrowserController *)self _bookmarksPresentationStyle];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (!v3)
    {
      if ([(BrowserController *)self isPresentingModalBookmarksController]) {
        [(BrowserController *)self setCurrentBookmarksCollection:@"BookmarksCollection"];
      }
      else {
        -[BrowserController toggleBookmarksPresentationWithCollection:completion:]((uint64_t)self, @"BookmarksCollection", 0);
      }
      modalBookmarksController = self->_modalBookmarksController;
      [(BookmarksNavigationController *)modalBookmarksController toggleEditBookmarks];
    }
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__BrowserController_editBookmarksKeyPressed__block_invoke;
    v6[3] = &unk_1E6D793E8;
    void v6[4] = self;
    uint64_t v4 = (void (**)(void, void))MEMORY[0x1E4E42950](v6);
    if ([(SidebarUIProxy *)self->_sidebarUIProxy isShowingSidebar])
    {
      [(BrowserController *)self setCurrentBookmarksCollection:@"BookmarksCollection"];
      v4[2](v4, 1);
    }
    else
    {
      -[BrowserController toggleBookmarksPresentationWithCollection:completion:]((uint64_t)self, @"BookmarksCollection", v4);
    }
  }
}

void __44__BrowserController_editBookmarksKeyPressed__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 896) sidebarViewController];
    id v3 = [v2 presentedItemController];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 toggleEditBookmarks];
    }
  }
}

- (void)_prepareToPresentActivityViewController
{
  if (a1)
  {
    uint64_t v2 = [(id)a1 tabController];
    id v3 = [v2 activeTabDocument];

    *(unsigned char *)(a1 + 123) = 0;
    *(unsigned char *)(a1 + 121) = 0;
    [*(id *)(a1 + 232) _cancel];
    uint64_t v4 = [[ActionPanel alloc] initWithTabDocument:v3 activityDelegate:a1 menuStyle:0];
    id v5 = *(void **)(a1 + 232);
    *(void *)(a1 + 232) = v4;

    [*(id *)(a1 + 232) setDelegate:a1];
    objc_initWeak(&location, *(id *)(a1 + 232));
    objc_initWeak(&from, (id)a1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60__BrowserController__prepareToPresentActivityViewController__block_invoke;
    v6[3] = &unk_1E6D79AB0;
    objc_copyWeak(&v7, &from);
    objc_copyWeak(&v8, &location);
    [v3 fetchCanonicalURLWithCompletionHandler:v6];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __60__BrowserController__prepareToPresentActivityViewController__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = v4;
    if (v4 && v4 == WeakRetained[29])
    {
      [v4 setSharingURL:v6];
      *((unsigned char *)WeakRetained + 123) = 1;
      -[BrowserController _presentActionPanelIfReady]((uint64_t)WeakRetained);
    }
  }
}

- (void)_presentActionPanelIfReady
{
  if (a1 && *(void *)(a1 + 232) && *(unsigned char *)(a1 + 123))
  {
    if (*(unsigned char *)(a1 + 121))
    {
      uint64_t v2 = [(id)a1 tabController];
      id v3 = [v2 activeTabDocument];
      [v3 hideFindOnPage];

      [(id)a1 setCanFocusNavigationBarURL:0];
      uint64_t v4 = *(void *)(a1 + 232);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__BrowserController__presentActionPanelIfReady__block_invoke;
      v9[3] = &unk_1E6D79060;
      void v9[4] = a1;
      [(id)a1 _presentModalViewController:v4 fromBarItem:6 completion:v9];
      objc_storeWeak((id *)(a1 + 192), *(id *)(a1 + 232));
      id v5 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = 0;

      *(unsigned char *)(a1 + 123) = 0;
      *(unsigned char *)(a1 + 121) = 0;
      id v6 = [(id)a1 tabController];
      id v7 = [v6 activeTabDocument];

      id v8 = [v7 webExtensionsController];
      [v8 didViewToolbarItemBadgesInTab:v7];
    }
  }
}

uint64_t __47__BrowserController__presentActionPanelIfReady__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCanFocusNavigationBarURL:1];
}

- (id)activityItemsConfiguration
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(TabController *)self->_tabController activeTabGroupOrTabGroupVisibleInSwitcher];
  if ([v4 isNamed])
  {
    id v5 = [(TabController *)self->_tabController shareRecordForActiveTabGroupIfIsShared];
    id v6 = objc_alloc(MEMORY[0x1E4F783A8]);
    id v7 = [(BrowserController *)self tabGroupManager];
    id v8 = [(TabController *)self->_tabController iconForSharingActiveTabGroup];
    id v9 = (void *)[v6 initWithTabGroup:v4 inTabGroupManager:v7 existingShare:v5 icon:v8];

    if (v9) {
      goto LABEL_4;
    }
  }
  id v9 = 0;
  uint64_t v10 = 0;
  if ([v3 count]) {
LABEL_4:
  }
    uint64_t v10 = [[ActivityItemConfiguration alloc] initWithInnerItemConfigurationProvider:v9 additionalItemProviders:v3];

  return v10;
}

- (id)newCollaborationButton
{
  id v3 = [(TabController *)self->_tabController activeTabGroupOrTabGroupVisibleInSwitcher];
  uint64_t v4 = [(TabController *)self->_tabController shareRecordForActiveTabGroupIfIsShared];
  id v5 = [(BrowserController *)self newCollaborationButtonWithActiveTabGroup:v3 existingShare:v4];

  return v5;
}

- (id)newCollaborationButtonWithActiveTabGroup:(id)a3 existingShare:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(BrowserController *)self tabGroupManager];
    id v9 = objc_alloc(MEMORY[0x1E4F783A8]);
    uint64_t v10 = [(TabController *)self->_tabController iconForSharingTabGroup:v6];
    id v11 = (void *)[v9 initWithTabGroup:v6 inTabGroupManager:v8 existingShare:v7 icon:v10];

    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2050000000;
    int v12 = (void *)get_SWCollaborationButtonViewClass(void)::softClass;
    uint64_t v25 = get_SWCollaborationButtonViewClass(void)::softClass;
    if (!get_SWCollaborationButtonViewClass(void)::softClass)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = ___ZL34get_SWCollaborationButtonViewClassv_block_invoke;
      v21[3] = &unk_1E6D79088;
      void v21[4] = &v22;
      ___ZL34get_SWCollaborationButtonViewClassv_block_invoke((uint64_t)v21);
      int v12 = (void *)v23[3];
    }
    uint64_t v13 = v12;
    _Block_object_dispose(&v22, 8);
    id v14 = [v13 alloc];
    long long v15 = [v11 itemProvider];
    double v16 = (void *)[v14 initWithItemProvider:v15];

    -[BrowserController _updateParticipantsListForCollaborationButton:contacts:]((id *)&self->super.super.super.isa, v16, MEMORY[0x1E4F1CBF0]);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__BrowserController_newCollaborationButtonWithActiveTabGroup_existingShare___block_invoke;
    v19[3] = &unk_1E6D79AD8;
    void v19[4] = self;
    id v17 = v16;
    id v20 = v17;
    [v8 getActiveParticipantsInTabGroup:v6 completionHandler:v19];
    if (objc_opt_respondsToSelector()) {
      [v17 setShowManageButton:0];
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

void __76__BrowserController_newCollaborationButtonWithActiveTabGroup_existingShare___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 allObjects];
  objc_msgSend(v3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_906);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  -[BrowserController _updateParticipantsListForCollaborationButton:contacts:](*(id **)(a1 + 32), *(void **)(a1 + 40), v4);
}

id __76__BrowserController_newCollaborationButtonWithActiveTabGroup_existingShare___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "safari_contact");
  return v2;
}

- (id)_participantsListForCollaborationView:(id *)a1
{
  id v3 = a2;
  id v4 = v3;
  id v5 = 0;
  if (a1)
  {
    if (v3)
    {
      id v5 = [a1[68] objectForKey:v3];
      if (!v5)
      {
        id v6 = [a1[43] activeTabGroup];
        id v7 = objc_alloc(MEMORY[0x1E4F782B8]);
        id v5 = (void *)[v7 initWithContacts:MEMORY[0x1E4F1CBF0]];
        [a1[68] setObject:v5 forKey:v4];
        objc_initWeak(&location, a1);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        void v18[2] = __59__BrowserController__participantsListForCollaborationView___block_invoke;
        v18[3] = &unk_1E6D79B00;
        objc_copyWeak(&v19, &location);
        [v5 setInfoViewControllerHandler:v18];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __59__BrowserController__participantsListForCollaborationView___block_invoke_2;
        v15[3] = &unk_1E6D79B50;
        objc_copyWeak(&v17, &location);
        id v8 = v6;
        id v16 = v8;
        [v5 setRowTapHandler:v15];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __59__BrowserController__participantsListForCollaborationView___block_invoke_4;
        v13[3] = &unk_1E6D79768;
        objc_copyWeak(&v14, &location);
        [v5 setManageHandler:v13];
        objc_initWeak(&from, v4);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __59__BrowserController__participantsListForCollaborationView___block_invoke_5;
        v10[3] = &unk_1E6D79B78;
        objc_copyWeak(&v11, &from);
        [v5 setResizeHandler:v10];
        [v5 setPreservesSuperviewLayoutMargins:1];
        objc_destroyWeak(&v11);
        objc_destroyWeak(&from);
        objc_destroyWeak(&v14);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);
      }
    }
  }

  return v5;
}

void __59__BrowserController__participantsListForCollaborationView___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    -[BrowserController _presentModalViewController:](WeakRetained, v5);
  }
}

void __59__BrowserController__participantsListForCollaborationView___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = objc_msgSend(v3, "safari_shareParticipantIdentifier");
    id v6 = (void *)WeakRetained[97];
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__BrowserController__participantsListForCollaborationView___block_invoke_3;
    v8[3] = &unk_1E6D79B28;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v9 = *(id *)(a1 + 32);
    [v6 getPresenceTabUUIDForParticipantIdentifier:v5 inTabGroup:v7 completionHandler:v8];

    objc_destroyWeak(&v10);
  }
}

void __59__BrowserController__participantsListForCollaborationView___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v10 = v3;
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      id v6 = WeakRetained[43];
      uint64_t v7 = [*(id *)(a1 + 32) uuid];
      [v6 setActiveTabGroupUUID:v7];

      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
      id v9 = [v6 tabWithUUID:v8];
      [v6 setActiveTab:v9];
    }
    id v3 = v10;
  }
}

void __59__BrowserController__participantsListForCollaborationView___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_alloc(MEMORY[0x1E4FB1550]);
    uint64_t v2 = [WeakRetained[43] shareRecordForActiveTabGroup];
    id v3 = objc_msgSend(MEMORY[0x1E4F19EC8], "safari_cloudTabsContainer");
    id v4 = (void *)[v1 initWithShare:v2 container:v3];

    [v4 setDelegate:WeakRetained];
    [v4 setModalPresentationStyle:2];
    -[BrowserController _presentModalViewController:](WeakRetained, v4);
  }
}

void __59__BrowserController__participantsListForCollaborationView___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setDetailViewListContent:v5];
  }
}

- (void)clearParticipantsList
{
  [(NSMapTable *)self->_cachedParticipantLists removeAllObjects];
  [(_SFBarManager *)self->_barManager setCollaborationButton:0];
  id v3 = [(BannerController *)self->_bannerController tabGroupBanner];
  [v3 setCollaborationButton:0];
}

uint64_t __41__BrowserController__nonBlankCurrentTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBlank] ^ 1;
}

- (void)presentAutomaticTabClosingAlertController
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = _WBSLocalizedString();
  id v5 = _WBSLocalizedString();
  id v6 = [(BrowserRootViewController *)self->_rootViewController traitCollection];
  uint64_t v7 = objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, v5, objc_msgSend(v6, "horizontalSizeClass") != 1);

  id v8 = [v7 view];
  [v8 setAccessibilityIdentifier:@"AutomaticallyCloseTabsSheet"];

  for (uint64_t i = 0; i != 4; ++i)
  {
    id v10 = (void *)MEMORY[0x1E4FB1410];
    id v11 = WBSAutomaticTabClosingIntervalPromptTitle();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__BrowserController_presentAutomaticTabClosingAlertController__block_invoke;
    v16[3] = &__block_descriptor_40_e23_v16__0__UIAlertAction_8l;
    void v16[4] = i;
    int v12 = [v10 actionWithTitle:v11 style:i == 0 handler:v16];

    uint64_t v13 = WBSAutomaticTabClosingIntervalSettingsTitle();
    id v14 = [v13 stringByReplacingOccurrencesOfString:@" " withString:&stru_1F3C268E8];
    [v12 setAccessibilityIdentifier:v14];

    [v7 addAction:v12];
  }
  long long v15 = [(BrowserController *)self viewControllerToPresentFrom];
  [v15 presentViewController:v7 animated:1 completion:0];
}

void __62__BrowserController_presentAutomaticTabClosingAlertController__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = WBSAutomaticTabClosingIntervalAnalyticsTitle();
  [v6 setAccessibilityIdentifier:v3];

  [MEMORY[0x1E4F98998] setAutomaticTabClosingInterval:*(void *)(a1 + 32)];
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  id v5 = WBSAutomaticTabClosingIntervalAnalyticsTitle();
  [v4 didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt:v5];
}

- (void)addBookmarkForCurrentTab
{
}

- (void)_addBookmarkForCurrentTabKeyPressed:(void *)a3 title:
{
  id v5 = a3;
  if (a1) {
    -[BrowserController _addBookmarkForCurrentTabKeyPressed:title:addToFavorites:](a1, a2, v5, 0);
  }
}

void __78__BrowserController__addBookmarkForCurrentTabKeyPressed_title_addToFavorites___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v2 = [MEMORY[0x1E4F97E48] sharedLogger];
  id v3 = v2;
  if (v1) {
    [v2 didAddBookmarkWithMethod:1];
  }
  else {
    [v2 didAddBookmarkFromToolbarMenuWithItemType:0];
  }
}

- (void)addBookmarkFolderForCurrentTabs
{
  id v3 = [(TabController *)self->_tabController currentTabs];
  -[BrowserController addBookmarkFolderForTabs:](self, "addBookmarkFolderForTabs:");
}

- (void)addBookmarkFolderForTabs:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  long long v27 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  long long v26 = [MEMORY[0x1E4F1CA48] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v25;
  uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(id *)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          tabController = self->_tabController;
          id v9 = objc_alloc(MEMORY[0x1E4F29128]);
          id v10 = [v7 uuid];
          id v11 = (void *)[v9 initWithUUIDString:v10];
          uint64_t v12 = [(TabController *)tabController tabWithUUID:v11];
          uint64_t v13 = (void *)v12;
          if (v12) {
            id v14 = (void *)v12;
          }
          else {
            id v14 = v7;
          }
          id v15 = v14;

          id v7 = v15;
        }
        if (([v7 isBlank] & 1) == 0)
        {
          id v16 = objc_alloc(MEMORY[0x1E4FB60E0]);
          id v17 = [v7 titleForNewBookmark];
          uint64_t v18 = [v7 addressForNewBookmark];
          id v19 = [v27 configuration];
          id v20 = objc_msgSend(v16, "initWithTitle:address:collectionType:", v17, v18, objc_msgSend(v19, "collectionType"));

          [v26 addObject:v20];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v4);
  }

  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F3B080]) initWithFolderOfBookmarks:v26 inCollection:v27];
  [v21 setSyntheticBookmarkProvider:self->_tabController];
  if ([v21 prepareForPresentationForAddingBookmark:1])
  {
    [v21 setBookmarkNavDelegate:self];
    [v21 setAddBookmarkAnalyticsHandler:&__block_literal_global_939];
    [(BrowserController *)self _presentModalViewController:v21 fromBarItem:*MEMORY[0x1E4F788B8] completion:0];
  }
  else
  {

    uint64_t v22 = (void *)MEMORY[0x1E4F781E8];
    long long v23 = [(BrowserController *)self viewControllerToPresentFrom];
    [v22 showLockedDatabaseAlertForAction:1 fromViewController:v23];

    uint64_t v24 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v24 didPreventBookmarkActionWithBookmarkType:0 actionType:0];

    long long v21 = 0;
  }
}

void __46__BrowserController_addBookmarkFolderForTabs___block_invoke()
{
  id v0 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v0 didAddBookmarkFromToolbarMenuWithItemType:1];
}

- (void)presentDownloadsViewController
{
  p_downloadsViewController = &self->_downloadsViewController;
  id WeakRetained = (DownloadsViewController *)objc_loadWeakRetained((id *)&self->_downloadsViewController);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__BrowserController_presentDownloadsViewController__block_invoke;
    void v11[3] = &unk_1E6D79060;
    void v11[4] = self;
    [(DownloadsViewController *)WeakRetained dismissViewControllerAnimated:1 completion:v11];
  }
  else
  {
    uint64_t v5 = objc_alloc_init(DownloadsViewController);
    [(DownloadsViewController *)v5 setDownloadOpenHandler:self];
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
    id v7 = [(BrowserController *)self tabBarManager];
    id v8 = [v7 inlineTabBar];
    int v9 = [v8 usesMoreMenu];

    if (v9) {
      uint64_t v10 = 5;
    }
    else {
      uint64_t v10 = 11;
    }
    [(BrowserController *)self _presentModalViewController:v6 fromBarItem:v10 completion:0];
    objc_storeWeak((id *)p_downloadsViewController, v5);
  }
}

id __51__BrowserController_presentDownloadsViewController__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 104), 0);
}

- (void)presentPrintControllerForTabDocument:(id)a3 frame:(id)a4 initiatedByWebContent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v10 = (TabDocument *)a3;
  id v8 = a4;
  if (self->_speculativeLoadDocument == v10)
  {
    [(BrowserController *)self clearSpeculativeLoadDocument];
  }
  else if (-[BrowserController isContinuousReadingDocument:](self, "isContinuousReadingDocument:"))
  {
    [(BrowserController *)self clearDocumentForContinuousReading:v10];
  }
  else if (-[BrowserController _canPrintForTabDocument:]((uint64_t)self, v10) {
         && -[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v10)
  }
         && ![(TabDocument *)v10 isShowingFindOnPage]
         && [MEMORY[0x1E4F42D10] isPrintingAvailable])
  {
    int v9 = [(TabDocument *)v10 printController];
    [v9 printFrame:v8 initiatedByWebContent:v5 completion:&__block_literal_global_944];
  }
}

- (uint64_t)_canUpdateInterfaceWithTabDocument:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 888));
    uint64_t v5 = [WeakRetained activationState];

    if (v5)
    {
      a1 = 0;
    }
    else
    {
      id v6 = [*(id *)(a1 + 344) activeTabDocument];
      a1 = v6 == v3;
    }
  }

  return a1;
}

void __86__BrowserController_presentPrintControllerForTabDocument_frame_initiatedByWebContent___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v2 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v2 didPrintPage];
  }
}

- (void)dispatchNavigationIntent:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(TabController *)self->_tabController activeTabDocument];
  uint64_t v5 = [v4 uuid];
  [v8 setSourceTabUUID:v5];

  id v6 = [(BrowserController *)self UUID];
  [v8 setSourceWindowUUID:v6];

  id v7 = +[Application sharedApplication];
  [v7 handleNavigationIntent:v8 completion:0];
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v89 = a4;
  id v7 = (id)WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    [v6 privacyPreservingDescription];
    objc_claimAutoreleasedReturnValue();
    -[BrowserController handleNavigationIntent:completion:]();
  }

  if ([v6 policy] == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserControllerWillCreateBackgroundTab:self];
    }
  }
  if ([v6 provenance] == 1)
  {
    if ([v6 type] == 5)
    {
      id v9 = 0;
    }
    else if ([v6 type] != 4 {
           || ([v6 text],
    }
               uint64_t v10 = objc_claimAutoreleasedReturnValue(),
               uint64_t v11 = WBSUnifiedFieldInputTypeForString(),
               v10,
               id v9 = 0,
               v11)
           && v11 != 3)
    {
      uint64_t v12 = [v6 URL];
      uint64_t v13 = v12;
      if (v12)
      {
        id v9 = v12;
      }
      else
      {
        id v14 = [v6 text];
        objc_msgSend(v14, "safari_bestURLForUserTypedString");
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    -[BrowserController _recordIgnoredSiriSuggestedSitesWithURL:]((uint64_t)self, v9);
  }
  if (self->_allowsAutoDismissSidebar
    && [v6 shouldDismissSidebarOnLoad]
    && [(SidebarUIProxy *)self->_sidebarUIProxy isShowingSidebar]
    && [(BrowserController *)self isShowingStartPage])
  {
    -[BrowserController toggleBookmarksPresentationWithCollection:completion:]((uint64_t)self, 0, 0);
  }
  self->_allowsAutoDismissSidebar = 0;
  id v15 = [(TabController *)self->_tabController activeTabDocument];
  id v16 = v15;
  if ([v15 isPinned])
  {
    id v16 = [(TabController *)self->_tabController singleUnpinnedBlankTab];
  }
  uint64_t v128 = 0;
  id v129 = (id *)&v128;
  uint64_t v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__3;
  v132 = __Block_byref_object_dispose__3;
  id v133 = 0;
  v126[0] = 0;
  v126[1] = v126;
  v126[2] = 0x2020000000;
  char v127 = 0;
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke;
  v122[3] = &unk_1E6D79C00;
  id v17 = v16;
  id v123 = v17;
  char v125 = v126;
  id v18 = v15;
  id v124 = v18;
  id v19 = (void *)MEMORY[0x1E4E42950](v122);
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_2;
  v116[3] = &unk_1E6D79C28;
  id v20 = v19;
  id v120 = v20;
  id v21 = v6;
  id v117 = v21;
  v121 = v126;
  id v22 = v17;
  id v118 = v22;
  id v119 = self;
  uint64_t v87 = (void *)MEMORY[0x1E4E42950](v116);
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_3;
  v112[3] = &unk_1E6D79C50;
  v112[4] = self;
  id v86 = v20;
  id v114 = v86;
  id v85 = v22;
  id v113 = v85;
  id v115 = v126;
  BOOL v88 = (void *)MEMORY[0x1E4E42950](v112);
  long long v23 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabOverview];
  uint64_t v24 = v23;
  v83 = v23;
  if (v23 && !self->_layoutToRestoreAfterOpeningNewTabs)
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v23, "presentedTabLayout"));
    id v25 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    layoutToRestoreAfterOpeningNewTabs = self->_layoutToRestoreAfterOpeningNewTabs;
    self->_layoutToRestoreAfterOpeningNewTabs = v25;

    uint64_t v24 = v83;
  }
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_4;
  v106[3] = &unk_1E6D79CC8;
  id v110 = v89;
  id v111 = &v128;
  id v84 = v110;
  v106[4] = self;
  id v27 = v21;
  id v107 = v27;
  id v28 = v24;
  id v108 = v28;
  id v29 = v18;
  id v109 = v29;
  BOOL v91 = (void (**)(void, void))MEMORY[0x1E4E42950](v106);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_8;
  v101[3] = &unk_1E6D79D18;
  v101[4] = self;
  id v30 = v27;
  id v102 = v30;
  id v31 = v88;
  id v103 = v31;
  id v32 = v87;
  id v104 = v32;
  v105 = &v128;
  int v90 = (void (**)(void))MEMORY[0x1E4E42950](v101);
  if ([v30 type] == 9)
  {
    if ([v30 externalURLSourceApplicationIsSpotlight])
    {
      long long v33 = [(TabController *)self->_tabController tabDocumentForSpotlightSearch];
      if (v33)
      {
        id v34 = v129[5];
        v129[5] = v33;
        uint64_t v35 = v33;

        [(TabDocumentDropHandler *)v35 handleNavigationIntent:v30 completion:v91];
LABEL_70:

        goto LABEL_71;
      }
    }
    tabController = self->_tabController;
    uint64_t v37 = [v30 URL];
    uint64_t v35 = [(TabController *)tabController tabDocumentForURL:v37 forceUnhibernate:1];

    if (v35)
    {
      objc_storeStrong(v129 + 5, v35);
      [(TabDocumentDropHandler *)v35 unhibernate];
      [(TabDocumentDropHandler *)v35 handleNavigationIntent:v30 completion:v91];
      goto LABEL_70;
    }
  }
  if ([v30 type] == 3)
  {
    CGRect v38 = [v30 recentlyClosedTabStateData];
    uint64_t v39 = (*((void (**)(id, void, void *))v31 + 2))(v31, 0, v38);
    id v40 = v129[5];
    v129[5] = (id)v39;

    BOOL v41 = v129[5] != 0;
  }
  else
  {
    if ([v30 type] != 11)
    {
      switch([v30 policy])
      {
        case 0:
          uint64_t v35 = [(TabController *)self->_tabController activeTabDocument];
          objc_storeStrong(v129 + 5, v35);
          [(TabDocumentDropHandler *)v35 setNextLoadComesFromSearchPage:[(TabDocumentDropHandler *)v35 isSearchPage]];
          char v52 = [v30 bookmark];
          uint64_t v53 = [v52 localAttributes];
          if (!v53) {
            goto LABEL_51;
          }
          char v54 = [v30 bookmark];
          int v79 = [v54 isReadingListItem];

          if (v79)
          {
            char v52 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
            objc_msgSend(v52, "safari_incrementNumberForKey:", *MEMORY[0x1E4F992D8]);
LABEL_51:
          }
          [(TabDocumentDropHandler *)v35 handleNavigationIntent:v30 completion:v91];
          goto LABEL_70;
        case 1:
        case 2:
        case 3:
        case 4:
          id v78 = [v30 webClip];
          if (!v78
            || ([(TabController *)self->_tabController switchToTabDocumentForWebClip:v78], (double v47 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            double v47 = (*((void (**)(id, void))v32 + 2))(v32, 0);
          }
          if ([v30 shouldRelateToSourceTab])
          {
            BOOL v73 = [(BrowserController *)self browserWindowController];
            uint64_t v48 = [v30 sourceWindowUUID];
            v72 = [v73 browserControllerWithUUID:v48];

            BOOL v74 = [v72 tabController];
            char v49 = [v30 sourceTabUUID];
            dispatch_time_t v71 = [v74 tabDocumentWithUUID:v49];

            id v70 = [v71 trackerInfo];
            id v75 = [v70 queryParameterFilteringDataQueue];
            v69 = [v47 trackerInfo];
            char v50 = [v69 queryParameterFilteringDataQueue];
            [v75 transferPendingDataToQueue:v50];
          }
          double v51 = [(TabController *)self->_tabController activeTabDocument];
          objc_msgSend(v47, "setNextLoadComesFromSearchPage:", objc_msgSend(v51, "isSearchPage"));

          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_11;
          v92[3] = &unk_1E6D79D40;
          id v93 = v30;
          BOOL v97 = &v128;
          uint64_t v35 = v47;
          id v94 = v35;
          v95 = self;
          BOOL v96 = v91;
          [(TabDocumentDropHandler *)v35 handleNavigationIntent:v93 completion:v92];

          goto LABEL_68;
        case 5:
          uint64_t v35 = [v30 URL];
          id v55 = [v30 text];
          int v56 = v55;
          if (v55)
          {
            id v78 = v55;
          }
          else
          {
            id v78 = [(TabDocumentDropHandler *)v35 safari_userVisibleString];
          }

          if (v35)
          {
            char v64 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
            unsigned int v77 = -[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:](v64, v78, v35);

            if (v77)
            {
              id v65 = [MEMORY[0x1E4F97E48] sharedLogger];
              [v65 didAddReadingListItemWithMethod:5];
            }
            char v66 = [(TabController *)self->_tabController activeTabDocument];
            int v67 = [v30 sourceElementInfo];
            [v66 animateElement:v67 toBarItem:3];
          }
          else
          {
            char v66 = (id)WBS_LOG_CHANNEL_PREFIXPageLoading();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
            {
              objc_super v68 = [v30 privacyPreservingDescription];
              *(_DWORD *)buf = 138543362;
              v135 = v68;
              _os_log_impl(&dword_1E102C000, v66, OS_LOG_TYPE_INFO, "Unable to add intent to reading list because there's no URL: %{public}@", buf, 0xCu);
            }
          }

          ((void (**)(void, BOOL))v91)[2](v91, v35 != 0);
LABEL_68:
          v46 = v78;
          goto LABEL_69;
        case 6:
          uint64_t v35 = [v30 URL];
          if (v35)
          {
            id v80 = [(TabController *)self->_tabController activeTabDocument];
            unsigned int v76 = [v80 isSearchPage];
            id v57 = [(TabController *)self->_tabController activeTabDocument];
            [v57 setNextLoadComesFromSearchPage:v76];

            int v81 = [(TabController *)self->_tabController activeTabDocument];
            BOOL v58 = [v30 sourceElementInfo];
            [v81 animateElementToDownloadsBarItemSoon:v58];

            v82 = [MEMORY[0x1E4F3AF60] sharedDownloadDispatcher];
            id v59 = [(TabController *)self->_tabController activeTabDocument];
            uint64_t v60 = [v59 webView];
            v46 = [v82 startDownloadFromWebView:v60 URL:v35];

            id v61 = [MEMORY[0x1E4F3AF68] sharedManager];
            [v46 setDelegate:v61];

            [v46 setExplicitlySaved:1];
            v91[2](v91, 1);
            goto LABEL_69;
          }
          char v62 = (id)WBS_LOG_CHANNEL_PREFIXPageLoading();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            BOOL v63 = [v30 privacyPreservingDescription];
            *(_DWORD *)buf = 138543362;
            v135 = v63;
            _os_log_impl(&dword_1E102C000, v62, OS_LOG_TYPE_INFO, "Unable to download intent because there's no URL: %{public}@", buf, 0xCu);
          }
          v91[2](v91, 0);
          break;
        default:
          goto LABEL_71;
      }
      goto LABEL_70;
    }
    if ([v30 shouldPromptBeforeHandling])
    {
      char v42 = [TabDocumentDropHandler alloc];
      char v43 = [(BrowserController *)self viewControllerToPresentFrom];
      uint64_t v35 = [(TabDocumentDropHandler *)v42 initWithAlertPresentationViewController:v43];

      int v44 = [v30 navigationIntents];
      uint64_t v45 = [v44 count];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_10;
      v98[3] = &unk_1E6D79A88;
      id v99 = v90;
      id v100 = v91;
      [(TabDocumentDropHandler *)v35 promptIfNeededToConfirmNumberOfNavigationIntents:v45 withCompletionHandler:v98];

      v46 = v99;
LABEL_69:

      goto LABEL_70;
    }
    v90[2]();
    BOOL v41 = 1;
  }
  v91[2](v91, v41);
LABEL_71:

  _Block_object_dispose(v126, 8);
  _Block_object_dispose(&v128, 8);
}

uint64_t __55__BrowserController_handleNavigationIntent_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isBlank];
  if (result)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      return 0;
    }
    else if ([*(id *)(a1 + 40) isPinned])
    {
      return [*(id *)(a1 + 32) isEqual:*(void *)(a1 + 40)] ^ 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

TabDocument *__55__BrowserController_handleNavigationIntent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))()
    && [*(id *)(a1 + 32) canUseExistingBlankTab])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(a1 + 40) unhibernate];
    uint64_t v4 = (TabDocument *)*(id *)(a1 + 40);
  }
  else
  {
    uint64_t v4 = [[TabDocument alloc] initWithBrowserController:*(void *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 48);
    char v6 = *(unsigned char *)(v5 + 72);
    *(unsigned char *)(v5 + 72) = 0;
    id v7 = [*(id *)(*(void *)(a1 + 48) + 344) activeTabDocument];
    id v8 = [v7 view];
    id v9 = [(TabDocument *)v4 webView];
    [v8 applyGeometryToWebView:v9];

    *(unsigned char *)(*(void *)(a1 + 48) + 72) = v6;
    if ([*(id *)(a1 + 32) shouldRelateToSourceTab])
    {
      uint64_t v10 = *(void **)(*(void *)(a1 + 48) + 344);
      uint64_t v11 = [*(id *)(a1 + 32) sourceTabUUID];
      uint64_t v12 = [v10 tabDocumentWithUUID:v11];

      [(TabDocument *)v4 setParentTabDocumentForBackClosesSpawnedTab:v12];
      [(TabDocument *)v4 updateAncestryWithParentTab:v12];
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 344), "insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:", v4, v3, 1, objc_msgSend(*(id *)(*(void *)(a1 + 48) + 928), "hasTabBar"));
    uint64_t v13 = [*(id *)(a1 + 32) type];
    id v14 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v14, "didOpenNewTabWithURLWithTrigger:isExternalLink:tabCollectionViewType:", 2, v13 == 9, objc_msgSend(*(id *)(*(void *)(a1 + 48) + 928), "visibleTabCollectionViewType"));
  }
  return v4;
}

TabDocument *__55__BrowserController_handleNavigationIntent_completion___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1[4] + 808) loadSessionStateDataAndRemoveRecentlyClosedTab:v6];
  id v7 = [[TabDocument alloc] initWithTabStateData:v6 hibernated:0 browserController:a1[4]];
  int v8 = (*(uint64_t (**)(void))(a1[6] + 16))();
  id v9 = *(void **)(a1[4] + 344);
  if (v8)
  {
    [v9 replaceTabDocument:a1[5] withTabDocument:v7];
    *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    [v9 insertNewTabDocument:v7 forcingOrderAfterTabDocument:v5 inBackground:1 animated:0];
  }

  return v7;
}

void __55__BrowserController_handleNavigationIntent_completion___block_invoke_4(uint64_t a1, char a2)
{
  if (a2)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
      uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
    BOOL v7 = -[BrowserController _animationsAreEnabled](*(void *)(a1 + 32));
    if ([*(id *)(a1 + 40) shouldOrderToForeground])
    {
      int v8 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
      id v9 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);

      if (v8 != v9) {
        [*(id *)(*(void *)(a1 + 32) + 344) setActiveTabDocument:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) animated:v7];
      }
    }
    [*(id *)(a1 + 32) showBars];
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 152);
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 48), "setPresentedTabLayout:", objc_msgSend(v10, "integerValue"));
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void **)(v11 + 152);
      *(void *)(v11 + 152) = 0;
    }
    unsigned int v13 = [*(id *)(a1 + 56) isBlank];
    id v14 = [*(id *)(*(void *)(a1 + 32) + 928) tabThumbnailCollectionView];
    id v15 = [v14 itemToActivate];

    if (v15) {
      uint64_t v16 = v13 | 2;
    }
    else {
      uint64_t v16 = v13;
    }
    if (-[BrowserController _isWindowLockedForPrivateBrowsing](*(void *)(a1 + 32)))
    {
      id v17 = +[Application sharedApplication];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_5;
      v34[3] = &unk_1E6D79CA0;
      uint64_t v18 = *(void *)(a1 + 32);
      BOOL v37 = v7;
      void v34[4] = v18;
      uint64_t v36 = v16;
      id v35 = *(id *)(a1 + 64);
      char v38 = a2;
      [v17 authenticateToUnlockPrivateBrowsingWithCompletionHandler:v34];

      id v19 = v35;
    }
    else
    {
      id v22 = [*(id *)(a1 + 40) webClip];
      long long v23 = v22;
      if (v22)
      {
        uint64_t v24 = [v22 uuid];
        uint64_t v25 = *(void *)(a1 + 32);
        long long v26 = *(void **)(v25 + 688);
        *(void *)(v25 + 688) = v24;

        [*(id *)(*(void *)(a1 + 32) + 680) invalidate];
        uint64_t v27 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel__enterYttriumStateTimerFired selector:0 userInfo:0 repeats:1.0];
        uint64_t v28 = *(void *)(a1 + 32);
        id v29 = *(void **)(v28 + 680);
        *(void *)(v28 + 680) = v27;
      }
      uint64_t v30 = *(void *)(a1 + 32);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_7;
      v31[3] = &unk_1E6D79C78;
      id v32 = *(id *)(a1 + 64);
      char v33 = a2;
      -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:](v30, v7, v16, v31);
      id v19 = v32;
    }
  }
  else
  {
    uint64_t v20 = *(void *)(a1 + 64);
    if (v20)
    {
      id v21 = *(void (**)(void))(v20 + 16);
      v21();
    }
  }
}

void __55__BrowserController_handleNavigationIntent_completion___block_invoke_5(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_6;
    v8[3] = &unk_1E6D79C78;
    uint64_t v5 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    char v10 = *(unsigned char *)(a1 + 57);
    -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:](v5, v3, v4, v8);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      BOOL v7 = *(void (**)(void))(v6 + 16);
      v7();
    }
  }
}

uint64_t __55__BrowserController_handleNavigationIntent_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

uint64_t __55__BrowserController_handleNavigationIntent_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void __55__BrowserController_handleNavigationIntent_completion___block_invoke_8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 344);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __55__BrowserController_handleNavigationIntent_completion___block_invoke_9;
  v5[3] = &unk_1E6D79CF0;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v8 = v3;
  uint64_t v9 = v4;
  [v2 performBatchUpdatesWithBlock:v5];
}

void __55__BrowserController_handleNavigationIntent_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "navigationIntents", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = 0;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      id v7 = v4;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        if ([v8 type] == 3)
        {
          uint64_t v9 = *(void *)(a1 + 40);
          char v10 = [v8 recentlyClosedTabStateData];
          uint64_t v11 = (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v7, v10);
        }
        else
        {
          uint64_t v11 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          [v11 handleNavigationIntent:v8 completion:0];
        }
        id v4 = v11;

        uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v14 = *(void *)(v12 + 40);
        unsigned int v13 = (id *)(v12 + 40);
        if (!v14) {
          objc_storeStrong(v13, v11);
        }

        ++v6;
        id v7 = v4;
      }
      while (v3 != v6);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v3);
  }
}

uint64_t __55__BrowserController_handleNavigationIntent_completion___block_invoke_10(uint64_t a1, int a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

uint64_t __55__BrowserController_handleNavigationIntent_completion___block_invoke_11(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = [*(id *)(a1 + 32) shouldOrderToForeground];
    char v4 = v3;
    if (v3)
    {
      uint64_t v5 = *(void **)(a1 + 40);
    }
    else
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 48) + 344) activeTabDocument];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
    if (v4)
    {
      [*(id *)(a1 + 40) setPerformingFirstLoadAfterOpenInBackground:0];
    }
    else
    {

      [*(id *)(a1 + 40) setPerformingFirstLoadAfterOpenInBackground:1];
      if (([*(id *)(*(void *)(a1 + 48) + 928) hasTabBar] & 1) == 0)
      {
        uint64_t v6 = [*(id *)(*(void *)(a1 + 48) + 344) activeTabDocument];
        id v7 = [*(id *)(a1 + 32) sourceElementInfo];
        [v6 animateElement:v7 toBarItem:8];
      }
    }
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v8();
}

- (void)bookmarksNavigationControllerDidPressDoneButton:(id)a3
{
}

- (void)bookmarksNavigationControllerReloadDidFail:(id)a3
{
  id v3 = (id)[a3 popToRootViewControllerAnimated:1];
}

- (void)bookmarksBarView:(id)a3 bookmarksNavigationControllerViewDidAppear:(id)a4
{
}

- (void)bookmarksBarView:(id)a3 bookmarksNavigationControllerViewDidDisappear:(id)a4
{
}

- (id)bookmarksNavigationControllerCurrentContinuousReadingItem:(id)a3
{
  id v3 = [(BrowserController *)self continuousReadingController];
  char v4 = [v3 currentReadingListItem];

  return v4;
}

- (void)bookmarksNavigationController:(id)a3 updateReadingListUnreadFilterShowingAllBookmarks:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(BrowserController *)self continuousReadingController];
  [v5 setUnreadReadingListItemsOnly:!v4];
}

- (void)bookmarksNavigationControllerViewDidAppear:(id)a3
{
  id v4 = +[Application sharedApplication];
  if ([v4 isRunningShowBookmarksTest])
  {
    if ([v4 didStartBookmarksTest]) {
      [(BrowserController *)self performSelector:sel_toggleBookmarksPresentation withObject:0 afterDelay:0.0];
    }
    else {
      [v4 startBookmarksTest];
    }
  }
}

- (void)bookmarksNavigationControllerViewDidDisappear:(id)a3
{
  id v3 = +[Application sharedApplication];
  if ([v3 isRunningShowBookmarksTest])
  {
    if ([v3 didStartBookmarksTest]) {
      [v3 performSelector:sel_finishedBookmarksTest withObject:0 afterDelay:0.0];
    }
    else {
      [v3 startBookmarksTest];
    }
  }
}

- (void)bookmarksNavigationController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5
{
}

- (void)bookmarksNavigationControllerContentDidBecomeDirty:(id)a3
{
  id v6 = a3;
  id v4 = [v6 viewIfLoaded];
  id v5 = [v4 window];

  if (v5) {
    [(BrowserController *)self setNeedsSnapshotUpdateForActiveTabIfTabIsBlank];
  }
}

- (void)updatePopoverPositionAfterSizeTransition
{
  id v2 = [(BrowserController *)self viewControllerToPresentFrom];
  id v5 = [v2 presentedViewController];

  id v3 = [v5 popoverPresentationController];
  id v4 = [v3 delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 updatePopoverPosition];
  }
}

- (int64_t)browserPersonaForActivityViewController:(id)a3
{
  return 0;
}

- (void)actionPanelAddTabDocumentToReadingList:(id)a3 activityDidFinish:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__BrowserController_actionPanelAddTabDocumentToReadingList_activityDidFinish___block_invoke;
  v7[3] = &unk_1E6D79D68;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(BrowserController *)self showReadingListAutomaticArchiveAlertIfNeededWithCompletion:v7];
}

void __78__BrowserController_actionPanelAddTabDocumentToReadingList_activityDidFinish___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) addReadingListBookmarkForCurrentTab];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v3 didAddReadingListItemWithMethod:4];
  }
}

- (void)actionPanel:(id)a3 prepareForMailActivityWithMailController:(id)a4 completionHandler:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = -[BrowserController _mailContentProvider](self);
  [v10 setRestrictAddingPDFContent:1];
  uint64_t v11 = [v14 customizationController];
  [v11 selectedContentType];
  uint64_t v12 = _SFPreferredMailContentTypeForActivityContentType();

  unsigned int v13 = [v14 sharingURL];
  [v10 prepareMailComposeViewController:v8 withMailToURL:0 contentURL:v13 preferredContentType:v12 completionHandler:v9];

  [v10 setRestrictAddingPDFContent:0];
}

- (id)downloadsViewControllerForActionPanel:(id)a3
{
  id v4 = objc_alloc_init(DownloadsViewController);
  [(DownloadsViewController *)v4 setDownloadOpenHandler:self];
  objc_storeWeak((id *)&self->_downloadsViewController, v4);
  return v4;
}

- (id)addBookmarkActivityTabGroupProvider
{
  return self->_tabController;
}

- (BOOL)addBookmarkActivityCanSaveBookmarkChanges:(id)a3
{
  return ![(BrowserController *)self showDemoModeFeatureDisabledAlert];
}

- (void)addBookmarkActivityFailedToAcquireBookmarkLock:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F781E8];
  id v5 = [(BrowserController *)self viewControllerToPresentFrom];
  [v4 showLockedDatabaseAlertForAction:1 fromViewController:v5];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();
  id v6 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v6 didPreventBookmarkActionWithBookmarkType:(v4 & 1) == 0 actionType:0];
}

- (id)readerControllerForMailContentProvider:(id)a3
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  id v4 = [v3 readerContext];

  return v4;
}

- (BOOL)readerViewIsVisibleForMailContentProvider:(id)a3
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  char v4 = [v3 isShowingReader];

  return v4;
}

- (id)webViewForMailContentProvider:(id)a3
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  if ([v3 isBlank])
  {
    char v4 = 0;
  }
  else
  {
    if ([v3 isShowingReader]) {
      [v3 readerWebView];
    }
    else {
    char v4 = [v3 webView];
    }
  }

  return v4;
}

- (id)printControllerForContentProvider:(id)a3
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  if ([v3 isBlank])
  {
    char v4 = 0;
  }
  else
  {
    char v4 = [v3 printController];
  }

  return v4;
}

- (void)tabDocumentDidUpdateShowingContinuous:(id)a3
{
  id v5 = a3;
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v5)) {
    [(BrowserController *)self updateInterface];
  }
  id v4 = [(TabController *)self->_tabController activeTabDocument];

  if (v4 == v5) {
    [(BrowserController *)self didChangeContinuousReadingItemInActiveDocument];
  }
}

- (void)tabDocumentDidStartLoading:(id)a3
{
  id v8 = a3;
  id v4 = [(TabController *)self->_tabController activeTabDocument];

  if (v4 == v8)
  {
    [(BrowserController *)self updateInterface];
    if ([v8 isBlank])
    {
      id v5 = [(BrowserController *)self tabBarManager];
      id v6 = [v5 inlineTabBar];
      [v6 updateCloseButtonVisibility];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained browserController:self tabDocumentDidStartLoading:v8];
    }
  }
}

- (void)willStartLoadFromUserTap:(id)a3
{
  id v5 = a3;
  id v4 = [(TabController *)self->_tabController activeTabDocument];

  if (v4 == v5 && ![(BrowserRootViewController *)self->_rootViewController keepBarsMinimized]) {
    [(BrowserController *)self showBars];
  }
}

- (BOOL)tabDocumentCanDownloadFile:(id)a3
{
  id v4 = (TabDocument *)a3;
  if (self->_speculativeLoadDocument == v4)
  {
    [(BrowserController *)self cancelSpeculativeLoad];
  }
  else
  {
    if (![(BrowserController *)self isContinuousReadingDocument:v4])
    {
      BOOL v5 = ![(TabDocument *)v4 isControlledByAutomation];
      goto LABEL_7;
    }
    [(BrowserController *)self clearDocumentForContinuousReading:v4];
  }
  LOBYTE(v5) = 0;
LABEL_7:

  return v5;
}

- (BOOL)tabDocument:(id)a3 canShowDownload:(id)a4
{
  id v5 = a3;
  id v6 = [(TabController *)self->_tabController activeTabDocument];
  if (v6 == v5)
  {
    id v8 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    if ([v8 presentationState] == 1)
    {
      BOOL v7 = 0;
      id v9 = v8;
    }
    else
    {
      uint64_t v10 = [v8 presentationState];

      if (v10 == 2)
      {
        BOOL v7 = 0;
LABEL_9:

        goto LABEL_10;
      }
      id v9 = [(BrowserController *)self viewControllerToPresentFrom];
      uint64_t v11 = [v9 presentedViewController];
      BOOL v7 = v11 == 0;
    }
    goto LABEL_9;
  }
  BOOL v7 = 0;
LABEL_10:

  return v7;
}

- (BOOL)tabDocumentCanRedirectToExternalApplication:(id)a3
{
  id v4 = (TabDocument *)a3;
  if ([(TabDocument *)v4 isControlledByAutomation])
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [(TabController *)self->_tabController tabBeingActivated];
    if (v6 == v4)
    {
      speculativeLoadDocument = self->_speculativeLoadDocument;

      if (speculativeLoadDocument != v4)
      {
        char v5 = 1;
        goto LABEL_8;
      }
    }
    else
    {
    }
    char v5 = [(TabDocument *)v4 isPerformingRedirectAfterOpenInBackground];
  }
LABEL_8:

  return v5;
}

- (void)tabDocumentDidCancelRedirectToExternalApplication:(id)a3
{
  if (self->_speculativeLoadDocument == a3) {
    [(BrowserController *)self cancelSpeculativeLoad];
  }
}

- (void)tabDocument:(id)a3 didFinishLoadingWithError:(BOOL)a4
{
  unsigned int v13 = (TabDocument *)a3;
  id v6 = +[WBReusableTabManager sharedManager];
  char v7 = [v6 isTabSuspended:v13];

  if ((v7 & 1) == 0)
  {
    if (!a4
      && ![(BrowserController *)self isContinuousReadingDocument:v13]
      && self->_speculativeLoadDocument != v13
      && self->_previewDocument != v13)
    {
      [(TabController *)self->_tabController updateWBTabWithTab:v13 notify:1 persist:1];
    }
    id v8 = [(TabController *)self->_tabController activeTabDocument];

    if (v8 == v13)
    {
      [(BrowserRootViewController *)self->_rootViewController stopRefreshing];
      [(BrowserController *)self updateInterface];
      -[BrowserController _sendPDFRepresentationForScreenshotWithTabDocument:](self, v13);
      webClipIDPendingYttriumState = self->_webClipIDPendingYttriumState;
      uint64_t v10 = [(TabDocument *)v13 webClipID];
      LODWORD(webClipIDPendingYttriumState) = [(NSUUID *)webClipIDPendingYttriumState isEqual:v10];

      if (webClipIDPendingYttriumState)
      {
        [(NSTimer *)self->_enterYttriumStateTimer invalidate];
        uint64_t v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__enterYttriumStateTimerFired selector:0 userInfo:0 repeats:1.0];
        enterYttriumStateTimer = self->_enterYttriumStateTimer;
        self->_enterYttriumStateTimer = v11;
      }
    }
  }
}

- (void)_sendPDFRepresentationForScreenshotWithTabDocument:(void *)a1
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (a1[6])
    {
      char v5 = [v3 webView];
      id v6 = [v5 scrollView];
      [v6 visibleBounds];
      id v8 = v7;
      uint64_t v10 = v9;
      uint64_t v12 = v11;
      [v6 zoomScale];
      double v14 = v13;
      [v6 contentSize];
      double v16 = v15;
      [v6 contentOffset];
      double v18 = v16 / v14 - (*(double *)&v12 + v17 / v14);
      if ([v5 _isDisplayingPDF])
      {
        id v19 = [v5 _dataForDisplayedPDF];
        uint64_t v20 = (id)WBS_LOG_CHANNEL_PREFIXPrinting();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v29 = [v19 length];
          _os_log_impl(&dword_1E102C000, v20, OS_LOG_TYPE_DEFAULT, "Webpage was already displaying a PDF, using existing PDF data of length %zu", buf, 0xCu);
        }

        (*(void (**)(double, double, double, double))(a1[6] + 16))(*(double *)&v8, v18, *(double *)&v10, *(double *)&v12);
        id v21 = (void *)a1[6];
        a1[6] = 0;
      }
      else
      {
        objc_initWeak((id *)buf, a1);
        long long v23 = WBS_LOG_CHANNEL_PREFIXPrinting();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl(&dword_1E102C000, v23, OS_LOG_TYPE_INFO, "Generating Screenshot PDF for Markup", v27, 2u);
        }
        uint64_t v24 = [v4 printController];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __72__BrowserController__sendPDFRepresentationForScreenshotWithTabDocument___block_invoke;
        v25[3] = &unk_1E6D79EC8;
        objc_copyWeak(v26, (id *)buf);
        v26[1] = (id)1;
        v26[2] = v8;
        void v26[3] = *(id *)&v18;
        void v26[4] = v10;
        v26[5] = v12;
        [v24 getPDFDataForUsage:2 withCompletion:v25];

        objc_destroyWeak(v26);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      id v22 = WBS_LOG_CHANNEL_PREFIXPrinting();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E102C000, v22, OS_LOG_TYPE_INFO, "Not sending PDF representation of screenshot because we no longer have a pending request block", buf, 2u);
      }
    }
  }
}

- (void)tabDocumentDidCommitNavigation:(id)a3
{
  id v4 = a3;
  if (self->_blockRequestingScreenshotPDFData)
  {
    char v5 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v7 = 0;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "A tab committed a navigation before we could generate a screenshot PDF; calling and clearing completionHandler without a PDF",
        v7,
        2u);
    }
    (*((void (**)(double, double, double, double))self->_blockRequestingScreenshotPDFData + 2))(*MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    id blockRequestingScreenshotPDFData = self->_blockRequestingScreenshotPDFData;
    self->_id blockRequestingScreenshotPDFData = 0;
  }
  [(TabController *)self->_tabController updateWBTabWithTab:v4 notify:0 persist:0];
}

- (void)webViewDidFirstVisuallyNonEmptyLayoutForTabDocument:(id)a3
{
  id v5 = a3;
  [v5 updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:1];
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  -[BrowserController _updateDigitalHealthOverlayForTabDocuments:](self, v4);
}

- (void)tabDocumentDidUpdateTitle:(id)a3
{
  id v4 = a3;
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v4))
  {
    id v5 = [(BrowserController *)self tabBarManager];
    uint64_t v6 = [v5 displayMode];

    if (v6 == 2)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__BrowserController_tabDocumentDidUpdateTitle___block_invoke;
      v9[3] = &unk_1E6D79060;
      void v9[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
    }
    else
    {
      [(BrowserController *)self updateInterface];
    }
  }
  [(TabController *)self->_tabController updateWBTabWithTab:v4 notify:1 persist:0];
  char v7 = [(BrowserRootViewController *)self->_rootViewController tabSwitcherViewController];
  [v7 setNeedsApplyContentAnimated:0];

  [v4 indexTabToCoreSpotlight];
  id v8 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v8 reportTabUpdatedWithUpdateType:1];
}

uint64_t __47__BrowserController_tabDocumentDidUpdateTitle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInterface];
}

- (void)tabDocumentDidUpdateURL:(id)a3
{
  id v5 = a3;
  -[BrowserController _updateSceneTitle]((uint64_t)self);
  [(BrowserController *)self clearCachedTabCompletionData];
  [(TabController *)self->_tabController updateWBTabWithTab:v5 notify:1 persist:0];
  [v5 indexTabToCoreSpotlight];
  id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 reportTabUpdatedWithUpdateType:2];
}

- (void)tabDocumentDidUpdateBackForward:(id)a3
{
  id v4 = a3;
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v4))
  {
    -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 1);
    [(BrowserRootViewController *)self->_rootViewController setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
  }
}

- (void)tabDocumentFluidProgressRocketAnimationDidComplete:(id)a3
{
  id v4 = a3;
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v4)) {
    -[BrowserController prefetchNextContinuousItemIfNeeded]((id *)&self->super.super.super.isa);
  }
}

- (BOOL)tabDocumentShouldHandleAuthentication:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (TabDocument *)a3;
  if (self->_speculativeLoadDocument == v4)
  {
    [(BrowserController *)self cancelSpeculativeLoad];
    id v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    BOOL v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      id v19 = v4;
      char v7 = "TabDocument %p: returning NO for tabDocumentShouldHandleAuthentication because speculative load.";
      goto LABEL_20;
    }
  }
  else if ([(BrowserController *)self isContinuousReadingDocument:v4])
  {
    [(BrowserController *)self clearDocumentForContinuousReading:v4];
    id v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    BOOL v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      id v19 = v4;
      char v7 = "TabDocument %p: returning NO for tabDocumentShouldHandleAuthentication because reader.";
LABEL_20:
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, 0xCu);
      BOOL v6 = 0;
    }
  }
  else if ([(BrowserController *)self isControlledByAutomation])
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    BOOL v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      id v19 = v4;
      char v7 = "TabDocument %p: returning NO for tabDocumentShouldHandleAuthentication because isControlledByAutomation.";
      goto LABEL_20;
    }
  }
  else
  {
    id v8 = [(BrowserController *)self viewControllerToPresentFrom];
    id v9 = [v8 presentedViewController];

    if (v9
      && NSClassFromString((NSString *)@"OBWelcomeController")
      && ([(BrowserController *)self viewControllerToPresentFrom],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v10 presentedViewController],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v11,
          v10,
          (isKindOfClass & 1) != 0))
    {
      id v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      BOOL v6 = 0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134217984;
        id v19 = v4;
        char v7 = "TabDocument %p: returning NO for tabDocumentShouldHandleAuthentication because presentedViewController.";
        goto LABEL_20;
      }
    }
    else
    {
      id v13 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
      if ([v13 presentationState] == 1)
      {
      }
      else
      {
        uint64_t v14 = [v13 presentationState];

        if (v14 != 2)
        {
          if (![(TabDocument *)v4 isPrivateBrowsingEnabled]
            || (+[Application sharedApplication],
                double v16 = objc_claimAutoreleasedReturnValue(),
                int v17 = [v16 isPrivateBrowsingLocked],
                v16,
                !v17))
          {
            BOOL v6 = 1;
            goto LABEL_21;
          }
          id v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
          BOOL v6 = 0;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 134217984;
            id v19 = v4;
            char v7 = "TabDocument %p: returning NO for tabDocumentShouldHandleAuthentication because locked private browsing.";
            goto LABEL_20;
          }
          goto LABEL_21;
        }
      }
      id v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      BOOL v6 = 0;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 134217984;
        id v19 = v4;
        char v7 = "TabDocument %p: returning NO for tabDocumentShouldHandleAuthentication because tabThumbnailCollectionView.";
        goto LABEL_20;
      }
    }
  }
LABEL_21:

  return v6;
}

- (BOOL)tabDocumentShouldHandleCertificateError:(id)a3
{
  id v4 = (TabDocument *)a3;
  id v5 = v4;
  if (!gRunningPurpleTest)
  {
    if (self->_speculativeLoadDocument == v4)
    {
      [(BrowserController *)self cancelSpeculativeLoad];
    }
    else
    {
      if (![(BrowserController *)self isContinuousReadingDocument:v4])
      {
        BOOL v6 = ![(BrowserController *)self isControlledByAutomation];
        goto LABEL_8;
      }
      [(BrowserController *)self clearDocumentForContinuousReading:v5];
    }
  }
  LOBYTE(v6) = 0;
LABEL_8:

  return v6;
}

- (BOOL)tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:(id)a3
{
  id v4 = (TabDocument *)a3;
  id v5 = v4;
  if (!gRunningPurpleTest)
  {
    if (self->_speculativeLoadDocument == v4)
    {
      [(BrowserController *)self cancelSpeculativeLoad];
    }
    else
    {
      if (![(BrowserController *)self isContinuousReadingDocument:v4])
      {
        BOOL v6 = 1;
        goto LABEL_3;
      }
      [(BrowserController *)self clearDocumentForContinuousReading:v5];
    }
  }
  BOOL v6 = 0;
LABEL_3:

  return v6;
}

- (void)tabDocumentDidAddAlert:(id)a3
{
  id v4 = (TabDocument *)a3;
  id v5 = v4;
  if (self->_speculativeLoadDocument == v4)
  {
    [(BrowserController *)self cancelSpeculativeLoad];
  }
  else if ([(BrowserController *)self isContinuousReadingDocument:v4])
  {
    [(BrowserController *)self clearDocumentForContinuousReading:v5];
  }
}

- (void)tabDocument:(id)a3 didDetectReaderAvailability:(BOOL)a4
{
  id v8 = a3;
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v8)) {
    -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 1);
  }
  if (a4)
  {
    if ([(BrowserController *)self isContinuousReadingDocument:v8]
      && [(BrowserController *)self readerShouldBeShownIfPossible])
    {
      [v8 createBrowserReaderViewIfNeeded];
      -[BrowserController _setContinuousReadingContentViewFromTabDocument:useReaderView:]((id *)&self->super.super.super.isa, v8, 1);
    }
  }
  else
  {
    BOOL v6 = [v8 contextController];
    char v7 = [v8 URL];
    objc_msgSend(v6, "contextForPageURL:content:contentType:metadata:isPrivate:isReaderAvailable:withCompletionHandler:", v7, 0, 0, 0, objc_msgSend(v8, "isPrivateBrowsingEnabled"), 0, 0);
  }
}

- (void)tabDocumentDidChangeMediaState:(id)a3 needsUpdateGlobalAudioState:(BOOL)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browserController:self tabDocumentDidChangeMediaState:v6];
  }
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v6)) {
    -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 0);
  }
}

- (void)tabDocumentDidUpdateIsScribbling:(id)a3
{
  id v4 = a3;
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v4)) {
    -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 1);
  }
}

- (void)tabDocument:(id)a3 didExtractArticleText:(id)a4 withMetadata:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  -[BrowserController _requestQueryResultsOnTabDocument:forText:contentType:pageMetadata:](self, v11, v8, 1, v9);
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
  -[BrowserController _updateDigitalHealthOverlayForTabDocuments:](self, v10);
}

- (void)_requestQueryResultsOnTabDocument:(void *)a3 forText:(uint64_t)a4 contentType:(void *)a5 pageMetadata:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = [v9 contextController];
    [v12 invalidateCachedResults];
    objc_initWeak(&location, a1);
    id v13 = [v9 URL];
    uint64_t v14 = [v9 isPrivateBrowsingEnabled];
    uint64_t v15 = [v9 isReaderAvailable];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__BrowserController__requestQueryResultsOnTabDocument_forText_contentType_pageMetadata___block_invoke;
    v16[3] = &unk_1E6D79D90;
    objc_copyWeak(&v17, &location);
    [v12 contextForPageURL:v13 content:v10 contentType:a4 metadata:v11 isPrivate:v14 isReaderAvailable:v15 withCompletionHandler:v16];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)filteredArticleTextDidBecomeReadyInTabDocument:(id)a3
{
}

- (void)_extractTextFromReaderWebViewOfTab:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 readerWebView];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__BrowserController__extractTextFromReaderWebViewOfTab___block_invoke;
    v6[3] = &unk_1E6D79538;
    void v6[4] = a1;
    id v7 = v4;
    [v5 _getContentsAsStringWithCompletionHandler:v6];
  }
}

void __56__BrowserController__extractTextFromReaderWebViewOfTab___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = -[BrowserController _stringByRemovingContentBetweenZeroWidthSpacesForText:](*(void *)(a1 + 32), v5);
    if ([v7 length]) {
      id v8 = v7;
    }
    else {
      id v8 = v5;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 792), v8);
    id v9 = [*(id *)(a1 + 40) uuid];
    id v10 = [v9 UUIDString];
    int v11 = [v10 isEqualToString:*(void *)(*(void *)(a1 + 32) + 592)];

    if (v11)
    {
      -[BrowserController _siriReadThisVocalInvocation](*(id **)(a1 + 32));
      uint64_t v12 = &OBJC_IVAR___BrowserController__tabUUIDStringForSiriReadThisVocalInvocation;
    }
    else
    {
      id v13 = [*(id *)(a1 + 40) uuid];
      uint64_t v14 = [v13 UUIDString];
      int v15 = [v14 isEqualToString:*(void *)(*(void *)(a1 + 32) + 600)];

      if (!v15) {
        goto LABEL_13;
      }
      -[BrowserController _siriReadThisMenuInvocation](*(id **)(a1 + 32));
      uint64_t v12 = &OBJC_IVAR___BrowserController__tabUUIDStringForSiriReadThisMenuInvocation;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *v12;
    int v18 = *(void **)(v16 + v17);
    *(void *)(v16 + v17) = 0;

    goto LABEL_13;
  }
  id v7 = (id)WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __56__BrowserController__extractTextFromReaderWebViewOfTab___block_invoke_cold_1();
  }
LABEL_13:
}

- (id)_stringByRemovingContentBetweenZeroWidthSpacesForText:(uint64_t)a1
{
  void v9[4] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v9[0] = 0;
    id v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\u200B.*?\\u200B" options:8 error:v9];
    id v5 = v9[0];
    if (v5)
    {
      id v6 = (id)WBS_LOG_CHANNEL_PREFIXSiriReadThis();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[BrowserController _stringByRemovingContentBetweenZeroWidthSpacesForText:]();
      }

      id v7 = 0;
    }
    else
    {
      id v7 = objc_msgSend(v4, "stringByReplacingMatchesInString:options:range:withTemplate:", v3, 0, 0, objc_msgSend(v3, "length"), &stru_1F3C268E8);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_siriReadThisVocalInvocation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  int v2 = [a1[43] activeTabDocument];
  long long v23 = [v2 readerContext];
  id v3 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  id v4 = [v3 activeSiriReaderSessionIdentifier];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    id v6 = [v5 activeSiriReaderSessionURL];
    id v7 = [v23 readerURL];
    char v8 = WBSIsEqual();

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
      uint64_t v10 = [v9 activeSiriReaderSessionIdentifier];
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v9 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v10 = [v9 UUIDString];
LABEL_7:
  int v11 = (void *)v10;

  id v22 = objc_alloc_init((Class)getSiriReaderConnectionClass());
  unint64_t v12 = [a1 siriReaderPlaybackStateForActiveTab];
  id v13 = [v2 webView];
  uint64_t v14 = [v13 title];
  if (v12 <= 3 && v12 != 1)
  {
    int v15 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    [v15 setDelegate:a1];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__3;
    uint64_t v36 = __Block_byref_object_dispose__3;
    id v37 = 0;
    id v16 = objc_alloc_init(MEMORY[0x1E4F30AB0]);
    objc_initWeak(&location, a1);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__BrowserController__siriReadThisVocalInvocation__block_invoke;
    v24[3] = &unk_1E6D79F68;
    objc_copyWeak(&v31, &location);
    p_long long buf = &buf;
    id v25 = v22;
    id v26 = v14;
    id v17 = v11;
    id v27 = v17;
    id v28 = v23;
    id v29 = v2;
    int v18 = (void *)MEMORY[0x1E4E42950](v24);
    id v19 = [v13 URL];
    [v16 startFetchingMetadataForURL:v19 completionHandler:v18];

    uint64_t v20 = [a1[43] activeTabDocument];
    [v20 setLastSiriReaderSessionIdentifier:v17];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

    _Block_object_dispose(&buf, 8);
  }
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1E102C000, This, OS_LOG_TYPE_INFO, "Data identifier: %@", (uint8_t *)&buf, 0xCu);
  }
}

- (void)_siriReadThisMenuInvocation
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.7779e-34);
  _os_log_debug_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEBUG, "Current URL: %@ ", v4, 0xCu);
}

void __88__BrowserController__requestQueryResultsOnTabDocument_forText_contentType_pageMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __88__BrowserController__requestQueryResultsOnTabDocument_forText_contentType_pageMetadata___block_invoke_2;
  v5[3] = &unk_1E6D79A60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __88__BrowserController__requestQueryResultsOnTabDocument_forText_contentType_pageMetadata___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = -[BrowserController _catalogViewController](WeakRetained);
    [v3 updateQuerySuggestionsFromResponse:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)tabDocument:(id)a3 didCreateNewTabDocument:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  [v6 updateAncestryWithParentTab:v11];
  [(TabController *)self->_tabController insertNewTabDocumentWithDefaultOrdering:v6 inBackground:0 animated:1];
  id v7 = [v11 trackerInfo];
  char v8 = [v7 queryParameterFilteringDataQueue];
  id v9 = [v6 trackerInfo];
  uint64_t v10 = [v9 queryParameterFilteringDataQueue];
  [v8 transferPendingDataToQueue:v10];
}

- (void)tabDocumentShouldCloseAndSwitchToParentTab:(id)a3
{
  id v4 = a3;
  tabController = self->_tabController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__BrowserController_tabDocumentShouldCloseAndSwitchToParentTab___block_invoke;
  v7[3] = &unk_1E6D791E8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TabController *)tabController performBatchUpdatesWithBlock:v7];
}

void __64__BrowserController_tabDocumentShouldCloseAndSwitchToParentTab___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 344);
  id v3 = [*(id *)(a1 + 40) parentTabDocumentForBackClosesSpawnedTab];
  [v2 setActiveTabDocument:v3 animated:0];

  id v4 = *(void **)(*(void *)(a1 + 32) + 344);
  v6[0] = *(void *)(a1 + 40);
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v4 closeTabs:v5 animated:1 allowAddingToRecentlyClosedTabs:0 showAutoCloseTabsAlert:0];
}

- (unint64_t)popUpPolicyForTabDocument:(id)a3
{
  id v4 = (TabDocument *)a3;
  id v5 = +[Application sharedApplication];
  char v6 = [v5 isRunningCanvasTest];

  if (v6)
  {
    unint64_t v7 = 1;
  }
  else if (self->_speculativeLoadDocument == v4)
  {
    [(BrowserController *)self cancelSpeculativeLoad];
    unint64_t v7 = 2;
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)_invalidatePreviewDocumentCloseTimer
{
  if (a1)
  {
    [*(id *)(a1 + 208) invalidate];
    uint64_t v2 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = 0;
  }
}

- (void)_closePreviewDocumentTimerFired:(id)a3
{
  id v4 = a3;
  if (!self->_previewDocument
    || ![(TabController *)self->_tabController createTabGroupAlertIsPresented])
  {
    [(BrowserController *)self closePreviewDocument];
  }
}

- (void)closePreviewDocument
{
  previewDocument = self->_previewDocument;
  if (previewDocument)
  {
    id v4 = [(TabDocument *)previewDocument webView];
    id v5 = [v4 window];

    if (!v5)
    {
      [(TabDocument *)self->_previewDocument willClose];
      char v6 = self->_previewDocument;
      self->_previewDocument = 0;

      objc_storeWeak((id *)&self->_backForwardListItemNeedingSnapshot, 0);
      unint64_t v7 = +[History sharedHistory];
      [v7 cancelDeferredUpdates];

      if ([(NSTimer *)self->_previewDocumentCloseTimer isValid])
      {
        id v8 = [(NSTimer *)self->_previewDocumentCloseTimer userInfo];
        [v8 updateUsageTrackingInformationAfterLinkPreviewDismissal];
      }
      -[BrowserController _invalidatePreviewDocumentCloseTimer]((uint64_t)self);
    }
  }
}

- (void)tabDocument:(id)a3 didCreatePreviewDocument:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = (TabDocument *)a4;
  p_previewDocument = (id *)&self->_previewDocument;
  if (self->_previewDocument != v7)
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *p_previewDocument;
      int v13 = 138740483;
      uint64_t v14 = v7;
      __int16 v15 = 2117;
      id v16 = v6;
      __int16 v17 = 2117;
      id v18 = v10;
      _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Creating link preview %{sensitive}@ from source tab %{sensitive}@. Previous link preview: %{sensitive}@", (uint8_t *)&v13, 0x20u);
    }
    if (*p_previewDocument)
    {
      [*p_previewDocument willClose];
      -[BrowserController _invalidatePreviewDocumentCloseTimer]((uint64_t)self);
    }
    objc_storeStrong((id *)&self->_previewDocument, a4);
    id v11 = [*p_previewDocument _backForwardList];
    unint64_t v12 = [v11 currentItem];
    objc_storeWeak((id *)&self->_backForwardListItemNeedingSnapshot, v12);
  }
}

- (void)tabDocumentCommitPreviewedDocument:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    previewDocument = self->_previewDocument;
    int v16 = 134218240;
    __int16 v17 = previewDocument;
    __int16 v18 = 2048;
    id v19 = v4;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Committing link preview %p to load in source tab %p", (uint8_t *)&v16, 0x16u);
  }
  unint64_t v7 = [(BrowserController *)self tabController];
  id v8 = [v7 activeTabDocument];

  id v9 = self->_previewDocument;
  if (v9)
  {
    tabController = self->_tabController;
    id v11 = [(TabDocument *)v9 URL];
    LODWORD(tabController) = [(TabController *)tabController trySwitchingToPinnedTabOnNavigationToURL:v11];

    if (tabController)
    {
      [(BrowserController *)self closePreviewDocument];
    }
    else
    {
      if ((-[BrowserController _spawnNewTabFromPinnedTabIfNeededForSpeculativeDocument:]((uint64_t)self, self->_previewDocument) & 1) == 0)
      {
        -[BrowserController _commitToSpeculativeLoadForDocument:]((id *)&self->super.super.super.isa, self->_previewDocument);
        [v8 willClose];
      }
      int v13 = self->_previewDocument;
      self->_previewDocument = 0;

      -[BrowserController _invalidatePreviewDocumentCloseTimer]((uint64_t)self);
      uint64_t v14 = [v4 history];
      [v14 commitDeferredUpdates];

      __int16 v15 = [(BrowserController *)self webView];
      -[BrowserController _updateScrollOffsetForReplacementWebView:]((id *)&self->super.super.super.isa, v15);
    }
  }
  else
  {
    unint64_t v12 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BrowserController tabDocumentCommitPreviewedDocument:]();
    }
  }
}

- (void)tabDocumentCommitPreviewedDocumentAsNewTab:(id)a3 inBackground:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = self->_previewDocument;
  id v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134218240;
    __int16 v18 = v7;
    __int16 v19 = 2048;
    id v20 = v6;
    _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Committing link preview %p in new tab from source tab %p", (uint8_t *)&v17, 0x16u);
  }
  if (v7)
  {
    if (v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained browserControllerWillCreateBackgroundTab:self];
      }
    }
    previewDocument = self->_previewDocument;
    self->_previewDocument = 0;

    id v11 = [(TabController *)self->_tabController activeTabDocument];
    [(TabDocument *)v7 updateAncestryWithParentTab:v11];

    [(TabController *)self->_tabController insertNewTabDocumentWithDefaultOrdering:v7 inBackground:v4 animated:1];
    unint64_t v12 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v12, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 1, -[TabCollectionViewProviding visibleTabCollectionViewType](self->_tabCollectionViewProvider, "visibleTabCollectionViewType"));

    if (v4)
    {
      int v13 = [(TabDocument *)v7 webView];
      [(BrowserController *)self updateInsetsForBackgroundWebView:v13];
    }
    uint64_t v14 = [v6 history];
    [v14 commitDeferredUpdates];

    __int16 v15 = [(TabDocument *)v7 webView];
    -[BrowserController _updateScrollOffsetForReplacementWebView:]((id *)&self->super.super.super.isa, v15);
  }
  else
  {
    int v16 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BrowserController tabDocumentCommitPreviewedDocumentAsNewTab:inBackground:](v4, (uint64_t)v6, v16);
    }
  }
}

- (void)tabDocumentDidDimissPreviewedDocument:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    previewDocument = self->_previewDocument;
    int v9 = 134218240;
    id v10 = previewDocument;
    __int16 v11 = 2048;
    id v12 = v4;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing link preview %p from source tab %p", (uint8_t *)&v9, 0x16u);
  }
  -[BrowserController _invalidatePreviewDocumentCloseTimer]((uint64_t)self);
  unint64_t v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__closePreviewDocumentTimerFired_ selector:v4 userInfo:0 repeats:0.0];
  previewDocumentCloseTimer = self->_previewDocumentCloseTimer;
  self->_previewDocumentCloseTimer = v7;
}

- (void)tabDocumentWillDisableLinkPreview
{
  [(TabDocument *)self->_previewDocument willClose];
  previewDocument = self->_previewDocument;
  self->_previewDocument = 0;
}

- (BOOL)tabDocumentCanDisplayModalUI:(id)a3
{
  id v4 = a3;
  if (![v4 isPrivateBrowsingEnabled]
    || (+[Application sharedApplication],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isPrivateBrowsingLocked],
        v5,
        (v6 & 1) == 0))
  {
    id v8 = [(TabController *)self->_tabController activeTabDocument];
    if (v8 != v4)
    {
      LOBYTE(v7) = 0;
LABEL_12:

      goto LABEL_13;
    }
    id v9 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    if ([v9 presentationState] == 1)
    {
    }
    else
    {
      uint64_t v10 = [v9 presentationState];

      if (v10 != 2)
      {
        BOOL v7 = ![(BrowserController *)self isShowingFavorites];
        goto LABEL_11;
      }
    }
    LOBYTE(v7) = 0;
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v7) = 0;
LABEL_13:

  return v7;
}

- (BOOL)tabDocumentCanBeginInputSessionForStreamlinedLogin:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self->_tabController activeTabDocument];
  if (v5 == v4)
  {
    id v7 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    if ([v7 presentationState] == 1)
    {
      LOBYTE(v6) = 0;
      id v8 = v7;
    }
    else
    {
      uint64_t v9 = [v7 presentationState];

      if (v9 == 2 || [(BrowserController *)self isShowingFavorites])
      {
        LOBYTE(v6) = 0;
        goto LABEL_9;
      }
      id v8 = [(BrowserController *)self viewControllerToPresentFrom];
      __int16 v11 = [v8 presentedViewController];
      if (v11) {
        LOBYTE(v6) = 0;
      }
      else {
        int v6 = [v4 shouldObscureForDigitalHealth] ^ 1;
      }
    }
LABEL_9:

    goto LABEL_10;
  }
  LOBYTE(v6) = 0;
LABEL_10:

  return v6;
}

- (void)tabController:(id)a3 didSwitchFromTabGroup:(id)a4
{
  -[BrowserController _updateTabGroupBanner]((id *)&self->super.super.super.isa);
  [(BrowserController *)self updateTabOverviewButton];
  [(BrowserController *)self clearParticipantsList];
  [(BrowserController *)self updateCollaborationButton];
  [(BrowserController *)self dismissAutoFillInternalFeedbackToastImmediately:1];
}

- (void)tabDocumentShouldBecomeActive:(id)a3
{
  id v13 = a3;
  if ([(id)*MEMORY[0x1E4FB2608] supportsMultipleScenes])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1B80]);
    [v4 setPreserveLayout:1];
    id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v6 = -[BrowserController _sceneSession]((id *)&self->super.super.super.isa);
    [v5 requestSceneSessionActivation:v6 userActivity:0 options:v4 errorHandler:&__block_literal_global_976];
  }
  id v7 = [(TabController *)self->_tabController activeTabDocument];

  id v8 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v8 presentationState] == 1)
  {

    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = [v8 presentationState];
    BOOL v9 = v10 == 2;

    if (v7 == v13 && v10 != 2) {
      goto LABEL_16;
    }
  }
  int v12 = [v13 isPrivateBrowsingEnabled];
  if (v12 != [(BrowserController *)self isPrivateBrowsingEnabled]) {
    [(BrowserController *)self togglePrivateBrowsingEnabled];
  }
  if (v7 != v13) {
    [(TabController *)self->_tabController setActiveTabDocument:v13];
  }
  if (v9) {
    [v8 dismissAnimated:0];
  }
LABEL_16:
}

void __51__BrowserController_tabDocumentShouldBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)WBS_LOG_CHANNEL_PREFIXMediaCapture();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __51__BrowserController_tabDocumentShouldBecomeActive___block_invoke_cold_1();
  }
}

- (id)loadURLInNewTab:(id)a3 inBackground:(BOOL)a4
{
  id v4 = [(BrowserController *)self loadURLInNewTab:a3 inBackground:a4 animated:1];
  return v4;
}

- (id)loadURLInNewTab:(id)a3 inBackground:(BOOL)a4 animated:(BOOL)a5
{
  id v5 = [(BrowserController *)self loadURLInNewTab:a3 title:0 UUID:0 inBackground:a4 animated:a5 restoringCloudTab:0];
  return v5;
}

- (id)loadURLInNewTab:(id)a3 title:(id)a4 UUID:(id)a5 inBackground:(BOOL)a6 animated:(BOOL)a7 restoringCloudTab:(BOOL)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v30 = a4;
  id v29 = a5;
  if (![(TabController *)self->_tabController updatingTabGroupTabs]) {
    [(BrowserController *)self dismissTransientUIAnimated:v9];
  }
  if (a8)
  {
    __int16 v15 = 0;
    int v16 = [[TabDocument alloc] initWithTitle:v30 URL:v14 UUID:v29 privateBrowsingEnabled:[(BrowserController *)self isPrivateBrowsingEnabled] hibernated:1 bookmark:0 browserController:self];
  }
  else
  {
    __int16 v15 = [(TabController *)self->_tabController activeTabDocument];
    int v16 = [[TabDocument alloc] initWithBrowserController:self];
  }
  int v17 = v16;
  [(TabDocument *)v16 updateAncestryWithParentTab:v15];
  [(TabDocument *)v17 setParentTabDocumentForBackClosesSpawnedTab:v15];
  [(TabController *)self->_tabController insertNewTabDocumentWithDefaultOrdering:v17 inBackground:v10 animated:v9];
  uint64_t v18 = [(TabDocument *)v17 supportsAdvancedPrivacyProtectionsForURL:v14];
  __int16 v19 = [(TabDocument *)v17 reloadOptionsController];
  [v19 setSupportsAdvancedPrivacyProtections:v18];

  id v20 = [v15 trackerInfo];
  uint64_t v21 = [v20 queryParameterFilteringDataQueue];
  id v22 = [(TabDocument *)v17 trackerInfo];
  long long v23 = [v22 queryParameterFilteringDataQueue];
  [v21 transferPendingDataToQueue:v23];

  uint64_t v24 = [v15 reloadOptionsController];
  LODWORD(v23) = [v24 loadedUsingDesktopUserAgent];

  if (v23)
  {
    id v25 = [(TabDocument *)v17 reloadOptionsController];
    [v25 requestDesktopSiteWithURL:v14];
  }
  else
  {
    id v26 = [(TabDocument *)v17 loadURL:v14 userDriven:1];
  }
  [(TabDocument *)v17 setTabReuseURL:v14];
  [(TabDocument *)v17 setWasOpenedFromLink:v9 && ~v10];
  if ([(TabCollectionViewProviding *)self->_tabCollectionViewProvider hasTabBar])
  {
    [(BrowserController *)self showBars];
    [(TabCollectionViewProviding *)self->_tabCollectionViewProvider updateTabBarAnimated:1];
  }
  if (v10)
  {
    id v27 = [(TabDocument *)v17 webView];
    [(BrowserController *)self updateInsetsForBackgroundWebView:v27];
  }
  return v17;
}

- (void)loadCloudTabsForDeviceRestoration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (id)WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v18 = [v4 count];
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Loading %zu CloudTabs for device restoration", buf, 0xCu);
  }

  -[BrowserController _dismissTransientUIAnimated:dismissalOptions:completionHandler:]((uint64_t)self, 1, 3, 0);
  int v6 = [(WBTabGroupManager *)self->_tabGroupManager deviceIdentifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__BrowserController_loadCloudTabsForDeviceRestoration___block_invoke;
  v15[3] = &unk_1E6D79DB8;
  id v7 = v6;
  id v16 = v7;
  id v8 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v15);
  tabGroupManager = self->_tabGroupManager;
  BOOL v10 = [(WBWindowState *)self->_windowState localTabGroup];
  __int16 v11 = [v10 uuid];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__BrowserController_loadCloudTabsForDeviceRestoration___block_invoke_2;
  v13[3] = &unk_1E6D79DE0;
  id v12 = v8;
  id v14 = v12;
  [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v11 persist:1 usingBlock:v13];
}

id __55__BrowserController_loadCloudTabsForDeviceRestoration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4FB6078]);
  id v5 = [v3 title];
  int v6 = [v3 url];
  id v7 = (void *)[v4 initWithTitle:v5 url:v6 deviceIdentifier:*(void *)(a1 + 32)];

  return v7;
}

uint64_t __55__BrowserController_loadCloudTabsForDeviceRestoration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 appendTabs:*(void *)(a1 + 32)];
}

- (void)tabDocumentDidCompleteCheckForAppBanner:(id)a3
{
  id v6 = a3;
  if (-[BrowserController _canUpdateInterfaceWithTabDocument:]((uint64_t)self, v6))
  {
    id v4 = [v6 appBanner];

    if (v4)
    {
      id v5 = [v6 appBanner];
      -[BrowserController _setShowingAppBanner:isShowing:]((uint64_t)self, v5, 1);
    }
  }
}

- (BOOL)tabDocumentShouldDeferAppBannerRemoval:(id)a3
{
  id v3 = [(BrowserRootViewController *)self->_rootViewController refreshControl];
  char v4 = [v3 isRefreshing];

  return v4;
}

- (void)removeAppBannerFromTabDocument:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [v7 appBanner];
  [v7 setAppBanner:0];
  [v7 setAppBannerRemovalWasDeferred:0];
  if ((-[BrowserController _setShowingOverlayForBanner:showing:]((uint64_t)self, v6, 0) & 1) == 0) {
    [(BannerController *)self->_bannerController setAppBanner:0 animated:v4];
  }
}

- (void)setAppBannerPinnedToTop:(BOOL)a3 forTabDocument:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = [v6 appBanner];
  int v8 = [v7 isPinnedToTop];

  if (v8 != v4)
  {
    BOOL v9 = [v6 appBanner];
    if (v4) {
      [(id)objc_opt_class() pinAnimationDelay];
    }
    else {
      [(id)objc_opt_class() unpinAnimationDelay];
    }
    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__BrowserController_setAppBannerPinnedToTop_forTabDocument___block_invoke;
    block[3] = &unk_1E6D793C0;
    char v16 = v4;
    id v14 = v9;
    __int16 v15 = self;
    id v12 = v9;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
}

void __60__BrowserController_setAppBannerPinnedToTop_forTabDocument___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  [(id)objc_opt_class() unpinAnimationDuration];
  double v4 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__BrowserController_setAppBannerPinnedToTop_forTabDocument___block_invoke_2;
  v7[3] = &unk_1E6D793C0;
  id v5 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [v2 animateWithDuration:4 delay:v7 options:0 animations:v4 completion:0.0];
}

void __60__BrowserController_setAppBannerPinnedToTop_forTabDocument___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setPinnedToTop:*(unsigned __int8 *)(a1 + 48)];
  -[BrowserController _updateAppInfoOverlayFrame](*(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  -[BrowserController _updateNavigationBarSeparator](v2);
}

- (void)tabDocumentWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
}

- (void)tabDocumentDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  -[BrowserController _navigationGestureDidEndWithNavigation:]((uint64_t)self, a4 != 0);
}

- (void)tabDocumentWillShowInlineDialog:(id)a3
{
  id v5 = a3;
  id v4 = [(TabController *)self->_tabController activeTabDocument];

  if (v4 == v5)
  {
    [(BrowserController *)self setFavoritesAreEmbedded:0 animated:1];
    [(BrowserController *)self showBars];
  }
}

- (void)tabDocumentWillDismissInlineDialog:(id)a3
{
  id v5 = a3;
  if ([v5 isShowingSystemStartPage])
  {
    id v4 = [(TabController *)self->_tabController activeTabDocument];

    if (v4 == v5) {
      [(BrowserController *)self setFavoritesAreEmbedded:1 animated:1];
    }
  }
}

- (void)tabDocument:(id)a3 didClearLibraryType:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(LibraryController *)self->_libraryController sidebarViewController];
  [v7 setPresentedItemController:0];

  [(TabController *)self->_tabController openTab:v8 navigatedFromLibraryType:v6];
}

- (void)tabDocument:(id)a3 presentViewControllerAnimated:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 presentingViewController];

  if (v8)
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v7 presentingViewController];
      objc_claimAutoreleasedReturnValue();
      -[BrowserController tabDocument:presentViewControllerAnimated:]();
    }
  }
  id v10 = [(TabController *)self->_tabController activeTabDocument];
  if (v10 != v6) {
    goto LABEL_10;
  }
  id v11 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v11 presentationState] == 1)
  {

LABEL_9:
    id v10 = v6;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v12 = [v11 presentationState] == 2;

  if (v12) {
    goto LABEL_9;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerToDismissWhileBeingPresented);
  BOOL v19 = WeakRetained == 0;

  if (v19)
  {
    id v20 = [(BrowserController *)self viewControllerToPresentFrom];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__BrowserController_tabDocument_presentViewControllerAnimated___block_invoke;
    v21[3] = &unk_1E6D791E8;
    void v21[4] = self;
    id v22 = v7;
    [v20 presentViewController:v22 animated:1 completion:v21];

    goto LABEL_16;
  }
LABEL_11:
  viewControllersPendingPresentation = self->_viewControllersPendingPresentation;
  if (!viewControllersPendingPresentation)
  {
    char v16 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    int v17 = self->_viewControllersPendingPresentation;
    self->_viewControllersPendingPresentation = v16;

LABEL_15:
    [(NSMapTable *)self->_viewControllersPendingPresentation setObject:v7 forKey:v6];
    goto LABEL_16;
  }
  id v14 = [(NSMapTable *)viewControllersPendingPresentation objectForKey:v6];
  BOOL v15 = v14 == 0;

  if (v15) {
    goto LABEL_15;
  }
LABEL_16:
}

void __63__BrowserController_tabDocument_presentViewControllerAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 400));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained == v3)
  {
    [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 400), 0);
    id v4 = *(id **)(a1 + 32);
    -[BrowserController _presentPendingViewControllerForActiveTab](v4);
  }
}

- (void)tabDocument:(id)a3 dismissViewControllerAnimated:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_viewControllersPendingPresentation objectForKey:v10];

  if (v7 == v6)
  {
    [(NSMapTable *)self->_viewControllersPendingPresentation removeObjectForKey:v10];
  }
  else
  {
    id v8 = [v6 presentingViewController];
    if (v8 && (int v9 = [v6 isBeingPresented], v8, !v9)) {
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
    else {
      objc_storeWeak((id *)&self->_viewControllerToDismissWhileBeingPresented, v6);
    }
  }
}

- (BOOL)tabDocumentCanCloseWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self->_tabController currentTabs];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    id v7 = [(BrowserController *)self viewControllerToPresentFrom];
    id v8 = [v7 presentedViewController];
    BOOL v9 = v8 == 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)closeTabDocument:(id)a3 animated:(BOOL)a4
{
}

- (void)tabDocumentDidChangeSafeAreaShouldAffectObscuredInsets:(id)a3
{
  [(BrowserRootViewController *)self->_rootViewController updateWebViewSizeAttributes];
  [(BrowserController *)self updateExposedScrollViewRect];
  BOOL needsImmediateLayoutForWebViewObscuredInsetsUpdate = self->_needsImmediateLayoutForWebViewObscuredInsetsUpdate;
  self->_BOOL needsImmediateLayoutForWebViewObscuredInsetsUpdate = 1;
  -[BrowserController updateWebViewObscuredInsets]((uint64_t)self);
  self->_BOOL needsImmediateLayoutForWebViewObscuredInsetsUpdate = needsImmediateLayoutForWebViewObscuredInsetsUpdate;
}

- (id)pageZoomPreferenceManagerForTabDocument:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserWindowController);
  if ([v4 isPrivateBrowsingEnabled])
  {
    char v6 = [WeakRetained privateBrowsingPageZoomManager];
  }
  else
  {
    id v7 = [WeakRetained perSitePreferencesVendor];
    char v6 = [v7 pageZoomPreferenceManager];
  }
  return v6;
}

- (void)tabDocumentDidUpdateThemeColor:(id)a3
{
}

- (void)tabDocumentDidChangeCanStopLoadingState:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedActivityViewController);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [WeakRetained updateReloadActivity];
  }
  id v4 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
  [v4 updateVisibleContextMenu];
}

- (BOOL)tabDocumentShouldFillStringForFind:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __56__BrowserController_tabDocumentShouldFillStringForFind___block_invoke;
  v6[3] = &unk_1E6D79060;
  void v6[4] = self;
  [v4 setHandler:v6];
  LOBYTE(self) = self->_shouldFillStringForFind;

  return (char)self;
}

uint64_t __56__BrowserController_tabDocumentShouldFillStringForFind___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 337) = 0;
  return result;
}

- (BOOL)tabDocumentCanFindNextOrPrevious:(id)a3
{
  if (!-[BrowserController _showingTabDocumentWithURL]((uint64_t)self)) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F466F0] _stringForFind];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (int64_t)orderIndexForTab:(id)a3
{
  id v4 = a3;
  id v5 = [v4 wbTab];
  char v6 = [v5 tabGroupUUID];

  if (v6)
  {
    id v7 = [(TabController *)self->_tabController activeTabGroupUUID];
    if (WBSIsEqual())
    {
    }
    else
    {
      id v8 = [(TabController *)self->_tabController windowState];
      BOOL v9 = [v8 privateTabGroup];
      id v10 = [v9 uuid];
      int v11 = WBSIsEqual();

      if (!v11)
      {
        id v14 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v6];
        int v17 = [v14 tabs];
        uint64_t v18 = [v4 wbTab];
        int64_t v15 = [v17 indexOfObject:v18];

        goto LABEL_9;
      }
    }
  }
  int v12 = [v4 isPrivateBrowsingEnabled];
  tabController = self->_tabController;
  if (v12) {
    [(TabController *)tabController privateTabs];
  }
  else {
  id v14 = [(TabController *)tabController normalTabs];
  }
  int64_t v15 = [v14 indexOfObject:v4];
LABEL_9:

  return v15;
}

- (void)_updateCurrentPageBannerViewBeforeContinuousTransition
{
  if (a1)
  {
    id v1 = [*(id *)(a1 + 88) topBannerView];
    [v1 removeFromSuperview];
  }
}

- (id)_cachedDocumentForContinuousReadingItem:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 cachedDocumentOnContinuousTransition];
    id v5 = [v3 readingListBookmark];
    int v6 = [v5 identifier];
    if (v6 == [v4 readingListBookmarkID])
    {
      id v7 = [v4 webView];

      BOOL v8 = v7 == 0;
      if (v7) {
        BOOL v9 = v4;
      }
      else {
        BOOL v9 = 0;
      }
      if (!v8) {
        id v4 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_tabDocumentForNextContinuousItem
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[BrowserController _prepareTabDocumentForNextContinuousItemIfNeeded](a1);
    a1 = (id *)v2[22];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_startLoadDocument:(void *)a3 continuousReadingItem:
{
  id v12 = a2;
  id v5 = a3;
  int v6 = v5;
  if (a1)
  {
    id v7 = [v5 URL];
    BOOL v8 = [v6 readingListBookmark];
    BOOL v9 = [a1 tabController];
    id v10 = [v9 activeTabDocument];
    int v11 = [v10 sessionState];

    [v12 restoreSessionState:v11 andNavigate:0];
    [v12 loadURLForContinuousReadingList:v7 fromBookmark:v8];
  }
}

- (void)loadNextContinuousDocumentIfNeeded
{
  if (a1)
  {
    if (([a1[22] isLoading] & 1) == 0 && (objc_msgSend(a1[22], "didFinishDocumentLoad") & 1) == 0)
    {
      -[BrowserController _prepareTabDocumentForNextContinuousItemIfNeeded](a1);
      uint64_t v2 = [a1[11] previewView];
      if (!v2
        || (id v8 = (id)v2,
            [a1[11] previewView],
            id v3 = objc_claimAutoreleasedReturnValue(),
            char v4 = [v3 isPrefetchingDisabled],
            v3,
            v8,
            (v4 & 1) == 0))
      {
        if (([a1[11] isCommittingToContinuousDocument] & 1) != 0
          || ([MEMORY[0x1E4F28F80] processInfo],
              id v9 = (id)objc_claimAutoreleasedReturnValue(),
              char v5 = [v9 isLowPowerModeEnabled],
              v9,
              (v5 & 1) == 0))
        {
          id v6 = a1[22];
          id v10 = [a1 continuousReadingController];
          id v7 = [v10 nextReadingListItem];
          -[BrowserController _startLoadDocument:continuousReadingItem:](a1, v6, v7);
        }
      }
    }
  }
}

- (void)_commitToTabDocumentForNextContinuousItem
{
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
    uint64_t v2 = [v4 isNetworkReachable];

    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v5 didOpenReadingListItemWithReachableNetwork:v2 isContinuousTransition:1];

    -[BrowserController _tabDocumentForNextContinuousItem](a1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [a1[11] previewView];
    [v3 setPrefetchingDisabled:0];

    -[BrowserController loadNextContinuousDocumentIfNeeded](a1);
    [a1 setNextContinuousItemDocument:0];
    objc_msgSend(v6, "setWantsReaderWhenActivated:", objc_msgSend(a1, "readerShouldBeShownIfPossible"));
    -[BrowserController _commitToSpeculativeLoadForDocument:](a1, v6);
    [v6 setWantsReaderWhenActivated:0];
  }
}

- (void)_commitToTabDocumentForPreviousContinuousItem
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
    uint64_t v2 = [v3 isNetworkReachable];

    id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v4 didOpenReadingListItemWithReachableNetwork:v2 isContinuousTransition:1];

    id v5 = [a1[11] previousItemPreviewView];
    [v5 setPrefetchingDisabled:0];

    -[BrowserController _loadPreviousContinuousDocumentIfNeeded](a1);
    id v6 = [a1 previousContinuousItemDocument];
    [a1 setPreviousContinuousItemDocument:0];
    objc_msgSend(v6, "setWantsReaderWhenActivated:", objc_msgSend(a1, "readerShouldBeShownIfPossible"));
    -[BrowserController _commitToSpeculativeLoadForDocument:](a1, v6);
    [v6 setWantsReaderWhenActivated:0];
  }
}

- (void)_loadPreviousContinuousDocumentIfNeeded
{
  if (a1)
  {
    uint64_t v2 = [a1 continuousReadingController];
    id v7 = [v2 previousReadingListItem];

    if (v7)
    {
      if (([a1[28] isLoading] & 1) == 0 && (objc_msgSend(a1[28], "didFinishDocumentLoad") & 1) == 0)
      {
        -[BrowserController _preparePreviousContinuousDocumentIfNeeded](a1);
        id v3 = [a1[11] previousItemPreviewView];
        char v4 = [v3 isPrefetchingDisabled];

        if ((v4 & 1) == 0)
        {
          if (([a1[11] isCommittingToContinuousDocument] & 1) != 0
            || ([MEMORY[0x1E4F28F80] processInfo],
                id v5 = objc_claimAutoreleasedReturnValue(),
                char v6 = [v5 isLowPowerModeEnabled],
                v5,
                (v6 & 1) == 0))
          {
            -[BrowserController _startLoadDocument:continuousReadingItem:](a1, a1[28], v7);
          }
        }
      }
    }
  }
}

- (double)_frameForCurrentPageBannerView
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 304) bounds];
  double v3 = v2;
  char v4 = *(void **)(a1 + 280);
  [*(id *)(a1 + 304) bounds];
  objc_msgSend(v4, "sidebarObscuredInsetsForRect:inCoordinateSpace:", *(void *)(a1 + 304));
  double v6 = v5;
  id v7 = [*(id *)(a1 + 88) topBannerView];
  [v7 bounds];
  CGRectGetHeight(v10);
  double v8 = v3 + v6;

  -[BrowserController _verticalOffsetForContinuousReadingBanner](a1);
  return v8;
}

- (void)_preparePreviousContinuousDocumentIfNeeded
{
  if (a1)
  {
    double v2 = [a1 continuousReadingController];
    id v12 = [v2 previousReadingListItem];

    double v3 = v12;
    if (v12 && !a1[28])
    {
      uint64_t v4 = -[BrowserController _cachedDocumentForContinuousReadingItem:](a1, v12);
      id v5 = a1[28];
      a1[28] = (id)v4;

      id v6 = a1[28];
      if (!v6)
      {
        id v7 = [[TabDocument alloc] initForBackgroundLoadingWithBrowserController:a1 relatedWebView:0 webViewToCloneSessionStorageFrom:0];
        id v8 = a1[28];
        a1[28] = v7;

        id v6 = a1[28];
      }
      [v6 beginSuppressingProgressAnimation];
      [a1[28] setAllowsRemoteInspection:0];
      if ([a1 readerShouldBeShownIfPossible]
        && ([a1[28] readerWebView], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        CGRect v10 = [a1[28] readerWebView];
      }
      else
      {
        CGRect v10 = [a1[28] webView];
      }
      [a1[11] didCreateWebViewForPreviousDocument:v10];
      if (([a1[28] suppressWebExtensionEvents] & 1) == 0)
      {
        int v11 = [a1[28] webExtensionsController];
        [v11 didOpenTab:a1[28]];
      }
      double v3 = v12;
    }
  }
}

- (void)markReadingListBookmark:(id)a3 asRead:(BOOL)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v7 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  -[WebBookmarkCollection markReadingListBookmark:asRead:postNotification:](v7, v8, v6, v5);
}

- (void)continuousReadingViewController:(id)a3 scrollViewDidScroll:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [v6 contentOffset];
  double v8 = v7;
  [v10 scrollOffsetYForCurrentDocument];
  if (v8 >= v9) {
    -[BrowserController prefetchNextContinuousItemIfNeeded]((id *)&self->super.super.super.isa);
  }
  else {
    -[BrowserController _loadPreviousContinuousDocumentIfNeeded]((id *)&self->super.super.super.isa);
  }
}

- (void)continuousReadingViewControllerWillCommitToLoadNextItem:(id)a3
{
  -[BrowserController _updateCurrentPageBannerViewBeforeContinuousTransition]((uint64_t)self);
  uint64_t v4 = [(BrowserController *)self tabController];
  BOOL v5 = [v4 activeTabDocument];
  [(BrowserController *)self setCachedDocumentOnContinuousTransition:v5];

  [(TabDocument *)self->_nextContinuousItemDocument estimatedProgress];
  if (v6 == 1.0) {
    [(StatusBarSpinnerController *)self->_spinnerController setEnabled:0];
  }
  -[BrowserController _commitToTabDocumentForNextContinuousItem]((id *)&self->super.super.super.isa);
  spinnerController = self->_spinnerController;
  [(StatusBarSpinnerController *)spinnerController setEnabled:1];
}

- (void)continuousReadingViewControllerCommitToLoadPreviousItem:(id)a3
{
  -[BrowserController _updateCurrentPageBannerViewBeforeContinuousTransition]((uint64_t)self);
  uint64_t v4 = [(BrowserController *)self tabController];
  BOOL v5 = [v4 activeTabDocument];
  [(BrowserController *)self setCachedDocumentOnContinuousTransition:v5];

  -[BrowserController _commitToTabDocumentForPreviousContinuousItem]((id *)&self->super.super.super.isa);
}

- (void)continuousReadingViewController:(id)a3 didCommitToLoadItem:(id)a4
{
  id v6 = a4;
  -[BrowserController _updateCurrentPageBannerView]((id *)&self->super.super.super.isa);
  [(BrowserController *)self setCachedDocumentOnContinuousTransition:0];
  BOOL v5 = [v6 readingListBookmark];
  [(BrowserController *)self markReadingListBookmark:v5 asRead:1 postNotification:1];
}

- (double)continuousReadingViewControllerNextWebViewLandingOffset:(id)a3 includeBottomBar:(BOOL)a4
{
  BOOL v4 = a4;
  [(BrowserController *)self updateDynamicBarGeometry];
  id v6 = -[BrowserController tabContentContainerView]((id *)&self->super.super.super.isa);
  [(BrowserRootViewController *)self->_rootViewController navigationBarFrameInCoordinateSpace:v6];
  double MaxY = CGRectGetMaxY(v18);
  [v6 frame];
  double v8 = MaxY + CGRectGetMinY(v19);
  if (v4)
  {
    [(BrowserRootViewController *)self->_rootViewController bottomToolbarFrameInCoordinateSpace:v6 includeKeyboard:1];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [v6 bounds];
    v22.origin.double x = v10;
    v22.origin.double y = v12;
    v22.size.double width = v14;
    v22.size.double height = v16;
    CGRect v21 = CGRectIntersection(v20, v22);
    double v8 = v8 + v21.size.height;
  }

  return v8;
}

- (void)continuousReadingViewControllerDidObserveScrollToTopTap:(id)a3
{
}

- (void)_automaticPasswordInputViewNotification:(id)a3
{
  id v14 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  BOOL v5 = [v14 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F3B108]];
  double v7 = (void *)[v4 initWithUUIDString:v6];

  double v8 = [v14 userInfo];
  double v9 = objc_msgSend(v8, "safari_numberForKey:", *MEMORY[0x1E4F3B118]);

  if (v9)
  {
    uint64_t v10 = [v9 integerValue];
    if (v10)
    {
      if (v10 != 1) {
        goto LABEL_8;
      }
      double v11 = [(TabController *)self->_tabController activeTabDocument];
      [v11 userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:v7];

      CGFloat v12 = [(TabController *)self->_tabController activeTabDocument];
      [v12 removeAutomaticPasswordButton];
    }
    else
    {
      if (![MEMORY[0x1E4F97EA0] isPasswordsAppInstalled]) {
        goto LABEL_8;
      }
      CGFloat v12 = [(TabController *)self->_tabController tabDocumentWithUUID:v7];
      double v13 = [v12 autoFillController];
      [v13 fillCurrentAutomaticStrongPasswordInCurrentFrameBlurringAfterSubstitution:0 completionHandler:&__block_literal_global_985];
    }
  }
LABEL_8:
}

- (void)_automaticPasswordInputViewAutoFillContextProviderRequiredNotification:(id)a3
{
  id v12 = a3;
  tabController = self->_tabController;
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = [v12 userInfo];
  double v7 = [v6 objectForKey:*MEMORY[0x1E4F3B108]];
  double v8 = (void *)[v5 initWithUUIDString:v7];
  double v9 = [(TabController *)tabController tabDocumentWithUUID:v8];

  uint64_t v10 = [v12 userInfo];
  double v11 = [v10 objectForKey:*MEMORY[0x1E4F3B110]];

  [v11 setAutoFillContextProvider:v9];
}

- (void)policyDidChangeForDigitalHealthManager:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__BrowserController_policyDidChangeForDigitalHealthManager___block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__BrowserController_policyDidChangeForDigitalHealthManager___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 344) allTabDocuments];
  double v3 = *(void **)(a1 + 32);
  id v5 = (id)v2;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  -[BrowserController _updateDigitalHealthOverlayForTabDocuments:](v3, v4);
}

void __64__BrowserController__updateDigitalHealthOverlayForTabDocuments___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) allObjects];
  -[BrowserController _toggleDigitalHealthOverlayGivenOverlayStates:forTabDocuments:](WeakRetained, v2, v3);
}

- (void)_toggleDigitalHealthOverlayGivenOverlayStates:(void *)a3 forTabDocuments:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v16 = v6;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
          double v11 = objc_msgSend(v10, "URL", v16);
          id v12 = objc_msgSend(v11, "safari_canonicalURL");
          double v13 = [v5 objectForKeyedSubscript:v12];
          uint64_t v14 = [v13 integerValue];

          [v10 setPolicy:v14];
          if ((unint64_t)(v14 - 1) >= 5)
          {
            if (!v14 && ([a1 tabDocumentIsBackgroundPreloading:v10] & 1) == 0) {
              -[BrowserController _fullyRemoveDigitalHealthTreatmentForTabDocumentIfNecessary:](a1, v10);
            }
          }
          else
          {
            -[BrowserController _showDigitalHealthOverlayForTabDocument:withPolicy:animated:]((uint64_t)a1, v10, v14, 1);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v15 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v7 = v15;
      }
      while (v15);
    }

    id v6 = v16;
  }
}

- (void)_fullyRemoveDigitalHealthTreatmentForTabDocumentIfNecessary:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[BrowserController _screenTimeOverlayViewControllerForTabDocument:](a1, v3);
    if (-[BrowserController _isTabDocumentFrontMostForDigitalHealth:]((uint64_t)a1, v3))
    {
      [v3 setPolicy:0];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      id v5[2] = __81__BrowserController__fullyRemoveDigitalHealthTreatmentForTabDocumentIfNecessary___block_invoke;
      v5[3] = &unk_1E6D791E8;
      void v5[4] = a1;
      id v6 = v3;
      [v4 hideBlockingViewControllerWithCompletionHandler:v5];
    }
  }
}

void __81__BrowserController__fullyRemoveDigitalHealthTreatmentForTabDocumentIfNecessary___block_invoke(uint64_t a1)
{
}

- (double)_frameForScreenTimeOverlayViewControllerView
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = [a1[35] documentAndTopBarsContainerView];
  [v2 bounds];
  double v4 = v3;
  objc_msgSend(a1[35], "obscuredInsetsForRect:inCoordinateSpace:", v2);
  [a1 _shouldUseNarrowLayout];
  UIEdgeInsetsReplace();
  double v6 = v4 + v5;

  return v6;
}

- (void)tabDocument:(id)a3 didChangePIPState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v10 = v6;
  if (v4) {
    uint64_t v7 = (TabDocument *)v6;
  }
  else {
    uint64_t v7 = 0;
  }
  tabDocumentPlayingPIPVideo = self->_tabDocumentPlayingPIPVideo;
  self->_tabDocumentPlayingPIPVideo = v7;

  uint64_t v9 = +[Application sharedApplication];
  [v9 updateShouldLockPrivateBrowsingWithTimerIfNecessary];
}

- (void)switchToTabWithUUID:(id)a3 inWindowWithUUID:(id)a4 forTabGroupWithUUID:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(BrowserController *)self browserWindowController];
  double v11 = [v10 browserControllerWithUUID:v8];

  if (v11)
  {
    id v12 = [(BrowserController *)v11 tabController];
    double v13 = [v12 tabWithUUID:v24];

    if (v13)
    {
      uint64_t v14 = [(BrowserController *)v11 tabController];
      uint64_t v15 = [v14 currentTabs];
      uint64_t v16 = [v15 indexOfObjectIdenticalTo:v13];

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        int v17 = [(TabController *)self->_tabController activeTabDocument];
        long long v18 = [v13 browserController];
        -[BrowserController _requestActivationOfBrowserController:]((id *)&self->super.super.super.isa, v18);

        long long v19 = [(BrowserController *)v11 tabController];
        [v19 setActiveTab:v13 animated:0];

        [(BrowserController *)v11 dismissTransientUIAnimated:1];
        if ([v17 isBlank]
          && ([(TabController *)self->_tabController currentTabs],
              long long v20 = objc_claimAutoreleasedReturnValue(),
              unint64_t v21 = [v20 count],
              v20,
              v21 >= 2))
        {
          [(TabController *)self->_tabController closeTab:v17 animated:0];
        }
        else if (v11 != self)
        {
          [(BrowserController *)self cancelFavorites];
        }
      }
    }
    else if (v9 {
           && ![(TabController *)self->_tabController switchToTabWithUUID:v24 inTabGroupWithUUID:v9])
    }
    {
      CGRect v22 = [(TabController *)self->_tabController browserControllerContainingLocalTabGroupUUID:v9];

      if (v22)
      {
        -[BrowserController _requestActivationOfBrowserController:]((id *)&self->super.super.super.isa, v22);
        uint64_t v23 = [(BrowserController *)v22 tabController];
        [v23 switchToTabWithUUID:v24 inTabGroupWithUUID:v9];

        double v11 = v22;
        [(BrowserController *)self cancelFavorites];
      }
      else
      {
        double v11 = 0;
      }
    }
  }
}

- (void)_requestActivationOfBrowserController:(id *)a1
{
  double v3 = a2;
  if (a1)
  {
    id v10 = v3;
    BOOL v4 = -[BrowserController _sceneSession](v3);
    double v5 = -[BrowserController _sceneSession](a1);
    if (v5 != v4)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1B80]);
      uint64_t v7 = [v5 scene];
      [v6 setRequestingScene:v7];

      [v6 setPreserveLayout:1];
      id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v8 requestSceneSessionActivation:v4 userActivity:0 options:v6 errorHandler:&__block_literal_global_989];
    }
    -[UIResponder safari_becomeFirstResponderIfNeeded]((uint64_t)v10);
    id WeakRetained = objc_loadWeakRetained(v10 + 48);
    [WeakRetained browserControllerMakeKey:v10];

    double v3 = v10;
  }
}

void __59__BrowserController__requestActivationOfBrowserController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = (id)WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __51__BrowserController_tabDocumentShouldBecomeActive___block_invoke_cold_1();
  }
}

- (void)screenTimeOverlayViewController:(id)a3 didFinishDismissingBlockingViewController:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(TabController *)self->_tabController allTabDocuments];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 shouldObscureForDigitalHealth])
        {
          id v11 = [v10 associatedBlockingViewController];
          BOOL v12 = v11 == v5;

          if (v12) {
            -[BrowserController _fullyRemoveDigitalHealthTreatmentForTabDocumentIfNecessary:]((id *)&self->super.super.super.isa, v10);
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (uint64_t)handleOpenURLContextsForReadingListWidget:(void *)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1 && [v3 count] == 1)
  {
    id v5 = [v4 anyObject];
    id v6 = [v5 URL];

    uint64_t v7 = objc_msgSend(v6, "safari_isReadingListURL");
    if (v7)
    {
      uint64_t v8 = objc_msgSend(v6, "safari_readingListItemUUIDString");
      if (v8)
      {
        [a1 openBookmarkWithUUIDString:v8];
      }
      else
      {
        id v9 = [a1 currentBookmarksCollection];
        char v10 = [v9 isEqualToString:@"ReadingListCollection"];

        if ((v10 & 1) == 0) {
          -[BrowserController _switchToCollectionOrToggleSidebar:]((id *)a1, @"ReadingListCollection");
        }
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void __56__BrowserController_scene_willConnectToSession_options___block_invoke_996(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
  if ([v1 isBlank])
  {
    id v2 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)id v3 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LaunchToFirstLoad", "beganLoad=NO enableTelemetry=YES ", v3, 2u);
    }
  }
  else
  {
    [v1 setNeedsSendTelemetryForProvisionalLoad];
  }
}

void __56__BrowserController_scene_willConnectToSession_options___block_invoke_997(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F98AB8]);
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 856);
  *(void *)(v3 + 856) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 856), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 856) startObserving];
  id v24 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
  id v5 = [*(id *)(a1 + 32) unifiedField];
  int v6 = [v5 isFirstResponder];
  uint64_t v7 = *(unsigned char **)(a1 + 32);
  if (v6)
  {
    v7[577] = 1;
  }
  else
  {
    uint64_t v8 = [v7 viewControllerToPresentFrom];
    id v9 = [v8 presentedViewController];
    *(unsigned char *)(*(void *)(a1 + 32) + 577) = v9 != 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 578) = 1;
  [*(id *)(*(void *)(a1 + 32) + 344) makeActiveTabDocumentActive];
  *(unsigned char *)(*(void *)(a1 + 32) + 578) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 577) = 0;
  -[BrowserController setWebViewFromTabDocument:](*(void **)(a1 + 32), v24);
  *(unsigned char *)(*(void *)(a1 + 32) + 716) = 0;
  char v10 = [v24 webExtensionsController];
  [v10 didOpenWindow:*(void *)(*(void *)(a1 + 32) + 504)];
  int v11 = [*(id *)(a1 + 32) isPrivateBrowsingAvailable];
  BOOL v12 = *(unsigned char **)(a1 + 32);
  if (v11 && !v12[520])
  {
    long long v13 = +[Application sharedApplication];
    long long v14 = [v13 defaultWebExtensionsController];
    [v14 didOpenWindow:*(void *)(*(void *)(a1 + 32) + 512)];

    *(unsigned char *)(*(void *)(a1 + 32) + 520) = 1;
    BOOL v12 = *(unsigned char **)(a1 + 32);
  }
  long long v15 = [v12 activeWebExtensionWindow];
  [v10 didActivateWindow:v15];

  long long v16 = [v10 tabIDToTabPositionForTabsInTransit];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F98FC0];
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObject:v24];
    long long v20 = [v18 tabIDToTabPositionDictionaryForTabs:v19];
    [v10 fireAppropriateTabMovementEventForTabState:v20];
  }
  [v10 findExtensions];
  -[BrowserController _updateTabGroupBanner](*(id **)(a1 + 32));
  [*(id *)(a1 + 32) updateCollaborationButton];
  if ([*(id *)(a1 + 32) isPrivateBrowsingEnabled]) {
    -[BrowserController _showPrivateBrowsingExplanationSheetIfNecessary](*(id *)(a1 + 32));
  }
  unint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 280) view];
  CGRect v22 = [*(id *)(a1 + 40) persistentIdentifier];
  objc_msgSend(v21, "safari_annotateWithWindowEntityIdentifier:", v22);

  uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 280) tabSwitcherViewController];
  [v23 didCompleteLaunch];
}

- (void)activateWebClipWithID:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1F10], "_sf_webClipWithUUID:", a3);
  if (v4)
  {
    id v7 = v4;
    id v5 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
    int v6 = [v5 navigationIntentWithWebClip:v7];

    [(BrowserController *)self handleNavigationIntent:v6 completion:0];
    BOOL v4 = v7;
  }
}

- (void)_enterYttriumStateTimerFired
{
  uint64_t v3 = [(TabController *)self->_tabController activeTabDocument];
  webClipIDPendingYttriumState = self->_webClipIDPendingYttriumState;
  id v8 = v3;
  id v5 = [v3 webClipID];
  LODWORD(webClipIDPendingYttriumState) = [(NSUUID *)webClipIDPendingYttriumState isEqual:v5];

  if (!webClipIDPendingYttriumState) {
    goto LABEL_5;
  }
  if ([v8 isLoadingComplete] && objc_msgSend(v8, "inWebClipScope"))
  {
    [(BrowserRootViewController *)self->_rootViewController setInYttriumState:1];
LABEL_5:
    int v6 = self->_webClipIDPendingYttriumState;
    self->_webClipIDPendingYttriumState = 0;

    [(NSTimer *)self->_enterYttriumStateTimer invalidate];
    enterYttriumStateTimer = self->_enterYttriumStateTimer;
    self->_enterYttriumStateTimer = 0;
  }
}

- (void)webClipCacheDidChange
{
  id v2 = [(TabController *)self->_tabController activeTabDocument];
  [v2 validateWebClip];
}

- (void)windowScene:(id)a3 userDidAcceptCloudKitShareWithMetadata:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  objc_msgSend(v6, "safari_setOriginatingWindowScene:", v10);
  id v7 = [(BrowserController *)self tabGroupManager];
  [v7 acceptTabGroupShareWithMetadata:v6 handler:self];

  id v8 = [(BrowserController *)self tabController];
  id v9 = [v6 share];
  [v8 attemptToSelectTabGroupFromShare:v9];
}

- (void)tabGroupManager:(id)a3 didBeginAcceptingTabGroupShareWithMetadata:(id)a4
{
}

- (void)_postUserDidAcceptCloudKitShareActivityNoticeWithMetadata:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v23 = a2;
  if (a1)
  {
    uint64_t v22 = a1;
    [*(id *)(a1 + 344) allTabGroups];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v25 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v7 isShared])
          {
            id v8 = [v23 share];
            id v9 = [v8 recordID];
            id v10 = [v9 recordName];
            int v11 = [v7 bookmark];
            BOOL v12 = [v11 serverID];
            char v13 = WBSIsEqual();

            if (v13)
            {
              uint64_t v17 = v3;
              goto LABEL_13;
            }
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    id v14 = objc_alloc(MEMORY[0x1E4F782A0]);
    long long v15 = [v23 share];
    long long v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
    uint64_t v17 = (void *)[v14 initWithTitleText:v16];

    uint64_t v18 = NSString;
    long long v19 = _WBSLocalizedString();
    long long v20 = [v18 stringWithFormat:v19];
    [v17 setMessageText:v20];

    unint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F78478]) initWithContentViewController:v17];
    [v21 setDelegate:v22];
    -[BrowserController _presentToastViewControllerQueuingIfNecessary:](v22, v21);

LABEL_13:
  }
}

- (void)tabGroupManager:(id)a3 didFinishAcceptingTabGroupShareWithMetadata:(id)a4 result:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  switch(a5)
  {
    case 3:
      -[BrowserController _presentSharedTabGroupsUnsupportedError](self);
      break;
    case 2:
      id v9 = [(BrowserController *)self tabGroupManager];
      id v10 = [v8 share];
      int v11 = [v9 tabGroupMatchingShare:v10];

      tabController = self->_tabController;
      char v13 = [v11 uuid];
      [(TabController *)tabController displayAlreadyAcceptedSharedTabGroupWithUUID:v13];

      break;
    case 1:
      -[BrowserController _presentSharedTabGroupsPendingAcceptanceError](self);
      break;
  }
}

- (void)_presentSharedTabGroupsPendingAcceptanceError
{
  if (a1)
  {
    _WBSLocalizedString();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    -[BrowserController _presentSharedTabGroupErrorWithTitle:message:](a1, v2, 0);
  }
}

- (void)_presentSharedTabGroupsUnsupportedError
{
  if (a1)
  {
    _WBSLocalizedString();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    -[BrowserController _presentSharedTabGroupErrorWithTitle:message:](a1, v2, 0);
  }
}

- (void)_presentSharedTabGroupErrorWithTitle:(void *)a3 message:
{
  id v11 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v11 message:v5 preferredStyle:1];
    id v7 = (void *)MEMORY[0x1E4FB1410];
    id v8 = _WBSLocalizedString();
    id v9 = [v7 actionWithTitle:v8 style:1 handler:&__block_literal_global_1005];
    [v6 addAction:v9];

    id v10 = [a1 viewControllerToPresentFrom];
    [v10 presentViewController:v6 animated:1 completion:0];
  }
}

- (void)tabGroupManager:(id)a3 selectProfileIdentifierForShareMetadata:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_msgSend(v7, "safari_originatingWindowScene");
  id v10 = [v7 share];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];

  BOOL v12 = (void *)MEMORY[0x1E4F781A0];
  char v13 = [(BrowserController *)self tabGroupManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__BrowserController_tabGroupManager_selectProfileIdentifierForShareMetadata_completionHandler___block_invoke;
  v15[3] = &unk_1E6D79E78;
  id v14 = v8;
  id v16 = v14;
  [v12 presentDialogInScene:v9 forSharedTabGroupWithTitle:v11 tabGroupManager:v13 completionHandler:v15];
}

uint64_t __95__BrowserController_tabGroupManager_selectProfileIdentifierForShareMetadata_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sceneDidDisconnect:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB60C8] sharedProxy];
  [v4 removeSyncObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserController:self didDisconnectFromScene:v14];

  [v14 setDelegate:0];
  id v6 = [v14 screenshotService];
  [v6 setDelegate:0];

  objc_storeWeak((id *)&self->_scene, 0);
  digitalHealthManager = self->_digitalHealthManager;
  self->_digitalHealthManager = 0;

  id v8 = +[Application sharedApplication];
  [v8 updateShouldLockPrivateBrowsingWithTimerIfNecessary];

  id v9 = +[Application sharedApplication];
  id v10 = [v9 proxy];
  id v11 = [v10 currentScene];
  BOOL v12 = [v11 delegate];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v13 = v12;
  }
  else {
    char v13 = 0;
  }
  setPrimaryWindowEntityFromBrowserController(v13);
}

- (void)sceneWillResignActive:(id)a3
{
  self->_suspendedOrSuspending = 1;
  [(BrowserController *)self willResignActive];
}

- (void)sceneDidEnterBackground:(id)a3
{
  [(BrowserController *)self didEnterBackground];
  if ([(BrowserController *)self isPrivateBrowsingEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
    [WeakRetained browserControllerWillBeginObfuscating:self];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5 = a4;
  id v6 = self;
  id v10 = v6;
  id v7 = v5;
  id v11 = v7;
  if (v6->_suspendedOrSuspending)
  {
    id v8 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3321888768;
    id v14 = ___ZZ43__BrowserController_scene_openURLContexts__ENK3__2cvU13block_pointerFvvEEv_block_invoke;
    long long v15 = &__block_descriptor_48_ea8_32c56_ZTSKZ43__BrowserController_scene_openURLContexts__E3__2_e5_v8__0l;
    id v16 = v6;
    id v17 = v7;
    id v9 = (void *)MEMORY[0x1E4E42950](&v12);

    objc_msgSend(v8, "performWithoutAnimation:", v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    -[BrowserController scene:openURLContexts:]::$_2::operator()((id *)&v10);
  }
}

- (void)scene:openURLContexts:
{
  if ((-[BrowserController handleOpenURLContextsForReadingListWidget:](*a1, a1[1]) & 1) == 0)
  {
    id v27 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
    id v2 = [a1[1] allObjects];
    id v3 = [v27 navigationIntentWithOpenURLContexts:v2];

    if ([v3 type] == 9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)*a1 + 91);
      id v5 = [WeakRetained perSitePreferencesVendor];
      id v6 = [v5 profilePreferenceManager];

      id v7 = [v3 URL];
      id v8 = objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
      id v9 = [v6 identifierForProfilePreferenceForDomain:v8];

      id v10 = *a1;
      if (v9)
      {
        [v10 setActiveProfileIdentifier:v9];
      }
      else
      {
        id v11 = [v10 tabController];
        [v11 updateFocusProfileEnteringForeground];
      }
    }
    uint64_t v12 = (void *)*((void *)*a1 + 43);
    uint64_t v13 = [v3 URL];
    id v14 = [v12 tabForURL:v13];

    if (v14) {
      int v15 = 1;
    }
    else {
      int v15 = [*a1 shouldStayInFocusedTabGroupForExternalLinks];
    }
    if ([v3 type] != 9
      || ([v3 externalURLSourceApplicationIsSpotlight] | v15 ^ 1) == 1)
    {
      [*((id *)*a1 + 43) switchOutOfSyncedTabGroup];
    }
    id v16 = +[Application sharedApplication];
    id v17 = [v16 defaultWebExtensionsController];

    uint64_t v18 = [v3 URL];
    long long v19 = objc_msgSend(v18, "safari_composedIdentifierAndProfileIdentifierInSafariWebExtensionURL");

    long long v20 = [v19 second];
    if ([v20 length])
    {
      int v21 = *((unsigned __int8 *)*a1 + 719);
      [*((id *)*a1 + 43) setActiveProfileIdentifier:v20];
      if (v21
        && [*a1 isInDefaultProfile]
        && ([v19 first],
            uint64_t v22 = objc_claimAutoreleasedReturnValue(),
            [v17 webExtensionForComposedIdentifier:v22],
            id v23 = objc_claimAutoreleasedReturnValue(),
            int v24 = [v23 allowedInPrivateBrowsing],
            v23,
            v22,
            v24))
      {
        [*((id *)*a1 + 43) selectPrivateTabGroup];
      }
      else
      {
        [*((id *)*a1 + 43) selectLocalTabGroup];
      }
    }
    int v25 = [v27 prefersOpenInNewWindow];
    id v26 = *a1;
    if (v25) {
      [v26 dispatchNavigationIntent:v3];
    }
    else {
      [v26 handleNavigationIntent:v3 completion:0];
    }
  }
}

- (BOOL)shouldStayInFocusedTabGroupForExternalLinks
{
  id v3 = +[Application sharedApplication];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int v5 = [v4 BOOLForKey:*MEMORY[0x1E4F98130]];

  if ([v3 needsFocusedTabGroupUpdate])
  {
    if (v5)
    {
      [(TabController *)self->_tabController updateFocusedTabGroupEnteringForeground];
    }
    else
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXSiriLink();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Overriding Focus to open external links in default tab group", v12, 2u);
      }
      [v3 setNeedsFocusedTabGroupUpdate:0];
    }
  }
  id v7 = [(TabController *)self->_tabController activeTabGroup];
  id v8 = [v7 uuid];
  id v9 = [v3 focusedTabGroupUUIDString];
  char v10 = [v8 isEqualToString:v9];

  return v5 & v10;
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = self;
  id v9 = v7;
  char v10 = (void (**)(void, void))MEMORY[0x1E4E42950](a5);
  if (v8->_suspendedOrSuspending)
  {
    id v11 = (void *)MEMORY[0x1E4FB1EB0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3321888768;
    v16[2] = ___ZZ80__BrowserController_windowScene_performActionForShortcutItem_completionHandler__ENK3__3cvU13block_pointerFvvEEv_block_invoke;
    v16[3] = &__block_descriptor_56_ea8_32c93_ZTSKZ80__BrowserController_windowScene_performActionForShortcutItem_completionHandler__E3__3_e5_v8__0l;
    id v17 = v8;
    id v18 = v9;
    id v19 = (id)MEMORY[0x1E4E42950](v10);
    uint64_t v12 = (void *)MEMORY[0x1E4E42950](v16);

    objc_msgSend(v11, "performWithoutAnimation:", v12, v8);
  }
  else
  {
    shortcutController = v8->_shortcutController;
    id v14 = objc_msgSend(v9, "type", v8);
    uint64_t v15 = [(ApplicationShortcutController *)shortcutController handleShortcutItemWithType:v14];

    v10[2](v10, v15);
  }
}

- (id)windowScene:(id *)a1 performActionForShortcutItem:completionHandler:
{
  return a1;
}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = WBS_LOG_CHANNEL_PREFIXPrinting();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "User took a screenshot, will attempt to generate a PDF representation", buf, 2u);
  }
  id v7 = [(BrowserController *)self tabController];
  id v8 = [v7 activeTabDocument];

  if ([v8 isBlank]) {
    goto LABEL_9;
  }
  id v9 = [(BrowserController *)self viewControllerToPresentFrom];
  char v10 = [v9 presentedViewController];
  if (v10) {
    goto LABEL_8;
  }
  char v10 = [v8 dialogController];
  id v11 = [v10 presentedDialog];
  if (v11 || ([v8 shouldObscureForDigitalHealth] & 1) != 0)
  {

LABEL_8:
LABEL_9:
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:
      (*((void (**)(id, void, void, double, double, double, double))v5 + 2))(v5, 0, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      goto LABEL_13;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v13 = "Not returning a webpage PDF representation because Safari isn't showing a webpage right now";
LABEL_11:
    _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    goto LABEL_12;
  }
  id v14 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  uint64_t v15 = [v14 presentationState];

  if (v15) {
    goto LABEL_9;
  }
  if (-[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self))
  {
    uint64_t v12 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v13 = "Not returning a webpage PDF representation because Private Browsing is locked";
    goto LABEL_11;
  }
  if (self->_blockRequestingScreenshotPDFData)
  {
    id v16 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_INFO, "There's an existing pending screenshot PDF request; will use the in-progress PDF generation for the original and new requests",
        buf,
        2u);
    }
    id v17 = (void *)MEMORY[0x1E4E42950](self->_blockRequestingScreenshotPDFData);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __79__BrowserController_screenshotService_generatePDFRepresentationWithCompletion___block_invoke;
    v25[3] = &unk_1E6D79EA0;
    id v26 = v17;
    id v27 = v5;
    id v18 = v17;
    id v19 = (void *)MEMORY[0x1E4E42950](v25);
    id blockRequestingScreenshotPDFData = self->_blockRequestingScreenshotPDFData;
    self->_id blockRequestingScreenshotPDFData = v19;
  }
  else
  {
    int v21 = (void *)MEMORY[0x1E4E42950](v5);
    id v22 = self->_blockRequestingScreenshotPDFData;
    self->_id blockRequestingScreenshotPDFData = v21;

    if ([v8 isLoading])
    {
      id v23 = WBS_LOG_CHANNEL_PREFIXPrinting();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1E102C000, v23, OS_LOG_TYPE_DEFAULT, "User took a screenshot while the page was loading; will process request when pageload finishes",
          buf,
          2u);
      }
    }
    else
    {
      int v24 = WBS_LOG_CHANNEL_PREFIXPrinting();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_DEFAULT, "User took a screenshot and the page is done loading; generating a PDF now",
          buf,
          2u);
      }
      -[BrowserController _sendPDFRepresentationForScreenshotWithTabDocument:](self, v8);
    }
  }
LABEL_13:
}

void __79__BrowserController_screenshotService_generatePDFRepresentationWithCompletion___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(a3, a4, a5, a6);
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(a3, a4, a5, a6);
}

void __72__BrowserController__sendPDFRepresentationForScreenshotWithTabDocument___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained && WeakRetained[6])
  {
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = [v3 length];
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Got PDF data from WebKit of length %zu; calling completionHandler",
        (uint8_t *)&v9,
        0xCu);
    }

    (*(void (**)(double, double, double, double))(v5[6] + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    id v7 = (void *)v5[6];
    void v5[6] = 0;
  }
  else
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXPrinting();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = (uint64_t)v5;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Finished generating PDF but pending request block has been cleared on %{public}@; not calling completionHandler",
        (uint8_t *)&v9,
        0xCu);
    }
  }
}

- (void)openDownload:(id)a3
{
  id v6 = a3;
  if ([v6 fileType] == 2)
  {
    -[BrowserController _openDownload:]((uint64_t)self, v6);
  }
  else
  {
    uint64_t v4 = [(BrowserController *)self tabController];
    id v5 = [v4 activeTabDocument];
    [v5 showDownload:v6];
  }
}

- (void)_openDownload:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 completedFileURL];
    id v6 = [v4 uti];
    if (_SFTypeIsExtractableArchive())
    {
      int v7 = [v4 canReveal];

      if (v7)
      {
        id v8 = [MEMORY[0x1E4F97E48] sharedLogger];
        int v9 = [v4 mimeType];
        uint64_t v10 = [v4 uti];
        [v8 didRevealDownloadWithMIMEType:v9 uti:v10 result:1];

        [v4 reveal];
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35__BrowserController__openDownload___block_invoke;
    void v11[3] = &unk_1E6D79970;
    id v12 = v4;
    id v13 = v5;
    uint64_t v14 = a1;
    objc_msgSend(v13, "safari_accessingSecurityScopedResource:", v11);

    goto LABEL_7;
  }
LABEL_8:
}

void __35__BrowserController__openDownload___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) dataOwner] == 2;
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__BrowserController__openDownload___block_invoke_2;
  v7[3] = &unk_1E6D79F18;
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  BOOL v11 = v2;
  objc_msgSend(v3, "_sf_tryOpeningURLInDefaultApp:isContentManaged:completionHandler:", v4, v2, v7);
}

void __35__BrowserController__openDownload___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v7 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v3 = [*(id *)(a1 + 32) mimeType];
    uint64_t v4 = [*(id *)(a1 + 32) uti];
    [v7 didRevealDownloadWithMIMEType:v3 uti:v4 result:2];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__BrowserController__openDownload___block_invoke_3;
    block[3] = &unk_1E6D79EF0;
    id v9 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    id v10 = v5;
    uint64_t v11 = v6;
    char v12 = *(unsigned char *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __35__BrowserController__openDownload___block_invoke_3(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __35__BrowserController__openDownload___block_invoke_4;
  v5[3] = &unk_1E6D79EF0;
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 56);
  objc_msgSend(v2, "safari_accessingSecurityScopedResource:", v5);
}

void __35__BrowserController__openDownload___block_invoke_4(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x1E4F97E48] sharedLogger];
  id v3 = [*(id *)(a1 + 32) mimeType];
  uint64_t v4 = [*(id *)(a1 + 32) uti];
  [v2 didRevealDownloadWithMIMEType:v3 uti:v4 result:3];

  id v6 = *(void **)(a1 + 32);
  id v5 = *(id **)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 56);
  -[BrowserController _previewDownloadInQuickLook:url:isContentManaged:](v5, v6, v7, v8);
}

- (void)_previewDownloadInQuickLook:(void *)a3 url:(uint64_t)a4 isContentManaged:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 48);
    if (objc_opt_respondsToSelector())
    {
      [WeakRetained browserController:a1 overrideDownloadQuickLookPreview:v8 isContentManaged:a4];
    }
    else
    {
      objc_storeStrong(a1 + 27, a2);
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x2050000000;
      uint64_t v11 = (void *)getQLPreviewControllerClass(void)::softClass;
      uint64_t v20 = getQLPreviewControllerClass(void)::softClass;
      if (!getQLPreviewControllerClass(void)::softClass)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = ___ZL27getQLPreviewControllerClassv_block_invoke;
        v16[3] = &unk_1E6D79088;
        void v16[4] = &v17;
        ___ZL27getQLPreviewControllerClassv_block_invoke((uint64_t)v16);
        uint64_t v11 = (void *)v18[3];
      }
      char v12 = v11;
      _Block_object_dispose(&v17, 8);
      id v13 = [v12 alloc];
      v21[0] = v9;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      uint64_t v15 = (void *)[v13 initWithPreviewItems:v14];

      [v15 setDelegate:a1];
      [v15 setModalPresentationStyle:0];
      [v15 setIsContentManaged:a4];
      -[BrowserController _presentModalViewController:](a1, v15);
    }
  }
}

- (void)previewControllerDidDismiss:(id)a3
{
  previewedDownload = self->_previewedDownload;
  self->_previewedDownload = 0;
}

- (BOOL)previewController:(id)a3 shouldOpenURL:(id)a4 forPreviewItem:(id)a5
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__BrowserController_previewController_shouldOpenURL_forPreviewItem___block_invoke;
  v9[3] = &unk_1E6D791E8;
  void v9[4] = self;
  id v10 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  return 0;
}

void __68__BrowserController_previewController_shouldOpenURL_forPreviewItem___block_invoke(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) viewControllerToPresentFrom];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __68__BrowserController_previewController_shouldOpenURL_forPreviewItem___block_invoke_2;
  v5[3] = &unk_1E6D791E8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 dismissViewControllerAnimated:1 completion:v5];
}

void __68__BrowserController_previewController_shouldOpenURL_forPreviewItem___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "safari_originalDataAsString");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v2 = [MEMORY[0x1E4F78598] builder];
  id v3 = [*(id *)(a1 + 40) tabController];
  uint64_t v4 = [v3 activeTabDocument];
  objc_msgSend(v2, "setPrefersOpenInNewTab:", objc_msgSend(v4, "isBlank") ^ 1);

  [v2 setPreferredTabOrder:1];
  id v5 = *(void **)(a1 + 40);
  id v6 = [v2 navigationIntentWithText:v7];
  [v5 dispatchNavigationIntent:v6];
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadsViewController);
  id v6 = [WeakRetained quickLookTransitionViewForDownload:self->_previewedDownload];

  return v6;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 1;
}

- (BOOL)activityViewControllerSupportsDownloads:(id)a3
{
  return 1;
}

- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  saveToFilesOperation = self->_saveToFilesOperation;
  self->_saveToFilesOperation = 0;
}

- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4
{
  id v6 = a4;
  id v5 = [(BrowserController *)self viewControllerToPresentFrom];
  [v5 presentViewController:v6 animated:1 completion:0];
}

- (BOOL)saveToFilesOperationSupportsDownloads:(id)a3
{
  return 1;
}

- (void)beginIgnoringUserInteraction:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    char v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Begin ignoring interaction for <BrowserController: %p>: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v6 = [(NSMutableSet *)self->_reasonsForIgnoringUserInteraction count];
  reasonsForIgnoringUserInteraction = self->_reasonsForIgnoringUserInteraction;
  if (reasonsForIgnoringUserInteraction)
  {
    [(NSMutableSet *)reasonsForIgnoringUserInteraction addObject:v4];
  }
  else
  {
    id v8 = [MEMORY[0x1E4F1CA80] setWithObject:v4];
    id v9 = self->_reasonsForIgnoringUserInteraction;
    self->_reasonsForIgnoringUserInteraction = v8;
  }
  if (!v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
    [WeakRetained browserControllerDidBeginIgnoringUserInteraction:self];
  }
}

- (void)endIgnoringUserInteraction:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "End ignoring interaction for <BrowserController: %p>: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(NSMutableSet *)self->_reasonsForIgnoringUserInteraction removeObject:v4];
  if (![(NSMutableSet *)self->_reasonsForIgnoringUserInteraction count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
    [WeakRetained browserControllerDidEndIgnoringUserInteraction:self];
  }
}

- (void)editBookmark:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F3B080]);
  id v5 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  uint64_t v6 = (void *)[v4 initWithBookmark:v10 inCollection:v5];

  [v6 setSyntheticBookmarkProvider:self->_tabController];
  if ([v6 prepareForPresentationForAddingBookmark:0])
  {
    [v6 setBookmarkNavDelegate:self];
    -[BrowserController _presentModalViewController:]((id *)&self->super.super.super.isa, v6);
  }
  else
  {
    int v7 = (void *)MEMORY[0x1E4F781E8];
    id v8 = [(BrowserController *)self viewControllerToPresentFrom];
    [v7 showLockedDatabaseAlertForAction:0 fromViewController:v8];

    __int16 v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v9 didPreventBookmarkActionWithBookmarkType:1 actionType:2];
  }
}

- (BOOL)getContextForCurrentPageWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self->_tabController activeTabDocument];
  uint64_t v6 = [v5 contextController];
  int v7 = [v5 URL];
  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8) {
    [v6 cachedResponseForURL:v7 completionHandler:v4];
  }

  return v9;
}

- (void)presentPrivacyReport
{
  if (([MEMORY[0x1E4F3AE70] trackingPreventionEnabled] & 1) != 0
    || (v12[0] = MEMORY[0x1E4F143A8],
        v12[1] = 3221225472,
        v12[2] = __41__BrowserController_presentPrivacyReport__block_invoke,
        v12[3] = &unk_1E6D793E8,
        void v12[4] = self,
        [MEMORY[0x1E4F3AE98] onboardingViewControllerWithCompletionHandler:v12],
        (id v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = [(TabController *)self->_tabController activeTabDocument];
    id v5 = objc_alloc(MEMORY[0x1E4F3AEA0]);
    char v6 = [v3 isBlank];
    if (v6)
    {
      int v7 = 0;
    }
    else
    {
      int v7 = [v3 webView];
    }
    id v4 = (void *)[v5 initWithWebView:v7];
    if ((v6 & 1) == 0) {

    }
    objc_msgSend(v4, "setWebsiteDetailShouldSeparateBlockedTrackers:", objc_msgSend(v3, "privacyReportShouldSeparateBlockedTrackers"));
    BOOL v8 = [(WBTabGroupManager *)self->_tabGroupManager allProfileIdentifiers];
    [v4 setProfileIdentifiers:v8];

    BOOL v9 = +[Application sharedApplication];
    id v10 = [v9 historiesForProfiles];
    [v4 setHistories:v10];

    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
    [v11 setModalPresentationStyle:1];
    -[BrowserController _presentModalViewController:]((id *)&self->super.super.super.isa, v11);
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
    [v4 setModalPresentationStyle:2];
    -[BrowserController _presentModalViewController:]((id *)&self->super.super.super.isa, v4);
  }
}

void __41__BrowserController_presentPrivacyReport__block_invoke(uint64_t a1, int a2)
{
  id v5 = [*(id *)(a1 + 32) viewControllerToPresentFrom];
  [v5 dismissViewControllerAnimated:1 completion:0];

  if (a2)
  {
    -[BrowserController _catalogViewController](*(id **)(a1 + 32));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v6 startPageController];
    [v4 updatePrivacyReportIfEnabled];
  }
}

- (void)presentBookmarkPickerWithImportHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __60__BrowserController_presentBookmarkPickerWithImportHandler___block_invoke;
  v6[3] = &unk_1E6D79F40;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  -[BrowserController _setPresentingModalBookmarksController:exclusively:importHandler:withCollection:bookmarkUUIDString:animated:completion:]((id *)&self->super.super.super.isa, 1, 0, v6, @"BookmarksCollection", 0, 1, 0);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__BrowserController_presentBookmarkPickerWithImportHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [WeakRetained bookmarksNavigationControllerDidPressDoneButton:0];
  }
}

- (void)presentCloudTabsPickerWithPrimaryDeviceUUID:(id)a3
{
  id v9 = a3;
  id v4 = [CloudTabsViewController alloc];
  id v5 = [(BrowserController *)self cloudTabStore];
  id v6 = [(BrowserController *)self activeProfileIdentifier];
  id v7 = [(CloudTabsViewController *)v4 initWithDeviceProvider:v5 primaryDeviceUUID:v9 profileIdentifier:v6];

  [(CloudTabsViewController *)v7 setDelegate:self];
  [(CloudTabsViewController *)v7 setLinkPreviewProvider:self];
  [(CloudTabsViewController *)v7 setNavigationIntentHandler:self];
  [(CloudTabsViewController *)v7 setTabGroupProvider:self->_tabController];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v7];
  [v8 setModalPresentationStyle:2];
  -[BrowserController _presentModalViewController:]((id *)&self->super.super.super.isa, v8);
}

- (void)toggleShowWebpageStatusBar
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  uint64_t v4 = *MEMORY[0x1E4F78758];
  id v8 = v3;
  int v5 = [v3 BOOLForKey:*MEMORY[0x1E4F78758]];
  char v6 = v5;
  [v8 setBool:v5 ^ 1u forKey:v4];
  if ((v6 & 1) == 0)
  {
    [(BrowserRootViewController *)self->_rootViewController updateUsesWebpageStatusBar];
    id v7 = [(BrowserRootViewController *)self->_rootViewController statusBarView];
    [v7 displayStatusBarIsEnabledMessage];
  }
}

- (BOOL)tabItem:(id)a3 matchesSearchText:(id)a4
{
  return [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabItem:a3 matchesSearchText:a4];
}

- (BOOL)cloudTabsViewController:(id)a3 tabItem:(id)a4 matchesSearchText:(id)a5
{
  return [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabItem:a4 matchesSearchText:a5];
}

- (BOOL)catalogPopoverIsShowing
{
  BOOL v2 = -[BrowserController _catalogViewController]((id *)&self->super.super.super.isa);
  char v3 = [v2 popoverIsShowing];

  return v3;
}

- (CGRect)webExtensionWindowGeometry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiDelegate);
  [WeakRetained browserControllerWindowFrame:self];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGSize)webExtensionTabSize
{
  char v3 = -[BrowserController tabContentContainerView]((id *)&self->super.super.super.isa);
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[BrowserRootViewController contentContainerViewFrameForBrowserSize:](self->_rootViewController, "contentContainerViewFrameForBrowserSize:", v5, v7);
  double v9 = v8;
  double v11 = v10;
  result.double height = v11;
  result.double width = v9;
  return result;
}

- (BOOL)activeWebExtensionWindowIsFocused
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if ([WeakRetained activationState]) {
    char v3 = 0;
  }
  else {
    char v3 = [WeakRetained _isKeyWindowScene];
  }

  return v3;
}

- (NSArray)webExtensionWindows
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if ([(BrowserController *)self isPrivateBrowsingAvailable])
  {
    privateExtensionWindow = self->_privateExtensionWindow;
    v7[0] = self->_normalExtensionWindow;
    v7[1] = privateExtensionWindow;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  }
  else
  {
    normalExtensionWindow = self->_normalExtensionWindow;
    double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&normalExtensionWindow count:1];
  }
  return (NSArray *)v4;
}

- (NSArray)tabDocumentsForActiveTabThatCanReceiveMessages
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [(TabController *)self->_tabController activeTabDocument];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_previewDocument);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_previousContinuousItemDocument);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_nextContinuousItemDocument);
  return (NSArray *)v3;
}

- (id)webExtensionWindowWithID:(double)a3
{
  p_normalExtensionWindow = &self->_normalExtensionWindow;
  [(WebExtensionWindow *)self->_normalExtensionWindow idForWebExtensions];
  if (v6 == a3
    || [(BrowserController *)self isPrivateBrowsingAvailable]
    && (p_normalExtensionWindow = &self->_privateExtensionWindow,
        [(WebExtensionWindow *)self->_privateExtensionWindow idForWebExtensions],
        v8 == a3))
  {
    double v7 = *p_normalExtensionWindow;
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (id)webExtensionWindowForTab:(id)a3
{
  id v4 = a3;
  if (([v4 isPrivateBrowsingEnabled] & 1) == 0)
  {
    double v5 = &OBJC_IVAR___BrowserController__normalExtensionWindow;
    goto LABEL_5;
  }
  if ([(BrowserController *)self isPrivateBrowsingAvailable])
  {
    double v5 = &OBJC_IVAR___BrowserController__privateExtensionWindow;
LABEL_5:
    id v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)validateExtensionToolbarItemsInWindow:(id)a3
{
  id v6 = a3;
  int v4 = [v6 isPrivateWindow];
  if (v4 == [(BrowserController *)self isPrivateBrowsingEnabled])
  {
    double v5 = [(TabController *)self->_tabController activeTabDocument];
    [v5 validateExtensionToolbarItems];

    -[BrowserController _updateButtonsAnimatingTabBar:]((uint64_t)self, 1);
  }
}

- (void)overlayDidHide:(id)a3
{
  -[BrowserController _visibleAppBanner]((uint64_t)self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setInitiallyBehindNavigationBar:1];
  -[BrowserController _setShowingAppBanner:isShowing:]((uint64_t)self, v4, 1);
  [v4 setInitiallyBehindNavigationBar:0];
}

- (void)openLibrary:(id)a3
{
}

- (void)tabBarManager:(id)a3 didCreateTabBar:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [v6 setNavigationIntentHandler:self];
  id v7 = [v8 inlineTabBar];

  if (v7 == v6) {
    [v6 setAccessibilityIdentifier:@"UnifiedTabBar"];
  }
  -[BrowserController _addInteractionsForTabBar:]((uint64_t)self, v6);
  if ([v6 isStandalone]) {
    objc_msgSend(v6, "setContentHidden:", -[BrowserRootViewController isShowingTabBar](self->_rootViewController, "isShowingTabBar") ^ 1);
  }
}

- (void)tabBarManagerDidUpdateDisplayMode:(id)a3
{
  id v5 = a3;
  [(BrowserRootViewController *)self->_rootViewController updateTabHoverPreview];
  -[BrowserController _updateBookmarksMenuProvider]((uint64_t)self);
  [(BrowserController *)self updateShowingTabBarAnimated:0];
  if ([v5 displayMode]) {
    [(BrowserController *)self updateDynamicBarGeometry];
  }
  else {
    [(UIContextMenuInteraction *)self->_unifiedTabBarContextMenuInteraction dismissMenu];
  }
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  [v4 validateExtensionToolbarItems];
}

- (BOOL)_isTabBarShown
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [*(id *)(a1 + 280) unifiedBar];
  BOOL v2 = v1;
  if (v1 && ([v1 isHidden] & 1) == 0)
  {
    id v4 = [v2 window];
    BOOL v3 = v4 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)shouldReportUnifiedTabBarAnalytics
{
  BOOL isTabBar = -[BrowserController _isTabBarShown]((uint64_t)self);
  if (isTabBar) {
    LOBYTE(isTabBar) = [(BrowserController *)self tabBarDisplayMode] != 0;
  }
  return isTabBar;
}

- (int64_t)unifiedTabBarLayoutStyle
{
  return [(BrowserController *)self tabBarDisplayMode] == 2;
}

- (unint64_t)numberOfTabsInCurrentTabBar
{
  BOOL v2 = [(BrowserController *)self tabBarManager];
  BOOL v3 = [v2 itemArrangement];
  id v4 = [v3 items];
  unint64_t v5 = [v4 count];

  return v5;
}

- (BOOL)tabBarIsCurrentlyScrollable
{
  BOOL v2 = [(BrowserController *)self tabBarManager];
  BOOL v3 = [v2 effectiveTabBar];

  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 isCurrentlyScrollable];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)tabsShowOnlyIcons
{
  return 0;
}

- (BOOL)backgroundColorInTabBarEnabled
{
  BOOL v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F786D0]] ^ 1;

  return v3;
}

- (void)createNewBookmarkWithTitle:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    char v3 = [(TabController *)self->_tabController activeTabDocument];
    id v5 = [v3 titleForNewBookmark];
  }
  -[BrowserController _addBookmarkForCurrentTabKeyPressed:title:]((id *)&self->super.super.super.isa, 0, v5);
  id v6 = v7;
  if (!v7)
  {

    id v6 = 0;
  }
}

- (void)createReadingListItem
{
}

- (void)openBookmarkWithUUIDString:(id)a3
{
}

- (void)openBookmarkWithUUIDString:(id)a3 inTabWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  double v9 = [v8 bookmarkWithUUID:v6];
  if (v9)
  {
    if (v7)
    {
      double v10 = [(TabController *)self->_tabController tabWithUUID:v7];
      if (v10)
      {
LABEL_8:
        double v12 = [MEMORY[0x1E4F78598] builder];
        [v12 setPreferredTabOrder:1];
        if (v10)
        {
          [(TabController *)self->_tabController setActiveTab:v10 animated:1];
          [(BrowserController *)self dismissTransientUIAnimated:1];
        }
        else
        {
          [v12 setPrefersOpenInNewTab:1];
        }
        double v14 = [v12 navigationIntentWithBookmark:v9];
        [(BrowserController *)self dispatchNavigationIntent:v14];

        goto LABEL_14;
      }
      double v11 = (id)WBS_LOG_CHANNEL_PREFIXSiriLink();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [v7 UUIDString];
        objc_claimAutoreleasedReturnValue();
        -[BrowserController openBookmarkWithUUIDString:inTabWithUUID:]();
      }
    }
    double v10 = 0;
    goto LABEL_8;
  }
  double v13 = WBS_LOG_CHANNEL_PREFIXSiriLink();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[BrowserController openBookmarkWithUUIDString:inTabWithUUID:]();
  }
LABEL_14:
}

- (void)setReaderModeEnabled:(BOOL)a3
{
}

- (void)performSearchUsingQuery:(id)a3
{
  id v9 = a3;
  char v4 = [(TabController *)self->_tabController activeTabDocument];
  if ([v4 isBlank])
  {
    [v4 unhibernate];
  }
  else
  {
    id v5 = [[TabDocument alloc] initWithBrowserController:self];
    [(TabDocument *)v5 setIsBlank:1];
    -[TabController insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:](self->_tabController, "insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:", v5, 0, 0, [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]);
  }
  if (![(BrowserController *)self isFavoritesFieldFocused])
  {
    if ([(BrowserRootViewController *)self->_rootViewController usingLoweredBar])
    {
      id v6 = [(BrowserRootViewController *)self->_rootViewController capsuleViewController];
      [v6 transitionToState:2 options:0 animated:1 completionHandler:0];
    }
    else
    {
      -[BrowserController _focusNavigationBarWithCompletionHandler:](self, 0);
    }
  }
  id v7 = [(BrowserController *)self unifiedField];
  [v7 setPerformingExternalSearch:1];
  id v8 = [(BrowserRootViewController *)self->_rootViewController catalogViewController];
  [v8 setQueryString:v9];

  [v7 endExternalSearch];
  [v7 setPerformingExternalSearch:0];
}

- (void)performTabSearchUsingQuery:(id)a3
{
  id v7 = a3;
  id v4 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v4 presentationState] == 1)
  {
  }
  else
  {
    uint64_t v5 = [v4 presentationState];

    if (v5 != 2) {
      [v4 presentAnimated:0];
    }
  }
  if (SFEnhancedTabOverviewEnabled())
  {
    id v6 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabSwitcherViewController];
    [v6 beginSearchingWithSearchString:v7];
  }
}

- (void)findString:(id)a3 onTabWithUUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(TabController *)self->_tabController tabWithUUID:v6];
  if (v7 && [(BrowserController *)self canFindOnTabWithUUID:v6])
  {
    [(TabController *)self->_tabController setActiveTab:v7 animated:1];
    [(BrowserController *)self dismissTransientUIAnimated:1];
    id v8 = [(TabController *)self->_tabController activeTabDocument];
    id v9 = [v8 findInteraction];
    [v9 setSearchText:v10];

    [v8 showFindOnPage];
  }
}

- (id)activeTabUUIDString
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 344) activeTabDocument];
    BOOL v2 = [v1 uuid];
    char v3 = [v2 UUIDString];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (BOOL)canReadThis
{
  if (-[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self)) {
    return 0;
  }
  char v3 = [(TabController *)self->_tabController activeTabDocument];
  if (([v3 isReaderAvailable] & 1) == 0)
  {

LABEL_7:
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1E102C000, This, OS_LOG_TYPE_INFO, "Safari Reader is not available for the currently active tab.", v10, 2u);
    }
    return 0;
  }
  id v4 = [(TabController *)self->_tabController activeTabDocument];
  uint64_t v5 = [v4 mediaSuspensionReasons];

  if (v5) {
    goto LABEL_7;
  }
  id v6 = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  BOOL v7 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Safari Reader is available for the currently active tab.", buf, 2u);
  }
  return v7;
}

- (BOOL)canReadActiveLanguage
{
  v29[3] = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(BrowserController *)self activeDocument];
  char v3 = [v2 translationContext];
  id v4 = [v3 lastDeterminedWebpageLanguage];

  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v5 = (void *)getAFPreferencesClass(void)::softClass;
  uint64_t v26 = getAFPreferencesClass(void)::softClass;
  if (!getAFPreferencesClass(void)::softClass)
  {
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = ___ZL21getAFPreferencesClassv_block_invoke;
    id v28 = (__CFString *)&unk_1E6D79088;
    v29[0] = &v23;
    ___ZL21getAFPreferencesClassv_block_invoke((uint64_t)buf);
    uint64_t v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  BOOL v7 = objc_msgSend((id)objc_opt_class(), "sharedPreferences", v23);
  id v8 = [v7 outputVoice];

  id v9 = (void *)MEMORY[0x1E4F1CA20];
  id v10 = [v8 languageCode];
  double v11 = [v9 localeWithLocaleIdentifier:v10];

  double v12 = [v11 languageCode];
  int v13 = [v12 isEqualToString:v4];

  if (v13)
  {
    int v14 = 1;
  }
  else if (v8)
  {
    int v14 = 0;
  }
  else
  {
    double v15 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    id v16 = [v15 downloadedSiriVoiceLanguages];
    int v14 = [v16 containsObject:v4];
  }
  This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
  if (os_log_type_enabled(This, OS_LOG_TYPE_INFO))
  {
    if (v13) {
      id v18 = @"YES";
    }
    else {
      id v18 = @"NO";
    }
    uint64_t v19 = v18;
    if (v14) {
      uint64_t v20 = @"YES";
    }
    else {
      uint64_t v20 = @"NO";
    }
    int v21 = v20;
    *(_DWORD *)long long buf = 138544130;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    id v28 = v19;
    LOWORD(v29[0]) = 2114;
    *(void *)((char *)v29 + 2) = v21;
    _os_log_impl(&dword_1E102C000, This, OS_LOG_TYPE_INFO, "Completed analysis: voice = %{public}@; determinedLanguage: %{public}@; voiceLanguageMatchesTextLanguage = %{publi"
      "c}@; canRead = %{public}@",
      buf,
      0x2Au);
  }
  return v14;
}

- (void)siriReadThisVocalInvocation
{
  id v12 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  [v12 setupNowPlayingListenerIfNeeded];

  extractedArticleText = self->_extractedArticleText;
  if (!extractedArticleText) {
    goto LABEL_7;
  }
  if (![(NSString *)extractedArticleText length]) {
    goto LABEL_7;
  }
  id v13 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  id v4 = [v13 activeSiriReaderSessionURL];
  uint64_t v5 = [(TabController *)self->_tabController activeTabDocument];
  id v6 = [v5 readerContext];
  BOOL v7 = [v6 readerURL];
  int v8 = objc_msgSend(v4, "safari_isEqualToURL:", v7);

  if (v8)
  {
    -[BrowserController _siriReadThisVocalInvocation]((id *)&self->super.super.super.isa);
  }
  else
  {
LABEL_7:
    id v14 = [(TabController *)self->_tabController activeTabDocument];
    id v9 = [v14 readerWebView];

    if (v9)
    {
      -[BrowserController _extractTextFromReaderWebViewOfTab:]((uint64_t)self, v14);
      -[BrowserController _siriReadThisVocalInvocation]((id *)&self->super.super.super.isa);
    }
    else
    {
      [v14 createBrowserReaderViewIfNeeded];
      -[BrowserController activeTabUUIDString]((uint64_t)self);
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      tabUUIDStringForSiriReadThisVocalInvocation = self->_tabUUIDStringForSiriReadThisVocalInvocation;
      self->_tabUUIDStringForSiriReadThisVocalInvocation = v10;
    }
  }
}

void __49__BrowserController__siriReadThisVocalInvocation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 image];
    uint64_t v6 = [v5 platformImage];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = *(void **)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = WeakRetained[99];
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = objc_msgSend(v10, "safari_bestLanguageTag");
    [v9 readText:v10 textBody:v11 textIdentifier:v12 textLocale:v13 textLeadingImage:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) activationSource:1];

    id v14 = [*(id *)(a1 + 56) readerURL];
    double v15 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    [v15 setActiveSiriReaderSessionURL:v14];

    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    [v17 setActiveSiriReaderSessionIdentifier:v16];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BrowserController__siriReadThisVocalInvocation__block_invoke_2;
    block[3] = &unk_1E6D79060;
    id v22 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1E102C000, This, OS_LOG_TYPE_DEFAULT, "Safari requested starting playback", v20, 2u);
    }
    uint64_t v19 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    [v19 setCurrentPlaybackState:1];
  }
}

void __49__BrowserController__siriReadThisVocalInvocation__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationBarItem];
  [v1 setShowsSiriReaderPlayingIcon:1];
}

- (void)siriReadThisMenuInvocation
{
  id v12 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  [v12 setupNowPlayingListenerIfNeeded];

  extractedArticleText = self->_extractedArticleText;
  if (!extractedArticleText) {
    goto LABEL_7;
  }
  if (![(NSString *)extractedArticleText length]) {
    goto LABEL_7;
  }
  id v13 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  id v4 = [v13 activeSiriReaderSessionURL];
  uint64_t v5 = [(TabController *)self->_tabController activeTabDocument];
  uint64_t v6 = [v5 readerContext];
  uint64_t v7 = [v6 readerURL];
  int v8 = objc_msgSend(v4, "safari_isEqualToURL:", v7);

  if (v8)
  {
    -[BrowserController _siriReadThisMenuInvocation]((id *)&self->super.super.super.isa);
  }
  else
  {
LABEL_7:
    id v14 = [(TabController *)self->_tabController activeTabDocument];
    id v9 = [v14 readerWebView];

    if (v9)
    {
      -[BrowserController _extractTextFromReaderWebViewOfTab:]((uint64_t)self, v14);
      -[BrowserController _siriReadThisMenuInvocation]((id *)&self->super.super.super.isa);
    }
    else
    {
      [v14 createBrowserReaderViewIfNeeded];
      -[BrowserController activeTabUUIDString]((uint64_t)self);
      id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      tabUUIDStringForSiriReadThisMenuInvocation = self->_tabUUIDStringForSiriReadThisMenuInvocation;
      self->_tabUUIDStringForSiriReadThisMenuInvocation = v10;
    }
  }
}

void __48__BrowserController__siriReadThisMenuInvocation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    uint64_t v5 = [v3 image];
    uint64_t v6 = [v5 platformImage];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v9 = *(void **)(a1 + 32);
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = WeakRetained[99];
    uint64_t v12 = *(void *)(a1 + 48);
    id v13 = objc_msgSend(v10, "safari_bestLanguageTag");
    [v9 readText:v10 textBody:v11 textIdentifier:v12 textLocale:v13 textLeadingImage:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) activationSource:2];

    id v14 = [*(id *)(a1 + 56) readerURL];
    double v15 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    [v15 setActiveSiriReaderSessionURL:v14];

    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    [v17 setActiveSiriReaderSessionIdentifier:v16];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__BrowserController__siriReadThisMenuInvocation__block_invoke_2;
    block[3] = &unk_1E6D79060;
    id v22 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x1E4F14428], block);
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl(&dword_1E102C000, This, OS_LOG_TYPE_DEFAULT, "Safari requested starting playback", v20, 2u);
    }
    uint64_t v19 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    [v19 setCurrentPlaybackState:1];
  }
}

void __48__BrowserController__siriReadThisMenuInvocation__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) navigationBarItem];
  [v1 setShowsSiriReaderPlayingIcon:1];
}

- (BOOL)shouldShowListeningControls
{
  BOOL v2 = [(TabController *)self->_tabController activeTabDocument];
  id v3 = [v2 navigationBarItem];
  char v4 = [v3 shouldShowListeningControls];

  return v4;
}

- (void)setShouldShowListeningControls:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(TabController *)self->_tabController activeTabDocument];
  char v4 = [v5 navigationBarItem];
  [v4 setShouldShowListeningControls:v3];
}

- (int64_t)siriReaderPlaybackStateForActiveTab
{
  BOOL v3 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  char v4 = [v3 activeSiriReaderSessionIdentifier];

  id v5 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  uint64_t v6 = [v5 activeSiriReaderSessionURL];
  uint64_t v7 = [(TabController *)self->_tabController activeTabDocument];
  int v8 = [v7 readerContext];
  id v9 = [v8 readerURL];
  LOBYTE(self) = WBSIsEqual();

  if (self)
  {
    id v10 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    uint64_t v11 = [v10 nowPlayingContentIdentifier];
    char v12 = [v11 isEqualToString:v4];

    if (v12)
    {
      id v13 = [MEMORY[0x1E4F78360] sharedPlaybackController];
      int64_t v14 = [v13 currentPlaybackState];

      double v15 = [MEMORY[0x1E4F78360] sharedPlaybackController];
      uint64_t v16 = [v15 nowPlayingContentIdentifier];
      char v17 = [v16 isEqualToString:v4];
      if (v14 == 3) {
        char v18 = v17;
      }
      else {
        char v18 = 0;
      }

      if (v18)
      {
        int64_t v14 = 1;
      }
      else if (v14 != 2 && v14 != 1 && v14 != 3)
      {
        int64_t v14 = 0;
      }
    }
    else
    {
      int64_t v14 = 3;
    }
  }
  else
  {
    int64_t v14 = 0;
  }

  return v14;
}

- (void)createNewTabWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(TabController *)self->_tabController switchToTabGroupVisibleInSwitcherIfNeeded];
  tabController = self->_tabController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__BrowserController_createNewTabWithCompletionHandler___block_invoke;
  void v7[3] = &unk_1E6D79F90;
  id v6 = v4;
  void v7[4] = self;
  id v8 = v6;
  [(TabController *)tabController openNewTabWithOptions:1 completionHandler:v7];
}

void __55__BrowserController_createNewTabWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
    id v4 = [v5 uuid];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  if (a2)
  {
  }
}

- (void)createNewTabWithURL:(id)a3 isPrivate:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(TabController *)self->_tabController switchToTabGroupVisibleInSwitcherIfNeeded];
  tabController = self->_tabController;
  if (v6) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__BrowserController_createNewTabWithURL_isPrivate_completionHandler___block_invoke;
  v14[3] = &unk_1E6D79FB8;
  id v12 = v9;
  id v16 = v12;
  void v14[4] = self;
  id v13 = v8;
  id v15 = v13;
  [(TabController *)tabController openNewTabWithOptions:v11 completionHandler:v14];
}

void __69__BrowserController_createNewTabWithURL_isPrivate_completionHandler___block_invoke(void *a1, char a2)
{
  if (a2)
  {
    id v7 = [*(id *)(a1[4] + 344) activeTabDocument];
    id v3 = (id)[v7 loadURL:a1[5] userDriven:0];
    uint64_t v4 = a1[6];
    id v5 = [v7 uuid];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    BOOL v6 = *(void (**)(void))(a1[6] + 16);
    v6();
  }
}

- (void)openTabWithUUID:(id)a3
{
  uint64_t v4 = [(TabController *)self->_tabController tabWithUUID:a3];
  if (v4)
  {
    [(TabController *)self->_tabController setActiveTab:v4 animated:1];
    id v5 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
    [v5 dismissAnimated:1];
  }
  else
  {
    BOOL v6 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BrowserController openTabWithUUID:]();
    }
  }
}

- (void)closeTabWithUUID:(id)a3
{
  uint64_t v4 = [(TabController *)self->_tabController tabWithUUID:a3];
  if (v4)
  {
    [(TabController *)self->_tabController closeTab:v4 animated:1];
  }
  else
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BrowserController closeTabWithUUID:]();
    }
  }
}

- (void)createNewPrivateTab
{
}

- (id)createNewTabGroupWithTitle:(id)a3
{
  uint64_t v4 = [(TabController *)self->_tabController addNewTabGroupWithTitle:a3 fromExistingTabs:0];
  [(BrowserController *)self scrollSidebarToTopAnimated:1];
  id v5 = [v4 uuid];

  return v5;
}

- (void)openTabGroupOfKind:(int64_t)a3 uuidString:(id)a4
{
  id v6 = a4;
  id v9 = v6;
  if ((unint64_t)(a3 - 2) < 2)
  {
    id v7 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v6];
    id v8 = [v7 profileIdentifier];
    [(TabController *)self->_tabController setActiveProfileIdentifier:v8];

    [(TabController *)self->_tabController setActiveTabGroupUUID:v9];
  }
  else if (a3 == 1)
  {
    [(TabController *)self->_tabController selectPrivateTabGroup];
  }
  else if (!a3)
  {
    [(TabController *)self->_tabController selectLocalTabGroup];
  }
}

- (void)setView:(unint64_t)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  if (-[BrowserController isViewVisible:](self, "isViewVisible:") != a4
    && [(BrowserController *)self canToggleVisibilityForView:a3])
  {
    if (v4) {
      [(BrowserController *)self dismissTransientUIAnimated:1];
    }
    switch(a3)
    {
      case 0uLL:
        id v7 = kCollectionTypeBookmarks;
        goto LABEL_10;
      case 1uLL:
        id v7 = kCollectionTypeHistory;
        goto LABEL_10;
      case 2uLL:
        id v7 = kCollectionTypeReadingList;
LABEL_10:
        id v8 = *v7;
        -[BrowserController _switchToCollectionOrToggleSidebar:]((id *)&self->super.super.super.isa, v8);
        break;
      case 3uLL:
        -[BrowserController _toggleVisibilityOfStartPageCollection:]((uint64_t)self, @"SharedWithYouCollection");
        break;
      case 4uLL:
        [(BrowserController *)self toggleBookmarksPresentation];
        break;
      case 6uLL:
        [(BrowserController *)self toggleTabView];
        break;
      default:
        return;
    }
  }
}

- (void)openStartPage
{
  id v3 = [(TabController *)self->_tabController currentTabs];
  id v6 = [v3 lastObject];

  if (![v6 isBlank])
  {
    [(BrowserController *)self openNewTab:0];
    goto LABEL_8;
  }
  [(TabController *)self->_tabController setActiveTab:v6];
  id v4 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v4 presentationState] == 1)
  {

LABEL_6:
    [v4 dismissAnimated:1];
    goto LABEL_7;
  }
  uint64_t v5 = [v4 presentationState];

  if (v5 == 2) {
    goto LABEL_6;
  }
LABEL_7:

LABEL_8:
}

- (void)closeStartPage
{
  if ([(BrowserController *)self activeTabIsBlank]
    && [(TabController *)self->_tabController canCloseTab])
  {
    [(BrowserController *)self closeActiveTab:0];
  }
}

- (void)navigateContinuousReadingListToDirection:(unint64_t)a3
{
  if (-[BrowserController canNavigateContinuousReadingListInDirection:](self, "canNavigateContinuousReadingListInDirection:"))
  {
    if (a3 == 1)
    {
      continuousReadingViewController = self->_continuousReadingViewController;
      [(ContinuousReadingViewController *)continuousReadingViewController loadNextItem];
    }
    else if (!a3)
    {
      uint64_t v5 = self->_continuousReadingViewController;
      [(ContinuousReadingViewController *)v5 loadPreviousItem];
    }
  }
}

- (void)openClearHistoryViewControllerFor:(id)a3
{
  id v6 = a3;
  id v4 = objc_alloc_init(SafariClearBrowsingDataController);
  objc_storeStrong((id *)&self->_clearBrowsingDataController, v4);
  -[BrowserController _switchToCollectionOrToggleSidebar:]((id *)&self->super.super.super.isa, @"HistoryCollection");
  uint64_t v5 = [(BrowserController *)self rootViewController];
  [(SafariClearBrowsingDataController *)v4 showClearHistoryMenuFromViewController:v5 profileIdentifier:v6];
}

- (BOOL)isReaderAvailable
{
  if (!-[BrowserController _isReaderModeFormatMenuItemAvailable]((uint64_t)self)) {
    return 0;
  }
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  char v4 = [v3 isReaderAvailable];

  return v4;
}

- (BOOL)canCreateNewTab
{
  return [(_SFBarManager *)self->_barManager isBarItemEnabled:7];
}

- (BOOL)canCloseTab
{
  return [(TabController *)self->_tabController canCloseTab];
}

- (BOOL)canCreateNewPrivateTab
{
  return [(TabController *)self->_tabController canAddNewTabForPrivateBrowsing:1];
}

- (BOOL)canFindOnTabWithUUID:(id)a3
{
  char v4 = [(TabController *)self->_tabController tabWithUUID:a3];
  if (-[BrowserController _isWindowLockedForPrivateBrowsing]((uint64_t)self)
    && ([v4 isPrivateBrowsingEnabled] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v4 url];
    BOOL v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)areCustomTabGroupsEnabled
{
  BOOL v2 = +[FeatureManager sharedFeatureManager];
  char v3 = [v2 isCustomTabGroupsEnabled];

  return v3;
}

- (BOOL)canToggleVisibilityForView:(unint64_t)a3
{
  BOOL v5 = +[FeatureManager sharedFeatureManager];
  char v6 = [(BrowserController *)self canShowSidebar];
  BOOL privateBrowsingAvailable = 1;
  switch(a3)
  {
    case 0uLL:
      char v6 = [v5 isBookmarksAvailable];
      goto LABEL_4;
    case 2uLL:
      char v6 = [v5 isReadingListAvailable];
      goto LABEL_4;
    case 3uLL:
    case 4uLL:
LABEL_4:
      BOOL privateBrowsingAvailable = v6;
      break;
    case 5uLL:
      BOOL privateBrowsingAvailable = 0;
      break;
    case 6uLL:
      id v8 = [(BrowserController *)self activeLibraryType];
      BOOL privateBrowsingAvailable = v8 == 0;

      break;
    case 8uLL:
      BOOL privateBrowsingAvailable = self->_privateBrowsingAvailable;
      break;
    default:
      break;
  }

  return privateBrowsingAvailable;
}

- (BOOL)isViewVisible:(unint64_t)a3
{
  BOOL v3 = 0;
  switch(a3)
  {
    case 0uLL:
      char v4 = [(BrowserController *)self currentBookmarksCollection];
      char v5 = [v4 isEqualToString:@"BookmarksCollection"];
      goto LABEL_11;
    case 1uLL:
      char v4 = [(BrowserController *)self currentBookmarksCollection];
      char v5 = [v4 isEqualToString:@"HistoryCollection"];
      goto LABEL_11;
    case 2uLL:
      char v4 = [(BrowserController *)self currentBookmarksCollection];
      char v5 = [v4 isEqualToString:@"ReadingListCollection"];
      goto LABEL_11;
    case 3uLL:
      char v4 = [(LibraryController *)self->_libraryController currentCollection];
      char v5 = [v4 isEqualToString:@"SharedWithYouCollection"];
      goto LABEL_11;
    case 4uLL:
      sidebarUIProxdouble y = self->_sidebarUIProxy;
      return [(SidebarUIProxy *)sidebarUIProxy isShowingSidebar];
    case 6uLL:
      tabCollectionViewProvider = self->_tabCollectionViewProvider;
      return [(TabCollectionViewProviding *)tabCollectionViewProvider isShowingTabView];
    case 7uLL:
      char v4 = [(TabController *)self->_tabController activeTabGroup];
      char v5 = [v4 isLocal];
      goto LABEL_11;
    case 8uLL:
      char v4 = [(TabController *)self->_tabController activeTabGroup];
      char v5 = [v4 isPrivateBrowsing];
LABEL_11:
      BOOL v3 = v5;

      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)activeTabIsBlank
{
  BOOL v3 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v3 presentationState])
  {
    char v4 = 0;
  }
  else
  {
    char v5 = [(TabController *)self->_tabController activeTabDocument];
    char v4 = [v5 isBlank];
  }
  return v4;
}

- (BOOL)canCloseActiveTab
{
  return [(TabController *)self->_tabController canCloseTab];
}

- (BOOL)isShowingContinuousReadingList
{
  id v3 = [(TabCollectionViewProviding *)self->_tabCollectionViewProvider tabThumbnailCollectionView];
  if ([v3 presentationState] == 1)
  {
  }
  else
  {
    uint64_t v4 = [v3 presentationState];

    if (v4 != 2)
    {
      BOOL v5 = -[BrowserController _isInContinuousMode]((uint64_t)self);
      goto LABEL_6;
    }
  }
  BOOL v5 = 0;
LABEL_6:

  return v5;
}

- (BOOL)canNavigateContinuousReadingListInDirection:(unint64_t)a3
{
  uint64_t v4 = [(BrowserController *)self continuousReadingController];
  BOOL v5 = v4;
  if (a3) {
    [v4 nextReadingListItem];
  }
  else {
  char v6 = [v4 previousReadingListItem];
  }

  return v6 != 0;
}

- (void)prepareIntentInteractionWithCompletionHandler:(id)a3
{
  char v6 = (void (**)(void))a3;
  uint64_t v4 = +[LaunchStateController sharedController];
  int v5 = [v4 hasCompletedLaunch];

  if (v5) {
    v6[2]();
  }
  else {
    [(BrowserRootViewController *)self->_rootViewController setIntentInteractionCompletion:v6];
  }
}

- (void)playbackStateDidChangeForSiriReaderPlaybackController:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F78360], "sharedPlaybackController", a3);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __75__BrowserController_playbackStateDidChangeForSiriReaderPlaybackController___block_invoke;
  v5[3] = &unk_1E6D79FE0;
  void v5[4] = self;
  [v4 updateContentIdentifierOnQueue:MEMORY[0x1E4F14428] completion:v5];
}

void __75__BrowserController_playbackStateDidChangeForSiriReaderPlaybackController___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  [v3 setNowPlayingContentIdentifier:v5];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 344) activeTabDocument];
  [v4 updateShowsSiriReaderPlayingIcon];

  [*(id *)(*(void *)(a1 + 32) + 184) updateShouldShowListeningControls:v5 != 0];
}

- (void)playbackContentIdentifierDidChangeForSiriReaderPlaybackController:(id)a3
{
  id v3 = [(TabController *)self->_tabController activeTabDocument];
  [v3 updateShowsSiriReaderPlayingIcon];
}

- (void)profileWindow:(id)a3 selectProfile:(id)a4
{
  id v7 = a4;
  id v5 = [v7 identifier];
  [(TabController *)self->_tabController setActiveProfileIdentifier:v5];

  char v6 = [(BrowserRootViewController *)self->_rootViewController bookmarksBar];
  [v6 setNeedsReloadData];
}

- (void)profileWindow:(id)a3 selectTabGroup:(id)a4
{
  objc_msgSend(a4, "uuid", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TabController setActiveTabGroupUUID:](self->_tabController, "setActiveTabGroupUUID:");
}

- (UniversalSearchSession)universalSearchSession
{
  universalSearchSession = self->_universalSearchSession;
  if (!universalSearchSession)
  {
    uint64_t v4 = [UniversalSearchSession alloc];
    id v5 = +[WBSParsecDSession sharedPARSession];
    char v6 = [(WBSParsecDSession *)v4 initWithParsecdSession:v5 skipAutoFillDataUpdates:0];
    id v7 = self->_universalSearchSession;
    self->_universalSearchSession = v6;

    universalSearchSession = self->_universalSearchSession;
  }
  return universalSearchSession;
}

- (NSUUID)appIntentRequestIdentifier
{
  return self->_appIntentRequestIdentifier;
}

- (void)setAppIntentRequestIdentifier:(id)a3
{
}

- (BOOL)isReaderViewStale
{
  return self->_readerViewStale;
}

- (void)setReaderViewStale:(BOOL)a3
{
  self->_readerViewStale = a3;
}

- (BOOL)readerShouldBeShownIfPossible
{
  return self->_readerShouldBeShownIfPossible;
}

- (TabDocument)previousContinuousItemDocument
{
  return self->_previousContinuousItemDocument;
}

- (void)setPreviousContinuousItemDocument:(id)a3
{
}

- (void)setNextContinuousItemDocument:(id)a3
{
}

- (TabDocument)cachedDocumentOnContinuousTransition
{
  return self->_cachedDocumentOnContinuousTransition;
}

- (void)setCachedDocumentOnContinuousTransition:(id)a3
{
}

- (void)setAppReviewPromptManager:(id)a3
{
}

- (NSString)extractedArticleText
{
  return self->_extractedArticleText;
}

- (id)animationPendingDynamicBarAnimatorSteadyState
{
  return self->_animationPendingDynamicBarAnimatorSteadyState;
}

- (void)setAnimationPendingDynamicBarAnimatorSteadyState:(id)a3
{
}

- (_SFBrowserSavedState)savedState
{
  return self->_savedState;
}

- (BOOL)tabViewPinchActive
{
  return self->_tabViewPinchActive;
}

- (BOOL)wantsUnifiedFieldFocused
{
  return self->_wantsUnifiedFieldFocused;
}

- (void)setWantsUnifiedFieldFocused:(BOOL)a3
{
  self->_wantsUnifiedFieldFocused = a3;
}

- (BOOL)shouldKeepKeyboardFocused
{
  return self->_shouldKeepKeyboardFocused;
}

- (void)setShouldKeepKeyboardFocused:(BOOL)a3
{
  self->_shouldKeepKeyboardFocused = a3;
}

- (int64_t)favoritesState
{
  return self->_favoritesState;
}

- (BOOL)canFocusNavigationBarURL
{
  return self->_canFocusNavigationBarURL;
}

- (void)setCanFocusNavigationBarURL:(BOOL)a3
{
  self->_canFocusNavigationBarURL = a3;
}

- (UITextRange)textRangeToRestoreAfterCompletionDetailIsDismissed
{
  return self->_textRangeToRestoreAfterCompletionDetailIsDismissed;
}

- (void)setTextRangeToRestoreAfterCompletionDetailIsDismissed:(id)a3
{
}

- (_SFActivityViewController)presentedActivityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedActivityViewController);
  return (_SFActivityViewController *)WeakRetained;
}

- (WBSDigitalHealthManager)digitalHealthManager
{
  return self->_digitalHealthManager;
}

- (void)setTabDocumentPlayingPIPVideo:(id)a3
{
}

- (ApplicationShortcutController)shortcutController
{
  return self->_shortcutController;
}

- (BOOL)suppressWebExtensionEvents
{
  return self->_suppressWebExtensionEvents;
}

- (void)setSuppressWebExtensionEvents:(BOOL)a3
{
  self->_suppressWebExtensionEvents = a3;
}

- (BOOL)overridesUndoManagerForClosedTabs
{
  return self->_overridesUndoManagerForClosedTabs;
}

- (void)setOverridesUndoManagerForClosedTabs:(BOOL)a3
{
  self->_overridesUndoManagerForClosedTabs = a3;
}

- (TabDocument)speculativeLoadDocument
{
  return self->_speculativeLoadDocument;
}

- (BOOL)isBackgrounded
{
  return self->_backgrounded;
}

- (void)setBackgrounded:(BOOL)a3
{
  self->_backgrounded = a3;
}

- (id)intentSceneConfigurationCompletion
{
  return self->_intentSceneConfigurationCompletion;
}

- (void)setIntentSceneConfigurationCompletion:(id)a3
{
}

- (_SFWebView)webView
{
  return self->_webView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabCollectionViewProvider, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong(&self->_intentSceneConfigurationCompletion, 0);
  objc_storeStrong((id *)&self->_speculativeLoadDocument, 0);
  objc_storeStrong((id *)&self->_libraryController, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_shortcutController, 0);
  objc_storeStrong((id *)&self->_userActivityController, 0);
  objc_storeStrong((id *)&self->_tabDocumentPlayingPIPVideo, 0);
  objc_storeStrong((id *)&self->_digitalHealthManager, 0);
  objc_storeStrong((id *)&self->_textRangeToRestoreAfterCompletionDetailIsDismissed, 0);
  objc_storeStrong((id *)&self->_wkPreferences, 0);
  objc_storeStrong((id *)&self->_barManager, 0);
  objc_storeStrong((id *)&self->_tabViewPinchRecognizer, 0);
  objc_storeStrong((id *)&self->_savedState, 0);
  objc_storeStrong(&self->_animationPendingDynamicBarAnimatorSteadyState, 0);
  objc_storeStrong((id *)&self->_extractedArticleText, 0);
  objc_storeStrong((id *)&self->_appReviewPromptManager, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_bannerController, 0);
  objc_storeStrong((id *)&self->_cachedDocumentOnContinuousTransition, 0);
  objc_storeStrong((id *)&self->_sidebarUIProxy, 0);
  objc_storeStrong((id *)&self->_windowState, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_destroyWeak((id *)&self->_browserWindowController);
  objc_storeStrong((id *)&self->_appIntentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_eligibilityCheckBlockingWindow, 0);
  objc_storeStrong((id *)&self->_webClipIDPendingYttriumState, 0);
  objc_storeStrong((id *)&self->_enterYttriumStateTimer, 0);
  objc_storeStrong((id *)&self->_clearBrowsingDataController, 0);
  objc_storeStrong((id *)&self->_siriLinkCoordinator, 0);
  objc_destroyWeak((id *)&self->_activeAutoFillInternalFeedbackToastController);
  objc_storeStrong((id *)&self->_activeAutoFillInternalFeedbackToastDismissalTimer, 0);
  objc_storeStrong((id *)&self->_profileTitleInScene, 0);
  objc_storeStrong((id *)&self->_universalSearchSession, 0);
  objc_storeStrong((id *)&self->_lastTimerForDelayingSpeculativelyPreloadingTopHit, 0);
  objc_storeStrong((id *)&self->_tabUUIDStringForSiriReadThisMenuInvocation, 0);
  objc_storeStrong((id *)&self->_tabUUIDStringForSiriReadThisVocalInvocation, 0);
  objc_storeStrong((id *)&self->_dateReaderOpened, 0);
  objc_storeStrong((id *)&self->_activityNoticeTopConstraint, 0);
  objc_storeStrong((id *)&self->_queuedToastViewControllers, 0);
  objc_storeStrong((id *)&self->_currentlyPresentedToastViewController, 0);
  objc_storeStrong((id *)&self->_cachedParticipantLists, 0);
  objc_storeStrong((id *)&self->_defaultWebpagePreferences, 0);
  objc_storeStrong((id *)&self->_extensionActionPanel, 0);
  objc_storeStrong((id *)&self->_privateExtensionWindow, 0);
  objc_storeStrong((id *)&self->_normalExtensionWindow, 0);
  objc_storeStrong((id *)&self->_queryStringWhilePerformingRootViewControllerSizeTransition, 0);
  objc_storeStrong((id *)&self->_catalogViewControllerStateForSizeChange, 0);
  objc_storeStrong((id *)&self->_speculativeLoadURL, 0);
  objc_storeStrong((id *)&self->_spinnerController, 0);
  objc_destroyWeak((id *)&self->_viewControllerToDismissWhileBeingPresented);
  objc_storeStrong((id *)&self->_viewControllersPendingPresentation, 0);
  objc_destroyWeak((id *)&self->_uiDelegate);
  objc_destroyWeak((id *)&self->_tabGroupPickerViewController);
  objc_storeStrong((id *)&self->_unifiedTabBarContextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_tabDragDropController, 0);
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_storeStrong((id *)&self->_scrollingStatusBar, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_searchStateCache, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_saveToFilesOperation, 0);
  objc_storeStrong((id *)&self->_cachedCatalogViewController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_resignActiveDate, 0);
  objc_storeStrong((id *)&self->_reasonsForIgnoringUserInteraction, 0);
  objc_storeStrong((id *)&self->_progressSuppressingDocument, 0);
  objc_storeStrong((id *)&self->_profileWindow, 0);
  objc_storeStrong((id *)&self->_prewarmedActionPanel, 0);
  objc_storeStrong((id *)&self->_previousContinuousItemDocument, 0);
  objc_storeStrong((id *)&self->_previewedDownload, 0);
  objc_storeStrong((id *)&self->_previewDocumentCloseTimer, 0);
  objc_storeStrong((id *)&self->_previewDocument, 0);
  objc_destroyWeak((id *)&self->_presentedActivityViewController);
  objc_storeStrong((id *)&self->_pageFormatMenuController, 0);
  objc_storeStrong((id *)&self->_nextContinuousItemDocument, 0);
  objc_storeStrong((id *)&self->_modalBookmarksController, 0);
  objc_storeStrong((id *)&self->_layoutToRestoreAfterOpeningNewTabs, 0);
  objc_storeStrong((id *)&self->_dropSessionsForTabBarVisibility, 0);
  objc_destroyWeak((id *)&self->_downloadsViewController);
  objc_storeStrong((id *)&self->_continuousReadingViewController, 0);
  objc_storeStrong((id *)&self->_continuousReadingController, 0);
  objc_storeStrong((id *)&self->_cachedMailContentProvider, 0);
  objc_storeStrong((id *)&self->_cachedConfiguration, 0);
  objc_storeStrong(&self->_blockRequestingScreenshotPDFData, 0);
  objc_destroyWeak((id *)&self->_backForwardListItemNeedingSnapshot);
}

void __39__BrowserController_didEnterBackground__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Background task expired while waiting for tab snapshots to save", v2, v3, v4, v5, v6);
}

- (void)cloudSharingController:failedToSaveShareWithError:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Failed to save shared tab group: %@", v5);
}

- (void)catalogViewController:presentViewControllerWithinPopover:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to obtain source view for catalog view controller", v2, v3, v4, v5, v6);
}

- (void)catalogViewController:presentViewControllerWithinPopover:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Failed to obtain source rect from catalog view controller", v2, v3, v4, v5, v6);
}

- (void)catalogViewController:presentViewControllerWithinPopover:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Trying to present catalog popover when it is already presented by: %{public}@", v5);
}

- (void)catalogViewController:(uint64_t)a3 presentViewControllerWithinPopover:(void *)a4 completionHandler:.cold.4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  OUTLINED_FUNCTION_2_2((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v6, v7, "Trying to present catalog popover when we already have a view controller being presented: %{public}@", v8);
}

void __47__BrowserController__readerVisibilityDidChange__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1E102C000, v0, v1, "Safari couldn't extract text to be summarized with error:%@", v2);
}

- (void)snapshotTabDocument:size:topBackdropHeight:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "TabDocument should not be nil when requesting a snapshot provider.", v2, v3, v4, v5, v6);
}

- (void)_presentModalViewController:fromPopoverSource:useAdaptivePresentationInCompact:animated:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Trying to present view controller from bar item when it is already presented by: %{public}@", v5);
}

void __32__BrowserController_closeWindow__block_invoke_814_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Failed to destroy scene: %{public}@", v5);
}

void __75__BrowserController_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Could not save lead image for bookmark from keyboard shortcut in with error: %{public}@", v5);
}

- (void)handleNavigationIntent:completion:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  _os_log_debug_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEBUG, "Navigate to %{public}@", v4, 0xCu);
}

void __56__BrowserController__extractTextFromReaderWebViewOfTab___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Error extracting contents of webpage as a string: %{public}@; page will not be donated to sirireaderd",
    v5);
}

- (void)_stringByRemovingContentBetweenZeroWidthSpacesForText:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Error removing unwanted summary or table of contents text: %{public}@", v5);
}

- (void)tabDocumentCommitPreviewedDocument:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1E102C000, v0, OS_LOG_TYPE_FAULT, "Preview document to speculatively commit to is nil, old document to replace is %{private}@", v1, 0xCu);
}

- (void)tabDocumentCommitPreviewedDocumentAsNewTab:(os_log_t)log inBackground:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109379;
  v3[1] = a1 & 1;
  __int16 v4 = 2117;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_1E102C000, log, OS_LOG_TYPE_FAULT, "Trying to open webpage link in new tab, but the cached _previewDocument is nil; opening in background: %i; Source ta"
    "b: %{sensitive}@",
    (uint8_t *)v3,
    0x12u);
}

- (void)switchFromTabDocument:toTabDocument:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1E102C000, v0, v1, "Switched to a nil active document", v2, v3, v4, v5, v6);
}

void __51__BrowserController_tabDocumentShouldBecomeActive___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Unable to open session: %{public}@", v5);
}

- (void)tabDocument:presentViewControllerAnimated:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Trying to present view controller for tab document when it is already presented by: %{public}@", v5);
}

- (void)scene:willConnectToSession:options:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1E102C000, v0, v1, "Unable to handle session connection to recently closed tab: can't find tab data for UUID: %{public}@", v2);
}

- (void)openBookmarkWithUUIDString:inTabWithUUID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_1E102C000, v0, v1, "Can't find bookmark %{public}@", v2);
}

- (void)openBookmarkWithUUIDString:inTabWithUUID:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Can't find tab %{public}@", v5);
}

- (void)openTabWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Opening tab in wrong window", v2, v3, v4, v5, v6);
}

- (void)closeTabWithUUID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Closing tab in wrong window", v2, v3, v4, v5, v6);
}

@end