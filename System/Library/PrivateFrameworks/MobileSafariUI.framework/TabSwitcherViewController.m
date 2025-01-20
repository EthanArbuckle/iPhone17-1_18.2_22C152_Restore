@interface TabSwitcherViewController
- (BOOL)_canAddItemOnPage:(id)a3;
- (BOOL)_itemWithIdentifier:(id)a3 matchesSearchQuery:(id)a4;
- (BOOL)_switchToItemToActivateAnimated:(BOOL)a3;
- (BOOL)_validateDismissalToPage:(id)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)defersActivation;
- (BOOL)dismissesOnUnlock;
- (BOOL)drivesCapsuleSelection;
- (BOOL)isSendingTrailingAction;
- (BOOL)showsSidebarToggle;
- (BOOL)tabOverviewIsVisible;
- (CGRect)capsuleReferenceFrame;
- (CGRect)frameForItemLinkedToCapsuleAtIndex:(int64_t)a3;
- (CGSize)snapshotSizeForSuggestedSize:(CGSize)result;
- (CollectionViewTabIndexProviding)capsuleIndexProvider;
- (NSArray)items;
- (NSString)uuidOfTabBeingSelected;
- (SFAnimationSettings)animationSettingsForCapsuleSelectionGesture;
- (SFAnimationSettings)animationSettingsForCapsuleSelectionUpdate;
- (SFTabCollectionSearchController)searchController;
- (SFTabSwitcher)tabSwitcher;
- (TabCollectionItem)itemToActivate;
- (TabController)tabController;
- (TabOverviewToolbar)toolbar;
- (TabSwitcherViewController)initWithTabController:(id)a3;
- (TabSwitcherViewControllerContaining)container;
- (TabThumbnailCollectionViewDelegate)delegate;
- (UIBarButtonItem)sidebarToggleBarButtonItem;
- (UIEdgeInsets)browserContentInsets;
- (UIPanGestureRecognizer)panGestureRecognizerForTrackingPinchTranslationVelocity;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (WBTabGroup)visibleTabGroup;
- (double)desiredSnapshotScale;
- (double)linkedPanGesturePageWidth;
- (double)pageWidth;
- (id)_activeTab;
- (id)_borrowCapsuleViewForItem:(id)a3;
- (id)_defaultTabToSelectOnPage:(id)a3;
- (id)_dragItemsForItem:(id)a3;
- (id)_dropDestinationForSession:(id)a3 proposedDestination:(id)a4;
- (id)_itemForActiveTab;
- (id)_itemForTab:(id)a3;
- (id)_makeContent;
- (id)_manageTabGroupsMenu;
- (id)_menuElementsForPage:(id)a3 withSuggestedActions:(id)a4;
- (id)_menuForTabGroup:(id)a3 withSuggestedActions:(id)a4;
- (id)_tabForItem:(id)a3;
- (id)_tabGroupForPage:(id)a3;
- (id)_tabGroups;
- (id)_tabWithUUID:(id)a3;
- (id)_tabsForItems:(id)a3;
- (id)_titleForTab:(id)a3;
- (id)undoManager;
- (int64_t)itemDragContentType;
- (int64_t)presentationState;
- (unint64_t)estimatedSnapshotsPerPageForBounds:(CGRect)a3 withTraitCollection:(id)a4;
- (unint64_t)snapshotBorderOptions;
- (void)_addItemOnPage:(id)a3;
- (void)_addPage:(id)a3;
- (void)_applyContent;
- (void)_closeItems:(id)a3;
- (void)_didScrollToPage:(id)a3;
- (void)_dismiss;
- (void)_dismissToPage:(id)a3;
- (void)_isInSteadyStateDidChange:(BOOL)a3;
- (void)_moveSections:(id)a3 toPage:(id)a4;
- (void)_performDropWithIntent:(id)a3;
- (void)_performIgnoringContentUpdates:(id)a3;
- (void)_presentTabGroupPickerSheet:(id)a3;
- (void)_selectTabWithUUID:(id)a3;
- (void)_setItems:(id)a3 arePinned:(BOOL)a4;
- (void)_setNeedsApplyContent;
- (void)_setTitle:(id)a3 forPage:(id)a4;
- (void)_updateShareConfigurationForPage:(id)a3;
- (void)addPresentationObserver:(id)a3;
- (void)animateSwitchingToItemAtIndex:(int64_t)a3;
- (void)applyContentIfNeeded;
- (void)beginAnimatedSizeTransition;
- (void)beginRenamingVisibleTabGroup;
- (void)beginSearching;
- (void)beginSearchingWithSearchString:(id)a3;
- (void)cancelRenamingVisibleTabGroup;
- (void)detachCapsuleForActiveTab;
- (void)didCancelDismissal;
- (void)didCompleteLaunch;
- (void)didDismiss;
- (void)didPresent;
- (void)didReceiveLinkedPanGesture:(id)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissForUnlockingAnimated:(BOOL)a3;
- (void)endAnimatedSizeTransition;
- (void)loadView;
- (void)presentAnimated:(BOOL)a3;
- (void)removePresentationObserver:(id)a3;
- (void)scrollToNextTabGroup;
- (void)scrollToPreviousTabGroup;
- (void)scrollToTabGroup:(id)a3;
- (void)setBorrowedContentSize:(CGSize)a3 obscuredInsets:(UIEdgeInsets)a4;
- (void)setBrowserContentInsets:(UIEdgeInsets)a3;
- (void)setCapsuleIndexProvider:(id)a3;
- (void)setCapsuleReferenceFrame:(CGRect)a3;
- (void)setContainer:(id)a3;
- (void)setDefersActivation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissesOnUnlock:(BOOL)a3;
- (void)setItemToActivate:(id)a3;
- (void)setLinkedPanGesturePageWidth:(double)a3;
- (void)setNeedsApplyContentAnimated:(BOOL)a3;
- (void)setNeedsScrollToTabGroup:(id)a3;
- (void)setShowsSidebarToggle:(BOOL)a3;
- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5;
- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4;
- (void)tabGroupManagerDidUpdateProfiles:(id)a3;
- (void)tabGroupManagerDidUpdateTabGroups:(id)a3;
- (void)test_scrollToTopWithoutAnimation;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismiss;
- (void)willPresent;
@end

@implementation TabSwitcherViewController

- (int64_t)presentationState
{
  int64_t result = [(SFTabSwitcher *)self->_tabSwitcher presentationState];
  if ((unint64_t)(result - 1) >= 3) {
    return 0;
  }
  return result;
}

- (void)_applyContent
{
  tabSwitcher = self->_tabSwitcher;
  v4 = [(TabSwitcherViewController *)self _makeContent];
  [(SFTabSwitcher *)tabSwitcher applyContent:v4];

  self->_updateInfo.animated = 0;
  self->_updateInfo.needsApplyContent = 0;
}

- (id)_makeContent
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F783F8]);
  if ([(TabController *)self->_tabController hasMultipleProfiles])
  {
    v4 = [(TabController *)self->_tabController activeProfile];
    id v5 = objc_alloc(MEMORY[0x1E4F78428]);
    v6 = [v4 title];
    v7 = (void *)[v5 initWithTitle:v6];

    v8 = [v4 symbolImage];
    [v7 setImage:v8];

    v9 = (void *)MEMORY[0x1E4FB1618];
    v10 = [v4 color];
    v11 = objc_msgSend(v9, "safari_colorWithWBSNamedColorOption:", v10);
    [v7 setTintColor:v11];
  }
  else
  {
    v7 = 0;
  }
  v12 = [(TabSwitcherViewController *)self _tabGroups];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __41__TabSwitcherViewController__makeContent__block_invoke;
  v20 = &unk_1E6D7E910;
  id v21 = v7;
  v22 = self;
  id v13 = v7;
  v14 = objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", &v17);
  objc_msgSend(v3, "setPages:", v14, v17, v18, v19, v20);

  [v3 setProfileForInsertedPages:v13];
  v15 = [(TabSwitcherViewController *)self _itemForActiveTab];
  [v3 setSelectedItem:v15];

  return v3;
}

