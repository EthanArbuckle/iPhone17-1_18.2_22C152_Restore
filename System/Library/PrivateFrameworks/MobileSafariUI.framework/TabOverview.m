@interface TabOverview
+ (CGFloat)_itemReferenceBoundsForBounds:(CGFloat)a3;
+ (uint64_t)_tabsPerRowForBounds:isAccessibilityContentSizeCategory:;
- (BOOL)_isClosingLastItem;
- (BOOL)_showsTitle;
- (BOOL)_updatePinnedItemCount;
- (BOOL)allowsInteractivePresentation;
- (BOOL)canBecomeFirstResponder;
- (BOOL)defersActivation;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasText;
- (BOOL)isInSteadyState;
- (BOOL)isItemAnimating:(id)a3;
- (BOOL)isScrollEnabled;
- (BOOL)lastDecelerationWasInterrupted;
- (BOOL)presentingInteractively;
- (BOOL)showsLockedPrivateBrowsingView;
- (BOOL)supportsDropTransitionToItemView;
- (BOOL)targetItemLiftsFromGrid;
- (CATransform3D)_thumbnailTransformForFrame:(CGFloat)a3@<D0> withScale:(CGFloat)a4@<D1> atZPosition:(CGFloat)a5@<D2>;
- (CGFloat)_tabSpacing;
- (CGRect)frameForItem:(id)a3;
- (CGSize)_contentSize;
- (CGSize)snapshotSizeForSuggestedSize:(CGSize)result;
- (NSArray)alternateItems;
- (NSArray)barButtonItems;
- (NSArray)items;
- (NSString)title;
- (ReorderingAutoscroller)reorderingAutoscroller;
- (SFTabCollectionSearchController)searchController;
- (TabOverview)initWithFrame:(CGRect)a3;
- (TabOverviewDelegate)delegate;
- (TabOverviewItem)itemToActivate;
- (TabOverviewTargetedPreviewContainer)_createPreviewContainerForItem:(id *)a1;
- (TabOverviewThemeProviding)themeProvider;
- (TabOverviewToolbar)toolbar;
- (char)_itemsContainingItem:(char *)a1;
- (double)_bottomEdgeOfTabs;
- (double)_controlsAlpha;
- (double)_cornerRadiusForItemAtLocation:(int)a3 scale:(double)a4 ignoreTransitionProgress:;
- (double)_currentScalePercentageForItemAtLocation:(uint64_t)a1;
- (double)_effectiveSafeAreaInsets;
- (double)_explanationViewVerticalOffset;
- (double)_focusAreaInsets;
- (double)_itemReferenceBounds;
- (double)_itemShouldBeTransparent:(uint64_t)a1;
- (double)_offsetForRubberbandOffset:(double)a3;
- (double)_rectForItemLocation:(double)a3;
- (double)_rubberbandOffsetForOffset:(double)a3;
- (double)_scrollBounds;
- (double)_searchBarLeadingMargin;
- (double)_targetLocationCenteredOnItemLocation:(double)a3;
- (double)_targetLocationForDismissalWithItem:(uint64_t)a1;
- (double)_targetLocationForItem:(void *)a3 inItems:;
- (double)_targetLocationForItemAtIndex:(uint64_t)a3 inNumberOfItems:(uint64_t)a4 insertionStyle:(unint64_t)a5 pinnedItemCount:;
- (double)_targetLocationForPresentation;
- (double)_thumbnailScaleWithTabLayout:(uint64_t)a1;
- (double)_titleHeight;
- (double)_titleViewSquishPercentageForItemAtLocation:(uint64_t)a1;
- (double)_totalWidthOfItemsWithCount:(int64_t)a3 pinnedItemCount:;
- (double)alternateBottomSafeAreaInset;
- (double)desiredSnapshotScale;
- (double)scalePercentageForActiveItem;
- (double)targetScaleWithTabLayout:(int64_t)a3;
- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4;
- (id)_dismissSearchBarAnimated:(id *)result;
- (id)_itemAboveItem:(uint64_t)a1;
- (id)_itemAtLayoutIndex:(id *)a1;
- (id)_itemAtPoint:(CGFloat)a3;
- (id)_itemBelowItem:(id *)a1;
- (id)_itemLeftOfItem:(uint64_t)a1;
- (id)_itemRightOfItem:(uint64_t)a1;
- (id)_layOutTitleLabel;
- (id)_requestReusableTabOverviewItemView;
- (id)_snapshotForItem:(BOOL *)a3 isBlank:;
- (id)_timingFunctionForAnimation;
- (id)_topBarThemeForItem:(id *)a1;
- (id)_updateVisiblyCenteredItem;
- (id)attachedViewForItem:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)inputView;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)pptStateUpdateHandler;
- (id)scrollingContainerView;
- (id)stateUpdateHandler;
- (id)targetItemForDropAtPoint:(CGPoint)a3;
- (id)targetedDragPreviewForDroppingItem:(id)a3;
- (id)targetedDragPreviewForLiftingItem:(id)a3;
- (id)targetedPreviewForDismissingMenuForItem:(id)a3;
- (id)undoManager;
- (id)viewForItem:(id)a3;
- (int64_t)alternateItemPosition;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)barPlacement;
- (int64_t)itemDragContentType;
- (int64_t)presentationState;
- (int64_t)presentedTabLayout;
- (int64_t)smartDashesType;
- (int64_t)smartInsertDeleteType;
- (int64_t)smartQuotesType;
- (int64_t)spellCheckingType;
- (long)_applyItemPosition:(double)a3 toLocation:(double)a4;
- (uint64_t)_beginPresentation;
- (uint64_t)_canCloseItem:(uint64_t)a1;
- (uint64_t)_checkSteadyState;
- (uint64_t)_hitPointIsInEmptySpace:(double)a3;
- (uint64_t)_interpolateValuesByTimeInterval:(uint64_t)a1;
- (uint64_t)_isDecelerating;
- (uint64_t)_isDismissibleSearchBarAvailable;
- (uint64_t)_itemHasAdditionalHeaderHeight:(uint64_t)a1;
- (uint64_t)_layoutIndexForItemIndex:(unint64_t)a3 pinnedItemCount:;
- (uint64_t)_layoutIndexForItemIndexIgnoringPinnedItems:(uint64_t)a1;
- (uint64_t)_passTextInputToSeachBarWithChanges:(uint64_t)result;
- (uint64_t)_resetToSteadyState;
- (uint64_t)_shiftLocationsForEffectiveLayoutIfNeeded;
- (uint64_t)_shiftScrollPositionForBoundsChangeIfNeeded;
- (uint64_t)_shouldDimItemsForSearch;
- (uint64_t)_tabsPerRow;
- (uint64_t)_wantsBorrowedContentView;
- (uint64_t)scrollToTop;
- (unint64_t)estimatedSnapshotsPerPageForBounds:(CGRect)a3 withTraitCollection:(id)a4;
- (unint64_t)snapshotBorderOptions;
- (void)_activateItemToActivate;
- (void)_activateItemToActivate:(id)a3;
- (void)_barInsets;
- (void)_close:(id)a3;
- (void)_closestItemToLocation:(double)a3;
- (void)_closestItemWithDistanceCalculationBlock:(void *)a1;
- (void)_constrainLocation:(double)a3;
- (void)_crossDissolveToSteadyStateIfNeededWithAnimationCompletion:(void *)a1;
- (void)_didChangeDismissing:(uint64_t)a1;
- (void)_didChangeVisibility:(uint64_t)a1;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_dismissWithItem:(uint64_t)a1;
- (void)_dismissWithItemAtCurrentDecelerationFactor:(id)a3;
- (void)_displayLinkFired:(id)a3;
- (void)_endInteractivePresentationAllowingDismissal:(int)a3 restoringPreviousState:;
- (void)_initializeIncomingItemIfNecessary:(void *)a3 fromItems:(void *)a4 oldItems:(uint64_t)a5 atPosition:(unsigned char *)a6 isIncoming:;
- (void)_itemAdditionalHeaderHeight;
- (void)_itemHeaderHeight;
- (void)_itemSnapshotsShouldPreserveAspectRatio;
- (void)_layOutPreviewContainers;
- (void)_layoutDisplayedItem:(char)a3 forceVisible:;
- (void)_notifyObserversForScalePercentageForActiveItem;
- (void)_notifyObserversForScrollViewShiftIfNeeded;
- (void)_notifySteadyStateUpdatedIfNeeded;
- (void)_pan:(id)a3;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_relinquishBorrowedContentView;
- (void)_relinquishReusableTabOverviewItemView:(uint64_t)a1;
- (void)_removeViewsForItem:(uint64_t)a1;
- (void)_resetRenderedLocations;
- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)_setExplanationViewVariant:(int)a3 animated:;
- (void)_setNeedsResizeHeaderItems;
- (void)_setPresentationState:(uint64_t)a1;
- (void)_setShowingSearchExplanationView:(unsigned __int8 *)a1;
- (void)_startClosingItem:(uint64_t)a1;
- (void)_tabClose:(id)a3;
- (void)_tap:(id)a3;
- (void)_thumbnailScaleForLandscapeOrientation;
- (void)_thumbnailScaleOfItemsWithCount:(int64_t)a3 pinnedItemCount:;
- (void)_updateAllowsInteractivePresentation;
- (void)_updateBorrowedContentView;
- (void)_updateDisplayLink;
- (void)_updateDisplayedItems;
- (void)_updateIndexesMatchingSearch;
- (void)_updateItemShowsCloseButton:(uint64_t)a1;
- (void)_updatePresentationStateIfSteady;
- (void)_updateScrollBoundsForKeyboardInfo:(double *)a1;
- (void)_updateScrollBoundsForKeyboardNotification:(id)a3;
- (void)_updateSnapshotAlphaForItem:(uint64_t)a1;
- (void)_updateTabCloseRecognizer;
- (void)_updateTargetLocationForDisplayedItem:(uint64_t)a1;
- (void)activateItem:(id)a3;
- (void)addPresentationObserver:(id)a3;
- (void)attachView:(id)a3 withReferenceRect:(CGRect)a4 toItem:(id)a5;
- (void)beginInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4;
- (void)cancelInteractivePresentation;
- (void)copyGeometryFromTabOverview:(id)a3;
- (void)copyLocationFromItem:(id)a3 toItem:(id)a4;
- (void)dealloc;
- (void)deleteBackward;
- (void)didEndShowingContextMenuForItem:(id)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)dismissAnimated:(BOOL)a3;
- (void)dismissWithAddTabAnimation;
- (void)endAnimation;
- (void)endInteractivePresentation;
- (void)endInteractivePresentationAllowingDismissalToTargetItem:(BOOL)a3;
- (void)enumerateItemsOrderedByVisibility:(id)a3;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)performUpdatesWithoutTabCloseAnimation:(id)a3;
- (void)presentAnimated:(BOOL)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)removePresentationObserver:(id)a3;
- (void)reorderingAutoscroller:(id)a3 handleScroll:(CGPoint)a4;
- (void)resetPresentationScrollPosition;
- (void)searchControllerDidChangeEditing:(id)a3;
- (void)searchControllerDidEndSearch:(id)a3;
- (void)searchControllerDidUpdateHasEmptyResults:(id)a3;
- (void)setAlternateBottomSafeAreaInset:(double)a3;
- (void)setBarButtonItems:(id)a3;
- (void)setBarPlacement:(int64_t)a3;
- (void)setDefersActivation:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInteractiveInsertionProgress:(double)a3 forItem:(id)a4;
- (void)setItemToActivate:(id)a3;
- (void)setItems:(id)a3;
- (void)setItems:(id)a3 alternateItems:(id)a4 atPosition:(int64_t)a5;
- (void)setPptStateUpdateHandler:(id)a3;
- (void)setPresentedTabLayout:(int64_t)a3;
- (void)setShowsLockedPrivateBrowsingView:(BOOL)a3 withUnlockHandler:(id)a4;
- (void)setShowsPrivateBrowsingExplanationView:(BOOL)a3 animated:(BOOL)a4;
- (void)setStateUpdateHandler:(id)a3;
- (void)setTargetItemLiftsFromGrid:(BOOL)a3;
- (void)setThemeProvider:(id)a3;
- (void)setTitle:(id)a3;
- (void)test_scrollToTopWithoutAnimation;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)updateInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4;
- (void)updateInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4 animated:(BOOL)a5;
- (void)updateSnapshotForItem:(id)a3;
- (void)willAnimateDropForItem:(id)a3 withAnimator:(id)a4;
- (void)willBeginShowingContextMenuForItem:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TabOverview

- (TabOverview)initWithFrame:(CGRect)a3
{
  v75[1] = *MEMORY[0x1E4F143B8];
  v74.receiver = self;
  v74.super_class = (Class)TabOverview;
  v3 = -[TabOverview initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TabOverview *)v3 setAccessibilityIdentifier:@"TabOverview"];
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    presentationObservers = v4->_presentationObservers;
    v4->_presentationObservers = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    itemViewReuseStack = v4->_itemViewReuseStack;
    v4->_itemViewReuseStack = (NSMutableArray *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    deferredClosingItems = v4->_deferredClosingItems;
    v4->_deferredClosingItems = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28BD0] set];
    itemsShowingContextMenu = v4->_itemsShowingContextMenu;
    v4->_itemsShowingContextMenu = (NSCountedSet *)v11;

    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v13;

    v15 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2928] weight:*MEMORY[0x1E4FB09B8]];
    [(UILabel *)v4->_titleLabel setFont:v15];

    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TabGroupTitleField"];
    [(TabOverview *)v4 addSubview:v4->_titleLabel];
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    scrollingContainerView = v4->_scrollingContainerView;
    v4->_scrollingContainerView = v16;

    [(TabOverview *)v4 addSubview:v4->_scrollingContainerView];
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    menuPreviewContainerView = v4->_menuPreviewContainerView;
    v4->_menuPreviewContainerView = v18;

    [(UIView *)v4->_menuPreviewContainerView setUserInteractionEnabled:0];
    [(TabOverview *)v4 addSubview:v4->_menuPreviewContainerView];
    if ([MEMORY[0x1E4F97EA0] hasInternalContent])
    {
      v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v21 = [v20 BOOLForKey:@"DebugTabOverviewGeometry"];

      if (v21)
      {
        v22 = [MEMORY[0x1E4FB1618] blackColor];
        [(UIView *)v4->_scrollingContainerView setBackgroundColor:v22];

        v23 = objc_alloc_init(GridVisualizationView);
        gridVisualizationView = v4->_gridVisualizationView;
        v4->_gridVisualizationView = &v23->super;

        v25 = [MEMORY[0x1E4FB1618] clearColor];
        [(UIView *)v4->_gridVisualizationView setBackgroundColor:v25];

        [(TabOverview *)v4 addSubview:v4->_gridVisualizationView];
      }
    }
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F78350]) initWithTarget:v4 action:sel__pan_];
    panRecognizer = v4->_panRecognizer;
    v4->_panRecognizer = (SFScrollingPanGestureRecognizer *)v26;

    [(SFScrollingPanGestureRecognizer *)v4->_panRecognizer setDelegate:v4];
    [(TabOverview *)v4 addGestureRecognizer:v4->_panRecognizer];
    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F78350]) initWithTarget:v4 action:sel__tabClose_];
    tabCloseRecognizer = v4->_tabCloseRecognizer;
    v4->_tabCloseRecognizer = (SFScrollingPanGestureRecognizer *)v28;

    [(SFScrollingPanGestureRecognizer *)v4->_tabCloseRecognizer _setCanPanVertically:0];
    [(SFScrollingPanGestureRecognizer *)v4->_tabCloseRecognizer setDelegate:v4];
    [(SFScrollingPanGestureRecognizer *)v4->_tabCloseRecognizer _setHysteresis:25.0];
    [(TabOverview *)v4 addGestureRecognizer:v4->_tabCloseRecognizer];
    uint64_t v30 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__tap_];
    tapRecognizer = v4->_tapRecognizer;
    v4->_tapRecognizer = (UITapGestureRecognizer *)v30;

    [(TabOverview *)v4 addGestureRecognizer:v4->_tapRecognizer];
    v32 = -[TabOverviewInterpolatedLocation initWithLocation:decelerationFactor:]([TabOverviewInterpolatedLocation alloc], "initWithLocation:decelerationFactor:", 0.0, 0.0, 0.0, 0.0, 0.985);
    interpolatedLocation = v4->_interpolatedLocation;
    v4->_interpolatedLocation = v32;

    [(TabOverviewInterpolatedLocation *)v4->_interpolatedLocation setMinimumTranslationSpeed:10.0];
    v4->_horizontalBounceEnabled = 1;
    v4->_verticalBounceEnabled = 1;
    v4->_shouldBounceToConstrainedLocation = 1;
    v34 = objc_alloc_init(TabOverviewToolbar);
    header = v4->_header;
    v4->_header = v34;

    [(TabOverviewToolbar *)v4->_header setAlpha:0.0];
    [(TabOverviewToolbar *)v4->_header setUserInteractionEnabled:1];
    [(TabOverviewToolbar *)v4->_header setAutoresizingMask:0];
    [(TabOverviewToolbar *)v4->_header sf_applyContentSizeCategoryLimitsForToolbarButton];
    [(TabOverview *)v4 addSubview:v4->_header];
    objc_initWeak(&location, v4);
    v36 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v68 = MEMORY[0x1E4F143A8];
    uint64_t v69 = 3221225472;
    v70 = __29__TabOverview_initWithFrame___block_invoke;
    v71 = &unk_1E6D78C18;
    objc_copyWeak(&v72, &location);
    v37 = [v36 actionWithHandler:&v68];
    -[TabOverviewToolbar addPrimaryAction:forBarButton:](v4->_header, "addPrimaryAction:forBarButton:", v37, 3, v68, v69, v70, v71);
    v38 = v4->_header;
    v39 = objc_msgSend(MEMORY[0x1E4FB1970], "sf_tabMenu");
    [(TabOverviewToolbar *)v38 setMenu:v39 forBarButton:3];

    v40 = objc_alloc_init(SFTabCollectionSearchController);
    searchController = v4->_searchController;
    v4->_searchController = v40;

    [(SFTabCollectionSearchController *)v4->_searchController setTabView:v4];
    [(SFTabCollectionSearchController *)v4->_searchController setItemSource:v4];
    [(SFTabCollectionSearchController *)v4->_searchController setDelegate:v4];
    uint64_t v42 = [(SFTabCollectionSearchController *)v4->_searchController searchBar];
    searchBar = v4->_searchBar;
    v4->_searchBar = (SFTabOverviewSearchBar *)v42;

    uint64_t v44 = [MEMORY[0x1E4F78298] standardGaussianGradientView];
    statusBarGradient = v4->_statusBarGradient;
    v4->_statusBarGradient = (SFGradientView *)v44;

    [(SFGradientView *)v4->_statusBarGradient setAlpha:1.0];
    [(TabOverview *)v4 insertSubview:v4->_statusBarGradient belowSubview:v4->_header];
    id v46 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v47 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v48 = [v46 initWithEffect:v47];
    dismissibleSearchBarBackground = v4->_dismissibleSearchBarBackground;
    v4->_dismissibleSearchBarBackground = (UIVisualEffectView *)v48;

    [(UIVisualEffectView *)v4->_dismissibleSearchBarBackground setAlpha:0.0];
    [(TabOverview *)v4 insertSubview:v4->_dismissibleSearchBarBackground belowSubview:v4->_header];
    v50 = v4->_searchBar;
    if (v4->_barPlacement)
    {
      [(SFTabOverviewSearchBar *)v50 setLayoutMarginsFollowReadableWidth:1];
      [(SFTabOverviewSearchBar *)v4->_searchBar setEmbeddedInToolbar:0];
      [(TabOverview *)v4 insertSubview:v4->_searchBar belowSubview:v4->_header];
      v51 = 0;
    }
    else
    {
      [(SFTabOverviewSearchBar *)v50 setEmbeddedInToolbar:1];
      v51 = v4->_searchBar;
    }
    [(TabOverviewToolbar *)v4->_header setSearchBar:v51];
    v52 = objc_alloc_init(SFTabOverviewItemContentView);
    titleSizingItemView = v4->_titleSizingItemView;
    v4->_titleSizingItemView = v52;

    [(SFTabOverviewItemContentView *)v4->_titleSizingItemView setHidden:1];
    [(TabOverview *)v4 addSubview:v4->_titleSizingItemView];
    v4->_needsResizeHeaderItems = 1;
    v54 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    inputView = v4->_inputView;
    v4->_inputView = v54;

    v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v56 addObserver:v4 selector:sel__updateScrollBoundsForKeyboardNotification_ name:*MEMORY[0x1E4FB2C58] object:0];
    [v56 addObserver:v4 selector:sel__updateScrollBoundsForKeyboardNotification_ name:*MEMORY[0x1E4FB2C50] object:0];
    [v56 addObserver:v4 selector:sel__updateScrollBoundsForKeyboardNotification_ name:*MEMORY[0x1E4FB2C48] object:0];
    [v56 addObserver:v4 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x1E4FB2650] object:0];
    v4->_inSteadyState = 1;
    v4->_allowsInteractivePresentation = 1;
    v57 = [(TabOverview *)v4 traitCollection];
    v58 = [v57 preferredContentSizeCategory];
    v4->_usesAccessibilityContentSize = UIContentSizeCategoryIsAccessibilityCategory(v58);

    uint64_t v59 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v4];
    cursorInteraction = v4->_cursorInteraction;
    v4->_cursorInteraction = (UIPointerInteraction *)v59;

    [(TabOverview *)v4 addInteraction:v4->_cursorInteraction];
    v61 = SFFocusGroupIdentifierForOwner();
    [(TabOverview *)v4 setFocusGroupIdentifier:v61];

    v75[0] = objc_opt_class();
    v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
    id v63 = (id)[(TabOverview *)v4 registerForTraitChanges:v62 withTarget:v4 action:sel__preferredContentSizeCategoryDidChange];

    v64 = objc_msgSend(MEMORY[0x1E4FB1E20], "safari_traitsAffectingTextAppearance");
    id v65 = (id)[(TabOverview *)v4 registerForTraitChanges:v64 withTarget:v4 action:sel__setNeedsResizeHeaderItems];

    v66 = v4;
    objc_destroyWeak(&v72);
    objc_destroyWeak(&location);
  }

  return v4;
}

void __29__TabOverview_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained searchController];
  [v1 endSearching];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    -[TabOverview _relinquishBorrowedContentView]((uint64_t)self);
    objc_storeWeak((id *)&self->_delegate, obj);
    -[TabOverview _updateBorrowedContentView]((id *)&self->super.super.super.isa);
  }
}

- (void)_relinquishBorrowedContentView
{
  if (a1)
  {
    -[TabOverviewItem layoutInfo](*(id **)(a1 + 480));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v2 = -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v9);
    if (v2)
    {
      uint64_t v3 = *(void *)(a1 + 480);

      if (!v3) {
        return;
      }
      -[TabOverviewItem layoutInfo](*(id **)(a1 + 480));
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
      uint64_t v5 = -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v9);
      [WeakRetained tabCollectionView:a1 relinquishBorrowedContentView:v5 forItem:*(void *)(a1 + 480)];

      -[TabOverviewItemLayoutInfo setBorrowedContentView:headerHeight:]((uint64_t)v9, 0, 0.0);
      v6 = *(void **)(a1 + 480);
      *(void *)(a1 + 480) = 0;
      id v7 = v6;

      -[TabOverview _updateSnapshotAlphaForItem:](a1, v7);
      v8 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v9);
      -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v8);

      [(id)a1 setNeedsLayout];
    }
  }
}

- (void)_updateBorrowedContentView
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 150);
    int v2 = -[TabOverview _wantsBorrowedContentView]((uint64_t)a1);
    uint64_t v3 = [WeakRetained currentItemForTabOverview:a1];
    v4 = (id *)a1[60];
    if (v4 == v3) {
      char v5 = v2;
    }
    else {
      char v5 = 0;
    }
    if (v4 && (v5 & 1) == 0) {
      -[TabOverview _relinquishBorrowedContentView]((uint64_t)a1);
    }
    if (v2)
    {
      if (a1[60] != v3)
      {
        -[TabOverviewItem layoutInfo](v3);
        v6 = (id *)objc_claimAutoreleasedReturnValue();
        id v7 = -[TabOverviewItemLayoutInfo itemView](v6);

        if (v7)
        {
          -[TabOverview _itemHeaderHeight]((uint64_t)a1);
          double v9 = v8;
          v10 = objc_msgSend(WeakRetained, "tabCollectionView:borrowContentViewForItem:withTopBackdropView:ofHeight:", a1, v3, 0);
          double v11 = *MEMORY[0x1E4F1DAD8];
          double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          v13 = [v10 layer];
          objc_msgSend(v13, "setAnchorPoint:", v11, v12);

          [v10 setHidden:1];
          [a1 bounds];
          objc_msgSend(v10, "setFrame:");
          objc_msgSend(v10, "setUserInteractionEnabled:", objc_msgSend(a1, "presentationState") == 3);
          v14 = -[TabOverviewItem layoutInfo](v3);
          -[TabOverviewItemLayoutInfo setBorrowedContentView:headerHeight:]((uint64_t)v14, v10, v9);
          objc_storeStrong(a1 + 60, v3);
          -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)a1, a1[60]);
          v15 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v14);
          -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v15);

          [a1 setNeedsLayout];
        }
      }
    }
  }
}

- (void)dealloc
{
  [(TabOverview *)self setDelegate:0];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TabOverview;
  [(TabOverview *)&v4 dealloc];
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TabOverview;
  [(TabOverview *)&v5 willMoveToWindow:a3];
  objc_super v4 = [(TabOverview *)self window];
  [v4 _unregisterScrollToTopView:self];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)TabOverview;
  [(TabOverview *)&v4 didMoveToWindow];
  uint64_t v3 = [(TabOverview *)self window];
  [v3 _registerScrollToTopView:self];
}

- (id)undoManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v4 = [WeakRetained undoManagerForTabCollectionView:self];

  return v4;
}

- (void)_barInsets
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 1216);
    if (v2 != 2)
    {
      if (v2 == 1)
      {
        [(id)a1 bounds];
        CGRectGetHeight(v4);
        [*(id *)(a1 + 672) frame];
        CGRectGetMinY(v5);
      }
      else if (!v2)
      {
        [*(id *)(a1 + 672) frame];
        CGRectGetMaxY(v3);
      }
    }
  }
}

- (void)_updateScrollBoundsForKeyboardInfo:(double *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 presentationState];
    if (v4)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __50__TabOverview__updateScrollBoundsForKeyboardInfo___block_invoke;
      v38[3] = &unk_1E6D77E20;
      v38[4] = a1;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v38];
    }
    CGRect v5 = [a1 window];
    v6 = [v5 screen];

    if (v3)
    {
      id v7 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4FB2BD8]];
      [v7 CGRectValue];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
    }
    else
    {
      [v6 bounds];
      double v9 = v16;
      double v11 = v17;
      double v13 = v18;
      double v15 = v19;
    }
    v20 = [v6 coordinateSpace];
    objc_msgSend(a1, "convertRect:fromCoordinateSpace:", v20, v9, v11, v13, v15);
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    double v29 = a1[96];
    v39.origin.x = v22;
    v39.origin.y = v24;
    v39.size.width = v26;
    v39.size.height = v28;
    double v30 = 0.0;
    if (!CGRectIsEmpty(v39))
    {
      v40.origin.x = v22;
      v40.origin.y = v24;
      v40.size.width = v26;
      v40.size.height = v28;
      double Width = CGRectGetWidth(v40);
      [v6 bounds];
      if (Width == CGRectGetWidth(v41))
      {
        [a1 bounds];
        double MaxY = CGRectGetMaxY(v42);
        v43.origin.x = v22;
        v43.origin.y = v24;
        v43.size.width = v26;
        v43.size.height = v28;
        double v30 = fmax(MaxY - CGRectGetMinY(v43), 0.0);
      }
    }
    a1[96] = v30;
    v33 = [a1 window];
    v34 = v33;
    if (v4 && v33)
    {
      double v35 = vabdd_f64(v29, a1[96]);
      _SFOnePixel();
      double v37 = v36;

      if (v35 >= v37)
      {
        [a1 setNeedsLayout];
        [a1 layoutIfNeeded];
      }
    }
    else
    {
    }
  }
}

uint64_t __50__TabOverview__updateScrollBoundsForKeyboardInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateScrollBoundsForKeyboardNotification:(id)a3
{
  id v4 = [a3 userInfo];
  -[TabOverview _updateScrollBoundsForKeyboardInfo:]((double *)self, v4);
}

- (void)dismissWithAddTabAnimation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_presentationState)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEFAULT, "Dismiss tab overview with add tab animation", buf, 2u);
    }
    self->_dismissingWithAddTabAnimation = 1;
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation setDecelerationFactor:0.988];
    if (self->_presentedTabLayout)
    {
      double v4 = 0.97;
    }
    else if ([(TabOverview *)self targetItemLiftsFromGrid])
    {
      double v4 = 0.98;
    }
    else
    {
      double v4 = 0.97;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    CGRect v5 = self->_items;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = -[TabOverviewItem layoutInfo](*(id **)(*((void *)&v15 + 1) + 8 * v9));
          double v11 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v10);
          objc_msgSend(v11, "setDecelerationFactor:", v4, (void)v15);

          double v12 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v10);
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v12, 0.0);

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v7);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v14 = [WeakRetained currentItemForTabOverview:self];
    [(TabOverview *)self _dismissWithItemAtCurrentDecelerationFactor:v14];
  }
}

+ (uint64_t)_tabsPerRowForBounds:isAccessibilityContentSizeCategory:
{
  return SFTabOverviewNumberOfColumns();
}

- (uint64_t)_tabsPerRow
{
  if (result)
  {
    if (*(void *)(result + 1224))
    {
      return -1;
    }
    else
    {
      [(id)result bounds];
      return +[TabOverview _tabsPerRowForBounds:isAccessibilityContentSizeCategory:]();
    }
  }
  return result;
}

