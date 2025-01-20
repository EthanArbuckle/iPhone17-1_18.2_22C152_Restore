@interface CatalogViewController
- (BOOL)_completionsViewControllerIsTranslucent;
- (BOOL)_shouldPresentCompletionDetailViewControllerAfterSizeTransition:(id)a3;
- (BOOL)_shouldTakeOwnershipOfCompletionsViewController;
- (BOOL)_shouldUsePopoverForCompletions;
- (BOOL)_showCompletionsInPopover;
- (BOOL)checkAndResetIfNextSnapshotRequiresScreenUpdates;
- (BOOL)completionDetailIsPresented;
- (BOOL)completionListHasScheduledDismissal:(id)a3;
- (BOOL)hasScheduledCompletionListDismissal;
- (BOOL)isContentBorrowed;
- (BOOL)isShowingCompletionDetail;
- (BOOL)isShowingCompletions;
- (BOOL)isShowingUniversalSearchFirstTimeExperience;
- (BOOL)isShowingUniversalSearchPrivacyDetails;
- (BOOL)popoverIsShowing;
- (BOOL)shouldPutMetadataOnPasteboardForUnifiedField:(id)a3;
- (BOOL)startPageDidAppearAtLeastOnce;
- (BOOL)startPageViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:(id)a3;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)unifiedField:(id)a3 shouldWaitForTopHitForText:(id)a4;
- (BOOL)unifiedFieldCanBecomeFirstResponder:(id)a3;
- (BOOL)usesPopoverStyleForFavorites;
- (CGRect)snapshotContentRectInBounds:(CGRect)a3;
- (CatalogViewController)initWithDelegate:(id)a3 browserController:(id)a4;
- (CatalogViewControllerDelegate)delegate;
- (CompletionItem)lastTopHitMatch;
- (CompletionList)completionList;
- (LoadProgressObserver)loadProgressObserver;
- (NSString)libraryType;
- (NSString)queryString;
- (SFStartPageScrollObserver)startPageScrollObserver;
- (StartPageController)startPageController;
- (UIButton)sidebarButton;
- (UIColor)snapshotBackgroundColor;
- (UIEdgeInsets)obscuredInsets;
- (UIPopoverPresentationController)popoverPresentationController;
- (UIView)snapshotContentView;
- (UnifiedField)textField;
- (UniversalSearchSession)parsecSearchSession;
- (_SFNavigationBarCommon)navigationBar;
- (double)chromelessScrollDistance;
- (double)maxContentHeight;
- (double)navigationBarHeight;
- (double)requiredContentWidth;
- (double)startPageViewControllerTopPadding:(id)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cancelBarButtonItem;
- (id)_cellHeightCacheKeyForCompletionItem:(id)a3 indexPath:(id)a4;
- (id)_completionItemAtIndexPath:(id)a3;
- (id)browserController;
- (id)childViewControllerForStatusBarStyle;
- (id)completionsViewController;
- (id)completionsViewControllerIfLoaded;
- (id)currentMetadataForUnifiedField:(id)a3;
- (id)searchUIFeedbackDelegate;
- (id)startPageViewController;
- (id)startPageViewController:(id)a3 leadingBarItemsForSection:(id)a4;
- (id)startPageViewController:(id)a3 trailingBarItemsForSection:(id)a4;
- (id)startPageViewControllerTitleForRootView:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)unifiedField:(id)a3 topHitForText:(id)a4;
- (id)unifiedTextField;
- (id)universalSearchFirstTimeExperienceViewController;
- (int64_t)_completionListQueryID;
- (int64_t)_relevanceForItem:(id)a3;
- (int64_t)_relevanceForResult:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)startPageCustomizationPolicy;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_beginParsecSessionIfNeeded;
- (void)_cancelClearingCompletionListCaches;
- (void)_clearCompletionListCachesSoon;
- (void)_clearParsecSearchSession;
- (void)_commitVoiceSearchIfNecessary;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_deselectCompletionsViewControllerSelectedRow;
- (void)_dismissPopoverAnimated:(BOOL)a3 dismissalReason:(int64_t)a4 completionHandler:(id)a5;
- (void)_dismissUniversalSearchFirstTimeExperience:(id)a3 dismissalReason:(int64_t)a4;
- (void)_dismissUniversalSearchFirstTimeExperience:(id)a3 dismissalReason:(int64_t)a4 completionHandler:(id)a5;
- (void)_ensureCompletionListAndParsecSession;
- (void)_executeActionForParsecResultAtIndexPath:(id)a3 tableView:(id)a4;
- (void)_executeActionForParsecResultTableViewCell:(id)a3 completionItem:(id)a4;
- (void)_generateVisibleResultsFeedbackForEvent:(int64_t)a3;
- (void)_invalidatePendingVoiceSearchTimer;
- (void)_keyboardDidHide:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_logQueryEngagement;
- (void)_logTopHitWasChosen:(BOOL)a3;
- (void)_parsecEnabledDidChange:(id)a3;
- (void)_popoverDismissCompletion;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_preselectCompletionItemIfNecessaryForQueryString:(id)a3;
- (void)_presentPopoverWithViewController:(id)a3;
- (void)_presentPopoverWithViewController:(id)a3 completionHandler:(id)a4;
- (void)_presentStagedCompletionDetailViewControllerAnimated:(BOOL)a3;
- (void)_reloadCompletionTable;
- (void)_selectedCompletionItemAtIndexPath:(id)a3;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)_setShowingCompletions:(BOOL)a3 popoverDismissalReason:(int64_t)a4 completionHandler:(id)a5;
- (void)_showCompletionsPopoverIfNecessary;
- (void)_showStartPageInPopover;
- (void)_textFieldEditingChanged;
- (void)_updateAlternateContentViewController;
- (void)_updateBackgroundColorWhenShowingFavoritesNavigationController;
- (void)_updatePersonalisationDataForDonation:(id)a3 forPosition:(unint64_t)a4;
- (void)_updateStartPageSafeAreaInsets;
- (void)_updateVisibilityForCompletionListTableView:(id)a3;
- (void)_updateVoiceSearchState;
- (void)beginTransitionToNewSizeClassWithState:(id)a3;
- (void)cancelFavoritesGestures;
- (void)clearCachedTabCompletionData;
- (void)completionList:(id)a3 didFetchFavicon:(id)a4 forRowAtIndexPath:(id)a5;
- (void)completionList:(id)a3 didRemoveItem:(id)a4 wasLastInSection:(BOOL)a5 atIndexPath:(id)a6 withCompletionHandler:(id)a7;
- (void)completionList:(id)a3 topHitDidBecomeReadyForString:(id)a4;
- (void)completionList:(id)a3 willGoToURL:(id)a4 fromPegasusSearchResult:(id)a5 forImageAttribution:(BOOL)a6;
- (void)completionListDidDismissSearchUIViewController:(id)a3;
- (void)completionListDidRestoreCachedCompletions:(id)a3;
- (void)completionListDidUpdate:(id)a3 forQuery:(id)a4;
- (void)dealloc;
- (void)didCancelUniversalSearchFirstTimeExperienceViewController:(id)a3;
- (void)didGainOwnershipOfCompletionsViewController;
- (void)didGainOwnershipOfStartPageViewController;
- (void)didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController;
- (void)didInteractWithUniversalSearchFirstTimeExperienceViewController:(id)a3;
- (void)didTogglePrivateBrowsing;
- (void)didUpdateObscuredInsetsForSizeTransition;
- (void)dismissCompletionDetailWindowAndResumeEditingIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissCompletionsForSizeClassTransition;
- (void)dismissUniversalSearchFirstTimeExperienceViewControllerIfNeeded;
- (void)dismissWebSearchTipIfNeeded;
- (void)displayPopover;
- (void)endTransitionToNewSizeClassWithState:(id)a3;
- (void)feedbackButtonWasTappedWithProblemURL:(id)a3;
- (void)findOnPage;
- (void)firstTimeExperienceContinueButtonPressed;
- (void)goToURL:(id)a3;
- (void)goToURLString:(id)a3;
- (void)horizontalSizeClassDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)ignorePreviousLayoutSize;
- (void)openURLInExternalApplication:(id)a3;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentDetail:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)relinquishOwnershipOfCompletionsViewControllerFromCurrentParent;
- (void)relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent;
- (void)reloadNavigationItemAnimated:(BOOL)a3;
- (void)reportUnifiedFieldSearchDidCancel;
- (void)resetFavorites;
- (void)resetPrivateBrowsingExplanation;
- (void)resume;
- (void)resumeEditingIfNeeded:(BOOL)a3;
- (void)resumeSearchWithQuery:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)search:(id)a3;
- (void)searchTextCompletionAccessoryButtonTappedForCompletionItem:(id)a3;
- (void)setCompletionList:(id)a3;
- (void)setContentBorrowed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHasScheduledCompletionListDismissal:(BOOL)a3;
- (void)setLastTopHitMatch:(id)a3;
- (void)setLibraryType:(id)a3;
- (void)setLoadProgressObserver:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setObscuredInsets:(UIEdgeInsets)a3;
- (void)setParsecSearchSession:(id)a3;
- (void)setQueryString:(id)a3;
- (void)setShowingCompletions:(BOOL)a3;
- (void)setShowingCompletions:(BOOL)a3 completionHandler:(id)a4;
- (void)setStartPageScrollObserver:(id)a3;
- (void)setTextField:(id)a3;
- (void)setUsesPopoverStyleForFavorites:(BOOL)a3;
- (void)showUniversalSearchFirstTimeExperienceIfNotShowing;
- (void)startPageControllerDidCompleteDismissGesture:(id)a3;
- (void)startPageControllerDidCompleteUnfocusGesture:(id)a3;
- (void)startPageUpdatePolicyDidChange;
- (void)startPageViewController:(id)a3 willPresentCustomizationViewController:(id)a4;
- (void)startPageViewControllerDidAppear:(id)a3;
- (void)startPageViewControllerDidScroll:(id)a3 animated:(BOOL)a4;
- (void)startPageViewControllerDidUpdateContent:(id)a3;
- (void)stopCompleting;
- (void)switchToTabWithUUID:(id)a3 inWindowWithUUID:(id)a4 forTabGroupWithUUID:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)tableViewDidFinishReload:(id)a3;
- (void)test_simulateTyping:(id)a3 inGroup:(id)a4 startIndex:(unint64_t)a5;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)toggleVoiceSearch;
- (void)unifiedField:(id)a3 didEndEditingWithAddress:(id)a4;
- (void)unifiedField:(id)a3 didEndEditingWithParsecTopHit:(id)a4;
- (void)unifiedField:(id)a3 didEndEditingWithSearch:(id)a4;
- (void)unifiedField:(id)a3 didEngageWithQuerySuggestion:(id)a4 forQueryString:(id)a5;
- (void)unifiedField:(id)a3 focusNextKeyView:(BOOL)a4;
- (void)unifiedField:(id)a3 moveCompletionSelectionByRowOffset:(int64_t)a4;
- (void)unifiedField:(id)a3 moveCompletionSelectionBySectionOffset:(int64_t)a4;
- (void)unifiedField:(id)a3 willUpdateUserTypedText:(id)a4 toText:(id)a5;
- (void)unifiedFieldExternalSearchDidEnd:(id)a3;
- (void)unifiedFieldMakeWindowKey:(id)a3;
- (void)unifiedFieldReflectedItemDidChange:(id)a3;
- (void)unifiedFieldSelectCompletionItemIfAvailable:(id)a3;
- (void)unifiedFieldShouldPasteAndNavigate:(id)a3;
- (void)unifiedFieldVoiceSearchStateDidChange:(id)a3;
- (void)updatePreferredContentSize;
- (void)updateQuerySuggestionsFromResponse:(id)a3;
- (void)updateStartPageControlTintColor;
- (void)updateStartPageCustomizationPolicy;
- (void)updateStartPageHidesEmptyRootViewNavigationBar;
- (void)updateStartPageTopSpacing;
- (void)updateTabGroupHeading;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willGoToURLFromPegasusSearchResult:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
- (void)willUpdateObscuredInsetsForSizeTransition;
@end

@implementation CatalogViewController

- (void)updateTabGroupHeading
{
  self->_nextSnapshotRequiresScreenUpdates = 1;
}

- (BOOL)startPageDidAppearAtLeastOnce
{
  return self->_startPageDidAppearAtLeastOnce;
}

- (BOOL)popoverIsShowing
{
  popoverPresentationController = self->_popoverPresentationController;
  if (popoverPresentationController)
  {
    v5 = [(UIPopoverPresentationController *)popoverPresentationController containerView];
    v6 = [v5 window];
    if (v6
      || ([(UIPopoverPresentationController *)self->_popoverPresentationController presentingViewController], (v2 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      v8 = [WeakRetained rootViewController];
      v9 = [v8 topBar];
      BOOL v10 = v9 != 0;

      if (v6)
      {
LABEL_9:

        return v10;
      }
    }
    else
    {
      BOOL v10 = 0;
    }

    goto LABEL_9;
  }
  return 0;
}

- (void)setObscuredInsets:(UIEdgeInsets)a3
{
  if (self->_obscuredInsets.left != a3.left
    || self->_obscuredInsets.top != a3.top
    || self->_obscuredInsets.right != a3.right
    || self->_obscuredInsets.bottom != a3.bottom)
  {
    self->_obscuredInsets = a3;
    [(CatalogViewController *)self _updateStartPageSafeAreaInsets];
    id v7 = [(CatalogViewController *)self view];
    [v7 setNeedsLayout];
  }
}

- (void)startPageViewControllerDidScroll:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (![(CatalogViewController *)self isShowingCompletions]
    && [v10 showsWallpaper])
  {
    [v10 scrollDistance];
    SFChromeVisibilityForScrollDistance();
    double v7 = v6;
    v8 = [(UIBarButtonItem *)self->_cancelBarButton customView];
    [v8 setOpaqueBackgroundVisibility:v7];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerDidScroll:self animated:v4];
}

- (BOOL)isShowingCompletions
{
  return self->_showingCompletions;
}

- (void)startPageViewControllerDidUpdateContent:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  [WeakRetained setNeedsSnapshotUpdateForActiveTabIfTabIsBlank];
}

- (void)dismissUniversalSearchFirstTimeExperienceViewControllerIfNeeded
{
  if ([(CatalogViewController *)self isShowingUniversalSearchFirstTimeExperience])
  {
    id v3 = [(CatalogViewController *)self universalSearchFirstTimeExperienceViewController];
    [(CatalogViewController *)self didCancelUniversalSearchFirstTimeExperienceViewController:v3];
  }
}

- (BOOL)isShowingUniversalSearchFirstTimeExperience
{
  id v3 = [(UniversalSearchFirstTimeExperienceViewController *)self->_universalSearchFirstTimeExperienceViewController parentViewController];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(UniversalSearchFirstTimeExperienceViewController *)self->_universalSearchFirstTimeExperienceViewController presentingViewController];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CatalogViewController;
  [(CatalogViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(CatalogViewController *)self _updateStartPageSafeAreaInsets];
}

- (void)updatePreferredContentSize
{
  v3.receiver = self;
  v3.super_class = (Class)CatalogViewController;
  [(AbstractCatalogViewController *)&v3 updatePreferredContentSize];
  [(AbstractCatalogViewController *)self->_popoverCatalogViewController updatePreferredContentSize];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CatalogViewController;
  [(CatalogViewController *)&v5 viewDidLayoutSubviews];
  [(CatalogViewController *)self requiredContentWidth];
  double v4 = v3;
  [(SFPopoverSizingTableViewController *)self->_completionsViewController preferredContentSize];
  [(CompletionListTableViewController *)self->_completionsViewController setPreferredContentSize:v4];
}

- (double)requiredContentWidth
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerPopoverWidth:self];
  double v5 = v4;

  return v5;
}

- (void)_updateStartPageSafeAreaInsets
{
  if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:self->_startPageViewController])
  {
    id v12 = [(CatalogViewController *)self view];
    [v12 safeAreaInsets];
    UIEdgeInsetsSubtract();
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(CatalogViewController *)self startPageViewController];
    objc_msgSend(v11, "setAdditionalSafeAreaInsets:", v4, v6, v8, v10);
  }
}

