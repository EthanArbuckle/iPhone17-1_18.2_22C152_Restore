@interface ConversationViewControllerBase
+ (id)log;
- (BOOL)_canBrowseInDirection:(int)a3;
- (BOOL)_executeIfSplitViewIsAvailable:(id)a3;
- (BOOL)_isConversationViewShortcut:(SEL)a3;
- (BOOL)_isDisplayingSingleMessage;
- (BOOL)_isItemInitiallyUnreadAtIndexPath:(id)a3;
- (BOOL)_isQuickReplyMessageAtIndexPath:(id)a3;
- (BOOL)_isUndoSendMessageAtIndexPath:(id)a3;
- (BOOL)_scrollViewIsScrolledToEnd:(id)a3;
- (BOOL)_shouldArchiveByDefault;
- (BOOL)_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:(id)a3;
- (BOOL)_shouldHideStickyFooterViewForTraitCollection:(id)a3;
- (BOOL)_shouldShowArrowsForDisplayMode:(int64_t)a3 collapsed:(BOOL)a4 withTraitCollection:(id)a5;
- (BOOL)_shouldShowConversationHeader;
- (BOOL)_shouldUseDesktopClassNavigationBarForTraitCollection:(id)a3;
- (BOOL)allowQuickReply;
- (BOOL)beingPreviewed;
- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)conversationSearchHandler:(id)a3 shouldConsiderQuotedContentForItemID:(id)a4;
- (BOOL)didCompleteFirstPaint;
- (BOOL)didNotifyExtendedLaunchTracker;
- (BOOL)disableScrollPinning;
- (BOOL)forceCollapsedSenderHeader;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isBucketSelected;
- (BOOL)isFullyVisible;
- (BOOL)isMessageListUnfiltered;
- (BOOL)isPerformingQuickReplySendAnimation;
- (BOOL)isPrimary;
- (BOOL)isShowingGroupedSenderMessageList;
- (BOOL)isSplitViewAvailable;
- (BOOL)isStandalone;
- (BOOL)isToolbarHidden;
- (BOOL)messagesShowSourceMailbox;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldAddDoneButtonForConversationNavigationBarItemsManager:(id)a3;
- (BOOL)shouldHideStickyFooterView;
- (BOOL)shouldShowExpandableDigestHeaderView;
- (BOOL)shouldShowNoMessageSelectedView;
- (BOOL)shouldShowStaticDigestHeaderView;
- (BOOL)shownAsConversation;
- (BOOL)wantsBarHidingWhenVerticallyCompact;
- (BlankConversationController)blankConversationController;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (CGPoint)initialScrollOffset;
- (CGPoint)layoutInvalidationContentOffset;
- (CGRect)_defaultSourceRectForView:(id)a3;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)defaultCellSizeForTracker:(id)a3;
- (ComposeCapable)scene;
- (ConversationHeaderView)conversationHeaderView;
- (ConversationViewControllerBase)initWithScene:(id)a3 contactStore:(id)a4 avatarGenerator:(id)a5;
- (ConversationViewControllerBaseDelegate)delegate;
- (ECSubject)conversationSubject;
- (EFCancelable)forceCollapsedSenderHeaderToken;
- (EFFuture)restorationFuture;
- (EFLocked)quickReplyAnimationContext;
- (EMCachingContactStore)contactStore;
- (EMCollectionItemID)targetMessageItemIDForBarButtonTriage;
- (EMMailboxRepository)mailboxRepository;
- (EMMessageListItem)focusedMessage;
- (EMMessageListItem)referenceMessageListItem;
- (EMMessageListItem)targetMessageForBarButtonTriage;
- (MFArrowControlsView)arrowControlsView;
- (MFCollectionViewPagingAnimator)pagingAnimator;
- (MFConversationAssistantContextProvider)assistantContextProvider;
- (MFConversationCellConfigurator)cellConfigurator;
- (MFConversationCellExpansionGestureRecognizer)cellExpansionRecognizer;
- (MFConversationCurrentVisibleMessageStrategy)currentVisibleMessageStrategy;
- (MFConversationHandoffCoordinator)handoffCoordinator;
- (MFConversationPreviewState)previewState;
- (MFMessageDisplayMetrics)displayMetrics;
- (MFMessageViewControllerReuseQueue)messageViewControllerReuseQueue;
- (MFSwipableCollectionViewLayout)conversationLayout;
- (MFTextSelectionScrollHandler)textSelectionScrollHandler;
- (MUIAvatarImageGenerator)avatarGenerator;
- (NSArray)defaultBarButtons;
- (NSArray)resizingContentViews;
- (NSDirectionalEdgeInsets)layoutMarginsForCollectionViewFrame:(CGRect)a3;
- (NSIndexPath)lastExpandedCellIndexPath;
- (NSIndexPath)removedSingleMessageIndexPath;
- (NSLayoutConstraint)senderHeaderLayoutGuideLeadingConstraint;
- (NSLayoutConstraint)senderHeaderLayoutGuideTopConstraint;
- (NSLayoutConstraint)senderHeaderLayoutGuideTrailingConstraint;
- (NSMutableDictionary)cellHeightCache;
- (PinnedConversationItem)pinnedItem;
- (UIBarButtonItem)doneButton;
- (UICollectionView)collectionView;
- (UIEdgeInsets)_calculateCollectionViewInsets;
- (UILayoutGuide)senderHeaderLayoutGuide;
- (_TtC10MobileMail34StaticConversationSenderHeaderView)staticSenderHeaderView;
- (_TtC10MobileMail36ConversationSenderHeaderViewAnimator)senderHeaderViewAnimator;
- (_TtC10MobileMail37ConversationNavigationBarItemsManager)barItemsManager;
- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)expandableSenderHeaderView;
- (_UINavigationBarTitleView)tapGestureTitleView;
- (double)_autoscrollAdjustmentWithBaseOffset:(double)a3;
- (double)_expectedCellWidth;
- (double)_itemSpacing;
- (double)_minimumItemHeight;
- (double)_navigationBarHeight;
- (double)_quickReplyHorizontalPadding;
- (double)defaultSemiExpandedHeightForTracker:(id)a3;
- (double)horizontalPadding;
- (double)nextAvailableLoadMoreInterval;
- (double)quickReplyHeight;
- (double)quickReplyHeightForTracker:(id)a3;
- (double)stickySubjectViewFirstBaselineForConversationHeaderView:(id)a3;
- (double)stickySubjectViewMaxYForConversationHeaderView:(id)a3;
- (double)widthForConversationViewCellsForConversationSearchHandler:(id)a3;
- (id)_currentSizeMetadataKey;
- (id)_currentlyVisibleIndexPath;
- (id)_defaultBarButtonItems;
- (id)_defaultBarButtonsWithFlexibleSpacing:(BOOL)a3 reverseOrder:(BOOL)a4;
- (id)_dragItemsForItemAtIndexPath:(id)a3;
- (id)_fixedSpaceBarButton;
- (id)_flexibleSpaceBarButton;
- (id)_indexPathForReferenceMessage;
- (id)_indexPathForTopMostVisibleRow;
- (id)_indexPathOfMessageViewControllerMessage:(id)a3;
- (id)_layoutAttributesForItemAtIndexPath:(id)a3;
- (id)_messageItemIDAtIndexPath:(id)a3;
- (id)_messagesForTriageInteraction:(id)a3;
- (id)_nextIndexPathToSelectFromIndexPath:(id)a3 withDirection:(int)a4;
- (id)_nextMessageIndexWithDirection:(int)a3;
- (id)_oldestIndexPath;
- (id)_persistentIDForEMMessageObjectID:(id)a3;
- (id)_previewActionForTriageAction:(int64_t)a3 forSwipe:(BOOL)a4;
- (id)_previewActionsForTriageActions:(id)a3 excludingActions:(id)a4;
- (id)_quickReplyView;
- (id)_visibleIndexPathForMessageViewController:(id)a3;
- (id)_visibleNavigationBar;
- (id)archiveButtonItem;
- (id)cellConfigurator:(id)a3 messageItemIDAtIndexPath:(id)a4;
- (id)cellConfigurator:(id)a3 targetHeightForExpandingCellAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)contentUnavailableConfigurationState;
- (id)conversationSearchHandler:(id)a3 contentRepresentationRequestForItemID:(id)a4;
- (id)conversationSearchMessageListForConversationSearchHandler:(id)a3;
- (id)deleteButtonItem;
- (id)deleteButtonMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4;
- (id)groupedSenderActionMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4;
- (id)hostScrollViewForConversationHeaderView:(id)a3;
- (id)indexSetForRowsFromIndexPaths:(id)a3 section:(int64_t)a4;
- (id)layoutInformationForConversationSenderHeaderViewAnimator:(id)a3;
- (id)leadingPreviewAction;
- (id)messageDisplayMetricsForTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4;
- (id)messageViewController:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5;
- (id)mf_preferredTitle;
- (id)moveButtonItem;
- (id)passthroughViews;
- (id)previewActionItems;
- (id)replyButtonItem;
- (id)supplementaryButtonItemForConversationNavigationBarItemsManager:(id)a3;
- (id)trailingPreviewAction;
- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3;
- (id)viewForKeyboardAvoidance:(id)a3;
- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5;
- (int64_t)_dataOwnerForDragSessionAtIndexPath:(id)a3;
- (int64_t)_headerDisplayOptionsForCell:(id)a3 displayedAsSingleMessage:(BOOL)a4;
- (int64_t)cellConfigurator:(id)a3 expansionStatusForMessageAtIndexPath:(id)a4;
- (int64_t)conversationViewCellSizeTracker:(id)a3 expansionStatusForMessageWithItemID:(id)a4;
- (int64_t)countOfMessages;
- (int64_t)countOfSummaries;
- (int64_t)initialSenderHeaderExpansionStatus;
- (int64_t)resizingState;
- (int64_t)totalUnfilteredMessageCount;
- (unint64_t)_currentConversationSortOrderPreference;
- (unint64_t)conversationSortOrder;
- (void)_adjustForKeyboardAvoidanceOverlap:(double)a3;
- (void)_animateWithKeyboard:(id)a3 animations:(id)a4;
- (void)_attemptLoadMissingMessages;
- (void)_beginResizingConversationView:(CGSize)a3;
- (void)_configureSenderHeaderView:(id)a3 expansionStatus:(int64_t)a4;
- (void)_dismissPopover;
- (void)_doSetShouldShowNoMessageSelectedView:(BOOL)a3;
- (void)_endEditingAnimated:(BOOL)a3;
- (void)_endResizingConversationView;
- (void)_enqueueMessageViewController:(id)a3;
- (void)_ensureSubjectViewLayoutIfNeededAtIndexPath:(id)a3;
- (void)_enumerateExpandedCellMessageContentViewsWithBlock:(id)a3;
- (void)_expansionRecognizerDidRecognize:(id)a3;
- (void)_hideRemovedSingleMessageCellIfInRemovedIndexPaths:(id)a3;
- (void)_invalidateQuickReplyFooter;
- (void)_maybeAttemptLoadMissingMessages:(id)a3;
- (void)_messageSearchBegan;
- (void)_messageSearchEnded;
- (void)_navigateToMessageInDirection:(int)a3;
- (void)_notifyDelegateWillRemoveAllVisibleMessagesForTriageInteraction:(id)a3;
- (void)_pageDownCommandInvoked:(id)a3;
- (void)_pageUpCommandInvoked:(id)a3;
- (void)_reloadCellsAtIndexPaths:(id)a3 animated:(BOOL)a4;
- (void)_reloadDataSource;
- (void)_reloadPreparedCells;
- (void)_removeNavigationBarFromSelf;
- (void)_resetBottomPaddingIfDisplayingSingleMessage;
- (void)_restorePinnedScrollPosition;
- (void)_sceneDidActivate:(id)a3;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_scrollToItemAtIndexPath:(id)a3 dynamicOffset:(id)a4 shouldAdjustToShowPreviousMessage:(BOOL)a5 animated:(BOOL)a6 pin:(BOOL)a7 completion:(id)a8;
- (void)_selectNextMessageCommandInvoked:(id)a3;
- (void)_selectPreviousMessageCommandInvoked:(id)a3;
- (void)_setBottomPadding:(double)a3;
- (void)_setNavigationBarTitleViewNeedsLayout;
- (void)_showModalViewController:(id)a3 fromView:(id)a4 sourceRect:(CGRect)a5 animated:(BOOL)a6;
- (void)_showSingleMessage:(id)a3 animationOffset:(CGPoint)a4 initialScrollOffset:(CGPoint)a5;
- (void)_shrinkBottomPaddingIfNecessary;
- (void)_shrinkMessagesToBarButton:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5;
- (void)_shrinkMessagesToView:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5;
- (void)_splitViewStateChanged:(id)a3;
- (void)_testDeleteSelectedMessage;
- (void)_testReplyForSelectedMessage;
- (void)_toggleCellGroupOpacityIfNeeded:(id)a3 displaying:(BOOL)a4;
- (void)_toggleCellsGroupOpacityDuringRotationWithCoordinator:(id)a3;
- (void)_updateAllowQuickReplyForMessageListItem:(id)a3;
- (void)_updateBarButtonsAnimated:(BOOL)a3 force:(BOOL)a4;
- (void)_updateBarButtonsAnimated:(BOOL)a3 force:(BOOL)a4 isShowingTitle:(BOOL)a5;
- (void)_updateBarButtonsAnimated:(BOOL)a3 withDisplayMode:(int64_t)a4 isCollapsed:(BOOL)a5 isShowingTitle:(BOOL)a6;
- (void)_updateBarButtonsAnimated:(BOOL)a3 withDisplayMode:(int64_t)a4 withTraitCollection:(id)a5 collapsed:(BOOL)a6 force:(BOOL)a7 isShowingTitle:(BOOL)a8;
- (void)_updateBottomPadding;
- (void)_updateBottomPaddingWithLastItemHeight:(double)a3;
- (void)_updateCells;
- (void)_updateCollectionViewMargins;
- (void)_updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:(NSDirectionalEdgeInsets)a3;
- (void)_updateConversationSortOrder;
- (void)_updateDisplayMetrics;
- (void)_updateForceCollapsedSenderHeader;
- (void)_updateIncludeRelatedMessages;
- (void)_updateLayout;
- (void)_updateSenderHeaderView:(id)a3 viewModel:(id)a4 expansionStatus:(int64_t)a5;
- (void)_updateTitle;
- (void)arrowControlsView:(id)a3 didTapButtonWithDirection:(int)a4;
- (void)beginInteractiveResizing;
- (void)beginResizing;
- (void)cellConfigurator:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5;
- (void)cellConfigurator:(id)a3 didInvalidateConfigurationForCellsAtIndexPaths:(id)a4;
- (void)cellConfigurator:(id)a3 wantsToReloadCellAtIndexPaths:(id)a4 animated:(BOOL)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewMarginsDidChange:(NSDirectionalEdgeInsets)a3;
- (void)contactCardInteractions:(id)a3 triggerSearchForDisplayName:(id)a4 emailAddresses:(id)a5;
- (void)contactDoneButtonItemTapped:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)dealloc;
- (void)done:(id)a3;
- (void)endResizing;
- (void)forwardButtonTapped:(id)a3;
- (void)loadView;
- (void)messageViewController:(id)a3 contentViewDidEndZoomingMessageWithOffset:(CGPoint)a4;
- (void)messageViewController:(id)a3 didChangeSelectedHTML:(id)a4;
- (void)messageViewController:(id)a3 didFinishRenderingWithHeight:(double)a4;
- (void)messageViewController:(id)a3 didStartDownloadForContentItemWithProgress:(id)a4;
- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4;
- (void)messageViewController:(id)a3 didTapShowMoreAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5;
- (void)messageViewController:(id)a3 didTapUndoSendButton:(id)a4;
- (void)messageViewController:(id)a3 webViewDidTerminateWithReason:(int64_t)a4;
- (void)messageViewControllerDidDisplayContent:(id)a3 success:(BOOL)a4;
- (void)messageViewControllerDidFinishFirstPaint:(id)a3;
- (void)messageViewControllerDidTapAddressAtom:(id)a3 contactViewController:(id)a4;
- (void)messageViewControllerDidTapToExpand:(id)a3;
- (void)navigateToMessageInDirection:(int)a3;
- (void)prepareForResizing;
- (void)presentPreviousDraftPicker;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)previewCancelled;
- (void)previewDidCommit:(BOOL)a3;
- (void)replyAllButtonTapped:(id)a3;
- (void)replyButtonTapped:(id)a3;
- (void)revealActionsButtonTapped:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setAllowQuickReply:(BOOL)a3;
- (void)setAssistantContextProvider:(id)a3;
- (void)setAvatarGenerator:(id)a3;
- (void)setBeingPreviewed:(BOOL)a3;
- (void)setBlankConversationController:(id)a3;
- (void)setCellConfigurator:(id)a3;
- (void)setCellExpansionRecognizer:(id)a3;
- (void)setCellHeightCache:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setConversationHeaderView:(id)a3;
- (void)setConversationLayout:(id)a3;
- (void)setConversationSortOrder:(unint64_t)a3;
- (void)setConversationSubject:(id)a3;
- (void)setCurrentVisibleMessageStrategy:(id)a3;
- (void)setDefaultBarButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidCompleteFirstPaint:(BOOL)a3;
- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3;
- (void)setDisableScrollPinning:(BOOL)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setExpandableSenderHeaderView:(id)a3;
- (void)setForceCollapsedSenderHeader:(BOOL)a3;
- (void)setForceCollapsedSenderHeaderToken:(id)a3;
- (void)setHandoffCoordinator:(id)a3;
- (void)setHorizontalPadding:(double)a3;
- (void)setInitialScrollOffset:(CGPoint)a3;
- (void)setInitialSenderHeaderExpansionStatus:(int64_t)a3;
- (void)setIsPerformingQuickReplySendAnimation:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setIsStandalone:(BOOL)a3;
- (void)setLastExpandedCellIndexPath:(id)a3;
- (void)setLayoutInvalidationContentOffset:(CGPoint)a3;
- (void)setMessageViewControllerReuseQueue:(id)a3;
- (void)setMessagesShowSourceMailbox:(BOOL)a3;
- (void)setNextAvailableLoadMoreInterval:(double)a3;
- (void)setPagingAnimator:(id)a3;
- (void)setPinnedItem:(id)a3;
- (void)setPreviewState:(id)a3;
- (void)setQuickReplyHeight:(double)a3;
- (void)setReferenceMessageListItem:(id)a3;
- (void)setRemovedSingleMessageIndexPath:(id)a3;
- (void)setResizingContentViews:(id)a3;
- (void)setResizingState:(int64_t)a3;
- (void)setRestorationFuture:(id)a3;
- (void)setScene:(id)a3;
- (void)setSenderHeaderLayoutGuide:(id)a3;
- (void)setSenderHeaderLayoutGuideLeadingConstraint:(id)a3;
- (void)setSenderHeaderLayoutGuideTopConstraint:(id)a3;
- (void)setSenderHeaderLayoutGuideTrailingConstraint:(id)a3;
- (void)setSenderHeaderViewAnimator:(id)a3;
- (void)setShouldShowNoMessageSelectedView:(BOOL)a3;
- (void)setShownAsConversation:(BOOL)a3;
- (void)setStaticSenderHeaderView:(id)a3;
- (void)setTapGestureTitleView:(id)a3;
- (void)setTextSelectionScrollHandler:(id)a3;
- (void)setToolbarHidden:(BOOL)a3;
- (void)setTotalUnfilteredMessageCount:(int64_t)a3;
- (void)showAllMessagesForConversationSenderHeaderView:(id)a3;
- (void)showCategoryMessagesForConversationSenderHeaderView:(id)a3;
- (void)tappedSenderHeader:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateArrowControlsView;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)updateNavigationItemChromelessConfiguration;
- (void)updateUserActivityState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ConversationViewControllerBase

- (BOOL)beingPreviewed
{
  v2 = [(ConversationViewControllerBase *)self previewState];
  unsigned __int8 v3 = [v2 beingPreviewed];

  return v3;
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)_updateForceCollapsedSenderHeader
{
  unsigned __int8 v3 = +[NSUserDefaults em_userDefaults];
  unsigned int v4 = [v3 BOOLForKey:EMUserDefaultForceCollapsedSenderHeader];

  v5 = [(ConversationViewControllerBase *)self traitCollection];
  id v6 = [v5 verticalSizeClass];

  if (v6 == (id)1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v4;
  }
  if (v7 != [(ConversationViewControllerBase *)self forceCollapsedSenderHeader])
  {
    [(ConversationViewControllerBase *)self setForceCollapsedSenderHeader:v7];
    [(ConversationViewControllerBase *)self _updateTitle];
  }
}

- (double)_navigationBarHeight
{
  if ([(ConversationViewControllerBase *)self shouldShowExpandableDigestHeaderView])
  {
    unsigned __int8 v3 = [(ConversationViewControllerBase *)self senderHeaderViewAnimator];
    [v3 currentHeight];
    double v5 = v4;
  }
  else
  {
    unsigned __int8 v3 = [(ConversationViewControllerBase *)self navigationController];
    id v6 = [v3 navigationBar];
    [v6 frame];
    double v5 = v7;
  }
  return v5;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = [(ConversationViewControllerBase *)self viewIfLoaded];
  id v6 = [v5 window];

  if (v6)
  {
    double v7 = [(ConversationViewControllerBase *)self expandableSenderHeaderView];
    v8 = [v7 superview];

    if (v8)
    {
      v9 = [(ConversationViewControllerBase *)self senderHeaderViewAnimator];
      [v9 scrollViewDidScroll:v4];
    }
    if ((id)[(ConversationViewControllerBase *)self resizingState] != (id)3)
    {
      v10 = [(ConversationViewControllerBase *)self collectionView];
      v11 = [v10 visibleCells];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10009B95C;
      v12[3] = &unk_100605C98;
      v12[4] = self;
      [v11 enumerateObjectsUsingBlock:v12];

      [(MFConversationCellExpansionGestureRecognizer *)self->_cellExpansionRecognizer cancel];
      if ([(ConversationViewControllerBase *)self allowQuickReply]) {
        [(ConversationViewControllerBase *)self _updateQuickReplySendButtonOffset:v4];
      }
    }
  }
}

- (void)_updateLayout
{
  unsigned __int8 v3 = [(ConversationViewControllerBase *)self viewIfLoaded];
  id v4 = [v3 window];

  if (v4)
  {
    if (EMBlackPearlIsFeatureEnabled())
    {
      [(ConversationViewControllerBase *)self _updateForceCollapsedSenderHeader];
      if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
      {
        double v5 = [(ConversationViewControllerBase *)self scene];
        id v6 = [v5 statusBarManager];
        [v6 statusBarFrame];
        double Height = CGRectGetHeight(v38);

        if ([(ConversationViewControllerBase *)self shouldShowStaticDigestHeaderView])
        {
          [(ConversationViewControllerBase *)self _navigationBarHeight];
          double Height = Height + v8;
        }
        v9 = [(ConversationViewControllerBase *)self senderHeaderLayoutGuideTopConstraint];
        [v9 setConstant:Height];

        [(ConversationViewControllerBase *)self horizontalPadding];
        double v11 = v10;
        v12 = [(ConversationViewControllerBase *)self senderHeaderLayoutGuideLeadingConstraint];
        [v12 setConstant:v11];

        [(ConversationViewControllerBase *)self horizontalPadding];
        double v14 = v13;
        v15 = [(ConversationViewControllerBase *)self senderHeaderLayoutGuideTrailingConstraint];
        [v15 setConstant:-v14];
      }
    }
    [(ConversationViewControllerBase *)self _calculateCollectionViewInsets];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = [(ConversationViewControllerBase *)self collectionView];
    [v24 contentInset];
    if (v28 == v19 && v25 == v17 && v27 == v23)
    {
      double v29 = v26;

      if (v29 == v21)
      {
LABEL_17:
        v32 = self->_conversationLayout;
        [(ConversationViewControllerBase *)self _itemSpacing];
        double v34 = v33;
        [(MFSwipableCollectionViewLayout *)v32 minimumLineSpacing];
        if (v35 != v34) {
          [(MFSwipableCollectionViewLayout *)v32 setMinimumLineSpacing:v34];
        }
        [(ConversationViewControllerBase *)self _updateCollectionViewMargins];

        goto LABEL_20;
      }
    }
    else
    {
    }
    v31 = [(ConversationViewControllerBase *)self collectionView];
    [v31 setContentInset:v17, v19, v21, v23];

    goto LABEL_17;
  }
  v30 = +[ConversationViewController log];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 134217984;
    v37 = v3;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Skip _updateLayout since window is nil (view:%p)", (uint8_t *)&v36, 0xCu);
  }

