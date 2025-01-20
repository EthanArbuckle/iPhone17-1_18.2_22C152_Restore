@interface BKBookViewController
+ (BOOL)areCitationsAllowedForBook:(id)a3;
+ (BOOL)useEnhancedEditMenu;
+ (id)propertySourceFromBook:(id)a3;
+ (id)valueOfAnnotationProperty:(id)a3 activityType:(id)a4 book:(id)a5;
+ (void)initialize;
- (AEAnnotationProvider)annotationProvider;
- (AEAsset)asset;
- (AEAssetOpenAnimating)contentOpenAnimator;
- (AEAssetViewControllerDelegate)assetViewControllerDelegate;
- (AEBookInfo)book;
- (AENotePopoverEditorController)noteEditor;
- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData;
- (BAContentData)cachedContentData;
- (BAContentSettingsData)analyticsContentSettingData;
- (BAUpSellData)upSellData;
- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo;
- (BCAugmentedExperienceManager)experienceManager;
- (BCDDParsecCollectionViewController)referenceLibraryViewController;
- (BCDisplaySleepController)displaySleepController;
- (BCTouchBarController)touchBarController;
- (BCUIHoverInteraction)hoverInteraction;
- (BEProtocolCacheItem)currentBookCacheItem;
- (BKActionController)actionController;
- (BKAudioController)audioController;
- (BKBookViewController)initWithBook:(id)a3 storeID:(id)a4;
- (BKBrightnessController)brightnessController;
- (BKExpandedContentViewController)expandedContentViewController;
- (BKFootnoteViewController2)footnoteController;
- (BKLocation)location;
- (BKLocation)openingLocation;
- (BKLocation)reportedLocation;
- (BKLocation)resumeLocation;
- (BKLocation)savableLocation;
- (BKLocation)tocCurrentLocation;
- (BKNavigationHistory)navigationHistory;
- (BKPageNavigationViewController)pageNavigationViewController;
- (BKPaginationController)paginationController;
- (BKSearchResult)searchResult;
- (BKUpsell)upsellContentViewController;
- (BOOL)_controller:(id)a3 handleInternalRequestForURL:(id)a4;
- (BOOL)_currentChapterInfo:(id *)a3 uniqueID:(id *)a4;
- (BOOL)_inAnalyticsReadSession;
- (BOOL)_isFocusedOnSecondPageOfSpread;
- (BOOL)_isManualCurlInProgress;
- (BOOL)_isPageAllZeros:(_NSRange)a3;
- (BOOL)_isPageEmpty:(_NSRange)a3;
- (BOOL)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5;
- (BOOL)allowsScrollMode;
- (BOOL)annotationChangeRequiresPaginationUpdate;
- (BOOL)autoHidesToolbarInFullscreen;
- (BOOL)autoNightModeForAppearanceViewController:(id)a3;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)bc_analyticsVisibilityOfSelf;
- (BOOL)bkaxAccessibilityUserIsRequestingControlsVisibilityToggle;
- (BOOL)bkaxNeedsPersistentControls;
- (BOOL)bookCanBeBookmarked;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canCopy;
- (BOOL)canDismissControls;
- (BOOL)canGoToNextPage;
- (BOOL)canGoToPreviousPage;
- (BOOL)canNavigateByChapter;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canSearch;
- (BOOL)canShowContent;
- (BOOL)canTurnPagesAutomatically;
- (BOOL)canTurnPagesAutomaticallyForToolbarItem:(id)a3;
- (BOOL)canTurnPagesAutomaticallyWhileReadingAloudForToolbar:(id)a3;
- (BOOL)controlsEnabledViaHover;
- (BOOL)controlsVisible;
- (BOOL)dismissShouldBegin:(id)a3;
- (BOOL)editorController:(id)a3 isSharingEnabledForAnnotation:(id)a4;
- (BOOL)expandedContentView:(id)a3 shouldStartLoadWithRequest:(id)a4;
- (BOOL)expandedContentViewController:(id)a3 handleInternalLoadRequest:(id)a4;
- (BOOL)footnoteViewController:(id)a3 handleInternalLoadRequest:(id)a4;
- (BOOL)hasCheckedForRemoteResources;
- (BOOL)hasHighlightedText;
- (BOOL)hasRemoteResources;
- (BOOL)hasSoundtrack;
- (BOOL)hasSpreadPages;
- (BOOL)hasTextSelected;
- (BOOL)hidesPageControlsOnOpen;
- (BOOL)inLiveResize;
- (BOOL)isAnnotationVisible:(id)a3;
- (BOOL)isBookToolbarAppearanceDark;
- (BOOL)isEditingAnnotation:(id)a3;
- (BOOL)isLocationOnCurrentPage:(id)a3;
- (BOOL)isOnLastPage;
- (BOOL)isPageBookmarked;
- (BOOL)isPageProgressionRTL;
- (BOOL)isPreordered;
- (BOOL)isReadAloudPaused;
- (BOOL)isReading;
- (BOOL)isRotationInProgress;
- (BOOL)isSharingSupported;
- (BOOL)isSoundtrackPlaying;
- (BOOL)isSoundtrackPlayingForToolbar:(id)a3;
- (BOOL)isSoundtrackPlayingForToolbarItem:(id)a3;
- (BOOL)isTOCURL:(id)a3;
- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3;
- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3;
- (BOOL)onlySupportsScrollingLayout;
- (BOOL)pageNavigationController:(id)a3 shouldDelayChangeToPageOffset:(int64_t)a4 completion:(id)a5;
- (BOOL)playNextItemAbortedWhileInactive;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)safeToShowToolbarItems;
- (BOOL)shouldAcceptLocationUpdateFromGlobalAnnotation:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldBookmarkButtonsBeEnabled;
- (BOOL)shouldControlsBeVisibleOnOpen;
- (BOOL)shouldDisplayBookmarkMenu;
- (BOOL)shouldDisplayBookmarksButton;
- (BOOL)shouldDisplayBuyButton;
- (BOOL)shouldDisplayContentsButton;
- (BOOL)shouldDisplayGlossaryButton;
- (BOOL)shouldDisplayHighlightsButton;
- (BOOL)shouldDisplayPageThumbnailsButton;
- (BOOL)shouldDisplayReadaloudControls;
- (BOOL)shouldDisplaySearchControls;
- (BOOL)shouldDisplaySettingsControls;
- (BOOL)shouldDisplayShareControls;
- (BOOL)shouldDisplayStudyCardsButton;
- (BOOL)shouldDisplayTitleWhenActive;
- (BOOL)shouldDisplayTitleWhenInactive;
- (BOOL)shouldForceJumpOnSearch;
- (BOOL)shouldGroupModeControls;
- (BOOL)shouldSavePageControlVisibility;
- (BOOL)shouldSyncLocation:(id)a3;
- (BOOL)simulateManualPageTurn:(BOOL)a3 time:(double)a4;
- (BOOL)touchBarWantsHistoryNav;
- (BOOL)touchBarWantsReadAloud;
- (BOOL)touchBarWantsScroller;
- (BOOL)touchBarWantsSearch;
- (BOOL)transitionRightToLeft;
- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4;
- (BOOL)turnState;
- (BOOL)usePrimarySidebar;
- (BOOL)userNavigated;
- (BOOL)wantsToolbarVisible;
- (CGRect)frameForLocation:(id)a3 inView:(id)a4 expandedContentViewController:(id)a5;
- (IMPerformSelectorProxy)performSelectorProxy;
- (LTUITranslationViewController)translationViewController;
- (NSDate)analyticsReadStartDate;
- (NSHashTable)bookmarkObservers;
- (NSMutableDictionary)contentViewControllers;
- (NSNumber)analyticsReadStartProgress;
- (NSNumber)readingLocationHighwaterMark;
- (NSObject)bookPositionProcessor;
- (NSString)buyParameters;
- (NSString)lastLayoutUsedKey;
- (NSString)priceString;
- (NSURL)storeShortURL;
- (UIView)footnoteSourceView;
- (UIViewController)activityViewController;
- (_NSRange)currentPages;
- (_NSRange)pageRangeForAnnotation:(id)a3;
- (double)hidesPageControlsOnOpenDelay;
- (double)pagePositionForTouchBarPosition:(double)a3;
- (double)savePageControlVisibilityDelay;
- (double)touchBarPositionForPageNumber:(int64_t)a3;
- (double)touchBarScrollerEndScrollPositionForPosition:(double)a3;
- (double)touchBarScrollerPositionForBookmark:(id)a3;
- (double)touchBarScrollerPositionForChapter:(id)a3;
- (float)volume;
- (id)_allAnnotationsForType:(int)a3;
- (id)_analyticsSessionHost;
- (id)_contentControllerThatHasCopyableSelection;
- (id)_contentSettingsDataFromReadingSessionData:(id)a3 optedIn:(BOOL)a4;
- (id)_createEndOfBookExperience;
- (id)_currentReadingProgress;
- (id)_footnoteViewController2ForResource:(id)a3 stylesheetSet:(id)a4;
- (id)_locationForChapter:(id)a3;
- (id)_normalizedLocation:(id)a3;
- (id)_prepareSmilMapOn:(_NSRange)a3;
- (id)_readPlayer;
- (id)_searchQueryFromSender:(id)a3;
- (id)_searchResultOffsetByDistance:(int64_t)a3;
- (id)_trackPlayer;
- (id)_visibleAnnotationsForType:(int)a3;
- (id)addAnnotation:(int)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6;
- (id)allBookmarkIdentifiers;
- (id)analyticsReadingSettingsData;
- (id)appearanceMenuItems;
- (id)bookToolbarCurrentPageString;
- (id)bookToolbarShareURL;
- (id)bookToolbarThemeID;
- (id)bookToolbarTitle;
- (id)bookmarkToolTip;
- (id)bookmarksFetchRequestForBook:(id)a3 moc:(id)a4;
- (id)buttonColor;
- (id)buttonTitleColor;
- (id)chapterColor;
- (id)chapterTitleForAnnotation:(id)a3;
- (id)contentData;
- (id)contentDataForSearchViewController:(id)a3;
- (id)contentSubType;
- (id)contentViewController:(id)a3 addAnnotation:(int)a4 location:(id)a5 selectedText:(id)a6 representativeText:(id)a7;
- (id)contentViewController:(id)a3 fullScreenNoteEditorForAnnotation:(id)a4;
- (id)contentViewControllerForAnnotation:(id)a3;
- (id)contentViewControllerForLocation:(id)a3;
- (id)contentViewControllerForMediaOverlayElement:(id)a3;
- (id)contentViewControllerForPageNumber:(int64_t)a3;
- (id)currentLocation;
- (id)currentPageLocation;
- (id)currentSoundtrack;
- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4;
- (id)directoryContent:(id)a3 pageTitleForPageNumber:(int64_t)a4;
- (id)directorySwitcher;
- (id)documentForLocation:(id)a3;
- (id)documentForURL:(id)a3;
- (id)environmentOverrideView;
- (id)environmentOverrideViewForPaginationController:(id)a3;
- (id)environmentOverrideViewForSearchViewController:(id)a3;
- (id)existingContentViewControllerForPageNumber:(int64_t)a3;
- (id)fullScreenNoteEditorForAnnotation:(id)a3;
- (id)getViewSnapshot;
- (id)itemProvidersForSharing;
- (id)keyCommands;
- (id)locationForPath:(id)a3 fragment:(id)a4;
- (id)nextSearchResult;
- (id)noteEditorHighlightedTextFont;
- (id)pageLocationForPageNumber:(int64_t)a3;
- (id)pageTitleForPageNumber:(int64_t)a3;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (id)previousSearchResult;
- (id)profileFuture;
- (id)protocolCacheItemForAEBookInfo:(id)a3;
- (id)readingSessionData;
- (id)readingSessionDataForSearchViewController:(id)a3;
- (id)savableLocationForLocation:(id)a3;
- (id)searchButtonItem;
- (id)searchModuleWithSearchString:(id)a3;
- (id)searchViewController;
- (id)searchViewController:(id)a3 chapterNameForSearchResult:(id)a4 pageNumber:(int64_t)a5;
- (id)searchViewControllerIfLoaded;
- (id)smilMapOnPages:(_NSRange)a3;
- (id)tintColorForNavbarButtons;
- (id)titleColor;
- (id)titleForChapterAtPageNumber:(int64_t)a3;
- (id)titleMutedColor;
- (id)tocToolTip;
- (id)tocViewController:(id)a3 chapterTitleForAnnotation:(id)a4;
- (id)tocViewController:(id)a3 pageTitleForAnnotation:(id)a4;
- (id)tocViewController:(id)a3 pageTitleForChapter:(id)a4;
- (id)tocViewControllerCurrentLocation:(id)a3;
- (id)tocViewControllerTocIdCssRules:(id)a3;
- (id)touchBarScrollerAccessibilityLabelForBookmark:(id)a3;
- (id)touchBarScrollerAccessibilityLabelForChapter:(id)a3;
- (id)touchBarScrollerAccessibilityLabelForCurrentScrollPosition;
- (id)touchBarScrollerChapters;
- (id)transitionContentBackgroundColor;
- (id)transitionContentView;
- (id)visibleCFIRange;
- (id)visiblePageBookmarks;
- (id)visiblePageHighlights;
- (int)pageProgressionDirection;
- (int)readAloudState;
- (int)section;
- (int)selectionHighlightType;
- (int)trackState;
- (int64_t)bookToolbarMode;
- (int64_t)bookToolbarTransparency;
- (int64_t)calculatePageCountExcludingUpsell;
- (int64_t)currentPageNumber;
- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4;
- (int64_t)doNotDisturbStatusAtStart;
- (int64_t)lastAnalyticsDeviceOrientationReported;
- (int64_t)pageCountExcludingUpsell;
- (int64_t)pageCountIncludingUpsell;
- (int64_t)pageNavigationCurrentReadAloudPageOffset:(id)a3;
- (int64_t)pageNumberForTouchBarPosition:(double)a3;
- (int64_t)pageNumberFromRange:(_NSRange)a3;
- (int64_t)preferredStatusBarUpdateAnimation;
- (int64_t)readerType;
- (int64_t)searchViewController:(id)a3 pageNumberForDocumentOrdinal:(int64_t)a4;
- (int64_t)themeInterfaceStyle;
- (int64_t)tocViewController:(id)a3 pageNumberForAnnotation:(id)a4;
- (int64_t)tocViewController:(id)a3 pageNumberForChapter:(id)a4;
- (int64_t)upsellPageNumber;
- (unint64_t)_itemIndexForCurrentPage;
- (unint64_t)defaultLayoutToUse;
- (unint64_t)lastLayoutUsed;
- (unint64_t)layout;
- (unint64_t)numberOfBookmarks;
- (unint64_t)pageNumberBeforeScrubbing;
- (unint64_t)scrollLayoutForBook:(id)a3;
- (unint64_t)searchStringLengthLimit;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)upsellOrdinal;
- (unint64_t)validLayoutForBook:(id)a3 desiredLayout:(unint64_t)a4;
- (void)_cleanupFootnoteViewController;
- (void)_contentReady:(id)a3;
- (void)_dismissSearchViewController;
- (void)_emitAnnotationActionEventIfNeededForAnnotationType:(int)a3;
- (void)_handleExternalLoadRequest:(id)a3 likelyUserInitiated:(BOOL)a4;
- (void)_highlightElement:(id)a3;
- (void)_newBADoNotDisturbDataWithStartStatus:(int64_t)a3 tracker:(id)a4 completion:(id)a5;
- (void)_nextDelayedPageHint:(id)a3;
- (void)_nextPageHint:(BOOL)a3 afterDelay:(double)a4;
- (void)_notifyBookmarkObservers;
- (void)_paginationComplete:(id)a3;
- (void)_performScrollTest:(id)a3 completionHandler:(id)a4;
- (void)_playNextItem;
- (void)_promptToLoadExternalContent:(id)a3;
- (void)_removeHighlightOnElement:(id)a3;
- (void)_reportLoadFailedAlertForError:(id)a3;
- (void)_reportResourceUnavailableForBookWithTitle:(id)a3 error:(id)a4;
- (void)_resume;
- (void)_setAudioSessionMix:(BOOL)a3;
- (void)_showExpandedContentForResource:(id)a3 atLocation:(id)a4 presentingFromTOC:(BOOL)a5 completion:(id)a6;
- (void)_startReadAloud:(BOOL)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateHoverInteraction;
- (void)_updateLocationFromAnnotation:(id)a3;
- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5;
- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5;
- (void)appearanceViewController:(id)a3 didChangeAutoNightMode:(BOOL)a4 previousValue:(BOOL)a5;
- (void)appearanceViewController:(id)a3 didChangeFont:(id)a4;
- (void)appearanceViewController:(id)a3 didChangeFontSize:(double)a4;
- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4;
- (void)appearanceViewController:(id)a3 didChangeTheme:(unint64_t)a4;
- (void)appearanceViewControllerShouldDismiss;
- (void)assetViewControllerPrepareForReload;
- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation;
- (void)assetViewControllerUpdateToolbarsForOpenAnimation;
- (void)audioPlaybackWillStart:(id)a3;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityWillDisappear;
- (void)bookMilestoneReached:(int64_t)a3;
- (void)bookPositionChanged:(id)a3;
- (void)bookSectionChanged:(id)a3;
- (void)bookmarkPage:(id)a3;
- (void)books_chapterBackward:(id)a3;
- (void)books_chapterEnd:(id)a3;
- (void)books_chapterForward:(id)a3;
- (void)books_chapterLeft:(id)a3;
- (void)books_chapterRight:(id)a3;
- (void)books_chapterStart:(id)a3;
- (void)books_close:(id)a3;
- (void)books_find:(id)a3;
- (void)books_findNext:(id)a3;
- (void)books_findPrevious:(id)a3;
- (void)books_search:(id)a3;
- (void)books_showContent:(id)a3;
- (void)books_toggleBookmark:(id)a3;
- (void)buildContextTree:(id)a3;
- (void)buy:(id)a3;
- (void)buyWithCompletion:(id)a3;
- (void)cancelPendingHidePageControls;
- (void)cancelPendingSavePageControlVisibility;
- (void)cancelPreloadForContent:(id)a3;
- (void)cleanupPopovers;
- (void)clearCurrentHighlighting;
- (void)clearInactiveContentViewControllers;
- (void)clearSearchResult;
- (void)clearSelectedAnnotation;
- (void)clearSelection;
- (void)close:(BOOL)a3;
- (void)contentFailedToLoadWithError:(id)a3;
- (void)contentView:(id)a3 didSelectMediaOverlayElement:(id)a4;
- (void)contentViewController:(id)a3 expandAnnotation:(id)a4 location:(id)a5 selectedText:(id)a6 representativeText:(id)a7;
- (void)contentViewController:(id)a3 goToLocation:(id)a4;
- (void)contentViewController:(id)a3 goToURL:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)contentViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)contentViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)contentViewController:(id)a3 searchForString:(id)a4;
- (void)contentViewController:(id)a3 setEndOfBookToLocation:(id)a4 range:(id)a5;
- (void)contentViewController:(id)a3 setFinishedAndCloseForAssetID:(id)a4;
- (void)contentViewController:(id)a3 setReadAloudState:(BOOL)a4;
- (void)contentViewController:(id)a3 setSearchString:(id)a4;
- (void)contentViewController:(id)a3 setTurnState:(BOOL)a4;
- (void)contentViewController:(id)a3 shareAnnotation:(id)a4 annotationRects:(id)a5 completion:(id)a6;
- (void)contentViewController:(id)a3 showAlertController:(id)a4 fromRect:(CGRect)a5 animated:(BOOL)a6;
- (void)contentViewController:(id)a3 showExpandedContentForResource:(id)a4 atLocation:(id)a5;
- (void)contentViewController:(id)a3 showHighlightingMenuForAnnotation:(id)a4;
- (void)contentViewController:(id)a3 showLookupForString:(id)a4 fromView:(id)a5 onClose:(id)a6;
- (void)contentViewController:(id)a3 showNoteForAnnotation:(id)a4;
- (void)contentViewController:(id)a3 showTranslateForText:(id)a4 fromView:(id)a5 onClose:(id)a6;
- (void)contentViewController:(id)a3 stopMediaPlay:(id)a4;
- (void)contentViewControllerAnnotationCacheDidChange:(id)a3;
- (void)contentViewFailedToLoad:(id)a3 error:(id)a4;
- (void)contentViewReady:(id)a3;
- (void)continueReadAloudAfterReady;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5;
- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5;
- (void)copy:(id)a3;
- (void)createPaginationControllerIfNeeded:(BOOL)a3;
- (void)dealloc;
- (void)delayedHidePageControls;
- (void)delayedSavePageControlVisibility;
- (void)didChangeCurrentOverlayViewController;
- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4;
- (void)didHideAnnotationEditor:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)directoryContent:(id)a3 didSelectLocation:(id)a4;
- (void)directoryContent:(id)a3 didSelectLocation:(id)a4 animated:(BOOL)a5;
- (void)dismissCurrentPopover;
- (void)dismissCurrentPopoverAnimated:(BOOL)a3;
- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4;
- (void)dismissPopover;
- (void)editorController:(id)a3 deleteAnnotation:(id)a4;
- (void)editorController:(id)a3 editNote:(id)a4;
- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5;
- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5;
- (void)editorController:(id)a3 shareAnnotation:(id)a4;
- (void)emitReadingOrientationChangeEventIfNeeded;
- (void)emitScrubEventStartPosition:(int64_t)a3 endPosition:(int64_t)a4 totalLength:(int64_t)a5;
- (void)expandAnnotation:(id)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6;
- (void)expandedContentViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)expandedContentViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4;
- (void)expandedContentViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)expandedContentViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)expandedContentViewDidDisappear:(id)a3;
- (void)fixupNavigationHistoryForUpsellPageNumber:(int64_t)a3;
- (void)footnoteViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5;
- (void)footnoteViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4;
- (void)footnoteViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5;
- (void)footnoteViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5;
- (void)footnoteViewDidDisappear:(id)a3;
- (void)footnoteViewDidFinishLoad:(id)a3;
- (void)forceReload;
- (void)forceRepagination;
- (void)goToPath:(id)a3 fragment:(id)a4 animated:(BOOL)a5;
- (void)handleAppearanceViewControllerDismissal;
- (void)handleSwitchControlStatusChanged:(id)a3;
- (void)handleVoiceOverStatusChanged:(id)a3;
- (void)hidePageControls:(id)a3;
- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4;
- (void)hoverInteractionDidSettle:(id)a3;
- (void)isLocationVisible:(id)a3 completion:(id)a4;
- (void)jumpAheadAnimated:(BOOL)a3;
- (void)jumpBackAnimated:(BOOL)a3;
- (void)jumpToBeginningAnimated:(BOOL)a3;
- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)managedObjectContextDidSave:(id)a3;
- (void)mediaPlaybackStarted:(id)a3;
- (void)notifyAppIntentsInfoChanged;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)open:(BOOL)a3;
- (void)openToLocation:(id)a3 animated:(BOOL)a4;
- (void)p_releaseDictionary;
- (void)pageNavigationDidChangeLocation:(id)a3;
- (void)pageNavigationDidSwipeToNextPage:(id)a3;
- (void)pageNavigationDidTryToSwipePastEndOfBook:(id)a3;
- (void)pageViewControllersDidChange;
- (void)paginationCompleted;
- (void)paginationUpdateRequired;
- (void)pauseReadAloud;
- (void)playCurrentSoundtrack;
- (void)player:(id)a3 callbackForTime:(double)a4;
- (void)playerCurrentItemEnded:(id)a3;
- (void)playerStateChanged:(id)a3;
- (void)popoverDidClose:(id)a3 fromToolbar:(id)a4;
- (void)preloadContentController:(id)a3 highPriority:(BOOL)a4;
- (void)preloadContentViewController:(id)a3 highPriority:(BOOL)a4;
- (void)presentAppearanceViewControllerFromItem:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)promptForRemoteResourcesIfNecessary;
- (void)readAloudViewControllerReady:(id)a3;
- (void)readNextPages:(id)a3;
- (void)readPages:(_NSRange)a3 from:(int64_t)a4 to:(int64_t)a5 waitOnEmpty:(BOOL)a6;
- (void)readingLocationChanged;
- (void)rebuildHoverRegions;
- (void)recordJumpFromCurrentLocation;
- (void)recordedJumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)registerBookmarkObserver:(id)a3;
- (void)releaseViews;
- (void)reloadExternalWebFrames;
- (void)requestClose:(BOOL)a3;
- (void)resetKeyWindow;
- (void)restoreSavedLocation;
- (void)resume:(id)a3;
- (void)resumeReadAloud;
- (void)resumeReadAloudForContentViewController:(id)a3;
- (void)revealSearchResult:(id)a3 animated:(BOOL)a4;
- (void)saveBook;
- (void)savePageControlVisibility;
- (void)saveReadingLocation:(id)a3;
- (void)saveStateClosing:(BOOL)a3;
- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4;
- (void)scrub:(id)a3;
- (void)scrubberTouchDown:(id)a3;
- (void)searchViewController:(id)a3 revealSearchResult:(id)a4 animated:(BOOL)a5;
- (void)searchViewController:(id)a3 turnToLocation:(id)a4 animated:(BOOL)a5;
- (void)searchViewController:(id)a3 turnToPageNumber:(int64_t)a4 animated:(BOOL)a5;
- (void)setActionController:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setAnalyticsReadStartDate:(id)a3;
- (void)setAnalyticsReadStartProgress:(id)a3;
- (void)setAnnotationChangeRequiresPaginationUpdate:(BOOL)a3;
- (void)setAnnotationProvider:(id)a3;
- (void)setAppAnalyticsAdditionalData:(id)a3;
- (void)setAssetIsPreordered:(id)a3;
- (void)setAssetViewControllerDelegate:(id)a3;
- (void)setAudioController:(id)a3;
- (void)setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:(BOOL)a3;
- (void)setBook:(id)a3;
- (void)setBookPositionProcessor:(id)a3;
- (void)setBookmarkObservers:(id)a3;
- (void)setBrightnessController:(id)a3;
- (void)setBuyParameters:(id)a3;
- (void)setCachedContentData:(id)a3;
- (void)setContentOpenAnimator:(id)a3;
- (void)setControlsEnabledViaHover:(BOOL)a3;
- (void)setControlsVisible:(BOOL)a3;
- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6;
- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setCurrentBookCacheItem:(id)a3;
- (void)setDoNotDisturbStatusAtStart:(int64_t)a3;
- (void)setExpandedContentViewController:(id)a3;
- (void)setExperienceManager:(id)a3;
- (void)setFinishedForAssetID:(id)a3;
- (void)setFootnoteController:(id)a3;
- (void)setFootnoteSourceView:(id)a3;
- (void)setHasCheckedForRemoteResources:(BOOL)a3;
- (void)setHasRemoteResources:(BOOL)a3;
- (void)setLastAnalyticsDeviceOrientationReported:(int64_t)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setLocation:(id)a3;
- (void)setNavigationHistory:(id)a3;
- (void)setOpeningLocation:(id)a3;
- (void)setPageCountIncludingUpsell:(int64_t)a3;
- (void)setPageNavigationViewController:(id)a3;
- (void)setPageNumberBeforeScrubbing:(unint64_t)a3;
- (void)setPaginationController:(id)a3;
- (void)setPerformSelectorProxy:(id)a3;
- (void)setPlayNextItemAbortedWhileInactive:(BOOL)a3;
- (void)setPriceString:(id)a3;
- (void)setReadAloudState:(BOOL)a3;
- (void)setReadingLocationHighwaterMark:(id)a3;
- (void)setReferenceLibraryViewController:(id)a3;
- (void)setReportedLocation:(id)a3;
- (void)setResumeLocation:(id)a3;
- (void)setRotationInProgress:(BOOL)a3;
- (void)setSafeToShowToolbarItems:(BOOL)a3;
- (void)setSearchResult:(id)a3;
- (void)setSection:(int)a3;
- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5;
- (void)setSelectionHighlightType:(int)a3;
- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6;
- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setTheme:(id)a3;
- (void)setTocCurrentLocation:(id)a3;
- (void)setTouchBarController:(id)a3;
- (void)setTrackState:(BOOL)a3;
- (void)setTrackState:(BOOL)a3 persistSetting:(BOOL)a4;
- (void)setTranslationViewController:(id)a3;
- (void)setTurnState:(BOOL)a3;
- (void)setUpSellData:(id)a3;
- (void)setUserNavigated:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setupAppearanceViewController;
- (void)shareAnnotation:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 completion:(id)a6;
- (void)shareAnnotations:(id)a3 fromBarButtonItem:(id)a4 excerpt:(BOOL)a5 completion:(id)a6;
- (void)shareAnnotations:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 excerpt:(BOOL)a6 completion:(id)a7;
- (void)showAudio:(id)a3;
- (void)showBrightness:(id)a3;
- (void)showExpandedContentForResource:(id)a3 atLocation:(id)a4 completion:(id)a5;
- (void)showFootnoteInContentViewController:(id)a3 resource:(id)a4 fromView:(id)a5 stylesheetSet:(id)a6;
- (void)showLibrary:(id)a3;
- (void)showLookupForString:(id)a3 fromView:(id)a4 onClose:(id)a5;
- (void)showNoteEditorForAnnotation:(id)a3;
- (void)showOverlayViewController:(id)a3 fromView:(id)a4 popoverOnPhone:(BOOL)a5 popoverBackgroundColor:(id)a6;
- (void)showSearch:(id)a3;
- (void)showSearchFromToolbar:(id)a3;
- (void)showSearchWithString:(id)a3 sender:(id)a4;
- (void)showTOC:(id)a3;
- (void)signalBookContentDidLoad:(id)a3;
- (void)startFetchingBookmarks;
- (void)startReadAloud;
- (void)stopFetchingBookmarks;
- (void)stopReadAloud;
- (void)stopReadAloudAndReload:(BOOL)a3;
- (void)stopSoundtrack;
- (void)stopSoundtrackAndReload:(BOOL)a3;
- (void)storeChangedNotification:(id)a3;
- (void)tocViewController:(id)a3 didSelectChapter:(id)a4;
- (void)toggleBookmark:(id)a3;
- (void)toggleBookmarkForContentViewController:(id)a3;
- (void)toggleControlsForContentViewController:(id)a3;
- (void)toggleShowPageControls:(id)a3;
- (void)touchBarHandleBackRequest:(id)a3;
- (void)touchBarHandleForwardRequest:(id)a3;
- (void)touchBarHandleReadAloudRequest:(id)a3;
- (void)touchBarHandleSearchRequest:(id)a3;
- (void)touchBarScrollerDidEnd:(double)a3 completion:(id)a4;
- (void)touchBarScrollerDidIdle:(double)a3;
- (void)touchBarScrollerJumpToBookmark:(id)a3;
- (void)transitionDidFinish:(BOOL)a3;
- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4;
- (void)unbookmarkPage:(id)a3;
- (void)unregisterBookmarkObserver:(id)a3;
- (void)updateBookmarkButton:(BOOL)a3;
- (void)updatePageCount;
- (void)updateProgressKitForNewLocation;
- (void)updateUIForSmartInvert;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
- (void)writeAnnotationsToWebProcessPlugin;
- (void)writeControlVisibilityStateToWebProcessPlugin;
@end

@implementation BKBookViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc((Class)NSDictionary);
    id v4 = [v2 initWithObjectsAndKeys:BKBookHidePageControls[0], &__kCFBooleanFalse, BKLeftTapTurnToNextDefault[0], &__kCFBooleanFalse, BKReadAloudAutoPageTurn[0], &__kCFBooleanTrue, @"BKUseLegacyCurlAnimation", &off_1E9368, BKDefaultHighlightColor[0], &__kCFBooleanFalse, BKDefaultUnderlineState, &__kCFBooleanTrue, @"BKAllowOnlineContent", 0];
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 registerDefaults:v4];
  }
}

- (BKBookViewController)initWithBook:(id)a3 storeID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)BKBookViewController;
  v8 = [(BKViewController *)&v42 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = _AEBookPluginsLifeCycleLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      v12 = [v6 assetLogID];
      *(_DWORD *)buf = 138543618;
      v44 = v10;
      __int16 v45 = 2114;
      v46 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Initializing BVC:%{public}@ logID:%{public}@", buf, 0x16u);
    }
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v8 selector:"saveBook" name:UIApplicationDidEnterBackgroundNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v8 selector:"_contentReady:" name:BKContentReadyNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v8 selector:"_contentReady:" name:BKContentFAILNotification object:0];

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    contentViewControllers = v8->_contentViewControllers;
    v8->_contentViewControllers = v16;

    v8->_controlsVisible = 0;
    v18 = (IMPerformSelectorProxy *)[objc_alloc((Class)IMPerformSelectorProxy) initWithTarget:v8];
    performSelectorProxy = v8->_performSelectorProxy;
    v8->_performSelectorProxy = v18;

    uint64_t v20 = +[AEAnnotationProvider sharedInstance];
    annotationProvider = v8->_annotationProvider;
    v8->_annotationProvider = (AEAnnotationProvider *)v20;

    uint64_t v22 = +[NSHashTable hashTableWithOptions:517];
    bookmarkObservers = v8->_bookmarkObservers;
    v8->_bookmarkObservers = (NSHashTable *)v22;

    if ((BUIsRunningTests() & 1) == 0)
    {
      v24 = (BCDisplaySleepController *)objc_alloc_init((Class)BCDisplaySleepController);
      displaySleepController = v8->_displaySleepController;
      v8->_displaySleepController = v24;
    }
    [(BKBookViewController *)v8 setBook:v6];
    v26 = +[BCAudioMuxingCoordinator sharedInstance];
    [v26 addAudioMuxingObserver:v8];

    v27 = [v6 sampleContent];
    if ([v27 BOOLValue])
    {
      [(BKBookViewController *)v8 setExperienceManager:0];
    }
    else
    {
      id v28 = +[BCAugmentedExperienceManager newAugmentedExperienceManager];
      [(BKBookViewController *)v8 setExperienceManager:v28];
    }
    v29 = [(BKBookViewController *)v8 experienceManager];

    if (v29)
    {
      v30 = [(BKBookViewController *)v8 experienceManager];
      [(BKBookViewController *)v8 setBookPositionProcessor:v30];

      v31 = [(BKBookViewController *)v8 experienceManager];
      [v31 setPresentationViewController:v8];

      v32 = [v6 storeId];
      id v33 = [v32 longLongValue];
      if ((uint64_t)v33 < 1)
      {
        v34 = v7;
      }
      else
      {
        v34 = [v6 storeId];
      }
      v35 = [(BKBookViewController *)v8 experienceManager];
      [v35 setStoreID:v34];

      if ((uint64_t)v33 >= 1) {
      v36 = [(BKBookViewController *)v8 _createEndOfBookExperience];
      }
      if (v36)
      {
        v37 = [(BKBookViewController *)v8 experienceManager];
        [v37 addExperience:v36];
      }
    }
    v38 = [(BKBookViewController *)v8 book];
    v8->_layout = [(BKBookViewController *)v8 validLayoutForBook:v38 desiredLayout:[(BKBookViewController *)v8 defaultLayoutToUse]];

    v39 = +[UITraitCollection bc_allAPITraits];
    id v40 = [(BKBookViewController *)v8 registerForTraitChanges:v39 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v8;
}