- (id)_tabGroups
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(TabController *)self->_tabController privateTabGroupIfAvailable];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  id v5 = [(TabController *)self->_tabController unnamedTabGroup];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v5);

  v6 = [(TabController *)self->_tabController namedTabGroups];
  [v3 addObjectsFromArray:v6];

  v7 = (void *)[v3 copy];
  return v7;
}

- (TabOverviewToolbar)toolbar
{
  return 0;
}

- (void)setNeedsApplyContentAnimated:(BOOL)a3
{
  BOOL animated = self->_updateInfo.animated;
  if (!self->_updateInfo.animated && a3) {
    BOOL animated = self->_hasCompletedLaunch;
  }
  self->_updateInfo.BOOL animated = animated;
  [(TabSwitcherViewController *)self _setNeedsApplyContent];
  v6 = [(TabSwitcherViewController *)self view];
  [v6 setNeedsLayout];

  v7 = (void *)*MEMORY[0x1E4FB2608];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__TabSwitcherViewController_setNeedsApplyContentAnimated___block_invoke;
  v8[3] = &unk_1E6D77E20;
  v8[4] = self;
  [v7 _performBlockAfterCATransactionCommits:v8];
}

- (void)_setNeedsApplyContent
{
  self->_updateInfo.needsApplyContent = 1;
}

- (void)setNeedsScrollToTabGroup:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 uuid];

  v8 = (NSUUID *)[v6 initWithUUIDString:v7];
  identifierOfPageToScrollTo = self->_updateInfo.identifierOfPageToScrollTo;
  self->_updateInfo.identifierOfPageToScrollTo = v8;

  [(TabSwitcherViewController *)self setNeedsApplyContentAnimated:1];
}

uint64_t __58__TabSwitcherViewController_setNeedsApplyContentAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyContentIfNeeded];
}

uint64_t __49__TabSwitcherViewController_applyContentIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyContent];
}

- (unint64_t)estimatedSnapshotsPerPageForBounds:(CGRect)a3 withTraitCollection:(id)a4
{
  uint64_t v4 = -[SFTabSwitcher visibleSnapshotLimitForBounds:traitCollection:](self->_tabSwitcher, "visibleSnapshotLimitForBounds:traitCollection:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v4 & ~(v4 >> 63);
}

- (id)_itemForActiveTab
{
  id v3 = [(TabSwitcherViewController *)self _activeTab];
  if (v3)
  {
    uint64_t v4 = [(TabSwitcherViewController *)self _itemForTab:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __41__TabSwitcherViewController__makeContent__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tabController];
  [v1 authenticateToUnlockPrivateBrowsing];
}

- (id)_activeTab
{
  v2 = [(TabController *)self->_tabController activeTabDocument];
  id v3 = [v2 tabGroupTab];

  return v3;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return (UIPinchGestureRecognizer *)[(SFTabSwitcher *)self->_tabSwitcher pinchGestureRecognizer];
}

- (void)setLinkedPanGesturePageWidth:(double)a3
{
}

- (void)setCapsuleReferenceFrame:(CGRect)a3
{
}

- (void)setBrowserContentInsets:(UIEdgeInsets)a3
{
}

- (void)setBorrowedContentSize:(CGSize)a3 obscuredInsets:(UIEdgeInsets)a4
{
}

- (TabThumbnailCollectionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabThumbnailCollectionViewDelegate *)WeakRetained;
}

- (id)_itemForTab:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F29128]);
  id v6 = [v4 uuid];
  v7 = (void *)[v5 initWithUUIDString:v6];

  if (v7)
  {
    v8 = [(TabController *)self->_tabController tabDocumentWithUUID:v7];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F78408]) initWithIdentifier:v7];
    objc_msgSend(v9, "setCanBeClosed:", -[TabController canCloseWBTab:](self->_tabController, "canCloseWBTab:", v4));
    objc_msgSend(v9, "setCanBeCopied:", objc_msgSend(v4, "hasLinkToCopy"));
    objc_msgSend(v9, "setCanBePinned:", -[TabController isTabPinnable:](self->_tabController, "isTabPinnable:", v4));
    objc_msgSend(v9, "setIsInteractivelyInserted:", objc_msgSend(v8, "isInteractivelyInserted"));
    objc_msgSend(v9, "setMediaStateIcon:", objc_msgSend(v8, "mediaStateIcon"));
    objc_initWeak((id *)location, self);
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __41__TabSwitcherViewController__itemForTab___block_invoke;
    v29 = &unk_1E6D7E8C0;
    objc_copyWeak(&v31, (id *)location);
    id v10 = v7;
    id v30 = v10;
    [v9 setSearchPredicate:&v26];
    v11 = -[TabController tabWithUUID:](self->_tabController, "tabWithUUID:", v10, v26, v27, v28, v29);
    objc_msgSend(v9, "setIsUnread:", objc_msgSend(v11, "isUnread"));
    v12 = [v11 shareParticipants];
    [v9 setShareParticipants:v12];

    id v13 = [(TabSwitcherViewController *)self _titleForTab:v4];
    [v9 setTitle:v13];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v8 = [v4 uuid];
    if (v8)
    {
      v14 = [(TabController *)self->_tabController tabGroupRelatedToTabWithUUID:v8];
    }
    else
    {
      v14 = 0;
    }
    v15 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = v15;
      if ([v4 isInUnnamedTabGroup]) {
        uint64_t v18 = @"YES";
      }
      else {
        uint64_t v18 = @"NO";
      }
      v19 = v18;
      if ([v4 isPinned]) {
        v20 = @"YES";
      }
      else {
        v20 = @"NO";
      }
      id v21 = v20;
      if ([v4 isPrivateBrowsing]) {
        v22 = @"YES";
      }
      else {
        v22 = @"NO";
      }
      v23 = v22;
      v24 = [v14 profileIdentifier];
      v25 = [v14 uuid];
      *(_DWORD *)location = 138544642;
      *(void *)&location[4] = v8;
      __int16 v33 = 2114;
      v34 = v19;
      __int16 v35 = 2114;
      v36 = v21;
      __int16 v37 = 2114;
      v38 = v23;
      __int16 v39 = 2114;
      v40 = v24;
      __int16 v41 = 2114;
      v42 = v25;
      _os_log_fault_impl(&dword_1E102C000, v17, OS_LOG_TYPE_FAULT, "Unexpectedly found tab with invalid UUID %{public}@. inUnnamedGroup = %{public}@; pinned = %{public}@; private ="
        " %{public}@; profileIdentifier = %{public}@; tabGroupUUID = %{public}@",
        location,
        0x3Eu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_titleForTab:(id)a3
{
  id v3 = a3;
  id v4 = [v3 title];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    uint64_t v6 = [v3 title];
  }
  else
  {
    v7 = [v3 url];

    id v3 = [v7 absoluteString];

    if ([v3 length]) {
      objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", URLSimplificationOptionsForTabTitle, 1, 0);
    }
    else {
    uint64_t v6 = _WBSLocalizedString();
    }
  }
  v8 = (void *)v6;

  return v8;
}