- (void)viewWillLayoutSubviews
{
  id v41 = [(CatalogViewController *)self view];
  [v41 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = self->_completionsViewController;
  if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v11])
  {
    id v12 = [(CatalogViewController *)self view];
    [v12 safeAreaInsets];
    UIEdgeInsetsSubtract();

    UIEdgeInsetsMax();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(CompletionListTableViewController *)v11 tableView];
    objc_msgSend(v21, "setFrame:", v4, v6, v8, v10);
    objc_msgSend(v21, "setContentInset:", v14, v16, v18, v20);
    objc_msgSend(v21, "setScrollIndicatorInsets:", v14, v16, v18, v20);
  }
  v22 = self->_startPageViewController;
  if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v22])
  {
    [(_SFNavigationBarCommon *)self->_navigationBar layoutIfNeeded];
    [(_SFNavigationBarCommon *)self->_navigationBar urlOutlineFrameRelativeToView:v41];
    CGFloat x = v43.origin.x;
    CGFloat y = v43.origin.y;
    CGFloat width = v43.size.width;
    CGFloat height = v43.size.height;
    if (!CGRectEqualToRect(v43, *MEMORY[0x1E4F1DB28]))
    {
      v44.origin.CGFloat x = x;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = height;
      CGRectGetMinX(v44);
      v45.origin.CGFloat x = v4;
      v45.origin.CGFloat y = v6;
      v45.size.CGFloat width = v8;
      v45.size.CGFloat height = v10;
      CGRectGetWidth(v45);
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      CGRectGetMaxX(v46);
    }
    if (self->_startPageGeometryIsFrozen)
    {
      BOOL startPageGeometryIsFrozen = 1;
    }
    else
    {
      v28 = [(SFStartPageViewController *)v22 view];
      objc_msgSend(v28, "setFrame:", v4, v6, v8, v10);
      if ([MEMORY[0x1E4F97EA0] is2024FavoritesEnabled])
      {
        v29 = [(CatalogViewController *)self view];
        objc_msgSend(v29, "_sf_hasLandscapeAspectRatio");
      }
      v47.origin.CGFloat x = v4;
      v47.origin.CGFloat y = v6;
      v47.size.CGFloat width = v8;
      v47.size.CGFloat height = v10;
      CGRectGetWidth(v47);
      _SFRoundFloatToPixels();
      if (!self->_usesPopoverStyleForFavorites)
      {
        v30 = [(CatalogViewController *)self traitCollection];
        [v30 horizontalSizeClass];
      }
      _SFDefaultLayoutMargins();
      UIEdgeInsetsReplace();
      objc_msgSend(v28, "setLayoutMargins:");

      BOOL startPageGeometryIsFrozen = self->_startPageGeometryIsFrozen;
    }
    self->_startPageGeometryWasFrozenDuringLastLayout = startPageGeometryIsFrozen;
  }
  v31 = self->_universalSearchFirstTimeExperienceViewController;
  if ([(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v31])
  {
    UIEdgeInsetsReplace();
    double v33 = v4 + v32;
    double v35 = v6 + v34;
    double v37 = v8 - (v32 + v36);
    double v39 = v10 - (v34 + v38);
    v40 = [(UniversalSearchFirstTimeExperienceViewController *)v31 view];
    objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);
  }
}

- (id)childViewControllerForStatusBarStyle
{
  double v3 = [(AbstractCatalogViewController *)self foregroundChildViewController];
  double v4 = v3;
  if (v3 == self->_startPageViewController)
  {
    BOOL v5 = [(AbstractCatalogViewController *)self isResponsibleForLayoutOfViewController:v3];

    if (v5)
    {
      double v6 = self->_startPageViewController;
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v6 = 0;
LABEL_6:
  return v6;
}

- (id)startPageViewController
{
  return self->_startPageViewController;
}

- (id)universalSearchFirstTimeExperienceViewController
{
  return self->_universalSearchFirstTimeExperienceViewController;
}

- (id)completionsViewControllerIfLoaded
{
  return self->_completionsViewController;
}

- (double)maxContentHeight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerPopoverMaxHeight:self];
  double v5 = v4;

  return v5;
}

- (void)_beginParsecSessionIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  BOOL v3 = +[UniversalSearchFirstTimeExperienceViewController hasShownParsecFirstTimeUserExperience];
  if (!self->_parsecSearchSession)
  {
    BOOL v4 = v3;
    if ([MEMORY[0x1E4F98E40] areSiriSearchSuggestionsEnabled])
    {
      double v5 = [WeakRetained configuration];
      int v6 = [v5 allowsSearchFeedback] & v4;

      if (v6 == 1)
      {
        double v7 = [WeakRetained universalSearchSession];
        parsecSearchSession = self->_parsecSearchSession;
        self->_parsecSearchSession = v7;

        double v9 = self->_parsecSearchSession;
        double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v10 scale];
        -[WBSParsecDSession setUIScale:](v9, "setUIScale:");

        [(CompletionList *)self->_completionList setParsecSearchSession:self->_parsecSearchSession];
      }
    }
  }
}

- (double)startPageViewControllerTopPadding:(id)a3
{
  BOOL v4 = [(StartPageController *)self->_startPageController libraryType];

  double result = 0.0;
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    int v7 = [WeakRetained shouldIncreaseTopSpacingForStartPageController:self->_startPageController];

    double result = *MEMORY[0x1E4F78770];
    if (v7) {
      return 34.0;
    }
  }
  return result;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  self->_contentOverlayInsets = a3;
  if (!self->_contentBorrowed)
  {
    v3.receiver = self;
    v3.super_class = (Class)CatalogViewController;
    -[CatalogViewController _setContentOverlayInsets:](&v3, sel__setContentOverlayInsets_);
  }
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)CatalogViewController;
  [(CatalogViewController *)&v12 viewDidLoad];
  objc_super v3 = [(CatalogViewController *)self view];
  [v3 setAutoresizingMask:0];
  [v3 setClipsToBounds:1];
  BOOL v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:0];

  double v5 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
  [v3 setTintColor:v5];

  int v6 = [(SFStartPageViewController *)self->_startPageViewController title];
  [(CatalogViewController *)self setTitle:v6];

  int v7 = [(SFStartPageViewController *)self->_startPageViewController view];
  [v7 setAutoresizingMask:0];
  [v7 setInsetsLayoutMarginsFromSafeArea:0];
  if (self->_usesPopoverStyleForFavorites)
  {
    [(AbstractCatalogViewController *)self->_popoverCatalogViewController takeOwnershipOfStartPageViewController];
    [(PopoverCatalogViewController *)self->_popoverCatalogViewController updateStartPagePreferredContentSize];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    double v9 = [WeakRetained rootViewController];
    double v10 = objc_msgSend(v9, "_sf_viewControllerToPresentFrom");
    v11 = [v10 presentedViewController];

    if (!v11) {
      [(CatalogViewController *)self _presentPopoverWithViewController:self->_popoverCatalogViewController];
    }
  }
  else
  {
    [(AbstractCatalogViewController *)self takeOwnershipOfStartPageViewController];
  }
  [(CatalogViewController *)self updateStartPageControlTintColor];
}

- (void)updateStartPageControlTintColor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v3 = [WeakRetained isPrivateBrowsingEnabled];
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4FB1618] labelColor];
  }
  else
  {
    BOOL v4 = 0;
  }
  double v5 = [(StartPageController *)self->_startPageController viewController];
  [v5 setPreferredControlTintColor:v4];

  if (v3) {
}
  }

- (void)didGainOwnershipOfStartPageViewController
{
  [(CatalogViewController *)self _updateBackgroundColorWhenShowingFavoritesNavigationController];
  startPageController = self->_startPageController;
  [(StartPageController *)startPageController setShowingAsPopover:0];
}

- (void)_updateBackgroundColorWhenShowingFavoritesNavigationController
{
}

uint64_t __55__CatalogViewController_startPageUpdatePolicyDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1280) updatePolicyDidChange];
  v2 = *(void **)(a1 + 32);
  return [v2 updateStartPageCustomizationPolicy];
}

- (id)startPageViewControllerTitleForRootView:(id)a3
{
  int v3 = [(StartPageController *)self->_startPageController libraryType];
  BOOL v4 = v3;
  if (v3)
  {
    double v5 = startPageTitleForCollectionType(v3);
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (CatalogViewController)initWithDelegate:(id)a3 browserController:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CatalogViewController;
  double v8 = [(CatalogViewController *)&v32 initWithNibName:0 bundle:0];
  double v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_browserController, v7);
    objc_storeWeak((id *)&v9->_delegate, v6);
    double v10 = [v6 catalogViewControllerStartPageVisualStyleProvider:v9];
    if (v10) {
      v11 = [[StartPageController alloc] initWithVisualStyleProvider:v10];
    }
    else {
      v11 = objc_alloc_init(StartPageController);
    }
    startPageController = v9->_startPageController;
    v9->_startPageController = v11;

    [(StartPageController *)v9->_startPageController setDataSource:v7];
    double v13 = [v7 tabController];
    double v14 = [v13 activeTabDocument];
    double v15 = [v14 libraryType];
    [(StartPageController *)v9->_startPageController setLibraryType:v15];

    double v16 = +[Application sharedApplication];
    double v17 = [v16 tabGroupManager];

    [v17 addTabGroupObserver:v9->_startPageController];
    [v17 addCloudTabsObserver:v9->_startPageController];
    [(CatalogViewController *)v9 updateStartPageCustomizationPolicy];
    [(CatalogViewController *)v9 updateStartPageHidesEmptyRootViewNavigationBar];
    double v18 = [(StartPageController *)v9->_startPageController viewController];
    [v18 setDelegate:v9];
    objc_storeStrong((id *)&v9->_startPageViewController, v18);
    double v19 = objc_alloc_init(PopoverCatalogViewController);
    popoverCatalogViewController = v9->_popoverCatalogViewController;
    v9->_popoverCatalogViewController = v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    seenVisibleResults = v9->_seenVisibleResults;
    v9->_seenVisibleResults = (NSMutableSet *)v21;

    [(PopoverCatalogViewController *)v9->_popoverCatalogViewController setPrimaryCatalogViewController:v9];
    if ([v6 catalogViewControllerShouldRequestNetworkedSuggestions:v9]) {
      [(CatalogViewController *)v9 _beginParsecSessionIfNeeded];
    }
    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v9 selector:sel__parsecEnabledDidChange_ name:*MEMORY[0x1E4F99640] object:0];
    [v23 addObserver:v9 selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v23 addObserver:v9 selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];
    [v23 addObserver:v9 selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v23 addObserver:v9 selector:sel__keyboardDidHide_ name:*MEMORY[0x1E4FB2BC0] object:0];
    v34[0] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    id v25 = (id)[(CatalogViewController *)v9 registerForTraitChanges:v24 withTarget:v9 action:sel_horizontalSizeClassDidChange_previousTraitCollection_];

    uint64_t v33 = objc_opt_class();
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    id v27 = (id)[(CatalogViewController *)v9 registerForTraitChanges:v26 withTarget:v9 action:sel__preferredContentSizeCategoryDidChange];

    v28 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    tableViewCellHeightCache = v9->_tableViewCellHeightCache;
    v9->_tableViewCellHeightCache = v28;

    [(NSCache *)v9->_tableViewCellHeightCache setCountLimit:45];
    v30 = v9;
  }
  return v9;
}

- (void)updateStartPageHidesEmptyRootViewNavigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v3 = [WeakRetained rootViewController];
  if ([v3 isUsingBottomCapsule]) {
    uint64_t v4 = [WeakRetained usesNarrowLayout] ^ 1;
  }
  else {
    uint64_t v4 = 1;
  }
  double v5 = [(StartPageController *)self->_startPageController viewController];
  [v5 setRootViewHidesEmptyNavigationBar:v4];
}

- (void)startPageUpdatePolicyDidChange
{
  int v3 = [(StartPageController *)self->_startPageController viewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__CatalogViewController_startPageUpdatePolicyDidChange__block_invoke;
  v4[3] = &unk_1E6D77E20;
  v4[4] = self;
  [v3 coalesceDataReloadWithBlock:v4 animatingDifferences:1];
}

- (void)updateStartPageCustomizationPolicy
{
  int64_t v3 = [(CatalogViewController *)self startPageCustomizationPolicy];
  id v4 = [(StartPageController *)self->_startPageController viewController];
  [v4 setCustomizationPolicy:v3];
}

- (int64_t)startPageCustomizationPolicy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (self->_usesPopoverStyleForFavorites) {
    goto LABEL_8;
  }
  id v4 = [(StartPageController *)self->_startPageController libraryType];
  if (v4)
  {

LABEL_8:
    int64_t v6 = 2;
    goto LABEL_9;
  }
  if (![WeakRetained canPerformPostLaunchActions]) {
    goto LABEL_8;
  }
  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  if (([v5 catalogViewControllerShouldUsePopoverForCompletions:self] & 1) != 0
    || self->_usesPopoverStyleForFavorites)
  {

    int64_t v6 = 0;
  }
  else
  {
    double v8 = [WeakRetained tabController];
    double v9 = [v8 activeTabDocument];
    int64_t v6 = [v9 isBlank] ^ 1;
  }
LABEL_9:

  return v6;
}

- (void)resume
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v4 = [WeakRetained catalogViewControllerShouldRequestNetworkedSuggestions:self];

  if (v4)
  {
    [(CatalogViewController *)self _beginParsecSessionIfNeeded];
  }
}

- (void)resetFavorites
{
  int64_t v3 = [(StartPageController *)self->_startPageController libraryType];

  if (!v3)
  {
    [(StartPageController *)self->_startPageController updatePrivateBrowsingExplanationState];
    id v4 = [(StartPageController *)self->_startPageController viewController];
    objc_msgSend(v4, "resetToRootViewWithCustomizationPolicy:", -[CatalogViewController startPageCustomizationPolicy](self, "startPageCustomizationPolicy"));
  }
}

- (void)dismissWebSearchTipIfNeeded
{
}

- (UIButton)sidebarButton
{
  sidebarButton = self->_sidebarButton;
  if (!sidebarButton)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v5 = [WeakRetained makeSidebarButton];
    int64_t v6 = self->_sidebarButton;
    self->_sidebarButton = v5;

    sidebarButton = self->_sidebarButton;
  }
  return sidebarButton;
}

- (void)setLibraryType:(id)a3
{
  id v7 = a3;
  id v4 = [(StartPageController *)self->_startPageController libraryType];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    [(StartPageController *)self->_startPageController setLibraryType:v7];
    int64_t v6 = [(StartPageController *)self->_startPageController viewController];
    objc_msgSend(v6, "resetToRootViewWithCustomizationPolicy:", -[CatalogViewController startPageCustomizationPolicy](self, "startPageCustomizationPolicy"));

    [(CatalogViewController *)self reloadNavigationItemAnimated:0];
  }
}

- (id)startPageViewController:(id)a3 trailingBarItemsForSection:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int64_t v6 = WeakRetained;
  if (self->_usesPopoverStyleForFavorites) {
    goto LABEL_3;
  }
  id v7 = [WeakRetained tabBarManager];
  uint64_t v8 = [v7 displayMode];

  if (v8) {
    goto LABEL_3;
  }
  v11 = [v6 tabController];
  objc_super v12 = [v11 activeTabDocument];
  if ([v12 isBlank] && !objc_msgSend(v6, "isFavoritesFieldFocused"))
  {
    double v16 = [(UnifiedField *)self->_textField superview];

    if (!v16)
    {
LABEL_3:
      double v9 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_4;
    }
  }
  else
  {
  }
  double v13 = [v6 rootViewController];
  double v14 = [v13 capsuleCollectionViewLayout];

  if (v14 && [v14 integerValue] == 2)
  {
    double v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double v15 = [(CatalogViewController *)self _cancelBarButtonItem];
    v17[0] = v15;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
LABEL_4:

  return v9;
}

- (StartPageController)startPageController
{
  return self->_startPageController;
}

- (void)setUsesPopoverStyleForFavorites:(BOOL)a3
{
  if (self->_usesPopoverStyleForFavorites != a3)
  {
    self->_usesPopoverStyleForFavorites = a3;
    id v4 = [(StartPageController *)self->_startPageController viewController];
    objc_msgSend(v4, "reloadNavigationItemAnimated:", objc_msgSend(MEMORY[0x1E4FB1EB0], "areAnimationsEnabled"));

    [(CatalogViewController *)self updateStartPageCustomizationPolicy];
  }
}

- (void)setNavigationBar:(id)a3
{
  char v5 = (_SFNavigationBarCommon *)a3;
  if (self->_navigationBar != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_navigationBar, a3);
    int64_t v6 = [(_SFNavigationBarCommon *)self->_navigationBar textField];
    [(CatalogViewController *)self setTextField:v6];

    char v5 = v7;
  }
}

- (void)setStartPageScrollObserver:(id)a3
{
  startPageController = self->_startPageController;
  id v4 = a3;
  id v5 = [(StartPageController *)startPageController viewController];
  [v5 setScrollObserver:v4];
}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CatalogViewController *)self updateStartPageHidesEmptyRootViewNavigationBar];
  id v5 = [(StartPageController *)self->_startPageController viewController];
  [v5 reloadNavigationItemAnimated:v3];
}

