@interface SBHLibraryViewController
+ (id)_updateCategoryMap:(id)a3 withCategoryDataFrom:(id)a4;
- (BOOL)_canPerformDropForAnyItemInSession:(id)a3;
- (BOOL)_canPerformDropForDraggedIcon:(id)a3;
- (BOOL)_hiddenCategoriesDidChangeFromCurrentCategoryMap:(id)a3 toUpdatedCategoryMap:(id)a4;
- (BOOL)_shouldResetSearchBarTransformAndAlpha;
- (BOOL)_shouldUseReduceTransparencyBackgroundView;
- (BOOL)allowsBadging;
- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5;
- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6;
- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4;
- (BOOL)iconShouldAllowCloseBoxTap:(id)a3;
- (BOOL)iconShouldAllowTap:(id)a3;
- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4;
- (BOOL)iconView:(id)a3 editingModeGestureRecognizerDidFire:(id)a4;
- (BOOL)iconViewCanBecomeFocused:(id)a3;
- (BOOL)iconViewCanBeginDrags:(id)a3;
- (BOOL)iconViewDisplaysAccessories:(id)a3;
- (BOOL)iconViewDisplaysCloseBox:(id)a3;
- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4;
- (BOOL)isIconViewRecycled:(id)a3;
- (BOOL)isPresentingFolder;
- (BOOL)isPresentingIconLocation:(id)a3;
- (BOOL)isPresentingSearch;
- (BOOL)presentPodWithCategory:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)presentPodWithCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)shouldBeIndicatedInPageControl;
- (BOOL)shouldShowAddWidgetButtonWhenEditing;
- (BOOL)shouldShowDoneButtonWhenEditing;
- (BOOL)suppressesEditingStateForListViews;
- (BSEventQueue)transitionEventQueue;
- (Class)controllerClassForFolder:(id)a3;
- (NSArray)podTopLevelDisplayedIcons;
- (NSMutableArray)currentCollapseCompletions;
- (NSMutableArray)currentExpandCompletions;
- (NSSet)presentedIconLocations;
- (NSString)iconLocation;
- (SBFolderController)folderController;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHCredenzaSettings)credenzaSettings;
- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBHIconLibraryTableViewController)iconTableViewController;
- (SBHIconModel)iconModel;
- (SBHLibraryCategoryMap)libraryCategoryMap;
- (SBHLibraryCategoryMapProvider)categoryMapProvider;
- (SBHLibraryPodFolderController)podFolderViewController;
- (SBHLibrarySearchController)containerViewController;
- (SBHLibraryViewController)init;
- (SBHLibraryViewController)initWithCategoryMapProvider:(id)a3;
- (SBHLibraryViewControllerDelegate)behaviorDelegate;
- (SBHLibraryViewControllerPresenter)presenter;
- (SBHomeScreenIconTransitionAnimator)currentTransitionAnimator;
- (SBHomeScreenIconTransitionAnimatorDelegate)homeScreenIconTransitionAnimatorDelegate;
- (SBIconListLayoutProvider)listLayoutProvider;
- (SBIconViewDelegate)iconViewDelegate;
- (SBIconViewProviding)iconViewProvider;
- (SBRootFolder)categoriesRootFolder;
- (UIView)externalBackgroundView;
- (UIView)searchDimmingView;
- (UIViewController)barSwipeViewController;
- (_UILegibilitySettings)effectiveLegibilitySettings;
- (_UILegibilitySettings)legibilitySettings;
- (_UILegibilitySettings)overrideLegibilitySettings;
- (id)_additionalItemsIndicatorIconViewForFolderController:(id)a3;
- (id)_createIconViewControllerForCategoryIdentifier:(id)a3;
- (id)_customImageViewControllerForCategoryPodIconView:(id)a3 usingInternalCache:(BOOL)a4;
- (id)_destinationFolderIconViewForDragItem:(id)a3 folderRelativeIconIndexPath:(id *)a4;
- (id)_draggedItemIdentifiersInSession:(id)a3;
- (id)_hiddenCategoryIdentifierForCategoryMap:(id)a3;
- (id)_iconIdentifierForDragItem:(id)a3;
- (id)_iconLocationForCategoryIdentifier:(id)a3;
- (id)_iconViewControllerForCategoryIdentifier:(id)a3;
- (id)_wrappedCompletionBlockForNestedTransitionWithCompletion:(id)a3;
- (id)acquireLibrarySearchPrewarmAssertionForReason:(id)a3;
- (id)contentScrollView;
- (id)customImageViewControllerForIconView:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (id)draggingDelegateForIconView:(id)a3;
- (id)firstIconViewForIcon:(id)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4;
- (id)firstNonSuggestionsOrRecentsIconViewForIcon:(id)a3;
- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5;
- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6;
- (id)iconView:(id)a3 labelImageWithParameters:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5;
- (id)keyCommands;
- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6;
- (id)shortcutsDelegateForIconView:(id)a3;
- (int64_t)closeBoxTypeForIconView:(id)a3;
- (int64_t)iconViewComponentBackgroundViewTypeForIconView:(id)a3;
- (unint64_t)contentVisibility;
- (unint64_t)focusEffectTypeForIconView:(id)a3;
- (void)_addBarSwipeView;
- (void)_dismissDisplayedContextMenu;
- (void)_dismissExpandedPods:(BOOL)a3 completion:(id)a4;
- (void)_dismissLibraryViewControllerForReason:(id)a3 sessionIdentifier:(id)a4;
- (void)_dismissSearchIfNotInUseForReason:(id)a3 sessionIdentifier:(id)a4;
- (void)_enqueueAppLibraryUpdate;
- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4;
- (void)_enumerateAllViewControllersUsingBlock:(id)a3;
- (void)_enumerateObservers:(id)a3;
- (void)_expandPodAtIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_flushPendingLibraryCategoryMapUpdateIfNeeded;
- (void)_installCategoryMap:(id)a3;
- (void)_invalidateLibraryViewControllerDismissalTimer;
- (void)_notifyObserversDataSourceDidChange;
- (void)_notifyObserversDidDismiss;
- (void)_notifyObserversDidDismissFolderController:(id)a3;
- (void)_notifyObserversDidDismissSearchController:(id)a3;
- (void)_notifyObserversDidPresent;
- (void)_notifyObserversDidPresentSearchController:(id)a3;
- (void)_notifyObserversOfAcceptedDrop:(id)a3;
- (void)_notifyObserversOfAppLaunchOfIcon:(id)a3 fromLocation:(id)a4;
- (void)_notifyObserversWillDismiss;
- (void)_notifyObserversWillDismissFolderController:(id)a3;
- (void)_notifyObserversWillDismissSearchController:(id)a3;
- (void)_notifyObserversWillPresent;
- (void)_notifyObserversWillPresentFolderController:(id)a3;
- (void)_notifyObserversWillPresentSearchController:(id)a3;
- (void)_popExpandedPod;
- (void)_precacheIconViewControllersForCategories:(id)a3;
- (void)_scrollIconViewToVisible:(id)a3 animated:(BOOL)a4;
- (void)_setupIconTableViewController:(BOOL)a3;
- (void)_setupReducedTransparencyBackgroundViewIfNeeded;
- (void)_startAppLaunchResetTimer:(id)a3;
- (void)_startLibraryViewControllerDismissalTimer:(id)a3;
- (void)_teardownReducedTransparencyBackgroundView;
- (void)_updateCategoryIconBlurBackdropView;
- (void)_updateDragPreviewIconViewsForDropSession:(id)a3 inIconListView:(id)a4;
- (void)_updateEditingStateAnimated:(BOOL)a3;
- (void)_updateLibraryCategoryMap:(id)a3;
- (void)_updateReduceTransparency;
- (void)_updateViewControllerLegibility;
- (void)addObserver:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dealloc;
- (void)didDismissSearchController:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)dismissSearch;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateIconViewQueryableChildrenUsingBlock:(id)a3;
- (void)enumerateIconViewQueryableChildrenWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateViewControllersUsingBlock:(id)a3;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5;
- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5;
- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7;
- (void)folderControllerWillBeginScrolling:(id)a3;
- (void)forcedSearchTextFieldNoneditable:(BOOL)a3;
- (void)iconCloseBoxTapped:(id)a3;
- (void)iconModelDidLayout:(id)a3;
- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4;
- (void)iconViewWasDiscarded:(id)a3;
- (void)iconViewWasRecycled:(id)a3;
- (void)invalidateSearchControllerAppLaunchResetTimer;
- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4;
- (void)libraryCategoryMapProvider:(id)a3 categoryMapWasRefreshed:(unint64_t)a4 libraryCategoryMap:(id)a5;
- (void)libraryPodFolderController:(id)a3 willLayoutDisplayedCategories:(unint64_t)a4;
- (void)libraryPodFolderControllerRequestsDismissal:(id)a3;
- (void)libraryTableViewControllerDidAppear:(id)a3;
- (void)libraryTableViewControllerDidLaunchIcon:(id)a3;
- (void)libraryTableViewControllerWillDisappear:(id)a3;
- (void)loadView;
- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6;
- (void)noteIconViewWillZoomDown:(id)a3;
- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6;
- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4;
- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3;
- (void)popNestedViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)popPresentationState;
- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (void)recycleIconView:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAllowsBadging:(BOOL)a3;
- (void)setBadgeBehaviorProvider:(id)a3;
- (void)setBarSwipeViewController:(id)a3;
- (void)setBehaviorDelegate:(id)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setCredenzaSettings:(id)a3;
- (void)setCurrentCollapseCompletions:(id)a3;
- (void)setCurrentExpandCompletions:(id)a3;
- (void)setCurrentTransitionAnimator:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setExternalBackgroundView:(id)a3;
- (void)setHomeScreenIconTransitionAnimatorDelegate:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconLocation:(id)a3;
- (void)setIconModel:(id)a3;
- (void)setIconViewDelegate:(id)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverrideLegibilitySettings:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setSearchDimmingView:(id)a3;
- (void)setSuppressesEditingStateForListViews:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation SBHLibraryViewController

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__SBHLibraryViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
    v6[3] = &unk_1E6AB1528;
    id v7 = v4;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v6];
  }
}

- (void)enumerateIconViewQueryableChildrenWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v6 = (void (**)(id, SBHLibraryPodFolderController *, unint64_t, unsigned char *))a4;
  if ((a3 & 0x40) == 0)
  {
    if ((char v11 = 0, !self->_iconTableViewController)
      || (BOOL v7 = [(SBHLibrarySearchController *)self->_containerViewController isActive], (a3 & 3) != 0) && !v7
      || (v6[2](v6, (SBHLibraryPodFolderController *)self->_iconTableViewController, a3, &v11), (a3 & 3) == 0) && !v11)
    {
      v8 = [(SBNestingViewController *)self nestedViewController];
      v9 = v8;
      if (!v8
        || ([(SBHLibraryPodFolderController *)v8 bs_isDisappearingOrDisappeared] & 1) != 0
        || (v6[2](v6, v9, a3, &v11), (a3 & 3) == 0) && !v11)
      {
        podFolderViewController = self->_podFolderViewController;
        if (podFolderViewController) {
          v6[2](v6, podFolderViewController, a3, &v11);
        }
      }
    }
  }
}

uint64_t __66__SBHLibraryViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateDisplayedIconViewsUsingBlock:*(void *)(a1 + 32)];
}

- (void)enumerateIconViewQueryableChildrenUsingBlock:(id)a3
{
}

- (UIViewController)barSwipeViewController
{
  return self->_barSwipeViewController;
}

- (SBHLibraryViewControllerPresenter)presenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  return (SBHLibraryViewControllerPresenter *)WeakRetained;
}

- (void)viewWillLayoutSubviews
{
  v3 = [(UIViewController *)self->_barSwipeViewController viewIfLoaded];
  if (v3)
  {
    id v4 = [(SBHLibraryViewController *)self view];
    [v4 bringSubviewToFront:v3];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryViewController;
  [(SBHLibraryViewController *)&v5 viewWillLayoutSubviews];
}

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 icon];
  if ([v5 isAdditionalItemsIndicatorIcon] && !UIAccessibilityIsReduceMotionEnabled())
  {
    if ([(NSMapTable *)self->_presentedFolderControllers count])
    {
    }
    else
    {
      NSUInteger v9 = [(NSMapTable *)self->_dismissingFolderControllers count];

      if (!v9) {
        goto LABEL_4;
      }
    }
    v6 = [v4 icon];
    v10 = [v6 category];
    char v11 = [v10 categoryIdentifier];

    v12 = [(NSMapTable *)self->_presentedFolderControllers keyEnumerator];
    v13 = [v12 allObjects];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke;
    v27[3] = &unk_1E6AB2768;
    id v14 = v11;
    id v28 = v14;
    v15 = objc_msgSend(v13, "bs_filter:", v27);
    uint64_t v16 = [v15 count];

    if (v16)
    {

      char v7 = 0;
      goto LABEL_5;
    }
    v17 = [(NSMapTable *)self->_dismissingFolderControllers keyEnumerator];
    v18 = [v17 allObjects];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke_2;
    v25 = &unk_1E6AB2768;
    id v26 = v14;
    id v19 = v14;
    v20 = objc_msgSend(v18, "bs_filter:", &v22);
    uint64_t v21 = objc_msgSend(v20, "count", v22, v23, v24, v25);

    if (v21)
    {
      char v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
LABEL_4:
  v6 = [(SBHLibraryViewController *)self iconViewDelegate];
  char v7 = [v6 iconViewDisplaysAccessories:v4];
LABEL_5:

LABEL_6:
  return v7;
}

- (SBIconViewDelegate)iconViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewDelegate);
  return (SBIconViewDelegate *)WeakRetained;
}

- (SBHLibraryCategoryMapProvider)categoryMapProvider
{
  return self->_categoryMapProvider;
}

- (BOOL)shouldBeIndicatedInPageControl
{
  return 0;
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  if ([(SBHLibraryViewController *)self isPresentingSearch])
  {
    [(SBHLibraryViewController *)self dismissSearch];
  }
}

- (BOOL)isPresentingSearch
{
  BOOL v3 = [(SBHLibrarySearchController *)self->_containerViewController isActive];
  if (v3) {
    LOBYTE(v3) = self->_iconTableViewController != 0;
  }
  return v3;
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryViewController;
  [(SBHLibraryViewController *)&v6 viewDidLayoutSubviews];
  reducedTransparencyBackgroundView = self->_reducedTransparencyBackgroundView;
  if (reducedTransparencyBackgroundView)
  {
    id v4 = [(SBFolderControllerBackgroundView *)self->_reducedTransparencyBackgroundView superview];
    [v4 bounds];
    -[SBFolderControllerBackgroundView setFrame:](reducedTransparencyBackgroundView, "setFrame:");

    objc_super v5 = [(SBHLibraryViewController *)self view];
    [v5 sendSubviewToBack:self->_reducedTransparencyBackgroundView];
  }
}

- (SBHLibraryViewController)initWithCategoryMapProvider:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHLibraryViewController;
  objc_super v6 = [(SBNestingViewController *)&v13 initWithNibName:0 bundle:0];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_categoryMapProvider, a3);
    v7->_contentVisibility = 0;
    objc_storeStrong((id *)&v7->_iconLocation, @"SBIconLocationAppLibrary");
    id v8 = objc_alloc(MEMORY[0x1E4F4F740]);
    uint64_t v9 = [v8 initWithName:@"com.apple.SpringBoardHome.libraryViewController.transitions" onQueue:MEMORY[0x1E4F14428]];
    transitionEventQueue = v7->_transitionEventQueue;
    v7->_transitionEventQueue = (BSEventQueue *)v9;

    char v11 = +[PTDomain rootSettings];
    objc_storeWeak((id *)&v7->_credenzaSettings, v11);

    [(SBHLibraryViewController *)v7 _setupIconTableViewController:0];
  }

  return v7;
}

