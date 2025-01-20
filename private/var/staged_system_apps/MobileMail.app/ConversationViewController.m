@interface ConversationViewController
+ (OS_os_log)log;
- (BOOL)_isDisplayingSingleMessage;
- (BOOL)_isItemInitiallyUnreadAtIndexPath:(id)a3;
- (BOOL)_isMessageInOutbox:(id)a3;
- (BOOL)_isQuickReplyMessageAtIndexPath:(id)a3;
- (BOOL)_isUndoSendMessageAtIndexPath:(id)a3;
- (BOOL)_shouldArchiveByDefault;
- (BOOL)_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:(id)a3;
- (BOOL)_shouldAutomaticallyMarkAsReadMessage:(id)a3;
- (BOOL)_shouldReloadEmptyMessageList;
- (BOOL)_shouldRemoveBannerBlock:(id)a3 forHeaderViewModel:(id)a4;
- (BOOL)_shouldShowMailboxForMessage:(id)a3;
- (BOOL)_shouldShowSummarizeControls:(id)a3;
- (BOOL)_shouldShowTimeSensitiveDescriptionForCategory:(unint64_t)a3;
- (BOOL)_shouldShowTimeSensitiveForMessage:(id)a3;
- (BOOL)_showQuickReplyBelowConversation;
- (BOOL)_userIsSenderAtIndexPath:(id)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)containsMessage:(id)a3;
- (BOOL)conversationSearchHandler:(id)a3 shouldConsiderQuotedContentForItemID:(id)a4;
- (BOOL)didAutoReloadDataSource;
- (BOOL)flagStateForFlagChangeTriageInteraction:(id)a3;
- (BOOL)isBucketSelected;
- (BOOL)isMessageListUnfiltered;
- (BOOL)isPerformingDataSourceUpdate;
- (BOOL)isSwappingMessageList;
- (BOOL)nextUpdateShouldAvoidAnimation;
- (BOOL)quickReplyHasContent;
- (BOOL)shouldBeginTextSearchOperation;
- (BOOL)shouldHideFollowUp;
- (BOOL)swipableCollectionViewLayout:(id)a3 shouldAnimateAppearingItemAtIndexPath:(id)a4;
- (CGRect)_quickReplyViewFrame;
- (ConversationViewController)initWithScene:(id)a3 contactStore:(id)a4 avatarGenerator:(id)a5;
- (ConversationViewControllerSelectionDataSource)selectionDataSource;
- (DraftGestureHelper)draftGestureHelper;
- (EFCancelable)blankConversationTailspinToken;
- (EFCancelable)diagnosticsHelperToken;
- (EFCancelable)groupedSenderUnreadCountToken;
- (EFCancelable)totalUnfilteredMessageCountToken;
- (EFCancelable)userDefaultsObserver;
- (EFCancelationToken)contentItemsCancelable;
- (EFFuture)predictedMailboxForConversation;
- (EFLRUCache)contentRequestCache;
- (EFScheduler)mailboxPredictionScheduler;
- (EFScheduler)messageLoadingScheduler;
- (EMCollectionItemID)displaySubjectItemID;
- (EMDiagnosticsHelper)diagnosticsHelper;
- (EMMailboxRepository)mailboxRepository;
- (EMMessage)selectedMessage;
- (EMMessageList)messageList;
- (EMMessageList)referenceMessageList;
- (EMMessageRepository)messageRepository;
- (EMQuery)groupedSenderUnreadCountQuery;
- (EMQuery)referenceMessageListQuery;
- (EMQuery)totalUnfilteredMessageCountQuery;
- (MFGeneratedSummaryCollectionItemID)inlineSummaryItemID;
- (MFGeneratedSummaryCollectionItemID)previousInlineSummaryItemID;
- (MFGeneratedSummaryCollectionItemID)previousTopSummaryItemID;
- (MFGeneratedSummaryCollectionItemID)topSummaryItemID;
- (MFMailComposeController)quickReplyMailComposeController;
- (MFPriorityLoadingQueue)contentRequestQueue;
- (MFTransferSplitViewController)transferController;
- (MessageListCollectionHelper)messageListCollectionHelper;
- (MessageTriageInteractionHelper)messageTriageInteractionHelper;
- (NSDate)lastSeenDate;
- (NSDate)lastSeenDisplayDate;
- (NSMapTable)delayedReadCancelables;
- (NSMutableDictionary)summaryContextByItemID;
- (NSMutableSet)disabledMarkAsReadMessageItemIDs;
- (NSMutableSet)expandedContentItemIDs;
- (NSMutableSet)initiallyUnreadItemIDs;
- (NSPredicate)categoryPredicate;
- (UICollectionViewDiffableDataSource)collectionViewDataSource;
- (UICollectionViewSupplementaryRegistration)quickReplyFooterSupplementaryRegistration;
- (UICollectionViewSupplementaryRegistration)quickReplyHeaderSupplementaryRegistration;
- (UITextRange)selectedTextRange;
- (_TtC10MobileMail25MFTimeSensitiveBannerView)timeSensitiveBannerView;
- (_UITextSearchAggregator)searchAggregator;
- (double)stickySubjectViewFirstBaselineForConversationHeaderView:(id)a3;
- (double)stickySubjectViewMaxYForConversationHeaderView:(id)a3;
- (id)_actionsViewControllerWithMessage:(id)a3 contentRequest:(id)a4 predictedMailbox:(id)a5 button:(id)a6 didDismissHandler:(id)a7;
- (id)_allMessages;
- (id)_archiveActionForMessageListItemSelection:(id)a3 menuOwner:(id)a4;
- (id)_cellForMessageItemIDIfExpanded:(id)a3;
- (id)_completionForFooterViewCardActionsForMailActionsViewController:(id)a3;
- (id)_completionForSwipeCardActionsForMailActionsViewController:(id)a3 messageListItem:(id)a4;
- (id)_contentRequestForMessageWithItemID:(id)a3;
- (id)_conversationViewQueryIncludeRelated:(BOOL)a3;
- (id)_createMailActionViewHeader;
- (id)_currentlyVisibleIndexPath;
- (id)_customReturnToGroupSenderList;
- (id)_deleteActionForMessageListItemSelection:(id)a3 menuOwner:(id)a4;
- (id)_dragItemsForItemAtIndexPath:(id)a3;
- (id)_excludedMailboxes;
- (id)_focusedMessageItemID;
- (id)_fullComposeViewControllerForQuickReply:(id)a3 userActivity:(id)a4;
- (id)_generateContentRequestForMessageWithItemID:(id)a3;
- (id)_getCurrentlySelectedMessageContentForMessageItemID:(id)a3;
- (id)_groupedSenderActionMenuItemsWithMenuOwner:(id)a3;
- (id)_indexPathForReferenceMessage;
- (id)_indexPathOfMessageViewControllerMessage:(id)a3;
- (id)_itemIDBeforeItemID:(id)a3 snapshot:(id)a4;
- (id)_itemIDsForReloadAfterInsertingObjectsAfterItemID:(id)a3 snapshot:(id)a4;
- (id)_mailActionsViewControllerFromPresentedViewController:(id)a3;
- (id)_mailActionsViewDataSourceForMailActionsViewController:(id)a3 message:(id)a4 predictedMailbox:(id)a5 preparation:(id)a6 completion:(id)a7;
- (id)_mailboxExclusionPredicate;
- (id)_manualSummaryContextForItemID:(id)a3;
- (id)_messageAtIndexPath:(id)a3;
- (id)_messageContentViewForMessageItemID:(id)a3;
- (id)_messageDeletionCompletionHandlerForMenuOwner:(id)a3;
- (id)_messageForItemID:(id)a3;
- (id)_messageFutureForConversationSubject;
- (id)_messageFutureForItemID:(id)a3;
- (id)_messageItemIDAtIndexPath:(id)a3;
- (id)_messageItemIDsFromShapshot:(id)a3;
- (id)_messageListItemsForBarButtonTriage;
- (id)_messageReadCompletionHandlerForSelectionDataSource:(id)a3;
- (id)_messagesForTriageInteraction:(id)a3;
- (id)_persistentIDForEMMessageObjectID:(id)a3;
- (id)_preparationForFooterViewCardActionsForMailActionsViewController:(id)a3;
- (id)_presentationStringForMessageListItem:(id)a3;
- (id)_priorityLoadingComparatorForPinnedItemID:(id)a3;
- (id)_queryForConversationViewIncludeRelated:(BOOL)a3;
- (id)_quickReplyCompositionContext;
- (id)_quickReplyView;
- (id)_readActionForMessageListItemSelection:(id)a3;
- (id)_readTriageInteraction;
- (id)_recategorizationMenu;
- (id)_referenceDisplayMessage;
- (id)_referenceMessageListMailboxScope;
- (id)_senderBasedQueryPredicateForReferenceMessageListQueryPredicate:(id)a3 shouldExcludeReadMessages:(BOOL)a4;
- (id)_sheetPresentationControllerViewForTouchContinuation:(id)a3;
- (id)_shouldRecalculateStickySubjectBeforeDeletedItemIDs:(id)a3;
- (id)_summarizableMessageItemIDsForSummaryItemID:(id)a3;
- (id)_swipeActionForTriageInteraction:(id)a3;
- (id)_targetMessageOrItemIDForBarButtonTriage:(BOOL)a3;
- (id)_updateQueue;
- (id)_visibleIndexPathForMessageViewController:(id)a3;
- (id)actionViewHeaderForCategorizationInteraction:(id)a3 messageListItem:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)animationControllerForTransition:(BOOL)a3;
- (id)captureRestorationState;
- (id)cellConfigurator:(id)a3 messageItemIDAtIndexPath:(id)a4;
- (id)conversationAttachmentURLsForConversationItemHeaderBlock:(id)a3;
- (id)conversationSearchHandler:(id)a3 contentRepresentationRequestForItemID:(id)a4;
- (id)conversationSearchMessageListForConversationSearchHandler:(id)a3;
- (id)deleteButtonMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4;
- (id)displayNameForAddresses:(id)a3;
- (id)focusedMessage;
- (id)groupedSenderActionMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4;
- (id)mailComposeViewForQuickReplyView:(id)a3;
- (id)messageContentRepresentationRequestForMessageTriageInteractionHelper:(id)a3 message:(id)a4;
- (id)messageCountHint;
- (id)messageListItemsForDiagnosticsHelper:(id)a3;
- (id)messageRepositoryForTriageInteraction:(id)a3;
- (id)messageSourceMailboxObjectIDForMessageViewController:(id)a3;
- (id)messageTriageInteractionHelper:(id)a3 senderRepositoryForMessageListItems:(id)a4;
- (id)messageViewControllerMessageListMailboxScope:(id)a3;
- (id)moreTriageInteraction:(id)a3 actionsViewControllerWithInteractionTarget:(id)a4 didDismissHandler:(id)a5;
- (id)newBackgroundMonitor;
- (id)pinnedIndexPathProvider;
- (id)presentingViewControllerForTriageInteraction:(id)a3;
- (id)richLinksInConversationForConversationItemHeaderBlock:(id)a3;
- (id)swipableCollectionViewLayout:(id)a3 leadingSwipeActionsConfigurationForItemAtIndexPath:(id)a4;
- (id)swipableCollectionViewLayout:(id)a3 trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a4;
- (id)targetMessageForBarButtonTriage;
- (id)targetMessageItemIDForBarButtonTriage;
- (id)transferStackViewController:(id)a3 displayMessageForMessageListItemWithItemID:(id)a4;
- (id)transferStackViewController:(id)a3 itemIDsToDisplayFromItemIDs:(id)a4;
- (id)undoManager;
- (int64_t)_dataOwnerForDragSessionAtIndexPath:(id)a3;
- (int64_t)_headerDisplayOptionsForCell:(id)a3 displayedAsSingleMessage:(BOOL)a4;
- (int64_t)_messageListItemCount;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (int64_t)compareOrderFromDocument:(id)a3 toDocument:(id)a4;
- (int64_t)countOfMessages;
- (int64_t)countOfSummaries;
- (unint64_t)_summarizableMessageCountForItemID:(id)a3;
- (unint64_t)groupedSenderUnreadCount;
- (void)_addOrUpdateTimeSensitiveBannerForExpandedCell:(id)a3;
- (void)_allMessageIDsWithCompletion:(id)a3;
- (void)_archiveShortcutInvoked:(id)a3;
- (void)_autoReloadDataSourceForEmptyAddIfNeeded;
- (void)_clearSelectedMessageContentForMessageItemID:(id)a3;
- (void)_configureCollapsedCell:(id)a3 atIndexPath:(id)a4 viewModel:(id)a5;
- (void)_configureExpandedCell:(id)a3 atIndexPath:(id)a4 viewModel:(id)a5 collapseQuotedContent:(BOOL)a6;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_decorateFoundRanges:(id)a3 inExpandedCell:(id)a4;
- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 completionHandler:(id)a5;
- (void)_deleteMessageCommandInvoked:(id)a3;
- (void)_deleteMessageListItemsForMoveOrDestructiveInteraction:(id)a3 completion:(id)a4;
- (void)_didChangeHorizontalPadding:(double)a3;
- (void)_didTapRevealActionsButton:(id)a3 message:(id)a4 predictedMailbox:(id)a5 contentRequest:(id)a6 didDismissHandler:(id)a7;
- (void)_didTapUndoSendButton:(id)a3 message:(id)a4 predictedMailbox:(id)a5 contentRequest:(id)a6 didDismissHandler:(id)a7;
- (void)_dismissKeyboardIfNecessary;
- (void)_doDeleteSelectedMessagesAskingConfirmation:(BOOL)a3 presentationSourceButtonItem:(id)a4 forceArchive:(BOOL)a5;
- (void)_ensureSubjectViewLayoutIfNeededAtIndexPath:(id)a3;
- (void)_fetchConversationAttachmentDataWithCompletion:(id)a3;
- (void)_fetchConversationRichLinkDataWithCompletion:(id)a3;
- (void)_flagCommandInvoked:(id)a3;
- (void)_forwardCommandInvoked:(id)a3;
- (void)_generativeModelsAvailabilityDidChange:(id)a3;
- (void)_groupedSenderMessageCountForQuery:(id)a3 completionHandler:(id)a4;
- (void)_headerView:(id)a3 displayWithBannerForViewModel:(id)a4;
- (void)_hideSeeMoreButtonForCell:(id)a3;
- (void)_markAsJunkCommandInvoked:(id)a3;
- (void)_markAsReadCommandInvoked:(id)a3;
- (void)_messageSearchEnded;
- (void)_messageViewControllerDidDisplayContent:(id)a3;
- (void)_nts_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completion:(id)a6;
- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5;
- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completion:(id)a6;
- (void)_presentMailActionsViewControllerFromBarButtonItem:(id)a3 dataSourceClass:(id)a4 includeMessageContentRequest:(BOOL)a5 completionHandler:(id)a6;
- (void)_presentationControllerWillDismiss:(id)a3;
- (void)_printCommandInvoked:(id)a3;
- (void)_recalculateStickySubjectForDeletedIndexPath:(id)a3;
- (void)_reloadCellsAtIndexPaths:(id)a3 animated:(BOOL)a4;
- (void)_reloadDataSource;
- (void)_reloadDataSourceWithMessageList:(id)a3;
- (void)_reloadTopSummaryIfNecessary;
- (void)_removeTimeSensitiveBannerFromExpandedCell:(id)a3;
- (void)_replyAllCommandInvoked:(id)a3;
- (void)_replyCommandInvoked:(id)a3;
- (void)_resetContentRequest;
- (void)_resetManualSummaryItemIDs;
- (void)_resetQuickReplyViewControllerWithReason:(int64_t)a3 resetCompose:(BOOL)a4 override:(BOOL)a5;
- (void)_runAlongsideAnimationsForTransition:(BOOL)a3;
- (void)_scrollToInitialPosition;
- (void)_scrollToRect:(CGRect)a3 forMessageContentView:(id)a4;
- (void)_scrolledToEndOfSingleMessage;
- (void)_setupQuickReplySupplementaryViewProvider;
- (void)_showSingleMessage:(id)a3 animationOffset:(CGPoint)a4 initialScrollOffset:(CGPoint)a5;
- (void)_startObservingSelectedBucketChangeNotification;
- (void)_stopTextFindingIfNecessary;
- (void)_testReplyForSelectedMessage;
- (void)_updateBarButtonsEnabled;
- (void)_updateFooterToShowUndoSendForCell:(id)a3;
- (void)_updateFooterViewFrameForCell:(id)a3;
- (void)_updateFooterViewFrameForCell:(id)a3 atIndexPath:(id)a4;
- (void)_updateFooterViewFrameForVisibleCells;
- (void)_updateForDataSourceChanges:(BOOL)a3;
- (void)_updateGestureForMessageListItem:(id)a3;
- (void)_updateGroupedSenderMessageCountQueries;
- (void)_updateHandoffWithMessageAtIndexPath:(id)a3;
- (void)_updateInitiallyUnreadItemIDs:(id)a3;
- (void)_updatePredictedMailboxForConversation;
- (void)_updateQuickReplyLabelIfNeeded;
- (void)_updateQuickReplyLabelIfNeeded:(id)a3;
- (void)_updateQuickReplySendButtonOffset:(id)a3;
- (void)_updateQuickReplyState;
- (void)_updateStickySubjectForItemID:(id)a3 cell:(id)a4 indexPath:(id)a5;
- (void)_updateSubject;
- (void)_updateTimeSensitiveBanners;
- (void)_updateTimeSensitiveDefaultForCategory:(unint64_t)a3;
- (void)bannerViewDidSelectEditButton:(id)a3 itemID:(id)a4;
- (void)cancelAutomaticMarkAsReadForCellViewModel:(id)a3;
- (void)cellConfigurator:(id)a3 wantsToReloadCellAtIndexPaths:(id)a4 animated:(BOOL)a5;
- (void)clearAllDecoratedFoundText;
- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7;
- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7;
- (void)collection:(id)a3 changedItemIDs:(id)a4;
- (void)collection:(id)a3 deletedItemIDs:(id)a4;
- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5;
- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5;
- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5;
- (void)collectionDidFinishInitialLoad:(id)a3;
- (void)configurePredictedMailboxForCell:(id)a3 forMessage:(id)a4;
- (void)conversationNavigationBarItemsManager:(id)a3 validateBarButtonItem:(id)a4 ofType:(int64_t)a5;
- (void)customBackButtonTapped:(id)a3;
- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4;
- (void)datePickerViewControllerDidDeleteDate:(id)a3;
- (void)dealloc;
- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(unint64_t)a5;
- (void)deleteButtonTapped:(id)a3;
- (void)didBeginTextSearchOperation;
- (void)didEndTextSearchOperation;
- (void)disableAutomaticMarkAsReadForMessages:(id)a3;
- (void)find:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)flagButtonTapped:(id)a3;
- (void)forwardButtonTapped:(id)a3;
- (void)groupedSenderMessageCountForDestructiveTriageInteraction:(id)a3 completionHandler:(id)a4;
- (void)invalidateAutomaticMarkAsReadForAllMessages;
- (void)junkButtonTapped:(id)a3;
- (void)laterButtonTapped:(id)a3;
- (void)loadView;
- (void)mailActionsViewController:(id)a3 didSelectAction:(id)a4;
- (void)mailComposeController:(id)a3 composeBodyIsEmpty:(BOOL)a4;
- (void)mailComposeController:(id)a3 didChangeQuickReplyWebViewHeight:(double)a4;
- (void)mailComposeController:(id)a3 isSending:(BOOL)a4;
- (void)mailComposeController:(id)a3 migrateToFullCompose:(id)a4;
- (void)mailComposeController:(id)a3 willMigrateToFullComposeWithReason:(int64_t)a4;
- (void)mailComposeViewSnapshotForQuickReplyView:(id)a3 :(id)a4;
- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5;
- (void)messageViewController:(id)a3 didStartDownloadForContentItemWithProgress:(id)a4;
- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4;
- (void)messageViewController:(id)a3 didTapShowMoreAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5;
- (void)messageViewController:(id)a3 didTapUndoSendButton:(id)a4;
- (void)messageViewController:(id)a3 scrollToRect:(CGRect)a4;
- (void)moveButtonTapped:(id)a3;
- (void)muteButtonTapped:(id)a3;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)pinCurrentItem;
- (void)pinItemAtIndexPath:(id)a3 dynamicOffset:(id)a4;
- (void)populateSummaryItemForSnapshot:(id)a3;
- (void)presentTransferUIWithMoveInteraction:(id)a3 prediction:(id)a4 fromViewController:(id)a5 didDismissHandler:(id)a6;
- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)quickReplyView:(id)a3 didTapExpandButton:(id)a4;
- (void)quickReplyView:(id)a3 didTapSendButton:(id)a4 animationContext:(id)a5;
- (void)readButtonTapped:(id)a3;
- (void)reenableAutomaticMarkAsReadForAllMessages;
- (void)replyAllButtonTapped:(id)a3;
- (void)replyButtonTapped:(id)a3;
- (void)restoreState:(id)a3;
- (void)revealActionsButtonTapped:(id)a3;
- (void)scheduleAutomaticMarkAsReadForMessage:(id)a3;
- (void)scheduleAutomaticMarkAsReadForReferenceMessage;
- (void)scheduleAutomaticMarkAsReadForViewModel:(id)a3;
- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4;
- (void)scrollToMessageIfPossible:(id)a3 animated:(BOOL)a4 pin:(BOOL)a5;
- (void)scrollToMessageItemIDIfPossible:(id)a3 animated:(BOOL)a4 pin:(BOOL)a5;
- (void)searchMessages:(id)a3;
- (void)setBeingPreviewed:(BOOL)a3;
- (void)setBlankConversationTailspinToken:(id)a3;
- (void)setCategoryPredicate:(id)a3;
- (void)setCollectionViewDataSource:(id)a3;
- (void)setContentItemsCancelable:(id)a3;
- (void)setContentRequestCache:(id)a3;
- (void)setContentRequestQueue:(id)a3;
- (void)setConversationSortOrder:(unint64_t)a3;
- (void)setDelayedReadCancelables:(id)a3;
- (void)setDiagnosticsHelper:(id)a3;
- (void)setDiagnosticsHelperToken:(id)a3;
- (void)setDidAutoReloadDataSource:(BOOL)a3;
- (void)setDisabledMarkAsReadMessageItemIDs:(id)a3;
- (void)setDisplaySubjectItemID:(id)a3;
- (void)setDraftGestureHelper:(id)a3;
- (void)setExpandedContentItemIDs:(id)a3;
- (void)setGroupedSenderUnreadCount:(unint64_t)a3;
- (void)setGroupedSenderUnreadCountQuery:(id)a3;
- (void)setGroupedSenderUnreadCountToken:(id)a3;
- (void)setHideFollowUp:(BOOL)a3;
- (void)setInitiallyUnreadItemIDs:(id)a3;
- (void)setInlineSummaryItemID:(id)a3;
- (void)setIsPerformingDataSourceUpdate:(BOOL)a3;
- (void)setLastSeenDate:(id)a3;
- (void)setLastSeenDisplayDate:(id)a3;
- (void)setMailboxPredictionScheduler:(id)a3;
- (void)setMailboxRepository:(id)a3;
- (void)setMessageList:(id)a3;
- (void)setMessageListCollectionHelper:(id)a3;
- (void)setMessageLoadingScheduler:(id)a3;
- (void)setMessageRepository:(id)a3;
- (void)setMessageTriageInteractionHelper:(id)a3;
- (void)setNextUpdateShouldAvoidAnimation:(BOOL)a3;
- (void)setPinnedIndexPathProvider:(id)a3;
- (void)setPinnedItem:(id)a3;
- (void)setPredictedMailboxForConversation:(id)a3;
- (void)setPreviousInlineSummaryItemID:(id)a3;
- (void)setPreviousTopSummaryItemID:(id)a3;
- (void)setQuickReplyFooterSupplementaryRegistration:(id)a3;
- (void)setQuickReplyHasContent:(BOOL)a3;
- (void)setQuickReplyHeaderSupplementaryRegistration:(id)a3;
- (void)setQuickReplyMailComposeController:(id)a3;
- (void)setReferenceMessageList:(id)a3;
- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6;
- (void)setSearchAggregator:(id)a3;
- (void)setSelectedMessage:(id)a3;
- (void)setSelectionDataSource:(id)a3;
- (void)setSummaryContextByItemID:(id)a3;
- (void)setSwappingMessageList:(BOOL)a3;
- (void)setTimeSensitiveBannerView:(id)a3;
- (void)setTopSummaryItemID:(id)a3;
- (void)setTotalUnfilteredMessageCountQuery:(id)a3;
- (void)setTotalUnfilteredMessageCountToken:(id)a3;
- (void)setTransferController:(id)a3;
- (void)setUserDefaultsObserver:(id)a3;
- (void)showAllMessagesForConversationSenderHeaderView:(id)a3;
- (void)showCategoryMessagesForConversationSenderHeaderView:(id)a3;
- (void)summaryCell:(id)a3 withItemID:(id)a4 didLayoutWithHeight:(double)a5;
- (void)summaryCell:(id)a3 withItemID:(id)a4 wantsToDisplayAlert:(id)a5;
- (void)swipableCollectionViewLayout:(id)a3 willBeginSwipeAtIndexPath:(id)a4;
- (void)swipableCollectionViewLayout:(void *)a1 willEndSwipeForItemAtIndexPath:;
- (void)traitCollectionDidChange:(id)a3;
- (void)unreadButtonTapped:(id)a3;
- (void)updateAvatarViewControllerForTriageInteraction:(id)a3 alertController:(id)a4;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ConversationViewController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000976C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006993F0 != -1) {
    dispatch_once(&qword_1006993F0, block);
  }
  v2 = (void *)qword_1006993E8;

  return (OS_os_log *)v2;
}

- (void)_updateTimeSensitiveBanners
{
  v3 = [(ConversationViewControllerBase *)self cellConfigurator];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006C820;
  v4[3] = &unk_100604A58;
  v4[4] = self;
  [v3 enumerateExpandedCellsWithBlock:v4];
}

- (void)setDiagnosticsHelper:(id)a3
{
  id v7 = a3;
  if (*(id *)((char *)&self->_diagnosticsHelper + 4) != v7)
  {
    v5 = [(ConversationViewController *)self diagnosticsHelperToken];
    [v5 cancel];

    objc_storeStrong((id *)((char *)&self->_diagnosticsHelper + 4), a3);
    v6 = [v7 registerDiagnosticFileProvider:self];
    [(ConversationViewController *)self setDiagnosticsHelperToken:v6];
  }
}

- (void)_startObservingSelectedBucketChangeNotification
{
  v3 = +[ConversationViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start observing selected bucket change notification.", v6, 2u);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  v5 = [(ConversationViewControllerBase *)self delegate];
  [v4 addObserver:self selector:"_updateTimeSensitiveBanners" name:SelectedBucketDidChangeNotification object:v5];
}

- (id)_priorityLoadingComparatorForPinnedItemID:(id)a3
{
  id v4 = a3;
  [(ConversationViewController *)self collectionViewDataSource];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100071A54;
  v20[3] = &unk_100604CF0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v5;
  v6 = objc_retainBlock(v20);
  id v7 = v6;
  if (v4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100071A88;
    v17[3] = &unk_100604D18;
    v19 = v6;
    id v18 = v4;
    v8 = +[EFFuture lazyFutureWithBlock:v17];
  }
  else
  {
    v8 = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100071B00;
  v14[3] = &unk_100604D40;
  id v15 = v8;
  id v16 = v7;
  id v9 = v8;
  id v10 = v7;
  v11 = objc_retainBlock(v14);
  v12 = objc_retainBlock(v11);

  return v12;
}

- (void)loadView
{
  v14.receiver = self;
  v14.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v14 loadView];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10006D8B8;
  v11 = &unk_100604B88;
  objc_copyWeak(&v12, &location);
  v3 = objc_retainBlock(&v8);
  id v4 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  id v5 = [(ConversationViewControllerBase *)self collectionView];
  id v6 = [v4 initWithCollectionView:v5 cellProvider:v3];
  [(ConversationViewController *)self setCollectionViewDataSource:v6];

  if ([(ConversationViewControllerBase *)self allowQuickReply]) {
    [(ConversationViewController *)self _setupQuickReplySupplementaryViewProvider];
  }
  id v7 = [(ConversationViewControllerBase *)self conversationLayout];
  [v7 setSwipeDelegate:self];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (BOOL)_isDisplayingSingleMessage
{
  return ![(ConversationViewControllerBase *)self shownAsConversation]
      || (id)[(ConversationViewController *)self countOfMessages] == (id)1;
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (void)setDiagnosticsHelperToken:(id)a3
{
}

- (void)setCollectionViewDataSource:(id)a3
{
}

- (EFCancelable)diagnosticsHelperToken
{
  return *(EFCancelable **)((char *)&self->_diagnosticsHelperToken + 4);
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return *(UICollectionViewDiffableDataSource **)((char *)&self->_collectionViewDataSource + 4);
}

- (void)_addOrUpdateTimeSensitiveBannerForExpandedCell:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"ConversationViewController+TimeSensitiveBanner-BlackPearlUI.m" lineNumber:37 description:@"Current thread must be main"];
  }
  id v6 = [v5 viewModel];
  id v7 = [v6 messageContentRequest];
  v8 = [v7 message];
  uint64_t v9 = [v8 category];
  id v10 = [v9 type];

  v11 = [v5 messageViewController];
  id v12 = [v11 messageContentView];
  v13 = [v12 headerView];
  objc_super v14 = [v13 headerBlocks];
  [v14 ef_firstObjectPassingTest:&stru_100604A98];
  id v15 = (_TtC10MobileMail25MFTimeSensitiveBannerView *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    id v16 = +[ConversationViewController log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating time-sensitive banner: %@", (uint8_t *)&v26, 0xCu);
    }

    [(MFTimeSensitiveBannerView *)v15 updateCategoryWithCategory:v10];
    v17 = v15;
  }
  else
  {
    v17 = [[_TtC10MobileMail25MFTimeSensitiveBannerView alloc] initWithCategory:v10 showDescription:[(ConversationViewController *)self _shouldShowTimeSensitiveDescriptionForCategory:v10]];
    id v18 = +[ConversationViewController log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Adding time-sensitive banner: %@", (uint8_t *)&v26, 0xCu);
    }

    v19 = [v5 messageViewController];
    v20 = [v19 messageContentView];
    id v21 = [v20 headerView];
    [v21 insertHeaderBlock:v17 atIndex:0 animated:1];

    v22 = [v5 messageViewController];
    v23 = [v22 messageContentView];
    v24 = [v23 headerView];
    [v24 setPinnedBlock:v17];

    [(ConversationViewController *)self _updateTimeSensitiveDefaultForCategory:v10];
    [(ConversationViewController *)self setTimeSensitiveBannerView:v17];
  }
}

- (void)_removeTimeSensitiveBannerFromExpandedCell:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    id v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"ConversationViewController+TimeSensitiveBanner-BlackPearlUI.m" lineNumber:56 description:@"Current thread must be main"];
  }
  id v6 = [v5 messageViewController];
  id v7 = [v6 messageContentView];
  v8 = [v7 headerView];
  uint64_t v9 = [v8 headerBlocks];
  id v10 = [v9 ef_firstObjectPassingTest:&stru_100604AB8];

  if (v10)
  {
    v11 = +[ConversationViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing time-sensitive banner: %@", (uint8_t *)&v16, 0xCu);
    }

    id v12 = [v5 messageViewController];
    v13 = [v12 messageContentView];
    objc_super v14 = [v13 headerView];
    [v14 removeHeaderBlock:v10 animated:1];

    [(ConversationViewController *)self setTimeSensitiveBannerView:0];
  }
}

- (ConversationViewController)initWithScene:(id)a3 contactStore:(id)a4 avatarGenerator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v44.receiver = self;
  v44.super_class = (Class)ConversationViewController;
  v11 = [(ConversationViewControllerBase *)&v44 initWithScene:v8 contactStore:v9 avatarGenerator:v10];
  if (v11)
  {
    id v12 = [v8 daemonInterface];
    uint64_t v13 = [v12 messageRepository];
    objc_super v14 = *(void **)(v11 + 516);
    *(void *)(v11 + 516) = v13;

    id v15 = [v8 daemonInterface];
    uint64_t v16 = [v15 mailboxRepository];
    v17 = *(void **)(v11 + 524);
    *(void *)(v11 + 524) = v16;

    id v18 = [objc_alloc((Class)MessageListCollectionHelper) initWithLoggableClient:v11 updateQueueName:@"com.apple.mobilemail.ConversationViewController.collectionViewUpdate" sectionObjectID:0];
    v19 = *(void **)(v11 + 548);
    *(void *)(v11 + 548) = v18;

    id v20 = [objc_alloc((Class)EFLRUCache) initWithCapacity:50];
    id v21 = *(void **)(v11 + 556);
    *(void *)(v11 + 556) = v20;

    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      uint64_t v22 = objc_opt_new();
      v23 = *(void **)(v11 + 772);
      *(void *)(v11 + 772) = v22;
    }
    v24 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.loadingQueue" qualityOfService:25];
    uint64_t v25 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.mailboxPrediction" qualityOfService:17];
    int v26 = *(void **)(v11 + 668);
    *(void *)(v11 + 668) = v25;

    uint64_t v27 = +[EFScheduler serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.conversationViewController.messageLoading" qualityOfService:25];
    v28 = *(void **)(v11 + 676);
    *(void *)(v11 + 676) = v27;

    v29 = [[MFPriorityLoadingQueue alloc] initWithScheduler:v24];
    v30 = *(void **)(v11 + 572);
    *(void *)(v11 + 572) = v29;

    [*(id *)(v11 + 572) setItemHandler:&stru_100604AF8];
    v31 = [v11 _priorityLoadingComparatorForPinnedItemID:0];
    [*(id *)(v11 + 572) setComparator:v31];

    v32 = objc_opt_new();
    [v32 setSearchableObject:v11];
    sub_10005A08C((uint64_t)v11, v32);
    v33 = +[NSUserDefaults em_userDefaults];
    uint64_t v34 = EMUserDefaultDisableFollowUp;
    [v11 setHideFollowUp:[v33 BOOLForKey:EMUserDefaultDisableFollowUp]];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10006D640;
    v40[3] = &unk_100604B20;
    objc_copyWeak(&v42, &location);
    id v35 = v33;
    id v41 = v35;
    uint64_t v36 = [v35 ef_observeKeyPath:v34 options:1 autoCancelToken:1 usingBlock:v40];
    v37 = *(void **)(v11 + 700);
    *(void *)(v11 + 700) = v36;

    if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
    {
      v38 = +[NSNotificationCenter defaultCenter];
      [v38 addObserver:v11 selector:"_generativeModelsAvailabilityDidChange:" name:EMGenerativeModelsAvailabilityDidChange object:0];
    }
    [v11 _startObservingSelectedBucketChangeNotification];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  return (ConversationViewController *)v11;
}