- (NSURL)storeShortURL
{
  v3 = objc_opt_class();
  id v4 = [(BKBookViewController *)self book];
  v5 = [v3 propertySourceFromBook:v4];

  id v6 = [objc_alloc((Class)AEAssetActivityItemProviderSource) initWithPropertySource:v5];
  id v7 = [v6 propertyProvider];
  v8 = [v7 storeURLPreferShort];

  return (NSURL *)v8;
}

- (NSString)lastLayoutUsedKey
{
  return (NSString *)@"BKEpubLayout";
}

- (unint64_t)defaultLayoutToUse
{
  return [(BKBookViewController *)self lastLayoutUsed];
}

- (unint64_t)lastLayoutUsed
{
  v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [(BKBookViewController *)self lastLayoutUsedKey];
  v5 = [v3 objectForKey:v4];

  if (v5)
  {
    unsigned int v6 = [v5 intValue];
    if (v6 <= 1) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
    unint64_t v8 = v7;
  }
  else
  {
    unint64_t v8 = 1;
  }

  return v8;
}

- (void)setLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    unint64_t v5 = [(BKBookViewController *)self layout];
    unsigned int v6 = _AEBookPluginsLifeCycleLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = (v5 & 0xFFFFFFFFFFFFFFFELL) == 2;
      unint64_t v8 = +[NSNumber numberWithUnsignedInteger:a3];
      v9 = [(BKBookViewController *)self book];
      v10 = [v9 assetLogID];
      id v11 = +[NSNumber numberWithBool:v7];
      int v14 = 138543874;
      v15 = v8;
      __int16 v16 = 2114;
      v17 = v10;
      __int16 v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SetLayout:%{public}@, logID:%{public}@, Scroll:%{public}@", (uint8_t *)&v14, 0x20u);
    }
    v12 = +[NSUserDefaults standardUserDefaults];
    v13 = [(BKBookViewController *)self lastLayoutUsedKey];
    [v12 setInteger:a3 forKey:v13];
  }
}

- (unint64_t)validLayoutForBook:(id)a3 desiredLayout:(unint64_t)a4
{
  id v6 = a3;
  if (([v6 isScrollModeDisabled] & 1) == 0)
  {
    if (a4 - 2 < 2)
    {
      unint64_t v9 = [(BKBookViewController *)self scrollLayoutForBook:v6];
      goto LABEL_9;
    }
    if (a4 == 4 || !a4)
    {
      BOOL v7 = BCIMLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unint64_t v8 = +[NSNumber numberWithUnsignedInteger:a4];
        int v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Unexpected layout request value (%@). Falling back to paged layout", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  unint64_t v9 = 1;
LABEL_9:

  return v9;
}

- (BOOL)allowsScrollMode
{
  return 1;
}

- (unint64_t)scrollLayoutForBook:(id)a3
{
  if (![(BKBookViewController *)self allowsScrollMode]) {
    return 1;
  }
  id v4 = [(BKBookViewController *)self book];
  id v5 = [v4 scrollModeOrientation];

  if (v5) {
    return 2;
  }
  else {
    return 3;
  }
}

- (id)_createEndOfBookExperience
{
  v3 = [(BKBookViewController *)self book];
  id v4 = [v3 endOfBookLocation];

  id v5 = [(BKBookViewController *)self book];
  id v6 = [v5 endOfBookValidRange];

  if ([v4 length])
  {
    id v40 = 0;
    BOOL v7 = +[BCCFI cfiWithString:v4 error:&v40];
    id v8 = v40;
  }
  else
  {
    BOOL v7 = 0;
    id v8 = 0;
  }
  v38 = v6;
  if ([v6 length])
  {
    id v39 = 0;
    unint64_t v9 = +[BCCFI cfiWithString:v6 error:&v39];
    id v36 = v39;
  }
  else
  {
    unint64_t v9 = 0;
    id v36 = 0;
  }
  id v10 = 0;
  v37 = v8;
  if (v7 && !v8)
  {
    int v11 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v42 = v4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Valid end of book: %@", buf, 0xCu);
    }

    if (v9)
    {
      v12 = [v9 headCFI];
      v13 = [v9 tailCFI];
      int v14 = +[BCEPubBookPosition positionWithCFI:v12];
      v15 = +[BCEPubBookPosition positionWithCFI:v13];
      __int16 v16 = +[BCBookSection bookSectionWithStartPosition:v14 endPosition:v15];
    }
    else
    {
      __int16 v16 = 0;
    }
    id v10 = objc_alloc_init((Class)BCAugmentedExperiencePoint);
    v17 = +[BCEPubBookPosition positionWithCFI:v7];
    [v10 setExperiencePoint:v17];

    [v10 setValidRange:v16];
    __int16 v18 = [(BKBookViewController *)self book];
    v19 = [v18 endOfBookConfidence];
    [v19 floatValue];
    [v10 setConfidence:];
  }
  uint64_t v20 = +[BCAugmentedExperienceRegistry sharedRegistry];
  v21 = [v20 presenterForExperienceType:0];
  if (v21)
  {
    id v22 = objc_alloc_init((Class)BCAugmentedExperience);
    [v22 setPresenter:v21];
    [v22 setLocation:v10];
    [v22 setDelay:0.0];
    [v22 setKind:0];
    [v22 setEnabled:1];
    [v22 setSkipToast:0];
    v23 = [(BKBookViewController *)self book];
    v24 = [v23 endOfBookVersion];
    [v22 setVersion:v24];

    [v22 setPageProgressionIsRTL:([self pageProgressionDirection] == 1)];
    v25 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1379DC();
    }

    v26 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Created end of book experience for EPUB", buf, 2u);
    }
  }
  else
  {
    v26 = BCAugmentedExperienceLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_13796C(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    id v22 = 0;
  }

  id v34 = v22;
  return v34;
}

- (void)pageViewControllersDidChange
{
  id v3 = [(BKBookViewController *)self experienceManager];
  [v3 presentingViewControllerDidChangeLayout:self];
}

- (id)visibleCFIRange
{
  return 0;
}

- (void)bookSectionChanged:(id)a3
{
  id v6 = a3;
  id v4 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v4)
  {
    id v5 = [(BKBookViewController *)self bookPositionProcessor];
    [v5 emitter:self bookSectionChanged:v6];
  }
}

- (void)bookMilestoneReached:(int64_t)a3
{
  id v5 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v5)
  {
    id v6 = [(BKBookViewController *)self bookPositionProcessor];
    [v6 emitter:self bookMilestoneReached:a3];
  }
}

- (void)bookPositionChanged:(id)a3
{
  id v6 = a3;
  id v4 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v4)
  {
    id v5 = [(BKBookViewController *)self bookPositionProcessor];
    [v5 emitter:self bookPositionChanged:v6];
  }
}

- (BOOL)isOnLastPage
{
  id v3 = [(BKBookViewController *)self currentPages];
  unint64_t v5 = v4;
  if (([(BKBookViewController *)self layout] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    unint64_t v5 = 2;
  }
  unint64_t v6 = [(BKBookViewController *)self pageCountIncludingUpsell];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  BOOL v9 = v6 >= (unint64_t)v3 && v6 - (unint64_t)v3 < v5;
  BOOL v10 = v6 != 0x7FFFFFFFFFFFFFFFLL && v9;
  return v6 && v10;
}

- (BOOL)inLiveResize
{
  id v2 = [(BKBookViewController *)self assetViewControllerDelegate];
  unsigned __int8 v3 = [v2 inLiveResize];

  return v3;
}

- (void)readingLocationChanged
{
  if (![(BKBookViewController *)self section]
    && +[BCAugmentedExperienceManager endOfBookExperienceFeatureEnabled])
  {
    unsigned __int8 v3 = [(BKBookViewController *)self book];
    unint64_t v4 = [v3 sampleContent];
    if ([v4 BOOLValue]) {
      goto LABEL_4;
    }
    unsigned __int8 v5 = [(BKBookViewController *)self isRotationInProgress];

    if ((v5 & 1) == 0)
    {
      [(BKBookViewController *)self currentPages];
      [(BKBookViewController *)self layout];
      if (![(BKBookViewController *)self isOnLastPage])
      {
        BOOL v7 = [(BKBookViewController *)self visibleCFIRange];
        unsigned __int8 v3 = v7;
        if (!v7)
        {
          [(BKBookViewController *)self bookSectionChanged:0];
          goto LABEL_5;
        }
        id v8 = [v7 headCFI];
        unint64_t v4 = +[BCEPubBookPosition positionWithCFI:v8];

        BOOL v9 = [v3 tailCFI];
        BOOL v10 = +[BCEPubBookPosition positionWithCFI:v9];

        int v11 = +[BCBookSection bookSectionWithStartPosition:v4 endPosition:v10];
        [(BKBookViewController *)self bookSectionChanged:v11];

LABEL_4:
LABEL_5:

        goto LABEL_9;
      }
      [(BKBookViewController *)self bookMilestoneReached:2];
    }
  }
LABEL_9:
  [(BKBookViewController *)self writeAnnotationsToWebProcessPlugin];
  unint64_t v6 = [(BKBookViewController *)self searchResult];

  if (v6)
  {
    id v12 = [(BKBookViewController *)self searchResult];
    [(BKBookViewController *)self highlightSearchResult:v12];
  }
}

- (void)didPurchaseWithProductProfile:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if ([a3 isPreorder])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4F0FC;
    v9[3] = &unk_1DB3F0;
    v9[4] = self;
    id v10 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  }
  else
  {
    id v7 = objc_retainBlock(v6);
    id v8 = v7;
    if (v7) {
      (*((void (**)(id))v7 + 2))(v7);
    }
  }
}

- (void)setAssetIsPreordered:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookViewController *)self book];
  [v5 setIsPreorder:v4];
}

- (BOOL)simulateManualPageTurn:(BOOL)a3 time:(double)a4
{
  return 0;
}

- (BOOL)_performScrollTest:(id)a3 iterations:(int)a4 delta:(int)a5
{
  return 0;
}

- (void)_performScrollTest:(id)a3 completionHandler:(id)a4
{
  id v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    v4[2]();
    id v4 = v5;
  }
}

- (void)releaseViews
{
  [(BKBookViewController *)self stopFetchingBookmarks];
  [(AENotePopoverEditorController *)self->_noteEditor setDelegate:0];
  noteEditor = self->_noteEditor;
  self->_noteEditor = 0;

  [(AEHighlightColorEditorController *)self->_colorEditor setDelegate:0];
  colorEditor = self->_colorEditor;
  self->_colorEditor = 0;

  id v5 = [(BKBookViewController *)self activityViewController];

  if (v5) {
    [(BKBookViewController *)self dismissCurrentPopoverAnimated:0];
  }
  v6.receiver = self;
  v6.super_class = (Class)BKBookViewController;
  [(BKViewController *)&v6 releaseViews];
}

- (void)cleanupPopovers
{
  [(BKBookViewController *)self setBrightnessController:0];
  [(BKBookViewController *)self setAudioController:0];
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewController;
  [(BKViewController *)&v3 cleanupPopovers];
}

- (void)dealloc
{
  objc_super v3 = +[BCAudioMuxingCoordinator sharedInstance];
  [v3 removeAudioMuxingObserver:self];

  [(BKBookViewController *)self releaseViews];
  [(BKViewController *)self hideOverlayViewControllerWithCompletion:0];
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  id v5 = [(BKBookViewController *)self paginationController];
  [v5 cancelPagination];

  [(BKBookViewController *)self setPaginationController:0];
  [(BKBookViewController *)self setBook:0];
  [(BKBookViewController *)self p_releaseDictionary];
  [(BKBookViewController *)self _cleanupFootnoteViewController];
  [(BKPageNavigationViewController *)self->_pageNavigationViewController setDelegate:0];
  [(BKSearchViewController *)self->_searchViewController setSearchDelegate:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v6 = [(NSMutableDictionary *)self->_contentViewControllers allValues];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) setDelegate:0];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  int v11 = [(BKExpandedContentViewController *)self->_expandedContentViewController delegate];

  if (v11 == self) {
    [(BKExpandedContentViewController *)self->_expandedContentViewController setDelegate:0];
  }
  [(BKUpsell *)self->_upsellContentViewController setDelegate:0];
  [(BKBookViewController *)self stopReadAloud];
  [(BKBookViewController *)self stopSoundtrack];
  [(IMAVPlayer *)self->_readPlayer setDelegate:0];
  [(IMPerformSelectorProxy *)self->_performSelectorProxy teardown];
  [(BKActionController *)self->_actionController setDelegate:0];
  v12.receiver = self;
  v12.super_class = (Class)BKBookViewController;
  [(BKViewController *)&v12 dealloc];
}

- (void)didReceiveMemoryWarning
{
  [(BKBookViewController *)self clearInactiveContentViewControllers];
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v3 didReceiveMemoryWarning];
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v7 willMoveToParentViewController:a3];
  hoverInteraction = self->_hoverInteraction;
  if (hoverInteraction)
  {
    id v5 = [(BCUIHoverInteraction *)hoverInteraction view];
    [v5 removeInteraction:self->_hoverInteraction];

    objc_super v6 = self->_hoverInteraction;
    self->_hoverInteraction = 0;
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v4 didMoveToParentViewController:a3];
  [(BKBookViewController *)self _updateHoverInteraction];
}

- (void)_updateHoverInteraction
{
  if (!self->_hoverInteraction)
  {
    objc_super v3 = [(BKBookViewController *)self navigationController];
    objc_super v4 = [v3 view];

    if (v4)
    {
      id v5 = objc_alloc((Class)BCUIHoverInteraction);
      objc_super v6 = [(BKBookViewController *)self view];
      objc_super v7 = (BCUIHoverInteraction *)[v5 initWithDelegate:self view:v6];
      hoverInteraction = self->_hoverInteraction;
      self->_hoverInteraction = v7;

      uint64_t v9 = [(BKBookViewController *)self navigationController];
      id v10 = [v9 view];
      [v10 addInteraction:self->_hoverInteraction];

      [(BKBookViewController *)self rebuildHoverRegions];
    }
  }
}

- (void)viewDidLoad
{
  [(BKBookViewController *)self updateUIForSmartInvert];
  v9.receiver = self;
  v9.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v9 viewDidLoad];
  if ((BUIsRunningTests() & 1) == 0)
  {
    objc_super v3 = +[UIMenuSystem mainSystem];
    [v3 setNeedsRebuild];
  }
  [(BKBookViewController *)self _updateHoverInteraction];
  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleVoiceOverStatusChanged:" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleSwitchControlStatusChanged:" name:UIAccessibilitySwitchControlStatusDidChangeNotification object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleInvertColorsStatusChanged:" name:UIAccessibilityInvertColorsStatusDidChangeNotification object:0];

  objc_super v7 = +[UIDevice currentDevice];
  if ((char *)[v7 orientation] - 3 >= (unsigned char *)&dword_0 + 2) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [(BKBookViewController *)self setLastAnalyticsDeviceOrientationReported:v8];
}

- (int64_t)themeInterfaceStyle
{
  id v2 = [(BKBookViewController *)self theme];
  if ([v2 shouldInvertContent]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = _AEBookPluginsLifeCycleLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [(BKBookViewController *)self book];
    objc_super v9 = [v8 assetLogID];
    *(_DWORD *)buf = 138543618;
    __int16 v18 = v6;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "viewWillAppear BVC:%{public}@ logID:%{public}@", buf, 0x16u);
  }
  v16.receiver = self;
  v16.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v16 viewIsAppearing:v3];
  id v10 = +[BCThemeCoordinator shared];
  [v10 addObserver:self];

  int v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"storeChangedNotification:" name:kAEStoreEnabledChangedNotification object:0];

  [(BKBookViewController *)self startFetchingBookmarks];
  [(BKBookViewController *)self updateBookmarkButton:0];
  objc_super v12 = +[NSUserDefaults standardUserDefaults];
  self->_autoTurn = [v12 BOOLForKey:BKReadAloudAutoPageTurn[0]];

  long long v13 = +[NSUserDefaults standardUserDefaults];
  long long v14 = [v13 objectForKey:@"soundtrackState"];

  if (v14) {
    self->_isPlayingSoundTrack = [v14 BOOLValue];
  }
  else {
    self->_isPlayingSoundTrack = 1;
  }
  if ([(BKBookViewController *)self bkaxNeedsPersistentControls]) {
    [(BKBookViewController *)self setControlsVisible:1 animated:1];
  }
  long long v15 = [(BKBookViewController *)self displaySleepController];
  [v15 userInteractionOccurred];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v13 viewDidAppear:a3];
  [(BKBookViewController *)self setSafeToShowToolbarItems:1];
  objc_super v4 = +[UIApplication sharedApplication];
  unsigned __int8 v5 = [v4 launchedToTest];

  if ((v5 & 1) == 0) {
    [(BKBookViewController *)self promptForRemoteResourcesIfNecessary];
  }
  objc_super v6 = [(BKBookViewController *)self openingLocation];

  if (v6)
  {
    id v7 = [(BKBookViewController *)self openingLocation];
    [(BKBookViewController *)self recordedJumpToLocation:v7 animated:0 completion:0];
  }
  uint64_t v8 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v8) {
    +[IMSleepManager startSleepTimer];
  }
  objc_super v9 = +[AETestDriver shared];
  [v9 bookViewDidAppear:self];

  [(BKBookViewController *)self updateProgressKitForNewLocation];
  [(BKBookViewController *)self bc_analyticsVisibilityUpdateSubtree];
  [(BKBookViewController *)self _updateHoverInteraction];
  id v10 = [(BKBookViewController *)self view];
  int v11 = [v10 window];
  objc_super v12 = [(BKBookViewController *)self displaySleepController];
  [v12 setWindow:v11];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v7 viewWillDisappear:a3];
  objc_super v4 = +[BCThemeCoordinator shared];
  [v4 removeObserver:self];

  [(BKBookViewController *)self cancelPendingHidePageControls];
  [(BKBookViewController *)self pauseReadAloud];
  +[IMSleepManager stopSleepTimer];
  unsigned __int8 v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:kAEStoreEnabledChangedNotification object:0];

  objc_super v6 = +[AETestDriver shared];
  [v6 bookViewWillDisappear:self];

  [(BKBookViewController *)self bc_analyticsVisibilitySubtreeWillDisappear];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v4 viewDidDisappear:a3];
  [(BKBookViewController *)self bc_analyticsVisibilitySubtreeDidDisappear];
}

- (BOOL)shouldAutorotate
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(BKBookViewController *)self contentViewControllers];
  BOOL v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) currentlyHighlighting])
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad()) {
    return 30;
  }
  else {
    return 26;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(BKBookViewController *)self setRotationInProgress:1];
  if (isPad()) {
    [(AENotePopoverEditorController *)self->_noteEditor hide];
  }
  [(AEHighlightColorEditorController *)self->_colorEditor hide];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_50124;
  v16[3] = &unk_1DAA18;
  v16[4] = self;
  [v7 animateAlongsideTransition:0 completion:v16];
  v15.receiver = self;
  v15.super_class = (Class)BKBookViewController;
  -[BKBookViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  BOOL v8 = [(BKBookViewController *)self referenceLibraryViewController];
  objc_super v9 = v8;
  if (v8 && [v8 _isInPopoverPresentation]) {
    [(BKBookViewController *)self dismissCurrentPopoverAnimated:0];
  }
  long long v10 = [(BKBookViewController *)self translationViewController];
  long long v11 = v10;
  if (v10 && [v10 _isInPopoverPresentation]) {
    [(BKBookViewController *)self dismissCurrentPopoverAnimated:0];
  }
  long long v12 = [(BKBookViewController *)self footnoteController];
  long long v13 = v12;
  if (v12 && [v12 _isInPopoverPresentation]) {
    [(BKBookViewController *)self dismissCurrentPopoverAnimated:0];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5012C;
  v14[3] = &unk_1DAA18;
  v14[4] = self;
  [v7 animateAlongsideTransition:0 completion:v14];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  -[BKBookViewController createPaginationControllerIfNeeded:](self, "createPaginationControllerIfNeeded:", 1, a4);
  if (([(BKBookViewController *)self im_isCompactWidth] & 1) == 0)
  {
    id v5 = [(BKBookViewController *)self footnoteController];
    [v5 dismissCurrentPopover];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v10 assetViewController:self presentViewController:v9 animated:v5 completion:v8];
}

- (void)setBook:(id)a3
{
  id v13 = a3;
  currentBookCacheItem = self->_currentBookCacheItem;
  self->_currentBookCacheItem = 0;

  [(BKBookViewController *)self setPaginationController:0];
  if (self->_bookMoc)
  {
    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

    [(NSManagedObjectContext *)self->_bookMoc refreshObject:self->_book mergeChanges:0];
    book = self->_book;
    self->_book = 0;

    if ([(NSManagedObjectContext *)self->_bookMoc hasChanges]) {
      [(NSManagedObjectContext *)self->_bookMoc save:0];
    }
    [(NSManagedObjectContext *)self->_bookMoc reset];
    bookMoc = self->_bookMoc;
    self->_bookMoc = 0;
  }
  id v9 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&self->_book, a3);
    [(BKViewController *)self setLayoutDirection:[(BKBookViewController *)self pageProgressionDirection] == 1];
    self->_layout = [(BKBookViewController *)self validLayoutForBook:v13 desiredLayout:[(BKBookViewController *)self defaultLayoutToUse]];
    id v10 = [(AEBookInfo *)self->_book managedObjectContext];
    long long v11 = self->_bookMoc;
    self->_bookMoc = v10;

    long long v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:self selector:"managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    [(BKBookViewController *)self restoreSavedLocation];
    id v9 = v13;
  }
}

- (void)setPageCountIncludingUpsell:(int64_t)a3
{
  if (self->_pageCountIncludingUpsell != a3)
  {
    self->_pageCountIncludingUpsell = a3;
    [(BKBookViewController *)self pageCountDidUpdate];
    [(BKBookViewController *)self updateTouchBarController];
  }
}

- (void)createPaginationControllerIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BKBookViewController *)self paginationController];

  if (!v5)
  {
    id v9 = +[BKPaginationController newPaginationControllerForBook:self->_book delegate:self];
    -[BKBookViewController setPaginationController:](self, "setPaginationController:");
    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    id v7 = BKPaginationCompleteForBookNotification;
    id v8 = [(BKBookViewController *)self paginationController];
    [v6 addObserver:self selector:"_paginationComplete:" name:v7 object:v8];

    if (v3) {
      [(BKBookViewController *)self paginationUpdateRequired];
    }
  }
}

- (void)_setAudioSessionMix:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = [(BKBookViewController *)self book];
    unsigned int v4 = [v3 hasMediaOverlayElements];

    if (v4)
    {
      BOOL v5 = +[AVAudioSession sharedInstance];
      id v11 = 0;
      unsigned int v6 = [v5 setCategory:AVAudioSessionCategoryPlayback error:&v11];
      id v7 = v11;

      if (v6)
      {
        id v8 = +[AVAudioSession sharedInstance];
        id v10 = v7;
        [v8 setActive:1 error:&v10];
        id v9 = v10;

        id v7 = v9;
      }
    }
  }
}

- (BEProtocolCacheItem)currentBookCacheItem
{
  currentBookCacheItem = self->_currentBookCacheItem;
  if (!currentBookCacheItem)
  {
    unsigned int v4 = [(BKBookViewController *)self book];
    BOOL v5 = [v4 cacheItem];
    unsigned int v6 = self->_currentBookCacheItem;
    self->_currentBookCacheItem = v5;

    currentBookCacheItem = self->_currentBookCacheItem;
  }

  return currentBookCacheItem;
}

- (int64_t)readerType
{
  return 0;
}

- (AEAsset)asset
{
  return (AEAsset *)self->_book;
}

- (void)open:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v5)
  {
    unsigned int v6 = [(BKBookViewController *)self assetViewControllerDelegate];
    [v6 assetViewController:self willOpen:v3];
  }
  [(BKBookViewController *)self _setAudioSessionMix:1];
  id v7 = [(BKBookViewController *)self contentViewControllers];
  id v8 = [v7 allValues];
  [v8 makeObjectsPerformSelector:"resume"];

  [(BKBookViewController *)self updateUIForSmartInvert];
}

- (void)jumpToBeginningAnimated:(BOOL)a3
{
}

- (void)openToLocation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  [(BKBookViewController *)self setOpeningLocation:v11];
  unsigned int v6 = [(BKBookViewController *)self book];
  [v11 updateOrdinalForBookInfo:v6];

  if ([(BKBookViewController *)self isVisible])
  {
    if ([(BKBookViewController *)self section])
    {
      [(BKBookViewController *)self setResumeLocation:v11];
      [(BKBookViewController *)self setSection:0 animated:v4 adjustScrollToReveal:0];
      [(BKBookViewController *)self setResumeLocation:0];
    }
    else if (![(BKBookViewController *)self isLocationOnCurrentPage:v11])
    {
      [(BKBookViewController *)self recordedJumpToLocation:v11 animated:v4 completion:0];
    }
  }
  else
  {
    [(BKBookViewController *)self setLocation:v11];
    id v7 = [(BKBookViewController *)self assetViewControllerDelegate];

    if (v7)
    {
      id v8 = [(BKBookViewController *)self assetViewControllerDelegate];
      [v8 assetViewController:self willOpen:v4];
    }
    [(BKBookViewController *)self _setAudioSessionMix:1];
  }
  id v9 = [(BKBookViewController *)self contentViewControllers];
  id v10 = [v9 allValues];
  [v10 makeObjectsPerformSelector:"resume"];
}

- (void)requestClose:(BOOL)a3
{
  BOOL v5 = +[AETestDriver shared];
  [v5 postEvent:kBETestDriverOpenAnimationStart sender:self];

  unsigned int v6 = +[AETestDriver shared];
  [v6 postEvent:kBETestDriverOpenAnimationSetupStart sender:self];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_509B0;
  v7[3] = &unk_1DBE90;
  v7[4] = self;
  BOOL v8 = a3;
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v7];
}

- (void)close:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BKBookViewController *)self contentData];
  [(BKBookViewController *)self setCachedContentData:v5];

  [(BKBookViewController *)self bookMilestoneReached:10];
  [(BKBookViewController *)self stopPlayingMedia:0];
  [(BKViewController *)self hideOverlayViewControllerWithCompletion:0];
  [(BKBookViewController *)self stopFetchingBookmarks];
  [(BKBookViewController *)self _setAudioSessionMix:0];
  [(BKBookViewController *)self saveStateClosing:1];
  [(BKBookViewController *)self stopSoundtrack];
  [(BKBookViewController *)self setReadAloudState:0];
  [(BKBookViewController *)self saveBook];
  unsigned int v6 = [(AEBookInfo *)self->_book baseURL];
  id v7 = [v6 absoluteString];
  BOOL v8 = [v7 lastPathComponent];
  +[BKTextIndex removeTextIndexWithName:v8];

  id v9 = [(BKBookViewController *)self contentViewControllers];
  id v10 = [v9 allValues];
  [v10 makeObjectsPerformSelector:"suspend"];

  id v11 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v11 assetViewController:self willClose:v3];
}

- (void)assetViewControllerUpdateToolbarsAfterOpenAnimation
{
  BOOL v3 = [(BKBookViewController *)self shouldControlsBeVisibleOnOpen];

  [(BKBookViewController *)self setControlsVisible:v3 animated:1];
}

- (void)assetViewControllerUpdateToolbarsForOpenAnimation
{
  BOOL v3 = [(BKBookViewController *)self shouldControlsBeVisibleOnOpen];

  [(BKBookViewController *)self setControlsVisible:v3 animated:0];
}

- (void)assetViewControllerPrepareForReload
{
}

- (BOOL)shouldControlsBeVisibleOnOpen
{
  unsigned int v3 = [(BKBookViewController *)self controlsVisible];
  BOOL v4 = [(BKBookViewController *)self book];
  BOOL v5 = [v4 sampleContent];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = +[BRCConfigurationManager sharedInstance];
    BOOL v8 = [v7 valueForKey:BRCBooksDefaultsKeyReadingExperienceSamplesShowChromeOnOpen fromNamespace:BRCBooksDefaultsNamespace];

    v3 |= [v8 BOOLValue];
  }
  return v3;
}

- (void)saveStateClosing:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    BOOL v5 = _AEBookPluginsLifeCycleLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = objc_opt_class();
      id v7 = v6;
      BOOL v8 = [(BKBookViewController *)self book];
      id v9 = [v8 assetLogID];
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v9;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SaveState while Closing BVC:%{public}@ logID:%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(BKBookViewController *)self saveStateClosing:v3 suspending:0];
}

- (void)saveStateClosing:(BOOL)a3 suspending:(BOOL)a4
{
  id v6 = [(BKBookViewController *)self book];
  if (v6 && ([v6 isDeleted] & 1) == 0 && objc_msgSend(v6, "exists"))
  {
    BOOL v5 = [(BKBookViewController *)self savableLocation];
    if (v5) {
      [(BKBookViewController *)self saveReadingLocation:v5];
    }
  }
  [(BKBookViewController *)self setOpeningLocation:0];
}

- (BOOL)dismissShouldBegin:(id)a3
{
  id v3 = a3;
  [v3 velocity];
  double v5 = v4;
  [v3 velocity];
  if (v5 >= v6) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = [v3 proposedBeginState];
  }

  return v7;
}

- (void)saveBook
{
  id v3 = [(BKBookViewController *)self book];
  double v4 = [v3 managedObjectContext];
  unsigned int v5 = [v4 hasChanges];

  if (v5)
  {
    double v6 = [(BKBookViewController *)self book];
    unsigned __int8 v7 = [v6 managedObjectContext];
    uint64_t v12 = 0;
    unsigned __int8 v8 = [v7 save:&v12];
    uint64_t v9 = v12;

    if ((v8 & 1) == 0)
    {
      if (v9)
      {
        int v10 = BCIMLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          long long v14 = "-[BKBookViewController saveBook]";
          __int16 v15 = 2080;
          objc_super v16 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
          __int16 v17 = 1024;
          int v18 = 1263;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
        }

        id v11 = BCIMLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "[error description]", buf, 2u);
        }
      }
    }
  }
}

- (void)paginationCompleted
{
  [(BKBookViewController *)self updatePageCount];

  [(BKBookViewController *)self updateTouchBarController];
}

- (int64_t)pageCountExcludingUpsell
{
  int64_t v3 = [(BKBookViewController *)self pageCountIncludingUpsell];
  int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    return v3 - ([(BKBookViewController *)self upsellOrdinal] != 0x7FFFFFFFFFFFFFFFLL);
  }
  return v4;
}

- (void)updatePageCount
{
  int64_t v3 = [(BKBookViewController *)self calculatePageCountExcludingUpsell];
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = v3;
    if ([(BKBookViewController *)self upsellOrdinal] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v4 = v5;
    }
    else {
      uint64_t v4 = v5 + 1;
    }
  }

  [(BKBookViewController *)self setPageCountIncludingUpsell:v4];
}

- (int64_t)calculatePageCountExcludingUpsell
{
  int64_t v3 = [(BKBookViewController *)self paginationController];

  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v4 = [(BKBookViewController *)self paginationController];
  id v5 = [v4 pageTotal];

  return (int64_t)v5;
}