- (SBHLibraryViewController)init
{
  return [(SBHLibraryViewController *)self initWithCategoryMapProvider:0];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"SBIconModelDidLayoutIconStateNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryViewController;
  [(SBHLibraryViewController *)&v4 dealloc];
}

- (void)iconModelDidLayout:(id)a3
{
  objc_super v4 = [a3 object];
  id v5 = [(SBHLibraryViewController *)self iconModel];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__SBHLibraryViewController_iconModelDidLayout___block_invoke;
    v7[3] = &unk_1E6AB2590;
    id v8 = v4;
    [(SBHLibraryViewController *)self _enumerateAllViewControllersUsingBlock:v7];
    [(SBHLibraryViewController *)self _setupIconTableViewController:[(SBHLibraryViewController *)self isViewLoaded]];
  }
}

void __47__SBHLibraryViewController_iconModelDidLayout___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [*(id *)(a1 + 32) rootFolder];
    [v4 setRootFolder:v3];
  }
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)SBHLibraryViewController;
  [(SBHLibraryViewController *)&v13 loadView];
  BOOL v3 = [(SBHLibraryViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA5F10]), "initWithFrame:", v5, v7, v9, v11);
  [v12 setFocusGroupIdentifier:@"AppLibrary"];
  [(SBHLibraryViewController *)self setView:v12];
  [(SBHLibraryViewController *)self _setupIconTableViewController:0];
  [(SBNestingViewController *)self setDelegate:self];
  [(SBHLibraryViewController *)self _setupReducedTransparencyBackgroundViewIfNeeded];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryViewController;
  [(SBHLibraryViewController *)&v5 viewDidLoad];
  BOOL v3 = [(SBHLibraryViewController *)self view];
  [v3 _setIgnoreBackdropViewsWhenHiding:1];
  double v4 = [MEMORY[0x1E4FB1618] labelColor];
  [v3 setTintColor:v4];

  [(SBHLibraryViewController *)self _addBarSwipeView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  [(SBHLibraryViewController *)self invalidateSearchControllerAppLaunchResetTimer];
  if (!self->_libraryCategoryMap) {
    [(SBHLibraryViewController *)self _enqueueAppLibraryUpdate];
  }
  [(SBHLibrarySearchController *)self->_containerViewController resetSearchController:v3 clearSearchResults:1 resetSearchBarTransformAndAlpha:[(SBHLibraryViewController *)self _shouldResetSearchBarTransformAndAlpha]];
  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__updateReduceTransparency name:*MEMORY[0x1E4FB24A8] object:0];

  [(SBHLibrarySearchController *)self->_containerViewController beginAppearanceTransition:1 animated:v3];
  double v6 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)double v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v7, 2u);
  }

  [(SBHLibraryViewController *)self _notifyObserversWillPresent];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryViewController;
  [(SBNestingViewController *)&v6 viewDidAppear:a3];
  [(SBHLibrarySearchController *)self->_containerViewController endAppearanceTransition];
  double v4 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  [(SBHLibraryViewController *)self _notifyObserversDidPresent];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  [(SBHLibrarySearchController *)self->_containerViewController beginAppearanceTransition:0 animated:v3];
  objc_super v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)objc_super v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  [(SBHLibraryViewController *)self _notifyObserversWillDismiss];
  [(SBHLibraryViewController *)self _dismissDisplayedContextMenu];
}

- (void)_dismissDisplayedContextMenu
{
  BOOL v3 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      objc_super v6 = v5;
    }
    else {
      objc_super v6 = 0;
    }
  }
  else
  {
    objc_super v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    [v7 dismissDisplayedContextMenu];
  }
  else {
    [(SBHLibraryViewController *)self enumerateDisplayedIconViewsUsingBlock:&__block_literal_global_54];
  }
}

void __56__SBHLibraryViewController__dismissDisplayedContextMenu__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  if ([v4 isShowingContextMenu])
  {
    [v4 dismissContextMenuWithCompletion:0];
    *a3 = 1;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController viewDidDisappear:](&v9, sel_viewDidDisappear_);
  [(SBHLibrarySearchController *)self->_containerViewController endAppearanceTransition];
  id v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)objc_super v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  [(SBHLibrarySearchController *)self->_containerViewController resetSearchController:v3 clearSearchResults:1 resetSearchBarTransformAndAlpha:[(SBHLibraryViewController *)self _shouldResetSearchBarTransformAndAlpha]];
  [(SBHLibraryViewController *)self _flushPendingLibraryCategoryMapUpdateIfNeeded];
  id v6 = [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider requestLibraryCategoryMapRefreshWithOptions:2 reason:@"SBHLibraryViewController reload proactive categories after disappear request"];
  [(SBHLibraryViewController *)self _notifyObserversDidDismiss];
  [(SBHLibraryViewController *)self _invalidateLibraryViewControllerDismissalTimer];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  [(SBHLibraryViewController *)self _teardownReducedTransparencyBackgroundView];
}

- (BOOL)_shouldResetSearchBarTransformAndAlpha
{
  return ![(SBHLibraryViewController *)self isPresentingFolder];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryViewController;
  [(SBHLibraryViewController *)&v10 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  id v7 = [(SBHLibraryViewController *)self externalBackgroundView];
  objc_super v8 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_super v9 = [MEMORY[0x1E4FA5E88] matchMoveAnimationForPinningToView:v6];
      [v8 addAnimation:v9 forKey:@"SBHLibraryExternalBackgroundMatchMoveKey"];
    }
    else
    {
      objc_super v9 = [v7 layer];
      [v9 removeAnimationForKey:@"SBHLibraryExternalBackgroundMatchMoveKey"];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryViewController;
  id v7 = a4;
  -[SBHLibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_super v8 = [(SBHLibraryViewController *)self externalBackgroundView];
  objc_super v9 = [v8 layer];

  objc_super v10 = [v9 animationForKey:@"SBHLibraryExternalBackgroundMatchMoveKey"];
  [v9 removeAnimationForKey:@"SBHLibraryExternalBackgroundMatchMoveKey"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__SBHLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E6AB25B8;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [v7 animateAlongsideTransition:0 completion:v13];
}

uint64_t __79__SBHLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addAnimation:*(void *)(a1 + 40) forKey:@"SBHLibraryExternalBackgroundMatchMoveKey"];
}

- (id)contentScrollView
{
  BOOL v3 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
  BOOL v4 = [v3 contentScrollView];

  if (v4)
  {
    id v5 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
    id v6 = [v5 contentScrollView];
  }
  else
  {
    id v6 = [(SBHLibrarySearchController *)self->_containerViewController contentScrollView];
  }
  return v6;
}

- (id)keyCommands
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryViewController;
  v2 = [(SBHLibraryViewController *)&v7 keyCommands];
  uint64_t v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel__popExpandedPod];
  BOOL v4 = (void *)v3;
  if (v2)
  {
    id v5 = [v2 arrayByAddingObject:v3];
  }
  else
  {
    v8[0] = v3;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }

  return v5;
}

- (void)setBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_behaviorDelegate, a3);
  shouldUseReduceTransparencyBackgroundView = self->_shouldUseReduceTransparencyBackgroundView;
  self->_shouldUseReduceTransparencyBackgroundView = 0;
}

- (void)_dismissExpandedPods:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  objc_super v7 = (void (**)(id, void))a4;
  id v6 = [(SBNestingViewController *)self deepestNestedDescendantViewController];

  if (v6)
  {
    [(SBHLibraryViewController *)self popNestedViewControllerAnimated:v4 withCompletion:v7];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

- (void)_expandPodAtIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  objc_super v8 = (void (**)(id, void))a5;
  objc_super v9 = [(SBHLibraryCategoryMap *)self->_libraryCategoryMap categoryIdentifiers];
  objc_super v10 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
  if (v10 || [(SBHLibraryViewController *)self isPresentingSearch])
  {

    goto LABEL_4;
  }
  if (![v9 count])
  {
LABEL_4:
    if (v8) {
      v8[2](v8, 0);
    }
    goto LABEL_6;
  }
  id v11 = [(SBFolderController *)self->_podFolderViewController folder];
  id v12 = [v11 icons];
  objc_super v13 = [v12 objectAtIndex:a3];

  id v14 = [v13 category];
  if (v8)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__SBHLibraryViewController__expandPodAtIndex_animated_completion___block_invoke;
    v15[3] = &unk_1E6AAD560;
    objc_super v16 = v8;
    [(SBHLibraryViewController *)self presentPodWithCategory:v14 animated:v5 completion:v15];
  }
  else
  {
    [(SBHLibraryViewController *)self presentPodWithCategory:v14 animated:v5 completion:0];
  }

LABEL_6:
}

uint64_t __66__SBHLibraryViewController__expandPodAtIndex_animated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSearchDimmingView:(id)a3
{
}

- (UIView)searchDimmingView
{
  return [(SBHLibrarySearchController *)self->_containerViewController searchDimmingView];
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBHLibraryViewController *)self _updateViewControllerLegibility];
  }
}

- (void)setIconModel:(id)a3
{
  id v5 = a3;
  p_iconModel = &self->_iconModel;
  if (([v5 isEqual:self->_iconModel] & 1) == 0)
  {
    objc_super v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:@"SBIconModelDidLayoutIconStateNotification" object:*p_iconModel];
    objc_storeStrong((id *)&self->_iconModel, a3);
    categoriesFolder = self->_categoriesFolder;
    if (categoriesFolder)
    {
      [(SBRootFolder *)categoriesFolder setDelegate:0];
      objc_super v9 = self->_categoriesFolder;
      self->_categoriesFolder = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__SBHLibraryViewController_setIconModel___block_invoke;
    v10[3] = &unk_1E6AB2590;
    v10[4] = self;
    [(SBHLibraryViewController *)self _enumerateAllViewControllersUsingBlock:v10];
    [(SBHLibraryViewController *)self _setupIconTableViewController:[(SBHLibraryViewController *)self isViewLoaded]];
    [v7 addObserver:self selector:sel_iconModelDidLayout_ name:@"SBIconModelDidLayoutIconStateNotification" object:*p_iconModel];
  }
}

void __41__SBHLibraryViewController_setIconModel___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1168);
  id v3 = a2;
  id v4 = [v2 rootFolder];
  [v3 setRootFolder:v4];
}

- (void)setIconViewProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_iconViewProvider, obj);
    [(SBHLibraryViewController *)self _setupIconTableViewController:[(SBHLibraryViewController *)self isViewLoaded]];
    id v5 = obj;
  }
}

- (void)setIconImageCache:(id)a3
{
  id v5 = a3;
  if (([(SBHIconImageCache *)self->_iconImageCache isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    folderIconImageCache = self->_folderIconImageCache;
    self->_folderIconImageCache = 0;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__SBHLibraryViewController_setIconImageCache___block_invoke;
    v7[3] = &unk_1E6AB2590;
    id v8 = v5;
    [(SBHLibraryViewController *)self _enumerateAllViewControllersUsingBlock:v7];
    [(SBHLibraryViewController *)self _setupIconTableViewController:[(SBHLibraryViewController *)self isViewLoaded]];
  }
}

uint64_t __46__SBHLibraryViewController_setIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIconImageCache:*(void *)(a1 + 32)];
}

- (void)setListLayoutProvider:(id)a3
{
  id v5 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v5)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    [(SBHLibrarySearchController *)self->_containerViewController setListLayoutProvider:v5];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__SBHLibraryViewController_setListLayoutProvider___block_invoke;
    v6[3] = &unk_1E6AB2590;
    objc_super v7 = v5;
    [(SBHLibraryViewController *)self _enumerateAllViewControllersUsingBlock:v6];
    [(SBHLibraryViewController *)self _setupIconTableViewController:[(SBHLibraryViewController *)self isViewLoaded]];
  }
}

uint64_t __50__SBHLibraryViewController_setListLayoutProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setListLayoutProvider:*(void *)(a1 + 32)];
}

- (SBFolderController)folderController
{
  return (SBFolderController *)self->_podFolderViewController;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  if (!self->_folderIconImageCache)
  {
    id v3 = [(SBHLibraryViewController *)self iconImageCache];

    if (v3)
    {
      id v4 = [(SBHLibraryViewController *)self listLayoutProvider];
      id v5 = [v4 layoutForIconLocation:@"SBIconLocationAppLibraryCategoryPodAdditionalItems"];

      if (v5)
      {
        id v6 = [SBFolderIconImageCache alloc];
        objc_super v7 = [(SBHLibraryViewController *)self iconImageCache];
        id v8 = [(SBFolderIconImageCache *)v6 initWithListLayout:v5 iconImageCache:v7];
        folderIconImageCache = self->_folderIconImageCache;
        self->_folderIconImageCache = v8;

        objc_super v10 = [(SBFolderIconImageCache *)self->_folderIconImageCache sharedCache];
        [v10 setMiniGridImageLoadingAsynchronous:1];
      }
    }
  }
  id v11 = self->_folderIconImageCache;
  return v11;
}

- (void)dismissSearch
{
}

- (void)popPresentationState
{
  [(SBHLibraryViewController *)self enumerateDisplayedIconViewsUsingBlock:&__block_literal_global_72_1];
  if ([(SBHLibraryViewController *)self isPresentingFolder])
  {
    [(SBHLibraryViewController *)self popNestedViewControllerAnimated:1 withCompletion:0];
  }
  else if ([(SBHLibraryViewController *)self isPresentingSearch])
  {
    [(SBHLibraryViewController *)self dismissSearch];
  }
  else
  {
    id v3 = [(SBHLibraryViewController *)self behaviorDelegate];
    [v3 libraryViewControllerRequestsDismissal:self];
  }
}

void __48__SBHLibraryViewController_popPresentationState__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v4 = a2;
  if ([v4 isShowingContextMenu])
  {
    [v4 dismissContextMenuWithCompletion:0];
    *a3 = 1;
  }
}

- (void)noteIconViewWillZoomDown:(id)a3
{
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  -[SBFolderController layoutIconListsWithAnimationType:forceRelayout:](self->_podFolderViewController, "layoutIconListsWithAnimationType:forceRelayout:");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  objc_super v7 = [(SBNestingViewController *)self nestedViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_opt_class();
        id v12 = SBFSafeCast();
        [v12 layoutIconListsWithAnimationType:a3 forceRelayout:v4];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setBarSwipeViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  if (self->_barSwipeViewController != v5)
  {
    objc_super v7 = v5;
    -[SBHLibraryViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    objc_storeStrong((id *)&self->_barSwipeViewController, a3);
    int v6 = [(SBHLibraryViewController *)self isViewLoaded];
    id v5 = v7;
    if (v6)
    {
      [(SBHLibraryViewController *)self _addBarSwipeView];
      id v5 = v7;
    }
  }
}

- (void)_addBarSwipeView
{
  barSwipeViewController = self->_barSwipeViewController;
  if (barSwipeViewController)
  {
    BOOL v4 = barSwipeViewController;
    [(SBHLibraryViewController *)self bs_addChildViewController:v4];
    id v6 = [(UIViewController *)v4 view];

    id v5 = [(SBHLibraryViewController *)self view];
    [v5 bounds];
    objc_msgSend(v6, "setFrame:");

    [v6 setAutoresizingMask:18];
  }
}

- (void)setExternalBackgroundView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalBackgroundView);
  if (WeakRetained != obj)
  {
    id v5 = [WeakRetained layer];
    [v5 removeAnimationForKey:@"SBHLibraryExternalBackgroundMatchMoveKey"];

    objc_storeWeak((id *)&self->_externalBackgroundView, obj);
    id v6 = [(SBHLibraryViewController *)self viewIfLoaded];
    objc_super v7 = [v6 window];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4FA5E88] matchMoveAnimationForPinningToView:v7];
      [obj addAnimation:v8 forKey:@"SBHLibraryExternalBackgroundMatchMoveKey"];
    }
  }
}