- (void)setLoadProgressObserver:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_loadProgressObserver, obj);
    [(CompletionList *)self->_completionList setLoadProgressObserver:obj];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  if (!v4 && !self->_transitioningToNewSizeClass) {
    [(CatalogViewController *)self dismissCompletionDetailWindowAndResumeEditingIfNeeded:0 completionHandler:0];
  }
  id v5 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  [(CatalogViewController *)self _updateVisibilityForCompletionListTableView:v5];

  v6.receiver = self;
  v6.super_class = (Class)CatalogViewController;
  [(CatalogViewController *)&v6 willMoveToParentViewController:v4];
}

- (void)_updateVisibilityForCompletionListTableView:(id)a3
{
  id v6 = a3;
  id v4 = [MEMORY[0x1E4F78500] sharedManager];
  char v5 = [v4 liveCompletionList];

  if ((v5 & 1) == 0) {
    objc_msgSend(v6, "setHidden:", -[UnifiedField voiceSearchState](self->_textField, "voiceSearchState") == 1);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CatalogViewController;
  [(CatalogViewController *)&v4 viewDidAppear:a3];
  [(CatalogViewController *)self _deselectCompletionsViewControllerSelectedRow];
}

- (void)_deselectCompletionsViewControllerSelectedRow
{
  id v3 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  v2 = [v3 indexPathForSelectedRow];
  if (v2) {
    [v3 deselectRowAtIndexPath:v2 animated:1];
  }
}

- (id)startPageViewController:(id)a3 leadingBarItemsForSection:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v6 = WeakRetained;
  if (self->_usesPopoverStyleForFavorites) {
    goto LABEL_2;
  }
  double v9 = [WeakRetained tabBarManager];
  if (![v9 displayMode])
  {

    goto LABEL_2;
  }
  double v10 = [(StartPageController *)self->_startPageController libraryType];

  if (!v10)
  {
LABEL_2:
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_3;
  }
  id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
  objc_super v12 = [(CatalogViewController *)self sidebarButton];
  double v13 = (void *)[v11 initWithCustomView:v12];

  double v14 = _SFAccessibilityIdentifierForBarItem();
  [v13 setAccessibilityIdentifier:v14];

  v15[0] = v13;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

LABEL_3:
  return v7;
}

- (void)startPageViewControllerDidAppear:(id)a3
{
  if (!self->_startPageDidAppearAtLeastOnce)
  {
    self->_startPageDidAppearAtLeastOnce = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained catalogViewControllerDidAppear:self];
  }
}

- (void)setShowingCompletions:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)_setShowingCompletions:(BOOL)a3 popoverDismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke;
  v21[3] = &unk_1E6D77E70;
  id v9 = v8;
  id v22 = v9;
  uint64_t v10 = MEMORY[0x1E4E42950](v21);
  id v11 = (void *)v10;
  if (self->_showingCompletions != v6)
  {
    self->_showingCompletions = v6;
    if (a4 != 1 && !v6) {
      [(CompletionList *)self->_completionList clearCompletionListings];
    }
    objc_super v12 = dispatch_group_create();
    if (!v6)
    {
      if (a4 != 1) {
        [(CatalogViewController *)self _clearParsecSearchSession];
      }
      if (!self->_usesPopoverStyleForFavorites)
      {
        dispatch_group_enter(v12);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        void v17[2] = __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_3;
        v17[3] = &unk_1E6D77E20;
        double v18 = v12;
        [(CatalogViewController *)self _dismissPopoverAnimated:0 dismissalReason:a4 completionHandler:v17];
      }
      [(CatalogViewController *)self relinquishOwnershipOfCompletionsViewControllerFromCurrentParent];
      [(CatalogViewController *)self _showStartPageInPopover];
      goto LABEL_21;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v14 = [WeakRetained catalogViewControllerShouldUsePopoverForCompletions:self];

    if (v14)
    {
      if ([(UnifiedField *)self->_textField voiceSearchState] || self->_voiceSearchWasInProgress) {
        goto LABEL_18;
      }
      popoverCatalogViewController = self->_popoverCatalogViewController;
    }
    else
    {
      popoverCatalogViewController = self;
    }
    [popoverCatalogViewController takeOwnershipOfCompletionsViewController];
LABEL_18:
    double v16 = [(CatalogViewController *)self universalSearchFirstTimeExperienceViewController];
    if (v16)
    {
      dispatch_group_enter(v12);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2;
      v19[3] = &unk_1E6D77E20;
      double v20 = v12;
      [(CatalogViewController *)self _dismissUniversalSearchFirstTimeExperience:v16 dismissalReason:a4 completionHandler:v19];
    }
LABEL_21:
    dispatch_group_notify(v12, MEMORY[0x1E4F14428], v11);

    goto LABEL_22;
  }
  (*(void (**)(uint64_t))(v10 + 16))(v10);
LABEL_22:
}

uint64_t __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)test_simulateTyping:(id)a3 inGroup:(id)a4 startIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length] >= a5)
  {
    dispatch_time_t v10 = dispatch_time(0, 500000000);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke;
    v11[3] = &unk_1E6D78B38;
    unint64_t v15 = a5;
    id v12 = v8;
    id v13 = v9;
    int v14 = self;
    dispatch_after(v10, MEMORY[0x1E4F14428], v11);
  }
}

void __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == [*(id *)(a1 + 32) length])
  {
    id v3 = +[Application sharedApplication];
    [v3 startedSubTest:@"SearchPerformanceCompletionListRedraw" forTest:gCurrentTestName withMetrics:&unk_1F3C73DD0];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_2;
    id v13 = &unk_1E6D77D90;
    id v14 = v3;
    id v15 = *(id *)(a1 + 40);
    id v4 = v3;
    [v4 installCACommitCompletionBlock:&v10];
  }
  char v5 = objc_msgSend(*(id *)(a1 + 48), "textField", v10, v11, v12, v13);
  [*(id *)(a1 + 48) _ensureCompletionListAndParsecSession];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:", 0, *(void *)(a1 + 56));
  uint64_t v8 = v7;
  id v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v6, v7);
  [v5 setText:v9];

  [v5 _textDidChangeFromTyping];
  [*(id *)(a1 + 48) _textFieldEditingChanged];
  objc_msgSend(*(id *)(a1 + 48), "test_simulateTyping:inGroup:startIndex:", *(void *)(a1 + 32), *(void *)(a1 + 40), v8 + 1);
}

void __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishedSubTest:@"SearchPerformanceCompletionListRedraw" forTest:gCurrentTestName];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_3;
  block[3] = &unk_1E6D77E20;
  id v4 = *(id *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

void __73__CatalogViewController_Testing__test_simulateTyping_inGroup_startIndex___block_invoke_3(uint64_t a1)
{
}

- (int64_t)_completionListQueryID
{
  dispatch_time_t v2 = [(CompletionList *)self->_completionList query];
  int64_t v3 = [v2 queryID];
  if (!v3) {
    int64_t v3 = [MEMORY[0x1E4F98A50] currentQueryID];
  }

  return v3;
}

- (void)_parsecEnabledDidChange:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F98E40], "areSiriSearchSuggestionsEnabled", a3) & 1) == 0)
  {
    [(CatalogViewController *)self _clearParsecSearchSession];
  }
}

- (void)dealloc
{
  [(CatalogViewController *)self _invalidatePendingVoiceSearchTimer];
  [(CatalogViewController *)self _clearParsecSearchSession];
  int64_t v3 = [(CatalogViewController *)self unifiedTextField];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  id v4 = [(CompletionList *)self->_completionList delegate];

  if (v4 == self) {
    [(CompletionList *)self->_completionList setDelegate:0];
  }
  char v5 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  [v5 setDataSource:0];
  [v5 setDelegate:0];
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];

  uint64_t v7 = +[Application sharedApplication];
  uint64_t v8 = [v7 tabGroupManager];
  [v8 removeTabGroupObserver:self->_startPageController];

  v9.receiver = self;
  v9.super_class = (Class)CatalogViewController;
  [(CatalogViewController *)&v9 dealloc];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__CatalogViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E6D7E960;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:0];
}

void __76__CatalogViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = *(void **)(*(void *)(a1 + 32) + 1280);
  id v3 = a2;
  id v5 = [v2 viewController];
  uint64_t v4 = [v3 isAnimated];

  [v5 reloadNavigationItemAnimated:v4];
}

- (void)_preferredContentSizeCategoryDidChange
{
  [(NSCache *)self->_tableViewCellHeightCache removeAllObjects];
  [(CatalogViewController *)self _reloadCompletionTable];
}

- (void)horizontalSizeClassDidChange:(id)a3 previousTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "horizontalSizeClass", a3)
    && !self->_showingCompletions
    && ([(UnifiedField *)self->_textField isFirstResponder] & 1) == 0
    && !self->_transitioningToNewSizeClass)
  {
    completionList = self->_completionList;
    self->_completionList = 0;

    [(CatalogViewController *)self _reloadCompletionTable];
  }
}

- (void)willUpdateObscuredInsetsForSizeTransition
{
  self->_BOOL startPageGeometryIsFrozen = 1;
}

- (void)didUpdateObscuredInsetsForSizeTransition
{
  self->_BOOL startPageGeometryIsFrozen = 0;
  if (self->_startPageGeometryWasFrozenDuringLastLayout)
  {
    id v2 = [(CatalogViewController *)self view];
    [v2 setNeedsLayout];
  }
}

- (id)completionsViewController
{
  completionsViewController = self->_completionsViewController;
  if (!completionsViewController)
  {
    uint64_t v4 = objc_alloc_init(CompletionListTableViewController);
    [(CompletionListTableViewController *)v4 setClearsSelectionOnViewWillAppear:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    uint64_t v6 = [WeakRetained rootViewController];
    uint64_t v7 = [v6 tipsCoordinator];
    uint64_t v8 = [v7 webSearchTipView];
    [(CompletionListTableViewController *)v4 setWebSearchTipView:v8];

    objc_super v9 = [(CompletionListTableViewController *)v4 tableView];
    [v9 setDataSource:self];
    [v9 setDelegate:self];
    [v9 setEstimatedRowHeight:+[UITableViewCell safari_defaultHeightOfTrivialInstance]()];
    [v9 setLayoutMarginsFollowReadableWidth:0];
    [v9 setRowHeight:*MEMORY[0x1E4FB2F28]];
    [(CatalogViewController *)self _updateVisibilityForCompletionListTableView:v9];

    uint64_t v10 = self->_completionsViewController;
    self->_completionsViewController = v4;

    uint64_t v11 = objc_alloc_init(CompletionListDismissalAnalyticsReporter);
    completionDismissalReporter = self->_completionDismissalReporter;
    self->_completionDismissalReporter = v11;

    completionsViewController = self->_completionsViewController;
  }
  return completionsViewController;
}

- (void)didGainOwnershipOfCompletionsViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v4 = [WeakRetained rootViewController];
  -[CompletionListTableViewController setShowsWebSearchTipIfExists:](self->_completionsViewController, "setShowsWebSearchTipIfExists:", [v4 isUsingBottomCapsule] ^ 1);

  id v11 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  [v11 setSeparatorEffect:0];
  id v5 = [v11 indexPathsForVisibleRows];
  [v11 reloadRowsAtIndexPaths:v5 withRowAnimation:5];

  if (!self->_usesPopoverStyleForFavorites)
  {
    if (![(UnifiedField *)self->_textField voiceSearchState]
      || ([MEMORY[0x1E4F78500] sharedManager],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 liveCompletionList],
          v6,
          v7))
    {
      [(CatalogViewController *)self _updateAlternateContentViewController];
    }
  }
  objc_msgSend(v11, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  uint64_t v8 = [(StartPageController *)self->_startPageController viewController];
  int v9 = [v8 showsWallpaper];

  if (v9)
  {
    uint64_t v10 = [(UIBarButtonItem *)self->_cancelBarButton customView];
    [v10 setOpaqueBackgroundVisibility:1.0];
  }
}

- (void)relinquishOwnershipOfCompletionsViewControllerFromCurrentParent
{
  id v3 = [(StartPageController *)self->_startPageController viewController];
  [v3 setAlternateContentViewController:0];

  uint64_t v4 = [(StartPageController *)self->_startPageController viewController];
  int v5 = [v4 showsWallpaper];

  if (v5)
  {
    uint64_t v6 = [(UIBarButtonItem *)self->_cancelBarButton customView];
    [v6 setOpaqueBackgroundVisibility:0.0];
  }
  v7.receiver = self;
  v7.super_class = (Class)CatalogViewController;
  [(AbstractCatalogViewController *)&v7 relinquishOwnershipOfCompletionsViewControllerFromCurrentParent];
}

- (void)relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent
{
  id v3 = [(StartPageController *)self->_startPageController viewController];
  uint64_t v4 = [v3 alternateContentViewController];
  universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;

  if (v4 == universalSearchFirstTimeExperienceViewController)
  {
    uint64_t v6 = [(StartPageController *)self->_startPageController viewController];
    [v6 setAlternateContentViewController:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)CatalogViewController;
  [(AbstractCatalogViewController *)&v7 relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent];
}

- (void)_updateAlternateContentViewController
{
  id v3 = [(CompletionListTableViewController *)self->_completionsViewController parentViewController];

  if (v3 == self)
  {
    completionsViewController = self->_completionsViewController;
    id v5 = [(StartPageController *)self->_startPageController viewController];
    [v5 setAlternateContentViewController:completionsViewController];
  }
}

- (void)didGainOwnershipOfUniversalSearchFirstTimeExperienceViewController
{
  id v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  uint64_t v4 = [(UniversalSearchFirstTimeExperienceViewController *)self->_universalSearchFirstTimeExperienceViewController view];
  [v4 setBackgroundColor:v3];

  universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;
  id v6 = [(StartPageController *)self->_startPageController viewController];
  [v6 setAlternateContentViewController:universalSearchFirstTimeExperienceViewController];
}

- (double)navigationBarHeight
{
  id v2 = [(StartPageController *)self->_startPageController viewController];
  [v2 navigationBarHeight];
  double v4 = v3;

  return v4;
}

- (void)updateStartPageTopSpacing
{
  id v2 = [(StartPageController *)self->_startPageController viewController];
  [v2 updateStartPageTopPadding];
}

- (void)ignorePreviousLayoutSize
{
  id v2 = [(StartPageController *)self->_startPageController viewController];
  [v2 ignorePreviousLayoutSize];
}

- (id)unifiedTextField
{
  return self->_textField;
}

- (void)setCompletionList:(id)a3
{
  p_completionList = &self->_completionList;
  int v9 = (CompletionList *)a3;
  if (*p_completionList != v9)
  {
    objc_storeStrong((id *)&self->_completionList, a3);
    [(CompletionList *)*p_completionList setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
    [(CompletionList *)*p_completionList setLoadProgressObserver:WeakRetained];

    [(CompletionList *)*p_completionList setParsecSearchSession:self->_parsecSearchSession];
    if (self->_showingCompletions)
    {
      objc_super v7 = *p_completionList;
      uint64_t v8 = [(CompletionList *)v7 query];
      [(CatalogViewController *)self completionListDidUpdate:v7 forQuery:v8];
    }
  }
}

- (void)cancelFavoritesGestures
{
}

- (NSString)queryString
{
  return (NSString *)[(UnifiedField *)self->_textField text];
}

- (void)setQueryString:(id)a3
{
  id v4 = a3;
  [(CatalogViewController *)self _ensureCompletionListAndParsecSession];
  [(UnifiedField *)self->_textField clearUserTypedText];
  [(UnifiedField *)self->_textField setText:v4];

  [(CatalogViewController *)self _textFieldEditingChanged];
}

- (void)_presentPopoverWithViewController:(id)a3
{
}

- (void)_presentPopoverWithViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __77__CatalogViewController__presentPopoverWithViewController_completionHandler___block_invoke;
  v15[3] = &unk_1E6D77E70;
  id v8 = v7;
  id v16 = v8;
  int v9 = (void (**)(void))MEMORY[0x1E4E42950](v15);
  uint64_t v10 = [v6 parentViewController];
  if (v10 || ([v6 presentingViewController], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v9[2](v9);
    goto LABEL_5;
  }
  id v11 = [v6 _popoverController];

  if (v11) {
    goto LABEL_4;
  }
  [v6 setModalPresentationStyle:7];
  id v12 = [v6 popoverPresentationController];
  popoverPresentationController = self->_popoverPresentationController;
  self->_popoverPresentationController = v12;

  [(UIPopoverPresentationController *)self->_popoverPresentationController setDelegate:self];
  [(UIPopoverPresentationController *)self->_popoverPresentationController _setShouldDisableInteractionDuringTransitions:0];
  if (objc_opt_respondsToSelector()) {
    [(UIPopoverPresentationController *)self->_popoverPresentationController _setAllowsFocusInPresentingViewController:1];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewController:self presentViewControllerWithinPopover:v6 completionHandler:v8];

LABEL_5:
}

uint64_t __77__CatalogViewController__presentPopoverWithViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)didTogglePrivateBrowsing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v4 = [WeakRetained isPrivateBrowsingEnabled];

  if (v4) {
    [(CatalogViewController *)self _clearParsecSearchSession];
  }
  [(CatalogViewController *)self updateStartPageControlTintColor];
  [(SFStartPageViewController *)self->_startPageViewController reloadDataAnimatingDifferences:0];
  self->_nextSnapshotRequiresScreenUpdates = 1;
}