id __41__TabSwitcherViewController__makeContent__block_invoke(uint64_t a1, void *a2)
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [v2 uuid];
  uint64_t v5 = (void *)[v3 initWithUUIDString:v4];

  if (v5)
  {
    int v6 = [v2 isPrivateBrowsing];
    uint64_t v7 = [v2 isNamed];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F78410]) initWithIdentifier:v5];
    [v8 setAllowsLargeTitle:v7];
    [v8 setAllowsRetitling:v7];
    if (v7)
    {
      v9 = +[FeatureManager sharedFeatureManager];
      objc_msgSend(v8, "setAllowsSharing:", objc_msgSend(v9, "areSharedTabGroupsEnabled"));

      if (!v6)
      {
LABEL_4:
        [v8 setImage:0];
        [v8 setItemsCanMoveBetweenPages:1];
        uint64_t v10 = *(void *)(a1 + 32);
LABEL_10:
        [v8 setProfile:v10];
        id v13 = [v2 displayTitle];
        [v8 setTitle:v13];

        v14 = (void *)[objc_alloc(MEMORY[0x1E4F78438]) initWithIdentifier:v5];
        [v14 setIsPinned:1];
        v15 = [*(id *)(*(void *)(a1 + 40) + 1088) pinnedWBTabsForTabGroup:v2];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __41__TabSwitcherViewController__makeContent__block_invoke_48;
        v35[3] = &unk_1E6D7E8E8;
        v35[4] = *(void *)(a1 + 40);
        v16 = objc_msgSend(v15, "safari_mapAndFilterObjectsUsingBlock:", v35);
        [v14 setItems:v16];

        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F78438]) initWithIdentifier:v5];
        uint64_t v18 = [v2 tabs];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __41__TabSwitcherViewController__makeContent__block_invoke_2;
        v34[3] = &unk_1E6D7E8E8;
        v34[4] = *(void *)(a1 + 40);
        v19 = objc_msgSend(v18, "safari_mapAndFilterObjectsUsingBlock:", v34);
        [v17 setItems:v19];

        v36[0] = v14;
        v36[1] = v17;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
        [v8 setSections:v20];

        if (v6)
        {
          id v21 = +[Application sharedApplication];
          int v22 = [v21 isPrivateBrowsingLocked];

          if (v22)
          {
            objc_initWeak(&location, *(id *)(a1 + 40));
            v23 = (void *)MEMORY[0x1E4F78418];
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __41__TabSwitcherViewController__makeContent__block_invoke_3;
            v31[3] = &unk_1E6D78630;
            objc_copyWeak(&v32, &location);
            v24 = [v23 lockedPrivateBrowsingOverlayWithUnlockHandler:v31];
            [v8 setOverlay:v24];

            [v8 setIsLocked:1];
            v25 = [MEMORY[0x1E4F78420] lockedPrivateBrowsing];
            [v8 setPeekingOverlay:v25];

            objc_destroyWeak(&v32);
            objc_destroyWeak(&location);
          }
          else
          {
            if (([v8 hasAnyItems] & 1) == 0)
            {
              uint64_t v26 = [MEMORY[0x1E4F78418] emptyPrivateBrowsing];
              [v8 setOverlay:v26];
            }
            uint64_t v27 = [MEMORY[0x1E4F78420] privateBrowsing];
            [v8 setPeekingOverlay:v27];
          }
        }
        v28 = [*(id *)(*(void *)(a1 + 40) + 1088) cachedTabSwitcherShareConfigurationForTabGroup:v2];
        if (v28) {
          [v8 setShareConfiguration:v28];
        }

        goto LABEL_19;
      }
    }
    else
    {
      [v8 setAllowsSharing:0];
      if (!v6) {
        goto LABEL_4;
      }
    }
    v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"hand.raised.fill"];
    [v8 setImage:v12];

    [v8 setItemsCanMoveBetweenPages:0];
    uint64_t v10 = 0;
    goto LABEL_10;
  }
  v11 = WBS_LOG_CHANNEL_PREFIXTabView();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    __41__TabSwitcherViewController__makeContent__block_invoke_cold_1(v11, v2);
  }
  v8 = 0;
LABEL_19:

  return v8;
}

- (NSString)uuidOfTabBeingSelected
{
  return self->_uuidOfTabBeingSelected;
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__TabSwitcherViewController_dismissAnimated___block_invoke;
  v6[3] = &unk_1E6D77E20;
  v6[4] = self;
  uint64_t v4 = MEMORY[0x1E4E42950](v6, a2);
  uint64_t v5 = (void *)v4;
  if (v3) {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v4);
  }
}

uint64_t __45__TabSwitcherViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

- (void)setContainer:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizerForTrackingPinchTranslationVelocity
{
  return (UIPanGestureRecognizer *)[(SFTabSwitcher *)self->_tabSwitcher panGestureRecognizerForTrackingPinchTranslationVelocity];
}

- (TabSwitcherViewController)initWithTabController:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TabSwitcherViewController;
  int v6 = [(TabSwitcherViewController *)&v23 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F78558] settings];
    v8 = [v5 browserWindowUUID];
    v6->_dismissesOnUnlock = [v7 tabViewDismissesOnUnlockForWindowWithUUID:v8];

    v9 = [[TabDocumentDropHandler alloc] initWithAlertPresentationViewController:v6];
    dropHandler = v6->_dropHandler;
    v6->_dropHandler = v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    presentationObservers = v6->_presentationObservers;
    v6->_presentationObservers = (NSHashTable *)v11;

    objc_storeStrong((id *)&v6->_tabController, a3);
    id v13 = objc_alloc(MEMORY[0x1E4F783E8]);
    v14 = [v5 tabCollectionViewProvider];
    v15 = [v14 iconPool];
    v16 = [v5 tabCollectionViewProvider];
    uint64_t v17 = [v16 snapshotPool];
    uint64_t v18 = [v13 initWithTabIconPool:v15 tabSnapshotPool:v17];
    tabSwitcher = v6->_tabSwitcher;
    v6->_tabSwitcher = (SFTabSwitcher *)v18;

    [(SFTabSwitcher *)v6->_tabSwitcher setPresentationObserver:v6];
    v20 = [v5 tabGroupManager];
    [v20 addTabGroupObserver:v6];

    id v21 = v6;
  }

  return v6;
}

- (void)setCapsuleIndexProvider:(id)a3
{
}

- (void)_dismiss
{
  [(TabSwitcherViewController *)self applyContentIfNeeded];
  id v3 = [(SFTabSwitcher *)self->_tabSwitcher visiblePage];
  [(TabSwitcherViewController *)self _dismissToPage:v3];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)TabSwitcherViewController;
  [(TabSwitcherViewController *)&v5 viewWillLayoutSubviews];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  uint64_t v4 = [WeakRetained transitionViewForReducedMotion];
  [(SFTabSwitcher *)self->_tabSwitcher setTransitionViewForReducedMotion:v4];

  [(TabSwitcherViewController *)self applyContentIfNeeded];
}

- (void)applyContentIfNeeded
{
  p_updateInfo = &self->_updateInfo;
  if (self->_updateInfo.needsApplyContent && !self->_updateInfo.ignoreCount && self->_hasCompletedLaunch)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F78448]);
    if (p_updateInfo->animated
      && [(SFTabSwitcher *)self->_tabSwitcher isVisible]
      && [MEMORY[0x1E4FB1EB0] areAnimationsEnabled])
    {
      if (p_updateInfo->identifierOfPageToScrollTo) {
        [MEMORY[0x1E4F781B0] tabOverviewSwitcherScroll];
      }
      else {
      objc_super v5 = [MEMORY[0x1E4F781B0] tabOverviewUpdate];
      }
      [v4 setAnimationSettings:v5];
    }
    if (p_updateInfo->identifierOfPageToScrollTo)
    {
      int v6 = (void *)MEMORY[0x1E4F78430];
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F78410]) initWithIdentifier:p_updateInfo->identifierOfPageToScrollTo];
      v8 = [v6 scrollPositionWithPage:v7];
      [v4 setTargetScrollPosition:v8];
    }
    tabSwitcher = self->_tabSwitcher;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__TabSwitcherViewController_applyContentIfNeeded__block_invoke;
    v11[3] = &unk_1E6D77E20;
    v11[4] = self;
    [(SFTabSwitcher *)tabSwitcher performTransaction:v4 withUpdates:v11];
    identifierOfPageToScrollTo = p_updateInfo->identifierOfPageToScrollTo;
    p_updateInfo->identifierOfPageToScrollTo = 0;
  }
}