- (void)setAllowsBadging:(BOOL)a3
{
  if (self->_allowsBadging != a3)
  {
    self->_allowsBadging = a3;
    -[SBHLibraryCategoriesRootFolder setSupportsBadging:](self->_categoriesFolder, "setSupportsBadging:");
  }
}

- (void)setBadgeBehaviorProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_badgeBehaviorProvider, obj);
    [(SBFolder *)self->_categoriesFolder setBadgeBehaviorProvider:obj];
  }
}

- (BOOL)presentPodWithCategory:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void (**)(void, void))v9;
  if (v8)
  {
    uint64_t v11 = [v8 additionalItemsIndicatorIcon];
    id v12 = [v8 categoryIdentifier];
    long long v13 = [(SBHLibraryViewController *)self _iconLocationForCategoryIdentifier:v12];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke;
    aBlock[3] = &unk_1E6AB25E0;
    aBlock[4] = self;
    id v14 = v11;
    id v33 = v14;
    id v15 = v13;
    id v34 = v15;
    BOOL v36 = v6;
    id v16 = v10;
    id v35 = v16;
    v17 = (void (**)(void))_Block_copy(aBlock);
    if (![(SBHLibraryViewController *)self isPresentingFolder])
    {
      v17[2](v17);
LABEL_20:

      goto LABEL_21;
    }
    id v29 = v14;
    uint64_t v18 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
    uint64_t v19 = objc_opt_class();
    id v20 = v18;
    id v28 = v15;
    if (v19)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    id v23 = v21;

    v24 = [v23 folder];

    if ([v24 isLibraryCategoryFolder])
    {
      v25 = [v24 libraryCategoryIdentifier];
    }
    else
    {
      v25 = 0;
    }
    id v15 = v28;
    if (objc_msgSend(v25, "isEqual:", v12, v28))
    {
      if (!v16)
      {
LABEL_19:

        id v14 = v29;
        goto LABEL_20;
      }
      id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHLibraryPresentationErrorDomain" code:9 userInfo:MEMORY[0x1E4F1CC08]];
      (*((void (**)(id, void *))v16 + 2))(v16, v26);
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_3;
      v30[3] = &unk_1E6AADF78;
      v31 = v17;
      [(SBHLibraryViewController *)self popNestedViewControllerAnimated:v6 withCompletion:v30];
      id v26 = v31;
    }

    goto LABEL_19;
  }
  if (v9)
  {
    uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHLibraryPresentationErrorDomain" code:4 userInfo:MEMORY[0x1E4F1CC08]];
    ((void (**)(void, void *))v10)[2](v10, v22);
  }
LABEL_21:

  return v8 != 0;
}

void __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) podFolderViewController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_2;
  v6[3] = &unk_1E6AADF78;
  id v7 = *(id *)(a1 + 56);
  [v2 pushFolderIcon:v3 location:v4 animated:v5 completion:v6];
}

void __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (a2)
    {
      uint64_t v3 = *(void (**)(uint64_t, void))(v2 + 16);
      uint64_t v4 = *(void *)(a1 + 32);
      v3(v4, 0);
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SBHLibraryPresentationErrorDomain" code:8 userInfo:MEMORY[0x1E4F1CC08]];
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
    }
  }
}

uint64_t __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)presentPodWithCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = [a3 integerValue];
  uint64_t v10 = [(SBFolderController *)self->_podFolderViewController folder];
  uint64_t v11 = [v10 icons];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__SBHLibraryViewController_presentPodWithCategoryIdentifier_animated_completion___block_invoke;
  v15[3] = &__block_descriptor_40_e16_B16__0__SBIcon_8l;
  void v15[4] = v9;
  id v12 = objc_msgSend(v11, "bs_firstObjectPassingTest:", v15);

  long long v13 = [v12 category];
  LOBYTE(v5) = [(SBHLibraryViewController *)self presentPodWithCategory:v13 animated:v5 completion:v8];

  return v5;
}

BOOL __81__SBHLibraryViewController_presentPodWithCategoryIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isCategoryIcon]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  BOOL v5 = [v4 category];
  BOOL v6 = [v5 categoryIdentifier];
  uint64_t v7 = [v6 predictionCategoryID];

  BOOL v8 = v7 == *(void *)(a1 + 32);
  return v8;
}

- (void)forcedSearchTextFieldNoneditable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBHLibraryViewController *)self containerViewController];
  [v4 setForcedSearchTextFieldNoneditable:!v3];
}

- (void)setPresenter:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presenter, obj);
    [(SBHLibraryViewController *)self _updateCategoryIconBlurBackdropView];
    BOOL v5 = obj;
  }
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (SBHIconImageAppearance *)[v6 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    [(SBFolderController *)self->_podFolderViewController setOverrideIconImageAppearance:v6];
  }
}

- (SBRootFolder)categoriesRootFolder
{
  uint64_t v2 = [(SBHLibraryPodFolderController *)self->_podFolderViewController dataSource];
  BOOL v3 = [v2 categoriesFolder];

  return (SBRootFolder *)v3;
}

- (void)setOverrideLegibilitySettings:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_overrideLegibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideLegibilitySettings, a3);
    [(SBHLibraryViewController *)self _updateViewControllerLegibility];
  }
}

- (_UILegibilitySettings)effectiveLegibilitySettings
{
  overrideLegibilitySettings = self->_overrideLegibilitySettings;
  if (!overrideLegibilitySettings) {
    overrideLegibilitySettings = self->_legibilitySettings;
  }
  return overrideLegibilitySettings;
}

- (NSArray)podTopLevelDisplayedIcons
{
  uint64_t v2 = [(SBHLibraryViewController *)self categoriesRootFolder];
  BOOL v3 = [v2 firstList];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __53__SBHLibraryViewController_podTopLevelDisplayedIcons__block_invoke;
  v8[3] = &unk_1E6AB1F68;
  id v9 = v4;
  id v5 = v4;
  [v3 enumerateIconsUsingBlock:v8];
  id v6 = [v5 array];

  return (NSArray *)v6;
}

void __53__SBHLibraryViewController_podTopLevelDisplayedIcons__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  int v3 = [v12 isCategoryIcon];
  id v4 = v12;
  if (v3)
  {
    id v5 = [v12 category];
    id v6 = [v5 compactPodFolder];
    uint64_t v7 = v6;
    if (v6)
    {
      BOOL v8 = [v6 iconsPassingTest:&__block_literal_global_79];
      [*(id *)(a1 + 32) unionSet:v8];
    }
    id v9 = [v5 compactPodAdditionalItemsFolder];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 allIcons];
      [*(id *)(a1 + 32) unionSet:v11];
    }
    id v4 = v12;
  }
}

uint64_t __53__SBHLibraryViewController_podTopLevelDisplayedIcons__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isApplicationIcon];
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self presentedIconLocations];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)presentedIconLocations
{
  int v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__SBHLibraryViewController_presentedIconLocations__block_invoke;
  v6[3] = &unk_1E6AB2628;
  id v4 = v3;
  id v7 = v4;
  [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v6];

  return (NSSet *)v4;
}

void __50__SBHLibraryViewController_presentedIconLocations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 presentedIconLocations];
  [v2 unionSet:v3];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return [(SBHLibraryViewController *)self iconViewForIcon:a3 location:a4 options:0];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  id v11 = 0;
  if (v8 && v9)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__15;
    uint64_t v21 = __Block_byref_object_dispose__15;
    id v22 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__SBHLibraryViewController_iconViewForIcon_location_options___block_invoke;
    v13[3] = &unk_1E6AB2650;
    id v14 = v8;
    id v15 = v10;
    id v16 = &v17;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenWithOptions:a5 usingBlock:v13];
    id v11 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

void __61__SBHLibraryViewController_iconViewForIcon_location_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = SBIconViewQueryingIconViewForIconInLocation(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), a3);
  if (v6) {
    *a4 = 1;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__15;
    uint64_t v19 = __Block_byref_object_dispose__15;
    id v20 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__SBHLibraryViewController_firstIconViewForIcon_inLocations___block_invoke;
    v11[3] = &unk_1E6AB2650;
    id v12 = v6;
    id v13 = v8;
    id v14 = &v15;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v11];
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

void __61__SBHLibraryViewController_firstIconViewForIcon_inLocations___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 firstIconViewForIcon:a1[4] inLocations:a1[5]];
  if (v6) {
    *a4 = 1;
  }
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__15;
    uint64_t v15 = __Block_byref_object_dispose__15;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __49__SBHLibraryViewController_firstIconViewForIcon___block_invoke;
    v8[3] = &unk_1E6AB2678;
    id v9 = v4;
    uint64_t v10 = &v11;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __49__SBHLibraryViewController_firstIconViewForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 firstIconViewForIcon:*(void *)(a1 + 32)];
  if (v6) {
    *a4 = 1;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)firstNonSuggestionsOrRecentsIconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__15;
    uint64_t v15 = __Block_byref_object_dispose__15;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __72__SBHLibraryViewController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke;
    v8[3] = &unk_1E6AB2650;
    void v8[4] = self;
    id v9 = v4;
    uint64_t v10 = &v11;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v8];
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __72__SBHLibraryViewController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = a1[5];
  id v11 = v6;
  if (*(id *)(a1[4] + 1344) != v6)
  {
    uint64_t v8 = [v6 firstIconViewForIcon:v7];
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v8 = [v6 firstNonSuggestionsOrRecentsIconViewForIcon:v7];
  if (v8) {
LABEL_3:
  }
    *a4 = 1;
LABEL_4:
  uint64_t v9 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return [(SBHLibraryViewController *)self isDisplayingIcon:a3 inLocation:a4 options:0];
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  BOOL v11 = 0;
  if (v8 && v9)
  {
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__SBHLibraryViewController_isDisplayingIcon_inLocation_options___block_invoke;
    v13[3] = &unk_1E6AB2650;
    id v14 = v8;
    id v15 = v10;
    id v16 = &v17;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenWithOptions:a5 usingBlock:v13];
    BOOL v11 = *((unsigned char *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

uint64_t __64__SBHLibraryViewController_isDisplayingIcon_inLocation_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = SBIconViewQueryingDisplayingIconInLocation(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), a3);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__SBHLibraryViewController_isDisplayingIcon_inLocations___block_invoke;
    v11[3] = &unk_1E6AB2650;
    id v12 = v6;
    id v13 = v8;
    id v14 = &v15;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v11];
    BOOL v9 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

uint64_t __57__SBHLibraryViewController_isDisplayingIcon_inLocations___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isDisplayingIcon:a1[4] inLocations:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __45__SBHLibraryViewController_isDisplayingIcon___block_invoke;
    v8[3] = &unk_1E6AB2678;
    id v9 = v4;
    uint64_t v10 = &v11;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __45__SBHLibraryViewController_isDisplayingIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isDisplayingIcon:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __49__SBHLibraryViewController_isDisplayingIconView___block_invoke;
    v8[3] = &unk_1E6AB2678;
    id v9 = v4;
    uint64_t v10 = &v11;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v8];
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __49__SBHLibraryViewController_isDisplayingIconView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isDisplayingIconView:*(void *)(a1 + 32)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__SBHLibraryViewController_isDisplayingIconView_inLocation___block_invoke;
    v11[3] = &unk_1E6AB2650;
    id v12 = v6;
    id v13 = v8;
    char v14 = &v15;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v11];
    BOOL v9 = *((unsigned char *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

uint64_t __60__SBHLibraryViewController_isDisplayingIconView_inLocation___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isDisplayingIconView:a1[4] inLocation:a1[5]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__SBHLibraryViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke;
    v9[3] = &unk_1E6AB26A0;
    id v10 = v6;
    id v11 = v8;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenUsingBlock:v9];
  }
}

uint64_t __74__SBHLibraryViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 enumerateDisplayedIconViewsForIcon:*(void *)(a1 + 32) usingBlock:*(void *)(a1 + 40)];
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && [v7 count])
  {
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    char v18 = __Block_byref_object_copy__15;
    uint64_t v19 = __Block_byref_object_dispose__15;
    id v20 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__SBHLibraryViewController_firstIconViewForIcon_excludingLocations___block_invoke;
    v11[3] = &unk_1E6AB2650;
    id v12 = v6;
    id v13 = v8;
    char v14 = &v15;
    [(SBHLibraryViewController *)self enumerateIconViewQueryableChildrenWithOptions:1 usingBlock:v11];
    id v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __68__SBHLibraryViewController_firstIconViewForIcon_excludingLocations___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 firstIconViewForIcon:a1[4] excludingLocations:a1[5]];
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v6);
    id v6 = v7;
    *a4 = 1;
  }
}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__15;
  uint64_t v21 = __Block_byref_object_dispose__15;
  id v22 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke;
  v14[3] = &unk_1E6AB26C8;
  id v16 = &v17;
  id v15 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke_2;
  v11[3] = &unk_1E6AB26F0;
  id v13 = &v17;
  id v8 = v15;
  id v12 = v8;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v14, v11);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

BOOL __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = [a2 firstIconViewForIcon:*(void *)(a1 + 32) options:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

BOOL __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstIconViewForIcon:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke;
  v13[3] = &unk_1E6AB26C8;
  id v15 = &v16;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke_2;
  v10[3] = &unk_1E6AB26F0;
  id v12 = &v16;
  id v8 = v14;
  id v11 = v8;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v13, v10);
  LOBYTE(a4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return a4;
}

uint64_t __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIcon:*(void *)(a1 + 32) options:a3];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIcon:*(void *)(a1 + 32)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke;
  v13[3] = &unk_1E6AB26C8;
  id v15 = &v16;
  id v14 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke_2;
  v10[3] = &unk_1E6AB26F0;
  id v12 = &v16;
  id v8 = v14;
  id v11 = v8;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v13, v10);
  LOBYTE(a4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return a4;
}

uint64_t __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIconView:*(void *)(a1 + 32) options:a3];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

uint64_t __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke_2(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 isDisplayingIconView:*(void *)(a1 + 32)];
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  uint64_t v5 = [WeakRetained dequeueReusableIconViewOfClass:a3];

  return v5;
}

- (void)recycleIconView:(id)a3
{
  p_iconViewProvider = &self->_iconViewProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_iconViewProvider);
  [WeakRetained recycleIconView:v4];
}

- (BOOL)isIconViewRecycled:(id)a3
{
  p_iconViewProvider = &self->_iconViewProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_iconViewProvider);
  char v6 = [WeakRetained isIconViewRecycled:v4];

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v7 setDelegate:self];
  if (([v6 isCategoryIcon] & 1) == 0
    && ([v6 isFolderIcon] & 1) == 0
    && ([v6 isAdditionalItemsIndicatorIcon] & 1) == 0)
  {
    [v7 setIconContentScalingEnabled:1];
  }
}

- (void)libraryPodFolderController:(id)a3 willLayoutDisplayedCategories:(unint64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3);
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v8 = (unsigned __int16)[(SBFolder *)self->_categoriesFolder listGridSize];
    id v9 = self->_containerViewController;
    id v11 = v9;
    if (a4 <= 2 * (unint64_t)v8) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v8 + 2 * (unint64_t)v8 < a4;
    }
    [(SBHLibrarySearchController *)v9 setSearchBarAppearance:v10];
  }
}

- (void)libraryPodFolderControllerRequestsDismissal:(id)a3
{
  uint64_t v7 = (SBHLibraryPodFolderController *)a3;
  if (self->_podFolderViewController == v7)
  {
    id v6 = [(SBHLibraryViewController *)self behaviorDelegate];
    [v6 libraryViewControllerRequestsDismissal:self];
  }
  else
  {
    id v4 = [(SBNestingViewController *)self nestedViewControllers];
    int v5 = [v4 containsObject:v7];

    if (v5)
    {
      [(SBHLibraryViewController *)self popNestedViewControllerAnimated:1 withCompletion:0];
      [(SBHLibrarySearchController *)self->_containerViewController resetSearchController:1 clearSearchResults:0 resetSearchBarTransformAndAlpha:1];
    }
  }
}

- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v10 = [(SBHLibraryViewController *)self traitCollection];
  id v11 = [v10 preferredContentSizeCategory];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4FB2778]];

  if (v12)
  {
    id v13 = [v8 traitOverrides];
    [v13 setPreferredContentSizeCategory:*MEMORY[0x1E4FB2780]];
  }
  currentTransitionAnimator = self->_currentTransitionAnimator;
  if (currentTransitionAnimator)
  {
    if ([(SBHomeScreenIconTransitionAnimator *)currentTransitionAnimator currentOperation] == 1)
    {
      objc_opt_class();
      id v15 = [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator childViewController];
      uint64_t v16 = SBFSafeCast();

      objc_opt_class();
      uint64_t v17 = SBFSafeCast();
      uint64_t v18 = (void *)v17;
      if (v16) {
        BOOL v19 = v17 == 0;
      }
      else {
        BOOL v19 = 1;
      }
      if (v19
        || ([v16 folder],
            id v20 = objc_claimAutoreleasedReturnValue(),
            [v18 folder],
            uint64_t v21 = objc_claimAutoreleasedReturnValue(),
            int v22 = [v20 isEqual:v21],
            v21,
            v20,
            !v22))
      {
        if ([(BSEventQueue *)self->_transitionEventQueue isEmpty])
        {
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __77__SBHLibraryViewController_pushNestedViewController_animated_withCompletion___block_invoke;
          v30[3] = &unk_1E6AACA90;
          void v30[4] = self;
          id v31 = v8;
          [(SBHLibraryViewController *)self _enqueueTransitionName:@"Request to open a folder while another folder is still closing" withHandler:v30];
        }
        [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator completeImmediately];
        if (v9) {
          v9[2](v9, 0);
        }
      }
      else
      {
        if (v9)
        {
          currentExpandCompletions = self->_currentExpandCompletions;
          if (!currentExpandCompletions)
          {
            v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v25 = self->_currentExpandCompletions;
            self->_currentExpandCompletions = v24;

            currentExpandCompletions = self->_currentExpandCompletions;
          }
          id v26 = (void *)[v9 copy];
          v27 = _Block_copy(v26);
          [(NSMutableArray *)currentExpandCompletions addObject:v27];
        }
        [(SBHLibraryViewController *)self _notifyObserversWillPresentFolderController:v16];
        [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator reverse];
        if ([(SBHLibraryViewController *)self isPresentingSearch]) {
          [(SBHLibraryViewController *)self dismissSearch];
        }
      }
    }
    else if (v9)
    {
      v9[2](v9, 0);
    }
  }
  else
  {
    id v28 = [(SBHLibraryViewController *)self _wrappedCompletionBlockForNestedTransitionWithCompletion:v9];
    v29.receiver = self;
    v29.super_class = (Class)SBHLibraryViewController;
    [(SBNestingViewController *)&v29 pushNestedViewController:v8 animated:v6 withCompletion:v28];
  }
}

void *__77__SBHLibraryViewController_pushNestedViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (!result[162]) {
    return (void *)[result pushNestedViewController:*(void *)(a1 + 40) animated:1 withCompletion:0];
  }
  return result;
}

- (void)popNestedViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, void))a4;
  currentTransitionAnimator = self->_currentTransitionAnimator;
  if (currentTransitionAnimator)
  {
    if ([(SBHomeScreenIconTransitionAnimator *)currentTransitionAnimator currentOperation])
    {
      if (v6) {
        v6[2](v6, 0);
      }
    }
    else
    {
      if (v6)
      {
        currentCollapseCompletions = self->_currentCollapseCompletions;
        if (!currentCollapseCompletions)
        {
          uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v11 = self->_currentCollapseCompletions;
          self->_currentCollapseCompletions = v10;

          currentCollapseCompletions = self->_currentCollapseCompletions;
        }
        int v12 = (void *)[v6 copy];
        id v13 = _Block_copy(v12);
        [(NSMutableArray *)currentCollapseCompletions addObject:v13];
      }
      objc_opt_class();
      id v14 = [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator childViewController];
      id v15 = SBFSafeCast();

      [(SBHLibraryViewController *)self _notifyObserversWillDismissFolderController:v15];
      [(SBHomeScreenIconTransitionAnimator *)self->_currentTransitionAnimator reverse];
    }
  }
  else
  {
    id v8 = [(SBHLibraryViewController *)self _wrappedCompletionBlockForNestedTransitionWithCompletion:v6];
    v16.receiver = self;
    v16.super_class = (Class)SBHLibraryViewController;
    [(SBNestingViewController *)&v16 popNestedViewControllerAnimated:v4 withCompletion:v8];
  }
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SBHLibraryViewController;
  id v11 = [(SBNestingViewController *)&v35 nestingViewController:a3 animationControllerForOperation:a4 onViewController:v10 animated:v6];
  if (v11) {
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = 0;
    goto LABEL_20;
  }
  id v34 = self->_podFolderViewController;
  id v12 = v10;
  id v33 = [v12 folderDelegate];
  id v13 = [v12 folder];
  id v14 = [v13 icon];

  id v15 = [(SBHLibrarySearchController *)self->_containerViewController searchBar];
  if (v14
    && ([v14 folder],
        objc_super v16 = objc_claimAutoreleasedReturnValue(),
        [v16 icons],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        uint64_t v18 = [v17 count],
        v17,
        v16,
        v18))
  {
    int v19 = 0;
    if (!v6)
    {
LABEL_6:
      id v20 = SBHLibraryPodImmediateAnimator;
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v21 = SBLogLibrary();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[SBHLibraryViewController nestingViewController:animationControllerForOperation:onViewController:animated:]((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);
    }

    int v19 = 1;
    if (!v6) {
      goto LABEL_6;
    }
  }
  if ((v19 | UIAccessibilityIsReduceMotionEnabled()) != 1)
  {
    id v28 = [[SBHLibraryPodIconZoomAnimator alloc] initWithAnimationContainer:v34 innerFolderController:v12 folderIcon:v14 searchBar:v15 libraryViewController:self];
    goto LABEL_15;
  }
  id v20 = SBHLibraryPodFadeAnimator;
LABEL_13:
  id v28 = (SBHLibraryPodIconZoomAnimator *)[[v20 alloc] initWithAnimationContainer:v34 innerFolderController:v12 searchBar:v15];
LABEL_15:
  objc_super v29 = v28;
  if (v28)
  {
    id v11 = [[SBHomeScreenIconTransitionAnimator alloc] initWithIconAnimator:v28 childViewController:v12 operation:a4 != 1];
    [(SBHomeScreenIconTransitionAnimator *)v11 setInitialDelay:0.0];
    v30 = [(SBHLibraryViewController *)self homeScreenIconTransitionAnimatorDelegate];
    [(SBHomeScreenIconTransitionAnimator *)v11 setDelegate:v30];

    id v31 = v33;
    if (objc_opt_respondsToSelector()) {
      [v33 folderController:self willUseIconTransitionAnimator:v11 forOperation:a4 onViewController:v12 animated:v6];
    }
  }
  else
  {
    id v11 = 0;
    id v31 = v33;
  }

LABEL_20:
  return v11;
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  id v10 = (SBHLibraryViewController *)a3;
  id v11 = a5;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBHLibraryViewController;
  [(SBNestingViewController *)&v24 nestingViewController:v10 willPerformOperation:a4 onViewController:v11 withTransitionCoordinator:v12];
  [(SBHLibraryViewController *)self _setupReducedTransparencyBackgroundViewIfNeeded];
  if (v10 == self)
  {
    id v13 = [(BSEventQueue *)v10->_transitionEventQueue acquireLockForReason:@"performingTransitionOperation"];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke;
    v22[3] = &unk_1E6AB2718;
    v22[4] = v10;
    id v23 = v13;
    id v14 = v13;
    [v12 animateAlongsideTransition:0 completion:v22];
  }
  if ((unint64_t)(a4 - 1) <= 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v11;
      objc_msgSend(v15, "setEditing:animated:", -[SBHLibraryViewController isEditing](self, "isEditing"), 1);
      if (a4 == 1)
      {
        [(SBHLibraryViewController *)self _notifyObserversWillPresentFolderController:v15];
        if ([(SBHLibraryViewController *)self isPresentingSearch]) {
          [(SBHLibraryViewController *)self dismissSearch];
        }
      }
      else
      {
        [(SBHLibraryViewController *)self _notifyObserversWillDismissFolderController:v15];
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3;
      v19[3] = &unk_1E6AB2740;
      v19[4] = self;
      int64_t v21 = a4;
      id v20 = v15;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4;
      v16[3] = &unk_1E6AB2740;
      id v17 = v20;
      int64_t v18 = a4;
      v16[4] = self;
      [v12 animateAlongsideTransition:v19 completion:v16];
    }
  }
}

void __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentTransitionAnimator:0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E6AACA90;
  uint64_t v2 = *(void **)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1288) relinquishLock:*(void *)(a1 + 40)];
}

void __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 1296);
  id v13 = v3;
  if (v4) {
    uint64_t v5 = [v4 currentOperation];
  }
  else {
    uint64_t v5 = *(void *)(a1 + 48) != 1;
  }
  if (v5 == 1)
  {
    double v11 = 0.0;
  }
  else
  {
    if (v5) {
      goto LABEL_16;
    }
    objc_opt_class();
    BOOL v6 = SBFSafeCast();
    if ([*(id *)(a1 + 32) _shouldUseReduceTransparencyBackgroundView])
    {
      uint64_t v7 = [v6 contentView];
      uint64_t v8 = objc_opt_class();
      id v9 = v7;
      if (v8)
      {
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
      id v12 = v10;

      [v12 setHidesFeatherBlur:UIAccessibilityIsReduceTransparencyEnabled()];
    }
    [v6 setPodFolderControllerDelegate:*(void *)(a1 + 32)];
    [v6 setLibraryCategoryMap:*(void *)(*(void *)(a1 + 32) + 1216)];

    double v11 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1136) setAlpha:v11];
LABEL_16:
}

void __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 2)
  {
    id v5 = v3;
    [*(id *)(a1 + 32) _notifyObserversDidDismissFolderController:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _teardownReducedTransparencyBackgroundView];
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = v3;
    [*(id *)(a1 + 32) _flushPendingLibraryCategoryMapUpdateIfNeeded];
    [*(id *)(a1 + 32) _updateReduceTransparency];
  }
  id v3 = v5;
LABEL_6:
}

- (id)iconView:(id)a3 labelImageWithParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHLibraryViewController *)self iconViewDelegate];
  id v9 = [v8 iconView:v7 labelImageWithParameters:v6];

  return v9;
}

- (int64_t)iconViewComponentBackgroundViewTypeForIconView:(id)a3
{
  return 6;
}

- (BOOL)iconShouldAllowTap:(id)a3
{
  id v3 = a3;
  int v4 = [v3 isEditing];
  id v5 = [v3 icon];

  if (v4) {
    LOBYTE(v6) = [v5 isAdditionalItemsIndicatorIcon];
  }
  else {
    int v6 = [v5 isCategoryIcon] ^ 1;
  }

  return v6;
}

- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4
{
  id v9 = a3;
  int v6 = [(SBHLibraryViewController *)self iconViewDelegate];
  if (objc_opt_respondsToSelector())
  {
    [v6 iconTapped:v9 modifierFlags:a4];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v6 iconTapped:v9];
  }
  [v9 setHighlighted:0];
  id v7 = [v9 icon];
  uint64_t v8 = [v9 location];
  [(SBHLibraryViewController *)self _notifyObserversOfAppLaunchOfIcon:v7 fromLocation:v8];
}

- (id)customImageViewControllerForIconView:(id)a3
{
  return [(SBHLibraryViewController *)self _customImageViewControllerForCategoryPodIconView:a3 usingInternalCache:1];
}

- (id)_customImageViewControllerForCategoryPodIconView:(id)a3 usingInternalCache:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [a3 icon];
  if ([v6 isCategoryIcon])
  {
    id v7 = [v6 category];
    uint64_t v8 = [v7 categoryIdentifier];
    if (v4) {
      [(SBHLibraryViewController *)self _iconViewControllerForCategoryIdentifier:v8];
    }
    else {
    id v9 = [(SBHLibraryViewController *)self _createIconViewControllerForCategoryIdentifier:v8];
    }
    id v10 = [(SBHLibraryViewController *)self _iconLocationForCategoryIdentifier:v8];
    [v9 updateCategory:v7 location:v10];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_iconViewControllerForCategoryIdentifier:(id)a3
{
  id v4 = a3;
  iconViewControllerForCategoryIdentifier = self->_iconViewControllerForCategoryIdentifier;
  if (!iconViewControllerForCategoryIdentifier)
  {
    int v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v7 = self->_iconViewControllerForCategoryIdentifier;
    self->_iconViewControllerForCategoryIdentifier = v6;

    iconViewControllerForCategoryIdentifier = self->_iconViewControllerForCategoryIdentifier;
  }
  uint64_t v8 = [(NSMapTable *)iconViewControllerForCategoryIdentifier objectForKey:v4];
  if (!v8)
  {
    uint64_t v8 = [(SBHLibraryViewController *)self _createIconViewControllerForCategoryIdentifier:v4];
    [(NSMapTable *)self->_iconViewControllerForCategoryIdentifier setObject:v8 forKey:v4];
  }

  return v8;
}

- (id)_createIconViewControllerForCategoryIdentifier:(id)a3
{
  id v4 = [(SBHLibraryViewController *)self listLayoutProvider];
  id v5 = [(SBHLibraryViewController *)self iconImageCache];
  int v6 = [(SBHLibraryViewController *)self folderIconImageCache];
  id v7 = objc_alloc_init(SBHLibraryCategoryIconViewController);
  [(SBHLibraryCategoryIconViewController *)v7 setIconViewProvider:self];
  [(SBHLibraryCategoryIconViewController *)v7 setListLayoutProvider:v4];
  [(SBHLibraryCategoryIconViewController *)v7 setIconImageCache:v5];
  [(SBHLibraryCategoryIconViewController *)v7 setFolderIconImageCache:v6];
  uint64_t v8 = [(SBHLibraryViewController *)self presenter];
  -[SBHLibraryCategoryIconViewController setNeedsBackgroundBlur:](v7, "setNeedsBackgroundBlur:", [v8 hasBackgroundBlur] ^ 1);

  return v7;
}

- (void)_precacheIconViewControllersForCategories:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v24;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(SBHLibraryViewController *)self _iconViewControllerForCategoryIdentifier:*(void *)(*((void *)&v23 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
  id v10 = (void *)MEMORY[0x1E4F1CA80];
  double v11 = [(NSMapTable *)self->_iconViewControllerForCategoryIdentifier keyEnumerator];
  id v12 = [v11 allObjects];
  id v13 = [v10 setWithArray:v12];

  [v13 minusSet:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        -[NSMapTable removeObjectForKey:](self->_iconViewControllerForCategoryIdentifier, "removeObjectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * v18++), (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (id)_iconLocationForCategoryIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = @"SBIconLocationAppLibraryCategoryPod";
  if ([v3 predictionCategoryID] == 3)
  {
    uint64_t v5 = SBIconLocationAppLibraryCategoryPodSuggestions;
  }
  else
  {
    if ([v3 predictionCategoryID] != 4) {
      goto LABEL_6;
    }
    uint64_t v5 = SBIconLocationAppLibraryCategoryPodRecents;
  }
  uint64_t v6 = *v5;

  id v4 = v6;
LABEL_6:

  return v4;
}

- (void)iconViewWasRecycled:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconViewDelegate];
  [v5 iconViewWasRecycled:v4];
}

- (void)iconViewWasDiscarded:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconViewDelegate];
  [v5 iconViewWasDiscarded:v4];
}

