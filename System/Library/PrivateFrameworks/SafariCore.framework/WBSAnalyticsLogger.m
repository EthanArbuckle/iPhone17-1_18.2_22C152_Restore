@interface WBSAnalyticsLogger
+ (id)sharedLogger;
- (WBSAnalyticsLogger)initWithQueue:(id)a3;
- (id)_builtInImageNameToSimpleName:(id)a3;
- (id)_bundleIdDictionaryWithArray:(id)a3;
- (id)_nameForStartPageSection:(int64_t)a3;
- (id)_sanitizedPathExtensionForAnalyticsForPathExtension:(id)a3;
- (void)_didAddBookmarkWithMethod:(id)a3 menuItemType:(id)a4;
- (void)_logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 integerValue:(int64_t)a5;
- (void)_logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 stringValue:(id)a5;
- (void)_sendEvent:(id)a3;
- (void)_sendEvent:(id)a3 usingBlock:(id)a4;
- (void)_sendEventAddingVersionInfo:(id)a3 baseEvent:(id)a4;
- (void)_sendEventAddingVersionInfo:(id)a3 usingBlock:(id)a4;
- (void)didAcceptCompletionItemOfType:(int64_t)a3 atRank:(unint64_t)a4;
- (void)didAcceptSearchSuggestionOfType:(int64_t)a3;
- (void)didActivateLinkWithZoomScale:(float)a3 recentlyZoomedIn:(BOOL)a4;
- (void)didActivateReaderWithTrigger:(int64_t)a3;
- (void)didActivateVoiceSearchAccidentally:(BOOL)a3;
- (void)didAddBookmarkFromToolbarMenuWithItemType:(int64_t)a3;
- (void)didAddBookmarkWithMethod:(int64_t)a3;
- (void)didAddNumberOfBookmarksInMemory:(unint64_t)a3;
- (void)didAddReadingListItemWithMethod:(int64_t)a3;
- (void)didAddWebClip;
- (void)didBanWebsiteWithMetadata:(id)a3;
- (void)didCancelScribble;
- (void)didChangeStartPageSectionVisibility:(id)a3 visible:(BOOL)a4;
- (void)didChooseCustomPassword;
- (void)didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt:(id)a3;
- (void)didChooseStrongPasswordWithoutSpecialCharacters;
- (void)didChooseToEditStrongPassword;
- (void)didChooseTopHit:(BOOL)a3 matchLength:(unint64_t)a4 matchScore:(float)a5;
- (void)didClearBrowsingDataFromInterval:(int64_t)a3 withMethod:(int64_t)a4;
- (void)didClearScribble;
- (void)didClearStartPageBackgroundImage;
- (void)didClickEntityCardSBA;
- (void)didClickFindInPageSBA;
- (void)didClickSparkleSBA;
- (void)didClickSummaryCardSBA;
- (void)didClickWebsiteSettingsSBA;
- (void)didClickZoomInSBA;
- (void)didClickZoomOutSBA;
- (void)didClickZoomSelectorSBA;
- (void)didCloseTabWithTrigger:(int64_t)a3 tabClosingAction:(int64_t)a4 numberOfTabsClosed:(unint64_t)a5 tabCollectionViewType:(int64_t)a6;
- (void)didCloseTabWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4;
- (void)didCloseTabsAutomaticallyWithCount:(unint64_t)a3 tabClosingInterval:(id)a4;
- (void)didCloseVisualTabPickerWithMethod:(int64_t)a3;
- (void)didContinueUserActivityOfType:(int64_t)a3;
- (void)didConvertExtensionWithKeySupport:(id)a3;
- (void)didCreateNewTabGroup;
- (void)didCreateNewTabGroupFromTheDropDownMenu;
- (void)didCreateTabGroupFromLocation:(int64_t)a3 prepopulatedWithTabs:(BOOL)a4;
- (void)didDeleteBookmarkInMemory;
- (void)didDeleteNumberOfBookmarksInMemory:(unint64_t)a3;
- (void)didDetectLanguageOfWebpage:(id)a3 primaryLocale:(id)a4 webpageCanBeTranslatedToPrimaryLocale:(BOOL)a5 canOfferTranslation:(BOOL)a6 firstNonPrimaryLocaleThatCanBeTranslatedTo:(id)a7 numberOfPreferredLocales:(unint64_t)a8 notificationLevel:(int64_t)a9;
- (void)didDetectPossibleUserTrackingInHostApp:(id)a3 urlHasIDFA:(BOOL)a4 urlHasQueryString:(BOOL)a5 userInteracted:(BOOL)a6 viewControllerIsHidden:(BOOL)a7;
- (void)didDetermineReaderAvailability:(BOOL)a3;
- (void)didDismissCompletionListWithItemAccepted:(BOOL)a3 goKeyTapped:(BOOL)a4 unifiedFieldContentType:(int64_t)a5;
- (void)didDismissSwitchToSafariBanner;
- (void)didDownvoteDataSourceWithMetadata:(id)a3;
- (void)didDragAndDropCustomStartPageBackgroundImage;
- (void)didEnableScribble;
- (void)didEngageWithStartPageSection:(int64_t)a3;
- (void)didEnterBackgroundWithBookmarksInMemory;
- (void)didEnterTabViewWithMethod:(int64_t)a3;
- (void)didFindOnPageWithTrigger:(int64_t)a3;
- (void)didFinishPageLoadWithPageLoadStatus:(int64_t)a3;
- (void)didFinishScribble:(unint64_t)a3;
- (void)didHideMoreItems;
- (void)didInjectScriptForExtensionWithIdentifier:(id)a3;
- (void)didInvokeToolbarButtonForExtensionWithIdentifier:(id)a3;
- (void)didLaunchPasswordsApp;
- (void)didLoadTabContent:(int64_t)a3;
- (void)didManuallyMarkReadingListItemAsRead:(BOOL)a3;
- (void)didModifyPerSitePreferencesWithPreferenceIdentifier:(id)a3 modificationLevel:(int64_t)a4 type:(int64_t)a5 method:(int64_t)a6;
- (void)didMoveToBackgroundWithNumberOfOnGoingDownloads:(unint64_t)a3;
- (void)didNavigateToFrequentlyVisitedSiteByAnyMeansWithAnalyticsPayload:(id)a3;
- (void)didOpenClearHistoryFromSource:(id)a3;
- (void)didOpenCloudTabsItemWithPosition:(int64_t)a3;
- (void)didOpenNewBlankTabWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4;
- (void)didOpenNewTabWithURLWithTrigger:(int64_t)a3 isExternalLink:(BOOL)a4 tabCollectionViewType:(int64_t)a5;
- (void)didOpenNewTabWithURLWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4;
- (void)didOpenPerSitePreferencesPopoverVia:(int64_t)a3;
- (void)didOpenReadingListItemWithPosition:(int64_t)a3;
- (void)didOpenReadingListItemWithReachableNetwork:(BOOL)a3 isContinuousTransition:(BOOL)a4;
- (void)didOpenRecentlyClosedTabsItemWithPosition:(int64_t)a3;
- (void)didOpenRecommendationWithMetadata:(id)a3 withPosition:(int64_t)a4;
- (void)didOpenTabGroupDropDownMenu;
- (void)didOpenVisualTabPickerWithMethod:(int64_t)a3;
- (void)didPerformActionOnDownloadsPopover:(int64_t)a3;
- (void)didPerformDownloadsFileEvent:(int64_t)a3 withFileType:(id)a4;
- (void)didPerformMoreMenuAction:(int64_t)a3;
- (void)didPerformSafeBrowsingAction:(int64_t)a3 fromSource:(int64_t)a4;
- (void)didPerformVisualTabPickerMiscEvent:(int64_t)a3;
- (void)didPresentUsernamePrompt;
- (void)didPreventBookmarkActionWithBookmarkType:(int64_t)a3 actionType:(int64_t)a4;
- (void)didPrintPage;
- (void)didReceiveAnalyticsEventFromWebKitWithName:(id)a3 description:(id)a4 payload:(id)a5;
- (void)didReloadEvent:(int64_t)a3 withReloadType:(int64_t)a4 withReloadProvenance:(int64_t)a5 withLayout:(int64_t)a6;
- (void)didRemoveFrequentlyVisitedSiteWithAnalyticsPayload:(id)a3;
- (void)didRemoveSiteSpecificSearchProvider;
- (void)didRequestPageShowingSideBar:(BOOL)a3;
- (void)didRequestSearchSuggestions;
- (void)didRequestTranslatingToLocale:(id)a3 webpageLocale:(id)a4 requestType:(int64_t)a5 isTargetLocalePrimaryLocale:(BOOL)a6;
- (void)didRetrieveNumberOfFavorites:(unint64_t)a3;
- (void)didRetrieveNumberOfFrequentlyVisitedSites:(unint64_t)a3;
- (void)didRetrieveNumberOfRecommendations:(unint64_t)a3 numberOfTopics:(unint64_t)a4;
- (void)didRevealDownloadWithMIMEType:(id)a3 uti:(id)a4 result:(int64_t)a5;
- (void)didSaveInMemoryBookmarksToSideFile;
- (void)didSelectBrowserChoice:(id)a3 browserAlreadyInstalled:(BOOL)a4 browsersWithProductPagesViewed:(id)a5 browserList:(id)a6 userCohort:(int64_t)a7 listContainsDisabledBrowser:(BOOL)a8 userTriedSelectingDisabledBrowser:(BOOL)a9;
- (void)didSelectFavoriteWithOpenLocation:(int64_t)a3;
- (void)didSelectFavoritesRow:(int64_t)a3;
- (void)didSelectFrequentlyVisitedSiteWithOpenLocation:(int64_t)a3 analyticsPayload:(id)a4;
- (void)didSelectNewStrongPassword;
- (void)didSelectNotNowForUsePasswordsApp;
- (void)didSelectStartPrivateWindowInDropDownMenu;
- (void)didSelectTabGroupInDropDownMenu;
- (void)didSelectUsePasswordsApp;
- (void)didSelectXForNewStrongPassword;
- (void)didSendTabGroup;
- (void)didSetBuiltInStartPageBackgroundImage;
- (void)didSetCustomStartPageBackgroundImage;
- (void)didSetDownloadFolderToProviderWithIdentifier:(id)a3 isDefaultFolder:(BOOL)a4;
- (void)didSetPrivateBrowsingEnabled:(BOOL)a3;
- (void)didShowBrowserChoiceScreen:(id)a3;
- (void)didShowEntityCardSBA;
- (void)didShowPasswordGenerationPromptWithPasswordAccepted:(BOOL)a3;
- (void)didShowSafeBrowsingWarningWithSource:(int64_t)a3;
- (void)didShowSparkleSBA;
- (void)didShowSummaryCardSBA;
- (void)didSnapBack;
- (void)didStartDragWithDragContentType:(int64_t)a3;
- (void)didSubmitFormOfType:(unint64_t)a3 withFieldType:(int64_t)a4 elementType:(unint64_t)a5 isAutoFilled:(BOOL)a6 isManuallyFilledByUser:(BOOL)a7 modificationType:(unint64_t)a8 autoFillOfferedType:(unint64_t)a9 webpageLocale:(id)a10;
- (void)didSubmitFormOfType:(unint64_t)a3 withPerFormModificationsDictionary:(id)a4 webpageLocale:(id)a5;
- (void)didSubmitFormOfType:(unint64_t)a3 withPerFormUsageDictionary:(id)a4 webpageLocale:(id)a5;
- (void)didSuggestUsernameInPromptAndUserKeptSuggestion:(BOOL)a3;
- (void)didSurfaceNewStrongPasswordView;
- (void)didSurfaceUsePasswordsAppView;
- (void)didSwitchToSafari:(id)a3 entryPoint:(id)a4;
- (void)didSwitchToTabGroupFromLocation:(int64_t)a3;
- (void)didTakeActionOnClearHistory:(id)a3;
- (void)didToggleMagicMenuSBA;
- (void)didToggleReaderSBA;
- (void)didToggleShowLessButtonForSection:(int64_t)a3;
- (void)didToggleShowMoreButtonForSection:(int64_t)a3;
- (void)didToggleShowMoreButtonForSection:(int64_t)a3 isShowingMore:(BOOL)a4;
- (void)didUseCreditCardAutoFillEscapeHatchFillingNewType:(id)a3 forPreviousType:(id)a4 fieldType:(int64_t)a5;
- (void)didUseGeneratedPassword;
- (void)didUseSidebarAction:(int64_t)a3;
- (void)didViewBrowserProductPage:(id)a3;
- (void)didVisitBookmarksWithOpenLocation:(int64_t)a3 numberOfBookmarksVisited:(unint64_t)a4;
- (void)didVisitWebpageSBAWithUserOptedIn:(BOOL)a3;
- (void)generatedPasswordDidOverwriteExistingPasswordWithTrigger:(int64_t)a3;
- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4;
- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 result:(int64_t)a5;
- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 value:(id)a5;
- (void)performOnAnalyticsQueueWithDelay:(int64_t)a3 block:(id)a4;
- (void)recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier:(id)a3 searchProviderIdentifier:(id)a4 provenance:(int64_t)a5;
- (void)registerSafariVersion:(id)a3 persona:(int64_t)a4;
- (void)reportAdvancedPrivacyProtectionPreference;
- (void)reportAllProcessInfo:(id)a3;
- (void)reportApplicationCacheSize:(unint64_t)a3;
- (void)reportAudioIndicatorClickEvent:(int64_t)a3;
- (void)reportAutomaticTabClosingInterval:(id)a3;
- (void)reportAverageNumberOfTabsPerTabGroup:(int64_t)a3 andMaximum:(int64_t)a4;
- (void)reportBlockingSafariQuitWithReason:(int64_t)a3;
- (void)reportCustomizationSyncEnablement:(BOOL)a3;
- (void)reportExperimentalFeaturesOnLaunchForWebXREnabled:(BOOL)a3 webXRGamepadsModuleEnabled:(BOOL)a4 webXRHandInputModuleEnabled:(BOOL)a5 modelElementEnabled:(BOOL)a6;
- (void)reportFirstInteractionAfterTranslation:(int64_t)a3 maxVisibleHeightPercentage:(float)a4;
- (void)reportIOSToolbarButtonUsage:(int64_t)a3 withLayout:(int64_t)a4;
- (void)reportInvalidMessageFromWebProcess:(id)a3;
- (void)reportIsUsingPasswordsApp:(BOOL)a3 isUsingCredentialProviderExtension:(BOOL)a4;
- (void)reportMacOSToolbarButtonUsage:(int64_t)a3 withLayout:(int64_t)a4;
- (void)reportNewTabBehavior:(int64_t)a3;
- (void)reportNewWindowBehavior:(int64_t)a3;
- (void)reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount:(unint64_t)a3 allDuplicatesCount:(unint64_t)a4;
- (void)reportNumberOfExtensionsWithFrequencyDictionaryProvider:(id)a3;
- (void)reportNumberOfPinnedTabs:(unint64_t)a3;
- (void)reportNumberOfTabGroups:(int64_t)a3;
- (void)reportNumberOfTabs:(int64_t)a3;
- (void)reportNumberOfTabsPerWindow:(int64_t)a3;
- (void)reportNumberOfWebApps:(int64_t)a3 andBookmarks:(int64_t)a4;
- (void)reportNumberOfWebsitesWithScribbleActive:(unint64_t)a3;
- (void)reportNumberOfWindows:(int64_t)a3;
- (void)reportOverlayStatusBarIsEnabled:(BOOL)a3;
- (void)reportPictureInPictureEvent:(int64_t)a3;
- (void)reportPrivateBrowsingUsage:(int64_t)a3;
- (void)reportPrivateRelayModulePromptEvent:(id)a3;
- (void)reportSVCToolbarButtonUsage:(int64_t)a3;
- (void)reportSafariTabStateMismatchWithError:(int64_t)a3 systemTALEnabled:(BOOL)a4 safariRestoreOnLaunchEnabled:(BOOL)a5 excludePrivateWindows:(BOOL)a6 systemSaysPreserveState:(BOOL)a7 stringRepresentation:(id)a8;
- (void)reportSafariVersion:(id)a3 safariAndWebKitVersion:(id)a4;
- (void)reportShowFullURLInSmartSearchFieldPreference:(BOOL)a3;
- (void)reportShowStandaloneTabBarPreference:(BOOL)a3;
- (void)reportStartPageBackgroundImageVisible:(BOOL)a3;
- (void)reportStartPageBackgroundName:(id)a3;
- (void)reportStartPageOverrideStatistics:(id)a3;
- (void)reportStartPageSectionVisibility:(int64_t)a3 visible:(BOOL)a4;
- (void)reportStartPageVisibility;
- (void)reportStatusForExtensions:(id)a3 extensionType:(id)a4;
- (void)reportTabGroupSyncFinishedWithInfo:(id)a3;
- (void)reportTabGroupSyncSuccessesWithCount:(id)a3;
- (void)reportTabUpdatedWithUpdateType:(int64_t)a3;
- (void)reportTabsForNonTabGroupUser:(int64_t)a3 andAverageNumber:(int64_t)a4;
- (void)reportUnifiedFieldEvent:(int64_t)a3;
- (void)reportUnifiedFieldHistoryItemURLAutocompletedEventWithDaysSinceLastVisit:(id)a3;
- (void)reportUnifiedFieldSearchSlowDown:(double)a3;
- (void)reportUnifiedTabBarStatusWithLayout:(int64_t)a3 numberOfTabsInCurrentTabBar:(unint64_t)a4 tabBarIsCurrentlyScrollable:(BOOL)a5 tabsShowOnlyIcons:(BOOL)a6 backgroundColorInTabBarEnabled:(BOOL)a7;
- (void)reportUserConsentStateSBA:(id)a3;
- (void)reportUserPreferencesOnLaunchForJavaScriptEnabled:(BOOL)a3 safeBrowsingEnabled:(BOOL)a4 siteSpecificSearchEnabled:(BOOL)a5 trackingPolicy:(unint64_t)a6;
- (void)reportVerificationCodeProvider:(id)a3;
- (void)reportWeakPasswordWarningEvent:(int64_t)a3;
- (void)reportWebContentProcessInfo:(id)a3;
- (void)safariDidBeginTerminationWithReason:(int64_t)a3;
- (void)safariDidCancelTermination;
- (void)webExtensionBackgroundPage:(id)a3 livedTooLong:(double)a4;
@end