LABEL_20:
}

- (BOOL)isShowingGroupedSenderMessageList
{
  v2 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_splitViewStateChanged:(id)a3
{
  id v5 = a3;
  id v6 = [v5 object];
  double v7 = [(ConversationViewControllerBase *)self splitViewController];

  if (v6 == v7)
  {
    double v8 = [v5 userInfo];
    v9 = [v8 objectForKeyedSubscript:@"MailSplitViewControllerNewDisplayModeKey"];
    double v10 = [v8 objectForKeyedSubscript:@"MailSplitViewControllerNewTraitCollectionKey"];
    uint64_t v11 = [v8 objectForKeyedSubscript:@"MailSplitViewControllerIsCollapsedKey"];
    v12 = (void *)v11;
    if (!v9 || !v11)
    {
      double v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2, self, @"ConversationViewControllerBase.m", 3422, @"Notification is missing information:%@, %@", v9, v12 object file lineNumber description];
    }
    id v13 = [v9 integerValue];
    unsigned __int8 v14 = [v12 BOOLValue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A3480;
    v17[3] = &unk_100606308;
    v17[4] = self;
    id v19 = v13;
    id v15 = v10;
    id v18 = v15;
    unsigned __int8 v20 = v14;
    +[UIView performWithoutAnimation:v17];
  }
}

- (UIEdgeInsets)_calculateCollectionViewInsets
{
  unsigned __int8 v3 = [(ConversationViewControllerBase *)self collectionView];
  [v3 contentInset];
  double v5 = v4;
  double v7 = v6;

  double Height = 0.0;
  double v9 = 0.0;
  if (![(ConversationViewControllerBase *)self beingPreviewed])
  {
    double v10 = [(ConversationViewControllerBase *)self navigationController];
    uint64_t v11 = [v10 presentingViewController];

    if (!v11)
    {
      v12 = [(ConversationViewControllerBase *)self scene];
      id v13 = [v12 statusBarManager];
      [v13 statusBarFrame];
      double Height = CGRectGetHeight(v26);
    }
    [(ConversationViewControllerBase *)self _navigationBarHeight];
    double Height = Height + v14;
    if (!+[UIDevice mf_isPad]
      || ([(ConversationViewControllerBase *)self traitCollection],
          id v15 = objc_claimAutoreleasedReturnValue(),
          id v16 = [v15 horizontalSizeClass],
          v15,
          v16 == (id)1))
    {
      [(ConversationViewControllerBase *)self _itemSpacing];
      double Height = Height + v17;
    }
    [(ConversationViewControllerBase *)self _itemSpacing];
    double v19 = v18;
    unsigned __int8 v20 = [(ConversationViewControllerBase *)self view];
    [v20 safeAreaInsets];
    double v9 = v19 + v21 + self->_adjustmentForKeyboard;
  }
  double v22 = Height;
  double v23 = v5;
  double v24 = v9;
  double v25 = v7;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

- (double)_itemSpacing
{
  double v3 = 10.0;
  if ((+[UIDevice mf_isPad] & 1) == 0
    && (_os_feature_enabled_impl() & 1) == 0
    && (!_os_feature_enabled_impl() || (EMIsGreymatterAvailableWithOverride() & 1) == 0))
  {
    if ([(ConversationViewControllerBase *)self _isDisplayingSingleMessage]) {
      return 0.0;
    }
    else {
      return 10.0;
    }
  }
  return v3;
}

- (BOOL)shownAsConversation
{
  return self->_shownAsConversation;
}

- (void)loadView
{
  v44.receiver = self;
  v44.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v44 loadView];
  double v3 = objc_alloc_init(MFSwipableCollectionViewLayout);
  conversationLayout = self->_conversationLayout;
  self->_conversationLayout = v3;

  double v5 = sub_100006EAC(self);
  double v9 = -[_MFConversationViewCollectionView initWithFrame:collectionViewLayout:]([_MFConversationViewCollectionView alloc], "initWithFrame:collectionViewLayout:", self->_conversationLayout, v5, v6, v7, v8);
  conversationView = self->_conversationView;
  self->_conversationView = v9;

  [(_MFConversationViewCollectionView *)self->_conversationView setAutoresizingMask:18];
  [(_MFConversationViewCollectionView *)self->_conversationView setInsetsLayoutMarginsFromSafeArea:0];
  [(_MFConversationViewCollectionView *)self->_conversationView setDelegate:self];
  [(_MFConversationViewCollectionView *)self->_conversationView setDragDelegate:self];
  [(_MFConversationViewCollectionView *)self->_conversationView setAllowsSelection:0];
  [(_MFConversationViewCollectionView *)self->_conversationView setAlwaysBounceVertical:1];
  uint64_t v11 = +[UIColor mailConversationViewBackgroundColor];
  [(_MFConversationViewCollectionView *)self->_conversationView setBackgroundColor:v11];

  [(_MFConversationViewCollectionView *)self->_conversationView setPrefetchingEnabled:0];
  [(_MFConversationViewCollectionView *)self->_conversationView setOpaque:1];
  [(_MFConversationViewCollectionView *)self->_conversationView setContentInsetAdjustmentBehavior:2];
  [(_MFConversationViewCollectionView *)self->_conversationView _setIndicatorInsetAdjustmentBehavior:1];
  [(ConversationViewControllerBase *)self _calculateCollectionViewInsets];
  -[_MFConversationViewCollectionView setContentInset:](self->_conversationView, "setContentInset:");
  if ([(ConversationViewControllerBase *)self allowQuickReply]) {
    [(_MFConversationViewCollectionView *)self->_conversationView setKeyboardDismissMode:2];
  }
  v12 = [(ConversationViewControllerBase *)self view];
  [v12 addSubview:self->_conversationView];

  id v13 = [[MFConversationCellConfigurator alloc] initWithCollectionView:self->_conversationView];
  cellConfigurator = self->_cellConfigurator;
  self->_cellConfigurator = v13;

  [(MFConversationCellConfigurator *)self->_cellConfigurator setDelegate:self];
  id v15 = [(ConversationViewControllerBase *)self contactStore];
  [(MFConversationCellConfigurator *)self->_cellConfigurator setContactStore:v15];

  id v16 = [(ConversationViewControllerBase *)self avatarGenerator];
  [(MFConversationCellConfigurator *)self->_cellConfigurator setAvatarGenerator:v16];

  double v17 = [(ConversationViewControllerBase *)self scene];
  double v18 = [v17 brandIndicatorProvider];
  [(MFConversationCellConfigurator *)self->_cellConfigurator setBrandIndicatorProvider:v18];

  double v19 = [(MFConversationCellConfigurator *)self->_cellConfigurator sizeTracker];
  [v19 setDelegate:self];

  [(ConversationViewControllerBase *)self _updateLayout];
  unsigned __int8 v20 = [(ConversationViewControllerBase *)self restorationFuture];
  BOOL v21 = v20 == 0;

  [(ConversationViewControllerBase *)self _doSetShouldShowNoMessageSelectedView:v21];
  [(ConversationViewControllerBase *)self mf_updateAlertSuppressionContextsForReason:@"conversation view did load"];
  double v22 = [(ConversationViewControllerBase *)self navigationItem];
  [v22 setLargeTitleDisplayMode:2];

  double v23 = self->_findInteraction;
  if (v23) {
    [(_MFConversationViewCollectionView *)self->_conversationView addInteraction:v23];
  }
  double v24 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  senderHeaderLayoutGuide = self->_senderHeaderLayoutGuide;
  self->_senderHeaderLayoutGuide = v24;

  CGRect v26 = [(ConversationViewControllerBase *)self view];
  [v26 addLayoutGuide:self->_senderHeaderLayoutGuide];

  double v27 = [(UILayoutGuide *)self->_senderHeaderLayoutGuide topAnchor];
  double v28 = [(ConversationViewControllerBase *)self view];
  double v29 = [v28 topAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  senderHeaderLayoutGuideTopConstraint = self->_senderHeaderLayoutGuideTopConstraint;
  self->_senderHeaderLayoutGuideTopConstraint = v30;

  v32 = [(UILayoutGuide *)self->_senderHeaderLayoutGuide leadingAnchor];
  double v33 = [(ConversationViewControllerBase *)self view];
  double v34 = [v33 leadingAnchor];
  double v35 = [v32 constraintEqualToAnchor:v34];
  senderHeaderLayoutGuideLeadingConstraint = self->_senderHeaderLayoutGuideLeadingConstraint;
  self->_senderHeaderLayoutGuideLeadingConstraint = v35;

  v37 = [(UILayoutGuide *)self->_senderHeaderLayoutGuide trailingAnchor];
  CGRect v38 = [(ConversationViewControllerBase *)self view];
  v39 = [v38 trailingAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  senderHeaderLayoutGuideTrailingConstraint = self->_senderHeaderLayoutGuideTrailingConstraint;
  self->_senderHeaderLayoutGuideTrailingConstraint = v40;

  v42 = self->_senderHeaderLayoutGuideLeadingConstraint;
  v45[0] = self->_senderHeaderLayoutGuideTopConstraint;
  v45[1] = v42;
  v45[2] = self->_senderHeaderLayoutGuideTrailingConstraint;
  v43 = +[NSArray arrayWithObjects:v45 count:3];
  +[NSLayoutConstraint activateConstraints:v43];
}

- (UICollectionView)collectionView
{
  [(ConversationViewControllerBase *)self loadViewIfNeeded];
  conversationView = self->_conversationView;

  return (UICollectionView *)conversationView;
}

- (EMMessageListItem)referenceMessageListItem
{
  return self->_referenceMessageListItem;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setAvatarGenerator:(id)a3
{
}

- (EFFuture)restorationFuture
{
  return self->_restorationFuture;
}

- (MFConversationPreviewState)previewState
{
  return self->_previewState;
}

- (BOOL)forceCollapsedSenderHeader
{
  return self->_forceCollapsedSenderHeader;
}

- (ConversationViewControllerBaseDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ConversationViewControllerBaseDelegate *)WeakRetained;
}

- (MFSwipableCollectionViewLayout)conversationLayout
{
  return self->_conversationLayout;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (MFConversationCellConfigurator)cellConfigurator
{
  return self->_cellConfigurator;
}

- (BOOL)allowQuickReply
{
  return self->_allowQuickReply;
}

- (void)_sceneDidActivate:(id)a3
{
}

- (void)_doSetShouldShowNoMessageSelectedView:(BOOL)a3
{
  self->_shouldShowNoMessageSelectedView = a3;
  [(ConversationViewControllerBase *)self setNeedsUpdateContentUnavailableConfiguration];
}

- (unint64_t)_currentConversationSortOrderPreference
{
  return sub_100057594(0);
}

+ (id)log
{
  if (qword_100699420 != -1) {
    dispatch_once(&qword_100699420, &stru_100605F18);
  }
  v2 = (void *)qword_100699418;

  return v2;
}

- (ConversationViewControllerBase)initWithScene:(id)a3 contactStore:(id)a4 avatarGenerator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    memset(__b, 170, sizeof(__b));
    LODWORD(__b[4]) = 0;
    *(void *)v52 = 0xE00000001;
    int v53 = 1;
    pid_t v54 = getpid();
    size_t v50 = 648;
    if (!sysctl(v52, 4u, __b, &v50, 0, 0) && ((uint64_t)__b[4] & 0x800) != 0) {
      __debugbreak();
    }
    uint64_t v11 = +[ConversationViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100458DF0(v11);
    }
  }
  v49.receiver = self;
  v49.super_class = (Class)ConversationViewControllerBase;
  v12 = [(ConversationViewControllerBase *)&v49 initWithNibName:0 bundle:0];
  id v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_scene, v8);
    objc_storeStrong((id *)&v13->_contactStore, a4);
    objc_storeStrong((id *)&v13->_avatarGenerator, a5);
    double v14 = [[_TtC10MobileMail37ConversationNavigationBarItemsManager alloc] initWithScene:v8 delegate:v13 actionHandler:v13 arrowDelegate:v13];
    barItemsManager = v13->_barItemsManager;
    v13->_barItemsManager = v14;

    uint64_t v16 = +[NSMutableDictionary dictionary];
    cellHeightCache = v13->_cellHeightCache;
    v13->_cellHeightCache = (NSMutableDictionary *)v16;

    double v18 = [[MFConversationCurrentVisibleMessageStrategy alloc] initWithConversationViewController:v13];
    currentVisibleMessageStrategy = v13->_currentVisibleMessageStrategy;
    v13->_currentVisibleMessageStrategy = v18;

    unsigned __int8 v20 = [[MFConversationHandoffCoordinator alloc] initWithUserActivityProvider:v13 currentVisibleMessageStrategy:v13->_currentVisibleMessageStrategy];
    handoffCoordinator = v13->_handoffCoordinator;
    v13->_handoffCoordinator = v20;

    double v22 = [MFConversationAssistantContextProvider alloc];
    double v23 = v13->_currentVisibleMessageStrategy;
    double v24 = [(ConversationViewControllerBase *)v13 contactStore];
    double v25 = [(MFConversationAssistantContextProvider *)v22 initWithCurrentVisibileMessageStrategy:v23 contactStore:v24];
    assistantContextProvider = v13->_assistantContextProvider;
    v13->_assistantContextProvider = v25;

    v13->_conversationSortOrder = [(ConversationViewControllerBase *)v13 _currentConversationSortOrderPreference];
    if (sub_1000575E0(0)) {
      char v27 = 32;
    }
    else {
      char v27 = 0;
    }
    *(unsigned char *)&v13->_flags = *(unsigned char *)&v13->_flags & 0xDF | v27;
    id v28 = objc_alloc((Class)EFLocked);
    double v29 = +[NSNull null];
    v30 = (EFLocked *)[v28 initWithObject:v29];
    quickReplyAnimationContext = v13->_quickReplyAnimationContext;
    v13->_quickReplyAnimationContext = v30;

    v32 = +[NSNotificationCenter defaultCenter];
    [v32 addObserver:v13 selector:"_updateConversationSortOrder" name:MailApplicationDidChangeConversationOrder object:0];
    [v32 addObserver:v13 selector:"_updateIncludeRelatedMessages" name:MailApplicationDidChangeConversationViewIncludesRelatedMessages object:0];
    [v32 addObserver:v13 selector:"_fontMetricCacheDidInvalidate:" name:MFFontMetricCacheInvalidationNotification object:0];
    [v32 addObserver:v13 selector:"_splitViewStateChanged:" name:@"MailSplitViewControllerViewStateChangedNotification" object:0];
    [v32 addObserver:v13 selector:"_sceneDidActivate:" name:UISceneDidActivateNotification object:v8];
    [v32 addObserver:v13 selector:"_sceneWillDeactivate:" name:UISceneWillDeactivateNotification object:v8];
    [v32 addObserver:v13 selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
    double v33 = [[MFConversationPreviewState alloc] initWithBackgroundUpdater:0];
    previewState = v13->_previewState;
    v13->_previewState = v33;

    double v35 = [[MFMessageViewControllerReuseQueue alloc] initWithScene:v8];
    messageViewControllerReuseQueue = v13->_messageViewControllerReuseQueue;
    v13->_messageViewControllerReuseQueue = v35;

    *(unsigned char *)&v13->_flags &= ~0x80u;
    v37 = objc_alloc_init(BlankConversationController);
    blankConversationController = v13->_blankConversationController;
    v13->_blankConversationController = v37;

    if (_os_feature_enabled_impl())
    {
      +[QuickReplyView defaultHeight];
      v13->_quickReplydouble Height = v39;
    }
    v40 = [v8 daemonInterface];
    uint64_t v41 = [v40 mailboxRepository];
    mailboxRepository = v13->_mailboxRepository;
    v13->_mailboxRepository = (EMMailboxRepository *)v41;

    if (EMBlackPearlIsFeatureEnabled())
    {
      __b[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(__b, v13);
      v43 = +[NSUserDefaults em_userDefaults];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_100095CC4;
      v47[3] = &unk_100605F40;
      objc_copyWeak(&v48, __b);
      uint64_t v44 = [v43 ef_observeKeyPath:EMUserDefaultForceCollapsedSenderHeader options:5 autoCancelToken:1 usingBlock:v47];
      forceCollapsedSenderHeaderToken = v13->_forceCollapsedSenderHeaderToken;
      v13->_forceCollapsedSenderHeaderToken = (EFCancelable *)v44;

      objc_destroyWeak(&v48);
      objc_destroyWeak(__b);
    }
  }
  return v13;
}

- (void)dealloc
{
  double v3 = +[MFKeyboardAvoidance sharedController];
  [v3 unregisterKeyboardAvoidable:self];

  [(ConversationViewControllerBase *)self invalidateAutomaticMarkAsReadForAllMessages];
  v4.receiver = self;
  v4.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v4 dealloc];
}

- (void)_sceneWillDeactivate:(id)a3
{
  id v3 = [(ConversationViewControllerBase *)self blankConversationController];
  [v3 reportMetrics];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v14 viewWillAppear:a3];
  objc_super v4 = [(ConversationViewControllerBase *)self scene];
  if (![(ConversationViewControllerBase *)self didNotifyExtendedLaunchTracker])
  {
    double v5 = [v4 extendedLaunchTracker];
    [v5 observeViewController:self scene:v4];
  }
  *(unsigned char *)&self->_flags |= 0x10u;
  [(ConversationViewControllerBase *)self _updateBarButtonsAnimated:0 force:1];
  [(ConversationViewControllerBase *)self _updateCollectionViewMargins];
  [(ConversationViewControllerBase *)self _updateDisplayMetrics];
  [(ConversationViewControllerBase *)self _updateTitle];
  [(ConversationViewControllerBase *)self updateNavigationItemChromelessConfiguration];
  *(unsigned char *)&self->_flags &= ~0x40u;
  if (+[UIDevice mf_isPad])
  {
    double v6 = [v4 popoverManager];
    [v6 addPassthroughViewProvider:self];
  }
  double v7 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  if (v7)
  {

LABEL_7:
    [(ConversationViewControllerBase *)self setShouldShowNoMessageSelectedView:0];
    goto LABEL_12;
  }
  id v8 = +[UIApplication sharedApplication];
  id v9 = [v8 accountsProvider];
  id v10 = [v9 displayedAccounts];
  id v11 = [v10 count];

  if (!v11) {
    goto LABEL_7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained selectInitialMessageForConversationViewController:self];
  }

LABEL_12:
  [(ConversationViewControllerBase *)self mf_updateAlertSuppressionContextsForReason:@"conversation view will appear"];
  if (+[UIDevice mf_isPad]
    && [UIApp launchedToTest]
    && ![(ConversationViewControllerBase *)self didNotifyExtendedLaunchTracker])
  {
    [(ConversationViewControllerBase *)self setDidNotifyExtendedLaunchTracker:1];
    id v13 = [v4 extendedLaunchTracker];
    [v13 didFinishLoadViewController:self scene:v4];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v28 viewDidAppear:a3];
  sub_10001DB38(self, 1);
  if ([(ConversationViewControllerBase *)self isPrimary])
  {
    if (!self->_cellExpansionRecognizer)
    {
      objc_super v4 = [[MFConversationCellExpansionGestureRecognizer alloc] initWithTarget:self action:"_expansionRecognizerDidRecognize:"];
      cellExpansionRecognizer = self->_cellExpansionRecognizer;
      self->_cellExpansionRecognizer = v4;

      [(MFConversationCellExpansionGestureRecognizer *)self->_cellExpansionRecognizer setDelegate:self];
    }
    double v6 = [(ConversationViewControllerBase *)self view];
    double v7 = [(ConversationViewControllerBase *)self cellExpansionRecognizer];
    [v6 addGestureRecognizer:v7];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = [(ConversationViewControllerBase *)self collectionView];
    id v9 = [v8 interactions];

    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v25;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v13 _setLiftDelay:0.57];
          }
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }
  }
  objc_super v14 = [(ConversationViewControllerBase *)self previewState];
  unsigned int v15 = [v14 shouldScheduleMarkMessageAsRead];

  if (v15) {
    [(ConversationViewControllerBase *)self scheduleAutomaticMarkAsReadForReferenceMessage];
  }
  [(ConversationViewControllerBase *)self mf_updateAlertSuppressionContextsForReason:@"conversation view did appear"];
  uint64_t v16 = +[MFKeyboardAvoidance sharedController];
  [v16 registerKeyboardAvoidable:self];

  double v17 = MFMessageSelectionLifecycleSignpostLog();
  double v18 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  double v19 = [v18 itemID];
  os_signpost_id_t v20 = os_signpost_id_make_with_pointer(v17, v19);

  BOOL v21 = MFMessageSelectionLifecycleSignpostLog();
  double v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)double v23 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, v20, "Message selection lifecycle", "Conversation view did appear", v23, 2u);
  }
}

- (void)_enumerateExpandedCellMessageContentViewsWithBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(ConversationViewControllerBase *)self resizingContentViews];
  id v6 = [v5 mutableCopy];

  double v7 = [(ConversationViewControllerBase *)self cellConfigurator];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000965B4;
  v13[3] = &unk_100605F68;
  id v8 = v4;
  id v15 = v8;
  id v9 = v6;
  id v14 = v9;
  [v7 enumerateExpandedCellsWithBlock:v13];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100096650;
  v11[3] = &unk_100605F90;
  id v10 = v8;
  id v12 = v10;
  [v9 enumerateObjectsUsingBlock:v11];
}

- (void)setResizingState:(int64_t)a3
{
  if (self->_resizingState != a3)
  {
    self->_resizingState = a3;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000969C4;
    v21[3] = &unk_100605FB0;
    BOOL v22 = a3 != 2;
    double v5 = objc_retainBlock(v21);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000969D0;
    v18[3] = &unk_1006057A8;
    objc_copyWeak(&v19, &location);
    id v6 = objc_retainBlock(v18);
    switch(a3)
    {
      case 0:
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100096B0C;
        v16[3] = &unk_100605FF8;
        double v17 = v5;
        [(ConversationViewControllerBase *)self _enumerateExpandedCellMessageContentViewsWithBlock:v16];
        [(ConversationViewControllerBase *)self setResizingContentViews:0];
        ((void (*)(void *, void))v6[2])(v6, 0);
        double v7 = v17;
        goto LABEL_7;
      case 1:
        uint64_t v10 = 0;
        uint64_t v11 = &v10;
        uint64_t v12 = 0x3032000000;
        id v13 = sub_100096B1C;
        id v14 = sub_100096B2C;
        id v15 = (id)0xAAAAAAAAAAAAAAAALL;
        id v15 = objc_alloc_init((Class)NSMutableArray);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100096B34;
        v9[3] = &unk_100606020;
        v9[4] = &v10;
        [(ConversationViewControllerBase *)self _enumerateExpandedCellMessageContentViewsWithBlock:v9];
        [(ConversationViewControllerBase *)self setResizingContentViews:v11[5]];
        _Block_object_dispose(&v10, 8);
        double v7 = v15;
LABEL_7:

        break;
      case 2:
        id v8 = [(ConversationViewControllerBase *)self collectionView];
        [v8 directionalLayoutMargins];
        [(ConversationViewControllerBase *)self _updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:"_updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:"];

        [(ConversationViewControllerBase *)self _enumerateExpandedCellMessageContentViewsWithBlock:v5];
        break;
      case 3:
        [(ConversationViewControllerBase *)self _enumerateExpandedCellMessageContentViewsWithBlock:v5];
        ((void (*)(void *, uint64_t))v6[2])(v6, 1);
        break;
      default:
        break;
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)prepareForResizing
{
}

- (void)beginResizing
{
}

- (void)beginInteractiveResizing
{
}

- (void)endResizing
{
}

- (void)_reloadDataSource
{
}

- (int64_t)countOfMessages
{
}

- (int64_t)countOfSummaries
{
}

- (id)_messageItemIDAtIndexPath:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _messageItemIDAtIndexPath:]", "ConversationViewControllerBase.m", 585, "0");
}

- (int64_t)_headerDisplayOptionsForCell:(id)a3 displayedAsSingleMessage:(BOOL)a4
{
  return 1;
}

- (void)_showSingleMessage:(id)a3 animationOffset:(CGPoint)a4 initialScrollOffset:(CGPoint)a5
{
  id v7 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _showSingleMessage:animationOffset:initialScrollOffset:]", "ConversationViewControllerBase.m", 602, "0");
}

- (id)_currentlyVisibleIndexPath
{
}

- (id)_indexPathForReferenceMessage
{
}

- (id)_indexPathOfMessageViewControllerMessage:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _indexPathOfMessageViewControllerMessage:]", "ConversationViewControllerBase.m", 614, "0");
}

- (BOOL)_isItemInitiallyUnreadAtIndexPath:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _isItemInitiallyUnreadAtIndexPath:]", "ConversationViewControllerBase.m", 618, "0");
}