- (void)dealloc
{
  v3 = [(ConversationViewController *)self contentItemsCancelable];
  [v3 cancel];

  id v4 = [(ConversationViewController *)self predictedMailboxForConversation];
  [v4 cancel];

  id v5 = [(ConversationViewController *)self diagnosticsHelperToken];
  [v5 cancel];

  id v6 = [(ConversationViewController *)self groupedSenderUnreadCountToken];
  [v6 cancel];

  v7.receiver = self;
  v7.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v7 dealloc];
}

- (void)setConversationSortOrder:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v4 setConversationSortOrder:a3];
  [(ConversationViewController *)self _reloadDataSource];
  [(ConversationViewController *)self _updateQuickReplyState];
}

- (EMQuery)referenceMessageListQuery
{
  v2 = [(ConversationViewController *)self referenceMessageList];
  v3 = [v2 query];

  return (EMQuery *)v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v9 viewWillAppear:a3];
  objc_super v4 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v5 = [v4 sendLaterDate];
  if (v5 || ([v4 readLater], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    id v8 = [v4 followUp];

    if (!v8) {
      goto LABEL_5;
    }
  }
  [(ConversationViewController *)self _reloadDataSource];
LABEL_5:
  unsigned int v6 = [(ConversationViewControllerBase *)self shouldHideStickyFooterView];
  objc_super v7 = [(ConversationViewController *)self navigationController];
  [v7 setToolbarHidden:v6 ^ 1];

  if (!v4 && [(ConversationViewControllerBase *)self shouldShowNoMessageSelectedView]) {
    sub_10006DC20(self);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v4 viewDidAppear:a3];
  [(ConversationViewController *)self _reloadTopSummaryIfNecessary];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v4 viewWillDisappear:a3];
  -[ConversationViewController swipableCollectionViewLayout:willEndSwipeForItemAtIndexPath:]_0(self);
}

- (void)swipableCollectionViewLayout:(void *)a1 willEndSwipeForItemAtIndexPath:
{
  if (a1)
  {
    v2 = sub_10007973C(a1);
    v3 = [v2 presentedViewController];
    BOOL v4 = sub_100079610(a1, v3);

    id v5 = +[ConversationViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = NSStringFromSelector("_dismissPresentedViewController");
      int v7 = 134218754;
      id v8 = a1;
      __int16 v9 = 2112;
      id v10 = v6;
      __int16 v11 = 1024;
      BOOL v12 = v4;
      __int16 v13 = 2112;
      objc_super v14 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%p> %@ shouldDismiss:%d presentingVC:%@", (uint8_t *)&v7, 0x26u);
    }
    if (v4) {
      [v2 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v4 viewDidDisappear:a3];
  [(ConversationViewController *)self reenableAutomaticMarkAsReadForAllMessages];
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (id)undoManager
{
  v2 = [(ConversationViewControllerBase *)self scene];
  v3 = [v2 undoManager];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self presentedViewController];
  unsigned int v6 = [(ConversationViewController *)self _mailActionsViewControllerFromPresentedViewController:v5];

  int v7 = [(ConversationViewController *)self presentedViewController];

  if (v7)
  {
    if (v6)
    {
      unsigned int v8 = [(ConversationViewControllerBase *)self _shouldHideStickyFooterViewForTraitCollection:v4];
      __int16 v9 = [(ConversationViewController *)self traitCollection];
      unsigned int v10 = [(ConversationViewControllerBase *)self _shouldHideStickyFooterViewForTraitCollection:v9];

      if (v8 != v10) {
        goto LABEL_4;
      }
      if ([v6 useActionSheetStyleCard])
      {
        __int16 v11 = [(ConversationViewController *)self traitCollection];
        BOOL v12 = [v11 preferredContentSizeCategory];
        int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v12);

        objc_super v14 = [v4 preferredContentSizeCategory];
        LODWORD(v12) = UIContentSizeCategoryIsAccessibilityCategory(v14);

        if (IsAccessibilityCategory != v12) {
LABEL_4:
        }
          [(ConversationViewController *)self dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v15 traitCollectionDidChange:v4];
}

- (BOOL)isBucketSelected
{
  v2 = [(ConversationViewController *)self messageList];
  v3 = [v2 query];
  id v4 = [v3 predicate];
  unsigned __int8 v5 = [v4 ef_containsKeyPath:EMMessageListItemKeyPathCategoryType];

  return v5;
}

- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = MFMessageSelectionLifecycleSignpostLog();
  __int16 v13 = [v10 itemID];
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v12, v13);

  objc_super v15 = MFMessageSelectionLifecycleSignpostLog();
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = [v10 itemID];
    *(_DWORD *)buf = 138543362;
    v56 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, v14, "Message selection lifecycle", "Setting reference item for message with itemID: %{public}@", buf, 0xCu);
  }
  id v18 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  unsigned int v19 = [v18 isEqual:v10];

  id v20 = _os_activity_create((void *)&_mh_execute_header, "loading messages for the conversation view", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v20, &state);
  if (!v19)
  {
    [(ConversationViewController *)self setDidAutoReloadDataSource:0];
LABEL_13:
    [(ConversationViewController *)self setDisabledMarkAsReadMessageItemIDs:0];
    [(ConversationViewController *)self setExpandedContentItemIDs:0];
    [(ConversationViewController *)self setPinnedItem:0];
    [(ConversationViewControllerBase *)self setDidCompleteFirstPaint:0];
    [(ConversationViewControllerBase *)self setInitialSenderHeaderExpansionStatus:1];
    [(ConversationViewController *)self _resetManualSummaryItemIDs];
    uint64_t v25 = [(ConversationViewControllerBase *)self restorationFuture];

    if (v25)
    {
      int v26 = [(ConversationViewControllerBase *)self restorationFuture];
      uint64_t v27 = [v26 resultIfAvailable];
      id v28 = [v27 referenceMessageListItem];

      if (v10 && v28 == v10)
      {
        v29 = +[ConversationViewController log];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          [v10 ef_publicDescription];
          v30 = (ConversationViewController *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v56 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Conversation reference item successfully restored: %@", buf, 0xCu);
        }
      }
      else
      {
        v31 = +[ConversationViewController log];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [v10 itemID];
          *(_DWORD *)buf = 138412290;
          v56 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "setReferenceMessageListItem (itemID=%@): called before state restoration was complete. Cancelling restoration future.", buf, 0xCu);
        }
        v29 = [(ConversationViewControllerBase *)self restorationFuture];
        [v29 tryCancel];
      }

      [(ConversationViewControllerBase *)self setRestorationFuture:0];
    }
    [(ConversationViewControllerBase *)self shouldShowNoMessageSelectedView];
    if (v10)
    {
      v33 = [(ConversationViewController *)self blankConversationTailspinToken];
      [v33 cancel];

      uint64_t v34 = +[EFScheduler globalAsyncScheduler];
      v48 = _NSConcreteStackBlock;
      uint64_t v49 = 3221225472;
      v50 = sub_10006EAE0;
      v51 = &unk_100604618;
      v52 = self;
      id v53 = v10;
      id v35 = [v34 afterDelay:&v48 performBlock:1.5];
      -[ConversationViewController setBlankConversationTailspinToken:](self, "setBlankConversationTailspinToken:", v35, v48, v49, v50, v51, v52);
    }
    else
    {
      uint64_t v36 = +[ConversationViewController log];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v56 = self;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%p: No message list item. Showing No Message Selected", buf, 0xCu);
      }
    }
    [(ConversationViewControllerBase *)self setShouldShowNoMessageSelectedView:v10 == 0];
    v37 = +[ConversationViewController log];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      [v10 ef_publicDescription];
      v38 = (ConversationViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v56 = v38;
      __int16 v57 = 2112;
      id v58 = v11;
      __int16 v59 = 1024;
      BOOL v60 = v7;
      __int16 v61 = 1024;
      BOOL v62 = v10 == 0;
      __int16 v63 = 1024;
      BOOL v64 = v6;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Setting referenceMessageListItem:%@\nreferenceMessageList:%@\nshowAsConversation:%{BOOL}d, shouldShowNoMessageSelectedView:%{BOOL}d, animated: %{BOOL}d", buf, 0x28u);
    }
    v39 = [(ConversationViewControllerBase *)self messageViewControllerReuseQueue];
    [v39 drain];

    v40 = [(ConversationViewControllerBase *)self cellHeightCache];
    [v40 removeAllObjects];

    id v41 = [(ConversationViewControllerBase *)self cellConfigurator];
    [v41 resetCaches];

    id v42 = +[NSMutableSet set];
    [(ConversationViewController *)self setInitiallyUnreadItemIDs:v42];

    [(ConversationViewController *)self _stopTextFindingIfNecessary];
    [(ConversationViewControllerBase *)self _updateAllowQuickReplyForMessageListItem:v10];
    [(ConversationViewControllerBase *)self setReferenceMessageListItem:v10];
    [(ConversationViewController *)self setReferenceMessageList:v11];
    [(ConversationViewControllerBase *)self setShownAsConversation:v7];
    [(ConversationViewController *)self _reloadDataSource];
    if ((*(unsigned char *)&self->super._flags & 0x10) != 0)
    {
      [(ConversationViewControllerBase *)self _updateBarButtonsAnimated:v6 force:1];
      [(ConversationViewControllerBase *)self updateArrowControlsView];
    }
    v43 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    BOOL v44 = v43 == 0;

    if (!v44)
    {
      v45 = [(ConversationViewControllerBase *)self previewState];
      [v45 transitionAfterChangingSources];
    }
    [(ConversationViewController *)self _updateGestureForMessageListItem:v10];
    [(ConversationViewController *)self _resetQuickReplyViewControllerWithReason:0 resetCompose:1 override:0];
    [(ConversationViewControllerBase *)self updateNavigationItemChromelessConfiguration];
    goto LABEL_34;
  }
  id v21 = [(ConversationViewController *)self contentRequestCache];
  uint64_t v22 = [v10 displayMessageItemID];
  v23 = [v21 objectForKey:v22];

  if ([(ConversationViewController *)self _shouldReloadEmptyMessageList])
  {
    [(ConversationViewController *)self setDidAutoReloadDataSource:0];
    v24 = +[ConversationViewController log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      [v10 itemID];
      objc_claimAutoreleasedReturnValue();
      sub_100457FF0();
    }

    goto LABEL_12;
  }
  if (!v23 || [v23 state] == (id)3)
  {
LABEL_12:

    goto LABEL_13;
  }
  v46 = +[ConversationViewController log];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = [v10 itemID];
    *(_DWORD *)buf = 138412290;
    v56 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "setReferenceMessageListItem: Skip setting the same message list item: %@", buf, 0xCu);
  }
LABEL_34:
  os_activity_scope_leave(&state);
}

- (void)_resetQuickReplyViewControllerWithReason:(int64_t)a3 resetCompose:(BOOL)a4 override:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if ([(ConversationViewControllerBase *)self allowQuickReply] || v5)
  {
    [(ConversationViewControllerBase *)self setIsPerformingQuickReplySendAnimation:0];
    +[QuickReplyView defaultHeight];
    -[ConversationViewControllerBase setQuickReplyHeight:](self, "setQuickReplyHeight:");
    [(ConversationViewController *)self setQuickReplyHasContent:0];
    id v14 = [(ConversationViewController *)self _quickReplyView];
    [v14 resetWithReason:a3];
    [v14 setHidden:0];
    __int16 v9 = [(ConversationViewController *)self quickReplyMailComposeController];
    [(ConversationViewController *)self mailComposeController:v9 didChangeQuickReplyWebViewHeight:0.0];

    [(ConversationViewController *)self _updateQuickReplyLabelIfNeeded];
    id v10 = [(ConversationViewControllerBase *)self quickReplyAnimationContext];
    id v11 = +[NSNull null];
    [v10 setObject:v11];

    if (v6)
    {
      BOOL v12 = [(ConversationViewController *)self quickReplyMailComposeController];
      __int16 v13 = [v12 view];
      [v13 removeFromSuperview];

      [(ConversationViewController *)self setQuickReplyMailComposeController:0];
    }
  }
}

- (void)_resetManualSummaryItemIDs
{
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    v3 = objc_opt_new();
    [(ConversationViewController *)self setSummaryContextByItemID:v3];
  }
  [(ConversationViewController *)self setTopSummaryItemID:0];

  [(ConversationViewController *)self setInlineSummaryItemID:0];
}

- (id)focusedMessage
{
  v2 = [(ConversationViewControllerBase *)self handoffCoordinator];
  v3 = [v2 handoffMessageRequest];
  id v4 = [v3 message];

  return v4;
}

- (id)_focusedMessageItemID
{
  v2 = [(ConversationViewControllerBase *)self handoffCoordinator];
  v3 = [v2 handoffMessageRequest];
  id v4 = [v3 itemID];

  return v4;
}

- (BOOL)containsMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ConversationViewController *)self collectionViewDataSource];
  BOOL v6 = [v4 displayMessageItemID];
  BOOL v7 = [v5 indexPathForItemIdentifier:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

- (void)scrollToMessageIfPossible:(id)a3 animated:(BOOL)a4 pin:(BOOL)a5
{
  id v6 = [a3 displayMessageItemID];
  -[ConversationViewController scrollToMessageItemIDIfPossible:animated:pin:](self, "scrollToMessageItemIDIfPossible:animated:pin:");
}

- (void)scrollToMessageItemIDIfPossible:(id)a3 animated:(BOOL)a4 pin:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if (!v5
    || ([(ConversationViewControllerBase *)self pinnedItem],
        __int16 v9 = objc_claimAutoreleasedReturnValue(),
        [v9 itemID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 isEqual:v8],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    BOOL v12 = [(ConversationViewController *)self collectionViewDataSource];
    __int16 v13 = [v12 indexPathForItemIdentifier:v8];

    if (v13)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10006F318;
      v18[3] = &unk_100604668;
      v18[4] = self;
      id v14 = v13;
      id v19 = v14;
      id v20 = v8;
      [(ConversationViewControllerBase *)self _scrollToItemAtIndexPath:v14 dynamicOffset:0 shouldAdjustToShowPreviousMessage:1 animated:v6 pin:v5 completion:v18];
      objc_super v15 = [(ConversationViewControllerBase *)self cellConfigurator];
      unsigned __int8 v16 = [v15 messageAtIndexPathIsExpanded:v14];

      if ((v16 & 1) == 0)
      {
        v17 = [(ConversationViewControllerBase *)self cellConfigurator];
        [v17 expandCellAtIndexPath:v14 animated:v6 highlightFirst:0];
      }
    }
  }
}

- (id)messageCountHint
{
  v3 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 count];
    if ((unint64_t)v5 <= 1 && (*(unsigned char *)&self->super._flags & 0x20) != 0)
    {
      id v8 = +[EFPromise promise];
      __int16 v9 = [(ConversationViewController *)self _conversationViewQueryIncludeRelated:1];
      id v10 = [(ConversationViewController *)self messageRepository];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10006F634;
      v13[3] = &unk_100604BB0;
      id v11 = v8;
      id v14 = v11;
      [v10 performCountQuery:v9 completionHandler:v13];

      BOOL v7 = [v11 future];
    }
    else
    {
      BOOL v6 = +[NSNumber numberWithUnsignedInteger:v5];
      BOOL v7 = +[EFFuture futureWithResult:v6];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_reloadDataSource
{
  [(ConversationViewController *)self loadViewIfNeeded];
  [(ConversationViewController *)self setMessageList:0];
  [(ConversationViewController *)self setDisplaySubjectItemID:0];
  [(ConversationViewControllerBase *)self setLastExpandedCellIndexPath:0];
  id v4 = [(ConversationViewController *)self messageRepository];
  if (v4
    && ([(ConversationViewControllerBase *)self referenceMessageListItem],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
    {
      BOOL v6 = [(ConversationViewController *)self referenceMessageList];
      BOOL v7 = [v6 unfilteredMessageList];
      id v8 = [v7 query];
      __int16 v9 = [v8 predicate];
      id v10 = [(ConversationViewController *)self _senderBasedQueryPredicateForReferenceMessageListQueryPredicate:v9 shouldExcludeReadMessages:0];

      id v11 = objc_alloc((Class)EMMessageList);
      BOOL v12 = [(ConversationViewController *)self messageRepository];
      id v13 = [v11 initWithQuery:v10 repository:v12];

      id v14 = [(ConversationViewController *)self referenceMessageList];
      objc_super v15 = [v14 filterPredicate];

      if (!v15)
      {
        uint64_t v22 = +[NSAssertionHandler currentHandler];
        [v22 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:616 description:@"The messageList from Message List View Controller should always have a category filter when we show the Hybrid Conversation View"];
      }
      unsigned __int8 v16 = [(ConversationViewController *)self referenceMessageList];
      v17 = [v16 filterPredicate];
      id v18 = [v13 filteredMessageListWithPredicate:v17 ignoredMessagesPredicate:0 userFiltered:0];
    }
    else
    {
      id v10 = [(ConversationViewController *)self _conversationViewQueryIncludeRelated:(*(unsigned char *)&self->super._flags >> 5) & 1];
      id v19 = objc_alloc((Class)EMMessageList);
      unsigned __int8 v16 = [(ConversationViewController *)self messageRepository];
      id v18 = [v19 initWithQuery:v10 repository:v16];
    }

    id v20 = +[ConversationViewController log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v18 query];
      int v23 = 138412290;
      v24 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Loading messages for conversation view query: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    id v18 = 0;
  }
  [(ConversationViewController *)self _reloadDataSourceWithMessageList:v18];
  [(ConversationViewController *)self _resetContentRequest];
  [(ConversationViewController *)self setPredictedMailboxForConversation:0];
}

- (void)_reloadDataSourceWithMessageList:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:633 description:@"Current thread must be main"];
  }
  BOOL v6 = [(ConversationViewController *)self messageList];
  BOOL v7 = +[ConversationViewController log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 ef_publicDescription];
    __int16 v9 = [v5 ef_publicDescription];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    int v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@: Reloading messageList old:%@\nnew:%@", buf, 0x20u);
  }
  if (v6) {
    [v6 stopObserving:self];
  }
  [(ConversationViewController *)self setMessageList:v5];
  if (v5)
  {
    [(ConversationViewController *)self setSwappingMessageList:1];
    [(ConversationViewController *)self setNextUpdateShouldAvoidAnimation:1];
    [(ConversationViewController *)self setLastSeenDate:0];
    [(ConversationViewController *)self setLastSeenDisplayDate:0];
    [v5 beginObserving:self];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v10 = +[EFScheduler mainThreadScheduler];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10006FE34;
    v16[3] = &unk_100604C00;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v5;
    id v11 = [v10 afterDelay:v16 performBlock:0.1];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000700C0;
    v15[3] = &unk_100604C28;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10007017C;
    v14[3] = &unk_1006047A0;
    void v14[4] = self;
    [(ConversationViewController *)self _performDataSourceUpdateAnimated:0 collection:0 update:v15 completion:v14];
  }
  BOOL v12 = +[ConversationViewController log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Reloading: %@", buf, 0xCu);
  }

  if (EMBlackPearlIsFeatureEnabled()) {
    [(ConversationViewController *)self _updateGroupedSenderMessageCountQueries];
  }
}

- (void)_updateGroupedSenderMessageCountQueries
{
  [(ConversationViewController *)self setGroupedSenderUnreadCountQuery:0];
  v3 = [(ConversationViewController *)self groupedSenderUnreadCountToken];
  [v3 cancel];

  [(ConversationViewController *)self setGroupedSenderUnreadCount:0];
  [(ConversationViewController *)self setTotalUnfilteredMessageCountQuery:0];
  id v4 = [(ConversationViewController *)self totalUnfilteredMessageCountToken];
  [v4 cancel];

  [(ConversationViewController *)self setTotalUnfilteredMessageCountToken:0];
  [(ConversationViewControllerBase *)self setTotalUnfilteredMessageCount:0];
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    id v5 = [(ConversationViewController *)self messageList];
    BOOL v6 = [v5 query];
    BOOL v7 = [v6 predicate];
    v23[0] = v7;
    id v8 = +[EMMessageListItemPredicates predicateForUnreadMessages];
    v23[1] = v8;
    __int16 v9 = +[NSArray arrayWithObjects:v23 count:2];
    id v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v9];

    id v11 = [(ConversationViewController *)self messageList];
    BOOL v12 = [v11 query];
    id v13 = [v12 queryWithPredicate:v10];
    [(ConversationViewController *)self setGroupedSenderUnreadCountQuery:v13];

    id v14 = [(ConversationViewController *)self messageRepository];
    objc_super v15 = [(ConversationViewController *)self groupedSenderUnreadCountQuery];
    unsigned __int8 v16 = [v14 startCountingQuery:v15 includingServerCountsForMailboxScope:0 withObserver:self];
    [(ConversationViewController *)self setGroupedSenderUnreadCountToken:v16];

    id v17 = [(ConversationViewController *)self messageList];
    id v18 = [v17 unfilteredMessageList];
    id v19 = [v18 query];
    [(ConversationViewController *)self setTotalUnfilteredMessageCountQuery:v19];

    __int16 v20 = [(ConversationViewController *)self messageRepository];
    id v21 = [(ConversationViewController *)self totalUnfilteredMessageCountQuery];
    __int16 v22 = [v20 startCountingQuery:v21 includingServerCountsForMailboxScope:0 withObserver:self];
    [(ConversationViewController *)self setTotalUnfilteredMessageCountToken:v22];
  }
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5
{
}

- (void)_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100070670;
  v17[3] = &unk_100604C50;
  void v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  BOOL v21 = a3;
  id v14 = v11;
  id v19 = v14;
  id v15 = v12;
  id v20 = v15;
  unsigned __int8 v16 = +[EFScheduler mainThreadScheduler];
  [v16 performBlock:v17];
}

- (id)_updateQueue
{
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    v3 = 0;
  }
  else
  {
    id v4 = [(ConversationViewController *)self messageListCollectionHelper];
    v3 = [v4 updateQueue];
  }

  return v3;
}

- (void)_nts_performDataSourceUpdateAnimated:(BOOL)a3 collection:(id)a4 update:(id)a5 completion:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (pthread_main_np() != 1)
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:738 description:@"Current thread must be main"];
  }
  id v14 = [(ConversationViewController *)self messageList];

  if (v14 == v11)
  {
    [(ConversationViewController *)self setIsPerformingDataSourceUpdate:1];
    unsigned __int8 v16 = [(ConversationViewController *)self isSwappingMessageList];
    unsigned __int8 v17 = [(ConversationViewController *)self nextUpdateShouldAvoidAnimation];
    [(ConversationViewController *)self setSwappingMessageList:0];
    [(ConversationViewController *)self setNextUpdateShouldAvoidAnimation:0];
    uint64_t v25 = [(ConversationViewController *)self collectionViewDataSource];
    id v18 = [(ConversationViewController *)self messageListCollectionHelper];
    id v19 = [v18 sectionObjectID];
    id v20 = [(ConversationViewController *)self _updateQueue];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100070C88;
    v28[3] = &unk_100604C78;
    BOOL v34 = a3;
    unsigned __int8 v35 = v17;
    unsigned __int8 v36 = v16;
    id v15 = v25;
    v29 = v15;
    id v21 = v19;
    id v30 = v21;
    v31 = self;
    id v32 = v12;
    id v33 = v13;
    __int16 v22 = objc_retainBlock(v28);
    int v23 = v22;
    if (v20)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100070EE0;
      block[3] = &unk_100604578;
      uint64_t v27 = v22;
      dispatch_async(v20, block);
    }
    else
    {
      ((void (*)(void *))v22[2])(v22);
    }
    [(ConversationViewController *)self setIsPerformingDataSourceUpdate:0];
  }
  else
  {
    id v15 = +[ConversationViewController log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v11 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100458034();
    }
  }
}

- (void)_resetContentRequest
{
  v3 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412546;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2048;
    id v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<%@: %p> Resetting content request", (uint8_t *)&v17, 0x16u);
  }

  id v4 = [(ConversationViewController *)self contentItemsCancelable];
  [v4 cancel];

  id v5 = objc_alloc_init((Class)EFCancelationToken);
  [(ConversationViewController *)self setContentItemsCancelable:v5];

  BOOL v6 = [(ConversationViewController *)self contentRequestQueue];
  id v7 = [v6 drain];

  id v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];

  BOOL v9 = v8 == 0;
  id v10 = [(ConversationViewController *)self contentRequestCache];
  id v11 = v10;
  if (v9)
  {
    [v10 removeAllObjects];
  }
  else
  {
    [v10 removeAllObjects];

    id v12 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v11 = [v12 displayMessageItemID];

    if (v11)
    {
      id v13 = [(ConversationViewController *)self _priorityLoadingComparatorForPinnedItemID:v11];
      id v14 = [(ConversationViewController *)self contentRequestQueue];
      [v14 setComparator:v13];

      id v15 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v11];
      unsigned __int8 v16 = [(ConversationViewController *)self contentRequestQueue];
      [v16 immediatelyProcessQueue];
    }
  }
}

- (id)_contentRequestForMessageWithItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self contentRequestCache];
  BOOL v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      uint64_t v15 = objc_opt_class();
      __int16 v16 = 2048;
      int v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@: %p> Content request cache miss. Generating content request for itemID: %{public}@ ", (uint8_t *)&v14, 0x20u);
    }

    uint64_t v8 = [(ConversationViewController *)self _generateContentRequestForMessageWithItemID:v4];
    BOOL v9 = [(ConversationViewController *)self contentRequestCache];
    [v9 addObject:v8 forKey:v4];

    BOOL v6 = (void *)v8;
  }
  if (([v6 hasStarted] & 1) == 0)
  {
    id v10 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      int v14 = 138412802;
      uint64_t v15 = v11;
      __int16 v16 = 2048;
      int v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<%@: %p> Enqueueing content request for itemID: %{public}@", (uint8_t *)&v14, 0x20u);
    }

    id v12 = [(ConversationViewController *)self contentRequestQueue];
    [v12 enqueue:v6];
  }

  return v6;
}

- (id)_generateContentRequestForMessageWithItemID:(id)a3
{
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10007190C;
  v34[3] = &unk_100604CA0;
  id v4 = a3;
  id v35 = v4;
  id v5 = objc_retainBlock(v34);
  BOOL v6 = [(ConversationViewController *)self contentRequestQueue];
  id v7 = [v6 allObjects];

  id v8 = [v7 indexOfObjectPassingTest:v5];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL
    || ([v7 objectAtIndex:v8],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        [(ConversationViewController *)self contentRequestQueue],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 dequeueObject:v9],
        v10,
        (uint64_t v11 = (void *)v9) == 0))
  {
    id v12 = [(ConversationViewControllerBase *)self collectionView];
    id v13 = [(ConversationViewController *)self collectionViewDataSource];
    int v14 = [v13 indexPathForItemIdentifier:v4];
    uint64_t v15 = [v12 cellForItemAtIndexPath:v14];

    __int16 v16 = [v15 viewModel];
    uint64_t v11 = [v16 messageContentRequest];

    if (!v11) {
      goto LABEL_5;
    }
  }
  if ([v11 state] == (id)3)
  {
LABEL_5:
    int v17 = EMLogCategoryMessageLoading();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v18;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2114;
      id v40 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<%@: %p> Could not find an appropriate context for itemID: %{public}@. Creating a new one", buf, 0x20u);
    }

    id v19 = objc_alloc((Class)MessageContentRepresentationRequest);
    id v20 = [(ConversationViewController *)self messageList];
    id v21 = [v19 initWithMessageList:v20 itemIdentifier:v4 includeSuggestions:1];

    __int16 v22 = [(ConversationViewController *)self contentItemsCancelable];
    [v22 addCancelable:v21];

    int v23 = [(ConversationViewControllerBase *)self handoffCoordinator];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v21);
    v24 = +[EFScheduler mainThreadScheduler];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100071960;
    v31[3] = &unk_100604CC8;
    objc_copyWeak(&v33, (id *)buf);
    id v25 = v23;
    id v32 = v25;
    id v26 = [v21 onScheduler:v24 addLoadObserver:v31];

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);

    uint64_t v11 = v21;
  }
  uint64_t v27 = EMLogCategoryMessageLoading();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v28;
    __int16 v37 = 2048;
    v38 = self;
    __int16 v39 = 2048;
    id v40 = v11;
    __int16 v41 = 2114;
    id v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "<%@: %p> Generated content request %p for itemID: %{public}@", buf, 0x2Au);
  }

  id v29 = v11;
  return v29;
}

- (void)_updateForDataSourceChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[ConversationViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_updateForDataSourceChanges:%{BOOL}d", (uint8_t *)v8, 8u);
  }

  [(ConversationViewController *)self _updateSubject];
  [(ConversationViewControllerBase *)self _updateLayout];
  [(ConversationViewControllerBase *)self _updateCells];
  [(ConversationViewController *)self _updateQuickReplyLabelIfNeeded];
  if (v3
    && ![(ConversationViewControllerBase *)self isPerformingQuickReplySendAnimation])
  {
    [(ConversationViewControllerBase *)self _resetBottomPaddingIfDisplayingSingleMessage];
    BOOL v6 = [(ConversationViewControllerBase *)self collectionView];
    if (([v6 isTracking] & 1) != 0
      || ([v6 isDecelerating] & 1) != 0
      || [v6 isDragging])
    {
      id v7 = +[ConversationViewController log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skip _scrollToInitialPosition - conversation view is currently scrolling after user interaction", (uint8_t *)v8, 2u);
      }
    }
    else
    {
      [(ConversationViewController *)self _scrollToInitialPosition];
    }
  }
}

- (void)_updateSubject
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100072060;
  v14[3] = &unk_100604D68;
  objc_copyWeak(&v15, &location);
  BOOL v3 = objc_retainBlock(v14);
  id v4 = [(ConversationViewController *)self _messageFutureForConversationSubject];
  if (!v4)
  {
    id v5 = +[ConversationViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100458078();
    }
  }
  BOOL v6 = +[EFScheduler mainThreadScheduler];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000721EC;
  v12[3] = &unk_100604D90;
  id v7 = v3;
  id v13 = v7;
  [v4 onScheduler:v6 addSuccessBlock:v12];

  id v8 = +[EFScheduler mainThreadScheduler];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000721FC;
  v10[3] = &unk_100604DB8;
  uint64_t v9 = v7;
  id v11 = v9;
  [v4 onScheduler:v8 addFailureBlock:v10];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)_messageFutureForConversationSubject
{
  int64_t v3 = [(ConversationViewController *)self countOfMessages];
  if (v3)
  {
    int64_t v4 = v3;
    if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
    {
      id v5 = [(ConversationViewController *)self topSummaryItemID];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
    if ((id)[(ConversationViewControllerBase *)self conversationSortOrder] == (id)1) {
      int64_t v7 = v4 - 1;
    }
    else {
      int64_t v7 = v6;
    }
    id v8 = +[NSIndexPath indexPathForItem:v7 inSection:0];
    uint64_t v9 = [(ConversationViewController *)self collectionViewDataSource];
    id v10 = [v9 itemIdentifierForIndexPath:v8];

    id v11 = [(ConversationViewController *)self _messageFutureForItemID:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)_conversationViewQueryIncludeRelated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    id v5 = [(ConversationViewController *)self messageList];
    BOOL v6 = [v5 query];
  }
  else
  {
    BOOL v6 = [(ConversationViewController *)self _queryForConversationViewIncludeRelated:v3];
  }

  return v6;
}

- (id)_senderBasedQueryPredicateForReferenceMessageListQueryPredicate:(id)a3 shouldExcludeReadMessages:(BOOL)a4
{
  BOOL v4 = a4;
  id v28 = a3;
  int64_t v7 = [(ConversationViewController *)self _mailboxExclusionPredicate];
  id v8 = +[EMMessageListItemPredicates sortDescriptorForDateAscending:[(ConversationViewControllerBase *)self conversationSortOrder] == 0];
  id v32 = v8;
  uint64_t v9 = +[NSArray arrayWithObjects:&v32 count:1];

  id v10 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v11 = +[EMMessageListItemPredicates predicateForMessagesForBusinessID:](EMMessageListItemPredicates, "predicateForMessagesForBusinessID:", [v10 businessID]);

  id v12 = +[NSCompoundPredicate ef_andCompoundPredicateForOptionalPredicate:v11 second:v28];

  id v13 = +[NSCompoundPredicate ef_andCompoundPredicateForOptionalPredicate:v12 second:v7];

  if (v4)
  {
    int v14 = +[EMMessageListItemPredicates predicateForUnreadMessages];
    v31[0] = v13;
    v31[1] = v14;
    id v15 = +[NSArray arrayWithObjects:v31 count:2];
    uint64_t v16 = +[NSCompoundPredicate andPredicateWithSubpredicates:v15];

    id v13 = (void *)v16;
  }
  int v17 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  uint64_t v18 = [v17 displayMessageItemID];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:1025 description:@"referenceMessageListItem.displayMessageItemID is not an EMMessageCollectionItemID"];
  }
  id v19 = objc_alloc((Class)EMMessageObjectID);
  id v20 = [(ConversationViewController *)self mailboxRepository];
  id v21 = [v19 initWithCollectionItemID:v18 predicate:v13 mailboxTypeResolver:v20];

  id v22 = objc_alloc((Class)EMQuery);
  uint64_t v23 = objc_opt_class();
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100072870;
  v29[3] = &unk_100604DE0;
  id v24 = v21;
  id v30 = v24;
  id v25 = [v22 initWithTargetClass:v23 predicate:v13 sortDescriptors:v9 builder:v29];

  return v25;
}