- (void)_dismissToPage:(id)a3
{
  id v4 = a3;
  if ([(SFTabSwitcher *)self->_tabSwitcher isVisible]
    && [(TabSwitcherViewController *)self _validateDismissalToPage:v4])
  {
    objc_super v5 = [(TabSwitcherViewController *)self _defaultTabToSelectOnPage:v4];
    int v6 = v5;
    if (v5)
    {
      tabController = self->_tabController;
      v8 = [v5 uuid];
      LODWORD(tabController) = [(TabController *)tabController isTabWithUUIDBeingHiddenFromTabView:v8];

      if (tabController)
      {
        [(TabController *)self->_tabController clearHiddenTabForExplanationView];
        [(TabSwitcherViewController *)self _applyContent];
      }
      v9 = [v6 uuid];
      [(TabSwitcherViewController *)self _selectTabWithUUID:v9];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0
        && ([WeakRetained tabCollectionViewCanDismiss:self] & 1) == 0)
      {
        id v13 = WBS_LOG_CHANNEL_PREFIXTabView();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1E102C000, v13, OS_LOG_TYPE_DEFAULT, "Request to dismiss tab overview vetoed by delegate", v14, 2u);
        }
      }
      else
      {
        tabSwitcher = self->_tabSwitcher;
        v12 = [(TabSwitcherViewController *)self _itemForTab:v6];
        [(SFTabSwitcher *)tabSwitcher dismissToItem:v12];
      }
    }
  }
}

- (UIBarButtonItem)sidebarToggleBarButtonItem
{
  return (UIBarButtonItem *)[(SFTabSwitcher *)self->_tabSwitcher sidebarToggleBarButtonItem];
}

- (void)setShowsSidebarToggle:(BOOL)a3
{
}

- (void)addPresentationObserver:(id)a3
{
}

- (SFTabCollectionSearchController)searchController
{
  return 0;
}

- (void)setDelegate:(id)a3
{
}

- (void)didCompleteLaunch
{
  self->_hasCompletedLaunch = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__TabSwitcherViewController_didCompleteLaunch__block_invoke;
  v2[3] = &unk_1E6D77E20;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v2);
}

- (void)viewDidLoad
{
  v61.receiver = self;
  v61.super_class = (Class)TabSwitcherViewController;
  [(TabSwitcherViewController *)&v61 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4F783F0]);
  objc_initWeak(&location, self);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke;
  v58[3] = &unk_1E6D7E5C8;
  objc_copyWeak(&v59, &location);
  [v3 setItemSelectionHandler:v58];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_2;
  v56[3] = &unk_1E6D7E5F0;
  objc_copyWeak(&v57, &location);
  [v3 setBorrowedCapsuleViewProvider:v56];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_3;
  v54[3] = &unk_1E6D7E618;
  objc_copyWeak(&v55, &location);
  [v3 setBorrowedContentViewProvider:v54];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_4;
  v52[3] = &unk_1E6D7E640;
  objc_copyWeak(&v53, &location);
  [v3 setCanAddItemPredicate:v52];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_5;
  v50[3] = &unk_1E6D7E668;
  objc_copyWeak(&v51, &location);
  [v3 setDidScrollToPageObserver:v50];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_6;
  v48[3] = &unk_1E6D7E668;
  objc_copyWeak(&v49, &location);
  [v3 setDismissHandler:v48];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_7;
  v46[3] = &unk_1E6D7E690;
  objc_copyWeak(&v47, &location);
  [v3 setDragItemProvider:v46];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_8;
  v44[3] = &unk_1E6D7E6B8;
  objc_copyWeak(&v45, &location);
  [v3 setDropDestinationProvider:v44];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_9;
  v42[3] = &unk_1E6D7E6E0;
  objc_copyWeak(&v43, &location);
  [v3 setDropHandler:v42];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_10;
  v40[3] = &unk_1E6D7E708;
  objc_copyWeak(&v41, &location);
  [v3 setDropOperationProvider:v40];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_11;
  v38[3] = &unk_1E6D7E668;
  objc_copyWeak(&v39, &location);
  [v3 setItemAddHandler:v38];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_12;
  v36[3] = &unk_1E6D7E730;
  objc_copyWeak(&v37, &location);
  [v3 setItemCloseHandler:v36];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_13;
  v34[3] = &unk_1E6D7E758;
  objc_copyWeak(&v35, &location);
  [v3 setItemCopyHandler:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_14;
  v32[3] = &unk_1E6D7E780;
  objc_copyWeak(&v33, &location);
  [v3 setItemMoveHandler:v32];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_15;
  v30[3] = &unk_1E6D7E7A8;
  objc_copyWeak(&v31, &location);
  [v3 setItemPinHandler:v30];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_16;
  v28[3] = &unk_1E6D7E668;
  objc_copyWeak(&v29, &location);
  [v3 setPageInsertionHandler:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_17;
  v26[3] = &unk_1E6D7E7D0;
  objc_copyWeak(&v27, &location);
  [v3 setPageRetitleHandler:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_18;
  v24[3] = &unk_1E6D7E7F8;
  objc_copyWeak(&v25, &location);
  [v3 setPageTitleMenuProvider:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_19;
  v22[3] = &unk_1E6D7E820;
  objc_copyWeak(&v23, &location);
  [v3 setProfileMenuProvider:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_20;
  v20[3] = &unk_1E6D7E848;
  objc_copyWeak(&v21, &location);
  [v3 setRelinquishBorrowedCapsuleView:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_21;
  v18[3] = &unk_1E6D7E870;
  objc_copyWeak(&v19, &location);
  [v3 setRelinquishBorrowedContentView:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_22;
  v16[3] = &unk_1E6D7E898;
  objc_copyWeak(&v17, &location);
  [v3 setRecentlyClosedMenuProvider:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_23;
  v14[3] = &unk_1E6D7E118;
  objc_copyWeak(&v15, &location);
  [v3 setShowPagePickerSheet:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_24;
  v12[3] = &unk_1E6D7CE90;
  objc_copyWeak(&v13, &location);
  [v3 setSteadyStateObserver:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_25;
  v10[3] = &unk_1E6D7CE90;
  objc_copyWeak(&v11, &location);
  [v3 setTabOverviewVisibilityObserver:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_26;
  v8[3] = &unk_1E6D78630;
  objc_copyWeak(&v9, &location);
  [v3 setToggleSidebarHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_27;
  v6[3] = &unk_1E6D7E640;
  objc_copyWeak(&v7, &location);
  [v3 setValidateDismissal:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__TabSwitcherViewController_viewDidLoad__block_invoke_28;
  v4[3] = &unk_1E6D7E668;
  objc_copyWeak(&v5, &location);
  [v3 setWillScrollToPageObserver:v4];
  [(SFTabSwitcher *)self->_tabSwitcher applyConfiguration:v3];
  [(TabSwitcherViewController *)self _setNeedsApplyContent];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
}

uint64_t __40__TabSwitcherViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _canAddItemOnPage:v3];

  return v5;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_28(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _willScrollToPage:v3];
}

- (void)_updateShareConfigurationForPage:(id)a3
{
  id v4 = [(TabSwitcherViewController *)self _tabGroupForPage:a3];
  if (v4)
  {
    uint64_t v5 = [(TabController *)self->_tabController cachedTabSwitcherShareConfigurationForTabGroup:v4];

    if (!v5)
    {
      tabController = self->_tabController;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __62__TabSwitcherViewController__updateShareConfigurationForPage___block_invoke;
      v7[3] = &unk_1E6D7C880;
      v7[4] = self;
      [(TabController *)tabController tabSwitcherShareConfigurationForTabGroup:v4 completion:v7];
    }
  }
}

uint64_t __62__TabSwitcherViewController__updateShareConfigurationForPage___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setNeedsApplyContentAnimated:0];
  }
  return result;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didScrollToPage:v3];
}

- (void)_didScrollToPage:(id)a3
{
  id v9 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastSettledPage, a3);
    [(TabController *)self->_tabController persistActiveTabGroupOrTabGroupVisibleInSwitcher];
    uint64_t v5 = [(TabSwitcherViewController *)self _tabGroupForPage:v9];
    int v6 = v5;
    if (v5)
    {
      if (([v5 isPrivateBrowsing] & 1) == 0) {
        [(TabSwitcherViewController *)self setDismissesOnUnlock:0];
      }
      id v7 = self;
      if ([(TabSwitcherViewController *)v7 presentationState] == 1)
      {

LABEL_8:
        [(TabController *)self->_tabController didFocusTabGroup:v6];
        goto LABEL_9;
      }
      uint64_t v8 = [(TabSwitcherViewController *)v7 presentationState];

      if (v8 == 2) {
        goto LABEL_8;
      }
    }
LABEL_9:
  }
}

- (void)setDismissesOnUnlock:(BOOL)a3
{
  if (self->_dismissesOnUnlock != a3)
  {
    BOOL v3 = a3;
    self->_dismissesOnUnlock = a3;
    id v6 = [MEMORY[0x1E4F78558] settings];
    uint64_t v5 = [(TabController *)self->_tabController browserWindowUUID];
    [v6 setTabViewDismissesOnUnlock:v3 forWindowWithUUID:v5];
  }
}

- (BOOL)_canAddItemOnPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TabSwitcherViewController *)self _tabGroupForPage:v4];
  if (v5) {
    BOOL v6 = -[TabController canAddNewTabInTabGroup:withTabCount:](self->_tabController, "canAddNewTabInTabGroup:withTabCount:", v5, [v4 itemCount]);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)_tabGroupForPage:(id)a3
{
  tabController = self->_tabController;
  id v4 = [a3 identifier];
  uint64_t v5 = [v4 UUIDString];
  BOOL v6 = [(TabController *)tabController tabGroupWithUUID:v5];

  return v6;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)TabSwitcherViewController;
  [(TabSwitcherViewController *)&v5 loadView];
  [(TabSwitcherViewController *)self addChildViewController:self->_tabSwitcher];
  BOOL v3 = [(TabSwitcherViewController *)self view];
  id v4 = [(SFTabSwitcher *)self->_tabSwitcher view];
  [v3 addSubview:v4];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [(SFTabSwitcher *)self->_tabSwitcher didMoveToParentViewController:self];
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 identifier];
    objc_super v5 = [v4 UUIDString];
    [WeakRetained _selectTabWithUUID:v5];
  }
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v5 = [WeakRetained _borrowCapsuleViewForItem:v3];

  return v5;
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)WeakRetained + 133);
    id v7 = (void *)v5[136];
    uint64_t v8 = [v3 identifier];
    id v9 = [v7 tabWithUUID:v8];
    uint64_t v10 = [v9 tabCollectionItem];
    id v11 = [v6 tabCollectionView:v5 borrowContentViewControllerForItem:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dismissToPage:v3];
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v5 = [WeakRetained _dragItemsForItem:v3];

  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  return v7;
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  uint64_t v8 = [WeakRetained _dropDestinationForSession:v6 proposedDestination:v5];

  if (v8) {
    id v9 = v8;
  }
  else {
    id v9 = v5;
  }
  id v10 = v9;

  return v10;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _performDropWithIntent:v3];
}