- (void)_enqueueMessageViewController:(id)a3
{
  id v5 = a3;
  id v4 = [(ConversationViewControllerBase *)self messageViewControllerReuseQueue];
  [v4 enqueueMessageViewController:v5];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v7 viewDidLayoutSubviews];
  if ((id)[(ConversationViewControllerBase *)self resizingState] != (id)2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100097018;
    v6[3] = &unk_1006047A0;
    v6[4] = self;
    id v3 = objc_retainBlock(v6);
    if (![(ConversationViewControllerBase *)self isPerformingQuickReplySendAnimation])
    {
      id v4 = [(ConversationViewControllerBase *)self previewState];
      unsigned int v5 = [v4 shouldScrollToReferenceMessage];

      if (v5)
      {
        +[UIView performWithoutAnimation:v3];
        [(ConversationViewControllerBase *)self _scrollToInitialPosition];
      }
      else
      {
        ((void (*)(void *))v3[2])(v3);
      }
    }
  }
}

- (void)collectionViewMarginsDidChange:(NSDirectionalEdgeInsets)a3
{
  id v4 = [(ConversationViewControllerBase *)self view];
  [v4 mf_prefersRightToLeftInterfaceLayout];
  MFEdgeInsetsFromDirectionalEdgeInsets();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(ConversationViewControllerBase *)self displayMetrics];
  [v13 layoutMargins];
  if (v8 == v17 && v6 == v14 && v12 == v16)
  {
    double v20 = v15;

    if (v10 == v20) {
      return;
    }
  }
  else
  {
  }
  [(ConversationViewControllerBase *)self _updateDisplayMetrics];
  if ((id)[(ConversationViewControllerBase *)self resizingState] != (id)3)
  {
    [(ConversationViewControllerBase *)self _restorePinnedScrollPosition];
  }
}

- (NSDirectionalEdgeInsets)layoutMarginsForCollectionViewFrame:(CGRect)a3
{
  [(ConversationViewControllerBase *)self systemMinimumLayoutMargins];
  id v4 = [(ConversationViewControllerBase *)self view];
  [v4 mf_prefersRightToLeftInterfaceLayout];
  MFEdgeInsetsFromDirectionalEdgeInsets();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(ConversationViewControllerBase *)self view];
  [v13 safeAreaInsets];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;

  +[MFReadableContentMarginCalculator readableContentMarginsForWidth:minMargins:safeAreaInsets:](MFReadableContentMarginCalculator, "readableContentMarginsForWidth:minMargins:safeAreaInsets:", CGRectGetWidth(a3), v6, v8, v10, v12, v15, v17, v19, v21);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(ConversationViewControllerBase *)self view];
  unsigned int v31 = [v30 mf_prefersRightToLeftInterfaceLayout];
  if (v31) {
    double v32 = v29;
  }
  else {
    double v32 = v25;
  }
  if (v31) {
    double v29 = v25;
  }

  for (i = [(ConversationViewControllerBase *)self navigationController];
  {
    double v34 = [i navigationController];

    if (!v34) {
      break;
    }
    uint64_t v35 = [i navigationController];
  }
  if (i)
  {
    int v36 = [(ConversationViewControllerBase *)self traitCollection];
    [v36 mf_leadingEdgeToBackButtonText];
    double v38 = v32 + v37;

    double v29 = v38;
  }
  else
  {
    unsigned int v39 = +[UIDevice mf_isPad];
    double v40 = 40.0;
    if (!v39) {
      double v40 = 22.0;
    }
    if (v32 >= v40) {
      double v38 = v32;
    }
    else {
      double v38 = v40;
    }
    if (v29 < v40) {
      double v29 = v40;
    }
  }

  double v41 = v23;
  double v42 = v38;
  double v43 = v27;
  double v44 = v29;
  result.trailing = v44;
  result.bottom = v43;
  result.leading = v42;
  result.top = v41;
  return result;
}

- (void)_updateCollectionViewMargins
{
  [(_MFConversationViewCollectionView *)self->_conversationView updateLayoutMargins];

  [(ConversationViewControllerBase *)self _updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:"_updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:"];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ConversationViewControllerBase;
  -[ConversationViewControllerBase viewWillDisappear:](&v6, "viewWillDisappear:");
  [(ConversationViewControllerBase *)self _endEditingAnimated:v3];
  if ([(ConversationViewControllerBase *)self allowQuickReply])
  {
    [(ConversationViewControllerBase *)self _dismissKeyboardIfNecessary];
    if (self->_adjustmentForKeyboard > 0.0) {
      [(ConversationViewControllerBase *)self _adjustForKeyboardAvoidanceOverlap:0.0];
    }
  }
  double v5 = +[MFKeyboardAvoidance sharedController];
  [v5 unregisterKeyboardAvoidable:self];

  [(ConversationViewControllerBase *)self setTextSelectionScrollHandler:0];
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v7 viewDidDisappear:a3];
  *(unsigned char *)&self->_flags &= 0xAFu;
  sub_10001DB38(self, 0);
  id v4 = [(ConversationViewControllerBase *)self scene];
  if (+[UIDevice mf_isPad])
  {
    double v5 = [v4 popoverManager];
    [v5 removePassthroughViewProvider:self];
  }
  objc_super v6 = [(MFConversationCellExpansionGestureRecognizer *)self->_cellExpansionRecognizer view];
  [v6 removeGestureRecognizer:self->_cellExpansionRecognizer];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v16 traitCollectionDidChange:v4];
  double v5 = [(ConversationViewControllerBase *)self splitViewController];

  [(ConversationViewControllerBase *)self _updateTitle];
  objc_super v6 = [(ConversationViewControllerBase *)self traitCollection];
  unsigned int v7 = [v6 mf_traitDifferenceAffectsTextLayout:v4];

  if (v7)
  {
    [(ConversationViewControllerBase *)self _updateDisplayMetrics];
    [(ConversationViewControllerBase *)self _updateLayout];
  }
  else if (v5)
  {
    goto LABEL_5;
  }
  [(ConversationViewControllerBase *)self _updateBarButtonsAnimated:0 force:1];
LABEL_5:
  double v8 = [(ConversationViewControllerBase *)self traitCollection];
  double v9 = [v8 preferredContentSizeCategory];

  double v10 = [v4 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);
  if (IsAccessibilityCategory != UIContentSizeCategoryIsAccessibilityCategory(v10)) {
    [(ConversationViewControllerBase *)self _reloadPreparedCells];
  }
  double v12 = [(ConversationViewControllerBase *)self cellConfigurator];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100097858;
  v15[3] = &unk_100604A58;
  v15[4] = self;
  [v12 enumerateExpandedCellsWithBlock:v15];

  unsigned int v13 = [(ConversationViewControllerBase *)self shouldHideStickyFooterView];
  uint64_t v14 = [(ConversationViewControllerBase *)self navigationController];
  [v14 setToolbarHidden:v13 ^ 1];

  [(ConversationViewControllerBase *)self updateNavigationItemChromelessConfiguration];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(ConversationViewControllerBase *)self _toggleCellsGroupOpacityDuringRotationWithCoordinator:v7];
  double v8 = [(ConversationViewControllerBase *)self view];
  [v8 bounds];
  if (width - v9 >= 0.0) {
    double v10 = width - v9;
  }
  else {
    double v10 = -(width - v9);
  }

  if (v10 < 2.22044605e-16) {
    goto LABEL_7;
  }
  double v11 = [(ConversationViewControllerBase *)self collectionView];
  double v12 = [v11 window];

  if (v12)
  {
    -[ConversationViewControllerBase _beginResizingConversationView:](self, "_beginResizingConversationView:", width, height);
    v14[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100097B0C;
    v15[3] = &unk_100606048;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100097C4C;
    v14[3] = &unk_100606048;
    [v7 animateAlongsideTransition:v15 completion:v14];
LABEL_7:
    v13.receiver = self;
    v13.super_class = (Class)ConversationViewControllerBase;
    -[ConversationViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  }
}

- (BOOL)isFullyVisible
{
  v2 = [(ConversationViewControllerBase *)self previewState];
  unsigned __int8 v3 = [v2 isFullyVisible];

  return v3;
}

- (void)setReferenceMessageListItem:(id)a3
{
  id v4 = (EMMessageListItem *)a3;
  id v6 = [(ConversationViewControllerBase *)self delegate];
  if (!v4 && self->_referenceMessageListItem && (objc_opt_respondsToSelector() & 1) != 0) {
    [v6 referenceMessageNoLongerAvailableInConversationView:self];
  }
  referenceMessageListItem = self->_referenceMessageListItem;
  self->_referenceMessageListItem = v4;
}

- (BOOL)shouldShowExpandableDigestHeaderView
{
  unsigned __int8 v3 = [(ConversationViewControllerBase *)self traitCollection];
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList]) {
    BOOL v4 = [v3 horizontalSizeClass] == (id)1 || [v3 userInterfaceIdiom] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowStaticDigestHeaderView
{
  return 0;
}

- (BOOL)isBucketSelected
{
  return 0;
}

- (BOOL)isMessageListUnfiltered
{
}

- (id)previewActionItems
{
  if (!qword_100699428)
  {
    v18[0] = @"SubMenuTitle";
    unsigned __int8 v3 = +[NSBundle mainBundle];
    BOOL v4 = [v3 localizedStringForKey:@"MARK_ELIPSIS" value:&stru_100619928 table:@"Main"];
    v18[1] = @"SubMenuItems";
    v19[0] = v4;
    v19[1] = &off_10062B378;
    double v5 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

    v17[0] = &off_10062A560;
    v17[1] = &off_10062A578;
    v17[2] = &off_10062A590;
    v17[3] = v5;
    v17[4] = &off_10062A5A8;
    void v17[5] = &off_10062A5C0;
    v17[6] = &off_10062A5D8;
    uint64_t v6 = +[NSArray arrayWithObjects:v17 count:7];
    id v7 = (void *)qword_100699428;
    qword_100699428 = v6;
  }
  double v8 = sub_100216998(0);
  int64_t v9 = +[MFTriageActionUtilities triageActionForActionKey:v8];

  uint64_t v10 = qword_100699428;
  double v11 = +[NSNumber numberWithInteger:v9];
  objc_super v16 = v11;
  double v12 = +[NSArray arrayWithObjects:&v16 count:1];
  objc_super v13 = [(ConversationViewControllerBase *)self _previewActionsForTriageActions:v10 excludingActions:v12];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained didOrbOnMessageInConversationViewController:self];
  }

  return v13;
}

- (id)leadingPreviewAction
{
  unsigned __int8 v3 = sub_100216998(0);
  int64_t v4 = +[MFTriageActionUtilities triageActionForActionKey:v3];

  if (v4 == 16)
  {
    if ([(ConversationViewControllerBase *)self _shouldArchiveByDefault]) {
      int64_t v4 = 8;
    }
    else {
      int64_t v4 = 9;
    }
  }

  return [(ConversationViewControllerBase *)self _previewActionForTriageAction:v4 forSwipe:1];
}

- (id)trailingPreviewAction
{
  if ([(ConversationViewControllerBase *)self _shouldArchiveByDefault]) {
    uint64_t v3 = 9;
  }
  else {
    uint64_t v3 = 8;
  }

  return [(ConversationViewControllerBase *)self _previewActionForTriageAction:v3 forSwipe:1];
}

- (id)_previewActionsForTriageActions:(id)a3 excludingActions:(id)a4
{
  id v6 = a3;
  id v20 = a4;
  id v19 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      int64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          double v12 = [v11 objectForKeyedSubscript:@"SubMenuTitle"];
          objc_super v13 = [v11 objectForKeyedSubscript:@"SubMenuItems"];
          uint64_t v14 = [(ConversationViewControllerBase *)self _previewActionsForTriageActions:v13 excludingActions:v20];
          uint64_t v15 = +[UIPreviewActionGroup actionGroupWithTitle:v12 style:0 actions:v14];
          [v19 addObject:v15];

LABEL_8:
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ([v20 containsObject:v10] & 1) == 0)
        {
          double v12 = -[ConversationViewControllerBase _previewActionForTriageAction:forSwipe:](self, "_previewActionForTriageAction:forSwipe:", [v10 integerValue], 0);
          if (v12) {
            [v19 addObject:v12];
          }
          goto LABEL_8;
        }
LABEL_11:
        int64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v16 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v7 = v16;
    }
    while (v16);
  }

  return v19;
}

- (void)_shrinkMessagesToBarButton:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  int64_t v9 = [a3 view];
  [(ConversationViewControllerBase *)self _shrinkMessagesToView:v9 withInteraction:v10 completionHandler:v8];
}

- (void)_shrinkMessagesToView:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  double v44 = v9;
  id v45 = a5;
  v46 = v8;
  unsigned __int8 v10 = [UIApp launchedToTest];
  id v11 = [(ConversationViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v12 = [v11 shrinkAnimationContainerViewForConversationViewController:self v11];
  }
  else
  {
    objc_super v13 = [(ConversationViewControllerBase *)self collectionView];
    double v12 = [v13 superview];
  }
  [v12 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  long long v22 = [(ConversationViewControllerBase *)self collectionView];
  [v22 contentInset];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  id v31 = [objc_alloc((Class)UIView) initWithFrame:v15 + v26, v17 + v24, v19 - (v26 + v30), v21 - (v24 + v28)];
  double v32 = +[UIColor colorWithWhite:0.0 alpha:0.5];
  [v31 setBackgroundColor:v32];

  [v12 addSubview:v31];
  double v33 = [(ConversationViewControllerBase *)self view];
  double v34 = [v33 snapshotViewAfterScreenUpdates:0];

  [v12 addSubview:v34];
  uint64_t v35 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  id v36 = [v35 count];
  id v37 = [v9 messageCount];

  if (v36 == v37) {
    [(ConversationViewControllerBase *)self _notifyDelegateWillRemoveAllVisibleMessagesForTriageInteraction:v9];
  }
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  int v52[2] = sub_100098964;
  v52[3] = &unk_100606070;
  id v53 = v34;
  id v38 = v12;
  id v54 = v38;
  id v39 = v46;
  id v55 = v39;
  unsigned __int8 v58 = v10;
  id v56 = v31;
  v57 = self;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100098A7C;
  v47[3] = &unk_100606098;
  unsigned __int8 v51 = v10;
  void v47[4] = self;
  id v40 = v53;
  id v48 = v40;
  id v41 = v56;
  id v49 = v41;
  id v42 = v45;
  id v50 = v42;
  +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v52 completion:v47];
}

- (void)_notifyDelegateWillRemoveAllVisibleMessagesForTriageInteraction:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(ConversationViewControllerBase *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(ConversationViewControllerBase *)self _messagesForTriageInteraction:v7];
    id v6 = [v5 ef_map:&stru_1006060D8];

    [v4 conversationViewController:self willRemoveAllVisibleMessagesWithItemIDs:v6];
  }
}

- (id)_previewActionForTriageAction:(int64_t)a3 forSwipe:(BOOL)a4
{
  return 0;
}

- (id)_messagesForTriageInteraction:(id)a3
{
  return &__NSArray0__struct;
}

- (void)setBeingPreviewed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ConversationViewControllerBase *)self previewState];
  [v4 setBeingPreviewed:v3];
}

- (void)previewCancelled
{
  id v2 = [(ConversationViewControllerBase *)self previewState];
  [v2 previewCancelled];
}

- (void)previewDidCommit:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ConversationViewControllerBase *)self previewState];
  [v4 previewDidCommit:v3];
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v8 = a3;
  if ([v8 showNoMessageSelectedView])
  {
    id v4 = +[UIContentUnavailableConfiguration emptyConfiguration];
    double v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"NO_MESSAGE_SELECTED" value:&stru_100619928 table:@"Main"];
    [v4 setText:v6];

    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }
  [(ConversationViewControllerBase *)self setContentUnavailableConfiguration:v7];
}

- (id)contentUnavailableConfigurationState
{
  v8.receiver = self;
  v8.super_class = (Class)ConversationViewControllerBase;
  id v4 = [(ConversationViewControllerBase *)&v8 contentUnavailableConfigurationState];
  unsigned int v5 = [(ConversationViewControllerBase *)self shouldShowNoMessageSelectedView];
  if (v5)
  {
    id v2 = [(ConversationViewControllerBase *)self delegate];
    id v6 = [v2 conversationViewControllerCanShowNoMessageSelectedView:self];
  }
  else
  {
    id v6 = 0;
  }
  [v4 setShowNoMessageSelectedView:v6];
  if (v5) {

  }
  return v4;
}

- (void)setShouldShowNoMessageSelectedView:(BOOL)a3
{
  if (self->_shouldShowNoMessageSelectedView != a3) {
    -[ConversationViewControllerBase _doSetShouldShowNoMessageSelectedView:](self, "_doSetShouldShowNoMessageSelectedView:");
  }
}

- (EMCollectionItemID)targetMessageItemIDForBarButtonTriage
{
}

- (EMMessageListItem)targetMessageForBarButtonTriage
{
}

- (void)_configureSenderHeaderView:(id)a3 expansionStatus:(int64_t)a4
{
  id v35 = a3;
  id v6 = [(ConversationViewControllerBase *)self delegate];
  id v7 = [v6 currentlySelectedBucketForConversationViewController:self];

  objc_super v8 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  double v34 = [v8 itemID];
  id v9 = [v35 viewModel];
  unsigned __int8 v10 = [v9 itemID];
  if (([v10 isEqual:v34] & 1) == 0)
  {

    objc_super v13 = 0;
    goto LABEL_5;
  }
  id v11 = [v35 viewModel];
  id v12 = [v11 bucket];

  if (v12 == v7)
  {
    id v9 = [v35 viewModel];
    objc_super v13 = (_TtC10MobileMail33ConversationSenderHeaderViewModel *)[v9 copy];
LABEL_5:

    goto LABEL_7;
  }
  objc_super v13 = 0;
LABEL_7:
  double v14 = [(ConversationViewControllerBase *)self contactStore];
  double v33 = [v8 preferredSenderDisplayNameWithContactStore:v14];

  double v15 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v17 = [v8 unseenCount];
  }
  else {
    id v17 = 0;
  }
  int64_t v18 = [(ConversationViewControllerBase *)self totalUnfilteredMessageCount];
  if ([(ConversationViewControllerBase *)self isMessageListUnfiltered]) {
    int64_t v19 = 0;
  }
  else {
    int64_t v19 = [(ConversationViewControllerBase *)self countOfMessages];
  }
  double v20 = [(ConversationViewControllerBase *)self senderHeaderViewAnimator];
  [v20 updateHeaderWithExpansionStatus:a4];

  if (v13)
  {
    [(ConversationSenderHeaderViewModel *)v13 setForceCollapsed:[(ConversationViewControllerBase *)self forceCollapsedSenderHeader]];
    [(ConversationSenderHeaderViewModel *)v13 updateSubtitleInformationWithBucket:v7 isBucketSelected:[(ConversationViewControllerBase *)self isBucketSelected] categoryMessageCount:v19 totalMessageCount:v18 unreadMessageCount:0 newMessageCount:v17];
  }
  else
  {
    double v21 = [_TtC10MobileMail33ConversationSenderHeaderViewModel alloc];
    BOOL v22 = [(ConversationViewControllerBase *)self isBucketSelected];
    LOBYTE(v32) = [(ConversationViewControllerBase *)self forceCollapsedSenderHeader];
    objc_super v13 = [(ConversationSenderHeaderViewModel *)v21 initWithItemID:v34 avatar:0 avatarType:0 title:v33 bucket:v7 isBucketSelected:v22 categoryMessageCount:v19 totalMessageCount:v18 newMessageCount:v17 unreadMessageCount:0 forceCollapsed:v32 headerColors:0];
  }
  [(ConversationViewControllerBase *)self _updateSenderHeaderView:v35 viewModel:v13 expansionStatus:a4];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v23 = objc_alloc((Class)MUIAvatarImageContext);
  double v24 = [(ConversationViewControllerBase *)self contactStore];
  double v25 = [(ConversationViewControllerBase *)self scene];
  double v26 = [v25 brandIndicatorProvider];
  id v27 = [v23 initWithMessageListItem:v8 contactStore:v24 brandIndicatorProvider:v26];

  double v28 = [(ConversationViewControllerBase *)self avatarGenerator];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000994C8;
  v36[3] = &unk_100606100;
  objc_copyWeak(&v39, &location);
  id v29 = v35;
  id v37 = v29;
  double v30 = v13;
  id v38 = v30;
  id v31 = [v28 avatarImageForContext:v27 handler:v36];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);
}

- (void)_updateSenderHeaderView:(id)a3 viewModel:(id)a4 expansionStatus:(int64_t)a5
{
  id v8 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 updateWith:v7 expansionStatus:a5];
  }
  else {
    [v8 updateWith:v7];
  }
}

- (void)_updateTitle
{
  uint64_t v3 = [(ConversationViewControllerBase *)self countOfMessages];
  id v4 = [(ConversationViewControllerBase *)self navigationItem];
  [v4 setTitleView:0];

  v52 = [(ConversationViewControllerBase *)self scene];
  unsigned int v5 = [(ConversationViewControllerBase *)self shouldShowExpandableDigestHeaderView];
  unsigned int v53 = [(ConversationViewControllerBase *)self shouldShowStaticDigestHeaderView];
  if ((v5 | v53) == 1)
  {
    if (v5) {
      [(ConversationViewControllerBase *)self expandableSenderHeaderView];
    }
    else {
    id WeakRetained = [(ConversationViewControllerBase *)self staticSenderHeaderView];
    }
    objc_super v13 = [WeakRetained superview];

    if (!v13)
    {
      double v14 = [(ConversationViewControllerBase *)self view];
      [v14 addSubview:WeakRetained];

      unsigned __int8 v51 = [(ConversationViewControllerBase *)self senderHeaderLayoutGuide];
      id v50 = [WeakRetained topAnchor];
      v47 = [v51 topAnchor];
      id v48 = [v50 constraintEqualToAnchor:];
      v60[0] = v48;
      id v49 = [WeakRetained leadingAnchor];
      double v15 = [v51 leadingAnchor];
      double v16 = [v49 constraintEqualToAnchor:v15];
      v60[1] = v16;
      id v17 = [WeakRetained trailingAnchor];
      int64_t v18 = [v51 trailingAnchor];
      int64_t v19 = [v17 constraintEqualToAnchor:v18];
      v60[2] = v19;
      double v20 = +[NSArray arrayWithObjects:v60 count:3];
      +[NSLayoutConstraint activateConstraints:v20];

      [WeakRetained recalculateHeights];
    }
    if (v5)
    {
      id v12 = [(ConversationViewControllerBase *)self tapGestureTitleView];
      int64_t v21 = [(ConversationViewControllerBase *)self initialSenderHeaderExpansionStatus];
      if ((unint64_t)(v21 - 1) <= 1) {
        [(ConversationViewControllerBase *)self setInitialSenderHeaderExpansionStatus:0];
      }
      if ([(ConversationViewControllerBase *)self forceCollapsedSenderHeader]) {
        uint64_t v22 = 2;
      }
      else {
        uint64_t v22 = v21;
      }
    }
    else
    {
      uint64_t v22 = 0;
      id v12 = 0;
    }
    [(ConversationViewControllerBase *)self _configureSenderHeaderView:WeakRetained expansionStatus:v22];
    id v11 = 0;
    goto LABEL_21;
  }
  if (v3 < 1
    || ([(ConversationViewControllerBase *)self barItemsManager],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 useDesktopClassNavigationBar],
        v6,
        (v7 & 1) != 0))
  {
    id WeakRetained = +[ConversationViewController log];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(ConversationViewControllerBase *)self referenceMessageListItem];
      unsigned __int8 v10 = [v9 ef_publicDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Skip title update, message count is 0, referenceMessage=%@", buf, 0xCu);
    }
    id v11 = 0;
