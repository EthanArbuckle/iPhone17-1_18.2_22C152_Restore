@interface TabController
- (BOOL)_makeRoomForNewTab:(TabDocument *)a1;
- (BOOL)_shouldCloseAfterAutomaticallySwitchingFromTab:(BOOL)a1;
- (BOOL)_switchToTab:(void *)a3 orTabUUID:(void *)a4 inTabGroup:;
- (BOOL)canAddNewTabForCurrentBrowsingMode;
- (BOOL)canAddNewTabForPrivateBrowsing:(BOOL)a3;
- (BOOL)canAddNewTabInTabGroup:(id)a3;
- (BOOL)canAddNewTabInTabGroup:(id)a3 withTabCount:(unint64_t)a4;
- (BOOL)canCloseOtherTabs;
- (BOOL)canCloseTab;
- (BOOL)canCloseTabWithUUID:(id)a3;
- (BOOL)canCloseWBTab:(id)a3;
- (BOOL)canCreateTabGroupFromCurrentTabs;
- (BOOL)canRenameActiveTabGroup;
- (BOOL)createTabGroupAlertIsPresented;
- (BOOL)hasActiveLibrary;
- (BOOL)hasMultipleProfiles;
- (BOOL)hasNamedTabGroups;
- (BOOL)hasTabsThatShouldBeObscuredForDigitalHealth;
- (BOOL)hasUnreadTab;
- (BOOL)isControlledByAutomation;
- (BOOL)isInDefaultProfile;
- (BOOL)isPrivateBrowsingAndLocked;
- (BOOL)isPrivateBrowsingEnabled;
- (BOOL)isShowingLibraryDocument;
- (BOOL)isTabGroupActive:(id)a3;
- (BOOL)isTabGroupUUIDExpanded:(id)a3;
- (BOOL)isTabPinnable:(id)a3;
- (BOOL)isTabUUIDActive:(id)a3;
- (BOOL)isTabWithUUIDBeingHiddenFromTabView:(id)a3;
- (BOOL)moveTabWithUUID:(id)a3 fromForeignLocalGroupWithUUIDIntoActiveGroup:(id)a4;
- (BOOL)readState;
- (BOOL)scrollTabSwitcherToTabGroupIfShowing:(id)a3;
- (BOOL)selectFirstUnpinnedTab;
- (BOOL)shouldAllowScrollingPinnedItems;
- (BOOL)shouldTogglePrivateBrowsingOnSplit;
- (BOOL)switchToTabWithUUID:(id)a3 inTabGroupWithUUID:(id)a4;
- (BOOL)trySwitchingToPinnedTabOnNavigationToURL:(id)a3;
- (BOOL)updatingTabGroupTabs;
- (CKShare)shareRecordForActiveTabGroup;
- (CKShare)shareRecordForActiveTabGroupIfIsShared;
- (CloudTabStore)cloudTabStore;
- (CollectionViewTab)blankTabToReuse;
- (CollectionViewTab)hiddenTabForExplanationView;
- (CollectionViewTab)tabBeingActivated;
- (NSArray)allSyntheticBookmarkFolders;
- (NSArray)allTabDocuments;
- (NSArray)alternateTabs;
- (NSArray)currentTabDocuments;
- (NSArray)currentTabs;
- (NSArray)namedTabGroups;
- (NSArray)normalAndPrivateTabs;
- (NSArray)normalTabs;
- (NSArray)normalUnpinnedTabDocuments;
- (NSArray)normalUnpinnedTabs;
- (NSArray)pinnedTabDocuments;
- (NSArray)pinnedTabs;
- (NSArray)privateTabDocuments;
- (NSArray)privateTabs;
- (NSArray)privateUnpinnedTabDocuments;
- (NSArray)privateUnpinnedTabs;
- (NSArray)profiles;
- (NSArray)tabDocuments;
- (NSArray)tabDocumentsForAllTabGroups;
- (NSArray)tabGroups;
- (NSArray)tabsMatchingSearchTerm;
- (NSArray)unnamedTabGroups;
- (NSArray)unpinnedTabDocuments;
- (NSArray)unpinnedTabs;
- (NSSet)nonActiveTabGroupsInCurrentBrowsingMode;
- (NSString)activeLibraryType;
- (NSString)activeProfileIdentifier;
- (NSString)activeTabGroupUUID;
- (NSString)activeTabUUID;
- (NSString)deviceIdentifier;
- (NSString)moveLocalTabsToNewGroupTitle;
- (NSString)startPageBackgroundImageIdentifier;
- (NSUUID)browserWindowUUID;
- (NSUndoManager)undoManager;
- (PinnedTabsManager)pinnedTabsManager;
- (TabCollectionViewProviding)tabCollectionViewProvider;
- (TabController)initWithBrowserController:(id)a3;
- (TabDocument)_activeTabDocumentForTabGroup:(TabDocument *)a1;
- (TabDocument)_insertNewBlankTabDocumentWithOptions:(uint64_t)a3 inBackground:(uint64_t)a4 animated:;
- (TabDocument)_openTabForDroppedLinkAtIndex:(uint64_t)a3 pinned:;
- (TabDocument)_tabDocumentForWebClip:(TabDocument *)a1;
- (TabDocument)_unhibernateTabIfNeeded:(TabDocument *)a1;
- (TabDocument)activeNonLibraryTab;
- (TabDocument)activeTabDocument;
- (TabDocument)hiddenPrivateTabDocumentWhenShowingPrivateBrowsingExplanationText;
- (TabDocument)normalActiveTabDocument;
- (TabDocument)privateActiveTabDocument;
- (TabDocument)singleUnpinnedBlankTab;
- (TabDocument)tabDocumentBeingActivated;
- (TabDocument)tabDocumentForSpotlightSearch;
- (UIImage)iconForSharingActiveTabGroup;
- (UIMenu)menuForSwitchingProfiles;
- (UIMenu)menuForSwitchingProfilesQuickly;
- (UIMenu)newTabGroupMenu;
- (UIMenu)submenuForSwitchingProfiles;
- (UIMenu)tabExposeMenu;
- (WBProfile)activeProfile;
- (WBSCloudTabDeviceProvider)profileCloudTabStore;
- (WBSTabOrderManager)tabOrderManager;
- (WBTabGroup)activeTabGroup;
- (WBTabGroup)activeTabGroupOrTabGroupVisibleInSwitcher;
- (WBTabGroup)focusedTabGroup;
- (WBTabGroup)privateTabGroupIfAvailable;
- (WBTabGroup)unnamedTabGroup;
- (WBTabGroupManager)tabGroupManager;
- (WBWindowState)windowState;
- (_SWCollaborationButtonView)tabOverviewCollaborationButton;
- (char)_activeTabDocumentForPrivateBrowsing:(char *)a1;
- (char)_mutableTabsForPrivateBrowsing:(char *)a1;
- (char)_tabsForPrivateBrowsing:(char *)a1;
- (char)mutableAlternateTabs;
- (char)mutableCurrentTabs;
- (id)_activeTabGroupForWindowState:(void *)a1;
- (id)_addTabGroup:(void *)a3 fromTabs:;
- (id)_allTabGroupsAcrossWindows;
- (id)_application;
- (id)_containerForPinnedTabsInTabGroup:(void *)a1;
- (id)_createFromCurrentTabsActionForTabGroupsMenu:(void *)a1;
- (id)_createNewTabGroupActionForTabGroupsMenu:(uint64_t)a1;
- (id)_deleteActionForTabGroup:(char)a3 forPickerSheet:;
- (id)_dropWBTab:(void *)a3 fromBrowserController:(unint64_t)a4 atIndex:(int)a5 pinned:(void *)a6 anchorTab:;
- (id)_findPinnedTabMatchingURL:(void *)a1;
- (id)_firstUnpinnedTab;
- (id)_focusedTabGroupForWindowState:(unsigned char *)a1;
- (id)_foreignLocalTabGroupWithUUID:(id *)a1;
- (id)_imageForTabGroupButton;
- (id)_insertNewBlankTabDocumentWithPrivateBrowsing:(uint64_t)a3 inBackground:(uint64_t)a4 animated:;
- (id)_localTabGroupTitleProvider;
- (id)_mutableTabsForTabGroup:(uint64_t)a1;
- (id)_oldestInactiveTabDocumentForPrivateBrowsing:(void *)a1;
- (id)_openBlankTabDocument;
- (id)_renameActionForTabGroup:(char)a3 forPickerSheet:;
- (id)_representativeHostForTabGroup:(void *)a1;
- (id)_shareActionForTabGroup:(void *)a1;
- (id)_subMenusForTabGroup:(uint64_t)a3 variant:;
- (id)_switchToTabGroupMenu;
- (id)_syncedTabGroupsForActiveProfileWithOptions:(void *)a1;
- (id)_tabCountForDisplay;
- (id)_tabForWBTab:(unsigned char *)a3 didReuseTabDocument:;
- (id)_tabForWBTab:(id *)a1;
- (id)_tabGroupAlertControllerWithTitle:(uint64_t)a3 message:(void *)a4 okActionTitle:(uint64_t)a5 role:(char)a6 showingSuggestionsIfPossible:(void *)a7 actionHandler:(void *)a8 completionHandler:;
- (id)_tabGroupShareSheetWithTabGroupActivityItemConfiguration:(void *)a1;
- (id)_tabGroupsFromAllWindows;
- (id)_titleForTabGroupButton;
- (id)_toggleSidebarSectionIsExpandedActionForTabGroup:(void *)a1;
- (id)_toggleTabViewActionForTabGroup:(id *)a1;
- (id)_undoCloseAllTabsActionName;
- (id)_urlForActiveTabInTabGroup:(void *)a1;
- (id)addNewTabGroupWithTitle:(id)a3 fromExistingTabs:(BOOL)a4;
- (id)addNewTabGroupWithTitle:(id)a3 fromTabs:(id)a4;
- (id)appendWBTabInTabGroupWithUUID:(id)a3;
- (id)browserControllerContainingLocalTabGroupUUID:(id)a3;
- (id)cachedTabSwitcherShareConfigurationForTabGroup:(id)a3;
- (id)contextMenuConfigurationForTab:(id)a3 inTabGroup:(id)a4;
- (id)contextMenuConfigurationForTabGroup:(id)a3 variant:(int64_t)a4;
- (id)copyBookmark:(id)a3 toPerTabGroupBookmarkFolderWithID:(int)a4;
- (id)defaultTabToSelectInTabGroup:(id)a3;
- (id)dragItemForTab:(id)a3 tabItem:(id)a4;
- (id)dropTabsAtIndex:(unint64_t)a3 pinned:(BOOL)a4 dropSession:(id)a5 dragItems:(id)a6;
- (id)duplicateTab:(id)a3;
- (id)existingPersistedTitleForTabDocument:(id)a3;
- (id)globalPinnedTabsForTabGroup:(id)a3;
- (id)iconForSharingTabGroup:(id)a3;
- (id)iconForTabUUID:(id)a3;
- (id)imageForTabGroup:(id)a3;
- (id)menuForTabGroup:(id)a3 variant:(int64_t)a4;
- (id)moveMenuOnPageMenuWithDismissHandler:(id)a3;
- (id)normalPinnedTabs;
- (id)oldestTabsWithLimit:(unint64_t)a3 inPrivateBrowsing:(BOOL)a4;
- (id)openInTabGroupMenuWithNewTabGroupName:(id)a3 URL:(id)a4 descendantCount:(int64_t)a5 handler:(id)a6;
- (id)originatingTabForTab:(id)a3;
- (id)perTabGroupBookmarkListForFolderID:(int)a3 filteredUsingString:(id)a4;
- (id)pinnedWBTabsForTabGroup:(id)a3;
- (id)privatePinnedTabs;
- (id)profilesMenuElementsWithOptions:(unint64_t)a3 movingSelectedTabGroups:(id)a4 actionHandler:(id)a5;
- (id)recentlyClosedTabsMenuForTabGroupWithUUID:(id)a3;
- (id)representativeURLForTabGroupConfirmationAlert:(id)a3;
- (id)swipeActionsConfigurationForTab:(id)a3 inTabGroup:(id)a4;
- (id)swipeActionsConfigurationForTabGroup:(id)a3 forPickerSheet:(BOOL)a4;
- (id)switchToTabDocumentForWebClip:(id)a3;
- (id)syntheticBookmarkFolderForTabGroup:(id)a3 withAttribution:(BOOL)a4;
- (id)syntheticBookmarkFoldersIncludingActiveTabGroup:(BOOL)a3;
- (id)tabAtIndex:(unint64_t)a3;
- (id)tabDocumentForURL:(id)a3;
- (id)tabDocumentForURL:(id)a3 forceUnhibernate:(BOOL)a4;
- (id)tabDocumentWithUUID:(id)a3;
- (id)tabForURL:(id)a3;
- (id)tabGroupRelatedToTabWithUUID:(id)a3;
- (id)tabGroupShareSheetForCurrentTabGroup;
- (id)tabGroupSwitcherViewController;
- (id)tabGroupWithUUID:(id)a3;
- (id)tabGroupsForProfileWithIdentifier:(id)a3;
- (id)tabGroupsMenuChildrenProvider;
- (id)tabGroupsMenuElementsWithOptions:(unint64_t)a3 newTabGroupName:(id)a4 hostTitle:(id)a5 descendantCount:(int64_t)a6 movingSelectedTabs:(id)a7 actionHandler:(id)a8;
- (id)tabGroupsMenuElementsWithOptions:(unint64_t)a3 newTabGroupName:(id)a4 hostTitle:(id)a5 descendantCount:(int64_t)a6 movingSelectedTabs:(id)a7 actionHandler:(id)a8 dismissHandler:(id)a9;
- (id)tabGroupsMenuForTabGroupButton:(BOOL)a3;
- (id)tabThumbnailCollectionView;
- (id)tabWithIDForWebExtensions:(double)a3;
- (id)tabWithUUID:(id)a3;
- (id)tabsOlderThan:(id)a3 inPrivateBrowsing:(BOOL)a4;
- (id)topScopedBookmarkListForActiveTabGroup;
- (id)unnamedTabGroupDisplayTitleProvider;
- (id)updateProfileWithIdentifier:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6;
- (id)wbTabWithUUID:(id)a3;
- (int64_t)privateBrowsingMode;
- (int64_t)tabDisplayMode;
- (uint64_t)_controlledByAutomation;
- (uint64_t)_copyLinksActionForTabGroup:(char)a3 forPickerSheet:;
- (uint64_t)_currentTabsAreBlank;
- (uint64_t)_didCompleteStateRestoration;
- (uint64_t)_indexForInsertionAfterTab:(int)a3 withPrivateBrowsingEnabled:;
- (uint64_t)_indexForInsertionBeforeTab:(int)a3 withPrivateBrowsingEnabled:;
- (uint64_t)_performWithFixedTabBarItems:(uint64_t)result;
- (uint64_t)_shouldReloadAfterAutomaticallySwitchingToTab:(uint64_t)a1;
- (uint64_t)_tabShouldBeHiddenFromWebExtensions:(void *)a1;
- (uint64_t)_wbTabIsBlank:(uint64_t)a1;
- (uint64_t)_wbTabIsShowingStartPageOverriddenByExtension:(void *)a1;
- (uint64_t)canCloseLastTabInTabGroup:(uint64_t)a1;
- (uint64_t)isTabInActiveTabGroup:(uint64_t)result;
- (uint64_t)tabCollectionViewManager;
- (unint64_t)indexForTab:(id)a3;
- (unint64_t)indexOfSelectedTab;
- (unint64_t)numberOfCurrentNonHiddenTabs;
- (unint64_t)numberOfTabs;
- (unint64_t)numberOfTabsForCloseAllAction;
- (void)_addNewActiveTabOverviewTab;
- (void)_addTabsToRecentlyClosed:(uint64_t)a1;
- (void)_appendTab:(void *)a3 toTabGroup:;
- (void)_beganSharingTabGroup:(id)a3;
- (void)_cancelPendingUpdateUserActivityTimer;
- (void)_cancelVeryRecentlyClosedTabCountInvalidationTimer;
- (void)_closeLibraryIfNeeded;
- (void)_closeTab:(unsigned int)a3 animated:(int)a4 allowAddingToRecentlyClosedTabs:(char)a5 keepWebViewAlive:(int)a6 showAutoCloseTabsAlert:;
- (void)_closeTabGroup:(id *)a1;
- (void)_closeTabs:(unsigned int)a3 animated:(int)a4 allowAddingToRecentlyClosedTabs:(char)a5 keepWebViewAlive:(int)a6 showAutoCloseTabsAlert:;
- (void)_cloudTabsDidUpdate:(id)a3;
- (void)_createInitialPrivateTabIfNeeded;
- (void)_createVeryRecentlyClosedTabCountInvalidationTimer;
- (void)_detachTab:(unsigned int)a3 animated:;
- (void)_detachTabs:(id *)a1;
- (void)_didPerformBatchUpdates;
- (void)_forceUpdateTabGroupTitleIfNeeded:(id *)a1;
- (void)_hasPinnedStartPageExcludingTabs:(void *)a1;
- (void)_hibernateTab:(char *)a1;
- (void)_insertTab:(unint64_t)a3 atIndex:(char)a4 inBackground:(unsigned int)a5 animated:(char)a6 updateUI:;
- (void)_isProfileActive:(void *)result;
- (void)_lockedPrivateBrowsingStateDidChange:(id)a3;
- (void)_markAllTabsInTabGroupAsRead:(uint64_t)a1;
- (void)_movePinnedWBTab:(void *)a3 toTabGroup:;
- (void)_openBlankTabDocumentInTabBarWithOptions:(id *)a1;
- (void)_openBookmark:(void *)a3 orURL:(void *)a4 inTabGroup:;
- (void)_openSingleBookmark:(void *)a3 orURL:(void *)a4 inTabGroup:(int)a5 setActive:;
- (void)_prepareToMoveTabDocumentToWindow:(int)a3 createPlaceholderImage:;
- (void)_presentAutomaticTabClosingPromptIfNeededForClosedTabCount:(uint64_t)a1;
- (void)_presentCloseAlertForTabGroup:(void *)a3 completionHandler:;
- (void)_presentOpenAlertForFocusProfile:(void *)a3 completionHandler:;
- (void)_presentOpenAlertForFocusedTabGroup:(void *)a3 completionHandler:;
- (void)_presentRenameAlertForTabGroup:(id *)a1;
- (void)_presentShareSheetForTabGroup:(void *)a3 sender:;
- (void)_presentShareSheetWithTabGroupActivityItemConfiguration:(void *)a3 sender:;
- (void)_redoCloseTabsWithUUIDs:(id)a3;
- (void)_registerSingleUndoActionForClosedTabs:(id *)a1;
- (void)_registerUndoActionsForClosedTabs:(uint64_t)a1;
- (void)_registerUndoWithGroup:(void *)a3 actions:;
- (void)_removeTab:(void *)a3 fromTabGroup:;
- (void)_replaceTabs:(void *)a3 withTabs:(int)a4 persist:;
- (void)_reportTabGroupCreationPrepopulatedWithTabs:(uint64_t)a3 fromPotentialAnalyticsSource:(int)a4 TabGroupsMenu:;
- (void)_requestContactsAccessIfNeeded;
- (void)_restoreEducationTabsIfNecessaryAnimated:(uint64_t)a1;
- (void)_reuseTabAfterInsertion:(id *)a1;
- (void)_reuseTabIfNecessary:(uint64_t)a1;
- (void)_selectAcceptedSharedTabGroup:(uint64_t)a1;
- (void)_selectNewTabGroupIfNecessaryBeforeClosingTabGroup:(void *)a1;
- (void)_sendDidEndDocumentUpdates;
- (void)_sendEventsForAutoFillTelemetryForClosingTabs:(uint64_t)a1;
- (void)_sendWillBeginDocumentUpdates;
- (void)_setActiveTabDocument:(void *)a1;
- (void)_setTabGroupButtonTitle:(void *)a3 image:;
- (void)_suppressSingleEmptyTabIfAppropriate;
- (void)_switchActiveTabDocumentFromTabDocument:(void *)a3 toTabDocument:;
- (void)_switchTabGroupLoopByRelativeIndex:(void *)a1;
- (void)_tabDocumentsWereReusedWhenActiveTabGroupChanged:(uint64_t)a1;
- (void)_tabGroupTabDidUpdatePinned:(void *)a3 inTabGroup:;
- (void)_tabWasAddedToReusableTabs:(void *)a3 fromWindowWithID:(double)a4 previousTabPositions:;
- (void)_undoCloseTabs:(id)a3;
- (void)_updateActiveTabForTabGroup:(void *)a1;
- (void)_updateAddTabButtonEnabled;
- (void)_updateContextKitSuggestionsForTabGroupWithCompletionHandler:(void *)a1;
- (void)_updateShare:(void *)a3 forActiveTabGroup:;
- (void)_updateTabGroupSuggestions:(void *)a3 matchingText:;
- (void)_updateTabOverviewBarButtonItems;
- (void)_updateTabsForTabGroup:(uint64_t)a1;
- (void)_updateTabsWithPinnedTabs:(int)a3 persist:;
- (void)_updateTabsWithPinnedWBTabs:(void *)a1;
- (void)_updateUserActivityTimerFired;
- (void)_willPerformBatchUpdates;
- (void)addBookmarkFolderForTabs:(id)a3;
- (void)addDocumentObserver:(id)a3;
- (void)allowsClosingLastTab;
- (void)attemptToSelectTabGroupFromShare:(id)a3;
- (void)authenticateToUnlockPrivateBrowsing;
- (void)clearBrowserController;
- (void)clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID:(id)a3;
- (void)clearHiddenTabForExplanationView;
- (void)clearTabsClosedWhileTabViewPresentedCount;
- (void)closeAllOpenTabsAnimated:(BOOL)a3;
- (void)closeOtherTabs;
- (void)closeTab;
- (void)closeTab:(id)a3 animated:(BOOL)a4;
- (void)closeTabDocuments:(id)a3;
- (void)closeTabGroup:(id)a3;
- (void)closeTabWithURL:(id)a3 UUID:(id)a4;
- (void)closeTabs:(id)a3;
- (void)closeTabs:(id)a3 animated:(BOOL)a4;
- (void)closeTabs:(id)a3 animated:(BOOL)a4 allowAddingToRecentlyClosedTabs:(BOOL)a5 showAutoCloseTabsAlert:(BOOL)a6;
- (void)closeTabs:(id)a3 inInactiveTabGroup:(id)a4;
- (void)closeTabsAutomaticallyIfNecessary;
- (void)closeWBTabs:(id)a3;
- (void)createNewTabGroup;
- (void)createTabGroupFromExistingTabs:(BOOL)a3 completionHandler:(id)a4;
- (void)deactivateAllUsageTrackingInformationIfNecessary;
- (void)dealloc;
- (void)deleteScopedBookmarkWithUUID:(id)a3 completionHandler:(id)a4;
- (void)didFetchRecentlyAcceptedSharedTabGroupWithUUID:(id)a3 acceptedShareDate:(id)a4;
- (void)didFocusTabGroup:(id)a3;
- (void)didGainOwnershipOfTab:(id)a3;
- (void)didSelectProfileWithIdentifier:(id)a3 previousProfileIdentifier:(id)a4;
- (void)didUpdateTabDocuments;
- (void)didUpdateTabDocumentsInTabGroupWithUUID:(uint64_t)a1;
- (void)dismissOpenTabGroupAlertIfNeeded;
- (void)displayAlreadyAcceptedSharedTabGroupWithUUID:(id)a3;
- (void)evictTabDocument:(id)a3;
- (void)focusedTabGroup;
- (void)insertNewBlankTabDocumentAnimated:(BOOL)a3;
- (void)insertNewTabDocument:(id)a3 forcingOrderAfterTabDocument:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6;
- (void)insertNewTabDocumentWithDefaultOrdering:(id)a3 inBackground:(BOOL)a4 animated:(BOOL)a5;
- (void)insertPerTabGroupBookmark:(id)a3 inPerTabGroupBookmarkFolderWithID:(int)a4;
- (void)insertTab:(id)a3 afterTab:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6;
- (void)insertTabDocumentFromTabStateData:(id)a3;
- (void)insertTabWithUUIDForNavigation:(id)a3;
- (void)insertTabs:(id)a3 beforeTab:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6;
- (void)makeActiveTabDocumentActive;
- (void)moveTab:(id)a3 fromTabGroupWithUUID:(id)a4 toTabGroupWithUUID:(id)a5 afterTab:(id)a6;
- (void)moveTab:(id)a3 overTab:(id)a4;
- (void)moveTab:(id)a3 toTabGroupWithUUID:(id)a4;
- (void)moveTabGroup:(id)a3 beforeOrAfterTabGroup:(id)a4;
- (void)moveTabGroup:(id)a3 toProfile:(id)a4;
- (void)moveWBTabs:(id)a3 toTabGroup:(id)a4;
- (void)openBookmark:(id)a3 inTabGroup:(id)a4;
- (void)openFocusProfileWithCompletionHandler:(id)a3;
- (void)openFocusedTabGroupWithCompletionHandler:(id)a3;
- (void)openInitialBlankTabDocumentIfNeeded;
- (void)openLibraryForType:(id)a3;
- (void)openNewTabWithCompletionHandler:(id)a3;
- (void)openNewTabWithOptions:(int64_t)a3 completionHandler:(id)a4;
- (void)openTab:(id)a3 navigatedFromLibraryType:(id)a4;
- (void)openURL:(id)a3 inTabGroup:(id)a4;
- (void)performBatchUpdatesWithBlock:(id)a3;
- (void)performSuppressingDataModelUpdates:(id)a3;
- (void)persistActiveTabGroupOrTabGroupVisibleInSwitcher;
- (void)persistAllCurrentTabsInBackground:(BOOL)a3;
- (void)persistTab:(id)a3 notify:(BOOL)a4;
- (void)persistTabs:(id)a3 inTabGroupWithUUID:(id)a4 inBackground:(BOOL)a5;
- (void)pinnedTabsManager:(id)a3 didUpdatePinnedTabs:(id)a4 inProfileWithIdentifier:(id)a5;
- (void)pinnedTabsManager:(id)a3 didUpdatePinnedTabs:(id)a4 isPrivate:(BOOL)a5;
- (void)presentAlertToCreateTabGroupFromTabs:(id)a3 withTitle:(id)a4 message:(id)a5 suggestedName:(id)a6 okActionTitle:(id)a7 completionHandler:(id)a8;
- (void)privateBrowsingAvailabilityDidChange;
- (void)registerTabGroupManagerObserver:(id)a3;
- (void)registerUndoWithName:(id)a3 actions:(id)a4;
- (void)registerUndoWithType:(int64_t)a3 actions:(id)a4;
- (void)removeDocumentObserver:(id)a3;
- (void)removeSingleBlankTabFromActiveTabGroup;
- (void)removeSingleBlankTabFromInactiveTabGroup:(id)a3;
- (void)renameTabGroup:(id)a3;
- (void)reorderPinnedTabsIntoPlace;
- (void)reorderScopedBookmarkWithUUID:(id)a3 afterBookmarkWithUUID:(id)a4 notify:(BOOL)a5;
- (void)replaceBlankActiveTabWithTab:(id)a3;
- (void)replaceTabDocument:(id)a3 withTabDocument:(id)a4;
- (void)replaceTabDocument:(id)a3 withTabDocument:(id)a4 committingSpeculativeLoad:(BOOL)a5;
- (void)restoreEducationDeviceTabs;
- (void)saveStateInBackground:(BOOL)a3;
- (void)saveStateInBackground:(BOOL)a3 needsValidate:(BOOL)a4;
- (void)saveTabDocumentUserActivitySoon:(id)a3;
- (void)selectLocalTabGroup;
- (void)selectNextTabGroup;
- (void)selectPreviousTabGroup;
- (void)selectPrivateTabGroup;
- (void)setActiveProfileIdentifier:(id)a3;
- (void)setActiveTab:(id)a3;
- (void)setActiveTab:(id)a3 animated:(BOOL)a4;
- (void)setActiveTab:(id)a3 animated:(BOOL)a4 deferActivation:(BOOL)a5;
- (void)setActiveTabDocument:(id)a3;
- (void)setActiveTabDocument:(id)a3 animated:(BOOL)a4;
- (void)setActiveTabDocument:(id)a3 animated:(BOOL)a4 deferActivation:(BOOL)a5;
- (void)setActiveTabGroupUUID:(id)a3;
- (void)setActiveTabUUID:(id)a3;
- (void)setNormalActiveTabDocument:(id)a3;
- (void)setPinnedTabsManager:(id)a3;
- (void)setPrivateActiveTabDocument:(id)a3;
- (void)setPrivateBrowsingEnabled:(BOOL)a3;
- (void)setPrivateBrowsingMode:(int64_t)a3;
- (void)setPrivateBrowsingMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setShouldTogglePrivateBrowsingOnSplit:(BOOL)a3;
- (void)setTab:(id)a3 isPinned:(BOOL)a4;
- (void)setTabDisplayMode:(int64_t)a3;
- (void)setTitle:(id)a3 forTabGroupWithUUID:(id)a4;
- (void)setWBTabs:(id)a3 arePinned:(BOOL)a4;
- (void)setWindowState:(id)a3;
- (void)shareRecordForActiveTabGroupWithCompletionHandler:(void *)a1;
- (void)sortTabsInTabGroupWithUUIDString:(id)a3 withSortMode:(int64_t)a4;
- (void)sortTabsWithMode:(int64_t)a3;
- (void)switchOutOfSyncedTabGroup;
- (void)switchToTabGroupVisibleInSwitcherIfNeeded;
- (void)tabDocumentDidUpdateUUID:(id)a3 previousUUID:(id)a4;
- (void)tabGroupConfirmationAlertDidBeginDismissal:(id)a3;
- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4;
- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4;
- (void)tabGroupManager:(id)a3 didUpdateTabWithUUID:(id)a4 userDriven:(BOOL)a5;
- (void)tabGroupManager:(id)a3 didUpdateTabsInTabGroupWithUUID:(id)a4;
- (void)tabGroupManager:(id)a3 willReplaceTabWithUUID:(id)a4 withTabWithUUID:(id)a5;
- (void)tabGroupManagerDidFinishSetup:(id)a3;
- (void)tabGroupManagerDidUpdateTabGroups:(id)a3;
- (void)tabGroupNamingTextDidChange:(id)a3;
- (void)tabSwitcherShareConfigurationForTabGroup:(id)a3 completion:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)togglePinningTab:(id)a3 inInactiveTabGroup:(id)a4;
- (void)toggleTabGroupUUIDExpanded:(id)a3;
- (void)updateActiveTab;
- (void)updateBackgroundImageForProfile:(id)a3;
- (void)updateBackgroundImageForTabGroup:(id)a3;
- (void)updateEducationTabsLastSyncDate;
- (void)updateFocusProfileEnteringForeground;
- (void)updateFocusedTabGroupEnteringForeground;
- (void)updateHibernatedTabDocumentsSavingState;
- (void)updateLastSelectedTabUUIDForClosingWBTabs:(uint64_t)a1;
- (void)updateLocalTabGroupTitle;
- (void)updateLockedBrowsingState;
- (void)updateScopedBookmarkWithUUID:(id)a3 title:(id)a4 address:(id)a5;
- (void)updateSelectedTabGroupName;
- (void)updateTabCount;
- (void)updateUsageTrackingInformationIfNecessary;
- (void)updateWBTabWithTab:(id)a3 notify:(BOOL)a4 persist:(BOOL)a5;
- (void)willLoseOwnershipOfTab:(id)a3;
- (void)willSelectProfileWithIdentifier:(id)a3;
@end

@implementation TabController

- (id)_tabCountForDisplay
{
  v1 = a1;
  if (a1)
  {
    v2 = [a1 activeTabGroup];
    int v3 = [v2 isLocal];

    if (v3)
    {
      v4 = [v1 currentTabs];
      v5 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_257);

      v1 = (id *)[v5 count];
    }
    else
    {
      v5 = [v1[34] localTabGroup];
      v6 = [v5 tabs];
      uint64_t v7 = [v6 count];
      v8 = [v1[35] pinnedTabs];
      v1 = (id *)([v8 count] + v7);
    }
  }
  return v1;
}

- (NSString)startPageBackgroundImageIdentifier
{
  int v3 = [(TabController *)self activeTabGroup];
  if ([v3 isNamed])
  {
    v4 = [(TabController *)self activeTabGroup];
    v5 = [v4 uuid];
  }
  else
  {
    v5 = [(TabController *)self activeProfileIdentifier];
  }

  int v6 = [(__CFString *)v5 isEqualToString:*MEMORY[0x1E4F980C8]];
  uint64_t v7 = &stru_1F3C268E8;
  if (!v6) {
    uint64_t v7 = v5;
  }
  v8 = v7;

  return (NSString *)v8;
}

- (WBTabGroup)activeTabGroup
{
  return (WBTabGroup *)[(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:self->_activeTabGroupUUID];
}

- (NSString)activeProfileIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v3 = [WeakRetained activeProfileIdentifier];

  return (NSString *)v3;
}

- (NSArray)currentTabs
{
  int v3 = [(TabController *)self isPrivateBrowsingEnabled];
  return (NSArray *)-[TabController _tabsForPrivateBrowsing:]((char *)self, v3);
}

- (TabDocument)activeTabDocument
{
  activeLibraryTab = self->_activeLibraryTab;
  if (activeLibraryTab)
  {
    int v3 = activeLibraryTab;
  }
  else
  {
    int v3 = [(TabController *)self activeNonLibraryTab];
  }
  return v3;
}

- (TabDocument)activeNonLibraryTab
{
  int v3 = [(TabController *)self isPrivateBrowsingEnabled];
  return (TabDocument *)-[TabController _activeTabDocumentForPrivateBrowsing:]((char *)self, v3);
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingMode == 1;
}

- (char)_activeTabDocumentForPrivateBrowsing:(char *)a1
{
  if (a1)
  {
    uint64_t v3 = 296;
    if (a2) {
      uint64_t v3 = 288;
    }
    a1 = (char *)*(id *)&a1[v3];
    uint64_t v2 = vars8;
  }
  return a1;
}

void __47__TabController__replaceTabs_withTabs_persist___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] unpinnedTabs];
  if ([v2 count]) {
    goto LABEL_4;
  }
  id v3 = a1[4];
  if (v3)
  {
    if (-[TabController _hasPinnedStartPageExcludingTabs:](v3, 0))
    {
LABEL_4:

      goto LABEL_5;
    }
    id v3 = a1[4];
  }
  char v7 = [v3 updatingTabGroupTabs];

  if ((v7 & 1) == 0) {
    id v8 = -[TabController _openBlankTabDocument]((id *)a1[4]);
  }
LABEL_5:
  uint64_t v4 = [a1[5] count];
  if (v4 != [a1[6] count]) {
    [a1[4] updateTabCount];
  }
  if (([*((id *)a1[4] + 9) tabBarItemsFixed] & 1) == 0)
  {
    uint64_t v5 = [a1[5] count];
    if (v5 != [a1[6] count])
    {
      int v6 = -[TabController _application](a1[4]);
      [v6 updateTabCount];
    }
    [*((id *)a1[4] + 9) updateTabOverviewItems];
    [*((id *)a1[4] + 9) updateTabBarAnimated:0];
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 1);
    [WeakRetained reloadSidebarAnimated:0];
  }
}

- (void)updateLocalTabGroupTitle
{
  id v4 = [(TabController *)self currentTabs];
  if ([v4 count])
  {
    BOOL v3 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabBarItemsFixed];

    if (v3) {
      return;
    }
    id v4 = [(TabController *)self activeTabGroup];
    -[TabController _forceUpdateTabGroupTitleIfNeeded:]((id *)&self->super.isa, v4);
  }
}

- (void)_forceUpdateTabGroupTitleIfNeeded:(id *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v7 = v3;
    int v5 = [v3 hasDynamicTitle];
    id v4 = v7;
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      [WeakRetained reloadSidebarAnimated:0];

      [a1 updateSelectedTabGroupName];
      id v4 = v7;
    }
  }
}

- (void)openInitialBlankTabDocumentIfNeeded
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (!self->_activeTabGroupUUID)
  {
    id v3 = [(WBWindowState *)self->_windowState localTabGroup];
    id v4 = [v3 uuid];
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v7 = [(TabController *)self startPageBackgroundImageIdentifier];
  [WeakRetained loadBackgroundImageIfNeededForIdentifier:v7];

  id v8 = objc_loadWeakRetained((id *)&self->_browserController);
  if (![(NSMutableArray *)self->_mutableNormalTabs count])
  {
    v9 = [TabDocument alloc];
    v10 = [MEMORY[0x1E4F29128] UUID];
    v11 = [(TabDocument *)v9 initWithTitle:0 URL:0 UUID:v10 privateBrowsingEnabled:0 hibernated:1 bookmark:0 browserController:v8];
    normalActiveTabDocument = self->_normalActiveTabDocument;
    self->_normalActiveTabDocument = v11;

    [self->_normalActiveTabDocument setIsBlank:1];
    [self->_normalActiveTabDocument displayNewTabOverridePageIfNecessary];
    [(NSMutableArray *)self->_mutableNormalTabs addObject:self->_normalActiveTabDocument];
    v13 = [(TabController *)self activeTabGroup];
    if ([v13 isPrivateBrowsing])
    {
      id v14 = [(WBWindowState *)self->_windowState localTabGroup];
    }
    else
    {
      id v14 = v13;
    }
    v15 = v14;
    v19[0] = self->_normalActiveTabDocument;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v17 = [v15 uuid];
    [(TabController *)self persistTabs:v16 inTabGroupWithUUID:v17 inBackground:1];

    [self->_normalActiveTabDocument setHasBeenInserted:1];
  }
  -[TabController _createInitialPrivateTabIfNeeded]((id *)&self->super.isa);
  v18 = -[TabController _application](self);
  [v18 updateTabCount];

  [(TabCollectionViewManager *)self->_tabCollectionViewManager updateTabOverviewItems];
  [v8 clearCachedTabCompletionData];
}

- (void)_createInitialPrivateTabIfNeeded
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (![a1[3] count])
    {
      uint64_t v2 = [TabDocument alloc];
      id v3 = [MEMORY[0x1E4F29128] UUID];
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      uint64_t v5 = [(TabDocument *)v2 initWithTitle:0 URL:0 UUID:v3 privateBrowsingEnabled:1 hibernated:1 bookmark:0 browserController:WeakRetained];
      id v6 = a1[36];
      a1[36] = (id)v5;

      [a1[36] setIsBlank:1];
      [a1[36] displayNewTabOverridePageIfNecessary];
      [a1[3] addObject:a1[36]];
      id v7 = [a1[34] privateTabGroup];
      v12[0] = a1[36];
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      v9 = [v7 uuid];
      [a1 persistTabs:v8 inTabGroupWithUUID:v9 inBackground:1];

      v10 = [a1[36] uuid];
      v11 = [v10 UUIDString];
      [v7 setLastSelectedTabUUID:v11];

      [a1[36] setHasBeenInserted:1];
    }
  }
}

- (id)_allTabGroupsAcrossWindows
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 48) allSyncedTabGroupsExceptRemoteUnnamedTabGroups];
    id v3 = (void *)[v2 mutableCopy];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v5 = [WeakRetained browserWindowController];
    id v6 = [v5 browserControllers];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "tabController", (void)v17);
          v13 = [v12 windowState];

          id v14 = [v13 localTabGroup];
          objc_msgSend(v3, "safari_addObjectUnlessNil:", v14);

          v15 = [v13 privateTabGroup];
          objc_msgSend(v3, "safari_addObjectUnlessNil:", v15);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (WBWindowState)windowState
{
  return self->_windowState;
}

- (void)updateSelectedTabGroupName
{
  id v24 = [(TabController *)self activeTabGroup];
  id v3 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  id v4 = [v3 toolbar];

  uint64_t v5 = [v24 displayTitle];
  if ([v24 isNamed]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabOverview];
  [v7 setTitle:v6];

  uint64_t v8 = [(TabController *)self activeProfile];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained canShowProfileInTabOverviewToolbar])
  {
    char v10 = [v24 isNamed];

    id v11 = v24;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = +[ToolbarItemConfiguration configurationForTabGroup:v24 inProfile:v8];
      goto LABEL_9;
    }
  }
  else
  {

    id v11 = v24;
  }
  uint64_t v12 = +[ToolbarItemConfiguration configurationForTabGroup:v11];
LABEL_9:
  v13 = (void *)v12;
  [v4 setTabGroupButtonConfiguration:v12];

  id v14 = objc_loadWeakRetained((id *)&self->_browserController);
  v15 = [v14 bannerController];
  v16 = [v15 tabGroupBanner];
  [v16 updateTitle];

  -[TabController _updateTabOverviewBarButtonItems]((id *)&self->super.isa);
  long long v17 = -[TabController _titleForTabGroupButton]((id *)&self->super.isa);
  long long v18 = -[TabController _imageForTabGroupButton]((id *)&self->super.isa);
  -[TabController _setTabGroupButtonTitle:image:]((uint64_t)self, v17, v18);

  [v14 updateTabGroupButtonsVisibility];
  [v14 updateTabGroupHeading];
  long long v19 = [v14 rootViewController];
  long long v20 = [v19 unifiedBar];
  [v20 setNeedsLayout];

  v21 = [v14 libraryController];
  uint64_t v22 = [v21 sidebarViewController];
  [v22 updateSelectionByIgnoringExistingSelection:1];

  if ([v24 hasDynamicTitle])
  {
    v23 = -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
    [v23 reloadTabGroup:v24];
  }
}

- (id)tabGroupSwitcherViewController
{
  if (a1)
  {
    a1 = [a1[9] tabGroupSwitcherViewController];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)tabThumbnailCollectionView
{
  if (a1)
  {
    a1 = [a1[9] tabThumbnailCollectionView];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_updateTabOverviewBarButtonItems
{
  if (a1)
  {
    uint64_t v2 = [a1 activeTabGroupOrTabGroupVisibleInSwitcher];
    if ([v2 isNamed]
      && (+[FeatureManager sharedFeatureManager],
          id v3 = objc_claimAutoreleasedReturnValue(),
          char v4 = [v3 areSharedTabGroupsEnabled],
          v3,
          (v4 & 1) != 0))
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_initWeak(&location, a1);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __49__TabController__updateTabOverviewBarButtonItems__block_invoke;
      v10[3] = &unk_1E6D7C7E8;
      objc_copyWeak(&v14, &location);
      id v11 = v2;
      id v7 = v5;
      id v12 = v7;
      id v8 = WeakRetained;
      id v13 = v8;
      -[TabController shareRecordForActiveTabGroupWithCompletionHandler:](a1, v10);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v9 = [a1[9] tabOverview];
      [v9 setBarButtonItems:MEMORY[0x1E4F1CBF0]];
    }
  }
}

- (WBTabGroup)activeTabGroupOrTabGroupVisibleInSwitcher
{
  if (SFEnhancedTabOverviewEnabled()
    && [(TabCollectionViewManager *)self->_tabCollectionViewManager isShowingTabView])
  {
    id v3 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabSwitcherViewController];
    char v4 = [v3 visibleTabGroup];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [(TabController *)self activeTabGroup];
    }
    id v7 = v6;
  }
  else
  {
    id v7 = [(TabController *)self activeTabGroup];
  }
  return (WBTabGroup *)v7;
}

- (id)_titleForTabGroupButton
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 activeTabGroup];
    id WeakRetained = objc_loadWeakRetained(v1 + 1);
    if ([WeakRetained canShowProfileInNavigationBar])
    {
      char v4 = [v2 isNamed];

      if ((v4 & 1) == 0)
      {
        uint64_t v5 = [v1 activeProfile];
        uint64_t v1 = [v5 title];

LABEL_7:
        goto LABEL_8;
      }
    }
    else
    {
    }
    uint64_t v1 = [v2 displayTitle];
    goto LABEL_7;
  }
LABEL_8:
  return v1;
}

- (void)_setTabGroupButtonTitle:(void *)a3 image:
{
  id v14 = a2;
  id v5 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v7 = [WeakRetained barManager];

    if (v5)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      uint64_t v9 = (void *)MEMORY[0x1E4F28B18];
      char v10 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v5];
      id v11 = [v9 attributedStringWithAttachment:v10];
      [v8 appendAttributedString:v11];

      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
      [v8 appendAttributedString:v12];

      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14];
      [v8 appendAttributedString:v13];

      [v7 setBarItem:2 attributedTitle:v8];
    }
    else
    {
      [v7 setBarItem:2 title:v14];
    }
  }
}

- (id)_imageForTabGroupButton
{
  id v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    int v3 = [WeakRetained canShowProfileInNavigationBar];

    if (v3)
    {
      char v4 = [v1 activeProfile];
      id v1 = [v4 symbolImage];
    }
    else
    {
      id v5 = [v1 activeTabGroup];
      int v6 = [v5 isShared];

      if (v6)
      {
        id v1 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.fill"];
      }
      else
      {
        id v1 = 0;
      }
    }
  }
  return v1;
}

- (BOOL)hasMultipleProfiles
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v3 = [WeakRetained hasMultipleProfiles];

  return v3;
}

- (WBTabGroup)unnamedTabGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v3 = [WeakRetained unnamedTabGroup];

  return (WBTabGroup *)v3;
}

- (WBTabGroup)privateTabGroupIfAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained isPrivateBrowsingAvailable])
  {

LABEL_4:
    id v7 = [(WBWindowState *)self->_windowState privateTabGroup];
    goto LABEL_6;
  }
  activeTabGroupUUID = self->_activeTabGroupUUID;
  id v5 = [(WBWindowState *)self->_windowState privateTabGroup];
  int v6 = [v5 uuid];
  LODWORD(activeTabGroupUUID) = [(NSString *)activeTabGroupUUID isEqual:v6];

  if (activeTabGroupUUID) {
    goto LABEL_4;
  }
  id v7 = 0;
LABEL_6:
  return (WBTabGroup *)v7;
}

- (NSArray)namedTabGroups
{
  return (NSArray *)-[TabController _syncedTabGroupsForActiveProfileWithOptions:](self, 2);
}

- (id)_syncedTabGroupsForActiveProfileWithOptions:(void *)a1
{
  if (a1)
  {
    if (a2 == 2)
    {
      int v6 = (void *)a1[6];
      char v4 = [a1 activeProfileIdentifier];
      uint64_t v5 = [v6 namedTabGroupsForProfileWithIdentifier:v4];
    }
    else
    {
      if (a2 != 1) {
        goto LABEL_7;
      }
      char v3 = (void *)a1[6];
      char v4 = [a1 activeProfileIdentifier];
      uint64_t v5 = [v3 unnamedTabGroupsForProfileWithIdentifier:v4];
    }
    uint64_t v2 = (void *)v5;
  }
  else
  {
    uint64_t v2 = 0;
  }
LABEL_7:
  return v2;
}

- (id)tabGroupsMenuForTabGroupButton:(BOOL)a3
{
  objc_initWeak(&location, self);
  char v4 = (void *)MEMORY[0x1E4FB1970];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__TabController_tabGroupsMenuForTabGroupButton___block_invoke;
  v7[3] = &unk_1E6D7C698;
  objc_copyWeak(&v8, &location);
  BOOL v9 = a3;
  uint64_t v5 = objc_msgSend(v4, "safari_menuWithTitle:uncachedChildrenProvider:", &stru_1F3C268E8, v7);
  [v5 setAccessibilityIdentifier:@"TabGroupsMenu"];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v5;
}

- (void)persistTabs:(id)a3 inTabGroupWithUUID:(id)a4 inBackground:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    tabGroupManager = self->_tabGroupManager;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke;
    v11[3] = &unk_1E6D79DE0;
    id v12 = v8;
    [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v9 persist:1 usingBlock:v11];
    if (!a5) {
      [(WBTabGroupManager *)self->_tabGroupManager disableSuddenTerminationForPendingChanges];
    }
  }
}

- (void)_didPerformBatchUpdates
{
  if (a1)
  {
    [a1[9] endFixingTabBarItems];
    [a1[9] endFixingTabOverviewItems];
    [a1[9] updateTabOverviewItems];
    id v2 = a1[9];
    uint64_t v3 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    char v4 = [a1 activeTabDocument];
    [v2 updateTabBarAnimated:v3 keepingTabVisible:v4];

    -[TabController _sendDidEndDocumentUpdates]((uint64_t)a1);
  }
}

- (void)privateBrowsingAvailabilityDidChange
{
  [(TabController *)self updateSelectedTabGroupName];
  -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 reloadTabGroups];
}

- (void)setWindowState:(id)a3
{
  id v8 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_windowState, a3);
    uint64_t v5 = -[TabController _localTabGroupTitleProvider](self);
    int v6 = [(WBWindowState *)self->_windowState localTabGroup];
    [v6 setDisplayTitleProvider:v5];

    id v7 = [(WBWindowState *)self->_windowState privateTabGroup];
    [v7 setDisplayTitleProvider:&__block_literal_global_49];

    [(WBTabGroupManager *)self->_tabGroupManager registerWindowState:v8];
  }
}

- (id)_localTabGroupTitleProvider
{
  if (val)
  {
    objc_initWeak(&location, val);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __44__TabController__localTabGroupTitleProvider__block_invoke;
    v3[3] = &unk_1E6D7C920;
    objc_copyWeak(&v4, &location);
    id v1 = (void *)MEMORY[0x1E4E42950](v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
  else
  {
    id v1 = 0;
  }
  return v1;
}

- (id)unnamedTabGroupDisplayTitleProvider
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__TabController_unnamedTabGroupDisplayTitleProvider__block_invoke;
  v4[3] = &unk_1E6D7C948;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)MEMORY[0x1E4E42950](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (BOOL)shouldAllowScrollingPinnedItems
{
  id v2 = [(TabController *)self activeTabGroup];
  char v3 = [v2 usesGlobalPinnedTabs] ^ 1;

  return v3;
}

- (char)_tabsForPrivateBrowsing:(char *)a1
{
  if (a1)
  {
    uint64_t v3 = 16;
    if (a2) {
      uint64_t v3 = 24;
    }
    a1 = (char *)[*(id *)&a1[v3] copy];
    uint64_t v2 = vars8;
  }
  return a1;
}

uint64_t __29__TabController_unpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (BOOL)isTabWithUUIDBeingHiddenFromTabView:(id)a3
{
  tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
  id v4 = a3;
  id v5 = [(TabDocument *)tabDocumentBeingHiddenFromTabView uuidString];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (BOOL)canCloseTabWithUUID:(id)a3
{
  id v4 = [(TabController *)self tabWithUUID:a3];
  id v5 = v4;
  if (v4)
  {
    if ([v4 isLoading]) {
      int v6 = 1;
    }
    else {
      int v6 = [v5 isBlank] ^ 1;
    }
    if (self && (-[TabController _hasPinnedStartPageExcludingTabs:](self, 0) & 1) != 0
      || ((-[TabController allowsClosingLastTab](self) | v6) & 1) != 0)
    {
      BOOL v7 = 1;
    }
    else
    {
      id v8 = [(TabController *)self unpinnedTabs];
      BOOL v7 = (unint64_t)[v8 count] > 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSArray)unpinnedTabs
{
  uint64_t v2 = [(TabController *)self currentTabs];
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_19_0);

  return (NSArray *)v3;
}

- (void)allowsClosingLastTab
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = [result activeTabGroup];
    uint64_t v3 = -[TabController canCloseLastTabInTabGroup:](v1, v2);

    return (void *)v3;
  }
  return result;
}

- (void)_hasPinnedStartPageExcludingTabs:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 activeTabGroup];
    char v5 = [v4 usesGlobalPinnedTabs];

    if (v5)
    {
      a1 = 0;
    }
    else
    {
      int v6 = [a1 currentTabs];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __50__TabController__hasPinnedStartPageExcludingTabs___block_invoke;
      v8[3] = &unk_1E6D78C60;
      id v9 = v3;
      a1 = objc_msgSend(v6, "safari_containsObjectPassingTest:", v8);
    }
  }

  return a1;
}

- (NSArray)normalAndPrivateTabs
{
  mutableNormalTabs = self->_mutableNormalTabs;
  id v3 = [(TabController *)self privateTabs];
  id v4 = [(NSMutableArray *)mutableNormalTabs arrayByAddingObjectsFromArray:v3];

  return (NSArray *)v4;
}

- (id)privatePinnedTabs
{
  if (a1)
  {
    uint64_t v1 = [a1 privateTabs];
    uint64_t v2 = objc_msgSend(v1, "safari_filterObjectsUsingBlock:", &__block_literal_global_17_0);
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (NSArray)privateTabs
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_mutablePrivateTabs copy];
  return (NSArray *)v2;
}

- (BOOL)isInDefaultProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v3 = [WeakRetained isInDefaultProfile];

  return v3;
}

- (void)didGainOwnershipOfTab:(id)a3
{
  id v11 = a3;
  uuidToTabMap = self->_uuidToTabMap;
  char v5 = [v11 uuid];
  [(NSMapTable *)uuidToTabMap setObject:v11 forKey:v5];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v7 = v11;
  if (isKindOfClass)
  {
    id v8 = v11;
    [v8 addRenderingProgressObserver:self->_tabCollectionViewManager];
    id v9 = [v8 libraryType];

    if (!v9)
    {
      char v10 = +[TabDocumentManager sharedManager];
      [v10 addTab:v8];
    }
    BOOL v7 = v11;
  }
}

- (CollectionViewTab)hiddenTabForExplanationView
{
  return (CollectionViewTab *)self->_tabDocumentBeingHiddenFromTabView;
}

uint64_t __36__TabController__tabCountForDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isInteractivelyInserted] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (id)tabDocumentWithUUID:(id)a3
{
  uint64_t v3 = [(TabController *)self tabWithUUID:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (BOOL)isTabPinnable:(id)a3
{
  id v4 = a3;
  if ([v4 canSetPinned])
  {
    id v5 = [v4 url];

    if (v5)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      BOOL v7 = [v4 tabGroupUUID];
      if (v7
        && ([(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v7],
            (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v9 = v8;
        int v6 = [v8 usesGlobalPinnedTabs] ^ 1;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

__CFString *__44__TabController__localTabGroupTitleProvider__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained[34] localTabGroup];
    id v4 = [v3 tabs];

    id v5 = -[TabController _tabCountForDisplay](v2);
    if (v5
      && ((int v6 = v5, v5 != (id *)1)
       || ([v4 firstObject],
           BOOL v7 = objc_claimAutoreleasedReturnValue(),
           [v7 url],
           id v8 = objc_claimAutoreleasedReturnValue(),
           v8,
           v7,
           v8)))
    {
      id v9 = NSString;
      char v10 = _WBSLocalizedString();
      objc_msgSend(v9, "localizedStringWithFormat:", v10, v6);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _WBSLocalizedString();
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v11 = &stru_1F3C268E8;
  }

  return v11;
}

- (BOOL)canCloseWBTab:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uuid];
  int v6 = [(TabController *)self tabGroupRelatedToTabWithUUID:v5];

  BOOL v7 = [v6 unpinnedTabs];
  unint64_t v8 = [v7 count];

  if (v8 > 1
    || (-[TabController canCloseLastTabInTabGroup:]((uint64_t)self, v6) & 1) != 0
    || ([v6 pinnedStartPage], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    char v10 = 1;
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F29128]);
    id v13 = [v4 uuid];
    id v14 = (void *)[v12 initWithUUIDString:v13];

    if (-[TabController _wbTabIsBlank:]((uint64_t)self, v4))
    {
      v15 = [(TabController *)self tabWithUUID:v14];
      char v10 = [v15 isLoading];
    }
    else
    {
      char v10 = 1;
    }
  }
  return v10;
}

- (id)tabWithUUID:(id)a3
{
  return [(NSMapTable *)self->_uuidToTabMap objectForKey:a3];
}

- (uint64_t)canCloseLastTabInTabGroup:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 isPrivateBrowsing])
    {
      id WeakRetained = [*(id *)(a1 + 280) privatePinnedTabs];
      uint64_t v6 = [WeakRetained count] == 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      uint64_t v6 = [WeakRetained isControlledByAutomation];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)tabGroupRelatedToTabWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(WBTabGroupManager *)self->_tabGroupManager tabWithUUID:v4];
  uint64_t v6 = [v5 tabGroupUUID];

  if (v6)
  {
    tabGroupManager = self->_tabGroupManager;
    unint64_t v8 = [v5 tabGroupUUID];
    uint64_t v9 = [(WBTabGroupManager *)tabGroupManager tabGroupWithUUID:v8];
LABEL_3:
    char v10 = (void *)v9;
    goto LABEL_4;
  }
  unint64_t v8 = [(PinnedTabsManager *)self->_pinnedTabsManager containerForTabWithUUID:v4];
  if ([v8 isInDefaultProfile])
  {
    char v12 = [v8 isPrivateBrowsingEnabled];
    windowState = self->_windowState;
    if (v12) {
      [(WBWindowState *)windowState privateTabGroup];
    }
    else {
    uint64_t v9 = [(WBWindowState *)windowState localTabGroup];
    }
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  v15 = [v8 activeProfileIdentifier];
  char v10 = [WeakRetained existingUnnamedTabGroupForProfileWithIdentifier:v15];

LABEL_4:
  return v10;
}

- (uint64_t)_wbTabIsBlank:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 isBlank]) {
      a1 = 1;
    }
    else {
      a1 = -[TabController _wbTabIsShowingStartPageOverriddenByExtension:]((void *)a1, v4);
    }
  }

  return a1;
}

- (id)cachedTabSwitcherShareConfigurationForTabGroup:(id)a3
{
  cachedShareConfigurationsByTabGroupUUID = self->_cachedShareConfigurationsByTabGroupUUID;
  id v4 = [a3 uuid];
  id v5 = [(NSMutableDictionary *)cachedShareConfigurationsByTabGroupUUID objectForKeyedSubscript:v4];

  return v5;
}

- (id)pinnedWBTabsForTabGroup:(id)a3
{
  id v4 = a3;
  if ([v4 usesGlobalPinnedTabs])
  {
    pinnedTabsManager = self->_pinnedTabsManager;
    uint64_t v6 = -[TabController _containerForPinnedTabsInTabGroup:](self, v4);

    [(PinnedTabsManager *)pinnedTabsManager pinnedTabsInContainer:v6];
  }
  else
  {
    uint64_t v6 = [v4 tabs];

    objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_525);
  BOOL v7 = };

  return v7;
}

- (id)_containerForPinnedTabsInTabGroup:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if ([v3 isPrivateBrowsing])
    {
      uint64_t v5 = 1;
LABEL_6:
      a1 = +[PinnedTabsContainer containerWithPrivateBrowsing:v5];
      goto LABEL_8;
    }
    if ([v4 isInDefaultProfile])
    {
      uint64_t v5 = 0;
      goto LABEL_6;
    }
    uint64_t v6 = [v4 profileIdentifier];
    a1 = +[PinnedTabsContainer containerWithActiveProfileIdentifier:v6];
  }
LABEL_8:

  return a1;
}

- (WBProfile)activeProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v3 = [WeakRetained activeProfile];

  return (WBProfile *)v3;
}

- (void)_willPerformBatchUpdates
{
  if (a1)
  {
    [*(id *)(a1 + 72) beginFixingTabBarItems];
    [*(id *)(a1 + 72) beginFixingTabOverviewItems];
    -[TabController _sendWillBeginDocumentUpdates](a1);
  }
}

- (void)updateTabCount
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  -[TabController _updateAddTabButtonEnabled]((id *)&self->super.isa);
  [(TabController *)self updateLocalTabGroupTitle];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = self->_documentObservers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        unint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "tabControllerDocumentCountDidChange:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_suppressSingleEmptyTabIfAppropriate
{
  if (a1 && (unint64_t)[*(id *)(a1 + 24) count] <= 1)
  {
    id v2 = [*(id *)(a1 + 24) firstObject];
    -[TabController _unhibernateTabIfNeeded:]((TabDocument *)a1, v2);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    if ([obj isBlank] && (objc_msgSend(obj, "isActive") & 1) == 0)
    {
      int v3 = [*(id *)(a1 + 72) isShowingTabView];
      uint64_t v4 = [*(id *)(a1 + 72) tabOverview];
      if (!v3
        || ([obj tabOverviewItem],
            uint64_t v5 = objc_claimAutoreleasedReturnValue(),
            char v6 = [v4 isItemAnimating:v5],
            v5,
            (v6 & 1) == 0))
      {
        uint64_t v7 = [(id)a1 activeTabGroup];
        int v8 = [v7 isPrivateBrowsing];

        if ((v8 ^ 1 | v3) == 1)
        {
          long long v9 = [*(id *)(a1 + 72) tabSwitcherViewController];
          long long v10 = [v9 uuidOfTabBeingSelected];
          long long v11 = [obj uuidString];
          char v12 = [v10 isEqual:v11];

          if ((v12 & 1) == 0)
          {
            objc_storeStrong((id *)(a1 + 32), obj);
            [*(id *)(a1 + 32) displayNewTabOverridePageIfNecessary];
            id v13 = -[TabController _application]((void *)a1);
            [v13 updateLockedPrivateBrowsingState];

            uint64_t v14 = [*(id *)(a1 + 72) tabSwitcherViewController];
            [v14 setNeedsApplyContentAnimated:0];
          }
        }
      }
    }
  }
}

- (void)updateUsageTrackingInformationIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v3 = [(TabController *)self allTabDocuments];
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
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  int v8 = [(TabController *)self activeTabDocument];
  [v8 updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:1];
}

- (NSArray)allTabDocuments
{
  int v3 = [(TabController *)self tabDocuments];
  uint64_t v4 = [(TabController *)self privateTabDocuments];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (NSArray)privateTabDocuments
{
  return (NSArray *)[(NSMutableArray *)self->_mutablePrivateTabs safari_filterObjectsUsingBlock:&__block_literal_global_32];
}

- (NSArray)tabDocuments
{
  return (NSArray *)[(NSMutableArray *)self->_mutableNormalTabs safari_filterObjectsUsingBlock:&__block_literal_global_29];
}

- (TabDocument)_unhibernateTabIfNeeded:(TabDocument *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      int v5 = [v4 isPrivateBrowsingEnabled];
      uint64_t v6 = 16;
      if (v5) {
        uint64_t v6 = 24;
      }
      id v7 = *(id *)((char *)&a1->super.isa + v6);
      uint64_t v8 = [v7 indexOfObject:v4];
      [(TabDocument *)a1 willLoseOwnershipOfTab:v4];
      a1 = [[TabDocument alloc] initWithHibernatedTab:v4];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
        [v7 replaceObjectAtIndex:v8 withObject:a1];
      }
      long long v9 = [v4 webExtensionsController];
      [v9 didReplaceTab:v4 newTab:a1];
    }
    else
    {
      a1 = v4;
    }
  }

  return a1;
}

uint64_t __32__TabController_setWindowState___block_invoke()
{
  return _WBSLocalizedString();
}

uint64_t __34__TabController_privatePinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned];
}

uint64_t __33__TabController_normalPinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned];
}

uint64_t __36__TabController_privateTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __29__TabController_tabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)addDocumentObserver:(id)a3
{
  id v4 = a3;
  -[NSHashTable addObject:](self->_documentObservers, "addObject:");
  if (self->_documentUpdateCount)
  {
    [(NSHashTable *)self->_documentObserversToReceiveUpdatesDidEnd addObject:v4];
    if (objc_opt_respondsToSelector()) {
      [v4 tabControllerWillBeginUpdates:self];
    }
  }
}

- (UIMenu)tabExposeMenu
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4FB1970];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__TabController_tabExposeMenu__block_invoke;
  v5[3] = &unk_1E6D7C060;
  objc_copyWeak(&v6, &location);
  id v3 = objc_msgSend(v2, "safari_menuWithUncachedChildrenProvider:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return (UIMenu *)v3;
}

- (void)setPrivateBrowsingMode:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_privateBrowsingMode != a3)
  {
    BOOL v4 = a4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = [(TabController *)self currentTabDocuments];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v32 + 1) + 8 * v11) webView];
          [v12 _stopAllMediaPlayback];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);
    }

    id v13 = [(TabController *)self activeTabDocument];
    self->_privateBrowsingMode = a3;
    uint64_t v14 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
    uint64_t v15 = [v14 presentationState];

    if (v15) {
      -[TabController _suppressSingleEmptyTabIfAppropriate]((uint64_t)self);
    }
    [(TabCollectionViewManager *)self->_tabCollectionViewManager setPrivateBrowsingEnabled:self->_privateBrowsingMode == 1 animated:v4];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v16 = self->_documentObservers;
    uint64_t v17 = [(NSHashTable *)v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v21, "tabControllerDidChangeCurrentTabDocuments:", self, (void)v28);
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [(NSHashTable *)v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v18);
    }

    uint64_t v22 = [(TabController *)self activeTabDocument];
    -[TabController _switchActiveTabDocumentFromTabDocument:toTabDocument:]((uint64_t)self, v13, v22);

    v23 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
    id v24 = [v23 toolbar];
    [v24 setBarButton:1 enabled:1];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained setNeedsSnapshotUpdateForActiveTabIfTabIsBlank];
    [(TabController *)self updateTabCount];
    v26 = [WeakRetained configuration];
    int v27 = [v26 allowsRestoringEducationTabs];

    if (v27) {
      -[TabController _restoreEducationTabsIfNecessaryAnimated:]((uint64_t)self, 0);
    }
  }
}

- (void)setPrivateBrowsingEnabled:(BOOL)a3
{
}

- (void)setPinnedTabsManager:(id)a3
{
}

- (TabController)initWithBrowserController:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TabController;
  int v5 = [(TabController *)&v36 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserController, v4);
    uint64_t v7 = [v4 UUID];
    browserWindowUUID = v6->_browserWindowUUID;
    v6->_browserWindowUUID = (NSUUID *)v7;

    uint64_t v9 = objc_alloc_init(TabCollectionViewManager);
    tabCollectionViewManager = v6->_tabCollectionViewManager;
    v6->_tabCollectionViewManager = v9;

    [(TabCollectionViewManager *)v6->_tabCollectionViewManager setDataSource:v6];
    [(TabCollectionViewManager *)v6->_tabCollectionViewManager setBrowserController:v4];
    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutableNormalTabs = v6->_mutableNormalTabs;
    v6->_mutableNormalTabs = v11;

    id v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    mutablePrivateTabs = v6->_mutablePrivateTabs;
    v6->_mutablePrivateTabs = v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    uuidToTabMap = v6->_uuidToTabMap;
    v6->_uuidToTabMap = (NSMapTable *)v15;

    uint64_t v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    documentObservers = v6->_documentObservers;
    v6->_documentObservers = (NSHashTable *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    expandedTabGroupUUIDs = v6->_expandedTabGroupUUIDs;
    v6->_expandedTabGroupUUIDs = (NSMutableArray *)v19;

    v21 = (WBSTabOrderManager *)objc_alloc_init(MEMORY[0x1E4F98F08]);
    tabOrderManager = v6->_tabOrderManager;
    v6->_tabOrderManager = v21;

    [(WBSTabOrderManager *)v6->_tabOrderManager setTabOrderProvider:v6];
    v23 = [v4 windowState];
    id v24 = [v23 localTabGroup];
    v25 = [v24 uuid];
    uint64_t v26 = [v25 copy];
    activeTabGroupUUID = v6->_activeTabGroupUUID;
    v6->_activeTabGroupUUID = (NSString *)v26;

    uint64_t v28 = [v4 tabGroupManager];
    tabGroupManager = v6->_tabGroupManager;
    v6->_tabGroupManager = (WBTabGroupManager *)v28;

    [(WBTabGroupManager *)v6->_tabGroupManager addTabGroupObserver:v6];
    long long v30 = (NSUndoManager *)objc_alloc_init(MEMORY[0x1E4F29140]);
    undoManager = v6->_undoManager;
    v6->_undoManager = v30;

    [(NSUndoManager *)v6->_undoManager setGroupsByEvent:0];
    long long v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v6 selector:sel__cloudTabsDidUpdate_ name:@"CloudTabStoreDidUpdateNotification" object:0];
    [v32 addObserver:v6 selector:sel__beganSharingTabGroup_ name:*MEMORY[0x1E4F787E0] object:0];
    long long v33 = [MEMORY[0x1E4FB60C8] sharedProxy];
    [v33 addSyncObserver:v6];

    [v32 addObserver:v6 selector:sel__lockedPrivateBrowsingStateDidChange_ name:@"lockedPrivateBrowsingStateDidChangeNotification" object:0];
    long long v34 = v6;
  }
  return v6;
}

- (TabCollectionViewProviding)tabCollectionViewProvider
{
  return (TabCollectionViewProviding *)self->_tabCollectionViewManager;
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (NSUUID)browserWindowUUID
{
  return self->_browserWindowUUID;
}

- (void)_updateAddTabButtonEnabled
{
  if (a1)
  {
    id v3 = [a1[9] tabThumbnailCollectionView];
    id v2 = [v3 toolbar];
    objc_msgSend(v2, "setBarButton:enabled:", 1, objc_msgSend(a1, "canAddNewTabForCurrentBrowsingMode"));
  }
}

- (BOOL)canAddNewTabForPrivateBrowsing:(BOOL)a3
{
  int v3 = a3;
  int v5 = [(TabController *)self activeTabGroup];
  if ([v5 isPrivateBrowsing] != v3)
  {
    if (v3) {
      [(WBWindowState *)self->_windowState privateTabGroup];
    }
    else {
    uint64_t v6 = [(TabController *)self unnamedTabGroup];
    }

    int v5 = (void *)v6;
  }
  uint64_t v7 = -[TabController _tabsForPrivateBrowsing:]((char *)self, v3);
  uint64_t v8 = [v7 count];

  BOOL v9 = [(TabController *)self canAddNewTabInTabGroup:v5 withTabCount:v8];
  return v9;
}

- (BOOL)canAddNewTabForCurrentBrowsingMode
{
  BOOL v3 = [(TabController *)self isPrivateBrowsingEnabled];
  return [(TabController *)self canAddNewTabForPrivateBrowsing:v3];
}

- (void)_restoreEducationTabsIfNecessaryAnimated:(uint64_t)a1
{
  if (!a1) {
    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v4 = [WeakRetained configuration];
  if (![v4 allowsRestoringEducationTabs] || *(unsigned char *)(a1 + 88)) {
    goto LABEL_12;
  }
  int64_t v5 = +[WBUFeatureManager accessLevel];

  if (v5 == 2)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = objc_msgSend(v4, "safari_dateForKey:", @"SafariEducationModeEducationTabsLastSyncDate");
    uint64_t v7 = [(id)a1 cloudTabStore];
    uint64_t v8 = [v7 currentDevice];

    if (!v6
      || ([v6 timeIntervalSinceReferenceDate],
          double v10 = v9,
          [v8 lastModified],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          [v11 timeIntervalSinceReferenceDate],
          double v13 = v12,
          v11,
          v10 < v13))
    {
      uint64_t v14 = [v8 tabs];
      if ([v14 count] || *(unsigned char *)(a1 + 89))
      {
        *(unsigned char *)(a1 + 88) = 1;
        uint64_t v15 = [WeakRetained browserWindowController];
        [v15 restoreEducationDeviceCloudTabs:v14 animated:a2];

        [(id)a1 updateEducationTabsLastSyncDate];
      }
    }
LABEL_12:
  }
}

id __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v6 = [v3 uuid];
  uint64_t v7 = (void *)[v5 initWithUUIDString:v6];
  uint64_t v8 = [v4 tabWithUUID:v7];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    -[TabController _tabForWBTab:](*(id **)(a1 + 32), v3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;

  if ([*(id *)(a1 + 40) usesGlobalPinnedTabs]) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [v3 isPinned];
  }
  [v11 setPinned:v12];
  [v11 setWBTab:v3];

  return v11;
}

- (TabDocument)hiddenPrivateTabDocumentWhenShowingPrivateBrowsingExplanationText
{
  if ([(TabDocument *)self->_tabDocumentBeingHiddenFromTabView isPrivateBrowsingEnabled]
    && [(NSMutableArray *)self->_mutablePrivateTabs count] == 1)
  {
    id v3 = self->_tabDocumentBeingHiddenFromTabView;
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (NSString)deviceIdentifier
{
  return (NSString *)[(WBTabGroupManager *)self->_tabGroupManager deviceIdentifier];
}

- (void)_sendDidEndDocumentUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 128) - 1;
    *(void *)(a1 + 128) = v2;
    if (!v2)
    {
      id v3 = *(id *)(a1 + 112);
      id v4 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = 0;

      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v5 = v3;
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
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v10, "tabControllerDidEndUpdates:", a1, (void)v12);
            }
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
    }
    uint64_t v11 = +[TabDocumentManager sharedManager];
    [v11 reclaimTabsIfNeeded];
  }
}

- (WBSCloudTabDeviceProvider)profileCloudTabStore
{
  if ([MEMORY[0x1E4F97EA0] isSafariProfilesEnabled]
    && ![(TabController *)self isInDefaultProfile])
  {
    id v3 = self->_tabGroupManager;
  }
  else
  {
    id v3 = [(TabController *)self cloudTabStore];
  }
  return v3;
}

- (CloudTabStore)cloudTabStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v3 = [WeakRetained browserWindowController];
  id v4 = [v3 cloudTabStore];

  return (CloudTabStore *)v4;
}

void __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke_2;
  v7[3] = &unk_1E6D7D010;
  id v5 = v3;
  id v8 = v5;
  uint64_t v6 = objc_msgSend(v4, "safari_mapAndFilterObjectsUsingBlock:", v7);
  [v5 setTabs:v6];
}

id __74__TabController_Persistence__persistTabs_inTabGroupWithUUID_inBackground___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 uuidString];
  uint64_t v6 = [v4 tabWithUUID:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    uint64_t v9 = [v3 wbTab];
    id v8 = (id)[v9 mutableCopy];
  }
  id v10 = [v3 tabUpdateBlock];
  ((void (**)(void, id))v10)[2](v10, v8);

  return v8;
}

- (BOOL)canAddNewTabInTabGroup:(id)a3 withTabCount:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F78290] sharedFeatureManager];
  char v8 = [v7 allowsUnlimitedTabs];

  if (v8)
  {
    if ([MEMORY[0x1E4F98998] automaticTabClosingInterval]
      || ([MEMORY[0x1E4FB1438] sharedApplication],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 supportsMultipleScenes],
          v9,
          (v10 & 1) != 0))
    {
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = [v6 isNamed];
    }
    long long v12 = -[TabController _application](self);
    char v13 = [v12 maximumTabCountAllowingMoreTabs:v11] > a4;
  }
  else
  {
    long long v12 = -[TabController _application](self);
    char v13 = objc_msgSend(v12, "canAddNewTabForPrivateBrowsing:", objc_msgSend(v6, "isPrivateBrowsing"));
  }

  return v13;
}

- (id)_application
{
  if (a1)
  {
    a1 = +[Application sharedApplication];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isShowingLibraryDocument
{
  uint64_t v2 = [(TabController *)self activeTabDocument];
  id v3 = [v2 libraryType];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)updateFocusedTabGroupEnteringForeground
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = -[TabController _application](self);
  if ([v3 needsFocusedTabGroupUpdate]
    && ([v3 needsFocusProfileUpdate] & 1) == 0)
  {
    BOOL v4 = [(TabController *)self focusedTabGroup];
    if (v4 && ![(TabController *)self isTabGroupActive:v4])
    {
      if ([v3 prefersSingleWindow])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
        id v6 = [WeakRetained viewControllerToPresentFrom];
        uint64_t v7 = [v6 presentedViewController];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          char v8 = v7;
        }
        else {
          char v8 = 0;
        }
        id v9 = v8;
        char v10 = v9;
        if (v9 && [v9 role] == 1)
        {
          uint64_t v11 = WBS_LOG_CHANNEL_PREFIXSiriLink();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v14) = 0;
            _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "Has open FTG alert on entering foreground", (uint8_t *)&v14, 2u);
          }
        }
        else
        {
          [v10 dismissViewControllerAnimated:1 completion:0];
          long long v12 = [v4 uuid];
          char v13 = WBS_LOG_CHANNEL_PREFIXSiriLink();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 138543362;
            long long v15 = v12;
            _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEFAULT, "Opening FTG %{public}@ on entering foreground", (uint8_t *)&v14, 0xCu);
          }
          [(TabController *)self setActiveTabGroupUUID:v12];
        }
      }
    }
    else if (self->_didFinishTabGroupSetup)
    {
      [v3 setNeedsFocusedTabGroupUpdate:0];
    }
  }
}

- (void)updateFocusProfileEnteringForeground
{
  id v2 = a1;
  [(id)OUTLINED_FUNCTION_4() role];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v3, v4, "Closing unexpected alert with role (%lu) that was in the way when changing focus profile.", v5, v6, v7, v8, v9);
}

- (void)makeActiveTabDocumentActive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TabController *)self activeTabDocument];
  [v3 setActive:1];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_documentObservers;
  uint64_t v5 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint8_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "tabController:didSwitchFromTabDocument:toTabDocument:", self, 0, v3, (void)v10);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSHashTable *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)saveTabDocumentUserActivitySoon:(id)a3
{
  uint64_t v4 = (TabDocument *)a3;
  if (!self->_updateContinuityTimer && self->_normalActiveTabDocument == v4)
  {
    uint64_t v7 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__updateUserActivityTimerFired selector:0 userInfo:0 repeats:1.0];
    updateContinuityTimer = self->_updateContinuityTimer;
    self->_updateContinuityTimer = v5;

    [(NSTimer *)self->_updateContinuityTimer setTolerance:1.0];
    uint64_t v4 = v7;
  }
}

- (BOOL)updatingTabGroupTabs
{
  return self->_updateTabsSuppressionCount != 0;
}

void __37__TabController__cloudTabsDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 89))
  {
    *(unsigned char *)(v1 + 89) = 1;
    -[TabController _restoreEducationTabsIfNecessaryAnimated:](*(void *)(a1 + 32), 1);
  }
}

- (void)_sendWillBeginDocumentUpdates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 128);
    *(void *)(a1 + 128) = v2 + 1;
    if (!v2)
    {
      uint64_t v3 = [*(id *)(a1 + 104) copy];
      uint64_t v4 = *(void **)(a1 + 112);
      *(void *)(a1 + 112) = v3;

      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = *(id *)(a1 + 112);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v10, "tabControllerWillBeginUpdates:", a1, (void)v11);
            }
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)tabSwitcherShareConfigurationForTabGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  if ([v6 isNamed]
    && (+[FeatureManager sharedFeatureManager],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 areSharedTabGroupsEnabled],
        v8,
        (v9 & 1) != 0))
  {
    cachedShareConfigurationsByTabGroupUUID = self->_cachedShareConfigurationsByTabGroupUUID;
    long long v11 = [v6 uuid];
    long long v12 = [(NSMutableDictionary *)cachedShareConfigurationsByTabGroupUUID objectForKeyedSubscript:v11];

    if (v12)
    {
      v7[2](v7, v12);
    }
    else
    {
      objc_initWeak(&location, self);
      tabGroupManager = self->_tabGroupManager;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke;
      v14[3] = &unk_1E6D7C8F8;
      v14[4] = self;
      id v15 = v6;
      objc_copyWeak(&v17, &location);
      uint64_t v16 = v7;
      [(WBTabGroupManager *)tabGroupManager shareRecordForTabGroup:v15 completionHandler:v14];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (id)tabGroupWithUUID:(id)a3
{
  return (id)[(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:a3];
}

- (void)persistActiveTabGroupOrTabGroupVisibleInSwitcher
{
  id v6 = [(TabController *)self activeTabGroupOrTabGroupVisibleInSwitcher];
  uint64_t v3 = [(TabController *)self windowState];
  uint64_t v4 = [v6 uuid];
  [v3 setActiveTabGroupUUID:v4];

  [(WBTabGroupManager *)self->_tabGroupManager saveWindowState:v3 completionHandler:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "writePrivateBrowsingEnabled:", objc_msgSend(v6, "isPrivateBrowsing"));
}

- (void)tabGroupManagerDidFinishSetup:(id)a3
{
  -[TabController _application](self);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (![v6 isRunningPPT] || objc_msgSend(v6, "shouldRestoreStateForPPT"))
  {
    self->_didFinishTabGroupSetup = 1;
    [(TabController *)self readState];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained reloadSidebarAnimated:0];

    id v5 = -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
    [v5 reloadTabGroups];
  }
}

- (void)tabGroupManager:(id)a3 didUpdateTabsInTabGroupWithUUID:(id)a4
{
  id v5 = [a3 tabGroupWithUUID:a4];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke;
  v25 = &unk_1E6D7CD40;
  id v6 = v5;
  id v26 = v6;
  int v27 = self;
  uint64_t v7 = (void (**)(void))MEMORY[0x1E4E42950](&v22);
  if (-[TabController isTabGroupActive:](self, "isTabGroupActive:", v6, v22, v23, v24, v25))
  {
    uint64_t v8 = [(TabController *)self currentTabs];
    char v9 = v7[2](v7);
    -[TabController _replaceTabs:withTabs:persist:](self, v8, v9, 0);

LABEL_7:
    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained reloadSidebarAnimated:0];

  long long v11 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabSwitcherViewController];
  [v11 setNeedsApplyContentAnimated:1];

  long long v12 = [(WBWindowState *)self->_windowState privateTabGroup];
  int v13 = [v6 isEqual:v12];

  if (v13)
  {
    mutablePrivateTabs = self->_mutablePrivateTabs;
    id v15 = v7[2](v7);
    [(NSMutableArray *)mutablePrivateTabs setArray:v15];

    -[TabController _suppressSingleEmptyTabIfAppropriate]((uint64_t)self);
  }
  else
  {
    uint64_t v16 = [v6 uuid];
    id v17 = [(NSMutableArray *)self->_mutableNormalTabs firstObject];
    uint64_t v18 = [v17 wbTab];
    uint64_t v19 = [v18 tabGroupUUID];
    int v20 = [v16 isEqual:v19];

    if (v20)
    {
      mutableNormalTabs = self->_mutableNormalTabs;
      uint64_t v8 = v7[2](v7);
      [(NSMutableArray *)mutableNormalTabs setArray:v8];
      goto LABEL_7;
    }
  }
LABEL_8:
}

id __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tabs];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  int v13 = __65__TabController_tabGroupManager_didUpdateTabsInTabGroupWithUUID___block_invoke_2;
  long long v14 = &unk_1E6D7CD18;
  int8x16_t v10 = *(int8x16_t *)(a1 + 32);
  id v3 = (id)v10.i64[0];
  int8x16_t v15 = vextq_s8(v10, v10, 8uLL);
  uint64_t v4 = objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &v11);

  if ([*(id *)(a1 + 32) usesGlobalPinnedTabs])
  {
    char v5 = [*(id *)(a1 + 32) isPrivateBrowsing];
    id v6 = *(void **)(a1 + 40);
    if (v5) {
      -[TabController privatePinnedTabs](v6);
    }
    else {
    uint64_t v7 = -[TabController normalPinnedTabs](v6);
    }
    uint64_t v8 = objc_msgSend(v7, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v4, *(_OWORD *)&v10, v11, v12, v13, v14);

    uint64_t v4 = (void *)v8;
  }

  return v4;
}

- (BOOL)isTabGroupActive:(id)a3
{
  uint64_t v4 = [a3 uuid];
  LOBYTE(self) = [v4 isEqualToString:self->_activeTabGroupUUID];

  return (char)self;
}

- (id)normalPinnedTabs
{
  if (a1)
  {
    uint64_t v1 = [a1 normalTabs];
    uint64_t v2 = objc_msgSend(v1, "safari_filterObjectsUsingBlock:", &__block_literal_global_15_0);
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (NSArray)normalTabs
{
  uint64_t v2 = (void *)[(NSMutableArray *)self->_mutableNormalTabs copy];
  return (NSArray *)v2;
}

- (void)_replaceTabs:(void *)a3 withTabs:(int)a4 persist:
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __47__TabController__replaceTabs_withTabs_persist___block_invoke;
    v109[3] = &unk_1E6D78980;
    v109[4] = a1;
    id v10 = v8;
    id v110 = v10;
    id v11 = v7;
    id v111 = v11;
    [v9 setHandler:v109];
    if ([v11 count] || objc_msgSend(v10, "count"))
    {
      uint64_t v12 = [a1 activeTabDocument];
      uint64_t v87 = (uint64_t)a1;
      int v13 = -[TabController mutableCurrentTabs]((char *)a1);
      if ([v13 count]
        && (uint64_t v14 = [v11 count], v14 == objc_msgSend(v13, "count"))
        && ![v10 count])
      {
        ++*(void *)(v87 + 176);
        id v66 = -[TabController _openBlankTabDocument]((id *)v87);
        --*(void *)(v87 + 176);
        int v15 = 1;
      }
      else
      {
        int v15 = 0;
      }
      [v13 removeObjectsInArray:v11];
      objc_msgSend(v13, "safari_insertObjects:afterObject:", v10, 0);
      uint64_t v16 = [v10 differenceFromArray:v11 withOptions:4];
      if ([v16 hasChanges])
      {
        int v79 = v15;
        int v77 = a4;
        id v82 = v8;
        v83 = v13;
        v80 = v12;
        id v81 = v9;
        id v78 = v7;
        -[TabController _sendWillBeginDocumentUpdates](v87);
        [*(id *)(v87 + 72) beginFixingTabBarItems];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        v84 = v16;
        id v17 = [v16 insertions];
        uint64_t v18 = [v17 countByEnumeratingWithState:&v105 objects:v115 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v106;
          v21 = MEMORY[0x1E4F14428];
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v106 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v23 = *(void **)(*((void *)&v105 + 1) + 8 * i);
              if ([v23 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
              {
                id v24 = [v23 object];
                [v24 setHasBeenInserted:1];
                [v24 setNeedsNewTabSnapshot];
                if (([*(id *)(v87 + 208) containsObject:v24] & 1) == 0)
                {
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __47__TabController__replaceTabs_withTabs_persist___block_invoke_2;
                  block[3] = &unk_1E6D77E20;
                  id v104 = v24;
                  dispatch_async(v21, block);
                }
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v105 objects:v115 count:16];
          }
          while (v19);
        }

        long long v101 = 0u;
        long long v102 = 0u;
        long long v99 = 0u;
        long long v100 = 0u;
        id obj = [v16 removals];
        uint64_t v25 = [obj countByEnumeratingWithState:&v99 objects:v114 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          char v27 = 0;
          uint64_t v28 = *(void *)v100;
          long long v29 = (void *)v87;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v100 != v28) {
                objc_enumerationMutation(obj);
              }
              long long v31 = *(void **)(*((void *)&v99 + 1) + 8 * j);
              if ([v31 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v32 = [v31 object];
                [v29 willLoseOwnershipOfTab:v32];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (+[WBReusableTabManager sharedManager],
                      long long v33 = objc_claimAutoreleasedReturnValue(),
                      char v34 = [v33 isTabSuspended:v32],
                      v33,
                      (v34 & 1) == 0))
                {
                  [v32 willClose];
                  [v32 setClosed:1];
                }
                long long v35 = [v29 activeTabDocument];
                BOOL v36 = v32 == v35;

                if ([v32 isClosed])
                {
                  v37 = [v32 webExtensionsController];
                  uint64_t v38 = [v37 tabIDToTabPositionForTabsInTransit];
                  v39 = (void *)MEMORY[0x1E4F28ED0];
                  [v32 idForWebExtensions];
                  v40 = objc_msgSend(v39, "numberWithDouble:");
                  [v38 removeObjectForKey:v40];

                  long long v29 = (void *)v87;
                  v96[0] = MEMORY[0x1E4F143A8];
                  v96[1] = 3221225472;
                  v96[2] = __47__TabController__replaceTabs_withTabs_persist___block_invoke_3;
                  v96[3] = &unk_1E6D77D90;
                  id v97 = v37;
                  id v98 = v32;
                  id v41 = v37;
                  dispatch_async(MEMORY[0x1E4F14428], v96);
                }
                v27 |= v36;
              }
            }
            uint64_t v26 = [obj countByEnumeratingWithState:&v99 objects:v114 count:16];
          }
          while (v26);
        }
        else
        {
          char v27 = 0;
        }

        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        v42 = [v84 insertions];
        uint64_t v43 = [v42 countByEnumeratingWithState:&v92 objects:v113 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          char v45 = 0;
          uint64_t v46 = *(void *)v93;
          id v7 = v78;
          v47 = v83;
          int v48 = v77;
          do
          {
            for (uint64_t k = 0; k != v44; ++k)
            {
              if (*(void *)v93 != v46) {
                objc_enumerationMutation(v42);
              }
              v45 |= [*(id *)(*((void *)&v92 + 1) + 8 * k) associatedIndex] != 0x7FFFFFFFFFFFFFFFLL;
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v92 objects:v113 count:16];
          }
          while (v44);
        }
        else
        {
          char v45 = 0;
          id v7 = v78;
          v47 = v83;
          int v48 = v77;
        }

        id obja = [MEMORY[0x1E4F98FC0] tabIDToTabPositionDictionaryForTabs:v47];
        if (v45)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(v87 + 8));
          v51 = [WeakRetained browserWindowController];
          v52 = -[TabController _application]((void *)v87);
          v53 = [v52 browserWindowController];

          if (v51 == v53)
          {
            v54 = [MEMORY[0x1E4F98FC0] tabIDToTabPositionDictionaryForTabs:v47];
            v55 = [v47 firstObject];
            v56 = [v55 webExtensionsController];
            [v56 fireOnMovedEventForTabsWithPreviousTabPositions:obja currentTabsPositions:v54];
          }
        }
        uint64_t v57 = v87;
        if ((v79 | v48) == 1) {
          [(id)v87 didUpdateTabDocuments];
        }
        if (v27)
        {
          id v58 = objc_alloc(MEMORY[0x1E4F29128]);
          v59 = [(id)v87 activeTabGroup];
          v60 = [v59 lastSelectedTabUUID];
          v61 = (void *)[v58 initWithUUIDString:v60];
          v62 = [(id)v87 tabWithUUID:v61];

          if (v62 && ([v47 containsObject:v62] & 1) != 0)
          {
            uint64_t v57 = v87;
          }
          else
          {
            uint64_t v57 = v87;
            v63 = -[TabController _firstUnpinnedTab]((void *)v87);
            v64 = v63;
            if (v63)
            {
              id v65 = v63;
            }
            else
            {
              id v65 = [v47 firstObject];
            }
            id v67 = v65;

            v62 = v67;
          }
          v68 = -[TabController _unhibernateTabIfNeeded:]((TabDocument *)v57, v62);
          -[TabController _setActiveTabDocument:]((void *)v57, v68);
        }
        id v69 = objc_loadWeakRetained((id *)(v57 + 8));
        [v69 clearCachedTabCompletionData];
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id v70 = *(id *)(v57 + 104);
        uint64_t v71 = [v70 countByEnumeratingWithState:&v88 objects:v112 count:16];
        uint64_t v16 = v84;
        if (v71)
        {
          uint64_t v72 = v71;
          uint64_t v73 = *(void *)v89;
          do
          {
            for (uint64_t m = 0; m != v72; ++m)
            {
              if (*(void *)v89 != v73) {
                objc_enumerationMutation(v70);
              }
              v75 = *(void **)(*((void *)&v88 + 1) + 8 * m);
              if (objc_opt_respondsToSelector()) {
                [v75 tabControllerDidChangeCurrentTabDocuments:v87];
              }
            }
            uint64_t v72 = [v70 countByEnumeratingWithState:&v88 objects:v112 count:16];
          }
          while (v72);
        }

        v76 = [(id)v87 activeTabDocument];
        uint64_t v12 = v80;
        -[TabController _switchActiveTabDocumentFromTabDocument:toTabDocument:](v87, v80, v76);

        -[TabController _sendDidEndDocumentUpdates](v87);
        [*(id *)(v87 + 72) endFixingTabBarItems];

        id v9 = v81;
        id v8 = v82;
        int v13 = v83;
      }
    }
  }
}

- (char)mutableCurrentTabs
{
  if (a1)
  {
    uint64_t v2 = a1;
    int v3 = [a1 isPrivateBrowsingEnabled];
    uint64_t v4 = 16;
    if (v3) {
      uint64_t v4 = 24;
    }
    a1 = (char *)*(id *)&v2[v4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)hasUnreadTab
{
  int v3 = [(TabController *)self activeTabGroup];
  int v4 = [v3 isShared];

  if (!v4) {
    return 0;
  }
  char v5 = [(TabController *)self currentTabs];
  char v6 = objc_msgSend(v5, "safari_containsObjectPassingTest:", &__block_literal_global_528);

  return v6;
}

- (void)_cloudTabsDidUpdate:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__TabController__cloudTabsDidUpdate___block_invoke;
  block[3] = &unk_1E6D77E20;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)updateProfileWithIdentifier:(id)a3 persist:(BOOL)a4 usingBlock:(id)a5 completionHandler:(id)a6
{
  return (id)[(WBTabGroupManager *)self->_tabGroupManager updateProfileWithIdentifier:a3 persist:a4 usingBlock:a5 completionHandler:a6];
}

- (void)closeTabsAutomaticallyIfNecessary
{
  uint64_t v3 = [MEMORY[0x1E4F98998] automaticTabClosingInterval];
  if (v3)
  {
    uint64_t v4 = v3;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(void *)buf = 0;
    long long v32 = buf;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = v5;
    char v6 = [(WBWindowState *)self->_windowState localTabGroup];
    id v7 = [v6 tabs];
    id v8 = [(WBWindowState *)self->_windowState privateTabGroup];
    id v9 = [v8 tabs];
    id v10 = [v7 arrayByAddingObjectsFromArray:v9];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke;
    v30[3] = &unk_1E6D7C240;
    v30[4] = self;
    v30[5] = buf;
    v30[6] = v4;
    id v11 = objc_msgSend(v10, "safari_filterObjectsUsingBlock:", v30);
    [MEMORY[0x1E4F98998] setMostDistantLastViewedTime:*((double *)v32 + 3)];
    if ([v11 count])
    {
      uint64_t v12 = [(TabController *)self activeTabGroup];
      int v13 = [v12 isLocal];

      if (v13)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_5;
        v29[3] = &unk_1E6D7C268;
        v29[4] = self;
        uint64_t v14 = objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", v29);
        if ([v14 count]) {
          -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v14, 0, 1, 0, 1);
        }
      }
      else
      {
        tabGroupManager = self->_tabGroupManager;
        uint64_t v18 = [(WBWindowState *)self->_windowState localTabGroup];
        uint64_t v19 = [v18 uuid];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_2;
        v27[3] = &unk_1E6D7C290;
        id v28 = v11;
        [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v19 persist:1 usingBlock:v27];
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_3;
      v26[3] = &unk_1E6D7C268;
      v26[4] = self;
      uint64_t v20 = objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", v26);
      if ([v20 count])
      {
        -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v20, 0, 0, 0, 1);
        v21 = +[Application sharedApplication];
        [v21 updateLockedPrivateBrowsingState];
      }
      uint64_t v22 = [MEMORY[0x1E4F97E48] sharedLogger];
      uint64_t v23 = [v11 count];
      id v24 = WBSAutomaticTabClosingIntervalAnalyticsTitle();
      [v22 didCloseTabsAutomaticallyWithCount:v23 tabClosingInterval:v24];
    }
    else
    {
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXTabs();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v25 = 0;
        _os_log_impl(&dword_1E102C000, v16, OS_LOG_TYPE_DEFAULT, "Not closing any tabs, because none were eligible to close automatically", v25, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    int v15 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v15, OS_LOG_TYPE_DEFAULT, "Not closing any tabs, since the user's preference is to never close tabs automatically", buf, 2u);
    }
  }
}

uint64_t __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  char v6 = [v3 uuid];
  id v7 = (void *)[v5 initWithUUIDString:v6];
  id v8 = [v4 tabWithUUID:v7];

  if (![v8 isActive])
  {
    id v11 = [v3 localAttributes];
    uint64_t v12 = [v11 lastVisitTime];

    if (v12 && ([v12 timeIntervalSinceReferenceDate], v13 > 0.0))
    {
      WBSAutomaticTabClosingIntervalTimeInterval();
      if (objc_msgSend(v3, "canCloseAutomaticallyForInterval:"))
      {
        uint64_t v10 = 1;
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
      [v16 timeIntervalSinceDate:v12];
      double v18 = v17;

      if (v18 > 0.0)
      {
        uint64_t v10 = 0;
        uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
        double v20 = *(double *)(v19 + 24);
        if (v20 >= v18) {
          double v20 = v18;
        }
        *(double *)(v19 + 24) = v20;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v14 = WBS_LOG_CHANNEL_PREFIXTabs();
      uint64_t v10 = 0;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "Not closing tab automatically because lastViewedTime is unknown.", v21, 2u);
    }
    uint64_t v10 = 0;
    goto LABEL_11;
  }
  id v9 = WBS_LOG_CHANNEL_PREFIXTabs();
  uint64_t v10 = 0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Not closing tab automatically because it is active", buf, 2u);
    uint64_t v10 = 0;
  }
LABEL_12:

  return v10;
}

id __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPrivateBrowsing])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    id v7 = [v3 uuid];
    id v8 = (void *)[v6 initWithUUIDString:v7];
    uint64_t v4 = [v5 tabWithUUID:v8];
  }
  return v4;
}

- (void)_closeTabs:(unsigned int)a3 animated:(int)a4 allowAddingToRecentlyClosedTabs:(char)a5 keepWebViewAlive:(int)a6 showAutoCloseTabsAlert:
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  if (!a1) {
    goto LABEL_103;
  }
  id v11 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v11 reportTabUpdatedWithUpdateType:3];

  -[TabController _sendEventsForAutoFillTelemetryForClosingTabs:](a1, v10);
  *(unsigned char *)(a1 + 136) = 1;
  -[TabController _sendWillBeginDocumentUpdates](a1);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v12 = [v10 firstObject];
  int v13 = [v12 isPrivateBrowsingEnabled];
  long long v92 = [MEMORY[0x1E4F1CA48] array];
  int v89 = v13;
  long long v90 = -[TabController _mutableTabsForPrivateBrowsing:]((char *)a1, v13);
  uint64_t v14 = [v12 wbTab];
  uint64_t v15 = [v14 tabGroupUUID];

  uint64_t v87 = v12;
  long long v88 = (void *)v15;
  int v84 = a6;
  if (!v15 && [v12 isPrivateBrowsingEnabled])
  {
    uint64_t v16 = [*(id *)(a1 + 272) privateTabGroup];
    id v17 = [v16 uuid];
LABEL_8:

    long long v88 = v17;
    goto LABEL_9;
  }
  if (*(void *)(a1 + 56))
  {
    double v18 = [(id)a1 currentTabs];
    int v19 = [v18 containsObject:v12];

    if (v19)
    {
      id v17 = *(id *)(a1 + 56);
      uint64_t v16 = v88;
      goto LABEL_8;
    }
  }
LABEL_9:
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v85 = v10;
  id v20 = v10;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v102 objects:v108 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v103 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v102 + 1) + 8 * i);
        if (a4)
        {
          if (([*(id *)(*((void *)&v102 + 1) + 8 * i) isBlank] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v25 hibernate];
            }
          }
          uint64_t v26 = [WeakRetained configuration];
          int v27 = [v26 allowsReopeningClosedTabs];

          if (v27) {
            [v92 addObject:v25];
          }
        }
        if ((a5 & 1) == 0) {
          [v25 setClosed:1];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v102 objects:v108 count:16];
    }
    while (v22);
  }

  if ([v92 count]) {
    -[TabController _addTabsToRecentlyClosed:](a1, v92);
  }
  id v28 = [(id)a1 activeTabDocument];
  if (v28 && [v20 containsObject:v28])
  {
    if (([v90 containsObject:v28] & 1) == 0) {
      [v90 addObject:v28];
    }
    int v29 = 1;
  }
  else
  {
    int v29 = 0;
  }
  long long v30 = objc_msgSend(v20, "safari_filterObjectsUsingBlock:", &__block_literal_global_84);
  if (v89) {
    [(id)a1 privateUnpinnedTabs];
  }
  else {
  long long v31 = [(id)a1 normalUnpinnedTabs];
  }
  unint64_t v32 = [v31 count];

  unint64_t v33 = [v30 count];
  unsigned __int8 v34 = -[TabController _hasPinnedStartPageExcludingTabs:]((void *)a1, v20);
  int v35 = 0;
  if (v33 >= v32 && (v34 & 1) == 0)
  {
    BOOL v36 = [(id)a1 currentTabs];
    int v37 = [v36 containsObject:v87];

    if (v37)
    {
      [*(id *)(a1 + 72) beginFixingTabBarItems];
      [*(id *)(a1 + 72) beginFixingTabOverviewItems];
      if ([(id)a1 isPrivateBrowsingEnabled])
      {
        uint64_t v38 = -[TabController tabThumbnailCollectionView]((id *)a1);
        uint64_t v39 = [v38 presentationState];

        if (v39)
        {
          v40 = [[TabDocument alloc] initWithBrowserController:WeakRetained];
          id v41 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v40;

          int v35 = 1;
          [*(id *)(a1 + 32) setIsBlank:1];
          objc_msgSend(*(id *)(a1 + 32), "setScrollPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
          [(id)a1 insertTab:*(void *)(a1 + 32) afterTab:0 inBackground:1 animated:0];
          [*(id *)(a1 + 32) displayNewTabOverridePageIfNecessary];
          goto LABEL_50;
        }
      }
      if (v89 == [(id)a1 isPrivateBrowsingEnabled]) {
        id v46 = -[TabController _openBlankTabDocument]((id *)a1);
      }
    }
    else
    {
      v42 = [(id)a1 alternateTabs];
      int v43 = [v42 containsObject:v87];

      if (!v43)
      {
        int v35 = 0;
        goto LABEL_50;
      }
      [*(id *)(a1 + 72) beginFixingTabBarItems];
      [*(id *)(a1 + 72) beginFixingTabOverviewItems];
      uint64_t v44 = -[TabController _insertNewBlankTabDocumentWithPrivateBrowsing:inBackground:animated:]((id *)a1, v89, 1, 0);
      if (v89)
      {
        objc_storeStrong((id *)(a1 + 288), v44);
        uint64_t v45 = 32;
      }
      else
      {
        uint64_t v45 = 296;
      }
      v47 = *(void **)(a1 + v45);
      *(void *)(a1 + v45) = v44;
    }
    int v35 = 1;
  }
LABEL_50:
  id v48 = v28;
  v49 = v48;
  id v82 = v48;
  int v81 = v35;
  if (v29)
  {
    v50 = [*(id *)(a1 + 312) tabToSelectBeforeClosingTabs:v20];

    v51 = [*(id *)(a1 + 72) tabOverview];
    if ([v51 presentationState])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_55:
        [*(id *)(a1 + 72) setSuppressTabBarAnimation:a3 ^ 1];
        [(id)a1 setActiveTab:v50];
        [*(id *)(a1 + 72) setSuppressTabBarAnimation:0];
        int v79 = v50;
        v86 = v50;
        goto LABEL_57;
      }
      v51 = [v50 webView];
      [v51 _hideContentUntilNextUpdate];
    }

    goto LABEL_55;
  }
  int v79 = 0;
  v86 = v48;
LABEL_57:
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v53 = v20;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v98 objects:v107 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v99;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v99 != v56) {
          objc_enumerationMutation(v53);
        }
        id v58 = *(void **)(*((void *)&v98 + 1) + 8 * j);
        if ((a5 & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v58 willClose];
          }
        }
        objc_msgSend(v90, "removeObject:", v58, v79);
        if (v58 == *(void **)(a1 + 32))
        {
          *(void *)(a1 + 32) = 0;
        }
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v98 objects:v107 count:16];
    }
    while (v55);
  }
  v83 = v30;

  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v59 = *(id *)(a1 + 104);
  uint64_t v60 = [v59 countByEnumeratingWithState:&v94 objects:v106 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v95;
    do
    {
      for (uint64_t k = 0; k != v61; ++k)
      {
        if (*(void *)v95 != v62) {
          objc_enumerationMutation(v59);
        }
        v64 = *(void **)(*((void *)&v94 + 1) + 8 * k);
        if (objc_opt_respondsToSelector()) {
          [v64 tabController:a1 didCloseTabDocuments:v53];
        }
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v94 objects:v106 count:16];
    }
    while (v61);
  }

  [*(id *)(a1 + 72) setSuppressTabBarAnimation:a3 ^ 1];
  id v65 = -[TabController _application]((void *)a1);
  [v65 updateTabCount];

  [*(id *)(a1 + 72) setSuppressTabBarAnimation:0];
  id v66 = [*(id *)(a1 + 72) tabOverview];
  id v67 = [v66 itemToActivate];
  id v10 = v85;
  v68 = v86;
  if (!v67
    || ([v53 valueForKey:@"tabOverviewItem"],
        id v69 = objc_claimAutoreleasedReturnValue(),
        int v70 = [v69 containsObject:v67],
        v69,
        !v70))
  {
LABEL_82:
    if (a5) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
  if (*(void **)(a1 + 32) != v86)
  {
    uint64_t v71 = [v86 tabOverviewItem];
    [v66 setItemToActivate:v71];

    goto LABEL_82;
  }
  [v66 setItemToActivate:0];
  if ((a5 & 1) == 0) {
LABEL_83:
  }
    objc_msgSend(*(id *)(a1 + 72), "updateTabOverviewItems", v79);
LABEL_84:
  objc_msgSend(WeakRetained, "clearCachedTabCompletionData", v79);
  if (v81)
  {
    [*(id *)(a1 + 72) endFixingTabBarItems];
    [*(id *)(a1 + 72) endFixingTabOverviewItems];
  }
  [*(id *)(a1 + 72) updateTabBarAnimated:a3 keepingTabVisible:v80];
  uint64_t v72 = -[TabController _application]((void *)a1);
  uint64_t v73 = *MEMORY[0x1E4FB2610];
  v74 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v72 removeDefaultImage:v73 forScreen:v74];

  *(unsigned char *)(a1 + 136) = 0;
  -[TabController _sendDidEndDocumentUpdates](a1);
  -[TabController didUpdateTabDocumentsInTabGroupWithUUID:](a1, v88);
  v75 = -[TabController tabThumbnailCollectionView]((id *)a1);
  if (!WeakRetained
    || v89 != [(id)a1 isPrivateBrowsingEnabled]
    || ![v75 presentationState])
  {
    goto LABEL_100;
  }
  if ([v90 count] != 1
    || (-[TabController allowsClosingLastTab]((void *)a1) & 1) != 0
    || *(void *)(a1 + 176))
  {
    goto LABEL_98;
  }
  v76 = [v90 firstObject];
  if (([v76 isBlank] & 1) == 0)
  {

LABEL_98:
    v68 = v86;
    if (v89) {
      [*(id *)(a1 + 72) updateExplanationViewVisibilityAnimated:a3];
    }
    goto LABEL_100;
  }
  int v77 = [v75 searchController];
  char v78 = [v77 isSearching];

  if (v78) {
    goto LABEL_98;
  }
  [v75 dismissAnimated:a3];
  v68 = v86;
LABEL_100:
  if (v84) {
    -[TabController _presentAutomaticTabClosingPromptIfNeededForClosedTabCount:](a1, [v53 count]);
  }

LABEL_103:
}

uint64_t __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 deleteTabs:*(void *)(a1 + 32)];
}

id __50__TabController_closeTabsAutomaticallyIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPrivateBrowsing])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    id v6 = [v3 uuid];
    id v7 = (void *)[v5 initWithUUIDString:v6];
    id v8 = [v4 tabWithUUID:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_cancelVeryRecentlyClosedTabCountInvalidationTimer
{
  veryRecentlyClosedTabCountInvalidationTimer = self->_veryRecentlyClosedTabCountInvalidationTimer;
  if (veryRecentlyClosedTabCountInvalidationTimer)
  {
    self->_veryRecentlyClosedTabCount = 0;
    [(NSTimer *)veryRecentlyClosedTabCountInvalidationTimer invalidate];
    uint64_t v4 = self->_veryRecentlyClosedTabCountInvalidationTimer;
    self->_veryRecentlyClosedTabCountInvalidationTimer = 0;
  }
}

- (void)_createVeryRecentlyClosedTabCountInvalidationTimer
{
  if (a1 && !*(void *)(a1 + 168))
  {
    uint64_t v2 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:a1 target:sel__cancelVeryRecentlyClosedTabCountInvalidationTimer selector:0 userInfo:0 repeats:4.0];
    id v3 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = v2;
  }
}

- (NSArray)alternateTabs
{
  int v3 = ![(TabController *)self isPrivateBrowsingEnabled];
  return (NSArray *)-[TabController _tabsForPrivateBrowsing:]((char *)self, v3);
}

- (char)_mutableTabsForPrivateBrowsing:(char *)a1
{
  if (a1)
  {
    uint64_t v3 = 16;
    if (a2) {
      uint64_t v3 = 24;
    }
    a1 = (char *)*(id *)&a1[v3];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (char)mutableAlternateTabs
{
  if (a1)
  {
    uint64_t v2 = a1;
    int v3 = [a1 isPrivateBrowsingEnabled];
    uint64_t v4 = 24;
    if (v3) {
      uint64_t v4 = 16;
    }
    a1 = (char *)*(id *)&v2[v4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (NSArray)pinnedTabs
{
  uint64_t v2 = [(TabController *)self currentTabs];
  int v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_13_0);

  return (NSArray *)v3;
}

uint64_t __27__TabController_pinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned];
}

- (NSArray)normalUnpinnedTabs
{
  uint64_t v2 = [(TabController *)self normalTabs];
  int v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_21_0);

  return (NSArray *)v3;
}

uint64_t __35__TabController_normalUnpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (NSArray)privateUnpinnedTabs
{
  uint64_t v2 = [(TabController *)self privateTabs];
  int v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_23);

  return (NSArray *)v3;
}

uint64_t __36__TabController_privateUnpinnedTabs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (id)tabsOlderThan:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9A8];
  id v7 = a3;
  id v8 = [v6 currentCalendar];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [v8 dateByAddingComponents:v7 toDate:v9 options:0];

  [v10 timeIntervalSinceReferenceDate];
  uint64_t v12 = v11;

  if (a4) {
    [(TabController *)self privateUnpinnedTabs];
  }
  else {
  int v13 = [(TabController *)self normalUnpinnedTabs];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __49__TabController_tabsOlderThan_inPrivateBrowsing___block_invoke;
  v16[3] = &__block_descriptor_40_e29_B16__0___CollectionViewTab__8l;
  v16[4] = v12;
  uint64_t v14 = objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v16);

  return v14;
}

BOOL __49__TabController_tabsOlderThan_inPrivateBrowsing___block_invoke(uint64_t a1, void *a2)
{
  [a2 lastActivationTime];
  return v3 < *(double *)(a1 + 32);
}

- (id)oldestTabsWithLimit:(unint64_t)a3 inPrivateBrowsing:(BOOL)a4
{
  id v5 = -[TabController _tabsForPrivateBrowsing:]((char *)self, a4);
  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_27];

  id v7 = objc_msgSend(v6, "safari_prefixWithMaxLength:", a3);

  return v7;
}

uint64_t __55__TabController_oldestTabsWithLimit_inPrivateBrowsing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [a2 lastActivationTime];
  id v6 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  id v7 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 lastActivationTime];
  double v9 = v8;

  id v10 = [v7 dateWithTimeIntervalSinceReferenceDate:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (unint64_t)numberOfCurrentNonHiddenTabs
{
  double v3 = [(TabController *)self currentTabs];
  tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
  if (tabDocumentBeingHiddenFromTabView
    && (BOOL v5 = [(TabDocument *)tabDocumentBeingHiddenFromTabView isPrivateBrowsingEnabled],
        v5 == [(TabController *)self isPrivateBrowsingEnabled])
    && [v3 containsObject:self->_tabDocumentBeingHiddenFromTabView])
  {
    unint64_t v6 = [v3 count] - 1;
  }
  else
  {
    unint64_t v6 = [v3 count];
  }

  return v6;
}

- (unint64_t)numberOfTabsForCloseAllAction
{
  unint64_t v3 = [(TabController *)self numberOfCurrentNonHiddenTabs];
  uint64_t v4 = [(TabController *)self pinnedTabs];
  unint64_t v5 = v3 - [v4 count];

  return v5;
}

- (NSArray)currentTabDocuments
{
  uint64_t v2 = [(TabController *)self currentTabs];
  unint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_34_0);

  return (NSArray *)v3;
}

uint64_t __36__TabController_currentTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSArray)pinnedTabDocuments
{
  id v2 = [(TabController *)self currentTabs];
  unint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_36);

  return (NSArray *)v3;
}

uint64_t __35__TabController_pinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isPinned];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)unpinnedTabDocuments
{
  id v2 = [(TabController *)self currentTabs];
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_38);

  return (NSArray *)v3;
}

uint64_t __37__TabController_unpinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isPinned] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)normalUnpinnedTabDocuments
{
  id v2 = [(TabController *)self normalTabs];
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_40);

  return (NSArray *)v3;
}

uint64_t __43__TabController_normalUnpinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isPinned] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)privateUnpinnedTabDocuments
{
  id v2 = [(TabController *)self privateTabs];
  uint64_t v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_42_0);

  return (NSArray *)v3;
}

uint64_t __44__TabController_privateUnpinnedTabDocuments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isPinned] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)tabDocumentsForAllTabGroups
{
  uint64_t v3 = [(TabController *)self currentTabDocuments];
  uint64_t v4 = (void *)[v3 mutableCopy];

  unint64_t v5 = [(TabController *)self tabGroups];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __44__TabController_tabDocumentsForAllTabGroups__block_invoke;
  uint64_t v12 = &unk_1E6D7C300;
  int v13 = self;
  id v14 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:&v9];

  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);
  return (NSArray *)v7;
}

void __44__TabController_tabDocumentsForAllTabGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) activeTabGroup];

  if (v4 != v3)
  {
    unint64_t v5 = [v3 tabs];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__TabController_tabDocumentsForAllTabGroups__block_invoke_2;
    v6[3] = &unk_1E6D7C2D8;
    id v7 = *(id *)(a1 + 40);
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __44__TabController_tabDocumentsForAllTabGroups__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 uuid];

  id v9 = (id)[v5 initWithUUIDString:v6];
  id v7 = +[WBReusableTabManager sharedManager];
  double v8 = [v7 referenceToTabWithUUID:v9];

  if (v8) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

- (void)removeDocumentObserver:(id)a3
{
}

- (void)didUpdateTabDocuments
{
}

- (void)didUpdateTabDocumentsInTabGroupWithUUID:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && !*(void *)(a1 + 176))
  {
    id v4 = [(id)a1 activeTabGroup];
    if (v4)
    {
      id v5 = [(id)a1 activeTabGroup];
      int v6 = [v5 usesGlobalPinnedTabs];

      if (v6)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke;
        v15[3] = &unk_1E6D7C350;
        v15[4] = a1;
        id v7 = (void *)MEMORY[0x1E4E42950](v15);
        [*(id *)(a1 + 280) updatePinnedTabsInContainer:a1 usingBlock:v7];
      }
      if (objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", *(void *)(a1 + 56)))
      {
        [(id)a1 persistAllCurrentTabsInBackground:1];
      }
      else
      {
        double v8 = [*(id *)(a1 + 272) privateTabGroup];
        id v9 = [v8 uuid];
        int v10 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", v9);

        uint64_t v11 = [*(id *)(a1 + 48) tabGroupWithUUID:v3];
        if ([v11 usesGlobalPinnedTabs])
        {
          if (v10) {
            [(id)a1 privateUnpinnedTabs];
          }
          else {
          uint64_t v12 = [(id)a1 normalUnpinnedTabs];
          }
        }
        else
        {
          uint64_t v13 = 16;
          if (v10) {
            uint64_t v13 = 24;
          }
          uint64_t v12 = [*(id *)(a1 + v13) copy];
        }
        id v14 = (void *)v12;
        [(id)a1 persistTabs:v12 inTabGroupWithUUID:v3 inBackground:1];
      }
      [(id)a1 updateLocalTabGroupTitle];
    }
  }
}

id __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pinnedTabs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke_2;
  v8[3] = &unk_1E6D7C328;
  id v9 = v3;
  id v5 = v3;
  int v6 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v8);

  return v6;
}

id __57__TabController_didUpdateTabDocumentsInTabGroupWithUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 uuidString];
  int v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [v3 wbTab];
    id v8 = (id)[v9 mutableCopy];
  }
  int v10 = [v3 tabUpdateBlock];
  ((void (**)(void, id))v10)[2](v10, v8);

  return v8;
}

- (void)updateHibernatedTabDocumentsSavingState
{
  id v2 = [(TabController *)self allTabDocuments];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_57_0];
}

void __56__TabController_updateHibernatedTabDocumentsSavingState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setPersistWhenHibernated:", objc_msgSend(v2, "isHibernated"));
}

- (void)_setActiveTabDocument:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id v12 = v4;
    id v5 = [v4 libraryType];

    if (v5)
    {
      id v6 = v12;
      id v7 = (id)a1[24];
      a1[24] = v6;
    }
    else
    {
      id v8 = (void *)a1[24];
      a1[24] = 0;

      if ([v12 isPrivateBrowsingEnabled]) {
        uint64_t v9 = 36;
      }
      else {
        uint64_t v9 = 37;
      }
      id v7 = (id)a1[v9];
      if ([v12 isPrivateBrowsingEnabled]) {
        uint64_t v10 = 36;
      }
      else {
        uint64_t v10 = 37;
      }
      objc_storeStrong((id *)&a1[v10], a2);
      uint64_t v11 = [v12 webExtensionsController];
      [v11 didSelectTab:v12 previousTab:v7];

      [a1 updateUsageTrackingInformationIfNecessary];
      [a1 updateActiveTab];
    }

    id v4 = v12;
  }
}

- (void)deactivateAllUsageTrackingInformationIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(TabController *)self allTabDocuments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    p_browserController = &self->_browserController;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
        uint64_t v11 = [WeakRetained tabDocumentPlayingPIPVideo];

        if (v11 != v9) {
          [v9 updateUsageTrackingInformationIfNecessaryGivenDocumentIsCurrent:0];
        }
        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (BOOL)hasTabsThatShouldBeObscuredForDigitalHealth
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(TabController *)self allTabDocuments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) shouldObscureForDigitalHealth])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (TabDocument)tabDocumentBeingActivated
{
  id v2 = [(TabController *)self tabBeingActivated];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3;

  return v4;
}

- (CollectionViewTab)tabBeingActivated
{
  uint64_t v3 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  uint64_t v4 = [v3 itemToActivate];

  if (!v4
    || ([v4 UUID],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [(TabController *)self tabWithUUID:v5],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    uint64_t v6 = [(TabController *)self activeTabDocument];
  }

  return (CollectionViewTab *)v6;
}

- (BOOL)canCloseTab
{
  id v2 = self;
  uint64_t v3 = [(TabController *)self activeTabDocument];
  if ([v3 isBlank] && (objc_msgSend(v3, "isPinned") & 1) == 0)
  {
    uint64_t v4 = [(TabController *)v2 unpinnedTabs];
    if ([v4 count] == 1)
    {
      if (!v2)
      {
LABEL_22:

        goto LABEL_23;
      }
      unsigned int v5 = -[TabController _hasPinnedStartPageExcludingTabs:](v2, 0);

      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_browserController);
  if (([WeakRetained isPrivateBrowsingEnabled] & 1) == 0)
  {

    goto LABEL_12;
  }
  long long v7 = +[Application sharedApplication];
  char v8 = [v7 isPrivateBrowsingLocked];

  if ((v8 & 1) == 0)
  {
LABEL_12:
    uint64_t v4 = -[TabController tabThumbnailCollectionView]((id *)&v2->super.isa);
    if ([v4 presentationState] == 1 || objc_msgSend(v4, "presentationState") == 2)
    {
      if ([v4 defersActivation])
      {
        long long v9 = [v4 itemToActivate];
        long long v10 = v9;
        if (v9 && ([v9 isPinned] & 1) == 0)
        {
          uint64_t v11 = [v10 UUID];
          LOBYTE(v2) = [(TabController *)v2 canCloseTabWithUUID:v11];
        }
        else
        {
          LOBYTE(v2) = 0;
        }
      }
      else
      {
        LOBYTE(v2) = 0;
      }
    }
    else
    {
      LOBYTE(v2) = 1;
    }
    goto LABEL_22;
  }
LABEL_10:
  LOBYTE(v2) = 0;
LABEL_23:

  return (char)v2;
}

- (BOOL)canCloseOtherTabs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained isPrivateBrowsingEnabled])
  {
    uint64_t v4 = +[Application sharedApplication];
    char v5 = [v4 isPrivateBrowsingLocked];

    if (v5) {
      return 0;
    }
  }
  else
  {
  }
  long long v7 = [(TabController *)self currentTabs];
  if ((unint64_t)[v7 count] < 2)
  {
    BOOL v6 = 0;
  }
  else
  {
    char v8 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
    BOOL v6 = [v8 presentationState] != 1 && objc_msgSend(v8, "presentationState") != 2;
  }
  return v6;
}

- (void)setActiveTab:(id)a3
{
}

- (void)setActiveTab:(id)a3 animated:(BOOL)a4
{
}

- (void)setActiveTab:(id)a3 animated:(BOOL)a4 deferActivation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(TabController *)self setActiveTabDocument:v8 animated:v6 deferActivation:v5];
}

- (void)setActiveTabDocument:(id)a3
{
}

- (void)setActiveTabDocument:(id)a3 animated:(BOOL)a4
{
}

- (void)setActiveTabDocument:(id)a3 animated:(BOOL)a4 deferActivation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v16 = a3;
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  long long v9 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  if ([(TabCollectionViewManager *)self->_tabCollectionViewManager hasTabBar]
    || ([WeakRetained rootViewController],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 usingLoweredBar],
        v10,
        !v6)
    || v11
    || !v9)
  {
    [(TabCollectionViewManager *)self->_tabCollectionViewManager dismissTabHoverPreview];
    long long v13 = [v16 libraryType];
    if (v13)
    {
    }
    else
    {
      int v14 = [v16 isPrivateBrowsingEnabled];
      if (v14 != [(TabController *)self isPrivateBrowsingEnabled])
      {
        -[TabController _setActiveTabDocument:](self, v16);
        objc_msgSend(WeakRetained, "setPrivateBrowsingEnabled:", objc_msgSend(v16, "isPrivateBrowsingEnabled"));
        goto LABEL_13;
      }
    }
    long long v15 = [(TabController *)self activeTabDocument];
    -[TabController _switchActiveTabDocumentFromTabDocument:toTabDocument:]((uint64_t)self, v15, v16);

    kdebug_trace();
  }
  else
  {
    if (v5) {
      [v9 setDefersActivation:1];
    }
    uint64_t v12 = [v16 itemForTabCollectionView:v9];
    [v9 setItemToActivate:v12];

    [v9 presentAnimated:1];
  }
LABEL_13:
}

- (void)_switchActiveTabDocumentFromTabDocument:(void *)a3 toTabDocument:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v7 = v6;
  if (!a1 || v5 == v6) {
    goto LABEL_22;
  }
  int v8 = [v5 isPrivateBrowsingEnabled];
  uint64_t v9 = 16;
  if (v8) {
    uint64_t v9 = 24;
  }
  uint64_t v25 = (void *)[*(id *)(a1 + v9) copy];
  int v10 = [v25 containsObject:v5];
  int v11 = [*(id *)(a1 + 72) tabThumbnailCollectionView];
  uint64_t v12 = [v11 presentationState];

  if (v10) {
    [*(id *)(a1 + 72) updateSnapshotCacheStateSwitchingFromTabDocument:v5];
  }
  [v5 setActive:0];
  [v7 setActive:1];
  -[TabController _setActiveTabDocument:]((void *)a1, v7);
  if (*(void **)(a1 + 32) == v7 && !v12)
  {
    *(void *)(a1 + 32) = 0;

LABEL_11:
    [*(id *)(a1 + 72) updateSnapshotIdentifiers];
    goto LABEL_12;
  }
  if (!v12) {
    goto LABEL_11;
  }
LABEL_12:
  long long v13 = [v5 parentTabDocumentForBackClosesSpawnedTab];
  -[TabController _prepareToMoveTabDocumentToWindow:createPlaceholderImage:](a1, v7, v13 != v7);

  int v14 = +[MediaCaptureStatusBarManager sharedManager];
  [v14 tabDidBecomeActive:v7];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v15 = [*(id *)(a1 + 104) allObjects];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v26 + 1) + 8 * v19);
        if (objc_opt_respondsToSelector()) {
          [v20 tabController:a1 didSwitchFromTabDocument:v5 toTabDocument:v7];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v17);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  uint64_t v22 = [WeakRetained rootViewController];
  uint64_t v23 = [v22 statusBarView];
  [v23 clearStatus];

  [v7 updateShowsSiriReaderPlayingIcon];
  id v24 = [v7 sfScribbleControllerIfLoaded];
  [v24 reloadData];

LABEL_22:
}

- (void)_prepareToMoveTabDocumentToWindow:(int)a3 createPlaceholderImage:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    long long v7 = [v5 webView];
    int v8 = [v7 window];

    if (!v8 && [v7 hasBeenInWindow])
    {
      if (!a3) {
        goto LABEL_9;
      }
      if ([v6 isHibernated]) {
        goto LABEL_9;
      }
      uint64_t v9 = [v6 webView];
      char v10 = [v9 isLoading];

      if ((v10 & 1) != 0
        || (int v11 = *(void **)(a1 + 72),
            [v6 uuid],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            [v11 cachedContentImageForTabWithUUID:v12 allowScaledImage:1],
            long long v13 = objc_claimAutoreleasedReturnValue(),
            v12,
            !v13))
      {
LABEL_9:
        uint64_t v22 = [*(id *)(a1 + 72) tabThumbnailCollectionView];
        uint64_t v23 = [v22 presentationState];

        if (v23 == 2)
        {
          id v24 = [v6 webView];
          [v24 _doAfterNextPresentationUpdateWithoutWaitingForPainting:&__block_literal_global_143];
        }
      }
      else
      {
        int v14 = [v7 scrollView];
        [v14 adjustedContentInset];
        double v16 = v15;
        [v14 contentOffset];
        double v18 = v16 + v17;
        uint64_t v19 = [v6 appBanner];
        [v19 frame];
        double v20 = v18 - CGRectGetHeight(v27);

        objc_msgSend(v7, "setPlaceholderImage:offset:", v13, fmin(v20, 0.0));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __74__TabController__prepareToMoveTabDocumentToWindow_createPlaceholderImage___block_invoke;
        v25[3] = &unk_1E6D77E20;
        id v26 = v7;
        [v26 _doAfterNextPresentationUpdateWithoutWaitingForPainting:v25];
        uint64_t v21 = *(void **)(a1 + 72);
        [v13 size];
        objc_msgSend(v21, "updateStartPageSnapshotIfNeededForTabDocument:currentSnapshotSize:", v6);
      }
    }
  }
}

- (BOOL)canAddNewTabInTabGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 tabs];
  uint64_t v6 = [v5 count];

  if ([v4 usesGlobalPinnedTabs])
  {
    long long v7 = [(TabController *)self pinnedWBTabsForTabGroup:v4];
    v6 += [v7 count];
  }
  BOOL v8 = [(TabController *)self canAddNewTabInTabGroup:v4 withTabCount:v6];

  return v8;
}

- (id)_oldestInactiveTabDocumentForPrivateBrowsing:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2) {
      [a1 privateTabDocuments];
    }
    else {
      [a1 tabDocuments];
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      id v6 = 0;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          char v10 = objc_msgSend(a1, "activeTabDocument", (void)v16);

          if (v10 != v9)
          {
            if (v6)
            {
              [v6 lastViewedTime];
              double v12 = v11;
              [v9 lastViewedTime];
              if (v13 < v12)
              {
                id v14 = v9;

                id v6 = v14;
              }
            }
            else
            {
              id v6 = v9;
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v5);
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

- (BOOL)_makeRoomForNewTab:(TabDocument *)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = *a2;
  if ((-[TabDocument canAddNewTabForPrivateBrowsing:](a1, "canAddNewTabForPrivateBrowsing:", [v4 isPrivateBrowsingEnabled]) & 1) != 0|| a1->_canAttemptUpgradingRequestURLToHTTPS)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v7 = -[TabController _oldestInactiveTabDocumentForPrivateBrowsing:](a1, [v4 isPrivateBrowsingEnabled]);
    BOOL v8 = v7;
    BOOL v5 = v7 != 0;
    if (v7)
    {
      uint64_t v9 = [v7 sessionState];
      if (v9)
      {
        char v10 = -[TabController _unhibernateTabIfNeeded:](a1, v4);
        [v10 restoreSessionState:v9 andNavigate:0];
        id v11 = v10;
        *a2 = v11;
      }
      -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)a1, v8, 0, 0, 0, 1);
    }
  }

  return v5;
}

- (void)performSuppressingDataModelUpdates:(id)a3
{
}

- (void)performBatchUpdatesWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  -[TabController _willPerformBatchUpdates]((uint64_t)self);
  v4[2](v4);

  -[TabController _didPerformBatchUpdates]((id *)&self->super.isa);
}

- (void)_reuseTabAfterInsertion:(id *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = +[WBReusableTabManager sharedManager];
      int v7 = [v6 isTabSuspended:v5];

      if (v7)
      {
        id WeakRetained = objc_loadWeakRetained(a1 + 1);
        uint64_t v9 = +[WBReusableTabManager sharedManager];
        char v10 = [v5 uuid];
        id v11 = (id)[v9 reuseTabForUUID:v10];

        [v5 setBrowserController:WeakRetained afterTabGroupReuse:1];
        double v12 = [a1 allTabGroups];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __41__TabController__reuseTabAfterInsertion___block_invoke;
        v16[3] = &unk_1E6D7C3C0;
        id v13 = v5;
        id v17 = v13;
        id v14 = objc_msgSend(v12, "safari_firstObjectPassingTest:", v16);

        if (([a1 isTabGroupActive:v14] & 1) == 0)
        {
          double v15 = [v13 tabGroupTab];
          -[TabController _removeTab:fromTabGroup:]((uint64_t)a1, v15, v14);
        }
        -[TabController _forceUpdateTabGroupTitleIfNeeded:](a1, v14);
      }
    }
  }
}

uint64_t __41__TabController__reuseTabAfterInsertion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tabs];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__TabController__reuseTabAfterInsertion___block_invoke_2;
  v6[3] = &unk_1E6D7C398;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "safari_containsObjectPassingTest:", v6);

  return v4;
}

uint64_t __41__TabController__reuseTabAfterInsertion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [*(id *)(a1 + 32) uuid];
  id v5 = [v4 UUIDString];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)_removeTab:(void *)a3 fromTabGroup:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    BOOL v8 = *(void **)(a1 + 48);
    uint64_t v9 = [v6 uuid];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__TabController__removeTab_fromTabGroup___block_invoke;
    v18[3] = &unk_1E6D7C290;
    id v10 = v5;
    id v19 = v10;
    [v8 updateTabsInTabGroupWithUUID:v9 persist:1 usingBlock:v18];

    ++*(void *)(a1 + 176);
    if ([v7 isPrivateBrowsing] && (objc_msgSend((id)a1, "isTabGroupActive:", v7) & 1) == 0)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F29128]);
      double v12 = [v10 uuid];
      id v13 = (void *)[v11 initWithUUIDString:v12];
      id v14 = [(id)a1 tabWithUUID:v13];

      if (v14) {
        -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:](a1, v14, 0, 1, 0, 1);
      }
      if (v14 == *(void **)(a1 + 288))
      {
        double v15 = [*(id *)(a1 + 24) firstObject];
        uint64_t v16 = -[TabController _unhibernateTabIfNeeded:]((TabDocument *)a1, v15);
        id v17 = *(void **)(a1 + 288);
        *(void *)(a1 + 288) = v16;

        [(id)a1 updateActiveTab];
      }
      -[TabController _createInitialPrivateTabIfNeeded]((id *)a1);
    }
    --*(void *)(a1 + 176);
  }
}

- (void)_insertTab:(unint64_t)a3 atIndex:(char)a4 inBackground:(unsigned int)a5 animated:(char)a6 updateUI:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  double v12 = v11;
  if (a1)
  {
    int v13 = [v11 isPrivateBrowsingEnabled];
    if (v13) {
      uint64_t v14 = 24;
    }
    else {
      uint64_t v14 = 16;
    }
    id v15 = *(id *)(a1 + v14);
    if ([v15 containsObject:v12])
    {
      [v15 removeObject:v12];
      if ([v15 count] < a3) {
        a3 = [v15 count];
      }
      [v15 insertObject:v12 atIndex:a3];
      id v16 = v12;
    }
    else
    {
      char v42 = a6;
      id v17 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v17 reportTabUpdatedWithUpdateType:4];

      -[TabController _sendWillBeginDocumentUpdates](a1);
      id v49 = v12;
      BOOL v18 = -[TabController _makeRoomForNewTab:]((TabDocument *)a1, &v49);
      id v16 = v49;

      if (v18)
      {
        if ([v15 count] <= a3) {
          [v15 addObject:v16];
        }
        else {
          [v15 insertObject:v16 atIndex:a3];
        }
        char v41 = a4;
        -[TabController _reuseTabAfterInsertion:]((id *)a1, v16);
      }
      else
      {
        uint64_t v19 = 296;
        if (v13) {
          uint64_t v19 = 288;
        }
        id v20 = *(id *)(a1 + v19);
        uint64_t v21 = (void *)[*(id *)(a1 + v14) copy];
        if ([v21 containsObject:v20])
        {
          [(id)a1 replaceTabDocument:v20 withTabDocument:v16];
        }
        else
        {
          uint64_t v22 = WBS_LOG_CHANNEL_PREFIXTabs();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](v13, v22);
          }
          [v15 addObject:v16];
          a4 = 0;
        }
        char v41 = a4;
      }
      [v16 setHasBeenInserted:1];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v23 = *(id *)(a1 + 104);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v46 != v26) {
              objc_enumerationMutation(v23);
            }
            long long v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v28 tabController:a1 didInsertTabDocument:v16];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v25);
      }

      if (([*(id *)(a1 + 208) containsObject:v16] & 1) == 0)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__TabController__insertTab_atIndex_inBackground_animated_updateUI___block_invoke;
        block[3] = &unk_1E6D77E20;
        id v44 = v16;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      [(id)a1 didUpdateTabDocuments];
      if (v42)
      {
        [v16 setNeedsNewTabSnapshot];
        long long v29 = +[Application sharedApplication];
        [v29 updateTabCount];

        [*(id *)(a1 + 72) updateTabOverviewItems];
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
        [WeakRetained clearCachedTabCompletionData];
        if (!a5
          || ([*(id *)(a1 + 72) hasTabBar] & 1) != 0
          || ([(id)a1 activeTabDocument],
              uint64_t v31 = objc_claimAutoreleasedReturnValue(),
              char v32 = [v31 isShowingFindOnPage],
              v31,
              (v32 & 1) == 0))
        {
          if (v41)
          {
            [v16 lastViewedTime];
            if (v33 == 0.0)
            {
              [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
              objc_msgSend(v16, "setLastViewedTime:");
            }
          }
          else
          {
            [(id)a1 setActiveTab:v16 animated:a5];
          }
          [*(id *)(a1 + 72) updateTabBarAnimated:a5 keepingTabVisible:v16];
          unsigned __int8 v34 = [WeakRetained configuration];
          int v35 = [v34 allowsSearchFeedback];

          if (v35)
          {
            BOOL v36 = [WeakRetained rootViewController];
            int v37 = [v36 capsuleCollectionViewLayout];
            BOOL v38 = [v37 integerValue] != 2;

            uint64_t v39 = +[UniversalSearchSession sharedSession];
            v40 = [v39 feedbackDispatcher];
            [v40 sendNewTabFeedback:v38];
          }
        }
        -[TabController _sendDidEndDocumentUpdates](a1);
      }
      else
      {
        -[TabController _sendDidEndDocumentUpdates](a1);
      }
    }

    double v12 = v16;
  }
}

void __67__TabController__insertTab_atIndex_inBackground_animated_updateUI___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webExtensionsController];
  [v2 didOpenTab:*(void *)(a1 + 32)];
}

- (void)insertTab:(id)a3 afterTab:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6
{
  unsigned int v6 = a6;
  id v10 = a4;
  id v12 = a3;
  unint64_t v11 = -[TabController _indexForInsertionAfterTab:withPrivateBrowsingEnabled:]((uint64_t)self, v10, [v12 isPrivateBrowsingEnabled]);

  -[TabController _insertTab:atIndex:inBackground:animated:updateUI:]((uint64_t)self, v12, v11, a5, v6, !self->_isClosingTabs);
}

- (uint64_t)_indexForInsertionAfterTab:(int)a3 withPrivateBrowsingEnabled:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = 16;
    if (a3) {
      uint64_t v6 = 24;
    }
    id v7 = (void *)[*(id *)(a1 + v6) copy];
    BOOL v8 = v7;
    if (v5 && (uint64_t v9 = [v7 indexOfObject:v5], v9 != 0x7FFFFFFFFFFFFFFFLL)) {
      uint64_t v10 = v9 + 1;
    }
    else {
      uint64_t v10 = [v8 count];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)insertTabs:(id)a3 beforeTab:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FFFFFFFFFFFFFFFLL;
  v19[0] = 0;
  v19[1] = v19;
  void v19[2] = 0x2020000000;
  v19[3] = 0x7FFFFFFFFFFFFFFFLL;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__TabController_insertTabs_beforeTab_inBackground_animated___block_invoke;
  v13[3] = &unk_1E6D7C3E8;
  id v15 = v20;
  id v16 = v19;
  v13[4] = self;
  id v12 = v11;
  id v14 = v12;
  BOOL v17 = a5;
  BOOL v18 = a6;
  [v10 enumerateObjectsWithOptions:2 usingBlock:v13];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
}

void __60__TabController_insertTabs_beforeTab_inBackground_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ([v8 isPrivateBrowsingEnabled])
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    uint64_t v6 = -[TabController _indexForInsertionBeforeTab:withPrivateBrowsingEnabled:](*(void *)(a1 + 32), *(void **)(a1 + 40), 1);
    unint64_t v5 = v6;
    uint64_t v7 = *(void *)(a1 + 48);
  }
  else
  {
    unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    uint64_t v6 = -[TabController _indexForInsertionBeforeTab:withPrivateBrowsingEnabled:](*(void *)(a1 + 32), *(void **)(a1 + 40), 0);
    unint64_t v5 = v6;
    uint64_t v7 = *(void *)(a1 + 56);
  }
  *(void *)(*(void *)(v7 + 8) + 24) = v6;
LABEL_7:
  -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](*(void *)(a1 + 32), v8, v5, *(unsigned char *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), a3 == 0);
}

- (uint64_t)_indexForInsertionBeforeTab:(int)a3 withPrivateBrowsingEnabled:
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = 16;
    if (a3) {
      uint64_t v4 = 24;
    }
    unint64_t v5 = *(void **)(a1 + v4);
    id v6 = a2;
    uint64_t v7 = (void *)[v5 copy];
    uint64_t v3 = [v7 indexOfObject:v6];

    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v3 = 0;
    }
  }
  return v3;
}

- (void)insertNewTabDocument:(id)a3 forcingOrderAfterTabDocument:(id)a4 inBackground:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v17 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    int v13 = [v17 ancestorUUIDs];
    uint64_t v14 = [v13 count];

    tabOrderManager = self->_tabOrderManager;
    if (v14) {
      [(WBSTabOrderManager *)tabOrderManager tabToInsertSpawnedTabAfter];
    }
    else {
    id v12 = [(WBSTabOrderManager *)tabOrderManager tabToInsertNewBlankTabAfter];
    }
  }
  id v16 = v12;
  [(TabController *)self insertTab:v17 afterTab:v12 inBackground:v7 animated:v6];
}

- (void)insertNewTabDocumentWithDefaultOrdering:(id)a3 inBackground:(BOOL)a4 animated:(BOOL)a5
{
}

- (id)_insertNewBlankTabDocumentWithPrivateBrowsing:(uint64_t)a3 inBackground:(uint64_t)a4 animated:
{
  if (a1)
  {
    if (a2) {
      char v5 = 2;
    }
    else {
      char v5 = 1;
    }
    -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:](a1, v5, a3, a4);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = vars8;
  }
  return a1;
}

- (TabDocument)_insertNewBlankTabDocumentWithOptions:(uint64_t)a3 inBackground:(uint64_t)a4 animated:
{
  if (a1)
  {
    if ((a2 & 3) == 2)
    {
      uint64_t v8 = 1;
    }
    else if ((a2 & 3) == 1)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = [a1 isPrivateBrowsingEnabled];
    }
    id v9 = a1[4];
    if (!v9 || v8 != [v9 isPrivateBrowsingEnabled])
    {
      id v10 = [TabDocument alloc];
      uint64_t v11 = -[TabController _controlledByAutomation]((uint64_t)a1);
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      int v13 = [(TabDocument *)v10 initWithTitle:0 URL:0 UUID:0 privateBrowsingEnabled:v8 controlledByAutomation:v11 hibernated:0 bookmark:0 browserController:WeakRetained relatedWebView:0];

      uint64_t v14 = [a1 activeTabDocument];
      -[TabDocument setNextLoadComesFromSearchPage:](v13, "setNextLoadComesFromSearchPage:", [v14 isSearchPage]);

      [(TabDocument *)v13 setIsBlank:1];
      -[TabDocument setScrollPoint:](v13, "setScrollPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      id v15 = [a1[9] tabOverview];
      if ([v15 presentationState])
      {
        id v16 = [a1 currentTabs];
        uint64_t v17 = [v16 count];

        if (v17 == 1) {
          [a1[9] setShouldDeferSnapshotRequest:1];
        }
      }
      else
      {
      }
      if (v8 != [a1 isPrivateBrowsingEnabled])
      {
        uint64_t v19 = 0;
LABEL_29:
        [(TabDocument *)v13 displayNewTabOverridePageIfNecessary];
        [a1 insertTab:v13 afterTab:v19 inBackground:a3 animated:a4];

        goto LABEL_30;
      }
      if ((a2 & 0xC) == 8)
      {
        id v20 = [a1[39] tabInsertionHintForPosition:0];
      }
      else
      {
        if ((a2 & 0xC) == 4) {
          [a1[39] tabInsertionHintForNewBlankTabInCurrentContext];
        }
        else {
        id v20 = [a1[39] tabInsertionHintForNewBlankTab];
        }
      }
      uint64_t v21 = v20;
      uint64_t v19 = [v20 tabToInsertAfter];
      uint64_t v22 = [v21 relationType];
      if (v22 == 2)
      {
        id v23 = [a1 activeTabDocument];
        [(TabDocument *)v13 updateAncestryToChildOfTopLevelAncestorRelatedTab:v23];
      }
      else
      {
        if (v22 != 1)
        {
LABEL_28:

          goto LABEL_29;
        }
        id v23 = [a1 activeTabDocument];
        [(TabDocument *)v13 updateAncestryWithParentTab:v23];
      }

      goto LABEL_28;
    }
    int v13 = (TabDocument *)a1[4];
    id v18 = a1[4];
    a1[4] = 0;

    if ((a3 & 1) == 0) {
      [a1 setActiveTabDocument:v13 animated:a4];
    }
  }
  else
  {
    int v13 = 0;
  }
LABEL_30:
  return v13;
}

- (uint64_t)_controlledByAutomation
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  if ([WeakRetained isControlledByAutomation])
  {
    id v2 = +[Application sharedApplication];
    uint64_t v3 = [v2 automationController];
    uint64_t v4 = [v3 canCreateNewAutomationTabs];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)insertNewBlankTabDocumentAnimated:(BOOL)a3
{
  id v3 = -[TabController _insertNewBlankTabDocumentWithPrivateBrowsing:inBackground:animated:]((id *)&self->super.isa, [(TabController *)self isPrivateBrowsingEnabled], 0, a3);
}

- (CollectionViewTab)blankTabToReuse
{
  id v3 = [(TabController *)self activeTabDocument];
  if ([v3 isBlank])
  {
    uint64_t v4 = v3;
    if (!v4) {
      goto LABEL_9;
    }
  }
  else
  {
    char v5 = [(TabController *)self currentTabs];
    objc_msgSend(v5, "safari_firstObjectPassingTest:", &__block_literal_global_72_0);
    uint64_t v4 = (TabDocument *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
LABEL_9:
      uint64_t v8 = 0;
      goto LABEL_10;
    }
  }
  if (v4 == self->_tabDocumentBeingHiddenFromTabView) {
    goto LABEL_9;
  }
  if (![(TabDocument *)v4 isPinned])
  {
    BOOL v6 = [(TabController *)self currentTabs];
    BOOL v7 = [v6 lastObject];
    [(TabController *)self moveTab:v4 overTab:v7];
  }
  uint64_t v8 = v4;
LABEL_10:

  return (CollectionViewTab *)v8;
}

uint64_t __32__TabController_blankTabToReuse__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isBlank];
}

- (id)_openBlankTabDocument
{
  if (a1)
  {
    -[TabController _insertNewBlankTabDocumentWithPrivateBrowsing:inBackground:animated:](a1, [a1 isPrivateBrowsingEnabled], 1, 0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)openNewTabWithOptions:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = &__block_literal_global_75;
  }
  if ([(TabController *)self isPrivateBrowsingAndLocked])
  {
    uint64_t v8 = -[TabController _application](self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_2;
    v18[3] = &unk_1E6D7C410;
    void v18[4] = self;
    id v19 = v7;
    int64_t v20 = a3;
    [v8 authenticateToUnlockPrivateBrowsingWithCompletionHandler:v18];

    id WeakRetained = v19;
    goto LABEL_17;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (!self
    || (a3 & 3) == 1
    || (a3 & 3) != 2 && ![(TabController *)self isPrivateBrowsingEnabled])
  {
    uint64_t v10 = 0;
    goto LABEL_13;
  }
  if ([WeakRetained isPrivateBrowsingAvailable])
  {
    uint64_t v10 = 1;
LABEL_13:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_76;
    v12[3] = &unk_1E6D7C438;
    char v16 = v10;
    id v14 = v7;
    v12[4] = self;
    id WeakRetained = WeakRetained;
    id v13 = WeakRetained;
    int64_t v15 = a3;
    [WeakRetained makeSpaceForTabWithPrivateBrowsing:v10 resultHandler:v12];

    goto LABEL_17;
  }
  uint64_t v11 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_INFO, "Preventing new private tab because Private Browsing is not available", buf, 2u);
  }
  (*((void (**)(void *, void))v7 + 2))(v7, 0);
LABEL_17:
}

uint64_t __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) openNewTabWithOptions:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __57__TabController_openNewTabWithOptions_completionHandler___block_invoke_76(uint64_t a1, char a2)
{
  if (a2)
  {
    if (*(unsigned char *)(a1 + 64) && ([*(id *)(a1 + 32) isPrivateBrowsingEnabled] & 1) == 0) {
      -[TabController _suppressSingleEmptyTabIfAppropriate](*(void *)(a1 + 32));
    }
    id v3 = -[TabController tabThumbnailCollectionView](*(id **)(a1 + 32));
    uint64_t v4 = [v3 presentationState];

    if (v4)
    {
      [*(id *)(a1 + 40) setPrivateBrowsingEnabled:*(unsigned __int8 *)(a1 + 64)];
      -[TabController _addNewActiveTabOverviewTab](*(void *)(a1 + 32));
    }
    else if ([*(id *)(*(void *)(a1 + 32) + 72) hasTabBar])
    {
      -[TabController _openBlankTabDocumentInTabBarWithOptions:](*(id **)(a1 + 32), *(void *)(a1 + 56));
    }
    else
    {
      id v6 = -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:](*(id **)(a1 + 32), *(void *)(a1 + 56), 0, [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]);
    }
    char v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    char v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v5();
}

- (void)_addNewActiveTabOverviewTab
{
  if (!a1) {
    return;
  }
  [*(id *)(a1 + 72) setShouldDeferSnapshotRequest:1];
  id v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    char v5 = 0;
    goto LABEL_6;
  }
  int v3 = [v2 isPrivateBrowsingEnabled];
  int v4 = [(id)a1 isPrivateBrowsingEnabled];
  char v5 = *(void **)(a1 + 32);
  if (v3 != v4)
  {
LABEL_6:
    *(void *)(a1 + 32) = 0;

    if ([(id)a1 isPrivateBrowsingEnabled]) {
      char v8 = 2;
    }
    else {
      char v8 = 1;
    }
    uint64_t v7 = -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:]((id *)a1, v8, 1, 0);
    goto LABEL_10;
  }
  id v12 = v5;
  id v6 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;

  [*(id *)(a1 + 72) updateTabOverviewItems];
  uint64_t v7 = (uint64_t)v12;
LABEL_10:
  id v13 = (id)v7;
  [(id)a1 setActiveTabDocument:v7];
  id v9 = [*(id *)(a1 + 72) tabOverview];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 dismissWithAddTabAnimation];
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 72) tabThumbnailCollectionView];
    [v11 dismissAnimated:1];
  }
}

- (void)_openBlankTabDocumentInTabBarWithOptions:(id *)a1
{
  if (a1)
  {
    [a1[9] beginFixingTabBarItems];
    int v4 = -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:](a1, a2, 1, 0);
    [a1 setActiveTabDocument:v4];

    [a1[9] endFixingTabBarItems];
    id v5 = a1[9];
    id v6 = [a1 activeTabDocument];
    [v5 updateTabBarAnimated:1 keepingTabVisible:v6];
  }
}

- (void)openLibraryForType:(id)a3
{
  id v17 = a3;
  int v4 = [(TabController *)self activeTabDocument];
  id v5 = [v4 libraryType];
  char v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabThumbnailCollectionView];
    [v7 dismissAnimated:0];

    if (!self->_libraryTabs)
    {
      char v8 = [MEMORY[0x1E4F1CA60] dictionary];
      libraryTabs = self->_libraryTabs;
      self->_libraryTabs = v8;
    }
    if (!self->_activeLibraryTab)
    {
      uint64_t v10 = [(TabController *)self tabGroups];
      uint64_t v11 = [v10 firstObject];
      id v12 = [v11 uuid];
      [(TabController *)self setActiveTabGroupUUID:v12];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v14 = [(NSMutableDictionary *)self->_libraryTabs objectForKeyedSubscript:v17];

    if (!v14)
    {
      int64_t v15 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:]([TabDocument alloc], "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, 0, -[TabController _controlledByAutomation]((uint64_t)self), 0, 0, WeakRetained, 0);
      [(TabDocument *)v15 setIsBlank:1];
      [(TabDocument *)v15 setLibraryType:v17];
      [(NSMutableDictionary *)self->_libraryTabs setObject:v15 forKeyedSubscript:v17];
    }
    char v16 = [(NSMutableDictionary *)self->_libraryTabs objectForKeyedSubscript:v17];
    [(TabController *)self setActiveTabDocument:v16];

    [WeakRetained updateUnifiedBarVisibility];
  }
}

- (void)openTab:(id)a3 navigatedFromLibraryType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 setSuppressWebExtensionEvents:0];
  activeLibraryTab = self->_activeLibraryTab;
  self->_activeLibraryTab = 0;

  id v9 = [(TabController *)self activeNonLibraryTab];
  [(TabController *)self insertNewTabDocument:v7 forcingOrderAfterTabDocument:v9 inBackground:0 animated:0];

  [(NSMutableDictionary *)self->_libraryTabs setObject:0 forKeyedSubscript:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained updateUnifiedBarVisibility];
}

- (void)closeTab:(id)a3 animated:(BOOL)a4
{
  if (self) {
    -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, a3, a4, 1, 0, 1);
  }
}

- (void)closeTabWithURL:(id)a3 UUID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(TabController *)self tabWithUUID:v7];
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 url];
    if (objc_msgSend(v10, "safari_isSameAsURLRemovingFragment:", v6))
    {
      uint64_t v11 = [(TabController *)self currentTabs];
      int v12 = [v11 containsObject:v9];

      if (v12)
      {
        id v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = v13;
          int64_t v15 = [v7 UUIDString];
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = (uint64_t)v15;
          _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "Closing tab with UUID %{public}@", buf, 0xCu);
        }
        if (self) {
          -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v9, 1u, 0, 0, 1);
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
  }
  char v16 = [(TabController *)self activeTabGroup];
  char v17 = [v16 isLocal];

  if ((v17 & 1) == 0)
  {
    id v18 = [(TabController *)self windowState];
    id v19 = [v18 localTabGroup];

    int64_t v20 = [v19 tabs];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __38__TabController_closeTabWithURL_UUID___block_invoke;
    v29[3] = &unk_1E6D7C460;
    id v30 = v7;
    id v31 = v6;
    uint64_t v21 = objc_msgSend(v20, "safari_filterObjectsUsingBlock:", v29);

    uint64_t v22 = [v21 count];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v33 = v23;
        _os_log_impl(&dword_1E102C000, v24, OS_LOG_TYPE_DEFAULT, "Closing %zu tabs in local tab group", buf, 0xCu);
      }
      tabGroupManager = self->_tabGroupManager;
      uint64_t v26 = [v19 uuid];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __38__TabController_closeTabWithURL_UUID___block_invoke_78;
      v27[3] = &unk_1E6D7C290;
      id v28 = v21;
      [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v26 persist:1 usingBlock:v27];
    }
  }
LABEL_15:
}

uint64_t __38__TabController_closeTabWithURL_UUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 uuid];
  id v5 = [*(id *)(a1 + 32) UUIDString];
  if ([v4 isEqualToString:v5])
  {
    id v6 = [v3 syncableURL];
    uint64_t v7 = objc_msgSend(v6, "safari_isSameAsURLRemovingFragment:", *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __38__TabController_closeTabWithURL_UUID___block_invoke_78(uint64_t a1, void *a2)
{
  return [a2 deleteTabs:*(void *)(a1 + 32)];
}

- (void)closeTabs:(id)a3 inInactiveTabGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(TabController *)self isTabGroupActive:v7])
  {
    tabGroupManager = self->_tabGroupManager;
    id v9 = [v7 uuid];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __46__TabController_closeTabs_inInactiveTabGroup___block_invoke;
    id v14 = &unk_1E6D7C488;
    id v15 = v6;
    char v16 = self;
    [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v9 persist:1 usingBlock:&v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 0, v11, v12, v13, v14);
  }
}

void __46__TabController_closeTabs_inInactiveTabGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 deleteTabs:*(void *)(a1 + 32)];
  if ([v3 usesGlobalPinnedTabs])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "isPinned", (void)v12))
          {
            uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 280);
            uint64_t v11 = [v9 uuid];
            [v10 removeTabWithUUID:v11 persist:1];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)_detachTab:(unsigned int)a3 animated:
{
  id v8 = a2;
  if (a1)
  {
    uint64_t v5 = [a1 currentTabs];
    char v6 = [v5 containsObject:v8];

    if (v6)
    {
      -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)a1, v8, a3, 0, 1, 0);
      [v8 resetTabViewItems];
    }
    else
    {
      uint64_t v7 = -[TabController mutableAlternateTabs]((char *)a1);
      [v7 removeObject:v8];
    }
  }
}

- (void)_closeTab:(unsigned int)a3 animated:(int)a4 allowAddingToRecentlyClosedTabs:(char)a5 keepWebViewAlive:(int)a6 showAutoCloseTabsAlert:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      v14[0] = a2;
      uint64_t v11 = (void *)MEMORY[0x1E4F1C978];
      id v12 = a2;
      long long v13 = [v11 arrayWithObjects:v14 count:1];

      -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:](a1, v13, a3, a4, a5, a6);
    }
  }
}

- (void)_detachTabs:(id *)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 currentTabs];
    uint64_t v5 = [v3 firstObject];
    char v6 = [v4 containsObject:v5];

    if (v6)
    {
      uint64_t v7 = -[TabController mutableCurrentTabs]((char *)a1);
      [v7 removeObjectsInArray:v3];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v8 = a1[13];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v25 + 1) + 8 * v12);
            if (objc_opt_respondsToSelector()) {
              [v13 tabController:a1 didCloseTabDocuments:v3];
            }
            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v10);
      }

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = v3;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18++), "resetTabViewItems", (void)v21);
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v16);
      }

      id v19 = [a1[9] tabThumbnailCollectionView];
      [v19 setItemToActivate:0];

      [a1[9] updateTabBarAnimated:0];
    }
    else
    {
      int64_t v20 = -[TabController mutableAlternateTabs]((char *)a1);
      [v20 removeObjectsInArray:v3];
    }
  }
}

- (void)closeTabDocuments:(id)a3
{
}

- (void)closeTabs:(id)a3
{
}

- (void)closeTabs:(id)a3 animated:(BOOL)a4
{
}

- (void)closeTabs:(id)a3 animated:(BOOL)a4 allowAddingToRecentlyClosedTabs:(BOOL)a5 showAutoCloseTabsAlert:(BOOL)a6
{
}

- (void)_sendEventsForAutoFillTelemetryForClosingTabs:(uint64_t)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v9 sendEventsForAutoFillTelemetry];
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

- (void)_addTabsToRecentlyClosed:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v12 = objc_msgSend(v11, "tabStateData", (void)v14);
          if (([v11 isBlank] & 1) == 0) {
            [v4 addObject:v12];
          }
          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    long long v13 = [MEMORY[0x1E4F78550] sharedBrowserSavedState];
    [v13 addRecentlyClosedTabs:v4];

    -[TabController _registerUndoActionsForClosedTabs:](a1, v5);
  }
}

uint64_t __109__TabController__closeTabs_animated_allowAddingToRecentlyClosedTabs_keepWebViewAlive_showAutoCloseTabsAlert___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

- (void)_presentAutomaticTabClosingPromptIfNeededForClosedTabCount:(uint64_t)a1
{
  if (!a1
    || ([MEMORY[0x1E4F98998] userHasPreferenceForAutomaticTabClosingInterval] & 1) != 0
    || ([(id)a1 isControlledByAutomation] & 1) != 0)
  {
    return;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__TabController__presentAutomaticTabClosingPromptIfNeededForClosedTabCount___block_invoke;
  v10[3] = &unk_1E6D77E20;
  void v10[4] = a1;
  id v4 = (void (**)(void))MEMORY[0x1E4E42950](v10);
  uint64_t v5 = [*(id *)(a1 + 72) tabThumbnailCollectionView];
  if ([v5 presentationState] == 1)
  {

LABEL_7:
    unint64_t v7 = *(void *)(a1 + 160) + a2;
    *(void *)(a1 + 160) = v7;
    goto LABEL_9;
  }
  uint64_t v6 = [v5 presentationState];

  if (v6 == 2) {
    goto LABEL_7;
  }
  unint64_t v7 = *(void *)(a1 + 160);
LABEL_9:
  if (v7 > 9) {
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)(a1 + 152);
  if (!v8)
  {
    -[TabController _createVeryRecentlyClosedTabCountInvalidationTimer](a1);
    uint64_t v8 = *(void *)(a1 + 152);
  }
  unint64_t v9 = v8 + a2;
  *(void *)(a1 + 152) = v9;
  if (v9 >= 6) {
LABEL_13:
  }
    v4[2](v4);
}

- (void)_registerUndoActionsForClosedTabs:(uint64_t)a1
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 144);
    if (!v4)
    {
LABEL_5:
      -[TabController _registerSingleUndoActionForClosedTabs:]((id *)a1, v3);
      goto LABEL_14;
    }
    uint64_t v5 = [v4 type];
    if (v5 == 1)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v6 = v3;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v16 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
            long long v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v16, 1, (void)v12);
            -[TabController _registerSingleUndoActionForClosedTabs:]((id *)a1, v11);

            ++v10;
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        }
        while (v8);
      }
    }
    else if (!v5)
    {
      goto LABEL_5;
    }
  }
LABEL_14:
}

uint64_t __76__TabController__presentAutomaticTabClosingPromptIfNeededForClosedTabCount___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained presentAutomaticTabClosingAlertController];

  uint64_t result = [*(id *)(a1 + 32) _cancelVeryRecentlyClosedTabCountInvalidationTimer];
  *(void *)(*(void *)(a1 + 32) + 160) = 0;
  return result;
}

- (void)closeTab
{
  id v3 = [(TabController *)self activeTabDocument];
  [(TabController *)self closeTab:v3 animated:1];
}

- (void)closeOtherTabs
{
  id v3 = [(TabController *)self currentTabs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__TabController_closeOtherTabs__block_invoke;
  v9[3] = &unk_1E6D78C60;
  v9[4] = self;
  id v4 = objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v9);

  uint64_t v5 = _WBSLocalizedString();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__TabController_closeOtherTabs__block_invoke_2;
  v7[3] = &unk_1E6D77D90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(TabController *)self registerUndoWithName:v5 actions:v7];
}

BOOL __31__TabController_closeOtherTabs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPinned])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) activeTabDocument];
    BOOL v4 = v5 != v3;
  }
  return v4;
}

void __31__TabController_closeOtherTabs__block_invoke_2(uint64_t a1)
{
}

- (void)closeAllOpenTabsAnimated:(BOOL)a3
{
  id v5 = [(TabController *)self unpinnedTabs];
  id v6 = -[TabController _undoCloseAllTabsActionName](self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__TabController_closeAllOpenTabsAnimated___block_invoke;
  v8[3] = &unk_1E6D780C8;
  void v8[4] = self;
  id v9 = v5;
  BOOL v10 = a3;
  id v7 = v5;
  [(TabController *)self registerUndoWithName:v6 actions:v8];
}

- (id)_undoCloseAllTabsActionName
{
  if (a1)
  {
    [a1 numberOfCurrentNonHiddenTabs];
    a1 = _WBSLocalizedString();
    uint64_t v1 = vars8;
  }
  return a1;
}

void __42__TabController_closeAllOpenTabsAnimated___block_invoke(uint64_t a1)
{
}

- (void)togglePinningTab:(id)a3 inInactiveTabGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 isPinned];
  pinnedTabsManager = self->_pinnedTabsManager;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  long long v17 = __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke;
  uint64_t v18 = &unk_1E6D7C4D8;
  uint64_t v19 = self;
  id v20 = v7;
  id v21 = v6;
  char v22 = v8 ^ 1;
  id v10 = v6;
  id v11 = v7;
  [(PinnedTabsManager *)pinnedTabsManager performUpdatesUsingBlock:&v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  long long v13 = objc_msgSend(WeakRetained, "libraryController", v15, v16, v17, v18, v19);
  long long v14 = [v13 sidebarViewController];
  [v14 reloadSectionControllersIfNeeded];
}

void __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [*(id *)(a1 + 40) uuid];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke_2;
  v6[3] = &unk_1E6D7C4B0;
  id v4 = *(id *)(a1 + 48);
  char v9 = *(unsigned char *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 updateTabsInTabGroupWithUUID:v3 persist:1 usingBlock:v6];
}

void __53__TabController_togglePinningTab_inInactiveTabGroup___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) uuid];
  id v4 = [v11 mutableTabWithUUID:v3];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[*(id *)(a1 + 32) mutableCopy];
  }
  id v7 = v6;

  objc_msgSend(v7, "setSyncable:", objc_msgSend(v11, "isSyncable"));
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  char v9 = [v7 title];
  id v10 = [v7 url];
  [v7 setPinned:v8 title:v9 url:v10];

  -[TabController _tabGroupTabDidUpdatePinned:inTabGroup:](*(id **)(a1 + 40), v7, v11);
}

- (void)_tabGroupTabDidUpdatePinned:(void *)a3 inTabGroup:
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if ([v6 usesGlobalPinnedTabs])
    {
      if ([v5 isPinned])
      {
        if ([v5 isSyncable])
        {
          v22[0] = v5;
          uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
          [v7 deleteTabs:v8];

          [a1[6] flushDeletedTabsInTabGroup:v7];
          id v9 = objc_alloc(MEMORY[0x1E4FB6078]);
          id v10 = [v5 uuid];
          id v11 = [v5 deviceIdentifier];
          id v12 = (id)[v9 initWithUUID:v10 deviceIdentifier:v11];

          [v12 adoptAttributesFromTab:v5];
        }
        else
        {
          [v7 removeTab:v5];
          id v12 = v5;
        }
        id v20 = a1[35];
        uint64_t v19 = -[TabController _containerForPinnedTabsInTabGroup:](a1, v7);
        [v20 appendTab:v12 inContainer:v19];
      }
      else
      {
        if (![v7 isSyncable])
        {
          [a1[35] moveTab:v5 toTabGroup:v7 afterTab:0];
          goto LABEL_15;
        }
        id v14 = objc_alloc(MEMORY[0x1E4FB6078]);
        uint64_t v15 = [v5 uuid];
        uint64_t v16 = [v5 deviceIdentifier];
        id v12 = (id)[v14 initWithUUID:v15 deviceIdentifier:v16];

        [v12 adoptAttributesFromTab:v5];
        id v17 = a1[35];
        uint64_t v18 = [v5 uuid];
        [v17 removeTabWithUUID:v18 persist:1];

        id v21 = v12;
        uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
        [v7 insertTabs:v19 afterTab:0];
      }
    }
    else
    {
      long long v13 = [v7 lastPinnedTabExcluding:v5];
      if ((WBSIsEqual() & 1) == 0) {
        [v7 reorderTab:v5 afterTab:v13];
      }
    }
  }
LABEL_15:
}

- (void)moveTab:(id)a3 overTab:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[TabController mutableCurrentTabs]((char *)self);
  uint64_t v9 = [v8 indexOfObject:v6];
  uint64_t v19 = v7;
  uint64_t v10 = [v8 indexOfObject:v7];
  [v8 removeObjectAtIndex:v9];
  [v8 insertObject:v6 atIndex:v10];
  [(TabCollectionViewManager *)self->_tabCollectionViewManager updateTabOverviewItems];
  [(TabCollectionViewManager *)self->_tabCollectionViewManager updateTabBarAnimated:1 keepingTabVisible:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = self->_documentObservers;
  uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 tabController:self didMoveTabDocument:v6 overTabDocument:v6];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained clearCachedTabCompletionData];

  [(TabController *)self didUpdateTabDocuments];
  uint64_t v18 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v18 reportTabUpdatedWithUpdateType:8];
}

- (id)switchToTabDocumentForWebClip:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uuid];
  if (v5)
  {
    [(TabController *)self setActiveProfileIdentifier:*MEMORY[0x1E4F980C8]];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    int v7 = [WeakRetained isPrivateBrowsingEnabled];

    if (v7) {
      [(TabController *)self selectLocalTabGroup];
    }
    uint64_t v8 = -[TabController _tabDocumentForWebClip:]((TabDocument *)self, v4);
    if (v8)
    {
      [(TabController *)self setActiveTabDocument:v8];
      id v9 = v8;
    }
    else
    {
      uint64_t v10 = [v5 UUIDString];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v11 = [(TabController *)self tabGroups];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        v40 = v4;
        char v41 = (TabDocument *)self;
        BOOL v38 = 0;
        uint64_t v39 = v5;
        long long v45 = 0;
        long long v46 = 0;
        uint64_t v14 = *(void *)v53;
        uint64_t v42 = *(void *)v53;
        int v43 = v11;
        do
        {
          uint64_t v15 = 0;
          uint64_t v44 = v13;
          do
          {
            if (*(void *)v53 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v52 + 1) + 8 * v15);
            if ((objc_msgSend(v16, "isPrivateBrowsing", v38, v39) & 1) == 0)
            {
              id v17 = [v16 tabs];
              if ([v16 isLocal])
              {
                uint64_t v18 = [(SFNavigationBarItem *)v41->_navigationBarItem pinnedTabs];
                if ([v18 count])
                {
                  uint64_t v19 = [v18 arrayByAddingObjectsFromArray:v17];

                  id v17 = (void *)v19;
                }
              }
              long long v50 = 0u;
              long long v51 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              id v20 = v17;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                long long v47 = v16;
                uint64_t v23 = *(void *)v49;
                while (2)
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v49 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                    long long v26 = [v25 localAttributes];
                    long long v27 = [v26 webClipIDString];
                    int v28 = [v27 isEqualToString:v10];

                    if (v28)
                    {
                      id v29 = objc_alloc(MEMORY[0x1E4F29128]);
                      id v30 = [v47 uuid];
                      uint64_t v31 = [v29 initWithUUIDString:v30];

                      id v32 = objc_alloc(MEMORY[0x1E4F29128]);
                      uint64_t v33 = [v25 uuidString];
                      uint64_t v34 = [v32 initWithUUIDString:v33];

                      long long v45 = (void *)v31;
                      long long v46 = (void *)v34;
                      goto LABEL_27;
                    }
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
                  if (v22) {
                    continue;
                  }
                  break;
                }
LABEL_27:
                uint64_t v14 = v42;
                id v11 = v43;
                uint64_t v13 = v44;
              }
            }
            ++v15;
          }
          while (v15 != v13);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v13);

        int v35 = v46;
        if (v46)
        {
          BOOL v36 = v45;
          [(TabDocument *)v41 switchToTabWithUUID:v46 inTabGroupWithUUID:v45];
          id v4 = v40;
          -[TabController _tabDocumentForWebClip:](v41, v40);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v8 = v38;
          id v5 = v39;
        }
        else
        {
          id v9 = 0;
          id v5 = v39;
          id v4 = v40;
          uint64_t v8 = v38;
          BOOL v36 = v45;
        }
      }
      else
      {

        int v35 = 0;
        BOOL v36 = 0;
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (TabDocument)_tabDocumentForWebClip:(TabDocument *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 uuid];
    if ([v4 fullScreen])
    {
      id v6 = [(TabDocument *)a1 currentTabs];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40__TabController__tabDocumentForWebClip___block_invoke;
      v10[3] = &unk_1E6D78C60;
      id v11 = v5;
      int v7 = objc_msgSend(v6, "safari_firstObjectPassingTest:", v10);
    }
    else
    {
      uint64_t v8 = [v4 pageURL];
      int v7 = [(TabDocument *)a1 tabForURL:v8];
    }
    -[TabController _unhibernateTabIfNeeded:](a1, v7);
    a1 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t __40__TabController__tabDocumentForWebClip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 webClipID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)tabDocumentForURL:(id)a3
{
  return [(TabController *)self tabDocumentForURL:a3 forceUnhibernate:0];
}

- (id)tabDocumentForURL:(id)a3 forceUnhibernate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(TabController *)self tabForURL:a3];
  if (v4)
  {
    -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = 0;
    }
    id v7 = v8;
  }
  id v9 = v7;

  return v9;
}

- (id)tabForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    id v6 = [MEMORY[0x1E4FB1F10] webClipWithURL:v4];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 pageURL];
      id v9 = objc_msgSend(v8, "_webkit_URLByRemovingFragment");
    }
    else
    {
      id v9 = 0;
    }
    id v11 = objc_msgSend(v5, "_webkit_URLByRemovingFragment");

    uint64_t v12 = [(TabController *)self currentTabs];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __27__TabController_tabForURL___block_invoke;
    v16[3] = &unk_1E6D78230;
    id v17 = v11;
    id v18 = v9;
    id v13 = v9;
    id v14 = v11;
    uint64_t v10 = objc_msgSend(v12, "safari_firstObjectPassingTest:", v16);
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

uint64_t __27__TabController_tabForURL___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isReusableForURL:*(void *)(a1 + 32) webClipURL:*(void *)(a1 + 40)];
}

- (TabDocument)tabDocumentForSpotlightSearch
{
  id v2 = [(TabController *)self currentTabDocuments];
  id v3 = objc_msgSend(v2, "safari_firstObjectPassingTest:", &__block_literal_global_101);

  return (TabDocument *)v3;
}

uint64_t __46__TabController_tabDocumentForSpotlightSearch__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsReuseForSpotlightSearch];
}

- (uint64_t)_tabShouldBeHiddenFromWebExtensions:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && [v3 isPrivate])
  {
    id v5 = [a1 privateTabs];
    if ([v5 count] == 1 && objc_msgSend(v4, "isBlank")) {
      uint64_t v6 = [v4 isActive] ^ 1;
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

- (id)tabWithIDForWebExtensions:(double)a3
{
  id v5 = [(TabController *)self normalAndPrivateTabs];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__TabController_tabWithIDForWebExtensions___block_invoke;
  v10[3] = &__block_descriptor_40_e29_B16__0___CollectionViewTab__8l;
  *(double *)&void v10[4] = a3;
  uint64_t v6 = objc_msgSend(v5, "safari_firstObjectPassingTest:", v10);

  if (-[TabController _tabShouldBeHiddenFromWebExtensions:](self, v6)) {
    id v7 = 0;
  }
  else {
    id v7 = v6;
  }
  id v8 = v7;

  return v8;
}

BOOL __43__TabController_tabWithIDForWebExtensions___block_invoke(uint64_t a1, void *a2)
{
  [a2 idForWebExtensions];
  return v3 == *(double *)(a1 + 32);
}

- (id)duplicateTab:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v6 = [TabDocument alloc];
  id v7 = [v4 tabStateData];
  id v8 = [(TabDocument *)v6 initWithTabStateData:v7 hibernated:0 browserController:WeakRetained];

  if (v8)
  {
    if ([v4 isBlank]) {
      [(TabDocument *)v8 setIsBlank:1];
    }
    -[TabController insertTab:afterTab:inBackground:animated:](self, "insertTab:afterTab:inBackground:animated:", v8, v4, -[TabDocument isPrivateBrowsingEnabled](v8, "isPrivateBrowsingEnabled") ^ [WeakRetained isPrivateBrowsingEnabled], 1);
    id v9 = v8;
  }

  return v8;
}

- (void)sortTabsWithMode:(int64_t)a3
{
  id v5 = [(TabController *)self activeTabGroupUUID];
  [(TabController *)self sortTabsInTabGroupWithUUIDString:v5 withSortMode:a3];
}

- (void)sortTabsInTabGroupWithUUIDString:(id)a3 withSortMode:(int64_t)a4
{
  tabGroupManager = self->_tabGroupManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke;
  v7[3] = &__block_descriptor_40_e27_v16__0__WBMutableTabGroup_8l;
  void v7[4] = a4;
  [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:a3 persist:1 usingBlock:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained reloadSidebarAnimated:1];
}

void __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 tabs];
  id v5 = (void *)[v4 mutableCopy];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke_2;
  v6[3] = &__block_descriptor_40_e39_q24__0__WBMutableTab_8__WBMutableTab_16l;
  void v6[4] = *(void *)(a1 + 32);
  [v5 sortWithOptions:16 usingComparator:v6];
  [v3 setTabs:v5];
}

uint64_t __63__TabController_sortTabsInTabGroupWithUUIDString_withSortMode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8 == 1)
  {
    id v11 = [v6 url];
    uint64_t v12 = [v11 host];
    uint64_t v9 = objc_msgSend(v12, "safari_highLevelDomainFromHost");

    id v13 = [v7 url];
    id v14 = [v13 host];
    uint64_t v10 = objc_msgSend(v14, "safari_highLevelDomainFromHost");

    if (!v9 && v10)
    {
      uint64_t v3 = 1;
      goto LABEL_13;
    }
    if (v9 && !v10)
    {
      uint64_t v3 = -1;
      goto LABEL_13;
    }
    if (!(v9 | v10))
    {
      uint64_t v3 = 0;
      goto LABEL_13;
    }
LABEL_4:
    uint64_t v3 = [(id)v9 localizedStandardCompare:v10];
LABEL_13:

    goto LABEL_14;
  }
  if (!v8)
  {
    uint64_t v9 = [v6 title];
    uint64_t v10 = [v7 title];
    goto LABEL_4;
  }
LABEL_14:

  return v3;
}

- (void)replaceBlankActiveTabWithTab:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self activeTabDocument];
  if (([v5 isBlank] & 1) != 0
    || ([(TabController *)self currentTabs],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7 != 1))
  {
    uint64_t v8 = (void *)MEMORY[0x1E4FB1EB0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__TabController_replaceBlankActiveTabWithTab___block_invoke;
    v9[3] = &unk_1E6D78980;
    id v10 = v4;
    id v11 = self;
    id v12 = v5;
    [v8 performWithoutAnimation:v9];
  }
}

void __46__TabController_replaceBlankActiveTabWithTab___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) browserController];
  id v2 = *(id **)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) wbTab];
  id v4 = -[TabController _dropWBTab:fromBrowserController:atIndex:pinned:anchorTab:](v2, v3, v6, 0, 0, 0);

  [*(id *)(a1 + 40) closeTab:*(void *)(a1 + 48) animated:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  [WeakRetained updateFavoritesForNewDocument];
}

- (id)_dropWBTab:(void *)a3 fromBrowserController:(unint64_t)a4 atIndex:(int)a5 pinned:(void *)a6 anchorTab:
{
  v94[1] = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v79 = a6;
  if (a1)
  {
    unint64_t v77 = a4;
    id v13 = [v12 tabController];
    id v14 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v15 = [v11 uuid];
    uint64_t v16 = (void *)[v14 initWithUUIDString:v15];
    uint64_t v17 = [v13 tabWithUUID:v16];

    unsigned int v76 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    if (([v11 canSetPinned] & 1) == 0) {
      a5 = [v11 isPinned];
    }
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke;
    v90[3] = &__block_descriptor_33_e22_v16__0__WBMutableTab_8l;
    char v91 = a5;
    id v82 = (void *)MEMORY[0x1E4E42950](v90);
    id v18 = [v11 tabGroupUUID];
    uint64_t v19 = -[TabController _foreignLocalTabGroupWithUUID:](a1, v18);

    id v20 = [a1 activeTabGroup];
    uint64_t v21 = v20;
    if (a5 && ([v20 usesGlobalPinnedTabs] & 1) != 0) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v21;
    }
    id v23 = v22;
    int v81 = (void *)v17;
    char v78 = v21;
    long long v24 = v12;
    if ([v19 isEqual:v23])
    {
      LOBYTE(v25) = 1;
    }
    else if ([v19 isSyncable])
    {
      LOBYTE(v25) = 0;
    }
    else
    {
      int v25 = [v23 isSyncable] ^ 1;
    }
    long long v26 = [v19 profileIdentifier];
    long long v27 = [v23 profileIdentifier];
    char v28 = WBSIsEqual();

    uint64_t v80 = v19;
    if ((v19 != 0) == (v23 != 0))
    {
      id v29 = v81;
      if (v81) {
        char v35 = v25;
      }
      else {
        char v35 = 0;
      }
      if (v35)
      {
        id v12 = v24;
        BOOL v36 = [v24 tabController];

        if (v36 == a1)
        {
          long long v48 = [a1 currentTabs];
          uint64_t v49 = [v48 indexOfObject:v81];

          uint64_t v34 = v79;
          if (v49 == 0x7FFFFFFFFFFFFFFFLL)
          {
            -[TabController _insertTab:atIndex:inBackground:animated:updateUI:]((uint64_t)a1, v81, v77, 1, v76, 1);
            if (!v23) {
              goto LABEL_39;
            }
          }
          else
          {
            v74 = [a1 currentTabs];
            v75 = objc_msgSend(v74, "objectAtIndexedSubscript:", (void)((__PAIR128__(v77, v49) - v77) >> 64));
            [a1 moveTab:v81 overTab:v75];

            if (!v23) {
              goto LABEL_39;
            }
          }
        }
        else
        {
          int v37 = [v24 tabController];
          -[TabController _detachTab:animated:](v37, v81, v76);

          id WeakRetained = objc_loadWeakRetained(a1 + 1);
          [v81 setBrowserController:WeakRetained];

          -[TabController _insertTab:atIndex:inBackground:animated:updateUI:]((uint64_t)a1, v81, v77, 1, v76, 1);
          uint64_t v34 = v79;
          if (!v23) {
            goto LABEL_39;
          }
        }
      }
      else
      {
        id v12 = v24;
        if (v77)
        {
          long long v45 = [a1 currentTabs];
          long long v46 = [v45 objectAtIndexedSubscript:v77 - 1];
          long long v47 = [v46 wbTab];
        }
        else
        {
          long long v47 = 0;
        }
        uint64_t v34 = v79;
        id v93 = v11;
        long long v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
        -[TabController updateLastSelectedTabUUIDForClosingWBTabs:]((uint64_t)a1, v50);

        if ((v28 & 1) == 0)
        {
          long long v51 = +[WBReusableTabManager sharedManager];
          id v52 = objc_alloc(MEMORY[0x1E4F29128]);
          long long v53 = [v11 uuid];
          long long v54 = (void *)[v52 initWithUUIDString:v53];
          [v51 removeReusableTabWithUUID:v54];
        }
        id v55 = a1[6];
        id v92 = v11;
        uint64_t v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
        [v55 moveTabs:v56 toTabGroup:v23 afterTab:v47 withoutPersistingTabGroupsWithUUIDStrings:0];

        uint64_t v57 = [MEMORY[0x1E4F97E48] sharedLogger];
        [v57 reportTabUpdatedWithUpdateType:8];

        id v29 = v81;
        if (!v23) {
          goto LABEL_39;
        }
      }
    }
    else
    {
      id v29 = v81;
      if (!v23 && ((a5 ^ 1) & 1) == 0)
      {
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_2;
        v85[3] = &unk_1E6D7C5F8;
        v85[4] = a1;
        id v30 = v11;
        id v86 = v30;
        id v87 = v81;
        id v88 = v82;
        unint64_t v89 = v77;
        uint64_t v31 = (void *)MEMORY[0x1E4E42950](v85);
        [a1[35] updatePinnedTabsInContainer:a1 usingBlock:v31];
        id v32 = a1[6];
        uint64_t v33 = [v80 uuid];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_4;
        v83[3] = &unk_1E6D7C290;
        id v84 = v30;
        [v32 updateTabsInTabGroupWithUUID:v33 persist:1 usingBlock:v83];

        id v12 = v24;
        uint64_t v34 = v79;
LABEL_39:
        id v66 = objc_alloc(MEMORY[0x1E4F29128]);
        id v67 = [v11 uuid];
        v68 = (void *)[v66 initWithUUIDString:v67];

        uint64_t v69 = [a1[15] objectForKeyedSubscript:v68];
        int v70 = (void *)v69;
        if (v69) {
          uint64_t v71 = (void *)v69;
        }
        else {
          uint64_t v71 = v68;
        }
        uint64_t v72 = [a1 tabWithUUID:v71];

        goto LABEL_43;
      }
      id v12 = v24;
      uint64_t v34 = v79;
      if (!v23) {
        goto LABEL_39;
      }
      id v39 = a1[6];
      v94[0] = v11;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:1];
      char v41 = [v79 wbTab];
      [v39 moveTabs:v40 toTabGroup:v23 afterTab:v41 withoutPersistingTabGroupsWithUUIDStrings:0];

      id v42 = a1[35];
      int v43 = [v11 uuid];
      objc_msgSend(v42, "removeTabWithUUID:persist:", v43, objc_msgSend(v23, "isSyncable"));

      uint64_t v44 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v44 reportTabUpdatedWithUpdateType:8];
    }
    id v58 = a1[15];
    id v59 = objc_alloc(MEMORY[0x1E4F29128]);
    uint64_t v60 = [v11 uuid];
    uint64_t v61 = (void *)[v59 initWithUUIDString:v60];
    uint64_t v62 = [v58 objectForKeyedSubscript:v61];
    v63 = [v62 UUIDString];

    if (v63)
    {
      id v64 = v63;
    }
    else
    {
      id v64 = [v11 uuid];
    }
    id v65 = v64;
    [a1[6] updateTabWithUUID:v64 persist:0 notify:1 usingBlock:v82];

    goto LABEL_39;
  }
  uint64_t v72 = 0;
  uint64_t v34 = v79;
LABEL_43:

  return v72;
}

- (void)replaceTabDocument:(id)a3 withTabDocument:(id)a4
{
}

- (void)replaceTabDocument:(id)a3 withTabDocument:(id)a4 committingSpeculativeLoad:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 isPrivateBrowsingEnabled];
  if (v5)
  {
    id v11 = [v8 tabGroupTab];
    [v9 setTabGroupTab:v11];
  }
  [v8 willClose];
  id v12 = -[TabController _mutableTabsForPrivateBrowsing:]((char *)self, v10);
  uint64_t v13 = [v12 indexOfObject:v8];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v14 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138478339;
      id v34 = v8;
      __int16 v35 = 2113;
      id v36 = v9;
      __int16 v37 = 2113;
      BOOL v38 = v12;
      _os_log_fault_impl(&dword_1E102C000, v14, OS_LOG_TYPE_FAULT, "Failed to find old tab document %{private}@ in all tab documents %{private}@ to be replaced with new tab document %{private}@, inserting with default ordering instead", buf, 0x20u);
    }
    [(TabController *)self insertNewTabDocumentWithDefaultOrdering:v9 inBackground:0 animated:1];
  }
  else
  {
    uint64_t v15 = v13;
    int v26 = v10;
    [(TabController *)self willLoseOwnershipOfTab:v8];
    BOOL v27 = v5;
    if (v5)
    {
      uint64_t v16 = [v8 uuid];
      [v9 setUuid:v16];
    }
    [v12 replaceObjectAtIndex:v15 withObject:v9];
    [v9 didReplaceTabDocument:v8];
    uint64_t v17 = [v8 webExtensionsController];
    [v17 didReplaceTab:v8 newTab:v9];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = self->_documentObservers;
    uint64_t v19 = [(NSHashTable *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v23 tabController:self didReplaceTabDocument:v8 withTabDocument:v9];
          }
        }
        uint64_t v20 = [(NSHashTable *)v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v20);
    }

    if (v27) {
      ++self->_updateTabsSuppressionCount;
    }
    -[TabController _activeTabDocumentForPrivateBrowsing:]((char *)self, v26);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    if (v24 == v8)
    {
      if (v26 == [(TabController *)self isPrivateBrowsingEnabled]) {
        [(TabController *)self setActiveTabDocument:v9];
      }
      else {
        -[TabController _setActiveTabDocument:](self, v9);
      }
    }
    if (v27) {
      --self->_updateTabsSuppressionCount;
    }
    [(TabController *)self didUpdateTabDocuments];
    [(TabCollectionViewManager *)self->_tabCollectionViewManager updateTabOverviewItems];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained clearCachedTabCompletionData];
  }
}

void __47__TabController__replaceTabs_withTabs_persist___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) webExtensionsController];
  [v2 didOpenTab:*(void *)(a1 + 32)];
}

uint64_t __47__TabController__replaceTabs_withTabs_persist___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didCloseTab:*(void *)(a1 + 40) windowIsClosing:0];
}

- (id)_firstUnpinnedTab
{
  if (a1)
  {
    uint64_t v1 = [a1 currentTabs];
    id v2 = objc_msgSend(v1, "safari_firstObjectPassingTest:", &__block_literal_global_512);
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)updateWBTabWithTab:(id)a3 notify:(BOOL)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (self->_activeTabGroupUUID && !self->_updateTabsSuppressionCount)
  {
    id v15 = v8;
    if ([v8 isPinned]
      && ([(TabController *)self activeTabGroup],
          id v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 usesGlobalPinnedTabs],
          v9,
          v10))
    {
      pinnedTabsManager = self->_pinnedTabsManager;
      id v12 = [v15 uuidString];
      uint64_t v13 = [v15 tabUpdateBlock];
      [(PinnedTabsManager *)pinnedTabsManager updatePinnedTabWithUUID:v12 inContainer:self usingBlock:v13];
    }
    else
    {
      tabGroupManager = self->_tabGroupManager;
      id v12 = [v15 uuidString];
      uint64_t v13 = [v15 tabUpdateBlock];
      [(WBTabGroupManager *)tabGroupManager updateTabWithUUID:v12 persist:v5 notify:v6 usingBlock:v13];
    }

    if (v5)
    {
      [(TabController *)self persistTab:v15 notify:v6];
      [(TabController *)self updateActiveTab];
    }
    [(TabController *)self updateLocalTabGroupTitle];
    id v8 = v15;
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TabController;
  [(TabController *)&v4 dealloc];
}

- (void)clearBrowserController
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(TabCollectionViewManager *)self->_tabCollectionViewManager clearSnapshotCache];
  objc_storeWeak((id *)&self->_browserController, 0);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(TabController *)self normalAndPrivateTabs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearBrowserController];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(WBTabGroupManager *)self->_tabGroupManager removeTabGroupObserver:self];
  [(PinnedTabsManager *)self->_pinnedTabsManager removePinnedTabsObserver:self];
}

- (BOOL)isControlledByAutomation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v3 = [WeakRetained isControlledByAutomation];

  return v3;
}

- (void)setPrivateBrowsingMode:(int64_t)a3
{
}

- (BOOL)isPrivateBrowsingAndLocked
{
  BOOL v3 = [(TabController *)self isPrivateBrowsingEnabled];
  if (v3)
  {
    uint64_t v4 = -[TabController _application](self);
    char v5 = [v4 isPrivateBrowsingLocked];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)updateLockedBrowsingState
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(TabController *)self privateTabDocuments];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) updateLockedBrowsingState];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (uint64_t)_performWithFixedTabBarItems:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void **)(result + 72);
    uint64_t v4 = a2;
    [v3 beginFixingTabBarItems];
    v4[2](v4);

    uint64_t v5 = *(void **)(v2 + 72);
    return [v5 endFixingTabBarItems];
  }
  return result;
}

- (void)insertTabDocumentFromTabStateData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [TabDocument alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  long long v11 = [(TabDocument *)v5 initWithTabStateData:v4 hibernated:0 browserController:WeakRetained];

  long long v7 = [(TabController *)self activeTabDocument];
  if ([v7 isBlank])
  {
    [(TabCollectionViewManager *)self->_tabCollectionViewManager beginFixingTabBarItems];
    long long v8 = [(TabController *)self activeTabDocument];
    [(TabController *)self insertTab:v11 afterTab:v8 inBackground:0 animated:1];

    -[TabController _closeTab:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v7, 0, 0, 0, 1);
    [(TabCollectionViewManager *)self->_tabCollectionViewManager endFixingTabBarItems];
    [(TabCollectionViewManager *)self->_tabCollectionViewManager updateTabBarAnimated:0];
  }
  else
  {
    [(TabController *)self insertTab:v11 afterTab:0 inBackground:0 animated:0];
  }
  long long v9 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  long long v10 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabOverview];
  objc_msgSend(v9, "dismissAnimated:", objc_msgSend(v10, "presentationState") != 0);
}

- (void)restoreEducationDeviceTabs
{
}

- (void)updateEducationTabsLastSyncDate
{
  if (self->_didRestoreCloudTabsForEducationDevice)
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = [(TabController *)self cloudTabStore];
    id v4 = [v3 currentDevice];
    uint64_t v5 = [v4 lastModified];
    [v6 setObject:v5 forKey:@"SafariEducationModeEducationTabsLastSyncDate"];

    [v6 synchronize];
  }
}

- (void)addBookmarkFolderForTabs:(id)a3
{
  p_browserController = &self->_browserController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained addBookmarkFolderForTabs:v4];
}

- (id)dropTabsAtIndex:(unint64_t)a3 pinned:(BOOL)a4 dropSession:(id)a5 dragItems:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  [(TabCollectionViewManager *)self->_tabCollectionViewManager dismissTabHoverPreview];
  uint64_t v13 = +[TabDocumentManager sharedManager];
  [v13 beginSuppressingTabRecycling];

  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  originalToReplacementUUIDMap = self->_originalToReplacementUUIDMap;
  self->_originalToReplacementUUIDMap = v14;

  uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v17 = 0;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(TabController *)self currentTabs];
    uint64_t v17 = [v6 objectAtIndexedSubscript:a3 - 1];
  }
  id v18 = v17;
  if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
  }
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke;
  v35[3] = &unk_1E6D7C560;
  v35[4] = self;
  unint64_t v39 = a3;
  BOOL v40 = a4;
  id v20 = v18;
  id v36 = v20;
  id v21 = v19;
  id v37 = v21;
  id v22 = v16;
  id v38 = v22;
  [v12 enumerateObjectsWithOptions:2 usingBlock:v35];
  if ([v21 count])
  {
    id v23 = [MEMORY[0x1E4F78598] builder];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    long long v31 = __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_2;
    id v32 = &unk_1E6D7C5B0;
    id v33 = v12;
    id v34 = v21;
    [v23 buildNavigationIntentForDropSession:v11 completionHandler:&v29];
  }
  id v24 = +[TabDocumentManager sharedManager];
  [v24 endSuppressingTabRecycling];

  [(TabController *)self didUpdateTabDocuments];
  [(TabCollectionViewManager *)self->_tabCollectionViewManager updateTabOverviewItems];
  int v25 = self->_originalToReplacementUUIDMap;
  self->_originalToReplacementUUIDMap = 0;

  int v26 = v38;
  id v27 = v22;

  return v27;
}

void __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_msgSend(v5, "safari_localWBTab");
  long long v7 = objc_msgSend(v5, "safari_localBrowserController");

  if (!v6
    || ((int v8 = [v6 isPrivateBrowsing],
         v8 == [*(id *)(a1 + 32) isPrivateBrowsingEnabled])
      ? (BOOL v9 = v7 == 0)
      : (BOOL v9 = 1),
        v9))
  {
    -[TabController _openTabForDroppedLinkAtIndex:pinned:](*(id **)(a1 + 32), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    long long v10 = *(void **)(a1 + 48);
    id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    [v10 setObject:v12 forKeyedSubscript:v11];
  }
  else
  {
    -[TabController _dropWBTab:fromBrowserController:atIndex:pinned:anchorTab:](*(id **)(a1 + 32), v6, v7, *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(void **)(a1 + 40));
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  [*(id *)(a1 + 56) insertObject:v12 atIndex:0];
}

- (TabDocument)_openTabForDroppedLinkAtIndex:(uint64_t)a3 pinned:
{
  if (a1)
  {
    unsigned int v6 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
    id v7 = a1[4];
    if (v7
      && (int v8 = [v7 isPrivateBrowsingEnabled],
          v8 == [a1 isPrivateBrowsingEnabled]))
    {
      id v11 = (TabDocument *)a1[4];
      id v13 = a1[4];
      a1[4] = 0;

      if ([(TabDocument *)v11 canSetPinned]) {
        [a1 setTab:v11 isPinned:a3];
      }
    }
    else
    {
      BOOL v9 = [TabDocument alloc];
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      id v11 = [(TabDocument *)v9 initWithBrowserController:WeakRetained];

      if ([(TabDocument *)v11 canSetPinned]) {
        [(TabDocument *)v11 setPinned:a3];
      }
      -[TabController _insertTab:atIndex:inBackground:animated:updateUI:]((uint64_t)a1, v11, a2, 1, v6, 1);
    }
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

void __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if ([v3 type] == 11)
    {
      id v5 = [v4 navigationIntents];
    }
    else
    {
      v11[0] = v4;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    unsigned int v6 = v5;
    uint64_t v7 = [v5 count];
    if (v7 == [*(id *)(a1 + 32) count])
    {
      int v8 = *(void **)(a1 + 40);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_3;
      v9[3] = &unk_1E6D7C588;
      id v10 = v6;
      [v8 enumerateKeysAndObjectsUsingBlock:v9];
    }
  }
}

void __62__TabController_dropTabsAtIndex_pinned_dropSession_dragItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(a2, "unsignedIntegerValue"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleNavigationIntent:v6 completion:0];
}

void __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    id v4 = [v3 pinnedTitle];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [v12 title];
    }
    uint64_t v7 = v6;

    id v3 = v12;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (*(unsigned char *)(a1 + 32))
  {
    int v8 = [v3 pinnedURL];
    BOOL v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [v12 url];
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  [v12 setPinned:*(unsigned __int8 *)(a1 + 32) title:v7 url:v11];
}

- (id)_foreignLocalTabGroupWithUUID:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = -[TabController _tabGroupsFromAllWindows](a1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__TabController__foreignLocalTabGroupWithUUID___block_invoke;
    v6[3] = &unk_1E6D7C3C0;
    id v7 = v3;
    objc_msgSend(v4, "safari_firstObjectPassingTest:", v6);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) pinnedTabs];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_3;
  v17[3] = &unk_1E6D7C328;
  id v5 = v3;
  id v18 = v5;
  id v6 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v17);
  id v7 = (void *)[v6 mutableCopy];

  if ([*(id *)(a1 + 40) isSyncable])
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB6078]);
    BOOL v9 = [*(id *)(a1 + 40) deviceIdentifier];
    id v10 = (void *)[v8 initWithUUID:0 deviceIdentifier:v9];

    [v10 adoptAttributesFromTab:*(void *)(a1 + 40)];
    id v11 = *(void **)(a1 + 32);
    uint64_t v12 = v11[6];
    id v13 = [*(id *)(a1 + 40) uuid];
    id v14 = [v10 uuid];
    [v11 tabGroupManager:v12 willReplaceTabWithUUID:v13 withTabWithUUID:v14];
  }
  else
  {
    id v10 = (void *)[*(id *)(a1 + 40) mutableCopy];
  }
  id v15 = [*(id *)(a1 + 48) tabUpdateBlock];
  ((void (**)(void, void *))v15)[2](v15, v10);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [v7 insertObject:v10 atIndex:*(void *)(a1 + 64)];

  return v7;
}

id __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 uuid];
  id v6 = [v5 UUIDString];
  id v7 = [v4 objectForKeyedSubscript:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = [v3 wbTab];
    id v9 = (id)[v10 mutableCopy];
  }
  id v11 = [v3 tabUpdateBlock];
  ((void (**)(void, id))v11)[2](v11, v9);

  return v9;
}

void __75__TabController__dropWBTab_fromBrowserController_atIndex_pinned_anchorTab___block_invoke_4(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isSyncable])
  {
    v5[0] = *(void *)(a1 + 32);
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
    [v3 deleteTabs:v4];
  }
  else
  {
    [v3 removeTab:*(void *)(a1 + 32)];
  }
}

- (void)updateLastSelectedTabUUIDForClosingWBTabs:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    id v4 = [v3 firstObject];
    id v5 = [v4 tabGroupUUID];

    id v6 = [*(id *)(a1 + 48) tabGroupWithUUID:v5];
    id v7 = [[TabGroupTabOrderProvider alloc] initWithTabGroup:v6];
    [*(id *)(a1 + 312) setTabOrderProvider:v7];
    id v8 = *(void **)(a1 + 312);
    id v9 = [(TabGroupTabOrderProvider *)v7 orderedTabsForTabs:v3];

    id v10 = [v8 tabToSelectBeforeClosingTabs:v9];
    id v11 = [v10 identifier];

    [*(id *)(a1 + 312) setTabOrderProvider:a1];
    if (v11)
    {
      uint64_t v12 = *(void **)(a1 + 48);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __59__TabController_updateLastSelectedTabUUIDForClosingWBTabs___block_invoke;
      v13[3] = &unk_1E6D7C290;
      id v14 = v11;
      [v12 updateTabGroupWithUUID:v5 persist:1 usingBlock:v13];
    }
  }
}

- (void)willLoseOwnershipOfTab:(id)a3
{
  id v9 = a3;
  uuidToTabMap = self->_uuidToTabMap;
  id v5 = [v9 uuid];
  [(NSMapTable *)uuidToTabMap removeObjectForKey:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    tabCollectionViewManager = self->_tabCollectionViewManager;
    id v7 = v9;
    [v7 removeRenderingProgressObserver:tabCollectionViewManager];
    id v8 = +[TabDocumentManager sharedManager];
    [v8 removeTab:v7];
  }
}

- (void)tabDocumentDidUpdateUUID:(id)a3 previousUUID:(id)a4
{
  id v7 = a3;
  if (a4) {
    [(NSMapTable *)self->_uuidToTabMap removeObjectForKey:a4];
  }
  id v6 = [v7 uuid];
  [(NSMapTable *)self->_uuidToTabMap setObject:v7 forKey:v6];
  [(TabCollectionViewManager *)self->_tabCollectionViewManager updateSnapshotIdentifiers];
}

- (void)_hibernateTab:(char *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v10 = v3;
    int v4 = [v3 isPrivateBrowsingEnabled];
    uint64_t v5 = 16;
    if (v4) {
      uint64_t v5 = 24;
    }
    id v6 = *(id *)&a1[v5];
    uint64_t v7 = [v6 indexOfObject:v10];
    [a1 willLoseOwnershipOfTab:v10];
    [v10 willClose];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = [[HibernatedTab alloc] initWithTabDocument:v10];
      [v6 replaceObjectAtIndex:v7 withObject:v8];
      id v9 = [v10 webExtensionsController];
      [v9 didReplaceTab:v10 newTab:v8];
    }
    id v3 = v10;
  }
}

uint64_t __74__TabController__prepareToMoveTabDocumentToWindow_createPlaceholderImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlaceholderImage:0];
}

- (void)_lockedPrivateBrowsingStateDidChange:(id)a3
{
  id v7 = [a3 object];
  -[TabController _application](self);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v4)
  {
    BOOL v5 = [(TabController *)self isPrivateBrowsingEnabled];

    if (v5)
    {
      tabCollectionViewManager = self->_tabCollectionViewManager;
      [(TabCollectionViewManager *)tabCollectionViewManager updateTabOverviewItems];
    }
  }
  else
  {
  }
}

- (void)_cancelPendingUpdateUserActivityTimer
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 80);
    if (v2)
    {
      [v2 invalidate];
      id v3 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0;
    }
  }
}

- (void)_updateUserActivityTimerFired
{
  -[TabController _cancelPendingUpdateUserActivityTimer]((uint64_t)self);
  normalActiveTabDocument = self->_normalActiveTabDocument;
  [normalActiveTabDocument updateUserActivity];
}

- (NSArray)tabsMatchingSearchTerm
{
  id v3 = -[TabController tabThumbnailCollectionView]((id *)&self->super.isa);
  if ([v3 presentationState])
  {
    id v4 = [v3 searchController];
    BOOL v5 = [v4 itemsMatchingSearchTerm];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__TabController_tabsMatchingSearchTerm__block_invoke;
    v8[3] = &unk_1E6D7C620;
    void v8[4] = self;
    id v6 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v8);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v6;
}

id __39__TabController_tabsMatchingSearchTerm__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUID];
  id v4 = [v2 tabWithUUID:v3];

  return v4;
}

- (unint64_t)indexOfSelectedTab
{
  id v3 = [(TabController *)self activeTabDocument];
  unint64_t v4 = [(TabController *)self indexForTab:v3];

  return v4;
}

- (id)tabAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(TabController *)self currentTabs];
  BOOL v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)originatingTabForTab:(id)a3
{
  id v4 = a3;
  if ([v4 shouldSelectOriginatingTabWhenClosed])
  {
    BOOL v5 = [v4 ancestorTabIdentifiers];
    id v6 = [v5 lastObject];

    if (v6)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
      id v8 = [(TabController *)self tabWithUUID:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)numberOfTabs
{
  uint64_t v2 = [(TabController *)self currentTabs];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)indexForTab:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TabController *)self currentTabs];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)_tabGroupsFromAllWindows
{
  uint64_t v1 = a1;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    id WeakRetained = objc_loadWeakRetained(v1 + 1);
    id v4 = [WeakRetained browserWindowController];
    BOOL v5 = [v4 browserControllers];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "windowState", (void)v18);
          id v13 = [v12 localTabGroup];
          objc_msgSend(v2, "safari_addObjectUnlessNil:", v13);

          id v14 = [v11 windowState];
          id v15 = [v14 privateTabGroup];
          objc_msgSend(v2, "safari_addObjectUnlessNil:", v15);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }

    uint64_t v16 = [v1[6] allSyncedTabGroupsExceptRemoteUnnamedTabGroups];
    uint64_t v1 = [v2 arrayByAddingObjectsFromArray:v16];
  }
  return v1;
}

uint64_t __47__TabController__foreignLocalTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)canRenameActiveTabGroup
{
  uint64_t v2 = [(TabController *)self activeTabGroup];
  char v3 = [v2 isSyncable];

  return v3;
}

- (id)_createNewTabGroupActionForTabGroupsMenu:(uint64_t)a1
{
  if (a1
    && (+[FeatureManager sharedFeatureManager],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isCustomTabGroupsEnabled],
        v4,
        v5))
  {
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v7 = _WBSLocalizedString();
    uint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke;
    v11[3] = &unk_1E6D7C670;
    void v11[4] = a1;
    char v12 = a2;
    uint64_t v9 = [v6 actionWithTitle:v7 image:v8 identifier:0 handler:v11];

    [v9 setAccessibilityIdentifier:@"NewEmptyTabGroupMenuItem"];
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

uint64_t __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 sender];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 3;
  }

  int v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke_2;
  v7[3] = &unk_1E6D7C648;
  void v7[4] = v5;
  void v7[5] = v4;
  char v8 = *(unsigned char *)(a1 + 40);
  return [v5 createTabGroupFromExistingTabs:0 completionHandler:v7];
}

void __58__TabController__createNewTabGroupActionForTabGroupsMenu___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    -[TabController _reportTabGroupCreationPrepopulatedWithTabs:fromPotentialAnalyticsSource:TabGroupsMenu:](*(void *)(a1 + 32), 0, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  }
}

- (void)_reportTabGroupCreationPrepopulatedWithTabs:(uint64_t)a3 fromPotentialAnalyticsSource:(int)a4 TabGroupsMenu:
{
  if (!a1) {
    return;
  }
  if (a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    uint64_t v7 = [WeakRetained rootViewController];
    int v8 = [v7 usingLoweredBar];

    uint64_t v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v11 = v9;
    if (!v8)
    {
      [v9 didCreateTabGroupFromLocation:a3 prepopulatedWithTabs:a2];

      if (a3 != 3) {
        return;
      }
      id v11 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v11 didCreateNewTabGroupFromTheDropDownMenu];
      goto LABEL_7;
    }
    uint64_t v10 = 5;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v11 = v9;
    uint64_t v10 = 2;
  }
  [v9 didCreateTabGroupFromLocation:v10 prepopulatedWithTabs:a2];
LABEL_7:
}

- (id)_createFromCurrentTabsActionForTabGroupsMenu:(void *)a1
{
  if (a1
    && (+[FeatureManager sharedFeatureManager],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isCustomTabGroupsEnabled],
        v4,
        v5))
  {
    id v6 = NSString;
    uint64_t v7 = _WBSLocalizedString();
    int v8 = [a1 unnamedTabGroup];
    uint64_t v9 = [v8 tabs];
    uint64_t v10 = objc_msgSend(v6, "localizedStringWithFormat:", v7, objc_msgSend(v9, "count"));

    id v11 = (void *)MEMORY[0x1E4FB13F0];
    char v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke;
    v15[3] = &unk_1E6D7C670;
    v15[4] = a1;
    char v16 = a2;
    id v13 = [v11 actionWithTitle:v10 image:v12 identifier:0 handler:v15];
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

uint64_t __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 sender];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 3;
  }

  int v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke_2;
  v7[3] = &unk_1E6D7C648;
  void v7[4] = v5;
  void v7[5] = v4;
  char v8 = *(unsigned char *)(a1 + 40);
  return [v5 createTabGroupFromExistingTabs:1 completionHandler:v7];
}

void __62__TabController__createFromCurrentTabsActionForTabGroupsMenu___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    -[TabController _reportTabGroupCreationPrepopulatedWithTabs:fromPotentialAnalyticsSource:TabGroupsMenu:](*(void *)(a1 + 32), 1, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  }
}

- (void)createTabGroupFromExistingTabs:(BOOL)a3 completionHandler:(id)a4
{
  id v19 = a4;
  id v6 = _WBSLocalizedString();
  uint64_t v7 = _WBSLocalizedString();
  if (!a3)
  {
    id v14 = _WBSLocalizedString();
    [(TabController *)self presentAlertToCreateTabGroupFromTabs:0 withTitle:v6 message:v14 suggestedName:0 okActionTitle:v7 completionHandler:v19];
    goto LABEL_13;
  }
  char v8 = [(TabController *)self unnamedTabGroup];
  uint64_t v9 = -[TabController _representativeHostForTabGroup:](self, v8);
  if (v9)
  {
    uint64_t v10 = [v8 tabs];
    uint64_t v11 = [v10 count];

    if (v11 == 2)
    {
      id v13 = NSString;
    }
    else
    {
      uint64_t v12 = v11 - 1;
      if (v11 != 1)
      {
        uint64_t v17 = NSString;
        id v15 = _WBSLocalizedString();
        uint64_t v16 = objc_msgSend(v17, "localizedStringWithFormat:", v15, v9, v12);
        goto LABEL_11;
      }
      id v13 = NSString;
    }
    id v15 = _WBSLocalizedString();
    uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", v15, v9);
LABEL_11:
    id v14 = (void *)v16;

    long long v18 = [v8 tabs];
    [(TabController *)self presentAlertToCreateTabGroupFromTabs:v18 withTitle:v6 message:v14 suggestedName:0 okActionTitle:v7 completionHandler:v19];

    goto LABEL_12;
  }
  -[TabController _closeTabGroup:]((id *)&self->super.isa, v8);
  id v14 = 0;
LABEL_12:

LABEL_13:
}

- (id)_representativeHostForTabGroup:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[TabController _urlForActiveTabInTabGroup:](a1, v3);
    int v5 = objc_msgSend(v4, "safari_userVisibleHostOrExtensionDisplayName");

    if ([v5 length])
    {
      id v6 = v5;
    }
    else
    {
      uint64_t v7 = [v3 representativeURL];
      objc_msgSend(v7, "safari_userVisibleHostWithoutWWWSubdomain");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_closeTabGroup:(id *)a1
{
  if (a1)
  {
    id v3 = a2;
    -[TabController _selectNewTabGroupIfNecessaryBeforeClosingTabGroup:](a1, v3);
    [a1[6] removeTabGroup:v3];

    [a1 updateSelectedTabGroupName];
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    [WeakRetained reloadSidebarAnimated:1];
  }
}

- (uint64_t)_currentTabsAreBlank
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 unpinnedTabs];
  uint64_t v2 = objc_msgSend(v1, "safari_containsObjectPassingTest:", &__block_literal_global_184_0) ^ 1;

  return v2;
}

BOOL __37__TabController__currentTabsAreBlank__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 url];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)tabGroupsMenuChildrenProvider
{
  v13[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = -[TabController _createNewTabGroupActionForTabGroupsMenu:]((uint64_t)self, 1);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  if ([(TabController *)self canCreateTabGroupFromCurrentTabs])
  {
    int v5 = -[TabController _createFromCurrentTabsActionForTabGroupsMenu:](self, 1);
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);
  }
  id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v3];
  v13[0] = v7;
  char v8 = -[TabController _switchToTabGroupMenu](self);
  v13[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v10 = (void *)[v6 initWithArray:v9];

  uint64_t v11 = [(TabController *)self submenuForSwitchingProfiles];
  objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

  return v10;
}

- (id)_switchToTabGroupMenu
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __38__TabController__switchToTabGroupMenu__block_invoke;
    v4[3] = &unk_1E6D7C6C0;
    void v4[4] = a1;
    uint64_t v1 = [a1 tabGroupsMenuElementsWithOptions:15 newTabGroupName:0 hostTitle:0 descendantCount:0 movingSelectedTabs:0 actionHandler:v4];
    uint64_t v2 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

id __48__TabController_tabGroupsMenuForTabGroupButton___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v3 didOpenTabGroupDropDownMenu];

    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v4 = [MEMORY[0x1E4F97E48] sharedLogger];
      id v5 = objc_loadWeakRetained(WeakRetained + 1);
      objc_msgSend(v4, "reportIOSToolbarButtonUsage:withLayout:", 7, objc_msgSend(v5, "analyticsLayoutProvenance"));
    }
    id v6 = [WeakRetained tabGroupsMenuChildrenProvider];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)canCreateTabGroupFromCurrentTabs
{
  BOOL v3 = [(TabController *)self activeTabGroup];
  if ([v3 isNamed])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    id v5 = [(TabController *)self activeTabGroup];
    if ([v5 isPrivateBrowsing]) {
      LOBYTE(v4) = 0;
    }
    else {
      int v4 = -[TabController _currentTabsAreBlank](self) ^ 1;
    }
  }
  return v4;
}

void __38__TabController__switchToTabGroupMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  [*(id *)(a1 + 32) setActiveTabGroupUUID:v3];
}

id __30__TabController_tabExposeMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __30__TabController_tabExposeMenu__block_invoke_2;
    void v13[3] = &unk_1E6D7B6D8;
    void v13[4] = WeakRetained;
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_tabMenuWithAdditionalChildrenProvider:", v13);
    id v3 = [MEMORY[0x1E4F1CA48] array];
    int v4 = [WeakRetained[9] tabBarManager];
    uint64_t v5 = [v4 displayMode];

    if (v5 != 2)
    {
      id v6 = -[TabController _switchToTabGroupMenu](WeakRetained);
      [v3 addObject:v6];
    }
    [v3 addObject:v2];
    uint64_t v7 = [MEMORY[0x1E4F78290] sharedFeatureManager];
    uint64_t v8 = [v7 preferredCapsuleLayoutStyle];

    if (v8 == 1)
    {
      uint64_t v9 = [v3 reverseObjectEnumerator];
      uint64_t v10 = [v9 allObjects];
      uint64_t v11 = [v10 mutableCopy];

      id v3 = (void *)v11;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id __30__TabController_tabExposeMenu__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) activeTabDocument];
  id v3 = +[TabMenuProvider moveMenuForTab:v2 dataSource:*(void *)(a1 + 32)];

  if (v3)
  {
    v6[0] = v3;
    int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    int v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (uint64_t)tabCollectionViewManager
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (UIMenu)newTabGroupMenu
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  int v4 = -[TabController _createNewTabGroupActionForTabGroupsMenu:]((uint64_t)self, 0);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  uint64_t v5 = [(TabController *)self activeTabGroup];
  if (([v5 isNamed] & 1) == 0)
  {
    id v6 = [(TabController *)self activeTabGroup];
    if (([v6 isPrivateBrowsing] & 1) != 0 || -[TabController _currentTabsAreBlank](self))
    {
    }
    else
    {
      uint64_t v9 = [(TabController *)self activeTabDocument];
      uint64_t v10 = [v9 libraryType];

      if (v10) {
        goto LABEL_6;
      }
      uint64_t v5 = -[TabController _createFromCurrentTabsActionForTabGroupsMenu:](self, 0);
      objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);
    }
  }

LABEL_6:
  uint64_t v7 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 children:v3];

  return v7;
}

- (void)selectPreviousTabGroup
{
}

- (void)_switchTabGroupLoopByRelativeIndex:(void *)a1
{
  if (a1)
  {
    int v4 = [a1 tabGroups];
    id v13 = (id)[v4 mutableCopy];

    uint64_t v5 = [a1 activeTabGroup];
    if (([v5 isPrivateBrowsing] & 1) == 0) {
      objc_msgSend(v13, "safari_removeObjectsPassingTest:", &__block_literal_global_196);
    }
    uint64_t v6 = [v13 count];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = [v13 indexOfObject:v5];
      uint64_t v9 = v8 + a2;
      if ((unint64_t)(v8 + a2) > 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v9 = v7 - 1;
      }
      if (v9 >= v7) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = v9;
      }
      if (v10 != v8)
      {
        uint64_t v11 = objc_msgSend(v13, "objectAtIndexedSubscript:");
        uint64_t v12 = [v11 uuid];
        [a1 setActiveTabGroupUUID:v12];
      }
    }
  }
}

- (void)selectNextTabGroup
{
}

uint64_t __52__TabController__switchTabGroupLoopByRelativeIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPrivateBrowsing];
}

- (void)updateActiveTab
{
  if (self->_activeTabGroupUUID && !self->_updateTabsSuppressionCount)
  {
    id v3 = [(TabController *)self activeTabDocument];
    int v4 = [(TabDocument *)v3 libraryType];

    if (!v4)
    {
      [(TabDocument *)v3 validateWebClip];
      if (v3 == self->_tabDocumentBeingHiddenFromTabView)
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v5 = [(TabDocument *)v3 uuid];
        uint64_t v6 = [v5 UUIDString];
      }
      if (![(TabDocument *)v3 isPinned]
        || ([(TabController *)self activeTabGroup],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            char v8 = [v7 usesGlobalPinnedTabs],
            v7,
            (v8 & 1) == 0))
      {
        tabGroupManager = self->_tabGroupManager;
        activeTabGroupUUID = self->_activeTabGroupUUID;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __32__TabController_updateActiveTab__block_invoke;
        v15[3] = &unk_1E6D7C290;
        id v16 = v6;
        [(WBTabGroupManager *)tabGroupManager updateTabGroupWithUUID:activeTabGroupUUID persist:1 usingBlock:v15];
      }
      uint64_t v11 = [(TabDocument *)v3 tabGroupTab];
      if ([v11 isShared] && (objc_msgSend(v11, "isMarkedAsRead") & 1) == 0)
      {
        uint64_t v12 = self->_tabGroupManager;
        id v13 = [v11 uuid];
        [(WBTabGroupManager *)v12 updateTabWithUUID:v13 persist:1 notify:1 usingBlock:&__block_literal_global_198];
      }
      id v14 = [(WBWindowState *)self->_windowState activeTabUUIDForTabGroupWithUUID:self->_activeTabGroupUUID];
      if ((WBSIsEqual() & 1) == 0)
      {
        [(WBWindowState *)self->_windowState setActiveTabUUID:v6 forTabGroupWithUUID:self->_activeTabGroupUUID];
        [(WBTabGroupManager *)self->_tabGroupManager saveWindowState:self->_windowState completionHandler:0];
      }
    }
  }
}

uint64_t __32__TabController_updateActiveTab__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLastSelectedTabUUID:*(void *)(a1 + 32)];
}

uint64_t __32__TabController_updateActiveTab__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 markAsRead];
}

- (void)updateBackgroundImageForTabGroup:(id)a3
{
}

uint64_t __50__TabController_updateBackgroundImageForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 markBackgroundImageAsModified];
}

- (UIMenu)menuForSwitchingProfiles
{
  id v3 = [(TabController *)self tabGroupManager];
  int v4 = [v3 profiles];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__TabController_menuForSwitchingProfiles__block_invoke;
  v8[3] = &unk_1E6D7C748;
  void v8[4] = self;
  uint64_t v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v8);

  uint64_t v6 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 children:v5];

  return (UIMenu *)v6;
}

id __41__TabController_menuForSwitchingProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v5 = [v3 title];
  uint64_t v6 = [v3 symbolImage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__TabController_menuForSwitchingProfiles__block_invoke_2;
  void v13[3] = &unk_1E6D7BF00;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v7 = v3;
  char v8 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v13];

  uint64_t v9 = NSString;
  uint64_t v10 = [v7 title];
  uint64_t v11 = [v9 stringWithFormat:@"ProfileSwitcher-%@", v10];
  [v8 setAccessibilityIdentifier:v11];

  objc_msgSend(v8, "setState:", -[TabController _isProfileActive:](*(void **)(a1 + 32), v7));
  return v8;
}

void __41__TabController_menuForSwitchingProfiles__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 setActiveProfileIdentifier:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained hideTabGroupPicker];
}

- (void)_isProfileActive:(void *)result
{
  if (result)
  {
    uint64_t v2 = result;
    id v3 = [a2 identifier];
    int v4 = [v2 activeProfileIdentifier];
    uint64_t v5 = [v3 isEqualToString:v4];

    return (void *)v5;
  }
  return result;
}

- (UIMenu)menuForSwitchingProfilesQuickly
{
  id v3 = [(TabController *)self tabGroupManager];
  int v4 = [v3 profiles];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if ((unint64_t)[v5 count] >= 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    char v8 = [WeakRetained activeProfile];

    uint64_t v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v10 = [v9 BOOLForKey:@"EnableQuickProfileSwitcher"];

    if (v10)
    {
      [v5 removeObject:v8];
      [v5 addObject:v8];
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __48__TabController_menuForSwitchingProfilesQuickly__block_invoke;
    uint64_t v17 = &unk_1E6D7C770;
    long long v18 = self;
    id v19 = v8;
    id v11 = v8;
    uint64_t v12 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &v14);
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1970], "menuWithTitle:image:identifier:options:children:", &stru_1F3C268E8, 0, 0, 1, v12, v14, v15, v16, v17, v18);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (UIMenu *)v6;
}

id __48__TabController_menuForSwitchingProfilesQuickly__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v5 = [v3 title];
  uint64_t v6 = [v3 symbolImage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__TabController_menuForSwitchingProfilesQuickly__block_invoke_2;
  void v13[3] = &unk_1E6D7BF00;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v7 = v3;
  char v8 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v13];

  uint64_t v9 = NSString;
  int v10 = [v7 title];
  id v11 = [v9 stringWithFormat:@"ProfileSwitcher-%@", v10];
  [v8 setAccessibilityIdentifier:v11];

  objc_msgSend(v8, "setState:", objc_msgSend(v7, "isEqual:", *(void *)(a1 + 40)));
  return v8;
}

void __48__TabController_menuForSwitchingProfilesQuickly__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 setActiveProfileIdentifier:v3];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained hideTabGroupPicker];
}

- (UIMenu)submenuForSwitchingProfiles
{
  if ([(TabController *)self hasMultipleProfiles])
  {
    id v3 = [(TabController *)self tabGroupManager];
    int v4 = [v3 profiles];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__TabController_submenuForSwitchingProfiles__block_invoke;
    v17[3] = &unk_1E6D7C748;
    void v17[4] = self;
    uint64_t v5 = objc_msgSend(v4, "safari_mapObjectsUsingBlock:", v17);

    uint64_t v6 = [(TabController *)self activeProfile];
    id v7 = [v6 symbolImage];
    char v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"person.crop.rectangle.stack"];
    }
    id v11 = v9;

    uint64_t v12 = (void *)MEMORY[0x1E4FB1970];
    id v13 = _WBSLocalizedString();
    int v10 = [v12 menuWithTitle:v13 image:v11 identifier:0 options:0 children:v5];

    id v14 = [(TabController *)self activeProfile];
    uint64_t v15 = [v14 title];
    [v10 setSubtitle:v15];

    [v10 setAccessibilityIdentifier:@"ProfileSwitcher"];
  }
  else
  {
    int v10 = 0;
  }
  return (UIMenu *)v10;
}

id __44__TabController_submenuForSwitchingProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v5 = [v3 title];
  uint64_t v6 = [v3 symbolImage];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__TabController_submenuForSwitchingProfiles__block_invoke_2;
  void v13[3] = &unk_1E6D7BF00;
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v7 = v3;
  char v8 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v13];

  id v9 = NSString;
  int v10 = [v7 title];
  id v11 = [v9 stringWithFormat:@"ProfileSwitcher-%@", v10];
  [v8 setAccessibilityIdentifier:v11];

  objc_msgSend(v8, "setState:", -[TabController _isProfileActive:](*(void **)(a1 + 32), v7));
  return v8;
}

void __44__TabController_submenuForSwitchingProfiles__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) identifier];
  [v1 setActiveProfileIdentifier:v2];
}

void __49__TabController__updateTabOverviewBarButtonItems__block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __49__TabController__updateTabOverviewBarButtonItems__block_invoke_2;
    v6[3] = &unk_1E6D7C7C0;
    void v6[4] = WeakRetained;
    id v7 = a1[4];
    id v8 = v3;
    id v9 = a1[5];
    objc_copyWeak(&v11, a1 + 7);
    id v10 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], v6);

    objc_destroyWeak(&v11);
  }
}

void __49__TabController__updateTabOverviewBarButtonItems__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activeTabGroupOrTabGroupVisibleInSwitcher];
  int v3 = WBSIsEqual();

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F783A8]);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) tabGroupManager];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 32) iconForSharingTabGroup:*(void *)(a1 + 40)];
    id v9 = (void *)[v4 initWithTabGroup:v5 inTabGroupManager:v6 existingShare:v7 icon:v8];

    id v10 = *(void **)(a1 + 56);
    id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
    uint64_t v12 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __49__TabController__updateTabOverviewBarButtonItems__block_invoke_3;
    uint64_t v30 = &unk_1E6D7C798;
    id v13 = v9;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void **)(a1 + 40);
    id v31 = v13;
    uint64_t v32 = v14;
    id v33 = v15;
    objc_copyWeak(&v34, (id *)(a1 + 72));
    id v16 = [v12 actionWithHandler:&v27];
    uint64_t v17 = objc_msgSend(v11, "initWithBarButtonSystemItem:primaryAction:", 9, v16, v27, v28, v29, v30);
    [v10 addObject:v17];

    if (*(void *)(a1 + 48))
    {
      long long v18 = *(void **)(a1 + 56);
      id v19 = [MEMORY[0x1E4FB14A8] fixedSpaceItemOfWidth:11.0];
      [v18 addObject:v19];

      if (!*(void *)(*(void *)(a1 + 32) + 344))
      {
        uint64_t v20 = [*(id *)(a1 + 64) newCollaborationButtonWithActiveTabGroup:*(void *)(a1 + 40) existingShare:*(void *)(a1 + 48)];
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = *(void **)(v21 + 344);
        *(void *)(v21 + 344) = v20;
      }
      uint64_t v23 = *(void **)(a1 + 56);
      id v24 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:*(void *)(*(void *)(a1 + 32) + 344)];
      [v23 addObject:v24];
    }
    uint64_t v25 = *(void *)(a1 + 56);
    int v26 = [*(id *)(*(void *)(a1 + 32) + 72) tabOverview];
    [v26 setBarButtonItems:v25];

    objc_destroyWeak(&v34);
  }
}

void __49__TabController__updateTabOverviewBarButtonItems__block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = a2;
  uint64_t v7 = [v4 iconForSharingTabGroup:v5];
  [v3 updateMetadataIcon:v7];

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = *(void **)(a1 + 32);
  id v9 = [v6 sender];

  -[TabController _presentShareSheetWithTabGroupActivityItemConfiguration:sender:](WeakRetained, v8, v9);
}

- (void)_presentShareSheetWithTabGroupActivityItemConfiguration:(void *)a3 sender:
{
  id v9 = a3;
  if (a1)
  {
    uint64_t v5 = -[TabController _tabGroupShareSheetWithTabGroupActivityItemConfiguration:](a1, a2);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x1E4F784A8]) initWithItem:v9];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = objc_msgSend(v9, "safari_popoverSourceInfo");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v7 = 0;
          goto LABEL_9;
        }
        uint64_t v6 = [objc_alloc(MEMORY[0x1E4F785C8]) initWithView:v9];
      }
    }
    uint64_t v7 = (void *)v6;
LABEL_9:
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    [WeakRetained presentModalViewController:v5 fromPopoverSource:v7];
  }
}

- (void)shareRecordForActiveTabGroupWithCompletionHandler:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 activeTabGroup];
    if ([v4 isShared])
    {
      objc_initWeak(&location, a1);
      uint64_t v5 = (void *)a1[6];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __67__TabController_shareRecordForActiveTabGroupWithCompletionHandler___block_invoke;
      v6[3] = &unk_1E6D7C858;
      objc_copyWeak(&v9, &location);
      id v7 = v4;
      id v8 = v3;
      [v5 shareRecordForTabGroup:v7 completionHandler:v6];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
}

- (id)tabGroupShareSheetForCurrentTabGroup
{
  id v3 = [(TabController *)self activeTabGroup];
  id v4 = [(TabController *)self shareRecordForActiveTabGroup];
  id v5 = objc_alloc(MEMORY[0x1E4F783A8]);
  uint64_t v6 = [(TabController *)self tabGroupManager];
  id v7 = [(TabController *)self iconForSharingActiveTabGroup];
  id v8 = (void *)[v5 initWithTabGroup:v3 inTabGroupManager:v6 existingShare:v4 icon:v7];

  id v9 = -[TabController _tabGroupShareSheetWithTabGroupActivityItemConfiguration:](self, v8);

  return v9;
}

- (id)_tabGroupShareSheetWithTabGroupActivityItemConfiguration:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F9F2E8]) initWithActivityItemsConfiguration:v3];
    objc_initWeak(&location, a1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke;
    v6[3] = &unk_1E6D7C810;
    objc_copyWeak(&v7, &location);
    [v4 setCompletionWithItemsHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke(uint64_t a1, void *a2, int a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[TabController _requestContactsAccessIfNeeded]((uint64_t)WeakRetained);
  }
  else if (v11)
  {
    uint64_t v14 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke_cold_1(v14);
    }
  }
}

- (void)_requestContactsAccessIfNeeded
{
  if (a1 && ![MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0])
  {
    id v1 = [MEMORY[0x1E4F98A58] sharedContactStoreManager];
    [v1 requestAccessForEntityType:0 completionHandler:&__block_literal_global_241];
  }
}

- (void)_beganSharingTabGroup:(id)a3
{
  id v4 = [a3 object];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __39__TabController__beganSharingTabGroup___block_invoke;
  v6[3] = &unk_1E6D77D90;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __39__TabController__beganSharingTabGroup___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 40) isEqualToString:*(void *)(*(void *)(a1 + 32) + 56)])
  {
    id v2 = *(id **)(a1 + 32);
    -[TabController _updateTabOverviewBarButtonItems](v2);
  }
}

- (void)_markAllTabsInTabGroupAsRead:(uint64_t)a1
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 48);
    id v3 = [a2 uuid];
    [v2 updateTabsInTabGroupWithUUID:v3 persist:1 usingBlock:&__block_literal_global_233];
  }
}

void __46__TabController__markAllTabsInTabGroupAsRead___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(a2, "tabs", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v7 isMarkedAsRead] & 1) == 0) {
          [v7 markAsRead];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_presentShareSheetForTabGroup:(void *)a3 sender:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    id v11 = [a1 shareRecordForActiveTabGroup];
    id v7 = objc_alloc(MEMORY[0x1E4F783A8]);
    long long v8 = [a1 tabGroupManager];
    long long v9 = [a1 iconForSharingTabGroup:v6];
    long long v10 = (void *)[v7 initWithTabGroup:v6 inTabGroupManager:v8 existingShare:v11 icon:v9];

    -[TabController _presentShareSheetWithTabGroupActivityItemConfiguration:sender:]((id *)a1, v10, v5);
  }
}

void __47__TabController__requestContactsAccessIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__TabController__requestContactsAccessIfNeeded__block_invoke_cold_1(v4);
    }
  }
}

- (UIImage)iconForSharingActiveTabGroup
{
  id v3 = [(TabController *)self activeTabGroup];
  uint64_t v4 = [(TabController *)self iconForSharingTabGroup:v3];

  return (UIImage *)v4;
}

- (id)iconForSharingTabGroup:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F785B0];
  id v4 = a3;
  id v5 = [v3 sharedSiteMetadataManager];
  id v6 = [v5 tabGroupIconProvider];
  uint64_t v7 = [v6 iconForTabGroup:v4];

  uint64_t v8 = iconForSharingTabGroup__appIcon;
  if (!(v7 | iconForSharingTabGroup__appIcon))
  {
    long long v9 = (void *)MEMORY[0x1E4F782C0];
    long long v10 = [MEMORY[0x1E4F28B50] mainBundle];
    id v11 = [v10 bundleIdentifier];
    uint64_t v12 = objc_msgSend(v9, "appIconForBundleIdentifier:imageSize:", v11, 60.0, 60.0);
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x1E4FB1818] imageNamed:@"AppIcon"];
    }
    uint64_t v15 = (void *)iconForSharingTabGroup__appIcon;
    iconForSharingTabGroup__appIcon = (uint64_t)v14;

    uint64_t v8 = iconForSharingTabGroup__appIcon;
  }
  if (v7) {
    id v16 = (void *)v7;
  }
  else {
    id v16 = (void *)v8;
  }
  id v17 = v16;

  return v17;
}

void __67__TabController_shareRecordForActiveTabGroupWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained isTabGroupActive:*(void *)(a1 + 32)]) {
    -[TabController _updateShare:forActiveTabGroup:](WeakRetained, v4, *(void **)(a1 + 32));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_updateShare:(void *)a3 forActiveTabGroup:
{
  if (a1)
  {
    id v5 = a3;
    id v6 = a2;
    uint64_t v7 = [v5 title];
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F19DC8]];

    image = [a1 iconForSharingTabGroup:v5];

    uint64_t v8 = UIImagePNGRepresentation(image);
    [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F19DC0]];
  }
}

- (CKShare)shareRecordForActiveTabGroupIfIsShared
{
  id v3 = [(TabController *)self activeTabGroupOrTabGroupVisibleInSwitcher];
  if ([v3 isShared])
  {
    id v4 = [(TabController *)self shareRecordForActiveTabGroup];
  }
  else
  {
    id v4 = 0;
  }

  return (CKShare *)v4;
}

- (CKShare)shareRecordForActiveTabGroup
{
  id v3 = [(TabController *)self activeTabGroupOrTabGroupVisibleInSwitcher];
  id v4 = [(WBTabGroupManager *)self->_tabGroupManager shareRecordForTabGroup:v3];
  if (v4)
  {
    -[TabController _updateShare:forActiveTabGroup:](self, v4, v3);
    id v5 = v4;
  }

  return (CKShare *)v4;
}

- (void)clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_cachedShareConfigurationsByTabGroupUUID objectForKeyedSubscript:v4];

  if (v5)
  {
    [(NSMutableDictionary *)self->_cachedShareConfigurationsByTabGroupUUID setObject:0 forKeyedSubscript:v4];
    id v6 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__TabController_clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID___block_invoke;
    v7[3] = &unk_1E6D7C880;
    void v7[4] = self;
    [(TabController *)self tabSwitcherShareConfigurationForTabGroup:v6 completion:v7];
  }
}

void __77__TabController_clearCachedTabSwitcherShareConfigurationForTabGroupWithUUID___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 72) tabSwitcherViewController];
  [v1 setNeedsApplyContentAnimated:0];
}

void __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_2;
  block[3] = &unk_1E6D7C8D0;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v9 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_2(uint64_t a1)
{
  -[TabController _updateShare:forActiveTabGroup:](*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  id v2 = objc_alloc(MEMORY[0x1E4F783A8]);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[6];
  id v7 = [v5 iconForSharingTabGroup:v3];
  id v8 = (void *)[v2 initWithTabGroup:v3 inTabGroupManager:v6 existingShare:v4 icon:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F78440]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_3;
  v20[3] = &unk_1E6D7C8A8;
  objc_copyWeak(&v23, (id *)(a1 + 64));
  id v10 = v8;
  id v21 = v10;
  id v22 = *(id *)(a1 + 48);
  id v11 = (void *)[v9 initWithIdentifier:@"TabController.TabGroupShare" shareHandler:v20];
  if (*(void *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v13 = (void *)[WeakRetained newCollaborationButtonWithActiveTabGroup:*(void *)(a1 + 48) existingShare:*(void *)(a1 + 40)];
    [v11 setCollaborationButtonForLargeTitle:v13];

    id v14 = (void *)[WeakRetained newCollaborationButtonWithActiveTabGroup:*(void *)(a1 + 48) existingShare:*(void *)(a1 + 40)];
    [v11 setCollaborationButtonForNavigationBar:v14];
  }
  uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 256);
  if (!v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v17 = *(void *)(a1 + 32);
    long long v18 = *(void **)(v17 + 256);
    *(void *)(v17 + 256) = v16;

    uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 256);
  }
  id v19 = [*(id *)(a1 + 48) uuid];
  [v15 setObject:v11 forKeyedSubscript:v19];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  objc_destroyWeak(&v23);
}

void __69__TabController_tabSwitcherShareConfigurationForTabGroup_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = [WeakRetained iconForSharingTabGroup:*(void *)(a1 + 40)];
    [v5 updateMetadataIcon:v6];

    -[TabController _presentShareSheetWithTabGroupActivityItemConfiguration:sender:](v4, *(void **)(a1 + 32), v7);
  }
}

__CFString *__52__TabController_unnamedTabGroupDisplayTitleProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v3 usesGlobalPinnedTabs])
    {
      id v5 = (void *)WeakRetained[35];
      uint64_t v6 = -[TabController _containerForPinnedTabsInTabGroup:](WeakRetained, v3);
      id v7 = [v5 pinnedTabsInContainer:v6];
    }
    else
    {
      id v7 = 0;
    }
    id v9 = [v3 tabs];
    uint64_t v10 = [v9 count];
    uint64_t v11 = [v7 count] + v10;

    if (!v11) {
      goto LABEL_10;
    }
    if (v11 != 1) {
      goto LABEL_9;
    }
    uint64_t v12 = [v3 tabs];
    uint64_t v13 = [v12 firstObject];
    id v14 = [v13 url];

    if (v14)
    {
LABEL_9:
      uint64_t v15 = NSString;
      uint64_t v16 = _WBSLocalizedString();
      objc_msgSend(v15, "localizedStringWithFormat:", v16, v11);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_10:
      _WBSLocalizedString();
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v8 = &stru_1F3C268E8;
  }

  return v8;
}

- (void)willSelectProfileWithIdentifier:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x1E4F980C8]] & 1) == 0) {
    [(PinnedTabsManager *)self->_pinnedTabsManager willSelectProfileWithIdentifier:v4];
  }
}

- (void)didSelectProfileWithIdentifier:(id)a3 previousProfileIdentifier:(id)a4
{
  id v6 = a4;
  id v5 = -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  [v5 reloadTabGroups];

  if (([v6 isEqualToString:*MEMORY[0x1E4F980C8]] & 1) == 0) {
    [(PinnedTabsManager *)self->_pinnedTabsManager didDeselectProfileWithIdentifier:v6];
  }
}

- (WBTabGroup)focusedTabGroup
{
  id v3 = -[TabController _application](self);
  id v4 = [v3 focusedTabGroupUUIDString];

  if (v4)
  {
    id v5 = [(TabController *)self tabGroupWithUUID:v4];
    if (!v5)
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXSiriLink();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TabController focusedTabGroup]();
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return (WBTabGroup *)v5;
}

- (void)openFocusProfileWithCompletionHandler:(id)a3
{
  id v10 = a3;
  id v4 = -[TabController _application](self);
  id v5 = [v4 focusProfile];

  if (v5)
  {
    id v6 = [(TabController *)self activeProfile];
    id v7 = [v6 identifier];
    id v8 = [v5 identifier];
    char v9 = [v7 isEqualToString:v8];

    if ((v9 & 1) == 0) {
      -[TabController _presentOpenAlertForFocusProfile:completionHandler:]((uint64_t)self, v5, v10);
    }
  }
}

- (void)_presentOpenAlertForFocusProfile:(void *)a3 completionHandler:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      char v9 = [v5 identifier];
      id v10 = [*(id *)(a1 + 272) uuid];
      *(_DWORD *)buf = 138543618;
      char v41 = v9;
      __int16 v42 = 2114;
      int v43 = v10;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Prompting to switch to focus profile %{public}@ on window %{public}@", buf, 0x16u);
    }
    if (v6) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = &__block_literal_global_287;
    }
    uint64_t v12 = NSString;
    uint64_t v13 = _WBSLocalizedString();
    id v14 = [v5 title];
    uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

    uint64_t v16 = _WBSLocalizedString();
    id v31 = (void *)v15;
    uint64_t v17 = [MEMORY[0x1E4F98EF0] alertControllerWithTitle:v15 message:v16 preferredStyle:1];
    [v17 setRole:1];
    long long v18 = (void *)MEMORY[0x1E4FB1410];
    id v19 = _WBSLocalizedString();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_2;
    v38[3] = &unk_1E6D7C998;
    id v20 = v11;
    id v39 = v20;
    id v21 = [v18 actionWithTitle:v19 style:1 handler:v38];

    id v22 = (void *)MEMORY[0x1E4FB1410];
    id v23 = _WBSLocalizedString();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_3;
    v35[3] = &unk_1E6D7CA10;
    v35[4] = a1;
    id v36 = v5;
    id v6 = v20;
    id v37 = v6;
    id v24 = [v22 actionWithTitle:v23 style:0 handler:v35];

    [v17 addAction:v21];
    [v17 addAction:v24];
    [v17 setPreferredAction:v24];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    int v26 = [WeakRetained viewControllerToPresentFrom];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_4;
    v32[3] = &unk_1E6D77D90;
    id v27 = v26;
    id v33 = v27;
    id v28 = v17;
    id v34 = v28;
    uint64_t v29 = (void (**)(void))MEMORY[0x1E4E42950](v32);
    uint64_t v30 = [v27 presentedViewController];
    objc_opt_class();
    LOBYTE(v20) = objc_opt_isKindOfClass();

    if (v20) {
      [v27 dismissViewControllerAnimated:1 completion:v29];
    }
    else {
      v29[2](v29);
    }
  }
}

- (void)openFocusedTabGroupWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v4 = [(TabController *)self focusedTabGroup];
  if (v4 && ![(TabController *)self isTabGroupActive:v4]) {
    -[TabController _presentOpenAlertForFocusedTabGroup:completionHandler:]((uint64_t)self, v4, v5);
  }
}

- (void)_presentOpenAlertForFocusedTabGroup:(void *)a3 completionHandler:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      char v9 = [v5 uuid];
      id v10 = [*(id *)(a1 + 272) uuid];
      *(_DWORD *)buf = 138543618;
      char v41 = v9;
      __int16 v42 = 2114;
      int v43 = v10;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Prompting to open FTG %{public}@ on window %{public}@", buf, 0x16u);
    }
    if (v6) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = &__block_literal_global_298;
    }
    uint64_t v12 = NSString;
    uint64_t v13 = _WBSLocalizedString();
    id v14 = [v5 displayTitle];
    uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);

    uint64_t v16 = _WBSLocalizedString();
    id v31 = (void *)v15;
    uint64_t v17 = [MEMORY[0x1E4F98EF0] alertControllerWithTitle:v15 message:v16 preferredStyle:1];
    [v17 setRole:1];
    long long v18 = (void *)MEMORY[0x1E4FB1410];
    id v19 = _WBSLocalizedString();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_2;
    v38[3] = &unk_1E6D7C998;
    id v20 = v11;
    id v39 = v20;
    id v21 = [v18 actionWithTitle:v19 style:1 handler:v38];

    id v22 = (void *)MEMORY[0x1E4FB1410];
    id v23 = _WBSLocalizedString();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_3;
    v35[3] = &unk_1E6D7CA10;
    v35[4] = a1;
    id v36 = v5;
    id v6 = v20;
    id v37 = v6;
    id v24 = [v22 actionWithTitle:v23 style:0 handler:v35];

    [v17 addAction:v21];
    [v17 addAction:v24];
    [v17 setPreferredAction:v24];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    int v26 = [WeakRetained viewControllerToPresentFrom];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_4;
    v32[3] = &unk_1E6D77D90;
    id v27 = v26;
    id v33 = v27;
    id v28 = v17;
    id v34 = v28;
    uint64_t v29 = (void (**)(void))MEMORY[0x1E4E42950](v32);
    uint64_t v30 = [v27 presentedViewController];
    objc_opt_class();
    LOBYTE(v20) = objc_opt_isKindOfClass();

    if (v20) {
      [v27 dismissViewControllerAnimated:1 completion:v29];
    }
    else {
      v29[2](v29);
    }
  }
}

- (id)_tabGroupAlertControllerWithTitle:(uint64_t)a3 message:(void *)a4 okActionTitle:(uint64_t)a5 role:(char)a6 showingSuggestionsIfPossible:(void *)a7 actionHandler:(void *)a8 completionHandler:
{
  id v15 = a7;
  id v16 = a8;
  if (a1)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F98EF0];
    id v18 = a4;
    id v19 = [v17 alertControllerWithTitle:a2 message:a3 preferredStyle:1];
    [v19 setRole:a5];
    [v19 setDelegate:a1];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke;
    v39[3] = &unk_1E6D7C970;
    v39[4] = a1;
    char v40 = a6;
    [v19 addTextFieldWithConfigurationHandler:v39];
    id v20 = (void *)MEMORY[0x1E4FB1410];
    id v21 = _WBSLocalizedString();
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_2;
    v37[3] = &unk_1E6D7C998;
    id v22 = v16;
    id v38 = v22;
    id v23 = [v20 actionWithTitle:v21 style:1 handler:v37];

    [v19 addAction:v23];
    id v24 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    uint64_t v32 = __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_3;
    id v33 = &unk_1E6D7C9C0;
    id v25 = v19;
    id v34 = v25;
    id v35 = v15;
    id v36 = v22;
    int v26 = [v24 actionWithTitle:v18 style:0 handler:&v30];

    objc_msgSend(v25, "addAction:", v26, v30, v31, v32, v33);
    [v25 setPreferredAction:v26];
    id v27 = [v25 textFields];
    id v28 = [v27 firstObject];
    [v28 setDelegate:a1];

    a1 = v25;
  }

  return a1;
}

void __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  [v10 setAutocorrectionType:2];
  id v3 = _WBSLocalizedString();
  if ([v3 integerValue] <= 2 && objc_msgSend(v3, "integerValue") < 0)
  {
    uint64_t v4 = 0;
  }
  else if ([v3 integerValue] > 2)
  {
    uint64_t v4 = 3;
  }
  else
  {
    uint64_t v4 = [v3 integerValue];
  }
  [v10 setAutocapitalizationType:v4];
  [v10 setClearButtonMode:1];
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = +[FeatureManager sharedFeatureManager];
    char v6 = [v5 areTabGroupSuggestionsEnabled];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = a1 + 32;
    *(unsigned char *)(v8 + 232) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v7 = a1 + 32;
    *(unsigned char *)(v9 + 232) = 0;
  }
  if (*(unsigned char *)(*(void *)v7 + 232)) {
    [v10 setAutocorrectionType:1];
  }
}

uint64_t __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __139__TabController__tabGroupAlertControllerWithTitle_message_okActionTitle_role_showingSuggestionsIfPossible_actionHandler_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) textFields];
  id v3 = [v2 firstObject];
  id v10 = [v3 text];

  uint64_t v4 = [v10 length];
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      char v6 = [*(id *)(a1 + 32) textFields];
      uint64_t v7 = [v6 firstObject];
      uint64_t v8 = [v7 text];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);
    }
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, BOOL))(v9 + 16))(v9, v4 != 0);
  }
}

- (void)presentAlertToCreateTabGroupFromTabs:(id)a3 withTitle:(id)a4 message:(id)a5 suggestedName:(id)a6 okActionTitle:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v33 = a4;
  id v15 = a5;
  id v32 = a7;
  id v16 = a8;
  id v17 = v15;
  id v18 = a6;
  id v19 = +[Application sharedApplication];
  int v20 = [v19 isCloudHistoryEnabled];

  id v21 = v17;
  if (v20)
  {
    id v22 = NSString;
    id v23 = _WBSLocalizedString();
    id v24 = _WBSLocalizedString();
    id v21 = objc_msgSend(v22, "stringWithFormat:", v23, v17, v24);
  }
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke;
  v36[3] = &unk_1E6D7C9E8;
  v36[4] = self;
  id v37 = v14;
  id v38 = v16;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke_2;
  v34[3] = &unk_1E6D784D8;
  v34[4] = self;
  id v35 = v38;
  id v31 = v38;
  id v25 = v14;
  int v26 = -[TabController _tabGroupAlertControllerWithTitle:message:okActionTitle:role:showingSuggestionsIfPossible:actionHandler:completionHandler:](self, (uint64_t)v33, (uint64_t)v21, v32, 2, 1, v36, v34);
  id v27 = [v26 textFields];
  id v28 = [v27 firstObject];
  [v28 setText:v18];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v30 = [WeakRetained viewControllerToPresentFrom];
  [v30 presentViewController:v26 animated:1 completion:0];
}

void __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) addNewTabGroupWithTitle:a2 fromTabs:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained scrollSidebarToTopAnimated:1];

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

uint64_t __118__TabController_presentAlertToCreateTabGroupFromTabs_withTitle_message_suggestedName_okActionTitle_completionHandler___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(result + 32) + 8));
    [WeakRetained closePreviewDocument];

    uint64_t result = *(void *)(v2 + 40);
    if (result)
    {
      uint64_t v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

- (id)addNewTabGroupWithTitle:(id)a3 fromExistingTabs:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    uint64_t v7 = [(TabController *)self unnamedTabGroup];
    uint64_t v8 = [v7 tabs];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [(TabController *)self addNewTabGroupWithTitle:v6 fromTabs:v8];

  return v9;
}

- (id)_addTabGroup:(void *)a3 fromTabs:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    *(unsigned char *)(a1 + 184) = 1;
    id v6 = [*(id *)(a1 + 48) insertTabGroup:a2 afterTabGroup:0];
    *(unsigned char *)(a1 + 184) = 0;
    uint64_t v7 = [v6 uuid];
    if ([v5 count])
    {
      id v24 = v6;
      id v25 = v5;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id obj = v5;
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            uint64_t v13 = [v12 tabGroupUUID];
            id v14 = [v12 uuid];
            id v15 = [*(id *)(a1 + 272) activeTabUUIDForTabGroupWithUUID:v13];
            int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              [*(id *)(a1 + 272) removeActiveTabUUIDForTabGroupWithUUID:v13];
              id v17 = [*(id *)(a1 + 272) activeTabUUIDForTabGroupWithUUID:v7];

              if (!v17)
              {
                id v18 = *(void **)(a1 + 272);
                id v19 = [v12 uuid];
                [v18 setActiveTabUUID:v19 forTabGroupWithUUID:v7];
              }
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v9);
      }

      id v6 = v24;
      [*(id *)(a1 + 48) moveTabs:obj toTabGroup:v24 afterTab:0 withoutPersistingTabGroupsWithUUIDStrings:0];
      id v5 = v25;
    }
    [(id)a1 setActiveTabGroupUUID:v7];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    [WeakRetained reloadSidebarAnimated:0];

    id v21 = [*(id *)(a1 + 72) tabSwitcherViewController];
    [v21 setNeedsScrollToTabGroup:v6];

    id v22 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v22 didCreateNewTabGroup];

    a1 = [*(id *)(a1 + 48) tabGroupWithUUID:v7];
  }
  return (id)a1;
}

- (id)addNewTabGroupWithTitle:(id)a3 fromTabs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = objc_alloc(MEMORY[0x1E4FB6080]);
    uint64_t v9 = [(TabController *)self deviceIdentifier];
    uint64_t v10 = (void *)[v8 initWithTitle:v6 deviceIdentifier:v9];

    uint64_t v11 = [(TabController *)self activeProfileIdentifier];
    [v10 setProfileIdentifier:v11];

    uint64_t v12 = -[TabController _addTabGroup:fromTabs:]((uint64_t)self, (uint64_t)v10, v7);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)dismissOpenTabGroupAlertIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v4 = [WeakRetained viewControllerToPresentFrom];

  id v5 = [v4 presentedViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 role] == 1)
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      windowState = self->_windowState;
      id v8 = v6;
      uint64_t v9 = [(WBWindowState *)windowState uuid];
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Dismissing open FTG alert on window %{public}@", (uint8_t *)&v10, 0xCu);
    }
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

uint64_t __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) identifier];
  [*(id *)(a1 + 32) setActiveProfileIdentifier:v2];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

uint64_t __68__TabController__presentOpenAlertForFocusProfile_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

uint64_t __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) uuid];
  [*(id *)(a1 + 32) setActiveTabGroupUUID:v2];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

uint64_t __71__TabController__presentOpenAlertForFocusedTabGroup_completionHandler___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)_presentRenameAlertForTabGroup:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = _WBSLocalizedString();
    id v5 = _WBSLocalizedString();
    id v6 = _WBSLocalizedString();
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    int v16 = __48__TabController__presentRenameAlertForTabGroup___block_invoke;
    id v17 = &unk_1E6D7CA38;
    id v18 = a1;
    id v7 = v3;
    id v19 = v7;
    id v8 = -[TabController _tabGroupAlertControllerWithTitle:message:okActionTitle:role:showingSuggestionsIfPossible:actionHandler:completionHandler:](a1, (uint64_t)v4, (uint64_t)v5, v6, 3, 0, &v14, 0);
    uint64_t v9 = objc_msgSend(v7, "displayTitle", v14, v15, v16, v17, v18);
    int v10 = [v8 textFields];
    uint64_t v11 = [v10 firstObject];
    [v11 setText:v9];

    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    uint64_t v13 = [WeakRetained viewControllerToPresentFrom];
    [v13 presentViewController:v8 animated:1 completion:0];
  }
}

void __48__TabController__presentRenameAlertForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = [v4 uuid];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__TabController__presentRenameAlertForTabGroup___block_invoke_2;
  v8[3] = &unk_1E6D7C290;
  id v9 = v3;
  id v7 = v3;
  [v5 updateTabGroupWithUUID:v6 persist:1 usingBlock:v8];
}

uint64_t __48__TabController__presentRenameAlertForTabGroup___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

- (void)_updateContextKitSuggestionsForTabGroupWithCompletionHandler:(void *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = (void *)a1[28];
    a1[28] = 0;

    id v5 = [a1 currentTabDocuments];
    if ([v5 count])
    {
      id v19 = a1;
      int v20 = v3;
      id v6 = dispatch_group_create();
      id v7 = [MEMORY[0x1E4F1CA48] array];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v14 = objc_msgSend(v13, "contextController", v19);
            uint64_t v15 = [v13 URL];
            if (v15) {
              BOOL v16 = v14 == 0;
            }
            else {
              BOOL v16 = 1;
            }
            if (!v16)
            {
              dispatch_group_enter(v6);
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke;
              v25[3] = &unk_1E6D7CA60;
              int v26 = v6;
              id v27 = v7;
              [v14 cachedResponseForURL:v15 completionHandler:v25];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v10);
      }

      id v17 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E6D7A938;
      id v22 = v7;
      id v3 = v20;
      id v23 = v19;
      id v24 = v20;
      id v18 = v7;
      dispatch_group_notify(v6, v17, block);
    }
    else
    {
      (*((void (**)(id, void))v3 + 2))(v3, 0);
    }
  }
}

void __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(a1 + 40);
    objc_sync_enter(v3);
    [*(id *)(a1 + 40) addObject:v4];
    objc_sync_exit(v3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2050000000;
    uint64_t v2 = (void *)getCKContextClientClass_softClass_0;
    uint64_t v14 = getCKContextClientClass_softClass_0;
    if (!getCKContextClientClass_softClass_0)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getCKContextClientClass_block_invoke_0;
      v10[3] = &unk_1E6D77CE0;
      void v10[4] = &v11;
      __getCKContextClientClass_block_invoke_0((uint64_t)v10);
      uint64_t v2 = (void *)v12[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v11, 8);
    id v4 = [v3 clientWithDefaultRequestType:1];
    uint64_t v5 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_3;
    v8[3] = &unk_1E6D7CA88;
    id v6 = *(id *)(a1 + 48);
    void v8[4] = *(void *)(a1 + 40);
    id v9 = v6;
    [v4 groupResponses:v5 withReply:v8];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

void __78__TabController__updateContextKitSuggestionsForTabGroupWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v5
    || ([v12 results],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    uint64_t v9 = [v12 completer];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 224);
    *(void *)(v10 + 224) = v9;

    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

- (void)tabGroupNamingTextDidChange:(id)a3
{
  if (self->_showsTabGroupNameSuggestions)
  {
    id v4 = a3;
    id v5 = [v4 text];
    -[TabController _updateTabGroupSuggestions:matchingText:]((uint64_t)self, v4, v5);
  }
}

- (void)_updateTabGroupSuggestions:(void *)a3 matchingText:
{
  id v13 = a2;
  id v5 = a3;
  id v6 = v5;
  if (a1)
  {
    if ((unint64_t)[v5 length] > 3
      || UIKeyboardAlwaysShowCandidateBarForCurrentInputMode()
      || ([*(id *)(a1 + 224) resultsMatching:v6],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = *(void **)(a1 + 216),
          *(void *)(a1 + 216) = v7,
          v8,
          ![*(id *)(a1 + 216) count]))
    {
      [v13 setAutocorrectionType:2];
      uint64_t v11 = [v13 textInputSuggestionDelegate];
      [v11 setSuggestions:0];
    }
    else
    {
      uint64_t v9 = objc_msgSend(*(id *)(a1 + 216), "safari_prefixWithMaxLength:", 3);
      uint64_t v10 = *(void **)(a1 + 216);
      *(void *)(a1 + 216) = v9;

      uint64_t v11 = objc_msgSend(*(id *)(a1 + 216), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_315);
      [v13 setAutocorrectionType:1];
      id v12 = [v13 textInputSuggestionDelegate];
      [v12 setSuggestions:v11];

      objc_msgSend(*(id *)(a1 + 224), "logResultsShown:serverOverride:forInput:", objc_msgSend(v11, "count"), 0, v6);
    }
  }
}

id __57__TabController__updateTabGroupSuggestions_matchingText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1DC8];
  id v3 = [a2 title];
  id v4 = [v2 textSuggestionWithInputText:v3];

  return v4;
}

- (uint64_t)isTabInActiveTabGroup:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    id v3 = [a2 tabGroupUUID];
    uint64_t v4 = [v3 isEqualToString:*(void *)(v2 + 56)];

    return v4;
  }
  return result;
}

- (void)selectLocalTabGroup
{
  id v4 = [(TabController *)self unnamedTabGroup];
  id v3 = [v4 uuid];
  [(TabController *)self setActiveTabGroupUUID:v3];
}

- (void)updateBackgroundImageForProfile:(id)a3
{
  id v3 = (id)[(WBTabGroupManager *)self->_tabGroupManager updateProfileWithIdentifier:a3 persist:1 usingBlock:&__block_literal_global_319 completionHandler:0];
}

uint64_t __49__TabController_updateBackgroundImageForProfile___block_invoke(uint64_t a1, void *a2)
{
  return [a2 markBackgroundImageAsModified];
}

- (void)selectPrivateTabGroup
{
  id v4 = [(WBWindowState *)self->_windowState privateTabGroup];
  id v3 = [v4 uuid];
  [(TabController *)self setActiveTabGroupUUID:v3];
}

- (void)didFocusTabGroup:(id)a3
{
  p_browserController = &self->_browserController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained didFocusTabGroup:v4];
}

- (NSArray)profiles
{
  return (NSArray *)[(WBTabGroupManager *)self->_tabGroupManager profiles];
}

- (void)setActiveProfileIdentifier:(id)a3
{
  p_browserController = &self->_browserController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained setActiveProfileIdentifier:v4];
}

- (id)tabGroupsForProfileWithIdentifier:(id)a3
{
  return (id)[(WBTabGroupManager *)self->_tabGroupManager namedTabGroupsForProfileWithIdentifier:a3];
}

- (void)_closeLibraryIfNeeded
{
  if (a1 && a1[24])
  {
    uint64_t v2 = [a1 activeTabGroup];
    int v3 = [v2 isPrivateBrowsing];
    uint64_t v4 = 37;
    if (v3) {
      uint64_t v4 = 36;
    }
    id v5 = (id)a1[v4];

    [a1 setActiveTabDocument:v5];
  }
}

- (void)setActiveTabGroupUUID:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TabController *)self activeTabGroup];
  id v6 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupWithUUID:v4];
  uint64_t v7 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabSwitcherViewController];
  [v7 setNeedsScrollToTabGroup:v6];

  if ([v5 isIdentical:v6])
  {
    -[TabController _closeLibraryIfNeeded](self);
  }
  else
  {
    if (self->_activeTabGroupUUID)
    {
      uint64_t v8 = [(TabController *)self tabGroupManager];
      [v8 endParticipantPresenceReportingForTabGroupWithUUID:self->_activeTabGroupUUID];
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __39__TabController_setActiveTabGroupUUID___block_invoke;
    v43[3] = &unk_1E6D77E20;
    v43[4] = self;
    [v9 setHandler:v43];
    char v10 = [v4 isEqualToString:self->_activeTabGroupUUID];
    if ((v10 & 1) == 0) {
      [(TabController *)self persistAllCurrentTabsInBackground:0];
    }
    uint64_t v11 = (NSString *)[v4 copy];
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v11;

    id v13 = -[TabController _application](self);
    uint64_t v14 = [v13 focusedTabGroupUUIDString];
    int v15 = [v14 isEqualToString:v4];

    if (v15) {
      [v13 setNeedsFocusedTabGroupUpdate:0];
    }
    if (v4)
    {
      [(WBWindowState *)self->_windowState setActiveTabGroupUUID:v4];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      [WeakRetained willSelectTabGroupWithUUID:v4];

      [(PinnedTabsManager *)self->_pinnedTabsManager removePinnedTabsObserver:self];
      if ((v10 & 1) == 0)
      {
        -[TabController _sendWillBeginDocumentUpdates]((uint64_t)self);
        [(TabCollectionViewManager *)self->_tabCollectionViewManager beginFixingTabBarItems];
        [(TabCollectionViewManager *)self->_tabCollectionViewManager beginFixingTabOverviewItems];
        ++self->_updateTabsSuppressionCount;
        -[TabController _updateTabsForTabGroup:]((uint64_t)self, v6);
        --self->_updateTabsSuppressionCount;
      }
      tabOverviewCollaborationButton = self->_tabOverviewCollaborationButton;
      self->_tabOverviewCollaborationButton = 0;

      [(TabController *)self updateSelectedTabGroupName];
      if ([v6 usesGlobalPinnedTabs])
      {
        [(PinnedTabsManager *)self->_pinnedTabsManager addPinnedTabsObserver:self];
        -[TabController _updateActiveTabForTabGroup:](self, v6);
      }
      id v18 = [v6 tabs];
      uint64_t v19 = [v18 count];

      if (!v19) {
        [(TabController *)self didUpdateTabDocuments];
      }
      [(TabController *)self didFocusTabGroup:v6];
      if ((v10 & 1) == 0)
      {
        [(TabCollectionViewManager *)self->_tabCollectionViewManager endFixingTabBarItems];
        [(TabCollectionViewManager *)self->_tabCollectionViewManager endFixingTabOverviewItems];
        [(TabCollectionViewManager *)self->_tabCollectionViewManager updateTabOverviewItems];
        [(TabCollectionViewManager *)self->_tabCollectionViewManager updateExplanationViewVisibilityAnimated:1];
      }
      id v38 = [(TabController *)self activeTabDocument];
      -[TabCollectionViewManager updateTabBarAnimated:keepingTabVisible:](self->_tabCollectionViewManager, "updateTabBarAnimated:keepingTabVisible:", 0);
      int v20 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabOverview];
      if ([v20 presentationState] == 2) {
        [v20 resetPresentationScrollPosition];
      }
      id v37 = v20;
      id v21 = objc_loadWeakRetained((id *)&self->_browserController);
      [v21 updateFavoritesForNewDocument];
      [v21 reloadSidebarAnimated:0];
      id v22 = [(TabController *)self startPageBackgroundImageIdentifier];
      [v21 loadBackgroundImageIfNeededForIdentifier:v22];

      if ((v10 & 1) == 0)
      {
        id v35 = v9;
        id v36 = v4;
        [(NSUndoManager *)self->_undoManager removeAllActions];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v23 = self->_documentObservers;
        uint64_t v24 = [(NSHashTable *)v23 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v40 != v26) {
                objc_enumerationMutation(v23);
              }
              long long v28 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              if (objc_opt_respondsToSelector()) {
                [v28 tabController:self didSwitchFromTabGroup:v5];
              }
            }
            uint64_t v25 = [(NSHashTable *)v23 countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v25);
        }

        -[TabController _sendDidEndDocumentUpdates]((uint64_t)self);
        id v9 = v35;
        id v4 = v36;
      }
      if ([v6 isShared]) {
        -[TabController _requestContactsAccessIfNeeded]((uint64_t)self);
      }
      if ([v6 isSyncable])
      {
        long long v29 = [MEMORY[0x1E4F785B0] sharedSiteMetadataManager];
        id v30 = objc_alloc(MEMORY[0x1E4F98EF8]);
        [(TabController *)self tabGroupManager];
        v32 = long long v31 = v13;
        uint64_t v33 = (void *)[v30 initWithTabGroup:v6 tabProvider:v32];
        [v29 preloadRequest:v33 withPriority:0 responseHandler:0];

        id v13 = v31;
      }
      id v34 = -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
      [v34 activeTabGroupDidChange];
    }
  }
}

void __39__TabController_setActiveTabGroupUUID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[7])
  {
    id v3 = [v2 tabGroupManager];
    [v3 beginParticipantPresenceReportingForTabGroupWithUUID:*(void *)(*(void *)(a1 + 32) + 56)];
  }
}

- (void)_updateTabsForTabGroup:(uint64_t)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    -[TabController _sendWillBeginDocumentUpdates](a1);
    id v4 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __40__TabController__updateTabsForTabGroup___block_invoke;
    v52[3] = &unk_1E6D77E20;
    v52[4] = a1;
    id v41 = v4;
    [v4 setHandler:v52];
    id v5 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      uint64_t v7 = [v3 privacyPreservingDescription];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Updating tab documents for %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v9 = [v3 tabsUUIDSet];
    int v10 = [v3 isPrivateBrowsing];
    uint64_t v11 = 16;
    if (v10) {
      uint64_t v11 = 24;
    }
    id v12 = (void *)[*(id *)(a1 + v11) copy];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __40__TabController__updateTabsForTabGroup___block_invoke_434;
    v49[3] = &unk_1E6D78230;
    id v40 = v9;
    id v50 = v40;
    uint64_t v51 = a1;
    id v13 = objc_msgSend(v12, "safari_filterObjectsUsingBlock:", v49);

    uint64_t v14 = [WeakRetained activeWebExtensionWindow];
    [v14 idForWebExtensions];
    double v16 = v15;
    id v17 = (void *)MEMORY[0x1E4F98FC0];
    id v18 = [v14 webExtensionTabs];
    uint64_t v19 = [v17 tabIDToTabPositionDictionaryForTabs:v18];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v20 = v13;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v61 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          [(id)a1 willLoseOwnershipOfTab:v24];
          -[TabController _reuseTabIfNecessary:](a1, v24);
          -[TabController _tabWasAddedToReusableTabs:fromWindowWithID:previousTabPositions:](a1, v24, v19, v16);
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v61 count:16];
      }
      while (v21);
    }

    uint64_t v25 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = v25;
      uint64_t v27 = [v20 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_1E102C000, v26, OS_LOG_TYPE_INFO, "Closing %zu tabs", (uint8_t *)&buf, 0xCu);
    }
    -[TabController _detachTabs:]((id *)a1, v20);
    long long v28 = [v3 tabs];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v57 = 0x3032000000;
    id v58 = __Block_byref_object_copy__10;
    id v59 = __Block_byref_object_dispose__10;
    id v60 = [MEMORY[0x1E4F1CA48] array];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __40__TabController__updateTabsForTabGroup___block_invoke_435;
    v44[3] = &unk_1E6D7CC78;
    v44[4] = a1;
    v44[5] = &buf;
    long long v29 = objc_msgSend(v28, "safari_mapAndFilterObjectsUsingBlock:", v44);
    if (![v28 count] && (objc_msgSend(v3, "isPrivateBrowsing") & 1) == 0)
    {
      id v30 = -[TabDocument initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:]([TabDocument alloc], "initWithTitle:URL:UUID:privateBrowsingEnabled:controlledByAutomation:hibernated:bookmark:browserController:relatedWebView:", 0, 0, 0, 0, -[TabController _controlledByAutomation](a1), 0, 0, WeakRetained, 0);
      [(TabDocument *)v30 setIsBlank:1];
      id v55 = v30;
      uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];

      long long v29 = (void *)v31;
    }
    if ([v29 count])
    {
      uint64_t v32 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = [v29 count];
        *(_DWORD *)long long v53 = 134217984;
        uint64_t v54 = v33;
        _os_log_impl(&dword_1E102C000, v32, OS_LOG_TYPE_INFO, "Inserting %zu tabs", v53, 0xCu);
      }

      uint64_t v34 = [*(id *)(*((void *)&buf + 1) + 40) copy];
      id v35 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v34;

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __40__TabController__updateTabsForTabGroup___block_invoke_437;
      v42[3] = &unk_1E6D77D90;
      v42[4] = a1;
      id v43 = v29;
      id v36 = (void (**)(void))MEMORY[0x1E4E42950](v42);
      id v37 = [*(id *)(a1 + 72) tabOverview];
      id v38 = v37;
      if (v37) {
        [v37 performUpdatesWithoutTabCloseAnimation:v36];
      }
      else {
        v36[2](v36);
      }
      long long v39 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = 0;

      -[TabController _tabDocumentsWereReusedWhenActiveTabGroupChanged:](a1, *(void **)(*((void *)&buf + 1) + 40));
    }
    -[TabController _updateActiveTabForTabGroup:]((void *)a1, v3);
    objc_msgSend(WeakRetained, "setPrivateBrowsingEnabled:", objc_msgSend(v3, "isPrivateBrowsing"));

    _Block_object_dispose(&buf, 8);
  }
}

- (void)_updateActiveTabForTabGroup:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (void *)a1[34];
    id v15 = v3;
    id v5 = [v3 uuid];
    id v6 = [v4 activeTabUUIDForTabGroupWithUUID:v5];

    if ([v15 isSyncable])
    {
      uint64_t v7 = [v15 lastSelectedTabUUID];

      if (v7)
      {
        uint64_t v8 = [v15 lastSelectedTabUUID];

        id v6 = (void *)v8;
      }
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v6];
    int v10 = [a1 tabWithUUID:v9];
    int v11 = [v15 isPrivateBrowsing];
    uint64_t v12 = 2;
    if (v11) {
      uint64_t v12 = 3;
    }
    id v13 = (void *)[(id)a1[v12] copy];
    if (([v13 containsObject:v10] & 1) == 0)
    {
      uint64_t v14 = [v13 lastObject];

      int v10 = (void *)v14;
    }
    [a1 setActiveTab:v10];

    id v3 = v15;
  }
}

- (BOOL)createTabGroupAlertIsPresented
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v3 = [WeakRetained viewControllerToPresentFrom];
  id v4 = [v3 presentedViewController];

  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [v4 role] == 2;

  return v5;
}

- (NSString)moveLocalTabsToNewGroupTitle
{
  id v3 = [(TabController *)self activeTabGroupOrTabGroupVisibleInSwitcher];
  if (([v3 isNamed] & 1) != 0
    || ([v3 isPrivateBrowsing] & 1) != 0
    || ([(TabController *)self activeTabDocument],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 libraryType],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5)
    || ([v3 isEmpty] & 1) != 0)
  {
    id v6 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v9 = [WeakRetained unnamedTabGroup];
    int v10 = [v9 tabs];
    uint64_t v11 = [v10 count];

    uint64_t v12 = NSString;
    id v13 = _WBSLocalizedString();
    id v6 = objc_msgSend(v12, "localizedStringWithFormat:", v13, v11);
  }
  return (NSString *)v6;
}

- (NSString)activeLibraryType
{
  uint64_t v2 = [(TabController *)self activeTabDocument];
  id v3 = [v2 libraryType];

  return (NSString *)v3;
}

- (NSArray)tabGroups
{
  id v3 = [(TabController *)self unnamedTabGroups];
  id v4 = [(TabController *)self namedTabGroups];
  BOOL v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (NSArray)unnamedTabGroups
{
  if (self->_windowState)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    BOOL v5 = [WeakRetained unnamedTabGroup];
    objc_msgSend(v4, "safari_addObjectUnlessNil:", v5);

    if ([WeakRetained isPrivateBrowsingAvailable])
    {
      id v6 = [(WBWindowState *)self->_windowState privateTabGroup];
      [v4 addObject:v6];
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v4;
}

- (NSSet)nonActiveTabGroupsInCurrentBrowsingMode
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v4 = [WeakRetained isPrivateBrowsingEnabled];
  uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
  BOOL v5 = (void *)MEMORY[0x1E4F1CA80];
  if (v4)
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
  }
  else
  {
    tabGroupManager = self->_tabGroupManager;
    uint64_t v8 = [(TabController *)self activeProfileIdentifier];
    id v9 = [(WBTabGroupManager *)tabGroupManager namedTabGroupsForProfileWithIdentifier:v8];
    id v6 = [v5 setWithArray:v9];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v10 = objc_msgSend(WeakRetained, "browserWindowController", WeakRetained);
  uint64_t v11 = [v10 browserControllers];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) tabController];
        id v17 = [v16 windowState];
        id v18 = [v16 activeTabGroup];
        if (v18) {
          [v22 addObject:v18];
        }
        if (v4) {
          [v17 privateTabGroup];
        }
        else {
        uint64_t v19 = [v16 unnamedTabGroup];
        }
        if (v19) {
          [v6 addObject:v19];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  [v6 minusSet:v22];
  return (NSSet *)v6;
}

- (id)existingPersistedTitleForTabDocument:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = [(TabController *)self activeTabGroup];
  id v6 = [v5 tabs];

  uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [v10 uuid];
        uint64_t v12 = [v4 uuid];
        uint64_t v13 = [v12 UUIDString];
        char v14 = [v11 isEqualToString:v13];

        if (v14)
        {
          uint64_t v7 = [v10 title];
          goto LABEL_11;
        }
      }
      uint64_t v7 = (void *)[v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)imageForTabGroup:(id)a3
{
  id v4 = a3;
  if (![(TabController *)self hasMultipleProfiles]
    || ([v4 isNamed] & 1) != 0
    || ([v4 isPrivateBrowsing] & 1) != 0)
  {
    if ([v4 isSyncable])
    {
      int v5 = [v4 isShared];
      id v6 = (void *)MEMORY[0x1E4FB1818];
      if (v5)
      {
        uint64_t v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.on.square.badge.person.crop"];
        uint64_t v8 = v7;
        if (v7)
        {
          id v9 = v7;
        }
        else
        {
          id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.on.square"];
        }
        goto LABEL_17;
      }
      id v15 = @"square.on.square";
    }
    else
    {
      if ([v4 isLocal])
      {
        int v10 = (void *)MEMORY[0x1E4FB1818];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
        uint64_t v12 = [WeakRetained scene];
        uint64_t v13 = objc_msgSend(v10, "safari_currentDeviceImageNameForOrientation:", objc_msgSend(v12, "interfaceOrientation"));
        char v14 = [v10 _systemImageNamed:v13];

        goto LABEL_18;
      }
      if (![v4 isPrivateBrowsing])
      {
        char v14 = 0;
        goto LABEL_18;
      }
      id v6 = (void *)MEMORY[0x1E4FB1818];
      id v15 = @"hand.raised";
    }
    char v14 = [v6 systemImageNamed:v15];
    goto LABEL_18;
  }
  uint64_t v8 = [(TabController *)self activeProfile];
  id v9 = [v8 symbolImage];
LABEL_17:
  char v14 = v9;

LABEL_18:
  return v14;
}

- (id)swipeActionsConfigurationForTabGroup:(id)a3 forPickerSheet:(BOOL)a4
{
  id v6 = a3;
  if ([v6 isNamed])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)MEMORY[0x1E4FB1688];
    id v9 = _WBSLocalizedString();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke;
    v23[3] = &unk_1E6D7CAF0;
    objc_copyWeak(&v25, &location);
    id v10 = v6;
    id v24 = v10;
    BOOL v26 = a4;
    uint64_t v11 = [v8 contextualActionWithStyle:1 title:v9 handler:v23];

    uint64_t v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    [v11 setImage:v12];

    [v7 addObject:v11];
    if ([v10 isNamed])
    {
      uint64_t v13 = _WBSLocalizedString();
      char v14 = (void *)MEMORY[0x1E4FB1688];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_3;
      v19[3] = &unk_1E6D7CAF0;
      objc_copyWeak(&v21, &location);
      id v20 = v10;
      BOOL v22 = a4;
      id v15 = [v14 contextualActionWithStyle:0 title:v13 handler:v19];
      long long v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pencil"];
      [v15 setImage:v16];

      [v7 addObject:v15];
      objc_destroyWeak(&v21);
    }
    long long v17 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v7];
    [v17 setPerformsFirstActionWithFullSwipe:1];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

void __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_2;
    v9[3] = &unk_1E6D7A5D8;
    void v9[4] = WeakRetained;
    id v10 = v5;
    char v11 = *(unsigned char *)(a1 + 48);
    -[TabController _presentCloseAlertForTabGroup:completionHandler:]((uint64_t)v7, v8, v9);
  }
}

void __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_2(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [WeakRetained libraryController];
  id v6 = [v5 sidebarViewController];
  [v6 reloadSectionControllersIfNeeded];

  if (a2)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 72) tabSwitcherViewController];
    [v7 setNeedsApplyContentAnimated:1];
    [v7 applyContentIfNeeded];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!*(unsigned char *)(a1 + 48) && a2)
  {
    id v8 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v8 didUseSidebarAction:4];
  }
}

- (void)_presentCloseAlertForTabGroup:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F98EF0] deleteConfirmationAlertWithTabGroup:v5 manager:*(void *)(a1 + 48) delegate:a1];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v9 = [WeakRetained viewControllerToPresentFrom];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__TabController__presentCloseAlertForTabGroup_completionHandler___block_invoke;
    v10[3] = &unk_1E6D7A660;
    void v10[4] = a1;
    id v11 = v5;
    id v12 = v6;
    [v7 presentFromViewController:v9 withResultHandler:v10];
  }
}

void __69__TabController_swipeActionsConfigurationForTabGroup_forPickerSheet___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    -[TabController _presentRenameAlertForTabGroup:](WeakRetained, *(void **)(a1 + 32));
    v8[2](v8, 1);
    if (!*(unsigned char *)(a1 + 48))
    {
      uint64_t v7 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v7 didUseSidebarAction:3];
    }
  }
}

- (id)swipeActionsConfigurationForTab:(id)a3 inTabGroup:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [v6 url];
  if (v8)
  {
  }
  else
  {
    id v9 = [v7 tabs];
    BOOL v10 = (unint64_t)[v9 count] < 2;

    if (v10)
    {
      id v11 = 0;
      goto LABEL_6;
    }
  }
  id v12 = (void *)MEMORY[0x1E4FB1688];
  uint64_t v13 = _WBSLocalizedString();
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __60__TabController_swipeActionsConfigurationForTab_inTabGroup___block_invoke;
  BOOL v22 = &unk_1E6D7CB18;
  objc_copyWeak(&v25, &location);
  id v23 = v7;
  id v24 = v6;
  char v14 = [v12 contextualActionWithStyle:1 title:v13 handler:&v19];

  id v15 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"trash", v19, v20, v21, v22);
  [v14 setImage:v15];

  long long v16 = (void *)MEMORY[0x1E4FB1CC0];
  v27[0] = v14;
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v11 = [v16 configurationWithActions:v17];

  [v11 setPerformsFirstActionWithFullSwipe:1];
  objc_destroyWeak(&v25);
LABEL_6:
  objc_destroyWeak(&location);

  return v11;
}

void __60__TabController_swipeActionsConfigurationForTab_inTabGroup___block_invoke(void **a1, uint64_t a2, uint64_t a3, void *a4)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained isTabGroupActive:a1[4]])
    {
      id v8 = objc_alloc(MEMORY[0x1E4F29128]);
      id v9 = [a1[5] uuid];
      BOOL v10 = (void *)[v8 initWithUUIDString:v9];
      id v11 = [v7 tabWithUUID:v10];
      [v7 closeTab:v11 animated:0];
    }
    else if ([a1[5] isPinned])
    {
      v16[0] = a1[5];
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v7 closeTabs:v12 inInactiveTabGroup:a1[4]];
    }
    else
    {
      -[TabController _removeTab:fromTabGroup:]((uint64_t)v7, a1[5], a1[4]);
    }
    id v13 = objc_loadWeakRetained(v7 + 1);
    [v13 reloadSidebarAnimated:1];
    char v14 = [v13 libraryController];
    id v15 = [v14 sidebarViewController];
    [v15 reloadSectionControllersIfNeeded];

    v5[2](v5, 1);
  }
}

- (id)menuForTabGroup:(id)a3 variant:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4FB1970];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __41__TabController_menuForTabGroup_variant___block_invoke;
  v11[3] = &unk_1E6D7CB40;
  objc_copyWeak(v13, &location);
  id v8 = v6;
  id v12 = v8;
  v13[1] = (id)a4;
  id v9 = objc_msgSend(v7, "safari_menuWithTitle:image:identifier:options:uncachedChildrenProvider:", &stru_1F3C268E8, 0, 0, 1, v11);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

  return v9;
}

id __41__TabController_menuForTabGroup_variant___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = -[TabController _subMenusForTabGroup:variant:](WeakRetained, *(void **)(a1 + 32), *(void *)(a1 + 48));

  return v3;
}

- (id)_subMenusForTabGroup:(uint64_t)a3 variant:
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v49 = a2;
  if (a1)
  {
    long long v48 = a1;
    objc_initWeak(&location, a1);
    if ([v49 isPrivateBrowsing])
    {
      id v5 = +[Application sharedApplication];
      char v6 = [v5 isPrivateBrowsingLocked];

      if (v6)
      {
        id v44 = (id)MEMORY[0x1E4F1CBF0];
LABEL_27:
        objc_destroyWeak(&location);
        goto LABEL_28;
      }
    }
    BOOL v46 = a3 != 0;
    id v44 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = [MEMORY[0x1E4F1CA48] array];
    id v7 = -[TabController _shareActionForTabGroup:](a1, v49);
    objc_msgSend(v45, "safari_addObjectUnlessNil:", v7);

    id v8 = (void *)-[TabController _copyLinksActionForTabGroup:forPickerSheet:]((uint64_t)a1, v49, a3 != 0);
    objc_msgSend(v45, "safari_addObjectUnlessNil:", v8);

    if ([v45 count])
    {
      id v9 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v45];
      [v44 addObject:v9];
    }
    if ([v49 isNamed])
    {
      BOOL v10 = [MEMORY[0x1E4F1CA48] array];
      id v11 = -[TabController _renameActionForTabGroup:forPickerSheet:](a1, v49, a3 != 0);
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v11);

      id v12 = -[TabController _deleteActionForTabGroup:forPickerSheet:]((id *)a1, v49, a3 != 0);
      [v10 addObject:v12];

      id v13 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v10];
      [v44 addObject:v13];
    }
    if ([MEMORY[0x1E4F97EA0] isSafariProfilesEnabled])
    {
      char v14 = +[TabMenuProvider moveMenuForTabGroup:v49 dataSource:a1];
      objc_msgSend(v44, "safari_addObjectUnlessNil:", v14);
    }
    if (a3 == 1)
    {
      long long v47 = [MEMORY[0x1E4F1CA48] array];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v19 = [v49 tabs];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v62 != v21) {
              objc_enumerationMutation(v19);
            }
            id v23 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            id v24 = objc_alloc(MEMORY[0x1E4F29128]);
            id v25 = [v23 uuid];
            BOOL v26 = (void *)[v24 initWithUUIDString:v25];
            uint64_t v27 = [v48 iconForTabUUID:v26];

            uint64_t v28 = (void *)MEMORY[0x1E4FB13F0];
            long long v29 = -[WBTab displayTitle](v23);
            v56[0] = MEMORY[0x1E4F143A8];
            v56[1] = 3221225472;
            v56[2] = __46__TabController__subMenusForTabGroup_variant___block_invoke;
            v56[3] = &unk_1E6D7CB68;
            objc_copyWeak(&v59, &location);
            id v30 = v49;
            BOOL v60 = v46;
            id v57 = v30;
            id v58 = v23;
            uint64_t v31 = [v28 actionWithTitle:v29 image:v27 identifier:0 handler:v56];

            [v47 addObject:v31];
            objc_destroyWeak(&v59);
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v61 objects:v66 count:16];
        }
        while (v20);
      }

      long long v16 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v47];
      [v44 addObject:v16];
    }
    else
    {
      if (a3) {
        goto LABEL_23;
      }
      id v15 = (void *)MEMORY[0x1E4FB1970];
      long long v47 = -[TabController _toggleTabViewActionForTabGroup:]((id *)a1, v49);
      v67[0] = v47;
      long long v16 = -[TabController _toggleSidebarSectionIsExpandedActionForTabGroup:](a1, v49);
      v67[1] = v16;
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      long long v18 = [v15 menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v17];
      [v44 addObject:v18];
    }
LABEL_23:
    if (SFDebugMenuEnabled() && [v49 isSyncable])
    {
      uint64_t v32 = [v49 uuid];
      uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v34 = (void *)MEMORY[0x1E4FB13F0];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __46__TabController__subMenusForTabGroup_variant___block_invoke_2;
      v53[3] = &unk_1E6D7CB90;
      objc_copyWeak(&v55, &location);
      id v35 = v32;
      id v54 = v35;
      id v36 = [v34 actionWithTitle:@"Copy Tab Group Sync Data" image:0 identifier:0 handler:v53];
      [v33 addObject:v36];

      id v37 = (void *)MEMORY[0x1E4FB13F0];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __46__TabController__subMenusForTabGroup_variant___block_invoke_3;
      v50[3] = &unk_1E6D7CB90;
      objc_copyWeak(&v52, &location);
      id v38 = v35;
      id v51 = v38;
      long long v39 = [v37 actionWithTitle:@"Copy Tab Group and Tabs Sync Data" image:0 identifier:0 handler:v50];
      [v33 addObject:v39];

      id v40 = (void *)MEMORY[0x1E4FB1970];
      id v41 = [NSString stringWithFormat:@"Debug UUID %@ (Internal Only)", v38];
      long long v42 = [v40 menuWithTitle:v41 image:0 identifier:0 options:1 children:v33];
      [v44 addObject:v42];

      objc_destroyWeak(&v52);
      objc_destroyWeak(&v55);
    }
    goto LABEL_27;
  }
  id v44 = 0;
LABEL_28:

  return v44;
}

- (id)_shareActionForTabGroup:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1
    && [v3 isNamed]
    && (+[FeatureManager sharedFeatureManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 areSharedTabGroupsEnabled],
        v5,
        v6))
  {
    objc_initWeak(&location, a1);
    id v7 = (void *)MEMORY[0x1E4FB13F0];
    id v8 = _WBSLocalizedString();
    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __41__TabController__shareActionForTabGroup___block_invoke;
    v12[3] = &unk_1E6D7CB90;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    BOOL v10 = [v7 actionWithTitle:v8 image:v9 identifier:0 handler:v12];

    [v10 setAccessibilityIdentifier:@"ShareTabGroupButton"];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (uint64_t)_copyLinksActionForTabGroup:(char)a3 forPickerSheet:
{
  id v5 = a2;
  int v6 = v5;
  if (a1 && [v5 hasTextForPasteboard])
  {
    [v6 tabCountForPasteboard];
    id v7 = _WBSLocalizedString();
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"link"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __60__TabController__copyLinksActionForTabGroup_forPickerSheet___block_invoke;
    v12[3] = &unk_1E6D7C670;
    id v13 = v6;
    char v14 = a3;
    uint64_t v10 = [v8 actionWithTitle:v7 image:v9 identifier:0 handler:v12];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_renameActionForTabGroup:(char)a3 forPickerSheet:
{
  id v5 = a2;
  int v6 = v5;
  if (a1 && [v5 isNamed])
  {
    id v7 = _WBSLocalizedString();
    objc_initWeak(&location, a1);
    id v8 = (void *)MEMORY[0x1E4FB13F0];
    id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pencil"];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    char v14 = __57__TabController__renameActionForTabGroup_forPickerSheet___block_invoke;
    id v15 = &unk_1E6D7CBE0;
    objc_copyWeak(&v17, &location);
    id v16 = v6;
    char v18 = a3;
    uint64_t v10 = [v8 actionWithTitle:v7 image:v9 identifier:0 handler:&v12];

    objc_msgSend(v10, "setAccessibilityIdentifier:", @"RenameTabGroupButton", v12, v13, v14, v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_deleteActionForTabGroup:(char)a3 forPickerSheet:
{
  id v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    int v6 = _WBSLocalizedString();
    id v7 = [a1[6] shareRecordForTabGroup:v5];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 currentUserParticipant];
      uint64_t v10 = [v9 role];

      if (v10 != 1)
      {
        uint64_t v11 = _WBSLocalizedString();

        int v6 = (void *)v11;
      }
    }
    uint64_t v12 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    char v18 = __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke;
    uint64_t v19 = &unk_1E6D7CBE0;
    objc_copyWeak(&v21, &location);
    id v20 = v5;
    char v22 = a3;
    char v14 = [v12 actionWithTitle:v6 image:v13 identifier:0 handler:&v16];

    objc_msgSend(v14, "setAttributes:", 2, v16, v17, v18, v19);
    [v14 setAccessibilityIdentifier:@"DeleteTabGroupButton"];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)_toggleTabViewActionForTabGroup:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v4 = (void *)MEMORY[0x1E4FB13F0];
    if ([a1[9] isShowingTabView]
      && [a1 isTabGroupActive:v3])
    {
      id v5 = _WBSLocalizedString();
      int v6 = 0;
      int v7 = 1;
    }
    else
    {
      id v5 = _WBSLocalizedString();
      int v7 = 0;
      int v6 = 1;
    }
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.on.square"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __49__TabController__toggleTabViewActionForTabGroup___block_invoke;
    v11[3] = &unk_1E6D7CB90;
    objc_copyWeak(&v13, &location);
    id v12 = v3;
    id v9 = [v4 actionWithTitle:v5 image:v8 identifier:0 handler:v11];

    if (v6) {
    if (v7)
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_toggleSidebarSectionIsExpandedActionForTabGroup:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 uuid];
    [a1 isTabGroupUUIDExpanded:v5];

    int v6 = _WBSLocalizedString();
    objc_initWeak(&location, a1);
    int v7 = (void *)MEMORY[0x1E4FB13F0];
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.grid.1x2"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __66__TabController__toggleSidebarSectionIsExpandedActionForTabGroup___block_invoke;
    v11[3] = &unk_1E6D7CB90;
    objc_copyWeak(&v13, &location);
    id v12 = v4;
    id v9 = [v7 actionWithTitle:v6 image:v8 identifier:0 handler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __46__TabController__subMenusForTabGroup_variant___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_12;
  }
  uint64_t v11 = WeakRetained;
  if (([WeakRetained isTabGroupActive:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v3 = objc_loadWeakRetained(v11 + 1);
    id v4 = [v3 rootViewController];
    int v5 = [v4 usingLoweredBar];

    if (v5)
    {
      int v6 = [MEMORY[0x1E4F97E48] sharedLogger];
      int v7 = v6;
    }
    else
    {
      int v8 = *(unsigned __int8 *)(a1 + 56);
      int v6 = [MEMORY[0x1E4F97E48] sharedLogger];
      int v7 = v6;
      if (!v8)
      {
        uint64_t v9 = 1;
        goto LABEL_8;
      }
    }
    uint64_t v9 = 4;
LABEL_8:
    [v6 didSwitchToTabGroupFromLocation:v9];
  }
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v10 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v10 didUseSidebarAction:15];
  }
  -[TabController _switchToTab:orTabUUID:inTabGroup:](v11, *(void **)(a1 + 40), 0, *(void **)(a1 + 32));
  id WeakRetained = v11;
LABEL_12:
}

- (BOOL)_switchToTab:(void *)a3 orTabUUID:(void *)a4 inTabGroup:
{
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    BOOL v15 = 0;
    goto LABEL_12;
  }
  uint64_t v9 = [a4 uuid];
  [a1 setActiveTabGroupUUID:v9];

  id WeakRetained = objc_loadWeakRetained(a1 + 1);
  [WeakRetained dismissTransientUIAnimated:1 options:2];
  if (v7)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F29128]);
    id v12 = [v7 uuid];
    id v13 = (id)[v11 initWithUUIDString:v12];

    if (v13)
    {
LABEL_4:
      char v14 = [a1 tabWithUUID:v13];
      BOOL v15 = v14 != 0;
      if (v14) {
        [a1 setActiveTab:v14];
      }
      if ([a1[9] isShowingTabView]) {
        [WeakRetained toggleTabView];
      }

      goto LABEL_11;
    }
  }
  else
  {
    id v13 = v8;
    if (v13) {
      goto LABEL_4;
    }
  }
  BOOL v15 = 0;
LABEL_11:

LABEL_12:
  return v15;
}

void __46__TabController__subMenusForTabGroup_variant___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v6 = WeakRetained;
    id v3 = [WeakRetained[6] tabGroupWithUUID:*(void *)(a1 + 32)];
    id v4 = [v3 debugSyncDescription];
    int v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v5 setString:v4];

    id WeakRetained = v6;
  }
}

void __46__TabController__subMenusForTabGroup_variant___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v6 = WeakRetained;
    id v3 = [WeakRetained[6] tabGroupWithUUID:*(void *)(a1 + 32)];
    id v4 = [v3 debugRecursiveSyncDescription];
    int v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    [v5 setString:v4];

    id WeakRetained = v6;
  }
}

- (id)contextMenuConfigurationForTabGroup:(id)a3 variant:(int64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = (void *)MEMORY[0x1E4FB1678];
  id v8 = [v6 uuid];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __61__TabController_contextMenuConfigurationForTabGroup_variant___block_invoke;
  v12[3] = &unk_1E6D7CBB8;
  objc_copyWeak(v14, &location);
  id v9 = v6;
  id v13 = v9;
  v14[1] = (id)a4;
  uint64_t v10 = [v7 configurationWithIdentifier:v8 previewProvider:0 actionProvider:v12];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);

  return v10;
}

id __61__TabController_contextMenuConfigurationForTabGroup_variant___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained menuForTabGroup:*(void *)(a1 + 32) variant:*(void *)(a1 + 48)];

  return v3;
}

- (id)contextMenuConfigurationForTab:(id)a3 inTabGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F29128]);
  id v9 = [v6 uuid];
  uint64_t v10 = (void *)[v8 initWithUUIDString:v9];
  id v11 = [(TabController *)self tabWithUUID:v10];

  if (v11)
  {
    if ([v11 isActive]) {
      uint64_t v12 = 4470;
    }
    else {
      uint64_t v12 = 4402;
    }
    uint64_t v13 = +[TabMenuProvider actionProviderForTab:v11 dataSource:self options:v12];
  }
  else
  {
    uint64_t v13 = +[TabMenuProvider actionProviderForTabGroupTab:v6 inTabGroup:v7 dataSource:self options:4470];
  }
  char v14 = (void *)v13;
  if (v13)
  {
    BOOL v15 = (void *)MEMORY[0x1E4FB1678];
    uint64_t v16 = [v6 uuid];
    uint64_t v17 = [v15 configurationWithIdentifier:v16 previewProvider:0 actionProvider:v14];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

void __41__TabController__shareActionForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  int v5 = *(void **)(a1 + 32);
  id v6 = [v4 sender];

  -[TabController _presentShareSheetForTabGroup:sender:](WeakRetained, v5, v6);
}

void __60__TabController__copyLinksActionForTabGroup_forPickerSheet___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  objc_msgSend(v2, "safari_copyLinksForTabGroup:", *(void *)(a1 + 32));

  id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v3 didSendTabGroup];

  if (!*(unsigned char *)(a1 + 40))
  {
    id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v4 didUseSidebarAction:12];
  }
}

void __57__TabController__renameActionForTabGroup_forPickerSheet___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    -[TabController _presentRenameAlertForTabGroup:](WeakRetained, *(void **)(a1 + 32));
    id WeakRetained = v4;
    if (!*(unsigned char *)(a1 + 48))
    {
      id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v3 didUseSidebarAction:3];

      id WeakRetained = v4;
    }
  }
}

void __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke_2;
    v5[3] = &__block_descriptor_33_e8_v12__0B8l;
    char v6 = *(unsigned char *)(a1 + 48);
    -[TabController _presentCloseAlertForTabGroup:completionHandler:]((uint64_t)WeakRetained, v4, v5);
  }
}

void __57__TabController__deleteActionForTabGroup_forPickerSheet___block_invoke_2(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = a2 == 0;
  }
  if (!v2)
  {
    id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v3 didUseSidebarAction:4];
  }
}

void __49__TabController__toggleTabViewActionForTabGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v3 didUseSidebarAction:14];

    if (([v9 isTabGroupActive:*(void *)(a1 + 32)] & 1) == 0)
    {
      id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v4 didSwitchToTabGroupFromLocation:1];
    }
    if ([v9 isTabGroupActive:*(void *)(a1 + 32)])
    {
      int v5 = [*(id *)(a1 + 32) uuid];
      [v9 setActiveTabGroupUUID:v5];
    }
    else
    {
      char v6 = [v9[9] isShowingTabView];
      id v7 = [*(id *)(a1 + 32) uuid];
      [v9 setActiveTabGroupUUID:v7];

      id WeakRetained = v9;
      if (v6) {
        goto LABEL_8;
      }
    }
    id v8 = objc_loadWeakRetained(v9 + 1);
    [v8 toggleTabView];

    id WeakRetained = v9;
  }
LABEL_8:
}

void __66__TabController__toggleSidebarSectionIsExpandedActionForTabGroup___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v2 = [*(id *)(a1 + 32) uuid];
    [WeakRetained toggleTabGroupUUIDExpanded:v2];

    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    id v4 = [v3 libraryController];
    [v4 reloadExpansionStateForTabGroup:*(void *)(a1 + 32)];
  }
}

- (BOOL)isTabUUIDActive:(id)a3
{
  id v4 = a3;
  int v5 = [(TabController *)self activeTabDocument];
  char v6 = [v5 uuid];
  id v7 = [v6 UUIDString];
  char v8 = [v7 isEqualToString:v4];

  return v8;
}

- (BOOL)isTabGroupUUIDExpanded:(id)a3
{
  return [(NSMutableArray *)self->_expandedTabGroupUUIDs containsObject:a3];
}

- (void)toggleTabGroupUUIDExpanded:(id)a3
{
  expandedTabGroupUUIDs = self->_expandedTabGroupUUIDs;
  id v5 = a3;
  int v6 = [(NSMutableArray *)expandedTabGroupUUIDs containsObject:v5];
  id v7 = self->_expandedTabGroupUUIDs;
  if (v6) {
    [(NSMutableArray *)v7 removeObject:v5];
  }
  else {
    [(NSMutableArray *)v7 addObject:v5];
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  char v8 = [WeakRetained libraryController];
  id v9 = [v8 sidebarViewController];
  [v9 setNeedsUpdateSelection];
}

- (id)iconForTabUUID:(id)a3
{
  id v4 = a3;
  id v5 = +[WBReusableTabManager sharedManager];
  int v6 = [v5 faviconForUUID:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    char v8 = [(TabController *)self tabWithUUID:v4];
    if (!v8)
    {
      id v9 = [(TabController *)self alternateTabs];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __32__TabController_iconForTabUUID___block_invoke;
      v12[3] = &unk_1E6D78C60;
      id v13 = v4;
      char v8 = objc_msgSend(v9, "safari_firstObjectPassingTest:", v12);
    }
    uint64_t v10 = [v8 tabCollectionItem];
    id v7 = [v10 icon];
  }
  return v7;
}

uint64_t __32__TabController_iconForTabUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)dragItemForTab:(id)a3 tabItem:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1710];
  p_browserController = &self->_browserController;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  uint64_t v10 = objc_msgSend(v5, "safari_itemWithTab:tabItem:browserController:", v8, v7, WeakRetained);

  return v10;
}

- (void)moveTab:(id)a3 fromTabGroupWithUUID:(id)a4 toTabGroupWithUUID:(id)a5 afterTab:(id)a6
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = [(TabController *)self tabGroupWithUUID:a4];
  char v14 = [(TabController *)self tabGroupWithUUID:v12];

  LODWORD(v12) = [v13 isPrivateBrowsing];
  if (v12 == [v14 isPrivateBrowsing])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    if (WBSIsEqual())
    {
      uint64_t v16 = [v14 tabs];
      uint64_t v17 = [v16 indexOfObject:v11];
      if (v17 != [v16 indexOfObject:v10])
      {
        tabGroupManager = self->_tabGroupManager;
        uint64_t v19 = [v14 uuid];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __74__TabController_moveTab_fromTabGroupWithUUID_toTabGroupWithUUID_afterTab___block_invoke;
        v23[3] = &unk_1E6D7C488;
        id v24 = v10;
        id v25 = v11;
        [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v19 persist:1 usingBlock:v23];

        [WeakRetained reloadSidebarAnimated:0];
      }
    }
    else
    {
      v27[0] = v10;
      id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      -[TabController updateLastSelectedTabUUIDForClosingWBTabs:]((uint64_t)self, v20);

      id v21 = self->_tabGroupManager;
      id v26 = v10;
      char v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [(WBTabGroupManager *)v21 moveTabs:v22 toTabGroup:v14 afterTab:v11 withoutPersistingTabGroupsWithUUIDStrings:0];

      [WeakRetained reloadSidebarAnimated:0];
      uint64_t v16 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v16 reportTabUpdatedWithUpdateType:8];
    }
  }
}

uint64_t __74__TabController_moveTab_fromTabGroupWithUUID_toTabGroupWithUUID_afterTab___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reorderTab:*(void *)(a1 + 32) afterTab:*(void *)(a1 + 40)];
}

- (BOOL)moveTabWithUUID:(id)a3 fromForeignLocalGroupWithUUIDIntoActiveGroup:(id)a4
{
  id v6 = a3;
  id v7 = -[TabController _foreignLocalTabGroupWithUUID:]((id *)&self->super.isa, a4);
  id v8 = v7;
  if (v7)
  {
    int v9 = [v7 isPrivateBrowsing];
    id v10 = [(TabController *)self activeTabGroup];
    int v11 = [v10 isPrivateBrowsing];

    if (v9 != v11)
    {
      if (v9) {
        [(TabController *)self selectPrivateTabGroup];
      }
      else {
        [(TabController *)self selectLocalTabGroup];
      }
    }
    id v13 = [v8 tabWithUUID:v6];
    BOOL v12 = v13 != 0;
    if (v13)
    {
      char v14 = [v8 uuid];
      [(TabController *)self moveTab:v13 fromTabGroupWithUUID:v14 toTabGroupWithUUID:self->_activeTabGroupUUID afterTab:0];

      BOOL v15 = -[TabController _tabForWBTab:]((id *)&self->super.isa, v13);
      [(TabController *)self insertTab:v15 afterTab:0 inBackground:0 animated:0];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_tabForWBTab:(id *)a1
{
  if (a1)
  {
    -[TabController _tabForWBTab:didReuseTabDocument:](a1, a2, 0);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (NSArray)allSyntheticBookmarkFolders
{
  return (NSArray *)[(TabController *)self syntheticBookmarkFoldersIncludingActiveTabGroup:1];
}

- (id)syntheticBookmarkFoldersIncludingActiveTabGroup:(BOOL)a3
{
  id v5 = [(TabController *)self namedTabGroups];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__TabController_syntheticBookmarkFoldersIncludingActiveTabGroup___block_invoke;
  v8[3] = &unk_1E6D7CC28;
  BOOL v9 = a3;
  void v8[4] = self;
  id v6 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v8);

  return v6;
}

id __65__TabController_syntheticBookmarkFoldersIncludingActiveTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40) || ([*(id *)(a1 + 32) isTabGroupActive:v3] & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 32) syntheticBookmarkFolderForTabGroup:v3 withAttribution:0];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)syntheticBookmarkFolderForTabGroup:(id)a3 withAttribution:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(WBTabGroupManager *)self->_tabGroupManager topScopedBookmarkListForTabGroup:v6];
  if (v7)
  {
    id v8 = [v6 displayTitle];
    BOOL v9 = v8;
    if (a4)
    {
      id v10 = NSString;
      int v11 = _WBSLocalizedString();
      objc_msgSend(v10, "stringWithFormat:", v11, v9);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v12 = v8;
    }

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F3AEC8]) initWithBookmarkList:v7 title:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)perTabGroupBookmarkListForFolderID:(int)a3 filteredUsingString:(id)a4
{
  return (id)[(WBTabGroupManager *)self->_tabGroupManager scopedBookmarkListWithID:*(void *)&a3 filteredUsingString:a4];
}

- (id)topScopedBookmarkListForActiveTabGroup
{
  tabGroupManager = self->_tabGroupManager;
  id v3 = [(TabController *)self activeTabGroup];
  uint64_t v4 = [(WBTabGroupManager *)tabGroupManager topScopedBookmarkListForTabGroup:v3];

  return v4;
}

- (void)insertPerTabGroupBookmark:(id)a3 inPerTabGroupBookmarkFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  tabGroupManager = self->_tabGroupManager;
  id v7 = a3;
  id v12 = [(WBTabGroupManager *)tabGroupManager scopedBookmarkListWithID:v4 filteredUsingString:0];
  id v8 = self->_tabGroupManager;
  BOOL v9 = [v12 bookmarkArray];
  id v10 = [v9 lastObject];
  int v11 = [v10 UUID];
  [(WBTabGroupManager *)v8 insertScopedBookmark:v7 inScopedBookmarkFolderWithID:v4 afterBookmarkWithUUID:v11 notify:1];
}

- (id)copyBookmark:(id)a3 toPerTabGroupBookmarkFolderWithID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (objc_class *)MEMORY[0x1E4FB60E0];
  id v7 = a3;
  id v8 = [v6 alloc];
  BOOL v9 = [v7 title];
  id v10 = [v7 address];
  int v11 = [v7 deviceIdentifier];

  id v12 = (void *)[v8 initWithTitle:v9 address:v10 parentID:v4 subtype:1 deviceIdentifier:v11 collectionType:1];
  [(TabController *)self insertPerTabGroupBookmark:v12 inPerTabGroupBookmarkFolderWithID:v4];
  return v12;
}

- (void)reorderScopedBookmarkWithUUID:(id)a3 afterBookmarkWithUUID:(id)a4 notify:(BOOL)a5
{
}

- (void)updateScopedBookmarkWithUUID:(id)a3 title:(id)a4 address:(id)a5
{
}

- (void)deleteScopedBookmarkWithUUID:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)hasActiveLibrary
{
  uint64_t v2 = [(TabController *)self activeLibraryType];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasNamedTabGroups
{
  uint64_t v2 = [(TabController *)self namedTabGroups];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)openInTabGroupMenuWithNewTabGroupName:(id)a3 URL:(id)a4 descendantCount:(int64_t)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  if ([(TabController *)self isPrivateBrowsingEnabled])
  {
    id v13 = 0;
  }
  else
  {
    char v14 = objc_msgSend(v11, "safari_userVisibleHostWithoutWWWSubdomain");
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__TabController_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke;
    v20[3] = &unk_1E6D7CC50;
    objc_copyWeak(&v22, &location);
    id v21 = v12;
    id v13 = [(TabController *)self tabGroupsMenuElementsWithOptions:20 newTabGroupName:v10 hostTitle:v14 descendantCount:a5 movingSelectedTabs:0 actionHandler:v20];

    objc_destroyWeak(&v22);
  }
  BOOL v15 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v16 = _WBSLocalizedString();
  uint64_t v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
  char v18 = [v15 menuWithTitle:v16 image:v17 identifier:0 options:0 children:v13];

  objc_destroyWeak(&location);
  return v18;
}

void __83__TabController_openInTabGroupMenuWithNewTabGroupName_URL_descendantCount_handler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained removeSingleBlankTabFromInactiveTabGroup:v7];
    id v5 = [v7 uuid];
    [v4 setActiveTabGroupUUID:v5];

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }
}

- (void)switchOutOfSyncedTabGroup
{
  BOOL v3 = [(TabController *)self activeTabGroup];
  int v4 = [v3 isNamed];

  if (v4)
  {
    [(TabController *)self selectLocalTabGroup];
  }
}

- (BOOL)switchToTabWithUUID:(id)a3 inTabGroupWithUUID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(TabController *)self tabGroups];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v19 = v6;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        char v14 = [v13 uuid];
        BOOL v15 = [v7 UUIDString];
        char v16 = [v14 isEqualToString:v15];

        if (v16)
        {
          id v6 = v19;
          BOOL v17 = -[TabController _switchToTab:orTabUUID:inTabGroup:]((id *)&self->super.isa, 0, v19, v13);
          goto LABEL_12;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    BOOL v17 = 0;
    id v6 = v19;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_12:

  return v17;
}

- (id)_urlForActiveTabInTabGroup:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    BOOL v3 = (void *)a1[34];
    int v4 = [a2 uuid];
    id v5 = [v3 activeTabUUIDForTabGroupWithUUID:v4];

    if (v5)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
      id v7 = [v2 tabWithUUID:v6];
      id v2 = [v7 url];
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

- (void)evictTabDocument:(id)a3
{
  ++self->_updateTabsSuppressionCount;
  id v4 = a3;
  [v4 setClosed:1];
  [v4 willClose];

  --self->_updateTabsSuppressionCount;
}

- (void)closeTabGroup:(id)a3
{
}

uint64_t __65__TabController__presentCloseAlertForTabGroup_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    -[TabController _closeTabGroup:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_selectNewTabGroupIfNecessaryBeforeClosingTabGroup:(void *)a1
{
  id v3 = a2;
  if (a1 && [a1 isTabGroupActive:v3])
  {
    id v4 = [a1 tabGroups];
    uint64_t v5 = [v4 indexOfObject:v3];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[TabController _selectNewTabGroupIfNecessaryBeforeClosingTabGroup:](v6);
      }
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = v5;
      if (v5 + 1 < (unint64_t)[v4 count]) {
        uint64_t v7 = v8 + 1;
      }
      else {
        uint64_t v7 = v8 - 1;
      }
    }
    uint64_t v9 = [v4 objectAtIndexedSubscript:v7];
    if ([v9 isPrivateBrowsing])
    {
      uint64_t v10 = [a1 unnamedTabGroup];

      uint64_t v9 = (void *)v10;
    }
    uint64_t v11 = [v9 uuid];
    [a1 setActiveTabGroupUUID:v11];
  }
}

- (void)createNewTabGroup
{
}

- (void)renameTabGroup:(id)a3
{
}

- (void)moveTab:(id)a3 toTabGroupWithUUID:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(TabController *)self tabGroupWithUUID:a4];
  int v8 = [v6 isPrivate];
  if (v8 == [v7 isPrivateBrowsing]
    && ![(TabController *)self isTabGroupActive:v7])
  {
    [(TabController *)self removeSingleBlankTabFromInactiveTabGroup:v7];
    uint64_t v9 = [v6 webExtensionWindow];
    uint64_t v10 = [v9 webExtensionTabs];
    uint64_t v11 = [v10 indexOfObject:v6];

    [v9 idForWebExtensions];
    double v13 = v12;
    -[TabController _reuseTabIfNecessary:]((uint64_t)self, v6);
    char v14 = [v6 webExtensionsController];
    [v14 didMoveTab:v6 fromWindowWithID:v11 indexInOldWindow:v13];

    if ([v6 isPinned])
    {
      pinnedTabsManager = self->_pinnedTabsManager;
      char v16 = [v6 uuid];
      BOOL v17 = [v16 UUIDString];
      [(PinnedTabsManager *)pinnedTabsManager removeTabWithUUID:v17 persist:0];

      id v18 = [v6 wbTab];
      if ([v7 usesGlobalPinnedTabs])
      {
        tabGroupManager = self->_tabGroupManager;
        long long v20 = [v18 tabGroupUUID];
        uint64_t v37 = MEMORY[0x1E4F143A8];
        uint64_t v38 = 3221225472;
        long long v39 = __44__TabController_moveTab_toTabGroupWithUUID___block_invoke;
        id v40 = &unk_1E6D7C290;
        id v18 = v18;
        id v41 = v18;
        [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v20 persist:1 usingBlock:&v37];

        id v21 = objc_alloc(MEMORY[0x1E4FB6078]);
        long long v22 = objc_msgSend(v6, "uuid", v37, v38, v39, v40);
        long long v23 = [v22 UUIDString];
        id v24 = [v18 deviceIdentifier];
        uint64_t v25 = (void *)[v21 initWithUUID:v23 deviceIdentifier:v24];

        id v26 = [v6 tabUpdateBlock];
        ((void (**)(void, void *))v26)[2](v26, v25);

        uint64_t v27 = self->_pinnedTabsManager;
        uint64_t v28 = -[TabController _containerForPinnedTabsInTabGroup:](self, v7);
        [(PinnedTabsManager *)v27 appendTab:v25 inContainer:v28];

        long long v29 = v41;
LABEL_9:

        -[TabController _forceUpdateTabGroupTitleIfNeeded:]((id *)&self->super.isa, v7);
        id v36 = [MEMORY[0x1E4F97E48] sharedLogger];
        [v36 reportTabUpdatedWithUpdateType:8];

        goto LABEL_10;
      }
      uint64_t v33 = self->_pinnedTabsManager;
      uint64_t v34 = [v18 uuid];
      [(PinnedTabsManager *)v33 removeTabWithUUID:v34 persist:1];

      id v35 = self->_tabGroupManager;
      v43[0] = v18;
      long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      uint64_t v31 = [v7 lastPinnedTab];
      [(WBTabGroupManager *)v35 moveTabs:v29 toTabGroup:v7 afterTab:v31 withoutPersistingTabGroupsWithUUIDStrings:0];
    }
    else
    {
      id v30 = self->_tabGroupManager;
      id v18 = [v6 wbTab];
      id v42 = v18;
      long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      uint64_t v31 = [v7 tabs];
      uint64_t v32 = [v31 lastObject];
      [(WBTabGroupManager *)v30 moveTabs:v29 toTabGroup:v7 afterTab:v32 withoutPersistingTabGroupsWithUUIDStrings:0];
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_reuseTabIfNecessary:(uint64_t)a1
{
  id v5 = a2;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v5;
      id v4 = +[WBReusableTabManager sharedManager];
      [v4 addReusableTab:v3];
    }
  }
}

void __44__TabController_moveTab_toTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);
}

- (void)moveTabGroup:(id)a3 beforeOrAfterTabGroup:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  tabGroupManager = self->_tabGroupManager;
  int v8 = [(TabController *)self activeProfileIdentifier];
  uint64_t v9 = [(WBTabGroupManager *)tabGroupManager namedTabGroupsForProfileWithIdentifier:v8];

  id v10 = v6;
  unint64_t v11 = [v9 indexOfObject:v10];
  unint64_t v12 = [v9 indexOfObject:v14];
  double v13 = v10;
  if (v11 < v12)
  {
    if (v11)
    {
      double v13 = [v9 objectAtIndexedSubscript:v11 - 1];
    }
    else
    {
      double v13 = 0;
    }
  }
  if (v11 != v12)
  {
    self->_suppressSidebarReloadAnimation = 1;
    [(WBTabGroupManager *)self->_tabGroupManager moveTabGroup:v14 afterTabGroup:v13];
    self->_suppressSidebarReloadAnimation = 0;
  }
}

- (void)moveTabGroup:(id)a3 toProfile:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[TabController _selectNewTabGroupIfNecessaryBeforeClosingTabGroup:](self, v7);
  tabGroupManager = self->_tabGroupManager;
  id v9 = [v6 identifier];

  [(WBTabGroupManager *)tabGroupManager moveTabGroup:v7 toProfileWithIdentifier:v9 afterTabGroup:0];
}

- (void)_tabWasAddedToReusableTabs:(void *)a3 fromWindowWithID:(double)a4 previousTabPositions:
{
  id v13 = a2;
  id v7 = a3;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v13;
      id v9 = (void *)MEMORY[0x1E4F28ED0];
      [v8 idForWebExtensions];
      id v10 = objc_msgSend(v9, "numberWithDouble:");
      unint64_t v11 = [v7 objectForKeyedSubscript:v10];

      if (v11)
      {
        unint64_t v12 = [v8 webExtensionsController];
        objc_msgSend(v12, "didMoveTab:fromWindowWithID:indexInOldWindow:", v8, objc_msgSend(v11, "index"), a4);
      }
    }
  }
}

- (void)_tabDocumentsWereReusedWhenActiveTabGroupChanged:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      double v8 = *MEMORY[0x1E4F99788];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
          if (v10 != *(void *)(a1 + 32))
          {
            unint64_t v11 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) webExtensionsController];
            [v11 didMoveTab:v10 fromWindowWithID:0 indexInOldWindow:v8];
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

void __40__TabController__updateTabsForTabGroup___block_invoke(uint64_t a1)
{
}

BOOL __40__TabController__updateTabsForTabGroup___block_invoke_434(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 uuid];
  BOOL v6 = ([v4 containsObject:v5] & 1) == 0 && *(void *)(*(void *)(a1 + 40) + 32) != (void)v3;

  return v6;
}

id __40__TabController__updateTabsForTabGroup___block_invoke_435(uint64_t a1, void *a2)
{
  char v5 = 0;
  id v3 = -[TabController _tabForWBTab:didReuseTabDocument:](*(id **)(a1 + 32), a2, &v5);
  if (v5) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
  return v3;
}

- (id)_tabForWBTab:(unsigned char *)a3 didReuseTabDocument:
{
  id v5 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    id v7 = objc_alloc(MEMORY[0x1E4F29128]);
    double v8 = [v5 uuid];
    uint64_t v9 = (void *)[v7 initWithUUIDString:v8];

    uint64_t v10 = +[WBReusableTabManager sharedManager];
    unint64_t v11 = [v10 reuseTabForUUID:v9];

    if (v11)
    {
      [v11 setBrowserController:WeakRetained afterTabGroupReuse:1];
      [v11 restoreStateFromTab:v5];
      if (a3) {
        *a3 = 1;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = [a1 tabWithUUID:v9];
      if (!v12)
      {
        long long v13 = [MEMORY[0x1E4F78290] sharedFeatureManager];
        int v14 = [v13 allowsUnlimitedTabs];

        if (v14)
        {
          long long v15 = [[HibernatedTab alloc] initWithWBTab:v5 browserController:WeakRetained];
        }
        else
        {
          if ([v5 isPinned] && !objc_msgSend(v5, "isSyncable"))
          {
            uint64_t v17 = [a1[35] privatePinnedTabs];
            uint64_t v16 = [v17 containsObject:v5];
          }
          else
          {
            uint64_t v16 = [v5 isPrivateBrowsing];
          }
          long long v15 = [[TabDocument alloc] initWithTabGroupTab:v5 privateBrowsingEnabled:v16 hibernated:1 bookmark:0 browserController:WeakRetained];
        }
        id v12 = v15;
      }
      [v12 updateTabIcon];
      if (a3) {
        *a3 = 0;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __40__TabController__updateTabsForTabGroup___block_invoke_437(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertTabs:*(void *)(a1 + 40) beforeTab:0 inBackground:1 animated:1];
}

- (id)moveMenuOnPageMenuWithDismissHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(TabController *)self activeTabDocument];
  BOOL v6 = +[TabMenuProvider moveMenuForTab:v5 dataSource:self showTitle:0 dismissHandler:v4];

  return v6;
}

- (id)tabGroupsMenuElementsWithOptions:(unint64_t)a3 newTabGroupName:(id)a4 hostTitle:(id)a5 descendantCount:(int64_t)a6 movingSelectedTabs:(id)a7 actionHandler:(id)a8
{
  return [(TabController *)self tabGroupsMenuElementsWithOptions:a3 newTabGroupName:a4 hostTitle:a5 descendantCount:a6 movingSelectedTabs:a7 actionHandler:a8 dismissHandler:&__block_literal_global_439];
}

- (id)tabGroupsMenuElementsWithOptions:(unint64_t)a3 newTabGroupName:(id)a4 hostTitle:(id)a5 descendantCount:(int64_t)a6 movingSelectedTabs:(id)a7 actionHandler:(id)a8 dismissHandler:(id)a9
{
  char v13 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v48 = a7;
  id v47 = a8;
  id v46 = a9;
  uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = [MEMORY[0x1E4F1CA48] array];
  id v44 = [MEMORY[0x1E4F1CA48] array];
  if ((v13 & 0x10) != 0)
  {
    id v18 = +[FeatureManager sharedFeatureManager];
    int v19 = [v18 isCustomTabGroupsEnabled];

    if (v19)
    {
      long long v20 = (void *)MEMORY[0x1E4FB13F0];
      id v21 = _WBSLocalizedString();
      long long v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke;
      v57[3] = &unk_1E6D7CCC8;
      id v62 = v46;
      id v58 = v16;
      int64_t v64 = a6;
      id v59 = v15;
      id v60 = v48;
      long long v61 = self;
      id v63 = v47;
      long long v23 = [v20 actionWithTitle:v21 image:v22 identifier:0 handler:v57];

      [v23 setAccessibilityIdentifier:@"NewTabGroupButton"];
      [v17 addObject:v23];
    }
  }
  id v41 = v16;
  id v42 = v15;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [(TabController *)self tabGroups];
  uint64_t v24 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v54 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if ((![(TabController *)self isTabGroupActive:v28]
           || ((v13 & 2) != 0 || ([v28 isLocal] & 1) == 0)
           && ((v13 & 4) != 0 || ([v28 isSyncable] & 1) == 0))
          && ((v13 & 8) != 0 || ([v28 isPrivateBrowsing] & 1) == 0))
        {
          long long v29 = [(TabController *)self imageForTabGroup:v28];
          id v30 = (void *)MEMORY[0x1E4FB13F0];
          uint64_t v31 = [v28 displayTitle];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_3;
          v49[3] = &unk_1E6D7CCF0;
          id v51 = v46;
          id v52 = v47;
          void v49[4] = v28;
          v49[5] = self;
          id v50 = v48;
          uint64_t v32 = [v30 actionWithTitle:v31 image:v29 identifier:0 handler:v49];

          uint64_t v33 = [v28 title];
          [v32 setAccessibilityIdentifier:v33];

          if (v13) {
            objc_msgSend(v32, "setState:", -[TabController isTabGroupActive:](self, "isTabGroupActive:", v28));
          }
          if ([v28 isNamed]) {
            uint64_t v34 = v44;
          }
          else {
            uint64_t v34 = v45;
          }
          [v34 addObject:v32];
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
    }
    while (v25);
  }

  id v35 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v40];
  v65[0] = v35;
  id v36 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v45];
  v65[1] = v36;
  uint64_t v37 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v44];
  v65[2] = v37;
  uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:3];

  return v38;
}

void __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  if ([*(id *)(a1 + 32) length])
  {
    id v4 = *(id *)(a1 + 32);
  }
  else
  {
    _WBSLocalizedString();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = v6 - 1;
  if (*(void *)(a1 + 40))
  {
    if (v6 > 1)
    {
      double v8 = NSString;
      if (v6 != 2)
      {
        uint64_t v10 = _WBSLocalizedString();
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v28 = v7;
        goto LABEL_13;
      }
    }
    else
    {
      double v8 = NSString;
    }
    uint64_t v10 = _WBSLocalizedString();
    uint64_t v11 = *(void *)(a1 + 40);
LABEL_13:
    id v12 = objc_msgSend(v8, "stringWithFormat:", v10, v11, v5, v28);

    char v13 = _WBSLocalizedString();
LABEL_21:
    id v18 = _WBSLocalizedString();
    uint64_t v19 = 11;
    goto LABEL_22;
  }
  if (v6)
  {
    if (v6 > 1)
    {
      uint64_t v9 = NSString;
      if (v6 != 2)
      {
        uint64_t v17 = _WBSLocalizedString();
        uint64_t v27 = v7;
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v9 = NSString;
    }
    uint64_t v17 = _WBSLocalizedString();
LABEL_20:
    id v12 = objc_msgSend(v9, "stringWithFormat:", v17, v5, v27);

    char v13 = _WBSLocalizedString();
    goto LABEL_21;
  }
  if ([*(id *)(a1 + 48) count])
  {
    char v13 = _WBSLocalizedString();
    uint64_t v14 = [*(id *)(a1 + 48) count];
    id v15 = NSString;
    if (v14 == 1)
    {
      id v16 = _WBSLocalizedString();
      objc_msgSend(v15, "stringWithFormat:", v16, v5);
    }
    else
    {
      id v16 = _WBSLocalizedString();
      objc_msgSend(v15, "localizedStringWithFormat:", v16, objc_msgSend(*(id *)(a1 + 48), "count"));
    id v12 = };

    id v18 = _WBSLocalizedString();
    uint64_t v25 = [v3 sender];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 9;
    }
  }
  else
  {
    char v13 = _WBSLocalizedString();
    long long v23 = NSString;
    uint64_t v24 = _WBSLocalizedString();
    id v12 = objc_msgSend(v23, "stringWithFormat:", v24, v5);

    id v18 = _WBSLocalizedString();
    uint64_t v19 = 10;
  }
LABEL_22:
  uint64_t v21 = *(void *)(a1 + 48);
  long long v20 = *(void **)(a1 + 56);
  uint64_t v22 = *(void *)(a1 + 40);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_2;
  v29[3] = &unk_1E6D7CCA0;
  id v31 = *(id *)(a1 + 72);
  id v30 = *(id *)(a1 + 48);
  uint64_t v32 = v19;
  [v20 presentAlertToCreateTabGroupFromTabs:v21 withTitle:v13 message:v12 suggestedName:v22 okActionTitle:v18 completionHandler:v29];
}

void __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    if (*(void *)(a1 + 40) && ![*(id *)(a1 + 32) count]) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    id v4 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v4 didCreateTabGroupFromLocation:*(void *)(a1 + 48) prepopulatedWithTabs:1];

    id v3 = v5;
  }
}

void __140__TabController_tabGroupsMenuElementsWithOptions_newTabGroupName_hostTitle_descendantCount_movingSelectedTabs_actionHandler_dismissHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v19 = a2;
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v5 = [WeakRetained rootViewController];
  int v6 = [v5 usingLoweredBar];

  uint64_t v7 = [v19 sender];
  if (!v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_8;
    }
    id v15 = [v19 sender];
    objc_opt_class();
    char v16 = objc_opt_isKindOfClass();

    if ((v16 & 1) == 0)
    {
LABEL_12:
      if ([*(id *)(a1 + 48) count]) {
        goto LABEL_16;
      }
      id v12 = [MEMORY[0x1E4F97E48] sharedLogger];
      char v13 = v12;
      uint64_t v14 = 10;
      goto LABEL_14;
    }
LABEL_10:
    uint64_t v17 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v17 didSwitchToTabGroupFromLocation:3];

    id v18 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v18 didSelectTabGroupInDropDownMenu];

    if (![*(id *)(a1 + 32) isPrivateBrowsing]) {
      goto LABEL_16;
    }
    char v13 = [MEMORY[0x1E4F97E48] sharedLogger];
    [v13 didSelectStartPrivateWindowInDropDownMenu];
    goto LABEL_15;
  }
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();

  if (v8) {
    goto LABEL_10;
  }
  uint64_t v9 = [v19 sender];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if ((v10 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  id v12 = [MEMORY[0x1E4F97E48] sharedLogger];
  char v13 = v12;
  uint64_t v14 = 5;
LABEL_14:
  [v12 didSwitchToTabGroupFromLocation:v14];
LABEL_15:

LABEL_16:
}

- (id)profilesMenuElementsWithOptions:(unint64_t)a3 movingSelectedTabGroups:(id)a4 actionHandler:(id)a5
{
  char v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v23 = a5;
  uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [(TabController *)self profiles];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ((v5 & 2) != 0
          || (-[TabController _isProfileActive:](self, *(void **)(*((void *)&v26 + 1) + 8 * i)) & 1) == 0)
        {
          id v12 = (void *)MEMORY[0x1E4FB13F0];
          char v13 = [v11 title];
          uint64_t v14 = [v11 symbolImage];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __87__TabController_profilesMenuElementsWithOptions_movingSelectedTabGroups_actionHandler___block_invoke;
          v24[3] = &unk_1E6D7C190;
          id v15 = v23;
          v24[4] = v11;
          id v25 = v15;
          char v16 = [v12 actionWithTitle:v13 image:v14 identifier:0 handler:v24];

          uint64_t v17 = [v11 title];
          [v16 setAccessibilityIdentifier:v17];

          if (v5) {
            objc_msgSend(v16, "setState:", -[TabController _isProfileActive:](self, v11));
          }
          [v22 addObject:v16];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  id v18 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v22];
  id v30 = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];

  return v19;
}

uint64_t __87__TabController_profilesMenuElementsWithOptions_movingSelectedTabGroups_actionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeSingleBlankTabFromInactiveTabGroup:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(TabController *)self isTabGroupActive:v10];
  char v5 = v10;
  if (!v4)
  {
    int v6 = [v10 tabs];
    if ((unint64_t)[v6 count] <= 1)
    {
      uint64_t v7 = [v6 firstObject];
      uint64_t v8 = v7;
      if (v7)
      {
        uint64_t v9 = [v7 url];

        if (!v9) {
          -[TabController _removeTab:fromTabGroup:]((uint64_t)self, v8, v10);
        }
      }
    }
    char v5 = v10;
  }
}

- (void)removeSingleBlankTabFromActiveTabGroup
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(TabController *)self currentTabs];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = [v8 url];

        if (!v9)
        {
          [(TabController *)self closeTab:v8 animated:0];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)openBookmark:(id)a3 inTabGroup:(id)a4
{
}

- (void)_openBookmark:(void *)a3 orURL:(void *)a4 inTabGroup:
{
  unint64_t v17 = a2;
  unint64_t v7 = a3;
  id v8 = a4;
  if (a1 && v17 | v7)
  {
    if ([a1 isTabGroupActive:v8])
    {
      uint64_t v9 = [MEMORY[0x1E4F78598] builder];
      [v9 setPrefersOpenInNewTab:1];
      if (v17) {
        objc_msgSend(v9, "navigationIntentWithBookmark:");
      }
      else {
      uint64_t v15 = [v9 navigationIntentWithURL:v7];
      }
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      [WeakRetained dispatchNavigationIntent:v15];
    }
    else
    {
      [a1 removeSingleBlankTabFromInactiveTabGroup:v8];
      if ([(id)v17 isFolder])
      {
        long long v10 = [MEMORY[0x1E4FB60E8] mainBookmarkCollection];
        long long v11 = objc_msgSend(v10, "listWithID:", objc_msgSend((id)v17, "identifier"));
        long long v12 = [v11 bookmarkArray];

        if ([v12 count])
        {
          unint64_t v13 = 0;
          do
          {
            uint64_t v14 = [v12 objectAtIndexedSubscript:v13];
            -[TabController _openSingleBookmark:orURL:inTabGroup:setActive:](a1, v14, 0, v8, v13 == 0);

            ++v13;
          }
          while (v13 < [v12 count]);
        }
      }
      else
      {
        -[TabController _openSingleBookmark:orURL:inTabGroup:setActive:](a1, (void *)v17, (void *)v7, v8, 1);
      }
      -[TabController _forceUpdateTabGroupTitleIfNeeded:](a1, v8);
    }
  }
}

- (void)openURL:(id)a3 inTabGroup:(id)a4
{
}

- (void)_openSingleBookmark:(void *)a3 orURL:(void *)a4 inTabGroup:(int)a5 setActive:
{
  id v21 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    if (v21)
    {
      long long v11 = [v21 title];
      long long v12 = (void *)MEMORY[0x1E4F1CB10];
      unint64_t v13 = [v21 address];
      id v14 = [v12 URLWithString:v13];
    }
    else
    {
      id v14 = v9;
      long long v11 = &stru_1F3C268E8;
    }
    id v15 = objc_alloc(MEMORY[0x1E4FB60A0]);
    char v16 = [a1 deviceIdentifier];
    unint64_t v17 = (void *)[v15 initWithTitle:v11 url:v14 deviceIdentifier:v16];

    -[TabController _appendTab:toTabGroup:]((uint64_t)a1, v17, v10);
    if (a5)
    {
      id v18 = (void *)a1[34];
      id v19 = [v17 uuid];
      long long v20 = [v10 uuid];
      [v18 setActiveTabUUID:v19 forTabGroupWithUUID:v20];
    }
  }
}

- (void)_appendTab:(void *)a3 toTabGroup:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = *(void **)(a1 + 48);
    unint64_t v7 = [a3 uuid];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__TabController__appendTab_toTabGroup___block_invoke;
    v8[3] = &unk_1E6D7C290;
    id v9 = v5;
    [v6 updateTabsInTabGroupWithUUID:v7 persist:1 usingBlock:v8];
  }
}

void __39__TabController__appendTab_toTabGroup___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)[v2 mutableCopy];
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 appendTabs:v5];
}

void __41__TabController__removeTab_fromTabGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);
}

- (id)browserControllerContainingLocalTabGroupUUID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v6 = [WeakRetained browserWindowController];
  unint64_t v7 = [v6 browserControllers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __62__TabController_browserControllerContainingLocalTabGroupUUID___block_invoke;
  v11[3] = &unk_1E6D77F50;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "safari_firstObjectPassingTest:", v11);

  return v9;
}

uint64_t __62__TabController_browserControllerContainingLocalTabGroupUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 tabController];
  id v4 = [v3 windowState];
  uint64_t v5 = [v4 localTabGroup];
  uint64_t v6 = [v5 uuid];
  unint64_t v7 = [*(id *)(a1 + 32) UUIDString];
  if ([v6 isEqualToString:v7])
  {
    uint64_t v8 = 1;
  }
  else
  {
    id v9 = [v4 privateTabGroup];
    id v10 = [v9 uuid];
    long long v11 = [*(id *)(a1 + 32) UUIDString];
    uint64_t v8 = [v10 isEqualToString:v11];
  }
  return v8;
}

- (void)registerTabGroupManagerObserver:(id)a3
{
}

- (BOOL)scrollTabSwitcherToTabGroupIfShowing:(id)a3
{
  id v4 = a3;
  if (SFEnhancedTabOverviewEnabled()
    && [(TabCollectionViewManager *)self->_tabCollectionViewManager isShowingTabView])
  {
    uint64_t v5 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabSwitcherViewController];
    [v5 scrollToTabGroup:v4];

    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
  activeTabGroupUUID = self->_activeTabGroupUUID;
  id v7 = a4;
  id v8 = a3;
  if ([v7 isEqualToString:activeTabGroupUUID]) {
    [(TabController *)self updateSelectedTabGroupName];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained reloadSidebarAnimated:0];

  -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v8 tabGroupWithUUID:v7];

  [v11 reloadTabGroup:v10];
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained reloadSidebarAnimated:!self->_suppressSidebarReloadAnimation];

  -[TabController tabGroupSwitcherViewController]((id *)&self->super.isa);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 reloadTabGroups];
}

- (void)tabGroupManager:(id)a3 didUpdateTabWithUUID:(id)a4 userDriven:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = [a3 tabWithUUID:a4];
  if (v7)
  {
    if (-[TabController isTabInActiveTabGroup:]((uint64_t)self, v7))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F29128]);
      id v9 = [v7 uuid];
      id v10 = (void *)[v8 initWithUUIDString:v9];
      id v11 = [(TabController *)self tabWithUUID:v10];

      if (v11)
      {
        [v11 setWBTab:v7];
        id v12 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __65__TabController_tabGroupManager_didUpdateTabWithUUID_userDriven___block_invoke;
        v42[3] = &unk_1E6D78980;
        id v13 = v11;
        id v43 = v13;
        id v44 = self;
        id v14 = v7;
        id v45 = v14;
        [v12 setHandler:v42];
        id v15 = [v13 title];
        char v16 = [v14 title];
        if (WBSIsEqual())
        {
          id v17 = v12;
          id v18 = [v13 url];
          id v19 = [v14 url];
          if (WBSIsEqual())
          {
            int v40 = [v13 isPinned];
            int v38 = [v14 isPinned];

            id v12 = v17;
            if (v40 == v38)
            {
              long long v20 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_1E102C000, v20, OS_LOG_TYPE_INFO, "Ignoring tab update because title, url, and pinned state are identical", buf, 2u);
              }
LABEL_26:

              goto LABEL_27;
            }
LABEL_11:
            id v21 = [v13 url];
            uint64_t v22 = [v14 url];
            int v23 = WBSIsEqual();

            uint64_t v24 = [v13 expectedOrCurrentURL];
            if (objc_msgSend(v24, "safari_isSafariWebExtensionURL"))
            {
              id v25 = [v13 webExtensionsController];
              [v14 url];
              BOOL v41 = v5;
              long long v26 = v39 = v12;
              [v25 _extensionURLToLoadFromPersistentStateURL:v26];
              v28 = long long v27 = v24;
              int v29 = WBSIsEqual();

              uint64_t v24 = v27;
              id v12 = v39;
              BOOL v5 = v41;
            }
            else
            {
              int v29 = 0;
            }
            if (((v23 | v29) & 1) == 0)
            {
              id v30 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 67109120;
                BOOL v47 = v5;
                _os_log_impl(&dword_1E102C000, v30, OS_LOG_TYPE_INFO, "Navigating tab because the URL has changed (user driven: %d)", buf, 8u);
              }
              if (v5)
              {
                id v31 = -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v13);
                [v31 unhibernate];
                id v32 = v31;

                [v32 restoreStateFromTab:v14];
                id v13 = v32;
              }
              else
              {
                [v13 clearBackForwardList];
                id v32 = [v14 url];
                uint64_t v33 = [v14 title];
                [v13 loadURL:v32 title:v33 skipSyncableTabUpdates:1];
              }
              [v13 updateTabIcon];
            }
            int v34 = [v13 isPinned];
            if (v34 != [v14 isPinned])
            {
              id v35 = WBS_LOG_CHANNEL_PREFIXTabGroup();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_1E102C000, v35, OS_LOG_TYPE_INFO, "Changing pinned state of tab", buf, 2u);
              }
              objc_msgSend(v13, "setPinned:", objc_msgSend(v14, "isPinned"));
              id v36 = [v14 pinnedTitle];
              [v13 setPinnedTitle:v36];

              uint64_t v37 = [v14 pinnedURL];
              [v13 setPinnedURL:v37];
            }
            goto LABEL_26;
          }

          id v12 = v17;
        }

        goto LABEL_11;
      }
    }
  }
LABEL_27:
}

void __65__TabController_tabGroupManager_didUpdateTabWithUUID_userDriven___block_invoke(id *a1)
{
  id v3 = [a1[5] activeTabGroup];
  if ([v3 isShared]) {
    uint64_t v2 = [a1[6] isMarkedAsRead] ^ 1;
  }
  else {
    uint64_t v2 = 0;
  }
  [a1[4] setUnread:v2];
}

- (void)tabGroupManager:(id)a3 didRemoveTabGroupWithUUID:(id)a4
{
  BOOL v5 = [a3 removedTabGroupWithUUID:a4];
  if (v5)
  {
    windowState = self->_windowState;
    id v11 = v5;
    id v7 = [v5 uuid];
    [(WBWindowState *)windowState removeActiveTabUUIDForTabGroupWithUUID:v7];

    id v8 = [MEMORY[0x1E4F78558] settings];
    uint64_t v9 = [v11 isPrivateBrowsing];
    if ([v11 isSyncable])
    {
      id v10 = [v11 uuid];
      [v8 setBlankSnapshotGroupIdentifier:0 forPrivateBrowsing:v9 syncableTabGroupUUID:v10 forWindowWithUUID:self->_browserWindowUUID];
    }
    else
    {
      [v8 setBlankSnapshotGroupIdentifier:0 forPrivateBrowsing:v9 syncableTabGroupUUID:0 forWindowWithUUID:self->_browserWindowUUID];
    }

    BOOL v5 = v11;
  }
}

- (void)tabGroupManager:(id)a3 willReplaceTabWithUUID:(id)a4 withTabWithUUID:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F29128];
  id v8 = a5;
  id v9 = a4;
  id v11 = (id)[[v7 alloc] initWithUUIDString:v9];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
  [(NSMutableDictionary *)self->_originalToReplacementUUIDMap setObject:v10 forKeyedSubscript:v11];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  [v4 selectAll:0];
  if (self->_showsTabGroupNameSuggestions)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __42__TabController_textFieldDidBeginEditing___block_invoke;
    v5[3] = &unk_1E6D7A168;
    void v5[4] = self;
    id v6 = v4;
    -[TabController _updateContextKitSuggestionsForTabGroupWithCompletionHandler:](self, v5);
  }
}

void __42__TabController_textFieldDidBeginEditing___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __42__TabController_textFieldDidBeginEditing___block_invoke_2;
    v6[3] = &unk_1E6D77D90;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 232) = 0;
    BOOL v5 = *(void **)(a1 + 40);
    [v5 setAutocorrectionType:2];
  }
}

void __42__TabController_textFieldDidBeginEditing___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) addTarget:*(void *)(a1 + 40) action:sel_tabGroupNamingTextDidChange_ forControlEvents:0x20000];
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  -[TabController _updateTabGroupSuggestions:matchingText:](v2, v3, 0);
}

- (void)textFieldDidEndEditing:(id)a3
{
  if (self->_showsTabGroupNameSuggestions)
  {
    uint64_t v4 = [a3 text];
    BOOL v5 = (void *)[v4 copy];

    tabGroupSuggestions = self->_tabGroupSuggestions;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__TabController_textFieldDidEndEditing___block_invoke;
    v10[3] = &unk_1E6D7BD00;
    id v7 = v5;
    id v11 = v7;
    uint64_t v8 = [(NSArray *)tabGroupSuggestions safari_firstObjectPassingTest:v10];
    if (v8) {
      [(CKContextCompleter *)self->_contextCompleter logEngagement:v8 forInput:0];
    }
    contextCompleter = self->_contextCompleter;
    self->_contextCompleter = 0;
  }
}

uint64_t __40__TabController_textFieldDidEndEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 title];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)registerUndoWithName:(id)a3 actions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[TabCloseUndoGroup alloc] initWithName:v7];

  -[TabController _registerUndoWithGroup:actions:]((uint64_t)self, v8, v6);
}

- (void)_registerUndoWithGroup:(void *)a3 actions:
{
  id v11 = a2;
  if (a1)
  {
    id v7 = *(void **)(a1 + 144);
    id v6 = (id *)(a1 + 144);
    id v8 = v7;
    objc_storeStrong(v6, a2);
    id v9 = a3;
    v9[2]();

    id v10 = *v6;
    id *v6 = v8;
  }
}

- (void)registerUndoWithType:(int64_t)a3 actions:(id)a4
{
  id v6 = a4;
  id v7 = [[TabCloseUndoGroup alloc] initWithType:a3];
  -[TabController _registerUndoWithGroup:actions:]((uint64_t)self, v7, v6);
}

- (void)_registerSingleUndoActionForClosedTabs:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 1);
    [a1[42] beginUndoGrouping];
    id v5 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    id v13[2] = __56__TabController__registerSingleUndoActionForClosedTabs___block_invoke;
    void v13[3] = &unk_1E6D77E20;
    void v13[4] = a1;
    [v5 setHandler:v13];
    id v6 = [a1[42] prepareWithInvocationTarget:a1];
    [v6 _undoCloseTabs:v3];

    [WeakRetained setOverridesUndoManagerForClosedTabs:1];
    if (([a1[42] isUndoing] & 1) == 0 && (objc_msgSend(a1[42], "isRedoing") & 1) == 0)
    {
      id v7 = [a1[18] name];
      if (![v7 length])
      {
        uint64_t v8 = [v3 count];
        if (v8 == 1)
        {
          uint64_t v9 = _WBSLocalizedString();
        }
        else
        {
          uint64_t v10 = v8;
          id v11 = NSString;
          uint64_t v12 = _WBSLocalizedString();
          uint64_t v9 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);

          id v7 = (void *)v12;
        }

        id v7 = (void *)v9;
      }
      [a1[42] setActionName:v7];
    }
  }
}

uint64_t __56__TabController__registerSingleUndoActionForClosedTabs___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 336) endUndoGrouping];
}

- (void)_undoCloseTabs:(id)a3
{
  id v4 = a3;
  BOOL v5 = (unint64_t)[v4 count] > 1;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __32__TabController__undoCloseTabs___block_invoke;
  id v13 = &unk_1E6D7C4D8;
  id v7 = v4;
  id v14 = v7;
  id v15 = self;
  BOOL v17 = v5;
  id v8 = v6;
  id v16 = v8;
  [(TabController *)self performBatchUpdatesWithBlock:&v10];
  if ([(NSUndoManager *)self->_undoManager isUndoing])
  {
    uint64_t v9 = [(NSUndoManager *)self->_undoManager prepareWithInvocationTarget:self];
    [v9 _redoCloseTabsWithUUIDs:v8];
  }
}

void __32__TabController__undoCloseTabs___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = [TabDocument alloc];
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
        uint64_t v10 = -[TabDocument initWithTabStateData:hibernated:browserController:](v8, "initWithTabStateData:hibernated:browserController:", v7, 0, WeakRetained, (void)v13);

        -[TabController _insertTab:atIndex:inBackground:animated:updateUI:](*(void *)(a1 + 40), v10, [v7 orderIndex], *(unsigned char *)(a1 + 56), 0, 1);
        uint64_t v11 = *(void **)(a1 + 48);
        uint64_t v12 = [(TabDocument *)v10 uuid];
        [v11 addObject:v12];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

- (void)_redoCloseTabsWithUUIDs:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __41__TabController__redoCloseTabsWithUUIDs___block_invoke;
  v5[3] = &unk_1E6D7CD68;
  void v5[4] = self;
  uint64_t v4 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v5);
  -[TabController _closeTabs:animated:allowAddingToRecentlyClosedTabs:keepWebViewAlive:showAutoCloseTabsAlert:]((uint64_t)self, v4, 1u, 1, 0, 0);
}

uint64_t __41__TabController__redoCloseTabsWithUUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) tabWithUUID:a2];
}

- (id)globalPinnedTabsForTabGroup:(id)a3
{
  pinnedTabsManager = self->_pinnedTabsManager;
  uint64_t v4 = -[TabController _containerForPinnedTabsInTabGroup:](self, a3);
  uint64_t v5 = [(PinnedTabsManager *)pinnedTabsManager pinnedTabsInContainer:v4];

  return v5;
}

- (BOOL)selectFirstUnpinnedTab
{
  uint64_t v3 = -[TabController _firstUnpinnedTab](self);
  if (v3) {
    [(TabController *)self setActiveTab:v3];
  }

  return v3 != 0;
}

- (void)setTab:(id)a3 isPinned:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isPinned] != v4)
  {
    [v6 setPinned:v4];
    id v7 = [v6 wbTab];
    id v8 = [v7 tabGroupUUID];
    uint64_t v9 = [(TabController *)self tabGroupWithUUID:v8];

    if (!v9)
    {
      if ([v6 isPrivateBrowsingEnabled]) {
        [(WBWindowState *)self->_windowState privateTabGroup];
      }
      else {
      uint64_t v9 = [(TabController *)self unnamedTabGroup];
      }
    }
    pinnedTabsManager = self->_pinnedTabsManager;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __33__TabController_setTab_isPinned___block_invoke;
    id v19 = &unk_1E6D78AE8;
    long long v20 = self;
    id v21 = v9;
    id v22 = v7;
    id v23 = v6;
    id v11 = v7;
    id v12 = v9;
    [(PinnedTabsManager *)pinnedTabsManager performUpdatesUsingBlock:&v16];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(WeakRetained, "reloadSidebarAnimated:", 1, v16, v17, v18, v19, v20);
    long long v14 = [WeakRetained libraryController];
    long long v15 = [v14 sidebarViewController];
    [v15 reloadSectionControllersIfNeeded];
  }
}

void __33__TabController_setTab_isPinned___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [*(id *)(a1 + 40) uuid];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __33__TabController_setTab_isPinned___block_invoke_2;
  v6[3] = &unk_1E6D7CD90;
  id v7 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v4;
  uint64_t v9 = v5;
  [v2 updateTabsInTabGroupWithUUID:v3 persist:1 usingBlock:v6];
}

void __33__TabController_setTab_isPinned___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  id v4 = [v9 mutableTabWithUUID:v3];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[*(id *)(a1 + 32) mutableCopy];
  }
  id v7 = v6;

  id v8 = [*(id *)(a1 + 40) tabUpdateBlock];
  ((void (**)(void, void *))v8)[2](v8, v7);

  -[TabController _tabGroupTabDidUpdatePinned:inTabGroup:](*(id **)(a1 + 48), v7, v9);
}

- (BOOL)trySwitchingToPinnedTabOnNavigationToURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TabController *)self activeTabDocument];
  id v6 = [v5 URL];
  char v7 = [v4 isEqual:v6];

  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = -[TabController _findPinnedTabMatchingURL:](self, v4);
    uint64_t v10 = (void *)v9;
    if (v9) {
      BOOL v11 = v9 == (void)v5;
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v8 = !v11;
    if (v11)
    {
      id v12 = v5;
    }
    else
    {
      [(TabController *)self setActiveTab:v9 animated:1];
      id v12 = [(TabController *)self activeTabDocument];

      if (-[TabController _shouldReloadAfterAutomaticallySwitchingToTab:]((uint64_t)self, v12)) {
        [v12 reload];
      }
      if (-[TabController _shouldCloseAfterAutomaticallySwitchingFromTab:]((BOOL)self, v12)) {
        [(TabController *)self closeTab:v12 animated:1];
      }
    }

    uint64_t v5 = v12;
  }

  return v8;
}

- (id)_findPinnedTabMatchingURL:(void *)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = [a2 absoluteString];
    id v4 = objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = objc_msgSend(a1, "pinnedTabs", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          BOOL v11 = [v10 url];
          id v12 = [v11 absoluteString];
          long long v13 = objc_msgSend(v12, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);

          if ([v4 isEqual:v13]) {
            goto LABEL_14;
          }
          long long v14 = [v10 committedURL];
          long long v15 = [v14 absoluteString];
          uint64_t v16 = objc_msgSend(v15, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 11, 0, 0);

          if ([v4 isEqual:v16])
          {
            long long v13 = v16;
LABEL_14:
            id v17 = v10;

            goto LABEL_15;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        id v17 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v17 = 0;
    }
LABEL_15:
  }
  else
  {
    id v17 = 0;
  }
  return v17;
}

- (uint64_t)_shouldReloadAfterAutomaticallySwitchingToTab:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v2 = [a2 webView];
  uint64_t v3 = [v2 _isPlayingAudio] ^ 1;

  return v3;
}

- (BOOL)_shouldCloseAfterAutomaticallySwitchingFromTab:(BOOL)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (([v3 isPinned] & 1) != 0 || !objc_msgSend(v4, "isBlank"))
    {
      a1 = 0;
    }
    else
    {
      uint64_t v5 = [(id)a1 unpinnedTabs];
      a1 = (unint64_t)[v5 count] > 1;
    }
  }

  return a1;
}

- (TabDocument)singleUnpinnedBlankTab
{
  id v3 = [(TabController *)self unpinnedTabs];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    uint64_t v5 = [(TabController *)self unpinnedTabs];
    uint64_t v6 = [v5 lastObject];

    if ([v6 isBlank])
    {
      uint64_t v7 = -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v6);
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
  return (TabDocument *)v7;
}

uint64_t __34__TabController__firstUnpinnedTab__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned] ^ 1;
}

uint64_t __50__TabController__hasPinnedStartPageExcludingTabs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPinned] && objc_msgSend(v3, "isBlank")) {
    uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)recentlyClosedTabsMenuForTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TabController *)self tabGroupWithUUID:v4];
  char v6 = [v5 isPrivateBrowsing];

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __59__TabController_recentlyClosedTabsMenuForTabGroupWithUUID___block_invoke;
    v12[3] = &unk_1E6D7CDB8;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    uint64_t v8 = (void *)MEMORY[0x1E4E42950](v12);
    uint64_t v9 = (void *)MEMORY[0x1E4FB1970];
    uint64_t v10 = [(TabController *)self activeProfile];
    uint64_t v7 = objc_msgSend(v9, "safari_recentlyClosedTabsMenuForProfile:showProfileTitle:openHandler:", v10, -[TabController hasMultipleProfiles](self, "hasMultipleProfiles"), v8);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __59__TabController_recentlyClosedTabsMenuForTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setActiveTabGroupUUID:*(void *)(a1 + 32)];
    [v4 insertTabDocumentFromTabStateData:v6];
    uint64_t v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    objc_msgSend(v5, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 4, objc_msgSend(v4[9], "visibleTabCollectionViewType"));
  }
}

- (NSString)activeTabUUID
{
  id v2 = [(TabController *)self activeTabDocument];
  id v3 = [v2 uuidString];

  return (NSString *)v3;
}

- (void)setActiveTabUUID:(id)a3
{
  id v14 = a3;
  id v4 = -[TabController tabGroupRelatedToTabWithUUID:](self, "tabGroupRelatedToTabWithUUID:");
  if (([v4 isPrivateBrowsing] & 1) != 0
    || ([v4 profileIdentifier],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [(TabController *)self activeProfileIdentifier],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToString:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(TabController *)self activeTabGroupUUID];
    uint64_t v9 = [v4 uuid];
    char v10 = [v8 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      BOOL v11 = [v4 uuid];
      [(TabController *)self setActiveTabGroupUUID:v11];
    }
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v14];
    id v13 = [(TabController *)self tabWithUUID:v12];

    if (v13) {
      [(TabController *)self setActiveTab:v13];
    }
  }
}

- (id)appendWBTabInTabGroupWithUUID:(id)a3
{
  id v4 = a3;
  if (self->_tabDocumentBeingHiddenFromTabView
    && ([(TabController *)self privateTabGroupIfAvailable],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 uuid],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqual:v4],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(TabDocument *)self->_tabDocumentBeingHiddenFromTabView tabGroupTab];
    [(TabController *)self setActiveTabGroupUUID:v4];
    tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
    self->_tabDocumentBeingHiddenFromTabView = 0;
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4FB6078];
    BOOL v11 = [(TabController *)self deviceIdentifier];
    id v12 = [v10 startPageTabWithDeviceIdentifier:v11];

    tabGroupManager = self->_tabGroupManager;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__TabController_appendWBTabInTabGroupWithUUID___block_invoke;
    v15[3] = &unk_1E6D7C290;
    uint64_t v8 = v12;
    uint64_t v16 = v8;
    [(WBTabGroupManager *)tabGroupManager updateTabsInTabGroupWithUUID:v4 persist:1 usingBlock:v15];
    tabDocumentBeingHiddenFromTabView = v16;
  }

  return v8;
}

void __47__TabController_appendWBTabInTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "appendTabs:", v4, v5, v6);
}

- (void)authenticateToUnlockPrivateBrowsing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained authenticateToUnlockPrivateBrowsing];
}

- (uint64_t)_wbTabIsShowingStartPageOverriddenByExtension:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 uuid];
    uint64_t v6 = [a1 tabGroupRelatedToTabWithUUID:v5];

    int v7 = [v6 profileIdentifier];
    if (v7)
    {
      uint64_t v8 = (void *)a1[6];
      uint64_t v9 = [v6 profileIdentifier];
      char v10 = [v8 profileWithIdentifier:v9];
    }
    else
    {
      char v10 = 0;
    }

    BOOL v11 = +[Application sharedApplication];
    id v12 = objc_msgSend(v11, "webExtensionsControllerForTabWithPrivateBrowsingEnabled:profile:", objc_msgSend(v4, "isPrivateBrowsing"), v10);

    id v13 = [v12 extensionOverriddenStartPageURL];
    if (v13)
    {
      id v14 = [v4 url];
      long long v15 = [v12 _persistentStateURLForExtensionURL:v13];
      uint64_t v16 = [v14 isEqual:v15];
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

- (void)closeWBTabs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __29__TabController_closeWBTabs___block_invoke;
  v28[3] = &unk_1E6D77D90;
  v28[4] = self;
  id v6 = v4;
  id v29 = v6;
  [v5 setHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  void v27[2] = __29__TabController_closeWBTabs___block_invoke_2;
  v27[3] = &unk_1E6D7CDE0;
  void v27[4] = self;
  int v7 = objc_msgSend(v6, "safari_mapAndFilterObjectsUsingBlock:", v27);
  uint64_t v8 = [v7 count];
  if (v8 == [v6 count]) {
    -[TabController _addTabsToRecentlyClosed:]((uint64_t)self, v7);
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithObjectsInFastEnumerationCollection:groupedUsingBlock:", v6, &__block_literal_global_518);
  char v10 = [(TabController *)self privateTabGroupIfAvailable];
  BOOL v11 = v10;
  if (v10)
  {
    id v12 = [v10 uuid];
    id v13 = [v9 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 count];
    BOOL v15 = v14 == [(NSMutableArray *)self->_mutablePrivateTabs count];
  }
  else
  {
    BOOL v15 = 0;
  }
  uint64_t v16 = objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_520);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __29__TabController_closeWBTabs___block_invoke_5;
  v26[3] = &unk_1E6D7CE28;
  v26[4] = self;
  [v9 enumerateKeysAndObjectsUsingBlock:v26];
  if (v15)
  {
    id v17 = [(NSMutableArray *)self->_mutablePrivateTabs firstObject];
    int v18 = [v17 isBlank];

    if (v18)
    {
      long long v19 = [(NSMutableArray *)self->_mutablePrivateTabs firstObject];
      -[TabController _unhibernateTabIfNeeded:]((TabDocument *)self, v19);
      long long v20 = (TabDocument *)objc_claimAutoreleasedReturnValue();
      tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
      self->_tabDocumentBeingHiddenFromTabView = v20;
    }
  }
  if ([v16 count])
  {
    pinnedTabsManager = self->_pinnedTabsManager;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __29__TabController_closeWBTabs___block_invoke_7;
    v23[3] = &unk_1E6D77D90;
    id v24 = v16;
    id v25 = self;
    [(PinnedTabsManager *)pinnedTabsManager performUpdatesUsingBlock:v23];
  }
}

void __29__TabController_closeWBTabs___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) count];
  -[TabController _presentAutomaticTabClosingPromptIfNeededForClosedTabCount:](v1, v2);
}

id __29__TabController_closeWBTabs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isPrivateBrowsing] & 1) != 0
    || ([*(id *)(a1 + 32) isControlledByAutomation] & 1) != 0)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = objc_alloc(MEMORY[0x1E4F29128]);
    int v7 = [v3 uuid];
    uint64_t v8 = (void *)[v6 initWithUUIDString:v7];
    id v4 = [v5 tabWithUUID:v8];
  }
  return v4;
}

uint64_t __29__TabController_closeWBTabs___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 tabGroupUUID];
}

BOOL __29__TabController_closeWBTabs___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 tabGroupUUID];
  BOOL v3 = v2 == 0;

  return v3;
}

void __29__TabController_closeWBTabs___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a2;
  -[TabController updateLastSelectedTabUUIDForClosingWBTabs:](v6, v5);
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29__TabController_closeWBTabs___block_invoke_6;
  v10[3] = &unk_1E6D7C290;
  id v11 = v5;
  id v9 = v5;
  [v8 updateTabsInTabGroupWithUUID:v7 persist:1 usingBlock:v10];
}

uint64_t __29__TabController_closeWBTabs___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 deleteTabs:*(void *)(a1 + 32)];
}

void __29__TabController_closeWBTabs___block_invoke_7(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 40) + 280);
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "uuid", (void)v9);
        [v7 removeTabWithUUID:v8 persist:1];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)defaultTabToSelectInTabGroup:(id)a3
{
  id v4 = a3;
  if ([(TabController *)self isTabGroupActive:v4])
  {
    uint64_t v5 = [(TabController *)self activeTabDocument];
    id v6 = [v5 wbTab];
  }
  else
  {
    uint64_t v5 = [v4 lastSelectedTabUUID];
    id v7 = [(TabController *)self wbTabWithUUID:v5];
    uint64_t v8 = v7;
    if (v7)
    {
      id v6 = v7;
    }
    else
    {
      long long v9 = [v4 firstUnpinnedTab];
      long long v10 = v9;
      if (v9)
      {
        id v6 = v9;
      }
      else
      {
        long long v11 = [v4 tabs];
        id v6 = [v11 firstObject];
      }
    }
  }
  return v6;
}

- (void)switchToTabGroupVisibleInSwitcherIfNeeded
{
  uint64_t v3 = [(TabCollectionViewManager *)self->_tabCollectionViewManager tabSwitcherViewController];
  [v3 cancelRenamingVisibleTabGroup];

  id v4 = [(TabController *)self activeTabGroupOrTabGroupVisibleInSwitcher];
  activeTabGroupUUID = self->_activeTabGroupUUID;
  id v8 = v4;
  id v6 = [v4 uuid];
  LOBYTE(activeTabGroupUUID) = [(NSString *)activeTabGroupUUID isEqualToString:v6];

  if ((activeTabGroupUUID & 1) == 0)
  {
    id v7 = [v8 uuid];
    [(TabController *)self setActiveTabGroupUUID:v7];
  }
}

- (void)_movePinnedWBTab:(void *)a3 toTabGroup:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = [v5 uuid];
    id v8 = [(id)a1 tabGroupRelatedToTabWithUUID:v7];

    if (WBSIsEqual())
    {
LABEL_13:

      goto LABEL_14;
    }
    id v9 = objc_alloc(MEMORY[0x1E4FB6078]);
    long long v10 = [v5 uuid];
    long long v11 = [(id)a1 deviceIdentifier];
    long long v12 = (void *)[v9 initWithUUID:v10 deviceIdentifier:v11];

    [v12 adoptAttributesFromTab:v5];
    objc_msgSend(v12, "setSyncable:", objc_msgSend(v6, "isSyncable"));
    id v13 = -[TabController _containerForPinnedTabsInTabGroup:]((void *)a1, v6);
    if ([v8 usesGlobalPinnedTabs]
      && [v6 usesGlobalPinnedTabs])
    {
      uint64_t v14 = *(void **)(a1 + 280);
      BOOL v15 = [v5 uuid];
      [v14 removeTabWithUUID:v15 persist:1];

      [*(id *)(a1 + 280) appendTab:v12 inContainer:v13];
    }
    else
    {
      if ([v8 usesGlobalPinnedTabs])
      {
        uint64_t v16 = *(void **)(a1 + 280);
        id v17 = [v5 uuid];
        [v16 removeTabWithUUID:v17 persist:1];

        int v18 = *(void **)(a1 + 48);
        long long v19 = [v6 uuid];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __45__TabController__movePinnedWBTab_toTabGroup___block_invoke;
        v31[3] = &unk_1E6D7C290;
        id v32 = v12;
        [v18 updateTabsInTabGroupWithUUID:v19 persist:1 usingBlock:v31];

        long long v20 = v32;
      }
      else
      {
        int v21 = [v6 usesGlobalPinnedTabs];
        long long v22 = *(void **)(a1 + 48);
        if (!v21)
        {
          v33[0] = v5;
          id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
          id v25 = [v6 lastPinnedTab];
          [v22 moveTabs:v24 toTabGroup:v6 afterTab:v25 withoutPersistingTabGroupsWithUUIDStrings:0];

          goto LABEL_12;
        }
        id v23 = [v8 uuid];
        uint64_t v26 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        long long v28 = __45__TabController__movePinnedWBTab_toTabGroup___block_invoke_2;
        id v29 = &unk_1E6D7C290;
        id v30 = v5;
        [v22 updateTabsInTabGroupWithUUID:v23 persist:1 usingBlock:&v26];

        objc_msgSend(*(id *)(a1 + 280), "appendTab:inContainer:", v12, v13, v26, v27, v28, v29);
        long long v20 = v30;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_14:
}

void __45__TabController__movePinnedWBTab_toTabGroup___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v6 count:1];
  id v5 = objc_msgSend(v3, "lastPinnedTab", v6, v7);
  [v3 insertTabs:v4 afterTab:v5];
}

void __45__TabController__movePinnedWBTab_toTabGroup___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "deleteTabs:", v4, v5, v6);
}

- (void)moveWBTabs:(id)a3 toTabGroup:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "safari_splitArrayUsingCondition:", &__block_literal_global_523);
  id v8 = [v7 first];
  id v9 = [v7 second];
  if ([v9 count])
  {
    tabGroupManager = self->_tabGroupManager;
    long long v11 = [v6 tabs];
    long long v12 = [v11 lastObject];
    [(WBTabGroupManager *)tabGroupManager moveTabs:v9 toTabGroup:v6 afterTab:v12 withoutPersistingTabGroupsWithUUIDStrings:0];
  }
  if ([v8 count])
  {
    pinnedTabsManager = self->_pinnedTabsManager;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    id v14[2] = __39__TabController_moveWBTabs_toTabGroup___block_invoke_2;
    v14[3] = &unk_1E6D78980;
    id v15 = v8;
    uint64_t v16 = self;
    id v17 = v6;
    [(PinnedTabsManager *)pinnedTabsManager performUpdatesUsingBlock:v14];
  }
}

uint64_t __39__TabController_moveWBTabs_toTabGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned];
}

void __39__TabController_moveWBTabs_toTabGroup___block_invoke_2(uint64_t a1)
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
        -[TabController _movePinnedWBTab:toTabGroup:](*(void *)(a1 + 40), *(void **)(*((void *)&v7 + 1) + 8 * v6++), *(void **)(a1 + 48));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __41__TabController_pinnedWBTabsForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned];
}

- (void)setTitle:(id)a3 forTabGroupWithUUID:(id)a4
{
  id v6 = a3;
  tabGroupManager = self->_tabGroupManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__TabController_setTitle_forTabGroupWithUUID___block_invoke;
  v9[3] = &unk_1E6D7C290;
  id v10 = v6;
  id v8 = v6;
  [(WBTabGroupManager *)tabGroupManager updateTabGroupWithUUID:a4 persist:1 usingBlock:v9];
}

uint64_t __46__TabController_setTitle_forTabGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTitle:*(void *)(a1 + 32)];
}

- (void)setWBTabs:(id)a3 arePinned:(BOOL)a4
{
  id v6 = a3;
  pinnedTabsManager = self->_pinnedTabsManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__TabController_setWBTabs_arePinned___block_invoke;
  v9[3] = &unk_1E6D780C8;
  BOOL v12 = a4;
  id v10 = v6;
  long long v11 = self;
  id v8 = v6;
  [(PinnedTabsManager *)pinnedTabsManager performUpdatesUsingBlock:v9];
}

void __37__TabController_setWBTabs_arePinned___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 reverseObjectEnumerator];
  }
  uint64_t v5 = v4;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (*(unsigned __int8 *)(a1 + 48) != [v10 isPinned]
          && (!*(unsigned char *)(a1 + 48) || [*(id *)(a1 + 40) isTabPinnable:v10]))
        {
          long long v11 = *(void **)(a1 + 40);
          BOOL v12 = [v10 uuid];
          id v13 = [v11 tabGroupRelatedToTabWithUUID:v12];
          uint64_t v14 = [v13 uuid];

          uint64_t v15 = *(void *)(a1 + 40);
          uint64_t v16 = *(void **)(v15 + 48);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __37__TabController_setWBTabs_arePinned___block_invoke_2;
          v17[3] = &unk_1E6D7C4B0;
          char v18 = *(unsigned char *)(a1 + 48);
          void v17[4] = v10;
          void v17[5] = v15;
          [v16 updateTabsInTabGroupWithUUID:v14 persist:1 usingBlock:v17];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

void __37__TabController_setWBTabs_arePinned___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  id v4 = [v11 mutableTabWithUUID:v3];
  uint64_t v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)[*(id *)(a1 + 32) mutableCopy];
  }
  uint64_t v7 = v6;

  objc_msgSend(v7, "setSyncable:", objc_msgSend(v11, "isSyncable"));
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  long long v9 = [v7 title];
  id v10 = [v7 url];
  [v7 setPinned:v8 title:v9 url:v10];

  -[TabController _tabGroupTabDidUpdatePinned:inTabGroup:](*(id **)(a1 + 40), v7, v11);
}

uint64_t __59__TabController_updateLastSelectedTabUUIDForClosingWBTabs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLastSelectedTabUUID:*(void *)(a1 + 32)];
}

- (id)wbTabWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WBTabGroupManager *)self->_tabGroupManager tabWithUUID:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(PinnedTabsManager *)self->_pinnedTabsManager tabWithUUID:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_updateTabsWithPinnedTabs:(int)a3 persist:
{
  if (a1)
  {
    id v5 = a2;
    id v6 = [a1 pinnedTabs];
    -[TabController _replaceTabs:withTabs:persist:](a1, v6, v5, a3);
  }
}

- (void)reorderPinnedTabsIntoPlace
{
  uint64_t v3 = [(TabController *)self activeTabGroup];
  int v4 = [v3 isSyncable];

  if (v4)
  {
    id v5 = [(TabController *)self pinnedTabs];
    -[TabController _updateTabsWithPinnedTabs:persist:](self, v5, 1);
  }
}

- (void)pinnedTabsManager:(id)a3 didUpdatePinnedTabs:(id)a4 isPrivate:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  if ([(TabController *)self isPrivateBrowsingEnabled] == v5)
  {
    id v7 = [(TabController *)self activeTabGroup];
    char v8 = [v7 isSyncable];

    if ((v8 & 1) == 0 && (v5 || [(TabController *)self isInDefaultProfile])) {
      -[TabController _updateTabsWithPinnedWBTabs:](self, v9);
    }
  }
}

- (void)_updateTabsWithPinnedWBTabs:(void *)a1
{
  if (a1)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__TabController__updateTabsWithPinnedWBTabs___block_invoke;
    v4[3] = &unk_1E6D7CDE0;
    void v4[4] = a1;
    uint64_t v3 = objc_msgSend(a2, "safari_mapObjectsUsingBlock:", v4);
    -[TabController _updateTabsWithPinnedTabs:persist:](a1, v3, 0);
  }
}

- (void)pinnedTabsManager:(id)a3 didUpdatePinnedTabs:(id)a4 inProfileWithIdentifier:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  char v8 = [(TabController *)self activeProfileIdentifier];
  char v9 = [v8 isEqual:v7];

  if ((v9 & 1) == 0) {
    goto LABEL_6;
  }
  id v10 = [(TabController *)self activeTabGroup];
  if (([v10 usesGlobalPinnedTabs] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  BOOL v11 = [(TabController *)self isPrivateBrowsingEnabled];

  if (!v11) {
    -[TabController _updateTabsWithPinnedWBTabs:](self, v12);
  }
LABEL_7:
}

id __45__TabController__updateTabsWithPinnedWBTabs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = [v3 uuid];
  id v7 = (void *)[v5 initWithUUIDString:v6];
  char v8 = [v4 tabWithUUID:v7];
  char v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    -[TabController _tabForWBTab:](*(id **)(a1 + 32), v3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v11 = v10;

  [v11 setPinned:1];
  [v11 setWBTab:v3];

  return v11;
}

uint64_t __29__TabController_hasUnreadTab__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isUnread];
}

- (void)attemptToSelectTabGroupFromShare:(id)a3
{
  int v4 = [(WBTabGroupManager *)self->_tabGroupManager tabGroupMatchingShare:a3];
  if (v4)
  {
    id v5 = v4;
    -[TabController _selectAcceptedSharedTabGroup:]((uint64_t)self, v4);
    int v4 = v5;
  }
  self->_didSelectAcceptedSharedTabGroup = v4 != 0;
}

- (void)_selectAcceptedSharedTabGroup:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[TabController _markAllTabsInTabGroupAsRead:](a1, v3);
    int v4 = [v3 profileIdentifier];
    [(id)a1 setActiveProfileIdentifier:v4];

    id v5 = [v3 uuid];
    [(id)a1 setActiveTabGroupUUID:v5];

    id v6 = [(id)a1 currentTabs];
    id v7 = [v6 firstObject];
    [(id)a1 setActiveTab:v7];

    char v8 = [*(id *)(a1 + 72) tabSwitcherViewController];
    [v8 setNeedsScrollToTabGroup:v3];

    *(unsigned char *)(a1 + 248) = 1;
  }
}

- (void)displayAlreadyAcceptedSharedTabGroupWithUUID:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  id v6 = [v4 now];
  [(TabController *)self didFetchRecentlyAcceptedSharedTabGroupWithUUID:v5 acceptedShareDate:v6];
}

- (void)didFetchRecentlyAcceptedSharedTabGroupWithUUID:(id)a3 acceptedShareDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_didSelectAcceptedSharedTabGroup)
  {
    objc_initWeak(&location, self);
    tabGroupManager = self->_tabGroupManager;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke;
    v9[3] = &unk_1E6D77F98;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [(WBTabGroupManager *)tabGroupManager reloadTabGroupsFromDatabaseWithCompletionHandler:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v4 = (uint64_t *)(a1 + 32);
    id v6 = [WeakRetained tabGroupWithUUID:v5];
    if (v6)
    {
      -[TabController _selectAcceptedSharedTabGroup:]((uint64_t)v3, v6);
    }
    else
    {
      id v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke_cold_1(v4, v7);
      }
    }
  }
}

- (id)representativeURLForTabGroupConfirmationAlert:(id)a3
{
  int v4 = [a3 tabGroup];
  uint64_t v5 = -[TabController _urlForActiveTabInTabGroup:](self, v4);

  return v5;
}

- (void)tabGroupConfirmationAlertDidBeginDismissal:(id)a3
{
  if ([a3 role] == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained closePreviewDocument];
  }
}

- (void)clearHiddenTabForExplanationView
{
  tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
  self->_tabDocumentBeingHiddenFromTabView = 0;
}

- (void)clearTabsClosedWhileTabViewPresentedCount
{
  self->_tabsClosedWhileTabViewPresentedCount = 0;
}

- (void)openNewTabWithCompletionHandler:(id)a3
{
}

- (void)insertTabWithUUIDForNavigation:(id)a3
{
  uint64_t v4 = [(TabController *)self tabWithUUID:a3];
  if (!v4)
  {
    tabDocumentBeingHiddenFromTabView = self->_tabDocumentBeingHiddenFromTabView;
    if (!tabDocumentBeingHiddenFromTabView
      || (BOOL v6 = [(TabDocument *)tabDocumentBeingHiddenFromTabView isPrivateBrowsingEnabled],
          v6 != [(TabController *)self isPrivateBrowsingEnabled])
      || (char v9 = self->_tabDocumentBeingHiddenFromTabView,
          id v7 = self->_tabDocumentBeingHiddenFromTabView,
          self->_tabDocumentBeingHiddenFromTabView = 0,
          v7,
          (uint64_t v4 = (uint64_t)v9) == 0))
    {
      if ([(TabController *)self isPrivateBrowsingEnabled]) {
        char v8 = 2;
      }
      else {
        char v8 = 1;
      }
      uint64_t v4 = -[TabController _insertNewBlankTabDocumentWithOptions:inBackground:animated:]((id *)&self->super.isa, v8, 1, 0);
    }
  }
  id v10 = (id)v4;
  [(TabController *)self setActiveTab:v4];
}

- (NSString)activeTabGroupUUID
{
  return self->_activeTabGroupUUID;
}

- (PinnedTabsManager)pinnedTabsManager
{
  return self->_pinnedTabsManager;
}

- (TabDocument)privateActiveTabDocument
{
  return self->_privateActiveTabDocument;
}

- (void)setPrivateActiveTabDocument:(id)a3
{
}

- (TabDocument)normalActiveTabDocument
{
  return self->_normalActiveTabDocument;
}

- (void)setNormalActiveTabDocument:(id)a3
{
}

- (int64_t)privateBrowsingMode
{
  return self->_privateBrowsingMode;
}

- (WBSTabOrderManager)tabOrderManager
{
  return self->_tabOrderManager;
}

- (int64_t)tabDisplayMode
{
  return self->_tabDisplayMode;
}

- (void)setTabDisplayMode:(int64_t)a3
{
  self->_tabDisplayMode = a3;
}

- (BOOL)shouldTogglePrivateBrowsingOnSplit
{
  return self->_shouldTogglePrivateBrowsingOnSplit;
}

- (void)setShouldTogglePrivateBrowsingOnSplit:(BOOL)a3
{
  self->_shouldTogglePrivateBrowsingOnSplit = a3;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (_SWCollaborationButtonView)tabOverviewCollaborationButton
{
  return self->_tabOverviewCollaborationButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabOverviewCollaborationButton, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_browserWindowUUID, 0);
  objc_storeStrong((id *)&self->_tabOrderManager, 0);
  objc_storeStrong((id *)&self->_normalActiveTabDocument, 0);
  objc_storeStrong((id *)&self->_privateActiveTabDocument, 0);
  objc_storeStrong((id *)&self->_pinnedTabsManager, 0);
  objc_storeStrong((id *)&self->_windowState, 0);
  objc_storeStrong((id *)&self->_cachedShareConfigurationsByTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_expandedTabGroupUUIDs, 0);
  objc_storeStrong((id *)&self->_contextCompleter, 0);
  objc_storeStrong((id *)&self->_tabGroupSuggestions, 0);
  objc_storeStrong((id *)&self->_tabDocumentsThatShouldSuppressOnCreatedEvents, 0);
  objc_storeStrong((id *)&self->_libraryTabs, 0);
  objc_storeStrong((id *)&self->_activeLibraryTab, 0);
  objc_storeStrong((id *)&self->_veryRecentlyClosedTabCountInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_undoGroup, 0);
  objc_storeStrong((id *)&self->_originalToReplacementUUIDMap, 0);
  objc_storeStrong((id *)&self->_documentObserversToReceiveUpdatesDidEnd, 0);
  objc_storeStrong((id *)&self->_documentObservers, 0);
  objc_storeStrong((id *)&self->_uuidToTabMap, 0);
  objc_storeStrong((id *)&self->_updateContinuityTimer, 0);
  objc_storeStrong((id *)&self->_tabCollectionViewManager, 0);
  objc_storeStrong((id *)&self->_activeTabGroupUUID, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_tabDocumentBeingHiddenFromTabView, 0);
  objc_storeStrong((id *)&self->_mutablePrivateTabs, 0);
  objc_storeStrong((id *)&self->_mutableNormalTabs, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

- (void)saveStateInBackground:(BOOL)a3 needsValidate:(BOOL)a4
{
  BOOL v4 = a3;
  if (+[WBUFeatureManager accessLevel] == 2) {
    [(TabController *)self updateEducationTabsLastSyncDate];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if ([WeakRetained isShowingReader])
  {
    BOOL v6 = [(TabController *)self activeTabDocument];
    [WeakRetained verticalScrollOffsetForReaderViewInTabDocument:v6];
    double v8 = v7;
    char v9 = [(TabController *)self activeTabDocument];
    [v9 setReaderViewTopScrollOffset:(uint64_t)v8];
  }
  id v10 = [WeakRetained tabGroupManager];
  id v11 = [WeakRetained windowState];
  [v10 saveWindowState:v11 completionHandler:0];

  [(TabController *)self persistAllCurrentTabsInBackground:v4];
}

- (void)persistAllCurrentTabsInBackground:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(TabController *)self activeTabGroup];
  if ([v5 usesGlobalPinnedTabs]) {
    [(TabController *)self unpinnedTabs];
  }
  else {
  id v6 = [(TabController *)self currentTabs];
  }

  [(TabController *)self persistTabs:v6 inTabGroupWithUUID:self->_activeTabGroupUUID inBackground:v3];
}

- (void)persistTab:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  tabGroupManager = self->_tabGroupManager;
  id v11 = v6;
  double v8 = [v6 uuid];
  char v9 = [v8 UUIDString];
  id v10 = [v11 tabUpdateBlock];
  [(WBTabGroupManager *)tabGroupManager updateTabWithUUID:v9 persist:1 notify:v4 usingBlock:v10];
}

- (void)saveStateInBackground:(BOOL)a3
{
}

- (uint64_t)_didCompleteStateRestoration
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    int v2 = -[TabController tabCollectionViewManager](result);
    BOOL v3 = [v1 activeTabDocument];
    [v2 updateTabBarAnimated:0 keepingTabVisible:v3];

    BOOL v4 = -[TabController tabCollectionViewManager]((uint64_t)v1);
    [v4 updateTabOverviewItems];

    return [v1 updateHibernatedTabDocumentsSavingState];
  }
  return result;
}

- (TabDocument)_activeTabDocumentForTabGroup:(TabDocument *)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = [(TabDocument *)a1 windowState];
    uint64_t v5 = [v4 tabGroupsToActiveTabs];
    id v6 = [v3 uuid];
    double v7 = [v5 objectForKeyedSubscript:v6];

    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    char v9 = [(TabDocument *)a1 tabWithUUID:v8];
    if (v9)
    {
LABEL_11:
      -[TabController _unhibernateTabIfNeeded:](a1, v9);
      a1 = (TabDocument *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    if ([v3 isPrivateBrowsing])
    {
      id v10 = [(TabDocument *)a1 privateUnpinnedTabs];
      id v11 = [v10 firstObject];
      if (!v11)
      {
        id v12 = [(TabDocument *)a1 privateTabs];
        uint64_t v13 = [v12 firstObject];
LABEL_9:
        char v9 = (void *)v13;

        goto LABEL_10;
      }
    }
    else
    {
      id v10 = [(TabDocument *)a1 normalUnpinnedTabs];
      id v11 = [v10 firstObject];
      if (!v11)
      {
        id v12 = [(TabDocument *)a1 normalTabs];
        uint64_t v13 = [v12 firstObject];
        goto LABEL_9;
      }
    }
    id v11 = v11;
    char v9 = v11;
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:

  return a1;
}

- (id)_mutableTabsForTabGroup:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    char v5 = [v3 isPrivateBrowsing];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    double v7 = [v4 tabs];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __54__TabController_Persistence___mutableTabsForTabGroup___block_invoke;
    v12[3] = &unk_1E6D7D038;
    void v12[4] = a1;
    id v8 = WeakRetained;
    id v13 = v8;
    char v14 = v5;
    char v9 = objc_msgSend(v7, "safari_mapObjectsUsingBlock:", v12);
    id v10 = (void *)[v9 mutableCopy];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id __54__TabController_Persistence___mutableTabsForTabGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = [v3 uuid];
  double v7 = (void *)[v5 initWithUUIDString:v6];
  id v8 = [v4 tabWithUUID:v7];

  if (v8)
  {
    [v8 restoreStateFromTab:v3];
  }
  else
  {
    char v9 = [MEMORY[0x1E4F78290] sharedFeatureManager];
    int v10 = [v9 allowsUnlimitedTabs];

    if (v10) {
      id v11 = [[HibernatedTab alloc] initWithWBTab:v3 browserController:*(void *)(a1 + 40)];
    }
    else {
      id v11 = [[TabDocument alloc] initWithTabGroupTab:v3 privateBrowsingEnabled:*(unsigned __int8 *)(a1 + 48) hibernated:1 bookmark:0 browserController:*(void *)(a1 + 40)];
    }
    id v8 = v11;
  }
  [v8 updateTabIconWithDelay:0.4];

  return v8;
}

- (id)_focusedTabGroupForWindowState:(unsigned char *)a1
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1 || ([a1 isPrivateBrowsingEnabled] & 1) != 0)
  {
    BOOL v4 = 0;
    goto LABEL_18;
  }
  id v5 = +[Application sharedApplication];
  if (([v5 needsFocusedTabGroupUpdate] & 1) == 0)
  {
    BOOL v4 = 0;
    goto LABEL_17;
  }
  BOOL v4 = [a1 focusedTabGroup];
  if (v4)
  {
    if (a1[64]) {
      [v5 setNeedsFocusedTabGroupUpdate:0];
    }
    if (([v3 newlyCreated] & 1) == 0
      && ([a1 isTabGroupActive:v4] & 1) == 0
      && ![v5 prefersSingleWindow])
    {
      char v9 = v4;
      BOOL v4 = 0;
      goto LABEL_15;
    }
    id v6 = (id)WBS_LOG_CHANNEL_PREFIXSiriLink();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = [v3 uuid];
      id v8 = [v4 uuid];
      int v11 = 138543618;
      id v12 = v7;
      __int16 v13 = 2114;
      char v14 = v8;
      _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Initiate window %{public}@ with FTG %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  char v9 = 0;
LABEL_15:

LABEL_17:
LABEL_18:

  return v4;
}

- (id)_activeTabGroupForWindowState:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([a1 isPrivateBrowsingEnabled])
    {
      a1 = [v3 privateTabGroup];
      if (a1) {
        goto LABEL_7;
      }
    }
    else
    {
      BOOL v4 = [v3 activeTabGroupUUID];
      a1 = [a1 tabGroupWithUUID:v4];

      if (a1) {
        goto LABEL_7;
      }
    }
    a1 = [v3 localTabGroup];
  }
LABEL_7:

  return a1;
}

- (BOOL)readState
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v4 = [(TabController *)self windowState];
  id v5 = -[TabController _activeTabGroupForWindowState:](self, v4);
  uint64_t v6 = -[TabController _focusedTabGroupForWindowState:](self, v4);
  double v7 = (void *)v6;
  if (v6) {
    id v8 = (void *)v6;
  }
  else {
    id v8 = v5;
  }
  id v9 = v8;

  if (![(TabController *)self isTabGroupActive:v9] || !self->_didReadWindowState)
  {
    if (self->_activeTabGroupUUID)
    {
      int v10 = [(TabController *)self tabGroupManager];
      [v10 endParticipantPresenceReportingForTabGroupWithUUID:self->_activeTabGroupUUID];
    }
    int v11 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v9 privacyPreservingDescription];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v36 = (uint64_t)v12;
      _os_log_impl(&dword_1E102C000, v11, OS_LOG_TYPE_DEFAULT, "Read active tab group from saved state: %{public}@", buf, 0xCu);
    }
    __int16 v13 = [v9 uuid];
    char v14 = (NSString *)[v13 copy];
    activeTabGroupUUID = self->_activeTabGroupUUID;
    self->_activeTabGroupUUID = v14;

    uint64_t v16 = [v9 isPrivateBrowsing];
    [WeakRetained setPrivateBrowsingEnabled:v16];
    if (v16)
    {
      id v17 = [v4 localTabGroup];
    }
    else
    {
      id v17 = v9;
    }
    char v18 = v17;
    -[TabController _mutableTabsForTabGroup:]((uint64_t)self, v17);
    long long v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    mutableNormalTabs = self->_mutableNormalTabs;
    self->_mutableNormalTabs = v19;

    long long v21 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(NSMutableArray *)self->_mutableNormalTabs count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v36 = v22;
      _os_log_impl(&dword_1E102C000, v21, OS_LOG_TYPE_DEFAULT, "Read %zu normal tabs from saved state", buf, 0xCu);
    }

    if (!self->_didReadWindowState)
    {
      id v23 = [v4 privateTabGroup];
      -[TabController _mutableTabsForTabGroup:]((uint64_t)self, v23);
      uint64_t v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      mutablePrivateTabs = self->_mutablePrivateTabs;
      self->_mutablePrivateTabs = v24;

      uint64_t v26 = (id)WBS_LOG_CHANNEL_PREFIXTabGroup();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = [(NSMutableArray *)self->_mutablePrivateTabs count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v36 = v27;
        _os_log_impl(&dword_1E102C000, v26, OS_LOG_TYPE_DEFAULT, "Read %zu private tabs from saved state", buf, 0xCu);
      }
    }
    if ([v9 usesGlobalPinnedTabs])
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __39__TabController_Persistence__readState__block_invoke;
      v34[3] = &unk_1E6D79060;
      v34[4] = self;
      -[TabController _performWithFixedTabBarItems:]((uint64_t)self, v34);
    }
    long long v28 = -[TabController _activeTabDocumentForTabGroup:]((TabDocument *)self, v18);
    [(TabController *)self setNormalActiveTabDocument:v28];

    if (!self->_didReadWindowState)
    {
      id v29 = [v4 privateTabGroup];
      id v30 = -[TabController _activeTabDocumentForTabGroup:]((TabDocument *)self, v29);
      [(TabController *)self setPrivateActiveTabDocument:v30];
    }
    [(TabController *)self openInitialBlankTabDocumentIfNeeded];
    id v31 = -[TabController tabCollectionViewManager]((uint64_t)self);
    [v31 updateSnapshotIdentifiers];

    -[TabController _didCompleteStateRestoration]((uint64_t)self);
    self->_didReadWindowState = 1;
    if (self->_activeTabGroupUUID)
    {
      id v32 = [(TabController *)self tabGroupManager];
      [v32 beginParticipantPresenceReportingForTabGroupWithUUID:self->_activeTabGroupUUID];
    }
  }

  return 1;
}

void __39__TabController_Persistence__readState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pinnedTabsManager];
  [v2 addPinnedTabsObserver:*(void *)(a1 + 32)];
}

- (void)_insertTab:(char)a1 atIndex:(NSObject *)a2 inBackground:animated:updateUI:.cold.1(char a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = @"NO";
  if (a1) {
    id v3 = @"YES";
  }
  BOOL v4 = v3;
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1E102C000, a2, OS_LOG_TYPE_FAULT, "Active tab document is not present in the list of tab documents; private browsing enabled: %{public}@",
    v5,
    0xCu);
}

void __74__TabController__tabGroupShareSheetWithTabGroupActivityItemConfiguration___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Tab group share sheet failed: %{public}@", v6, v7, v8, v9, v10);
}

void __47__TabController__requestContactsAccessIfNeeded__block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_4(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Failed to obtain contacts access: %{public}@", v6, v7, v8, v9, v10);
}

- (void)focusedTabGroup
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1E102C000, v0, OS_LOG_TYPE_ERROR, "Couldn't find FTG %{public}@", v1, 0xCu);
}

- (void)_selectNewTabGroupIfNecessaryBeforeClosingTabGroup:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_4() privacyPreservingDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1E102C000, v4, v5, "Attempt to delete nonexistent tabGroup: %{public}@", v6, v7, v8, v9, v10);
}

void __82__TabController_didFetchRecentlyAcceptedSharedTabGroupWithUUID_acceptedShareDate___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "Recently accepted shared Tab Group with UUID %{public}@ was nil after reload.", (uint8_t *)&v3, 0xCu);
}

@end