- (void)resetPrivateBrowsingExplanation
{
  [(StartPageController *)self->_startPageController updatePrivateBrowsingExplanationState];
  id v3 = [(StartPageController *)self->_startPageController viewController];
  [v3 reloadDataAnimatingDifferences:0];
}

- (void)_reloadCompletionTable
{
  self->_completionTableIsReloading = 1;
  id v3 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  [v3 reloadData];

  completionsViewController = self->_completionsViewController;
  [(CompletionListTableViewController *)completionsViewController setNeedsScrollOffsetReset];
}

- (BOOL)_shouldUsePopoverForCompletions
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [WeakRetained catalogViewControllerShouldUsePopoverForCompletions:self]
    && ![(UnifiedField *)self->_textField voiceSearchState]
    && !self->_voiceSearchWasInProgress;

  return v4;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)_dismissPopoverAnimated:(BOOL)a3 dismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke;
  v22[3] = &unk_1E6D77E70;
  id v9 = v8;
  id v23 = v9;
  uint64_t v10 = MEMORY[0x1E4E42950](v22);
  id v11 = (void *)v10;
  if (self->_dismissingPopover || !self->_popoverPresentationController)
  {
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
  else
  {
    self->_dismissingPopover = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained catalogViewControllerPopoverWillDismiss:self dismissalReason:a4];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    double v17 = __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_2;
    double v18 = &unk_1E6D7F118;
    double v19 = self;
    BOOL v21 = v6;
    id v20 = v11;
    uint64_t v13 = MEMORY[0x1E4E42950](&v15);
    id v14 = (void *)v13;
    if (v6) {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1EC0], "_performWithoutDeferringTransitions:", v13, v15, v16, v17, v18, v19);
    }
  }
}

uint64_t __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1272) presentingViewController];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_3;
  v5[3] = &unk_1E6D78748;
  BOOL v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v2 dismissViewControllerAnimated:v3 completion:v5];
}

uint64_t __83__CatalogViewController__dismissPopoverAnimated_dismissalReason_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _popoverDismissCompletion];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)_popoverDismissCompletion
{
  [(UIPopoverPresentationController *)self->_popoverPresentationController setDelegate:0];
  popoverPresentationController = self->_popoverPresentationController;
  self->_popoverPresentationController = 0;

  self->_dismissingPopover = 0;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  if (!self->_dismissingPopover)
  {
    self->_dismissingPopover = 1;
    BOOL v4 = [(UIPopoverPresentationController *)self->_popoverPresentationController presentedViewController];
    id v5 = [v4 transitionCoordinator];
    v6[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CatalogViewController_presentationControllerWillDismiss___block_invoke;
    v7[3] = &unk_1E6D7E960;
    v7[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__CatalogViewController_presentationControllerWillDismiss___block_invoke_2;
    v6[3] = &unk_1E6D7E960;
    [v5 animateAlongsideTransition:v7 completion:v6];
  }
}

void __59__CatalogViewController_presentationControllerWillDismiss___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1248));
  [WeakRetained catalogViewControllerPopoverWillDismiss:*(void *)(a1 + 32) dismissalReason:2];
}

uint64_t __59__CatalogViewController_presentationControllerWillDismiss___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) stopCompleting];
  id v2 = *(void **)(a1 + 32);
  return [v2 _popoverDismissCompletion];
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewController:self willRepositionPopoverToRect:a4 inView:a5];
}

- (void)setContentBorrowed:(BOOL)a3
{
  if (self->_contentBorrowed != a3)
  {
    self->_contentBorrowed = a3;
    -[CatalogViewController _setContentOverlayInsets:](self, "_setContentOverlayInsets:", self->_contentOverlayInsets.top, self->_contentOverlayInsets.left, self->_contentOverlayInsets.bottom, self->_contentOverlayInsets.right);
  }
}

- (SFStartPageScrollObserver)startPageScrollObserver
{
  id v2 = [(StartPageController *)self->_startPageController viewController];
  uint64_t v3 = [v2 scrollObserver];

  return (SFStartPageScrollObserver *)v3;
}

- (NSString)libraryType
{
  startPageController = self->_startPageController;
  if (startPageController)
  {
    startPageController = [startPageController libraryType];
  }
  return (NSString *)startPageController;
}

- (double)chromelessScrollDistance
{
  id v2 = [(StartPageController *)self->_startPageController viewController];
  if ([v2 isShowingRootView])
  {
    [v2 scrollDistance];
    double v4 = v3;
  }
  else
  {
    double v4 = 1.79769313e308;
  }

  return v4;
}

- (void)setTextField:(id)a3
{
  id v5 = (UnifiedField *)a3;
  p_textField = &self->_textField;
  if (self->_textField != v5)
  {
    id v9 = v5;
    id v7 = [(CatalogViewController *)self unifiedTextField];
    [v7 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
    [v7 setDelegate:0];
    [v7 setInputAccessoryView:0];
    objc_storeStrong((id *)&self->_textField, a3);
    [(UnifiedField *)*p_textField setDelegate:self];
    if ([(UnifiedField *)*p_textField isFirstResponder]) {
      [(CatalogViewController *)self _ensureCompletionListAndParsecSession];
    }
    id v8 = [(StartPageController *)self->_startPageController viewController];
    [v8 reloadNavigationItemAnimated:1];

    id v5 = v9;
  }
}

- (void)_clearParsecSearchSession
{
  [(WBSParsecDSession *)self->_parsecSearchSession setDelegate:0];
  parsecSearchSession = self->_parsecSearchSession;
  self->_parsecSearchSession = 0;

  completionList = self->_completionList;
  [(CompletionList *)completionList setParsecSearchSession:0];
}

- (void)displayPopover
{
}

- (void)setShowingCompletions:(BOOL)a3
{
}

void __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2(uint64_t a1)
{
}

void __89__CatalogViewController__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_3(uint64_t a1)
{
}

- (BOOL)_showCompletionsInPopover
{
  BOOL v3 = [(CatalogViewController *)self _shouldUsePopoverForCompletions];
  if (v3)
  {
    BOOL usesPopoverStyleForFavorites = self->_usesPopoverStyleForFavorites;
    [(AbstractCatalogViewController *)self->_popoverCatalogViewController takeOwnershipOfCompletionsViewController];
    if (!usesPopoverStyleForFavorites && ![(CatalogViewController *)self popoverIsShowing]) {
      [(CatalogViewController *)self _presentPopoverWithViewController:self->_popoverCatalogViewController];
    }
  }
  return v3;
}

- (void)_showStartPageInPopover
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__CatalogViewController__showStartPageInPopover__block_invoke;
  v2[3] = &unk_1E6D77E20;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __48__CatalogViewController__showStartPageInPopover__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 984) updateStartPagePreferredContentSize];
  id v2 = *(void **)(a1 + 32);
  return [v2 updatePreferredContentSize];
}

- (void)updateQuerySuggestionsFromResponse:(id)a3
{
  id v4 = a3;
  id v6 = [(CatalogViewController *)self textField];
  id v5 = [v4 completer];

  [v6 setContextCompleter:v5];
}

- (void)stopCompleting
{
  self->_hasScheduledCompletionListDismissal = 0;
  [(CompletionListDismissalAnalyticsReporter *)self->_completionDismissalReporter reportAnalytics];
  completionDismissalReporter = self->_completionDismissalReporter;
  self->_completionDismissalReporter = 0;

  if ([(CatalogViewController *)self isShowingUniversalSearchFirstTimeExperience])
  {
    [(CatalogViewController *)self _dismissUniversalSearchFirstTimeExperience:self->_universalSearchFirstTimeExperienceViewController dismissalReason:2];
  }
  id v5 = [(CatalogViewController *)self textField];
  id v4 = [v5 contextCompleter];
  [v4 discard];

  [v5 setContextCompleter:0];
  [(CompletionList *)self->_completionList stopCompleting];
  [(CatalogViewController *)self _reloadCompletionTable];
  [(CatalogViewController *)self setShowingCompletions:0];
  [(CatalogViewController *)self _dismissPopoverAnimated:0 dismissalReason:2 completionHandler:0];
  [(CatalogViewController *)self _clearCompletionListCachesSoon];
}

- (void)_cancelClearingCompletionListCaches
{
  [(NSTimer *)self->_timerForClearingCompletionListCaches invalidate];
  timerForClearingCompletionListCaches = self->_timerForClearingCompletionListCaches;
  self->_timerForClearingCompletionListCaches = 0;
}

- (void)_clearCompletionListCachesSoon
{
  [(CatalogViewController *)self _cancelClearingCompletionListCaches];
  objc_initWeak(&location, self);
  BOOL v3 = (void *)MEMORY[0x1E4F1CB00];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__CatalogViewController__clearCompletionListCachesSoon__block_invoke;
  v6[3] = &unk_1E6D7B538;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 scheduledTimerWithTimeInterval:0 repeats:v6 block:480.0];
  timerForClearingCompletionListCaches = self->_timerForClearingCompletionListCaches;
  self->_timerForClearingCompletionListCaches = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__CatalogViewController__clearCompletionListCachesSoon__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[155] clearCachedSearches];
    [v2[150] removeAllObjects];
    id WeakRetained = v2;
  }
}

- (void)reportUnifiedFieldSearchDidCancel
{
  id v3 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  objc_msgSend(v3, "searchViewDisappearedBecauseOfEvent:forQueryID:", 4, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));
}

- (void)_ensureCompletionListAndParsecSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained catalogViewControllerShouldRequestNetworkedSuggestions:self]) {
    int v4 = [MEMORY[0x1E4F98E40] areSiriSearchSuggestionsEnabled];
  }
  else {
    int v4 = 0;
  }

  if (!self->_completionList)
  {
    id v5 = [CompletionList alloc];
    parsecSearchSession = self->_parsecSearchSession;
    id v7 = objc_loadWeakRetained((id *)&self->_browserController);
    id v8 = [(CompletionList *)v5 initWithParsecSearchSession:parsecSearchSession browserController:v7];
    completionList = self->_completionList;
    self->_completionList = v8;

    [(CompletionList *)self->_completionList setDelegate:self];
    id v10 = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
    [(CompletionList *)self->_completionList setLoadProgressObserver:v10];
  }
  if (v4) {
    [(CatalogViewController *)self _beginParsecSessionIfNeeded];
  }
  else {
    [(CatalogViewController *)self _clearParsecSearchSession];
  }
  [(CatalogViewController *)self _clearCompletionListCachesSoon];
}

- (void)_textFieldEditingChanged
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218243;
  uint64_t v4 = a2;
  __int16 v5 = 2117;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Text field editing changed; text length: %lu; current text: %{sensitive}@",
    (uint8_t *)&v3,
    0x16u);
}

id __49__CatalogViewController__textFieldEditingChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F98D48];
  id v3 = a2;
  id v4 = [v2 alloc];
  __int16 v5 = [v3 title];
  uint64_t v6 = [v3 topicId];
  uint64_t v7 = (void *)[v4 initWithTitle:v5 identifier:v6 type:0 tag:v3];

  return v7;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  [v3 setNeedsLayout];
}

- (void)completionListDidUpdate:(id)a3 forQuery:(id)a4
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_dismissingPopover && !self->_isCachedCompletionList)
  {
    [(CatalogViewController *)self _reloadCompletionTable];
    id v8 = [v7 queryString];
    [(CatalogViewController *)self _preselectCompletionItemIfNecessaryForQueryString:v8];

    [(CatalogViewController *)self _showCompletionsPopoverIfNecessary];
  }
  if (self->_waitingOnFirstCompletionListUpdateForTelemetry)
  {
    self->_waitingOnFirstCompletionListUpdateForTelemetrCGFloat y = 0;
    id v9 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldFirstKeyTapToCompletionListUpdate", " enableTelemetry=YES ", v15, 2u);
    }
  }
  if (self->_hasPendingVoiceSearchUpdate) {
    [(CatalogViewController *)self _commitVoiceSearchIfNecessary];
  }
  v16[0] = @"time";
  id v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v16[1] = @"query";
  v17[0] = v10;
  uint64_t v11 = [v7 queryString];
  id v12 = (void *)v11;
  uint64_t v13 = &stru_1F3C268E8;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  v17[1] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  +[Application postTestNotificationName:@"catalogViewControllerDidFinish" object:self userInfo:v14];
}

- (void)_preselectCompletionItemIfNecessaryForQueryString:(id)a3
{
  id v14 = a3;
  lastTopHitMatch = self->_lastTopHitMatch;
  if (lastTopHitMatch
    && ([(UnifiedField *)self->_textField reflectedItem],
        __int16 v5 = (CompletionItem *)objc_claimAutoreleasedReturnValue(),
        v5,
        lastTopHitMatch == v5))
  {
    int v6 = 1;
  }
  else
  {
    int v6 = ![(UnifiedField *)self->_textField lastEditWasADeletion];
  }
  id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v8 = [(CatalogViewController *)self _completionItemAtIndexPath:v7];
  int v9 = [v8 isEquivalentTo:self->_lastTopHitMatch];

  if (v6 && v9)
  {
    id v10 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
    [v10 selectRowAtIndexPath:v7 animated:0 scrollPosition:0];
  }
  else
  {
    id v10 = [(CompletionList *)self->_completionList indexPathOfAsTypedSearchSuggestion];
    uint64_t v11 = WBSUnifiedFieldInputTypeForString();
    if (!self->_lastInputWasSearchTextCompletion
      && (v11 == 3 || !v11)
      && [v10 isEqual:v7])
    {
      id v12 = [(CatalogViewController *)self _completionItemAtIndexPath:v10];
      [(UnifiedField *)self->_textField setReflectedItem:v12];

      uint64_t v13 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
      [v13 selectRowAtIndexPath:v10 animated:0 scrollPosition:0];
    }
  }
}

- (void)_showCompletionsPopoverIfNecessary
{
  if (self->_showingCompletions)
  {
    if ([(CompletionList *)self->_completionList numberOfGroups])
    {
      if ([(CatalogViewController *)self _shouldUsePopoverForCompletions])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v4 = [WeakRetained catalogViewControllerShouldSuppressPopover:self];

        if ((v4 & 1) == 0)
        {
          [(CatalogViewController *)self _showCompletionsInPopover];
        }
      }
    }
  }
}