LABEL_9:
    id v12 = 0;
    goto LABEL_21;
  }
  if (![(ConversationViewControllerBase *)self isPrimary])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      id v11 = [WeakRetained titleForSingletonConversationViewController:self];
    }
    else
    {
      id v11 = 0;
    }
    double v44 = +[ConversationViewController log];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = (uint64_t)WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Get title from delegate: %@", buf, 0xCu);
    }

    id v45 = [(ConversationViewControllerBase *)self conversationHeaderView];
    [v45 setDelegate:0];

    goto LABEL_9;
  }
  double v26 = +[NSBundle mainBundle];
  id v27 = [v26 localizedStringForKey:@"MESSAGE_COUNT_FORMAT%1$lu" value:&stru_100619928 table:@"Main"];
  id WeakRetained = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v3);

  unsigned int v28 = [(ConversationViewControllerBase *)self _isDisplayingSingleMessage];
  if (v28) {
    id v29 = 0;
  }
  else {
    id v29 = WeakRetained;
  }
  id v11 = v29;
  if ([(ConversationViewControllerBase *)self _shouldShowConversationHeader])
  {
    double v30 = [(ConversationViewControllerBase *)self conversationHeaderView];

    if (!v30)
    {
      id v31 = [(ConversationViewControllerBase *)self view];
      [v31 frame];
      double Width = CGRectGetWidth(v61);

      double v33 = -[ConversationHeaderView initWithFrame:]([ConversationHeaderView alloc], "initWithFrame:", 0.0, 0.0, Width, 0.0);
      [(ConversationViewControllerBase *)self setConversationHeaderView:v33];
    }
    double v34 = [(ConversationViewControllerBase *)self conversationHeaderView];
    [v34 setDelegate:self];

    id v35 = [(ConversationViewControllerBase *)self conversationSubject];
    id v36 = +[ECSubjectFormatter subjectStringForDisplayForSubject:v35 style:1];

    id v37 = [(ConversationViewControllerBase *)self conversationHeaderView];
    id v38 = [v37 title];
    unsigned __int8 v39 = [v38 isEqualToString:v36];

    if ((v39 & 1) == 0)
    {
      id v40 = [(ConversationViewControllerBase *)self conversationHeaderView];
      [v40 setCollapsed:0 animated:0];
    }
    id v41 = +[ConversationViewController log];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v55 = v3;
      __int16 v56 = 1024;
      unsigned int v57 = v28;
      __int16 v58 = 1024;
      BOOL v59 = v36 != 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Update conversation header view (messageCount=%ld, isDisplayingSingleMessage=%{BOOL}d, hasTrimmedSubject=%{BOOL}d)", buf, 0x18u);
    }

    id v42 = [(ConversationViewControllerBase *)self conversationHeaderView];
    [v42 setSuperTitle:v11];

    double v43 = [(ConversationViewControllerBase *)self conversationHeaderView];
    [v43 setTitle:v36];

    id v12 = [(ConversationViewControllerBase *)self conversationHeaderView];
  }
  else
  {
    v46 = +[ConversationViewController log];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v55 = v3;
      __int16 v56 = 1024;
      unsigned int v57 = v28;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Update title (messageCount=%ld, isDisplayingSingleMessage=%{BOOL}d)", buf, 0x12u);
    }

    id v36 = [(ConversationViewControllerBase *)self conversationHeaderView];
    id v12 = 0;
    [v36 setDelegate:0];
  }

LABEL_21:
  if ((v5 & 1) == 0)
  {
    id v23 = [(ConversationViewControllerBase *)self expandableSenderHeaderView];
    [v23 removeFromSuperview];
  }
  if ((v53 & 1) == 0)
  {
    double v24 = [(ConversationViewControllerBase *)self staticSenderHeaderView];
    [v24 removeFromSuperview];
  }
  [(ConversationViewControllerBase *)self setTitle:v11];
  double v25 = [(ConversationViewControllerBase *)self navigationItem];
  [v25 setTitleView:v12];

  [v52 mf_resetPreferredTitle];
}

- (_TtC10MobileMail34StaticConversationSenderHeaderView)staticSenderHeaderView
{
  staticSenderHeaderView = self->_staticSenderHeaderView;
  if (!staticSenderHeaderView)
  {
    id v4 = -[StaticConversationSenderHeaderView initWithFrame:]([_TtC10MobileMail34StaticConversationSenderHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    unsigned int v5 = self->_staticSenderHeaderView;
    self->_staticSenderHeaderView = v4;

    [(StaticConversationSenderHeaderView *)self->_staticSenderHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ConversationSenderHeaderView *)self->_staticSenderHeaderView setDelegate:self];
    staticSenderHeaderView = self->_staticSenderHeaderView;
  }

  return staticSenderHeaderView;
}

- (_TtC10MobileMail38ExpandableConversationSenderHeaderView)expandableSenderHeaderView
{
  expandableSenderHeaderView = self->_expandableSenderHeaderView;
  if (!expandableSenderHeaderView)
  {
    id v4 = -[ExpandableConversationSenderHeaderView initWithFrame:]([_TtC10MobileMail38ExpandableConversationSenderHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    unsigned int v5 = self->_expandableSenderHeaderView;
    self->_expandableSenderHeaderView = v4;

    [(ExpandableConversationSenderHeaderView *)self->_expandableSenderHeaderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ConversationSenderHeaderView *)self->_expandableSenderHeaderView setDelegate:self];
    expandableSenderHeaderView = self->_expandableSenderHeaderView;
  }

  return expandableSenderHeaderView;
}

- (_TtC10MobileMail36ConversationSenderHeaderViewAnimator)senderHeaderViewAnimator
{
  if ([(ConversationViewControllerBase *)self shouldShowExpandableDigestHeaderView])
  {
    senderHeaderViewAnimator = self->_senderHeaderViewAnimator;
    if (!senderHeaderViewAnimator)
    {
      id v4 = [_TtC10MobileMail36ConversationSenderHeaderViewAnimator alloc];
      unsigned int v5 = [(ConversationViewControllerBase *)self expandableSenderHeaderView];
      id v6 = [(ConversationSenderHeaderViewAnimator *)v4 initWithHeaderView:v5];
      unsigned __int8 v7 = self->_senderHeaderViewAnimator;
      self->_senderHeaderViewAnimator = v6;

      [(ConversationSenderHeaderViewAnimator *)self->_senderHeaderViewAnimator setDelegate:self];
      senderHeaderViewAnimator = self->_senderHeaderViewAnimator;
    }
    id v8 = senderHeaderViewAnimator;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (_UINavigationBarTitleView)tapGestureTitleView
{
  tapGestureTitleView = self->_tapGestureTitleView;
  if (!tapGestureTitleView)
  {
    id v4 = [_UINavigationBarTitleView initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    unsigned int v5 = self->_tapGestureTitleView;
    self->_tapGestureTitleView = v4;

    id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"tappedSenderHeader:"];
    [(_UINavigationBarTitleView *)self->_tapGestureTitleView addGestureRecognizer:v6];

    tapGestureTitleView = self->_tapGestureTitleView;
  }

  return tapGestureTitleView;
}

- (void)tappedSenderHeader:(id)a3
{
  id v3 = [(ConversationViewControllerBase *)self senderHeaderViewAnimator];
  [v3 updateHeaderWithExpansionStatus:1];
}

- (id)mf_preferredTitle
{
  id v2 = [(ConversationViewControllerBase *)self conversationSubject];
  id v3 = +[ECSubjectFormatter subjectStringForDisplayForSubject:v2 style:0];

  return v3;
}

- (BOOL)_shouldShowConversationHeader
{
  BOOL v3 = [(ConversationViewControllerBase *)self isPrimary];
  id v4 = [(ConversationViewControllerBase *)self conversationSubject];
  unsigned int v5 = [v4 subjectWithoutPrefix];
  id v6 = [v5 length];

  return v6 && v3;
}

- (id)_visibleNavigationBar
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned __int8 v10 = sub_100096B1C;
  id v11 = sub_100096B2C;
  id v12 = (id)0xAAAAAAAAAAAAAAAALL;
  BOOL v3 = [(ConversationViewControllerBase *)self navigationController];
  id v12 = [v3 navigationBar];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009A584;
  v6[3] = &unk_100606128;
  v6[4] = &v7;
  [(ConversationViewControllerBase *)self _executeIfSplitViewIsAvailable:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_updateConversationHeaderViewLayoutMarginsWithSuperviewMargins:(NSDirectionalEdgeInsets)a3
{
  [(ConversationHeaderView *)self->_conversationHeaderView directionalLayoutMargins];
  conversationHeaderView = self->_conversationHeaderView;

  [(ConversationHeaderView *)conversationHeaderView setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
}

- (void)updateNavigationItemChromelessConfiguration
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10009AA5C;
  v23[3] = &unk_1006047A0;
  v23[4] = self;
  BOOL v3 = objc_retainBlock(v23);
  if (_os_feature_enabled_impl()) {
    int v4 = EMIsGreymatterAvailableWithOverride();
  }
  else {
    int v4 = 0;
  }
  if ([(ConversationViewControllerBase *)self shouldShowExpandableDigestHeaderView]|| [(ConversationViewControllerBase *)self shouldShowStaticDigestHeaderView])
  {
    unsigned int v5 = objc_opt_new();
    [v5 configureWithTransparentBackground];
    id v6 = [(ConversationViewControllerBase *)self navigationItem];
    [v6 setStandardAppearance:v5];
    [v6 setScrollEdgeAppearance:v5];
    [v6 setCompactAppearance:v5];
    [v6 setCompactScrollEdgeAppearance:v5];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    ((void (*)(void *))v3[2])(v3);
    unsigned int v5 = objc_opt_new();
    id v6 = [(ConversationViewControllerBase *)self navigationItem];
    [v6 setScrollEdgeAppearance:v5];
    goto LABEL_7;
  }
  if (!+[UIDevice mf_isPad]
    || ([(ConversationViewControllerBase *)self traitCollection],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 horizontalSizeClass],
        v7,
        v8 != (id)2))
  {
    ((void (*)(void *))v3[2])(v3);
    double v14 = [(ConversationViewControllerBase *)self navigationController];
    double v15 = [v14 navigationBar];
    double v16 = [v15 standardAppearance];
    id v17 = [(ConversationViewControllerBase *)self navigationController];
    int64_t v18 = [v17 navigationBar];
    [v18 setScrollEdgeAppearance:v16];

    int64_t v19 = [(ConversationViewControllerBase *)self navigationItem];
    [v19 _setManualScrollEdgeAppearanceEnabled:0];

    if (![(ConversationViewControllerBase *)self allowQuickReply]) {
      goto LABEL_9;
    }
    unsigned int v5 = [(ConversationViewControllerBase *)self navigationController];
    id v6 = [v5 toolbar];
    double v20 = [v6 standardAppearance];
    int64_t v21 = [(ConversationViewControllerBase *)self navigationController];
    uint64_t v22 = [v21 toolbar];
    [v22 setScrollEdgeAppearance:v20];

    goto LABEL_7;
  }
  ((void (*)(void *))v3[2])(v3);
  uint64_t v9 = [(ConversationViewControllerBase *)self navigationController];
  uint64_t v10 = [v9 navigationBar];
  [(id)v10 setScrollEdgeAppearance:0];

  id v11 = [(ConversationViewControllerBase *)self navigationItem];
  LOBYTE(v10) = [v11 _isManualScrollEdgeAppearanceEnabled];

  if (v10) {
    goto LABEL_9;
  }
  id v12 = [(ConversationViewControllerBase *)self navigationItem];
  [v12 _setAutoScrollEdgeTransitionDistance:1.0];

  objc_super v13 = [(ConversationViewControllerBase *)self navigationItem];
  [v13 _setManualScrollEdgeAppearanceProgress:1.0];

  unsigned int v5 = [(ConversationViewControllerBase *)self navigationItem];
  [v5 _setManualScrollEdgeAppearanceEnabled:1];
LABEL_8:

LABEL_9:
}

- (void)_reloadPreparedCells
{
  BOOL v3 = +[NSMutableSet set];
  int v4 = [(ConversationViewControllerBase *)self cellConfigurator];
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_10009AC0C;
  uint64_t v10 = &unk_100606150;
  id v11 = self;
  id v5 = v3;
  id v12 = v5;
  [v4 enumeratePreparedCellsWithBlock:&v7];

  id v6 = [v5 allObjects];
  [(ConversationViewControllerBase *)self _reloadCellsAtIndexPaths:v6 animated:1];
}

- (void)_updateCells
{
  unsigned __int8 v3 = [(ConversationViewControllerBase *)self _isDisplayingSingleMessage];
  int v4 = +[NSMutableSet set];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v5 = [(ConversationViewControllerBase *)self collectionView];
  id v6 = [(ConversationViewControllerBase *)self cellConfigurator];
  double v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  uint64_t v22 = sub_10009B074;
  id v23 = &unk_100606178;
  double v26 = &v28;
  id v7 = v5;
  id v24 = v7;
  unsigned __int8 v27 = v3;
  id v8 = v4;
  id v25 = v8;
  [v6 enumerateExpandedCellsWithBlock:&v20];

  uint64_t v9 = +[ConversationViewController log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [v8 count];
    uint64_t v18 = v29[3];
    int64_t v19 = [(ConversationViewControllerBase *)self countOfMessages];
    *(_DWORD *)buf = 134218496;
    id v33 = v17;
    __int16 v34 = 2048;
    uint64_t v35 = v18;
    __int16 v36 = 2048;
    int64_t v37 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "_updateCells reloadIndexPath.count:%lu expandedCellCount:%lu countOfMessages:%li", buf, 0x20u);
  }

  if ([v8 count])
  {
    uint64_t v10 = [v8 allObjects];
    [(ConversationViewControllerBase *)self _reloadCellsAtIndexPaths:v10 animated:1];
LABEL_5:

    goto LABEL_7;
  }
  if (!v29[3] && [(ConversationViewControllerBase *)self countOfMessages] >= 1)
  {
    uint64_t v10 = [(ConversationViewControllerBase *)self _indexPathForReferenceMessage];
    id v11 = +[ConversationViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100458E34((uint64_t)v10, v11);
    }

    if (v10)
    {
      id v12 = [(ConversationViewControllerBase *)self _messageItemIDAtIndexPath:v10];
      objc_super v13 = [(ConversationViewControllerBase *)self cellConfigurator];
      double v14 = [v13 expansionTracker];
      id v15 = [v14 expansionStatusForCellWithItemID:v12];

      if (v15 == (id)3)
      {
        double v16 = [(ConversationViewControllerBase *)self cellConfigurator];
        [v16 expandCellAtIndexPath:v10 animated:0 highlightFirst:0];
      }
    }
    goto LABEL_5;
  }
LABEL_7:

  _Block_object_dispose(&v28, 8);
}

- (void)_reloadCellsAtIndexPaths:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _reloadCellsAtIndexPaths:animated:]", "ConversationViewControllerBase.m", 1573, "0");
}

- (void)_invalidateQuickReplyFooter
{
  id v3 = objc_alloc_init((Class)UICollectionViewFlowLayoutInvalidationContext);
  int v4 = +[NSIndexPath indexPathForItem:0 inSection:0];
  id v11 = v4;
  id v5 = +[NSArray arrayWithObjects:&v11 count:1];
  [v3 invalidateSupplementaryElementsOfKind:UICollectionElementKindSectionFooter atIndexPaths:v5];

  [(ConversationViewControllerBase *)self collectionView];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009B330;
  v8[3] = &unk_100604618;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  id v10 = v6;
  id v7 = v9;
  [v7 performBatchUpdates:v8 completion:0];
}

- (void)updateUserActivityState:(id)a3
{
  id v3 = [(ConversationViewControllerBase *)self handoffCoordinator];
  [v3 updateUserActivityState];
}

- (id)_indexPathForTopMostVisibleRow
{
  id v3 = [(ConversationViewControllerBase *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  id v6 = [(ConversationViewControllerBase *)self collectionView];
  [v6 contentOffset];
  double v8 = v7;
  id v9 = [(ConversationViewControllerBase *)self collectionView];
  [v9 contentInset];
  double v11 = v8 + v10;

  id v12 = [(ConversationViewControllerBase *)self collectionView];
  [v12 indexPathForItemAtPoint:v5 * 0.5, v11];

  return v13;
}

- (void)setPinnedItem:(id)a3
{
  id v4 = a3;
  if ([(ConversationViewControllerBase *)self disableScrollPinning])
  {
    double v5 = +[ConversationViewController log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pinning is disabled. This is for testing purposes only.", (uint8_t *)&v11, 2u);
    }

    id v4 = 0;
  }
  p_pinnedItem = &self->_pinnedItem;
  if (![(PinnedConversationItem *)*p_pinnedItem isEqual:v4])
  {
    if (*p_pinnedItem)
    {
      double v7 = +[ConversationViewController log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        double v8 = [(PinnedConversationItem *)*p_pinnedItem ef_publicDescription];
        int v11 = 138412290;
        id v12 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unpinning %@", (uint8_t *)&v11, 0xCu);
      }
    }
    if (v4)
    {
      id v9 = +[ConversationViewController log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = [v4 ef_publicDescription];
        int v11 = 138412290;
        id v12 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Pinning to %@", (uint8_t *)&v11, 0xCu);
      }
    }
    objc_storeStrong((id *)p_pinnedItem, v4);
  }
}

- (void)_restorePinnedScrollPosition
{
  id v6 = [(ConversationViewControllerBase *)self pinnedItem];
  id v3 = [v6 indexPath];
  if (v6)
  {
    if (v3)
    {
      id v4 = [v6 dynamicOffset];

      if (v4)
      {
        double v5 = [v6 dynamicOffset];
        [(ConversationViewControllerBase *)self _scrollToItemAtIndexPath:v3 dynamicOffset:v5 shouldAdjustToShowPreviousMessage:1 animated:0 pin:0 completion:0];
      }
    }
  }
}

- (void)_maybeAttemptLoadMissingMessages:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [(ConversationViewControllerBase *)self conversationSortOrder];
  if ([v11 isTracking]) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = [v11 isDecelerating];
  }
  [v11 _verticalVelocity];
  double v7 = v6;
  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = -v7;
  if (v4 == 1) {
    double v9 = v7;
  }
  if (v5)
  {
    if (v9 > 0.0 && v8 >= self->_nextAvailableLoadMoreInterval) {
      [(ConversationViewControllerBase *)self _attemptLoadMissingMessages];
    }
  }
}

- (void)_attemptLoadMissingMessages
{
  id v4 = [(ConversationViewControllerBase *)self _oldestIndexPath];
  if (v4) {
    [(ConversationViewControllerBase *)self _loadMoreMessagesWithMaxVisibleIndexPath:v4];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  self->_nextAvailableLoadMoreInterval = v3 + 0.5;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  [(ConversationViewControllerBase *)self setPinnedItem:0];
  id v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
  [(ConversationViewControllerBase *)self _updateHandoffWithMessageAtIndexPath:v4];

  [(ConversationViewControllerBase *)self mf_updateAlertSuppressionContextsForReason:@"scrolled to top"];
  if (![(ConversationViewControllerBase *)self conversationSortOrder])
  {
    [(ConversationViewControllerBase *)self _attemptLoadMissingMessages];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v6 = a3;
  [(ConversationViewControllerBase *)self mf_updateAlertSuppressionContextsForReason:@"begin Dragging"];
  [(ConversationViewControllerBase *)self setPinnedItem:0];
  if ([(ConversationViewControllerBase *)self shouldShowExpandableDigestHeaderView]&& ![(ConversationViewControllerBase *)self forceCollapsedSenderHeader])
  {
    [(ConversationViewControllerBase *)self setResizingState:3];
    id v4 = [(ConversationViewControllerBase *)self senderHeaderViewAnimator];
    [v4 scrollViewWillBeginDragging:v6];
  }
  unsigned int v5 = [(ConversationViewControllerBase *)self conversationHeaderView];
  [v5 hostScrollViewWillBeginDragging:v6];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  double v9 = -y;
  if (y >= 0.0) {
    double v9 = y;
  }
  if (v9 < 0.00000011920929)
  {
    [(ConversationViewControllerBase *)self pinCurrentItem];
    double v10 = [(ConversationViewControllerBase *)self handoffCoordinator];
    [v10 updateHandoffMessageBasedOnMessageVisibility];

    [(ConversationViewControllerBase *)self updateArrowControlsView];
  }
  if ([(ConversationViewControllerBase *)self shouldShowExpandableDigestHeaderView]&& ![(ConversationViewControllerBase *)self forceCollapsedSenderHeader])
  {
    [(ConversationViewControllerBase *)self setResizingState:0];
    id v11 = [(ConversationViewControllerBase *)self senderHeaderViewAnimator];
    [v11 scrollViewWillEndDragging:v12 withVelocity:a5 targetContentOffset:x, y];
  }
  else
  {
    id v11 = [(ConversationViewControllerBase *)self conversationHeaderView];
    [v11 hostScrollViewWillEndDragging:v12 withVelocity:a5 targetContentOffset:x, y];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v6 = a3;
  [(ConversationViewControllerBase *)self pinCurrentItem];
  [(ConversationViewControllerBase *)self _shrinkBottomPaddingIfNecessary];
  id v4 = [(ConversationViewControllerBase *)self handoffCoordinator];
  [v4 updateHandoffMessageBasedOnMessageVisibility];

  [(ConversationViewControllerBase *)self updateArrowControlsView];
  [(ConversationViewControllerBase *)self mf_updateAlertSuppressionContextsForReason:@"ended decelerating"];
  if ([(ConversationViewControllerBase *)self _scrollViewIsScrolledToEnd:v6]
    && [(ConversationViewControllerBase *)self _isDisplayingSingleMessage])
  {
    [(ConversationViewControllerBase *)self _scrolledToEndOfSingleMessage];
  }
  unsigned int v5 = [(ConversationViewControllerBase *)self conversationHeaderView];
  [v5 hostScrollViewDidEndDecelerating:v6];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  if (!a4) {
    [(ConversationViewControllerBase *)self _shrinkBottomPaddingIfNecessary];
  }
  [(ConversationViewControllerBase *)self mf_updateAlertSuppressionContextsForReason:@"ended dragging"];
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = [(ConversationViewControllerBase *)self expandableSenderHeaderView];
  unsigned int v5 = [v4 superview];
  if (!v5) {
    goto LABEL_4;
  }
  unsigned __int8 v6 = [(ConversationViewControllerBase *)self forceCollapsedSenderHeader];

  if ((v6 & 1) == 0)
  {
    id v4 = [(ConversationViewControllerBase *)self senderHeaderViewAnimator];
    [v4 updateHeaderWithExpansionStatus:1];
LABEL_4:
  }
  return 1;
}

- (void)_shrinkBottomPaddingIfNecessary
{
  if (![(ConversationViewControllerBase *)self _isDisplayingSingleMessage])
  {
    id v10 = [(ConversationViewControllerBase *)self collectionView];
    [v10 _contentScrollInset];
    double v4 = v3;
    if (v3 > 0.00000011920929)
    {
      [v10 visibleBounds];
      double MaxY = CGRectGetMaxY(v12);
      [v10 contentInset];
      double v7 = v6;
      [v10 contentSize];
      double v9 = MaxY - v7 - v8;
      if (v9 < 0.0) {
        double v9 = 0.0;
      }
      if (v4 - v9 > 0.00000011920929)
      {
        *(unsigned char *)&self->_flags |= 8u;
        -[ConversationViewControllerBase _setBottomPadding:](self, "_setBottomPadding:");
      }
    }
  }
}

- (void)_scrollToItemAtIndexPath:(id)a3 dynamicOffset:(id)a4 shouldAdjustToShowPreviousMessage:(BOOL)a5 animated:(BOOL)a6 pin:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v29 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  double v16 = +[ConversationViewController log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v13 section];
    id v18 = [v13 item];
    int64_t v19 = [v14 ef_publicDescription];
    *(_DWORD *)buf = 134219010;
    id v34 = v17;
    __int16 v35 = 2048;
    id v36 = v18;
    __int16 v37 = 2112;
    id v38 = v19;
    __int16 v39 = 1024;
    BOOL v40 = v10;
    __int16 v41 = 1024;
    BOOL v42 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scroll to item at index path {%ld, %ld}, dynamicOffset: %@, animated: %{BOOL}d, pin:%{BOOL}d", buf, 0x2Cu);
  }
  [(ConversationViewControllerBase *)self _ensureSubjectViewLayoutIfNeededAtIndexPath:v13];
  if (v9 && ![(ConversationViewControllerBase *)self disableScrollPinning])
  {
    [(ConversationViewControllerBase *)self pinItemAtIndexPath:v13 dynamicOffset:v14];
    if ((uint64_t)[v13 item] >= 1)
    {
      *(unsigned char *)&self->_flags &= ~8u;
      [(ConversationViewControllerBase *)self _updateBottomPadding];
    }
  }
  [(ConversationViewControllerBase *)self _updateHandoffWithMessageAtIndexPath:v13];
  [(ConversationViewControllerBase *)self updateArrowControlsView];
  if (!self->_pagingAnimator)
  {
    double v20 = [MFCollectionViewPagingAnimator alloc];
    uint64_t v21 = [(ConversationViewControllerBase *)self collectionView];
    uint64_t v22 = [(MFCollectionViewPagingAnimator *)v20 initWithCollectionView:v21];
    pagingAnimator = self->_pagingAnimator;
    self->_pagingAnimator = v22;
  }
  id v24 = [(ConversationViewControllerBase *)self traitCollection];
  if (objc_msgSend(v24, "mf_hasCompactDimension")) {
    double v25 = -8.0;
  }
  else {
    double v25 = 5.0;
  }

  [(ConversationViewControllerBase *)self _autoscrollAdjustmentWithBaseOffset:10.0];
  -[MFCollectionViewPagingAnimator setAutoScrollOffsetAdjustment:](self->_pagingAnimator, "setAutoScrollOffsetAdjustment:");
  [(ConversationViewControllerBase *)self _autoscrollAdjustmentWithBaseOffset:v25];
  [(MFCollectionViewPagingAnimator *)self->_pagingAnimator setAutoScrollOffsetAdjustmentWithoutPreviousMessage:"setAutoScrollOffsetAdjustmentWithoutPreviousMessage:"];
  double v26 = self->_pagingAnimator;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10009C394;
  v30[3] = &unk_1006061A0;
  v30[4] = self;
  id v27 = v13;
  id v31 = v27;
  id v28 = v15;
  id v32 = v28;
  [(MFCollectionViewPagingAnimator *)v26 scrollToItemAtIndexPath:v27 dynamicOffset:v14 shouldAdjustToShowPreviousMessage:v29 animated:v10 completion:v30];
}

- (id)_layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  [(ConversationViewControllerBase *)self _ensureSubjectViewLayoutIfNeededAtIndexPath:v4];
  unsigned int v5 = [(ConversationViewControllerBase *)self collectionView];
  double v6 = [v5 layoutAttributesForItemAtIndexPath:v4];

  return v6;
}

- (void)_ensureSubjectViewLayoutIfNeededAtIndexPath:(id)a3
{
}

- (void)_resetBottomPaddingIfDisplayingSingleMessage
{
  if ([(ConversationViewControllerBase *)self _isDisplayingSingleMessage])
  {
    [(ConversationViewControllerBase *)self _setBottomPadding:0.0];
  }
}

- (void)_updateBottomPadding
{
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    uint64_t v3 = [(ConversationViewControllerBase *)self countOfMessages];
    if (v3 >= 1)
    {
      id v7 = +[NSIndexPath indexPathForItem:v3 - 1 inSection:0];
      id v4 = [(ConversationViewControllerBase *)self cellConfigurator];
      [v4 sizeForItemAtIndexPath:v7];
      double v6 = v5;

      [(ConversationViewControllerBase *)self _updateBottomPaddingWithLastItemHeight:v6];
    }
  }
}