- (id)_queryForConversationViewIncludeRelated:(BOOL)a3
{
  id v5 = [(ConversationViewController *)self _mailboxExclusionPredicate];
  BOOL v6 = +[EMMessageListItemPredicates sortDescriptorForDateAscending:[(ConversationViewControllerBase *)self conversationSortOrder] == 0];
  id v22 = v6;
  int64_t v7 = +[NSArray arrayWithObjects:&v22 count:1];

  id v8 = [(ConversationViewController *)self referenceMessageListQuery];
  if ([(ConversationViewControllerBase *)self shownAsConversation])
  {
    uint64_t v9 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v10 = +[EMMessageListItemPredicates predicateForMessagesInConversation:](EMMessageListItemPredicates, "predicateForMessagesInConversation:", [v9 conversationID]);

    if (a3) {
      goto LABEL_12;
    }
    if (([v8 queryOptions] & 0x20) != 0)
    {
      int v14 = [(ConversationViewController *)self _referenceMessageListMailboxScope];
      id v11 = +[EMMessageListItemPredicates predicateForMessagesWithMailboxScope:v14];
    }
    else
    {
      id v11 = [v8 predicate];
    }
    if (v11)
    {
      v21[0] = v10;
      v21[1] = v11;
      id v12 = +[NSArray arrayWithObjects:v21 count:2];
      uint64_t v15 = +[NSCompoundPredicate andPredicateWithSubpredicates:v12];

      id v10 = (void *)v15;
    }
    else
    {
      id v12 = +[ConversationViewController log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1004580F0();
      }
    }
  }
  else
  {
    id v11 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v12 = [v11 displayMessageItemID];
    id v13 = [(ConversationViewController *)self mailboxRepository];
    id v10 = +[EMMessage predicateForMessageWithItemID:v12 mailboxPredicate:v5 mailboxTypeResolver:v13];
  }
LABEL_12:
  if (v5)
  {
    v20[0] = v10;
    v20[1] = v5;
    uint64_t v16 = +[NSArray arrayWithObjects:v20 count:2];
    uint64_t v17 = +[NSCompoundPredicate andPredicateWithSubpredicates:v16];

    id v10 = (void *)v17;
  }
  id v18 = [objc_alloc((Class)EMQuery) initWithTargetClass:objc_opt_class() predicate:v10 sortDescriptors:v7 queryOptions:8 label:@"conversation"];

  return v18;
}

- (id)_mailboxExclusionPredicate
{
  v2 = [(ConversationViewController *)self _excludedMailboxes];
  BOOL v3 = +[EMMessageListItemPredicates predicateForExcludingMessagesInMailboxes:v2];

  return v3;
}

- (id)_excludedMailboxes
{
  BOOL v3 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  BOOL v4 = [v3 mailboxObjectIDs];

  id v5 = objc_opt_new();
  if (_os_feature_enabled_impl() && sub_100072EE8((uint64_t)self)) {
    BOOL v6 = &off_10062B348;
  }
  else {
    BOOL v6 = &off_10062B360;
  }

  int64_t v7 = +[EMMailbox mailboxesWithTypes:v6];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100072F88;
  v11[3] = &unk_100604E08;
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v7 ef_filter:v11];

  return v9;
}

- (id)_messageFutureForItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self messageList];
  BOOL v6 = [v5 messageListItemForItemID:v4];

  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    int64_t v7 = [(ConversationViewController *)self messageList];
    if ([(ConversationViewController *)self isBucketSelected])
    {
      id v8 = [(ConversationViewControllerBase *)self delegate];
      [v8 currentlySelectedBucketForConversationViewController:self];

      uint64_t v9 = +[NSNumber numberWithUnsignedInteger:EMCategoryTypeForBucket()];
    }
    else
    {
      uint64_t v9 = 0;
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000731C0;
    v13[3] = &unk_100604E30;
    id v10 = v7;
    id v14 = v10;
    uint64_t v15 = self;
    id v16 = v9;
    id v11 = v9;
    [v6 addSuccessBlock:v13];
  }

  return v6;
}

- (id)_messageForItemID:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self _messageFutureForItemID:v4];
  if (([v5 isFinished] & 1) == 0)
  {
    BOOL v6 = +[ConversationViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Waiting for item %@ future %@", (uint8_t *)&v9, 0x16u);
    }
  }
  int64_t v7 = [v5 result];

  return v7;
}

- (id)_messageAtIndexPath:(id)a3
{
  id v4 = [(ConversationViewController *)self _messageItemIDAtIndexPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ConversationViewController *)self _messageForItemID:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)messageRepository:(id)a3 query:(id)a4 countDidChange:(int64_t)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000736D0;
  v9[3] = &unk_100604E58;
  id v7 = a4;
  id v10 = v7;
  __int16 v11 = self;
  int64_t v12 = a5;
  id v8 = +[EFScheduler mainThreadScheduler];
  [v8 performBlock:v9];
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self messageList];

  if (v5 != v4)
  {
    uint64_t v6 = +[ConversationViewController log];
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      [v4 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1004581A0();
    }
LABEL_13:

    goto LABEL_14;
  }
  id v7 = +[ConversationViewController log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    [v4 ef_publicDescription];
    objc_claimAutoreleasedReturnValue();
    sub_10045815C();
  }

  id v8 = [(ConversationViewControllerBase *)self blankConversationController];
  [v8 conversationViewDidLoadMessageSuccessfully];

  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    uint64_t v6 = [(ConversationViewController *)self lastSeenDate];
    uint64_t v9 = [(ConversationViewController *)self lastSeenDisplayDate];
    if (v6 | v9)
    {
      uint64_t v10 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      __int16 v11 = [(id)v10 senderList];
      int64_t v12 = [v11 firstObject];

      id v13 = [v4 unfilteredMessageList];
      LOBYTE(v10) = v13 == v4;

      if (v10)
      {
        uint64_t v15 = 0;
      }
      else
      {
        id v14 = [(ConversationViewControllerBase *)self delegate];
        [v14 currentlySelectedBucketForConversationViewController:self];

        uint64_t v15 = +[NSNumber numberWithUnsignedInteger:EMCategoryTypeForBucket()];
      }
      id v16 = [(ConversationViewController *)self messageRepository];
      [v16 updateLastSeenDate:v6 andDisplayDate:v9 forBusinessWithEmailAddress:v12 category:v15];
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_updateInitiallyUnreadItemIDs:(id)a3
{
  id v5 = a3;
  uint64_t v6 = +[ConversationViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    int v9 = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ unreadItemIDs:%{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [(ConversationViewController *)self initiallyUnreadItemIDs];
  [v8 addObjectsFromArray:v5];
}

- (void)populateSummaryItemForSnapshot:(id)a3
{
  id v4 = a3;
  if (![(ConversationViewControllerBase *)self beingPreviewed]
    && ![(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    if (_os_feature_enabled_impl())
    {
      if (EMIsGreymatterAvailableWithOverride())
      {
        id v5 = [(ConversationViewController *)self topSummaryItemID];
        if (!v5
          || ([(ConversationViewController *)self inlineSummaryItemID],
              uint64_t v6 = objc_claimAutoreleasedReturnValue(),
              v6,
              v5,
              !v6))
        {
          if (+[MUIManualSummaryController allowManualSummary])
          {
            id v7 = [(ConversationViewController *)self _messageItemIDsFromShapshot:v4];
            id v8 = [v7 firstObject];
            int v9 = [(ConversationViewControllerBase *)self referenceMessageListItem];
            uint64_t v10 = [v9 displayMessageItemID];

            if (v8)
            {
              if (v10)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  __int16 v11 = [(ConversationViewController *)self topSummaryItemID];

                  if (!v11)
                  {
                    id v12 = [[MFGeneratedSummaryCollectionItemID alloc] initWithAnchorMessageItemID:v8];
                    id v20 = v12;
                    id v13 = +[NSArray arrayWithObjects:&v20 count:1];
                    [v4 insertItemsWithIdentifiers:v13 beforeItemWithIdentifier:v8];

                    [(ConversationViewController *)self setTopSummaryItemID:v12];
                    [(ConversationViewController *)self setPreviousTopSummaryItemID:v12];
                  }
                  unsigned int v14 = 0;
                  if ((unint64_t)[v7 count] >= 2 && v8 != v10)
                  {
                    if ([v7 containsObject:v10])
                    {
                      uint64_t v15 = [(ConversationViewController *)self initiallyUnreadItemIDs];
                      unsigned int v14 = [v15 containsObject:v10];
                    }
                    else
                    {
                      unsigned int v14 = 0;
                    }
                  }
                  id v16 = [(ConversationViewController *)self inlineSummaryItemID];
                  if (v16) {
                    unsigned int v14 = 0;
                  }

                  if (v14)
                  {
                    uint64_t v17 = [[MFGeneratedSummaryCollectionItemID alloc] initWithAnchorMessageItemID:v10];
                    id v19 = v17;
                    id v18 = +[NSArray arrayWithObjects:&v19 count:1];
                    [v4 insertItemsWithIdentifiers:v18 beforeItemWithIdentifier:v10];

                    [(ConversationViewController *)self setInlineSummaryItemID:v17];
                    [(ConversationViewController *)self setPreviousInlineSummaryItemID:v17];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 before:(id)a6 unreadItemIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[ConversationViewController log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_1004581E4();
  }

  if (![v13 count]) {
    sub_10006DC20(self);
  }
  uint64_t v23 = self;
  id v17 = v12;
  id v24 = v17;
  id v18 = v15;
  id v25 = v18;
  id v19 = v13;
  id v26 = v19;
  id v20 = v14;
  id v27 = v20;
  SEL v28 = a2;
  id v21 = +[EFScheduler mainThreadScheduler];
  [v21 performBlock:&v22];
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 toThreadWithItemID:(id)a5 after:(id)a6 unreadItemIDs:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[ConversationViewController log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_100458294();
  }

  uint64_t v23 = self;
  id v17 = v12;
  id v24 = v17;
  id v18 = v15;
  id v25 = v18;
  id v19 = v14;
  id v26 = v19;
  id v20 = v13;
  id v27 = v20;
  SEL v28 = a2;
  id v21 = +[EFScheduler mainThreadScheduler];
  [v21 performBlock:&v22];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100074B88;
  v10[3] = &unk_100604ED0;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  [(ConversationViewController *)self _performDataSourceUpdateAnimated:1 collection:a3 update:v10];
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100074DF4;
  v10[3] = &unk_100604ED0;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  id v8 = v13;
  id v9 = v11;
  [(ConversationViewController *)self _performDataSourceUpdateAnimated:1 collection:a3 update:v10];
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1000750D0;
  void v11[4] = sub_1000750E0;
  id v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_1000750E8;
  v8[3] = &unk_100604EF8;
  id v9 = a4;
  uint64_t v10 = v11;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100075168;
  v7[3] = &unk_1006049F0;
  v7[4] = self;
  v7[5] = v11;
  id v6 = v9;
  [(ConversationViewController *)self _performDataSourceUpdateAnimated:1 collection:a3 update:v8 completion:v7];

  _Block_object_dispose(v11, 8);
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(ConversationViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewController collection:addedItemIDs:before:]", "ConversationViewController.m", 1416, "0");
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [(ConversationViewController *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewController collection:addedItemIDs:after:]", "ConversationViewController.m", 1420, "0");
}

- (void)_deleteItemsWithIDs:(id)a3 fromCollection:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ConversationViewController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100458344();
  }

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = sub_1000750D0;
  void v29[4] = sub_1000750E0;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = sub_1000750D0;
  v27[4] = sub_1000750E0;
  id v28 = 0;
  id v12 = [(ConversationViewControllerBase *)self pinnedItem];
  if (v12)
  {
    id v13 = [(ConversationViewControllerBase *)self pinnedItem];
    id v14 = [v13 itemID];
    unsigned int v15 = [v8 containsObject:v14];

    if (v15) {
      [(ConversationViewController *)self setPinnedItem:0];
    }
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100075EF0;
  v22[3] = &unk_100604F98;
  id v25 = v29;
  id v16 = v8;
  id v23 = v16;
  id v24 = self;
  id v26 = v27;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100076170;
  v18[3] = &unk_100604FC0;
  id v20 = v29;
  id v21 = v27;
  v18[4] = self;
  id v17 = v10;
  id v19 = v17;
  [(ConversationViewController *)self _performDataSourceUpdateAnimated:1 collection:v9 update:v22 completion:v18];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
}

- (id)_itemIDsForReloadAfterInsertingObjectsAfterItemID:(id)a3 snapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  [v8 addObject:v6];
  id v9 = [(ConversationViewController *)self _itemIDBeforeItemID:v6 snapshot:v7];
  id v10 = v9;
  if (v9 && ([v9 isEqual:v6] & 1) == 0) {
    [v8 addObject:v10];
  }

  return v8;
}

- (id)_itemIDBeforeItemID:(id)a3 snapshot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (char *)[v6 indexOfItemIdentifier:v5];
  id v8 = v7;
  if (v7)
  {
    if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = 0;
    }
    else
    {
      id v10 = [v6 itemIdentifiers];
      id v9 = [v10 objectAtIndexedSubscript:v8 - 1];
    }
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (id)_messageItemIDsFromShapshot:(id)a3
{
  BOOL v3 = [a3 itemIdentifiers];
  id v4 = [v3 ef_filter:&stru_100605028];

  return v4;
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqual:v10])
  {
    id v11 = +[ConversationViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1004583B8();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)id v25 = 0xE00000001;
    int v26 = 1;
    pid_t v27 = getpid();
    size_t v23 = 648;
    if (!sysctl(v25, 4u, __b, &v23, 0, 0) && (__b[8] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1000768A4);
    }
  }
  else
  {
    id v12 = [(ConversationViewControllerBase *)self pinnedItem];
    id v13 = [v12 itemID];
    unsigned int v14 = [v9 isEqual:v13];

    if (v14)
    {
      unsigned int v15 = [v12 dynamicOffset];
      id v16 = [(ConversationViewController *)self pinnedIndexPathProvider];
      id v17 = +[PinnedConversationItem pinnedItemWithID:v10 dynamicOffset:v15 indexPathProvider:v16];
      [(ConversationViewController *)self setPinnedItem:v17];
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100076AB8;
    v19[3] = &unk_100604ED0;
    id v20 = v9;
    id v21 = self;
    id v22 = v10;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100076D58;
    v18[3] = &unk_1006047A0;
    v18[4] = self;
    [(ConversationViewController *)self _performDataSourceUpdateAnimated:0 collection:v8 update:v19 completion:v18];
  }
}

- (id)cellConfigurator:(id)a3 messageItemIDAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ConversationViewController *)self collectionViewDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  return v7;
}

- (void)cellConfigurator:(id)a3 wantsToReloadCellAtIndexPaths:(id)a4 animated:(BOOL)a5
{
}

- (void)messageViewController:(id)a3 didStartDownloadForContentItemWithProgress:(id)a4
{
  id v6 = a4;
  id v5 = [(ConversationViewController *)self contentItemsCancelable];
  [v5 addCancelable:v6];
}

- (void)messageViewController:(id)a3 didTapShowMoreAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  id v10 = a3;
  id v11 = [v10 contentRequest];
  id v12 = [v11 itemID];

  id v13 = [(ConversationViewControllerBase *)self cellConfigurator];
  unsigned int v14 = [v13 expansionTracker];
  id v15 = [v14 expansionStatusForCellWithItemID:v12];

  if (v15 == (id)2)
  {
    id v16 = [(ConversationViewController *)self collectionViewDataSource];
    id v17 = [v16 indexPathForItemIdentifier:v12];

    if (v17)
    {
      [(ConversationViewController *)self setPinnedItem:0];
      id v18 = [(ConversationViewControllerBase *)self cellConfigurator];
      [v18 expandCellAtIndexPath:v17 animated:0 highlightFirst:0 expansionStatus:3];
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ConversationViewController;
    -[ConversationViewControllerBase messageViewController:didTapShowMoreAtCollapsedOffset:expandedOffset:](&v19, "messageViewController:didTapShowMoreAtCollapsedOffset:expandedOffset:", v10, v8, v7, x, y);
  }
}

- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [v11 contentRequest];
  double v8 = [v7 message];
  id v9 = [v11 predictedMailbox];
  id v10 = [v11 contentRequest];
  [(ConversationViewController *)self _didTapRevealActionsButton:v6 message:v8 predictedMailbox:v9 contentRequest:v10 didDismissHandler:0];
}

- (void)messageViewController:(id)a3 didTapUndoSendButton:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [v11 contentRequest];
  double v8 = [v7 message];
  id v9 = [v11 predictedMailbox];
  id v10 = [v11 contentRequest];
  [(ConversationViewController *)self _didTapUndoSendButton:v6 message:v8 predictedMailbox:v9 contentRequest:v10 didDismissHandler:0];
}

- (void)_messageViewControllerDidDisplayContent:(id)a3
{
  id v11 = a3;
  if (sub_1000A4FA0((BOOL)self))
  {
    id v4 = [v11 contentRequest];
    id v5 = [v4 itemID];

    sub_1000A0C30((uint64_t)self);
    id v6 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
    double v7 = sub_10006BB64(v6);
    double v8 = [v7 objectForKeyedSubscript:v5];

    id v9 = sub_1000773D0(self, v5);
    if (v9)
    {
      if ([v8 count])
      {
        [(ConversationViewController *)self _decorateFoundRanges:v8 inExpandedCell:v9];
      }
      else
      {
        id v10 = [v11 messageContentView];
        [v10 didBeginTextSearch];
      }
    }
  }
}

- (void)_didTapRevealActionsButton:(id)a3 message:(id)a4 predictedMailbox:(id)a5 contentRequest:(id)a6 didDismissHandler:(id)a7
{
  id v9 = a4;
  double v8 = -[ConversationViewController _actionsViewControllerWithMessage:contentRequest:predictedMailbox:button:didDismissHandler:](self, "_actionsViewControllerWithMessage:contentRequest:predictedMailbox:button:didDismissHandler:");
  [(ConversationViewController *)self setSelectedMessage:v9];
  if (v8) {
    [(ConversationViewControllerBase *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_didTapUndoSendButton:(id)a3 message:(id)a4 predictedMailbox:(id)a5 contentRequest:(id)a6 didDismissHandler:(id)a7
{
  id v8 = a4;
  id v9 = [(ConversationViewControllerBase *)self scene];
  id v10 = [v9 daemonInterface];
  id v11 = [v10 outgoingMessageRepository];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100077714;
  v13[3] = &unk_100605050;
  objc_copyWeak(&v15, &location);
  id v12 = v8;
  id v14 = v12;
  [v11 cancelLastDelayedMessage:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (id)_actionsViewControllerWithMessage:(id)a3 contentRequest:(id)a4 predictedMailbox:(id)a5 button:(id)a6 didDismissHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v45 = a5;
  id v46 = a6;
  id v15 = (void (**)(void))a7;
  if (v13)
  {
    BOOL v44 = [(ConversationViewControllerBase *)self displayMetrics];
    +[MailActionViewHeader defaultHeightWithDisplayMetrics:](MailActionViewHeader, "defaultHeightWithDisplayMetrics:");
    double v17 = v16;
    id v18 = [(ConversationViewController *)self view];
    [v18 frame];
    double Width = CGRectGetWidth(v56);

    id v20 = -[MailActionViewHeader initWithFrame:]([MailActionViewHeader alloc], "initWithFrame:", 0.0, 0.0, Width, v17);
    id v21 = [(ConversationViewControllerBase *)self contactStore];
    [(MFMessageConversationViewCell *)v20 setContactStore:v21];

    id v22 = +[MFMessageDisplayMetrics mf_actionCardMetricsFromDisplayMetrics:v44];
    [(MFConversationViewCell *)v20 setDisplayMetrics:v22];

    size_t v23 = [ConversationCellViewModel alloc];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100077F84;
    v50[3] = &unk_100605078;
    id v51 = v14;
    id v24 = v13;
    id v52 = v24;
    id v53 = self;
    id v25 = [(ConversationCellViewModel *)v23 initWithBuilder:v50];
    [(MFCollapsedMessageCell *)v20 setViewModel:v25];

    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, self);
    int v26 = [MailActionsViewController alloc];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_100078124;
    v47[3] = &unk_1006050A0;
    objc_copyWeak(&v49, location);
    v48 = v15;
    pid_t v27 = [(MailActionsViewController *)v26 initWithDelegate:self messageHeaderView:v20 didDismissHandler:v47];
    id v28 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v27];
    [v28 setModalPresentationStyle:7];
    id v29 = [v28 presentationController];
    [v29 setDelegate:self];

    if ((v15 != 0) | ((objc_opt_respondsToSelector() & 1) == 0))
    {
      id v30 = [v28 popoverPresentationController];
      [v46 mui_setAsSourceForPopoverPresentationController:v30];
    }
    else
    {
      id v30 = [v28 popoverPresentationController];
      [v46 mui_setAsSourceWithExtendedRectForPopoverPresentationController:v30];
    }

    if (+[UIDevice mf_isPad])
    {
      [v44 mailActionCardPreferredHeightForPad];
      id v32 = [(ConversationViewController *)self traitCollection];
      id v33 = [v32 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v33);

      if (IsAccessibilityCategory) {
        [(MailActionsViewController *)v27 approximateHeightNeededForAccessibilityContentSizeCategory];
      }
      [(MailActionsViewController *)v27 preferredContentSize];
      [v28 setPreferredContentSize:];
    }
    if (v15)
    {
      id v35 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      unsigned __int8 v36 = [(ConversationViewController *)self _completionForSwipeCardActionsForMailActionsViewController:v27 messageListItem:v35];
      id v37 = objc_retainBlock(v36);

      id v38 = 0;
    }
    else
    {
      __int16 v39 = [(ConversationViewController *)self _preparationForFooterViewCardActionsForMailActionsViewController:v27];
      id v38 = objc_retainBlock(v39);

      id v35 = [(ConversationViewController *)self _completionForFooterViewCardActionsForMailActionsViewController:v27];
      id v37 = objc_retainBlock(v35);
    }

    id v40 = [(ConversationViewController *)self _mailActionsViewDataSourceForMailActionsViewController:v27 message:v24 predictedMailbox:v45 preparation:v38 completion:v37];
    [(MailActionsViewController *)v27 setDataSource:v40];

    objc_destroyWeak(&v49);
    objc_destroyWeak(location);
  }
  else
  {
    v31 = +[ConversationViewController log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100458458();
    }

    v15[2](v15);
    id v28 = 0;
  }

  return v28;
}

- (void)messageViewController:(id)a3 scrollToRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = [a3 messageContentView];
  -[ConversationViewController _scrollToRect:forMessageContentView:](self, "_scrollToRect:forMessageContentView:", x, y, width, height);
}

- (id)messageViewControllerMessageListMailboxScope:(id)a3
{
  BOOL v3 = [(ConversationViewController *)self _referenceMessageListMailboxScope];

  return v3;
}

- (id)messageSourceMailboxObjectIDForMessageViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contentRequest];
  id v6 = [v5 message];

  if ([(ConversationViewController *)self _isDisplayingSingleMessage])
  {
    double v7 = [v6 mailboxObjectIDs];
    id v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v9 = [v8 mailboxObjectIDs];
    id v10 = [v7 firstObjectCommonWithArray:v9];
  }
  else
  {
    double v7 = [(ConversationViewController *)self _visibleIndexPathForMessageViewController:v4];
    id v8 = [(ConversationViewController *)self _messageAtIndexPath:v7];
    id v9 = [v6 mailboxObjectIDs];
    id v11 = [v8 mailboxObjectIDs];
    id v10 = [v9 firstObjectCommonWithArray:v11];
  }

  return v10;
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v6 presentedViewController];
    id v9 = [(ConversationViewController *)self _mailActionsViewControllerFromPresentedViewController:v8];

    if (v9)
    {
      id v21 = v7;
      [v21 _setShouldDismissWhenTappedOutside:1];
      id v20 = [(ConversationViewControllerBase *)self displayMetrics];
      [v9 approximateHeightForActionSheetStyleCard];
      double v11 = v10;
      BOOL v12 = v10 > 0.0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10007875C;
      v22[3] = &unk_1006050C8;
      id v13 = v20;
      id v23 = v13;
      BOOL v26 = v12;
      id v24 = v9;
      double v25 = v11;
      uint64_t v14 = +[UISheetPresentationControllerDetent _detentWithIdentifier:@"ConversationControllerCustomMediumDetent" resolutionContextBlock:v22];
      id v15 = (void *)v14;
      if (v11 <= 0.0)
      {
        v29[0] = v14;
        double v16 = +[UISheetPresentationControllerDetent largeDetent];
        v29[1] = v16;
        objc_super v19 = +[NSArray arrayWithObjects:v29 count:2];
      }
      else
      {
        double v16 = [(ConversationViewController *)self traitCollection];
        double v17 = [v16 preferredContentSizeCategory];
        if (UIContentSizeCategoryIsAccessibilityCategory(v17))
        {
          id v18 = +[UISheetPresentationControllerDetent largeDetent];
          id v28 = v18;
          objc_super v19 = +[NSArray arrayWithObjects:&v28 count:1];
        }
        else
        {
          pid_t v27 = v15;
          objc_super v19 = +[NSArray arrayWithObjects:&v27 count:1];
        }
      }
      [v21 setDetents:v19];
    }
  }
}

- (id)_mailActionsViewDataSourceForMailActionsViewController:(id)a3 message:(id)a4 predictedMailbox:(id)a5 preparation:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v35 = a7;
  double v16 = [v13 itemID];
  unsigned __int8 v36 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v16];

  double v17 = [v13 itemID];
  uint64_t v18 = [(ConversationViewController *)self _getCurrentlySelectedMessageContentForMessageItemID:v17];

  BOOL v34 = (void *)v18;
  objc_super v19 = [MFTriageInteractionTarget alloc];
  id v20 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v21 = [v13 displayMessage];
  id v22 = [v21 result];
  id v33 = [(MFTriageInteractionTarget *)v19 initWithMessageListItem:v20 primaryMessage:v22 selectedMessageContent:v18 primaryMessageContentRequest:v36 targetPreference:0 preferQuickCompositionalActions:0];

  id v32 = [(ConversationViewControllerBase *)self delegate];
  id v23 = [MailActionsViewDataSource alloc];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100078BF8;
  v37[3] = &unk_1006050F0;
  v37[4] = self;
  id v24 = v12;
  id v38 = v24;
  double v25 = v33;
  __int16 v39 = v25;
  id v26 = v15;
  id v42 = v26;
  id v27 = v35;
  id v43 = v27;
  id v28 = v14;
  id v40 = v28;
  id v29 = v32;
  id v41 = v29;
  id v30 = [(MailActionsViewDataSource *)v23 initWithBuilderBlock:v37];

  return v30;
}

- (id)_preparationForFooterViewCardActionsForMailActionsViewController:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100078E38;
  v7[3] = &unk_100605118;
  v7[4] = self;
  id v8 = a3;
  id v3 = v8;
  id v4 = objc_retainBlock(v7);
  id v5 = objc_retainBlock(v4);

  return v5;
}

- (id)_completionForFooterViewCardActionsForMailActionsViewController:(id)a3
{
  id v4 = [(ConversationViewController *)self selectedMessage];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(ConversationViewController *)self targetMessageForBarButtonTriage];
  }
  id v7 = v6;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100078FE8;
  v12[3] = &unk_100605140;
  void v12[4] = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = objc_retainBlock(v12);
  double v10 = objc_retainBlock(v9);

  return v10;
}

- (id)_completionForSwipeCardActionsForMailActionsViewController:(id)a3 messageListItem:(id)a4
{
  id v5 = a3;
  id v6 = [(ConversationViewController *)self selectedMessage];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(ConversationViewController *)self targetMessageForBarButtonTriage];
  }
  id v9 = v8;

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v5);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000792C4;
  v14[3] = &unk_100605168;
  objc_copyWeak(&v16, &location);
  void v14[4] = self;
  id v15 = v9;
  id v10 = v9;
  double v11 = objc_retainBlock(v14);
  id v12 = objc_retainBlock(v11);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

- (void)mailActionsViewController:(id)a3 didSelectAction:(id)a4
{
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

- (BOOL)_shouldArchiveByDefault
{
  v2 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  unsigned __int8 v3 = [v2 shouldArchiveByDefault];

  return v3;
}

- (id)_messageItemIDAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self collectionViewDataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  return v6;
}

- (int64_t)countOfMessages
{
  unsigned __int8 v3 = [(ConversationViewControllerBase *)self collectionView];
  id v4 = [(ConversationViewController *)self collectionViewDataSource];
  if ((uint64_t)[v4 numberOfSectionsInCollectionView:v3] < 1) {
    id v5 = 0;
  }
  else {
    id v5 = [v4 collectionView:v3 numberOfItemsInSection:0];
  }
  int64_t v6 = [(ConversationViewController *)self countOfSummaries];
  int64_t v7 = ((uint64_t)v5 - v6) & ~(((uint64_t)v5 - v6) >> 63);

  return v7;
}

- (int64_t)countOfSummaries
{
  if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    unsigned __int8 v3 = [(ConversationViewController *)self topSummaryItemID];

    id v4 = [(ConversationViewController *)self inlineSummaryItemID];

    uint64_t v5 = [(ConversationViewController *)self previousTopSummaryItemID];
    uint64_t v6 = [(ConversationViewController *)self previousInlineSummaryItemID];
    int64_t v7 = (void *)v6;
    uint64_t v8 = 1;
    if (v3) {
      uint64_t v8 = 2;
    }
    if (v4) {
      int64_t v9 = v8;
    }
    else {
      int64_t v9 = v3 != 0;
    }
    if (v9) {
      goto LABEL_20;
    }
    if (!(v5 | v6))
    {
      int64_t v9 = 0;
LABEL_20:

      return v9;
    }
    id v10 = [(ConversationViewController *)self collectionViewDataSource];
    double v11 = v10;
    if (v5)
    {
      id v12 = [v10 indexPathForItemIdentifier:v5];
      int64_t v9 = v12 != 0;

      if (!v7) {
        goto LABEL_19;
      }
    }
    else
    {
      int64_t v9 = 0;
      if (!v7)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    id v13 = [v11 indexPathForItemIdentifier:v7];
    if (v13) {
      ++v9;
    }

    goto LABEL_19;
  }
  return 0;
}

- (void)_showSingleMessage:(id)a3 animationOffset:(CGPoint)a4 initialScrollOffset:(CGPoint)a5
{
  uint64_t v6 = [a3 contentRequest:a4.x, a4.y, a5.x, a5.y];
  id v17 = [v6 message];

  int64_t v7 = [v17 itemID];
  uint64_t v8 = [(ConversationViewController *)self _cellForMessageItemIDIfExpanded:v7];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!*(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4))
      {
        int64_t v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
        id v10 = *(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4);
        *(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4) = v9;
      }
      [(ConversationViewController *)self setPinnedItem:0];
      double v11 = [v8 messageViewController];
      id v12 = [v11 messageContentView];

      id v13 = [(ConversationViewController *)self expandedContentItemIDs];
      id v14 = [v17 itemID];
      [v13 addObject:v14];

      id v15 = [v8 messageViewController];
      [v15 setAutomaticallyCollapseQuotedContent:0];

      id v16 = [v12 footerView];
      [v16 setBlockquotesAreExpanded:1];

      [v12 reload];
    }
  }
}