- (id)draggingDelegateForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 icon];
  if (([v5 isCategoryIcon] & 1) != 0
    || ([v5 isFolderIcon] & 1) != 0
    || [v5 isAdditionalItemsIndicatorIcon])
  {
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v8 = [(SBHLibraryViewController *)self iconViewDelegate];
    uint64_t v6 = v8;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [(SBHLibraryViewController *)v8 draggingDelegateForIconView:v4];
    }
  }

  return v6;
}

- (id)shortcutsDelegateForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 icon];
  if ([v5 isCategoryIcon])
  {

LABEL_4:
    uint64_t v8 = self;
    goto LABEL_6;
  }
  uint64_t v6 = [v4 icon];
  int v7 = [v6 isFolderIcon];

  if (v7) {
    goto LABEL_4;
  }
  uint64_t v8 = [(SBHLibraryViewController *)self iconViewDelegate];
LABEL_6:
  id v9 = v8;

  return v9;
}

- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3
{
  return 0;
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4
{
  return 0;
}

- (BOOL)iconShouldAllowCloseBoxTap:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconViewDelegate];
  char v6 = [v5 iconShouldAllowCloseBoxTap:v4];

  return v6;
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconViewDelegate];
  [v5 iconCloseBoxTapped:v4];
}

- (BOOL)iconViewDisplaysCloseBox:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconViewDelegate];
  char v6 = [v5 iconViewDisplaysCloseBox:v4];

  return v6;
}

uint64_t __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 folder];

  id v5 = SBFSafeCast();

  char v6 = [v5 libraryCategoryIdentifier];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  return v7;
}

uint64_t __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = [v3 folder];

  id v5 = SBFSafeCast();

  char v6 = [v5 libraryCategoryIdentifier];
  uint64_t v7 = [v6 isEqual:*(void *)(a1 + 32)];

  return v7;
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  id v4 = a3;
  id v5 = [v4 icon];
  char v6 = [v5 isCategoryIcon];

  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v8 = [(SBHLibraryViewController *)self iconViewDelegate];
    if (objc_opt_respondsToSelector()) {
      char v7 = [v8 iconViewCanBecomeFocused:v4];
    }
    else {
      char v7 = 0;
    }
  }
  return v7;
}

- (unint64_t)focusEffectTypeForIconView:(id)a3
{
  return 1;
}

- (id)_additionalItemsIndicatorIconViewForFolderController:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 folder];
  id v14 = SBFSafeCast();

  char v6 = [v14 libraryCategoryIdentifier];
  if (v6)
  {
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    long long v25 = __Block_byref_object_copy__15;
    long long v26 = __Block_byref_object_dispose__15;
    id v27 = 0;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    char v7 = [(SBFolderController *)self->_podFolderViewController iconListViews];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __81__SBHLibraryViewController__additionalItemsIndicatorIconViewForFolderController___block_invoke;
          v15[3] = &unk_1E6AAEB50;
          id v16 = v6;
          uint64_t v17 = &v22;
          [v11 enumerateIconViewsUsingBlock:v15];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v8);
    }

    id v12 = (id)v23[5];
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __81__SBHLibraryViewController__additionalItemsIndicatorIconViewForFolderController___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = [a2 customIconImageViewController];
  char v6 = [v15 iconListView];
  char v7 = [v6 icons];
  uint64_t v8 = objc_msgSend(v7, "bs_firstObjectOfClass:", objc_opt_class());

  uint64_t v9 = [v8 category];
  id v10 = [v9 categoryIdentifier];
  int v11 = [v10 isEqual:*(void *)(a1 + 32)];

  if (v11)
  {
    uint64_t v12 = [v6 iconViewForIcon:v8];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconViewDelegate];
  int64_t v6 = [v5 closeBoxTypeForIconView:v4];

  return v6;
}

- (BOOL)iconView:(id)a3 editingModeGestureRecognizerDidFire:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(SBHLibraryViewController *)self iconViewDelegate];
  char v9 = [v8 iconView:v7 editingModeGestureRecognizerDidFire:v6];

  return v9;
}

- (void)setContentVisibility:(unint64_t)a3
{
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    id v5 = [(SBHLibraryViewController *)self folderController];
    [v5 setContentVisibility:a3];

    if (a3 == 2 && [(SBHLibraryViewController *)self bs_isAppearingOrAppeared])
    {
      [(SBHLibraryViewController *)self _startLibraryViewControllerDismissalTimer:@"App Library is hidden!"];
      [(SBHLibraryViewController *)self _dismissExpandedPods:0 completion:0];
    }
    else
    {
      [(SBHLibraryViewController *)self _invalidateLibraryViewControllerDismissalTimer];
    }
  }
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  if ([(SBHLibraryViewController *)self isPresentingSearch])
  {
    [(SBHLibraryViewController *)self dismissSearch];
  }
}

- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4
{
  if (!a4)
  {
    [(BSInvalidatable *)self->_libraryPrewarmAssertion invalidate];
    libraryPrewarmAssertion = self->_libraryPrewarmAssertion;
    self->_libraryPrewarmAssertion = 0;
  }
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  id v9 = a3;
  if (a5 >= 1.0 && !a6 && !self->_libraryPrewarmAssertion)
  {
    id v12 = v9;
    id v10 = [(SBHLibraryViewController *)self acquireLibrarySearchPrewarmAssertionForReason:@"Library View Controller is presented"];
    libraryPrewarmAssertion = self->_libraryPrewarmAssertion;
    self->_libraryPrewarmAssertion = v10;

    id v9 = v12;
  }
}

- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4
{
  id v6 = [MEMORY[0x1E4F4F748] eventWithName:a3 handler:a4];
  id v5 = [(SBHLibraryViewController *)self transitionEventQueue];
  [v5 executeOrInsertEvent:v6 atPosition:1];
}

- (id)_wrappedCompletionBlockForNestedTransitionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__SBHLibraryViewController__wrappedCompletionBlockForNestedTransitionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6AB2790;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);
  id v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __85__SBHLibraryViewController__wrappedCompletionBlockForNestedTransitionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  if (WeakRetained)
  {
    id v6 = WeakRetained[163];
    id v7 = WeakRetained[164];
    id v8 = WeakRetained[163];
    WeakRetained[163] = 0;

    id v9 = WeakRetained[164];
    WeakRetained[164] = 0;

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v51 + 1) + 8 * i) + 16))();
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v12);
    }

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v15 = v7;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(v15);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v47 + 1) + 8 * j) + 16))();
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v57 count:16];
      }
      while (v17);
    }
    v38 = v10;

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v20 = [WeakRetained[139] keyEnumerator];
    long long v21 = [v20 allObjects];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v44;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v44 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v43 + 1) + 8 * k);
          id v27 = [WeakRetained nestedViewControllers];
          char v28 = [v27 containsObject:v26];

          if ((v28 & 1) == 0)
          {
            uint64_t v29 = [WeakRetained[139] objectForKey:v26];
            [WeakRetained _notifyObserversWillDismissFolderController:v26];
            [WeakRetained _notifyObserversDidDismissFolderController:v26];
            [v29 _updateAccessoryViewAnimated:1];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v56 count:16];
      }
      while (v23);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v30 = [WeakRetained[140] keyEnumerator];
    id v31 = [v30 allObjects];

    uint64_t v32 = [v31 countByEnumeratingWithState:&v39 objects:v55 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v39 + 1) + 8 * m);
          v37 = [WeakRetained[140] objectForKey:v36];
          [WeakRetained _notifyObserversDidDismissFolderController:v36];
          [v37 _updateAccessoryViewAnimated:1];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v39 objects:v55 count:16];
      }
      while (v33);
    }
  }
}

- (void)enumerateViewControllersUsingBlock:(id)a3
{
  id v4 = (void (**)(id, SBHLibraryPodFolderController *, unsigned char *))a3;
  char v7 = 0;
  if (![(SBHLibrarySearchController *)self->_containerViewController isActive]
    || (iconTableViewController = self->_iconTableViewController) == 0
    || (v4[2](v4, (SBHLibraryPodFolderController *)iconTableViewController, &v7), !v7))
  {
    if (![(SBHLibrarySearchController *)self->_containerViewController isActive])
    {
      podFolderViewController = self->_podFolderViewController;
      if (podFolderViewController) {
        v4[2](v4, podFolderViewController, &v7);
      }
    }
  }
}

- (void)_enumerateAllViewControllersUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void (**)(void, void, void))v4;
  char v8 = 0;
  podFolderViewController = self->_podFolderViewController;
  if (!podFolderViewController
    || ((*((void (**)(id, SBHLibraryPodFolderController *, char *))v4 + 2))(v4, podFolderViewController, &v8),
        !v8))
  {
    iconTableViewController = self->_iconTableViewController;
    if (iconTableViewController) {
      ((void (**)(void, SBHIconLibraryTableViewController *, char *))v5)[2](v5, iconTableViewController, &v8);
    }
  }
}

- (void)_updateViewControllerLegibility
{
  uint64_t v3 = [(SBHLibraryViewController *)self effectiveLegibilitySettings];
  if (!v3)
  {
    id v4 = [(SBHLibraryViewController *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];

    if (v5 == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2;
    }
    uint64_t v3 = [MEMORY[0x1E4FB21E0] sharedInstanceForStyle:v6];
  }
  id v7 = (id)v3;
  [(SBFolderController *)self->_podFolderViewController setLegibilitySettings:v3];
}

- (void)_setupIconTableViewController:(BOOL)a3
{
  BOOL v3 = a3;
  v103[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SBHLibraryViewController *)self iconViewProvider];
  uint64_t v6 = [(SBHLibraryViewController *)self iconModel];
  id v7 = [v6 rootFolder];

  char v8 = self->_listLayoutProvider;
  id v9 = self->_iconImageCache;
  v96 = [(SBHLibraryViewController *)self effectiveLegibilitySettings];
  id v10 = [(SBHLibraryViewController *)self iconModel];
  uint64_t v11 = [(SBHLibraryViewController *)self folderIconImageCache];
  uint64_t v12 = self->_categoryMapProvider;
  uint64_t v13 = [(SBHLibraryViewController *)self overrideIconImageAppearance];
  if (v9) {
    BOOL v14 = v11 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    BOOL v92 = v3;
    id v95 = v13;
    id v15 = [[_SBHLibraryCollectionOfModelThings alloc] initWithIconViewProvider:v5 iconModel:v10 rootFolder:v7 listLayoutProvider:v8 iconImageCache:v9 folderIconImageCache:v11 categoryMapProvider:v12];
    id v102 = 0;
    BOOL v16 = [(_SBHLibraryCollectionOfModelThings *)v15 examineModelValidityWithError:&v102];
    id v94 = v102;
    if (v16)
    {
      if ([(_SBHLibraryCollectionOfModelThings *)self->_model isEqual:v15])
      {
LABEL_31:

        uint64_t v13 = v95;
        goto LABEL_32;
      }
      v87 = v7;
      objc_storeStrong((id *)&self->_model, v15);
      iconViewControllerForCategoryIdentifier = self->_iconViewControllerForCategoryIdentifier;
      self->_iconViewControllerForCategoryIdentifier = 0;

      categoriesFolder = self->_categoriesFolder;
      if (categoriesFolder)
      {
        [(SBRootFolder *)categoriesFolder setDelegate:0];
        long long v19 = self->_categoriesFolder;
        self->_categoriesFolder = 0;
      }
      v93 = v15;
      v91 = v12;
      [(SBHLibraryViewController *)self _dismissExpandedPods:0 completion:0];
      iconTableViewController = self->_iconTableViewController;
      if (iconTableViewController)
      {
        [(SBHIconLibraryTableViewController *)iconTableViewController setObserver:0];
        long long v21 = self->_iconTableViewController;
        self->_iconTableViewController = 0;
      }
      v85 = v10;
      uint64_t v22 = objc_alloc_init(SBHIconLibraryTableViewController);
      uint64_t v23 = self->_iconTableViewController;
      self->_iconTableViewController = v22;

      [(SBHIconLibraryTableViewController *)self->_iconTableViewController setObserver:self];
      [(SBHIconLibraryTableViewController *)self->_iconTableViewController setListLayoutProvider:v8];
      v88 = v5;
      [(SBHIconLibraryTableViewController *)self->_iconTableViewController setIconViewProvider:v5];
      uint64_t v83 = [(SBHLibraryViewController *)self iconLocation];
      uint64_t v24 = [(SBIconListLayoutProvider *)v8 layoutForIconLocation:"layoutForIconLocation:"];
      v81 = SBHIconListLayoutIconGridSizeClassSizes(v24, 1);
      long long v25 = [(SBFolder *)[SBHLibraryCategoriesRootFolder alloc] initWithDisplayName:@"Categories Folder" maxListCount:1 listGridSize:4294901764 iconGridSizeClassSizes:v81];
      uint64_t v26 = self->_categoriesFolder;
      self->_categoriesFolder = v25;

      [(SBRootFolder *)self->_categoriesFolder setModel:self->_iconModel];
      id v27 = [(SBFolder *)self->_categoriesFolder addEmptyList];
      char v28 = self->_categoriesFolder;
      uint64_t v29 = [(SBHIconModel *)self->_iconModel rootFolder];
      v30 = [v29 delegate];
      [(SBRootFolder *)v28 setDelegate:v30];

      [(SBHLibraryCategoriesRootFolder *)self->_categoriesFolder setSupportsBadging:[(SBHLibraryViewController *)self allowsBadging]];
      id v31 = self->_categoriesFolder;
      uint64_t v32 = [(SBHLibraryViewController *)self badgeBehaviorProvider];
      [(SBFolder *)v31 setBadgeBehaviorProvider:v32];

      uint64_t v33 = objc_alloc_init(SBHLibraryPodFolderControllerConfiguration);
      [(SBFolderControllerConfiguration *)v33 setIconViewProvider:self];
      [(SBFolderControllerConfiguration *)v33 setListLayoutProvider:v8];
      [(SBFolderControllerConfiguration *)v33 setIconImageCache:v9];
      [(SBFolderControllerConfiguration *)v33 setFolderIconImageCache:v11];
      [(SBFolderControllerConfiguration *)v33 setLegibilitySettings:v96];
      [(SBHLibraryPodFolderControllerConfiguration *)v33 setCategoryMapProvider:v91];
      [(SBHLibraryPodFolderControllerConfiguration *)v33 setCategoriesFolder:self->_categoriesFolder];
      uint64_t v34 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v35 = [v34 userInterfaceIdiom];

      if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        uint64_t v36 = 30;
      }
      else {
        uint64_t v36 = 2;
      }
      [(SBFolderControllerConfiguration *)v33 setAllowedOrientations:v36];
      [(SBFolderControllerConfiguration *)v33 setOverrideIconImageAppearance:v95];
      podFolderViewController = self->_podFolderViewController;
      if (podFolderViewController)
      {
        [(SBHLibraryPodFolderController *)podFolderViewController setPodFolderControllerDelegate:0];
        [(SBFolderController *)self->_podFolderViewController setFolder:0];
        v38 = self->_podFolderViewController;
        self->_podFolderViewController = 0;
      }
      v84 = v11;
      v86 = v8;
      v80 = v33;
      long long v39 = [[SBHLibraryPodFolderController alloc] initWithConfiguration:v33];
      long long v40 = self->_podFolderViewController;
      self->_podFolderViewController = v39;

      long long v41 = [(SBHLibraryPodFolderController *)self->_podFolderViewController contentScrollView];
      [v41 setShowsVerticalScrollIndicator:0];

      [(SBHLibraryPodFolderController *)self->_podFolderViewController setPodFolderControllerDelegate:self];
      [(SBFolderController *)self->_podFolderViewController setFolderDelegate:self];
      [(SBHLibraryPodFolderController *)self->_podFolderViewController setEditing:[(SBHLibraryViewController *)self isEditing]];
      [(SBFolderController *)self->_podFolderViewController setContentVisibility:[(SBHLibraryViewController *)self contentVisibility]];
      containerViewController = self->_containerViewController;
      if (containerViewController)
      {
        [(SBHLibrarySearchController *)containerViewController setDelegate:self];
        [(SBHLibrarySearchController *)self->_containerViewController setSearchResultsUpdater:0];
        [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_containerViewControllerConstraints];
        long long v43 = [(SBHLibrarySearchController *)self->_containerViewController view];
        [v43 removeFromSuperview];

        [(SBHLibraryViewController *)self bs_removeChildViewController:self->_containerViewController];
        long long v44 = self->_containerViewController;
        self->_containerViewController = 0;
      }
      int v90 = [(SBHLibraryViewController *)self bs_isAppearingOrAppeared];
      v82 = v24;
      long long v45 = [v24 appLibraryVisualConfiguration];
      uint64_t v46 = [v45 usesInsetPlatterSearchAppearance];

      long long v47 = [[SBHLibrarySearchController alloc] initWithSearchResultsController:self->_iconTableViewController contentViewController:self->_podFolderViewController usingPlatterAppearance:v46];
      long long v48 = self->_containerViewController;
      self->_containerViewController = v47;

      [(SBHLibrarySearchController *)self->_containerViewController setDelegate:self];
      long long v49 = self->_containerViewController;
      long long v50 = [(SBHLibraryViewController *)self iconLocation];
      [(SBHLibrarySearchController *)v49 setContainingIconLocation:v50];

      [(SBHLibrarySearchController *)self->_containerViewController setSearchResultsUpdater:self->_iconTableViewController];
      [(SBHLibraryViewController *)self addChildViewController:self->_containerViewController];
      long long v51 = [(SBHLibraryViewController *)self view];
      long long v52 = [(SBHLibrarySearchController *)self->_containerViewController view];
      [v52 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v51 addSubview:v52];
      v78 = [v52 leadingAnchor];
      v77 = [v51 leadingAnchor];
      v76 = [v78 constraintEqualToAnchor:v77];
      v103[0] = v76;
      v75 = [v52 trailingAnchor];
      v74 = [v51 trailingAnchor];
      long long v53 = [v75 constraintEqualToAnchor:v74];
      v103[1] = v53;
      long long v54 = [v52 topAnchor];
      v55 = [v51 topAnchor];
      v56 = [v54 constraintEqualToAnchor:v55];
      v103[2] = v56;
      v89 = v52;
      v57 = [v52 bottomAnchor];
      v79 = v51;
      v58 = [v51 bottomAnchor];
      uint64_t v59 = [v57 constraintEqualToAnchor:v58];
      v103[3] = v59;
      v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v103 count:4];
      containerViewControllerConstraints = self->_containerViewControllerConstraints;
      self->_containerViewControllerConstraints = v60;

      [MEMORY[0x1E4F28DC8] activateConstraints:self->_containerViewControllerConstraints];
      [(SBHLibrarySearchController *)self->_containerViewController didMoveToParentViewController:self];
      if (v90) {
        [(SBHLibrarySearchController *)self->_containerViewController beginAppearanceTransition:1 animated:v92];
      }
      char v8 = v86;
      [(SBHLibrarySearchController *)self->_containerViewController setListLayoutProvider:v86];
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __58__SBHLibraryViewController__setupIconTableViewController___block_invoke;
      v97[3] = &unk_1E6AB27B8;
      v98 = v86;
      v99 = v9;
      uint64_t v11 = v84;
      id v100 = v84;
      id v7 = v87;
      id v101 = v87;
      [(SBHLibraryViewController *)self _enumerateAllViewControllersUsingBlock:v97];
      if (v96) {
        [(SBHLibraryViewController *)self _updateViewControllerLegibility];
      }
      v62 = [MEMORY[0x1E4FB21E0] sharedInstanceForStyle:1];
      [(SBHIconLibraryTableViewController *)self->_iconTableViewController setLegibilitySettings:v62];
      v63 = [v62 primaryColor];
      [v89 setTintColor:v63];

      v64 = [(SBHIconLibraryTableViewController *)self->_iconTableViewController tableView];
      [v64 setAccessibilityIdentifier:@"dewey-search-result-table-view"];

      v65 = [(SBHLibraryPodFolderController *)self->_podFolderViewController view];
      [v65 setAccessibilityIdentifier:@"dewey-pod-view"];

      uint64_t v12 = v91;
      if (v90) {
        [(SBHLibrarySearchController *)self->_containerViewController endAppearanceTransition];
      }
      v66 = [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider libraryCategoryMap];
      if (v66) {
        [(SBHLibraryViewController *)self _installCategoryMap:v66];
      }
      else {
        [(SBHLibraryViewController *)self _updateLibraryCategoryMap:0];
      }
      id v10 = v85;
      [(SBHLibraryCategoryMapProvider *)self->_categoryMapProvider addObserver:self];
      [(SBHLibraryViewController *)self _notifyObserversDataSourceDidChange];

      uint64_t v5 = v88;
      v67 = v83;
    }
    else
    {
      v93 = v15;
      v67 = SBLogLibrary();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        -[SBHLibraryViewController _setupIconTableViewController:]((uint64_t)v94, v67, v68, v69, v70, v71, v72, v73);
      }
    }

    id v15 = v93;
    goto LABEL_31;
  }