- (double)_effectiveSafeAreaInsets
{
  if (!a1) {
    return 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
  [WeakRetained effectiveSafeAreaInsetsForTabCollectionView:a1];
  double v4 = v3;

  return v4;
}

- (void)_preferredContentSizeCategoryDidChange
{
  double v3 = [(TabOverview *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (self->_usesAccessibilityContentSize != IsAccessibilityCategory)
  {
    self->_usesAccessibilityContentSize = IsAccessibilityCategory;
    [(TabOverview *)self setNeedsLayout];
  }
  self->_explanationViewSize = (CGSize)*MEMORY[0x1E4F1DB30];
}

- (void)setAlternateBottomSafeAreaInset:(double)a3
{
  if (self->_alternateBottomSafeAreaInset != a3)
  {
    self->_alternateBottomSafeAreaInset = a3;
    [(TabOverview *)self setNeedsLayout];
  }
}

- (void)setBarPlacement:(int64_t)a3
{
  if (self->_barPlacement != a3)
  {
    self->_barPlacement = a3;
    -[TabOverviewToolbar setPlacement:](self->_header, "setPlacement:");
    self->_needsResizeHeaderItems = 1;
    [(TabOverview *)self setNeedsLayout];
    if (self->_barPlacement)
    {
      if ((-[TabOverview _isDismissibleSearchBarAvailable]((uint64_t)self) & 1) == 0
        && [(SFTabOverviewSearchBar *)self->_searchBar isFirstResponder])
      {
        searchBar = self->_searchBar;
        [(SFTabOverviewSearchBar *)searchBar resignFirstResponder];
      }
    }
  }
}

- (uint64_t)_isDismissibleSearchBarAvailable
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 1216))
    {
      if ((unint64_t)[*(id *)(a1 + 1168) count] <= 1)
      {
        uint64_t v2 = [*(id *)(v1 + 680) text];
        uint64_t v1 = [v2 length] != 0;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (double)scalePercentageForActiveItem
{
  double v3 = -[TabOverviewItem layoutInfo]((id *)&self->_activeItem->super.isa);
  double v4 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v3);
  double v5 = -[TabOverview _currentScalePercentageForItemAtLocation:]((uint64_t)self, v4);

  return v5;
}

- (double)_currentScalePercentageForItemAtLocation:(uint64_t)a1
{
  id v3 = a2;
  double v4 = 0.0;
  if (a1)
  {
    uint64_t v5 = *(void *)(a1 + 1224);
    if (v5 != 1)
    {
      if (*(void *)(a1 + 1152))
      {
        long double v6 = *(double *)(a1 + 896);
        if (v6 == 0.0) {
          long double v6 = -[TabOverview _thumbnailScaleWithTabLayout:](a1, v5);
        }
        double v7 = log(v6);
        double v8 = v7;
        if (v3)
        {
          [v3 location];
          double v10 = v9;
        }
        else
        {
          double v10 = v7;
        }
        [*(id *)(a1 + 424) location];
        double v4 = 1.0;
        if (v8 != 0.0)
        {
          double v4 = (v10 - v11) / v8;
          if (v4 < 0.0) {
            double v4 = v4 / (1.0 - v4);
          }
          if (v4 > 1.0) {
            double v4 = (v4 + -1.0) / v4 + 1.0;
          }
        }
      }
    }
  }

  return v4;
}

- (void)setPresentedTabLayout:(int64_t)a3
{
  if (self->_presentedTabLayout != a3)
  {
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation targetLocation];
    -[TabOverview _closestItemToLocation:](self, v5, v6, v7, v8);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    self->_presentedTabLayout = a3;
    -[TabOverview _updateTabCloseRecognizer](self);
    double v9 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)self, v13, self->_items);
    -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", -[TabOverview _targetLocationCenteredOnItemLocation:]((id *)&self->super.super.super.isa, v9, v10, v11, v12));
    [(TabOverview *)self setNeedsLayout];
  }
}

- (void)_closestItemToLocation:(double)a3
{
  if (a1)
  {
    var48[0] = MEMORY[0x1E4F143A8];
    var48[1] = 3221225472;
    var48[2] = __38__TabOverview__closestItemToLocation___block_invoke;
    var48[3] = &unk_1E6D7EFA0;
    var48[4] = a1;
    *(double *)&var48[5] = a2;
    *(double *)&var48[6] = a3;
    *(double *)&var48[7] = a4;
    *(double *)&var48[8] = a5;
    a1 = -[TabOverview _closestItemWithDistanceCalculationBlock:](a1, var48);
    uint64_t v5 = var48[10];
  }
  return a1;
}

- (void)_updateTabCloseRecognizer
{
  if (result)
  {
    uint64_t v1 = result;
    BOOL v2 = [result presentationState] != 3 && *((void *)v1 + 153) != 1;
    [*((id *)v1 + 57) setEnabled:v2];
    id v3 = (void *)*((void *)v1 + 56);
    return (void *)[v3 _setCanPanHorizontally:v2 ^ 1];
  }
  return result;
}

- (double)_targetLocationForItem:(void *)a3 inItems:
{
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  if (a1)
  {
    if ([v6 count]) {
      unint64_t v8 = [v7 indexOfObject:v5];
    }
    else {
      unint64_t v8 = 0;
    }
    uint64_t v9 = [v7 count];
    unint64_t v10 = countPinnedItems(v7);
    double v11 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:](a1, v8, v9, 0, v10);
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (double)_targetLocationCenteredOnItemLocation:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  -[TabOverview _rectForItemLocation:](a1, a2, a3, a4, a5);
  -[TabOverview _scrollBounds](a1);
  _SFCGRectGrowToSize();
  double v7 = v6;
  unint64_t v8 = [a1 title];
  uint64_t v9 = [v8 length];

  if (v9) {
    -[TabOverview _titleHeight](a1);
  }
  -[TabOverview _isDismissibleSearchBarAvailable]((uint64_t)a1);
  double v10 = -v7;
  if (-[TabOverview _itemSnapshotsShouldPreserveAspectRatio](a1))
  {
    [a1[138] titlePadding];
    [a1[138] titleHeight];
  }
  return v10;
}

- (BOOL)targetItemLiftsFromGrid
{
  return self->_targetItemLiftsFromGrid || self->_transitioningItemIsPinned;
}

- (void)_setNeedsResizeHeaderItems
{
  self->_needsResizeHeaderItems = 1;
  [(TabOverview *)self setNeedsLayout];
}

- (double)_totalWidthOfItemsWithCount:(int64_t)a3 pinnedItemCount:
{
  if (!a1) {
    return 0.0;
  }
  unint64_t v6 = -[TabOverview _tabsPerRow]((uint64_t)a1);
  [a1 bounds];
  double Width = CGRectGetWidth(v10);
  unint64_t v8 = a2 - a3;
  if (a2 - a3 <= a3) {
    unint64_t v8 = a3;
  }
  if (v8 >= v6) {
    unint64_t v8 = v6;
  }
  if (v8 <= 1) {
    unint64_t v8 = 1;
  }
  return Width * (double)(v8 - 1) * dbl_1E123E350[a1[153] == 0] + (double)v8 * Width;
}

- (void)_thumbnailScaleOfItemsWithCount:(int64_t)a3 pinnedItemCount:
{
  if (a1)
  {
    if (!a1[153])
    {
      double v6 = -[TabOverview _effectiveSafeAreaInsets]((uint64_t)a1);
      double v8 = v7;
      double v16 = v9;
      double v11 = v10;
      [a1 bounds];
      double x = v17.origin.x;
      double y = v17.origin.y;
      double width = v17.size.width;
      double height = v17.size.height;
      CGRectGetWidth(v17);
      v18.origin.double x = v8 + x;
      v18.origin.double y = v6 + y;
      v18.size.double width = width - (v8 + v11);
      v18.size.double height = height - (v6 + v16);
      CGRectGetWidth(v18);
      -[TabOverview _totalWidthOfItemsWithCount:pinnedItemCount:](a1, a2, a3);
    }
  }
}

- (double)targetScaleWithTabLayout:(int64_t)a3
{
  return 1.0 / -[TabOverview _thumbnailScaleWithTabLayout:]((uint64_t)self, a3);
}

- (double)_thumbnailScaleWithTabLayout:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0x3FF0000000000000;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v3 = *(void *)(a1 + 1224);
  *(void *)(a1 + 1224) = a2;
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:]((void *)a1, objc_msgSend(*(id *)(a1 + 1168), "count", v7, 3221225472, __44__TabOverview__thumbnailScaleWithTabLayout___block_invoke, &unk_1E6D7ED70), *(void *)(a1 + 1112));
  *((void *)v9 + 3) = v4;
  *(void *)(a1 + 1224) = v3;
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__TabOverview__thumbnailScaleWithTabLayout___block_invoke(uint64_t a1)
{
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](*(void **)(a1 + 32), [*(id *)(*(void *)(a1 + 32) + 1168) count], *(void *)(*(void *)(a1 + 32) + 1112));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (void)_thumbnailScaleForLandscapeOrientation
{
  if (result)
  {
    uint64_t v1 = result;
    [result bounds];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v10 = -[TabOverview _effectiveSafeAreaInsets]((uint64_t)v1);
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    int v17 = objc_msgSend(v1, "_sf_hasLandscapeAspectRatio");
    double v28 = v3 + v12;
    double v29 = v5 + v10;
    double v18 = v7 - (v12 + v16);
    double v19 = v9 - (v10 + v14);
    double v20 = v3;
    double v21 = v5;
    double v22 = v7;
    double v23 = v9;
    if (v17)
    {
      CGRectGetWidth(*(CGRect *)&v20);
      double v24 = v28;
      double v25 = v29;
      double v26 = v18;
      double v27 = v19;
    }
    else
    {
      CGRectGetHeight(*(CGRect *)&v20);
      v30.origin.double x = v28;
      v30.origin.double y = v29;
      v30.size.double width = v18;
      v30.size.double height = v19;
      CGRectGetHeight(v30);
      v31.origin.double x = v3;
      v31.origin.double y = v5;
      v31.size.double width = v7;
      v31.size.double height = v9;
      CGRectGetMinX(v31);
      v32.origin.double x = v3;
      v32.origin.double y = v5;
      v32.size.double width = v7;
      v32.size.double height = v9;
      CGRectGetMinY(v32);
      double v24 = v3;
      double v25 = v5;
      double v26 = v7;
      double v27 = v9;
    }
    CGRectGetWidth(*(CGRect *)&v24);
    return (void *)+[TabOverview _tabsPerRowForBounds:isAccessibilityContentSizeCategory:]();
  }
  return result;
}

- (double)_searchBarLeadingMargin
{
  if (!a1) {
    return 0.0;
  }
  -[TabOverview _thumbnailScaleForLandscapeOrientation](a1);
  double v3 = v2;
  [a1 bounds];
  double Width = CGRectGetWidth(v6);
  [a1 bounds];
  return fmax(Width, CGRectGetHeight(v7)) / v3 * dbl_1E123E350[a1[153] == 0];
}

- (double)_rectForItemLocation:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  -[TabOverview _itemReferenceBounds](a1);
  exp(a5);
  _SFRoundRectToPixels();
  return result;
}

- (double)_itemReferenceBounds
{
  if (!a1) {
    return 0.0;
  }
  [a1 bounds];
  double v6 = +[TabOverview _itemReferenceBoundsForBounds:](v2, v3, v4, v5);
  if (-[TabOverview _itemSnapshotsShouldPreserveAspectRatio](a1))
  {
    -[TabOverview _itemHeaderHeight]((uint64_t)a1);
    [a1[138] titlePadding];
    [a1[138] titleHeight];
    -[TabOverview _thumbnailScaleWithTabLayout:]((uint64_t)a1, 0);
  }
  return v6;
}

- (CGRect)frameForItem:(id)a3
{
  CGFloat v4 = -[TabOverviewItem layoutInfo]((id *)a3);
  CGFloat v5 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v4);
  [v5 location];
  double v10 = -[TabOverview _rectForItemLocation:]((id *)&self->super.super.super.isa, v6, v7, v8, v9);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  scrollingContainerView = self->_scrollingContainerView;
  -[TabOverview convertRect:fromView:](self, "convertRect:fromView:", scrollingContainerView, v10, v12, v14, v16);
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (double)_scrollBounds
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = a1[153];
  if (v2 == 1)
  {
    [a1 bounds];
  }
  else if (!v2)
  {
    -[TabOverview _effectiveSafeAreaInsets]((uint64_t)a1);
    [a1 bounds];
  }
  return result;
}

- (BOOL)_showsTitle
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = [a1 title];
  BOOL v2 = [v1 length] != 0;

  return v2;
}

- (double)_titleHeight
{
  double v1 = 0.0;
  if (a1)
  {
    CGFloat v3 = [a1 title];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      [a1[87] bounds];
      return CGRectGetHeight(v6) + 44.0;
    }
  }
  return v1;
}

- (void)_itemSnapshotsShouldPreserveAspectRatio
{
  if (result)
  {
    [result bounds];
    CGFloat x = v6.origin.x;
    CGFloat y = v6.origin.y;
    CGFloat width = v6.size.width;
    CGFloat height = v6.size.height;
    double v5 = CGRectGetWidth(v6);
    v7.origin.CGFloat x = x;
    v7.origin.CGFloat y = y;
    v7.size.CGFloat width = width;
    v7.size.CGFloat height = height;
    return (void *)(v5 / CGRectGetHeight(v7) > 1.6);
  }
  return result;
}

- (double)_targetLocationForDismissalWithItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    double v4 = -[TabOverview _targetLocationForItem:inItems:](a1, v3, *(void **)(a1 + 1168));
    if (!*(void *)(a1 + 1224) && ([(id)a1 targetItemLiftsFromGrid] & 1) == 0) {
      -[TabOverview _itemHeaderHeight](a1);
    }
  }
  else
  {
    double v4 = 0.0;
  }

  return v4;
}

- (void)_itemHeaderHeight
{
  if (a1)
  {
    if (*(double *)(a1 + 880) <= 0.0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
      [WeakRetained tabCollectionViewItemHeaderHeight:a1];
    }
  }
}

- (uint64_t)_layoutIndexForItemIndexIgnoringPinnedItems:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if ([*(id *)(a1 + 752) isSearching])
  {
    double v4 = [*(id *)(a1 + 752) indexesMatchingSearchTerm];
    a2 = objc_msgSend(v4, "countOfIndexesInRange:", 0, a2);
  }
  return a2;
}

- (uint64_t)_layoutIndexForItemIndex:(unint64_t)a3 pinnedItemCount:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = -[TabOverview _layoutIndexForItemIndexIgnoringPinnedItems:](a1, a2);
  if (a2 >= a3 && !*(void *)(a1 + 1224))
  {
    unint64_t v7 = -[TabOverview _layoutIndexForItemIndexIgnoringPinnedItems:](a1, a3);
    unint64_t v8 = -[TabOverview _tabsPerRow](a1);
    if (v7 % v8) {
      return v8 + v6 - v7 % v8;
    }
  }
  return v6;
}

- (id)_itemAtLayoutIndex:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = (uint64_t)a1;
    a1 = (id *)[a1[146] count];
    if (a1)
    {
      double v5 = a1;
      unint64_t v6 = 0;
      while (-[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](v4, v6, *(void *)(v4 + 1112)) != a2)
      {
        if (v5 == (id *)++v6)
        {
          a1 = 0;
          goto LABEL_8;
        }
      }
      a1 = [*(id *)(v4 + 1168) objectAtIndex:v6];
    }
LABEL_8:
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)_topBarThemeForItem:(id *)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2 + 145);
    uint64_t v2 = [WeakRetained tabOverview:v2 topBarThemeForItem:v3];
  }
  return v2;
}

- (id)_snapshotForItem:(BOOL *)a3 isBlank:
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id WeakRetained = objc_loadWeakRetained(v3 + 150);
    id v3 = [WeakRetained tabCollectionView:v3 snapshotForItem:v5];

    if (a3) {
      *a3 = v3 == 0;
    }
  }
  return v3;
}

- (uint64_t)_itemHasAdditionalHeaderHeight:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
    if (objc_opt_respondsToSelector()) {
      a1 = [WeakRetained tabCollectionView:a1 includesHeaderInSnapshotForItems:v3];
    }
    else {
      a1 = 1;
    }
  }
  return a1;
}

- (void)updateSnapshotForItem:(id)a3
{
  unint64_t v6 = (TabOverviewItem *)a3;
  uint64_t v4 = -[TabOverviewItem layoutInfo]((id *)&v6->super.isa);
  -[TabOverviewItemLayoutInfo updateSnapshot]((uint64_t)v4);

  id v5 = v6;
  if (self->_activeItem == v6)
  {
    -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)self, v6);
    id v5 = v6;
  }
}

- (double)_targetLocationForItemAtIndex:(uint64_t)a3 inNumberOfItems:(uint64_t)a4 insertionStyle:(unint64_t)a5 pinnedItemCount:
{
  if (!a1) {
    return 0.0;
  }
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:]((void *)a1, a3, a5);
  double v11 = v10;
  unint64_t v12 = -[TabOverview _tabsPerRow](a1);
  double v13 = -[TabOverview _itemReferenceBounds]((id *)a1);
  double v15 = v14;
  double v17 = v16;
  double v18 = v16 / v11;
  double v20 = v19 / v11;
  unint64_t v21 = [*(id *)(a1 + 1168) count];
  if (v21 <= 1) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = v21;
  }
  unint64_t v54 = v22;
  unint64_t v23 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, a2, a5);
  unint64_t v24 = v23 / v12;
  unint64_t v25 = v23 % v12;
  uint64_t v26 = *(void *)(a1 + 1224);
  double v27 = v13 + (double)(v23 % v12) * (v18 + v18 * dbl_1E123E350[v26 == 0]);
  if (v26)
  {
    -[TabOverview _isDismissibleSearchBarAvailable](a1);
  }
  else
  {
    double v27 = v27 + (v17 - -[TabOverview _totalWidthOfItemsWithCount:pinnedItemCount:]((void *)a1, a3, a5) / v11) * 0.5;
    double v28 = dbl_1E123E350[*(void *)(a1 + 1224) == 0];
    double v29 = -[TabOverview _effectiveSafeAreaInsets](a1) + v18 * v28;
    -[TabOverview _barInsets](a1);
    double v15 = v15 + -[TabOverview _titleHeight]((id *)a1) + v29 + v30;
    if (-[TabOverview _isDismissibleSearchBarAvailable](a1)) {
      double v15 = v15 + *(double *)(a1 + 1072);
    }
  }
  v55.origin.CGFloat x = v27;
  v55.origin.CGFloat y = v15;
  v55.size.CGFloat width = v18;
  v55.size.CGFloat height = v20;
  double Width = CGRectGetWidth(v55);
  if (!*(void *)(a1 + 1224))
  {
    double v53 = Width * 0.1;
    if (a2 >= a5)
    {
      double v38 = (double)(unint64_t)-[TabOverview _layoutIndexForItemIndexIgnoringPinnedItems:](a1, a5) / (double)v12;
      unint64_t v39 = vcvtpd_u64_f64(v38);
      double v52 = (double)(unint64_t)ceil(v38);
      [*(id *)(a1 + 1104) titlePadding];
      double v41 = v40;
      double v43 = v42;
      [*(id *)(a1 + 1104) titleHeight];
      double v51 = v53 + fmax(v43 + v41 + v44, 30.0);
      v56.origin.CGFloat x = v27;
      v56.origin.CGFloat y = v15;
      v56.size.CGFloat width = v18;
      v56.size.CGFloat height = v20;
      double Width = (v53 + CGRectGetHeight(v56)) * (double)(v24 - v39) + v52 * v51;
    }
    else
    {
      [*(id *)(a1 + 1104) titlePadding];
      double v34 = v33;
      double v36 = v35;
      [*(id *)(a1 + 1104) titleHeight];
      double Width = v53 + fmax(v36 + v34 + v37, 30.0);
    }
  }
  if (a4 == 1 && objc_msgSend((id)a1, "presentationState", Width) != 3)
  {
    double v45 = 30.0 / v11;
    double v46 = (1.0 - 1.0 / (30.0 / v11)) * v18 * 0.5;
    if (v25 >= v54) {
      double v46 = -0.0;
    }
    double v27 = v27 + v46;
    double v18 = v18 / v45;
    double v11 = v11 * v45;
  }
  int v47 = objc_msgSend((id)a1, "_sf_usesLeftToRightLayout", *(void *)&v51);
  double v48 = v17 - v27 - v18;
  if (v47) {
    double v48 = v27;
  }
  double v49 = -(v48 * v11);
  log(v11);
  return v49;
}

- (void)_didChangeVisibility:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 752) searchTerm];
    uint64_t v5 = [v4 length];

    if (!v5) {
      [*(id *)(a1 + 752) endSearching];
    }
    -[TabOverview _updateBorrowedContentView]((id *)a1);
    if (a2)
    {
      unint64_t v6 = -[TabOverviewItem layoutInfo](*(id **)(a1 + 480));
      unint64_t v7 = -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v6);

      if (v7)
      {
        unint64_t v8 = -[TabOverviewItem layoutInfo](*(id **)(a1 + 480));
        long double v9 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v8);
        -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v9, 0.0);
      }
      if ([*(id *)(a1 + 752) hasEmptyResults])
      {
        uint64_t v10 = 2;
      }
      else
      {
        if (!*(unsigned char *)(a1 + 1000)) {
          return;
        }
        uint64_t v10 = 1;
      }
    }
    else
    {
      if (!*(void *)(a1 + 1008)) {
        return;
      }
      uint64_t v10 = 0;
    }
    -[TabOverview _setExplanationViewVariant:animated:](a1, v10, 0);
  }
}

- (void)_setExplanationViewVariant:(int)a3 animated:
{
  if (a1 && (a2 || *(void *)(a1 + 1008)))
  {
    uint64_t v6 = [*(id *)(a1 + 680) text];
    unint64_t v7 = *(void **)(a1 + 1008);
    id v10 = (id)v6;
    if (v7)
    {
      [v7 setVariant:a2 query:v6];
    }
    else
    {
      unint64_t v8 = [[TabExplanationView alloc] initWithVariant:a2 query:v6];
      long double v9 = *(void **)(a1 + 1008);
      *(void *)(a1 + 1008) = v8;

      [(id)a1 bounds];
      objc_msgSend(*(id *)(a1 + 1008), "setFrame:");
      [(id)a1 insertSubview:*(void *)(a1 + 1008) atIndex:0];
    }
    *(_OWORD *)(a1 + 1016) = *MEMORY[0x1E4F1DB30];
    if (a2 || (a3 & 1) != 0)
    {
      if (a3) {
        [(id)a1 layoutBelowIfNeeded];
      }
      [*(id *)(a1 + 1008) setHidden:a2 == 0];
      *(unsigned char *)(a1 + 1032) = a2 != 0;
      [(id)a1 setNeedsLayout];
    }
    else
    {
      [*(id *)(a1 + 1008) setHidden:1];
    }
    -[TabOverview _updateAllowsInteractivePresentation](a1);
  }
}

- (double)_rubberbandOffsetForOffset:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 424) location];
  -[TabOverview _constrainLocation:](a1, a2, a3, v6, v7);
  double v9 = v8;
  -[TabOverview _scrollBounds]((void *)a1);
  if (!*(unsigned char *)(a1 + 659)) {
    return v9;
  }
  if (v10 >= 0.001)
  {
    double v11 = -v10;
    if (a2 >= v9) {
      double v11 = v10;
    }
    return v9 + (1.0 - 1.0 / ((a2 - v9) / v11 * 0.55 + 1.0)) * v11;
  }
  return a2;
}

- (void)_constrainLocation:(double)a3
{
  if (a1)
  {
    -[TabOverview _scrollBounds]((void *)a1);
    double v8 = v7;
    double v10 = v9;
    [(id)a1 _contentSize];
    double v12 = v11;
    if (-[TabOverview _isDismissibleSearchBarAvailable](a1))
    {
      double v13 = [*(id *)(a1 + 680) text];
      BOOL v14 = [v13 length] == 0;
    }
    else
    {
      double v13 = [(id)a1 title];
      BOOL v14 = [v13 length] != 0;
    }

    _SFCGRectGrowToSize();
    double v40 = exp(a5);
    CGFloat rect = v8;
    CGFloat v15 = v10;
    _SFCGRectGrowToSize();
    double v17 = v16;
    double v19 = v18;
    CGFloat v21 = v20;
    double v23 = v22;
    if (v14 && v12 < v10)
    {
      double v24 = -[TabOverview _titleHeight]((id *)a1);
      int isDismissibleSearchBar = -[TabOverview _isDismissibleSearchBarAvailable](a1);
      double v26 = 0.0;
      if (isDismissibleSearchBar) {
        double v26 = *(double *)(a1 + 1072);
      }
      double v23 = v23 + v24 + v26;
    }
    double v27 = -a2;
    double v28 = -a3;
    if (-[TabOverview _isDismissibleSearchBarAvailable](a1))
    {
      if (([*(id *)(a1 + 680) isFirstResponder] & 1) != 0
        || ([*(id *)(a1 + 680) text],
            double v29 = objc_claimAutoreleasedReturnValue(),
            uint64_t v30 = [v29 length],
            v29,
            v30))
      {
        CGFloat v31 = v17;
        double v32 = -[TabOverview _titleHeight]((id *)a1);
        v44.origin.CGFloat x = v31;
        double v19 = v19 + v32;
        v44.origin.CGFloat y = v19;
        v44.size.CGFloat width = v21;
        v44.size.CGFloat height = v23;
        double v33 = CGRectGetHeight(v44) - v32;
        double v17 = v31;
        double v28 = -a3;
        double v27 = -a2;
        v45.origin.CGFloat x = -a2;
        v45.origin.CGFloat y = -a3;
        v45.size.CGFloat width = rect;
        v45.size.CGFloat height = v15;
        double v23 = fmax(v33, CGRectGetHeight(v45));
      }
    }
    if ((objc_msgSend((id)a1, "_sf_usesLeftToRightLayout") & 1) == 0)
    {
      v46.origin.CGFloat x = v17;
      v46.origin.CGFloat y = v19;
      v46.size.CGFloat width = v21;
      v46.size.CGFloat height = v23;
      double v34 = v17;
      double Width = CGRectGetWidth(v46);
      v47.origin.CGFloat x = -[TabOverview _itemReferenceBounds]((id *)a1);
      double v17 = v34 - (Width - CGRectGetWidth(v47) * v40);
    }
    v48.origin.CGFloat x = v17;
    v48.origin.CGFloat y = v19;
    v48.size.CGFloat width = v21;
    v48.size.CGFloat height = v23;
    CGFloat v39 = v17;
    double MinX = CGRectGetMinX(v48);
    v49.origin.CGFloat x = v27;
    v49.origin.CGFloat y = v28;
    v49.size.CGFloat width = rect;
    v49.size.CGFloat height = v15;
    fmax(MinX - CGRectGetMinX(v49), 0.0);
    v50.origin.CGFloat x = v17;
    v50.origin.CGFloat y = v19;
    v50.size.CGFloat width = v21;
    v50.size.CGFloat height = v23;
    double MinY = CGRectGetMinY(v50);
    v51.origin.CGFloat x = v27;
    v51.origin.CGFloat y = v28;
    v51.size.CGFloat width = rect;
    v51.size.CGFloat height = v15;
    fmax(MinY - CGRectGetMinY(v51), 0.0);
    v52.origin.CGFloat x = v27;
    v52.origin.CGFloat y = v28;
    v52.size.CGFloat width = rect;
    v52.size.CGFloat height = v15;
    double MaxX = CGRectGetMaxX(v52);
    v53.origin.CGFloat x = v39;
    v53.origin.CGFloat y = v19;
    v53.size.CGFloat width = v21;
    v53.size.CGFloat height = v23;
    fmax(MaxX - CGRectGetMaxX(v53), 0.0);
    v54.origin.CGFloat x = v27;
    v54.origin.CGFloat y = v28;
    v54.size.CGFloat width = rect;
    v54.size.CGFloat height = v15;
    CGRectGetMaxY(v54);
    v55.origin.CGFloat x = v39;
    v55.origin.CGFloat y = v19;
    v55.size.CGFloat width = v21;
    v55.size.CGFloat height = v23;
    CGRectGetMaxY(v55);
  }
}

- (double)_offsetForRubberbandOffset:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 424) location];
  -[TabOverview _constrainLocation:](a1, a2, a3, v6, v7);
  double v9 = v8;
  -[TabOverview _scrollBounds]((void *)a1);
  if (v10 >= 0.001)
  {
    double v11 = -v10;
    if (a2 >= v9) {
      double v11 = v10;
    }
    double v12 = (a2 - v9) / v11 + -1.0;
    if (fabs(v12) >= 0.001) {
      return v9 + (-1.0 / v12 + -1.0) / 0.55 * v11;
    }
  }
  return a2;
}

- (double)_bottomEdgeOfTabs
{
  if (!a1) {
    return 0.0;
  }
  if (CGRectIsEmpty(*(CGRect *)(a1 + 904)))
  {
    if ([*(id *)(a1 + 752) isSearching])
    {
      uint64_t v2 = [*(id *)(a1 + 752) indexesMatchingSearchTerm];
      unint64_t v3 = [v2 lastIndex];
    }
    else if ([*(id *)(a1 + 1168) count])
    {
      unint64_t v3 = [*(id *)(a1 + 1168) count] - 1;
    }
    else
    {
      unint64_t v3 = 0;
    }
    double v8 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:](a1, v3, [*(id *)(a1 + 1168) count], 0, *(void *)(a1 + 1112));
    double v4 = -[TabOverview _rectForItemLocation:]((id *)a1, v8, v9, v10, v11);
  }
  else
  {
    double v4 = *(double *)(a1 + 904);
    uint64_t v5 = *(void *)(a1 + 912);
    uint64_t v6 = *(void *)(a1 + 920);
    uint64_t v7 = *(void *)(a1 + 928);
  }
  return CGRectGetMaxY(*(CGRect *)&v4);
}

- (CGSize)_contentSize
{
  double v4 = -[TabOverview _itemReferenceBounds]((id *)&self->super.super.super.isa);
  CGFloat v6 = v5;
  double v7 = v3;
  double v9 = v8;
  if (!self)
  {
    double v11 = -[TabOverview _bottomEdgeOfTabs](0);
    double v12 = 0.0;
    goto LABEL_5;
  }
  int64_t presentedTabLayout = self->_presentedTabLayout;
  if (presentedTabLayout == 1)
  {
    double v18 = v3 * (double)[(NSArray *)self->_items count];
    double v19 = v7 * dbl_1E123E350[self->_presentedTabLayout == 0];
    [(NSArray *)self->_items count];
    double v7 = v18 + v19 * (double)([(NSArray *)self->_items count] - 1);
    goto LABEL_10;
  }
  if (!presentedTabLayout)
  {
    double v11 = -[TabOverview _bottomEdgeOfTabs]((uint64_t)self);
    double v12 = dbl_1E123E350[self->_presentedTabLayout == 0];
LABEL_5:
    double v13 = v7 * v12;
    -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, [(NSArray *)self->_items count], self->_pinnedItemCount);
    double v15 = v11 + v13 / v14;
    double v16 = 0.0;
    if (self->_presentationState == 3)
    {
      [(TabOverview *)self bounds];
      double Height = CGRectGetHeight(v23);
      v24.origin.CGFloat x = v4;
      v24.origin.CGFloat y = v6;
      v24.size.CGFloat width = v7;
      v24.size.CGFloat height = v9;
      double v16 = fmax(Height - CGRectGetHeight(v24), 0.0);
    }
    double v9 = v15 + v16;
    if (self->_explanationViewVisible) {
      double v9 = fmax(v9, -[TabOverview _explanationViewVerticalOffset]((uint64_t)self) + self->_explanationViewSize.height);
    }
  }
LABEL_10:
  double v20 = v7;
  double v21 = v9;
  result.CGFloat height = v21;
  result.CGFloat width = v20;
  return result;
}

- (double)_explanationViewVerticalOffset
{
  if (!a1) {
    return 0.0;
  }
  [(id)a1 safeAreaInsets];
  double v3 = v2;
  if (!*(void *)(a1 + 1216)) {
    double v3 = v2 + *(double *)(a1 + 872);
  }
  double v4 = [(id)a1 title];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    [*(id *)(a1 + 696) bounds];
    return v3 + CGRectGetHeight(v7) + 88.0;
  }
  return v3;
}

+ (CGFloat)_itemReferenceBoundsForBounds:(CGFloat)a3
{
  self;
  v9.origin.CGFloat x = a1;
  v9.origin.CGFloat y = a2;
  v9.size.CGFloat width = a3;
  v9.size.CGFloat height = a4;
  CGRectGetHeight(v9);
  v10.origin.CGFloat x = a1;
  v10.origin.CGFloat y = a2;
  v10.size.CGFloat width = a3;
  v10.size.CGFloat height = a4;
  CGRectGetWidth(v10);
  return a1;
}