- (void)_updateBottomPaddingWithLastItemHeight:(double)a3
{
  unsigned __int8 v5 = [(ConversationViewControllerBase *)self _isDisplayingSingleMessage];
  double v6 = 0.0;
  if ((v5 & 1) == 0)
  {
    id v7 = [(ConversationViewControllerBase *)self collectionView];
    [v7 mf_visibleHeight];
    double v9 = v8;

    [(ConversationViewControllerBase *)self _autoscrollAdjustmentWithBaseOffset:10.0];
    double v6 = v9 - (fmax(a3, 276.0) + v10);
  }

  [(ConversationViewControllerBase *)self _setBottomPadding:v6];
}

- (void)_setBottomPadding:(double)a3
{
  if (!_os_feature_enabled_impl()
    || ![(ConversationViewControllerBase *)self isPerformingQuickReplySendAnimation])
  {
    id v12 = [(ConversationViewControllerBase *)self collectionView];
    [v12 _contentScrollInset];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    id v13 = [(ConversationViewControllerBase *)self collectionView];
    UIRoundToViewScale();
    double v11 = v10;

    id v14 = [(ConversationViewControllerBase *)self collectionView];
    [v14 _setContentScrollInset:v5, v7, fmax(v11, 0.0), v9];
  }
}

- (void)cellConfigurator:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5
{
  double v7 = (ConversationViewControllerBase *)a4;
  id v8 = a5;
  double v9 = +[ConversationViewController log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138543874;
    uint64_t v23 = objc_opt_class();
    __int16 v24 = 2048;
    double v25 = v7;
    __int16 v26 = 2114;
    uint64_t v27 = (uint64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuring class:%{public}@ cell:%p indexPath:%{public}@", (uint8_t *)&v22, 0x20u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v10 = [(ConversationViewControllerBase *)self _shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:v8];
    double v11 = v7;
    id v12 = [v11 viewModel];
    [(ConversationViewControllerBase *)self _configureExpandedCell:v11 atIndexPath:v8 viewModel:v12 collapseQuotedContent:v10];

    id v13 = [v11 messageViewController];
    [(ConversationViewControllerBase *)self addChildViewController:v13];
    [v13 didMoveToParentViewController:self];
    int64_t v14 = [(ConversationViewControllerBase *)self resizingState];
    id v15 = [v13 messageContentView];
    [v15 setContentPaddingFollowsLayoutMargins:v14 != 2];

LABEL_10:
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v11 = v7;
    double v16 = [v11 viewModel];
    [(ConversationViewControllerBase *)self _configureCollapsedCell:v11 atIndexPath:v8 viewModel:v16];

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v11 = +[ConversationViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = objc_opt_class();
      int64_t v19 = [(ConversationViewControllerBase *)v7 viewModel];
      double v20 = [v19 messageContentRequest];
      uint64_t v21 = [v20 itemID];
      int v22 = 138413314;
      uint64_t v23 = v17;
      __int16 v24 = 2048;
      double v25 = self;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2114;
      id v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "<%@: %p> Cannot configure an unknown cell type %@ at indexPath %@ for itemID: %{public}@", (uint8_t *)&v22, 0x34u);
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (int64_t)cellConfigurator:(id)a3 expansionStatusForMessageAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(ConversationViewControllerBase *)self _indexPathForReferenceMessage];
  if (([v5 isEqual:v6] & 1) != 0
    || [(ConversationViewControllerBase *)self _isQuickReplyMessageAtIndexPath:v5]
    || [(ConversationViewControllerBase *)self _isUndoSendMessageAtIndexPath:v5])
  {
  }
  else
  {
    unsigned __int8 v8 = [(ConversationViewControllerBase *)self _isItemInitiallyUnreadAtIndexPath:v5];

    if ((v8 & 1) == 0)
    {
      int64_t v7 = 1;
      goto LABEL_11;
    }
  }
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList]
    && ![(ConversationViewControllerBase *)self _isDisplayingSingleMessage])
  {
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = 3;
  }
LABEL_11:

  return v7;
}

- (void)cellConfigurator:(id)a3 didInvalidateConfigurationForCellsAtIndexPaths:(id)a4
{
  id v5 = a4;
  double v6 = [(ConversationViewControllerBase *)self pinnedItem];
  int64_t v7 = [v6 indexPath];
  if (![(ConversationViewControllerBase *)self _isDisplayingSingleMessage] && v6 && v7)
  {
    [(ConversationViewControllerBase *)self setPinnedItem:0];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10009CDEC;
    v8[3] = &unk_1006061C8;
    id v9 = v5;
    BOOL v10 = self;
    id v11 = v7;
    id v12 = v6;
    +[UIView performWithoutAnimation:v8];
  }
}

- (id)cellConfigurator:(id)a3 targetHeightForExpandingCellAtIndexPath:(id)a4
{
  id v5 = [(ConversationViewControllerBase *)self _messageItemIDAtIndexPath:a4];
  double v6 = [(ConversationViewControllerBase *)self _currentSizeMetadataKey];
  int64_t v7 = +[NSString stringWithFormat:@"%@_%@", v5, v6];

  unsigned __int8 v8 = [(ConversationViewControllerBase *)self cellHeightCache];
  id v9 = [v8 objectForKey:v7];

  return v9;
}

- (id)cellConfigurator:(id)a3 messageItemIDAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase cellConfigurator:messageItemIDAtIndexPath:]", "ConversationViewControllerBase.m", 2007, "0");
}

- (void)cellConfigurator:(id)a3 wantsToReloadCellAtIndexPaths:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase cellConfigurator:wantsToReloadCellAtIndexPaths:animated:]", "ConversationViewControllerBase.m", 2011, "0");
}

- (id)_currentSizeMetadataKey
{
  uint64_t v3 = [(ConversationViewControllerBase *)self collectionView];
  [v3 mf_visibleBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.double x = v5;
  v19.origin.double y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  CGFloat Width = CGRectGetWidth(v19);
  id v13 = MFModernUIApplicationPreferredContentSizeCode();
  unsigned int v14 = [(ConversationViewControllerBase *)self _isDisplayingSingleMessage];
  CFStringRef v15 = @"conversation";
  if (v14) {
    CFStringRef v15 = @"single";
  }
  double v16 = +[NSString stringWithFormat:@"v%@-w%.1f-s%@-%@", @"1.0", *(void *)&Width, v13, v15];

  return v16;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  if ([(ConversationViewControllerBase *)self allowQuickReply]
    && [(ConversationViewControllerBase *)self didCompleteFirstPaint]
    && (id)[(ConversationViewControllerBase *)self conversationSortOrder] == (id)1)
  {
    [(ConversationViewControllerBase *)self quickReplyHeight];
    double v7 = v6;
    [(ConversationViewControllerBase *)self _itemSpacing];
    double height = v7 + v8;
    double width = 0.0;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  if ([(ConversationViewControllerBase *)self allowQuickReply]
    && [(ConversationViewControllerBase *)self didCompleteFirstPaint]
    && ![(ConversationViewControllerBase *)self conversationSortOrder])
  {
    [(ConversationViewControllerBase *)self quickReplyHeight];
    double v9 = v8;
    [(ConversationViewControllerBase *)self _itemSpacing];
    double height = v9 + v10;
    double width = 0.0;
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v6 = a5;
  [(MFConversationCellConfigurator *)self->_cellConfigurator sizeForItemAtIndexPath:v6];
  double v8 = v7;
  double v10 = v9;
  if (v9 < 0.0)
  {
    CGFloat v11 = +[ConversationViewController log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100458F20();
    }

    double v10 = 0.0;
  }
  if (v8 < 0.0)
  {
    id v12 = +[ConversationViewController log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100458EAC();
    }

    double v8 = 0.0;
  }

  double v13 = v8;
  double v14 = v10;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (double)_minimumItemHeight
{
  id v2 = [(ConversationViewControllerBase *)self displayMetrics];
  +[MFCollapsedMessageCell defaultHeightWithDisplayMetrics:v2];
  double v4 = v3 + 180.0;

  return v4;
}

- (double)_autoscrollAdjustmentWithBaseOffset:(double)a3
{
  [(ConversationViewControllerBase *)self _itemSpacing];
  double v6 = v5;
  double v7 = [(ConversationViewControllerBase *)self previewState];
  double v8 = v6 + a3;
  if ([v7 shouldScheduleMarkMessageAsRead])
  {
    unsigned int v9 = [(ConversationViewControllerBase *)self _shouldShowConversationHeader];

    if (v9)
    {
      [(ConversationHeaderView *)self->_conversationHeaderView frame];
      CGFloat r2 = v10;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      uint64_t v17 = [(ConversationViewControllerBase *)self _visibleNavigationBar];
      [v17 bounds];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;

      v34.origin.CGFloat x = v19;
      v34.origin.CGFloat y = v21;
      v34.size.CGFloat width = v23;
      v34.size.CGFloat height = v25;
      v37.origin.CGFloat x = r2;
      v37.origin.CGFloat y = v12;
      v37.size.CGFloat width = v14;
      v37.size.CGFloat height = v16;
      CGRect v35 = CGRectIntersection(v34, v37);
      CGFloat x = v35.origin.x;
      CGFloat y = v35.origin.y;
      CGFloat width = v35.size.width;
      CGFloat height = v35.size.height;
      [(ConversationHeaderView *)self->_conversationHeaderView contentHeight];
      double v31 = v30;
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = y;
      v36.size.CGFloat width = width;
      v36.size.CGFloat height = height;
      return v8 + v31 - CGRectGetHeight(v36);
    }
  }
  else
  {
  }
  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  [(ConversationViewControllerBase *)self _toggleCellGroupOpacityIfNeeded:v16 displaying:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v8 = [(MFSwipableCollectionViewLayout *)self->_conversationLayout expandingIndexPath];
    id v9 = [v7 compare:v8];

    if (!v9)
    {
      double v10 = [v16 layer];
      [v10 setAllowsGroupOpacity:0];
    }
  }
  double v11 = [v16 viewModel];
  CGFloat v12 = [v11 messageContentRequest];

  if (v12)
  {
    double v13 = [v16 viewModel];
    CGFloat v14 = [v13 messageContentRequest];
    double v15 = [v14 message];
    [v16 associateViewWithEntityFromMessageItem:v15];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v9;
    CGFloat v12 = [v11 viewModel];
    double v13 = [v12 messageContentRequest];
    CGFloat v14 = [v13 itemID];
    double v15 = [(ConversationViewControllerBase *)self _messageItemIDAtIndexPath:v10];
    unsigned int v16 = [v14 isEqual:v15];

    if (!v16
      || ([v8 indexPathsForVisibleItems],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v18 = [v17 containsObject:v10],
          v17,
          (v18 & 1) == 0))
    {
      CGFloat v19 = [v11 viewModel];
      [(ConversationViewControllerBase *)self cancelAutomaticMarkAsReadForCellViewModel:v19];
    }
    double v20 = [v11 messageViewController];
    [v20 willMoveToParentViewController:0];
    [v20 removeFromParentViewController];
    CGFloat v21 = [v8 valueForKeyPath:@"firstResponderViewType"];
    double v22 = [v8 valueForKeyPath:@"firstResponderView"];
    CGFloat v23 = [v8 valueForKeyPath:@"firstResponderIndexPath"];
    if (v22 && [v21 integerValue] == (id)1 && v23)
    {
      double v24 = [(ConversationViewControllerBase *)self _layoutAttributesForItemAtIndexPath:v23];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10009DA2C;
      v27[3] = &unk_100604618;
      id v28 = v22;
      id v29 = v24;
      id v25 = v24;
      +[UIView performWithoutAnimation:v27];
    }
    [(ConversationViewControllerBase *)self _enqueueMessageViewController:v20];
    [v20 setDelegate:0];
    [v11 setMessageViewController:0];
    __int16 v26 = [v11 layer];
    [v26 setAllowsGroupOpacity:1];
  }
  [(ConversationViewControllerBase *)self _toggleCellGroupOpacityIfNeeded:v9 displaying:0];
}

- (int64_t)_collectionView:(id)a3 dataOwnerForDragSession:(id)a4 atIndexPath:(id)a5
{
  return -[ConversationViewControllerBase _dataOwnerForDragSessionAtIndexPath:](self, "_dataOwnerForDragSessionAtIndexPath:", a5, a4);
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ConversationViewControllerBase *)self cellExpansionRecognizer];
  [v8 cancel];

  id v9 = [v6 cellForItemAtIndexPath:v7];
  id v10 = objc_alloc_init((Class)UIDragPreviewParameters);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 roundsCellCorners])
  {
    [v9 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    +[MFMessageConversationViewCell defaultCornerRadius];
    double v20 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v12, v14, v16, v18, v19);
    [v10 setVisiblePath:v20];
  }
  else
  {
    [v9 bounds];
    double v20 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
    [v10 setVisiblePath:v20];
  }

  return v10;
}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 cellForItemAtIndexPath:v9];
  [v8 locationInView:v10];
  if (objc_msgSend(v10, "canBeginDragWithTouchAtPoint:"))
  {
    double v11 = [(ConversationViewControllerBase *)self _dragItemsForItemAtIndexPath:v9];
  }
  else
  {
    double v11 = 0;
  }
  if (v11) {
    double v12 = v11;
  }
  else {
    double v12 = &__NSArray0__struct;
  }
  id v13 = v12;

  return v13;
}

- (id)collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v10 = a3;
  id v11 = a5;
  double v12 = [v10 cellForItemAtIndexPath:v11];
  [v10 convertPoint:v12 toView:x, y];
  if (objc_msgSend(v12, "canBeginDragWithTouchAtPoint:"))
  {
    id v13 = [(ConversationViewControllerBase *)self _dragItemsForItemAtIndexPath:v11];
  }
  else
  {
    id v13 = 0;
  }
  if (v13) {
    double v14 = v13;
  }
  else {
    double v14 = &__NSArray0__struct;
  }
  id v15 = v14;

  return v15;
}

- (int64_t)_dataOwnerForDragSessionAtIndexPath:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _dataOwnerForDragSessionAtIndexPath:]", "ConversationViewControllerBase.m", 2222, "0");
}

- (id)_dragItemsForItemAtIndexPath:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _dragItemsForItemAtIndexPath:]", "ConversationViewControllerBase.m", 2226, "0");
}

- (void)messageViewController:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  id v91 = a3;
  id v6 = [v91 parentViewController];

  id v7 = [(ConversationViewControllerBase *)self _indexPathOfMessageViewControllerMessage:v91];
  if (v7 && v6 == self)
  {
    v92 = [(ConversationViewControllerBase *)self collectionView];
    [v92 mui_sortedIndexPathsForVisibleItems];
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_10009EA6C;
    v103[3] = &unk_1006061F0;
    rect_16 = v103[4] = self;
    rect_8 = [rect_16 ef_map:v103];
    rect_24 = [v92 cellForItemAtIndexPath:v7];
    id v8 = [(ConversationViewControllerBase *)self cellConfigurator];
    unsigned int v9 = [v8 updateSemiExpandedToFullyExpandedIfNecessaryAtIndexPath:v7 renderedHeight:a4];

    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(ConversationViewControllerBase *)self _hideSeeMoreButtonForCell:rect_24];
      }
    }
    v90 = [(ConversationViewControllerBase *)self _messageItemIDAtIndexPath:v7];
    [v92 mf_visibleBounds];
    CGFloat rect = v10;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v17 = [(ConversationViewControllerBase *)self cellConfigurator];
    [v17 sizeForItemAtIndexPath:v7];
    double v19 = v18;

    [(ConversationViewControllerBase *)self _minimumItemHeight];
    double v21 = v20;
    double v22 = ceil(a4);
    if (v21 >= v22) {
      double v23 = v21;
    }
    else {
      double v23 = v22;
    }
    double v24 = [(ConversationViewControllerBase *)self cellConfigurator];
    id v25 = [v24 sizeTracker];
    __int16 v26 = [(ConversationViewControllerBase *)self collectionView];
    [v26 frame];
    [v25 setIntrinsicSize:v90 forCellWithItemID:v27, v23];

    id v28 = [(ConversationViewControllerBase *)self cellConfigurator];
    id v29 = [v28 sizeTracker];
    [v29 displaySizeForCellWithItemID:v90];
    double v31 = v30;

    double v32 = v23 - v31;
    if (v23 - v31 < 0.0) {
      double v32 = -(v23 - v31);
    }
    if (v32 < 2.22044605e-16)
    {
      double v31 = v23;
    }
    else
    {
      id v33 = +[ConversationViewController log];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        double v106 = v23;
        __int16 v107 = 2048;
        double v108 = a4;
        __int16 v109 = 2048;
        double v110 = v21;
        __int16 v111 = 2048;
        double v112 = v31;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Height does not match value from size tracker: %.2f (renderedHeight: %.2f, minimumHeight: %.2f) <-> %.2f", buf, 0x2Au);
      }
    }
    double v34 = -(v31 - v19);
    if (v31 - v19 >= 0.0) {
      double v34 = v31 - v19;
    }
    if (v34 < 2.22044605e-16) {
      goto LABEL_59;
    }
    int64_t v35 = [(ConversationViewControllerBase *)self resizingState];
    if (v35 != 3)
    {
      CGRect v36 = [(ConversationViewControllerBase *)self _currentSizeMetadataKey];
      CGRect v37 = +[NSString stringWithFormat:@"%@_%@", v90, v36];

      id v38 = +[NSNumber numberWithDouble:v31];
      __int16 v39 = [(ConversationViewControllerBase *)self cellHeightCache];
      [v39 setObject:v38 forKeyedSubscript:v37];
    }
    unsigned int v40 = [rect_16 containsObject:v7];
    __int16 v41 = @"off-screen";
    if (v40) {
      __int16 v41 = @"visible";
    }
    v85 = v41;
    BOOL v42 = +[ConversationViewController log];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      double v43 = COERCE_DOUBLE([v7 section]);
      double v44 = COERCE_DOUBLE([v7 row]);
      id v45 = [v91 contentRequest];
      v46 = [v45 messageFuture];
      v47 = [v46 resultIfAvailable];
      id v48 = [v47 ef_publicDescription];
      *(_DWORD *)buf = 138414338;
      double v106 = *(double *)&v85;
      __int16 v107 = 2048;
      double v108 = v43;
      __int16 v109 = 2048;
      double v110 = v44;
      __int16 v111 = 2048;
      double v112 = v19;
      __int16 v113 = 2048;
      double v114 = v31;
      __int16 v115 = 2048;
      double v116 = v31 - v19;
      __int16 v117 = 2048;
      double v118 = a4;
      __int16 v119 = 2048;
      double v120 = v21;
      __int16 v121 = 2112;
      v122 = v48;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Height changed for %@ cell at {%ld, %ld} (%g->%g, delta=%g, renderedHeight=%g, minimumHeight=%g) for message: %@", buf, 0x5Cu);
    }
    if (v35 == 3)
    {
      BOOL v49 = 0;
      double v50 = v31 - v19;
LABEL_51:
      id v76 = objc_alloc_init((Class)UICollectionViewFlowLayoutInvalidationContext);
      [v76 setContentSizeAdjustment:0.0, v31 - v19];
      if (v49) {
        [v76 setContentOffsetAdjustment:0.0 v50];
      }
      [(ConversationViewControllerBase *)self layoutInvalidationContentOffset];
      double y = CGPointZero.y;
      if (v79 != CGPointZero.x || v77 != y)
      {
        [(ConversationViewControllerBase *)self layoutInvalidationContentOffset];
        [v76 setContentOffsetAdjustment:0.0];
        -[ConversationViewControllerBase setLayoutInvalidationContentOffset:](self, "setLayoutInvalidationContentOffset:", CGPointZero.x, y);
      }
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = sub_10009EB08;
      v93[3] = &unk_100606218;
      v93[4] = self;
      id v94 = v7;
      double v97 = v31 - v19;
      double v98 = v31;
      id v80 = v76;
      id v95 = v80;
      id v96 = v92;
      v81 = objc_retainBlock(v93);
      v82 = [(ConversationViewControllerBase *)self cellConfigurator];
      unsigned __int8 v83 = [v82 animatePendingHeightChangesIfNecessary];

      if ((v83 & 1) == 0) {
        ((void (*)(void *))v81[2])(v81);
      }

LABEL_59:
      v84 = [v92 cellForItemAtIndexPath:v7];
      [(ConversationViewControllerBase *)self _updateFooterViewFrameForCell:v84];

      goto LABEL_60;
    }
    unsigned __int8 v51 = [(ConversationViewControllerBase *)self pinnedItem];
    v52 = [v51 dynamicOffset];

    if (v52)
    {
      unsigned int v53 = [v51 dynamicOffset];
      [v92 mf_cellOffsetByApplyingDynamicOffset:v53 cellHeight:v19];
      double v55 = v54;

      __int16 v56 = [v51 dynamicOffset];
      [v92 mf_cellOffsetByApplyingDynamicOffset:v56 cellHeight:v31];
      double v58 = v57;

      BOOL v59 = +[ConversationViewController log];
      double v50 = v58 - v55;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v106 = v50;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Cell being resized is the pinned cell. Will adjust content offset by %0.1f", buf, 0xCu);
      }
      BOOL v49 = 1;
    }
    else
    {
      if ([(ConversationViewControllerBase *)self _isDisplayingSingleMessage])
      {
        BOOL v49 = 0;
        double v50 = v31 - v19;
LABEL_50:

        goto LABEL_51;
      }
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id v60 = rect_8;
      id v61 = [v60 countByEnumeratingWithState:&v99 objects:v104 count:16];
      if (v61)
      {
        uint64_t v62 = *(void *)v100;
LABEL_35:
        uint64_t v63 = 0;
        while (1)
        {
          if (*(void *)v100 != v62) {
            objc_enumerationMutation(v60);
          }
          v64 = *(void **)(*((void *)&v99 + 1) + 8 * v63);
          v65 = [v64 second];
          [v65 frame];
          double MinY = CGRectGetMinY(v123);
          v124.origin.double x = rect;
          v124.origin.double y = v12;
          v124.size.CGFloat width = v14;
          v124.size.CGFloat height = v16;
          if (MinY >= CGRectGetMinY(v124)) {
            break;
          }

          if (v61 == (id)++v63)
          {
            id v61 = [v60 countByEnumeratingWithState:&v99 objects:v104 count:16];
            if (v61) {
              goto LABEL_35;
            }
            goto LABEL_41;
          }
        }
        BOOL v59 = [v64 first];

        if (v59) {
          goto LABEL_44;
        }
      }
      else
      {
LABEL_41:
      }
      v67 = [v60 firstObject];
      BOOL v59 = [v67 first];

LABEL_44:
      id v68 = [v7 compare:v59];
      BOOL v49 = v68 == (id)-1;
      v69 = @"Will NOT adjust";
      if (v68 == (id)-1) {
        v69 = @"Will adjust";
      }
      v70 = v69;
      v71 = +[ConversationViewController log];
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        double v72 = COERCE_DOUBLE([v7 section]);
        double v73 = COERCE_DOUBLE([v7 row]);
        double v74 = COERCE_DOUBLE([v59 section]);
        double v75 = COERCE_DOUBLE([v59 row]);
        *(_DWORD *)buf = 138413570;
        double v106 = *(double *)&v70;
        __int16 v107 = 2048;
        double v108 = v31 - v19;
        __int16 v109 = 2048;
        double v110 = v72;
        __int16 v111 = 2048;
        double v112 = v73;
        __int16 v113 = 2048;
        double v114 = v74;
        __int16 v115 = 2048;
        double v116 = v75;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%@ content offset (adjustment=%.2f, resizedPath={%ld, %ld}, topPath={%ld, %ld})", buf, 0x3Eu);
      }

      double v50 = v31 - v19;
    }

    goto LABEL_50;
  }