- (BOOL)hidesPageControlsOnOpen
{
  if ([(BKBookViewController *)self controlsVisible])
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    if ([v2 BOOLForKey:BKBookHidePageControls[0]])
    {
      int64_t v3 = +[NSUserDefaults standardUserDefaults];
      unsigned int v4 = [v3 BOOLForKey:BKBookDisableAutoHidePageControls[0]] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (double)hidesPageControlsOnOpenDelay
{
  return 2.0;
}

- (void)cancelPendingHidePageControls
{
  id v3 = [(BKBookViewController *)self performSelectorProxy];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v3 selector:"hidePageControls:" object:self];
}

- (void)delayedHidePageControls
{
  [(BKBookViewController *)self cancelPendingHidePageControls];
  id v3 = [(BKBookViewController *)self performSelectorProxy];
  [(BKBookViewController *)self hidesPageControlsOnOpenDelay];
  [v3 performSelector:@selector(hidePageControls:) withObject:self afterDelay:0];
}

- (void)transitionDidFinish:(BOOL)a3
{
  if (a3 && [(BKBookViewController *)self hidesPageControlsOnOpen])
  {
    [(BKBookViewController *)self delayedHidePageControls];
  }
}

- (BKLocation)savableLocation
{
  id v3 = [(BKBookViewController *)self currentLocation];
  unsigned int v4 = [(BKBookViewController *)self savableLocationForLocation:v3];

  return (BKLocation *)v4;
}

- (id)savableLocationForLocation:(id)a3
{
  id v4 = a3;
  if (((unint64_t)[v4 ordinal] & 0x8000000000000000) != 0)
  {
    uint64_t v6 = [(BKBookViewController *)self resumeLocation];
  }
  else
  {
    id v5 = [v4 ordinal];
    if (v5 != (id)[(BKBookViewController *)self upsellOrdinal]) {
      goto LABEL_6;
    }
    uint64_t v6 = [(BKBookViewController *)self pageLocationForPageNumber:[(BKBookViewController *)self pageCountExcludingUpsell]];
  }
  unsigned __int8 v7 = (void *)v6;

  id v4 = v7;
LABEL_6:
  if (((unint64_t)[v4 ordinal] & 0x8000000000000000) != 0)
  {

    id v4 = 0;
  }

  return v4;
}

- (void)restoreSavedLocation
{
  id v3 = _AEBookPluginsLifeCycleLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_opt_class();
    id v5 = v4;
    uint64_t v6 = [(BKBookViewController *)self book];
    unsigned __int8 v7 = [v6 assetLogID];
    int v10 = 138543618;
    id v11 = v4;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "restoreSavedLocation BVC:%{public}@ for logID:%{public}@ ", (uint8_t *)&v10, 0x16u);
  }
  unsigned __int8 v8 = [(BKBookViewController *)self book];
  uint64_t v9 = [v8 readingLocation];
  [(BKBookViewController *)self setLocation:v9];
}

- (void)_promptToLoadExternalContent:(id)a3
{
  id v4 = a3;
  id v5 = AEBundle();
  __int16 v17 = [v5 localizedStringForKey:@"Allow Online Content?" value:&stru_1DF0D8 table:0];

  uint64_t v6 = AEBundle();
  unsigned __int8 v7 = [v6 localizedStringForKey:@"This book needs to access online content, or it may not display as the publisher intended.", &stru_1DF0D8, 0 value table];

  unsigned __int8 v8 = +[UIAlertController alertControllerWithTitle:v17 message:v7 preferredStyle:1];
  uint64_t v9 = AEBundle();
  int v10 = [v9 localizedStringForKey:@"Don’t Allow" value:&stru_1DF0D8 table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_51820;
  v20[3] = &unk_1DBEB8;
  id v11 = v4;
  v20[4] = self;
  id v21 = v11;
  __int16 v12 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v20];
  [v8 addAction:v12];

  id v13 = AEBundle();
  long long v14 = [v13 localizedStringForKey:@"Allow" value:&stru_1DF0D8 table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_5187C;
  v18[3] = &unk_1DBEB8;
  v18[4] = self;
  id v19 = v11;
  id v15 = v11;
  objc_super v16 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v18];
  [v8 addAction:v16];

  [(BKBookViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)promptForRemoteResourcesIfNecessary
{
  if ([(BKBookViewController *)self hasRemoteResources])
  {
    id v3 = +[BEDocumentExternalLoadApprovalCache sharedInstance];
    id v4 = [(BKBookViewController *)self book];
    id v5 = [v4 assetID];

    if (([v3 hasCachedLoadExternalContentApprovalForBookID:v5] & 1) == 0)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_519CC;
      v6[3] = &unk_1DBEE0;
      id v7 = v3;
      id v8 = v5;
      [(BKBookViewController *)self _promptToLoadExternalContent:v6];
    }
  }
}

- (BOOL)hasRemoteResources
{
  if (self->_hasCheckedForRemoteResources) {
    return self->_hasRemoteResources;
  }
  self->_hasCheckedForRemoteResources = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(BKBookViewController *)self book];
  id v5 = [v4 sortedDocuments];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) manifestProperties];
        id v11 = [v10 componentsSeparatedByString:@" "];
        unsigned __int8 v12 = [v11 containsObject:@"remote-resources"];

        if (v12)
        {
          BOOL v3 = 1;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 0;
LABEL_13:

  self->_hasRemoteResources = v3;
  return v3;
}

- (void)reloadExternalWebFrames
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(BKBookViewController *)self contentViewControllers];
  BOOL v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          if ([v9 isContentLoaded]) {
            [v9 reloadExternalWebFrames];
          }
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (BOOL)hasSpreadPages
{
  return 0;
}

- (void)setTheme:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKBookViewController;
  id v5 = [(BKBookViewController *)&v15 theme];

  if (v5 != v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)BKBookViewController;
    [(BKBookViewController *)&v14 setTheme:v4];
    -[BKBookViewController setSelectionHighlightType:](self, "setSelectionHighlightType:", +[BKTextHighlightView bkTextHighlightTypeForIMTextHighlightType:](BKTextHighlightView, "bkTextHighlightTypeForIMTextHighlightType:", [v4 textHighlightType]));
  }
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)&BKBookViewControllerThemeTransitionDuration * 0.5 * 1000000000.0));
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  long long v10 = sub_51E14;
  long long v11 = &unk_1DBF08;
  long long v12 = self;
  id v13 = v4;
  id v7 = v4;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, &v8);
  [(BKBookViewController *)self updateUIForSmartInvert];
}

- (int)pageProgressionDirection
{
  id v2 = [(BKBookViewController *)self book];
  int v3 = [v2 bkPageProgressionDirection];

  return v3;
}

- (BOOL)isPageProgressionRTL
{
  id v2 = [(BKBookViewController *)self book];
  unsigned __int8 v3 = [v2 isPageProgressionRTL];

  return v3;
}

- (void)clearInactiveContentViewControllers
{
  unsigned __int8 v3 = [(BKBookViewController *)self contentViewControllers];
  id v4 = [v3 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [v4 objectForKey:v10];
        if (![v11 isViewLoaded]
          || ([v11 view],
              long long v12 = objc_claimAutoreleasedReturnValue(),
              [v12 window],
              id v13 = objc_claimAutoreleasedReturnValue(),
              v13,
              v12,
              !v13))
        {
          [v11 setDelegate:0];
          [v11 removeFromParentViewController];
          objc_super v14 = [(BKBookViewController *)self contentViewControllers];
          [v14 removeObjectForKey:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)storeChangedNotification:(id)a3
{
  if ([(BKBookViewController *)self upsellOrdinal] != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BKBookViewController *)self updatePageCount];
  }
}

- (unint64_t)upsellOrdinal
{
  unsigned __int8 v3 = [(BKBookViewController *)self book];
  unsigned int v4 = [v3 hasUpsellPage];

  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v5 = [(BKBookViewController *)self book];
  id v6 = [v5 readingDocumentCount];

  return (unint64_t)v6;
}

- (int64_t)upsellPageNumber
{
  if ([(BKBookViewController *)self upsellOrdinal] == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return [(BKBookViewController *)self pageCountIncludingUpsell];
}

- (BKUpsell)upsellContentViewController
{
  if ([(BKBookViewController *)self upsellOrdinal] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v3 = 0;
  }
  else
  {
    if (!self->_upsellContentViewController)
    {
      unsigned int v4 = [(BKBookViewController *)self book];
      id v5 = [v4 sampleContent];
      unsigned int v6 = [v5 BOOLValue];

      if (v6)
      {
        id v7 = objc_alloc_init(BKSampleUpsellContentViewController);
        [(BKSampleUpsellContentViewController *)v7 setBuyDelegate:self];
      }
      else
      {
        id v7 = objc_alloc_init(BKFinishedContentViewController);
      }
      upsellContentViewController = self->_upsellContentViewController;
      self->_upsellContentViewController = (BKUpsell *)v7;

      uint64_t v9 = [(BKBookViewController *)self book];
      [(BKUpsell *)self->_upsellContentViewController setBook:v9];

      [(BKUpsell *)self->_upsellContentViewController setOrdinal:[(BKBookViewController *)self upsellOrdinal]];
      [(BKUpsell *)self->_upsellContentViewController setDelegate:self];
    }
    uint64_t v10 = [(BKBookViewController *)self book];
    long long v11 = [v10 sampleContent];
    unsigned int v12 = [v11 BOOLValue];

    if (v12)
    {
      objc_opt_class();
      id v13 = BUDynamicCast();
      objc_super v14 = [(BKBookViewController *)self assetViewControllerDelegate];
      long long v15 = [v14 assetViewControllerProductProfile:self];
      [v13 setProfileFuture:v15];
    }
    unsigned __int8 v3 = self->_upsellContentViewController;
  }

  return v3;
}

- (void)showLibrary:(id)a3
{
}

- (void)resume:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_52388;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v3];
}

- (void)_resume
{
  [(BKBookViewController *)self setSection:0 animated:1 adjustScrollToReveal:0];
  unsigned __int8 v3 = [(BKBookViewController *)self resumeLocation];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5247C;
  v4[3] = &unk_1DAB88;
  v4[4] = self;
  [(BKBookViewController *)self jumpToLocation:v3 animated:1 completion:v4];
}

- (void)showTOC:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_52544;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v3];
}

- (void)toggleShowPageControls:(id)a3
{
  unsigned int v4 = [(BKBookViewController *)self expandedContentViewController];
  unsigned __int8 v5 = [v4 isVisible];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [(BKBookViewController *)self controlsVisible] ^ 1;
    [(BKBookViewController *)self setControlsVisible:v6 animated:1];
  }
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setStatusBarHidden:(BOOL)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  uint64_t v9 = (void (**)(void))a5;
  uint64_t v10 = (void (**)(void))a6;
  long long v11 = [(BKBookViewController *)self view];
  unsigned int v12 = [v11 window];

  if (v7)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_52880;
    v15[3] = &unk_1DBF30;
    BOOL v17 = v12 != 0;
    v15[4] = self;
    long long v16 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_528E4;
    v13[3] = &unk_1DBF58;
    objc_super v14 = v10;
    +[UIView animateWithDuration:4 delay:v15 options:v13 animations:0.15 completion:0.0];
  }
  else
  {
    if (v12)
    {
      [(BKBookViewController *)self setNeedsStatusBarAppearanceUpdate];
      [(BKBookViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
    }
    if (v9) {
      v9[2](v9);
    }
    if (v10) {
      v10[2](v10);
    }
  }
}

- (BOOL)prefersStatusBarHidden
{
  if ([(BKBookViewController *)self im_isCompactHeight]) {
    return 1;
  }
  else {
    return ![(BKBookViewController *)self controlsVisible];
  }
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return ![(BKBookViewController *)self controlsVisible];
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)setControlsVisible:(BOOL)a3 animated:(BOOL)a4 animations:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  self->_controlsEnabledViaHover = 0;
  [(BKBookViewController *)self cancelPendingHidePageControls];
  if (v8
    || ![(BKBookViewController *)self bkaxNeedsPersistentControls]
    || [(BKBookViewController *)self bkaxAccessibilityUserIsRequestingControlsVisibilityToggle])
  {
    self->_controlsVisible = v8;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_52A88;
    v12[3] = &unk_1DADC0;
    id v13 = v10;
    [(BKBookViewController *)self setStatusBarHidden:!v8 animated:v7 animations:v12 completion:v11];
    [(BKBookViewController *)self delayedSavePageControlVisibility];
    [(BKBookViewController *)self writeControlVisibilityStateToWebProcessPlugin];
  }
}

- (void)setControlsVisible:(BOOL)a3
{
}

- (void)hidePageControls:(id)a3
{
}

- (void)showBrightness:(id)a3
{
  BOOL v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_52B78;
  id v11 = &unk_1DBF08;
  unsigned int v12 = self;
  id v13 = a3;
  id v4 = v13;
  unsigned __int8 v5 = objc_retainBlock(&v8);
  uint64_t v6 = [(BKBookViewController *)self brightnessController];
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5;
  }
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v7];
}

- (void)showAudio:(id)a3
{
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  BOOL v8 = sub_52CE8;
  uint64_t v9 = &unk_1DBF08;
  id v10 = self;
  id v11 = a3;
  id v4 = v11;
  unsigned __int8 v5 = objc_retainBlock(&v6);
  -[BKViewController dismissCurrentPopoverWithCompletion:](self, "dismissCurrentPopoverWithCompletion:", v5, v6, v7, v8, v9, v10);
}

- (void)buy:(id)a3
{
  id v4 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v4 assetViewControllerRequestToBuy:self completion:0];
}

- (void)buyWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BKBookViewController *)self assetViewControllerDelegate];
  id v7 = v5;
  if (v5)
  {
    [v5 assetViewControllerRequestToBuy:self completion:v4];
  }
  else
  {
    id v6 = objc_retainBlock(v4);

    if (v6) {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
    id v4 = v6;
  }
}

- (BOOL)onlySupportsScrollingLayout
{
  return 0;
}

- (void)presentAppearanceViewControllerFromItem:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_52F94;
  v4[3] = &unk_1DBF08;
  unsigned __int8 v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(BKViewController *)v5 dismissCurrentPopoverWithCompletion:v4];
}

- (id)appearanceMenuItems
{
  CFStringRef v4 = @"BKAppearanceMenuItemBrightness";
  id v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)setupAppearanceViewController
{
  if (!self->_appearanceViewController)
  {
    id v3 = (BKAppearanceViewController *)[objc_alloc((Class)objc_opt_class()) initWithNibName:0 bundle:0];
    appearanceViewController = self->_appearanceViewController;
    self->_appearanceViewController = v3;

    unsigned __int8 v5 = [(BKBookViewController *)self appearanceMenuItems];
    [(BKAppearanceViewController *)self->_appearanceViewController setMenuItems:v5];

    id v6 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_appearanceViewController];
    appearanceNavigationController = self->_appearanceNavigationController;
    self->_appearanceNavigationController = v6;

    [(UINavigationController *)self->_appearanceNavigationController setNavigationBarHidden:1];
    BOOL v8 = [(BKBookViewController *)self theme];
    [(BKAppearanceViewController *)self->_appearanceViewController setTheme:v8];

    uint64_t v9 = [(BKBookViewController *)self book];
    [(BKAppearanceViewController *)self->_appearanceViewController setBook:v9];

    [(BKAppearanceViewController *)self->_appearanceViewController setDelegate:self];
    [(BKAppearanceViewController *)self->_appearanceViewController setLayout:[(BKBookViewController *)self layout]];
    [(BKAppearanceViewController *)self->_appearanceViewController setAppearanceStyle:0];
    id v10 = (IMViewController *)objc_opt_new();
    appearanceContainerViewController = self->_appearanceContainerViewController;
    self->_appearanceContainerViewController = v10;

    unsigned int v12 = [(BKBookViewController *)self theme];
    [(IMViewController *)self->_appearanceContainerViewController setTheme:v12];

    [(IMViewController *)self->_appearanceContainerViewController addChildViewController:self->_appearanceNavigationController];
    id v13 = [(IMViewController *)self->_appearanceContainerViewController view];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    id v22 = [(UINavigationController *)self->_appearanceNavigationController view];
    [v22 setFrame:v15, v17, v19, v21];

    v23 = [(IMViewController *)self->_appearanceContainerViewController view];
    v24 = [(UINavigationController *)self->_appearanceNavigationController view];
    [v23 addSubview:v24];

    [(BKAppearanceViewController *)self->_appearanceViewController preferredContentSize];
    -[IMViewController setPreferredContentSize:](self->_appearanceContainerViewController, "setPreferredContentSize:");
    uint64_t v25 = [(BKBookViewController *)self onlySupportsScrollingLayout] ^ 1;
    v26 = self->_appearanceViewController;
    [(BEAppearanceViewController *)v26 setScrollSwitchEnabled:v25];
  }
}

- (void)handleAppearanceViewControllerDismissal
{
  [(BKAppearanceViewController *)self->_appearanceViewController setDelegate:0];
  appearanceViewController = self->_appearanceViewController;
  self->_appearanceViewController = 0;

  appearanceNavigationController = self->_appearanceNavigationController;
  self->_appearanceNavigationController = 0;

  appearanceContainerViewController = self->_appearanceContainerViewController;
  self->_appearanceContainerViewController = 0;

  id v6 = [(BKBookViewController *)self paginationController];
  [v6 resume];
}

- (void)appearanceViewController:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(BKBookViewController *)self book];
  unint64_t v8 = [(BKBookViewController *)self validLayoutForBook:v7 desiredLayout:a4];

  uint64_t v9 = +[BAEventReporter sharedReporter];
  id v10 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  id v11 = [(BKBookViewController *)self readingSessionData];
  unsigned int v12 = [(BKBookViewController *)self contentData];
  id v13 = [v6 style];

  [v13 fontSize];
  [v9 emitReadingScrollViewSettingChangeEventWithTracker:v10 readingSessionData:v11 contentData:v12 fontSize:v8 != 1];

  [(BKBookViewController *)self setLayout:v8];
}

- (void)appearanceViewController:(id)a3 didChangeFont:(id)a4
{
  id v5 = a4;
  id v9 = +[BAEventReporter sharedReporter];
  id v6 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  id v7 = [(BKBookViewController *)self readingSessionData];
  unint64_t v8 = [(BKBookViewController *)self contentData];
  [v9 emitReadingFontChangeEventWithTracker:v6 readingSessionData:v7 contentData:v8 fontName:v5];
}

- (void)appearanceViewController:(id)a3 didChangeFontSize:(double)a4
{
  id v10 = +[BAEventReporter sharedReporter];
  id v6 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  id v7 = [(BKBookViewController *)self readingSessionData];
  unint64_t v8 = [(BKBookViewController *)self contentData];
  *(float *)&double v9 = a4;
  [v10 emitReadingFontSizeChangeEventWithTracker:v6 readingSessionData:v7 contentData:v8 fontSize:v9];
}

- (void)appearanceViewController:(id)a3 didChangeAutoNightMode:(BOOL)a4 previousValue:(BOOL)a5
{
  if (a4 != a5)
  {
    BOOL v6 = a4;
    id v11 = +[BAEventReporter sharedReporter];
    unint64_t v8 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
    double v9 = [(BKBookViewController *)self readingSessionData];
    id v10 = [(BKBookViewController *)self contentData];
    [v11 emitReadingAutoNightSettingChangeEventWithTracker:v8 readingSessionData:v9 contentData:v10 isOn:v6];
  }
}

- (void)appearanceViewController:(id)a3 didChangeTheme:(unint64_t)a4
{
  BABackgroundColorDataFromBCAppearanceStyle();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = +[BAEventReporter sharedReporter];
  BOOL v6 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  id v7 = [(BKBookViewController *)self readingSessionData];
  unint64_t v8 = [(BKBookViewController *)self contentData];
  [v5 emitReadingBackgroundColorChangeEventWithTracker:v6 readingSessionData:v7 contentData:v8 backgroundColorData:v9];
}

- (BOOL)autoNightModeForAppearanceViewController:(id)a3
{
  return 0;
}

- (void)appearanceViewControllerShouldDismiss
{
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeLayout:(unint64_t)a5
{
}

- (void)coordinator:(id)a3 observer:(id)a4 didChangeStyle:(unint64_t)a5
{
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKBookViewController;
  unsigned int v7 = [(BKBookViewController *)&v14 canPerformAction:a3 withSender:v6];
  if (!sel_isEqual(a3, "copy:"))
  {
    if (sel_isEqual(a3, "books_showContent:"))
    {
      if (v7)
      {
        unsigned __int8 v8 = [(BKBookViewController *)self canShowContent];
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_pageForward:"))
    {
      if (v7)
      {
        unsigned __int8 v8 = [(BKBookViewController *)self canGoToNextPage];
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_pageBackward:"))
    {
      if (v7)
      {
        unsigned __int8 v8 = [(BKBookViewController *)self canGoToPreviousPage];
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_chapterLeft:") {
           || sel_isEqual(a3, "books_chapterRight:")
    }
           || sel_isEqual(a3, "books_chapterForward:")
           || sel_isEqual(a3, "books_chapterBackward:")
           || sel_isEqual(a3, "books_chapterStart:")
           || sel_isEqual(a3, "books_chapterEnd:"))
    {
      if (v7)
      {
        unsigned __int8 v8 = [(BKBookViewController *)self canNavigateByChapter];
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_toggleBookmark:"))
    {
      if ([(BKBookViewController *)self bookCanBeBookmarked])
      {
        unsigned __int8 v8 = [(BKBookViewController *)self shouldBookmarkButtonsBeEnabled];
        goto LABEL_21;
      }
    }
    else if (sel_isEqual(a3, "books_search:"))
    {
      if (v7 && [(BKBookViewController *)self canSearch])
      {
        id v10 = [(BKBookViewController *)self _searchQueryFromSender:v6];
        char v9 = [v10 length] != 0;

        goto LABEL_36;
      }
    }
    else
    {
      if (!sel_isEqual(a3, "books_find:"))
      {
        if (sel_isEqual(a3, "books_findNext:"))
        {
          if (!v7) {
            goto LABEL_35;
          }
          id v11 = [(BKBookViewController *)self nextSearchResult];
        }
        else
        {
          BOOL isEqual = sel_isEqual(a3, "books_findPrevious:");
          if ((isEqual & v7) != 1)
          {
            char v9 = v7 & ~isEqual;
            goto LABEL_36;
          }
          id v11 = [(BKBookViewController *)self previousSearchResult];
        }
        char v9 = v11 != 0;

        goto LABEL_36;
      }
      if (v7)
      {
        unsigned __int8 v8 = [(BKBookViewController *)self canSearch];
        goto LABEL_21;
      }
    }
LABEL_35:
    char v9 = 0;
    goto LABEL_36;
  }
  if (!v7) {
    goto LABEL_35;
  }
  unsigned __int8 v8 = [(BKBookViewController *)self canCopy];
LABEL_21:
  char v9 = v8;
LABEL_36:

  return v9;
}

- (void)books_close:(id)a3
{
}

- (void)books_showContent:(id)a3
{
}

- (void)books_search:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookViewController *)self _searchQueryFromSender:v4];
  [(BKBookViewController *)self showSearchWithString:v5 sender:v4];
}

- (void)books_find:(id)a3
{
}

- (void)books_findNext:(id)a3
{
  id v4 = [(BKBookViewController *)self nextSearchResult];
  [(BKBookViewController *)self revealSearchResult:v4 animated:1];
}

- (void)books_findPrevious:(id)a3
{
  id v4 = [(BKBookViewController *)self previousSearchResult];
  [(BKBookViewController *)self revealSearchResult:v4 animated:1];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)resetKeyWindow
{
  id v3 = [(BKBookViewController *)self view];
  id v2 = [v3 window];
  [v2 makeKeyAndVisible];
}

- (BOOL)canShowContent
{
  if ([(BKBookViewController *)self section]) {
    return 1;
  }
  id v4 = [(BKViewController *)self currentOverlayViewController];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)canGoToNextPage
{
  return 1;
}

- (BOOL)canGoToPreviousPage
{
  return 1;
}

- (BOOL)canNavigateByChapter
{
  return 1;
}

- (BOOL)canSearch
{
  BOOL v3 = [(BKBookViewController *)self searchButtonItem];
  id v4 = v3;
  BOOL v5 = (!v3 || [v3 isEnabled]) && -[BKBookViewController section](self, "section") == 0;

  return v5;
}

- (id)_contentControllerThatHasCopyableSelection
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = [(BKBookViewController *)self contentViewControllers];
  BOOL v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v13 != v6) {
        objc_enumerationMutation(v3);
      }
      objc_opt_class();
      unsigned __int8 v8 = BUDynamicCast();
      if ([v8 canCopyContent])
      {
        char v9 = [v8 selectedText];
        id v10 = [v9 length];

        if (v10) {
          break;
        }
      }

      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)canCopy
{
  id v2 = [(BKBookViewController *)self _contentControllerThatHasCopyableSelection];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)copy:(id)a3
{
  id v3 = [(BKBookViewController *)self _contentControllerThatHasCopyableSelection];
  [v3 copyContent];
}

- (id)keyCommands
{
  v20.receiver = self;
  v20.super_class = (Class)BKBookViewController;
  id v3 = [(BKBookViewController *)&v20 keyCommands];
  id v4 = [v3 mutableCopy];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NSMutableArray array];
  }
  uint64_t v7 = v6;

  unsigned __int8 v8 = AEBundle();
  char v9 = [v8 localizedStringForKey:@"Next Page" value:&stru_1DF0D8 table:0];
  if ([(BKBookViewController *)self isPageProgressionRTL]) {
    id v10 = UIKeyInputLeftArrow;
  }
  else {
    id v10 = UIKeyInputRightArrow;
  }
  id v11 = +[UIKeyCommand commandWithTitle:v9 image:0 action:"books_pageForward:" input:v10 modifierFlags:0 propertyList:0];

  [v11 setWantsPriorityOverSystemBehavior:1];
  [v11 setAllowsAutomaticMirroring:0];
  [v7 addObject:v11];
  long long v12 = +[UIKeyCommand keyCommandWithInput:@" " modifierFlags:0 action:"books_pageForward:"];
  [v12 setWantsPriorityOverSystemBehavior:1];
  [v12 setAttributes:[v12 attributes] | 4];
  [v7 addObject:v12];
  long long v13 = +[UIKeyCommand keyCommandWithInput:UIKeyInputPageDown modifierFlags:0 action:"books_pageForward:"];
  [v13 setWantsPriorityOverSystemBehavior:1];
  [v13 setAttributes:([v13 attributes] | 4)];
  [v7 addObject:v13];

  long long v14 = AEBundle();
  long long v15 = [v14 localizedStringForKey:@"Previous Page" value:&stru_1DF0D8 table:0];
  if ([(BKBookViewController *)self isPageProgressionRTL]) {
    double v16 = UIKeyInputRightArrow;
  }
  else {
    double v16 = UIKeyInputLeftArrow;
  }
  double v17 = +[UIKeyCommand commandWithTitle:v15 image:0 action:"books_pageBackward:" input:v16 modifierFlags:0 propertyList:0];

  [v17 setWantsPriorityOverSystemBehavior:1];
  [v17 setAllowsAutomaticMirroring:0];
  [v7 addObject:v17];
  double v18 = +[UIKeyCommand keyCommandWithInput:UIKeyInputPageUp modifierFlags:0 action:"books_pageBackward:"];
  [v18 setWantsPriorityOverSystemBehavior:1];
  [v18 setAttributes:[v18 attributes] | 4];
  [v7 addObject:v18];

  return v7;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKBookViewController;
  [(BKBookViewController *)&v11 validateCommand:v4];
  id v5 = (const char *)[v4 action];
  unsigned __int8 v6 = [(BKBookViewController *)self isPageProgressionRTL];
  if (sel_isEqual(v5, "books_chapterLeft:"))
  {
    uint64_t v7 = AEBundle();
    if (v6)
    {
LABEL_3:
      CFStringRef v8 = @"Next Chapter";
      goto LABEL_7;
    }
LABEL_6:
    CFStringRef v8 = @"Previous Chapter";
    goto LABEL_7;
  }
  if (sel_isEqual(v5, "books_chapterRight:"))
  {
    uint64_t v7 = AEBundle();
    if ((v6 & 1) == 0) {
      goto LABEL_3;
    }
    goto LABEL_6;
  }
  if (!sel_isEqual(v5, "books_toggleBookmark:")) {
    goto LABEL_8;
  }
  unsigned int v10 = [(BKBookViewController *)self isPageBookmarked];
  uint64_t v7 = AEBundle();
  if (v10) {
    CFStringRef v8 = @"Remove Bookmark";
  }
  else {
    CFStringRef v8 = @"Bookmark Page";
  }
LABEL_7:
  char v9 = [v7 localizedStringForKey:v8 value:&stru_1DF0D8 table:0];
  [v4 setTitle:v9];

LABEL_8:
}

- (void)books_chapterStart:(id)a3
{
}

- (void)books_chapterEnd:(id)a3
{
}

- (void)books_chapterForward:(id)a3
{
}

- (void)books_chapterBackward:(id)a3
{
}

- (void)books_toggleBookmark:(id)a3
{
}

- (void)books_chapterLeft:(id)a3
{
  id v4 = a3;
  if ([(BKBookViewController *)self isPageProgressionRTL]) {
    [(BKBookViewController *)self books_chapterForward:v4];
  }
  else {
    [(BKBookViewController *)self books_chapterBackward:v4];
  }
}

- (void)books_chapterRight:(id)a3
{
  id v4 = a3;
  if ([(BKBookViewController *)self isPageProgressionRTL]) {
    [(BKBookViewController *)self books_chapterBackward:v4];
  }
  else {
    [(BKBookViewController *)self books_chapterForward:v4];
  }
}

- (BOOL)shouldSavePageControlVisibility
{
  return 1;
}

- (void)savePageControlVisibility
{
  id v3 = [(BKBookViewController *)self view];
  id v4 = [v3 window];

  if (v4 && [(BKBookViewController *)self shouldSavePageControlVisibility])
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    unsigned int v5 = [(BKBookViewController *)self controlsVisible];
    [v6 setBool:v5 ^ 1 forKey:BKBookHidePageControls[0]];
  }
}

- (void)cancelPendingSavePageControlVisibility
{
  id v2 = [(BKBookViewController *)self performSelectorProxy];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v2 selector:"savePageControlVisibility" object:0];
}

- (double)savePageControlVisibilityDelay
{
  return 10.0;
}

- (void)delayedSavePageControlVisibility
{
  [(BKBookViewController *)self cancelPendingSavePageControlVisibility];
  id v3 = [(BKBookViewController *)self performSelectorProxy];
  [(BKBookViewController *)self savePageControlVisibilityDelay];
  [v3 performSelector:@"savePageControlVisibility" withObject:0 afterDelay:0];
}

- (void)clearSearchResult
{
  [(BKBookViewController *)self setSearchResult:0];
  id v4 = [(BKBookViewController *)self contentViewControllers];
  id v3 = [v4 allValues];
  [v3 makeObjectsPerformSelector:"clearSearchLocation" withObject:0];
}

- (void)clearSelection
{
  [(BKBookViewController *)self setSearchResult:0];
  id v4 = [(BKBookViewController *)self contentViewControllers];
  id v3 = [v4 allValues];
  [v3 makeObjectsPerformSelector:"clearSelection" withObject:0];
}

- (void)clearSelectedAnnotation
{
  id v3 = [(BKBookViewController *)self contentViewControllers];
  id v2 = [v3 allValues];
  [v2 makeObjectsPerformSelector:"clearSelectedAnnotation"];
}

- (void)clearCurrentHighlighting
{
  id v3 = [(BKBookViewController *)self contentViewControllers];
  id v2 = [v3 allValues];
  [v2 makeObjectsPerformSelector:"clearCurrentHighlighting"];
}

- (BOOL)hasTextSelected
{
  return 0;
}

- (BOOL)hasHighlightedText
{
  return 0;
}

- (void)forceReload
{
  id v3 = [(BKBookViewController *)self currentLocation];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(BKBookViewController *)self contentViewControllers];
  unsigned int v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if ([v11 isContentLoaded]) {
            [v11 reload];
          }
        }
        char v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(BKPaginationController *)self->_paginationController releasePaginationInfo];
  [(BKBookViewController *)self setPageCountIncludingUpsell:0x7FFFFFFFFFFFFFFFLL];
  [(BKBookViewController *)self paginationUpdateRequired];
  [(BKBookViewController *)self jumpToLocation:v3 animated:0 completion:0];
}

- (void)forceRepagination
{
  [(BKPaginationController *)self->_paginationController releasePaginationInfo];
  [(BKBookViewController *)self setPageCountIncludingUpsell:0x7FFFFFFFFFFFFFFFLL];

  [(BKBookViewController *)self paginationUpdateRequired];
}

- (void)paginationUpdateRequired
{
  id v3 = [(BKBookViewController *)self navigationHistory];
  id v4 = [(BKBookViewController *)self paginationController];
  [v4 setNavigationHistory:v3];

  id v5 = [(BKBookViewController *)self paginationController];
  [v5 repaginateWithStyle:0 geometry:0];
}

- (id)titleForChapterAtPageNumber:(int64_t)a3
{
  id v3 = 0;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(BKBookViewController *)self paginationController];
    id v7 = [v6 pageTotal];

    if ((uint64_t)v7 >= a3)
    {
      long long v12 = [(BKBookViewController *)self paginationController];
      uint64_t v14 = [v12 titleForChapterAtPageNumber:a3];
    }
    else
    {
      uint64_t v8 = [(BKBookViewController *)self book];
      char v9 = [v8 sampleContent];
      unsigned int v10 = [v9 BOOLValue];

      id v11 = AEBundle();
      long long v12 = v11;
      if (v10) {
        CFStringRef v13 = @"Buy Book";
      }
      else {
        CFStringRef v13 = @"End of Book";
      }
      uint64_t v14 = [v11 localizedStringForKey:v13 value:&stru_1DF0D8 table:0];
    }
    id v3 = (void *)v14;
  }

  return v3;
}