- (void)_itemAdditionalHeaderHeight
{
  if (a1 && *(double *)(a1 + 888) == 0.0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabCollectionViewItemHeaderHeightIncludedInSnapshot:a1];
    }
  }
}

- (CGFloat)_tabSpacing
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = -[TabOverview _tabsPerRow]((uint64_t)a1);
  double v3 = dbl_1E123E350[a1[153] == 0];
  [a1 bounds];
  return CGRectGetWidth(v5) * v3 / ((double)(unint64_t)v2 + (double)(unint64_t)(v2 + 1) * v3);
}

- (void)_didChangeDismissing:(uint64_t)a1
{
  if (a1)
  {
    double v4 = *(void **)(a1 + 448);
    BOOL v5 = [(id)a1 presentationState] != 3 && *(unsigned char *)(a1 + 657) == 0;
    [v4 setEnabled:v5];
    [*(id *)(a1 + 464) setEnabled:a2 ^ 1];
    [*(id *)(a1 + 672) setUserInteractionEnabled:a2 ^ 1];
    CGFloat v6 = -[TabOverviewItem layoutInfo](*(id **)(a1 + 480));
    CGRect v7 = -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v6);
    [v7 setUserInteractionEnabled:a2];

    if (((a2 ^ 1) & 1) == 0) {
      *(unsigned char *)(a1 + 1147) = 0;
    }
  }
}

- (void)_updateDisplayLink
{
  if ([(TabOverview *)self presentationState])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      if ([(TabOverview *)self presentationState] == 3
        && !self->_itemActivationTimer
        && ![(TabOverview *)self targetItemLiftsFromGrid])
      {
        interpolatedLocation = self->_interpolatedLocation;
        double v4 = [WeakRetained currentItemForTabOverview:self];
        -[TabOverviewInterpolatedLocation shiftTargetLocation:](interpolatedLocation, "shiftTargetLocation:", -[TabOverview _targetLocationForDismissalWithItem:]((uint64_t)self, v4));
      }
      -[TabOverview _updateBorrowedContentView]((id *)&self->super.super.super.isa);
    }
    int v5 = -[TabOverview _checkSteadyState]((uint64_t)self);
    if (((v5 ^ (self->_displayLink != 0)) & 1) == 0) {
      [(UIPointerInteraction *)self->_cursorInteraction invalidate];
    }
    if (v5)
    {
      self->_updatingAlternateItemPosition = 0;
      displayLink = self->_displayLink;
      if (displayLink)
      {
        [(CADisplayLink *)displayLink invalidate];
        CGRect v7 = self->_displayLink;
        self->_displayLink = 0;

        -[TabOverview _updatePresentationStateIfSteady]((uint64_t)self);
      }
      -[TabOverview _notifySteadyStateUpdatedIfNeeded]((uint64_t)self);
      if ([(NSMutableArray *)self->_deferredClosingItems count])
      {
        double v8 = (void *)[(NSMutableArray *)self->_deferredClosingItems copy];
        [(NSMutableArray *)self->_deferredClosingItems removeAllObjects];
        [WeakRetained tabOverview:self closeItems:v8];
      }
    }
    else
    {
      if (!self->_displayLink)
      {
        CGRect v9 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
        CGRect v10 = self->_displayLink;
        self->_displayLink = v9;

        CAFrameRateRange v20 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
        [(CADisplayLink *)self->_displayLink setHighFrameRateReason:1638402];
        double v11 = self->_displayLink;
        double v12 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        [(CADisplayLink *)v11 addToRunLoop:v12 forMode:*MEMORY[0x1E4F1C4B0]];

        self->_lastUpdateTime = 0.0;
      }
      activeItem = self->_activeItem;
      if (activeItem)
      {
        double v14 = activeItem;
      }
      else
      {
        double v14 = [WeakRetained currentItemForTabOverview:self];
      }
      double v15 = v14;
      double v16 = -[TabOverviewItem layoutInfo](v14);
      double v17 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v16);
      -[TabOverview _currentScalePercentageForItemAtLocation:]((uint64_t)self, v17);

      if (self->_presentationState == 1 && _SFEqualWithEpsilon()) {
        -[TabOverview _setPresentationState:]((uint64_t)self, 2);
      }

      -[TabOverview _notifySteadyStateUpdatedIfNeeded]((uint64_t)self);
    }
  }
}

- (uint64_t)_checkSteadyState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = *(void **)(a1 + 424);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __32__TabOverview__checkSteadyState__block_invoke;
  v16[3] = &unk_1E6D7ED98;
  v16[4] = a1;
  if (![v2 isInSteadyStateWithConstraints:v16]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = *(id *)(a1 + 432);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = -[TabOverviewItem layoutInfo](*(id **)(*((void *)&v12 + 1) + 8 * v7));
        int v9 = -[TabOverviewItemLayoutInfo interpolatedValuesAreSteady]((uint64_t)v8);

        if (!v9)
        {
          uint64_t v10 = 0;
          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_14:

  return v10;
}

- (void)_setPresentationState:(uint64_t)a1
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v4 = &OBJC_IVAR___CompletionList__safariShouldHandleCardSectionEngagement;
  if (*(void *)(a1 + 1152) == a2) {
    return;
  }
  uint64_t v5 = [(id)a1 presentationState];
  uint64_t v6 = [(id)a1 presentationState];
  uint64_t v7 = *(void *)(a1 + 1152);
  *(void *)(a1 + 1152) = a2;
  [*(id *)(a1 + 472) invalidate];
  BOOL v9 = a2 == 3 && *(unsigned char *)(a1 + 663) != 0;
  *(unsigned char *)(a1 + 663) = v9;
  uint64_t v10 = [(id)a1 presentationState];
  uint64_t v11 = [(id)a1 presentationState];
  uint64_t v12 = *(void *)(a1 + 1152);
  if ((v7 | 2) == 3) {
    goto LABEL_96;
  }
  if ((v12 | 2) == 3)
  {
    double v16 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E102C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PresentationAnimation", " isAnimation=YES ", buf, 2u);
    }
    goto LABEL_20;
  }
  if (v7 == 3)
  {
LABEL_96:
    if ((v12 | 2) != 3)
    {
      long long v13 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_signpost_enabled(v13))
      {
        if (*(void *)(a1 + 1152) == 2) {
          long long v14 = @"YES";
        }
        else {
          long long v14 = @"NO";
        }
        long long v15 = v14;
        *(_DWORD *)buf = 138412290;
        v89 = v15;
        _os_signpost_emit_with_name_impl(&dword_1E102C000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PresentationAnimation", "isPresented=%@", buf, 0xCu);
      }
    }
  }
LABEL_20:
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
  uint64_t v56 = v10;
  uint64_t v57 = v11;
  if (v5 == 3 && v10 != 3 && v11)
  {
    uint64_t v54 = v7;
    uint64_t v18 = v6;
    if (objc_opt_respondsToSelector()) {
      [WeakRetained tabCollectionViewDidCancelDismissal:a1];
    }
    id v19 = WeakRetained;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v20 = *(id *)(a1 + 408);
    uint64_t v21 = [v20 countByEnumeratingWithState:&v78 objects:v87 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v79 != v23) {
            objc_enumerationMutation(v20);
          }
          unint64_t v25 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v25 tabCollectionViewDidCancelDismissal:a1];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v78 objects:v87 count:16];
      }
      while (v22);
    }

    uint64_t v6 = v18;
    uint64_t v5 = 3;
    uint64_t v10 = v56;
    uint64_t v11 = v57;
    id WeakRetained = v19;
    uint64_t v4 = &OBJC_IVAR___CompletionList__safariShouldHandleCardSectionEngagement;
  }
  switch(a2)
  {
    case 0:
      -[TabOverview _updateBorrowedContentView]((id *)a1);
      [WeakRetained tabCollectionViewDidDismiss:a1];
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v26 = *(id *)(a1 + 408);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v58 objects:v82 count:16];
      if (!v27) {
        goto LABEL_88;
      }
      uint64_t v28 = v27;
      id v55 = WeakRetained;
      uint64_t v29 = v5;
      uint64_t v30 = *(void *)v59;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v59 != v30) {
            objc_enumerationMutation(v26);
          }
          double v32 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          if (objc_opt_respondsToSelector()) {
            [v32 tabCollectionViewDidDismiss:a1];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v58 objects:v82 count:16];
      }
      while (v28);
      goto LABEL_87;
    case 1:
      if (!v6)
      {
        uint64_t v54 = v7;
        id v33 = WeakRetained;
        [WeakRetained tabCollectionViewWillPresent:a1];
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v34 = *(id *)(a1 + 408);
        uint64_t v35 = [v34 countByEnumeratingWithState:&v74 objects:v86 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v75;
          do
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v75 != v37) {
                objc_enumerationMutation(v34);
              }
              CGFloat v39 = *(void **)(*((void *)&v74 + 1) + 8 * k);
              if (objc_opt_respondsToSelector()) {
                [v39 tabCollectionViewWillPresent:a1];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v74 objects:v86 count:16];
          }
          while (v36);
        }

        [(id)a1 setNeedsLayout];
        uint64_t v6 = 0;
        uint64_t v10 = v56;
        uint64_t v11 = v57;
        id WeakRetained = v33;
        uint64_t v4 = &OBJC_IVAR___CompletionList__safariShouldHandleCardSectionEngagement;
        uint64_t v7 = v54;
      }
      *(void *)(a1 + v4[109]) = v7;
      if (*(unsigned char *)(a1 + 440))
      {
        -[TabOverview _updateDisplayedItems](a1);
        *(unsigned char *)(a1 + 440) = 0;
      }
      objc_msgSend((id)a1, "layoutIfNeeded", v54);
      *(void *)(a1 + v4[109]) = 1;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id v26 = *(id *)(a1 + 432);
      uint64_t v40 = [v26 countByEnumeratingWithState:&v70 objects:v85 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v71;
        do
        {
          for (uint64_t m = 0; m != v41; ++m)
          {
            if (*(void *)v71 != v42) {
              objc_enumerationMutation(v26);
            }
            -[TabOverview _updateTargetLocationForDisplayedItem:](a1, *(void **)(*((void *)&v70 + 1) + 8 * m));
          }
          uint64_t v41 = [v26 countByEnumeratingWithState:&v70 objects:v85 count:16];
        }
        while (v41);
      }
      goto LABEL_88;
    case 2:
      [WeakRetained tabCollectionViewDidPresent:a1];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v26 = *(id *)(a1 + 408);
      uint64_t v44 = [v26 countByEnumeratingWithState:&v66 objects:v84 count:16];
      if (!v44) {
        goto LABEL_88;
      }
      uint64_t v45 = v44;
      id v55 = WeakRetained;
      uint64_t v29 = v5;
      uint64_t v46 = *(void *)v67;
      do
      {
        for (uint64_t n = 0; n != v45; ++n)
        {
          if (*(void *)v67 != v46) {
            objc_enumerationMutation(v26);
          }
          CGRect v48 = *(void **)(*((void *)&v66 + 1) + 8 * n);
          if (objc_opt_respondsToSelector()) {
            [v48 tabCollectionViewDidPresent:a1];
          }
        }
        uint64_t v45 = [v26 countByEnumeratingWithState:&v66 objects:v84 count:16];
      }
      while (v45);
      goto LABEL_87;
    case 3:
      if (!v6) {
        goto LABEL_89;
      }
      [WeakRetained tabCollectionViewWillDismiss:a1];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v26 = *(id *)(a1 + 408);
      uint64_t v49 = [v26 countByEnumeratingWithState:&v62 objects:v83 count:16];
      if (!v49) {
        goto LABEL_88;
      }
      uint64_t v50 = v49;
      id v55 = WeakRetained;
      uint64_t v29 = v5;
      uint64_t v51 = *(void *)v63;
      do
      {
        for (iuint64_t i = 0; ii != v50; ++ii)
        {
          if (*(void *)v63 != v51) {
            objc_enumerationMutation(v26);
          }
          CGRect v53 = *(void **)(*((void *)&v62 + 1) + 8 * ii);
          if (objc_opt_respondsToSelector()) {
            [v53 tabCollectionViewWillDismiss:a1];
          }
        }
        uint64_t v50 = [v26 countByEnumeratingWithState:&v62 objects:v83 count:16];
      }
      while (v50);
LABEL_87:
      uint64_t v5 = v29;
      uint64_t v10 = v56;
      uint64_t v11 = v57;
      id WeakRetained = v55;
LABEL_88:

LABEL_89:
      if ((v5 == 3) != (v10 == 3)) {
        -[TabOverview _didChangeDismissing:](a1, v10 == 3);
      }
      if ((v6 != 0) != (v11 != 0)) {
        -[TabOverview _didChangeVisibility:](a1, v11 != 0);
      }
      -[TabOverview _updateTabCloseRecognizer]((void *)a1);

      break;
    default:
      goto LABEL_89;
  }
}

- (void)_updatePresentationStateIfSteady
{
  if (a1 && !*(void *)(a1 + 416) && !*(unsigned char *)(a1 + 657))
  {
    if ([(id)a1 presentationState] == 3)
    {
      uint64_t v2 = 0;
    }
    else
    {
      if (*(void *)(a1 + 1152) != 1) {
        return;
      }
      uint64_t v2 = 2;
    }
    -[TabOverview _setPresentationState:](a1, v2);
  }
}

- (void)_notifySteadyStateUpdatedIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 1148);
    *(unsigned char *)(a1 + 1148) = -[TabOverview _checkSteadyState](a1);
    if (v2 != *(unsigned __int8 *)(a1 + 1148))
    {
      id v3 = [(id)a1 stateUpdateHandler];

      if (v3)
      {
        uint64_t v4 = [(id)a1 stateUpdateHandler];
        v4[2](v4, *(unsigned __int8 *)(a1 + 1148));
      }
      uint64_t v5 = [(id)a1 pptStateUpdateHandler];

      if (v5)
      {
        uint64_t v6 = [(id)a1 pptStateUpdateHandler];
        v6[2](v6, *(unsigned __int8 *)(a1 + 1148));
      }
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = *(id *)(a1 + 408);
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
            uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v12, "tabCollectionView:didChangeSteadyState:", a1, *(unsigned __int8 *)(a1 + 1148), (void)v13);
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
  }
}

void __32__TabOverview__checkSteadyState__block_invoke(uint64_t a1, double a2, double a3, double a4, long double a5)
{
}

- (void)_initializeIncomingItemIfNecessary:(void *)a3 fromItems:(void *)a4 oldItems:(uint64_t)a5 atPosition:(unsigned char *)a6 isIncoming:
{
  long long v62 = a2;
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    if (a6) {
      *a6 = 0;
    }
    -[TabOverviewItem setTabOverview:]((uint64_t)v62, (void *)a1);
    long long v13 = -[TabOverviewItem layoutInfo](v62);
    -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
    long long v14 = (TabOverviewInterpolatedLocation *)objc_claimAutoreleasedReturnValue();
    double v15 = dbl_1E123E360[a5 == 1];
    if (v14)
    {
      long long v16 = v14;
      [(TabOverviewInterpolatedLocation *)v14 setDecelerationFactor:dbl_1E123E360[a5 == 1]];
    }
    else
    {
      unint64_t v17 = [v11 indexOfObject:v62];
      int v18 = [v12 containsObject:v62];
      int v19 = v18;
      if (a6) {
        *a6 = v18 ^ 1;
      }
      if (v18)
      {
        uint64_t v20 = [v12 count];
        uint64_t v21 = [v12 allObjects];
        uint64_t v22 = 0;
      }
      else
      {
        uint64_t v20 = [v11 count];
        if ([v62 isPlaceholder])
        {
          uint64_t v22 = 0;
        }
        else if ([v62 dragState] == 3)
        {
          uint64_t v22 = 2;
        }
        else if (*(void *)(a1 + 1224) == 1)
        {
          uint64_t v22 = 2;
        }
        else
        {
          uint64_t v22 = 1;
        }
        uint64_t v21 = v11;
      }
      unint64_t v23 = countPinnedItems(v21);
      double v24 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:](a1, v17, v20, v22, v23);
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      if (v19) {

      }
      long long v16 = -[TabOverviewInterpolatedLocation initWithLocation:decelerationFactor:]([TabOverviewInterpolatedLocation alloc], "initWithLocation:decelerationFactor:", v24, v26, v28, v30, v15);
      -[TabOverviewItemLayoutInfo setInterpolatedLocation:]((uint64_t)v13, v16);
    }
    if ([v62 dragState] == 2)
    {
      CGFloat v31 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
      objc_msgSend(v31, "resetToLocation:", -[TabOverview _targetLocationForItem:inItems:](a1, v62, v11));

      double v32 = -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v13);
      id v33 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
      [v33 location];
      -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v32, v34);
    }
    uint64_t v35 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v13);
    uint64_t v36 = (void *)v35;
    if (v35)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v35, 0.962);
    }
    else
    {
      uint64_t v37 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:]([TabOverviewInterpolatedValue alloc], 1.0, 0.962);
      -[TabOverviewItemLayoutInfo setInterpolatedSnapshotAlpha:]((uint64_t)v13, v37);

      double v38 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v13);
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v38, 0.01);
    }
    uint64_t v39 = -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v13);
    uint64_t v40 = (void *)v39;
    if (v39)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v39, 0.988);
    }
    else
    {
      uint64_t v41 = [TabOverviewInterpolatedValue alloc];
      uint64_t v42 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);
      [*(id *)(a1 + 424) location];
      double v44 = exp(v43);
      double v45 = -[TabOverview _cornerRadiusForItemAtLocation:scale:ignoreTransitionProgress:](a1, v42, 0, v44);
      uint64_t v46 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:](v41, v45, 0.988);
      -[TabOverviewItemLayoutInfo setInterpolatedCornerRadius:]((uint64_t)v13, v46);

      _SFOnePixel();
      double v48 = v47;
      uint64_t v49 = -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v13);
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v49, v48);
    }
    uint64_t v50 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v13);
    uint64_t v51 = (void *)v50;
    if (v50)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v50, 0.988);
    }
    else
    {
      CGRect v52 = [TabOverviewInterpolatedValue alloc];
      double v53 = 0.0;
      if (*(void *)(a1 + 1224) != 1) {
        double v53 = 1.0;
      }
      uint64_t v54 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:](v52, v53, 0.988);
      -[TabOverviewItemLayoutInfo setInterpolatedHeightTransitionPercent:]((uint64_t)v13, v54);

      id v55 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v13);
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v55, 0.01);
    }
    uint64_t v56 = -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v13);
    uint64_t v57 = (void *)v56;
    if (v56)
    {
      -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:](v56, 0.988);
    }
    else
    {
      long long v58 = [TabOverviewInterpolatedValue alloc];
      [(TabOverviewInterpolatedLocation *)v16 location];
      long long v60 = -[TabOverviewInterpolatedValue initWithValue:decelerationFactor:](v58, v59, 0.988);
      -[TabOverviewItemLayoutInfo setInterpolatedBoundsLogScale:]((uint64_t)v13, v60);

      long long v61 = -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v13);
      -[TabOverviewInterpolatedValue setEpsilon:]((uint64_t)v61, 0.01);
    }
  }
}

- (double)_cornerRadiusForItemAtLocation:(int)a3 scale:(double)a4 ignoreTransitionProgress:
{
  id v7 = a2;
  if (a1)
  {
    uint64_t v8 = [(id)a1 traitCollection];
    [v8 displayCornerRadius];
    double v10 = v9;

    uint64_t v11 = *(void *)(a1 + 1224);
    if (v10 != 0.0 || v11 == 1) {
      double v13 = 0.0;
    }
    else {
      double v13 = 0.75;
    }
    if (v11 == 1) {
      double v14 = 0.1;
    }
    else {
      double v14 = 1.0;
    }
    if (v11 == 1) {
      double v15 = 0.0;
    }
    else {
      double v15 = v10;
    }
    uint64_t v32 = 0;
    id v33 = (double *)&v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    double v25 = __77__TabOverview__cornerRadiusForItemAtLocation_scale_ignoreTransitionProgress___block_invoke;
    double v26 = &unk_1E6D7EED8;
    if (a3) {
      double v16 = a4 * 15.0;
    }
    else {
      double v16 = v15;
    }
    double v29 = &v32;
    uint64_t v27 = a1;
    id v28 = v7;
    double v30 = v13;
    double v31 = v14;
    uint64_t v17 = *(void *)(a1 + 1224);
    *(void *)(a1 + 1224) = 0;
    v25((uint64_t)v24);
    *(void *)(a1 + 1224) = v17;
    if (*(unsigned char *)(a1 + 657))
    {
      double v18 = v33[3];
    }
    else
    {
      double v19 = v33[3];
      if (*(void *)(a1 + 1152) == 3)
      {
        BOOL v20 = v19 < 1.0;
        double v18 = 0.0;
        if (!v20) {
          double v18 = 1.0;
        }
      }
      else
      {
        BOOL v21 = v19 <= 0.0;
        double v18 = 0.0;
        if (!v21) {
          double v18 = 1.0;
        }
      }
      v33[3] = v18;
    }
    double v22 = v18 * 15.0 + v16 / a4 * (1.0 - v18);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    double v22 = 0.0;
  }

  return v22;
}

- (void)setItems:(id)a3 alternateItems:(id)a4 atPosition:(int64_t)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (NSArray *)a3;
  double v9 = (NSArray *)a4;
  double v10 = v9;
  if (self->_alternateItems == v9)
  {
    p_items = &self->_items;
    if (self->_items == v8) {
      goto LABEL_9;
    }
    char v12 = 1;
    goto LABEL_7;
  }
  BOOL v11 = -[NSArray isEqualToArray:](v9, "isEqualToArray:");
  char v12 = v11;
  p_items = &self->_items;
  if (self->_items != v8)
  {
LABEL_7:
    if (!-[NSArray isEqualToArray:](v8, "isEqualToArray:") || (v12 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (!v11) {
    goto LABEL_12;
  }
LABEL_9:
  if (self->_alternateItemPosition != a5)
  {
LABEL_12:
    double v48 = v10;
    self->_updatingAlternateItemPositiouint64_t n = self->_alternateItemPosition != a5;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    double v14 = *p_items;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v64 objects:v71 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v65 != v17) {
            objc_enumerationMutation(v14);
          }
          -[TabOverview _startClosingItem:]((uint64_t)self, *(void **)(*((void *)&v64 + 1) + 8 * i));
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v64 objects:v71 count:16];
      }
      while (v16);
    }

    uint64_t v49 = [MEMORY[0x1E4F1CA80] set];
    double v47 = (id *)p_items;
    uint64_t v50 = [MEMORY[0x1E4F1CAD0] setWithArray:*p_items];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v46 = v8;
    double v19 = v8;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v61;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v61 != v22) {
            objc_enumerationMutation(v19);
          }
          double v24 = *(TabOverviewItem **)(*((void *)&v60 + 1) + 8 * j);
          -[TabOverviewItem setIsAlternateItem:]((uint64_t)v24, 0);
          if (v24 != self->_swipeClosingItem) {
            -[TabOverviewItem setClosing:]((uint64_t)v24, 0);
          }
          char v59 = 0;
          -[TabOverview _initializeIncomingItemIfNecessary:fromItems:oldItems:atPosition:isIncoming:]((uint64_t)self, v24, v19, v50, 0, &v59);
          if (v59)
          {
            -[TabOverviewItem setIncoming:]((uint64_t)v24, 1);
            [v49 addObject:v24];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v21);
    }

    double v25 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_alternateItems];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    double v26 = v48;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v56;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v56 != v29) {
            objc_enumerationMutation(v26);
          }
          double v31 = *(void **)(*((void *)&v55 + 1) + 8 * k);
          -[TabOverviewItem setIsAlternateItem:]((uint64_t)v31, 1);
          -[TabOverviewItem setClosing:]((uint64_t)v31, 0);
          -[TabOverview _initializeIncomingItemIfNecessary:fromItems:oldItems:atPosition:isIncoming:]((uint64_t)self, v31, v26, v25, a5, 0);
        }
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v55 objects:v69 count:16];
      }
      while (v28);
    }

    self->_shouldBounceToConstrainedLocatiouint64_t n = 0;
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation setDecelerationFactor:0.988];
    uint64_t v32 = [(NSArray *)v19 copy];
    id v33 = *v47;
    id *v47 = (id)v32;

    uint64_t v34 = (NSArray *)[(NSArray *)v26 copy];
    alternateItems = self->_alternateItems;
    self->_alternateItems = v34;

    self->_alternateItemPositiouint64_t n = a5;
    -[TabOverview _updatePinnedItemCount]((uint64_t)self);
    [(TabOverview *)self setNeedsLayout];
    uint64_t v36 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v45 = 432;
    uint64_t v37 = self->_displayedItems;
    uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v52;
      do
      {
        for (uint64_t m = 0; m != v39; ++m)
        {
          if (*(void *)v52 != v40) {
            objc_enumerationMutation(v37);
          }
          uint64_t v42 = *(void **)(*((void *)&v51 + 1) + 8 * m);
          if ((objc_msgSend(v42, "isPlaceholder", v45) & 1) == 0
            && ([(NSArray *)v19 containsObject:v42]
             || [(NSArray *)v26 containsObject:v42]
             || -[TabOverviewItem closing]((BOOL)v42)))
          {
            if (([v36 containsObject:v42] & 1) == 0) {
              [v36 addObject:v42];
            }
          }
          else
          {
            -[TabOverview _removeViewsForItem:]((uint64_t)self, v42);
          }
        }
        uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v51 objects:v68 count:16];
      }
      while (v39);
    }

    long double v43 = (objc_class *)[v36 copy];
    double v44 = *(Class *)((char *)&self->super.super.super.isa + v45);
    *(Class *)((char *)&self->super.super.super.isa + v45) = v43;

    self->_displayedItemsNeedUpdate = 1;
    -[TabOverview _updateIndexesMatchingSearch]((uint64_t)self);
    if ((unint64_t)[*v47 count] <= 1
      && [(SFTabCollectionSearchController *)self->_searchController isSearching])
    {
      [(SFTabCollectionSearchController *)self->_searchController endSearching];
    }
    uint64_t v8 = v46;
    double v10 = v48;
    if ((objc_msgSend(MEMORY[0x1E4FB1EB0], "areAnimationsEnabled", v45) & 1) == 0)
    {
      [(TabOverview *)self layoutIfNeeded];
      [(TabOverview *)self endAnimation];
    }

    goto LABEL_57;
  }
  if (-[TabOverview _updatePinnedItemCount]((uint64_t)self)) {
    [(TabOverview *)self setNeedsLayout];
  }
LABEL_57:
}

- (BOOL)_updatePinnedItemCount
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = countPinnedItems(*(void **)(a1 + 1168));
  uint64_t v3 = countPinnedItems(*(void **)(a1 + 1168));
  BOOL v4 = *(void *)(a1 + 1112) != v2 || *(void *)(a1 + 1120) != v3;
  *(void *)(a1 + 1112) = v2;
  *(void *)(a1 + 1120) = v3;
  return v4;
}

- (void)_startClosingItem:(uint64_t)a1
{
  uint64_t v3 = a2;
  BOOL v4 = v3;
  if (a1)
  {
    if (!*(unsigned char *)(a1 + 664))
    {
      uint64_t v27 = v3;
      BOOL v5 = -[TabOverviewItem closing]((BOOL)v3);
      BOOL v4 = v27;
      if (!v5)
      {
        -[TabOverviewItem setClosing:]((uint64_t)v27, 1);
        uint64_t v6 = -[TabOverviewItem layoutInfo](v27);
        id v7 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v6);
        [v7 location];
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        double v15 = v14;
        -[TabOverviewItem layoutInfo](v27);
        uint64_t v16 = (double *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo setCloseLastLayoutLocation:](v16, v9, v11, v13, v15);

        double v17 = -[TabOverview _targetLocationForItem:inItems:](a1, v27, *(void **)(a1 + 1168));
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        -[TabOverviewItem layoutInfo](v27);
        double v24 = (double *)objc_claimAutoreleasedReturnValue();
        -[TabOverviewItemLayoutInfo setCloseStartLocation:](v24, v17, v19, v21, v23);

        double v25 = -[TabOverviewItem layoutInfo](v27);
        double v26 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v25);
        [v26 setDecelerationFactor:0.991];

        BOOL v4 = v27;
      }
    }
  }
}

- (void)_removeViewsForItem:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 640);
    uint64_t v3 = a2;
    LODWORD(v2) = [v2 containsObject:v3];
    -[TabOverviewItem layoutInfo](v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();

    -[TabOverviewItemLayoutInfo setVisibleInTabOverview:]((uint64_t)v4, (int)v2);
  }
}

- (void)_updateIndexesMatchingSearch
{
  if (a1)
  {
    char v2 = *(unsigned char *)(a1 + 761);
    *(unsigned char *)(a1 + 761) = 1;
    id v3 = objc_alloc_init(MEMORY[0x1E4F97FD8]);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__TabOverview__updateIndexesMatchingSearch__block_invoke;
    v7[3] = &unk_1E6D781E8;
    v7[4] = a1;
    char v8 = v2;
    [v3 setHandler:v7];
    int v4 = [*(id *)(a1 + 752) applySearchToItems:*(void *)(a1 + 1168)];
    if ([(id)a1 showsLockedPrivateBrowsingView])
    {
      if ([(id)a1 presentationState]) {
        uint64_t v5 = *(unsigned __int8 *)(a1 + 1000);
      }
      else {
        uint64_t v5 = 0;
      }
      -[TabOverview _setExplanationViewVariant:animated:](a1, v5, 0);
    }
    else if (v4 && [*(id *)(a1 + 752) isSearching])
    {
      [(id)a1 setNeedsLayout];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __43__TabOverview__updateIndexesMatchingSearch__block_invoke_2;
      v6[3] = &unk_1E6D77E20;
      v6[4] = a1;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
      -[TabOverview _updateAllowsInteractivePresentation](a1);
    }
  }
}

- (void)copyLocationFromItem:(id)a3 toItem:(id)a4
{
  uint64_t v6 = (id *)a4;
  id v7 = -[TabOverviewItem layoutInfo]((id *)a3);
  char v8 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
  double v9 = -[TabOverviewItem layoutInfo](v6);

  -[TabOverviewItemLayoutInfo setInterpolatedLocation:]((uint64_t)v9, v8);
  [(TabOverview *)self setNeedsLayout];
}

- (void)setItems:(id)a3
{
}

- (BOOL)isItemAnimating:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_itemToActivate == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v3 = -[TabOverviewItem layoutInfo]((id *)a3);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v4 = -[TabOverviewItemLayoutInfo interpolatedValues](v3);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!-[TabOverviewInterpolatedValue isInSteadyState](*(void *)(*((void *)&v11 + 1) + 8 * i)))
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    int v4 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v3);
    int v9 = objc_msgSend(v4, "isInSteadyStateWithConstraints:", 0, (void)v11) ^ 1;
LABEL_12:
  }
  return v9;
}

- (void)endAnimation
{
  if (self->_displayLink) {
    -[TabOverview _resetToSteadyState]((uint64_t)self);
  }
}