LABEL_60:
}

- (void)messageViewControllerDidFinishFirstPaint:(id)a3
{
  if (![(ConversationViewControllerBase *)self didCompleteFirstPaint]) {
    [(ConversationViewControllerBase *)self setDidCompleteFirstPaint:1];
  }
  id v6 = [(ConversationViewControllerBase *)self collectionView];
  if (-[ConversationViewControllerBase _scrollViewIsScrolledToEnd:](self, "_scrollViewIsScrolledToEnd:"))
  {
    unsigned int v4 = [(ConversationViewControllerBase *)self _isDisplayingSingleMessage];

    if (v4) {
      [(ConversationViewControllerBase *)self _scrolledToEndOfSingleMessage];
    }
  }
  else
  {
  }
  id v7 = +[UIApplication sharedApplication];
  unsigned int v5 = [v7 isTesting];

  if (v5)
  {
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"MFMailConversationViewDidShow" object:self];
  }
}

- (void)messageViewControllerDidDisplayContent:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 contentRequest];
  id v8 = [v7 message];

  [(ConversationViewControllerBase *)self scheduleAutomaticMarkAsReadForMessage:v8];
  unsigned int v9 = [(ConversationViewControllerBase *)self mailboxRepository];
  [v9 recordFrecencyEventWithMailboxesOfMessage:v8];

  if ([UIApp launchedToTest])
  {
    double v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"MFMailConversationViewChildMessageViewDidDisplayContent" object:v6];
  }
  if (v4)
  {
    double v11 = [(ConversationViewControllerBase *)self blankConversationController];
    [v11 conversationViewWebViewDidLoadMessage];
  }
  [(ConversationViewControllerBase *)self _updateFooterViewFrameForVisibleCells];
  [(ConversationViewControllerBase *)self _messageViewControllerDidDisplayContent:v6];
  CGFloat v12 = [(ConversationViewControllerBase *)self referenceMessageListItem];
  double v13 = [v12 itemID];

  CGFloat v14 = MFMessageSelectionLifecycleSignpostLog();
  os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v13);

  CGFloat v16 = MFMessageSelectionLifecycleSignpostLog();
  double v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    CFStringRef v18 = @"failed to display";
    if (v4) {
      CFStringRef v18 = @"successfully displayed";
    }
    int v19 = 138412546;
    CFStringRef v20 = v18;
    __int16 v21 = 2112;
    double v22 = v13;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v15, "Message selection lifecycle", "Message view controller %@ message with itemID: %@", (uint8_t *)&v19, 0x16u);
  }
}

- (void)messageViewController:(id)a3 didStartDownloadForContentItemWithProgress:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase messageViewController:didStartDownloadForContentItemWithProgress:]", "ConversationViewControllerBase.m", 2405, "0");
}

- (void)messageViewController:(id)a3 didTapShowMoreAtCollapsedOffset:(CGPoint)a4 expandedOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  id v10 = a3;
  [(ConversationViewControllerBase *)self setPinnedItem:0];
  -[ConversationViewControllerBase _showSingleMessage:animationOffset:initialScrollOffset:](self, "_showSingleMessage:animationOffset:initialScrollOffset:", v10, v8, v7, x, y);
}

- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase messageViewController:didTapRevealActionsButton:]", "ConversationViewControllerBase.m", 2414, "0");
}

- (void)messageViewController:(id)a3 didTapUndoSendButton:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase messageViewController:didTapUndoSendButton:]", "ConversationViewControllerBase.m", 2418, "0");
}

- (BOOL)_isDisplayingSingleMessage
{
}

- (id)_visibleIndexPathForMessageViewController:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _visibleIndexPathForMessageViewController:]", "ConversationViewControllerBase.m", 2426, "0");
}

- (void)messageViewController:(id)a3 contentViewDidEndZoomingMessageWithOffset:(CGPoint)a4
{
  self->_layoutInvalidationContentOffset = a4;
}

- (void)messageViewControllerDidTapToExpand:(id)a3
{
}

- (void)messageViewControllerDidTapAddressAtom:(id)a3 contactViewController:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v6 setDelegate:self];
  [v7 bounds];
  -[ConversationViewControllerBase _showModalViewController:fromView:sourceRect:animated:](self, "_showModalViewController:fromView:sourceRect:animated:", v6, v7, 1);
}

- (void)messageViewController:(id)a3 didChangeSelectedHTML:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  textSelectionScrollHandler = self->_textSelectionScrollHandler;
  if (!textSelectionScrollHandler)
  {
    id v8 = [MFTextSelectionScrollHandler alloc];
    unsigned int v9 = [(ConversationViewControllerBase *)self collectionView];
    id v10 = [(MFTextSelectionScrollHandler *)v8 initWithScrollView:v9];
    double v11 = self->_textSelectionScrollHandler;
    self->_textSelectionScrollHandler = v10;

    textSelectionScrollHandler = self->_textSelectionScrollHandler;
  }
  [(MFTextSelectionScrollHandler *)textSelectionScrollHandler handleTextSelectionChanged:v6];
}

- (id)messageViewController:(id)a3 displayNameForEmailAddress:(id)a4 abbreviated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(ConversationViewControllerBase *)self contactStore];
  unsigned int v9 = [v8 displayNameForEmailAddress:v7 abbreviated:v5];

  return v9;
}

- (void)contactCardInteractions:(id)a3 triggerSearchForDisplayName:(id)a4 emailAddresses:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009F5D8;
  v6[3] = &unk_100604618;
  id v7 = self;
  id v8 = a5;
  id v5 = v8;
  [(ConversationViewControllerBase *)v7 dismissViewControllerAnimated:1 completion:v6];
}

- (void)messageViewController:(id)a3 webViewDidTerminateWithReason:(int64_t)a4
{
  id v7 = [(ConversationViewControllerBase *)self scene];
  id v6 = [v7 activationState];

  id v8 = [(ConversationViewControllerBase *)self blankConversationController];
  [v8 conversationViewWebViewCrashedWithReason:a4 isBackgrounded:v6 == (id)2];
}

- (id)hostScrollViewForConversationHeaderView:(id)a3
{
  double v3 = [(ConversationViewControllerBase *)self collectionView];

  return v3;
}

- (double)stickySubjectViewMaxYForConversationHeaderView:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase stickySubjectViewMaxYForConversationHeaderView:]", "ConversationViewControllerBase.m", 2496, "0");
}

- (double)stickySubjectViewFirstBaselineForConversationHeaderView:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase stickySubjectViewFirstBaselineForConversationHeaderView:]", "ConversationViewControllerBase.m", 2500, "0");
}

- (BOOL)_scrollViewIsScrolledToEnd:(id)a3
{
  id v3 = a3;
  [v3 contentSize];
  if (v4 <= 1.0)
  {
    BOOL v10 = 0;
  }
  else
  {
    [v3 contentOffset];
    double v6 = v5;
    [v3 bounds];
    double v8 = v7;
    [v3 contentSize];
    BOOL v10 = (v6 + v8) / v9 >= 0.85;
  }

  return v10;
}

- (id)indexSetForRowsFromIndexPaths:(id)a3 section:(int64_t)a4
{
  id v5 = a3;
  double v6 = +[NSMutableIndexSet indexSet];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        double v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "section", (void)v13) == (id)a4) {
          [v6 addIndex:[v11 row]];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v6;
}

- (BOOL)_shouldAutomaticallyCollapseQuotedContentForCellAtIndexPath:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    unsigned int v5 = EMIsGreymatterAvailableWithOverride();
  }
  else {
    unsigned int v5 = 0;
  }
  if ([(ConversationViewControllerBase *)self conversationSortOrder])
  {
    if (v5)
    {
      int64_t v6 = [(ConversationViewControllerBase *)self countOfMessages];
      id v7 = (char *)[(ConversationViewControllerBase *)self countOfSummaries] + v6;
    }
    else
    {
      id v7 = [(ConversationViewControllerBase *)self countOfMessages];
    }
    id v8 = v7 - 1;
  }
  else
  {
    id v8 = (char *)v5;
  }
  BOOL v9 = [v4 row] != v8;

  return v9;
}

- (id)_nextMessageIndexWithDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(ConversationViewControllerBase *)self _currentlyVisibleIndexPath];
  int64_t v6 = [(ConversationViewControllerBase *)self _nextIndexPathToSelectFromIndexPath:v5 withDirection:v3];

  return v6;
}

- (id)_nextIndexPathToSelectFromIndexPath:(id)a3 withDirection:(int)a4
{
  id v6 = [a3 row];
  if (a4 == -1) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = (uint64_t)v6 + v7;
  if ((uint64_t)v6 + v7 >= 1)
  {
    do
    {
      if (v8 >= [(ConversationViewControllerBase *)self countOfMessages]) {
        break;
      }
      BOOL v9 = +[NSIndexPath indexPathForRow:v8 inSection:0];
      BOOL v10 = [(ConversationViewControllerBase *)self _messageItemIDAtIndexPath:v9];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_9;
      }

      v8 += v7;
    }
    while (v8 > 0);
  }
  BOOL v9 = 0;
LABEL_9:

  return v9;
}

- (id)_oldestIndexPath
{
  uint64_t v3 = [(ConversationViewControllerBase *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];

  if ((id)[(ConversationViewControllerBase *)self conversationSortOrder] == (id)1) {
    [v4 lastObject];
  }
  else {
  unsigned int v5 = [v4 firstObject];
  }

  return v5;
}

- (void)_hideRemovedSingleMessageCellIfInRemovedIndexPaths:(id)a3
{
  id v14 = a3;
  id v4 = [(ConversationViewControllerBase *)self removedSingleMessageIndexPath];
  if (v4)
  {
    unsigned int v5 = [(ConversationViewControllerBase *)self removedSingleMessageIndexPath];
    unsigned int v6 = [v14 containsObject:v5];

    if (v6)
    {
      uint64_t v7 = [(ConversationViewControllerBase *)self collectionView];
      uint64_t v8 = [v7 indexPathsForVisibleItems];
      BOOL v9 = [(ConversationViewControllerBase *)self removedSingleMessageIndexPath];
      unsigned int v10 = [v8 containsObject:v9];

      if (v10)
      {
        double v11 = [(ConversationViewControllerBase *)self collectionView];
        id v12 = [(ConversationViewControllerBase *)self removedSingleMessageIndexPath];
        long long v13 = [v11 cellForItemAtIndexPath:v12];

        [v13 setAlpha:0.0];
      }
      [(ConversationViewControllerBase *)self setRemovedSingleMessageIndexPath:0];
    }
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  uint64_t v7 = [(ConversationViewControllerBase *)self pinnedItem];
  uint64_t v8 = [v7 indexPath];

  BOOL v9 = [(ConversationViewControllerBase *)self pinnedItem];
  unsigned int v10 = [v9 dynamicOffset];

  if (v8 && v10)
  {
    double v11 = [(ConversationViewControllerBase *)self collectionView];
    [v11 mf_contentOffsetApplyingDynamicOffset:v10 indexPath:v8];
    double v13 = v12;

    if (v13 == y)
    {
      CGFloat x = 0.0;
      goto LABEL_10;
    }
    id v14 = +[ConversationViewController log];
    CGFloat x = 0.0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218240;
      double v18 = v13;
      __int16 v19 = 2048;
      double v20 = y;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Conversation view has pinned item. Using calculated offset of %.02f instead of proposed %.02f", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    id v14 = +[ConversationViewController log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100458F94(v14, y);
    }
    double v13 = y;
  }

LABEL_10:
  double v15 = x;
  double v16 = v13;
  result.double y = v16;
  result.CGFloat x = v15;
  return result;
}

- (id)viewForKeyboardAvoidance:(id)a3
{
  return self->_conversationView;
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  uint64_t v3 = [(ConversationViewControllerBase *)self transitionCoordinator];

  return v3;
}

- (void)_adjustForKeyboardAvoidanceOverlap:(double)a3
{
  if (_os_feature_enabled_impl()
    && [(ConversationViewControllerBase *)self isPerformingQuickReplySendAnimation])
  {
    if (self->_adjustmentForKeyboard != a3) {
      self->_adjustmentForKeyboard = a3;
    }
    return;
  }
  *(void *)&rect[16] = [(ConversationViewControllerBase *)self traitCollection];
  id v5 = [*(id *)&rect[16] horizontalSizeClass];

  *(void *)&rect[16] = [(ConversationViewControllerBase *)self navigationController];
  unsigned int v6 = [*(id *)&rect[16] toolbar];
  [v6 frame];
  double v8 = v7;

  unsigned __int8 v9 = [(ConversationViewControllerBase *)self allowQuickReply];
  if (a3 > 0.0) {
    unsigned __int8 v10 = v9;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  double v11 = 0.0;
  if ((v10 & (v5 == (id)1)) != 0) {
    double v11 = v8;
  }
  *(double *)&rect[8] = a3 - v11;
  if (a3 - v11 != self->_adjustmentForKeyboard)
  {
    double v72 = v8;
    *(void *)&rect[16] = self->_conversationView;
    [*(id *)&rect[16] contentInset];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [*(id *)&rect[16] scrollIndicatorInsets];
    *(void *)CGFloat rect = v20;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v27 = *(double *)&rect[8] - self->_adjustmentForKeyboard;
    [*(id *)&rect[16] setContentInset:v13, v15, v17 + v27, v19];
    [*(id *)&rect[16] setScrollIndicatorInsets:*(double *)rect, v22, v24 + v27, v26];
    self->_adjustmentForKeyboard = *(double *)&rect[8];
    if ([(ConversationViewControllerBase *)self allowQuickReply]) {
      [(ConversationViewControllerBase *)self _shrinkBottomPaddingIfNecessary];
    }
    [(ConversationViewControllerBase *)self _updateBottomPadding];
    if (![(ConversationViewControllerBase *)self allowQuickReply]) {
      goto LABEL_28;
    }
    id v28 = [(ConversationViewControllerBase *)self collectionView];
    [v28 frame];
    *(void *)CGFloat rect = v29;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    double v35 = v34;
    if (v5 != (id)1 || *(double *)&rect[8] <= 0.0) {
      double v37 = 0.0;
    }
    else {
      double v37 = v73;
    }
    id v38 = [(ConversationViewControllerBase *)self _quickReplyView];
    __int16 v39 = v38;
    if (v38)
    {
      [v38 frame];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      id v48 = [(ConversationViewControllerBase *)self view];
      [v48 convertRect:v28 fromView:v41 toView:v43];
      CGFloat v50 = v49;
      CGFloat v52 = v51;
      CGFloat v54 = v53;
      double v56 = v55;

      [(ConversationViewControllerBase *)self _itemSpacing];
      v82.size.CGFloat height = v56 + v57;
      v82.origin.CGFloat x = v50;
      v82.origin.double y = v52;
      v82.size.CGFloat width = v54;
      double MaxY = CGRectGetMaxY(v82);
      v83.size.CGFloat height = v35 - *(double *)&rect[8] - v37;
      v83.origin.CGFloat x = *(CGFloat *)rect;
      v83.origin.double y = v31;
      v83.size.CGFloat width = v33;
      double v59 = MaxY - CGRectGetMaxY(v83);
      if (v59 > 0.0)
      {
        [v28 contentOffset];
        double v61 = v60;
        double v63 = v62;
        [v28 contentSize];
        double v65 = v64;
        [v28 bounds];
        double v67 = v66;
        [v28 contentInset];
        double v69 = v65 - v67 + v68;
        if (v59 + v63 < v69) {
          double v69 = v59 + v63;
        }
        [v28 setContentOffset:v61, v69];
        v70 = +[ConversationViewController log];
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)&rect[24] = 138413058;
          *(void *)&rect[28] = objc_opt_class();
          __int16 v75 = 2048;
          id v76 = self;
          __int16 v77 = 2048;
          double v78 = v59;
          __int16 v79 = 2048;
          uint64_t v80 = *(void *)&rect[8];
          id v71 = *(id *)&rect[28];
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Quick Reply] Did scroll up by amount=%f to adjust for keyboard overlap=%f", &rect[24], 0x2Au);
        }
      }

LABEL_28:
      return;
    }
  }
}

- (void)_animateWithKeyboard:(id)a3 animations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 userInfo];
  unsigned __int8 v9 = [v8 objectForKey:UIKeyboardAnimationDurationUserInfoKey];
  [v9 doubleValue];
  double v11 = v10;

  double v12 = [v6 userInfo];
  double v13 = [v12 objectForKey:UIKeyboardAnimationCurveUserInfoKey];
  id v14 = [v13 integerValue];

  double v15 = [v6 userInfo];
  double v16 = [v15 objectForKey:UIKeyboardFrameEndUserInfoKey];
  [v16 CGRectValue];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v24 = v23;

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000A0918;
  v27[3] = &unk_100606268;
  id v25 = v7;
  uint64_t v29 = v18;
  uint64_t v30 = v20;
  uint64_t v31 = v22;
  uint64_t v32 = v24;
  void v27[4] = self;
  id v28 = v25;
  id v26 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:(void)v14 << 16 delay:v27 options:0 animations:v11 completion:0.0];
}

- (BOOL)canHandleAction:(SEL)a3 withMailMenuCommand:(id)a4
{
  BOOL v6 = -[ConversationViewControllerBase _isConversationViewShortcut:](self, "_isConversationViewShortcut:", a3, a4);
  if (v6)
  {
    LOBYTE(v6) = sub_1000A0994((uint64_t)self, (char *)a3);
  }
  return v6;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A0DBC;
  v9[3] = &unk_100606290;
  double v11 = &v13;
  SEL v12 = a3;
  id v6 = a4;
  id v10 = v6;
  if ([(ConversationViewControllerBase *)self _executeIfSplitViewIsAvailable:v9])
  {
    unsigned __int8 v7 = *((unsigned char *)v14 + 24) != 0;
  }
  else
  {
    unsigned __int8 v7 = [(ConversationViewControllerBase *)self canHandleAction:a3 withMailMenuCommand:v6];
    *((unsigned char *)v14 + 24) = v7;
  }

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (BOOL)_isConversationViewShortcut:(SEL)a3
{
  if (sub_10012482C((uint64_t)MailSplitViewController, (char *)a3)) {
    return 1;
  }

  return sub_1001245C4((uint64_t)MailSplitViewController, (char *)a3);
}

- (void)_pageUpCommandInvoked:(id)a3
{
  id v3 = [(ConversationViewControllerBase *)self collectionView];
  [v3 mf_pageUp];
}

- (void)_pageDownCommandInvoked:(id)a3
{
  id v3 = [(ConversationViewControllerBase *)self collectionView];
  [v3 mf_pageDown];
}

- (void)_selectNextMessageCommandInvoked:(id)a3
{
  id v4 = [(ConversationViewControllerBase *)self delegate];
  if ([v4 conversationViewController:self canAdvanceToNextConversationWithDirection:0xFFFFFFFFLL])[v4 conversationViewController:advanceToNextConversationWithDirection:0xFFFFFFFFLL];
}
  }

- (void)_selectPreviousMessageCommandInvoked:(id)a3
{
  id v4 = [(ConversationViewControllerBase *)self delegate];
  if ([v4 conversationViewController:self canAdvanceToNextConversationWithDirection:1])[v4 conversationViewController:advanceToNextConversationWithDirection:1];
}
  }

- (BOOL)_shouldArchiveByDefault
{
}