- (void)_generateVisibleResultsFeedbackForEvent:(int64_t)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (!self->_feedbackIsBeingGenerated
    && (a3 != 3 || !self->_lastFeedbackSentWasScrolling)
    && [(CompletionList *)self->_completionList hasCompletions]
    && [(UnifiedField *)self->_textField voiceSearchState] != 1)
  {
    self->_feedbackIsBeingGenerated = 1;
    if (a3)
    {
      CGRect v47 = [MEMORY[0x1E4F1CAD0] setWithSet:self->_seenVisibleResults];
    }
    else
    {
      CGRect v47 = 0;
    }
    [(NSMutableSet *)self->_seenVisibleResults removeAllObjects];
    v48 = objc_opt_new();
    char v4 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
    __int16 v5 = [v4 window];
    [v5 bounds];
    CGFloat v52 = v7;
    CGFloat v53 = v6;
    CGFloat v50 = v9;
    CGFloat v51 = v8;

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v10 = [v4 indexPathsForVisibleRows];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v59;
      CGFloat v14 = *MEMORY[0x1E4F1DB28];
      CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat rect2 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v59 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v18 = *(void *)(*((void *)&v58 + 1) + 8 * i);
          [v4 rectForRowAtIndexPath:v18];
          double x = v66.origin.x;
          double y = v66.origin.y;
          double width = v66.size.width;
          double height = v66.size.height;
          v73.origin.double x = v14;
          v73.origin.double y = v15;
          v73.size.double width = v16;
          v73.size.double height = rect2;
          if (!CGRectEqualToRect(v66, v73))
          {
            objc_msgSend(v4, "convertRect:toView:", 0, x, y, width, height);
            CGFloat v55 = v24;
            CGFloat v56 = v23;
            CGFloat v54 = v25;
            CGFloat v27 = v26;
            v28 = [v4 window];
            objc_msgSend(v28, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
            CGFloat v30 = v29;
            double v31 = v14;
            CGFloat v33 = v32;
            double v34 = v15;
            CGFloat v36 = v35;
            double v37 = v16;
            CGFloat v39 = v38;

            v67.origin.double x = v30;
            v67.origin.double y = v33;
            CGFloat v14 = v31;
            v67.size.double width = v36;
            CGFloat v15 = v34;
            v67.size.double height = v39;
            CGFloat v16 = v37;
            v74.origin.double x = v56;
            v74.origin.double y = v55;
            v74.size.double width = v54;
            v74.size.double height = v27;
            CGRect v68 = CGRectIntersection(v67, v74);
            double v40 = CGRectGetHeight(v68);
            v69.origin.double x = v56;
            v69.origin.double y = v55;
            v69.size.double width = v54;
            v69.size.double height = v27;
            if (v40 < CGRectGetHeight(v69) * 0.5)
            {
              v70.origin.double y = v52;
              v70.origin.double x = v53;
              v70.size.double height = v50;
              v70.size.double width = v51;
              v75.origin.double x = v56;
              v75.origin.double y = v55;
              v75.size.double width = v54;
              v75.size.double height = v27;
              CGRect v71 = CGRectIntersection(v70, v75);
              double v41 = CGRectGetHeight(v71);
              v72.origin.double x = v56;
              v72.origin.double y = v55;
              v72.size.double width = v54;
              v72.size.double height = v27;
              if (v41 > CGRectGetHeight(v72) * 0.5)
              {
                v42 = [(CatalogViewController *)self _completionItemAtIndexPath:v18];
                if (v42)
                {
                  [(NSMutableSet *)self->_seenVisibleResults addObject:v42];
                  if (!a3 || ([v47 containsObject:v42] & 1) == 0) {
                    [v48 addObject:v42];
                  }
                }
                else
                {
                  CGRect v43 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v63 = v18;
                    _os_log_error_impl(&dword_1E102C000, v43, OS_LOG_TYPE_ERROR, "Skipped generating feedback for cell at %@ due to nil completion list item", buf, 0xCu);
                  }
                }
              }
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v12);
    }

    uint64_t v44 = [v48 count];
    if (a3 == 3 || v44)
    {
      CGRect v45 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
      CGRect v46 = [(CompletionList *)self->_completionList query];
      [v45 didDisplayCompletionListItems:v48 forQuery:v46 forEvent:a3];
    }
    self->_feedbackIsBeingGenerated = 0;
    self->_lastFeedbackSentWasScrolling = (unint64_t)(a3 - 1) < 2;
  }
}

- (void)_logTopHitWasChosen:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  if (([WeakRetained isPrivateBrowsingEnabled] & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
    double v6 = (void *)MEMORY[0x1E4F97E48];
    double v7 = self->_lastTopHitMatch;
    id WeakRetained = [v6 sharedLogger];
    unint64_t lastTopHitMatchLength = self->_lastTopHitMatchLength;
    [(CompletionItem *)v7 weight];
    int v10 = v9;

    LODWORD(v11) = v10;
    [WeakRetained didChooseTopHit:v3 matchLength:lastTopHitMatchLength matchScore:v11];
  }
}

- (void)completionList:(id)a3 didRemoveItem:(id)a4 wasLastInSection:(BOOL)a5 atIndexPath:(id)a6 withCompletionHandler:(id)a7
{
  double v11 = (CompletionItem *)a4;
  id v12 = a6;
  completionsViewController = self->_completionsViewController;
  id v14 = a7;
  CGFloat v15 = [(CompletionListTableViewController *)completionsViewController tableView];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__CatalogViewController_completionList_didRemoveItem_wasLastInSection_atIndexPath_withCompletionHandler___block_invoke;
  v19[3] = &unk_1E6D780C8;
  BOOL v22 = a5;
  id v16 = v15;
  id v20 = v16;
  id v17 = v12;
  id v21 = v17;
  [v16 performBatchUpdates:v19 completion:v14];

  if (self->_lastTopHitMatch == v11)
  {
    self->_lastTopHitMatch = 0;
  }
  uint64_t v18 = [(UnifiedField *)self->_textField reflectedItem];

  if (v18 == v11) {
    [(UnifiedField *)self->_textField setReflectedItem:0];
  }
}

void __105__CatalogViewController_completionList_didRemoveItem_wasLastInSection_atIndexPath_withCompletionHandler___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deleteSections:withRowAnimation:");
  }
  else
  {
    v4[0] = *(void *)(a1 + 40);
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
    [v1 deleteRowsAtIndexPaths:v2 withRowAnimation:0];
  }
}

- (void)completionList:(id)a3 topHitDidBecomeReadyForString:(id)a4
{
  id v13 = a4;
  textField = self->_textField;
  id v7 = a3;
  [(UnifiedField *)textField topHitDidBecomeReady];
  double v8 = [v7 topHitForString:v13];

  if (self->_lastTopHitMatch != v8)
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      int v9 = [(CompletionItem *)self->_lastTopHitMatch originalURLString];
      int v10 = [(CompletionItem *)v8 originalURLString];
      char v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) == 0) {
        [(CatalogViewController *)self _logTopHitWasChosen:0];
      }
    }
    objc_storeStrong((id *)&self->_lastTopHitMatch, v8);
    self->_unint64_t lastTopHitMatchLength = [v13 length];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewController:self mightSelectCompletionItem:v8 forString:v13];
}

- (void)completionListDidRestoreCachedCompletions:(id)a3
{
  self->_isCachedCompletionList = 1;
  id v3 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  [v3 reloadData];
}

- (void)completionList:(id)a3 didFetchFavicon:(id)a4 forRowAtIndexPath:(id)a5
{
  if (self->_completionList == a3)
  {
    completionsViewController = self->_completionsViewController;
    id v7 = a5;
    id v8 = a4;
    int v9 = [(CompletionListTableViewController *)completionsViewController tableView];
    id v11 = [v9 cellForRowAtIndexPath:v7];

    int v10 = [v11 imageView];
    [v10 setImage:v8];

    [v11 setNeedsLayout];
  }
}

- (BOOL)completionListHasScheduledDismissal:(id)a3
{
  return self->_hasScheduledCompletionListDismissal;
}

- (void)completionListDidDismissSearchUIViewController:(id)a3
{
}

- (void)completionList:(id)a3 willGoToURL:(id)a4 fromPegasusSearchResult:(id)a5 forImageAttribution:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  [(CatalogViewController *)self willGoToURLFromPegasusSearchResult:a5];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewController:self loadURL:v9 inExternalApplication:0 forImageAttribution:v6];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char v4 = [(CompletionList *)self->_completionList completionsForGroupAtIndex:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)_completionItemAtIndexPath:(id)a3
{
  if (a3)
  {
    completionList = self->_completionList;
    id v4 = a3;
    int64_t v5 = -[CompletionList completionsForGroupAtIndex:](completionList, "completionsForGroupAtIndex:", [v4 section]);
    unint64_t v6 = [v4 row];

    if (v6 >= [v5 count])
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [v5 objectAtIndex:v6];
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)_completionsViewControllerIsTranslucent
{
  return [(AbstractCatalogViewController *)self->_popoverCatalogViewController isResponsibleForLayoutOfViewController:self->_completionsViewController];
}

- (void)tableViewDidFinishReload:(id)a3
{
  self->_completionTableIsReloading = 0;
  [(CatalogViewController *)self _generateVisibleResultsFeedbackForEvent:0];
}

- (id)tableView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  id v8 = [(CatalogViewController *)self _completionItemAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 cellForRowAtIndexPath:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    id v11 = (void *)MEMORY[0x1E4FB14C0];
    [v9 bounds];
    CGRect v17 = CGRectInset(v16, 0.0, 0.0);
    id v12 = objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height, 20.0);
    [v10 setVisiblePath:v12];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v10];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)tableView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = [a4 identifier];
  id v8 = [(CatalogViewController *)self _completionItemAtIndexPath:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v6 cellForRowAtIndexPath:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
    id v11 = (void *)MEMORY[0x1E4FB14C0];
    [v9 bounds];
    CGRect v20 = CGRectInset(v19, 0.0, 0.0);
    id v12 = objc_msgSend(v11, "bezierPathWithRoundedRect:cornerRadius:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, 20.0);
    [v10 setVisiblePath:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v14 = [WeakRetained catalogViewControllerShouldUsePopoverForCompletions:self];

    if (v14)
    {
      CGFloat v15 = [MEMORY[0x1E4FB1618] clearColor];
      [v10 setBackgroundColor:v15];
    }
    CGRect v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v10];
  }
  else
  {
    CGRect v16 = 0;
  }

  return v16;
}

- (void)tableView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  if (objc_msgSend(MEMORY[0x1E4FB18E0], "isInHardwareKeyboardMode", a3, a4, a5))
  {
    id v6 = [(CatalogViewController *)self textField];
    [v6 endEditing:1];

    id v9 = [(CatalogViewController *)self textField];
    id v7 = [v9 selectedTextRange];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    [WeakRetained setTextRangeToRestoreAfterCompletionDetailIsDismissed:v7];
  }
}

- (void)tableView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerSuppressSelectedItemUnfocus:self];

  self->_completionDetailIsPresented = 0;
  if ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
  {
    id v7 = [(CatalogViewController *)self textField];
    [v7 becomeFirstResponder];

    id v10 = objc_loadWeakRetained((id *)&self->_browserController);
    id v8 = [v10 textRangeToRestoreAfterCompletionDetailIsDismissed];
    id v9 = [(CatalogViewController *)self textField];
    [v9 setSelectedTextRange:v8];

    [v10 setTextRangeToRestoreAfterCompletionDetailIsDismissed:0];
  }
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CatalogViewController *)self _completionItemAtIndexPath:v8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = 0;
    goto LABEL_13;
  }
  id v10 = [v7 cellForRowAtIndexPath:v8];
  if (!v10)
  {
    int v14 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CatalogViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:]((uint64_t)v8, v14);
    }
    goto LABEL_11;
  }
  getSearchUITableViewCellClass();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CGFloat v15 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CatalogViewController tableView:contextMenuConfigurationForRowAtIndexPath:point:](v15);
    }
    goto LABEL_11;
  }
  self->_completionDetailIsPresented = 1;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_11:
    id v13 = 0;
    goto LABEL_12;
  }
  id v11 = (void *)MEMORY[0x1E4FB1678];
  id v12 = [v10 contextMenuActionProvider];
  id v13 = [v11 configurationWithIdentifier:v8 previewProvider:0 actionProvider:v12];

LABEL_12:
LABEL_13:

  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CatalogViewController *)self _completionItemAtIndexPath:v5];
  id v7 = [(CatalogViewController *)self _cellHeightCacheKeyForCompletionItem:v6 indexPath:v5];

  if (v7
    && ([(NSCache *)self->_tableViewCellHeightCache objectForKey:v7],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 floatValue],
        float v10 = v9,
        v8,
        v10 != 0.0))
  {
    double v11 = v10;
  }
  else
  {
    double v11 = *MEMORY[0x1E4FB2F28];
  }

  return v11;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  id v8 = [(CatalogViewController *)self _completionItemAtIndexPath:v7];
  float v9 = [(CatalogViewController *)self _cellHeightCacheKeyForCompletionItem:v8 indexPath:v7];

  if (v9)
  {
    float v10 = (void *)MEMORY[0x1E4F28ED0];
    [v13 bounds];
    CGFloat Height = CGRectGetHeight(v15);
    *(float *)&CGFloat Height = Height;
    id v12 = [v10 numberWithFloat:Height];
    [(NSCache *)self->_tableViewCellHeightCache setObject:v12 forKey:v9];
  }
}

- (id)_cellHeightCacheKeyForCompletionItem:(id)a3 indexPath:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [v4 sfSearchResultValue];
    id v5 = [v6 identifier];
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id val = a3;
  id v6 = a4;
  id v7 = [(CatalogViewController *)self _completionItemAtIndexPath:v6];
  double v38 = [v7 completionTableViewCellReuseIdentifier];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v6 section])
  {
    id v8 = [v7 inlineCard];
    float v9 = [v8 cardSections];
    float v10 = [v9 firstObject];
    [v10 setSeparatorStyle:1];
  }
  double v11 = [val dequeueReusableCellWithIdentifier:v38];
  if (!v11)
  {
    double v11 = [v7 completionTableViewCellForCompletionList:self->_completionList];
  }
  id v12 = [v7 completionTableViewCellReuseIdentifier];
  [v11 setAccessibilityIdentifier:v12];

  [v7 configureCompletionTableViewCell:v11 forCompletionList:self->_completionList];
  id v13 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);
  uint64_t v37 = [(CatalogViewController *)self _completionItemAtIndexPath:v13];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v7, "safari_configureBackgroundColorForCompletionList:", self->_completionList);
  }
  if (![v6 section]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [(id)v37 completionCellBackgroundModeInTopSection] == 1)
  {
    uint64_t v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGRect v15 = [v7 inlineCard];
      CGRect v16 = [v15 cardSections];
      CGRect v17 = [v16 firstObject];
      uint64_t v14 = [v17 separatorStyle];
    }
    else
    {
      uint64_t v14 = 2;
    }
  }
  if ([v6 section] || (objc_opt_respondsToSelector() & 1) == 0) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = [v7 completionCellBackgroundModeInTopSection];
  }
  if ([v6 row]) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = ([v6 section] | v37) == 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v21 = v18;
  if (isKindOfClass)
  {
    id v22 = v7;
    double v23 = [v22 resultType];
    if ([v23 isEqualToString:@"web_index"])
    {
      int v24 = [v22 topHit];

      if (v24) {
        uint64_t v21 = v18;
      }
      else {
        uint64_t v21 = 1;
      }
    }
    else
    {

      uint64_t v21 = v18;
    }
  }
  if (v19) {
    uint64_t v25 = v21;
  }
  else {
    uint64_t v25 = v18;
  }
  BOOL v26 = v25 == 1 && [v6 row] != 0;
  objc_initWeak(&location, val);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __57__CatalogViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v40[3] = &unk_1E6D7F160;
  objc_copyWeak(&v42, &location);
  id v27 = v6;
  id v41 = v27;
  v28 = (void *)MEMORY[0x1E4E42950](v40);
  +[CompletionListTableViewController configureCell:v11 backgroundMode:v25 separatorStyle:v14 shouldHaveTopPadding:v26 configurationStateDidChangeCallback:v28];
  [v11 setClipsToBounds:0];
  if (objc_opt_respondsToSelector()) {
    [v7 setHandlerForActionItem:self];
  }
  if (!v11)
  {
    double v29 = (id)WBS_LOG_CHANNEL_PREFIXParsec();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      if (self->_completionList) {
        double v31 = @"IS NOT";
      }
      else {
        double v31 = @"IS";
      }
      CGFloat v36 = v31;
      uint64_t v32 = objc_opt_class();
      unint64_t v33 = [(CompletionList *)self->_completionList numberOfGroups];
      double v34 = -[CompletionList completionsForGroupAtIndex:](self->_completionList, "completionsForGroupAtIndex:", [v27 section]);
      uint64_t v35 = [v34 count];
      *(_DWORD *)buf = 138544386;
      id v45 = v27;
      __int16 v46 = 2114;
      CGRect v47 = v36;
      __int16 v48 = 2114;
      uint64_t v49 = v32;
      __int16 v50 = 2048;
      unint64_t v51 = v33;
      __int16 v52 = 2048;
      uint64_t v53 = v35;
      _os_log_fault_impl(&dword_1E102C000, v29, OS_LOG_TYPE_FAULT, "No cell returned for completion item at index path %{public}@; completion list %{public}@ nil; item class: %{pub"
        "lic}@; number of groups: %ld; number of completions in group: %ld",
        buf,
        0x34u);
    }
  }

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);

  return v11;
}