- (BOOL)_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ConversationViewController;
  unsigned __int8 v5 = [(ConversationViewControllerBase *)&v10 _shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:v4];
  uint64_t v6 = [(ConversationViewController *)self collectionViewDataSource];
  int64_t v7 = [(id)v6 itemIdentifierForIndexPath:v4];

  uint64_t v8 = [(ConversationViewController *)self expandedContentItemIDs];
  LOBYTE(v6) = [v8 containsObject:v7];

  return v5 & (v6 ^ 1);
}

- (void)_reloadCellsAtIndexPaths:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = [(ConversationViewController *)self messageList];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100079E84;
  v9[3] = &unk_100604C28;
  id v8 = v6;
  id v10 = v8;
  [(ConversationViewController *)self _performDataSourceUpdateAnimated:v4 collection:v7 update:v9];
}

- (int64_t)_headerDisplayOptionsForCell:(id)a3 displayedAsSingleMessage:(BOOL)a4
{
  unsigned int v5 = [(ConversationViewControllerBase *)self beingPreviewed];
  unsigned int v6 = [(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList];
  int64_t v7 = 2;
  if (v5) {
    int64_t v7 = 18;
  }
  if (v6) {
    return v7 | 0x20;
  }
  else {
    return v7;
  }
}

- (void)_updateBarButtonsEnabled
{
  id v4 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  unsigned __int8 v3 = [(ConversationViewControllerBase *)self barItemsManager];
  [v3 updateEnabledStatesForMessage:v4];
}

- (void)_scrollToInitialPosition
{
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10007A73C;
  v37[3] = &unk_1006051B8;
  v37[4] = self;
  id v4 = objc_retainBlock(v37);
  [(ConversationViewControllerBase *)self initialScrollOffset];
  double v7 = v6;
  double v8 = v5;
  if (v6 == CGPointZero.x && v5 == CGPointZero.y)
  {
    id v12 = [(ConversationViewControllerBase *)self pinnedItem];
    if (!v12)
    {
      uint64_t v18 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      objc_super v19 = [v18 displayMessageItemID];
      id v20 = [(ConversationViewController *)self topSummaryItemID];
      id v21 = [v20 anchorMessageItemID];
      BOOL v22 = v19 == v21;

      if (v22)
      {
        if ([(ConversationViewController *)self _shouldShowSummarizeControls:v19])
        {
          v31 = +[ConversationViewController log];
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            id v32 = [v18 ef_publicDescription];
            *(_DWORD *)buf = 138412290;
            double v39 = *(double *)&v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Scroll to top summary item: %@", buf, 0xCu);
          }
          id v28 = [(ConversationViewController *)self topSummaryItemID];
          ((void (*)(void *, void *, void, void))v4[2])(v4, v28, 0, 0);
        }
        else
        {
          id v35 = +[ConversationViewController log];
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            unsigned __int8 v36 = [v18 ef_publicDescription];
            *(_DWORD *)buf = 138412290;
            double v39 = *(double *)&v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Scroll to reference message list item: %@", buf, 0xCu);
          }
          id v28 = [v18 displayMessageItemID];
          ((void (*)(void *, void *, void, void))v4[2])(v4, v28, 0, 0);
        }
      }
      else
      {
        id v23 = [(ConversationViewController *)self inlineSummaryItemID];
        id v24 = [v23 anchorMessageItemID];
        BOOL v25 = v19 == v24;

        if (v25)
        {
          id v33 = +[ConversationViewController log];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v34 = [v18 ef_publicDescription];
            *(_DWORD *)buf = 138412290;
            double v39 = *(double *)&v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Scroll to inline summary item: %@", buf, 0xCu);
          }
          id v28 = [(ConversationViewController *)self inlineSummaryItemID];
          ((void (*)(void *, void *, void, uint64_t))v4[2])(v4, v28, 0, 1);
        }
        else
        {
          id v26 = +[ConversationViewController log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v18 ef_publicDescription];
            *(_DWORD *)buf = 138412290;
            double v39 = *(double *)&v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Scroll to reference message list item: %@", buf, 0xCu);
          }
          id v28 = [v18 displayMessageItemID];
          ((void (*)(void *, void *, void, uint64_t))v4[2])(v4, v28, 0, 1);
        }
      }

      goto LABEL_36;
    }
    id v13 = +[ConversationViewController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v2 = [v12 ef_publicDescription];
      id v14 = [v12 dynamicOffset];
      id v15 = [v14 ef_publicDescription];
      *(_DWORD *)buf = 138412546;
      double v39 = *(double *)&v2;
      __int16 v40 = 2112;
      id v41 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Scroll to pinned item: %@, dynamicOffset: %@", buf, 0x16u);
    }
    id v16 = [(ConversationViewController *)self topSummaryItemID];
    if (v16
      && ([v12 indexPath],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 item] == (id)1))
    {
      BOOL v17 = 1;
    }
    else
    {
      id v29 = [(ConversationViewController *)self topSummaryItemID];
      if (v29)
      {
        BOOL v17 = 0;
      }
      else
      {
        id v30 = [v12 indexPath];
        BOOL v17 = [v30 item] == 0;
      }
      if (!v16) {
        goto LABEL_24;
      }
    }

LABEL_24:
    uint64_t v18 = [v12 itemID];
    objc_super v19 = [v12 dynamicOffset];
    ((void (*)(void *, void *, void *, BOOL))v4[2])(v4, v18, v19, !v17);
LABEL_36:

    goto LABEL_37;
  }
  id v10 = +[ConversationViewController log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Scroll to initial scroll offset: %.2f", buf, 0xCu);
  }

  double v11 = [(ConversationViewControllerBase *)self collectionView];
  [v11 setContentOffset:0 animated:v7];

  id v12 = [(ConversationViewControllerBase *)self previewState];
  [v12 transitionAfterScrollingToReferenceMessage];
LABEL_37:
}

- (BOOL)_shouldShowSummarizeControls:(id)a3
{
  id v4 = a3;
  if ((+[MUIManualSummaryController shouldAlwaysHideConversationSummarizeControl] & 1) == 0)
  {
    double v5 = [(ConversationViewController *)self initiallyUnreadItemIDs];
    if (![v5 count])
    {
      unsigned __int8 v9 = 0;
LABEL_8:

      goto LABEL_10;
    }
    double v6 = [(ConversationViewController *)self initiallyUnreadItemIDs];
    unsigned int v7 = [v6 containsObject:v4];

    if (v7)
    {
      if ((id)[(ConversationViewController *)self countOfMessages] != (id)1)
      {
        unsigned __int8 v9 = 1;
        goto LABEL_10;
      }
      double v5 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      double v8 = [v5 summary];
      unsigned __int8 v9 = +[MUIManualSummaryController shouldAllowSummarizationForContentLength:](MUIManualSummaryController, "shouldAllowSummarizationForContentLength:", [v8 length]);

      goto LABEL_8;
    }
  }
  unsigned __int8 v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)_isItemInitiallyUnreadAtIndexPath:(id)a3
{
  id v4 = [(ConversationViewController *)self _messageItemIDAtIndexPath:a3];
  if (v4) {
    unsigned __int8 v5 = [*(id *)((char *)&self->_initiallyUnreadItemIDs + 4) containsObject:v4];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_fetchConversationAttachmentDataWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007AC88;
  v4[3] = &unk_100605230;
  unsigned __int8 v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ConversationViewController *)v5 _allMessageIDsWithCompletion:v4];
}

- (void)_fetchConversationRichLinkDataWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007AF60;
  v4[3] = &unk_100605230;
  unsigned __int8 v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(ConversationViewController *)v5 _allMessageIDsWithCompletion:v4];
}

- (void)setBeingPreviewed:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ConversationViewController;
  -[ConversationViewControllerBase setBeingPreviewed:](&v8, "setBeingPreviewed:");
  unsigned __int8 v5 = [(ConversationViewControllerBase *)self cellConfigurator];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007B254;
  v6[3] = &unk_100605298;
  BOOL v7 = a3;
  v6[4] = self;
  [v5 enumerateExpandedCellsWithBlock:v6];
}

- (void)_configureExpandedCell:(id)a3 atIndexPath:(id)a4 viewModel:(id)a5 collapseQuotedContent:(BOOL)a6
{
  BOOL v85 = a6;
  id v9 = a3;
  id v94 = a4;
  id v89 = a5;
  id v10 = [(ConversationViewController *)self blankConversationTailspinToken];
  [v10 cancel];

  unsigned int v91 = [(ConversationViewController *)self _isDisplayingSingleMessage];
  unsigned int v84 = [(ConversationViewControllerBase *)self allowQuickReply];
  v90 = [v89 messageContentRequest];
  double v11 = [v9 messageViewController];

  if (!v11)
  {
    id v12 = [(ConversationViewControllerBase *)self messageViewControllerReuseQueue];
    id v13 = [v12 dequeueMessageViewControllerForContentRequest:v90];

    id v14 = [(ConversationViewControllerBase *)self avatarGenerator];
    [v13 setAvatarGenerator:v14];

    [v9 setMessageViewController:v13];
  }
  id val = [v9 messageViewController];
  [val setDelegate:self];
  id v15 = [(ConversationViewControllerBase *)self contactStore];
  [val setContactStore:v15];

  id v16 = [(ConversationViewControllerBase *)self avatarGenerator];
  [val setAvatarGenerator:v16];

  BOOL v17 = [val messageContentView];
  v93 = v17;
  uint64_t v18 = [(ConversationViewControllerBase *)self cellConfigurator];
  id v19 = [v18 expansionStatusForMessageAtIndexPath:v94];

  uint64_t v20 = v91 ^ 1;
  if (v19 == (id)2) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
  [v17 setSuppressScrolling:v21];
  BOOL v22 = [(ConversationViewControllerBase *)self contactStore];
  [v17 setContactStore:v22];

  id v23 = [v17 webView];
  [v23 setUserInteractionEnabled:v19 != (id)2];

  [v17 setAllowNotAuthenticatedBanner:[self isShowingGroupedSenderMessageList]];
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList]) {
    [v17 setHideSenderSpecificBanners:(uint64_t)[v94 row] > 0];
  }
  id v24 = +[ConversationViewController log];
  id v88 = v19;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v25 = [v89 messageContentRequest];
    id v26 = [v25 itemID];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v94;
    *(_WORD *)&unsigned char buf[12] = 2114;
    id v114 = v26;
    __int16 v115 = 2048;
    v116 = v93;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Configuring expanded cell at indexPath: %@ with itemID: %{public}@, contentView:%p", buf, 0x20u);
  }
  id v27 = [v90 message];
  [v9 setShouldArchiveByDefault:[v27 shouldArchiveByDefault]];
  id v28 = [val contentRequest];
  id v29 = [v28 isEqual:v90];

  unsigned int v30 = [v9 isConfiguredForSingleMessageDisplay];
  v31 = +[ConversationViewController log];
  int v32 = v91 ^ v30;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v29 ^ 1;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Content requests differs %{BOOL}d, singleMessageConfigurationDiffers %{BOOL}d", buf, 0xEu);
  }

  id v33 = [v27 readLater];
  if (v33 || ([v27 sendLaterDate], (id v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v79 = [v27 followUp];
    BOOL v80 = v79 != 0;

    if (((v29 ^ 1 | v32 | v80) & 1) == 0)
    {
      [v9 setConfiguredForSingleMessageDisplay:v91];
      [val setAutomaticallyCollapseQuotedContent:v85 reloadIfNeeded:1];
      goto LABEL_36;
    }
  }
  id v87 = [v93 headerView];
  id v34 = objc_alloc_init((Class)NSMutableArray);
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, val);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v9);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_10007C43C;
  v106[3] = &unk_1006052C0;
  objc_copyWeak(&v107, &from);
  objc_copyWeak(&v108, (id *)buf);
  objc_copyWeak(&v109, &location);
  char v110 = v91;
  v86 = objc_retainBlock(v106);
  if (v19 == (id)2)
  {
    id v105 = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&v105, v87);
    id v37 = [_TtC10MobileMail37SemiExpandedMessageHeaderSubjectBlock alloc];
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472;
    v102[2] = sub_10007C540;
    v102[3] = &unk_1006052E8;
    objc_copyWeak(&v104, &v105);
    v103 = v86;
    id v38 = -[SemiExpandedMessageHeaderSubjectBlock initWithHandler:](v37, "initWithHandler:", v102, &v107, &v108, &v109);
    [v34 addObject:v38];

    objc_destroyWeak(&v104);
    objc_destroyWeak(&v105);
  }
  else
  {
    double v39 = ((void (*)(void *, uint64_t, uint64_t))v86[2])(v86, v35, v36);
    [v34 addObject:v39];
  }
  unsigned int v40 = [(ConversationViewController *)self _shouldShowMailboxForMessage:v27];
  unsigned int v41 = [(ConversationViewController *)self _shouldShowTimeSensitiveForMessage:v27];
  id v42 = sub_10007C5F0(self, v27);
  [v34 ef_addOptionalObject:v42];

  if (v88 != (id)2)
  {
    id v43 = -[MessageHeaderSubjectBlock initWithFrame:]([MessageHeaderSubjectBlock alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [v34 addObject:v43];
    [v93 setHeaderViewSubjectBlock:v43];
    [(MessageHeaderSubjectBlock *)v43 setHidden:v20];
  }
  if (!v40)
  {
    if (v41)
    {
      id v49 = [v27 category];
      id v50 = [v49 type];

      id v51 = [[_TtC10MobileMail25MFTimeSensitiveBannerView alloc] initWithCategory:v50 showDescription:[(ConversationViewController *)self _shouldShowTimeSensitiveDescriptionForCategory:v50]];
      [(ConversationViewController *)self setTimeSensitiveBannerView:v51];

      id v52 = [(ConversationViewController *)self timeSensitiveBannerView];
      [v34 insertObject:v52 atIndex:0];

      [(ConversationViewController *)self _updateTimeSensitiveDefaultForCategory:v50];
    }
    v48 = 0;
    if (v29) {
      goto LABEL_31;
    }
    goto LABEL_26;
  }
  BOOL v44 = [MFMessageSashHeaderBlock alloc];
  id v45 = +[UIApplication sharedApplication];
  id v46 = [v45 accountsProvider];
  v47 = -[MFMessageSashHeaderBlock initWithFrame:accountsProvider:](v44, "initWithFrame:accountsProvider:", v46, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  [(MFMessageSashHeaderBlock *)v47 setShouldShowMailbox:1];
  [v34 insertObject:v47 atIndex:0];
  v48 = v47;
  if ((v29 & 1) == 0)
  {
LABEL_26:
    [v87 setHeaderBlocks:v34];
    if (v48)
    {
      [v87 setPinnedBlock:v48];
    }
    else if (v41)
    {
      id v53 = [(ConversationViewController *)self timeSensitiveBannerView];
      BOOL v54 = v53 == 0;

      if (!v54)
      {
        v55 = [(ConversationViewController *)self timeSensitiveBannerView];
        [v87 setPinnedBlock:v55];
      }
    }
  }
LABEL_31:
  [v9 setConfiguredForSingleMessageDisplay:v91];
  [val setAutomaticallyCollapseQuotedContent:v85 reloadIfNeeded:v29];
  [val setContentRequest:v90];
  CGRect v56 = [(ConversationViewController *)self predictedMailboxForConversation];
  BOOL v57 = v56 == 0;

  if (v57) {
    [(ConversationViewController *)self _updatePredictedMailboxForConversation];
  }
  id v58 = [v9 predictedMailbox];
  BOOL v59 = v58 == 0;

  if (v59) {
    [(ConversationViewController *)self configurePredictedMailboxForCell:v9 forMessage:v27];
  }
  BOOL v60 = [v27 itemID];
  [(ConversationViewController *)self _updateStickySubjectForItemID:v60 cell:v9 indexPath:v94];

  objc_destroyWeak(v83);
  objc_destroyWeak(v82);
  objc_destroyWeak(v81);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

LABEL_36:
  [v9 setOnlyMaskBottomCorners:v84 & v91];
  __int16 v61 = +[ConversationViewController log];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v62 = [v93 headerView];
    __int16 v63 = [v62 headerBlocks];
    BOOL v64 = [v89 messageContentRequest];
    v65 = [v64 itemID];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v63;
    *(_WORD *)&unsigned char buf[12] = 2112;
    id v114 = v94;
    __int16 v115 = 2114;
    v116 = v65;
    __int16 v117 = 2048;
    v118 = v93;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Header blocks %{public}@ for expanded cell at indexPath: %@ with itemID: %{public}@, contentView:%p", buf, 0x2Au);
  }
  if (![(ConversationViewControllerBase *)self didCompleteFirstPaint]) {
    -[ConversationViewControllerBase setDidCompleteFirstPaint:](self, "setDidCompleteFirstPaint:", [val didCompleteFirstPaint]);
  }
  unsigned int v66 = [(ConversationViewControllerBase *)self allowQuickReply];
  int v67 = _os_feature_enabled_impl();
  if ((v66 & [(ConversationViewController *)self _isQuickReplyMessageAtIndexPath:v94]) == 1)
  {
    v68 = [(ConversationViewControllerBase *)self quickReplyAnimationContext];
    v69 = [v68 getObject];

    if ((*(unsigned int (**)(void, void *))(EFIsNull + 16))(EFIsNull, v69)) {
      v70 = 0;
    }
    else {
      v70 = v69;
    }
    id v71 = v70;

    if (!v71)
    {
      [(ConversationViewController *)self _resetQuickReplyViewControllerWithReason:4 resetCompose:1 override:0];
      v72 = +[ConversationViewController log];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        v73 = objc_opt_class();
        sub_10045849C(v73, (uint64_t)self, (uint64_t)buf, v72);
      }
    }
    [v9 prepareForQuickReplyAnimationWithContext:v71];
    v74 = [(ConversationViewController *)self _quickReplyView];
    [v74 setHidden:1];

    +[QuickReplyView defaultHeight];
    -[ConversationViewControllerBase setQuickReplyHeight:](self, "setQuickReplyHeight:");
  }
  if ([(ConversationViewControllerBase *)self beingPreviewed]) {
    [v93 setShowMessageFooter:0];
  }
  v75 = [v93 footerView];
  [v75 setIsSemiExpanded:v88 == (id)2];
  if (v67)
  {
    [v75 setUndoSendButtonHidden:[self _isMessageInOutbox:v27] ^ 1];
  }
  else
  {
    v76 = [v9 itemID];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v77 = [(ConversationViewController *)self messageLoadingScheduler];
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_10007C7AC;
    v95[3] = &unk_100605338;
    id v96 = v27;
    objc_copyWeak(&v101, &location);
    id v97 = v9;
    id v78 = v76;
    id v98 = v78;
    id v99 = v75;
    id v100 = v94;
    [v77 performBlock:v95];

    objc_destroyWeak(&v101);
    objc_destroyWeak(&location);
  }
}

- (BOOL)_shouldRemoveBannerBlock:(id)a3 forHeaderViewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 type];
  if (!v8)
  {
    id v9 = [v7 sendLaterDate];
    LOBYTE(v11) = v9 == 0;
LABEL_8:

    goto LABEL_9;
  }
  if (v8 == (id)1)
  {
    id v9 = [v7 readLaterDate];
    if (v9)
    {
      id v10 = [(ConversationViewControllerBase *)self delegate];
      unsigned int v11 = [v10 conversationViewControllerAllowsRemindMeAction:self] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 1;
    }
    goto LABEL_8;
  }
  LOBYTE(v11) = 0;
LABEL_9:

  return v11;
}

- (void)configurePredictedMailboxForCell:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EFPromise promise];
  id v9 = [v8 future];
  [v6 setPredictedMailbox:v9];

  id v10 = [(ConversationViewController *)self mailboxPredictionScheduler];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007CC1C;
  v13[3] = &unk_100604618;
  id v11 = v8;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [v10 performBlock:v13];
}

- (void)_configureCollapsedCell:(id)a3 atIndexPath:(id)a4 viewModel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ConversationViewController *)self blankConversationTailspinToken];
  [v11 cancel];

  id v12 = +[ConversationViewController log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v10 messageContentRequest];
    id v14 = [v13 itemID];
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2114;
    uint64_t v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Configuring collapsed cell at indexPath: %@ with itemID: %{public}@", (uint8_t *)&v15, 0x16u);
  }
  if (sub_1000A4FA0((BOOL)self)) {
    [v8 addConversationSearchOverlay];
  }
}

- (id)_currentlyVisibleIndexPath
{
  id v3 = [(ConversationViewController *)self collectionViewDataSource];
  id v4 = [(ConversationViewController *)self _focusedMessageItemID];
  unsigned __int8 v5 = [v3 indexPathForItemIdentifier:v4];

  return v5;
}

- (id)_indexPathForReferenceMessage
{
  id v3 = [(ConversationViewController *)self collectionViewDataSource];
  id v4 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  unsigned __int8 v5 = [v4 displayMessageItemID];
  id v6 = [v3 indexPathForItemIdentifier:v5];

  return v6;
}

- (id)_indexPathOfMessageViewControllerMessage:(id)a3
{
  id v4 = [a3 contentRequest];
  unsigned __int8 v5 = [v4 message];

  id v6 = [(ConversationViewController *)self collectionViewDataSource];
  id v7 = [v5 itemID];
  id v8 = [v6 indexPathForItemIdentifier:v7];

  return v8;
}

- (id)_visibleIndexPathForMessageViewController:(id)a3
{
  id v3 = [(ConversationViewController *)self _indexPathOfMessageViewControllerMessage:a3];

  return v3;
}

- (id)_targetMessageOrItemIDForBarButtonTriage:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(ConversationViewController *)self collectionViewDataSource];
  id v6 = [v5 snapshot];

  id v7 = [(ConversationViewController *)self _messageItemIDsFromShapshot:v6];
  if (![v7 count])
  {
    id v17 = 0;
    goto LABEL_22;
  }
  unsigned __int8 v8 = [(ConversationViewController *)self _isDisplayingSingleMessage];
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = sub_1000750D0;
  id v37 = sub_1000750E0;
  id v38 = 0;
  id v9 = [(ConversationViewControllerBase *)self cellConfigurator];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10007D51C;
  v27[3] = &unk_1006053E0;
  unsigned __int8 v31 = v8;
  BOOL v32 = v3;
  id v28 = &stru_100605378;
  id v29 = &stru_1006053B8;
  unsigned int v30 = &v33;
  [v9 enumerateExpandedCellsWithBlock:v27];

  id v10 = (void *)v34[5];
  if (!v10)
  {
    id v11 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v12 = [v11 displayMessageItemID];
    uint64_t v13 = (uint64_t)[v7 indexOfObject:v12];

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v14 = +[ConversationViewController log];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100458514();
      }

      int v15 = [(ConversationViewController *)self _referenceDisplayMessage];
      uint64_t v16 = +[EFPair pairWithFirst:0 second:v15];
    }
    else
    {
      if ((id)[(ConversationViewControllerBase *)self conversationSortOrder] == (id)1)
      {
        if (v13 <= 1) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = v13;
        }
        id v19 = (char *)(v18 - 1);
      }
      else
      {
        uint64_t v20 = (char *)[v7 count];
        if (v13 + 1 < (uint64_t)(v20 - 1)) {
          id v19 = (char *)(v13 + 1);
        }
        else {
          id v19 = v20 - 1;
        }
      }
      int v15 = [v7 objectAtIndexedSubscript:v19];
      if (v3)
      {
        uint64_t v21 = [(ConversationViewController *)self _messageForItemID:v15];
        BOOL v22 = [v21 displayMessage];
        id v23 = [v22 result];
        uint64_t v24 = +[EFPair pairWithFirst:0 second:v23];
        BOOL v25 = (void *)v34[5];
        v34[5] = v24;

LABEL_20:
        id v10 = (void *)v34[5];
        goto LABEL_21;
      }
      uint64_t v16 = +[EFPair pairWithFirst:v15 second:0];
    }
    uint64_t v21 = (void *)v34[5];
    v34[5] = v16;
    goto LABEL_20;
  }
LABEL_21:
  id v17 = v10;

  _Block_object_dispose(&v33, 8);
LABEL_22:

  return v17;
}

- (id)targetMessageItemIDForBarButtonTriage
{
  v2 = [(ConversationViewController *)self _targetMessageOrItemIDForBarButtonTriage:0];
  BOOL v3 = [v2 first];

  return v3;
}

- (id)targetMessageForBarButtonTriage
{
  v2 = [(ConversationViewController *)self _targetMessageOrItemIDForBarButtonTriage:1];
  BOOL v3 = [v2 second];

  return v3;
}

- (void)_updateHandoffWithMessageAtIndexPath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(ConversationViewController *)self collectionViewDataSource];
  id v6 = [v5 itemIdentifierForIndexPath:v4];

  if (v6)
  {
    id v7 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v6];
    unsigned __int8 v8 = [(ConversationViewControllerBase *)self handoffCoordinator];
    [v8 setHandoffMessageRequest:v7];
  }
  else
  {
    id v9 = [(ConversationViewControllerBase *)self handoffCoordinator];
    [v9 setHandoffMessageRequest:0];

    id v10 = +[ConversationViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100458548();
    }
  }
}

- (BOOL)_shouldReloadEmptyMessageList
{
  BOOL v3 = [(ConversationViewController *)self messageList];
  id v4 = [v3 allItemIDs];
  unsigned __int8 v5 = [v4 resultIfAvailable];

  id v6 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  BOOL v7 = 0;
  if ([v6 count] && v5) {
    BOOL v7 = [v5 count] == 0;
  }

  return v7;
}

- (void)_autoReloadDataSourceForEmptyAddIfNeeded
{
  if ([(ConversationViewController *)self _shouldReloadEmptyMessageList]
    && ![(ConversationViewController *)self didAutoReloadDataSource])
  {
    [(ConversationViewController *)self setDidAutoReloadDataSource:1];
    id v4 = +[ConversationViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_1004585B4();
    }

    [(ConversationViewController *)self _reloadDataSource];
  }
}

- (id)_persistentIDForEMMessageObjectID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(ConversationViewController *)self messageRepository];
  id v6 = [v5 persistentIDForMessageObjectID:v4];

  return v6;
}

- (BOOL)_isMessageInOutbox:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mailboxes];
  unsigned __int8 v5 = [v4 ef_any:&stru_100605420];

  id v6 = [v3 mailboxes];
  unsigned __int8 v7 = [v6 ef_any:&stru_100605440];

  return v5 & (v7 ^ 1);
}

- (BOOL)isMessageListUnfiltered
{
  id v3 = [(ConversationViewController *)self messageList];
  id v4 = [(ConversationViewController *)self messageList];
  unsigned __int8 v5 = [v4 unfilteredMessageList];
  BOOL v6 = v3 == v5;

  return v6;
}

- (id)pinnedIndexPathProvider
{
  id v3 = *(id *)((char *)&self->_pinnedIndexPathProvider + 4);
  if (!v3)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_10007DD8C;
    v8[3] = &unk_100605468;
    objc_copyWeak(&v9, &location);
    id v4 = objc_retainBlock(v8);
    unsigned __int8 v5 = *(id *)((char *)&self->_pinnedIndexPathProvider + 4);
    *(id *)((char *)&self->_pinnedIndexPathProvider + 4) = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id v3 = *(id *)((char *)&self->_pinnedIndexPathProvider + 4);
  }
  id v6 = objc_retainBlock(v3);

  return v6;
}

- (void)setPinnedItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v8 setPinnedItem:v4];
  if (v4)
  {
    unsigned __int8 v5 = [v4 itemID];
    id v6 = [(ConversationViewController *)self _priorityLoadingComparatorForPinnedItemID:v5];
    unsigned __int8 v7 = [(ConversationViewController *)self contentRequestQueue];
    [v7 setComparator:v6];
  }
}

- (void)pinCurrentItem
{
  id v13 = [(ConversationViewControllerBase *)self displayMetrics];
  +[MFCollapsedMessageCell defaultHeightWithDisplayMetrics:](MFCollapsedMessageCell, "defaultHeightWithDisplayMetrics:");
  double v4 = v3;

  if ((id)[(ConversationViewControllerBase *)self conversationSortOrder] == (id)1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 4;
  }
  id v6 = [(ConversationViewControllerBase *)self collectionView];
  [v6 mf_mostVisibleCellNearestEdge:v5 preferredMinimumHeight:v4];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    unsigned __int8 v7 = [v14 itemID];

    if (v7)
    {
      objc_super v8 = [(ConversationViewControllerBase *)self collectionView];
      id v9 = [v8 mf_dynamicOffsetForVisibleCell:v14];

      id v10 = [v14 itemID];
      id v11 = [(ConversationViewController *)self pinnedIndexPathProvider];
      id v12 = +[PinnedConversationItem pinnedItemWithID:v10 dynamicOffset:v9 indexPathProvider:v11];

      [(ConversationViewController *)self setPinnedItem:v12];
    }
  }
}

- (void)pinItemAtIndexPath:(id)a3 dynamicOffset:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  unsigned __int8 v7 = [(ConversationViewController *)self collectionViewDataSource];
  objc_super v8 = [v7 itemIdentifierForIndexPath:v11];

  id v9 = [(ConversationViewController *)self pinnedIndexPathProvider];
  id v10 = +[PinnedConversationItem pinnedItemWithID:v8 dynamicOffset:v6 indexPathProvider:v9];
  [(ConversationViewController *)self setPinnedItem:v10];
}

- (id)_referenceMessageListMailboxScope
{
  double v3 = [(ConversationViewController *)self referenceMessageListQuery];
  double v4 = [v3 predicate];
  uint64_t v5 = [(ConversationViewController *)self messageRepository];
  id v6 = [v5 mailboxRepository];
  unsigned __int8 v7 = +[EMMessageListItemPredicates mailboxScopeForPredicate:v4 withMailboxTypeResolver:v6];

  return v7;
}

- (int64_t)_dataOwnerForDragSessionAtIndexPath:(id)a3
{
  double v4 = [(ConversationViewController *)self _messageAtIndexPath:a3];
  uint64_t v5 = [(ConversationViewController *)self _referenceMessageListMailboxScope];
  if ([v4 isInManagedAccountWithSourceMailboxScope:v5]) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

- (id)_dragItemsForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ConversationViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    id v19 = [v4 row];
    __int16 v20 = 2048;
    id v21 = [v4 section];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#DragAndDrop Conversation view drag source items requested for indexPath {%ld, %ld}", buf, 0x16u);
  }

  int64_t v6 = [(ConversationViewController *)self _messageAtIndexPath:v4];
  if (!v6)
  {
    id v10 = +[ConversationViewController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#DragAndDrop No items found for indexPath", buf, 2u);
    }
    id v14 = 0;
    goto LABEL_11;
  }
  unsigned __int8 v7 = +[ConversationViewController log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#DragAndDrop Will begin dragging message", buf, 2u);
  }

  objc_super v8 = [(ConversationViewController *)self messageList];
  id v9 = +[MessageListItemDragContext withItem:v6 messageList:v8];

  id v10 = [v9 dragItem];
  id v17 = v6;
  id v11 = +[NSArray arrayWithObjects:&v17 count:1];
  id v12 = [(ConversationViewController *)self undoManager];
  id v13 = +[MFTriageInteraction interactionWithMessageListItems:v11 undoManager:v12 origin:3 actor:2];

  [v10 setLocalObject:v13];
  if (v10)
  {
    uint64_t v16 = v10;
    id v14 = +[NSArray arrayWithObjects:&v16 count:1];
LABEL_11:

    goto LABEL_13;
  }
  id v14 = 0;
LABEL_13:

  return v14;
}

- (id)_messageContentViewForMessageItemID:(id)a3
{
  double v3 = [(ConversationViewController *)self _cellForMessageItemIDIfExpanded:a3];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 expanded])
  {
    id v4 = [v3 messageViewController];
    uint64_t v5 = [v4 messageContentView];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_getCurrentlySelectedMessageContentForMessageItemID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ConversationViewController *)self _messageContentViewForMessageItemID:v4];
  int64_t v6 = [v5 selectedHTML];
  if ([v6 length])
  {
    id v9 = v6;
    unsigned __int8 v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)_clearSelectedMessageContentForMessageItemID:(id)a3
{
  id v3 = [(ConversationViewController *)self _messageContentViewForMessageItemID:a3];
  [v3 clearSelectedHTML];
}

- (void)_allMessageIDsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ConversationViewController *)self messageList];
  int64_t v6 = [v5 allItemIDs];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_10007E9CC;
  v8[3] = &unk_100605208;
  id v7 = v4;
  id v9 = v7;
  [v6 addSuccessBlock:v8];
  [v6 addFailureBlock:&stru_1006054E8];
}

- (id)_allMessages
{
  id v3 = [(ConversationViewController *)self _conversationViewQueryIncludeRelated:0];
  id v4 = +[EFPromise promise];
  uint64_t v5 = [(ConversationViewController *)self messageRepository];
  int64_t v6 = [(ConversationViewController *)self countOfMessages];
  id v7 = [v4 completionHandlerAdapter];
  [v5 performQuery:v3 limit:v6 completionHandler:v7];

  objc_super v8 = [v4 future];
  id v9 = [v8 result:0];

  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = &__NSArray0__struct;
  }
  id v11 = v10;

  return v11;
}