- (uint64_t)_resetToSteadyState
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    char v2 = *(void **)(result + 424);
    [v2 targetLocation];
    -[TabOverview _constrainLocation:](v1, v3, v4, v5, v6);
    objc_msgSend(v2, "resetToLocation:");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v23 = (void *)v1;
    id v7 = *(id *)(v1 + 432);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(id **)(*((void *)&v28 + 1) + 8 * i);
          long long v13 = -[TabOverviewItem layoutInfo](v12);
          long long v14 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);

          [v14 targetLocation];
          objc_msgSend(v14, "resetToLocation:");
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          double v15 = -[TabOverviewItem layoutInfo](v12);
          uint64_t v16 = -[TabOverviewItemLayoutInfo interpolatedValues](v15);

          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                double v22 = -[TabOverviewInterpolatedValue targetValue](v21);
                -[TabOverviewInterpolatedValue resetToValue:](v21, v22);
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v18);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    [v23 _updateDisplayLink];
    return [v23 setNeedsLayout];
  }
  return result;
}

- (void)copyGeometryFromTabOverview:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v4 = (id *)a3;
  p_items = (void **)&self->_items;
  NSUInteger v6 = [(NSArray *)self->_items count];
  id v7 = v4 + 146;
  if (v6 == [v4[146] count])
  {
    interpolatedLocatiouint64_t n = self->_interpolatedLocation;
    [v4[53] targetLocation];
    -[TabOverview _constrainLocation:]((uint64_t)self, v9, v10, v11, v12);
    -[TabOverviewInterpolatedLocation resetToLocation:](interpolatedLocation, "resetToLocation:");
    long long v13 = [MEMORY[0x1E4F1CA80] setWithArray:self->_displayedItems];
    long long v14 = *p_items;
    id v15 = *v7;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __43__TabOverview_copyGeometryFromTabOverview___block_invoke;
    v29[3] = &unk_1E6D7EDC0;
    id v16 = v13;
    id v30 = v16;
    objc_msgSend(v14, "safari_enumerateZippedValuesWithArray:withBlock:", v15, v29);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          double v22 = -[TabOverviewItem layoutInfo](*(id **)(*((void *)&v25 + 1) + 8 * v21));
          double v23 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v22);

          objc_msgSend(v23, "targetLocation", (void)v25);
          objc_msgSend(v23, "resetToLocation:");

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v19);
    }

    [(TabOverview *)self _updateDisplayLink];
    [(TabOverview *)self setNeedsLayout];
  }
  else
  {
    long long v24 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      [(TabOverview *)p_items copyGeometryFromTabOverview:v7];
    }
  }
}

void __43__TabOverview_copyGeometryFromTabOverview___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5 = a3;
  uint64_t v8 = a2;
  NSUInteger v6 = -[TabOverviewItem layoutInfo](v8);
  id v7 = -[TabOverviewItem layoutInfo](v5);

  -[TabOverviewItemLayoutInfo copyGeometryFromLayoutInfo:](v6, v7);
  [*(id *)(a1 + 32) removeObject:v8];
}

- (void)setInteractiveInsertionProgress:(double)a3 forItem:(id)a4
{
  uint64_t v8 = (id *)a4;
  if (-[TabOverviewItem incoming]((BOOL)v8))
  {
    NSUInteger v6 = -[TabOverviewItem layoutInfo](v8);
    -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v6, a3);

    id v7 = -[TabOverviewItem layoutInfo](v8);
    -[TabOverviewItemLayoutInfo setInteractivelyInserted:]((uint64_t)v7, 1);

    [(TabOverview *)self setNeedsLayout];
  }
}

- (void)_updateDisplayedItems
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    char v2 = [MEMORY[0x1E4F1CA48] array];
    double v3 = [MEMORY[0x1E4F1CA80] set];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v4 = *(id *)(a1 + 432);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v58;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v58 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(id **)(*((void *)&v57 + 1) + 8 * i);
          if (-[TabOverviewItem closing]((BOOL)v9))
          {
            double v10 = -[TabOverviewItem layoutInfo](v9);
            BOOL v11 = -[TabOverviewItemLayoutInfo visibleInTabOverview]((BOOL)v10);

            if (v11) {
              continue;
            }
          }
          [v3 addObject:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v6);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v12 = *(id *)(a1 + 1168);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v54 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v53 + 1) + 8 * j);
          [v2 addObject:v17];
          [v3 removeObject:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v14);
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v18 = *(id *)(a1 + 1176);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v50 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v49 + 1) + 8 * k);
          [v2 addObject:v23];
          [v3 removeObject:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v20);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v24 = *(id *)(a1 + 432);
    uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v46;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = *(void **)(*((void *)&v45 + 1) + 8 * m);
          if ([v3 containsObject:v29])
          {
            -[TabOverview _removeViewsForItem:](a1, v29);
          }
          else if (([v2 containsObject:v29] & 1) == 0)
          {
            [v2 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v62 count:16];
      }
      while (v26);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v2;
    uint64_t v30 = [obj countByEnumeratingWithState:&v41 objects:v61 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v42;
      do
      {
        for (uint64_t n = 0; n != v31; ++n)
        {
          if (*(void *)v42 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = *(void **)(*((void *)&v41 + 1) + 8 * n);
          BOOL v35 = -[TabOverviewItem isAlternateItem]((BOOL)v34);
          uint64_t v36 = *(void *)(a1 + 1224);
          if (v35) {
            uint64_t v37 = 0;
          }
          else {
            uint64_t v37 = *(void *)(a1 + 1224);
          }
          *(void *)(a1 + 1224) = v37;
          -[TabOverview _updateTargetLocationForDisplayedItem:](a1, v34);
          *(void *)(a1 + 1224) = v36;
          -[TabOverview _layoutDisplayedItem:forceVisible:](a1, v34, 0);
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v41 objects:v61 count:16];
      }
      while (v31);
    }

    uint64_t v38 = [obj copy];
    uint64_t v39 = *(void **)(a1 + 432);
    *(void *)(a1 + 432) = v38;
  }
}

- (void)_updateTargetLocationForDisplayedItem:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_71;
  }
  -[TabOverview _updateSnapshotAlphaForItem:](a1, v3);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
  [(id)a1 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = -[TabOverviewItem layoutInfo]((id *)v3);
  uint64_t v14 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v13);

  uint64_t v15 = -[TabOverview _itemsContainingItem:]((char *)a1, v3);
  if (*(id *)(a1 + 624) == v3)
  {
    id v24 = -[TabOverviewItem layoutInfo]((id *)v3);
    double started = -[TabOverviewItemLayoutInfo closeStartLocation]((uint64_t)v24);
    double v19 = v26;
    double v21 = v27;
    long double v23 = v28;

    double v17 = started - *(double *)(a1 + 616);
    goto LABEL_7;
  }
  if (-[TabOverviewItem closing]((BOOL)v3))
  {
    id v16 = -[TabOverviewItem layoutInfo]((id *)v3);
    double v17 = -[TabOverviewItemLayoutInfo closeStartLocation]((uint64_t)v16);
    double v19 = v18;
    double v21 = v20;
    long double v23 = v22;

    if ([v3 dragState] == 1)
    {
      double v21 = -500.0;
    }
    else
    {
      long long v63 = -[TabOverviewItem layoutInfo]((id *)v3);
      long long v64 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v63);
      [v64 targetLocation];
      double v66 = v65;

      LODWORD(v63) = objc_msgSend((id)a1, "_sf_usesLeftToRightLayout");
      v102.origin.CGFloat x = v6;
      v102.origin.CGFloat y = v8;
      v102.size.CGFloat width = v10;
      v102.size.CGFloat height = v12;
      double Width = CGRectGetWidth(v102);
      if (v63) {
        double v17 = fmax(v66, Width * 1.3);
      }
      else {
        double v17 = fmin(v66, exp(v23) * Width * -1.2);
      }
    }
    goto LABEL_7;
  }
  if (*(void *)(a1 + 1224) || ![(id)a1 targetItemLiftsFromGrid]) {
    goto LABEL_79;
  }
  uint64_t v40 = (id *)(id)a1;
  if ([v40 presentationState] == 1)
  {

LABEL_79:
    id v69 = *(id *)(a1 + 496);
    if (v69)
    {
      if (v69 == v3)
      {
        long long v81 = -[TabOverviewItem layoutInfo]((id *)v3);
        v82 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v81);
        [v82 targetLocation];
        double v17 = v83;
        double v19 = v84;
        double v21 = v85;
        long double v23 = v86;
      }
      else
      {
        double v17 = -[TabOverview _targetLocationForItem:inItems:](a1, v3, v15);
        double v19 = v70;
        double v21 = v71;
        long double v23 = v72;
        if (!-[TabOverviewItem isAlternateItem]((BOOL)v3))
        {
          long long v73 = -[TabOverviewItem layoutInfo](*(id **)(a1 + 496));
          long long v74 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v73);
          double v75 = fmax(fmin(1.0 - -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v74), 1.0), 0.0);

          double v21 = v75 * -150.0;
        }
      }
      goto LABEL_7;
    }
    double v17 = -[TabOverview _targetLocationForItem:inItems:](a1, v3, v15);
    double v19 = v76;
    double v21 = v77;
    long double v23 = v78;
    if (*(void *)(a1 + 1224) != 1) {
      goto LABEL_7;
    }
    uint64_t v79 = a1;
LABEL_85:
    -[TabOverview _itemHeaderHeight](v79);
    double v19 = v19 - v80;
    goto LABEL_7;
  }
  uint64_t v68 = [v40 presentationState];

  if (v68 == 2) {
    goto LABEL_79;
  }
  id v87 = v40[60];
  if (v87)
  {
    if (v87 != v3) {
      goto LABEL_89;
    }
LABEL_93:
    if (v40[144]) {
      [v40[53] targetLocation];
    }
    else {
      double v92 = -[TabOverview _targetLocationForPresentation]((uint64_t)v40);
    }
    double v17 = v92;
    double v19 = v93;
    double v21 = v94;
    long double v23 = v95;
    uint64_t v79 = (uint64_t)v40;
    goto LABEL_85;
  }
  id v91 = [WeakRetained currentItemForTabOverview:v40];

  if (v91 == v3) {
    goto LABEL_93;
  }
LABEL_89:
  double v17 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)v40, v3, v15);
  double v19 = v88;
  double v21 = v89;
  long double v23 = v90;
  if (!-[TabOverviewItem isAlternateItem]((BOOL)v3)) {
    double v21 = -150.0;
  }
LABEL_7:
  if (v15 == *(void **)(a1 + 1176))
  {
    double v17 = -[TabOverview _applyItemPosition:toLocation:]((id *)a1, *(void *)(a1 + 1184), v17, v19, v21, v23);
    double v19 = v29;
    double v21 = v30;
    long double v23 = v31;
  }
  if (-[TabOverviewItem closing]((BOOL)v3) && ![v3 dragState]
    || *(id *)(a1 + 1192) == v3 && *(unsigned char *)(a1 + 1147) && [(id)a1 presentationState] != 3)
  {
    double v21 = v21 + 100.0;
  }
  uint64_t v32 = -[TabOverviewItem layoutInfo]((id *)v3);
  BOOL v33 = -[TabOverviewItemLayoutInfo interactivelyInserted]((BOOL)v32);

  if (v33)
  {
    if (-[TabOverviewItem closing]((BOOL)v3)
      || (-[TabOverviewItem layoutInfo]((id *)v3),
          uint64_t v34 = objc_claimAutoreleasedReturnValue(),
          double v35 = -[TabOverviewItemLayoutInfo interactiveInsertionProgress]((uint64_t)v34),
          v34,
          v35 < 1.0))
    {
      [(id)a1 targetItemLiftsFromGrid];
      _SFInterpolate();
      double v21 = fmin(v21, v36);
    }
    if (*(void *)(a1 + 1224) == 1)
    {
      [*(id *)(a1 + 424) location];
      double v38 = exp(v23 - v37);
      [*(id *)(a1 + 424) location];
      double v17 = v38 * v39;
    }
  }
  if ([(id)a1 presentationState]
    && (!-[TabOverviewItem isAlternateItem]((BOOL)v3) || *(unsigned char *)(a1 + 658)))
  {
    if (*(unsigned char *)(a1 + 761) || -[TabOverviewItem incoming]((BOOL)v3) && *(void *)(a1 + 1224) == 1) {
      objc_msgSend(v14, "shiftTargetLocation:", v17, v19, v21, (double)v23);
    }
    else {
      objc_msgSend(v14, "setTargetLocation:", v17, v19, v21, (double)v23);
    }
  }
  else
  {
    objc_msgSend(v14, "resetToLocation:", v17, v19, v21, (double)v23);
  }
  if ([v3 isPinned]) {
    int v41 = [(id)a1 targetItemLiftsFromGrid] ^ 1;
  }
  else {
    int v41 = 0;
  }
  [*(id *)(a1 + 424) location];
  double v43 = exp(v42);
  double v44 = -[TabOverview _cornerRadiusForItemAtLocation:scale:ignoreTransitionProgress:](a1, v14, v41, v43);
  uint64_t v45 = [(id)a1 presentationState];
  long long v46 = -[TabOverviewItem layoutInfo]((id *)v3);
  uint64_t v47 = -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v46);
  long long v48 = (void *)v47;
  if (v45) {
    -[TabOverviewInterpolatedValue setTargetValue:](v47, v44);
  }
  else {
    -[TabOverviewInterpolatedValue resetToValue:](v47, v44);
  }

  int v49 = [(id)a1 targetItemLiftsFromGrid];
  long long v50 = *(void **)(a1 + 480);
  id v51 = v50;
  if (!v50)
  {
    id v51 = [WeakRetained currentItemForTabOverview:a1];
  }
  if (v51 != v3)
  {
    BOOL v52 = 0;
    if (v50) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  id v58 = (id)a1;
  BOOL v52 = [v58 presentationState] != 1 && objc_msgSend(v58, "presentationState") != 2;

  if (!v50) {
LABEL_44:
  }

LABEL_45:
  if (*(id *)(a1 + 496) == v3) {
    char v53 = 0;
  }
  else {
    char v53 = v49;
  }
  if ((v53 & 1) == 0)
  {
    long long v56 = -[TabOverviewItem layoutInfo]((id *)v3);
    long long v57 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v56);
    double v55 = fmax(fmin(-[TabOverview _currentScalePercentageForItemAtLocation:](a1, v57), 1.0), 0.0);
LABEL_60:

    goto LABEL_61;
  }
  char v54 = *(void *)(a1 + 1152) != 3 || v52;
  if ((v54 & 1) == 0)
  {
    long long v56 = -[TabOverviewItem layoutInfo]((id *)v3);
    long long v57 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v56);
    double v55 = -[TabOverviewInterpolatedValue targetValue]((uint64_t)v57);
    goto LABEL_60;
  }
  if (*(void *)(a1 + 1224)) {
    double v55 = 0.0;
  }
  else {
    double v55 = (double)!v52;
  }
LABEL_61:
  if ([(id)a1 presentationState] && (*(id *)(a1 + 496) != v3 ? (int v59 = v49) : (int v59 = 0), v59 == 1))
  {
    long long v60 = -[TabOverviewItem layoutInfo]((id *)v3);
    long long v61 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v60);
    -[TabOverviewInterpolatedValue setTargetValue:]((uint64_t)v61, v55);
  }
  else
  {
    long long v60 = -[TabOverviewItem layoutInfo]((id *)v3);
    long long v61 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v60);
    -[TabOverviewInterpolatedValue resetToValue:]((uint64_t)v61, v55);
  }

  if (!-[TabOverviewItem closing]((BOOL)v3))
  {
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v97 = __53__TabOverview__updateTargetLocationForDisplayedItem___block_invoke;
    v98 = &unk_1E6D78980;
    uint64_t v99 = a1;
    id v100 = v15;
    id v101 = v3;
    uint64_t v62 = *(void *)(a1 + 1224);
    *(void *)(a1 + 1224) = 0;
    v97((uint64_t)v96);
    *(void *)(a1 + 1224) = v62;
  }
LABEL_71:
}

- (id)targetItemForDropAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  long double v13 = v12;
  long double v14 = exp(v12);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __40__TabOverview_targetItemForDropAtPoint___block_invoke;
  v17[3] = &unk_1E6D7EDE8;
  v17[4] = self;
  *(long double *)&v17[5] = v14;
  v17[6] = v7;
  v17[7] = v9;
  v17[8] = v11;
  *(long double *)&v17[9] = v13;
  *(CGFloat *)&v17[10] = x;
  *(CGFloat *)&v17[11] = y;
  uint64_t v15 = -[TabOverview _closestItemWithDistanceCalculationBlock:](self, v17);
  return v15;
}

double __40__TabOverview_targetItemForDropAtPoint___block_invoke(uint64_t a1, id *a2)
{
  id v3 = *(id **)(a1 + 32);
  id v4 = -[TabOverviewItem layoutInfo](a2);
  double v5 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v4);
  [v5 targetLocation];
  double v10 = -[TabOverview _rectForItemLocation:](v3, v6, v7, v8, v9);
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  double v17 = *(double *)(a1 + 40);
  CGFloat v18 = *(double *)(a1 + 48) + v10 * v17;
  CGFloat v19 = *(double *)(a1 + 56) + v12 * v17;
  v23.origin.CGFloat x = v18;
  v23.origin.CGFloat y = v19;
  v23.size.CGFloat width = v14;
  v23.size.CGFloat height = v16;
  double MidX = CGRectGetMidX(v23);
  v24.origin.CGFloat x = v18;
  v24.origin.CGFloat y = v19;
  v24.size.CGFloat width = v14;
  v24.size.CGFloat height = v16;
  CGFloat MidY = CGRectGetMidY(v24);
  return (*(double *)(a1 + 88) - MidY) * (*(double *)(a1 + 88) - MidY)
       + (*(double *)(a1 + 80) - MidX) * (*(double *)(a1 + 80) - MidX);
}

- (void)_closestItemWithDistanceCalculationBlock:(void *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v12 = 0;
    double v13 = &v12;
    uint64_t v14 = 0x3032000000;
    double v15 = __Block_byref_object_copy__16;
    CGFloat v16 = __Block_byref_object_dispose__16;
    id v17 = 0;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v11[3] = 0x7FEFFFFFFFFFFFFFLL;
    double v5 = (void *)a1[146];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__TabOverview__closestItemWithDistanceCalculationBlock___block_invoke;
    v7[3] = &unk_1E6D7EFC8;
    v7[4] = a1;
    id v8 = v3;
    long double v9 = v11;
    double v10 = &v12;
    [v5 enumerateObjectsUsingBlock:v7];
    a1 = (id)v13[5];

    _Block_object_dispose(v11, 8);
    _Block_object_dispose(&v12, 8);
  }
  return a1;
}

- (int64_t)itemDragContentType
{
  return 6;
}

- (ReorderingAutoscroller)reorderingAutoscroller
{
  reorderingAutoscroller = self->_reorderingAutoscroller;
  if (!reorderingAutoscroller)
  {
    id v4 = objc_alloc_init(ReorderingAutoscroller);
    double v5 = self->_reorderingAutoscroller;
    self->_reorderingAutoscroller = v4;

    [(ReorderingAutoscroller *)self->_reorderingAutoscroller setDelegate:self];
    reorderingAutoscroller = self->_reorderingAutoscroller;
  }
  return reorderingAutoscroller;
}

- (id)_itemAtPoint:(CGFloat)a3
{
  if (!a1
    || ([a1[84] frame], v33.CGFloat x = a2, v33.y = a3, CGRectContainsPoint(v35, v33))
    || (uint64_t v6 = [a1[146] count]) == 0)
  {
LABEL_11:
    double v10 = 0;
    goto LABEL_12;
  }
  uint64_t v7 = v6 - 1;
  while (1)
  {
    if ([a1[94] isSearching])
    {
      id v8 = [a1[94] indexesMatchingSearchTerm];
      int v9 = [v8 containsIndex:v7];

      if (!v9) {
        goto LABEL_10;
      }
    }
    double v10 = [a1[146] objectAtIndex:v7];
    -[TabOverviewItem layoutInfo](v10);
    double v11 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[TabOverviewItemLayoutInfo itemView](v11);

    if (v12)
    {
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      [v12 _touchInsets];
      CGFloat v22 = v14 + v21;
      CGFloat v24 = v16 + v23;
      CGFloat v26 = v18 - (v21 + v25);
      CGFloat v28 = v20 - (v23 + v27);
      objc_msgSend(a1, "convertPoint:toView:", v12, a2, a3);
      v34.CGFloat x = v29;
      v34.CGFloat y = v30;
      v36.origin.CGFloat x = v22;
      v36.origin.CGFloat y = v24;
      v36.size.CGFloat width = v26;
      v36.size.CGFloat height = v28;
      if (CGRectContainsPoint(v36, v34)) {
        break;
      }
    }

LABEL_10:
    if (--v7 == -1) {
      goto LABEL_11;
    }
  }

LABEL_12:
  return v10;
}

- (id)viewForItem:(id)a3
{
  id v4 = (id *)a3;
  -[TabOverviewItem tabOverview](v4);
  double v5 = (TabOverview *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[TabOverview _layoutDisplayedItem:forceVisible:]((uint64_t)self, v4, 1);
    -[TabOverviewItem layoutInfo](v4);
    uint64_t v7 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[TabOverviewItemLayoutInfo itemView](v7);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_layoutDisplayedItem:(char)a3 forceVisible:
{
  double v5 = a2;
  if (!a1) {
    goto LABEL_56;
  }
  [*(id *)(a1 + 424) location];
  double v7 = v6;
  long double v9 = exp(v8);
  double v10 = -[TabOverviewItem layoutInfo](v5);
  double v11 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v10);

  [v11 location];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  double v17 = v16;
  long double v19 = v18;
  double v127 = exp(v18);
  double v20 = -[TabOverviewItem layoutInfo](v5);
  double v21 = -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v20);
  double v22 = -[TabOverviewInterpolatedValue value]((uint64_t)v21);
  double v23 = exp(v22);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
  double v25 = *(void **)(a1 + 480);
  v123 = WeakRetained;
  char v117 = a3;
  double v120 = v7;
  if (v25)
  {
    CGFloat v26 = v25;
  }
  else
  {
    CGFloat v26 = [WeakRetained currentItemForTabOverview:a1];
  }
  double v27 = v26;
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __49__TabOverview__layoutDisplayedItem_forceVisible___block_invoke;
  v134[3] = &unk_1E6D7EEB0;
  v134[4] = a1;
  CGFloat v28 = v5;
  v135 = v28;
  v122 = v27;
  v124 = v27;
  v136 = v124;
  uint64_t v137 = v13;
  uint64_t v138 = v15;
  double v139 = v17;
  long double v140 = v19;
  double v141 = v127;
  long double v142 = v9;
  CGFloat v29 = (double (**)(double))MEMORY[0x1E4E42950](v134);
  CGFloat v30 = v29[2](v127);
  CGFloat v119 = v9;
  double v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  double v125 = v23;
  double v37 = ((double (*)(double (**)(double), double))v29[2])(v29, v23);
  double v126 = v17;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  double v44 = -[TabOverviewItem layoutInfo](v28);
  CGFloat v45 = v37;
  double v46 = v126;
  -[TabOverviewItemLayoutInfo setFrame:]((uint64_t)v44, v45, v39, v41, v43);

  double v47 = v126 - v120 + fmin(v32 / -[TabOverview _bottomEdgeOfTabs](a1), 1.0);
  uint64_t v48 = [v28 dragState];
  memset(&v133, 0, sizeof(v133));
  CGFloat v118 = v32;
  if (v48 == 1 || [v28 dragState] == 3)
  {
    -[TabOverview _thumbnailTransformForFrame:withScale:atZPosition:]((CATransform3D *)a1, (uint64_t)&v133, v30, v32, v34, v36, v119, v47 - v126);
  }
  else
  {
    -[TabOverview _thumbnailTransformForFrame:withScale:atZPosition:]((CATransform3D *)a1, (uint64_t)&v132, v30, v32, v34, v36, v119, v47);
    CATransform3D v133 = v132;
  }
  CGFloat v49 = v30;
  double v50 = v125;
  int shouldDimItemsFor = -[TabOverview _shouldDimItemsForSearch](a1);
  double v52 = 0.0;
  double v53 = 0.5;
  if (!shouldDimItemsFor) {
    double v53 = 0.0;
  }
  double v54 = fmax(1.0 - 200.0 / (200.0 - v126), 0.0) + v53;
  double v55 = -[TabOverviewItem layoutInfo](v28);
  -[TabOverviewItemLayoutInfo setDimmingAlpha:animated:]((uint64_t)v55, *(unsigned char *)(a1 + 760), v54);

  if (-[TabOverview _itemShouldBeTransparent:](a1, v28) == 0.0)
  {
    if ([(id)a1 targetItemLiftsFromGrid])
    {
      long long v56 = -[TabOverviewItem layoutInfo](v124);
      long long v57 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v56);
      -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v57);
      _SFClamp();

      _SFInterpolate();
    }
    _SFClampPercent();
    double v59 = v58;
    [(id)a1 bounds];
    uint64_t v60 = SFTabOverviewMaximumNumberOfColumns();
    -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:]((void *)a1, v60, 0);
    _SFClampPercent();
    double v61 = 1.0;
    double v63 = v59 * (1.0 - v62);
    if (v48 == 1) {
      double v61 = 0.5;
    }
    double v52 = v61 * v63;
  }
  long long v64 = -[TabOverviewItem layoutInfo](v28);
  -[TabOverviewItemLayoutInfo setAlpha:]((uint64_t)v64, v52);

  if (*(id **)(a1 + 480) == v28)
  {
    CATransform3DMakeScale(&v131, 1.0 / v125, 1.0 / v125, 1.0);
    double v65 = -[TabOverviewItem layoutInfo](v28);
    double v66 = -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v65);
    long long v67 = [v66 layer];
    CATransform3D v130 = v131;
    [v67 setTransform:&v130];
  }
  uint64_t v68 = -[TabOverviewItem layoutInfo](v28);
  id v69 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v68);
  double v70 = -[TabOverviewInterpolatedValue value]((uint64_t)v69);
  double v71 = -[TabOverviewItem layoutInfo](v28);
  -[TabOverviewItemLayoutInfo setSnapshotAlpha:]((uint64_t)v71, v70);

  double v72 = -[TabOverviewItem layoutInfo](v28);
  BOOL v73 = -[TabOverviewItemLayoutInfo snapshotAlpha]((uint64_t)v72) == 1.0;
  long long v74 = -[TabOverviewItem layoutInfo](v28);
  double v75 = -[TabOverviewItemLayoutInfo borrowedContentView]((uint64_t)v74);
  [v75 setHidden:v73];

  if (CGFloatIsValid() && CGFloatIsValid())
  {
    double v121 = v47;
    CATransform3D v132 = v133;
    CA_CGRectApplyTransform();
    CGRect v144 = CGRectOffset(v143, v49, v118);
    double x = v144.origin.x;
    double y = v144.origin.y;
    double width = v144.size.width;
    double height = v144.size.height;
    [(id)a1 bounds];
    CGFloat v81 = v80;
    CGFloat v83 = v82;
    CGFloat v85 = v84;
    CGFloat v87 = v86;
    objc_msgSend(*(id *)(a1 + 728), "convertRect:toView:", a1, x, y, width, height);
    v146.origin.double x = v88;
    v146.origin.double y = v89;
    v146.size.double width = v90;
    v146.size.double height = v91;
    v145.origin.double x = v81;
    v145.origin.double y = v83;
    v145.size.double width = v85;
    v145.size.double height = v87;
    if (CGRectIntersectsRect(v145, v146))
    {
      double v92 = -[TabOverviewItem layoutInfo](v28);
      BOOL v93 = -[TabOverviewItemLayoutInfo alpha]((uint64_t)v92) > 0.0;
    }
    else
    {
      BOOL v93 = 0;
    }
    double v50 = v125;
    double v46 = v126;
    double v47 = v121;
  }
  else
  {
    BOOL v93 = 0;
  }
  if (-[TabOverviewItem isAlternateItem]((BOOL)v28))
  {
    double v94 = -[TabOverviewItem layoutInfo](v28);
    double v95 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v94);
    char v96 = [v95 isInSteadyStateWithConstraints:0];
  }
  else
  {
    char v96 = 0;
  }
  if ([v28 dragState] == 2)
  {
    BOOL v97 = 1;
    if ((v96 & 1) == 0)
    {
LABEL_31:
      int v98 = [v28 isPlaceholder];
      int v99 = v98 ^ 1;
      if (((v98 | (v93 || v97)) & 1) == 0 && (v117 & 1) == 0)
      {
        int v100 = [*(id *)(a1 + 640) containsObject:v28];
        if (v48 == 1) {
          int v99 = 0;
        }
        else {
          int v99 = v100;
        }
      }
      goto LABEL_38;
    }
  }
  else
  {
    BOOL v97 = [v28 dragState] == 3;
    if ((v96 & 1) == 0) {
      goto LABEL_31;
    }
  }
  int v99 = 0;
LABEL_38:
  id v101 = -[TabOverviewItem layoutInfo](v28);
  -[TabOverviewItemLayoutInfo setVisibleInTabOverview:]((uint64_t)v101, v99);

  CATransform3D v132 = v133;
  CATransform3DScale(&v129, &v132, v50 / v127, v50 / v127, 1.0);
  CGRect v102 = -[TabOverviewItem layoutInfo](v28);
  CATransform3D v128 = v129;
  -[TabOverviewItemLayoutInfo setTransform:]((uint64_t)v102, &v128);

  if ([(id)a1 targetItemLiftsFromGrid]
    && ((*(void *)(a1 + 1152) | 2) == 3 || *(void *)(a1 + 496))
    && v46 >= 0.0
    && v122 == v5)
  {
    double v47 = 999.0;
  }
  v103 = -[TabOverviewItem layoutInfo](v28);
  -[TabOverviewItemLayoutInfo setZPosition:]((uint64_t)v103, v47);

  [v11 targetLocation];
  double v105 = v104;
  -[TabOverviewItem layoutInfo](v28);
  v106 = (id *)objc_claimAutoreleasedReturnValue();
  v107 = -[TabOverviewItemLayoutInfo itemView](v106);

  objc_msgSend(v107, "setShadowOpacity:", fmax((v46 - v105) * 0.15 / 100.0, 0.0) + 0.2);
  -[TabOverview _itemHeaderHeight](a1);
  objc_msgSend(v107, "setTopBackdropHeight:");
  -[TabOverview _itemAdditionalHeaderHeight](a1);
  objc_msgSend(v107, "setAdditionalTopBackdropHeight:");
  [(id)a1 bounds];
  objc_msgSend(v107, "setWindowSize:", v108, v109);
  BOOL v110 = [v28 dragState] == 2 && *(void *)(a1 + 1152) != 3 || objc_msgSend(v28, "dragState") == 1;
  [v107 setPreviewViewHidden:v110];
  v111 = -[TabOverviewItem layoutInfo](v28);
  v112 = -[TabOverviewItemLayoutInfo interpolatedCornerRadius]((uint64_t)v111);
  [v107 setCornerRadius:v127 * -[TabOverviewInterpolatedValue value]((uint64_t)v112) / v50];

  [v107 setTabLayout:*(void *)(a1 + 1224)];
  if (v122 != v5 || (double v114 = 0.0, !*(unsigned char *)(a1 + 663)))
  {
    if (![v28 isPinned]
      || (int v113 = [(id)a1 targetItemLiftsFromGrid], v114 = 1.0, v113))
    {
      double v114 = -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v11);
    }
  }
  [v107 setTransitionProgress:v114];
  int v115 = [v28 isPinned];
  double v116 = 0.0;
  if (v115) {
    double v116 = -[TabOverview _tabSpacing]((void *)a1) * -0.5;
  }
  objc_msgSend(v107, "_setTouchInsets:", v116, 0.0, v116, 0.0);
  -[TabOverview _updateItemShowsCloseButton:](a1, v28);