void __57__CatalogViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && ![*(id *)(a1 + 32) row])
  {
    id v4 = objc_msgSend(WeakRetained, "headerViewForSection:", objc_msgSend(*(id *)(a1 + 32), "section"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 isSelected]) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = [v6 isHighlighted] ^ 1;
      }
      [v4 setShowsSeparator:v5];
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(CompletionList *)self->_completionList numberOfGroups];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(CompletionList *)self->_completionList defaultSectionTitleForGroupAtIndex:a4];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (void)_selectedCompletionItemAtIndexPath:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CatalogViewController *)self _completionItemAtIndexPath:v4];
  if (!v5) {
    goto LABEL_28;
  }
  uint64_t v6 = [v4 row] + 1;
  uint64_t v7 = [v4 section];
  id v8 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
      v6 += [v8 numberOfRowsInSection:i];
  }
  [v5 auditAcceptedCompletionWithRank:v6];
  if (v6 == 1)
  {
    float v10 = self;
    if (objc_opt_isKindOfClass())
    {
      int v11 = [v5 isTopHit];

      if (v11)
      {
        id v12 = self;
        uint64_t v13 = 1;
LABEL_12:
        [(CatalogViewController *)v12 _logTopHitWasChosen:v13];
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  if (self->_lastTopHitMatch)
  {
    id v12 = self;
    uint64_t v13 = 0;
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v14 = [(UnifiedField *)self->_textField text];
  [(CatalogViewController *)self _updatePersonalisationDataForDonation:v14 forPosition:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CGRect v16 = [(UnifiedField *)self->_textField text];
  [WeakRetained catalogViewController:self completionItem:v5 wasAcceptedForString:v16];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGRect v17 = [v5 string];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v18 = [(UnifiedField *)self->_textField querySuggestions];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      id v25 = v4;
      uint64_t v20 = *(void *)v27;
      while (2)
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v18);
          }
          id v22 = [*(id *)(*((void *)&v26 + 1) + 8 * j) title];
          char v23 = objc_msgSend(v22, "safari_isCaseAndDiacriticInsensitiveEqualToString:", v17);

          if (v23)
          {
            uint64_t v19 = 1;
            goto LABEL_25;
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v19) {
          continue;
        }
        break;
      }
LABEL_25:
      id v4 = v25;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  [(CatalogViewController *)self _logQueryEngagement];
  int v24 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  [v24 userDidEngageWithCompletionListItem:v5 onActionButton:0 method:0 doesMatchSiriSuggestion:v19 voiceSearchQueryID:0];

  [(CompletionListDismissalAnalyticsReporter *)self->_completionDismissalReporter setAcceptedCompletionListItem:1];
  [v5 acceptCompletionWithActionHandler:self];
  [(CatalogViewController *)self _executeActionForParsecResultAtIndexPath:v4 tableView:v8];
  [v8 deselectRowAtIndexPath:v4 animated:1];

LABEL_28:
}

- (void)_executeActionForParsecResultAtIndexPath:(id)a3 tableView:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F97EA0] isSMARTParsecResultsEnabled])
  {
    uint64_t v7 = [v6 cellForRowAtIndexPath:v14];
    getSearchUITableViewCellClass();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      float v9 = [(CatalogViewController *)self _completionItemAtIndexPath:v14];
      getSearchUIClass_0();
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_5;
      }
      id SearchUIClass_0 = getSearchUIClass_0();
      int v11 = [v9 sfSearchResultValue];
      id v12 = +[WBSParsecDSession sharedPARSession];
      LODWORD(SearchUIClass_0) = [SearchUIClass_0 hasValidCommandForResult:v11 feedbackListener:v12];

      if (SearchUIClass_0)
      {
LABEL_5:
        uint64_t v13 = [v6 cellForRowAtIndexPath:v14];
        [(CatalogViewController *)self _executeActionForParsecResultTableViewCell:v13 completionItem:v9];
      }
    }
  }
}

- (void)_executeActionForParsecResultTableViewCell:(id)a3 completionItem:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F97EA0] isSMARTParsecResultsEnabled])
  {
    getSearchUITableViewCellClass();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      self->_completionDetailIsPresented = 1;
      uint64_t v7 = [(CatalogViewController *)self navigationBar];
      id v8 = [v7 textField];

      float v9 = [v8 selectedTextRange];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
      [WeakRetained setTextRangeToRestoreAfterCompletionDetailIsDismissed:v9];

      [v14 executeCommandWithTriggerEvent:2];
      self->_completionDetailIsPresented = 0;
      int v11 = [MEMORY[0x1E4F98E20] sharedRecorder];
      id v12 = [v6 sfSearchResultValue];
      uint64_t v13 = [v12 url];
      [v11 didActualizeImpressionForURL:v13 provenance:1];
    }
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CompletionList *)self->_completionList headerViewReuseIdentifierForGroupAtIndex:a4];
  if (v7)
  {
    id v8 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v7];
    if (!v8)
    {
      id v8 = [(CompletionList *)self->_completionList headerViewForGroupAtIndex:a4];
    }
    if ([v8 conformsToProtocol:&unk_1F3CF7E20]) {
      [v8 setFeedbackDelegate:self];
    }
    [(CompletionList *)self->_completionList configureHeaderView:v8 forGroupAtIndex:a4];
  }
  else
  {
    float v9 = [(CompletionList *)self->_completionList defaultSectionTitleForGroupAtIndex:a4];
    if ([v9 length])
    {
      float v10 = [MEMORY[0x1E4FB1948] groupedHeaderConfiguration];
      [v10 setText:v9];
      [v10 directionalLayoutMargins];
      double v12 = v11;
      if (a4)
      {
        id WeakRetained = [(CompletionList *)self->_completionList completionsForGroupAtIndex:0];
        uint64_t v14 = [WeakRetained count];
        BOOL v15 = v14 == 1;
        CGRect v16 = [WeakRetained lastObject];
        if (objc_opt_respondsToSelector())
        {
          if ([v16 completionCellBackgroundModeInTopSection]) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = v14 == 1;
          }
          BOOL v15 = v17;
        }
        BOOL v18 = a4 != 1 || !v15;
        double v19 = 16.0;
        double v20 = 24.0;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
        CGRect v16 = [WeakRetained rootViewController];
        BOOL v18 = [v16 isUsingBottomCapsule] == 0;
        double v19 = 16.0;
        double v20 = 0.0;
      }
      if (v18) {
        double v21 = v19;
      }
      else {
        double v21 = v20;
      }

      objc_msgSend(v10, "setDirectionalLayoutMargins:", v21, 16.0, v12, 16.0);
      id v22 = [v10 textProperties];
      char v23 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] weight:*MEMORY[0x1E4FB09D0]];
      [v22 setFont:v23];

      [v22 setTransform:0];
      id v8 = [(CompletionListTableViewController *)self->_completionsViewController defaultHeaderFooterView];
      [v8 setContentConfiguration:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v24 = [v6 indexPathForSelectedRow];
        if ([v24 row]) {
          BOOL v25 = 1;
        }
        else {
          BOOL v25 = [v24 section] != a4;
        }
        if (v24) {
          uint64_t v26 = v25;
        }
        else {
          uint64_t v26 = 1;
        }
        [v8 setShowsSeparator:v26];
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = [(CompletionList *)self->_completionList headerViewReuseIdentifierForGroupAtIndex:a4];
  if (v6)
  {
    double v7 = *MEMORY[0x1E4FB2F28];
  }
  else
  {
    id v8 = [(CompletionList *)self->_completionList defaultSectionTitleForGroupAtIndex:a4];
    if ([v8 length])
    {
      double v7 = *MEMORY[0x1E4FB2F28];
    }
    else
    {
      float v9 = [MEMORY[0x1E4FB1948] groupedHeaderConfiguration];
      [v9 directionalLayoutMargins];
      double v7 = v10;

      if (!a4)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
        double v12 = [WeakRetained rootViewController];
        if ([v12 isUsingBottomCapsule]) {
          double v7 = 1.0;
        }
      }
    }
  }
  return v7;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v4 = [(CompletionList *)self->_completionList swipeActionsForCompletionItemAtIndexPath:a4];
  uint64_t v5 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v4];
  [v5 setPerformsFirstActionWithFullSwipe:0];

  return v5;
}

- (void)_keyboardWillShow:(id)a3
{
  p_keyboardFrame = &self->_keyboardFrame;
  uint64_t v5 = [a3 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
  [v6 CGRectValue];
  p_keyboardFrame->origin.double x = v7;
  p_keyboardFrame->origin.double y = v8;
  p_keyboardFrame->size.double width = v9;
  p_keyboardFrame->size.double height = v10;

  self->_lastFeedbackSentWasScrolling = 0;
  if (self->_hasKeyboardBeenDismissedForThisQuery && !self->_completionDetailIsPresented)
  {
    [(CatalogViewController *)self _generateVisibleResultsFeedbackForEvent:3];
  }
}

- (void)_keyboardDidShow:(id)a3
{
  if ([(UnifiedField *)self->_textField isFirstResponder])
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)id v4 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldKeyboardPresentation", " enableTelemetry=YES ", v4, 2u);
    }
  }
}

- (void)_keyboardWillHide:(id)a3
{
  CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_keyboardFrame.size = v4;
  self->_hasKeyboardBeenDismissedForThisQuerdouble y = 1;
  self->_keyboardIsBeingDismissed = 1;
  id v6 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  if ([v6 isDragging])
  {
  }
  else
  {
    BOOL completionDetailIsPresented = self->_completionDetailIsPresented;

    if (!completionDetailIsPresented)
    {
      [(CatalogViewController *)self _generateVisibleResultsFeedbackForEvent:3];
    }
  }
}

- (void)_keyboardDidHide:(id)a3
{
  self->_keyboardIsBeingDismissed = 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v16 = a3;
  [v16 contentOffset];
  double v5 = v4;
  [v16 contentInset];
  if (self->_keyboardIsBeingDismissed
    || ((double v10 = -v6, self->_lastScrollOffset != v5) ? (v11 = v5 < v10) : (v11 = 1),
        !v11
     && (double v12 = v7, [v16 contentSize], v14 = v12 + v13, objc_msgSend(v16, "bounds"), v5 <= v14 - v15)))
  {
    [v16 contentOffset];
    if (v8 < self->_lastScrollOffset) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    [(CatalogViewController *)self _generateVisibleResultsFeedbackForEvent:v9];
    self->_lastScrollOffset = v5;
  }
}

- (id)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return WeakRetained;
}

- (id)searchUIFeedbackDelegate
{
  return self->_completionList;
}

- (void)search:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained catalogViewController:self didSelectSearch:v5];
}

- (void)goToURLString:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained catalogViewController:self didSelectAddress:v5];
}

- (void)goToURL:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained catalogViewController:self loadURL:v5 inExternalApplication:0 forImageAttribution:0];
}

- (void)openURLInExternalApplication:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained catalogViewController:self loadURL:v5 inExternalApplication:1 forImageAttribution:0];
}

- (void)willGoToURLFromPegasusSearchResult:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  double v6 = [(UnifiedField *)self->_textField text];
  [WeakRetained catalogViewController:self completionItem:v5 wasAcceptedForString:v6];
}

- (void)findOnPage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerDidSelectFindOnPage:self];
}

- (void)presentDetail:(id)a3
{
  self->_BOOL completionDetailIsPresented = 1;
  p_browserController = &self->_browserController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  double v6 = [(CatalogViewController *)self navigationBar];
  double v7 = [v6 textField];

  if ([v7 isFirstResponder])
  {
    double v8 = [v7 selectedTextRange];
    [WeakRetained setTextRangeToRestoreAfterCompletionDetailIsDismissed:v8];

    [v7 resignFirstResponder];
  }
  uint64_t v9 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  double v10 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  BOOL v11 = [v10 indexPathForSelectedRow];
  [v9 deselectRowAtIndexPath:v11 animated:0];

  double v12 = [[CompletionDetailViewController alloc] initWithRootViewController:v5];
  [(CompletionDetailViewController *)v12 setModalPresentationStyle:2];
  [(CompletionDetailViewController *)v12 setCompletionDetailViewControllerDelegate:WeakRetained];
  completionDetailViewController = self->_completionDetailViewController;
  self->_completionDetailViewController = &v12->super.super;

  [(CatalogViewController *)self _presentStagedCompletionDetailViewControllerAnimated:1];
}

- (void)_presentStagedCompletionDetailViewControllerAnimated:(BOOL)a3
{
  if (self->_completionDetailViewController != self->_completionDetailViewControllerBeingPresented)
  {
    BOOL v3 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained catalogViewController:self willPresentDetailViewController:self->_completionDetailViewController];
    popoverCatalogViewController = self;
    if ([WeakRetained catalogViewControllerShouldUsePopoverForCompletions:self]) {
      popoverCatalogViewController = self->_popoverCatalogViewController;
    }
    double v7 = self->_completionDetailViewController;
    completionDetailViewControllerBeingPresented = self->_completionDetailViewControllerBeingPresented;
    self->_completionDetailViewControllerBeingPresented = v7;
    id v9 = popoverCatalogViewController;

    completionDetailViewController = self->_completionDetailViewController;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__CatalogViewController__presentStagedCompletionDetailViewControllerAnimated___block_invoke;
    v11[3] = &unk_1E6D77E20;
    void v11[4] = self;
    [v9 presentViewController:completionDetailViewController animated:v3 completion:v11];
  }
}

void __78__CatalogViewController__presentStagedCompletionDetailViewControllerAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 1008);
  *(void *)(v1 + 1008) = 0;
}

- (void)dismissCompletionDetailWindowAndResumeEditingIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = dispatch_group_create();
  double v8 = v7;
  if (self->_completionDetailViewController)
  {
    dispatch_group_enter(v7);
    completionDetailViewController = self->_completionDetailViewController;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke;
    v22[3] = &unk_1E6D77E20;
    double v10 = v8;
    char v23 = v10;
    [(UIViewController *)completionDetailViewController dismissViewControllerAnimated:1 completion:v22];
    BOOL v11 = self->_completionDetailViewController;
    self->_completionDetailViewController = 0;

    if (self->_usesPopoverStyleForFavorites)
    {
      popoverCatalogViewController = self->_popoverCatalogViewController;
      if (popoverCatalogViewController)
      {
        double v13 = [(PopoverCatalogViewController *)popoverCatalogViewController presentingViewController];

        if (!v13)
        {
          double v14 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E102C000, v14, OS_LOG_TYPE_DEFAULT, "Cataglog popover is not in view hierachy after completion detail VC dismissed.", buf, 2u);
          }
          dispatch_group_enter(v10);
          double v15 = self->_popoverCatalogViewController;
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_191;
          v19[3] = &unk_1E6D77E20;
          double v20 = v10;
          [(CatalogViewController *)self _presentPopoverWithViewController:v15 completionHandler:v19];
        }
      }
    }
  }
  [(CatalogViewController *)self resumeEditingIfNeeded:v4];
  self->_BOOL completionDetailIsPresented = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_2;
  void v17[3] = &unk_1E6D77E70;
  id v18 = v6;
  id v16 = v6;
  dispatch_group_notify(v8, MEMORY[0x1E4F14428], v17);
}

void __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke(uint64_t a1)
{
}

void __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_191(uint64_t a1)
{
}

uint64_t __97__CatalogViewController_dismissCompletionDetailWindowAndResumeEditingIfNeeded_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resumeEditingIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v5 = [WeakRetained textRangeToRestoreAfterCompletionDetailIsDismissed];
  id v6 = (void *)v5;
  if (v3 && v5)
  {
    double v7 = [(CatalogViewController *)self navigationBar];
    double v8 = [v7 textField];

    [v8 becomeFirstResponder];
    [v8 setSelectedTextRange:v6];
  }
  [WeakRetained setTextRangeToRestoreAfterCompletionDetailIsDismissed:0];
}

- (BOOL)isShowingCompletionDetail
{
  return self->_completionDetailViewController != 0;
}

- (void)resumeSearchWithQuery:(id)a3
{
  id v4 = a3;
  id v11 = [(CatalogViewController *)self unifiedTextField];
  uint64_t v5 = [v4 queryString];
  [v11 setText:v5];

  [v11 becomeFirstResponder];
  id v6 = [v11 endOfDocument];
  double v7 = [v11 endOfDocument];
  double v8 = [v11 textRangeFromPosition:v6 toPosition:v7];
  [v11 setSelectedTextRange:v8];

  [(CompletionList *)self->_completionList didResumeSearchWithQuery:v4];
  id v9 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  double v10 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [v9 deleteSections:v10 withRowAnimation:100];

  [(CatalogViewController *)self _generateVisibleResultsFeedbackForEvent:0];
}

- (void)searchTextCompletionAccessoryButtonTappedForCompletionItem:(id)a3
{
  self->_lastInputWasSearchTextCompletion = 1;
  id v4 = a3;
  uint64_t v5 = [v4 string];
  id v6 = [v5 stringByAppendingString:@" "];
  [(CatalogViewController *)self setQueryString:v6];

  [(UnifiedField *)self->_textField sendActionsForControlEvents:0x20000];
  [(UnifiedField *)self->_textField focusAndInsertCursorAtEnd];
  double v7 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  [v7 userDidEngageWithCompletionListItem:v4 onActionButton:0 method:0];

  self->_lastInputWasSearchTextCompletion = 0;
}

- (void)switchToTabWithUUID:(id)a3 inWindowWithUUID:(id)a4 forTabGroupWithUUID:(id)a5
{
  p_browserController = &self->_browserController;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  [WeakRetained switchToTabWithUUID:v10 inWindowWithUUID:v9 forTabGroupWithUUID:v8];
}

- (void)clearCachedTabCompletionData
{
}