unint64_t __40__TabSwitcherViewController_viewDidLoad__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = (void *)*((void *)WeakRetained + 136);
    id v10 = [v5 identifier];
    id v11 = [v10 UUIDString];
    v12 = [v9 tabGroupWithUUID:v11];
    uint64_t v13 = [v12 isPrivateBrowsing];

    unint64_t v14 = +[TabDocumentDropHandler proposedOperationForSession:v6 intoWindowWithPrivateBrowsingEnabled:v13];
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _addItemOnPage:v3];
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_12(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _closeItems:v5];
    [v4 _applyContent];
  }
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_13(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    id v5 = [WeakRetained _tabsForItems:v6];
    objc_msgSend(v4, "safari_copyLinksForTabs:", v5);
  }
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _moveSections:v8 toPage:v5];
    [v7 _applyContent];
  }
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setItems:v7 arePinned:a3];
    [v6 _applyContent];
  }
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_16(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _addPage:v5];
    [v4 _applyContent];
  }
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _setTitle:v5 forPage:v8];
    [v7 _applyContent];
  }
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v8 = [WeakRetained _menuElementsForPage:v6 withSuggestedActions:v5];

  return v8;
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_19(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained tabController];
  id v3 = [v2 menuForSwitchingProfilesQuickly];

  return v3;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained container];
  [v4 relinquishBorrowedCapsuleView:v3];
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)WeakRetained + 133);
    id v9 = (void *)v7[136];
    id v10 = [v5 identifier];
    id v11 = [v9 tabWithUUID:v10];
    v12 = [v11 tabCollectionItem];
    [v8 tabCollectionView:v7 relinquishBorrowedContentViewController:v13 forItem:v12];
  }
}

id __40__TabSwitcherViewController_viewDidLoad__block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained tabController];
  id v6 = [v3 identifier];

  id v7 = [v6 UUIDString];
  id v8 = [v5 recentlyClosedTabsMenuForTabGroupWithUUID:v7];

  return v8;
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_23(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _presentTabGroupPickerSheet:v3];
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_24(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _isInSteadyStateDidChange:a2];
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_25(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained container];
  [v3 tabOverviewVisibilityDidChange:a2];
}

void __40__TabSwitcherViewController_viewDidLoad__block_invoke_26(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained container];
  [v1 toggleSidebar];
}

uint64_t __40__TabSwitcherViewController_viewDidLoad__block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _validateDismissalToPage:v3];

  return v5;
}

- (id)_borrowCapsuleViewForItem:(id)a3
{
  tabController = self->_tabController;
  uint64_t v5 = [a3 identifier];
  id v6 = [(TabController *)tabController tabWithUUID:v5];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
    id v8 = [WeakRetained borrowCapsuleViewForTab:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)detachCapsuleForActiveTab
{
  id v3 = [(TabSwitcherViewController *)self _itemForActiveTab];
  if (v3)
  {
    id v4 = v3;
    [(SFTabSwitcher *)self->_tabSwitcher detachBorrowedCapsuleForItem:v3];
    id v3 = v4;
  }
}

uint64_t __41__TabSwitcherViewController__itemForTab___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = [WeakRetained _itemWithIdentifier:*(void *)(a1 + 32) matchesSearchQuery:v4];

  return v6;
}

uint64_t __41__TabSwitcherViewController__makeContent__block_invoke_48(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _itemForTab:a2];
}

id __41__TabSwitcherViewController__makeContent__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isPinned] & 1) != 0
    || (id v4 = *(void **)(*(void *)(a1 + 32) + 1088),
        [v3 uuid],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = [v4 isTabWithUUIDBeingHiddenFromTabView:v5],
        v5,
        (v4 & 1) != 0))
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) _itemForTab:v3];
  }

  return v6;
}

- (void)_performIgnoringContentUpdates:(id)a3
{
  p_updateInfo = &self->_updateInfo;
  ++self->_updateInfo.ignoreCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --p_updateInfo->ignoreCount;
}

- (id)_dragItemsForItem:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(TabSwitcherViewController *)self _tabForItem:a3];
  if (v4)
  {
    uint64_t v5 = [(TabController *)self->_tabController dragItemForTab:v4 tabItem:0];
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)_dropDestinationForSession:(id)a3 proposedDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if ([v8 isPinned])
  {
    BOOL v9 = +[TabDocumentDropHandler canPinAllItemsInSession:v6];

    if (!v9)
    {
      id v10 = [v7 page];
      id v11 = [(TabSwitcherViewController *)self _tabGroupForPage:v10];

      id v12 = objc_alloc(MEMORY[0x1E4F78438]);
      id v13 = [v7 section];
      unint64_t v14 = [v13 identifier];
      id v15 = (void *)[v12 initWithIdentifier:v14];

      v16 = [v11 firstUnpinnedTab];
      id v17 = [(TabSwitcherViewController *)self _itemForTab:v16];

      id v18 = objc_alloc(MEMORY[0x1E4F78400]);
      id v19 = [v7 page];
      id v20 = (id)[v18 initWithPage:v19 section:v15 droppingBefore:v17];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v20 = v7;
LABEL_6:

  return v20;
}

- (void)_performDropWithIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 destination];
  id v6 = [v5 page];
  id v7 = [v6 identifier];
  id v8 = [v7 UUIDString];
  [(TabController *)self->_tabController setActiveTabGroupUUID:v8];

  dropHandler = self->_dropHandler;
  id v10 = [v4 session];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__TabSwitcherViewController__performDropWithIntent___block_invoke;
  v13[3] = &unk_1E6D7E938;
  id v14 = v5;
  id v15 = self;
  id v16 = v4;
  id v11 = v4;
  id v12 = v5;
  [(TabDocumentDropHandler *)dropHandler dropItemsForSession:v10 withInsertionHandler:v13];

  [(TabSwitcherViewController *)self applyContentIfNeeded];
}