@implementation WBSAnalyticsLogger

+ (id)sharedLogger
{
  if (+[WBSAnalyticsLogger sharedLogger]::once != -1) {
    dispatch_once(&+[WBSAnalyticsLogger sharedLogger]::once, &__block_literal_global_0);
  }
  v2 = (void *)+[WBSAnalyticsLogger sharedLogger]::shared;
  return v2;
}

- (void)reportTabUpdatedWithUpdateType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSAnalyticsLogger_reportTabUpdatedWithUpdateType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.DidModifyTab" usingBlock:v3];
}

- (void)_sendEventAddingVersionInfo:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSAnalyticsLogger__sendEventAddingVersionInfo_usingBlock___block_invoke;
  block[3] = &unk_1E6159A08;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __61__WBSAnalyticsLogger__sendEventAddingVersionInfo_usingBlock___block_invoke(uint64_t a1)
{
  if (AnalyticsIsEventUsed())
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_sendEventAddingVersionInfo:baseEvent:", *(void *)(a1 + 32));
  }
}

id __53__WBSAnalyticsLogger_reportTabUpdatedWithUpdateType___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"tabUpdateChangeType";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 0xB) {
    id v2 = @"navigation";
  }
  else {
    id v2 = off_1E615A560[v1];
  }
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)_sendEventAddingVersionInfo:(id)a3 baseEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke;
  aBlock[3] = &unk_1E6159A30;
  id v8 = v7;
  id v16 = v8;
  v17 = self;
  id v9 = v6;
  id v18 = v9;
  id v10 = _Block_copy(aBlock);
  v11 = v10;
  if (self->_persona && self->_safariVersion)
  {
    (*((void (**)(void *))v10 + 2))(v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke_2;
    v12[3] = &unk_1E6159A30;
    v12[4] = self;
    id v13 = v9;
    id v14 = v8;
    [(WBSAnalyticsLogger *)self performOnAnalyticsQueueWithDelay:5 block:v12];
  }
}

- (void)performOnAnalyticsQueueWithDelay:(int64_t)a3 block:(id)a4
{
  int64_t v5 = 1000000000 * a3;
  dispatch_block_t block = a4;
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_after(v6, (dispatch_queue_t)self->_analyticsSynchronizationQueue, block);
}

void __34__WBSAnalyticsLogger_sharedLogger__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.Safari.Analytics", v0);

  unint64_t v1 = [[WBSAnalyticsLogger alloc] initWithQueue:v3];
  id v2 = (void *)+[WBSAnalyticsLogger sharedLogger]::shared;
  +[WBSAnalyticsLogger sharedLogger]::shared = (uint64_t)v1;
}

- (WBSAnalyticsLogger)initWithQueue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSAnalyticsLogger;
  dispatch_time_t v6 = [(WBSAnalyticsLogger *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_analyticsSynchronizationQueue, a3);
    id v8 = v7;
  }

  return v7;
}

id __64__WBSAnalyticsLogger_didRetrieveNumberOfFrequentlyVisitedSites___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"itemCount";
  unint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didRetrieveNumberOfFrequentlyVisitedSites:(unint64_t)a3
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSAnalyticsLogger_didRetrieveNumberOfFrequentlyVisitedSites___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __64__WBSAnalyticsLogger_didRetrieveNumberOfFrequentlyVisitedSites___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (void)registerSafariVersion:(id)a3 persona:(int64_t)a4
{
  id v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__WBSAnalyticsLogger_registerSafariVersion_persona___block_invoke;
  block[3] = &unk_1E61596F8;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __52__WBSAnalyticsLogger_registerSafariVersion_persona___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  *(void *)(*(void *)(a1 + 32) + 16) = *(void *)(a1 + 48);
}

- (void)recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier:(id)a3 searchProviderIdentifier:(id)a4 provenance:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __126__WBSAnalyticsLogger_recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier_searchProviderIdentifier_provenance___block_invoke;
  block[3] = &unk_1E61596F8;
  id v14 = v9;
  id v15 = v8;
  int64_t v16 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __126__WBSAnalyticsLogger_recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier_searchProviderIdentifier_provenance___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __126__WBSAnalyticsLogger_recordSearchResultPageImpressionWithDefaultSearchProviderIdentifier_searchProviderIdentifier_provenance___block_invoke_2(uint64_t a1)
{
  v13[6] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) length];
  if ([*(id *)(a1 + 32) length]) {
    uint64_t v3 = [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v3 = 0;
  }
  v12[0] = @"defaultSearchProviderIdentifier";
  v12[1] = @"searchProviderIdentifier";
  v4 = *(__CFString **)(a1 + 32);
  if (!v4) {
    v4 = &stru_1F105D3F0;
  }
  v13[0] = *(void *)(a1 + 40);
  v13[1] = v4;
  v12[2] = @"isSearch";
  id v5 = [NSNumber numberWithBool:v2 != 0];
  v13[2] = v5;
  v12[3] = @"usesDefaultSearchProvider";
  id v6 = [NSNumber numberWithBool:v3];
  v13[3] = v6;
  v12[4] = @"isReferredByUnifiedField";
  id v7 = [NSNumber numberWithBool:*(void *)(a1 + 48) == 1];
  v13[4] = v7;
  void v12[5] = @"provenance";
  unint64_t v8 = *(void *)(a1 + 48) - 1;
  if (v8 > 2) {
    id v9 = @"Unknown";
  }
  else {
    id v9 = off_1E6159D18[v8];
  }
  v13[5] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:6];

  return v10;
}

- (void)didRequestSearchSuggestions
{
}

void *__49__WBSAnalyticsLogger_didRequestSearchSuggestions__block_invoke()
{
  return &unk_1F1086518;
}

- (void)reportWeakPasswordWarningEvent:(int64_t)a3
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__WBSAnalyticsLogger_reportWeakPasswordWarningEvent___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __53__WBSAnalyticsLogger_reportWeakPasswordWarningEvent___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __53__WBSAnalyticsLogger_reportWeakPasswordWarningEvent___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"warningEvent";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    uint64_t v2 = @"show password detail view with warning";
  }
  else {
    uint64_t v2 = off_1E6159D30[v1];
  }
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didRevealDownloadWithMIMEType:(id)a3 uti:(id)a4 result:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSAnalyticsLogger_didRevealDownloadWithMIMEType_uti_result___block_invoke;
  block[3] = &unk_1E61596F8;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __63__WBSAnalyticsLogger_didRevealDownloadWithMIMEType_uti_result___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __63__WBSAnalyticsLogger_didRevealDownloadWithMIMEType_uti_result___block_invoke_2(void *a1)
{
  v8[3] = *MEMORY[0x1E4F143B8];
  unint64_t v1 = @"<unknown type>";
  v7[0] = @"MIMEType";
  v7[1] = @"UTI";
  id v2 = (__CFString *)a1[4];
  if (!v2) {
    id v2 = @"<unknown type>";
  }
  if (a1[5]) {
    unint64_t v1 = (__CFString *)a1[5];
  }
  v8[0] = v2;
  v8[1] = v1;
  v7[2] = @"result";
  unint64_t v3 = a1[6] - 1;
  if (v3 > 2) {
    v4 = @"reveal in Files app with magnifying glass";
  }
  else {
    v4 = off_1E6159D48[v3];
  }
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  return v5;
}

- (void)didMoveToBackgroundWithNumberOfOnGoingDownloads:(unint64_t)a3
{
  if (a3)
  {
    analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__WBSAnalyticsLogger_didMoveToBackgroundWithNumberOfOnGoingDownloads___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    void block[4] = a3;
    dispatch_async(analyticsSynchronizationQueue, block);
  }
}

uint64_t __70__WBSAnalyticsLogger_didMoveToBackgroundWithNumberOfOnGoingDownloads___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __70__WBSAnalyticsLogger_didMoveToBackgroundWithNumberOfOnGoingDownloads___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"numberOfDownloads";
  unint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didSetDownloadFolderToProviderWithIdentifier:(id)a3 isDefaultFolder:(BOOL)a4
{
  id v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__WBSAnalyticsLogger_didSetDownloadFolderToProviderWithIdentifier_isDefaultFolder___block_invoke;
  v9[3] = &unk_1E61597D0;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);
}

void __83__WBSAnalyticsLogger_didSetDownloadFolderToProviderWithIdentifier_isDefaultFolder___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __83__WBSAnalyticsLogger_didSetDownloadFolderToProviderWithIdentifier_isDefaultFolder___block_invoke_2(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  id v1 = *(__CFString **)(a1 + 32);
  if (!v1) {
    id v1 = @"Unspecified";
  }
  v5[1] = @"isDefaultFolder";
  v6[0] = v1;
  v5[0] = @"providerIdentifier";
  id v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)didDownvoteDataSourceWithMetadata:(id)a3
{
  id v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_didDownvoteDataSourceWithMetadata___block_invoke;
  block[3] = &unk_1E6159820;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __56__WBSAnalyticsLogger_didDownvoteDataSourceWithMetadata___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __56__WBSAnalyticsLogger_didDownvoteDataSourceWithMetadata___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)didBanWebsiteWithMetadata:(id)a3
{
  id v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WBSAnalyticsLogger_didBanWebsiteWithMetadata___block_invoke;
  block[3] = &unk_1E6159820;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __48__WBSAnalyticsLogger_didBanWebsiteWithMetadata___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __48__WBSAnalyticsLogger_didBanWebsiteWithMetadata___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)didRetrieveNumberOfRecommendations:(unint64_t)a3 numberOfTopics:(unint64_t)a4
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __72__WBSAnalyticsLogger_didRetrieveNumberOfRecommendations_numberOfTopics___block_invoke;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = a3;
  v5[5] = a4;
  dispatch_async(analyticsSynchronizationQueue, v5);
}

uint64_t __72__WBSAnalyticsLogger_didRetrieveNumberOfRecommendations_numberOfTopics___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __72__WBSAnalyticsLogger_didRetrieveNumberOfRecommendations_numberOfTopics___block_invoke_2(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"recommendationCount";
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v6[1] = @"topicCount";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didOpenRecommendationWithMetadata:(id)a3 withPosition:(int64_t)a4
{
  id v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__WBSAnalyticsLogger_didOpenRecommendationWithMetadata_withPosition___block_invoke;
  v9[3] = &unk_1E61598B0;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);
}

void __69__WBSAnalyticsLogger_didOpenRecommendationWithMetadata_withPosition___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __69__WBSAnalyticsLogger_didOpenRecommendationWithMetadata_withPosition___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  unint64_t v3 = v2;
  unint64_t v4 = *(void *)(a1 + 40);
  if (v4 > 4) {
    id v5 = &stru_1F105D3F0;
  }
  else {
    id v5 = off_1E615A298[v4];
  }
  [v2 setObject:v5 forKeyedSubscript:@"openLocation"];
  return v3;
}

- (void)didOpenReadingListItemWithPosition:(int64_t)a3
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__WBSAnalyticsLogger_didOpenReadingListItemWithPosition___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __57__WBSAnalyticsLogger_didOpenReadingListItemWithPosition___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __57__WBSAnalyticsLogger_didOpenReadingListItemWithPosition___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"openLocation";
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 4) {
    id v2 = &stru_1F105D3F0;
  }
  else {
    id v2 = off_1E615A298[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didOpenCloudTabsItemWithPosition:(int64_t)a3
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WBSAnalyticsLogger_didOpenCloudTabsItemWithPosition___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __55__WBSAnalyticsLogger_didOpenCloudTabsItemWithPosition___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __55__WBSAnalyticsLogger_didOpenCloudTabsItemWithPosition___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"openLocation";
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 4) {
    id v2 = &stru_1F105D3F0;
  }
  else {
    id v2 = off_1E615A298[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didOpenRecentlyClosedTabsItemWithPosition:(int64_t)a3
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSAnalyticsLogger_didOpenRecentlyClosedTabsItemWithPosition___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __64__WBSAnalyticsLogger_didOpenRecentlyClosedTabsItemWithPosition___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __64__WBSAnalyticsLogger_didOpenRecentlyClosedTabsItemWithPosition___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"openLocation";
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 4) {
    id v2 = &stru_1F105D3F0;
  }
  else {
    id v2 = off_1E615A298[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (id)_nameForStartPageSection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8) {
    return @"Favorites";
  }
  else {
    return off_1E6159D60[a3 - 1];
  }
}

- (void)didToggleShowMoreButtonForSection:(int64_t)a3 isShowingMore:(BOOL)a4
{
}

id __70__WBSAnalyticsLogger_didToggleShowMoreButtonForSection_isShowingMore___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"section";
  id v2 = [*(id *)(a1 + 32) _nameForStartPageSection:*(void *)(a1 + 40)];
  v6[1] = @"result";
  v7[0] = v2;
  if (*(unsigned char *)(a1 + 48)) {
    unint64_t v3 = @"Show More";
  }
  else {
    unint64_t v3 = @"Show Less";
  }
  v7[1] = v3;
  unint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didToggleShowMoreButtonForSection:(int64_t)a3
{
}

- (void)didToggleShowLessButtonForSection:(int64_t)a3
{
}

- (void)didRetrieveNumberOfFavorites:(unint64_t)a3
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WBSAnalyticsLogger_didRetrieveNumberOfFavorites___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a3;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __51__WBSAnalyticsLogger_didRetrieveNumberOfFavorites___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __51__WBSAnalyticsLogger_didRetrieveNumberOfFavorites___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = @"itemCount";
  unint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didReceiveAnalyticsEventFromWebKitWithName:(id)a3 description:(id)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"Safari"]) {
    [@"com.apple.Safari." stringByAppendingString:v8];
  }
  else {
  int64_t v11 = [@"com.apple.WebKit." stringByAppendingString:v8];
  }
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__WBSAnalyticsLogger_didReceiveAnalyticsEventFromWebKitWithName_description_payload___block_invoke;
  v15[3] = &unk_1E6159900;
  id v16 = v11;
  id v17 = v10;
  id v13 = v10;
  id v14 = v11;
  dispatch_async(analyticsSynchronizationQueue, v15);
}

