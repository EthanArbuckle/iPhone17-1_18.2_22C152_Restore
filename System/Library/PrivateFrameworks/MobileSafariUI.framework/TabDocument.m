@interface TabDocument
+ (id)blankTabTitleWithLibraryType:(id)a3 controlledByAutomation:(BOOL)a4;
+ (id)tabDocumentForWKWebView:(id)a3;
+ (id)urlForExternalURL:(id)a3 forPrivateBrowsing:(BOOL)a4;
- (ActionPanelActivityItemProvider)activityItemProvider;
- (BOOL)_handleTwoFingerTapOnLinkWithContext:(uint64_t)a1;
- (BOOL)_isDeallocating;
- (BOOL)_loadServiceWorkerOpenedURLIntent:(BOOL)a1;
- (BOOL)_loadWebClip:(id *)a1;
- (BOOL)_showICSControllerForPath:(void *)a3 sourceURL:(void *)a4 beforeDismissHandler:;
- (BOOL)_tryRetain;
- (BOOL)_webView:(id)a3 fileUploadPanelContentIsManagedWithInitiatingFrame:(id)a4;
- (BOOL)_webView:(id)a3 focusRequiresStrongPasswordAssistance:(id)a4;
- (BOOL)_webView:(id)a3 gestureRecognizerCanBePreventedByTouchEvents:(id)a4;
- (BOOL)_webView:(id)a3 gestureRecognizerCouldPinch:(id)a4;
- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4;
- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4;
- (BOOL)_webViewCanBecomeFocused:(id)a3;
- (BOOL)allowsBrowsingAssistant;
- (BOOL)allowsProgrammaticFocusToBeginInputSession;
- (BOOL)allowsRemoteInspection;
- (BOOL)appBannerRemovalWasDeferred;
- (BOOL)audioOnly;
- (BOOL)browserHasMultipleProfiles;
- (BOOL)canGoBack;
- (BOOL)canGoBackToParentTab;
- (BOOL)canGoForward;
- (BOOL)canHibernate;
- (BOOL)canHideToolbar;
- (BOOL)canOverrideStatusBar;
- (BOOL)canSetPinned;
- (BOOL)canShowPageFormatMenu;
- (BOOL)canStopLoading;
- (BOOL)contentIsReadyForSnapshot;
- (BOOL)createFluidProgressState;
- (BOOL)currentPageLoadedFromReadingList;
- (BOOL)didFinishDocumentLoad;
- (BOOL)didFirstLayout;
- (BOOL)didFirstMeaningfulPaint;
- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3;
- (BOOL)formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:(id)a3;
- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3;
- (BOOL)hasBeenInserted;
- (BOOL)hasDoneReaderDetection;
- (BOOL)hasEnteredScribbleMode;
- (BOOL)hasFailedURL;
- (BOOL)hasFormControlInteraction;
- (BOOL)hasQuickLookContent;
- (BOOL)hideFindOnPage;
- (BOOL)inElementFullscreen;
- (BOOL)inWebClipScope;
- (BOOL)isActive;
- (BOOL)isAlive;
- (BOOL)isAudible;
- (BOOL)isBlank;
- (BOOL)isBlockedByScreenTime;
- (BOOL)isClosed;
- (BOOL)isContentReady;
- (BOOL)isControlledByAutomation;
- (BOOL)isDisplayingStandaloneImage;
- (BOOL)isDisplayingStandaloneMedia;
- (BOOL)isExitingElementFullscreen;
- (BOOL)isFrontmost;
- (BOOL)isHibernated;
- (BOOL)isInReaderMode;
- (BOOL)isInteractivelyInserted;
- (BOOL)isLoading;
- (BOOL)isLoadingComplete;
- (BOOL)isMuted;
- (BOOL)isNavigatingViaReloadWithoutPrivateRelay;
- (BOOL)isPDFDocument;
- (BOOL)isPerformingFirstLoadAfterOpenInBackground;
- (BOOL)isPerformingRedirectAfterOpenInBackground;
- (BOOL)isPinned;
- (BOOL)isPlayingAudio;
- (BOOL)isPreparingForNewUserActivity;
- (BOOL)isPrivateBrowsingEnabled;
- (BOOL)isReaderAvailable;
- (BOOL)isReusableForURL:(id)a3 webClipURL:(id)a4;
- (BOOL)isSearchPage;
- (BOOL)isSecure;
- (BOOL)isShowingContinuous;
- (BOOL)isShowingErrorPage;
- (BOOL)isShowingFindOnPage;
- (BOOL)isShowingInlineDialog;
- (BOOL)isShowingReader;
- (BOOL)isShowingReadingListArchive;
- (BOOL)isShowingSearchQueryInNavigationBar;
- (BOOL)isShowingStartPageOverriddenByExtension;
- (BOOL)isShowingSystemStartPage;
- (BOOL)isUnread;
- (BOOL)linkPreviewHelper:(id)a3 supportsAction:(int64_t)a4 forURL:(id)a5;
- (BOOL)matchedLastSearch;
- (BOOL)mediaCaptureEnabled;
- (BOOL)mustShowBarsForBackForwardListItem:(id)a3;
- (BOOL)nextLoadComesFromSearchPage;
- (BOOL)pageLoadErrorControllerIsInPreviewMode:(id)a3;
- (BOOL)pageLoadErrorControllerShouldHandleCertificateError:(id)a3;
- (BOOL)pageLoadErrorControllerShouldPermanentlyAcceptCertificate:(id)a3;
- (BOOL)pageLoadErrorControllerShouldReloadAfterError:(id)a3;
- (BOOL)persistWhenHibernated;
- (BOOL)previousLoadingCompleteStateForWebExtensionOnUpdatedEvent;
- (BOOL)printControllerCanPresentPrintUI:(id)a3;
- (BOOL)printControllerShouldPrintReader:(id)a3;
- (BOOL)privacyReportShouldSeparateBlockedTrackers;
- (BOOL)queryParameterFilteringDataQueueShouldMergePendingData:(id)a3;
- (BOOL)sfWebViewCanFindNextOrPrevious:(id)a3;
- (BOOL)sfWebViewShouldFillStringForFind:(id)a3;
- (BOOL)shouldBlockAppSuggestionBanner:(id)a3;
- (BOOL)shouldGrantPermissionsOnUserGestureForWebExtensionContext:(id)a3;
- (BOOL)shouldKeepIgnoredSiriSuggestedSitesOnLoad;
- (BOOL)shouldObscureForDigitalHealth;
- (BOOL)shouldRestoreReader;
- (BOOL)shouldRevealAppLinkBannerForNextCommit;
- (BOOL)shouldSelectOriginatingTabWhenClosed;
- (BOOL)shouldShowReaderOnActivate;
- (BOOL)shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:(id)a3;
- (BOOL)storeBannersAreDisabled;
- (BOOL)supportsAdvancedPrivacyProtectionsForURL:(id)a3;
- (BOOL)supportsReuseForSpotlightSearch;
- (BOOL)suppressWebExtensionEvents;
- (BOOL)suppressingProgressAnimationForNavigationGesture;
- (BOOL)tabEntityIsPrimaryForView:(id)a3;
- (BOOL)wantsReaderWhenActivated;
- (BOOL)wasHibernatedDueToMemoryWarning;
- (BOOL)wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections;
- (BOOL)wasLoadedWithContentBlockersEnabled;
- (BOOL)wasLoadedWithPrivateRelay;
- (BOOL)wasOpenedFromLink;
- (BOOL)webViewIsFullscreen;
- (BrowserController)browserController;
- (CGPoint)scrollPoint;
- (CGRect)sourceRectForPopoverActionPicker:(id)a3;
- (CGSize)tabViewSize;
- (CSSearchableItemAttributeSet)searchableItemAttributes;
- (History)history;
- (LPLinkMetadata)linkMetadataForSharing;
- (LinkPreviewViewController)linkPreviewViewController;
- (LoadProgressObserver)loadProgressObserver;
- (NSArray)URLStringComponents;
- (NSArray)ancestorTabIdentifiers;
- (NSArray)ancestorUUIDs;
- (NSArray)normalBrowsingUserContentControllers;
- (NSArray)shareParticipants;
- (NSArray)tabCollectionItems;
- (NSArray)titleWords;
- (NSSet)allBrowserHistories;
- (NSSet)allBrowserProfileIdentifiers;
- (NSString)URLString;
- (NSString)URLStringForLastSearch;
- (NSString)addressForNewBookmark;
- (NSString)alphanumericStrongPassword;
- (NSString)currentStrongPassword;
- (NSString)customUserAgent;
- (NSString)defaultStrongPassword;
- (NSString)description;
- (NSString)identifier;
- (NSString)lastSearchTerm;
- (NSString)lastSiriReaderSessionIdentifier;
- (NSString)libraryType;
- (NSString)pinnedTitle;
- (NSString)previousTitleForWebExtensionOnUpdatedEvent;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)sourceApplicationBundleIdentifierForNextCommit;
- (NSString)suggestedTitleForCurrentURL;
- (NSString)tabTitle;
- (NSString)title;
- (NSString)titleForCloudTab;
- (NSString)titleForLastSearch;
- (NSString)titleForNewBookmark;
- (NSString)uuidString;
- (NSString)windowIdentifier;
- (NSURL)URLForPerSitePreferences;
- (NSURL)URLFromExternalApplication;
- (NSURL)attributionPresenterURL;
- (NSURL)cachedCanonicalURLOrURLForSharing;
- (NSURL)committedURL;
- (NSURL)expectedOrCurrentURL;
- (NSURL)pendingURLForWebExtensions;
- (NSURL)pinnedURL;
- (NSURL)previousURLForWebExtensionOnUpdatedEvent;
- (NSURL)tabReuseURL;
- (NSURL)urlForExtensions;
- (NSURL)urlForSharing;
- (NSUUID)ownerUUID;
- (NSUUID)tabIDForAutoFill;
- (NSUUID)uuid;
- (NSUUID)webClipID;
- (NSUserActivity)userActivity;
- (NSUserActivity)userActivityFromNotes;
- (PageLoadTestStatistics)pageLoadStatistics;
- (SFBrowserDocumentTrackerInfo)trackerInfo;
- (SFContentBlockerManager)contentBlockerManager;
- (SFDialogController)dialogController;
- (SFNavigationBarItem)navigationBarItem;
- (SFPinnableBanner)appBanner;
- (SFPrivateBrowsingPrivacyProtectionsBanner)privateBrowsingPrivacyProtectionsBanner;
- (SFQuickLookDocument)quickLookDocument;
- (SFReaderContext)readerContext;
- (SFScribbleController)sfScribbleController;
- (SFScribbleController)sfScribbleControllerIfLoaded;
- (SFTabStateData)tabStateData;
- (SFWebExtensionsController)webExtensionsController;
- (STBlockingViewController)associatedBlockingViewController;
- (TabBarItem)tabBarItem;
- (TabDocument)init;
- (TabDocument)initWithBrowserController:(id)a3;
- (TabDocument)initWithHibernatedTab:(id)a3;
- (TabDocument)initWithTabGroupTab:(id)a3 privateBrowsingEnabled:(BOOL)a4 hibernated:(BOOL)a5 bookmark:(id)a6 browserController:(id)a7;
- (TabDocument)initWithTabStateData:(id)a3 hibernated:(BOOL)a4 browserController:(id)a5;
- (TabDocument)initWithTitle:(id)a3 URL:(id)a4 UUID:(id)a5 privateBrowsingEnabled:(BOOL)a6 controlledByAutomation:(BOOL)a7 hibernated:(BOOL)a8 bookmark:(id)a9 browserController:(id)a10 relatedWebView:(id)a11;
- (TabDocument)initWithTitle:(id)a3 URL:(id)a4 UUID:(id)a5 privateBrowsingEnabled:(BOOL)a6 hibernated:(BOOL)a7 bookmark:(id)a8 browserController:(id)a9;
- (TabDocument)parentTabDocumentForBackClosesSpawnedTab;
- (TabDocument)retain;
- (TabDocumentCollectionItem)tabCollectionItem;
- (TabDocumentDelegate)delegate;
- (TabDocumentView)view;
- (TabOverviewItem)tabOverviewItem;
- (UIColor)themeColor;
- (UIEdgeInsets)_webView:(id)a3 finalObscuredInsetsForScrollView:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6;
- (UIFindInteraction)findInteraction;
- (UIWebClip)webClip;
- (UnifiedTabBarItem)currentUnifiedTabBarItem;
- (UnifiedTabBarItem)unifiedTabBarItem;
- (WBProfile)profile;
- (WBSBrowsingAssistantController)assistantController;
- (WBSCloudTab)cloudTab;
- (WBSFluidProgressState)progressState;
- (WBSHistoryContextController)contextController;
- (WBSHistoryVisit)lastVisit;
- (WBSPrivateBrowsingUserDefinedContentBlockerManager)privateBrowsingUserDefinedContentBlockerManager;
- (WBSSameDocumentNavigationToHistoryVisitCorrelator)sameDocumentNavigationToHistoryVisitCorrelator;
- (WBSScribbleQuirksManager)scribbleQuirksManager;
- (WBSSiriIntelligenceDonorPersonalizationData)personalizationData;
- (WBSSiriIntelligenceDonorTabData)tabDataForSpotlightDonation;
- (WBSTranslationContext)translationContext;
- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager;
- (WBSWebExtensionTabPosition)previousWebExtensionTabPosition;
- (WBSWebExtensionWindow)webExtensionWindow;
- (WBTab)tabGroupTab;
- (WBTab)wbTab;
- (WKBackForwardListItem)currentBackForwardListItem;
- (WKWebView)webViewForExtensions;
- (WebBookmark)readingListBookmark;
- (_BYTE)_loadingStateForWebExtensionsMayHaveChanged;
- (_BYTE)loadWebClip:(unsigned char *)a1 userDriven:(void *)a2;
- (_SFBrowserConfiguration)configuration;
- (_SFFormAutoFillController)autoFillController;
- (_SFInjectedJavaScriptController)activityJSController;
- (_SFPageLoadErrorController)pageLoadErrorController;
- (_SFPerSitePreferencesVendor)perSitePreferencesVendor;
- (_SFPrintController)printController;
- (_SFReloadOptionsController)reloadOptionsController;
- (_SFSafariSharingExtensionController)sharingExtensionController;
- (_SFSafeBrowsingController)safeBrowsingController;
- (_SFWebClipMetadataFetcher)webClipMetadataFetcher;
- (_SFWebView)activeWebView;
- (_SFWebView)frontWebView;
- (_SFWebView)readerWebView;
- (_SFWebView)webView;
- (_WKSessionState)sessionState;
- (double)_convertRectFromDocumentToWebView:(double)a3;
- (double)estimatedProgress;
- (double)idForWebExtensions;
- (double)lastActivationTime;
- (double)lastViewedTime;
- (double)pageZoomFactor;
- (id)URL;
- (id)URLForStatePersisting;
- (id)URLStringForPrintController:(id)a3;
- (id)_addTitlePrefixToString:(id *)a1;
- (id)_backForwardList;
- (id)_backListWithLimit:(uint64_t)a1;
- (id)_blankTabTitle;
- (id)_canDonateToCoreSpotlight;
- (id)_contentBlockerStatisticsStore;
- (id)_debugOverrideTitle;
- (id)_fileURLNavigationResultForURL:(void *)a1;
- (id)_forwardListWithLimit:(uint64_t)a1;
- (id)_initWithBrowserController:(id)a3 configuration:(id)a4;
- (id)_initWithTitle:(void *)a3 URL:(void *)a4 UUID:(uint64_t)a5 privateBrowsingEnabled:(uint64_t)a6 controlledByAutomation:(void *)a7 bookmark:(void *)a8 browserController:(void *)a9 createDocumentView:;
- (id)_loadRequest:(uint64_t)a1 userDriven:(void *)a2 shouldOpenExternalURLs:(uint64_t)a3;
- (id)_loadRequest:(uint64_t)a3 userDriven:(uint64_t)a4 shouldOpenExternalURLs:(void *)a5 eventAttribution:(char)a6 skipSyncableTabUpdates:;
- (id)_loadURL:(uint64_t)a3 userDriven:(void *)a4 eventAttribution:(char)a5 skipSyncableTabUpdates:;
- (id)_loadURLInternal:(uint64_t)a3 userDriven:;
- (id)_loadURLInternal:(uint64_t)a3 userDriven:(void *)a4 eventAttribution:(char)a5 skipSyncableTabUpdates:;
- (id)_loadedTitle;
- (id)_localAttributes;
- (id)_menuElementForBackForwardListItem:(void *)a1;
- (id)_presentingViewControllerForWebView:(id)a3;
- (id)_readingListArchiveNextPageLinkForRequest:(void *)a3 targetFrame:;
- (id)_removeParentChildTabDocumentRelations;
- (id)_requestBySettingAdvancedPrivacyProtectionsFlag:(void *)a1;
- (id)_resultOfLoadingRequest:(uint64_t)a3 inMainFrame:(int)a4 userInitiated:;
- (id)_startedLoadingResources;
- (id)_stoppedLoadingResources;
- (id)_tabDocumentsSharingWebProcess;
- (id)_titleForStatePersistingForTabGroupTab;
- (id)_titleForStatePersistingForTabStateData;
- (id)_titleIncludeLoading:(int)a3 allowURLStringFallback:;
- (id)_titleIncludeLoading:(int)a3 allowURLStringFallback:(int)a4 allowUntitled:;
- (id)_updateBarItemsWithCurrentMediaState;
- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6;
- (id)_webView:(id)a3 alternateURLFromImage:(id)a4 userInfo:(id *)a5;
- (id)_webView:(id)a3 contextMenuContentPreviewForElement:(id)a4;
- (id)_webViewAdditionalContextForStrongPasswordAssistance:(id)a3;
- (id)backListMenuWithLimit:(int)a3;
- (id)createTabDocumentView;
- (id)createWebViewConfiguration;
- (id)currentFluidProgressStateSource;
- (id)currentHostForScribbleController:(id)a3;
- (id)currentSavedAccountContextForFormAutoFillController:(id)a3;
- (id)customUserVisibleStringForReadingListBookmarkURL:(id)a3;
- (id)dataForDisplayedPDF;
- (id)dataForQuickLookDocument:(id)a3;
- (id)formAutoFillControllerURLForFormAutoFill:(id)a3;
- (id)forwardListMenuWithLimit:(int)a3;
- (id)initForBackgroundLoadingWithBrowserController:(id)a3 relatedWebView:(id)a4 webViewToCloneSessionStorageFrom:(id)a5;
- (id)itemForTabCollectionView:(id)a3;
- (id)linkAddedToUserActivityCallback;
- (id)linkPreviewHelper:(id)a3 previewViewControllerForURL:(id)a4;
- (id)linkPreviewHelper:(id)a3 resultOfLoadingURL:(id)a4;
- (id)loadRequest:(id)a3 userDriven:(BOOL)a4;
- (id)loadURL:(id)a3 userDriven:(BOOL)a4;
- (id)loadURL:(uint64_t)a3 userDriven:(char)a4 skipSyncableTabUpdates:;
- (id)loadingDialogPageTitleForPrintController:(id)a3;
- (id)openInTabGroupMenuWithNewTabGroupName:(id)a3 URL:(id)a4 descendantCount:(int64_t)a5 handler:(id)a6;
- (id)overlayContainerViewForScribbleController:(id)a3;
- (id)overrideUndoManagerForSFWebView:(id)a3;
- (id)pageLoadErrorControllerGetSecIdentityPreferencesController:(id)a3;
- (id)pageTitleForPrintController:(id)a3;
- (id)parentTabForWebExtensionContext:(id)a3;
- (id)pdfView;
- (id)pendingURLForWebExtensionContext:(id)a3;
- (id)permissionDialogThrottler;
- (id)presentingViewControllerForAction:(id)a3;
- (id)presentingViewControllerForPrintController:(id)a3;
- (id)previewViewControllerForURL:(id)a3;
- (id)profileIdentifier;
- (id)quickLookDocumentForCurrentBackForwardListItem;
- (id)readerPageArchiveURL;
- (id)readerURLForReaderController:(id)a3;
- (id)resultOfLoadingURL:(id)a3;
- (id)safariApplicationVersionForTranslationContext:(id)a3;
- (id)sfWebView:(id)a3 didStartDownload:(id)a4;
- (id)suggestedFileExtensionForQuickLookDocument:(id)a3;
- (id)suggestedFileNameForQuickLookDocument:(id)a3;
- (id)suggestedFilenameForDisplayedPDF;
- (id)tabDocumentForPreviewURL:(void *)a3 relatedToWebView:;
- (id)tabEntityUUIDForView:(id)a3;
- (id)tabUpdateBlock;
- (id)titleForSharing;
- (id)titleForWebExtensionContext:(id)a3;
- (id)topBarThemeForTabOverviewShowingThemeColor:(BOOL)a3;
- (id)translationConsentAlertHelperViewControllerToPresentDetailsFrom:(id)a3;
- (id)urlForWebExtensionContext:(id)a3;
- (id)webViewForWebExtensionContext:(id)a3;
- (id)windowForWebExtensionContext:(id)a3;
- (int)readingListBookmarkID;
- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4;
- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4;
- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4;
- (int64_t)dialogController:(id)a3 presentationPolicyForDialog:(id)a4;
- (int64_t)externalAppRedirectState;
- (int64_t)pageStatus;
- (int64_t)policy;
- (int64_t)readerViewTopScrollOffset;
- (uint64_t)_analyticsRecorderShouldIgnoreURLWithNavigationPolicy:(void *)a3 forNavigationAction:;
- (uint64_t)_canShowDownloadWithoutPrompting:(uint64_t)a1;
- (uint64_t)_createNewDocumentViewIfNecessaryForURL:(void *)a1;
- (uint64_t)_isNewDocumentViewNecessaryForURL:(void *)a1;
- (uint64_t)_loadBookmark:(uint64_t)a1;
- (uint64_t)_loadNextFallbackURLWithWebClip:(void *)a3 navigation:;
- (uint64_t)_loadSearchResultForQuery:(id *)a1;
- (uint64_t)_loadURL:(void *)a3 fromBookmark:;
- (uint64_t)_loadUserTypedAddress:(uint64_t)a1;
- (uint64_t)_setUpNavigationBarItem;
- (uint64_t)_shouldCleanUpAfterRedirectToExternalApp;
- (uint64_t)_shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:(uint64_t)result;
- (uint64_t)_shouldUpdateUsageTrackingWhenTransitioningToState:(uint64_t)a1;
- (uint64_t)_suppressReloadToPreventLoadingJavaScriptIfNecessary;
- (uint64_t)_terminateWebProcessAndReloadIfActive:(uint64_t)result;
- (uint64_t)_trySwitchingToPinnedTabOnNavigationToURL:(uint64_t)a1;
- (uint64_t)_usageStateIfTabDocumentIsCurrent:(uint64_t)a1;
- (uint64_t)isPageEligibileToShowNotSecureWarning;
- (uint64_t)pageLoadStatusForNavigationError:(uint64_t)a1;
- (unint64_t)_webView:(id)a3 willUpdateDataInteractionOperationToOperation:(unint64_t)a4 forSession:(id)a5;
- (unint64_t)autoFillFormType;
- (unint64_t)changedPropertiesForOnUpdatedWebExtensionEvent;
- (unint64_t)indexInWindowForWebExtensionContext:(id)a3;
- (unint64_t)mediaStateIcon;
- (unint64_t)mediaSuspensionReasons;
- (unint64_t)retainCount;
- (unint64_t)sessionStateRestorationSource;
- (unint64_t)webPageID;
- (unsigned)tabBarTitle;
- (void)_URLForWebExtensionsMayHaveChanged;
- (void)_activeParticipantsDidUpdateInTabWithUUID:(id *)a1;
- (void)_addNoFeedAppSupportAlert;
- (void)_attemptDeferredDropNavigation;
- (void)_authenticateForAutoFillIfNeeded;
- (void)_cancelFaviconUpdate;
- (void)_checkForAppLinkWithCompletion:(uint64_t)a1;
- (void)_checkForHighlight;
- (void)_clearAppBannerIfNotCurrentStoreBannerDeferringRemoval:(uint64_t)a1;
- (void)_clearCachedCanonicalURL;
- (void)_clearLibraryType;
- (void)_clearNavigationSource;
- (void)_closeTabDocumentAnimated:(BOOL)a3;
- (void)_commitPreviewedViewControllerInSafari:(id *)a1;
- (void)_completeRedirectToExternalNavigationResult:(uint64_t)a3 fromOriginalRequest:(uint64_t)a4 dialogResult:;
- (void)_createBrowserReaderViewIfNeeded;
- (void)_createDocumentViewRelatedTo:(void *)a1 webViewToCloneSessionStorageFrom:(void *)a2 websiteDataStore:(void *)a3 deferrableUserScriptsShouldWaitUntilNotification:(void *)a4;
- (void)_createDocumentViewWithConfiguration:(uint64_t)a1;
- (void)_destroyDocumentView;
- (void)_detectWebpageLocaleWithTextSamples:(void *)a3 url:;
- (void)_determineResultOfLoadingRequest:(uint64_t)a3 inMainFrame:(int)a4 userInitiated:(void *)a5 completionHandler:;
- (void)_didCommitPreviewViewController:(uint64_t)a1;
- (void)_didDecideNavigationPolicy:(void *)a3 forNavigationAction:;
- (void)_didDecideNavigationPolicy:(void *)a3 forNavigationResponse:;
- (void)_didFinishLoading;
- (void)_didUserInitiatedReload;
- (void)_disablePrivateRelaySetting:(uint64_t)a1;
- (void)_dismissSiriReaderMediaSession;
- (void)_displayAttributionBannerForHighlight:(unsigned __int8 *)a1;
- (void)_donateCurrentNavigationWithNavigationResponse:(id *)a1;
- (void)_donateCurrentPageLoad;
- (void)_donateTextAllowingDonationWithoutReaderText:(id *)a1;
- (void)_donateTextSoon;
- (void)_fireOnUpdatedExtensionEvent;
- (void)_fireOnUpdatedExtensionEventSoon;
- (void)_getAuthenticationForAutoFillController:(void *)a3 withCompletion:;
- (void)_hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary;
- (void)_internalWebView:(void *)a3 decidePolicyForNavigationAction:(void *)a4 preferences:(void *)a5 decisionHandler:;
- (void)_internalWebView:(void *)a3 decidePolicyForNavigationAction:(void *)a4 withResult:(uint64_t)a5 preferences:(void *)a6 decisionHandler:;
- (void)_loadActivityItemProviderIfNeeded;
- (void)_loadDeferredURLIfNeeded;
- (void)_loadExternalURL:(void *)a3 withIntent:;
- (void)_loadQueuedNavigation:(void *)a1;
- (void)_loadingControllerDidStartLoading;
- (void)_loadingControllerDidStopLoadingWithError:(uint64_t)a1;
- (void)_loadingControllerEstimatedProgressChangedTo:(uint64_t)a1;
- (void)_loadingControllerWillLoadRequest:(uint64_t)a3 webView:(int)a4 userDriven:;
- (void)_notifyDidUpdateTabCollectionItem;
- (void)_notifyImpressionAnalyticsRecorderIfNeededTabDocumentDidBecomeActive:(uint64_t)a1;
- (void)_openAppLinkInApp:(void *)a3 fromOriginalRequest:(uint64_t)a4 updateAppLinkStrategy:(void *)a5 webBrowserState:(void *)a6 completionHandler:;
- (void)_presentDialogToAllowDownload:(uint64_t)a3 allowViewAction:(void *)a4 completionHandler:;
- (void)_presentTranslationConsentAlertWithType:(void *)a3 completionHandler:;
- (void)_queueAlertForRedirectToExternalNavigationResult:(void *)a3 fromOriginalRequest:(void *)a4 navigationAction:(char)a5 isMainFrame:(uint64_t)a6 promptPolicy:(void *)a7 userAction:;
- (void)_redirectToExternalNavigationResult:(void *)a3 fromOriginalRequest:(void *)a4 navigationAction:(uint64_t)a5 promptPolicy:(uint64_t)a6 isMainFrame:(void *)a7 userAction:;
- (void)_reloadFromOrigin:(uint64_t)a1;
- (void)_searchEngineControllerDidFinishPopulating:(id)a3;
- (void)_sessionStateWithoutParentItem;
- (void)_setAppBannerWhenPainted:(uint64_t)a1;
- (void)_setDeferredNavigationURL:(void *)a3 title:;
- (void)_setIcon:(int)a3 isMonogram:;
- (void)_setReaderArticleSummary:(uint64_t)a1;
- (void)_setUp;
- (void)_showDownload:(void *)a3 path:;
- (void)_showFinanceKitOrderPreviewControllerWithURL:(void *)a3 dismissalHandler:;
- (void)_showPassBookControllerForPasses:(uint64_t)a1;
- (void)_showPerSitePreferencesPopoverViewControllerIfPossible;
- (void)_showPrivateBrowsingPrivacyProtectionsBannerForReload;
- (void)_startAppBannerRemovalTimer;
- (void)_terminateWebProcessIfNeededAndShowCrashBanner:(void *)a3 thenDo:;
- (void)_terminateWebProcessThenDoUnresponsiveWebProcessBlock;
- (void)_titleForWebExtensionsMayHaveChanged;
- (void)_translationAvailabilityDidChange:(id)a3;
- (void)_translationContextStateDidChange:(id)a3;
- (void)_unresponsiveWebProcessTimerFired:(id)a3;
- (void)_updateActiveExtensionsIfNecessary;
- (void)_updateFallbackURLsForUserTypedAddress:(char)a3 userExplicitlyRequestedAsHTTP:;
- (void)_updateFindCompletionProviderWithNumberOfMatches:(void *)a3 forString:;
- (void)_updateMaxVisibleHeightPercentageUserDriven:(id *)a1;
- (void)_updateNavigationBarItem;
- (void)_updatePageLoadDonorWithNavigationPolicy:(void *)a3 inMainFrameForNavigationAction:;
- (void)_updatePageZoomWithPreference;
- (void)_updateSnapshotForWebClip:(void *)a1;
- (void)_updateSnapshotIfNeeded;
- (void)_updateUsageTrackingInformationIfNecessaryToState:(uint64_t)a1;
- (void)_voiceSearchAvailabilityDidChange:(id)a3;
- (void)_webCryptoMasterKeyForWebView:(id)a3 completionHandler:(id)a4;
- (void)_webView:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5;
- (void)_webView:(id)a3 checkUserMediaPermissionForURL:(id)a4 mainFrameURL:(id)a5 frameIdentifier:(unint64_t)a6 decisionHandler:(id)a7;
- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6;
- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4;
- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5;
- (void)_webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6 completionHandler:(id)a7;
- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6;
- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5;
- (void)_webView:(id)a3 dataInteractionOperationWasHandled:(BOOL)a4 forSession:(id)a5 itemProviders:(id)a6;
- (void)_webView:(id)a3 decideDatabaseQuotaForSecurityOrigin:(id)a4 currentQuota:(unint64_t)a5 currentOriginUsage:(unint64_t)a6 currentDatabaseUsage:(unint64_t)a7 expectedUsage:(unint64_t)a8 decisionHandler:(id)a9;
- (void)_webView:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6;
- (void)_webView:(id)a3 didAdjustVisibilityWithSelectors:(id)a4;
- (void)_webView:(id)a3 didChangeLookalikeCharactersFromURL:(id)a4 toURL:(id)a5;
- (void)_webView:(id)a3 didChangeSafeAreaShouldAffectObscuredInsets:(BOOL)a4;
- (void)_webView:(id)a3 didCommitLoadWithRequest:(id)a4 inFrame:(id)a5;
- (void)_webView:(id)a3 didFailLoadDueToNetworkConnectionIntegrityWithURL:(id)a4;
- (void)_webView:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4;
- (void)_webView:(id)a3 didGeneratePageLoadTiming:(id)a4;
- (void)_webView:(id)a3 didNegotiateModernTLSForURL:(id)a4;
- (void)_webView:(id)a3 didResignInputElementStrongPasswordAppearanceWithUserInfo:(id)a4;
- (void)_webView:(id)a3 didStartInputSession:(id)a4;
- (void)_webView:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5;
- (void)_webView:(id)a3 hasVideoInPictureInPictureDidChange:(BOOL)a4;
- (void)_webView:(id)a3 imageOrMediaDocumentSizeChanged:(CGSize)a4;
- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5;
- (void)_webView:(id)a3 logDiagnosticMessage:(id)a4 description:(id)a5;
- (void)_webView:(id)a3 logDiagnosticMessage:(id)a4 description:(id)a5 valueDictionary:(id)a6;
- (void)_webView:(id)a3 logDiagnosticMessageWithDomain:(id)a4 domain:(int64_t)a5;
- (void)_webView:(id)a3 logDiagnosticMessageWithEnhancedPrivacy:(id)a4 description:(id)a5;
- (void)_webView:(id)a3 logDiagnosticMessageWithResult:(id)a4 description:(id)a5 result:(int64_t)a6;
- (void)_webView:(id)a3 logDiagnosticMessageWithValue:(id)a4 description:(id)a5 value:(id)a6;
- (void)_webView:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 mouseDidMoveOverElement:(id)a4 withFlags:(int64_t)a5 userInfo:(id)a6;
- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6;
- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5;
- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4;
- (void)_webView:(id)a3 printFrame:(id)a4;
- (void)_webView:(id)a3 queryPermission:(id)a4 forOrigin:(id)a5 completionHandler:(id)a6;
- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)_webView:(id)a3 requestGeolocationAuthorizationForURL:(id)a4 frame:(id)a5 decisionHandler:(id)a6;
- (void)_webView:(id)a3 requestStorageAccessPanelForDomain:(id)a4 underCurrentDomain:(id)a5 completionHandler:(id)a6;
- (void)_webView:(id)a3 requestUserMediaAuthorizationForDevices:(unint64_t)a4 url:(id)a5 mainFrameURL:(id)a6 decisionHandler:(id)a7;
- (void)_webView:(id)a3 requestWebAuthenticationConditionalMediationRegistrationForUser:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 storeAppHighlight:(id)a4 inNewGroup:(BOOL)a5 requestOriginatedInApp:(BOOL)a6;
- (void)_webView:(id)a3 takeFocus:(int64_t)a4;
- (void)_webView:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5;
- (void)_webView:(id)a3 willSnapshotBackForwardListItem:(id)a4;
- (void)_webView:(id)a3 willStartInputSession:(id)a4;
- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6;
- (void)_webView:(std::__shared_weak_count *)a1 willSubmitFormValues:userObject:submissionHandler:;
- (void)_webView:(std::__shared_weak_count *)this willSubmitFormValues:userObject:submissionHandler:;
- (void)_webView:(uint64_t)a1 willSubmitFormValues:userObject:submissionHandler:;
- (void)_webViewDidBeginNavigationGesture:(id)a3;
- (void)_webViewDidDisableInspectorBrowserDomain:(id)a3;
- (void)_webViewDidEnableInspectorBrowserDomain:(id)a3;
- (void)_webViewDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4;
- (void)_webViewDidEnterElementFullscreen:(id)a3;
- (void)_webViewDidEnterFullscreen:(id)a3;
- (void)_webViewDidExitElementFullscreen:(id)a3;
- (void)_webViewDidExitFullscreen:(id)a3;
- (void)_webViewFullscreenMayReturnToInline:(id)a3;
- (void)_webViewWebProcessDidCrash:(id)a3;
- (void)_webViewWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4;
- (void)_webViewWillEnterElementFullscreen:(id)a3;
- (void)_webViewWillExitElementFullscreen:(id)a3;
- (void)_willCommitPreviewViewController:(id *)a1;
- (void)activateForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)addAppHighlightCreatingLink:(BOOL)a3;
- (void)addMediaSuspensionReason:(unint64_t)a3;
- (void)addNavigationObserver:(id)a3;
- (void)addPassesViewControllerDidFinish:(id)a3;
- (void)addRenderingProgressObserver:(id)a3;
- (void)animateElement:(id)a3 toBarItem:(int64_t)a4;
- (void)animateElementToDownloadsBarItemSoon:(id)a3;
- (void)animateProgressForCompletedDocument;
- (void)applyHighlightFromNotesIfNeeded;
- (void)automaticPasswordSheetDismissed;
- (void)beginSuppressingProgressAnimation;
- (void)browsingAssistantController:(id)a3 didUpdateContentOptionsForURL:(id)a4;
- (void)browsingAssistantControllerDidReset:(id)a3;
- (void)browsingAssistantControllerDidUpdateUserConsentState:(id)a3;
- (void)clearBackForwardList;
- (void)clearBackForwardListKeepingCurrentItem;
- (void)clearBrowserController;
- (void)clearFindOnPageMatchesCounter;
- (void)clearFluidProgressState;
- (void)clearPageLoadStatistics;
- (void)clearReaderScrollInformation;
- (void)clearReaderView;
- (void)clearTabReuseURL;
- (void)close;
- (void)closeForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)collectReadingListItemInfo;
- (void)commitPreviewViewController:(id)a3;
- (void)copyCurrentStrongPassword;
- (void)createBrowserReaderViewIfNeeded;
- (void)createReaderWebViewForReaderController:(id)a3;
- (void)dealloc;
- (void)decreasePageZoomSetting;
- (void)detectWebpageLocaleForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)dialogController:(id)a3 didDismissDialog:(id)a4;
- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5;
- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5;
- (void)dialogController:(id)a3 willPresentDialog:(id)a4;
- (void)didActivateReader;
- (void)didAutoDetectSiteSpecificSearchProviderWithOriginatingURL:(id)a3 searchURLTemplate:(id)a4;
- (void)didFailToContinueUserActivity;
- (void)didFindAppBannerWithContent:(id)a3;
- (void)didFindSummarizationRestrictionsForReaderController:(id)a3;
- (void)didReplaceTabDocument:(id)a3;
- (void)dismissAppSuggestionBanner:(id)a3;
- (void)dismissAutoFillInternalFeedbackActivityForFormAutoFillController:(id)a3 immediately:(BOOL)a4;
- (void)dismissSiriReaderMediaSessionImmediately:(BOOL)a3;
- (void)dispatchNavigationIntent:(id)a3;
- (void)displayAttributionBannerForHighlightIfNeeded:(id)a3;
- (void)displayNewTabOverridePageIfNecessary;
- (void)donateCurrentNavigationWithNavigationResponse:(id)a3;
- (void)donateSameDocumentNavigationIfNecessary;
- (void)doneWaitingToContinueUserActivity;
- (void)downloadDidFail:(id)a3;
- (void)downloadDidFinish:(id)a3;
- (void)downloadDidStart:(id)a3;
- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4;
- (void)endSuppressingProgressAnimation;
- (void)endSuppressingProgressAnimationAnimated:(BOOL)a3;
- (void)evictFromTabReuse;
- (void)fetchCanonicalURLWithCompletionHandler:(id)a3;
- (void)fetchMetadataForBookmark:(id)a3 completion:(id)a4;
- (void)filteredArticleTextDidBecomeReadyForReaderController:(id)a3;
- (void)findOnPageCompletionProvider:(id)a3 setStringToComplete:(id)a4;
- (void)fluidProgressRocketAnimationDidComplete;
- (void)formAutoFillControllerDidFocusSensitiveFormField:(id)a3;
- (void)formAutoFillControllerGetAuthenticationForAutoFill:(id)a3 completion:(id)a4;
- (void)formAutoFillControllerUserChoseToUseGeneratedPassword:(id)a3;
- (void)freezeForNavigationGesture;
- (void)getApplicationManifestWithCompletionHandler:(id)a3;
- (void)goBack;
- (void)goBackAllowingNewTabToSpawnIfNeeded:(BOOL)a3;
- (void)goBackForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)goBackToParentTab;
- (void)goForward;
- (void)goForwardAllowingNewTabToSpawnIfNeeded:(BOOL)a3;
- (void)goForwardForWebExtensionContext:(id)a3 completionHandler:(id)a4;
- (void)goToBackForwardListItem:(id)a3;
- (void)handleNavigationIntent:(id)a3 completion:(id)a4;
- (void)hibernate;
- (void)hideBannerForHighlightIdentifier:(id)a3;
- (void)history;
- (void)increasePageZoomSetting;
- (void)indexTabToCoreSpotlight;
- (void)invalidateSourceApplication;
- (void)invalidateUserActivity;
- (void)keyboardWillHide:(id)a3;
- (void)linkPreviewHelper:(id)a3 addURLToReadingList:(id)a4;
- (void)linkPreviewHelper:(id)a3 commitPreviewViewControllerForAction:(int64_t)a4 withTabOrder:(int64_t)a5;
- (void)linkPreviewHelper:(id)a3 didProduceNavigationIntent:(id)a4 forAction:(int64_t)a5;
- (void)linkPreviewHelper:(id)a3 redirectToExternalNavigationResult:(id)a4;
- (void)linkPreviewHelperWillBeginDownload:(id)a3;
- (void)linkPreviewHelperWillDisableLinkPreview;
- (void)linkPreviewHelperWillOpenUniversalLinkLocally:(id)a3;
- (void)loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5;
- (void)loadCloudTab:(id)a3;
- (void)loadTestURL:(id)a3 withInjectedBundle:(BOOL)a4 withCallback:(id)a5;
- (void)loadTestURL:(id)a3 withInjectedBundle:(BOOL)a4 withCallback:(id)a5 pagesNeedingMemoryWarningSent:(id)a6;
- (void)loadURL:(id)a3;
- (void)loadURL:(id)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)loadURL:(id)a3 title:(id)a4 skipSyncableTabUpdates:(BOOL)a5;
- (void)loadURLForContinuousReadingList:(id)a3 fromBookmark:(id)a4;
- (void)loadWindowDotOpenExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4;
- (void)loadingController:(id)a3 willLoadRequest:(id)a4 webView:(id)a5 userDriven:(BOOL)a6;
- (void)loadingControllerWillStartUserDrivenLoad:(id)a3;
- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3;
- (void)mediaStateDidChangeNeedsDelay:(uint64_t)a1;
- (void)mute;
- (void)muteMediaCapture;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pageContextDataFetcherDidFinishFetching:(id)a3 forURL:(id)a4 withError:(id)a5;
- (void)pageLoadErrorController:(id)a3 allowLegacyTLSConnectionForURL:(id)a4 navigateToURL:(id)a5;
- (void)pageLoadErrorController:(id)a3 loadFailedRequestAfterError:(id)a4;
- (void)pageLoadErrorController:(id)a3 presentViewController:(id)a4;
- (void)pageLoadErrorControllerClosePage:(id)a3;
- (void)pageLoadErrorControllerDidAddAlert:(id)a3;
- (void)pageLoadErrorControllerReloadUsingHTTPSOnlyBypass:(id)a3;
- (void)pageLoadErrorControllerReloadWithoutPrivateRelay:(id)a3;
- (void)performAutoFillAction;
- (void)performPageLevelAutoFill;
- (void)prepareToContinueUserActivity;
- (void)prepareToUseReader;
- (void)presentAutoFillInternalFeedbackToastForFormAutoFillController:(id)a3 diagnosticsDataWithoutPageContents:(id)a4;
- (void)presentDialog:(id)a3 sender:(id)a4;
- (void)presentNextDialogIfNeeded;
- (void)printController:(id)a3 didCreatePrintInfo:(id)a4;
- (void)readerController:(id)a3 didClickLinkInReaderWithRequest:(id)a4;
- (void)readerController:(id)a3 didClickLinkRequestingNewWindowInReaderWithRequest:(id)a4;
- (void)readerController:(id)a3 didDeactivateReaderWithMode:(unint64_t)a4;
- (void)readerController:(id)a3 didDetermineAdditionalTextSamples:(id)a4 dueTo:(int64_t)a5;
- (void)readerController:(id)a3 didDetermineReaderAvailability:(id)a4 dueTo:(int64_t)a5;
- (void)readerController:(id)a3 didEncounterErrorForSummarization:(id)a4;
- (void)readerController:(id)a3 didExtractArticleText:(id)a4 withMetadata:(id)a5;
- (void)readerController:(id)a3 didFinishOnDemandSummarization:(id)a4;
- (void)readerController:(id)a3 didTwoFingerTapLinkInReaderWithContext:(id)a4;
- (void)release;
- (void)reload;
- (void)reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:(BOOL)a3;
- (void)reloadDisablingContentBlockers:(BOOL)a3;
- (void)reloadEnablingDowngradedPrivateRelay:(BOOL)a3;
- (void)reloadFromOrigin;
- (void)reloadFromOrigin:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)reloadFromOriginUserInitiated;
- (void)reloadUserInitiated;
- (void)removeAutomaticPasswordButton;
- (void)removeMediaSuspensionReason:(unint64_t)a3;
- (void)removeNavigationObserver:(id)a3;
- (void)removeRenderingProgressObserver:(id)a3;
- (void)replaceCurrentPasswordWithPassword:(id)a3;
- (void)resetPageZoomSetting;
- (void)resetPendingAutoFillInternalFeedbackToastDismissalTimer;
- (void)resetTabViewItems;
- (void)restoreAllHighlightsData;
- (void)restoreScrollPositionWithCloudTab:(id)a3;
- (void)restoreSessionState:(id)a3 andNavigate:(BOOL)a4;
- (void)restoreSessionState:(id)a3 andNavigate:(BOOL)a4 fromSafariViewService:(BOOL)a5;
- (void)restoreStateFromTab:(id)a3;
- (void)saveWebArchiveToPath:(id)a3 completion:(id)a4;
- (void)select;
- (void)sendEventsForAutoFillTelemetry;
- (void)setActive:(BOOL)a3;
- (void)setAllowsProgrammaticFocusToBeginInputSession:(BOOL)a3;
- (void)setAllowsRemoteInspection:(BOOL)a3;
- (void)setAppBanner:(id)a3;
- (void)setAppBannerRemovalWasDeferred:(BOOL)a3;
- (void)setAppSuggestionBanner:(id)a3 isPinned:(BOOL)a4;
- (void)setAssociatedBlockingViewController:(id)a3;
- (void)setBrowserController:(id)a3;
- (void)setBrowserController:(id)a3 afterTabGroupReuse:(BOOL)a4;
- (void)setChangedPropertiesForOnUpdatedWebExtensionEvent:(unint64_t)a3;
- (void)setClosed:(BOOL)a3;
- (void)setCustomUserAgent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayingStandaloneImage:(BOOL)a3;
- (void)setDisplayingStandaloneMedia:(BOOL)a3;
- (void)setExternalAppRedirectState:(int64_t)a3;
- (void)setHasBeenInserted:(BOOL)a3;
- (void)setHibernatedDueToMemoryWarning:(BOOL)a3;
- (void)setInitialURLForStatePersisting:(id)a3 title:(id)a4;
- (void)setInteractivelyInserted:(BOOL)a3;
- (void)setIsBlank:(BOOL)a3;
- (void)setIsNavigatingViaReloadWithoutPrivateRelay:(BOOL)a3;
- (void)setLastSearchTerm:(id)a3;
- (void)setLastSiriReaderSessionIdentifier:(id)a3;
- (void)setLastViewedTime:(double)a3;
- (void)setLastVisit:(id)a3;
- (void)setLibraryType:(id)a3;
- (void)setLinkAddedToUserActivityCallback:(id)a3;
- (void)setLinkPreviewViewController:(id)a3;
- (void)setLoadProgressObserver:(id)a3;
- (void)setMatchedLastSearch:(BOOL)a3;
- (void)setMediaCaptureEnabled:(BOOL)a3;
- (void)setMediaStateIcon:(uint64_t)a1;
- (void)setMediaSuspensionReasons:(unint64_t)a3;
- (void)setMuted:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setNeedsNewTabSnapshot;
- (void)setNeedsSendTelemetryForProvisionalLoad;
- (void)setNextLoadComesFromSearchPage:(BOOL)a3;
- (void)setOverlaidAccessoryViewsInset:(CGSize)a3;
- (void)setPageLoadStatistics:(id)a3;
- (void)setPageZoomFactor:(double)a3;
- (void)setParentTabDocumentForBackClosesSpawnedTab:(id)a3;
- (void)setPerformingFirstLoadAfterOpenInBackground:(BOOL)a3;
- (void)setPerformingRedirectAfterOpenInBackground:(BOOL)a3;
- (void)setPersistWhenHibernated:(BOOL)a3;
- (void)setPinned:(BOOL)a3;
- (void)setPinned:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setPinnedTitle:(id)a3;
- (void)setPinnedURL:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setPreparingForNewUserActivity:(BOOL)a3;
- (void)setPreviousWebExtensionTabPosition:(id)a3;
- (void)setQuickLookDocument:(id)a3;
- (void)setQuickLookDocumentForCurrentBackForwardListItem:(uint64_t)a1;
- (void)setReaderModeActive:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setReaderViewTopScrollOffset:(int64_t)a3;
- (void)setReadingListBookmark:(id)a3;
- (void)setScrollPoint:(CGPoint)a3;
- (void)setSearchableItemAttributes:(id)a3;
- (void)setSelected:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)setSessionStateRestorationSource:(unint64_t)a3;
- (void)setShareParticipants:(id)a3;
- (void)setShouldKeepIgnoredSiriSuggestedSitesOnLoad:(BOOL)a3;
- (void)setShouldRestoreReader:(BOOL)a3;
- (void)setShouldRevealAppLinkBannerForNextCommit:(BOOL)a3;
- (void)setShowingContinuous:(BOOL)a3;
- (void)setShowingReader:(BOOL)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setSourceApplicationBundleIdentifierForNextCommit:(id)a3;
- (void)setStoreBannersAreDisabled:(BOOL)a3;
- (void)setSupportsReuseForSpotlightSearch:(BOOL)a3;
- (void)setSuppressWebExtensionEvents:(BOOL)a3;
- (void)setSuppressingProgressAnimationForNavigationGesture:(BOOL)a3;
- (void)setTabGroupTab:(id)a3;
- (void)setTabReuseURL:(id)a3;
- (void)setTitleForLastSearch:(id)a3;
- (void)setTitleWords:(id)a3;
- (void)setURLFromExternalApplication:(id)a3;
- (void)setURLStringComponents:(id)a3;
- (void)setURLStringForLastSearch:(id)a3;
- (void)setUnifiedTabBarItem:(uint64_t)a1;
- (void)setUnread:(BOOL)a3;
- (void)setUpBackClosesSpawnedTabWithParent:(id)a3;
- (void)setUserActivityFromNotes:(id)a3;
- (void)setUuid:(id)a3;
- (void)setWBTab:(id)a3;
- (void)setWantsReaderWhenActivated:(BOOL)a3;
- (void)setWasOpenedFromLink:(BOOL)a3;
- (void)setWebClip:(uint64_t)a1;
- (void)setZoomFactor:(double)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5;
- (void)sfScribbleController:(id)a3 presentAlert:(id)a4;
- (void)sfScribbleControllerDidEndScribbling:(id)a3;
- (void)sfScribbleControllerDidStartScribbling:(id)a3;
- (void)sfScribbleControllerDidUpdateHiddenElementCount:(id)a3;
- (void)sfWebViewDidBecomeFirstResponder:(id)a3;
- (void)sfWebViewDidChangeSafeAreaInsets:(id)a3;
- (void)sfWebViewDidDismissFindOnPage:(id)a3;
- (void)sfWebViewDidEndFormControlInteraction:(id)a3;
- (void)sfWebViewDidStartFormControlInteraction:(id)a3;
- (void)showDownload:(id)a3;
- (void)showFindOnPage;
- (void)snapshotForWebClipIcon:(id)a3;
- (void)snapshotWithSize:(CGSize)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)snapshotWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)statusBarIndicatorTappedWithCompletionHandler:(id)a3;
- (void)stopAdvertisingProactiveActivityContent;
- (void)stopLoading;
- (void)stopLoadingUserInitiated;
- (void)tabGroupManager:(id)a3 didUpadateActiveParticipants:(id)a4 inTabWithUUID:(id)a5;
- (void)toggleMediaStateMuted;
- (void)toggleReader;
- (void)touchIconFetcher;
- (void)translationContext:(id)a3 shouldReportProgressInUnifiedField:(BOOL)a4;
- (void)translationContext:(id)a3 showFeedbackConsentAlertWithCompletionHandler:(id)a4;
- (void)translationContext:(id)a3 showFirstTimeConsentAlertWithCompletionHandler:(id)a4;
- (void)translationContext:(id)a3 showTranslationErrorAlertWithTitle:(id)a4 message:(id)a5;
- (void)translationContext:(id)a3 urlForCurrentPageWithCompletionHandler:(id)a4;
- (void)translationContextNeedsScrollHeightVisibilityUpdate:(id)a3;
- (void)translationContextReloadPageInOriginalLanguage:(id)a3;
- (void)translationContextWillRequestTranslatingWebpage:(id)a3;
- (void)unfreezeAfterNavigationGesture:(BOOL)a3;
- (void)unhibernate;
- (void)unmute;
- (void)updateAccessibilityIdentifier;
- (void)updateAncestryToChildOfTopLevelAncestorRelatedTab:(id)a3;
- (void)updateAncestryWithParentTab:(id)a3;
- (void)updateLockedBrowsingState;
- (void)updateMenuButtonShowsBadge;
- (void)updateReadingListItemPreviewText:(id)a3;
- (void)updateShowsSiriReaderPlayingIcon;
- (void)updateTabIcon;
- (void)updateTabIconWithDelay:(double)a3;
- (void)updateTabTitle;
- (void)updateThemeColorAndUnderPageBackground:(BOOL)a3;
- (void)updateUsageTrackingInformationAfterLinkPreviewDismissal;
- (void)updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:(BOOL)a3;
- (void)updateUserActivity;
- (void)updateUsesDarkTheme;
- (void)userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:(id)a3;
- (void)userDidManipulateVisibleRegion;
- (void)validateExtensionToolbarItems;
- (void)validateWebClip;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6;
- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webView:(id)a3 didCommitNavigation:(id)a4;
- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webView:(id)a3 navigationAction:(id)a4 didBecomeDownload:(id)a5;
- (void)webView:(id)a3 navigationResponse:(id)a4 didBecomeDownload:(id)a5;
- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6;
- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6;
- (void)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6 completionHandler:(id)a7;
- (void)webView:(id)a3 shouldLoadIconWithParameters:(id)a4 completionHandler:(id)a5;
- (void)webViewDidChangeSize;
- (void)webViewDidClose:(id)a3;
- (void)webViewDidIncreaseZoom;
- (void)webViewDidScroll;
- (void)willClose;
- (void)willDismissLinkPreviewViewController;
@end

@implementation TabDocument

- (BOOL)_tryRetain
{
  while (1)
  {
    int64_t retainCount = self->_retainCount;
    BOOL v3 = (retainCount & 1) != 0 || retainCount == -2;
    char v4 = !v3;
    if (v3)
    {
LABEL_10:
      LOBYTE(self) = v4;
      return (char)self;
    }
    if (retainCount <= -3) {
      break;
    }
    int64_t v5 = self->_retainCount;
    atomic_compare_exchange_strong(&self->_retainCount, (unint64_t *)&v5, retainCount + 2);
    if (v5 == retainCount) {
      goto LABEL_10;
    }
  }
  __break(1u);
  return (char)self;
}

- (BOOL)_isDeallocating
{
  int64_t retainCount = self->_retainCount;
  if (retainCount == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (retainCount <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = retainCount & 1;
  }
  return (char)self;
}

- (TabDocumentView)view
{
  cachedView = self->_cachedView;
  if (!cachedView)
  {
    char v4 = [(TabDocument *)self createTabDocumentView];
    int64_t v5 = self->_cachedView;
    self->_cachedView = v4;

    [(TabDocument *)self updateAccessibilityIdentifier];
    [(TabDocumentView *)self->_cachedView setReaderWebView:self->_readerWebView];
    [(TabDocumentView *)self->_cachedView setWebView:self->_webView];
    [(TabDocumentView *)self->_cachedView safari_setTabEntityProviderWithInfoProvider:self];
    cachedView = self->_cachedView;
  }
  return cachedView;
}

- (SFWebExtensionsController)webExtensionsController
{
  BOOL v3 = +[Application sharedApplication];
  uint64_t v4 = [(_SFBrowserConfiguration *)self->_configuration isPrivateBrowsingEnabled];
  int64_t v5 = [(TabDocument *)self profile];
  v6 = [v3 webExtensionsControllerForTabWithPrivateBrowsingEnabled:v4 profile:v5];

  return (SFWebExtensionsController *)v6;
}

- (WBProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v3 = [WeakRetained effectiveProfile];

  return (WBProfile *)v3;
}

- (id)_titleIncludeLoading:(int)a3 allowURLStringFallback:(int)a4 allowUntitled:
{
  if (a1)
  {
    int64_t v5 = *(void **)(a1 + 192);
    if (v5)
    {
      v6 = objc_msgSend(v5, "safari_userVisibleHost");
      goto LABEL_19;
    }
    v6 = -[TabDocument _loadedTitle]((id *)a1);
    if (![v6 length])
    {
      if ([*(id *)(a1 + 1032) isLoading] & a2) {
        goto LABEL_9;
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
      v11 = [WeakRetained userActivityController];
      v12 = [v11 tabDocumentPendingUserActivityPayload];

      if (v12 == (void *)a1)
      {
LABEL_9:
        _WBSLocalizedString();
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        v6 = v17;
        goto LABEL_19;
      }
      v13 = [*(id *)(a1 + 1032) _committedURL];
      if (objc_msgSend(v13, "safari_isSafariWebExtensionURL"))
      {
        v14 = [(id)a1 webExtensionsController];
        v15 = [v13 host];
        v16 = [v14 webExtensionForBaseURIHost:v15];
        v17 = [v16 displayName];
      }
      else
      {
        if (!a3
          || ([(id)a1 URLString], v18 = objc_claimAutoreleasedReturnValue(), (v14 = v18) == 0))
        {
          if (a4)
          {
            -[TabDocument _blankTabTitle]((void *)a1);
            v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = &stru_1F3C268E8;
          }
          goto LABEL_17;
        }
        objc_msgSend(v18, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", URLSimplificationOptionsForTabTitle, 1, 0);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

LABEL_17:
      goto LABEL_18;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_19:
  return v6;
}

- (id)_loadedTitle
{
  if (a1)
  {
    if ([a1[104] length])
    {
      id v2 = a1[104];
    }
    else
    {
      id v2 = [a1[21] title];
    }
    BOOL v3 = v2;
    if ([v2 length])
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      char v5 = [v4 BOOLForKey:@"DebugOverrideTabTitleWithMatchingBookmark"];

      if (v5)
      {
        v6 = -[TabDocument _debugOverrideTitle](a1);
        if ([v6 length]) {
          v7 = v6;
        }
        else {
          v7 = v3;
        }
        id v8 = v7;

        v9 = v3;
        BOOL v3 = v8;
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = v3;
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (void)release
{
  uint64_t add = atomic_fetch_add(&self->_retainCount, 0xFFFFFFFFFFFFFFFELL);
  if (add > 0) {
    return;
  }
  if (add < 0) {
    goto LABEL_14;
  }
  int v4 = __30__TabDocument_NonARC__release__block_invoke();
  if (v4 == -1) {
    return;
  }
  uint64_t v5 = -2;
  atomic_compare_exchange_strong(&self->_retainCount, (unint64_t *)&v5, 1uLL);
  if (v5 != -2) {
    goto LABEL_14;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      [(TabDocument *)self dealloc];
      return;
    }
LABEL_14:
    __break(1u);
    return;
  }
  v6 = MEMORY[0x1E4F14428];
  v7 = (void (__cdecl *)(void *))MEMORY[0x1E4FBA8B8];
  dispatch_barrier_async_f(v6, self, v7);
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (TabDocument)retain
{
  if ((uint64_t)atomic_fetch_add(&self->_retainCount, 2uLL) <= -3) {
    __break(1u);
  }
  return self;
}

- (id)_blankTabTitle
{
  if (a1)
  {
    id v2 = objc_opt_class();
    BOOL v3 = [a1 libraryType];
    int v4 = objc_msgSend(v2, "blankTabTitleWithLibraryType:controlledByAutomation:", v3, objc_msgSend(a1, "isControlledByAutomation"));
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (NSString)libraryType
{
  return self->_libraryType;
}

+ (id)blankTabTitleWithLibraryType:(id)a3 controlledByAutomation:(BOOL)a4
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4) {
    startPageTitleForCollectionType(v4);
  }
  else {
  v6 = _WBSLocalizedString();
  }

  return v6;
}

- (BOOL)isControlledByAutomation
{
  return [(_SFBrowserConfiguration *)self->_configuration isControlledByAutomation];
}

- (_SFReloadOptionsController)reloadOptionsController
{
  return self->_reloadOptionsController;
}

- (id)_addTitlePrefixToString:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v5 = [v4 BOOLForKey:@"DebugShowTabMetadata"];
    int v6 = [v4 BOOLForKey:*MEMORY[0x1E4F99118]];
    if ((v5 | v6))
    {
      v7 = [MEMORY[0x1E4F1CA48] array];
      if (v5)
      {
        id v8 = a1[129];
        v9 = v8;
        if (v8)
        {
          v10 = objc_msgSend(NSString, "stringWithFormat:", @"p%d", objc_msgSend(v8, "_webProcessIdentifier"));
          [v7 addObject:v10];
        }
        else
        {
          [v7 addObject:@"p?"];
        }
      }
      if (v6)
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 120);
        v13 = [WeakRetained tabController];
        v14 = [v13 tabOrderManager];

        v15 = [a1 identifier];
        v16 = [v14 simplifiedIdentifierForDisplayInTabTitle:v15];

        v17 = [a1 ancestorTabIdentifiers];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __39__TabDocument__addTitlePrefixToString___block_invoke;
        v25[3] = &unk_1E6D7D5A8;
        id v18 = v14;
        id v26 = v18;
        v19 = objc_msgSend(v17, "safari_mapObjectsUsingBlock:", v25);

        v20 = [v19 componentsJoinedByString:@","];
        v21 = [NSString stringWithFormat:@"t%@ {%@}", v16, v20];
        [v7 addObject:v21];
      }
      uint64_t v22 = [v7 componentsJoinedByString:@" "];

      id v11 = v3;
      id v3 = (id)v22;
    }
    else
    {
      id v11 = 0;
    }
    v23 = v3;

    id v3 = v11;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)createTabDocumentView
{
  id v2 = objc_alloc_init(TabDocumentView);
  return v2;
}

- (void)setIsBlank:(BOOL)a3
{
  if (self->_isBlank != a3)
  {
    self->_isBlank = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if (self->_isBlank)
    {
      BOOL v4 = 0;
    }
    else
    {
      -[TabDocument _clearLibraryType]((uint64_t)self);
      [WeakRetained updateFocusForTab:self webViewCanTakeFocus:1];
      BOOL v4 = !self->_isBlank;
    }
    [(SFNavigationBarItem *)self->_navigationBarItem setShowsStopReloadButtons:v4];
    if (self->_hasBeenInserted)
    {
      int v5 = [WeakRetained tabController];
      [v5 updateLocalTabGroupTitle];
    }
  }
}

- (void)setHasBeenInserted:(BOOL)a3
{
  self->_hasBeenInserted = a3;
}

- (TabDocument)initWithTitle:(id)a3 URL:(id)a4 UUID:(id)a5 privateBrowsingEnabled:(BOOL)a6 hibernated:(BOOL)a7 bookmark:(id)a8 browserController:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  v20 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:](self, "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", v15, v16, v17, v11, [v19 isControlledByAutomation], v10, v18, v19, 0);

  return v20;
}

- (TabDocument)initWithTitle:(id)a3 URL:(id)a4 UUID:(id)a5 privateBrowsingEnabled:(BOOL)a6 controlledByAutomation:(BOOL)a7 hibernated:(BOOL)a8 bookmark:(id)a9 browserController:(id)a10 relatedWebView:(id)a11
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v27 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  if (a8)
  {
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v22 = v28;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __137__TabDocument_initWithTitle_URL_UUID_privateBrowsingEnabled_controlledByAutomation_hibernated_bookmark_browserController_relatedWebView___block_invoke;
    v28[3] = &unk_1E6D791E8;
    id v26 = (id *)&v29;
    v29 = self;
    v25 = &v30;
    id v30 = v21;
  }
  v23 = (TabDocument *)-[TabDocument _initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:bookmark:browserController:createDocumentView:](self, v27, v17, v18, v13, v12, v19, v20, v22);
  if (!a8)
  {
  }
  return v23;
}

- (WBSFluidProgressState)progressState
{
  return self->_fluidProgressState;
}

- (SFScribbleController)sfScribbleControllerIfLoaded
{
  return self->_sfScribbleController;
}

- (UnifiedTabBarItem)unifiedTabBarItem
{
  return self->_unifiedTabBarItem;
}

- (TabBarItem)tabBarItem
{
  return self->_tabBarItem;
}

- (void)updateThemeColorAndUnderPageBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v5 = [(TabDocument *)self activeWebView];
  int v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v6 BOOLForKey:*MEMORY[0x1E4F786D0]])
  {

    goto LABEL_4;
  }
  v7 = [WeakRetained tabBarManager];
  uint64_t v8 = [v7 displayMode];

  if (v8 == 2)
  {
LABEL_4:
    v9 = [WeakRetained rootViewController];
    char v10 = [v9 isInYttriumState];

    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (![(TabDocument *)self isShowingSystemStartPage]
    && ![(TabDocument *)self isPDFDocument]
    && ![(_SFBrowserConfiguration *)self->_configuration isControlledByAutomation]&& ![(TabDocument *)self inElementFullscreen])
  {
    BOOL v12 = [WeakRetained rootViewController];
    if ([v12 usingLoweredBar])
    {
      BOOL v13 = 0;
    }
    else
    {
      v14 = [(_SFBrowserConfiguration *)self->_configuration traitEnvironment];
      id v15 = [v14 traitCollection];
      BOOL v13 = [v15 userInterfaceStyle] == 2;
    }
    id v16 = [MEMORY[0x1E4F98F20] updateThemeColorForWebView:v5 darkModeEnabled:v13 allowFallbackColors:1 updateUnderPageBackgroundColor:v3];
    themeColor = self->_themeColor;
    self->_themeColor = v16;
    goto LABEL_9;
  }
LABEL_8:
  [v5 setUnderPageBackgroundColor:0];
  themeColor = self->_themeColor;
  self->_themeColor = 0;
LABEL_9:
}

- (_SFWebView)activeWebView
{
  if ([(TabDocument *)self isShowingReader]) {
    [(TabDocument *)self readerWebView];
  }
  else {
  BOOL v3 = [(TabDocument *)self webView];
  }
  return (_SFWebView *)v3;
}

- (_SFWebView)webView
{
  return self->_webView;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (NSString)uuidString
{
  return [(NSUUID *)self->_uuid UUIDString];
}

- (WBTab)tabGroupTab
{
  return self->_tabGroupTab;
}

- (void)updateAccessibilityIdentifier
{
  v14[6] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v13[0] = @"UUID";
  BOOL v4 = [(NSUUID *)self->_uuid UUIDString];
  v14[0] = v4;
  v13[1] = @"IsPrivate";
  if ([(TabDocument *)self isPrivateBrowsingEnabled]) {
    int v5 = @"true";
  }
  else {
    int v5 = @"false";
  }
  if (self->_didFirstLayout) {
    int v6 = @"true";
  }
  else {
    int v6 = @"false";
  }
  v14[1] = v5;
  v14[2] = v6;
  v13[2] = @"IsPageLoaded";
  v13[3] = @"InReaderMode";
  if ([WeakRetained isShowingReader]) {
    v7 = @"true";
  }
  else {
    v7 = @"false";
  }
  v14[3] = v7;
  v13[4] = @"WebViewProcessID";
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", (int)-[_SFWebView _webProcessIdentifier](self->_webView, "_webProcessIdentifier"));
  v14[4] = v8;
  v13[5] = @"IsLoadedUsingDesktopUserAgent";
  if ([(_SFReloadOptionsController *)self->_reloadOptionsController loadedUsingDesktopUserAgent])v9 = @"true"; {
  else
  }
    v9 = @"false";
  v14[5] = v9;
  char v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];
  BOOL v11 = WBSMakeAccessibilityIdentifier();
  [(TabDocumentView *)self->_cachedView setAccessibilityIdentifier:v11];

  BOOL v12 = [WeakRetained rootViewController];
  [v12 updateAccessibilityIdentifier];
}

- (BOOL)isSecure
{
  if (![(_SFWebView *)self->_webView hasOnlySecureContent]
    || (objc_opt_respondsToSelector() & 1) != 0
    && ([(_SFWebView *)self->_webView _negotiatedLegacyTLS] & 1) != 0)
  {
    return 0;
  }
  BOOL v4 = [(LoadingController *)self->_loadingController URL];
  int v5 = [(_SFWebView *)self->_webView _committedURL];
  char v3 = [v4 isEqual:v5];

  return v3;
}

- (BOOL)isBlank
{
  return self->_isBlank;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (SFNavigationBarItem)navigationBarItem
{
  navigationBarItem = self->_navigationBarItem;
  if (!navigationBarItem)
  {
    BOOL v4 = (SFNavigationBarItem *)objc_alloc_init(MEMORY[0x1E4F782E8]);
    int v5 = self->_navigationBarItem;
    self->_navigationBarItem = v4;

    -[TabDocument _setUpNavigationBarItem]((uint64_t)self);
    [(LoadingController *)self->_loadingController estimatedProgress];
    BOOL v7 = v6 < 1.0 && v6 > 0.0;
    [(SFNavigationBarItem *)self->_navigationBarItem setStopReloadButtonShowsStop:v7];
    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
    [(SFNavigationBarItem *)self->_navigationBarItem setShowsStopReloadButtons:!self->_isBlank];
    navigationBarItem = self->_navigationBarItem;
  }
  uint64_t v8 = navigationBarItem;
  return v8;
}

- (void)_voiceSearchAvailabilityDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F78500], "sharedManager", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarItem setShowsVoiceSearchButton:](self->_navigationBarItem, "setShowsVoiceSearchButton:", [v4 availability] != 0);
}

- (uint64_t)_setUpNavigationBarItem
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 280) setFluidProgressController:*(void *)(result + 176)];
    [*(id *)(v1 + 280) setFluidProgressStateSource:v1];
    id v2 = *(void **)(v1 + 1072);
    if (v2) {
      [v2 setNavigationBarItem:*(void *)(v1 + 280)];
    }
    char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v1 selector:sel__voiceSearchAvailabilityDidChange_ name:*MEMORY[0x1E4F78868] object:0];

    return [(id)v1 _voiceSearchAvailabilityDidChange:0];
  }
  return result;
}

+ (id)tabDocumentForWKWebView:(id)a3
{
  id v3 = a3;
  id v4 = webViewToTabDocumentMap();
  int v5 = [v4 objectForKey:v3];

  return v5;
}

- (BOOL)inElementFullscreen
{
  if ([(TabDocument *)self isExitingElementFullscreen]) {
    return 1;
  }
  webView = self->_webView;
  return [(_SFWebView *)webView _isInFullscreen];
}

- (BOOL)isExitingElementFullscreen
{
  return self->_exitingElementFullscreen;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isInteractivelyInserted
{
  return self->_interactivelyInserted;
}

- (unint64_t)mediaStateIcon
{
  return self->_cachedMediaStateIcon;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (BOOL)isShowingSystemStartPage
{
  if (self->_isBlank && ![(TabDocument *)self isLoading]) {
    return ![(TabDocument *)self isShowingStartPageOverriddenByExtension];
  }
  else {
    return 0;
  }
}

- (BOOL)isLoading
{
  return self->_webViewIsLoading;
}

- (void)updateTabTitle
{
  id v9 = [(TabDocumentCollectionItem *)self->_tabCollectionItem title];
  if (self->_displayingStandaloneImage)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)self, 0, 1, 1);
  }
  id v4 = -[TabDocument _addTitlePrefixToString:]((id *)&self->super.isa, v3);

  [(TabOverviewItem *)self->_tabOverviewItem setTitle:v4];
  [(TabDocumentCollectionItem *)self->_tabCollectionItem setTitle:v4];
  int v5 = -[TabDocument tabBarTitle]((unsigned __int8 *)self);
  float v6 = -[TabDocument _addTitlePrefixToString:]((id *)&self->super.isa, v5);

  [(TabBarItem *)self->_tabBarItem setTitle:v6];
  [(UnifiedTabBarItem *)self->_unifiedTabBarItem setTitle:v6];
  linkPreviewViewController = self->_linkPreviewViewController;
  uint64_t v8 = [(TabDocument *)self URLString];
  [(LinkPreviewViewController *)linkPreviewViewController updatePreviewLoadingUIWithURLString:v8];

  -[TabDocument _titleForWebExtensionsMayHaveChanged](self);
  -[TabDocument _URLForWebExtensionsMayHaveChanged]((id *)&self->super.isa);
  if ((WBSIsEqual() & 1) == 0) {
    -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)&self->super.isa);
  }
}

- (unsigned)tabBarTitle
{
  if (a1)
  {
    -[TabDocument _titleIncludeLoading:allowURLStringFallback:](a1, 1, a1[703]);
    a1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_titleIncludeLoading:(int)a3 allowURLStringFallback:
{
  if (a1)
  {
    a1 = -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)a1, a2, a3, 1);
    uint64_t v3 = vars8;
  }
  return a1;
}

- (void)_titleForWebExtensionsMayHaveChanged
{
  if (a1)
  {
    id v4 = [a1 tabTitle];
    if (v4 != (id)a1[177] && (objc_msgSend(v4, "isEqualToString:") & 1) == 0)
    {
      uint64_t v2 = [v4 copy];
      uint64_t v3 = (void *)a1[177];
      a1[177] = v2;

      objc_msgSend(a1, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", objc_msgSend(a1, "changedPropertiesForOnUpdatedWebExtensionEvent") | 1);
    }
  }
}

- (NSString)tabTitle
{
  uint64_t v2 = self;
  if ([(TabDocument *)self isHibernated]) {
    uint64_t v2 = (TabDocument *)v2->_loadingController;
  }
  uint64_t v3 = [(TabDocument *)v2 title];
  return (NSString *)v3;
}

- (NSURL)urlForExtensions
{
  if ([(TabDocument *)self isHibernated]) {
    [(LoadingController *)self->_loadingController URL];
  }
  else {
  uint64_t v3 = [(TabDocument *)self expectedOrCurrentURL];
  }
  return (NSURL *)v3;
}

- (BOOL)isHibernated
{
  return self->_hibernated;
}

- (void)_URLForWebExtensionsMayHaveChanged
{
  if (a1)
  {
    id obj = [a1 urlForExtensions];
    id v2 = a1[178];
    if ((WBSIsEqual() & 1) == 0)
    {
      objc_storeStrong(a1 + 178, obj);
      objc_msgSend(a1, "setChangedPropertiesForOnUpdatedWebExtensionEvent:", objc_msgSend(a1, "changedPropertiesForOnUpdatedWebExtensionEvent") | 2);
      [a1 validateExtensionToolbarItems];
    }
  }
}

- (unint64_t)changedPropertiesForOnUpdatedWebExtensionEvent
{
  return self->_changedPropertiesForOnUpdatedWebExtensionEvent;
}

- (BOOL)inWebClipScope
{
  webClip = self->_webClip;
  uint64_t v3 = [(TabDocument *)self URL];
  LOBYTE(webClip) = [(UIWebClip *)webClip safari_isURLWithinNavigationScope:v3];

  return (char)webClip;
}

- (NSString)title
{
  return (NSString *)-[TabDocument _titleIncludeLoading:allowURLStringFallback:](self, 1, 0);
}

- (BOOL)shouldObscureForDigitalHealth
{
  return [(TabDocument *)self policy] != 0;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)displayNewTabOverridePageIfNecessary
{
  if (![(TabDocument *)self isPrivateBrowsingEnabled]) {
    goto LABEL_3;
  }
  id v7 = [(TabDocument *)self webExtensionsController];
  uint64_t v3 = [v7 tabOverridePreferencesManager];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  char v5 = [v3 shouldNewTabPageOverriddenByAnEnabledExtensionApplyInPrivateBrowsingWithUserDefaults:v4];

  if (v5)
  {
LABEL_3:
    extensionOverridenStartPageURLForTab(self);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8) {
      id v6 = [(TabDocument *)self loadURL:v8 userDriven:0];
    }
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:(BOOL)a3
{
  uint64_t v4 = -[TabDocument _usageStateIfTabDocumentIsCurrent:]((uint64_t)self, a3);
  -[TabDocument _updateUsageTrackingInformationIfNecessaryToState:]((uint64_t)self, v4);
}

- (uint64_t)_usageStateIfTabDocumentIsCurrent:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    char v5 = WeakRetained;
    if (a2 && ([WeakRetained isSuspendedOrSuspending] & 1) == 0)
    {
      uint64_t v2 = 2;
    }
    else
    {
      id v6 = [v5 tabDocumentPlayingPIPVideo];
      uint64_t v2 = 2 * (v6 == (void *)v2);
    }
  }
  return v2;
}

- (void)_updateUsageTrackingInformationIfNecessaryToState:(uint64_t)a1
{
  if (a1 && -[TabDocument _shouldUpdateUsageTrackingWhenTransitioningToState:](a1, a2))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    uint64_t v4 = [(id)a1 expectedOrCurrentURL];
    char v5 = -[TabDocument profileIdentifier](a1);
    if (*(void *)(a1 + 240) && (objc_msgSend(v4, "isEqual:") & 1) == 0)
    {
      id v6 = [WeakRetained digitalHealthManager];
      uint64_t v7 = *(void *)(a1 + 240);
      id v8 = [(id)a1 sourceApplicationBundleIdentifier];
      [v6 updateUsageTrackingForURL:v7 withBundleIdentifier:v8 profileIdentifier:v5 toState:0];
    }
    *(void *)(a1 + 232) = a2;
    objc_storeStrong((id *)(a1 + 240), v4);
    id v9 = [WeakRetained digitalHealthManager];
    char v10 = [(id)a1 sourceApplicationBundleIdentifier];
    [v9 updateUsageTrackingForURL:v4 withBundleIdentifier:v10 profileIdentifier:v5 toState:a2];
  }
}

- (uint64_t)_shouldUpdateUsageTrackingWhenTransitioningToState:(uint64_t)a1
{
  uint64_t v3 = a1;
  if (a1)
  {
    char v5 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
    id v6 = [(id)v3 expectedOrCurrentURL];
    if (([(id)v3 isPrivateBrowsingEnabled] & 1) != 0
      || ([(id)v3 isShowingErrorPage] & 1) != 0)
    {
      uint64_t v3 = 0;
LABEL_20:

      return v3;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 1216));
    char v8 = [WeakRetained tabDocumentIsBackgroundPreloading:v3];
    if (v6) {
      char v9 = v8;
    }
    else {
      char v9 = 1;
    }
    if (v9)
    {
      uint64_t v3 = 0;
    }
    else
    {
      int v10 = [v5 isWebFilterEnabled];
      if (v10
        && ([v5 userSettings],
            uint64_t v2 = objc_claimAutoreleasedReturnValue(),
            ![v2 contentFilterListsAllowURL:v6]))
      {
        uint64_t v3 = 0;
      }
      else
      {
        if (*(void *)(v3 + 232) == a2) {
          int v11 = [v6 isEqual:*(void *)(v3 + 240)];
        }
        else {
          int v11 = 0;
        }
        uint64_t v3 = v11 ^ 1u;
        if (!v10) {
          goto LABEL_19;
        }
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  return v3;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return [(_SFBrowserConfiguration *)self->_configuration isPrivateBrowsingEnabled];
}

- (NSURL)expectedOrCurrentURL
{
  return (NSURL *)[(_SFWebView *)self->_webView URL];
}

- (id)titleForSharing
{
  if ([(TabDocument *)self isShowingErrorPage])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)self, 0, 0, 0);
  }
  return v3;
}

- (BOOL)isShowingErrorPage
{
  BOOL v3 = [(TabDocument *)self hasQuickLookContent];
  if (!v3)
  {
    uint64_t v4 = [(_SFWebView *)self->_webView _unreachableURL];
    if (v4)
    {
      BOOL v5 = 1;
LABEL_9:

      return v5;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(_SFWebView *)self->_webView _safeBrowsingWarning];
    BOOL v5 = v6 != 0;

    if (v3) {
      return v5;
    }
    goto LABEL_8;
  }
  BOOL v5 = 0;
  if (!v3)
  {
LABEL_8:
    uint64_t v4 = 0;
    goto LABEL_9;
  }
  return v5;
}

- (BOOL)hasQuickLookContent
{
  uint64_t v2 = [(TabDocument *)self quickLookDocument];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SFQuickLookDocument)quickLookDocument
{
  BOOL quickLookDocumentCheckCompleted = self->_quickLookDocumentCheckCompleted;
  quickLookDocument = self->_quickLookDocument;
  if (!quickLookDocumentCheckCompleted && quickLookDocument == 0)
  {
    self->_BOOL quickLookDocumentCheckCompleted = 1;
    id v6 = [(SFQuickLookDocumentWriter *)self->_quickLookDocumentWriter quickLookDocument];
    uint64_t v7 = self->_quickLookDocument;
    self->_quickLookDocument = v6;

    char v8 = self->_quickLookDocument;
    if (!v8
      || (-[TabDocument setQuickLookDocumentForCurrentBackForwardListItem:]((uint64_t)self, v8),
          (char v9 = self->_quickLookDocument) == 0))
    {
      if ([(TabDocument *)self isPDFDocument])
      {
        int v10 = [(TabDocument *)self suggestedFilenameForDisplayedPDF];
        id v11 = objc_alloc(MEMORY[0x1E4F78328]);
        BOOL v12 = (SFQuickLookDocument *)[v11 initWithFileName:v10 mimeType:0 uti:*MEMORY[0x1E4F22668] needsQuickLookDocumentView:0];
        BOOL v13 = self->_quickLookDocument;
        self->_quickLookDocument = v12;
      }
      char v9 = self->_quickLookDocument;
      if (!v9)
      {
        -[TabDocument quickLookDocumentForCurrentBackForwardListItem]((uint64_t)self);
        v14 = (SFQuickLookDocument *)objc_claimAutoreleasedReturnValue();
        id v15 = self->_quickLookDocument;
        self->_quickLookDocument = v14;

        char v9 = self->_quickLookDocument;
      }
    }
    id v16 = [(TabDocument *)self urlForSharing];
    [(SFQuickLookDocument *)v9 setSourceURL:v16];

    [(SFQuickLookDocument *)self->_quickLookDocument setDocumentSource:self];
    quickLookDocument = self->_quickLookDocument;
  }
  return quickLookDocument;
}

- (NSURL)urlForSharing
{
  BOOL v3 = [(TabDocument *)self URL];
  uint64_t v4 = [(TabDocument *)self customUserVisibleStringForReadingListBookmarkURL:v3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

    BOOL v3 = (void *)v5;
  }

  id v6 = [(TabDocument *)self titleForSharing];
  if (v6) {
    [v3 _setTitle:v6];
  }

  return (NSURL *)v3;
}

- (NSString)URLString
{
  if (self->_webView
    && ([(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator UIShouldReflectCommittedURLInsteadOfCurrentURL] & 1) != 0)
  {
    uint64_t v3 = [(_SFWebView *)self->_webView _committedURL];
  }
  else
  {
    uint64_t v3 = [(LoadingController *)self->_loadingController URL];
  }
  uint64_t v4 = (void *)v3;
  if (!v3)
  {
    activeDownload = self->_activeDownload;
    if (activeDownload)
    {
      uint64_t v4 = [(_SFDownload *)activeDownload sourceURL];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  id v6 = [(TabDocument *)self customUserVisibleStringForReadingListBookmarkURL:v4];
  if (!v6)
  {
    id v6 = objc_msgSend(v4, "safari_userVisibleStringConsideringLongURLs");
  }

  return (NSString *)v6;
}

- (BOOL)isShowingStartPageOverriddenByExtension
{
  uint64_t v3 = [(TabDocument *)self URL];
  uint64_t v4 = extensionOverridenStartPageURLForTab(self);
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (id)URL
{
  return [(LoadingController *)self->_loadingController URL];
}

- (id)customUserVisibleStringForReadingListBookmarkURL:(id)a3
{
  id v4 = a3;
  if ([v4 isFileURL]
    && [(TabDocument *)self readingListBookmarkID])
  {
    char v5 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    id v6 = objc_msgSend(v5, "bookmarkWithID:", -[TabDocument readingListBookmarkID](self, "readingListBookmarkID"));
    uint64_t v7 = [v6 address];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)quickLookDocumentForCurrentBackForwardListItem
{
  if (a1)
  {
    uint64_t v1 = [*(id *)(a1 + 1032) backForwardList];
    uint64_t v2 = [v1 currentItem];
    uint64_t v3 = objc_msgSend(v2, "_sf_quickLookDocument");
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)isPDFDocument
{
  return [(_SFWebView *)self->_webView _isDisplayingPDF];
}

- (_SFPrintController)printController
{
  return self->_printController;
}

- (BOOL)hideFindOnPage
{
  BOOL v3 = [(TabDocument *)self isShowingFindOnPage];
  if (v3)
  {
    id v4 = [(TabDocument *)self findInteraction];
    [v4 dismissFindNavigator];
  }
  return v3;
}

- (BOOL)isShowingFindOnPage
{
  uint64_t v2 = [(TabDocument *)self findInteraction];
  char v3 = [v2 isFindNavigatorVisible];

  return v3;
}

- (UIFindInteraction)findInteraction
{
  uint64_t v2 = [(TabDocument *)self activeWebView];
  char v3 = [v2 findInteraction];

  return (UIFindInteraction *)v3;
}

- (BOOL)didFinishDocumentLoad
{
  return self->_didFinishDocumentLoad;
}

- (void)setWBTab:(id)a3
{
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
    if (v3)
    {
      char v5 = [(TabDocument *)self URL];
      pinnedURL = self->_pinnedURL;
      self->_pinnedURL = v5;

      uint64_t v7 = [(TabDocument *)self title];
      pinnedTitle = self->_pinnedTitle;
      self->_pinnedTitle = v7;
    }
    else
    {
      char v9 = self->_pinnedURL;
      self->_pinnedURL = 0;

      pinnedTitle = self->_pinnedTitle;
      self->_pinnedTitle = 0;
    }

    -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)&self->super.isa);
  }
}

- (id)_initWithTitle:(void *)a3 URL:(void *)a4 UUID:(uint64_t)a5 privateBrowsingEnabled:(uint64_t)a6 controlledByAutomation:(void *)a7 bookmark:(void *)a8 browserController:(void *)a9 createDocumentView:
{
  id v16 = a2;
  id v51 = a3;
  id v49 = a4;
  id v50 = a7;
  id v17 = a8;
  id v18 = a9;
  if (a1)
  {
    uint64_t v19 = [a1 init];
    if (v19)
    {
      id v47 = v16;
      if (v18)
      {
        uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
      }
      else
      {
        uint64_t v20 = [v49 copy];
      }
      id v21 = *(void **)(v19 + 1336);
      *(void *)(v19 + 1336) = v20;

      v48 = +[TabDocument blankTabTitleWithLibraryType:0 controlledByAutomation:0];
      id v22 = objc_alloc(MEMORY[0x1E4FB60A0]);
      v23 = [*(id *)(v19 + 1336) UUIDString];
      if ([v16 length]) {
        id v24 = v16;
      }
      else {
        id v24 = v48;
      }
      v25 = [v17 tabController];
      id v26 = [v25 deviceIdentifier];
      uint64_t v27 = [v22 initWithUUID:v23 title:v24 url:v51 deviceIdentifier:v26 isPrivateBrowsing:a5];
      v28 = *(void **)(v19 + 1344);
      *(void *)(v19 + 1344) = v27;

      id v16 = v47;
      [(id)v19 setBrowserController:v17 afterTabGroupReuse:0];
      id v29 = objc_alloc(MEMORY[0x1E4F3AF28]);
      id v30 = [v17 rootViewController];
      uint64_t v31 = [v29 initWithPrivateBrowsingEnabled:a5 traitEnvironment:v30 controlledByAutomation:a6];
      v32 = *(void **)(v19 + 1232);
      *(void *)(v19 + 1232) = v31;

      v33 = objc_alloc_init(LoadingController);
      v34 = *(void **)(v19 + 168);
      *(void *)(v19 + 168) = v33;

      [*(id *)(v19 + 168) setDelegate:v19];
      [(id)v19 setReadingListBookmark:v50];
      *(unsigned char *)(v19 + 943) = v18 == 0;
      if (v18)
      {
        v18[2](v18);
      }
      else
      {
        [*(id *)(v19 + 168) setTitle:v47];
        [*(id *)(v19 + 168) setURL:v51];
      }
      *(void *)(v19 + 1136) = 0xBFF0000000000000;
      -[TabDocument _setUp](v19);
      v35 = objc_alloc_init(UnifiedTabBarItem);
      v36 = *(void **)(v19 + 1072);
      *(void *)(v19 + 1072) = v35;

      [*(id *)(v19 + 1072) setUUID:*(void *)(v19 + 1336)];
      v37 = [MEMORY[0x1E4F78290] sharedFeatureManager];
      int v38 = [v37 showRectangularTabsInSeparateBar];

      if (v38)
      {
        v39 = objc_alloc_init(TabBarItem);
        v40 = *(void **)(v19 + 1064);
        *(void *)(v19 + 1064) = v39;

        [*(id *)(v19 + 1064) setUUID:*(void *)(v19 + 1336)];
      }
      v41 = [(id)v19 browserController];
      [*(id *)(v19 + 1072) setMenuButtonConfigurator:v41];

      [(id)v19 resetTabViewItems];
      v42 = *(void **)(v19 + 1104);
      uint64_t v43 = MEMORY[0x1E4F1CBF0];
      *(void *)(v19 + 1104) = MEMORY[0x1E4F1CBF0];

      [MEMORY[0x1E4F98FC0] nextTabID];
      *(void *)(v19 + 784) = v44;
      [(id)v19 setChangedPropertiesForOnUpdatedWebExtensionEvent:0];
      v45 = *(void **)(v19 + 1128);
      *(void *)(v19 + 1128) = v43;

      a1 = (id)v19;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)setChangedPropertiesForOnUpdatedWebExtensionEvent:(unint64_t)a3
{
  if (!self->_suppressWebExtensionEvents && self->_changedPropertiesForOnUpdatedWebExtensionEvent != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v6 = [WeakRetained tabController];
    uint64_t v7 = [v6 hiddenPrivateTabDocumentWhenShowingPrivateBrowsingExplanationText];
    char v8 = [(TabDocument *)self isEqual:v7];

    if ((v8 & 1) == 0)
    {
      self->_changedPropertiesForOnUpdatedWebExtensionEvent = a3;
      if (a3)
      {
        -[TabDocument _fireOnUpdatedExtensionEventSoon]((id *)&self->super.isa);
      }
      else
      {
        [(NSTimer *)self->_fireOnUpdatedWebExtensionEventTimer invalidate];
        fireOnUpdatedWebExtensionEventTimer = self->_fireOnUpdatedWebExtensionEventTimer;
        self->_fireOnUpdatedWebExtensionEventTimer = 0;
      }
    }
  }
}

- (void)setReadingListBookmark:(id)a3
{
  id v10 = a3;
  int v5 = [(WebBookmark *)self->_readingListBookmark identifier];
  p_readingListBookmark = &self->_readingListBookmark;
  if (v5 != [v10 identifier]
    || ([(WebBookmark *)*p_readingListBookmark dateLastViewed],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v10 dateLastViewed],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = (v7 != 0) ^ (v8 == 0),
        v8,
        v7,
        (v9 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_readingListBookmark, a3);
    [(TabDocument *)self setShowingContinuous:[(WebBookmark *)*p_readingListBookmark isReadingListItem]];
  }
}

- (void)setBrowserController:(id)a3 afterTabGroupReuse:(BOOL)a4
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v7 = WeakRetained;
  if (!a4)
  {
    char v8 = [WeakRetained tabController];
    [v8 willLoseOwnershipOfTab:self];
  }
  objc_storeWeak((id *)&self->_browserController, obj);
  [(TabDocument *)self setDelegate:obj];
  char v9 = [obj loadProgressObserver];
  objc_storeWeak((id *)&self->_loadProgressObserver, v9);

  id v10 = [obj tabController];
  [v10 didGainOwnershipOfTab:self];

  id v11 = [v7 tabGroupManager];
  [v11 removeTabGroupObserver:self];

  BOOL v12 = [obj tabGroupManager];
  [v12 addTabGroupObserver:self];

  BOOL v13 = [(WBTab *)self->_tabGroupTab uuid];
  -[TabDocument _activeParticipantsDidUpdateInTabWithUUID:]((id *)&self->super.isa, v13);
}

- (void)resetTabViewItems
{
  BOOL v3 = objc_alloc_init(TabDocumentCollectionItem);
  tabCollectionItem = self->_tabCollectionItem;
  self->_tabCollectionItem = v3;

  [(TabDocumentCollectionItem *)self->_tabCollectionItem setUUID:self->_uuid];
  unint64_t v5 = [(TabDocument *)self mediaStateIcon];
  [(TabDocumentCollectionItem *)self->_tabCollectionItem setMediaStateIcon:v5];
  [(TabDocumentCollectionItem *)self->_tabCollectionItem setPinned:self->_pinned];
  id v8 = [(TabOverviewItem *)self->_tabOverviewItem icon];
  id v6 = [[TabOverviewItem alloc] initWithUUID:self->_uuid];
  tabOverviewItem = self->_tabOverviewItem;
  self->_tabOverviewItem = v6;

  [(TabOverviewItem *)self->_tabOverviewItem setMediaStateIcon:v5];
  [(TabOverviewItem *)self->_tabOverviewItem setPinned:self->_pinned];
  [(TabDocument *)self updateTabTitle];
  [(TabOverviewItem *)self->_tabOverviewItem setIcon:v8];
}

- (TabDocument)init
{
  v9.receiver = self;
  v9.super_class = (Class)TabDocument;
  uint64_t v2 = [(TabDocument *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    renderingProgressEventObservers = v2->_renderingProgressEventObservers;
    v2->_renderingProgressEventObservers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    navigationObservers = v2->_navigationObservers;
    v2->_navigationObservers = (NSHashTable *)v5;

    uint64_t v7 = v2;
  }

  return v2;
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (void)_setUp
{
  if (a1)
  {
    *(unsigned char *)(a1 + 703) = 1;
    *(unsigned char *)(a1 + 136) = 1;
    [(id)a1 setAllowsRemoteInspection:1];
    uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v3 = [v2 BOOLForKey:@"DisableFluidProgressBar"];

    if (v3) {
      [(id)a1 beginSuppressingProgressAnimation];
    }
    id v4 = objc_alloc_init(MEMORY[0x1E4F98B08]);
    uint64_t v5 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v4;

    [*(id *)(a1 + 176) setWindowDelegate:a1];
    id v6 = objc_alloc_init(MEMORY[0x1E4F98F78]);
    uint64_t v7 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v6;

    [*(id *)(a1 + 48) addObserver:a1 forKeyPath:@"UIShouldReflectCommittedURLInsteadOfCurrentURL" options:0 context:kTabDocumentObserverContext];
    id v8 = objc_alloc_init(MEMORY[0x1E4F98DC8]);
    objc_super v9 = *(void **)(a1 + 1280);
    *(void *)(a1 + 1280) = v8;

    id v10 = objc_alloc_init(MEMORY[0x1E4F3B090]);
    id v11 = *(void **)(a1 + 392);
    *(void *)(a1 + 392) = v10;

    [*(id *)(a1 + 392) setDialogPresenter:a1];
    id v12 = objc_alloc(MEMORY[0x1E4F3AFE0]);
    BOOL v13 = [(id)a1 perSitePreferencesVendor];
    uint64_t v14 = [v12 initWithPerSitePreferencesVendor:v13];
    id v15 = *(void **)(a1 + 664);
    *(void *)(a1 + 664) = v14;

    [*(id *)(a1 + 664) setReloadOptionsController:*(void *)(a1 + 88)];
    [*(id *)(a1 + 664) setBrowserDocument:a1];
    if ([(id)a1 isPrivateBrowsing]) {
      [(id)a1 privateBrowsingUserDefinedContentBlockerManager];
    }
    else {
    id v16 = [(id)a1 normalBrowsingUserDefinedContentBlockerManager];
    }
    [*(id *)(a1 + 664) setUserDefinedContentBlockerManager:v16];

    id v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:a1 selector:sel__translationAvailabilityDidChange_ name:*MEMORY[0x1E4F99728] object:0];

    char v18 = [MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari];
    *(unsigned char *)(a1 + 657) = v18;
    *(unsigned char *)(a1 + 656) = v18;
    id v19 = objc_alloc_init(MEMORY[0x1E4F98E60]);
    uint64_t v20 = *(void **)(a1 + 1376);
    *(void *)(a1 + 1376) = v19;
  }
}

- (_SFPerSitePreferencesVendor)perSitePreferencesVendor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v3 = [WeakRetained perSitePreferencesVendor];

  return (_SFPerSitePreferencesVendor *)v3;
}

- (void)setAllowsRemoteInspection:(BOOL)a3
{
  if (self->_allowsInspectionWhenUnlocked != a3)
  {
    self->_allowsInspectionWhenUnlocked = a3;
    BOOL v4 = [(TabDocument *)self allowsRemoteInspection];
    [(_SFWebView *)self->_webView setInspectable:v4];
    readerWebView = self->_readerWebView;
    [(_SFWebView *)readerWebView setInspectable:v4];
  }
}

- (BOOL)allowsRemoteInspection
{
  return !self->_locked && self->_allowsInspectionWhenUnlocked;
}

- (void)_activeParticipantsDidUpdateInTabWithUUID:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = [a1[168] uuid];
    char v5 = [v3 isEqualToString:v4];

    if (v5)
    {
      objc_initWeak(&location, a1);
      id WeakRetained = objc_loadWeakRetained(a1 + 120);
      uint64_t v7 = [WeakRetained tabGroupManager];
      id v8 = a1[168];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke;
      v9[3] = &unk_1E6D7DC50;
      objc_copyWeak(&v10, &location);
      [v7 getActiveParticipantsInTab:v8 completionHandler:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (WeakRetained)
    {
      [(TabDocument *)self removeRenderingProgressObserver:WeakRetained];
      [(TabDocument *)self removeNavigationObserver:WeakRetained];
    }
    if (obj)
    {
      [(TabDocument *)self addRenderingProgressObserver:obj];
      [(TabDocument *)self addNavigationObserver:obj];
    }
  }
}

- (void)addRenderingProgressObserver:(id)a3
{
}

- (void)addNavigationObserver:(id)a3
{
}

- (_SFWebView)readerWebView
{
  return self->_readerWebView;
}

- (WBSPrivateBrowsingUserDefinedContentBlockerManager)privateBrowsingUserDefinedContentBlockerManager
{
  uint64_t v2 = +[Application sharedApplication];
  id v3 = [v2 userDefinedContentBlockerManagerForPrivateBrowsing];

  return (WBSPrivateBrowsingUserDefinedContentBlockerManager *)v3;
}

- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager
{
  uint64_t v2 = +[Application sharedApplication];
  id v3 = [v2 userDefinedContentBlockerManager];

  return (WBSUserDefinedContentBlockerManager *)v3;
}

- (void)_createDocumentViewWithConfiguration:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    char v5 = [(id)a1 configuration];
    id v6 = [v5 traitEnvironment];

    uint64_t v7 = [v6 traitCollection];
    if ([v7 userInterfaceStyle] == 2)
    {
      id v8 = [v6 traitCollection];
      BOOL v9 = [v8 userInterfaceIdiom] == 6;
    }
    else
    {
      BOOL v9 = 1;
    }

    [v3 _setDrawsBackground:v9];
    id v10 = objc_alloc(MEMORY[0x1E4F3B0C0]);
    id v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 bounds];
    uint64_t v12 = objc_msgSend(v10, "initWithFrame:configuration:", v3);
    BOOL v13 = *(void **)(a1 + 1032);
    *(void *)(a1 + 1032) = v12;

    uint64_t v14 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 1032);
      int v51 = 134218240;
      uint64_t v52 = a1;
      __int16 v53 = 2048;
      uint64_t v54 = v15;
      _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "TabDocument %p: created web view %p", (uint8_t *)&v51, 0x16u);
    }
    id v16 = webViewToTabDocumentMap();
    [v16 setObject:a1 forKey:*(void *)(a1 + 1032)];

    [*(id *)(a1 + 224) setReaderWebView:*(void *)(a1 + 1392)];
    [*(id *)(a1 + 224) setWebView:*(void *)(a1 + 1032)];
    [*(id *)(a1 + 1032) setAllowsLinkPreview:1];
    [*(id *)(a1 + 1032) _setObservedRenderingProgressEvents:335];
    [*(id *)(a1 + 168) setWebView:*(void *)(a1 + 1032)];
    [*(id *)(a1 + 1032) setNavigationDelegate:a1];
    [*(id *)(a1 + 1032) setUIDelegate:a1];
    [*(id *)(a1 + 1032) setDelegate:a1];
    [*(id *)(a1 + 1032) _setFullscreenDelegate:a1];
    [*(id *)(a1 + 1032) _setInputDelegate:a1];
    id v17 = *(void **)(a1 + 1032);
    char v18 = [(id)a1 history];
    [v17 _setHistoryDelegate:v18];

    [*(id *)(a1 + 1032) _setIconLoadingDelegate:a1];
    [*(id *)(a1 + 1032) _setDiagnosticLoggingDelegate:a1];
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 1032) _setAppHighlightDelegate:a1];
    }
    [*(id *)(a1 + 1032) _setFindInteractionEnabled:1];
    [*(id *)(a1 + 1032) setAccessibilityIdentifier:@"WebView"];
    objc_msgSend(*(id *)(a1 + 1032), "setInspectable:", objc_msgSend((id)a1, "allowsRemoteInspection"));
    id v19 = _SFCustomUserAgentStringIfNeeded();
    if (v19) {
      [*(id *)(a1 + 1032) setCustomUserAgent:v19];
    }

    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"URL" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"estimatedProgress" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"_networkRequestsInProgress" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"hasOnlySecureContent" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"_negotiatedLegacyTLS" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"title" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"canGoBack" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"canGoForward" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"_webProcessIsResponsive" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"loading" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"themeColor" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"underPageBackgroundColor" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"_sampledPageTopColor" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) addObserver:a1 forKeyPath:@"_isPlayingAudio" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1032) _setBackgroundExtendsBeyondPage:1];
    uint64_t v20 = [objc_alloc(MEMORY[0x1E4F3AF88]) initWithWebView:*(void *)(a1 + 1032) delegate:a1];
    id v21 = *(void **)(a1 + 1248);
    *(void *)(a1 + 1248) = v20;

    [*(id *)(a1 + 1248) setMetadataCorrectionsEnabled:1];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F3B030]) initWithWebView:*(void *)(a1 + 1032)];
    v23 = *(void **)(a1 + 296);
    *(void *)(a1 + 296) = v22;

    [*(id *)(a1 + 296) setDelegate:a1];
    [*(id *)(a1 + 296) setWebViewUIDelegate:a1];
    id v24 = [v6 traitCollection];
    uint64_t v25 = [v24 userInterfaceStyle];
    id v26 = [*(id *)(a1 + 296) configurationManager];
    [v26 setDarkModeEnabled:v25 == 2];

    uint64_t v27 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3CDF0C0];
    v28 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v27;

    id v29 = [*(id *)(a1 + 1032) _remoteObjectRegistry];
    [v29 registerExportedObject:a1 interface:*(void *)(a1 + 64)];

    uint64_t v30 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F3CDED20];
    uint64_t v31 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v30;

    v32 = [*(id *)(a1 + 1032) _remoteObjectRegistry];
    [v32 registerExportedObject:a1 interface:*(void *)(a1 + 72)];

    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F3AFF0]) initWithWebView:*(void *)(a1 + 1032)];
    v34 = *(void **)(a1 + 1272);
    *(void *)(a1 + 1272) = v33;

    [*(id *)(a1 + 1272) setDelegate:a1];
    [*(id *)(a1 + 1272) setDialogPresenter:a1];
    id v35 = objc_alloc(MEMORY[0x1E4F3B048]);
    uint64_t v36 = *(void *)(a1 + 1032);
    v37 = [(id)a1 activityJSController];
    int v38 = [(id)a1 perSitePreferencesVendor];
    v39 = [v38 requestDesktopSitePreferenceManager];
    uint64_t v40 = [v35 initWithWebView:v36 activityJSController:v37 perSitePreferenceManager:v39];
    v41 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v40;

    objc_msgSend(*(id *)(a1 + 88), "setTryUsingMobileIfPossible:", objc_msgSend(WeakRetained, "isShowingInOneThirdMode"));
    v42 = [*(id *)(a1 + 1032) URL];
    objc_msgSend(*(id *)(a1 + 88), "setSupportsAdvancedPrivacyProtections:", objc_msgSend((id)a1, "supportsAdvancedPrivacyProtectionsForURL:", v42));

    [*(id *)(a1 + 664) setReloadOptionsController:*(void *)(a1 + 88)];
    uint64_t v43 = [objc_alloc(MEMORY[0x1E4F3AF38]) initWithWebView:*(void *)(a1 + 1032)];
    uint64_t v44 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v43;

    id v45 = objc_alloc_init(MEMORY[0x1E4F78278]);
    v46 = *(void **)(a1 + 288);
    *(void *)(a1 + 288) = v45;

    [*(id *)(a1 + 288) setDelegate:a1];
    [*(id *)(a1 + 288) setDialogPresenter:*(void *)(a1 + 1032)];
    [*(id *)(a1 + 288) setViewControllerPresenter:a1];
    id v47 = objc_alloc_init(MEMORY[0x1E4F3B020]);
    v48 = *(void **)(a1 + 1360);
    *(void *)(a1 + 1360) = v47;

    [*(id *)(a1 + 1360) setDelegate:a1];
    [*(id *)(a1 + 1360) setWebView:*(void *)(a1 + 1032)];
    [*(id *)(a1 + 1360) setReaderController:*(void *)(a1 + 296)];
    [*(id *)(a1 + 1360) setDialogPresenter:a1];
    [(id)a1 updateAccessibilityIdentifier];
    id v49 = +[Application sharedApplication];
    id v50 = [v49 systemNoteTakingController];

    [v50 addObserver:a1 forKeyPath:*MEMORY[0x1E4F992C8] options:0 context:kTabDocumentObserverContext];
  }
}

- (BOOL)supportsAdvancedPrivacyProtectionsForURL:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "safari_isSafariWebExtensionURL"))
  {
    char v5 = 0;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v5 = objc_msgSend(v6, "safari_enableAdvancedPrivacyProtections:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
  }
  return v5;
}

- (id)createWebViewConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  char v5 = [WeakRetained processPool];
  [v4 setProcessPool:v5];

  id v6 = [WeakRetained wkPreferences];
  if ([MEMORY[0x1E4F97EA0] isWAPEnabled])
  {
    uint64_t v7 = -[TabDocument profileIdentifier]((uint64_t)self);
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F980C8]];

    if (v8)
    {
      BOOL v9 = (void *)[v6 copy];

      [v9 _setNotificationsEnabled:1];
      [v9 _setPushAPIEnabled:1];
      [v9 _setNotificationEventEnabled:1];
      id v6 = v9;
      [v9 _setAppBadgeEnabled:1];
    }
  }
  [v4 setPreferences:v6];
  if (self->_webClip)
  {
    [v4 setIgnoresViewportScaleLimits:1];
    id v10 = [v4 preferences];
    [v10 _setStandalone:1];
  }
  id v11 = [(TabDocument *)self history];
  uint64_t v12 = [v11 visitedLinkStore];
  [v4 _setVisitedLinkStore:v12];

  BOOL v13 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_userContentController");
  if ([(TabDocument *)self isPrivateBrowsingEnabled])
  {
    objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
    uint64_t v15 = v14 = v13;
  }
  else
  {
    uint64_t v14 = [(TabDocument *)self webExtensionsController];
    uint64_t v16 = [v14 userContentController];

    uint64_t v15 = (void *)v16;
  }

  [v4 setUserContentController:v15];
  id v17 = _SFApplicationNameForUserAgent();
  [v4 setApplicationNameForUserAgent:v17];

  char v18 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v19 = [v18 valueForKey:*MEMORY[0x1E4F788A0]];
  LODWORD(v20) = [v19 BOOLValue];

  id v21 = [v18 valueForKey:*MEMORY[0x1E4F789D8]];
  int v22 = [v21 BOOLValue];

  if (v22) {
    uint64_t v20 = v20 | 2;
  }
  else {
    uint64_t v20 = v20;
  }
  [v4 setMediaTypesRequiringUserActionForPlayback:v20];
  unsigned int IsPad = _SFDeviceIsPad();
  if (v20) {
    uint64_t v24 = IsPad;
  }
  else {
    uint64_t v24 = 1;
  }
  [v4 _setMediaDataLoadsAutomatically:v24];
  uint64_t v25 = [v18 valueForKey:*MEMORY[0x1E4F78958]];
  objc_msgSend(v4, "_setMainContentUserGestureOverrideEnabled:", objc_msgSend(v25, "BOOLValue"));

  id v26 = [v18 valueForKey:*MEMORY[0x1E4F78970]];
  objc_msgSend(v4, "setAllowsInlineMediaPlayback:", objc_msgSend(v26, "BOOLValue"));

  uint64_t v27 = [v18 valueForKey:*MEMORY[0x1E4F78928]];
  objc_msgSend(v4, "_setInlineMediaPlaybackRequiresPlaysInlineAttribute:", objc_msgSend(v27, "BOOLValue"));

  v28 = [v18 valueForKey:*MEMORY[0x1E4F78930]];
  objc_msgSend(v4, "_setInvisibleAutoplayNotPermitted:", objc_msgSend(v28, "BOOLValue"));

  [v4 _setApplePayEnabled:1];
  [v4 setIgnoresViewportScaleLimits:1];
  [v4 _setNeedsStorageAccessFromFileURLsQuirk:0];
  [v4 _setDragLiftDelay:2];
  id v29 = [(TabDocument *)self configuration];
  objc_msgSend(v4, "_setControlledByAutomation:", objc_msgSend(v29, "isControlledByAutomation"));

  uint64_t v30 = +[Application sharedApplication];
  uint64_t v31 = [v30 systemNoteTakingController];

  if objc_msgSend(v31, "isNoteTakingSupportedWithPrivateBrowsing:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"))&& (objc_opt_respondsToSelector())
  {
    [v4 _setAppHighlightsEnabled:1];
  }
  int v32 = [(_SFBrowserConfiguration *)self->_configuration usesPersistentDataStore];
  uint64_t v33 = (void *)MEMORY[0x1E4F46710];
  if (v32)
  {
    v34 = -[TabDocument profileIdentifier]((uint64_t)self);
    id v35 = objc_msgSend(v33, "safari_dataStoreForProfileWithIdentifier:", v34);
    [v4 setWebsiteDataStore:v35];
  }
  else
  {
    v34 = objc_msgSend(MEMORY[0x1E4F46710], "safari_nonPersistentDataStore");
    [v4 setWebsiteDataStore:v34];
  }

  objc_msgSend(v4, "_setLegacyEncryptedMediaAPIEnabled:", objc_msgSend(v18, "BOOLForKey:", *MEMORY[0x1E4F78950]));
  uint64_t v36 = [v4 websiteDataStore];
  uint64_t v37 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  objc_msgSend(v36, "_setResourceLoadStatisticsEnabled:", objc_msgSend((id)v37, "webui_trackerProtectionEnabled"));

  int v38 = [v4 preferences];
  LOBYTE(v37) = objc_opt_respondsToSelector();

  if (v37)
  {
    v39 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v40 = objc_msgSend(v39, "safari_warnAboutFraudulentWebsites");
    v41 = [v4 preferences];
    [v41 _setSafeBrowsingEnabled:v40];
  }
  [v4 _setSystemPreviewEnabled:1];
  v42 = [(TabDocument *)self webExtensionsController];
  uint64_t v43 = [v42 webKitController];
  [v4 _setWebExtensionController:v43];

  uint64_t v44 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F99778]];
  [v4 _setMaskedURLSchemes:v44];

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v18, "safari_doubleForKey:defaultValue:", @"DebugSampledPageTopColorMaxDifference", *MEMORY[0x1E4F99130]);
    objc_msgSend(v4, "_setSampledPageTopColorMaxDifference:");
  }
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v18, "safari_doubleForKey:defaultValue:", @"DebugSampledPageTopColorMinHeight", *MEMORY[0x1E4F99138]);
    objc_msgSend(v4, "_setSampledPageTopColorMinHeight:");
  }
  id v45 = [v4 defaultWebpagePreferences];
  v46 = _SFApplicationNameForDesktopUserAgent();
  [v45 _setApplicationNameForUserAgentWithModernCompatibility:v46];

  return v4;
}

- (History)history
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  history = self->_history;
  if (history)
  {
    id v3 = history;
  }
  else
  {
    char v5 = [(TabDocument *)self profile];
    id v6 = [v5 identifier];
    uint64_t v7 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = [v5 title];
      [(TabDocument *)v8 history];
    }

    BOOL v9 = +[Application sharedApplication];
    id v10 = [v9 historyController];
    id v11 = [v10 historyForProfileIdentifier:v6 loadIfNeeded:1];
    uint64_t v12 = self->_history;
    self->_history = v11;

    BOOL v13 = self->_history;
    if (!v13)
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[TabDocument history]();
      }
      uint64_t v15 = +[History sharedHistory];
      uint64_t v16 = self->_history;
      self->_history = v15;

      BOOL v13 = self->_history;
    }
    id v3 = v13;
  }
  return v3;
}

- (_SFBrowserConfiguration)configuration
{
  return self->_configuration;
}

- (id)profileIdentifier
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    uint64_t v2 = [WeakRetained effectiveProfileIdentifier];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (_SFInjectedJavaScriptController)activityJSController
{
  activityJSController = self->_activityJSController;
  if (!activityJSController)
  {
    id v4 = (_SFInjectedJavaScriptController *)[objc_alloc(MEMORY[0x1E4F3AFB0]) initWithWebView:self->_webView];
    char v5 = self->_activityJSController;
    self->_activityJSController = v4;

    activityJSController = self->_activityJSController;
  }
  return activityJSController;
}

void __29__TabDocument_tabUpdateBlock__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 943) && !*((unsigned char *)WeakRetained + 777))
    {
      [v8 setPinned:*((unsigned __int8 *)WeakRetained + 919) title:WeakRetained[139] url:WeakRetained[140]];
    }
    else
    {
      *((unsigned char *)WeakRetained + 777) = 0;
      char v5 = -[TabDocument _localAttributes](WeakRetained);
      [v8 setLocalAttributes:v5];

      id v6 = -[TabDocument _titleForStatePersistingForTabGroupTab](v4);
      uint64_t v7 = [v4 URLForStatePersisting];
      if (v7)
      {
        if (*((unsigned char *)v4 + 701))
        {
          [v8 setLocalTitle:v6];
          [v8 setLocalURL:v7];
        }
        else if (!*((unsigned char *)v4 + 943))
        {
          [v8 setTitle:v6];
          [v8 setUrl:v7];
        }
      }
      [v8 setPinned:*((unsigned __int8 *)v4 + 919) title:v4[139] url:v4[140]];
    }
  }
}

- (WBTab)wbTab
{
  return self->_tabGroupTab;
}

- (id)tabUpdateBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__TabDocument_tabUpdateBlock__block_invoke;
  v4[3] = &unk_1E6D7D148;
  objc_copyWeak(&v5, &location);
  uint64_t v2 = (void *)MEMORY[0x1E4E42950](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)_notifyDidUpdateTabCollectionItem
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id WeakRetained = objc_loadWeakRetained(a1 + 120);
    id v3 = objc_msgSend(WeakRetained, "tabCollectionViewProvider", 0);
    id v4 = [v3 tabCollectionViews];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector())
          {
            BOOL v9 = [a1 itemForTabCollectionView:v8];
            [v8 didUpdateItem:v9];
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    id v10 = objc_loadWeakRetained(a1 + 152);
    [v10 tabDocumentDidUpdateTabCollectionItem:a1];
  }
}

- (SFPinnableBanner)appBanner
{
  return self->_appBanner;
}

- (SFDialogController)dialogController
{
  return self->_dialogController;
}

- (SFPrivateBrowsingPrivacyProtectionsBanner)privateBrowsingPrivacyProtectionsBanner
{
  return self->_privateBrowsingPrivacyProtectionsBanner;
}

- (void)_updateNavigationBarItem
{
  if (!a1 || !*(void *)(a1 + 280)) {
    return;
  }
  uint64_t v2 = [(id)a1 URL];
  uint64_t v33 = v2;
  if (objc_msgSend(v2, "safari_isSafariWebExtensionURL"))
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(id)a1 URLString];
  }
  int v32 = [MEMORY[0x1E4F3B060] sharedInstance];
  id v4 = objc_msgSend(v32, "defaultSearchEngineIfPopulatedForPrivateBrowsing:", objc_msgSend((id)a1, "isPrivateBrowsingEnabled"));
  uint64_t v31 = v4;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F3B1D8];
    [v5 removeObserver:a1 name:*MEMORY[0x1E4F3B1D8] object:0];

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:a1 selector:sel__searchEngineControllerDidFinishPopulating_ name:v6 object:0];
  }
  if ([*(id *)(a1 + 48) UIShouldReflectCommittedURLInsteadOfCurrentURL]) {
    [*(id *)(a1 + 1032) _committedURL];
  }
  else {
  uint64_t v30 = [*(id *)(a1 + 168) URL];
  }
  id v8 = [v4 userVisibleQueryFromSearchURL:v30];
  if (*(void *)(a1 + 192) || (objc_opt_respondsToSelector() & 1) == 0)
  {
    BOOL v10 = 0;
  }
  else
  {
    BOOL v9 = [*(id *)(a1 + 1032) _safeBrowsingWarning];
    BOOL v10 = v9 != 0;
  }
  [*(id *)(a1 + 280) setOverrideBarStyleForSecurityWarning:v10];
  unint64_t v36 = 0;
  v34 = objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 0, &v36);
  unint64_t v35 = 0;
  objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, &v35);
  long long v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  *(unsigned char *)(a1 + 942) = 0;
  if (*(void *)(a1 + 192))
  {
    _WBSLocalizedString();
    long long v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      goto LABEL_17;
    }
  }
  else
  {
    if ((objc_msgSend(v2, "safari_isDataURL") & 1) == 0)
    {
      if (!v8)
      {
        long long v12 = v11;
        id v17 = v34;
        int v15 = 0;
        int v16 = 0;
        if (v35 <= v36) {
          uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v13 = v35 - v36;
        }
        if (v11) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      char v18 = v8;
      *(unsigned char *)(a1 + 942) = 1;
      long long v12 = v18;
      uint64_t v13 = 0;
      goto LABEL_20;
    }
    long long v12 = @"data:";
    if (v8)
    {
LABEL_17:
      if (v12 == v8) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_20:
      long long v14 = [(id)a1 expectedOrCurrentURL];
      int v15 = objc_msgSend(v14, "safari_isEligibleToShowNotSecureWarning");

      int v16 = 1;
      id v17 = v8;
      if (v11) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  id v17 = v34;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 == v11)
  {
    int v15 = 0;
    int v16 = 0;
    if (v35 > v36) {
      uint64_t v13 = v35 - v36;
    }
    long long v12 = v11;
    if (v11) {
      goto LABEL_38;
    }
  }
  else
  {
    int v15 = 0;
    int v16 = 0;
    if (v11) {
      goto LABEL_38;
    }
  }
LABEL_37:
  if (!v15)
  {
LABEL_40:
    [*(id *)(a1 + 280) setSecurityAnnotation:0 hasFocusedInputFieldOnCurrentPage:*(unsigned __int8 *)(a1 + 728)];
    int v19 = 0;
    goto LABEL_41;
  }
LABEL_38:
  if (!-[TabDocument isPageEligibileToShowNotSecureWarning]((void *)a1)) {
    goto LABEL_40;
  }
  int v19 = 1;
  [*(id *)(a1 + 280) setSecurityAnnotation:1 hasFocusedInputFieldOnCurrentPage:*(unsigned __int8 *)(a1 + 728)];
LABEL_41:
  if ([(id)a1 isBlank])
  {
    uint64_t v20 = 0;
  }
  else if (*(unsigned char *)(a1 + 656))
  {
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v20 = 2;
  }
  [*(id *)(a1 + 280) setLockdownModeAnnotation:v20];
  if ((v15 & v19) == 1)
  {
    id v21 = v11;

    long long v12 = v21;
    id v17 = v12;
  }
  if (*(void *)(a1 + 192)) {
    int v22 = 1;
  }
  else {
    int v22 = v19;
  }
  if ((v16 | v22)) {
    uint64_t v23 = v22 ^ 1u;
  }
  else {
    uint64_t v23 = [v34 length] == 0;
  }
  [*(id *)(a1 + 280) setShowsSearchIndicator:v23];
  if (*(void *)(a1 + 192)) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = [(id)a1 isSecure];
  }
  [*(id *)(a1 + 280) setShowsLockIcon:v24];
  [*(id *)(a1 + 280) setText:v12 textWhenExpanded:v17 startIndex:v13];
  uint64_t v25 = [(id)a1 URL];
  [*(id *)(a1 + 280) setShowsStopReloadButtons:v25 != 0];

  objc_msgSend(*(id *)(a1 + 280), "setShowsPageFormatButton:", objc_msgSend((id)a1, "canShowPageFormatMenu"));
  id v26 = *(void **)(a1 + 280);
  if (*(void *)(a1 + 192)) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = [(id)a1 isReaderAvailable];
  }
  [v26 setShowsReaderButton:v27 showsAvailabilityText:0];
  v28 = *(void **)(a1 + 280);
  if (*(void *)(a1 + 192)) {
    BOOL v29 = 0;
  }
  else {
    BOOL v29 = [*(id *)(a1 + 1024) detectionNotificationLevel] == 1;
  }
  [v28 setShowsTranslationButton:v29 showsAvailabilityText:0];
  [*(id *)(a1 + 1240) updatePreviewLoadingUIWithURLString:v3];
}

- (BOOL)shouldShowReaderOnActivate
{
  BOOL v3 = [(TabDocument *)self isReaderAvailable];
  if (v3) {
    LOBYTE(v3) = self->_showingReader || self->_wantsReaderWhenActivated;
  }
  return v3;
}

- (BOOL)isReaderAvailable
{
  if (self->_hasDoneReaderAvailabilityDetection && (readerContext = self->_readerContext) != 0) {
    return [(_SFReaderController *)readerContext isReaderAvailable];
  }
  else {
    return 0;
  }
}

- (BOOL)canShowPageFormatMenu
{
  BOOL v3 = [(TabDocument *)self URL];
  if (objc_msgSend(v3, "safari_isSafariWebExtensionURL"))
  {
    LOBYTE(v4) = 1;
  }
  else if (((objc_msgSend(v3, "safari_isHTTPFamilyURL") & 1) != 0 {
          || objc_msgSend(v3, "sf_isOfflineReadingListURL"))
  }
         && ![(TabDocument *)self isPDFDocument]
         && ![(TabDocument *)self isDisplayingStandaloneImage])
  {
    BOOL v4 = ![(TabDocument *)self isDisplayingStandaloneMedia];
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)updateUserActivity
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = +[CloudTabStore cloudTabForTabDocument:]((uint64_t)CloudTabStore, self);
  BOOL v4 = [v3 url];
  if (v4) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v5 URL];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v8 = [WeakRetained tabDocumentCanBecomeCurrentUserActivity:self];

  if (self->_active && (objc_msgSend(v6, "safari_isHTTPFamilyURL") & v8 & 1) != 0)
  {
    if (self->_userActivity)
    {
      if (self->_forwardActivityToCoreSpotlight)
      {
        BOOL v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_INFO, "Stopping updates of NSUserActivity through CoreSpotlight", (uint8_t *)&v27, 2u);
        }
        [(NSUserActivity *)self->_userActivity _updateForwardToCoreSpotlightIndexer:0xFFFFFFFFLL];
        self->_forwardActivityToCoreSpotlight = 0;
      }
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F22488]);
      long long v11 = (NSUserActivity *)[v10 initWithActivityType:*MEMORY[0x1E4F28AC0]];
      userActivity = self->_userActivity;
      self->_userActivity = v11;
    }
    uint64_t v13 = [v3 dictionaryRepresentationForUserActivityUserInfo];
    [(NSUserActivity *)self->_userActivity setUserInfo:v13];

    long long v14 = [v3 title];
    [(NSUserActivity *)self->_userActivity setTitle:v14];

    [(NSUserActivity *)self->_userActivity setWebpageURL:v6];
    uint64_t v15 = [(TabDocument *)self searchableItemAttributes];
    [(NSUserActivity *)self->_userActivity setContentAttributeSet:v15];

    int v16 = [(TabDocument *)self searchableItemAttributes];
    LOBYTE(v15) = v16 == 0;

    if ((v15 & 1) == 0)
    {
      [(NSUserActivity *)self->_userActivity _updateForwardToCoreSpotlightIndexer:1];
      self->_forwardActivityToCoreSpotlight = 1;
      id v17 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1E102C000, v17, OS_LOG_TYPE_INFO, "Sending NSUserActivity through CoreSpotlight since metadata was found on webpage", (uint8_t *)&v27, 2u);
      }
      char v18 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v25 = [(TabDocument *)self searchableItemAttributes];
        id v26 = [v25 relatedUniqueIdentifier];
        int v27 = 138478083;
        v28 = v26;
        __int16 v29 = 2113;
        uint64_t v30 = v6;
        _os_log_debug_impl(&dword_1E102C000, v18, OS_LOG_TYPE_DEBUG, "Sending NSUserActivity through CoreSpotlight; relatedUniqueIdentifier '%{private}@' and URL '%{private}@'",
          (uint8_t *)&v27,
          0x16u);
      }
    }
    int v19 = +[Application sharedApplication];
    uint64_t v20 = [v19 systemNoteTakingController];

    [v20 insertCanonicalURLIfAvailableForUserActivity:self->_userActivity];
    id v21 = [(NSUserActivity *)self->_userActivity userInfo];
    int v22 = (void *)[v21 mutableCopy];

    uint64_t v23 = [(NSUserActivity *)self->_userActivity _uniqueIdentifier];
    [v22 setObject:v23 forKeyedSubscript:@"uniqueIdentifier"];

    uint64_t v24 = (void *)[v22 copy];
    [(NSUserActivity *)self->_userActivity setUserInfo:v24];

    [(NSUserActivity *)self->_userActivity setNeedsSave:1];
    [(NSUserActivity *)self->_userActivity becomeCurrent];
  }
  else
  {
    -[TabDocument invalidateUserActivity]((uint64_t)self);
  }
}

- (void)invalidateUserActivity
{
  if (a1)
  {
    uint64_t v2 = [(id)a1 searchableItemAttributes];
    [*(id *)(a1 + 1432) setContentAttributeSet:v2];

    if (*(unsigned char *)(a1 + 698))
    {
      BOOL v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_INFO, "Stopping updates of NSUserActivity through CoreSpotlight due to invalidating NSUserActivity", v5, 2u);
      }
      [*(id *)(a1 + 1432) _updateForwardToCoreSpotlightIndexer:0xFFFFFFFFLL];
      *(unsigned char *)(a1 + 698) = 0;
    }
    [*(id *)(a1 + 1432) invalidate];
    BOOL v4 = *(void **)(a1 + 1432);
    *(void *)(a1 + 1432) = 0;
  }
}

- (CSSearchableItemAttributeSet)searchableItemAttributes
{
  return self->_searchableItemAttributes;
}

- (BOOL)isShowingContinuous
{
  return self->_showingContinuous;
}

- (int)readingListBookmarkID
{
  int result = [(WebBookmark *)self->_readingListBookmark isReadingListItem];
  if (result)
  {
    readingListBookmark = self->_readingListBookmark;
    return [(WebBookmark *)readingListBookmark identifier];
  }
  return result;
}

- (BOOL)formAutoFillControllerCanPrefillForm:(id)a3
{
  BOOL v4 = [(TabDocument *)self didFirstLayout];
  if (v4)
  {
    LOBYTE(v4) = [(TabDocument *)self didFinishDocumentLoad];
  }
  return v4;
}

- (BOOL)didFirstLayout
{
  return self->_didFirstLayout;
}

void __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    BOOL v3 = [*(id *)(a1 + 32) allObjects];
    [v4 setShareParticipants:v3];

    id WeakRetained = v4;
  }
}

- (void)setShareParticipants:(id)a3
{
  id v7 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v7 copy];
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    [(TabBarItem *)self->_tabBarItem setShareParticipants:v7];
    [(SFUnifiedTabBarItem *)self->_unifiedTabBarItem setShareParticipants:v7];
    [(TabOverviewItem *)self->_tabOverviewItem setShareParticipants:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tabDocumentDidUpdateTabCollectionItem:self];
  }
}

void __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__TabDocument__activeParticipantsDidUpdateInTabWithUUID___block_invoke_2;
  v5[3] = &unk_1E6D79A60;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

- (SFReaderContext)readerContext
{
  return self->_readerContext;
}

- (double)lastViewedTime
{
  return self->_lastViewedTime;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[TabBarItem setActive:](self->_tabBarItem, "setActive:");
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[TabDocument setLastViewedTime:](self, "setLastViewedTime:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    uint64_t v5 = [WeakRetained tabController];
    [v5 saveTabDocumentUserActivitySoon:self];

    if (self->_active)
    {
      id v6 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v6 reportTabUpdatedWithUpdateType:7];

      if (self->_closed)
      {
        id v7 = WBS_LOG_CHANNEL_PREFIXPageLoading();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[TabDocument setActive:]((uint64_t)self, v7);
        }
      }
      id v8 = [(TabDocument *)self navigationBarItem];
      if (self->_hibernated) {
        [(TabDocument *)self unhibernate];
      }
      else {
        -[TabDocument _loadDeferredURLIfNeeded]((uint64_t)self);
      }
      [(SFDialogController *)self->_dialogController owningWebViewWillBecomeActive];
      if (*((unsigned char *)&self->_flags + 8))
      {
        *((unsigned char *)&self->_flags + 8) &= ~1u;
        self->_flags.impressionProvenance = 0;
      }
      [(TabDocument *)self validateExtensionToolbarItems];
      [(TabDocument *)self indexTabToCoreSpotlight];
    }
    else
    {
      sfScribbleController = self->_sfScribbleController;
      [(SFScribbleController *)sfScribbleController endScribblingAndSaveChanges:0];
    }
  }
}

- (void)validateExtensionToolbarItems
{
  -[TabDocument _updateActiveExtensionsIfNecessary]((uint64_t)self);
  [(TabDocument *)self updateMenuButtonShowsBadge];
}

- (void)updateMenuButtonShowsBadge
{
  id v3 = [MEMORY[0x1E4F3AF68] sharedManager];
  LODWORD(v9) = [v3 hasUnviewedDownloads];

  id v4 = [(TabDocument *)self webExtensionsController];
  uint64_t v5 = [v4 hasUpdatedToolbarItemBadgeTextInTab:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v7 = [WeakRetained tabBarManager];
  uint64_t v8 = [v7 displayMode];
  uint64_t v9 = v9;

  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v8 == 2)
  {
    [(SFUnifiedTabBarItem *)unifiedTabBarItem setShowsBadgeOnExtensionsButton:v5];
  }
  else
  {
    [(SFUnifiedTabBarItem *)unifiedTabBarItem setShowsBadgeOnExtensionsButton:0];
    if (v5) {
      uint64_t v9 = v9 | 2;
    }
  }
  if (self->_cachedMediaStateIcon) {
    uint64_t v11 = v9 | 4;
  }
  else {
    uint64_t v11 = v9;
  }
  long long v12 = self->_unifiedTabBarItem;
  [(SFUnifiedTabBarItem *)v12 setMenuButtonBadges:v11];
}

- (void)unhibernate
{
  if (self->_hibernated)
  {
    [(NSTimer *)self->_unresponsiveWebProcessTimer invalidate];
    id unresponsiveWebProcessBlock = self->_unresponsiveWebProcessBlock;
    self->_id unresponsiveWebProcessBlock = 0;

    self->_suppressCrashBanner = 0;
    self->_hibernated = 0;
    id v4 = [(TabDocument *)self URL];
    uint64_t v5 = [(TabDocument *)self createWebViewConfiguration];
    -[TabDocument _createDocumentViewWithConfiguration:]((uint64_t)self, v5);
    if (self->_savedSessionState) {
      goto LABEL_8;
    }
    if (![(TabDocument *)self isBlank])
    {
      id v6 = [(WBTab *)self->_tabGroupTab localAttributes];
      id v7 = [v6 sessionStateData];

      if ([v7 length])
      {
        uint64_t v8 = (_WKSessionState *)[objc_alloc(MEMORY[0x1E4F46790]) initWithData:v7];
        savedSessionState = self->_savedSessionState;
        self->_savedSessionState = v8;
      }
    }
    if (self->_savedSessionState)
    {
LABEL_8:
      self->_sessionStateRestorationSource = 1;
      self->_externalAppRedirectState = 4;
      self->_userDrivenLoadWasConsumed = 1;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __26__TabDocument_unhibernate__block_invoke;
      v11[3] = &unk_1E6D791E8;
      id v12 = v4;
      uint64_t v13 = self;
      -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v11);
    }
    else if (v4)
    {
      id v10 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)self, v4, 1);
    }
  }
}

- (void)setLastViewedTime:(double)a3
{
  self->_lastViewedTime = a3;
}

- (void)indexTabToCoreSpotlight
{
  if (-[TabDocument _canDonateToCoreSpotlight]((id *)&self->super.isa))
  {
    id v3 = [MEMORY[0x1E4F98E50] sharedInstance];
    [v3 setTabNeedsSpotlightDonation:self];
  }
}

- (id)_canDonateToCoreSpotlight
{
  if (result)
  {
    uint64_t v1 = result;
    if ([result isShowingErrorPage]) {
      return 0;
    }
    uint64_t v2 = [v1[129] _safeBrowsingWarning];

    if (v2)
    {
      return 0;
    }
    else
    {
      int result = (id *)[v1[154] allowsUserActivityFeedback];
      if (result) {
        return (id *)([v1 isShowingSystemStartPage] ^ 1);
      }
    }
  }
  return result;
}

- (void)updateTabIcon
{
  id v3 = [(TabDocument *)self URL];
  if ([v3 isEqual:self->_cachedURL]) {
    goto LABEL_24;
  }
  -[TabDocument _cancelFaviconUpdate]((uint64_t)self);
  objc_storeStrong((id *)&self->_cachedURL, v3);
  if (!v3)
  {
    libraryType = self->_libraryType;
    if (!libraryType)
    {
      id v17 = [MEMORY[0x1E4F78580] favoritesFavicon];
LABEL_23:
      -[TabDocument _setIcon:isMonogram:]((uint64_t)self, v17, 0);

      goto LABEL_24;
    }
    uint64_t v8 = libraryType;
    if ([(NSString *)v8 isEqualToString:@"BookmarksCollection"])
    {
      uint64_t v9 = [MEMORY[0x1E4F78580] bookmarksFavicon];
    }
    else if ([(NSString *)v8 isEqualToString:@"CloudTabsCollection"])
    {
      uint64_t v9 = [MEMORY[0x1E4F78580] fallbackFavicon];
    }
    else if ([(NSString *)v8 isEqualToString:@"HistoryCollection"])
    {
      uint64_t v9 = [MEMORY[0x1E4F78580] historyFavicon];
    }
    else if ([(NSString *)v8 isEqualToString:@"ReadingListCollection"])
    {
      uint64_t v9 = [MEMORY[0x1E4F78580] readingListFavicon];
    }
    else
    {
      if (![(NSString *)v8 isEqualToString:@"SharedWithYouCollection"])
      {
        id v17 = 0;
        goto LABEL_22;
      }
      uint64_t v9 = [MEMORY[0x1E4F78580] sharedWithYouFavicon];
    }
    id v17 = (void *)v9;
LABEL_22:

    goto LABEL_23;
  }
  id v4 = [v3 absoluteString];
  int v5 = [v4 isEqualToString:@"about:blank"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F78580] fallbackFavicon];
    -[TabDocument _setIcon:isMonogram:]((uint64_t)self, v6, 0);
  }
  else
  {
    if (!objc_msgSend(v3, "safari_isSafariWebExtensionURL"))
    {
      objc_initWeak(&location, self);
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F98AE8]) initWithURL:v3 iconSize:2 fallbackType:+[TabIconAndTitleView defaultTabIconSize]()];
      long long v14 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __28__TabDocument_updateTabIcon__block_invoke;
      v18[3] = &unk_1E6D7D088;
      objc_copyWeak(&v19, &location);
      uint64_t v15 = [v14 registerRequest:v13 priority:2 responseHandler:v18];
      id faviconToken = self->_faviconToken;
      self->_id faviconToken = v15;

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_24;
    }
    id v10 = [(TabDocument *)self webExtensionsController];
    uint64_t v11 = [v3 host];
    id v6 = [v10 webExtensionForBaseURIHost:v11];

    id v12 = [v6 icon];
    -[TabDocument _setIcon:isMonogram:]((uint64_t)self, v12, 0);
  }
LABEL_24:
}

- (void)_setIcon:(int)a3 isMonogram:
{
  id v5 = a2;
  if (a1)
  {
    id v10 = v5;
    if (a3) {
      id v6 = 0;
    }
    else {
      id v6 = v5;
    }
    [*(id *)(a1 + 1080) setIcon:v6];
    [*(id *)(a1 + 1064) setIcon:v10];
    [*(id *)(a1 + 1072) setIcon:v10];
    [*(id *)(a1 + 1088) setIcon:v6];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    uint64_t v8 = [WeakRetained tabCollectionViewProvider];
    uint64_t v9 = [v8 iconPool];
    [v9 iconDidChangeForIdentifier:*(void *)(a1 + 1336)];

    id v5 = v10;
  }
}

- (void)_cancelFaviconUpdate
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 568));
    if (([WeakRetained isValid] & 1) != 0 || *(void *)(a1 + 552))
    {
      uint64_t v2 = *(void **)(a1 + 544);
      *(void *)(a1 + 544) = 0;
    }
    [WeakRetained invalidate];
    id v3 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
    [v3 cancelRequestWithToken:*(void *)(a1 + 552)];

    id v4 = *(void **)(a1 + 552);
    *(void *)(a1 + 552) = 0;
  }
}

- (BOOL)canGoForward
{
  return [(LoadingController *)self->_loadingController canGoForward];
}

- (BOOL)canGoBack
{
  return [(LoadingController *)self->_loadingController canGoBack];
}

- (void)_updateActiveExtensionsIfNecessary
{
  if (!a1) {
    return;
  }
  if ([MEMORY[0x1E4F97EA0] isInternalInstall])
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    char v3 = [v2 BOOLForKey:@"DebugHideAllExtensionButtons"];

    if (v3) {
      return;
    }
  }
  id v4 = [(id)a1 webExtensionsController];
  objc_msgSend(*(id *)(a1 + 280), "setNeedsExtensionBadge:", objc_msgSend(v4, "hasUpdatedToolbarItemBadgeTextInTab:", a1));
  id v5 = [(id)a1 urlForExtensions];
  if (objc_msgSend(v5, "safari_isSafariWebExtensionURL"))
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    id v7 = [v5 host];
    uint64_t v8 = (void *)[v6 initWithUUIDString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = objc_msgSend(v4, "enabledExtensions", v8);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke;
  v28[3] = &unk_1E6D7D918;
  id v10 = v4;
  id v29 = v10;
  uint64_t v30 = a1;
  id v11 = v5;
  id v31 = v11;
  id v12 = v8;
  id v32 = v12;
  uint64_t v13 = objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", v28);

  unint64_t v14 = [v13 count];
  id v26 = [(id)a1 contentBlockerManager];
  if ([(id)a1 isPrivateBrowsingEnabled])
  {
    uint64_t v15 = [v10 enabledExtensions];
    if (![v15 count])
    {
      int v16 = [v26 enabledExtensions];
      BOOL v17 = v16 != 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v15 = [v10 extensions];
    if (![v15 count])
    {
      int v16 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      if ([v16 BOOLForKey:*MEMORY[0x1E4F99230]])
      {
        BOOL v17 = 1;
      }
      else
      {
        char v18 = [v26 extensions];
        BOOL v17 = [v18 count] != 0;
      }
      goto LABEL_15;
    }
  }
  BOOL v17 = 1;
LABEL_16:

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
  uint64_t v20 = [WeakRetained tabBarManager];

  if (v17)
  {
    if ([v20 displayMode] == 2)
    {
      BOOL v21 = 1;
    }
    else
    {
      int v22 = [v20 inlineTabBar];
      if (([v22 usesMoreMenu] & 1) != 0 || !*(unsigned char *)(a1 + 938))
      {
        BOOL v21 = 0;
      }
      else
      {
        uint64_t v23 = [*(id *)(a1 + 280) text];
        BOOL v21 = [v23 length] == 0;
      }
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  if (v14 > 2)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke_2;
    v27[3] = &unk_1E6D7D940;
    v27[4] = a1;
    uint64_t v24 = objc_msgSend(v13, "safari_mapAndFilterObjectsUsingBlock:", v27);
  }
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F78510]) initWithActiveExtensionCount:v14 alwaysShowMultipleExtensionsButton:v21 buttons:v24 extensionsController:v10];
  [*(id *)(a1 + 280) setExtensionButtonConfiguration:v25];

  [*(id *)(a1 + 280) setExtensionsAreActive:v14 != 0];
}

- (SFContentBlockerManager)contentBlockerManager
{
  int v3 = [(_SFBrowserConfiguration *)self->_configuration isPrivateBrowsingEnabled];
  id v4 = +[Application sharedApplication];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 contentBlockerManagerForProfileServerID:*MEMORY[0x1E4F980C8]];
  }
  else
  {
    id v7 = [(TabDocument *)self profile];
    uint64_t v8 = [v7 identifierForExtensions];
    id v6 = [v5 contentBlockerManagerForProfileServerID:v8];
  }
  return (SFContentBlockerManager *)v6;
}

- (BOOL)isPreparingForNewUserActivity
{
  return self->_preparingForNewUserActivity;
}

- (void)sfWebViewDidChangeSafeAreaInsets:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentDidChangeSafeAreaInsets:self];
}

- (BOOL)isAudible
{
  if ([(_SFWebView *)self->_webView _isPlayingAudio]) {
    return 1;
  }
  lastSiriReaderSessionIdentifier = self->_lastSiriReaderSessionIdentifier;
  id v5 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  id v6 = [v5 activeSiriReaderSessionIdentifier];
  LODWORD(lastSiriReaderSessionIdentifier) = [(NSString *)lastSiriReaderSessionIdentifier isEqualToString:v6];

  if (!lastSiriReaderSessionIdentifier) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v8 = [WeakRetained siriReaderPlaybackStateForActiveTab];

  return v8 == 1;
}

void __47__TabDocument__fireOnUpdatedExtensionEventSoon__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 922))
    {
      id v1 = objc_loadWeakRetained(WeakRetained + 120);

      if (v1) {
        -[TabDocument _fireOnUpdatedExtensionEvent](WeakRetained);
      }
    }
  }
}

- (void)_fireOnUpdatedExtensionEvent
{
  if (a1)
  {
    uint64_t v2 = a1[130];
    [a1 setChangedPropertiesForOnUpdatedWebExtensionEvent:0];
    id v3 = [a1 webExtensionsController];
    [v3 fireOnUpdatedEventForTab:a1 withChangedProperties:v2];
  }
}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  __int16 v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((v4 & 4) != 0) {
    [(WBSFluidProgressController *)self->_fluidProgressController startRocketEffectWithProgressStateSource:self];
  }
  if (v4)
  {
    self->_didFirstLayout = 1;
    [(_SFFormAutoFillController *)self->_autoFillController prefillFormsSoonIfNeeded];
  }
  if ((v4 & 2) != 0)
  {
    linkPreviewViewController = self->_linkPreviewViewController;
    uint64_t v8 = [(TabDocument *)self URLString];
    [(LinkPreviewViewController *)linkPreviewViewController updatePreviewLoadingUIWithURLString:v8];

    uint64_t v9 = [(TabDocument *)self expectedOrCurrentURL];
    urlForDisplayedContent = self->_urlForDisplayedContent;
    self->_urlForDisplayedContent = v9;

    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = self->_renderingProgressEventObservers;
    uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v15 webViewDidFirstVisuallyNonEmptyLayoutForTabDocument:self];
          }
        }
        uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }
  }
  if ((v4 & 0x100) != 0)
  {
    BOOL didFirstMeaningfulPaint = self->_didFirstMeaningfulPaint;
    *(_WORD *)&self->_BOOL didFirstMeaningfulPaint = 257;
    if (!didFirstMeaningfulPaint)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      BOOL v17 = self->_renderingProgressEventObservers;
      uint64_t v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v17);
            }
            BOOL v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v21, "webViewDidFirstMeaningfulPaintForTabDocument:", self, (void)v25);
            }
          }
          uint64_t v18 = [(NSHashTable *)v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v18);
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v4 & 0x40) != 0)
  {
    [(_SFWebView *)self->_webView setObscuringContents:0];
    self->_didFirstPaint = 1;
    appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
    if (appBannerPendingFirstPaint)
    {
      if (self->_appBannerRemovalWasDeferred)
      {
        [WeakRetained removeAppBannerFromTabDocument:self animated:0];
        [(SFPinnableBanner *)self->_appBannerPendingFirstPaint setInitiallyBehindNavigationBar:0];
        appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
      }
      objc_storeStrong((id *)&self->_appBanner, appBannerPendingFirstPaint);
      uint64_t v24 = self->_appBannerPendingFirstPaint;
      self->_appBannerPendingFirstPaint = 0;

      [WeakRetained tabDocumentDidCompleteCheckForAppBanner:self];
    }
    else if (self->_appBannerRemovalWasDeferred)
    {
      -[TabDocument _startAppBannerRemovalTimer](self);
    }
  }
  if ((v4 & 8) != 0) {
    [(_SFWebView *)self->_webView setPlaceholderImage:0];
  }
  [(TabDocument *)self updateAccessibilityIdentifier];
}

- (void)_fireOnUpdatedExtensionEventSoon
{
  if (a1)
  {
    [a1[100] invalidate];
    id v2 = a1[100];
    a1[100] = 0;

    objc_initWeak(&location, a1);
    id v3 = (void *)MEMORY[0x1E4F1CB00];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__TabDocument__fireOnUpdatedExtensionEventSoon__block_invoke;
    v6[3] = &unk_1E6D7D060;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:0.1];
    id v5 = a1[100];
    a1[100] = (id)v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

uint64_t __30__TabDocument_NonARC__release__block_invoke()
{
  if (pthread_main_np()) {
    return 1;
  }
  id v1 = WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    __30__TabDocument_NonARC__release__block_invoke_cold_1(v1);
  }
  return 2;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_retainCount + 2) >> 1;
}

+ (id)urlForExternalURL:(id)a3 forPrivateBrowsing:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (objc_msgSend(v5, "safari_isXWebSearchURL"))
  {
    id v6 = +[SearchQueryBuilder searchQueryBuilderWithXWebSearchURL:v5 forPrivateBrowsing:v4];
    id v7 = [v6 searchURL];

    uint64_t v8 = [v6 queryString];
    if ([v8 length])
    {
      uint64_t v9 = +[RecentWebSearchesController sharedController];
      [v9 addRecentSearch:v8];
    }
LABEL_7:

    if (v7 != v5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "safari_isSafariSpecificURL"))
  {
    objc_msgSend(v5, "safari_URLByNormalizingSafariSpecificURL");
    id v6 = v5;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  id v10 = (void *)MEMORY[0x1E4F1CB10];
  id v11 = objc_msgSend(v5, "safari_userVisibleString");
  objc_msgSend(v10, "safari_URLWithUserTypedString:", v11);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  uint64_t v12 = [v7 scheme];
  int v13 = [v12 isEqualToString:@"com-apple-mobilesafari-tab"];

  if (!v13) {
    goto LABEL_20;
  }
  unint64_t v14 = [v7 resourceSpecifier];
  uint64_t v15 = [v14 componentsSeparatedByString:@"?"];

  if ((unint64_t)[v15 count] <= 2 && objc_msgSend(v15, "count"))
  {
    int v16 = [v15 objectAtIndex:0];
    BOOL v17 = [v16 stringByRemovingPercentEncoding];

    uint64_t v18 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 scheme];
      if ([v20 isEqualToString:@"http"])
      {

LABEL_16:
        uint64_t v23 = v7;
LABEL_18:

        id v7 = v19;
        goto LABEL_19;
      }
      BOOL v21 = [v19 scheme];
      char v22 = [v21 isEqualToString:@"https"];

      if (v22) {
        goto LABEL_16;
      }
    }
    uint64_t v23 = v19;
    uint64_t v19 = v7;
    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
  return v7;
}

- (TabDocument)initWithBrowserController:(id)a3
{
  id v4 = a3;
  id v5 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:](self, "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, [v4 isPrivateBrowsingEnabled], objc_msgSend(v4, "isControlledByAutomation"), 0, 0, v4, 0);

  return v5;
}

- (id)initForBackgroundLoadingWithBrowserController:(id)a3 relatedWebView:(id)a4 webViewToCloneSessionStorageFrom:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 isPrivateBrowsingEnabled];
  uint64_t v12 = [v8 isControlledByAutomation];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__TabDocument_initForBackgroundLoadingWithBrowserController_relatedWebView_webViewToCloneSessionStorageFrom___block_invoke;
  v17[3] = &unk_1E6D79970;
  uint64_t v18 = self;
  id v13 = v9;
  id v19 = v13;
  id v14 = v10;
  id v20 = v14;
  id v15 = -[TabDocument _initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:bookmark:browserController:createDocumentView:](v18, 0, 0, 0, v11, v12, 0, v8, v17);

  return v15;
}

void __109__TabDocument_initForBackgroundLoadingWithBrowserController_relatedWebView_webViewToCloneSessionStorageFrom___block_invoke(void *a1)
{
  id v1 = (void *)a1[4];
  id v2 = (void *)a1[5];
  id v3 = (void *)a1[6];
  id v5 = [v2 configuration];
  id v4 = [v5 websiteDataStore];
  -[TabDocument _createDocumentViewRelatedTo:webViewToCloneSessionStorageFrom:websiteDataStore:deferrableUserScriptsShouldWaitUntilNotification:](v1, v2, v3, v4);
}

- (void)_createDocumentViewRelatedTo:(void *)a1 webViewToCloneSessionStorageFrom:(void *)a2 websiteDataStore:(void *)a3 deferrableUserScriptsShouldWaitUntilNotification:(void *)a4
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = [a1 createWebViewConfiguration];
    id v10 = v9;
    if (v15)
    {
      objc_msgSend(v9, "_setRelatedWebView:");
      uint64_t v11 = [v15 configuration];
      uint64_t v12 = [v11 processPool];
      [v10 setProcessPool:v12];

      id v13 = [v15 configuration];
      id v14 = [v13 websiteDataStore];
      [v10 setWebsiteDataStore:v14];
    }
    else if (v8)
    {
      [v9 setWebsiteDataStore:v8];
    }
    [v10 _setWebViewToCloneSessionStorageFrom:v7];
    -[TabDocument _createDocumentViewWithConfiguration:]((uint64_t)a1, v10);
  }
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  if ([(TabDocument *)self isPrivateBrowsingEnabled]) {
    [v6 appendString:@"PRIVATE; "];
  }
  if ([(TabDocument *)self isControlledByAutomation]) {
    [v6 appendString:@"AUTOMATION; "];
  }
  if (self->_pinned) {
    [v6 appendString:@"PINNED; "];
  }
  if ([(TabDocument *)self isHibernated]) {
    [v6 appendString:@"HIBERNATED; "];
  }
  id v7 = [(TabDocument *)self URL];
  [v6 appendFormat:@"url = %@>", v7];

  return (NSString *)v6;
}

- (void)setInitialURLForStatePersisting:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(LoadingController *)self->_loadingController setTitle:v6];
  [(LoadingController *)self->_loadingController setURL:v7];
}

- (void)dealloc
{
  self->_beingReleased = 1;
  [(NSTimer *)self->_fireOnUpdatedWebExtensionEventTimer invalidate];
  fireOnUpdatedWebExtensionEventTimer = self->_fireOnUpdatedWebExtensionEventTimer;
  self->_fireOnUpdatedWebExtensionEventTimer = 0;

  -[TabDocument _destroyDocumentView]((uint64_t)self);
  [(LoadingController *)self->_loadingController setDelegate:0];
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator removeObserver:self forKeyPath:@"UIShouldReflectCommittedURLInsteadOfCurrentURL" context:kTabDocumentObserverContext];
  [(TabDocument *)self willClose];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  id v5 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v5 removeObserver:self];

  [(WBSFluidProgressController *)self->_fluidProgressController setWindowDelegate:0];
  [(WBSFluidProgressController *)self->_fluidProgressController setDelegate:0];
  [(TabDocument *)self clearReaderContext];
  -[TabDocument invalidateUserActivity]((uint64_t)self);
  [(TabDocument *)self clearPageLoadStatistics];
  pendingNavigationActionDueToExternalSchemePromptHandler = (void (**)(id, void))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  if (pendingNavigationActionDueToExternalSchemePromptHandler) {
    pendingNavigationActionDueToExternalSchemePromptHandler[2](pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)TabDocument;
  [(TabDocument *)&v7 dealloc];
}

- (void)_destroyDocumentView
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1E102C000, v0, OS_LOG_TYPE_FAULT, "-[TabDocument _destroyDocumentView] must be called on the main thread", v1, 2u);
}

- (id)_debugOverrideTitle
{
  id v1 = a1;
  if (a1)
  {
    id v2 = [a1 URL];
    if (WBSIsEqual())
    {
      id v1 = (id *)v1[105];
    }
    else
    {
      objc_storeStrong(v1 + 106, v2);
      id v3 = v1[105];
      v1[105] = 0;

      id v4 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
      id v5 = [v2 absoluteString];
      id v6 = [v4 listWithID:0 skipOffset:0 includeHidden:0 includeDescendantsAsChildren:1 filteredUsingString:v5];

      if ([v6 bookmarkCount])
      {
        objc_super v7 = [v6 bookmarkAtIndex:0];
        uint64_t v8 = [v7 title];
        id v9 = v1[105];
        v1[105] = (id)v8;
      }
      id v1 = (id *)v1[105];
    }
  }
  return v1;
}

- (void)updateTabIconWithDelay:(double)a3
{
  objc_initWeak(&location, self);
  -[TabDocument _cancelFaviconUpdate]((uint64_t)self);
  id v5 = (void *)MEMORY[0x1E4F1CB00];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TabDocument_updateTabIconWithDelay___block_invoke;
  v7[3] = &unk_1E6D7D060;
  objc_copyWeak(&v8, &location);
  id v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v7 block:a3];
  objc_storeWeak((id *)&self->_updateFaviconTimer, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__TabDocument_updateTabIconWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateTabIcon];
}

- (void)updateUsesDarkTheme
{
  id v8 = [(TabDocument *)self configuration];
  id v3 = [v8 traitEnvironment];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  id v6 = [(_SFReaderController *)self->_readerContext configurationManager];
  [v6 setDarkModeEnabled:v5 == 2];

  [(_SFReaderController *)self->_readerContext sendConfigurationToWebProcess];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_super v7 = [WeakRetained tabCollectionViewProvider];
  [v7 invalidateSnapshotForTab:self];
}

void __28__TabDocument_updateTabIcon__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = v9;
    uint64_t v5 = [v4 favicon];
    id v6 = objc_loadWeakRetained(WeakRetained + 120);
    objc_super v7 = [v6 rootViewController];
    id v8 = [v7 tabBar];

    if (v8) {
      objc_msgSend(v5, "sf_registerFaviconForDarkUserInterfaceStyle");
    }
    -[TabDocument _setIcon:isMonogram:]((uint64_t)WeakRetained, v5, [v4 faviconType] == 0);
  }
}

- (void)webView:(id)a3 shouldLoadIconWithParameters:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void))a5;
  id v9 = [(TabDocument *)self URL];
  if (!v9
    || [v7 iconType]
    || ([v7 attributes],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 objectForKeyedSubscript:@"mask"],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    v8[2](v8, 0);
  }
  else
  {
    uint64_t v12 = [v7 url];
    if (objc_msgSend(v12, "safari_isHTTPFamilyURL") & 1) != 0 || (objc_msgSend(v12, "isFileURL"))
    {
      id v13 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
      id v14 = [v13 faviconProvider];

      BOOL v15 = [(TabDocument *)self isPrivateBrowsingEnabled];
      int v16 = [v7 size];
      [v16 floatValue];
      float v18 = v17;
      id v19 = [v7 size];
      [v19 floatValue];
      double v21 = v20;

      char v22 = self->_originalURL;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke;
      v25[3] = &unk_1E6D7D120;
      id v26 = v9;
      id v27 = v12;
      long long v30 = v8;
      id v23 = v14;
      id v28 = v23;
      long long v29 = v22;
      double v31 = v18;
      double v32 = v21;
      BOOL v33 = v15;
      uint64_t v24 = v22;
      objc_msgSend(v23, "shouldIconDataBeSavedForIconWithPageURL:originalPageURL:iconURL:size:isPrivate:completionHandler:", v26, v24, v27, v15, v25, v18, v21);
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

void __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_2;
  v3[3] = &unk_1E6D7D0F8;
  char v10 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  long long v9 = *(_OWORD *)(a1 + 72);
  char v11 = *(unsigned char *)(a1 + 88);
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = *(void *)(a1 + 64);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_4;
    v4[3] = &unk_1E6D7D0D0;
    id v5 = *(id *)(a1 + 48);
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 56);
    long long v9 = *(_OWORD *)(a1 + 72);
    char v10 = *(unsigned char *)(a1 + 89);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "safari_hasSameSiteAsURL:", *(void *)(a1 + 40));
    id v3 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    v3();
  }
}

uint64_t __70__TabDocument_webView_shouldLoadIconWithParameters_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveFaviconImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 80), 0, *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_searchEngineControllerDidFinishPopulating:(id)a3
{
  -[TabDocument _updateNavigationBarItem]((uint64_t)self);
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F3B1D8] object:0];
}

- (uint64_t)isPageEligibileToShowNotSecureWarning
{
  uint64_t v1 = (uint64_t)a1;
  if (a1)
  {
    uint64_t v2 = [a1 expectedOrCurrentURL];
    if ((objc_msgSend(v2, "safari_isEligibleToShowNotSecureWarning") & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0
      && [*(id *)(v1 + 1032) _negotiatedLegacyTLS])
    {
      id v3 = [*(id *)(v1 + 1032) _committedURL];
      id v4 = [v3 host];
      id v5 = objc_msgSend(v4, "safari_highLevelDomainFromHost");
      id v6 = [(id)v1 expectedOrCurrentURL];
      id v7 = [v6 host];
      id v8 = objc_msgSend(v7, "safari_highLevelDomainFromHost");
      if ([v5 isEqualToString:v8])
      {
        if ([*(id *)(v1 + 280) showsSecurityAnnotation])
        {
          if (*(unsigned char *)(v1 + 951)) {
            uint64_t v1 = 1;
          }
          else {
            uint64_t v1 = *(unsigned char *)(v1 + 713) != 0;
          }
        }
        else
        {
          long long v9 = *(void **)(v1 + 720);
          char v10 = [(id)v1 expectedOrCurrentURL];
          if ([v9 isEqual:v10])
          {
            if (*(unsigned char *)(v1 + 951)) {
              uint64_t v1 = 1;
            }
            else {
              uint64_t v1 = *(unsigned char *)(v1 + 713) != 0;
            }
          }
          else
          {
            uint64_t v1 = 0;
          }
        }
      }
      else
      {
        uint64_t v1 = 0;
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__TabDocument__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E6D791E8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __49__TabDocument__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) object];
  if (v2 == *(void **)(*(void *)(a1 + 40) + 1024))
  {
    id v8 = v2;
    id v3 = [*(id *)(a1 + 32) userInfo];
    id v4 = objc_msgSend(v3, "safari_numberForKey:", *MEMORY[0x1E4F99730]);

    if ([v4 unsignedIntegerValue])
    {
      [*(id *)(*(void *)(a1 + 40) + 280) setShowsTranslationButton:1];
      id v5 = *(void **)(a1 + 40);
      id v6 = (void *)v5[132];
      id v7 = [v5 URL];
      [v6 didFindLocalContentWithOptions:64 forURL:v7];
    }
    uint64_t v2 = v8;
  }
}

- (SFBrowserDocumentTrackerInfo)trackerInfo
{
  trackerInfo = self->_trackerInfo;
  if (!trackerInfo)
  {
    id v4 = (SFBrowserDocumentTrackerInfo *)[objc_alloc(MEMORY[0x1E4F3AE70]) initWithDocument:self];
    id v5 = self->_trackerInfo;
    self->_trackerInfo = v4;

    id v6 = [(SFBrowserDocumentTrackerInfo *)self->_trackerInfo queryParameterFilteringDataQueue];
    [v6 setDelegate:self];

    trackerInfo = self->_trackerInfo;
  }
  return trackerInfo;
}

- (id)itemForTabCollectionView:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = 1080;
LABEL_9:
    unifiedTabBarItem = *(UnifiedTabBarItem **)((char *)&self->super.isa + v5);
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = 1064;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = 1088;
    goto LABEL_9;
  }
  int v6 = [v4 isStandalone];
  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v6)
  {
    id v8 = [(UnifiedTabBarItem *)unifiedTabBarItem secondaryItem];
    goto LABEL_11;
  }
LABEL_10:
  id v8 = unifiedTabBarItem;
LABEL_11:
  long long v9 = v8;

  return v9;
}

- (NSArray)tabCollectionItems
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  tabOverviewItem = self->_tabOverviewItem;
  tabCollectionItem = self->_tabCollectionItem;
  id v8 = tabOverviewItem;
  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (unifiedTabBarItem)
  {
    tabBarItem = [(TabDocument *)self currentUnifiedTabBarItem];
  }
  else
  {
    tabBarItem = self->_tabBarItem;
  }
  long long v9 = tabBarItem;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&tabCollectionItem count:3];
  if (unifiedTabBarItem) {

  }
  return (NSArray *)v5;
}

- (id)_localAttributes
{
  uint64_t v1 = a1;
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*((unsigned char *)a1 + 816))
    {
      v22[0] = @"url";
      uint64_t v2 = [a1[103] absoluteString];
      id v3 = (void *)v2;
      id v4 = &stru_1F3C268E8;
      if (v2) {
        uint64_t v5 = (__CFString *)v2;
      }
      else {
        uint64_t v5 = &stru_1F3C268E8;
      }
      v22[1] = @"title";
      v23[0] = v5;
      if (v1[104]) {
        id v4 = (__CFString *)v1[104];
      }
      v23[1] = v4;
      uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = objc_alloc(MEMORY[0x1E4FB6070]);
    double v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)v1 + 142)];
    float v20 = (void *)v6;
    id v19 = -[TabDocument _sessionStateWithoutParentItem](v1);
    id v8 = [v19 data];
    long long v9 = [v1 ancestorTabIdentifiers];
    int v10 = *((unsigned __int8 *)v1 + 705);
    uint64_t v11 = (uint64_t)v1[145];
    uint64_t v12 = [v1 readingListBookmarkID];
    int v13 = *((unsigned __int8 *)v1 + 923);
    int v14 = *((unsigned __int8 *)v1 + 924);
    BOOL v15 = [v1[165] uuid];
    int v16 = [v15 UUIDString];
    LOBYTE(v18) = v14 != 0;
    uint64_t v1 = (id *)[v7 initWithLastVisitTime:v21 sessionStateData:v8 ancestorTabUUIDs:v9 displayingStandaloneImage:v10 != 0 readerViewTopScrollOffset:v12 readingListBookmarkID:v13 != 0 openedFromLink:(double)v11 showingReader:v18 queuedNavigation:v20 webClipIDString:v16];
  }
  return v1;
}

- (void)_sessionStateWithoutParentItem
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 143);

    if (WeakRetained)
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x2020000000;
      char v7 = 0;
      id v3 = (void *)v1[129];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __45__TabDocument__sessionStateWithoutParentItem__block_invoke;
      v5[3] = &unk_1E6D7D1E8;
      void v5[4] = v1;
      v5[5] = v6;
      uint64_t v1 = [v3 _sessionStateWithFilter:v5];
      _Block_object_dispose(v6, 8);
    }
    else
    {
      uint64_t v1 = [v1 sessionState];
    }
  }
  return v1;
}

- (id)_titleForStatePersistingForTabGroupTab
{
  if (a1)
  {
    uint64_t v2 = -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)a1, 0, 0, 0);
    if (![v2 length] && objc_msgSend(a1[129], "isLoading"))
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 120);
      id v4 = [WeakRetained tabController];
      uint64_t v5 = [v4 existingPersistedTitleForTabDocument:a1];

      uint64_t v2 = (void *)v5;
    }
    if (![v2 length])
    {
      uint64_t v6 = [a1 URL];
      if (v6)
      {
        char v7 = [a1 URL];
        uint64_t v8 = objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");

        uint64_t v2 = v7;
      }
      else
      {
        uint64_t v8 = -[TabDocument _blankTabTitle](a1);
      }

      uint64_t v2 = (void *)v8;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (id)openInTabGroupMenuWithNewTabGroupName:(id)a3 URL:(id)a4 descendantCount:(int64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v14 = [WeakRetained tabController];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__TabDocument_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke;
  v18[3] = &unk_1E6D7D170;
  id v15 = v12;
  void v18[4] = self;
  id v19 = v15;
  int v16 = [v14 openInTabGroupMenuWithNewTabGroupName:v10 URL:v11 descendantCount:a5 handler:v18];

  return v16;
}

void __81__TabDocument_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
  uint64_t v2 = [WeakRetained tabController];
  [v2 removeSingleBlankTabFromActiveTabGroup];
}

- (void)setBrowserController:(id)a3
{
}

- (void)removeRenderingProgressObserver:(id)a3
{
}

- (void)removeNavigationObserver:(id)a3
{
}

- (void)setParentTabDocumentForBackClosesSpawnedTab:(id)a3
{
  id WeakRetained = a3;
  if ([WeakRetained isBlank])
  {

    p_parentTabDocumentForBackClosesSpawnedTab = &self->_parentTabDocumentForBackClosesSpawnedTab;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);

    if (!WeakRetained) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  p_parentTabDocumentForBackClosesSpawnedTab = &self->_parentTabDocumentForBackClosesSpawnedTab;
  id v6 = objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);

  if (v6 != WeakRetained)
  {
    if (WeakRetained)
    {
      char v7 = [WeakRetained _backForwardList];
      uint64_t v8 = [v7 currentItem];
      parentTabItem = self->_parentTabItem;
      self->_parentTabItem = v8;

      id v10 = [WeakRetained webView];
      [v10 _saveBackForwardSnapshotForItem:self->_parentTabItem];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__TabDocument_setParentTabDocumentForBackClosesSpawnedTab___block_invoke;
      v15[3] = &unk_1E6D7D198;
      v15[4] = self;
      id v11 = [v10 _sessionStateWithFilter:v15];
      id v12 = (id)[(_SFWebView *)self->_webView _restoreSessionState:v11 andNavigate:0];

LABEL_8:
      objc_storeWeak((id *)p_parentTabDocumentForBackClosesSpawnedTab, WeakRetained);
      goto LABEL_9;
    }
LABEL_7:
    int v13 = -[TabDocument _sessionStateWithoutParentItem]((id *)&self->super.isa);
    [(TabDocument *)self restoreSessionState:v13 andNavigate:0];

    int v14 = self->_parentTabItem;
    self->_parentTabItem = 0;

    id WeakRetained = 0;
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __59__TabDocument_setParentTabDocumentForBackClosesSpawnedTab___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(*(void *)(a1 + 32) + 200)];
}

- (void)setUpBackClosesSpawnedTabWithParent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _backForwardList];
  id v6 = [v5 currentItem];
  parentTabItem = self->_parentTabItem;
  self->_parentTabItem = v6;

  uint64_t v8 = [v4 webView];
  [v8 _saveBackForwardSnapshotForItem:self->_parentTabItem];
  long long v9 = [(_SFWebView *)self->_webView backForwardList];
  id v10 = [v9 currentItem];

  id v11 = [(_SFWebView *)self->_webView URL];
  if (v11)
  {
    id v12 = [(_SFWebView *)self->_webView backForwardList];
    int v13 = [v12 backItem];
  }
  else
  {
    int v13 = 0;
  }

  webView = self->_webView;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  double v21 = __51__TabDocument_setUpBackClosesSpawnedTabWithParent___block_invoke;
  char v22 = &unk_1E6D7D1C0;
  id v15 = v13;
  id v23 = v15;
  id v16 = v10;
  id v24 = v16;
  float v17 = [(_SFWebView *)webView _sessionStateWithFilter:&v19];
  id v18 = (id)-[_SFWebView _restoreSessionState:andNavigate:](self->_webView, "_restoreSessionState:andNavigate:", v17, 0, v19, v20, v21, v22);
  objc_storeWeak((id *)&self->_parentTabDocumentForBackClosesSpawnedTab, v4);
}

uint64_t __51__TabDocument_setUpBackClosesSpawnedTabWithParent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v3 isEqual:*(void *)(a1 + 40)];
  }

  return v4;
}

uint64_t __45__TabDocument__sessionStateWithoutParentItem__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 200)) {
    return 1;
  }
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t result = 1;
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return 0;
  }
  return result;
}

- (id)_removeParentChildTabDocumentRelations
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (([result canGoBackToParentTab] & 1) == 0) {
      [v1 setParentTabDocumentForBackClosesSpawnedTab:0];
    }
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    uint64_t v2 = objc_msgSend(v1[64], "allObjects", 0);
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
          [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setParentTabDocumentForBackClosesSpawnedTab:0];
        }
        while (v3 != v5);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
      }
      while (v3);
    }

    return (id *)[v1[64] setCount:0];
  }
  return result;
}

void __137__TabDocument_initWithTitle_URL_UUID_privateBrowsingEnabled_controlledByAutomation_hibernated_bookmark_browserController_relatedWebView___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = [v2 configuration];
  uint64_t v3 = [v4 websiteDataStore];
  -[TabDocument _createDocumentViewRelatedTo:webViewToCloneSessionStorageFrom:websiteDataStore:deferrableUserScriptsShouldWaitUntilNotification:](v1, v2, 0, v3);
}

- (TabDocument)initWithTabStateData:(id)a3 hibernated:(BOOL)a4 browserController:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  uint64_t v11 = objc_msgSend(v10, "bookmarkWithID:", objc_msgSend(v8, "readingListBookmarkID"));

  id v12 = (void *)MEMORY[0x1E4F1CB10];
  int v13 = [v8 url];
  int v14 = objc_msgSend(v12, "safari_URLWithDataAsString:", v13);

  id v15 = [v8 title];
  id v16 = objc_alloc(MEMORY[0x1E4F29128]);
  float v17 = [v8 UUIDString];
  id v18 = (void *)[v16 initWithUUIDString:v17];
  uint64_t v19 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:](self, "initWithTitle:URL:UUID:privateBrowsingEnabled:hibernated:bookmark:browserController:", v15, v14, v18, [v8 privateBrowsing], v6, v11, v9);

  if (v19)
  {
    if (v6)
    {
      [v8 lastViewedTime];
      -[TabDocument setLastViewedTime:](v19, "setLastViewedTime:");
    }
    -[TabDocument setShouldRestoreReader:](v19, "setShouldRestoreReader:", [v8 showingReader]);
    -[TabDocument setReaderViewTopScrollOffset:](v19, "setReaderViewTopScrollOffset:", [v8 readerViewTopScrollOffset]);
    -[TabDocument setWasOpenedFromLink:](v19, "setWasOpenedFromLink:", [v8 wasOpenedFromLink]);
    -[TabDocument setDisplayingStandaloneImage:](v19, "setDisplayingStandaloneImage:", [v8 displayingStandaloneImage]);
    uint64_t v20 = [v8 url];
    -[TabDocument setIsBlank:](v19, "setIsBlank:", [v20 length] == 0);

    double v21 = [v8 sessionStateData];

    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F46790]);
      id v23 = [v8 sessionStateData];
      id v24 = (void *)[v22 initWithData:v23];

      if (v24) {
        [(TabDocument *)v19 restoreSessionState:v24 andNavigate:1];
      }
    }
    else if (!v6)
    {
      id v25 = [(TabDocument *)v19 loadURL:v14 userDriven:1];
    }
    id v26 = v19;
  }

  return v19;
}

- (TabDocument)initWithTabGroupTab:(id)a3 privateBrowsingEnabled:(BOOL)a4 hibernated:(BOOL)a5 bookmark:(id)a6 browserController:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v13 = a3;
  id v40 = a6;
  id v39 = a7;
  int v14 = [v13 url];
  if (v14)
  {
    id v15 = [v13 title];
  }
  else
  {
    id v15 = 0;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F29128]);
  float v17 = [v13 uuid];
  id v18 = (void *)[v16 initWithUUIDString:v17];
  uint64_t v19 = [(TabDocument *)self initWithTitle:v15 URL:v14 UUID:v18 privateBrowsingEnabled:v10 hibernated:v9 bookmark:v40 browserController:v39];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_tabGroupTab, a3);
    [(TabDocument *)v19 setIsBlank:v14 == 0];
    uint64_t v20 = [v13 localAttributes];
    double v21 = [v20 ancestorTabUUIDs];
    uint64_t v22 = objc_msgSend(v21, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_187);
    ancestorUUIDs = v19->_ancestorUUIDs;
    v19->_ancestorUUIDs = (NSArray *)v22;

    -[TabDocument setDisplayingStandaloneImage:](v19, "setDisplayingStandaloneImage:", [v20 isDisplayingStandaloneImage]);
    -[TabDocument setWasOpenedFromLink:](v19, "setWasOpenedFromLink:", [v20 wasOpenedFromLink]);
    [v20 readerViewTopScrollOffset];
    [(TabDocument *)v19 setReaderViewTopScrollOffset:(uint64_t)v24];
    -[TabDocument setShouldRestoreReader:](v19, "setShouldRestoreReader:", [v20 isShowingReader]);
    if (v9)
    {
      id v25 = [v20 lastVisitTime];
      [v25 timeIntervalSinceReferenceDate];
      -[TabDocument setLastViewedTime:](v19, "setLastViewedTime:");
    }
    id v26 = objc_alloc(MEMORY[0x1E4F29128]);
    id v27 = [v20 webClipIDString];
    id v28 = (void *)[v26 initWithUUIDString:v27];

    if (v28)
    {
      long long v29 = objc_msgSend(MEMORY[0x1E4FB1F10], "_sf_webClipWithUUID:", v28);
      -[TabDocument setWebClip:]((uint64_t)v19, v29);
    }
    -[TabDocument setPinned:](v19, "setPinned:", [v13 isPinned]);
    long long v30 = [v13 pinnedURL];
    uint64_t v31 = [v30 copy];
    pinnedURL = v19->_pinnedURL;
    v19->_pinnedURL = (NSURL *)v31;

    BOOL v33 = [v13 pinnedTitle];
    uint64_t v34 = [v33 copy];
    pinnedTitle = v19->_pinnedTitle;
    v19->_pinnedTitle = (NSString *)v34;

    if ([v13 isShared]) {
      uint64_t v36 = [v13 isMarkedAsRead] ^ 1;
    }
    else {
      uint64_t v36 = 0;
    }
    [(TabDocument *)v19 setUnread:v36];
    v19->_shouldDonatePageLoad = 1;
    [(TabDocument *)v19 restoreStateFromTab:v13];
    uint64_t v37 = v19;
  }
  return v19;
}

id __96__TabDocument_initWithTabGroupTab_privateBrowsingEnabled_hibernated_bookmark_browserController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];

  return v3;
}

- (void)setWebClip:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    id v4 = [*(id *)(a1 + 1320) uuid];
    uint64_t v5 = [v8 uuid];
    char v6 = WBSIsEqual();

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 1320), a2);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
      [WeakRetained tabDocumentDidChangeWebClip:a1];
    }
  }
}

- (TabDocument)initWithHibernatedTab:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TabDocument *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 wbTab];
    tabGroupTab = v5->_tabGroupTab;
    v5->_tabGroupTab = (WBTab *)v6;

    id v8 = [v4 url];
    if (v8)
    {
      BOOL v9 = [v4 title];
    }
    else
    {
      BOOL v9 = 0;
    }
    uint64_t v10 = [v4 uuid];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v10;

    id v12 = [v4 browserController];
    [(TabDocument *)v5 setBrowserController:v12 afterTabGroupReuse:0];
    id v13 = objc_alloc(MEMORY[0x1E4F3AF28]);
    uint64_t v14 = [v4 isPrivateBrowsingEnabled];
    id v15 = [v12 rootViewController];
    uint64_t v16 = objc_msgSend(v13, "initWithPrivateBrowsingEnabled:traitEnvironment:controlledByAutomation:", v14, v15, objc_msgSend(v12, "isControlledByAutomation"));
    configuration = v5->_configuration;
    v5->_configuration = (_SFBrowserConfiguration *)v16;

    v5->_hibernated = 1;
    id v18 = objc_alloc_init(LoadingController);
    loadingController = v5->_loadingController;
    v5->_loadingController = v18;

    [(LoadingController *)v5->_loadingController setDelegate:v5];
    [(LoadingController *)v5->_loadingController setTitle:v9];
    [(LoadingController *)v5->_loadingController setURL:v8];
    -[TabDocument _setUp]((uint64_t)v5);
    uint64_t v20 = [v4 unifiedTabBarItem];
    unifiedTabBarItem = v5->_unifiedTabBarItem;
    v5->_unifiedTabBarItem = (UnifiedTabBarItem *)v20;

    uint64_t v22 = [v4 tabBarItem];
    tabBarItem = v5->_tabBarItem;
    v5->_tabBarItem = (TabBarItem *)v22;

    uint64_t v24 = [v4 tabCollectionItem];
    tabCollectionItem = v5->_tabCollectionItem;
    v5->_tabCollectionItem = (TabDocumentCollectionItem *)v24;

    uint64_t v26 = [v4 tabOverviewItem];
    tabOverviewItem = v5->_tabOverviewItem;
    v5->_tabOverviewItem = (TabOverviewItem *)v26;

    id v28 = [v4 cachedNavigationBarItem];

    if (v28)
    {
      uint64_t v29 = [v4 cachedNavigationBarItem];
      navigationBarItem = v5->_navigationBarItem;
      v5->_navigationBarItem = (SFNavigationBarItem *)v29;

      -[TabDocument _setUpNavigationBarItem]((uint64_t)v5);
    }
    [v4 idForWebExtensions];
    v5->_idForWebExtensions = v31;
    [(TabDocument *)v5 setChangedPropertiesForOnUpdatedWebExtensionEvent:0];
    [(TabDocument *)v5 setIsBlank:v8 == 0];
    uint64_t v32 = [v4 ancestorUUIDs];
    ancestorUUIDs = v5->_ancestorUUIDs;
    v5->_ancestorUUIDs = (NSArray *)v32;

    uint64_t v34 = [(WBTab *)v5->_tabGroupTab localAttributes];
    v5->_displayingStandaloneImage = [v34 isDisplayingStandaloneImage];
    v5->_wasOpenedFromLink = [v34 wasOpenedFromLink];
    [v34 readerViewTopScrollOffset];
    v5->_readerViewTopScrollOffset = (uint64_t)v35;
    v5->_shouldRestoreReader = [v34 isShowingReader];
    uint64_t v36 = [v34 lastVisitTime];
    [v36 timeIntervalSinceReferenceDate];
    v5->_lastViewedTime = v37;

    id v38 = objc_alloc(MEMORY[0x1E4F29128]);
    id v39 = [v34 webClipIDString];
    id v40 = (void *)[v38 initWithUUIDString:v39];

    if (v40)
    {
      v41 = objc_msgSend(MEMORY[0x1E4FB1F10], "_sf_webClipWithUUID:", v40);
      -[TabDocument setWebClip:]((uint64_t)v5, v41);
    }
    -[TabDocument setPinned:](v5, "setPinned:", [v4 isPinned]);
    v42 = [v4 pinnedURL];
    uint64_t v43 = [v42 copy];
    pinnedURL = v5->_pinnedURL;
    v5->_pinnedURL = (NSURL *)v43;

    id v45 = [v4 pinnedTitle];
    uint64_t v46 = [v45 copy];
    pinnedTitle = v5->_pinnedTitle;
    v5->_pinnedTitle = (NSString *)v46;

    uint64_t v48 = [v4 shareParticipants];
    shareParticipants = v5->_shareParticipants;
    v5->_shareParticipants = (NSArray *)v48;

    v5->_unread = [v4 isUnread];
    v5->_shouldDonatePageLoad = 1;
    [(TabDocument *)v5 restoreStateFromTab:v5->_tabGroupTab];
    id v50 = v5;
  }
  return v5;
}

- (void)setUnifiedTabBarItem:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = *(id *)(a1 + 1072);
    if (v5 != v4)
    {
      uint64_t v11 = v4;
      uint64_t v6 = [v5 title];
      [v11 setTitle:v6];
      long long v7 = (id *)(a1 + 1072);

      id v8 = [*(id *)(a1 + 1072) icon];
      [v11 setIcon:v8];

      [v11 setUUID:*(void *)(a1 + 1336)];
      [v11 setNavigationBarItem:*(void *)(a1 + 280)];
      [v11 setPinned:*(unsigned __int8 *)(a1 + 919)];
      BOOL v9 = [*(id *)(a1 + 1072) navigationBarItem];
      uint64_t v10 = *(void **)(a1 + 280);

      if (v9 == v10) {
        [*v7 setNavigationBarItem:0];
      }
      objc_storeStrong(v7, a2);
      id v4 = v11;
    }
  }
}

- (UnifiedTabBarItem)currentUnifiedTabBarItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = [WeakRetained tabBarManager];
  uint64_t v5 = [v4 displayMode];

  unifiedTabBarItem = self->_unifiedTabBarItem;
  if (v5 == 2)
  {
    long long v7 = [(UnifiedTabBarItem *)unifiedTabBarItem secondaryItem];
  }
  else
  {
    long long v7 = unifiedTabBarItem;
  }
  return v7;
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
  uint64_t v6 = [(TabOverviewItem *)self->_tabOverviewItem cachedTopBarTheme];
  if (!v6
    || (uint64_t v7 = [(_SFBrowserConfiguration *)self->_configuration barTintStyle],
        v7 != [v6 tintStyle])
    || ([v6 preferredBarTintColor],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = WBSIsEqual(),
        v8,
        (v9 & 1) == 0))
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F78548], "themeWithBarTintStyle:preferredBarTintColor:controlsTintColor:", -[_SFBrowserConfiguration barTintStyle](self->_configuration, "barTintStyle"), v5, 0);

    uint64_t v6 = (void *)v10;
    [(TabOverviewItem *)self->_tabOverviewItem setCachedTopBarTheme:v10];
  }

  return v6;
}

- (void)_clearLibraryType
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 1288);
    if (v2)
    {
      *(void *)(a1 + 1288) = 0;
      id v3 = v2;

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
      [WeakRetained tabDocument:a1 didClearLibraryType:v3];
    }
  }
}

- (BOOL)isPlayingAudio
{
  return [(_SFWebView *)self->_webView _isPlayingAudio];
}

- (void)freezeForNavigationGesture
{
}

- (void)unfreezeAfterNavigationGesture:(BOOL)a3
{
  if (!a3) {
    [(TabDocument *)self setSuppressingProgressAnimationForNavigationGesture:0];
  }
}

- (void)setNeedsNewTabSnapshot
{
  if (!self->_closed && !self->_hibernated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v3 = [WeakRetained tabCollectionViewProvider];
    [v3 invalidateSnapshotForTab:self];
  }
}

- (void)_updateSnapshotIfNeeded
{
  if (a1 && !*(unsigned char *)(a1 + 922) && !*(unsigned char *)(a1 + 943) && !*(unsigned char *)(a1 + 957))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    uint64_t v1 = [WeakRetained tabCollectionViewProvider];
    [v1 updateSnapshotsForTabHoverPreviewIfNeeded];
  }
}

- (_SFWebView)frontWebView
{
  uint64_t v2 = 1392;
  if (!self->_showingReader) {
    uint64_t v2 = 1032;
  }
  return (_SFWebView *)*(id *)((char *)&self->super.isa + v2);
}

- (void)_loadDeferredURLIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned char *)(a1 + 816))
  {
    id v2 = *(id *)(a1 + 824);
    id v3 = *(void **)(a1 + 824);
    *(void *)(a1 + 824) = 0;

    id v4 = *(void **)(a1 + 832);
    *(void *)(a1 + 832) = 0;

    *(unsigned char *)(a1 + 816) = 0;
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134218499;
      uint64_t v8 = a1;
      __int16 v9 = 2160;
      uint64_t v10 = 1752392040;
      __int16 v11 = 2117;
      id v12 = v2;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Apply deferred navigation: (document: %p) %{sensitive, mask.hash}@", (uint8_t *)&v7, 0x20u);
    }
    id v6 = -[TabDocument loadURL:userDriven:skipSyncableTabUpdates:]((void *)a1, v2, 0, *(unsigned char *)(a1 + 701));
  }
}

- (void)_notifyImpressionAnalyticsRecorderIfNeededTabDocumentDidBecomeActive:(uint64_t)a1
{
  if (a1)
  {
    char v3 = *(unsigned char *)(a1 + 776);
    if (v3)
    {
      *(unsigned char *)(a1 + 776) = v3 & 0xFE;
LABEL_12:
      *(void *)(a1 + 768) = 0;
      return;
    }
    if ((*(unsigned char *)(a1 + 776) & 2) != 0 && (a2 & 1) == 0)
    {
      *(unsigned char *)(a1 + 776) = v3 & 0xFD;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
      uint64_t v5 = [WeakRetained tabController];
      id v6 = [v5 activeTabDocument];
      *(unsigned char *)(a1 + 776) = *(unsigned char *)(a1 + 776) & 0xFB | (4 * (v6 != (void *)a1));

      if ((*(unsigned char *)(a1 + 776) & 4) != 0) {
        return;
      }
      goto LABEL_11;
    }
    if ((*(unsigned char *)(a1 + 776) & 4) != 0 && (a2 & 1) == 0)
    {
      *(unsigned char *)(a1 + 776) = v3 & 0xFB;
LABEL_11:
      int v7 = [MEMORY[0x1E4F98E20] sharedRecorder];
      uint64_t v8 = [*(id *)(a1 + 1032) URL];
      [v7 didActualizeImpressionForURL:v8 provenance:*(void *)(a1 + 768)];

      goto LABEL_12;
    }
  }
}

- (NSUUID)webClipID
{
  return (NSUUID *)[(UIWebClip *)self->_webClip uuid];
}

- (void)stopAdvertisingProactiveActivityContent
{
  [(TabDocument *)self setSearchableItemAttributes:0];
  [(TabDocument *)self updateUserActivity];
}

- (void)_closeTabDocumentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained closeTabDocument:self animated:v3];

  id v6 = [MEMORY[0x1E4F98E50] sharedInstance];
  [v6 setTabNeedsSpotlightDeletion:self];
}

- (void)willClose
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v3 = [WeakRetained tabDocumentPlayingPIPVideo];

  if (v3 == self) {
    [WeakRetained setTabDocumentPlayingPIPVideo:0];
  }
  if (!self->_beingReleased && !self->_suppressWebExtensionEvents)
  {
    id v4 = [(TabDocument *)self webExtensionsController];
    [v4 didCloseTab:self windowIsClosing:0];
  }
  [(_SFCalendarEventDetector *)self->_calendarEventDetector cancelCheckForConfirmationPage];
  [(_SFWebView *)self->_webView setUIDelegate:0];
  [(SFDialogController *)self->_dialogController owningTabWillClose];
  [(WBSPermissionDialogThrottler *)self->_permissionDialogThrottler invalidate];
  -[TabDocument _removeParentChildTabDocumentRelations]((id *)&self->super.isa);
  [(_SFPageLoadErrorController *)self->_pageLoadErrorController clearCrashCountResetTimer];
  -[TabDocument _destroyDocumentView]((uint64_t)self);
  -[TabDocument _cancelFaviconUpdate]((uint64_t)self);
  if ([(TabDocument *)self isActive])
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 removeAppBannerFromTabDocument:self animated:0];
  }
  appBanner = self->_appBanner;
  self->_appBanner = 0;

  appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
  self->_appBannerPendingFirstPaint = 0;

  self->_appBannerRemovalWasDeferred = 0;
  contentBlockerStatisticsStore = self->_contentBlockerStatisticsStore;
  self->_contentBlockerStatisticsStore = 0;

  if (([WeakRetained isBackgrounded] & 1) == 0)
  {
    __int16 v9 = [(_SFReaderController *)self->_readerContext readerURL];
    uint64_t v10 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    __int16 v11 = [v10 activeSiriReaderSessionURL];
    int v12 = [v9 isEqual:v11];

    if (v12) {
      [(TabDocument *)self dismissSiriReaderMediaSessionImmediately:0];
    }
  }
}

- (void)didReplaceTabDocument:(id)a3
{
  uint64_t v13 = (id *)a3;
  id v4 = [v13 unifiedTabBarItem];
  -[TabDocument setUnifiedTabBarItem:]((uint64_t)self, v4);

  -[TabDocument setUnifiedTabBarItem:]((uint64_t)v13, 0);
  -[TabDocument _updateBarItemsWithCurrentMediaState]((id *)&self->super.isa);
  [(TabDocument *)self setPinned:*((unsigned __int8 *)v13 + 919)];
  objc_storeStrong((id *)&self->_pinnedTitle, v13[139]);
  objc_storeStrong((id *)&self->_pinnedURL, v13[140]);
  self->_suppressWebExtensionEvents = 0;
  [v13 idForWebExtensions];
  self->_idForWebExtensions = v5;
  id v6 = [v13 previousURLForWebExtensionOnUpdatedEvent];
  previousURLForWebExtensionOnUpdatedEvent = self->_previousURLForWebExtensionOnUpdatedEvent;
  self->_previousURLForWebExtensionOnUpdatedEvent = v6;

  uint64_t v8 = [v13 previousTitleForWebExtensionOnUpdatedEvent];
  __int16 v9 = (NSString *)[v8 copy];
  previousTitleForWebExtensionOnUpdatedEvent = self->_previousTitleForWebExtensionOnUpdatedEvent;
  self->_previousTitleForWebExtensionOnUpdatedEvent = v9;

  self->_previousLoadingCompleteStateForWebExtensionOnUpdatedEvent = [v13 previousLoadingCompleteStateForWebExtensionOnUpdatedEvent];
  -[TabDocument _loadingStateForWebExtensionsMayHaveChanged](self);
  speculativeLoadNavigationResponse = self->_speculativeLoadNavigationResponse;
  if (speculativeLoadNavigationResponse)
  {
    -[TabDocument _donateCurrentNavigationWithNavigationResponse:]((id *)&self->super.isa, speculativeLoadNavigationResponse);
    int v12 = self->_speculativeLoadNavigationResponse;
    self->_speculativeLoadNavigationResponse = 0;
  }
}

- (id)_updateBarItemsWithCurrentMediaState
{
  if (result)
  {
    uint64_t v1 = result;
    [result updateMenuButtonShowsBadge];
    [v1[133] setMediaStateIcon:v1[63]];
    [v1[135] setMediaStateIcon:v1[63]];
    [v1[134] setMediaStateIcon:v1[63]];
    id v2 = v1[63];
    id v3 = v1[136];
    return (id *)[v3 setMediaStateIcon:v2];
  }
  return result;
}

- (_BYTE)_loadingStateForWebExtensionsMayHaveChanged
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (unsigned char *)[result isLoadingComplete];
    if (v1[954] != result)
    {
      v1[954] = (_BYTE)result;
      uint64_t v2 = [v1 changedPropertiesForOnUpdatedWebExtensionEvent] | 8;
      return (unsigned char *)[v1 setChangedPropertiesForOnUpdatedWebExtensionEvent:v2];
    }
  }
  return result;
}

- (void)_donateCurrentNavigationWithNavigationResponse:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (([a1 isPrivateBrowsingEnabled] & 1) == 0)
    {
      id v4 = [v3 URL];
      double v5 = [a1 URL];
      char v6 = [v4 isEqual:v5];

      if (v6)
      {
        int v7 = [a1[11] loadedUsingDesktopUserAgent];
        char v8 = [a1[129] _wasPrivateRelayed];
        uint64_t v9 = [v3 statusCode];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __62__TabDocument__donateCurrentNavigationWithNavigationResponse___block_invoke;
        v10[3] = &unk_1E6D7DCC8;
        id v11 = v3;
        uint64_t v12 = v7 ^ 1u;
        char v14 = v8;
        uint64_t v13 = v9;
        dispatch_async(MEMORY[0x1E4F14428], v10);
      }
    }
  }
}

- (double)estimatedProgress
{
  [(LoadingController *)self->_loadingController estimatedProgress];
  return v2;
}

- (void)setShowingReader:(BOOL)a3
{
  if (self->_showingReader != a3)
  {
    BOOL v3 = a3;
    self->_showingReader = a3;
    -[SFNavigationBarItem setReaderButtonSelected:](self->_navigationBarItem, "setReaderButtonSelected:");
    [(SFDialogController *)self->_dialogController owningTabWillClose];
    [(_SFReaderController *)self->_readerContext setReaderIsActive:v3];
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      double v5 = [WeakRetained processPool];
      SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v5, v6);
    }
  }
}

- (void)addAppHighlightCreatingLink:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[Application sharedApplication];
  id v15 = [v5 systemNoteTakingController];

  char v6 = [(TabDocument *)self webView];
  char v7 = [v6 _selectionAttributes];

  if ((v7 & 2) != 0)
  {
    uint64_t v13 = [(TabDocument *)self webView];
    char v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v9 = [(TabDocument *)self webView];
    objc_msgSend(v9, "_addAppHighlightInNewGroup:originatedInApp:", objc_msgSend(v15, "isNotesPIPVisible") ^ 1, !v3);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F22488]);
    uint64_t v9 = (void *)[v8 initWithActivityType:*MEMORY[0x1E4F28AC0]];
    uint64_t v10 = [(TabDocument *)self urlForSharing];
    [v9 setWebpageURL:v10];

    id v11 = [(TabDocument *)self title];
    [v9 setTitle:v11];

    LODWORD(v11) = [v15 isNotesPIPVisible];
    uint64_t v12 = [(TabDocument *)self webView];
    [v15 saveHighlightsData:0 selectedText:0 selectedImage:0 newGroup:v11 ^ 1 originatedInApp:!v3 webView:v12 userActivity:v9];
  }
LABEL_6:
}

- (void)applyHighlightFromNotesIfNeeded
{
  if (self->_userActivityFromNotes)
  {
    BOOL v3 = +[Application sharedApplication];
    id v4 = [v3 systemNoteTakingController];

    if (objc_msgSend(v4, "isNoteTakingSupportedWithPrivateBrowsing:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled")))
    {
      userActivityFromNotes = self->_userActivityFromNotes;
      char v6 = [(TabDocument *)self webView];
      [v4 applyHighlightInUserActivity:userActivityFromNotes webView:v6];
    }
    else
    {
      char v7 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1E102C000, v7, OS_LOG_TYPE_INFO, "Not applying highlights from Notes because Quick Note is disabled in Private Browsing", v8, 2u);
      }
    }
  }
}

- (void)restoreAllHighlightsData
{
  BOOL v3 = +[Application sharedApplication];
  id v4 = [v3 systemNoteTakingController];

  if ([v4 isNotesPIPVisible])
  {
    double v5 = self->_userActivityFromNotes;
    if (!v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F22488]);
      char v7 = (NSUserActivity *)[v6 initWithActivityType:*MEMORY[0x1E4F28AC0]];
      id v8 = [(TabDocument *)self urlForSharing];
      if (objc_msgSend(v8, "safari_isHTTPFamilyURL")) {
        [(NSUserActivity *)v7 setWebpageURL:v8];
      }
      uint64_t v9 = [(TabDocument *)self title];
      [(NSUserActivity *)v7 setTitle:v9];

      double v5 = v7;
    }
    uint64_t v10 = [(_SFWebView *)self->_webView backForwardList];
    id v11 = [v10 currentItem];
    backForwardListItemForCurrentNoteTakingCheck = self->_backForwardListItemForCurrentNoteTakingCheck;
    self->_backForwardListItemForCurrentNoteTakingCheck = v11;

    objc_initWeak(&location, self);
    BOOL v13 = [(TabDocument *)self isPrivateBrowsingEnabled];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __39__TabDocument_restoreAllHighlightsData__block_invoke;
    v14[3] = &unk_1E6D7D210;
    objc_copyWeak(&v15, &location);
    [v4 fetchHighlightsForUserActivity:v5 privateBrowsing:v13 completion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __39__TabDocument_restoreAllHighlightsData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (!WeakRetained) {
      goto LABEL_10;
    }
    id v8 = WeakRetained;
    id v9 = WeakRetained[43];
    uint64_t v10 = [WeakRetained[129] backForwardList];
    id v11 = [v10 currentItem];

    if (v9 == v11) {
      [v8[129] _restoreAppHighlights:v5];
    }
    id v12 = v8[43];
    v8[43] = 0;
  }
  if (v6)
  {
    BOOL v13 = (id)WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __39__TabDocument_restoreAllHighlightsData__block_invoke_cold_1();
    }
  }
LABEL_10:
}

- (void)_loadingControllerWillLoadRequest:(uint64_t)a3 webView:(int)a4 userDriven:
{
  id v12 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 704) = 0;
    *(void *)(a1 + 1208) = 0;
    [*(id *)(a1 + 288) owningWebViewWillNavigate];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    char v7 = [WeakRetained userActivityController];
    id v8 = [v7 tabDocumentPendingUserActivityPayload];

    if (v8 == (void *)a1) {
      [v7 setTabDocumentPendingUserActivityPayload:0];
    }
    id v9 = *(void **)(a1 + 1256);
    if (v9) {
      [v9 startedPageLoad];
    }
    uint64_t v10 = [v12 URL];
    id v11 = objc_msgSend(v10, "_webkit_scriptIfJavaScriptURL");

    if (!v11)
    {
      *(unsigned char *)(a1 + 703) = 0;
      *(unsigned char *)(a1 + 699) = a4;
      *(unsigned char *)(a1 + 700) = 0;
      *(unsigned char *)(a1 + 710) = a4;
      -[TabDocument _clearLibraryType](a1);
    }
    if (*(void *)(a1 + 1328) && a4) {
      [(id)a1 clearTabReuseURL];
    }
    if (*(unsigned char *)(a1 + 957) && a4) {
      [WeakRetained setWantsUnifiedFieldFocused:0];
    }
  }
}

- (void)_loadingControllerDidStartLoading
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(unsigned char *)(a1 + 703) = 0;
    [*(id *)(a1 + 1272) clearFailedRequest];
    [(id)a1 updateTabTitle];
    -[TabDocument _updateNavigationBarItem](a1);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = *(id *)(a1 + 264);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v8;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v8 != v4) {
            objc_enumerationMutation(v2);
          }
          id v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v6, "tabDocumentDidStartLoading:", a1, (void)v7);
          }
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v3);
    }
  }
}

- (void)_loadingControllerEstimatedProgressChangedTo:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1224));
    [WeakRetained updateProgressWithResource:a1];

    [*(id *)(a1 + 176) updateFluidProgressWithProgressStateSource:a1];
    BOOL v4 = 0;
    int v5 = *(unsigned __int8 *)(a1 + 944);
    if (a2 > 0.0 && a2 < 1.0) {
      BOOL v4 = *(void *)(a1 + 968) != 0;
    }
    *(unsigned char *)(a1 + 944) = v4;
    objc_msgSend(*(id *)(a1 + 280), "setStopReloadButtonShowsStop:");
    if (v5 != *(unsigned __int8 *)(a1 + 944))
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 1216));
      [v7 tabDocumentDidChangeCanStopLoadingState:a1];
    }
  }
}

- (void)_didDecideNavigationPolicy:(void *)a3 forNavigationAction:
{
  id v5 = a3;
  if (a1)
  {
    id v21 = v5;
    id v6 = [v5 targetFrame];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v21 sourceFrame];
    }
    long long v9 = v8;

    if ([v9 isMainFrame])
    {
      long long v10 = *(void **)(a1 + 1024);
      id v11 = [*(id *)(a1 + 1032) backForwardList];
      uint64_t v12 = [v11 currentItem];
      [v10 owningWebViewDidDecidePolicy:a2 forNavigationAction:v21 currentBackForwardListItem:v12];

      if (![v21 navigationType]) {
        objc_msgSend((id)a1, "setNextLoadComesFromSearchPage:", objc_msgSend((id)a1, "isSearchPage"));
      }
      -[TabDocument _updatePageLoadDonorWithNavigationPolicy:inMainFrameForNavigationAction:](a1, a2, v21);
      *(unsigned char *)(a1 + 776) &= ~4u;
      int v13 = -[TabDocument _analyticsRecorderShouldIgnoreURLWithNavigationPolicy:forNavigationAction:]((void *)a1, a2, v21);
      char v14 = *(unsigned char *)(a1 + 776) & 0xFC;
      if (v13)
      {
        *(unsigned char *)(a1 + 776) = v14 | 1;
        *(void *)(a1 + 768) = 0;
      }
      else
      {
        *(unsigned char *)(a1 + 776) = v14 | 2;
        *(unsigned char *)(a1 + 778) = 0;
        if (![v21 navigationType])
        {
          if (*(void *)(a1 + 864))
          {
            id v15 = [MEMORY[0x1E4F1C9C8] date];
            [v15 timeIntervalSinceDate:*(void *)(a1 + 864)];
            double v17 = v16;

            BOOL v18 = v17 < 10.0;
          }
          else
          {
            BOOL v18 = 0;
          }
          uint64_t v19 = [MEMORY[0x1E4F97E48] sharedLogger];
          [(id)a1 pageZoomFactor];
          *(float *)&double v20 = v20;
          [v19 didActivateLinkWithZoomScale:v18 recentlyZoomedIn:v20];
        }
      }
    }

    id v5 = v21;
  }
}

- (void)_updatePageLoadDonorWithNavigationPolicy:(void *)a3 inMainFrameForNavigationAction:
{
  id v11 = a3;
  if (a1)
  {
    if (!a2) {
      goto LABEL_7;
    }
    id v5 = [(id)a1 committedURL];
    id v6 = [v11 request];
    id v7 = [v6 URL];
    char v8 = [v5 isEqual:v7];

    if ((v8 & 1) != 0 || (unint64_t v9 = [v11 navigationType], v9 - 2 < 3))
    {
LABEL_7:
      BOOL v10 = 0;
      goto LABEL_8;
    }
    if (v9 < 2)
    {
LABEL_6:
      BOOL v10 = 1;
LABEL_8:
      *(unsigned char *)(a1 + 896) = v10;
      goto LABEL_9;
    }
    if (v9 == -1)
    {
      if (([v11 _isUserInitiated] & 1) == 0 && !*(unsigned char *)(a1 + 897))
      {
        BOOL v10 = [*(id *)(a1 + 48) navigationSource] == 0;
        goto LABEL_8;
      }
      goto LABEL_6;
    }
  }
LABEL_9:
}

- (uint64_t)_analyticsRecorderShouldIgnoreURLWithNavigationPolicy:(void *)a3 forNavigationAction:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    if (a2 && ([v5 navigationType] & 0xFFFFFFFFFFFFFFFELL) != 2)
    {
      char v8 = [a1 committedURL];
      unint64_t v9 = [v6 request];
      BOOL v10 = [v9 URL];
      uint64_t v7 = [v8 isEqual:v10];
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)webPageID
{
  id v2 = [(TabDocument *)self webView];
  uint64_t v3 = [v2 _handle];
  unint64_t v4 = [v3 _webPageID];

  return v4;
}

- (BOOL)isContentReady
{
  return 1;
}

- (void)animateProgressForCompletedDocument
{
  if (!self->_fluidProgressState)
  {
    [(WBSFluidProgressController *)self->_fluidProgressController startFluidProgressWithProgressStateSource:self];
    fluidProgressState = self->_fluidProgressState;
    [(WBSFluidProgressState *)fluidProgressState setHasCompletedLoad:1];
  }
}

- (BOOL)createFluidProgressState
{
  if (!self->_fluidProgressState)
  {
    uint64_t v3 = (WBSFluidProgressState *)[objc_alloc(MEMORY[0x1E4F98B10]) initWithType:0];
    fluidProgressState = self->_fluidProgressState;
    self->_fluidProgressState = v3;

    id v5 = self->_fluidProgressState;
    id v6 = [(TabDocument *)self expectedOrCurrentURL];
    uint64_t v7 = objc_msgSend(v6, "safari_originalDataAsString");
    [(WBSFluidProgressState *)v5 setLoadURL:v7];
  }
  return 1;
}

- (void)clearFluidProgressState
{
  fluidProgressState = self->_fluidProgressState;
  self->_fluidProgressState = 0;
}

- (void)setSuppressingProgressAnimationForNavigationGesture:(BOOL)a3
{
  if (self->_suppressingProgressAnimationForNavigationGesture != a3)
  {
    self->_suppressingProgressAnimationForNavigationGesture = a3;
    if (a3) {
      [(TabDocument *)self beginSuppressingProgressAnimation];
    }
    else {
      [(TabDocument *)self endSuppressingProgressAnimation];
    }
  }
}

- (void)beginSuppressingProgressAnimation
{
  unint64_t progressAnimationSuppressedCount = self->_progressAnimationSuppressedCount;
  if (!progressAnimationSuppressedCount)
  {
    [(WBSFluidProgressController *)self->_fluidProgressController setProgressAnimationSuppressed:1 forProgressStateSource:self animated:1];
    unint64_t progressAnimationSuppressedCount = self->_progressAnimationSuppressedCount;
  }
  self->_unint64_t progressAnimationSuppressedCount = progressAnimationSuppressedCount + 1;
}

- (void)endSuppressingProgressAnimation
{
}

- (void)endSuppressingProgressAnimationAnimated:(BOOL)a3
{
  unint64_t progressAnimationSuppressedCount = self->_progressAnimationSuppressedCount;
  if (progressAnimationSuppressedCount)
  {
    unint64_t v4 = progressAnimationSuppressedCount - 1;
    self->_unint64_t progressAnimationSuppressedCount = v4;
    if (!v4) {
      [(WBSFluidProgressController *)self->_fluidProgressController setProgressAnimationSuppressed:0 forProgressStateSource:self animated:a3];
    }
  }
}

- (void)fluidProgressRocketAnimationDidComplete
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentFluidProgressRocketAnimationDidComplete:self];

  if (self->_shouldReflectTranslationAsFluidProgress)
  {
    translationContext = self->_translationContext;
    [(WBSTranslationContext *)translationContext clearFluidProgressState];
  }
}

- (id)currentFluidProgressStateSource
{
  downloadReflectedInFluidProgress = self->_downloadReflectedInFluidProgress;
  if (!downloadReflectedInFluidProgress)
  {
    if (self->_shouldReflectTranslationAsFluidProgress) {
      downloadReflectedInFluidProgress = self->_translationContext;
    }
    else {
      downloadReflectedInFluidProgress = self;
    }
  }
  id v3 = downloadReflectedInFluidProgress;
  return v3;
}

- (void)fetchCanonicalURLWithCompletionHandler:(id)a3
{
  unint64_t v4 = (void (**)(id, void *))a3;
  BOOL v5 = [(TabDocument *)self isShowingStartPageOverriddenByExtension];
  if ([(TabDocument *)self isBlank] || v5)
  {
    cachedCanonicalURL = self->_cachedCanonicalURL;
    self->_cachedCanonicalURL = 0;

    uint64_t v7 = [(TabDocument *)self cachedCanonicalURLOrURLForSharing];
    v4[2](v4, v7);
  }
  else
  {
    objc_initWeak(&location, self);
    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F3B078]) initWithWebView:self->_webView];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__TabDocument_fetchCanonicalURLWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E6D7D238;
    objc_copyWeak(&v11, &location);
    void v9[4] = self;
    BOOL v10 = v4;
    [v8 fetchSharingLinkWithCompletionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __54__TabDocument_fetchCanonicalURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_storeStrong(WeakRetained + 65, a2);
  -[TabDocument _loadActivityItemProviderIfNeeded]((uint64_t)WeakRetained);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) cachedCanonicalURLOrURLForSharing];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)_loadActivityItemProviderIfNeeded
{
  if (a1 && !*(void *)(a1 + 528))
  {
    id v2 = [[ActionPanelActivityItemProvider alloc] initWithTabDocument:a1];
    id v3 = *(void **)(a1 + 528);
    *(void *)(a1 + 528) = v2;
  }
}

- (void)_clearCachedCanonicalURL
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 520);
    *(void *)(a1 + 520) = 0;

    id v3 = *(void **)(a1 + 528);
    *(void *)(a1 + 528) = 0;
  }
}

- (NSURL)cachedCanonicalURLOrURLForSharing
{
  cachedCanonicalURL = self->_cachedCanonicalURL;
  if (cachedCanonicalURL)
  {
    id v3 = cachedCanonicalURL;
  }
  else
  {
    id v3 = [(TabDocument *)self urlForSharing];
  }
  return v3;
}

- (ActionPanelActivityItemProvider)activityItemProvider
{
  -[TabDocument _loadActivityItemProviderIfNeeded]((uint64_t)self);
  cachedActivityItemProvider = self->_cachedActivityItemProvider;
  return cachedActivityItemProvider;
}

- (id)URLForStatePersisting
{
  deferredNavigationURL = self->_deferredNavigationURL;
  if (deferredNavigationURL)
  {
    id v3 = deferredNavigationURL;
  }
  else
  {
    id v3 = [(LoadingController *)self->_loadingController URLForStatePersisting];
  }
  return v3;
}

- (void)clearTabReuseURL
{
  tabReuseURL = self->_tabReuseURL;
  self->_tabReuseURL = 0;
}

- (void)clearBrowserController
{
  p_browserController = &self->_browserController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v5 = [WeakRetained tabController];
  [v5 willLoseOwnershipOfTab:self];

  objc_storeWeak((id *)p_browserController, 0);
}

- (void)setUuid:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [MEMORY[0x1E4F98E50] sharedInstance];
  [v4 setTabNeedsSpotlightDeletion:self];

  uint64_t v5 = self->_uuid;
  id v6 = (NSUUID *)[v11 copy];
  uuid = self->_uuid;
  self->_uuid = v6;

  [(TabOverviewItem *)self->_tabOverviewItem setUUID:self->_uuid];
  [(TabBarItem *)self->_tabBarItem setUUID:self->_uuid];
  [(UnifiedTabBarItem *)self->_unifiedTabBarItem setUUID:self->_uuid];
  [(TabDocumentCollectionItem *)self->_tabCollectionItem setUUID:self->_uuid];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  unint64_t v9 = [WeakRetained tabController];
  [v9 tabDocumentDidUpdateUUID:self previousUUID:v5];

  BOOL v10 = [(WBTab *)self->_tabGroupTab uuid];
  -[TabDocument _activeParticipantsDidUpdateInTabWithUUID:]((id *)&self->super.isa, v10);

  [(TabDocument *)self indexTabToCoreSpotlight];
  if ((WBSIsEqual() & 1) == 0) {
    -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)&self->super.isa);
  }
}

- (void)setQuickLookDocumentForCurrentBackForwardListItem:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    id v3 = [*(id *)(a1 + 1032) backForwardList];
    unint64_t v4 = [v3 currentItem];
    objc_msgSend(v4, "_sf_setQuickLookDocument:", v5);
  }
}

- (NSString)titleForNewBookmark
{
  return (NSString *)-[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)self, 0, 0, 0);
}

- (NSString)titleForCloudTab
{
  return (NSString *)-[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)self, 1, 1, 1);
}

- (id)_titleForStatePersistingForTabStateData
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = a1[104];
    if (v2)
    {
      uint64_t v1 = (id *)v2;
    }
    else
    {
      id v3 = [a1[21] titleForStatePersisting];
      unint64_t v4 = v3;
      if (v3)
      {
        id v5 = v3;
      }
      else
      {
        -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)v1, 0, 1, 0);
        id v5 = (id *)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v1 = v5;
    }
  }
  return v1;
}

- (NSString)suggestedTitleForCurrentURL
{
  if ([(TabDocument *)self isShowingErrorPage])
  {
    id v3 = 0;
  }
  else
  {
    unint64_t v4 = -[TabDocument _titleIncludeLoading:allowURLStringFallback:allowUntitled:]((uint64_t)self, 0, 0, 1);
    if ([v4 length]) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v3 = v5;
  }
  return (NSString *)v3;
}

- (id)loadRequest:(id)a3 userDriven:(BOOL)a4
{
  unint64_t v4 = -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:]((uint64_t)self, a3, a4);
  return v4;
}

- (id)_loadRequest:(uint64_t)a1 userDriven:(void *)a2 shouldOpenExternalURLs:(uint64_t)a3
{
  id v5 = a2;
  if (a1)
  {
    id v6 = -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:skipSyncableTabUpdates:](a1, v5, a3, 0, 0, 0);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_loadRequest:(uint64_t)a3 userDriven:(uint64_t)a4 shouldOpenExternalURLs:(void *)a5 eventAttribution:(char)a6 skipSyncableTabUpdates:
{
  id v11 = a2;
  id v12 = a5;
  if (a1)
  {
    *(unsigned char *)(a1 + 701) = a6;
    int v13 = objc_msgSend(v11, "safari_requestBySettingIsUserInitiated:", 1);

    char v14 = -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:]((void *)a1, v13);

    id v15 = [(id)a1 webExtensionsController];
    double v16 = [v14 URL];
    double v17 = [v15 canonicalURLForWebExtensionURL:v16];

    if (v17)
    {
      BOOL v18 = (void *)[v14 mutableCopy];
      [v18 setURL:v17];
      id v11 = (id)[v18 copy];
    }
    else
    {
      id v11 = v14;
    }

    uint64_t v19 = [v11 URL];
    -[TabDocument _createNewDocumentViewIfNecessaryForURL:]((void *)a1, v19);

    double v20 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;

    *(unsigned char *)(a1 + 136) = 1;
    if (a3)
    {
      id v21 = [*(id *)(a1 + 288) presentedDialog];
      int v22 = [v21 completionHandlerBlocksWebProcess];
    }
    else
    {
      int v22 = 0;
    }
    id v23 = [(id)a1 webExtensionsController];
    uint64_t v24 = [v11 URL];
    id v25 = [v23 webExtensionForURL:v24];

    if (!v25
      || ([v25 extensionsController],
          uint64_t v26 = objc_claimAutoreleasedReturnValue(),
          [v25 extension],
          id v27 = objc_claimAutoreleasedReturnValue(),
          char v28 = [v26 extensionIsEnabled:v27],
          v27,
          v26,
          (v28 & 1) != 0))
    {
      uint64_t v29 = *(void **)(a1 + 1032);
      if (!v29 || (([v29 _webProcessIsResponsive] ^ 1 | v22) & 1) == 0)
      {
        a1 = [*(id *)(a1 + 168) loadRequest:v11 userDriven:a3 shouldOpenExternalURLs:a4 eventAttribution:v12];
        goto LABEL_15;
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __102__TabDocument__loadRequest_userDriven_shouldOpenExternalURLs_eventAttribution_skipSyncableTabUpdates___block_invoke;
      v31[3] = &unk_1E6D7D260;
      v31[4] = a1;
      id v32 = v11;
      char v34 = a3;
      char v35 = a4;
      id v33 = v12;
      -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:](a1, 0, v31);
    }
    a1 = 0;
LABEL_15:
  }
  return (id)a1;
}

- (id)_requestBySettingAdvancedPrivacyProtectionsFlag:(void *)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 URL];
    uint64_t v6 = [a1 supportsAdvancedPrivacyProtectionsForURL:v5];

    id v7 = objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", v6);

    unint64_t v4 = 0;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (uint64_t)_createNewDocumentViewIfNecessaryForURL:(void *)a1
{
  id v3 = a2;
  if (a1 && (-[TabDocument _isNewDocumentViewNecessaryForURL:](a1, v3) & 1) != 0)
  {
    unint64_t v4 = [a1 webExtensionsController];
    id v5 = [v4 webExtensionForURL:v3];

    if (v5) {
      [v5 extensionWebViewConfiguration];
    }
    else {
    id v7 = [a1 createWebViewConfiguration];
    }

    char v8 = [a1 webView];
    unint64_t v9 = [v8 _sessionState];

    -[TabDocument _destroyDocumentView]((uint64_t)a1);
    -[TabDocument _createDocumentViewWithConfiguration:]((uint64_t)a1, v7);
    BOOL v10 = [a1 webView];
    id v11 = (id)[v10 _restoreSessionState:v9 andNavigate:0];

    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __102__TabDocument__loadRequest_userDriven_shouldOpenExternalURLs_eventAttribution_skipSyncableTabUpdates___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 168) loadRequest:*(void *)(a1 + 40) userDriven:*(unsigned __int8 *)(a1 + 56) shouldOpenExternalURLs:*(unsigned __int8 *)(a1 + 57) eventAttribution:*(void *)(a1 + 48)];
}

- (void)_terminateWebProcessIfNeededAndShowCrashBanner:(void *)a3 thenDo:
{
  id v5 = a3;
  if (a1)
  {
    if (*(void *)(a1 + 440))
    {
      uint64_t v6 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]();
      }
    }
    id v7 = [*(id *)(a1 + 288) presentedDialog];
    int v8 = [v7 completionHandlerBlocksWebProcess];

    if (v8)
    {
      unint64_t v9 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]();
      }
      uint64_t v10 = MEMORY[0x1E4E42950](v5);
      id v11 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = v10;

      *(unsigned char *)(a1 + 729) = a2 ^ 1;
      -[TabDocument _terminateWebProcessThenDoUnresponsiveWebProcessBlock](a1);
    }
    else
    {
      id v12 = *(void **)(a1 + 1032);
      if (v12 && ![v12 _webProcessIsResponsive])
      {
        uint64_t v13 = MEMORY[0x1E4E42950](v5);
        char v14 = *(void **)(a1 + 440);
        *(void *)(a1 + 440) = v13;

        *(unsigned char *)(a1 + 729) = a2 ^ 1;
        [*(id *)(a1 + 432) invalidate];
        uint64_t v15 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:a1 target:sel__unresponsiveWebProcessTimerFired_ selector:0 userInfo:0 repeats:0.3];
        double v16 = *(void **)(a1 + 432);
        *(void *)(a1 + 432) = v15;
      }
      else
      {
        v5[2](v5);
      }
    }
  }
}

- (void)_updateSnapshotForWebClip:(void *)a1
{
  id v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    if ([v3 iconIsScreenShotBased])
    {
      id v5 = [v4 iconImage];
      [v5 scale];
      double v7 = v6;

      int v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v8 scale];
      double v10 = v9;

      if (v7 != v10 || ([v4 iconIsPrerendered] & 1) == 0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __41__TabDocument__updateSnapshotForWebClip___block_invoke;
        v11[3] = &unk_1E6D7D288;
        id v12 = v4;
        [a1 snapshotForWebClipIcon:v11];
      }
    }
  }
}

void __41__TabDocument__updateSnapshotForWebClip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) setIconImageFromScreenshot:v3];
    [*(id *)(a1 + 32) updateOnDisk];
    [*(id *)(a1 + 32) requestIconUpdateInSpringBoard];
  }
}

- (void)snapshotForWebClipIcon:(id)a3
{
  id v11 = a3;
  [MEMORY[0x1E4F223B8] _applicationIconCanvasSize];
  double v5 = v4;
  double v7 = v6;
  int v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v8 scale];
  double v10 = v9;

  -[TabDocument snapshotWithSize:options:completion:](self, "snapshotWithSize:options:completion:", 0, v11, v5 / v10, v7 / v10);
}

- (void)snapshotWithSize:(CGSize)a3 options:(unint64_t)a4 completion:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  p_browserController = &self->_browserController;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "snapshotTabDocument:size:topBackdropHeight:options:completion:", self, a4, v10, width, height, 0.0);
}

- (void)snapshotWithSize:(CGSize)a3 topBackdropHeight:(double)a4 options:(unint64_t)a5 completion:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  p_browserController = &self->_browserController;
  id v12 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "snapshotTabDocument:size:topBackdropHeight:options:completion:", self, a5, v12, width, height, a4);
}

- (void)dispatchNavigationIntent:(id)a3
{
  id v8 = a3;
  double v4 = [(TabDocument *)self uuid];
  [v8 setSourceTabUUID:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v6 = [WeakRetained UUID];
  [v8 setSourceWindowUUID:v6];

  double v7 = +[Application sharedApplication];
  [v7 handleNavigationIntent:v8 completion:0];
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v9 = [WeakRetained tabController];
  id v10 = [v9 activeTabDocument];

  if (v10 == self) {
    [(TabDocument *)self setActive:1];
  }
  else {
    [(TabDocument *)self unhibernate];
  }
  id v11 = (id)WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v6 privacyPreservingDescription];
    webView = self->_webView;
    int v27 = 134218498;
    char v28 = self;
    __int16 v29 = 2114;
    long long v30 = v12;
    __int16 v31 = 2048;
    id v32 = webView;
    _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "TabDocument %p: loading intent %{public}@, web view: %p", (uint8_t *)&v27, 0x20u);
  }
  if (![v6 policy] && -[TabDocument isActive](self, "isActive")) {
    [WeakRetained setFavoritesState:0 animated:1];
  }
  self->_flags.impressionProvenance = [v6 provenance];
  self->_flags.shouldDisallowRedirectToExternalAppsForCurrentLoad = [v6 type] == 10;
  BOOL supportsReuseForSpotlightSearch = self->_supportsReuseForSpotlightSearch;
  self->_BOOL supportsReuseForSpotlightSearch = 0;
  uint64_t v15 = [v6 highlight];
  highlightFromNavigation = self->_highlightFromNavigation;
  self->_highlightFromNavigation = v15;

  if ([v6 policy]) {
    LOBYTE(v17) = 0;
  }
  else {
    int v17 = [v6 isChildIntent] ^ 1;
  }
  self->_allowsSwitchingToPinnedTabOnNavigation = v17;
  self->_didSpawnNewTabOnNavigationFromPinnedTab = 0;
  BOOL v18 = 0;
  switch([v6 type])
  {
    case 0:
      uint64_t v19 = [v6 bookmark];
      int v21 = -[TabDocument _loadBookmark:]((uint64_t)self, v19);
      goto LABEL_20;
    case 1:
      uint64_t v19 = [v6 cloudTab];
      [(TabDocument *)self loadCloudTab:v19];
      goto LABEL_25;
    case 2:
      uint64_t v19 = [v6 URL];
      BOOL v18 = 1;
      id v22 = [(TabDocument *)self loadURL:v19 userDriven:1];
      goto LABEL_26;
    case 4:
      uint64_t v19 = [v6 text];
      int v21 = -[TabDocument _loadUserTypedAddress:]((uint64_t)self, v19);
      goto LABEL_20;
    case 5:
      uint64_t v19 = [v6 text];
      int v21 = -[TabDocument _loadSearchResultForQuery:]((id *)&self->super.isa, v19);
      goto LABEL_20;
    case 6:
    case 10:
      uint64_t v19 = [v6 URL];
      double v20 = [(TabDocument *)self loadURL:v19 userDriven:1];
      BOOL v18 = v20 != 0;

      goto LABEL_26;
    case 7:
      uint64_t v19 = [v6 webClip];
      int v21 = -[TabDocument _loadWebClip:]((id *)&self->super.isa, v19);
LABEL_20:
      BOOL v18 = v21;
      goto LABEL_26;
    case 8:
      BOOL v18 = -[TabDocument _loadServiceWorkerOpenedURLIntent:]((BOOL)self, v6);
      if (!v7) {
        goto LABEL_32;
      }
      goto LABEL_28;
    case 9:
      unsigned int v23 = [v6 externalURLSourceApplicationIsSpotlight];
      BOOL v24 = v23;
      if (supportsReuseForSpotlightSearch) {
        uint64_t v25 = v23;
      }
      else {
        uint64_t v25 = 0;
      }
      [(_SFWebView *)self->_webView setObscuringContents:v25];
      self->_BOOL supportsReuseForSpotlightSearch = v24;
      uint64_t v19 = [v6 URL];
      -[TabDocument _loadExternalURL:withIntent:]((uint64_t)self, v19, v6);
LABEL_25:
      BOOL v18 = 1;
LABEL_26:

      break;
    default:
      break;
  }
  if (v7)
  {
LABEL_28:
    BOOL v26 = !self->_didSpawnNewTabOnNavigationFromPinnedTab && v18;
    v7[2](v7, v26);
  }
LABEL_32:
}

- (uint64_t)_loadBookmark:(uint64_t)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    double v5 = -[WebBookmark safari_bestCurrentURL](v3);
    if ([v4 isReadingListItem])
    {
      id v6 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
      uint64_t v7 = [v6 isNetworkReachable];

      if (v5) {
        char v8 = 1;
      }
      else {
        char v8 = v7;
      }
      if ((v8 & 1) == 0)
      {
        id v10 = *(void **)(a1 + 1272);
        id v11 = _WBSLocalizedString();
        id v12 = _WBSLocalizedString();
        [v10 addAlertWithTitle:v11 bodyText:v12];

        goto LABEL_12;
      }
      if (v5)
      {
        double v9 = [MEMORY[0x1E4F97E48] sharedLogger];
        [v9 didOpenReadingListItemWithReachableNetwork:v7 isContinuousTransition:0];
      }
    }
    if ((-[TabDocument _trySwitchingToPinnedTabOnNavigationToURL:](a1, v5) & 1) == 0)
    {
      -[TabDocument _loadURL:fromBookmark:]((id *)a1, v5, v4);
      a1 = 1;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    a1 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return a1;
}

- (uint64_t)_loadUserTypedAddress:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!gTestFileURLs)
    {
      double v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
      int v5 = [v4 isFileURL];

      if (v5)
      {
        [*(id *)(a1 + 1272) addDisallowedFileURLAlert];
LABEL_7:
        a1 = 0;
        goto LABEL_8;
      }
    }
    if (objc_msgSend(v3, "safari_isJavaScriptURLString"))
    {
      [*(id *)(a1 + 1272) addDisallowedUseOfJavaScriptAlert];
      goto LABEL_7;
    }
    [(id)a1 setReadingListBookmark:0];
    *(unsigned char *)(a1 + 923) = 0;
    *(unsigned char *)(a1 + 701) = 0;
    uint64_t v7 = WBSUnifiedFieldInputTypeForString();
    if ((unint64_t)(v7 - 1) >= 2)
    {
      if (!v7 || v7 == 3)
      {
        a1 = -[TabDocument _loadSearchResultForQuery:]((id *)a1, v3);
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    char v8 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    int v9 = objc_msgSend(v8, "safari_isSafariWebExtensionURL");
    id v10 = [(id)a1 webView];
    id v11 = [v10 _committedURL];
    int v12 = objc_msgSend(v11, "safari_isSafariWebExtensionURL");

    if (((v12 ^ 1 | v9) & 1) == 0)
    {
      -[TabDocument _destroyDocumentView](a1);
      uint64_t v13 = [(id)a1 createWebViewConfiguration];
      -[TabDocument _createDocumentViewWithConfiguration:](a1, v13);
    }
    -[TabDocument _updateFallbackURLsForUserTypedAddress:userExplicitlyRequestedAsHTTP:](a1, v3, objc_msgSend(v8, "safari_hasScheme:", @"http"));
    a1 = -[TabDocument _loadNextFallbackURLWithWebClip:navigation:](a1, 0, 0);
  }
LABEL_8:

  return a1;
}

- (uint64_t)_loadSearchResultForQuery:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 120);
    [WeakRetained updateSearchEngineIfNeeded];
    uint64_t v5 = objc_msgSend(v3, "_web_stringByTrimmingWhitespace");

    id v6 = +[SearchQueryBuilder searchQueryBuilderWithQuery:forPrivateBrowsing:](SearchQueryBuilder, "searchQueryBuilderWithQuery:forPrivateBrowsing:", v5, [a1 isPrivateBrowsingEnabled]);
    uint64_t v7 = [v6 searchURL];
    if (v7
      && (+[RecentWebSearchesController sharedController],
          char v8 = objc_claimAutoreleasedReturnValue(),
          [v8 addRecentSearch:v5],
          v8,
          (-[TabDocument _trySwitchingToPinnedTabOnNavigationToURL:]((uint64_t)a1, v7) & 1) == 0))
    {
      uint64_t v9 = 1;
      id v10 = (id)[a1 loadURL:v7 userDriven:1];
    }
    else
    {
      uint64_t v9 = 0;
    }

    id v11 = [WeakRetained rootViewController];
    int v12 = [v11 tipsCoordinator];
    [v12 invalidateWebSearchTip];

    id v3 = (id)v5;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_loadWebClip:(id *)a1
{
  id v3 = a2;
  double v4 = v3;
  BOOL v5 = 0;
  if (a1 && v3)
  {
    id v6 = [v3 pageURL];
    if ([v4 fullScreen])
    {
      uint64_t v7 = [a1[165] uuid];
      char v8 = [v4 uuid];
      int v9 = WBSIsEqual();

      if (v9)
      {
        if ([a1 inWebClipScope])
        {
          BOOL v5 = 1;
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {
        -[TabDocument setWebClip:]((uint64_t)a1, v4);
      }
    }
    id v10 = [a1 loadURL:v6 userDriven:1];
    BOOL v5 = v10 != 0;

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (BOOL)_loadServiceWorkerOpenedURLIntent:(BOOL)a1
{
  id v3 = a2;
  double v4 = v3;
  if (a1)
  {
    [v3 setUsedTabDocument:a1];
    BOOL v5 = [v4 URL];
    id v6 = [(id)a1 loadURL:v5 userDriven:1];
    a1 = v6 != 0;
  }
  return a1;
}

- (void)_loadExternalURL:(void *)a3 withIntent:
{
  id v17 = a2;
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    uint64_t v7 = [v5 externalOptions];
    char v8 = +[TabDocument urlForExternalURL:forPrivateBrowsing:](TabDocument, "urlForExternalURL:forPrivateBrowsing:", v17, [(id)a1 isPrivateBrowsingEnabled]);
    objc_storeStrong((id *)(a1 + 1264), v8);
    int v9 = [v6 eventAttribution];
    id v10 = -[TabDocument _loadURL:userDriven:eventAttribution:skipSyncableTabUpdates:]((void *)a1, v8, 1, v9, 0);

    objc_storeStrong((id *)(a1 + 1328), v8);
    id v11 = objc_msgSend(v7, "safari_stringForKey:", *MEMORY[0x1E4FB26A0]);
    if ([v11 isEqualToString:@"com.apple.SafariViewService"])
    {
      *(unsigned char *)(a1 + 925) = objc_msgSend(v7, "safari_BOOLForKey:", *MEMORY[0x1E4F78780]);
      uint64_t v12 = objc_msgSend(v7, "safari_stringForKey:", *MEMORY[0x1E4F78790]);
      uint64_t v13 = *(void **)(a1 + 1384);
      *(void *)(a1 + 1384) = v12;

      char v14 = objc_msgSend(v7, "safari_dataForKey:", *MEMORY[0x1E4F78788]);
      if (v14)
      {
        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F46790]) initWithData:v14];
        if (v15) {
          [(id)a1 restoreSessionState:v15 andNavigate:1 fromSafariViewService:1];
        }
      }
    }
    else
    {
      if (objc_msgSend(v7, "safari_BOOLForKey:", *MEMORY[0x1E4FB2660])) {
        *(unsigned char *)(a1 + 926) = 1;
      }
      objc_storeStrong((id *)(a1 + 1384), v11);
      id v16 = v11;
      char v14 = *(void **)(a1 + 1184);
      *(void *)(a1 + 1184) = v16;
    }
  }
}

- (void)validateWebClip
{
  if (self->_webClip)
  {
    if (objc_opt_respondsToSelector())
    {
      id v3 = (void *)MEMORY[0x1E4FB1F10];
      double v4 = [(UIWebClip *)self->_webClip identifier];
      LOBYTE(v3) = [v3 webClipWithIdentifierExists:v4];

      if ((v3 & 1) == 0)
      {
        -[TabDocument setWebClip:]((uint64_t)self, 0);
      }
    }
  }
}

- (id)loadURL:(id)a3 userDriven:(BOOL)a4
{
  double v4 = -[TabDocument loadURL:userDriven:skipSyncableTabUpdates:](self, a3, a4, 0);
  return v4;
}

- (id)loadURL:(uint64_t)a3 userDriven:(char)a4 skipSyncableTabUpdates:
{
  id v7 = a2;
  if (a1)
  {
    char v8 = -[TabDocument _loadURL:userDriven:eventAttribution:skipSyncableTabUpdates:](a1, v7, a3, 0, a4);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_loadURL:(uint64_t)a3 userDriven:(void *)a4 eventAttribution:(char)a5 skipSyncableTabUpdates:
{
  id v9 = a2;
  id v10 = a4;
  if (a1)
  {
    [a1 setReadingListBookmark:0];
    id v11 = -[TabDocument _loadURLInternal:userDriven:eventAttribution:skipSyncableTabUpdates:]((uint64_t)a1, v9, a3, v10, a5);
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)loadURL:(id)a3 title:(id)a4 skipSyncableTabUpdates:(BOOL)a5
{
  id v10 = a3;
  id v8 = a4;
  if (self->_active && !self->_hibernated)
  {
    id v9 = -[TabDocument loadURL:userDriven:skipSyncableTabUpdates:](self, v10, 0, a5);
  }
  else
  {
    self->_skipSyncableTabUpdates = a5;
    -[TabDocument _setDeferredNavigationURL:title:]((uint64_t)self, v10, v8);
  }
}

- (void)_setDeferredNavigationURL:(void *)a3 title:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    id v9 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v15 = 134218499;
      uint64_t v16 = a1;
      __int16 v17 = 2160;
      uint64_t v18 = 1752392040;
      __int16 v19 = 2117;
      id v20 = v6;
      _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_INFO, "Store deferred navigation: (document: %p) %{sensitive, mask.hash}@", (uint8_t *)&v15, 0x20u);
    }
    *(unsigned char *)(a1 + 816) = 1;
    objc_storeStrong((id *)(a1 + 824), a2);
    uint64_t v10 = [v7 copy];
    id v11 = *(void **)(a1 + 832);
    *(void *)(a1 + 832) = v10;

    *(unsigned char *)(a1 + 951) = 0;
    uint64_t v12 = [WeakRetained tabCollectionViewProvider];
    uint64_t v13 = [(id)a1 uuid];
    [v12 removeSnapshotForTabWithUUID:v13];

    [*(id *)(a1 + 168) setTitle:v7];
    [*(id *)(a1 + 168) setURL:v6];
    [(id)a1 updateTabTitle];
    [(id)a1 updateTabIcon];
    char v14 = [WeakRetained tabController];
    [v14 updateWBTabWithTab:a1 notify:0 persist:0];

    [(id)a1 hibernate];
  }
}

- (id)_loadURLInternal:(uint64_t)a3 userDriven:(void *)a4 eventAttribution:(char)a5 skipSyncableTabUpdates:
{
  id v9 = a2;
  id v10 = a4;
  if (a1)
  {
    *(unsigned char *)(a1 + 816) = 0;
    id v11 = *(void **)(a1 + 824);
    *(void *)(a1 + 824) = 0;

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v9);
    if (*(void *)(a1 + 1256)) {
      [(id)a1 clearPageLoadStatistics];
    }
    [(id)a1 setSuppressingProgressAnimationForNavigationGesture:0];
    uint64_t v13 = *(void **)(a1 + 312);
    *(void *)(a1 + 312) = 0;

    char v14 = [MEMORY[0x1E4FB1F10] webClipWithURL:v9];
    if (v14)
    {
      uint64_t v15 = -[TabDocument loadWebClip:userDriven:]((unsigned char *)a1, v14);
    }
    else
    {
      if ([(id)a1 shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:v9])
      {
        uint64_t v16 = [MEMORY[0x1E4F78598] builder];
        [v16 setPrefersOpenInNewTabReusingExistingBlankTabIfPossible:1];
        __int16 v17 = [v16 navigationIntentWithURL:v9];
        [(id)a1 dispatchNavigationIntent:v17];

        *(unsigned char *)(a1 + 737) = 1;
        a1 = 0;
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v15 = -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:eventAttribution:skipSyncableTabUpdates:](a1, v12, a3, *(void *)(a1 + 1264) != 0, v10, a5);
    }
    a1 = v15;
    goto LABEL_10;
  }
LABEL_11:

  return (id)a1;
}

- (id)_loadURLInternal:(uint64_t)a3 userDriven:
{
  id v5 = a2;
  if (a1)
  {
    id v6 = -[TabDocument _loadURLInternal:userDriven:eventAttribution:skipSyncableTabUpdates:](a1, v5, a3, 0, 0);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (_BYTE)loadWebClip:(unsigned char *)a1 userDriven:(void *)a2
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (objc_opt_respondsToSelector())
    {
      double v4 = (id)WBS_LOG_CHANNEL_PREFIXWebClips();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [v3 identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = v5;
        __int16 v16 = 2048;
        uint64_t v17 = [v3 bundleVersion];
        _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_INFO, "Loading UIWebClip with identifier %{public}@'; version: %lu",
          buf,
          0x16u);
      }
    }
    a1[701] = 0;
    a1[735] = 1;
    id v6 = [v3 pageURL];
    id v7 = [v6 absoluteString];

    -[TabDocument _updateFallbackURLsForUserTypedAddress:userExplicitlyRequestedAsHTTP:]((uint64_t)a1, v7, 0);
    id v13 = 0;
    int v8 = -[TabDocument _loadNextFallbackURLWithWebClip:navigation:]((uint64_t)a1, v3, &v13);
    id v9 = v13;
    BOOL v10 = v8 == 0;
    if (v8) {
      a1 = v9;
    }
    else {
      a1 = 0;
    }
    if (v10) {
      id v11 = v9;
    }
    else {
      id v11 = 0;
    }
  }
  return a1;
}

- (void)clearPageLoadStatistics
{
  pageLoadStatistics = self->_pageLoadStatistics;
  self->_pageLoadStatistics = 0;
}

- (void)setNeedsSendTelemetryForProvisionalLoad
{
  self->_needsSendTelemetryForProvisionalLoad = 1;
}

- (uint64_t)_loadURL:(void *)a3 fromBookmark:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!a1)
  {
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  int v8 = [v6 address];
  id v9 = objc_msgSend(v8, "safari_scriptIfJavaScriptURLString");

  if (v9)
  {
    [a1[129] evaluateJavaScript:v9 completionHandler:0];
  }
  else
  {
    if (!v5)
    {
      uint64_t v10 = 0;
      goto LABEL_5;
    }
    id v12 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)a1, v5, 1);
    if ([v7 isReadingListItem])
    {
      [a1 setReadingListBookmark:v7];
    }
    else
    {
      [a1 setReadingListBookmark:0];
      objc_storeStrong(a1 + 39, a3);
    }
  }
  uint64_t v10 = 1;
LABEL_5:

LABEL_6:
  return v10;
}

- (void)loadURLForContinuousReadingList:(id)a3 fromBookmark:(id)a4
{
}

- (uint64_t)_trySwitchingToPinnedTabOnNavigationToURL:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 736))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    id v5 = [WeakRetained tabController];
    uint64_t v6 = [v5 trySwitchingToPinnedTabOnNavigationToURL:v3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)loadCloudTab:(id)a3
{
  id v6 = a3;
  double v4 = [v6 url];
  id v5 = [(TabDocument *)self loadURL:v4 userDriven:1];

  [(TabDocument *)self restoreScrollPositionWithCloudTab:v6];
}

- (void)restoreScrollPositionWithCloudTab:(id)a3
{
  id v8 = a3;
  [(TabDocument *)self clearReaderScrollInformation];
  if ([v8 isShowingReader])
  {
    self->_shouldRestoreReader = 1;
    double v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = [v8 readerScrollPositionDictionary];
    id v6 = [v4 dictionaryWithDictionary:v5];
    initialArticleScrollDictionaryForCloudTab = self->_initialArticleScrollDictionaryForCloudTab;
    self->_initialArticleScrollDictionaryForCloudTab = v6;
  }
}

- (void)goBack
{
}

- (void)goBackAllowingNewTabToSpawnIfNeeded:(BOOL)a3
{
  self->_wasOpenedFromHistory = 1;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__TabDocument_goBackAllowingNewTabToSpawnIfNeeded___block_invoke;
  v3[3] = &unk_1E6D795D8;
  void v3[4] = self;
  BOOL v4 = a3;
  -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v3);
}

void __51__TabDocument_goBackAllowingNewTabToSpawnIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1032) backForwardList];
  id v9 = [v2 backItem];

  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [MEMORY[0x1E4F78598] builder];
    BOOL v4 = [v9 URL];
    id v5 = [v3 navigationIntentWithHistoryURL:v4];

    id v6 = objc_msgSend(v9, "safari_highlight");
    [v5 setHighlight:v6];

    if ([v5 policy])
    {
      [*(id *)(a1 + 32) dispatchNavigationIntent:v5];
LABEL_9:

      goto LABEL_10;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 168) goBack];
  int v7 = [*(id *)(a1 + 32) canGoBackToParentTab];
  id v8 = *(void **)(a1 + 32);
  if (v7)
  {
    [v8 goBackToParentTab];
    goto LABEL_10;
  }
  if ([v8 canGoBack])
  {
    id v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    id v5 = [v3 bookmarkWithID:-[WKBackForwardListItem safari_bookmarkID](v9)];
    [*(id *)(a1 + 32) setReadingListBookmark:v5];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)goBackToParentTab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentShouldCloseAndSwitchToParentTab:self];
}

- (void)goForward
{
}

- (void)goForwardAllowingNewTabToSpawnIfNeeded:(BOOL)a3
{
  self->_wasOpenedFromHistory = 1;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__TabDocument_goForwardAllowingNewTabToSpawnIfNeeded___block_invoke;
  v3[3] = &unk_1E6D795D8;
  void v3[4] = self;
  BOOL v4 = a3;
  -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v3);
}

void __54__TabDocument_goForwardAllowingNewTabToSpawnIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1032) backForwardList];
  id v7 = [v2 forwardItem];

  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = [MEMORY[0x1E4F78598] builder];
    BOOL v4 = [v7 URL];
    id v5 = [v3 navigationIntentWithHistoryURL:v4];

    id v6 = objc_msgSend(v7, "safari_highlight");
    [v5 setHighlight:v6];

    if ([v5 policy])
    {
      [*(id *)(a1 + 32) dispatchNavigationIntent:v5];
      goto LABEL_7;
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 168) goForward];
  if (![*(id *)(a1 + 32) canGoForward]) {
    goto LABEL_8;
  }
  id v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  id v5 = [v3 bookmarkWithID:-[WKBackForwardListItem safari_bookmarkID](v7)];
  [*(id *)(a1 + 32) setReadingListBookmark:v5];
LABEL_7:

LABEL_8:
}

- (uint64_t)_suppressReloadToPreventLoadingJavaScriptIfNecessary
{
  if (result)
  {
    uint64_t v1 = result;
    id v2 = [(id)result expectedOrCurrentURL];
    id v3 = [v2 absoluteString];
    char v4 = objc_msgSend(v3, "safari_isJavaScriptURLString");

    if (v4)
    {
      [*(id *)(v1 + 1272) addDisallowedUseOfJavaScriptAlert];
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)reload
{
}

- (void)_reloadFromOrigin:(uint64_t)a1
{
  if (a1 && (-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary](a1) & 1) == 0)
  {
    if ([*(id *)(a1 + 304) isScribbling]) {
      [*(id *)(a1 + 304) endScribblingAndSaveChanges:0];
    }
    *(void *)(a1 + 1192) = 4;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __33__TabDocument__reloadFromOrigin___block_invoke;
    v4[3] = &unk_1E6D795D8;
    void v4[4] = a1;
    char v5 = a2;
    -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:](a1, 1, v4);
  }
}

- (void)reloadFromOrigin
{
}

- (void)reloadUserInitiated
{
  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    [(TabDocument *)self reload];
    -[TabDocument _didUserInitiatedReload]((id *)&self->super.isa);
    self->_isNavigatingViaNormalReload = 1;
  }
}

- (void)_didUserInitiatedReload
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] date];
    [a1[134] setLastReloadDate:v2];

    id v3 = [a1 expectedOrCurrentURL];
    char v4 = objc_msgSend(v3, "safari_isSafariWebExtensionURL");

    if ((v4 & 1) == 0)
    {
      -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary]((uint64_t)a1);
      -[TabDocument _showPrivateBrowsingPrivacyProtectionsBannerForReload]((uint64_t)a1);
    }
  }
}

- (void)reloadFromOriginUserInitiated
{
  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    [(TabDocument *)self reloadFromOrigin];
    -[TabDocument _didUserInitiatedReload]((id *)&self->super.isa);
    self->_isNavigatingViaReloadFromOrigin = 1;
  }
}

- (void)_hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary
{
  if (a1 && *(void *)(a1 + 1176))
  {
    *(unsigned char *)(a1 + 376) = 0;
    if ([(id)a1 isActive])
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
      [WeakRetained showPrivateBrowsingPrivacyProtectionsBanner:0];
    }
    id v3 = *(void **)(a1 + 1176);
    *(void *)(a1 + 1176) = 0;
  }
}

- (void)_showPrivateBrowsingPrivacyProtectionsBannerForReload
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] now];
    [v2 timeIntervalSinceDate:*(void *)(a1 + 384)];
    double v4 = v3;

    if (v4 > 60.0)
    {
      *(unsigned char *)(a1 + 376) = 0;
      return;
    }
    char v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v6 = objc_msgSend(v5, "safari_enableAdvancedPrivacyProtections:", objc_msgSend((id)a1, "isPrivateBrowsingEnabled"));

    if (*(unsigned char *)(a1 + 376))
    {
      BOOL v7 = *(unsigned char *)(a1 + 377) != 0;
      if (!v6) {
        return;
      }
    }
    else
    {
      BOOL v7 = 1;
      if (!v6) {
        return;
      }
    }
    if (!*(unsigned char *)(a1 + 917)) {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      objc_initWeak(&location, (id)a1);
      id v8 = objc_alloc_init(MEMORY[0x1E4F78318]);
      id v9 = *(void **)(a1 + 1176);
      *(void *)(a1 + 1176) = v8;

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke;
      v13[3] = &unk_1E6D796F0;
      objc_copyWeak(&v14, &location);
      [*(id *)(a1 + 1176) setReducePrivacyProtectionsActionHandler:v13];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke_2;
      v11[3] = &unk_1E6D796F0;
      objc_copyWeak(&v12, &location);
      [*(id *)(a1 + 1176) setDismissButtonHandler:v11];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
      [WeakRetained showPrivateBrowsingPrivacyProtectionsBanner:*(void *)(a1 + 1176)];

      *(unsigned char *)(a1 + 377) = 1;
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
}

uint64_t __33__TabDocument__reloadFromOrigin___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 168) reloadFromOrigin:*(unsigned __int8 *)(a1 + 40)];
}

- (void)close
{
}

- (void)setPageZoomFactor:(double)a3
{
  if (([(SFScribbleController *)self->_sfScribbleController isScribbling] & 1) == 0)
  {
    id v7 = [(TabDocument *)self webView];
    [v7 _viewScale];
    double v6 = v5;

    if (v6 < a3) {
      [(TabDocument *)self webViewDidIncreaseZoom];
    }
    id v8 = [(TabDocument *)self webView];
    [v8 _setViewScale:a3];
  }
}

- (double)pageZoomFactor
{
  id v2 = [(TabDocument *)self webView];
  [v2 _viewScale];
  double v4 = v3;

  return v4;
}

- (void)_updatePageZoomWithPreference
{
  if (val)
  {
    objc_initWeak(&location, val);
    id WeakRetained = objc_loadWeakRetained(val + 152);
    double v3 = [WeakRetained pageZoomPreferenceManagerForTabDocument:val];
    double v4 = [val URLForPerSitePreferences];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__TabDocument__updatePageZoomWithPreference__block_invoke;
    v5[3] = &unk_1E6D7D2D8;
    objc_copyWeak(&v6, &location);
    [v3 getPageZoomFactorForURL:v4 usingBlock:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __44__TabDocument__updatePageZoomWithPreference__block_invoke(uint64_t a1, double a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__TabDocument__updatePageZoomWithPreference__block_invoke_2;
  v3[3] = &unk_1E6D7D2B0;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __44__TabDocument__updatePageZoomWithPreference__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = *(double *)(a1 + 40);
  id v5 = WeakRetained;
  double v4 = [WeakRetained webView];
  [v4 _setViewScale:v3];
}

- (void)increasePageZoomSetting
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = [WeakRetained pageZoomPreferenceManagerForTabDocument:self];
  id v5 = [(TabDocument *)self URLForPerSitePreferences];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__TabDocument_increasePageZoomSetting__block_invoke;
  void v6[3] = &unk_1E6D7D300;
  void v6[4] = self;
  objc_copyWeak(&v7, &location);
  [v4 zoomInOnURL:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__TabDocument_increasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:0 method:3];

    [*(id *)(a1 + 32) webViewDidIncreaseZoom];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__TabDocument_increasePageZoomSetting__block_invoke_2;
    void v6[3] = &unk_1E6D7D2B0;
    objc_copyWeak(v7, (id *)(a1 + 40));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
    objc_destroyWeak(v7);
  }
}

void __38__TabDocument_increasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained webView];
  [v2 _setViewScale:v1];
}

- (void)decreasePageZoomSetting
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = [WeakRetained pageZoomPreferenceManagerForTabDocument:self];
  id v5 = [(TabDocument *)self URLForPerSitePreferences];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__TabDocument_decreasePageZoomSetting__block_invoke;
  void v6[3] = &unk_1E6D7D328;
  objc_copyWeak(&v7, &location);
  [v4 zoomOutOnURL:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__TabDocument_decreasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:0 method:3];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__TabDocument_decreasePageZoomSetting__block_invoke_2;
    void v6[3] = &unk_1E6D7D2B0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
    objc_destroyWeak(v7);
  }
}

void __38__TabDocument_decreasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained webView];
  [v2 _setViewScale:v1];
}

- (void)resetPageZoomSetting
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v4 = [WeakRetained pageZoomPreferenceManagerForTabDocument:self];
  id v5 = [(TabDocument *)self URLForPerSitePreferences];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__TabDocument_resetPageZoomSetting__block_invoke;
  void v6[3] = &unk_1E6D7D328;
  objc_copyWeak(&v7, &location);
  [v4 resetZoomLevelOnURL:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __35__TabDocument_resetPageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:1 method:3];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__TabDocument_resetPageZoomSetting__block_invoke_2;
    void v6[3] = &unk_1E6D7D2B0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
    objc_destroyWeak(v7);
  }
}

void __35__TabDocument_resetPageZoomSetting__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    double v3 = [WeakRetained webView];
    [v3 _setViewScale:*(double *)(a1 + 40)];
    double v4 = [v11 view];
    [v3 _minimumEffectiveDeviceWidth];
    if (v5 == 0.0)
    {
      double v9 = 1.0;
    }
    else
    {
      [v4 bounds];
      double v7 = v6;
      [v3 _minimumEffectiveDeviceWidth];
      double v9 = v7 / v8;
    }
    uint64_t v10 = [v3 scrollView];
    [v10 setZoomScale:v9];

    id WeakRetained = v11;
  }
}

- (void)reloadEnablingDowngradedPrivateRelay:(BOOL)a3
{
  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    if (!a3)
    {
      double v5 = [MEMORY[0x1E4F98D20] sharedManager];
      double v6 = [(TabDocument *)self expectedOrCurrentURL];
      [v5 clearPrivateRelayFailClosedExceptionIfNecessaryForURL:v6];
    }
    -[TabDocument _disablePrivateRelaySetting:]((uint64_t)self, a3);
    -[TabDocument _reloadFromOrigin:]((uint64_t)self, 0);
  }
}

- (void)_disablePrivateRelaySetting:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [(id)a1 URL];
    double v5 = *(void **)(a1 + 592);
    *(void *)(a1 + 592) = v4;

    *(unsigned char *)(a1 + 600) = a2;
    *(unsigned char *)(a1 + 916) = a2;
  }
}

- (void)reloadDisablingContentBlockers:(BOOL)a3
{
  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    [(SFScribbleController *)self->_sfScribbleController reloadWithoutScribbleElements];
    double v5 = [(TabDocument *)self URL];
    urlToReloadForcingContentBlockers = self->_urlToReloadForcingContentBlockers;
    self->_urlToReloadForcingContentBlockers = v5;

    self->_disableContentBlockersWhenReloading = a3;
    -[TabDocument _reloadFromOrigin:]((uint64_t)self, 0);
  }
}

- (void)reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:(BOOL)a3
{
  if ((-[TabDocument _suppressReloadToPreventLoadingJavaScriptIfNecessary]((uint64_t)self) & 1) == 0)
  {
    double v5 = [(TabDocument *)self URL];
    urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections;
    self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = v5;

    self->_disableAdvancedPrivateBrowsingPrivacyProtectionsWhenReloading = a3;
    -[TabDocument _reloadFromOrigin:]((uint64_t)self, 0);
  }
}

void __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:1];
    -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary]((uint64_t)WeakRetained);
  }
}

void __68__TabDocument__showPrivateBrowsingPrivacyProtectionsBannerForReload__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary]((uint64_t)WeakRetained);
  }
}

- (void)_showPerSitePreferencesPopoverViewControllerIfPossible
{
  if (a1)
  {
    id v2 = [a1 URLForPerSitePreferences];
    objc_msgSend(v2, "safari_userVisibleHostWithoutWWWSubdomain");
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if ([v9 length])
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 120);
      id v4 = objc_alloc(MEMORY[0x1E4F3B000]);
      double v5 = [a1 perSitePreferencesVendor];
      double v6 = (void *)[v4 initWithBrowserDocument:a1 perSitePreferencesVendor:v5];

      double v7 = [v6 view];
      [v7 setAccessibilityIdentifier:@"PerSitePreferencesPopoverView"];

      double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
      [v8 setModalPresentationStyle:2];
      [WeakRetained _presentModalViewController:v8 fromBarItem:*MEMORY[0x1E4F788B8] completion:0];
    }
  }
}

- (BOOL)privacyReportShouldSeparateBlockedTrackers
{
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  LOBYTE(self) = objc_msgSend(v3, "safari_enableAdvancedPrivacyProtections:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));

  return (char)self;
}

- (BOOL)browserHasMultipleProfiles
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v3 = [WeakRetained hasMultipleProfiles];

  return v3;
}

- (NSSet)allBrowserProfileIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v3 = [WeakRetained tabGroupManager];
  id v4 = [v3 allProfileIdentifiers];

  return (NSSet *)v4;
}

- (NSSet)allBrowserHistories
{
  id v2 = +[Application sharedApplication];
  char v3 = [v2 historiesForProfiles];

  return (NSSet *)v3;
}

- (BOOL)isBlockedByScreenTime
{
  return [(TabDocument *)self policy] != 0;
}

- (BOOL)canHideToolbar
{
  id v2 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  char v3 = [v2 tabDocumentCanHideToolbar];

  return v3;
}

- (NSURL)URLForPerSitePreferences
{
  char v3 = [(TabDocument *)self committedURL];
  id v4 = [(TabDocument *)self customUserVisibleStringForReadingListBookmarkURL:v3];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

    char v3 = (void *)v5;
  }

  if (!v3
    || (objc_msgSend(v3, "safari_isHTTPFamilyURL") & 1) == 0
    && [(TabDocument *)self isShowingErrorPage])
  {
    uint64_t v6 = [(TabDocument *)self URL];

    char v3 = (void *)v6;
  }
  return (NSURL *)v3;
}

- (SFScribbleController)sfScribbleController
{
  sfScribbleController = self->_sfScribbleController;
  if (!sfScribbleController)
  {
    id v4 = (SFScribbleController *)[objc_alloc(MEMORY[0x1E4F78348]) initWithWebView:self->_webView delegate:self];
    uint64_t v5 = self->_sfScribbleController;
    self->_sfScribbleController = v4;

    sfScribbleController = self->_sfScribbleController;
  }
  return sfScribbleController;
}

- (BOOL)currentPageLoadedFromReadingList
{
  return [(TabDocument *)self readingListBookmarkID] != 0;
}

- (void)setShowingContinuous:(BOOL)a3
{
  if (self->_showingContinuous != a3)
  {
    self->_showingContinuous = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tabDocumentDidUpdateShowingContinuous:self];
  }
}

- (id)backListMenuWithLimit:(int)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = -[TabDocument _backListWithLimit:]((uint64_t)self, a3);
  if (-[TabDocument canGoBackToParentTab](self, "canGoBackToParentTab") && [v4 count] == 1)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = [v4 firstObject];
    uint64_t v6 = NSString;
    double v7 = _WBSLocalizedString();
    double v8 = [v5 title];
    id v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

    uint64_t v10 = (void *)MEMORY[0x1E4FB13F0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__TabDocument_backListMenuWithLimit___block_invoke;
    v17[3] = &unk_1E6D791C0;
    objc_copyWeak(&v18, &location);
    id v11 = [v10 actionWithTitle:v9 image:0 identifier:0 handler:v17];
    id v12 = -[WKBackForwardListItem safari_urlForDisplay](v5);
    id v13 = objc_msgSend(v12, "safari_stringForListDisplay");
    [v11 setDiscoverabilityTitle:v13];

    v20[0] = v11;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __37__TabDocument_backListMenuWithLimit___block_invoke_2;
    v16[3] = &unk_1E6D7D350;
    v16[4] = self;
    id v14 = objc_msgSend(v4, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 2, v16);
  }

  return v14;
}

- (id)_backListWithLimit:(uint64_t)a1
{
  if (a1)
  {
    char v3 = [*(id *)(a1 + 1032) backForwardList];
    id v4 = [v3 backList];

    unint64_t v5 = [v4 count];
    if (v5 <= a2)
    {
      id v6 = v4;
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", v5 - a2, a2);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    double v7 = v6;
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

void __37__TabDocument_backListMenuWithLimit___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained goBackAllowingNewTabToSpawnIfNeeded:1];
}

id __37__TabDocument_backListMenuWithLimit___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = -[TabDocument _menuElementForBackForwardListItem:](*(void **)(a1 + 32), a2);
  return v2;
}

- (id)_menuElementForBackForwardListItem:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = (void *)MEMORY[0x1E4FB13F0];
    unint64_t v5 = [v3 title];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__TabDocument__menuElementForBackForwardListItem___block_invoke;
    v19[3] = &unk_1E6D7D3A0;
    objc_copyWeak(&v21, &location);
    id v6 = v3;
    id v20 = v6;
    double v7 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:v19];

    double v8 = -[WKBackForwardListItem safari_urlForDisplay](v6);
    id v9 = objc_msgSend(v8, "safari_stringForListDisplay");
    [v7 setDiscoverabilityTitle:v9];

    uint64_t v10 = [v6 URL];
    LODWORD(v9) = objc_msgSend(v10, "safari_isSafariWebExtensionURL");

    if (v9)
    {
      id v11 = [a1 webExtensionsController];
      id v12 = [v6 URL];
      id v13 = [v12 host];
      id v14 = [v11 webExtensionForBaseURIHost:v13];

      uint64_t v15 = [v14 displayName];
      __int16 v16 = [v6 title];
      if ([v16 isEqualToString:v15]) {
        uint64_t v17 = &stru_1F3C268E8;
      }
      else {
        uint64_t v17 = v15;
      }
      [v7 setDiscoverabilityTitle:v17];
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)forwardListMenuWithLimit:(int)a3
{
  id v4 = -[TabDocument _forwardListWithLimit:]((uint64_t)self, a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __40__TabDocument_forwardListMenuWithLimit___block_invoke;
  v7[3] = &unk_1E6D7D378;
  void v7[4] = self;
  unint64_t v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v7);

  return v5;
}

- (id)_forwardListWithLimit:(uint64_t)a1
{
  if (a1)
  {
    id v3 = [*(id *)(a1 + 1032) backForwardList];
    id v4 = [v3 forwardList];

    if ([v4 count] <= a2)
    {
      id v5 = v4;
    }
    else
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, a2);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

id __40__TabDocument_forwardListMenuWithLimit___block_invoke(uint64_t a1, void *a2)
{
  id v2 = -[TabDocument _menuElementForBackForwardListItem:](*(void **)(a1 + 32), a2);
  return v2;
}

void __50__TabDocument__menuElementForBackForwardListItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = [MEMORY[0x1E4F78598] builder];
    id v4 = [*(id *)(a1 + 32) URL];
    id v5 = [v3 navigationIntentWithURL:v4];

    id v6 = objc_msgSend(*(id *)(a1 + 32), "safari_highlight");
    [v5 setHighlight:v6];

    if ([v5 policy]) {
      [v7 dispatchNavigationIntent:v5];
    }
    else {
      [v7 goToBackForwardListItem:*(void *)(a1 + 32)];
    }

    id WeakRetained = v7;
  }
}

- (BOOL)canGoBackToParentTab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);
  if (WeakRetained
    && ([(TabDocument *)self _backForwardList],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 backList],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unint64_t v6 = [v5 count],
        v5,
        v4,
        v6 <= 1))
  {
    double v8 = [(TabDocument *)self _backForwardList];
    id v9 = [v8 backItem];
    uint64_t v10 = [v9 URL];
    id v11 = [WeakRetained _backForwardList];
    id v12 = [v11 currentItem];
    id v13 = [v12 URL];
    char v7 = [v10 isEqual:v13];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_clearAppBannerIfNotCurrentStoreBannerDeferringRemoval:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 368) invalidate];
    id v4 = *(void **)(a1 + 368);
    *(void *)(a1 + 368) = 0;

    id v5 = *(void **)(a1 + 360);
    if (v5 != *(void **)(a1 + 352))
    {
      *(void *)(a1 + 360) = 0;
    }
    uint64_t v6 = *(void *)(a1 + 1168);
    if (v6 && v6 != *(void *)(a1 + 352))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
      double v8 = WeakRetained;
      id v11 = WeakRetained;
      if (!*(unsigned char *)(a1 + 927)
        && ((a2 & 1) != 0
         || (v10 = [WeakRetained tabDocumentShouldDeferAppBannerRemoval:a1], double v8 = v11, v10)))
      {
        *(unsigned char *)(a1 + 927) = 1;
      }
      else
      {
        [v8 removeAppBannerFromTabDocument:a1 animated:0];
        id v9 = *(void **)(a1 + 1168);
        *(void *)(a1 + 1168) = 0;

        double v8 = v11;
      }
    }
  }
}

- (void)_setAppBannerWhenPainted:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 708))
    {
      [*(id *)(a1 + 368) invalidate];
      id v4 = *(void **)(a1 + 368);
      *(void *)(a1 + 368) = 0;

      if (*(id *)(a1 + 1168) == v8) {
        goto LABEL_11;
      }
      if (*(unsigned char *)(a1 + 927)) {
        [v8 setInitiallyBehindNavigationBar:0];
      }
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
      uint64_t v6 = WeakRetained;
      if (*(void *)(a1 + 1168)) {
        [WeakRetained removeAppBannerFromTabDocument:a1 animated:0];
      }
      objc_storeStrong((id *)(a1 + 1168), a2);
      [v6 tabDocumentDidCompleteCheckForAppBanner:a1];
    }
    else
    {
      id v7 = v8;
      uint64_t v6 = *(void **)(a1 + 360);
      *(void *)(a1 + 360) = v7;
    }
  }
LABEL_11:
}

- (void)_startAppBannerRemovalTimer
{
  if (val)
  {
    objc_initWeak(&location, val);
    id v2 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __42__TabDocument__startAppBannerRemovalTimer__block_invoke;
    id v9 = &unk_1E6D7D060;
    objc_copyWeak(&v10, &location);
    uint64_t v3 = [v2 timerWithTimeInterval:0 repeats:&v6 block:2.5 + 0.3];
    id v4 = (void *)*((void *)val + 46);
    *((void *)val + 46) = v3;

    id v5 = objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop", v6, v7, v8, v9);
    [v5 addTimer:*((void *)val + 46) forMode:*MEMORY[0x1E4F1C4B0]];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __42__TabDocument__startAppBannerRemovalTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained[46] invalidate];
    id v2 = v4[46];
    v4[46] = 0;

    id v3 = objc_loadWeakRetained(v4 + 152);
    [v3 removeAppBannerFromTabDocument:v4 animated:0];

    id WeakRetained = v4;
  }
}

- (id)_startedLoadingResources
{
  if (result)
  {
    double v1 = result;
    id WeakRetained = objc_loadWeakRetained(result + 153);
    [WeakRetained didStartLoadingResource];

    uint64_t result = (id *)v1[157];
    if (result)
    {
      return (id *)[result startedLoadingResources];
    }
  }
  return result;
}

- (id)_stoppedLoadingResources
{
  if (result)
  {
    double v1 = result;
    id WeakRetained = objc_loadWeakRetained(result + 153);
    [WeakRetained didStopLoadingResource];

    uint64_t result = (id *)v1[157];
    if (result)
    {
      return (id *)[result finishedLoadingResources];
    }
  }
  return result;
}

- (uint64_t)_shouldCleanUpAfterRedirectToExternalApp
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = [*(id *)(a1 + 1032) _committedURL];
    if (v2) {
      uint64_t v1 = 0;
    }
    else {
      uint64_t v1 = [*(id *)(v1 + 1032) _webProcessIdentifier] != 0;
    }
  }
  return v1;
}

- (void)_completeRedirectToExternalNavigationResult:(uint64_t)a3 fromOriginalRequest:(uint64_t)a4 dialogResult:
{
  id v12 = a2;
  if (a1)
  {
    int v6 = -[TabDocument _shouldCleanUpAfterRedirectToExternalApp]((uint64_t)a1) ^ 1;
    if (a4 == 2) {
      LOBYTE(v6) = 1;
    }
    if (v6)
    {
      if (([v12 appliesOneTimeUserInitiatedActionPolicy] & 1) == 0)
      {
        uint64_t v7 = a1[149];
        a1[149] = v7 | 2;
        if (a4) {
          a1[149] = v7 | 6;
        }
      }
    }
    else if ([a1 canGoBack])
    {
      [a1 goBack];
    }
    else if (!a4)
    {
      [a1 _closeTabDocumentAnimated:0];
    }
    id v8 = [v12 appLink];
    id v9 = v8;
    if (a4 == 1 && v8)
    {
      [v8 disable];
      id v10 = [v9 url];
      id v11 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)a1, v10, [v12 loadWasUserDriven]);
    }
  }
}

- (void)_addNoFeedAppSupportAlert
{
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 1272);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40__TabDocument__addNoFeedAppSupportAlert__block_invoke;
    v3[3] = &unk_1E6D793E8;
    void v3[4] = a1;
    id v2 = [MEMORY[0x1E4F78270] noFeedAppDialogWithCompletionHandler:v3];
    [v1 addDialog:v2];
  }
}

void __40__TabDocument__addNoFeedAppSupportAlert__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (void *)MEMORY[0x1E4F1CB10];
    id v4 = [NSString stringWithFormat:@"itms-apps://?action=search"];
    id v7 = [v3 URLWithString:v4];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
    int v6 = [WeakRetained scene];
    [v6 openURL:v7 options:0 completionHandler:0];
  }
}

- (void)_queueAlertForRedirectToExternalNavigationResult:(void *)a3 fromOriginalRequest:(void *)a4 navigationAction:(char)a5 isMainFrame:(uint64_t)a6 promptPolicy:(void *)a7 userAction:
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __137__TabDocument__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_navigationAction_isMainFrame_promptPolicy_userAction___block_invoke;
    v22[3] = &unk_1E6D7D3C8;
    objc_copyWeak(&v27, &location);
    id v17 = v13;
    id v23 = v17;
    id v24 = v14;
    id v25 = v15;
    char v28 = a5;
    id v26 = v16;
    id v18 = (void *)MEMORY[0x1E4E42950](v22);
    if (([v17 externalApplicationCategory] | 2) == 2)
    {
      a1[149] |= 8uLL;
      uint64_t v19 = a6;
      id v20 = (void *)a1[159];
      id v21 = [MEMORY[0x1E4F78270] redirectDialogWithNavigationResult:v17 promptPolicy:v19 completionHandler:v18];
      [v20 addDialog:v21];
    }
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __137__TabDocument__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_navigationAction_isMainFrame_promptPolicy_userAction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (a2)
    {
      if (![v4 appliesOneTimeUserInitiatedActionPolicy]
        || [*(id *)(a1 + 32) externalApplicationCategory] != 2)
      {
        WeakRetained[149] &= ~8uLL;
      }
      -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](WeakRetained, *(void **)(a1 + 32), v5, a2);
    }
    else
    {
      if (![v4 appliesOneTimeUserInitiatedActionPolicy]
        || [*(id *)(a1 + 32) externalApplicationCategory] == 2)
      {
        WeakRetained[149] = 0;
      }
      -[TabDocument _redirectToExternalNavigationResult:fromOriginalRequest:navigationAction:promptPolicy:isMainFrame:userAction:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), 0, *(unsigned __int8 *)(a1 + 72), *(void **)(a1 + 56));
    }
    uint64_t v6 = MEMORY[0x1E4E42950](WeakRetained[67]);
    id v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, 1);
    }
  }
}

- (void)_redirectToExternalNavigationResult:(void *)a3 fromOriginalRequest:(void *)a4 navigationAction:(uint64_t)a5 promptPolicy:(uint64_t)a6 isMainFrame:(void *)a7 userAction:
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
    if ([WeakRetained tabDocumentCanRedirectToExternalApplication:a1])
    {
      if (*(void *)(a1 + 1192) != 8)
      {
        id v35 = objc_loadWeakRetained((id *)(a1 + 960));
        id v18 = [MEMORY[0x1E4FB1438] sharedApplication];
        if (([v18 isSuspended] & 1) != 0
          || ![(id)a1 isActive]
          || ([v35 isPrivateBrowsingEnabled] & 1) != 0)
        {
          uint64_t v19 = 1;
        }
        else
        {
          uint64_t v33 = [v35 tabCollectionViewProvider];
          uint64_t v19 = [v33 isShowingTabView];
        }
        if ([v13 shouldPromptWithPolicy:a5 telephonyNavigationPolicy:*(void *)(a1 + 392) userAction:v16 inBackgroundOrPrivateBrowsing:v19 inLockdownMode:*(unsigned __int8 *)(a1 + 656)])
        {
          -[TabDocument _queueAlertForRedirectToExternalNavigationResult:fromOriginalRequest:navigationAction:isMainFrame:promptPolicy:userAction:](a1, v13, v14, v15, a6, a5, v16);
          [WeakRetained tabDocumentDidCancelRedirectToExternalApplication:a1];
        }
        else
        {
          id v20 = [v13 URL];
          if ([v13 appliesOneTimeUserInitiatedActionPolicy]) {
            [v16 consume];
          }
          uint64_t v21 = [v13 externalApplicationCategory];
          if (!v21 || v21 == 2)
          {
            id v23 = [v13 appLink];
            char v24 = [(id)*MEMORY[0x1E4FB2608] canOpenURL:v20];
            if (v23) {
              char v25 = 1;
            }
            else {
              char v25 = v24;
            }
            if (v25)
            {
              id v26 = *(void **)(a1 + 1264);
              if (v26) {
                [v26 absoluteString];
              }
              else {
              id v27 = [v14 valueForHTTPHeaderField:@"Referer"];
              }
              char v28 = *(void **)(a1 + 1264);
              *(void *)(a1 + 1264) = 0;

              *(unsigned char *)(a1 + 926) = 0;
              __int16 v29 = *(void **)(a1 + 1184);
              *(void *)(a1 + 1184) = 0;

              *(unsigned char *)(a1 + 709) = 0;
              if (v23)
              {
                uint64_t v50 = *MEMORY[0x1E4FA6E98];
                v51[0] = MEMORY[0x1E4F1CC38];
                long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
                v41[0] = MEMORY[0x1E4F143A8];
                v41[1] = 3221225472;
                v41[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_3;
                v41[3] = &unk_1E6D7A238;
                v41[4] = a1;
                id v42 = v13;
                id v43 = v14;
                -[TabDocument _openAppLinkInApp:fromOriginalRequest:updateAppLinkStrategy:webBrowserState:completionHandler:](a1, v23, v43, 0, v30, v41);
              }
              else
              {
                if (v27)
                {
                  uint64_t v48 = *MEMORY[0x1E4F22370];
                  id v49 = v27;
                  char v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
                }
                else
                {
                  char v34 = 0;
                }
                id v32 = [MEMORY[0x1E4F223E0] defaultWorkspace];
                __int16 v31 = [v13 externalApplication];
                v36[0] = MEMORY[0x1E4F143A8];
                v36[1] = 3221225472;
                v36[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_4;
                v36[3] = &unk_1E6D7D3F0;
                id v37 = v15;
                uint64_t v38 = a1;
                id v39 = v13;
                id v40 = v14;
                objc_msgSend(v32, "_sf_openURL:inApplication:withOptions:completionHandler:", v20, v31, v34, v36);
              }
            }
            else
            {
              if (a6) {
                [*(id *)(a1 + 1272) addInvalidURLAlert];
              }
              [WeakRetained tabDocumentDidCancelRedirectToExternalApplication:a1];
            }
          }
          else if (v21 == 1 && !*(unsigned char *)(a1 + 712))
          {
            *(unsigned char *)(a1 + 712) = 1;
            id v22 = *(void **)(a1 + 392);
            v44[0] = MEMORY[0x1E4F143A8];
            v44[1] = 3221225472;
            v44[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke;
            v44[3] = &unk_1E6D7D3F0;
            v44[4] = a1;
            id v45 = v20;
            id v46 = v13;
            id v47 = v14;
            [v22 handleNavigationToURL:v45 completionHandler:v44];
          }
        }
      }
    }
    else
    {
      [WeakRetained tabDocumentDidCancelRedirectToExternalApplication:a1];
    }
  }
}

- (void)loadWindowDotOpenExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4
{
}

void __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 960));
    uint64_t v5 = [WeakRetained scene];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_2;
    v9[3] = &unk_1E6D796C8;
    uint64_t v6 = *(void *)(a1 + 40);
    void v9[4] = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "_sf_openTelURL:completionHandler:", v6, v9);
  }
  else
  {
    *(unsigned char *)(v3 + 712) = 0;
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 536);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
      v8();
    }
  }
}

uint64_t __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_2(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 712) = 0;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 392);
  if (a2)
  {
    [v3 userAcceptedCallPrompt];
    -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](*(void **)(a1 + 32), *(void **)(a1 + 40), v4, 0);
  }
  else
  {
    [v3 userDeclinedCallPrompt];
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 536);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)_clearNavigationSource
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 1264);
    *(void *)(a1 + 1264) = 0;

    *(unsigned char *)(a1 + 926) = 0;
    uint64_t v3 = *(void **)(a1 + 1184);
    *(void *)(a1 + 1184) = 0;

    *(unsigned char *)(a1 + 709) = 0;
  }
}

void __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](*(void **)(a1 + 32), *(void **)(a1 + 40), a3, a2 != 0);
}

- (void)_openAppLinkInApp:(void *)a3 fromOriginalRequest:(uint64_t)a4 updateAppLinkStrategy:(void *)a5 webBrowserState:(void *)a6 completionHandler:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    id v14 = [v11 valueForHTTPHeaderField:@"Referer"];
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithDataAsString:", v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = *(id *)(a1 + 1264);
    }
    id v16 = v15;
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 1032) _willOpenAppLink];
    }
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__11;
    void v18[4] = __Block_byref_object_dispose__11;
    id v19 = (id)MEMORY[0x1E4E42950](v13);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke;
    v17[3] = &unk_1E6D7D620;
    void v17[4] = v18;
    [v10 openExternallyWithWebBrowserState:v12 referrerURL:v16 completionHandler:v17];
    _Block_object_dispose(v18, 8);
  }
}

void __124__TabDocument__redirectToExternalNavigationResult_fromOriginalRequest_navigationAction_promptPolicy_isMainFrame_userAction___block_invoke_4(uint64_t a1, int a2)
{
  if (a2)
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) _storeSKAdNetworkAttribution];
    }
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void **)(a1 + 48);
    -[TabDocument _completeRedirectToExternalNavigationResult:fromOriginalRequest:dialogResult:](v4, v5, v3, 0);
  }
}

- (id)_readingListArchiveNextPageLinkForRequest:(void *)a3 targetFrame:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    if (![a1 currentPageLoadedFromReadingList])
    {
LABEL_5:
      a1 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [v6 request];
    id v8 = [v7 URL];
    if ([v8 isFileURL])
    {
      id v9 = [MEMORY[0x1E4F4BE68] sharedNetworkObserver];
      char v10 = [v9 isNetworkReachable];

      if (v10) {
        goto LABEL_5;
      }
      id v11 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
      uint64_t v7 = objc_msgSend(v11, "bookmarkWithID:", objc_msgSend(a1, "readingListBookmarkID"));

      id v8 = [v5 URL];
      a1 = [v7 webarchivePathForNextPageURL:v8];
    }
    else
    {
      a1 = 0;
    }
  }
LABEL_9:

  return a1;
}

- (id)_fileURLNavigationResultForURL:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    int v4 = [a1 readingListBookmarkID];
    if (gTestFileURLs) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = v4 == 0;
    }
    if (v5 && [v3 isFileURL])
    {
      a1 = [MEMORY[0x1E4F3AFD8] resultOfType:4 withURL:v3];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (uint64_t)_shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:(uint64_t)result
{
  if (result)
  {
    {
      uint64_t v2 = result;
      int v3 = a2;
      a2 = v3;
      int v5 = v4;
      uint64_t result = v2;
      if (v5)
      {
        if ([MEMORY[0x1E4F97EA0] hasInternalContent])
        {
          id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
          char v7 = [v6 BOOLForKey:@"RedirectToExternalAppsDisallowed"];
        }
        else
        {
          char v7 = 0;
        }
        -[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:]::redirectToExternalAppsDisallowedByUserDefault = v7;
        a2 = v3;
        uint64_t result = v2;
      }
    }
    if (-[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:]::redirectToExternalAppsDisallowedByUserDefault) {
      return 1;
    }
    else {
      return (a2 ^ 1) & (*(unsigned __int8 *)(result + 1192) >> 2);
    }
  }
  return result;
}

- (id)_resultOfLoadingRequest:(uint64_t)a3 inMainFrame:(int)a4 userInitiated:
{
  id v7 = a2;
  id v8 = v7;
  if (a1)
  {
    id v9 = [v7 URL];
    char v10 = -[TabDocument _fileURLNavigationResultForURL:](a1, v9);

    if (!v10)
    {
      uint64_t v11 = -[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:]((uint64_t)a1, a4);
      id v12 = (void *)MEMORY[0x1E4F3AFD8];
      uint64_t v13 = a1[173];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __65__TabDocument__resultOfLoadingRequest_inMainFrame_userInitiated___block_invoke;
      v15[3] = &unk_1E6D7D418;
      id v16 = v8;
      id v17 = a1;
      char v10 = [v12 resultOfLoadingRequest:v16 isMainFrame:a3 disallowRedirectToExternalApps:v11 preferredApplicationBundleIdentifier:v13 redirectDecisionHandler:v15];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

uint64_t __65__TabDocument__resultOfLoadingRequest_inMainFrame_userInitiated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v5 = [*(id *)(a1 + 32) URL];
  id v6 = [*(id *)(a1 + 40) committedURL];
  uint64_t v7 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, v6, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 88), "loadedUsingDesktopUserAgent"));

  return v7;
}

- (void)_determineResultOfLoadingRequest:(uint64_t)a3 inMainFrame:(int)a4 userInitiated:(void *)a5 completionHandler:
{
  id v9 = a2;
  char v10 = a5;
  if (a1)
  {
    uint64_t v11 = [v9 URL];
    id v12 = -[TabDocument _fileURLNavigationResultForURL:]((void *)a1, v11);

    if (v12)
    {
      v10[2](v10, v12);
    }
    else
    {
      unsigned int v13 = -[TabDocument _shouldDisallowRedirectToExternalAppsForUserInitiatedRequest:](a1, a4);
      if (*(unsigned char *)(a1 + 778)) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = v13;
      }
      id v19 = [(id)a1 committedURL];
      char v15 = [*(id *)(a1 + 88) loadedUsingDesktopUserAgent];
      id v16 = (void *)MEMORY[0x1E4F3AFD8];
      uint64_t v17 = *(void *)(a1 + 1384);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __92__TabDocument__determineResultOfLoadingRequest_inMainFrame_userInitiated_completionHandler___block_invoke;
      v20[3] = &unk_1E6D7D440;
      id v21 = v9;
      id v18 = v19;
      id v22 = v18;
      char v23 = v15;
      [v16 determineResultOfLoadingRequest:v21 isMainFrame:a3 disallowRedirectToExternalApps:v14 preferredApplicationBundleIdentifier:v17 redirectDecisionHandler:v20 completionHandler:v10];
    }
  }
}

uint64_t __92__TabDocument__determineResultOfLoadingRequest_inMainFrame_userInitiated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  int v5 = [*(id *)(a1 + 32) URL];
  uint64_t v6 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  return v6;
}

- (id)resultOfLoadingURL:(id)a3
{
  int v4 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", a3);
  int v5 = -[TabDocument _resultOfLoadingRequest:inMainFrame:userInitiated:](self, v4, 1, 0);

  return v5;
}

- (void)_showFinanceKitOrderPreviewControllerWithURL:(void *)a3 dismissalHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    uint64_t v14 = 0;
    char v15 = &v14;
    uint64_t v16 = 0x2050000000;
    uint64_t v7 = (void *)getFKSaveOrderClass(void)::softClass;
    uint64_t v17 = getFKSaveOrderClass(void)::softClass;
    if (!getFKSaveOrderClass(void)::softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = ___ZL19getFKSaveOrderClassv_block_invoke;
      v13[3] = &unk_1E6D79088;
      void v13[4] = &v14;
      ___ZL19getFKSaveOrderClassv_block_invoke((uint64_t)v13);
      uint64_t v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke;
    v9[3] = &unk_1E6D7D468;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [v8 saveOrderAtURL:v5 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_272;
    block[3] = &unk_1E6D79768;
    objc_copyWeak(v8, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v8);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_272(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained pageLoadErrorController];
  uint64_t v2 = _WBSLocalizedString();
  id v3 = _WBSLocalizedString();
  [v1 addAlertWithTitle:v2 bodyText:v3];
}

- (void)_showPassBookControllerForPasses:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    id v3 = (void *)[objc_alloc((Class)getPKAddPassesViewControllerClass()) initWithPasses:v5 fromPresentationSource:0];
    [v3 setDelegate:a1];
    if (v3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
      [WeakRetained tabDocument:a1 presentViewControllerAnimated:v3];
    }
  }
}

- (BOOL)_showICSControllerForPath:(void *)a3 sourceURL:(void *)a4 beforeDismissHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F3AFA8]) initWithFilePath:v7 sourceURL:v8];
    id v11 = v10;
    BOOL v12 = v10 != 0;
    if (v10)
    {
      [v10 setModalPresentationStyle:2];
      [v11 setBeforeDismissHandler:v9];
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
      [WeakRetained tabDocument:a1 presentViewControllerAnimated:v11];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)showDownload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 completedFileURL];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __28__TabDocument_showDownload___block_invoke;
    v7[3] = &unk_1E6D79970;
    void v7[4] = self;
    id v8 = v4;
    id v9 = v5;
    objc_msgSend(v9, "safari_accessingSecurityScopedResource:", v7);
  }
  else
  {
    uint64_t v6 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[TabDocument showDownload:]();
    }
    -[TabDocument _showDownload:path:]((uint64_t)self, v4, 0);
  }
}

void __28__TabDocument_showDownload___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) path];
  -[TabDocument _showDownload:path:](v1, v2, v3);
}

- (void)_showDownload:(void *)a3 path:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [v5 fileType];
    id v8 = [v5 sourceURL];
    id v9 = [v5 userInitiatedAction];
    char v10 = [v9 isConsumed];

    if ((v10 & 1) == 0)
    {
      id v11 = [v5 userInitiatedAction];
      [v11 consume];
    }
    *(unsigned char *)(a1 + 700) = 1;
    if (v7 == 2) {
      goto LABEL_55;
    }
    if (v7 == 6)
    {
      uint64_t v47 = 0;
      uint64_t v48 = &v47;
      uint64_t v49 = 0x2050000000;
      BOOL v12 = (void *)getCLKWatchFaceLibraryClass(void)::softClass;
      uint64_t v50 = getCLKWatchFaceLibraryClass(void)::softClass;
      if (!getCLKWatchFaceLibraryClass(void)::softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        uint64_t v52 = 3221225472;
        __int16 v53 = ___ZL27getCLKWatchFaceLibraryClassv_block_invoke;
        uint64_t v54 = &unk_1E6D79088;
        uint64_t v55 = &v47;
        ___ZL27getCLKWatchFaceLibraryClassv_block_invoke((uint64_t)buf);
        BOOL v12 = (void *)v48[3];
      }
      unsigned int v13 = v12;
      _Block_object_dispose(&v47, 8);
      id v14 = objc_alloc_init(v13);
      char v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __34__TabDocument__showDownload_path___block_invoke;
      v46[3] = &unk_1E6D7D490;
      v46[4] = a1;
      [v14 _addWatchFaceAtURL:v15 shouldValidate:0 completionHandler:v46];

LABEL_55:
      goto LABEL_56;
    }
    objc_initWeak(&location, (id)a1);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __34__TabDocument__showDownload_path___block_invoke_281;
    v43[3] = &unk_1E6D79768;
    objc_copyWeak(&v44, &location);
    uint64_t v16 = (void (**)(void))MEMORY[0x1E4E42950](v43);
    switch(v7)
    {
      case 3:
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6 isDirectory:0];
        uint64_t v18 = [v5 uti];
        uint64_t v36 = (void *)v18;
        if (v18
          && ([MEMORY[0x1E4F442D8] typeWithIdentifier:v18],
              (id v19 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v37 = v19;
          if ([v19 conformsToType:*MEMORY[0x1E4F44580]])
          {
            uint64_t v47 = 0;
            uint64_t v48 = &v47;
            uint64_t v49 = 0x2050000000;
            id v20 = (void *)getPKPassesXPCContainerClass(void)::softClass;
            uint64_t v50 = getPKPassesXPCContainerClass(void)::softClass;
            if (!getPKPassesXPCContainerClass(void)::softClass)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              uint64_t v52 = 3221225472;
              __int16 v53 = ___ZL28getPKPassesXPCContainerClassv_block_invoke;
              uint64_t v54 = &unk_1E6D79088;
              uint64_t v55 = &v47;
              ___ZL28getPKPassesXPCContainerClassv_block_invoke((uint64_t)buf);
              id v20 = (void *)v48[3];
            }
            id v21 = v20;
            _Block_object_dispose(&v47, 8);
            id v22 = (void *)[[v21 alloc] initWithFileURL:v38];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __34__TabDocument__showDownload_path___block_invoke_2;
            v40[3] = &unk_1E6D7D4B8;
            id v41 = v17;
            [v22 unarchivePassesWithBlock:v40];
            id v23 = 0;
            char v24 = v41;
LABEL_39:

            if (![v17 count] || v23)
            {
              char v34 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v23, "safari_privacyPreservingDescription");
                objc_claimAutoreleasedReturnValue();
                -[TabDocument _showDownload:path:]();
              }

              [*(id *)(a1 + 1272) addDownloadFailedAlertWithDescription:0];
              v16[2](v16);
            }
            else
            {
              uint64_t v33 = WBS_LOG_CHANNEL_PREFIXDownloads();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1E102C000, v33, OS_LOG_TYPE_INFO, "PassBook passes download succeeded, showing passbook adding passes view controller.", buf, 2u);
              }
              -[TabDocument _showPassBookControllerForPasses:](a1, v17);
            }
            if (([v5 explicitlySaved] & 1) == 0) {
              [v5 removeFromDisk];
            }

            goto LABEL_53;
          }
        }
        else
        {
          id v37 = 0;
        }
        id v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v38];
        uint64_t v47 = 0;
        uint64_t v48 = &v47;
        uint64_t v49 = 0x2050000000;
        __int16 v31 = (void *)getPKPassClass(void)::softClass;
        uint64_t v50 = getPKPassClass(void)::softClass;
        if (!getPKPassClass(void)::softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v52 = 3221225472;
          __int16 v53 = ___ZL14getPKPassClassv_block_invoke;
          uint64_t v54 = &unk_1E6D79088;
          uint64_t v55 = &v47;
          ___ZL14getPKPassClassv_block_invoke((uint64_t)buf);
          __int16 v31 = (void *)v48[3];
        }
        id v32 = v31;
        _Block_object_dispose(&v47, 8);
        id v42 = 0;
        char v24 = (void *)[v32 createWithData:v22 warnings:0 error:&v42];
        id v23 = v42;
        if (v24) {
          [v17 addObject:v24];
        }
        goto LABEL_39;
      case 4:
        if (v6 && -[TabDocument _showICSControllerForPath:sourceURL:beforeDismissHandler:](a1, v6, v8, v16)) {
          goto LABEL_54;
        }
        char v25 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[TabDocument _showDownload:path:]();
        }
        goto LABEL_20;
      case 5:
        int v26 = [v5 explicitlySaved];
        if (v6
          && (id v23 = (id)[objc_alloc(MEMORY[0x1E4F3AF40]) initWithFilePath:v6 sourceURL:v8 deleteFileWhenDone:v26 ^ 1u beforeDismissHandler:v16]) != 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
          [WeakRetained tabDocument:a1 presentViewControllerAnimated:v23];

LABEL_53:
        }
        else
        {
          if ((v26 & 1) == 0) {
            [v5 removeFromDisk];
          }
LABEL_20:
          [*(id *)(a1 + 1272) addDownloadFailedAlertWithDescription:0];
        }
LABEL_54:

        objc_destroyWeak(&v44);
        objc_destroyWeak(&location);
        goto LABEL_55;
      case 7:
        id v23 = (id)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6 isDirectory:0];
        -[TabDocument _showFinanceKitOrderPreviewControllerWithURL:dismissalHandler:]((void *)a1, v23, v16);
        if (([v5 explicitlySaved] & 1) == 0) {
          [v5 removeFromDisk];
        }
        goto LABEL_53;
      default:
        id v23 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v6];
        if (([v5 explicitlySaved] & 1) == 0) {
          [v5 removeFromDisk];
        }
        if (v23)
        {
          char v28 = [MEMORY[0x1E4F74230] sharedConnection];
          __int16 v29 = [v6 lastPathComponent];
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __34__TabDocument__showDownload_path___block_invoke_288;
          v39[3] = &unk_1E6D7D4E0;
          v39[4] = a1;
          [v28 queueFileDataForAcceptance:v23 originalFileName:v29 forBundleID:0 completion:v39];

          long long v30 = [(id)a1 URL];
          LODWORD(v28) = v30 == 0;

          if (v28) {
            [(id)a1 _closeTabDocumentAnimated:0];
          }
        }
        else
        {
          id v35 = WBS_LOG_CHANNEL_PREFIXDownloads();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[TabDocument _showDownload:path:]();
          }
          [*(id *)(a1 + 1272) addInvalidProfileAlert];
        }
        goto LABEL_53;
    }
  }
LABEL_56:
}

void __34__TabDocument__showDownload_path___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __34__TabDocument__showDownload_path___block_invoke_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      [*(id *)(v5 + 1272) addDownloadFailedAlertWithDescription:0];
    }
  }
}

void __34__TabDocument__showDownload_path___block_invoke_281(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained URL];
  if (v1)
  {
  }
  else if (([WeakRetained isClosed] & 1) == 0)
  {
    [WeakRetained _closeTabDocumentAnimated:0];
  }
}

void __34__TabDocument__showDownload_path___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __34__TabDocument__showDownload_path___block_invoke_288(uint64_t a1, uint64_t a2, void *a3)
{
  block[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __34__TabDocument__showDownload_path___block_invoke_288_cold_1();
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__TabDocument__showDownload_path___block_invoke_289;
    block[3] = &unk_1E6D79060;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __34__TabDocument__showDownload_path___block_invoke_289(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1272) addInvalidProfileAlert];
}

- (uint64_t)_canShowDownloadWithoutPrompting:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 fileType] == 1
      || [v4 fileType] == 6
      || (id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216)),
          char v6 = [WeakRetained tabDocument:a1 canShowDownload:v4],
          WeakRetained,
          (v6 & 1) == 0))
    {
      a1 = 0;
    }
    else
    {
      uint64_t v7 = [v4 userInitiatedAction];
      id v8 = v7;
      if (v7)
      {
        if (v7 == *(void **)(a1 + 400)) {
          a1 = [v7 isConsumed] ^ 1;
        }
        else {
          a1 = 0;
        }
      }
      else
      {
        a1 = *(unsigned char *)(a1 + 700) == 0;
      }
    }
  }

  return a1;
}

- (void)downloadDidStart:(id)a3
{
  id v4 = a3;
  if (self->_elementInfoToAnimateForNextDownload)
  {
    uint64_t v5 = (void *)*MEMORY[0x1E4FB2608];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__TabDocument_downloadDidStart___block_invoke;
    void v6[3] = &unk_1E6D79060;
    void v6[4] = self;
    [v5 _performBlockAfterCATransactionCommits:v6];
  }
  if (self->_closeWhenNextDownloadStarts)
  {
    [(TabDocument *)self _closeTabDocumentAnimated:0];
    self->_closeWhenNextDownloadStarts = 0;
  }
}

void __32__TabDocument_downloadDidStart___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) animateElement:*(void *)(*(void *)(a1 + 32) + 680) toBarItem:11];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 680);
  *(void *)(v2 + 680) = 0;
}

- (void)animateElementToDownloadsBarItemSoon:(id)a3
{
}

- (void)downloadDidFail:(id)a3
{
  id v4 = (_SFDownload *)a3;
  downloadReflectedInFluidProgress = self->_downloadReflectedInFluidProgress;
  if (self->_activeDownload == v4
    || (BOOL v6 = downloadReflectedInFluidProgress == v4, downloadReflectedInFluidProgress = v4, v6))
  {
    self->_downloadReflectedInFluidProgress = 0;
    id v8 = v4;

    activeDownload = self->_activeDownload;
    self->_activeDownload = 0;

    id v4 = v8;
  }
}

- (void)downloadDidFinish:(id)a3
{
  id v4 = (_SFDownload *)a3;
  uint64_t v5 = v4;
  if (self->_activeDownload == v4)
  {
    self->_activeDownload = 0;

    BOOL v6 = [MEMORY[0x1E4F3AF68] sharedManager];
    char v7 = [v6 shouldExcludeDownloadFromList:v5];

    if (v7)
    {
      if (-[TabDocument _canShowDownloadWithoutPrompting:]((uint64_t)self, v5))
      {
        [(TabDocument *)self showDownload:v5];
      }
      else if ([(_SFDownload *)v5 fileType] != 2)
      {
        objc_initWeak(&location, self);
        id v8 = (void *)MEMORY[0x1E4F78270];
        uint64_t v9 = [(_SFDownload *)v5 fileType];
        char v10 = [(_SFWebView *)self->_webView URL];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __33__TabDocument_downloadDidFinish___block_invoke;
        v12[3] = &unk_1E6D7D508;
        objc_copyWeak(&v14, &location);
        unsigned int v13 = v5;
        id v11 = [v8 downloadBlockedDialogWithFileType:v9 initiatingURL:v10 completionHandler:v12];

        [(SFDialogController *)self->_dialogController presentDialog:v11];
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __33__TabDocument_downloadDidFinish___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained) {
    [WeakRetained showDownload:*(void *)(a1 + 32)];
  }
  else {
    [*(id *)(a1 + 32) removeFromDisk];
  }
}

- (void)_presentDialogToAllowDownload:(uint64_t)a3 allowViewAction:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F78270];
    char v10 = [*(id *)(a1 + 1032) URL];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __79__TabDocument__presentDialogToAllowDownload_allowViewAction_completionHandler___block_invoke;
    char v15 = &unk_1E6D7D530;
    id v16 = v7;
    id v17 = v8;
    id v11 = [v9 allowDownloadDialogWithDownload:v16 initiatingURL:v10 allowViewAction:a3 completionHandler:&v12];

    objc_msgSend(*(id *)(a1 + 288), "presentDialog:", v11, v12, v13, v14, v15);
  }
}

uint64_t __79__TabDocument__presentDialogToAllowDownload_allowViewAction_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 2)
  {
    id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    uint64_t v5 = [*(id *)(a1 + 32) mimeType];
    BOOL v6 = [*(id *)(a1 + 32) uti];
    if (a2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    objc_msgSend(v4, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v5, v6, 0, v7, 0);
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  uint64_t v9 = [MEMORY[0x1E4F3AF68] sharedManager];
  if (([v7 suppressesPrompt] & 1) != 0
    || ([v9 downloads],
        char v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 containsObject:v7],
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = 1;
LABEL_4:
    v8[2](v8, v12);
    goto LABEL_5;
  }
  if ([(id)*MEMORY[0x1E4FB2608] applicationState] == 2)
  {
    uint64_t v12 = 0;
    goto LABEL_4;
  }
  if ([v9 shouldExcludeDownloadFromList:v7])
  {
    v8[2](v8, 1);
    objc_storeStrong((id *)&self->_downloadReflectedInFluidProgress, a3);
    [v7 setFluidProgressController:self->_fluidProgressController];
    [(WBSFluidProgressController *)self->_fluidProgressController startFluidProgressWithProgressStateSource:v7];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__TabDocument_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke;
    v13[3] = &unk_1E6D7D558;
    void v13[4] = self;
    id v14 = v8;
    -[TabDocument _presentDialogToAllowDownload:allowViewAction:completionHandler:]((uint64_t)self, v7, 0, v13);
  }
LABEL_5:
}

void __76__TabDocument_downloadShouldContinueAfterReceivingResponse_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 == 0);
  if (a2 != 2)
  {
    id v4 = [*(id *)(a1 + 32) committedURL];
    if (v4)
    {
    }
    else
    {
      uint64_t v5 = *(void **)(a1 + 32);
      if (!v5[155])
      {
        [v5 _closeTabDocumentAnimated:0];
      }
    }
  }
}

- (void)userDidManipulateVisibleRegion
{
}

- (void)setClosed:(BOOL)a3
{
  self->_closed = a3;
  if (a3) {
    [(_SFDownload *)self->_downloadReflectedInFluidProgress cancel];
  }
  [(TabDocument *)self setSearchableItemAttributes:0];
  -[TabDocument setMediaStateIcon:]((uint64_t)self, 0);
  -[TabDocument invalidateUserActivity]((uint64_t)self);
}

- (void)setMediaStateIcon:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = *(void *)(a1 + 504);
    if (v4 != a2 || *(unsigned char *)(a1 + 496))
    {
      if ((unint64_t)(a2 - 1) > 1)
      {
        if ((unint64_t)(v4 - 3) >= 0xFFFFFFFFFFFFFFFELL)
        {
          id v7 = +[MediaCaptureStatusBarManager sharedManager];
          [v7 recordingDocumentDidEndMediaCapture:a1];
        }
      }
      else if ((unint64_t)(v4 - 1) >= 2)
      {
        id v6 = +[MediaCaptureStatusBarManager sharedManager];
        [v6 recordingDocumentDidBeginMediaCapture:a1 audioOnly:a2 == 1];
      }
      *(void *)(a1 + 504) = a2;
      -[TabDocument _updateBarItemsWithCurrentMediaState]((id *)a1);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
      if (WeakRetained)
      {
        [WeakRetained tabDocumentDidChangeMediaState:a1 needsUpdateGlobalAudioState:*(unsigned __int8 *)(a1 + 496)];
        uint64_t v5 = [(id)a1 navigationBarItem];
        [v5 setMediaStateIcon:a2];
      }
      -[TabDocument _notifyDidUpdateTabCollectionItem]((id *)a1);
    }
  }
}

- (void)dismissAppSuggestionBanner:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained removeAppBannerFromTabDocument:self animated:1];

  storeBanner = self->_storeBanner;
  self->_storeBanner = 0;
}

- (void)setAppSuggestionBanner:(id)a3 isPinned:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setAppBannerPinnedToTop:v4 forTabDocument:self];
}

- (BOOL)shouldBlockAppSuggestionBanner:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained isPrivateBrowsingEnabled] ^ 1;

  return v4;
}

- (void)prepareToContinueUserActivity
{
  [(WBSFluidProgressController *)self->_fluidProgressController startFluidProgressWithProgressStateSource:self];
  navigationBarItem = self->_navigationBarItem;
  _WBSLocalizedString();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarItem setCustomPlaceholderText:](navigationBarItem, "setCustomPlaceholderText:");
}

- (void)didFailToContinueUserActivity
{
}

- (void)doneWaitingToContinueUserActivity
{
}

- (id)_initWithBrowserController:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 isPrivateBrowsingEnabled];
  uint64_t v9 = [v6 isControlledByAutomation];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__TabDocument__initWithBrowserController_configuration___block_invoke;
  v13[3] = &unk_1E6D791E8;
  id v14 = self;
  id v10 = v7;
  id v15 = v10;
  id v11 = -[TabDocument _initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:bookmark:browserController:createDocumentView:](v14, 0, 0, 0, v8, v9, 0, v6, v13);

  return v11;
}

void __56__TabDocument__initWithBrowserController_configuration___block_invoke(uint64_t a1)
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (WBSURLSpoofingMitigator *)a4;
  if ((void *)kTabDocumentObserverContext == a6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    if (self->_webView == v10 || self->_readerWebView == v10)
    {
      if ([v9 isEqualToString:@"loading"])
      {
        if ([(_SFWebView *)self->_webView isLoading])
        {
          self->_webViewIsLoading = 1;
          self->_shouldSuppressDialogsThatBlockWebProcessForProvisionalNavigation = 1;
          id autoFillAuthenticationCompletionBlock = self->_autoFillAuthenticationCompletionBlock;
          self->_id autoFillAuthenticationCompletionBlock = 0;

          [(_SFDownload *)self->_downloadReflectedInFluidProgress cancel];
          [(_SFDownload *)self->_downloadReflectedInFluidProgress setFluidProgressController:0];
          downloadReflectedInFluidProgress = self->_downloadReflectedInFluidProgress;
          self->_downloadReflectedInFluidProgress = 0;

          activeDownload = self->_activeDownload;
          self->_activeDownload = 0;

          [(WBSFluidProgressController *)self->_fluidProgressController startFluidProgressWithProgressStateSource:self];
          [(_SFWebView *)self->_webView estimatedProgress];
          -[TabDocument _loadingControllerEstimatedProgressChangedTo:]((uint64_t)self, v23);
          -[TabDocument _loadingControllerDidStartLoading]((uint64_t)self);
        }
        else
        {
          self->_webViewIsLoading = 0;
          [WeakRetained updateInterface];
          if (self->_didQuickStopWhileBlank)
          {
            [WeakRetained updateFavoritesForNewDocument];
            self->_didQuickStopWhileBlank = 0;
          }
        }
        [(TabDocument *)self updateAccessibilityIdentifier];
        -[TabDocument _loadingStateForWebExtensionsMayHaveChanged](self);
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"URL"])
      {
        -[TabDocument _updateNavigationBarItem]((uint64_t)self);
        [(TabDocument *)self updateTabIconWithDelay:0.1];
        [v12 tabDocumentDidUpdateURL:self];
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"estimatedProgress"])
      {
        [(_SFWebView *)self->_webView estimatedProgress];
        -[TabDocument _loadingControllerEstimatedProgressChangedTo:]((uint64_t)self, v24);
        goto LABEL_37;
      }
      if ([v9 isEqualToString:@"_networkRequestsInProgress"])
      {
        if ([(_SFWebView *)self->_webView _networkRequestsInProgress]) {
          -[TabDocument _startedLoadingResources]((id *)&self->super.isa);
        }
        else {
          -[TabDocument _stoppedLoadingResources]((id *)&self->super.isa);
        }
        goto LABEL_37;
      }
      if (([v9 isEqualToString:@"hasOnlySecureContent"] & 1) == 0
        && ([v9 isEqualToString:@"_negotiatedLegacyTLS"] & 1) == 0)
      {
        if ([v9 isEqualToString:@"title"])
        {
          [v12 tabDocumentDidUpdateTitle:self];
          [(TabDocument *)self updateTabTitle];
          goto LABEL_37;
        }
        if (([v9 isEqualToString:@"canGoBack"] & 1) == 0
          && ![v9 isEqualToString:@"canGoForward"])
        {
          if ([v9 isEqualToString:@"_webProcessIsResponsive"])
          {
            if ([(_SFWebView *)self->_webView _webProcessIsResponsive]
              && [(NSTimer *)self->_unresponsiveWebProcessTimer isValid])
            {
              [(NSTimer *)self->_unresponsiveWebProcessTimer invalidate];
              (*((void (**)(void))self->_unresponsiveWebProcessBlock + 2))();
              id unresponsiveWebProcessBlock = self->_unresponsiveWebProcessBlock;
              self->_id unresponsiveWebProcessBlock = 0;

              self->_suppressCrashBanner = 0;
            }
          }
          else if (([v9 isEqualToString:@"themeColor"] & 1) != 0 {
                 || ([v9 isEqualToString:@"underPageBackgroundColor"] & 1) != 0
          }
                 || [v9 isEqualToString:@"_sampledPageTopColor"])
          {
            [v12 tabDocumentDidUpdateThemeColor:self];
          }
          else if ([v9 isEqualToString:@"_isPlayingAudio"])
          {
            int v26 = +[Application sharedApplication];
            [v26 updateShouldLockPrivateBrowsingWithTimerIfNecessary];
          }
          goto LABEL_37;
        }
        [v12 tabDocumentDidUpdateBackForward:self];
      }
    }
    else
    {
      if (self->_URLSpoofingMitigator != v10)
      {
        uint64_t v13 = +[Application sharedApplication];
        id v14 = [v13 systemNoteTakingController];

        if (v14 == v10 && [v9 isEqualToString:*MEMORY[0x1E4F992C8]])
        {
          id v15 = +[Application sharedApplication];
          id v16 = [v15 systemNoteTakingController];
          int v17 = [v16 isNotesPIPVisible];

          uint64_t v18 = WBS_LOG_CHANNEL_PREFIXContinuity();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            id v19 = @"not visible";
            if (v17) {
              id v19 = @"visible";
            }
            int v27 = 134218242;
            char v28 = self;
            __int16 v29 = 2112;
            long long v30 = v19;
            _os_log_impl(&dword_1E102C000, v18, OS_LOG_TYPE_INFO, "TabDocument: %p Notes PIP becomes %@", (uint8_t *)&v27, 0x16u);
          }
          if (v17) {
            [(TabDocument *)self restoreAllHighlightsData];
          }
        }
        goto LABEL_37;
      }
      if (![v9 isEqualToString:@"UIShouldReflectCommittedURLInsteadOfCurrentURL"])
      {
LABEL_37:

        goto LABEL_38;
      }
    }
    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
    goto LABEL_37;
  }
LABEL_38:
}

- (void)_didFinishLoading
{
  if (a1)
  {
    -[TabDocument _loadingControllerEstimatedProgressChangedTo:](a1, 0.0);
    -[TabDocument _loadingControllerDidStopLoadingWithError:](a1, *(void **)(a1 + 32));
    uint64_t v2 = *(void **)(a1 + 1448);
    *(void *)(a1 + 1448) = 0;

    *(unsigned char *)(a1 + 701) = 0;
  }
}

- (void)_loadingControllerDidStopLoadingWithError:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v13 = v3;
    int v5 = [*(id *)(a1 + 1032) isLoading];
    if ((v5 & 1) == 0)
    {
      *(unsigned char *)(a1 + 699) = 0;
      *(unsigned char *)(a1 + 946) = 0;
    }
    *(unsigned char *)(a1 + 703) = 1;
    [(id)a1 updateTabTitle];
    -[TabDocument _updateNavigationBarItem](a1);
    if (([(id)a1 isShowingErrorPage] & 1) == 0)
    {
      uint64_t v6 = -[TabDocument pageLoadStatusForNavigationError:](a1, v13);
      id v7 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v7 didFinishPageLoadWithPageLoadStatus:v6];
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
    [WeakRetained tabDocument:a1 didFinishLoadingWithError:v13 != 0];

    id v4 = v13;
    if (v13)
    {
      [*(id *)(a1 + 1272) handleFrameLoadError:v13];
      [*(id *)(a1 + 176) cancelFluidProgressWithProgressStateSource:a1];
      if (v5)
      {
        [*(id *)(a1 + 176) startFluidProgressWithProgressStateSource:a1];
        [*(id *)(a1 + 1032) estimatedProgress];
        -[TabDocument _loadingControllerEstimatedProgressChangedTo:](a1, v9);
      }
      id v10 = objc_loadWeakRetained((id *)(a1 + 1224));
      [v10 didFailLoadingResource:a1];

      id v11 = [*(id *)(a1 + 1248) testController];
      id v12 = v11;
      if (v11) {
        [v11 autoFillController:*(void *)(a1 + 1248) didFailFormMetadataForTesting:v13];
      }

      id v4 = v13;
    }
  }
}

- (uint64_t)pageLoadStatusForNavigationError:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    if (objc_msgSend(v3, "_web_errorIsInDomain:", *MEMORY[0x1E4F289A0])
      && ([v4 code] == -999 || objc_msgSend(v4, "code") == -1012))
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = 2;
    }
  }

  return v5;
}

- (id)pdfView
{
  if ([(TabDocument *)self isPDFDocument]) {
    id v3 = self->_webView;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (void)setOverlaidAccessoryViewsInset:(CGSize)a3
{
}

- (void)_updateFallbackURLsForUserTypedAddress:(char)a3 userExplicitlyRequestedAsHTTP:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v6;

    *(unsigned char *)(a1 + 136) = a3 ^ 1;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __84__TabDocument__updateFallbackURLsForUserTypedAddress_userExplicitlyRequestedAsHTTP___block_invoke;
    v10[3] = &unk_1E6D7D580;
    void v10[4] = a1;
    objc_msgSend(MEMORY[0x1E4F1CB10], "safari_enumeratePossibleURLsForUserTypedString:withBlock:", v5, v10);
    if ((unint64_t)[*(id *)(a1 + 128) count] >= 2)
    {
      uint64_t v8 = *(void **)(a1 + 128);
      double v9 = [v8 firstObject];
      [v8 addObject:v9];
    }
  }
}

- (uint64_t)_loadNextFallbackURLWithWebClip:(void *)a3 navigation:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = [*(id *)(a1 + 128) firstObject];
    if (v6 && (-[TabDocument _trySwitchingToPinnedTabOnNavigationToURL:](a1, v6) & 1) == 0)
    {
      [*(id *)(a1 + 128) removeObjectAtIndex:0];
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v6);
      double v9 = -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:]((void *)a1, v8);

      objc_setAssociatedObject(v9, (const void *)kWebClipToNSURLRequestAssociationKey, v5, (void *)1);
      id v10 = *(void **)(a1 + 1032);
      if (v10
        && (![v10 _webProcessIsResponsive]
         || ([*(id *)(a1 + 288) presentedDialog],
             id v11 = objc_claimAutoreleasedReturnValue(),
             char v12 = [v11 completionHandlerBlocksWebProcess],
             v11,
             (v12 & 1) != 0)))
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __58__TabDocument__loadNextFallbackURLWithWebClip_navigation___block_invoke;
        v16[3] = &unk_1E6D791E8;
        v16[4] = a1;
        id v17 = v9;
        -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:](a1, 0, v16);
      }
      else
      {
        uint64_t v13 = [*(id *)(a1 + 168) loadRequest:v9 userDriven:1];
        id v14 = v13;
        if (a3) {
          *a3 = v13;
        }
      }
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __84__TabDocument__updateFallbackURLsForUserTypedAddress_userExplicitlyRequestedAsHTTP___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 128) addObject:a2];
}

id __58__TabDocument__loadNextFallbackURLWithWebClip_navigation___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 168) loadRequest:*(void *)(a1 + 40) userDriven:1];
}

- (void)stopLoadingUserInitiated
{
  BOOL isBlank = self->_isBlank;
  if (isBlank) {
    BOOL isBlank = !self->_didCommitCurrentNavigation;
  }
  self->_didQuickStopWhileBlank = isBlank;
  [(TabDocument *)self stopLoading];
}

- (void)stopLoading
{
  [(LoadingController *)self->_loadingController stopLoading];
  fluidProgressController = self->_fluidProgressController;
  [(WBSFluidProgressController *)fluidProgressController cancelFluidProgressWithProgressStateSource:self];
}

- (void)goToBackForwardListItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    self->_wasOpenedFromHistory = 1;
    self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
    id v5 = +[Application sharedApplication];
    uint64_t v6 = [v4 URL];
    [v5 checkExtendedLaunchPageLoad:v6 forTabDocument:self];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __39__TabDocument_goToBackForwardListItem___block_invoke;
    v7[3] = &unk_1E6D791E8;
    void v7[4] = self;
    id v8 = v4;
    -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v7);
  }
}

id __39__TabDocument_goToBackForwardListItem___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 1032) goToBackForwardListItem:*(void *)(a1 + 40)];
}

- (void)clearBackForwardListKeepingCurrentItem
{
  id v2 = [(_SFWebView *)self->_webView backForwardList];
  [v2 _clear];
}

- (void)clearBackForwardList
{
  id v2 = [(_SFWebView *)self->_webView backForwardList];
  [v2 _removeAllItems];
}

- (void)hibernate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "TabDocument %p is hibernating even though it has queued work to perform after terminating an unresponsive web process.", (uint8_t *)&v2, 0xCu);
}

void __26__TabDocument_unhibernate__block_invoke(uint64_t a1)
{
  int v2 = objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL");
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    [(id)v3 loadURL:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = (id)[*(id *)(v3 + 1032) _restoreSessionState:*(void *)(v3 + 56) andNavigate:1];
    -[TabDocument _loadDeferredURLIfNeeded](*(void *)(a1 + 40));
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 960));
  uint64_t v6 = [WeakRetained tabCollectionViewProvider];
  uint64_t v7 = [v6 cachedContentImageForTabWithUUID:*(void *)(*(void *)(a1 + 40) + 1336) allowScaledImage:0];

  if (v7)
  {
    [*(id *)(*(void *)(a1 + 40) + 1032) setPlaceholderImage:v7];
    [*(id *)(a1 + 40) setSuppressingProgressAnimationForNavigationGesture:1];
  }

  uint64_t v8 = *(void *)(a1 + 40);
  double v9 = *(void **)(v8 + 56);
  *(void *)(v8 + 56) = 0;
}

- (BOOL)isAlive
{
  return [(_SFWebView *)self->_webView _webProcessIdentifier] != 0;
}

- (_WKSessionState)sessionState
{
  if (self->_hibernated)
  {
    int v2 = self->_savedSessionState;
  }
  else
  {
    int v2 = [(_SFWebView *)self->_webView _sessionState];
  }
  return v2;
}

- (void)restoreSessionState:(id)a3 andNavigate:(BOOL)a4
{
}

- (void)restoreSessionState:(id)a3 andNavigate:(BOOL)a4 fromSafariViewService:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = v9;
  if (self->_hibernated)
  {
    objc_storeStrong((id *)&self->_savedSessionState, a3);
  }
  else
  {
    unint64_t v11 = 1;
    if (v5) {
      unint64_t v11 = 2;
    }
    self->_sessionStateRestorationSource = v11;
    if (v6) {
      self->_externalAppRedirectState = 4;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__TabDocument_restoreSessionState_andNavigate_fromSafariViewService___block_invoke;
    v12[3] = &unk_1E6D793C0;
    void v12[4] = self;
    id v13 = v9;
    BOOL v14 = v6;
    -[TabDocument _terminateWebProcessIfNeededAndShowCrashBanner:thenDo:]((uint64_t)self, 0, v12);
  }
}

id __69__TabDocument_restoreSessionState_andNavigate_fromSafariViewService___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 1032) _restoreSessionState:*(void *)(a1 + 40) andNavigate:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_loadQueuedNavigation:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    id v12 = v3;
    BOOL v5 = [v3 localAttributes];
    BOOL v6 = [v5 queuedNavigation];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"url"];
    uint64_t v8 = [v4 URLWithString:v7];

    id v9 = [v12 localAttributes];
    id v10 = [v9 queuedNavigation];
    unint64_t v11 = [v10 objectForKeyedSubscript:@"title"];

    [a1 loadURL:v8 title:v11 skipSyncableTabUpdates:0];
    id v3 = v12;
  }
}

- (void)restoreStateFromTab:(id)a3
{
  id v22 = a3;
  BOOL v5 = [v22 localAttributes];
  BOOL v6 = [v5 sessionStateData];

  if (v6)
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F46790]) initWithData:v6];
    if (v7)
    {
      uint64_t v8 = [v22 localAttributes];
      id v9 = [v8 queuedNavigation];
      [(TabDocument *)self restoreSessionState:v7 andNavigate:v9 == 0];
    }
    id v10 = [v22 localAttributes];
    unint64_t v11 = [v10 queuedNavigation];

    if (v11) {
      -[TabDocument _loadQueuedNavigation:](self, v22);
    }
    goto LABEL_6;
  }
  if (!self->_hibernated)
  {
    id v12 = [v22 localAttributes];
    id v13 = [v12 queuedNavigation];

    if (!v13)
    {
      uint64_t v7 = [v22 url];
      id v21 = [v22 title];
      [(TabDocument *)self loadURL:v7 title:v21 skipSyncableTabUpdates:0];

LABEL_6:
      goto LABEL_10;
    }
    -[TabDocument _loadQueuedNavigation:](self, v22);
  }
LABEL_10:
  -[TabDocument setPinned:](self, "setPinned:", [v22 isPinned]);
  BOOL v14 = [v22 pinnedTitle];
  id v15 = (NSString *)[v14 copy];
  pinnedTitle = self->_pinnedTitle;
  self->_pinnedTitle = v15;

  id v17 = [v22 pinnedURL];
  uint64_t v18 = (NSURL *)[v17 copy];
  pinnedURL = self->_pinnedURL;
  self->_pinnedURL = v18;

  objc_storeStrong((id *)&self->_tabGroupTab, a3);
  id v20 = [(WBTab *)self->_tabGroupTab uuid];
  -[TabDocument _activeParticipantsDidUpdateInTabWithUUID:]((id *)&self->super.isa, v20);
}

- (BOOL)mustShowBarsForBackForwardListItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_parentTabItem) {
    char v6 = 1;
  }
  else {
    char v6 = -[WKBackForwardListItem safari_navigationSnapshotRequiresBars](v4);
  }

  return v6;
}

- (NSURL)committedURL
{
  return (NSURL *)[(_SFWebView *)self->_webView _committedURL];
}

- (BOOL)hasFailedURL
{
  int v2 = [(_SFWebView *)self->_webView _unreachableURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)presentNextDialogIfNeeded
{
  -[TabDocument _authenticateForAutoFillIfNeeded]((uint64_t)self);
  dialogController = self->_dialogController;
  [(SFDialogController *)dialogController presentNextDialogIfNeeded];
}

- (void)_authenticateForAutoFillIfNeeded
{
  if (a1 && *(void *)(a1 + 160))
  {
    int v2 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1E102C000, v2, OS_LOG_TYPE_INFO, "Retrying AutoFill authentication", v4, 2u);
    }
    -[TabDocument _getAuthenticationForAutoFillController:withCompletion:](a1, *(void **)(a1 + 1248), *(void **)(a1 + 160));
    BOOL v3 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;
  }
}

- (void)_getAuthenticationForAutoFillController:(void *)a3 withCompletion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [v5 authenticationContext];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__TabDocument__getAuthenticationForAutoFillController_withCompletion___block_invoke;
    v8[3] = &unk_1E6D7DB18;
    id v10 = v6;
    id v9 = v5;
    [v7 authenticateForClient:v9 userInitiated:1 completion:v8];
  }
}

- (void)performAutoFillAction
{
}

- (void)performPageLevelAutoFill
{
}

- (void)sendEventsForAutoFillTelemetry
{
}

- (void)loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5
{
}

- (id)_backForwardList
{
  return (id)[(_SFWebView *)self->_webView backForwardList];
}

id __39__TabDocument__addTitlePrefixToString___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = [*(id *)(a1 + 32) simplifiedIdentifierForDisplayInTabTitle:a2];
  return v2;
}

- (NSString)customUserAgent
{
  return (NSString *)[(_SFWebView *)self->_webView _customUserAgent];
}

- (void)setCustomUserAgent:(id)a3
{
}

- (id)dataForDisplayedPDF
{
  return [(TabDocument *)self dataForQuickLookDocument:self->_quickLookDocument];
}

- (id)suggestedFilenameForDisplayedPDF
{
  return [(TabDocument *)self suggestedFileNameForQuickLookDocument:self->_quickLookDocument];
}

- (id)dataForQuickLookDocument:(id)a3
{
  BOOL v3 = [(_SFWebView *)self->_webView _dataForDisplayedPDF];
  return v3;
}

- (id)suggestedFileNameForQuickLookDocument:(id)a3
{
  BOOL v3 = [(_SFWebView *)self->_webView _sf_suggestedFilename];
  return v3;
}

- (id)suggestedFileExtensionForQuickLookDocument:(id)a3
{
  return @"pdf";
}

- (void)loadTestURL:(id)a3 withInjectedBundle:(BOOL)a4 withCallback:(id)a5
{
}

- (void)loadTestURL:(id)a3 withInjectedBundle:(BOOL)a4 withCallback:(id)a5 pagesNeedingMemoryWarningSent:(id)a6
{
  BOOL v7 = a4;
  id v17 = a5;
  id v10 = a6;
  unint64_t v11 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", a3);
  [(TabDocument *)self clearPageLoadStatistics];
  id v12 = [[PageLoadTestStatistics alloc] initWithInjectedBundle:v7 withCallback:v17];
  pageLoadStatistics = self->_pageLoadStatistics;
  self->_pageLoadStatistics = v12;

  if (!self->_pageLoadTest)
  {
    BOOL v14 = [[PageLoadTest alloc] initWithTabDocument:self pagesNeedingMemoryWarningSent:v10];
    pageLoadTest = self->_pageLoadTest;
    self->_pageLoadTest = v14;
  }
  id v16 = [(TabDocument *)self loadRequest:v11 userDriven:0];
  [(PageLoadTestStatistics *)self->_pageLoadStatistics setNavigation:v16];
}

- (_SFSafariSharingExtensionController)sharingExtensionController
{
  sharingExtensionController = self->_sharingExtensionController;
  if (!sharingExtensionController)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F3B050]);
    id v5 = [(TabDocument *)self webView];
    id v6 = (_SFSafariSharingExtensionController *)[v4 initWithWebView:v5];
    BOOL v7 = self->_sharingExtensionController;
    self->_sharingExtensionController = v6;

    sharingExtensionController = self->_sharingExtensionController;
  }
  return sharingExtensionController;
}

- (void)saveWebArchiveToPath:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  webView = self->_webView;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__TabDocument_saveWebArchiveToPath_completion___block_invoke;
  v11[3] = &unk_1E6D7D5D0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(_SFWebView *)webView _getWebArchiveDataWithCompletionHandler:v11];
}

void __47__TabDocument_saveWebArchiveToPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || ![v5 length])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = *(id *)(a1 + 32);
    if (([v7 hasSuffix:@".webarchive"] & 1) == 0)
    {
      uint64_t v8 = [*(id *)(a1 + 32) stringByAppendingString:@".webarchive"];

      id v7 = (id)v8;
    }
    id v9 = 0;
    [v5 writeToFile:v7 options:0x40000000 error:&v9];
    id v6 = v9;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)setSourceApplicationBundleIdentifierForNextCommit:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  sourceApplicationBundleIdentifierForNextCommit = self->_sourceApplicationBundleIdentifierForNextCommit;
  self->_sourceApplicationBundleIdentifierForNextCommit = v4;

  if (v6) {
    self->_sourceApplicationIsValid = 1;
  }
}

- (void)invalidateSourceApplication
{
  self->_sourceApplicationIsValid = 0;
}

- (NSUUID)ownerUUID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v3 = [WeakRetained UUID];

  return (NSUUID *)v3;
}

- (SFTabStateData)tabStateData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F783E0]);
  id v4 = [(TabDocument *)self URLForStatePersisting];
  uint64_t v5 = objc_msgSend(v4, "safari_originalDataAsString");
  id v6 = (void *)v5;
  id v7 = &stru_1F3C268E8;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  uint64_t v8 = v7;

  id v9 = [(TabDocument *)self uuid];
  id v10 = [v9 UUIDString];
  [v3 setUUIDString:v10];

  unint64_t v11 = -[TabDocument _titleForStatePersistingForTabStateData]((id *)&self->super.isa);
  [v3 setTitle:v11];

  [v3 setUrl:v8];
  if (self->_hasDeferredNavigation)
  {
    [v3 setUserVisibleURL:v8];
    [v3 setLastViewedTime:-1.0];
    [v3 setReadingListBookmarkID:0];
    [v3 setShowingReader:0];
    [v3 setReaderViewTopScrollOffset:0];
    [v3 setDisplayingStandaloneImage:0];
    BOOL v12 = 0;
  }
  else
  {
    int v13 = [v4 isFileURL];
    BOOL v14 = v8;
    if (v13)
    {
      BOOL v14 = [(TabDocument *)self URLString];
    }
    [v3 setUserVisibleURL:v14];
    if (v13) {

    }
    [(TabDocument *)self lastViewedTime];
    objc_msgSend(v3, "setLastViewedTime:");
    objc_msgSend(v3, "setReadingListBookmarkID:", -[TabDocument readingListBookmarkID](self, "readingListBookmarkID"));
    if (self->_hibernated) {
      BOOL v15 = [(TabDocument *)self shouldRestoreReader];
    }
    else {
      BOOL v15 = [(TabDocument *)self isShowingReader];
    }
    [v3 setShowingReader:v15];
    objc_msgSend(v3, "setReaderViewTopScrollOffset:", -[TabDocument readerViewTopScrollOffset](self, "readerViewTopScrollOffset"));
    objc_msgSend(v3, "setDisplayingStandaloneImage:", -[TabDocument isDisplayingStandaloneImage](self, "isDisplayingStandaloneImage"));
    BOOL v12 = [(TabDocument *)self wasOpenedFromLink];
  }
  [v3 setWasOpenedFromLink:v12];
  objc_msgSend(v3, "setPrivateBrowsing:", -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));
  id v16 = -[TabDocument _sessionStateWithoutParentItem]((id *)&self->super.isa);
  id v17 = [v16 data];
  [v3 setSessionStateData:v17];

  uint64_t v18 = [(TabDocument *)self ownerUUID];
  id v19 = [v18 UUIDString];
  [v3 setOwningBrowserWindowUUIDString:v19];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v3, "setOrderIndex:", objc_msgSend(WeakRetained, "orderIndexForTab:", self));

  if ([(TabDocument *)self isHibernated]) {
    uint64_t v21 = [(TabDocument *)self persistWhenHibernated] ^ 1;
  }
  else {
    uint64_t v21 = 0;
  }
  [v3 setSkipUpdate:v21];
  id v22 = [v3 sessionStateData];
  objc_msgSend(v3, "setUncompressedSessionStateDataSize:", objc_msgSend(v22, "length"));

  double v23 = [(TabDocument *)self tabGroupTab];
  double v24 = [v23 tabGroupUUID];
  [v3 setTabGroupUUID:v24];

  char v25 = -[TabDocument profileIdentifier]((uint64_t)self);
  [v3 setProfileIdentifier:v25];

  [(TabDocument *)self setPersistWhenHibernated:0];
  return (SFTabStateData *)v3;
}

- (int64_t)pageStatus
{
  if ([(TabDocument *)self isShowingErrorPage]) {
    return 2;
  }
  else {
    return 1;
  }
}

void __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke_2;
  void v6[3] = &unk_1E6D7D5F8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __109__TabDocument__openAppLinkInApp_fromOriginalRequest_updateAppLinkStrategy_webBrowserState_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void (***)(void, void))(v2 + 40);
  if (v3)
  {
    v3[2](v3, *(void *)(a1 + 32));
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    id v3 = *(void (***)(void, void))(v2 + 40);
  }
  *(void *)(v2 + 40) = 0;
}

- (void)_checkForAppLinkWithCompletion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 1032) URL];
    if (objc_msgSend(v4, "safari_isHTTPFamilyURL")
      && ![(id)a1 isShowingErrorPage])
    {
      id v6 = [*(id *)(a1 + 1032) backForwardList];
      uint64_t v7 = [v6 currentItem];
      uint64_t v8 = *(void **)(a1 + 320);
      *(void *)(a1 + 320) = v7;

      char v9 = *(unsigned char *)(a1 + 926);
      id v10 = *(id *)(a1 + 1184);
      unint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:v4];
      objc_initWeak(&location, (id)a1);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__TabDocument__checkForAppLinkWithCompletion___block_invoke;
      v14[3] = &unk_1E6D7D698;
      id v12 = v11;
      id v15 = v12;
      objc_copyWeak(&v18, &location);
      id v17 = v3;
      id v13 = v10;
      id v16 = v13;
      char v19 = v9;
      [v12 decideOpenStrategyWithCompletionHandler:v14];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v5 = *(void **)(a1 + 320);
      *(void *)(a1 + 320) = 0;

      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
}

void __46__TabDocument__checkForAppLinkWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) synchronousTargetApplicationProxy];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_2;
  block[3] = &unk_1E6D7D670;
  objc_copyWeak(v12, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 48);
  v12[1] = a2;
  id v11 = v5;
  id v8 = v4;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v13 = *(unsigned char *)(a1 + 64);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
}

void __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_2(uint64_t a1)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = (uint64_t)WeakRetained;
  if (WeakRetained
    && ([WeakRetained[129] backForwardList],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 currentItem],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = *(void **)(v4 + 320),
        v6,
        v5,
        v6 == v7))
  {
    uint64_t v8 = *(void *)(a1 + 72);
    if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers))
    {
      uint64_t v17 = *MEMORY[0x1E4F98088];
      v25[0] = *MEMORY[0x1E4F980B0];
      v25[1] = v17;
      _ZZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      __cxa_guard_release(&_ZGVZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers);
    }
    if ((unint64_t)(v8 - 1) > 2
      || (uint64_t v9 = _ZZZZ46__TabDocument__checkForAppLinkWithCompletion__EUb_EUb0_E24systemServiceIdentifiers,
          [*(id *)(a1 + 32) bundleIdentifier],
          id v10 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v9) = [(id)v9 containsObject:v10],
          v10,
          (v9 & 1) != 0))
    {
      id v11 = *(id *)(v4 + 352);
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F781C0]);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      id v20 = __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_3;
      uint64_t v21 = &unk_1E6D7D648;
      objc_copyWeak(&v24, v2);
      id v23 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 48);
      id v11 = (id)[v12 initWithAppLink:v13 openActionHandler:&v18];
      objc_msgSend(v11, "setInitiallyBehindNavigationBar:", *(unsigned char *)(a1 + 80) == 0, v18, v19, v20, v21);

      objc_destroyWeak(&v24);
    }
    BOOL v14 = *(void **)(v4 + 320);
    *(void *)(v4 + 320) = 0;

    id v15 = objc_loadWeakRetained((id *)(v4 + 1216));
    id v16 = v15;
    if (v11)
    {
      -[TabDocument _setAppBannerWhenPainted:](v4, v11);
    }
    else if (*(unsigned char *)(v4 + 927) && ([v15 tabDocumentShouldDeferAppBannerRemoval:v4] & 1) == 0)
    {
      [v16 removeAppBannerFromTabDocument:v4 animated:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __46__TabDocument__checkForAppLinkWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FA6E90]];
    if (*(void *)(a1 + 32) && WeakRetained[711]) {
      objc_msgSend(v4, "setObject:forKeyedSubscript:");
    }
    id v5 = [v6 appLink];
    [v5 openExternallyWithWebBrowserState:v4 referrerURL:0 completionHandler:0];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)_contentBlockerStatisticsStore
{
  if (a1)
  {
    uint64_t v1 = (uint64_t)a1;
    char v2 = [a1 isPrivateBrowsingEnabled];
    id v3 = *(void **)(v1 + 632);
    if (v2)
    {
      if (!v3)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F98A68]);
        id v5 = *(void **)(v1 + 632);
        *(void *)(v1 + 632) = v4;
LABEL_7:

        id v3 = *(void **)(v1 + 632);
      }
    }
    else if (!v3)
    {
      id v6 = (void *)MEMORY[0x1E4F98A70];
      id v5 = -[TabDocument profileIdentifier](v1);
      uint64_t v7 = [v6 storeForProfileWithIdentifier:v5];
      uint64_t v8 = *(void **)(v1 + 632);
      *(void *)(v1 + 632) = v7;

      goto LABEL_7;
    }
    a1 = v3;
  }
  return a1;
}

- (BOOL)queryParameterFilteringDataQueueShouldMergePendingData:(id)a3
{
  return self->_didCommitCurrentNavigation;
}

- (void)_displayAttributionBannerForHighlight:(unsigned __int8 *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F782A8]) initWithHighlight:v3];
    id v5 = [v3 identifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__TabDocument__displayAttributionBannerForHighlight___block_invoke;
    v9[3] = &unk_1E6D7D6C0;
    objc_copyWeak(&v11, &location);
    id v6 = v5;
    id v10 = v6;
    [v4 setCloseActionHandler:v9];
    [v4 setInitiallyBehindNavigationBar:a1[926]];
    -[TabDocument _setAppBannerWhenPainted:]((uint64_t)a1, v4);
    uint64_t v7 = +[Application sharedApplication];
    uint64_t v8 = [v7 highlightManager];
    [v8 setPresenter:a1 forHighlightIdentifier:v6];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __53__TabDocument__displayAttributionBannerForHighlight___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained hideBannerForHighlightIdentifier:*(void *)(a1 + 32)];
    id v3 = [MEMORY[0x1E4F782B0] sharedTracker];
    [v3 blockBannerForHighlight:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)_checkForHighlight
{
  if (!a1 || ([(id)a1 isPrivateBrowsingEnabled] & 1) != 0) {
    return;
  }
  id v12 = [*(id *)(a1 + 1032) URL];
  char v2 = +[Application sharedApplication];
  id v3 = [v2 highlightManager];

  if (!objc_msgSend(v12, "safari_isHTTPFamilyURL")
    || ([(id)a1 isShowingErrorPage] & 1) != 0)
  {
    goto LABEL_6;
  }
  id v5 = [v3 highlights];
  if ([v5 count])
  {
  }
  else
  {
    char v6 = [v3 isFetchingHighlights];

    if ((v6 & 1) == 0)
    {
LABEL_6:
      id v4 = *(void **)(a1 + 328);
      *(void *)(a1 + 328) = 0;
      goto LABEL_7;
    }
  }
  uint64_t v7 = [*(id *)(a1 + 1032) backForwardList];
  uint64_t v8 = [v7 currentItem];
  id v4 = objc_msgSend(v8, "safari_highlight");

  if (v4)
  {
    -[TabDocument _displayAttributionBannerForHighlight:]((unsigned __int8 *)a1, v4);
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 1032) backForwardList];
    uint64_t v10 = [v9 currentItem];
    id v11 = *(void **)(a1 + 328);
    *(void *)(a1 + 328) = v10;

    [v3 updateHighlightForAttributionPresenter:a1];
  }
LABEL_7:
}

- (NSURL)attributionPresenterURL
{
  return (NSURL *)[(_SFWebView *)self->_webView URL];
}

- (void)displayAttributionBannerForHighlightIfNeeded:(id)a3
{
  id v4 = a3;
  if (![(TabDocument *)self isPrivateBrowsingEnabled])
  {
    id v5 = [(_SFWebView *)self->_webView backForwardList];
    char v6 = [v5 currentItem];
    backForwardListItemForCurrentHighlightBannerCheck = self->_backForwardListItemForCurrentHighlightBannerCheck;

    if (v6 == backForwardListItemForCurrentHighlightBannerCheck)
    {
      if (!v4 || (self->_appBanner || self->_appBannerPendingFirstPaint) && !self->_appBannerRemovalWasDeferred)
      {
        id v11 = self->_backForwardListItemForCurrentHighlightBannerCheck;
        self->_backForwardListItemForCurrentHighlightBannerCheck = 0;
      }
      else
      {
        objc_initWeak(&location, self);
        uint64_t v8 = [v4 identifier];
        uint64_t v9 = [MEMORY[0x1E4F782B0] sharedTracker];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        id v12[2] = __60__TabDocument_displayAttributionBannerForHighlightIfNeeded___block_invoke;
        v12[3] = &unk_1E6D7D6E8;
        objc_copyWeak(&v15, &location);
        id v10 = v8;
        id v13 = v10;
        id v14 = v4;
        [v9 isBannerBlockedForHighlight:v10 completion:v12];

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __60__TabDocument_displayAttributionBannerForHighlightIfNeeded___block_invoke(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    char v6 = [WeakRetained[129] backForwardList];
    id v7 = [v6 currentItem];
    id v8 = v5[41];

    if (v7 == v8)
    {
      id v9 = v5[41];
      v5[41] = 0;

      if (a2)
      {
        id v10 = WBS_LOG_CHANNEL_PREFIXInterstellar();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          int v15 = 138543362;
          uint64_t v16 = v11;
          _os_log_impl(&dword_1E102C000, v10, OS_LOG_TYPE_INFO, "Highlight <%{public}@> is in banner block list.", (uint8_t *)&v15, 0xCu);
        }
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 40);
        id v13 = [v5[129] backForwardList];
        id v14 = [v13 currentItem];
        objc_msgSend(v14, "safari_setHighlight:", v12);

        -[TabDocument _displayAttributionBannerForHighlight:]((unsigned __int8 *)v5, *(void **)(a1 + 40));
      }
    }
  }
}

- (WKBackForwardListItem)currentBackForwardListItem
{
  char v2 = [(_SFWebView *)self->_webView backForwardList];
  id v3 = [v2 currentItem];

  return (WKBackForwardListItem *)v3;
}

- (void)hideBannerForHighlightIdentifier:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(SFPinnableBanner *)self->_appBanner highlight];
    id v5 = [v4 identifier];
    char v6 = [v11 isEqualToString:v5];

    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained removeAppBannerFromTabDocument:self animated:1];

      appBanner = self->_appBanner;
      self->_appBanner = 0;

      id v9 = [(_SFWebView *)self->_webView backForwardList];
      id v10 = [v9 currentItem];
      objc_msgSend(v10, "safari_setHighlight:", 0);
    }
  }
}

- (void)_webView:(id)a3 mouseDidMoveOverElement:(id)a4 withFlags:(int64_t)a5 userInfo:(id)a6
{
  id v21 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      id v13 = [WeakRetained rootViewController];
      id v14 = [v13 statusBarView];

      int v15 = objc_msgSend(v11, "safari_URLForKey:", *MEMORY[0x1E4F3B188]);
      uint64_t v16 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F3B178]];
      uint64_t v17 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F3B180]];
      id v18 = objc_alloc(MEMORY[0x1E4F782C8]);
      uint64_t v19 = [(TabDocument *)self URL];
      id v20 = (void *)[v18 initWithHoveredLinkURL:v15 forCurrentURL:v19 modifierFlags:a5 frame:v16 targetFrame:v17];
      [v14 setStatusMessage:v20];
    }
  }
}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabDocument:self dismissViewControllerAnimated:v5];

  id v7 = [(TabDocument *)self URL];
  if (v7)
  {
  }
  else if (![(TabDocument *)self isClosed])
  {
    [(TabDocument *)self _closeTabDocumentAnimated:0];
  }
}

- (void)_webView:(id)a3 storeAppHighlight:(id)a4 inNewGroup:(BOOL)a5 requestOriginatedInApp:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v20 = a3;
  id v10 = a4;
  id v11 = +[Application sharedApplication];
  uint64_t v12 = [v11 systemNoteTakingController];

  id v13 = objc_alloc(MEMORY[0x1E4F22488]);
  id v14 = (void *)[v13 initWithActivityType:*MEMORY[0x1E4F28AC0]];
  int v15 = [(NSUserActivity *)self->_userActivity title];
  [v14 setTitle:v15];

  uint64_t v16 = [(NSUserActivity *)self->_userActivity webpageURL];
  [v14 setWebpageURL:v16];

  uint64_t v17 = [v10 highlight];
  id v18 = [v10 text];
  uint64_t v19 = [v10 image];
  [v12 saveHighlightsData:v17 selectedText:v18 selectedImage:v19 newGroup:v7 originatedInApp:v6 webView:v20 userActivity:v14];
}

- (void)sfWebViewDidBecomeFirstResponder:(id)a3
{
}

- (void)sfWebViewDidStartFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 1;
}

- (void)sfWebViewDidEndFormControlInteraction:(id)a3
{
  self->_hasFormControlInteraction = 0;
}

- (void)sfWebViewDidDismissFindOnPage:(id)a3
{
  if ([(TabDocument *)self isPrivateBrowsingEnabled])
  {
    uint64_t v4 = persistedFindInteractionSearchText;
    id v5 = [(_SFWebView *)self->_webView findInteraction];
    if (v4) {
      BOOL v6 = (__CFString *)v4;
    }
    else {
      BOOL v6 = &stru_1F3C268E8;
    }
    id v11 = v5;
    [v5 setSearchText:v6];

    [MEMORY[0x1E4FB1770] _setGlobalFindBuffer:persistedFindInteractionSearchText];
    BOOL v7 = (void *)MEMORY[0x1E4F466F0];
    if (persistedFindInteractionSearchText) {
      id v8 = (__CFString *)persistedFindInteractionSearchText;
    }
    else {
      id v8 = &stru_1F3C268E8;
    }
    [v7 _setStringForFind:v8];
  }
  else
  {
    id v12 = [(_SFWebView *)self->_webView findInteraction];
    uint64_t v9 = [v12 searchText];
    id v10 = (void *)persistedFindInteractionSearchText;
    persistedFindInteractionSearchText = v9;
  }
}

- (id)sfWebView:(id)a3 didStartDownload:(id)a4
{
  id v5 = a4;
  BOOL v6 = [MEMORY[0x1E4F3AF60] sharedDownloadDispatcher];
  BOOL v7 = [v6 downloadFromWKDownload:v5 userInitiatedAction:self->_lastUserInitiatedAction];
  id v8 = [MEMORY[0x1E4F3AF68] sharedManager];
  [v7 setDelegate:v8];
  [v8 deferAddingDownloadWhenStarted:v7];
  objc_storeStrong((id *)&self->_activeDownload, v7);

  return v7;
}

- (id)overrideUndoManagerForSFWebView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained overridesUndoManagerForClosedTabs])
  {
    uint64_t v4 = [WeakRetained tabController];
    id v5 = [v4 undoManager];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)sfWebViewShouldFillStringForFind:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained tabDocumentShouldFillStringForFind:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)sfWebViewCanFindNextOrPrevious:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained tabDocumentCanFindNextOrPrevious:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)statusBarIndicatorTappedWithCompletionHandler:(id)a3
{
  char v5 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained tabDocumentShouldBecomeActive:self];

  v5[2]();
}

- (BOOL)canOverrideStatusBar
{
  char v2 = self;
  id v3 = [(TabDocument *)self browserController];
  uint64_t v4 = [v3 tabCollectionViewProvider];
  char v5 = [v4 tabThumbnailCollectionView];

  int v6 = [v2 isActive];
  if (v6)
  {
    char v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    if ([v2 applicationState] != 2)
    {
      BOOL v8 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  id v7 = v5;
  BOOL v8 = [v7 presentationState] != 1 && objc_msgSend(v7, "presentationState") != 2;

  if (v6) {
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (BOOL)audioOnly
{
  return self->_cachedMediaStateIcon == 1;
}

- (void)muteMediaCapture
{
  [(TabDocument *)self mediaStateIcon];
  if ((_SFMediaStateIconIsMuted() & 1) == 0)
  {
    webView = self->_webView;
    [(_SFWebView *)webView _setPageMuted:2];
  }
}

- (void)toggleMediaStateMuted
{
  webView = self->_webView;
  [(TabDocument *)self mediaStateIcon];
  if (_SFMediaStateIconIsMuted()) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  [(_SFWebView *)webView _setPageMuted:v3];
}

- (void)mediaStateDidChangeNeedsDelay:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 480);
    uint64_t v2 = 1;
    uint64_t v3 = 4;
    if ((v1 & 8) == 0) {
      uint64_t v3 = (v1 << 61 >> 63) & 3;
    }
    if ((v1 & 1) == 0) {
      uint64_t v2 = v3;
    }
    if ((v1 & 2) != 0) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = v2;
    }
    -[TabDocument setMediaStateIcon:](a1, v4);
  }
}

- (void)addMediaSuspensionReason:(unint64_t)a3
{
  if (a3)
  {
    unint64_t mediaSuspensionReasons = self->_mediaSuspensionReasons;
    if (!mediaSuspensionReasons)
    {
      int v6 = [(TabDocument *)self webView];
      [v6 _suspendAllMediaPlayback];

      [(TabDocument *)self dismissSiriReaderMediaSessionImmediately:0];
      unint64_t mediaSuspensionReasons = self->_mediaSuspensionReasons;
    }
    self->_unint64_t mediaSuspensionReasons = mediaSuspensionReasons | a3;
  }
}

- (void)removeMediaSuspensionReason:(unint64_t)a3
{
  if (a3)
  {
    BOOL v3 = (self->_mediaSuspensionReasons & ~a3) == 0;
    self->_mediaSuspensionReasons &= ~a3;
    if (v3)
    {
      id v4 = [(TabDocument *)self webView];
      [v4 _resumeAllMediaPlayback];
    }
  }
}

- (BOOL)_handleTwoFingerTapOnLinkWithContext:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    char v5 = [v3 navigationAction];
    int v6 = [v5 request];
    id v7 = [v6 URL];

    BOOL v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v9 = [v8 BOOLForKey:*MEMORY[0x1E4F78990]];

    id v10 = (id)[WeakRetained loadURLInNewTab:v7 inBackground:v9];
    id v11 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v12 = [WeakRetained tabCollectionViewProvider];
    objc_msgSend(v11, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 5, objc_msgSend(v12, "visibleTabCollectionViewType"));

    if (v9)
    {
      id v13 = [v3 webView];
      id v14 = [v3 navigationAction];
      int v15 = [WeakRetained tabCollectionViewProvider];
      char v16 = [v15 hasTabBar];

      if ((v16 & 1) == 0)
      {
        [v14 _clickLocationInRootViewCoordinates];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __52__TabDocument__handleTwoFingerTapOnLinkWithContext___block_invoke;
        v18[3] = &unk_1E6D7D710;
        void v18[4] = a1;
        objc_msgSend(v13, "_requestActivatedElementAtPosition:completionBlock:", v18);
      }
    }
  }

  return a1 != 0;
}

uint64_t __52__TabDocument__handleTwoFingerTapOnLinkWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) animateElement:a2 toBarItem:8];
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 preferences:(id)a5 decisionHandler:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  id v14 = [v11 targetFrame];
  if (v14
    && ([v11 targetFrame],
        int v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 isMainFrame],
        v15,
        v14,
        !v16))
  {
    char v20 = 0;
  }
  else
  {
    ++self->_concurrentNavigationActionPolicyDecisions;
    uint64_t v17 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int64_t concurrentNavigationActionPolicyDecisions = self->_concurrentNavigationActionPolicyDecisions;
      *(_DWORD *)buf = 134218240;
      long long v30 = self;
      __int16 v31 = 2048;
      int64_t v32 = concurrentNavigationActionPolicyDecisions;
      _os_log_impl(&dword_1E102C000, v17, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", buf, 0x16u);
    }
    if (self->_concurrentNavigationActionPolicyDecisions >= 21)
    {
      uint64_t v19 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[TabDocument webView:decidePolicyForNavigationAction:preferences:decisionHandler:](&self->_concurrentNavigationActionPolicyDecisions, v19);
      }
      [v10 _killWebContentProcessAndResetState];
    }
    char v20 = 1;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __83__TabDocument_webView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke;
  void v23[3] = &unk_1E6D7D738;
  objc_copyWeak(&v26, &location);
  id v21 = v11;
  id v24 = v21;
  id v22 = v13;
  id v25 = v22;
  char v27 = v20;
  -[TabDocument _internalWebView:decidePolicyForNavigationAction:preferences:decisionHandler:]((uint64_t)self, v10, v21, v12, v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __83__TabDocument_webView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  -[TabDocument _didDecideNavigationPolicy:forNavigationAction:]((uint64_t)WeakRetained, a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (WeakRetained)
  {
    id v7 = [*(id *)(a1 + 32) targetFrame];
    if (v7
      && ([*(id *)(a1 + 32) targetFrame],
          BOOL v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 isMainFrame],
          v8,
          v7,
          !v9))
    {
      char v10 = 0;
    }
    else
    {
      char v10 = objc_msgSend(*(id *)(a1 + 32), "safari_shouldDonateWithPolicy:", a2);
    }
    WeakRetained[872] = v10;
    if (*(unsigned char *)(a1 + 56))
    {
      --*((void *)WeakRetained + 31);
      id v11 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *((void *)WeakRetained + 31);
        int v13 = 134218240;
        id v14 = WeakRetained;
        __int16 v15 = 2048;
        uint64_t v16 = v12;
        _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

- (void)_internalWebView:(void *)a3 decidePolicyForNavigationAction:(void *)a4 preferences:(void *)a5 decisionHandler:
{
  id v89 = a2;
  id v9 = a3;
  id v86 = a4;
  id v88 = a5;
  if (a1)
  {
    v85 = [v9 request];
    v87 = [v85 URL];
    char v10 = (void *)[v9 navigationType];
    objc_initWeak(location, (id)a1);
    if ((*(unsigned char *)(a1 + 1192) & 8) != 0 || *(unsigned char *)(a1 + 712))
    {
      id v11 = [v9 targetFrame];
      int v12 = [v11 isMainFrame];

      if (v12)
      {
        uint64_t v13 = *(void *)(a1 + 536);
        if (v13) {
          (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
        }
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke;
        v115[3] = &unk_1E6D7D760;
        objc_copyWeak(&v120, location);
        id v119 = v88;
        id v116 = v89;
        id v117 = v9;
        id v118 = v86;
        uint64_t v14 = MEMORY[0x1E4E42950](v115);
        __int16 v15 = *(void **)(a1 + 536);
        *(void *)(a1 + 536) = v14;

        objc_destroyWeak(&v120);
        goto LABEL_77;
      }
    }
    uint64_t v16 = [v9 targetFrame];
    v82 = v16;
    if (v16) {
      uint64_t v17 = [v16 isMainFrame];
    }
    else {
      uint64_t v17 = 1;
    }
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_2;
    v108[3] = &unk_1E6D7D7B0;
    objc_copyWeak(v113, location);
    id v80 = v88;
    id v112 = v80;
    id v18 = v9;
    id v109 = v18;
    char v114 = v17;
    id v19 = v87;
    id v110 = v19;
    v113[1] = v10;
    id v81 = v89;
    id v111 = v81;
    v84 = (void (**)(void, void))MEMORY[0x1E4E42950](v108);
    uint64_t v20 = [v18 _userInitiatedAction];
    id v21 = *(void **)(a1 + 400);
    *(void *)(a1 + 400) = v20;

    BOOL v22 = *(unsigned char *)(a1 + 699) || *(unsigned char *)(a1 + 923) || *(void *)(a1 + 1208) != 0;
    [*(id *)(a1 + 48) setNavigationSource:!v22];
    if ([v18 _syntheticClickType] == 2)
    {
      v83 = (void *)[objc_alloc(MEMORY[0x1E4F3B088]) initWithWebView:v81 navigationAction:v18];
      if (-[TabDocument _handleTwoFingerTapOnLinkWithContext:](a1, v83))
      {
LABEL_16:
        v84[2](v84, 0);
LABEL_76:

        objc_destroyWeak(v113);
LABEL_77:
        objc_destroyWeak(location);

        goto LABEL_78;
      }
    }
    if ((unint64_t)v10 < 2) {
      int v23 = v17;
    }
    else {
      int v23 = 0;
    }
    if (v23 == 1)
    {
      v83 = [MEMORY[0x1E4F78598] builder];
      [v83 setNavigationType:v10];
      id v24 = [v83 navigationIntentWithURL:v19];
      if ([v24 policy] == 6)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
        char v26 = [WeakRetained tabDocumentCanDownloadFile:a1];

        if (v26)
        {
          [v18 _clickLocationInRootViewCoordinates];
          double v28 = v27;
          double v30 = v29;
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_482;
          v101[3] = &unk_1E6D7D7D8;
          id v102 = v24;
          uint64_t v103 = a1;
          id v104 = v81;
          id v105 = v85;
          id v106 = v18;
          v107 = v84;
          objc_msgSend(v104, "_requestActivatedElementAtPosition:completionBlock:", v101, v28, v30);
        }
        else
        {
          v84[2](v84, 0);
        }
        goto LABEL_44;
      }
      if ([v24 policy])
      {
        if ([v24 opensInNewTab]) {
          int v31 = [v24 shouldOrderToForeground] ^ 1;
        }
        else {
          int v31 = 0;
        }
        if ([v24 policy] == 5) {
          int v32 = 1;
        }
        else {
          int v32 = v31;
        }
        if (v32 == 1)
        {
          [v18 _clickLocationInRootViewCoordinates];
          double v34 = v33;
          double v36 = v35;
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_2_483;
          v98[3] = &unk_1E6D7D800;
          id v99 = v24;
          uint64_t v100 = a1;
          objc_msgSend(v81, "_requestActivatedElementAtPosition:completionBlock:", v98, v34, v36);
        }
        else
        {
          [(id)a1 dispatchNavigationIntent:v24];
        }
        v84[2](v84, 0);
        goto LABEL_44;
      }
    }
    if (v17
      && objc_msgSend(v18, "safari_isEligibleToSpawnNewTabFromPinnedTab")
      && [(id)a1 shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:v19])
    {
      v83 = [MEMORY[0x1E4F78598] builder];
      [v83 setNavigationType:v10];
      [v83 setPrefersOpenInNewTabReusingExistingBlankTabIfPossible:1];
      id v24 = [v83 navigationIntentWithURL:v19];
      if ([v24 policy])
      {
        [(id)a1 dispatchNavigationIntent:v24];
        v84[2](v84, 0);
LABEL_44:

        goto LABEL_76;
      }
    }
    if ([v18 _isUserInitiated])
    {
      *(void *)(a1 + 1208) = 0;
      *(unsigned char *)(a1 + 945) = 0;
    }
    v83 = objc_loadWeakRetained((id *)(a1 + 960));
    if ([*(id *)(a1 + 1272) crashesSinceLastSuccessfulLoad])
    {
      id v37 = [v18 targetFrame];
      if ([v37 isMainFrame])
      {
        uint64_t v38 = [v18 targetFrame];
        id v39 = [v38 request];
        id v40 = [v39 URL];

        if (v40) {
          [v83 setShowingCrashBanner:0 animated:1];
        }
      }
      else
      {
      }
    }
    if (!v85) {
      goto LABEL_16;
    }
    int v41 = *(unsigned __int8 *)(a1 + 699);
    *(unsigned char *)(a1 + 897) = v41;
    if (v41)
    {
      if (!v17) {
        goto LABEL_63;
      }
    }
    else
    {
      *(unsigned char *)(a1 + 699) = v10 != (void *)-1;
      if (!v17) {
        goto LABEL_63;
      }
    }
    if (((objc_msgSend(v19, "safari_isHTTPFamilyURL") & 1) != 0
       || objc_msgSend(v19, "safari_hasScheme:", @"ftp"))
      && objc_msgSend(v19, "safari_hasUserOrPassword"))
    {
      v84[2](v84, 0);
      id v42 = objc_msgSend(v19, "safari_URLByDeletingUserAndPassword");
      if (v42) {
        id v43 = (id)[(id)a1 loadURL:v42 userDriven:*(unsigned __int8 *)(a1 + 699)];
      }
      goto LABEL_75;
    }
LABEL_63:
    if (objc_msgSend(v18, "safari_shouldProhibitNavigationToSafariSpecificURL")) {
      goto LABEL_16;
    }
    if (objc_msgSend(v19, "sf_isOfflineReadingListURL"))
    {
      id v44 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
      id v24 = objc_msgSend(v44, "bookmarkWithID:", objc_msgSend((id)a1, "readingListBookmarkID"));

      if (([v24 isFullArchiveAvailable] & 1) == 0)
      {
        v84[2](v84, 0);
        uint64_t v48 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v49 = [v24 address];
        uint64_t v50 = objc_msgSend(v48, "safari_URLWithDataAsString:", v49);
        id v51 = (id)[(id)a1 loadURL:v50 userDriven:*(unsigned __int8 *)(a1 + 699)];

        goto LABEL_44;
      }
    }
    if (*(void *)(a1 + 1328) && v10 != (void *)-1) {
      [(id)a1 clearTabReuseURL];
    }
    if (objc_msgSend(v18, "_sf_shouldAskAboutInsecureFormSubmission"))
    {
      id v46 = *(void **)(a1 + 1272);
      id v42 = _WBSLocalizedString();
      [v46 addFormAlertWithTitle:v42 decisionHandler:v84];
    }
    else
    {
      if (v10 != (void *)4)
      {
        int v79 = [v18 _isUserInitiated];
        if (v10) {
          int v52 = 0;
        }
        else {
          int v52 = v17;
        }
        if (v52 == 1)
        {
          __int16 v53 = +[WBSParsecDSession sharedPARSession];
          uint64_t v54 = [(id)a1 browserController];
          v77 = [v54 activeSearchEngine];

          uint64_t v55 = [v83 idOfParsecQueryOriginatingFromSearchSuggestion];
          if (v55) {
            int v56 = v79;
          }
          else {
            int v56 = 0;
          }
          if (v56 == 1)
          {
            v57 = [(id)a1 committedURL];
            if ([v77 urlIsValidSearch:v57])
            {
              char v58 = [v77 urlIsValidSearch:v19];

              if ((v58 & 1) == 0) {
                [v53 sendCBAEngagementFeedback:v19 query:v55];
              }
            }
            else
            {
            }
          }
          objc_msgSend(v83, "clearParsecQueryOriginatingFromSearchSuggestion", v77);
          v59 = [v18 targetFrame];
          v60 = -[TabDocument _readingListArchiveNextPageLinkForRequest:targetFrame:]((void *)a1, v85, v59);

          if (v60)
          {
            v84[2](v84, 0);
            v61 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v60 isDirectory:0];
            v62 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
            v63 = objc_msgSend(v62, "bookmarkWithID:", objc_msgSend((id)a1, "readingListBookmarkID"));
            -[TabDocument _loadURL:fromBookmark:]((id *)a1, v61, v63);

            goto LABEL_76;
          }
        }
        if (v17)
        {
          uint64_t v64 = [v18 _originalURL];
          v65 = *(void **)(a1 + 560);
          *(void *)(a1 + 560) = v64;

          id v24 = [*(id *)(a1 + 560) absoluteString];
          if (v79)
          {
            v66 = -[WebBookmark safari_bestCurrentURL](*(id *)(a1 + 312));
            v67 = [v66 absoluteString];
            char v68 = [v67 isEqualToString:v24];

            if ((v68 & 1) == 0)
            {
              v69 = *(void **)(a1 + 312);
              *(void *)(a1 + 312) = 0;
            }
            v70 = -[WebBookmark safari_bestCurrentURL](*(id *)(a1 + 1200));
            v71 = [v70 absoluteString];
            char v72 = [v71 isEqualToString:v24];

            if ((v72 & 1) == 0) {
              [(id)a1 setReadingListBookmark:0];
            }
          }
          else if (v10 == (void *)2)
          {
            v73 = *(void **)(a1 + 312);
            *(void *)(a1 + 312) = 0;
          }
          if (-[TabDocument _isNewDocumentViewNecessaryForURL:]((void *)a1, v19))
          {
            (*((void (**)(id, void, void))v80 + 2))(v80, 0, 0);
            id v74 = (id)[(id)a1 loadRequest:v85 userDriven:*(unsigned __int8 *)(a1 + 699)];
            goto LABEL_44;
          }
        }
        if (!*(unsigned char *)(a1 + 602)
          && !*(unsigned char *)(a1 + 603)
          && ((v79 ^ 1) & 1) == 0
          && ((v17 ^ 1) & 1) == 0)
        {
          -[TabDocument _hidePrivateBrowsingPrivacyProtectionsBannerIfNecessary](a1);
        }
        char v75 = *(unsigned char *)(a1 + 699);
        if (v75) {
          int v76 = 1;
        }
        else {
          int v76 = v79;
        }
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_3_494;
        v90[3] = &unk_1E6D7D828;
        objc_copyWeak(&v96, location);
        id v94 = v80;
        char v97 = v75;
        id v91 = v81;
        id v92 = v18;
        id v93 = v86;
        v95 = v84;
        -[TabDocument _determineResultOfLoadingRequest:inMainFrame:userInitiated:completionHandler:](a1, v85, v17, v76, v90);

        objc_destroyWeak(&v96);
        goto LABEL_76;
      }
      uint64_t v47 = *(void **)(a1 + 1272);
      id v42 = WBSLocalizedStringWithValue((NSString *)@"Are you sure you want to submit this form again?", v45);
      [v47 addFormAlertWithTitle:v42 decisionHandler:v84];
    }
LABEL_75:

    goto LABEL_76;
  }
LABEL_78:
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    (id)MEMORY[0x1E4E42950](WeakRetained[67]);
    id v5 = (void *)v6[67];
    v6[67] = 0;

    id WeakRetained = v6;
  }
  if (a2 && ![WeakRetained isLoading]) {
    -[TabDocument _internalWebView:decidePolicyForNavigationAction:preferences:decisionHandler:](v6, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = (id *)(a1 + 64);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (a2 && objc_msgSend(*(id *)(a1 + 32), "_sf_shouldPerformDownload"))
    {
      id v6 = objc_loadWeakRetained(WeakRetained + 152);
      [v6 tabDocumentCanDownloadFile:WeakRetained];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      if (*(unsigned char *)(a1 + 80))
      {
        id v7 = +[Application sharedApplication];
        BOOL v8 = [v7 historyController];
        id v9 = -[TabDocument profileIdentifier]((uint64_t)WeakRetained);
        char v10 = [v8 frequentlyVisitedSitesControllerForProfileIdentifier:v9 loadIfNeeded:0];

        [v10 sendAnalyticsIfNecessaryForURLNavigation:*(void *)(a1 + 40)];
        BOOL v11 = *(unsigned char *)(a1 + 80) != 0;
      }
      else
      {
        BOOL v11 = 0;
      }
      id v12 = WeakRetained[83];
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 72);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      uint64_t v20 = __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_3;
      id v21 = &unk_1E6D7D788;
      objc_copyWeak(v25, v4);
      id v24 = *(id *)(a1 + 56);
      id v22 = *(id *)(a1 + 40);
      char v26 = *(unsigned char *)(a1 + 80);
      id v23 = *(id *)(a1 + 48);
      v25[1] = a2;
      [v12 websitePoliciesForURL:v13 isForMainFrameNavigation:v11 navigationType:v14 completionHandler:&v18];
      if (a2)
      {
        __int16 v15 = objc_msgSend(MEMORY[0x1E4F3B0A8], "sharedController", v18, v19, v20, v21, v22);
        uint64_t v16 = [*(id *)(a1 + 32) sourceFrame];
        uint64_t v17 = [v16 _handle];
        objc_msgSend(v15, "didCommitLoadForFrameWithIdentifier:", objc_msgSend(v17, "hash"));
      }
      else
      {
        objc_msgSend(WeakRetained[22], "cancelFluidProgressWithProgressStateSource:", WeakRetained, v18, v19, v20, v21, v22);
        -[TabDocument _didFinishLoading]((uint64_t)WeakRetained);
      }

      objc_destroyWeak(v25);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = (uint64_t)WeakRetained;
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_101;
  }
  if (WeakRetained[584]) {
    [v3 _setVisibilityAdjustmentSelectorsIncludingShadowHosts:MEMORY[0x1E4F1CBF0]];
  }
  v66 = [MEMORY[0x1E4F98D20] sharedManager];
  if (*(unsigned char *)(v5 + 602)) {
    [v66 clearPrivateRelayFailClosedExceptionIfNecessaryForURL:*(void *)(a1 + 32)];
  }
  if ([v66 shouldPrivateRelayFailClosedExceptionApplyForURL:*(void *)(a1 + 32)])
  {
    [v3 _setAllowPrivacyProxy:0];
    -[TabDocument _disablePrivateRelaySetting:](v5, 1);
  }
  else if ([v66 wasExceptionClearedForCurrentBrowsingSession:*(void *)(a1 + 32)])
  {
    id v6 = *(void **)(v5 + 592);
    *(void *)(v5 + 592) = 0;
  }
  int v7 = objc_msgSend(*(id *)(a1 + 32), "safari_hasSameSiteAsURL:", *(void *)(v5 + 592));
  if (*(unsigned char *)(a1 + 72))
  {
    int v8 = objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL");
    char v9 = v8;
    if (*(unsigned char *)(a1 + 72))
    {
      if (v8)
      {
        int v10 = 0;
LABEL_17:
        [v3 _setAllowPrivacyProxy:0];
        int v12 = 1;
        goto LABEL_30;
      }
      goto LABEL_20;
    }
  }
  else
  {
    char v9 = 0;
  }
  BOOL v11 = [*(id *)(a1 + 40) _mainFrameURL];
  int v10 = objc_msgSend(v11, "safari_isSafariWebExtensionURL");

  if (v9) {
    goto LABEL_17;
  }
  if (v10)
  {
    uint64_t v13 = [MEMORY[0x1E4F98CF0] sharedManager];
    objc_msgSend(v3, "_setAllowPrivacyProxy:", objc_msgSend(v13, "isPrivacyProxySetToTrackersAndWebsites"));

    int v12 = 0;
    int v10 = 1;
    goto LABEL_30;
  }
LABEL_20:
  if ((!v7 || *(unsigned char *)(v5 + 602)) && *(unsigned char *)(a1 + 72) && ([(id)v5 isShowingErrorPage] & 1) == 0)
  {
    uint64_t v14 = *(void **)(v5 + 592);
    *(void *)(v5 + 592) = 0;

    int v12 = 0;
    int v10 = 0;
    *(unsigned char *)(v5 + 916) = 0;
  }
  else if ([*(id *)(a1 + 32) isEqual:*(void *)(v5 + 592)])
  {
    [v3 _setAllowPrivacyProxy:*(unsigned char *)(v5 + 600) == 0];
    int v12 = 0;
    int v10 = 0;
    *(unsigned char *)(v5 + 601) = *(unsigned char *)(v5 + 600) ^ 1;
  }
  else
  {
    if (v7) {
      [v3 _setAllowPrivacyProxy:*(unsigned __int8 *)(v5 + 601)];
    }
    int v12 = 0;
    int v10 = 0;
  }
LABEL_30:
  __int16 v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  unsigned int v62 = objc_msgSend(v15, "safari_enableAdvancedPrivacyProtections:", objc_msgSend((id)v5, "isPrivateBrowsingEnabled"));

  if (v12)
  {
    uint64_t v16 = [(id)v5 isPrivateBrowsingEnabled];
    uint64_t v17 = 0;
LABEL_34:
    objc_msgSend(v3, "safari_setAdvancedPrivacyProtectionsEnabled:privateBrowsing:", v17, v16);
    goto LABEL_46;
  }
  if (v10)
  {
    uint64_t v16 = [(id)v5 isPrivateBrowsingEnabled];
    uint64_t v17 = v62;
    goto LABEL_34;
  }
  uint64_t v18 = [(id)v5 isPrivateBrowsingEnabled];
  if ([*(id *)(a1 + 32) isEqual:*(void *)(v5 + 616)])
  {
    int v19 = *(unsigned __int8 *)(v5 + 624);
    *(unsigned char *)(v5 + 625) = v19 ^ 1;
    unsigned int v20 = v19 == 0;
  }
  else
  {
    [*(id *)(a1 + 32) host];
    uint64_t v64 = v61 = v18;
    id v21 = objc_msgSend(v64, "safari_highLevelDomainFromHost");
    id v22 = (void **)(v5 + 616);
    id v23 = [*(id *)(v5 + 616) host];
    id v24 = objc_msgSend(v23, "safari_highLevelDomainFromHost");
    int v25 = [v21 isEqualToString:v24];

    if (v25)
    {
      objc_storeStrong((id *)(v5 + 616), *(id *)(a1 + 32));
      unsigned int v20 = *(unsigned char *)(v5 + 625) != 0;
    }
    else
    {
      unsigned int v20 = *(unsigned __int8 *)(a1 + 72);
      if (*(unsigned char *)(a1 + 72))
      {
        char v26 = *v22;
        *id v22 = 0;

        unsigned int v20 = v62;
      }
    }
    uint64_t v18 = v61;
  }
  if (*(unsigned __int8 *)(v5 + 626) == v62) {
    uint64_t v27 = v20;
  }
  else {
    uint64_t v27 = v62;
  }
  *(unsigned char *)(v5 + 626) = v62;
  objc_msgSend(v3, "safari_setAdvancedPrivacyProtectionsEnabled:privateBrowsing:", v27, v18);
LABEL_46:
  if (*(unsigned char *)(a1 + 72) && *(unsigned char *)(v5 + 136))
  {
    double v28 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v28, OS_LOG_TYPE_INFO, "Performing applicable HTTPS upgrade", buf, 2u);
    }
    double v29 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v30 = [v29 BOOLForKey:*MEMORY[0x1E4F99748]];

    if (v30)
    {
      objc_msgSend(v3, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v3, "_networkConnectionIntegrityPolicy") | 4);
      int v31 = [*(id *)(a1 + 32) host];
      int v32 = objc_msgSend(v31, "safari_highLevelDomainFromHost");
      int v33 = WBSIsEqual();

      if (!v33)
      {
        double v35 = *(void **)(v5 + 648);
        *(void *)(v5 + 648) = 0;

        goto LABEL_56;
      }
      uint64_t v34 = [v3 _networkConnectionIntegrityPolicy] | 8;
    }
    else
    {
      uint64_t v34 = [v3 _networkConnectionIntegrityPolicy] | 2;
    }
    [v3 _setNetworkConnectionIntegrityPolicy:v34];
  }
LABEL_56:
  double v36 = [(id)v5 browserController];
  v65 = [v36 activeSearchEngine];

  if (([v65 urlIsValidSearch:*(void *)(a1 + 32)] & 1) != 0
    || !*(unsigned char *)(a1 + 72)
    && ([*(id *)(v5 + 1032) _mainFrameURL],
        id v37 = objc_claimAutoreleasedReturnValue(),
        int v38 = [v65 urlIsValidSearch:v37],
        v37,
        v38))
  {
    objc_msgSend(v3, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v3, "_networkConnectionIntegrityPolicy") | 0x20);
  }
  if (v12)
  {
    uint64_t v39 = 0;
  }
  else if (v10)
  {
    uint64_t v39 = [*(id *)(v5 + 664) isContentBlockersPerSiteSettingEnabled];
  }
  else if ([*(id *)(a1 + 32) isEqual:*(void *)(v5 + 576)])
  {
    int v40 = *(unsigned __int8 *)(v5 + 584);
    *(unsigned char *)(v5 + 585) = v40 ^ 1;
    uint64_t v39 = v40 == 0;
  }
  else
  {
    int v41 = [*(id *)(a1 + 32) host];
    id v42 = objc_msgSend(v41, "safari_highLevelDomainFromHost");
    id v43 = [*(id *)(v5 + 576) host];
    id v44 = objc_msgSend(v43, "safari_highLevelDomainFromHost");
    int v45 = [v42 isEqualToString:v44];

    if (!v45)
    {
      if (*(unsigned char *)(a1 + 72))
      {
        int v56 = *(void **)(v5 + 576);
        *(void *)(v5 + 576) = 0;

        *(unsigned char *)(v5 + 914) = [*(id *)(v5 + 664) isContentBlockersPerSiteSettingEnabled];
      }
      goto LABEL_69;
    }
    objc_storeStrong((id *)(v5 + 576), *(id *)(a1 + 32));
    uint64_t v39 = *(unsigned char *)(v5 + 585) != 0;
  }
  [v3 _setContentBlockersEnabled:v39];
LABEL_69:
  if (([v66 shouldPrivateRelayFailClosedExceptionApplyForURL:*(void *)(a1 + 32)] & 1) == 0
    && !*(unsigned char *)(v5 + 916)
    && *(unsigned char *)(a1 + 72)
    && ((v62 ^ 1) & 1) == 0)
  {
    objc_msgSend(v3, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v3, "_networkConnectionIntegrityPolicy") | 0x10);
  }
  if (v10) {
    objc_msgSend(MEMORY[0x1E4F98A78], "determineContentRuleListStateForWebpagePreferences:wasLoadedWithContentBlockersEnabled:wasLoadedWithAdvancedPrivacyProtectionsEnabled:", v3, objc_msgSend(v3, "_contentBlockersEnabled"), objc_msgSend(v3, "safari_areAdvancedPrivacyProtectionsEnabled"));
  }
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(v5 + 224) setWebViewGeometryNeedsUpdate];
    *(unsigned char *)(v5 + 914) = [v3 _contentBlockersEnabled];
    *(unsigned char *)(v5 + 915) = [v3 _allowPrivacyProxy];
    uint64_t v46 = objc_msgSend(v3, "safari_areAdvancedPrivacyProtectionsEnabled");
    *(unsigned char *)(v5 + 917) = v46;
    [MEMORY[0x1E4F98A78] determineContentRuleListStateForWebpagePreferences:v3 wasLoadedWithContentBlockersEnabled:*(unsigned __int8 *)(v5 + 914) wasLoadedWithAdvancedPrivacyProtectionsEnabled:v46];
    if ([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari])
    {
      if (objc_opt_respondsToSelector()) {
        *(unsigned char *)(v5 + 657) = [v3 _captivePortalModeEnabled];
      }
    }
  }
  if ([MEMORY[0x1E4F97EA0] isWAPEnabled])
  {
    uint64_t v47 = -[TabDocument profileIdentifier](v5);
    int v48 = [v47 isEqualToString:*MEMORY[0x1E4F980C8]];

    if (v48)
    {
      uint64_t v49 = *(void **)(a1 + 32);
      uint64_t v50 = [*(id *)(v5 + 1320) pageURL];
      id v51 = v3;
      id v52 = v49;
      id v53 = v50;
      uint64_t v54 = [MEMORY[0x1E4F3AF08] sharedWebClipCache];
      uint64_t v55 = [v54 webClipURLs];

      if (v55 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v51 _setPushAndNotificationAPIEnabled:0];
        if (objc_msgSend(v53, "safari_hasSameOriginAsURL:", v52))
        {
          [v51 _setPushAndNotificationAPIEnabled:1];
        }
        else
        {
          v63 = v51;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v57 = v55;
          uint64_t v58 = [v57 countByEnumeratingWithState:&v67 objects:buf count:16];
          if (v58)
          {
            uint64_t v59 = *(void *)v68;
            while (2)
            {
              for (uint64_t i = 0; i != v58; ++i)
              {
                if (*(void *)v68 != v59) {
                  objc_enumerationMutation(v57);
                }
                if (objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * i), "safari_hasSameOriginAsURL:", v52))
                {
                  [v63 _setPushAndNotificationAPIEnabled:1];
                  goto LABEL_98;
                }
              }
              uint64_t v58 = [v57 countByEnumeratingWithState:&v67 objects:buf count:16];
              if (v58) {
                continue;
              }
              break;
            }
          }
LABEL_98:

          id v51 = v63;
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_101:
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_482(uint64_t a1, void *a2)
{
  id v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSourceElementInfo:");
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) sourceElementInfo];
  [v3 animateElementToDownloadsBarItemSoon:v4];

  uint64_t v5 = [MEMORY[0x1E4F3AF60] sharedDownloadDispatcher];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  int v8 = [*(id *)(a1 + 64) _userInitiatedAction];
  char v9 = [v5 prepareForDownloadFromWebView:v6 request:v7 MIMEType:0 uti:0 userInitiatedAction:v8];

  int v10 = [MEMORY[0x1E4F3AF68] sharedManager];
  [v9 setDelegate:v10];

  [v9 setExplicitlySaved:1];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_2_483(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setSourceElementInfo:");
  [*(id *)(a1 + 40) dispatchNavigationIntent:*(void *)(a1 + 32)];
}

- (uint64_t)_isNewDocumentViewNecessaryForURL:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!a1[165]) {
      goto LABEL_4;
    }
    id v4 = [a1 webView];
    uint64_t v5 = [v4 configuration];
    uint64_t v6 = [v5 preferences];
    char v7 = [v6 _isStandalone];

    if ((v7 & 1) == 0)
    {
      uint64_t v17 = 1;
    }
    else
    {
LABEL_4:
      int v8 = [a1 webExtensionsController];
      char v9 = [v8 canonicalURLForWebExtensionURL:v3];

      int v10 = [a1 webView];
      id v11 = [v10 _requiredWebExtensionBaseURL];

      int v12 = objc_msgSend(v11, "safari_isSafariWebExtensionURL");
      unsigned int v13 = objc_msgSend(v9, "safari_isSafariWebExtensionURL");
      if ((v12 & v13) == 1)
      {
        uint64_t v14 = [v11 host];
        __int16 v15 = [v9 host];
        int v16 = [v14 isEqualToString:v15];

        uint64_t v17 = v16 ^ 1u;
      }
      else
      {
        uint64_t v17 = v12 | v13;
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

void __92__TabDocument__internalWebView_decidePolicyForNavigationAction_preferences_decisionHandler___block_invoke_3_494(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    [v5 setLoadWasUserDriven:*(unsigned __int8 *)(a1 + 80)];
    -[TabDocument _internalWebView:decidePolicyForNavigationAction:withResult:preferences:decisionHandler:]((uint64_t)WeakRetained, *(void **)(a1 + 32), *(void **)(a1 + 40), v5, v4, *(void **)(a1 + 64));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)_internalWebView:(void *)a3 decidePolicyForNavigationAction:(void *)a4 withResult:(uint64_t)a5 preferences:(void *)a6 decisionHandler:
{
  id v51 = a2;
  id v10 = a3;
  id v11 = a4;
  int v12 = a6;
  if (a1)
  {
    unsigned int v13 = [v10 targetFrame];
    uint64_t v14 = v13;
    if (v13) {
      int v15 = [v13 isMainFrame];
    }
    else {
      int v15 = 1;
    }
    int v16 = [v10 _isUserInitiated];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
    if (((v15 | v16) & 1) == 0 && [v11 isRedirectToAppleServices])
    {
      v12[2](v12, 0);
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v17 = [v10 request];
    uint64_t v50 = [v17 URL];
    switch([v11 type])
    {
      case 0:
        uint64_t v18 = [v11 URL];
        int v19 = objc_msgSend(v18, "safari_hasFeedScheme");

        if (v19)
        {
          -[TabDocument _addNoFeedAppSupportAlert](a1);
        }
        else
        {
          int v30 = [v11 URL];
          int v31 = objc_msgSend(v30, "_webkit_isJavaScriptURL");

          if (v31)
          {
            [*(id *)(a1 + 1272) addDisallowedUseOfJavaScriptAlert];
          }
          else if (v15)
          {
            [*(id *)(a1 + 1272) addInvalidURLAlert];
          }
        }
        goto LABEL_29;
      case 1:
        if (!v15) {
          goto LABEL_46;
        }
        if ([WeakRetained tabDocumentIsBackgroundPreloading:a1]
          && (objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(MEMORY[0x1E4F1CB10], "_web_willPerformSOKerberosAuthorizationWithURL:", v50))
        {
          if ([WeakRetained tabDocumentShouldHandleAuthentication:a1]) {
            goto LABEL_31;
          }
LABEL_29:
          uint64_t v29 = 0;
          goto LABEL_30;
        }
        char v32 = v16 ^ 1;
        if (!v14) {
          char v32 = 1;
        }
        if ((v32 & 1) == 0) {
          [WeakRetained willStartLoadFromUserTap:a1];
        }
        if (![v10 _shouldOpenAppLinks])
        {
LABEL_46:
          uint64_t v29 = 3;
LABEL_30:
          v12[2](v12, v29);
          goto LABEL_31;
        }
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke;
        v60[3] = &unk_1E6D7D878;
        v60[4] = a1;
        uint64_t v49 = v12;
        uint64_t v64 = v49;
        id v61 = v10;
        id v33 = v50;
        id v62 = v33;
        char v65 = v16;
        id v63 = v17;
        char v66 = v15;
        uint64_t v34 = (void *)MEMORY[0x1E4E42950](v60);
        if (*(void *)(a1 + 1264))
        {
          if ((objc_msgSend(v33, "isEqual:") & 1) != 0
            || (double v35 = *(void **)(a1 + 1184)) != 0
            && ([v35 isEqualToString:@"com.apple.springboard"] & 1) == 0)
          {
            v49[2](v49, 3);
LABEL_59:

            id v44 = v64;
LABEL_69:

LABEL_31:
            goto LABEL_32;
          }
          id v36 = (id)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:*(void *)(a1 + 1264)];
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_4;
          v53[3] = &unk_1E6D7D8A0;
          id v54 = v33;
          id v55 = v34;
          int v56 = v49;
          objc_msgSend(v36, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v53);
          id v37 = &v54;
          int v38 = &v55;
        }
        else
        {
          id v43 = (void *)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:v33];
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_3;
          v57[3] = &unk_1E6D7D558;
          uint64_t v58 = v43;
          id v59 = v34;
          id v36 = v43;
          objc_msgSend(v36, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v57);
          id v37 = &v59;
          int v38 = &v58;
        }

        goto LABEL_59;
      case 2:
        v12[2](v12, 0);
        unsigned int v20 = [v11 URL];
        id v21 = -[TabDocument _loadURLInternal:userDriven:](a1, v20, 1);

        goto LABEL_31;
      case 3:
        char v22 = *(unsigned char *)(a1 + 946);
        v12[2](v12, 0);
        if (!v15 || ![v10 _shouldOpenExternalSchemes]) {
          goto LABEL_31;
        }
        *(unsigned char *)(a1 + 947) = v22;
        id v23 = [v10 sourceFrame];
        id v24 = v51;
        uint64_t v25 = [v23 webView];

        int v48 = (void (**)(id, uint64_t))v25;
        if (v25) {
          BOOL v26 = v25 == (void)v51;
        }
        else {
          BOOL v26 = 1;
        }
        int v27 = !v26;
        uint64_t v47 = [v51 URL];
        HIDWORD(v46) = v27;
        if (v47)
        {
          double v28 = [v51 URL];
          LODWORD(v46) = [v50 isEqual:v28] ^ 1;

          id v24 = v51;
        }
        else
        {
          LODWORD(v46) = 0;
        }

        uint64_t v39 = [v24 _committedURL];

        int v40 = v46;
        if (v39) {
          int v40 = 1;
        }
        if ((HIDWORD(v46) & v40) == 1)
        {
          int v41 = +[TabDocument tabDocumentForWKWebView:v48];
          [v41 loadWindowDotOpenExternalNavigationResult:v11 fromOriginalRequest:v17];

          [WeakRetained tabDocumentDidCancelRedirectToExternalApplication:a1];
        }
        else
        {
          if (v16)
          {
            uint64_t v42 = 2;
          }
          else if (*(void *)(a1 + 1264))
          {
            uint64_t v42 = 2;
          }
          else
          {
            uint64_t v42 = 3;
          }
          if (*(unsigned char *)(a1 + 735))
          {
            if (!*(unsigned char *)(a1 + 656)) {
              uint64_t v42 = 0;
            }
            *(unsigned char *)(a1 + 735) = 0;
          }
          int v45 = objc_msgSend(v10, "_userInitiatedAction", v46);
          -[TabDocument _redirectToExternalNavigationResult:fromOriginalRequest:navigationAction:promptPolicy:isMainFrame:userAction:](a1, v11, v17, v10, v42, 1, v45);
        }
        *(unsigned char *)(a1 + 947) = 0;
        id v44 = v48;
        goto LABEL_69;
      case 4:
        [*(id *)(a1 + 1272) addDisallowedFileURLAlert];
        goto LABEL_29;
      default:
        goto LABEL_29;
    }
  }
LABEL_33:
}

void __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 922) && (unint64_t)(a3 + 1) > 3)
  {
    uint64_t v6 = [*(id *)(a1 + 40) _userInitiatedAction];
    if ([*(id *)(a1 + 32) isPrivateBrowsingEnabled]) {
      goto LABEL_14;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v7 + 700))
    {
      if (!v6 || ([v6 isConsumed] & 1) != 0) {
        goto LABEL_14;
      }
      uint64_t v7 = *(void *)(a1 + 32);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 960));
    if (![WeakRetained isSuspendedOrSuspending])
    {
      if (*(unsigned char *)(*(void *)(a1 + 32) + 656))
      {
        char v9 = [*(id *)(a1 + 48) hasTelephonyScheme];

        if ((v9 & 1) == 0) {
          goto LABEL_14;
        }
      }
      else
      {
      }
      objc_initWeak(&location, *(id *)(a1 + 32));
      if (v6 && ([v6 isConsumed] & 1) == 0) {
        [v6 consume];
      }
      else {
        *(unsigned char *)(*(void *)(a1 + 32) + 700) = 1;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void **)(a1 + 56);
      uint64_t v20 = *MEMORY[0x1E4FA6E98];
      v21[0] = MEMORY[0x1E4F1CC38];
      int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_2;
      v16[3] = &unk_1E6D7D850;
      id v17 = *(id *)(a1 + 64);
      objc_copyWeak(&v18, &location);
      -[TabDocument _openAppLinkInApp:fromOriginalRequest:updateAppLinkStrategy:webBrowserState:completionHandler:](v13, v5, v14, 0, v15, v16);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
      goto LABEL_20;
    }

LABEL_14:
    id v10 = [MEMORY[0x1E4F3AFD8] resultWithAppLink:v5];
    [v10 setLoadWasUserDriven:*(unsigned __int8 *)(*(void *)(a1 + 32) + 699)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v11 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v12 = 2;
    }
    else if (v11[158])
    {
      uint64_t v12 = 2;
    }
    else
    {
      uint64_t v12 = 3;
    }
    -[TabDocument _queueAlertForRedirectToExternalNavigationResult:fromOriginalRequest:navigationAction:isMainFrame:promptPolicy:userAction:](v11, v10, *(void **)(a1 + 56), *(void **)(a1 + 40), *(unsigned char *)(a1 + 73), v12, v6);

LABEL_20:
    goto LABEL_4;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_4:
}

void __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a2) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      if (-[TabDocument _shouldCleanUpAfterRedirectToExternalApp]((uint64_t)WeakRetained))
      {
        if ([v7 canGoBack]) {
          [v7 goBack];
        }
        else {
          [v7 _closeTabDocumentAnimated:0];
        }
      }
    }
  }
}

uint64_t __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

void __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 3)
  {
    if ((unint64_t)(a2 + 1) <= 1)
    {
      uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:*(void *)(a1 + 32)];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      id v7[2] = __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_5;
      v7[3] = &unk_1E6D7D558;
      id v5 = *(id *)(a1 + 40);
      id v8 = v4;
      id v9 = v5;
      id v6 = v4;
      objc_msgSend(v6, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v7);
    }
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

uint64_t __103__TabDocument__internalWebView_decidePolicyForNavigationAction_withResult_preferences_decisionHandler___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)_didDecideNavigationPolicy:(void *)a3 forNavigationResponse:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    if (a2 == 1)
    {
      id v18 = v5;
      int v7 = [v5 isForMainFrame];
      id v6 = v18;
      if (v7)
      {
        id v8 = [v18 _frame];
        id v9 = [v8 webView];
        id v10 = (void *)a1[129];

        id v6 = v18;
        if (v9 == v10)
        {
          uint64_t v11 = objc_msgSend(v18, "_sf_explicitSuggestedFilename");
          uint64_t v12 = (void *)a1[94];
          a1[94] = v11;

          char v13 = [a1 isPrivate];
          id v6 = v18;
          if ((v13 & 1) == 0)
          {
            uint64_t v14 = [v18 response];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v15 = [v18 response];
              int v16 = [v15 URL];
              int v17 = objc_msgSend(v16, "safari_isHTTPFamilyURL");

              id v6 = v18;
              if (!v17) {
                goto LABEL_10;
              }
              uint64_t v14 = [v18 response];
              [a1 donateCurrentNavigationWithNavigationResponse:v14];
            }

            id v6 = v18;
          }
        }
      }
    }
  }
LABEL_10:
}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v46 = a3;
  id v8 = a4;
  id v9 = a5;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke;
  v61[3] = &unk_1E6D7D8C8;
  v61[4] = self;
  id v10 = v8;
  id v62 = v10;
  id v11 = v9;
  id v63 = v11;
  uint64_t v12 = (void (**)(void, void))MEMORY[0x1E4E42950](v61);
  id v59 = 0;
  uint64_t v60 = 0;
  uint64_t v13 = objc_msgSend(v10, "_sf_responsePolicy:uti:", &v60, &v59);
  id v14 = v59;
  if (v13) {
    BOOL v15 = !self->_wasLoadedWithLockdownModeEnabled;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = 2;
  }
  if (!v16)
  {
    v12[2](v12, 1);
    goto LABEL_30;
  }
  if (!self->_loadNextNavigationInline || ![v10 isForMainFrame])
  {
    if ([v10 isForMainFrame]) {
      self->_isDecidingNavigationResponsePolicyForMainFrameDownload = 1;
    }
    int v45 = [v10 response];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_2;
    v55[3] = &unk_1E6D7D8C8;
    id v17 = v10;
    id v56 = v17;
    id v57 = self;
    uint64_t v58 = v12;
    id v18 = (void (**)(void, void))MEMORY[0x1E4E42950](v55);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = [WeakRetained tabDocumentCanDownloadFile:self];

    if ((v20 & 1) == 0)
    {
      v18[2](v18, 0);
LABEL_29:

      goto LABEL_30;
    }
    int v21 = [v17 isForMainFrame];
    id v44 = [v45 MIMEType];
    if (([v44 isEqualToString:@"application/rdf+xml"] & 1) != 0
      || ([v44 isEqualToString:@"application/rss+xml"] & 1) != 0
      || ([v44 isEqualToString:@"application/atom+xml"] & 1) != 0)
    {
    }
    else
    {
      int v31 = [v44 isEqualToString:@"application/syndication+xml"];

      if (!v31)
      {
        id obja = [v45 suggestedFilename];
        id v37 = objc_msgSend(obja, "safari_filenameByFixingIllegalCharacters");
        int v27 = objc_msgSend(v37, "safari_lastPathComponentWithoutZipExtension");

        id objb = [v27 pathExtension];
        uint64_t v38 = [objb caseInsensitiveCompare:@"swf"];

        uint64_t v32 = [v44 caseInsensitiveCompare:@"application/x-shockwave-flash"];
        if (v21)
        {
          char v33 = 0;
        }
        else
        {
          if (v38) {
            BOOL v34 = v32 == 0;
          }
          else {
            BOOL v34 = 1;
          }
          char v33 = v34;
        }
        if (!v60
          || (v33 & 1) != 0
          || v60 == 3 && ![getPKAddPassesViewControllerClass() canAddPasses])
        {
          if (v21) {
            [(_SFPageLoadErrorController *)self->_pageLoadErrorController addDownloadFailedAlertWithDescription:0];
          }
          v18[2](v18, 0);
          goto LABEL_27;
        }
        double v35 = (void *)MEMORY[0x1E4F3AF48];
        uint64_t v39 = [v17 _request];
        id v36 = objc_msgSend(v17, "_sf_suggestedFilename");
        id obj = [v35 provisionalDownloadWithMIMEType:v44 request:v39 response:v45 filename:v36 uti:v14 userInitiatedAction:self->_lastUserInitiatedAction];

        uint64_t v29 = [MEMORY[0x1E4F3AF60] sharedDownloadDispatcher];
        objc_storeStrong((id *)&self->_activeDownload, obj);
        if (obj)
        {
          int v40 = [MEMORY[0x1E4F3AF68] sharedManager];
          [obj setDelegate:v40];
          [v40 deferAddingDownloadWhenStarted:obj];
          if ((unint64_t)(v16 - 2) > 2)
          {
            [v29 setPendingDownload:obj forWebView:v46];
            v18[2](v18, 2);
          }
          else
          {
            [obj setSuppressesPrompt:1];
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_3;
            v47[3] = &unk_1E6D7D8F0;
            id v48 = v29;
            id v49 = obj;
            id v50 = v46;
            id v53 = v18;
            uint64_t v54 = v16;
            id v51 = self;
            id v52 = v17;
            -[TabDocument _presentDialogToAllowDownload:allowViewAction:completionHandler:]((uint64_t)self, v49, v16 != 2, v47);
          }
        }
        else
        {
          v18[2](v18, 0);
        }
        id v23 = obj;
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
    }
    if ((v21 & 1) == 0)
    {
      v18[2](v18, 0);
LABEL_28:

      goto LABEL_29;
    }
    char v22 = [v17 _request];
    id v23 = [v22 URL];

    id v24 = [v23 scheme];
    uint64_t v25 = [v24 compare:@"http" options:1];

    BOOL v26 = [v23 absoluteString];
    if (v25)
    {
      int v27 = [@"feed:" stringByAppendingString:v26];
    }
    else
    {
      double v28 = [v26 substringFromIndex:5];
      int v27 = [@"feed:" stringByAppendingString:v28];
    }
    uint64_t v29 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
    v18[2](v18, 0);
    id v30 = -[TabDocument _loadURLInternal:userDriven:]((uint64_t)self, v29, 1);
    goto LABEL_26;
  }
  v12[2](v12, 1);
  self->_loadNextNavigationInline = 0;
LABEL_30:
}

uint64_t __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  -[TabDocument _didDecideNavigationPolicy:forNavigationResponse:](*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

void __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) isForMainFrame]) {
    *(unsigned char *)(*(void *)(a1 + 40) + 713) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      [*(id *)(v4 + 176) cancelFluidProgressWithProgressStateSource:v4];
      -[TabDocument _didFinishLoading](v4);
    }
  }
}

void __73__TabDocument_webView_decidePolicyForNavigationResponse_decisionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    if (*(void *)(a1 + 80) == 4)
    {
      v6();
      *(unsigned char *)(*(void *)(a1 + 56) + 697) = 1;
      uint64_t v7 = *(void *)(a1 + 56);
      id v16 = [*(id *)(a1 + 64) _request];
      id v8 = -[TabDocument _loadRequest:userDriven:shouldOpenExternalURLs:](v7, v16, 1);
LABEL_19:

      return;
    }
    v6();
  }
  else
  {
    if (a2 != 1)
    {
      if (a2) {
        return;
      }
      [*(id *)(a1 + 32) setPendingDownload:*(void *)(a1 + 40) forWebView:*(void *)(a1 + 48)];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      id v15 = [*(id *)(*(void *)(a1 + 56) + 1032) backForwardList];
      id v3 = [v15 currentItem];
      *(unsigned char *)(*(void *)(a1 + 56) + 696) = v3 == 0;

      uint64_t v4 = *(unsigned char **)(a1 + 56);
      if (v4[696]) {
        return;
      }
      id v5 = [v4 committedURL];

      if (v5) {
        return;
      }
      goto LABEL_18;
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    id v17 = [*(id *)(*(void *)(a1 + 56) + 1032) backForwardList];
    id v9 = [v17 currentItem];

    id v10 = *(void **)(a1 + 56);
    if (v9)
    {
      id v11 = [v10 committedURL];

      if (v11) {
        return;
      }
LABEL_18:
      uint64_t v12 = *(void **)(*(void *)(a1 + 56) + 1032);
      id v16 = [v12 backForwardList];
      uint64_t v13 = [v16 currentItem];
      id v14 = (id)[v12 goToBackForwardListItem:v13];

      goto LABEL_19;
    }
    [v10 _closeTabDocumentAnimated:0];
  }
}

- (void)webView:(id)a3 navigationAction:(id)a4 didBecomeDownload:(id)a5
{
  id v6 = a5;
  id v5 = [MEMORY[0x1E4F3AF60] sharedDownloadDispatcher];
  [v5 downloadDidStart:v6];
}

- (void)webView:(id)a3 navigationResponse:(id)a4 didBecomeDownload:(id)a5
{
  id v6 = a5;
  id v5 = [MEMORY[0x1E4F3AF60] sharedDownloadDispatcher];
  [v5 downloadDidStart:v6];
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F29128] UUID];
  biomeWebpageIdentifier = self->_biomeWebpageIdentifier;
  self->_biomeWebpageIdentifier = v8;

  lastLoadError = self->_lastLoadError;
  self->_lastLoadError = 0;

  id v11 = [v6 _unreachableURL];

  if (!v11)
  {
    lastLoadErrorForFormatMenu = self->_lastLoadErrorForFormatMenu;
    self->_lastLoadErrorForFormatMenu = 0;
  }
  self->_didCommitCurrentNavigation = 0;
  self->_didFirstPaint = 0;
  *(_DWORD *)&self->_didFinishDocumentLoad = 0;
  appBannerPendingFirstPaint = self->_appBannerPendingFirstPaint;
  self->_appBannerPendingFirstPaint = 0;

  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = 0;

  quickLookDocument = self->_quickLookDocument;
  self->_quickLookDocument = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v17 = [WeakRetained tabController];
  [v17 saveTabDocumentUserActivitySoon:self];

  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator didStartProvisionalNavigationWithUserInitiatedAction:self->_lastUserInitiatedAction];
  if (self->_pageLoadStatistics)
  {
    char v22 = [v7 _request];
    id v23 = [v22 URL];
    id v24 = [v23 absoluteString];
    char v25 = [v24 isEqualToString:@"about:blank"];

    if ((v25 & 1) == 0) {
      [(PageLoadTestStatistics *)self->_pageLoadStatistics startedNavigation:v7];
    }
  }
  [(_SFCalendarEventDetector *)self->_calendarEventDetector cancelCheckForConfirmationPage];
  if (self->_needsSendTelemetryForProvisionalLoad)
  {
    self->_needsSendTelemetryForProvisionalLoad = 0;
    id v18 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)BOOL v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LaunchToFirstLoad", "beganLoad=YES enableTelemetry=YES ", v26, 2u);
    }
  }
  if (!self->_translationContext)
  {
    int v19 = [MEMORY[0x1E4F98F48] translationContextWithWebView:self->_webView delegate:self];
    translationContext = self->_translationContext;
    self->_translationContext = v19;

    [(WBSTranslationContext *)self->_translationContext setFluidProgressController:self->_fluidProgressController];
    int v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:self selector:sel__translationContextStateDidChange_ name:*MEMORY[0x1E4F99740] object:self->_translationContext];
  }
  [(TabDocument *)self updateAccessibilityIdentifier];
  [(_SFFormAutoFillController *)self->_autoFillController offerToSaveUnsubmittedFormDataIfNeeded];
  -[TabDocument _updateActiveExtensionsIfNecessary]((uint64_t)self);
  if (self->_loadWasUserDriven && ([v7 _isUserInitiated] & 1) != 0 || self->_lastUserInitiatedAction) {
    [(WBSPermissionDialogThrottler *)self->_permissionDialogThrottler willPerformUserInitiatedNavigation];
  }
}

id __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) webExtensionForExtension:a2];
  if ([*(id *)(a1 + 32) isTab:*(void *)(a1 + 40) visibleToExtension:v3])
  {
    int v4 = [v3 hasPermissionToAccessURL:*(void *)(a1 + 48) inTab:*(void *)(a1 + 40)];
    id v5 = [v3 baseURIHost];
    int v6 = [v5 isEqual:*(void *)(a1 + 56)];

    if (v6) {
      id v7 = 0;
    }
    else {
      id v7 = v3;
    }
    if (!v4) {
      id v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __49__TabDocument__updateActiveExtensionsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 toolbarItem];
  id v5 = objc_msgSend(v4, "iconForTab:size:", *(void *)(a1 + 32), *MEMORY[0x1E4F78870], *(double *)(MEMORY[0x1E4F78870] + 8));
  int v6 = [v4 badgeTextForTab:*(void *)(a1 + 32)];
  uint64_t v7 = [v6 length];

  if (v7) {
    [v4 didViewBadgeInTab:*(void *)(a1 + 32)];
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F78508]) initWithExtension:v3 image:v5 badged:v7 != 0];

  return v8;
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator didFailProvisionalNavigationWithError:v7];
  id v8 = [(SFBrowserDocumentTrackerInfo *)self->_trackerInfo queryParameterFilteringDataQueue];
  [v8 clearPendingData];

  uint64_t v9 = [v7 code];
  if ([(NSMutableArray *)self->_fallbackURLs count]
    && ((int v10 = objc_msgSend(v7, "_web_errorIsInDomain:", *MEMORY[0x1E4F289A0]),
         (v9 & 0xFFFFFFFFFFFFFFFELL) == 0xFFFFFFFFFFFFFC14)
      ? (int v11 = v10)
      : (int v11 = 0),
        v11 == 1))
  {
    uint64_t v12 = [v18 _request];
    suggestedFilenameForNextCommit = objc_getAssociatedObject(v12, (const void *)kWebClipToNSURLRequestAssociationKey);

    -[TabDocument _loadNextFallbackURLWithWebClip:navigation:]((uint64_t)self, suggestedFilenameForNextCommit, 0);
  }
  else
  {
    -[TabDocument _clearNavigationSource]((uint64_t)self);
    [(_SFWebView *)self->_webView setObscuringContents:0];
    self->_contentIsReadyForSnapshot = 1;
    [(TabDocument *)self updateAccessibilityIdentifier];
    objc_storeStrong((id *)&self->_lastLoadError, a5);
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    -[TabDocument _didFinishLoading]((uint64_t)self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v15 = [WeakRetained tabController];
    [v15 saveTabDocumentUserActivitySoon:self];

    id v16 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v16 reportTabUpdatedWithUpdateType:0];

    pageLoadStatistics = self->_pageLoadStatistics;
    if (pageLoadStatistics) {
      [(PageLoadTestStatistics *)pageLoadStatistics failedNavigation:v18 withError:v7];
    }
    self->_shouldResetPrintSuppressionOnNextCommit = 0;
    self->_loadNextNavigationInline = 0;
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;
  }
}

- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6
{
  id v13 = a3;
  id v9 = a5;
  id v10 = a6;
  if (([v9 blockedLoad] & 1) != 0 || objc_msgSend(v9, "blockedCookies"))
  {
    int v11 = -[TabDocument _contentBlockerStatisticsStore](self);
    uint64_t v12 = [v13 URL];
    [v11 recordThirdPartyResourceBlocked:v10 onFirstParty:v12 completionHandler:0];
  }
}

- (void)_webView:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6
{
  id v8 = (void (**)(id, void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  LODWORD(self) = [WeakRetained tabDocumentShouldHandleAuthentication:self];

  v8[2](v8, self ^ 1);
}

- (void)_webView:(id)a3 didGeneratePageLoadTiming:(id)a4
{
  id v6 = a4;
  pageLoadStatistics = self->_pageLoadStatistics;
  if (pageLoadStatistics) {
    [(PageLoadTestStatistics *)pageLoadStatistics didGeneratePageLoadTiming:v6];
  }
}

- (void)_donateTextSoon
{
  if (a1)
  {
    if (-[TabDocument _canDonateToCoreSpotlight](a1))
    {
      objc_initWeak(&location, a1);
      [a1[53] invalidate];
      uint64_t v2 = (void *)MEMORY[0x1E4F1CB00];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __30__TabDocument__donateTextSoon__block_invoke;
      v5[3] = &unk_1E6D7D060;
      objc_copyWeak(&v6, &location);
      uint64_t v3 = [v2 scheduledTimerWithTimeInterval:0 repeats:v5 block:5.0];
      id v4 = a1[53];
      a1[53] = (id)v3;

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

void __30__TabDocument__donateTextSoon__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[TabDocument _donateTextAllowingDonationWithoutReaderText:](WeakRetained, 0);
}

- (void)_donateTextAllowingDonationWithoutReaderText:(id *)a1
{
  if (a1 && a1[53])
  {
    if (-[TabDocument _canDonateToCoreSpotlight](a1))
    {
      uint64_t v4 = [a1[37] unfilteredArticleText];
      id v5 = v4;
      if ((a2 & 1) != 0 || v4 || ![a1[37] isReaderAvailable])
      {
        [a1[53] invalidate];
        id v8 = a1[53];
        a1[53] = 0;

        if ([a1 isSecure]) {
          uint64_t v9 = [a1[37] doesPageUseSearchEngineOptimizationMetadata];
        }
        else {
          uint64_t v9 = 1;
        }
        id v10 = [a1 personalizationData];
        int v11 = (void *)[v10 copy];

        uint64_t v12 = [a1 personalizationData];
        [v12 clearData];

        id v13 = [MEMORY[0x1E4F98E50] sharedInstance];
        id v14 = a1[129];
        uint64_t v15 = -[TabDocument profileIdentifier]((uint64_t)a1);
        id v16 = (void *)v15;
        if (v15) {
          uint64_t v17 = v15;
        }
        else {
          uint64_t v17 = *MEMORY[0x1E4F980C8];
        }
        [v13 donateTextInWebView:v14 extractedReaderText:v5 canDonateFullPageText:v9 profileIdentifier:v17 personalizationData:v11 extractInnerText:&__block_literal_global_525_0];
      }
      else
      {
        id v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[TabDocument _donateTextAllowingDonationWithoutReaderText:]();
        }
      }
    }
    else
    {
      id v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[TabDocument _donateTextAllowingDonationWithoutReaderText:](a2, v7);
      }
      id v5 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        [a1[129] URL];
        objc_claimAutoreleasedReturnValue();
        -[TabDocument _donateTextAllowingDonationWithoutReaderText:]();
      }
    }
  }
}

- (WBSSiriIntelligenceDonorTabData)tabDataForSpotlightDonation
{
  if (-[TabDocument _canDonateToCoreSpotlight]((id *)&self->super.isa))
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F98E68]);
    uint64_t v4 = [(NSUUID *)self->_uuid UUIDString];
    [v3 setUuidString:v4];

    id v5 = [(TabDocument *)self url];
    [v3 setUrl:v5];

    id v6 = [(TabDocument *)self title];
    [v3 setTitle:v6];

    id v7 = -[TabDocument profileIdentifier]((uint64_t)self);
    [v3 setProfileIdentifier:v7];

    id v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_lastViewedTime];
    [v3 setLastVisitedDate:v8];

    uint64_t v9 = [(WBTab *)self->_tabGroupTab tabGroupUUID];
    [v3 setTabGroupUUID:v9];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F98E50] sharedInstance];
    [v9 setTabNeedsSpotlightDeletion:self];
    id v3 = 0;
  }

  return (WBSSiriIntelligenceDonorTabData *)v3;
}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v46 = a4;
  self->_didCommitCurrentNavigation = 1;
  id v48 = v6;
  id v7 = [(TabDocument *)self trackerInfo];
  [v7 documentDidCommitNavigation];

  [v6 setOpaque:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v49 = objc_msgSend(v6, "URL", WeakRetained);
  if (!self->_disableContentBlockersWhenReloading)
  {
    uint64_t v9 = [(TabDocument *)self sfScribbleController];
    id v10 = [v49 host];
    [v9 updateUserDefinedContentBlockerWithHost:v10];
  }
  [(TabDocument *)self setIsBlank:[(TabDocument *)self isShowingStartPageOverriddenByExtension]];
  [(TabDocument *)self setNeedsNewTabSnapshot];
  fallbackURLs = self->_fallbackURLs;
  self->_fallbackURLs = 0;

  webClipMetadataFetcher = self->_webClipMetadataFetcher;
  self->_webClipMetadataFetcher = 0;

  applicationManifestFetcher = self->_applicationManifestFetcher;
  self->_applicationManifestFetcher = 0;

  [(TouchIconFetcher *)self->_touchIconFetcher invalidate];
  touchIconFetcher = self->_touchIconFetcher;
  self->_touchIconFetcher = 0;

  -[_SFReloadOptionsController setEffectiveContentMode:](self->_reloadOptionsController, "setEffectiveContentMode:", [v46 effectiveContentMode]);
  [(NSTimer *)self->_donateTextTimer invalidate];
  donateTextTimer = self->_donateTextTimer;
  self->_donateTextTimer = 0;

  [(TabDocument *)self setSearchableItemAttributes:0];
  if (!self->_gestureRequiresGoBackToParentTab) {
    -[TabDocument _removeParentChildTabDocumentRelations]((id *)&self->super.isa);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__TabDocument_webView_didCommitNavigation___block_invoke;
  block[3] = &unk_1E6D79060;
  id v16 = WeakRetained;
  id v56 = v16;
  if (-[TabDocument webView:didCommitNavigation:]::__once_crash_checkpoint != -1) {
    dispatch_once(&-[TabDocument webView:didCommitNavigation:]::__once_crash_checkpoint, block);
  }
  self->_externalAppRedirectState = 0;
  self->_hasFocusedInputFieldOnCurrentPage = 0;
  self->_hasFormControlInteraction = 0;
  if (self->_active)
  {
    [(TabDocument *)self hideFindOnPage];
    if (([v16 wantsUnifiedFieldFocused] & 1) == 0) {
      [v16 setFavoritesState:0 animated:1];
    }
  }
  BOOL v17 = [(TabDocument *)self shouldActivateReaderWhenAvailable];
  if (!v17)
  {
    if (![v16 isShowingReader] || !self->_active) {
      goto LABEL_20;
    }
LABEL_19:
    [v16 hideReaderForTabDocument:self animated:v17 deactivationMode:0];
    goto LABEL_20;
  }
  id v18 = [v16 nextContinuousItemDocument];
  BOOL v19 = v18 == self;

  if (v19) {
    goto LABEL_20;
  }
  if ([v16 readerShouldBeShownIfPossible])
  {
    int v20 = [(_SFWebView *)self->_readerWebView _webProcessIdentifier];
    if (v20 == [(_SFWebView *)self->_webView _webProcessIdentifier])
    {
      objc_msgSend(v16, "setReaderViewStale:", objc_msgSend(v16, "isShowingReader"));
      goto LABEL_20;
    }
  }
  if ([v16 isShowingReader]) {
    goto LABEL_19;
  }
LABEL_20:
  [(_SFReaderController *)self->_readerContext owningWebViewDidCommitNavigation];
  if ([(TabDocument *)self isShowingReader]) {
    [(_SFReaderController *)self->_readerContext clearAvailability];
  }
  else {
    [(TabDocument *)self clearReaderContext];
  }
  self->_displayingStandaloneImage = [(_SFWebView *)self->_webView _isDisplayingStandaloneImageDocument];
  self->_displayingStandaloneMedia = [(_SFWebView *)self->_webView _isDisplayingStandaloneMediaDocument];
  self->_hasDoneReaderAvailabilityDetection = 0;
  [(WBSTranslationContext *)self->_translationContext owningWebViewDidCommitNavigationWithURL:v49 completionHandler:0];
  uint64_t v21 = [(TabDocument *)self readingListBookmarkID];
  int v45 = [(_SFWebView *)self->_webView backForwardList];
  uint64_t v47 = [v45 currentItem];
  if (v21 && !-[WKBackForwardListItem safari_bookmarkID](v47)) {
    -[WKBackForwardListItem safari_setBookmarkID:](v47, v21);
  }
  if (self->_highlightFromNavigation)
  {
    objc_msgSend(v47, "safari_setHighlight:");
    highlightFromNavigation = self->_highlightFromNavigation;
    self->_highlightFromNavigation = 0;
  }
  self->_wasLoadedWithLockdownModeEnabled = self->_pendingNavigationWillLoadWithLockdownModeEnabled;
  int v23 = [(TabDocument *)self readingListBookmarkID];
  if (self->_active && v23) {
    [v16 markReadingListBookmark:self->_readingListBookmark asRead:1 postNotification:1];
  }
  [(SFDialogController *)self->_dialogController owningWebViewDidCommitNavigationWithURL:v49];
  [(_SFPageLoadErrorController *)self->_pageLoadErrorController clearFailedRequest];
  quickLookDocument = self->_quickLookDocument;
  self->_quickLookDocument = 0;

  self->_BOOL quickLookDocumentCheckCompleted = 0;
  if (self->_suggestedFilenameForNextCommit)
  {
    -[_SFWebView setSuggestedFilenameForCurrentBackForwardListItem:](self->_webView, "setSuggestedFilenameForCurrentBackForwardListItem:");
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;
  }
  -[TabDocument _updatePageZoomWithPreference]((id *)&self->super.isa);
  BOOL v26 = self->_displayingStandaloneImage || [(TabDocument *)self isPDFDocument];
  [(WBSFluidProgressController *)self->_fluidProgressController progressStateSourceDidCommitLoad:self loadingSingleResource:v26];
  if (self->_active)
  {
    [(SFNavigationBarItem *)self->_navigationBarItem setShowsReaderButton:[(TabDocument *)self isReaderAvailable]];
    [v16 updateInterface];
  }
  if ([(TabDocument *)self isPDFDocument])
  {
    int v27 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v27 didLoadTabContent:0];
  }
  else if ([(TabDocument *)self hasQuickLookContent])
  {
    int v27 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v27 didLoadTabContent:1];
  }
  else
  {
    int v27 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v27 didLoadTabContent:2];
  }

  if (([v16 isReaderViewStale] & 1) == 0) {
    [v16 document:self willMakeReaderVisible:0];
  }
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator didCommitNavigation];
  -[TabDocument _updateNavigationBarItem]((uint64_t)self);
  double v28 = [v16 tabController];
  [v28 saveTabDocumentUserActivitySoon:self];

  uint64_t v29 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v29 reportTabUpdatedWithUpdateType:0];

  storeBanner = self->_storeBanner;
  self->_storeBanner = 0;

  -[TabDocument _clearAppBannerIfNotCurrentStoreBannerDeferringRemoval:]((uint64_t)self, 0);
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __43__TabDocument_webView_didCommitNavigation___block_invoke_2;
  v54[3] = &unk_1E6D793E8;
  v54[4] = self;
  -[TabDocument _checkForAppLinkWithCompletion:]((uint64_t)self, v54);
  int v31 = v48;
  [(TabDocument *)self applyHighlightFromNotesIfNeeded];
  -[TabDocument _clearNavigationSource]((uint64_t)self);
  [(_SFPrintController *)self->_printController clearQueue];
  if (self->_shouldResetPrintSuppressionOnNextCommit)
  {
    [(_SFPrintController *)self->_printController resetPrintUISuppression];
    self->_shouldResetPrintSuppressionOnNextCommit = 0;
  }
  -[TabDocument _clearCachedCanonicalURL]((uint64_t)self);
  uint64_t v32 = objc_msgSend(v49, "safari_userVisibleHostWithoutWWWSubdomain");
  if (([v32 isEqualToString:self->_domainWhereUserDeclinedAutomaticStrongPassword] & 1) == 0)
  {
    domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
    self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;

    int v31 = v48;
  }
  [(_SFFormAutoFillController *)self->_autoFillController removeAutomaticPasswordButtonInitiatedByUser:0];
  -[TabDocument _donateCurrentPageLoad]((uint64_t)self);
  -[TabDocument _notifyImpressionAnalyticsRecorderIfNeededTabDocumentDidBecomeActive:]((uint64_t)self, 0);
  [(TabDocument *)self validateExtensionToolbarItems];
  if (!self->_isNavigatingViaNormalReload
    && !self->_isNavigatingViaReloadFromOrigin
    && [(TabDocument *)self isPrivateBrowsingEnabled])
  {
    self->_canShowPrivateBrowsingPrivacyProtectionsBanner = 1;
  }
  BOOL v34 = [v31 URL];
  char v35 = objc_msgSend(v34, "safari_hasSameSiteAsURL:", self->_previousWebPageURLBeforeNavigation);

  if ((v35 & 1) == 0)
  {
    self->_didAlreadyShowPrivateBrowsingPrivacyProtectionsBannerForDomain = 0;
    self->_hasEnteredScribbleMode = 0;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v36 = (void *)[(NSHashTable *)self->_navigationObservers copy];
  uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v51 != v38) {
          objc_enumerationMutation(v36);
        }
        int v40 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v40 tabDocumentDidCommitNavigation:self];
        }
      }
      uint64_t v37 = [v36 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v37);
  }

  int v41 = objc_msgSend(v49, "safari_URLByReplacingSchemeWithString:", *MEMORY[0x1E4F3B1A0]);
  uint64_t v42 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
  id v43 = [v42 activeSiriReaderSessionURL];
  if ([v41 isEqual:v43])
  {
    char v44 = objc_msgSend(v49, "safari_isEqualToURL:", self->_previousWebPageURLBeforeNavigation);

    if ((v44 & 1) == 0) {
      goto LABEL_69;
    }
  }
  else
  {
  }
  [(TabDocument *)self dismissSiriReaderMediaSessionImmediately:0];
LABEL_69:
  [(TabDocument *)self updateShowsSiriReaderPlayingIcon];
  [(WBSPageContextDataFetcher *)self->_pageContextDataFetcher clearExtractedSchemaData];
  [(WBSBrowsingAssistantController *)self->_assistantController clearAssistantResult];
}

void __43__TabDocument_webView_didCommitNavigation___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tabController];
  [v1 saveStateInBackground:1 needsValidate:1];
}

void __43__TabDocument_webView_didCommitNavigation___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    -[TabDocument _checkForHighlight](*(void *)(a1 + 32));
  }
}

- (void)_donateCurrentPageLoad
{
  if (a1 && *(unsigned char *)(a1 + 896))
  {
    uint64_t v2 = [(id)a1 isSearchPage];
    int v3 = [*(id *)(a1 + 88) loadedUsingDesktopUserAgent];
    uint64_t v4 = *(void *)(a1 + 768);
    id v5 = [MEMORY[0x1E4F989B0] sharedManager];
    objc_msgSend(v5, "donatePageLoadWithUserAgent:wasSearch:wasPrivateBrowsing:wasActualized:provenance:", v3 ^ 1u, v2, objc_msgSend((id)a1, "isPrivateBrowsingEnabled"), objc_msgSend((id)a1, "nextLoadComesFromSearchPage"), v4);
  }
}

- (void)_webView:(id)a3 navigation:(id)a4 didFailProvisionalLoadInSubframe:(id)a5 withError:(id)a6
{
}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  self->_didFinishDocumentLoad = 1;
  [(_SFFormAutoFillController *)self->_autoFillController prefillFormsSoonIfNeeded];
}

- (void)removeAutomaticPasswordButton
{
}

- (void)automaticPasswordSheetDismissed
{
}

- (void)userDeclinedAutomaticStrongPasswordForCurrentDomainOnTabWithUUID:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(TabDocument *)self committedURL];
  id v5 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");

  id v6 = [(TabDocument *)self uuid];
  int v7 = [v8 isEqual:v6];

  if (v7) {
    objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, v5);
  }
}

- (NSString)currentStrongPassword
{
  return (NSString *)[(_SFFormAutoFillController *)self->_autoFillController currentStrongPassword];
}

- (NSString)defaultStrongPassword
{
  return (NSString *)[(_SFFormAutoFillController *)self->_autoFillController defaultStrongPassword];
}

- (NSString)alphanumericStrongPassword
{
  return (NSString *)[(_SFFormAutoFillController *)self->_autoFillController alphanumericStrongPassword];
}

- (void)replaceCurrentPasswordWithPassword:(id)a3
{
}

- (void)makeStrongPasswordFieldViewableAndEditable:(BOOL)a3
{
}

- (void)copyCurrentStrongPassword
{
}

- (void)_willCommitPreviewViewController:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v11 = v3;
    [v3 willCommitPreviewedWebView];
    uint64_t v4 = [v11 previewTabDocument];
    id v5 = [v4 webView];

    [v5 _setAddsVisitedLinks:1];
    id v6 = [v5 _unreachableURL];

    if (v6)
    {
      [a1[159] webViewDidCommitErrorPagePreview:v5];
    }
    else
    {
      int v7 = [v5 URL];

      if (v7)
      {
        id v8 = [a1 history];
        uint64_t v9 = [v8 visitedLinkStore];
        id v10 = [v5 URL];
        [v9 addVisitedLinkWithURL:v10];
      }
    }

    id v3 = v11;
  }
}

- (void)_didCommitPreviewViewController:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 previewTabDocument];
    id v5 = [v4 webView];

    [v5 _setAllowsMediaDocumentInlinePlayback:0];
    id v3 = v6;
  }
}

- (id)tabDocumentForPreviewURL:(void *)a3 relatedToWebView:
{
  id v4 = a3;
  if (a1)
  {
    id v5 = [a1 createWebViewConfiguration];
    [v5 _setRelatedWebView:v4];
    id v6 = [v4 configuration];
    int v7 = [v6 websiteDataStore];
    [v5 setWebsiteDataStore:v7];

    id v8 = objc_alloc((Class)objc_opt_class());
    id WeakRetained = objc_loadWeakRetained(a1 + 120);
    id v10 = (void *)[v8 _initWithBrowserController:WeakRetained configuration:v5];

    objc_msgSend(v10, "setNextLoadComesFromSearchPage:", objc_msgSend(a1, "isSearchPage"));
    id v11 = [v10 webView];
    objc_msgSend(v11, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v11 _setAddsVisitedLinks:0];
    [v11 _setAllowsMediaDocumentInlinePlayback:1];
    uint64_t v12 = [a1 sessionState];
    [v10 restoreSessionState:v12 andNavigate:0];
    id v13 = objc_loadWeakRetained(a1 + 152);
    [v13 tabDocument:a1 didCreatePreviewDocument:v10];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_webView:(id)a3 gestureRecognizerCouldPinch:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v7 = [WeakRetained tabCollectionViewProvider];
  id v8 = [v7 tabSwitcherViewController];
  id v9 = [v8 pinchGestureRecognizer];

  if (v9 == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    id v10 = [WeakRetained tabViewPinchRecognizer];
    BOOL v11 = v10 == v5;
  }
  return v11;
}

- (BOOL)_webView:(id)a3 gestureRecognizerCanBePreventedByTouchEvents:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)keyboardWillHide:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E4F97EA0], "isPasswordsAppInstalled", a3))
  {
    autoFillController = self->_autoFillController;
    [(_SFFormAutoFillController *)autoFillController makeStrongPasswordFieldViewableAndEditable:0];
  }
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  id v9 = (void (**)(id, void *))a5;
  id v8 = [MEMORY[0x1E4F3AFC0] contextMenuConfigurationForWebView:a3 elementInfo:a4 handler:self];
  v9[2](v9, v8);
}

- (id)_webView:(id)a3 contextMenuContentPreviewForElement:(id)a4
{
  id v4 = [MEMORY[0x1E4F3AFC0] contextMenuContentPreviewForWebView:a3 elementInfo:a4 handler:self];
  return v4;
}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = [v7 previewViewController];
  objc_opt_class();
  [v7 setPreferredCommitStyle:objc_opt_isKindOfClass() & 1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__TabDocument__webView_contextMenuForElement_willCommitWithAnimator___block_invoke;
  v10[3] = &unk_1E6D79060;
  id v9 = v6;
  id v11 = v9;
  [v7 addAnimations:v10];
}

void __69__TabDocument__webView_contextMenuForElement_willCommitWithAnimator___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F3AFC0] linkPreviewHelperForWebView:*(void *)(a1 + 32)];
  [v1 commitPreviewViewController];
}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentDidDimissPreviewedDocument:self];
}

- (void)willDismissLinkPreviewViewController
{
  [MEMORY[0x1E4F3AFC0] invalidateLinkPreviewHelperForWebView:self->_webView];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentDidDimissPreviewedDocument:self];
}

- (id)linkPreviewHelper:(id)a3 previewViewControllerForURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 webView];
  id v10 = -[TabDocument tabDocumentForPreviewURL:relatedToWebView:]((id *)&self->super.isa, v9, v8);

  id v11 = [[LinkPreviewViewController alloc] initWithTabDocument:v10];
  uint64_t v12 = [(TabDocument *)self view];
  id v13 = [v12 geometryProvider];
  [v13 obscuredScrollViewInsetsForTabDocumentView:v12 unobscuredSafeAreaInsets:0];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  char v22 = [(LinkPreviewViewController *)v11 browserView];
  objc_msgSend(v22, "setObscuredInsets:", v15, v17, v19, v21);

  BOOL v23 = [(TabDocument *)self supportsAdvancedPrivacyProtectionsForURL:v7];
  id v24 = [v10 reloadOptionsController];
  [v24 setSupportsAdvancedPrivacyProtections:v23];

  if ([(_SFReloadOptionsController *)self->_reloadOptionsController loadedUsingDesktopUserAgent])
  {
    char v25 = [v10 reloadOptionsController];
    [v25 requestDesktopSiteWithURL:v7];
  }
  else
  {
    id v26 = (id)[v10 loadURL:v7 userDriven:1];
  }
  int v27 = [(LinkPreviewViewController *)v11 previewHeader];
  [v6 setActiveLinkPreviewHeader:v27];

  return v11;
}

- (void)linkPreviewHelper:(id)a3 commitPreviewViewControllerForAction:(int64_t)a4 withTabOrder:(int64_t)a5
{
  id v17 = a3;
  id v8 = [v17 previewContentViewController];
  uint64_t v9 = v8;
  if (a4 == 2)
  {
    -[TabDocument _commitPreviewedViewControllerInSafari:]((id *)&self->super.isa, v8);
  }
  else if (a4 == 3)
  {
    if (a5 != 1)
    {
      id v10 = [v8 previewTabDocument];
      [v10 setUpBackClosesSpawnedTabWithParent:self];
    }
    -[TabDocument _willCommitPreviewViewController:]((id *)&self->super.isa, v9);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (a5 == 2)
    {
      BOOL v12 = 1;
    }
    else if (a5)
    {
      BOOL v12 = 0;
    }
    else
    {
      BOOL v12 = [MEMORY[0x1E4F78590] defaultTabOrder] == 2;
    }
    [WeakRetained tabDocumentCommitPreviewedDocumentAsNewTab:self inBackground:v12];

    if ([MEMORY[0x1E4F78590] defaultTabOrder] == 2)
    {
      id v13 = objc_loadWeakRetained((id *)&self->_browserController);
      double v14 = [v13 tabCollectionViewProvider];
      char v15 = [v14 hasTabBar];

      if ((v15 & 1) == 0)
      {
        double v16 = [v17 elementInfo];
        [(TabDocument *)self animateElement:v16 toBarItem:8];
      }
    }
  }
}

- (void)_commitPreviewedViewControllerInSafari:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    -[TabDocument _willCommitPreviewViewController:](a1, v4);
    id WeakRetained = objc_loadWeakRetained(a1 + 152);
    [WeakRetained tabDocumentCommitPreviewedDocument:a1];

    -[TabDocument _didCommitPreviewViewController:]((uint64_t)a1, v4);
  }
}

- (BOOL)linkPreviewHelper:(id)a3 supportsAction:(int64_t)a4 forURL:(id)a5
{
  id v6 = a5;
  if (a4)
  {
    char v7 = 1;
  }
  else
  {
    id v8 = +[FeatureManager sharedFeatureManager];
    if ([v8 isReadingListAvailable]) {
      char v7 = [MEMORY[0x1E4FB6098] supportsURL:v6];
    }
    else {
      char v7 = 0;
    }
  }
  return v7;
}

- (id)linkPreviewHelper:(id)a3 resultOfLoadingURL:(id)a4
{
  id v4 = [(TabDocument *)self resultOfLoadingURL:a4];
  return v4;
}

- (void)linkPreviewHelper:(id)a3 redirectToExternalNavigationResult:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F18DA8];
  id v9 = v5;
  char v7 = [v5 URL];
  id v8 = objc_msgSend(v6, "safari_nonAppInitiatedRequestWithURL:", v7);
  -[TabDocument _redirectToExternalNavigationResult:fromOriginalRequest:navigationAction:promptPolicy:isMainFrame:userAction:]((uint64_t)self, v9, v8, 0, 0, 1, 0);
}

- (void)linkPreviewHelper:(id)a3 didProduceNavigationIntent:(id)a4 forAction:(int64_t)a5
{
  id v13 = a3;
  id v8 = a4;
  [(TabDocument *)self dispatchNavigationIntent:v8];
  if (a5 == 3 && [MEMORY[0x1E4F78590] defaultTabOrder] == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v10 = [WeakRetained tabCollectionViewProvider];
    char v11 = [v10 hasTabBar];

    if ((v11 & 1) == 0)
    {
      BOOL v12 = [v13 elementInfo];
      [(TabDocument *)self animateElement:v12 toBarItem:8];
    }
  }
}

- (void)linkPreviewHelperWillBeginDownload:(id)a3
{
  id v4 = [a3 elementInfo];
  -[TabDocument animateElementToDownloadsBarItemSoon:](self, "animateElementToDownloadsBarItemSoon:");
}

- (void)linkPreviewHelper:(id)a3 addURLToReadingList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__TabDocument_linkPreviewHelper_addURLToReadingList___block_invoke;
  v11[3] = &unk_1E6D79970;
  id v12 = v6;
  id v13 = v7;
  double v14 = self;
  id v9 = v7;
  id v10 = v6;
  [WeakRetained showReadingListAutomaticArchiveAlertIfNeededWithCompletion:v11];
}

void __53__TabDocument_linkPreviewHelper_addURLToReadingList___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  uint64_t v2 = [*(id *)(a1 + 32) elementInfo];
  id v3 = [v2 title];

  if (![v3 length])
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 40), "safari_userVisibleString");

    id v3 = (void *)v4;
  }
  if (-[WebBookmarkCollection saveReadingListBookmarkWithTitle:address:](v8, v3, *(void **)(a1 + 40)))
  {
    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v5 didAddReadingListItemWithMethod:0];

    id v6 = *(void **)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) elementInfo];
    [v6 animateElement:v7 toBarItem:3];
  }
}

- (void)linkPreviewHelperWillOpenUniversalLinkLocally:(id)a3
{
  self->_shouldRevealAppLinkBannerForNextCommit = 1;
}

- (void)linkPreviewHelperWillDisableLinkPreview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentWillDisableLinkPreview];
}

- (id)previewViewControllerForURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F3AFC0];
  webView = self->_webView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v8 = [WeakRetained scene];
  id v9 = [v8 keyWindow];
  [v9 bounds];
  id v10 = objc_msgSend(v5, "previewViewControllerWebView:windowBounds:url:handler:", webView, v4, self);

  return v10;
}

- (void)commitPreviewViewController:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__TabDocument_commitPreviewViewController___block_invoke;
  v3[3] = &unk_1E6D79060;
  void v3[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
}

void __43__TabDocument_commitPreviewViewController___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F3AFC0] linkPreviewHelperForWebView:*(void *)(*(void *)(a1 + 32) + 1032)];
  [v1 commitPreviewViewController];
}

- (_SFWebClipMetadataFetcher)webClipMetadataFetcher
{
  webClipMetadataFetcher = self->_webClipMetadataFetcher;
  if (!webClipMetadataFetcher)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F3B0B0]);
    id v5 = [(TabDocument *)self activityJSController];
    id v6 = (_SFWebClipMetadataFetcher *)[v4 initWithInjectedJavascriptController:v5];
    id v7 = self->_webClipMetadataFetcher;
    self->_webClipMetadataFetcher = v6;

    webClipMetadataFetcher = self->_webClipMetadataFetcher;
  }
  return webClipMetadataFetcher;
}

- (void)touchIconFetcher
{
  if (a1)
  {
    uint64_t v2 = a1;
    id v3 = (void *)a1[15];
    if (!v3)
    {
      id v4 = [[TouchIconFetcher alloc] initWithWebView:a1[129]];
      id v5 = (void *)v2[15];
      v2[15] = v4;

      id v3 = (void *)v2[15];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)getApplicationManifestWithCompletionHandler:(id)a3
{
  id v4 = a3;
  applicationManifestFetcher = self->_applicationManifestFetcher;
  id v8 = v4;
  if (!applicationManifestFetcher)
  {
    id v6 = (WBSApplicationManifestFetcher *)[objc_alloc(MEMORY[0x1E4F98960]) initWithWebView:self->_webView];
    id v7 = self->_applicationManifestFetcher;
    self->_applicationManifestFetcher = v6;

    applicationManifestFetcher = self->_applicationManifestFetcher;
    id v4 = v8;
  }
  [(WBSApplicationManifestFetcher *)applicationManifestFetcher getApplicationManifestWithCompletionHandler:v4];
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v55 = a3;
  id v6 = a4;
  objc_initWeak(location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  *(_WORD *)&self->_isNavigatingViaNormalReload = 0;
  long long v52 = v6;
  uint64_t v54 = WeakRetained;
  [(_SFWebView *)self->_webView setObscuringContents:0];
  self->_contentIsReadyForSnapshot = 1;
  id v8 = [(TabDocument *)self expectedOrCurrentURL];
  urlForDisplayedContent = self->_urlForDisplayedContent;
  self->_urlForDisplayedContent = v8;

  [(_SFPageLoadErrorController *)self->_pageLoadErrorController scheduleResetCrashCount];
  -[TabDocument _didFinishLoading]((uint64_t)self);
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  [(WBSFluidProgressController *)self->_fluidProgressController finishFluidProgressWithProgressStateSource:self];
  id v10 = [WeakRetained tabController];
  [v10 saveTabDocumentUserActivitySoon:self];

  char v11 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v11 reportTabUpdatedWithUpdateType:0];

  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __43__TabDocument_webView_didFinishNavigation___block_invoke;
  v62[3] = &unk_1E6D79768;
  objc_copyWeak(&v63, location);
  [v55 _doAfterNextPresentationUpdate:v62];
  [(TabDocument *)self updateAccessibilityIdentifier];
  kdebug_trace();
  pageLoadStatistics = self->_pageLoadStatistics;
  if (pageLoadStatistics) {
    [(PageLoadTestStatistics *)pageLoadStatistics finishedNavigation:v6];
  }
  id v13 = [v6 _request];
  double v14 = objc_getAssociatedObject(v13, (const void *)kWebClipToNSURLRequestAssociationKey);

  char v15 = [(TabDocument *)self urlForSharing];
  long long v51 = v15;
  if (v14)
  {
    if (![v14 configurationIsManaged]
      || ([v14 iconImagePath], double v16 = objc_claimAutoreleasedReturnValue(), v16, !v16))
    {
      -[TabDocument _updateSnapshotForWebClip:](self, v14);
      id v17 = [(TabDocument *)self webClipMetadataFetcher];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __43__TabDocument_webView_didFinishNavigation___block_invoke_2;
      v59[3] = &unk_1E6D7D988;
      id v60 = v14;
      id v61 = v15;
      [v17 fetchMetadataWithConsumer:v59];
    }
  }
  double v18 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  long long v53 = [v18 touchIconCache];

  double v19 = [(WebBookmark *)self->_bookmarkForIconFetching address];
  if (v19)
  {
    double v20 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v19);
    double v21 = v20;
    if (!v20) {
      goto LABEL_15;
    }
    char v22 = [v20 host];
    BOOL v23 = objc_msgSend(v22, "safari_domainFromHost");
    id v24 = [(_SFWebView *)self->_webView _committedURL];
    char v25 = [v24 host];
    id v26 = objc_msgSend(v25, "safari_domainFromHost");
    if ([v23 isEqualToString:v26])
    {
      int v27 = [v53 shouldRequestTouchIconForWebPageNavigationFromBookmarkInteractionForURL:v21];

      if (!v27) {
        goto LABEL_15;
      }
      bookmarkForIconFetching = self->_bookmarkForIconFetching;
      self->_bookmarkForIconFetching = 0;

      uint64_t v29 = -[TabDocument touchIconFetcher](self);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __43__TabDocument_webView_didFinishNavigation___block_invoke_3;
      v56[3] = &unk_1E6D79560;
      id v57 = v53;
      id v58 = v21;
      [v29 fetchTouchIconURLsWithCompletion:v56];

      char v22 = v57;
    }
    else
    {
    }
  }
  else
  {
    double v21 = 0;
  }
LABEL_15:
  if ([(_SFBrowserConfiguration *)self->_configuration allowsUserActivityFeedback])
  {
    id v30 = (WBSPageContextDataFetcher *)objc_alloc_init(MEMORY[0x1E4F98C58]);
    pageContextDataFetcher = self->_pageContextDataFetcher;
    self->_pageContextDataFetcher = v30;

    [(WBSPageContextDataFetcher *)self->_pageContextDataFetcher setDelegate:self];
    uint64_t v32 = self->_pageContextDataFetcher;
    char v33 = [(TabDocument *)self webView];
    [(WBSPageContextDataFetcher *)v32 fetchSchemaDataForWebView:v33];
  }
  if (![(TabDocument *)self isPrivateBrowsingEnabled])
  {
    reloadOptionsController = self->_reloadOptionsController;
    char v35 = [v55 URL];
    [(_SFReloadOptionsController *)reloadOptionsController logCompletedPageloadToDifferentialPrivacy:v35];
  }
  if ([(TabDocument *)self isPDFDocument])
  {
    quickLookDocument = self->_quickLookDocument;
    uint64_t v37 = [(TabDocument *)self suggestedFilenameForDisplayedPDF];
    [(SFQuickLookDocument *)quickLookDocument setFileNameForPDFDocument:v37];
  }
  uint64_t v38 = [MEMORY[0x1E4F97E48] sharedLogger];
  uint64_t v39 = [v54 sidebarUIProxy];
  objc_msgSend(v38, "didRequestPageShowingSideBar:", objc_msgSend(v39, "isShowingSidebar"));

  -[TabDocument _donateTextSoon]((id *)&self->super.isa);
  int v40 = [MEMORY[0x1E4F98A08] sharedManager];
  int v41 = [v55 URL];
  uint64_t v42 = [v41 host];
  objc_msgSend(v40, "clearCertificateBypassesForHostIfNecessary:withTrust:", v42, objc_msgSend(v55, "serverTrust"));

  id v43 = [MEMORY[0x1E4F1C9C8] now];
  dateOfLastFinishedNavigation = self->_dateOfLastFinishedNavigation;
  self->_dateOfLastFinishedNavigation = v43;

  int v45 = [(TabDocument *)self URL];
  previousWebPageURLBeforeNavigation = self->_previousWebPageURLBeforeNavigation;
  self->_previousWebPageURLBeforeNavigation = v45;

  if (!self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad
    && ![(TabDocument *)self isPrivateBrowsingEnabled])
  {
    uint64_t v47 = [MEMORY[0x1E4F98BB8] sharedController];
    id v48 = [(TabDocument *)self URL];
    id v49 = [v48 host];
    long long v50 = -[TabDocument profileIdentifier]((uint64_t)self);
    [v47 removeIgnoredSiriSuggestedSitesWithURLHost:v49 inProfile:v50];
  }
  self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad = 0;

  objc_destroyWeak(&v63);
  objc_destroyWeak(location);
}

void __43__TabDocument_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [WeakRetained setNeedsNewTabSnapshot];
    -[TabDocument _updateSnapshotIfNeeded]((uint64_t)WeakRetained);
  }
}

uint64_t __43__TabDocument_webView_didFinishNavigation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) updateCustomMediaLocationsWithWebClipLinkTags:a3 baseURL:*(void *)(a1 + 40)];
}

uint64_t __43__TabDocument_webView_didFinishNavigation___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cacheFirstAvailableTouchIcon:a2 forURL:*(void *)(a1 + 40)];
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v17 = a4;
  id v7 = a5;
  [(_SFWebView *)self->_webView setObscuringContents:0];
  self->_contentIsReadyForSnapshot = 1;
  [(TabDocument *)self updateAccessibilityIdentifier];
  id v8 = [(TabDocument *)self expectedOrCurrentURL];
  urlForDisplayedContent = self->_urlForDisplayedContent;
  self->_urlForDisplayedContent = v8;

  if ([v7 code] != 204
    || ([v7 domain],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqualToString:*MEMORY[0x1E4F46810]],
        v10,
        (v11 & 1) == 0))
  {
    objc_storeStrong((id *)&self->_lastLoadError, a5);
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    -[TabDocument _didFinishLoading]((uint64_t)self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v13 = [WeakRetained tabController];
    [v13 saveTabDocumentUserActivitySoon:self];

    double v14 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v14 reportTabUpdatedWithUpdateType:0];

    pageLoadStatistics = self->_pageLoadStatistics;
    if (pageLoadStatistics) {
      [(PageLoadTestStatistics *)pageLoadStatistics failedNavigation:v17 withError:v7];
    }
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;
  }
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = [v7 protectionSpace];
  id v10 = [v9 authenticationMethod];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F18CB8]];

  if (v11)
  {
    if ([(TabDocument *)self isControlledByAutomation])
    {
      id v12 = +[Application sharedApplication];
      id v13 = [v12 automationController];
      double v14 = [v13 automationSession];
      char v15 = [v14 configuration];
      int v16 = [v15 acceptInsecureCertificates];

      if (v16) {
        goto LABEL_10;
      }
    }
    char v22 = [MEMORY[0x1E4F98A08] sharedManager];
    BOOL v23 = [v7 protectionSpace];
    int v24 = objc_msgSend(v22, "didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:inPrivateBrowsing:", v23, -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"));

    if (v24)
    {
LABEL_10:
      char v25 = (void *)MEMORY[0x1E4F18D88];
      double v19 = [v7 protectionSpace];
      id v26 = objc_msgSend(v25, "credentialForTrust:", objc_msgSend(v19, "serverTrust"));
      v8[2](v8, 0, v26);

LABEL_16:
      goto LABEL_17;
    }
    double v28 = [v7 protectionSpace];
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController setProtectionSpaceForInvalidCertificateBypass:v28];

    uint64_t v27 = 3;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v18 = [WeakRetained tabDocumentShouldHandleAuthentication:self];

    if (v18)
    {
      double v19 = [v7 protectionSpace];
      if (objc_msgSend(v19, "_sf_canAuthenticate"))
      {
        double v20 = [v19 authenticationMethod];
        int v21 = [v20 isEqualToString:*MEMORY[0x1E4F18C78]];

        if (v21)
        {
          [(_SFPageLoadErrorController *)self->_pageLoadErrorController handleClientCertificateAuthenticationChallenge:v7 completionHandler:v8];
        }
        else
        {
          dialogController = self->_dialogController;
          id v30 = (void *)MEMORY[0x1E4F78270];
          int v31 = [(_SFWebView *)self->_webView _committedURL];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke;
          v36[3] = &unk_1E6D7D9B0;
          uint64_t v37 = v8;
          uint64_t v32 = [v30 authenticationDialogWithAuthenticationChallenge:v7 committedURL:v31 completionHandler:v36];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2;
          v34[3] = &unk_1E6D791E8;
          v34[4] = self;
          id v35 = v7;
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_3;
          v33[3] = &unk_1E6D79060;
          v33[4] = self;
          [(SFDialogController *)dialogController presentDialog:v32 animateAlongsidePresentation:v34 dismissal:v33];
        }
      }
      else
      {
        v8[2](v8, 3, 0);
      }
      goto LABEL_16;
    }
    uint64_t v27 = 2;
  }
  v8[2](v8, v27, 0);
LABEL_17:
}

uint64_t __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) failureResponse];
  uint64_t v3 = [v2 URL];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = v3;

  if ([*(id *)(a1 + 32) isShowingReader])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
    [WeakRetained hideReaderForTabDocument:*(void *)(a1 + 32) animated:0 deactivationMode:0];
  }
  -[TabDocument _updateNavigationBarItem](*(void *)(a1 + 32));
  id v7 = *(void **)(a1 + 32);
  return [v7 updateTabTitle];
}

uint64_t __75__TabDocument_webView_didReceiveAuthenticationChallenge_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 192);
  *(void *)(v2 + 192) = 0;

  -[TabDocument _updateNavigationBarItem](*(void *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 updateTabTitle];
}

- (void)_webView:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  id v10 = +[Application sharedApplication];
  int v11 = [v10 legacyTLSHostManager];
  id v12 = [v8 protectionSpace];
  id v13 = [v12 host];
  uint64_t v14 = [v11 isLegacyTLSAllowedForHost:v13];

  if ((v14 & 1) == 0)
  {
    char v15 = [v8 protectionSpace];
    int v16 = objc_msgSend(v15, "safari_URL");
    id v17 = [v16 absoluteString];
    char v18 = [v28 _unreachableURL];
    double v19 = [v18 absoluteString];
    char v20 = [v17 isEqualToString:v19];

    if ((v20 & 1) == 0)
    {
      pageLoadErrorController = self->_pageLoadErrorController;
      char v22 = [v8 protectionSpace];
      BOOL v23 = objc_msgSend(v22, "safari_URL");
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      char v25 = [WeakRetained tabController];
      id v26 = [v25 activeTabDocument];
      uint64_t v27 = [v26 URL];
      [(_SFPageLoadErrorController *)pageLoadErrorController handleLegacyTLSWithFailingURL:v23 clickThroughURL:v27 authenticationChallenge:v8];
    }
  }
  v9[2](v9, v14);
}

- (void)_webView:(id)a3 didNegotiateModernTLSForURL:(id)a4
{
  id v7 = a4;
  uint64_t v4 = +[Application sharedApplication];
  id v5 = [v4 legacyTLSHostManager];
  id v6 = [v7 host];
  [v5 clearLegacyTLSForHostIfPresent:v6];
}

- (void)_webView:(id)a3 navigation:(id)a4 didSameDocumentNavigation:(int64_t)a5
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v28 = v7;
  [(_SFFormAutoFillController *)self->_autoFillController offerToSaveUnsubmittedFormDataIfNeededInWebView:v7 fromSameDocumentNavigationOfType:a5];
  if (([(_SFWebView *)self->_webView isLoading] & 1) == 0)
  {
    [(WBSFluidProgressController *)self->_fluidProgressController cancelFluidProgressWithProgressStateSource:self];
    -[TabDocument _didFinishLoading]((uint64_t)self);
  }
  id v9 = [(TabDocument *)self browserController];
  id v10 = [v9 activeSearchEngine];

  uint64_t v27 = v10;
  id v26 = [(TabDocument *)self committedURL];
  int v11 = [v10 urlIsValidSearch:v26];
  if (a5 == 1)
  {
    int v12 = v11;
    id v13 = +[WBSParsecDSession sharedPARSession];
    uint64_t v14 = [WeakRetained idOfParsecQueryOriginatingFromSearchSuggestion];
    if (v14)
    {
      char v15 = [(_SFWebView *)self->_webView backForwardList];
      int v16 = [v15 backItem];
      id v17 = [v16 URL];
      int v18 = [v10 urlIsValidSearch:v17];

      if (((v18 ^ 1 | v12) & 1) == 0) {
        [v13 sendCBAEngagementFeedback:v26 query:v14];
      }
    }
    [WeakRetained clearParsecQueryOriginatingFromSearchSuggestion];
  }
  sameDocumentNavigationToHistoryVisitCorrelator = self->_sameDocumentNavigationToHistoryVisitCorrelator;
  char v20 = [v28 URL];
  int v21 = [(WBSSameDocumentNavigationToHistoryVisitCorrelator *)sameDocumentNavigationToHistoryVisitCorrelator visitForSameDocumentNavigationToURL:v20];

  if (v21)
  {
    char v22 = +[History sharedHistory];
    [v22 addAttributes:1 toVisit:v21];
  }
  if ([WeakRetained isShowingReader]
    && a5
    && self->_active
    && self->_shouldDismissReaderInReponseToSameDocumentNavigation)
  {
    [WeakRetained hideReaderForTabDocument:self animated:0 deactivationMode:0];
    [(TabDocument *)self clearReaderContext];
  }
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  -[TabDocument _clearAppBannerIfNotCurrentStoreBannerDeferringRemoval:]((uint64_t)self, 1);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __61__TabDocument__webView_navigation_didSameDocumentNavigation___block_invoke;
  v29[3] = &unk_1E6D793E8;
  v29[4] = self;
  -[TabDocument _checkForAppLinkWithCompletion:]((uint64_t)self, v29);
  [(TabDocument *)self applyHighlightFromNotesIfNeeded];
  -[TabDocument _clearCachedCanonicalURL]((uint64_t)self);
  BOOL v23 = [(TabDocument *)self expectedOrCurrentURL];
  if (a5 == 2)
  {
    if (([(NSURL *)self->_originalURL isEqual:v23] & 1) == 0)
    {
      int v24 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
      char v25 = [v24 faviconProvider];
      objc_msgSend(v25, "linkIconFromPageURL:toCurrentPageURL:isPrivate:completionHandler:", self->_originalURL, v23, -[TabDocument isPrivateBrowsingEnabled](self, "isPrivateBrowsingEnabled"), 0);
    }
  }
  else if ((unint64_t)(a5 - 1) > 1)
  {
    goto LABEL_21;
  }
  if (([(NSURL *)self->_originalURL isEqual:v23] & 1) == 0) {
    [(TabDocument *)self donateSameDocumentNavigationIfNecessary];
  }
LABEL_21:
}

void __61__TabDocument__webView_navigation_didSameDocumentNavigation___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    -[TabDocument _checkForHighlight](*(void *)(a1 + 32));
  }
}

- (void)_webViewWebProcessDidCrash:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_closed) {
    goto LABEL_25;
  }
  [(SFDialogController *)self->_dialogController owningWebViewDidChangeProcessID];
  [(_SFPageLoadErrorController *)self->_pageLoadErrorController clearCrashCountResetTimer];
  -[TabDocument setMediaStateIcon:]((uint64_t)self, 0);
  pageLoadTest = self->_pageLoadTest;
  if (pageLoadTest) {
    [(PageLoadTest *)pageLoadTest resetAfterWebProcessCrash];
  }
  if (!self->_active)
  {
    [(TabDocument *)self hibernate];
    [(TabDocument *)self setHibernatedDueToMemoryWarning:1];
    +[Application postTestNotificationName:@"WebProcessDidCrashNotification" object:self];
    goto LABEL_25;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v7 = [(TabDocument *)self URL];
  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
  }
  else
  {
    id v9 = [(_SFWebView *)self->_webView backForwardList];
    id v10 = [v9 currentItem];
    id v7 = [v10 URL];

    id v8 = (void *)MEMORY[0x1E4F28C58];
    if (!v7)
    {
      int v11 = 0;
      char v12 = 1;
      goto LABEL_10;
    }
  }
  uint64_t v22 = *MEMORY[0x1E4F289B0];
  v23[0] = v7;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  char v12 = 0;
LABEL_10:
  id v13 = [v8 errorWithDomain:@"com.apple.mobilesafari" code:0 userInfo:v11];
  if ((v12 & 1) == 0) {

  }
  pageLoadErrorController = self->_pageLoadErrorController;
  char v15 = [(TabDocument *)self URLString];
  LODWORD(pageLoadErrorController) = [(_SFPageLoadErrorController *)pageLoadErrorController updateCrashesAndShowCrashError:v13 URLString:v15];

  if (pageLoadErrorController)
  {
    [WeakRetained setShowingCrashBanner:0 animated:1];
  }
  else
  {
    if ((v12 & 1) == 0)
    {
      if (([WeakRetained isSuspendedOrSuspending] & 1) == 0 && !self->_suppressCrashBanner) {
        [WeakRetained setShowingCrashBanner:1 animated:1];
      }
      if (!self->_unresponsiveWebProcessBlock)
      {
        int v16 = [v4 _committedURL];
        int v17 = [v16 isEqual:v7];

        if (v17)
        {
          id v18 = (id)[v4 reload];
        }
        else
        {
          double v19 = [MEMORY[0x1E4F18DA8] requestWithURL:v7];
          char v20 = -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:](self, v19);

          id v21 = [(LoadingController *)self->_loadingController loadRequest:v20 userDriven:0 shouldOpenExternalURLs:0];
        }
      }
    }
    [(TabDocument *)self updateAccessibilityIdentifier];
  }

LABEL_25:
}

- (void)_webCryptoMasterKeyForWebView:(id)a3 completionHandler:(id)a4
{
}

- (void)_webView:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5
{
  char v12 = (NSString *)a4;
  id v7 = a5;
  id v8 = objc_alloc(MEMORY[0x1E4F78338]);
  if (self->_suggestedFilenameForNextCommit) {
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
  }
  else {
    suggestedFilenameForNextCommit = v12;
  }
  id v10 = (SFQuickLookDocumentWriter *)[v8 initWithFileName:suggestedFilenameForNextCommit uti:v7];
  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = v10;
}

- (void)_webView:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4
{
  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__TabDocument__webView_didFinishLoadForQuickLookDocumentInMainFrame___block_invoke;
  v5[3] = &unk_1E6D79FE0;
  void v5[4] = self;
  [(SFQuickLookDocumentWriter *)quickLookDocumentWriter writeDataAndClose:a4 completionHandler:v5];
}

void __69__TabDocument__webView_didFinishLoadForQuickLookDocumentInMainFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
  [WeakRetained updateInterface];
}

- (void)_webViewDidBeginNavigationGesture:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_navigationObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "tabDocumentDidBeginNavigationGesture:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_webViewWillEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  if (v7 && [(TabDocument *)self canGoBackToParentTab]) {
    self->_gestureRequiresGoBackToParentTab = 1;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = self->_navigationObservers;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "tabDocumentWillEndNavigationGesture:withNavigationToBackForwardListItem:", self, v7, (void)v13);
        }
      }
      uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_webViewDidEndNavigationGesture:(id)a3 withNavigationToBackForwardListItem:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_navigationObservers;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "tabDocumentDidEndNavigationGesture:withNavigationToBackForwardListItem:", self, v5, (void)v13);
        }
      }
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if (v5)
  {
    if (self->_gestureRequiresGoBackToParentTab)
    {
      [(TabDocument *)self goBackToParentTab];
      self->_gestureRequiresGoBackToParentTab = 0;
    }
    else
    {
      long long v11 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
      long long v12 = [v11 bookmarkWithID:-[WKBackForwardListItem safari_bookmarkID](v5)];
      [(TabDocument *)self setReadingListBookmark:v12];
    }
  }
}

- (void)_webView:(id)a3 willSnapshotBackForwardListItem:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  -[WKBackForwardListItem safari_setNavigationSnapshotRequiresBars:](v6, [WeakRetained canHideBars] ^ 1);
}

- (void)_webView:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5
{
}

- (void)_webView:(id)a3 didCommitLoadWithRequest:(id)a4 inFrame:(id)a5
{
  if (!self->_disableContentBlockersWhenReloading)
  {
    id v5 = [(TabDocument *)self sfScribbleController];
    [v5 scheduleValidationForHiddenElementsIfNeeded];
  }
}

- (void)_webView:(id)a3 didFailLoadDueToNetworkConnectionIntegrityWithURL:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = -[TabDocument _contentBlockerStatisticsStore](self);
  uint64_t v8 = [v9 URL];
  [v7 recordThirdPartyResourceBlocked:v6 onFirstParty:v8 completionHandler:0];
}

- (void)_webView:(id)a3 didChangeLookalikeCharactersFromURL:(id)a4 toURL:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  uint64_t v8 = [(TabDocument *)self trackerInfo];
  id v9 = [v8 queryParameterFilteringDataQueue];
  [v9 addPendingDataWithAdjustedURL:v7 originalURL:v10];
}

- (void)_webView:(id)a3 requestUserMediaAuthorizationForDevices:(unint64_t)a4 url:(id)a5 mainFrameURL:(id)a6 decisionHandler:(id)a7
{
  id v14 = a5;
  id v11 = a6;
  id v12 = a7;
  long long v13 = [MEMORY[0x1E4F3B0A8] sharedController];
  [v13 requestUserMediaAuthorizationForDevices:a4 url:v14 mainFrameURL:v11 decisionHandler:v12 dialogPresenter:self];
}

- (void)_webView:(id)a3 checkUserMediaPermissionForURL:(id)a4 mainFrameURL:(id)a5 frameIdentifier:(unint64_t)a6 decisionHandler:(id)a7
{
  id v13 = a4;
  id v10 = a5;
  id v11 = a7;
  id v12 = [MEMORY[0x1E4F3B0A8] sharedController];
  [v12 checkUserMediaPermissionForURL:v13 mainFrameURL:v10 frameIdentifier:a6 decisionHandler:v11];
}

- (void)_webView:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4
{
  id v7 = a3;
  if (self && self->_mediaCaptureState != a4)
  {
    self->_mediaCaptureState = a4;
    -[TabDocument mediaStateDidChangeNeedsDelay:]((uint64_t)self);
  }
  id v6 = +[Application sharedApplication];
  [v6 updateShouldLockPrivateBrowsingWithTimerIfNecessary];
}

- (void)_webView:(id)a3 queryPermission:(id)a4 forOrigin:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = objc_msgSend(a5, "safari_userVisibleName");
  if ([v8 isEqualToString:@"geolocation"])
  {
    id v11 = [MEMORY[0x1E4F3AFA0] sharedManager];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke;
    v17[3] = &unk_1E6D7D9D8;
    id v18 = v9;
    [v11 getGeolocationSettingForDomain:v10 completionHandler:v17];
    id v12 = &v18;
  }
  else
  {
    if (([v8 isEqualToString:@"camera"] & 1) == 0
      && ([v8 isEqualToString:@"microphone"] & 1) == 0)
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
      goto LABEL_7;
    }
    id v13 = [MEMORY[0x1E4F3B0A8] sharedController];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke_2;
    v14[3] = &unk_1E6D7DA00;
    id v15 = v8;
    id v16 = v9;
    [v13 getPermissionForOrigin:v10 topLevelOrigin:v10 completionHandler:v14];
    id v12 = &v15;

    id v11 = v16;
  }

LABEL_7:
}

uint64_t __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = WBSUserMediaPermissionToWKPermissionDecision();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __68__TabDocument__webView_queryPermission_forOrigin_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:@"camera"];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v4 = WBSUserMediaPermissionToWKPermissionDecisionCamera();
  }
  else {
    uint64_t v4 = WBSUserMediaPermissionToWKPermissionDecisionMicrophone();
  }
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  return v5(v3, v4);
}

- (void)webView:(id)a3 runJavaScriptAlertPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  id v14 = a4;
  id v8 = (void (**)(void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = [WeakRetained tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:self];

  if (v10)
  {
    if ([(TabDocument *)self isControlledByAutomation])
    {
      id v11 = +[Application sharedApplication];
      id v12 = [v11 automationController];
      [v12 tabDocument:self runJavaScriptAlertPanelWithMessage:v14 completionHandler:v8];
    }
    else
    {
      dialogController = self->_dialogController;
      id v11 = [MEMORY[0x1E4F78270] javaScriptAlertDialogWithMessage:v14 completionHandler:v8];
      [(SFDialogController *)dialogController presentDialog:v11];
    }
  }
  else
  {
    v8[2](v8);
  }
}

- (void)webView:(id)a3 runJavaScriptConfirmPanelWithMessage:(id)a4 initiatedByFrame:(id)a5 completionHandler:(id)a6
{
  id v14 = a4;
  id v8 = (void (**)(id, void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = [WeakRetained tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:self];

  if (v10)
  {
    if ([(TabDocument *)self isControlledByAutomation])
    {
      id v11 = +[Application sharedApplication];
      id v12 = [v11 automationController];
      [v12 tabDocument:self runJavaScriptConfirmPanelWithMessage:v14 completionHandler:v8];
    }
    else
    {
      dialogController = self->_dialogController;
      id v11 = [MEMORY[0x1E4F78270] javaScriptConfirmDialogWithMessage:v14 completionHandler:v8];
      [(SFDialogController *)dialogController presentDialog:v11];
    }
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)webView:(id)a3 runJavaScriptTextInputPanelWithPrompt:(id)a4 defaultText:(id)a5 initiatedByFrame:(id)a6 completionHandler:(id)a7
{
  id v17 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void))a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v13 = [WeakRetained tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:self];

  if (v13)
  {
    if ([(TabDocument *)self isControlledByAutomation])
    {
      id v14 = +[Application sharedApplication];
      id v15 = [v14 automationController];
      [v15 tabDocument:self runJavaScriptTextInputPanelWithPrompt:v17 defaultText:v10 completionHandler:v11];
    }
    else
    {
      dialogController = self->_dialogController;
      id v14 = [MEMORY[0x1E4F78270] javaScriptPromptDialogWithMessage:v17 defaultText:v10 completionHandler:v11];
      [(SFDialogController *)dialogController presentDialog:v14];
    }
  }
  else
  {
    v11[2](v11, 0);
  }
}

- (void)_webView:(id)a3 requestStorageAccessPanelForDomain:(id)a4 underCurrentDomain:(id)a5 completionHandler:(id)a6
{
  id v17 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, void))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v12 = [WeakRetained tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:self];

  if (v12)
  {
    dialogController = self->_dialogController;
    id v14 = (void *)MEMORY[0x1E4F78270];
    id v15 = [(TabDocument *)self webExtensionsController];
    id v16 = [v14 requestStorageAccessDialogForDomain:v17 underCurrentDomain:v9 extensionsController:v15 completionHandler:v10];
    [(SFDialogController *)dialogController presentDialog:v16];
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)_webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a5;
  char v12 = (void (**)(id, void))a7;
  if ([v11 _shouldOpenAppLinks])
  {
    char v13 = [v11 request];
    id v14 = [v13 URL];

    if (objc_msgSend(v14, "safari_isHTTPFamilyURL"))
    {
      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:v14];
      if ([v15 synchronouslyDecideOpenStrategy] == 3 && !self->_wasLoadedWithLockdownModeEnabled)
      {
        [v15 openExternally];
        v12[2](v12, 0);

        goto LABEL_21;
      }
    }
  }
  if ([v11 _isUserInitiated])
  {
    uint64_t v16 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v16 = [WeakRetained popUpPolicyForTabDocument:self];
  }
  id v18 = [v11 _userInitiatedAction];
  char v19 = [v18 isConsumed];

  if (v19)
  {
    uint64_t v16 = 2;
  }
  else if (v16 == 1)
  {
    char v20 = [v11 _userInitiatedAction];
    [v20 consume];

    uint64_t v16 = 1;
  }
  id v21 = objc_loadWeakRetained((id *)&self->_browserController);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke;
  v34[3] = &unk_1E6D7DA28;
  v34[4] = self;
  id v35 = v11;
  uint64_t v39 = v16;
  uint64_t v22 = v12;
  id v38 = v22;
  id v14 = v21;
  id v36 = v14;
  id v37 = v10;
  BOOL v23 = (void (**)(void))MEMORY[0x1E4E42950](v34);
  int v24 = v23;
  if (v16)
  {
    if (v16 == 2)
    {
      v22[2](v22, 0);
    }
    else if (v16 == 1)
    {
      v23[2](v23);
    }
  }
  else
  {
    dialogController = self->_dialogController;
    id v26 = (void *)MEMORY[0x1E4F78270];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    id v30 = __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke_2;
    int v31 = &unk_1E6D79A88;
    uint64_t v32 = v23;
    char v33 = v22;
    uint64_t v27 = [v26 blockedPopupWindowDialogWithCompletionHandler:&v28];
    -[SFDialogController presentDialog:](dialogController, "presentDialog:", v27, v28, v29, v30, v31);
  }
LABEL_21:
}

void __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 1320);
  id v16 = [*(id *)(a1 + 40) request];
  uint64_t v3 = [v16 URL];
  if (objc_msgSend(v2, "safari_isURLWithinNavigationScope:", v3))
  {
    uint64_t v4 = *(void *)(a1 + 72);

    if (v4 == 1)
    {
      id v5 = *(void **)(a1 + 32);
      id v17 = [*(id *)(a1 + 40) request];
      id v6 = (id)objc_msgSend(v5, "loadRequest:userDriven:");

      id v7 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
      v7();
      return;
    }
  }
  else
  {
  }
  if (!*(void *)(*(void *)(a1 + 32) + 512))
  {
    uint64_t v8 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 512);
    *(void *)(v9 + 512) = v8;
  }
  id v18 = (id)[objc_alloc((Class)objc_opt_class()) _initWithBrowserController:*(void *)(a1 + 48) configuration:*(void *)(a1 + 56)];
  [v18 setIsBlank:0];
  [v18 setParentTabDocumentForBackClosesSpawnedTab:*(void *)(a1 + 32)];
  [v18 setWasOpenedFromLink:1];
  [*(id *)(*(void *)(a1 + 32) + 512) addPointer:v18];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
  [WeakRetained tabDocument:*(void *)(a1 + 32) didCreateNewTabDocument:v18];

  char v12 = [MEMORY[0x1E4F97E48] sharedLogger];
  char v13 = [*(id *)(a1 + 48) tabCollectionViewProvider];
  objc_msgSend(v12, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 3, objc_msgSend(v13, "visibleTabCollectionViewType"));

  uint64_t v14 = *(void *)(a1 + 64);
  id v15 = [v18 webView];
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
}

uint64_t __108__TabDocument__webView_createWebViewWithConfiguration_forNavigationAction_windowFeatures_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_webView:(id)a3 takeFocus:(int64_t)a4
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v7 = [WeakRetained rootViewController];
  int v8 = [v7 usingUnifiedBar];

  if (v8)
  {
    [v10 resignFirstResponder];
    uint64_t v9 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:v10];
    if (objc_opt_respondsToSelector())
    {
      if (a4)
      {
        if (a4 == 1) {
          objc_msgSend(v9, "_safari_moveFocusToNextGroup");
        }
      }
      else
      {
        objc_msgSend(v9, "_safari_moveFocusToPreviousGroup");
      }
    }
  }
  else
  {
    [WeakRetained setFavoritesFieldFocused:1 animated:1];
  }
}

- (BOOL)_webViewCanBecomeFocused:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained favoritesAreEmbedded] ^ 1;

  return v4;
}

- (void)webViewDidClose:(id)a3
{
  id v7 = +[TabDocument tabDocumentForWKWebView:a3];
  if (v7)
  {
    if (![(TabDocument *)self isShowingFindOnPage])
    {
      char v4 = [(SFDialogController *)self->_dialogController presentedDialog];

      if (!v4 && !self->_isDisplayingTelephonyPrompt)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v6 = [WeakRetained tabDocumentCanCloseWindow:self];

        if (v6) {
          [(TabDocument *)self _closeTabDocumentAnimated:1];
        }
      }
    }
  }
}

- (void)_webViewFullscreenMayReturnToInline:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained prepareForTabDocumentWebViewFullscreenMayReturnToInline:self];
}

- (void)_webViewDidEnterFullscreen:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = self->_navigationObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 tabDocumentDidEnterFullscreen:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  self->_webViewIsFullscreen = 1;
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Web view did enter full screen", v10, 2u);
  }
  if (_PLShouldLogRegisteredEvent())
  {
    id v15 = @"subevent";
    id v16 = @"Enter";
    _PLLogRegisteredEvent([MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
  }
}

- (void)_webViewDidExitFullscreen:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = self->_navigationObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 tabDocumentDidExitFullscreen:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  self->_webViewIsFullscreen = 0;
  uint64_t v9 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Web view did exit full screen", v10, 2u);
  }
  if (_PLShouldLogRegisteredEvent())
  {
    id v15 = @"subevent";
    id v16 = @"Exit";
    _PLLogRegisteredEvent([MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
  }
}

- (double)_convertRectFromDocumentToWebView:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  id v10 = [*(id *)(a1 + 1032) scrollView];
  [v10 zoomScale];
  double v12 = v11;

  long long v13 = [*(id *)(a1 + 1032) scrollView];
  objc_msgSend(v13, "convertRect:toView:", *(void *)(a1 + 1032), a2 * v12, a3 * v12, a4 * v12, a5 * v12);
  double v15 = v14;

  return v15;
}

- (void)animateElement:(id)a3 toBarItem:(int64_t)a4
{
  id v19 = a3;
  uint64_t v6 = [v19 image];
  if (v6)
  {
    [v19 boundingRect];
    double v11 = -[TabDocument _convertRectFromDocumentToWebView:]((uint64_t)self, v7, v8, v9, v10);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "animateLinkImage:fromRect:inView:toBarItem:", objc_msgSend(v6, "CGImage"), self->_webView, a4, v11, v13, v15, v17);
  }
}

- (id)_webView:(id)a3 alternateURLFromImage:(id)a4 userInfo:(id *)a5
{
  id v6 = a4;
  double v7 = [MEMORY[0x1E4F3B028] sharedController];
  double v8 = [v7 getActionForImageSynchronously:v6 userInfo:a5];
  double v9 = [v8 urlThatCanBeOpened];

  return v9;
}

- (id)presentingViewControllerForAction:(id)a3
{
  uint64_t v3 = [(TabDocument *)self browserController];
  char v4 = [v3 viewControllerToPresentFrom];

  return v4;
}

- (CGRect)sourceRectForPopoverActionPicker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F3B028] sharedController];
  id v6 = [v5 elementForAction:v4];
  [v6 boundingRect];
  double v11 = -[TabDocument _convertRectFromDocumentToWebView:]((uint64_t)self, v7, v8, v9, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  return 0;
}

- (id)_presentingViewControllerForWebView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v5 = [WeakRetained tabController];
  id v6 = [v5 activeTabDocument];

  if (v6 == self)
  {
    double v7 = [WeakRetained viewControllerToPresentFrom];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)_webView:(id)a3 decideDatabaseQuotaForSecurityOrigin:(id)a4 currentQuota:(unint64_t)a5 currentOriginUsage:(unint64_t)a6 currentDatabaseUsage:(unint64_t)a7 expectedUsage:(unint64_t)a8 decisionHandler:(id)a9
{
  id v14 = a4;
  id v15 = a9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v17 = [WeakRetained tabDocumentCanShowJavaScriptAlertConfirmOrTextInput:self];

  if (v17)
  {
    double v18 = objc_msgSend(v14, "safari_userVisibleName");
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __144__TabDocument__webView_decideDatabaseQuotaForSecurityOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_decisionHandler___block_invoke;
    v19[3] = &unk_1E6D7DA50;
    id v20 = v15;
    unint64_t v21 = a5;
    +[WebsiteDataUtilities getDatabaseQuotaForOrigin:v18 currentQuota:a5 currentOriginUsage:a6 currentDatabaseUsage:a7 expectedUsage:a8 dialogPresenter:self completionHandler:v19];
  }
  else
  {
    (*((void (**)(id, unint64_t))v15 + 2))(v15, a5);
  }
}

uint64_t __144__TabDocument__webView_decideDatabaseQuotaForSecurityOrigin_currentQuota_currentOriginUsage_currentDatabaseUsage_expectedUsage_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!a2) {
    a2 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)_webView:(id)a3 printFrame:(id)a4
{
  p_browserController = &self->_browserController;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained presentPrintControllerForTabDocument:self frame:v6 initiatedByWebContent:1];
}

- (void)_webView:(id)a3 imageOrMediaDocumentSizeChanged:(CGSize)a4
{
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5
{
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
}

- (unint64_t)_webView:(id)a3 willUpdateDataInteractionOperationToOperation:(unint64_t)a4 forSession:(id)a5
{
  id v7 = a5;
  id v8 = [v7 localDragSession];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webKitDragSession);
    BOOL v10 = v8 != WeakRetained;
  }
  else
  {
    BOOL v10 = 1;
  }
  if (a4 <= 1 && v10 && [MEMORY[0x1E4F78598] canCreateNavigationIntentForDropSession:v7]) {
    a4 = 2;
  }

  return a4;
}

- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4
{
  id v6 = (_SFWebView *)a3;
  id v7 = a4;
  unint64_t v8 = self->_deferredDropNavigationIntentGeneration + 1;
  self->_deferredDropNavigationIntentGeneration = v8;
  double v9 = [MEMORY[0x1E4F78598] builder];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__TabDocument__webView_performDataInteractionOperationWithItemProviders___block_invoke;
  v13[3] = &unk_1E6D7DA78;
  void v13[4] = self;
  void v13[5] = v8;
  [v9 buildNavigationIntentForItemProviders:v7 completionHandler:v13];

  readerWebView = self->_readerWebView;
  if (readerWebView == v6)
  {
    deferredDropWasHandledByWebKit = self->_deferredDropWasHandledByWebKit;
    self->_deferredDropWasHandledByWebKit = (NSNumber *)MEMORY[0x1E4F1CC28];

    -[TabDocument _attemptDeferredDropNavigation]((uint64_t)self);
  }

  return readerWebView == v6;
}

void __73__TabDocument__webView_performDataInteractionOperationWithItemProviders___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v4 + 456))
  {
    objc_storeStrong((id *)(v4 + 448), a2);
    -[TabDocument _attemptDeferredDropNavigation](*(void *)(a1 + 32));
  }
}

- (void)_attemptDeferredDropNavigation
{
  if (a1)
  {
    int v2 = *(void **)(a1 + 464);
    if (v2)
    {
      if (*(void *)(a1 + 448))
      {
        if (([v2 BOOLValue] & 1) == 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
          [WeakRetained dispatchNavigationIntent:*(void *)(a1 + 448)];
        }
        uint64_t v4 = *(void **)(a1 + 448);
        *(void *)(a1 + 448) = 0;

        id v5 = *(void **)(a1 + 464);
        *(void *)(a1 + 464) = 0;
      }
    }
  }
}

- (void)_webView:(id)a3 dataInteractionOperationWasHandled:(BOOL)a4 forSession:(id)a5 itemProviders:(id)a6
{
  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:a4];
  deferredDropWasHandledByWebKit = self->_deferredDropWasHandledByWebKit;
  self->_deferredDropWasHandledByWebKit = v7;

  -[TabDocument _attemptDeferredDropNavigation]((uint64_t)self);
}

- (id)_webView:(id)a3 adjustedDataInteractionItemProvidersForItemProvider:(id)a4 representingObjects:(id)a5 additionalData:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v31 = a4;
  id v27 = a5;
  id v28 = a6;
  uint64_t v29 = objc_msgSend(v27, "safari_firstObjectPassingTest:", &__block_literal_global_597);
  if (v29)
  {
    BOOL v10 = objc_msgSend(MEMORY[0x1E4F78598], "builderWithModifierFlags:", 0, v25);
    id v30 = [v10 navigationIntentWithURL:v29];

    double v11 = [(TabDocument *)self uuid];
    [v30 setSourceTabUUID:v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    double v13 = [WeakRetained UUID];
    [v30 setSourceWindowUUID:v13];

    id v33 = v31;
    id v14 = objc_msgSend(MEMORY[0x1E4F22488], "_sf_windowCreationActivityWithNavigationIntent:", v30);
    id v15 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    double v16 = [v33 registeredContentTypes];
    id obj = v16;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v38;
      uint64_t v19 = *MEMORY[0x1E4F444F8];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(obj);
          }
          unint64_t v21 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (v14 && [*(id *)(*((void *)&v37 + 1) + 8 * i) conformsToType:v19])
          {
            [v15 registerObject:v14 visibility:0];

            id v14 = 0;
          }
          uint64_t v22 = [v21 identifier];
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __111__TabDocument__webView_adjustedDataInteractionItemProvidersForItemProvider_representingObjects_additionalData___block_invoke_2;
          v34[3] = &unk_1E6D7DAA0;
          id v35 = v33;
          id v36 = v21;
          [v15 registerItemForTypeIdentifier:v22 loadHandler:v34];
        }
        double v16 = obj;
        uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v17);
    }

    id v42 = v15;
    BOOL v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  }
  else
  {
    id v41 = v31;
    BOOL v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v41, 1, v25);
  }

  return v23;
}

uint64_t __111__TabDocument__webView_adjustedDataInteractionItemProvidersForItemProvider_representingObjects_additionalData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __111__TabDocument__webView_adjustedDataInteractionItemProvidersForItemProvider_representingObjects_additionalData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  unint64_t v8 = [*(id *)(a1 + 40) identifier];
  [v7 loadItemForTypeIdentifier:v8 options:v6 completionHandler:v9];
}

- (void)_webView:(id)a3 requestGeolocationAuthorizationForURL:(id)a4 frame:(id)a5 decisionHandler:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  double v11 = [MEMORY[0x1E4F3AFA0] sharedManager];
  [v11 requestPermissionForURL:v12 frame:v9 dialogPresenter:self browserPersona:0 completionHandler:v10];
}

- (BOOL)_webView:(id)a3 fileUploadPanelContentIsManagedWithInitiatingFrame:(id)a4
{
  id v4 = a4;
  id v5 = [MEMORY[0x1E4F74230] sharedConnection];
  id v6 = [v4 request];
  id v7 = [v6 URL];
  char v8 = [v5 isURLManaged:v7];

  return v8;
}

- (void)_webView:(id)a3 didChangeSafeAreaShouldAffectObscuredInsets:(BOOL)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentDidChangeSafeAreaShouldAffectObscuredInsets:self];
}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  return MEMORY[0x1F412FA70](0, a3);
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  return MEMORY[0x1F412FA70](1, a3);
}

- (void)_webView:(id)a3 requestWebAuthenticationConditionalMediationRegistrationForUser:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F3AF98] sharedController];
  id v10 = [(TabDocument *)self tabIDForAutoFill];
  double v11 = [(TabDocument *)self committedURL];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__TabDocument__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke;
  v13[3] = &unk_1E6D79370;
  id v12 = v8;
  id v14 = v12;
  [v9 canAutomaticallyRegisterPasskeyForUsername:v7 inTabWithID:v10 currentURL:v11 completionHandler:v13];
}

uint64_t __106__TabDocument__webView_requestWebAuthenticationConditionalMediationRegistrationForUser_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_webView:(id)a3 hasVideoInPictureInPictureDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained tabDocument:self didChangePIPState:v4];

  [(TabDocument *)self updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:[(TabDocument *)self isActive]];
  id v7 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v7 reportPictureInPictureEvent:v4 ^ 1];
}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
  id v6 = a4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F3AF90]) initWithFormInputSession:v6];
  if (![v6 requiresStrongPasswordAssistance]
    || (-[_SFFormAutoFillController prepareForShowingAutomaticStrongPasswordWithInputSession:](self->_autoFillController, "prepareForShowingAutomaticStrongPasswordWithInputSession:", v5), ([MEMORY[0x1E4F97EA0] isPasswordsAppInstalled] & 1) != 0))
  {
    [(_SFFormAutoFillController *)self->_autoFillController fieldWillFocusWithInputSession:v5];
  }
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  id v7 = a4;
  if (![v7 requiresStrongPasswordAssistance]
    || ([MEMORY[0x1E4F97EA0] isPasswordsAppInstalled] & 1) != 0)
  {
    autoFillController = self->_autoFillController;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F3AF90]) initWithFormInputSession:v7];
    [(_SFFormAutoFillController *)autoFillController fieldDidFocusWithInputSession:v6];
  }
}

- (BOOL)_webView:(id)a3 focusRequiresStrongPasswordAssistance:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F3AF90]) initWithFocusedElement:v5];
  int v7 = [(_SFFormAutoFillController *)self->_autoFillController shouldShowPasswordManagementAppOnboardingViews];
  autoFillController = self->_autoFillController;
  if (v7)
  {
    id v9 = (id)[(_SFFormAutoFillController *)autoFillController beginAutomaticPasswordInteractionWithInputSession:v6];
    BOOL v10 = 1;
  }
  else
  {
    double v11 = [(_SFFormAutoFillController *)autoFillController beginAutomaticPasswordInteractionWithInputSession:v6];
    BOOL v10 = v11 != 0;
  }
  return v10;
}

- (void)_webView:(id)a3 didResignInputElementStrongPasswordAppearanceWithUserInfo:(id)a4
{
}

- (id)_webViewAdditionalContextForStrongPasswordAssistance:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F3B108];
  uint64_t v3 = [(TabDocument *)self uuid];
  BOOL v4 = [v3 UUIDString];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)_webView:(id)a3 willSubmitFormValues:(id)a4 userObject:(id)a5 submissionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  autoFillController = self->_autoFillController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler___block_invoke;
  v14[3] = &__block_descriptor_48_ea8_32c87_ZTSKZ74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler__E3__1_e5_v8__0l;
  double v13 = (std::__shared_weak_count *)operator new(0x28uLL);
  v13->__shared_weak_owners_ = 0;
  v13->__shared_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3C25D80;
  v13[1].__vftable = (std::__shared_weak_count_vtbl *)MEMORY[0x1E4E42950](v11);
  LOBYTE(v13[1].__shared_owners_) = 0;
  void v14[4] = v13 + 1;
  id v15 = v13;
  atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
  [(_SFFormAutoFillController *)autoFillController willSubmitFormValues:v9 userObject:v10 submissionHandler:v14];
  std::__shared_weak_count::__release_shared[abi:se180100](v13);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:se180100](v15);
  }
}

void *__74__TabDocument__webView_willSubmitFormValues_userObject_submissionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  v1[8] = 1;
  return (*(void *(**)(unsigned char *__return_ptr))(*(void *)v1 + 16))(v1);
}

- (void)_webView:(id)a3 insertTextSuggestion:(id)a4 inInputSession:(id)a5
{
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[Application postTestNotificationName:@"WebFormElementDidFocusNotification" object:self];
  if (self->_locked) {
    goto LABEL_2;
  }
  if (self->_allowsProgrammaticFocusToBeginInputSession)
  {
    int64_t v8 = 1;
    goto LABEL_15;
  }
  if ([(TabDocument *)self isControlledByAutomation])
  {
LABEL_2:
    int64_t v8 = 2;
  }
  else
  {
    if ([(_SFFormAutoFillController *)self->_autoFillController elementIsBeingFocusedForStreamlinedLogin:v7])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ([WeakRetained tabDocumentCanBeginInputSessionForStreamlinedLogin:self]) {
        int64_t v8 = 1;
      }
      else {
        int64_t v8 = 2;
      }
    }
    else
    {
      id WeakRetained = [(LoadingController *)self->_loadingController URL];
      id v10 = [v6 _committedURL];
      if ([WeakRetained isEqual:v10]) {
        int64_t v8 = 0;
      }
      else {
        int64_t v8 = 2;
      }
    }
  }
LABEL_15:

  return v8;
}

- (void)_webViewDidEnableInspectorBrowserDomain:(id)a3
{
  id v10 = a3;
  webExtensionsStateObserver = self->_webExtensionsStateObserver;
  if (!webExtensionsStateObserver)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F98DB8]);
    webView = self->_webView;
    id v7 = [(TabDocument *)self webExtensionsController];
    int64_t v8 = (WBSSafariExtensionStateObserver *)[v5 initWithWebView:webView extensionsController:v7];
    id v9 = self->_webExtensionsStateObserver;
    self->_webExtensionsStateObserver = v8;

    webExtensionsStateObserver = self->_webExtensionsStateObserver;
  }
  [(WBSSafariExtensionStateObserver *)webExtensionsStateObserver startObservingExtensionStateChanges];
}

- (void)_webViewDidDisableInspectorBrowserDomain:(id)a3
{
  webExtensionsStateObserver = self->_webExtensionsStateObserver;
  if (webExtensionsStateObserver) {
    [(WBSSafariExtensionStateObserver *)webExtensionsStateObserver stopObservingExtensionStateChanges];
  }
}

- (BOOL)allowsBrowsingAssistant
{
  return ![(TabDocument *)self isPrivateBrowsingEnabled]
      && [MEMORY[0x1E4F989E8] userConsentState] == 1;
}

- (void)browsingAssistantControllerDidReset:(id)a3
{
}

- (void)browsingAssistantController:(id)a3 didUpdateContentOptionsForURL:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(TabDocument *)self committedURL];
  char v8 = WBSIsEqual();

  if (v8)
  {
    id v9 = [v12 result];
    uint64_t v10 = [v9 contentOptions];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained tabDocument:self didReceiveAssistantContentOptions:v10];

    [(SFNavigationBarItem *)self->_navigationBarItem updateContentOptions:v10];
  }
}

- (void)browsingAssistantControllerDidUpdateUserConsentState:(id)a3
{
  if ([(TabDocument *)self allowsBrowsingAssistant])
  {
    assistantController = self->_assistantController;
    id v6 = [(TabDocument *)self url];
    id v5 = [(WBSTranslationContext *)self->_translationContext webpageLocale];
    [(WBSBrowsingAssistantController *)assistantController checkForAssistantContentFromPegasusForURL:v6 locale:v5];
  }
}

- (void)loadingController:(id)a3 willLoadRequest:(id)a4 webView:(id)a5 userDriven:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a4;
  id v9 = a5;
  -[TabDocument _loadingControllerWillLoadRequest:webView:userDriven:]((uint64_t)self, v11, v10, v6);
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator willStartNewBrowserChromeInitiatedNavigation];
}

- (void)loadingControllerWillStartUserDrivenLoad:(id)a3
{
  *(_WORD *)&self->_loadWasUserDriven = 1;
  self->_shouldResetPrintSuppressionOnNextCommit = 1;
  self->_sessionStateRestorationSource = 0;
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator willStartNewBrowserChromeInitiatedNavigation];
}

- (void)_webView:(id)a3 logDiagnosticMessage:(id)a4 description:(id)a5
{
  id v8 = a4;
  id v6 = a5;
  id v7 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v7 logDiagnosticMessageWithKey:v8 diagnosticMessage:v6];
}

- (void)_webView:(id)a3 logDiagnosticMessageWithResult:(id)a4 description:(id)a5 result:(int64_t)a6
{
  id v10 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v9 logDiagnosticMessageWithKey:v10 diagnosticMessage:v8 result:a6];
}

- (void)_webView:(id)a3 logDiagnosticMessageWithValue:(id)a4 description:(id)a5 value:(id)a6
{
  id v11 = a4;
  id v8 = a5;
  id v9 = a6;
  id v10 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v10 logDiagnosticMessageWithKey:v11 diagnosticMessage:v8 value:v9];
}

- (void)_webView:(id)a3 logDiagnosticMessageWithEnhancedPrivacy:(id)a4 description:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(TabDocument *)self isPrivateBrowsingEnabled]
    || ([MEMORY[0x1E4F989B0] sharedManager],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_msgSend(v10, "donateForDiagnosticLoggingKey:value:webPageLoadedOverPrivateRelay:", v8, v9, objc_msgSend(v12, "_wasPrivateRelayed")), v10, (v11 & 1) == 0))
  {
    WBSLogWithDifferentialPrivacy();
  }
}

- (void)_webView:(id)a3 logDiagnosticMessage:(id)a4 description:(id)a5 valueDictionary:(id)a6
{
  id v11 = a4;
  id v8 = a5;
  id v9 = a6;
  id v10 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v10 didReceiveAnalyticsEventFromWebKitWithName:v11 description:v8 payload:v9];
}

- (void)_webView:(id)a3 logDiagnosticMessageWithDomain:(id)a4 domain:(int64_t)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!a5)
  {
    ct_green_tea_logger_create_static();
    id v7 = getCTGreenTeaOsLogHandle();
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 136315138;
        uint64_t v11 = [v6 UTF8String];
        _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
      }
    }
  }
}

- (void)didAutoDetectSiteSpecificSearchProviderWithOriginatingURL:(id)a3 searchURLTemplate:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  if (v7)
  {
    id v8 = [(TabDocument *)self browserController];
    id v9 = [v8 activeSearchEngine];
    int v10 = [v9 urlIsValidSearch:v7];

    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      uint64_t v12 = [WeakRetained rootViewController];
      double v13 = [v12 tipsCoordinator];
      [v13 donatePerformSearchFromDefaultSearchEngineWebPageEvent];
    }
  }
  if ([(_SFBrowserConfiguration *)self->_configuration allowsSiteSpecificSearch])
  {
    id v14 = [MEMORY[0x1E4F98D50] sharedController];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F98C50]) initWithString:v6];
    double v16 = [v17 absoluteString];
    [v14 setSearchURLTemplateFromForm:v15 forSourcePageURLString:v16 completionHandler:0];
  }
}

- (void)didFindAppBannerWithContent:(id)a3
{
  id v4 = a3;
  if (!self->_storeBannersAreDisabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    char v6 = [WeakRetained isPrivateBrowsingEnabled];

    if ((v6 & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = objc_loadWeakRetained((id *)&self->_delegate);
        [v7 removeAppBannerFromTabDocument:self animated:1];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[TabDocument _setAppBannerWhenPainted:]((uint64_t)self, 0);
      }
      id v8 = [(TabDocument *)self URL];
      SFCreateAppSuggestionBannerFromMetaTagContent();
    }
  }
}

void __43__TabDocument_didFindAppBannerWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 1168) && !*(void *)(v6 + 360) || *(unsigned char *)(v6 + 927))
  {
    objc_msgSend(v4, "setDelegate:");
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 352), a2);
    id v7 = [*(id *)(*(void *)(a1 + 32) + 1032) backForwardList];
    id v8 = [v7 currentItem];

    if (*(void **)(*(void *)(a1 + 32) + 320) != v8)
    {
      id v9 = [v5 overlayProvider];

      if (v9)
      {
        int v10 = [v5 overlayProvider];
        uint64_t v11 = [*(id *)(a1 + 32) perSitePreferencesVendor];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        id v12[2] = __43__TabDocument_didFindAppBannerWithContent___block_invoke_2;
        v12[3] = &unk_1E6D791E8;
        void v12[4] = *(void *)(a1 + 32);
        id v13 = v5;
        [v10 requestOverlayWithPreferencesVendor:v11 completion:v12];
      }
      else
      {
        -[TabDocument _setAppBannerWhenPainted:](*(void *)(a1 + 32), v5);
      }
    }
  }
}

void __43__TabDocument_didFindAppBannerWithContent___block_invoke_2(uint64_t a1)
{
}

- (void)findOnPageCompletionProvider:(id)a3 setStringToComplete:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SFTextSearchMatchesCounter *)self->_findMatchesCounter queryString];
  char v9 = [v8 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_findCompletionProvider, v6);
    int v10 = [(TabDocument *)self findInteraction];
    uint64_t v11 = [v10 _configuredSearchOptions];
    if (-[SFTextSearchMatchesCounter canSkipCountingMatchesForQueryString:wordMatchMethod:](self->_findMatchesCounter, "canSkipCountingMatchesForQueryString:wordMatchMethod:", v7, [v11 wordMatchMethod]))
    {
      uint64_t v12 = -[FindOnPageCompletionItem initWithString:numberOfMatches:forQueryID:]([FindOnPageCompletionItem alloc], "initWithString:numberOfMatches:forQueryID:", v7, 0, [v6 parsecQueryID]);
      v27[0] = v12;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v6 setCompletions:v13 forString:v7];
    }
    else if ([(SFTextSearchMatchesCounter *)self->_findMatchesCounter searchTookTooLong])
    {
      id v14 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_INFO, "Not making additional calls to -performTextSearchWithQueryString because the previous calls took too long", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      [(SFTextSearchMatchesCounter *)self->_findMatchesCounter invalidate];
      objc_initWeak(buf, self);
      id v15 = objc_alloc(MEMORY[0x1E4F78460]);
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __64__TabDocument_findOnPageCompletionProvider_setStringToComplete___block_invoke;
      BOOL v23 = &unk_1E6D7DAF0;
      objc_copyWeak(&v25, buf);
      id v16 = v7;
      id v24 = v16;
      id v17 = (SFTextSearchMatchesCounter *)[v15 initWithQueryString:v16 completionHandler:&v20];
      findMatchesCounter = self->_findMatchesCounter;
      self->_findMatchesCounter = v17;

      uint64_t v19 = [(TabDocument *)self activeWebView];
      [v19 performTextSearchWithQueryString:v16 usingOptions:v11 resultAggregator:self->_findMatchesCounter];

      objc_destroyWeak(&v25);
      objc_destroyWeak(buf);
    }
  }
}

void __64__TabDocument_findOnPageCompletionProvider_setStringToComplete___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[TabDocument _updateFindCompletionProviderWithNumberOfMatches:forString:]((uint64_t)WeakRetained, a2, *(void **)(a1 + 32));
}

- (void)_updateFindCompletionProviderWithNumberOfMatches:(void *)a3 forString:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 152));
    if (WeakRetained)
    {
      id v7 = -[FindOnPageCompletionItem initWithString:numberOfMatches:forQueryID:]([FindOnPageCompletionItem alloc], "initWithString:numberOfMatches:forQueryID:", v5, a2, [WeakRetained parsecQueryID]);
      v9[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [WeakRetained setCompletions:v8 forString:v5];
    }
  }
}

- (void)clearFindOnPageMatchesCounter
{
  findMatchesCounter = self->_findMatchesCounter;
  self->_findMatchesCounter = 0;
}

- (void)showFindOnPage
{
  id v2 = [(TabDocument *)self activeWebView];
  [v2 find:0];
}

- (UIEdgeInsets)_webView:(id)a3 finalObscuredInsetsForScrollView:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y = a5.y;
  double x = a5.x;
  p_browserController = &self->_browserController;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  objc_msgSend(WeakRetained, "finalObscuredInsetsForScrollView:withVelocity:targetContentOffset:", v10, a6, x, y);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (id)formAutoFillControllerURLForFormAutoFill:(id)a3
{
  uint64_t v3 = [(TabDocument *)self URL];
  return v3;
}

- (BOOL)formAutoFillControllerShouldDisableStreamlinedLogin:(id)a3
{
  return [(_SFBrowserConfiguration *)self->_configuration allowsStreamlinedLogin] ^ 1;
}

- (id)currentSavedAccountContextForFormAutoFillController:(id)a3
{
  uint64_t v3 = -[TabDocument profileIdentifier]((uint64_t)self);
  if ([v3 isEqualToString:*MEMORY[0x1E4F980C8]])
  {
    uint64_t v4 = [MEMORY[0x1E4F97FC0] defaultContext];
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F97FC0]) initWithSafariProfileIdentifier:v3];
  }
  id v5 = (void *)v4;

  return v5;
}

- (NSUUID)tabIDForAutoFill
{
  return self->_uuid;
}

- (BOOL)formAutoFillControllerDidUserDeclineAutomaticStrongPasswordForCurrentDomain:(id)a3
{
  uint64_t v4 = [(TabDocument *)self committedURL];
  id v5 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");

  LOBYTE(v4) = [v5 isEqualToString:self->_domainWhereUserDeclinedAutomaticStrongPassword];
  return (char)v4;
}

- (void)formAutoFillControllerUserChoseToUseGeneratedPassword:(id)a3
{
  domainWhereUserDeclinedAutomaticStrongPassword = self->_domainWhereUserDeclinedAutomaticStrongPassword;
  self->_domainWhereUserDeclinedAutomaticStrongPassword = 0;
}

- (void)formAutoFillControllerDidFocusSensitiveFormField:(id)a3
{
  BOOL hasFocusedInputFieldOnCurrentPage = self->_hasFocusedInputFieldOnCurrentPage;
  self->_BOOL hasFocusedInputFieldOnCurrentPage = 1;
  if (!hasFocusedInputFieldOnCurrentPage) {
    -[TabDocument _updateNavigationBarItem]((uint64_t)self);
  }
}

- (void)formAutoFillControllerGetAuthenticationForAutoFill:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v9 = [WeakRetained tabDocumentCanDisplayModalUI:self];

  if (v9)
  {
    -[TabDocument _getAuthenticationForAutoFillController:withCompletion:]((uint64_t)self, v6, v7);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4E42950](v7);
    id autoFillAuthenticationCompletionBlock = self->_autoFillAuthenticationCompletionBlock;
    self->_id autoFillAuthenticationCompletionBlock = v10;

    double v12 = WBS_LOG_CHANNEL_PREFIXAutoFillAuthentication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_INFO, "Deferring AutoFill Authentication since the TabDocument can't show modal UI", v13, 2u);
    }
  }
}

void __70__TabDocument__getAuthenticationForAutoFillController_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) authenticationContext];
  uint64_t v4 = [v5 authenticatedContext];
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, a2, v4);
}

- (void)presentAutoFillInternalFeedbackToastForFormAutoFillController:(id)a3 diagnosticsDataWithoutPageContents:(id)a4
{
  p_browserController = &self->_browserController;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained presentAutoFillInternalFeedbackToastWithDiagnosticsDataWithoutPageContents:v5];
}

- (void)dismissAutoFillInternalFeedbackActivityForFormAutoFillController:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained dismissAutoFillInternalFeedbackToastImmediately:v4];
}

- (void)resetPendingAutoFillInternalFeedbackToastDismissalTimer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained resetPendingAutoFillInternalFeedbackToastDismissalTimer];
}

- (BOOL)printControllerShouldPrintReader:(id)a3
{
  if (self->_showingReader) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v6 = [WeakRetained presentedActivityViewController];

  if (v6)
  {
    id v7 = [v6 customizationController];
    BOOL showingReader = [v7 selectedContentType] == 2;
  }
  else
  {
    BOOL showingReader = self->_showingReader;
  }

  return showingReader;
}

- (void)printController:(id)a3 didCreatePrintInfo:(id)a4
{
}

- (BOOL)printControllerCanPresentPrintUI:(id)a3
{
  if (self->_shouldSuppressDialogsThatBlockWebProcessForProvisionalNavigation
    || [(TabDocument *)self shouldObscureForDigitalHealth])
  {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained tabDocumentCanDisplayModalUI:self];

  return v4;
}

- (id)presentingViewControllerForPrintController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained viewControllerToPresentFrom];

  return v4;
}

- (id)URLStringForPrintController:(id)a3
{
  uint64_t v3 = [(TabDocument *)self URLString];
  return v3;
}

- (id)pageTitleForPrintController:(id)a3
{
  uint64_t v3 = [(TabDocument *)self titleForSharing];
  return v3;
}

- (id)loadingDialogPageTitleForPrintController:(id)a3
{
  uint64_t v3 = [(TabDocument *)self titleForNewBookmark];
  return v3;
}

- (int64_t)dialogController:(id)a3 presentationPolicyForDialog:(id)a4
{
  id v5 = a4;
  int v6 = [v5 completionHandlerBlocksWebProcess] ^ 1;
  if (!self) {
    LOBYTE(v6) = 1;
  }
  if ((v6 & 1) == 0
    && (self->_shouldSuppressDialogsThatBlockWebProcessForProvisionalNavigation || self->_showingReader))
  {
    int64_t v8 = 1;
    goto LABEL_14;
  }
  if ([v5 presentationStyle] != 1) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained tabDocumentCanDisplayModalUI:self])
  {

LABEL_7:
    int64_t v8 = 0;
    goto LABEL_14;
  }
  int v9 = [v5 shouldIgnoreGlobalModalUIDisplayPolicy];

  if (v9) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = 2;
  }
LABEL_14:

  return v8;
}

- (void)dialogController:(id)a3 willPresentDialog:(id)a4
{
  self->_showingInlineDialog = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentWillShowInlineDialog:self];
}

- (void)dialogController:(id)a3 didDismissDialog:(id)a4
{
  self->_showingInlineDialog = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentWillDismissInlineDialog:self];
}

- (void)dialogController:(id)a3 presentViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocument:self presentViewControllerAnimated:v9];

  objc_msgSend(v9, "_sf_animateAlongsideTransitionOrPerform:", v7);
}

- (void)dialogController:(id)a3 dismissViewController:(id)a4 withAdditionalAnimations:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocument:self dismissViewControllerAnimated:v9];

  objc_msgSend(v9, "_sf_animateAlongsideTransitionOrPerform:", v7);
}

- (void)pageLoadErrorControllerDidAddAlert:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentDidAddAlert:self];
}

- (BOOL)pageLoadErrorControllerShouldHandleCertificateError:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained tabDocumentShouldHandleCertificateError:v3];

  return (char)v3;
}

- (void)pageLoadErrorController:(id)a3 loadFailedRequestAfterError:(id)a4
{
  id v6 = [a3 failedRequest];
  id v5 = -[TabDocument loadRequest:userDriven:](self, "loadRequest:userDriven:");
}

- (id)pageLoadErrorControllerGetSecIdentityPreferencesController:(id)a3
{
  if (!self->_secIdentityPreferencesController)
  {
    if ([(TabDocument *)self isPrivateBrowsingEnabled]) {
      [MEMORY[0x1E4F3B068] ephemeralSecIdentityPreferencesController];
    }
    else {
    char v4 = [MEMORY[0x1E4F3B068] sharedPersistentSecIdentityPreferencesController];
    }
    secIdentityPreferencesController = self->_secIdentityPreferencesController;
    self->_secIdentityPreferencesController = v4;
  }
  id v6 = self->_secIdentityPreferencesController;
  return v6;
}

- (void)pageLoadErrorControllerClosePage:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained tabController];
  [v4 closeTab:self animated:1];
}

- (void)pageLoadErrorControllerReloadUsingHTTPSOnlyBypass:(id)a3
{
  char v4 = [(TabDocument *)self URL];
  id v5 = [v4 host];
  objc_msgSend(v5, "safari_highLevelDomainFromHost");
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  highLevelDomainForHTTPSOnlyBypass = self->_highLevelDomainForHTTPSOnlyBypass;
  self->_highLevelDomainForHTTPSOnlyBypass = v6;

  [(TabDocument *)self reload];
}

- (void)pageLoadErrorControllerReloadWithoutPrivateRelay:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F98D20], "sharedManager", a3);
  id v5 = [(TabDocument *)self expectedOrCurrentURL];
  [v4 rememberPrivateRelayFailClosedExceptionForURL:v5];

  [(TabDocument *)self reloadEnablingDowngradedPrivateRelay:1];
}

- (void)pageLoadErrorController:(id)a3 presentViewController:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabDocument:self presentViewControllerAnimated:v6];
}

- (BOOL)pageLoadErrorControllerShouldPermanentlyAcceptCertificate:(id)a3
{
  return ![(TabDocument *)self isPrivateBrowsingEnabled];
}

- (BOOL)pageLoadErrorControllerShouldReloadAfterError:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained isSuspendedOrSuspending] ^ 1;

  return v4;
}

- (BOOL)pageLoadErrorControllerIsInPreviewMode:(id)a3
{
  return self->_linkPreviewViewController != 0;
}

- (void)pageLoadErrorController:(id)a3 allowLegacyTLSConnectionForURL:(id)a4 navigateToURL:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  int64_t v8 = +[Application sharedApplication];
  id v9 = [v8 legacyTLSHostManager];
  id v10 = [v12 host];
  [v9 allowLegacyTLSForHost:v10];

  id v11 = [(TabDocument *)self loadURL:v7 userDriven:1];
}

- (void)clearReaderScrollInformation
{
  initialArticleScrollDictionaryForCloudTab = self->_initialArticleScrollDictionaryForCloudTab;
  self->_initialArticleScrollDictionaryForCloudTab = 0;

  self->_readerViewTopScrollOffset = 0;
}

- (void)updateReadingListItemPreviewText:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(TabDocument *)self readingListBookmarkID];
  id v5 = [(TabDocument *)self titleForNewBookmark];
  id v6 = [(TabDocument *)self URL];
  id v7 = [v6 absoluteString];

  int64_t v8 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
  -[WebBookmarkCollection updateReadingListBookmarkWithID:setTitle:address:previewText:thumbnailURL:siteName:](v8, v4, v5, v7, v9, 0, 0);
}

- (void)didActivateReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([(TabDocument *)self shouldActivateReaderWhenAvailable]
    && ([WeakRetained readerShouldBeShownIfPossible] & 1) == 0)
  {
    [WeakRetained setReaderShouldBeShownIfPossible:1];
  }
  uint64_t v3 = [WeakRetained tabController];
  [v3 saveTabDocumentUserActivitySoon:self];

  uint64_t v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 reportTabUpdatedWithUpdateType:9];
}

- (void)_detectWebpageLocaleWithTextSamples:(void *)a3 url:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v7 = (void *)a1[128];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke;
    v8[3] = &unk_1E6D79B28;
    objc_copyWeak(&v10, &location);
    id v9 = v6;
    [v7 setWebpageLocaleWithExtractedTextSamples:v5 url:v9 completionHandler:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke_2;
  block[3] = &unk_1E6D79E08;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __55__TabDocument__detectWebpageLocaleWithTextSamples_url___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v2, "didVisitWebpageSBAWithUserOptedIn:", objc_msgSend(MEMORY[0x1E4F989E8], "userConsentState") == 1);

    if (*(void *)(a1 + 32))
    {
      if ([WeakRetained allowsBrowsingAssistant]) {
        [WeakRetained[132] checkForAssistantContentFromPegasusForURL:*(void *)(a1 + 40) locale:*(void *)(a1 + 32)];
      }
    }
  }
}

- (void)readerController:(id)a3 didDetermineAdditionalTextSamples:(id)a4 dueTo:(int64_t)a5
{
  translationContext = self->_translationContext;
  objc_msgSend(a4, "textSamples", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(TabDocument *)self URL];
  [(WBSTranslationContext *)translationContext setWebpageLocaleWithExtractedTextSamples:v8 url:v7 completionHandler:0];
}

- (void)readerController:(id)a3 didDetermineReaderAvailability:(id)a4 dueTo:(int64_t)a5
{
  id v7 = a4;
  uint64_t v8 = [v7 isReaderAvailable];
  self->_hasDoneReaderAvailabilityDetection = 1;
  id v9 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v9 didDetermineReaderAvailability:v8];

  if (a5 == 2) {
    goto LABEL_43;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained isReaderViewStale])
  {
    id v11 = [WeakRetained nextContinuousItemDocument];

    if (v11 != self)
    {
      if (v8) {
        [(_SFReaderController *)self->_readerContext loadNewArticle];
      }
      else {
        [WeakRetained hideReaderForTabDocument:self animated:1 deactivationMode:0];
      }
      [WeakRetained setReaderViewStale:0];
    }
  }
  id v12 = [(TabDocument *)self URL];
  if ([(TabDocument *)self readingListBookmarkID]
    && !self->_wasOpenedFromHistory
    && ([v12 isFileURL] & 1) == 0)
  {
    [(TabDocument *)self collectReadingListItemInfo];
  }
  if ([(TabDocument *)self shouldActivateReaderWhenAvailable]
    && [WeakRetained readerShouldBeShownIfPossible])
  {
    int v13 = [WeakRetained isShowingReader] ^ 1;
  }
  else
  {
    int v13 = 0;
  }
  if (!self->_active)
  {
    BOOL shouldRestoreReader = 0;
    if (v8) {
      goto LABEL_18;
    }
LABEL_24:
    if (a5 == 1 && [(TabDocument *)self isShowingReader]) {
      goto LABEL_29;
    }
    [(TabDocument *)self clearReaderScrollInformation];
    [(TabDocument *)self clearReaderContext];
    goto LABEL_27;
  }
  BOOL shouldRestoreReader = self->_shouldRestoreReader;
  if ((v8 & 1) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  if ((v13 | shouldRestoreReader) != 1)
  {
    [(TabDocument *)self clearReaderScrollInformation];
    [(_SFReaderController *)self->_readerContext clearUnusedReaderResourcesSoon];
    goto LABEL_29;
  }
  if (self->_active)
  {
    [WeakRetained setShowingReader:1 animated:1];
    double v15 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v15 didActivateReaderWithTrigger:2];
  }
  if (!shouldRestoreReader) {
    goto LABEL_29;
  }
LABEL_27:
  self->_BOOL shouldRestoreReader = 0;
LABEL_29:
  double v16 = [v7 textSamples];
  -[TabDocument _detectWebpageLocaleWithTextSamples:url:](self, v16, v12);

  double v17 = +[Application sharedApplication];
  double v18 = [v17 systemNoteTakingController];

  double v19 = [v7 canonicalURL];
  [v18 cacheCanonicalURL:v19 forWebPageURL:v12];

  [(TabDocument *)self restoreAllHighlightsData];
  if (!self->_assistantController)
  {
    double v20 = (WBSBrowsingAssistantController *)objc_alloc_init(MEMORY[0x1E4F989E8]);
    assistantController = self->_assistantController;
    self->_assistantController = v20;

    [(WBSBrowsingAssistantController *)self->_assistantController setDelegate:self];
  }
  if (![(TabDocument *)self isPrivateBrowsingEnabled])
  {
    double v22 = [(NSUUID *)self->_biomeWebpageIdentifier UUIDString];
    [(WBSBrowsingAssistantController *)self->_assistantController setWebpageIdentifier:v22];

    double v23 = [(NSUUID *)self->_biomeWebpageIdentifier UUIDString];
    [(SFNavigationBarItem *)self->_navigationBarItem setWebpageIdentifier:v23];
  }
  if (v8) {
    [(WBSBrowsingAssistantController *)self->_assistantController didFindLocalContentWithOptions:32 forURL:v12];
  }
  [(WBSBrowsingAssistantController *)self->_assistantController setCachedReaderArticleTitle:0];
  if (self->_active)
  {
    id v24 = [(TabDocument *)self URLForPerSitePreferences];
    id v25 = objc_msgSend(v24, "safari_userVisibleHostWithoutWWWSubdomain");

    if (![v25 length] || a5 == 1 && self->_lastReaderDeactivationMode == 1)
    {
      id v26 = [(TabDocument *)self navigationBarItem];
      [v26 setShowsReaderButton:v8 showsAvailabilityText:v8];

      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      [v27 tabDocument:self didDetectReaderAvailability:v8];
    }
    else
    {
      objc_initWeak(&location, self);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke;
      v31[3] = &unk_1E6D7DB68;
      objc_copyWeak(&v32, &location);
      char v33 = v8;
      id v28 = (void *)MEMORY[0x1E4E42950](v31);
      uint64_t v29 = [(TabDocument *)self perSitePreferencesVendor];
      id v30 = [v29 automaticReaderActivationManager];
      [v30 getAutomaticReaderEnabledForDomain:v25 usingBlock:v28];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
LABEL_43:
}

void __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke(uint64_t a1, char a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v4[2] = __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke_2;
  v4[3] = &unk_1E6D7DB40;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  char v6 = *(unsigned char *)(a1 + 40);
  char v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
}

void __69__TabDocument_readerController_didDetermineReaderAvailability_dueTo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v4 = [WeakRetained navigationBarItem];
    objc_msgSend(v4, "setShowsReaderButton:showsAvailabilityText:");

    id v5 = objc_loadWeakRetained(v11 + 152);
    [v5 tabDocument:v11 didDetectReaderAvailability:*(unsigned __int8 *)(a1 + 40)];

    id v3 = v11;
    if (*(unsigned char *)(a1 + 41))
    {
      int v6 = [v11 isReaderAvailable];
      id v3 = v11;
      if (v6)
      {
        char v7 = [v11 isShowingReader];
        id v3 = v11;
        if ((v7 & 1) == 0)
        {
          int v8 = [v11 isActive];
          id v3 = v11;
          if (v8)
          {
            id v9 = objc_loadWeakRetained(v11 + 120);
            [v9 setShowingReader:1 animated:1];

            id v10 = [MEMORY[0x1E4F97E48] sharedLogger];
            [v10 didActivateReaderWithTrigger:1];

            id v3 = v11;
          }
        }
      }
    }
  }
}

- (void)readerController:(id)a3 didDeactivateReaderWithMode:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v6 = ![(TabDocument *)self shouldActivateReaderWhenAvailable];
  if (a4 != 1) {
    LOBYTE(v6) = 1;
  }
  if ((v6 & 1) == 0) {
    [WeakRetained setReaderShouldBeShownIfPossible:0];
  }
  [WeakRetained setReaderViewStale:0];
  char v7 = [WeakRetained tabController];
  [v7 saveTabDocumentUserActivitySoon:self];

  int v8 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v8 reportTabUpdatedWithUpdateType:10];

  self->_lastReaderDeactivationMode = a4;
}

- (void)readerController:(id)a3 didClickLinkInReaderWithRequest:(id)a4
{
  id v12 = a4;
  id v5 = [v12 URL];
  int v6 = [MEMORY[0x1E4F78598] builder];
  char v7 = [v6 navigationIntentWithURL:v5];

  if ([v7 policy])
  {
    [(TabDocument *)self dispatchNavigationIntent:v7];
  }
  else
  {
    int v8 = [(TabDocument *)self resultOfLoadingURL:v5];
    if ([v8 type] != 3)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      [WeakRetained hideReaderForTabDocument:self animated:1 deactivationMode:0];
    }
    id v10 = [v12 URL];
    id v11 = [(TabDocument *)self loadURL:v10 userDriven:1];
  }
}

- (void)readerController:(id)a3 didClickLinkRequestingNewWindowInReaderWithRequest:(id)a4
{
  id v10 = a4;
  id v5 = [v10 URL];
  int v6 = [(TabDocument *)self resultOfLoadingURL:v5];
  if ([v6 type] == 3)
  {
    id v7 = [(TabDocument *)self loadRequest:v10 userDriven:1];
  }
  else
  {
    int v8 = [MEMORY[0x1E4F78598] builder];
    [v8 setPrefersOpenInNewTab:1];
    [v8 setPreferredTabOrder:1];
    id v9 = [v8 navigationIntentWithURL:v5];
    [(TabDocument *)self dispatchNavigationIntent:v9];
  }
}

- (void)readerController:(id)a3 didTwoFingerTapLinkInReaderWithContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!-[TabDocument _handleTwoFingerTapOnLinkWithContext:]((uint64_t)self, v6))
  {
    id v7 = [v6 navigationAction];
    int v8 = [v7 request];
    [(TabDocument *)self readerController:v9 didClickLinkInReaderWithRequest:v8];
  }
}

- (void)readerController:(id)a3 didExtractArticleText:(id)a4 withMetadata:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabDocument:self didExtractArticleText:v9 withMetadata:v8];

  if (self->_donateTextTimer)
  {
    -[TabDocument _donateTextAllowingDonationWithoutReaderText:]((id *)&self->super.isa, 1);
  }
}

- (void)filteredArticleTextDidBecomeReadyForReaderController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained filteredArticleTextDidBecomeReadyInTabDocument:self];
}

- (void)didFindSummarizationRestrictionsForReaderController:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4FB1418];
  id v5 = _WBSLocalizedString();
  id v6 = _WBSLocalizedString();
  id v12 = [v4 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  id v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = _WBSLocalizedString();
  id v9 = [v7 actionWithTitle:v8 style:1 handler:0];
  [v12 addAction:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v11 = [WeakRetained rootViewController];
  [v11 presentViewController:v12 animated:1 completion:0];
}

- (void)readerController:(id)a3 didEncounterErrorForSummarization:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__TabDocument_readerController_didEncounterErrorForSummarization___block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __66__TabDocument_readerController_didEncounterErrorForSummarization___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1418];
  id v3 = _WBSLocalizedString();
  id v4 = _WBSLocalizedString();
  id v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = _WBSLocalizedString();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__TabDocument_readerController_didEncounterErrorForSummarization___block_invoke_2;
  v11[3] = &unk_1E6D79120;
  void v11[4] = *(void *)(a1 + 32);
  id v8 = [v6 actionWithTitle:v7 style:0 handler:v11];
  [v5 addAction:v8];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
  id v10 = [WeakRetained rootViewController];
  [v10 presentViewController:v5 animated:1 completion:0];
}

void __66__TabDocument_readerController_didEncounterErrorForSummarization___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
  [WeakRetained tabDocumentDidOKSummarizationError:*(void *)(a1 + 32)];
}

- (void)readerController:(id)a3 didFinishOnDemandSummarization:(id)a4
{
  id v5 = a4;
  if ([v5 isSafe])
  {
    id v6 = [v5 summary];
    -[TabDocument _setReaderArticleSummary:]((uint64_t)self, v6);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    id v7[2] = __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke;
    v7[3] = &unk_1E6D791E8;
    void v7[4] = self;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

- (void)_setReaderArticleSummary:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 296);
    id v5 = _WBSLocalizedString();
    id v6 = _WBSLocalizedString();
    id v7 = [*(id *)(a1 + 1056) tableOfContentsTitles];
    id v8 = [*(id *)(a1 + 1056) tableOfContentsPaths];
    id v9 = [*(id *)(a1 + 1056) tableOfContentsTrailingTexts];
    [v4 setArticleSummary:v3 withSummaryHeader:v5 tableOfContentsHeader:v6 readerURLString:&stru_1F3C268E8 titles:v7 paths:v8 trailingText:v9];

    id v10 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v10, OS_LOG_TYPE_INFO, "Safari did display summary", buf, 2u);
    }
  }
}

void __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1418];
  id v3 = _WBSLocalizedString();
  id v4 = _WBSLocalizedString();
  id v5 = [v2 alertControllerWithTitle:v3 message:v4 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = _WBSLocalizedString();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_2;
  v17[3] = &unk_1E6D79120;
  void v17[4] = *(void *)(a1 + 32);
  id v8 = [v6 actionWithTitle:v7 style:0 handler:v17];
  [v5 addAction:v8];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  id v10 = _WBSLocalizedString();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_3;
  v15[3] = &unk_1E6D7DB90;
  id v11 = *(void **)(a1 + 40);
  void v15[4] = *(void *)(a1 + 32);
  id v16 = v11;
  id v12 = [v9 actionWithTitle:v10 style:0 handler:v15];

  [v5 addAction:v12];
  [v5 setPreferredAction:v12];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
  double v14 = [WeakRetained rootViewController];
  [v14 presentViewController:v5 animated:1 completion:0];
}

void __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1216));
  [WeakRetained tabDocumentDidCancelSummarization:*(void *)(a1 + 32)];
}

void __63__TabDocument_readerController_didFinishOnDemandSummarization___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) summary];
  -[TabDocument _setReaderArticleSummary:](v1, v2);
}

- (WBSHistoryContextController)contextController
{
  if (+[Application systemMemorySize] >= 0x40000001)
  {
    contextController = self->_contextController;
    if (!contextController)
    {
      id v5 = objc_alloc(MEMORY[0x1E4F98BA0]);
      id v6 = +[History sharedHistory];
      id v7 = +[Application contextClient];
      id v8 = (WBSHistoryContextController *)[v5 initWithHistory:v6 contextClient:v7];
      id v9 = self->_contextController;
      self->_contextController = v8;

      contextController = self->_contextController;
    }
    id v3 = contextController;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isShowingReadingListArchive
{
  if (![(TabDocument *)self readingListBookmarkID]) {
    return 0;
  }
  id v3 = [(TabDocument *)self URL];
  char v4 = [v3 isFileURL];

  return v4;
}

- (id)readerPageArchiveURL
{
  if ([(TabDocument *)self readingListBookmarkID])
  {
    id v3 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
    char v4 = objc_msgSend(v3, "bookmarkWithID:", -[TabDocument readingListBookmarkID](self, "readingListBookmarkID"));

    char v8 = 0;
    id v5 = [v4 webarchivePathInReaderForm:1 fileExists:&v8];
    if (v8)
    {
      id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)prepareToUseReader
{
  if ([(TabDocument *)self isReaderAvailable]
    && [(_SFReaderController *)self->_readerContext shouldCreateArticleFinder])
  {
    readerContext = self->_readerContext;
    [(_SFReaderController *)readerContext createArticleFinder];
  }
}

- (void)createBrowserReaderViewIfNeeded
{
  -[TabDocument _createBrowserReaderViewIfNeeded]((uint64_t)self);
  [(TabDocument *)self didActivateReader];
}

- (void)_createBrowserReaderViewIfNeeded
{
  if (a1 && !*(void *)(a1 + 1392))
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F466F8]);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 960));
    id v3 = [WeakRetained processPool];
    [v26 setProcessPool:v3];

    [v26 _setRelatedWebView:*(void *)(a1 + 1032)];
    [v26 _setAlternateWebViewForNavigationGestures:*(void *)(a1 + 1032)];
    [v26 _setGroupIdentifier:*MEMORY[0x1E4F3B198]];
    char v4 = [*(id *)(a1 + 1032) configuration];
    id v5 = [v4 websiteDataStore];
    [v26 setWebsiteDataStore:v5];

    id v6 = _SFApplicationNameForUserAgent();
    [v26 setApplicationNameForUserAgent:v6];

    [v26 _setNeedsStorageAccessFromFileURLsQuirk:0];
    id v7 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_readerUserContentController");
    [v26 setUserContentController:v7];

    id v8 = objc_alloc(MEMORY[0x1E4F3B0C0]);
    id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v9 bounds];
    uint64_t v10 = objc_msgSend(v8, "initWithFrame:configuration:", v26);
    id v11 = *(void **)(a1 + 1392);
    *(void *)(a1 + 1392) = v10;

    id v12 = webViewToTabDocumentMap();
    [v12 setObject:a1 forKey:*(void *)(a1 + 1392)];

    [*(id *)(a1 + 224) setReaderWebView:*(void *)(a1 + 1392)];
    [*(id *)(a1 + 224) setWebView:*(void *)(a1 + 1032)];
    int v13 = _SFCustomUserAgentStringIfNeeded();
    if (v13) {
      [*(id *)(a1 + 1392) _setCustomUserAgent:v13];
    }

    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 1392) _grantAccessToAssetServices];
    }
    [*(id *)(a1 + 1392) _setBackgroundExtendsBeyondPage:1];
    [*(id *)(a1 + 1392) setNavigationDelegate:*(void *)(a1 + 296)];
    [*(id *)(a1 + 1392) setUIDelegate:*(void *)(a1 + 296)];
    [*(id *)(a1 + 1392) setAllowsLinkPreview:1];
    [*(id *)(a1 + 1392) _setFindInteractionEnabled:1];
    [*(id *)(a1 + 1392) setAccessibilityIdentifier:@"ReaderView"];
    objc_msgSend(*(id *)(a1 + 1392), "setInspectable:", objc_msgSend((id)a1, "allowsRemoteInspection"));
    [*(id *)(a1 + 1392) addObserver:a1 forKeyPath:@"_isPlayingAudio" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 1392) addObserver:a1 forKeyPath:@"underPageBackgroundColor" options:0 context:kTabDocumentObserverContext];
    [*(id *)(a1 + 296) didCreateReaderWebView:*(void *)(a1 + 1392)];
    double v14 = *(void **)(a1 + 296);
    uint64_t v15 = *(void *)(a1 + 1160);
    id v16 = [v14 configurationManager];
    double v17 = [v16 configurationToSendToWebPage];
    objc_msgSend(v14, "setReaderInitialTopScrollOffset:configuration:isViewingArchive:scrollOffsetDictionary:", v15, v17, objc_msgSend((id)a1, "isShowingReadingListArchive"), *(void *)(a1 + 184));

    [(id)a1 clearReaderScrollInformation];
    double v18 = [*(id *)(a1 + 296) readerURL];
    if (objc_msgSend(v18, "sf_isOfflineReadingListURL"))
    {
      double v19 = *(void **)(a1 + 1392);
      double v20 = (void *)MEMORY[0x1E4F1CB10];
      double v21 = [MEMORY[0x1E4FB60E8] readingListArchivesDirectoryPath];
      double v22 = [v20 fileURLWithPath:v21];
      id v23 = (id)[v19 loadFileURL:v18 allowingReadAccessToURL:v22];
    }
    else
    {
      id v24 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v18);
      double v21 = -[TabDocument _requestBySettingAdvancedPrivacyProtectionsFlag:]((void *)a1, v24);

      id v25 = (id)[*(id *)(a1 + 1392) loadRequest:v21];
    }
  }
}

- (void)clearReaderView
{
  [(_SFWebView *)self->_readerWebView removeObserver:self forKeyPath:@"underPageBackgroundColor" context:kTabDocumentObserverContext];
  [(_SFWebView *)self->_readerWebView removeObserver:self forKeyPath:@"_isPlayingAudio" context:kTabDocumentObserverContext];
  [(_SFWebView *)self->_readerWebView _close];
  readerWebView = self->_readerWebView;
  self->_readerWebView = 0;
}

- (void)collectReadingListItemInfo
{
  LODWORD(v3) = [(TabDocument *)self readingListBookmarkID];
  -[_SFReaderController collectReadingListInfoWithBookmarkID:completionHandler:](self->_readerContext, "collectReadingListInfoWithBookmarkID:completionHandler:", MEMORY[0x1E4F143A8], 3221225472, __41__TabDocument_collectReadingListItemInfo__block_invoke, &unk_1E6D7DBB8, self, v3);
}

void __41__TabDocument_collectReadingListItemInfo__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (*(_DWORD *)(a1 + 40) == a3)
  {
    id v7 = v5;
    id v6 = [v5 objectForKey:@"previewText"];
    [*(id *)(a1 + 32) updateReadingListItemPreviewText:v6];

    id v5 = v7;
  }
}

- (id)readerURLForReaderController:(id)a3
{
  if ([(TabDocument *)self isShowingReadingListArchive])
  {
    char v4 = [(TabDocument *)self readerPageArchiveURL];
  }
  else
  {
    id v5 = [(TabDocument *)self urlForSharing];
    char v4 = objc_msgSend(v5, "safari_URLByReplacingSchemeWithString:", *MEMORY[0x1E4F3B1A0]);
  }
  return v4;
}

- (void)createReaderWebViewForReaderController:(id)a3
{
  [(TabDocument *)self prepareToUseReader];
  -[TabDocument _createBrowserReaderViewIfNeeded]((uint64_t)self);
}

- (void)presentDialog:(id)a3 sender:(id)a4
{
}

- (id)permissionDialogThrottler
{
  permissionDialogThrottler = self->_permissionDialogThrottler;
  if (!permissionDialogThrottler)
  {
    char v4 = (WBSPermissionDialogThrottler *)objc_alloc_init(MEMORY[0x1E4F98CE0]);
    id v5 = self->_permissionDialogThrottler;
    self->_permissionDialogThrottler = v4;

    permissionDialogThrottler = self->_permissionDialogThrottler;
  }
  return permissionDialogThrottler;
}

- (void)fetchMetadataForBookmark:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke;
  block[3] = &unk_1E6D7DC08;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke(id *a1)
{
  id v2 = [a1[4] URL];
  uint64_t v3 = [v2 absoluteString];
  char v4 = [a1[5] address];
  char v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = [a1[5] identifier];
    id v7 = (void *)*((void *)a1[4] + 37);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke_2;
    v9[3] = &unk_1E6D7DBE0;
    int v11 = v6;
    id v10 = a1[6];
    [v7 collectReadingListInfoWithBookmarkID:v6 completionHandler:v9];
  }
  else
  {
    id v8 = (void (*)(void))*((void *)a1[6] + 2);
    v8();
  }
}

void __51__TabDocument_fetchMetadataForBookmark_completion___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  if (*(_DWORD *)(a1 + 40) == a3)
  {
    id v7 = objc_msgSend(v5, "safari_stringForKey:", @"title");
    id v8 = objc_msgSend(v10, "safari_stringForKey:", @"previewText");
    id v9 = objc_msgSend(v10, "safari_stringForKey:", @"mainImageURL");
    (*(void (**)(uint64_t, uint64_t, void *, void *, void *, void))(v6 + 16))(v6, 1, v7, v8, v9, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, void, void, void))(v6 + 16))(v6, 0, 0, 0, 0, 0);
  }
}

- (void)_terminateWebProcessThenDoUnresponsiveWebProcessBlock
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Killed an unresponsive web process", v2, v3, v4, v5, v6);
}

- (void)_unresponsiveWebProcessTimerFired:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id)WBS_LOG_CHANNEL_PREFIXPageLoading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    webView = self->_webView;
    int v7 = 134218496;
    id v8 = self;
    __int16 v9 = 2048;
    id v10 = webView;
    __int16 v11 = 1024;
    int v12 = [(_SFWebView *)webView _webProcessIsResponsive];
    _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_DEFAULT, "TabDocument %p: unresponsive web process timer fired. webview=%p, responsive=%d", (uint8_t *)&v7, 0x1Cu);
  }

  [(NSTimer *)self->_unresponsiveWebProcessTimer invalidate];
  uint8_t v6 = self->_webView;
  if (v6)
  {
    if (([(_SFWebView *)v6 _webProcessIsResponsive] & 1) == 0) {
      -[TabDocument _terminateWebProcessThenDoUnresponsiveWebProcessBlock]((uint64_t)self);
    }
  }
}

- (id)_tabDocumentsSharingWebProcess
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = *(void **)(a1 + 1032);
    if (v1)
    {
      int v2 = [v1 _webProcessIdentifier];
      id v13 = [MEMORY[0x1E4F1CA48] array];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v3 = +[Application sharedApplication];
      uint64_t v4 = [v3 browserControllers];

      id obj = v4;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(obj);
            }
            id v8 = [*(id *)(*((void *)&v16 + 1) + 8 * i) tabController];
            __int16 v9 = [v8 allTabDocuments];
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __45__TabDocument__tabDocumentsSharingWebProcess__block_invoke;
            v14[3] = &__block_descriptor_36_e21_B16__0__TabDocument_8l;
            int v15 = v2;
            id v10 = objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v14);
            [v13 addObjectsFromArray:v10];
          }
          uint64_t v4 = obj;
          uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v5);
      }
    }
    else
    {
      id v13 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (uint64_t)_terminateWebProcessAndReloadIfActive:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    [*(id *)(result + 1032) _killWebContentProcessAndResetState];
    UIEdgeInsets result = [*(id *)(v3 + 288) owningWebViewDidChangeProcessID];
    if (*(unsigned char *)(v3 + 957))
    {
      if (a2)
      {
        return [(id)v3 reload];
      }
    }
    else
    {
      return [(id)v3 hibernate];
    }
  }
  return result;
}

BOOL __45__TabDocument__tabDocumentsSharingWebProcess__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 webView];
  BOOL v4 = [v3 _webProcessIdentifier] == *(_DWORD *)(a1 + 32);

  return v4;
}

- (void)updateUsageTrackingInformationAfterLinkPreviewDismissal
{
  uint64_t v3 = [(TabDocument *)self browserController];
  BOOL v4 = [v3 tabController];
  uint64_t v5 = [v4 activeTabDocument];
  int v6 = [v5 isEqual:self];

  uint64_t v7 = -[TabDocument _usageStateIfTabDocumentIsCurrent:]((uint64_t)self, v6);
  -[TabDocument _updateUsageTrackingInformationIfNecessaryToState:]((uint64_t)self, v7);
}

- (void)_webViewWillEnterElementFullscreen:(id)a3
{
  [(SFPinnableBanner *)self->_appBanner setHidden:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabDocumentDidUpdateThemeColor:self];
}

- (void)_webViewDidEnterElementFullscreen:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained updatePullToRefreshIsEnabled];
}

- (void)_webViewWillExitElementFullscreen:(id)a3
{
  [(SFPinnableBanner *)self->_appBanner setHidden:0];
  self->_exitingElementFullscreen = 1;
  cachedView = self->_cachedView;
  [(TabDocumentView *)cachedView setWebViewGeometryNeedsUpdate];
}

- (void)_webViewDidExitElementFullscreen:(id)a3
{
  self->_exitingElementFullscreen = 0;
  [(TabDocumentView *)self->_cachedView setWebViewGeometryNeedsUpdate];
  id v4 = [(TabDocument *)self browserController];
  [v4 restoreInterfaceAfterElementFullscreen];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained updatePullToRefreshIsEnabled];

  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  [v6 tabDocumentDidUpdateThemeColor:self];
}

- (void)updateAncestryWithParentTab:(id)a3
{
  id v11 = a3;
  id v4 = [v11 uuid];
  if (v4)
  {
    uint64_t v5 = [v11 ancestorUUIDs];
    id v6 = (void *)v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      uint64_t v7 = (void *)v5;
    }
    id v8 = v7;

    __int16 v9 = [v8 arrayByAddingObject:v4];
    ancestorUUIDs = self->_ancestorUUIDs;
    self->_ancestorUUIDs = v9;
  }
}

- (void)updateAncestryToChildOfTopLevelAncestorRelatedTab:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 ancestorUUIDs];
    uint64_t v7 = [v6 firstObject];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v5 uuid];
    }
    id v10 = v9;

    v13[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    ancestorUUIDs = self->_ancestorUUIDs;
    self->_ancestorUUIDs = v11;
  }
}

- (NSString)identifier
{
  int v2 = [(TabDocument *)self uuid];
  uint64_t v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (NSArray)ancestorTabIdentifiers
{
  return (NSArray *)[(NSArray *)self->_ancestorUUIDs safari_mapObjectsUsingBlock:&__block_literal_global_666];
}

id __37__TabDocument_ancestorTabIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 UUIDString];
  return v2;
}

- (NSString)windowIdentifier
{
  int v2 = [(TabDocument *)self ownerUUID];
  uint64_t v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (BOOL)canSetPinned
{
  return 1;
}

- (BOOL)shouldSpawnNewTabOnNavigationFromPinnedTabWithDestinationURL:(id)a3
{
  id v4 = a3;
  if ([(TabDocument *)self isPinned])
  {
    if (self->_isBlank)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      id v6 = [(TabDocument *)self committedURL];
      uint64_t v7 = v6;
      if (v6)
      {
        id v8 = [v6 host];
        id v9 = objc_msgSend(v8, "safari_highLevelDomainFromHost");

        id v10 = [v4 host];
        id v11 = objc_msgSend(v10, "safari_highLevelDomainFromHost");

        int v5 = WBSIsEqual() ^ 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
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

    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 tabDocumentDidUpdateTabCollectionItem:self];
  }
}

- (void)tabGroupManager:(id)a3 didUpadateActiveParticipants:(id)a4 inTabWithUUID:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(WBTab *)self->_tabGroupTab uuid];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = [v11 allObjects];
    [(TabDocument *)self setShareParticipants:v10];
  }
}

- (BOOL)shouldSelectOriginatingTabWhenClosed
{
  return [(NSPointerArray *)self->_spawnedTabDocuments count] != 0;
}

- (double)lastActivationTime
{
  return self->_lastViewedTime;
}

- (void)translationContextReloadPageInOriginalLanguage:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__TabDocument_translationContextReloadPageInOriginalLanguage___block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__TabDocument_translationContextReloadPageInOriginalLanguage___block_invoke(uint64_t a1)
{
}

- (void)translationContext:(id)a3 urlForCurrentPageWithCompletionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __73__TabDocument_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6D7D170;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __73__TabDocument_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) URL];
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)translationContext:(id)a3 showFirstTimeConsentAlertWithCompletionHandler:(id)a4
{
}

- (void)_presentTranslationConsentAlertWithType:(void *)a3 completionHandler:
{
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke;
    block[3] = &unk_1E6D799E8;
    void block[4] = a1;
    uint64_t v9 = a2;
    id v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)translationContext:(id)a3 showFeedbackConsentAlertWithCompletionHandler:(id)a4
{
}

- (id)safariApplicationVersionForTranslationContext:(id)a3
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  id v4 = objc_msgSend(v3, "safari_normalizedVersion");

  return v4;
}

- (void)translationContext:(id)a3 showTranslationErrorAlertWithTitle:(id)a4 message:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __77__TabDocument_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke;
  v8[3] = &unk_1E6D791E8;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __77__TabDocument_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isActive])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F78258]);
    [v3 setMessageType:1];
    [v3 setBannerText:*(void *)(a1 + 40) manuallyWrappedBannerText:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
    [WeakRetained showCrashBanner:v3 animated:1];
  }
}

- (void)translationContext:(id)a3 shouldReportProgressInUnifiedField:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v4[2] = __69__TabDocument_translationContext_shouldReportProgressInUnifiedField___block_invoke;
  v4[3] = &unk_1E6D795D8;
  void v4[4] = self;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __69__TabDocument_translationContext_shouldReportProgressInUnifiedField___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 760) = *(unsigned char *)(result + 40);
  return result;
}

- (void)translationContextNeedsScrollHeightVisibilityUpdate:(id)a3
{
}

- (void)_updateMaxVisibleHeightPercentageUserDriven:(id *)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 120);
    id v4 = [WeakRetained scene];
    uint64_t v5 = [v4 activationState];

    if (!v5)
    {
      id v6 = [a1[129] scrollView];
      [v6 contentSize];
      double v8 = v7;
      id v9 = [WeakRetained rootViewController];
      if ([v9 toolbarPlacement] == 1)
      {
        id v10 = [v9 view];
        [v10 bounds];
        double Height = CGRectGetHeight(v20);
        [v10 bounds];
        objc_msgSend(v9, "obscuredInsetsForRect:inCoordinateSpace:", v10);
        objc_msgSend(v10, "convertPoint:toView:", v6, 0.0, Height - v12);
        double v14 = v13;
      }
      else
      {
        [v6 contentOffset];
        double v16 = v15;
        [a1[129] frame];
        double v14 = v16 + v17;
      }
      [a1[128] updateMaxVisibleHeightPercentageIfNeeded:a2 userDriven:v14 / v8];
    }
  }
}

- (void)translationContextWillRequestTranslatingWebpage:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v3 = [WeakRetained processPool];
  SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v3, v4);
}

- (void)_translationContextStateDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__TabDocument__translationContextStateDidChange___block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__TabDocument__translationContextStateDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 280), "setShowsTranslationIcon:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1024), "hasStartedTranslating"));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1248);
  id v4 = [*(id *)(v2 + 1024) webpageLocale];
  objc_msgSend(v3, "setUpFormTelemetryDataMonitorWithWebpageLocale:");
}

void __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__670;
  double v17 = __Block_byref_object_dispose__671;
  id v18 = objc_alloc_init(MEMORY[0x1E4F98F40]);
  [(id)v14[5] setDelegate:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)v14[5];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke_673;
  id v10 = &unk_1E6D7DC78;
  uint64_t v3 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  double v12 = &v13;
  id v4 = [v2 consentAlertForType:v3 withCompletionHandler:&v7];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
  id v6 = objc_msgSend(WeakRetained, "viewControllerToPresentFrom", v7, v8, v9, v10);
  [v6 presentViewController:v4 animated:1 completion:0];

  _Block_object_dispose(&v13, 8);
}

void __73__TabDocument__presentTranslationConsentAlertWithType_completionHandler___block_invoke_673(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (id)translationConsentAlertHelperViewControllerToPresentDetailsFrom:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = [WeakRetained viewControllerToPresentFrom];

  return v4;
}

- (void)webViewDidScroll
{
}

- (void)webViewDidChangeSize
{
}

- (void)webViewDidIncreaseZoom
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  lastWebViewIncreaseZoomDate = self->_lastWebViewIncreaseZoomDate;
  self->_lastWebViewIncreaseZoomDate = v3;
}

- (void)setSuppressWebExtensionEvents:(BOOL)a3
{
  if (self->_suppressWebExtensionEvents != a3)
  {
    self->_suppressWebExtensionEvents = a3;
    if (a3)
    {
      [(NSTimer *)self->_fireOnUpdatedWebExtensionEventTimer invalidate];
      fireOnUpdatedWebExtensionEventTimer = self->_fireOnUpdatedWebExtensionEventTimer;
      self->_fireOnUpdatedWebExtensionEventTimer = 0;
    }
  }
}

- (id)windowForWebExtensionContext:(id)a3
{
  uint64_t v3 = [(TabDocument *)self webExtensionWindow];
  return v3;
}

- (unint64_t)indexInWindowForWebExtensionContext:(id)a3
{
  id v4 = [(TabDocument *)self webExtensionWindow];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 webExtensionTabs];
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
  uint64_t v5 = [WeakRetained tabController];
  id v6 = [v5 originatingTabForTab:self];

  return v6;
}

- (id)webViewForWebExtensionContext:(id)a3
{
  uint64_t v3 = [(TabDocument *)self webViewForExtensions];
  return v3;
}

- (id)titleForWebExtensionContext:(id)a3
{
  uint64_t v3 = [(TabDocument *)self tabTitle];
  return v3;
}

- (void)setPinned:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  [(TabDocument *)self setPinned:v5];
  v7[2](v7, 0);
}

- (void)setReaderModeActive:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v5 = a3;
  unint64_t v7 = (void (**)(id, void))a5;
  if ([(TabDocument *)self isInReaderMode] != v5) {
    [(TabDocument *)self toggleReader];
  }
  v7[2](v7, 0);
}

- (void)setMuted:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  uint64_t v8 = (void (**)(id, void))a5;
  if (v6) {
    [(TabDocument *)self mute];
  }
  else {
    [(TabDocument *)self unmute];
  }
  v8[2](v8, 0);
}

- (void)setZoomFactor:(double)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  unint64_t v7 = (void (**)(id, void))a5;
  [(TabDocument *)self setZoomFactor:a3];
  v7[2](v7, 0);
}

- (id)urlForWebExtensionContext:(id)a3
{
  uint64_t v3 = [(TabDocument *)self urlForExtensions];
  return v3;
}

- (id)pendingURLForWebExtensionContext:(id)a3
{
  uint64_t v3 = [(TabDocument *)self pendingURLForWebExtensions];
  return v3;
}

- (void)detectWebpageLocaleForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(TabDocument *)self translationContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  id v25[2] = __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke;
  void v25[3] = &unk_1E6D79D68;
  id v7 = v6;
  id v26 = v7;
  id v8 = v5;
  id v27 = v8;
  id v9 = (void (**)(void))MEMORY[0x1E4E42950](v25);
  uint64_t v10 = [v7 state];
  if (v10 != 5 && v10)
  {
    v9[2](v9);
  }
  else
  {
    uint64_t v19 = 0;
    CGRect v20 = &v19;
    uint64_t v21 = 0x3032000000;
    double v22 = __Block_byref_object_copy__670;
    id v23 = __Block_byref_object_dispose__671;
    id v24 = 0;
    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v12 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v13 = *MEMORY[0x1E4F99740];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke_2;
    v16[3] = &unk_1E6D7DCA0;
    id v18 = &v19;
    double v17 = v9;
    uint64_t v14 = [v11 addObserverForName:v13 object:v7 queue:v12 usingBlock:v16];
    uint64_t v15 = (void *)v20[5];
    v20[5] = v14;

    _Block_object_dispose(&v19, 8);
  }
}

void __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) webpageLocale];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = (id)v2;
  if (v2)
  {
    id v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v2];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, 0);
  id v5 = v6;
  if (v6)
  {

    id v5 = v6;
  }
}

uint64_t __75__TabDocument_detectWebpageLocaleForWebExtensionContext_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

- (void)loadURL:(id)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v7 = (void (**)(id, void))a5;
  [(TabDocument *)self loadURL:v8];
  v7[2](v7, 0);
}

- (void)reloadFromOrigin:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v8 = (void (**)(id, void))a5;
  if (v6) {
    [(TabDocument *)self reloadFromOrigin];
  }
  else {
    [(TabDocument *)self reload];
  }
  v8[2](v8, 0);
}

- (void)goBackForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  [(TabDocument *)self goBack];
  v5[2](v5, 0);
}

- (void)goForwardForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  [(TabDocument *)self goForward];
  v5[2](v5, 0);
}

- (void)activateForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  [(TabDocument *)self select];
  v5[2](v5, 0);
}

- (void)setSelected:(BOOL)a3 forWebExtensionContext:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  id v8 = (void (**)(id, void))a5;
  if (v6) {
    [(TabDocument *)self select];
  }
  v8[2](v8, 0);
}

- (void)closeForWebExtensionContext:(id)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  [(TabDocument *)self close];
  v5[2](v5, 0);
}

- (BOOL)shouldGrantPermissionsOnUserGestureForWebExtensionContext:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F97ED0] sharedController];
  BOOL v6 = [(TabDocument *)self urlForExtensions];
  id v7 = [v6 host];
  id v8 = [MEMORY[0x1E4F98F98] webExtensionForWebKitExtensionContext:v4];
  id v9 = [v8 composedIdentifier];
  char v10 = [v5 domainIsDenied:v7 forComposedIdentifier:v9] ^ 1;

  return v10;
}

- (double)idForWebExtensions
{
  return self->_idForWebExtensions;
}

- (WKWebView)webViewForExtensions
{
  return (WKWebView *)self->_webView;
}

- (NSURL)pendingURLForWebExtensions
{
  if ([(TabDocument *)self isLoading])
  {
    uint64_t v3 = [(TabDocument *)self urlForExtensions];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSURL *)v3;
}

- (BOOL)isLoadingComplete
{
  return ![(TabDocument *)self isLoading];
}

- (BOOL)isMuted
{
  return [(_SFWebView *)self->_webView _mediaMutedState] & 1;
}

- (BOOL)isFrontmost
{
  uint64_t v3 = +[WBReusableTabManager sharedManager];
  char v4 = [v3 isTabSuspended:self];

  if (v4) {
    return 0;
  }
  return [(TabDocument *)self isActive];
}

- (CGSize)tabViewSize
{
  cachedView = self->_cachedView;
  if (cachedView)
  {
    [(TabDocumentView *)cachedView bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained webExtensionTabSize];
    double v5 = v9;
    double v7 = v10;
  }
  double v11 = v5;
  double v12 = v7;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (WBSWebExtensionWindow)webExtensionWindow
{
  uint64_t v3 = +[WBReusableTabManager sharedManager];
  char v4 = [v3 isTabSuspended:self];

  if (v4)
  {
    double v5 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    double v5 = [WeakRetained webExtensionWindowForTab:self];
  }
  return (WBSWebExtensionWindow *)v5;
}

- (void)loadURL:(id)a3
{
  id v3 = [(TabDocument *)self loadURL:a3 userDriven:1];
}

- (void)select
{
  id v5 = +[WBReusableTabManager sharedManager];
  char v3 = [v5 isTabSuspended:self];

  if ((v3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    char v4 = [WeakRetained tabController];
    [v4 setActiveTabDocument:self];
  }
}

- (void)mute
{
  if (![(TabDocument *)self isMuted])
  {
    [(_SFWebView *)self->_webView _setPageMuted:1];
    if (self->_audioState != 2)
    {
      self->_audioState = 2;
      -[TabDocument mediaStateDidChangeNeedsDelay:]((uint64_t)self);
    }
  }
}

- (void)unmute
{
  if ([(TabDocument *)self isMuted])
  {
    [(_SFWebView *)self->_webView _setPageMuted:0];
    if (self->_audioState != 1)
    {
      self->_audioState = 1;
      -[TabDocument mediaStateDidChangeNeedsDelay:]((uint64_t)self);
    }
  }
}

- (BOOL)isInReaderMode
{
  return self->_showingReader;
}

- (void)toggleReader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained setShowingReader:!self->_showingReader animated:1 forTabDocument:self];
}

- (void)evictFromTabReuse
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__TabDocument_evictFromTabReuse__block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __32__TabDocument_evictFromTabReuse__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
  uint64_t v2 = [WeakRetained tabController];
  [v2 evictTabDocument:*(void *)(a1 + 32)];
}

- (void)donateCurrentNavigationWithNavigationResponse:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  double v6 = [WeakRetained speculativeLoadDocument];

  if (v6 == self)
  {
    objc_storeStrong((id *)&self->_speculativeLoadNavigationResponse, a3);
  }
  else if (self->_shouldDonateResponseForCurrentNavigation)
  {
    -[TabDocument _donateCurrentNavigationWithNavigationResponse:]((id *)&self->super.isa, v7);
  }
}

void __62__TabDocument__donateCurrentNavigationWithNavigationResponse___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F989B0] sharedManager];
  uint64_t v2 = [*(id *)(a1 + 32) URL];
  [v3 donateNavigationWithURL:v2 userAgent:*(void *)(a1 + 40) wasPrivateRelayed:*(unsigned __int8 *)(a1 + 56) statusCode:*(void *)(a1 + 48)];
}

- (void)donateSameDocumentNavigationIfNecessary
{
  self->_shouldDonatePageLoad = 1;
  -[TabDocument _donateCurrentPageLoad]((uint64_t)self);
  self->_shouldDonatePageLoad = 0;
}

- (BOOL)isSearchPage
{
  id v3 = [MEMORY[0x1E4F98E20] sharedRecorder];
  char v4 = [(TabDocument *)self webView];
  id v5 = [v4 URL];
  double v6 = [v3 searchProviderForURL:v5];

  return v6 != 0;
}

- (void)dismissSiriReaderMediaSessionImmediately:(BOOL)a3
{
  if (a3)
  {
    -[TabDocument _dismissSiriReaderMediaSession]((uint64_t)self);
  }
  else
  {
    char v4 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    id v5 = [v4 activeSiriReaderSessionIdentifier];

    if (v5 && (WBSIsEqual() & 1) != 0) {
      -[TabDocument _dismissSiriReaderMediaSession]((uint64_t)self);
    }
  }
}

- (void)_dismissSiriReaderMediaSession
{
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F78368] sharedVoiceUtilities];
    id v3 = [v2 activeSiriReaderSessionIdentifier];

    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x2050000000;
    char v4 = (void *)getSiriReaderConnectionClass(void)::softClass;
    uint64_t v18 = getSiriReaderConnectionClass(void)::softClass;
    if (!getSiriReaderConnectionClass(void)::softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      id location[2] = ___ZL28getSiriReaderConnectionClassv_block_invoke_0;
      location[3] = &unk_1E6D79088;
      location[4] = &v15;
      ___ZL28getSiriReaderConnectionClassv_block_invoke_0((uint64_t)location);
      char v4 = (void *)v16[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v15, 8);
    id v6 = objc_alloc_init(v5);
    objc_initWeak(location, *(id *)(a1 + 280));
    id v7 = dispatch_get_global_queue(9, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__TabDocument__dismissSiriReaderMediaSession__block_invoke;
    v10[3] = &unk_1E6D7DD18;
    id v11 = v6;
    id v12 = v3;
    id v8 = v3;
    id v9 = v6;
    objc_copyWeak(&v13, location);
    dispatch_async(v7, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
}

void __45__TabDocument__dismissSiriReaderMediaSession__block_invoke(id *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F78360] sharedPlaybackController];
  id v3 = (void *)[v2 currentPlaybackState];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  id v4[2] = __45__TabDocument__dismissSiriReaderMediaSession__block_invoke_2;
  v4[3] = &unk_1E6D7DCF0;
  v7[1] = v3;
  id v5 = a1[4];
  id v6 = a1[5];
  objc_copyWeak(v7, a1 + 6);
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(v7);
}

void __45__TabDocument__dismissSiriReaderMediaSession__block_invoke_2(uint64_t a1)
{
  if ((unint64_t)(*(void *)(a1 + 56) - 1) <= 1)
  {
    [*(id *)(a1 + 32) endMediaSessionForIdentifier:*(void *)(a1 + 40)];
    This = WBS_LOG_CHANNEL_PREFIXSiriReadThis();
    if (os_log_type_enabled(This, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1E102C000, This, OS_LOG_TYPE_DEFAULT, "Safari requested dismissing playback", v6, 2u);
    }
    id v3 = [MEMORY[0x1E4F78360] sharedPlaybackController];
    [v3 setCurrentPlaybackState:3];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained setShowsSiriReaderPlayingIcon:0];
    }
  }
}

- (void)updateShowsSiriReaderPlayingIcon
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__TabDocument_updateShowsSiriReaderPlayingIcon__block_invoke;
  block[3] = &unk_1E6D79060;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__TabDocument_updateShowsSiriReaderPlayingIcon__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 960));
  uint64_t v3 = [WeakRetained siriReaderPlaybackStateForActiveTab];

  char v4 = *(void **)(*(void *)(a1 + 32) + 280);
  return [v4 setShowsSiriReaderPlayingIcon:(unint64_t)(v3 - 1) < 2];
}

- (void)updateLockedBrowsingState
{
  if ([(TabDocument *)self isPrivateBrowsingEnabled])
  {
    uint64_t v3 = +[Application sharedApplication];
    int v4 = [v3 isPrivateBrowsingLocked];
  }
  else
  {
    int v4 = 0;
  }
  if (self->_locked != v4)
  {
    self->_locked = v4;
    BOOL v5 = [(TabDocument *)self allowsRemoteInspection];
    [(_SFWebView *)self->_webView setInspectable:v5];
    [(_SFWebView *)self->_readerWebView setInspectable:v5];
    if (v4)
    {
      [(_SFWebView *)self->_webView closeAllMediaPresentationsWithCompletionHandler:&__block_literal_global_682];
      [(_SFWebView *)self->_webView pauseAllMediaPlaybackWithCompletionHandler:0];
      [(TabDocument *)self addMediaSuspensionReason:2];
      webView = self->_webView;
      [(_SFWebView *)webView _stopMediaCapture];
    }
    else
    {
      [(TabDocument *)self removeMediaSuspensionReason:2];
      if (self->_active)
      {
        dialogController = self->_dialogController;
        [(SFDialogController *)dialogController owningWebViewWillBecomeActive];
      }
    }
  }
}

- (void)pageContextDataFetcherDidFinishFetching:(id)a3 forURL:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      -[TabDocument pageContextDataFetcherDidFinishFetching:forURL:withError:]();
    }
  }
  else
  {
    id v12 = [(TabDocument *)self webView];
    id v13 = [v12 URL];
    char v14 = objc_msgSend(v9, "safari_isEqualToURL:", v13);

    if (v14)
    {
      uint64_t v15 = [(TabDocument *)self _backForwardList];
      double v16 = [v15 currentItem];

      if (self) {
        BOOL v17 = +[Application systemMemorySize] < 0x40000001;
      }
      else {
        BOOL v17 = 0;
      }
      uint64_t v18 = [v8 filteredSchemaData];
      uint64_t v19 = v18;
      if (!v17)
      {
        calendarEventDetector = self->_calendarEventDetector;
        uint64_t v21 = [v18 objectForKeyedSubscript:@"containsSchemaOrg"];
        [(_SFCalendarEventDetector *)calendarEventDetector containsCalendarEventForPageWithSchemaOrgMarkup:v21 != 0];
      }
      double v22 = [(TabDocument *)self _backForwardList];
      id v23 = [v22 currentItem];

      if (v23 == v16)
      {
        id v24 = (void *)MEMORY[0x1E4F3B0A0];
        uint64_t v25 = -[TabDocument profileIdentifier]((uint64_t)self);
        id v26 = (void *)v25;
        if (v25) {
          uint64_t v27 = v25;
        }
        else {
          uint64_t v27 = *MEMORY[0x1E4F980C8];
        }
        id v28 = [v24 searchableItemAttributesForDictionary:v19 profileIdentifier:v27];
        [(TabDocument *)self setSearchableItemAttributes:v28];

        [(TabDocument *)self updateUserActivity];
      }
    }
  }
}

- (BOOL)canHibernate
{
  BOOL result = !self->_active
        && ![(TabDocument *)self isLoading]
        && !self->_activeDownload
        && (id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController),
            [WeakRetained tabDocumentPlayingPIPVideo],
            BOOL v5 = (TabDocument *)objc_claimAutoreleasedReturnValue(),
            v5,
            WeakRetained,
            v5 != self)
        && ([(_SFWebView *)self->_webView _isPlayingAudio] & 1) == 0
        && ![(_SFWebView *)self->_webView cameraCaptureState]
        && [(_SFWebView *)self->_webView microphoneCaptureState] == 0;
  return result;
}

- (LPLinkMetadata)linkMetadataForSharing
{
  uint64_t v3 = (void *)MEMORY[0x1E4F98BE8];
  int v4 = [(TabDocument *)self urlForSharing];
  BOOL v5 = [(TabDocument *)self webView];
  id v6 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
  id v7 = [v6 linkPresentationIconCache];
  id v8 = [v3 linkMetadataForURL:v4 webView:v5 iconCache:v7];

  return (LPLinkMetadata *)v8;
}

- (NSString)addressForNewBookmark
{
  uint64_t v2 = [(TabDocument *)self cachedCanonicalURLOrURLForSharing];
  uint64_t v3 = objc_msgSend(v2, "safari_originalDataAsString");

  return (NSString *)v3;
}

- (WBSCloudTab)cloudTab
{
  uint64_t v3 = [(TabDocument *)self URL];
  if ([v3 isFileURL])
  {
    int v4 = [(TabDocument *)self URLString];
    BOOL v5 = objc_msgSend(v4, "safari_bestURLForUserTypedString");
  }
  else
  {
    BOOL v5 = [(TabDocument *)self URL];
  }

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F98A40]) initWithURL:v5];
  [v6 setUuid:self->_uuid];
  id v7 = [(TabDocument *)self titleForCloudTab];
  [v6 setTitle:v7];

  [v6 setShowingReader:self->_showingReader];
  id v8 = [(_SFReaderController *)self->_readerContext scrollPositionInformation];
  [v6 setReaderScrollPosition:v8];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v10 = [WeakRetained windowState];
  id v11 = [v10 sceneID];
  [v6 setSceneID:v11];

  [v6 setLastViewedTime:self->_lastViewedTime];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F98A28]) initWithParameters:v6];

  return (WBSCloudTab *)v12;
}

- (BOOL)isReusableForURL:(id)a3 webClipURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TabDocument *)self URL];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v11 = [(TabDocument *)self _backForwardList];
    id v12 = [v11 currentItem];
    id v10 = [v12 URL];
  }
  id v13 = objc_msgSend(v10, "_webkit_URLByRemovingFragment");

  char v14 = [(NSURL *)self->_tabReuseURL _webkit_URLByRemovingFragment];
  if ([v13 isEqual:v6] & 1) != 0 || (objc_msgSend(v14, "isEqual:", v6))
  {
    char v15 = 1;
  }
  else if (v7)
  {
    char v15 = [v13 isEqual:v7];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)currentHostForScribbleController:(id)a3
{
  uint64_t v3 = [(TabDocument *)self expectedOrCurrentURL];
  int v4 = [v3 host];

  return v4;
}

- (void)sfScribbleControllerDidEndScribbling:(id)a3
{
  id v5 = [(TabDocument *)self navigationBarItem];
  [v5 setOverlayConfiguration:0];

  id v6 = [(TabDocument *)self navigationBarItem];
  [v6 setOverlayNarrowConfiguration:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v4 = [WeakRetained pageFormatMenuController];
  [v4 dismissMenu];

  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  [v8 tabDocumentDidUpdateIsScribbling:self];
}

- (void)sfScribbleControllerDidStartScribbling:(id)a3
{
  id v12 = a3;
  self->_hasEnteredScribbleMode = 1;
  int v4 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v4 didEnableScribble];

  id v5 = [v12 urlFieldOverlayConfiguration];
  id v6 = [(TabDocument *)self navigationBarItem];
  [v6 setOverlayConfiguration:v5];

  id v7 = [v12 urlFieldOverlayNarrowConfiguration];
  id v8 = [(TabDocument *)self navigationBarItem];
  [v8 setOverlayNarrowConfiguration:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v10 = [WeakRetained pageFormatMenuController];
  [v10 dismissMenu];

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  [v11 tabDocumentDidUpdateIsScribbling:self];
}

- (void)sfScribbleControllerDidUpdateHiddenElementCount:(id)a3
{
  id v11 = a3;
  int v4 = [(TabDocument *)self navigationBarItem];
  objc_msgSend(v4, "setHasHiddenElements:", objc_msgSend(v11, "hiddenElementCount") != 0);
  if ([v11 isScribbling])
  {
    id v5 = [v11 urlFieldOverlayConfiguration];
    id v6 = [(TabDocument *)self navigationBarItem];
    [v6 setOverlayConfiguration:v5];

    id v7 = [v11 urlFieldOverlayNarrowConfiguration];
    id v8 = [(TabDocument *)self navigationBarItem];
    [v8 setOverlayNarrowConfiguration:v7];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v10 = [WeakRetained pageFormatMenuController];
  [v10 reloadBrowsingAssistantIfNeeded];
}

- (void)sfScribbleController:(id)a3 presentAlert:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabDocument:self presentViewControllerAnimated:v6];
}

- (id)overlayContainerViewForScribbleController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v4 = [WeakRetained rootViewController];
  id v5 = [v4 documentAndTopBarsContainerView];

  return v5;
}

- (NSArray)normalBrowsingUserContentControllers
{
  uint64_t v2 = +[Application sharedApplication];
  uint64_t v3 = [v2 cachedUserContentControllersForAllProfiles];

  return (NSArray *)v3;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  uint64_t v2 = +[Application sharedApplication];
  uint64_t v3 = [v2 scribbleQuirksManager];

  return (WBSScribbleQuirksManager *)v3;
}

- (void)_webView:(id)a3 didAdjustVisibilityWithSelectors:(id)a4
{
  id v4 = [(TabDocument *)self sfScribbleController];
  [v4 updateCountForElementsHiddenByPaintingAvoidance];
}

- (unint64_t)autoFillFormType
{
  return [(_SFFormAutoFillController *)self->_autoFillController autoFillFormType];
}

- (id)tabEntityUUIDForView:(id)a3
{
  if (self->_cachedView == a3 && self->_active) {
    uint64_t v3 = self->_uuid;
  }
  else {
    uint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)tabEntityIsPrimaryForView:(id)a3
{
  return 1;
}

- (BOOL)hasDoneReaderDetection
{
  return self->_hasDoneReaderAvailabilityDetection;
}

- (NSArray)titleWords
{
  return self->_titleWords;
}

- (void)setTitleWords:(id)a3
{
}

- (NSString)lastSearchTerm
{
  return self->_lastSearchTerm;
}

- (void)setLastSearchTerm:(id)a3
{
}

- (NSString)titleForLastSearch
{
  return self->_titleForLastSearch;
}

- (void)setTitleForLastSearch:(id)a3
{
}

- (NSString)URLStringForLastSearch
{
  return self->_URLStringForLastSearch;
}

- (void)setURLStringForLastSearch:(id)a3
{
}

- (NSArray)URLStringComponents
{
  return self->_URLStringComponents;
}

- (void)setURLStringComponents:(id)a3
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

- (WBSTranslationContext)translationContext
{
  return self->_translationContext;
}

- (BOOL)wasLoadedWithContentBlockersEnabled
{
  return self->_wasLoadedWithContentBlockersEnabled;
}

- (BOOL)wasLoadedWithPrivateRelay
{
  return self->_wasLoadedWithPrivateRelay;
}

- (BOOL)isNavigatingViaReloadWithoutPrivateRelay
{
  return self->_isNavigatingViaReloadWithoutPrivateRelay;
}

- (void)setIsNavigatingViaReloadWithoutPrivateRelay:(BOOL)a3
{
  self->_isNavigatingViaReloadWithoutPrivateReladouble y = a3;
}

- (BOOL)wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections
{
  return self->_wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections;
}

- (WBSWebExtensionTabPosition)previousWebExtensionTabPosition
{
  return self->_previousWebExtensionTabPosition;
}

- (void)setPreviousWebExtensionTabPosition:(id)a3
{
}

- (WBSBrowsingAssistantController)assistantController
{
  return self->_assistantController;
}

- (TabOverviewItem)tabOverviewItem
{
  return self->_tabOverviewItem;
}

- (TabDocumentCollectionItem)tabCollectionItem
{
  return self->_tabCollectionItem;
}

- (BOOL)hasEnteredScribbleMode
{
  return self->_hasEnteredScribbleMode;
}

- (NSArray)ancestorUUIDs
{
  return self->_ancestorUUIDs;
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

- (BOOL)suppressWebExtensionEvents
{
  return self->_suppressWebExtensionEvents;
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (TabDocument)parentTabDocumentForBackClosesSpawnedTab
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);
  return (TabDocument *)WeakRetained;
}

- (void)setQuickLookDocument:(id)a3
{
}

- (BOOL)wasOpenedFromLink
{
  return self->_wasOpenedFromLink;
}

- (void)setWasOpenedFromLink:(BOOL)a3
{
  self->_wasOpenedFromLink = a3;
}

- (BOOL)shouldRestoreReader
{
  return self->_shouldRestoreReader;
}

- (void)setShouldRestoreReader:(BOOL)a3
{
  self->_BOOL shouldRestoreReader = a3;
}

- (int64_t)readerViewTopScrollOffset
{
  return self->_readerViewTopScrollOffset;
}

- (void)setReaderViewTopScrollOffset:(int64_t)a3
{
  self->_readerViewTopScrollOffset = a3;
}

- (void)setAppBanner:(id)a3
{
}

- (BOOL)shouldRevealAppLinkBannerForNextCommit
{
  return self->_shouldRevealAppLinkBannerForNextCommit;
}

- (void)setShouldRevealAppLinkBannerForNextCommit:(BOOL)a3
{
  self->_shouldRevealAppLinkBannerForNextCommit = a3;
}

- (BOOL)appBannerRemovalWasDeferred
{
  return self->_appBannerRemovalWasDeferred;
}

- (void)setAppBannerRemovalWasDeferred:(BOOL)a3
{
  self->_appBannerRemovalWasDeferred = a3;
}

- (NSString)sourceApplicationBundleIdentifierForNextCommit
{
  return self->_sourceApplicationBundleIdentifierForNextCommit;
}

- (BOOL)storeBannersAreDisabled
{
  return self->_storeBannersAreDisabled;
}

- (void)setStoreBannersAreDisabled:(BOOL)a3
{
  self->_storeBannersAreDisabled = a3;
}

- (int64_t)externalAppRedirectState
{
  return self->_externalAppRedirectState;
}

- (void)setExternalAppRedirectState:(int64_t)a3
{
  self->_externalAppRedirectState = a3;
}

- (WebBookmark)readingListBookmark
{
  return self->_readingListBookmark;
}

- (BOOL)suppressingProgressAnimationForNavigationGesture
{
  return self->_suppressingProgressAnimationForNavigationGesture;
}

- (BOOL)wantsReaderWhenActivated
{
  return self->_wantsReaderWhenActivated;
}

- (void)setWantsReaderWhenActivated:(BOOL)a3
{
  self->_wantsReaderWhenActivated = a3;
}

- (BOOL)isDisplayingStandaloneImage
{
  return self->_displayingStandaloneImage;
}

- (void)setDisplayingStandaloneImage:(BOOL)a3
{
  self->_displayingStandaloneImage = a3;
}

- (BOOL)isDisplayingStandaloneMedia
{
  return self->_displayingStandaloneMedia;
}

- (void)setDisplayingStandaloneMedia:(BOOL)a3
{
  self->_displayingStandaloneMedia = a3;
}

- (BOOL)wasHibernatedDueToMemoryWarning
{
  return self->_hibernatedDueToMemoryWarning;
}

- (void)setHibernatedDueToMemoryWarning:(BOOL)a3
{
  self->_hibernatedDueToMemoryWarning = a3;
}

- (unint64_t)sessionStateRestorationSource
{
  return self->_sessionStateRestorationSource;
}

- (void)setSessionStateRestorationSource:(unint64_t)a3
{
  self->_sessionStateRestorationSource = a3;
}

- (TabDocumentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabDocumentDelegate *)WeakRetained;
}

- (LoadProgressObserver)loadProgressObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
  return (LoadProgressObserver *)WeakRetained;
}

- (void)setLoadProgressObserver:(id)a3
{
}

- (BOOL)webViewIsFullscreen
{
  return self->_webViewIsFullscreen;
}

- (LinkPreviewViewController)linkPreviewViewController
{
  return self->_linkPreviewViewController;
}

- (void)setLinkPreviewViewController:(id)a3
{
}

- (_SFFormAutoFillController)autoFillController
{
  return self->_autoFillController;
}

- (PageLoadTestStatistics)pageLoadStatistics
{
  return self->_pageLoadStatistics;
}

- (void)setPageLoadStatistics:(id)a3
{
}

- (BOOL)allowsProgrammaticFocusToBeginInputSession
{
  return self->_allowsProgrammaticFocusToBeginInputSession;
}

- (void)setAllowsProgrammaticFocusToBeginInputSession:(BOOL)a3
{
  self->_allowsProgrammaticFocusToBeginInputSession = a3;
}

- (NSURL)URLFromExternalApplication
{
  return self->_URLFromExternalApplication;
}

- (void)setURLFromExternalApplication:(id)a3
{
}

- (_SFPageLoadErrorController)pageLoadErrorController
{
  return self->_pageLoadErrorController;
}

- (BOOL)isShowingInlineDialog
{
  return self->_showingInlineDialog;
}

- (WBSSameDocumentNavigationToHistoryVisitCorrelator)sameDocumentNavigationToHistoryVisitCorrelator
{
  return self->_sameDocumentNavigationToHistoryVisitCorrelator;
}

- (BOOL)persistWhenHibernated
{
  return self->_persistWhenHibernated;
}

- (void)setPersistWhenHibernated:(BOOL)a3
{
  self->_persistWhenHibernated = a3;
}

- (void)setInteractivelyInserted:(BOOL)a3
{
  self->_interactivelyInserted = a3;
}

- (BOOL)hasBeenInserted
{
  return self->_hasBeenInserted;
}

- (void)setLibraryType:(id)a3
{
}

- (void)setPreparingForNewUserActivity:(BOOL)a3
{
  self->_preparingForNewUserActivitdouble y = a3;
}

- (BOOL)isShowingSearchQueryInNavigationBar
{
  return self->_isShowingSearchQueryInNavigationBar;
}

- (_SFSafeBrowsingController)safeBrowsingController
{
  return self->_safeBrowsingController;
}

- (NSString)lastSiriReaderSessionIdentifier
{
  return self->_lastSiriReaderSessionIdentifier;
}

- (void)setLastSiriReaderSessionIdentifier:(id)a3
{
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (BOOL)canStopLoading
{
  return self->_canStopLoading;
}

- (CGPoint)scrollPoint
{
  double x = self->_scrollPoint.x;
  double y = self->_scrollPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScrollPoint:(CGPoint)a3
{
  self->_scrollPoint = a3;
}

- (BOOL)supportsReuseForSpotlightSearch
{
  return self->_supportsReuseForSpotlightSearch;
}

- (void)setSupportsReuseForSpotlightSearch:(BOOL)a3
{
  self->_BOOL supportsReuseForSpotlightSearch = a3;
}

- (NSURL)tabReuseURL
{
  return self->_tabReuseURL;
}

- (void)setTabReuseURL:(id)a3
{
}

- (void)setTabGroupTab:(id)a3
{
}

- (WBSHistoryVisit)lastVisit
{
  return self->_lastVisit;
}

- (void)setLastVisit:(id)a3
{
}

- (BOOL)isPerformingFirstLoadAfterOpenInBackground
{
  return self->_performingFirstLoadAfterOpenInBackground;
}

- (void)setPerformingFirstLoadAfterOpenInBackground:(BOOL)a3
{
  self->_performingFirstLoadAfterOpenInBackground = a3;
}

- (BOOL)isPerformingRedirectAfterOpenInBackground
{
  return self->_performingRedirectAfterOpenInBackground;
}

- (void)setPerformingRedirectAfterOpenInBackground:(BOOL)a3
{
  self->_performingRedirectAfterOpenInBackground = a3;
}

- (BOOL)didFirstMeaningfulPaint
{
  return self->_didFirstMeaningfulPaint;
}

- (BOOL)contentIsReadyForSnapshot
{
  return self->_contentIsReadyForSnapshot;
}

- (void)setSearchableItemAttributes:(id)a3
{
}

- (WBSSiriIntelligenceDonorPersonalizationData)personalizationData
{
  return self->_personalizationData;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (BOOL)mediaCaptureEnabled
{
  return self->_mediaCaptureEnabled;
}

- (void)setMediaCaptureEnabled:(BOOL)a3
{
  self->_mediaCaptureEnabled = a3;
}

- (STBlockingViewController)associatedBlockingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedBlockingViewController);
  return (STBlockingViewController *)WeakRetained;
}

- (void)setAssociatedBlockingViewController:(id)a3
{
}

- (unint64_t)mediaSuspensionReasons
{
  return self->_mediaSuspensionReasons;
}

- (void)setMediaSuspensionReasons:(unint64_t)a3
{
  self->_unint64_t mediaSuspensionReasons = a3;
}

- (BOOL)hasFormControlInteraction
{
  return self->_hasFormControlInteraction;
}

- (BOOL)previousLoadingCompleteStateForWebExtensionOnUpdatedEvent
{
  return self->_previousLoadingCompleteStateForWebExtensionOnUpdatedEvent;
}

- (NSString)previousTitleForWebExtensionOnUpdatedEvent
{
  return self->_previousTitleForWebExtensionOnUpdatedEvent;
}

- (NSURL)previousURLForWebExtensionOnUpdatedEvent
{
  return self->_previousURLForWebExtensionOnUpdatedEvent;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (id)linkAddedToUserActivityCallback
{
  return self->_linkAddedToUserActivityCallback;
}

- (void)setLinkAddedToUserActivityCallback:(id)a3
{
}

- (NSUserActivity)userActivityFromNotes
{
  return self->_userActivityFromNotes;
}

- (void)setUserActivityFromNotes:(id)a3
{
}

- (BOOL)nextLoadComesFromSearchPage
{
  return self->_nextLoadComesFromSearchPage;
}

- (void)setNextLoadComesFromSearchPage:(BOOL)a3
{
  self->_nextLoadComesFromSearchPage = a3;
}

- (BOOL)shouldKeepIgnoredSiriSuggestedSitesOnLoad
{
  return self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad;
}

- (void)setShouldKeepIgnoredSiriSuggestedSitesOnLoad:(BOOL)a3
{
  self->_shouldKeepIgnoredSiriSuggestedSitesOnLoad = a3;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policdouble y = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityFromNotes, 0);
  objc_storeStrong(&self->_linkAddedToUserActivityCallback, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_previousURLForWebExtensionOnUpdatedEvent, 0);
  objc_storeStrong((id *)&self->_previousTitleForWebExtensionOnUpdatedEvent, 0);
  objc_destroyWeak((id *)&self->_associatedBlockingViewController);
  objc_storeStrong((id *)&self->_readerWebView, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_personalizationData, 0);
  objc_storeStrong((id *)&self->_searchableItemAttributes, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_lastVisit, 0);
  objc_storeStrong((id *)&self->_tabGroupTab, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_tabReuseURL, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
  objc_storeStrong((id *)&self->_lastSiriReaderSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_safeBrowsingController, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_libraryType, 0);
  objc_storeStrong((id *)&self->_sameDocumentNavigationToHistoryVisitCorrelator, 0);
  objc_storeStrong((id *)&self->_pageLoadErrorController, 0);
  objc_storeStrong((id *)&self->_URLFromExternalApplication, 0);
  objc_storeStrong((id *)&self->_pageLoadStatistics, 0);
  objc_storeStrong((id *)&self->_autoFillController, 0);
  objc_storeStrong((id *)&self->_linkPreviewViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_readingListBookmark, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifierForNextCommit, 0);
  objc_storeStrong((id *)&self->_privateBrowsingPrivacyProtectionsBanner, 0);
  objc_storeStrong((id *)&self->_appBanner, 0);
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_destroyWeak((id *)&self->_parentTabDocumentForBackClosesSpawnedTab);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_pinnedURL, 0);
  objc_storeStrong((id *)&self->_pinnedTitle, 0);
  objc_storeStrong((id *)&self->_ancestorUUIDs, 0);
  objc_storeStrong((id *)&self->_trackerInfo, 0);
  objc_storeStrong((id *)&self->_tabCollectionItem, 0);
  objc_storeStrong((id *)&self->_tabOverviewItem, 0);
  objc_storeStrong((id *)&self->_unifiedTabBarItem, 0);
  objc_storeStrong((id *)&self->_tabBarItem, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_storeStrong((id *)&self->_previousWebExtensionTabPosition, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_translationContext, 0);
  objc_storeStrong((id *)&self->_contextController, 0);
  objc_storeStrong((id *)&self->_URLStringComponents, 0);
  objc_storeStrong((id *)&self->_URLStringForLastSearch, 0);
  objc_storeStrong((id *)&self->_titleForLastSearch, 0);
  objc_storeStrong((id *)&self->_lastSearchTerm, 0);
  objc_storeStrong((id *)&self->_titleWords, 0);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_biomeWebpageIdentifier, 0);
  objc_storeStrong((id *)&self->_pageContextDataFetcher, 0);
  objc_storeStrong((id *)&self->_speculativeLoadNavigationResponse, 0);
  objc_storeStrong((id *)&self->_lastWebViewIncreaseZoomDate, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_cachedURLForDebugTitle, 0);
  objc_storeStrong((id *)&self->_cachedDebugTitle, 0);
  objc_storeStrong((id *)&self->_deferredNavigationTitle, 0);
  objc_storeStrong((id *)&self->_deferredNavigationURL, 0);
  objc_storeStrong((id *)&self->_permissionDialogThrottler, 0);
  objc_storeStrong((id *)&self->_fireOnUpdatedWebExtensionEventTimer, 0);
  objc_storeStrong((id *)&self->_webExtensionsStateObserver, 0);
  objc_storeStrong((id *)&self->_suggestedFilenameForNextCommit, 0);
  objc_storeStrong((id *)&self->_quickLookDocumentWriter, 0);
  objc_storeStrong((id *)&self->_urlForDisplayedContent, 0);
  objc_storeStrong((id *)&self->_downloadReflectedInFluidProgress, 0);
  objc_storeStrong((id *)&self->_elementInfoToAnimateForNextDownload, 0);
  objc_storeStrong((id *)&self->_domainWhereUserDeclinedAutomaticStrongPassword, 0);
  objc_storeStrong((id *)&self->_navigationUtilitiesManager, 0);
  objc_storeStrong((id *)&self->_highLevelDomainForHTTPSOnlyBypass, 0);
  objc_storeStrong((id *)&self->_contentBlockerStatisticsStore, 0);
  objc_storeStrong((id *)&self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections, 0);
  objc_storeStrong((id *)&self->_previousWebPageURLBeforeNavigation, 0);
  objc_storeStrong((id *)&self->_urlToReloadEnablingPrivateRelay, 0);
  objc_storeStrong((id *)&self->_urlToReloadForcingContentBlockers, 0);
  objc_destroyWeak((id *)&self->_updateFaviconTimer);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong(&self->_faviconToken, 0);
  objc_storeStrong((id *)&self->_cachedURL, 0);
  objc_storeStrong(&self->_pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  objc_storeStrong((id *)&self->_cachedActivityItemProvider, 0);
  objc_storeStrong((id *)&self->_cachedCanonicalURL, 0);
  objc_storeStrong((id *)&self->_spawnedTabDocuments, 0);
  objc_destroyWeak((id *)&self->_webKitDragSession);
  objc_storeStrong((id *)&self->_deferredDropWasHandledByWebKit, 0);
  objc_storeStrong((id *)&self->_deferredDropNavigationIntent, 0);
  objc_storeStrong(&self->_unresponsiveWebProcessBlock, 0);
  objc_storeStrong((id *)&self->_unresponsiveWebProcessTimer, 0);
  objc_storeStrong((id *)&self->_donateTextTimer, 0);
  objc_storeStrong((id *)&self->_pageLoadTest, 0);
  objc_storeStrong((id *)&self->_secIdentityPreferencesController, 0);
  objc_storeStrong((id *)&self->_lastUserInitiatedAction, 0);
  objc_storeStrong((id *)&self->_telephonyNavigationPolicy, 0);
  objc_storeStrong((id *)&self->_dateOfLastFinishedNavigation, 0);
  objc_storeStrong((id *)&self->_appBannerRemovalTimer, 0);
  objc_storeStrong((id *)&self->_appBannerPendingFirstPaint, 0);
  objc_storeStrong((id *)&self->_storeBanner, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentNoteTakingCheck, 0);
  objc_storeStrong((id *)&self->_highlightFromNavigation, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentHighlightBannerCheck, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentAppLinkBannerCheck, 0);
  objc_storeStrong((id *)&self->_bookmarkForIconFetching, 0);
  objc_storeStrong((id *)&self->_sfScribbleController, 0);
  objc_storeStrong((id *)&self->_readerContext, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
  objc_storeStrong((id *)&self->_findMatchesCounter, 0);
  objc_storeStrong((id *)&self->_navigationObservers, 0);
  objc_storeStrong((id *)&self->_renderingProgressEventObservers, 0);
  objc_storeStrong((id *)&self->_lastURLForWhichUsageStateWasSet, 0);
  objc_storeStrong((id *)&self->_cachedView, 0);
  objc_storeStrong((id *)&self->_activeDownload, 0);
  objc_storeStrong((id *)&self->_applicationManifestFetcher, 0);
  objc_storeStrong((id *)&self->_parentTabItem, 0);
  objc_storeStrong((id *)&self->_overrideURLForHTTPAuthenticationDialog, 0);
  objc_storeStrong((id *)&self->_initialArticleScrollDictionaryForCloudTab, 0);
  objc_storeStrong((id *)&self->_fluidProgressController, 0);
  objc_storeStrong((id *)&self->_loadingController, 0);
  objc_storeStrong(&self->_autoFillAuthenticationCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_findCompletionProvider);
  objc_storeStrong((id *)&self->_fallbackURLs, 0);
  objc_storeStrong((id *)&self->_touchIconFetcher, 0);
  objc_storeStrong((id *)&self->_webClipMetadataFetcher, 0);
  objc_storeStrong((id *)&self->_activityJSController, 0);
  objc_storeStrong((id *)&self->_calendarEventDetector, 0);
  objc_storeStrong((id *)&self->_reloadOptionsController, 0);
  objc_storeStrong((id *)&self->_sharingExtensionController, 0);
  objc_storeStrong((id *)&self->_appBannerMetaTagContentObserverInterface, 0);
  objc_storeStrong((id *)&self->_siteSpecificSearchEventListenerInterface, 0);
  objc_storeStrong((id *)&self->_savedSessionState, 0);
  objc_storeStrong((id *)&self->_URLSpoofingMitigator, 0);
  objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, 0);
  objc_storeStrong((id *)&self->_lastLoadError, 0);
}

- (void)_webView:(std::__shared_weak_count *)this willSubmitFormValues:userObject:submissionHandler:
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3C25D80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

- (void)_webView:(std::__shared_weak_count *)a1 willSubmitFormValues:userObject:submissionHandler:
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F3C25D80;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E4E421E0);
}

- (void)_webView:(uint64_t)a1 willSubmitFormValues:userObject:submissionHandler:
{
  if (!*(unsigned char *)(a1 + 32) && ([MEMORY[0x1E4F97EA0] hasInternalContent] & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 24) + 16))();
  }
  uint64_t v2 = *(void **)(a1 + 24);
}

void __30__TabDocument_NonARC__release__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1E102C000, log, OS_LOG_TYPE_FAULT, "-[TabDocument dealloc] should be called on the main thread", v1, 2u);
}

- (void)setActive:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1E102C000, a2, OS_LOG_TYPE_FAULT, "TabDocument %p is being activated despite being closed.", (uint8_t *)&v2, 0xCu);
}

void __39__TabDocument_restoreAllHighlightsData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Fetching highlight data failed: %{public}@", v5);
}

- (void)_terminateWebProcessIfNeededAndShowCrashBanner:thenDo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Killed a web process immediately, even though it may have been responsive", v2, v3, v4, v5, v6);
}

- (void)_terminateWebProcessIfNeededAndShowCrashBanner:thenDo:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Terminating an unresponsive web process, even though there's still pending work from a previous termination", v2, v3, v4, v5, v6);
}

void __77__TabDocument__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Failed to save Wallet Order: %{public}@", v5);
}

- (void)showDownload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1E102C000, v0, OS_LOG_TYPE_FAULT, "Attempted to open a download with a nil URL", v1, 2u);
}

- (void)_showDownload:path:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Failed to download Profile; data is nil on disk", v2, v3, v4, v5, v6);
}

- (void)_showDownload:path:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "PassBook Pass download failed: %{public}@", v5);
}

- (void)_showDownload:path:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E102C000, v0, v1, "Calendar file download failed", v2, v3, v4, v5, v6);
}

void __34__TabDocument__showDownload_path___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Greenfield download failed: %{public}@", v5);
}

void __34__TabDocument__showDownload_path___block_invoke_288_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Profile failed to install: %{public}@", v5);
}

- (void)history
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Tab created with profile '%@' (%{public}@)", buf, 0x16u);
}

- (void)webView:(uint64_t *)a1 decidePolicyForNavigationAction:(NSObject *)a2 preferences:decisionHandler:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "Killing web process as a mitigation after it has rapidly attempted %zd navigations concurrently", (uint8_t *)&v3, 0xCu);
}

- (void)_donateTextAllowingDonationWithoutReaderText:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1E102C000, v0, OS_LOG_TYPE_DEBUG, "Deferring Siri Intelligence donation until Reader text becomes available", v1, 2u);
}

- (void)_donateTextAllowingDonationWithoutReaderText:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.808e-34);
  _os_log_debug_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEBUG, "Page URL: %{private}@", v4, 0xCu);
}

- (void)_donateTextAllowingDonationWithoutReaderText:(char)a1 .cold.3(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
}

- (void)pageContextDataFetcherDidFinishFetching:forURL:withError:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1E102C000, v3, v4, "Failed to extract schema data from webpage: %{public}@", v5);
}

@end