- (id)getViewSnapshot
{
  return 0;
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = self->_bookMoc;
  id v7 = v6;
  if (v6) {
    BOOL v8 = v6 == v5;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    char v9 = [(NSManagedObjectContext *)v6 persistentStoreCoordinator];
    unsigned int v10 = [(NSManagedObjectContext *)v5 persistentStoreCoordinator];

    if (v9 == v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_54CE0;
      v14[3] = &unk_1DBF08;
      long long v15 = v7;
      id v16 = v4;
      id v11 = objc_retainBlock(v14);
      if (v11)
      {
        if (+[NSThread isMainThread])
        {
          ((void (*)(void *))v11[2])(v11);
        }
        else
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_54CEC;
          block[3] = &unk_1DADC0;
          CFStringRef v13 = v11;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
  }
}

- (id)searchButtonItem
{
  return 0;
}

- (id)nextSearchResult
{
  return [(BKBookViewController *)self _searchResultOffsetByDistance:1];
}

- (id)previousSearchResult
{
  return [(BKBookViewController *)self _searchResultOffsetByDistance:-1];
}

- (id)_searchResultOffsetByDistance:(int64_t)a3
{
  id v5 = [(BKBookViewController *)self searchResult];
  id v6 = [(BKBookViewController *)self searchViewControllerIfLoaded];
  id v7 = [v6 searchController];
  BOOL v8 = [v7 results];

  char v9 = 0;
  if (v5 && v8)
  {
    id v10 = [v8 indexOfObject:v5];
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL
      || (uint64_t v11 = (uint64_t)v10 + a3, v11 < 0)
      || v11 >= (unint64_t)[v8 count])
    {
      char v9 = 0;
    }
    else
    {
      char v9 = [v8 objectAtIndexedSubscript:v11];
    }
  }

  return v9;
}

- (int64_t)currentPageNumber
{
  int64_t result = (int64_t)[(BKBookViewController *)self currentPages];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    return v3 + result - 1;
  }
  return result;
}

- (id)documentForLocation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(BKBookViewController *)self book];
    id v7 = [v5 path];

    BOOL v8 = [v6 documentAtPath:v7];
  }
  else
  {
    id v6 = [(BKBookViewController *)self book];
    BOOL v8 = [v6 documentWithOrdinal:[v4 ordinal]];
  }

  return v8;
}

- (_NSRange)currentPages
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)turnToPageNumber:(int64_t)a3 animated:(BOOL)a4
{
  [(BKBookViewController *)self dismissCurrentPopover];

  [(BKBookViewController *)self didChangeLocationClosing:0 suspending:0];
}

- (void)recordJumpFromCurrentLocation
{
}

- (void)jumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v5 = (void (**)(void))objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    v5[2]();
    id v5 = v6;
  }
}

- (void)recordedJumpToLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v28 = v9;
  if (v8)
  {
    id v10 = [(BKBookViewController *)self documentForLocation:v8];
    uint64_t v11 = v10;
    if (v10)
    {
      long long v12 = [v10 documentOrdinal];
      if ([v12 integerValue] == (id)-1)
      {
LABEL_6:

LABEL_7:
        uint64_t v14 = [(BKBookViewController *)self book];
        long long v15 = [v14 urlForDocument:v11];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v8;
          double v17 = [v16 anchor];

          if (v17)
          {
            double v18 = [v16 anchor];
            uint64_t v19 = [v15 URLByAppendingPathComponent:v18];

            long long v15 = (void *)v19;
          }
        }
        objc_super v20 = +[BKExpandedContentResource resourceForURL:v15];
        double v21 = [(BKBookViewController *)self book];
        id v22 = [v21 cacheItem];
        [v20 setCacheItem:v22];

        [(BKBookViewController *)self showExpandedContentForResource:v20 atLocation:v8 completion:v28];
LABEL_19:

        goto LABEL_20;
      }
      CFStringRef v13 = [v11 nonlinearElement];
      if ([v13 BOOLValue])
      {

        goto LABEL_6;
      }
      v24 = [v11 documentOrdinal];

      if (!v24) {
        goto LABEL_7;
      }
    }
    if (self->_isReading)
    {
      uint64_t v25 = [(BKBookViewController *)self currentLocation];
      unsigned int v26 = [v8 isEqual:v25];

      if (v26) {
        [(BKBookViewController *)self startReadAloud];
      }
    }
    uint64_t v27 = [(BKBookViewController *)self _normalizedLocation:v8];

    [(BKBookViewController *)self recordJumpFromCurrentLocation];
    [(BKBookViewController *)self jumpToLocation:v27 animated:v6 completion:v28];
    id v8 = (id)v27;
    goto LABEL_19;
  }
  id v23 = objc_retainBlock(v9);
  id v8 = v23;
  if (v23) {
    (*((void (**)(id))v23 + 2))(v23);
  }
LABEL_20:
}

- (id)locationForPath:(id)a3 fragment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7
    && +[BKNavigationInfo isExcludedFromSampleHash:v7])
  {
    id v8 = [[BKLocation alloc] initWithOrdinal:[(BKBookViewController *)self upsellOrdinal]];
  }
  else
  {
    id v9 = [(BKBookViewController *)self book];
    id v10 = [v9 documentsWithPath:v6 sortBy:@"documentOrdinal" limit:0];
    uint64_t v11 = [v10 lastObject];

    long long v12 = [v11 documentOrdinal];
    id v13 = [v12 integerValue];

    id v8 = [[BKAnchorLocation alloc] initWithOrdinal:v13 andAnchor:v7];
  }

  return v8;
}

- (id)_normalizedLocation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();
  id v6 = v4;
  if (v5)
  {
    id v7 = _AECaptureLocationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v4;
    }

    id v8 = [v5 path];
    id v9 = [v8 length];

    if (v9)
    {
      id v10 = _AECaptureLocationLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Had path - using locationForPath:fragment:", buf, 2u);
      }

      uint64_t v11 = [v5 path];
      id v12 = [v5 anchor];
      id v6 = [(BKBookViewController *)self locationForPath:v11 fragment:v12];
      id v13 = v4;
      goto LABEL_27;
    }
    uint64_t v11 = [v5 anchor];
    uint64_t v14 = _AECaptureLocationLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v43 = v11;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "We had no path - Attempting to parse the anchor: %{public}@", buf, 0xCu);
    }

    id v41 = 0;
    id v13 = +[NSRegularExpression regularExpressionWithPattern:@"(\\d+)" options:1 error:&v41];
    id v12 = v41;
    if (v12 || !v11)
    {
      id v28 = _AECaptureLocationLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v43 = v11;
        __int16 v44 = 2114;
        id v45 = v12;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "Failed to create regular expression to get page number from %{public}@ - %{public}@", buf, 0x16u);
      }
    }
    else
    {
      long long v15 = [v13 firstMatchInString:v11 options:2 range:NSMakeRange(0, [v11 length])];
      id v16 = [v15 range];
      double v18 = [v11 substringWithRange:v16, v17];
      uint64_t v19 = (char *)[v18 integerValue];
      objc_super v20 = _AECaptureLocationLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        +[NSNumber numberWithInteger:v19];
        v21 = id v40 = v19;
        *(_DWORD *)buf = 138543618;
        id v43 = v18;
        __int16 v44 = 2114;
        id v45 = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Parsing page - Captured substring: %{public}@ and got value: %{public}@", buf, 0x16u);

        uint64_t v19 = v40;
      }

      if (v19 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v11 containsString:@"page("]
        {
          id v22 = _AECaptureLocationLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            +[NSNumber numberWithInteger:v19];
            v24 = id v23 = v19;
            *(_DWORD *)buf = 138543362;
            id v43 = v24;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "Parsing page - %{public}@", buf, 0xCu);

            uint64_t v19 = v23;
          }

          uint64_t v25 = [(BKBookViewController *)self paginationController];
          unsigned int v26 = v25;
          uint64_t v27 = v19;
          goto LABEL_26;
        }
        if ([v11 containsString:@"chapter("]
        {
          [(BKBookViewController *)self paginationController];
          v35 = id v34 = v19;
          id v36 = (char *)[v35 pageRangeForChapterAtIndex:v34 - 1];

          v37 = _AECaptureLocationLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = +[NSNumber numberWithInteger:v34];
            id v39 = +[NSNumber numberWithUnsignedInteger:v36];
            *(_DWORD *)buf = 138543618;
            id v43 = v38;
            __int16 v44 = 2114;
            id v45 = v39;
            _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Parsing chapter - Captured chapterNumber: %{public}@ and got startPage: %{public}@", buf, 0x16u);
          }
          uint64_t v25 = [(BKBookViewController *)self paginationController];
          unsigned int v26 = v25;
          uint64_t v27 = v36;
          goto LABEL_26;
        }
        uint64_t v29 = _AECaptureLocationLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v43 = v11;
          uint64_t v31 = v29;
          uint32_t v32 = 12;
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    uint64_t v29 = _AECaptureLocationLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v43 = v13;
      __int16 v44 = 2114;
      id v45 = v11;
      uint64_t v31 = v29;
      uint32_t v32 = 22;
LABEL_24:
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    }
LABEL_25:

    uint64_t v25 = [(BKBookViewController *)self paginationController];
    unsigned int v26 = v25;
    uint64_t v27 = 0;
LABEL_26:
    id v6 = [v25 pageLocationForPageNumber:v27, v40];

LABEL_27:
  }

  return v6;
}

- (void)goToPath:(id)a3 fragment:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(BKBookViewController *)self locationForPath:a3 fragment:a4];
  [(BKBookViewController *)self recordedJumpToLocation:v7 animated:v5 completion:0];
}

- (void)jumpBackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BKBookViewController *)self navigationHistory];
  unsigned int v6 = [v5 isAtTopOfStack];

  if (v6) {
    [(BKBookViewController *)self recordJumpFromCurrentLocation];
  }
  id v7 = [(BKBookViewController *)self navigationHistory];
  [v7 rewind];

  id v8 = [(BKBookViewController *)self navigationHistory];
  id v10 = [v8 currentEntity];

  id v9 = [v10 location];
  [(BKBookViewController *)self jumpToLocation:v9 animated:v3 completion:0];
}

- (void)jumpAheadAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(BKBookViewController *)self navigationHistory];
  id v12 = [v5 nextEntity];

  unsigned int v6 = v12;
  if (v12)
  {
    id v7 = [(BKBookViewController *)self navigationHistory];
    [v7 skip];

    id v8 = [(BKBookViewController *)self navigationHistory];
    unsigned int v9 = [v8 isAtTopOfStack];

    if (v9)
    {
      id v10 = [(BKBookViewController *)self navigationHistory];
      [v10 truncateHistory];
    }
    uint64_t v11 = [v12 location];
    [(BKBookViewController *)self jumpToLocation:v11 animated:v3 completion:0];

    unsigned int v6 = v12;
  }
}

- (BOOL)_currentChapterInfo:(id *)a3 uniqueID:(id *)a4
{
  id v7 = [(BKBookViewController *)self currentPages];
  int64_t v9 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v8);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v10 = v9;
  uint64_t v11 = [(BKBookViewController *)self paginationController];
  id v12 = [v11 numberOfChapters];

  id v13 = [(BKBookViewController *)self paginationController];
  uint64_t v14 = v13;
  if (!v12)
  {
    id v18 = [v13 pageTotal];

    if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_super v20 = [(BKBookViewController *)self paginationController];
      *a4 = [v20 hrefForPageNumber:v10];

      uint64_t v17 = [(BKBookViewController *)self paginationController];
      double v21 = [v17 physicalPageTitlesForPageNumber:v10];
      *a3 = [v21 firstObject];

      goto LABEL_8;
    }
    return 0;
  }
  id v15 = [v13 chapterIndexForPageNumber:v10];

  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  id v16 = [(BKBookViewController *)self paginationController];
  *a4 = [v16 hrefForChapterAtPageNumber:v10];

  uint64_t v17 = [(BKBookViewController *)self paginationController];
  *a3 = [v17 titleForChapterAtPageNumber:v10];
LABEL_8:

  return 1;
}

- (void)updateProgressKitForNewLocation
{
  id v12 = 0;
  id v13 = 0;
  unsigned int v3 = [(BKBookViewController *)self _currentChapterInfo:&v13 uniqueID:&v12];
  id v4 = v13;
  id v5 = v12;
  if (v3)
  {
    unsigned int v6 = +[BCProgressKitController sharedController];
    id v7 = [(BKBookViewController *)self book];
    uint64_t v8 = [v7 assetID];
    [v6 activateChapterForBook:v8 chapterID:v5 title:v4 completion:0];
  }
  int64_t v9 = +[BCProgressKitController sharedController];
  int64_t v10 = [(BKBookViewController *)self book];
  uint64_t v11 = [v10 assetID];
  [v9 updateBookProgress:v11 completion:0];
}

- (void)writeAnnotationsToWebProcessPlugin
{
  unsigned int v3 = [(BKBookViewController *)self visiblePageBookmarks];
  id v4 = [(BKBookViewController *)self visiblePageHighlights];
  uint64_t v27 = +[AEAnnotation dictionaryRepresentationsForAnnotations:v4];
  id v5 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unsigned int v6 = [(BKBookViewController *)self contentViewControllers];
  id v7 = [v6 allValues];

  uint64_t v8 = (char *)[v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    int64_t v9 = v8;
    id v23 = v4;
    v24 = v3;
    int64_t v10 = 0;
    uint64_t v11 = *(void *)v34;
    id v12 = &OBJC_IVAR___BKThumbnailBookViewController__resumeBarButtonItem;
    uint64_t v25 = v7;
    uint64_t v26 = *(void *)v34;
    do
    {
      id v13 = 0;
      id v28 = v9;
      do
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = v10;
          id v15 = v12;
          objc_opt_class();
          id v16 = BUDynamicCast();
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v17 = v27;
          id v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v30;
            do
            {
              for (i = 0; i != v19; i = (char *)i + 1)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                id v22 = [v16 objectForMatchingAnnotation:*(void *)(*((void *)&v29 + 1) + 8 * i) v23];
                if (v22) {
                  [v5 addObject:v22];
                }
              }
              id v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v19);
          }

          int64_t v10 = v16;
          id v7 = v25;
          uint64_t v11 = v26;
          id v12 = v15;
          int64_t v9 = v28;
        }
        ++v13;
      }
      while (v13 != v9);
      int64_t v9 = (char *)[v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);

    if (!v10)
    {
      id v4 = v23;
      unsigned int v3 = v24;
      goto LABEL_24;
    }
    unsigned int v3 = v24;
    id v7 = +[AEAnnotation dictionaryRepresentationsForAnnotations:v24];
    [v10 writeAnnotationsToWebProcessPlugin:v7 andHighlights:v5];
    id v4 = v23;
  }
  else
  {
    int64_t v10 = 0;
  }

LABEL_24:
}

- (void)writeControlVisibilityStateToWebProcessPlugin
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v3 = [(BKBookViewController *)self contentViewControllers];
  id v4 = [v3 allValues];

  id v5 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          int64_t v9 = BUDynamicCast();
          [v9 writeControlVisibilityStateToWebProcessPlugin:self->_controlsVisible];

          goto LABEL_11;
        }
      }
      unsigned int v6 = (char *)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)didChangeLocationClosing:(BOOL)a3 suspending:(BOOL)a4
{
  if (!a3) {
    [(BKBookViewController *)self setUserNavigated:1];
  }
  unsigned int v6 = [(BKBookViewController *)self book];
  uint64_t v7 = [v6 sampleContent];
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    int64_t v9 = [(BKBookViewController *)self readingLocationHighwaterMark];

    if (!v9)
    {
      long long v10 = [(BKBookViewController *)self book];
      long long v11 = [(BKBookViewController *)self annotationProvider];
      long long v12 = [v11 uiManagedObjectContext];
      long long v13 = [v10 readingLocationAnnotation:0 moc:v12];
      [v13 readingProgressHighWaterMark];
      uint64_t v14 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
      [(BKBookViewController *)self setReadingLocationHighwaterMark:v14];
    }
    id v15 = [(BKBookViewController *)self readingProgress];
    if (v15)
    {
      id v16 = [(BKBookViewController *)self assetViewControllerDelegate];
      uint64_t v25 = BCAssetReadingProgressKey;
      uint64_t v26 = v15;
      id v17 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v16 assetViewController:self assetPropertyChanged:v17];

      id v18 = [(BKBookViewController *)self readingLocationHighwaterMark];
      [v18 floatValue];
      float v20 = v19;
      float v21 = kAEAnnotationReadingLocationSignificantHighwaterMark;

      if (v20 < v21)
      {
        [(BKBookViewController *)self setReadingLocationHighwaterMark:v15];
        [v15 floatValue];
        if (v22 > v21)
        {
          id v23 = [(BKBookViewController *)self assetViewControllerDelegate];
          [v23 assetViewControllerSignificantReadingLocationChange:self];
        }
      }
    }
    if (!a4) {
      [(BKBookViewController *)self updateProgressKitForNewLocation];
    }
    [(BKBookViewController *)self readingLocationChanged];
  }
  [(BKBookViewController *)self updateTouchBarController];
  v24 = [(BKBookViewController *)self displaySleepController];
  [v24 userInteractionOccurred];
}

- (void)setLocation:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_location, a3);
  unsigned int v6 = _AEBookPluginsLifeCycleLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    int64_t v9 = [(BKBookViewController *)self book];
    long long v10 = [v9 assetLogID];
    int v11 = 138543874;
    long long v12 = v7;
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "SetLocation BVC:%{public}@.  Location:%{public}@ logID:%{public}@ ", (uint8_t *)&v11, 0x20u);
  }
}

- (id)currentLocation
{
  return 0;
}

- (id)currentPageLocation
{
  return 0;
}

- (id)pageLocationForPageNumber:(int64_t)a3
{
  id v4 = [(BKBookViewController *)self paginationController];
  id v5 = [v4 pageLocationForPageNumber:a3];

  return v5;
}

- (int64_t)pageNumberFromRange:(_NSRange)a3
{
  return a3.location;
}

- (BKLocation)resumeLocation
{
  resumeLocation = self->_resumeLocation;
  if (resumeLocation)
  {
    unsigned int v3 = resumeLocation;
  }
  else
  {
    unsigned int v3 = [(BKBookViewController *)self currentLocation];
  }

  return v3;
}

- (BOOL)shouldSyncLocation:(id)a3
{
  return 1;
}

- (void)saveReadingLocation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v4)
  {
    id v5 = [(BKBookViewController *)self book];
    if (v5)
    {
      unsigned int v6 = [(BKBookViewController *)self book];
      if ([v6 isDeleted])
      {
      }
      else
      {
        unsigned int v7 = [(BKBookViewController *)self userNavigated];

        if (v7)
        {
          id v8 = [(BKBookViewController *)self book];
          id v9 = [v8 readingLocation];

          long long v10 = [(BKBookViewController *)self reportedLocation];
          if (!v10
            || ([(BKBookViewController *)self reportedLocation],
                int v11 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v12 = [v4 isEqual:v11],
                v11,
                v10,
                (v12 & 1) == 0))
          {
            [(BKBookViewController *)self setReportedLocation:v4];
            id v13 = v4;

            id v14 = _AEBookPluginsLifeCycleLog();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v15 = [(BKBookViewController *)self book];
              id v16 = [v15 databaseKey];
              id v17 = [(BKBookViewController *)self book];
              id v18 = [v17 assetLogID];
              *(_DWORD *)buf = 138543874;
              id v27 = v13;
              __int16 v28 = 2112;
              long long v29 = v16;
              __int16 v30 = 2114;
              long long v31 = v18;
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Saving location into global annotation:%{public}@ assetID:%@ logID:%{public}@", buf, 0x20u);
            }
            objc_initWeak((id *)buf, self);
            float v19 = [(BKBookViewController *)self book];
            float v20 = _NSConcreteStackBlock;
            uint64_t v21 = 3221225472;
            float v22 = sub_56914;
            id v23 = &unk_1DBF80;
            objc_copyWeak(&v25, (id *)buf);
            id v9 = v13;
            id v24 = v9;
            [v19 setSingletonAnnotationType:3 location:v9 modificationHandler:&v20];

            objc_destroyWeak(&v25);
            objc_destroyWeak((id *)buf);
          }
          -[BKBookViewController setLocation:](self, "setLocation:", v9, v20, v21, v22, v23);
        }
      }
    }
  }
}

- (id)_currentReadingProgress
{
  uint64_t v3 = [(BKBookViewController *)self pageCountIncludingUpsell];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = v3;
    if (v3 < 1)
    {
      id v4 = &off_1E9718;
    }
    else
    {
      id v7 = [(BKBookViewController *)self currentPages];
      id v4 = 0;
      if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v6)
      {
        *(float *)&double v8 = (float)((uint64_t)v7 + v6 - 1) / (float)v5;
        id v4 = +[NSNumber numberWithFloat:v8];
      }
    }
  }

  return v4;
}

- (BOOL)isLocationOnCurrentPage:(id)a3
{
  return 0;
}

- (void)isLocationVisible:(id)a3 completion:(id)a4
{
  id v4 = objc_retainBlock(a4);
  if (v4)
  {
    id v5 = v4;
    (*((void (**)(id, void))v4 + 2))(v4, 0);
    id v4 = v5;
  }
}

- (id)pageTitleForPageNumber:(int64_t)a3
{
  return 0;
}

- (BOOL)isPageBookmarked
{
  NSUInteger v2 = [(BKBookViewController *)self visiblePageBookmarks];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)shouldBookmarkButtonsBeEnabled
{
  return 1;
}

- (BOOL)bookCanBeBookmarked
{
  if (isPad())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = [(BKBookViewController *)self book];
    id v5 = [v4 sampleContent];
    unsigned int v3 = [v5 BOOLValue] ^ 1;
  }
  return v3;
}

- (id)_allAnnotationsForType:(int)a3
{
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NSFetchedResultsController *)self->_pageBookmarksFRC fetchedObjects];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 annotationType] == a3) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_visibleAnnotationsForType:(int)a3
{
  id v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(NSFetchedResultsController *)self->_pageBookmarksFRC fetchedObjects];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 annotationType] == a3
          && [(BKBookViewController *)self isAnnotationVisible:v11])
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)visiblePageBookmarks
{
  return [(BKBookViewController *)self _visibleAnnotationsForType:1];
}

- (id)visiblePageHighlights
{
  return [(BKBookViewController *)self _visibleAnnotationsForType:2];
}

- (BOOL)isAnnotationVisible:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[BKBookViewController isAnnotationVisible:]");
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (void)bookmarkPage:(id)a3
{
  id v4 = [objc_alloc((Class)BAViewData) initWithType:2 action:5 location:2];
  id v5 = +[BAEventReporter sharedReporter];
  uint64_t v6 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  id v7 = [(BKBookViewController *)self contentDataForSearchViewController:0];
  [v5 emitAnnotationActionEventWithTracker:v6 contentData:v7 viewData:v4];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5704C;
  v8[3] = &unk_1DAB88;
  v8[4] = self;
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v8];
}

- (void)unbookmarkPage:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_572C0;
  v3[3] = &unk_1DAB88;
  v3[4] = self;
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v3];
}

- (void)toggleBookmark:(id)a3
{
  id v4 = a3;
  if ([(BKBookViewController *)self isPageBookmarked]) {
    [(BKBookViewController *)self unbookmarkPage:v4];
  }
  else {
    [(BKBookViewController *)self bookmarkPage:v4];
  }

  [(BKBookViewController *)self updateBookmarkButton:1];
}

- (void)updateBookmarkButton:(BOOL)a3
{
  [(BKBookViewController *)self updateToolbarController];

  [(BKBookViewController *)self updateTouchBarController];
}

- (id)bookmarksFetchRequestForBook:(id)a3 moc:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSFetchRequest);
  id v8 = [v6 assetID];
  uint64_t v9 = +[AEAnnotation pageBookmarksPredicate:v8];

  long long v10 = [v6 assetID];
  int v11 = +[AEAnnotation predicateForGlobalAnnotationWithAssetID:v10];

  unsigned __int8 v12 = [v6 assetID];

  long long v13 = +[AEAnnotation highlightsPredicate:v12];

  id v14 = objc_alloc((Class)NSCompoundPredicate);
  v22[0] = v9;
  v22[1] = v11;
  v22[2] = v13;
  long long v15 = +[NSArray arrayWithObjects:v22 count:3];
  id v16 = [v14 initWithType:2 subpredicates:v15];

  [v7 setPredicate:v16];
  long long v17 = +[NSEntityDescription entityForName:@"AEAnnotation" inManagedObjectContext:v5];

  [v7 setEntity:v17];
  id v18 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"plLocationRangeStart" ascending:1];
  id v21 = v18;
  float v19 = +[NSArray arrayWithObjects:&v21 count:1];
  [v7 setSortDescriptors:v19];

  return v7;
}

- (void)startFetchingBookmarks
{
  if (!self->_pageBookmarksFRC)
  {
    id v3 = [(BKBookViewController *)self book];
    id v4 = [v3 annotationProvider];
    id v5 = [v4 uiManagedObjectContext];

    id v6 = [(BKBookViewController *)self bookmarksFetchRequestForBook:v3 moc:v5];
    id v7 = (NSFetchedResultsController *)[objc_alloc((Class)IMUbiquitousFetchedResultsController) initWithFetchRequest:v6 managedObjectContext:v5 sectionNameKeyPath:0 cacheName:0];
    pageBookmarksFRC = self->_pageBookmarksFRC;
    self->_pageBookmarksFRC = v7;

    [(NSFetchedResultsController *)self->_pageBookmarksFRC setDelegate:self];
    uint64_t v9 = self->_pageBookmarksFRC;
    id v75 = 0;
    unsigned __int8 v10 = [(NSFetchedResultsController *)v9 performFetch:&v75];
    id v11 = v75;
    unsigned __int8 v12 = v11;
    if (v10)
    {
      id v63 = v11;
      v64 = v6;
      v65 = v3;
      long long v13 = [v3 assetID];
      uint64_t v14 = +[AEAnnotation predicateForGlobalAnnotationWithAssetID:v13];

      long long v15 = [(NSFetchedResultsController *)self->_pageBookmarksFRC fetchedObjects];
      v62 = (void *)v14;
      id v16 = [v15 filteredArrayUsingPredicate:v14];

      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v18)
      {
        id v19 = v18;
        float v20 = 0;
        uint64_t v21 = *(void *)v72;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v72 != v21) {
              objc_enumerationMutation(v17);
            }
            id v23 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            if (!v20) {
              goto LABEL_10;
            }
            id v24 = [*(id *)(*((void *)&v71 + 1) + 8 * i) locationModificationDate];
            [v24 timeIntervalSinceReferenceDate];
            double v26 = v25;
            id v27 = [v20 locationModificationDate];
            [v27 timeIntervalSinceReferenceDate];
            double v29 = v28;

            if (v26 > v29)
            {
LABEL_10:
              __int16 v30 = v23;

              float v20 = v30;
            }
          }
          id v19 = [v17 countByEnumeratingWithState:&v71 objects:v83 count:16];
        }
        while (v19);
      }
      else
      {
        float v20 = 0;
      }

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v31 = v17;
      id v32 = [v31 countByEnumeratingWithState:&v67 objects:v82 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v68;
        do
        {
          for (j = 0; j != v33; j = (char *)j + 1)
          {
            if (*(void *)v68 != v34) {
              objc_enumerationMutation(v31);
            }
            if (v20)
            {
              long long v36 = *(NSObject **)(*((void *)&v67 + 1) + 8 * (void)j);
              if (v36 != v20) {
                [v36 setAnnotationDeleted:1];
              }
            }
          }
          id v33 = [v31 countByEnumeratingWithState:&v67 objects:v82 count:16];
        }
        while (v33);
      }

      if ([v5 hasChanges])
      {
        id v66 = 0;
        [v5 save:&v66];
        id v37 = v66;
        if (v37)
        {
          v38 = BKMobileCloudSyncAnnotationsLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            sub_137A50();
          }
        }
      }
      uint64_t v39 = [v20 location];
      if (v39
        && (id v40 = (void *)v39,
            [(BKBookViewController *)self openingLocation],
            id v41 = objc_claimAutoreleasedReturnValue(),
            v41,
            v40,
            !v41))
      {
        v52 = _AEBookPluginsLifeCycleLog();
        id v3 = v65;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [v20 location];
          v61 = [(BKBookViewController *)self book];
          v54 = [v61 databaseKey];
          v55 = [(BKBookViewController *)self book];
          v56 = [v55 assetLogID];
          *(_DWORD *)buf = 138543874;
          v77 = v53;
          __int16 v78 = 2112;
          v79 = v54;
          __int16 v80 = 2114;
          v81 = v56;
          _os_log_impl(&dword_0, v52, OS_LOG_TYPE_DEFAULT, "Restoring location from global annotation:%{public}@ for assetID:%@ logID:%{public}@", buf, 0x20u);
        }
        v57 = [v20 location];
        [(BKBookViewController *)self setLocation:v57];

        v58 = [(BKBookViewController *)self location];
        [(BKBookViewController *)self setReportedLocation:v58];

        [(BKBookViewController *)self setUserNavigated:0];
      }
      else
      {
        id v3 = v65;
        if (!v20)
        {
          objc_super v42 = _AEBookPluginsLifeCycleLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v59 = [(BKBookViewController *)self book];
            id v43 = [v59 databaseKey];
            __int16 v44 = [(BKBookViewController *)self book];
            id v45 = [v44 assetLogID];
            *(_DWORD *)buf = 138412546;
            v77 = v43;
            __int16 v78 = 2114;
            v79 = v45;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "%@ logID:%{public}@ No global annotation to restore from", buf, 0x16u);
          }
        }
        v46 = [(BKBookViewController *)self openingLocation];

        if (v46)
        {
          v47 = _AEBookPluginsLifeCycleLog();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            v60 = [(BKBookViewController *)self book];
            v48 = [v60 databaseKey];
            v49 = [(BKBookViewController *)self book];
            v50 = [v49 assetLogID];
            v51 = [(BKBookViewController *)self openingLocation];
            *(_DWORD *)buf = 138412802;
            v77 = v48;
            __int16 v78 = 2114;
            v79 = v50;
            __int16 v80 = 2112;
            v81 = v51;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "%@ logID:%{public}@ Have existing openingLocation: %@", buf, 0x20u);
          }
        }
        else
        {
          NSClassFromString(@"BKPictureBookViewController");
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(BKBookViewController *)self setLocation:0];
          }
        }
      }

      unsigned __int8 v12 = v63;
      id v6 = v64;
    }
    else
    {
      float v20 = BKMobileCloudSyncAnnotationsLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_137AB8();
      }
    }
  }
}

- (void)stopFetchingBookmarks
{
  [(NSFetchedResultsController *)self->_pageBookmarksFRC setDelegate:0];
  pageBookmarksFRC = self->_pageBookmarksFRC;
  self->_pageBookmarksFRC = 0;
}

- (void)controllerWillChangeContent:(id)a3
{
}

- (BOOL)shouldAcceptLocationUpdateFromGlobalAnnotation:(id)a3
{
  return 1;
}

- (void)_updateLocationFromAnnotation:(id)a3
{
  id v4 = a3;
  if (![(BKBookViewController *)self section])
  {
    id v5 = [(BKBookViewController *)self openingLocation];

    if (v5)
    {
      id v6 = BKMobileCloudSyncAnnotationsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v4 annotationLocation];
        id v8 = [(BKBookViewController *)self openingLocation];
        int v22 = 138412546;
        id v23 = v7;
        __int16 v24 = 2112;
        double v25 = v8;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Ignoring updated global location %@ because we have an openingLocation location: %@", (uint8_t *)&v22, 0x16u);
      }
      goto LABEL_21;
    }
    if ([(BKBookViewController *)self shouldAcceptLocationUpdateFromGlobalAnnotation:v4])
    {
      uint64_t v9 = [(BKBookViewController *)self savableLocation];
      unsigned __int8 v10 = [v4 isLocationSame:v9];

      if (v10)
      {
        id v6 = BKMobileCloudSyncAnnotationsLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v4 annotationLocation];
          int v22 = 138543362;
          id v23 = v11;
          unsigned __int8 v12 = "_updateLocationFromAnnotation Ignoring updated location because it is the same as the current savable lo"
                "cation %{public}@";
LABEL_14:
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v22, 0xCu);
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v14 = [v4 location];
        unsigned __int8 v15 = [(BKBookViewController *)self isLocationOnCurrentPage:v14];

        id v6 = BKMobileCloudSyncAnnotationsLog();
        BOOL v16 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        if ((v15 & 1) == 0)
        {
          if (v16)
          {
            id v17 = [v4 annotationLocation];
            int v22 = 138543362;
            id v23 = v17;
            _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "_updateLocationFromAnnotation Jumping to location from annotation location: %{public}@", (uint8_t *)&v22, 0xCu);
          }
          id v18 = _AEBookPluginsLifeCycleLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [(BKBookViewController *)self book];
            float v20 = [v19 assetLogID];
            uint64_t v21 = [v4 annotationLocation];
            int v22 = 138543618;
            id v23 = v20;
            __int16 v24 = 2114;
            double v25 = v21;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "_updateLocationFromAnnotation logID:%{public}@ Jumping to location from annotation location: %{public}@", (uint8_t *)&v22, 0x16u);
          }
          id v6 = [v4 location];
          [(BKBookViewController *)self recordedJumpToLocation:v6 animated:1 completion:0];
          goto LABEL_21;
        }
        if (v16)
        {
          id v11 = [v4 annotationLocation];
          int v22 = 138543362;
          id v23 = v11;
          unsigned __int8 v12 = "_updateLocationFromAnnotation Ignoring updated location because it is already visible %{public}@";
          goto LABEL_14;
        }
      }
    }
    else
    {
      id v6 = BKMobileCloudSyncAnnotationsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        long long v13 = [v4 annotationLocation];
        id v11 = [(BKBookViewController *)self savableLocation];
        int v22 = 138412546;
        id v23 = v13;
        __int16 v24 = 2112;
        double v25 = v11;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Ignoring updated global location %@ because we have a newer local location: %@", (uint8_t *)&v22, 0x16u);

LABEL_15:
      }
    }