LABEL_32:
}

void __58__SBHLibraryViewController__setupIconTableViewController___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  [v3 setListLayoutProvider:a1[4]];
  [v3 setIconImageCache:a1[5]];
  if (objc_opt_respondsToSelector()) {
    [v3 setFolderIconImageCache:a1[6]];
  }
  if (objc_opt_respondsToSelector()) {
    [v3 setRootFolder:a1[7]];
  }
}

- (void)_enqueueAppLibraryUpdate
{
  id v2 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self->_categoryMapProvider, "requestLibraryCategoryMapRefreshWithOptions:reason:", 6, @"-[SBHLibraryViewController _reloadAppLibrary]");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController setEditing:animated:](&v6, sel_setEditing_animated_, a3);
  [(SBHLibraryViewController *)self _updateEditingStateAnimated:v4];
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    [(SBHLibraryViewController *)self _updateEditingStateAnimated:1];
  }
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBHLibraryViewController *)self isEditing]) {
    uint64_t v5 = [(SBHLibraryViewController *)self suppressesEditingStateForListViews] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [(SBFolderController *)self->_podFolderViewController setEditing:v5 animated:v3];
  id v6 = [(SBNestingViewController *)self nestedViewController];
  [v6 setEditing:v5 animated:v3];
}

- (void)_scrollIconViewToVisible:(id)a3 animated:(BOOL)a4
{
  id v21 = a3;
  int v5 = [(SBHLibraryViewController *)self bs_isAppearingOrAppeared];
  id v6 = v21;
  if (v5)
  {
    id v7 = v21;
    if (!v21)
    {
      char v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      NSLog(&cfstr_CannotScrollTo.isa, v9);

      id v7 = 0;
    }
    id v10 = [v7 icon];
    if (v10)
    {
      uint64_t v11 = [v21 location];
      uint64_t v12 = [(SBHLibraryViewController *)self iconViewForIcon:v10 location:v11];

      if (v12)
      {
        if ([(SBHLibraryViewController *)self isPresentingSearch])
        {
          uint64_t v13 = [(SBHLibrarySearchController *)self->_containerViewController contentScrollView];
          BOOL v14 = [(SBHIconLibraryTableViewController *)self->_iconTableViewController headerBlurView];
          [(SBHLibraryPodFolderController *)v14 frame];
          double v16 = v15;
          [v13 adjustedContentInset];
          double v18 = v16 - v17;
        }
        else
        {
          long long v19 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
          BOOL v14 = v19;
          if (v19
            && ([(SBHLibraryPodFolderController *)v19 bs_isDisappearingOrDisappeared] & 1) == 0)
          {
            podFolderViewController = v14;
          }
          else
          {
            podFolderViewController = self->_podFolderViewController;
          }
          uint64_t v13 = [(SBHLibraryPodFolderController *)podFolderViewController contentScrollView];
          double v18 = 16.0;
        }

        [v12 bounds];
        objc_msgSend(v12, "convertRect:toView:", v13);
        CGRectInset(v23, 0.0, -v18);
        [v13 contentSize];
        BSRectWithSize();
        UIRectContainInRect();
        objc_msgSend(v13, "scrollRectToVisible:animated:", 1);
      }
    }

    id v6 = v21;
  }
}

- (BOOL)isPresentingFolder
{
  if (self->_currentTransitionAnimator)
  {
    id v2 = [(NSMapTable *)self->_presentedFolderControllers keyEnumerator];
    BOOL v3 = [v2 allObjects];
    BOOL v4 = [v3 count] != 0;
  }
  else
  {
    id v2 = [(SBNestingViewController *)self deepestNestedDescendantViewController];
    BOOL v4 = v2 != 0;
  }

  return v4;
}

- (void)_popExpandedPod
{
  if ([(SBHLibraryViewController *)self isPresentingFolder])
  {
    [(SBHLibraryViewController *)self popNestedViewControllerAnimated:1 withCompletion:0];
  }
}

- (BOOL)_shouldUseReduceTransparencyBackgroundView
{
  id v2 = [(SBHLibraryViewController *)self presenter];
  char v3 = [v2 hasBackgroundBlur] ^ 1;

  return v3;
}

- (void)_setupReducedTransparencyBackgroundViewIfNeeded
{
  if ([(SBHLibraryViewController *)self isViewLoaded]
    && [(SBHLibraryViewController *)self _shouldUseReduceTransparencyBackgroundView])
  {
    if (UIAccessibilityIsReduceTransparencyEnabled() && !self->_reducedTransparencyBackgroundView)
    {
      char v3 = [SBFolderControllerBackgroundView alloc];
      BOOL v4 = [(SBHLibraryViewController *)self view];
      [v4 bounds];
      int v5 = -[SBFolderControllerBackgroundView initWithFrame:](v3, "initWithFrame:");
      reducedTransparencyBackgroundView = self->_reducedTransparencyBackgroundView;
      self->_reducedTransparencyBackgroundView = v5;

      [(SBFolderControllerBackgroundView *)self->_reducedTransparencyBackgroundView setAutoresizingMask:18];
      [(SBFolderControllerBackgroundView *)self->_reducedTransparencyBackgroundView setEffect:4];
      [(SBFolderControllerBackgroundView *)self->_reducedTransparencyBackgroundView setEffectActive:1];
      [(SBFolderControllerBackgroundView *)self->_reducedTransparencyBackgroundView setAlpha:0.0];
      id v7 = [(SBHLibraryViewController *)self view];
      [v7 addSubview:self->_reducedTransparencyBackgroundView];

      char v8 = [(SBHLibraryViewController *)self view];
      [v8 sendSubviewToBack:self->_reducedTransparencyBackgroundView];
    }
    [(SBHLibraryViewController *)self _updateReduceTransparency];
  }
}

- (void)_teardownReducedTransparencyBackgroundView
{
  [(SBFolderControllerBackgroundView *)self->_reducedTransparencyBackgroundView removeFromSuperview];
  reducedTransparencyBackgroundView = self->_reducedTransparencyBackgroundView;
  self->_reducedTransparencyBackgroundView = 0;
}

- (void)_updateReduceTransparency
{
  if ([(SBHLibraryViewController *)self isViewLoaded]
    && [(SBHLibraryViewController *)self _shouldUseReduceTransparencyBackgroundView]&& ![(NSMutableArray *)self->_currentCollapseCompletions count]&& ![(NSMutableArray *)self->_currentExpandCompletions count])
  {
    BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    BOOL v4 = [(SBHLibraryViewController *)self isPresentingFolder];
    if (IsReduceTransparencyEnabled && !self->_reducedTransparencyBackgroundView) {
      [(SBHLibraryViewController *)self _setupReducedTransparencyBackgroundViewIfNeeded];
    }
    if (v4)
    {
      int v5 = [(SBHLibraryViewController *)self podFolderViewController];
      id v6 = [v5 contentView];
      uint64_t v7 = objc_opt_class();
      __BSSafeCast(v6, v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      [v9 setHidesFeatherBlur:IsReduceTransparencyEnabled];
      [(SBFolderControllerBackgroundView *)self->_reducedTransparencyBackgroundView setAlpha:(double)IsReduceTransparencyEnabled];
    }
    else
    {
      if (self->_reducedTransparencyBackgroundView) {
        char v8 = IsReduceTransparencyEnabled;
      }
      else {
        char v8 = 1;
      }
      if ((v8 & 1) == 0)
      {
        [(SBHLibraryViewController *)self _teardownReducedTransparencyBackgroundView];
      }
    }
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  int v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)char v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  [(SBHLibraryViewController *)self _notifyObserversWillPresentSearchController:v4];
  id v6 = [(SBHLibraryViewController *)self podFolderViewController];
  uint64_t v7 = [v6 contentScrollView];
  [v7 _scrollToTopIfPossible:1];

  if ([(SBHLibraryViewController *)self isPresentingFolder]) {
    [(SBHLibraryViewController *)self popNestedViewControllerAnimated:1 withCompletion:0];
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  int v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  [(SBHLibraryViewController *)self _notifyObserversDidPresentSearchController:v4];
  [(SBHLibraryViewController *)self _flushPendingLibraryCategoryMapUpdateIfNeeded];
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  int v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  [(SBHLibraryViewController *)self _notifyObserversWillDismissSearchController:v4];
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  int v5 = SBLogTelemetrySignposts();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  [(SBHLibraryViewController *)self _notifyObserversDidDismissSearchController:v4];
}

- (void)_updateCategoryIconBlurBackdropView
{
  char v3 = [(SBHLibraryViewController *)self presenter];
  char v4 = [v3 hasBackgroundBlur] ^ 1;

  int v5 = [(NSMapTable *)self->_iconViewControllerForCategoryIdentifier objectEnumerator];
  id v6 = [v5 allObjects];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SBHLibraryViewController__updateCategoryIconBlurBackdropView__block_invoke;
  v7[3] = &__block_descriptor_33_e53_v32__0__SBHLibraryCategoryIconViewController_8Q16_B24l;
  char v8 = v4;
  [v6 enumerateObjectsUsingBlock:v7];
}

uint64_t __63__SBHLibraryViewController__updateCategoryIconBlurBackdropView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setNeedsBackgroundBlur:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)shouldShowDoneButtonWhenEditing
{
  return 1;
}

- (BOOL)shouldShowAddWidgetButtonWhenEditing
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  id v8 = v4;
  if (!observers)
  {
    id v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v7 = self->_observers;
    self->_observers = v6;

    id v4 = v8;
    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v4];
}

- (void)removeObserver:(id)a3
{
}

- (void)_notifyObserversWillDismissSearchController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__SBHLibraryViewController__notifyObserversWillDismissSearchController___block_invoke;
  v6[3] = &unk_1E6AB2800;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBHLibraryViewController *)self _enumerateObservers:v6];
}

void __72__SBHLibraryViewController__notifyObserversWillDismissSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:*(void *)(a1 + 32) willDismissSearchController:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversDidDismissSearchController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SBHLibraryViewController__notifyObserversDidDismissSearchController___block_invoke;
  v6[3] = &unk_1E6AB2800;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBHLibraryViewController *)self _enumerateObservers:v6];
}

void __71__SBHLibraryViewController__notifyObserversDidDismissSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:*(void *)(a1 + 32) didDismissSearchController:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversDidPresentSearchController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__SBHLibraryViewController__notifyObserversDidPresentSearchController___block_invoke;
  v6[3] = &unk_1E6AB2800;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBHLibraryViewController *)self _enumerateObservers:v6];
}

void __71__SBHLibraryViewController__notifyObserversDidPresentSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:*(void *)(a1 + 32) didPresentSearchController:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversWillPresentSearchController:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__SBHLibraryViewController__notifyObserversWillPresentSearchController___block_invoke;
  v6[3] = &unk_1E6AB2800;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBHLibraryViewController *)self _enumerateObservers:v6];
}