void __52__TabSwitcherViewController__performDropWithIntent___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  id v3 = [*(id *)(a1 + 32) item];
  id v4 = [*(id *)(a1 + 32) section];
  uint64_t v5 = [v4 isPinned];

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(v6 + 1088);
  if (v3)
  {
    id v8 = [v3 identifier];
    BOOL v9 = [v7 tabWithUUID:v8];

    id v10 = [*(id *)(*(void *)(a1 + 40) + 1088) currentTabs];
    uint64_t v11 = [v10 indexOfObject:v9];
  }
  else
  {
    id v12 = *(void **)(v6 + 1088);
    if (v5) {
      [v12 pinnedTabs];
    }
    else {
    BOOL v9 = [v12 currentTabs];
    }
    uint64_t v11 = [v9 count];
  }

  id v13 = *(void **)(a1 + 48);
  id v14 = *(void **)(*(void *)(a1 + 40) + 1088);
  id v15 = [v13 session];
  id v16 = (id)[v14 dropTabsAtIndex:v11 pinned:v5 dropSession:v15 dragItems:v17];
}

- (void)_addItemOnPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[Application sharedApplication];
  if ([v4 isLocked] && objc_msgSend(v5, "isPrivateBrowsingLocked"))
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__TabSwitcherViewController__addItemOnPage___block_invoke;
    v21[3] = &unk_1E6D7A168;
    v21[4] = self;
    id v22 = v4;
    [v5 authenticateToUnlockPrivateBrowsingWithCompletionHandler:v21];
  }
  else
  {
    tabController = self->_tabController;
    id v7 = [v4 identifier];
    id v8 = [v7 UUIDString];
    BOOL v9 = [(TabController *)tabController appendWBTabInTabGroupWithUUID:v8];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__TabSwitcherViewController__addItemOnPage___block_invoke_2;
    v19[3] = &unk_1E6D77D90;
    v19[4] = self;
    id v20 = v9;
    id v10 = v9;
    [(TabSwitcherViewController *)self _performIgnoringContentUpdates:v19];
    uint64_t v11 = [(TabController *)self->_tabController activeTabDocument];
    id v12 = [v11 webExtensionsController];
    [v12 didOpenTab:v11];

    [v11 displayNewTabOverridePageIfNecessary];
    id v13 = [(TabSwitcherViewController *)self _itemForTab:v10];
    id v14 = objc_alloc_init(MEMORY[0x1E4F78448]);
    id v15 = [MEMORY[0x1E4F781B0] tabOverviewScroll];
    [v14 setAnimationSettings:v15];

    [v14 setInsertedItemToDismissTo:v13];
    id v16 = [MEMORY[0x1E4F78430] scrollPositionWithItem:v13];
    [v14 setTargetScrollPosition:v16];

    tabSwitcher = self->_tabSwitcher;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__TabSwitcherViewController__addItemOnPage___block_invoke_3;
    v18[3] = &unk_1E6D77E20;
    void v18[4] = self;
    [(SFTabSwitcher *)tabSwitcher performTransaction:v14 withUpdates:v18];
  }
}

uint64_t __44__TabSwitcherViewController__addItemOnPage___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _addItemOnPage:*(void *)(result + 40)];
  }
  return result;
}

void __44__TabSwitcherViewController__addItemOnPage___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) uuid];
  [*(id *)(*(void *)(a1 + 32) + 1088) setActiveTabUUID:v2];
}

uint64_t __44__TabSwitcherViewController__addItemOnPage___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyContent];
}

- (void)_addPage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v5 UUIDString];

  id v7 = objc_alloc(MEMORY[0x1E4FB6080]);
  id v8 = [v4 title];
  BOOL v9 = [(TabController *)self->_tabController deviceIdentifier];
  id v10 = (void *)[v7 initWithTitle:v8 uuid:v6 deviceIdentifier:v9];

  uint64_t v11 = [(TabController *)self->_tabController activeProfileIdentifier];
  [v10 setProfileIdentifier:v11];

  id v12 = [(TabSwitcherViewController *)self _tabGroups];
  id v13 = [v12 lastObject];

  id v14 = [(TabController *)self->_tabController tabGroupManager];
  if ([v13 isNamed]) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }
  id v16 = (id)[v14 insertTabGroup:v10 afterTabGroup:v15];

  id v17 = [v4 sections];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    id v19 = [v4 sections];
    [(TabSwitcherViewController *)self _moveSections:v19 toPage:v4];
  }
  else
  {
    id v19 = [(TabController *)self->_tabController tabGroupManager];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __38__TabSwitcherViewController__addPage___block_invoke;
    v21[3] = &unk_1E6D7C290;
    v21[4] = self;
    [v19 updateTabsInTabGroupWithUUID:v6 persist:1 usingBlock:v21];
  }

  [(TabSwitcherViewController *)self _updateShareConfigurationForPage:v4];
  id v20 = [v10 uuid];
  [(TabController *)self->_tabController setActiveTabGroupUUID:v20];
}

void __38__TabSwitcherViewController__addPage___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4FB6078];
  id v3 = *(void **)(*(void *)(a1 + 32) + 1088);
  id v4 = a2;
  uint64_t v5 = [v3 deviceIdentifier];
  uint64_t v6 = [v2 startPageTabWithDeviceIdentifier:v5];
  v8[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 appendTabs:v7];
}

- (void)_closeItems:(id)a3
{
  id v4 = [a3 allObjects];
  id v5 = [(TabSwitcherViewController *)self _tabsForItems:v4];

  [(TabController *)self->_tabController closeWBTabs:v5];
}

- (void)_moveSections:(id)a3 toPage:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v13) items];
        id v15 = [(TabSwitcherViewController *)self _tabsForItems:v14];
        [v8 addObjectsFromArray:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v16 = [(TabSwitcherViewController *)self _tabGroupForPage:v7];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __50__TabSwitcherViewController__moveSections_toPage___block_invoke;
  v19[3] = &unk_1E6D78980;
  v19[4] = self;
  id v20 = v8;
  id v21 = v16;
  id v17 = v16;
  id v18 = v8;
  [(TabSwitcherViewController *)self _performIgnoringContentUpdates:v19];
  [(TabSwitcherViewController *)self applyContentIfNeeded];
}

uint64_t __50__TabSwitcherViewController__moveSections_toPage___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 1088) moveWBTabs:a1[5] toTabGroup:a1[6]];
}

- (void)_setItems:(id)a3 arePinned:(BOOL)a4
{
  BOOL v4 = a4;
  tabController = self->_tabController;
  id v6 = [(TabSwitcherViewController *)self _tabsForItems:a3];
  [(TabController *)tabController setWBTabs:v6 arePinned:v4];
}

- (void)_setTitle:(id)a3 forPage:(id)a4
{
  tabController = self->_tabController;
  id v6 = a3;
  id v8 = [a4 identifier];
  id v7 = [v8 UUIDString];
  [(TabController *)tabController setTitle:v6 forTabGroupWithUUID:v7];
}

- (BOOL)_itemWithIdentifier:(id)a3 matchesSearchQuery:(id)a4
{
  id v6 = a4;
  id v7 = [a3 UUIDString];
  id v8 = [(TabSwitcherViewController *)self _tabWithUUID:v7];

  id v9 = [(TabController *)self->_tabController tabCollectionViewProvider];
  LOBYTE(self) = [v9 tabItem:v8 matchesSearchText:v6];

  return (char)self;
}