LABEL_21:
  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  unsigned __int8 v12 = (NSFetchedResultsController *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (self->_pageBookmarksFRC == v12)
  {
    if (a6 == 1) {
      [(BKBookViewController *)self setAnnotationChangeRequiresPaginationUpdate:1];
    }
    id v16 = v13;
    unsigned int v17 = [v16 annotationType];
    if (v17 == 1)
    {
      id v18 = [v16 location];
      if (v18)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_5830C;
        v19[3] = &unk_1DABD8;
        v19[4] = self;
        [(BKBookViewController *)self isLocationOnVisiblePages:v18 completion:v19];
      }
      else
      {
        [(BKBookViewController *)self updateBookmarkButton:1];
      }
    }
    else if (v17 == 3)
    {
      [(BKBookViewController *)self _updateLocationFromAnnotation:v16];
    }
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  if ([(BKBookViewController *)self annotationChangeRequiresPaginationUpdate])
  {
    [(BKBookViewController *)self setAnnotationChangeRequiresPaginationUpdate:0];
    [(BKBookViewController *)self paginationUpdateRequired];
  }
  [(BKBookViewController *)self writeAnnotationsToWebProcessPlugin];

  [(BKBookViewController *)self _notifyBookmarkObservers];
}

- (void)scrubberTouchDown:(id)a3
{
  [(BKBookViewController *)self cancelPendingHidePageControls];
  int64_t v4 = [(BKBookViewController *)self currentPageNumber];

  [(BKBookViewController *)self setPageNumberBeforeScrubbing:v4];
}

- (void)scrub:(id)a3
{
  id v4 = [a3 pageNumber];
  [(BKBookViewController *)self turnToPageNumber:v4 animated:1];
  [(BKBookViewController *)self emitScrubEventStartPosition:[(BKBookViewController *)self pageNumberBeforeScrubbing] endPosition:v4 totalLength:[(BKBookViewController *)self pageCountIncludingUpsell]];

  [(BKBookViewController *)self setPageNumberBeforeScrubbing:0x7FFFFFFFFFFFFFFFLL];
}

- (BOOL)touchBarWantsHistoryNav
{
  NSUInteger v2 = [(BKBookViewController *)self book];
  char v3 = [v2 isFixedLayout] ^ 1;

  return v3;
}

- (BOOL)touchBarWantsScroller
{
  return 1;
}

- (BOOL)touchBarWantsSearch
{
  return 1;
}

- (BOOL)touchBarWantsReadAloud
{
  return ([(BKBookViewController *)self readAloudState] & 0x80000000) == 0
      || [(BKBookViewController *)self trackState] >= 0;
}

- (int64_t)pageNumberForTouchBarPosition:(double)a3
{
  uint64_t v5 = [(BKBookViewController *)self pageCountIncludingUpsell];
  int64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BKBookViewController *)self pagePositionForTouchBarPosition:a3];
    double v8 = fmax(v7 * (double)(v5 - 1) + 1.0, 1.0);
    if (v8 >= (double)v5) {
      return (uint64_t)(double)v5;
    }
    return (uint64_t)v8;
  }
  return result;
}

- (double)touchBarPositionForPageNumber:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1.0;
  }
  int64_t v5 = [(BKBookViewController *)self pageCountIncludingUpsell];
  if (!v5 || v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return -1.0;
  }
  double v7 = fmin(fmax((double)(a3 - 1) / (double)(v5 - 1), 0.0), 1.0);

  [(BKBookViewController *)self touchBarPositionForPagePosition:v7];
  return result;
}

- (double)pagePositionForTouchBarPosition:(double)a3
{
  unsigned int v4 = [(BKBookViewController *)self touchBarScrollerBookIsRightToLeft];
  double result = 1.0 - a3;
  if (!v4) {
    return a3;
  }
  return result;
}

- (void)touchBarHandleBackRequest:(id)a3
{
  [(BKBookViewController *)self dismissCurrentPopover];
  unsigned int v4 = [(BKBookViewController *)self navigationHistory];
  int64_t v5 = [v4 previousEntity];

  if (v5)
  {
    [(BKBookViewController *)self jumpBackAnimated:1];
  }
}

- (void)touchBarHandleForwardRequest:(id)a3
{
  [(BKBookViewController *)self dismissCurrentPopover];
  unsigned int v4 = [(BKBookViewController *)self navigationHistory];
  int64_t v5 = [v4 nextEntity];

  if (v5)
  {
    [(BKBookViewController *)self jumpAheadAnimated:1];
  }
}

- (void)touchBarHandleSearchRequest:(id)a3
{
}

- (void)touchBarHandleReadAloudRequest:(id)a3
{
  if ([(BKBookViewController *)self isReadAloudPaused])
  {
    [(BKBookViewController *)self resumeReadAloud];
  }
  else
  {
    BOOL v4 = !self->_isReading;
    [(BKBookViewController *)self setReadAloudState:v4];
  }
}

- (void)touchBarScrollerDidEnd:(double)a3 completion:(id)a4
{
  id v6 = (void (**)(double))a4;
  [(BKBookViewController *)self turnToPageNumber:[(BKBookViewController *)self pageNumberForTouchBarPosition:a3] animated:1];
  v6[2](a3);
}

- (void)touchBarScrollerDidIdle:(double)a3
{
  int64_t v4 = [(BKBookViewController *)self pageNumberForTouchBarPosition:a3];

  [(BKBookViewController *)self turnToPageNumber:v4 animated:1];
}

- (void)touchBarScrollerJumpToBookmark:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BUDynamicCast();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  int64_t v5 = v7;
  if (v7)
  {
    id v6 = [v7 location];
    [(BKBookViewController *)self recordedJumpToLocation:v6 animated:1 completion:&stru_1DBFA0];

    int64_t v5 = v7;
  }
}

- (id)touchBarScrollerChapters
{
  NSUInteger v2 = [(BKBookViewController *)self book];
  char v3 = [v2 chapters];
  id v4 = [v3 allObjects];

  return v4;
}

- (double)touchBarScrollerPositionForChapter:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int64_t v5 = BUDynamicCast();

  if (v5)
  {
    id v6 = [(BKBookViewController *)self _locationForChapter:v5];
    id v7 = [(BKBookViewController *)self paginationController];
    uint64_t v8 = (uint64_t)[v7 pageNumberForLocation:v6];
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(BKBookViewController *)self touchBarPositionForPageNumber:v8];
  double v10 = v9;

  return v10;
}

- (double)touchBarScrollerPositionForBookmark:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int64_t v5 = BUDynamicCast();

  if (v5)
  {
    id v6 = [(BKBookViewController *)self paginationController];
    id v7 = [v6 pageRangeForAnnotation:v5];
    uint64_t v9 = v8;

    int64_t v10 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v9);
  }
  else
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(BKBookViewController *)self touchBarPositionForPageNumber:v10];
  double v12 = v11;

  return v12;
}

- (double)touchBarScrollerEndScrollPositionForPosition:(double)a3
{
  int64_t v4 = [(BKBookViewController *)self pageNumberForTouchBarPosition:a3];

  [(BKBookViewController *)self touchBarPositionForPageNumber:v4];
  return result;
}

- (id)touchBarScrollerAccessibilityLabelForChapter:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int64_t v4 = BUDynamicCast();

  if (v4)
  {
    int64_t v5 = AEBundle();
    id v6 = [v5 localizedStringForKey:@"Chapter %1$lu, %2$@", &stru_1DF0D8, 0 value table];
    id v7 = [v4 absoluteOrder];
    uint64_t v8 = (char *)[v7 integerValue] + 1;
    uint64_t v9 = [v4 name];
    int64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8, v9);
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)touchBarScrollerAccessibilityLabelForBookmark:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  int64_t v4 = BUDynamicCast();

  int64_t v5 = [v4 accessibilityLabel];

  return v5;
}

- (id)touchBarScrollerAccessibilityLabelForCurrentScrollPosition
{
  return 0;
}

- (void)registerBookmarkObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookViewController *)self bookmarkObservers];
  [v5 addObject:v4];
}

- (void)unregisterBookmarkObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookViewController *)self bookmarkObservers];
  [v5 removeObject:v4];
}

- (unint64_t)numberOfBookmarks
{
  NSUInteger v2 = [(BKBookViewController *)self allBookmarkIdentifiers];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (id)allBookmarkIdentifiers
{
  return [(BKBookViewController *)self _allAnnotationsForType:1];
}

- (void)_notifyBookmarkObservers
{
  [(BKBookViewController *)self updateTouchBarController];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = self->_bookmarkObservers;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) bookmarksUpdated:v8];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)contentViewControllerAnnotationCacheDidChange:(id)a3
{
  [(BKBookViewController *)self writeAnnotationsToWebProcessPlugin];

  [(BKBookViewController *)self _notifyBookmarkObservers];
}

- (id)protocolCacheItemForAEBookInfo:(id)a3
{
  return [a3 cacheItem];
}

- (void)contentViewController:(id)a3 setEndOfBookToLocation:(id)a4 range:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  BUDynamicCast();
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v14 cfiString];
  if ([v7 length])
  {
    long long v8 = [(BKBookViewController *)self book];
    [v8 setEndOfBookLocation:v7];

    long long v9 = [(BKBookViewController *)self book];
    [v9 setEndOfBookValidRange:0];

    if ([(NSManagedObjectContext *)self->_bookMoc hasChanges]) {
      [(NSManagedObjectContext *)self->_bookMoc save:0];
    }
    long long v10 = [(BKBookViewController *)self experienceManager];

    if (v10)
    {
      long long v11 = [(BKBookViewController *)self _createEndOfBookExperience];
      if (v11)
      {
        double v12 = [(BKBookViewController *)self experienceManager];
        [v12 removeExperienceOfType:0];

        id v13 = [(BKBookViewController *)self experienceManager];
        [v13 addExperience:v11];
      }
    }
  }
}

- (void)contentViewController:(id)a3 goToLocation:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(BKBookViewController *)self recordedJumpToLocation:v5 animated:1 completion:0];
  }
  else
  {
    [(BKBookViewController *)self saveReadingLocation:v5];
    [(BKBookViewController *)self turnToInitialPage:1];
  }
}

- (void)mediaPlaybackStarted:(id)a3
{
  id v4 = +[BCAudioMuxingCoordinator sharedInstance];
  [v4 notifyPlaybackWillStart:self];
}

- (id)directorySwitcher
{
  return 0;
}

- (void)setFinishedForAssetID:(id)a3
{
  id v5 = a3;
  id v4 = [(BKBookViewController *)self assetViewControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 setFinishedForAssetID:v5];
  }
}

- (void)contentViewController:(id)a3 setFinishedAndCloseForAssetID:(id)a4
{
  id v6 = a4;
  id v5 = [(BKBookViewController *)self assetViewControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 assetViewController:self setFinishedAndCloseForAssetID:v6];
  }
}

- (BOOL)isTOCURL:(id)a3
{
  id v4 = [a3 bc_pathWithoutPrecedingSlash];
  id v5 = [v4 stringByRemovingURLFragment];
  id v6 = [(BKBookViewController *)self book];
  id v7 = [v6 tocPageHref];
  unsigned __int8 v8 = [v5 isEqual:v7];

  return v8;
}

- (id)documentForURL:(id)a3
{
  id v4 = [a3 bc_pathWithoutPrecedingSlash];
  id v5 = [v4 stringByRemovingURLFragment];
  id v6 = [(BKBookViewController *)self book];
  id v7 = [v6 documentAtPath:v5];

  return v7;
}

- (void)contentViewController:(id)a3 goToURL:(id)a4 likelyUserInitiated:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a4;
  if (-[BKBookViewController isTOCURL:](self, "isTOCURL:"))
  {
    [(BKBookViewController *)self showTOC:self];
    goto LABEL_9;
  }
  id v7 = [(BKBookViewController *)self documentForURL:v12];
  if (v7)
  {
    unsigned __int8 v8 = [v12 bc_pathWithoutPrecedingSlash];
    long long v9 = [v8 stringByRemovingURLFragment];
    long long v10 = [v12 fragment];
    [(BKBookViewController *)self goToPath:v9 fragment:v10 animated:+[UIView areAnimationsEnabled]];

LABEL_7:
    goto LABEL_8;
  }
  long long v11 = [(BKBookViewController *)self assetViewControllerDelegate];

  if (v11)
  {
    unsigned __int8 v8 = [(BKBookViewController *)self assetViewControllerDelegate];
    [v8 assetViewController:self requestOpenURL:v12 likelyUserInitiated:v5];
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
}

- (void)contentViewReady:(id)a3
{
  id v4 = a3;
  [(BKBookViewController *)self readAloudViewControllerReady:v4];
  [(BKBookViewController *)self signalBookContentDidLoad:v4];
  [v4 resume];
}

- (void)readAloudViewControllerReady:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (self->_isReading)
  {
    [(BKBookViewController *)self _markupDocumentElementForMediaOverlay:v4];
    [(BKBookViewController *)self _installClickHandlers:v16];
    id v4 = v16;
  }
  else if (!self->_isPlayingSoundTrack)
  {
    goto LABEL_14;
  }
  loadedPages = self->_loadedPages;
  if (!loadedPages)
  {
    id v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    id v7 = self->_loadedPages;
    self->_loadedPages = v6;

    id v4 = v16;
    loadedPages = self->_loadedPages;
  }
  unsigned __int8 v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 ordinal]);
  [(NSMutableArray *)loadedPages addObject:v8];

  long long v9 = (char *)[(BKBookViewController *)self currentPages];
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = v9 - 1;
    while (1)
    {
      id v13 = +[NSNumber numberWithInteger:v12];
      if (([(NSMutableArray *)self->_loadedPages containsObject:v13] & 1) == 0)
      {
        id v14 = [v13 unsignedIntegerValue];
        if (v14 != (id)[(BKBookViewController *)self upsellOrdinal]) {
          break;
        }
      }

      ++v12;
      if (!--v11) {
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    id v15 = self->_loadedPages;
    self->_loadedPages = 0;

    [(BKBookViewController *)self continueReadAloudAfterReady];
  }
  id v4 = v16;
LABEL_14:
}

- (void)continueReadAloudAfterReady
{
  if (self->_isReading && ![(BKBookViewController *)self section])
  {
    id v3 = [(BKBookViewController *)self currentPages];
    -[BKBookViewController readPages:from:to:waitOnEmpty:](self, "readPages:from:to:waitOnEmpty:", v3, v4, [(BKBookViewController *)self _itemIndexForCurrentPage], -1, 1);
  }
  if (self->_isPlayingSoundTrack)
  {
    [(BKBookViewController *)self playCurrentSoundtrack];
  }
}

- (void)signalBookContentDidLoad:(id)a3
{
  id v4 = a3;
  BOOL v5 = _AEBookOpenLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BKBookViewController *)self contentOpenAnimator];
    int v8 = 138412546;
    long long v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "SignalBookContentDidLoad - animator: %@ content: %@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(BKBookViewController *)self contentOpenAnimator];
  [v7 bookContentDidLoad];

  [(BKBookViewController *)self setContentOpenAnimator:0];
}

- (void)contentViewController:(id)a3 showNoteForAnnotation:(id)a4
{
}

- (void)contentViewController:(id)a3 showAlertController:(id)a4 fromRect:(CGRect)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v26 = a3;
  id v13 = a4;
  if (![v13 preferredStyle])
  {
    id v14 = [(BKBookViewController *)self view];
    id v15 = [v26 view];
    [v14 convertRect:v15 fromView:x, y, width, height];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    __int16 v24 = [v13 popoverPresentationController];
    [v24 setPermittedArrowDirections:15];
    double v25 = [(BKBookViewController *)self view];
    [v24 setSourceView:v25];

    [v24 setSourceRect:v17, v19, v21, v23];
  }
  [(BKBookViewController *)self presentViewController:v13 animated:v6 completion:0];
}

- (void)contentViewController:(id)a3 stopMediaPlay:(id)a4
{
  id v5 = a4;
  id v12 = 0;
  id v13 = 0;
  unsigned int v6 = [(BKBookViewController *)self _currentChapterInfo:&v13 uniqueID:&v12];
  id v7 = v13;
  id v8 = v12;
  if (v6)
  {
    long long v9 = +[BCProgressKitController sharedController];
    __int16 v10 = [(BKBookViewController *)self book];
    id v11 = [v10 assetID];
    [v9 updateMediaForBook:v11 chapter:v8 mediaCFI:v5 progress:&off_1E9718 completion:0];
  }
}

- (void)contentViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
}

- (void)contentViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v10 = a4;
  id v8 = [(BKBookViewController *)self book];
  long long v9 = [v8 bookTitle];
  [v10 setTitle:v9];

  [(BKBookViewController *)self presentViewController:v10 animated:+[UIView areAnimationsEnabled] completion:v7];
}

- (void)contentViewController:(id)a3 showLookupForString:(id)a4 fromView:(id)a5 onClose:(id)a6
{
}

- (void)contentViewController:(id)a3 showTranslateForText:(id)a4 fromView:(id)a5 onClose:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_59BA8;
  v11[3] = &unk_1DB878;
  id v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v8 = v14;
  id v9 = v15;
  id v10 = v13;
  [(BKBookViewController *)v12 dismissCurrentPopoverWithCompletion:v11 animated:0];
}

- (void)contentViewController:(id)a3 searchForString:(id)a4
{
}

- (void)contentViewController:(id)a3 setSearchString:(id)a4
{
  id v5 = [(BKBookViewController *)self searchModuleWithSearchString:a4];
  id v4 = [v5 searchController];
  [v4 cancelSearch];
}

- (void)resumeReadAloudForContentViewController:(id)a3
{
}

- (void)preloadContentViewController:(id)a3 highPriority:(BOOL)a4
{
}

- (id)contentViewController:(id)a3 fullScreenNoteEditorForAnnotation:(id)a4
{
  return [(BKBookViewController *)self fullScreenNoteEditorForAnnotation:a4];
}

- (void)contentViewController:(id)a3 setTurnState:(BOOL)a4
{
}

- (void)contentViewController:(id)a3 setReadAloudState:(BOOL)a4
{
}

- (void)contentViewController:(id)a3 expandAnnotation:(id)a4 location:(id)a5 selectedText:(id)a6 representativeText:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  -[BKBookViewController _emitAnnotationActionEventIfNeededForAnnotationType:](self, "_emitAnnotationActionEventIfNeededForAnnotationType:", [v14 annotationType]);
  [(BKBookViewController *)self expandAnnotation:v14 location:v13 selectedText:v12 representativeText:v11];
}

- (id)contentViewController:(id)a3 addAnnotation:(int)a4 location:(id)a5 selectedText:(id)a6 representativeText:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  [(BKBookViewController *)self _emitAnnotationActionEventIfNeededForAnnotationType:v9];
  id v14 = [(BKBookViewController *)self addAnnotation:v9 location:v13 selectedText:v12 representativeText:v11];

  return v14;
}

- (void)_emitAnnotationActionEventIfNeededForAnnotationType:(int)a3
{
  if (a3 == 2)
  {
    id v8 = [objc_alloc((Class)BAViewData) initWithType:4 action:5 location:2];
    id v5 = +[BAEventReporter sharedReporter];
    unsigned int v6 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
    id v7 = [(BKBookViewController *)self contentDataForSearchViewController:0];
    [v5 emitAnnotationActionEventWithTracker:v6 contentData:v7 viewData:v8];
  }
}

- (BOOL)turnPages:(int64_t)a3 animated:(BOOL)a4
{
  return 0;
}

- (void)showSearchFromToolbar:(id)a3
{
}

- (id)_searchQueryFromSender:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = BUDynamicCast();
  if (!v4)
  {
    id v5 = BUProtocolCast();
    id v4 = [v5 appIntentsSearchQuery];
  }

  return v4;
}

- (BCAppIntentsAssetViewControllerInfo)appIntentsInfo
{
  id v3 = objc_opt_new();
  [v3 setSupportsTheming:0];
  id v4 = [(BKBookViewController *)self asset];
  id v5 = [v4 assetID];
  [v3 setAssetID:v5];

  return (BCAppIntentsAssetViewControllerInfo *)v3;
}

- (void)didChangeCurrentOverlayViewController
{
  v3.receiver = self;
  v3.super_class = (Class)BKBookViewController;
  [(BKViewController *)&v3 didChangeCurrentOverlayViewController];
  [(BKBookViewController *)self notifyAppIntentsInfoChanged];
}

- (void)notifyAppIntentsInfoChanged
{
}

- (int64_t)bookToolbarTransparency
{
  return 2;
}

- (int64_t)bookToolbarMode
{
  if (![(BKBookViewController *)self safeToShowToolbarItems]) {
    return 7;
  }
  objc_super v3 = [(BKBookViewController *)self expandedContentViewController];
  unsigned __int8 v4 = [v3 isVisible];

  if (v4) {
    return 3;
  }
  if ([(BKBookViewController *)self section]) {
    return 0;
  }
  return 9;
}

- (BOOL)isBookToolbarAppearanceDark
{
  objc_super v3 = [(BKBookViewController *)self themePage];
  unsigned __int8 v4 = (char *)[v3 userInterfaceStyle];

  if (!v4)
  {
    id v5 = [(BKBookViewController *)self viewIfLoaded];
    unsigned int v6 = [v5 window];

    id v7 = [v6 traitCollection];
    unsigned __int8 v4 = (char *)[v7 userInterfaceStyle];
  }
  return v4 == (unsigned char *)&dword_0 + 2;
}

- (id)bookToolbarThemeID
{
  NSUInteger v2 = [(BKBookViewController *)self theme];
  objc_super v3 = [v2 themeIdentifier];

  return v3;
}

- (BOOL)shouldDisplayTitleWhenActive
{
  return 1;
}

- (BOOL)shouldDisplayTitleWhenInactive
{
  return 1;
}

- (BOOL)shouldDisplayReadaloudControls
{
  return 0;
}

- (BOOL)shouldDisplaySearchControls
{
  return 1;
}

- (BOOL)shouldDisplayShareControls
{
  NSUInteger v2 = [(BKBookViewController *)self book];
  unsigned __int8 v3 = [v2 isStoreBook];

  return v3;
}

- (BOOL)shouldDisplaySettingsControls
{
  return 0;
}

- (BOOL)shouldDisplayBuyButton
{
  NSUInteger v2 = [(BKBookViewController *)self book];
  unsigned __int8 v3 = [v2 sampleContent];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldGroupModeControls
{
  return 1;
}

- (BOOL)shouldDisplayContentsButton
{
  return 0;
}

- (BOOL)shouldDisplayPageThumbnailsButton
{
  return 0;
}

- (BOOL)shouldDisplayBookmarksButton
{
  return 0;
}

- (BOOL)shouldDisplayGlossaryButton
{
  return 0;
}

- (BOOL)shouldDisplayHighlightsButton
{
  return 0;
}

- (BOOL)shouldDisplayStudyCardsButton
{
  return 0;
}

- (BOOL)usePrimarySidebar
{
  return 0;
}

- (BOOL)autoHidesToolbarInFullscreen
{
  return 1;
}

- (BOOL)wantsToolbarVisible
{
  return 0;
}

- (id)bookToolbarTitle
{
  return 0;
}

- (id)bookToolbarShareURL
{
  return 0;
}

- (id)bookToolbarCurrentPageString
{
  return 0;
}

- (BOOL)shouldDisplayBookmarkMenu
{
  return 0;
}

- (id)itemProvidersForSharing
{
  NSUInteger v2 = [(BKBookViewController *)self storeShortURL];
  if (v2 && (id v3 = [objc_alloc((Class)NSItemProvider) initWithContentsOfURL:v2]) != 0)
  {
    unsigned __int8 v4 = v3;
    id v7 = v3;
    id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)canTurnPagesAutomaticallyWhileReadingAloudForToolbar:(id)a3
{
  return [(BKBookViewController *)self canTurnPagesAutomatically];
}

- (BOOL)isSoundtrackPlayingForToolbar:(id)a3
{
  return [(BKBookViewController *)self isSoundtrackPlaying];
}

- (id)titleMutedColor
{
  NSUInteger v2 = [(BKBookViewController *)self theme];
  id v3 = [v2 headerTextColorDimmed];

  return v3;
}

- (id)titleColor
{
  NSUInteger v2 = [(BKBookViewController *)self theme];
  id v3 = [v2 toolbarTitleColor];

  return v3;
}

- (id)chapterColor
{
  NSUInteger v2 = [(BKBookViewController *)self theme];
  id v3 = [v2 headerTextColorDimmed];

  return v3;
}

- (id)tintColorForNavbarButtons
{
  NSUInteger v2 = [(BKBookViewController *)self theme];
  id v3 = [v2 tintColorForNavbarButtons];

  return v3;
}

- (id)buttonColor
{
  NSUInteger v2 = [(BKBookViewController *)self themePage];
  id v3 = [v2 buttonColor];

  return v3;
}

- (id)buttonTitleColor
{
  return +[UIColor whiteColor];
}

- (id)profileFuture
{
  id v3 = [(BKBookViewController *)self assetViewControllerDelegate];
  unsigned __int8 v4 = [v3 assetViewControllerProductProfileProtocol:self];

  return v4;
}

- (BOOL)isPreordered
{
  NSUInteger v2 = [(BKBookViewController *)self book];
  id v3 = [v2 isPreorder];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (id)bookmarkToolTip
{
  NSUInteger v2 = AEBundle();
  id v3 = [v2 localizedStringForKey:@"Show Bookmarks" value:&stru_1DF0D8 table:0];

  return v3;
}

- (id)tocToolTip
{
  NSUInteger v2 = AEBundle();
  id v3 = [v2 localizedStringForKey:@"Show the table of contents" value:&stru_1DF0D8 table:0];

  return v3;
}

- (void)popoverDidClose:(id)a3 fromToolbar:(id)a4
{
  uint64_t v9 = (IMViewController *)a3;
  id v5 = [(BKBookViewController *)self brightnessController];

  if (v5 == v9
    || ([(BKBookViewController *)self audioController],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        [v6 navigationController],
        id v7 = (IMViewController *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        id v8 = v9,
        v7 == v9))
  {
    [(BKBookViewController *)self cleanupPopovers];
  }
  else
  {
    if (self->_appearanceContainerViewController != v9) {
      goto LABEL_7;
    }
    [(BKBookViewController *)self handleAppearanceViewControllerDismissal];
  }
  id v8 = v9;
LABEL_7:
}

- (void)showOverlayViewController:(id)a3 fromView:(id)a4 popoverOnPhone:(BOOL)a5 popoverBackgroundColor:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [(BKBookViewController *)self cancelPendingHidePageControls];
  [(BKViewController *)self showOverlayViewController:v12 fromItem:v11 popoverOnPhone:v6 passthroughViews:&__NSArray0__struct popoverBackgroundColor:v10];
}

- (void)setExpandedContentViewController:(id)a3
{
  id v5 = (BKExpandedContentViewController *)a3;
  expandedContentViewController = self->_expandedContentViewController;
  if (expandedContentViewController != v5)
  {
    id v8 = v5;
    id v7 = [(BKExpandedContentViewController *)expandedContentViewController delegate];

    if (v7 == self) {
      [(BKExpandedContentViewController *)self->_expandedContentViewController setDelegate:0];
    }
    objc_storeStrong((id *)&self->_expandedContentViewController, a3);
    expandedContentViewController = (BKExpandedContentViewController *)[(BKBookViewController *)self updateToolbarController];
    id v5 = v8;
  }

  _objc_release_x1(expandedContentViewController, v5);
}

- (void)contentViewController:(id)a3 showExpandedContentForResource:(id)a4 atLocation:(id)a5
{
}

- (void)showExpandedContentForResource:(id)a3 atLocation:(id)a4 completion:(id)a5
{
}

- (void)_showExpandedContentForResource:(id)a3 atLocation:(id)a4 presentingFromTOC:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(BKBookViewController *)self expandedContentViewController];
  [v13 close:0];

  if (!v7)
  {
    id v14 = [(BKBookViewController *)self currentLocation];
    [(BKBookViewController *)self setResumeLocation:v14];
  }
  id v15 = [v10 sourceURL];
  int v16 = BEDoesURLPointToUSDZFile();

  if (v16)
  {
    double v17 = objc_alloc_init(BKARQuicklookViewController);
    double v18 = [v10 sourceURL];
    [(BKARQuicklookViewController *)v17 setARModelDataURL:v18];

    [(BKARQuicklookViewController *)v17 setDataSource:v17];
    [(BKBookViewController *)self presentViewController:v17 animated:1 completion:0];
  }
  else
  {
    double v19 = +[BKExpandedContentViewController expandedContentControllerForResource:v10];
    double v20 = [(BKBookViewController *)self theme];
    [v19 setTheme:v20];

    [v19 setDelegate:self];
    objc_opt_class();
    double v21 = BUDynamicCast();
    if (v21)
    {
      double v22 = [(BKBookViewController *)self book];
      [v21 setAllowsRemoteInspection:[v22 shouldAllowRemoteInspection]];
    }
    [(BKBookViewController *)self setExpandedContentViewController:v19];
    [v19 setPresentingFromTOC:v7];
    objc_initWeak(&location, self);
    BOOL v23 = +[UIView areAnimationsEnabled];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_5ACFC;
    v24[3] = &unk_1DBFC8;
    objc_copyWeak(&v26, &location);
    id v25 = v12;
    [(BKBookViewController *)self presentViewController:v19 animated:v23 completion:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

- (CGRect)frameForLocation:(id)a3 inView:(id)a4 expandedContentViewController:(id)a5
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)expandedContentViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  if (self->_expandedContentViewController == a3)
  {
    -[BKBookViewController _promptToLoadExternalContent:](self, "_promptToLoadExternalContent:", a5, a4);
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (void)expandedContentViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  if (self->_expandedContentViewController == a3)
  {
    [(BKBookViewController *)self _handleExternalLoadRequest:a4 likelyUserInitiated:a5];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (BOOL)expandedContentViewController:(id)a3 handleInternalLoadRequest:(id)a4
{
  if (self->_expandedContentViewController == a3)
  {
    return -[BKBookViewController _controller:handleInternalRequestForURL:](self, "_controller:handleInternalRequestForURL:");
  }
  else
  {
    BCReportAssertionFailureWithMessage();
    return 0;
  }
}

- (void)expandedContentViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
  if (self->_expandedContentViewController == a3)
  {
    -[BKBookViewController _controller:handleInternalRequestForURL:](self, "_controller:handleInternalRequestForURL:");
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (void)expandedContentViewDidDisappear:(id)a3
{
  id v5 = (BKExpandedContentViewController *)a3;
  if (self->_expandedContentViewController == v5)
  {
    unsigned __int8 v4 = [(BKBookViewController *)self searchResult];
    [(BKBookViewController *)self clearSelection];
    [(BKBookViewController *)self setExpandedContentViewController:0];
    if (![(BKExpandedContentViewController *)v5 presentingFromTOC]) {
      [(BKBookViewController *)self setResumeLocation:0];
    }
    if (v4) {
      [(BKBookViewController *)self highlightSearchResult:v4];
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (BOOL)expandedContentView:(id)a3 shouldStartLoadWithRequest:(id)a4
{
  BOOL v6 = (BKExpandedContentViewController *)a3;
  if (self->_expandedContentViewController != v6)
  {
    BCReportAssertionFailureWithMessage();
    LOBYTE(self) = 0;
    goto LABEL_14;
  }
  BOOL v7 = [a4 URL];
  if (BEURLHandlerSchemeIsOkForBookToLoad())
  {
    id v8 = [v7 bc_pathWithoutPrecedingSlash];
    uint64_t v9 = [v8 stringByRemovingURLFragment];
    id v10 = [(BKBookViewController *)self book];
    id v11 = [v10 documentAtPath:v9];

    id v12 = [v11 documentOrdinal];
    if ([v12 integerValue] == (id)-1)
    {
      LOBYTE(self) = 1;
    }
    else
    {
      id v13 = [v11 nonlinearElement];
      unsigned __int8 v14 = [v13 BOOLValue];

      if (v14)
      {
        LOBYTE(self) = 1;
LABEL_12:

        goto LABEL_13;
      }
      if (v8)
      {
        id v12 = [v7 fragment];
        [(BKExpandedContentViewController *)v6 close:1];
        [(BKBookViewController *)self goToPath:v8 fragment:v12 animated:1];
        LOBYTE(self) = 0;
      }
      else
      {
        id v12 = [(BKBookViewController *)self assetViewControllerDelegate];
        LODWORD(self) = [v12 assetViewController:self requestOpenURL:v7 likelyUserInitiated:0] ^ 1;
      }
    }

    goto LABEL_12;
  }
  id v8 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v8 assetViewController:self requestOpenURL:v7 likelyUserInitiated:0];
  LOBYTE(self) = 0;
LABEL_13:

LABEL_14:
  return (char)self;
}

- (void)expandedContentViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  if (self->_expandedContentViewController == a3)
  {
    uint64_t v9 = [(BKBookViewController *)self book];
    id v10 = [v9 bookTitle];
    [v11 setTitle:v10];

    [(BKBookViewController *)self presentViewController:v11 animated:+[UIView areAnimationsEnabled] completion:v8];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (BKNavigationHistory)navigationHistory
{
  if (!self->_navigationHistory)
  {
    id v3 = [(BKBookViewController *)self book];
    unsigned int v4 = [v3 wantsJumpBackHistory];

    if (v4)
    {
      id v5 = objc_alloc_init(BKNavigationHistory);
      navigationHistordouble y = self->_navigationHistory;
      self->_navigationHistordouble y = v5;
    }
  }
  BOOL v7 = self->_navigationHistory;

  return v7;
}

- (void)fixupNavigationHistoryForUpsellPageNumber:(int64_t)a3
{
  unint64_t v5 = [(BKBookViewController *)self upsellOrdinal];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = (id)v5;
    BOOL v7 = [(BKBookViewController *)self paginationController];
    id v8 = [v7 currentLookupKey];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = [(BKBookViewController *)self navigationHistory];
    id v10 = [v9 allObjects];

    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          int v16 = [v15 location];
          id v17 = [v16 ordinal];

          if (v17 == v6) {
            [v15 setPage:a3 forLookupKey:v8];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (void)setPaginationController:(id)a3
{
  unint64_t v5 = (BKPaginationController *)a3;
  p_paginationController = &self->_paginationController;
  paginationController = self->_paginationController;
  id v11 = v5;
  if (paginationController != v5)
  {
    if (paginationController)
    {
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 removeObserver:self name:BKPaginationDataLoadedNotification object:*p_paginationController];

      uint64_t v9 = *p_paginationController;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(BKPaginationController *)v9 removeObserver:self forKeyPath:@"progress"];
    [(BKPaginationController *)*p_paginationController quit];
    objc_storeStrong((id *)&self->_paginationController, a3);
    [(BKPaginationController *)*p_paginationController addObserver:self forKeyPath:@"progress" options:4 context:0];
    [(BKSearchViewController *)self->_searchViewController setPaginationController:*p_paginationController];
    if (*p_paginationController)
    {
      [(BKBookViewController *)self updatePageCount];
      id v10 = +[NSNotificationCenter defaultCenter];
      [v10 addObserver:self selector:"paginationCompleted" name:BKPaginationDataLoadedNotification object:*p_paginationController];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"progress"])
  {
    [(BKPaginationController *)self->_paginationController progress];
    -[BKBookViewController updatePaginationProgress:](self, "updatePaginationProgress:");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BKBookViewController;
    [(BKBookViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (BOOL)needTextNodeCharacterCountsForOrdinal:(int64_t)a3
{
  unsigned int v4 = [(BKBookViewController *)self assetViewControllerDelegate];
  LOBYTE(a3) = [v4 needTextNodeCharacterCountsForOrdinal:a3];

  return a3;
}

- (void)addTextNodeCharacterCounts:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v10 addTextNodeCharacterCounts:v9 ordinal:a4 completion:v8];
}

- (BOOL)needTOCEntriesForOrdinal:(int64_t)a3
{
  unsigned int v4 = [(BKBookViewController *)self assetViewControllerDelegate];
  LOBYTE(a3) = [v4 needTOCEntriesForOrdinal:a3];

  return a3;
}

- (void)addTOCEntries:(id)a3 ordinal:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v10 addTOCEntries:v9 ordinal:a4 completion:v8];
}

- (id)environmentOverrideViewForPaginationController:(id)a3
{
  return [(BKBookViewController *)self environmentOverrideView];
}

- (unint64_t)searchStringLengthLimit
{
  return BKBookSearchStringLengthLimit;
}

- (id)searchViewController
{
  searchViewController = self->_searchViewController;
  if (!searchViewController)
  {
    unsigned int v4 = objc_alloc_init(BKSearchViewController);
    unint64_t v5 = self->_searchViewController;
    self->_searchViewController = v4;

    id v6 = [(BKBookViewController *)self theme];
    [(BKSearchViewController *)self->_searchViewController setTheme:v6];

    [(BKSearchViewController *)self->_searchViewController setSearchDelegate:self];
    [(BKSearchViewController *)self->_searchViewController setPaginationController:self->_paginationController];
    searchViewController = self->_searchViewController;
  }

  return searchViewController;
}

- (id)searchViewControllerIfLoaded
{
  return self->_searchViewController;
}

- (void)showSearchWithString:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKBookViewController *)self searchModuleWithSearchString:v6];
  [(BKBookViewController *)self cancelPendingHidePageControls];
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_5BA4C;
  v9[3] = &unk_1DB6B0;
  objc_copyWeak(&v10, &location);
  v9[4] = v8;
  [(BKBookViewController *)self setControlsVisible:1 animated:1 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)showSearch:(id)a3
{
}

- (BOOL)shouldForceJumpOnSearch
{
  return 0;
}

- (id)environmentOverrideView
{
  NSUInteger v2 = [(BKBookViewController *)self viewIfLoaded];
  id v3 = [v2 window];

  if (!v3)
  {
    unsigned int v4 = +[UIViewController bc_presentingViewController];
    uint64_t v5 = [v4 view];

    NSUInteger v2 = (void *)v5;
  }

  return v2;
}

- (id)searchModuleWithSearchString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BKBookViewController *)self searchStringLengthLimit];
  if ((unint64_t)[v4 length] > v5)
  {
    uint64_t v6 = [v4 substringToIndex:v5];

    id v4 = (id)v6;
  }
  id v7 = [(BKBookViewController *)self searchViewController];
  id v8 = [(BKBookViewController *)self book];
  id v9 = [v7 searchController];
  [v9 setSearchBook:v8];

  [v7 setSearchString:v4];

  return v7;
}

- (void)revealSearchResult:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 location];
    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5BD64;
    v10[3] = &unk_1DC018;
    objc_copyWeak(&v13, &location);
    id v9 = v8;
    id v11 = v9;
    BOOL v14 = a4;
    id v12 = v7;
    [(BKBookViewController *)self isLocationVisible:v9 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)searchViewController:(id)a3 revealSearchResult:(id)a4 animated:(BOOL)a5
{
  [(BKBookViewController *)self revealSearchResult:a4 animated:a5];

  [(BKBookViewController *)self _dismissSearchViewController];
}

- (void)searchViewController:(id)a3 turnToPageNumber:(int64_t)a4 animated:(BOOL)a5
{
  [(BKBookViewController *)self turnToPageNumber:a4 animated:a5];

  [(BKBookViewController *)self _dismissSearchViewController];
}

- (void)searchViewController:(id)a3 turnToLocation:(id)a4 animated:(BOOL)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5C1B0;
  v5[3] = &unk_1DAB88;
  v5[4] = self;
  [(BKBookViewController *)self recordedJumpToLocation:a4 animated:a5 completion:v5];
}

- (void)_dismissSearchViewController
{
}

- (int64_t)searchViewController:(id)a3 pageNumberForDocumentOrdinal:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 paginationController];

  if (v6)
  {
    id v7 = [v5 paginationController];
    int64_t v8 = (int64_t)[v7 pageNumberForDocumentOrdinal:a4];
  }
  else
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)searchViewController:(id)a3 chapterNameForSearchResult:(id)a4 pageNumber:(int64_t)a5
{
  if (a5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v7 = [a3 paginationController];
    id v5 = [v7 titleForChapterAtPageNumber:a5];
  }

  return v5;
}

- (void)emitReadingOrientationChangeEventIfNeeded
{
  id v3 = +[UIDevice currentDevice];
  if ((char *)[v3 orientation] - 3 >= (unsigned char *)&dword_0 + 2) {
    id v4 = &dword_0 + 1;
  }
  else {
    id v4 = &dword_0 + 2;
  }

  if ((void *)[(BKBookViewController *)self lastAnalyticsDeviceOrientationReported] != v4)
  {
    id v5 = +[BAEventReporter sharedReporter];
    id v6 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
    id v7 = [(BKBookViewController *)self readingSessionDataForSearchViewController:0];
    int64_t v8 = [(BKBookViewController *)self contentDataForSearchViewController:0];
    [v5 emitReadingOrientationChangeEventWithTracker:v6 readingSessionData:v7 contentData:v8];

    [(BKBookViewController *)self setLastAnalyticsDeviceOrientationReported:v4];
  }
}

- (id)readingSessionDataForSearchViewController:(id)a3
{
  id v4 = [(BKBookViewController *)self _currentReadingProgress];
  id v5 = [(BKBookViewController *)self book];
  id v6 = [v5 sampleContent];
  id v7 = [v6 BOOLValue];

  id v8 = objc_alloc((Class)BAReadingSessionData);
  id v9 = [(BKBookViewController *)self analyticsReadStartProgress];
  id v10 = +[NSNumber numberWithBool:v7];
  id v11 = [v8 initWithPercentCompletionStart:v9 percentCompletionEnd:v4 isFreeSample:v10 deviceOrientation:[self lastAnalyticsDeviceOrientationReported]];

  return v11;
}

- (id)contentDataForSearchViewController:(id)a3
{
  id v4 = [(BKBookViewController *)self assetViewControllerDelegate];
  id v5 = [(BKBookViewController *)self contentSubType];
  id v6 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  id v7 = [v4 analyticsContentDataForAssetViewController:self contentSubType:v5 tracker:v6];

  return v7;
}

- (id)environmentOverrideViewForSearchViewController:(id)a3
{
  return [(BKBookViewController *)self environmentOverrideView];
}

- (void)p_releaseDictionary
{
  [(BCDDParsecCollectionViewController *)self->_referenceLibraryViewController setDelegate:0];
  referenceLibraryViewController = self->_referenceLibraryViewController;
  self->_referenceLibraryViewController = 0;
}

- (void)showLookupForString:(id)a3 fromView:(id)a4 onClose:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5C650;
  v12[3] = &unk_1DC068;
  id v13 = a4;
  BOOL v14 = self;
  id v15 = v8;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  [(BKBookViewController *)self dismissCurrentPopoverWithCompletion:v12 animated:0];
}