void __72__SBHLibraryViewController__notifyObserversWillPresentSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:*(void *)(a1 + 32) willPresentSearchController:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversWillPresentFolderController:(id)a3
{
  id v4 = a3;
  if (!self->_presentedFolderControllers)
  {
    id v5 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    presentedFolderControllers = self->_presentedFolderControllers;
    self->_presentedFolderControllers = v5;
  }
  id v7 = [(SBHLibraryViewController *)self _additionalItemsIndicatorIconViewForFolderController:v4];
  [(NSMapTable *)self->_presentedFolderControllers bs_setSafeObject:v7 forKey:v4];
  [(NSMapTable *)self->_dismissingFolderControllers removeObjectForKey:v4];
  [v7 _updateAccessoryViewAnimated:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SBHLibraryViewController__notifyObserversWillPresentFolderController___block_invoke;
  v9[3] = &unk_1E6AB2800;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(SBHLibraryViewController *)self _enumerateObservers:v9];
}

void __72__SBHLibraryViewController__notifyObserversWillPresentFolderController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:*(void *)(a1 + 32) willPresentFolderController:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversWillDismissFolderController:(id)a3
{
  id v4 = a3;
  dismissingFolderControllers = self->_dismissingFolderControllers;
  if (!dismissingFolderControllers)
  {
    id v6 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    id v7 = self->_dismissingFolderControllers;
    self->_dismissingFolderControllers = v6;

    dismissingFolderControllers = self->_dismissingFolderControllers;
  }
  id v8 = [(SBHLibraryViewController *)self _additionalItemsIndicatorIconViewForFolderController:v4];
  [(NSMapTable *)dismissingFolderControllers bs_setSafeObject:v8 forKey:v4];

  [(NSMapTable *)self->_presentedFolderControllers removeObjectForKey:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__SBHLibraryViewController__notifyObserversWillDismissFolderController___block_invoke;
  v10[3] = &unk_1E6AB2800;
  void v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  [(SBHLibraryViewController *)self _enumerateObservers:v10];
}

void __72__SBHLibraryViewController__notifyObserversWillDismissFolderController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:*(void *)(a1 + 32) willDismissFolderController:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversDidDismissFolderController:(id)a3
{
  dismissingFolderControllers = self->_dismissingFolderControllers;
  id v5 = a3;
  [(NSMapTable *)dismissingFolderControllers removeObjectForKey:v5];
  id v6 = [(SBHLibraryViewController *)self _additionalItemsIndicatorIconViewForFolderController:v5];

  [v6 _updateAccessoryViewAnimated:1];
}

- (void)_notifyObserversWillDismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__SBHLibraryViewController__notifyObserversWillDismiss__block_invoke;
  v2[3] = &unk_1E6AB2828;
  v2[4] = self;
  [(SBHLibraryViewController *)self _enumerateObservers:v2];
}

void __55__SBHLibraryViewController__notifyObserversWillDismiss__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewControllerWillDismiss:*(void *)(a1 + 32)];
  }
}

- (void)_notifyObserversDidDismiss
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SBHLibraryViewController__notifyObserversDidDismiss__block_invoke;
  v2[3] = &unk_1E6AB2828;
  v2[4] = self;
  [(SBHLibraryViewController *)self _enumerateObservers:v2];
}

void __54__SBHLibraryViewController__notifyObserversDidDismiss__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)_notifyObserversWillPresent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__SBHLibraryViewController__notifyObserversWillPresent__block_invoke;
  v2[3] = &unk_1E6AB2828;
  v2[4] = self;
  [(SBHLibraryViewController *)self _enumerateObservers:v2];
}

void __55__SBHLibraryViewController__notifyObserversWillPresent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewControllerWillPresent:*(void *)(a1 + 32)];
  }
}

- (void)_notifyObserversDidPresent
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SBHLibraryViewController__notifyObserversDidPresent__block_invoke;
  v2[3] = &unk_1E6AB2828;
  v2[4] = self;
  [(SBHLibraryViewController *)self _enumerateObservers:v2];
}

void __54__SBHLibraryViewController__notifyObserversDidPresent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewControllerDidPresent:*(void *)(a1 + 32)];
  }
}

- (void)_notifyObserversOfAppLaunchOfIcon:(id)a3 fromLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__SBHLibraryViewController__notifyObserversOfAppLaunchOfIcon_fromLocation___block_invoke;
  v10[3] = &unk_1E6AB2850;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SBHLibraryViewController *)self _enumerateObservers:v10];
}

void __75__SBHLibraryViewController__notifyObserversOfAppLaunchOfIcon_fromLocation___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:a1[4] willLaunchIcon:a1[5] fromLocation:a1[6]];
  }
}

- (void)_notifyObserversDataSourceDidChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__SBHLibraryViewController__notifyObserversDataSourceDidChange__block_invoke;
  v2[3] = &unk_1E6AB2828;
  v2[4] = self;
  [(SBHLibraryViewController *)self _enumerateObservers:v2];
}

void __63__SBHLibraryViewController__notifyObserversDataSourceDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(v3 + 1344) dataSource];
    [v5 libraryViewController:v3 dataSourceDidChange:v4];
  }
}

- (void)_notifyObserversOfAcceptedDrop:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__SBHLibraryViewController__notifyObserversOfAcceptedDrop___block_invoke;
  v6[3] = &unk_1E6AB2800;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBHLibraryViewController *)self _enumerateObservers:v6];
}

void __59__SBHLibraryViewController__notifyObserversOfAcceptedDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 libraryViewController:*(void *)(a1 + 32) didAcceptDrop:*(void *)(a1 + 40)];
  }
}

- (void)_enumerateObservers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)libraryCategoryMapProvider:(id)a3 categoryMapWasRefreshed:(unint64_t)a4 libraryCategoryMap:(id)a5
{
}

- (void)_updateLibraryCategoryMap:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SBHLibrarySearchController *)self->_containerViewController bs_isAppearingOrAppeared])
  {
    uint64_t v6 = [(SBNestingViewController *)self nestedViewController];
    BOOL v7 = !v6
      && ![(SBHLibraryViewController *)self isPresentingSearch]
      && [(SBHLibraryViewController *)self contentVisibility] != 2;
  }
  else
  {
    BOOL v7 = 0;
  }
  BOOL v8 = [(SBHLibraryViewController *)self _hiddenCategoriesDidChangeFromCurrentCategoryMap:self->_libraryCategoryMap toUpdatedCategoryMap:v5];
  libraryCategoryMap = self->_libraryCategoryMap;
  long long v10 = SBLogLibrary();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (libraryCategoryMap) {
    BOOL v12 = !v7;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || v8)
  {
    if (v11)
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "library category map update received: %@", (uint8_t *)&v19, 0xCu);
    }

    pendingLibraryCategoryMap = self->_pendingLibraryCategoryMap;
    self->_pendingLibraryCategoryMap = 0;

    [(SBHLibraryViewController *)self _installCategoryMap:v5];
    if (!v5)
    {
      double v18 = SBLogLibrary();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SBHLibraryViewController _updateLibraryCategoryMap:](v18);
      }

      [(SBHLibraryViewController *)self _enqueueAppLibraryUpdate];
    }
  }
  else
  {
    if (v11)
    {
      int v19 = 138412290;
      id v20 = v5;
      _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Queuing up pending library category map: %@", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)&self->_pendingLibraryCategoryMap, a3);
    long long v13 = SBLogLibrary();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "Setting up partial library category map update...", (uint8_t *)&v19, 2u);
    }

    BOOL v14 = [(id)objc_opt_class() _updateCategoryMap:self->_libraryCategoryMap withCategoryDataFrom:v5];
    uint64_t v15 = SBLogLibrary();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        int v19 = 138412290;
        id v20 = v14;
        _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated non-proactive special categories w/ new partial map: %@", (uint8_t *)&v19, 0xCu);
      }

      [(SBHLibraryViewController *)self _installCategoryMap:v14];
    }
    else
    {
      if (v16)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D7F0A000, v15, OS_LOG_TYPE_DEFAULT, "Could not amend map; partial update aborted.",
          (uint8_t *)&v19,
          2u);
      }
    }
  }
}

- (BOOL)_hiddenCategoriesDidChangeFromCurrentCategoryMap:(id)a3 toUpdatedCategoryMap:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(SBHLibraryViewController *)self _hiddenCategoryIdentifierForCategoryMap:v7];
  uint64_t v9 = [v7 sortedApplicationIdentifiersForCategoryIdentifier:v8];

  long long v10 = [(SBHLibraryViewController *)self _hiddenCategoryIdentifierForCategoryMap:v6];
  BOOL v11 = [v6 sortedApplicationIdentifiersForCategoryIdentifier:v10];

  uint64_t v12 = [v9 count];
  if (v12 == [v11 count])
  {
    long long v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    BOOL v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    char v15 = [v13 isEqualToSet:v14];
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (id)_hiddenCategoryIdentifierForCategoryMap:(id)a3
{
  id v3 = [a3 categoryIdentifiers];
  id v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_189);

  return v4;
}

BOOL __68__SBHLibraryViewController__hiddenCategoryIdentifierForCategoryMap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 predictionCategoryID] == 7;
}

+ (id)_updateCategoryMap:(id)a3 withCategoryDataFrom:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  [v7 updateRecentlyAddedCategoryFromMap:v5];

  LOBYTE(v5) = BSEqualObjects();
  if (v5) {
    id v8 = 0;
  }
  else {
    id v8 = v7;
  }

  return v8;
}

- (void)_flushPendingLibraryCategoryMapUpdateIfNeeded
{
}

- (void)_installCategoryMap:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(SBHLibraryViewController *)self isViewLoaded]) {
    unsigned int v6 = [(SBHLibraryViewController *)self bs_isAppearingOrAppeared];
  }
  else {
    unsigned int v6 = 0;
  }
  id v7 = SBLogLibrary();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v5;
    __int16 v28 = 1024;
    unsigned int v29 = v6;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Installing category map %@ - animated %{BOOL}u", buf, 0x12u);
  }

  p_libraryCategoryMap = &self->_libraryCategoryMap;
  objc_storeStrong((id *)&self->_libraryCategoryMap, a3);
  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_podFolderViewController];
  objc_opt_class();
  long long v10 = [(SBNestingViewController *)self nestedViewController];
  BOOL v11 = SBFSafeCast();
  objc_msgSend(v9, "bs_safeAddObject:", v11);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_msgSend(v17, "setLibraryCategoryMap:", *p_libraryCategoryMap, (void)v21);
        if (v6) {
          [v17 layoutIconListsWithAnimationType:v6 - 1 forceRelayout:1];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  [(SBHIconLibraryTableViewController *)self->_iconTableViewController setLibraryCategoryMap:*p_libraryCategoryMap];
  double v18 = (void *)MEMORY[0x1E4F1CAD0];
  int v19 = [(SBHLibraryCategoryMap *)*p_libraryCategoryMap categoryIdentifiers];
  id v20 = [v18 setWithArray:v19];
  [(SBHLibraryViewController *)self _precacheIconViewControllersForCategories:v20];
}

- (void)libraryTableViewControllerDidAppear:(id)a3
{
  [(SBFolderController *)self->_podFolderViewController setContentVisibility:1];
  [(SBHLibraryViewController *)self invalidateSearchControllerAppLaunchResetTimer];
}

- (void)libraryTableViewControllerWillDisappear:(id)a3
{
}

- (void)libraryTableViewControllerDidLaunchIcon:(id)a3
{
  id v5 = a3;
  [(SBHLibraryViewController *)self invalidateSearchControllerAppLaunchResetTimer];
  id v4 = [NSString stringWithFormat:@"App Library Search launch of app '%@'", v5];
  [(SBHLibraryViewController *)self _startAppLaunchResetTimer:v4];

  [(SBHLibraryViewController *)self _notifyObserversOfAppLaunchOfIcon:v5 fromLocation:@"SBIconLocationAppLibrarySearch"];
}

- (void)_invalidateLibraryViewControllerDismissalTimer
{
  [(NSTimer *)self->_libraryViewControllerDismissalTimer invalidate];
  libraryViewControllerDismissalTimer = self->_libraryViewControllerDismissalTimer;
  self->_libraryViewControllerDismissalTimer = 0;
}

- (void)_startLibraryViewControllerDismissalTimer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_libraryViewControllerDismissalTimer) {
    [(SBHLibraryViewController *)self _invalidateLibraryViewControllerDismissalTimer];
  }
  id v5 = [MEMORY[0x1E4F29128] UUID];
  unsigned int v6 = SBLogLibrary();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v4;
    __int16 v18 = 2114;
    int v19 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Starting App Library view controller dismissal timer for reason: %{public}@, session identifier %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v7 = (void *)MEMORY[0x1E4F1CB00];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__SBHLibraryViewController__startLibraryViewControllerDismissalTimer___block_invoke;
  v12[3] = &unk_1E6AB2898;
  id v8 = v4;
  id v13 = v8;
  id v9 = v5;
  id v14 = v9;
  objc_copyWeak(&v15, (id *)buf);
  long long v10 = [v7 scheduledTimerWithTimeInterval:0 repeats:v12 block:480.0];
  libraryViewControllerDismissalTimer = self->_libraryViewControllerDismissalTimer;
  self->_libraryViewControllerDismissalTimer = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __70__SBHLibraryViewController__startLibraryViewControllerDismissalTimer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a2 isValid])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _dismissLibraryViewControllerForReason:*(void *)(a1 + 32) sessionIdentifier:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = SBLogLibrary();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2114;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "App Library view controller dismissal timer for reason %{public}@, session identifier %{public}@ -- was invalidated.  We're not going to do anything.", buf, 0x16u);
    }
  }
}

- (void)_dismissLibraryViewControllerForReason:(id)a3 sessionIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SBHLibraryViewController *)self invalidateSearchControllerAppLaunchResetTimer];
  if ([(SBHLibraryViewController *)self bs_isAppearingOrAppeared]
    && [(SBHLibraryViewController *)self contentVisibility] != 2)
  {
    __int16 v9 = SBLogLibrary();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      _os_log_impl(&dword_1D7F0A000, v9, OS_LOG_TYPE_DEFAULT, "App Library view controller dismissal timer won't dismiss for reason %{public}@, session identifier %{public}@ -- container view controller is visible and it'd be really bad if we just changed the way the UI looked while they're using it", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = [(SBHLibraryViewController *)self behaviorDelegate];
    [v8 libraryViewControllerRequestsDismissal:self];
  }
}

- (id)acquireLibrarySearchPrewarmAssertionForReason:(id)a3
{
  return [(SBHIconLibraryTableViewController *)self->_iconTableViewController acquireLibrarySearchPrewarmAssertionForReason:a3];
}

- (void)invalidateSearchControllerAppLaunchResetTimer
{
  [(NSTimer *)self->_searchControllerAppLaunchResetTimer invalidate];
  searchControllerAppLaunchResetTimer = self->_searchControllerAppLaunchResetTimer;
  self->_searchControllerAppLaunchResetTimer = 0;
}

- (void)_startAppLaunchResetTimer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = SBLogLibrary();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v4;
    __int16 v18 = 2114;
    int v19 = v5;
    _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_DEFAULT, "Starting app launch reset timer for reason: %{public}@, session identifier %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v7 = (void *)MEMORY[0x1E4F1CB00];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __54__SBHLibraryViewController__startAppLaunchResetTimer___block_invoke;
  v12[3] = &unk_1E6AB2898;
  id v8 = v4;
  id v13 = v8;
  id v9 = v5;
  id v14 = v9;
  objc_copyWeak(&v15, (id *)buf);
  int v10 = [v7 scheduledTimerWithTimeInterval:0 repeats:v12 block:8.0];
  searchControllerAppLaunchResetTimer = self->_searchControllerAppLaunchResetTimer;
  self->_searchControllerAppLaunchResetTimer = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __54__SBHLibraryViewController__startAppLaunchResetTimer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([a2 isValid])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _dismissSearchIfNotInUseForReason:*(void *)(a1 + 32) sessionIdentifier:*(void *)(a1 + 40)];
  }
  else
  {
    id v3 = SBLogLibrary();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v8 = v4;
      __int16 v9 = 2114;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "App launch reset timer for reason %{public}@, session identifier %{public}@ -- was invalidated.  We're not going to do anything.", buf, 0x16u);
    }
  }
}