- (void)beginSearching
{
}

- (void)beginSearchingWithSearchString:(id)a3
{
}

- (void)beginRenamingVisibleTabGroup
{
}

- (void)cancelRenamingVisibleTabGroup
{
}

- (void)scrollToNextTabGroup
{
}

- (void)scrollToPreviousTabGroup
{
}

uint64_t __46__TabSwitcherViewController_didCompleteLaunch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyContentIfNeeded];
}

- (UIEdgeInsets)browserContentInsets
{
  [(SFTabSwitcher *)self->_tabSwitcher browserContentInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)capsuleReferenceFrame
{
  [(SFTabSwitcher *)self->_tabSwitcher capsuleReferenceFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)linkedPanGesturePageWidth
{
  [(SFTabSwitcher *)self->_tabSwitcher linkedPanGesturePageWidth];
  return result;
}

- (void)dismissForUnlockingAnimated:(BOOL)a3
{
  [(TabSwitcherViewController *)self setDismissesOnUnlock:0];
  if (a3)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F78448]);
    [v5 setPrefersDetachedTransition:1];
    tabSwitcher = self->_tabSwitcher;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__TabSwitcherViewController_dismissForUnlockingAnimated___block_invoke;
    v7[3] = &unk_1E6D77E20;
    v7[4] = self;
    [(SFTabSwitcher *)tabSwitcher performTransaction:v5 withUpdates:v7];
  }
  else
  {
    [(TabSwitcherViewController *)self dismissAnimated:0];
  }
}

uint64_t __57__TabSwitcherViewController_dismissForUnlockingAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismiss];
}

- (id)_menuElementsForPage:(id)a3 withSuggestedActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TabSwitcherViewController *)self _tabGroupForPage:v6];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v10 = [(TabSwitcherViewController *)self _manageTabGroupsMenu];
    uint64_t v11 = [v9 arrayWithObject:v10];

    if (([v6 isLocked] & 1) == 0)
    {
      uint64_t v12 = [(TabSwitcherViewController *)self _menuForTabGroup:v8 withSuggestedActions:v7];
      [v11 addObject:v12];
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_manageTabGroupsMenu
{
  double v3 = [MEMORY[0x1E4F1CA48] array];
  double v4 = [(TabController *)self->_tabController submenuForSwitchingProfiles];
  objc_msgSend(v3, "safari_addObjectUnlessNil:", v4);

  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = _WBSLocalizedString();
  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.on.square"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __49__TabSwitcherViewController__manageTabGroupsMenu__block_invoke;
  id v14 = &unk_1E6D78C18;
  objc_copyWeak(&v15, &location);
  id v8 = [v5 actionWithTitle:v6 image:v7 identifier:0 handler:&v11];
  objc_msgSend(v3, "addObject:", v8, v11, v12, v13, v14);

  id v9 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v3];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

void __49__TabSwitcherViewController__manageTabGroupsMenu__block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _presentTabGroupPickerSheet:v3];
}

- (id)_menuForTabGroup:(id)a3 withSuggestedActions:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 array];
  [v9 addObjectsFromArray:v7];

  uint64_t v10 = +[TabMenuProvider sortMenuForTabGroup:v8 dataSource:self->_tabController];
  objc_msgSend(v9, "safari_addObjectUnlessNil:", v10);

  id v11 = +[TabMenuProvider copyLinksActionForTabGroup:v8];
  objc_msgSend(v9, "safari_addObjectUnlessNil:", v11);

  uint64_t v12 = [(TabController *)self->_tabController tabMenuProviderDataSource];
  uint64_t v13 = +[TabMenuProvider bookmarkActionForTabGroup:v8 dataSource:v12];

  objc_msgSend(v9, "safari_addObjectUnlessNil:", v13);
  id v14 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F3C268E8 image:0 identifier:0 options:1 children:v9];

  return v14;
}

- (void)_isInSteadyStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_presentationObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "tabCollectionView:didChangeSteadyState:", self, v3, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_presentTabGroupPickerSheet:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  uint64_t v6 = [WeakRetained showTabGroupPicker:v4];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke;
  v7[3] = &unk_1E6D78630;
  objc_copyWeak(&v8, &location);
  [v6 setWillDisappear:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = dispatch_time(0, 320000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke_2;
    block[3] = &unk_1E6D77E20;
    block[4] = WeakRetained;
    dispatch_after(v2, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __57__TabSwitcherViewController__presentTabGroupPickerSheet___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) clearHighlightedCapsule];
}

- (id)_defaultTabToSelectOnPage:(id)a3
{
  id v4 = [(TabSwitcherViewController *)self _tabGroupForPage:a3];
  if (v4)
  {
    id v5 = [(TabController *)self->_tabController defaultTabToSelectInTabGroup:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_switchToItemToActivateAnimated:(BOOL)a3
{
  itemToActivate = self->_itemToActivate;
  if (!itemToActivate) {
    return 0;
  }
  BOOL v5 = a3;
  tabController = self->_tabController;
  uint64_t v7 = [(TabCollectionItem *)itemToActivate UUID];
  id v8 = [(TabController *)tabController tabWithUUID:v7];
  uint64_t v9 = [v8 wbTab];

  uint64_t v10 = self->_itemToActivate;
  self->_itemToActivate = 0;

  BOOL v11 = v9 != 0;
  if (v9)
  {
    if (v5)
    {
      [(TabSwitcherViewController *)self _applyContent];
      tabSwitcher = self->_tabSwitcher;
      long long v13 = [(TabSwitcherViewController *)self _itemForTab:v9];
      [(SFTabSwitcher *)tabSwitcher animateSwitchingToItem:v13];
    }
    long long v14 = [v9 uuid];
    [(TabController *)self->_tabController setActiveTabUUID:v14];
  }
  return v11;
}

- (BOOL)_validateDismissalToPage:(id)a3
{
  BOOL v3 = [(TabSwitcherViewController *)self _tabGroupForPage:a3];
  id v4 = v3;
  if (v3)
  {
    if ([v3 isPrivateBrowsing])
    {
      BOOL v5 = +[Application sharedApplication];
      char v6 = [v5 isPrivateBrowsingLocked];

      char v7 = v6 ^ 1;
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)scrollToTabGroup:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 alloc];
  char v7 = [v5 uuid];

  id v9 = (id)[v6 initWithUUIDString:v7];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F78410]) initWithIdentifier:v9];
  [(SFTabSwitcher *)self->_tabSwitcher scrollToPage:v8];
}

- (WBTabGroup)visibleTabGroup
{
  BOOL v3 = [(SFTabSwitcher *)self->_tabSwitcher visiblePage];
  id v4 = [v3 identifier];

  if (v4)
  {
    id v5 = [(TabController *)self->_tabController tabGroupManager];
    id v6 = [v4 UUIDString];
    char v7 = [v5 tabGroupWithUUID:v6];
  }
  else
  {
    char v7 = 0;
  }

  return (WBTabGroup *)v7;
}

- (void)beginAnimatedSizeTransition
{
}

- (void)endAnimatedSizeTransition
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  tabSwitcher = self->_tabSwitcher;
  id v6 = a4;
  [(SFTabSwitcher *)tabSwitcher beginAnimatedSizeTransition];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__TabSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E6D7E960;
  void v7[4] = self;
  [v6 animateAlongsideTransition:0 completion:v7];
}

uint64_t __80__TabSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1008) endAnimatedSizeTransition];
}

- (BOOL)showsSidebarToggle
{
  return [(SFTabSwitcher *)self->_tabSwitcher showsSidebarToggle];
}

- (void)_selectTabWithUUID:(id)a3
{
  p_uuidOfTabBeingSelected = &self->_uuidOfTabBeingSelected;
  objc_storeStrong((id *)&self->_uuidOfTabBeingSelected, a3);
  id v7 = a3;
  [(TabController *)self->_tabController setActiveTabUUID:v7];
  id v6 = *p_uuidOfTabBeingSelected;
  *p_uuidOfTabBeingSelected = 0;
}