LABEL_56:
}

- (BOOL)supportsDropTransitionToItemView
{
  return 1;
}

- (id)targetedDragPreviewForDroppingItem:(id)a3
{
  id v4 = (id *)a3;
  -[TabOverviewItem tabOverview](v4);
  double v5 = (TabOverview *)objc_claimAutoreleasedReturnValue();

  double v6 = v4;
  if (v5 != self)
  {
    items = self->_items;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __50__TabOverview_targetedDragPreviewForDroppingItem___block_invoke;
    v40[3] = &unk_1E6D7EE10;
    CGFloat v41 = v4;
    double v6 = [(NSArray *)items safari_firstObjectPassingTest:v40];
  }
  long double v8 = -[TabOverviewItemLayoutInfo initWithTabOverview:item:]((id *)[TabOverviewItemLayoutInfo alloc], self, v4);
  -[TabOverviewItemLayoutInfo setInterpolatedSnapshotAlpha:]((uint64_t)v4, v8);
  double v9 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)self, v4, self->_items);
  double v13 = -[TabOverview _rectForItemLocation:]((id *)&self->super.super.super.isa, v9, v10, v11, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v19 = v18;
  if ([v6 isPinned])
  {
    [(SFTabOverviewItemContentView *)self->_titleSizingItemView titlePadding];
    double v21 = v20;
    double v23 = v22;
    [(SFTabOverviewItemContentView *)self->_titleSizingItemView titleHeight];
    double v19 = fmax(v23 + v21 + v24, 30.0);
  }
  -[TabOverviewItemLayoutInfo setFrame:]((uint64_t)v8, v13, v15, v17, v19);
  -[TabOverviewItemLayoutInfo setSnapshotAlpha:]((uint64_t)v8, 1.0);
  -[TabOverviewItemLayoutInfo setAlpha:]((uint64_t)v8, 1.0);
  -[TabOverviewItemLayoutInfo setVisibleInTabOverview:]((uint64_t)v8, 1);
  double v25 = -[TabOverviewItemLayoutInfo itemView](v8);
  [v25 setCornerRadius:15.0];
  CGFloat v26 = [(TabOverview *)self window];
  [v26 bounds];
  objc_msgSend(v25, "setWindowSize:", v27, v28);

  [v25 setTransitionProgress:1.0];
  [v25 setTabLayout:self->_presentedTabLayout];
  [v25 setWasUsedForPreviewing:1];
  [v25 layoutIfNeeded];
  [v25 removeFromSuperview];
  CGFloat v29 = -[TabOverview _createPreviewContainerForItem:]((id *)&self->super.super.super.isa, v4);
  -[TabOverview _layoutDisplayedItem:forceVisible:]((uint64_t)self, v4, 0);
  -[TabOverview _layOutPreviewContainers]((uint64_t)self);
  id v30 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  double v31 = [MEMORY[0x1E4FB1618] clearColor];
  [v30 setBackgroundColor:v31];

  double v32 = [v25 previewView];
  double v33 = [v32 layer];
  [v33 setZPosition:998.0];

  [v25 setPreviewViewHidden:0];
  [v32 bounds];
  objc_msgSend(v32, "convertRect:toView:", v25);
  id v34 = objc_alloc(MEMORY[0x1E4FB1728]);
  UIRectGetCenter();
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v39[0] = *MEMORY[0x1E4F1DAB8];
  v39[1] = v35;
  v39[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGFloat v36 = objc_msgSend(v34, "initWithContainer:center:transform:", v29, v39);
  double v37 = (void *)[objc_alloc(MEMORY[0x1E4FB1D40]) initWithView:v32 parameters:v30 target:v36];

  return v37;
}

uint64_t __50__TabOverview_targetedDragPreviewForDroppingItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 UUID];
  id v4 = [*(id *)(a1 + 32) UUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (TabOverviewTargetedPreviewContainer)_createPreviewContainerForItem:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!a1[81])
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
      id v5 = a1[81];
      a1[81] = (id)v4;
    }
    double v6 = objc_alloc_init(TabOverviewTargetedPreviewContainer);
    [(TabOverviewTargetedPreviewContainer *)v6 setTabOverviewItem:v3];
    double v7 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)a1, v3, a1[146]);
    v19.origin.double x = -[TabOverview _rectForItemLocation:](a1, v7, v8, v9, v10);
    [(TabOverviewTargetedPreviewContainer *)v6 setInitialItemWidth:CGRectGetWidth(v19)];
    objc_initWeak(&location, a1);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __46__TabOverview__createPreviewContainerForItem___block_invoke;
    CGFloat v15 = &unk_1E6D7EF50;
    objc_copyWeak(&v16, &location);
    [(TabOverviewTargetedPreviewContainer *)v6 setDidRemoveLastSubviewBlock:&v12];
    objc_msgSend(a1[91], "addSubview:", v6, v12, v13, v14, v15);
    [a1[81] addObject:v6];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)_layOutPreviewContainers
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = *(id *)(a1 + 648);
    uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v24 != v4) {
            objc_enumerationMutation(obj);
          }
          double v6 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v7 = [v6 tabOverviewItem];
          -[TabOverviewItem layoutInfo](v7);
          double v8 = (id *)objc_claimAutoreleasedReturnValue();
          [v6 setFrame:-[TabOverviewItemLayoutInfo frame]((uint64_t)v8)];
          v29.origin.double x = -[TabOverviewItemLayoutInfo frame]((uint64_t)v8);
          double Width = CGRectGetWidth(v29);
          [v6 initialItemWidth];
          CGFloat v11 = Width / v10;
          [(TabOverviewItemLayoutInfo *)(uint64_t)v8 transform];
          CATransform3DScale(&v22, &v21, v11, v11, v11);
          uint64_t v12 = [v6 layer];
          CATransform3D v20 = v22;
          [v12 setTransform:&v20];

          double v13 = -[TabOverviewItemLayoutInfo zPosition]((uint64_t)v8);
          double v14 = [v6 layer];
          [v14 setZPosition:v13];

          CGFloat v15 = -[TabOverviewItemLayoutInfo itemView](v8);
          int v16 = [v15 isDescendantOfView:*(void *)(a1 + 728)];

          if (v16)
          {
            CGFloat v17 = *(void **)(a1 + 728);
            double v18 = -[TabOverviewItemLayoutInfo itemView](v8);
            [v17 insertSubview:v6 aboveSubview:v18];
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v3);
    }
  }
}

- (void)willAnimateDropForItem:(id)a3 withAnimator:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__TabOverview_willAnimateDropForItem_withAnimator___block_invoke;
  v8[3] = &unk_1E6D7EE38;
  id v9 = v6;
  double v10 = self;
  id v7 = v6;
  [a4 addCompletion:v8];
}

void __51__TabOverview_willAnimateDropForItem_withAnimator___block_invoke(uint64_t a1)
{
  -[TabOverviewItemLayoutInfo setInterpolatedSnapshotAlpha:](*(void *)(a1 + 32), 0);
  if ([*(id *)(*(void *)(a1 + 40) + 432) containsObject:*(void *)(a1 + 32)])
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v2 = *(void *)(a1 + 40);
    -[TabOverview _layoutDisplayedItem:forceVisible:](v2, v3, 0);
  }
}

- (void)willBeginShowingContextMenuForItem:(id)a3
{
  itemsShowingContextMenu = self->_itemsShowingContextMenu;
  id v5 = a3;
  [(NSCountedSet *)itemsShowingContextMenu addObject:v5];
  -[TabOverview _updateItemShowsCloseButton:]((uint64_t)self, v5);
}

- (void)_updateItemShowsCloseButton:(uint64_t)a1
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    double v10 = v3;
    id v5 = -[TabOverviewItem layoutInfo](v3);
    BOOL v6 = -[TabOverviewItemLayoutInfo visibleInTabOverview]((BOOL)v5);

    uint64_t v4 = v10;
    if (v6)
    {
      if (-[TabOverview _canCloseItem:](a1, v10))
      {
        if ([v10 isPinned]) {
          uint64_t v7 = [*(id *)(a1 + 640) containsObject:v10] ^ 1;
        }
        else {
          uint64_t v7 = 1;
        }
      }
      else
      {
        uint64_t v7 = 0;
      }
      -[TabOverviewItem layoutInfo](v10);
      double v8 = (id *)objc_claimAutoreleasedReturnValue();
      id v9 = -[TabOverviewItemLayoutInfo itemView](v8);
      [v9 setShowsCloseButton:v7];

      uint64_t v4 = v10;
    }
  }
}

- (void)didEndShowingContextMenuForItem:(id)a3
{
  id v4 = a3;
  [(NSCountedSet *)self->_itemsShowingContextMenu removeObject:v4];
  if (([(NSCountedSet *)self->_itemsShowingContextMenu containsObject:v4] & 1) == 0)
  {
    -[TabOverview _updateItemShowsCloseButton:]((uint64_t)self, v4);
    if (![(NSArray *)self->_items containsObject:v4])
    {
      -[TabOverview _removeViewsForItem:]((uint64_t)self, v4);
      -[TabOverview _updateDisplayedItems]((uint64_t)self);
    }
  }
}

- (id)targetedDragPreviewForLiftingItem:(id)a3
{
  id v4 = a3;
  if ([(TabOverview *)self presentationState])
  {
    id v5 = [(TabOverview *)self viewForItem:v4];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4FB1720]);
      uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
      [v6 setBackgroundColor:v7];

      id v8 = objc_alloc(MEMORY[0x1E4FB1D40]);
      id v9 = [v5 previewView];
      double v10 = (void *)[v8 initWithView:v9 parameters:v6];
    }
    else
    {
      double v10 = 0;
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)targetedPreviewForDismissingMenuForItem:(id)a3
{
  id v4 = (id *)a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  id v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  -[TabOverviewItem layoutInfo](v4);
  uint64_t v7 = (id *)objc_claimAutoreleasedReturnValue();
  id v8 = -[TabOverviewItemLayoutInfo itemView](v7);
  id v9 = [v8 snapshotViewAfterScreenUpdates:0];

  if (!v9)
  {
    double v13 = 0;
    goto LABEL_13;
  }
  if (-[TabOverviewItem closing]((BOOL)v4))
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1D48]);
    CGFloat v11 = -[TabOverviewItemLayoutInfo itemView](v7);
    uint64_t v12 = [v11 previewView];
    double v13 = (void *)[v10 initWithView:v12];
LABEL_11:

    goto LABEL_12;
  }
  double v14 = -[TabOverviewItemLayoutInfo itemView](v7);
  [v14 frame];

  double v48 = -[TabOverview _targetLocationForItem:inItems:]((uint64_t)self, v4, self->_items);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  CATransform3D v21 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
  [v21 location];
  double v23 = v22;

  if (v20 == v23)
  {
    CGFloat v11 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
    objc_msgSend(v11, "resetToLocation:", v48, v16, v18, v20);
    -[TabOverview _layoutDisplayedItem:forceVisible:]((uint64_t)self, v4, 0);
    id v30 = [(TabOverview *)self viewForItem:v4];
    uint64_t v12 = v30;
    if (v30)
    {
      [v30 layoutIfNeeded];
      double v31 = [v12 previewView];
      menuPreviewContainerView = self->_menuPreviewContainerView;
      [v31 bounds];
      UIRectGetCenter();
      -[UIView convertPoint:fromView:](menuPreviewContainerView, "convertPoint:fromView:", v31);
      double v34 = v33;
      double v36 = v35;
      id v37 = objc_alloc(MEMORY[0x1E4FB1728]);
      double v38 = self->_menuPreviewContainerView;
      long long v39 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v49[0] = *MEMORY[0x1E4F1DAB8];
      v49[1] = v39;
      v49[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v40 = objc_msgSend(v37, "initWithContainer:center:transform:", v38, v49, v34, v36);
      double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v31 parameters:v5 target:v40];
    }
    else
    {
      id v41 = objc_alloc(MEMORY[0x1E4FB1B38]);
      scrollingContainerView = self->_scrollingContainerView;
      UIRectGetCenter();
      double v44 = v43;
      double v46 = v45;
      CGAffineTransformMakeScale(&v50, 0.0, 0.0);
      double v31 = objc_msgSend(v41, "initWithContainer:center:transform:", scrollingContainerView, &v50, v44, v46);
      double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v5 target:v31];
    }

    goto LABEL_11;
  }
  id v24 = objc_alloc(MEMORY[0x1E4FB1B38]);
  long long v25 = self->_menuPreviewContainerView;
  UIRectGetCenter();
  double v27 = v26;
  double v29 = v28;
  CGAffineTransformMakeScale(&v51, 0.0, 0.0);
  CGFloat v11 = objc_msgSend(v24, "initWithContainer:center:transform:", v25, &v51, v27, v29);
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v9 parameters:v5 target:v11];
LABEL_12:

LABEL_13:
  return v13;
}

- (void)activateItem:(id)a3
{
}

- (void)_dismissWithItem:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1 && !-[TabOverviewItem closing]((BOOL)v3))
  {
    *(unsigned char *)(a1 + 1128) = [v4 isPinned];
    if (!*(void *)(a1 + 1224) && [(id)a1 targetItemLiftsFromGrid])
    {
      id v5 = -[TabOverviewItem layoutInfo]((id *)v4);
      id v6 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v5);
      [v6 setDecelerationFactor:0.985];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = *(id *)(a1 + 432);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = -[TabOverviewItem layoutInfo](*(id **)(*((void *)&v14 + 1) + 8 * v11));
          double v13 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v12);
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v13, 0.988);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 424), "setDecelerationFactor:", 0.985, (void)v14);
    [(id)a1 _dismissWithItemAtCurrentDecelerationFactor:v4];
  }
}

- (id)_requestReusableTabOverviewItemView
{
  p_isa = a1;
  if (a1)
  {
    uint64_t v2 = [a1[124] lastObject];
    if (v2)
    {
      [p_isa[124] removeLastObject];
      [v2 setHidden:0];
      id v3 = v2;
    }
    else
    {
      id v3 = objc_alloc_init(TabOverviewItemView);
    }
    p_isa = (id *)&v3->super.super.super.isa;
  }
  return p_isa;
}

- (void)_relinquishReusableTabOverviewItemView:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    id v4 = v3;
    if ([v3 wasUsedForPreviewing])
    {
      [v4 removeFromSuperview];
    }
    else
    {
      [v4 setHidden:1];
      [v4 updateSnapshotWithImage:0];
      [*(id *)(a1 + 992) addObject:v4];
    }
    id v3 = v4;
  }
}

- (void)_didReceiveMemoryWarning:(id)a3
{
}

void __36__TabOverview__updateDisplayedItems__block_invoke(uint64_t a1)
{
}

- (id)scrollingContainerView
{
  if (a1)
  {
    a1 = (id *)a1[91];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_updateVisiblyCenteredItem
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    [result bounds];
    CGFloat v30 = v3;
    CGFloat v31 = v2;
    CGFloat v28 = v5;
    CGFloat v29 = v4;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v6 = v1[146];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v36;
      double v32 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(id **)(*((void *)&v35 + 1) + 8 * i);
          double v13 = -[TabOverviewItem layoutInfo](v12);
          [v1 convertRect:v1[91] fromView:-[TabOverviewItemLayoutInfo frame]((uint64_t)v13)];
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;

          v42.origin.double x = v15;
          v42.origin.double y = v17;
          v42.size.double width = v19;
          v42.size.double height = v21;
          double MidX = CGRectGetMidX(v42);
          v43.origin.double x = v31;
          v43.origin.double y = v30;
          v43.size.double width = v29;
          v43.size.double height = v28;
          double v34 = MidX - CGRectGetWidth(v43) * 0.5;
          v44.origin.double x = v15;
          v44.origin.double y = v17;
          v44.size.double width = v19;
          v44.size.double height = v21;
          double MidY = CGRectGetMidY(v44);
          v45.origin.double x = v31;
          v45.origin.double y = v30;
          v45.size.double width = v29;
          v45.size.double height = v28;
          CGFloat Height = CGRectGetHeight(v45);
          double v24 = (MidY - Height * 0.5) * (MidY - Height * 0.5) + v34 * v34;
          if (v24 < v32)
          {
            long long v25 = v12;

            double v32 = v24;
            uint64_t v9 = v25;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }

    double v26 = v1 + 61;
    double v27 = (id *)v1[61];
    if (v9 != v27) {
      objc_storeStrong(v26, v9);
    }
    BOOL v39 = v9 != v27;

    return (id *)v39;
  }
  return result;
}

- (void)enumerateItemsOrderedByVisibility:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __49__TabOverview_enumerateItemsOrderedByVisibility___block_invoke;
  v36[3] = &unk_1E6D7EE60;
  id v5 = v4;
  id v37 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x1E4E42950](v36);
  if ([(SFTabCollectionSearchController *)self->_searchController isSearching])
  {
    items = self->_items;
    uint64_t v8 = [(SFTabCollectionSearchController *)self->_searchController indexesMatchingSearchTerm];
    uint64_t v9 = [(NSArray *)items objectsAtIndexes:v8];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          v6[2](v6, *(void *)(*((void *)&v32 + 1) + 8 * i));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v12);
    }
    id v27 = v5;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CGFloat v15 = self->_items;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          if (([v10 containsObject:v20] & 1) == 0) {
            v6[2](v6, v20);
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v17);
    }

    id v5 = v27;
  }
  if ([(NSArray *)self->_items count])
  {
    if (![(NSArray *)self->_items containsObject:self->_visiblyCenteredItem]) {
      -[TabOverview _updateVisiblyCenteredItem]((id *)&self->super.super.super.isa);
    }
    NSUInteger v21 = [(NSArray *)self->_items indexOfObject:self->_visiblyCenteredItem];
    if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v22 = 0;
    }
    else {
      unint64_t v22 = v21;
    }
    unint64_t v23 = v22;
    while (1)
    {
      unint64_t v24 = v23;
      unint64_t v25 = v22 + 1;
      if ([(NSArray *)self->_items count] < v22 + 1) {
        unint64_t v25 = [(NSArray *)self->_items count];
      }
      if (v23) {
        --v23;
      }
      else {
        unint64_t v23 = 0;
      }
      if (v25 > v22) {
        enumerateSubarrayWithRange(self->_items, v22, v25, v6);
      }
      if (v23 < v24) {
        enumerateSubarrayWithRange(self->_items, v23, v24, v6);
      }
      BOOL v26 = v25 == v22;
      unint64_t v22 = v25;
      if (v26)
      {
        unint64_t v22 = v25;
        if (v23 == v24) {
          break;
        }
      }
    }
  }
}

void __49__TabOverview_enumerateItemsOrderedByVisibility___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 UUID];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)_close:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TabOverview *)self presentationState] != 3)
  {
    items = self->_items;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __22__TabOverview__close___block_invoke;
    v17[3] = &unk_1E6D7EE88;
    id v18 = v4;
    uint64_t v6 = [(NSArray *)items indexOfObjectPassingTest:v17];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = v6;
      uint64_t v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = self->_items;
        id v10 = v8;
        uint64_t v11 = [(NSArray *)v9 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v20 = v7;
        __int16 v21 = 2048;
        uint64_t v22 = v11;
        _os_log_impl(&dword_1E102C000, v10, OS_LOG_TYPE_DEFAULT, "Tap close button on tab overview item at index: %ld, number of items: %ld", buf, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v13 = [(NSArray *)self->_items objectAtIndexedSubscript:v7];
      if ([(TabOverview *)self _isClosingLastItem])
      {
        -[TabOverview _startClosingItem:]((uint64_t)self, v13);
        self->_swipeCloseTranslatiouint64_t n = 0.0;
        double v14 = -[TabOverviewItem layoutInfo]((id *)v13);
        CGFloat v15 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v14);
        [v15 setDecelerationFactor:0.988];

        [(NSMutableArray *)self->_deferredClosingItems addObject:v13];
        [WeakRetained tabOverview:self willInteractivelyCloseItem:v13];
      }
      else
      {
        [WeakRetained tabCollectionView:self closeItem:v13];
      }
      uint64_t v16 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v16 didCloseTabWithTrigger:0 tabCollectionViewType:2];

      [(TabOverview *)self setNeedsLayout];
      -[TabOverview _updateDisplayedItems]((uint64_t)self);
      -[TabOverview _crossDissolveToSteadyStateIfNeededWithAnimationCompletion:](self, 0);
    }
  }
}

BOOL __22__TabOverview__close___block_invoke(uint64_t a1, id *a2)
{
  -[TabOverviewItem layoutInfo](a2);
  id v3 = (id *)objc_claimAutoreleasedReturnValue();
  id v4 = -[TabOverviewItemLayoutInfo itemView](v3);
  id v5 = [v4 closeButton];
  BOOL v6 = v5 == *(void **)(a1 + 32);

  return v6;
}

- (void)_crossDissolveToSteadyStateIfNeededWithAnimationCompletion:(void *)a1
{
  id v3 = a2;
  if (a1 && UIAccessibilityIsReduceMotionEnabled())
  {
    id v4 = (void *)MEMORY[0x1E4FB1EB0];
    id v5 = [a1 superview];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __74__TabOverview__crossDissolveToSteadyStateIfNeededWithAnimationCompletion___block_invoke;
    v6[3] = &unk_1E6D77E20;
    v6[4] = a1;
    [v4 transitionWithView:v5 duration:5242880 options:v6 animations:v3 completion:0.25];
  }
}

- (BOOL)_isClosingLastItem
{
  return [(NSArray *)self->_items count] == 1;
}

- (void)_pan:(id)a3
{
  id v61 = a3;
  uint64_t v4 = [v61 state];
  if ((unint64_t)(v4 - 3) >= 2)
  {
    if (v4 == 2)
    {
      [v61 translationInView:self];
      double v28 = v27;
      double v30 = v29;
      [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
      double v32 = v31;
      double v34 = v33;
      double v35 = [(TabOverview *)(uint64_t)self _offsetForRubberbandOffset:v33];
      int64_t presentedTabLayout = self->_presentedTabLayout;
      if (presentedTabLayout == 1)
      {
        double v35 = v35 + v28 - self->_lastPanTranslation.x;
      }
      else if (!presentedTabLayout)
      {
        double v36 = v36 + v30 - self->_lastPanTranslation.y;
      }
      double v59 = [(TabOverview *)(uint64_t)self _rubberbandOffsetForOffset:v36];
      -[TabOverviewInterpolatedLocation moveBy:atTime:](self->_interpolatedLocation, "moveBy:atTime:", v59 - v32, v60 - v34, CFAbsoluteTimeGetCurrent());
      self->_lastPanTranslation.double x = v28;
      self->_lastPanTranslation.double y = v30;
      [(TabOverview *)self _updateDisplayLink];
      [(TabOverview *)self setNeedsLayout];
    }
    else if (v4 == 1)
    {
      if (self) {
        _UIUpdateRequestActivate();
      }
      [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation beginInteractionAtTime:CFAbsoluteTimeGetCurrent()];
      [v61 translationInView:self];
      self->_lastPanTranslation.double x = v5;
      self->_lastPanTranslation.double y = v6;
      self->_dragging = 1;
      [(SFTabOverviewSearchBar *)self->_searchBar resignFirstResponder];
      [(TabOverview *)self _updateDisplayLink];
      if (self->_presentationState == 2) {
        [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation setDecelerationFactor:0.9985];
      }
    }
    goto LABEL_51;
  }
  self->_shouldBounceToConstrainedLocatiouint64_t n = 1;
  [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
  -[TabOverview _constrainLocation:]((uint64_t)self, v15, v16, v17, v18);
  if (v8 != v22 || v10 != v19 || v12 != v20 || v14 != v21)
  {
    double v26 = 0.988;
LABEL_24:
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation setDecelerationFactor:v26];
    goto LABEL_25;
  }
  if (self->_presentationState == 2)
  {
    double v26 = 0.9985;
    goto LABEL_24;
  }
LABEL_25:
  interpolatedLocatiouint64_t n = self->_interpolatedLocation;
  [v61 velocityInView:self];
  -[TabOverviewInterpolatedLocation endInteractionWithVelocity:](interpolatedLocation, "endInteractionWithVelocity:");
  self->_dragging = 0;
  BOOL v39 = [MEMORY[0x1E4F1CA48] array];
  [v39 addObject:&unk_1F3C73B90];
  if (-[TabOverview _showsTitle](self))
  {
    uint64_t v40 = [MEMORY[0x1E4F28ED0] numberWithDouble:-[TabOverview _titleHeight]((id *)&self->super.super.super.isa)];
    [v39 addObject:v40];
  }
  if (-[TabOverview _isDismissibleSearchBarAvailable]((uint64_t)self))
  {
    uint64_t v41 = [(SFTabOverviewSearchBar *)self->_searchBar text];
    uint64_t v42 = [v41 length];

    if (!v42)
    {
      CGRect v43 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_dismissibleSearchBarHeight + -[TabOverview _titleHeight]((id *)&self->super.super.super.isa)];
      [v39 addObject:v43];
    }
  }
  if ((unint64_t)[v39 count] < 2)
  {
LABEL_45:
    [(TabOverview *)self _updateDisplayLink];
  }
  else
  {
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
    double v45 = -v44;
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation targetLocation];
    unint64_t v46 = 0;
    double v48 = -v47;
    while (v46 < [v39 count] - 1)
    {
      CGFloat v49 = [v39 objectAtIndexedSubscript:v46];
      [v49 doubleValue];
      double v51 = v50;

      double v52 = [v39 objectAtIndexedSubscript:++v46];
      [v52 doubleValue];
      double v54 = v53;

      if (v51 < v48 && v54 > v48)
      {
        _SFUninterpolate();
        if (v54 > v45 && v51 < v45) {
          double v57 = v54;
        }
        else {
          double v57 = v51;
        }
        if (v55 >= 0.5) {
          double v58 = v57;
        }
        else {
          double v58 = v51;
        }
        -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", 0.0, -v58, 0.0, 0.0);
        [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation setDecelerationFactor:0.985];
        goto LABEL_45;
      }
    }
    [(TabOverview *)self _updateDisplayLink];
    if (!self) {
      goto LABEL_48;
    }
  }
  _UIUpdateRequestDeactivate();
LABEL_48:

LABEL_51:
}

- (void)test_scrollToTopWithoutAnimation
{
  -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", 0.0, 0.0, 0.0, 0.0);
  [(TabOverview *)self setNeedsLayout];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_panRecognizer == a3)
  {
    id v5 = a4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)_tabClose:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(TabOverview *)self _sf_usesLeftToRightLayout];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v7 = [v4 state];
  if ((unint64_t)(v7 - 3) < 2)
  {
    double v20 = -[TabOverviewItem layoutInfo]((id *)&self->_swipeClosingItem->super.isa);
    double v21 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v20);

    [v21 endInteraction];
    double v22 = self->_swipeClosingItem;
    -[TabOverviewItem setClosing:]((uint64_t)self->_swipeClosingItem, 0);
    swipeClosingIteuint64_t m = self->_swipeClosingItem;
    self->_swipeClosingIteuint64_t m = 0;

    [(UIPointerInteraction *)self->_cursorInteraction invalidate];
    int v24 = -[TabOverview _canCloseItem:]((uint64_t)self, v22);
    [v21 location];
    double v26 = v25;
    [v21 targetLocation];
    double v28 = v26 - v27;
    [v4 translationInView:self];
    double v30 = v29;
    if (v5) {
      double v31 = -v28;
    }
    else {
      double v31 = v28;
    }
    double v32 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    objc_msgSend(v32, "safari_doubleForKey:defaultValue:", @"DebugSwipeToCloseTabThresholdByVelocity", 100.0);
    double v34 = v33;

    if (v31 <= v34)
    {
      if (v5) {
        double v43 = -v30;
      }
      else {
        double v43 = v30;
      }
      double v44 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      objc_msgSend(v44, "safari_doubleForKey:defaultValue:", @"DebugSwipeToCloseTabThresholdByDistance", 120.0);
      double v46 = v45;

      BOOL v35 = v43 > v46;
      if (!v24) {
        goto LABEL_29;
      }
    }
    else
    {
      BOOL v35 = 1;
      if (!v24)
      {
LABEL_29:
        double v47 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          int v61 = 67109120;
          LODWORD(v62) = v24 ^ 1;
          _os_log_impl(&dword_1E102C000, v47, OS_LOG_TYPE_DEFAULT, "End swiping to close tab overview item restoring previous state: %d", (uint8_t *)&v61, 8u);
        }
        if (v24)
        {
          -[TabOverviewItem setClosing:]((uint64_t)v22, 1);
          [(NSMutableArray *)self->_deferredClosingItems addObject:v22];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          [WeakRetained tabOverview:self willInteractivelyCloseItem:v22];

          CGFloat v49 = [MEMORY[0x1E4F97E48] sharedLogger];
          [v49 didCloseTabWithTrigger:3 tabCollectionViewType:2];
        }
        if (!-[TabOverviewItem closing]((BOOL)v22)) {
          [v21 setDecelerationFactor:0.988];
        }
        _UIUpdateRequestDeactivate();

        goto LABEL_45;
      }
    }
    int v24 = [v4 state] == 3 && v35;
    goto LABEL_29;
  }
  if (v7 == 2)
  {
    [v4 translationInView:self];
    double v37 = v36;
    if ((-[TabOverview _canCloseItem:]((uint64_t)self, self->_swipeClosingItem) & 1) != 0 || v37 >= 0.0)
    {
      [(TabOverview *)self bounds];
      double v51 = v50;
      -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, [(NSArray *)self->_items count], self->_pinnedItemCount);
      double v53 = v51 / (v52 + v52);
      if (v53 >= 0.001)
      {
        double v54 = fmin(v37, 0.0);
        double v55 = fmax(v37, 0.0);
        if (v5) {
          double v55 = v54;
        }
        if (v37 < v55) {
          double v53 = -v53;
        }
        double v37 = v55 + (1.0 - 1.0 / ((v37 - v55) / v53 * 0.55 + 1.0)) * v53;
      }
    }
    else
    {
      double v38 = -v37;
      [(TabOverview *)self bounds];
      double v40 = v39;
      -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, [(NSArray *)self->_items count], self->_pinnedItemCount);
      double v42 = v40 / (v41 + v41);
      if (v42 >= 0.001)
      {
        if (v37 > 0.0) {
          double v42 = -v42;
        }
        double v38 = (1.0 - 1.0 / (v38 / v42 * 0.55 + 1.0)) * v42 + 0.0;
      }
      double v37 = -v38;
    }
    long long v56 = -[TabOverviewItem layoutInfo]((id *)&self->_swipeClosingItem->super.isa);
    double v21 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v56);

    [v21 location];
    long double v59 = v37 * (exp(v57) / (1.0 / (v58 * *MEMORY[0x1E4F78800] + 1.0)));
    double v60 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      -[TabOverview _tabClose:](v60, v59);
    }
    objc_msgSend(v21, "moveBy:atTime:", (double)(self->_swipeCloseTranslation - v59), 0.0, Current);
    self->_swipeCloseTranslatiouint64_t n = v59;