void __85__WBSAnalyticsLogger_didReceiveAnalyticsEventFromWebKitWithName_description_payload___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  AnalyticsSendEventLazy();
}

id __85__WBSAnalyticsLogger_didReceiveAnalyticsEventFromWebKitWithName_description_payload___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportStatusForExtensions:(id)a3 extensionType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__WBSAnalyticsLogger_reportStatusForExtensions_extensionType___block_invoke;
  v11[3] = &unk_1E6159900;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(analyticsSynchronizationQueue, v11);
}

void __62__WBSAnalyticsLogger_reportStatusForExtensions_extensionType___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (AnalyticsIsEventUsed())
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v2)
    {
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = v2;
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(obj);
          }
          unint64_t v4 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v24[0] = @"extensionIdentifier";
          id v5 = [v4 identifier];
          v25[0] = v5;
          v24[1] = @"enabled";
          id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "enabled"));
          v24[2] = @"extensionType";
          uint64_t v7 = *(void *)(a1 + 40);
          v25[1] = v6;
          v25[2] = v7;
          id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

          if ([*(id *)(a1 + 40) isEqualToString:@"WebExtension"])
          {
            v22[0] = @"manifestVersion";
            id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "manifestVersion"));
            v23[0] = v9;
            v22[1] = @"allWebsitesPermissionLevel";
            id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "allWebsitesPermissionLevel"));
            v23[1] = v10;
            v22[2] = @"websitesGrantedAccessCount";
            int64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "websitesGrantedAccessCount"));
            v23[2] = v11;
            v22[3] = @"websitesDeniedAccessCount";
            id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "websitesDeniedAccessCount"));
            v23[3] = v12;
            id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
            uint64_t v14 = objc_msgSend(v8, "safari_dictionaryByMergingWithDictionary:", v13);

            id v8 = (void *)v14;
          }
          AnalyticsSendEvent();
        }
        uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v2);
    }
  }
}

- (void)reportNumberOfExtensionsWithFrequencyDictionaryProvider:(id)a3
{
  id v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__WBSAnalyticsLogger_reportNumberOfExtensionsWithFrequencyDictionaryProvider___block_invoke;
  block[3] = &unk_1E6159950;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __78__WBSAnalyticsLogger_reportNumberOfExtensionsWithFrequencyDictionaryProvider___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

uint64_t __78__WBSAnalyticsLogger_reportNumberOfExtensionsWithFrequencyDictionaryProvider___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didInjectScriptForExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __64__WBSAnalyticsLogger_didInjectScriptForExtensionWithIdentifier___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Extensions.Invoked" usingBlock:v6];
}

id __64__WBSAnalyticsLogger_didInjectScriptForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  return extensionInvokedMetric(*(NSString **)(a1 + 32), 0);
}

- (void)didInvokeToolbarButtonForExtensionWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __71__WBSAnalyticsLogger_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Extensions.Invoked" usingBlock:v6];
}

id __71__WBSAnalyticsLogger_didInvokeToolbarButtonForExtensionWithIdentifier___block_invoke(uint64_t a1)
{
  return extensionInvokedMetric(*(NSString **)(a1 + 32), 1);
}

- (void)didFinishPageLoadWithPageLoadStatus:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__WBSAnalyticsLogger_didFinishPageLoadWithPageLoadStatus___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.PageFinishedLoad" usingBlock:v3];
}

id __58__WBSAnalyticsLogger_didFinishPageLoadWithPageLoadStatus___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"loadStatus";
  id v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didActivateLinkWithZoomScale:(float)a3 recentlyZoomedIn:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__WBSAnalyticsLogger_didActivateLinkWithZoomScale_recentlyZoomedIn___block_invoke;
  v4[3] = &__block_descriptor_37_e19___NSDictionary_8__0l;
  float v5 = a3;
  BOOL v6 = a4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.LinkActivated" usingBlock:v4];
}

id __68__WBSAnalyticsLogger_didActivateLinkWithZoomScale_recentlyZoomedIn___block_invoke(uint64_t a1, double a2)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"pageZoomScale";
  LODWORD(a2) = *(_DWORD *)(a1 + 32);
  unint64_t v3 = [NSNumber numberWithFloat:a2];
  v7[1] = @"pageRecentlyZoomedIn";
  v8[0] = v3;
  id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 36)];
  v8[1] = v4;
  float v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)didStartDragWithDragContentType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didStartDragWithDragContentType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.ContentDrag" usingBlock:v3];
}

id __54__WBSAnalyticsLogger_didStartDragWithDragContentType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"dragContentType";
  id v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportStartPageOverrideStatistics:(id)a3
{
  id v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_reportStartPageOverrideStatistics___block_invoke;
  block[3] = &unk_1E6159820;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __56__WBSAnalyticsLogger_reportStartPageOverrideStatistics___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"newTabPageIsOverridden";
  id v1 = (id *)(a1 + 32);
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "newTabPageIsOverridden"));
  v6[1] = @"hasExtensionThatCanOverrideNewTabPage";
  v7[0] = v2;
  unint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*v1, "hasExtensionThatCanOverrideNewTabPage"));
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  id v5 = v4;
  AnalyticsSendEventLazy();
}

id __56__WBSAnalyticsLogger_reportStartPageOverrideStatistics___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)didConvertExtensionWithKeySupport:(id)a3
{
  id v4 = (void *)[a3 copy];
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke;
  block[3] = &unk_1E6159820;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);
}

uint64_t __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_751];
}

void __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v7 = a3;
  id v5 = v7;
  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __56__WBSAnalyticsLogger_didConvertExtensionWithKeySupport___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)webExtensionBackgroundPage:(id)a3 livedTooLong:(double)a4
{
  id v6 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__WBSAnalyticsLogger_webExtensionBackgroundPage_livedTooLong___block_invoke;
  v9[3] = &unk_1E61598B0;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);
}

void __62__WBSAnalyticsLogger_webExtensionBackgroundPage_livedTooLong___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = *(void *)(a1 + 32);
  v4[0] = @"extensionIdentifier";
  v4[1] = @"lifespan";
  uint64_t v1 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  id v3 = v2;
  AnalyticsSendEventLazy();
}

id __62__WBSAnalyticsLogger_webExtensionBackgroundPage_livedTooLong___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_sendEvent:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__WBSAnalyticsLogger__sendEvent_usingBlock___block_invoke;
  v11[3] = &unk_1E61599E0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(analyticsSynchronizationQueue, v11);
}

uint64_t __44__WBSAnalyticsLogger__sendEvent_usingBlock___block_invoke()
{
  return AnalyticsSendEventLazy();
}

- (void)_sendEvent:(id)a3
{
}

uint64_t __33__WBSAnalyticsLogger__sendEvent___block_invoke()
{
  return 0;
}

void __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"safariClient";
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16) - 1;
  if (v3 > 5) {
    uint64_t v4 = @"Unknown";
  }
  else {
    uint64_t v4 = off_1E6159DA8[v3];
  }
  id v5 = *(void **)(*(void *)(a1 + 40) + 24);
  id v6 = &stru_1F105D3F0;
  if (v5) {
    id v6 = *(__CFString **)(*(void *)(a1 + 40) + 24);
  }
  v12[0] = v4;
  v12[1] = v6;
  v11[1] = @"safariVersion";
  v11[2] = @"safariComparableVersionNumber";
  id v7 = objc_msgSend(v5, "safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString");
  id v8 = v7;
  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.0"];
  }
  v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  id v10 = objc_msgSend(v2, "safari_dictionaryByMergingWithDictionary:", v9);

  if (!v7) {
  AnalyticsSendEvent();
  }
}

uint64_t __60__WBSAnalyticsLogger__sendEventAddingVersionInfo_baseEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendEventAddingVersionInfo:*(void *)(a1 + 40) baseEvent:*(void *)(a1 + 48)];
}

- (void)didSetCustomStartPageBackgroundImage
{
}

void *__58__WBSAnalyticsLogger_didSetCustomStartPageBackgroundImage__block_invoke()
{
  return &unk_1F1086540;
}

- (void)didSetBuiltInStartPageBackgroundImage
{
}

void *__59__WBSAnalyticsLogger_didSetBuiltInStartPageBackgroundImage__block_invoke()
{
  return &unk_1F1086568;
}

- (void)didDragAndDropCustomStartPageBackgroundImage
{
}

void *__66__WBSAnalyticsLogger_didDragAndDropCustomStartPageBackgroundImage__block_invoke()
{
  return &unk_1F1086590;
}

- (void)didClearStartPageBackgroundImage
{
}

void *__54__WBSAnalyticsLogger_didClearStartPageBackgroundImage__block_invoke()
{
  return &unk_1F10865B8;
}

- (void)didChangeStartPageSectionVisibility:(id)a3 visible:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__WBSAnalyticsLogger_didChangeStartPageSectionVisibility_visible___block_invoke;
  void v8[3] = &unk_1E61597A8;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.DidChangeSectionVisibility" usingBlock:v8];
}

id __66__WBSAnalyticsLogger_didChangeStartPageSectionVisibility_visible___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"isVisible";
  v6[0] = v1;
  v5[0] = @"section";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[1] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

- (void)reportStartPageSectionVisibility:(int64_t)a3 visible:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __63__WBSAnalyticsLogger_reportStartPageSectionVisibility_visible___block_invoke;
  v4[3] = &unk_1E61598D8;
  void v4[4] = self;
  v4[5] = a3;
  BOOL v5 = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.StartPage.ReportSectionVisibility" usingBlock:v4];
}

id __63__WBSAnalyticsLogger_reportStartPageSectionVisibility_visible___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"section";
  uint64_t v2 = [*(id *)(a1 + 32) _nameForStartPageSection:*(void *)(a1 + 40)];
  v6[1] = @"isVisible";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportStartPageBackgroundImageVisible:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__WBSAnalyticsLogger_reportStartPageBackgroundImageVisible___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.StartPage.ReportSectionVisibility" usingBlock:v3];
}

id __60__WBSAnalyticsLogger_reportStartPageBackgroundImageVisible___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[1] = @"isVisible";
  v5[0] = @"Background Image";
  v4[0] = @"section";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)reportCustomizationSyncEnablement:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_reportCustomizationSyncEnablement___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.StartPage.ReportSectionVisibility" usingBlock:v3];
}

id __56__WBSAnalyticsLogger_reportCustomizationSyncEnablement___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[1] = @"isVisible";
  v5[0] = @"Customization Sync";
  v4[0] = @"section";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

- (void)reportStartPageVisibility
{
}

uint64_t __47__WBSAnalyticsLogger_reportStartPageVisibility__block_invoke()
{
  return MEMORY[0x1E4F1CC08];
}

- (void)reportPrivateRelayModulePromptEvent:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __58__WBSAnalyticsLogger_reportPrivateRelayModulePromptEvent___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.StartPage.PrivateRelayModulePrompt" usingBlock:v6];
}

id __58__WBSAnalyticsLogger_reportPrivateRelayModulePromptEvent___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"privateRelayModulePromptEvent";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)_builtInImageNameToSimpleName:(id)a3
{
  unint64_t v3 = [&unk_1F10865E0 objectForKeyedSubscript:a3];
  id v4 = v3;
  if (!v3) {
    unint64_t v3 = @"custom";
  }
  id v5 = v3;

  return v5;
}

- (void)reportStartPageBackgroundName:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __52__WBSAnalyticsLogger_reportStartPageBackgroundName___block_invoke;
  void v6[3] = &unk_1E61599B8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.StartPage.CurrentBackgroundImageName" usingBlock:v6];
}

id __52__WBSAnalyticsLogger_reportStartPageBackgroundName___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"name";
  uint64_t v1 = [*(id *)(a1 + 32) _builtInImageNameToSimpleName:*(void *)(a1 + 40)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didEngageWithStartPageSection:(int64_t)a3
{
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __52__WBSAnalyticsLogger_didEngageWithStartPageSection___block_invoke;
  v4[3] = &unk_1E61598B0;
  void v4[4] = self;
  v4[5] = a3;
  dispatch_async(analyticsSynchronizationQueue, v4);
}

uint64_t __52__WBSAnalyticsLogger_didEngageWithStartPageSection___block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __52__WBSAnalyticsLogger_didEngageWithStartPageSection___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"name";
  uint64_t v1 = [*(id *)(a1 + 32) _nameForStartPageSection:*(void *)(a1 + 40)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didDismissSwitchToSafariBanner
{
}

void *__52__WBSAnalyticsLogger_didDismissSwitchToSafariBanner__block_invoke()
{
  return &unk_1F1086608;
}

- (void)didSwitchToSafari:(id)a3 entryPoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__WBSAnalyticsLogger_didSwitchToSafari_entryPoint___block_invoke;
  v10[3] = &unk_1E61599B8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.setSafariAsDefaultBrowser" usingBlock:v10];
}

id __51__WBSAnalyticsLogger_didSwitchToSafari_entryPoint___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"originBrowser";
  v4[1] = @"entryPoint";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)reportShowFullURLInSmartSearchFieldPreference:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__WBSAnalyticsLogger_reportShowFullURLInSmartSearchFieldPreference___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Preferences.ShowFullURLInSmartSearchField" usingBlock:v3];
}

id __68__WBSAnalyticsLogger_reportShowFullURLInSmartSearchFieldPreference___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"enabled";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportShowStandaloneTabBarPreference:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__WBSAnalyticsLogger_reportShowStandaloneTabBarPreference___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Preferences.ShowStandaloneTabBar" usingBlock:v3];
}

id __59__WBSAnalyticsLogger_reportShowStandaloneTabBarPreference___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"enabled";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportUnifiedTabBarStatusWithLayout:(int64_t)a3 numberOfTabsInCurrentTabBar:(unint64_t)a4 tabBarIsCurrentlyScrollable:(BOOL)a5 tabsShowOnlyIcons:(BOOL)a6 backgroundColorInTabBarEnabled:(BOOL)a7
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __163__WBSAnalyticsLogger_reportUnifiedTabBarStatusWithLayout_numberOfTabsInCurrentTabBar_tabBarIsCurrentlyScrollable_tabsShowOnlyIcons_backgroundColorInTabBarEnabled___block_invoke;
  void v7[3] = &__block_descriptor_51_e19___NSDictionary_8__0l;
  v7[4] = a3;
  v7[5] = a4;
  BOOL v8 = a5;
  BOOL v9 = a6;
  BOOL v10 = a7;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.ReportUnifiedTabBarStatus" usingBlock:v7];
}

id __163__WBSAnalyticsLogger_reportUnifiedTabBarStatusWithLayout_numberOfTabsInCurrentTabBar_tabBarIsCurrentlyScrollable_tabsShowOnlyIcons_backgroundColorInTabBarEnabled___block_invoke(uint64_t a1)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"layout";
  if (*(void *)(a1 + 32)) {
    uint64_t v2 = @"separate";
  }
  else {
    uint64_t v2 = @"compact";
  }
  unint64_t v3 = v2;
  v11[0] = v3;
  v10[1] = @"numberOfTabs";
  BOOL v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v11[1] = v4;
  v10[2] = @"tabBarIsCurrentlyScrollable";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v11[2] = v5;
  v10[3] = @"tabsShowOnlyIcons";
  id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  void v11[3] = v6;
  void v10[4] = @"backgroundColorInTabBarEnabled";
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 50)];
  void v11[4] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (void)reportOverlayStatusBarIsEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_reportOverlayStatusBarIsEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Preferences.OverlayStatusBar" usingBlock:v3];
}

id __54__WBSAnalyticsLogger_reportOverlayStatusBarIsEnabled___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"enabled";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportNumberOfPinnedTabs:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__WBSAnalyticsLogger_reportNumberOfPinnedTabs___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.PinnedTabs.PeriodicCount" usingBlock:v3];
}