- (void)toggleVoiceSearch
{
  int64_t v3 = [(UnifiedField *)self->_textField voiceSearchState];
  if (v3 == 2)
  {
LABEL_4:
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F98A50]) initWithQueryString:&stru_1F3C268E8 triggerEvent:4];
    id v4 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
    objc_msgSend(v4, "userDidTapMicKey:", objc_msgSend(v6, "queryID"));

    [(UnifiedField *)self->_textField setVoiceSearchState:1];

    return;
  }
  if (v3 != 1)
  {
    if (v3) {
      return;
    }
    goto LABEL_4;
  }
  textField = self->_textField;
  [(UnifiedField *)textField setVoiceSearchState:0];
}

- (void)_commitVoiceSearchIfNecessary
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(CatalogViewController *)self _invalidatePendingVoiceSearchTimer];
  if (self->_hasPendingVoiceSearchUpdate)
  {
    self->_hasPendingVoiceSearchUpdate = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v25 = [(CompletionList *)self->_completionList numberOfGroups];
    if (v25)
    {
      id v24 = WeakRetained;
      int64_t v4 = 0;
      uint64_t v5 = 0;
      for (uint64_t i = 0; i != v25; ++i)
      {
        double v7 = [(CompletionList *)self->_completionList completionsForGroupAtIndex:i];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              double v12 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              int64_t v13 = [(CatalogViewController *)self _relevanceForItem:v12];
              if (v13 > v4)
              {
                int64_t v14 = v13;
                id v15 = v12;

                uint64_t v5 = v15;
                int64_t v4 = v14;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v9);
        }
      }
      if (v5 && v4 != 2)
      {
        id v16 = [(UnifiedField *)self->_textField text];
        BOOL v17 = self->_textField;
        if (v4)
        {
          if (v4 != 3)
          {
            BOOL v18 = v4 == 1;
            id WeakRetained = v24;
            if (!v18) {
              goto LABEL_28;
            }
            double v19 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
            double v20 = objc_loadWeakRetained((id *)&self->_browserController);
            double v21 = [v20 activeSearchEngine];
            objc_msgSend(v19, "userTypedGoToSearch:endpoint:triggerEvent:forQueryID:", v16, objc_msgSend(v21, "parsecSearchEndpointType"), 1, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

LABEL_27:
LABEL_28:
            id v22 = [(UnifiedField *)self->_textField text];
            [WeakRetained catalogViewController:self completionItem:v5 wasAcceptedForString:v22];

            [v5 acceptCompletionWithActionHandler:self];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              char v23 = [v5 completionTableViewCellForCompletionList:self->_completionList];
              [(CatalogViewController *)self _executeActionForParsecResultTableViewCell:v23 completionItem:v5];
            }
            [(UnifiedField *)v17 setVoiceSearchState:0];
            [WeakRetained catalogViewController:self didFinishVoiceSearchWithNavigation:1];

            goto LABEL_31;
          }
          double v19 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
          double v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));
          [v19 userDidEngageWithCompletionListItem:v5 onActionButton:0 method:2 doesMatchSiriSuggestion:1 voiceSearchQueryID:v20];
        }
        else
        {
          double v19 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
          double v20 = [(CompletionList *)self->_completionList query];
          [v19 userTypedURLDirectlyForQuery:v20 triggerEvent:1];
        }
        id WeakRetained = v24;
        goto LABEL_27;
      }
      id WeakRetained = v24;
    }
    else
    {
      uint64_t v5 = 0;
    }
    [(UnifiedField *)self->_textField setVoiceSearchState:0];
    [WeakRetained catalogViewController:self didFinishVoiceSearchWithNavigation:0];
LABEL_31:
  }
}

- (int64_t)_relevanceForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v5 = 3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int64_t v5 = [(CatalogViewController *)self _relevanceForResult:v4];
      }
      else {
        int64_t v5 = 0;
      }
    }
  }

  return v5;
}

- (int64_t)_relevanceForResult:(id)a3
{
  id v3 = a3;
  if ([v3 shouldAutoNavigate])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isInstantAnswer])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_invalidatePendingVoiceSearchTimer
{
  [(NSTimer *)self->_pendingVoiceSearchTimer invalidate];
  pendingVoiceSearchTimer = self->_pendingVoiceSearchTimer;
  self->_pendingVoiceSearchTimer = 0;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  int64_t v5 = WBS_LOG_CHANNEL_PREFIXSignposts();
  if (os_signpost_enabled(v5))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E102C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldKeyboardPresentation", (const char *)&unk_1E1266082, (uint8_t *)buf, 2u);
  }
  if (([v4 isEditing] & 1) == 0) {
    [v4 setClearingBehavior:3];
  }
  [v4 setTextAlignment:0];
  id v6 = [(CatalogViewController *)self textField];
  [v6 setContextCompleter:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  uint64_t v8 = [WeakRetained tabController];
  uint64_t v9 = [v8 activeTabDocument];

  uint64_t v10 = [v9 URL];
  if (v10)
  {
    objc_initWeak(buf, self);
    id v11 = [v9 contextController];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke;
    v13[3] = &unk_1E6D7F188;
    objc_copyWeak(&v14, buf);
    [v11 cachedResponseForURL:v10 completionHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }

  return 1;
}

void __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int64_t v5 = [v3 completer];
    id v6 = v5;
    if (v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke_2;
      v7[3] = &unk_1E6D77D90;
      v7[4] = WeakRetained;
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

void __53__CatalogViewController_textFieldShouldBeginEditing___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) textField];
  [v2 setContextCompleter:v1];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  [(CatalogViewController *)self _ensureCompletionListAndParsecSession];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerDidBeginEditing:self];

  id v11 = objc_loadWeakRetained((id *)&self->_browserController);
  int64_t v5 = [v11 rootViewController];
  id v6 = [v5 capsuleCollectionViewLayout];
  uint64_t v7 = WBSIsEqual();

  id v8 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  uint64_t v9 = [v11 tabController];
  uint64_t v10 = [v9 activeTabDocument];
  objc_msgSend(v8, "searchViewAppearedBecauseOfEvent:isSafariReaderAvailable:forQueryID:usesLoweredSearchBar:", 9, objc_msgSend(v10, "isReaderAvailable"), -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"), v7);

  [(CompletionList *)self->_completionList unifiedFieldDidBecomeFirstResponder];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerDidEndEditing:self];
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  objc_msgSend(v4, "sendClearInputFeedbackWithTriggerEvent:forQueryID:", 1, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

  return 1;
}

- (void)_logQueryEngagement
{
  if ([(UnifiedField *)self->_textField hasSelectedQuerySuggestion])
  {
    id v4 = [(UnifiedField *)self->_textField contextCompleter];
    id v3 = [(UnifiedField *)self->_textField text];
    [v4 logTransactionSuccessfulForInput:v3];
  }
}

- (void)unifiedField:(id)a3 willUpdateUserTypedText:(id)a4 toText:(id)a5
{
  id v7 = a5;
  if (![a4 length] && objc_msgSend(v7, "length"))
  {
    id v8 = WBS_LOG_CHANNEL_PREFIXSignposts();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UnifiedFieldFirstKeyTapToCompletionListUpdate", (const char *)&unk_1E1266082, v9, 2u);
    }
    self->_waitingOnFirstCompletionListUpdateForTelemetrdouble y = 1;
  }
}

- (void)unifiedField:(id)a3 didEndEditingWithAddress:(id)a4
{
  id v15 = a4;
  [(CompletionListDismissalAnalyticsReporter *)self->_completionDismissalReporter setUnifiedFieldContentType:0];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(CompletionItem *)self->_lastTopHitMatch userVisibleURLString],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:v15],
        v5,
        (v6 & 1) != 0))
  {
    uint64_t v7 = 1;
    [(CatalogViewController *)self _logTopHitWasChosen:1];
    id v8 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
    [v8 userDidEngageWithCompletionListItem:self->_lastTopHitMatch onActionButton:0 method:1];

    [(CatalogViewController *)self _logQueryEngagement];
  }
  else
  {
    if (self->_lastTopHitMatch) {
      [(CatalogViewController *)self _logTopHitWasChosen:0];
    }
    BOOL v9 = [(UnifiedField *)self->_textField voiceSearchState] != 0;
    uint64_t v10 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
    id v11 = [(CompletionList *)self->_completionList query];
    [v10 userTypedURLDirectlyForQuery:v11 triggerEvent:v9];

    uint64_t v7 = -1;
  }
  double v12 = [(CompletionList *)self->_completionList query];
  int64_t v13 = [v12 queryString];
  [(CatalogViewController *)self _updatePersonalisationDataForDonation:v13 forPosition:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewController:self didSelectAddress:v15];

  [(CatalogViewController *)self _clearParsecSearchSession];
}

- (void)unifiedField:(id)a3 didEndEditingWithSearch:(id)a4
{
  id v14 = a4;
  [(CompletionListDismissalAnalyticsReporter *)self->_completionDismissalReporter setUnifiedFieldContentType:1];
  if (self->_lastTopHitMatch) {
    [(CatalogViewController *)self _logTopHitWasChosen:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([(CompletionList *)self->_completionList hasParsecResults]) {
    objc_msgSend(WeakRetained, "catalogViewController:cacheSearchQueryID:", self, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));
  }
  char v6 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  id v7 = objc_loadWeakRetained((id *)&self->_browserController);
  id v8 = [v7 activeSearchEngine];
  objc_msgSend(v6, "userTypedGoToSearch:endpoint:triggerEvent:forQueryID:", v14, objc_msgSend(v8, "parsecSearchEndpointType"), 0, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));

  [(CatalogViewController *)self _logQueryEngagement];
  if ((unint64_t)[v14 length] >= 2)
  {
    BOOL v9 = [(CompletionList *)self->_completionList indexPathOfAsTypedSearchSuggestion];

    if (v9)
    {
      uint64_t v10 = [(CompletionList *)self->_completionList indexPathOfAsTypedSearchSuggestion];
      id v11 = [(CatalogViewController *)self _completionItemAtIndexPath:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v12 = [v11 string];
        int v13 = [v12 isEqualToString:v14];

        if (v13) {
          [WeakRetained catalogViewController:self completionItem:v11 wasAcceptedForString:v14];
        }
      }
    }
  }
  [WeakRetained catalogViewController:self didSelectSearch:v14];
  [(CatalogViewController *)self _clearParsecSearchSession];
}

- (void)unifiedField:(id)a3 didEndEditingWithParsecTopHit:(id)a4
{
  completionDismissalReporter = self->_completionDismissalReporter;
  id v6 = a4;
  [(CompletionListDismissalAnalyticsReporter *)completionDismissalReporter setUnifiedFieldContentType:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = [(UnifiedField *)self->_textField text];
  [WeakRetained catalogViewController:self completionItem:v6 wasAcceptedForString:v8];

  BOOL v9 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  [v9 userDidEngageWithCompletionListItem:v6 onActionButton:0 method:1];

  [(CatalogViewController *)self _logQueryEngagement];
  [(CatalogViewController *)self _clearParsecSearchSession];
  [v6 acceptCompletionWithActionHandler:self];

  id v11 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  uint64_t v10 = [v11 indexPathForSelectedRow];
  [(CatalogViewController *)self _executeActionForParsecResultAtIndexPath:v10 tableView:v11];
}

- (BOOL)unifiedField:(id)a3 shouldWaitForTopHitForText:(id)a4
{
  id v5 = a4;
  if ([v5 length] && (completionList = self->_completionList) != 0) {
    BOOL v7 = ![(CompletionList *)completionList isTopHitReadyForString:v5];
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)unifiedField:(id)a3 topHitForText:(id)a4
{
  id v5 = a4;
  if ([v5 length])
  {
    id v6 = [(CompletionList *)self->_completionList topHitForString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)unifiedFieldVoiceSearchStateDidChange:(id)a3
{
  uint64_t v4 = [a3 voiceSearchState];
  if (v4)
  {
    if (v4 != 2) {
      goto LABEL_6;
    }
    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v6 = v5;
    uint64_t v7 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F97E48] sharedLogger];
    id v6 = v5;
    uint64_t v7 = 1;
  }
  [v5 didActivateVoiceSearchAccidentally:v7];

LABEL_6:
  [(CatalogViewController *)self _updateVoiceSearchState];
}

- (BOOL)_shouldTakeOwnershipOfCompletionsViewController
{
  if ([(UnifiedField *)self->_textField isFirstResponder]
    && ![(CatalogViewController *)self _showCompletionsInPopover])
  {
    uint64_t v4 = [(CompletionListTableViewController *)self->_completionsViewController parentViewController];
    if (v4 || self->_voiceSearchWasInProgress)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 1;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_updateVoiceSearchState
{
  int64_t v3 = [(UnifiedField *)self->_textField voiceSearchState];
  uint64_t v4 = [MEMORY[0x1E4F78500] sharedManager];
  char v5 = [v4 liveCompletionList];

  if (v3 == 2)
  {
    self->_voiceSearchWasInProgress = 0;
    self->_hasPendingVoiceSearchUpdate = 1;
    [(CatalogViewController *)self _invalidatePendingVoiceSearchTimer];
    uint64_t v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__commitVoiceSearchIfNecessary selector:0 userInfo:0 repeats:0.3];
    pendingVoiceSearchTimer = self->_pendingVoiceSearchTimer;
    self->_pendingVoiceSearchTimer = v7;
  }
  else if (v3 == 1)
  {
    self->_voiceSearchWasInProgress = 1;
    if ((v5 & 1) == 0)
    {
      BOOL v9 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
      [v9 setHidden:1];

      [(CatalogViewController *)self relinquishOwnershipOfCompletionsViewControllerFromCurrentParent];
      [(CatalogViewController *)self _showStartPageInPopover];
    }
  }
  else if (!v3 && (v5 & 1) == 0)
  {
    id v6 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
    [v6 setHidden:0];

    if ([(CatalogViewController *)self _shouldTakeOwnershipOfCompletionsViewController])
    {
      [(AbstractCatalogViewController *)self takeOwnershipOfCompletionsViewController];
      [(CatalogViewController *)self _updateAlternateContentViewController];
    }
    self->_voiceSearchWasInProgress = 0;
  }
}

- (void)unifiedFieldExternalSearchDidEnd:(id)a3
{
  self->_hasPendingVoiceSearchUpdate = 1;
  [(CatalogViewController *)self _invalidatePendingVoiceSearchTimer];
  uint64_t v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__commitVoiceSearchIfNecessary selector:0 userInfo:0 repeats:0.3];
  pendingVoiceSearchTimer = self->_pendingVoiceSearchTimer;
  self->_pendingVoiceSearchTimer = v4;
}

- (void)unifiedFieldReflectedItemDidChange:(id)a3
{
  id v8 = a3;
  char v4 = [v8 lastEditWasADeletion];
  char v5 = v8;
  if ((v4 & 1) != 0 || (int v6 = [v8 isResigningFirstResponder], v5 = v8, v6))
  {
    uint64_t v7 = [v5 reflectedItem];
    if (!v7) {
      [(CatalogViewController *)self _deselectCompletionsViewControllerSelectedRow];
    }

    char v5 = v8;
  }
}

- (void)unifiedField:(id)a3 moveCompletionSelectionByRowOffset:(int64_t)a4
{
  id v8 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  -[UITableView safari_moveSelectionByRowOffset:](v8, a4);
  int v6 = [v8 indexPathForSelectedRow];
  uint64_t v7 = [(CatalogViewController *)self _completionItemAtIndexPath:v6];
  [(UnifiedField *)self->_textField setReflectedItem:v7];
}

- (void)unifiedField:(id)a3 moveCompletionSelectionBySectionOffset:(int64_t)a4
{
  id v8 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  -[UITableView safari_moveSelectionBySectionOffset:](v8, a4);
  int v6 = [v8 indexPathForSelectedRow];
  uint64_t v7 = [(CatalogViewController *)self _completionItemAtIndexPath:v6];
  [(UnifiedField *)self->_textField setReflectedItem:v7];
}

- (void)unifiedFieldSelectCompletionItemIfAvailable:(id)a3
{
  char v4 = [(CompletionListTableViewController *)self->_completionsViewController tableView];
  id v5 = [v4 indexPathForSelectedRow];

  if (v5) {
    [(CatalogViewController *)self _selectedCompletionItemAtIndexPath:v5];
  }
  else {
    [(UnifiedField *)self->_textField sendActionsForControlEvents:0x80000];
  }
}

- (void)unifiedField:(id)a3 focusNextKeyView:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewController:self focusNextKeyView:v4];
}

- (BOOL)unifiedFieldCanBecomeFirstResponder:(id)a3
{
  int64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained catalogViewControllerUnifiedFieldCanBecomeFirstResponder:v3];

  return (char)v3;
}

- (void)unifiedFieldMakeWindowKey:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerMakeWindowKey:self];
}

