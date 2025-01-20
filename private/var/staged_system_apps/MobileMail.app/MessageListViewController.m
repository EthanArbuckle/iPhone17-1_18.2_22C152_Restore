@interface MessageListViewController
+ (OS_os_log)log;
+ (id)signpostLog;
- (BOOL)_allowReadLaterActions;
- (BOOL)_allowSettingReadLaterAction;
- (BOOL)_allowsAutoSelectionOfInitialMessage;
- (BOOL)_canDisplayMessage:(id)a3;
- (BOOL)_canPerformExpandOp:(int64_t)a3;
- (BOOL)_inMultiSelectionMode;
- (BOOL)_isActivityEligibleForPredictionWithPayload:(id)a3;
- (BOOL)_isExpandedIndexPath:(id)a3;
- (BOOL)_isExpandedItemID:(id)a3;
- (BOOL)_isFlaggedMailbox;
- (BOOL)_isInSearch;
- (BOOL)_restoreDraftOrOutboxItemAtIndexPath:(id)a3;
- (BOOL)_selectAndDisplayInitialMessageIfNecessary;
- (BOOL)_shouldDisplaySearchButtons;
- (BOOL)_shouldPopToMessageListViewControllerFromConversationViewController:(id)a3;
- (BOOL)_shouldProcessButtonUpdates;
- (BOOL)_shouldShowClearHighImpactForMessageListItem:(id)a3;
- (BOOL)_shouldShowHighlights;
- (BOOL)_shouldShowItemIDAsConversation:(id)a3;
- (BOOL)_shouldUsePluralPrompt;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)conversationViewController:(id)a3 canAdvanceToNextConversationWithDirection:(int)a4;
- (BOOL)conversationViewControllerAllowsCategorizationAction:(id)a3;
- (BOOL)conversationViewControllerCanShowNoMessageSelectedView:(id)a3;
- (BOOL)conversationViewControllerShouldDismissOnDestructiveAction:(id)a3;
- (BOOL)disableAutoSelectionOfInitialMessage;
- (BOOL)hasSuggestions;
- (BOOL)isCategorizationEnabledForOptionsView:(id)a3;
- (BOOL)isFilterButtonAvailable;
- (BOOL)isFilterButtonEnabled;
- (BOOL)isInExpandedEnvironment;
- (BOOL)isIndexingMessagesForMessageListDataSource:(id)a3;
- (BOOL)isPresentingSearchViewController;
- (BOOL)isSearchControllerActive;
- (BOOL)isSearchSuggestionsVisible;
- (BOOL)isSearchViewController;
- (BOOL)isSearchViewControllerEditing;
- (BOOL)isSearching;
- (BOOL)isTransferStackVisible;
- (BOOL)messageListRecentSectionDataSourceIsInExpandedEnvironment:(id)a3;
- (BOOL)messageListSeparatorController:(id)a3 hasHeaderInSection:(int64_t)a4;
- (BOOL)messageListSeparatorController:(id)a3 hasHeaderInSectionAfterSection:(int64_t)a4;
- (BOOL)messageListSeparatorController:(id)a3 hasMessageContentInSection:(int64_t)a4;
- (BOOL)messageListSeparatorController:(id)a3 hasNonMessageSectionAboveSection:(int64_t)a4;
- (BOOL)messageListSeparatorController:(id)a3 isItemAtIndexPathSelected:(id)a4;
- (BOOL)messageListSeparatorController:(id)a3 isLastItemAtIndexPath:(id)a4;
- (BOOL)preferUnreadCountInsteadOfTotalCount:(id)a3;
- (BOOL)selectionModel:(id)a3 isItemIDExpandedThread:(id)a4;
- (BOOL)selectionModel:(id)a3 isThreadedItemID:(id)a4;
- (BOOL)shouldHideMessageListAvatar;
- (BOOL)shouldRouteActionToConversation:(SEL)a3 withCommand:(id)a4;
- (BOOL)shouldSelectInitialMessage;
- (BOOL)shouldShowNavigationBarSubtitle;
- (BOOL)shouldShowSubtitle;
- (BOOL)shouldUseCustomNavigationBarTitleView;
- (BOOL)shouldUseSelectionDataSourceForConversationViewController:(id)a3;
- (BOOL)showingPopoverViewController;
- (BOOL)suppressNoContentView;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGPoint)lastScrolledContentOffset;
- (Class)sectionListCellClassForMessageListSectionDataSource:(id)a3;
- (ConversationViewController)conversationViewController;
- (ConversationViewController)previewConversationViewController;
- (EFCancelable)scrollDigestToken;
- (EFCancelable)shouldHideMessageListAvatarToken;
- (EFCancelable)shouldShowCategorizationStatusToken;
- (EFFuture)flattenedMailboxesFuture;
- (EFFuture)initialLoadCompletedFuture;
- (EFFuture)stateRestorationFuture;
- (EFLocked)isRefreshing;
- (EFPair)lastSeenDatesForSelectedBucket;
- (EFPromise)scrollItemIndexPathPromise;
- (EFPromise)selectionPromise;
- (EFScheduler)parsecEventQueue;
- (EMCollectionItemID)lastAutoSelectedItemID;
- (EMCollectionItemID)loadingMessageItemID;
- (EMCollectionItemIDStateCapturer)stateCapturer;
- (FavoritesShortcutsProvider)favoritesShortcutsProvider;
- (LongPressableButtonItem)deleteButtonItem;
- (MFAccountsProvider)accountsProvider;
- (MFMailboxFilterBarButtonItem)filterButtonItem;
- (MFMailboxFilterPickerControl)filterPickerControl;
- (MFSearchBar)searchBar;
- (MFSearchController)searchController;
- (MFTransferSplitViewController)transferController;
- (MFTransferStackViewController)transferStackViewController;
- (MFTriageInteractionTarget)triageInteractionTarget;
- (MSParsecSearchSession)session;
- (MUIMessageListHighlightsSupplementaryView)highlightsSupplementaryView;
- (MUIMessageListNavigationBarTitleView)navigationBarTitleView;
- (MUISearchIndexStatus)indexStatus;
- (MailMainScene)scene;
- (MailStatusObserver)mailStatusObserver;
- (MailStatusViewController)mailStatusViewController;
- (MailboxPickerDelegate)mailboxPickerDelegate;
- (MessageListDragDropHelper)messageListDragDropHelper;
- (MessageListSearchViewController)messageListSearchViewController;
- (MessageListSelectionModel)previousMessageListSelectionModel;
- (MessageListViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7 diagnosticsHelper:(id)a8;
- (MessageListViewControllerDelegate)delegate;
- (MessageTriageInteractionHelper)messageTriageInteractionHelper;
- (NSArray)messageListItems;
- (NSArray)multiEditToolbarButtonItems;
- (NSArray)searchMultiEditToolbarButtonItems;
- (NSArray)searchToolbarItems;
- (NSDirectionalEdgeInsets)mf_extraNavigationBarMargins;
- (NSMutableDictionary)mailboxBrowseActivityPayload;
- (NSMutableSet)resolvedMailboxObjectIDs;
- (NSString)currentUserTypedPhrase;
- (NSString)messageListType;
- (UIBarButtonItem)composeButtonItem;
- (UIBarButtonItem)configureButtonItem;
- (UIBarButtonItem)filterPickerButtonItem;
- (UIBarButtonItem)markButtonItem;
- (UIBarButtonItem)moveButtonItem;
- (UIBarButtonItem)multiEditButtonItem;
- (UIBarButtonItem)searchEditButtonItem;
- (UIBarButtonItem)selectAllButtonItem;
- (UIBarButtonItem)selectButtonItem;
- (UIBarButtonItem)shelfButtonItem;
- (UIButton)composeAccessoryButton;
- (UIButton)moreAccessoryButton;
- (UIContentUnavailableView)noContentView;
- (UINavigationItem)mf_navigationItem;
- (UINavigationItem)navigationItemToConfigure;
- (UIRefreshControl)refreshControl;
- (UIViewController)tipPopoverController;
- (_TtC10MobileMail30MessageListSeparatorController)separatorController;
- (double)dragItemCornerRadius:(id)a3;
- (double)editingSeparatorInset;
- (double)nextAvailableLoadMoreInterval;
- (id)_bulkMarkMenuForCurrentSelection;
- (id)_categoryGroupingPreferenceMenuForBucket:(int64_t)a3;
- (id)_configureSelectButtonWithTitle:(id)a3;
- (id)_contextMenuConfigurationForIndexPaths:(id)a3 orbedIndexPath:(id)a4;
- (id)_createMailActionViewHeader;
- (id)_currentBulkSelectionWithDebugLabel:(id)a3;
- (id)_currentScrollableHint;
- (id)_displayMetrics;
- (id)_draftOrOutboxMessageAtIndexPath:(id)a3;
- (id)_focusedMessageAtNormalizedFocalPoint:(CGPoint)a3;
- (id)_layoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layout:(int64_t)a5;
- (id)_mailActionsViewControllerFromPresentedViewController:(id)a3;
- (id)_mailActionsViewDataSourceForMailActionsViewController:(id)a3 messageListItem:(id)a4 predictedMailbox:(id)a5 indexPath:(id)a6 cell:(id)a7;
- (id)_mailCategorizationOptionView;
- (id)_menuForConfigureButtonItem;
- (id)_menuTitleForSelection;
- (id)_messageListItemSelectionCreateIfNeeded:(BOOL)a3;
- (id)_noContentTitleForMailboxTypeString;
- (id)_observedMailboxes;
- (id)_observedMailboxesAndSmartMailboxPredicate;
- (id)_plistDictionaryFromSender:(id)a3;
- (id)_previewActionsForItemIDs:(id)a3 orbedItem:(id)a4;
- (id)_previewMessagesForSelectAllMode:(BOOL)a3;
- (id)_swipeActionForTriageAction:(int64_t)a3 indexPath:(id)a4;
- (id)_transferControllerWithMessages:(id)a3 options:(unint64_t)a4 interaction:(id)a5 didDismissHandler:(id)a6;
- (id)actionViewHeaderForCategorizationInteraction:(id)a3 messageListItem:(id)a4;
- (id)captureRestorationState;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)continuityMailboxActivityPayloadFromMailboxes:(id)a3 account:(id)a4 currentActivityPayload:(id)a5;
- (id)conversationViewController:(id)a3 messageListItemWithItemID:(id)a4;
- (id)conversationViewController:(id)a3 messagesToActOnForReferenceMessage:(id)a4;
- (id)createChangeFilterStateInteraction;
- (id)createMailboxFilterController;
- (id)createSearchMessagesInteraction;
- (id)currentEditButtonItem;
- (id)dropMailboxesForMessageListDragDropHelper:(id)a3;
- (id)ef_publicDescription;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)inputLanguages;
- (id)itemIDsForStateCaptureWithErrorString:(id *)a3;
- (id)labelForStateCapture;
- (id)lastSeenDatesForBucket:(int64_t)a3;
- (id)lastSelectedItemID;
- (id)leadingSwipeActionsConfigurationAtIndexPath:(id)a3;
- (id)mailboxQualifier;
- (id)messageContentRepresentationRequestForMessageTriageInteractionHelper:(id)a3 message:(id)a4;
- (id)messageDragDropHelper:(id)a3 itemContextForIndexPath:(id)a4;
- (id)messageListForMessageTriageInteractionHelper:(id)a3 messageListItem:(id)a4;
- (id)messageListItemSelectionForConversationViewController:(id)a3;
- (id)messageRepositoryForTriageInteraction:(id)a3;
- (id)messageTriageInteractionHelper:(id)a3 senderRepositoryForMessageListItems:(id)a4;
- (id)messageTriageInteractionHelperForConversationViewController:(id)a3;
- (id)mf_preferredTitle;
- (id)moreTriageInteraction:(id)a3 actionsViewControllerWithInteractionTarget:(id)a4 didDismissHandler:(id)a5;
- (id)preferredFocusEnvironments;
- (id)presentingViewControllerForTriageInteraction:(id)a3;
- (id)referenceMessageListItem;
- (id)referenceMessageListItemForFirstConversationWithSingleMessage:(BOOL)a3 markAsRead:(BOOL)a4;
- (id)requiredUserInfoKeysFromUserActivityPayload:(id)a3;
- (id)scrollableHintBlock;
- (id)selectMessageListViewButtonItem;
- (id)selectionModel:(id)a3 itemIDsInExpandedThread:(id)a4;
- (id)selectionModel:(id)a3 messageListItemsForItemIDs:(id)a4;
- (id)selectionModel:(id)a3 objectIDsForItemIDs:(id)a4;
- (id)selectionModel:(id)a3 predictMailboxForMovingMessagesWithIDs:(id)a4;
- (id)selectionModel:(id)a3 threadItemIDForItemInExpandedThread:(id)a4;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)trailingSwipeActionsConfigurationAtIndexPath:(id)a3;
- (id)transferStackViewController:(id)a3 displayMessageForMessageListItemWithItemID:(id)a4;
- (id)transferStackViewController:(id)a3 itemIDsToDisplayFromItemIDs:(id)a4;
- (id)undoManager;
- (id)undoManagerForMessageListDragDropHelper:(id)a3;
- (id)updateScrollableHintBlock;
- (int64_t)_expandOpFromPlist:(id)a3;
- (int64_t)barButtonItemConfiguration;
- (int64_t)preferredMessageListLayoutForSection:(int64_t)a3;
- (int64_t)selectedBucketForMessageListRecentSectionDataSource:(id)a3;
- (int64_t)selectionModel:(id)a3 countDeleteMovesToTrashForItemIDs:(id)a4;
- (int64_t)selectionModel:(id)a3 countForItemIDs:(id)a4;
- (int64_t)selectionModel:(id)a3 countShouldArchiveByDefaultForItemIDs:(id)a4;
- (int64_t)selectionModel:(id)a3 countSupportsArchivingForItemIDs:(id)a4;
- (int64_t)unreadBadgeCountForMessageTriageInteractionHelper:(id)a3;
- (unint64_t)_stackViewTransferOptions;
- (unint64_t)currentUnreadCount;
- (unint64_t)signpostID;
- (void)_addMessagesToStackWithItemIDs:(id)a3;
- (void)_adjustNoContentMessageAlpha:(id)a3;
- (void)_appStoreReviewNotifyFilterCriterionIfNecessaryFor:(id)a3;
- (void)_applyScrollableHint;
- (void)_applySelectionModel:(id)a3;
- (void)_archiveShortcutInvoked:(id)a3;
- (void)_bulkDeleteButtonLongPressed:(id)a3;
- (void)_bulkDeleteButtonPressed:(id)a3;
- (void)_bulkTransferButtonPressed:(id)a3;
- (void)_callUpdateScrollableHintBlock;
- (void)_cancelOrCleanupStateRestoration;
- (void)_checkMessageListLoadingCompleted:(id)a3;
- (void)_clearNavigationBarButtonItemMenu;
- (void)_clearVisibleSwipeActions;
- (void)_collapseThreadKeyCommandInvoked:(id)a3;
- (void)_commonInitWithDaemonInterface:(id)a3 mailboxes:(id)a4;
- (void)_configureLayoutListConfiguration:(id)a3 atSection:(int64_t)a4;
- (void)_configureSearch;
- (void)_deleteMessageCommandInvoked:(id)a3;
- (void)_deleteMessagesWithPreference:(unint64_t)a3;
- (void)_deleteOrArchiveConversationReferenceItemWithPreference:(unint64_t)a3;
- (void)_deregisterViewInteractions;
- (void)_didPerformMoveOrDestructiveInteraction:(id)a3;
- (void)_dismissSearchResults;
- (void)_doInitialMessageSelection;
- (void)_doOnInitialLoadCompletion:(id)a3;
- (void)_editButtonTapped:(id)a3;
- (void)_escapeShortcutInvoked:(id)a3;
- (void)_exitMultiSelectionForce:(BOOL)a3;
- (void)_expandCollapseThreadCommand:(id)a3;
- (void)_expandThreadKeyCommandInvoked:(id)a3;
- (void)_favoriteMailboxShortcutInvoked:(id)a3;
- (void)_filterCommand:(id)a3;
- (void)_finalizeMultipleSelection;
- (void)_finishRefreshingWaitForDraggingToEnd:(BOOL)a3;
- (void)_generativeModelsAvailabilityDidChange:(id)a3;
- (void)_handleDidSelectItemID:(id)a3 messageList:(id)a4 referenceItem:(id)a5 scrollToVisible:(BOOL)a6 userInitiated:(BOOL)a7 canRestoreDraft:(BOOL)a8 animated:(BOOL)a9 showConversationView:(BOOL)a10;
- (void)_handleDidSelectItemID:(id)a3 referenceItem:(id)a4 scrollToVisible:(BOOL)a5 userInitiated:(BOOL)a6 animated:(BOOL)a7;
- (void)_handleDidSelectItemID:(id)a3 referenceItem:(id)a4 scrollToVisible:(BOOL)a5 userInitiated:(BOOL)a6 canRestoreDraft:(BOOL)a7 animated:(BOOL)a8 showConversationView:(BOOL)a9;
- (void)_handleSelectedItem:(id)a3 itemID:(id)a4 messageList:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12;
- (void)_hideMailboxPickerOrMessageListAfterSelectionIfNeeded;
- (void)_initializeMailboxBrowseUserActivityWithMailboxes:(id)a3;
- (void)_invalidateCachedUseCompactRows;
- (void)_invalidateCollectionLayoutForHighlights;
- (void)_loadMessageWithItemID:(id)a3 messageList:(id)a4 messageListItem:(id)a5 scrollToVisible:(BOOL)a6 userInitiated:(BOOL)a7 animated:(BOOL)a8 showConversationView:(BOOL)a9 showAsConversation:(BOOL)a10;
- (void)_loadMoreMessagesWithMaxVisibleIndexPath:(id)a3;
- (void)_mailboxSearchKeyCommandInvoked:(id)a3;
- (void)_prepareForMoveOrDestructiveInteraction:(id)a3 completion:(id)a4;
- (void)_refresh:(id)a3;
- (void)_registerViewInteractions;
- (void)_reloadFlattenedMailboxes;
- (void)_removeMessagesFromStackWithItemIDs:(id)a3;
- (void)_reportReadTriageInteraction:(id)a3 didPerform:(BOOL)a4;
- (void)_restoreDraftOrOutboxItem:(id)a3;
- (void)_sceneDidEnterBackground;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_scrollMessageListToTop:(id)a3;
- (void)_scrollToCurrentMessage:(id)a3;
- (void)_selectAllButtonPressed:(id)a3;
- (void)_selectInitialMessageNow;
- (void)_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3 conversationViewController:(id)a4;
- (void)_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3 showConversationView:(BOOL)a4;
- (void)_setContentUnavailableTitle:(id)a3 animated:(BOOL)a4;
- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 preserveSelection:(BOOL)a5;
- (void)_setMailboxes:(id)a3;
- (void)_setRowDeletionEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_shelfButtonTapped:(id)a3;
- (void)_showConversationViewWithMessageListItem:(id)a3 itemID:(id)a4 messageList:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12;
- (void)_showTransferPickerForNonPredictiveMoveOfMessages:(id)a3;
- (void)_startObservationForStatusBarBadgeCountWithObservedMailboxes:(id)a3 smartMailboxPredicate:(id)a4;
- (void)_testing_disableMessageListFilter;
- (void)_testing_enableMessageListFilter;
- (void)_updateBackButtonImage;
- (void)_updateBackButtonImageWithCount:(unint64_t)a3;
- (void)_updateBucketBarIsHidden:(BOOL)a3;
- (void)_updateFiltersPickerAccessibilityHUD;
- (void)_updateLastSeenDates:(id)a3 forMailboxes:(id)a4 bucket:(int64_t)a5;
- (void)_updateLastSeenDatesForMessageListItemFuture:(id)a3 atIndexPath:(id)a4;
- (void)_updateLayoutMargins;
- (void)_updateListForChange:(id)a3;
- (void)_updateMailboxPositionUserActivity;
- (void)_updateNavigationBarButtons;
- (void)_updateNavigationBarButtonsWithForce:(BOOL)a3;
- (void)_updateNoContentViewAnimated:(BOOL)a3 suppressNoContentView:(BOOL)a4;
- (void)_updateResolvedMailboxObjectIDs;
- (void)_updateSelectionModelDidDeselectItemID:(id)a3;
- (void)_updateSelectionModelDidSelectItemID:(id)a3;
- (void)_updateSelectionPromiseForItemID:(id)a3 messageList:(id)a4 messageListCell:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12;
- (void)_updateStackViewController;
- (void)_updateStatusObservers;
- (void)_updateThreadingPreference:(id)a3;
- (void)_updateTitle;
- (void)_updateToolbarButtons;
- (void)applyFilterPredicate:(id)a3;
- (void)badgeCountUpdated:(id)a3 badgeCount:(int64_t)a4;
- (void)beginSearchWithQueryString:(id)a3 scope:(id)a4;
- (void)beginSearchWithSuggestion:(id)a3 scope:(id)a4;
- (void)changeTipShouldDisplayTo:(BOOL)a3;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3;
- (void)configureNavigationItem:(id)a3 forViewController:(id)a4;
- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4;
- (void)conversationViewController:(id)a3 advanceToNextConversationWithDirection:(int)a4;
- (void)conversationViewController:(id)a3 beginSearchWithSuggestion:(id)a4 scope:(id)a5;
- (void)conversationViewController:(id)a3 didPerform:(BOOL)a4 triageInteraction:(id)a5;
- (void)conversationViewController:(id)a3 didRemoveAllVisibleMessagesWithItemIDs:(id)a4;
- (void)conversationViewController:(id)a3 performTriageAction:(int64_t)a4 presentationSource:(id)a5;
- (void)conversationViewController:(id)a3 willRemoveAllVisibleMessagesWithItemIDs:(id)a4;
- (void)currentFocusChanged:(id)a3;
- (void)dealloc;
- (void)deleteAction:(id)a3 showChoices:(BOOL)a4;
- (void)deleteMessagesWithItemIDs:(id)a3;
- (void)deselectAllItemsInCollectionView:(id)a3 animated:(BOOL)a4;
- (void)deselectSelectedItemsInCollectionView;
- (void)didDismissMailboxFilterPickerViewController:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)didFinishLoadViewController;
- (void)didSelectTopHitWithItemID:(id)a3 messageList:(id)a4 animated:(BOOL)a5;
- (void)dismissSearchResultsAnimated:(BOOL)a3;
- (void)dismissTip;
- (void)enterEditMode;
- (void)exitEditMode;
- (void)filterPickerButtonPressed;
- (void)filterPickerViewModelDidChangeSelectedAccounts:(id)a3;
- (void)filterUIWithFilterInteraction:(id)a3;
- (void)focusSearchBarAnimated:(BOOL)a3;
- (void)handleCategoriesTappedForOptionView:(id)a3;
- (void)handleListViewTappedForOptionView:(id)a3;
- (void)highlightedMessagesController:(id)a3 didFindMessages:(id)a4;
- (void)highlightedMessagesViewDidProvideFeedbackForMessage:(id)a3 feedbackType:(int64_t)a4 feedbackFeature:(int64_t)a5;
- (void)highlightedMessagesViewDidSelectMessage:(id)a3;
- (void)invalidateNavigationItem:(id)a3 forViewController:(id)a4;
- (void)learnMoreForMessageListSectionDataSource:(id)a3;
- (void)mailActionsViewController:(id)a3 didSelectAction:(id)a4;
- (void)mailStatusViewControllerUndoButtonTapped:(id)a3;
- (void)mailboxFilterPickerViewController:(id)a3 didFinishPickingWithSelectedFilters:(id)a4;
- (void)mailboxStatusUpdated:(id)a3 statusInfo:(id)a4 forMailboxObjectID:(id)a5;
- (void)messageListDataSource:(id)a3 didConfigureSupplementaryView:(id)a4 elementKind:(id)a5 section:(id)a6;
- (void)messageListDataSource:(id)a3 didUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6;
- (void)messageListDataSource:(id)a3 willUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6 cleanSnapshot:(BOOL)a7;
- (void)messageListDataSourceDidSkipUpdate:(id)a3 section:(id)a4 change:(id)a5;
- (void)messageListSectionDataSource:(id)a3 addMessagesToStackWithItemIDs:(id)a4;
- (void)messageListSectionDataSource:(id)a3 deletedMessagesWithItemIdentifiers:(id)a4;
- (void)messageListSectionDataSource:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5 item:(id)a6 itemWasCached:(BOOL)a7 duration:(double)a8;
- (void)messageListSectionDataSource:(id)a3 handleRowSelectionAfterMovingMessagesWithItemIdentifiers:(id)a4;
- (void)parsecEventQueuePerformBlock:(id)a3;
- (void)presentSearchController:(id)a3;
- (void)presentTransferUIWithMoveInteraction:(id)a3 prediction:(id)a4 fromViewController:(id)a5 didDismissHandler:(id)a6;
- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)refreshHighlightedMessagesController;
- (void)reloadDataSource;
- (void)reportEngagementAction:(int64_t)a3 onItemID:(id)a4;
- (void)restoreState:(id)a3;
- (void)resumeRefreshAnimationIfNecessary;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectItemID:(id)a3 userInitiated:(BOOL)a4 animated:(BOOL)a5;
- (void)selectMessageAtIndex:(int64_t)a3;
- (void)selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3;
- (void)selectionModel:(id)a3 deselectItemID:(id)a4;
- (void)selectionModel:(id)a3 selectItemID:(id)a4;
- (void)setBarButtonItemConfiguration:(int64_t)a3;
- (void)setComposeAccessoryButton:(id)a3;
- (void)setComposeButtonItem:(id)a3;
- (void)setConfigureButtonItem:(id)a3;
- (void)setConversationViewController:(id)a3;
- (void)setCurrentUnreadCount:(unint64_t)a3;
- (void)setCurrentUserTypedPhrase:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButtonItem:(id)a3;
- (void)setDisableAutoSelectionOfInitialMessage:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFavoritesShortcutsProvider:(id)a3;
- (void)setFilterButtonEnabled:(BOOL)a3;
- (void)setFilterButtonItem:(id)a3;
- (void)setFilterPickerButtonItem:(id)a3;
- (void)setFilterPickerControl:(id)a3;
- (void)setFiltersEnabled:(BOOL)a3;
- (void)setFlattenedMailboxesFuture:(id)a3;
- (void)setHighlightsSupplementaryView:(id)a3;
- (void)setIndexStatus:(id)a3;
- (void)setIsRefreshing:(id)a3;
- (void)setLastAutoSelectedItemID:(id)a3;
- (void)setLastScrolledContentOffset:(CGPoint)a3;
- (void)setLastSelectedItemID:(id)a3;
- (void)setLoadingMessageItemID:(id)a3;
- (void)setMailStatusObserver:(id)a3;
- (void)setMailStatusViewController:(id)a3;
- (void)setMailboxBrowseActivityPayload:(id)a3;
- (void)setMailboxPickerDelegate:(id)a3;
- (void)setMailboxes:(id)a3;
- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4;
- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4 bucket:(int64_t)a5;
- (void)setMailboxes:(id)a3 senderSpecificMessageListItem:(id)a4 bucket:(int64_t)a5 forceReload:(BOOL)a6;
- (void)setMarkButtonItem:(id)a3;
- (void)setMessageListDragDropHelper:(id)a3;
- (void)setMessageListItems:(id)a3;
- (void)setMessageListSearchViewController:(id)a3;
- (void)setMessageListType:(id)a3;
- (void)setMessageTriageInteractionHelper:(id)a3;
- (void)setMoreAccessoryButton:(id)a3;
- (void)setMoveButtonItem:(id)a3;
- (void)setMultiEditButtonItem:(id)a3;
- (void)setMultiEditToolbarButtonItems:(id)a3;
- (void)setNavigationBarTitleView:(id)a3;
- (void)setNavigationItemToConfigure:(id)a3;
- (void)setNextAvailableLoadMoreInterval:(double)a3;
- (void)setNoContentView:(id)a3;
- (void)setParsecEventQueue:(id)a3;
- (void)setPreviewConversationViewController:(id)a3;
- (void)setPreviousMessageListSelectionModel:(id)a3;
- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6;
- (void)setScene:(id)a3;
- (void)setScrollDigestToken:(id)a3;
- (void)setScrollItemIndexPathPromise:(id)a3;
- (void)setScrollableHintBlock:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchEditButtonItem:(id)a3;
- (void)setSearchMultiEditToolbarButtonItems:(id)a3;
- (void)setSearchToolbarItems:(id)a3;
- (void)setSelectAllButtonItem:(id)a3;
- (void)setSelectButtonItem:(id)a3;
- (void)setSelectionPromise:(id)a3;
- (void)setSeparatorController:(id)a3;
- (void)setSession:(id)a3;
- (void)setShelfButtonItem:(id)a3;
- (void)setShouldHideMessageListAvatar:(BOOL)a3;
- (void)setShouldHideMessageListAvatarToken:(id)a3;
- (void)setShouldSelectInitialMessage:(BOOL)a3;
- (void)setShouldShowCategorizationStatusToken:(id)a3;
- (void)setSplitViewControllerNeedsFocusUpdate;
- (void)setStateRestorationFuture:(id)a3;
- (void)setSuppressNoContentView:(BOOL)a3;
- (void)setSwipeActionVisible:(BOOL)a3;
- (void)setTipPopoverController:(id)a3;
- (void)setToolbarItems:(id)a3 animated:(BOOL)a4;
- (void)setTransferController:(id)a3;
- (void)setTransferStackViewController:(id)a3;
- (void)setTriageInteractionTarget:(id)a3;
- (void)setUpdateScrollableHintBlock:(id)a3;
- (void)setlastSeenDatesForSelectedBucket:(id)a3;
- (void)setupTipsObserver;
- (void)showBlankCellAlertForMessageListSectionDataSource:(id)a3 itemID:(id)a4 indexPath:(id)a5 reason:(id)a6;
- (void)supressNoContentViewAnimated:(BOOL)a3;
- (void)suspendRefreshAnimationIfNecessary;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBarButtons;
- (void)updateFilterByUnreadRules;
- (void)updateFilterControlWithFilterViewModel:(id)a3;
- (void)updateForSplitViewControllerHidingMessageList;
- (void)updateHighlightsVisibility;
- (void)updateNoContentViewAnimated:(BOOL)a3;
- (void)updateState:(id)a3 withMailboxes:(id)a4;
- (void)updateToolbarButtonTitles;
- (void)updateUserActivityState:(id)a3;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waitForLocalAndRemoteSearchCompletion:(id)a3;
- (void)willBeginDragForMessageListDragDropHelper:(id)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation MessageListViewController

- (id)requiredUserInfoKeysFromUserActivityPayload:(id)a3
{
  v3 = [a3 allKeys];
  v4 = +[NSMutableSet setWithArray:v3];

  [v4 removeObject:MSMailActivityHandoffBrowseMailboxKeyFocusedMessageID];

  return v4;
}

- (void)updateUserActivityState:(id)a3
{
  id v5 = a3;
  v4 = [(MessageListViewController *)self mailboxBrowseActivityPayload];
  [v5 setUserInfo:v4];
}

- (void)setupTipsObserver
{
  swift_getObjectType();
  v3 = self;
  sub_10000C9BC();
}

- (UIRefreshControl)refreshControl
{
  refreshControl = self->_refreshControl;
  if (!refreshControl)
  {
    v4 = (UIRefreshControl *)objc_alloc_init((Class)UIRefreshControl);
    id v5 = self->_refreshControl;
    self->_refreshControl = v4;

    [(UIRefreshControl *)self->_refreshControl addTarget:self action:"_refresh:" forControlEvents:4096];
    refreshControl = self->_refreshControl;
  }

  return refreshControl;
}

- (void)setFilterButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MessageListViewController *)self filterButtonItem];
  [v4 setFilterEnabled:v3];
}

- (id)createSearchMessagesInteraction
{
  swift_getObjectType();
  BOOL v3 = self;
  id v6 = (id)sub_10000DC50();

  return v6;
}

- (id)createChangeFilterStateInteraction
{
  swift_getObjectType();
  BOOL v3 = self;
  id v6 = (id)sub_10000EAA8();

  return v6;
}

- (void)badgeCountUpdated:(id)a3 badgeCount:(int64_t)a4
{
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:&v5];
}

- (void)_adjustNoContentMessageAlpha:(id)a3
{
  id v9 = a3;
  id v4 = [(MessageListViewController *)self noContentView];
  if (v4
    && ([(MessageListViewController *)self messageListPositionHelper],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 userIsScrolling],
        v5,
        v6))
  {
    if (([(UIRefreshControl *)self->_refreshControl isHidden] & 1) == 0
      && [v9 isDragging])
    {
      [(MessageListViewController *)self supressNoContentViewAnimated:0];
      [(MessageListViewController *)self setSuppressNoContentView:0];
    }
  }
  else
  {
    unsigned __int8 v7 = [(MessageListViewController *)self suppressNoContentView];
    if (v4) {
      char v8 = 1;
    }
    else {
      char v8 = v7;
    }
    if ((v8 & 1) == 0
      && [(UIRefreshControl *)self->_refreshControl isHidden]
      && [(MessageListViewController *)self isInitialCellConfigurationCompleted])
    {
      [(MessageListViewController *)self updateNoContentViewAnimated:1];
    }
  }
}

- (void)updateFilterByUnreadRules
{
  id v4 = +[MailTipsHelper shared];
  BOOL v3 = [(MessageListViewController *)self dataSource];
  [v4 updateFilterByUnreadRulesWithAmountOfEmails:[v3 numberOfItems] amountOfUnreads:[self currentUnreadCount]];
}

- (void)changeTipShouldDisplayTo:(BOOL)a3
{
  swift_getObjectType();
  id v4 = self;
  _convertObjCBoolToBool(_:)();
  sub_100058120();
}

- (void)configureNavigationItem:(id)a3 forViewController:(id)a4
{
  id v5 = a3;
  -[MessageListViewController setNavigationItemToConfigure:](self, "setNavigationItemToConfigure:");
  [(MessageListViewController *)self _updateTitle];
  [(MessageListViewController *)self _configureSearch];
  [(MessageListViewController *)self updateBarButtons];
}

- (void)updateBarButtons
{
  [(MessageListViewController *)self _updateToolbarButtons];

  [(MessageListViewController *)self _updateNavigationBarButtons];
}

- (id)mailboxQualifier
{
  BOOL v3 = [(MessageListViewController *)self state];
  unsigned int v4 = [v3 containsDraftsMailbox];

  if (v4)
  {
    id v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"DRAFTS_FORMAT" value:&stru_100619928 table:@"Main"];
  }
  else
  {
    unsigned int v7 = [(MessageListViewController *)self _isFlaggedMailbox];
    char v8 = +[NSBundle mainBundle];
    id v5 = v8;
    if (v7) {
      [v8 localizedStringForKey:@"FLAGGED_FORMAT" value:&stru_100619928 table:@"Main"];
    }
    else {
    uint64_t v6 = [v8 localizedStringForKey:@"UNREAD_FORMAT" value:&stru_100619928 table:@"Main"];
    }
  }
  id v9 = (void *)v6;

  return v9;
}

- (void)updateFilterControlWithFilterViewModel:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [(MessageListViewController *)self filterPickerControl];
  unsigned int v5 = [v7 isFilterEnabled];
  if (v5)
  {
    uint64_t v6 = [v7 selectedFiltersDescription];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v4 setFilterDescription:v6];
  if (v5) {
}
  }

- (int64_t)selectedBucketForMessageListRecentSectionDataSource:(id)a3
{
  if ([(MessageListViewController *)self isBucketBarHidden]) {
    return 0;
  }

  return (int64_t)[(MessageListViewController *)self selectedBucket];
}

- (void)_doInitialMessageSelection
{
  if (([UIApp launchedToTest] & 1) != 0
    || +[EMInternalPreferences preferenceEnabled:15])
  {
    v11 = +[MessageListViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      objc_claimAutoreleasedReturnValue();
      sub_100006770();
    }
    goto LABEL_5;
  }
  unsigned int v5 = [(MessageListViewController *)self conversationViewController];
  v11 = [v5 referenceMessageListItem];

  uint64_t v6 = [(MessageListViewController *)self scene];
  if (!v11 && [v6 isInExpandedEnvironment])
  {
    id v7 = [v6 splitViewController];
    id v8 = [v7 displayMode];
    if (v8 != (id)2)
    {
      v2 = [v6 splitViewController];
      if ([v2 displayMode] != (id)3) {
        goto LABEL_12;
      }
    }
    id v9 = [(MessageListViewController *)self state];
    if ([v9 containsDraftsOrOutbox])
    {

      if (v8 == (id)2)
      {
LABEL_13:

LABEL_17:
        [(MessageListViewController *)self _selectInitialMessageNow];
        goto LABEL_18;
      }
LABEL_12:

      goto LABEL_13;
    }
    id v10 = sub_100048FD8(self);

    if (v8 != (id)2) {
    if (v10)
    }
      goto LABEL_17;
    [(MessageListViewController *)self setShouldSelectInitialMessage:[(MessageListViewController *)self _allowsAutoSelectionOfInitialMessage]];
  }
LABEL_18:

LABEL_5:
}

- (id)ef_publicDescription
{
  uint64_t v3 = objc_opt_class();
  unsigned int v4 = [(MessageListViewController *)self messageRepository];
  unsigned int v5 = [(MessageListViewController *)self mailboxes];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@: %p> Repository:%@ Mailboxes:%@", v3, self, v4, v5];

  return v6;
}

- (void)resumeRefreshAnimationIfNecessary
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v2 = +[EFScheduler mainThreadScheduler];
  [v2 performBlock:&v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (MFMailboxFilterPickerControl)filterPickerControl
{
  filterPickerControl = self->_filterPickerControl;
  if (!filterPickerControl)
  {
    id v4 = [MFMailboxFilterPickerControl alloc];
    unsigned int v5 = [(MessageListViewController *)self navigationController];
    uint64_t v6 = [v5 toolbar];
    [v6 bounds];
    id v7 = -[MFMailboxFilterPickerControl initWithFrame:](v4, "initWithFrame:");

    [(MFMailboxFilterPickerControl *)v7 addTarget:self action:"filterPickerButtonPressed" forEvents:64];
    id v8 = self->_filterPickerControl;
    self->_filterPickerControl = v7;

    filterPickerControl = self->_filterPickerControl;
  }

  return filterPickerControl;
}

- (NSDirectionalEdgeInsets)mf_extraNavigationBarMargins
{
  uint64_t v3 = [(MessageListViewController *)self state];
  unsigned __int8 v4 = [v3 useSplitViewStyling];

  double v5 = 8.0;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = [(MessageListViewController *)self layoutValuesHelper];
    id v7 = [v6 defaultLayoutValues];
    [v7 leadingPadding];
    double v9 = v8;
    [(MessageListViewController *)self systemMinimumLayoutMargins];
    double v5 = v9 - v10;
  }
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = v5;
  result.trailing = v13;
  result.bottom = v12;
  result.leading = v14;
  result.top = v11;
  return result;
}

- (void)reloadDataSource
{
  [(MessageListViewController *)self loadViewIfNeeded];
  [(MessageListViewController *)self setCurrentUnreadCount:0x8000000000000000];
  id v6 = [(MessageListViewController *)self mailboxes];
  uint64_t v3 = [(MessageListViewController *)self createMessageListForReload];
  if (v3)
  {
    unsigned __int8 v4 = [(MessageListViewController *)self currentFilterPredicate];
    double v5 = sub_10004BC9C(self, v4);
    sub_10004E8BC(self, v6, v5);
  }
  if ([(MessageListViewController *)self _isInSearch]) {
    [(MessageListViewController *)self dismissSearchResultsAnimated:1];
  }
  [(MessageListViewController *)self setSuppressNoContentView:1];
  [(MessageListViewController *)self _setContentUnavailableTitle:0 animated:0];
  [(MessageListViewController *)self reloadDataSourceWithMessageList:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v8 viewDidAppear:a3];
  if (![(MessageListViewController *)self isSearchViewController]
    && ![(MessageListViewController *)self _isInSearch])
  {
    unsigned __int8 v4 = [(MessageListViewController *)self conversationViewController];
    [v4 setDelegate:self];
  }
  double v5 = [(MessageListViewController *)self presentedViewController];
  id v6 = [(MessageListViewController *)self searchController];

  if (v5 == v6)
  {
    id v7 = [(MessageListViewController *)self messageListSearchViewController];
    [v7 updateBarButtons];
  }
  else
  {
    [(MessageListViewController *)self changeTipShouldDisplayTo:1];
  }
}

- (void)_reloadFlattenedMailboxes
{
  uint64_t v3 = [(MessageListViewController *)self flattenedMailboxesFuture];
  [v3 cancel];

  unsigned __int8 v4 = [(MessageListViewController *)self state];
  if ([v4 isUnifiedMailbox])
  {
    double v5 = +[EFPromise promise];
    id v6 = [v5 future];
    [(MessageListViewController *)self setFlattenedMailboxesFuture:v6];

    id v7 = [(MessageListViewController *)self mailboxes];
    objc_super v8 = [v7 ef_map:&stru_100609D00];

    double v9 = +[NSCompoundPredicate orPredicateWithSubpredicates:v8];
    id v10 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v9 sortDescriptors:&__NSArray0__struct];
    double v11 = [(MessageListViewController *)self mailboxRepository];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10014E3F0;
    v15[3] = &unk_100608300;
    id v12 = v5;
    id v16 = v12;
    [v11 performQuery:v10 completionHandler:v15];
  }
  else if (([v4 containsSmartMailbox] & 1) == 0)
  {
    double v13 = [(MessageListViewController *)self mailboxes];
    double v14 = +[EFFuture futureWithResult:v13];
    [(MessageListViewController *)self setFlattenedMailboxesFuture:v14];
  }
}

- (void)refreshHighlightedMessagesController
{
  v4.receiver = self;
  v4.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v4 refreshHighlightedMessagesController];
  uint64_t v3 = [(MessageListViewController *)self highlightsSupplementaryView];
  [v3 showBelowLineMessages:0];
}

- (MUIMessageListHighlightsSupplementaryView)highlightsSupplementaryView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightsSupplementaryView);

  return (MUIMessageListHighlightsSupplementaryView *)WeakRetained;
}

- (Class)sectionListCellClassForMessageListSectionDataSource:(id)a3
{
  uint64_t v3 = objc_opt_class();

  return (Class)v3;
}

- (id)createMailboxFilterController
{
  unsigned __int8 v3 = [(MessageListViewController *)self shouldDisplayGroupedSenders];
  id v4 = objc_alloc((Class)MUIMailboxFilterController);
  double v5 = [(MessageListViewController *)self mailboxes];
  id v6 = [(MessageListViewController *)self currentFocus];
  id v7 = MFMailDirectory();
  uint64_t v8 = objc_opt_class();
  LOBYTE(v11) = v3 ^ 1;
  id v9 = [v4 initWithMailboxes:v5 focus:v6 baseStoragePath:v7 defaultsRepresentationProvider:&stru_100609FD8 filterRepresentationProvider:&stru_10060A058 mailboxFilterClass:v8 filterProviderClass:objc_opt_class() isFilteringAvailable:v11];

  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v25 = a3;
  -[MessageListViewController _adjustNoContentMessageAlpha:](self, "_adjustNoContentMessageAlpha:");
  if (*((unsigned char *)self + 8))
  {
    [v25 contentOffset];
    CGFloat v5 = v4;
    double v7 = v6;
    if (([(MessageListViewController *)self isBucketBarHidden] & 1) == 0)
    {
      uint64_t v8 = [(MessageListViewController *)self bucketsViewController];
      id v9 = [v8 viewIfLoaded];
      id v10 = [v9 superview];

      if (v10)
      {
        uint64_t v11 = [(MessageListViewController *)self mf_navigationItem];
        id v12 = [v11 titleView];

        unsigned int v13 = [(MessageListViewController *)self shouldShowNavigationBarSubtitle];
        if ((((v12 == 0) ^ v13) & 1) == 0) {
          [(MessageListViewController *)self _updateTitle];
        }
        double v14 = [(MessageListViewController *)self navigationBarTitleView];
        [v14 setSubtitleHidden:v13 ^ 1 animated:1];
      }
    }
    v15 = [(MessageListViewController *)self oldestItemsIDsByMailboxObjectID];

    if (v15)
    {
      id v16 = v25;
      if ([v16 isTracking]) {
        unsigned int v17 = 1;
      }
      else {
        unsigned int v17 = [v16 isDecelerating];
      }
      double y = self->_lastScrolledContentOffset.y;
      [v16 contentInset];
      double v20 = v19;
      +[NSDate timeIntervalSinceReferenceDate];
      if (v17 && v7 > y && v7 > -v20 && v21 >= self->_nextAvailableLoadMoreInterval)
      {
        v22 = [v16 indexPathsForVisibleItems];
        v23 = [v22 lastObject];

        if (v23)
        {
          [(MessageListViewController *)self _loadMoreMessagesWithMaxVisibleIndexPath:v23];
          +[NSDate timeIntervalSinceReferenceDate];
          self->_nextAvailableLoadMoreInterval = v24 + 0.5;
        }
      }
      self->_lastScrolledContentOffset.x = v5;
      self->_lastScrolledContentOffset.double y = v7;
    }
  }
}

- (void)_registerViewInteractions
{
  if (![(MessageListViewController *)self isSearchViewController])
  {
    if (!self || !self->_searchMessagesInteraction)
    {
      unsigned __int8 v3 = [(MessageListViewController *)self createSearchMessagesInteraction];
      sub_100058CA8((uint64_t)self, v3);

      double v4 = [(MessageListViewController *)self searchBar];
      if (self) {
        searchMessagesInteraction = self->_searchMessagesInteraction;
      }
      else {
        searchMessagesInteraction = 0;
      }
      id v9 = v4;
      [v4 addInteraction:searchMessagesInteraction];
    }
    if (!self || !self->_changeFilterStateInteraction)
    {
      double v6 = [(MessageListViewController *)self createChangeFilterStateInteraction];
      sub_100058D7C((uint64_t)self, v6);

      double v7 = [(MessageListViewController *)self view];
      if (self) {
        changeFilterStateInteraction = self->_changeFilterStateInteraction;
      }
      else {
        changeFilterStateInteraction = 0;
      }
      id v10 = v7;
      [v7 addInteraction:changeFilterStateInteraction];
    }
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v7 cellHelper];
    id v10 = [v9 messageListItem];
    if (v10)
    {
      uint64_t v11 = [(MessageListViewController *)self scene];
      id v12 = [v11 daemonInterface];
      unsigned int v13 = [v12 interactionLogger];

      double v14 = sub_100049FC0((uint64_t)[v9 style]);
      [v13 messageListDisplayEndedForListItem:v10 cellStyle:v14];
    }
    else
    {
      v15 = +[MessageListViewController log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v16 = (objc_class *)objc_opt_class();
        unsigned int v17 = NSStringFromClass(v16);
        int v18 = 138412802;
        double v19 = v17;
        __int16 v20 = 2048;
        double v21 = self;
        __int16 v22 = 2112;
        id v23 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "<%@: %p> Looks like collection view tried to end displaying a cell that is no longer valid. Ignoring interaction log for indexPath: %@", (uint8_t *)&v18, 0x20u);
      }
    }
  }
}

- (void)didFinishLoadViewController
{
  if ([(MessageListViewController *)self isInitialCellConfigurationCompleted]&& ([(MessageListViewController *)self didNotifyExtendedLaunchTracker] & 1) == 0&& ![(MessageListViewController *)self isSearchViewController])
  {
    unsigned __int8 v3 = +[MessageListViewController log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Launch] Did finish load view controller", buf, 2u);
    }

    [(MessageListViewController *)self setDidNotifyExtendedLaunchTracker:1];
    [(MessageListViewController *)self cancelQueueSuspensionTimeout];
    double v4 = [(MessageListViewController *)self scene];
    CGFloat v5 = [v4 extendedLaunchTracker];
    [v5 didFinishLoadViewController:self scene:v4];

    dispatch_time_t v6 = dispatch_time(0, 250000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000063A8;
    block[3] = &unk_1006047A0;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_setMailboxes:(id)a3
{
  id v7 = a3;
  double v4 = [(MessageListViewController *)self mailboxes];

  if (v4) {
    [(MessageListViewController *)self _callUpdateScrollableHintBlock];
  }
  [(MessageListViewController *)self setPrimitiveMailboxes:v7];
  if (v7) {
    [(MessageListViewController *)self _applyScrollableHint];
  }
  [(MessageListViewController *)self _updateResolvedMailboxObjectIDs];
  [(MessageListViewController *)self _reloadFlattenedMailboxes];
  [(MessageListViewController *)self _updateStatusObservers];
  CGFloat v5 = [(MessageListViewController *)self mailboxes];
  [(MessageListViewController *)self _initializeMailboxBrowseUserActivityWithMailboxes:v5];

  dispatch_time_t v6 = [(MessageListViewController *)self cellsController];
  [v6 reportMessageListCellMetrics];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v13 traitCollectionDidChange:v4];
  CGFloat v5 = [(MessageListViewController *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {
    dispatch_time_t v6 = [(MessageListViewController *)self layoutValuesHelper];
    id v7 = [(MessageListViewController *)self view];
    [v6 updateTintColorFromView:v7];
  }
  if (objc_msgSend(v5, "mf_traitDifferenceAffectsTextLayout:", v4))
  {
    id v8 = [v5 mf_useSplitViewStyling];
    id v9 = [(MessageListViewController *)self state];
    [v9 setUseSplitViewStyling:v8];

    id v10 = [(MessageListViewController *)self layoutValuesHelper];
    [v10 setTraitCollection:v5];

    [(MessageListViewController *)self _updateToolbarButtons];
    [(MessageListViewController *)self _updateListForChange:0];
    [(MessageListViewController *)self _updateLayoutMargins];
    [(MessageListViewController *)self _updateStackViewController];
    uint64_t v11 = [(MessageListViewController *)self collectionView];
    id v12 = [v11 collectionViewLayout];
    [v12 invalidateLayout];
  }
}

- (void)_applyScrollableHint
{
  unsigned __int8 v3 = [(MessageListViewController *)self scrollableHintBlock];
  id v4 = [(MessageListViewController *)self navigationController];
  CGFloat v5 = [v4 toolbar];

  if (v3)
  {
    dispatch_time_t v6 = v3[2](v3);
    id v7 = [(MessageListViewController *)self view];
    [v7 frame];
    id v9 = +[NSNumber numberWithDouble:v8];
    id v10 = [v9 stringValue];
    uint64_t v11 = [v6 objectForKeyedSubscript:v10];

    if (v11)
    {
      id v12 = +[MessageListViewController log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v13 = (objc_class *)objc_opt_class();
        double v14 = NSStringFromClass(v13);
        int v15 = 138412802;
        id v16 = v14;
        __int16 v17 = 2048;
        int v18 = self;
        __int16 v19 = 2048;
        id v20 = [v11 integerValue];
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> Setting toolbar._appearanceHint:%ld", (uint8_t *)&v15, 0x20u);
      }
      [v5 _setAppearanceHint:[v11 integerValue]];
    }
  }
}

- (id)continuityMailboxActivityPayloadFromMailboxes:(id)a3 account:(id)a4 currentActivityPayload:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  double v8 = [v6 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if (v9)
    {
      id v10 = v9;
      if (![v9 smartMailboxType])
      {
        uint64_t v11 = (id *)&MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeVIP;
        goto LABEL_14;
      }
      if ([v10 smartMailboxType] == (id)8 && objc_msgSend(v10, "type") == (id)7)
      {
        uint64_t v11 = (id *)&MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes;
LABEL_14:
        id v15 = *v11;
        goto LABEL_15;
      }
      goto LABEL_12;
    }
  }
  if ([v6 count] == (id)1)
  {
    id v12 = [v8 objectID];
    objc_super v13 = [v12 url];
    double v14 = [v13 absoluteString];

    id v10 = 0;
    id v15 = 0;
    goto LABEL_16;
  }
  if (![0 isInboxMailbox])
  {
    id v10 = 0;
LABEL_12:
    id v15 = 0;
    goto LABEL_15;
  }
  id v15 = MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes;
  id v10 = 0;
LABEL_15:
  double v14 = 0;
LABEL_16:
  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  [v16 setDictionary:v7];
  if (v15)
  {
    [v16 setObject:v15 forKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType];
    __int16 v17 = &MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL;
LABEL_20:
    [v16 removeObjectForKey:*v17];
    goto LABEL_21;
  }
  if (v14)
  {
    [v16 setObject:v14 forKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL];
    __int16 v17 = &MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType;
    goto LABEL_20;
  }

  id v16 = 0;
LABEL_21:

  return v16;
}

- (void)_updateLayoutMargins
{
  [(MessageListViewController *)self systemMinimumLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v32 = [(MessageListViewController *)self layoutValuesHelper];
  [v32 setSystemLayoutMargins:v4, v6, v8, v10];

  [(MessageListViewController *)self mf_updateExtraNavigationBarMargins];
  id v33 = [(MessageListViewController *)self view];
  [v33 layoutMargins];
  double v12 = v11;
  double v14 = v13;

  id v34 = [(MessageListViewController *)self view];
  [v34 layoutMargins];
  double v16 = v15;

  id v35 = [(MessageListViewController *)self view];
  [v35 layoutMargins];
  double v18 = v17;

  id v36 = [(MessageListViewController *)self searchBar];
  [v36 _setOverrideContentInsets:10 forRectEdges:v12, v16, v14, v18];

  if ([(MessageListViewController *)self focusAllowed])
  {
    id v37 = [(MessageListViewController *)self state];
    double v19 = 0.0;
    if ([v37 useSplitViewStyling])
    {
      id v20 = [(MessageListViewController *)self view];
      [v20 safeAreaInsets];
      double v19 = v16 - v21;
    }
    id v38 = [(MessageListViewController *)self state];
    double v22 = 0.0;
    if ([v38 useSplitViewStyling])
    {
      id v23 = [(MessageListViewController *)self view];
      [v23 directionalLayoutMargins];
      double v22 = v24;
    }
    id v39 = [(MessageListViewController *)self layoutValuesHelper];
    id v25 = [v39 defaultLayoutValues];
    [v25 leadingToIndicatorMargin];
    double v27 = v26;
    v28 = [(MessageListViewController *)self layoutValuesHelper];
    v29 = [v28 defaultLayoutValues];
    [v29 indicatorToTrailingMargin];
    double v31 = v22 + v30;

    id v40 = [(MessageListViewController *)self delegate];
    [v40 messageListViewController:self updateLayoutMarginsForFocusBannerView:v19 + v27];
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(MessageListViewController *)self messageListPositionHelper];

  if (v8)
  {
    double v9 = [(MessageListViewController *)self messageListPositionHelper];
    [v9 targetContentOffsetForProposedContentOffset:x, y];
    double v11 = v10;
    double v13 = v12;

    double v14 = [(MessageListViewController *)self scene];
    if ([v14 isInExpandedEnvironment])
    {
    }
    else
    {

      if (v11 != x || v13 != y) {
        [v7 flashScrollIndicators];
      }
    }
  }
  else
  {
    double v11 = x;
    double v13 = y;
  }

  double v15 = v11;
  double v16 = v13;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (void)setMailboxes:(id)a3 senderSpecificMessageListItem:(id)a4 bucket:(int64_t)a5 forceReload:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  double v12 = [(MessageListViewController *)self mailboxes];
  unsigned int v13 = [v12 isEqualToArray:v10];

  if ([(MessageListViewController *)self isBlackPearlEnabled])
  {
    id v14 = [(MessageListViewController *)self senderSpecificMessageListItem];

    id v15 = [(MessageListViewController *)self selectedBucket];
    if (v13 && v14 == v11 && v15 == (id)a5)
    {
LABEL_5:
      if (!v6) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  else if (v13)
  {
    goto LABEL_5;
  }
  [(MessageListViewController *)self setSenderSpecificMessageListItem:v11];
  [(MessageListViewController *)self setSelectedBucket:a5];
  [(MessageListViewController *)self setUnseenPredicate:0];
  double v16 = [(MessageListViewController *)self bucketsViewController];
  [v16 clearSessionState];

  [(MessageListViewController *)self _selectBucket:a5];
  [(MessageListViewController *)self _setMailboxes:v10];
  [(MessageListViewController *)self setPreviousMessageListSelectionModel:0];
  [(MessageListViewController *)self setLastSelectedMessageListItems:0];
LABEL_9:
  double v17 = +[MessageListViewController log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = [v10 firstObject];
    double v21 = [v11 ef_publicDescription];
    int v22 = 138413058;
    id v23 = v19;
    __int16 v24 = 2048;
    id v25 = self;
    __int16 v26 = 2112;
    double v27 = v20;
    __int16 v28 = 2112;
    v29 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%@: %p> Setting message list view to new mailboxes (first mailbodouble x = %@), sender: %@", (uint8_t *)&v22, 0x2Au);
  }
  [(MessageListViewController *)self reloadFromMailboxes];
LABEL_12:
}

- (void)messageListDataSourceDidSkipUpdate:(id)a3 section:(id)a4 change:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v15 = self;
  id v10 = a5;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  unsigned int v13 = +[EFScheduler mainThreadScheduler];
  [v13 performBlock:&v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MessageListViewController;
  -[MessageListViewController viewWillAppear:](&v22, "viewWillAppear:");
  double v5 = [(MessageListViewController *)self traitCollection];
  BOOL v6 = [(MessageListViewController *)self state];
  objc_msgSend(v6, "setUseSplitViewStyling:", objc_msgSend(v5, "mf_useSplitViewStyling"));
  id v7 = [(MessageListViewController *)self scene];
  id v8 = [v7 dockContainer];
  [v8 addPresentationControllerDelegateObserver:self];

  id v9 = [(MessageListViewController *)self layoutValuesHelper];
  [v9 setTraitCollection:v5];
  [(MessageListViewController *)self systemMinimumLayoutMargins];
  [v9 setSystemLayoutMargins:];
  id v10 = [(MessageListViewController *)self view];
  [v9 updateTintColorFromView:v10];

  id v11 = [(MessageListViewController *)self scene];
  if (![(MessageListViewController *)self isSearchViewController]
    && ([(MessageListViewController *)self didNotifyExtendedLaunchTracker] & 1) == 0)
  {
    id v12 = [v11 extendedLaunchTracker];
    [v12 observeViewController:self scene:v11];
  }
  [(MessageListViewController *)self _invalidateCachedUseCompactRows];
  [(MessageListViewController *)self updateBarButtons];
  *((unsigned char *)self + 8) |= 1u;
  if ([v6 containsOutbox])
  {
    unsigned int v13 = [v11 daemonInterface];
    uint64_t v14 = [v13 outgoingMessageRepository];
    [v14 suspendDeliveryQueue];
  }
  if ([(MessageListViewController *)self isReappearing])
  {
    if ([v11 isInExpandedEnvironment])
    {
      id v15 = [(MessageListViewController *)self lastSelectedItemID];

      if (!v15) {
        goto LABEL_13;
      }
      id v16 = [(MessageListViewController *)self lastSelectedItemID];
      [(MessageListViewController *)self selectRowOfItemID:v16 scrollToVisible:0 animated:v3];
    }
    else
    {
      id v17 = [(MessageListViewController *)self collectionView];
      [(MessageListViewController *)self deselectAllItemsInCollectionView:v17 animated:v3];

      id v16 = [v11 splitViewController];
      id v18 = [(MessageListViewController *)self parentViewController];
      [v16 setFocusedViewController:v18];
    }
  }
  else
  {
    [(MessageListViewController *)self _doInitialMessageSelection];
  }
LABEL_13:
  id v19 = [(MessageListViewController *)self highlightsSupplementaryView];
  if (v19)
  {
    id v20 = [(MessageListViewController *)self transitionCoordinator];
    [v19 parentViewController:self viewWillAppearWithTransitionCoordinator:v20];
  }
  [(MessageListViewController *)self _registerViewInteractions];
  double v21 = [(MessageListViewController *)self conversationViewController];
  [v21 setNeedsUpdateContentUnavailableConfiguration];
}

- (BOOL)isSearchSuggestionsVisible
{
  return 0;
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v30 viewDidLoad];
  [(MessageListViewController *)self _invalidateCachedUseCompactRows];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UICollectionViewCompositionalLayout);
  __int16 v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  __int16 v26 = sub_100034D48;
  double v27 = &unk_100607280;
  objc_copyWeak(&v28, &location);
  id v4 = [v3 initWithSectionProvider:&v24];
  double v5 = [(MessageListViewController *)self view];
  BOOL v6 = +[UIColor mailMessageListBackgroundColor];
  [v5 setBackgroundColor:v6];

  id v7 = objc_alloc((Class)UICollectionView);
  [v5 bounds];
  id v8 = [v7 initWithFrame:v4 collectionViewLayout:];
  uint64_t v9 = objc_opt_class();
  id v10 = +[MessageListCollectionViewCell reusableIdentifier];
  [v8 registerClass:v9 forCellWithReuseIdentifier:v10];

  [v8 _setAllowsVisibleCellUpdatesDuringUpdateAnimations:1];
  [v8 setAutoresizingMask:18];
  [v8 setDelegate:self];
  id v11 = +[UIColor mailMessageListBackgroundColor];
  [v8 setBackgroundColor:v11];

  [v8 setAlwaysBounceVertical:1];
  [v8 setKeyboardDismissMode:2];
  [v8 setAccessibilityIdentifier:MSAccessibilityIdentifierMailMessageList];
  id v12 = [(MessageListViewController *)self refreshControl];
  [v8 setRefreshControl:v12];

  unsigned int v13 = [(MessageListViewController *)self messageListDragDropHelper];
  [v8 setDragDelegate:v13];

  uint64_t v14 = [(MessageListViewController *)self messageListDragDropHelper];
  [v8 setDropDelegate:v14];

  [v8 setAllowsMultipleSelection:1];
  [v8 setAllowsMultipleSelectionDuringEditing:1];
  [(MessageListViewController *)self setCollectionView:v8];
  id v15 = +[UIDevice mf_isPad];
  id v16 = [(MessageListViewController *)self collectionView];
  id v17 = [v16 panGestureRecognizer];
  [v17 setDelaysTouchesBegan:v15];

  id v18 = objc_alloc((Class)MessageListPositionHelper);
  id v19 = [(MessageListViewController *)self dataSource];
  id v20 = [v19 collectionViewDataSource];
  id v21 = [v18 initWithCollectionView:v8 dataSource:v20];
  [(MessageListViewController *)self setMessageListPositionHelper:v21];

  [v5 addSubview:v8];
  [(MessageListViewController *)self _configureSearch];
  [(MessageListViewController *)self setPrimitiveFocusFilterEnabled:1];
  objc_super v22 = [(MessageListViewController *)self scene];
  id v23 = +[NSNotificationCenter defaultCenter];
  [v23 addObserver:self selector:"_sceneDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:v22];

  +[MUIIntelligenceLightDefaults setInitialSettingsIfNecessary];
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (MessageListDragDropHelper)messageListDragDropHelper
{
  return self->_messageListDragDropHelper;
}

- (void)_initializeMailboxBrowseUserActivityWithMailboxes:(id)a3
{
  id v33 = a3;
  id v4 = [v33 firstObject];
  double v5 = [v4 account];

  BOOL v6 = [(MessageListViewController *)self mailboxBrowseActivityPayload];
  id v7 = [(MessageListViewController *)self continuityMailboxActivityPayloadFromMailboxes:v33 account:v5 currentActivityPayload:v6];

  [(MessageListViewController *)self setMailboxBrowseActivityPayload:0];
  if (v7)
  {
    id v8 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v7];
    [(MessageListViewController *)self setMailboxBrowseActivityPayload:v8];

    uint64_t v9 = [(MessageListViewController *)self mailboxBrowseActivityPayload];
    uint64_t v10 = MSMailActivityHandoffTypeBrowseMailbox;
    [v9 setObject:MSMailActivityHandoffTypeBrowseMailbox forKeyedSubscript:MSMailActivityHandoffTypeKey];

    id v11 = [(MessageListViewController *)self userActivity];
    id v12 = v11;
    if (!v11
      || ([v11 activityType],
          unsigned int v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v13 isEqualToString:v10],
          v13,
          (v14 & 1) == 0))
    {
      id v15 = [objc_alloc((Class)NSUserActivity) initWithActivityType:v10];

      id v12 = v15;
      [(MessageListViewController *)self setUserActivity:v15];
    }
    id v16 = [v33 firstObject];
    id v17 = [(MessageListViewController *)self mailboxBrowseActivityPayload];
    id v18 = [v17 objectForKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeyRemoteMailboxURL];

    id v19 = +[NSBundle mainBundle];
    if (v18)
    {
      id v20 = [v19 localizedStringForKey:@"BROWSING_FOLDER_FROM_ACCOUNT_TITLE" value:&stru_100619928 table:@"Main"];
      id v21 = [v16 name];
      objc_super v22 = [v5 name];
      id v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21, v22);
      [v12 setTitle:v23];

      __int16 v24 = [v16 objectID];
      uint64_t v25 = [v24 url];
      __int16 v26 = [v25 absoluteString];
      [v12 setTargetContentIdentifier:v26];
    }
    else
    {
      double v27 = [v19 localizedStringForKey:@"BROWSING_SPECIAL_FOLDER_TITLE" value:&stru_100619928 table:@"Main"];
      id v28 = [v16 name];
      v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v28);
      [v12 setTitle:v29];

      __int16 v24 = [(MessageListViewController *)self mailboxBrowseActivityPayload];
      uint64_t v25 = [v24 objectForKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType];
      [v12 setTargetContentIdentifier:v25];
    }

    objc_super v30 = [(MessageListViewController *)self mailboxBrowseActivityPayload];
    [v12 setUserInfo:v30];

    double v31 = [(MessageListViewController *)self mailboxBrowseActivityPayload];
    id v32 = [(MessageListViewController *)self requiredUserInfoKeysFromUserActivityPayload:v31];
    [v12 setRequiredUserInfoKeys:v32];

    [v12 setEligibleForSearch:1];
    [v12 setEligibleForPrediction:0];
    [v12 becomeCurrent];
  }
}

- (NSMutableDictionary)mailboxBrowseActivityPayload
{
  return self->_mailboxBrowseActivityPayload;
}

- (void)setMailboxBrowseActivityPayload:(id)a3
{
}

- (void)_invalidateCachedUseCompactRows
{
  id v4 = [(MessageListViewController *)self scene];
  unsigned int v5 = [v4 isInExpandedEnvironment];

  BOOL v6 = [(MessageListViewController *)self traitCollection];
  id v7 = [v6 verticalSizeClass];

  id v8 = +[MessageListViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(a2);
    int v13 = 138413314;
    unsigned __int8 v14 = v10;
    __int16 v15 = 2048;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v11;
    __int16 v19 = 1024;
    unsigned int v20 = v5;
    __int16 v21 = 1024;
    BOOL v22 = v7 == (id)1;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> %{public}@ isInExpandedEnvironment: %{BOOL}d, isVerticallyCompact: %{BOOL}d", (uint8_t *)&v13, 0x2Cu);
  }
  id v12 = [(MessageListViewController *)self state];
  [v12 setIsCompact:v5 & (v7 == (id)1)];
}

- (void)setShouldHideMessageListAvatar:(BOOL)a3
{
  self->_shouldHideMessageListAvatar = a3;
}

- (void)_configureSearch
{
  if (![(MessageListViewController *)self isSearchViewController])
  {
    id v11 = [(MessageListViewController *)self messageListSearchViewController];
    id v3 = [(MessageListViewController *)self searchController];

    if (!v3)
    {
      id v4 = [[MFSearchController alloc] initWithSearchResultsController:v11];
      [(MFSearchController *)v4 setDelegate:self];
      [(MFSearchController *)v4 setSearchResultsUpdater:v11];
      [(MessageListViewController *)self setSearchController:v4];
      unsigned int v5 = [(MFSearchController *)v4 searchBar];
      [v5 setDelegate:v11];
      BOOL v6 = [v5 searchTextField];
      [v6 setDelegate:v11];

      id v7 = [v5 searchTextField];
      [v7 setPasteDelegate:v11];
    }
    id v8 = [(MessageListViewController *)self searchController];
    uint64_t v9 = [(MessageListViewController *)self mf_navigationItem];
    [v9 setSearchController:v8];

    uint64_t v10 = [(MessageListViewController *)self mf_navigationItem];
    [v10 setHidesSearchBarWhenScrolling:1];
  }
}

- (MessageListSearchViewController)messageListSearchViewController
{
  messageListSearchViewController = self->_messageListSearchViewController;
  if (!messageListSearchViewController)
  {
    id v4 = [MessageListSearchViewController alloc];
    unsigned int v5 = [(MessageListViewController *)self scene];
    BOOL v6 = [(MessageListViewController *)self mailboxes];
    id v7 = [(MessageListViewController *)self accountsProvider];
    id v8 = [(MessageListViewController *)self contactStore];
    uint64_t v9 = [(MessageListSearchViewController *)v4 initWithMainScene:v5 mailboxes:v6 accountsProvider:v7 favoritesShortcutsProvider:0 contactStore:v8];
    [(MessageListViewController *)self setMessageListSearchViewController:v9];

    messageListSearchViewController = self->_messageListSearchViewController;
  }

  return messageListSearchViewController;
}

- (void)messageListDataSource:(id)a3 willUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6 cleanSnapshot:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v17 messageListDataSource:v12 willUpdateWithChange:v13 section:v14 animated:v8 cleanSnapshot:v7];
  __int16 v15 = [(MessageListViewController *)self noContentView];
  if (v15)
  {
    unsigned int v16 = +[MessageListSectionDataSource isAdditionChange:v13];

    if (v16) {
      [(MessageListViewController *)self supressNoContentViewAnimated:v8];
    }
  }
}

- (void)_setContentUnavailableTitle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = [(MessageListViewController *)self noContentView];
    if (v7)
    {
LABEL_18:

      goto LABEL_19;
    }
    BOOL v8 = +[MessageListViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v10;
      __int16 v34 = 2048;
      id v35 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> Make no content view visible", buf, 0x16u);
    }
    id v11 = +[UIContentUnavailableConfiguration emptyConfiguration];
    [v11 setText:v6];
    id v12 = +[UIColor mailMessageListBackgroundColor];
    id v13 = [v11 background];
    [v13 setBackgroundColor:v12];

    id v7 = [objc_alloc((Class)UIContentUnavailableView) initWithConfiguration:v11];
    [(MessageListViewController *)self setNoContentView:v7];
    [v7 setUserInteractionEnabled:0];
    double v14 = 1.0;
    if (v4) {
      double v14 = 0.0;
    }
    [v7 setAlpha:v14];
    __int16 v15 = [(MessageListViewController *)self collectionView];
    [v15 setBackgroundView:v7];

    if (v4)
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100156908;
      v30[3] = &unk_100609F90;
      id v7 = v7;
      id v31 = v7;
      objc_copyWeak(&v32, (id *)buf);
      +[UIView animateWithDuration:v30 animations:0.25];
      objc_destroyWeak(&v32);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      __int16 v24 = [(MessageListViewController *)self conversationViewController];
      [v24 setNeedsUpdateContentUnavailableConfiguration];
    }
LABEL_17:

    goto LABEL_18;
  }
  unsigned int v16 = [(MessageListViewController *)self noContentView];

  if (v16)
  {
    objc_super v17 = +[MessageListViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v19;
      __int16 v34 = 2048;
      id v35 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%@: %p> Hide no content view", buf, 0x16u);
    }
    unsigned int v20 = [(MessageListViewController *)self noContentView];
    [(MessageListViewController *)self setNoContentView:0];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100156994;
    v28[3] = &unk_1006047A0;
    id v21 = v20;
    id v29 = v21;
    BOOL v22 = objc_retainBlock(v28);
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001569A0;
    v25[3] = &unk_100609FB8;
    id v7 = v21;
    id v26 = v7;
    objc_copyWeak(&v27, (id *)buf);
    id v23 = objc_retainBlock(v25);
    if (v4)
    {
      +[UIView animateWithDuration:v22 animations:v23 completion:0.25];
    }
    else
    {
      ((void (*)(void *))v22[2])(v22);
      ((void (*)(void *, uint64_t))v23[2])(v23, 1);
    }

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);

    id v11 = v29;
    goto LABEL_17;
  }
LABEL_19:
}

- (UIContentUnavailableView)noContentView
{
  return self->_noContentView;
}

- (void)_setRowDeletionEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = +[MFUserInteractionAssertion interactionAssertionWithReason:@"setRowDeletionEnabled : [currentTableView setEditing:enabled animated:animated] " timeout:1.0];
  BOOL v8 = [(MessageListViewController *)self mf_navigationItem];
  [v8 setHidesBackButton:v5 animated:v4];

  uint64_t v9 = [(MessageListViewController *)self scene];
  id v32 = [v9 splitViewController];
  uint64_t v10 = [v32 traitCollection];
  id v11 = [v10 horizontalSizeClass];

  id v12 = [(MessageListViewController *)self transferController];
  if (v12)
  {
    objc_super v30 = v9;
    id v13 = [v9 mf_rootViewController];
    double v14 = [v13 presentedViewController];
    __int16 v15 = [(MessageListViewController *)self transferController];
    BOOL v16 = v14 == v15;

    uint64_t v9 = v30;
  }
  else
  {
    BOOL v16 = 0;
  }

  BOOL v17 = v11 != (id)2 && (*((unsigned char *)self + 8) & 1) == 0;
  if (v17 || v16)
  {
    id v18 = v32;
  }
  else
  {
    id v18 = v32;
    __int16 v19 = +[MFUserInteractionAssertion interactionAssertionWithReason:@"Performing Stack View Animations" timeout:1.0];

    unsigned int v20 = [(MessageListViewController *)self transferStackViewController];
    id v21 = [v32 messageDetailNavController];
    unsigned int v22 = [(MessageListViewController *)self isTransferStackVisible];
    if (v5)
    {
      if ((v22 & 1) == 0)
      {
        id v23 = [(MessageListViewController *)self messageListSelectionModel];
        __int16 v24 = -[MessageListViewController _previewMessagesForSelectAllMode:](self, "_previewMessagesForSelectAllMode:", [v23 isSelectAll]);

        id v25 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v20];
        [v25 setModalPresentationStyle:6];
        [v21 presentViewController:v25 animated:0 completion:0];
        [v20 displayStackedViewsForItemsWithIDs:v24];
        [v19 invalidate];
      }
    }
    else if (v22)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10015B9F8;
      v33[3] = &unk_100604618;
      id v34 = v21;
      id v35 = v19;
      [v20 removeStackedViewsAnimated:1 completion:v33];
    }
    if (v4)
    {
      id v26 = +[UIApplication sharedApplication];
      if (([v26 isRunningTest:@"ExitEditMode"] & 1) != 0
        || [v26 isRunningTest:@"ExitEditModeLandscape"])
      {
        id v27 = +[NSNotification notificationWithName:@"DidFinishExitEditModeTest", 0, v9 object];
        id v28 = +[NSNotificationCenter defaultCenter];
        UIAnimationDragCoefficient();
        [v28 performSelector:"postNotification:" withObject:v27 afterDelay:v29 * 0.35];

        uint64_t v9 = v31;
      }
    }
    id v7 = v19;
  }
  [v7 invalidate];
}

- (MFTransferStackViewController)transferStackViewController
{
  if (!self->_transferStackViewController)
  {
    id v3 = [MFTransferStackViewController alloc];
    BOOL v4 = [(MessageListViewController *)self scene];
    BOOL v5 = [(MFTransferStackViewController *)v3 initWithScene:v4];
    transferStackViewController = self->_transferStackViewController;
    self->_transferStackViewController = v5;

    [(MFTransferStackViewController *)self->_transferStackViewController setDataSource:self];
  }
  id v7 = [(MessageListViewController *)self conversationViewController];
  BOOL v8 = [v7 collectionView];
  [v8 layoutMargins];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  BOOL v17 = [(MFTransferStackViewController *)self->_transferStackViewController view];
  [v17 setLayoutMargins:v10, v12, v14, v16];

  id v18 = self->_transferStackViewController;

  return v18;
}

- (MFTransferSplitViewController)transferController
{
  return self->_transferController;
}

- (BOOL)isTransferStackVisible
{
  id v3 = [(MessageListViewController *)self scene];
  BOOL v4 = [v3 splitViewController];
  BOOL v5 = [v4 messageDetailNavController];
  id v6 = [v5 presentedViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 topViewController];
    BOOL v8 = [(MessageListViewController *)self transferStackViewController];
    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (MessageListViewController)initWithMainScene:(id)a3 mailboxes:(id)a4 accountsProvider:(id)a5 favoritesShortcutsProvider:(id)a6 contactStore:(id)a7 diagnosticsHelper:(id)a8
{
  id v14 = a3;
  id v38 = a4;
  id v26 = a5;
  id v34 = a5;
  id v27 = a6;
  id v33 = a6;
  id v37 = a7;
  id obj = v14;
  id v36 = a8;
  id v32 = [v14 daemonInterface];
  id v31 = [v14 daemonInterface];
  objc_super v30 = +[UIApplication sharedApplication];
  float v29 = [v30 focusController];
  id v28 = +[UIApplication sharedApplication];
  double v15 = [v28 mailboxCategoryCloudStorage];
  double v16 = +[UIApplication sharedApplication];
  BOOL v17 = [v16 avatarGenerator];
  id v18 = +[UIApplication sharedApplication];
  __int16 v19 = [v18 bucketBarConfigurationController];
  unsigned int v20 = +[UIApplication sharedApplication];
  id v21 = [v20 brandIndicatorProvider];
  v39.receiver = self;
  v39.super_class = (Class)MessageListViewController;
  unsigned int v22 = [(MessageListViewController *)&v39 initWithDaemonInterface:v31 focusController:v29 mailboxCategoryCloudStorage:v15 avatarGenerator:v17 bucketBarConfigurationController:v19 brandIndicatorProvider:v21 mailboxes:v38 contactStore:v37 diagnosticsHelper:v36];

  if (v22)
  {
    objc_storeWeak((id *)&v22->_scene, obj);
    objc_storeStrong((id *)&v22->_accountsProvider, v26);
    objc_storeStrong((id *)&v22->_favoritesShortcutsProvider, v27);
    id v23 = (EFLocked *)[objc_alloc((Class)EFLocked) initWithObject:&__kCFBooleanFalse];
    isRefreshing = v22->_isRefreshing;
    v22->_isRefreshing = v23;

    [(MessageListViewController *)v22 _commonInitWithDaemonInterface:v32 mailboxes:v38];
  }

  return v22;
}

- (void)mailboxStatusUpdated:(id)a3 statusInfo:(id)a4 forMailboxObjectID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 state] == (id)1)
  {
    [(MessageListViewController *)self _finishRefreshingWaitForDraggingToEnd:1];
    if ([v7 hasAccountError])
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      BOOL v9 = +[EFScheduler mainThreadScheduler];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001664C8;
      v11[3] = &unk_100604C00;
      objc_copyWeak(&v13, &location);
      id v12 = v8;
      id v10 = [v9 afterDelay:v11 performBlock:30.0];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_layoutSectionAtSection:(int64_t)a3 layoutEnvironment:(id)a4 layout:(int64_t)a5
{
  id v8 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  [(MessageListViewController *)self systemMinimumLayoutMargins];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003B898;
  v19[3] = &unk_100609B70;
  objc_copyWeak(v20, &location);
  v20[1] = (id)a3;
  BOOL v17 = +[MessageListLayoutFactory layoutSectionAtSection:layoutEnvironment:layoutMargins:layout:configuration:](MessageListLayoutFactory, "layoutSectionAtSection:layoutEnvironment:layoutMargins:layout:configuration:", a3, v8, a5, v19, v10, v12, v14, v16);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  return v17;
}

- (BOOL)_shouldDisplaySearchButtons
{
  if ([(MessageListViewController *)self isSearchViewController]) {
    return 1;
  }

  return [(MessageListViewController *)self _isInSearch];
}

- (int64_t)preferredMessageListLayoutForSection:(int64_t)a3
{
  if ([(MessageListViewController *)self isSearchViewController]) {
    return 1;
  }
  id v6 = [(MessageListViewController *)self dataSource];
  if ([v6 isSection:MessageListSectionBucketBar atIndex:a3])
  {

    return 2;
  }
  id v7 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v8 = [v7 isSection:MessageListSectionOnboardingTip atIndex:a3];

  if (v8) {
    return 2;
  }
  [(MessageListViewController *)self selectedBucket];
  if (MUIBucketIsBusinessBucket()) {
    return 3;
  }
  if (![(MessageListViewController *)self _shouldShowHighlights]) {
    return 0;
  }
  double v9 = [(MessageListViewController *)self dataSource];
  unsigned int v10 = [v9 isSection:MessageListSectionPriority atIndex:a3];

  if (!v10) {
    return 0;
  }
  double v11 = +[MessageListViewController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    int v14 = 138412546;
    double v15 = v13;
    __int16 v16 = 2048;
    BOOL v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@: %p> Should display priority section supplementary view", (uint8_t *)&v14, 0x16u);
  }
  return 4;
}

- (BOOL)isSearchViewController
{
  return 0;
}

- (BOOL)_shouldShowHighlights
{
  if (!_os_feature_enabled_impl() || !EMIsGreymatterAvailableWithOverride()) {
    return 0;
  }
  id v3 = [(MessageListViewController *)self showHighlights];
  if ([v3 isEnabled])
  {
    BOOL v4 = [(MessageListViewController *)self highlightedMessages];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldHideMessageListAvatar
{
  return self->_shouldHideMessageListAvatar;
}

- (_TtC10MobileMail30MessageListSeparatorController)separatorController
{
  separatorController = self->_separatorController;
  if (!separatorController)
  {
    BOOL v4 = [[_TtC10MobileMail30MessageListSeparatorController alloc] initWithDelegate:self];
    BOOL v5 = self->_separatorController;
    self->_separatorController = v4;

    separatorController = self->_separatorController;
  }

  return separatorController;
}

- (BOOL)messageListSeparatorController:(id)a3 isItemAtIndexPathSelected:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self collectionView];
  id v7 = [v6 indexPathsForSelectedItems];
  unsigned __int8 v8 = [v7 containsObject:v5];

  return v8;
}

- (BOOL)messageListSeparatorController:(id)a3 hasMessageContentInSection:(int64_t)a4
{
  id v5 = [(MessageListViewController *)self dataSource];
  LOBYTE(a4) = [v5 isMessagesSectionAtIndex:a4];

  return a4;
}

- (void)_configureLayoutListConfiguration:(id)a3 atSection:(int64_t)a4
{
  id v6 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10014B9D4;
  v29[3] = &unk_100609B98;
  objc_copyWeak(&v30, &location);
  [v6 setLeadingSwipeActionsConfigurationProvider:v29];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10014BA50;
  v27[3] = &unk_100609B98;
  objc_copyWeak(&v28, &location);
  [v6 setTrailingSwipeActionsConfigurationProvider:v27];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10014BACC;
  v25[3] = &unk_100604FE8;
  objc_copyWeak(&v26, &location);
  [v6 _setWillBeginSwipingHandler:v25];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10014BB2C;
  v23[3] = &unk_100604FE8;
  objc_copyWeak(&v24, &location);
  [v6 _setDidEndSwipingHandler:v23];
  [(MessageListViewController *)self selectedBucket];
  MUIBucketAllowsNewAndOldSections();
  if (EMBlackPearlIsFeatureEnabled())
  {
    id v7 = +[UIColor clearColor];
    [v6 setBackgroundColor:v7];
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003A470;
  v22[3] = &unk_100609BC0;
  v22[4] = self;
  [v6 setItemSeparatorHandler:v22];
  unsigned __int8 v8 = [(MessageListViewController *)self dataSource];
  double v9 = [v8 viewModelForSupplementaryViewKind:UICollectionElementKindSectionHeader sectionAtIndex:a4];

  if ([v9 shouldDisplaySupplementaryView])
  {
    unsigned int v10 = [(MessageListViewController *)self dataSource];
    if (([v10 isSection:MessageListSectionGroupedSenderUnseen atIndex:a4] & 1) == 0)
    {
      double v11 = [(MessageListViewController *)self dataSource];
      if (([v11 isSection:MessageListSectionGroupedSender atIndex:a4] & 1) == 0)
      {
        double v12 = [(MessageListViewController *)self dataSource];
        if (![v12 isSection:MessageListSectionRecentUnseen atIndex:a4])
        {
          __int16 v16 = [(MessageListViewController *)self dataSource];
          unsigned __int8 v21 = [v16 isSection:MessageListSectionRecent atIndex:a4];

          if ((v21 & 1) == 0) {
            goto LABEL_11;
          }
          goto LABEL_10;
        }
      }
    }

LABEL_10:
    [v6 setHeaderTopPadding:6.0];
  }
LABEL_11:
  if (_os_feature_enabled_impl())
  {
    if (EMIsGreymatterSupportedWithOverride())
    {
      double v13 = [(MessageListViewController *)self dataSource];
      unsigned int v14 = [v13 isSection:MessageListSectionPriority atIndex:a4];

      if (v14)
      {
        if ([(MessageListViewController *)self selectedBucket] == (id)1)
        {
          double v15 = +[MUIMessageListSupplementaryViewModel supplementaryViewModelWithDisplay:[(MessageListViewController *)self _shouldShowHighlights] kind:UICollectionElementKindSectionHeader sectionIndex:a4 reason:4];

          double v9 = v15;
          if ([v15 shouldDisplaySupplementaryView]) {
            [v6 setHeaderTopPadding:4.0];
          }
        }
      }
    }
  }
  if ([v9 shouldDisplaySupplementaryView])
  {
    BOOL v17 = +[MessageListViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      unsigned int v20 = [v9 ef_publicDescription];
      *(_DWORD *)buf = 138543874;
      id v33 = v19;
      __int16 v34 = 2048;
      id v35 = self;
      __int16 v36 = 2114;
      id v37 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> %{public}@", buf, 0x20u);
    }
  }
  [v6 setHeaderMode:[v9 shouldDisplaySupplementaryView]];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (BOOL)messageListSeparatorController:(id)a3 isLastItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self collectionView];
  id v7 = (char *)[v6 numberOfItemsInSection:[v5 section]];

  LOBYTE(v6) = (char *)[v5 item] + 1 == v7;
  return (char)v6;
}

- (void)_updateTitle
{
  if ([(MessageListViewController *)self isSearchViewController]) {
    return;
  }
  id v3 = +[NSBundle mainBundle];
  id v26 = [v3 localizedStringForKey:@"SEARCH_ALL_MAILBOXES" value:&stru_100619928 table:@"Main"];

  BOOL v4 = [(MessageListViewController *)self searchBar];
  [v4 setPlaceholder:v26];

  id v5 = [(MessageListViewController *)self messageListSelectionModel];
  if (([v5 isSelectAll] & 1) != 0
    || (id v6 = [v5 count], (v7 = v6) == 0)
    || v6 == (id)1 && ([(MessageListViewController *)self isEditing] & 1) == 0)
  {
    double v11 = [(MessageListViewController *)self senderSpecificMessageListItem];
    unsigned __int8 v8 = v11;
    if (v11)
    {
      double v12 = [v11 senderList];
      double v9 = [v12 firstObject];

      if (!v9)
      {
        unsigned int v10 = &stru_100619928;
        goto LABEL_19;
      }
      id v13 = v9;
      unsigned int v14 = [v13 emailAddressValue];
      double v15 = [v14 em_displayableString];
      __int16 v16 = v15;
      if (v15)
      {
        unsigned int v10 = v15;
      }
      else
      {
        BOOL v17 = [v14 simpleAddress];
        id v18 = v17;
        if (v17)
        {
          __int16 v19 = v17;
        }
        else
        {
          __int16 v19 = [v13 stringValue];
        }
        unsigned int v10 = v19;
      }
      double v9 = v13;
    }
    else
    {
      double v9 = [(MessageListViewController *)self mailboxes];
      id v13 = [v9 firstObject];
      unsigned int v10 = [v13 name];
    }

    goto LABEL_19;
  }
  unsigned __int8 v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"MESSAGES_SELECTED_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
  +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);
  unsigned int v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  if ([(MessageListViewController *)self shouldUseCustomNavigationBarTitleView])
  {
    unsigned int v20 = [(MessageListViewController *)self navigationBarTitleView];
    [v20 configureWithTitle:v10 bucket:[self selectedBucket]];
  }
  else
  {
    unsigned __int8 v21 = [(MessageListViewController *)self mf_navigationItem];
    unsigned int v22 = [v21 standardAppearance];
    [v22 setTitlePositionAdjustment:UIOffsetZero.horizontal, UIOffsetZero.vertical];

    unsigned int v20 = 0;
  }
  id v23 = [(MessageListViewController *)self mf_navigationItem];
  [v23 setTitle:v10];

  id v24 = [(MessageListViewController *)self mf_navigationItem];
  [v24 setTitleView:v20];

  [(MessageListViewController *)self _updateBackButtonImage];
  id v25 = [(MessageListViewController *)self scene];
  [v25 mf_resetPreferredTitle];
}

- (BOOL)shouldUseCustomNavigationBarTitleView
{
  if ([(MessageListViewController *)self isBucketBarHidden]) {
    return 0;
  }
  BOOL v4 = [(MessageListViewController *)self bucketsViewController];
  id v5 = [v4 viewIfLoaded];
  id v6 = [v5 superview];
  BOOL v3 = v6 != 0;

  return v3;
}

- (void)_updateBackButtonImage
{
  id v3 = [(MessageListViewController *)self mailStatusObserver];
  -[MessageListViewController _updateBackButtonImageWithCount:](self, "_updateBackButtonImageWithCount:", [v3 badgeCount]);
}

- (MailStatusObserver)mailStatusObserver
{
  return self->_mailStatusObserver;
}

- (void)_updateBackButtonImageWithCount:(unint64_t)a3
{
  id v5 = [(MessageListViewController *)self state];
  id v21 = v5;
  if (a3 - 1 > 0x3E6)
  {
    int v7 = 0;
  }
  else
  {
    if ([v5 containsDraftsMailbox]) {
      unsigned int v6 = 1;
    }
    else {
      unsigned int v6 = [v21 containsOutbox];
    }
    int v7 = v6 ^ 1;
  }
  unsigned __int8 v8 = [(MessageListViewController *)self title];
  if ([(MessageListViewController *)self isBucketBarHidden])
  {
LABEL_8:
    int v9 = 0;
    if (v7) {
      goto LABEL_9;
    }
LABEL_18:
    BOOL v17 = [(MessageListViewController *)self mf_navigationItem];
    id v18 = [v17 backBarButtonItem];

    if (!v18)
    {
      if (!v9)
      {
        unsigned int v20 = [(MessageListViewController *)self mf_navigationItem];
        [v20 setBackButtonTitle:0];

        double v12 = [(MessageListViewController *)self mf_navigationItem];
        [v12 setBackBarButtonItem:0];
        goto LABEL_23;
      }
      goto LABEL_21;
    }
    __int16 v19 = [(MessageListViewController *)self mf_navigationItem];
    [v19 setBackBarButtonItem:0];

    double v12 = [(MessageListViewController *)self conversationViewController];
    [v12 _setNavigationBarTitleViewNeedsLayout];
LABEL_23:

    goto LABEL_24;
  }
  unsigned int v10 = [(MessageListViewController *)self senderSpecificMessageListItem];
  if (v10)
  {
    int v9 = 0;
  }
  else
  {
    if (![(MessageListViewController *)self selectedBucket]) {
      goto LABEL_8;
    }
    uint64_t v16 = _EFLocalizedString();
    int v9 = 1;
    unsigned int v10 = v8;
    unsigned __int8 v8 = (void *)v16;
  }

  if (!v7) {
    goto LABEL_18;
  }
LABEL_9:
  if ([(MessageListViewController *)self currentUnreadCount] != a3)
  {
    [(MessageListViewController *)self setCurrentUnreadCount:a3];
    double v11 = +[NSNumberFormatter ef_formatUnsignedInteger:a3 withGrouping:1];
    double v12 = sub_1001FD034(v11);
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v12 style:0 target:0 action:0];
    [v13 setTitle:v8];
    unsigned int v14 = sub_1001FD390(v11);
    [v13 setLargeContentSizeImage:v14];

    double v15 = [(MessageListViewController *)self mf_navigationItem];
    [v15 setBackBarButtonItem:v13];

    goto LABEL_23;
  }
  if (v9)
  {
LABEL_21:
    double v12 = [(MessageListViewController *)self mf_navigationItem];
    [v12 setBackButtonTitle:v8];
    goto LABEL_23;
  }
LABEL_24:
}

- (id)mf_preferredTitle
{
  v2 = [(MessageListViewController *)self mailboxes];
  id v3 = [v2 firstObject];
  BOOL v4 = [v3 name];

  return v4;
}

- (UIBarButtonItem)composeButtonItem
{
  id v3 = [(MessageListViewController *)self scene];
  if (!v3)
  {
    BOOL v4 = +[MessageListViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      objc_claimAutoreleasedReturnValue();
      sub_10045B9FC();
    }
  }
  composeButtonItem = self->_composeButtonItem;
  if (!composeButtonItem)
  {
    int v7 = (UIBarButtonItem *)[v3 newComposeButtonItem];
    p_composeButtonItem = &self->_composeButtonItem;
    int v9 = *p_composeButtonItem;
    *p_composeButtonItem = v7;

    composeButtonItem = *p_composeButtonItem;
  }
  unsigned int v10 = composeButtonItem;

  return v10;
}

- (MailMainScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (MailMainScene *)WeakRetained;
}

- (MUIMessageListNavigationBarTitleView)navigationBarTitleView
{
  navigationBarTitleView = self->_navigationBarTitleView;
  if (!navigationBarTitleView)
  {
    BOOL v4 = [(MessageListViewController *)self splitViewController];
    id v5 = [v4 messageListNavController];
    unsigned int v6 = [v5 navigationBar];

    int v7 = [v4 viewControllers];
    id v8 = [v7 count];

    if (v8 == (id)1)
    {
      int v9 = [v4 viewControllers];
      unsigned int v10 = [v9 firstObject];

      uint64_t v11 = [v10 navigationBar];

      unsigned int v6 = (void *)v11;
    }
    double v12 = (MUIMessageListNavigationBarTitleView *)[objc_alloc((Class)MUIMessageListNavigationBarTitleView) initWithNavigationBar:v6];
    id v13 = self->_navigationBarTitleView;
    self->_navigationBarTitleView = v12;

    navigationBarTitleView = self->_navigationBarTitleView;
  }

  return navigationBarTitleView;
}

- (BOOL)messageListRecentSectionDataSourceIsInExpandedEnvironment:(id)a3
{
  id v3 = [(MessageListViewController *)self scene];
  unsigned __int8 v4 = [v3 isInExpandedEnvironment];

  return v4;
}

- (void)_updateNavigationBarButtons
{
}

- (UINavigationItem)mf_navigationItem
{
  id v3 = [(MessageListViewController *)self navigationItemToConfigure];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MessageListViewController *)self navigationItem];
  }
  unsigned int v6 = v5;

  return (UINavigationItem *)v6;
}

- (UINavigationItem)navigationItemToConfigure
{
  return self->_navigationItemToConfigure;
}

- (id)selectMessageListViewButtonItem
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_100157C58;
  unsigned int v14 = &unk_1006070F8;
  objc_copyWeak(&v15, &location);
  id v3 = +[UIAction actionWithHandler:&v11];
  unsigned __int8 v4 = _EFLocalizedString();
  id v5 = _EFLocalizedString();
  if ((EMBlackPearlIsFeatureEnabled() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    if (self->_selectButtonItem
      && ([(MessageListViewController *)self isEditing] & 1) != 0)
    {
      unsigned int v6 = +[UIColor systemBlueColor];
      int v7 = +[UIBarButtonItem mui_capsuleButtonItemWithTitle:v5 titleColor:v6 imageName:0 action:v3];
    }
    else
    {
      unsigned int v6 = +[UIColor systemBlueColor];
      int v7 = +[UIBarButtonItem mui_capsuleButtonItemWithTitle:v4 titleColor:v6 imageName:0 action:v3];
    }
  }
  else if (self->_selectButtonItem {
         && ([(MessageListViewController *)self isEditing] & 1) != 0)
  }
  {
    unsigned int v6 = [(MessageListViewController *)self _configureSelectButtonWithTitle:v5];
    int v7 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v6];
  }
  else
  {
    unsigned int v6 = -[MessageListViewController _configureSelectButtonWithTitle:](self, "_configureSelectButtonWithTitle:", v4, v11, v12, v13, v14);
    int v7 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:v6];
  }
  selectButtonItem = self->_selectButtonItem;
  self->_selectButtonItem = v7;

  int v9 = self->_selectButtonItem;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

- (void)_updateToolbarButtons
{
  if ([(MessageListViewController *)self _shouldProcessButtonUpdates])
  {
    unsigned __int8 v3 = [(MessageListViewController *)self isEditing];
    float v29 = [(MessageListViewController *)self deleteButtonItem];
    id v28 = [(MessageListViewController *)self moveButtonItem];
    id v27 = [(MessageListViewController *)self markButtonItem];
    id v26 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v25 = [(MessageListViewController *)self currentEditButtonItem];
    id v24 = +[UIBarButtonItem mf_newFixedSpaceItem];
    unsigned __int8 v4 = [(MessageListViewController *)self filterButtonItem];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100156440;
    v51[3] = &unk_100609E78;
    unsigned __int8 v58 = v3;
    v51[4] = self;
    id v5 = v27;
    id v52 = v5;
    id v6 = v26;
    id v53 = v6;
    id v7 = v28;
    id v54 = v7;
    id v8 = v29;
    id v55 = v8;
    id v32 = v25;
    id v56 = v32;
    id v9 = v24;
    id v57 = v9;
    __int16 v34 = objc_retainBlock(v51);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1001565E0;
    v46[3] = &unk_100609EA0;
    v46[4] = self;
    id v31 = v5;
    id v47 = v31;
    id v10 = v6;
    id v48 = v10;
    id v30 = v7;
    id v49 = v30;
    id v11 = v8;
    id v50 = v11;
    uint64_t v12 = objc_retainBlock(v46);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000451C8;
    v44[3] = &unk_100609EC8;
    v44[4] = self;
    id v13 = v9;
    id v45 = v13;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1001566C8;
    v39[3] = &unk_100609EF0;
    unsigned int v14 = objc_retainBlock(v44);
    id v43 = v14;
    id v15 = v4;
    id v40 = v15;
    id v16 = v10;
    id v41 = v16;
    v42 = self;
    BOOL v17 = objc_retainBlock(v39);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100046238;
    v35[3] = &unk_100609F18;
    v35[4] = self;
    id v18 = v14;
    id v38 = v18;
    id v33 = v15;
    id v36 = v33;
    id v19 = v16;
    id v37 = v19;
    unsigned int v20 = objc_retainBlock(v35);
    if ([(MessageListViewController *)self _shouldDisplaySearchButtons])
    {
      unsigned int v21 = [(MessageListViewController *)self isSearchSuggestionsVisible];
      if (v21) {
        unsigned int v22 = v12;
      }
      else {
        unsigned int v22 = v34;
      }
      if (!v21 || (v3 & 1) != 0) {
        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v22 = v12;
      if (v3)
      {
LABEL_13:
        id v23 = ((void (*)(void))v22[2])();
        [(MessageListViewController *)self setToolbarItems:v23 animated:1];

        return;
      }
    }
    if ([(MessageListViewController *)self isFilterButtonEnabled]) {
      unsigned int v22 = v17;
    }
    else {
      unsigned int v22 = v20;
    }
    goto LABEL_13;
  }
}

- (MFMailboxFilterBarButtonItem)filterButtonItem
{
  filterButtonItem = self->_filterButtonItem;
  if (!filterButtonItem)
  {
    unsigned __int8 v4 = [[MFMailboxFilterBarButtonItem alloc] initWithTarget:self action:"filterButtonPressed:"];
    id v5 = self->_filterButtonItem;
    self->_filterButtonItem = v4;

    filterButtonItem = self->_filterButtonItem;
  }

  return filterButtonItem;
}

- (id)currentEditButtonItem
{
  if ([(MessageListViewController *)self _shouldDisplaySearchButtons])
  {
    unsigned __int8 v3 = [(MessageListViewController *)self searchEditButtonItem];

    if (!v3)
    {
      id v4 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:self action:"_editButtonTapped:"];
      [(MessageListViewController *)self setSearchEditButtonItem:v4];
    }
    id v5 = [(MessageListViewController *)self searchEditButtonItem];
  }
  else
  {
    id v6 = [(MessageListViewController *)self multiEditButtonItem];

    if (!v6)
    {
      id v7 = +[UIBarButtonItem mf_newMultiBarButtonItemWithTarget:self action:"_editButtonTapped:"];
      [(MessageListViewController *)self setMultiEditButtonItem:v7];
    }
    id v5 = [(MessageListViewController *)self multiEditButtonItem];
  }

  return v5;
}

- (UIBarButtonItem)multiEditButtonItem
{
  return self->_multiEditButtonItem;
}

- (BOOL)_shouldProcessButtonUpdates
{
  if (![(MessageListViewController *)self _shouldDisplaySearchButtons]
    || (BOOL v3 = [(MessageListViewController *)self isSearchViewController]))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (MFSearchBar)searchBar
{
  v2 = [(MessageListViewController *)self searchController];
  BOOL v3 = [v2 searchBar];

  return (MFSearchBar *)v3;
}

- (BOOL)_isInSearch
{
  v2 = [(MessageListViewController *)self searchController];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (MFSearchController)searchController
{
  return self->_searchController;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MessageListViewController *)self parentViewController];
  id v8 = v7;
  if (v7)
  {
    [v7 setToolbarItems:v6 animated:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MessageListViewController;
    [(MessageListViewController *)&v9 setToolbarItems:v6 animated:v4];
  }
}

- (UIBarButtonItem)moveButtonItem
{
  if (!self->_moveButtonItem)
  {
    unsigned int v3 = [(MessageListViewController *)self _shouldShowButtonImages];
    id v4 = objc_alloc((Class)UIBarButtonItem);
    if (v3)
    {
      id v5 = +[UIImage systemImageNamed:MFImageGlyphMove];
      id v6 = (UIBarButtonItem *)[v4 initWithImage:v5 style:0 target:self action:"_bulkTransferButtonPressed:"];
      moveButtonItem = self->_moveButtonItem;
      self->_moveButtonItem = v6;
    }
    else
    {
      id v5 = +[NSBundle mainBundle];
      moveButtonItem = [v5 localizedStringForKey:@"MOVE_BUTTON" value:&stru_100619928 table:@"Main"];
      id v8 = (UIBarButtonItem *)[v4 initWithTitle:moveButtonItem style:0 target:self action:"_bulkTransferButtonPressed:"];
      objc_super v9 = self->_moveButtonItem;
      self->_moveButtonItem = v8;
    }
  }
  id v10 = self->_moveButtonItem;

  return v10;
}

- (UIBarButtonItem)markButtonItem
{
  markButtonItem = self->_markButtonItem;
  if (!markButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithPrimaryAction:0];
    id v5 = self->_markButtonItem;
    self->_markButtonItem = v4;

    if ([(MessageListViewController *)self _shouldShowButtonImages])
    {
      id v6 = +[UIImage systemImageNamed:MFImageGlyphMarkElipsis];
      [(UIBarButtonItem *)self->_markButtonItem setImage:v6];
    }
    else
    {
      id v6 = +[NSBundle mainBundle];
      id v7 = [v6 localizedStringForKey:@"MARK_BUTTON" value:&stru_100619928 table:@"Main"];
      [(UIBarButtonItem *)self->_markButtonItem setTitle:v7];
    }
    [(UIBarButtonItem *)self->_markButtonItem setSecondaryActionsArePrimary:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100158770;
    v9[3] = &unk_10060A188;
    objc_copyWeak(&v10, &location);
    [(UIBarButtonItem *)self->_markButtonItem _setSecondaryActionsProvider:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    markButtonItem = self->_markButtonItem;
  }

  return markButtonItem;
}

- (BOOL)isFilterButtonEnabled
{
  unsigned int v3 = [(MessageListViewController *)self filterButtonItem];
  if ([v3 isFilterEnabled])
  {
    id v4 = [(MessageListViewController *)self filterViewModel];
    unsigned __int8 v5 = [v4 isFilterAvailable];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (LongPressableButtonItem)deleteButtonItem
{
  deleteButtonItem = self->_deleteButtonItem;
  if (!deleteButtonItem)
  {
    if ([(MessageListViewController *)self _shouldShowButtonImages])
    {
      id v4 = [LongPressableButtonItem alloc];
      unsigned __int8 v5 = +[UIImage systemImageNamed:MFImageGlyphTrash];
      id v6 = [(LongPressableButtonItem *)v4 initWithImage:v5 style:7 target:self action:"_bulkDeleteButtonPressed:"];
    }
    else
    {
      id v7 = [LongPressableButtonItem alloc];
      unsigned __int8 v5 = +[NSBundle mainBundle];
      id v8 = [v5 localizedStringForKey:@"DELETE_BUTTON" value:&stru_100619928 table:@"Main"];
      id v6 = [(LongPressableButtonItem *)v7 initWithTitle:v8 style:7 target:self action:"_bulkDeleteButtonPressed:"];
    }
    [(LongPressableButtonItem *)v6 setLongPressTarget:self action:"_bulkDeleteButtonLongPressed:"];
    objc_super v9 = self->_deleteButtonItem;
    self->_deleteButtonItem = v6;

    deleteButtonItem = self->_deleteButtonItem;
  }

  return deleteButtonItem;
}

- (id)_mailCategorizationOptionView
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100158004;
  v4[3] = &unk_100605A10;
  v4[4] = self;
  v2 = +[UICustomViewMenuElement elementWithViewProvider:v4];

  return v2;
}

- (BOOL)messageListSeparatorController:(id)a3 hasNonMessageSectionAboveSection:(int64_t)a4
{
  unsigned __int8 v5 = [(MessageListViewController *)self dataSource];
  id v6 = [v5 sectionBeforeIndex:a4];
  if (v6) {
    unsigned int v7 = [v5 isMessagesSection:v6] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)messageListSeparatorController:(id)a3 hasHeaderInSection:(int64_t)a4
{
  unsigned __int8 v5 = [(MessageListViewController *)self dataSource];
  LOBYTE(a4) = [v5 shouldDisplaySupplementaryKind:UICollectionElementKindSectionHeader forSectionAtIndex:a4];

  return a4;
}

- (void)messageListDataSource:(id)a3 didUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6
{
  BOOL v70 = a6;
  id v72 = a3;
  id v71 = a4;
  id v9 = a5;
  id v73 = v9;
  id v10 = [(MessageListViewController *)self messageListSelectionModel];
  [v10 setPerformingDataSourceUpdates:0];

  id v11 = [v9 section];
  v76 = self;
  if (![v72 isMessagesSection:v11])
  {

    goto LABEL_34;
  }
  unsigned int v12 = +[MessageListSectionDataSource isValidChange:v71];

  if (!v12) {
    goto LABEL_34;
  }
  id v13 = [(MessageListViewController *)self configuredSections];
  unsigned int v14 = [v9 section];
  [v13 addObject:v14];

  unsigned __int8 v15 = [(MessageListViewController *)self isInitialCellConfigurationCompleted];
  if ((v15 & 1) == 0)
  {
    if (!+[MessageListSectionDataSource numberOfChanges:v71])
    {
      id v16 = +[NSSet set];
      [(MessageListViewController *)self setIndexPathsForToBeConfiguredCells:v16];

      BOOL v17 = [v9 messageList];
      id v18 = [v17 objectID];
      [(MessageListViewController *)self _checkMessageListLoadingCompleted:v18];
    }
LABEL_9:
    v68 = [(MessageListViewController *)self collectionView];
    id v19 = [v68 indexPathsForVisibleItems];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_1000490A8;
    v81[3] = &unk_100609A40;
    v81[4] = self;
    v69 = [v19 ef_filter:v81];

    unsigned int v20 = +[NSSet setWithArray:v69];
    [(MessageListViewController *)self setIndexPathsForToBeConfiguredCells:v20];

    v74 = [(MessageListViewController *)self indexPathsForConfiguredCollectionViewCells];
    if ((v15 & 1) == 0)
    {
      unsigned int v21 = +[MessageListViewController log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = (objc_class *)objc_opt_class();
        id v23 = NSStringFromClass(v22);
        id v24 = [v69 count];
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v24;
        *(_WORD *)&buf[32] = 2114;
        *(void *)&buf[34] = v69;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> [Launch] Index paths for visible cells after first batch (%lu): %{public}@", buf, 0x2Au);
      }
    }
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = v69;
    id v25 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (!v25)
    {
LABEL_33:

      v42 = [v9 messageList];
      id v43 = [v42 objectID];
      [(MessageListViewController *)v76 _checkMessageListLoadingCompleted:v43];

      self = v76;
      goto LABEL_34;
    }
    uint64_t v26 = *(void *)v78;
LABEL_15:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v78 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void *)(*((void *)&v77 + 1) + 8 * v27);
      float v29 = [(MessageListViewController *)v76 collectionView];
      id v30 = [v29 cellForItemAtIndexPath:v28];

      if ([v30 conformsToProtocol:&OBJC_PROTOCOL___MessageListItemProviding]) {
        break;
      }
      if ((v15 & 1) == 0)
      {
        id v31 = +[MessageListViewController log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          id v37 = (id)objc_claimAutoreleasedReturnValue();
          id v38 = (objc_class *)objc_opt_class();
          objc_super v39 = NSStringFromClass(v38);
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v76;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v39;
          *(_WORD *)&buf[32] = 2114;
          *(void *)&buf[34] = v28;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "<%@: %p> [Launch] Collection view cell (%{public}@) does not conform to MessageListItemProviding at indexPath: %{public}@", buf, 0x2Au);
        }
        goto LABEL_30;
      }
LABEL_31:

      if (v25 == (id)++v27)
      {
        id v25 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
        if (!v25) {
          goto LABEL_33;
        }
        goto LABEL_15;
      }
    }
    id v31 = [v30 messageListItem];
    if (v31)
    {
      [v74 addObject:v28];
      if ((v15 & 1) == 0)
      {
        id v32 = +[MessageListViewController log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          id v34 = (id)objc_claimAutoreleasedReturnValue();
          id v35 = [v31 itemID];
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v34;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = v76;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v35;
          *(_WORD *)&buf[32] = 2114;
          *(void *)&buf[34] = v28;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> [Launch] Item (id: %{public}@) at index path: %{public}@ is already configured", buf, 0x2Au);

          id v9 = v73;
        }
LABEL_29:
      }
    }
    else if ((v15 & 1) == 0)
    {
      id v32 = +[MessageListViewController log];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = (objc_class *)objc_opt_class();
        id v41 = NSStringFromClass(v40);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v76;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v28;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> [Launch] Waiting for item at indexPath: %{public}@ to be configured", buf, 0x20u);
      }
      goto LABEL_29;
    }
LABEL_30:

    goto LABEL_31;
  }
  if (([(MessageListViewController *)self firstBatchCellConfigurationCompleted] & 1) == 0)goto LABEL_9; {
LABEL_34:
  }
  if ([(MessageListViewController *)self isEditing]) {
    goto LABEL_61;
  }
  v44 = [(MessageListViewController *)self messageToDisplayOnReload];
  if (v44 && ![(MessageListViewController *)self _canDisplayMessage:v44])
  {
    id v45 = +[MessageListViewController log];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      v64 = (objc_class *)objc_opt_class();
      v65 = NSStringFromClass(v64);
      v66 = [(MessageListViewController *)v76 mailboxes];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v65;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v76;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v44;
      *(_WORD *)&buf[32] = 2112;
      *(void *)&buf[34] = v66;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to display message:%@ on reload. Message does not exist not in displayed mailboxes:%@", buf, 0x2Au);
    }
    self = v76;
    [(MessageListViewController *)v76 setMessageToDisplayOnReload:0];
    memset(buf, 170, sizeof(buf));
    *(_DWORD *)&buf[32] = 0;
    *(void *)v85 = 0xE00000001;
    int v86 = 1;
    pid_t v87 = getpid();
    size_t v82 = 648;
    v44 = 0;
    if (!sysctl(v85, 4u, buf, &v82, 0, 0) && (*(_WORD *)&buf[32] & 0x800) != 0)
    {
      v44 = 0;
      __debugbreak();
    }
  }
  v46 = [(MessageListViewController *)self lastSelectedItemID];
  if (!sub_100048FD8(self)) {
    goto LABEL_55;
  }
  if (v44)
  {
    id v47 = [v9 messageList];
    id v48 = [v47 itemIDOfMessageListItemWithDisplayMessage:v44];

    id v49 = +[MessageListViewController log];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v50);
      id v52 = [v9 messageList];
      *(_DWORD *)buf = 138413570;
      *(void *)&uint8_t buf[4] = v51;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v76;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v44;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v48 != 0;
      *(_WORD *)&buf[38] = 2112;
      *(void *)&buf[40] = v52;
      *(_WORD *)&buf[48] = 2112;
      *(void *)&buf[50] = v9;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "<%@: %p> messageToDisplayOnReload:%@ exist:%i in message list: %@ for section: %@", buf, 0x3Au);
    }
    unsigned int v53 = v48 != 0;
    if (v48)
    {
      id v54 = v76;
      [(MessageListViewController *)v76 _handleDidSelectItemID:v48 referenceItem:v44 scrollToVisible:1 userInitiated:1 animated:v70];
    }
    else
    {
      BYTE2(v67) = 1;
      BYTE1(v67) = v70;
      LOBYTE(v67) = 1;
      id v54 = v76;
      -[MessageListViewController _showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](v76, "_showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", 0, 0, 0, v44, 0, 1, v67, 0);
    }
    [(MessageListViewController *)v54 setMessageToDisplayOnReload:0];
    goto LABEL_52;
  }
  if (![(MessageListViewController *)self shouldSelectInitialMessage])
  {
    if (v46 && ![(MessageListViewController *)self _inMultiSelectionMode])
    {
      id v48 = [(MessageListViewController *)self lastSelectedItemID];
      unsigned int v53 = [(MessageListViewController *)self selectRowOfItemID:v48 scrollToVisible:0 animated:0];
LABEL_52:

      goto LABEL_56;
    }
LABEL_55:
    unsigned int v53 = 0;
    goto LABEL_56;
  }
  unsigned int v53 = [(MessageListViewController *)self _selectAndDisplayInitialMessageIfNecessary];
LABEL_56:
  if (((+[MessageListSectionDataSource isFirstChange:v71] ^ 1 | v70 | v53) & 1) == 0)
  {
    id v55 = +[MessageListViewController log];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      id v56 = (objc_class *)objc_opt_class();
      id v57 = NSStringFromClass(v56);
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v57;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v76;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 0;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "<%@: %p> Couldn't select a message, scroll to top (animated=%{BOOL}d, selected=%{BOOL}d)", buf, 0x22u);
    }
    unsigned __int8 v58 = [(MessageListViewController *)v76 collectionView];
    v59 = [(MessageListViewController *)v76 collectionView];
    [v59 adjustedContentInset];
    [v58 setContentOffset:0, 0.0, -v60];
  }
  self = v76;
LABEL_61:
  [(MessageListViewController *)self updateBarButtons];
  [(MessageListViewController *)self _updateTitle];
  v61 = [v9 section];
  unsigned int v62 = [v72 isMessagesSection:v61];

  if (v62)
  {
    if (sub_100048FD8(v76) && [(MessageListViewController *)v76 suppressNoContentView])
    {
      [(MessageListViewController *)v76 setSuppressNoContentView:0];
      uint64_t v63 = 1;
    }
    else
    {
      uint64_t v63 = 0;
    }
    [(MessageListViewController *)v76 _updateNoContentViewAnimated:v70 suppressNoContentView:v63];
  }
  if (!sub_100048FD8(v76))
  {
    [(MessageListViewController *)v76 _setEditing:0 animated:v70 preserveSelection:0];
    [(MessageListViewController *)v76 _exitMultiSelectionForce:1];
  }
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000831C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699920 != -1) {
    dispatch_once(&qword_100699920, block);
  }
  v2 = (void *)qword_100699918;

  return (OS_os_log *)v2;
}

- (void)messageListSectionDataSource:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5 item:(id)a6 itemWasCached:(BOOL)a7 duration:(double)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (![(MessageListViewController *)self isInitialCellConfigurationCompleted]|| ([(MessageListViewController *)self firstBatchCellConfigurationCompleted] & 1) == 0)
  {
    id v16 = [(MessageListViewController *)self indexPathsForConfiguredCollectionViewCells];
    BOOL v17 = +[MessageListViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      unsigned int v20 = [v15 itemID];
      unsigned int v21 = [v14 ef_publicDescription];
      int v40 = 138544130;
      id v41 = v19;
      __int16 v42 = 2048;
      id v43 = self;
      __int16 v44 = 2114;
      id v45 = v20;
      __int16 v46 = 2114;
      id v47 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Mark item (id: %{public}@) at index path: %{public}@ as configured", (uint8_t *)&v40, 0x2Au);
    }
    [v16 addObject:v14];
    unsigned int v22 = [v13 messageList];
    id v23 = [v22 objectID];
    [(MessageListViewController *)self _checkMessageListLoadingCompleted:v23];
  }
  if (![(MessageListViewController *)self firstBatchCellConfigurationCompleted])goto LABEL_22; {
  id v24 = [v15 itemID];
  }
  id v25 = [(MessageListViewController *)self lastSelectedItemID];
  if ([v24 isEqual:v25])
  {
    unsigned int v26 = +[UIDevice mf_isPad];

    if (!v26) {
      goto LABEL_13;
    }
    uint64_t v27 = +[MessageListViewController log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = (objc_class *)objc_opt_class();
      float v29 = NSStringFromClass(v28);
      int v40 = 138543618;
      id v41 = v29;
      __int16 v42 = 2048;
      id v43 = self;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Selected message changed - update conversation bar button items", (uint8_t *)&v40, 0x16u);
    }
    id v25 = [(MessageListViewController *)self conversationViewController];
    [v25 _updateBarButtonsEnabled];
  }

LABEL_13:
  if (!a7)
  {
    id v30 = [(MessageListViewController *)self cellsController];
    if ([v30 wasItemRecentlyVisible:v24])
    {
      if (a8 < 0.005)
      {
        id v31 = +[MessageListViewController log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          id v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          id v37 = (id)objc_claimAutoreleasedReturnValue();
          id v38 = [v14 section];
          id v39 = [v14 item];
          int v40 = 138544898;
          id v41 = v37;
          __int16 v42 = 2048;
          id v43 = self;
          __int16 v44 = 2048;
          id v45 = v38;
          __int16 v46 = 2048;
          id v47 = v39;
          __int16 v48 = 2114;
          id v49 = v24;
          __int16 v50 = 2048;
          double v51 = a8;
          __int16 v52 = 1024;
          int v53 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "<%{public}@: %p> Cell probably did not flicker at indexPath: (%ld-%ld), itemID: %{public}@, duration: %.3f, cached: %{BOOL}d", (uint8_t *)&v40, 0x44u);
        }
      }
      else
      {
        id v31 = +[MessageListViewController log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          id v33 = (id)objc_claimAutoreleasedReturnValue();
          id v34 = [v14 section];
          id v35 = [v14 item];
          int v40 = 138544898;
          id v41 = v33;
          __int16 v42 = 2048;
          id v43 = self;
          __int16 v44 = 2048;
          id v45 = v34;
          __int16 v46 = 2048;
          id v47 = v35;
          __int16 v48 = 2114;
          id v49 = v24;
          __int16 v50 = 2048;
          double v51 = a8;
          __int16 v52 = 1024;
          int v53 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Cell may have flickered at indexPath: (%ld-%ld), itemID: %{public}@, duration: %.3f, cached: %{BOOL}d", (uint8_t *)&v40, 0x44u);
        }
      }

      [v30 reportFlickeringCell:a8 >= 0.005 duration:a8];
    }

LABEL_22:
    id v24 = [(MessageListViewController *)self cellsController];
    [v24 reportCellDidLoad:1 error:0];
  }
}

- (void)_checkMessageListLoadingCompleted:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MessageListViewController *)self indexPathsForToBeConfiguredCells];
  id v6 = [(MessageListViewController *)self indexPathsForConfiguredCollectionViewCells];
  unsigned int v7 = [v5 isSubsetOfSet:v6];
  if (([(MessageListViewController *)self hasUpdatedAllVisibleSections] & v7) == 1)
  {
    id v8 = +[MessageListViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v17 = 138543874;
      id v18 = v10;
      __int16 v19 = 2048;
      unsigned int v20 = self;
      __int16 v21 = 2048;
      id v22 = [v6 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> All initial visible items (%lu) have been configured!", (uint8_t *)&v17, 0x20u);
    }
    [(MessageListViewController *)self setFirstBatchCellConfigurationCompleted:1];
    [(MessageListViewController *)self setInitialCellConfigurationCompleted:1];
    [(MessageListViewController *)self setIndexPathsForToBeConfiguredCells:0];
    id v11 = [(MessageListViewController *)self indexPathsForConfiguredCollectionViewCells];
    [v11 removeAllObjects];

    unsigned int v12 = +[NSNotificationCenter defaultCenter];
    [v12 postNotificationName:@"MessageListLoadingCompleted" object:self];

    id v13 = MFMessageListLoadingSignpostLog();
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v4);

    id v15 = MFMessageListLoadingSignpostLog();
    id v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v14, "MessageListLoading", "Finished loading message list enableTelemetry=YES ", (uint8_t *)&v17, 2u);
    }
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v7 messageListItemFuture];
    [(MessageListViewController *)self _updateLastSeenDatesForMessageListItemFuture:v9 atIndexPath:v8];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v11 = [v10 cellHelper];
    id v36 = [v11 cellView];
    unsigned int v12 = [v11 messageListItem];
    if (([v10 isHidden] & 1) != 0
      || ([v10 isHiddenOrHasHiddenAncestor] & 1) != 0)
    {
      goto LABEL_9;
    }
    [v10 alpha];
    if (v13 < 0.0) {
      double v13 = -v13;
    }
    if (v13 < 2.22044605e-16)
    {
LABEL_9:
      os_signpost_id_t v14 = +[MessageListViewController log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        id v24 = (MessageListViewController *)[v8 section];
        id v32 = [v8 item];
        id v34 = [v10 _layoutAttributes];
        unsigned int v30 = [v10 isHidden];
        unsigned int v25 = [v10 isHiddenOrHasHiddenAncestor];
        [v10 alpha];
        *(_DWORD *)buf = 134219778;
        id v39 = self;
        __int16 v40 = 2048;
        id v41 = v24;
        __int16 v42 = 2048;
        id v43 = v32;
        __int16 v44 = 1024;
        BOOL v45 = v12 != 0;
        __int16 v46 = 2114;
        uint64_t v47 = (uint64_t)v34;
        __int16 v48 = 1024;
        unsigned int v49 = v30;
        __int16 v50 = 1024;
        unsigned int v51 = v25;
        __int16 v52 = 2048;
        uint64_t v53 = v26;
        _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%p: Cell is unexpectedly hidden:\n\tindexPath: (%ld, %ld)\n\thasItem: %{BOOL}d\n\tlayoutAttributes: %{public}@\n\tisHidden: %{BOOL}d\n\tisHiddenOrHasHiddenAncestor: %{BOOL}d\n\talpha: %f", buf, 0x46u);
      }
    }
    id v37 = 0;
    unsigned __int8 v15 = [v36 verifyContentVisibility:&v37];
    id v16 = v37;
    if ((v15 & 1) == 0)
    {
      int v17 = +[MessageListViewController log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [v16 ef_publicDescription];
        id v35 = (MessageListViewController *)objc_claimAutoreleasedReturnValue();
        id v33 = [v8 ef_publicDescription];
        uint64_t v27 = [v10 _layoutAttributes];
        *(_DWORD *)buf = 134219010;
        id v39 = self;
        __int16 v40 = 2114;
        id v41 = v35;
        __int16 v42 = 2114;
        id v43 = v33;
        __int16 v44 = 1024;
        BOOL v45 = v12 != 0;
        __int16 v46 = 2114;
        uint64_t v47 = v27;
        id v31 = (void *)v27;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%p: Cell is unexpectedly hidden - %{public}@:\n\tindexPath: %{public}@\n\thasItem: %{BOOL}d\n\tlayoutAttributes: %{public}@", buf, 0x30u);
      }
    }
    if (v12)
    {
      id v18 = [(MessageListViewController *)self scene];
      __int16 v19 = [v18 daemonInterface];
      unsigned int v20 = [v19 interactionLogger];

      __int16 v21 = [(MessageListViewController *)self messageListType];
      id v22 = [v8 row];
      id v23 = sub_100049FC0((uint64_t)[v11 style]);
      [v20 messageListDisplayStartedForListItem:v12 messageListType:v21 row:v22 cellStyle:v23];
    }
    else
    {
      unsigned int v20 = +[MessageListViewController log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        float v29 = (MessageListViewController *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        id v39 = v29;
        __int16 v40 = 2048;
        id v41 = self;
        __int16 v42 = 2112;
        id v43 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "<%@: %p> Looks like collection view tried to display a cell that is no longer valid. Ignoring interaction log for indexPath: %@", buf, 0x20u);
      }
    }
  }
}

- (NSString)messageListType
{
  return self->_messageListType;
}

- (void)_updateLastSeenDatesForMessageListItemFuture:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(MessageListViewController *)self isBucketBarHidden] & 1) == 0)
  {
    if (v6)
    {
      id v8 = [(MessageListViewController *)self mailboxes];
      id v9 = [(MessageListViewController *)self selectedBucket];
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, self);
      id v10 = +[EFScheduler mainThreadScheduler];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100054F64;
      v13[3] = &unk_100609D50;
      objc_copyWeak(v15, location);
      v15[1] = v9;
      id v11 = v8;
      os_signpost_id_t v14 = v11;
      [v6 onScheduler:v10 addSuccessBlock:v13];

      objc_destroyWeak(v15);
      objc_destroyWeak(location);
    }
    else
    {
      id v11 = +[MessageListViewController log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        unsigned int v12 = [v7 ef_publicDescription];
        sub_10045B8D8(v12, (uint8_t *)location, v11);
      }
    }
  }
}

- (id)lastSelectedItemID
{
  p_lastSelectedItemID = &self->_lastSelectedItemID;
  lastSelectedItemID = self->_lastSelectedItemID;
  if (lastSelectedItemID)
  {
    id v4 = lastSelectedItemID;
  }
  else
  {
    unsigned __int8 v5 = [(MessageListViewController *)self conversationViewController];
    id v6 = [v5 referenceMessageListItem];
    id v7 = [v6 itemID];

    if (v7) {
      objc_storeStrong((id *)p_lastSelectedItemID, v7);
    }
    id v4 = *p_lastSelectedItemID;
  }

  return v4;
}

- (ConversationViewController)conversationViewController
{
  conversationViewController = self->_conversationViewController;
  if (!conversationViewController)
  {
    id v4 = [(MessageListViewController *)self scene];
    unsigned __int8 v5 = [v4 splitViewController];
    id v6 = [v5 messageDetailNavController];
    id v7 = [v6 conversationViewController];

    if (v7)
    {
      id v8 = v7;
      id v9 = self->_conversationViewController;
      self->_conversationViewController = v8;
    }
    else
    {
      id v10 = [ConversationViewController alloc];
      id v11 = [(MessageListViewController *)self contactStore];
      unsigned int v12 = [(MessageListViewController *)self avatarGenerator];
      double v13 = [(ConversationViewController *)v10 initWithScene:v4 contactStore:v11 avatarGenerator:v12];
      os_signpost_id_t v14 = self->_conversationViewController;
      self->_conversationViewController = v13;

      [(ConversationViewControllerBase *)self->_conversationViewController setDelegate:self];
      [(ConversationViewControllerBase *)self->_conversationViewController setIsPrimary:1];
      id v9 = [(MessageListViewController *)self diagnosticsHelper];
      [(ConversationViewController *)self->_conversationViewController setDiagnosticsHelper:v9];
    }

    conversationViewController = self->_conversationViewController;
  }

  return conversationViewController;
}

- (void)_updateNoContentViewAnimated:(BOOL)a3 suppressNoContentView:(BOOL)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001E25C;
  v5[3] = &unk_100609F68;
  v5[4] = self;
  v5[5] = a2;
  BOOL v6 = a3;
  BOOL v7 = a4;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performBlock:v5];
}

- (BOOL)suppressNoContentView
{
  return self->_suppressNoContentView;
}

- (BOOL)shouldSelectInitialMessage
{
  return self->_shouldSelectInitialMessage;
}

- (void)_startObservationForStatusBarBadgeCountWithObservedMailboxes:(id)a3 smartMailboxPredicate:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  BOOL v7 = [(MessageListViewController *)self mailStatusViewController];
  [v7 stopObserving];

  unsigned int v8 = [(MessageListViewController *)self isSearchViewController];
  id v9 = @"Message list status";
  if (v8) {
    id v9 = @"Search status";
  }
  id v10 = v9;
  id v11 = [(MessageListViewController *)self updatedPredicateForFocusedAccounts:v6];
  unsigned int v12 = sub_10004BC9C(self, v11);

  double v13 = [(MessageListViewController *)self mailStatusViewController];
  [v13 startObservingForVisibleMailboxes:v14 delegate:self filterPredicate:v12 label:v10];
}

- (MailStatusViewController)mailStatusViewController
{
  return self->_mailStatusViewController;
}

- (void)_setEditing:(BOOL)a3 animated:(BOOL)a4 preserveSelection:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  unsigned int v9 = [(MessageListViewController *)self isEditing];
  if (v9 != v7)
  {
    char v10 = v9;
    v38.receiver = self;
    v38.super_class = (Class)MessageListViewController;
    [(MessageListViewController *)&v38 setEditing:v7 animated:v6];
    id v11 = [(MessageListViewController *)self state];
    [v11 setIsEditing:v7];

    unsigned int v12 = [(MessageListViewController *)self mailboxPickerDelegate];
    [v12 messageListViewController:self setEditing:v7 animated:v6];

    uint64_t v13 = [(MessageListViewController *)self previousMessageListSelectionModel];
    unsigned int v14 = [(MessageListViewController *)self _inMultiSelectionMode];
    unsigned int v15 = v14;
    int v16 = !v7;
    if (v13) {
      int v16 = 1;
    }
    if (v16) {
      int v17 = (void *)v13;
    }
    else {
      int v17 = 0;
    }
    if ((v16 & 1) == 0 && ((v14 ^ 1) & 1) == 0)
    {
      int v17 = [(MessageListViewController *)self messageListSelectionModel];
    }
    if (v15) {
      unsigned int v18 = 1;
    }
    else {
      unsigned int v18 = [v17 shouldRestoreSelection];
    }
    __int16 v19 = +[MessageListViewController log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = (objc_class *)objc_opt_class();
      __int16 v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      __int16 v40 = v21;
      __int16 v41 = 2048;
      __int16 v42 = self;
      __int16 v43 = 1024;
      BOOL v44 = v7;
      __int16 v45 = 1024;
      unsigned int v46 = v15;
      __int16 v47 = 1024;
      unsigned int v48 = v18;
      __int16 v49 = 2114;
      __int16 v50 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> setEditing: %{BOOL}d, inMultiSelection: %{BOOL}d, shouldRestoreSelection: %{BOOL}d, previousSelectionModel: %{public}@", buf, 0x32u);
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100157304;
    v32[3] = &unk_10060A0D0;
    v32[4] = self;
    BOOL v34 = v7;
    BOOL v35 = v6;
    char v36 = v10;
    char v37 = v18;
    id v22 = v17;
    id v33 = v22;
    id v23 = objc_retainBlock(v32);
    if (v7)
    {
      id v24 = v22;
      if ((v18 & 1) == 0) {
        id v24 = [objc_alloc((Class)MessageListSelectionModel) initWithDataSource:self delegate:self];
      }
      [(MessageListViewController *)self setMessageListSelectionModel:v24];
      if ((v18 & 1) == 0) {

      }
      [(MessageListViewController *)self setPreviousMessageListSelectionModel:0];
      unsigned int v25 = [(MessageListViewController *)self conversationViewController];
      [v25 setSelectionDataSource:self];
    }
    else
    {
      if (v5)
      {
        uint64_t v26 = [(MessageListViewController *)self messageListSelectionModel];
        [v26 preserveSelection];
        [(MessageListViewController *)self setPreviousMessageListSelectionModel:v26];
      }
      else
      {
        [(MessageListViewController *)self setPreviousMessageListSelectionModel:0];
      }
      [(MessageListViewController *)self setMessageListSelectionModel:0];
      sub_10014FA94((uint64_t)self, 0);
      unsigned int v25 = [(MessageListViewController *)self conversationViewController];
      [v25 setSelectionDataSource:0];
    }

    BOOL v27 = [(MessageListViewController *)self _inMultiSelectionMode];
    uint64_t v28 = [(MessageListViewController *)self layoutValuesHelper];
    [v28 setInMultiSelectionMode:v27];

    if (v6) {
      ((void (*)(void *))v23[2])(v23);
    }
    else {
      +[UIView performWithoutAnimation:v23];
    }
    [(MessageListViewController *)self _updateTitle];
    [(MessageListViewController *)self updateBarButtons];
    float v29 = [(MessageListViewController *)self searchBar];
    [v29 _setEnabled:v7 ^ 1 animated:v6];

    [(MessageListViewController *)self _setRowDeletionEnabled:v7 animated:v6];
    unsigned int v30 = [(MessageListViewController *)self state];
    [v30 isEditing];

    id v31 = [(MessageListViewController *)self conversationViewController];
    [v31 _updateBarButtonsAnimated:1 force:1 isShowingTitle:0];
  }
}

- (void)_exitMultiSelectionForce:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MessageListViewController *)self collectionView];
  BOOL v6 = [v5 indexPathsForSelectedItems];

  id v7 = [v6 count];
  unsigned int v8 = [(MessageListViewController *)self messageListSelectionModel];
  unsigned int v9 = v8;
  BOOL v10 = v8 != 0;
  if (v8 && v7 != (id)1) {
    BOOL v10 = (uint64_t)[v8 count] < 2;
  }
  if (([(MessageListViewController *)self isEditing] & 1) != 0 || !v3 && !v10)
  {
    int v17 = +[MessageListViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v18 = (objc_class *)objc_opt_class();
      __int16 v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138544642;
      id v22 = v19;
      __int16 v23 = 2048;
      id v24 = self;
      __int16 v25 = 1024;
      BOOL v26 = v10;
      __int16 v27 = 1024;
      BOOL v28 = v9 != 0;
      __int16 v29 = 1024;
      BOOL v30 = v3;
      __int16 v31 = 1024;
      BOOL v32 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Don't modify selection mode (hasMultiSelection: %{BOOL}d, hasSelectionModel: %{BOOL}d, editing: %{BOOL}d, force: %{BOOL}d)", buf, 0x2Eu);
    }
    goto LABEL_14;
  }
  id v11 = +[MessageListViewController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138544130;
    id v22 = v13;
    __int16 v23 = 2048;
    id v24 = self;
    __int16 v25 = 1024;
    BOOL v26 = v3;
    __int16 v27 = 1024;
    BOOL v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Exit multi-selection (force: %{BOOL}d, hasMultiSelection: %{BOOL}d)", buf, 0x22u);
  }
  unsigned int v14 = [(MessageListViewController *)self layoutValuesHelper];
  [v14 setInMultiSelectionMode:0];

  [(MessageListViewController *)self setMessageListSelectionModel:0];
  [(MessageListViewController *)self _setRowDeletionEnabled:0 animated:1];
  [(MessageListViewController *)self _updateTitle];
  if (v7 == (id)1)
  {
    unsigned int v15 = [(MessageListViewController *)self dataSource];
    int v16 = [v6 firstObject];
    int v17 = [v15 itemIdentifierForIndexPath:v16];

    if ([(MessageListViewController *)self isPresentingSearchViewController])
    {
      [(MessageListViewController *)self selectRowOfItemID:v17 scrollToVisible:0 animated:0];
    }
    else
    {
      LOBYTE(v20) = 0;
      [(MessageListViewController *)self _handleDidSelectItemID:v17 referenceItem:0 scrollToVisible:0 userInitiated:0 canRestoreDraft:0 animated:0 showConversationView:v20];
    }
LABEL_14:
  }
}

- (void)_commonInitWithDaemonInterface:(id)a3 mailboxes:(id)a4
{
  id v37 = a3;
  id v6 = a4;
  id v7 = [[MessageListDragDropHelper alloc] initWithDataSource:self delegate:self];
  messageListDragDropHelper = self->_messageListDragDropHelper;
  self->_messageListDragDropHelper = v7;

  [(MessageListViewController *)self setDefinesPresentationContext:1];
  unsigned int v9 = [(MessageListViewController *)self state];
  [(MessageListViewController *)self updateState:v9 withMailboxes:v6];

  BOOL v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_updateThreadingPreference:" name:MailApplicationsDisableThreadingKeyChanged object:0];
  [v10 addObserver:self selector:"_updateListForChange:" name:MailApplicationDidChangePreviewLinesNotification object:0];
  [v10 addObserver:self selector:"_updateListForChange:" name:MailApplicationDidChangeShowToCCNotification object:0];
  id v11 = [v37 outgoingMessageRepository];
  unsigned int v12 = [MailStatusObserver alloc];
  uint64_t v13 = [(MessageListViewController *)self mailboxRepository];
  unsigned int v14 = [(MailStatusObserver *)v12 initWithMailboxRepository:v13 delegate:self];
  mailStatusObserver = self->_mailStatusObserver;
  self->_mailStatusObserver = v14;

  int v16 = [MailStatusViewController alloc];
  int v17 = [(MessageListViewController *)self mailboxRepository];
  unsigned int v18 = [(MessageListViewController *)self scene];
  __int16 v19 = [(MailStatusViewController *)v16 initWithMailboxRepository:v17 outgoingMessageRepository:v11 scene:v18];
  mailStatusViewController = self->_mailStatusViewController;
  self->_mailStatusViewController = v19;

  [(MessageListViewController *)self _updateResolvedMailboxObjectIDs];
  [(MessageListViewController *)self _updateStatusObservers];
  __int16 v21 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.MessageListViewController.parsecFeedback" qualityOfService:17];
  parsecEventQueue = self->_parsecEventQueue;
  self->_parsecEventQueue = v21;

  EFRegisterContentProtectionObserver();
  id v23 = objc_alloc((Class)EMCollectionItemIDStateCapturer);
  id v24 = (objc_class *)objc_opt_class();
  __int16 v25 = NSStringFromClass(v24);
  BOOL v26 = (EMCollectionItemIDStateCapturer *)[v23 initWithTitle:v25 delegate:self];
  stateCapturer = self->_stateCapturer;
  self->_stateCapturer = v26;

  BOOL v28 = [(MessageListViewController *)self isSearchViewController];
  if (v28)
  {
    __int16 v29 = +[MessageListViewController log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v30 = (objc_class *)objc_opt_class();
      __int16 v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v31;
      __int16 v46 = 2048;
      __int16 v47 = self;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "<%@: %p> Skip web view preallocation", buf, 0x16u);
    }
  }
  else if (qword_100699938 != -1)
  {
    dispatch_once(&qword_100699938, &stru_100609B08);
  }
  BOOL v32 = [(MessageListViewController *)self state];
  [v32 setIsSearch:v28];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  if (EMBlackPearlIsFeatureEnabled())
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10014B27C;
    v43[3] = &unk_100608BD0;
    objc_copyWeak(&v44, (id *)buf);
    id v33 = +[EMInternalPreferences observeChangesForPreference:42 autoCancelToken:1 usingBlock:v43];
    [(MessageListViewController *)self setShouldShowCategorizationStatusToken:v33];

    BOOL v34 = +[NSUserDefaults em_userDefaults];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10014B2FC;
    v41[3] = &unk_100605F40;
    objc_copyWeak(&v42, (id *)buf);
    BOOL v35 = [v34 ef_observeKeyPath:EMUserDefaultHideMessageListAvatar options:5 autoCancelToken:1 usingBlock:v41];
    [(MessageListViewController *)self setShouldHideMessageListAvatarToken:v35];

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10014B46C;
    v39[3] = &unk_100608BD0;
    objc_copyWeak(&v40, (id *)buf);
    char v36 = +[EMInternalPreferences observeChangesForPreference:47 autoCancelToken:1 usingBlock:v39];
    [(MessageListViewController *)self setScrollDigestToken:v36];

    objc_destroyWeak(&v40);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&v44);
  }
  objc_destroyWeak((id *)buf);
}

- (void)updateState:(id)a3 withMailboxes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v15 updateState:v7 withMailboxes:v8];
  unsigned __int8 v9 = [v7 isOutgoingMailbox];
  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v4 = +[NSUserDefaults em_userDefaults];
    uint64_t v10 = [v4 BOOLForKey:DisableThreadingKey] ^ 1;
  }
  [(MessageListViewController *)self setThreaded:v10];
  if ((v9 & 1) == 0) {

  }
  id v11 = [(MessageListViewController *)self scene];
  unsigned int v12 = [v11 daemonInterface];
  uint64_t v13 = [v12 interactionLogger];
  unsigned int v14 = [v13 messageListTypeForMailboxes:v8];
  [(MessageListViewController *)self setMessageListType:v14];
}

- (void)setMessageListType:(id)a3
{
}

- (void)setShouldShowCategorizationStatusToken:(id)a3
{
}

- (void)setShouldHideMessageListAvatarToken:(id)a3
{
}

- (void)setScrollDigestToken:(id)a3
{
}

- (BOOL)preferUnreadCountInsteadOfTotalCount:(id)a3
{
  return 1;
}

- (void)_updateStatusObservers
{
  id v9 = [(MessageListViewController *)self mailboxes];
  BOOL v3 = [(MessageListViewController *)self _observedMailboxesAndSmartMailboxPredicate];
  id v4 = [v3 first];
  BOOL v5 = [v3 second];
  id v6 = sub_10004BC9C(self, 0);
  sub_10004E8BC(self, v9, v6);

  [(MessageListViewController *)self _startObservationForStatusBarBadgeCountWithObservedMailboxes:v4 smartMailboxPredicate:v5];
  id v7 = [(MessageListViewController *)self messageTriageInteractionHelper];
  [v7 startObservingMailboxes:v4];

  id v8 = [(MessageListViewController *)self messageListFetchHelper];
  [v8 setMailboxes:v4];
}

- (MessageTriageInteractionHelper)messageTriageInteractionHelper
{
  messageTriageInteractionHelper = self->_messageTriageInteractionHelper;
  if (!messageTriageInteractionHelper)
  {
    id v4 = [MessageTriageInteractionHelper alloc];
    BOOL v5 = [(MessageListViewController *)self scene];
    id v6 = [(MessageTriageInteractionHelper *)v4 initWithDataSource:self triageInteractionDelegate:self scene:v5 presentingViewController:self];
    id v7 = self->_messageTriageInteractionHelper;
    self->_messageTriageInteractionHelper = v6;

    messageTriageInteractionHelper = self->_messageTriageInteractionHelper;
  }

  return messageTriageInteractionHelper;
}

- (void)_updateResolvedMailboxObjectIDs
{
  BOOL v3 = +[NSMutableSet set];
  resolvedMailboxObjectIDs = self->_resolvedMailboxObjectIDs;
  self->_resolvedMailboxObjectIDs = v3;

  [(MessageListViewController *)self mailboxes];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          buf[0] = 0;
          uint64_t v10 = [v9 mailboxScope];
          id v11 = [(MessageListViewController *)self mailboxRepository];
          unsigned int v12 = [v10 allMailboxObjectIDsWithMailboxTypeResolver:v11 forExclusion:buf];

          [(NSMutableSet *)self->_resolvedMailboxObjectIDs unionSet:v12];
        }
        else
        {
          uint64_t v13 = self->_resolvedMailboxObjectIDs;
          unsigned int v14 = [v9 objectID:v19];
          [(NSMutableSet *)v13 addObject:v14];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v6);
  }

  objc_super v15 = +[MessageListViewController log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = (objc_class *)objc_opt_class();
    int v17 = NSStringFromClass(v16);
    unsigned int v18 = self->_resolvedMailboxObjectIDs;
    *(_DWORD *)buf = 138413058;
    id v24 = v17;
    __int16 v25 = 2048;
    BOOL v26 = self;
    __int16 v27 = 2114;
    BOOL v28 = v18;
    __int16 v29 = 2114;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<%@: %p> Updated resolved mailbox object ids: %{public}@, mailboxes: %{public}@", buf, 0x2Au);
  }
}

- (id)_observedMailboxesAndSmartMailboxPredicate
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(MessageListViewController *)self mailboxes];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100006040;
  v16[3] = &unk_100604E08;
  id v5 = v3;
  id v17 = v5;
  id v6 = [v4 ef_filter:v16];

  if ([v6 count]
    || ([(MessageListViewController *)self state],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 containsSmartMailbox],
        v7,
        !v8))
  {
    uint64_t v13 = 0;
  }
  else
  {
    id v9 = [(MessageListViewController *)self accountsProvider];
    uint64_t v10 = [v9 displayedAccounts];

    id v11 = [v10 allObjects];
    uint64_t v12 = [v11 ef_compactMap:&stru_100609C00];

    if ([v5 count])
    {
      uint64_t v13 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];
    }
    else
    {
      uint64_t v13 = 0;
    }

    id v6 = (void *)v12;
  }
  id v14 = [objc_alloc((Class)EFPair) initWithFirst:v6 second:v13];

  return v14;
}

- (BOOL)shouldShowSubtitle
{
  if ([(MessageListViewController *)self _isFlaggedMailbox]) {
    return 0;
  }
  id v4 = [(MessageListViewController *)self state];
  unsigned __int8 v5 = [v4 containsDraftsMailbox];

  return v5 ^ 1;
}

- (BOOL)_isFlaggedMailbox
{
  id v3 = [(MessageListViewController *)self mailboxes];
  id v4 = [v3 count];

  if (v4 != (id)1) {
    return 0;
  }
  unsigned __int8 v5 = [(MessageListViewController *)self mailboxes];
  id v6 = [v5 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  unsigned int v8 = [(MessageListViewController *)self mailboxes];
  id v9 = [v8 firstObject];

  BOOL v10 = [v9 smartMailboxType] == (id)1;
  return v10;
}

- (id)lastSeenDatesForBucket:(int64_t)a3
{
  id v4 = [(MessageListViewController *)self _bucketsViewControllerSession];
  unsigned __int8 v5 = [v4 lastSeenDatesForBucket:a3];

  return v5;
}

- (void)updateNoContentViewAnimated:(BOOL)a3
{
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v3 viewLayoutMarginsDidChange];
  [(MessageListViewController *)self _updateLayoutMargins];
}

- (void)setUpdateScrollableHintBlock:(id)a3
{
}

- (void)setSwipeActionVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MessageListViewController;
  if ([(MessageListViewController *)&v6 swipeActionVisible] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MessageListViewController;
    [(MessageListViewController *)&v5 setSwipeActionVisible:v3];
    if (!v3) {
      sub_10014BCE4(self);
    }
  }
}

- (void)setSuppressNoContentView:(BOOL)a3
{
  self->_suppressNoContentView = a3;
}

- (void)setSearchController:(id)a3
{
}

- (void)setScrollableHintBlock:(id)a3
{
}

- (void)setPreviousMessageListSelectionModel:(id)a3
{
}

- (void)setNavigationItemToConfigure:(id)a3
{
}

- (void)setMultiEditButtonItem:(id)a3
{
}

- (void)setMessageListSearchViewController:(id)a3
{
}

- (void)setMailboxPickerDelegate:(id)a3
{
}

- (void)setFlattenedMailboxesFuture:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setCurrentUnreadCount:(unint64_t)a3
{
  self->_currentUnreadCount = a3;
}

- (id)scrollableHintBlock
{
  return self->_scrollableHintBlock;
}

- (EFLocked)isRefreshing
{
  return self->_isRefreshing;
}

- (EFFuture)flattenedMailboxesFuture
{
  return self->_flattenedMailboxesFuture;
}

- (unint64_t)currentUnreadCount
{
  return self->_currentUnreadCount;
}

- (MFAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)selectMessageAtIndex:(int64_t)a3
{
  id v8 = [(MessageListViewController *)self dataSource];
  id v5 = [v8 sectionIndexForSection:MessageListSectionRecent];

  id v9 = +[NSIndexPath indexPathForRow:a3 inSection:v5];
  objc_super v6 = [(MessageListViewController *)self collectionView];
  [v6 selectItemAtIndexPath:v9 animated:0 scrollPosition:0];

  uint64_t v7 = [(MessageListViewController *)self collectionView];
  [(MessageListViewController *)self collectionView:v7 didSelectItemAtIndexPath:v9];
}

- (id)referenceMessageListItemForFirstConversationWithSingleMessage:(BOOL)a3 markAsRead:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v6 = [(MessageListViewController *)self dataSource];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 itemIdentifiers];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (!v8)
  {
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = *(void *)v16;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v16 != v9) {
      objc_enumerationMutation(v7);
    }
    id v11 = [v6 messageListItemForItemID:*(void *)(*((void *)&v15 + 1) + 8 * v10)];
    uint64_t v12 = [v11 result];

    if (!v5) {
      break;
    }
    if ([v12 count] == (id)1) {
      goto LABEL_13;
    }
LABEL_10:

    if (v8 == (id)++v10)
    {
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_12;
    }
  }
  if ((unint64_t)[v12 count] <= 1) {
    goto LABEL_10;
  }
LABEL_13:

  if (!v12) {
    goto LABEL_18;
  }
  long long v19 = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:&v19 count:1];
  uint64_t v7 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v13 undoManager:0 origin:2 actor:2 reason:4];

  if (v4 && ([v7 flagState] & 1) == 0) {
    [v7 performInteraction];
  }
LABEL_17:

LABEL_18:

  return v12;
}

+ (id)signpostLog
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014B0E8;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699930 != -1) {
    dispatch_once(&qword_100699930, block);
  }
  v2 = (void *)qword_100699928;

  return v2;
}

- (unint64_t)signpostID
{
  BOOL v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (void)setlastSeenDatesForSelectedBucket:(id)a3
{
  id v5 = a3;
  os_signpost_id_t v4 = [(MessageListViewController *)self _bucketsViewControllerSession];
  [v4 setlastSeenDates:v5 forBucket:[self selectedBucket]];
}

- (EFPair)lastSeenDatesForSelectedBucket
{
  id v3 = [(MessageListViewController *)self selectedBucket];

  return (EFPair *)[(MessageListViewController *)self lastSeenDatesForBucket:v3];
}

- (void)dealloc
{
  EFUnregisterContentProtectionObserver();
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v4 dealloc];
}

- (id)_noContentTitleForMailboxTypeString
{
  id v3 = +[NSBundle mainBundle];
  objc_super v4 = [v3 localizedStringForKey:@"NO_MAIL" value:&stru_100619928 table:@"Main"];

  if ([(MessageListViewController *)self isSearchViewController])
  {
    id v5 = +[NSBundle mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"NO_SEARCH_RESULTS" value:&stru_100619928 table:@"Main"];
LABEL_3:
    uint64_t v7 = (void *)v6;
LABEL_18:

    objc_super v4 = v7;
LABEL_19:
  }
  else
  {
    id v8 = [(MessageListViewController *)self state];
    unsigned int v9 = [v8 containsSmartMailbox];

    if (v9)
    {
      uint64_t v10 = [(MessageListViewController *)self mailboxes];
      id v5 = [v10 ef_firstObjectPassingTest:&stru_100609B48];

      switch((unint64_t)[v5 smartMailboxType])
      {
        case 0uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_VIP_MAIL" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 1uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_FLAGGED_MAIL" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 2uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_UNREAD_MAIL" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 3uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_MESSAGES_TO_ME" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 4uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_MESSAGES_WITH_ATTACHMENTS" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 5uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_IMPORTANT_MAIL" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 6uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_MESSAGES_TODAY" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 7uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_MUTED_MAIL" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 9uLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_MESSAGES_READ_LATER" value:&stru_100619928 table:@"Main"];
          goto LABEL_17;
        case 0xAuLL:
          id v11 = +[NSBundle mainBundle];
          uint64_t v12 = [v11 localizedStringForKey:@"NO_MESSAGES_FOLLOW_UP" value:&stru_100619928 table:@"Main"];
LABEL_17:
          uint64_t v7 = (void *)v12;

          objc_super v4 = v11;
          goto LABEL_18;
        case 0xBuLL:
        case 0xCuLL:
          uint64_t v6 = sub_10014B998();
          goto LABEL_3;
        default:
          goto LABEL_19;
      }
    }
  }

  return v4;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v11 viewWillDisappear:a3];
  *((unsigned char *)self + 8) &= ~1u;
  objc_super v4 = [(MessageListViewController *)self state];
  unsigned int v5 = [v4 containsOutbox];

  if (v5)
  {
    uint64_t v6 = [(MessageListViewController *)self scene];
    uint64_t v7 = [v6 daemonInterface];
    id v8 = [v7 outgoingMessageRepository];
    [v8 resumeDeliveryQueue];
  }
  unsigned int v9 = [(MessageListViewController *)self userActivity];
  [v9 resignCurrent];

  sub_10014BCE4(self);
  [(MessageListViewController *)self _deregisterViewInteractions];
  if (![(MessageListViewController *)self isSearchViewController]
    && ![(MessageListViewController *)self _isInSearch])
  {
    [(MessageListViewController *)self dismissTip];
    [(MessageListViewController *)self changeTipShouldDisplayTo:0];
  }
  uint64_t v10 = [(MessageListViewController *)self conversationViewController];
  [v10 setNeedsUpdateContentUnavailableConfiguration];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v14 viewDidDisappear:a3];
  objc_super v4 = +[MessageListViewController log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    long long v16 = v6;
    __int16 v17 = 2048;
    long long v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> viewDidDisappear", buf, 0x16u);
  }
  uint64_t v7 = [(MessageListViewController *)self scene];
  id v8 = [v7 dockContainer];
  [v8 removePresentationControllerDelegateObserver:self];

  unsigned int v9 = [v7 daemonInterface];
  uint64_t v10 = [v9 interactionLogger];
  [v10 messageListDisplayEndedForAllListItems];

  [(MessageListViewController *)self _clearVisibleSwipeActions];
  if (_os_feature_enabled_impl())
  {
    if (EMIsGreymatterSupportedWithOverride())
    {
      objc_super v11 = [(MessageListViewController *)self highlightedMessagesController];
      uint64_t v12 = [v11 messageList];
      BOOL v13 = v12 == 0;

      if (!v13) {
        [(MessageListViewController *)self refreshHighlightedMessagesController];
      }
    }
  }
  [(MessageListViewController *)self setInitialCellConfigurationCompleted:1];
}

- (void)_deregisterViewInteractions
{
  if (self && self->_changeFilterStateInteraction)
  {
    id v3 = [(MessageListViewController *)self view];
    objc_super v4 = v3;
    if (self) {
      changeFilterStateInteraction = self->_changeFilterStateInteraction;
    }
    else {
      changeFilterStateInteraction = 0;
    }
    [v3 removeInteraction:changeFilterStateInteraction];

    sub_100058D7C((uint64_t)self, 0);
  }
  if (self && self->_searchMessagesInteraction)
  {
    uint64_t v6 = [(MessageListViewController *)self searchBar];
    [v6 removeInteraction:self->_searchMessagesInteraction];

    sub_100058CA8((uint64_t)self, 0);
  }
}

- (BOOL)showingPopoverViewController
{
  id v3 = [(MessageListViewController *)self presentedViewController];
  objc_super v4 = [v3 popoverPresentationController];

  unsigned int v5 = [v4 barButtonItem];
  uint64_t v6 = [(MessageListViewController *)self filterPickerButtonItem];

  if (v5 == v6
    || ([v4 barButtonItem],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [(MessageListViewController *)self deleteButtonItem],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v7 == v8))
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    unsigned int v9 = [v4 sourceView];
    uint64_t v10 = [(MessageListViewController *)self view];
    unsigned __int8 v11 = [v9 isDescendantOfView:v10];
  }
  return v11;
}

- (void)updateForSplitViewControllerHidingMessageList
{
  if ([(MessageListViewController *)self isEditing])
  {
    [(MessageListViewController *)self _setEditing:0 animated:1 preserveSelection:1];
    [(MessageListViewController *)self _updateTitle];
  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
}

- (void)_sceneDidEnterBackground
{
  if (([(MessageListViewController *)self isEditing] & 1) == 0) {
    [(MessageListViewController *)self setPreviousMessageListSelectionModel:0];
  }
  [(MessageListViewController *)self refreshHighlightedMessagesController];
  id v3 = [(MessageListViewController *)self cellsController];
  [v3 reportMessageListCellMetrics];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (id)undoManager
{
  v2 = [(MessageListViewController *)self scene];
  id v3 = [v2 undoManager];

  return v3;
}

- (void)setMailboxes:(id)a3
{
}

- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4
{
}

- (void)setMailboxes:(id)a3 forceReload:(BOOL)a4 bucket:(int64_t)a5
{
}

- (id)_currentScrollableHint
{
  id v3 = [(MessageListViewController *)self navigationController];
  objc_super v4 = [v3 toolbar];

  unsigned int v5 = [(MessageListViewController *)self view];
  [v5 frame];
  uint64_t v6 = [(MessageListViewController *)self view];
  UIRoundToViewScale();
  uint64_t v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v8 = [v7 stringValue];
  uint64_t v12 = v8;
  unsigned int v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 _hintFromCurrentAppearance]);
  BOOL v13 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  return v10;
}

- (void)_callUpdateScrollableHintBlock
{
  unsigned int v5 = [(MessageListViewController *)self updateScrollableHintBlock];
  id v3 = [(MessageListViewController *)self scrollableHintBlock];
  if (v5 && v3)
  {
    objc_super v4 = [(MessageListViewController *)self _currentScrollableHint];
    v5[2](v5, v4);
  }
}

- (id)_observedMailboxes
{
  id v3 = [(MessageListViewController *)self mailboxes];
  objc_super v4 = [v3 ef_filter:&stru_100609C20];

  if (![v4 count])
  {
    unsigned int v5 = [(MessageListViewController *)self state];
    unsigned int v6 = [v5 containsSmartMailbox];

    if (v6)
    {
      uint64_t v7 = [(MessageListViewController *)self accountsProvider];
      id v8 = [v7 displayedAccounts];

      unsigned int v9 = [v8 allObjects];
      uint64_t v10 = [v9 ef_compactMap:&stru_100609C40];

      objc_super v4 = (void *)v10;
    }
  }

  return v4;
}

- (BOOL)hasSuggestions
{
  return 0;
}

- (double)editingSeparatorInset
{
  v2 = [(MessageListViewController *)self state];
  if ([v2 useSplitViewStyling]) {
    double v3 = 36.0;
  }
  else {
    double v3 = 41.0;
  }

  return v3;
}

- (BOOL)isSearchViewControllerEditing
{
  double v3 = [(MessageListViewController *)self presentedViewController];
  objc_super v4 = [(MessageListViewController *)self searchController];

  if (v3 != v4) {
    return 0;
  }
  unsigned int v6 = [(MessageListViewController *)self messageListSearchViewController];
  unsigned __int8 v5 = [v6 isEditing];

  return v5;
}

- (BOOL)isPresentingSearchViewController
{
  v2 = self;
  double v3 = [(MessageListViewController *)self presentedViewController];
  objc_super v4 = [(MessageListViewController *)v2 searchController];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)isInExpandedEnvironment
{
  v2 = [(MessageListViewController *)self scene];
  unsigned __int8 v3 = [v2 isInExpandedEnvironment];

  return v3;
}

- (BOOL)isSearchControllerActive
{
  v2 = [(MessageListViewController *)self searchController];
  unsigned __int8 v3 = [v2 isActive];

  return v3;
}

- (void)setSplitViewControllerNeedsFocusUpdate
{
  id v3 = [(MessageListViewController *)self scene];
  v2 = [v3 splitViewController];
  [v2 setNeedsFocusUpdate];
}

- (id)captureRestorationState
{
  id v3 = [(MessageListViewController *)self messageListPositionHelper];
  objc_super v4 = [v3 actuallyVisibleItemIDs];

  unsigned __int8 v5 = [(MessageListViewController *)self dataSource];
  unsigned int v6 = [v5 messageListItemsForItemIDs:v4];
  uint64_t v7 = +[EFFuture join:v6];

  id v27 = 0;
  id v8 = [v7 resultWithTimeout:&v27 error:0.1];
  id v9 = v27;
  if (v9)
  {
    uint64_t v10 = +[MessageListViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v24 = (objc_class *)objc_opt_class();
      __int16 v25 = NSStringFromClass(v24);
      BOOL v26 = [v9 ef_publicDescription];
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v25;
      __int16 v30 = 2048;
      __int16 v31 = self;
      __int16 v32 = 2112;
      id v33 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "<%@: %p> Fetching visible items for the restoration state failed with error: %@", buf, 0x20u);
    }
    unsigned __int8 v11 = 0;
  }
  else
  {
    uint64_t v12 = [(MessageListViewController *)self collectionView];
    [v12 contentOffset];
    double v14 = v13;
    long long v15 = [(MessageListViewController *)self layoutValuesHelper];
    long long v16 = [v15 defaultLayoutValues];
    [v16 compactRowHeight];
    double v18 = v17;

    long long v19 = [MessageListRestorationState alloc];
    uint64_t v10 = [(MessageListViewController *)self dataSource];
    long long v20 = [v10 messageListForSection:MessageListSectionRecent];
    long long v21 = [(MessageListViewController *)self mailboxes];
    long long v22 = [(MessageListViewController *)self lastSelectedItemID];
    unsigned __int8 v11 = [(MessageListRestorationState *)v19 initWithMessageList:v20 mailboxes:v21 visibleItems:v8 scrolledToTop:v14 < v18 lastSelectedItemID:v22];
  }

  return v11;
}

- (void)restoreState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[MessageListViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v18 = 2048;
    long long v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> State Restoration: Received restoration state future. Will restore state when it's loaded.", buf, 0x16u);
  }
  id v8 = [(MessageListViewController *)self stateRestorationFuture];
  [v8 cancel];

  [(MessageListViewController *)self setShouldSelectInitialMessage:0];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v9 = +[EFScheduler mainThreadScheduler];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v15[2] = sub_10014D2C4;
  v15[3] = &unk_100609CB8;
  objc_copyWeak(&v16, (id *)buf);
  uint64_t v10 = [v4 onScheduler:v9 then:v15];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10014DC40;
  v13[3] = &unk_100604FE8;
  objc_copyWeak(&v14, (id *)buf);
  [v10 always:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014DC9C;
  v12[3] = &unk_100609CE0;
  v12[4] = self;
  [v10 addSuccessBlock:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10014DD90;
  v11[3] = &unk_100604F70;
  void v11[4] = self;
  [v10 addFailureBlock:v11];
  [(MessageListViewController *)self setStateRestorationFuture:v10];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)_cancelOrCleanupStateRestoration
{
  id v3 = [(MessageListViewController *)self stateRestorationFuture];

  if (v3)
  {
    id v4 = +[MessageListViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v5 = (objc_class *)objc_opt_class();
      unsigned int v6 = NSStringFromClass(v5);
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<%@: %p> State Restoration: Cleaning up...", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v7 = [(MessageListViewController *)self stateRestorationFuture];
    [v7 cancel];

    [(MessageListViewController *)self setStateRestorationFuture:0];
    id v8 = [(MessageListViewController *)self scrollItemIndexPathPromise];
    [v8 cancel];

    [(MessageListViewController *)self setScrollItemIndexPathPromise:0];
    [(MessageListViewController *)self setInitialScrollItemID:0];
  }
}

- (void)_updateBucketBarIsHidden:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v7 _updateBucketBarIsHidden:a3];
  id v4 = [(MessageListViewController *)self _observedMailboxesAndSmartMailboxPredicate];
  unsigned __int8 v5 = [v4 first];
  unsigned int v6 = [v4 second];
  [(MessageListViewController *)self _startObservationForStatusBarBadgeCountWithObservedMailboxes:v5 smartMailboxPredicate:v6];
}

- (void)_updateLastSeenDates:(id)a3 forMailboxes:(id)a4 bucket:(int64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  int v9 = [(MessageListViewController *)self _bucketsViewControllerSession];
  [v9 updateLastSeenDates:v10 forMailboxes:v8 bucket:a5];
}

- (BOOL)_canDisplayMessage:(id)a3
{
  id v4 = [a3 mailboxObjectIDs];
  [(MessageListViewController *)self resolvedMailboxObjectIDs];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014E4E4;
  v8[3] = &unk_100609D28;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  unsigned __int8 v6 = [v4 ef_any:v8];

  return v6;
}

- (void)_doOnInitialLoadCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListViewController *)self initialLoadCompletedPromise];
  unsigned __int8 v6 = [v5 future];
  objc_super v7 = +[EFScheduler mainThreadScheduler];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10014E614;
  v9[3] = &unk_100605A38;
  id v8 = v4;
  id v10 = v8;
  [v6 onScheduler:v7 addSuccessBlock:v9];
}

- (EFFuture)initialLoadCompletedFuture
{
  v2 = [(MessageListViewController *)self initialLoadCompletedPromise];
  id v3 = [v2 future];

  return (EFFuture *)v3;
}

- (void)waitForLocalAndRemoteSearchCompletion:(id)a3
{
  id v5 = a3;
  [(MessageListViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MessageListViewController waitForLocalAndRemoteSearchCompletion:]", "MessageListViewController.m", 1503, "0");
}

- (void)collectionView:(id)a3 performPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(MessageListViewController *)self dataSource];
  objc_super v7 = [v6 itemIdentifierForIndexPath:v5];

  id v8 = [(MessageListViewController *)self state];
  id v23 = [(MessageListViewController *)self scene];
  id v9 = [(MessageListViewController *)self _draftOrOutboxMessageAtIndexPath:v5];
  if (v9) {
    [(MessageListViewController *)self _restoreDraftOrOutboxItem:v9];
  }
  unsigned int v10 = [v23 isInExpandedEnvironment];
  if ((v10 & 1) != 0
    || ([v8 containsOutbox] & 1) != 0
    || ((unsigned __int8 v11 = [v8 containsDraftsMailbox], v9) ? (v12 = 1) : (v12 = v11), (v12 & 1) != 0))
  {
    double v13 = +[MessageListViewController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = v7;
      long long v22 = v8;
      id v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = [v5 ef_publicDescription];
      unsigned int v17 = [v8 containsOutbox];
      unsigned int v18 = [v22 containsDraftsMailbox];
      long long v19 = [v9 ef_publicDescription];
      *(_DWORD *)buf = 138545154;
      id v25 = v15;
      __int16 v26 = 2048;
      id v27 = self;
      __int16 v28 = 2114;
      __int16 v29 = v16;
      __int16 v30 = 2114;
      __int16 v31 = v21;
      __int16 v32 = 1024;
      unsigned int v33 = v10;
      __int16 v34 = 1024;
      unsigned int v35 = v17;
      __int16 v36 = 1024;
      unsigned int v37 = v18;
      objc_super v7 = v21;
      __int16 v38 = 2114;
      id v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Skip showing conversation view - indexPath=%{public}@, messageID=%{public}@, isInExpandedEnvironment=%{BOOL}d, containsOutbox=%{BOOL}d, containsDraftsMailbox=%{BOOL}d, draftOrOutboxMessage=%{public}@", buf, 0x46u);

      id v8 = v22;
    }
  }
  else
  {
    long long v20 = [v23 splitViewController];
    [v20 showConversationViewControllerAnimated:1 completion:0];
  }
  [(MessageListViewController *)self _hideMailboxPickerOrMessageListAfterSelectionIfNeeded];
  [(MessageListViewController *)self reportEngagementAction:0 onItemID:v7];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_10014EA64((uint64_t)self, a4);
}

- (BOOL)collectionView:(id)a3 canPerformPrimaryActionForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(MessageListViewController *)self isEditing]) {
    char v6 = 0;
  }
  else {
    char v6 = sub_10014EA64((uint64_t)self, v5);
  }

  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  char v6 = _os_activity_create((void *)&_mh_execute_header, "-[MessageListViewController collectionView:didSelectItemAtIndexPath:]", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v6, &state);
  objc_super v7 = [(MessageListViewController *)self dataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v5];

  unsigned int v9 = [(MessageListViewController *)self isEditing];
  unsigned int v10 = [(MessageListViewController *)self messageListSelectionModel];

  unsigned __int8 v11 = +[MessageListViewController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138413570;
    id v25 = v13;
    __int16 v26 = 2048;
    id v27 = self;
    __int16 v28 = 2114;
    __int16 v29 = v8;
    __int16 v30 = 2112;
    id v31 = v5;
    __int16 v32 = 1024;
    unsigned int v33 = v9;
    __int16 v34 = 1024;
    BOOL v35 = v10 != 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@: %p> collectionView:didSelectItem: %{public}@, atIndexPath: %@, isEditing: %{BOOL}d, hasSelectionModel: %{BOOL}d", buf, 0x36u);
  }
  if (v10)
  {
    [(MessageListViewController *)self _updateSelectionModelDidSelectItemID:v8];
    [(MessageListViewController *)self reportEngagementAction:4 onItemID:v8];
  }
  else
  {
    id v14 = MFMessageSelectionLifecycleSignpostLog();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v8);

    id v16 = MFMessageSelectionLifecycleSignpostLog();
    unsigned int v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Message selection lifecycle", "User selected message with itemID: %{public}@", buf, 0xCu);
    }

    LOBYTE(v22) = 0;
    [(MessageListViewController *)self _handleDidSelectItemID:v8 referenceItem:0 scrollToVisible:0 userInitiated:1 canRestoreDraft:0 animated:1 showConversationView:v22];
  }
  unsigned int v18 = [(MessageListViewController *)self scene];
  long long v19 = [v18 splitViewController];
  [v19 setFocusedViewController:0];

  [(MessageListViewController *)self _cancelOrCleanupStateRestoration];
  long long v20 = [(MessageListViewController *)self state];
  if ([v20 useSplitViewStyling])
  {
    unsigned int v21 = [(MessageListViewController *)self _inMultiSelectionMode];

    if (v21) {
      sub_10014E0D4(self, v8, v5);
    }
  }
  else
  {
  }
  os_activity_scope_leave(&state);
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  id v5 = a3;
  if ([(MessageListViewController *)self isEditing])
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_super v7 = [v5 indexPathsForSelectedItems];
    BOOL v6 = (unint64_t)[v7 count] > 1;
  }
  return v6;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v10 = a4;
  id v5 = [(MessageListViewController *)self dataSource];
  BOOL v6 = [v5 itemIdentifierForIndexPath:v10];

  unsigned int v7 = [(MessageListViewController *)self _inMultiSelectionMode];
  if ([(MessageListViewController *)self _inMultiSelectionMode]) {
    [(MessageListViewController *)self _updateSelectionModelDidDeselectItemID:v6];
  }
  id v8 = [(MessageListViewController *)self state];
  unsigned int v9 = [v8 useSplitViewStyling] & v7;

  if (v9 == 1) {
    sub_10014E0D4(self, v6, v10);
  }
  [(MessageListViewController *)self scene];
}

- (BOOL)_inMultiSelectionMode
{
  id v3 = [(MessageListViewController *)self messageListSelectionModel];
  if (v3)
  {
    id v4 = [(MessageListViewController *)self messageListSelectionModel];
    if ((uint64_t)[v4 count] <= 1) {
      unsigned __int8 v5 = [(MessageListViewController *)self isEditing];
    }
    else {
      unsigned __int8 v5 = 1;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return [(MessageListViewController *)self shouldDisplayGroupedSenders] ^ 1;
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MessageListViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543874;
    __int16 v30 = v10;
    __int16 v31 = 2048;
    __int16 v32 = self;
    __int16 v33 = 2114;
    id v34 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> didBeginMultipleSelectionInteractionAtIndexPath: %{public}@", buf, 0x20u);
  }
  unsigned __int8 v11 = [(MessageListViewController *)self layoutValuesHelper];
  [v11 setInMultiSelectionMode:1];

  LODWORD(v11) = [(MessageListViewController *)self isEditing];
  if (v11 != [v6 isEditing])
  {
    [(MessageListViewController *)self changeTipShouldDisplayTo:0];
    -[MessageListViewController setEditing:animated:](self, "setEditing:animated:", [v6 isEditing], 1);
  }
  char v12 = [(MessageListViewController *)self dataSource];
  double v13 = [(MessageListViewController *)self collectionView];
  id v14 = [v13 indexPathsForSelectedItems];

  os_signpost_id_t v15 = [(MessageListViewController *)self messageListSelectionModel];
  LODWORD(v13) = v15 == 0;

  if (v13)
  {
    id v16 = [objc_alloc((Class)MessageListSelectionModel) initWithDataSource:self delegate:self];
    [(MessageListViewController *)self setMessageListSelectionModel:v16];

    unsigned int v17 = [(MessageListViewController *)self conversationViewController];
    [v17 setSelectionDataSource:self];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v14;
    id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v25;
      do
      {
        unsigned int v21 = 0;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = [v12 itemIdentifierForIndexPath:*(void *)(*((void *)&v24 + 1) + 8 * (void)v21) v24];
          [(MessageListViewController *)self _updateSelectionModelDidSelectItemID:v22];

          unsigned int v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }
  }
  id v23 = [(MessageListViewController *)self messageListSelectionModel];
  [v23 setMultipleSelectionActive:1];
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  unsigned __int8 v5 = +[MessageListViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2048;
    char v12 = self;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> %{public}@", (uint8_t *)&v9, 0x20u);
  }
  [(MessageListViewController *)self _finalizeMultipleSelection];
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v6 sectionAtIndex:[v5 section]];
  unsigned __int8 v8 = [v6 isMessagesSection:v7];

  return v8;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v10 = a4;
  if ([(MessageListViewController *)self isEditing])
  {
    id v6 = [v10 nextFocusedIndexPath];
    if (v6)
    {
      id v7 = [(MessageListViewController *)self dataSource];
      unsigned __int8 v8 = [v10 nextFocusedIndexPath];
      int v9 = [v7 itemIdentifierForIndexPath:v8];
      sub_10014FA94((uint64_t)self, v9);
    }
  }
}

- (id)collectionView:(id)a3 sceneActivationConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  id v7 = [(MessageListViewController *)self dataSource];
  long long v27 = [v7 messageListAtSectionIndex:[v6 section]];
  unsigned __int8 v8 = [v7 messageListItemAtIndexPath:v6];
  int v9 = [v8 result];

  id v10 = [(MessageListViewController *)self state];
  if ([v10 containsDraftsOrOutbox])
  {
    id v26 = v6;
    __int16 v11 = [(MessageListViewController *)self mailboxes];
    uint64_t v12 = [v11 ef_compactMapSelector:@"objectID"];

    long long v25 = (void *)v12;
    __int16 v13 = [v9 mailboxObjectIDs];
    long long v24 = [v13 firstObjectCommonWithArray:v12];

    if ([v10 containsDraftsMailbox]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 3;
    }
    id v15 = objc_alloc((Class)_MFMailCompositionContext);
    id v16 = [v9 displayMessageObjectID];
    unsigned int v17 = [(MessageListViewController *)self messageRepository];
    id v18 = +[UIApplication sharedApplication];
    id v19 = [v18 mailboxProvider];
    id v20 = [v15 initWithComposeType:v14 objectID:v16 mailboxID:v24 subject:0 autosaveID:0 messageRepository:v17 mailboxProvider:v19];

    unsigned int v21 = [(MessageListViewController *)self scene];
    uint64_t v22 = +[MFBayAdoption composeWindowSceneActivationConfigurationWithContext:v20 presentationSource:0 requestingScene:v21];

    id v6 = v26;
  }
  else
  {
    uint64_t v22 = +[MFBayAdoption openMessageInNewWindowConfigurationWithMessageListItem:v9 messageList:v27];
  }

  return v22;
}

- (id)preferredFocusEnvironments
{
  id v3 = [(MessageListViewController *)self searchController];
  unsigned __int8 v4 = [v3 isActive];

  if (v4)
  {
    id v5 = [(MessageListViewController *)self searchController];
    uint64_t v12 = v5;
    id v6 = +[NSArray arrayWithObjects:&v12 count:1];
LABEL_13:

    goto LABEL_14;
  }
  if (self && (id v5 = self->_keyboardFocusedItemID) != 0
    || ([(MessageListViewController *)self lastSelectedItemID],
        (id v5 = (EMCollectionItemID *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = [(MessageListViewController *)self dataSource];
    unsigned __int8 v8 = [v7 indexPathForItemIdentifier:v5];

    if (v8)
    {
      int v9 = [(MessageListViewController *)self collectionView];
      id v10 = [v9 cellForItemAtIndexPath:v8];

      if (v10)
      {
        __int16 v13 = v10;
        id v6 = +[NSArray arrayWithObjects:&v13 count:1];
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

    goto LABEL_13;
  }
  id v6 = 0;
LABEL_14:

  return v6;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  id v4 = a3;
  if (self && (id v5 = self->_keyboardFocusedItemID) != 0
    || ([(MessageListViewController *)self lastSelectedItemID],
        (id v5 = (EMCollectionItemID *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = [(MessageListViewController *)self dataSource];
    id v7 = [v6 indexPathForItemIdentifier:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_finalizeMultipleSelection
{
  id v3 = [(MessageListViewController *)self dataSource];
  id v4 = [(MessageListViewController *)self collectionView];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MessageListViewController *)self messageListSelectionModel];
  id v6 = [v5 itemsToDeselectAfterMultipleSelection];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = [v3 indexPathForItemIdentifier:*(void *)(*((void *)&v15 + 1) + 8 * (void)v9)];
        [v4 deselectItemAtIndexPath:v10 animated:0];

        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  __int16 v11 = [(MessageListViewController *)self messageListSelectionModel];
  [v11 setMultipleSelectionActive:0];

  uint64_t v12 = [(MessageListViewController *)self dataSource];
  __int16 v13 = [(MessageListViewController *)self messageListSelectionModel];
  uint64_t v14 = [v13 itemIDs];
  [v12 reloadItemsWithItemIDs:v14];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v3 = [(MessageListViewController *)self messageListPositionHelper];
  [v3 setUserIsScrolling:1];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v8 = [(MessageListViewController *)self scene];
  id v6 = [v8 splitViewController];
  id v7 = [(MessageListViewController *)self parentViewController];
  [v6 setFocusedViewController:v7];

  [(MessageListViewController *)self _cancelOrCleanupStateRestoration];
  if (!a4)
  {
    id v9 = [(MessageListViewController *)self messageListPositionHelper];
    [v9 setUserIsScrolling:0];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v3 = [(MessageListViewController *)self messageListPositionHelper];
  [v3 setUserIsScrolling:0];
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v3 = [(MessageListViewController *)self messageListPositionHelper];
  [v3 recalculateFirstVisibleIndex];
}

- (void)_loadMoreMessagesWithMaxVisibleIndexPath:(id)a3
{
  id v30 = a3;
  __int16 v29 = +[NSMutableArray array];
  __int16 v28 = [(MessageListViewController *)self resolvedMailboxObjectIDs];
  if ([v28 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = v28;
    id v4 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    if (!v4) {
      goto LABEL_23;
    }
    uint64_t v5 = *(void *)v33;
    while (1)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v33 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v6);
        id v8 = [(MessageListViewController *)self mailboxesPendingOldestItemsUpdates];
        unsigned int v9 = [v8 containsObject:v7];

        if (v9)
        {
          id v10 = +[MessageListViewController log];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v11 = (objc_class *)objc_opt_class();
            NSStringFromClass(v11);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v13 = [v7 ef_publicDescription];
            *(_DWORD *)buf = 138412802;
            id v37 = v12;
            __int16 v38 = 2048;
            id v39 = self;
            __int16 v40 = 2114;
            __int16 v41 = v13;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> Mailbox object id (%{public}@) is already pending oldest item update", buf, 0x20u);
          }
          goto LABEL_21;
        }
        uint64_t v14 = [(MessageListViewController *)self oldestItemsIDsByMailboxObjectID];
        id v10 = [v14 objectForKeyedSubscript:v7];

        if (!v10) {
          goto LABEL_15;
        }
        long long v15 = [(MessageListViewController *)self dataSource];
        long long v16 = [v15 indexPathForItemIdentifier:v10];

        if (!v16)
        {
          long long v17 = +[MessageListViewController log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            id v23 = (objc_class *)objc_opt_class();
            long long v24 = NSStringFromClass(v23);
            *(_DWORD *)buf = 138412546;
            id v37 = v24;
            __int16 v38 = 2048;
            id v39 = self;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "<%@: %p> cannot find the index of a tracked oldest item", buf, 0x16u);
          }
LABEL_15:
          long long v16 = +[NSIndexPath indexPathForRow:sub_100048FD8(self) inSection:0];
        }
        id v18 = [v30 row];
        if ((double)(uint64_t)[v16 row] * 0.75 < (double)(uint64_t)v18)
        {
          [v29 addObject:v7];
          id v19 = +[MessageListViewController log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = (objc_class *)objc_opt_class();
            NSStringFromClass(v20);
            id v21 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v22 = [v7 ef_publicDescription];
            *(_DWORD *)buf = 138412802;
            id v37 = v21;
            __int16 v38 = 2048;
            id v39 = self;
            __int16 v40 = 2114;
            __int16 v41 = v22;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%@: %p> Need to load older messages for mailbox %{public}@", buf, 0x20u);
          }
        }

LABEL_21:
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (!v4)
      {
LABEL_23:

        if ([v29 count])
        {
          long long v25 = [(MessageListViewController *)self mailboxesPendingOldestItemsUpdates];
          [v25 addObjectsFromArray:v29];

          id v26 = [(MessageListViewController *)self messageRepository];
          [v26 loadOlderMessagesForMailboxes:v29];
          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
  }
  id v26 = +[MessageListViewController log];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    long long v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    objc_claimAutoreleasedReturnValue();
    sub_10045B930();
  }
LABEL_27:

LABEL_28:
}

- (BOOL)_isExpandedIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MessageListViewController *)self dataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];
  LOBYTE(self) = [(MessageListViewController *)self _isExpandedItemID:v6];

  return (char)self;
}

- (BOOL)_isExpandedItemID:(id)a3
{
  id v4 = a3;
  if ([(MessageListViewController *)self isThreaded])
  {
    uint64_t v5 = [(MessageListViewController *)self dataSource];
    unsigned __int8 v6 = [v5 anyExpandedThreadContainsItemID:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_applySelectionModel:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = +[MessageListViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    unsigned int v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = self;
    __int16 v23 = 2114;
    long long v24 = v9;
    __int16 v25 = 2114;
    id v26 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> %{public}@ model: %{public}@", buf, 0x2Au);
  }
  if (v5)
  {
    [(MessageListViewController *)self setMessageListSelectionModel:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = [v5 itemIDs];
    id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        __int16 v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          [(MessageListViewController *)self _updateSelectionModelDidSelectItemID:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13)];
          __int16 v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void)_updateSelectionModelDidSelectItemID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MessageListViewController *)self dataSource];
    unsigned __int8 v6 = [(MessageListViewController *)self collectionView];
    uint64_t v22 = [(MessageListViewController *)self messageListSelectionModel];
    __int16 v21 = [v22 selectItemWithItemID:v4];
    id v7 = +[MessageListViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (objc_class *)objc_opt_class();
      unsigned int v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138413314;
      __int16 v29 = v9;
      __int16 v30 = 2048;
      __int16 v31 = self;
      __int16 v32 = 2114;
      id v33 = v4;
      __int16 v34 = 2048;
      id v35 = [v22 count];
      __int16 v36 = 2114;
      id v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@: %p> Select Item: %{public}@ (Total: %ld). Including: %{public}@", buf, 0x34u);
    }
    if ([v22 isMultipleSelectionActive])
    {
      id v10 = [v22 itemsToDeselectAfterMultipleSelection];
      [v10 removeObject:v4];

      id v11 = [v22 itemsToDeselectAfterMultipleSelection];
      [v11 ef_removeObjectsInArray:v21];
    }
    else
    {
      id v11 = [v5 indexPathForItemIdentifier:v4];
      [v6 selectItemAtIndexPath:v11 animated:0 scrollPosition:0];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v13 = v21;
      id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v24;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = [v5 indexPathForItemIdentifier:*(void *)(*((void *)&v23 + 1) + 8 * i)];
            [v6 selectItemAtIndexPath:v17 animated:0 scrollPosition:0];
          }
          id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v14);
      }
    }
    [(MessageListViewController *)self _updateTitle];
    [(MessageListViewController *)self updateBarButtons];
    [(MessageListViewController *)self _updateStackViewController];
    id v18 = [v22 cascadedItemIDsForItemID:v4 isSelecting:1];
    id v19 = [v18 arrayByAddingObject:v4];
    [(MessageListViewController *)self _addMessagesToStackWithItemIDs:v19];

    [(MessageListViewController *)self isEditing];
    id v20 = [(MessageListViewController *)self conversationViewController];
    [v20 _updateBarButtonsAnimated:1 force:1 isShowingTitle:0];
  }
  else
  {
    id v5 = +[MessageListViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      objc_claimAutoreleasedReturnValue();
      sub_10045B974();
    }
  }
}

- (void)_updateSelectionModelDidDeselectItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v6 = [(MessageListViewController *)self collectionView];
  id v7 = [(MessageListViewController *)self messageListSelectionModel];
  __int16 v28 = [v7 deselectItemWithItemID:v4];
  id v8 = +[MessageListViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138413314;
    id v35 = v10;
    __int16 v36 = 2048;
    id v37 = self;
    __int16 v38 = 2114;
    id v39 = v4;
    __int16 v40 = 2048;
    id v41 = [v7 count];
    __int16 v42 = 2114;
    __int16 v43 = v28;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> Deselect Item: %{public}@ (Total: %ld). Including: %{public}@", buf, 0x34u);
  }
  id v11 = [(MessageListViewController *)self messageListSelectionModel];
  unsigned int v12 = [v11 isSelectAll];

  if (v12)
  {
    id v13 = +[MessageListViewController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138412546;
      id v35 = v15;
      __int16 v36 = 2048;
      id v37 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "<%@: %p> Leaving Select All mode. All items have been deselected manually", buf, 0x16u);
    }
    long long v16 = [v7 itemIDs];
    id v17 = [v16 count];
    BOOL v18 = v17 == sub_100048FD8(self);

    if (v18) {
      [v7 disableSelectAll];
    }
  }
  if ([v7 isMultipleSelectionActive])
  {
    id v19 = [v7 itemsToDeselectAfterMultipleSelection];
    [v19 addObject:v4];

    id v20 = [v7 itemsToDeselectAfterMultipleSelection];
    [v20 addObjectsFromArray:v28];
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v28;
    id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v30;
      do
      {
        long long v23 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v20);
          }
          long long v24 = [v5 indexPathForItemIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * (void)v23)];
          [v6 deselectItemAtIndexPath:v24 animated:0];

          long long v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v21);
    }
  }

  [(MessageListViewController *)self _updateTitle];
  [(MessageListViewController *)self updateBarButtons];
  [(MessageListViewController *)self _updateStackViewController];
  long long v25 = [v7 cascadedItemIDsForItemID:v4 isSelecting:0];
  long long v26 = [v25 arrayByAddingObject:v4];
  [(MessageListViewController *)self _removeMessagesFromStackWithItemIDs:v26];

  [(MessageListViewController *)self _exitMultiSelectionForce:0];
  long long v27 = [(MessageListViewController *)self conversationViewController];
  [v27 _updateBarButtonsAnimated:1 force:1];
}

- (void)didSelectTopHitWithItemID:(id)a3 messageList:(id)a4 animated:(BOOL)a5
{
  id v15 = a3;
  id v8 = a4;
  BYTE1(v14) = 1;
  LOBYTE(v14) = a5;
  -[MessageListViewController _handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", v15, v8, 0, 0, 1, 1, v14);
  if (_os_feature_enabled_impl())
  {
    unsigned int v9 = +[UIApplication sharedApplication];
    id v10 = [v9 appStoreReviewManager];
    [v10 notifyCriterionMet:6];

    id v11 = [(MessageListViewController *)self scene];
    if (v11)
    {
      unsigned int v12 = +[UIApplication sharedApplication];
      id v13 = [v12 appStoreReviewManager];
      [v13 attemptToShowPromptIn:v11 reason:6];
    }
  }
}

- (void)selectItemID:(id)a3 userInitiated:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)_handleDidSelectItemID:(id)a3 referenceItem:(id)a4 scrollToVisible:(BOOL)a5 userInitiated:(BOOL)a6 animated:(BOOL)a7
{
  LOBYTE(v7) = 1;
  [(MessageListViewController *)self _handleDidSelectItemID:a3 referenceItem:a4 scrollToVisible:a5 userInitiated:a6 canRestoreDraft:1 animated:a7 showConversationView:v7];
}

- (void)_handleDidSelectItemID:(id)a3 referenceItem:(id)a4 scrollToVisible:(BOOL)a5 userInitiated:(BOOL)a6 canRestoreDraft:(BOOL)a7 animated:(BOOL)a8 showConversationView:(BOOL)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v19 = a3;
  id v15 = a4;
  long long v16 = [(MessageListViewController *)self dataSource];
  id v17 = [v16 messageListForMessageListItemWithIdentifier:v19];

  BYTE1(v18) = a9;
  LOBYTE(v18) = a8;
  -[MessageListViewController _handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:](self, "_handleDidSelectItemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:", v19, v17, v15, v12, v11, v10, v18);
}

- (void)_handleDidSelectItemID:(id)a3 messageList:(id)a4 referenceItem:(id)a5 scrollToVisible:(BOOL)a6 userInitiated:(BOOL)a7 canRestoreDraft:(BOOL)a8 animated:(BOOL)a9 showConversationView:(BOOL)a10
{
  BOOL v51 = a6;
  BOOL v52 = a7;
  id v14 = a3;
  id v55 = a4;
  id v53 = a5;
  id v15 = [(MessageListViewController *)self dataSource];
  long long v16 = [v15 indexPathForItemIdentifier:v14];

  id v17 = [(MessageListViewController *)self collectionView];
  id v54 = [v17 cellForItemAtIndexPath:v16];
  BOOL v50 = a8;

  uint64_t v18 = +[MessageListViewController log];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = [v55 ef_publicDescription];
    uint64_t v22 = [v53 ef_publicDescription];
    *(_DWORD *)buf = 138414338;
    uint64_t v58 = (uint64_t)v20;
    __int16 v59 = 2048;
    double v60 = self;
    __int16 v61 = 2114;
    id v62 = v14;
    __int16 v63 = 2114;
    *(void *)v64 = v21;
    *(_WORD *)&v64[8] = 2114;
    *(void *)&long long v65 = v22;
    WORD4(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 10) = v51;
    HIWORD(v65) = 1024;
    *(_DWORD *)v66 = v52;
    *(_WORD *)&v66[4] = 1024;
    BOOL v67 = a9;
    __int16 v68 = 1024;
    BOOL v69 = a10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> handleDidSelectItemID: %{public}@, messageList: %{public}@, referenceItem: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x4Cu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  id v23 = v54;
  long long v24 = [v23 messageListItemFuture];
  long long v25 = [v24 resultIfAvailable];
  BOOL v26 = v25 == 0;

  if (!v26)
  {
    long long v27 = [v23 cellHelper];
    __int16 v28 = [v27 messageListItem];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      long long v32 = +[MessageListViewController log];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        __int16 v46 = (objc_class *)objc_opt_class();
        __int16 v47 = NSStringFromClass(v46);
        *(_DWORD *)buf = 138413826;
        uint64_t v58 = (uint64_t)v47;
        __int16 v59 = 2048;
        double v60 = self;
        __int16 v61 = 2114;
        id v62 = v14;
        __int16 v63 = 1024;
        *(_DWORD *)v64 = v51;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v52;
        LOWORD(v65) = 1024;
        *(_DWORD *)((char *)&v65 + 2) = a9;
        WORD3(v65) = 1024;
        DWORD2(v65) = a10;
        _os_log_fault_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_FAULT, "<%@: %p> handleDidSelectItemID: Trying to select a message list cell that has no message list item. %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);
      }
      goto LABEL_25;
    }

LABEL_7:
    BOOL v30 = [(MessageListViewController *)self _shouldShowItemIDAsConversation:v14];
    if (v14)
    {
      long long v31 = [v55 messageListItemForItemID:v14];
      id v56 = 0;
      id v23 = [v31 resultWithTimeout:&v56 error:0.2];
      long long v32 = v56;
      if (v32)
      {
        id v33 = +[MessageListViewController log];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          __int16 v40 = (objc_class *)objc_opt_class();
          uint64_t v41 = NSStringFromClass(v40);
          *(_DWORD *)buf = 138414082;
          uint64_t v58 = v41;
          __int16 v59 = 2048;
          double v60 = self;
          __int16 v61 = 2114;
          id v62 = v14;
          __int16 v63 = 2114;
          *(void *)v64 = v32;
          *(_WORD *)&v64[8] = 1024;
          LODWORD(v65) = v51;
          WORD2(v65) = 1024;
          *(_DWORD *)((char *)&v65 + 6) = v52;
          WORD5(v65) = 1024;
          HIDWORD(v65) = a9;
          *(_WORD *)v66 = 1024;
          *(_DWORD *)&v66[2] = a10;
          __int16 v49 = (void *)v41;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "<%@: %p> handleDidSelectItemID: Error loading message with item ID: %{public}@, error: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x42u);
        }
      }
      if (v23)
      {

        BYTE2(v48) = a10;
        BYTE1(v48) = a9;
        LOBYTE(v48) = v50;
        -[MessageListViewController _handleSelectedItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_handleSelectedItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v23, v14, v55, v53, v51, v52, v48, v16);
        goto LABEL_26;
      }
      __int16 v38 = +[MessageListViewController log];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        id v44 = (objc_class *)objc_opt_class();
        __int16 v45 = NSStringFromClass(v44);
        *(_DWORD *)buf = 138413826;
        uint64_t v58 = (uint64_t)v45;
        __int16 v59 = 2048;
        double v60 = self;
        __int16 v61 = 2114;
        id v62 = v14;
        __int16 v63 = 1024;
        *(_DWORD *)v64 = v51;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v52;
        LOWORD(v65) = 1024;
        *(_DWORD *)((char *)&v65 + 2) = a9;
        WORD3(v65) = 1024;
        DWORD2(v65) = a10;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "<%@: %p> handleDidSelectItemID: Trying to select a message list cell that has no available item. Clearing conversation view. %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);
      }
      id v39 = [(MessageListViewController *)self conversationViewController];
      [v39 setReferenceMessageListItem:0 referenceMessageList:v55 showAsConversation:v30 animated:a9];

      BYTE1(v48) = v30;
      LOBYTE(v48) = a10;
      -[MessageListViewController _loadMessageWithItemID:messageList:messageListItem:scrollToVisible:userInitiated:animated:showConversationView:showAsConversation:](self, "_loadMessageWithItemID:messageList:messageListItem:scrollToVisible:userInitiated:animated:showConversationView:showAsConversation:", v14, v55, v31, v51, v52, a9, v48);

      id v23 = 0;
    }
    else
    {
      __int16 v34 = +[MessageListViewController log];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        __int16 v42 = (objc_class *)objc_opt_class();
        __int16 v43 = NSStringFromClass(v42);
        *(_DWORD *)buf = 138413826;
        uint64_t v58 = (uint64_t)v43;
        __int16 v59 = 2048;
        double v60 = self;
        __int16 v61 = 2114;
        id v62 = 0;
        __int16 v63 = 1024;
        *(_DWORD *)v64 = v51;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v52;
        LOWORD(v65) = 1024;
        *(_DWORD *)((char *)&v65 + 2) = a9;
        WORD3(v65) = 1024;
        DWORD2(v65) = a10;
        _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "<%@: %p> handleDidSelectItemID: Selected a message list cell with no item ID: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);
      }
      long long v32 = [(MessageListViewController *)self conversationViewController];
      id v23 = 0;
      [v32 setReferenceMessageListItem:0 referenceMessageList:v55 showAsConversation:v30 animated:a9];
    }
LABEL_25:

    goto LABEL_26;
  }
  id v35 = +[MessageListViewController log];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v36 = (objc_class *)objc_opt_class();
    id v37 = NSStringFromClass(v36);
    *(_DWORD *)buf = 138413826;
    uint64_t v58 = (uint64_t)v37;
    __int16 v59 = 2048;
    double v60 = self;
    __int16 v61 = 2114;
    id v62 = v14;
    __int16 v63 = 1024;
    *(_DWORD *)v64 = v51;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = v52;
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = a9;
    WORD3(v65) = 1024;
    DWORD2(v65) = a10;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "<%@: %p> handleDidSelectItemID: Message hasn't finished loading, updating selection promise %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showConversationView: %{BOOL}d", buf, 0x38u);
  }
  BYTE2(v48) = a10;
  BYTE1(v48) = a9;
  LOBYTE(v48) = v50;
  -[MessageListViewController _updateSelectionPromiseForItemID:messageList:messageListCell:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_updateSelectionPromiseForItemID:messageList:messageListCell:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v14, v55, v23, v53, v51, v52, v48, v16);
LABEL_26:
}

- (void)_handleSelectedItem:(id)a3 itemID:(id)a4 messageList:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12
{
  BOOL v12 = a8;
  BOOL v13 = a7;
  id v26 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a12;
  [(MessageListViewController *)self setLoadingMessageItemID:0];
  if (!v12) {
    [(MessageListViewController *)self setShouldSelectInitialMessage:0];
  }
  BYTE2(v25) = a11;
  LOWORD(v25) = __PAIR16__(a10, a9);
  -[MessageListViewController _showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v26, v18, v19, v20, v13, v12, v25, v21);
  if (([(MessageListViewController *)self isEditing] & 1) == 0)
  {
    id v22 = [v21 item];
    id v23 = [(MessageListViewController *)self previouslySelectedIndexPath];
    if ((uint64_t)v22 < (uint64_t)[v23 item]) {
      uint64_t v24 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v24 = 1;
    }
    [(MessageListViewController *)self setUserBrowseDirection:v24];

    [(MessageListViewController *)self setPreviouslySelectedIndexPath:v21];
  }
  if (v12) {
    [(MessageListViewController *)self _hideMailboxPickerOrMessageListAfterSelectionIfNeeded];
  }
}

- (void)_showConversationViewWithMessageListItem:(id)a3 itemID:(id)a4 messageList:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12
{
  BOOL v12 = a8;
  BOOL v30 = a7;
  id v17 = a3;
  id v18 = a4;
  id v35 = a5;
  id v36 = a6;
  id v34 = a12;
  unsigned int v19 = 0;
  long long v32 = v17;
  if (v18 && v17 && a9 && v12) {
    unsigned int v19 = [(MessageListViewController *)self _restoreDraftOrOutboxItemAtIndexPath:v34];
  }
  long long v31 = [(MessageListViewController *)self scene];
  unsigned int v33 = [v31 isInExpandedEnvironment];
  uint64_t v20 = [(MessageListViewController *)self _shouldShowItemIDAsConversation:v18];
  if ([(MessageListViewController *)self shouldDisplayGroupedSenders])
  {
    objc_opt_class();
    uint64_t v20 = v20 & ~objc_opt_isKindOfClass();
  }
  id v21 = +[MessageListViewController log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (objc_class *)objc_opt_class();
    id v23 = NSStringFromClass(v22);
    uint64_t v24 = [v36 ef_publicDescription];
    *(_DWORD *)buf = 138414850;
    __int16 v38 = v23;
    __int16 v39 = 2048;
    __int16 v40 = self;
    __int16 v41 = 2114;
    id v42 = v18;
    __int16 v43 = 1024;
    BOOL v44 = v30;
    __int16 v45 = 1024;
    BOOL v46 = v12;
    __int16 v47 = 1024;
    BOOL v48 = a10;
    __int16 v49 = 1024;
    int v50 = v20;
    __int16 v51 = 1024;
    unsigned int v52 = v33;
    __int16 v53 = 1024;
    unsigned int v54 = v19;
    __int16 v55 = 1024;
    BOOL v56 = a11;
    __int16 v57 = 2114;
    uint64_t v58 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "<%@: %p> handleSelectedItem: %{public}@, scrollToVisible: %{BOOL}d, userInitiated: %{BOOL}d, animated: %{BOOL}d, showAsConversation: %{BOOL}d, isInExpandedEnvironment: %{BOOL}d, restoreDraft: %{BOOL}d, showConversationView: %{BOOL}d referenceItem:%{public}@", buf, 0x54u);
  }
  if (((v36 == 0) & ~(v18 != 0)) != 0)
  {
    uint64_t v25 = [(MessageListViewController *)self conversationViewController];
    [v25 setReferenceMessageListItem:0 referenceMessageList:v35 showAsConversation:v20 animated:a10];
LABEL_18:

    goto LABEL_19;
  }
  if ((v19 ^ 1 | v33) == 1)
  {
    uint64_t v25 = [(MessageListViewController *)self conversationViewController];
    id v26 = [(MessageListViewController *)self searchController];
    [v25 setMessagesShowSourceMailbox:[v26 isActive]];

    long long v27 = v32;
    if (v36) {
      long long v27 = v36;
    }
    id v28 = v27;
    [v25 setReferenceMessageListItem:v28 referenceMessageList:v35 showAsConversation:v20 animated:a10];
    if (((!a11 | v33) & 1) == 0)
    {
      BOOL v29 = [v31 splitViewController];
      [v29 showConversationViewControllerAnimated:a10 completion:0];
    }
    [(MessageListViewController *)self selectRowOfItemID:v18 scrollToVisible:v30 animated:a10];

    goto LABEL_18;
  }
LABEL_19:
}

- (void)_updateSelectionPromiseForItemID:(id)a3 messageList:(id)a4 messageListCell:(id)a5 referenceItem:(id)a6 scrollToVisible:(BOOL)a7 userInitiated:(BOOL)a8 canRestoreDraft:(BOOL)a9 animated:(BOOL)a10 showConversationView:(BOOL)a11 indexPath:(id)a12
{
  id v32 = a3;
  id v33 = a4;
  id v18 = a5;
  id v34 = a6;
  id v35 = a12;
  unsigned int v19 = [(MessageListViewController *)self selectionPromise];

  if (v19)
  {
    uint64_t v20 = +[MessageListViewController log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      __int16 v50 = 2048;
      __int16 v51 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<%@: %p> New item selected, cancelling existing selection promise.", buf, 0x16u);
    }
    id v23 = [(MessageListViewController *)self selectionPromise];
    [v23 cancel];
  }
  id v36 = +[EFPromise promise];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  uint64_t v24 = [v36 future];
  uint64_t v25 = +[EFScheduler mainThreadScheduler];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100152C08;
  v37[3] = &unk_100609D78;
  objc_copyWeak(&v43, (id *)buf);
  id v26 = v36;
  id v38 = v26;
  id v30 = v32;
  id v39 = v30;
  id v31 = v33;
  id v40 = v31;
  id v27 = v34;
  id v41 = v27;
  BOOL v44 = a7;
  BOOL v45 = a8;
  BOOL v46 = a9;
  BOOL v47 = a10;
  BOOL v48 = a11;
  id v28 = v35;
  id v42 = v28;
  [v24 onScheduler:v25 addSuccessBlock:v37];

  [(MessageListViewController *)self setSelectionPromise:v26];
  BOOL v29 = [v18 messageListItemFuture];
  [v26 finishWithFuture:v29];

  objc_destroyWeak(&v43);
  objc_destroyWeak((id *)buf);
}

- (void)_loadMessageWithItemID:(id)a3 messageList:(id)a4 messageListItem:(id)a5 scrollToVisible:(BOOL)a6 userInitiated:(BOOL)a7 animated:(BOOL)a8 showConversationView:(BOOL)a9 showAsConversation:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  -[MessageListViewController setLoadingMessageItemID:](self, "setLoadingMessageItemID:", v16, v17, v16);
  id v18 = MFMessageSelectionLifecycleSignpostLog();
  unsigned int v19 = (void *)os_signpost_id_make_with_pointer(v18, v16);

  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, self);
  uint64_t v20 = +[EFScheduler mainThreadScheduler];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100152FA0;
  v32[3] = &unk_100609DA0;
  objc_copyWeak(v35, location);
  id v21 = v16;
  id v33 = v21;
  BOOL v36 = a6;
  BOOL v37 = a7;
  BOOL v38 = a8;
  BOOL v39 = a9;
  id v22 = v17;
  BOOL v40 = a10;
  id v34 = v22;
  v35[1] = v19;
  [v24 onScheduler:v20 addSuccessBlock:v32];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001532C8;
  v25[3] = &unk_100609DC8;
  objc_copyWeak(v27, location);
  id v23 = v21;
  BOOL v28 = a6;
  BOOL v29 = a7;
  BOOL v30 = a8;
  BOOL v31 = a9;
  id v26 = v23;
  v27[1] = v19;
  [v24 addFailureBlock:v25];

  objc_destroyWeak(v27);
  objc_destroyWeak(v35);
  objc_destroyWeak(location);
}

- (void)_hideMailboxPickerOrMessageListAfterSelectionIfNeeded
{
  id v3 = [(MessageListViewController *)self scene];
  if ([v3 isInExpandedEnvironment])
  {
    id v4 = [v3 splitViewController];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001535DC;
    v6[3] = &unk_100604E58;
    id v8 = [v4 displayMode];
    v6[4] = self;
    id v5 = v4;
    id v7 = v5;
    +[EFScheduler mf_afterUIDelay:v6 performBlock:0.25];
  }
}

- (void)deselectAllItemsInCollectionView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([(MessageListViewController *)self isEditing] & 1) == 0)
  {
    unsigned __int8 v6 = [(MessageListViewController *)self transitionCoordinator];
    [v7 mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:v6 animated:v4];
  }
}

- (BOOL)_allowsAutoSelectionOfInitialMessage
{
  if ([(MessageListViewController *)self isSearchViewController]) {
    return 0;
  }
  else {
    return ![(MessageListViewController *)self disableAutoSelectionOfInitialMessage];
  }
}

- (void)_selectInitialMessageNow
{
  [(MessageListViewController *)self setShouldSelectInitialMessage:[(MessageListViewController *)self _allowsAutoSelectionOfInitialMessage]];

  [(MessageListViewController *)self _selectAndDisplayInitialMessageIfNecessary];
}

- (BOOL)_selectAndDisplayInitialMessageIfNecessary
{
  if (![(MessageListViewController *)self shouldSelectInitialMessage]
    || !sub_100048FD8(self))
  {
    return 0;
  }
  BOOL v4 = [(MessageListViewController *)self lastSelectedItemID];
  id v5 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v6 = [v5 messageListForSection:MessageListSectionRecent];

  if (v4)
  {
    id v7 = [v6 messageListItemForItemID:v4];
    id v8 = [v7 result];

    unsigned int v9 = [v8 flags];
    unsigned int v10 = [v9 deleted];

    if (!v10)
    {

      goto LABEL_10;
    }
  }
  BOOL v11 = +[EMMessageListItemPredicates predicateForReadMessages];
  BOOL v4 = [v6 itemIDOfFirstMessageListItemMatchingPredicate:v11];

  if (!v4)
  {
    int v12 = 1;
    goto LABEL_11;
  }
LABEL_10:
  [(MessageListViewController *)self setShouldSelectInitialMessage:0];
  int v12 = 0;
  [(MessageListViewController *)self setDisableAutoSelectionOfInitialMessage:0];
LABEL_11:
  id v14 = [(MessageListViewController *)self lastAutoSelectedItemID];
  unsigned int v15 = [v4 isEqual:v14];

  if (((v12 | v15 ^ 1) & 1) != 0
    || ([(MessageListViewController *)self conversationViewController],
        id v16 = objc_claimAutoreleasedReturnValue(),
        [v16 referenceMessageListItem],
        id v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        v17))
  {
    [(MessageListViewController *)self setLastAutoSelectedItemID:v4];
    if (v4)
    {
      id v18 = +[MessageListViewController log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v21 = NSStringFromSelector(a2);
        id v22 = [(MessageListViewController *)self lastAutoSelectedItemID];
        int v27 = 138413314;
        id v28 = v20;
        __int16 v29 = 2048;
        BOOL v30 = self;
        __int16 v31 = 2112;
        id v32 = v21;
        __int16 v33 = 2112;
        id v34 = v4;
        __int16 v35 = 2112;
        BOOL v36 = v22;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - Select initial itemID:%@, lastAutoSelectedItemID:%@", (uint8_t *)&v27, 0x34u);
      }
      BOOL v13 = 1;
      [(MessageListViewController *)self _handleDidSelectItemID:v4 referenceItem:0 scrollToVisible:1 userInitiated:0 animated:0];
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    id v23 = +[MessageListViewController log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = (objc_class *)objc_opt_class();
      id v26 = NSStringFromClass(v25);
      int v27 = 138412802;
      id v28 = v26;
      __int16 v29 = 2048;
      BOOL v30 = self;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "<%@: %p> Autoselection cancelled for message %@", (uint8_t *)&v27, 0x20u);
    }
    BOOL v13 = 0;
    BOOL v4 = 0;
  }

  return v13;
}

- (void)setLastSelectedItemID:(id)a3
{
  p_lastSelectedItemID = &self->_lastSelectedItemID;
  id v5 = a3;
  if ((-[EMCollectionItemID isEqual:](*p_lastSelectedItemID, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_lastSelectedItemID, a3);
  }
}

- (BOOL)_shouldShowItemIDAsConversation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    LOBYTE(v5) = 1;
  }
  else if ([(MessageListViewController *)self isThreaded])
  {
    unsigned __int8 v6 = [(MessageListViewController *)self dataSource];
    unsigned int v5 = [v6 anyExpandedThreadContainsItemID:v4] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_draftOrOutboxMessageAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MessageListViewController *)self state];
  if ([v5 containsDraftsOrOutbox])
  {
  }
  else
  {
    unsigned __int8 v6 = [(MessageListViewController *)self isSearchViewController];

    if ((v6 & 1) == 0)
    {
      id v15 = 0;
      goto LABEL_14;
    }
  }
  id v7 = [(MessageListViewController *)self dataSource];
  id v8 = [v7 messageListItemAtIndexPath:v4];
  unsigned int v9 = [v8 resultWithTimeout:0 error:0.2];
  unsigned int v10 = [v9 displayMessage];
  BOOL v11 = [v10 resultWithTimeout:0 error:0.2];

  if (v11)
  {
    int v12 = [v11 mailboxes];
    unsigned int v13 = [v12 ef_any:&stru_100609DE8];

    if (v13) {
      id v14 = v11;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;
  }
  else
  {
    id v16 = +[MessageListViewController log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v18 = (objc_class *)objc_opt_class();
      unsigned int v19 = NSStringFromClass(v18);
      int v20 = 138412802;
      id v21 = v19;
      __int16 v22 = 2048;
      id v23 = self;
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "<%@: %p> Unable to restore message at index path: %{public}@", (uint8_t *)&v20, 0x20u);
    }
    id v15 = 0;
  }

LABEL_14:

  return v15;
}

- (void)_restoreDraftOrOutboxItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[UIApplication sharedApplication];
  unsigned __int8 v6 = [v5 mailboxProvider];
  id v7 = [v4 mailboxObjectIDs];
  id v8 = [v7 firstObject];
  unsigned int v9 = [v6 legacyMailboxForObjectID:v8];
  unsigned int v10 = +[MFComposeMailMessage legacyMessageWithMessage:v4 mailboxUid:v9];

  BOOL v11 = [(MessageListViewController *)self state];
  LODWORD(v6) = [v11 containsDraftsMailbox];

  if (v6) {
    id v12 = [objc_alloc((Class)_MFMailCompositionContext) initDraftRestoreOfMessage:v4 legacyMessage:v10];
  }
  else {
    id v12 = [objc_alloc((Class)_MFMailCompositionContext) initOutboxRestoreOfMessage:v4 legacyMessage:v10];
  }
  unsigned int v13 = v12;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v14 = [(MessageListViewController *)self scene];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v15[2] = sub_10015438C;
  v15[3] = &unk_100604FE8;
  objc_copyWeak(&v16, &location);
  [v14 showComposeWithContext:v13 animated:1 initialTitle:0 presentationSource:0 completionBlock:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BOOL)_restoreDraftOrOutboxItemAtIndexPath:(id)a3
{
  id v4 = [(MessageListViewController *)self _draftOrOutboxMessageAtIndexPath:a3];
  if (v4) {
    [(MessageListViewController *)self _restoreDraftOrOutboxItem:v4];
  }

  return v4 != 0;
}

- (id)messageDragDropHelper:(id)a3 itemContextForIndexPath:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v6 messageListAtSectionIndex:[v5 section]];
  id v8 = [v6 messageListItemAtIndexPath:v5];
  unsigned int v9 = [v8 result];

  if (([(MessageListViewController *)self shouldDisplayGroupedSenders] & 1) != 0
    || (objc_msgSend(v6, "sectionAtIndex:", objc_msgSend(v5, "section")),
        unsigned int v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v6 isMessagesSection:v10],
        v10,
        (v11 & 1) == 0))
  {
    id v12 = 0;
  }
  else
  {
    id v12 = +[MessageListItemDragContext withItem:v9 messageList:v7];
  }

  return v12;
}

- (id)dropMailboxesForMessageListDragDropHelper:(id)a3
{
  if ([(MessageListViewController *)self isSearchViewController])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(MessageListViewController *)self mailboxes];
  }

  return v4;
}

- (id)undoManagerForMessageListDragDropHelper:(id)a3
{
  id v3 = [(MessageListViewController *)self undoManager];

  return v3;
}

- (void)willBeginDragForMessageListDragDropHelper:(id)a3
{
  id v4 = [(MessageListViewController *)self scene];
  id v5 = [v4 splitViewController];
  unsigned __int8 v6 = [(MessageListViewController *)self parentViewController];
  [v5 setFocusedViewController:v6];

  [(MessageListViewController *)self setEditing:0 animated:1];

  [(MessageListViewController *)self _cancelOrCleanupStateRestoration];
}

- (double)dragItemCornerRadius:(id)a3
{
  id v3 = [(MessageListViewController *)self layoutValuesHelper];
  id v4 = [v3 defaultLayoutValues];
  [v4 backgroundCornerRadius];
  double v6 = v5;

  return v6;
}

- (void)beginSearchWithQueryString:(id)a3 scope:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(MessageListViewController *)self focusSearchBarAnimated:0];
  id v7 = [(MessageListViewController *)self messageListSearchViewController];
  [v7 beginSearchWithQueryString:v8 scope:v6];
}

- (void)beginSearchWithSuggestion:(id)a3 scope:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(MessageListViewController *)self focusSearchBarAnimated:1];
  id v7 = [(MessageListViewController *)self messageListSearchViewController];
  [v7 beginSearchWithSuggestion:v8 scope:v6];
}

- (BOOL)isSearching
{
  return 0;
}

- (id)inputLanguages
{
  id v3 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v4 = [(MessageListViewController *)self searchBar];
  double v5 = [v4 textInputMode];
  id v6 = [v5 primaryLanguage];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = +[NSLocale preferredLanguages];
  id v6 = [v7 firstObject];

  if (v6) {
    goto LABEL_4;
  }
  id v8 = +[NSBundle mainBundle];
  unsigned int v9 = [v8 preferredLocalizations];
  id v6 = [v9 firstObject];

  if (v6) {
LABEL_4:
  }
    [v3 addObject:v6];
  unsigned int v10 = +[UITextInputMode activeInputModes];
  unsigned __int8 v11 = [v10 ef_map:&stru_100609E28];
  [v3 addObjectsFromArray:v11];

  id v12 = [v3 array];

  return v12;
}

- (void)presentSearchController:(id)a3
{
  id v4 = a3;
  double v5 = [v4 delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 willPresentSearchController:v4];
  }
  id v6 = [(MessageListViewController *)self delegate];
  [v6 messageListViewControllerRequiresPaletteUpdate:self enableSearchPreparing:1];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100154DB8;
  v17[3] = &unk_100604668;
  v17[4] = self;
  id v7 = v5;
  id v18 = v7;
  id v8 = v4;
  id v19 = v8;
  [(MessageListViewController *)self presentViewController:v8 animated:1 completion:v17];
  if ([v8 modalPresentationStyle] == (id)7)
  {
    unsigned int v9 = [v8 popoverPresentationController];
    unsigned int v10 = [v8 searchBar];
    [v9 setSourceView:v10];

    unsigned __int8 v11 = [v8 searchBar];
    [v11 bounds];
    [v9 setSourceRect:];

    [v9 setPermittedArrowDirections:15];
    id v12 = [v8 searchBar];
    int v20 = v12;
    unsigned int v13 = +[NSArray arrayWithObjects:&v20 count:1];
    [v9 setPassthroughViews:v13];
  }
  id v14 = [(MessageListViewController *)self scene];
  id v15 = [v14 splitViewController];
  id v16 = [(MessageListViewController *)self parentViewController];
  [v15 setFocusedViewController:v16];
}

- (void)willPresentSearchController:(id)a3
{
  id v11 = a3;
  if ([(MessageListViewController *)self _inMultiSelectionMode]) {
    sub_100154F70(self, 0);
  }
  id v4 = [(MessageListViewController *)self mailboxes];
  double v5 = [(MessageListViewController *)self messageListSearchViewController];
  [v5 setMailboxes:v4];

  id v6 = [(MessageListViewController *)self messageListSearchViewController];
  [v6 willPresentSearchController:v11];

  id v7 = [(MessageListViewController *)self conversationViewController];
  id v8 = [v7 referenceMessageListItem];
  unsigned int v9 = [v8 itemID];

  if (v9)
  {
    unsigned int v10 = [(MessageListViewController *)self messageListSearchViewController];
    [v10 setLastSelectedItemID:v9];
  }
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  double v5 = [(MessageListViewController *)self conversationViewController];
  [v5 setDelegate:self];

  id v6 = [(MessageListViewController *)self messageListSearchViewController];
  [v6 willDismissSearchController:v4];

  id v7 = [(MessageListViewController *)self delegate];
  [v7 messageListViewControllerRequiresPaletteUpdate:self enableSearchPreparing:0];

  id v8 = [(MessageListViewController *)self searchBar];
  [v8 setRepresentedObjects:0];

  if (([(UIRefreshControl *)self->_refreshControl isHidden] & 1) == 0
    && ![(UIRefreshControl *)self->_refreshControl isRefreshing])
  {
    [(UIRefreshControl *)self->_refreshControl beginRefreshing];
    [(UIRefreshControl *)self->_refreshControl endRefreshing];
    unsigned int v9 = [(MessageListViewController *)self collectionView];
    [v9 setContentOffset:CGPointZero];

    unsigned int v10 = +[MessageListViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      objc_claimAutoreleasedReturnValue();
      sub_10045B9B8();
    }
  }
  id v12 = [(MessageListViewController *)self conversationViewController];
  uint64_t v13 = [v12 referenceMessageListItem];
  id v14 = [(id)v13 itemID];

  id v15 = [(MessageListViewController *)self lastSelectedItemID];
  LOBYTE(v13) = [v14 isEqual:v15];

  if ((v13 & 1) == 0)
  {
    [(MessageListViewController *)self deselectSelectedItemsInCollectionView];
    [(MessageListViewController *)self _updateSelectionModelDidSelectItemID:v14];
  }
  [(MessageListViewController *)self changeTipShouldDisplayTo:1];
}

- (void)didDismissSearchController:(id)a3
{
  id v6 = a3;
  id v4 = [(MessageListViewController *)self dataSource];
  [v4 removeMessageListSection:MessageListSectionIndexedSearch animated:0];

  double v5 = [(MessageListViewController *)self messageListSearchViewController];
  [v5 didDismissSearchController:v6];

  [(MessageListViewController *)self updateBarButtons];
}

- (void)_dismissSearchResults
{
  id v3 = [(MessageListViewController *)self searchController];
  v2 = [v3 searchBar];
  [v2 setRepresentedObjects:0];
  [v3 setActive:0];
  [v2 resignFirstResponder];
}

- (void)dismissSearchResultsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[UIView areAnimationsEnabled];
  +[UIView setAnimationsEnabled:v3];
  [(MessageListViewController *)self _dismissSearchResults];

  +[UIView setAnimationsEnabled:v5];
}

- (void)focusSearchBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MessageListViewController *)self searchBar];
  if (v5)
  {
    id v6 = [(MessageListViewController *)self collectionView];
    [v5 bounds];
    [v6 convertRect:v5 fromView:];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v6 mui_safeVisibleBounds];
    double x = v29.origin.x;
    double y = v29.origin.y;
    double width = v29.size.width;
    double height = v29.size.height;
    v30.origin.double x = v8;
    v30.origin.double y = v10;
    v30.size.double width = v12;
    v30.size.double height = v14;
    BOOL v19 = CGRectContainsRect(v29, v30);
    double v20 = 0.3;
    if (v19) {
      double v20 = 0.0;
    }
    if (v3) {
      double v21 = v20;
    }
    else {
      double v21 = 0.0;
    }
    if (!v19) {
      [v6 scrollRectToVisible:v3 x:x y:y width:width height:height];
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    __int16 v22 = +[EFScheduler mainThreadScheduler];
    UIAnimationDragCoefficient();
    double v24 = v21 * v23;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001557E4;
    v26[3] = &unk_100604FE8;
    objc_copyWeak(&v27, &location);
    id v25 = [v22 afterDelay:v26 performBlock:v24];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

- (void)suspendRefreshAnimationIfNecessary
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  v2 = +[EFScheduler mainThreadScheduler];
  [v2 performBlock:&v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (UIBarButtonItem)filterPickerButtonItem
{
  filterPickerButtonItem = self->_filterPickerButtonItem;
  if (!filterPickerButtonItem)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    BOOL v5 = [(MessageListViewController *)self filterPickerControl];
    id v6 = (UIBarButtonItem *)[v4 initWithCustomView:v5];
    double v7 = self->_filterPickerButtonItem;
    self->_filterPickerButtonItem = v6;

    [(UIBarButtonItem *)self->_filterPickerButtonItem _setFlexible:1];
    [(MessageListViewController *)self _updateFiltersPickerAccessibilityHUD];
    filterPickerButtonItem = self->_filterPickerButtonItem;
  }

  return filterPickerButtonItem;
}

- (void)_updateFiltersPickerAccessibilityHUD
{
  uint64_t v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"FILTERS_CHOOSE" value:&stru_100619928 table:@"Main"];
  id v7 = +[NSMutableString stringWithString:v4];

  BOOL v5 = [(MessageListViewController *)self filterPickerControl];
  id v6 = [v5 filterDescription];

  if ([v6 length])
  {
    [v7 appendString:@"\n"];
    [v7 appendString:v6];
  }
  if ([v7 length]) {
    [(UIBarButtonItem *)self->_filterPickerButtonItem setTitle:v7];
  }
}

- (id)_categoryGroupingPreferenceMenuForBucket:(int64_t)a3
{
  BOOL v5 = [(MessageListViewController *)self categoryGroupingPreferenceController];
  unsigned int v6 = [v5 shouldDisableGroupingForBucket:a3];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v7 = _EFLocalizedString();
  CGFloat v8 = +[UIImage systemImageNamed:MFImageGlyphCategoryGroupingPreference];
  double v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  double v13 = sub_100155E54;
  CGFloat v14 = &unk_100609E50;
  objc_copyWeak(v15, &location);
  char v16 = v6;
  v15[1] = (id)a3;
  double v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:0 handler:&v11];

  [v9 setState:v6 ^ 1 v11, v12, v13, v14];
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return v9;
}

- (void)_clearNavigationBarButtonItemMenu
{
}

- (void)_updateNavigationBarButtonsWithForce:(BOOL)a3
{
  if (![(MessageListViewController *)self _shouldProcessButtonUpdates]) {
    return;
  }
  id v5 = [(MessageListViewController *)self isEditing];
  if (EMBlackPearlIsFeatureEnabled())
  {
    if (v5) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 2;
    }
LABEL_6:
    id v7 = [(MessageListViewController *)self state];
    unsigned int v8 = [v7 containsInbox];

    if (v8) {
      uint64_t v9 = v6 | 8;
    }
    else {
      uint64_t v9 = v6;
    }
    goto LABEL_15;
  }
  if (_os_feature_enabled_impl())
  {
    int v10 = EMIsGreymatterAvailableWithOverride();
    uint64_t v6 = v5 ? 4 : 2;
    if (v10) {
      goto LABEL_6;
    }
  }
  uint64_t v9 = 1;
LABEL_15:
  if (sub_100045608(self)) {
    v9 |= 0x10uLL;
  }
  if ([(MessageListViewController *)self barButtonItemConfiguration] != v9 || a3)
  {
    [(MessageListViewController *)self setBarButtonItemConfiguration:v9];
    if ((v9 & 0x10) != 0)
    {
      uint64_t v12 = [(MessageListViewController *)self messageListSelectionModel];
      if ([v12 isSelectAll])
      {
        double v13 = [(MessageListViewController *)self messageListSelectionModel];
        if ([v13 isSelectAll])
        {
          CGFloat v14 = [(MessageListViewController *)self messageListSelectionModel];
          id v15 = [v14 itemIDs];
          BOOL v16 = [v15 count] == 0;
        }
        else
        {
          BOOL v16 = 1;
        }
      }
      else
      {
        BOOL v16 = 0;
      }

      id v17 = [(MessageListViewController *)self selectAllButtonItem];
      +[UIBarButtonItem mf_configureSelectionBarButtonItem:v17 usingStyle:v16];

      double v11 = [(MessageListViewController *)self selectAllButtonItem];
      id v18 = [(MessageListViewController *)self mf_navigationItem];
      [v18 setLeftBarButtonItem:v11];
    }
    else
    {
      double v11 = [(MessageListViewController *)self mf_navigationItem];
      [v11 setLeftBarButtonItem:0];
    }

    BOOL v19 = +[NSMutableArray array];
    if ((v9 & 8) != 0)
    {
      double v20 = [(MessageListViewController *)self configureButtonItem];
      [v19 addObject:v20];
    }
    if ((v9 & 6) != 0)
    {
      double v21 = [(MessageListViewController *)self selectMessageListViewButtonItem];
      [v19 addObject:v21];
    }
    if (v9)
    {
      __int16 v22 = [(MessageListViewController *)self currentEditButtonItem];
      if (v5) {
        uint64_t v23 = 2;
      }
      else {
        uint64_t v23 = 0;
      }
      +[UIBarButtonItem mf_configureMultiBarButtonItem:v22 usingStyle:v23];
      [v19 addObject:v22];
    }
    double v24 = [(MessageListViewController *)self mf_navigationItem];
    [v24 setRightBarButtonItems:v19];
  }
  id v25 = [(MessageListViewController *)self dataSource];
  BOOL v26 = (uint64_t)[v25 numberOfItemsInMessagesSections] > 0;

  id v27 = [(MessageListViewController *)self selectMessageListViewButtonItem];
  [v27 setEnabled:v26];

  id v28 = [(MessageListViewController *)self currentEditButtonItem];
  [v28 setEnabled:v26];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1001563DC;
  v37[3] = &unk_1006047A0;
  void v37[4] = self;
  +[UIView performWithoutAnimation:v37];
  CGRect v29 = [(MessageListViewController *)self mf_navigationItem];
  CGRect v30 = [v29 _bottomPalette];
  [v30 setUserInteractionEnabled:v5 ^ 1];

  if (v5) {
    double v31 = 0.5;
  }
  else {
    double v31 = 1.0;
  }
  id v32 = [(MessageListViewController *)self mf_navigationItem];
  __int16 v33 = [v32 _bottomPalette];
  id v34 = [v33 contentView];
  [v34 setAlpha:v31];

  if (EMBlackPearlIsFeatureEnabled()) {
    [(MessageListViewController *)self _bucketBarUserInteractionEnabled:v5 ^ 1];
  }
  __int16 v35 = [(MessageListViewController *)self scene];
  BOOL v36 = [v35 splitViewController];
  [v36 _setForceDisplayModeBarButtonHidden:v5];
}

- (void)supressNoContentViewAnimated:(BOOL)a3
{
}

- (BOOL)shouldShowNavigationBarSubtitle
{
  BOOL v3 = [(MessageListViewController *)self shouldUseCustomNavigationBarTitleView];
  if (v3)
  {
    id v4 = [(MessageListViewController *)self collectionView];
    [v4 contentOffset];
    double v6 = v5;

    [(MessageListViewController *)self bucketsViewControllerHeight];
    LOBYTE(v3) = v6 + v7 - kMUIMessageListBucketBarBottomPadding > 0.0;
  }
  return v3;
}

- (void)_filterCommand:(id)a3
{
  id v4 = a3;
  if (([(MessageListViewController *)self isEditing] & 1) == 0) {
    [(MessageListViewController *)self filterButtonPressed:v4];
  }
}

- (BOOL)isFilterButtonAvailable
{
  v2 = [(MessageListViewController *)self filterViewModel];
  unsigned __int8 v3 = [v2 isFilterAvailable];

  return v3;
}

- (void)setFiltersEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v5 setFiltersEnabled:a3];
  [(MessageListViewController *)self updateBarButtons];
  id v4 = +[MailTipsHelper shared];
  [v4 filterByUnreadUsed];
}

- (void)filterPickerButtonPressed
{
  unsigned __int8 v3 = [MFMailboxFilterPickerViewModel alloc];
  id v4 = [(MessageListViewController *)self filterViewModel];
  int v10 = [(MFMailboxFilterPickerViewModel *)v3 initWithFilterViewModel:v4 delegate:self];

  objc_super v5 = [[MFMailboxFilterPickerViewController alloc] initWithViewModel:v10 delegate:self];
  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v5];
  [v6 setModalPresentationStyle:7];
  double v7 = [v6 popoverPresentationController];
  [v7 setDelegate:self];
  unsigned int v8 = [(MessageListViewController *)self filterPickerButtonItem];
  [v7 setBarButtonItem:v8];

  uint64_t v9 = [v6 popoverPresentationController];
  [v9 setDelegate:self];

  [(MessageListViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)applyFilterPredicate:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v7 applyFilterPredicate:v4];
  objc_super v5 = [(MessageListViewController *)self mailboxes];
  id v6 = sub_10004BC9C(self, v4);
  sub_10004E8BC(self, v5, v6);
}

- (void)_testing_enableMessageListFilter
{
  unsigned __int8 v3 = [(MessageListViewController *)self filterButtonItem];
  [(MessageListViewController *)self filterButtonPressed:v3];

  id v4 = [(MessageListViewController *)self messageListItems];
  id v5 = [v4 count];

  id v6 = +[MessageListViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = (objc_class *)objc_opt_class();
    unsigned int v8 = NSStringFromClass(v7);
    int v9 = 138412802;
    int v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    __int16 v13 = 2048;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Enabling mailbox filter: preChangeCount=%lu", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_testing_disableMessageListFilter
{
  unsigned __int8 v3 = [(MessageListViewController *)self filterButtonItem];
  [(MessageListViewController *)self filterButtonPressed:v3];

  id v4 = [(MessageListViewController *)self messageListItems];
  id v5 = [v4 count];

  id v6 = +[MessageListViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = (objc_class *)objc_opt_class();
    unsigned int v8 = NSStringFromClass(v7);
    int v9 = 138412802;
    int v10 = v8;
    __int16 v11 = 2048;
    uint64_t v12 = self;
    __int16 v13 = 2048;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Disable mailbox filter: preChangeCount=%lu", (uint8_t *)&v9, 0x20u);
  }
}

- (UIBarButtonItem)shelfButtonItem
{
  shelfButtonItem = self->_shelfButtonItem;
  if (!shelfButtonItem)
  {
    id v4 = +[UIImage systemImageNamed:MFImageGlyphShelf];
    id v5 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:v4 style:0 target:self action:"_shelfButtonTapped:"];
    id v6 = self->_shelfButtonItem;
    self->_shelfButtonItem = v5;

    shelfButtonItem = self->_shelfButtonItem;
  }

  return shelfButtonItem;
}

- (void)_shelfButtonTapped:(id)a3
{
  id v4 = [(MessageListViewController *)self scene];
  unsigned __int8 v3 = [v4 _sceneIdentifier];
  +[MFBayAdoption requestShelfPresentationForSceneWithIdentifier:v3];
}

- (void)deselectSelectedItemsInCollectionView
{
  v3.receiver = self;
  v3.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v3 deselectSelectedItemsInCollectionView];
  [(MessageListViewController *)self _exitMultiSelectionForce:1];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_editButtonTapped:(id)a3
{
  [(MessageListViewController *)self setEditing:[(MessageListViewController *)self isEditing] ^ 1 animated:1];
  if (![(MessageListViewController *)self isSearchViewController])
  {
    uint64_t v4 = [(MessageListViewController *)self isEditing] ^ 1;
    [(MessageListViewController *)self changeTipShouldDisplayTo:v4];
  }
}

- (void)enterEditMode
{
  if (([(MessageListViewController *)self isEditing] & 1) == 0)
  {
    [(MessageListViewController *)self _editButtonTapped:0];
  }
}

- (void)exitEditMode
{
  if ([(MessageListViewController *)self isEditing])
  {
    [(MessageListViewController *)self _editButtonTapped:0];
  }
}

- (id)_currentBulkSelectionWithDebugLabel:(id)a3
{
  uint64_t v4 = @"unknown operation";
  if (a3) {
    uint64_t v4 = (__CFString *)a3;
  }
  id v5 = v4;
  id v6 = [(MessageListViewController *)self messageListSelectionModel];
  objc_super v7 = [v6 currentMessageListItemSelection];
  if (!v7)
  {
    unsigned int v8 = +[MessageListViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      uint64_t v12 = [v6 ef_publicDescription];
      int v13 = 138413058;
      id v14 = v11;
      __int16 v15 = 2048;
      BOOL v16 = self;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2114;
      double v20 = v12;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "<%@: %p> Bulk message selection for %@ is nil: %{public}@", (uint8_t *)&v13, 0x2Au);
    }
  }

  return v7;
}

- (UIBarButtonItem)configureButtonItem
{
  configureButtonItem = self->_configureButtonItem;
  if (!configureButtonItem)
  {
    uint64_t v4 = +[UIColor systemBlueColor];
    id v5 = [(MessageListViewController *)self _menuForConfigureButtonItem];
    id v6 = +[UIBarButtonItem mui_capsuleButtonItemWithTitle:0 titleColor:v4 imageName:MFImageGlyphMoreActions menu:v5];
    objc_super v7 = self->_configureButtonItem;
    self->_configureButtonItem = v6;

    configureButtonItem = self->_configureButtonItem;
  }

  return configureButtonItem;
}

- (id)_configureSelectButtonWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = +[UIButtonConfiguration filledButtonConfiguration];
  [v5 setCornerStyle:4];
  [v5 setTitle:v4];
  [v5 setTitleTextAttributesTransformer:&stru_10060A110];
  id v6 = +[UIColor systemBlueColor];
  [v5 setBaseForegroundColor:v6];

  [v5 setContentInsets:5.0, 12.0, 5.0, 12.0];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  __int16 v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  int v13 = sub_100157F9C;
  id v14 = &unk_1006070F8;
  objc_copyWeak(&v15, &location);
  objc_super v7 = +[UIAction actionWithHandler:&v11];
  unsigned int v8 = +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v5, v7, v11, v12, v13, v14);

  int v9 = +[UIColor quaternarySystemFillColor];
  [v8 setTintColor:v9];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v8;
}

- (id)_menuForConfigureButtonItem
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10015819C;
  v6[3] = &unk_10060A160;
  v6[4] = self;
  v2 = +[UIDeferredMenuElement elementWithUncachedProvider:v6];
  objc_super v7 = v2;
  objc_super v3 = +[NSArray arrayWithObjects:&v7 count:1];
  id v4 = +[UIMenu menuWithTitle:&stru_100619928 image:0 identifier:0 options:1 children:v3];

  return v4;
}

- (UIBarButtonItem)selectAllButtonItem
{
  BOOL v3 = sub_100158A00(self);
  if ((EMBlackPearlIsFeatureEnabled() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    id v4 = _EFLocalizedString();
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    int v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_100158AE8;
    BOOL v16 = &unk_1006070F8;
    objc_copyWeak(&v17, &location);
    id v5 = +[UIAction actionWithHandler:&v13];
    id v6 = +[UIColor systemBlueColor];
    objc_super v7 = +[UIBarButtonItem mui_capsuleButtonItemWithTitle:v4 titleColor:v6 imageName:0 action:v5];
    selectAllButtonItem = self->_selectAllButtonItem;
    self->_selectAllButtonItem = v7;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    int v9 = +[UIBarButtonItem mf_newSelectionBarButtonItemWithTarget:self action:"_selectAllButtonPressed:"];
    +[UIBarButtonItem mf_configureSelectionBarButtonItem:v9 usingStyle:!v3];
    int v10 = self->_selectAllButtonItem;
    self->_selectAllButtonItem = v9;
  }
  __int16 v11 = self->_selectAllButtonItem;

  return v11;
}

- (void)_deleteMessageCommandInvoked:(id)a3
{
  if ([(MessageListViewController *)self isEditing])
  {
    [(MessageListViewController *)self _deleteMessagesWithPreference:1];
  }
  else
  {
    [(MessageListViewController *)self _deleteOrArchiveConversationReferenceItemWithPreference:1];
  }
}

- (id)_messageListItemSelectionCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MessageListViewController *)self messageListSelectionModel];
  id v6 = [v5 currentMessageListItemSelection];

  if (!v6 && v3)
  {
    id v7 = objc_alloc((Class)MSMessageListItemSelection);
    unsigned int v8 = [(MessageListViewController *)self conversationViewController];
    int v9 = [v8 referenceMessageListItem];
    uint64_t v12 = v9;
    int v10 = +[NSArray arrayWithObjects:&v12 count:1];
    id v6 = [v7 initWithMessageListItems:v10];
  }

  return v6;
}

- (void)_archiveShortcutInvoked:(id)a3
{
  if ([(MessageListViewController *)self isEditing])
  {
    [(MessageListViewController *)self _deleteMessagesWithPreference:2];
  }
  else
  {
    [(MessageListViewController *)self _deleteOrArchiveConversationReferenceItemWithPreference:2];
  }
}

- (void)_deleteOrArchiveConversationReferenceItemWithPreference:(unint64_t)a3
{
  id v5 = [(MessageListViewController *)self lastSelectedItemID];

  if (v5)
  {
    id v6 = [(MessageListViewController *)self _messageListItemSelectionCreateIfNeeded:1];
    id v7 = [(MessageListViewController *)self undoManager];
    unsigned int v8 = +[MFDestructiveTriageInteractionFactory interactionWithMessageListItemSelection:v6 undoManager:v7 origin:2 actor:2 deleteOrArchive:a3];

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100158ECC;
    v10[3] = &unk_100605140;
    v10[4] = self;
    id v11 = v8;
    id v9 = v8;
    [v9 performInteractionWithCompletion:v10];
  }
}

- (void)deleteMessagesWithItemIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListViewController *)self dataSource];
  id v6 = [v5 messageListItemsForItemIDs:v4];
  id v7 = +[EFFuture combine:v6];
  unsigned int v8 = [v7 result];
  [v8 ef_filter:EFIsNotNull];

  if ([v9 count])
  {
    int v10 = [(MessageListViewController *)self undoManager];
    id v11 = +[MFDestructiveTriageInteractionFactory interactionWithMessageListItems:v9 undoManager:v10 origin:2 actor:2 deleteOrArchive:1];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001591C4;
    v13[3] = &unk_100605140;
    void v13[4] = self;
    id v14 = v11;
    id v12 = v11;
    [v12 performInteractionWithCompletion:v13];
  }
}

- (void)_bulkDeleteButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User Tap on Delete button", v6, 2u);
  }

  [(MessageListViewController *)self deleteAction:v4 showChoices:0];
}

- (void)_bulkDeleteButtonLongPressed:(id)a3
{
  id v4 = a3;
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User Tap on Delete (with long press) button", v6, 2u);
  }

  [(MessageListViewController *)self deleteAction:v4 showChoices:1];
}

- (void)deleteAction:(id)a3 showChoices:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MessageListViewController *)self messageListSelectionModel];
  unsigned int v7 = [v6 isSelectAll];

  unsigned int v8 = +[NSUserDefaults em_userDefaults];
  unsigned int v9 = [v8 BOOLForKey:ShowMessageDeleteConfirmationKey];

  if ((v9 | v4 | v7) == 1)
  {
    if (v7)
    {
      int v10 = [(MessageListViewController *)self mailboxes];
      unsigned int v11 = +[EMMailbox deleteMovesToTrashForMailboxes:v10];

      id v12 = [(MessageListViewController *)self mailboxes];
      LODWORD(v13) = +[EMMailbox supportsArchivingForMailboxes:v12];

      id v14 = [(MessageListViewController *)self mailboxes];
      id v15 = +[EMMailbox shouldArchiveByDefaultForMailboxes:v14];
    }
    else
    {
      __int16 v19 = [(MessageListViewController *)self messageListSelectionModel];
      unint64_t v20 = (unint64_t)[v19 deleteSelectionState];

      unsigned int v11 = v20 & 1;
      uint64_t v13 = (v20 >> 2) & 1;
      id v15 = (id)((v20 >> 1) & 1);
    }
    double v21 = [(MessageListViewController *)self messageListSelectionModel];
    uint64_t v22 = (uint64_t)[v21 count];

    if (v11)
    {
      if (v7)
      {
        uint64_t v23 = +[NSBundle mainBundle];
        uint64_t v24 = [v23 localizedStringForKey:@"TRASH_ALL_ALERT_TITLE" value:&stru_100619928 table:@"Main"];

        id v25 = +[NSBundle mainBundle];
        __int16 v61 = [v25 localizedStringForKey:@"TRASH_ALL_ALERT_MESSAGE" value:&stru_100619928 table:@"Main"];
      }
      else
      {
        __int16 v61 = 0;
        uint64_t v24 = 0;
      }
      id v28 = +[NSBundle mainBundle];
      CGRect v29 = v28;
      CFStringRef v30 = @"TRASH_EMAIL";
      if (v22 > 1) {
        CFStringRef v30 = @"TRASH_SELECTED_EMAILS";
      }
      if (v7) {
        CFStringRef v31 = @"TRASH_ALL_CONFIRMATION";
      }
      else {
        CFStringRef v31 = v30;
      }
    }
    else
    {
      if (v7)
      {
        BOOL v26 = +[NSBundle mainBundle];
        uint64_t v24 = [v26 localizedStringForKey:@"DELETE_ALL_ALERT_TITLE" value:&stru_100619928 table:@"Main"];

        id v27 = +[NSBundle mainBundle];
        __int16 v61 = [v27 localizedStringForKey:@"DELETE_ALL_ALERT_MESSAGE" value:&stru_100619928 table:@"Main"];
      }
      else
      {
        __int16 v61 = 0;
        uint64_t v24 = 0;
      }
      id v28 = +[NSBundle mainBundle];
      CGRect v29 = v28;
      CFStringRef v32 = @"TRASH_EMAIL";
      if (v22 > 1) {
        CFStringRef v32 = @"TRASH_SELECTED_EMAILS";
      }
      if (v7) {
        CFStringRef v31 = @"DELETE_ALL_CONFIRMATION";
      }
      else {
        CFStringRef v31 = v32;
      }
    }
    double v60 = [v28 localizedStringForKey:v31 value:&stru_100619928 table:@"Main"];

    __int16 v33 = +[NSBundle mainBundle];
    id v34 = v33;
    CFStringRef v35 = @"ARCHIVE_EMAIL";
    if (v22 > 1) {
      CFStringRef v35 = @"ARCHIVE_SELECTED_EMAILS";
    }
    if (v7) {
      CFStringRef v36 = @"ARCHIVE_ALL_CONFIRMATION";
    }
    else {
      CFStringRef v36 = v35;
    }
    __int16 v59 = [v33 localizedStringForKey:v36 value:&stru_100619928 table:@"Main"];

    uint64_t v58 = (void *)v24;
    BOOL v37 = +[NSBundle mainBundle];
    __int16 v57 = [v37 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];

    id v38 = objc_alloc((Class)NSMutableArray);
    BOOL v39 = +[NSUserDefaults em_userDefaults];
    BOOL v40 = [v39 objectForKey:@"EMUserDefaultLogMassDeletion"];
    id v41 = [v38 initWithArray:v40];

    id v42 = objc_alloc_init((Class)NSMutableDictionary);
    if ((unint64_t)objc_msgSend(v41, "count", v42) >= 0x1F) {
      [v41 removeObjectsInRange:0, 2];
    }
    id v43 = +[UIAlertController alertControllerWithTitle:v24 message:v61 preferredStyle:1];
    [v43 setModalPresentationStyle:7];
    int v44 = v4 & v13;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_100159E88;
    v72[3] = &unk_10060A1F0;
    char v76 = v7;
    id v45 = v42;
    id v73 = v45;
    id v46 = v41;
    id v74 = v46;
    v75 = self;
    BOOL v47 = objc_retainBlock(v72);
    if ((v44 | v15 ^ 1) == 1)
    {
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10015A058;
      v68[3] = &unk_10060A218;
      char v71 = v7;
      id v69 = v45;
      BOOL v70 = v47;
      BOOL v48 = +[UIAlertAction actionWithTitle:v60 style:2 handler:v68];
      [v43 addAction:v48];
    }
    if (v15)
    {
      if (v7)
      {
        id v15 = +[NSBundle mainBundle];
        __int16 v49 = [v15 localizedStringForKey:@"ARCHIVE_ALL_ALERT_TITLE" value:&stru_100619928 table:@"Main"];
      }
      else
      {
        __int16 v49 = 0;
      }
      [v43 setTitle:v49];
      if (v7)
      {

        id v15 = +[NSBundle mainBundle];
        __int16 v50 = [v15 localizedStringForKey:@"ARCHIVE_ALL_ALERT_MESSAGE" value:&stru_100619928 table:@"Main"];
      }
      else
      {
        __int16 v50 = 0;
      }
      [v43 setMessage:v50];
      if (v7)
      {
      }
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_10015A160;
      v65[3] = &unk_1006084D8;
      id v66 = v45;
      BOOL v67 = v47;
      __int16 v51 = +[UIAlertAction actionWithTitle:v59 style:0 handler:v65];
      [v43 addAction:v51];
    }
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_10015A1DC;
    v62[3] = &unk_100608528;
    id v52 = v45;
    id v63 = v52;
    id v53 = v46;
    id v64 = v53;
    unsigned int v54 = +[UIAlertAction actionWithTitle:v57 style:1 handler:v62];
    [v43 addAction:v54];

    __int16 v55 = [v43 popoverPresentationController];
    [v55 setDelegate:self];
    [v55 setPermittedArrowDirections:3];
    BOOL v56 = [(MessageListViewController *)self deleteButtonItem];
    [v55 setBarButtonItem:v56];

    [(MessageListViewController *)self presentViewController:v43 animated:1 completion:0];
  }
  else
  {
    BOOL v16 = [(MessageListViewController *)self messageListSelectionModel];
    unsigned __int8 v17 = [v16 deleteSelectionState];

    if ((v17 & 2) != 0) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    [(MessageListViewController *)self _deleteMessagesWithPreference:v18];
  }
}

- (void)_deleteMessagesWithPreference:(unint64_t)a3
{
  id v6 = [(MessageListViewController *)self messageListSelectionModel];

  if (!v6)
  {
    uint64_t v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"MessageListViewController.m", 4028, @"Invalid parameter not satisfying: %@", @"self.messageListSelectionModel != nil" object file lineNumber description];
  }
  if ([(MessageListViewController *)self isEditing])
  {
    unsigned int v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned int v8 = [(MessageListViewController *)self messageListSelectionModel];
      [v8 type];
      NSStringFromMessageListSelectionType();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      int v10 = [(MessageListViewController *)self messageListSelectionModel];
      *(_DWORD *)buf = 138412546;
      id v27 = v9;
      __int16 v28 = 2048;
      id v29 = [v10 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Delete/Archive messages with type: %@ (count: %ld)", buf, 0x16u);
    }
    unsigned int v11 = [(MessageListViewController *)self _currentBulkSelectionWithDebugLabel:@"delete"];
    if (v11)
    {
      id v12 = [(MessageListViewController *)self undoManager];
      uint64_t v13 = +[MFDestructiveTriageInteractionFactory interactionWithMessageListItemSelection:v11 undoManager:v12 origin:2 actor:2 deleteOrArchive:a3];

      id v14 = [v11 messageListItems];
      if ([v11 isSelectAll])
      {
        id v15 = +[MessageListViewController log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The user has clicked SelectAll option to delete the messages", buf, 2u);
        }

        [v13 setDelegate:self];
      }
      else
      {
        BOOL v16 = [v11 messageListItems];
        id v17 = [v16 count];

        if (v17)
        {
          uint64_t v18 = [(MessageListViewController *)self messageSelectionStrategy];
          __int16 v19 = [v14 firstObject];
          unint64_t v20 = [v19 itemID];
          id v25 = v20;
          double v21 = +[NSArray arrayWithObjects:&v25 count:1];
          uint64_t v22 = [v18 itemIDToSelectAfterDeletedMessageItemIDs:v21];
          [(MessageListViewController *)self setItemIDToSelectAfterMoveID:v22];
        }
      }
      [v13 performInteraction];
      uint64_t v23 = [(MessageListViewController *)self scene];
      -[MessageListViewController setEditing:animated:](self, "setEditing:animated:", 0, [v23 isInExpandedEnvironment]);
    }
  }
}

- (void)_bulkTransferButtonPressed:(id)a3
{
  if ([(MessageListViewController *)self isEditing])
  {
    id v4 = [(MessageListViewController *)self moveButtonItem];
    sub_10015A740(self, v4);
  }
}

- (void)_showTransferPickerForNonPredictiveMoveOfMessages:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(MessageListViewController *)self messageListSelectionModel];
    unsigned int v6 = [v5 isSelectAll:v5];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10015AF5C;
    v22[3] = &unk_10060A240;
    char v25 = v6;
    v22[4] = self;
    id v7 = v4;
    id v23 = v7;
    id v8 = v5;
    id v24 = v8;
    id v9 = objc_retainBlock(v22);
    int v10 = [(MessageListViewController *)self transferStackViewController];
    uint64_t v18 = [v10 navigationController];

    if (v6) {
      uint64_t v11 = 258;
    }
    else {
      uint64_t v11 = 2;
    }
    id v12 = [(MessageListViewController *)self _transferControllerWithMessages:v7 options:v11 interaction:0 didDismissHandler:0];
    uint64_t v13 = [v12 transferNavigationController];
    [v13 setDidFinish:v9];
    [(MessageListViewController *)self setTransferController:v12];
    id v14 = [(MessageListViewController *)self scene];
    id v15 = [v14 mf_rootViewController];
    BOOL v16 = [(MessageListViewController *)self transferController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10015B3C8;
    v19[3] = &unk_100604618;
    id v17 = v18;
    id v20 = v17;
    double v21 = self;
    [v15 presentViewController:v16 animated:1 completion:v19];
  }
}

- (id)_previewMessagesForSelectAllMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MessageListViewController *)self messageListSelectionModel];
  if ([v5 isSelectAll])
  {
    unsigned int v6 = [(MessageListViewController *)self collectionView];
    id v7 = [(MessageListViewController *)self dataSource];
    id v8 = v7;
    if (v3)
    {
      uint64_t v9 = (uint64_t)[v7 numberOfItems];
      int v10 = [v8 itemIdentifiers];
      uint64_t v11 = v10;
      if (v9 >= 5) {
        uint64_t v12 = 5;
      }
      else {
        uint64_t v12 = v9;
      }
      uint64_t v13 = [v10 subarrayWithRange:0, v12];
    }
    else
    {
      id v14 = [v6 indexPathsForSelectedItems];
      uint64_t v15 = (uint64_t)[v14 count];

      BOOL v16 = [v6 indexPathsForSelectedItems];
      id v17 = v16;
      if (v15 >= 5) {
        uint64_t v18 = 5;
      }
      else {
        uint64_t v18 = v15;
      }
      __int16 v19 = [v16 subarrayWithRange:0, v18];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10015B610;
      v21[3] = &unk_100609A68;
      id v22 = v8;
      uint64_t v13 = [v19 ef_map:v21];
    }
  }
  else
  {
    uint64_t v13 = [v5 itemIDs];
  }

  return v13;
}

- (id)_transferControllerWithMessages:(id)a3 options:(unint64_t)a4 interaction:(id)a5 didDismissHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(MessageListViewController *)self scene];
  uint64_t v15 = [[MFTransferSplitViewController alloc] initWithItems:v11 scene:v14 options:a4 didDismissHandler:v13];
  BOOL v16 = [(MessageListViewController *)self transferStackViewController];
  [(MFTransferSplitViewController *)v15 setStackViewController:v16];
  if ([(MessageListViewController *)self _inMultiSelectionMode])
  {
    [(MFTransferSplitViewController *)v15 setModalPresentationStyle:0];
    -[MFTransferSplitViewController setUsePushFromLeftPresentation:](v15, "setUsePushFromLeftPresentation:", [v14 isInExpandedEnvironment]);
  }
  else
  {
    [(MFTransferSplitViewController *)v15 setModalPresentationStyle:7];
    id v17 = [v12 presentationSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = [(MFTransferSplitViewController *)v15 popoverPresentationController];
      [v18 setBarButtonItem:v17];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        __int16 v19 = [(MFTransferSplitViewController *)v15 popoverPresentationController];
        [v18 mui_setAsSourceWithExtendedRectForPopoverPresentationController:v19];
      }
      else
      {
        id v18 = +[NSAssertionHandler currentHandler];
        [v18 handleFailureInMethod:a2, self, @"MessageListViewController.m", 4175, @"presentation source %@ needs to be a UIBarButtonItem or UIView.", v17 object file lineNumber description];
      }
    }
  }

  return v15;
}

- (void)_addMessagesToStackWithItemIDs:(id)a3
{
  id v5 = a3;
  id v4 = [(MessageListViewController *)self transferStackViewController];
  [v4 addStackedItemsWithItemIDs:v5];
}

- (void)_removeMessagesFromStackWithItemIDs:(id)a3
{
  id v5 = a3;
  id v4 = [(MessageListViewController *)self transferStackViewController];
  [v4 removeStackedItemsWithItemIDs:v5];
}

- (id)_bulkMarkMenuForCurrentSelection
{
  BOOL v3 = [(MessageListViewController *)self _currentBulkSelectionWithDebugLabel:@"mark"];
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 isSelectAll];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10015BEE8;
    v28[3] = &unk_10060A268;
    void v28[4] = self;
    id v7 = objc_retainBlock(v28);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10015BEF8;
    v23[3] = &unk_10060A290;
    id v8 = v4;
    id v24 = v8;
    char v25 = self;
    uint64_t v9 = v7;
    id v26 = v9;
    char v27 = v5;
    int v10 = objc_retainBlock(v23);
    id v11 = [v8 messageListItems];
    LOBYTE(v8) = [v11 ef_any:&stru_10060A2B0];

    id v12 = ((void (*)(void *, uint64_t))v10[2])(v10, 2);
    [v6 ef_addOptionalObject:v12];

    id v13 = ((void (*)(void *, uint64_t))v10[2])(v10, 15);
    [v6 ef_addOptionalObject:v13];

    if ((v8 & 1) == 0)
    {
      id v14 = ((void (*)(void *, uint64_t))v10[2])(v10, 6);
      [v6 ef_insertOptionalObject:v14 atIndex:0];

      uint64_t v15 = ((void (*)(void *, uint64_t))v10[2])(v10, 20);
      [v6 ef_addOptionalObject:v15];
    }
    if (v5)
    {
      BOOL v16 = [(MessageListViewController *)self messageListSelectionModel];
      id v17 = [v16 itemIDs];
      id v18 = [v17 count];

      __int16 v19 = +[NSBundle mainBundle];
      if (v18) {
        [v19 localizedStringForKey:@"INDETERMINATE_MESSAGE_SELECTION" value:&stru_100619928 table:@"Main"];
      }
      else {
      double v21 = [v19 localizedStringForKey:@"ALL_MESSAGES" value:&stru_100619928 table:@"Main"];
      }
    }
    else
    {
      double v21 = [(MessageListViewController *)self _menuTitleForSelection];
    }
    id v20 = +[UIMenu menuWithTitle:v21 children:v6];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)_menuTitleForSelection
{
  BOOL v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"MESSAGE_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
  unsigned int v5 = [(MessageListViewController *)self messageListSelectionModel];
  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, [v5 count]);

  return v6;
}

- (void)_selectAllButtonPressed:(id)a3
{
  BOOL v4 = sub_100158A00(self);
  unsigned int v5 = +[MessageListViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v16 = 138412802;
    id v17 = v7;
    __int16 v18 = 2048;
    __int16 v19 = self;
    __int16 v20 = 1024;
    BOOL v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Select All Button Pressed. Is select all: %d", (uint8_t *)&v16, 0x1Cu);
  }
  id v8 = [(MessageListViewController *)self messageListSelectionModel];
  uint64_t v9 = v8;
  if (v4)
  {
    int v10 = [(MessageListViewController *)self flattenedMailboxesFuture];
    id v11 = [v10 result];
    [v9 enableSelectAllWithMailboxes:v11];
  }
  else
  {
    [v8 disableSelectAll];
  }
  id v12 = [(MessageListViewController *)self dataSource];
  [v12 reloadVisibleCellsInvalidatingCache:0];

  if (v4)
  {
    id v13 = [(MessageListViewController *)self _previewMessagesForSelectAllMode:1];
    [(MessageListViewController *)self _addMessagesToStackWithItemIDs:v13];
  }
  else
  {
    id v13 = [(MessageListViewController *)self transferStackViewController];
    [v13 removeStackedViewsAnimated:1 completion:0];
  }

  id v14 = [(MessageListViewController *)self selectAllButtonItem];
  +[UIBarButtonItem mf_configureSelectionBarButtonItem:v14 usingStyle:!v4];

  uint64_t v15 = [(MessageListViewController *)self conversationViewController];
  [v15 _updateBarButtonsAnimated:1 force:1];
}

- (void)updateToolbarButtonTitles
{
  id v43 = [(MessageListViewController *)self messageListSelectionModel];
  BOOL v3 = [(MessageListViewController *)self messageListSelectionModel];
  unsigned int v4 = [v3 isSelectAll];

  id v5 = [v43 count];
  unsigned int v42 = [(MessageListViewController *)self _shouldDisplaySearchButtons];
  id v6 = [(MessageListViewController *)self state];
  BOOL v7 = v5 != 0;
  uint64_t v8 = v7 & ~[v6 containsDraftsOrOutbox];

  uint64_t v9 = v7 & ~v4;
  if (v9 == 1)
  {
    int v10 = +[NSNumberFormatter ef_formatUnsignedInteger:v5 withGrouping:0];
    id v11 = [(MessageListViewController *)self messageListSelectionModel];
    unint64_t v12 = (unint64_t)[v11 deleteSelectionState];

    unsigned int v40 = v12 & 1;
    uint64_t v41 = (v12 >> 1) & 1;
    if (v42)
    {
      if ((v12 & 2) != 0)
      {
        id v13 = +[NSBundle mainBundle];
        uint64_t v14 = [v13 localizedStringForKey:@"ARCHIVE_BUTTON_COUNT_FORMAT_SHORT" value:&stru_100619928 table:@"Main"];
      }
      else
      {
        id v13 = +[NSBundle mainBundle];
        if (v12) {
          [v13 localizedStringForKey:@"TRASH_BUTTON_COUNT_FORMAT_SHORT" value:&stru_100619928 table:@"Main"];
        }
        else {
        uint64_t v14 = [v13 localizedStringForKey:@"DELETE_BUTTON_COUNT_FORMAT_SHORT" value:&stru_100619928 table:@"Main"];
        }
      }
      id v23 = (void *)v14;

      __int16 v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v10);

      if (v8)
      {
        id v24 = +[NSBundle mainBundle];
        char v25 = [v24 localizedStringForKey:@"MOVE_BUTTON_COUNT_FORMAT_SHORT" value:&stru_100619928 table:@"Main"];

        __int16 v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v10);

        id v26 = +[NSBundle mainBundle];
        char v27 = [v26 localizedStringForKey:@"MARK_BUTTON_COUNT_FORMAT_SHORT" value:&stru_100619928 table:@"Main"];

        BOOL v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v10);

        goto LABEL_25;
      }
    }
    else
    {
      __int16 v19 = 0;
    }
    __int16 v20 = 0;
    BOOL v21 = 0;
LABEL_25:

    if (v19) {
      goto LABEL_38;
    }
    goto LABEL_26;
  }
  uint64_t v15 = [(MessageListViewController *)self mailboxes];
  LODWORD(v41) = +[EMMailbox shouldArchiveByDefaultForMailboxes:v15];

  int v16 = [(MessageListViewController *)self mailboxes];
  unsigned int v40 = +[EMMailbox deleteMovesToTrashForMailboxes:v16];

  if (v5)
  {
    if (v41)
    {
      id v17 = +[NSBundle mainBundle];
      uint64_t v18 = [v17 localizedStringForKey:@"ARCHIVE_BUTTON" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v17 = +[NSBundle mainBundle];
      if (v40) {
        [v17 localizedStringForKey:@"TRASH_BUTTON" value:&stru_100619928 table:@"Main"];
      }
      else {
      uint64_t v18 = [v17 localizedStringForKey:@"DELETE_BUTTON" value:&stru_100619928 table:@"Main"];
      }
    }
    __int16 v19 = (void *)v18;

    if (v8) {
      goto LABEL_20;
    }
  }
  else
  {
    __int16 v19 = 0;
    if (v8)
    {
LABEL_20:
      id v22 = +[NSBundle mainBundle];
      __int16 v20 = [v22 localizedStringForKey:@"MOVE_BUTTON" value:&stru_100619928 table:@"Main"];

      int v10 = +[NSBundle mainBundle];
      BOOL v21 = [v10 localizedStringForKey:@"MARK_BUTTON" value:&stru_100619928 table:@"Main"];
      goto LABEL_25;
    }
  }
  __int16 v20 = 0;
  BOOL v21 = 0;
  if (v19) {
    goto LABEL_38;
  }
LABEL_26:
  if (v41)
  {
    __int16 v28 = +[NSBundle mainBundle];
    id v29 = v28;
    if (v42) {
      CFStringRef v30 = @"ARCHIVE_BUTTON_SHORT";
    }
    else {
      CFStringRef v30 = @"ARCHIVE_BUTTON";
    }
  }
  else if (v40)
  {
    __int16 v28 = +[NSBundle mainBundle];
    id v29 = v28;
    if (v42) {
      CFStringRef v30 = @"TRASH_BUTTON_SHORT";
    }
    else {
      CFStringRef v30 = @"TRASH_BUTTON";
    }
  }
  else
  {
    __int16 v28 = +[NSBundle mainBundle];
    id v29 = v28;
    if (v42) {
      CFStringRef v30 = @"DELETE_BUTTON_SHORT";
    }
    else {
      CFStringRef v30 = @"DELETE_BUTTON";
    }
  }
  __int16 v19 = [v28 localizedStringForKey:v30 value:&stru_100619928 table:@"Main"];

LABEL_38:
  CFStringRef v31 = [(MessageListViewController *)self deleteButtonItem];
  CFStringRef v32 = [(MessageListViewController *)self moveButtonItem];
  __int16 v33 = [(MessageListViewController *)self markButtonItem];
  [v31 setEnabled:v5 != 0];
  [v32 setEnabled:v8];
  [v33 setEnabled:v8];
  [v31 setTitle:v19];
  id v34 = v20;
  if (!v20)
  {
    CFStringRef v35 = +[NSBundle mainBundle];
    id v5 = v35;
    if (v42) {
      CFStringRef v36 = @"MOVE_BUTTON_SHORT";
    }
    else {
      CFStringRef v36 = @"MOVE_BUTTON";
    }
    id v34 = [v35 localizedStringForKey:v36 value:&stru_100619928 table:@"Main"];
  }
  [v32 setTitle:v34];
  if (!v20)
  {
  }
  BOOL v37 = v21;
  if (!v21)
  {
    id v38 = +[NSBundle mainBundle];
    id v5 = v38;
    if (v42) {
      CFStringRef v39 = @"MARK_BUTTON_SHORT";
    }
    else {
      CFStringRef v39 = @"MARK_BUTTON";
    }
    BOOL v37 = [v38 localizedStringForKey:v39 value:&stru_100619928 table:@"Main"];
  }
  [v33 setTitle:v37];
  if (!v21)
  {
  }
  [v31 setLongPressEnabled:v9];
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sub_10012482C((uint64_t)MailSplitViewController, (char *)a3))
  {
    BOOL v7 = [(MessageListViewController *)self conversationViewController];
  }
  else if (sub_10015D094((BOOL)self, (char *)a3))
  {
    BOOL v7 = self;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MessageListViewController;
    BOOL v7 = [(MessageListViewController *)&v10 targetForAction:a3 withSender:v6];
  }
  uint64_t v8 = v7;

  return v8;
}

- (void)_mailboxSearchKeyCommandInvoked:(id)a3
{
  if ([(MessageListViewController *)self isEditing]) {
    return;
  }
  unsigned int v4 = [(MessageListViewController *)self scene];
  id v5 = [v4 splitViewController];
  unint64_t v6 = (unint64_t)[v5 displayMode];

  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if ([(MessageListViewController *)self isSearchViewController])
    {
      [(MessageListViewController *)self dismissSearchResultsAnimated:1];
      return;
    }
  }
  else
  {
    BOOL v7 = [(MessageListViewController *)self splitViewController];
    [v7 showMessageListViewController:1 animated:1 completion:0];
  }

  [(MessageListViewController *)self focusSearchBarAnimated:0];
}

- (int64_t)_expandOpFromPlist:(id)a3
{
  unsigned int v4 = [a3 objectForKeyedSubscript:@"MailKBIsLeftArrowPlistKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MessageListViewController *)self view];
    id v6 = [v5 effectiveUserInterfaceLayoutDirection];

    if ((v6 != (id)1) != [v4 BOOLValue]) {
      int64_t v7 = 1;
    }
    else {
      int64_t v7 = 2;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_canPerformExpandOp:(int64_t)a3
{
  if (![(MessageListViewController *)self isThreaded]) {
    return 0;
  }
  id v10 = 0;
  id v11 = 0;
  sub_10015D2D0((id *)self, &v11, &v10);
  id v5 = v11;
  id v6 = v10;
  int64_t v7 = [(MessageListViewController *)self dataSource];
  if ([v7 isExpandedThread:v5]) {
    unsigned __int8 v8 = 1;
  }
  else {
    unsigned __int8 v8 = [v7 anyExpandedThreadContainsItemID:v5];
  }
  if (a3 != 2) {
    unsigned __int8 v8 = a3 == 1 && (v8 & 1) == 0 && (unint64_t)[v6 count] > 1;
  }

  return v8;
}

- (id)_plistDictionaryFromSender:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [v3 propertyList];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)shouldRouteActionToConversation:(SEL)a3 withCommand:(id)a4
{
  if ([(MessageListViewController *)self isEditing]) {
    return 0;
  }
  id v6 = [(MessageListViewController *)self collectionView];
  int64_t v7 = [v6 indexPathsForSelectedItems];
  BOOL v5 = [v7 count] == 0;

  return v5;
}

- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4
{
  id v6 = a4;
  if (sub_10015D094((BOOL)self, (char *)a3))
  {
    int64_t v7 = [(MessageListViewController *)self view];
    unsigned __int8 v8 = [v7 window];

    objc_opt_class();
    BOOL v9 = (objc_opt_isKindOfClass() & 1) != 0 && sub_1002091EC((BOOL)v8);
    id v10 = [(MessageListViewController *)self presentedViewController];
    if (v10) {
      BOOL v9 = 1;
    }

    if (v9) {
      goto LABEL_9;
    }
    if ("_refresh:" == a3)
    {
      LOBYTE(self) = 1;
      goto LABEL_40;
    }
    if ("_favoriteMailboxShortcutInvoked:" == a3)
    {
      id v11 = [(MessageListViewController *)self _plistDictionaryFromSender:v6];
      unint64_t v12 = [v11 objectForKeyedSubscript:@"MailKBIsFavoritePlistKey"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        LOBYTE(self) = 0;
LABEL_38:

        goto LABEL_39;
      }
      id v14 = [v12 integerValue];
      id v13 = [(MessageListViewController *)self favoritesShortcutsProvider];
      LOBYTE(self) = sub_1000C3204(v13, (unint64_t)v14);
LABEL_37:

      goto LABEL_38;
    }
    if ((*((unsigned char *)self + 8) & 1) == 0)
    {
LABEL_9:
      LOBYTE(self) = 0;
LABEL_40:

      goto LABEL_41;
    }
    id v11 = [(MessageListViewController *)self _plistDictionaryFromSender:v6];
    if (sub_1001245C4((uint64_t)MailSplitViewController, (char *)a3))
    {
LABEL_14:
      unint64_t v12 = [(MessageListViewController *)self collectionView];
      id v13 = [v12 indexPathsForSelectedItems];
      LOBYTE(self) = [v13 count] != 0;
      goto LABEL_37;
    }
    if ("_mailboxSearchKeyCommandInvoked:" == a3)
    {
      unint64_t v12 = [(MessageListViewController *)self navigationController];
      id v13 = [v12 topViewController];
      uint64_t v15 = [(MessageListViewController *)self parentViewController];
      if (v13 == v15)
      {
        int v16 = [(MessageListViewController *)self searchBar];
        LOBYTE(self) = [v16 _isEnabled];
      }
      else
      {
        LOBYTE(self) = 0;
      }

      goto LABEL_37;
    }
    if ("_scrollMessageListToTop:" == a3)
    {
      LOBYTE(self) = sub_100048FD8(self) != 0;
      goto LABEL_39;
    }
    if ("_scrollToCurrentMessage:" == a3) {
      goto LABEL_14;
    }
    if ("_expandCollapseThreadCommand:" == a3)
    {
      BOOL v18 = [(MessageListViewController *)self _canPerformExpandOp:[(MessageListViewController *)self _expandOpFromPlist:v11]];
    }
    else
    {
      if ("_filterCommand:" == a3) {
        goto LABEL_48;
      }
      if ("selectAll:" != a3)
      {
        if ("_selectPrimary" != a3
          && "_selectTransactions" != a3
          && "_selectUpdates" != a3
          && "_selectPromotions" != a3
          && "_selectAllMail" != a3)
        {
          LOBYTE(self) = 1;
LABEL_39:

          goto LABEL_40;
        }
        if ([(MessageListViewController *)self isBucketBarHidden])
        {
          LOBYTE(self) = 0;
          goto LABEL_39;
        }
LABEL_48:
        LODWORD(self) = [(MessageListViewController *)self isEditing] ^ 1;
        goto LABEL_39;
      }
      BOOL v18 = sub_100045608(self);
    }
    LOBYTE(self) = v18;
    goto LABEL_39;
  }
  LOBYTE(self) = 0;
LABEL_41:

  return (char)self;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("_escapeShortcutInvoked:" == a3)
  {
    if ((*((unsigned char *)self + 8) & 1) != 0
      && ([(MessageListViewController *)self isEditing] & 1) != 0)
    {
      unsigned __int8 v9 = 1;
      goto LABEL_4;
    }
    unsigned __int8 v8 = [(MessageListViewController *)self searchController];
    if ([v8 isActive])
    {
      id v11 = [v8 searchBar];
      unsigned __int8 v9 = [v11 isFirstResponder];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    int64_t v7 = [(MessageListViewController *)self scene];
    unsigned __int8 v8 = [v7 splitViewController];

    unsigned __int8 v9 = [v8 messageListCanPerformAction:a3 withSender:v6];
  }

LABEL_4:
  return v9;
}

- (BOOL)_shouldUsePluralPrompt
{
  if ([(MessageListViewController *)self isEditing])
  {
    id v3 = [(MessageListViewController *)self messageListSelectionModel];
    BOOL v4 = (uint64_t)[v3 count] > 0;
  }
  else
  {
    BOOL v5 = [(MessageListViewController *)self conversationViewController];
    id v3 = [v5 referenceMessageListItem];

    id v6 = [v3 itemID];
    int64_t v7 = [(MessageListViewController *)self dataSource];
    if ([v7 isExpandedThread:v6])
    {
      char v8 = 0;
    }
    else
    {
      unsigned __int8 v9 = [(MessageListViewController *)self dataSource];
      unsigned __int8 v10 = [v9 anyExpandedThreadContainsItemID:v6];

      char v8 = v10 ^ 1;
    }

    if ((unint64_t)[v3 count] > 1) {
      BOOL v4 = v8;
    }
    else {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v23 validateCommand:v4];
  BOOL v5 = (char *)[v4 action];
  if (v5 == "_deleteMessageCommandInvoked:")
  {
    if ([(MessageListViewController *)self _shouldUsePluralPrompt])
    {
      id v6 = +[NSBundle mainBundle];
      [v6 localizedStringForKey:@"DELETE_EMAIL_PLURAL" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v6 = +[NSBundle mainBundle];
      [v6 localizedStringForKey:@"DELETE_EMAIL" value:&stru_100619928 table:@"Main"];
    }
    goto LABEL_13;
  }
  if (v5 == "_archiveShortcutInvoked:")
  {
    if ([(MessageListViewController *)self _shouldUsePluralPrompt])
    {
      id v6 = +[NSBundle mainBundle];
      [v6 localizedStringForKey:@"ARCHIVE_EMAIL_PLURAL" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v6 = +[NSBundle mainBundle];
      [v6 localizedStringForKey:@"ARCHIVE_EMAIL" value:&stru_100619928 table:@"Main"];
    }
    unsigned __int8 v10 = LABEL_13:;
    [v4 setDiscoverabilityTitle:v10];
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  if (v5 == "_expandCollapseThreadCommand:")
  {
    id v6 = [v4 propertyList];
    int64_t v11 = [(MessageListViewController *)self _expandOpFromPlist:v6];
    unint64_t v12 = [v6 objectForKeyedSubscript:@"MailKBIsSimulatorPlistKey"];
    unsigned __int8 v13 = [v12 BOOLValue];

    if (v13)
    {
      unsigned __int8 v10 = 0;
      goto LABEL_37;
    }
    if (v11 == 2)
    {
      id v14 = +[NSBundle mainBundle];
      uint64_t v15 = [v14 localizedStringForKey:@"COLLAPSE_THREAD" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      if (v11 != 1)
      {
        id v14 = +[MessageListViewController log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          BOOL v21 = (objc_class *)objc_opt_class();
          id v22 = NSStringFromClass(v21);
          *(_DWORD *)buf = 138412802;
          char v25 = v22;
          __int16 v26 = 2048;
          char v27 = self;
          __int16 v28 = 2048;
          int64_t v29 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "<%@: %p> Unexpected expand op: %ld", buf, 0x20u);
        }
        unsigned __int8 v10 = 0;
        goto LABEL_36;
      }
      id v14 = +[NSBundle mainBundle];
      uint64_t v15 = [v14 localizedStringForKey:@"EXPAND_THREAD" value:&stru_100619928 table:@"Main"];
    }
    unsigned __int8 v10 = (void *)v15;
LABEL_36:

    goto LABEL_37;
  }
  if (v5 == "_filterCommand:")
  {
    if ([(MessageListViewController *)self isFilterButtonEnabled])
    {
      id v6 = +[NSBundle mainBundle];
      [v6 localizedStringForKey:@"DISABLE_FILTER" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v6 = +[NSBundle mainBundle];
      [v6 localizedStringForKey:@"ENABLE_FILTER" value:&stru_100619928 table:@"Main"];
    uint64_t v17 = };
    [v4 setDiscoverabilityTitle:v17];
    unsigned __int8 v10 = (void *)v17;
    goto LABEL_38;
  }
  if (v5 == "selectAll:")
  {
    if (sub_100158A00(self))
    {
      int v16 = +[NSBundle mainBundle];
      [v16 localizedStringForKey:@"SELECT_ALL_BUTTON" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      int v16 = +[NSBundle mainBundle];
      [v16 localizedStringForKey:@"DESELECT_ALL_BUTTON" value:&stru_100619928 table:@"Main"];
    id v6 = };

    [v4 setDiscoverabilityTitle:v6];
    goto LABEL_39;
  }
  if (v5 == "_favoriteMailboxShortcutInvoked:")
  {
    id v6 = [v4 propertyList];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v7 = [v6 objectForKeyedSubscript:@"MailKBIsFavoritePlistKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 integerValue];
        unsigned __int8 v9 = [(MessageListViewController *)self favoritesShortcutsProvider];
        unsigned __int8 v10 = sub_1000C3270(v9, (unint64_t)v8);

        if (!v10) {
          goto LABEL_42;
        }
LABEL_37:
        [v4 setDiscoverabilityTitle:v10];
        goto LABEL_38;
      }
    }
LABEL_42:
    BOOL v18 = +[MessageListViewController log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = (objc_class *)objc_opt_class();
      __int16 v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412802;
      char v25 = v20;
      __int16 v26 = 2048;
      char v27 = self;
      __int16 v28 = 2114;
      int64_t v29 = (int64_t)v6;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "<%@: %p> Unexpected request to validate favorite shortcut. plist = %{public}@", buf, 0x20u);
    }
    unsigned __int8 v10 = 0;
    goto LABEL_37;
  }
LABEL_40:
}

- (void)_refresh:(id)a3
{
  id v4 = [(MessageListViewController *)self dataSource];
  [v4 refresh];

  BOOL v5 = [(MessageListViewController *)self messageListFetchHelper];
  id v6 = [v5 fetchMailboxesIsUserInitiated:1];

  int64_t v7 = [(MessageListViewController *)self isRefreshing];
  id v8 = +[NSNumber numberWithBool:v6];
  [v7 setObject:v8];

  if ((v6 & 1) == 0) {
    [(MessageListViewController *)self _finishRefreshingWaitForDraggingToEnd:1];
  }
  if (EMBlackPearlIsFeatureEnabled()
    && ([(MessageListViewController *)self isBucketBarHidden] & 1) == 0)
  {
    [(MessageListViewController *)self _refreshBucketsSession];
  }
}

- (void)_finishRefreshingWaitForDraggingToEnd:(BOOL)a3
{
  BOOL v3 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10015E810;
  v11[3] = &unk_100604FE8;
  objc_copyWeak(&v12, &location);
  id v4 = objc_retainBlock(v11);
  BOOL v5 = v4;
  if (v3)
  {
    id v6 = +[NSRunLoop mainRunLoop];
    NSRunLoopMode v14 = NSDefaultRunLoopMode;
    int64_t v7 = +[NSArray arrayWithObjects:&v14 count:1];
    id v8 = v10;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10015E8B4;
    v10[3] = &unk_100604578;
    v10[4] = v5;
    [v6 performInModes:v7 block:v10];
  }
  else
  {
    id v8 = v9;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10015E8C4;
    v9[3] = &unk_100604578;
    void v9[4] = v4;
    id v6 = +[EFScheduler mainThreadScheduler];
    [v6 performBlock:v9];
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_favoriteMailboxShortcutInvoked:(id)a3
{
  id v5 = a3;
  id v6 = +[MessageListViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    unsigned __int8 v9 = NSStringFromSelector(a2);
    int v15 = 138412802;
    int v16 = v8;
    __int16 v17 = 2048;
    BOOL v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@", (uint8_t *)&v15, 0x20u);
  }
  unsigned __int8 v10 = [v5 input];
  id v11 = [v10 integerValue];

  id v12 = [(MessageListViewController *)self favoritesShortcutsProvider];
  unsigned __int8 v13 = sub_1000C3324(v12, (unint64_t)v11 - 1);

  if (v13)
  {
    NSRunLoopMode v14 = [(MessageListViewController *)self mailboxPickerDelegate];
    [v14 messageListViewController:self didSelectFavorite:v13];
  }
}

- (void)_expandCollapseThreadCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageListViewController *)self _plistDictionaryFromSender:v4];
  if (!v5)
  {
    id v8 = +[MessageListViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      objc_claimAutoreleasedReturnValue();
      sub_10045BA40();
    }
    goto LABEL_10;
  }
  int64_t v6 = [(MessageListViewController *)self _expandOpFromPlist:v5];
  int64_t v7 = v6;
  if (v6 == 2)
  {
    [(MessageListViewController *)self _collapseThreadKeyCommandInvoked:v4];
    goto LABEL_11;
  }
  if (v6 != 1)
  {
    id v8 = +[MessageListViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      int v12 = 138413058;
      unsigned __int8 v13 = v11;
      __int16 v14 = 2048;
      int v15 = self;
      __int16 v16 = 2048;
      int64_t v17 = v7;
      __int16 v18 = 2080;
      __int16 v19 = "-[MessageListViewController _expandCollapseThreadCommand:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "<%@: %p> Unexpected op %ld in %s", (uint8_t *)&v12, 0x2Au);
    }
LABEL_10:

    goto LABEL_11;
  }
  [(MessageListViewController *)self _expandThreadKeyCommandInvoked:v4];
LABEL_11:
}

- (void)_collapseThreadKeyCommandInvoked:(id)a3
{
  id v12 = 0;
  id v13 = 0;
  sub_10015D2D0((id *)self, &v13, &v12);
  id v4 = v13;
  id v5 = v12;
  int64_t v6 = [(MessageListViewController *)self dataSource];
  unsigned int v7 = [v6 isExpandedThread:v4];
  unsigned int v8 = [v6 anyExpandedThreadContainsItemID:v4];
  if (v7)
  {
    id v9 = v5;
    if (!v9) {
      goto LABEL_15;
    }
LABEL_7:
    [v6 didSelectDisclosureButtonForMessageListItem:v9 disclosureEnabled:1];
    if ([(MessageListViewController *)self isEditing])
    {
      if (self && self->_keyboardFocusedItemID) {
        sub_10014FA94((uint64_t)self, v4);
      }
    }
    else if (v4)
    {
      [(MessageListViewController *)self setLastSelectedItemID:v4];
    }
    goto LABEL_15;
  }
  if (!v8)
  {
    id v9 = 0;
    goto LABEL_15;
  }
  uint64_t v10 = [v6 threadItemIDForItemInExpandedThread:v4];

  if (!v10)
  {
    id v9 = 0;
    id v4 = 0;
    goto LABEL_15;
  }
  id v11 = [v6 messageListItemForItemID:v10];
  id v9 = [v11 result];

  id v4 = (id)v10;
  if (v9) {
    goto LABEL_7;
  }
LABEL_15:
}

- (void)_expandThreadKeyCommandInvoked:(id)a3
{
  id v9 = 0;
  sub_10015D2D0((id *)self, 0, &v9);
  id v4 = v9;
  if (v4)
  {
    id v5 = [(MessageListViewController *)self dataSource];
    int64_t v6 = [v4 itemID];
    unsigned __int8 v7 = [v5 isExpandedThread:v6];

    if ((v7 & 1) == 0)
    {
      unsigned int v8 = [(MessageListViewController *)self dataSource];
      [v8 didSelectDisclosureButtonForMessageListItem:v4 disclosureEnabled:0];
    }
  }
}

- (void)selectAll:(id)a3
{
}

- (void)_escapeShortcutInvoked:(id)a3
{
  id v7 = a3;
  if ((*((unsigned char *)self + 8) & 1) != 0 && [(MessageListViewController *)self isEditing])
  {
    [(MessageListViewController *)self _editButtonTapped:0];
  }
  else
  {
    id v4 = [(MessageListViewController *)self searchController];
    if ([v4 isActive])
    {
      id v5 = [(MessageListViewController *)self searchBar];
      unsigned int v6 = [v5 isFirstResponder];

      if (v6) {
        [(MessageListViewController *)self dismissSearchResultsAnimated:1];
      }
    }
    else
    {
    }
  }
}

- (void)_scrollMessageListToTop:(id)a3
{
  id v7 = [(MessageListViewController *)self dataSource];
  uint64_t v4 = (uint64_t)[v7 numberOfSections];
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    while (![v7 numberOfItemsAtSectionIndex:v5])
    {
      if (v4 == ++v5) {
        goto LABEL_7;
      }
    }
    unsigned int v6 = +[NSIndexPath indexPathForRow:0 inSection:v5];
    sub_10015F03C(self, v6, 1);
  }
LABEL_7:
}

- (void)_scrollToCurrentMessage:(id)a3
{
  uint64_t v4 = [(MessageListViewController *)self collectionView];
  uint64_t v5 = [v4 indexPathsForSelectedItems];
  id v6 = [v5 firstObject];

  if (v6) {
    sub_10015F03C(self, v6, 0);
  }
}

- (id)_focusedMessageAtNormalizedFocalPoint:(CGPoint)a3
{
  return 0;
}

- (void)_updateMailboxPositionUserActivity
{
  BOOL v3 = [(MessageListViewController *)self userActivity];
  if (v3)
  {
    mailboxBrowseActivityPayload = self->_mailboxBrowseActivityPayload;

    if (mailboxBrowseActivityPayload)
    {
      id v5 = [(MessageListViewController *)self userActivity];
      [v5 becomeCurrent];
    }
  }
}

- (BOOL)_isActivityEligibleForPredictionWithPayload:(id)a3
{
  BOOL v3 = [a3 objectForKeyedSubscript:MSMailActivityHandoffBrowseMailboxKeySpecialMailboxType];
  BOOL v4 = v3 != (void *)MSMailActivityHandoffBrowseMailboxSpecialMailboxTypeAllInboxes;

  return v4;
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  BOOL v4 = [(MessageListViewController *)self presentedViewController];

  if (v4)
  {
    id v5 = [(MessageListViewController *)self presentedViewController];
  }
  else
  {
    id v6 = [(MessageListViewController *)self scene];
    id v5 = [v6 dockContainer];
  }

  return v5;
}

- (id)messageRepositoryForTriageInteraction:(id)a3
{
  BOOL v3 = [(MessageListViewController *)self messageRepository];

  return v3;
}

- (void)presentTransferUIWithMoveInteraction:(id)a3 prediction:(id)a4 fromViewController:(id)a5 didDismissHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v26 = a6;
  char v27 = v10;
  id v11 = [(MessageListViewController *)self messageListSelectionModel];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10015F830;
  v31[3] = &unk_10060A2D8;
  v31[4] = self;
  id v12 = v9;
  id v32 = v12;
  id v25 = v11;
  id v33 = v25;
  id v13 = objc_retainBlock(v31);
  unint64_t v14 = [(MessageListViewController *)self _stackViewTransferOptions];
  int v15 = [v12 messageListItemSelection];
  __int16 v16 = [v15 messageListItems];
  int64_t v17 = [(MessageListViewController *)self _transferControllerWithMessages:v16 options:v14 | 2 interaction:v12 didDismissHandler:v26];

  __int16 v18 = [v17 transferNavigationController];
  [v18 setMailboxPrediction:v10];
  [v18 setDidFinish:v13];
  [(MessageListViewController *)self setTransferController:v17];
  __int16 v19 = [(MessageListViewController *)self transferStackViewController];
  __int16 v20 = [v19 navigationController];

  BOOL v21 = [(MessageListViewController *)self scene];
  id v22 = [v21 mf_rootViewController];
  objc_super v23 = [(MessageListViewController *)self transferController];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10015F974;
  v28[3] = &unk_100604618;
  id v24 = v20;
  id v29 = v24;
  CFStringRef v30 = self;
  [v22 presentViewController:v23 animated:1 completion:v28];
}

- (unint64_t)_stackViewTransferOptions
{
  if ([(MessageListViewController *)self isThreaded]) {
    unint64_t v3 = 68;
  }
  else {
    unint64_t v3 = 76;
  }
  BOOL v4 = [(MessageListViewController *)self mailboxes];
  unsigned int v5 = +[EMMailbox shouldArchiveByDefaultForMailboxes:v4];

  if (v5) {
    return v3 | 0x10;
  }
  id v7 = [(MessageListViewController *)self mailboxes];
  unsigned int v8 = +[EMMailbox deleteMovesToTrashForMailboxes:v7];

  if (v8) {
    return v3 | 0x20;
  }
  else {
    return v3;
  }
}

- (void)filterUIWithFilterInteraction:(id)a3
{
  id v10 = a3;
  BOOL v4 = [MFMailboxFilter alloc];
  unsigned int v5 = [v10 messageListItemSelection];
  id v6 = [v5 messageListItems];
  id v7 = [v6 firstObject];
  id v8 = [(MFMailboxFilter *)v4 initForSender:v7];

  id v9 = [(MessageListViewController *)self filterViewModel];
  [v9 setSenderFilter:v8];

  [(MessageListViewController *)self setFiltersEnabled:1];
}

- (void)_updateStackViewController
{
  unint64_t v3 = [(MessageListViewController *)self splitViewController];
  BOOL v4 = [v3 traitCollection];
  id v5 = [v4 horizontalSizeClass];

  if (v5 == (id)2 && [(MessageListViewController *)self _inMultiSelectionMode])
  {
    [(MessageListViewController *)self _setRowDeletionEnabled:1 animated:0];
  }
}

- (id)transferStackViewController:(id)a3 displayMessageForMessageListItemWithItemID:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v6 messageListItemForItemID:v5];
  id v8 = +[EFScheduler globalAsyncSchedulerWithQualityOfService:33];
  id v9 = [v7 onScheduler:v8 then:&stru_10060A2F8];

  return v9;
}

- (id)transferStackViewController:(id)a3 itemIDsToDisplayFromItemIDs:(id)a4
{
  id v18 = a3;
  id v19 = a4;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v19 count]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v19;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [(MessageListViewController *)self dataSource];
        unint64_t v14 = [v13 itemIDsInExpandedThread:v12];

        id v15 = [v14 count];
        __int16 v16 = v14;
        if (!v15)
        {
          uint64_t v24 = v12;
          BOOL v4 = +[NSArray arrayWithObjects:&v24 count:1];
          __int16 v16 = v4;
        }
        [v7 addObjectsFromArray:v16];
        if (!v15) {
      }
        }
      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  return v7;
}

- (void)_updateThreadingPreference:(id)a3
{
  id v5 = [(MessageListViewController *)self state];
  unsigned __int8 v4 = [v5 containsDraftsOrOutbox];

  if ((v4 & 1) == 0)
  {
    id v6 = +[NSUserDefaults em_userDefaults];
    -[MessageListViewController setThreaded:](self, "setThreaded:", [v6 BOOLForKey:DisableThreadingKey] ^ 1);
  }
}

- (void)_updateListForChange:(id)a3
{
  id v5 = [(MessageListViewController *)self layoutValuesHelper];
  [v5 invalidate];

  [(MessageListViewController *)self _invalidateCachedUseCompactRows];
  id v4 = [(MessageListViewController *)self shouldDisplayGroupedSenders];
  id v6 = [(MessageListViewController *)self dataSource];
  [v6 reloadVisibleCellsInvalidatingCache:v4];
}

- (id)leadingSwipeActionsConfigurationAtIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v5 section];
  if ([v6 isSection:MessageListSectionHelpMailLearn atIndex:v7])
  {

LABEL_4:
    id v11 = 0;
    goto LABEL_32;
  }
  id v8 = [(MessageListViewController *)self dataSource];
  id v9 = [v5 section];
  unsigned __int8 v10 = [v8 isSection:MessageListSectionOnboardingTip atIndex:v9];

  if (v10) {
    goto LABEL_4;
  }
  int v44 = [(MessageListViewController *)self dataSource];
  id v45 = +[NSMutableArray array];
  uint64_t v12 = [(MessageListViewController *)self collectionView];
  id v13 = [v12 cellForItemAtIndexPath:v5];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v13 cellHelper],
        unint64_t v14 = objc_claimAutoreleasedReturnValue(),
        [v14 messageListItem],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    int64_t v17 = +[MessageListViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v41 = (objc_class *)objc_opt_class();
      unsigned int v42 = NSStringFromClass(v41);
      id v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      id v47 = v42;
      __int16 v48 = 2048;
      __int16 v49 = self;
      __int16 v50 = 2114;
      id v51 = v43;
      __int16 v52 = 2114;
      id v53 = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "<%@: %p> %{public}@: No message list item at index path: %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    __int16 v16 = [v44 messageListItemAtIndexPath:v5];
    int64_t v17 = [v16 result];

    if (v17)
    {
      id v18 = +[MessageListViewController log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        long long v22 = [v17 ef_publicDescription];
        long long v23 = [(MessageListViewController *)self mailboxes];
        uint64_t v24 = [v23 ef_mapSelector:@"ef_publicDescription"];
        *(_DWORD *)buf = 138413570;
        id v47 = v20;
        __int16 v48 = 2048;
        __int16 v49 = self;
        __int16 v50 = 2112;
        id v51 = v21;
        __int16 v52 = 2112;
        id v53 = v5;
        __int16 v54 = 2112;
        __int16 v55 = v22;
        __int16 v56 = 2112;
        __int16 v57 = v24;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ %@, item: %@\nmailboxes: %@", buf, 0x3Eu);
      }
      id v25 = [(MessageListViewController *)self state];
      unsigned __int8 v26 = [v25 isOutgoingMailbox];

      if (v26) {
        goto LABEL_22;
      }
      char v27 = +[NSUserDefaults em_userDefaults];
      unsigned int v28 = [v27 BOOLForKey:@"ShowSecondRightAction"];

      if (v28)
      {
        id v29 = [(MessageListViewController *)self _swipeActionForTriageAction:7 indexPath:v5];
        [v45 ef_addOptionalObject:v29];
      }
      CFStringRef v30 = sub_100216998(0);
      int64_t v31 = +[MFTriageActionUtilities triageActionForActionKey:v30];

      id v32 = [(MessageListViewController *)self state];
      id v33 = v32;
      if (v31)
      {
        if (v31 == 16)
        {
          if (([v32 containsArchiveMailbox] & 1) != 0
            || ([v33 containsTrashMailbox] & 1) != 0)
          {
            goto LABEL_21;
          }
          if ([v17 shouldArchiveByDefault]) {
            int64_t v31 = 8;
          }
          else {
            int64_t v31 = 9;
          }
        }
        id v34 = [(MessageListViewController *)self _swipeActionForTriageAction:v31 indexPath:v5];
        [v45 ef_addOptionalObject:v34];
      }
LABEL_21:

LABEL_22:
      if ([(MessageListViewController *)self _allowSettingReadLaterAction])
      {
        CFStringRef v35 = [(MessageListViewController *)self _swipeActionForTriageAction:3 indexPath:v5];
        [v45 ef_addOptionalObject:v35];
      }
      id v11 = +[UISwipeActionsConfiguration configurationWithActions:v45];
      goto LABEL_31;
    }
    CFStringRef v36 = +[MessageListViewController log];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      id v38 = (objc_class *)objc_opt_class();
      CFStringRef v39 = NSStringFromClass(v38);
      unsigned int v40 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      id v47 = v39;
      __int16 v48 = 2048;
      __int16 v49 = self;
      __int16 v50 = 2114;
      id v51 = v40;
      __int16 v52 = 2114;
      id v53 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "<%@: %p> %{public}@: Message list returned nil for index path: %{public}@", buf, 0x2Au);
    }
  }
  id v11 = 0;
LABEL_31:

LABEL_32:

  return v11;
}

- (id)trailingSwipeActionsConfigurationAtIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v5 section];
  if ([v6 isSection:MessageListSectionHelpMailLearn atIndex:v7])
  {

LABEL_4:
    id v11 = 0;
    goto LABEL_29;
  }
  id v8 = [(MessageListViewController *)self dataSource];
  id v9 = [v5 section];
  unsigned __int8 v10 = [v8 isSection:MessageListSectionOnboardingTip atIndex:v9];

  if (v10) {
    goto LABEL_4;
  }
  __int16 v54 = [(MessageListViewController *)self dataSource];
  uint64_t v12 = [v54 messageListItemAtIndexPath:v5];
  id v13 = [v12 result];

  if (!v13)
  {
    id v15 = +[MessageListViewController log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v47 = (objc_class *)objc_opt_class();
      __int16 v48 = NSStringFromClass(v47);
      __int16 v49 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      id v56 = v48;
      __int16 v57 = 2048;
      uint64_t v58 = self;
      __int16 v59 = 2114;
      id v60 = v49;
      __int16 v61 = 2114;
      id v62 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "<%@: %p> %{public}@: Message list returned nil for index path: %{public}@", buf, 0x2Au);
    }
    id v11 = 0;
    goto LABEL_28;
  }
  unint64_t v14 = [(MessageListViewController *)self collectionView];
  id v15 = [v14 cellForItemAtIndexPath:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v16 = v15;
    int64_t v17 = [v16 cellHelper];
    id v18 = [v17 messageListItem];

    if (!v18)
    {
      int64_t v31 = +[MessageListViewController log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        __int16 v50 = (objc_class *)objc_opt_class();
        id v51 = NSStringFromClass(v50);
        __int16 v52 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138413058;
        id v56 = v51;
        __int16 v57 = 2048;
        uint64_t v58 = self;
        __int16 v59 = 2114;
        id v60 = v52;
        __int16 v61 = 2114;
        id v62 = v5;
        _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "<%@: %p> %{public}@: No message list item at index path: %{public}@", buf, 0x2Au);
      }
      id v11 = 0;
      goto LABEL_27;
    }
    id v19 = [v16 cellHelper];
    id v20 = [v19 predictedMailbox];

    if (!v20)
    {
      BOOL v67 = v13;
      id v21 = +[NSArray arrayWithObjects:&v67 count:1];
      long long v22 = +[MFMoveToPredictionTriageInteraction predictMailboxForMovingMessages:v21];

      long long v23 = [v16 cellHelper];
      [v23 setPredictedMailbox:v22];
    }
  }
  unsigned int v53 = [v13 shouldArchiveByDefault];
  uint64_t v24 = +[MessageListViewController log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v28 = [v13 ef_publicDescription];
    id v29 = [(MessageListViewController *)self mailboxes];
    CFStringRef v30 = [v29 ef_mapSelector:@"ef_publicDescription"];
    *(_DWORD *)buf = 138413570;
    id v56 = v26;
    __int16 v57 = 2048;
    uint64_t v58 = self;
    __int16 v59 = 2112;
    id v60 = v27;
    __int16 v61 = 2112;
    id v62 = v5;
    __int16 v63 = 2112;
    id v64 = v28;
    __int16 v65 = 2112;
    id v66 = v30;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ %@, item: %@\nmailboxes: %@", buf, 0x3Eu);
  }
  __int16 v16 = +[NSMutableArray array];
  int64_t v31 = [(MessageListViewController *)self state];
  if ([(MessageListViewController *)self _shouldShowClearHighImpactForMessageListItem:v13])
  {
    id v32 = [(MessageListViewController *)self _swipeActionForTriageAction:21 indexPath:v5];
    [v16 ef_addOptionalObject:v32];
  }
  if (![(MessageListViewController *)self _allowReadLaterActions]
    || ([v13 readLater],
        id v33 = objc_claimAutoreleasedReturnValue(),
        [v33 date],
        id v34 = objc_claimAutoreleasedReturnValue(),
        BOOL v35 = v34 == 0,
        v34,
        v33,
        v35))
  {
    if (([v31 containsFollowUpMailbox] & 1) != 0
      || [v31 containsInbox]
      && ([v13 followUp],
          id v38 = objc_claimAutoreleasedReturnValue(),
          BOOL v39 = v38 == 0,
          v38,
          !v39))
    {
      unsigned int v40 = [(MessageListViewController *)self _swipeActionForTriageAction:5 indexPath:v5];
      [v16 ef_addOptionalObject:v40];

      BOOL v37 = [(MessageListViewController *)self _swipeActionForTriageAction:1 indexPath:v5];
      [v16 ef_addOptionalObject:v37];
    }
    else
    {
      if (v53) {
        uint64_t v42 = 9;
      }
      else {
        uint64_t v42 = 8;
      }
      id v43 = [(MessageListViewController *)self _swipeActionForTriageAction:v42 indexPath:v5];
      [v16 ef_addOptionalObject:v43];

      if (([v31 containsDraftsOrOutbox] & 1) != 0
        || ([v31 containsSendLaterMailbox] & 1) != 0)
      {
        goto LABEL_26;
      }
      int v44 = sub_100216A64(0);
      int64_t v45 = +[MFTriageActionUtilities triageActionForActionKey:v44];

      if (v45)
      {
        if (v45 == 16)
        {
          if (v53) {
            int64_t v45 = 8;
          }
          else {
            int64_t v45 = 9;
          }
        }
        id v46 = [(MessageListViewController *)self _swipeActionForTriageAction:v45 indexPath:v5];
        [v16 ef_addOptionalObject:v46];
      }
      BOOL v37 = [(MessageListViewController *)self _swipeActionForTriageAction:1 indexPath:v5];
      [v16 ef_addOptionalObject:v37];
    }
  }
  else
  {
    CFStringRef v36 = [(MessageListViewController *)self _swipeActionForTriageAction:4 indexPath:v5];
    [v16 ef_addOptionalObject:v36];

    BOOL v37 = [(MessageListViewController *)self _swipeActionForTriageAction:1 indexPath:v5];
    [v16 ef_addOptionalObject:v37];
  }

LABEL_26:
  id v11 = +[UISwipeActionsConfiguration configurationWithActions:v16];
LABEL_27:

LABEL_28:
LABEL_29:

  return v11;
}

- (BOOL)_shouldShowClearHighImpactForMessageListItem:(id)a3
{
  id v4 = a3;
  if (EMBlackPearlIsFeatureEnabled()
    && ([(MessageListViewController *)self isBucketBarHidden] & 1) == 0)
  {
    id v6 = [v4 category];
    if ([v6 isHighImpact])
    {
      id v7 = [v4 category];
      id v8 = [v7 type];
      [(MessageListViewController *)self selectedBucket];
      BOOL v5 = v8 != (id)EMCategoryTypeForBucket()
        && [(MessageListViewController *)self selectedBucket] == (id)1;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_clearVisibleSwipeActions
{
  if ([(MessageListViewController *)self swipeActionVisible])
  {
    if (([(MessageListViewController *)self isEditing] & 1) == 0)
    {
      [(MessageListViewController *)self collectionView];
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_1001612D0;
      v4[3] = &unk_1006047A0;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = v3;
      +[UIView performWithoutAnimation:v4];
      [(MessageListViewController *)self setSwipeActionVisible:0];
    }
  }
}

- (void)_prepareForMoveOrDestructiveInteraction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 messageListItemSelection];
  id v8 = [v7 messageListItems];

  id v9 = [v8 ef_map:&stru_10060A318];
  [(MessageListViewController *)self setSwipeActionVisible:0];
  unsigned __int8 v10 = [(MessageListViewController *)self messageSelectionStrategy];
  id v11 = [(MessageListViewController *)self collectionView];
  uint64_t v12 = [v11 indexPathsForSelectedItems];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10016159C;
  v18[3] = &unk_100609A68;
  v18[4] = self;
  id v13 = [v12 ef_map:v18];
  unint64_t v14 = +[NSSet setWithArray:v13];

  if ([v10 shouldChangeSelectionAfterDeletedMessageItemIDs:v9 selectedItemIDs:v14])
  {
    id v15 = [(MessageListViewController *)self messageSelectionStrategy];
    __int16 v16 = [v15 itemIDToSelectAfterDeletedMessageItemIDs:v9];
    [(MessageListViewController *)self setItemIDToSelectAfterMoveID:v16];
  }
  int64_t v17 = [(MessageListViewController *)self dataSource];
  [v17 deleteItemsWithIDs:v9 animated:1 immediateCompletion:1 completion:v6];
}

- (void)_didPerformMoveOrDestructiveInteraction:(id)a3
{
  id v13 = a3;
  id v4 = [(MessageListViewController *)self scene];
  unsigned int v5 = [v4 isInExpandedEnvironment];

  if (v5)
  {
    id v6 = [v13 messageListItemSelection];
    id v7 = [v6 messageListItems];
    id v8 = [v7 ef_map:&stru_10060A338];

    id v9 = [(MessageListViewController *)self conversationViewController];
    unsigned __int8 v10 = [v9 referenceMessageListItem];
    id v11 = [v10 itemID];
    unsigned int v12 = [v8 containsObject:v11];

    if (v12) {
      [(MessageListViewController *)self _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:v8 showConversationView:1];
    }
  }
}

- (id)_swipeActionForTriageAction:(int64_t)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = [(MessageListViewController *)self dataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v6];

  id v9 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v10 = [v9 messageListItemAtIndexPath:v6];
  id v11 = [v10 result];

  if (v11)
  {
    __int16 v57 = v11;
    unsigned int v12 = +[NSArray arrayWithObjects:&v57 count:1];
    [(MessageListViewController *)self reportEngagementAction:3 onItemID:v8];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100162490;
    v56[3] = &unk_10060A268;
    v56[4] = self;
    unsigned int v40 = objc_retainBlock(v56);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100162558;
    v55[3] = &unk_1006057D0;
    v55[4] = self;
    uint64_t v41 = objc_retainBlock(v55);
    BOOL v13 = a3 == 4;
    if (!a3)
    {
      __int16 v16 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1001625C4;
    v52[3] = &unk_10060A360;
    int64_t v54 = a3;
    v52[4] = self;
    id v53 = v6;
    BOOL v39 = objc_retainBlock(v52);
    if (a3 > 5)
    {
      if (a3 == 21)
      {
        long long v23 = [(MessageListViewController *)self undoManager];
        a3 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v12 undoManager:v23 origin:2 actor:2];

        uint64_t v18 = [(id)a3 swipeActionWithPreparation:v40 completion:v41];
        goto LABEL_21;
      }
      if (a3 == 6)
      {
        int64_t v17 = [(MessageListViewController *)self undoManager];
        a3 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v12 undoManager:v17 origin:2 actor:2 reason:4];

        [(id)a3 setDelegate:self];
        uint64_t v18 = [(id)a3 swipeActionWithPreparation:0 completion:v39];
        goto LABEL_21;
      }
    }
    else
    {
      if (a3 == 2)
      {
        long long v22 = [(MessageListViewController *)self undoManager];
        a3 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v12 undoManager:v22 origin:2 actor:2 reason:4];

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1001627B0;
        v50[3] = &unk_100605550;
        v50[4] = self;
        id v51 = v39;
        __int16 v16 = [(id)a3 swipeActionWithPreparation:0 completion:v50];
        id v21 = v51;
LABEL_19:

LABEL_22:
        goto LABEL_23;
      }
      if (a3 == 3)
      {
        unint64_t v14 = [(MessageListViewController *)self undoManager];
        id v15 = +[MFReadLaterTriageInteraction interactionWithMessageListItems:v12 undoManager:v14 origin:2 actor:2];
        goto LABEL_16;
      }
    }
    if (a3 == 4)
    {
      unint64_t v14 = [(MessageListViewController *)self undoManager];
      id v19 = +[MFReadLaterTriageInteractionState removeDateState];
      id v15 = +[MFReadLaterTriageInteraction interactionWithMessageListItems:v12 undoManager:v14 origin:2 actor:2 state:v19];

LABEL_16:
      id v20 = [(MessageListViewController *)self view];
      [v15 setPresentationSource:v20];

      id v21 = v15;
      [v21 setDelegate:self];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100162834;
      v47[3] = &unk_10060A388;
      BOOL v49 = v13;
      v47[4] = self;
      __int16 v48 = v39;
      __int16 v16 = [v21 swipeActionWithPreparation:0 completion:v47];

LABEL_17:
      a3 = (int64_t)v21;
      goto LABEL_19;
    }
    switch(a3)
    {
      case 1:
        id v25 = [(MessageListViewController *)self undoManager];
        id v26 = +[MFMoreTriageInteraction interactionWithMessageListItems:v12 undoManager:v25 origin:2 actor:2];

        [v26 setDelegate:self];
        id v21 = v26;
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100162AF0;
        v43[3] = &unk_100605118;
        void v43[4] = self;
        id v44 = v12;
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100162AF8;
        v42[3] = &unk_1006057D0;
        v42[4] = self;
        __int16 v16 = [v21 swipeActionWithPreparation:v43 completion:v42];

        goto LABEL_17;
      case 5:
        id v29 = [(MessageListViewController *)self undoManager];
        a3 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v12 undoManager:v29 origin:2 actor:2];

        uint64_t v18 = [(id)a3 swipeActionWithPreparation:v40 completion:v41];
        goto LABEL_21;
      case 7:
        BOOL v35 = [(MessageListViewController *)self undoManager];
        CFStringRef v36 = [(MessageListViewController *)self view];
        a3 = +[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:v12 undoManager:v35 origin:2 actor:2 presentationSource:v36 delegate:self presentingViewController:self predictedMailbox:0];

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100162994;
        v45[3] = &unk_100605550;
        v45[4] = self;
        id v46 = v39;
        __int16 v16 = [(id)a3 swipeActionWithPreparation:0 completion:v45];
        id v21 = v46;
        goto LABEL_19;
      case 8:
        BOOL v37 = [(MessageListViewController *)self undoManager];
        a3 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v12 undoManager:v37 origin:2 actor:2];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(id)a3 setShouldAskForConfirmation:1];
          [(id)a3 setDelegate:self];
        }
        break;
      case 9:
        id v38 = [(MessageListViewController *)self undoManager];
        a3 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v12 undoManager:v38 origin:2 actor:2];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(id)a3 setShouldAskForConfirmation:1];
          [(id)a3 setDelegate:self];
        }
        break;
      case 10:
        CFStringRef v30 = [(MessageListViewController *)self undoManager];
        a3 = +[MFConversationFlagTriageInteraction interactionWithReferenceMessage:v11 undoManager:v30 origin:2 actor:2];

        int64_t v31 = [(MessageListViewController *)self view];
        [(id)a3 setPresentationSource:v31];

        uint64_t v18 = [(id)a3 swipeAction];
        goto LABEL_21;
      case 11:
        id v32 = [(MessageListViewController *)self undoManager];
        a3 = +[MFConversationFlagTriageInteraction interactionWithReferenceMessage:v11 undoManager:v32 origin:2 actor:2];

        id v33 = [(MessageListViewController *)self view];
        [(id)a3 setPresentationSource:v33];

        uint64_t v18 = [(id)a3 swipeAction];
        goto LABEL_21;
      case 15:
        id v34 = [(MessageListViewController *)self undoManager];
        a3 = +[MFFlagChangeTriageInteraction interactionWithMessageListItems:v12 undoManager:v34 origin:2 actor:2 reason:4];

        uint64_t v18 = [(id)a3 swipeAction];
        goto LABEL_21;
      default:
        id v21 = MFLogGeneral();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10045BAA4();
        }
        a3 = 0;
        __int16 v16 = 0;
        goto LABEL_19;
    }
    uint64_t v18 = [(id)a3 swipeActionWithPreparation:v40 completion:v41];
LABEL_21:
    __int16 v16 = (void *)v18;
    goto LABEL_22;
  }
  a3 = +[MessageListViewController log];
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
  {
    id v27 = (objc_class *)objc_opt_class();
    unsigned int v28 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138413058;
    __int16 v59 = v28;
    __int16 v60 = 2048;
    __int16 v61 = self;
    __int16 v62 = 2112;
    __int16 v63 = v8;
    __int16 v64 = 2112;
    id v65 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)a3, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to obtain messageListItem for itemID:%@ at indexPath:%@", buf, 0x2Au);
  }
  __int16 v16 = 0;
LABEL_24:

  return v16;
}

- (void)_reportReadTriageInteraction:(id)a3 didPerform:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v14 = v6;
    id v7 = [v6 messageListItemSelection];
    unsigned __int8 v8 = [v7 isSelectAll];

    id v6 = v14;
    if ((v8 & 1) == 0)
    {
      id v9 = [v14 messageListItemSelection];
      unsigned __int8 v10 = [v9 messageListItems];
      id v11 = [v10 firstObject];
      unsigned int v12 = [v11 itemID];

      if (v12)
      {
        BOOL v13 = [(MessageListViewController *)self dataSource];
        [v13 didScheduleReadInteractionForItemID:v12];
      }
      id v6 = v14;
    }
  }
}

- (void)mailboxFilterPickerViewController:(id)a3 didFinishPickingWithSelectedFilters:(id)a4
{
  id v6 = a4;
  unsigned int v5 = [(MessageListViewController *)self filterViewModel];
  [v5 setSelectedFilters:v6];

  [(MessageListViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(MessageListViewController *)self setFiltersEnabled:1];
  if (_os_feature_enabled_impl()) {
    [(MessageListViewController *)self _appStoreReviewNotifyFilterCriterionIfNecessaryFor:v6];
  }
}

- (void)didDismissMailboxFilterPickerViewController:(id)a3
{
}

- (void)_appStoreReviewNotifyFilterCriterionIfNecessaryFor:(id)a3
{
  id v13 = +[NSSet setWithArray:a3];
  BOOL v4 = [(MessageListViewController *)self filterViewModel];
  unsigned int v5 = [v4 provider];
  id v6 = [v5 defaultFilters];
  id v7 = +[NSSet setWithArray:v6];

  if (([v13 isEqualToSet:v7] & 1) == 0)
  {
    unsigned __int8 v8 = +[UIApplication sharedApplication];
    id v9 = [v8 appStoreReviewManager];
    [v9 notifyCriterionMet:1];

    unsigned __int8 v10 = [(MessageListViewController *)self scene];
    if (v10)
    {
      id v11 = +[UIApplication sharedApplication];
      unsigned int v12 = [v11 appStoreReviewManager];
      [v12 attemptToShowPromptIn:v10 reason:4];
    }
  }
}

- (id)referenceMessageListItem
{
  v2 = [(MessageListViewController *)self conversationViewController];
  id v3 = [v2 referenceMessageListItem];

  return v3;
}

- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v12 = a3;
  id v10 = a4;
  id v11 = [(MessageListViewController *)self conversationViewController];
  [v11 setReferenceMessageListItem:v12 referenceMessageList:v10 showAsConversation:v7 animated:v6];
}

- (BOOL)conversationViewController:(id)a3 canAdvanceToNextConversationWithDirection:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v6 = [(MessageListViewController *)self conversationViewController];
  BOOL v7 = [v6 referenceMessageListItem];

  unsigned __int8 v8 = [(MessageListViewController *)self messageSelectionStrategy];
  id v9 = [v7 itemID];
  id v10 = [v8 itemIDToSelectFromItemID:v9 withDirection:v4];

  return v10 != 0;
}

- (void)conversationViewController:(id)a3 advanceToNextConversationWithDirection:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v7 = a3;
  unsigned __int8 v8 = [v7 referenceMessageListItem];
  id v9 = [(MessageListViewController *)self messageSelectionStrategy];
  id v10 = [v8 itemID];
  id v11 = [v9 itemIDToSelectFromItemID:v10 withDirection:v4];

  id v12 = +[MessageListViewController log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    int v16 = 138413058;
    int64_t v17 = v14;
    __int16 v18 = 2048;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v15;
    __int16 v22 = 2112;
    long long v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - next itemID:%@", (uint8_t *)&v16, 0x2Au);
  }
  [(MessageListViewController *)self deselectSelectedItemsInCollectionView];
  [(MessageListViewController *)self _handleDidSelectItemID:v11 referenceItem:0 scrollToVisible:1 userInitiated:1 animated:1];
}

- (BOOL)_shouldPopToMessageListViewControllerFromConversationViewController:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MessageListViewController *)self scene];
  if (([v5 isInExpandedEnvironment] & 1) != 0
    || ![v4 isFullyVisible])
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v6 = [v4 referenceMessageListItem];
    BOOL v7 = v6 == 0;
  }
  return v7;
}

- (void)conversationViewController:(id)a3 willRemoveAllVisibleMessagesWithItemIDs:(id)a4
{
  id v6 = a4;
  unsigned int v5 = [(MessageListViewController *)self scene];
  -[MessageListViewController _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:](self, "_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:", v6, [v5 isInExpandedEnvironment]);
}

- (void)conversationViewController:(id)a3 didRemoveAllVisibleMessagesWithItemIDs:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = [v9 referenceMessageListItem];
  unsigned __int8 v8 = [v7 itemID];

  if (!v8 || [v6 containsObject:v8]) {
    [(MessageListViewController *)self _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:v6 conversationViewController:v9];
  }
}

- (void)selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3
{
  id v5 = a3;
  id v4 = [(MessageListViewController *)self conversationViewController];
  [(MessageListViewController *)self _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:v5 conversationViewController:v4];
}

- (void)_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3 conversationViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(MessageListViewController *)self scene];
  -[MessageListViewController _selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:](self, "_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:showConversationView:", v6, [v8 isInExpandedEnvironment]);
  if ([(MessageListViewController *)self _shouldPopToMessageListViewControllerFromConversationViewController:v7])
  {
    id v9 = [(MessageListViewController *)self delegate];
    unsigned int v10 = [v9 isMessageListViewControllerVisible:self];

    if (v10)
    {
      id v11 = [v8 splitViewController];
      [v11 showMessageListViewController:1 animated:1 completion:0];
    }
    else
    {
      id v12 = +[MessageListViewController log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        id v15 = [(MessageListViewController *)self navigationController];
        int v16 = [v15 viewControllers];
        int v17 = 138412802;
        id v18 = v14;
        __int16 v19 = 2048;
        __int16 v20 = self;
        __int16 v21 = 2112;
        __int16 v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p>: didRemoveAllVisibleMessagesWithItemIDs navigationController.viewControllers:%@", (uint8_t *)&v17, 0x20u);
      }
    }
  }
}

- (void)_selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3 showConversationView:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [(MessageListViewController *)self messageSelectionStrategy];
  id v9 = [v8 itemIDToSelectAfterDeletedMessageItemIDs:v7];

  unsigned int v10 = +[MessageListViewController log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413570;
    int v16 = v12;
    __int16 v17 = 2048;
    id v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v13;
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 1024;
    BOOL v24 = v4;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - itemIDs:%@ showConversationView:%{BOOL}d nextItemID:%@", buf, 0x3Au);
  }
  LOBYTE(v14) = v4;
  [(MessageListViewController *)self _handleDidSelectItemID:v9 referenceItem:0 scrollToVisible:0 userInitiated:0 canRestoreDraft:1 animated:0 showConversationView:v14];
}

- (id)conversationViewController:(id)a3 messagesToActOnForReferenceMessage:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v6 messagesInMessageListItem:v5];

  return v7;
}

- (id)conversationViewController:(id)a3 messageListItemWithItemID:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v6 messageListItemForItemID:v5];

  return v7;
}

- (BOOL)conversationViewControllerShouldDismissOnDestructiveAction:(id)a3
{
  return 0;
}

- (BOOL)conversationViewControllerCanShowNoMessageSelectedView:(id)a3
{
  BOOL v4 = [(MessageListViewController *)self noContentView];
  id v5 = [v4 window];
  if (v5) {
    BOOL v6 = (*((unsigned char *)self + 8) & 1) == 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)conversationViewController:(id)a3 beginSearchWithSuggestion:(id)a4 scope:(id)a5
{
}

- (BOOL)conversationViewControllerAllowsCategorizationAction:(id)a3
{
  return [(MessageListViewController *)self isBucketBarHidden] ^ 1;
}

- (BOOL)shouldUseSelectionDataSourceForConversationViewController:(id)a3
{
  BOOL v4 = [(MessageListViewController *)self messageListSelectionModel];
  if (v4)
  {
    id v5 = [(MessageListViewController *)self scene];
    BOOL v6 = [v5 mf_rootViewController];
    id v7 = [v6 traitCollection];
    unsigned __int8 v8 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)messageListItemSelectionForConversationViewController:(id)a3
{
  id v3 = [(MessageListViewController *)self _messageListItemSelectionCreateIfNeeded:0];

  return v3;
}

- (void)conversationViewController:(id)a3 performTriageAction:(int64_t)a4 presentationSource:(id)a5
{
  id v7 = a5;
  if (a4 == 7)
  {
    sub_10015A740(self, v7);
  }
  else
  {
    unsigned __int8 v8 = +[MessageListViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10045BB64();
    }
  }
}

- (void)conversationViewController:(id)a3 didPerform:(BOOL)a4 triageInteraction:(id)a5
{
  id v6 = a5;
  if ([(MessageListViewController *)self isEditing])
  {
    [(MessageListViewController *)self setEditing:0 animated:1];
  }
  else if ([(MessageListViewController *)self _inMultiSelectionMode] {
         && [v6 isDestructive])
  }
  {
    sub_100154F70(self, 1);
  }
}

- (id)messageTriageInteractionHelperForConversationViewController:(id)a3
{
  id v3 = [(MessageListViewController *)self messageTriageInteractionHelper];

  return v3;
}

- (void)selectionModel:(id)a3 selectItemID:(id)a4
{
  id v8 = a4;
  id v5 = [(MessageListViewController *)self dataSource];
  id v6 = [v5 indexPathForItemIdentifier:v8];

  id v7 = [(MessageListViewController *)self collectionView];
  [v7 selectItemAtIndexPath:v6 animated:0 scrollPosition:0];
}

- (void)selectionModel:(id)a3 deselectItemID:(id)a4
{
  id v8 = a4;
  id v5 = [(MessageListViewController *)self dataSource];
  id v6 = [v5 indexPathForItemIdentifier:v8];

  id v7 = [(MessageListViewController *)self collectionView];
  [v7 deselectItemAtIndexPath:v6 animated:0];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  id v11 = [(MessageListViewController *)self dataSource];
  if (([(MessageListViewController *)self shouldDisplayGroupedSenders] & 1) != 0
    || ([v10 firstObject],
        id v12 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "sectionAtIndex:", objc_msgSend(v12, "section")),
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v14 = [v11 isMessagesSection:v13],
        v13,
        v12,
        (v14 & 1) == 0))
  {
    id v15 = 0;
  }
  else
  {
    if ([v10 count] == (id)1) {
      [v10 firstObject];
    }
    else {
    int v16 = [v9 indexPathForItemAtPoint:x, y];
    }
    if (v16) {
      goto LABEL_11;
    }
    __int16 v17 = +[MessageListViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      v34.double x = x;
      v34.double y = y;
      id v22 = NSStringFromCGPoint(v34);
      int v23 = 138413314;
      id v24 = v21;
      __int16 v25 = 2048;
      id v26 = self;
      __int16 v27 = 2112;
      unsigned int v28 = v22;
      __int16 v29 = 2048;
      id v30 = [v10 count];
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "<%@: %p> Failed to get orbed index path for point: %@, picking the first one from indexPaths (%lu): %@", (uint8_t *)&v23, 0x34u);
    }
    int v16 = [v10 firstObject];
    if (v16)
    {
LABEL_11:
      id v15 = [(MessageListViewController *)self _contextMenuConfigurationForIndexPaths:v10 orbedIndexPath:v16];
    }
    else
    {
      int v16 = +[MessageListViewController log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        objc_claimAutoreleasedReturnValue();
        sub_10045BBD8();
      }
      id v15 = 0;
    }
  }

  return v15;
}

- (id)_contextMenuConfigurationForIndexPaths:(id)a3 orbedIndexPath:(id)a4
{
  id v7 = a3;
  id v41 = a4;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_100164944;
  v54[3] = &unk_10060A0A8;
  v54[4] = self;
  BOOL v39 = v7;
  id v8 = [v7 ef_compactMap:v54];
  if (![v8 count])
  {
    id v38 = +[NSAssertionHandler currentHandler];
    [v38 handleFailureInMethod:a2, self, @"MessageListViewController.m", 5849, @"Failed to have itemIDs for provided indexPaths:%@", v7 object file lineNumber description];
  }
  if ([v8 count] == (id)1
    || ([(MessageListViewController *)self messageListSelectionModel],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 isSelectAll],
        v9,
        v10))
  {
    id v11 = [v8 firstObject];
    BOOL v12 = [(MessageListViewController *)self _shouldShowItemIDAsConversation:v11];

    int v13 = 1;
  }
  else
  {
    BOOL v12 = 0;
    int v13 = 0;
  }
  unsigned __int8 v14 = [(MessageListViewController *)self dataSource];
  id v15 = [v14 messageListItemAtIndexPath:v41];
  unsigned int v40 = [v15 result];

  if (v13)
  {
    int v16 = [(MessageListViewController *)self scene];
    __int16 v17 = [ConversationViewController alloc];
    id v18 = [(MessageListViewController *)self contactStore];
    __int16 v19 = [(MessageListViewController *)self avatarGenerator];
    __int16 v20 = [(ConversationViewController *)v17 initWithScene:v16 contactStore:v18 avatarGenerator:v19];

    [(ConversationViewControllerBase *)v20 setDelegate:self];
    [(ConversationViewControllerBase *)v20 setIsPrimary:1];
    [(ConversationViewController *)v20 setBeingPreviewed:1];
    id v21 = +[MessageListViewController log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = NSStringFromSelector(a2);
      int v23 = [v8 firstObject];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v22;
      __int16 v57 = 2112;
      uint64_t v58 = v20;
      __int16 v59 = 2112;
      __int16 v60 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", buf, 0x20u);
    }
    id v24 = [(MessageListViewController *)self searchController];
    -[ConversationViewControllerBase setMessagesShowSourceMailbox:](v20, "setMessagesShowSourceMailbox:", [v24 isActive]);

    __int16 v25 = [(MessageListViewController *)self dataSource];
    id v26 = [v25 messageListAtSectionIndex:[v41 section]];
    [(ConversationViewController *)v20 setReferenceMessageListItem:v40 referenceMessageList:v26 showAsConversation:v12 animated:1];

    [(MessageListViewController *)self setPreviewConversationViewController:v20];
  }
  else
  {
    __int16 v20 = 0;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v27 = v8;
  id v28 = [v27 countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v51;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v27);
        }
        [(MessageListViewController *)self reportEngagementAction:1 onItemID:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      id v28 = [v27 countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v28);
  }

  id v31 = v27;
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v20);
  id v32 = [v40 itemID];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_1001649CC;
  v47[3] = &unk_10060A3B0;
  objc_copyWeak(&v48, &location);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100164AAC;
  v42[3] = &unk_10060A3D8;
  objc_copyWeak(&v46, (id *)buf);
  id v43 = v31;
  id v33 = v43;
  id v44 = v33;
  id v34 = v40;
  id v45 = v34;
  BOOL v35 = +[UIContextMenuConfiguration configurationWithIdentifier:v32 previewProvider:v47 actionProvider:v42];

  CFStringRef v36 = [(MessageListViewController *)self messageListSelectionModel];
  [v35 setBadgeCount:[v36 count]];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v35;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [v8 identifier];
  id v11 = +[MessageListViewController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = NSStringFromSelector(a2);
    int v13 = [(MessageListViewController *)self previewConversationViewController];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v18 = 2112;
    __int16 v19 = v13;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", buf, 0x20u);
  }
  if (v10)
  {
    [(MessageListViewController *)self setPreviewConversationViewController:0];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100164DC8;
    v14[3] = &unk_100604C00;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v10;
    [v9 addAnimations:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = +[MessageListViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v10 = [(MessageListViewController *)self previewConversationViewController];
    id v11 = [v7 identifier];
    int v12 = 138412802;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a4;
  id v8 = +[MessageListViewController log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v10 = [(MessageListViewController *)self previewConversationViewController];
    id v11 = [v7 identifier];
    int v12 = 138412802;
    id v13 = v9;
    __int16 v14 = 2112;
    id v15 = v10;
    __int16 v16 = 2112;
    __int16 v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v12, 0x20u);
  }
  [(MessageListViewController *)self setPreviewConversationViewController:0];
}

- (id)_previewActionsForItemIDs:(id)a3 orbedItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageListViewController *)self messageListSelectionModel];
  if ([v8 isSelectAll])
  {

    id v9 = 0;
    goto LABEL_35;
  }
  id v9 = [v6 count];

  if (v9)
  {
    unsigned int v10 = [(MessageListViewController *)self dataSource];
    id v11 = [v10 messageListItemsForItemIDs:v6];
    int v12 = +[EFFuture combine:v11];
    id v13 = [v12 result];
    __int16 v14 = [v13 ef_filter:EFIsNotNull];

    if (![v14 count])
    {
      id v9 = 0;
LABEL_34:

      goto LABEL_35;
    }
    __int16 v60 = v14;
    unsigned int v58 = [v7 isEditable];
    unsigned int v55 = [v7 shouldArchiveByDefault];
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_100165D18;
    v76[3] = &unk_10060A400;
    v76[4] = self;
    id v15 = objc_retainBlock(v76);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_100165DE0;
    v75[3] = &unk_10060A428;
    v75[4] = self;
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100165EB4;
    v70[3] = &unk_10060A478;
    int64_t v54 = objc_retainBlock(v75);
    id v73 = v54;
    id v16 = v6;
    id v71 = v16;
    __int16 v57 = v15;
    id v74 = v57;
    id v72 = self;
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_1001661B0;
    v68[3] = &unk_10060A4A0;
    id v56 = objc_retainBlock(v70);
    id v69 = v56;
    __int16 v17 = objc_retainBlock(v68);
    uint64_t v62 = 0;
    __int16 v63 = &v62;
    uint64_t v64 = 0x3032000000;
    id v65 = sub_1001567C4;
    id v66 = sub_1001567D4;
    id v67 = (id)0xAAAAAAAAAAAAAAAALL;
    id v67 = +[NSMutableArray array];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1001661EC;
    v61[3] = &unk_10060A4C8;
    v61[4] = &v62;
    __int16 v18 = objc_retainBlock(v61);
    __int16 v19 = [v7 itemID];
    __int16 v59 = ((void (*)(void *, void *))v57[2])(v57, v19);

    if (v58)
    {
LABEL_22:
      if ((v55 & (v58 ^ 1)) != 0) {
        uint64_t v43 = 9;
      }
      else {
        uint64_t v43 = 8;
      }
      id v44 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, v43, v60, v59);
      ((void (*)(void *, void *))v18[2])(v18, v44);

      id v45 = [v7 senderList];
      id v46 = [v45 firstObject];

      if (v46)
      {
        id v47 = [(MessageListViewController *)self state];
        unsigned __int8 v48 = [v47 containsDraftsMailbox];

        if ((v48 & 1) == 0)
        {
          if ([v7 isBlocked]) {
            uint64_t v49 = 19;
          }
          else {
            uint64_t v49 = 18;
          }
          long long v50 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, v49, v60, v59);
          ((void (*)(void *, void *))v18[2])(v18, v50);
        }
      }
      if (sub_10015C374(self, v60))
      {
        long long v51 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 20, v60, v59);
        ((void (*)(void *, void *))v18[2])(v18, v51);
      }
      id v9 = (id)v63[5];

      _Block_object_dispose(&v62, 8);
      __int16 v14 = v60;
      goto LABEL_34;
    }
    if ([v16 count] == (id)1)
    {
      __int16 v20 = ((void (*)(void *, uint64_t, void *, void *, void))v56[2])(v56, 12, v14, v59, 0);
      ((void (*)(void *, void *))v18[2])(v18, v20);

      id v21 = ((void (*)(void *, uint64_t, void *, void *, void))v56[2])(v56, 13, v14, v59, 0);
      ((void (*)(void *, void *))v18[2])(v18, v21);

      id v22 = ((void (*)(void *, uint64_t, void *, void *, void))v56[2])(v56, 14, v14, v59, 0);
      ((void (*)(void *, void *))v18[2])(v18, v22);

      int v23 = +[UIMenu menuWithTitle:&stru_100619928 image:0 identifier:0 options:1 children:v63[5]];
      [v23 setPreferredElementSize:1];
      uint64_t v24 = +[NSMutableArray array];
      __int16 v25 = (void *)v63[5];
      v63[5] = v24;

      ((void (*)(void *, void *))v18[2])(v18, v23);
      uint64_t v26 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 17, v60, v59);
      id v27 = (void *)v26;
      if (v26)
      {
        uint64_t v77 = v26;
        id v28 = +[NSArray arrayWithObjects:&v77 count:1];
        uint64_t v29 = +[UIMenu menuWithTitle:&stru_100619928 image:0 identifier:0 options:1 children:v28];
        ((void (*)(void *, void *))v18[2])(v18, v29);
      }
    }
    id v30 = objc_alloc_init((Class)NSMutableArray);
    id v31 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 6, v60, v59);
    [v30 ef_addOptionalObject:v31];

    id v32 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 2, v60, v59);
    [v30 ef_addOptionalObject:v32];

    id v33 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 15, v60, v59);
    [v30 ef_addOptionalObject:v33];

    if ([v30 count] == (id)1)
    {
      id v34 = [v30 firstObject];
      ((void (*)(void *, void *))v18[2])(v18, v34);
    }
    else
    {
      if ((unint64_t)[v30 count] < 2) {
        goto LABEL_16;
      }
      id v34 = +[NSBundle mainBundle];
      long long v53 = [v34 localizedStringForKey:@"MARK_SUBMENU_TITLE" value:&stru_100619928 table:@"Main"];
      BOOL v35 = +[UIImage systemImageNamed:MFImageGlyphMarkElipsis];
      CFStringRef v36 = +[UIMenu menuWithTitle:v53 image:v35 identifier:0 options:0 children:v30];
      ((void (*)(void *, void *))v18[2])(v18, v36);
    }
LABEL_16:
    if (![(MessageListViewController *)self isSearchViewController]
      && +[EMInternalPreferences preferenceEnabled:59])
    {
      BOOL v37 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 22, v60, v59);
      ((void (*)(void *, void *))v18[2])(v18, v37);
    }
    id v38 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 10, v60, v59);
    ((void (*)(void *, void *))v18[2])(v18, v38);

    BOOL v39 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 11, v60, v59);
    ((void (*)(void *, void *))v18[2])(v18, v39);

    unsigned int v40 = [(MessageListViewController *)self state];
    unsigned __int8 v41 = [v40 containsSendLaterMailbox];

    if ((v41 & 1) == 0)
    {
      uint64_t v42 = ((void (*)(void *, uint64_t, void *, void *))v17[2])(v17, 7, v60, v59);
      ((void (*)(void *, void *))v18[2])(v18, v42);
    }
    goto LABEL_22;
  }
LABEL_35:

  return v9;
}

- (void)mailStatusViewControllerUndoButtonTapped:(id)a3
{
  BOOL v4 = +[UIApplication sharedApplication];
  id v5 = [v4 daemonInterface];
  id v6 = [v5 outgoingMessageRepository];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100166368;
  v7[3] = &unk_100604550;
  v7[4] = self;
  [v6 cancelLastDelayedMessage:v7];
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  if (a4 && EFProtectedDataAvailable())
  {
    id v13 = [(MessageListViewController *)self dataSource];
    [v13 reloadVisibleCellsInvalidatingCache:1];
  }
  else if ((unint64_t)(a3 - 1) <= 1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(MessageListViewController *)self collectionView];
    id v7 = [v6 preparedCells];

    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            int v12 = [v11 messageListItemFetchTimeoutCancelable];
            [v12 cancel];
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (id)_mailActionsViewDataSourceForMailActionsViewController:(id)a3 messageListItem:(id)a4 predictedMailbox:(id)a5 indexPath:(id)a6 cell:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  location[0] = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(location, v11);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001669E4;
  v29[3] = &unk_100605168;
  objc_copyWeak(&v31, location);
  void v29[4] = self;
  id v23 = v14;
  id v30 = v23;
  long long v15 = objc_retainBlock(v29);
  long long v16 = [MailActionsViewDataSource alloc];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100166C30;
  v24[3] = &unk_10060A510;
  v24[4] = self;
  id v17 = v11;
  id v25 = v17;
  __int16 v18 = v15;
  id v28 = v18;
  id v19 = v13;
  id v26 = v19;
  id v20 = v12;
  id v27 = v20;
  id v21 = [(MailActionsViewDataSource *)v16 initWithBuilderBlock:v24];

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);

  return v21;
}

- (void)mailActionsViewController:(id)a3 didSelectAction:(id)a4
{
  id v6 = a4;
  if (EMBlackPearlIsFeatureEnabled())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(MessageListViewController *)self diagnosticsHelper];
      [v5 setSource:1];
    }
  }
  [v6 executeHandlerIfEnabled];
}

- (id)_displayMetrics
{
  id v3 = [(MessageListViewController *)self conversationViewController];
  BOOL v4 = [v3 displayMetrics];

  if (v4)
  {
    id v5 = [(MessageListViewController *)self conversationViewController];
    id v6 = [v5 displayMetrics];
  }
  else
  {
    id v5 = [(MessageListViewController *)self traitCollection];
    id v7 = [(MessageListViewController *)self view];
    [v7 layoutMargins];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    long long v16 = [(MessageListViewController *)self view];
    [v16 safeAreaInsets];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    id v25 = [(MessageListViewController *)self scene];
    id v6 = +[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:", v5, [v25 interfaceOrientation], v9, v11, v13, v15, v18, v20, v22, v24);
  }

  return v6;
}

- (id)messageContentRepresentationRequestForMessageTriageInteractionHelper:(id)a3 message:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[MFMessageCompositionTriageInteraction compositionRepresentationRequestForMessage:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)messageListForMessageTriageInteractionHelper:(id)a3 messageListItem:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v5 itemID];
  double v8 = [v6 messageListForMessageListItemWithIdentifier:v7];

  return v8;
}

- (id)messageTriageInteractionHelper:(id)a3 senderRepositoryForMessageListItems:(id)a4
{
  id v4 = [(MessageListViewController *)self scene];
  id v5 = [v4 daemonInterface];
  id v6 = [v5 senderRepository];

  return v6;
}

- (int64_t)unreadBadgeCountForMessageTriageInteractionHelper:(id)a3
{
  id v3 = [(MessageListViewController *)self mailStatusObserver];
  id v4 = [v3 badgeCount];

  return (int64_t)v4;
}

- (id)moreTriageInteraction:(id)a3 actionsViewControllerWithInteractionTarget:(id)a4 didDismissHandler:(id)a5
{
  id v38 = a3;
  id v8 = a4;
  id v9 = a5;
  -[MessageListViewController setTriageInteractionTarget:](self, "setTriageInteractionTarget:", v8, v9, v8);
  double v10 = [(MessageListViewController *)self dataSource];
  double v11 = [v8 messageListItem];
  double v12 = [v11 itemID];
  uint64_t v13 = [v10 indexPathForItemIdentifier:v12];

  CFStringRef v36 = (void *)v13;
  double v14 = [(MessageListViewController *)self collectionView];
  double v15 = [v14 cellForItemAtIndexPath:v13];

  BOOL v35 = v15;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = [v15 cellHelper];
    id v33 = [v16 predictedMailbox];
  }
  else
  {
    id v33 = 0;
  }
  id v34 = [(MessageListViewController *)self _displayMetrics];
  BOOL v37 = [(MessageListViewController *)self _createMailActionViewHeader];
  double v17 = [ConversationCellViewModel alloc];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001677BC;
  v43[3] = &unk_100604F20;
  id v18 = v8;
  id v44 = v18;
  id v45 = self;
  double v19 = [(ConversationCellViewModel *)v17 initWithBuilder:v43];
  [v37 setViewModel:v19];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  double v20 = [MailActionsViewController alloc];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1001679B8;
  v39[3] = &unk_1006050A0;
  objc_copyWeak(&v41, &location);
  id v21 = v9;
  id v40 = v21;
  double v22 = [(MailActionsViewController *)v20 initWithDelegate:self messageHeaderView:v37 didDismissHandler:v39];
  id v23 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v22];
  [v23 setModalPresentationStyle:7];
  double v24 = [v23 presentationController];
  [v24 setDelegate:self];

  id v25 = [v38 presentationSource];
  if (objc_opt_respondsToSelector())
  {
    id v26 = [v23 popoverPresentationController];
    [v25 mui_setAsSourceWithExtendedRectForPopoverPresentationController:v26];
  }
  if (+[UIDevice mf_isPad])
  {
    [v34 mailActionCardPreferredHeightForPad];
    id v27 = [(MessageListViewController *)self traitCollection];
    id v28 = [v27 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v28);

    if (IsAccessibilityCategory) {
      [(MailActionsViewController *)v22 approximateHeightNeededForAccessibilityContentSizeCategory];
    }
    [(MailActionsViewController *)v22 preferredContentSize];
    [v23 setPreferredContentSize:];
  }
  id v30 = [v18 primaryMessage];
  id v31 = [(MessageListViewController *)self _mailActionsViewDataSourceForMailActionsViewController:v22 messageListItem:v30 predictedMailbox:v33 indexPath:v36 cell:v35];
  [(MailActionsViewController *)v22 setDataSource:v31];

  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

  return v23;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 presentedViewController];
    id v9 = [(MessageListViewController *)self _mailActionsViewControllerFromPresentedViewController:v8];

    if (v9)
    {
      id v10 = v7;
      [v10 _setShouldDismissWhenTappedOutside:1];
      double v11 = [(MessageListViewController *)self _displayMetrics];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100167C84;
      v16[3] = &unk_10060A538;
      id v17 = v9;
      id v12 = v11;
      id v18 = v12;
      uint64_t v13 = +[UISheetPresentationControllerDetent _detentWithIdentifier:@"MessageListViewControllerCustomMediumDetent" resolutionContextBlock:v16];
      v19[0] = v13;
      double v14 = +[UISheetPresentationControllerDetent largeDetent];
      v19[1] = v14;
      double v15 = +[NSArray arrayWithObjects:v19 count:2];
      [v10 setDetents:v15];
    }
  }
}

- (void)presentationControllerWillDismiss:(id)a3
{
  if (![(MessageListViewController *)self showingPopoverViewController])
  {
    id v5 = [(MessageListViewController *)self collectionView];
    id v4 = [(MessageListViewController *)self transitionCoordinator];
    [v5 mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator:v4 animated:1];
  }
}

- (id)_mailActionsViewControllerFromPresentedViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      goto LABEL_7;
    }
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (id)labelForStateCapture
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1001567C4;
  id v10 = sub_1001567D4;
  id v11 = 0;
  v2 = +[EFScheduler mainThreadScheduler];
  [v2 performSyncBlock:&v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)itemIDsForStateCaptureWithErrorString:(id *)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1001567C4;
  uint64_t v13 = sub_1001567D4;
  id v14 = 0;
  id v4 = +[EFScheduler mainThreadScheduler];
  [v4 performSyncBlock:&v8];

  uint64_t v5 = (void *)v10[5];
  if (v5)
  {
    if (a3)
    {
      *a3 = 0;
      uint64_t v5 = (void *)v10[5];
    }
    uint64_t v6 = [v5 itemIdentifiers];
  }
  else
  {
    uint64_t v6 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)parsecEventQueuePerformBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MessageListViewController *)self session];
  uint64_t v6 = [(MessageListViewController *)self parsecEventQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100168544;
  v9[3] = &unk_1006051E0;
  id v7 = v4;
  id v11 = v7;
  id v8 = v5;
  id v10 = v8;
  [v6 performBlock:v9];
}

- (void)reportEngagementAction:(int64_t)a3 onItemID:(id)a4
{
  id v6 = a4;
  if ([(MessageListViewController *)self isSearchViewController])
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100168624;
    v7[3] = &unk_10060A560;
    id v8 = v6;
    int64_t v9 = a3;
    [(MessageListViewController *)self parsecEventQueuePerformBlock:v7];
  }
}

- (void)currentFocusChanged:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v10 currentFocusChanged:v4];
  id v8 = self;
  id v5 = v4;
  id v9 = v5;
  id v6 = +[EFScheduler mainThreadScheduler];
  [v6 performSyncBlock:&v7];
}

- (BOOL)_allowSettingReadLaterAction
{
  if (_os_feature_enabled_impl())
  {
    return [(MessageListViewController *)self _allowReadLaterActions];
  }
  else
  {
    id v4 = [(MessageListViewController *)self state];
    if (([v4 isOutgoingMailbox] & 1) != 0
      || ![(MessageListViewController *)self _allowReadLaterActions])
    {
      unsigned __int8 v6 = 0;
    }
    else
    {
      id v5 = [(MessageListViewController *)self state];
      unsigned __int8 v6 = [v5 containsOnlyInboxScope];
    }
    return v6;
  }
}

- (BOOL)_allowReadLaterActions
{
  id v3 = [(MessageListViewController *)self state];
  unsigned int v4 = [v3 canShowReadLaterDate];

  if (v4) {
    return [(MessageListViewController *)self shouldDisplayGroupedSenders] ^ 1;
  }
  else {
    return 0;
  }
}

- (void)messageListDataSource:(id)a3 didConfigureSupplementaryView:(id)a4 elementKind:(id)a5 section:(id)a6
{
  id v36 = a4;
  id v9 = a5;
  id v10 = a6;
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && [v9 isEqualToString:UICollectionElementKindSectionHeader])
  {
    id v11 = [v10 section];
    id v12 = v11;
    if (v11 == (void *)MessageListSectionPriority)
    {
      unsigned int v13 = [v36 conformsToProtocol:&OBJC_PROTOCOL___MUIMessageListHighlightsSupplementaryView];

      if (v13)
      {
        id v14 = v36;
        double v15 = [(MessageListViewController *)self layoutValuesHelper];
        long long v16 = [v15 layoutValuesForStyle:0];

        id v17 = [(MessageListViewController *)self view];
        [v17 layoutMargins];
        double v19 = v18;

        double v20 = [(MessageListViewController *)self state];
        if ([v20 useSplitViewStyling])
        {
          id v21 = [(MessageListViewController *)self view];
          [v21 safeAreaInsets];
          double v19 = v19 - v22;
        }
        id v23 = [(MessageListViewController *)self view];
        [v23 directionalLayoutMargins];
        double v25 = v24;

        [v14 layoutMargins];
        double v27 = v26;
        [v14 layoutMargins];
        double v29 = v28;
        id v30 = [(MessageListViewController *)self highlightedMessages];
        id v31 = [(MessageListViewController *)self mailboxes];
        id v32 = [(MessageListViewController *)self contactStore];
        [v14 updateHighlightsSupplementaryViewMessages:v30 mailboxes:v31 cellLayoutValues:v16 containerInsets:v32 contactStore:self delegate:v27];

        [(MessageListViewController *)self setHighlightsSupplementaryView:v14];
        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  if (_os_feature_enabled_impl())
  {
    if ([v9 isEqualToString:UICollectionElementKindSectionFooter])
    {
      id v33 = [v10 section];
      id v34 = (void *)MessageListSectionIndexedSearch;

      if (v33 == v34)
      {
        id v35 = v36;
        long long v16 = [(MessageListViewController *)self indexStatus];
        [v35 updateWith:v16];
LABEL_14:
      }
    }
  }
}

- (BOOL)isIndexingMessagesForMessageListDataSource:(id)a3
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  unsigned int v4 = [(MessageListViewController *)self indexStatus];
  unsigned __int8 v5 = [v4 isVisible];

  return v5;
}

- (void)messageListSectionDataSource:(id)a3 handleRowSelectionAfterMovingMessagesWithItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageListViewController *)self itemIDToSelectAfterMoveID];
  [(MessageListViewController *)self setItemIDToSelectAfterMoveID:0];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100169138;
  v21[3] = &unk_10060A588;
  id v9 = v8;
  id v22 = v9;
  id v23 = self;
  id v10 = objc_retainBlock(v21);
  if (v9 && ([v7 containsObject:v9] & 1) != 0)
  {
    id v11 = [(MessageListViewController *)self dataSource];
    id v12 = [v6 section];
    unsigned int v13 = [v11 messageListItemForItemID:v9 section:v12];

    id v14 = +[EFScheduler mainThreadScheduler];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100169238;
    v18[3] = &unk_10060A5B0;
    id v15 = v9;
    id v19 = v15;
    double v20 = v10;
    [v13 onScheduler:v14 addSuccessBlock:v18];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001692CC;
    v16[3] = &unk_100604F70;
    id v17 = v15;
    [v13 addFailureBlock:v16];
  }
}

- (void)messageListSectionDataSource:(id)a3 deletedMessagesWithItemIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v8 messageListSectionDataSource:v6 deletedMessagesWithItemIdentifiers:v7];
  [(MessageListViewController *)self _removeMessagesFromStackWithItemIDs:v7];
  [(MessageListViewController *)self _exitMultiSelectionForce:0];
}

- (void)messageListSectionDataSource:(id)a3 addMessagesToStackWithItemIDs:(id)a4
{
}

- (void)showBlankCellAlertForMessageListSectionDataSource:(id)a3 itemID:(id)a4 indexPath:(id)a5 reason:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[NSDate now];
  unsigned int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\n\nitemID: %@\nindexPath: (%ld, %ld)", v11, v9, [v10 section], objc_msgSend(v10, "item"));
  id v14 = +[UIAlertController alertControllerWithTitle:@"Blank Cell Detected" message:v13 preferredStyle:1];

  id v15 = +[UIAlertAction actionWithTitle:@"Continue" style:1 handler:0];
  [v14 addAction:v15];

  if (+[MSRadarURLBuilder canOpenRadar])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001696C0;
    v17[3] = &unk_10060A620;
    id v18 = v11;
    id v19 = v12;
    id v20 = v9;
    id v21 = v10;
    long long v16 = +[UIAlertAction actionWithTitle:@"TTR" style:0 handler:v17];
    [v14 addAction:v16];
  }
  [(MessageListViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)learnMoreForMessageListSectionDataSource:(id)a3
{
  id v4 = +[MFPreferencesURL customizeNotificationURL];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 openSensitiveURL:v4 withOptions:0];
}

- (int64_t)selectionModel:(id)a3 countDeleteMovesToTrashForItemIDs:(id)a4
{
  return sub_100169AA4(self, a4, &stru_10060A660);
}

- (int64_t)selectionModel:(id)a3 countForItemIDs:(id)a4
{
  return sub_100169AA4(self, a4, &stru_10060A680);
}

- (int64_t)selectionModel:(id)a3 countShouldArchiveByDefaultForItemIDs:(id)a4
{
  return sub_100169AA4(self, a4, &stru_10060A6A0);
}

- (int64_t)selectionModel:(id)a3 countSupportsArchivingForItemIDs:(id)a4
{
  return sub_100169AA4(self, a4, &stru_10060A6C0);
}

- (BOOL)selectionModel:(id)a3 isItemIDExpandedThread:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v7 = [v6 isExpandedThread:v5];

  return v7;
}

- (BOOL)selectionModel:(id)a3 isThreadedItemID:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v7 = [v6 messageListItemForItemID:v5];
  objc_super v8 = [v7 result];
  BOOL v9 = (unint64_t)[v8 count] > 1;

  return v9;
}

- (id)selectionModel:(id)a3 itemIDsInExpandedThread:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v7 = [v6 itemIDsInExpandedThread:v5];

  return v7;
}

- (id)selectionModel:(id)a3 messageListItemsForItemIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  unsigned __int8 v7 = [v6 messageListItemsForItemIDs:v5];

  return v7;
}

- (id)selectionModel:(id)a3 objectIDsForItemIDs:(id)a4
{
  id v5 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10016A12C;
  v10[3] = &unk_10060A6E8;
  v10[4] = self;
  id v6 = [v5 ef_compactMap:v10];
  id v7 = [v5 count];
  if (v7 != [v6 count])
  {
    objc_super v8 = +[MessageListViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10045BD90();
    }
  }

  return v6;
}

- (id)selectionModel:(id)a3 threadItemIDForItemInExpandedThread:(id)a4
{
  id v5 = a4;
  id v6 = [(MessageListViewController *)self dataSource];
  id v7 = [v6 threadItemIDForItemInExpandedThread:v5];

  return v7;
}

- (id)selectionModel:(id)a3 predictMailboxForMovingMessagesWithIDs:(id)a4
{
  id v4 = +[MFMoveToPredictionTriageInteraction predictMailboxForMovingMessagesWithIDs:a4];

  return v4;
}

- (void)filterPickerViewModelDidChangeSelectedAccounts:(id)a3
{
  if ([(MessageListViewController *)self isFocusFilterEnabled])
  {
    [(MessageListViewController *)self setPrimitiveFocusFilterEnabled:0];
    id v4 = [(MessageListViewController *)self delegate];
    [v4 messageListViewControllerRequiresPaletteUpdate:self disableFocusFilter:1];

    [(MessageListViewController *)self _updateUnseenCountQueries];
  }
}

- (void)invalidateNavigationItem:(id)a3 forViewController:(id)a4
{
  id v5 = a3;
  [v5 setTitle:0];
  [v5 setSearchController:0];
  [v5 setRightBarButtonItems:0];
  [v5 setLeftBarButtonItems:0];
  [v5 setBackBarButtonItem:0];
  [v5 setBackButtonTitle:0];
  [(MessageListViewController *)self setNavigationItemToConfigure:0];
}

- (void)highlightedMessagesController:(id)a3 didFindMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(MessageListViewController *)self highlightedMessages];
  if (!v8)
  {
    unsigned int v12 = 1;
    goto LABEL_13;
  }
  BOOL v9 = [(MessageListViewController *)self highlightedMessages];
  unsigned int v10 = [v9 ef_isEmpty];
  if (v10 && (objc_msgSend(v7, "ef_notEmpty"), (id v11 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v12 = 1;
  }
  else
  {
    unsigned int v13 = [(MessageListViewController *)self highlightedMessages];
    id v14 = [v13 ef_notEmpty];
    if (v14) {
      unsigned int v12 = [v7 ef_isEmpty];
    }
    else {
      unsigned int v12 = 0;
    }

    if (!v10) {
      goto LABEL_12;
    }
    id v11 = 0;
  }

LABEL_12:
LABEL_13:

  v20.receiver = self;
  v20.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v20 highlightedMessagesController:v6 didFindMessages:v7];
  id v15 = [(MessageListViewController *)self highlightsSupplementaryView];
  long long v16 = [(MessageListViewController *)self mailboxes];
  [v15 updateHighlightsSupplementaryViewMessages:v7 mailboxes:v16];

  if (v12)
  {
    id v17 = +[MessageListViewController log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138543618;
      id v22 = v19;
      __int16 v23 = 2048;
      double v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Will invalidate prirority section supplementary view layout", buf, 0x16u);
    }
    [(MessageListViewController *)self updateHighlightsVisibility];
  }
}

- (void)highlightedMessagesViewDidSelectMessage:(id)a3
{
  id v7 = [a3 messageListItem];
  id v4 = [(MessageListViewController *)self highlightedMessagesController];
  id v5 = [v4 messageList];
  BYTE2(v6) = 1;
  LOWORD(v6) = 256;
  -[MessageListViewController _showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:](self, "_showConversationViewWithMessageListItem:itemID:messageList:referenceItem:scrollToVisible:userInitiated:canRestoreDraft:animated:showConversationView:indexPath:", v7, 0, v5, v7, 0, 1, v6, 0);
}

- (void)highlightedMessagesViewDidProvideFeedbackForMessage:(id)a3 feedbackType:(int64_t)a4 feedbackFeature:(int64_t)a5
{
  objc_super v8 = [a3 messageListItem];
  BOOL v9 = [v8 displayMessage];
  unsigned int v10 = [v9 result];

  if (a5)
  {
    if (a5 == 2)
    {
      +[MUICatchUpFeedbackController provideHighlightsFeedbackWithType:a4 message:v10 sourceViewController:self];
    }
    else
    {
      id v11 = +[MessageListViewController log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10045BDF8();
      }
    }
  }
  else
  {
    +[MUICatchUpFeedbackController provideAutomaticSummaryFeedbackWithType:a4 message:v10 sourceViewController:self];
  }
}

- (void)updateHighlightsVisibility
{
}

- (void)_invalidateCollectionLayoutForHighlights
{
  id v3 = [(MessageListViewController *)self collectionView];
  id v4 = [v3 collectionViewLayout];
  id v5 = [(MessageListViewController *)self highlightsSupplementaryView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 indexPathForSupplementaryView:v5], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = +[NSIndexPath indexPathWithIndex:0];
  }
  id v7 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  BOOL v9 = v6;
  objc_super v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v7 invalidateSupplementaryElementsOfKind:UICollectionElementKindSectionHeader atIndexPaths:v8];

  [v4 invalidateLayoutWithContext:v7];
}

- (void)_generativeModelsAvailabilityDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageListViewController;
  [(MessageListViewController *)&v5 _generativeModelsAvailabilityDidChange:v4];
  [(MessageListViewController *)self updateBarButtons];
  [(MessageListViewController *)self reloadDataSource];
}

- (BOOL)isCategorizationEnabledForOptionsView:(id)a3
{
  return [(MessageListViewController *)self isBucketBarHidden] ^ 1;
}

- (void)handleCategoriesTappedForOptionView:(id)a3
{
  if ([(MessageListViewController *)self isBucketBarHidden])
  {
    id v4 = +[MessageListViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Displaying bucket bar", v7, 2u);
    }

    [(MessageListViewController *)self _clearNavigationBarButtonItemMenu];
    objc_super v5 = [(MessageListViewController *)self bucketBarConfigurationController];
    uint64_t v6 = [(MessageListViewController *)self mailboxes];
    [v5 setBucketBarHidden:0 forMailboxes:v6];
  }
}

- (void)handleListViewTappedForOptionView:(id)a3
{
  if (([(MessageListViewController *)self isBucketBarHidden] & 1) == 0)
  {
    id v4 = +[MessageListViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Hiding bucket bar", v7, 2u);
    }

    [(MessageListViewController *)self _clearNavigationBarButtonItemMenu];
    objc_super v5 = [(MessageListViewController *)self bucketBarConfigurationController];
    uint64_t v6 = [(MessageListViewController *)self mailboxes];
    [v5 setBucketBarHidden:1 forMailboxes:v6];
  }
}

- (BOOL)messageListSeparatorController:(id)a3 hasHeaderInSectionAfterSection:(int64_t)a4
{
  objc_super v5 = [(MessageListViewController *)self dataSource];
  uint64_t v6 = [v5 sectionAfterIndex:a4];
  if (v6) {
    unsigned __int8 v7 = [v5 shouldDisplaySupplementaryKind:UICollectionElementKindSectionHeader forSectionAtIndex:[v5 sectionIndexForSection:v6]];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)_createMailActionViewHeader
{
  id v3 = [(MessageListViewController *)self _displayMetrics];
  +[MailActionViewHeader defaultHeightWithDisplayMetrics:v3];
  double v5 = v4;
  uint64_t v6 = [(MessageListViewController *)self view];
  [v6 frame];
  double Width = CGRectGetWidth(v13);

  objc_super v8 = -[MailActionViewHeader initWithFrame:]([MailActionViewHeader alloc], "initWithFrame:", 0.0, 0.0, Width, v5);
  BOOL v9 = [(MessageListViewController *)self contactStore];
  [(MFMessageConversationViewCell *)v8 setContactStore:v9];

  unsigned int v10 = +[MFMessageDisplayMetrics mf_actionCardMetricsFromDisplayMetrics:v3];
  [(MFConversationViewCell *)v8 setDisplayMetrics:v10];

  return v8;
}

- (id)actionViewHeaderForCategorizationInteraction:(id)a3 messageListItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MessageListViewController *)self _createMailActionViewHeader];
  unsigned __int8 v7 = +[NSBundle mainBundle];
  objc_super v8 = [v7 localizedStringForKey:@"MESSAGE_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
  BOOL v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, [v5 count]);

  unsigned int v10 = [ConversationCellViewModel alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v15[2] = sub_10016AFF8;
  v15[3] = &unk_100605078;
  id v11 = v5;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v18 = self;
  CGRect v13 = [(ConversationCellViewModel *)v10 initWithBuilder:v15];
  [v6 setViewModel:v13];

  return v6;
}

- (EMCollectionItemID)lastAutoSelectedItemID
{
  return self->_lastAutoSelectedItemID;
}

- (void)setLastAutoSelectedItemID:(id)a3
{
}

- (MessageListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MessageListViewControllerDelegate *)WeakRetained;
}

- (void)setConversationViewController:(id)a3
{
}

- (MailboxPickerDelegate)mailboxPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailboxPickerDelegate);

  return (MailboxPickerDelegate *)WeakRetained;
}

- (FavoritesShortcutsProvider)favoritesShortcutsProvider
{
  return self->_favoritesShortcutsProvider;
}

- (void)setFavoritesShortcutsProvider:(id)a3
{
}

- (id)updateScrollableHintBlock
{
  return self->_updateScrollableHintBlock;
}

- (UIViewController)tipPopoverController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tipPopoverController);

  return (UIViewController *)WeakRetained;
}

- (void)setTipPopoverController:(id)a3
{
}

- (void)setFilterButtonItem:(id)a3
{
}

- (EMCollectionItemID)loadingMessageItemID
{
  return self->_loadingMessageItemID;
}

- (void)setLoadingMessageItemID:(id)a3
{
}

- (MessageListSelectionModel)previousMessageListSelectionModel
{
  return self->_previousMessageListSelectionModel;
}

- (void)setMessageListDragDropHelper:(id)a3
{
}

- (NSArray)messageListItems
{
  return self->_messageListItems;
}

- (void)setMessageListItems:(id)a3
{
}

- (UIButton)composeAccessoryButton
{
  return self->_composeAccessoryButton;
}

- (void)setComposeAccessoryButton:(id)a3
{
}

- (UIButton)moreAccessoryButton
{
  return self->_moreAccessoryButton;
}

- (void)setMoreAccessoryButton:(id)a3
{
}

- (void)setFilterPickerButtonItem:(id)a3
{
}

- (void)setFilterPickerControl:(id)a3
{
}

- (void)setComposeButtonItem:(id)a3
{
}

- (UIBarButtonItem)searchEditButtonItem
{
  return self->_searchEditButtonItem;
}

- (void)setSearchEditButtonItem:(id)a3
{
}

- (NSArray)searchToolbarItems
{
  return self->_searchToolbarItems;
}

- (void)setSearchToolbarItems:(id)a3
{
}

- (NSArray)multiEditToolbarButtonItems
{
  return self->_multiEditToolbarButtonItems;
}

- (void)setMultiEditToolbarButtonItems:(id)a3
{
}

- (NSArray)searchMultiEditToolbarButtonItems
{
  return self->_searchMultiEditToolbarButtonItems;
}

- (void)setSearchMultiEditToolbarButtonItems:(id)a3
{
}

- (void)setDeleteButtonItem:(id)a3
{
}

- (void)setMoveButtonItem:(id)a3
{
}

- (void)setMarkButtonItem:(id)a3
{
}

- (void)setSelectAllButtonItem:(id)a3
{
}

- (void)setShelfButtonItem:(id)a3
{
}

- (void)setConfigureButtonItem:(id)a3
{
}

- (UIBarButtonItem)selectButtonItem
{
  return self->_selectButtonItem;
}

- (void)setSelectButtonItem:(id)a3
{
}

- (void)setShouldSelectInitialMessage:(BOOL)a3
{
  self->_shouldSelectInitialMessage = a3;
}

- (void)setNoContentView:(id)a3
{
}

- (ConversationViewController)previewConversationViewController
{
  return self->_previewConversationViewController;
}

- (void)setPreviewConversationViewController:(id)a3
{
}

- (void)setTransferStackViewController:(id)a3
{
}

- (void)setTransferController:(id)a3
{
}

- (void)setMailStatusViewController:(id)a3
{
}

- (void)setMailStatusObserver:(id)a3
{
}

- (CGPoint)lastScrolledContentOffset
{
  double x = self->_lastScrolledContentOffset.x;
  double y = self->_lastScrolledContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLastScrolledContentOffset:(CGPoint)a3
{
  self->_lastScrolledContentOffset = a3;
}

- (double)nextAvailableLoadMoreInterval
{
  return self->_nextAvailableLoadMoreInterval;
}

- (void)setNextAvailableLoadMoreInterval:(double)a3
{
  self->_nextAvailableLoadMoreInterval = a3;
}

- (NSMutableSet)resolvedMailboxObjectIDs
{
  return self->_resolvedMailboxObjectIDs;
}

- (EFFuture)stateRestorationFuture
{
  return self->_stateRestorationFuture;
}

- (void)setStateRestorationFuture:(id)a3
{
}

- (EFPromise)scrollItemIndexPathPromise
{
  return self->_scrollItemIndexPathPromise;
}

- (void)setScrollItemIndexPathPromise:(id)a3
{
}

- (void)setMessageTriageInteractionHelper:(id)a3
{
}

- (MFTriageInteractionTarget)triageInteractionTarget
{
  return self->_triageInteractionTarget;
}

- (void)setTriageInteractionTarget:(id)a3
{
}

- (EMCollectionItemIDStateCapturer)stateCapturer
{
  return self->_stateCapturer;
}

- (EFPromise)selectionPromise
{
  return self->_selectionPromise;
}

- (void)setSelectionPromise:(id)a3
{
}

- (void)setIsRefreshing:(id)a3
{
}

- (void)setSeparatorController:(id)a3
{
}

- (void)setHighlightsSupplementaryView:(id)a3
{
}

- (EFCancelable)shouldHideMessageListAvatarToken
{
  return self->_shouldHideMessageListAvatarToken;
}

- (EFCancelable)shouldShowCategorizationStatusToken
{
  return self->_shouldShowCategorizationStatusToken;
}

- (EFCancelable)scrollDigestToken
{
  return self->_scrollDigestToken;
}

- (void)setNavigationBarTitleView:(id)a3
{
}

- (int64_t)barButtonItemConfiguration
{
  return self->_barButtonItemConfiguration;
}

- (void)setBarButtonItemConfiguration:(int64_t)a3
{
  self->_barButtonItemConfiguration = a3;
}

- (NSString)currentUserTypedPhrase
{
  return self->_currentUserTypedPhrase;
}

- (void)setCurrentUserTypedPhrase:(id)a3
{
}

- (BOOL)disableAutoSelectionOfInitialMessage
{
  return self->_disableAutoSelectionOfInitialMessage;
}

- (void)setDisableAutoSelectionOfInitialMessage:(BOOL)a3
{
  self->_disableAutoSelectionOfInitialMessage = a3;
}

- (MSParsecSearchSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (EFScheduler)parsecEventQueue
{
  return self->_parsecEventQueue;
}

- (void)setParsecEventQueue:(id)a3
{
}

- (MUISearchIndexStatus)indexStatus
{
  return self->_indexStatus;
}

- (void)setIndexStatus:(id)a3
{
}

- (void)setScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_indexStatus, 0);
  objc_storeStrong((id *)&self->_parsecEventQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_currentUserTypedPhrase, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleView, 0);
  objc_storeStrong((id *)&self->_scrollDigestToken, 0);
  objc_storeStrong((id *)&self->_shouldShowCategorizationStatusToken, 0);
  objc_storeStrong((id *)&self->_shouldHideMessageListAvatarToken, 0);
  objc_destroyWeak((id *)&self->_highlightsSupplementaryView);
  objc_storeStrong((id *)&self->_separatorController, 0);
  objc_storeStrong((id *)&self->_isRefreshing, 0);
  objc_storeStrong((id *)&self->_selectionPromise, 0);
  objc_storeStrong((id *)&self->_searchMessagesInteraction, 0);
  objc_storeStrong((id *)&self->_changeFilterStateInteraction, 0);
  objc_storeStrong((id *)&self->_keyboardFocusedItemID, 0);
  objc_storeStrong((id *)&self->_stateCapturer, 0);
  objc_storeStrong((id *)&self->_triageInteractionTarget, 0);
  objc_storeStrong((id *)&self->_messageTriageInteractionHelper, 0);
  objc_storeStrong((id *)&self->_scrollItemIndexPathPromise, 0);
  objc_storeStrong((id *)&self->_stateRestorationFuture, 0);
  objc_storeStrong((id *)&self->_mailboxBrowseActivityPayload, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_resolvedMailboxObjectIDs, 0);
  objc_storeStrong((id *)&self->_mailStatusObserver, 0);
  objc_storeStrong((id *)&self->_mailStatusViewController, 0);
  objc_storeStrong((id *)&self->_messageListType, 0);
  objc_storeStrong((id *)&self->_transferController, 0);
  objc_storeStrong((id *)&self->_transferStackViewController, 0);
  objc_storeStrong((id *)&self->_previewConversationViewController, 0);
  objc_storeStrong((id *)&self->_messageListSearchViewController, 0);
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_selectButtonItem, 0);
  objc_storeStrong((id *)&self->_configureButtonItem, 0);
  objc_storeStrong((id *)&self->_shelfButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllButtonItem, 0);
  objc_storeStrong((id *)&self->_markButtonItem, 0);
  objc_storeStrong((id *)&self->_moveButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);
  objc_storeStrong((id *)&self->_searchMultiEditToolbarButtonItems, 0);
  objc_storeStrong((id *)&self->_multiEditToolbarButtonItems, 0);
  objc_storeStrong((id *)&self->_searchToolbarItems, 0);
  objc_storeStrong((id *)&self->_searchEditButtonItem, 0);
  objc_storeStrong((id *)&self->_multiEditButtonItem, 0);
  objc_storeStrong((id *)&self->_composeButtonItem, 0);
  objc_storeStrong((id *)&self->_navigationItemToConfigure, 0);
  objc_storeStrong((id *)&self->_filterPickerControl, 0);
  objc_storeStrong((id *)&self->_filterPickerButtonItem, 0);
  objc_storeStrong((id *)&self->_moreAccessoryButton, 0);
  objc_storeStrong((id *)&self->_composeAccessoryButton, 0);
  objc_storeStrong((id *)&self->_flattenedMailboxesFuture, 0);
  objc_storeStrong((id *)&self->_messageListItems, 0);
  objc_storeStrong((id *)&self->_messageListDragDropHelper, 0);
  objc_storeStrong((id *)&self->_previousMessageListSelectionModel, 0);
  objc_storeStrong((id *)&self->_loadingMessageItemID, 0);
  objc_storeStrong((id *)&self->_filterButtonItem, 0);
  objc_destroyWeak((id *)&self->_tipPopoverController);
  objc_storeStrong(&self->_updateScrollableHintBlock, 0);
  objc_storeStrong(&self->_scrollableHintBlock, 0);
  objc_storeStrong((id *)&self->_favoritesShortcutsProvider, 0);
  objc_destroyWeak((id *)&self->_mailboxPickerDelegate);
  objc_storeStrong((id *)&self->_conversationViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastAutoSelectedItemID, 0);
  objc_storeStrong((id *)&self->_lastSelectedItemID, 0);

  objc_storeStrong((id *)&self->_refreshControl, 0);
}

- (void)dismissTip
{
  swift_getObjectType();
  id v3 = self;
  MessageListViewController.dismissTip()();
}

@end