id __47__WBSAnalyticsLogger_reportNumberOfPinnedTabs___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"numberOfPinnedTabs";
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didDetectLanguageOfWebpage:(id)a3 primaryLocale:(id)a4 webpageCanBeTranslatedToPrimaryLocale:(BOOL)a5 canOfferTranslation:(BOOL)a6 firstNonPrimaryLocaleThatCanBeTranslatedTo:(id)a7 numberOfPreferredLocales:(unint64_t)a8 notificationLevel:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __207__WBSAnalyticsLogger_didDetectLanguageOfWebpage_primaryLocale_webpageCanBeTranslatedToPrimaryLocale_canOfferTranslation_firstNonPrimaryLocaleThatCanBeTranslatedTo_numberOfPreferredLocales_notificationLevel___block_invoke;
  v21[3] = &unk_1E6159A98;
  id v22 = v15;
  id v23 = v16;
  BOOL v27 = a5;
  BOOL v28 = a6;
  id v24 = v17;
  unint64_t v25 = a8;
  int64_t v26 = a9;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.Translation.DetectedWebpageLanguage" usingBlock:v21];
}

id __207__WBSAnalyticsLogger_didDetectLanguageOfWebpage_primaryLocale_webpageCanBeTranslatedToPrimaryLocale_canOfferTranslation_firstNonPrimaryLocaleThatCanBeTranslatedTo_numberOfPreferredLocales_notificationLevel___block_invoke(uint64_t a1)
{
  v15[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = @"unknown";
  v14[0] = @"webpageLocale";
  v14[1] = @"primaryLocale";
  unint64_t v3 = *(__CFString **)(a1 + 32);
  if (!v3) {
    unint64_t v3 = @"unknown";
  }
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = *(__CFString **)(a1 + 40);
  }
  v15[0] = v3;
  v15[1] = v2;
  v14[2] = @"canTranslateWebpageToPrimaryLocale";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  v15[2] = v4;
  v14[3] = @"canTranslateToAnyPreferredLocale";
  uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 73)];
  id v6 = (void *)v5;
  id v7 = &stru_1F105D3F0;
  uint64_t v8 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 48)) {
    id v7 = *(__CFString **)(a1 + 48);
  }
  v15[3] = v5;
  void v15[4] = v7;
  v14[4] = @"firstNonPrimaryLocaleThatCanBeTranslatedTo";
  v14[5] = @"numberOfPreferredLocales";
  BOOL v9 = [NSNumber numberWithUnsignedInteger:v8];
  v15[5] = v9;
  v14[6] = @"notificationLevel";
  unint64_t v10 = *(void *)(a1 + 64);
  if (v10 > 2) {
    id v11 = @"unknown";
  }
  else {
    id v11 = off_1E6159DD8[v10];
  }
  v15[6] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:7];

  return v12;
}

- (void)didRequestTranslatingToLocale:(id)a3 webpageLocale:(id)a4 requestType:(int64_t)a5 isTargetLocalePrimaryLocale:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __106__WBSAnalyticsLogger_didRequestTranslatingToLocale_webpageLocale_requestType_isTargetLocalePrimaryLocale___block_invoke;
  v14[3] = &unk_1E6159AC0;
  id v15 = v11;
  id v16 = v10;
  BOOL v18 = a6;
  int64_t v17 = a5;
  id v12 = v10;
  id v13 = v11;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.Translation.RequestedTranslation" usingBlock:v14];
}

id __106__WBSAnalyticsLogger_didRequestTranslatingToLocale_webpageLocale_requestType_isTargetLocalePrimaryLocale___block_invoke(uint64_t a1)
{
  void v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"webpageLocale";
  v11[1] = @"targetLocale";
  uint64_t v2 = *(__CFString **)(a1 + 32);
  unint64_t v3 = *(__CFString **)(a1 + 40);
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  if (!v3) {
    unint64_t v3 = @"unknown";
  }
  v12[0] = v2;
  v12[1] = v3;
  v11[2] = @"isTargetLocalePrimaryLocale";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v12[2] = v4;
  void v11[3] = @"requestType";
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = @"continued translation";
  if (v5 != 1) {
    id v6 = @"unknown";
  }
  if (v5) {
    id v7 = v6;
  }
  else {
    id v7 = @"manual translation";
  }
  uint64_t v8 = v7;
  v12[3] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)reportFirstInteractionAfterTranslation:(int64_t)a3 maxVisibleHeightPercentage:(float)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __88__WBSAnalyticsLogger_reportFirstInteractionAfterTranslation_maxVisibleHeightPercentage___block_invoke;
  v4[3] = &__block_descriptor_44_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  float v5 = a4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.Translation.ScrollInteraction" usingBlock:v4];
}

id __88__WBSAnalyticsLogger_reportFirstInteractionAfterTranslation_maxVisibleHeightPercentage___block_invoke(uint64_t a1)
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"millisecondsBetweenTranslationAndFirstInteraction";
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v7[1] = @"maxVisibleHeightPercentage";
  v8[0] = v2;
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  BOOL v4 = [NSNumber numberWithFloat:v3];
  v8[1] = v4;
  float v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)didShowSafeBrowsingWarningWithSource:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__WBSAnalyticsLogger_didShowSafeBrowsingWarningWithSource___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.SafeBrowsing.ShowedWarning" usingBlock:v3];
}

id __59__WBSAnalyticsLogger_didShowSafeBrowsingWarningWithSource___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"source";
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = @"unknown";
  if (v1 == 1) {
    uint64_t v2 = @"content blocker extension";
  }
  if (v1) {
    double v3 = v2;
  }
  else {
    double v3 = @"service";
  }
  BOOL v4 = v3;
  v8[0] = v4;
  float v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)didPerformSafeBrowsingAction:(int64_t)a3 fromSource:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __62__WBSAnalyticsLogger_didPerformSafeBrowsingAction_fromSource___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.SafeBrowsing.PerformedAction" usingBlock:v4];
}

id __62__WBSAnalyticsLogger_didPerformSafeBrowsingAction_fromSource___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"action";
  unint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = @"unknown";
  double v3 = @"unknown";
  if (v1 <= 2) {
    double v3 = off_1E6159DF0[v1];
  }
  v8[1] = @"source";
  v9[0] = v3;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 1) {
    uint64_t v2 = @"content blocker extension";
  }
  if (!v4) {
    uint64_t v2 = @"service";
  }
  float v5 = v2;
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (void)didLoadTabContent:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__WBSAnalyticsLogger_didLoadTabContent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.LoadedTabContent" usingBlock:v3];
}

id __40__WBSAnalyticsLogger_didLoadTabContent___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"tabContent";
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = @"is PDF document";
  if (v1 == 1) {
    uint64_t v2 = @"has Quick Look content";
  }
  if (v1 == 2) {
    double v3 = @"other";
  }
  else {
    double v3 = v2;
  }
  uint64_t v4 = v3;
  v8[0] = v4;
  float v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)didContinueUserActivityOfType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__WBSAnalyticsLogger_didContinueUserActivityOfType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ContinuedUserActivity" usingBlock:v3];
}

id __52__WBSAnalyticsLogger_didContinueUserActivityOfType___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  float v5 = @"type";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    uint64_t v2 = @"show reading list";
  }
  else {
    uint64_t v2 = off_1E6159E08[v1];
  }
  v6[0] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didAddWebClip
{
}

uint64_t __35__WBSAnalyticsLogger_didAddWebClip__block_invoke()
{
  return 0;
}

- (void)didPrintPage
{
}

uint64_t __34__WBSAnalyticsLogger_didPrintPage__block_invoke()
{
  return 0;
}

- (void)didClearBrowsingDataFromInterval:(int64_t)a3 withMethod:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __66__WBSAnalyticsLogger_didClearBrowsingDataFromInterval_withMethod___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ClearedBrowsingData" usingBlock:v4];
}

id __66__WBSAnalyticsLogger_didClearBrowsingDataFromInterval_withMethod___block_invoke(uint64_t a1)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"interval";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    uint64_t v2 = @"last hour";
  }
  else {
    uint64_t v2 = off_1E6159E20[v1];
  }
  v8[0] = v2;
  v7[1] = @"method";
  if (*(void *)(a1 + 40)) {
    double v3 = @"settings";
  }
  else {
    double v3 = @"in app";
  }
  uint64_t v4 = v3;
  v8[1] = v4;
  float v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)didSetPrivateBrowsingEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__WBSAnalyticsLogger_didSetPrivateBrowsingEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.SetPrivateBrowsingEnabled" usingBlock:v3];
}

id __51__WBSAnalyticsLogger_didSetPrivateBrowsingEnabled___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"enabled";
  unint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didEnterTabViewWithMethod:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__WBSAnalyticsLogger_didEnterTabViewWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.EnteredTabView" usingBlock:v3];
}

id __48__WBSAnalyticsLogger_didEnterTabViewWithMethod___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"method";
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = @"tap button";
  if (v1 == 1) {
    uint64_t v2 = @"pinch gesture";
  }
  if (v1 == 2) {
    double v3 = @"keyboard shortcut";
  }
  else {
    double v3 = v2;
  }
  BOOL v4 = v3;
  v8[0] = v4;
  float v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)reportUserPreferencesOnLaunchForJavaScriptEnabled:(BOOL)a3 safeBrowsingEnabled:(BOOL)a4 siteSpecificSearchEnabled:(BOOL)a5 trackingPolicy:(unint64_t)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __133__WBSAnalyticsLogger_reportUserPreferencesOnLaunchForJavaScriptEnabled_safeBrowsingEnabled_siteSpecificSearchEnabled_trackingPolicy___block_invoke;
  void v6[3] = &__block_descriptor_43_e19___NSDictionary_8__0l;
  BOOL v7 = a3;
  BOOL v8 = a4;
  BOOL v9 = a5;
  void v6[4] = a6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.UserPreferencesOnLaunch" usingBlock:v6];
}

id __133__WBSAnalyticsLogger_reportUserPreferencesOnLaunchForJavaScriptEnabled_safeBrowsingEnabled_siteSpecificSearchEnabled_trackingPolicy___block_invoke(uint64_t a1)
{
  void v12[5] = *MEMORY[0x1E4F143B8];
  v12[0] = MEMORY[0x1E4F1CC38];
  v11[0] = @"iconsInTabsEnabled";
  v11[1] = @"javaScriptEnabled";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v12[1] = v2;
  v11[2] = @"safeBrowsingEnabled";
  double v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v12[2] = v3;
  void v11[3] = @"siteSpecificSearchEnabled";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
  v12[3] = v4;
  void v11[4] = @"trackingPolicy";
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = @"always";
  if (v5 == 1) {
    id v6 = @"never";
  }
  if (v5 == 2) {
    BOOL v7 = @"only from main document domain";
  }
  else {
    BOOL v7 = v6;
  }
  BOOL v8 = v7;
  void v12[4] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];

  return v9;
}

- (void)reportExperimentalFeaturesOnLaunchForWebXREnabled:(BOOL)a3 webXRGamepadsModuleEnabled:(BOOL)a4 webXRHandInputModuleEnabled:(BOOL)a5 modelElementEnabled:(BOOL)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __147__WBSAnalyticsLogger_reportExperimentalFeaturesOnLaunchForWebXREnabled_webXRGamepadsModuleEnabled_webXRHandInputModuleEnabled_modelElementEnabled___block_invoke;
  void v6[3] = &__block_descriptor_36_e19___NSDictionary_8__0l;
  BOOL v7 = a3;
  BOOL v8 = a4;
  BOOL v9 = a5;
  BOOL v10 = a6;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.ExperimentalFeaturesOnLaunch" usingBlock:v6];
}

id __147__WBSAnalyticsLogger_reportExperimentalFeaturesOnLaunchForWebXREnabled_webXRGamepadsModuleEnabled_webXRHandInputModuleEnabled_modelElementEnabled___block_invoke(unsigned __int8 *a1)
{
  void v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"webXREnabled";
  uint64_t v2 = [NSNumber numberWithBool:a1[32]];
  v9[0] = v2;
  v8[1] = @"webXRGamepadsModuleEnabled";
  double v3 = [NSNumber numberWithBool:a1[33]];
  v9[1] = v3;
  void v8[2] = @"webXRHandInputModuleEnabled";
  BOOL v4 = [NSNumber numberWithBool:a1[34]];
  v9[2] = v4;
  void v8[3] = @"modelElementEnabled";
  uint64_t v5 = [NSNumber numberWithBool:a1[35]];
  void v9[3] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

- (void)didRemoveSiteSpecificSearchProvider
{
}

void *__57__WBSAnalyticsLogger_didRemoveSiteSpecificSearchProvider__block_invoke()
{
  return &unk_1F1086630;
}

- (void)didRequestPageShowingSideBar:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__WBSAnalyticsLogger_didRequestPageShowingSideBar___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.RequestedPage" usingBlock:v3];
}

id __51__WBSAnalyticsLogger_didRequestPageShowingSideBar___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"showingSideBar";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didDetectPossibleUserTrackingInHostApp:(id)a3 urlHasIDFA:(BOOL)a4 urlHasQueryString:(BOOL)a5 userInteracted:(BOOL)a6 viewControllerIsHidden:(BOOL)a7
{
  id v12 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __128__WBSAnalyticsLogger_didDetectPossibleUserTrackingInHostApp_urlHasIDFA_urlHasQueryString_userInteracted_viewControllerIsHidden___block_invoke;
  v14[3] = &unk_1E6159B48;
  id v15 = v12;
  BOOL v16 = a4;
  BOOL v17 = a5;
  BOOL v18 = a6;
  BOOL v19 = a7;
  id v13 = v12;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.SafariViewController.DetectedPossibleUserTracking" usingBlock:v14];
}

id __128__WBSAnalyticsLogger_didDetectPossibleUserTrackingInHostApp_urlHasIDFA_urlHasQueryString_userInteracted_viewControllerIsHidden___block_invoke(uint64_t a1)
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  v9[0] = *(void *)(a1 + 32);
  v8[0] = @"hostAppIdentifier";
  v8[1] = @"urlHasIDFA";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v9[1] = v2;
  void v8[2] = @"urlHasQueryString";
  double v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  v9[2] = v3;
  void v8[3] = @"userInteracted";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
  void v9[3] = v4;
  void v8[4] = @"viewControllerIsHidden";
  uint64_t v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 43)];
  void v9[4] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

- (void)didAddReadingListItemWithMethod:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didAddReadingListItemWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ReadingList.AddedItem" usingBlock:v3];
}

id __54__WBSAnalyticsLogger_didAddReadingListItemWithMethod___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"method";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 4) {
    uint64_t v2 = @"context menu";
  }
  else {
    uint64_t v2 = off_1E6159E38[v1];
  }
  v6[0] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didOpenReadingListItemWithReachableNetwork:(BOOL)a3 isContinuousTransition:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __88__WBSAnalyticsLogger_didOpenReadingListItemWithReachableNetwork_isContinuousTransition___block_invoke;
  v4[3] = &__block_descriptor_34_e19___NSDictionary_8__0l;
  BOOL v5 = a3;
  BOOL v6 = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ReadingList.OpenedItem" usingBlock:v4];
}

id __88__WBSAnalyticsLogger_didOpenReadingListItemWithReachableNetwork_isContinuousTransition___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"isNetworkReachable";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v6[1] = @"isContinuousTransition";
  v7[0] = v2;
  double v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didManuallyMarkReadingListItemAsRead:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__WBSAnalyticsLogger_didManuallyMarkReadingListItemAsRead___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ReadingList.ManuallyMarkedItemAsRead" usingBlock:v3];
}

id __59__WBSAnalyticsLogger_didManuallyMarkReadingListItemAsRead___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"read";
  unint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didDetermineReaderAvailability:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSAnalyticsLogger_didDetermineReaderAvailability___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.ReaderAvailabilityDetermined" usingBlock:v3];
}

id __53__WBSAnalyticsLogger_didDetermineReaderAvailability___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"available";
  unint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didActivateReaderWithTrigger:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__WBSAnalyticsLogger_didActivateReaderWithTrigger___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.ReaderActivated" usingBlock:v3];
}

id __51__WBSAnalyticsLogger_didActivateReaderWithTrigger___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"triggerType";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    uint64_t v2 = @"manual";
  }
  else {
    uint64_t v2 = off_1E6159E60[v1];
  }
  v6[0] = v2;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didDismissCompletionListWithItemAccepted:(BOOL)a3 goKeyTapped:(BOOL)a4 unifiedFieldContentType:(int64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __99__WBSAnalyticsLogger_didDismissCompletionListWithItemAccepted_goKeyTapped_unifiedFieldContentType___block_invoke;
  void v5[3] = &__block_descriptor_42_e19___NSDictionary_8__0l;
  BOOL v6 = a3;
  BOOL v7 = a4;
  v5[4] = a5;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.CompletionList.DismissedCompletionList" usingBlock:v5];
}