LABEL_45:

    goto LABEL_46;
  }
  if (v7 == 1)
  {
    if (self) {
      _UIUpdateRequestActivate();
    }
    [v4 locationInView:self];
    double v10 = [(TabOverview *)(id *)&self->super.super.super.isa _itemAtPoint:v9];
    double v11 = self->_swipeClosingItem;
    self->_swipeClosingIteuint64_t m = v10;

    [(UIPointerInteraction *)self->_cursorInteraction invalidate];
    double v12 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      items = self->_items;
      double v14 = self->_swipeClosingItem;
      double v15 = v12;
      uint64_t v16 = [(NSArray *)items indexOfObject:v14];
      NSUInteger v17 = [(NSArray *)self->_items count];
      int v61 = 134218240;
      uint64_t v62 = v16;
      __int16 v63 = 2048;
      NSUInteger v64 = v17;
      _os_log_impl(&dword_1E102C000, v15, OS_LOG_TYPE_DEFAULT, "Begin swiping to close tab overview item at index: %ld, number of items: %ld", (uint8_t *)&v61, 0x16u);
    }
    long double v18 = -[TabOverviewItem layoutInfo]((id *)&self->_swipeClosingItem->super.isa);
    double v19 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v18);
    [v19 beginInteractionAtTime:Current];

    -[TabOverview _startClosingItem:]((uint64_t)self, self->_swipeClosingItem);
    self->_swipeCloseTranslatiouint64_t n = 0.0;
  }
LABEL_46:
  [(TabOverview *)self setNeedsLayout];
}

- (uint64_t)_canCloseItem:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (*(void *)(a1 + 1224) == 1 || *(id *)(a1 + 496) == v3)
    {
      a1 = 0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
      a1 = [WeakRetained tabCollectionView:a1 canCloseItem:v4];
    }
  }

  return a1;
}

- (void)_dismissWithItemAtCurrentDecelerationFactor:(id)a3
{
  id v18 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabCollectionView:self didSelectItem:v18];
  -[TabOverview _updateBorrowedContentView]((id *)&self->super.super.super.isa);
  self->_transitioningItemIsPinned = [v18 isPinned];
  if (self->_presentedTabLayout || ![(TabOverview *)self targetItemLiftsFromGrid])
  {
    -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", -[TabOverview _targetLocationForDismissalWithItem:]((uint64_t)self, v18));
  }
  else
  {
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation targetLocation];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    -[TabOverview _itemHeaderHeight]((uint64_t)self);
    double v14 = v8 - v13;
    double v15 = -[TabOverviewItem layoutInfo]((id *)v18);
    uint64_t v16 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v15);
    objc_msgSend(v16, "setTargetLocation:", v6, v14, v10, v12);
  }
  itemToActivate = self->_itemToActivate;
  self->_itemToActivate = 0;

  -[TabOverview _setPresentationState:]((uint64_t)self, 3);
  -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)self, v18);
  [(TabOverview *)self _updateDisplayLink];
  -[TabOverview _crossDissolveToSteadyStateIfNeededWithAnimationCompletion:](self, 0);
}

- (void)_updateSnapshotAlphaForItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    uint64_t v23 = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
    int v5 = [WeakRetained tabCollectionView:a1 validSnapshotExistsForItem:v23];
    uint64_t v6 = -[TabOverviewItem layoutInfo](v23);
    double v7 = (void *)v6;
    if (v5 && -[TabOverviewItemLayoutInfo isSnapshotBlank](v6)) {
      -[TabOverviewItemLayoutInfo updateSnapshot]((uint64_t)v7);
    }
    double v8 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
    double v9 = -[TabOverview _titleViewSquishPercentageForItemAtLocation:](a1, v8);

    double v10 = *(id **)(a1 + 480);
    double v11 = 1.0;
    if (v10 == v23)
    {
      double v12 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
      -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v12);
      _SFClampPercent();
      double v11 = v13 * (v13 * v13) * (v13 * (v13 * 6.0 + -15.0) + 10.0);
    }
    float v14 = v11;
    double v15 = roundf(v14);
    if (*(unsigned char *)(a1 + 657)) {
      double v11 = v15;
    }
    if (v9 > 0.0) {
      char v16 = 1;
    }
    else {
      char v16 = v5;
    }
    if ((v16 & 1) != 0
      || ((uint64_t v17 = [(id)a1 presentationState], v10 == v23) ? (v18 = v17 == 3) : (v18 = 1), v18))
    {
      uint64_t v19 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v7);
      double v20 = (void *)v19;
      double v21 = v11;
    }
    else
    {
      uint64_t v19 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v7);
      double v20 = (void *)v19;
      double v21 = 0.0;
    }
    -[TabOverviewInterpolatedValue setTargetValue:](v19, v21);

    if (!*(void *)(a1 + 1152))
    {
      double v22 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v7);
      -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v22);
    }
    if (!*(void *)(a1 + 416) && [(id)a1 isItemAnimating:v23]) {
      [(id)a1 _updateDisplayLink];
    }

    id v3 = v23;
  }
}

- (char)_itemsContainingItem:(char *)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    BOOL v5 = -[TabOverviewItem isAlternateItem]((BOOL)v3);
    uint64_t v6 = &OBJC_IVAR___TabOverview__items;
    if (v5) {
      uint64_t v6 = &OBJC_IVAR___TabOverview__alternateItems;
    }
    a1 = (char *)*(id *)&a1[*v6];
  }

  return a1;
}

- (long)_applyItemPosition:(double)a3 toLocation:(double)a4
{
  if (!a1) {
    return 0.0;
  }
  if (a2 == 2)
  {
    -[TabOverview _itemReferenceBounds](a1);
    return a3 + v8 * -1.2 * exp(a6);
  }
  return a3;
}

- (uint64_t)_isDecelerating
{
  uint64_t v1 = a1;
  if (a1)
  {
    uint64_t v2 = *(void **)(a1 + 424);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __30__TabOverview__isDecelerating__block_invoke;
    v10[3] = &unk_1E6D7ED98;
    v10[4] = v1;
    char v3 = [v2 isInSteadyStateWithConstraints:v10];
    id v4 = *(void **)(v1 + 480);
    if (v4)
    {
      BOOL v5 = v4;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 1200));
      BOOL v5 = [WeakRetained currentItemForTabOverview:v1];
    }
    double v7 = -[TabOverviewItem layoutInfo](v5);
    double v8 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v7);
    -[TabOverview _currentScalePercentageForItemAtLocation:](v1, v8);

    if ((v3 & 1) != 0 || *(void *)(v1 + 1152) != 2) {
      uint64_t v1 = 0;
    }
    else {
      uint64_t v1 = _SFEqualWithEpsilon();
    }
  }
  return v1;
}

void __30__TabOverview__isDecelerating__block_invoke(uint64_t a1, double a2, double a3, double a4, long double a5)
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[TabOverview _isDecelerating]((uint64_t)self))
  {
    interpolatedLocatiouint64_t n = self->_interpolatedLocation;
    [(TabOverviewInterpolatedLocation *)interpolatedLocation location];
    -[TabOverviewInterpolatedLocation resetToLocation:](interpolatedLocation, "resetToLocation:");
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }
  self->_lastDecelerationWasInterrupted = v9;
  v10.receiver = self;
  v10.super_class = (Class)TabOverview;
  [(TabOverview *)&v10 touchesBegan:v6 withEvent:v7];
}

- (void)_tap:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [a3 locationInView:self];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  if (-[TabOverview _shouldDimItemsForSearch]((uint64_t)self))
  {
    searchController = self->_searchController;
    [(SFTabCollectionSearchController *)searchController endSearching];
  }
  else
  {
    [(TabOverviewToolbar *)self->_header frame];
    v22.double x = v5;
    v22.double y = v7;
    if (CGRectContainsPoint(v23, v22))
    {
      if (!self->_barPlacement)
      {
        -[TabOverview scrollToTop]((uint64_t)self);
      }
    }
    else if (!self->_lastDecelerationWasInterrupted && ![(NSCountedSet *)self->_itemsShowingContextMenu count])
    {
      BOOL v9 = [(TabOverview *)(id *)&self->super.super.super.isa _itemAtPoint:v7];
      if (!v9)
      {
        if ((unint64_t)(self->_barPlacement - 1) > 1
          || [(SFTabCollectionSearchController *)self->_searchController isSearching]
          || ![(TabOverview *)(uint64_t)self _hitPointIsInEmptySpace:v7])
        {
          return;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        BOOL v9 = [WeakRetained currentItemForTabOverview:self];
      }
      objc_super v10 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        items = self->_items;
        double v12 = v10;
        uint64_t v13 = [(NSArray *)items indexOfObject:v9];
        NSUInteger v14 = [(NSArray *)self->_items count];
        int v16 = 134218240;
        uint64_t v17 = v13;
        __int16 v18 = 2048;
        NSUInteger v19 = v14;
        _os_log_impl(&dword_1E102C000, v12, OS_LOG_TYPE_DEFAULT, "Select tab overview item at index: %ld, number of items: %ld", (uint8_t *)&v16, 0x16u);
      }
      -[TabOverview _dismissWithItem:]((uint64_t)self, v9);
    }
  }
}

- (uint64_t)_shouldDimItemsForSearch
{
  uint64_t v1 = a1;
  if (a1)
  {
    if ([*(id *)(a1 + 680) isFirstResponder])
    {
      uint64_t v2 = [*(id *)(v1 + 680) text];
      uint64_t v1 = [v2 length] == 0;
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)scrollToTop
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    if ([(id)result presentationState] == 3) {
      return 0;
    }
    [v1[53] targetLocation];
    if (v5 == 0.0 && v2 == 0.0 && v3 == 0.0 && v4 == 0.0)
    {
      return 0;
    }
    else
    {
      objc_msgSend(v1[53], "setTargetLocation:", 0.0, 0.0, 0.0, 0.0);
      [v1[53] setDecelerationFactor:0.985];
      [v1 _updateDisplayLink];
      return 1;
    }
  }
  return result;
}

- (uint64_t)_hitPointIsInEmptySpace:(double)a3
{
  if (result)
  {
    double v5 = (void *)result;
    CGSize result = [*(id *)(result + 1168) count];
    if (result)
    {
      unint64_t v6 = result;
      objc_msgSend(v5, "convertPoint:toView:", v5[91], a2, a3);
      double v8 = v7;
      double v10 = v9;
      double v11 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:]((uint64_t)v5, v6 - 1, v6, 0, v5[139]);
      v25.origin.CGFloat x = -[TabOverview _rectForItemLocation:]((id *)v5, v11, v12, v13, v14);
      CGFloat x = v25.origin.x;
      CGFloat y = v25.origin.y;
      CGFloat width = v25.size.width;
      CGFloat height = v25.size.height;
      if (v10 <= CGRectGetMaxY(v25))
      {
        unint64_t v19 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:]((uint64_t)v5, v6, v5[139]);
        unint64_t v20 = -[TabOverview _tabsPerRow]((uint64_t)v5);
        if (v19 % v20
          && (double v21 = -[TabOverview _targetLocationForItemAtIndex:inNumberOfItems:insertionStyle:pinnedItemCount:]((uint64_t)v5, v6 - 1 - v19 % v20, v6, 0, v5[139]), v26.origin.x = -[TabOverview _rectForItemLocation:]((id *)v5, v21, v22, v23, v24), v10 > CGRectGetMaxY(v26)))
        {
          v27.origin.CGFloat x = x;
          v27.origin.CGFloat y = y;
          v27.size.CGFloat width = width;
          v27.size.CGFloat height = height;
          return v8 > CGRectGetMaxX(v27);
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

- (double)_controlsAlpha
{
  if (!a1) {
    return 0.0;
  }
  double v2 = *(void **)(a1 + 480);
  if (v2)
  {
    double v3 = v2;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
    double v3 = [WeakRetained currentItemForTabOverview:a1];
  }
  double v5 = -[TabOverviewItem layoutInfo](v3);
  unint64_t v6 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v5);
  double v7 = -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v6);

  if (v7 <= 0.0) {
    double v8 = 0.0;
  }
  else {
    double v8 = v7 * v7;
  }

  return v8;
}

- (double)_targetLocationForPresentation
{
  if (!a1) {
    return 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
  double v3 = [WeakRetained currentItemForTabOverview:a1];
  if (*(void *)(a1 + 1192) && objc_msgSend(*(id *)(a1 + 1168), "containsObject:"))
  {
    double v4 = *(void **)(a1 + 1192);
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
    double v4 = v3;
  }
  double v6 = -[TabOverview _targetLocationForItem:inItems:](a1, v4, *(void **)(a1 + 1168));
  double v10 = -[TabOverview _targetLocationCenteredOnItemLocation:]((id *)a1, v6, v7, v8, v9);
  double v12 = v10;
  if ((v5 & 1) == 0)
  {
    -[TabOverview _constrainLocation:](a1, v10, v11, 0.0, 0.0);
    double v12 = v13;
  }

  return v12;
}

void __53__TabOverview__updateTargetLocationForDisplayedItem___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) count];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v4 + 1168)) {
    char v5 = &OBJC_IVAR___TabOverview__pinnedItemCount;
  }
  else {
    char v5 = &OBJC_IVAR___TabOverview__pinnedAlternateItemCount;
  }
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](v2, v3, *(void *)(v4 + *v5));
  double v7 = log(v6);
  uint64_t v8 = [*(id *)(a1 + 32) presentationState];
  -[TabOverviewItem layoutInfo](*(id **)(a1 + 48));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = -[TabOverviewItemLayoutInfo interpolatedBoundsLogScale]((uint64_t)v11);
  double v10 = (void *)v9;
  if (v8) {
    -[TabOverviewInterpolatedValue setTargetValue:](v9, v7);
  }
  else {
    -[TabOverviewInterpolatedValue resetToValue:](v9, v7);
  }
}

- (double)_itemShouldBeTransparent:(uint64_t)a1
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (!a1) {
    goto LABEL_9;
  }
  char v5 = -[TabOverviewItem layoutInfo](v3);
  if (-[TabOverviewItemLayoutInfo interactivelyInserted]((BOOL)v5))
  {
    BOOL v6 = -[TabOverviewItem closing]((BOOL)v4);

    double v7 = 1.0;
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  if (![*(id *)(a1 + 752) isSearching]) {
    goto LABEL_9;
  }
  uint64_t v8 = [*(id *)(a1 + 752) indexesMatchingSearchTerm];
  if (objc_msgSend(v8, "containsIndex:", objc_msgSend(*(id *)(a1 + 1168), "indexOfObject:", v4)))
  {

LABEL_9:
    double v7 = 0.0;
    goto LABEL_13;
  }
  BOOL v9 = -[TabOverviewItem closing]((BOOL)v4);

  if (v9) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
LABEL_13:

  return v7;
}

double __49__TabOverview__layoutDisplayedItem_forceVisible___block_invoke(uint64_t a1)
{
  double v2 = -[TabOverview _itemReferenceBounds](*(id **)(a1 + 32));
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  BOOL v9 = *(void **)(a1 + 32);
  if (v9 && !v9[153] && ([v9 targetItemLiftsFromGrid] & 1) != 0
    || [*(id *)(a1 + 40) isPinned])
  {
    double v10 = (id *)(a1 + 40);
  }
  else
  {
    double v10 = (id *)(a1 + 48);
  }
  id v11 = (id *)*v10;
  double v12 = -[TabOverviewItem layoutInfo](v11);
  double v13 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v12);
  -[TabOverviewInterpolatedValue value]((uint64_t)v13);

  -[TabOverview _itemHeaderHeight](*(void *)(a1 + 32));
  [*(id *)(a1 + 32) bounds];
  CGRectGetHeight(v18);
  v19.origin.CGFloat x = v2;
  v19.origin.CGFloat y = v4;
  v19.size.CGFloat width = v6;
  v19.size.CGFloat height = v8;
  CGRectGetHeight(v19);
  if ([*(id *)(a1 + 40) isPinned])
  {
    uint64_t v14 = *(void *)(a1 + 32);
    if (!*(void *)(v14 + 1224))
    {
      [*(id *)(v14 + 1104) titlePadding];
      [*(id *)(v14 + 1104) titleHeight];
      [*(id *)(a1 + 32) targetItemLiftsFromGrid];
    }
  }
  _SFInterpolate();
  v20.origin.CGFloat x = v2;
  v20.origin.CGFloat y = v4;
  v20.size.CGFloat width = v6;
  v20.size.CGFloat height = v8;
  CGRectGetWidth(v20);
  _SFRoundRectToPixels();
  double v16 = v15;

  return v16;
}

- (CATransform3D)_thumbnailTransformForFrame:(CGFloat)a3@<D0> withScale:(CGFloat)a4@<D1> atZPosition:(CGFloat)a5@<D2>
{
  if (result)
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    CATransform3DMakeScale((CATransform3D *)a2, a7, a7, a7);
    double v36 = 0.0;
    CGFloat v37 = 0.0;
    double v35 = 0.0;
    SFTabOverviewScaleTranslationForZPosition();
    if (a8 >= 0.0)
    {
      double v16 = *MEMORY[0x1E4F78800] * a8;
      v38.origin.CGFloat x = a3;
      v38.origin.CGFloat y = a4;
      v38.size.CGFloat width = a5;
      v38.size.CGFloat height = a6;
      double v15 = CGRectGetWidth(v38) * v16 * 0.5;
      v39.origin.CGFloat x = a3;
      v39.origin.CGFloat y = a4;
      v39.size.CGFloat width = a5;
      v39.size.CGFloat height = a6;
      double v14 = v16 * CGRectGetHeight(v39) * 0.5;
      double v35 = v15;
      double v36 = v14;
    }
    else
    {
      double v15 = v35;
      double v14 = v36;
    }
    long long v17 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)&v33.m31 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)&v33.m33 = v17;
    long long v18 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)&v33.m41 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)&v33.m43 = v18;
    long long v19 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v33.m11 = *(_OWORD *)a2;
    *(_OWORD *)&v33.m13 = v19;
    long long v20 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)&v33.m21 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)&v33.m23 = v20;
    CATransform3DTranslate(&v34, &v33, v15, v14, 0.0);
    long long v21 = *(_OWORD *)&v34.m33;
    *(_OWORD *)(a2 + 64) = *(_OWORD *)&v34.m31;
    *(_OWORD *)(a2 + 80) = v21;
    long long v22 = *(_OWORD *)&v34.m43;
    *(_OWORD *)(a2 + 96) = *(_OWORD *)&v34.m41;
    *(_OWORD *)(a2 + 112) = v22;
    long long v23 = *(_OWORD *)&v34.m13;
    *(_OWORD *)a2 = *(_OWORD *)&v34.m11;
    *(_OWORD *)(a2 + 16) = v23;
    long long v24 = *(_OWORD *)&v34.m23;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v34.m21;
    *(_OWORD *)(a2 + 48) = v24;
    long long v25 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)&v33.m31 = *(_OWORD *)(a2 + 64);
    *(_OWORD *)&v33.m33 = v25;
    long long v26 = *(_OWORD *)(a2 + 112);
    *(_OWORD *)&v33.m41 = *(_OWORD *)(a2 + 96);
    *(_OWORD *)&v33.m43 = v26;
    long long v27 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&v33.m11 = *(_OWORD *)a2;
    *(_OWORD *)&v33.m13 = v27;
    long long v28 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)&v33.m21 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)&v33.m23 = v28;
    CGSize result = CATransform3DScale(&v34, &v33, v37, v37, v37);
    long long v29 = *(_OWORD *)&v34.m33;
    *(_OWORD *)(a2 + 64) = *(_OWORD *)&v34.m31;
    *(_OWORD *)(a2 + 80) = v29;
    long long v30 = *(_OWORD *)&v34.m43;
    *(_OWORD *)(a2 + 96) = *(_OWORD *)&v34.m41;
    *(_OWORD *)(a2 + 112) = v30;
    long long v31 = *(_OWORD *)&v34.m13;
    *(_OWORD *)a2 = *(_OWORD *)&v34.m11;
    *(_OWORD *)(a2 + 16) = v31;
    long long v32 = *(_OWORD *)&v34.m23;
    *(_OWORD *)(a2 + 32) = *(_OWORD *)&v34.m21;
    *(_OWORD *)(a2 + 48) = v32;
  }
  else
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t __77__TabOverview__cornerRadiusForItemAtLocation_scale_ignoreTransitionProgress___block_invoke(uint64_t a1)
{
  -[TabOverview _currentScalePercentageForItemAtLocation:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t result = _SFClampPercent();
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (void)_notifyObserversForScalePercentageForActiveItem
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 scalePercentageForActiveItem];
    double v3 = v2;
    if (*(double *)(a1 + 600) != v2)
    {
      *(double *)(a1 + 600) = v2;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = *(id *)(a1 + 408);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v4);
            }
            BOOL v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v9, "tabOverview:didUpdateScalePercentageForActiveItem:", a1, v3, (void)v10);
            }
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)_notifyObserversForScrollViewShiftIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 bounds];
    if (!CGRectEqualToRect(v14, *(CGRect *)(a1 + 520)))
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v8 = 0u;
      long long v9 = 0u;
      id v2 = *(id *)(a1 + 408);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v9;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v9 != v5) {
              objc_enumerationMutation(v2);
            }
            uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v7, "tabOverviewWillShiftScrollPositionForBoundsChange:", a1, (void)v8);
            }
            ++v6;
          }
          while (v4 != v6);
          uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        }
        while (v4);
      }
    }
  }
}

- (uint64_t)_shiftScrollPositionForBoundsChangeIfNeeded
{
  if (result)
  {
    uint64_t v1 = result;
    [(id)result bounds];
    uint64_t result = CGRectEqualToRect(v19, *(CGRect *)(v1 + 520));
    if ((result & 1) == 0)
    {
      uint64_t result = CGRectEqualToRect(*(CGRect *)(v1 + 520), *MEMORY[0x1E4F1DB28]);
      if ((result & 1) == 0 && *(void *)(v1 + 1152) == 2)
      {
        [*(id *)(v1 + 424) targetLocation];
        double v3 = v2;
        double v5 = v4;
        double v7 = v6;
        double v9 = v8;
        double v10 = *(double *)(v1 + 592);
        double v11 = v10 - CGRectGetHeight(*(CGRect *)(v1 + 552));
        double v12 = 0.0;
        double v13 = fmax(v11, 0.0);
        [(id)v1 _contentSize];
        double v15 = v14;
        v20.origin.CGFloat x = -[TabOverview _scrollBounds]((void *)v1);
        double Height = CGRectGetHeight(v20);
        if (v13 != 0.0) {
          double v12 = v5 * fmax(v15 - Height, 0.0) / v13;
        }
        long long v17 = *(void **)(v1 + 424);
        return objc_msgSend(v17, "shiftTargetLocation:", v3, v12, v7, v9);
      }
    }
  }
  return result;
}

- (void)layoutSubviews
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E102C000, a2, OS_LOG_TYPE_ERROR, "Invalid bounds from tab overview location: %@", (uint8_t *)&v3, 0xCu);
}

- (id)_layOutTitleLabel
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [result title];
    uint64_t v3 = [v2 length];
    BOOL v4 = v3 != 0;
    BOOL v5 = v3 == 0;

    double v6 = [v1 traitCollection];
    double v7 = [v6 preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v7)) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    [v1[87] setNumberOfLines:v8];

    [v1[87] setHidden:v5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __32__TabOverview__layOutTitleLabel__block_invoke;
    v10[3] = &unk_1E6D781E8;
    v10[4] = v1;
    BOOL v11 = v4;
    id v9 = v1[153];
    v1[153] = 0;
    uint64_t result = (id *)__32__TabOverview__layOutTitleLabel__block_invoke((uint64_t)v10);
    v1[153] = v9;
  }
  return result;
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 672), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_2(uint64_t result)
{
  return result;
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 680) setAlpha:0.0];
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 1.0;
  if (!*(unsigned char *)(a1 + 48))
  {
    unint64_t v4 = objc_msgSend(*(id *)(v1 + 1168), "count", 1.0);
    uint64_t v1 = *(void *)(a1 + 32);
    double v2 = 0.0;
    if (v4 >= 2 && !*(unsigned char *)(v1 + 657))
    {
      objc_msgSend(*(id *)(v1 + 424), "targetLocation", 0.0);
      uint64_t v1 = *(void *)(a1 + 32);
      double v2 = (*(double *)(a1 + 40) + v5) / *(double *)(v1 + 1072) + 1.0;
    }
  }
  double v6 = *(void **)(v1 + 680);
  return [v6 setAlpha:v2];
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_106(uint64_t a1)
{
  char v2 = [*(id *)(*(void *)(a1 + 32) + 680) showsCancelButton];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = 0.0;
  if ((v2 & 1) == 0)
  {
    double v4 = 1.0;
    if (*(void *)(v3 + 1216) != 1)
    {
      double v4 = 0.0;
      if (*(double *)(a1 + 40) > 0.5) {
        double v4 = 1.0;
      }
    }
  }
  double v5 = *(void **)(v3 + 672);
  return [v5 setAlpha:v4];
}

void __29__TabOverview_layoutSubviews__block_invoke_2_107(uint64_t a1)
{
}

uint64_t __29__TabOverview_layoutSubviews__block_invoke_3_108(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1008) setAlpha:*(double *)(a1 + 40)];
  char v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  long long v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  return [v2 setTransform:v5];
}

void __29__TabOverview_layoutSubviews__block_invoke_4_109(uint64_t a1, double a2, double a3, double a4, long double a5)
{
}

void __46__TabOverview__createPreviewContainerForItem___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    [v4 removeFromSuperview];
    [WeakRetained[81] removeObject:v4];
  }
}

- (double)_titleViewSquishPercentageForItemAtLocation:(uint64_t)a1
{
  id v3 = a2;
  double v4 = 0.0;
  if (a1 && !*(void *)(a1 + 1224))
  {
    -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v3);
    _SFClampPercent();
    double v4 = v5;
  }

  return v4;
}

- (uint64_t)_wantsBorrowedContentView
{
  if (!a1 || ![*(id *)(a1 + 1168) count] || !objc_msgSend((id)a1, "presentationState")) {
    return 0;
  }
  if ([(id)a1 presentationState] == 3 || *(unsigned char *)(a1 + 657)) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
  double v5 = [WeakRetained currentItemForTabOverview:a1];
  double v6 = -[TabOverviewItem layoutInfo](v5);
  double v7 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v6);
  double v8 = -[TabOverview _currentScalePercentageForItemAtLocation:](a1, v7);

  int v9 = [WeakRetained tabCollectionView:a1 validSnapshotExistsForItem:v5];
  if (!v5 || ((v10 = v9, int v11 = _SFEqualWithEpsilon(), v8 >= 1.0) ? (v12 = 1) : (v12 = v10), (v2 = 1, !v11) && v12))
  {
    uint64_t v13 = -[TabOverviewItem layoutInfo](*(id **)(a1 + 480));
    double v14 = (void *)v13;
    if (*(void *)(a1 + 480))
    {
      double v15 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha](v13);
      uint64_t v2 = -[TabOverviewInterpolatedValue isSteadyAtTargetValue:]((uint64_t)v15) ^ 1;
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (void)attachView:(id)a3 withReferenceRect:(CGRect)a4 toItem:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  int v10 = (id *)a5;
  id v11 = a3;
  int v12 = -[TabOverviewItem layoutInfo](v10);
  -[TabOverviewItemLayoutInfo setAttachedView:]((uint64_t)v12, v11);

  -[TabOverviewItem layoutInfo](v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  -[TabOverviewItemLayoutInfo setAttachedViewReferenceRect:]((uint64_t)v13, x, y, width, height);
}

- (id)attachedViewForItem:(id)a3
{
  id v3 = -[TabOverviewItem layoutInfo]((id *)a3);
  double v4 = -[TabOverviewItemLayoutInfo attachedView]((uint64_t)v3);

  return v4;
}

- (uint64_t)_beginPresentation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    -[TabOverview _setPresentationState:](result, 1);
    -[TabOverview _updateSnapshotAlphaForItem:](v1, *(void **)(v1 + 480));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v2 = *(id *)(v1 + 432);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v5) {
            objc_enumerationMutation(v2);
          }
          double v7 = *(id **)(*((void *)&v13 + 1) + 8 * i);
          double v8 = -[TabOverviewItem layoutInfo](v7);
          int v9 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v8);
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v9, 0.962);

          double v10 = 0.988;
          if (-[TabOverviewItem isAlternateItem]((BOOL)v7)) {
            double v10 = dbl_1E123E360[*(void *)(v1 + 1184) == 1];
          }
          id v11 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v8);
          objc_msgSend(v11, "setDecelerationFactor:", v10, (void)v13);

          int v12 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v8);
          -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v12, 0.988);
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
    }

    return [(id)v1 becomeFirstResponder];
  }
  return result;
}

- (void)presentAnimated:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_presentationState != 2)
  {
    BOOL v3 = a3;
    uint64_t v5 = WBS_LOG_CHANNEL_PREFIXTabView();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v28 = v3;
      _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_DEFAULT, "Present tab overview animated: %d", buf, 8u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v7 = [WeakRetained currentItemForTabOverview:self];

    self->_transitioningItemIsPinned = [v7 isPinned];
    -[TabOverview _beginPresentation]((uint64_t)self);
    double v8 = -[TabOverview _targetLocationForPresentation]((uint64_t)self);
    double v12 = v8;
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    if (v3)
    {
      if (self->_presentedTabLayout || ![(TabOverview *)self targetItemLiftsFromGrid])
      {
        -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:", v12, v13, v14, v15);
        int v16 = 0;
      }
      else
      {
        -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", v12, v13, v14, v15);
        int v16 = 1;
      }
      [(TabOverview *)self setNeedsLayout];
      if (!self->_presentedTabLayout && [(TabOverview *)self targetItemLiftsFromGrid])
      {
        long long v17 = -[TabOverviewItem layoutInfo]((id *)v7);
        uint64_t v18 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v17);
        [v18 setDecelerationFactor:0.985];
      }
      [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation setDecelerationFactor:dbl_1E123E390[self->_itemToActivate == 0]];
    }
    else
    {
      -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", v8, v9, v10, v11);
      [(TabOverview *)self setNeedsLayout];
      -[TabOverview _setPresentationState:]((uint64_t)self, 2);
      int v16 = 1;
    }
    if (self->_itemToActivate)
    {
      [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation decelerationFactor];
      long double v20 = -0.00230258509 / log(v19);
      [(NSTimer *)self->_itemActivationTimer invalidate];
      long long v21 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__activateItemToActivate_ selector:0 userInfo:0 repeats:(double)v20];
      itemActivationTimer = self->_itemActivationTimer;
      self->_itemActivationTimer = v21;

      if (!self->_defersActivation) {
        -[TabOverview _setPresentationState:]((uint64_t)self, 3);
      }
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __31__TabOverview_presentAnimated___block_invoke;
    v24[3] = &unk_1E6D7EF78;
    BOOL v26 = v3;
    id v23 = v7;
    id v25 = v23;
    -[TabOverview _crossDissolveToSteadyStateIfNeededWithAnimationCompletion:](self, v24);
    if (v16) {
      -[TabOverview _updateDisplayedItems]((uint64_t)self);
    }
    if (!v3) {
      -[TabOverview _resetToSteadyState]((uint64_t)self);
    }
  }
}

void __31__TabOverview_presentAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    -[TabOverviewItem layoutInfo](*(id **)(a1 + 32));
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    -[TabOverviewItemLayoutInfo pulseDimmingView]((uint64_t)v1);
  }
}