- (void)unifiedFieldShouldPasteAndNavigate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CatalogViewController_unifiedFieldShouldPasteAndNavigate___block_invoke;
  v6[3] = &unk_1E6D7F1B0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "safari_bestStringForPastingIntoURLFieldCompletionHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __60__CatalogViewController_unifiedFieldShouldPasteAndNavigate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 156);
    [v5 catalogViewController:v4 didPasteText:v6];
  }
}

- (void)unifiedField:(id)a3 didEngageWithQuerySuggestion:(id)a4 forQueryString:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = [(WBSParsecDSession *)self->_parsecSearchSession feedbackDispatcher];
  id v10 = objc_alloc(MEMORY[0x1E4F9A490]);
  id v11 = (objc_class *)MEMORY[0x1E4F9A3C8];
  id v18 = v7;
  id v12 = v8;
  id v13 = [v11 alloc];
  id v14 = [v18 topicId];
  id v15 = [v18 title];

  id v16 = (void *)[v13 initWithIdentifier:v14 suggestion:v15 query:v12 score:2 type:0.0];
  BOOL v17 = (void *)[v10 initWithSuggestion:v16];
  objc_msgSend(v9, "postFeedback:forQueryID:", v17, -[CatalogViewController _completionListQueryID](self, "_completionListQueryID"));
}

- (BOOL)shouldPutMetadataOnPasteboardForUnifiedField:(id)a3
{
  id v4 = [(UnifiedField *)self->_textField text];
  if (-[UnifiedField selectionRange](self->_textField, "selectionRange") || v5 != [v4 length])
  {
    char v11 = 0;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v4);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
    id v8 = [WeakRetained tabController];
    BOOL v9 = [v8 activeTabDocument];
    id v10 = [v9 urlForSharing];

    char v11 = objc_msgSend(v6, "safari_isEqualToURL:", v10);
  }

  return v11;
}

- (id)currentMetadataForUnifiedField:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = [WeakRetained tabController];
  uint64_t v5 = [v4 activeTabDocument];
  id v6 = [v5 linkMetadataForSharing];

  return v6;
}

- (void)feedbackButtonWasTappedWithProblemURL:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained catalogViewController:self loadURL:v5 inExternalApplication:0 forImageAttribution:0];
}

- (void)showUniversalSearchFirstTimeExperienceIfNotShowing
{
  if (![(CatalogViewController *)self isShowingUniversalSearchFirstTimeExperience])
  {
    int64_t v3 = +[WBSParsecDSession sharedPARSession];
    id v4 = [v3 bag];
    id v5 = [v4 firstUseDescriptionText];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = objc_alloc_init(UniversalSearchFirstTimeExperienceViewController);
      [(UniversalSearchFirstTimeExperienceViewController *)v7 setDelegate:self];
      [(CatalogViewController *)self requiredContentWidth];
      -[UniversalSearchFirstTimeExperienceViewController setPreferredContentSize:](v7, "setPreferredContentSize:");
      uint64_t v8 = [(UniversalSearchFirstTimeExperienceViewController *)v7 view];
      [(id)v8 setAccessibilityIdentifier:@"UniversalSearchFirstTimeExperienceView"];

      universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;
      self->_universalSearchFirstTimeExperienceViewController = v7;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      LOBYTE(v8) = [WeakRetained catalogViewControllerShouldUsePopoverForCompletions:self];

      if (v8)
      {
        [(AbstractCatalogViewController *)self->_popoverCatalogViewController takeOwnershipOfUniversalSearchFirstTimeExperienceViewController];
        if (![(CatalogViewController *)self popoverIsShowing])
        {
          popoverCatalogViewController = self->_popoverCatalogViewController;
          [(CatalogViewController *)self _presentPopoverWithViewController:popoverCatalogViewController];
        }
      }
      else
      {
        [(AbstractCatalogViewController *)self takeOwnershipOfUniversalSearchFirstTimeExperienceViewController];
      }
    }
  }
}

- (void)firstTimeExperienceContinueButtonPressed
{
}

- (void)dismissCompletionsForSizeClassTransition
{
  [(CatalogViewController *)self _setShowingCompletions:0 popoverDismissalReason:1 completionHandler:0];
  universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;
  [(CatalogViewController *)self _dismissUniversalSearchFirstTimeExperience:universalSearchFirstTimeExperienceViewController dismissalReason:1];
}

- (void)didInteractWithUniversalSearchFirstTimeExperienceViewController:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() userDidInteractWithParsecFirstTimeUserExperience];
  [(CatalogViewController *)self _dismissUniversalSearchFirstTimeExperience:v4 dismissalReason:0];
}

- (void)didCancelUniversalSearchFirstTimeExperienceViewController:(id)a3
{
}

- (void)_dismissUniversalSearchFirstTimeExperience:(id)a3 dismissalReason:(int64_t)a4
{
}

- (void)_dismissUniversalSearchFirstTimeExperience:(id)a3 dismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  id v14 = a5;
  id v7 = [(UniversalSearchFirstTimeExperienceViewController *)self->_universalSearchFirstTimeExperienceViewController presentedViewController];
  [v7 dismissViewControllerAnimated:1 completion:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (![WeakRetained catalogViewControllerShouldUsePopoverForCompletions:self])
  {

    goto LABEL_6;
  }
  BOOL usesPopoverStyleForFavorites = self->_usesPopoverStyleForFavorites;

  if (usesPopoverStyleForFavorites)
  {
LABEL_6:
    if (a4 == 1) {
      [(CatalogViewController *)self _dismissPopoverAnimated:0 dismissalReason:1 completionHandler:0];
    }
    [(CatalogViewController *)self relinquishOwnershipOfUniversalSearchFirstTimeExperienceViewControllerFromCurrentParent];
    goto LABEL_9;
  }
  if (a4 == 2)
  {
    id v10 = self;
    uint64_t v11 = 0;
    int64_t v12 = 2;
  }
  else
  {
    if ([(UnifiedField *)self->_textField hasText]) {
      goto LABEL_9;
    }
    id v10 = self;
    uint64_t v11 = 1;
    int64_t v12 = a4;
  }
  [(CatalogViewController *)v10 _dismissPopoverAnimated:v11 dismissalReason:v12 completionHandler:v14];
LABEL_9:
  [(UniversalSearchFirstTimeExperienceViewController *)self->_universalSearchFirstTimeExperienceViewController setDelegate:0];
  universalSearchFirstTimeExperienceViewController = self->_universalSearchFirstTimeExperienceViewController;
  self->_universalSearchFirstTimeExperienceViewController = 0;
}

- (BOOL)isShowingUniversalSearchPrivacyDetails
{
  id v2 = [(UniversalSearchFirstTimeExperienceViewController *)self->_universalSearchFirstTimeExperienceViewController presentedViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updatePersonalisationDataForDonation:(id)a3 forPosition:(unint64_t)a4
{
  p_browserController = &self->_browserController;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_browserController);
  uint64_t v8 = [WeakRetained tabController];
  id v11 = [v8 activeTabDocument];

  BOOL v9 = [v11 personalizationData];
  [v9 setSearchQuery:v6];

  id v10 = [v11 personalizationData];
  [v10 setPosition:a4];
}

- (UIView)snapshotContentView
{
  return (UIView *)[(SFStartPageViewController *)self->_startPageViewController view];
}

- (UIColor)snapshotBackgroundColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
}

- (CGRect)snapshotContentRectInBounds:(CGRect)a3
{
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v6 = [(SFStartPageViewController *)self->_startPageViewController view];
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  double left = self->_obscuredInsets.left;
  double v16 = left + self->_obscuredInsets.right;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size = a3.size;
  double Width = CGRectGetWidth(v28);
  v29.origin.CGFloat x = v8;
  v29.origin.CGFloat y = v10;
  v29.size.double width = v12;
  v29.size.double height = v14;
  double v18 = v16;
  double v19 = Width / (CGRectGetWidth(v29) - v16);
  double v20 = -(left * v19);
  v30.origin.CGFloat x = v8;
  v30.origin.CGFloat y = v10;
  v30.size.double width = v12;
  v30.size.double height = v14;
  CGFloat v21 = CGRectGetMinY(v30) * v19;
  CGFloat v22 = CGRectGetWidth(a3) + v18 * v19;
  v31.origin.CGFloat x = v8;
  v31.origin.CGFloat y = v10;
  v31.size.double width = v12;
  v31.size.double height = v14;
  double v23 = v19 * CGRectGetHeight(v31);
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  result.size.double height = v23;
  result.size.double width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (BOOL)checkAndResetIfNextSnapshotRequiresScreenUpdates
{
  BOOL nextSnapshotRequiresScreenUpdates = self->_nextSnapshotRequiresScreenUpdates;
  self->_BOOL nextSnapshotRequiresScreenUpdates = 0;
  return nextSnapshotRequiresScreenUpdates;
}

- (void)beginTransitionToNewSizeClassWithState:(id)a3
{
  self->_transitioningToNewSizeClass = 1;
  id v4 = a3;
  id v5 = [(CatalogViewController *)self queryString];
  [v4 setQueryString:v5];

  objc_msgSend(v4, "setShowingCompletions:", -[CatalogViewController isShowingCompletions](self, "isShowingCompletions"));
  objc_msgSend(v4, "setShowingUniversalFirstTimeExperience:", -[CatalogViewController isShowingUniversalSearchFirstTimeExperience](self, "isShowingUniversalSearchFirstTimeExperience"));
  [v4 setCompletionDetailViewController:self->_completionDetailViewController];
  id v6 = [(UnifiedField *)self->_textField text];
  objc_msgSend(v4, "setFieldIsEmpty:", objc_msgSend(v6, "length") == 0);

  completionDetailViewController = self->_completionDetailViewController;
  if (completionDetailViewController)
  {
    CGFloat v8 = [(UIViewController *)completionDetailViewController presentedViewController];
    [v8 dismissViewControllerAnimated:0 completion:0];

    [(UIViewController *)self->_completionDetailViewController dismissViewControllerAnimated:0 completion:0];
    double v9 = self->_completionDetailViewController;
    self->_completionDetailViewController = 0;
  }
}

- (void)endTransitionToNewSizeClassWithState:(id)a3
{
  id v6 = a3;
  self->_transitioningToNewSizeClass = 0;
  [(PopoverCatalogViewController *)self->_popoverCatalogViewController resetStartPagePreferredHeight];
  if ([v6 isShowingCompletions])
  {
    id v4 = [v6 queryString];
    [(CatalogViewController *)self setQueryString:v4];

    [(CatalogViewController *)self _reloadCompletionTable];
  }
  else if ([v6 isShowingUniversalFirstTimeExperience])
  {
    [(CatalogViewController *)self showUniversalSearchFirstTimeExperienceIfNotShowing];
  }
  if ([v6 fieldIsEmpty]) {
    [(UnifiedField *)self->_textField setText:0];
  }
  id v5 = [v6 completionDetailViewController];
  if ([(CatalogViewController *)self _shouldPresentCompletionDetailViewControllerAfterSizeTransition:v5])
  {
    objc_storeStrong((id *)&self->_completionDetailViewController, v5);
    [(CatalogViewController *)self _presentStagedCompletionDetailViewControllerAnimated:0];
    self->_BOOL completionDetailIsPresented = 1;
  }
}

- (BOOL)_shouldPresentCompletionDetailViewControllerAfterSizeTransition:(id)a3
{
  if (a3) {
    return [a3 isBeingDismissed] ^ 1;
  }
  else {
    return 0;
  }
}

- (id)_cancelBarButtonItem
{
  cancelBarButton = self->_cancelBarButton;
  if (cancelBarButton)
  {
    BOOL v3 = cancelBarButton;
  }
  else
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x1E4FB13F0];
    id v6 = _WBSLocalizedString();
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    BOOL v17 = __45__CatalogViewController__cancelBarButtonItem__block_invoke;
    double v18 = &unk_1E6D78C18;
    objc_copyWeak(&v19, &location);
    double v7 = [v5 actionWithTitle:v6 image:0 identifier:0 handler:&v15];

    id v8 = objc_alloc(MEMORY[0x1E4F78248]);
    double v9 = objc_msgSend(v8, "initWithStyle:primaryAction:", 2, v7, v15, v16, v17, v18);
    CGFloat v10 = [(StartPageController *)self->_startPageController viewController];
    objc_msgSend(v9, "setOpaqueBackgroundVisibility:", (double)(objc_msgSend(v10, "showsWallpaper") ^ 1));

    double v11 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v9];
    CGFloat v12 = self->_cancelBarButton;
    self->_cancelBarButton = v11;

    double v13 = _SFAccessibilityIdentifierForBarItem();
    [(UIBarButtonItem *)self->_cancelBarButton setAccessibilityIdentifier:v13];

    BOOL v3 = self->_cancelBarButton;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __45__CatalogViewController__cancelBarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 122);
    [v2 navigationBarCancelButtonWasTapped:0];

    id WeakRetained = v3;
  }
}

- (void)startPageControllerDidCompleteDismissGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dismissCatalogViewController:self];
}

- (void)startPageControllerDidCompleteUnfocusGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained catalogViewControllerWillUnfocusUnifiedField:self];
  id v4 = [(CatalogViewController *)self textField];
  [v4 endEditing:1];
}

- (void)startPageViewController:(id)a3 willPresentCustomizationViewController:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained catalogViewController:self willPresentCustomizationViewController:v6];
}

- (BOOL)startPageViewControllerShouldDeferLoadingContentUntilKeyboardAnimatesIn:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v4 = [WeakRetained tabController];
  id v5 = [v4 activeTabDocument];
  char v6 = [v5 isBlank] ^ 1;

  return v6;
}

- (CompletionList)completionList
{
  return self->_completionList;
}

- (BOOL)isContentBorrowed
{
  return self->_contentBorrowed;
}

- (CatalogViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CatalogViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LoadProgressObserver)loadProgressObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_loadProgressObserver);
  return (LoadProgressObserver *)WeakRetained;
}

- (_SFNavigationBarCommon)navigationBar
{
  return self->_navigationBar;
}

- (UIEdgeInsets)obscuredInsets
{
  double top = self->_obscuredInsets.top;
  double left = self->_obscuredInsets.left;
  double bottom = self->_obscuredInsets.bottom;
  double right = self->_obscuredInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)usesPopoverStyleForFavorites
{
  return self->_usesPopoverStyleForFavorites;
}

- (UIPopoverPresentationController)popoverPresentationController
{
  return self->_popoverPresentationController;
}

- (BOOL)hasScheduledCompletionListDismissal
{
  return self->_hasScheduledCompletionListDismissal;
}

- (void)setHasScheduledCompletionListDismissal:(BOOL)a3
{
  self->_hasScheduledCompletionListDismissal = a3;
}

- (BOOL)completionDetailIsPresented
{
  return self->_completionDetailIsPresented;
}

- (CompletionItem)lastTopHitMatch
{
  return self->_lastTopHitMatch;
}

- (void)setLastTopHitMatch:(id)a3
{
}

- (UniversalSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (void)setParsecSearchSession:(id)a3
{
}

- (UnifiedField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_storeStrong((id *)&self->_lastTopHitMatch, 0);
  objc_storeStrong((id *)&self->_startPageController, 0);
  objc_storeStrong((id *)&self->_popoverPresentationController, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_destroyWeak((id *)&self->_loadProgressObserver);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completionList, 0);
  objc_storeStrong((id *)&self->_universalSearchFirstTimeExperienceViewController, 0);
  objc_storeStrong((id *)&self->_startPageViewController, 0);
  objc_storeStrong((id *)&self->_completionsViewController, 0);
  objc_storeStrong((id *)&self->_tableViewCellHeightCache, 0);
  objc_storeStrong((id *)&self->_cancelBarButton, 0);
  objc_storeStrong((id *)&self->_timerForClearingCompletionListCaches, 0);
  objc_storeStrong((id *)&self->_completionDismissalReporter, 0);
  objc_storeStrong((id *)&self->_pendingVoiceSearchTimer, 0);
  objc_storeStrong((id *)&self->_seenVisibleResults, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_sidebarButton, 0);
  objc_storeStrong((id *)&self->_completionDetailViewControllerBeingPresented, 0);
  objc_storeStrong((id *)&self->_completionDetailViewController, 0);
  objc_storeStrong((id *)&self->_popoverCatalogViewController, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

- (void)tableView:(uint64_t)a1 contextMenuConfigurationForRowAtIndexPath:(NSObject *)a2 point:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "Table view cell is nil for item at index path: %@", (uint8_t *)&v2, 0xCu);
}

- (void)tableView:(void *)a1 contextMenuConfigurationForRowAtIndexPath:point:.cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  int v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1E102C000, v1, OS_LOG_TYPE_ERROR, "Completion list and table view are out of sync. Completion item for context menu configuration is SFSearchResult but table view cell is kind of %@", (uint8_t *)&v4, 0xCu);
}

@end