id __99__WBSAnalyticsLogger_didDismissCompletionListWithItemAccepted_goKeyTapped_unifiedFieldContentType___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"acceptedCompletionItem";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v10[1] = @"unifiedFieldContentType";
  v11[0] = v2;
  int v3 = *(unsigned __int8 *)(a1 + 41);
  if (*(unsigned char *)(a1 + 41))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = @"address";
    if (v4 == 1) {
      BOOL v5 = @"search query";
    }
    if (v4 == 2) {
      BOOL v6 = @"parsec top hit";
    }
    else {
      BOOL v6 = v5;
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = &stru_1F105D3F0;
  }
  v11[1] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (v3) {

  }
  return v8;
}

- (void)didAcceptCompletionItemOfType:(int64_t)a3 atRank:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __59__WBSAnalyticsLogger_didAcceptCompletionItemOfType_atRank___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.CompletionList.AcceptedItem" usingBlock:v4];
}

id __59__WBSAnalyticsLogger_didAcceptCompletionItemOfType_atRank___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"type";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 9) {
    uint64_t v2 = @"bookmarks and history";
  }
  else {
    uint64_t v2 = off_1E6159E78[v1];
  }
  v7[0] = v2;
  v6[1] = @"rank";
  int v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didAcceptSearchSuggestionOfType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didAcceptSearchSuggestionOfType___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.CompletionList.AcceptedSearchSuggestion" usingBlock:v3];
}

id __54__WBSAnalyticsLogger_didAcceptSearchSuggestionOfType___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"type";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    uint64_t v2 = @"literal search";
  }
  else {
    uint64_t v2 = off_1E6159EC8[v1];
  }
  v6[0] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didChooseTopHit:(BOOL)a3 matchLength:(unint64_t)a4 matchScore:(float)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __61__WBSAnalyticsLogger_didChooseTopHit_matchLength_matchScore___block_invoke;
  void v5[3] = &__block_descriptor_45_e19___NSDictionary_8__0l;
  BOOL v7 = a3;
  v5[4] = a4;
  float v6 = a5;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.CompletionList.ChoseOrIgnoredTopHit" usingBlock:v5];
}

id __61__WBSAnalyticsLogger_didChooseTopHit_matchLength_matchScore___block_invoke(uint64_t a1)
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"isTopHitChosen";
  uint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
  v9[0] = v2;
  v8[1] = @"matchLength";
  int v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v9[1] = v3;
  void v8[2] = @"matchScore";
  LODWORD(v4) = *(_DWORD *)(a1 + 40);
  BOOL v5 = [NSNumber numberWithFloat:v4];
  v9[2] = v5;
  float v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (void)didActivateVoiceSearchAccidentally:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didActivateVoiceSearchAccidentally___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.VoiceSearchActivatedAccidentally" usingBlock:v3];
}

id __57__WBSAnalyticsLogger_didActivateVoiceSearchAccidentally___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"activatedAccidentally";
  unint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didSnapBack
{
}

uint64_t __33__WBSAnalyticsLogger_didSnapBack__block_invoke()
{
  return 0;
}

- (void)reportNumberOfWindows:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__WBSAnalyticsLogger_reportNumberOfWindows___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.WindowCount" usingBlock:v3];
}

id __44__WBSAnalyticsLogger_reportNumberOfWindows___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"windowCount";
  unint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportNumberOfTabsPerWindow:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__WBSAnalyticsLogger_reportNumberOfTabsPerWindow___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.TabsPerWindowCount" usingBlock:v3];
}

id __50__WBSAnalyticsLogger_reportNumberOfTabsPerWindow___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"tabsPerWindowCount";
  unint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportNumberOfTabs:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__WBSAnalyticsLogger_reportNumberOfTabs___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.TabCount" usingBlock:v3];
}

id __41__WBSAnalyticsLogger_reportNumberOfTabs___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"tabCount";
  unint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportNewWindowBehavior:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__WBSAnalyticsLogger_reportNewWindowBehavior___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.NewWindowBehavior" usingBlock:v3];
}

id __46__WBSAnalyticsLogger_reportNewWindowBehavior___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"newWindowBehavior";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 4) {
    uint64_t v2 = @"Start Page";
  }
  else {
    uint64_t v2 = off_1E6159EE0[v1];
  }
  v6[0] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)reportNewTabBehavior:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__WBSAnalyticsLogger_reportNewTabBehavior___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.NewTabBehavior" usingBlock:v3];
}

id __43__WBSAnalyticsLogger_reportNewTabBehavior___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"newTabBehavior";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 4) {
    uint64_t v2 = @"Start Page";
  }
  else {
    uint64_t v2 = off_1E6159EE0[v1];
  }
  v6[0] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didOpenVisualTabPickerWithMethod:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__WBSAnalyticsLogger_didOpenVisualTabPickerWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.VisualTabPicker.Entry" usingBlock:v3];
}

id __55__WBSAnalyticsLogger_didOpenVisualTabPickerWithMethod___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"openMethod";
  if (*(void *)(a1 + 32)) {
    unint64_t v1 = @"open with pinching";
  }
  else {
    unint64_t v1 = @"open";
  }
  uint64_t v2 = v1;
  v6[0] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)didCloseVisualTabPickerWithMethod:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_didCloseVisualTabPickerWithMethod___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.VisualTabPicker.Exit" usingBlock:v3];
}

id __56__WBSAnalyticsLogger_didCloseVisualTabPickerWithMethod___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"closeMethod";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    uint64_t v2 = @"close";
  }
  else {
    uint64_t v2 = off_1E6159F08[v1];
  }
  v6[0] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didPerformVisualTabPickerMiscEvent:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didPerformVisualTabPickerMiscEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.VisualTabPicker.Misc" usingBlock:v3];
}

id __57__WBSAnalyticsLogger_didPerformVisualTabPickerMiscEvent___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"miscEvent";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    uint64_t v2 = @"close tab";
  }
  else {
    uint64_t v2 = off_1E6159F20[v1];
  }
  v6[0] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didOpenClearHistoryFromSource:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __52__WBSAnalyticsLogger_didOpenClearHistoryFromSource___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ClearHistory.Opened" usingBlock:v6];
}

id __52__WBSAnalyticsLogger_didOpenClearHistoryFromSource___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"source";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)didTakeActionOnClearHistory:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__WBSAnalyticsLogger_didTakeActionOnClearHistory___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ClearHistory.ActionTaken" usingBlock:v6];
}

id __50__WBSAnalyticsLogger_didTakeActionOnClearHistory___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"actionTaken";
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)didFindOnPageWithTrigger:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__WBSAnalyticsLogger_didFindOnPageWithTrigger___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.FindOnPageTriggered" usingBlock:v3];
}

id __47__WBSAnalyticsLogger_didFindOnPageWithTrigger___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"trigger";
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 3) {
    uint64_t v2 = @"unknown";
  }
  else {
    uint64_t v2 = off_1E6159F38[v1];
  }
  v6[0] = v2;
  int v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didCloseTabWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4
{
}

- (void)didCloseTabWithTrigger:(int64_t)a3 tabClosingAction:(int64_t)a4 numberOfTabsClosed:(unint64_t)a5 tabCollectionViewType:(int64_t)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __103__WBSAnalyticsLogger_didCloseTabWithTrigger_tabClosingAction_numberOfTabsClosed_tabCollectionViewType___block_invoke;
  void v6[3] = &__block_descriptor_64_e19___NSDictionary_8__0l;
  void v6[4] = a3;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Tabs.ClosedTab" usingBlock:v6];
}

id __103__WBSAnalyticsLogger_didCloseTabWithTrigger_tabClosingAction_numberOfTabsClosed_tabCollectionViewType___block_invoke(void *a1)
{
  void v12[4] = *MEMORY[0x1E4F143B8];
  v11[0] = @"tabClosingTrigger";
  unint64_t v2 = a1[4] - 1;
  if (v2 > 2) {
    int v3 = @"close button";
  }
  else {
    int v3 = off_1E6159F58[v2];
  }
  v12[0] = v3;
  v11[1] = @"tabClosingAction";
  unint64_t v4 = a1[5] - 1;
  if (v4 > 3) {
    id v5 = @"none";
  }
  else {
    id v5 = off_1E6159F70[v4];
  }
  v12[1] = v5;
  v11[2] = @"numberOfTabsClosed";
  float v6 = [NSNumber numberWithUnsignedInteger:a1[6]];
  v12[2] = v6;
  void v11[3] = @"tabCollectionViewType";
  unint64_t v7 = a1[7] - 1;
  if (v7 > 2) {
    BOOL v8 = @"not visible";
  }
  else {
    BOOL v8 = off_1E6159FD0[v7];
  }
  v12[3] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  return v9;
}

- (void)didOpenNewBlankTabWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __74__WBSAnalyticsLogger_didOpenNewBlankTabWithTrigger_tabCollectionViewType___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Tabs.OpenedNewTab" usingBlock:v4];
}

id __74__WBSAnalyticsLogger_didOpenNewBlankTabWithTrigger_tabCollectionViewType___block_invoke(uint64_t a1)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  v7[0] = @"withURL";
  v7[1] = @"isExternalLink";
  v8[0] = MEMORY[0x1E4F1CC28];
  v8[1] = MEMORY[0x1E4F1CC28];
  void v7[2] = @"trigger";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 2) {
    unint64_t v2 = @"keyboard shortcut";
  }
  else {
    unint64_t v2 = off_1E6159F90[v1];
  }
  void v8[2] = v2;
  void v7[3] = @"tabCollectionViewType";
  unint64_t v3 = *(void *)(a1 + 40) - 1;
  if (v3 > 2) {
    unint64_t v4 = @"not visible";
  }
  else {
    unint64_t v4 = off_1E6159FD0[v3];
  }
  void v8[3] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:4];
  return v5;
}

- (void)didOpenNewTabWithURLWithTrigger:(int64_t)a3 tabCollectionViewType:(int64_t)a4
{
}

- (void)didOpenNewTabWithURLWithTrigger:(int64_t)a3 isExternalLink:(BOOL)a4 tabCollectionViewType:(int64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __91__WBSAnalyticsLogger_didOpenNewTabWithURLWithTrigger_isExternalLink_tabCollectionViewType___block_invoke;
  void v5[3] = &__block_descriptor_49_e19___NSDictionary_8__0l;
  BOOL v6 = a4;
  v5[4] = a3;
  void v5[5] = a5;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Tabs.OpenedNewTab" usingBlock:v5];
}

id __91__WBSAnalyticsLogger_didOpenNewTabWithURLWithTrigger_isExternalLink_tabCollectionViewType___block_invoke(uint64_t a1)
{
  void v10[4] = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F1CC38];
  v9[0] = @"withURL";
  v9[1] = @"isExternalLink";
  unint64_t v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v10[1] = v2;
  v9[2] = @"trigger";
  unint64_t v3 = *(void *)(a1 + 32) - 1;
  if (v3 > 4) {
    unint64_t v4 = @"continue activity";
  }
  else {
    unint64_t v4 = off_1E6159FA8[v3];
  }
  void v10[2] = v4;
  void v9[3] = @"tabCollectionViewType";
  unint64_t v5 = *(void *)(a1 + 40) - 1;
  if (v5 > 2) {
    BOOL v6 = @"not visible";
  }
  else {
    BOOL v6 = off_1E6159FD0[v5];
  }
  v10[3] = v6;
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (void)didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt:(id)a3
{
  id v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__WBSAnalyticsLogger_didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt___block_invoke;
  block[3] = &unk_1E6159820;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __88__WBSAnalyticsLogger_didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __88__WBSAnalyticsLogger_didChooseIntervalFromAutomaticTabClosingFirstTimeExperiencePrompt___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"interval";
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)reportAutomaticTabClosingInterval:(id)a3
{
  id v4 = a3;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WBSAnalyticsLogger_reportAutomaticTabClosingInterval___block_invoke;
  block[3] = &unk_1E6159820;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(analyticsSynchronizationQueue, block);
}

void __56__WBSAnalyticsLogger_reportAutomaticTabClosingInterval___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __56__WBSAnalyticsLogger_reportAutomaticTabClosingInterval___block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"interval";
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)didCloseTabsAutomaticallyWithCount:(unint64_t)a3 tabClosingInterval:(id)a4
{
  id v6 = a4;
  analyticsSynchronizationQueue = self->_analyticsSynchronizationQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__WBSAnalyticsLogger_didCloseTabsAutomaticallyWithCount_tabClosingInterval___block_invoke;
  void v9[3] = &unk_1E61598B0;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(analyticsSynchronizationQueue, v9);
}

void __76__WBSAnalyticsLogger_didCloseTabsAutomaticallyWithCount_tabClosingInterval___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id __76__WBSAnalyticsLogger_didCloseTabsAutomaticallyWithCount_tabClosingInterval___block_invoke_2(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v6[0] = @"interval";
  v6[1] = @"closedTabCount";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithUnsignedInteger:v1];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didPerformActionOnDownloadsPopover:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didPerformActionOnDownloadsPopover___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Downloads.Popover" usingBlock:v3];
}

id __57__WBSAnalyticsLogger_didPerformActionOnDownloadsPopover___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = @"performedAction";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 5) {
    uint64_t v2 = @"Detached popover";
  }
  else {
    uint64_t v2 = off_1E6159FE8[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didPerformDownloadsFileEvent:(int64_t)a3 withFileType:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __64__WBSAnalyticsLogger_didPerformDownloadsFileEvent_withFileType___block_invoke;
  void v8[3] = &unk_1E6159720;
  id v9 = v6;
  int64_t v10 = a3;
  void v8[4] = self;
  id v7 = v6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Downloads.FileType" usingBlock:v8];
}

id __64__WBSAnalyticsLogger_didPerformDownloadsFileEvent_withFileType___block_invoke(uint64_t a1)
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"downloadsFileEvent";
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = @"created destination";
  if (v2 == 1) {
    unint64_t v3 = @"finished download";
  }
  if (v2 == 2) {
    id v4 = @"canceled download";
  }
  else {
    id v4 = v3;
  }
  unint64_t v5 = v4;
  v9[1] = @"fileType";
  v10[0] = v5;
  id v6 = [*(id *)(a1 + 32) _sanitizedPathExtensionForAnalyticsForPathExtension:*(void *)(a1 + 40)];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_sanitizedPathExtensionForAnalyticsForPathExtension:(id)a3
{
  unint64_t v3 = (__CFString *)a3;
  if (![(__CFString *)v3 length]
    || ([(__CFString *)v3 safari_isPathExtensionAllowedForAnalytics] & 1) == 0)
  {

    unint64_t v3 = @"Unspecified";
  }
  return v3;
}

- (void)didReloadEvent:(int64_t)a3 withReloadType:(int64_t)a4 withReloadProvenance:(int64_t)a5 withLayout:(int64_t)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __84__WBSAnalyticsLogger_didReloadEvent_withReloadType_withReloadProvenance_withLayout___block_invoke;
  void v6[3] = &__block_descriptor_64_e19___NSDictionary_8__0l;
  void v6[4] = a3;
  void v6[5] = a4;
  v6[6] = a5;
  v6[7] = a6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Reload" usingBlock:v6];
}

id __84__WBSAnalyticsLogger_didReloadEvent_withReloadType_withReloadProvenance_withLayout___block_invoke(void *a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"reloadEvent";
  unint64_t v2 = a1[4] - 1;
  if (v2 > 2) {
    unint64_t v3 = @"reloaded page";
  }
  else {
    unint64_t v3 = off_1E615A018[v2];
  }
  v13[0] = v3;
  v12[1] = @"reloadType";
  unint64_t v4 = a1[5] - 1;
  if (v4 > 5) {
    unint64_t v5 = @"reloaded normally";
  }
  else {
    unint64_t v5 = off_1E615A030[v4];
  }
  v13[1] = v5;
  v12[2] = @"reloadProvenance";
  if (a1[6]) {
    id v6 = @"reloaded within the reload button menu";
  }
  else {
    id v6 = @"reloaded within the more menu";
  }
  id v7 = v6;
  v13[2] = v7;
  v12[3] = @"layout";
  unint64_t v8 = a1[7] - 1;
  if (v8 > 4) {
    id v9 = @"Unknown";
  }
  else {
    id v9 = off_1E615A440[v8];
  }
  v13[3] = v9;
  int64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

- (void)reportAudioIndicatorClickEvent:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__WBSAnalyticsLogger_reportAudioIndicatorClickEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.TabAudio" usingBlock:v3];
}