- (BOOL)_shouldShowArrowsForDisplayMode:(int64_t)a3 collapsed:(BOOL)a4 withTraitCollection:(id)a5
{
  id v8 = a5;
  if ([(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
  {
    BOOL v9 = 0;
    goto LABEL_16;
  }
  if (v8)
  {
    if (a4)
    {
LABEL_5:
      BOOL v9 = 1;
      goto LABEL_16;
    }
  }
  else
  {
    id v8 = [(ConversationViewControllerBase *)self traitCollection];
    if (a4) {
      goto LABEL_5;
    }
  }
  id v10 = [v8 horizontalSizeClass];
  BOOL v9 = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || v10 == (id)1 || a3 == 5;
LABEL_16:

  return v9;
}

- (void)_updateBarButtonsAnimated:(BOOL)a3 force:(BOOL)a4
{
}

- (void)_updateBarButtonsAnimated:(BOOL)a3 force:(BOOL)a4 isShowingTitle:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  BOOL v9 = [(ConversationViewControllerBase *)self splitViewController];
  id v12 = v9;
  if (v9)
  {
    uint64_t v10 = (uint64_t)[v9 displayMode];
    uint64_t v11 = (uint64_t)[v12 isCollapsed];
  }
  else
  {
    uint64_t v11 = 1;
    uint64_t v10 = 1;
  }
  [(ConversationViewControllerBase *)self _updateBarButtonsAnimated:v7 withDisplayMode:v10 withTraitCollection:0 collapsed:v11 force:v6 isShowingTitle:v5];
}

- (void)_updateBarButtonsAnimated:(BOOL)a3 withDisplayMode:(int64_t)a4 isCollapsed:(BOOL)a5 isShowingTitle:(BOOL)a6
{
}

- (void)_removeNavigationBarFromSelf
{
  id v3 = [(ConversationViewControllerBase *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  id v4 = [(ConversationViewControllerBase *)self navigationItem];
  [v4 setCenterItemGroups:&__NSArray0__struct];

  id v5 = [(ConversationViewControllerBase *)self navigationItem];
  [v5 setRightBarButtonItem:0];
}

- (BOOL)_shouldUseDesktopClassNavigationBarForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  unsigned __int8 v11 = -86;
  unsigned __int8 v11 = +[UINavigationBar mf_shouldUseDesktopClassNavigationBarForTraitCollection:v4];
  if (*((unsigned char *)v9 + 24))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A14C0;
    v7[3] = &unk_100606128;
    v7[4] = &v8;
    [(ConversationViewControllerBase *)self _executeIfSplitViewIsAvailable:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_updateBarButtonsAnimated:(BOOL)a3 withDisplayMode:(int64_t)a4 withTraitCollection:(id)a5 collapsed:(BOOL)a6 force:(BOOL)a7 isShowingTitle:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v49 = a3;
  id v50 = a5;
  uint64_t v13 = [(ConversationViewControllerBase *)self barItemsManager];
  BOOL v14 = [(ConversationViewControllerBase *)self _shouldArchiveByDefault];
  if (v14 != [v13 useArchiveButton])
  {
    [v13 setUseArchiveButton:v14];
    BOOL v9 = 1;
  }
  BOOL v15 = [(ConversationViewControllerBase *)self _shouldShowArrowsForDisplayMode:a4 collapsed:v10 withTraitCollection:v50];
  if (v15 != [v13 showNavigationArrows])
  {
    [v13 setShowNavigationArrows:v15];
    BOOL v9 = 1;
  }
  sub_1000A1274(self);
  char v16 = (ConversationViewControllerBase *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = v16;
  if (!v50)
  {
    id v50 = [(ConversationViewControllerBase *)v16 traitCollection];
  }
  if (v17 != self) {
    [(ConversationViewControllerBase *)self _removeNavigationBarFromSelf];
  }
  BOOL v18 = [(ConversationViewControllerBase *)self _shouldUseDesktopClassNavigationBarForTraitCollection:v50];
  int v19 = v9 | v18 ^ [v13 useDesktopClassNavigationBar];
  if (v19 != 1) {
    goto LABEL_12;
  }
  [v13 setUseDesktopClassNavigationBar:v18];
  uint64_t v20 = [(ConversationViewControllerBase *)v17 navigationController];
  uint64_t v21 = [v20 navigationBar];
  uint64_t v22 = [(ConversationViewControllerBase *)v17 navigationItem];
  [v13 configureNavigationBar:v21 navigationItem:v22];

  if (!v18)
  {
LABEL_12:
    unsigned int v25 = [v50 mf_hasCompactDimension];
    if (((self->_defaultBarButtons != 0) & ~v19) == 0)
    {
      id v26 = [(ConversationViewControllerBase *)self _defaultBarButtonItems];
      defaultBarButtons = self->_defaultBarButtons;
      self->_defaultBarButtons = v26;
    }
    $8E77E832BB222766B6D1F97AC6EE4C4B flags = self->_flags;
    if ((v25 & *(_DWORD *)&flags) == 1)
    {
      uint64_t v29 = [(ConversationViewControllerBase *)self toolbarItems];
      int v30 = v29 == 0;
    }
    else
    {
      int v30 = v25 ^ *(_DWORD *)&flags;
    }
    uint64_t v31 = [(ConversationViewControllerBase *)v17 navigationController];
    [v31 setNavigationBarHidden:0 animated:v49];

    uint64_t v32 = [(ConversationViewControllerBase *)v17 navigationItem];
    if (((v19 | v30) & 1) == 0) {
      goto LABEL_43;
    }
    *(unsigned char *)&self->_$8E77E832BB222766B6D1F97AC6EE4C4B flags = *(unsigned char *)&self->_flags & 0xFE | v25;
    id v48 = objc_opt_new();
    if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      [(ConversationViewControllerBase *)v17 setToolbarItems:0 animated:v49];
      if ([(ConversationViewControllerBase *)self isPrimary])
      {
        if ([v48 count])
        {
          CGFloat v33 = [v13 leftSpaceItem];
          [v48 addObject:v33];
        }
        if (v15)
        {
          double v34 = [v13 arrowControlsButtonItem];
          [v48 addObject:v34];
        }
      }
      double v35 = [(ConversationViewControllerBase *)self _defaultBarButtonsWithFlexibleSpacing:0 reverseOrder:1];
      id v36 = [v35 mutableCopy];

      [v32 setRightBarButtonItems:v36 animated:v49];
      BOOL v15 = 1;
      goto LABEL_32;
    }
    if (v15)
    {
      double v37 = [v13 arrowControlsButtonItem];
      double v53 = v37;
      id v38 = +[NSArray arrayWithObjects:&v53 count:1];
    }
    else
    {
      if (![(ConversationViewControllerBase *)self isShowingGroupedSenderMessageList])
      {
        id v38 = 0;
        BOOL v15 = 1;
        goto LABEL_31;
      }
      __int16 v39 = [v13 groupedSenderActionsButtonItem];
      CGFloat v52 = v39;
      id v38 = +[NSArray arrayWithObjects:&v52 count:1];

      double v40 = [v13 cleanBackButtonItem];
      [v48 addObject:v40];

      double v41 = [(ConversationViewControllerBase *)self splitViewController];
      double v37 = [v41 viewControllerForColumn:0];

      double v42 = [v37 interactivePopGestureRecognizer];
      [v42 setDelegate:self];
    }
LABEL_31:
    [v32 setRightBarButtonItems:v38 animated:v49];
    double v43 = [(ConversationViewControllerBase *)self _defaultBarButtonsWithFlexibleSpacing:1 reverseOrder:0];
    [(ConversationViewControllerBase *)v17 setToolbarItems:v43 animated:v49];

LABEL_32:
    if ([v48 count])
    {
      double v44 = [v32 leftBarButtonItems];
      unsigned __int8 v45 = [v48 isEqual:v44];

      if ((v45 & 1) == 0) {
        [v32 setLeftBarButtonItems:v48 animated:v49];
      }
      [v32 setLeftItemsSupplementBackButton:v15];
    }
    else
    {
      [v32 setLeftBarButtonItems:0 animated:v49];
    }
    if ([(ConversationViewControllerBase *)self shouldAddDoneButtonForConversationNavigationBarItemsManager:v13])
    {
      double v46 = [v13 doneButtonItem];
      double v51 = v46;
      double v47 = +[NSArray arrayWithObjects:&v51 count:1];

      if (*(unsigned char *)&self->_flags)
      {
        [v32 setRightBarButtonItems:v47 animated:v49];
        [v32 setHidesBackButton:1 animated:v49];
      }
      else
      {
        [v32 setLeftBarButtonItems:v47 animated:v49];
        [v32 setLeftItemsSupplementBackButton:0];
      }
    }
LABEL_43:
    [(ConversationViewControllerBase *)self _updateBarButtonsEnabled];

    goto LABEL_44;
  }
  [(ConversationViewControllerBase *)v17 setToolbarItems:0 animated:v49];
  uint64_t v23 = [(ConversationViewControllerBase *)v17 navigationController];
  [v23 setNavigationBarHidden:0 animated:v49];

  uint64_t v24 = [(ConversationViewControllerBase *)v17 navigationItem];
  [v13 configureDesktopClassButtonsFor:v24 isPrimary:[self isPrimary] isShowingTitle:v8 animated:v49];

  [(ConversationViewControllerBase *)self _updateBarButtonsEnabled];
LABEL_44:
}

- (id)_defaultBarButtonItems
{
  id v2 = self;
  id v3 = [(ConversationViewControllerBase *)self barItemsManager];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  BOOL v5 = [v3 destructiveButtonItem];
  v14[0] = v5;
  BOOL v6 = [v3 moveButtonItem];
  v14[1] = v6;
  BOOL v7 = +[NSArray arrayWithObjects:v14 count:2];
  [v4 addObjectsFromArray:v7];

  BOOL v8 = [(ConversationViewControllerBase *)v2 traitCollection];
  LODWORD(v2) = [v8 mf_hasCompactDimension];

  if (v2)
  {
    BOOL v9 = [v3 revealActionsButtonItem];
    [v4 addObject:v9];
  }
  BOOL v10 = [v3 composeButtonItem];

  if (v10)
  {
    unsigned __int8 v11 = [v3 composeButtonItem];
    [v4 addObject:v11];
  }
  id v12 = [v4 copy];

  return v12;
}

- (void)setDoneButton:(id)a3
{
  id v5 = a3;
  id v4 = [(ConversationViewControllerBase *)self barItemsManager];
  [v4 setDoneButton:v5];
}

- (UIBarButtonItem)doneButton
{
  id v2 = [(ConversationViewControllerBase *)self barItemsManager];
  id v3 = [v2 doneButton];

  return (UIBarButtonItem *)v3;
}

- (void)done:(id)a3
{
  id v9 = [(ConversationViewControllerBase *)self delegate];
  id v4 = [(ConversationViewControllerBase *)self navigationController];
  id v5 = [v4 viewControllers];
  BOOL v6 = [v5 firstObject];

  if (v6 == self)
  {
    if (objc_opt_respondsToSelector()) {
      [v9 conversationViewControllerWantsDismissal:self];
    }
  }
  else
  {
    BOOL v7 = [(ConversationViewControllerBase *)self navigationController];
    id v8 = [v7 popViewControllerAnimated:1];
  }
}

- (id)_flexibleSpaceBarButton
{
  id v2 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];

  return v2;
}

- (id)_fixedSpaceBarButton
{
  id v2 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
  [v2 setWidth:10.0];

  return v2;
}

- (id)_defaultBarButtonsWithFlexibleSpacing:(BOOL)a3 reverseOrder:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = +[NSMutableArray array];
  if (v5) {
    [(ConversationViewControllerBase *)self _flexibleSpaceBarButton];
  }
  else {
  id v8 = [(ConversationViewControllerBase *)self _fixedSpaceBarButton];
  }
  if (v4) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  defaultBarButtons = self->_defaultBarButtons;
  BOOL v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_1000A22F4;
  uint64_t v21 = &unk_1006062B8;
  id v11 = v7;
  BOOL v25 = v4;
  id v22 = v11;
  uint64_t v23 = self;
  id v12 = v8;
  id v24 = v12;
  [(NSArray *)defaultBarButtons enumerateObjectsWithOptions:v9 usingBlock:&v18];
  if (v5
    && [(ConversationViewControllerBase *)self shouldHideStickyFooterView])
  {
    id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
    [v13 setWidth:8.0];
    [v11 insertObject:v13 atIndex:0];
    id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
    [v14 setWidth:8.0];
    [v11 addObject:v14];
  }
  BOOL v15 = v24;
  id v16 = v11;

  return v16;
}

- (void)revealActionsButtonTapped:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase revealActionsButtonTapped:]", "ConversationViewControllerBase.m", 3126, "0");
}

- (void)replyButtonTapped:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase replyButtonTapped:]", "ConversationViewControllerBase.m", 3130, "0");
}

- (void)replyAllButtonTapped:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase replyAllButtonTapped:]", "ConversationViewControllerBase.m", 3134, "0");
}

- (void)forwardButtonTapped:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase forwardButtonTapped:]", "ConversationViewControllerBase.m", 3138, "0");
}

- (void)contactDoneButtonItemTapped:(id)a3
{
}

- (id)supplementaryButtonItemForConversationNavigationBarItemsManager:(id)a3
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100096B1C;
  BOOL v10 = sub_100096B2C;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A2634;
  v5[3] = &unk_100606128;
  v5[4] = &v6;
  [(ConversationViewControllerBase *)self _executeIfSplitViewIsAvailable:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)groupedSenderActionMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4
{
  return 0;
}

- (id)deleteButtonMenuForConversationNavigationBarItemsManager:(id)a3 menuOwner:(id)a4
{
  return 0;
}

- (BOOL)shouldAddDoneButtonForConversationNavigationBarItemsManager:(id)a3
{
  if (+[UIDevice mf_isPad]
    && ![(ConversationViewControllerBase *)self isPrimary]
    && ![(ConversationViewControllerBase *)self shownAsConversation])
  {
    return 1;
  }
  BOOL v4 = [(ConversationViewControllerBase *)self doneButton];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)arrowControlsView:(id)a3 didTapButtonWithDirection:(int)a4
{
}

- (void)navigateToMessageInDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[ConversationViewControllerBase _canBrowseInDirection:](self, "_canBrowseInDirection:"))
  {
    [(ConversationViewControllerBase *)self _navigateToMessageInDirection:v3];
  }
}

- (void)_navigateToMessageInDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = -[ConversationViewControllerBase _nextMessageIndexWithDirection:](self, "_nextMessageIndexWithDirection:");
  id v10 = (id)v5;
  if (v5)
  {
    *(unsigned char *)&self->_flags &= ~2u;
    [(ConversationViewControllerBase *)self _scrollToItemAtIndexPath:v5 dynamicOffset:0 shouldAdjustToShowPreviousMessage:1 animated:1 pin:1 completion:0];
  }
  else
  {
    unsigned int v6 = [(ConversationViewControllerBase *)self _isDisplayingSingleMessage];
    char flags = (char)self->_flags;
    if ((v6 | ((flags & 2) >> 1)) == 1)
    {
      *(unsigned char *)&self->_char flags = flags & 0xFD;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained conversationViewController:self advanceToNextConversationWithDirection:v3];
    }
    else
    {
      *(unsigned char *)&self->_char flags = flags | 2;
      if (v3 == -1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = 4;
      }
      [(MFCollectionViewPagingAnimator *)self->_pagingAnimator bounceAlongEdge:v9];
    }
  }
}

- (BOOL)_canBrowseInDirection:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ConversationViewControllerBase *)self referenceMessageListItem];

  if (!v5) {
    return 0;
  }
  unsigned int v6 = [(ConversationViewControllerBase *)self _nextMessageIndexWithDirection:v3];
  if (v6)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v7 = [WeakRetained conversationViewController:self canAdvanceToNextConversationWithDirection:v3];
  }
  return v7;
}

- (void)updateArrowControlsView
{
  uint64_t v3 = [(ConversationViewControllerBase *)self barItemsManager];
  id v8 = [v3 arrowControlsView];

  BOOL v4 = [(ConversationViewControllerBase *)self _canBrowseInDirection:0xFFFFFFFFLL];
  uint64_t v5 = [v8 upButton];
  [v5 setEnabled:v4];

  BOOL v6 = [(ConversationViewControllerBase *)self _canBrowseInDirection:1];
  unsigned __int8 v7 = [v8 downButton];
  [v7 setEnabled:v6];
}

- (void)_setNavigationBarTitleViewNeedsLayout
{
  id v2 = [(ConversationViewControllerBase *)self conversationHeaderView];
  [v2 setNeedsLayout];
}

- (id)replyButtonItem
{
  id v2 = [(ConversationViewControllerBase *)self barItemsManager];
  uint64_t v3 = [v2 replyButtonItem];

  return v3;
}

- (id)deleteButtonItem
{
  id v2 = [(ConversationViewControllerBase *)self barItemsManager];
  uint64_t v3 = [v2 deleteButtonItem];

  return v3;
}

- (id)archiveButtonItem
{
  id v2 = [(ConversationViewControllerBase *)self barItemsManager];
  uint64_t v3 = [v2 archiveButtonItem];

  return v3;
}

- (id)moveButtonItem
{
  id v2 = [(ConversationViewControllerBase *)self barItemsManager];
  uint64_t v3 = [v2 moveButtonItem];

  return v3;
}

- (MFArrowControlsView)arrowControlsView
{
  arrowControlsView = self->_arrowControlsView;
  if (!arrowControlsView)
  {
    BOOL v4 = [(ConversationViewControllerBase *)self barItemsManager];
    uint64_t v5 = [v4 arrowControlsView];
    BOOL v6 = self->_arrowControlsView;
    self->_arrowControlsView = v5;

    arrowControlsView = self->_arrowControlsView;
  }

  return arrowControlsView;
}

- (void)_dismissPopover
{
}

- (void)_showModalViewController:(id)a3 fromView:(id)a4 sourceRect:(CGRect)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v22 = v13;
  objc_opt_class();
  BOOL v15 = v22;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = [objc_alloc((Class)UINavigationController) initWithRootViewController:];

    BOOL v15 = v16;
  }
  [v15 setModalPresentationStyle:7];
  uint64_t v17 = [v15 popoverPresentationController];
  [v17 setPermittedArrowDirections:3];
  [v17 setSourceView:v14];
  [v17 setDelegate:self];
  v25.origin.double x = CGRectZero.origin.x;
  v25.origin.double y = CGRectZero.origin.y;
  v25.size.double width = CGRectZero.size.width;
  v25.size.double height = CGRectZero.size.height;
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.double width = width;
  v24.size.double height = height;
  if (CGRectEqualToRect(v24, v25))
  {
    [(ConversationViewControllerBase *)self _defaultSourceRectForView:v14];
    double x = v18;
    double y = v19;
    double width = v20;
    double height = v21;
  }
  [v17 setSourceRect:x, y, width, height];
  [(ConversationViewControllerBase *)self presentViewController:v15 animated:v6 completion:0];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  uint64_t v17 = sub_1000A2FB4;
  double v18 = &unk_1006062E0;
  id v10 = v8;
  id v19 = v10;
  BOOL v22 = a4;
  id v11 = v9;
  double v20 = self;
  id v21 = v11;
  id v12 = objc_retainBlock(&v15);
  id v13 = [(ConversationViewControllerBase *)self presentedViewController];
  id v14 = v13;
  if (v13 && [v13 modalPresentationStyle] == (id)7) {
    [(ConversationViewControllerBase *)self dismissViewControllerAnimated:0 completion:v12];
  }
  else {
    ((void (*)(void ***))v12[2])(v12);
  }
}

- (CGRect)_defaultSourceRectForView:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat MidY = CGRectGetMidY(v12);

  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = MidY;
  result.size.double height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (void)_endEditingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ConversationViewControllerBase *)self conversationLayout];
  [v4 setSwipedIndexPath:0 animated:v3 completion:0];
}

- (void)presentPreviousDraftPicker
{
  id v5 = [(ConversationViewControllerBase *)self scene];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(ConversationViewControllerBase *)self barItemsManager];
    id v4 = [v3 composeButtonItem];
    [v5 performSelector:"composeButtonLongPressed:" withObject:v4];
  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v8 = a3;
  if (![(ConversationViewControllerBase *)self desiredContextualControllerPresentationStyle])
  {
    id v5 = [(ConversationViewControllerBase *)self barItemsManager];
    BOOL v6 = [v5 contactLeftDoneButtonItem];
    unsigned __int8 v7 = [v8 navigationItem];
    [v7 setLeftBarButtonItem:v6];
  }
}

- (id)passthroughViews
{
  BOOL v3 = +[NSMutableArray arrayWithCapacity:3];
  id v4 = [(ConversationViewControllerBase *)self barItemsManager];
  id v5 = [v4 replyButtonItem];
  BOOL v6 = [v5 view];

  if (v6) {
    [v3 addObject:v6];
  }
  unsigned __int8 v7 = +[NSUserDefaults em_userDefaults];
  if ([v7 BOOLForKey:ShowMessageDeleteConfirmationKey])
  {
    id v8 = [(ConversationViewControllerBase *)self barItemsManager];
    double v9 = [v8 deleteButtonItem];
    double v10 = [v9 view];

    if (v10) {
      [v3 addObject:v10];
    }
  }
  else
  {

    double v10 = v6;
  }

  return v3;
}

- (void)_updateConversationSortOrder
{
  unint64_t v3 = [(ConversationViewControllerBase *)self _currentConversationSortOrderPreference];

  [(ConversationViewControllerBase *)self setConversationSortOrder:v3];
}

- (void)_updateIncludeRelatedMessages
{
  if (sub_1000575E0(0)) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xDF | v3;

  [(ConversationViewControllerBase *)self _reloadDataSource];
}

- (CGSize)defaultCellSizeForTracker:(id)a3
{
  id v4 = [(ConversationViewControllerBase *)self collectionView];
  [v4 mf_visibleHeight];
  double v6 = v5;

  if ([(ConversationViewControllerBase *)self _isDisplayingSingleMessage])
  {
    double v7 = 0.0;
    if (![(ConversationViewControllerBase *)self shouldHideStickyFooterView])
    {
      id v8 = [(ConversationViewControllerBase *)self collectionView];
      [v8 contentInset];
      double v7 = v9;
    }
    double v10 = v6 + v7;
    if (+[UIDevice mf_isPad])
    {
      double v11 = [(ConversationViewControllerBase *)self displayMetrics];
      [v11 estimatedFooterViewHeight];
      double v10 = v10 + v12 * -0.5;
    }
  }
  else
  {
    double v10 = 276.0;
  }
  [(ConversationViewControllerBase *)self _expectedCellWidth];
  double v14 = v10;
  result.double height = v14;
  result.CGFloat width = v13;
  return result;
}

- (double)_expectedCellWidth
{
  char v3 = [(ConversationViewControllerBase *)self collectionView];
  [v3 mui_safeVisibleBounds];
  double v4 = CGRectGetWidth(v6) + self->_horizontalPadding * -2.0;

  return v4;
}

- (double)quickReplyHeightForTracker:(id)a3
{
  [(ConversationViewControllerBase *)self quickReplyHeight];
  double v5 = v4;
  [(ConversationViewControllerBase *)self _itemSpacing];
  return v5 + v6;
}

- (int64_t)conversationViewCellSizeTracker:(id)a3 expansionStatusForMessageWithItemID:(id)a4
{
  id v5 = a4;
  double v6 = [(ConversationViewControllerBase *)self cellConfigurator];
  double v7 = [v6 expansionTracker];
  id v8 = [v7 expansionStatusForCellWithItemID:v5];

  return (int64_t)v8;
}

- (double)defaultSemiExpandedHeightForTracker:(id)a3
{
  char v3 = [(ConversationViewControllerBase *)self displayMetrics];
  +[MFExpandedMessageCell defaultSemiExpandedHeightWithDisplayMetrics:v3];
  double v5 = v4;

  return v5;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  double v7 = [a3 presentedViewController];
  id v8 = [v7 childViewControllers];

  if ([v8 count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        double v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_20;
        }
      }
      id v10 = v13;

      if (!v10) {
        goto LABEL_21;
      }
      double v14 = [v10 contentViewController];
      unsigned __int8 v15 = [v14 isEditing];

      if (v15) {
        goto LABEL_21;
      }
      if (a4 == -1)
      {
        id v9 = [v10 navigationItem];
        [v9 setLeftBarButtonItem:0];
      }
      else
      {
        id v9 = [v10 contact];
        if ([v9 isUnknown])
        {
          uint64_t v16 = [(ConversationViewControllerBase *)self barItemsManager];
          uint64_t v17 = [v16 contactLeftDoneButtonItem];
          double v18 = [v10 navigationItem];
          [v18 setRightBarButtonItem:v17];
        }
        else
        {
          uint64_t v16 = [(ConversationViewControllerBase *)self barItemsManager];
          uint64_t v17 = [v16 contactLeftDoneButtonItem];
          double v18 = [v10 navigationItem];
          [v18 setLeftBarButtonItem:v17];
        }
      }
    }
LABEL_20:
  }
  else
  {
    id v10 = 0;
  }
LABEL_21:
}

- (BOOL)wantsBarHidingWhenVerticallyCompact
{
  return ![(ConversationViewControllerBase *)self _shouldShowConversationHeader];
}

- (void)_toggleCellsGroupOpacityDuringRotationWithCoordinator:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A3B7C;
  v9[3] = &unk_100604550;
  void v9[4] = self;
  double v5 = objc_retainBlock(v9);
  ((void (*)(void *, uint64_t))v5[2])(v5, 1);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A3D04;
  v7[3] = &unk_100606330;
  double v6 = v5;
  id v8 = v6;
  [v4 animateAlongsideTransition:0 completion:v7];
}

- (void)_toggleCellGroupOpacityIfNeeded:(id)a3 displaying:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((*(unsigned char *)&self->_flags & 0x80000000) != 0)
  {
    id v8 = v6;
    double v7 = [v6 layer];
    [v7 setAllowsGroupOpacity:!v4];

    id v6 = v8;
  }
}

- (void)_beginResizingConversationView:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v25 = [(ConversationViewControllerBase *)self collectionView];
  if ([v25 numberOfSections]) {
    id v6 = [v25 numberOfItemsInSection:0];
  }
  else {
    id v6 = 0;
  }
  double v7 = [(ConversationViewControllerBase *)self splitViewController];
  id v8 = [v7 displayMode];

  BOOL v9 = v8 == (id)4 || v8 == (id)2;
  if (v9 && v6)
  {
    [(ConversationViewControllerBase *)self prepareForResizing];
    [v25 frame];
    double v14 = v10;
    double v15 = v11;
    CGFloat v16 = v12;
    CGFloat v17 = v13;
    double v18 = 0.0;
    if (height == 0.0) {
      double v19 = 0.0;
    }
    else {
      double v19 = width / height;
    }
    if (CGRectGetHeight(*(CGRect *)&v10) != 0.0)
    {
      v27.origin.CGFloat x = v14;
      v27.origin.CGFloat y = v15;
      v27.size.double width = v16;
      v27.size.double height = v17;
      double v20 = CGRectGetWidth(v27);
      v28.origin.CGFloat x = v14;
      v28.origin.CGFloat y = v15;
      v28.size.double width = v16;
      v28.size.double height = v17;
      double v18 = v20 / CGRectGetHeight(v28);
    }
    if (v18 == v19 || v18 < 1.0 && v19 < 1.0 || v18 > 1.0 && v19 > 1.0)
    {
      [v25 center];
      UIRectCenteredAboutPoint();
      double v14 = v21;
      double v15 = v22;
      double width = v23;
      double height = v24;
      [v25 setAutoresizingMask:5];
    }
    else
    {
      [v25 setAutoresizingMask:0];
    }
    [v25 setFrame:v14, v15, width, height];
    -[ConversationViewControllerBase layoutMarginsForCollectionViewFrame:](self, "layoutMarginsForCollectionViewFrame:", v14, v15, width, height);
    [v25 setDirectionalLayoutMargins:];
    [(ConversationViewControllerBase *)self beginResizing];
  }
}

- (void)_endResizingConversationView
{
  char v3 = [(ConversationViewControllerBase *)self collectionView];
  [v3 setAutoresizingMask:18];

  double v4 = sub_100006EAC(self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(ConversationViewControllerBase *)self collectionView];
  [v11 setFrame:v4, v6, v8, v10];

  [(ConversationViewControllerBase *)self endResizing];
}