- (id)_messageListItemsForBarButtonTriage
{
  id v3 = [(ConversationViewControllerBase *)self delegate];
  if ([(ConversationViewControllerBase *)self shownAsConversation])
  {
    if ([(ConversationViewControllerBase *)self shownAsConversation]
      && ([(ConversationViewControllerBase *)self referenceMessageListItem],
          id v4 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v5 = objc_opt_isKindOfClass(),
          v4,
          (v5 & 1) != 0))
    {
      int64_t v6 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      id v17 = v6;
      id v7 = +[NSArray arrayWithObjects:&v17 count:1];
    }
    else
    {
      id v10 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v12 = [(ConversationViewControllerBase *)self referenceMessageListItem];
        uint64_t v16 = v12;
        id v7 = +[NSArray arrayWithObjects:&v16 count:1];
      }
      else if (objc_opt_respondsToSelector())
      {
        int v15 = [(ConversationViewControllerBase *)self referenceMessageListItem];
        id v7 = [v3 conversationViewController:self messagesToActOnForReferenceMessage:v15];
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = [(ConversationViewController *)self _referenceDisplayMessage];
    id v9 = (void *)v8;
    if (v8)
    {
      uint64_t v18 = v8;
      id v7 = +[NSArray arrayWithObjects:&v18 count:1];
    }
    else
    {
      id v7 = 0;
    }
  }
  if (![v7 count])
  {
    uint64_t v13 = [(ConversationViewController *)self _allMessages];

    id v7 = (void *)v13;
  }

  return v7;
}

- (int64_t)_messageListItemCount
{
  id v3 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v4 = [v3 displayMessageItemID];

  if (!v4) {
    return 0;
  }
  if (![(ConversationViewControllerBase *)self shownAsConversation]) {
    return 1;
  }
  char v5 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (id)_referenceDisplayMessage
{
  id v4 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  if ([(ConversationViewControllerBase *)self shownAsConversation]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v9 = [v8 displayMessageItemID];

    id v10 = [(ConversationViewController *)self contentRequestCache];
    id v11 = [v10 objectForKey:v9];

    id v7 = [v11 message];
    if (!v7)
    {
      id v12 = +[ConversationViewController log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [(ConversationViewControllerBase *)self referenceMessageListItem];
        objc_claimAutoreleasedReturnValue();
        sub_100458664();
      }
    }
  }
  else
  {
    char v5 = [v4 displayMessageItemID];
    id v6 = [v4 itemID];

    if (v5 != v6)
    {
      id v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:2744 description:@"When threading is off displayMessageItemID should always equal itemID"];
    }
    id v7 = v4;
  }

  return v7;
}

- (id)_messagesForTriageInteraction:(id)a3
{
  id v4 = [a3 messageListItemSelection];
  char v5 = [v4 messageListItems];

  id v6 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  if ([v6 count] == (id)1 && objc_msgSend(v5, "count") == (id)1)
  {
    id v7 = [v5 firstObject];
    id v8 = [v7 conversationID];
    id v9 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v10 = [v9 conversationID];

    if (v8 == v10)
    {
      id v11 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      id v17 = v11;
      uint64_t v12 = +[NSArray arrayWithObjects:&v17 count:1];

      uint64_t v13 = +[ConversationViewController log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        uint64_t v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "_messagesForTriageInteraction - using referenceMessageListItem.itemID:%@", (uint8_t *)&v15, 0xCu);
      }

      char v5 = (void *)v12;
    }
  }
  else
  {
  }

  return v5;
}

- (void)_updatePredictedMailboxForConversation
{
  id v3 = [(ConversationViewController *)self mailboxPredictionScheduler];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007F520;
  v4[3] = &unk_1006047A0;
  void v4[4] = self;
  [v3 performBlock:v4];
}

- (void)_deleteMessageListItemsForMoveOrDestructiveInteraction:(id)a3 completion:(id)a4
{
  id v10 = a4;
  id v6 = [a3 messageListItemSelection];
  id v7 = [v6 messageListItems];
  id v8 = [v7 ef_compactMap:&stru_100605528];

  id v9 = [(ConversationViewController *)self messageList];
  [(ConversationViewController *)self _deleteItemsWithIDs:v8 fromCollection:v9 completionHandler:v10];
}

- (void)_scrollToRect:(CGRect)a3 forMessageContentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  id v10 = [(ConversationViewControllerBase *)self collectionView];
  [v10 convertRect:v9 x:x y:y width:width height:height];
  double v12 = v11;

  uint64_t v13 = [(ConversationViewControllerBase *)self collectionView];
  [v13 adjustedContentInset];
  double v15 = v14;

  uint64_t v16 = +[ConversationViewController log];
  double v17 = v12 - (v15 + 32.0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v28.double x = 0.0;
    v28.double y = v17;
    NSStringFromPoint(v28);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [v9 contentRequest];
    __int16 v20 = [v19 messageFuture];
    id v21 = [v20 resultIfAvailable];
    BOOL v22 = [v21 ef_publicDescription];
    int v24 = 138412546;
    id v25 = v18;
    __int16 v26 = 2112;
    id v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scroll to point (%@) for message: %@", (uint8_t *)&v24, 0x16u);
  }
  id v23 = [(ConversationViewControllerBase *)self collectionView];
  [v23 setContentOffset:1 animated:0.0 v17];
}

- (BOOL)_showQuickReplyBelowConversation
{
  return [(ConversationViewControllerBase *)self conversationSortOrder] == 0;
}

- (id)_presentationStringForMessageListItem:(id)a3
{
  id v3 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v4 = [v3 senderList];
  char v5 = [v4 firstObject];

  if (v5)
  {
    id v6 = v5;
    id v7 = [v6 emailAddressValue];
    id v8 = [v7 em_displayableString];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      double v11 = [v7 simpleAddress];
      double v12 = v11;
      if (v11)
      {
        uint64_t v13 = v11;
      }
      else
      {
        uint64_t v13 = [v6 stringValue];
      }
      id v10 = v13;
    }
  }
  else
  {
    id v10 = &stru_100619928;
  }

  return v10;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ConversationViewController;
  [(ConversationViewController *)&v10 validateCommand:v4];
  char v5 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v6 = [v5 flags];

  id v7 = (char *)[v4 action];
  if (v7 == "_markAsJunkCommandInvoked:")
  {
    if ([v6 junkLevel] == (id)1)
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"OPERATION_NOT_JUNK_DESC" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"OPERATION_JUNK_DESC" value:&stru_100619928 table:@"Main"];
    }
    goto LABEL_19;
  }
  if (v7 == "_flagCommandInvoked:")
  {
    if ([v6 flagged])
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"MARK_EMAIL_UNFLAGGED" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"MARK_EMAIL_FLAGGED" value:&stru_100619928 table:@"Main"];
    }
    goto LABEL_19;
  }
  if (v7 == "_markAsReadCommandInvoked:")
  {
    if ([v6 read])
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"MARK_EMAIL_UNREAD" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"MARK_EMAIL_READ" value:&stru_100619928 table:@"Main"];
    }
    goto LABEL_19;
  }
  if (v7 == "_deleteMessageCommandInvoked:")
  {
    if ((id)[(ConversationViewController *)self _messageListItemCount] == (id)1)
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"DELETE_EMAIL" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"DELETE_EMAIL_PLURAL" value:&stru_100619928 table:@"Main"];
    }
    goto LABEL_19;
  }
  if (v7 == "_archiveShortcutInvoked:")
  {
    if ((id)[(ConversationViewController *)self _messageListItemCount] == (id)1)
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"ARCHIVE_EMAIL" value:&stru_100619928 table:@"Main"];
    }
    else
    {
      id v8 = +[NSBundle mainBundle];
      [v8 localizedStringForKey:@"ARCHIVE_EMAIL_PLURAL" value:&stru_100619928 table:@"Main"];
    }
    id v9 = LABEL_19:;
    [v4 setDiscoverabilityTitle:v9];
  }
}

- (void)_replyCommandInvoked:(id)a3
{
}

- (void)_replyAllCommandInvoked:(id)a3
{
}

- (void)_printCommandInvoked:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000805F8;
  v7[3] = &unk_1006055A0;
  v7[4] = self;
  char v5 = objc_retainBlock(v7);
  id v6 = objc_opt_class();
  sub_100080020((id *)&self->super.super.super.super.isa, v6, v4, 0, v5, 0);
}

- (void)_forwardCommandInvoked:(id)a3
{
  id v4 = a3;
  char v5 = [(ConversationViewController *)self targetMessageForBarButtonTriage];
  id v6 = [v5 itemID];
  id v7 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v6];
  id v8 = [(ConversationViewController *)self _getCurrentlySelectedMessageContentForMessageItemID:v6];
  double v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  double v17 = sub_10008085C;
  id v18 = &unk_100605140;
  id v19 = self;
  id v9 = v6;
  id v20 = v9;
  objc_super v10 = objc_retainBlock(&v15);
  double v11 = [(ConversationViewControllerBase *)self scene];
  double v12 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v7 scene:v11];

  if (v8) {
    [v12 setOriginalContent:v8];
  }
  [v12 setDelegate:self];
  uint64_t v13 = [v5 mailboxes];
  [v12 setMessageSourceMailboxes:v13];

  [v12 setShouldPromptToLoadRestOfMessage:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 setPresentationSource:v4];
  }
  else {
    [v12 setAttachmentPolicy:1];
  }
  id v14 = [v12 alertActionWithCompletion:v10];
  [v12 performInteraction];
}

- (void)_markAsJunkCommandInvoked:(id)a3
{
  id v4 = sub_10007EC48(self);
  char v5 = [(ConversationViewController *)self undoManager];
  id v6 = +[MFFlagChangeTriageInteraction interactionWithMessageListItemSelection:v4 undoManager:v5 origin:3 actor:2 reason:4];

  id v7 = [(ConversationViewController *)self selectionDataSource];
  if ([v7 shouldUseSelectionDataSourceForConversationViewController:self])
  {
    id v8 = [v7 messageTriageInteractionHelperForConversationViewController:self];
    [v6 setDelegate:v8];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100080A34;
  v10[3] = &unk_1006055C8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v6 performInteractionWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)_readTriageInteraction
{
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    id v3 = [(ConversationViewController *)self messageList];
    id v4 = [v3 query];
    char v5 = [(ConversationViewController *)self undoManager];
    uint64_t v6 = +[MFFlagChangeTriageInteraction interactionWithQuery:v4 undoManager:v5 origin:3 actor:2 reason:4];

    id v7 = v3;
    id v8 = (void *)v6;
  }
  else
  {
    id v7 = sub_10007EC48(self);
    id v4 = [(ConversationViewController *)self undoManager];
    id v8 = +[MFFlagChangeTriageInteraction interactionWithMessageListItemSelection:v7 undoManager:v4 origin:3 actor:2 reason:4];
  }

  id v9 = [(ConversationViewController *)self selectionDataSource];
  if ([v9 shouldUseSelectionDataSourceForConversationViewController:self])
  {
    objc_super v10 = [v9 messageTriageInteractionHelperForConversationViewController:self];
    [v8 setDelegate:v10];
  }

  return v8;
}

- (id)_messageReadCompletionHandlerForSelectionDataSource:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100080D50;
  v9[3] = &unk_1006055C8;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  uint64_t v6 = objc_retainBlock(v9);
  id v7 = objc_retainBlock(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)_readActionForMessageListItemSelection:(id)a3
{
  id v4 = [(ConversationViewController *)self _readTriageInteraction];
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    [v4 setTitleIncludesAllMessages:1];
    [v4 setTitleIncludesCount:0];
    [v4 setDelegate:self];
  }
  id v5 = [(ConversationViewController *)self selectionDataSource];
  uint64_t v6 = [(ConversationViewController *)self _messageReadCompletionHandlerForSelectionDataSource:v5];
  id v7 = [v4 menuActionWithPreparation:0 completion:v6];

  return v7;
}

- (void)_markAsReadCommandInvoked:(id)a3
{
  id v6 = [(ConversationViewController *)self _readTriageInteraction];
  id v4 = [(ConversationViewController *)self selectionDataSource];
  id v5 = [(ConversationViewController *)self _messageReadCompletionHandlerForSelectionDataSource:v4];
  [v6 performInteractionWithCompletion:v5];
}

- (void)_flagCommandInvoked:(id)a3
{
  id v4 = sub_10007EC48(self);
  id v5 = [(ConversationViewController *)self undoManager];
  id v6 = +[MFFlagChangeTriageInteraction interactionWithMessageListItemSelection:v4 undoManager:v5 origin:3 actor:2 reason:4];

  id v7 = [(ConversationViewController *)self selectionDataSource];
  if ([v7 shouldUseSelectionDataSourceForConversationViewController:self])
  {
    id v8 = [v7 messageTriageInteractionHelperForConversationViewController:self];
    [v6 setDelegate:v8];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100081400;
  v10[3] = &unk_1006055C8;
  objc_copyWeak(&v12, &location);
  id v9 = v7;
  id v11 = v9;
  [v6 performInteractionWithCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_deleteMessageCommandInvoked:(id)a3
{
}

- (void)_archiveShortcutInvoked:(id)a3
{
}

- (unint64_t)_summarizableMessageCountForItemID:(id)a3
{
  id v3 = [(ConversationViewController *)self _summarizableMessageItemIDsForSummaryItemID:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = (unint64_t)[v3 count];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)_summarizableMessageItemIDsForSummaryItemID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(ConversationViewController *)self collectionViewDataSource];
    id v6 = [v5 snapshot];
    id v7 = [v6 itemIdentifiers];

    id v8 = (char *)[v7 indexOfObject:v4];
    if (v8 == (char *)0x7FFFFFFFFFFFFFFFLL || (unint64_t)[v7 count] < 2)
    {
      id v9 = 0;
    }
    else
    {
      id v10 = [(ConversationViewController *)self topSummaryItemID];

      if (v10 == v4)
      {
        id v12 = v7;
      }
      else
      {
        if ((id)[(ConversationViewControllerBase *)self conversationSortOrder] == (id)1)
        {
          id v11 = v8 + 1;
          id v8 = 0;
        }
        else
        {
          id v11 = (char *)((unsigned char *)[v7 count] - v8);
        }
        [v7 subarrayWithRange:v8, v11];
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v13 = v12;
      id v9 = [v12 ef_filter:&stru_1006055E8];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_manualSummaryContextForItemID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(ConversationViewController *)self _summarizableMessageCountForItemID:v4];
    id v6 = [(ConversationViewController *)self inlineSummaryItemID];

    id v7 = v4;
    id v8 = [(ConversationViewController *)self summaryContextByItemID];
    id v9 = [v8 objectForKeyedSubscript:v7];

    if (v9)
    {
      [v9 setSummarizableMessageCount:v5];
      id v10 = v9;
    }
    else
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100081B98;
      v15[3] = &unk_100605610;
      objc_copyWeak(&v17, &location);
      id v11 = v7;
      id v16 = v11;
      id v12 = +[EFFuture lazyFutureWithBlock:v15];
      id v10 = [objc_alloc((Class)MUIManualSummaryContext) initWithSummary:0 error:0 summarizableMessageCount:v5 isInlineSummary:v6 == v4 summaryControllerFuture:v12];
      uint64_t v13 = [(ConversationViewController *)self summaryContextByItemID];
      [v13 setObject:v10 forKeyedSubscript:v11];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_reloadTopSummaryIfNecessary
{
  id v3 = [(ConversationViewController *)self topSummaryItemID];
  if (v3)
  {
    id v4 = [(ConversationViewController *)self collectionViewDataSource];
    unint64_t v5 = [v4 indexPathForItemIdentifier:v3];

    if (v5)
    {
      id v6 = [(ConversationViewControllerBase *)self collectionView];
      unsigned __int8 v7 = [v6 mui_isIndexPathVisible:v5];

      if (v7)
      {
        id v9 = v5;
        id v8 = +[NSArray arrayWithObjects:&v9 count:1];
        [(ConversationViewController *)self _reloadCellsAtIndexPaths:v8 animated:0];
      }
    }
  }
}

- (void)_updateQuickReplyState
{
  if ([(ConversationViewControllerBase *)self allowQuickReply])
  {
    [(ConversationViewController *)self _setupQuickReplySupplementaryViewProvider];
  }
  else if (_os_feature_enabled_impl())
  {
    id v3 = [(ConversationViewController *)self collectionViewDataSource];
    [v3 setSupplementaryViewProvider:0];

    [(ConversationViewController *)self _resetQuickReplyViewControllerWithReason:2 resetCompose:1 override:1];
    id v4 = [(ConversationViewControllerBase *)self conversationLayout];
    [v4 invalidateLayout];

    [(ConversationViewController *)self _reloadDataSource];
  }
}

- (void)_updateQuickReplyLabelIfNeeded
{
  id v3 = [(ConversationViewController *)self _quickReplyView];
  -[ConversationViewController _updateQuickReplyLabelIfNeeded:](self, "_updateQuickReplyLabelIfNeeded:");
}

- (void)_updateQuickReplyLabelIfNeeded:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v9 = v4;
    unsigned __int8 v6 = [v4 isComposing];
    unint64_t v5 = v9;
    if ((v6 & 1) == 0)
    {
      unsigned __int8 v7 = [(ConversationViewController *)self targetMessageForBarButtonTriage];
      id v8 = +[MFComposeMailMessage legacyMessageWithMessage:v7 mailboxUid:0 skipAttachmentDownload:1];
      [v9 updatePlaceholderWithMessage:v8];

      unint64_t v5 = v9;
    }
  }
}

- (id)_quickReplyCompositionContext
{
  id v4 = [(ConversationViewController *)self targetMessageForBarButtonTriage];
  unint64_t v5 = [v4 itemID];
  if (v5)
  {
    unsigned __int8 v6 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v5];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      id v8 = [v6 message];
      id v9 = +[UIApplication sharedApplication];
      id v10 = [v9 mailboxProvider];

      id v11 = [v8 mailboxObjectIDs];
      id v12 = [v11 firstObject];
      uint64_t v13 = [v10 legacyMailboxForObjectID:v12];

      if (!v13)
      {
        id v14 = +[ConversationViewController log];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100458840();
        }
      }
      double v15 = +[MFComposeMailMessage legacyMessageWithMessage:v8 mailboxUid:v13 skipAttachmentDownload:1];
      id v16 = [(ConversationViewController *)self _getCurrentlySelectedMessageContentForMessageItemID:v5];
      id v17 = [objc_alloc((Class)_MFMailCompositionContext) initReplyAllToMessage:v8 legacyMessage:v15 isEML:0];
      [v17 setQuickReply:1];
      [v17 setShowKeyboardImmediately:1];
      [v17 setOriginalContent:v16];
    }
    else
    {
      id v8 = +[ConversationViewController log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        objc_claimAutoreleasedReturnValue();
        sub_1004587B4();
      }
      id v17 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = +[ConversationViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v4 ef_publicDescription];
      objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_1004587F8();
    }
    id v17 = 0;
  }

  return v17;
}

- (BOOL)_isQuickReplyMessageAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(ConversationViewControllerBase *)self allowQuickReply])
  {
    unint64_t v5 = [(ConversationViewControllerBase *)self collectionView];
    unsigned __int8 v6 = (char *)[v5 numberOfSections];

    unsigned __int8 v7 = [(ConversationViewControllerBase *)self collectionView];
    id v8 = (char *)[v7 numberOfItemsInSection:--v6] - 1;

    id v9 = +[NSIndexPath indexPathForItem:v8 inSection:v6];
    id v10 = +[NSIndexPath indexPathForItem:0 inSection:0];
    if ([(ConversationViewController *)self _showQuickReplyBelowConversation]) {
      unsigned int v11 = [v4 isEqual:v9];
    }
    else {
      unsigned int v11 = [v4 isEqual:v10];
    }
    unsigned int v13 = v11;
    id v14 = [(ConversationViewControllerBase *)self quickReplyAnimationContext];
    double v15 = [v14 getObject];

    if ((v13 & (*(unsigned int (**)(void, void *))(EFIsNotNull + 16))(EFIsNotNull, v15)) == 1) {
      BOOL v12 = [(ConversationViewController *)self _userIsSenderAtIndexPath:v4];
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_isUndoSendMessageAtIndexPath:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    unint64_t v5 = [(ConversationViewController *)self _messageAtIndexPath:v4];
    if (v5)
    {
      if ([(ConversationViewController *)self _isMessageInOutbox:v5])
      {
        BOOL v6 = sub_100072EE8((uint64_t)self);
LABEL_11:

        goto LABEL_12;
      }
      unsigned __int8 v7 = +[ConversationViewController log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412802;
        id v12 = (id)objc_opt_class();
        __int16 v13 = 2048;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v4;
        id v10 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "<%@: %p> Message at indexPath=%@ is not in outbox, don't expand to show Undo Send", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      unsigned __int8 v7 = +[ConversationViewController log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138412802;
        id v12 = (id)objc_opt_class();
        __int16 v13 = 2048;
        id v14 = self;
        __int16 v15 = 2112;
        id v16 = v4;
        id v8 = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "<%@: %p> No message found for indexPath=%@", (uint8_t *)&v11, 0x20u);
      }
    }

    BOOL v6 = 0;
    goto LABEL_11;
  }
  BOOL v6 = 0;
LABEL_12:

  return v6;
}

- (void)_didChangeHorizontalPadding:(double)a3
{
  id v4 = [(ConversationViewController *)self _quickReplyView];
  [v4 setHorizontalInset:a3];
}

- (CGRect)_quickReplyViewFrame
{
  v2 = [(ConversationViewController *)self _quickReplyView];
  id v3 = v2;
  if (v2)
  {
    [v2 frame];
    CGFloat x = v4;
    CGFloat y = v6;
    CGFloat width = v8;
    CGFloat height = v10;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)_userIsSenderAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ConversationViewController *)self _messageAtIndexPath:v4];
  double v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 senderList];
    double v8 = [v7 firstObject];
    id v9 = [v8 emailAddressValue];

    double v10 = [v9 simpleAddress];
    int v11 = [v10 lowercaseString];

    double v12 = +[UIApplication sharedApplication];
    double v13 = [v12 accountsProvider];
    double v14 = [v13 displayedAccounts];
    double v15 = [v14 allObjects];
    id v16 = [v15 ef_flatMap:&stru_100605650];
    id v17 = [v16 ef_mapSelector:@"lowercaseString"];

    unsigned __int8 v18 = [v17 containsObject:v11];
  }
  else
  {
    id v19 = +[ConversationViewController log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = (id)objc_opt_class();
      __int16 v24 = 2048;
      id v25 = self;
      __int16 v26 = 2112;
      id v27 = v4;
      id v21 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "<%@: %p> [Quick Reply] No message found for indexPath=%@", buf, 0x20u);
    }
    unsigned __int8 v18 = 0;
  }

  return v18;
}

- (id)_quickReplyView
{
  if ([(ConversationViewControllerBase *)self allowQuickReply])
  {
    id v3 = [(ConversationViewControllerBase *)self collectionView];
    unint64_t v4 = [(ConversationViewControllerBase *)self conversationSortOrder];
    unint64_t v5 = (id *)&UICollectionElementKindSectionFooter;
    if (v4) {
      unint64_t v5 = (id *)&UICollectionElementKindSectionHeader;
    }
    id v6 = *v5;
    unsigned __int8 v7 = [v3 indexPathsForVisibleSupplementaryElementsOfKind:v6];
    double v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    double v15 = sub_100082D58;
    id v16 = &unk_100605678;
    id v8 = v3;
    id v17 = v8;
    id v9 = v6;
    id v18 = v9;
    double v10 = [v7 ef_compactMap:&v13];
    int v11 = [v10 ef_firstObjectPassingTest:&stru_1006056B8 v13, v14, v15, v16];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (void)_updateQuickReplySendButtonOffset:(id)a3
{
  id v15 = a3;
  unint64_t v4 = [(ConversationViewController *)self _quickReplyView];
  uint64_t v5 = [(ConversationViewController *)self quickReplyMailComposeController];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    double v7 = 0.0;
    if ([(ConversationViewController *)self _showQuickReplyBelowConversation])
    {
      [(ConversationViewControllerBase *)self _itemSpacing];
      double v7 = v8;
    }
    [v15 contentInset];
    double v10 = v9;
    [v15 contentOffset];
    double v12 = v11;
    [v4 frame];
    double v14 = v7 + v13;
    if (v10 + v12 >= v14) {
      [v4 updateQuickReplySendButtonTopOffset:v10 + v12 - v14];
    }
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  if ([(ConversationViewControllerBase *)self allowQuickReply])
  {
    unint64_t v4 = [(ConversationViewController *)self quickReplyMailComposeController];

    if (!v4)
    {
      +[QuickReplyView defaultHeight];
      -[ConversationViewControllerBase setQuickReplyHeight:](self, "setQuickReplyHeight:");
      id v6 = [(ConversationViewControllerBase *)self collectionView];
      uint64_t v5 = [v6 collectionViewLayout];
      [v5 invalidateLayout];
    }
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  uint64_t v5 = -[ConversationViewController animationControllerForTransition:](self, "animationControllerForTransition:", 1, a4, a5);

  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3 = [(ConversationViewController *)self animationControllerForTransition:0];

  return v3;
}

- (id)animationControllerForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = [(ConversationViewController *)self _quickReplyView];
  id v5 = 0;
  if (v4 && v3)
  {
    id v5 = objc_alloc_init((Class)_UISheetAnimationController);
    [v5 setIsReversed:0];
    id v6 = [v4 animationSourceView];
    [v5 setSourceView:v6];
  }

  return v5;
}

- (id)_fullComposeViewControllerForQuickReply:(id)a3 userActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [ComposeNavigationController alloc];
  double v9 = [(ConversationViewControllerBase *)self scene];
  double v10 = [(ComposeNavigationController *)v8 initWithUserActivity:v7 scene:v9];

  [(ComposeNavigationController *)v10 setTransitioningDelegate:self];
  [(ComposeNavigationController *)v10 setModalPresentationStyle:2];
  double v11 = [(ConversationViewControllerBase *)self scene];
  double v12 = [v11 composeViewDelegateHandler];
  [(ComposeNavigationController *)v10 setMailComposeDelegate:v12];

  double v13 = [MFActiveDraft alloc];
  double v14 = [(ComposeNavigationController *)v10 autosaveIdentifier];
  id v15 = [(ComposeNavigationController *)v10 originalMessageObjectID];
  id v16 = [(MFActiveDraft *)v13 initWithIdentifier:v14 andOriginalMessageIdentifier:v15];
  id v17 = [v11 session];
  [v17 mf_setActiveDraft:v16];

  id v18 = [(ComposeNavigationController *)v10 presentationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    id v20 = [v6 animationSourceView];
    [v19 setSourceView:v20];

    +[QuickReplyView cornerRadius];
    [v19 _setCornerRadiusForPresentationAndDismissal:];
    [v19 _setShouldDismissWhenTappedOutside:1];
  }
  [v18 setDelegate:self];

  return v10;
}

- (void)_runAlongsideAnimationsForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(ConversationViewController *)self transitionCoordinator];

  if (v5)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v6 = [(ConversationViewController *)self transitionCoordinator];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100083514;
    v11[3] = &unk_1006056E0;
    objc_copyWeak(&v12, &location);
    BOOL v13 = v3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_1000835A0;
    v8[3] = &unk_1006056E0;
    objc_copyWeak(&v9, &location);
    BOOL v10 = v3;
    [v6 animateAlongsideTransition:v11 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = [(ConversationViewController *)self _quickReplyView];
    [v7 setHidden:v3];
  }
}

- (void)_presentationControllerWillDismiss:(id)a3
{
}

- (void)_setupQuickReplySupplementaryViewProvider
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v3 = [(ConversationViewController *)self quickReplyHeaderSupplementaryRegistration];
  if (!v3
    || ([(ConversationViewController *)self quickReplyFooterSupplementaryRegistration], unint64_t v4 = objc_claimAutoreleasedReturnValue(), v4, v3, !v4))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100083924;
    v13[3] = &unk_100605708;
    objc_copyWeak(&v14, &location);
    id v5 = objc_retainBlock(v13);
    id v6 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:UICollectionElementKindSectionHeader configurationHandler:v5];
    [(ConversationViewController *)self setQuickReplyHeaderSupplementaryRegistration:v6];

    id v7 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:UICollectionElementKindSectionFooter configurationHandler:v5];
    [(ConversationViewController *)self setQuickReplyFooterSupplementaryRegistration:v7];

    objc_destroyWeak(&v14);
  }
  double v8 = [(ConversationViewController *)self collectionViewDataSource];
  id v9 = [v8 supplementaryViewProvider];

  if (!v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100083AC4;
    v11[3] = &unk_100605730;
    objc_copyWeak(&v12, &location);
    BOOL v10 = [(ConversationViewController *)self collectionViewDataSource];
    [v10 setSupplementaryViewProvider:v11];

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);
}

- (void)_dismissKeyboardIfNecessary
{
  id v3 = [(ConversationViewController *)self view];
  v2 = [v3 window];
  [v2 endEditing:1];
}

- (id)mailComposeViewForQuickReplyView:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self quickReplyMailComposeController];
  [v5 removeFromParentViewController];

  id v6 = [(ConversationViewController *)self quickReplyMailComposeController];
  id v7 = [v6 view];
  [v7 removeFromSuperview];

  double v8 = [(ConversationViewControllerBase *)self scene];
  id v9 = [(ConversationViewController *)self _quickReplyCompositionContext];
  id v10 = [objc_alloc((Class)MFMailComposeController) initWithCompositionContext:v9 options:0];
  [(ConversationViewController *)self setQuickReplyMailComposeController:v10];
  double v11 = [v8 composeViewDelegate];
  [v10 setDelegate:v11];

  [v10 setQuickReplyDelegate:self];
  [v10 setQuickReplyActionButtonProvider:v4];
  [(ConversationViewController *)self addChildViewController:v10];
  id v12 = [v10 view];

  return v12;
}

- (void)mailComposeViewSnapshotForQuickReplyView:(id)a3 :(id)a4
{
  id v5 = a4;
  id v6 = [(ConversationViewController *)self quickReplyMailComposeController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100083FCC;
  v8[3] = &unk_100605758;
  id v7 = v5;
  id v9 = v7;
  [v6 takeSnapshotWithCompletionHandler:v8];
}

- (id)displayNameForAddresses:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v11 = [(ConversationViewControllerBase *)self contactStore];
        id v12 = [v11 displayNameForEmailAddress:v10];
        [v5 addObject:v12];
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  BOOL v13 = [v5 componentsJoinedByString:@", "];

  return v13;
}

- (void)quickReplyView:(id)a3 didTapExpandButton:(id)a4
{
  id v5 = [(ConversationViewController *)self quickReplyMailComposeController];
  id v6 = [v5 composeWebView];
  id v7 = [v6 getCaretPosition];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100084310;
  v8[3] = &unk_100605780;
  void v8[4] = self;
  [v7 addSuccessBlock:v8];
}

- (void)quickReplyView:(id)a3 didTapSendButton:(id)a4 animationContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    long long v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    id v19 = sub_1000846F0;
    id v20 = &unk_100604FE8;
    objc_copyWeak(&v21, &location);
    [v10 setCompletionBlock:&v17];
    double v11 = [(ConversationViewControllerBase *)self quickReplyAnimationContext];
    [v11 setObject:v10];

    id v12 = +[ConversationViewController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      __int16 v24 = v13;
      __int16 v25 = 2048;
      __int16 v26 = self;
      __int16 v27 = 2112;
      id v28 = v10;
      id v14 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply][Send Animation] Did prepare quick-reply send animation with context: %@", buf, 0x20u);
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  long long v15 = MFComposeLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Quick Reply][Send Animation] Will perform send...", buf, 2u);
  }

  [(ConversationViewControllerBase *)self setIsPerformingQuickReplySendAnimation:1];
  long long v16 = [(ConversationViewController *)self quickReplyMailComposeController];
  [v16 performSend];
}