- (void)dismissCurrentPopoverWithCompletion:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BKBookViewController *)self referenceLibraryViewController];

  if (v7)
  {
    id v8 = [(BKBookViewController *)self referenceLibraryViewController];
    [v8 dismissViewControllerAnimated:0 completion:0];

    [(BKBookViewController *)self p_releaseDictionary];
  }
  id v9 = [(BKBookViewController *)self translationViewController];

  if (v9)
  {
    id v10 = [(BKBookViewController *)self translationViewController];
    [v10 dismissViewControllerAnimated:0 completion:0];

    [(BKBookViewController *)self setTranslationViewController:0];
  }
  v11.receiver = self;
  v11.super_class = (Class)BKBookViewController;
  [(BKViewController *)&v11 dismissCurrentPopoverWithCompletion:v6 animated:v4];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presentedViewController];
  activityViewController = self->_activityViewController;

  if (v5 == activityViewController)
  {
    [(BKBookViewController *)self setActivityViewController:0];
  }
  else
  {
    id v7 = [v4 presentedViewController];
    id v8 = [(BKBookViewController *)self referenceLibraryViewController];

    if (v7 == v8)
    {
      [(BKBookViewController *)self clearSelection];
      [(BKBookViewController *)self p_releaseDictionary];
    }
    else
    {
      id v9 = [v4 presentedViewController];
      id v10 = [(BKBookViewController *)self translationViewController];

      if (v9 == v10)
      {
        [(BKBookViewController *)self clearSelection];
        [(BKBookViewController *)self setTranslationViewController:0];
      }
      else
      {
        objc_super v11 = [v4 presentedViewController];
        id v12 = [(BKBookViewController *)self brightnessController];

        if (v11 == v12) {
          goto LABEL_11;
        }
        id v13 = [v4 presentedViewController];
        BOOL v14 = [(BKBookViewController *)self audioController];
        id v15 = [v14 navigationController];

        if (v13 == v15)
        {
LABEL_11:
          [(BKBookViewController *)self cleanupPopovers];
        }
        else if (self->_appearanceContainerViewController)
        {
          id v16 = [v4 presentedViewController];
          appearanceContainerViewController = self->_appearanceContainerViewController;

          if (v16 == appearanceContainerViewController) {
            [(BKBookViewController *)self handleAppearanceViewControllerDismissal];
          }
        }
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)BKBookViewController;
  [(BKViewController *)&v18 presentationControllerDidDismiss:v4];
}

- (id)_footnoteViewController2ForResource:(id)a3 stylesheetSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[BKFootnoteViewController2 alloc] initWithResource:v7 stylesheetSet:v6 backgroundColor:0 textColor:0];

  [(BKFootnoteViewController2 *)v8 setAllowsRemoteInspection:[(AEBookInfo *)self->_book shouldAllowRemoteInspection]];
  id v9 = [(BKBookViewController *)self theme];
  [(BKFootnoteViewController2 *)v8 setTheme:v9];

  objc_storeStrong((id *)&self->_footnoteController, v8);

  return v8;
}

- (void)showFootnoteInContentViewController:(id)a3 resource:(id)a4 fromView:(id)a5 stylesheetSet:(id)a6
{
  id v9 = (UIView *)a5;
  id v10 = a6;
  id v11 = a4;
  [(BKBookViewController *)self dismissCurrentPopover];
  [(BKBookViewController *)self _cleanupFootnoteViewController];
  footnoteSourceView = self->_footnoteSourceView;
  self->_footnoteSourceView = v9;
  id v15 = v9;

  id v13 = [(BKBookViewController *)self _footnoteViewController2ForResource:v11 stylesheetSet:v10];

  footnoteController = self->_footnoteController;
  self->_footnoteController = v13;

  [(BKFootnoteViewController2 *)self->_footnoteController setDelegate:self];
  [(BKFootnoteViewController2 *)self->_footnoteController prepareForDisplay];
}

- (void)toggleBookmarkForContentViewController:(id)a3
{
}

- (void)toggleControlsForContentViewController:(id)a3
{
}

- (void)_cleanupFootnoteViewController
{
  [(BKFootnoteViewController2 *)self->_footnoteController setDelegate:0];
  footnoteController = self->_footnoteController;
  self->_footnoteController = 0;

  footnoteSourceView = self->_footnoteSourceView;
  self->_footnoteSourceView = 0;
}

- (void)footnoteViewController:(id)a3 handleUserRequestForFrameToLoadExternalURL:(id)a4 completion:(id)a5
{
  if (self->_footnoteController == a3)
  {
    -[BKBookViewController _promptToLoadExternalContent:](self, "_promptToLoadExternalContent:", a5, a4);
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (void)footnoteViewController:(id)a3 handleExternalLoadRequest:(id)a4 likelyUserInitiated:(BOOL)a5
{
  if (self->_footnoteController == a3)
  {
    [(BKBookViewController *)self _handleExternalLoadRequest:a4 likelyUserInitiated:a5];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (BOOL)footnoteViewController:(id)a3 handleInternalLoadRequest:(id)a4
{
  if (self->_footnoteController == a3)
  {
    return -[BKBookViewController _controller:handleInternalRequestForURL:](self, "_controller:handleInternalRequestForURL:");
  }
  else
  {
    BCReportAssertionFailureWithMessage();
    return 0;
  }
}

- (void)footnoteViewController:(id)a3 handleInternalLoadRequestForNewWindow:(id)a4
{
}

- (void)footnoteViewDidFinishLoad:(id)a3
{
  if (self->_footnoteController == a3)
  {
    -[BKBookViewController showOverlayViewController:fromView:popoverOnPhone:popoverBackgroundColor:](self, "showOverlayViewController:fromView:popoverOnPhone:popoverBackgroundColor:");
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (void)footnoteViewDidDisappear:(id)a3
{
  if (self->_footnoteController == a3)
  {
    [(BKBookViewController *)self _cleanupFootnoteViewController];
    [(BKBookViewController *)self clearSelection];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (void)footnoteViewController:(id)a3 presentAlertController:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  if (self->_footnoteController == a3)
  {
    id v9 = [(BKBookViewController *)self book];
    id v10 = [v9 bookTitle];
    [v11 setTitle:v10];

    [(BKBookViewController *)self presentViewController:v11 animated:+[UIView areAnimationsEnabled] completion:v8];
  }
  else
  {
    BCReportAssertionFailureWithMessage();
  }
}

- (id)existingContentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (id)contentViewControllerForPageNumber:(int64_t)a3
{
  return 0;
}

- (void)pageNavigationDidTryToSwipePastEndOfBook:(id)a3
{
}

- (void)pageNavigationDidSwipeToNextPage:(id)a3
{
}

- (BOOL)pageNavigationController:(id)a3 shouldDelayChangeToPageOffset:(int64_t)a4 completion:(id)a5
{
  return 0;
}

- (void)pageNavigationDidChangeLocation:(id)a3
{
  v5.id location = (NSUInteger)[(BKBookViewController *)self currentPages];
  if (!NSIntersectionRange(v5, (NSRange)self[240]).length)
  {
    [(BKBookViewController *)self stopReadAloud];
  }
}

- (int64_t)pageNavigationCurrentReadAloudPageOffset:(id)a3
{
  id v4 = a3;
  unint64_t previousReadingOrdinal = self->_previousReadingOrdinal;
  if (previousReadingOrdinal == -1)
  {
    if (self->_isReading) {
      unint64_t previousReadingOrdinal = (unint64_t)[(BKBookViewController *)self currentPages];
    }
    else {
      unint64_t previousReadingOrdinal = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return previousReadingOrdinal;
}

- (void)setSection:(int)a3
{
}

- (void)setSection:(int)a3 animated:(BOOL)a4 adjustScrollToReveal:(BOOL)a5
{
  if (self->_section != a3)
  {
    self->_section = a3;
    if (a3)
    {
      -[BKBookViewController bookMilestoneReached:](self, "bookMilestoneReached:", 7, a4, a5);
      [(BKBookViewController *)self updateToolbarController];
    }
    else
    {
      [(BKBookViewController *)self updateToolbarController];
      id v6 = [(BKBookViewController *)self displaySleepController];
      [v6 userInteractionOccurred];
    }
    [(BKBookViewController *)self notifyAppIntentsInfoChanged];
  }
}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(BKBookViewController *)self directoryContent:v7 didSelectLocation:v6 animated:+[UIView areAnimationsEnabled]];
}

- (void)directoryContent:(id)a3 didSelectLocation:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v21 = a4;
  id v7 = -[BKBookViewController documentForLocation:](self, "documentForLocation:");
  id v8 = v7;
  if (!v7) {
    goto LABEL_4;
  }
  id v9 = [v7 documentOrdinal];
  if ([v9 integerValue] == (id)-1)
  {
  }
  else
  {
    id v10 = [v8 nonlinearElement];
    unsigned int v11 = [v10 BOOLValue];

    if (!v11)
    {
LABEL_4:
      [(BKBookViewController *)self recordJumpFromCurrentLocation];
      if (v21) {
        [(BKBookViewController *)self setResumeLocation:v21];
      }
      [(BKBookViewController *)self setSection:0 animated:v5 adjustScrollToReveal:1];
      [(BKBookViewController *)self setResumeLocation:0];
      [(BKBookViewController *)self clearSearchResult];
      goto LABEL_13;
    }
  }
  id v12 = [(BKBookViewController *)self book];
  id v13 = [v12 urlForDocument:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v21;
    id v15 = [v14 anchor];

    if (v15)
    {
      id v16 = [v14 anchor];
      uint64_t v17 = [v13 URLByAppendingPathComponent:v16];

      id v13 = (void *)v17;
    }
  }
  objc_super v18 = +[BKExpandedContentResource resourceForURL:v13];
  long long v19 = [(BKBookViewController *)self book];
  long long v20 = [v19 cacheItem];
  [v18 setCacheItem:v20];

  [(BKBookViewController *)self _showExpandedContentForResource:v18 atLocation:v21 presentingFromTOC:1 completion:0];
LABEL_13:
}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBookViewController *)self paginationController];
  id v7 = [v6 pageNumberForLocation:v5];

  return (int64_t)v7;
}

- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4
{
  return [(BKBookViewController *)self pageLocationForPageNumber:a4];
}

- (id)_locationForChapter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 href];
  id v6 = [v5 URLFragmentString];

  id v7 = [v4 href];

  id v8 = [v7 stringByRemovingURLFragment];

  id v9 = [(BKBookViewController *)self locationForPath:v8 fragment:v6];

  return v9;
}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  id v6 = a3;
  id v8 = [(BKBookViewController *)self _locationForChapter:a4];
  objc_opt_class();
  id v7 = BUDynamicCast();

  [(BKBookViewController *)self directoryContent:v7 didSelectLocation:v8];
}

- (id)tocViewController:(id)a3 chapterTitleForAnnotation:(id)a4
{
  return [(BKBookViewController *)self chapterTitleForAnnotation:a4];
}

- (id)directoryContent:(id)a3 pageTitleForPageNumber:(int64_t)a4
{
  return [(BKBookViewController *)self pageTitleForPageNumber:a4];
}

- (id)tocViewController:(id)a3 pageTitleForChapter:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBookViewController *)self paginationController];
  id v7 = [v6 pageRangeForChapter:v5];
  uint64_t v9 = v8;

  int64_t v10 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v9);
  unsigned int v11 = [(BKBookViewController *)self pageTitleForPageNumber:v10];
  if ([v11 length] || v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v11) {
      goto LABEL_7;
    }
    unsigned int v11 = AEBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"-" value:&stru_1DF0D8 table:0];
  }
  else
  {
    uint64_t v12 = +[NSString stringWithFormat:@"%lu", v10];
  }
  id v13 = (void *)v12;

  unsigned int v11 = v13;
LABEL_7:

  return v11;
}

- (id)tocViewController:(id)a3 pageTitleForAnnotation:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBookViewController *)self paginationController];
  id v7 = [v6 pageRangeForAnnotation:v5];
  uint64_t v9 = v8;

  int64_t v10 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v9);
  unsigned int v11 = [(BKBookViewController *)self pageTitleForPageNumber:v10];
  if (!v11 && v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v11 = +[NSString stringWithFormat:@"%lu", v10];
  }

  return v11;
}

- (int64_t)tocViewController:(id)a3 pageNumberForAnnotation:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBookViewController *)self paginationController];
  id v7 = [v6 pageRangeForAnnotation:v5];
  uint64_t v9 = v8;

  return -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v7, v9);
}

- (int64_t)tocViewController:(id)a3 pageNumberForChapter:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBookViewController *)self paginationController];
  id v7 = [v6 pageRangeForChapter:v5];

  return (int64_t)v7;
}

- (id)tocViewControllerTocIdCssRules:(id)a3
{
  id v3 = [(BKBookViewController *)self book];
  id v4 = [v3 tocIdCssRules];

  return v4;
}

- (id)tocViewControllerCurrentLocation:(id)a3
{
  return [(BKBookViewController *)self tocCurrentLocation];
}

- (id)contentViewControllerForLocation:(id)a3
{
  return 0;
}

- (id)contentViewControllerForAnnotation:(id)a3
{
  return 0;
}

- (void)_contentReady:(id)a3
{
  id v5 = [a3 object];
  if (-[NSMutableArray containsObject:](self->_contentLoadQueue, "containsObject:"))
  {
    [(NSMutableArray *)self->_contentLoadQueue removeObject:v5];
    if ([(NSMutableArray *)self->_contentLoadQueue count])
    {
      id v4 = [(NSMutableArray *)self->_contentLoadQueue objectAtIndex:0];
      [v4 load];
    }
  }
}

- (void)preloadContentController:(id)a3 highPriority:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (char *)a3;
  id v7 = v6;
  if (v6)
  {
    id v16 = v6;
    id v6 = (char *)[v6 isContentLoaded];
    id v7 = v16;
    if ((v6 & 1) == 0)
    {
      contentLoadQueue = self->_contentLoadQueue;
      if (!contentLoadQueue)
      {
        uint64_t v9 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:12];
        int64_t v10 = self->_contentLoadQueue;
        self->_contentLoadQueue = v9;

        id v7 = v16;
        contentLoadQueue = self->_contentLoadQueue;
      }
      id v11 = [(NSMutableArray *)contentLoadQueue indexOfObject:v7];
      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (v4 && [(NSMutableArray *)self->_contentLoadQueue count]) {
          [(NSMutableArray *)self->_contentLoadQueue insertObject:v16 atIndex:1];
        }
        else {
          [(NSMutableArray *)self->_contentLoadQueue addObject:v16];
        }
      }
      else
      {
        id v12 = v11;
        if ((uint64_t)v11 >= 2 && v4)
        {
          id v14 = self->_contentLoadQueue;
          id v15 = v16;
          [(NSMutableArray *)v14 removeObjectAtIndex:v12];
          [(NSMutableArray *)self->_contentLoadQueue insertObject:v15 atIndex:1];
        }
      }
      id v6 = (char *)[(NSMutableArray *)self->_contentLoadQueue count];
      id v7 = v16;
      if (v6 == (unsigned char *)&dword_0 + 1)
      {
        id v6 = (char *)[v16 load];
        id v7 = v16;
      }
    }
  }

  _objc_release_x1(v6, v7);
}

- (void)cancelPreloadForContent:(id)a3
{
  id v4 = [(NSMutableArray *)self->_contentLoadQueue indexOfObject:a3];
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v4;
    [(NSMutableArray *)self->_contentLoadQueue removeObjectAtIndex:v4];
    if (!v5)
    {
      if ([(NSMutableArray *)self->_contentLoadQueue count])
      {
        id v6 = [(NSMutableArray *)self->_contentLoadQueue objectAtIndex:0];
        [v6 load];
      }
    }
  }
}

+ (id)valueOfAnnotationProperty:(id)a3 activityType:(id)a4 book:(id)a5
{
  id v6 = a3;
  id v29 = a5;
  id v7 = objc_alloc((Class)NSSet);
  id v30 = [v7 initWithObjects:AEAssetActivityItemProviderPropertyStoreId, AEAssetActivityItemProviderPropertyEpubId, AEAssetActivityItemProviderPropertyTitle, AEAssetActivityItemProviderPropertyAuthor, AEAssetActivityItemProviderPropertyPublisherLocation, AEAssetActivityItemProviderPropertyPublisherName, AEAssetActivityItemProviderPropertyPublisherYear, AEAssetActivityItemProviderPropertyLanguage, AEAssetActivityItemProviderPropertyGenre, AEAssetActivityItemProviderPropertyIsContentProtected, 0];
  if ([v30 containsObject:v6])
  {
    id v8 = objc_alloc((Class)NSDictionary);
    id v9 = objc_msgSend(v8, "initWithObjectsAndKeys:", @"storeId", AEAssetActivityItemProviderPropertyStoreId, @"bookEpubId", AEAssetActivityItemProviderPropertyEpubId, @"bookTitle", AEAssetActivityItemProviderPropertyTitle, @"bookAuthor", AEAssetActivityItemProviderPropertyAuthor, @"publisherLocation", AEAssetActivityItemProviderPropertyPublisherLocation, @"publisherName", AEAssetActivityItemProviderPropertyPublisherName, @"publisherYear", AEAssetActivityItemProviderPropertyPublisherYear, @"bookLanguage", AEAssetActivityItemProviderPropertyLanguage, @"genre",
           AEAssetActivityItemProviderPropertyGenre,
           @"isProtected",
           AEAssetActivityItemProviderPropertyIsContentProtected,
           0);
    int64_t v10 = [v9 objectForKey:v6];
    id v11 = v29;
    uint64_t v12 = [v29 valueForKey:v10];
LABEL_3:
    id v13 = (void *)v12;
LABEL_21:

    goto LABEL_22;
  }
  id v11 = v29;
  if ([v6 isEqualToString:AEAssetActivityItemProviderPropertyAssetCover])
  {
    id v9 = [v29 url];
    id v14 = +[AEPluginRegistry sharedInstance];
    int64_t v10 = [v14 pluginForURL:v9];

    if (!v10
      || ([v10 helperForURL:v9 withOptions:0],
          id v15 = objc_claimAutoreleasedReturnValue(),
          [v15 helperCoverImage],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v13))
    {
      id v16 = [v29 pageProgressionDirection];
      [v16 isEqualToString:AEHelperStringMetadataPageProgressionRightToLeftValue];

      uint64_t v17 = [v29 bookLanguage];
      double v28 = [v29 coverWritingModeString];
      [v28 imIsVerticalWritingMode];
      BKGenericBookCoverLayoutFromLanguageAndVerticality();
      objc_super v18 = +[UIScreen mainScreen];
      [v18 scale];

      CGSizeScale();
      long long v19 = [v29 genericCoverTemplate];
      int v20 = BKGenericBookCoverTemplateNameValid();

      id v21 = [v29 shortBookTitle];
      double v22 = [v29 bookAuthor];
      if (v20)
      {
        BOOL v23 = [v29 genericCoverTemplate];
        uint64_t ImageWithTemplate = BKGenericBookCoverCreateImageWithTemplate();
      }
      else
      {
        BOOL v23 = [v29 databaseKey];
        uint64_t ImageWithTemplate = BKGenericBookCoverCreateImageWithItemIDAndLayout();
      }
      id v26 = (const void *)ImageWithTemplate;

      if (v26)
      {
        id v13 = +[UIImage imageWithCGImage:v26];
        CFRelease(v26);
      }
      else
      {
        id v13 = 0;
      }
    }
    goto LABEL_21;
  }
  if ([v6 isEqualToString:AEAssetActivityItemProviderPropertyAssetType])
  {
    id v13 = [v29 assetType];
    goto LABEL_22;
  }
  if ([v6 isEqualToString:AEAssetActivityItemProviderPropertyStoreUrl])
  {
    id v25 = [v29 storeId];
    id v13 = +[AEBookInfo storeURLForBookStoreId:isAudiobook:](AEBookInfo, "storeURLForBookStoreId:isAudiobook:", v25, [v29 contentType] == 4);

    goto LABEL_22;
  }
  if ([v6 isEqualToString:AEAssetActivityItemProviderPropertyStoreShortUrl])
  {
    if ([v29 isStoreBook])
    {
      id v9 = +[AEUserPublishing sharedInstance];
      int64_t v10 = [v29 storeId];
      uint64_t v12 = [v9 storeShortURLForStoreId:v10 dataSource:0];
      goto LABEL_3;
    }
  }
  else
  {
    if ([v6 isEqualToString:AEAssetActivityItemProviderPropertyBookDescription])
    {
      id v9 = +[AEAssetEngine libraryMgr];
      int64_t v10 = [v29 assetID];
      uint64_t v12 = [v9 bookDescriptionForAssetID:v10];
      goto LABEL_3;
    }
    if ([v6 isEqualToString:AEAssetActivityItemProviderPropertySeriesTitle])
    {
      id v9 = +[AEAssetEngine libraryMgr];
      int64_t v10 = [v29 assetID];
      uint64_t v12 = [v9 seriesTitleForAssetID:v10];
      goto LABEL_3;
    }
  }
  id v13 = 0;
LABEL_22:

  return v13;
}

+ (id)propertySourceFromBook:(id)a3
{
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  int64_t v10 = sub_5E35C;
  id v11 = &unk_1DC090;
  id v12 = a3;
  id v13 = a1;
  id v4 = v12;
  id v5 = objc_retainBlock(&v8);
  id v6 = [v5 copy:v8, v9, v10, v11];

  return v6;
}

+ (BOOL)areCitationsAllowedForBook:(id)a3
{
  id v3 = a3;
  if (![v3 isProtected]) {
    goto LABEL_3;
  }
  id v4 = +[AEAssetEngine storeMgr];
  id v5 = [v4 clientApplicationController];
  id v6 = [v3 storeFrontId];
  unsigned int v7 = [v5 citationAllowedForStoreFrontID:[v6 unsignedLongLongValue]];

  if (!v7)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
LABEL_3:
    id v8 = [v3 sampleContent];
    unsigned int v9 = [v8 BOOLValue] ^ 1;
  }
  return v9;
}

- (BOOL)isSharingSupported
{
  return 1;
}

- (void)shareAnnotation:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a5;
  id v15 = +[NSArray arrayWithObject:a3];
  -[BKBookViewController shareAnnotations:fromRect:inView:excerpt:completion:](self, "shareAnnotations:fromRect:inView:excerpt:completion:", v15, v14, 1, v13, x, y, width, height);
}

- (void)shareAnnotations:(id)a3 fromBarButtonItem:(id)a4 excerpt:(BOOL)a5 completion:(id)a6
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_5E604;
  v14[3] = &unk_1DC108;
  void v14[4] = self;
  id v15 = a3;
  BOOL v18 = a5;
  id v16 = a4;
  id v17 = a6;
  id v10 = v16;
  id v11 = v17;
  id v12 = v15;
  id v13 = objc_retainBlock(v14);
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v13];
}

- (void)shareAnnotations:(id)a3 fromRect:(CGRect)a4 inView:(id)a5 excerpt:(BOOL)a6 completion:(id)a7
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v15 = a3;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_5EDBC;
  v20[3] = &unk_1DC130;
  v20[4] = self;
  id v21 = a5;
  CGFloat v24 = x;
  CGFloat v25 = y;
  CGFloat v26 = width;
  CGFloat v27 = height;
  BOOL v28 = a6;
  id v22 = v15;
  id v23 = a7;
  id v16 = v23;
  id v17 = v15;
  id v18 = v21;
  long long v19 = objc_retainBlock(v20);
  [(BKViewController *)self dismissCurrentPopoverWithCompletion:v19];
}

- (void)expandAnnotation:(id)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  if (a4)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = [(BKBookViewController *)self book];
    [v14 expandAnnotation:v13 location:v12 selectedText:v11 representativeText:v10];
  }
}

- (id)addAnnotation:(int)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  if (a4)
  {
    uint64_t v8 = *(void *)&a3;
    id v10 = a6;
    id v11 = a5;
    id v12 = a4;
    id v13 = [(BKBookViewController *)self book];
    id v14 = [v13 addAnnotation:v8 location:v12 selectedText:v11 representativeText:v10];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)contentViewController:(id)a3 showHighlightingMenuForAnnotation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(BKBookViewController *)self theme];
  id v9 = [v8 annotationPageTheme];

  id v10 = [AEAnnotationTheme themeForAnnotationStyle:[v7 annotationStyle] pageTheme:v9 isUnderline:[v7 annotationIsUnderline]];
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_5F82C;
  v17[3] = &unk_1DC158;
  objc_copyWeak(v21, &location);
  id v11 = v6;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  v21[1] = v9;
  id v13 = v7;
  id v20 = v13;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5F9AC;
  v15[3] = &unk_1DC180;
  id v14 = objc_retainBlock(v17);
  id v16 = v14;
  [v11 rectForAnnotation:v13 withCompletion:v15];

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (void)contentViewController:(id)a3 shareAnnotation:(id)a4 annotationRects:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [a5 firstObject];
  id v14 = v13;
  if (v13)
  {
    [v13 rectValue];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    id v23 = [v10 view];
    -[BKBookViewController shareAnnotation:fromRect:inView:completion:](self, "shareAnnotation:fromRect:inView:completion:", v11, v23, v12, v16, v18, v20, v22);
LABEL_5:

    goto LABEL_6;
  }
  if ([v11 conformsToProtocol:&OBJC_PROTOCOL___BKBookmark])
  {
    id v24 = v11;
    CGFloat v25 = [v24 location];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_5FB60;
    v26[3] = &unk_1DC1A8;
    v26[4] = self;
    id v27 = v24;
    id v28 = v10;
    id v29 = v12;
    id v23 = v24;
    [v28 visibleRectForLocation:v25 completion:v26];

    goto LABEL_5;
  }