uint64_t __74__TabOverview__crossDissolveToSteadyStateIfNeededWithAnimationCompletion___block_invoke(uint64_t a1)
{
  return -[TabOverview _resetToSteadyState](*(void *)(a1 + 32));
}

- (void)dismissAnimated:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_presentationState)
  {
    BOOL v3 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([WeakRetained tabCollectionViewCanDismiss:self] & 1) == 0)
    {
      double v8 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_1E102C000, v8, OS_LOG_TYPE_DEFAULT, "Request to dismiss tab overview vetoed by delegate", (uint8_t *)v9, 2u);
      }
    }
    else
    {
      double v6 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9[0] = 67109120;
        v9[1] = v3;
        _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "Dismiss tab overview animated: %d", (uint8_t *)v9, 8u);
      }
      double v7 = [WeakRetained currentItemForTabOverview:self];
      -[TabOverview _dismissWithItem:]((uint64_t)self, v7);

      if (!v3) {
        -[TabOverview _resetToSteadyState]((uint64_t)self);
      }
    }
  }
}

- (void)setItemToActivate:(id)a3
{
  uint64_t v5 = (TabOverviewItem *)a3;
  if (self->_itemToActivate != v5)
  {
    objc_storeStrong((id *)&self->_itemToActivate, a3);
    if (self->_defersActivation && [(TabOverview *)self presentationState] != 3) {
      [(TabOverview *)self setNeedsLayout];
    }
  }
}

- (void)setDefersActivation:(BOOL)a3
{
  if (self->_defersActivation != a3)
  {
    self->_defersActivatiouint64_t n = a3;
    if (!a3)
    {
      BOOL v3 = self;
      if ([(TabOverview *)v3 presentationState] == 1)
      {
      }
      else
      {
        uint64_t v4 = [(TabOverview *)v3 presentationState];

        if (v4 != 2) {
          return;
        }
      }
      if (![(NSTimer *)v3->_itemActivationTimer isValid])
      {
        -[TabOverview _activateItemToActivate]((uint64_t)v3);
      }
    }
  }
}

- (void)_activateItemToActivate
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 1192);
    if (v2)
    {
      id v4 = v2;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
      [WeakRetained tabCollectionView:a1 didSelectItem:v4];

      [(id)a1 _dismissWithItemAtCurrentDecelerationFactor:v4];
    }
  }
}

- (void)_activateItemToActivate:(id)a3
{
  itemActivationTimer = self->_itemActivationTimer;
  self->_itemActivationTimer = 0;

  if (!self->_defersActivation)
  {
    -[TabOverview _activateItemToActivate]((uint64_t)self);
  }
}

double __38__TabOverview__closestItemToLocation___block_invoke(uint64_t a1, void *a2)
{
  double v4 = -[TabOverview _targetLocationForItem:inItems:](*(void *)(a1 + 32), a2, *(void **)(*(void *)(a1 + 32) + 1168));
  double v6 = v5;
  double v7 = *(void **)(a1 + 32);
  if (v7)
  {
    double v8 = v3;
    double v9 = *(double *)(a1 + 64);
    double v11 = *(double *)(a1 + 40);
    double v10 = *(double *)(a1 + 48);
    [v7 bounds];
    double v13 = v12;
    double v15 = v14;
    long double v16 = exp(v8 - v9);
    double v17 = v13 * 0.5 + v16 * (v11 - v13 * 0.5);
    double v18 = v15 * 0.5 + v16 * (v10 - v15 * 0.5);
  }
  else
  {
    double v18 = 0.0;
    double v17 = 0.0;
  }
  return (v6 - v18) * (v6 - v18) + (v4 - v17) * (v4 - v17);
}

void __56__TabOverview__closestItemWithDistanceCalculationBlock___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  if (![*(id *)(a1[4] + 752) isSearching]
    || ([*(id *)(a1[4] + 752) indexesMatchingSearchTerm],
        double v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsIndex:a3],
        v6,
        v7))
  {
    double v8 = (*(double (**)(void))(a1[5] + 16))();
    uint64_t v9 = *(void *)(a1[6] + 8);
    if (v8 < *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    }
  }
}

- (void)beginInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  double v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    v79.double x = x;
    v79.double y = y;
    id v10 = NSStringFromCGPoint(v79);
    *(_DWORD *)buf = 138543618;
    double v75 = v10;
    __int16 v76 = 2048;
    double v77 = a4;
    _os_log_impl(&dword_1E102C000, v9, OS_LOG_TYPE_DEFAULT, "Begin interactive tab overview presentation with offset: %{public}@, scale: %f", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v12 = self;
  if ([(TabOverview *)v12 presentationState] == 1)
  {

LABEL_6:
    double v14 = 0;
    char v15 = 1;
    goto LABEL_8;
  }
  uint64_t v13 = [(TabOverview *)v12 presentationState];

  if (v13 == 2) {
    goto LABEL_6;
  }
  double v14 = [WeakRetained currentItemForTabOverview:v12];
  char v15 = 0;
LABEL_8:
  p_interactivePresentationStartingIteuint64_t m = (id *)&v12->_interactivePresentationStartingItem;
  objc_storeStrong((id *)&v12->_interactivePresentationStartingItem, v14);
  if ((v15 & 1) == 0) {

  }
  v12->_transitioningItemIsPinned = [*p_interactivePresentationStartingItem isPinned];
  v12->_pinching = 1;
  uint64_t v68 = [(TabOverview *)v12 presentationState];
  -[TabOverview _shiftLocationsForEffectiveLayoutIfNeeded]((uint64_t)v12);
  panRecognizer = v12->_panRecognizer;
  BOOL v18 = [(TabOverview *)v12 presentationState] != 3 && !v12->_pinching;
  [(SFScrollingPanGestureRecognizer *)panRecognizer setEnabled:v18];
  double Current = CFAbsoluteTimeGetCurrent();
  v12->_interactivePresentationZoomLockStartTime = -1.79769313e308;
  if (!*p_interactivePresentationStartingItem)
  {
    long double v20 = [(TabOverview *)(id *)&v12->super.super.super.isa _itemAtPoint:y];
    if (v20)
    {
      double v67 = a4;
      [(TabOverviewInterpolatedLocation *)v12->_interpolatedLocation location];
      double v22 = v21;
      double v66 = v23;
      long double v25 = v24;
      BOOL v26 = -[TabOverviewItem layoutInfo](v20);
      long long v27 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v26);
      [v27 location];
      double v29 = v28;
      double v31 = v30;
      long double v33 = v32;
      double v34 = exp(v25);
      double v35 = exp(v33);
      if ((_SFEqualWithEpsilon() & 1) == 0)
      {
        double v29 = (v29 * v34 - v22 * v35) / (v34 - v35);
        double v31 = (v31 * v34 - v66 * v35) / (v34 - v35);
      }
      v12->_interactivePresentationZoomLockOffset.double x = v29;
      v12->_interactivePresentationZoomLockOffset.double y = v31;

      v12->_interactivePresentationZoomLockStartTime = Current;
      v12->_transitioningItemIsPinned = [v20 isPinned];
      a4 = v67;
      if (!v12->_presentedTabLayout && [(TabOverview *)v12 targetItemLiftsFromGrid])
      {
        objc_storeStrong((id *)&v12->_interactivelyLiftingItem, v20);
        [WeakRetained tabCollectionView:v12 didSelectItem:v20];
      }
    }
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  double v36 = v12->_presentationObservers;
  uint64_t v37 = [(NSHashTable *)v36 countByEnumeratingWithState:&v69 objects:v73 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v70 != v39) {
          objc_enumerationMutation(v36);
        }
        double v41 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v41 tabOverviewWillBeginInteractivePresentation:v12];
        }
      }
      uint64_t v38 = [(NSHashTable *)v36 countByEnumeratingWithState:&v69 objects:v73 count:16];
    }
    while (v38);
  }

  -[TabOverview _beginPresentation]((uint64_t)v12);
  v12->_interactivePresentationLastTimestamp = Current;
  v12->_interactivePresentationVelocitdouble y = (CGPoint)*MEMORY[0x1E4F1DAD8];
  v12->_interactivePresentationFirstOffset.double x = x;
  v12->_interactivePresentationFirstOffset.double y = y;
  if (v12->_presentedTabLayout || ![(TabOverview *)v12 targetItemLiftsFromGrid])
  {
    interpolatedLocatiouint64_t n = v12->_interpolatedLocation;
    [(TabOverviewInterpolatedLocation *)interpolatedLocation location];
    -[TabOverviewInterpolatedLocation resetToLocation:](interpolatedLocation, "resetToLocation:");
    [(TabOverviewInterpolatedLocation *)v12->_interpolatedLocation beginInteractionAtTime:Current];
    v12->_interactivePresentationLastOffset.double x = x;
    v12->_interactivePresentationLastOffset.double y = y;
    v12->_interactivePresentationLastLogScale = log(a4);
  }
  else
  {
    interactivelyLiftingIteuint64_t m = v12->_interactivelyLiftingItem;
    if (interactivelyLiftingItem)
    {
      double v43 = interactivelyLiftingItem;
    }
    else
    {
      double v43 = [WeakRetained currentItemForTabOverview:v12];
    }
    double v47 = v12->_interactivelyLiftingItem;
    v12->_interactivelyLiftingIteuint64_t m = v43;

    double v48 = -[TabOverviewItem layoutInfo]((id *)&v12->_interactivelyLiftingItem->super.isa);
    CGFloat v49 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v48);

    if (v68)
    {
      double v50 = v12->_interpolatedLocation;
      [(TabOverviewInterpolatedLocation *)v50 location];
      -[TabOverviewInterpolatedLocation resetToLocation:](v50, "resetToLocation:");
      [v49 location];
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
    }
    else
    {
      double v53 = -[TabOverview _targetLocationForPresentation]((uint64_t)v12);
      double v59 = v58;
      double v55 = v60;
      double v57 = v61;
      -[TabOverviewInterpolatedLocation resetToLocation:](v12->_interpolatedLocation, "resetToLocation:");
      -[TabOverview _itemHeaderHeight]((uint64_t)v12);
      double v51 = v59 - v62;
    }
    objc_msgSend(v49, "resetToLocation:", v53, v51, v55, v57, *(void *)&v66);
    [v49 beginInteractionAtTime:Current];
    [v49 location];
    long double v64 = exp(v63);
    double v65 = v12->_interactivePresentationFirstOffset.y;
    v12->_interactivePresentationLastOffset.double x = v12->_interactivePresentationFirstOffset.x - x * v64;
    v12->_interactivePresentationLastOffset.double y = v65 - y * v64;
    v12->_interactivePresentationLastLogScale = -log(a4);
  }
  [(NSTimer *)v12->_itemActivationTimer invalidate];
  itemActivationTimer = v12->_itemActivationTimer;
  v12->_itemActivationTimer = 0;

  itemToActivate = v12->_itemToActivate;
  v12->_itemToActivate = 0;
}

- (uint64_t)_shiftLocationsForEffectiveLayoutIfNeeded
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 1224);
    if (v2 == *(void *)(result + 1064))
    {
      return 0;
    }
    else
    {
      *(void *)(result + 1064) = v2;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v3 = *(id *)(result + 1168);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v48 != v6) {
              objc_enumerationMutation(v3);
            }
            -[TabOverview _updateTargetLocationForDisplayedItem:](v1, *(void **)(*((void *)&v47 + 1) + 8 * i));
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v5);
      }

      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 1200));
      uint64_t v9 = [WeakRetained currentItemForTabOverview:v1];

      id v10 = -[TabOverviewItem layoutInfo](v9);
      double v11 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v10);
      [v11 location];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      BOOL v18 = -[TabOverviewItem layoutInfo](v9);
      long double v19 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v18);
      [v19 targetLocation];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;

      long double v26 = exp(v17 - v25);
      double v27 = -(v13 - v21 * v26);
      double v28 = -(v15 - v23 * v26);
      [*(id *)(v1 + 424) location];
      long double v30 = exp(v29 - v17);
      objc_msgSend(*(id *)(v1 + 424), "moveInstantaneouslyBy:", (double)(v27 * v30), (double)(v28 * v30));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v31 = *(id *)(v1 + 1168);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v44 != v34) {
              objc_enumerationMutation(v31);
            }
            double v36 = *(id **)(*((void *)&v43 + 1) + 8 * j);
            uint64_t v37 = -[TabOverviewItem layoutInfo](v36);
            uint64_t v38 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v37);
            objc_msgSend(v38, "location", (void)v43);
            double v40 = exp(v39 - v17);

            double v41 = -[TabOverviewItem layoutInfo](v36);
            double v42 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v41);
            objc_msgSend(v42, "moveInstantaneouslyBy:", v27 * v40, v28 * v40);
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v33);
      }

      *(unsigned char *)(v1 + 661) = 0;
      return 1;
    }
  }
  return result;
}

- (void)updateInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4
{
}

- (void)updateInteractivePresentationWithOffset:(CGPoint)a3 scale:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[TabOverview updateInteractivePresentationWithOffset:scale:animated:](v10, x, y, a4);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabOverviewWillUpdateInteractivePresentation:self];

  double v12 = log(a4);
  interactivelyLiftingIteuint64_t m = self->_interactivelyLiftingItem;
  if (interactivelyLiftingItem) {
    double v14 = -v12;
  }
  else {
    double v14 = v12;
  }
  if (interactivelyLiftingItem)
  {
    double v15 = -[TabOverviewItem layoutInfo]((id *)&interactivelyLiftingItem->super.isa);
    double v16 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v15);
    [v16 location];
    double v18 = v17;
  }
  else
  {
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
    double v18 = v19;
  }
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, [(NSArray *)self->_items count], self->_pinnedItemCount);
  double v21 = log(v20);
  double v58 = v14;
  if (v21 < 0.001)
  {
    p_interactivePresentationLastLogScale = &self->_interactivePresentationLastLogScale;
    double v23 = v18 + v14 - self->_interactivePresentationLastLogScale;
    if (!self->_interactivelyLiftingItem) {
      goto LABEL_23;
    }
LABEL_22:
    long double v32 = exp(v23);
    double x = self->_interactivePresentationFirstOffset.x - x * v32;
    double y = self->_interactivePresentationFirstOffset.y - y * v32;
    goto LABEL_23;
  }
  double v24 = fmax(v18, 0.0);
  if (v18 >= v24) {
    double v25 = v21;
  }
  else {
    double v25 = -v21;
  }
  double v26 = (v18 - v24) / v25 + -1.0;
  double v27 = v18;
  if (fabs(v26) >= 0.001) {
    double v27 = v24 + (-1.0 / v26 + -1.0) / 0.55 * v25;
  }
  p_interactivePresentationLastLogScale = &self->_interactivePresentationLastLogScale;
  double v28 = v27 + v14 - self->_interactivePresentationLastLogScale;
  double v29 = self->_interactivelyLiftingItem;
  double v30 = fmax(v28, 0.0);
  double v31 = fmax(fmin(v21, v28), 0.0);
  if (!v29) {
    double v31 = v30;
  }
  if (v28 < v31) {
    double v21 = -v21;
  }
  double v23 = v31 + (1.0 - 1.0 / ((v28 - v31) / v21 * 0.55 + 1.0)) * v21;
  if (v29) {
    goto LABEL_22;
  }
LABEL_23:
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  double v34 = fmin(fmax(1.0- (Current- self->_interactivePresentationZoomLockStartTime+ Current- self->_interactivePresentationZoomLockStartTime), 0.0), 1.0);
  double v35 = 1.0 - v34;
  CGFloat v36 = self->_interactivePresentationZoomLockOffset.x * v34;
  double v59 = x;
  double v37 = v36 + x * (1.0 - v34);
  CGFloat v38 = self->_interactivePresentationZoomLockOffset.y * v34;
  p_interactivePresentationLastOffset = &self->_interactivePresentationLastOffset;
  double v40 = v36 + self->_interactivePresentationLastOffset.x * v35;
  double v41 = y;
  double v42 = v38 + y * v35;
  double v43 = v38 + self->_interactivePresentationLastOffset.y * v35;
  long long v44 = self->_interactivelyLiftingItem;
  double v45 = v23 - v18;
  BOOL v46 = !v5;
  if (v44)
  {
    long long v47 = -[TabOverviewItem layoutInfo]((id *)&v44->super.isa);
    long long v48 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v47);
    objc_msgSend(v48, "moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:", v46, v45, v37, v42, v40, v43, Current);
  }
  else
  {
    -[TabOverviewInterpolatedLocation moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:](self->_interpolatedLocation, "moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:", v46, v45, v37, v42, v40, v43, Current);
  }
  -[TabOverview _updateSnapshotAlphaForItem:]((uint64_t)self, self->_activeItem);
  [(TabOverview *)self setNeedsLayout];
  double v49 = Current - self->_interactivePresentationLastTimestamp;
  if (v49 > 0.008)
  {
    CGFloat v50 = (v59 - p_interactivePresentationLastOffset->x) / v49;
    CGFloat v51 = (v41 - self->_interactivePresentationLastOffset.y) / v49;
    self->_interactivePresentationVelocity.double x = v50;
    self->_interactivePresentationVelocity.double y = v51;
  }
  p_interactivePresentationLastOffset->double x = v59;
  self->_interactivePresentationLastOffset.double y = v41;
  double *p_interactivePresentationLastLogScale = v58;
  self->_interactivePresentationLastTimestamp = Current;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  double v52 = self->_presentationObservers;
  uint64_t v53 = [(NSHashTable *)v52 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v61 != v55) {
          objc_enumerationMutation(v52);
        }
        double v57 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v57 tabOverviewDidUpdateInteractivePresentation:self];
        }
      }
      uint64_t v54 = [(NSHashTable *)v52 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v54);
  }
}

- (id)_itemRightOfItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, [*(id *)(a1 + 1168) indexOfObject:v3], *(void *)(a1 + 1112));
    if ((v4 + 1) % (unint64_t)-[TabOverview _tabsPerRow](a1))
    {
      if (objc_msgSend((id)a1, "_sf_usesLeftToRightLayout")) {
        uint64_t v5 = v4 + 1;
      }
      else {
        uint64_t v5 = v4 - 1;
      }
      a1 = -[TabOverview _itemAtLayoutIndex:]((id *)a1, v5);
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (id)_itemLeftOfItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, [*(id *)(a1 + 1168) indexOfObject:v3], *(void *)(a1 + 1112));
    if (v4 % -[TabOverview _tabsPerRow](a1))
    {
      if (objc_msgSend((id)a1, "_sf_usesLeftToRightLayout")) {
        uint64_t v5 = v4 - 1;
      }
      else {
        uint64_t v5 = v4 + 1;
      }
      a1 = -[TabOverview _itemAtLayoutIndex:]((id *)a1, v5);
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (id)_itemBelowItem:(id *)a1
{
  if (a1)
  {
    uint64_t v3 = (uint64_t)a1;
    uint64_t v4 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](v3, [a1[146] indexOfObject:a2], *(void *)(v3 + 1112));
    uint64_t v5 = -[TabOverview _tabsPerRow](v3);
    -[TabOverview _itemAtLayoutIndex:]((id *)v3, v5 + v4);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)_itemAboveItem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = -[TabOverview _layoutIndexForItemIndex:pinnedItemCount:](a1, [*(id *)(a1 + 1168) indexOfObject:v3], *(void *)(a1 + 1112));
    unint64_t v5 = -[TabOverview _tabsPerRow](a1);
    if (v4 >= v5)
    {
      a1 = -[TabOverview _itemAtLayoutIndex:]((id *)a1, v4 - v5);
    }
    else
    {
      a1 = 0;
    }
  }

  return (id)a1;
}

- (void)_endInteractivePresentationAllowingDismissal:(int)a3 restoringPreviousState:
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  uint64_t v6 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v89 = a3;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_DEFAULT, "End interactive tab overview presentation restoring previous state: %d", buf, 8u);
  }
  *(unsigned char *)(a1 + 657) = 0;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v7 = *(id *)(a1 + 408);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v82 objects:v87 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v83 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v12 tabOverviewWillEndInteractivePresentation:a1];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v82 objects:v87 count:16];
    }
    while (v9);
  }

  double v13 = (id *)*(id *)(a1 + 496);
  double v14 = *(void **)(a1 + 496);
  *(void *)(a1 + 496) = 0;

  if (v13)
  {
    double v15 = -[TabOverviewItem layoutInfo](v13);
    double v16 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v15);
    [v16 endInteraction];
  }
  else
  {
    [*(id *)(a1 + 424) endInteraction];
  }
  [*(id *)(a1 + 424) setDecelerationFactor:0.99];
  double v77 = v13;
  if (!a2)
  {
    double v17 = 0;
    BOOL v18 = 0;
    goto LABEL_43;
  }
  if (!a3)
  {
    if (v13)
    {
      double v17 = v13;
      double v19 = -[TabOverviewItem layoutInfo](v17);
      long double v20 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v19);

      [v20 targetLocation];
      double v22 = v21;
      [v20 location];
      BOOL v18 = v22 < v23;

      goto LABEL_43;
    }
    [*(id *)(a1 + 424) targetLocation];
    double v25 = v24;
    [*(id *)(a1 + 424) location];
    double v27 = v26;
    double v28 = *(double *)(a1 + 832);
    double v29 = *(double *)(a1 + 840);
    [*(id *)(a1 + 424) targetLocation];
    double v31 = *(void **)(a1 + 776);
    if (!v31 || (long double v32 = exp(v30), v29 * v29 + v28 * v28 <= 1750.0 / v32 * (1750.0 / v32)))
    {
      [*(id *)(a1 + 424) targetLocation];
      -[TabOverview _closestItemToLocation:]((void *)a1, v36, v37, v38, v39);
      double v17 = (id *)objc_claimAutoreleasedReturnValue();
      int v40 = 0;
LABEL_35:
      if ([v17 isPinned])
      {

        double v17 = 0;
      }
      if (v25 > v27) {
        int v41 = 1;
      }
      else {
        int v41 = v40;
      }
      if (v17) {
        BOOL v18 = v41;
      }
      else {
        BOOL v18 = 0;
      }
      goto LABEL_43;
    }
    double v33 = *(double *)(a1 + 840);
    double v34 = fmax(fabs(*(double *)(a1 + 832)), fabs(v33));
    if (v34 == *(double *)(a1 + 832))
    {
      uint64_t v35 = -[TabOverview _itemLeftOfItem:](a1, v31);
    }
    else if (v34 == -*(double *)(a1 + 832))
    {
      uint64_t v35 = -[TabOverview _itemRightOfItem:](a1, v31);
    }
    else if (v34 == v33)
    {
      uint64_t v35 = -[TabOverview _itemAboveItem:](a1, v31);
    }
    else
    {
      if (v34 != -v33)
      {
        double v17 = 0;
        goto LABEL_34;
      }
      uint64_t v35 = -[TabOverview _itemBelowItem:]((id *)a1, (uint64_t)v31);
    }
    double v17 = (id *)v35;
LABEL_34:
    int v40 = 1;
    goto LABEL_35;
  }
  double v17 = (id *)*(id *)(a1 + 776);
  BOOL v18 = v17 != 0;
LABEL_43:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id v42 = *(id *)(a1 + 432);
  uint64_t v43 = [v42 countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v79 != v45) {
          objc_enumerationMutation(v42);
        }
        long long v47 = -[TabOverviewItem layoutInfo](*(id **)(*((void *)&v78 + 1) + 8 * j));
        long long v48 = -[TabOverviewItemLayoutInfo interpolatedHeightTransitionPercent]((uint64_t)v47);
        -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v48, 0.98);
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v44);
  }

  if (v18)
  {
    [(id)a1 _dismissWithItemAtCurrentDecelerationFactor:v17];
    double v49 = *(void **)(a1 + 424);
    [v49 targetLocation];
    objc_msgSend(v49, "decelerationFactorForTargetLocation:");
    double v51 = fmax(v50, 0.985);
    [*(id *)(a1 + 424) decelerationFactor];
    long double v53 = fmin(v51, v52);
    [*(id *)(a1 + 424) setDecelerationFactor:(double)v53];
    double v54 = pow(v53, 4.0);
    uint64_t v55 = -[TabOverviewItem layoutInfo](v17);
    double v56 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v55);
    -[TabOverviewItemLayoutInfo setInteractiveInsertionProgress:]((uint64_t)v56, v54);

    double v57 = &OBJC_IVAR___CompletionList__safariShouldHandleCardSectionEngagement;
    double v58 = v77;
  }
  else
  {
    double v58 = v77;
    if (v77)
    {
      -[TabOverview _updateTargetLocationForDisplayedItem:](a1, v77);
    }
    else
    {
      [*(id *)(a1 + 424) targetLocation];
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      double v66 = v65;
      [(id)a1 bounds];
      double v68 = v67;
      double v70 = v69;
      long double v71 = exp(0.0 - v66);
      -[TabOverview _constrainLocation:](a1, v68 * 0.5 + v71 * (v60 - v68 * 0.5), v70 * 0.5 + v71 * (v62 - v70 * 0.5), v64, 0.0);
      objc_msgSend(*(id *)(a1 + 424), "setTargetLocation:");
    }
    double v57 = &OBJC_IVAR___CompletionList__safariShouldHandleCardSectionEngagement;
  }
  -[TabOverview _updateSnapshotAlphaForItem:](a1, *(void **)(a1 + v57[164]));
  long long v72 = *(id **)(a1 + v57[164]);
  if (v72 != *(id **)(a1 + 480))
  {
    BOOL v73 = -[TabOverviewItem layoutInfo](v72);
    long long v74 = -[TabOverviewItemLayoutInfo interpolatedSnapshotAlpha]((uint64_t)v73);
    -[TabOverviewInterpolatedValue resetToTargetValue]((uint64_t)v74);
  }
  double v75 = *(void **)(a1 + 448);
  BOOL v76 = [(id)a1 presentationState] != 3 && *(unsigned char *)(a1 + 657) == 0;
  [v75 setEnabled:v76];
  *(unsigned char *)(a1 + 661) = 0;
  [(id)a1 _updateDisplayLink];
  -[TabOverview _updatePresentationStateIfSteady](a1);
}

- (void)endInteractivePresentation
{
}

- (void)endInteractivePresentationAllowingDismissalToTargetItem:(BOOL)a3
{
}

- (void)cancelInteractivePresentation
{
}

- (void)addPresentationObserver:(id)a3
{
}

- (void)removePresentationObserver:(id)a3
{
}

- (void)resetPresentationScrollPosition
{
  -[TabOverviewInterpolatedLocation resetToLocation:](self->_interpolatedLocation, "resetToLocation:", -[TabOverview _targetLocationForPresentation]((uint64_t)self));
  [(TabOverview *)self setNeedsLayout];
}

- (void)performUpdatesWithoutTabCloseAnimation:(id)a3
{
  if (a3)
  {
    suppressesTabCloseAnimatiouint64_t n = self->_suppressesTabCloseAnimation;
    self->_suppressesTabCloseAnimatiouint64_t n = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_suppressesTabCloseAnimatiouint64_t n = suppressesTabCloseAnimation;
  }
}

- (void)_resetRenderedLocations
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [*(id *)(a1 + 424) resetRenderedLocation];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v2 = *(id *)(a1 + 432);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(id **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v8 = -[TabOverviewItem layoutInfo](v7);
          uint64_t v9 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v8);
          [v9 resetRenderedLocation];

          long long v19 = 0u;
          long long v20 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          uint64_t v10 = -[TabOverviewItem layoutInfo](v7);
          double v11 = -[TabOverviewItemLayoutInfo interpolatedValues](v10);

          uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v18;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v18 != v14) {
                  objc_enumerationMutation(v11);
                }
                double Rendered = -[TabOverviewInterpolatedValue resetLastRenderedValue](*(void *)(*((void *)&v17 + 1)
                                                                                            + 8 * j));
              }
              uint64_t v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16, Rendered);
            }
            while (v13);
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v4);
    }
  }
}

void __29__TabOverview__canSkipFrames__block_invoke()
{
  if ([(id)*MEMORY[0x1E4FB2608] launchedToTest])
  {
    _canSkipFrames_canSkip = 0;
  }
  else
  {
    id v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v1 _refreshRate];
    _canSkipFrames_canSkip = v0 < 0.0166666667;
  }
}

- (uint64_t)_interpolateValuesByTimeInterval:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    LOBYTE(v12) = 0;
    return v12 & 1;
  }
  [(id)a1 bounds];
  double v5 = v4;
  double v7 = v6;
  if (!*(unsigned char *)(a1 + 656) && !*(unsigned char *)(a1 + 657))
  {
    if (*(unsigned char *)(a1 + 661))
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __48__TabOverview__interpolateValuesByTimeInterval___block_invoke;
      v43[3] = &unk_1E6D7ED98;
      v43[4] = a1;
      uint64_t v8 = MEMORY[0x1E4E42950](v43);
      goto LABEL_5;
    }
    double v29 = *(void **)(a1 + 424);
    [v29 targetLocation];
    -[TabOverview _constrainLocation:](a1, v30, v31, v32, v33);
    objc_msgSend(v29, "setTargetLocation:");
  }
  uint64_t v8 = 0;
LABEL_5:
  double v9 = *MEMORY[0x1E4F78800];
  if (*(unsigned char *)(a1 + 659)) {
    double v10 = 0.99;
  }
  else {
    double v10 = 0.0;
  }
  if (*(unsigned char *)(a1 + 660)) {
    double v11 = 0.99;
  }
  else {
    double v11 = 0.0;
  }
  double v34 = (void *)v8;
  int v12 = objc_msgSend(*(id *)(a1 + 424), "interpolateByTimeInterval:roundingAtSize:zScaleFactor:withHorizontalBounceFactor:verticalBounceFactor:constraints:", v8, a2, v5, v7, *MEMORY[0x1E4F78800], v10, v11);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v13 = *(id *)(a1 + 432);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v40 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(id **)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v19 = -[TabOverviewItem layoutInfo](v18);
        long long v20 = -[TabOverviewItemLayoutInfo interpolatedValues](v19);

        uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v36 != v23) {
                objc_enumerationMutation(v20);
              }
              v12 |= -[TabOverviewInterpolatedValue interpolateByTimeInterval:](*(void *)(*((void *)&v35 + 1) + 8 * j), a2);
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v22);
        }

        double v25 = -[TabOverviewItem layoutInfo](v18);
        double v26 = -[TabOverviewItemLayoutInfo interpolatedLocation]((uint64_t)v25);
        int v27 = objc_msgSend(v26, "interpolateByTimeInterval:roundingAtSize:zScaleFactor:withHorizontalBounceFactor:verticalBounceFactor:constraints:", 0, a2, v5, v7, v9, 0.0, 0.0);

        v12 |= v27;
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v15);
  }

  return v12 & 1;
}

void __48__TabOverview__interpolateValuesByTimeInterval___block_invoke(uint64_t a1, double a2, double a3, double a4, long double a5)
{
}