id __53__WBSAnalyticsLogger_reportAudioIndicatorClickEvent___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = @"audioIndicatorEvent";
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 4) {
    unint64_t v2 = 0;
  }
  else {
    unint64_t v2 = off_1E615A060[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)reportPictureInPictureEvent:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__WBSAnalyticsLogger_reportPictureInPictureEvent___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.PictureInPicture" usingBlock:v3];
}

id __50__WBSAnalyticsLogger_reportPictureInPictureEvent___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  unint64_t v1 = @"didExit";
  if (!*(void *)(a1 + 32)) {
    unint64_t v1 = @"didEnter";
  }
  unint64_t v4 = @"pipEvent";
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)reportPrivateBrowsingUsage:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__WBSAnalyticsLogger_reportPrivateBrowsingUsage___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.PrivateBrowsing" usingBlock:v3];
}

id __49__WBSAnalyticsLogger_reportPrivateBrowsingUsage___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = @"usage";
  if (*(void *)(a1 + 32)) {
    unint64_t v1 = @"is using private browsing in any window";
  }
  else {
    unint64_t v1 = @"opened private window";
  }
  unint64_t v2 = v1;
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)reportInvalidMessageFromWebProcess:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __57__WBSAnalyticsLogger_reportInvalidMessageFromWebProcess___block_invoke;
    void v7[3] = &unk_1E61599B8;
    id v8 = v4;
    id v9 = v6;
    [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.InvalidMessageFromWebProcess" usingBlock:v7];
  }
}

id __57__WBSAnalyticsLogger_reportInvalidMessageFromWebProcess___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"message";
  v4[1] = @"safariBundleVersion";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)reportUnifiedFieldEvent:(int64_t)a3
{
  if (unint64_t)a3 <= 6 && ((0x77u >> a3))
  {
    unint64_t v3 = off_1E615A088[a3];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __46__WBSAnalyticsLogger_reportUnifiedFieldEvent___block_invoke;
    v4[3] = &unk_1E6159888;
    unint64_t v5 = v3;
    int64_t v6 = a3;
    [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.URL" usingBlock:v4];
  }
}

id __46__WBSAnalyticsLogger_reportUnifiedFieldEvent___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"unifiedFieldEvent";
  unint64_t v1 = *(void *)(a1 + 40) - 1;
  if (v1 > 5) {
    unint64_t v2 = @"UnifiedField";
  }
  else {
    unint64_t v2 = off_1E615A0C0[v1];
  }
  v5[1] = @"value";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (void)reportUnifiedFieldHistoryItemURLAutocompletedEventWithDaysSinceLastVisit:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __95__WBSAnalyticsLogger_reportUnifiedFieldHistoryItemURLAutocompletedEventWithDaysSinceLastVisit___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.URL" usingBlock:v6];
}

id __95__WBSAnalyticsLogger_reportUnifiedFieldHistoryItemURLAutocompletedEventWithDaysSinceLastVisit___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"unifiedFieldEvent";
  v4[1] = @"value";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = @"HistoryItemAutocompleted";
  v5[1] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)reportUnifiedFieldSearchSlowDown:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__WBSAnalyticsLogger_reportUnifiedFieldSearchSlowDown___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  *(double *)&void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.URL.SearchSlowDown" usingBlock:v3];
}

id __55__WBSAnalyticsLogger_reportUnifiedFieldSearchSlowDown___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"duration";
  uint64_t v1 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didModifyPerSitePreferencesWithPreferenceIdentifier:(id)a3 modificationLevel:(int64_t)a4 type:(int64_t)a5 method:(int64_t)a6
{
  id v10 = a3;
  switch(a6)
  {
    case 1:
      unint64_t v11 = @"in-app";
      break;
    case 2:
      unint64_t v11 = @"settings";
      break;
    case 3:
      unint64_t v11 = @"keyboard shortcut";
      break;
    case 4:
      unint64_t v11 = @"preference pane";
      break;
    case 5:
      unint64_t v11 = self->_perSitePreferencesPopoverLocation;
      break;
    default:
      unint64_t v11 = @"page formatting menu";
      break;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __104__WBSAnalyticsLogger_didModifyPerSitePreferencesWithPreferenceIdentifier_modificationLevel_type_method___block_invoke;
  v14[3] = &unk_1E6159C10;
  int64_t v17 = a4;
  int64_t v18 = a5;
  id v15 = v10;
  BOOL v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.MobileSafari.PerSitePreferences" usingBlock:v14];
}

id __104__WBSAnalyticsLogger_didModifyPerSitePreferencesWithPreferenceIdentifier_modificationLevel_type_method___block_invoke(void *a1)
{
  void v10[4] = *MEMORY[0x1E4F143B8];
  v10[0] = a1[4];
  v9[0] = @"identifier";
  v9[1] = @"level";
  if (a1[6]) {
    unint64_t v2 = @"domain";
  }
  else {
    unint64_t v2 = @"default";
  }
  unint64_t v3 = v2;
  v10[1] = v3;
  void v9[2] = @"type";
  if (a1[7]) {
    id v4 = @"clear";
  }
  else {
    id v4 = @"set";
  }
  id v5 = v4;
  void v9[3] = @"method";
  uint64_t v6 = a1[5];
  void v10[2] = v5;
  void v10[3] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (void)didOpenPerSitePreferencesPopoverVia:(int64_t)a3
{
  id v4 = @"popover via Safari menu item";
  if (a3 == 1) {
    id v4 = @"popover via context menu item";
  }
  if (a3 == 2) {
    id v5 = @"popover via toolbar button";
  }
  else {
    id v5 = v4;
  }
  objc_storeStrong((id *)&self->_perSitePreferencesPopoverLocation, v5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __58__WBSAnalyticsLogger_didOpenPerSitePreferencesPopoverVia___block_invoke;
  void v6[3] = &unk_1E61597F8;
  void v6[4] = self;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.PerSitePreferences.PopoverOpened" usingBlock:v6];
}

id __58__WBSAnalyticsLogger_didOpenPerSitePreferencesPopoverVia___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 32);
  id v4 = @"location";
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount:(unint64_t)a3 allDuplicatesCount:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __101__WBSAnalyticsLogger_reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount_allDuplicatesCount___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Bookmarks.ReportNumberOfDuplicates" usingBlock:v4];
}

id __101__WBSAnalyticsLogger_reportNumberOfDuplicateBookmarksWithTopLevelDuplicatesCount_allDuplicatesCount___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"topLevelDuplicatesCount";
  unint64_t v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v6[1] = @"allDuplicatesCount";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didVisitBookmarksWithOpenLocation:(int64_t)a3 numberOfBookmarksVisited:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __81__WBSAnalyticsLogger_didVisitBookmarksWithOpenLocation_numberOfBookmarksVisited___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.Bookmarks.VisitedBookmarks" usingBlock:v4];
}

id __81__WBSAnalyticsLogger_didVisitBookmarksWithOpenLocation_numberOfBookmarksVisited___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"openLocation";
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 4) {
    unint64_t v2 = &stru_1F105D3F0;
  }
  else {
    unint64_t v2 = off_1E615A298[v1];
  }
  v7[0] = v2;
  v6[1] = @"numberOfBookmarksVisited";
  unint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didPreventBookmarkActionWithBookmarkType:(int64_t)a3 actionType:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __74__WBSAnalyticsLogger_didPreventBookmarkActionWithBookmarkType_actionType___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Bookmarks.PreventedBookmarkAction" usingBlock:v4];
}

id __74__WBSAnalyticsLogger_didPreventBookmarkActionWithBookmarkType_actionType___block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10[0] = @"bookmarkType";
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = @"bookmark";
  if (v2 == 1) {
    unint64_t v3 = @"favorite";
  }
  if (v2 == 2) {
    id v4 = @"reading list item";
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;
  v10[1] = @"actionType";
  v11[0] = v5;
  unint64_t v6 = *(void *)(a1 + 40) - 1;
  if (v6 > 2) {
    id v7 = @"add";
  }
  else {
    id v7 = off_1E615A0F0[v6];
  }
  v11[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

- (void)didAddBookmarkWithMethod:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    unint64_t v3 = @"long press bookmark button";
  }
  else {
    unint64_t v3 = off_1E615A108[a3 - 1];
  }
  [(WBSAnalyticsLogger *)self _didAddBookmarkWithMethod:v3 menuItemType:&stru_1F105D3F0];
}

- (void)didAddBookmarkFromToolbarMenuWithItemType:(int64_t)a3
{
  if (a3) {
    unint64_t v3 = @"folder";
  }
  else {
    unint64_t v3 = @"single";
  }
  [(WBSAnalyticsLogger *)self _didAddBookmarkWithMethod:@"long press bookmark button" menuItemType:v3];
}

- (void)_didAddBookmarkWithMethod:(id)a3 menuItemType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __61__WBSAnalyticsLogger__didAddBookmarkWithMethod_menuItemType___block_invoke;
  void v10[3] = &unk_1E61599B8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Bookmarks.AddedBookmark" usingBlock:v10];
}

id __61__WBSAnalyticsLogger__didAddBookmarkWithMethod_menuItemType___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"method";
  v4[1] = @"menuItemType";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)didAddNumberOfBookmarksInMemory:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didAddNumberOfBookmarksInMemory___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Bookmarks.AddedBookmarksInMemory" usingBlock:v3];
}

id __54__WBSAnalyticsLogger_didAddNumberOfBookmarksInMemory___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"numberOfBookmarksAdded";
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didDeleteBookmarkInMemory
{
}

- (void)didDeleteNumberOfBookmarksInMemory:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__WBSAnalyticsLogger_didDeleteNumberOfBookmarksInMemory___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Bookmarks.DeletedBookmarksInMemory" usingBlock:v3];
}

id __57__WBSAnalyticsLogger_didDeleteNumberOfBookmarksInMemory___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"numberOfBookmarksDeleted";
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didEnterBackgroundWithBookmarksInMemory
{
}

uint64_t __61__WBSAnalyticsLogger_didEnterBackgroundWithBookmarksInMemory__block_invoke()
{
  return 0;
}

- (void)didSaveInMemoryBookmarksToSideFile
{
}

uint64_t __56__WBSAnalyticsLogger_didSaveInMemoryBookmarksToSideFile__block_invoke()
{
  return 0;
}

- (void)didShowPasswordGenerationPromptWithPasswordAccepted:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __74__WBSAnalyticsLogger_didShowPasswordGenerationPromptWithPasswordAccepted___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Autofill.PasswordGeneration.ShowedPrompt" usingBlock:v3];
}

id __74__WBSAnalyticsLogger_didShowPasswordGenerationPromptWithPasswordAccepted___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"passwordAccepted";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didUseGeneratedPassword
{
}

uint64_t __45__WBSAnalyticsLogger_didUseGeneratedPassword__block_invoke()
{
  return 0;
}

- (void)didChooseCustomPassword
{
}

uint64_t __45__WBSAnalyticsLogger_didChooseCustomPassword__block_invoke()
{
  return 0;
}

- (void)didChooseToEditStrongPassword
{
}

uint64_t __51__WBSAnalyticsLogger_didChooseToEditStrongPassword__block_invoke()
{
  return 0;
}

- (void)didChooseStrongPasswordWithoutSpecialCharacters
{
}

uint64_t __69__WBSAnalyticsLogger_didChooseStrongPasswordWithoutSpecialCharacters__block_invoke()
{
  return 0;
}

- (void)didLaunchPasswordsApp
{
}

uint64_t __43__WBSAnalyticsLogger_didLaunchPasswordsApp__block_invoke()
{
  return 0;
}

- (void)didSurfaceUsePasswordsAppView
{
}

uint64_t __51__WBSAnalyticsLogger_didSurfaceUsePasswordsAppView__block_invoke()
{
  return 0;
}

- (void)didSelectUsePasswordsApp
{
}

uint64_t __46__WBSAnalyticsLogger_didSelectUsePasswordsApp__block_invoke()
{
  return 0;
}

- (void)didSelectNotNowForUsePasswordsApp
{
}

uint64_t __55__WBSAnalyticsLogger_didSelectNotNowForUsePasswordsApp__block_invoke()
{
  return 0;
}

- (void)didSurfaceNewStrongPasswordView
{
}

uint64_t __53__WBSAnalyticsLogger_didSurfaceNewStrongPasswordView__block_invoke()
{
  return 0;
}

- (void)didSelectNewStrongPassword
{
}

uint64_t __48__WBSAnalyticsLogger_didSelectNewStrongPassword__block_invoke()
{
  return 0;
}

- (void)didSelectXForNewStrongPassword
{
}

uint64_t __52__WBSAnalyticsLogger_didSelectXForNewStrongPassword__block_invoke()
{
  return 0;
}

- (void)generatedPasswordDidOverwriteExistingPasswordWithTrigger:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__WBSAnalyticsLogger_generatedPasswordDidOverwriteExistingPasswordWithTrigger___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Autofill.PasswordGeneration.OverwroteExistingPassword" usingBlock:v3];
}

id __79__WBSAnalyticsLogger_generatedPasswordDidOverwriteExistingPasswordWithTrigger___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"trigger";
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = @"view close";
  }
  else {
    uint64_t v1 = @"app suspend";
  }
  uint64_t v2 = v1;
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)didPresentUsernamePrompt
{
}

uint64_t __46__WBSAnalyticsLogger_didPresentUsernamePrompt__block_invoke()
{
  return 0;
}

- (void)didSuggestUsernameInPromptAndUserKeptSuggestion:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__WBSAnalyticsLogger_didSuggestUsernameInPromptAndUserKeptSuggestion___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.Autofill.PasswordManagement.ReportUseOfSuggestedUsernameInPrompt" usingBlock:v3];
}

id __70__WBSAnalyticsLogger_didSuggestUsernameInPromptAndUserKeptSuggestion___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"userKeptUsernameSuggestion";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didSubmitFormOfType:(unint64_t)a3 withFieldType:(int64_t)a4 elementType:(unint64_t)a5 isAutoFilled:(BOOL)a6 isManuallyFilledByUser:(BOOL)a7 modificationType:(unint64_t)a8 autoFillOfferedType:(unint64_t)a9 webpageLocale:(id)a10
{
  id v17 = a10;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __155__WBSAnalyticsLogger_didSubmitFormOfType_withFieldType_elementType_isAutoFilled_isManuallyFilledByUser_modificationType_autoFillOfferedType_webpageLocale___block_invoke;
  v19[3] = &unk_1E6159C38;
  int64_t v22 = a4;
  unint64_t v23 = a5;
  BOOL v26 = a6;
  BOOL v27 = a7;
  unint64_t v24 = a8;
  unint64_t v25 = a9;
  id v20 = v17;
  unint64_t v21 = a3;
  id v18 = v17;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.AutoFill.DidSubmitFieldInForm" usingBlock:v19];
}