LABEL_6:
}

- (id)_readPlayer
{
  readPlayer = self->_readPlayer;
  if (!readPlayer)
  {
    id v4 = (IMAVPlayer *)objc_alloc_init((Class)IMAVPlayer);
    id v5 = self->_readPlayer;
    self->_readPlayer = v4;

    [(IMAVPlayer *)self->_readPlayer setUsesExternalPlaybackWhileExternalScreenIsActive:0];
    [(IMAVPlayer *)self->_readPlayer setDelegate:self];
    id v6 = +[NSUserDefaults standardUserDefaults];
    id v7 = [v6 objectForKey:@"AudioVolume"];

    if (v7)
    {
      [v7 floatValue];
      -[IMAVPlayer setVolume:](self->_readPlayer, "setVolume:");
    }

    readPlayer = self->_readPlayer;
  }

  return readPlayer;
}

- (id)_trackPlayer
{
  trackPlayer = self->_trackPlayer;
  if (!trackPlayer)
  {
    id v4 = (IMAVPlayer *)objc_alloc_init((Class)IMAVPlayer);
    id v5 = self->_trackPlayer;
    self->_trackPlayer = v4;

    [(IMAVPlayer *)self->_trackPlayer setUsesExternalPlaybackWhileExternalScreenIsActive:0];
    id v6 = +[NSUserDefaults standardUserDefaults];
    id v7 = [v6 objectForKey:@"AudioVolume"];

    if (v7)
    {
      [v7 floatValue];
      -[IMAVPlayer setVolume:](self->_trackPlayer, "setVolume:");
    }

    trackPlayer = self->_trackPlayer;
  }

  return trackPlayer;
}

- (BOOL)isReading
{
  return [(BKBookViewController *)self readAloudState] != -1 && self->_isReading;
}

- (BOOL)canTurnPagesAutomatically
{
  return [(BKBookViewController *)self readAloudState] >= 0;
}

- (BOOL)hasSoundtrack
{
  NSUInteger v2 = [(BKBookViewController *)self currentSoundtrack];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isSoundtrackPlaying
{
  BOOL v3 = [(BKBookViewController *)self hasSoundtrack];
  if (v3) {
    LOBYTE(v3) = self->_isPlayingSoundTrack;
  }
  return v3;
}

- (BOOL)canTurnPagesAutomaticallyForToolbarItem:(id)a3
{
  return [(BKBookViewController *)self canTurnPagesAutomatically];
}

- (BOOL)isSoundtrackPlayingForToolbarItem:(id)a3
{
  return [(BKBookViewController *)self isSoundtrackPlaying];
}

- (void)setReadAloudState:(BOOL)a3
{
  if (self->_isReading != a3)
  {
    if (a3)
    {
      self->_isReading = 1;
      [(BKBookViewController *)self startReadAloud];
      [(BKBookViewController *)self dismissCurrentPopover];
      if (![(BKBookViewController *)self bkaxNeedsPersistentControls]) {
        [(BKBookViewController *)self hidePageControls:0];
      }
    }
    else
    {
      [(BKBookViewController *)self stopReadAloud];
      [(BKBookViewController *)self _nextPageHint:0];
      self->_isReading = 0;
      id v4 = [(BKBookViewController *)self currentPages];
      uint64_t v6 = v5;
      int64_t v7 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v4, v5);
      if (v6)
      {
        int64_t v8 = v7;
        do
        {
          id v9 = [(BKBookViewController *)self contentViewControllerForPageNumber:v8];
          [(BKBookViewController *)self _removeClickHandlers:v9];
          [(BKBookViewController *)self _cleanDocumentElementForMediaOverlay:v9];

          ++v8;
          --v6;
        }
        while (v6);
      }
    }
    [(BKBookViewController *)self updateToolbarController];
    [(BKBookViewController *)self updateTouchBarController];
  }
}

- (int)readAloudState
{
  BOOL v3 = [(BKBookViewController *)self book];
  unsigned int v4 = [v3 hasMediaOverlayElements];

  if (v4) {
    return self->_isReading;
  }
  else {
    return -1;
  }
}

- (void)setTrackState:(BOOL)a3
{
}

- (void)setTrackState:(BOOL)a3 persistSetting:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3)
  {
    [(BKBookViewController *)self stopSoundtrack];
    self->_isPlayingSoundTrack = 0;
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  self->_isPlayingSoundTrack = 1;
  [(BKBookViewController *)self playCurrentSoundtrack];
  if (v4)
  {
LABEL_5:
    uint64_t v6 = +[NSUserDefaults standardUserDefaults];
    int64_t v7 = +[NSNumber numberWithBool:self->_isPlayingSoundTrack];
    [v6 setObject:v7 forKey:@"soundtrackState"];
  }
LABEL_6:

  [(BKBookViewController *)self updateToolbarController];
}

- (int)trackState
{
  BOOL v3 = [(BKBookViewController *)self currentSoundtrack];

  if (v3) {
    return self->_isPlayingSoundTrack;
  }
  else {
    return -1;
  }
}

- (void)setTurnState:(BOOL)a3
{
  self->_autoTurn = a3;
  BOOL v4 = +[NSUserDefaults standardUserDefaults];
  uint64_t v5 = +[NSNumber numberWithBool:self->_autoTurn];
  [v4 setObject:v5 forKey:BKReadAloudAutoPageTurn[0]];

  [(BKBookViewController *)self updateToolbarController];
}

- (BOOL)turnState
{
  return self->_autoTurn;
}

- (void)setVolume:(float)a3
{
  -[IMAVPlayer setVolume:](self->_readPlayer, "setVolume:");
  *(float *)&double v5 = a3;
  [(IMAVPlayer *)self->_trackPlayer setVolume:v5];
  id v8 = +[NSUserDefaults standardUserDefaults];
  *(float *)&double v6 = a3;
  int64_t v7 = +[NSNumber numberWithFloat:v6];
  [v8 setObject:v7 forKey:@"AudioVolume"];
}

- (float)volume
{
  NSUInteger v2 = [(BKBookViewController *)self _readPlayer];
  [v2 volume];
  float v4 = v3;

  return v4;
}

- (void)dismissPopover
{
}

- (void)dismissCurrentPopover
{
}

- (void)dismissCurrentPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_appearanceContainerViewController)
  {
    double v5 = [(BKBookViewController *)self presentedViewController];
    appearanceContainerViewController = self->_appearanceContainerViewController;

    if (v5 == appearanceContainerViewController) {
      [(BKBookViewController *)self handleAppearanceViewControllerDismissal];
    }
  }
  [(BKBookViewController *)self setActivityViewController:0];
  [(BKBookViewController *)self _cleanupFootnoteViewController];
  v7.receiver = self;
  v7.super_class = (Class)BKBookViewController;
  [(BKViewController *)&v7 dismissCurrentPopoverAnimated:v3];
}

- (void)playerStateChanged:(id)a3
{
  if (self->_readPlayer == a3) {
    [(BKBookViewController *)self updateTouchBarController];
  }
}

- (void)playerCurrentItemEnded:(id)a3
{
  float v4 = (IMAVPlayer *)a3;
  if (self->_readPlayer == v4)
  {
    double v17 = v4;
    currentMapItem = self->_currentMapItem;
    if (currentMapItem)
    {
      double v6 = [(NSDictionary *)currentMapItem valueForKey:@"smil"];
      [(BKBookViewController *)self _removeHighlightOnElement:v6];
      objc_super v7 = self->_currentMapItem;
      self->_currentMapItem = 0;
    }
    currentMapIndeCGFloat x = self->_currentMapIndex;
    if (currentMapIndex >= [(NSArray *)self->_smilMap count])
    {
      id v9 = (void *)(self->_pagesForMap.location + self->_pagesForMap.length - 1);
      if (v9 == (void *)[(BKBookViewController *)self pageCountIncludingUpsell])
      {
        [(BKBookViewController *)self setReadAloudState:0];
        goto LABEL_8;
      }
      ++self->_currentMapIndex;
      id v10 = [(BKBookViewController *)self performSelectorProxy];
      +[NSObject cancelPreviousPerformRequestsWithTarget:v10 selector:"_playNextItem" object:0];

      id v11 = [(BKBookViewController *)self currentPages];
      if (self->_autoTurn)
      {
        id v13 = v11;
        unint64_t v14 = v12;
        if (![(BKBookViewController *)self _isFocusedOnSecondPageOfSpread])
        {
          unint64_t previousReadingOrdinal = self->_previousReadingOrdinal;
          if ((id)(previousReadingOrdinal + 1) == v13 && v14 >= 2)
          {
            [(BKBookViewController *)self _focusOnPage:previousReadingOrdinal + 2];
            [(BKBookViewController *)self clearSelection];
            double v16 = [(BKBookViewController *)self performSelectorProxy];
            [v16 performSelector:"_playNextItem" withObject:0 afterDelay:3.0];

            goto LABEL_8;
          }
        }
      }
    }
    [(BKBookViewController *)self _playNextItem];
LABEL_8:
    float v4 = v17;
  }
}

- (void)player:(id)a3 callbackForTime:(double)a4
{
  id v24 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_smilMap;
  id v6 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v26 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v10 = [v9 valueForKey:@"smil"];
        id v11 = [v10 audioHref];

        if (v11)
        {
          unint64_t v12 = self;
          id v13 = [(BKBookViewController *)self book];
          unint64_t v14 = [v13 basePlusContentPath];
          double v15 = [v10 audioHref];
          double v16 = [v14 stringByAppendingPathComponent:v15];

          double v17 = +[NSURL fileURLWithPath:v16 isDirectory:0];
          double v18 = [v10 audioStart];
          [v18 doubleValue];
          if (vabdd_f64(v19, a4) >= 0.001)
          {
          }
          else
          {
            double v20 = [v24 assetURL];
            unsigned int v21 = [v17 isEqual:v20];

            if (v21)
            {
              double v22 = [v9 valueForKey:@"ordinal"];
              signed int v23 = [v22 intValue];

              if (v12->_previousReadingOrdinal != v23)
              {
                v12->_unint64_t previousReadingOrdinal = v23;
                [(BKBookViewController *)v12 _focusOnPage:v23 + 1];
                [(BKBookViewController *)v12 clearSelection];
              }
              [(BKBookViewController *)v12 _highlightElement:v10];

              goto LABEL_18;
            }
          }

          self = v12;
        }
      }
      id v7 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (void)startReadAloud
{
}

- (BOOL)isReadAloudPaused
{
  if (!self->_isReading) {
    return 0;
  }
  NSUInteger v2 = [(BKBookViewController *)self _readPlayer];
  BOOL v3 = [v2 state] == 3;

  return v3;
}

- (void)_startReadAloud:(BOOL)a3
{
  if (a3 && [(BKBookViewController *)self isReadAloudPaused])
  {
    char v4 = 1;
  }
  else
  {
    [(BKBookViewController *)self stopReadAloud];
    char v4 = 0;
  }
  id v5 = [(BKBookViewController *)self currentPages];
  uint64_t v7 = v6;
  int64_t v8 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v5, v6);
  if (v7)
  {
    int64_t v9 = v8;
    uint64_t v10 = v7;
    do
    {
      id v11 = [(BKBookViewController *)self contentViewControllerForPageNumber:v9];
      [(BKBookViewController *)self _installClickHandlers:v11];
      [(BKBookViewController *)self _markupDocumentElementForMediaOverlay:v11];

      ++v9;
      --v10;
    }
    while (v10);
  }
  if (v4)
  {
    unint64_t v12 = [(BKBookViewController *)self _readPlayer];
    [v12 play];
LABEL_14:

    goto LABEL_16;
  }
  if (self->_autoTurn
    && (-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v5, v7)
     || -[BKBookViewController _isPageAllZeros:](self, "_isPageAllZeros:", v5, v7)))
  {
    unint64_t v12 = +[NSNumber numberWithBool:0];
    [(BKBookViewController *)self readNextPages:v12];
    goto LABEL_14;
  }
  -[BKBookViewController readPages:from:to:waitOnEmpty:](self, "readPages:from:to:waitOnEmpty:", v5, v7, [(BKBookViewController *)self _itemIndexForCurrentPage], -1, 0);
LABEL_16:
  self->_isAutoTurning = 1;
  id v13 = +[BCAudioMuxingCoordinator sharedInstance];
  [v13 notifyPlaybackWillStart:self];
}

- (void)stopReadAloud
{
}

- (void)stopReadAloudAndReload:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKBookViewController *)self pauseReadAloud];
  [(IMAVPlayer *)self->_readPlayer setCurrentTime:0.0];
  if (v3)
  {
    id v5 = [(IMAVPlayer *)self->_readPlayer assetURL];
    uint64_t v6 = +[AVAsset assetWithURL:v5];
    [(IMAVPlayer *)self->_readPlayer setAsset:v6];
  }
  smilMap = self->_smilMap;
  self->_smilMap = 0;

  currentMapItem = self->_currentMapItem;
  self->_currentMapItem = 0;

  self->_currentMapIndeCGFloat x = -1;
  self->_maxMapIndeCGFloat x = -1;
  self->_unint64_t previousReadingOrdinal = -1;
  id v9 = +[NSNumber numberWithBool:1];
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_nextDelayedPageHint:" object:v9];
}

- (void)pauseReadAloud
{
  if (self->_isReading && ![(BKBookViewController *)self isReadAloudPaused])
  {
    [(IMAVPlayer *)self->_readPlayer pause];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    BOOL v3 = self->_smilMap;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          int64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) valueForKey:@"smil" v11];
          [(BKBookViewController *)self _removeHighlightOnElement:v8];
        }
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    id v9 = [(BKBookViewController *)self performSelectorProxy];
    +[NSObject cancelPreviousPerformRequestsWithTarget:v9 selector:"readNextPages:" object:0];

    uint64_t v10 = [(BKBookViewController *)self performSelectorProxy];
    +[NSObject cancelPreviousPerformRequestsWithTarget:v10 selector:"_playNextItem" object:0];

    self->_isAutoTurning = 0;
    +[IMSleepManager stopSleepTimer];
  }
}

- (void)resumeReadAloud
{
  if (self->_playNextItemAbortedWhileInactive)
  {
    self->_playNextItemAbortedWhileInactive = 0;
    id v3 = [(BKBookViewController *)self performSelectorProxy];
    [v3 performSelector:"_playNextItem" withObject:0 afterDelay:1.0];
  }
  else if ([(BKBookViewController *)self isReadAloudPaused] && self->_smilMap)
  {
    [(BKBookViewController *)self _startReadAloud:1];
  }
}

- (void)_playNextItem
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_nextDelayedPageHint:" object:&__kCFBooleanTrue];
  id v3 = [(BKBookViewController *)self performSelectorProxy];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v3 selector:"readNextPages:" object:0];

  id v4 = [(BKBookViewController *)self viewIfLoaded];
  id v5 = [v4 window];
  uint64_t v6 = [v5 windowScene];
  id v7 = [v6 activationState];

  if (v7)
  {
    self->_playNextItemAbortedWhileInactive = 1;
  }
  else
  {
    self->_playNextItemAbortedWhileInactive = 0;
    int64_t v8 = (char *)[(BKBookViewController *)self currentPages];
    unint64_t v10 = v9;
    if (-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v8, v9)
      || -[BKBookViewController _isPageAllZeros:](self, "_isPageAllZeros:", v8, v10))
    {
      if (&v8[v10 - 1] == (char *)[(BKBookViewController *)self pageCountIncludingUpsell])
      {
        [(BKBookViewController *)self setReadAloudState:0];
      }
      else if (self->_isAutoTurning || self->_autoTurn || v10 == 1)
      {
        if (self->_autoTurn)
        {
          if (![(BKBookViewController *)self _isFocusedOnSecondPageOfSpread]
            && v10 != 1)
          {
            -[BKBookViewController _focusOnPage:](self, "_focusOnPage:", (char *)-[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v8, v10) + 1);
          }
          long long v11 = [(BKBookViewController *)self performSelectorProxy];
          [v11 performSelector:"readNextPages:" withObject:0 afterDelay:3.0];
        }
        else
        {
          [(BKBookViewController *)self _nextPageHint:1];
        }
        self->_isAutoTurning = 0;
      }
      else
      {
        [(BKBookViewController *)self stopReadAloud];
        [(BKBookViewController *)self _nextPageHint:1 afterDelay:1.0];
      }
    }
    else
    {
      currentMapIndeCGFloat x = self->_currentMapIndex;
      if (currentMapIndex >= [(NSArray *)self->_smilMap count])
      {
        unint64_t v14 = self->_previousReadingOrdinal + 1;
        BOOL v15 = v14 >= (unint64_t)v8;
        unint64_t v16 = v14 - (void)v8;
        if (v15 && v16 < v10)
        {
          self->_isAutoTurning = 0;
          if (self->_autoTurn)
          {
            id v46 = +[NSNumber numberWithBool:0];
            [(BKBookViewController *)self readNextPages:v46];
          }
          else
          {
            [(BKBookViewController *)self stopReadAloud];
            [(BKBookViewController *)self _nextPageHint:1];
          }
        }
      }
      else
      {
        maxMapIndeCGFloat x = self->_maxMapIndex;
        if (maxMapIndex < 0 || self->_currentMapIndex <= maxMapIndex)
        {
          double v17 = [(BKBookViewController *)self _readPlayer];
          [v17 removeAllTimeObservers];
          double v18 = [(NSArray *)self->_smilMap objectAtIndex:self->_currentMapIndex];
          currentMapItem = self->_currentMapItem;
          self->_currentMapItem = v18;

          ++self->_currentMapIndex;
          double v20 = [(NSDictionary *)self->_currentMapItem objectForKey:@"smil"];
          unsigned int v21 = [v20 audioStart];
          [v21 doubleValue];
          double v23 = v22;

          id v24 = [v20 audioEnd];
          [v24 doubleValue];
          double v26 = v25;

          [v17 addTimeObserver:v23];
          unint64_t v27 = self->_currentMapIndex;
          id v47 = v20;
          if (v27 < [(NSArray *)self->_smilMap count])
          {
            while (1)
            {
              long long v28 = v17;
              long long v29 = [(NSArray *)self->_smilMap objectAtIndex:v27];
              long long v30 = [(NSDictionary *)v29 objectForKey:@"smil"];
              id v31 = [v30 audioStart];
              [v31 doubleValue];
              double v33 = v32;

              uint64_t v34 = [v30 audioHref];
              long long v35 = [v47 audioHref];
              if (![v34 isEqualToString:v35]) {
                break;
              }

              if (vabdd_f64(v33, v26) >= 2.0) {
                goto LABEL_43;
              }
              double v17 = v28;
              [v28 addTimeObserver:v33];
              long long v36 = [v30 audioEnd];
              [v36 doubleValue];
              double v26 = v37;

              v38 = self->_currentMapItem;
              self->_currentMapItem = v29;

              ++self->_currentMapIndex;
              if (++v27 >= [(NSArray *)self->_smilMap count]) {
                goto LABEL_44;
              }
            }

LABEL_43:
            double v17 = v28;
          }
LABEL_44:
          [v17 addTimeObserver:v26];
          uint64_t v39 = [v47 audioHref];

          if (v39)
          {
            id v40 = [(BKBookViewController *)self book];
            id v41 = [v40 basePlusContentPath];
            objc_super v42 = [v47 audioHref];
            id v43 = [v41 stringByAppendingPathComponent:v42];

            if (v43)
            {
              __int16 v44 = +[NSURL fileURLWithPath:v43 isDirectory:0];
              [v17 setAssetURL:v44];

              if (v23 == v26)
              {
                [(BKBookViewController *)self _playNextItem];
              }
              else
              {
                [v17 setEndTime:v26];
                if (![v17 isPlaying]
                  || ([v17 currentTime], vabdd_f64(v23, v45) >= 2.0))
                {
                  [v17 playFrom:v23];
                }
              }
            }
          }
        }
        else
        {
          [(BKBookViewController *)self stopReadAloud];
        }
        self->_isAutoTurning = 0;
      }
    }
  }
}

- (void)readNextPages:(id)a3
{
  unsigned __int8 v4 = [a3 BOOLValue];
  id v5 = [(BKBookViewController *)self currentPages];
  uint64_t v7 = v6;
  if ([(BKBookViewController *)self _isManualCurlInProgress]
    || (+[NSRunLoop currentRunLoop],
        int64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v8 currentMode],
        unint64_t v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v9 isEqualToString:UITrackingRunLoopMode],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    [(BKBookViewController *)self stopReadAloud];
  }
  else
  {
    uint64_t v11 = (uint64_t)v5 + v7;
    int64_t v12 = [(BKBookViewController *)self pageCountIncludingUpsell];
    if (v4)
    {
      if (v11 <= v12)
      {
        while (-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v11, 1))
        {
          BOOL v13 = v11++ < [(BKBookViewController *)self pageCountIncludingUpsell];
          if (!v13) {
            return;
          }
        }
        [(BKBookViewController *)self turnToPageNumber:v11 animated:1];
        self->_isAutoTurning = 1;
      }
    }
    else
    {
      if (v11 <= v12)
      {
        while (-[BKBookViewController _isPageAllZeros:](self, "_isPageAllZeros:", v11, 1))
        {
          unint64_t v14 = (char *)(v11 + 1);
          BOOL v13 = v11++ < [(BKBookViewController *)self pageCountIncludingUpsell];
          if (!v13) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v14 = (char *)v11;
LABEL_15:
      if (-[BKBookViewController _isPageEmpty:](self, "_isPageEmpty:", v14, 1)) {
        [(BKBookViewController *)self stopReadAloud];
      }
      [(BKBookViewController *)self turnToPageNumber:v14 animated:1];
      self->_isAutoTurning = 1;
      if (v14 == (char *)[(BKBookViewController *)self upsellOrdinal] + 1)
      {
        [(BKBookViewController *)self setReadAloudState:0];
      }
    }
  }
}

- (void)contentView:(id)a3 didSelectMediaOverlayElement:(id)a4
{
  id v5 = a4;
  id v22 = [(BKBookViewController *)self currentPages];
  double v23 = self;
  uint64_t v21 = v6;
  uint64_t v7 = -[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:");
  [v5 elementId];
  double v25 = v24 = v5;
  int64_t v8 = [v5 documentHref];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v14 = [v13 valueForKey:@"smil"];
        BOOL v15 = [v14 documentHref];
        if ([v15 isEqualToString:v8])
        {
          unint64_t v16 = [v14 elementId];
          unsigned int v17 = [v16 isEqualToString:v25];

          if (v17)
          {
            id v18 = [obj indexOfObject:v13];
            id v19 = v18;
            if ((v23->_currentMapIndex & 0x8000000000000000) == 0 && v23->_maxMapIndex < 0)
            {
              uint64_t v20 = -1;
            }
            else if (v23->_autoTurn)
            {
              uint64_t v20 = -1;
            }
            else
            {
              uint64_t v20 = (uint64_t)v18;
            }
            [(BKBookViewController *)v23 stopReadAloud];
            [(BKBookViewController *)v23 _nextPageHint:0];
            if (![(BKBookViewController *)v23 bkaxNeedsPersistentControls]) {
              [(BKBookViewController *)v23 hidePageControls:0];
            }
            -[BKBookViewController readPages:from:to:waitOnEmpty:](v23, "readPages:from:to:waitOnEmpty:", v22, v21, v19, v20, 0);

            goto LABEL_22;
          }
        }
        else
        {
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_22:
}

- (void)readPages:(_NSRange)a3 from:(int64_t)a4 to:(int64_t)a5 waitOnEmpty:(BOOL)a6
{
  if (!self->_isReading) {
    return;
  }
  BOOL v6 = a6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  self->_currentMapIndeCGFloat x = a4;
  self->_maxMapIndeCGFloat x = a5;
  currentMapItem = self->_currentMapItem;
  self->_currentMapItem = 0;

  -[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", location, length);
  uint64_t v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  smilMap = self->_smilMap;
  self->_smilMap = v11;

  if (v6) {
    double v13 = 0.5;
  }
  else {
    double v13 = 0.0;
  }
  if (length)
  {
    if (length == 1)
    {
      unsigned __int8 v14 = 0;
      if (!v6)
      {
LABEL_18:
        if (length == 1) {
          [(BKBookViewController *)self pauseReadAloud];
        }
        goto LABEL_20;
      }
    }
    else
    {
      unsigned __int8 v14 = [(BKBookViewController *)self _isFocusedOnSecondPageOfSpread];
      if (!v6) {
        goto LABEL_18;
      }
    }
    if ((v14 & 1) == 0)
    {
      if ([(NSArray *)self->_smilMap count])
      {
        if (self->_autoTurn)
        {
          BOOL v15 = [(NSArray *)self->_smilMap objectAtIndex:0];
          unint64_t v16 = [v15 objectForKey:@"ordinal"];
          if (location - 1 != (int)[v16 intValue]) {
            double v13 = 3.0;
          }
        }
      }
      else
      {
        double v13 = 3.0;
      }
    }
    goto LABEL_18;
  }
LABEL_20:
  +[IMSleepManager startSleepTimer];
  unsigned int v17 = [(BKBookViewController *)self performSelectorProxy];
  +[NSObject cancelPreviousPerformRequestsWithTarget:v17 selector:"_playNextItem" object:0];

  if (v13 == 0.0)
  {
    [(BKBookViewController *)self _playNextItem];
  }
  else
  {
    id v18 = [(BKBookViewController *)self performSelectorProxy];
    [v18 performSelector:"_playNextItem" withObject:0 afterDelay:v13];
  }
}

- (id)smilMapOnPages:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  p_pagesForMap = &self->_pagesForMap;
  BOOL v7 = a3.location == self->_pagesForMap.location && a3.length == self->_pagesForMap.length;
  if (!v7 || (int64_t v8 = self->_smilMap) == 0)
  {
    -[BKBookViewController _prepareSmilMapOn:](self, "_prepareSmilMapOn:", location, length);
    int64_t v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    p_pagesForMap->NSUInteger location = location;
    p_pagesForMap->NSUInteger length = length;
  }

  return v8;
}

- (id)contentViewControllerForMediaOverlayElement:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(BKBookViewController *)self contentViewControllers];
  BOOL v6 = [v5 allValues];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 document];
        int64_t v12 = [v11 href];
        double v13 = [v4 documentHref];
        unsigned int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_removeHighlightOnElement:(id)a3
{
  if (self->_highlightedElement == a3)
  {
    id v4 = a3;
    id v6 = [(BKBookViewController *)self contentViewControllerForMediaOverlayElement:v4];
    [v6 clearMediaOverlayElement:v4];

    highlightedElement = self->_highlightedElement;
    self->_highlightedElement = 0;
  }
}

- (void)_highlightElement:(id)a3
{
  id v4 = (BKMediaOverlayElement *)a3;
  [(BKBookViewController *)self _removeHighlightOnElement:self->_highlightedElement];
  highlightedElement = self->_highlightedElement;
  self->_highlightedElement = v4;
  id v6 = v4;

  id v7 = [(BKBookViewController *)self contentViewControllerForMediaOverlayElement:v6];
  [v7 highlightMediaOverlayElement:v6];
}

- (unint64_t)_itemIndexForCurrentPage
{
  return 0;
}

- (BOOL)_isPageEmpty:(_NSRange)a3
{
  id v3 = -[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", a3.location, a3.length);
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (BOOL)_isPageAllZeros:(_NSRange)a3
{
  id v3 = -[BKBookViewController smilMapOnPages:](self, "smilMapOnPages:", a3.location, a3.length);
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKey:@"smil" v15];
          id v10 = [v9 audioStart];
          uint64_t v11 = [v9 audioEnd];
          unsigned int v12 = [v10 isEqualToNumber:v11];

          if (!v12)
          {
            BOOL v13 = 0;
            goto LABEL_12;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_12:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)_prepareSmilMapOn:(_NSRange)a3
{
  return 0;
}

- (void)_nextDelayedPageHint:(id)a3
{
  id v4 = [a3 BOOLValue];

  [(BKBookViewController *)self _nextPageHint:v4];
}

- (void)_nextPageHint:(BOOL)a3 afterDelay:(double)a4
{
  id v6 = +[NSNumber numberWithBool:a3];
  [(BKBookViewController *)self performSelector:"_nextDelayedPageHint:" withObject:v6 afterDelay:a4];
}

- (BOOL)_isManualCurlInProgress
{
  return 0;
}

- (BOOL)_isFocusedOnSecondPageOfSpread
{
  return 0;
}

- (void)playCurrentSoundtrack
{
  if (self->_isPlayingSoundTrack)
  {
    id v10 = [(BKBookViewController *)self currentSoundtrack];
    if (v10)
    {
      id v3 = [(BKBookViewController *)self book];
      id v4 = [v3 basePlusContentPath];
      id v5 = [v4 stringByAppendingPathComponent:v10];

      id v6 = [v5 stringByStandardizingPath];
      uint64_t v7 = +[NSURL fileURLWithPath:v6 isDirectory:0];
      uint64_t v8 = [(BKBookViewController *)self _trackPlayer];
      [v8 setAssetURL:v7];

      [(IMAVPlayer *)self->_trackPlayer setLoops:0xFFFFFFFFLL];
      [(IMAVPlayer *)self->_trackPlayer play];
      id v9 = +[BCAudioMuxingCoordinator sharedInstance];
      [v9 notifyPlaybackWillStart:self];
    }
    else
    {
      [(BKBookViewController *)self stopSoundtrack];
    }
  }
}

- (void)stopSoundtrack
{
}

- (void)stopSoundtrackAndReload:(BOOL)a3
{
  BOOL v3 = a3;
  [(IMAVPlayer *)self->_trackPlayer pause];
  if (v3)
  {
    id v6 = [(IMAVPlayer *)self->_trackPlayer assetURL];
    id v5 = +[AVAsset assetWithURL:v6];
    [(IMAVPlayer *)self->_trackPlayer setAsset:v5];
  }
}

- (id)currentSoundtrack
{
  return 0;
}

- (void)audioPlaybackWillStart:(id)a3
{
  if (a3 != self)
  {
    [(BKBookViewController *)self setReadAloudState:0];
    [(BKBookViewController *)self setTrackState:0 persistSetting:0];
    [(BKBookViewController *)self stopPlayingMedia:0];
  }
}

- (void)_reportLoadFailedAlertForError:(id)a3
{
  id v4 = a3;
  id v5 = AEBundle();
  id v6 = [v5 localizedStringForKey:@"Failed to load book because the requested resource is missing." value:&stru_1DF0D8 table:0];

  uint64_t v7 = +[UIAlertController alertControllerWithTitle:v6 message:0 preferredStyle:1];
  uint64_t v8 = AEBundle();
  id v9 = [v8 localizedStringForKey:@"OK" value:&stru_1DF0D8 table:0];
  unsigned int v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  unsigned int v14 = sub_62454;
  long long v15 = &unk_1DC1D0;
  long long v16 = self;
  id v17 = v4;
  id v10 = v4;
  uint64_t v11 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&v12];
  [v7 addAction:v11, v12, v13, v14, v15, v16];

  [(BKBookViewController *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_reportResourceUnavailableForBookWithTitle:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = AEBundle();
  id v9 = [v8 localizedStringForKey:@"Cannot Open Book" value:&stru_1DF0D8 table:0];

  if ([v6 length])
  {
    id v10 = AEBundle();
    uint64_t v11 = [v10 localizedStringForKey:@"Cannot Open “%@”" value:&stru_1DF0D8 table:0];
    uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v6);

    id v9 = (void *)v12;
  }
  uint64_t v13 = AEBundle();
  unsigned int v14 = [v13 localizedStringForKey:@"It is formatted incorrectly, or is not a format that Apple Books can open.", &stru_1DF0D8, 0 value table];

  long long v15 = AEBundle();
  long long v16 = [v15 localizedStringForKey:@"Close" value:&stru_1DF0D8 table:0];

  id v17 = +[UIAlertController alertControllerWithTitle:v9 message:v14 preferredStyle:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_626D0;
  v20[3] = &unk_1DC1D0;
  v20[4] = self;
  id v21 = v7;
  id v18 = v7;
  long long v19 = +[UIAlertAction actionWithTitle:v16 style:1 handler:v20];
  [v17 addAction:v19];

  [(BKBookViewController *)self presentViewController:v17 animated:1 completion:0];
}

- (void)contentFailedToLoadWithError:(id)a3
{
  id v4 = (char *)a3;
  id v5 = BCIMLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v22 = "-[BKBookViewController contentFailedToLoadWithError:]";
    __int16 v23 = 2080;
    id v24 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
    __int16 v25 = 1024;
    int v26 = 6933;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  id v6 = BCIMLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "@\"Showing Load Failed Alert -- %@\"", buf, 0xCu);
  }

  id v7 = [v4 domain];
  if ([v7 isEqualToString:NSURLErrorDomain])
  {
    id v8 = [v4 code];

    if (v8 == (id)-1008)
    {
      id v9 = [(BKBookViewController *)self book];
      id v10 = [v9 bookTitle];

      uint64_t v11 = BCIMLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v22 = "-[BKBookViewController contentFailedToLoadWithError:]";
        __int16 v23 = 2080;
        id v24 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
        __int16 v25 = 1024;
        int v26 = 6938;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      uint64_t v12 = BCIMLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v10;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "@\"Load Failed Alert for book: %@\"", buf, 0xCu);
      }

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_62A8C;
      block[3] = &unk_1DC1F8;
      void block[4] = self;
      long long v19 = v10;
      uint64_t v20 = v4;
      uint64_t v13 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_17;
    }
  }
  else
  {
  }
  unsigned int v14 = [v4 domain];
  unsigned int v15 = [v14 isEqualToString:kCFErrorDomainCFNetwork];

  if (!v15
    && ([v4 domain],
        long long v16 = objc_claimAutoreleasedReturnValue(),
        unsigned int v17 = [v16 isEqualToString:NSURLErrorDomain],
        v16,
        !v17)
    || [v4 code] != (id)-999)
  {
    [(BKBookViewController *)self performSelectorOnMainThread:"_reportLoadFailedAlertForError:" withObject:v4 waitUntilDone:0];
  }