- (void)viewSafeAreaInsetsDidChange
{
  v36.receiver = self;
  v36.super_class = (Class)ConversationViewControllerBase;
  [(ConversationViewControllerBase *)&v36 viewSafeAreaInsetsDidChange];
  char v3 = [(ConversationViewControllerBase *)self conversationLayout];
  double v4 = [v3 swipedIndexPath];

  if (!v4)
  {
    double v5 = [(ConversationViewControllerBase *)self view];
    [v5 safeAreaInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(ConversationViewControllerBase *)self displayMetrics];
    [v14 safeAreaInsets];
    if (v9 == v18 && v7 == v15 && v13 == v17)
    {
      double v19 = v16;

      if (v11 == v19)
      {
        char v20 = 1;
LABEL_9:
        [(ConversationViewControllerBase *)self _calculateCollectionViewInsets];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        uint64_t v29 = [(ConversationViewControllerBase *)self collectionView];
        [v29 contentInset];
        if (v33 == v24 && v30 == v22 && v32 == v28)
        {
          double v34 = v31;

          if (v34 == v26)
          {
            if (v20) {
              return;
            }
            goto LABEL_14;
          }
        }
        else
        {
        }
        double v35 = [(ConversationViewControllerBase *)self collectionView];
        [v35 setContentInset:v22, v24, v26, v28];

        if (v20) {
          return;
        }
LABEL_14:
        [(ConversationViewControllerBase *)self _restorePinnedScrollPosition];
        return;
      }
    }
    else
    {
    }
    [(ConversationViewControllerBase *)self _updateDisplayMetrics];
    char v20 = 0;
    goto LABEL_9;
  }
}

- (void)_updateDisplayMetrics
{
  char v3 = [(ConversationViewControllerBase *)self traitCollection];
  double v4 = [(ConversationViewControllerBase *)self collectionView];
  [v4 layoutMargins];
  double v5 = -[ConversationViewControllerBase messageDisplayMetricsForTraitCollection:layoutMargins:](self, "messageDisplayMetricsForTraitCollection:layoutMargins:", v3);
  [(ConversationViewControllerBase *)self setDisplayMetrics:v5];

  double v6 = [(ConversationViewControllerBase *)self traitCollection];
  id v7 = [v6 horizontalSizeClass];
  double v8 = 0.0;
  if (v7 == (id)2)
  {
    unsigned int v9 = +[UIDevice mf_isPad];
    double v8 = 0.0;
    if (v9) {
      double v8 = 24.0;
    }
  }
  self->_double horizontalPadding = v8;

  double horizontalPadding = self->_horizontalPadding;

  [(ConversationViewControllerBase *)self _didChangeHorizontalPadding:horizontalPadding];
}

- (id)messageDisplayMetricsForTraitCollection:(id)a3 layoutMargins:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  double v10 = [(ConversationViewControllerBase *)self defaultBarButtons];
  double v11 = [v10 lastObject];
  double v12 = [v11 view];

  double v13 = [(ConversationViewControllerBase *)self view];
  [v13 safeAreaInsets];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = [(ConversationViewControllerBase *)self scene];
  double v23 = +[MFMessageDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:trailingButtonView:](MFMessageDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:interfaceOrientation:trailingButtonView:", v9, [v22 interfaceOrientation], v12, top, left, bottom, right, v15, v17, v19, v21);

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
    id v24 = [(ConversationViewControllerBase *)self displayMetrics];
  }
  double v25 = v24;

  return v25;
}

- (void)setDisplayMetrics:(id)a3
{
  id v7 = a3;
  if ((-[MFMessageDisplayMetrics isEqual:](self->_displayMetrics, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    double v5 = [(ConversationViewControllerBase *)self cellConfigurator];
    [v5 setDisplayMetrics:v7];

    double v6 = [(ConversationViewControllerBase *)self conversationLayout];
    [v6 setDisplayMetrics:v7];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewControllerBase *)self cellExpansionRecognizer];

  if (v5 == v4)
  {
    id v7 = [(ConversationViewControllerBase *)self collectionView];
    if ([v7 hasActiveDrag])
    {
LABEL_4:
      char v6 = 0;
LABEL_8:

      goto LABEL_9;
    }
    double v8 = [(ConversationViewControllerBase *)self collectionView];
    if ([v8 isDragging]) {
      goto LABEL_6;
    }
    double v10 = [(ConversationViewControllerBase *)self conversationLayout];
    double v11 = [v10 swipedIndexPath];

    if (v11)
    {
      char v6 = 0;
      goto LABEL_9;
    }
    double v12 = [(ConversationViewControllerBase *)self collectionView];
    [v4 locationInView:v12];
    double v14 = v13;
    double v16 = v15;

    double v17 = [(ConversationViewControllerBase *)self collectionView];
    id v7 = [v17 indexPathForItemAtPoint:v14, v16];

    if (!v7) {
      goto LABEL_4;
    }
    if (![(ConversationViewControllerBase *)self shouldShowExpandableDigestHeaderView])goto LABEL_18; {
    double v18 = [(ConversationViewControllerBase *)self view];
    }
    [v4 locationInView:v18];
    double v20 = v19;

    double v21 = [(ConversationViewControllerBase *)self collectionView];
    [v21 contentInset];
    double v23 = v22;

    if (v23 > v20) {
      goto LABEL_4;
    }
    id v24 = [(ConversationViewControllerBase *)self cellConfigurator];
    id v25 = [v24 expansionStatusForMessageAtIndexPath:v7];

    if (v25 == (id)2)
    {
      double v26 = [(ConversationViewControllerBase *)self collectionView];
      double v8 = [v26 cellForItemAtIndexPath:v7];

      [v4 locationInView:v8];
      CGFloat v52 = v28;
      CGFloat v53 = v27;
      uint64_t v29 = [v8 messageViewController];
      double v30 = [v29 messageContentView];
      double v31 = [v30 headerView];
      [v31 frame];
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;

      double v40 = [v8 messageViewController];
      double v41 = [v40 messageContentView];
      double v42 = [v41 footerView];
      [v42 frame];
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;

      v56.origin.CGFloat x = v33;
      v56.origin.CGFloat y = v35;
      v56.size.double width = v37;
      v56.size.double height = v39;
      v54.CGFloat y = v52;
      v54.CGFloat x = v53;
      if (CGRectContainsPoint(v56, v54))
      {
LABEL_6:
        char v6 = 0;
LABEL_7:

        goto LABEL_8;
      }
      v57.origin.CGFloat x = v44;
      v57.origin.CGFloat y = v46;
      v57.size.double width = v48;
      v57.size.double height = v50;
      v55.CGFloat y = v52;
      v55.CGFloat x = v53;
      unsigned __int8 v51 = CGRectContainsPoint(v57, v55);
    }
    else
    {
LABEL_18:
      double v8 = [(ConversationViewControllerBase *)self cellConfigurator];
      unsigned __int8 v51 = [v8 messageAtIndexPathIsExpanded:v7];
    }
    char v6 = v51 ^ 1;
    goto LABEL_7;
  }
  char v6 = 1;
LABEL_9:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(ConversationViewControllerBase *)self cellExpansionRecognizer];

  if (v6 == v5)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    id v7 = [(ConversationViewControllerBase *)self splitViewController];
    double v8 = [v7 viewControllerForColumn:0];

    id v9 = [v8 interactivePopGestureRecognizer];
    unsigned __int8 v10 = [v9 isEqual:v5];
  }
  return v10;
}

- (void)_expansionRecognizerDidRecognize:(id)a3
{
  id v4 = a3;
  id v5 = [(ConversationViewControllerBase *)self collectionView];
  [v4 locationInView:v5];
  double v8 = v6;
  double v9 = v7;
  if (!qword_100699430)
  {
    uint64_t v10 = [v5 indexPathForItemAtPoint:v6, v7];
    double v11 = (void *)qword_100699430;
    qword_100699430 = v10;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_1000A4CAC;
  v18[3] = &unk_100604550;
  void v18[4] = self;
  double v12 = objc_retainBlock(v18);
  double v13 = [v5 indexPathForItemAtPoint:v8, v9];
  if ([v4 state] == (id)1)
  {
    objc_storeStrong((id *)&qword_100699430, v13);
    uint64_t v14 = 1;
LABEL_13:
    ((void (*)(void *, uint64_t))v12[2])(v12, v14);
    goto LABEL_14;
  }
  if ([v4 state] == (id)2)
  {
    uint64_t v14 = (uint64_t)[v13 isEqual:qword_100699430];
    goto LABEL_13;
  }
  if ([v4 state] != (id)3)
  {
    if ([v4 state] != (id)4) {
      goto LABEL_14;
    }
LABEL_12:
    uint64_t v14 = 0;
    goto LABEL_13;
  }
  if (![v13 isEqual:qword_100699430]) {
    goto LABEL_12;
  }
  double v15 = [(ConversationViewControllerBase *)self collectionView];
  unsigned __int8 v16 = [v15 isDragging];

  if (v16) {
    goto LABEL_12;
  }
  [(ConversationViewControllerBase *)self setLastExpandedCellIndexPath:v13];
  [(ConversationViewControllerBase *)self setPinnedItem:0];
  double v17 = [(ConversationViewControllerBase *)self cellConfigurator];
  [v17 expandCellAtIndexPath:v13 animated:1 highlightFirst:1 expansionStatus:3];

LABEL_14:
}

- (BOOL)_executeIfSplitViewIsAvailable:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(ConversationViewControllerBase *)self scene];
  BOOL v6 = [(ConversationViewControllerBase *)self isSplitViewAvailable];
  if (v6)
  {
    double v7 = [v5 splitViewController];
    v4[2](v4, v7);
  }
  return v6;
}

- (BOOL)isSplitViewAvailable
{
  id v2 = [(ConversationViewControllerBase *)self scene];
  unsigned __int8 v3 = [v2 conformsToProtocol:&OBJC_PROTOCOL___SplitLayoutCapable];

  return v3;
}

- (void)_testReplyForSelectedMessage
{
}

- (void)_testDeleteSelectedMessage
{
}

- (void)setDisableScrollPinning:(BOOL)a3
{
  self->_disableScrollPinning = a3;
  if (a3) {
    [(ConversationViewControllerBase *)self setPinnedItem:0];
  }
}

- (BOOL)shouldHideStickyFooterView
{
  id v2 = self;
  unsigned __int8 v3 = [(ConversationViewControllerBase *)self traitCollection];
  LOBYTE(v2) = [(ConversationViewControllerBase *)v2 _shouldHideStickyFooterViewForTraitCollection:v3];

  return (char)v2;
}

- (BOOL)_shouldHideStickyFooterViewForTraitCollection:(id)a3
{
  return [a3 mf_hasCompactDimension];
}

- (void)_messageSearchBegan
{
  if (!self->_conversationSearchHandler)
  {
    unsigned __int8 v3 = (ConversationSearchHandler *)objc_opt_new();
    conversationSearchHandler = self->_conversationSearchHandler;
    self->_conversationSearchHandler = v3;

    id v5 = self->_conversationSearchHandler;
    sub_10006C410((id *)&v5->super.isa, self);
  }
}

- (void)_messageSearchEnded
{
}

- (id)conversationSearchMessageListForConversationSearchHandler:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase conversationSearchMessageListForConversationSearchHandler:]", "ConversationViewControllerBase.m", 3836, "0");
}

- (id)conversationSearchHandler:(id)a3 contentRepresentationRequestForItemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase conversationSearchHandler:contentRepresentationRequestForItemID:]", "ConversationViewControllerBase.m", 3840, "0");
}

- (BOOL)conversationSearchHandler:(id)a3 shouldConsiderQuotedContentForItemID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase conversationSearchHandler:shouldConsiderQuotedContentForItemID:]", "ConversationViewControllerBase.m", 3844, "0");
}

- (double)widthForConversationViewCellsForConversationSearchHandler:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase widthForConversationViewCellsForConversationSearchHandler:]", "ConversationViewControllerBase.m", 3848, "0");
}

- (id)_persistentIDForEMMessageObjectID:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase _persistentIDForEMMessageObjectID:]", "ConversationViewControllerBase.m", 3852, "0");
}

- (void)_updateAllowQuickReplyForMessageListItem:(id)a3
{
  id v7 = a3;
  int v4 = _os_feature_enabled_impl() ^ 1;
  if (!v7) {
    LOBYTE(v4) = 1;
  }
  if ((v4 & 1) != 0 || [(ConversationViewControllerBase *)self beingPreviewed]) {
    goto LABEL_8;
  }
  id v5 = [v7 sendLaterDate];
  if (v5)
  {

LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  if ([v7 isEditable]) {
    goto LABEL_8;
  }
  [(ConversationViewControllerBase *)self _setupQuickReplySupplementaryViewProvider];
  uint64_t v6 = 1;
LABEL_9:
  [(ConversationViewControllerBase *)self setAllowQuickReply:v6];
}

- (BOOL)_isQuickReplyMessageAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)_isUndoSendMessageAtIndexPath:(id)a3
{
  return 0;
}

- (double)_quickReplyHorizontalPadding
{
  return self->_horizontalPadding;
}

- (id)_quickReplyView
{
  return 0;
}

- (void)setDidCompleteFirstPaint:(BOOL)a3
{
  if (self->_didCompleteFirstPaint != a3)
  {
    self->_didCompleteFirstPaint = a3;
    if (a3) {
      [(ConversationViewControllerBase *)self _invalidateQuickReplyFooter];
    }
  }
}

- (void)showAllMessagesForConversationSenderHeaderView:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase showAllMessagesForConversationSenderHeaderView:]", "ConversationViewControllerBase.m", 3924, "0");
}

- (void)showCategoryMessagesForConversationSenderHeaderView:(id)a3
{
  id v5 = a3;
  [(ConversationViewControllerBase *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[ConversationViewControllerBase showCategoryMessagesForConversationSenderHeaderView:]", "ConversationViewControllerBase.m", 3928, "0");
}

- (id)layoutInformationForConversationSenderHeaderViewAnimator:(id)a3
{
  int v4 = [_TtC10MobileMail45ConversationSenderHeaderViewLayoutInformation alloc];
  id v5 = [(ConversationViewControllerBase *)self scene];
  uint64_t v6 = [v5 statusBarManager];
  [v6 statusBarFrame];
  double v8 = v7;
  [(ConversationViewControllerBase *)self _itemSpacing];
  uint64_t v10 = [(ConversationSenderHeaderViewLayoutInformation *)v4 initWithStatusBarHeight:v8 contentInset:v9];

  return v10;
}

- (PinnedConversationItem)pinnedItem
{
  return self->_pinnedItem;
}

- (unint64_t)conversationSortOrder
{
  return self->_conversationSortOrder;
}

- (void)setConversationSortOrder:(unint64_t)a3
{
  self->_conversationSortOrder = a3;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)isStandalone
{
  return self->_isStandalone;
}

- (void)setIsStandalone:(BOOL)a3
{
  self->_isStandalone = a3;
}

- (BOOL)messagesShowSourceMailbox
{
  return self->_messagesShowSourceMailbox;
}

- (void)setMessagesShowSourceMailbox:(BOOL)a3
{
  self->_messagesShowSourceMailboCGFloat x = a3;
}

- (BOOL)isToolbarHidden
{
  return self->_toolbarHidden;
}

- (void)setToolbarHidden:(BOOL)a3
{
  self->_toolbarHidden = a3;
}

- (void)setShownAsConversation:(BOOL)a3
{
  self->_shownAsConversation = a3;
}

- (EMMessageListItem)focusedMessage
{
  return self->_focusedMessage;
}

- (CGPoint)initialScrollOffset
{
  double x = self->_initialScrollOffset.x;
  double y = self->_initialScrollOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialScrollOffset:(CGPoint)a3
{
  self->_initialScrollOffset = a3;
}

- (MFMessageDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (void)setAllowQuickReply:(BOOL)a3
{
  self->_allowQuickRepldouble y = a3;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (EFCancelable)forceCollapsedSenderHeaderToken
{
  return self->_forceCollapsedSenderHeaderToken;
}

- (void)setForceCollapsedSenderHeaderToken:(id)a3
{
}

- (void)setTapGestureTitleView:(id)a3
{
}

- (UILayoutGuide)senderHeaderLayoutGuide
{
  return self->_senderHeaderLayoutGuide;
}

- (void)setSenderHeaderLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)senderHeaderLayoutGuideTopConstraint
{
  return self->_senderHeaderLayoutGuideTopConstraint;
}

- (void)setSenderHeaderLayoutGuideTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)senderHeaderLayoutGuideLeadingConstraint
{
  return self->_senderHeaderLayoutGuideLeadingConstraint;
}

- (void)setSenderHeaderLayoutGuideLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)senderHeaderLayoutGuideTrailingConstraint
{
  return self->_senderHeaderLayoutGuideTrailingConstraint;
}

- (void)setSenderHeaderLayoutGuideTrailingConstraint:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (ECSubject)conversationSubject
{
  return self->_conversationSubject;
}

- (void)setConversationSubject:(id)a3
{
}

- (NSIndexPath)removedSingleMessageIndexPath
{
  return self->_removedSingleMessageIndexPath;
}

- (void)setRemovedSingleMessageIndexPath:(id)a3
{
}

- (MFTextSelectionScrollHandler)textSelectionScrollHandler
{
  return self->_textSelectionScrollHandler;
}

- (void)setTextSelectionScrollHandler:(id)a3
{
}

- (MFConversationHandoffCoordinator)handoffCoordinator
{
  return self->_handoffCoordinator;
}

- (void)setHandoffCoordinator:(id)a3
{
}

- (MFConversationAssistantContextProvider)assistantContextProvider
{
  return self->_assistantContextProvider;
}

- (void)setAssistantContextProvider:(id)a3
{
}

- (MFConversationCurrentVisibleMessageStrategy)currentVisibleMessageStrategy
{
  return self->_currentVisibleMessageStrategy;
}

- (void)setCurrentVisibleMessageStrategy:(id)a3
{
}

- (MFCollectionViewPagingAnimator)pagingAnimator
{
  return self->_pagingAnimator;
}

- (void)setPagingAnimator:(id)a3
{
}

- (int64_t)resizingState
{
  return self->_resizingState;
}

- (NSArray)resizingContentViews
{
  return self->_resizingContentViews;
}

- (void)setResizingContentViews:(id)a3
{
}

- (void)setPreviewState:(id)a3
{
}

- (BOOL)shouldShowNoMessageSelectedView
{
  return self->_shouldShowNoMessageSelectedView;
}

- (CGPoint)layoutInvalidationContentOffset
{
  double x = self->_layoutInvalidationContentOffset.x;
  double y = self->_layoutInvalidationContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLayoutInvalidationContentOffset:(CGPoint)a3
{
  self->_layoutInvalidationContentOffset = a3;
}

- (double)nextAvailableLoadMoreInterval
{
  return self->_nextAvailableLoadMoreInterval;
}

- (void)setNextAvailableLoadMoreInterval:(double)a3
{
  self->_nextAvailableLoadMoreInterval = a3;
}

- (_TtC10MobileMail37ConversationNavigationBarItemsManager)barItemsManager
{
  return self->_barItemsManager;
}

- (NSArray)defaultBarButtons
{
  return self->_defaultBarButtons;
}

- (void)setDefaultBarButtons:(id)a3
{
}

- (void)setConversationLayout:(id)a3
{
}

- (ConversationHeaderView)conversationHeaderView
{
  return self->_conversationHeaderView;
}

- (void)setConversationHeaderView:(id)a3
{
}

- (NSIndexPath)lastExpandedCellIndexPath
{
  return self->_lastExpandedCellIndexPath;
}

- (void)setLastExpandedCellIndexPath:(id)a3
{
}

- (MFConversationCellExpansionGestureRecognizer)cellExpansionRecognizer
{
  return self->_cellExpansionRecognizer;
}

- (void)setCellExpansionRecognizer:(id)a3
{
}

- (void)setRestorationFuture:(id)a3
{
}

- (BOOL)didCompleteFirstPaint
{
  return self->_didCompleteFirstPaint;
}

- (NSMutableDictionary)cellHeightCache
{
  return self->_cellHeightCache;
}

- (void)setCellHeightCache:(id)a3
{
}

- (void)setCellConfigurator:(id)a3
{
}

- (MFMessageViewControllerReuseQueue)messageViewControllerReuseQueue
{
  return self->_messageViewControllerReuseQueue;
}

- (void)setMessageViewControllerReuseQueue:(id)a3
{
}

- (void)setScene:(id)a3
{
}

- (BOOL)didNotifyExtendedLaunchTracker
{
  return self->_didNotifyExtendedLaunchTracker;
}

- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3
{
  self->_didNotifyExtendedLaunchTracker = a3;
}

- (BOOL)disableScrollPinning
{
  return self->_disableScrollPinning;
}

- (BlankConversationController)blankConversationController
{
  return self->_blankConversationController;
}

- (void)setBlankConversationController:(id)a3
{
}

- (EFLocked)quickReplyAnimationContext
{
  return self->_quickReplyAnimationContext;
}

- (BOOL)isPerformingQuickReplySendAnimation
{
  return self->_isPerformingQuickReplySendAnimation;
}

- (void)setIsPerformingQuickReplySendAnimation:(BOOL)a3
{
  self->_isPerformingQuickReplySendAnimation = a3;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (void)setHorizontalPadding:(double)a3
{
  self->_double horizontalPadding = a3;
}

- (double)quickReplyHeight
{
  return self->_quickReplyHeight;
}

- (void)setQuickReplyHeight:(double)a3
{
  self->_quickReplydouble Height = a3;
}

- (void)setForceCollapsedSenderHeader:(BOOL)a3
{
  self->_forceCollapsedSenderHeader = a3;
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (int64_t)totalUnfilteredMessageCount
{
  return self->_totalUnfilteredMessageCount;
}

- (void)setTotalUnfilteredMessageCount:(int64_t)a3
{
  self->_totalUnfilteredMessageCount = a3;
}

- (void)setStaticSenderHeaderView:(id)a3
{
}

- (void)setExpandableSenderHeaderView:(id)a3
{
}

- (void)setSenderHeaderViewAnimator:(id)a3
{
}

- (int64_t)initialSenderHeaderExpansionStatus
{
  return self->_initialSenderHeaderExpansionStatus;
}

- (void)setInitialSenderHeaderExpansionStatus:(int64_t)a3
{
  self->_initialSenderHeaderExpansionStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderHeaderViewAnimator, 0);
  objc_storeStrong((id *)&self->_expandableSenderHeaderView, 0);
  objc_storeStrong((id *)&self->_staticSenderHeaderView, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);
  objc_storeStrong((id *)&self->_quickReplyAnimationContext, 0);
  objc_storeStrong((id *)&self->_blankConversationController, 0);
  objc_storeStrong((id *)&self->_conversationSearchHandler, 0);
  objc_storeStrong((id *)&self->_findInteraction, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_messageViewControllerReuseQueue, 0);
  objc_storeStrong((id *)&self->_cellConfigurator, 0);
  objc_storeStrong((id *)&self->_cellHeightCache, 0);
  objc_storeStrong((id *)&self->_restorationFuture, 0);
  objc_storeStrong((id *)&self->_cellExpansionRecognizer, 0);
  objc_storeStrong((id *)&self->_lastExpandedCellIndexPath, 0);
  objc_storeStrong((id *)&self->_conversationHeaderView, 0);
  objc_storeStrong((id *)&self->_conversationLayout, 0);
  objc_storeStrong((id *)&self->_defaultBarButtons, 0);
  objc_storeStrong((id *)&self->_barItemsManager, 0);
  objc_storeStrong((id *)&self->_previewState, 0);
  objc_storeStrong((id *)&self->_resizingContentViews, 0);
  objc_storeStrong((id *)&self->_pagingAnimator, 0);
  objc_storeStrong((id *)&self->_currentVisibleMessageStrategy, 0);
  objc_storeStrong((id *)&self->_assistantContextProvider, 0);
  objc_storeStrong((id *)&self->_handoffCoordinator, 0);
  objc_storeStrong((id *)&self->_textSelectionScrollHandler, 0);
  objc_storeStrong((id *)&self->_removedSingleMessageIndexPath, 0);
  objc_storeStrong((id *)&self->_conversationSubject, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_senderHeaderLayoutGuideTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_senderHeaderLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_senderHeaderLayoutGuideTopConstraint, 0);
  objc_storeStrong((id *)&self->_senderHeaderLayoutGuide, 0);
  objc_storeStrong((id *)&self->_tapGestureTitleView, 0);
  objc_storeStrong((id *)&self->_forceCollapsedSenderHeaderToken, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_storeStrong((id *)&self->_focusedMessage, 0);
  objc_storeStrong((id *)&self->_referenceMessageListItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_arrowControlsView, 0);
  objc_storeStrong((id *)&self->_pinnedItem, 0);

  objc_storeStrong((id *)&self->_conversationView, 0);
}

@end