- (void)mailComposeController:(id)a3 didChangeQuickReplyWebViewHeight:(double)a4
{
  id v6 = +[ConversationViewController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v59 = (id)objc_opt_class();
    [(ConversationViewControllerBase *)self quickReplyHeight];
    *(_DWORD *)buf = 138413058;
    id v65 = v59;
    __int16 v66 = 2048;
    int v67 = self;
    __int16 v68 = 2048;
    double v69 = a4;
    __int16 v70 = 2048;
    double v71 = v60;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "<%@: %p> [Quick Reply] Wants to change height to: %f, current height: %f", buf, 0x2Au);
  }
  +[QuickReplyView innerVerticalPadding];
  double v8 = v7;
  +[QuickReplyView innerVerticalPadding];
  double v10 = v9;
  double v11 = [(ConversationViewControllerBase *)self collectionView];
  +[QuickReplyView defaultHeight];
  double v13 = v8 + a4 + v10;
  if (v13 >= v12) {
    double v14 = v8 + a4 + v10;
  }
  else {
    double v14 = v12;
  }
  [(ConversationViewControllerBase *)self quickReplyHeight];
  double v16 = v15 - v14;
  if (v16 < 0.0) {
    double v16 = -v16;
  }
  if (v16 >= 2.22044605e-16)
  {
    [(ConversationViewControllerBase *)self quickReplyHeight];
    double v18 = v17;
    [(ConversationViewControllerBase *)self setQuickReplyHeight:v14];
    id v19 = +[ConversationViewController log];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = objc_opt_class();
      *(_DWORD *)buf = 138413058;
      id v65 = v20;
      __int16 v66 = 2048;
      int v67 = self;
      __int16 v68 = 2048;
      double v69 = v14;
      __int16 v70 = 2048;
      double v71 = v14 - v18;
      id v21 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply] Did change height to: %f, delta: %f", buf, 0x2Au);
    }
    BOOL v22 = [(ConversationViewController *)self _quickReplyView];
    if (v22)
    {
      if ([(ConversationViewController *)self _showQuickReplyBelowConversation])
      {
        [(ConversationViewControllerBase *)self _itemSpacing];
        double v24 = v23;
        [v11 mf_visibleFrame];
        CGFloat v62 = v26;
        CGFloat v63 = v25;
        CGFloat rect = v27;
        double v29 = v28;
        [v22 frame];
        double v31 = v30;
        double v33 = v32;
        double v35 = v34;
        double v37 = v36;
        id v38 = [(ConversationViewController *)self view];
        double v39 = [(ConversationViewControllerBase *)self collectionView];
        [v38 convertRect:v39 fromView:v31, v24 + v33, v35, v37 - v24];
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        CGFloat v47 = v46;

        v73.origin.CGFloat x = v41;
        v73.origin.CGFloat y = v43;
        v73.size.CGFloat width = v45;
        v73.size.CGFloat height = v47;
        CGFloat MinX = CGRectGetMinX(v73);
        v74.origin.CGFloat x = v41;
        v74.origin.CGFloat y = v43;
        v74.size.CGFloat width = v45;
        v74.size.CGFloat height = v47;
        v72.CGFloat y = CGRectGetMaxY(v74);
        v75.size.CGFloat height = v24 + v29;
        v75.origin.CGFloat y = v62;
        v75.origin.CGFloat x = v63;
        v75.size.CGFloat width = rect;
        v72.CGFloat x = MinX;
        LOBYTE(v38) = CGRectContainsPoint(v75, v72);
        [v11 contentSize];
        double v50 = v49;
        [v11 contentInset];
        double v52 = v51;
        [v11 contentInset];
        double v54 = v53;
        [v11 frame];
        double v56 = v55;
        BOOL v57 = [v11 collectionViewLayout];
        [v57 invalidateLayout];

        if ((v38 & (v13 + v50 + v52 + v54 >= v56)) == 1)
        {
          [v11 contentOffset];
          [v11 setContentOffset:0 animated:YES];
        }
      }
      else
      {
        id v58 = [v11 collectionViewLayout];
        [v58 invalidateLayout];
      }
    }
    [(ConversationViewController *)self _updateQuickReplySendButtonOffset:v11];
  }
}

- (void)mailComposeController:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  [(ConversationViewController *)self setQuickReplyHasContent:!a4];
  id v6 = [(ConversationViewController *)self _quickReplyView];
  [v6 setQuickReplyPlaceholderLabelState:v4];
}

- (void)mailComposeController:(id)a3 willMigrateToFullComposeWithReason:(int64_t)a4
{
  if (!a4)
  {
    id v5 = +[ConversationViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = (id)objc_opt_class();
      __int16 v10 = 2048;
      double v11 = self;
      id v6 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply] Will add attachment, applying snapshot to view hierarchy", (uint8_t *)&v8, 0x16u);
    }
    double v7 = [(ConversationViewController *)self _quickReplyView];
    [v7 showSnapshot];
  }
}

- (void)mailComposeController:(id)a3 migrateToFullCompose:(id)a4
{
  id v5 = a4;
  if (+[UIDevice mf_isPad])
  {
    id v6 = [(ConversationViewControllerBase *)self scene];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100085204;
    v22[3] = &unk_1006057A8;
    objc_copyWeak(&v23, &location);
    [v6 showComposeWithUserActivity:v5 completion:v22];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    id v6 = [(ConversationViewController *)self _quickReplyView];
    double v7 = [(ConversationViewController *)self _fullComposeViewControllerForQuickReply:v6 userActivity:v5];
    int v8 = [v7 autosaveIdentifier];
    uint64_t v16 = [v7 originalMessageObjectID];
    if (v8)
    {
      id v9 = +[UIApplication sharedApplication];
      __int16 v10 = [v9 dockPersistence];
      [v10 removeDockedStateWithIdentifier:v8 sender:0];
    }
    double v11 = [(ConversationViewControllerBase *)self scene];
    double v12 = [v11 dockContainer];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008527C;
    v18[3] = &unk_100604668;
    id v13 = v11;
    id v19 = v13;
    id v14 = v8;
    id v20 = v14;
    id v15 = v17;
    id v21 = v15;
    [v12 presentViewController:v7 animated:1 completion:v18];

    [(ConversationViewController *)self _runAlongsideAnimationsForTransition:1];
  }
}

- (void)mailComposeController:(id)a3 isSending:(BOOL)a4
{
  id v6 = a3;
  if (!a4
    && [(ConversationViewControllerBase *)self isPerformingQuickReplySendAnimation])
  {
    double v7 = +[ConversationViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = (id)objc_opt_class();
      __int16 v13 = 2048;
      id v14 = self;
      id v8 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply][Send Animation] Aborting send animation", (uint8_t *)&v11, 0x16u);
    }
    [(ConversationViewControllerBase *)self setIsPerformingQuickReplySendAnimation:0];
    id v9 = [(ConversationViewControllerBase *)self quickReplyAnimationContext];
    __int16 v10 = +[NSNull null];
    [v9 setObject:v10];
  }
}

- (id)_sheetPresentationControllerViewForTouchContinuation:(id)a3
{
  id v3 = [a3 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 view];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)disableAutomaticMarkAsReadForMessages:(id)a3
{
  id v4 = a3;
  if (!*(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4))
  {
    id v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v6 = *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
    *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4) = v5;
  }
  double v7 = [v4 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count] == (id)1)
  {
    id v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v9 = [v4 firstObject];

    if (v8 == v9)
    {
      __int16 v10 = [(ConversationViewController *)self collectionViewDataSource];
      int v11 = [v10 snapshot];
      id v12 = [v11 itemIdentifiers];

      goto LABEL_9;
    }
  }
  else
  {
  }
  id v12 = [v4 ef_mapSelector:@"itemID"];
LABEL_9:
  __int16 v13 = +[ConversationViewController log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Disable auto-mark-as-read for itemIDs: %@", (uint8_t *)&v14, 0xCu);
  }

  [*(id *)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4) addObjectsFromArray:v12];
}

- (void)reenableAutomaticMarkAsReadForAllMessages
{
  if (*(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4))
  {
    id v3 = +[ConversationViewController log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Leaving the conversation should re-enable automatic mark-as-read", v5, 2u);
    }

    id v4 = *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
    *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4) = 0;
  }
}

- (void)scheduleAutomaticMarkAsReadForViewModel:(id)a3
{
  id v4 = [a3 messageContentRequest];
  id v5 = [v4 message];

  [(ConversationViewController *)self scheduleAutomaticMarkAsReadForMessage:v5];
}

- (void)scheduleAutomaticMarkAsReadForMessage:(id)a3
{
  id v4 = a3;
  if ([(ConversationViewController *)self _shouldAutomaticallyMarkAsReadMessage:v4])
  {
    if (!*(NSMapTable **)((char *)&self->_delayedReadCancelables + 4))
    {
      id v5 = +[NSMapTable strongToStrongObjectsMapTable];
      id v6 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
      *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4) = v5;
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    double v7 = +[EFScheduler mainThreadScheduler];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100085A3C;
    v12[3] = &unk_100604C00;
    objc_copyWeak(&v14, &location);
    id v8 = v4;
    id v13 = v8;
    id v9 = [v7 afterDelay:v12 performBlock:0.66];

    __int16 v10 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
    int v11 = [v8 itemID];
    [v10 setObject:v9 forKey:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)scheduleAutomaticMarkAsReadForReferenceMessage
{
  id v3 = [(ConversationViewController *)self _indexPathForReferenceMessage];
  if (v3)
  {
    id v4 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v5 = [v4 displayMessageItemID];
    id v6 = [(ConversationViewController *)self _messageFutureForItemID:v5];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    double v7 = +[ConversationViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 displayMessageItemID];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ - Scheduling auto-mark-as-read for reference message", buf, 0xCu);
    }
    id v9 = +[EFScheduler mainThreadScheduler];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000861F0;
    v12[3] = &unk_100604D68;
    objc_copyWeak(&v13, &location);
    [v6 onScheduler:v9 addSuccessBlock:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = +[ConversationViewController log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      int v11 = [v10 itemID];
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ - Do not auto-mark-as-read because indexPath for referenceMessage is nil", buf, 0xCu);
    }
  }
}

- (void)cancelAutomaticMarkAsReadForCellViewModel:(id)a3
{
  id v4 = [a3 messageContentRequest];
  id v10 = [v4 message];

  id v5 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
  id v6 = [v10 itemID];
  double v7 = [v5 objectForKey:v6];
  [v7 cancel];

  id v8 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
  id v9 = [v10 itemID];
  [v8 removeObjectForKey:v9];
}

- (void)invalidateAutomaticMarkAsReadForAllMessages
{
  id v3 = [*(id *)((char *)&self->_delayedReadCancelables + 4) objectEnumerator];
  id v4 = [v3 allObjects];
  [v4 makeObjectsPerformSelector:"cancel"];

  id v5 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);

  [v5 removeAllObjects];
}

- (BOOL)_shouldAutomaticallyMarkAsReadMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 flags];
  unsigned int v6 = [v5 read];

  if (v4) {
    int v7 = v6;
  }
  else {
    int v7 = 1;
  }
  if (v7 != 1)
  {
    id v9 = *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
    id v10 = [v4 itemID];
    int v11 = [v9 objectForKey:v10];

    if (v11)
    {
      id v8 = +[ConversationViewController log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        [v4 itemID];
        objc_claimAutoreleasedReturnValue();
        sub_100458A04();
      }
      goto LABEL_12;
    }
    id v14 = [(ConversationViewController *)self collectionViewDataSource];
    id v15 = [v4 itemID];
    uint64_t v16 = [v14 indexPathForItemIdentifier:v15];

    if (v16)
    {
      id v17 = [(ConversationViewControllerBase *)self previewState];
      if ([v17 shouldScheduleMarkMessageAsRead])
      {
        double v18 = [(ConversationViewControllerBase *)self cellConfigurator];
        unsigned int v19 = [v18 messageAtIndexPathIsExpandedOrSemiExpanded:v16];

        if (v19)
        {
          id v20 = *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
          id v21 = [v4 itemID];
          LOBYTE(v20) = [v20 containsObject:v21];

          if ((v20 & 1) == 0)
          {
            BOOL v22 = [(ConversationViewControllerBase *)self collectionView];
            [v22 mf_visibleBounds];
            CGFloat v29 = v28;
            CGFloat v31 = v30;
            CGFloat v33 = v32;
            CGFloat v35 = v34;
            double v36 = [(ConversationViewControllerBase *)self _layoutAttributesForItemAtIndexPath:v16];
            [v36 frame];
            v81.origin.CGFloat x = v37;
            v81.origin.CGFloat y = v38;
            v81.size.CGFloat width = v39;
            v81.size.CGFloat height = v40;
            v77.origin.CGFloat x = v29;
            v77.origin.CGFloat y = v31;
            v77.size.CGFloat width = v33;
            v77.size.CGFloat height = v35;
            if (CGRectIntersectsRect(v77, v81))
            {
              CGFloat v41 = [v22 cellForItemAtIndexPath:v16];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                goto LABEL_13;
              }
              double v42 = [v41 messageViewController];
              CGFloat v43 = [v42 messageContentView];

              double v44 = [v43 headerView];
              CGFloat v69 = v35;
              CGFloat v70 = v33;
              CGFloat v71 = v31;
              CGFloat v72 = v29;
              [v44 frame];
              CGFloat v46 = v45;
              CGFloat v48 = v47;
              CGFloat v50 = v49;
              CGFloat v52 = v51;

              v53.CGFloat width = NAN;
              v53.CGFloat height = NAN;
              buf.origin = (CGPoint)v53;
              buf.size = v53;
              remainder.origin = (CGPoint)v53;
              remainder.size = v53;
              [v43 bounds];
              CGFloat v55 = v54;
              CGFloat v57 = v56;
              CGFloat v59 = v58;
              CGFloat v61 = v60;
              v78.origin.CGFloat x = v46;
              v78.origin.CGFloat y = v48;
              v78.size.CGFloat width = v50;
              v78.size.CGFloat height = v52;
              CGFloat Height = CGRectGetHeight(v78);
              v79.origin.CGFloat x = v55;
              v79.origin.CGFloat y = v57;
              v79.size.CGFloat width = v59;
              v79.size.CGFloat height = v61;
              CGRectDivide(v79, &buf, &remainder, Height, CGRectMinYEdge);
              -[NSObject convertRect:fromView:](v22, "convertRect:fromView:", v43, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);

              CGFloat v63 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
              [v63 lineHeight];
              [v63 leading];
              UIRectInset();
              v82.origin.CGFloat x = v64;
              v82.origin.CGFloat y = v65;
              v82.size.CGFloat width = v66;
              v82.size.CGFloat height = fmax(v67, 1.0);
              v80.origin.CGFloat y = v71;
              v80.origin.CGFloat x = v72;
              v80.size.CGFloat height = v69;
              v80.size.CGFloat width = v70;
              if (CGRectIntersectsRect(v80, v82))
              {
                int v27 = 1;
              }
              else
              {
                __int16 v68 = +[ConversationViewController log];
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                {
                  [v4 itemID];
                  objc_claimAutoreleasedReturnValue();
                  sub_10045897C();
                }

                int v27 = 0;
              }
            }
            else
            {
              CGFloat v41 = +[ConversationViewController log];
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                [v4 itemID];
                objc_claimAutoreleasedReturnValue();
                sub_1004589C0();
              }
              int v27 = 0;
            }

LABEL_35:
            BOOL v12 = v27 != 0;
            goto LABEL_14;
          }
          BOOL v22 = +[ConversationViewController log];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            [v4 itemID];
            objc_claimAutoreleasedReturnValue();
            sub_100458924();
          }
LABEL_34:
          int v27 = 0;
          goto LABEL_35;
        }
      }
      else
      {
      }
    }
    BOOL v22 = +[ConversationViewController log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v4 itemID];
      if (v16) {
        double v24 = "NO";
      }
      else {
        double v24 = "YES";
      }
      double v25 = [(ConversationViewControllerBase *)self previewState];
      if (v16)
      {
        self = [(ConversationViewControllerBase *)self cellConfigurator];
        if ([(ConversationViewController *)self messageAtIndexPathIsExpanded:v16])double v26 = "YES"; {
        else
        }
          double v26 = "NO";
      }
      else
      {
        double v26 = "UNKNOWN";
      }
      LODWORD(buf.origin.x) = 138413058;
      *(void *)((char *)&buf.origin.x + 4) = v23;
      WORD2(buf.origin.y) = 2080;
      *(void *)((char *)&buf.origin.y + 6) = v24;
      HIWORD(buf.size.width) = 2112;
      *(void *)&buf.size.CGFloat height = v25;
      __int16 v75 = 2080;
      v76 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%@ - Do not auto-mark-as-read for reasons: indexPath-is-nil: %s, previewState: %@, message-is-expanded: %s", (uint8_t *)&buf, 0x2Au);
      if (v16) {
    }
      }
    goto LABEL_34;
  }
  if (!v4)
  {
    id v8 = +[ConversationViewController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1004588F0();
    }
LABEL_12:
  }
LABEL_13:
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)_cellForMessageItemIDIfExpanded:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self collectionViewDataSource];
  unsigned int v6 = [v5 indexPathForItemIdentifier:v4];

  if (v6
    && ([(ConversationViewControllerBase *)self cellConfigurator],
        int v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 messageAtIndexPathIsExpanded:v6],
        v7,
        v8))
  {
    id v9 = [(ConversationViewControllerBase *)self collectionView];
    id v10 = [v9 cellForItemAtIndexPath:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldShowMailboxForMessage:(id)a3
{
  id v4 = a3;
  if ([(ConversationViewControllerBase *)self messagesShowSourceMailbox])
  {
    BOOL v5 = 1;
  }
  else if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    BOOL v5 = 0;
  }
  else
  {
    unsigned int v6 = [v4 mailboxObjectIDs];
    int v7 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    unsigned int v8 = [v7 mailboxObjectIDs];

    id v9 = [v6 firstObjectCommonWithArray:v8];
    BOOL v5 = v9 == 0;
  }
  return v5;
}

- (BOOL)_shouldShowTimeSensitiveForMessage:(id)a3
{
  id v4 = a3;
  if ([(ConversationViewController *)self _shouldShowMailboxForMessage:v4]) {
    goto LABEL_6;
  }
  if (!EMBlackPearlIsFeatureEnabled()) {
    goto LABEL_6;
  }
  BOOL v5 = [v4 category];
  unsigned __int8 v6 = [v5 isHighImpact];

  if ((v6 & 1) == 0) {
    goto LABEL_6;
  }
  int v7 = [v4 category];
  id v8 = [v7 type];

  if (v8)
  {
    id v9 = [(ConversationViewControllerBase *)self delegate];
    BOOL v10 = [v9 currentlySelectedBucketForConversationViewController:self] == (id)1;
  }
  else
  {
LABEL_6:
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldShowTimeSensitiveDescriptionForCategory:(unint64_t)a3
{
  id v4 = +[NSUserDefaults em_userDefaults];
  BOOL v5 = v4;
  switch(a3)
  {
    case 3uLL:
      unsigned __int8 v6 = [v4 BOOLForKey:EMUserDefaultTimeSensitivePromotionsDescription];
      break;
    case 2uLL:
      unsigned __int8 v6 = [v4 BOOLForKey:EMUserDefaultTimeSensitiveUpdatesDescription];
      break;
    case 1uLL:
      unsigned __int8 v6 = [v4 BOOLForKey:EMUserDefaultTimeSensitiveTransactionsDescription];
      break;
    default:
      char v7 = 0;
      goto LABEL_9;
  }
  char v7 = v6 ^ 1;
LABEL_9:

  return v7;
}

- (void)_updateTimeSensitiveDefaultForCategory:(unint64_t)a3
{
  id v4 = +[NSUserDefaults em_userDefaults];
  if (a3 - 1 < 3) {
    [v4 setBool:1 forKey:*(void *)*(&off_100605EF0 + a3 - 1)];
  }
}

- (void)swipableCollectionViewLayout:(id)a3 willBeginSwipeAtIndexPath:(id)a4
{
  id v4 = [(ConversationViewControllerBase *)self cellExpansionRecognizer];
  [v4 cancel];
}

- (id)swipableCollectionViewLayout:(id)a3 leadingSwipeActionsConfigurationForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(ConversationViewController *)self _messageAtIndexPath:v5];
  char v7 = v6;
  if (v6 && ([v6 isEditable] & 1) == 0)
  {
    id v21 = v7;
    id v9 = +[NSArray arrayWithObjects:&v21 count:1];
    BOOL v10 = sub_100216998(0);
    int64_t v11 = +[MFTriageActionUtilities triageActionForActionKey:v10];

    BOOL v12 = [(ConversationViewController *)self messageTriageInteractionHelper];
    id v13 = [(ConversationViewControllerBase *)self collectionView];
    id v14 = [v13 cellForItemAtIndexPath:v5];
    id v15 = [v12 triageInteractionForTriageAction:v11 withMessageListItems:v9 presentationSource:v14 presentingViewController:self moveInteractionDelegate:self forPreview:0 origin:3];

    uint64_t v16 = [(ConversationViewController *)self _swipeActionForTriageInteraction:v15];
    id v17 = (void *)v16;
    if (v16)
    {
      uint64_t v20 = v16;
      double v18 = +[NSArray arrayWithObjects:&v20 count:1];
      id v8 = +[UISwipeActionsConfiguration configurationWithActions:v18];

      objc_msgSend(v8, "setPerformsFirstActionWithFullSwipe:", objc_msgSend(v15, "isDestructive") ^ 1);
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

- (id)swipableCollectionViewLayout:(id)a3 trailingSwipeActionsConfigurationForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = [(ConversationViewController *)self _messageAtIndexPath:v5];
  if (v6)
  {
    char v7 = [(ConversationViewControllerBase *)self collectionView];
    double v30 = [v7 cellForItemAtIndexPath:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v30;
      id v9 = [v8 predictedMailbox];

      if (!v9)
      {
        double v32 = v6;
        BOOL v10 = +[NSArray arrayWithObjects:&v32 count:1];
        int64_t v11 = +[MFMoveToPredictionTriageInteraction predictMailboxForMovingMessages:v10];
        [v8 setPredictedMailbox:v11];
      }
    }
    unsigned __int8 v12 = [v6 isEditable];
    CGFloat v31 = v6;
    id v13 = +[NSArray arrayWithObjects:&v31 count:1];
    id v14 = objc_alloc_init((Class)NSMutableArray);
    if ((v12 & 1) != 0 || ![v6 shouldArchiveByDefault])
    {
      id v15 = [(ConversationViewController *)self undoManager];
      CGFloat v29 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v13 undoManager:v15 origin:3 actor:2];
    }
    else
    {
      id v15 = [(ConversationViewController *)self undoManager];
      CGFloat v29 = +[MFDestructiveTriageInteraction interactionWithMessageListItems:v13 undoManager:v15 origin:3 actor:2];
    }

    uint64_t v16 = [v29 swipeActionWithPreparation:0 completion:0];
    [v14 addObject:v16];
    if ((v12 & 1) == 0)
    {
      id v17 = sub_100216A64(0);
      int64_t v18 = +[MFTriageActionUtilities triageActionForActionKey:v17];

      unsigned int v19 = [(ConversationViewController *)self messageTriageInteractionHelper];
      uint64_t v20 = [(ConversationViewControllerBase *)self collectionView];
      id v21 = [v20 cellForItemAtIndexPath:v5];
      BOOL v22 = [v19 triageInteractionForTriageAction:v18 withMessageListItems:v13 presentationSource:v21 presentingViewController:self moveInteractionDelegate:self forPreview:0 origin:3];

      id v23 = [(ConversationViewController *)self _swipeActionForTriageInteraction:v22];
      if (v23) {
        [v14 addObject:v23];
      }
      double v24 = [(ConversationViewController *)self undoManager];
      double v25 = +[MFMoreTriageInteraction interactionWithMessageListItems:v13 undoManager:v24 origin:3 actor:2 interactionStyle:1];

      [v25 setDelegate:self];
      double v26 = [v25 swipeAction];
      [v14 addObject:v26];
    }
    int v27 = +[UISwipeActionsConfiguration configurationWithActions:v14];
    [v27 setPerformsFirstActionWithFullSwipe:0];
  }
  else
  {
    int v27 = 0;
  }

  return v27;
}

- (BOOL)swipableCollectionViewLayout:(id)a3 shouldAnimateAppearingItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(ConversationViewControllerBase *)self allowQuickReply]
    && [(ConversationViewController *)self _isQuickReplyMessageAtIndexPath:v5])
  {
    unsigned __int8 v6 = +[ConversationViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      int v11 = 138412802;
      unsigned __int8 v12 = v8;
      __int16 v13 = 2048;
      id v14 = self;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Should animate appearing item at indexPath=%@)", (uint8_t *)&v11, 0x20u);
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_swipeActionForTriageInteraction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_100087994;
    v8[3] = &unk_1006057D0;
    void v8[4] = self;
    uint64_t v5 = [v4 swipeActionWithPreparation:0 completion:v8];
  }
  else
  {
    uint64_t v5 = [v4 swipeAction];
  }
  unsigned __int8 v6 = (void *)v5;

  return v6;
}

- (void)flagButtonTapped:(id)a3
{
}

- (void)readButtonTapped:(id)a3
{
}

- (void)unreadButtonTapped:(id)a3
{
}

- (void)junkButtonTapped:(id)a3
{
}

- (void)muteButtonTapped:(id)a3
{
  id v4 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  uint64_t v5 = [(ConversationViewController *)self undoManager];
  unsigned __int8 v6 = +[MFConversationFlagTriageInteraction interactionWithReferenceMessage:v4 undoManager:v5 origin:3 actor:2];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100087C6C;
  v7[3] = &unk_1006057F8;
  objc_copyWeak(&v8, &location);
  [v6 performInteractionWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)laterButtonTapped:(id)a3
{
  id v4 = sub_100087F84(self, a3, 2);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008808C;
  v5[3] = &unk_1006057F8;
  objc_copyWeak(&v6, &location);
  [v4 performInteractionWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)customBackButtonTapped:(id)a3
{
  id v3 = [(ConversationViewController *)self splitViewController];
  [v3 showMessageListViewController:1 animated:1 completion:0];
}

- (void)conversationNavigationBarItemsManager:(id)a3 validateBarButtonItem:(id)a4 ofType:(int64_t)a5
{
  id v7 = a4;
  id v8 = [(ConversationViewController *)self selectionDataSource];
  unsigned int v9 = [v8 shouldUseSelectionDataSourceForConversationViewController:self];
  if (v9)
  {
    BOOL v10 = [v8 messageListItemSelectionForConversationViewController:self];
  }
  else
  {
    BOOL v10 = 0;
  }
  if ([v10 isSelectAll])
  {
    uint64_t v11 = 1;
  }
  else
  {
    unsigned __int8 v12 = [v10 messageListItems];
    uint64_t v11 = [v12 count] != 0;
  }
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100089018;
  v46[3] = &unk_100605880;
  id v13 = v7;
  id v47 = v13;
  id v14 = objc_retainBlock(v46);
  switch(a5)
  {
    case 0:
    case 1:
    case 2:
      goto LABEL_12;
    case 3:
    case 4:
    case 5:
    case 12:
    case 13:
      uint64_t v11 = v9 ^ 1;
      goto LABEL_13;
    case 6:
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100089038;
      v38[3] = &unk_1006058D0;
      v38[4] = self;
      char v41 = v9;
      id v39 = v10;
      id v40 = v13;
      char v42 = v11;
      ((void (*)(void *, void *))v14[2])(v14, v38);

      __int16 v15 = v39;
      goto LABEL_20;
    case 7:
      id v27 = v7;
      id v19 = v13;
      BOOL v22 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphRead, v27);
      [v19 setImage:];

      int64_t v18 = _EFLocalizedString();
      [v19 setTitle:v18];
      id v16 = 0;
      goto LABEL_16;
    case 8:
      id v16 = v13;
      id v17 = +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphUnread, v7);
      [v16 setImage:v17];

      int64_t v18 = _EFLocalizedString();
      [v16 setTitle:v18];
      id v19 = 0;
LABEL_16:

      if (v9)
      {
        double v28 = v19;
        id v23 = [v8 messageTriageInteractionHelperForConversationViewController:self];
        double v24 = [v10 messageListItems];
        int v25 = [v23 flagStateForTriageAction:2 messageListItems:v24 isSelectAll:[v10 isSelectAll] supportsSelectAll:1];

        sub_10008116C(self, v16, v28, v25, v11);
        id v19 = v28;
      }
      else
      {
        id v23 = [(ConversationViewControllerBase *)self referenceMessageListItem];
        double v26 = [v23 flags];
        sub_10008116C(self, v16, v19, (int)[v26 read], v23 != 0);
      }
      break;
    case 9:
      uint64_t v20 = +[UIImage systemImageNamed:MFImageGlyphJunk];
      [v13 setImage:v20];

      id v21 = _EFLocalizedString();
      [v13 setTitle:v21];

LABEL_12:
      if (v9) {
LABEL_13:
      }
        [v13 setEnabled:v11];
      break;
    case 10:
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      void v29[2] = sub_1000892B4;
      v29[3] = &unk_1006058F8;
      void v29[4] = self;
      id v30 = v13;
      char v32 = v9;
      id v31 = v10;
      ((void (*)(void *, void *))v14[2])(v14, v29);

      __int16 v15 = v30;
      goto LABEL_20;
    case 11:
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100089190;
      v33[3] = &unk_1006058F8;
      char v37 = v9;
      id v34 = v10;
      CGFloat v35 = self;
      id v36 = v13;
      ((void (*)(void *, void *))v14[2])(v14, v33);

      __int16 v15 = v34;
      goto LABEL_20;
    case 14:
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100089024;
      v43[3] = &unk_1006058A8;
      id v44 = v13;
      char v45 = v9;
      ((void (*)(void *, void *))v14[2])(v14, v43);
      __int16 v15 = v44;
LABEL_20:

      break;
    default:
      break;
  }
}

- (void)revealActionsButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100089454;
  v7[3] = &unk_100605948;
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(ConversationViewController *)self _presentMailActionsViewControllerFromBarButtonItem:v6 dataSourceClass:v5 includeMessageContentRequest:1 completionHandler:v7];
}

- (void)replyButtonTapped:(id)a3
{
}

- (void)replyAllButtonTapped:(id)a3
{
}

- (void)forwardButtonTapped:(id)a3
{
}

- (void)deleteButtonTapped:(id)a3
{
}

- (void)_doDeleteSelectedMessagesAskingConfirmation:(BOOL)a3 presentationSourceButtonItem:(id)a4 forceArchive:(BOOL)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  BOOL v10 = sub_10007EC48(self);
  if (v10)
  {
    if (a5 || [(ConversationViewController *)self _shouldArchiveByDefault])
    {
      uint64_t v11 = [(ConversationViewController *)self undoManager];
      unsigned __int8 v12 = +[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:v10 undoManager:v11 origin:3 actor:2];
      int v13 = 1;
    }
    else
    {
      uint64_t v11 = [(ConversationViewController *)self undoManager];
      unsigned __int8 v12 = +[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:v10 undoManager:v11 origin:3 actor:2];
      int v13 = 0;
    }

    __int16 v15 = +[ConversationViewController log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"Delete";
      *(_DWORD *)CGRect buf = 134218498;
      char v37 = self;
      if (v13) {
        CFStringRef v16 = @"Archive";
      }
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v16;
      __int16 v40 = 1024;
      BOOL v41 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "<%p> %@ selected messages. Ask for confirmation? %{BOOL}d", buf, 0x1Cu);
    }
    char v26 = v13;

    id v17 = [(ConversationViewController *)self selectionDataSource];
    unsigned int v18 = [v17 shouldUseSelectionDataSourceForConversationViewController:self];
    if (v18)
    {
      id v19 = [v17 messageTriageInteractionHelperForConversationViewController:self];
      [v12 setDelegate:v19];
    }
    else
    {
      [v12 setDelegate:self];
    }
    [v12 setShouldAskForConfirmation:v6];
    [v12 setPresentationSource:v9];
    [v9 setEnabled:0];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100089D94;
    v33[3] = &unk_1006057A8;
    objc_copyWeak(&v34, &location);
    uint64_t v20 = objc_retainBlock(v33);
    id v21 = +[ConversationViewController log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [v10 messageListItems];
      id v23 = (void *)v22;
      double v24 = (ConversationViewController *)@"selection data source";
      if (!v18) {
        double v24 = self;
      }
      *(_DWORD *)CGRect buf = 138412546;
      char v37 = v24;
      __int16 v38 = 2112;
      uint64_t v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Performing triage interaction with delegate from %@ and selection: %@", buf, 0x16u);
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100089DF0;
    v27[3] = &unk_100605970;
    objc_copyWeak(&v31, &location);
    char v32 = v26;
    id v28 = v9;
    int v25 = v20;
    id v30 = v25;
    id v14 = v12;
    CGFloat v29 = v14;
    [v14 performInteractionWithCompletion:v27];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    id v14 = +[ConversationViewController log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100458A48();
    }
  }
}

- (void)searchMessages:(id)a3
{
  sub_100095E2C((uint64_t)self);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 presentFindNavigatorShowingReplace:0];
}

- (id)_recategorizationMenu
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_10008A198;
  id v9 = &unk_100605998;
  objc_copyWeak(&v10, &location);
  v2 = +[UIDeferredMenuElement elementWithUncachedProvider:&v6];
  unsigned __int8 v12 = v2;
  id v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1, v6, v7, v8, v9);
  id v4 = +[UIMenu menuWithTitle:&stru_100619928 image:0 identifier:0 options:1 children:v3];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_groupedSenderActionMenuItemsWithMenuOwner:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  int v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  __int16 v15 = sub_10008A6AC;
  CFStringRef v16 = &unk_1006059C0;
  objc_copyWeak(&v18, &location);
  id v5 = v4;
  id v17 = v5;
  BOOL v6 = +[UIDeferredMenuElement elementWithUncachedProvider:&v13];
  id v21 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1, v13, v14, v15, v16);
  id v8 = +[UIMenu menuWithTitle:&stru_100619928 image:0 identifier:0 options:1 children:v7];

  id v9 = [(ConversationViewController *)self _customReturnToGroupSenderList];
  id v10 = [(ConversationViewController *)self _recategorizationMenu];
  v20[0] = v9;
  v20[1] = v8;
  void v20[2] = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:v20 count:3];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v11;
}

- (id)groupedSenderActionMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4
{
  id v4 = [(ConversationViewController *)self _groupedSenderActionMenuItemsWithMenuOwner:a4];
  id v5 = +[UIMenu menuWithTitle:&stru_100619928 children:v4];

  [v5 setAccessibilityIdentifier:MSAccessibilityIdentifierGroupedSenderActionMenu];

  return v5;
}

- (id)_customReturnToGroupSenderList
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008A980;
  v4[3] = &unk_100605A10;
  void v4[4] = self;
  v2 = +[UICustomViewMenuElement elementWithViewProvider:v4];

  return v2;
}

- (void)_groupedSenderMessageCountForQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[EFPromise promise];
  id v9 = [(ConversationViewController *)self messageRepository];
  id v10 = [v8 completionHandlerAdapter];
  [v9 performCountQuery:v6 completionHandler:v10];

  uint64_t v11 = +[EFScheduler mainThreadScheduler];
  unsigned __int8 v12 = [v8 future];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_10008B170;
  void v20[3] = &unk_100605A38;
  id v13 = v7;
  id v21 = v13;
  [v12 onScheduler:v11 addSuccessBlock:v20];

  uint64_t v14 = [v8 future];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008B1E4;
  v17[3] = &unk_100605A60;
  id v15 = v6;
  id v18 = v15;
  id v16 = v13;
  id v19 = v16;
  [v14 onScheduler:v11 addFailureBlock:v17];
}

- (id)_messageDeletionCompletionHandlerForMenuOwner:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008B3C4;
  v9[3] = &unk_100605168;
  objc_copyWeak(&v12, &location);
  id v10 = v4;
  uint64_t v11 = self;
  id v5 = v4;
  id v6 = objc_retainBlock(v9);
  id v7 = objc_retainBlock(v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v7;
}

- (id)_deleteActionForMessageListItemSelection:(id)a3 menuOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    id v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v9 = [(ConversationViewController *)self _presentationStringForMessageListItem:v8];

    id v10 = [(ConversationViewControllerBase *)self delegate];
    id v11 = [v10 currentlySelectedBucketForConversationViewController:self];

    id v12 = [(ConversationViewController *)self messageList];
    id v13 = [v12 query];
    uint64_t v14 = [(ConversationViewController *)self undoManager];
    id v15 = +[MFGroupedSenderDestructiveTriageInteraction interactionWithQuery:v13 groupedSenderDisplayName:v9 selectedBucket:v11 undoManager:v14 origin:3 actor:2];

    [v15 setTitleIncludesCount:0];
    id v16 = [(ConversationViewController *)self view];
    [v15 setPresentationSource:v16];

    [v15 setShouldAskForConfirmation:1];
    [v15 setType:2];
    [v15 setDelegate:self];
    id v17 = [(ConversationViewController *)self _messageDeletionCompletionHandlerForMenuOwner:v7];
    id v18 = [v15 menuActionWithPreparation:0 completion:v17];
  }
  else
  {
    id v19 = [(ConversationViewController *)self undoManager];
    id v9 = +[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:v6 undoManager:v19 origin:3 actor:2];

    [v9 setDelegate:self];
    id v15 = [(ConversationViewController *)self _messageDeletionCompletionHandlerForMenuOwner:v7];
    id v18 = [v9 menuActionWithPreparation:0 completion:v15];
  }

  return v18;
}

- (id)_archiveActionForMessageListItemSelection:(id)a3 menuOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    id v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v9 = [(ConversationViewController *)self _presentationStringForMessageListItem:v8];

    id v10 = [(ConversationViewControllerBase *)self delegate];
    id v11 = [v10 currentlySelectedBucketForConversationViewController:self];

    id v12 = [(ConversationViewController *)self messageList];
    id v13 = [v12 query];
    uint64_t v14 = [(ConversationViewController *)self undoManager];
    id v15 = +[MFGroupedSenderDestructiveTriageInteraction interactionWithQuery:v13 groupedSenderDisplayName:v9 selectedBucket:v11 undoManager:v14 origin:3 actor:2];

    [v15 setTitleIncludesCount:0];
    id v16 = [(ConversationViewController *)self view];
    [v15 setPresentationSource:v16];

    [v15 setShouldAskForConfirmation:1];
    [v15 setType:2];
    [v15 setDelegate:self];
  }
  else
  {
    id v17 = [(ConversationViewController *)self undoManager];
    id v15 = +[MFDestructiveTriageInteraction interactionWithMessageListItemSelection:v6 undoManager:v17 origin:3 actor:2];

    [v15 setDelegate:self];
  }
  id v18 = [(ConversationViewController *)self _messageDeletionCompletionHandlerForMenuOwner:v7];
  id v19 = [v15 menuActionWithPreparation:0 completion:v18];

  [v19 setAttributes:[v19 attributes] ^ 2];

  return v19;
}

- (id)deleteButtonMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4
{
  id v5 = a4;
  id v6 = sub_10007EC48(self);
  id v7 = [(ConversationViewController *)self _deleteActionForMessageListItemSelection:v6 menuOwner:v5];
  id v8 = [(ConversationViewController *)self _archiveActionForMessageListItemSelection:v6 menuOwner:v5];
  v12[0] = v8;
  v12[1] = v7;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[UIMenu menuWithTitle:&stru_100619928 children:v9];

  return v10;
}

- (void)moveButtonTapped:(id)a3
{
  id v5 = a3;
  id v6 = sub_10007EC48(self);
  if (v6)
  {
    id v7 = [(ConversationViewController *)self selectionDataSource];
    if ([v7 shouldUseSelectionDataSourceForConversationViewController:self])
    {
      [v7 conversationViewController:self performTriageAction:7 presentationSource:v5];
    }
    else
    {
      id v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      id v9 = v8;
      if (v8
        && ([v8 displayMessage],
            id v10 = objc_claimAutoreleasedReturnValue(),
            [v10 result],
            id v11 = objc_claimAutoreleasedReturnValue(),
            v11,
            v10,
            v11))
      {
        id v12 = [(ConversationViewController *)self predictedMailboxForConversation];
        id v13 = [v12 resultIfAvailable];

        unsigned int v14 = [(ConversationViewControllerBase *)self shouldHideStickyFooterView];
        if (v13) {
          unsigned int v15 = v14;
        }
        else {
          unsigned int v15 = 0;
        }
        if (v15 == 1)
        {
          uint64_t v16 = objc_opt_class();
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10008BFB8;
          v24[3] = &unk_100605948;
          v24[4] = self;
          id v25 = v5;
          [(ConversationViewController *)self _presentMailActionsViewControllerFromBarButtonItem:v25 dataSourceClass:v16 includeMessageContentRequest:0 completionHandler:v24];
        }
        else
        {
          id v17 = [v6 messageListItems];
          id v18 = [(ConversationViewController *)self undoManager];
          id v19 = +[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:v17 undoManager:v18 origin:3 actor:2 presentationSource:v5 delegate:self presentingViewController:self predictedMailbox:v13];

          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          void v21[2] = sub_10008C130;
          v21[3] = &unk_100605A88;
          v21[4] = self;
          id v22 = v5;
          id v23 = v19;
          id v20 = v19;
          [v20 performInteractionWithCompletion:v21];
        }
      }
      else
      {
        id v13 = +[ConversationViewController log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100458AE0();
        }
      }
    }
  }
  else
  {
    id v7 = +[ConversationViewController log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_100458A48();
    }
  }
}

- (id)_createMailActionViewHeader
{
  id v3 = [(ConversationViewControllerBase *)self displayMetrics];
  +[MailActionViewHeader defaultHeightWithDisplayMetrics:v3];
  double v5 = v4;
  id v6 = [(ConversationViewController *)self view];
  [v6 frame];
  double Width = CGRectGetWidth(v13);

  id v8 = -[MailActionViewHeader initWithFrame:]([MailActionViewHeader alloc], "initWithFrame:", 0.0, 0.0, Width, v5);
  id v9 = [(ConversationViewControllerBase *)self contactStore];
  [(MFMessageConversationViewCell *)v8 setContactStore:v9];

  id v10 = +[MFMessageDisplayMetrics mf_actionCardMetricsFromDisplayMetrics:v3];
  [(MFConversationViewCell *)v8 setDisplayMetrics:v10];

  return v8;
}

- (void)_presentMailActionsViewControllerFromBarButtonItem:(id)a3 dataSourceClass:(id)a4 includeMessageContentRequest:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void, id))a6;
  CGRect v13 = [(ConversationViewController *)self targetMessageForBarButtonTriage];
  if (v13)
  {
    [(ConversationViewController *)self setSelectedMessage:v13];
    unsigned int v14 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    unsigned int v15 = v14;
    if (v14
      && ([v14 displayMessage],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v16))
    {
      CGFloat v52 = v10;
      id v47 = v11;
      CGFloat v50 = v12;
      if (v7)
      {
        id v17 = [v13 itemID];
        uint64_t v18 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v17];

        id v19 = [v13 itemID];
        CGFloat v48 = [(ConversationViewController *)self _getCurrentlySelectedMessageContentForMessageItemID:v19];
      }
      else
      {
        CGFloat v48 = 0;
        uint64_t v18 = 0;
      }
      double v49 = v18;
      double v51 = [(ConversationViewController *)self _createMailActionViewHeader];
      if ([(ConversationViewController *)self _isDisplayingSingleMessage] || v7)
      {
        id v23 = [ConversationCellViewModel alloc];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_10008CAFC;
        v61[3] = &unk_100604F20;
        id v62 = v13;
        CGFloat v63 = self;
        double v24 = [(ConversationCellViewModel *)v23 initWithBuilder:v61];
        [v51 setViewModel:v24];
      }
      else
      {
        id v25 = +[NSBundle mainBundle];
        char v26 = [v25 localizedStringForKey:@"MESSAGE_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
        id v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, [v15 count]);

        id v28 = [(ConversationViewControllerBase *)self conversationSubject];
        CGFloat v29 = +[ECSubjectFormatter subjectStringForDisplayForSubject:v28 style:1];

        [v51 updateTitle:v27 subject:v29];
      }
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      id v30 = [MailActionsViewController alloc];
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_10008CC94;
      v58[3] = &unk_100604FE8;
      objc_copyWeak(&v59, &location);
      id v31 = [(MailActionsViewController *)v30 initWithDelegate:self messageHeaderView:v51 didDismissHandler:v58];
      id v32 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v31];
      [v32 setModalPresentationStyle:7];
      CGFloat v33 = [v32 presentationController];
      [v33 setDelegate:self];

      id v34 = [v32 popoverPresentationController];
      [v52 mui_setAsSourceForPopoverPresentationController:v34];

      CGFloat v46 = v50[2](v50, v31);
      BOOL v35 = [v15 count] != (id)1;
      id v36 = [MFTriageInteractionTarget alloc];
      char v37 = [v15 displayMessage];
      __int16 v38 = [v37 result];
      uint64_t v39 = [(MFTriageInteractionTarget *)v36 initWithMessageListItem:v15 primaryMessage:v38 selectedMessageContent:v48 primaryMessageContentRequest:v49 targetPreference:v35 preferQuickCompositionalActions:0];

      __int16 v40 = [(ConversationViewControllerBase *)self delegate];
      id v41 = [v11 alloc];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10008CCF4;
      v53[3] = &unk_100605AB0;
      v53[4] = self;
      id v54 = v52;
      char v42 = v39;
      CGFloat v55 = v42;
      id v43 = v46;
      id v57 = v43;
      id v44 = v40;
      id v56 = v44;
      id v45 = [v41 initWithBuilderBlock:v53];
      [(MailActionsViewController *)v31 setDataSource:v45];

      [(ConversationViewControllerBase *)self presentViewController:v32 animated:1 completion:0];
      objc_destroyWeak(&v59);
      objc_destroyWeak(&location);

      id v10 = v52;
      id v11 = v47;
      id v20 = v49;
      id v12 = v50;
    }
    else
    {
      id v20 = +[ConversationViewController log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100458BC0();
      }
    }
  }
  else
  {
    unsigned int v15 = +[ConversationViewController log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100458B4C(v15, v21, v22);
    }
  }
}

- (void)presentTransferUIWithMoveInteraction:(id)a3 prediction:(id)a4 fromViewController:(id)a5 didDismissHandler:(id)a6
{
  id v10 = a3;
  id v23 = a4;
  id v11 = a5;
  id v12 = a6;
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_10008D020;
  id v28 = &unk_100605AD8;
  id v13 = v10;
  id v29 = v13;
  unsigned int v14 = objc_retainBlock(&v25);
  unsigned int v15 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  if (v15)
  {
    uint64_t v16 = [v13 messageListItemSelection];
    id v17 = [v16 messageListItems];
    id v18 = [v17 em_messageListItemTotalCount];
    char v19 = v18 == [v15 count];
  }
  else
  {
    char v19 = 1;
  }
  id v20 = [v13 messageListItemSelection:v23, v25, v26, v27, v28];
  uint64_t v21 = [v20 messageListItems];
  uint64_t v22 = [v13 presentationSource];
  sub_10008D02C(self, v21, v24, v11, v22, v19, v14, v12);
}

- (id)moreTriageInteraction:(id)a3 actionsViewControllerWithInteractionTarget:(id)a4 didDismissHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 messageListItem];
  id v12 = [v11 itemID];

  id v13 = [(ConversationViewController *)self collectionViewDataSource];
  unsigned int v14 = [v13 indexPathForItemIdentifier:v12];

  unsigned int v15 = [(ConversationViewControllerBase *)self collectionView];
  uint64_t v16 = [v15 cellForItemAtIndexPath:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v10;
    id v17 = v16;
    id v24 = v8;
    id v18 = [v9 primaryMessage];
    char v19 = [v9 primaryMessageContentRequest];
    id v20 = [v17 predictedMailbox];
    uint64_t v21 = [v8 presentationSource];
    uint64_t v22 = [(ConversationViewController *)self _actionsViewControllerWithMessage:v18 contentRequest:v19 predictedMailbox:v20 button:v21 didDismissHandler:v25];

    id v8 = v24;
    id v10 = v25;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

- (BOOL)flagStateForFlagChangeTriageInteraction:(id)a3
{
  return [(ConversationViewController *)self groupedSenderUnreadCount] == 0;
}

- (void)updateAvatarViewControllerForTriageInteraction:(id)a3 alertController:(id)a4
{
  id v10 = a4;
  double v5 = [(ConversationViewControllerBase *)self avatarGenerator];
  id v6 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  BOOL v7 = [(ConversationViewControllerBase *)self contactStore];
  id v8 = [(ConversationViewControllerBase *)self scene];
  id v9 = [v8 brandIndicatorProvider];
  [v10 mf_addAvatarWithAvatarGenerator:v5 messageListItem:v6 contactStore:v7 brandIndicatorProvider:v9];
}

- (void)groupedSenderMessageCountForDestructiveTriageInteraction:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[EFPromise promise];
  BOOL v7 = [(ConversationViewController *)self messageList];
  id v8 = [v7 unfilteredMessageList];
  id v9 = [v8 query];

  id v10 = [(ConversationViewController *)self messageRepository];
  id v11 = [v6 completionHandlerAdapter];
  [v10 performCountQuery:v9 completionHandler:v11];

  id v12 = +[EFPromise promise];
  id v13 = [(ConversationViewController *)self messageRepository];
  unsigned int v14 = [(ConversationViewController *)self messageList];
  unsigned int v15 = [v14 query];
  uint64_t v16 = [v12 completionHandlerAdapter];
  [v13 performCountQuery:v15 completionHandler:v16];

  v26[0] = v6;
  v26[1] = v12;
  id v17 = +[NSArray arrayWithObjects:v26 count:2];
  id v18 = +[EFFuture join:v17];

  char v19 = +[EFScheduler mainThreadScheduler];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008E19C;
  v24[3] = &unk_100605208;
  id v20 = v5;
  id v25 = v20;
  [v18 onScheduler:v19 addSuccessBlock:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008E268;
  v22[3] = &unk_100604DB8;
  id v21 = v20;
  id v23 = v21;
  [v18 onScheduler:v19 addFailureBlock:v22];
}

- (id)actionViewHeaderForCategorizationInteraction:(id)a3 messageListItem:(id)a4
{
  id v5 = a4;
  id v6 = [(ConversationViewController *)self _createMailActionViewHeader];
  BOOL v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"MESSAGE_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
  id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, [(ConversationViewController *)self countOfMessages]);

  id v10 = [ConversationCellViewModel alloc];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008E528;
  v15[3] = &unk_100605078;
  id v11 = v5;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v18 = self;
  id v13 = [(ConversationCellViewModel *)v10 initWithBuilder:v15];
  [v6 setViewModel:v13];

  return v6;
}

- (id)messageRepositoryForTriageInteraction:(id)a3
{
  id v3 = [(ConversationViewController *)self messageRepository];

  return v3;
}

- (id)transferStackViewController:(id)a3 displayMessageForMessageListItemWithItemID:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v8 = [v7 itemID];
    unsigned __int8 v9 = [v8 isEqual:v6];

    if ((v9 & 1) == 0)
    {
      unsigned int v14 = +[NSAssertionHandler currentHandler];
      [v14 handleFailureInMethod:a2, self, @"ConversationViewController.m", 4907, @"we're displaying something other than referenceMessageListItem for itemID:%@", v6 object file lineNumber description];
    }
    id v10 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    uint64_t v11 = [v10 displayMessage];
  }
  else
  {
    id v10 = [(ConversationViewController *)self messageList];
    uint64_t v11 = [v10 messageListItemForItemID:v6];
  }
  id v12 = (void *)v11;

  return v12;
}

- (id)transferStackViewController:(id)a3 itemIDsToDisplayFromItemIDs:(id)a4
{
  id v4 = a4;

  return v4;
}

- (void)showAllMessagesForConversationSenderHeaderView:(id)a3
{
  id v8 = [(ConversationViewController *)self messageList];
  id v5 = [v8 filterPredicate];

  if (!v5)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:4922 description:@"There needs to be a valid predicate"];
  }
  id v9 = [(ConversationViewController *)self messageList];
  id v6 = [v9 filterPredicate];
  [(ConversationViewController *)self setCategoryPredicate:v6];

  id v10 = [(ConversationViewController *)self messageList];
  BOOL v7 = [v10 unfilteredMessageList];
  [(ConversationViewController *)self _reloadDataSourceWithMessageList:v7];
}

- (void)showCategoryMessagesForConversationSenderHeaderView:(id)a3
{
  id v4 = [(ConversationViewController *)self messageList];
  id v5 = [(ConversationViewController *)self categoryPredicate];
  id v6 = [v4 filteredMessageListWithPredicate:v5 ignoredMessagesPredicate:0 userFiltered:1];

  [(ConversationViewController *)self _reloadDataSourceWithMessageList:v6];
}

- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 type];
  if (!v8)
  {
    id v12 = [v6 message];
    sub_10008EBEC(self, v7, v12);
LABEL_7:

    goto LABEL_8;
  }
  if (v8 == (id)1)
  {
    id v9 = +[ConversationViewController log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100458CDC();
    }

    id v10 = objc_alloc((Class)NSArray);
    id v11 = [(ConversationViewControllerBase *)self referenceMessageListItem];
    id v12 = [v10 initWithObjects:v11, 0];

    id v13 = [objc_alloc((Class)EMMessageReadLaterAction) initWithMessageListItems:v12 origin:3 actor:2 readLaterDate:v7];
    unsigned int v14 = [(ConversationViewController *)self messageRepository];
    [v14 performMessageChangeAction:v13];

    goto LABEL_7;
  }
LABEL_8:
  [v6 dismissViewControllerAnimated:1 completion:0];
  [(ConversationViewController *)self _reloadDataSource];
}

- (void)datePickerViewControllerDidDeleteDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSArray);
  id v6 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v7 = [v5 initWithObjects:v6, 0];

  id v8 = [v4 message];
  id v9 = [v8 sendLaterDate];

  if (v9)
  {
    sub_10008EBEC(self, 0, v8);
  }
  else
  {
    id v10 = [v8 readLater];

    if (v10)
    {
      id v11 = [objc_alloc((Class)EMMessageReadLaterAction) initWithMessageListItems:v7 origin:3 actor:2 readLaterDate:0];
      id v12 = [(ConversationViewController *)self messageRepository];
      [v12 performMessageChangeAction:v11];

      sub_10008F208(self, v8, &stru_100605C00);
    }
    else
    {
      id v13 = +[ConversationViewController log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [v8 ef_publicDescription];
        objc_claimAutoreleasedReturnValue();
        sub_100458D1C();
      }
    }
  }
  [(ConversationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_headerView:(id)a3 displayWithBannerForViewModel:(id)a4
{
  id v10 = a3;
  [v10 displayMessageUsingViewModel:a4];
  id v6 = [v10 headerBlocks];
  id v7 = [v6 ef_firstObjectPassingTest:&stru_100605C70];

  if (v7)
  {
    id v8 = [v10 viewModel];
    unsigned int v9 = [(ConversationViewController *)self _shouldRemoveBannerBlock:v7 forHeaderViewModel:v8];

    if (v9) {
      [v10 removeHeaderBlock:v7 animated:1];
    }
  }
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  id v4 = [(ConversationViewController *)self presentingViewController];

  if (v4)
  {
    id v5 = self;
LABEL_5:
    id v7 = v5;
    goto LABEL_6;
  }
  id v6 = [(ConversationViewController *)self presentedViewController];

  if (v6)
  {
    id v5 = [(ConversationViewController *)self presentedViewController];
    goto LABEL_5;
  }
  unsigned int v9 = [(ConversationViewControllerBase *)self scene];
  id v7 = [v9 mf_rootViewController];

LABEL_6:

  return v7;
}

- (void)_testReplyForSelectedMessage
{
  id v9 = [(ConversationViewController *)self targetMessageForBarButtonTriage];
  id v3 = [v9 itemID];
  id v4 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v3];

  id v5 = [(ConversationViewControllerBase *)self scene];
  id v6 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v4 scene:v5];

  id v7 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v8 = [v7 mailboxes];
  [v6 setMessageSourceMailboxes:v8];

  [v6 setShouldPromptToLoadRestOfMessage:0];
  [v6 performInteraction];
}

- (MessageTriageInteractionHelper)messageTriageInteractionHelper
{
  id v3 = *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4);
  if (!v3)
  {
    id v4 = [MessageTriageInteractionHelper alloc];
    id v5 = [(ConversationViewControllerBase *)self scene];
    id v6 = [(MessageTriageInteractionHelper *)v4 initWithDataSource:self triageInteractionDelegate:self scene:v5];
    id v7 = *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4);
    *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4) = v6;

    id v3 = *(MessageTriageInteractionHelper **)((char *)&self->_messageTriageInteractionHelper + 4);
  }

  return (MessageTriageInteractionHelper *)v3;
}

- (id)messageContentRepresentationRequestForMessageTriageInteractionHelper:(id)a3 message:(id)a4
{
  id v5 = [a4 itemID:a3];
  id v6 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v5];

  return v6;
}

- (id)messageTriageInteractionHelper:(id)a3 senderRepositoryForMessageListItems:(id)a4
{
  id v4 = [(ConversationViewControllerBase *)self scene];
  id v5 = [v4 daemonInterface];
  id v6 = [v5 senderRepository];

  return v6;
}

- (void)_scrolledToEndOfSingleMessage
{
  id v3 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v4 = [v3 displayMessageItemID];

  if (v4)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v5 = [(ConversationViewController *)self _messageFutureForItemID:v4];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10008FB58;
    v6[3] = &unk_100604D68;
    objc_copyWeak(&v7, &location);
    [v5 addSuccessBlock:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_updateFooterViewFrameForCell:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(ConversationViewControllerBase *)self shouldHideStickyFooterView])
  {
    id v4 = [(ConversationViewControllerBase *)self collectionView];
    id v5 = [v4 indexPathForCell:v6];

    [(ConversationViewController *)self _updateFooterViewFrameForCell:v6 atIndexPath:v5];
  }
}

- (void)_updateFooterToShowUndoSendForCell:(id)a3
{
  id v15 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = [(ConversationViewControllerBase *)self collectionView];
    id v5 = [v4 indexPathForCell:v15];

    if (v5)
    {
      id v6 = [v15 messageViewController];
      id v7 = [v6 messageContentView];
      unsigned __int8 v8 = [v7 showMessageFooter];

      if (v8)
      {
        id v9 = [v15 messageViewController];
        id v10 = [v9 messageContentView];
        id v11 = [v10 footerView];

        id v12 = [v15 messageViewController];
        id v13 = [v12 contentRequest];
        unsigned int v14 = [v13 message];
        [v11 setUndoSendButtonHidden:[self _isMessageInOutbox:v14] ^ 1];
      }
    }
  }
}

- (void)_updateFooterViewFrameForCell:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(ConversationViewControllerBase *)self shouldHideStickyFooterView];
  if (v7) {
    char v9 = v8;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    if ([v6 expanded])
    {
      id v10 = [v6 messageViewController];
      id v11 = [v10 messageContentView];
      unsigned __int8 v12 = [v11 showMessageFooter];

      if (v12)
      {
        BOOL v85 = [(ConversationViewControllerBase *)self displayMetrics];
        id v13 = [(ConversationViewControllerBase *)self collectionView];
        unsigned int v84 = [(ConversationViewControllerBase *)self _layoutAttributesForItemAtIndexPath:v7];
        unsigned int v14 = [v6 messageViewController];
        id v15 = [v14 messageContentView];

        id v16 = [v15 footerView];
        [v16 frame];
        double v81 = v17;
        double v82 = v18;
        double rect1 = v19;
        [v85 estimatedFooterViewHeight];
        double v80 = v20;
        [v13 frame];
        double MaxY = CGRectGetMaxY(v92);
        [v85 cellHeightToStartScroll];
        double v23 = v22;
        [v84 frame];
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        id v32 = [(ConversationViewController *)self view];
        [v13 convertRect:v32 toView:v25, v27, v29, v31];
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        CGFloat v38 = v37;
        CGFloat v40 = v39;

        v93.origin.CGFloat x = v34;
        v93.origin.CGFloat y = v36;
        v93.size.CGFloat width = v38;
        v93.size.CGFloat height = v40;
        double MinY = CGRectGetMinY(v93);
        v94.origin.CGFloat x = v34;
        v94.origin.CGFloat y = v36;
        v94.size.CGFloat width = v38;
        v94.size.CGFloat height = v40;
        double Height = CGRectGetHeight(v94);
        [v6 frame];
        double v42 = MaxY - v80;
        double v43 = fmax(Height, CGRectGetHeight(v95)) - v80;
        if (v43 >= v23)
        {
          [v13 bounds];
          double v44 = CGRectGetHeight(v96);
          id v45 = [v13 superview];
          [v6 convertPoint:v45 fromView:0.0, v42];
          double v42 = v46;

          if (MinY >= v44 - v23) {
            double v43 = v23;
          }
          else {
            double v43 = fmin(fmax(v42, v23), v43);
          }
        }
        UIRoundToViewScale();
        double v48 = v47;
        [v16 frame];
        v102.origin.CGFloat x = v49;
        v102.origin.CGFloat y = v50;
        v102.size.CGFloat width = v51;
        v102.size.CGFloat height = v52;
        v97.origin.CGFloat x = v81;
        v97.size.CGFloat height = v82;
        v97.origin.CGFloat y = v48;
        v97.size.CGFloat width = rect1;
        if (!CGRectEqualToRect(v97, v102)) {
          [v16 setFrame:v81, v48, rect1, v82];
        }
        [v85 footerViewButtonsAnimationOffset:MinY];
        double v54 = v53;
        [v13 frame];
        double v55 = CGRectGetMaxY(v98);
        v99.origin.CGFloat x = v34;
        v99.origin.CGFloat y = v36;
        v99.size.CGFloat width = v38;
        v99.size.CGFloat height = v40;
        double v56 = v55 - CGRectGetMaxY(v99);
        if (v56 <= v54) {
          double v57 = 0.0;
        }
        else {
          double v57 = v54;
        }
        if (v56 > v54 || v56 < 0.0) {
          double v56 = v57;
        }
        [v16 moveOriginYByOffset:v56];
        id v59 = [v15 scrollView];
        [v59 contentSize];
        double v61 = v60;
        id v62 = [v15 scrollView];
        [v62 contentInset];
        double v64 = v63;
        v100.origin.CGFloat x = v34;
        v100.origin.CGFloat y = v36;
        v100.size.CGFloat width = v38;
        v100.size.CGFloat height = v40;
        double v65 = CGRectGetMinY(v100);

        if (v43 >= v42)
        {
          __int16 v68 = [(ConversationViewControllerBase *)self collectionView];
          [v68 frame];
          BOOL v66 = v80 + v61 + v64 + v65 >= CGRectGetMaxY(v101);

          if (v66) {
            double v67 = 1.0;
          }
          else {
            double v67 = 0.0;
          }
        }
        else
        {
          BOOL v66 = 0;
          double v67 = 0.0;
        }
        CGFloat v69 = [v16 backgroundView];
        [v69 alpha];
        double v71 = v70;

        if (v71 != v67)
        {
          v89[0] = _NSConcreteStackBlock;
          v89[1] = 3221225472;
          v89[2] = sub_1000905B4;
          v89[3] = &unk_1006048E0;
          id v90 = v16;
          double v91 = v67;
          +[UIView animateWithDuration:v89 animations:0.2];
        }
        if (_os_feature_enabled_impl()) {
          unsigned int v72 = [v16 isUndoSendButtonHidden] ^ 1;
        }
        else {
          unsigned int v72 = 0;
        }
        CGRect v73 = [(ConversationViewControllerBase *)self cellConfigurator];
        id v74 = [v73 expansionStatusForMessageAtIndexPath:v7];

        if (v74 == (id)2)
        {
          uint64_t v75 = 0;
        }
        else if ([(ConversationViewController *)self _isDisplayingSingleMessage])
        {
          uint64_t v75 = 1;
        }
        else
        {
          uint64_t v75 = [v15 automaticallyCollapseQuotedContent] ^ 1 | v72;
        }
        [v16 setIsSemiExpanded:v74 == (id)2];
        [v16 setSeeMoreButtonHidden:v75];
        if (v66 || ([v16 seeMoreButtonHeight], double v77 = 1.0, v43 > v42 + v76)) {
          double v77 = 0.0;
        }
        if (([v16 isSeeMoreButtonHidden] & 1) == 0)
        {
          [v16 seeMoreButtonAlpha];
          if (v78 != v77)
          {
            v86[0] = _NSConcreteStackBlock;
            v86[1] = 3221225472;
            v86[2] = sub_100090624;
            v86[3] = &unk_1006048E0;
            id v87 = v16;
            double v88 = v77;
            +[UIView animateWithDuration:v86 animations:0.2];
          }
        }
        [v16 setAllowsPointerSnapping:v66];
      }
    }
  }
}

- (void)_hideSeeMoreButtonForCell:(id)a3
{
  id v3 = [a3 messageViewController];
  id v5 = [v3 messageContentView];

  id v4 = [v5 footerView];
  [v4 setIsSemiExpanded:0];
}

- (void)_updateFooterViewFrameForVisibleCells
{
  id v3 = [(ConversationViewControllerBase *)self collectionView];
  id v4 = [v3 visibleCells];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100090788;
  v5[3] = &unk_100605C98;
  void v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

- (id)captureRestorationState
{
  id v3 = [(ConversationViewControllerBase *)self delegate];
  unsigned __int8 v4 = [v3 conversationViewControllerIsResultOfSearch:self];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    [(ConversationViewController *)self pinCurrentItem];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000908EC;
    v7[3] = &unk_100605CC0;
    void v7[4] = self;
    id v5 = +[ConversationViewRestorationState stateWithBuilder:v7];
  }

  return v5;
}