LABEL_17:
}

- (void)contentViewFailedToLoad:(id)a3 error:(id)a4
{
}

- (id)noteEditorHighlightedTextFont
{
  return +[UIFont systemFontOfSize:12.0];
}

- (id)fullScreenNoteEditorForAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(BKBookViewController *)self theme];
  id v6 = [v5 shouldInvertContent];

  id v7 = [v4 annotationNote];
  BOOL v8 = [v7 length] == 0;

  id v9 = objc_alloc_init((Class)AENoteFullscreenEditorController);
  [v9 setEditsOnLaunch:v8];
  id v10 = [(BKBookViewController *)self noteEditorHighlightedTextFont];
  [v9 setHighlightedTextFont:v10];

  [v9 setAnnotation:v4];
  [v9 setDelegate:self];
  [v9 setShouldDim:v6];
  uint64_t v11 = [(BKBookViewController *)self theme];
  [v9 setTheme:v11];

  return v9;
}

- (void)showNoteEditorForAnnotation:(id)a3
{
  id v4 = a3;
  [(AENotePopoverEditorController *)self->_noteEditor setDelegate:0];
  noteEditor = self->_noteEditor;
  self->_noteEditor = 0;

  id v6 = (AENotePopoverEditorController *)objc_alloc_init((Class)AENotePopoverEditorController);
  id v7 = self->_noteEditor;
  self->_noteEditor = v6;

  [(AENotePopoverEditorController *)self->_noteEditor setAnnotation:v4];
  BOOL v8 = [(BKBookViewController *)self theme];
  id v9 = [v8 annotationPageTheme];

  id v10 = [AEAnnotationTheme themeForAnnotationStyle:[v4 annotationStyle] pageTheme:v9 isUnderline:[v4 annotationIsUnderline]];
  [(AENotePopoverEditorController *)self->_noteEditor setAnnotationTheme:v10];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = [(BKBookViewController *)self theme];
    [(AENotePopoverEditorController *)self->_noteEditor setTheme:v11];
  }
  [(AENotePopoverEditorController *)self->_noteEditor setDelegate:self];
  uint64_t v12 = [v4 annotationNote];
  BOOL v13 = [v12 length] == 0;

  [(AENotePopoverEditorController *)self->_noteEditor setEditsOnLaunch:v13];
  if (([(BKBookViewController *)self im_isCompactWidth] & 1) != 0
    || ([(BKBookViewController *)self im_isCompactHeight] & 1) != 0)
  {
    unsigned int v14 = [(BKBookViewController *)self fullScreenNoteEditorForAnnotation:v4];
    [(BKBookViewController *)self setControlsVisible:1 animated:1];
    [(BKBookViewController *)self presentViewController:v14 animated:1 completion:0];
  }
  else
  {
    unsigned int v15 = [(BKBookViewController *)self contentViewControllerForAnnotation:v4];
    unsigned int v14 = v15;
    if (v15)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_62DE4;
      v16[3] = &unk_1DB440;
      id v17 = v15;
      id v18 = self;
      [v17 rectForAnnotation:v4 withCompletion:v16];
    }
  }
}

- (BOOL)isEditingAnnotation:(id)a3
{
  id v4 = [a3 annotationUuid];
  id v5 = [(AENotePopoverEditorController *)self->_noteEditor annotation];
  id v6 = [v5 annotationUuid];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  return v7;
}

- (void)didHideAnnotationEditor:(id)a3
{
  id v4 = (AENotePopoverEditorController *)a3;
  id v5 = [(AENotePopoverEditorController *)v4 annotation];
  if ([v5 isInserted]
    && ([v5 annotationNote],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 length],
        v6,
        !v7))
  {
    id v10 = [(BKBookViewController *)self book];
    [v10 deleteAnnotation:v5];
  }
  else
  {
    BOOL v8 = [v5 managedObjectContext];
    id v15 = 0;
    unsigned __int8 v9 = [v8 save:&v15];
    id v10 = v15;

    if ((v9 & 1) == 0 && v10)
    {
      uint64_t v11 = BCIMLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v17 = "-[BKBookViewController didHideAnnotationEditor:]";
        __int16 v18 = 2080;
        long long v19 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Controllers/BKBookViewController.m";
        __int16 v20 = 1024;
        int v21 = 7074;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      uint64_t v12 = BCIMLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = (const char *)v10;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "@\"Save Error: %@\"", buf, 0xCu);
      }
    }
  }

  p_noteEditor = &self->_noteEditor;
  if (self->_noteEditor == v4)
  {
    [(AENotePopoverEditorController *)v4 setDelegate:0];
    goto LABEL_15;
  }
  p_noteEditor = &self->_colorEditor;
  if (self->_colorEditor == v4)
  {
    [(AENotePopoverEditorController *)v4 removeFromParentViewController];
LABEL_15:
    unsigned int v14 = *p_noteEditor;
    *p_noteEditor = 0;
  }
  [(BKBookViewController *)self clearSelectedAnnotation];
}

- (void)editorController:(id)a3 editNote:(id)a4
{
}

- (void)editorController:(id)a3 setTheme:(id)a4 forAnnotation:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = [v7 annotationStyle];
  id v9 = [v7 isUnderline];

  id v12 = v6;
  [v12 setAnnotationStyle:v8];
  [v12 setAnnotationIsUnderline:v9];

  id v10 = +[NSUserDefaults standardUserDefaults];
  [v10 setInteger:(int)v8 forKey:BKDefaultHighlightColor[0]];

  uint64_t v11 = +[NSUserDefaults standardUserDefaults];
  [v11 setBool:v9 forKey:BKDefaultUnderlineState];
}

- (void)editorController:(id)a3 deleteAnnotation:(id)a4
{
  id v5 = a4;
  id v6 = [(BKBookViewController *)self book];
  [v6 deleteAnnotation:v5];

  id v7 = [(BKBookViewController *)self searchResult];

  if (v7)
  {
    id v8 = [(BKBookViewController *)self searchResult];
    [(BKBookViewController *)self highlightSearchResult:v8];
  }
}

- (_NSRange)pageRangeForAnnotation:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___BKBookmark])
  {
    id v5 = [(BKBookViewController *)self paginationController];
    uint64_t v6 = (uint64_t)[v5 pageRangeForAnnotation:v4];
    NSUInteger v8 = v7;
  }
  else
  {
    NSUInteger v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)chapterTitleForAnnotation:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___BKBookmark])
  {
    id v5 = [(BKBookViewController *)self paginationController];
    id v6 = [v5 pageRangeForAnnotation:v4];
    int64_t v8 = -[BKBookViewController pageNumberFromRange:](self, "pageNumberFromRange:", v6, v7);

    NSUInteger v9 = [(BKBookViewController *)self titleForChapterAtPageNumber:v8];
  }
  else
  {
    NSUInteger v9 = 0;
  }

  return v9;
}

- (void)editorController:(id)a3 editedAnnotation:(id)a4 toText:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  [v6 setAnnotationNote:v7];
  int64_t v8 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    NSUInteger v9 = [v6 annotationAssetID];
    NSUInteger v10 = [v6 annotationUuid];
    int v12 = 138412546;
    BOOL v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "edit annotation note: assetID: %@, uuid: %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = BKMobileCloudSyncAnnotationsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_137B20();
  }
}

- (void)editorController:(id)a3 shareAnnotation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 presentationRect];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  long long v16 = [v7 presentationView];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_636D4;
  v17[3] = &unk_1DC220;
  void v17[4] = self;
  -[BKBookViewController shareAnnotation:fromRect:inView:completion:](self, "shareAnnotation:fromRect:inView:completion:", v6, v16, v17, v9, v11, v13, v15);
}

- (BOOL)editorController:(id)a3 isSharingEnabledForAnnotation:(id)a4
{
  id v5 = a4;
  if ([(BKBookViewController *)self isSharingSupported])
  {
    id v6 = objc_opt_class();
    id v7 = [(BKBookViewController *)self book];
    if ([v6 areCitationsAllowedForBook:v7])
    {
      double v8 = [v5 annotationSelectedText];
      BOOL v9 = [v8 length] != 0;
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

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return 0;
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return 0;
}

- (id)transitionContentBackgroundColor
{
  uint64_t v3 = [(BKBookViewController *)self theme];
  id v4 = [v3 backgroundColorForTraitEnvironment:self];

  return v4;
}

- (id)transitionContentView
{
  BCReportAssertionFailureWithMessage();

  return [(BKBookViewController *)self view];
}

- (BOOL)transitionRightToLeft
{
  return [(BKBookViewController *)self pageProgressionDirection] == 1;
}

- (void)_paginationComplete:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(BKBookViewController *)self paginationController];

  id v6 = _AEPaginationLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4 != v5)
  {
    if (v7)
    {
      double v8 = [(BKBookViewController *)self paginationController];
      int v14 = 138412546;
      double v15 = self;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "IGNORING paginationComplete BVC:%@ paginationController:%@", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_4;
  }
  if (v7)
  {
    BOOL v9 = [(BKBookViewController *)self paginationController];
    int v14 = 138412546;
    double v15 = self;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Received paginationComplete BVC:%@ paginationController:%@", (uint8_t *)&v14, 0x16u);
  }
  double v10 = [(BKBookViewController *)self assetViewControllerDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    double v12 = [(BKBookViewController *)self assetViewControllerDelegate];
    [v12 assetViewControllerPaginationCompletedForBook:self];
  }
  if ([(BKBookViewController *)self _inAnalyticsReadSession])
  {
    double v13 = [(BKBookViewController *)self analyticsReadStartProgress];

    if (!v13)
    {
      id v6 = [(BKBookViewController *)self _currentReadingProgress];
      [(BKBookViewController *)self setAnalyticsReadStartProgress:v6];
LABEL_4:
    }
  }
}

- (void)buildContextTree:(id)a3
{
  id v39 = a3;
  id v4 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v31 = self;
  id v5 = [(BKBookViewController *)self book];
  id v6 = [v5 sortedDocuments];

  id obj = v6;
  id v32 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v32)
  {
    uint64_t v7 = 0;
    uint64_t v30 = *(void *)v45;
    uint64_t v38 = BCProgressContextTreeKey_uniqueID;
    uint64_t v37 = BCProgressContextTreeKey_title;
    uint64_t v36 = BCProgressContextTreeKey_displayOrder;
    uint64_t v35 = BCProgressContextTreeKey_cfi;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        double v10 = [(BKBookViewController *)v31 book];
        char v11 = [v10 navigationInfosForDocument:v9];

        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v34 = v11;
        id v12 = [v34 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v12)
        {
          id v13 = v12;
          double v33 = i;
          uint64_t v14 = *(void *)v41;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              __int16 v16 = v4;
              if (*(void *)v41 != v14) {
                objc_enumerationMutation(v34);
              }
              id v17 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
              __int16 v18 = [v17 valueForKey:@"href"];
              long long v19 = [v17 valueForKey:@"name"];
              uint64_t v20 = [v39 objectForKeyedSubscript:v18];
              int v21 = (void *)v20;
              id v22 = &stru_1DF0D8;
              if (v20) {
                id v22 = (__CFString *)v20;
              }
              __int16 v23 = v22;

              v48[0] = v38;
              v48[1] = v37;
              v49[0] = v18;
              v49[1] = v19;
              v48[2] = v36;
              id v24 = +[NSNumber numberWithInteger:(char *)j + v7];
              v48[3] = v35;
              v49[2] = v24;
              v49[3] = v23;
              __int16 v25 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];

              id v4 = v16;
              [v16 addObject:v25];
            }
            id v13 = [v34 countByEnumeratingWithState:&v40 objects:v50 count:16];
            v7 += (uint64_t)j;
          }
          while (v13);
          i = v33;
        }
      }
      id v32 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v32);
  }

  if ([v4 count])
  {
    int v26 = +[BCProgressKitController sharedController];
    long long v27 = [(BKBookViewController *)v31 book];
    long long v28 = [v27 assetID];
    [v26 buildContextTree:v4 forBook:v28 completion:0];
  }
}

- (void)_handleExternalLoadRequest:(id)a3 likelyUserInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BKBookViewController *)self assetViewControllerDelegate];
  [v7 assetViewController:self requestOpenURL:v6 likelyUserInitiated:v4];
}

- (BOOL)_controller:(id)a3 handleInternalRequestForURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v7 bc_pathWithoutPrecedingSlash];
  uint64_t v9 = [v8 stringByRemovingURLFragment];
  double v10 = [(BKBookViewController *)self book];
  char v11 = [v10 documentAtPath:v9];

  if ([(BKBookViewController *)self isTOCURL:v7])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_64050;
    v20[3] = &unk_1DAB88;
    v20[4] = self;
    [(BKViewController *)self hideOverlayViewControllerWithCompletion:v20];
    goto LABEL_9;
  }
  id v12 = [v11 documentOrdinal];
  if ([v12 integerValue] == (id)-1)
  {

    goto LABEL_8;
  }
  id v13 = [v11 nonlinearElement];
  unsigned int v14 = [v13 BOOLValue];

  if (v14)
  {
LABEL_8:
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_6405C;
    v17[3] = &unk_1DBF08;
    id v18 = v7;
    long long v19 = self;
    [(BKViewController *)self hideOverlayViewControllerWithCompletion:v17];

    goto LABEL_9;
  }
  if (v8)
  {
    [v6 dismissViewControllerAnimated:1 completion:0];
    double v15 = [v7 fragment];
    [(BKBookViewController *)self goToPath:v8 fragment:v15 animated:1];
  }
LABEL_9:

  return 0;
}

- (void)hoverInteraction:(id)a3 didChangeStateForRegionWithKeys:(id)a4
{
  id v7 = (BCUIHoverInteraction *)a3;
  id v6 = a4;
  if (self->_hoverInteraction == v7
    && [(BCUIHoverInteraction *)v7 isHovering]
    && self->_section != 1
    && [v6 containsObject:@"control"]
    && [(BCUIHoverInteraction *)v7 stateForRegionWithKey:@"control"])
  {
    [(BKBookViewController *)self setControlsVisible:1 animated:1];
    self->_controlsEnabledViaHover = 1;
  }
}

- (void)hoverInteractionDidSettle:(id)a3
{
  id v4 = a3;
  if (([v4 stateForRegionWithKey:@"control"] & 1) == 0
    && [v4 isHovering]
    && !self->_section
    && self->_controlsEnabledViaHover
    && [(BKBookViewController *)self canDismissControls])
  {
    [(BKBookViewController *)self setControlsVisible:0 animated:1];
    self->_controlsEnabledViaHover = 0;
  }
}

- (void)rebuildHoverRegions
{
  hoverInteraction = self->_hoverInteraction;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_64350;
  v3[3] = &unk_1DC248;
  v3[4] = self;
  [(BCUIHoverInteraction *)hoverInteraction rebuildRegionWithKey:@"control" block:v3];
}

- (BOOL)canDismissControls
{
  return 1;
}

- (id)analyticsReadingSettingsData
{
  return 0;
}

- (id)readingSessionData
{
  return [(BKBookViewController *)self readingSessionDataForSearchViewController:0];
}

- (id)contentData
{
  return [(BKBookViewController *)self contentDataForSearchViewController:0];
}

- (id)contentSubType
{
  return +[BAContentSubType unknown];
}

- (BAContentSettingsData)analyticsContentSettingData
{
  if ([(BKBookViewController *)self _inAnalyticsReadSession])
  {
    uint64_t v3 = [(BKBookViewController *)self book];
    id v4 = [v3 annotationProvider];
    id v5 = [v4 uiManagedObjectContext];

    [(BKBookViewController *)self bookmarksFetchRequestForBook:v3 moc:v5];
    v24 = id v29 = 0;
    id v6 = [v5 executeFetchRequest:error:];
    id v23 = v29;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v7);
          }
          double v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          unsigned int v16 = [v15 annotationType];
          if (v16 == 2)
          {
            if ([v15 annotationHasNote]) {
              ++v11;
            }
            else {
              ++v12;
            }
          }
          else if (v16 == 1)
          {
            ++v10;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }

    id v18 = objc_alloc((Class)BAContentSettingsData);
    long long v19 = +[NSNumber numberWithUnsignedInteger:v10];
    uint64_t v20 = +[NSNumber numberWithUnsignedInteger:v11];
    int v21 = +[NSNumber numberWithUnsignedInteger:v12];
    id v17 = [v18 initWithBookmarkCount:v19 noteCount:v20 highlightCount:v21];
  }
  else
  {
    id v17 = [objc_alloc((Class)BAContentSettingsData) initWithBookmarkCount:&off_1E9380 noteCount:&off_1E9380 highlightCount:&off_1E9380];
  }

  return (BAContentSettingsData *)v17;
}

- (void)emitScrubEventStartPosition:(int64_t)a3 endPosition:(int64_t)a4 totalLength:(int64_t)a5
{
  id v15 = [(BKBookViewController *)self analyticsReadingSettingsData];
  id v9 = +[BAEventReporter sharedReporter];
  uint64_t v10 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  uint64_t v11 = [(BKBookViewController *)self contentDataForSearchViewController:0];
  uint64_t v12 = +[NSNumber numberWithInteger:a3];
  uint64_t v13 = +[NSNumber numberWithInteger:a4];
  unsigned int v14 = +[NSNumber numberWithInteger:a5];
  [v9 emitScrubEventWithTracker:v10 contentData:v11 readingSettingsData:v15 startPosition:v12 endPosition:v13 totalLength:v14];
}

- (void)bc_analyticsVisibilityDidAppear
{
  uint64_t v3 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  if ([v3 optedIn])
  {
    objc_initWeak(&location, self);
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_6486C;
    id v9 = &unk_1DC270;
    objc_copyWeak(&v10, &location);
    +[BADoNotDisturbHelper fetchCurrentState:&v6];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    [(BKBookViewController *)self setDoNotDisturbStatusAtStart:0];
  }
  id v4 = +[NSDate date];
  [(BKBookViewController *)self setAnalyticsReadStartDate:v4];

  id v5 = [(BKBookViewController *)self _currentReadingProgress];
  [(BKBookViewController *)self setAnalyticsReadStartProgress:v5];
}

- (void)bc_analyticsVisibilityWillDisappear
{
  uint64_t v3 = [(BKBookViewController *)self ba_effectiveAnalyticsTracker];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_64BA0;
  v25[4] = sub_64BB0;
  id v26 = [v3 newSessionAssertion];
  id v4 = [(BKBookViewController *)self contentData];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(BKBookViewController *)self cachedContentData];
  }
  uint64_t v7 = v6;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = sub_64BA0;
  v23[4] = sub_64BB0;
  id v24 = [(BKBookViewController *)self analyticsReadStartDate];
  if (v7)
  {
    int64_t v8 = [(BKBookViewController *)self doNotDisturbStatusAtStart];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_64BB8;
    v17[3] = &unk_1DC310;
    id v18 = v3;
    long long v19 = self;
    int v21 = v23;
    id v22 = v25;
    id v20 = v7;
    [(BKBookViewController *)self _newBADoNotDisturbDataWithStartStatus:v8 tracker:v18 completion:v17];

    id v9 = v18;
  }
  else
  {
    id v9 = BCCurrentBookLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v10 = [(BKBookViewController *)self assetViewControllerDelegate];
      sub_137BA4(v10, buf, v9);
    }
  }

  uint64_t v11 = [(BKBookViewController *)self analyticsReadStartDate];
  [v11 timeIntervalSinceNow];
  double v13 = v12;

  unsigned int v14 = [(BKBookViewController *)self _analyticsSessionHost];
  id v15 = [(BKBookViewController *)self asset];
  unsigned int v16 = [v15 assetID];
  [v14 readSessionDidEnd:v16 readTime:-v13];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
}

- (id)_contentSettingsDataFromReadingSessionData:(id)a3 optedIn:(BOOL)a4
{
  if (a4)
  {
    id v6 = a3;
    uint64_t v7 = [v6 percentCompletionStart];
    [v7 floatValue];
    float v9 = v8;

    id v10 = [v6 percentCompletionEnd];

    [v10 floatValue];
    float v12 = v11;

    BOOL v13 = v12 >= 0.5 && v9 < 0.5;
    if (v13 || (unsigned int v14 = 0, v12 >= 0.9) && v9 < 0.9)
    {
      unsigned int v14 = [(BKBookViewController *)self analyticsContentSettingData];
    }
  }
  else
  {
    unsigned int v14 = 0;
  }
  return v14;
}

- (void)_newBADoNotDisturbDataWithStartStatus:(int64_t)a3 tracker:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    if ([v7 optedIn])
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_65198;
      v10[3] = &unk_1DC338;
      int64_t v12 = a3;
      id v11 = v8;
      +[BADoNotDisturbHelper fetchCurrentState:v10];
    }
    else
    {
      id v9 = [objc_alloc((Class)BADoNotDisturbData) initWithStartStatus:0 endStatus:0];
      (*((void (**)(id, id))v8 + 2))(v8, v9);
    }
  }
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  NSUInteger v2 = [(BKBookViewController *)self assetViewControllerDelegate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 1;
}

- (BOOL)_inAnalyticsReadSession
{
  NSUInteger v2 = [(BKBookViewController *)self analyticsReadStartDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_analyticsSessionHost
{
  NSUInteger v2 = [(BKBookViewController *)self im_ancestorViewControllerConformingToProtocol:&OBJC_PROTOCOL___BASessionHostProviding];
  BOOL v3 = [v2 analyticsSessionHost];

  return v3;
}

- (void)handleVoiceOverStatusChanged:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    [(BKBookViewController *)self setControlsVisible:1 animated:0];
  }
}

- (void)handleSwitchControlStatusChanged:(id)a3
{
  if (UIAccessibilityIsSwitchControlRunning())
  {
    [(BKBookViewController *)self setControlsVisible:1 animated:0];
  }
}

- (void)updateUIForSmartInvert
{
  id v3 = +[IMTheme isAutoNightModeEnabled];
  id v4 = [(BKBookViewController *)self viewIfLoaded];
  [v4 setAccessibilityIgnoresInvertColors:v3];
}

- (BOOL)bkaxNeedsPersistentControls
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSCommandAndControlEnabled())
  {
    return 1;
  }

  return _IMAccessibilityIsFKAEnabledWithKeyboardAttached();
}

+ (BOOL)useEnhancedEditMenu
{
  return 1;
}

- (IMPerformSelectorProxy)performSelectorProxy
{
  return self->_performSelectorProxy;
}

- (void)setPerformSelectorProxy:(id)a3
{
}

- (UIViewController)activityViewController
{
  return self->_activityViewController;
}

- (void)setActivityViewController:(id)a3
{
}

- (AENotePopoverEditorController)noteEditor
{
  return self->_noteEditor;
}

- (AEAssetOpenAnimating)contentOpenAnimator
{
  return self->_contentOpenAnimator;
}

- (void)setContentOpenAnimator:(id)a3
{
}

- (NSObject)bookPositionProcessor
{
  return self->bookPositionProcessor;
}

- (void)setBookPositionProcessor:(id)a3
{
}

- (AEBookInfo)book
{
  return self->_book;
}

- (AEAssetViewControllerDelegate)assetViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetViewControllerDelegate);

  return (AEAssetViewControllerDelegate *)WeakRetained;
}

- (void)setAssetViewControllerDelegate:(id)a3
{
}

- (NSMutableDictionary)contentViewControllers
{
  return self->_contentViewControllers;
}

- (BOOL)controlsVisible
{
  return self->_controlsVisible;
}

- (int64_t)pageCountIncludingUpsell
{
  return self->_pageCountIncludingUpsell;
}

- (BKLocation)location
{
  return self->_location;
}

- (BOOL)playNextItemAbortedWhileInactive
{
  return self->_playNextItemAbortedWhileInactive;
}

- (void)setPlayNextItemAbortedWhileInactive:(BOOL)a3
{
  self->_playNextItemAbortedWhileInactive = a3;
}

- (BOOL)isRotationInProgress
{
  return self->_rotationInProgress;
}

- (void)setRotationInProgress:(BOOL)a3
{
  self->_rotationInProgress = a3;
}

- (int)selectionHighlightType
{
  return self->_selectionHighlightType;
}

- (void)setSelectionHighlightType:(int)a3
{
  self->_selectionHighlightType = a3;
}

- (BKSearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (BKActionController)actionController
{
  return self->_actionController;
}

- (void)setActionController:(id)a3
{
}

- (void)setResumeLocation:(id)a3
{
}

- (BKExpandedContentViewController)expandedContentViewController
{
  return self->_expandedContentViewController;
}

- (void)setNavigationHistory:(id)a3
{
}

- (BKPaginationController)paginationController
{
  return self->_paginationController;
}

- (BKPageNavigationViewController)pageNavigationViewController
{
  return self->_pageNavigationViewController;
}

- (void)setPageNavigationViewController:(id)a3
{
}

- (int)section
{
  return self->_section;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (BKFootnoteViewController2)footnoteController
{
  return self->_footnoteController;
}

- (void)setFootnoteController:(id)a3
{
}

- (BOOL)userNavigated
{
  return self->_userNavigated;
}

- (void)setUserNavigated:(BOOL)a3
{
  self->_userNavigated = a3;
}

- (BAUpSellData)upSellData
{
  return self->_upSellData;
}

- (void)setUpSellData:(id)a3
{
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return self->_appAnalyticsAdditionalData;
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
}

- (BCTouchBarController)touchBarController
{
  return self->_touchBarController;
}

- (void)setTouchBarController:(id)a3
{
}

- (BOOL)bkaxAccessibilityUserIsRequestingControlsVisibilityToggle
{
  return self->_bkaxAccessibilityUserIsRequestingControlsVisibilityToggle;
}

- (void)setBkaxAccessibilityUserIsRequestingControlsVisibilityToggle:(BOOL)a3
{
  self->_bkaxAccessibilityUserIsRequestingControlsVisibilityToggle = a3;
}

- (AEAnnotationProvider)annotationProvider
{
  return self->_annotationProvider;
}

- (void)setAnnotationProvider:(id)a3
{
}

- (NSNumber)analyticsReadStartProgress
{
  return self->_analyticsReadStartProgress;
}

- (void)setAnalyticsReadStartProgress:(id)a3
{
}

- (BKLocation)tocCurrentLocation
{
  return self->_tocCurrentLocation;
}

- (void)setTocCurrentLocation:(id)a3
{
}

- (unint64_t)pageNumberBeforeScrubbing
{
  return self->_pageNumberBeforeScrubbing;
}

- (void)setPageNumberBeforeScrubbing:(unint64_t)a3
{
  self->_pageNumberBeforeScrubbing = a3;
}

- (BOOL)safeToShowToolbarItems
{
  return self->_safeToShowToolbarItems;
}

- (void)setSafeToShowToolbarItems:(BOOL)a3
{
  self->_safeToShowToolbarItems = a3;
}

- (UIView)footnoteSourceView
{
  return self->_footnoteSourceView;
}

- (void)setFootnoteSourceView:(id)a3
{
}

- (BKLocation)openingLocation
{
  return self->_openingLocation;
}

- (void)setOpeningLocation:(id)a3
{
}

- (BOOL)annotationChangeRequiresPaginationUpdate
{
  return self->_annotationChangeRequiresPaginationUpdate;
}

- (void)setAnnotationChangeRequiresPaginationUpdate:(BOOL)a3
{
  self->_annotationChangeRequiresPaginationUpdate = a3;
}

- (NSNumber)readingLocationHighwaterMark
{
  return self->_readingLocationHighwaterMark;
}

- (void)setReadingLocationHighwaterMark:(id)a3
{
}

- (BKBrightnessController)brightnessController
{
  return self->_brightnessController;
}

- (void)setBrightnessController:(id)a3
{
}

- (BKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (BCDisplaySleepController)displaySleepController
{
  return self->_displaySleepController;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
}

- (NSString)priceString
{
  return self->_priceString;
}

- (void)setPriceString:(id)a3
{
}

- (BKLocation)reportedLocation
{
  return self->_reportedLocation;
}

- (void)setReportedLocation:(id)a3
{
}

- (void)setCurrentBookCacheItem:(id)a3
{
}

- (BCAugmentedExperienceManager)experienceManager
{
  return self->_experienceManager;
}

- (void)setExperienceManager:(id)a3
{
}

- (int64_t)lastAnalyticsDeviceOrientationReported
{
  return self->_lastAnalyticsDeviceOrientationReported;
}

- (void)setLastAnalyticsDeviceOrientationReported:(int64_t)a3
{
  self->_lastAnalyticsDeviceOrientationReported = a3;
}

- (BAContentData)cachedContentData
{
  return self->_cachedContentData;
}

- (void)setCachedContentData:(id)a3
{
}

- (NSHashTable)bookmarkObservers
{
  return self->_bookmarkObservers;
}

- (void)setBookmarkObservers:(id)a3
{
}

- (void)setHasRemoteResources:(BOOL)a3
{
  self->_hasRemoteResources = a3;
}

- (BOOL)hasCheckedForRemoteResources
{
  return self->_hasCheckedForRemoteResources;
}

- (void)setHasCheckedForRemoteResources:(BOOL)a3
{
  self->_hasCheckedForRemoteResources = a3;
}

- (BCDDParsecCollectionViewController)referenceLibraryViewController
{
  return self->_referenceLibraryViewController;
}

- (void)setReferenceLibraryViewController:(id)a3
{
}

- (LTUITranslationViewController)translationViewController
{
  return self->_translationViewController;
}

- (void)setTranslationViewController:(id)a3
{
}

- (int64_t)doNotDisturbStatusAtStart
{
  return self->_doNotDisturbStatusAtStart;
}

- (void)setDoNotDisturbStatusAtStart:(int64_t)a3
{
  self->_doNotDisturbStatusAtStart = a3;
}

- (NSDate)analyticsReadStartDate
{
  return self->_analyticsReadStartDate;
}

- (void)setAnalyticsReadStartDate:(id)a3
{
}

- (BCUIHoverInteraction)hoverInteraction
{
  return self->_hoverInteraction;
}

- (BOOL)controlsEnabledViaHover
{
  return self->_controlsEnabledViaHover;
}

- (void)setControlsEnabledViaHover:(BOOL)a3
{
  self->_controlsEnabledViaHover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverInteraction, 0);
  objc_storeStrong((id *)&self->_analyticsReadStartDate, 0);
  objc_storeStrong((id *)&self->_translationViewController, 0);
  objc_storeStrong((id *)&self->_referenceLibraryViewController, 0);
  objc_storeStrong((id *)&self->_bookmarkObservers, 0);
  objc_storeStrong((id *)&self->_cachedContentData, 0);
  objc_storeStrong((id *)&self->_experienceManager, 0);
  objc_storeStrong((id *)&self->_currentBookCacheItem, 0);
  objc_storeStrong((id *)&self->_reportedLocation, 0);
  objc_storeStrong((id *)&self->_priceString, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_displaySleepController, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_brightnessController, 0);
  objc_storeStrong((id *)&self->_readingLocationHighwaterMark, 0);
  objc_storeStrong((id *)&self->_openingLocation, 0);
  objc_storeStrong((id *)&self->_footnoteSourceView, 0);
  objc_storeStrong((id *)&self->_tocCurrentLocation, 0);
  objc_storeStrong((id *)&self->_analyticsReadStartProgress, 0);
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_storeStrong((id *)&self->_touchBarController, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAdditionalData, 0);
  objc_storeStrong((id *)&self->_upSellData, 0);
  objc_storeStrong((id *)&self->_footnoteController, 0);
  objc_destroyWeak((id *)&self->_assetViewControllerDelegate);
  objc_storeStrong((id *)&self->bookPositionProcessor, 0);
  objc_storeStrong((id *)&self->_contentOpenAnimator, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_performSelectorProxy, 0);
  objc_storeStrong((id *)&self->_appearanceContainerViewController, 0);
  objc_storeStrong((id *)&self->_appearanceNavigationController, 0);
  objc_storeStrong((id *)&self->_appearanceViewController, 0);
  objc_storeStrong((id *)&self->_colorEditor, 0);
  objc_storeStrong((id *)&self->_noteEditor, 0);
  objc_storeStrong((id *)&self->_pageBookmarksFRC, 0);
  objc_storeStrong((id *)&self->_highlightedElement, 0);
  objc_storeStrong((id *)&self->_loadedPages, 0);
  objc_storeStrong((id *)&self->_currentMapItem, 0);
  objc_storeStrong((id *)&self->_smilMap, 0);
  objc_storeStrong((id *)&self->_trackPlayer, 0);
  objc_storeStrong((id *)&self->_readPlayer, 0);
  objc_storeStrong((id *)&self->_contentLoadQueue, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_expandedContentViewController, 0);
  objc_storeStrong((id *)&self->_navigationHistory, 0);
  objc_storeStrong((id *)&self->_resumeLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_searchViewController, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_upsellContentViewController, 0);
  objc_storeStrong((id *)&self->_contentViewControllers, 0);
  objc_storeStrong((id *)&self->_paginationController, 0);
  objc_storeStrong((id *)&self->_pageNavigationViewController, 0);
  objc_storeStrong((id *)&self->_bookMoc, 0);

  objc_storeStrong((id *)&self->_book, 0);
}

@end