- (void)_displayLinkFired:(id)a3
{
  id v11 = a3;
  int v4 = -[TabOverview _shiftLocationsForEffectiveLayoutIfNeeded]((uint64_t)self);
  [v11 timestamp];
  double v6 = v5;
  double lastUpdateTime = self->_lastUpdateTime;
  if (lastUpdateTime == 0.0) {
    [v11 duration];
  }
  else {
    double v8 = v6 - lastUpdateTime;
  }
  self->_double lastUpdateTime = v6;
  int v9 = -[TabOverview _interpolateValuesByTimeInterval:]((uint64_t)self, v8);
  if (_canSkipFrames_onceToken != -1) {
    dispatch_once(&_canSkipFrames_onceToken, &__block_literal_global_72);
  }
  if (_canSkipFrames_canSkip) {
    int v10 = v9;
  }
  else {
    int v10 = 1;
  }
  if ((v10 | v4) == 1)
  {
    [MEMORY[0x1E4F39CF8] generateSeed];
    [(TabOverview *)self setNeedsLayout];
    -[TabOverview _resetRenderedLocations]((uint64_t)self);
  }
  [(TabOverview *)self _updateDisplayLink];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  -[TabOverviewToolbar convertPoint:fromView:](self->_header, "convertPoint:fromView:", self, x, y);
  double v9 = v8;
  double v11 = v10;
  if ([(TabOverviewToolbar *)self->_header isHidden]
    || (-[TabOverviewToolbar hitTest:withEvent:](self->_header, "hitTest:withEvent:", v7, v9, v11),
        (int v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    [(TabOverviewToolbar *)self->_header bounds];
    v43.double x = v9;
    v43.double y = v11;
    if (CGRectContainsPoint(v44, v43))
    {
      v39.receiver = self;
      v39.super_class = (Class)TabOverview;
      -[TabOverview hitTest:withEvent:](&v39, sel_hitTest_withEvent_, v7, x, y);
    }
    else
    {
      if (-[TabOverview _isDecelerating]((uint64_t)self))
      {
        id v13 = self;
LABEL_31:
        int v12 = v13;
        goto LABEL_32;
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v14 = self->_items;
      uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v17) {
              objc_enumerationMutation(v14);
            }
            -[TabOverviewItem layoutInfo](*(id **)(*((void *)&v35 + 1) + 8 * i));
            long long v19 = (id *)objc_claimAutoreleasedReturnValue();
            long long v20 = -[TabOverviewItemLayoutInfo itemView](v19);

            if (v20)
            {
              [v20 alpha];
              if (v21 != 0.0)
              {
                int v12 = [v20 closeButton];
                [v12 alpha];
                if (v22 != 0.0 && ([v12 isHidden] & 1) == 0)
                {
                  [v12 bounds];
                  CGFloat v23 = v45.origin.x;
                  CGFloat v24 = v45.origin.y;
                  CGFloat width = v45.size.width;
                  CGFloat height = v45.size.height;
                  double MidX = CGRectGetMidX(v45);
                  v46.origin.double x = v23;
                  v46.origin.double y = v24;
                  v46.size.CGFloat width = width;
                  v46.size.CGFloat height = height;
                  objc_msgSend(v12, "convertPoint:toView:", self, MidX, CGRectGetMidY(v46));
                  BOOL v30 = v28 >= x + -22.0 && v28 <= x + 22.0;
                  BOOL v31 = !v30 || v29 < y + -22.0;
                  if (!v31 && v29 <= y + 22.0)
                  {

                    goto LABEL_32;
                  }
                }
              }
            }
          }
          uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      v34.receiver = self;
      v34.super_class = (Class)TabOverview;
      -[TabOverview hitTest:withEvent:](&v34, sel_hitTest_withEvent_, v7, x, y);
    }
    id v13 = (TabOverview *)objc_claimAutoreleasedReturnValue();
    goto LABEL_31;
  }
LABEL_32:

  return v12;
}

- (void)setShowsPrivateBrowsingExplanationView:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shouldShowPrivateBrowsingExplanationView != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_shouldShowPrivateBrowsingExplanationView = a3;
    if ([(TabOverview *)self presentationState])
    {
      -[TabOverview _setExplanationViewVariant:animated:]((uint64_t)self, v5, v4);
    }
  }
}

- (BOOL)showsLockedPrivateBrowsingView
{
  return self->_lockedPrivateBrowsingView != 0;
}

- (void)setShowsLockedPrivateBrowsingView:(BOOL)a3 withUnlockHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  lockedPrivateBrowsingView = self->_lockedPrivateBrowsingView;
  if (lockedPrivateBrowsingView) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (v8)
  {
    if (lockedPrivateBrowsingView && !v4)
    {
      [(SFLockedPrivateBrowsingView *)lockedPrivateBrowsingView removeFromSuperview];
      double v9 = self->_lockedPrivateBrowsingView;
      self->_lockedPrivateBrowsingView = 0;

      -[TabOverview _setShowingSearchExplanationView:]((unsigned __int8 *)self, [(SFTabCollectionSearchController *)self->_searchController hasEmptyResults]);
    }
    if (!v6) {
      goto LABEL_12;
    }
  }
  else
  {
    int v12 = [SFLockedPrivateBrowsingView alloc];
    [(TabOverview *)self bounds];
    id v13 = -[SFLockedPrivateBrowsingView initWithFrame:style:](v12, "initWithFrame:style:", 1);
    uint64_t v14 = self->_lockedPrivateBrowsingView;
    self->_lockedPrivateBrowsingView = v13;

    [(TabOverview *)self addSubview:self->_lockedPrivateBrowsingView];
    if (!v6)
    {
LABEL_12:
      [(SFLockedPrivateBrowsingView *)self->_lockedPrivateBrowsingView setUnlockAction:0];
      goto LABEL_13;
    }
  }
  double v10 = (void *)MEMORY[0x1E4FB13F0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__TabOverview_setShowsLockedPrivateBrowsingView_withUnlockHandler___block_invoke;
  v15[3] = &unk_1E6D7B248;
  id v16 = v6;
  double v11 = [v10 actionWithHandler:v15];
  [(SFLockedPrivateBrowsingView *)self->_lockedPrivateBrowsingView setUnlockAction:v11];

LABEL_13:
}

- (void)_setShowingSearchExplanationView:(unsigned __int8 *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1 presentationState];
    uint64_t v5 = 2 * (v4 != 0);
    if (v4 && (a2 & 1) == 0) {
      uint64_t v5 = a1[1000];
    }
    -[TabOverview _setExplanationViewVariant:animated:]((uint64_t)a1, v5, 0);
  }
}

uint64_t __67__TabOverview_setShowsLockedPrivateBrowsingView_withUnlockHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateAllowsInteractivePresentation
{
  if (a1)
  {
    int v2 = [*(id *)(a1 + 752) hasEmptyResults];
    uint64_t v3 = *(void **)(a1 + 1008);
    if (v3) {
      v2 |= [v3 isHidden] ^ 1;
    }
    if (*(unsigned __int8 *)(a1 + 1145) != (v2 ^ 1))
    {
      *(unsigned char *)(a1 + 1145) = v2 ^ 1;
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1200));
      [WeakRetained tabOverviewDidChangeAllowsInteractivePresentation:a1];
    }
  }
}

- (TabOverviewToolbar)toolbar
{
  return self->_header;
}

- (void)searchControllerDidUpdateHasEmptyResults:(id)a3
{
  char v4 = [a3 hasEmptyResults];
  -[TabOverview _setShowingSearchExplanationView:]((unsigned __int8 *)self, v4);
}

- (void)searchControllerDidChangeEditing:(id)a3
{
  self->_shouldAnimateDimmingForSearch = 1;
  [(TabOverview *)self setNeedsLayout];
  [(TabOverview *)self layoutIfNeeded];
  self->_shouldAnimateDimmingForSearch = 0;
}

- (void)searchControllerDidEndSearch:(id)a3
{
  [(TabOverview *)self setNeedsLayout];
  [(UIVisualEffectView *)self->_dismissibleSearchBarBackground alpha];
  -[TabOverview _dismissSearchBarAnimated:]((id *)&self->super.super.super.isa, v4 == 0.0);
}

- (id)_dismissSearchBarAnimated:(id *)result
{
  if (result)
  {
    uint64_t v3 = result;
    if ([result presentationState] == 3 || !v3[152])
    {
      return 0;
    }
    else
    {
      double v4 = [v3 title];
      uint64_t v5 = [v4 length];

      double v6 = 0.0;
      if (!v5) {
        double v6 = -*((double *)v3 + 134);
      }
      [v3[53] targetLocation];
      BOOL v10 = v9 == 0.0;
      if (v11 != v6) {
        BOOL v10 = 0;
      }
      if (v7 != 0.0) {
        BOOL v10 = 0;
      }
      BOOL v12 = v8 == 0.0 && v10;
      if (!v12)
      {
        id v13 = v3[53];
        if (a2)
        {
          objc_msgSend(v13, "setTargetLocation:", 0.0, v6, 0.0, 0.0);
          [v3[53] setDecelerationFactor:0.985];
        }
        else
        {
          objc_msgSend(v13, "resetToLocation:", 0.0, v6, 0.0, 0.0);
        }
        [v3 _updateDisplayLink];
      }
      return (id *)!v12;
    }
  }
  return result;
}

uint64_t __43__TabOverview__updateIndexesMatchingSearch__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 761) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __43__TabOverview__updateIndexesMatchingSearch__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  v6[0] = (void (*)(void, void))MEMORY[0x1E4F143A8];
  v6[1] = (void (*)(void, void))3221225472;
  v6[2] = (void (*)(void, void))__26__TabOverview_insertText___block_invoke;
  v6[3] = (void (*)(void, void))&unk_1E6D7EFF0;
  id v7 = v4;
  id v5 = v4;
  -[TabOverview _passTextInputToSeachBarWithChanges:]((uint64_t)self, v6);
}

uint64_t __26__TabOverview_insertText___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stringByAppendingString:*(void *)(a1 + 32)];
}

- (uint64_t)_passTextInputToSeachBarWithChanges:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    id v4 = *(void **)(result + 680);
    id v5 = a2;
    uint64_t v6 = [v4 text];
    id v7 = (void *)v6;
    if (v6) {
      double v8 = (__CFString *)v6;
    }
    else {
      double v8 = &stru_1F3C268E8;
    }
    double v9 = ((void (**)(void, __CFString *))a2)[2](v5, v8);

    [*(id *)(v3 + 752) setSearchTerm:v9];
    BOOL v10 = *(void **)(v3 + 680);
    return [v10 becomeFirstResponder];
  }
  return result;
}

- (BOOL)hasText
{
  int v2 = [(SFTabOverviewSearchBar *)self->_searchBar text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)deleteBackward
{
  BOOL v3 = [(SFTabOverviewSearchBar *)self->_searchBar text];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    -[TabOverview _passTextInputToSeachBarWithChanges:]((uint64_t)self, __block_literal_global_133_0);
  }
}

id __29__TabOverview_deleteBackward__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") - 1);

  return v3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)smartQuotesType
{
  return 1;
}

- (int64_t)smartDashesType
{
  return 1;
}

- (int64_t)smartInsertDeleteType
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = self;
  BOOL v3 = [(TabOverview *)v2 presentationState] == 1
    || [(TabOverview *)v2 presentationState] == 2;

  return v3;
}

- (id)inputView
{
  return self->_inputView;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:a4];
  UIAnimationDragCoefficient();
  [v5 setMass:(float)(v6 + v6)];
  UIAnimationDragCoefficient();
  [v5 setStiffness:(float)(300.0 / v7)];
  [v5 setDamping:400.0];
  [v5 setVelocity:1.0];
  float v9 = 1.0;
  if (self && ![(NSArray *)self->_items count])
  {
    if (self->_dragging) {
      float v9 = 1.9;
    }
    else {
      float v9 = 1.0;
    }
  }
  *(float *)&double v8 = v9;
  [v5 setSpeed:v8];
  return v5;
}

- (id)_timingFunctionForAnimation
{
  LODWORD(v2) = 1047277443;
  LODWORD(v3) = 986933234;
  LODWORD(v4) = 1058642330;
  LODWORD(v5) = 1064243739;
  return (id)[MEMORY[0x1E4F39C10] functionWithControlPoints:v2 :v3 :v4 :v5];
}

- (CGSize)snapshotSizeForSuggestedSize:(CGSize)result
{
  double v3 = fmax(result.height, result.width * 1.5) + 200.0;
  result.CGFloat height = v3;
  return result;
}

- (double)desiredSnapshotScale
{
  if ([(NSArray *)self->_items count] <= 2) {
    uint64_t v3 = [(NSArray *)self->_items count];
  }
  else {
    uint64_t v3 = 2;
  }
  -[TabOverview _thumbnailScaleOfItemsWithCount:pinnedItemCount:](self, v3, 0);
  return result;
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

- (void)reorderingAutoscroller:(id)a3 handleScroll:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double Current = CFAbsoluteTimeGetCurrent();
  [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
  double v9 = v8;
  double v11 = v10;
  -[TabOverview _constrainLocation:]((uint64_t)self, v8 - x, v10 - y, v12, v13);
  double v15 = v14 - v9;
  double v17 = v16 - v11;
  interpolatedLocatiouint64_t n = self->_interpolatedLocation;
  -[TabOverviewInterpolatedLocation moveBy:atTime:](interpolatedLocation, "moveBy:atTime:", v15, v17, Current);
}

- (unint64_t)estimatedSnapshotsPerPageForBounds:(CGRect)a3 withTraitCollection:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [a4 preferredContentSizeCategory];
  UIContentSizeCategoryIsAccessibilityCategory(v8);
  uint64_t v9 = +[TabOverview _tabsPerRowForBounds:isAccessibilityContentSizeCategory:]();

  CGFloat v10 = +[TabOverview _itemReferenceBoundsForBounds:](x, y, width, height);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v20);
  v21.origin.CGFloat x = v10;
  v21.origin.CGFloat y = v12;
  v21.size.CGFloat width = v14;
  v21.size.CGFloat height = v16;
  float v18 = v17 / CGRectGetHeight(v21) * (double)(unint64_t)v9;
  return (unint64_t)(float)(ceilf(v18) * (float)(unint64_t)v9);
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  id v7 = a4;
  uint64_t v5 = -[TabOverview scrollToTop]((uint64_t)self);
  float v6 = v7;
  if (v7)
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v5);
    float v6 = v7;
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  if ([(TabOverview *)self presentationState] == 2)
  {
    [v6 location];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[TabOverview targetItemForDropAtPoint:](self, "targetItemForDropAtPoint:");
    double v11 = (TabOverviewItem *)objc_claimAutoreleasedReturnValue();
    p_isa = (id *)&v11->super.isa;
    if (v11 == self->_swipeClosingItem) {
      goto LABEL_7;
    }
    double v13 = -[TabOverviewItem layoutInfo]((id *)&v11->super.isa);
    int v14 = -[TabOverviewItemLayoutInfo interpolatedValuesAreSteady]((uint64_t)v13);

    if (!v14) {
      goto LABEL_7;
    }
    double v15 = dbl_1E123E350[self->_presentedTabLayout == 0];
    v32.origin.CGFloat x = -[TabOverview _itemReferenceBounds]((id *)&self->super.super.super.isa);
    double Width = CGRectGetWidth(v32);
    double v17 = -[TabOverviewItem layoutInfo](p_isa);
    -[TabOverview convertRect:fromView:](self, "convertRect:fromView:", self->_scrollingContainerView, -[TabOverviewItemLayoutInfo frame]((uint64_t)v17));
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    v33.origin.CGFloat x = v19;
    v33.origin.CGFloat y = v21;
    v33.size.CGFloat width = v23;
    v33.size.CGFloat height = v25;
    CGRect v34 = CGRectInset(v33, -(v15 * Width), -(v15 * Width));
    v31.CGFloat x = v8;
    v31.CGFloat y = v10;
    if (CGRectContainsPoint(v34, v31))
    {
      double v26 = (void *)MEMORY[0x1E4FB1AD8];
      int v27 = [p_isa UUID];
      double v28 = objc_msgSend(v26, "regionWithRect:identifier:", v27, v19, v21, v23, v25);
    }
    else
    {
LABEL_7:
      double v28 = 0;
    }
  }
  else
  {
    double v28 = 0;
  }

  return v28;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "identifier", a3);
  items = self->_items;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__TabOverview_pointerInteraction_styleForRegion___block_invoke;
  v15[3] = &unk_1E6D7EE10;
  id v7 = v5;
  id v16 = v7;
  CGFloat v8 = [(NSArray *)items safari_firstObjectPassingTest:v15];
  -[TabOverviewItem layoutInfo](v8);
  double v9 = (id *)objc_claimAutoreleasedReturnValue();
  CGFloat v10 = -[TabOverviewItemLayoutInfo itemView](v9);

  double v11 = [v10 window];

  if (v11)
  {
    CGFloat v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v10];
    double v13 = [MEMORY[0x1E4FB1AB0] effectWithPreview:v12];
    double v11 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v13 shape:0];
  }
  return v11;
}

uint64_t __49__TabOverview_pointerInteraction_styleForRegion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 UUID];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  long long v38 = [a3 nextFocusedItem];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v38;
  if (isKindOfClass)
  {
    [v38 frame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat rect = v11;
    CGFloat v13 = v12;
    [(UIView *)self->_scrollingContainerView bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = -[TabOverview _focusAreaInsets]((uint64_t)self);
    double v24 = v15 + v23;
    CGFloat v25 = v17 + v22;
    CGFloat v27 = v19 - (v23 + v26);
    double v29 = v21 - (v22 + v28);
    CGFloat v30 = v8;
    v40.origin.CGFloat x = v8;
    CGFloat v31 = v27;
    v40.origin.CGFloat y = v10;
    v40.size.CGFloat width = rect;
    CGFloat v37 = v13;
    v40.size.CGFloat height = v13;
    CGFloat v32 = v25;
    double MinY = CGRectGetMinY(v40);
    v41.origin.CGFloat x = v24;
    v41.origin.CGFloat y = v32;
    v41.size.CGFloat width = v31;
    v41.size.CGFloat height = v29;
    if (MinY >= CGRectGetMinY(v41))
    {
      v44.origin.CGFloat x = v30;
      v44.origin.CGFloat y = v10;
      v44.size.CGFloat width = rect;
      v44.size.CGFloat height = v37;
      double MaxY = CGRectGetMaxY(v44);
      v45.origin.CGFloat x = v24;
      v45.origin.CGFloat y = v32;
      v45.size.CGFloat width = v31;
      v45.size.CGFloat height = v29;
      CGFloat v35 = CGRectGetMaxY(v45);
      id v6 = v38;
      if (MaxY <= v35) {
        goto LABEL_7;
      }
      v46.origin.CGFloat x = v30;
      v46.origin.CGFloat y = v10;
      v46.size.CGFloat width = rect;
      v46.size.CGFloat height = v37;
      CGRectGetMaxY(v46);
      v47.origin.CGFloat x = v24;
      v47.origin.CGFloat y = v32;
      v47.size.CGFloat width = v31;
      v47.size.CGFloat height = v29;
      CGRectGetMaxY(v47);
    }
    else
    {
      v42.origin.CGFloat x = v30;
      v42.origin.CGFloat y = v10;
      v42.size.CGFloat width = rect;
      v42.size.CGFloat height = v37;
      CGRectGetMinY(v42);
      v43.origin.CGFloat x = v24;
      v43.size.CGFloat height = v29;
      v43.origin.CGFloat y = v32;
      v43.size.CGFloat width = v31;
      CGRectGetMinY(v43);
    }
    [(TabOverviewInterpolatedLocation *)self->_interpolatedLocation location];
    -[TabOverviewInterpolatedLocation setTargetLocation:](self->_interpolatedLocation, "setTargetLocation:");
    [(TabOverview *)self _updateDisplayLink];
    id v6 = v38;
  }
LABEL_7:
}

- (double)_focusAreaInsets
{
  if (!a1) {
    return 0.0;
  }
  -[TabOverview _effectiveSafeAreaInsets](a1);
  UIEdgeInsetsMax();
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (SFShouldHandleSelectionForPresses())
  {
    CGFloat v8 = [(NSArray *)self->_displayedItems safari_firstObjectPassingTest:&__block_literal_global_145_0];
    if (v8) {
      -[TabOverview _dismissWithItem:]((uint64_t)self, v8);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TabOverview;
    [(TabOverview *)&v9 pressesBegan:v6 withEvent:v7];
  }
}

uint64_t __38__TabOverview_pressesBegan_withEvent___block_invoke(uint64_t a1, id *a2)
{
  -[TabOverviewItem layoutInfo](a2);
  double v2 = (id *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[TabOverviewItemLayoutInfo itemView](v2);
  uint64_t v4 = [v3 isFocused];

  return v4;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(TabOverview *)self title];
  char v5 = WBSIsEqual();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_titleLabel setText:v6];
    [(TabOverview *)self setNeedsLayout];
  }
}

- (void)setBarButtonItems:(id)a3
{
  id v15 = a3;
  char v4 = WBSIsEqual();
  char v5 = v15;
  if ((v4 & 1) == 0)
  {
    id v6 = (NSArray *)[v15 copy];
    barButtonItems = self->_barButtonItems;
    self->_barButtonItems = v6;

    [(TabOverview *)self setNeedsLayout];
    NSUInteger v8 = [(NSArray *)self->_barButtonItems count];
    titleToolbar = self->_titleToolbar;
    if (v8)
    {
      if (!titleToolbar)
      {
        CGFloat v10 = (UIToolbar *)objc_alloc_init(MEMORY[0x1E4FB1DF0]);
        double v11 = self->_titleToolbar;
        self->_titleToolbar = v10;

        id v12 = objc_alloc_init(MEMORY[0x1E4FB1DF8]);
        [v12 configureWithTransparentBackground];
        [(UIToolbar *)self->_titleToolbar setStandardAppearance:v12];
        [(TabOverview *)self insertSubview:self->_titleToolbar belowSubview:self->_header];
      }
      CGFloat v13 = (UIToolbar *)[v15 mutableCopy];
      double v14 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
      [(UIToolbar *)v13 insertObject:v14 atIndex:0];

      [(UIToolbar *)self->_titleToolbar setItems:v13];
    }
    else
    {
      [(UIToolbar *)titleToolbar removeFromSuperview];
      CGFloat v13 = self->_titleToolbar;
      self->_titleToolbar = 0;
    }

    char v5 = v15;
  }
}

uint64_t __32__TabOverview__layOutTitleLabel__block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) bounds];
  CGFloat x = v44.origin.x;
  CGFloat width = v44.size.width;
  CGFloat y = v44.origin.y;
  CGFloat rect = v44.size.height;
  double v3 = CGRectGetWidth(v44);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 704), "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 704), "setBounds:", 0.0, 0.0, v3, v4);
  [*(id *)(*(void *)(a1 + 32) + 704) layoutIfNeeded];
  CGFloat v6 = *MEMORY[0x1E4F1DB20];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  objc_super v9 = [*(id *)(*(void *)(a1 + 32) + 704) items];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v14 systemItem] != 6 && objc_msgSend(v14, "systemItem") != 5)
        {
          [*(id *)(*(void *)(a1 + 32) + 704) _frameOfBarButtonItem:v14];
          v53.origin.CGFloat x = v6;
          v53.origin.CGFloat y = v5;
          v53.size.CGFloat width = v8;
          v53.size.CGFloat height = height;
          CGRect v46 = CGRectUnion(v45, v53);
          CGFloat v6 = v46.origin.x;
          CGFloat v5 = v46.origin.y;
          CGFloat v8 = v46.size.width;
          CGFloat height = v46.size.height;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v11);
  }

  int v15 = objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout");
  [*(id *)(a1 + 32) safeAreaInsets];
  double v17 = v16;
  double v18 = fmax(-[TabOverview _tabSpacing](*(void **)(a1 + 32)), v16);
  if ((v15 & 1) == 0)
  {
    v47.origin.CGFloat x = v6;
    v47.origin.CGFloat y = v5;
    v47.size.CGFloat width = v8;
    v47.size.CGFloat height = height;
    if (!CGRectIsEmpty(v47))
    {
      v48.origin.CGFloat x = v6;
      v48.origin.CGFloat y = v5;
      v48.size.CGFloat width = v8;
      v48.size.CGFloat height = height;
      double v18 = fmax(v18, CGRectGetMaxX(v48));
    }
  }
  CGFloat v32 = x;
  v49.origin.CGFloat x = x;
  v49.size.CGFloat width = width;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat height = rect;
  double v19 = CGRectGetWidth(v49);
  double v20 = v19 - fmax(-[TabOverview _tabSpacing](*(void **)(a1 + 32)), v17);
  if (v15)
  {
    v50.origin.CGFloat x = v6;
    v50.origin.CGFloat y = v5;
    v50.size.CGFloat width = v8;
    v50.size.CGFloat height = height;
    if (!CGRectIsEmpty(v50))
    {
      v51.origin.CGFloat x = v6;
      v51.origin.CGFloat y = v5;
      v51.size.CGFloat width = v8;
      v51.size.CGFloat height = height;
      double v20 = fmin(v20, CGRectGetMinX(v51));
    }
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "location", *(void *)&v32);
  [*(id *)(*(void *)(a1 + 32) + 424) location];
  exp(v21);
  double v22 = 0.0;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 696), "sizeThatFits:", v20 - v18, 0.0);
  _SFRoundRectToPixels();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 696), "setFrame:");
  v52.origin.CGFloat x = v33;
  v52.size.CGFloat height = rect;
  v52.size.CGFloat width = width;
  v52.origin.CGFloat y = y;
  CGFloat v23 = CGRectGetWidth(v52) * 0.5;
  [*(id *)(*(void *)(a1 + 32) + 696) center];
  [*(id *)(*(void *)(a1 + 32) + 704) setCenter:v23];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v24 + 657))
    {
      uint64_t v28 = *(void *)(v24 + 1152);
      if (v28)
      {
        if (v28 != 3)
        {
          if (!-[TabOverview _isDismissibleSearchBarAvailable](v24)
            || ([*(id *)(*(void *)(a1 + 32) + 680) text],
                double v29 = objc_claimAutoreleasedReturnValue(),
                uint64_t v30 = [v29 length],
                v29,
                !v30))
          {
            [*(id *)(*(void *)(a1 + 32) + 424) targetLocation];
            _SFUninterpolate();
            double v22 = v31;
          }
        }
      }
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 696) alpha];
  if (v25 != v22 || (uint64_t result = [*(id *)(*(void *)(a1 + 32) + 704) alpha], v27 != v22))
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __32__TabOverview__layOutTitleLabel__block_invoke_2;
    v37[3] = &unk_1E6D785E8;
    v37[4] = *(void *)(a1 + 32);
    *(double *)&v37[5] = v22;
    return [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:50331648 animations:v37 completion:0];
  }
  return result;
}

uint64_t __32__TabOverview__layOutTitleLabel__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 696) setAlpha:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 40);
  double v3 = *(void **)(*(void *)(a1 + 32) + 704);
  return [v3 setAlpha:v2];
}

- (BOOL)presentingInteractively
{
  return self->_pinching;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (SFTabCollectionSearchController)searchController
{
  return self->_searchController;
}

- (BOOL)lastDecelerationWasInterrupted
{
  return self->_lastDecelerationWasInterrupted;
}

- (TabOverviewThemeProviding)themeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_themeProvider);
  return (TabOverviewThemeProviding *)WeakRetained;
}

- (void)setThemeProvider:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)alternateItems
{
  return self->_alternateItems;
}

- (int64_t)alternateItemPosition
{
  return self->_alternateItemPosition;
}

- (BOOL)allowsInteractivePresentation
{
  return self->_allowsInteractivePresentation;
}

- (void)setTargetItemLiftsFromGrid:(BOOL)a3
{
  self->_targetItemLiftsFromGrid = a3;
}

- (TabOverviewItem)itemToActivate
{
  return self->_itemToActivate;
}

- (BOOL)defersActivation
{
  return self->_defersActivation;
}

- (TabOverviewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabOverviewDelegate *)WeakRetained;
}

- (double)alternateBottomSafeAreaInset
{
  return self->_alternateBottomSafeAreaInset;
}

- (int64_t)barPlacement
{
  return self->_barPlacement;
}

- (int64_t)presentedTabLayout
{
  return self->_presentedTabLayout;
}

- (NSArray)barButtonItems
{
  return self->_barButtonItems;
}

- (BOOL)isInSteadyState
{
  return self->_inSteadyState;
}

- (id)stateUpdateHandler
{
  return self->_stateUpdateHandler;
}

- (void)setStateUpdateHandler:(id)a3
{
}

- (id)pptStateUpdateHandler
{
  return self->_pptStateUpdateHandler;
}

- (void)setPptStateUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pptStateUpdateHandler, 0);
  objc_storeStrong(&self->_stateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemToActivate, 0);
  objc_storeStrong((id *)&self->_alternateItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_themeProvider);
  objc_storeStrong((id *)&self->_lockedPrivateBrowsingView, 0);
  objc_storeStrong((id *)&self->_titleSizingItemView, 0);
  objc_storeStrong((id *)&self->_dismissibleSearchBarBackground, 0);
  objc_storeStrong((id *)&self->_statusBarGradient, 0);
  objc_storeStrong((id *)&self->_explanationView, 0);
  objc_storeStrong((id *)&self->_itemViewReuseStack, 0);
  objc_storeStrong((id *)&self->_itemActivationTimer, 0);
  objc_storeStrong((id *)&self->_interactivePresentationStartingItem, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_gridVisualizationView, 0);
  objc_storeStrong((id *)&self->_menuPreviewContainerView, 0);
  objc_storeStrong((id *)&self->_scrollingContainerView, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_titleToolbar, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_previewContainers, 0);
  objc_storeStrong((id *)&self->_itemsShowingContextMenu, 0);
  objc_storeStrong((id *)&self->_deferredClosingItems, 0);
  objc_storeStrong((id *)&self->_swipeClosingItem, 0);
  objc_storeStrong((id *)&self->_reorderingAutoscroller, 0);
  objc_storeStrong((id *)&self->_interactivelyLiftingItem, 0);
  objc_storeStrong((id *)&self->_visiblyCenteredItem, 0);
  objc_storeStrong((id *)&self->_activeItem, 0);
  objc_storeStrong((id *)&self->_cursorInteraction, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_tabCloseRecognizer, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_displayedItems, 0);
  objc_storeStrong((id *)&self->_interpolatedLocation, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_presentationObservers, 0);
}

- (void)copyGeometryFromTabOverview:(id *)a3 .cold.1(void **a1, void *a2, id *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v4 = *a1;
  CGFloat v5 = a2;
  uint64_t v6 = [v4 count];
  uint64_t v7 = [*a3 count];
  int v8 = 134218240;
  uint64_t v9 = v6;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  _os_log_fault_impl(&dword_1E102C000, v5, OS_LOG_TYPE_FAULT, "-[TabOverview copyGeometryFromTabView:] cannot copy geometry with mismatched item counts (%zu != %zu)", (uint8_t *)&v8, 0x16u);
}

- (void)_tabClose:(os_log_t)log .cold.1(os_log_t log, double a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1E102C000, log, OS_LOG_TYPE_DEBUG, "Update swiping to close tab overview item with translation: %f", (uint8_t *)&v2, 0xCu);
}

- (void)updateInteractivePresentationWithOffset:(CGFloat)a3 scale:(double)a4 animated:.cold.1(void *a1, CGFloat a2, CGFloat a3, double a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a1;
  v14.CGFloat x = a2;
  v14.CGFloat y = a3;
  int v8 = NSStringFromCGPoint(v14);
  int v9 = 138543618;
  __int16 v10 = v8;
  __int16 v11 = 2048;
  double v12 = a4;
  _os_log_debug_impl(&dword_1E102C000, v7, OS_LOG_TYPE_DEBUG, "Update interactive tab overview presentation with offset: %{public}@, scale: %f", (uint8_t *)&v9, 0x16u);
}

@end