- (void)restoreState:(id)a3
{
  id v4 = a3;
  id v5 = +[ConversationViewController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGRect buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v4 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restore state? %{BOOL}d", buf, 8u);
  }

  [(ConversationViewControllerBase *)self setRestorationFuture:v4];
  *(void *)CGRect buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v6 = +[EFScheduler mainThreadScheduler];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100090D40;
  v10[3] = &unk_100605CE8;
  objc_copyWeak(&v11, (id *)buf);
  [v4 onScheduler:v6 addSuccessBlock:v10];

  id v7 = +[EFScheduler mainThreadScheduler];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_1000911C0;
  v8[3] = &unk_100605D10;
  objc_copyWeak(&v9, (id *)buf);
  [v4 onScheduler:v7 addFailureBlock:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (id)newBackgroundMonitor
{
  id v3 = [(ConversationViewController *)self messageList];
  if (v3)
  {
    id v4 = [(ConversationViewControllerBase *)self collectionView];
    id v5 = [v4 visibleCells];
    id v6 = [v5 ef_compactMap:&stru_100605D50];

    if ([v6 count])
    {
      id v7 = [MailSceneBackgroundQueryMonitor alloc];
      unsigned __int8 v8 = [(ConversationViewControllerBase *)self scene];
      id v9 = [v8 daemonInterface];
      id v10 = [v9 messageRepository];
      id v11 = [(MailSceneBackgroundQueryMonitor *)v7 initWithMessageListItems:v6 messageList:v3 messageRepository:v10 changeTypes:8];
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

- (void)_updateStickySubjectForItemID:(id)a3 cell:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = +[ConversationViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGRect buf = 138543618;
      id v42 = v8;
      __int16 v43 = 2114;
      id v44 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Will not update sticky subject for itemID:%{public}@ at indexPath:%{public}@", buf, 0x16u);
    }
LABEL_29:

    goto LABEL_30;
  }
  if ([(ConversationViewController *)self _isDisplayingSingleMessage]
    && ([(ConversationViewControllerBase *)self referenceMessageListItem],
        unsigned __int8 v12 = objc_claimAutoreleasedReturnValue(),
        id v13 = [v12 count],
        v12,
        v13 == (id)1))
  {
    [(ConversationViewController *)self setDisplaySubjectItemID:v8];
  }
  else if (!v9 || [v9 expanded])
  {
    id v11 = [(ConversationViewController *)self _indexPathForReferenceMessage];
    unsigned int v14 = [(ConversationViewController *)self displaySubjectItemID];
    if (v14)
    {
    }
    else
    {
      id v15 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      id v16 = [v15 displayMessageItemID];
      unsigned int v17 = [v8 isEqual:v16];

      if (v17)
      {
        [(ConversationViewController *)self setDisplaySubjectItemID:v8];
        [(ConversationViewControllerBase *)self setLastExpandedCellIndexPath:v11];
      }
    }
    double v18 = [(ConversationViewController *)self collectionViewDataSource];
    double v19 = [(ConversationViewController *)self displaySubjectItemID];
    double v20 = [v18 indexPathForItemIdentifier:v19];

    if (v20)
    {
      id v21 = [v9 messageViewController];
      double v22 = [v21 messageContentView];
      double v23 = [v22 headerViewSubjectBlock];

      id v24 = [v10 item];
      if (v24 == [v20 item]
        || (id v25 = [v10 item],
            [(ConversationViewControllerBase *)self lastExpandedCellIndexPath],
            double v26 = objc_claimAutoreleasedReturnValue(),
            id v27 = [v26 item],
            v26,
            v25 == v27))
      {
        id v28 = [v20 copy];
        if (v28)
        {
          id v29 = [v10 item];
          if ((uint64_t)v29 <= (uint64_t)[v28 item])
          {
            if ([v23 isHidden])
            {
              [(ConversationViewController *)self setDisplaySubjectItemID:v8];
              [v23 setHidden:0];
              id v30 = v10;

              double v20 = v30;
            }
          }
        }
        if (([v28 isEqual:v20] & 1) == 0)
        {
          double v31 = [(ConversationViewControllerBase *)self collectionView];
          id v32 = [v31 cellForItemAtIndexPath:v28];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v33 = v32;
            CGFloat v34 = v33;
            if (v33 && [v33 expanded])
            {
              double v39 = [v34 messageViewController];
              CGFloat v38 = [v39 messageContentView];
              double v37 = [v38 headerViewSubjectBlock];
              [v37 setHidden:1];
            }
          }
          double v35 = +[EFScheduler mainThreadScheduler];
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_100091A74;
          v40[3] = &unk_1006047A0;
          void v40[4] = self;
          id v36 = [v35 afterDelay:v40 performBlock:0.1];
        }
      }
      else if (([v23 isHidden] & 1) == 0)
      {
        [v23 setHidden:1];
      }
    }
    goto LABEL_29;
  }
LABEL_30:
}

- (void)_ensureSubjectViewLayoutIfNeededAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewControllerBase *)self collectionView];
  id v6 = [v5 cellForItemAtIndexPath:v4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 expanded])
  {
    id v7 = [(ConversationViewController *)self collectionViewDataSource];
    id v8 = [v7 itemIdentifierForIndexPath:v4];
    [(ConversationViewController *)self _updateStickySubjectForItemID:v8 cell:v6 indexPath:v4];
  }
  v9.receiver = self;
  v9.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v9 _ensureSubjectViewLayoutIfNeededAtIndexPath:v4];
}

- (id)_shouldRecalculateStickySubjectBeforeDeletedItemIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewController *)self displaySubjectItemID];
  if (v5 && [v4 containsObject:v5])
  {
    id v6 = [(ConversationViewController *)self collectionViewDataSource];
    id v7 = [v6 indexPathForItemIdentifier:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_recalculateStickySubjectForDeletedIndexPath:(id)a3
{
  id v4 = [a3 item];
  int64_t v5 = [(ConversationViewController *)self countOfMessages];
  int64_t v6 = v5 - 1;
  if (v5 - 1 >= (uint64_t)v4) {
    uint64_t v7 = (uint64_t)v4;
  }
  else {
    uint64_t v7 = v5 - 1;
  }
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  double v26 = sub_1000750D0;
  id v27 = sub_1000750E0;
  id v28 = 0;
  [(ConversationViewController *)self setDisplaySubjectItemID:0];
  [(ConversationViewControllerBase *)self setLastExpandedCellIndexPath:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100091F4C;
  v22[3] = &unk_100605D78;
  void v22[4] = self;
  v22[5] = &v23;
  id v8 = objc_retainBlock(v22);
  uint64_t v9 = v7;
  do
  {
    char v10 = ((uint64_t (*)(void *, uint64_t))v8[2])(v8, v9);
    if (v6 == v9++) {
      char v12 = 1;
    }
    else {
      char v12 = v10;
    }
  }
  while ((v12 & 1) == 0);
  uint64_t v13 = v24[5];
  if (!v13 && (v7 & 0x8000000000000000) == 0)
  {
    do
    {
      char v14 = ((uint64_t (*)(void *, uint64_t))v8[2])(v8, v7);
      if (v7-- < 1) {
        char v16 = 1;
      }
      else {
        char v16 = v14;
      }
    }
    while ((v16 & 1) == 0);
    uint64_t v13 = v24[5];
  }
  if (v13)
  {
    unsigned int v17 = [(ConversationViewControllerBase *)self collectionView];
    double v18 = [v17 cellForItemAtIndexPath:v24[5]];

    double v19 = [(ConversationViewController *)self collectionViewDataSource];
    double v20 = [v19 itemIdentifierForIndexPath:v24[5]];
    [(ConversationViewController *)self setDisplaySubjectItemID:v20];

    [(ConversationViewControllerBase *)self setLastExpandedCellIndexPath:v24[5]];
    id v21 = [(ConversationViewController *)self displaySubjectItemID];
    [(ConversationViewController *)self _updateStickySubjectForItemID:v21 cell:v18 indexPath:v24[5]];
  }
  _Block_object_dispose(&v23, 8);
}

- (double)stickySubjectViewMaxYForConversationHeaderView:(id)a3
{
  id v4 = [(ConversationViewController *)self collectionViewDataSource];
  int64_t v5 = [(ConversationViewController *)self displaySubjectItemID];
  int64_t v6 = [v4 indexPathForItemIdentifier:v5];

  uint64_t v7 = [(ConversationViewControllerBase *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];

  double v9 = 0.0;
  if (v8 && [v8 expanded])
  {
    [v8 frame];
    double MinY = CGRectGetMinY(v15);
    id v11 = [v8 messageViewController];
    char v12 = [v11 messageContentView];
    uint64_t v13 = [v12 headerViewSubjectBlock];
    [v13 frame];
    double v9 = MinY + 0.0 + CGRectGetMaxY(v16);
  }
  return v9;
}

- (double)stickySubjectViewFirstBaselineForConversationHeaderView:(id)a3
{
  id v4 = [(ConversationViewController *)self collectionViewDataSource];
  int64_t v5 = [(ConversationViewController *)self displaySubjectItemID];
  int64_t v6 = [v4 indexPathForItemIdentifier:v5];

  uint64_t v7 = [(ConversationViewControllerBase *)self collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];

  double v9 = 0.0;
  if (v8 && [v8 expanded])
  {
    [v8 frame];
    double MinY = CGRectGetMinY(v20);
    id v11 = [v8 messageViewController];
    char v12 = [v11 messageContentView];
    uint64_t v13 = [v12 headerViewSubjectBlock];
    [v13 frame];
    double v14 = CGRectGetMinY(v21);
    CGRect v15 = [(ConversationViewControllerBase *)self displayMetrics];
    [v15 firstSeparatorToSubjectBaseline];
    double v17 = v16;

    double v18 = [(ConversationViewController *)self view];
    [v18 bounds];
    double v9 = MinY + v14 + v17 + 0.0 - CGRectGetHeight(v22);
  }
  return v9;
}

- (DraftGestureHelper)draftGestureHelper
{
  id v3 = *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4);
  if (!v3)
  {
    id v4 = [DraftGestureHelper alloc];
    int64_t v5 = [(ConversationViewControllerBase *)self scene];
    int64_t v6 = [(DraftGestureHelper *)v4 initWithConversationViewController:self scene:v5];
    uint64_t v7 = *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4);
    *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4) = v6;

    id v3 = *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4);
  }

  return (DraftGestureHelper *)v3;
}

- (void)_updateGestureForMessageListItem:(id)a3
{
  id v7 = a3;
  id v4 = [v7 mailboxes];
  id v5 = [v4 ef_any:&stru_100605D98];

  if ((v5 & 1) != 0 || *(DraftGestureHelper **)((char *)&self->_draftGestureHelper + 4))
  {
    int64_t v6 = [(ConversationViewController *)self draftGestureHelper];
    [v6 enableGesture:v5];
  }
}

- (id)messageListItemsForDiagnosticsHelper:(id)a3
{
  id v4 = a3;
  if ([v4 source])
  {
    id v5 = +[ConversationViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGRect buf = 134217984;
      id v12 = [v4 source];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not providing diagnostics because source is %lu", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [(ConversationViewController *)self focusedMessage];
    int64_t v6 = +[ConversationViewController log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 ef_publicDescription];
      *(_DWORD *)CGRect buf = 138543618;
      id v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Providing focusedMessage %{public}@ to %@", buf, 0x16u);
    }
    if (v5)
    {
      char v10 = v5;
      id v8 = +[NSArray arrayWithObjects:&v10 count:1];
      goto LABEL_9;
    }
  }
  id v8 = 0;
LABEL_9:

  return v8;
}

- (void)find:(id)a3
{
  sub_100095E2C((uint64_t)self);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 presentFindNavigatorShowingReplace:0];
}

- (void)clearAllDecoratedFoundText
{
  id v2 = [(ConversationViewControllerBase *)self cellConfigurator];
  [v2 enumerateExpandedCellsWithBlock:&stru_100605DD8];
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  if (([(id)objc_opt_class() conformsToProtocol:&OBJC_PROTOCOL___EMCollectionItemID] & 1) == 0)
  {
    double v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:5559 description:@"Expected an EMCollectionItemID"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CGRect v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, self, @"ConversationViewController.m", 5560, @"Expected ConversationSearchTextRange, got %@", objc_opt_class() object file lineNumber description];
  }
  id v21 = v9;
  if (a5 == 2)
  {
    id v11 = sub_1000A0C30((uint64_t)self);
    sub_10006A418((uint64_t)v11, v21);
  }
  id v12 = [(ConversationViewController *)self collectionViewDataSource];
  __int16 v13 = [v12 indexPathForItemIdentifier:v10];

  id v14 = [(ConversationViewControllerBase *)self collectionView];
  CGRect v15 = [v14 cellForItemAtIndexPath:v13];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v16 = [v15 messageViewController];
    double v17 = [v16 messageContentView];

    [v17 didBeginTextSearch];
    double v18 = sub_10006C740((uint64_t)v21);
    [v17 showSearchResultsAtRange:v18 usingStyle:a5];
  }
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000A0C30((uint64_t)self);
  id v12 = sub_10006BE1C(v11, v8, v9);

  return (int64_t)v12;
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[ConversationViewController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Beginning search with string %@, options: %@, aggregator: %@", (uint8_t *)&v13, 0x20u);
  }

  [(ConversationViewController *)self setSearchAggregator:v10];
  id v12 = sub_1000A0C30((uint64_t)self);
  sub_100069AF4(v12, v8, v9, v10);

  sub_100092CE4(self, 1);
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (BOOL)shouldBeginTextSearchOperation
{
  if (qword_100699410 != -1) {
    dispatch_once(&qword_100699410, &stru_100605DF8);
  }
  return byte_100699408;
}

- (void)didBeginTextSearchOperation
{
  id v3 = +[ConversationViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ConversationViewController didBeginTextSearchOperation]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(ConversationViewControllerBase *)self _messageSearchBegan];
}

- (void)didEndTextSearchOperation
{
}

- (int64_t)compareOrderFromDocument:(id)a3 toDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  id v10 = [(ConversationViewController *)self collectionViewDataSource];
  id v11 = [v10 indexPathForItemIdentifier:v8];
  id v12 = [v10 indexPathForItemIdentifier:v9];
  id v13 = [v11 compare:v12];

  return (int64_t)v13;
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[ConversationViewController log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGRect buf = 136315650;
    double v26 = "-[ConversationViewController scrollRangeToVisible:inDocument:]";
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: range: %@, document: %@", buf, 0x20u);
  }

  id v10 = v8;
  if (([(id)objc_opt_class() conformsToProtocol:&OBJC_PROTOCOL___EMCollectionItemID] & 1) == 0)
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ConversationViewController.m" lineNumber:5643 description:@"Expected an EMCollectionItemID"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"ConversationViewController.m", 5644, @"Expected ConversationSearchTextRange, got %@", objc_opt_class() object file lineNumber description];
  }
  id v11 = v7;
  id v12 = sub_1000773D0(self, v10);
  id v13 = v12;
  if (v12)
  {
    id v14 = [v12 messageViewController];
    __int16 v15 = [v14 messageContentView];

    id v16 = sub_10006C740((uint64_t)v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_100093380;
    void v20[3] = &unk_100605E20;
    id v21 = v11;
    id v22 = v10;
    uint64_t v23 = self;
    id v17 = v15;
    id v24 = v17;
    [v17 requestRectForFoundTextRange:v16 completionHandler:v20];
  }
  else
  {
    [(ConversationViewController *)self scrollToMessageItemIDIfPossible:v10 animated:1 pin:0];
  }
}

- (void)findNext:(id)a3
{
  id v3 = +[ConversationViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ConversationViewController findNext:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)findPrevious:(id)a3
{
  id v3 = +[ConversationViewController log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[ConversationViewController findPrevious:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_messageSearchEnded
{
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewController;
  [(ConversationViewControllerBase *)&v4 _messageSearchEnded];
  id v3 = [(ConversationViewController *)self searchAggregator];
  [v3 invalidate];

  [(ConversationViewController *)self setSearchAggregator:0];
  sub_100092CE4(self, 0);
}

- (void)_decorateFoundRanges:(id)a3 inExpandedCell:(id)a4
{
  id v18 = a3;
  id v6 = [a4 messageViewController];
  id v7 = [v6 messageContentView];

  CGRect v20 = v7;
  [v7 didBeginTextSearch];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v18;
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v12 = sub_1000A0C30((uint64_t)self);
        id v13 = sub_10006C420((uint64_t)v12);
        if (v13)
        {
          id v14 = sub_1000A0C30((uint64_t)self);
          __int16 v15 = sub_10006C420((uint64_t)v14);
          unsigned int v16 = [v11 isEqual:v15];

          if (v16)
          {
            id v17 = sub_10006C740((uint64_t)v11);
            [v20 showSearchResultsAtRange:v17 usingStyle:2];
            goto LABEL_11;
          }
        }
        else
        {
        }
        id v17 = sub_10006C740((uint64_t)v11);
        [v20 showSearchResultsAtRange:v17 usingStyle:1];
LABEL_11:
      }
      id v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)_stopTextFindingIfNecessary
{
  id v3 = sub_1000A0C30((uint64_t)self);

  if (v3)
  {
    [(ConversationViewController *)self _messageSearchEnded];
  }
}

- (id)conversationSearchMessageListForConversationSearchHandler:(id)a3
{
  id v3 = [(ConversationViewController *)self messageList];

  return v3;
}

- (id)conversationSearchHandler:(id)a3 contentRepresentationRequestForItemID:(id)a4
{
  objc_super v4 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:a4];

  return v4;
}

- (BOOL)conversationSearchHandler:(id)a3 shouldConsiderQuotedContentForItemID:(id)a4
{
  id v5 = a4;
  id v6 = [(ConversationViewController *)self collectionViewDataSource];
  id v7 = [v6 indexPathForItemIdentifier:v5];

  LOBYTE(self) = ![(ConversationViewController *)self _shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:v7];
  return (char)self;
}

- (void)bannerViewDidSelectEditButton:(id)a3 itemID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ConversationViewController *)self _contentRequestForMessageWithItemID:v7];
  id v9 = [v6 type];
  if (!v9)
  {
    long long v21 = [v8 message];
    id v11 = +[MFDatePickerViewController datePickerViewControllerWithType:0 message:v21];

    [v11 setDelegate:self];
    id v22 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v11];
    [v22 setModalPresentationStyle:7];
    long long v23 = [v6 editButton];
    long long v24 = [v22 popoverPresentationController];
    [v23 mui_setAsSourceForPopoverPresentationController:v24];

    [(ConversationViewControllerBase *)self presentViewController:v22 animated:1 completion:0];
    goto LABEL_7;
  }
  if (v9 == (id)1)
  {
    __int16 v15 = [v8 message];
    id v30 = v15;
    unsigned int v16 = +[NSArray arrayWithObjects:&v30 count:1];
    id v17 = [(ConversationViewController *)self undoManager];
    id v18 = +[MFReadLaterTriageInteraction interactionWithMessageListItems:v16 undoManager:v17 origin:3 actor:2];

    [v18 setDelegate:self];
    double v19 = [v6 editButton];
    [v18 setPresentationSource:v19];

    [v18 setDatePickerPresentationStyle:7];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    int v25[2] = sub_100094080;
    v25[3] = &unk_100605168;
    objc_copyWeak(&v28, &location);
    id v20 = v18;
    id v26 = v20;
    id v27 = v8;
    [v20 performInteractionWithCompletion:v25];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  else if (v9 == (id)2)
  {
    id v10 = [(ConversationViewControllerBase *)self scene];
    id v11 = +[MFMessageCompositionTriageInteraction interactionWithContentRequest:v8 scene:v10];

    id v12 = [v8 message];
    id v13 = [v12 mailboxes];
    [v11 setMessageSourceMailboxes:v13];

    [v11 setShouldPromptToLoadRestOfMessage:0];
    [v11 setDelegate:self];
    id v14 = [v6 editButton];
    [v11 setPresentationSource:v14];

    [v11 performInteraction];
LABEL_7:
  }
}

- (id)conversationAttachmentURLsForConversationItemHeaderBlock:(id)a3
{
  +[EFPromise promise];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100094334;
  v7[3] = &unk_100605EA8;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  [(ConversationViewController *)self _fetchConversationAttachmentDataWithCompletion:v7];
  id v5 = [v4 future];

  return v5;
}

- (id)richLinksInConversationForConversationItemHeaderBlock:(id)a3
{
  +[EFPromise promise];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100094424;
  v7[3] = &unk_100605EA8;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  [(ConversationViewController *)self _fetchConversationRichLinkDataWithCompletion:v7];
  id v5 = [v4 future];

  return v5;
}

- (void)summaryCell:(id)a3 withItemID:(id)a4 didLayoutWithHeight:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  [v8 bounds];
  double v11 = v10;
  id v12 = [(ConversationViewControllerBase *)self cellConfigurator];
  id v13 = [v12 sizeTracker];
  [v13 intrinsicSizeForCellWithItemID:v9];
  double v15 = v14;
  double v17 = v16;

  if (v15 != v11 || v17 != a5)
  {
    id v20 = v9;
    double v21 = v15;
    double v22 = v17;
    double v23 = v11;
    double v24 = a5;
    id v18 = +[EFScheduler mainThreadScheduler];
    [v18 performBlock:&v19];
  }
}

- (void)summaryCell:(id)a3 withItemID:(id)a4 wantsToDisplayAlert:(id)a5
{
}

- (void)_generativeModelsAvailabilityDidChange:(id)a3
{
  [(ConversationViewController *)self _resetManualSummaryItemIDs];

  [(ConversationViewController *)self _reloadDataSource];
}

- (void)setMessageTriageInteractionHelper:(id)a3
{
}

- (ConversationViewControllerSelectionDataSource)selectionDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_selectionDataSource + 4));

  return (ConversationViewControllerSelectionDataSource *)WeakRetained;
}

- (void)setSelectionDataSource:(id)a3
{
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  return *(EMDiagnosticsHelper **)((char *)&self->_diagnosticsHelper + 4);
}

- (EMMessageRepository)messageRepository
{
  return *(EMMessageRepository **)((char *)&self->_messageRepository + 4);
}

- (void)setMessageRepository:(id)a3
{
}

- (EMMailboxRepository)mailboxRepository
{
  return *(EMMailboxRepository **)((char *)&self->_mailboxRepository + 4);
}

- (void)setMailboxRepository:(id)a3
{
}

- (EMMessageList)referenceMessageList
{
  return *(EMMessageList **)((char *)&self->_referenceMessageList + 4);
}

- (void)setReferenceMessageList:(id)a3
{
}

- (EMMessageList)messageList
{
  return *(EMMessageList **)((char *)&self->_messageList + 4);
}

- (void)setMessageList:(id)a3
{
}

- (MessageListCollectionHelper)messageListCollectionHelper
{
  return *(MessageListCollectionHelper **)((char *)&self->_messageListCollectionHelper + 4);
}

- (void)setMessageListCollectionHelper:(id)a3
{
}

- (BOOL)isSwappingMessageList
{
  return self->_swappingMessageList;
}

- (void)setSwappingMessageList:(BOOL)a3
{
  self->_swappingMessageList = a3;
}

- (BOOL)nextUpdateShouldAvoidAnimation
{
  return self->_nextUpdateShouldAvoidAnimation;
}

- (void)setNextUpdateShouldAvoidAnimation:(BOOL)a3
{
  self->_nextUpdateShouldAvoidAnimation = a3;
}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (EFLRUCache)contentRequestCache
{
  return *(EFLRUCache **)((char *)&self->_contentRequestCache + 4);
}

- (void)setContentRequestCache:(id)a3
{
}

- (MFPriorityLoadingQueue)contentRequestQueue
{
  return *(MFPriorityLoadingQueue **)((char *)&self->_contentRequestQueue + 4);
}

- (void)setContentRequestQueue:(id)a3
{
}

- (EFCancelationToken)contentItemsCancelable
{
  return *(EFCancelationToken **)((char *)&self->_contentItemsCancelable + 4);
}

- (void)setContentItemsCancelable:(id)a3
{
}

- (NSMapTable)delayedReadCancelables
{
  return *(NSMapTable **)((char *)&self->_delayedReadCancelables + 4);
}

- (void)setDelayedReadCancelables:(id)a3
{
}

- (NSMutableSet)disabledMarkAsReadMessageItemIDs
{
  return *(NSMutableSet **)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4);
}

- (void)setDisabledMarkAsReadMessageItemIDs:(id)a3
{
}

- (NSMutableSet)expandedContentItemIDs
{
  return *(NSMutableSet **)((char *)&self->_expandedContentItemIDs + 4);
}

- (void)setExpandedContentItemIDs:(id)a3
{
}

- (MFTransferSplitViewController)transferController
{
  return *(MFTransferSplitViewController **)((char *)&self->_transferController + 4);
}

- (void)setTransferController:(id)a3
{
}

- (EMMessage)selectedMessage
{
  return *(EMMessage **)((char *)&self->_selectedMessage + 4);
}

- (void)setSelectedMessage:(id)a3
{
}

- (EFFuture)predictedMailboxForConversation
{
  return *(EFFuture **)((char *)&self->_predictedMailboxForConversation + 4);
}

- (void)setPredictedMailboxForConversation:(id)a3
{
}

- (NSMutableSet)initiallyUnreadItemIDs
{
  return *(NSMutableSet **)((char *)&self->_initiallyUnreadItemIDs + 4);
}

- (void)setInitiallyUnreadItemIDs:(id)a3
{
}

- (EMCollectionItemID)displaySubjectItemID
{
  return *(EMCollectionItemID **)((char *)&self->_displaySubjectItemID + 4);
}

- (void)setDisplaySubjectItemID:(id)a3
{
}

- (void)setDraftGestureHelper:(id)a3
{
}

- (void)setPinnedIndexPathProvider:(id)a3
{
}

- (EFScheduler)mailboxPredictionScheduler
{
  return *(EFScheduler **)((char *)&self->_mailboxPredictionScheduler + 4);
}

- (void)setMailboxPredictionScheduler:(id)a3
{
}

- (EFScheduler)messageLoadingScheduler
{
  return *(EFScheduler **)((char *)&self->_messageLoadingScheduler + 4);
}

- (void)setMessageLoadingScheduler:(id)a3
{
}

- (EFCancelable)blankConversationTailspinToken
{
  return *(EFCancelable **)((char *)&self->_blankConversationTailspinToken + 4);
}

- (void)setBlankConversationTailspinToken:(id)a3
{
}

- (_UITextSearchAggregator)searchAggregator
{
  return *(_UITextSearchAggregator **)((char *)&self->_searchAggregator + 4);
}

- (void)setSearchAggregator:(id)a3
{
}

- (EFCancelable)userDefaultsObserver
{
  return *(EFCancelable **)((char *)&self->_userDefaultsObserver + 4);
}

- (void)setUserDefaultsObserver:(id)a3
{
}

- (BOOL)didAutoReloadDataSource
{
  return self->_didAutoReloadDataSource;
}

- (void)setDidAutoReloadDataSource:(BOOL)a3
{
  self->_didAutoReloadDataSource = a3;
}

- (MFMailComposeController)quickReplyMailComposeController
{
  return *(MFMailComposeController **)((char *)&self->_quickReplyMailComposeController + 4);
}

- (void)setQuickReplyMailComposeController:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)quickReplyHeaderSupplementaryRegistration
{
  return *(UICollectionViewSupplementaryRegistration **)((char *)&self->_quickReplyHeaderSupplementaryRegistration + 4);
}

- (void)setQuickReplyHeaderSupplementaryRegistration:(id)a3
{
}

- (UICollectionViewSupplementaryRegistration)quickReplyFooterSupplementaryRegistration
{
  return *(UICollectionViewSupplementaryRegistration **)((char *)&self->_quickReplyFooterSupplementaryRegistration + 4);
}

- (void)setQuickReplyFooterSupplementaryRegistration:(id)a3
{
}

- (BOOL)quickReplyHasContent
{
  return self->_quickReplyHasContent;
}

- (void)setQuickReplyHasContent:(BOOL)a3
{
  self->_quickReplyHasContent = a3;
}

- (MFGeneratedSummaryCollectionItemID)topSummaryItemID
{
  return *(MFGeneratedSummaryCollectionItemID **)((char *)&self->_topSummaryItemID + 4);
}

- (void)setTopSummaryItemID:(id)a3
{
}

- (MFGeneratedSummaryCollectionItemID)inlineSummaryItemID
{
  return *(MFGeneratedSummaryCollectionItemID **)((char *)&self->_inlineSummaryItemID + 4);
}

- (void)setInlineSummaryItemID:(id)a3
{
}

- (MFGeneratedSummaryCollectionItemID)previousTopSummaryItemID
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_previousTopSummaryItemID + 4));

  return (MFGeneratedSummaryCollectionItemID *)WeakRetained;
}

- (void)setPreviousTopSummaryItemID:(id)a3
{
}

- (MFGeneratedSummaryCollectionItemID)previousInlineSummaryItemID
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_previousInlineSummaryItemID + 4));

  return (MFGeneratedSummaryCollectionItemID *)WeakRetained;
}

- (void)setPreviousInlineSummaryItemID:(id)a3
{
}

- (NSMutableDictionary)summaryContextByItemID
{
  return *(NSMutableDictionary **)((char *)&self->_summaryContextByItemID + 4);
}

- (void)setSummaryContextByItemID:(id)a3
{
}

- (NSDate)lastSeenDate
{
  return (NSDate *)objc_getProperty(self, a2, 780, 1);
}

- (void)setLastSeenDate:(id)a3
{
}

- (NSDate)lastSeenDisplayDate
{
  return (NSDate *)objc_getProperty(self, a2, 788, 1);
}

- (void)setLastSeenDisplayDate:(id)a3
{
}

- (EFCancelable)groupedSenderUnreadCountToken
{
  return *(EFCancelable **)((char *)&self->_groupedSenderUnreadCountToken + 4);
}

- (void)setGroupedSenderUnreadCountToken:(id)a3
{
}

- (unint64_t)groupedSenderUnreadCount
{
  return *(unint64_t *)((char *)&self->_groupedSenderUnreadCount + 4);
}

- (void)setGroupedSenderUnreadCount:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_groupedSenderUnreadCount + 4) = a3;
}

- (EMQuery)groupedSenderUnreadCountQuery
{
  return *(EMQuery **)((char *)&self->_groupedSenderUnreadCountQuery + 4);
}

- (void)setGroupedSenderUnreadCountQuery:(id)a3
{
}

- (EFCancelable)totalUnfilteredMessageCountToken
{
  return *(EFCancelable **)((char *)&self->_totalUnfilteredMessageCountToken + 4);
}

- (void)setTotalUnfilteredMessageCountToken:(id)a3
{
}

- (EMQuery)totalUnfilteredMessageCountQuery
{
  return *(EMQuery **)((char *)&self->_totalUnfilteredMessageCountQuery + 4);
}

- (void)setTotalUnfilteredMessageCountQuery:(id)a3
{
}

- (NSPredicate)categoryPredicate
{
  return *(NSPredicate **)((char *)&self->_categoryPredicate + 4);
}

- (void)setCategoryPredicate:(id)a3
{
}

- (BOOL)isPerformingDataSourceUpdate
{
  return self->_isPerformingDataSourceUpdate;
}

- (void)setIsPerformingDataSourceUpdate:(BOOL)a3
{
  self->_isPerformingDataSourceUpdate = a3;
}

- (_TtC10MobileMail25MFTimeSensitiveBannerView)timeSensitiveBannerView
{
  return *(_TtC10MobileMail25MFTimeSensitiveBannerView **)((char *)&self->_timeSensitiveBannerView + 4);
}

- (void)setTimeSensitiveBannerView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_timeSensitiveBannerView + 4), 0);
  objc_storeStrong((id *)((char *)&self->_categoryPredicate + 4), 0);
  objc_storeStrong((id *)((char *)&self->_totalUnfilteredMessageCountQuery + 4), 0);
  objc_storeStrong((id *)((char *)&self->_totalUnfilteredMessageCountToken + 4), 0);
  objc_storeStrong((id *)((char *)&self->_groupedSenderUnreadCountQuery + 4), 0);
  objc_storeStrong((id *)((char *)&self->_groupedSenderUnreadCountToken + 4), 0);
  objc_storeStrong((id *)((char *)&self->_lastSeenDisplayDate + 4), 0);
  objc_storeStrong((id *)((char *)&self->_lastSeenDate + 4), 0);
  objc_storeStrong((id *)((char *)&self->_summaryContextByItemID + 4), 0);
  objc_destroyWeak((id *)((char *)&self->_previousInlineSummaryItemID + 4));
  objc_destroyWeak((id *)((char *)&self->_previousTopSummaryItemID + 4));
  objc_storeStrong((id *)((char *)&self->_inlineSummaryItemID + 4), 0);
  objc_storeStrong((id *)((char *)&self->_topSummaryItemID + 4), 0);
  objc_storeStrong((id *)((char *)&self->_diagnosticsHelperToken + 4), 0);
  objc_storeStrong((id *)((char *)&self->_quickReplyFooterSupplementaryRegistration + 4), 0);
  objc_storeStrong((id *)((char *)&self->_quickReplyHeaderSupplementaryRegistration + 4), 0);
  objc_storeStrong((id *)((char *)&self->_quickReplyMailComposeController + 4), 0);
  objc_storeStrong((id *)((char *)&self->_userDefaultsObserver + 4), 0);
  objc_storeStrong((id *)((char *)&self->_searchAggregator + 4), 0);
  objc_storeStrong((id *)((char *)&self->_blankConversationTailspinToken + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageLoadingScheduler + 4), 0);
  objc_storeStrong((id *)((char *)&self->_mailboxPredictionScheduler + 4), 0);
  objc_storeStrong((id *)((char *)&self->_pinnedIndexPathProvider + 4), 0);
  objc_storeStrong((id *)((char *)&self->_draftGestureHelper + 4), 0);
  objc_storeStrong((id *)((char *)&self->_displaySubjectItemID + 4), 0);
  objc_storeStrong((id *)((char *)&self->_initiallyUnreadItemIDs + 4), 0);
  objc_storeStrong((id *)((char *)&self->_predictedMailboxForConversation + 4), 0);
  objc_storeStrong((id *)((char *)&self->_selectedMessage + 4), 0);
  objc_storeStrong((id *)((char *)&self->_transferController + 4), 0);
  objc_storeStrong((id *)((char *)&self->_expandedContentItemIDs + 4), 0);
  objc_storeStrong((id *)((char *)&self->_disabledMarkAsReadMessageItemIDs + 4), 0);
  objc_storeStrong((id *)((char *)&self->_delayedReadCancelables + 4), 0);
  objc_storeStrong((id *)((char *)&self->_contentItemsCancelable + 4), 0);
  objc_storeStrong((id *)((char *)&self->_contentRequestQueue + 4), 0);
  objc_storeStrong((id *)((char *)&self->_collectionViewDataSource + 4), 0);
  objc_storeStrong((id *)((char *)&self->_contentRequestCache + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageListCollectionHelper + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageList + 4), 0);
  objc_storeStrong((id *)((char *)&self->_referenceMessageList + 4), 0);
  objc_storeStrong((id *)((char *)&self->_mailboxRepository + 4), 0);
  objc_storeStrong((id *)((char *)&self->_messageRepository + 4), 0);
  objc_storeStrong((id *)((char *)&self->_diagnosticsHelper + 4), 0);
  objc_destroyWeak((id *)((char *)&self->_selectionDataSource + 4));

  objc_storeStrong((id *)((char *)&self->_messageTriageInteractionHelper + 4), 0);
}

@end