id __155__WBSAnalyticsLogger_didSubmitFormOfType_withFieldType_elementType_isAutoFilled_isManuallyFilledByUser_modificationType_autoFillOfferedType_webpageLocale___block_invoke(uint64_t a1)
{
  v21[10] = *MEMORY[0x1E4F143B8];
  v20[0] = @"formType";
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 > 5) {
    unint64_t v3 = @"Invalid Form Type";
  }
  else {
    unint64_t v3 = off_1E615A268[v2];
  }
  v21[0] = v3;
  v20[1] = @"fieldType";
  BOOL v4 = stringForFieldType(*(void *)(a1 + 48));
  v21[1] = v4;
  v20[2] = @"elementType";
  unint64_t v5 = *(void *)(a1 + 56);
  if (v5 > 4) {
    id v6 = @"Invalid Element Type";
  }
  else {
    id v6 = off_1E615A120[v5];
  }
  v21[2] = v6;
  v20[3] = @"isAutoFilled";
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  v21[3] = v7;
  v20[4] = @"isManuallyFilledByUser";
  id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 81)];
  void v21[4] = v8;
  v20[5] = @"modificationType";
  unint64_t v9 = *(void *)(a1 + 64);
  if (v9 > 5) {
    id v10 = @"Invalid Modification Type";
  }
  else {
    id v10 = off_1E615A148[v9];
  }
  v21[5] = v10;
  v20[6] = @"autoFillOfferedType";
  unint64_t v11 = *(void *)(a1 + 72);
  if (v11 > 4) {
    id v12 = @"Invalid AutoFill Offered Type";
  }
  else {
    id v12 = off_1E615A178[v11];
  }
  id v13 = *(__CFString **)(a1 + 32);
  if (!v13) {
    id v13 = @"unknown";
  }
  v21[6] = v12;
  v21[7] = v13;
  v20[7] = @"webpageLocale";
  v20[8] = @"userRegion";
  uint64_t v14 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v15 = [v14 countryCode];
  BOOL v16 = (void *)v15;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  else {
    id v17 = @"unknown";
  }
  v20[9] = @"autoFillTelemetryVersion";
  v21[8] = v17;
  v21[9] = &unk_1F10861A0;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:10];

  return v18;
}

- (void)didSubmitFormOfType:(unint64_t)a3 withPerFormModificationsDictionary:(id)a4 webpageLocale:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormModificationsDictionary_webpageLocale___block_invoke;
  v12[3] = &unk_1E6159720;
  id v14 = v9;
  unint64_t v15 = a3;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.AutoFill.DidSubmitForm" usingBlock:v12];
}

id __91__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormModificationsDictionary_webpageLocale___block_invoke(void *a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)a1[4];
  v12[0] = @"formType";
  unint64_t v2 = a1[6];
  if (v2 > 5) {
    unint64_t v3 = @"Invalid Form Type";
  }
  else {
    unint64_t v3 = off_1E615A268[v2];
  }
  BOOL v4 = (__CFString *)a1[5];
  if (!v4) {
    BOOL v4 = @"unknown";
  }
  v13[0] = v3;
  v13[1] = v4;
  v12[1] = @"webpageLocale";
  v12[2] = @"userRegion";
  unint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v6 = [v5 countryCode];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"unknown";
  }
  v12[3] = @"autoFillTelemetryVersion";
  v13[2] = v8;
  v13[3] = &unk_1F10861A0;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  id v10 = objc_msgSend(v1, "safari_dictionaryByMergingWithDictionary:", v9);

  return v10;
}

- (void)didSubmitFormOfType:(unint64_t)a3 withPerFormUsageDictionary:(id)a4 webpageLocale:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormUsageDictionary_webpageLocale___block_invoke;
  v12[3] = &unk_1E6159720;
  id v14 = v9;
  unint64_t v15 = a3;
  id v13 = v8;
  id v10 = v9;
  id v11 = v8;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.AutoFill.DidSubmitFormAutoFillUsage" usingBlock:v12];
}

id __83__WBSAnalyticsLogger_didSubmitFormOfType_withPerFormUsageDictionary_webpageLocale___block_invoke(void *a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)a1[4];
  v12[0] = @"formType";
  unint64_t v2 = a1[6];
  if (v2 > 5) {
    unint64_t v3 = @"Invalid Form Type";
  }
  else {
    unint64_t v3 = off_1E615A268[v2];
  }
  BOOL v4 = (__CFString *)a1[5];
  if (!v4) {
    BOOL v4 = @"unknown";
  }
  v13[0] = v3;
  v13[1] = v4;
  v12[1] = @"webpageLocale";
  v12[2] = @"userRegion";
  unint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v6 = [v5 countryCode];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"unknown";
  }
  v12[3] = @"autoFillTelemetryVersion";
  v13[2] = v8;
  v13[3] = &unk_1F10861A0;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];
  id v10 = objc_msgSend(v1, "safari_dictionaryByMergingWithDictionary:", v9);

  return v10;
}

- (void)didUseCreditCardAutoFillEscapeHatchFillingNewType:(id)a3 forPreviousType:(id)a4 fieldType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__WBSAnalyticsLogger_didUseCreditCardAutoFillEscapeHatchFillingNewType_forPreviousType_fieldType___block_invoke;
  v12[3] = &unk_1E6159720;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.AutoFill.DidUseCreditCardEscapeHatch" usingBlock:v12];
}

id __98__WBSAnalyticsLogger_didUseCreditCardAutoFillEscapeHatchFillingNewType_forPreviousType_fieldType___block_invoke(void *a1)
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"newType";
  v5[1] = @"previousType";
  uint64_t v1 = a1[5];
  v6[0] = a1[4];
  v6[1] = v1;
  void v5[2] = @"fieldType";
  unint64_t v2 = stringForFieldType(a1[6]);
  void v6[2] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

- (void)didSelectFavoriteWithOpenLocation:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_didSelectFavoriteWithOpenLocation___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.StartPage.SelectedFavorite" usingBlock:v3];
}

id __56__WBSAnalyticsLogger_didSelectFavoriteWithOpenLocation___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = @"openLocation";
  unint64_t v1 = *(void *)(a1 + 32);
  if (v1 > 4) {
    unint64_t v2 = &stru_1F105D3F0;
  }
  else {
    unint64_t v2 = off_1E615A298[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didSelectFavoritesRow:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__WBSAnalyticsLogger_didSelectFavoritesRow___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Favorites" usingBlock:v3];
}

id __44__WBSAnalyticsLogger_didSelectFavoritesRow___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"favoritesRow";
  unint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didSelectFrequentlyVisitedSiteWithOpenLocation:(int64_t)a3 analyticsPayload:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __86__WBSAnalyticsLogger_didSelectFrequentlyVisitedSiteWithOpenLocation_analyticsPayload___block_invoke;
  void v8[3] = &unk_1E6159888;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.StartPage.SelectedFrequentlyVisitedSite" usingBlock:v8];
}

id __86__WBSAnalyticsLogger_didSelectFrequentlyVisitedSiteWithOpenLocation_analyticsPayload___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v8 = @"openLocation";
  unint64_t v2 = *(void *)(a1 + 40);
  if (v2 > 4) {
    unint64_t v3 = &stru_1F105D3F0;
  }
  else {
    unint64_t v3 = off_1E615A298[v2];
  }
  v9[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  unint64_t v5 = [*(id *)(a1 + 32) eventDictionaryDescription];
  id v6 = objc_msgSend(v4, "safari_dictionaryByMergingWithDictionary:", v5);

  return v6;
}

- (void)didRemoveFrequentlyVisitedSiteWithAnalyticsPayload:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __73__WBSAnalyticsLogger_didRemoveFrequentlyVisitedSiteWithAnalyticsPayload___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.StartPage.RemovedFrequentlyVisitedSite" usingBlock:v6];
}

uint64_t __73__WBSAnalyticsLogger_didRemoveFrequentlyVisitedSiteWithAnalyticsPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventDictionaryDescription];
}

- (void)didNavigateToFrequentlyVisitedSiteByAnyMeansWithAnalyticsPayload:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __87__WBSAnalyticsLogger_didNavigateToFrequentlyVisitedSiteByAnyMeansWithAnalyticsPayload___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.StartPage.VisitedFrequentlyVisitedSiteByAnyMeans" usingBlock:v6];
}

uint64_t __87__WBSAnalyticsLogger_didNavigateToFrequentlyVisitedSiteByAnyMeansWithAnalyticsPayload___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventDictionaryDescription];
}

- (void)reportSafariVersion:(id)a3 safariAndWebKitVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __65__WBSAnalyticsLogger_reportSafariVersion_safariAndWebKitVersion___block_invoke;
  void v10[3] = &unk_1E61599B8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Version" usingBlock:v10];
}

id __65__WBSAnalyticsLogger_reportSafariVersion_safariAndWebKitVersion___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  unint64_t v1 = &stru_1F105D3F0;
  v5[0] = @"safariVariant";
  v5[1] = @"safariWebkitVersion";
  unint64_t v2 = *(__CFString **)(a1 + 32);
  if (!v2) {
    unint64_t v2 = &stru_1F105D3F0;
  }
  if (*(void *)(a1 + 40)) {
    unint64_t v1 = *(__CFString **)(a1 + 40);
  }
  v6[0] = v2;
  v6[1] = v1;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (void)reportApplicationCacheSize:(unint64_t)a3
{
  unint64_t v3 = a3 >> 10;
  if (a3 >> 10 >= 0xC8) {
    unint64_t v3 = 200;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __49__WBSAnalyticsLogger_reportApplicationCacheSize___block_invoke;
  v4[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v4[4] = v3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ApplicationCache.Size" usingBlock:v4];
}

id __49__WBSAnalyticsLogger_reportApplicationCacheSize___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"value";
  unint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4
{
  id v6 = a4;
  id v7 = [NSString stringWithFormat:@"com.apple.Safari.%@", a3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __68__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage___block_invoke;
  void v9[3] = &unk_1E61597F8;
  id v8 = v6;
  id v10 = v8;
  [(WBSAnalyticsLogger *)self _sendEvent:v7 usingBlock:v9];
}

id __68__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  unint64_t v1 = &stru_1F105D3F0;
  if (*(void *)(a1 + 32)) {
    unint64_t v1 = *(__CFString **)(a1 + 32);
  }
  id v4 = @"diagnosticMessage";
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 result:(int64_t)a5
{
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"com.apple.Safari.%@", a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage_result___block_invoke;
  void v11[3] = &unk_1E6159888;
  id v10 = v8;
  id v12 = v10;
  int64_t v13 = a5;
  [(WBSAnalyticsLogger *)self _sendEvent:v9 usingBlock:v11];
}

id __75__WBSAnalyticsLogger_logDiagnosticMessageWithKey_diagnosticMessage_result___block_invoke(uint64_t a1)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    unint64_t v2 = *(__CFString **)(a1 + 32);
  }
  else {
    unint64_t v2 = &stru_1F105D3F0;
  }
  v7[0] = @"diagnosticMessage";
  v7[1] = @"result";
  v8[0] = v2;
  unint64_t v3 = @"noop";
  if (v1 == 1) {
    unint64_t v3 = @"fail";
  }
  if (!v1) {
    unint64_t v3 = @"pass";
  }
  id v4 = v3;
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10) {
    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F28FE8] scannerWithString:v10];
  uint64_t v12 = 0;
  if (![v11 scanInteger:&v12] || !objc_msgSend(v11, "isAtEnd"))
  {

LABEL_6:
    [(WBSAnalyticsLogger *)self _logDiagnosticMessageWithKey:v8 diagnosticMessage:v9 stringValue:v10];
    goto LABEL_7;
  }
  [(WBSAnalyticsLogger *)self _logDiagnosticMessageWithKey:v8 diagnosticMessage:v9 integerValue:v12];

LABEL_7:
}

- (void)_logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 stringValue:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [NSString stringWithFormat:@"com.apple.Safari.%@", a3];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_stringValue___block_invoke;
  v13[3] = &unk_1E61599B8;
  id v11 = v8;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  [(WBSAnalyticsLogger *)self _sendEvent:v10 usingBlock:v13];
}

id __81__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_stringValue___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = &stru_1F105D3F0;
  v5[0] = @"diagnosticMessage";
  v5[1] = @"stringValue";
  unint64_t v2 = *(__CFString **)(a1 + 32);
  if (!v2) {
    unint64_t v2 = &stru_1F105D3F0;
  }
  if (*(void *)(a1 + 40)) {
    uint64_t v1 = *(__CFString **)(a1 + 40);
  }
  v6[0] = v2;
  v6[1] = v1;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  return v3;
}

- (void)_logDiagnosticMessageWithKey:(id)a3 diagnosticMessage:(id)a4 integerValue:(int64_t)a5
{
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"com.apple.Safari.%@", a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_integerValue___block_invoke;
  void v11[3] = &unk_1E6159888;
  id v10 = v8;
  id v12 = v10;
  int64_t v13 = a5;
  [(WBSAnalyticsLogger *)self _sendEvent:v9 usingBlock:v11];
}

id __82__WBSAnalyticsLogger__logDiagnosticMessageWithKey_diagnosticMessage_integerValue___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32)) {
    unint64_t v2 = *(__CFString **)(a1 + 32);
  }
  else {
    unint64_t v2 = &stru_1F105D3F0;
  }
  v6[0] = @"diagnosticMessage";
  v6[1] = @"integerValue";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithInteger:v1];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didCreateNewTabGroup
{
}

uint64_t __42__WBSAnalyticsLogger_didCreateNewTabGroup__block_invoke()
{
  return 0;
}

- (void)didOpenTabGroupDropDownMenu
{
}

uint64_t __49__WBSAnalyticsLogger_didOpenTabGroupDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didSelectTabGroupInDropDownMenu
{
}

uint64_t __53__WBSAnalyticsLogger_didSelectTabGroupInDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didSelectStartPrivateWindowInDropDownMenu
{
}

uint64_t __63__WBSAnalyticsLogger_didSelectStartPrivateWindowInDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didCreateNewTabGroupFromTheDropDownMenu
{
}

uint64_t __61__WBSAnalyticsLogger_didCreateNewTabGroupFromTheDropDownMenu__block_invoke()
{
  return 0;
}

- (void)didSendTabGroup
{
}

uint64_t __37__WBSAnalyticsLogger_didSendTabGroup__block_invoke()
{
  return 0;
}

- (void)reportAverageNumberOfTabsPerTabGroup:(int64_t)a3 andMaximum:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __70__WBSAnalyticsLogger_reportAverageNumberOfTabsPerTabGroup_andMaximum___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.SafariShared.TabGroups.AverageNumberOfTabsPerTabGroup" usingBlock:v4];
}

id __70__WBSAnalyticsLogger_reportAverageNumberOfTabsPerTabGroup_andMaximum___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"avgNumberOfTabs";
  unint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v6[1] = @"maximumNumberOfTabs";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportTabsForNonTabGroupUser:(int64_t)a3 andAverageNumber:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __68__WBSAnalyticsLogger_reportTabsForNonTabGroupUser_andAverageNumber___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.SafariShared.TabGroups.NonTabGroupUsersTabs" usingBlock:v4];
}

id __68__WBSAnalyticsLogger_reportTabsForNonTabGroupUser_andAverageNumber___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"avgAgeOfOpenTabs";
  unint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v6[1] = @"numOfOpenTabs";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportNumberOfTabGroups:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__WBSAnalyticsLogger_reportNumberOfTabGroups___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.SafariShared.TabGroups.NumberOfTabGroups" usingBlock:v3];
}

id __46__WBSAnalyticsLogger_reportNumberOfTabGroups___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"totalNumberOfTabGroups";
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didCreateTabGroupFromLocation:(int64_t)a3 prepopulatedWithTabs:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __73__WBSAnalyticsLogger_didCreateTabGroupFromLocation_prepopulatedWithTabs___block_invoke;
  v4[3] = &__block_descriptor_41_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  BOOL v5 = a4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.TabGroups.CreatedTabGroup" usingBlock:v4];
}

id __73__WBSAnalyticsLogger_didCreateTabGroupFromLocation_prepopulatedWithTabs___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"source";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 0xA) {
    unint64_t v2 = @"sidebar";
  }
  else {
    unint64_t v2 = off_1E615A2C0[v1];
  }
  v7[0] = v2;
  v6[1] = @"prepopulatedWithTabs";
  unint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)didSwitchToTabGroupFromLocation:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__WBSAnalyticsLogger_didSwitchToTabGroupFromLocation___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.TabGroups.SwitchedToTabGroup" usingBlock:v3];
}

id __54__WBSAnalyticsLogger_didSwitchToTabGroupFromLocation___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"source";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 0xA) {
    unint64_t v2 = @"sidebar";
  }
  else {
    unint64_t v2 = off_1E615A2C0[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)reportMacOSToolbarButtonUsage:(int64_t)a3 withLayout:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __63__WBSAnalyticsLogger_reportMacOSToolbarButtonUsage_withLayout___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.ToolbarButtonUsage" usingBlock:v4];
}