- (void)_dismissSearchIfNotInUseForReason:(id)a3 sessionIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(SBHLibraryViewController *)self invalidateSearchControllerAppLaunchResetTimer];
  if ([(SBHLibrarySearchController *)self->_containerViewController bs_isAppearingOrAppeared]&& [(SBHLibraryViewController *)self contentVisibility] != 2)
  {
    uint64_t v8 = SBLogLibrary();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      __int16 v9 = "App launch reset timer for reason %{public}@, session identifier %{public}@ -- container view controller is v"
           "isible and it'd be really bad if we just changed the way the UI looked while they're using it";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (![(SBHLibrarySearchController *)self->_containerViewController isActive])
  {
    uint64_t v8 = SBLogLibrary();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      id v13 = v7;
      __int16 v9 = "App launch won't dismiss search for reason %{public}@, session identifier %{public}@ -- search isn't active, "
           "so we can't dismiss something that isn't dismissable";
LABEL_9:
      _os_log_impl(&dword_1D7F0A000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  [(SBHLibraryViewController *)self dismissSearch];
LABEL_11:
}

- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7
{
}

- (Class)controllerClassForFolder:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  return 1;
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  return 0;
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4FA6E60];
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a5;
  uint64_t v8 = [v6 arrayWithObjects:&v11 count:1];
  int v9 = objc_msgSend(v7, "hasItemsConformingToTypeIdentifiers:", v8, v11, v12);

  if (v9) {
    return [(SBHLibraryViewController *)self isEditing];
  }
  else {
    return 0;
  }
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v7 = a5;
  [(SBHLibraryViewController *)self _updateDragPreviewIconViewsForDropSession:v7 inIconListView:a4];
  LODWORD(a4) = [(SBHLibraryViewController *)self _canPerformDropForAnyItemInSession:v7];

  if (a4) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v8];
  return v9;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v32 = self;
  id v7 = [(SBHLibraryViewController *)self iconModel];
  uint64_t v30 = [v7 rootFolder];
  id v31 = [MEMORY[0x1E4F1CA48] array];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = [v6 items];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    __int16 v28 = v7;
    id v29 = v6;
    char v11 = 0;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        id v15 = objc_msgSend(v14, "sbh_appDragLocalContext");
        BOOL v16 = [v15 startLocation] != 4;
        id v17 = [(SBHLibraryViewController *)v32 _iconIdentifierForDragItem:v14];
        if (v17) {
          [v31 addObject:v17];
        }
        __int16 v18 = [v15 containedIconIdentifiers];
        int v19 = v18;
        if (v18)
        {
          uint64_t v20 = [v18 allObjects];
          [v31 addObjectsFromArray:v20];
        }
        v11 |= v16;
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v10);

    id v7 = v28;
    id v6 = v29;
    if (v11)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v21 = v31;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v34 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = [v28 leafIconForIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * j)];
            if ([(SBHLibraryViewController *)v32 _canPerformDropForDraggedIcon:v26])
            {
              id v27 = [v30 ignoredList];
              [v27 addIcon:v26];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v23);
      }

      [(SBHLibraryViewController *)v32 _notifyObserversOfAcceptedDrop:v29];
    }
  }
  else
  {
  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(SBHLibraryViewController *)self _iconIdentifierForDragItem:v10];
  id v13 = [(SBHLibraryViewController *)self iconModel];
  uint64_t v14 = [v13 leafIconForIdentifier:v12];

  id v15 = [(SBHLibraryViewController *)self firstNonSuggestionsOrRecentsIconViewForIcon:v14];
  if (!v15)
  {
    id v15 = [(SBHLibraryViewController *)self firstIconViewForIcon:v14];
  }
  long long v55 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v60.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v60.c = v55;
  *(_OWORD *)&v60.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  objc_msgSend(v9, "iconContentScale", *(void *)&v60.tx, *(void *)&v60.ty, *(void *)&v60.a, *(void *)&v60.b, v55);
  *(_OWORD *)&v59.a = v54;
  *(_OWORD *)&v59.c = v56;
  *(_OWORD *)&v59.tx = v53;
  CGAffineTransformScale(&v60, &v59, v16, v16);
  if (v15)
  {
    id v17 = [v15 superview];
    [v15 center];
    objc_msgSend(v17, "convertPoint:toView:", v9);
    double v19 = v18;
    double v21 = v20;

    id v22 = objc_alloc(MEMORY[0x1E4FB1728]);
    CGAffineTransform v59 = v60;
    uint64_t v23 = objc_msgSend(v22, "initWithContainer:center:transform:", v9, &v59, v19, v21);
    if (v23)
    {
LABEL_5:
      uint64_t v24 = [v11 retargetedPreviewWithTarget:v23];
      objc_msgSend(v24, "set_springboardPlatterStyle:", 1);
      goto LABEL_15;
    }
  }
  else
  {
    id v58 = 0;
    long long v25 = [(SBHLibraryViewController *)self _destinationFolderIconViewForDragItem:v10 folderRelativeIconIndexPath:&v58];
    id v26 = v58;
    id v27 = v26;
    if (v25)
    {
      if (v26 && ![v26 sbListIndex])
      {
        objc_msgSend(v25, "frameForMiniIconAtIndex:", objc_msgSend(v27, "sbIconIndex"));
        objc_msgSend(v9, "convertRect:fromView:", v25);
        CGFloat v38 = v37;
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        UIRectGetCenter();
        double v46 = v45;
        double v48 = v47;
        [v9 alignmentIconSize];
        double v50 = v49;
        v62.origin.x = v38;
        v62.origin.y = v40;
        v62.size.double width = v42;
        v62.size.double height = v44;
        CGFloat Height = CGRectGetHeight(v62);
        CGAffineTransform v57 = v60;
        CGAffineTransformScale(&v59, &v57, Height / v50, Height / v50);
        CGAffineTransform v60 = v59;
        id v33 = objc_alloc(MEMORY[0x1E4FB1728]);
        CGAffineTransform v59 = v60;
        id v34 = v9;
        double v35 = v46;
        double v36 = v48;
      }
      else
      {
        __int16 v28 = [v25 superview];
        [v25 center];
        objc_msgSend(v28, "convertPoint:toView:", v9);
        double v30 = v29;
        double v32 = v31;

        CGAffineTransform v57 = v60;
        CGAffineTransformScale(&v59, &v57, 0.01, 0.01);
        CGAffineTransform v60 = v59;
        id v33 = objc_alloc(MEMORY[0x1E4FB1728]);
        CGAffineTransform v59 = v60;
        id v34 = v9;
        double v35 = v30;
        double v36 = v32;
      }
      uint64_t v23 = objc_msgSend(v33, "initWithContainer:center:transform:", v34, &v59, v35, v36);
    }
    else
    {
      uint64_t v23 = 0;
    }

    if (v23) {
      goto LABEL_5;
    }
  }
  uint64_t v24 = 0;
LABEL_15:

  return v24;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [(SBHLibraryViewController *)self _iconIdentifierForDragItem:v8];
  id v11 = [(SBHLibraryViewController *)self iconModel];
  uint64_t v12 = [v11 leafIconForIdentifier:v10];

  id v13 = [(SBHLibraryViewController *)self firstIconViewForIcon:v12];
  uint64_t v14 = v13;
  if (v13)
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke;
    v28[3] = &unk_1E6AAC810;
    id v15 = v13;
    id v29 = v15;
    [v9 addAnimations:v28];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2;
    v26[3] = &unk_1E6AACB50;
    id v27 = v15;
    [v9 addCompletion:v26];
  }
  CGFloat v16 = objc_msgSend(v8, "sbh_appDragLocalContext");
  id v17 = [v16 portaledPreview];
  if (objc_opt_respondsToSelector()) {
    double v18 = v17;
  }
  else {
    double v18 = 0;
  }
  id v19 = v18;

  if (v19)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3;
    v23[3] = &unk_1E6AACA90;
    id v20 = v19;
    id v24 = v20;
    id v25 = v14;
    [v9 addAnimations:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4;
    v21[3] = &unk_1E6AACB50;
    id v22 = v20;
    [v9 addCompletion:v21];
  }
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconImageAndAccessoryAlpha:0.0];
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIconImageAndAccessoryAlpha:1.0];
  id v2 = *(void **)(a1 + 32);
  return [v2 cleanUpAfterDropAnimation];
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsLabelArea:", objc_msgSend(*(id *)(a1 + 40), "allowsLabelArea"));
  if (!*(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) setIconCanShowCloseBox:0];
  }
  id v2 = *(void **)(a1 + 32);
  return [v2 setDragState:3];
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dropDestinationAnimationCompleted];
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  return 0;
}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  return 0;
}

- (id)_iconIdentifierForDragItem:(id)a3
{
  id v3 = objc_msgSend(a3, "sbh_appDragLocalContext");
  uint64_t v4 = [v3 uniqueIdentifier];

  return v4;
}

- (id)_draggedItemIdentifiersInSession:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v18 = v4;
  id v6 = [v4 items];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "sbh_appDragLocalContext");
        id v13 = [(SBHLibraryViewController *)self _iconIdentifierForDragItem:v11];
        if (v13) {
          [v5 addObject:v13];
        }
        uint64_t v14 = [v12 containedIconIdentifiers];
        id v15 = v14;
        if (v14)
        {
          CGFloat v16 = [v14 allObjects];
          [v5 addObjectsFromArray:v16];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_destinationFolderIconViewForDragItem:(id)a3 folderRelativeIconIndexPath:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(SBHLibraryViewController *)self _iconIdentifierForDragItem:v6];
  uint64_t v8 = [(SBHLibraryViewController *)self iconModel];
  uint64_t v9 = [v8 leafIconForIdentifier:v7];

  if (v9)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__15;
    id v26 = __Block_byref_object_dispose__15;
    id v27 = 0;
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    long long v19 = __Block_byref_object_copy__15;
    long long v20 = __Block_byref_object_dispose__15;
    id v21 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __94__SBHLibraryViewController__destinationFolderIconViewForDragItem_folderRelativeIconIndexPath___block_invoke;
    v12[3] = &unk_1E6AB28C0;
    uint64_t v14 = &v16;
    id v13 = v9;
    id v15 = &v22;
    [(SBHLibraryViewController *)self enumerateViewControllersUsingBlock:v12];
    if (a4) {
      *a4 = (id) v23[5];
    }
    id v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __94__SBHLibraryViewController__destinationFolderIconViewForDragItem_folderRelativeIconIndexPath___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v7 + 40);
    uint64_t v8 = [v5 folderIconViewForIcon:v6 folderRelativeIconIndexPath:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    uint64_t v9 = *(void *)(a1[5] + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
      *a3 = 1;
    }
  }
}

- (BOOL)_canPerformDropForAnyItemInSession:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconModel];
  [(SBHLibraryViewController *)self _draggedItemIdentifiersInSession:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(v5, "leafIconForIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        BOOL v12 = [(SBHLibraryViewController *)self _canPerformDropForDraggedIcon:v11];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_canPerformDropForDraggedIcon:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(SBHLibraryViewController *)self iconModel];
  id v6 = [v5 rootFolder];
  uint64_t v7 = [v6 ignoredList];

  LOBYTE(v6) = [v7 isAllowedToContainIcon:v4];
  return (char)v6;
}

- (void)_updateDragPreviewIconViewsForDropSession:(id)a3 inIconListView:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [a4 iconViewConfigurationOptions];
  [MEMORY[0x1E4F39CF8] begin];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = v5;
  id obj = [v5 items];
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "sbh_appDragLocalContext");
        BOOL v12 = [v11 portaledPreview];
        if (objc_opt_respondsToSelector()) {
          BOOL v13 = v12;
        }
        else {
          BOOL v13 = 0;
        }
        id v14 = v13;

        [v14 updateDestinationIconLocation:@"SBIconLocationAppLibraryCategoryPod" allowsLabelArea:(v6 & 2) == 0 animated:1];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBHomeScreenIconTransitionAnimatorDelegate)homeScreenIconTransitionAnimatorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeScreenIconTransitionAnimatorDelegate);
  return (SBHomeScreenIconTransitionAnimatorDelegate *)WeakRetained;
}

- (void)setHomeScreenIconTransitionAnimatorDelegate:(id)a3
{
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  return self->_libraryCategoryMap;
}

- (void)setIconViewDelegate:(id)a3
{
}

- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
  return (SBHIconBadgeBehaviorProviding *)WeakRetained;
}

- (SBHLibraryViewControllerDelegate)behaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behaviorDelegate);
  return (SBHLibraryViewControllerDelegate *)WeakRetained;
}

- (UIView)externalBackgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalBackgroundView);
  return (UIView *)WeakRetained;
}

- (BOOL)allowsBadging
{
  return self->_allowsBadging;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)setIconLocation:(id)a3
{
}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (BSEventQueue)transitionEventQueue
{
  return self->_transitionEventQueue;
}

- (SBHomeScreenIconTransitionAnimator)currentTransitionAnimator
{
  return self->_currentTransitionAnimator;
}

- (void)setCurrentTransitionAnimator:(id)a3
{
}

- (NSMutableArray)currentExpandCompletions
{
  return self->_currentExpandCompletions;
}

- (void)setCurrentExpandCompletions:(id)a3
{
}

- (NSMutableArray)currentCollapseCompletions
{
  return self->_currentCollapseCompletions;
}

- (void)setCurrentCollapseCompletions:(id)a3
{
}

- (SBHCredenzaSettings)credenzaSettings
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_credenzaSettings);
  return (SBHCredenzaSettings *)WeakRetained;
}

- (void)setCredenzaSettings:(id)a3
{
}

- (SBHLibrarySearchController)containerViewController
{
  return self->_containerViewController;
}

- (SBHIconLibraryTableViewController)iconTableViewController
{
  return self->_iconTableViewController;
}

- (SBHLibraryPodFolderController)podFolderViewController
{
  return self->_podFolderViewController;
}

- (_UILegibilitySettings)overrideLegibilitySettings
{
  return self->_overrideLegibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_podFolderViewController, 0);
  objc_storeStrong((id *)&self->_iconTableViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_credenzaSettings);
  objc_storeStrong((id *)&self->_currentCollapseCompletions, 0);
  objc_storeStrong((id *)&self->_currentExpandCompletions, 0);
  objc_storeStrong((id *)&self->_currentTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_transitionEventQueue, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_destroyWeak((id *)&self->_externalBackgroundView);
  objc_storeStrong((id *)&self->_barSwipeViewController, 0);
  objc_destroyWeak((id *)&self->_behaviorDelegate);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_badgeBehaviorProvider);
  objc_destroyWeak((id *)&self->_iconViewDelegate);
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_destroyWeak((id *)&self->_homeScreenIconTransitionAnimatorDelegate);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_shouldUseReduceTransparencyBackgroundView, 0);
  objc_storeStrong((id *)&self->_reducedTransparencyBackgroundView, 0);
  objc_storeStrong((id *)&self->_libraryPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_dismissingFolderControllers, 0);
  objc_storeStrong((id *)&self->_presentedFolderControllers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_libraryViewControllerDismissalTimer, 0);
  objc_storeStrong((id *)&self->_searchControllerAppLaunchResetTimer, 0);
  objc_storeStrong((id *)&self->_categoriesFolder, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_pendingLibraryCategoryMap, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconViewControllerForCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_containerViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_categoryMapProvider, 0);
}

- (void)nestingViewController:(uint64_t)a3 animationControllerForOperation:(uint64_t)a4 onViewController:(uint64_t)a5 animated:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setupIconTableViewController:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateLibraryCategoryMap:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Nil category map received; queueing up an update!",
    v1,
    2u);
}

@end