- (id)_tabForItem:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [v4 UUIDString];
  id v6 = [(TabSwitcherViewController *)self _tabWithUUID:v5];

  return v6;
}

- (id)_tabsForItems:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__TabSwitcherViewController__tabsForItems___block_invoke;
  v5[3] = &unk_1E6D7E988;
  v5[4] = self;
  BOOL v3 = objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", v5);
  return v3;
}

uint64_t __43__TabSwitcherViewController__tabsForItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _tabForItem:a2];
}

- (id)_tabWithUUID:(id)a3
{
  return [(TabController *)self->_tabController wbTabWithUUID:a3];
}

- (BOOL)becomeFirstResponder
{
  return [(SFTabSwitcher *)self->_tabSwitcher becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(SFTabSwitcher *)self->_tabSwitcher isVisible];
}

- (id)undoManager
{
  return [(TabController *)self->_tabController undoManager];
}

- (SFAnimationSettings)animationSettingsForCapsuleSelectionGesture
{
  return (SFAnimationSettings *)[MEMORY[0x1E4F781B0] quickTabSwitcherPan];
}

- (SFAnimationSettings)animationSettingsForCapsuleSelectionUpdate
{
  return (SFAnimationSettings *)[MEMORY[0x1E4F781B0] quickTabSwitcherUpdate];
}

- (BOOL)drivesCapsuleSelection
{
  return 1;
}

- (BOOL)isSendingTrailingAction
{
  return [(SFTabSwitcher *)self->_tabSwitcher isSelectingInteractivelyInsertedItem];
}

- (double)pageWidth
{
  [(SFTabSwitcher *)self->_tabSwitcher quickTabSwitcherPageWidth];
  return result;
}

- (void)animateSwitchingToItemAtIndex:(int64_t)a3
{
  id v5 = [(TabSwitcherViewController *)self capsuleIndexProvider];
  id v6 = [v5 tabAtCollectionViewIndex:a3];

  id v7 = [v6 wbTab];
  id v8 = [(TabSwitcherViewController *)self _itemForTab:v7];

  if (v8)
  {
    if (UIAccessibilityIsReduceMotionEnabled())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
      uint64_t v10 = [WeakRetained transitionViewForReducedMotion];

      BOOL v11 = (void *)MEMORY[0x1E4FB1EB0];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__TabSwitcherViewController_animateSwitchingToItemAtIndex___block_invoke;
      v15[3] = &unk_1E6D78980;
      v15[4] = self;
      id v16 = v6;
      id v17 = v10;
      id v12 = v10;
      [v11 transitionWithView:v12 duration:5242880 options:v15 animations:0 completion:0.25];
    }
    else
    {
      [(SFTabSwitcher *)self->_tabSwitcher animateSwitchingToItem:v8];
      long long v13 = [v6 wbTab];
      long long v14 = [v13 uuid];
      [(TabController *)self->_tabController setActiveTabUUID:v14];
    }
  }
}

void __59__TabSwitcherViewController_animateSwitchingToItemAtIndex___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__TabSwitcherViewController_animateSwitchingToItemAtIndex___block_invoke_2;
  v4[3] = &unk_1E6D78980;
  BOOL v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "safari_performWithoutRetargetingAnimations:", v4);
}

uint64_t __59__TabSwitcherViewController_animateSwitchingToItemAtIndex___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 40) wbTab];
  BOOL v3 = [v2 uuid];
  [*(id *)(*(void *)(a1 + 32) + 1088) setActiveTabUUID:v3];

  id v4 = *(void **)(a1 + 48);
  return [v4 layoutIfNeeded];
}

- (void)didReceiveLinkedPanGesture:(id)a3
{
}

- (CGRect)frameForItemLinkedToCapsuleAtIndex:(int64_t)a3
{
  id v5 = [(TabSwitcherViewController *)self capsuleIndexProvider];
  id v6 = [v5 tabAtCollectionViewIndex:a3];

  id v7 = [v6 uuid];
  if (v7)
  {
    [(SFTabSwitcher *)self->_tabSwitcher frameForLinkedPanningItemWithIdentifier:v7];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)willPresent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabCollectionViewWillPresent:self];
}

- (void)willDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabCollectionViewWillDismiss:self];
}

- (void)didPresent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabCollectionViewDidPresent:self];
}

- (void)didDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabCollectionViewDidDismiss:self];
}

- (void)didCancelDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained tabCollectionViewDidCancelDismissal:self];
  }
}

- (int64_t)itemDragContentType
{
  return 6;
}

- (NSArray)items
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)presentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (!-[TabSwitcherViewController _switchToItemToActivateAnimated:](self, "_switchToItemToActivateAnimated:"))
  {
    if (!self->_hasCompletedLaunch)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = __45__TabSwitcherViewController_presentAnimated___block_invoke;
      v8[3] = &unk_1E6D77E20;
      void v8[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v8);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__TabSwitcherViewController_presentAnimated___block_invoke_2;
    v7[3] = &unk_1E6D77E20;
    void v7[4] = self;
    uint64_t v5 = MEMORY[0x1E4E42950](v7);
    id v6 = (void *)v5;
    if (v3) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "safari_performWithoutRetargetingAnimations:", v5);
    }
  }
}

uint64_t __45__TabSwitcherViewController_presentAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyContent];
}

uint64_t __45__TabSwitcherViewController_presentAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1008) present];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  return [v2 becomeFirstResponder];
}

- (void)removePresentationObserver:(id)a3
{
}

- (void)test_scrollToTopWithoutAnimation
{
}

- (double)desiredSnapshotScale
{
  return 1.5;
}

- (unint64_t)snapshotBorderOptions
{
  if (tabSnapshotHasTransparentBorderPadding()) {
    return 15;
  }
  else {
    return 0;
  }
}

- (CGSize)snapshotSizeForSuggestedSize:(CGSize)result
{
  double v3 = fmax(result.height, result.width * 1.5) + 200.0;
  result.height = v3;
  return result;
}

- (BOOL)tabOverviewIsVisible
{
  return [(SFTabSwitcher *)self->_tabSwitcher tabOverviewIsVisible];
}

- (void)tabGroupManager:(id)a3 didUpdateTabGroupWithUUID:(id)a4
{
}

- (void)tabGroupManagerDidUpdateTabGroups:(id)a3
{
}

- (void)tabGroupManager:(id)a3 didUpdateProfileWithIdentifier:(id)a4 difference:(id)a5
{
}

- (void)tabGroupManagerDidUpdateProfiles:(id)a3
{
}

- (CollectionViewTabIndexProviding)capsuleIndexProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_capsuleIndexProvider);
  return (CollectionViewTabIndexProviding *)WeakRetained;
}

- (BOOL)defersActivation
{
  return self->_defersActivation;
}

- (void)setDefersActivation:(BOOL)a3
{
  self->_defersActivation = a3;
}

- (TabCollectionItem)itemToActivate
{
  return self->_itemToActivate;
}

- (void)setItemToActivate:(id)a3
{
}

- (TabSwitcherViewControllerContaining)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_container);
  return (TabSwitcherViewControllerContaining *)WeakRetained;
}

- (BOOL)dismissesOnUnlock
{
  return self->_dismissesOnUnlock;
}

- (TabController)tabController
{
  return self->_tabController;
}

- (SFTabSwitcher)tabSwitcher
{
  return self->_tabSwitcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOfTabBeingSelected, 0);
  objc_storeStrong((id *)&self->_tabController, 0);
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_itemToActivate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_capsuleIndexProvider);

  objc_storeStrong((id *)&self->_tabSwitcher, 0);
  objc_storeStrong((id *)&self->_presentationObservers, 0);
  objc_storeStrong((id *)&self->_lastSettledPage, 0);
  objc_storeStrong((id *)&self->_dropHandler, 0);
}

void __41__TabSwitcherViewController__makeContent__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v3 = a1;
  id v4 = [a2 privacyPreservingDescription];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_fault_impl(&dword_1E102C000, v3, OS_LOG_TYPE_FAULT, "Tab group has invalid UUID: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end