id __63__WBSAnalyticsLogger_reportMacOSToolbarButtonUsage_withLayout___block_invoke(uint64_t a1)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"buttonName";
  unint64_t v2 = stringForToolbarButtonType(*(void *)(a1 + 32));
  v7[1] = @"provenance";
  v8[0] = v2;
  unint64_t v3 = *(void *)(a1 + 40) - 1;
  if (v3 > 4) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_1E615A440[v3];
  }
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)reportIOSToolbarButtonUsage:(int64_t)a3 withLayout:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __61__WBSAnalyticsLogger_reportIOSToolbarButtonUsage_withLayout___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.MobileSafari.ToolbarButtonUsage" usingBlock:v4];
}

id __61__WBSAnalyticsLogger_reportIOSToolbarButtonUsage_withLayout___block_invoke(uint64_t a1)
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"buttonName";
  unint64_t v2 = stringForToolbarButtonType(*(void *)(a1 + 32));
  v7[1] = @"provenance";
  v8[0] = v2;
  unint64_t v3 = *(void *)(a1 + 40) - 1;
  if (v3 > 4) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_1E615A440[v3];
  }
  v8[1] = v4;
  BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)reportSVCToolbarButtonUsage:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__WBSAnalyticsLogger_reportSVCToolbarButtonUsage___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.SafariViewController.ToolbarButtonUsage" usingBlock:v3];
}

id __50__WBSAnalyticsLogger_reportSVCToolbarButtonUsage___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"buttonName";
  unint64_t v1 = stringForToolbarButtonType(*(void *)(a1 + 32));
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didPerformMoreMenuAction:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__WBSAnalyticsLogger_didPerformMoreMenuAction___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.PerformedMoreMenuAction" usingBlock:v3];
}

id __47__WBSAnalyticsLogger_didPerformMoreMenuAction___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"actionType";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 0xA) {
    unint64_t v2 = @"stop";
  }
  else {
    unint64_t v2 = off_1E615A468[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didUseSidebarAction:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__WBSAnalyticsLogger_didUseSidebarAction___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.SidebarAction" usingBlock:v3];
}

id __42__WBSAnalyticsLogger_didUseSidebarAction___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"action";
  unint64_t v1 = *(void *)(a1 + 32) - 1;
  if (v1 > 0x13) {
    unint64_t v2 = @"local tab group selected";
  }
  else {
    unint64_t v2 = off_1E615A4C0[v1];
  }
  v6[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void)didToggleMagicMenuSBA
{
}

- (void)didClickFindInPageSBA
{
}

- (void)didClickZoomOutSBA
{
}

- (void)didClickZoomInSBA
{
}

- (void)didClickZoomSelectorSBA
{
}

- (void)didClickWebsiteSettingsSBA
{
}

- (void)didToggleReaderSBA
{
}

- (void)didEnableScribble
{
}

- (void)didFinishScribble:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__WBSAnalyticsLogger_didFinishScribble___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Scribble.didFinishScribble" usingBlock:v3];
}

id __40__WBSAnalyticsLogger_didFinishScribble___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"changesMade";
  unint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didClearScribble
{
}

- (void)didCancelScribble
{
}

- (void)didHideMoreItems
{
}

- (void)reportNumberOfWebsitesWithScribbleActive:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__WBSAnalyticsLogger_reportNumberOfWebsitesWithScribbleActive___block_invoke;
  v3[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v3[4] = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Scribble.reportNumberOfWebsitesWithScribbleActive" usingBlock:v3];
}

id __63__WBSAnalyticsLogger_reportNumberOfWebsitesWithScribbleActive___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"websites";
  unint64_t v1 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportUserConsentStateSBA:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __48__WBSAnalyticsLogger_reportUserConsentStateSBA___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.SmartBrowsingAssistant.userConsentState" usingBlock:v6];
}

id __48__WBSAnalyticsLogger_reportUserConsentStateSBA___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"consentState";
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)didVisitWebpageSBAWithUserOptedIn:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__WBSAnalyticsLogger_didVisitWebpageSBAWithUserOptedIn___block_invoke;
  v3[3] = &__block_descriptor_33_e19___NSDictionary_8__0l;
  BOOL v4 = a3;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.SmartBrowsingAssistant.didVisitWebpage" usingBlock:v3];
}

id __56__WBSAnalyticsLogger_didVisitWebpageSBAWithUserOptedIn___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = @"optedIn";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didShowSparkleSBA
{
}

- (void)didClickSparkleSBA
{
}

- (void)didShowEntityCardSBA
{
}

- (void)didClickEntityCardSBA
{
}

- (void)didShowSummaryCardSBA
{
}

- (void)didClickSummaryCardSBA
{
}

- (void)safariDidBeginTerminationWithReason:(int64_t)a3
{
  self->_safariIsTerminating = 1;
  if (a3 || !self->_safariQuitReason) {
    self->_safariQuitReason = a3;
  }
}

- (void)safariDidCancelTermination
{
  *(_WORD *)&self->_safariIsTerminating = 0;
  self->_safariQuitReason = 0;
}

- (void)reportBlockingSafariQuitWithReason:(int64_t)a3
{
  if (self->_safariIsTerminating && (a3 || !self->_safariReportedNonOtherBlockingReason))
  {
    int64_t safariQuitReason = self->_safariQuitReason;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __57__WBSAnalyticsLogger_reportBlockingSafariQuitWithReason___block_invoke;
    v4[3] = &unk_1E6159C80;
    void v4[4] = self;
    void v4[5] = a3;
    void v4[6] = safariQuitReason;
    [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.BlockingSafariQuit" usingBlock:v4];
  }
}

id __57__WBSAnalyticsLogger_reportBlockingSafariQuitWithReason___block_invoke(void *a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  if (a1[5]) {
    *(unsigned char *)(a1[4] + 41) = 1;
  }
  v6[0] = @"blockingReason";
  unint64_t v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6[1] = @"quitReason";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithInteger:a1[6]];
  v7[1] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportSafariTabStateMismatchWithError:(int64_t)a3 systemTALEnabled:(BOOL)a4 safariRestoreOnLaunchEnabled:(BOOL)a5 excludePrivateWindows:(BOOL)a6 systemSaysPreserveState:(BOOL)a7 stringRepresentation:(id)a8
{
  id v14 = a8;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __173__WBSAnalyticsLogger_reportSafariTabStateMismatchWithError_systemTALEnabled_safariRestoreOnLaunchEnabled_excludePrivateWindows_systemSaysPreserveState_stringRepresentation___block_invoke;
  v16[3] = &unk_1E6159CA8;
  BOOL v19 = a4;
  BOOL v20 = a5;
  BOOL v21 = a6;
  BOOL v22 = a7;
  id v17 = v14;
  int64_t v18 = a3;
  id v15 = v14;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.SafariTabStateError" usingBlock:v16];
}

id __173__WBSAnalyticsLogger_reportSafariTabStateMismatchWithError_systemTALEnabled_safariRestoreOnLaunchEnabled_excludePrivateWindows_systemSaysPreserveState_stringRepresentation___block_invoke(uint64_t a1)
{
  void v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"errorType";
  unint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v11[0] = v2;
  v10[1] = @"systemTALEnabled";
  unint64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v11[1] = v3;
  void v10[2] = @"safariRestoreOnLaunchEnabled";
  BOOL v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
  v11[2] = v4;
  void v10[3] = @"excludePrivateWindows";
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 50)];
  void v11[3] = v5;
  void v10[4] = @"preserveState";
  id v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 51)];
  void v10[5] = @"stringRepresentation";
  uint64_t v7 = *(void *)(a1 + 32);
  void v11[4] = v6;
  void v11[5] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

- (void)reportTabGroupSyncFinishedWithInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __57__WBSAnalyticsLogger_reportTabGroupSyncFinishedWithInfo___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.TabGroups.Sync.SyncFinished" usingBlock:v6];
}

id __57__WBSAnalyticsLogger_reportTabGroupSyncFinishedWithInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportTabGroupSyncSuccessesWithCount:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__WBSAnalyticsLogger_reportTabGroupSyncSuccessesWithCount___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.TabGroups.Sync.SyncFinished" usingBlock:v6];
}

id __59__WBSAnalyticsLogger_reportTabGroupSyncSuccessesWithCount___block_invoke(uint64_t a1)
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"syncResult";
  v4[1] = @"periodicCount";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = &unk_1F10861B8;
  v5[1] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)reportAdvancedPrivacyProtectionPreference
{
  unint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if ([v3 BOOLForKey:@"EnableEnhancedPrivacyInPrivateBrowsing"])
  {
    int v4 = [v3 BOOLForKey:@"EnableEnhancedPrivacyInRegularBrowsing"];
    uint64_t v5 = 1;
    if (v4) {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __63__WBSAnalyticsLogger_reportAdvancedPrivacyProtectionPreference__block_invoke;
  void v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v6[4] = v5;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.Preferences.ReportAdvancedPrivacyProtectionStatus" usingBlock:v6];
}

id __63__WBSAnalyticsLogger_reportAdvancedPrivacyProtectionPreference__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"preference";
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = @"disabled";
  if (v1 == 1) {
    unint64_t v2 = @"private browsing only";
  }
  if (v1 == 2) {
    unint64_t v3 = @"all browsing";
  }
  else {
    unint64_t v3 = v2;
  }
  int v4 = v3;
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)reportNumberOfWebApps:(int64_t)a3 andBookmarks:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __57__WBSAnalyticsLogger_reportNumberOfWebApps_andBookmarks___block_invoke;
  v4[3] = &__block_descriptor_48_e19___NSDictionary_8__0l;
  void v4[4] = a3;
  void v4[5] = a4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.MobileSafari.WebClipCount" usingBlock:v4];
}

id __57__WBSAnalyticsLogger_reportNumberOfWebApps_andBookmarks___block_invoke(uint64_t a1)
{
  void v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"webAppCount";
  unint64_t v2 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v6[1] = @"bookmarkCount";
  v7[0] = v2;
  unint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v7[1] = v3;
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (void)reportWebContentProcessInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__WBSAnalyticsLogger_reportWebContentProcessInfo___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.WebContentProcessInfo" usingBlock:v6];
}

id __50__WBSAnalyticsLogger_reportWebContentProcessInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)reportAllProcessInfo:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __43__WBSAnalyticsLogger_reportAllProcessInfo___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEventAddingVersionInfo:@"com.apple.Safari.AllProcessInfo" usingBlock:v6];
}

id __43__WBSAnalyticsLogger_reportAllProcessInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_bundleIdDictionaryWithArray:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __51__WBSAnalyticsLogger__bundleIdDictionaryWithArray___block_invoke;
  void v7[3] = &unk_1E6159CD0;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __51__WBSAnalyticsLogger__bundleIdDictionaryWithArray___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"bundleID%d", (a3 + 1));
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

- (void)didShowBrowserChoiceScreen:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __49__WBSAnalyticsLogger_didShowBrowserChoiceScreen___block_invoke;
  void v6[3] = &unk_1E61599B8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.BrowserChoice.didShowBrowserChoice" usingBlock:v6];
}

uint64_t __49__WBSAnalyticsLogger_didShowBrowserChoiceScreen___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bundleIdDictionaryWithArray:*(void *)(a1 + 40)];
}

- (void)didSelectBrowserChoice:(id)a3 browserAlreadyInstalled:(BOOL)a4 browsersWithProductPagesViewed:(id)a5 browserList:(id)a6 userCohort:(int64_t)a7 listContainsDisabledBrowser:(BOOL)a8 userTriedSelectingDisabledBrowser:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  int64_t v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v16);
  BOOL v19 = [(WBSAnalyticsLogger *)self _bundleIdDictionaryWithArray:v17];
  BOOL v20 = (void *)[v19 mutableCopy];
  [v18 addEntriesFromDictionary:v20];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __185__WBSAnalyticsLogger_didSelectBrowserChoice_browserAlreadyInstalled_browsersWithProductPagesViewed_browserList_userCohort_listContainsDisabledBrowser_userTriedSelectingDisabledBrowser___block_invoke;
  v32[3] = &unk_1E6159CF8;
  id v21 = v18;
  id v33 = v21;
  id v22 = v16;
  id v34 = v22;
  [v17 enumerateObjectsUsingBlock:v32];
  unint64_t v23 = [NSNumber numberWithInteger:a7];
  [v21 setObject:v23 forKeyedSubscript:@"userChoiceExperience"];

  unint64_t v24 = [NSNumber numberWithBool:v9];
  [v21 setObject:v24 forKeyedSubscript:@"listContainsDisabledBrowser"];

  unint64_t v25 = [NSNumber numberWithBool:a9];
  [v21 setObject:v25 forKeyedSubscript:@"userTriedSelectingDisabledBrowser"];

  if (v15)
  {
    [v21 setObject:v15 forKeyedSubscript:@"selectedBundleID"];
    BOOL v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v22, "containsObject:", v15));
    [v21 setObject:v26 forKeyedSubscript:@"selectedBundleIDProductPageViewed"];

    BOOL v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "indexOfObject:", v15) + 1);
    [v21 setObject:v27 forKeyedSubscript:@"browserPosition"];

    BOOL v28 = [NSNumber numberWithBool:v13];
    [v21 setObject:v28 forKeyedSubscript:@"alreadyInstalled"];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __185__WBSAnalyticsLogger_didSelectBrowserChoice_browserAlreadyInstalled_browsersWithProductPagesViewed_browserList_userCohort_listContainsDisabledBrowser_userTriedSelectingDisabledBrowser___block_invoke_2;
  v30[3] = &unk_1E61597F8;
  id v29 = v21;
  id v31 = v29;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.BrowserChoice.didSelectBrowserChoice" usingBlock:v30];
}

void __185__WBSAnalyticsLogger_didSelectBrowserChoice_browserAlreadyInstalled_browsersWithProductPagesViewed_browserList_userCohort_listContainsDisabledBrowser_userTriedSelectingDisabledBrowser___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v7 = a2;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"bundleID%dProductPageViewed", (a3 + 1));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "containsObject:", v7));
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

id __185__WBSAnalyticsLogger_didSelectBrowserChoice_browserAlreadyInstalled_browsersWithProductPagesViewed_browserList_userCohort_listContainsDisabledBrowser_userTriedSelectingDisabledBrowser___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)didViewBrowserProductPage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __48__WBSAnalyticsLogger_didViewBrowserProductPage___block_invoke;
  void v6[3] = &unk_1E61597F8;
  id v7 = v4;
  id v5 = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Safari.BrowserChoice.didViewBrowserProductPage" usingBlock:v6];
}

id __48__WBSAnalyticsLogger_didViewBrowserProductPage___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  id v4 = @"bundleID";
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (void)reportIsUsingPasswordsApp:(BOOL)a3 isUsingCredentialProviderExtension:(BOOL)a4
{
  uint64_t v4 = 2;
  if (!a4) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 3;
  if (!a4) {
    uint64_t v5 = 1;
  }
  if (a3) {
    uint64_t v4 = v5;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __83__WBSAnalyticsLogger_reportIsUsingPasswordsApp_isUsingCredentialProviderExtension___block_invoke;
  void v6[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v6[4] = v4;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Passwords.PasswordAutoFillProviderConfiguration" usingBlock:v6];
}

id __83__WBSAnalyticsLogger_reportIsUsingPasswordsApp_isUsingCredentialProviderExtension___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"passwordAutoFillProviderConfiguration";
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)reportVerificationCodeProvider:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    int v5 = [v4 isEqualToString:@"com.apple.Passwords"];
    uint64_t v6 = 1;
    if (!v5) {
      uint64_t v6 = 2;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __53__WBSAnalyticsLogger_reportVerificationCodeProvider___block_invoke;
  void v7[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  void v7[4] = v6;
  [(WBSAnalyticsLogger *)self _sendEvent:@"com.apple.Passwords.PasswordAutoFillProviderConfiguration" usingBlock:v7];
}

id __53__WBSAnalyticsLogger_reportVerificationCodeProvider___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"passwordAutoFillVerificationCodeProviderConfiguration";
  uint64_t v1 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[0] = v1;
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perSitePreferencesPopoverLocation, 0);
  objc_storeStrong((id *)&self->_safariVersion, 0);
  objc_storeStrong((id *)&self->_analyticsSynchronizationQueue, 0);
}

@end