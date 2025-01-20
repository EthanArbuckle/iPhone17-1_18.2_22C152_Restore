@interface SBIconListView
+ (CGRect)defaultFrameForOrientation:(int64_t)a3;
+ (id)builtInAnimatorForAnimationType:(int64_t)a3;
+ (id)clusterAnimator;
+ (id)defaultAnimator;
+ (id)dominoAnimator;
+ (id)layoutMetricsForParameters:(SBIconListLayoutMetricsParameters *)a3 listModel:(id)a4;
+ (id)multiStageAnimator;
+ (int64_t)rotationAnchor;
+ (unint64_t)defaultIconViewConfigurationOptions;
+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4;
+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4 allowGaps:(BOOL)a5;
+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4 flippedLayout:(BOOL)a5 allowGaps:(BOOL)a6;
- (BOOL)_allowsFocusToLeaveViaHeading:(unint64_t)a3;
- (BOOL)_iconMatchingCoordinateBeginsInThatRow:(SBIconCoordinate)a3 metrics:(id)a4;
- (BOOL)_shouldEnforceLayoutInsetsForAxis:(unint64_t)a3;
- (BOOL)adaptsOrientationToTraitCollection;
- (BOOL)addsFocusGuidesForWrapping;
- (BOOL)adjustsColumnPositionsForFullScreenWidth;
- (BOOL)alignsIconsOnPixelBoundaries;
- (BOOL)allowsAddingIconCount:(unint64_t)a3;
- (BOOL)allowsGaps;
- (BOOL)allowsReordering;
- (BOOL)automaticallyAdjustsLayoutMetricsToFit;
- (BOOL)automaticallyShowsEmptyGridCellsWhileEditing;
- (BOOL)boundsSizeTracksContentSize;
- (BOOL)containsIcon:(id)a3;
- (BOOL)containsWidget;
- (BOOL)getIconGridRange:(SBHIconGridRange *)a3 forGridCellIndex:(unint64_t)a4 metrics:(id)a5;
- (BOOL)getIconStartGridCellIndex:(unint64_t *)a3 gridSize:(SBHIconGridSize *)a4 forGridCellIndex:(unint64_t)a5 metrics:(id)a6;
- (BOOL)hasOverridingLayoutDelegates;
- (BOOL)hasSetIconSpacingAxisMatchingBehavior;
- (BOOL)hasTemporaryModel;
- (BOOL)iconsNeedLayout;
- (BOOL)isDisplayingIcon:(id)a3;
- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4;
- (BOOL)isDisplayingIconView:(id)a3;
- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4;
- (BOOL)isDisplayingWidgetIntroduction;
- (BOOL)isDock;
- (BOOL)isDragSpringloadingEnabled;
- (BOOL)isEditing;
- (BOOL)isEmpty;
- (BOOL)isFull;
- (BOOL)isLayoutFlipped;
- (BOOL)isLayoutPausedForIconView:(id)a3;
- (BOOL)isLayoutReversed;
- (BOOL)isOccluded;
- (BOOL)isPurged;
- (BOOL)isRTL;
- (BOOL)isShowingAllIcons;
- (BOOL)isTransitioningIconLocation;
- (BOOL)isVertical;
- (BOOL)isVisiblySettled;
- (BOOL)isWidgetIntroductionVertical;
- (BOOL)modelHasNonDefaultSizedIcons;
- (BOOL)pausesIconsForScrolling;
- (BOOL)restoreDraggedIconView:(id)a3;
- (BOOL)shouldReparentView:(id)a3;
- (BOOL)showsEmptyGridCells;
- (BOOL)wantsFastIconReordering;
- (CGPoint)_alignedIconPointForPoint:(CGPoint)a3;
- (CGPoint)centerForDraggedIconView:(id)a3;
- (CGPoint)centerForIcon:(id)a3;
- (CGPoint)centerForIcon:(id)a3 metrics:(id)a4;
- (CGPoint)centerForIconAtIndex:(unint64_t)a3;
- (CGPoint)centerForIconAtIndex:(unint64_t)a3 metrics:(id)a4;
- (CGPoint)centerForIconCoordinate:(SBIconCoordinate)a3;
- (CGPoint)centerForIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (CGPoint)fractionalCoordinateAtPoint:(CGPoint)a3;
- (CGPoint)originForIcon:(id)a3;
- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3;
- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5;
- (CGPoint)originForIconAtIndex:(unint64_t)a3;
- (CGRect)_enforceLayoutInsetsOnRectForCellAtIconCoordinate:(SBIconCoordinate)a3 gridSizeClass:(id)a4 proposedFrame:(CGRect)a5 metrics:(id)a6;
- (CGRect)_introductionContainerViewFrameForView:(id)a3;
- (CGRect)_widgetIconLayoutRect;
- (CGRect)fullRectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5;
- (CGRect)fullRectForDefaultSizedCellAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (CGRect)fullRectForGridRange:(SBHIconGridRange)a3 metrics:(id)a4;
- (CGRect)iconLayoutRect;
- (CGRect)rectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (CGRect)rectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5;
- (CGRect)rectForDefaultSizedCellAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (CGRect)rectForDefaultSizedCellsOfSize:(SBHIconGridSize)a3 startingAtCoordinate:(SBIconCoordinate)a4 metrics:(id)a5;
- (CGRect)rectForDefaultSizedCellsOfSizeClass:(id)a3 startingAtCoordinate:(SBIconCoordinate)a4 metrics:(id)a5;
- (CGRect)rectForDragHitRegion:(unint64_t)a3 forCellAtCoordinate:(SBIconCoordinate)a4 options:(unint64_t)a5;
- (CGRect)rectForDragHitRegion:(unint64_t)a3 forDefaultSizedCellAtCoordinate:(SBIconCoordinate)a4;
- (CGRect)rectForDragHitRegion:(unint64_t)a3 forIconAtCoordinate:(SBIconCoordinate)a4;
- (CGRect)rectForGridRange:(SBHIconGridRange)a3;
- (CGRect)rectForIcon:(id)a3;
- (CGRect)rectForIconAtIndex:(unint64_t)a3;
- (CGRect)rectForIconCoordinate:(SBIconCoordinate)a3;
- (CGRect)rectForIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (CGSize)alignmentIconViewSize;
- (CGSize)effectiveIconSpacing;
- (CGSize)iconImageSize;
- (CGSize)iconSpacing;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)baseIconViewClass;
- (NSArray)icons;
- (NSArray)visibleIcons;
- (NSIndexSet)visibleGridCellIndexes;
- (NSLayoutConstraint)widgetIntroductionPopoverLeadingAnchorConstraint;
- (NSLayoutConstraint)widgetIntroductionPopoverTopAnchorConstraint;
- (NSString)description;
- (NSString)iconDragTypeIdentifier;
- (NSString)iconLocation;
- (NSString)iconLocationWithWidgets;
- (NSString)iconLocationWithoutWidgets;
- (NSString)layoutDescription;
- (SBFolder)temporaryFolder;
- (SBFolderIconImageCache)folderIconImageCache;
- (SBHIconGridRange)closestGridRangeForIconOfSize:(SBHIconGridSize)a3 centeredAtPoint:(CGPoint)a4;
- (SBHIconGridRange)gridRangeForIconAtIndex:(unint64_t)a3;
- (SBHIconGridRange)gridRangeForRect:(CGRect)a3;
- (SBHIconGridRange)iconGridRangeForGridCellIndex:(unint64_t)a3 metrics:(id)a4 options:(unint64_t)a5;
- (SBHIconGridRange)iconGridRangeForIndex:(unint64_t)a3 metrics:(id)a4;
- (SBHIconGridRange)visibleGridRange;
- (SBHIconGridSize)gridSizeForCurrentOrientation;
- (SBHIconGridSize)iconGridSizeForClass:(id)a3;
- (SBHIconImageAppearance)overrideIconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration;
- (SBIcon)extraIconForFolderCollapseSpecialIconAnimation;
- (SBIconCoordinate)_coordinateAfterCoordinate:(SBIconCoordinate)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 metrics:(id)a6;
- (SBIconCoordinate)_coordinateBeforeCoordinate:(SBIconCoordinate)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 metrics:(id)a6;
- (SBIconCoordinate)coordinateAtPoint:(CGPoint)a3;
- (SBIconCoordinate)coordinateAtPoint:(CGPoint)a3 metrics:(id)a4;
- (SBIconCoordinate)coordinateForIcon:(id)a3;
- (SBIconCoordinate)coordinateForIconAtIndex:(unint64_t)a3;
- (SBIconCoordinate)iconCoordinateForGridCellIndex:(unint64_t)a3 metrics:(id)a4;
- (SBIconCoordinate)iconCoordinateForIndex:(unint64_t)a3 forOrientation:(int64_t)a4;
- (SBIconCoordinate)iconCoordinateForIndex:(unint64_t)a3 metrics:(id)a4;
- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3;
- (SBIconListLayout)layout;
- (SBIconListLayoutDelegate)layoutDelegate;
- (SBIconListLayoutProvider)layoutProvider;
- (SBIconListModel)displayedModel;
- (SBIconListModel)model;
- (SBIconListModel)temporaryModel;
- (SBIconListPredictedVisibleColumn)predictedVisibleColumn;
- (SBIconListPredictedVisibleRow)predictedVisibleRow;
- (SBIconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7;
- (SBIconListViewDragDelegate)dragDelegate;
- (SBIconListViewDragDelegate)effectiveDragDelegate;
- (SBIconListViewIconLocationTransitionHandler)currentIconLocationTransitionHandler;
- (SBIconListViewLayoutMetrics)layoutMetrics;
- (SBIconListViewReorderingDelegate)reorderingDelegate;
- (SBIconView)canceledDraggingIconView;
- (SBIconViewProviding)iconViewProvider;
- (SBIconWidgetIntroductionDelegate)widgetIntroductionDelegate;
- (SBIconWidgetIntroductionPopoverView)widgetIntroductionPopover;
- (SBIconWidgetIntroductionView)pronouncedContainerView;
- (UIEdgeInsets)additionalLayoutInsets;
- (UIEdgeInsets)cursorHitTestingInsetsForIconSpacing:(CGSize)a3;
- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3;
- (_NSRange)_allIconsVisibleColumnOrRowRange;
- (_NSRange)visibleColumnRange;
- (_NSRange)visibleRowRange;
- (_UILegibilitySettings)legibilitySettings;
- (double)_leadingSpacingForWidgetIntroductionPopoverView;
- (double)_topSpacingForWidgetIntroductionPopoverView;
- (double)continuousCornerRadiusForGridSizeClass:(id)a3;
- (double)horizontalBumpForColumn:(unint64_t)a3 metrics:(id)a4;
- (double)horizontalIconPadding;
- (double)iconContentScale;
- (double)layoutScale;
- (double)verticalIconPadding;
- (id)_iconForDragItem:(id)a3;
- (id)_stateCaptureString;
- (id)addOverridingLayoutDelegate:(id)a3 reason:(id)a4;
- (id)addPlaceholderAtGridCellIndex:(unint64_t)a3 gridSizeClass:(id)a4 reason:(id)a5 options:(unint64_t)a6;
- (id)addPlaceholderAtGridCellIndex:(unint64_t)a3 representingIcon:(id)a4 reason:(id)a5 options:(unint64_t)a6;
- (id)addPlaceholderRepresentingIcon:(id)a3 reason:(id)a4 options:(unint64_t)a5;
- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5;
- (id)beginTransitionToIconLocation:(id)a3 reason:(id)a4;
- (id)dequeueReusableIconView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayedIconViewForIcon:(id)a3;
- (id)effectiveIconImageAppearance;
- (id)effectiveLayoutDelegateForSelector:(SEL)a3;
- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4;
- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4;
- (id)gridCellInfo;
- (id)gridSizeClassDomain;
- (id)iconAtCoordinate:(SBIconCoordinate)a3;
- (id)iconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (id)iconAtGridCellIndex:(unint64_t)a3 metrics:(id)a4;
- (id)iconAtPoint:(CGPoint)a3 index:(unint64_t *)a4;
- (id)iconGridSizeClassForIconGridSize:(SBHIconGridSize)a3;
- (id)iconGridSizeClassSizes;
- (id)iconViewForCoordinate:(SBIconCoordinate)a3;
- (id)iconViewForGridCellIndex:(unint64_t)a3;
- (id)iconViewForIcon:(id)a3;
- (id)iconViewForIcon:(id)a3 location:(id)a4;
- (id)iconVisibilityInfoForRect:(CGRect)a3 normalized:(BOOL)a4;
- (id)layoutMetricsForModel:(id)a3;
- (id)layoutMetricsForOrientation:(int64_t)a3;
- (id)makeEmptyGridCellView;
- (id)makeIconView;
- (id)pauseLayoutForIconView:(id)a3 forReason:(id)a4;
- (id)removedIcons;
- (id)requireAllIconsShownForReason:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)temporarilyMappedIconForIcon:(id)a3;
- (id)tintColor;
- (id)visibleGridCellIndexesWithMetrics:(id)a3;
- (id)visibleIconIndexes;
- (id)widgetIconsForIntroductionContainerView;
- (int64_t)effectiveIconSpacingAxisMatchingBehavior;
- (int64_t)iconInsertionAnimationOriginatingEdge;
- (int64_t)iconRemovalAnimationDestinationEdge;
- (int64_t)iconSpacingAxisMatchingBehavior;
- (int64_t)layoutInsetsMode;
- (int64_t)layoutOrientation;
- (int64_t)orientation;
- (int64_t)userInterfaceLayoutDirection;
- (unint64_t)automaticallyReversedLayoutOrientations;
- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4;
- (unint64_t)bestIndexForInsertingIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4;
- (unint64_t)columnAtPoint:(CGPoint)a3;
- (unint64_t)columnAtPoint:(CGPoint)a3 fractionOfDistanceThroughColumn:(double *)a4;
- (unint64_t)columnAtPoint:(CGPoint)a3 metrics:(id)a4 fractionOfDistanceThroughColumn:(double *)a5;
- (unint64_t)contentVisibility;
- (unint64_t)dragHitRegionForPoint:(CGPoint)a3 icon:(id)a4;
- (unint64_t)folderMutationOptionsForIconLayoutHidingAssertion:(id)a3;
- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (unint64_t)gridCellIndexForFirstPlaceholder;
- (unint64_t)gridCellIndexForIcon:(id)a3;
- (unint64_t)gridCellIndexForIconView:(id)a3;
- (unint64_t)gridCellInfoOptions;
- (unint64_t)iconColumnsForCurrentOrientation;
- (unint64_t)iconIndexForCoordinate:(SBIconCoordinate)a3 metrics:(id)a4;
- (unint64_t)iconIndexForGridCellIndex:(unint64_t)a3 metrics:(id)a4;
- (unint64_t)iconRowsForCurrentOrientation;
- (unint64_t)iconViewConfigurationOptions;
- (unint64_t)iconViewUserVisibilityStatus;
- (unint64_t)indexForCoordinate:(SBIconCoordinate)a3 forOrientation:(int64_t)a4;
- (unint64_t)indexForCoordinate:(SBIconCoordinate)a3 forOrientation:(int64_t)a4 metrics:(id)a5;
- (unint64_t)indexOfIcon:(id)a3;
- (unint64_t)listMutationOptionsForIconLayoutHidingAssertion:(id)a3;
- (unint64_t)maximumIconCount;
- (unint64_t)numberOfDisplayedIconViews;
- (unint64_t)rowAtPoint:(CGPoint)a3;
- (unint64_t)rowAtPoint:(CGPoint)a3 fractionOfDistanceThroughRow:(double *)a4;
- (unint64_t)rowAtPoint:(CGPoint)a3 metrics:(id)a4 fractionOfDistanceThroughRow:(double *)a5;
- (unint64_t)rowForIcon:(id)a3;
- (unint64_t)userInterfaceLayoutDirectionHandling;
- (void)_addIconViewsForIcons:(id)a3;
- (void)_addIconViewsForIcons:(id)a3 metrics:(id)a4;
- (void)_applyIconPaddingSettings;
- (void)_captureOnlyBackgroundAssertionDidInvalidate:(id)a3;
- (void)_cleanupIconViewsForRemovedIcons:(id)a3;
- (void)_getDragRegionRects:(SBIconListViewCellDragRegionRects *)a3 forIconCoordinate:(SBIconCoordinate)a4 iconImageFrame:(CGRect)a5 overlapWindowFraction:(double)a6 metrics:(id)a7 options:(unint64_t)a8;
- (void)_getDragRegionRects:(SBIconListViewCellDragRegionRects *)a3 forIconView:(id)a4;
- (void)_getRTLAwareRowIndex:(int64_t *)a3 columnIndex:(int64_t *)a4 forGridCellIndex:(unint64_t)a5 iconGridSize:(SBHIconGridSize)a6 metrics:(id)a7;
- (void)_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged;
- (void)_insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:(id)a3;
- (void)_insertOrRemoveCaptureOnlyBackgroundViewIfNecessaryForIconView:(id)a3;
- (void)_removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:(id)a3;
- (void)_removeIconViewsForIcons:(id)a3;
- (void)_setupLayoutRunLoopObserver;
- (void)_setupStateCaptureHandleIfNeeded;
- (void)_teardownLayoutRunloopObserverIfNeeded;
- (void)_teardownStateCapture;
- (void)_updateEditingStateForIcons:(id)a3 animated:(BOOL)a4;
- (void)_updateVisibleIconViewsWithOldVisibleGridCellIndexes:(id)a3 metrics:(id)a4;
- (void)addDragObserver:(id)a3 forDropSession:(id)a4;
- (void)addIconViewConfigurationOption:(unint64_t)a3;
- (void)addLayoutObserver:(id)a3;
- (void)addPronouncedContainerViewWithDelegate:(id)a3 vertical:(BOOL)a4;
- (void)bringWidgetIntroductionPopoverToFront;
- (void)clearDraggedIconViews;
- (void)clearDraggedIconViewsExcludingSet:(id)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)dealloc;
- (void)didAddIconView:(id)a3;
- (void)didAddSubview:(id)a3;
- (void)didMoveToWindow;
- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4;
- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3;
- (void)enumerateIconViewsUsingBlock:(id)a3;
- (void)enumerateIconsUsingBlock:(id)a3;
- (void)enumerateKnownIconViewsUsingBlock:(id)a3;
- (void)enumerateVisibleIconsUsingBlock:(id)a3;
- (void)forgetIconView:(id)a3;
- (void)getLayoutMetricsParameters:(SBIconListLayoutMetricsParameters *)a3;
- (void)getLayoutMetricsParameters:(SBIconListLayoutMetricsParameters *)a3 orientation:(int64_t)a4;
- (void)hideAllIcons;
- (void)iconList:(id)a3 didAddIcon:(id)a4;
- (void)iconList:(id)a3 didMoveIcon:(id)a4;
- (void)iconList:(id)a3 didRemoveIcon:(id)a4;
- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5;
- (void)iconLocationTransitionHandler:(id)a3 completeTransition:(BOOL)a4;
- (void)iconLocationTransitionHandler:(id)a3 setProgress:(double)a4;
- (void)iconView:(id)a3 willCancelDragForItem:(id)a4;
- (void)iconViewDidEndDrag:(id)a3;
- (void)ignoreNextWindowChange;
- (void)layOutEmptyGridCellViewsUsingAnimator:(id)a3;
- (void)layoutAndCreateIcon:(id)a3;
- (void)layoutAndCreateIcon:(id)a3 atIndex:(unint64_t)a4;
- (void)layoutFocusGuides;
- (void)layoutHidingAssertionDidChange:(id)a3;
- (void)layoutHidingAssertionDidInvalidate:(id)a3;
- (void)layoutIconsIfNeeded;
- (void)layoutIconsIfNeeded:(double)a3;
- (void)layoutIconsIfNeededUsingAnimator:(id)a3 options:(unint64_t)a4;
- (void)layoutIconsIfNeededWithAnimationType:(int64_t)a3 options:(unint64_t)a4;
- (void)layoutIconsNow;
- (void)layoutSubviews;
- (void)layoutWidgetIntroductionViews;
- (void)markIcon:(id)a3 asNeedingAnimation:(int64_t)a4;
- (void)performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4;
- (void)performDefaultAnimatedLayoutUpdateForIconView:(id)a3 withParameters:(SBIconListLayoutAnimationParameters *)a4;
- (void)performDefaultAnimatedRemovalForIconViews:(id)a3 completionHandler:(id)a4;
- (void)performSpecialIconAnimation:(int64_t)a3 icon:(id)a4 completionHandler:(id)a5;
- (void)performSpecialIconAnimationsWithCompletionHandler:(id)a3;
- (void)performZoomInSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4;
- (void)performZoomOutSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4;
- (void)placeholderAssertionDidChangePosition:(id)a3;
- (void)regenerateTemporaryDisplayedModelIfNecessary;
- (void)removeAllIconAnimations;
- (void)removeAllIconViews;
- (void)removeIconView:(id)a3;
- (void)removeIconView:(id)a3 force:(BOOL)a4;
- (void)removeIconViewConfigurationOption:(unint64_t)a3;
- (void)removeLayoutObserver:(id)a3;
- (void)removeOverridingLayoutDelegateAssertion:(id)a3;
- (void)removePauseLayoutAssertion:(id)a3;
- (void)removePlaceholderAssertion:(id)a3;
- (void)removePronouncedContainerView;
- (void)removeShowAllIconsAssertion:(id)a3;
- (void)setAdditionalLayoutInsets:(UIEdgeInsets)a3;
- (void)setAddsFocusGuidesForWrapping:(BOOL)a3;
- (void)setAdjustsColumnPositionsForFullScreenWidth:(BOOL)a3;
- (void)setAlignsIconsOnPixelBoundaries:(BOOL)a3;
- (void)setAllowsGaps:(BOOL)a3;
- (void)setAllowsReordering:(BOOL)a3;
- (void)setAlphaForAllIcons:(double)a3;
- (void)setAutomaticallyAdjustsLayoutMetricsToFit:(BOOL)a3;
- (void)setAutomaticallyReversedLayoutOrientations:(unint64_t)a3;
- (void)setAutomaticallyShowsEmptyGridCellsWhileEditing:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setBoundsSizeTracksContentSize:(BOOL)a3;
- (void)setCanceledDraggingIconView:(id)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setCurrentIconLocationTransitionHandler:(id)a3;
- (void)setDisplayedModel:(id)a3;
- (void)setDragDelegate:(id)a3;
- (void)setDragSpringloadingEnabled:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setExtraIconForFolderCollapseSpecialIconAnimation:(id)a3;
- (void)setFolderIconImageCache:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasSetIconSpacingAxisMatchingBehavior:(BOOL)a3;
- (void)setIconContentScale:(double)a3;
- (void)setIconDragTypeIdentifier:(id)a3;
- (void)setIconImageCache:(id)a3;
- (void)setIconLocation:(id)a3;
- (void)setIconLocationWithWidgets:(id)a3;
- (void)setIconLocationWithoutWidgets:(id)a3;
- (void)setIconSpacing:(CGSize)a3;
- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3;
- (void)setIconViewConfigurationOptions:(unint64_t)a3;
- (void)setIconViewProvider:(id)a3;
- (void)setIconsLabelAlpha:(double)a3;
- (void)setIconsNeedLayout;
- (void)setIsWidgetIntroductionVertical:(BOOL)a3;
- (void)setLayoutDelegate:(id)a3;
- (void)setLayoutInsetsMode:(int64_t)a3;
- (void)setLayoutProvider:(id)a3;
- (void)setLayoutProvider:(id)a3 animated:(BOOL)a4;
- (void)setLayoutReversed:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setModel:(id)a3;
- (void)setOccluded:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOverrideIconImageAppearance:(id)a3;
- (void)setOverrideIconImageStyleConfiguration:(id)a3;
- (void)setPausesIconsForScrolling:(BOOL)a3;
- (void)setPredictedVisibleColumn:(SBIconListPredictedVisibleColumn)a3;
- (void)setPredictedVisibleRow:(SBIconListPredictedVisibleRow)a3;
- (void)setPronouncedContainerView:(id)a3;
- (void)setPurged:(BOOL)a3;
- (void)setReorderingDelegate:(id)a3;
- (void)setShowsEmptyGridCells:(BOOL)a3;
- (void)setShowsEmptyGridCells:(BOOL)a3 animated:(BOOL)a4;
- (void)setTemporaryFolder:(id)a3;
- (void)setTemporaryModel:(id)a3;
- (void)setUserInterfaceLayoutDirectionHandling:(unint64_t)a3;
- (void)setVisibleColumnRange:(_NSRange)a3;
- (void)setVisibleColumnRange:(_NSRange)a3 predictedVisibleColumn:(SBIconListPredictedVisibleColumn)a4;
- (void)setVisibleColumnRange:(_NSRange)a3 predictedVisibleColumn:(SBIconListPredictedVisibleColumn)a4 visibleRowRange:(_NSRange)a5 predictedVisibleRow:(SBIconListPredictedVisibleRow)a6;
- (void)setVisibleRowRange:(_NSRange)a3;
- (void)setVisibleRowRange:(_NSRange)a3 predictedVisibleRow:(SBIconListPredictedVisibleRow)a4;
- (void)setVisiblySettled:(BOOL)a3;
- (void)setWantsFastIconReordering:(BOOL)a3;
- (void)setWidgetIntroductionDelegate:(id)a3;
- (void)setWidgetIntroductionPopover:(id)a3;
- (void)setWidgetIntroductionPopoverLeadingAnchorConstraint:(id)a3;
- (void)setWidgetIntroductionPopoverTopAnchorConstraint:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)showAllIcons;
- (void)startAnimatingPronouncedContainerAndPopoverView;
- (void)stopAnimatingPronouncedContainerAndPopoverView;
- (void)updateEditingStateAnimated:(BOOL)a3;
- (void)updateIconLocationWithNonDefaultSizedIcons;
- (void)updateIconLocationWithNonDefaultSizedIcons:(BOOL)a3;
- (void)updateIconViewForIcon:(id)a3 toIcon:(id)a4;
- (void)updateReversedLayoutBasedOnOrientation;
- (void)willMoveToWindow:(id)a3;
- (void)willRotateWithTransitionCoordinator:(id)a3;
@end

@implementation SBIconListView

- (SBIconListLayout)layout
{
  v3 = [(SBIconListView *)self layoutProvider];
  v4 = [(SBIconListView *)self iconLocation];
  v5 = [v3 layoutForIconLocation:v4];

  return (SBIconListLayout *)v5;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

void __43__SBIconListView_enumerateIconsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __47__SBIconListView_enumerateIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) displayedIconViewForIcon:a2];
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v3 = v4;
  }
}

- (id)displayedIconViewForIcon:(id)a3
{
  id v4 = a3;
  v5 = [(NSMapTable *)self->_iconViews objectForKey:v4];
  if (!v5)
  {
    if ([v4 isFolderIcon]
      && [(SBIconListView *)self hasTemporaryModel])
    {
      v6 = [(SBIconListView *)self temporarilyMappedIconForIcon:v4];
      v5 = [(NSMapTable *)self->_iconViews objectForKey:v6];
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (SBIconListLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (double)layoutScale
{
  v2 = [(SBIconListView *)self layout];
  [v2 iconImageInfo];
  if (v3 == 0.0) {
    double v4 = 1.0;
  }
  else {
    double v4 = v3;
  }

  return v4;
}

void __39__SBIconListView_setContentVisibility___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setContentVisibility:v3];
  [v4 setUserVisibilityStatus:*(void *)(a1 + 40)];
}

uint64_t __36__SBIconListView_setVisiblySettled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserVisibilityStatus:*(void *)(a1 + 32)];
}

- (unint64_t)columnAtPoint:(CGPoint)a3 fractionOfDistanceThroughColumn:(double *)a4
{
  double y = a3.y;
  double x = a3.x;
  v8 = [(SBIconListView *)self layoutMetrics];
  unint64_t v9 = -[SBIconListView columnAtPoint:metrics:fractionOfDistanceThroughColumn:](self, "columnAtPoint:metrics:fractionOfDistanceThroughColumn:", v8, a4, x, y);

  return v9;
}

- (SBIconListViewLayoutMetrics)layoutMetrics
{
  cachedMetrics = self->_cachedMetrics;
  if (!cachedMetrics)
  {
    memset(v8, 0, sizeof(v8));
    [(SBIconListView *)self getLayoutMetricsParameters:v8];
    id v4 = [(SBIconListView *)self displayedModel];
    v5 = [(id)objc_opt_class() layoutMetricsForParameters:v8 listModel:v4];
    v6 = self->_cachedMetrics;
    self->_cachedMetrics = v5;

    cachedMetrics = self->_cachedMetrics;
  }
  return cachedMetrics;
}

- (BOOL)isRTL
{
  return [(SBIconListView *)self userInterfaceLayoutDirection] == 1;
}

- (int64_t)userInterfaceLayoutDirection
{
  unint64_t v2 = [(SBIconListView *)self userInterfaceLayoutDirectionHandling];
  if (v2 == 2) {
    return 1;
  }
  if (v2) {
    return 0;
  }
  uint64_t v3 = (void *)*MEMORY[0x1E4FB2608];
  return [v3 userInterfaceLayoutDirection];
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  return self->_userInterfaceLayoutDirectionHandling;
}

- (void)_getRTLAwareRowIndex:(int64_t *)a3 columnIndex:(int64_t *)a4 forGridCellIndex:(unint64_t)a5 iconGridSize:(SBHIconGridSize)a6 metrics:(id)a7
{
  id v22 = a7;
  BOOL v12 = [(SBIconListView *)self isRTL];
  unint64_t v13 = [v22 columns];
  unint64_t v14 = a5 / v13;
  unint64_t v15 = a5 % v13;
  if (v12)
  {
    uint64_t v16 = v13;
    unint64_t v17 = [(SBIconListView *)self layoutInsetsMode];
    if (v17 >= 2)
    {
      if (v17 == 2)
      {
        v19 = [v22 gridCellInfo];
        uint64_t v16 = [v19 numberOfUsedColumns];

        v20 = [v22 gridCellInfo];
        uint64_t v18 = [v20 numberOfUsedRows];
      }
      else
      {
        uint64_t v16 = 0;
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = [v22 rows];
    }
    if ([(SBIconListView *)self isVertical]) {
      unint64_t v14 = ~v14 + 1 - a6.rows + v18;
    }
    else {
      unint64_t v15 = ~v15 - a6.columns + v16 + 1;
    }
  }
  uint64_t v21 = [v22 columnOffset];
  if (a3) {
    *a3 = v14;
  }
  if (a4) {
    *a4 = v21 + v15;
  }
}

- (CGRect)rectForDefaultSizedCellAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v7 = a4;
  [v7 iconSize];
  double v9 = v8;
  double v11 = v10;
  [v7 iconSpacing];
  double v13 = v12;
  double v15 = v14;
  [v7 iconInsets];
  double v17 = v16;
  double v19 = v18;
  [(SBIconListView *)self layoutScale];
  BOOL v20 = [(SBIconListView *)self alignsIconsOnPixelBoundaries];
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    BOOL v27 = v20;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    -[SBIconListView _getRTLAwareRowIndex:columnIndex:forGridCellIndex:iconGridSize:metrics:](self, "_getRTLAwareRowIndex:columnIndex:forGridCellIndex:iconGridSize:metrics:", &v33, &v32, -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v7), 65537, v7);
    double v22 = v19 + (double)v32 * (v9 + v13);
    BOOL v28 = v32 >= 0 && v27;
    if (v28 && [v7 needsHorizontalColumnBumps])
    {
      [(SBIconListView *)self horizontalBumpForColumn:v32 metrics:v7];
      double v22 = v22 + v29;
    }
    double v21 = v17 + (double)v33 * (v11 + v15);
    if (v27)
    {
      SBFFloatFloorForScale();
      double v22 = v30;
      SBFFloatFloorForScale();
      double v21 = v31;
    }
  }
  else
  {
    double v22 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v23 = v22;
  double v24 = v21;
  double v25 = v9;
  double v26 = v11;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (unint64_t)columnAtPoint:(CGPoint)a3 metrics:(id)a4 fractionOfDistanceThroughColumn:(double *)a5
{
  double x = a3.x;
  id v8 = a4;
  [v8 iconSize];
  double v10 = v9;
  [v8 iconSpacing];
  double v12 = v11;
  [v8 iconInsets];
  double v14 = v13;
  uint64_t v15 = [v8 columnOffset];
  uint64_t v16 = [v8 columnsUsedForLayout];
  if (!v16)
  {
    if (a5)
    {
      unint64_t v20 = 0;
      *a5 = 0.0;
      goto LABEL_26;
    }
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  BOOL v18 = [(SBIconListView *)self isRTL];
  unint64_t v19 = v17 - 1;
  if (v17 == 1)
  {
    double v24 = 0.0;
LABEL_13:
    [(SBIconListView *)self bounds];
    double v26 = (x - v24) / (CGRectGetMaxX(v29) - v24);
    if (!v18)
    {
      if (a5) {
        *a5 = v26;
      }
      unint64_t v20 = v19;
      goto LABEL_26;
    }
    if (a5)
    {
      unint64_t v20 = 0;
      double v27 = 1.0 - v26;
      goto LABEL_25;
    }
LABEL_16:
    unint64_t v20 = 0;
    goto LABEL_26;
  }
  unint64_t v20 = 0;
  double v21 = v12 * 0.5 + v10 + v14;
  double v22 = v10 + v12;
  double v23 = 0.0;
  while (1)
  {
    double v24 = v21 + v22 * ((double)v15 + (double)v20);
    if ([(SBIconListView *)self alignsIconsOnPixelBoundaries]
      && [v8 needsHorizontalColumnBumps])
    {
      [(SBIconListView *)self horizontalBumpForColumn:v20 metrics:v8];
      double v24 = v24 + v25;
    }
    if (x < v24) {
      break;
    }
    ++v20;
    double v23 = v24;
    if (v19 == v20) {
      goto LABEL_13;
    }
  }
  double v27 = (x - v23) / (v24 - v23);
  if (!v18)
  {
    if (!a5) {
      goto LABEL_26;
    }
LABEL_25:
    *a5 = v27;
    goto LABEL_26;
  }
  if (a5) {
    *a5 = 1.0 - v27;
  }
  unint64_t v20 = v19 - v20;
LABEL_26:

  return v20;
}

- (double)horizontalBumpForColumn:(unint64_t)a3 metrics:(id)a4
{
  id v6 = a4;
  double v7 = 0.0;
  if ([(SBIconListView *)self alignsIconsOnPixelBoundaries]
    && [v6 needsHorizontalColumnBumps])
  {
    [(SBIconListView *)self layoutScale];
    double v9 = v8;
    uint64_t v10 = [v6 columnsUsedForLayout];
    [v6 iconInsets];
    double v12 = v11;
    double v14 = v13;
    [v6 iconSpacing];
    double v16 = v15;
    [(SBIconListView *)self bounds];
    double v17 = CGRectGetWidth(v20) - v12 - v14;
    [v6 iconSize];
    double v7 = SBHIconListLayoutCalculateHorizontalColumnBump(a3, v10, v18, v16, v17, v9);
  }

  return v7;
}

- (BOOL)alignsIconsOnPixelBoundaries
{
  return self->_alignsIconsOnPixelBoundaries;
}

- (void)getLayoutMetricsParameters:(SBIconListLayoutMetricsParameters *)a3
{
  int64_t v5 = [(SBIconListView *)self layoutOrientation];
  [(SBIconListView *)self getLayoutMetricsParameters:a3 orientation:v5];
}

uint64_t __33__SBIconListView_didMoveToWindow__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _insertOrRemoveCaptureOnlyBackgroundViewIfNecessaryForIconView:a2];
}

- (SBIconCoordinate)coordinateForIcon:(id)a3
{
  id v4 = [(SBIconListView *)self temporarilyMappedIconForIcon:a3];
  int64_t v5 = [(SBIconListView *)self displayedModel];
  uint64_t v6 = -[SBIconListView iconCoordinateForIndex:forOrientation:](self, "iconCoordinateForIndex:forOrientation:", [v5 indexForIcon:v4], -[SBIconListView layoutOrientation](self, "layoutOrientation"));
  int64_t v8 = v7;

  int64_t v9 = v6;
  int64_t v10 = v8;
  result.int64_t row = v10;
  result.int64_t column = v9;
  return result;
}

- (id)temporarilyMappedIconForIcon:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if ([(SBIconListView *)self hasTemporaryModel])
  {
    id v5 = v4;
    if ([v4 isFolderIcon])
    {
      uint64_t v6 = [v4 uniqueIdentifier];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      int64_t v7 = self->_iconViews;
      uint64_t v8 = [(NSMapTable *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v5 = v4;
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            double v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            double v13 = objc_msgSend(v12, "uniqueIdentifier", (void)v16);
            int v14 = [v13 isEqual:v6];

            if (v14)
            {
              id v5 = v12;

              goto LABEL_13;
            }
          }
          uint64_t v9 = [(NSMapTable *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
        id v5 = v4;
      }
LABEL_13:
    }
  }

  return v5;
}

- (BOOL)hasTemporaryModel
{
  unint64_t v2 = [(SBIconListView *)self temporaryModel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SBIconCoordinate)iconCoordinateForIndex:(unint64_t)a3 forOrientation:(int64_t)a4
{
  uint64_t v6 = [(SBIconListView *)self layoutMetrics];
  int64_t v7 = [v6 gridCellInfo];
  uint64_t v8 = -[SBIconListView iconCoordinateForGridCellIndex:metrics:](self, "iconCoordinateForGridCellIndex:metrics:", [v7 gridCellIndexForIconIndex:a3], v6);
  int64_t v10 = v9;

  int64_t v11 = v8;
  int64_t v12 = v10;
  result.int64_t row = v12;
  result.int64_t column = v11;
  return result;
}

- (void)_addIconViewsForIcons:(id)a3 metrics:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_inLayout = 1;
  uint64_t v8 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_willLayoutIconView_];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        double v15 = -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v14, (void)v17);
        [(SBIconListView *)self centerForIcon:v14 metrics:v7];
        objc_msgSend(v15, "setCenter:");
        [(SBIconListView *)self addSubview:v15];
        [v8 iconListView:self willLayoutIconView:v15];
        [v15 layoutIfNeeded];
        [(SBIconListView *)self _insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  long long v16 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListViewDidLayoutIcons_];
  [v16 iconListViewDidLayoutIcons:self];
  self->_inLayout = 0;
  [(SBIconListView *)self layoutFocusGuides];
  if ([(SBIconListView *)self isDisplayingWidgetIntroduction]) {
    [(SBIconListView *)self layoutWidgetIntroductionViews];
  }
}

- (id)iconViewForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListView *)self displayedIconViewForIcon:v4];
  id v6 = [(SBIconListView *)self displayedModel];
  id v7 = v6;
  if (!v5)
  {
    if (self->_inLayout || [v6 directlyContainsIcon:v4])
    {
      draggingIconViews = self->_draggingIconViews;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __34__SBIconListView_iconViewForIcon___block_invoke;
      v15[3] = &unk_1E6AB0D58;
      id v9 = v4;
      id v16 = v9;
      id v5 = [(NSMutableSet *)draggingIconViews bs_firstObjectPassingTest:v15];
      if (v5
        || ([(SBIconListView *)self dequeueReusableIconView],
            (id v5 = objc_claimAutoreleasedReturnValue()) != 0)
        || ([(SBIconListView *)self makeIconView],
            (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v10 = SBLogIcon();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

        if (v11)
        {
          uint64_t v12 = SBLogIcon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[SBIconListView iconViewForIcon:](v9);
          }
        }
        [(SBIconListView *)self configureIconView:v5 forIcon:v9];
        [(NSMapTable *)self->_iconViews setObject:v5 forKey:v9];
        [(NSMutableSet *)self->_draggingIconViews removeObject:v5];
        if (!self->_inLayout)
        {
          double v13 = [(SBIconListView *)self removedIcons];
          [v13 addObject:v9];

          [(SBIconListView *)self setIconsNeedLayout];
        }
      }
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)dequeueReusableIconView
{
  BOOL v3 = [(SBIconListView *)self iconViewProvider];
  id v4 = objc_msgSend(v3, "dequeueReusableIconViewOfClass:", -[SBIconListView baseIconViewClass](self, "baseIconViewClass"));
  if (v4)
  {
    id v5 = [(SBIconListView *)self layoutProvider];
    [v4 setListLayoutProvider:v5];

    objc_msgSend(v4, "setConfigurationOptions:", -[SBIconListView iconViewConfigurationOptions](self, "iconViewConfigurationOptions"));
  }

  return v4;
}

- (CGPoint)centerForIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v7 = a4;
  -[SBIconListView originForIconAtCoordinate:metrics:](self, "originForIconAtCoordinate:metrics:", column, row, v7);
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v7);
  double v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 gridSizeClass];
    [(SBIconListView *)self iconImageSizeForGridSizeClass:v14];
    double v16 = v15;
    double v18 = v17;
  }
  else
  {
    [(SBIconListView *)self iconImageSize];
    double v16 = v19;
    double v18 = v20;
  }
  -[objc_class defaultIconImageCenterForIconImageSize:]([(SBIconListView *)self baseIconViewClass], "defaultIconImageCenterForIconImageSize:", v16, v18);
  double v22 = v21;
  double v24 = v23;
  [v7 iconContentScale];
  double v26 = v9 + v22 * v25;
  double v27 = v11 + v24 * v25;

  double v28 = v26;
  double v29 = v27;
  result.double y = v29;
  result.double x = v28;
  return result;
}

- (Class)baseIconViewClass
{
  return (Class)objc_opt_class();
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5 = a4;
  id v6 = [(SBIconListView *)self layout];
  SBHIconListLayoutIconImageInfoForGridSizeClassAndOrientation(v6, [(SBIconListView *)self layoutOrientation], v5);

  return result;
}

- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v9 = a4;
  if (a5)
  {
    unint64_t v12 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9);
    double v13 = [v9 gridCellInfo];
    LODWORD(v12) = [v13 gridSizeForGridCellIndex:v12];

    double v11 = [(SBIconListView *)self iconGridSizeClassForIconGridSize:v12];
  }
  else
  {
    double v10 = -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v9);
    double v11 = [v10 gridSizeClass];
  }
  if (v11 == @"SBHIconGridSizeClassDefault"
    || [(__CFString *)v11 isEqualToString:@"SBHIconGridSizeClassDefault"])
  {
    -[SBIconListView rectForDefaultSizedCellAtCoordinate:metrics:](self, "rectForDefaultSizedCellAtCoordinate:metrics:", column, row, v9);
  }
  else
  {
    -[SBIconListView rectForCellAtIconCoordinate:metrics:options:](self, "rectForCellAtIconCoordinate:metrics:options:", column, row, v9, a5);
  }
  double v16 = v14;
  double v17 = v15;

  double v18 = v16;
  double v19 = v17;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v7 = a4;
  unint64_t v8 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(SBIconListView *)self iconAtGridCellIndex:v8 metrics:v7];
  }

  return v9;
}

- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  -[SBIconListView originForIconAtCoordinate:metrics:options:](self, "originForIconAtCoordinate:metrics:options:", a3.column, a3.row, a4, 0);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (unint64_t)iconViewConfigurationOptions
{
  return self->_iconViewConfigurationOptions;
}

- (SBIconCoordinate)iconCoordinateForIndex:(unint64_t)a3 metrics:(id)a4
{
  id v6 = a4;
  id v7 = [v6 gridCellInfo];
  uint64_t v8 = -[SBIconListView iconCoordinateForGridCellIndex:metrics:](self, "iconCoordinateForGridCellIndex:metrics:", [v7 gridCellIndexForIconIndex:a3], v6);
  int64_t v10 = v9;

  int64_t v11 = v8;
  int64_t v12 = v10;
  result.int64_t row = v12;
  result.int64_t column = v11;
  return result;
}

- (SBIconCoordinate)iconCoordinateForGridCellIndex:(unint64_t)a3 metrics:(id)a4
{
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [a4 gridCellInfo];
    uint64_t v5 = [v7 coordinateForGridCellIndex:a3];
    uint64_t v4 = v8;
  }
  int64_t v9 = v5;
  int64_t v10 = v4;
  result.int64_t row = v10;
  result.int64_t column = v9;
  return result;
}

- (unint64_t)iconIndexForGridCellIndex:(unint64_t)a3 metrics:(id)a4
{
  uint64_t v5 = [a4 gridCellInfo];
  unint64_t v6 = [v5 iconIndexForGridCellIndex:a3];

  return v6;
}

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  unint64_t v6 = [a4 gridCellInfo];
  unint64_t v7 = objc_msgSend(v6, "gridCellIndexForCoordinate:", column, row);

  return v7;
}

void __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 104))
  {
    [*(id *)(a1 + 32) removeObject:v5];
    v53 = [v5 gridSizeClass];
    unsigned int v6 = objc_msgSend(*(id *)(a1 + 40), "iconGridSizeForClass:");
    unsigned __int16 v7 = v6;
    NSUInteger v8 = HIWORD(v6);
    unint64_t v9 = [*(id *)(a1 + 48) gridCellIndexForIconIndex:a3];
    uint64_t v10 = [*(id *)(a1 + 48) coordinateForGridCellIndex:v9];
    uint64_t v12 = v11;
    unint64_t v13 = v7 + v9 - 1;
    NSUInteger v14 = v11 - 1;
    v71.NSUInteger length = v13 % *(void *)(a1 + 104) - v10 + 2;
    v71.location = v10 - 1;
    NSUInteger length = NSIntersectionRange(v71, *(NSRange *)(a1 + 112)).length;
    v72.location = v14;
    v72.NSUInteger length = v8;
    NSRange v16 = NSIntersectionRange(v72, *(NSRange *)(a1 + 128));
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || (length ? (BOOL v17 = v16.length == 0) : (BOOL v17 = 1), v17))
    {
      if (*(void *)(a1 + 144) != v10 - 1) {
        goto LABEL_21;
      }
      if (*(double *)(a1 + 152) <= 0.0) {
        goto LABEL_21;
      }
      unint64_t v25 = [*(id *)(a1 + 56) columns];
      unint64_t v26 = [*(id *)(a1 + 56) rows];
      if (*(void *)(a1 + 144) == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_21;
      }
      unint64_t v27 = *(void *)(a1 + 136);
      unint64_t v28 = vcvtad_u64_f64(*(double *)(a1 + 152) * (double)v26);
      if (v28 < v27) {
        unint64_t v27 = v28;
      }
      if (v9 / v25 >= v27)
      {
LABEL_21:
        if (*(void *)(a1 + 160) != v14 || *(double *)(a1 + 168) <= 0.0)
        {
          id v18 = [*(id *)(*(void *)(a1 + 40) + 424) objectForKey:v5];
          if (v18)
          {
            double v29 = SBLogIcon();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_cold_1(v5);
            }

            [*(id *)(*(void *)(a1 + 40) + 424) removeObjectForKey:v5];
            [*(id *)(a1 + 40) removeIconView:v18];
          }
          goto LABEL_43;
        }
      }
    }
    id v18 = [*(id *)(a1 + 40) iconViewForIcon:v5];
    if (!v18 || ([*(id *)(a1 + 40) isLayoutPausedForIconView:v18] & 1) != 0)
    {
LABEL_43:

      goto LABEL_44;
    }
    [v18 setLocation:*(void *)(a1 + 64)];
    [v18 setOrientation:*(void *)(a1 + 176)];
    [v18 setDebugIconIndex:a3];
    objc_msgSend(v18, "setCursorHitTestPadding:", *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200), *(double *)(a1 + 208));
    if ([v18 configurationOptions] != *(void *)(a1 + 216)) {
      objc_msgSend(v18, "setConfigurationOptions:");
    }
    uint64_t v19 = objc_msgSend(*(id *)(a1 + 48), "approximateLayoutPositionForCoordinate:", v10, v12);
    objc_msgSend(v18, "setApproximateLayoutPosition:", v19, v20);
    [*(id *)(*(void *)(a1 + 40) + 408) removeObject:v5];
    double v21 = [v18 superview];
    double v22 = *(void **)(a1 + 40);
    if (v21 == v22)
    {
    }
    else
    {
      int v23 = [v22 shouldReparentView:v18];

      if (v23)
      {
        [*(id *)(a1 + 40) _insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:v18];
        [*(id *)(a1 + 40) addSubview:v18];
        [*(id *)(a1 + 72) addObject:v5];
        int v24 = 1;
        goto LABEL_28;
      }
    }
    int v24 = 0;
LABEL_28:
    uint64_t v30 = [*(id *)(a1 + 40) iconCoordinateForGridCellIndex:v9 metrics:*(void *)(a1 + 56)];
    uint64_t v32 = v31;
    objc_msgSend(*(id *)(a1 + 40), "centerForIconCoordinate:metrics:", v30, v31, *(void *)(a1 + 56));
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    [v18 center];
    LODWORD(v37) = SBFPointEqualToPointAtScale() ^ 1;
    if (v24) {
      uint64_t v38 = 2;
    }
    else {
      uint64_t v38 = 6;
    }
    uint64_t v39 = *(void *)(a1 + 232);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_70;
    aBlock[3] = &unk_1E6AACDE0;
    id v40 = *(id *)(a1 + 80);
    uint64_t v41 = *(void *)(a1 + 40);
    id v68 = v40;
    uint64_t v69 = v41;
    id v18 = v18;
    id v70 = v18;
    v42 = (void (**)(void))_Block_copy(aBlock);
    id v43 = *(id *)(a1 + 88);
    v44 = *(void **)(a1 + 96);
    if (v44 && *(void *)(a1 + 88))
    {
      objc_msgSend(v44, "iconListView:animatorForLayingOutIconView:proposedAnimator:", *(void *)(a1 + 40), v18);
      int v52 = v24;
      v45 = v42;
      uint64_t v46 = v30;
      uint64_t v47 = v32;
      char v48 = v37;
      v49 = uint64_t v37 = v38;

      id v43 = (id)v49;
      uint64_t v38 = v37;
      LOBYTE(v37) = v48;
      uint64_t v32 = v47;
      uint64_t v30 = v46;
      v42 = v45;
      int v24 = v52;
    }
    if (v24 && v43)
    {
      if (*(unsigned char *)(a1 + 240))
      {
LABEL_37:
        uint64_t v50 = *(void *)(a1 + 40);
        uint64_t v54 = v34;
        uint64_t v55 = v36;
        uint64_t v56 = v39;
        long long v57 = 0u;
        long long v58 = 0u;
        uint64_t v59 = 0;
        uint64_t v60 = v30;
        uint64_t v61 = v32;
        char v62 = v24;
        char v63 = v37;
        int v64 = 0;
        __int16 v65 = 0;
        uint64_t v66 = v38;
        [v43 iconListView:v50 wantsAnimatedLayoutForIconView:v18 withParameters:&v54 alongsideAnimationBlock:v42];
LABEL_40:
        [v18 setPaused:*(unsigned __int8 *)(a1 + 241) forReason:8];
        if (*(unsigned char *)(a1 + 242)) {
          [v18 setIconContentScalingEnabled:1];
        }

        goto LABEL_43;
      }
    }
    else if (v43)
    {
      goto LABEL_37;
    }
    v51 = *(void **)(a1 + 40);
    uint64_t v54 = v34;
    uint64_t v55 = v36;
    uint64_t v56 = v39;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v59 = 0;
    uint64_t v60 = v30;
    uint64_t v61 = v32;
    char v62 = v24;
    char v63 = v37;
    int v64 = 0;
    __int16 v65 = 0;
    uint64_t v66 = v38;
    [v51 performDefaultAnimatedLayoutUpdateForIconView:v18 withParameters:&v54];
    v42[2](v42);
    goto LABEL_40;
  }
LABEL_44:
}

- (SBHIconGridSize)iconGridSizeForClass:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListView *)self iconGridSizeClassSizes];
  SBHIconGridSize v6 = (SBHIconGridSize)[v5 gridSizeForGridSizeClass:v4];

  return v6;
}

- (id)iconGridSizeClassSizes
{
  BOOL v3 = [(SBIconListView *)self displayedModel];
  id v4 = objc_msgSend(v3, "gridSizeClassSizesWithOptions:", -[SBIconListView gridCellInfoOptions](self, "gridCellInfoOptions"));
  if (!v4)
  {
    id v5 = [(SBIconListView *)self layout];
    id v4 = SBHIconListLayoutIconGridSizeClassSizes(v5, [(SBIconListView *)self layoutOrientation]);
  }
  return v4;
}

+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4 flippedLayout:(BOOL)a5 allowGaps:(BOOL)a6
{
  unint64_t v6 = a4;
  if (a6) {
    unint64_t v6 = a4 | 4;
  }
  if ((unint64_t)(a3 - 3) < 2) {
    v6 |= 2uLL;
  }
  if (a5) {
    return v6 | 0x10;
  }
  else {
    return v6;
  }
}

- (unint64_t)gridCellInfoOptions
{
  int64_t v3 = [(SBIconListView *)self orientation];
  BOOL v4 = [(SBIconListView *)self isLayoutReversed];
  BOOL v5 = [(SBIconListView *)self isLayoutFlipped];
  BOOL v6 = [(SBIconListView *)self allowsGaps];
  unsigned __int16 v7 = objc_opt_class();
  return [v7 gridCellInfoOptionsWithInterfaceOrientation:v3 reversedLayout:v4 flippedLayout:v5 allowGaps:v6];
}

- (BOOL)isLayoutReversed
{
  return self->_layoutReversed;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (BOOL)isLayoutFlipped
{
  return 0;
}

- (BOOL)allowsGaps
{
  return self->_allowsGaps;
}

- (id)iconAtGridCellIndex:(unint64_t)a3 metrics:(id)a4
{
  id v6 = a4;
  unsigned __int16 v7 = [(SBIconListView *)self displayedModel];
  unint64_t v8 = [(SBIconListView *)self iconIndexForGridCellIndex:a3 metrics:v6];

  if (v8 >= [v7 numberOfIcons])
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = [v7 iconAtIndex:v8];
  }

  return v9;
}

- (void)enumerateIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SBIconListView_enumerateIconViewsUsingBlock___block_invoke;
  v6[3] = &unk_1E6AB0E68;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SBIconListView *)self enumerateIconsUsingBlock:v6];
}

- (void)enumerateIconsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListView *)self displayedModel];
  id v6 = [v5 icons];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__SBIconListView_enumerateIconsUsingBlock___block_invoke;
  v8[3] = &unk_1E6AB0E40;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateObjectsUsingBlock:v8];
}

- (SBIconListModel)displayedModel
{
  int64_t v3 = [(SBIconListView *)self temporaryModel];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SBIconListView *)self model];
  }
  id v6 = v5;

  return (SBIconListModel *)v6;
}

- (SBIconListModel)temporaryModel
{
  return self->_temporaryModel;
}

- (SBIconListModel)model
{
  return self->_model;
}

- (CGPoint)centerForIcon:(id)a3 metrics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [(SBIconListView *)self displayedModel];
  uint64_t v9 = [v8 indexForIcon:v7];

  uint64_t v10 = [(SBIconListView *)self iconCoordinateForIndex:v9 metrics:v6];
  -[SBIconListView centerForIconCoordinate:metrics:](self, "centerForIconCoordinate:metrics:", v10, v11, v6);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (void)_insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 backgroundViewGroupNameBase];
    if ([v6 length])
    {
      id v7 = self;
      objc_sync_enter(v7);
      unint64_t v8 = [(NSMutableDictionary *)v7->_groupNamesToCaptureOnlyBackgroundViews objectForKey:v6];

      if (!v8)
      {
        uint64_t v9 = (void *)[v5 newCaptureOnlyBackgroundView];
        if (v9)
        {
          [(SBIconListView *)v7 insertSubview:v9 atIndex:0];
          [(SBIconListView *)v7 bounds];
          objc_msgSend(v9, "setFrame:");
          [v9 setAutoresizingMask:18];
          groupNamesToCaptureOnlyBackgroundViews = v7->_groupNamesToCaptureOnlyBackgroundViews;
          if (!groupNamesToCaptureOnlyBackgroundViews)
          {
            uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
            double v12 = v7->_groupNamesToCaptureOnlyBackgroundViews;
            v7->_groupNamesToCaptureOnlyBackgroundViews = v11;

            groupNamesToCaptureOnlyBackgroundViews = v7->_groupNamesToCaptureOnlyBackgroundViews;
          }
          [(NSMutableDictionary *)groupNamesToCaptureOnlyBackgroundViews setObject:v9 forKey:v6];
        }
      }
      objc_initWeak(&location, v7);
      double v13 = [v5 icon];
      double v14 = [(NSMapTable *)v7->_iconsToCaptureOnlyBackgroundAssertions objectForKey:v13];
      double v15 = v14;
      if (!v14
        || ([v14 groupName],
            double v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 isEqualToString:v6],
            v16,
            (v17 & 1) == 0))
      {
        [v15 invalidate];
        id v18 = [SBIconListViewCaptureOnlyBackgroundAssertion alloc];
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        unint64_t v25 = __82__SBIconListView__insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary___block_invoke;
        unint64_t v26 = &unk_1E6AB1000;
        objc_copyWeak(&v27, &location);
        uint64_t v19 = [(SBIconListViewCaptureOnlyBackgroundAssertion *)v18 initWithIcon:v13 groupName:v6 invalidation:&v23];
        iconsToCaptureOnlyBackgroundAssertions = v7->_iconsToCaptureOnlyBackgroundAssertions;
        if (!iconsToCaptureOnlyBackgroundAssertions)
        {
          uint64_t v21 = objc_msgSend(MEMORY[0x1E4F28E10], "weakToStrongObjectsMapTable", v23, v24, v25, v26);
          double v22 = v7->_iconsToCaptureOnlyBackgroundAssertions;
          v7->_iconsToCaptureOnlyBackgroundAssertions = (NSMapTable *)v21;

          iconsToCaptureOnlyBackgroundAssertions = v7->_iconsToCaptureOnlyBackgroundAssertions;
        }
        -[NSMapTable setObject:forKey:](iconsToCaptureOnlyBackgroundAssertions, "setObject:forKey:", v19, v13, v23, v24, v25, v26);

        objc_destroyWeak(&v27);
      }

      objc_destroyWeak(&location);
      objc_sync_exit(v7);
    }
  }
}

uint64_t __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_70(uint64_t a1)
{
  return [*(id *)(a1 + 32) iconListView:*(void *)(a1 + 40) willLayoutIconView:*(void *)(a1 + 48)];
}

- (void)performDefaultAnimatedLayoutUpdateForIconView:(id)a3 withParameters:(SBIconListLayoutAnimationParameters *)a4
{
  id v5 = a3;
  objc_msgSend(v5, "setCenter:", a4->var0.x, a4->var0.y);
  [v5 setIconContentScale:a4->var1];
  if (a4->var3) {
    objc_msgSend(v5, "setIconImageInfo:", a4->var2.size.width, a4->var2.size.height, a4->var2.scale, a4->var2.continuousCornerRadius);
  }
  else {
    [v5 clearIconImageInfo];
  }
  [v5 layoutIfNeeded];
}

- (BOOL)isLayoutPausedForIconView:(id)a3
{
  int64_t v3 = [(NSMapTable *)self->_pausedLayoutAssertionsForIconViews objectForKey:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

void __44__SBIconListView_configureIconView_forIcon___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) overrideIconImageStyleConfiguration];
  [v1 setOverrideIconImageStyleConfiguration:v2];
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_willConfigureIconView_forIcon_];
  [v9 iconListView:self willConfigureIconView:v7 forIcon:v8];
  int v10 = [v7 isDescendantOfView:self];
  uint64_t v11 = [(SBIconListView *)self overrideIconImageAppearance];
  if (v11) {
    [v7 setOverrideIconImageAppearance:v11];
  }
  if ((v10 & 1) == 0)
  {
    double v12 = [(SBIconListView *)self traitCollection];
    double v13 = objc_msgSend(v12, "sbh_iconImageStyleConfiguration");
    [v7 setOverrideIconImageStyleConfiguration:v13];
    BOOL v4 = (void *)*MEMORY[0x1E4FB2608];
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    uint64_t v34 = __44__SBIconListView_configureIconView_forIcon___block_invoke;
    uint64_t v35 = &unk_1E6AACA90;
    id v36 = v7;
    uint64_t v37 = self;
    [v4 _performBlockAfterCATransactionCommits:&v32];
  }
  double v14 = [(SBIconListView *)self iconLocation];
  [v7 setLocation:v14];

  double v15 = [(SBIconListView *)self layoutProvider];
  [v7 setListLayoutProvider:v15];

  double v16 = [(SBIconListView *)self folderIconImageCache];
  [v7 setFolderIconImageCache:v16];

  char v17 = [v8 gridSizeClass];
  if (v17)
  {
    BOOL v4 = [v8 gridSizeClass];
    if (![v4 isEqualToString:@"SBHIconGridSizeClassDefault"])
    {
      id v18 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  id v18 = [(SBIconListView *)self iconImageCache];
  if (v17) {
    goto LABEL_9;
  }
LABEL_10:

  [v7 setIconImageCache:v18];
  objc_msgSend(v7, "setContentVisibility:", -[SBIconListView contentVisibility](self, "contentVisibility"));
  uint64_t v19 = [(SBIconListView *)self legibilitySettings];
  [v7 setLegibilitySettings:v19];

  objc_msgSend(v7, "setEditing:", -[SBIconListView isEditing](self, "isEditing"));
  [v7 setContinuityInfo:0];
  objc_msgSend(v7, "setUserVisibilityStatus:", -[SBIconListView iconViewUserVisibilityStatus](self, "iconViewUserVisibilityStatus"));
  [v7 setAlpha:1.0];
  uint64_t v20 = [v8 gridSizeClass];
  uint64_t v21 = v20;
  if (v20
    && (([v20 isEqualToString:@"SBHIconGridSizeClassDefault"] | v10) & 1) == 0)
  {
    [v7 iconImageInfo];
    double v23 = v22;
    [(SBIconListView *)self iconImageSizeForGridSizeClass:v21];
    double v25 = v24;
    double v27 = v26;
    [(SBIconListView *)self continuousCornerRadiusForGridSizeClass:v21];
    objc_msgSend(v7, "setIconImageInfo:", v25, v27, v23, v28);
  }
  else if ((v10 & 1) == 0)
  {
    [v7 clearIconImageInfo];
  }
  double v29 = [(SBIconListView *)self iconViewProvider];
  [v29 configureIconView:v7 forIcon:v8];

  [v7 setIcon:v8];
  if (!v21)
  {
    if (v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ((([v21 isEqualToString:@"SBHIconGridSizeClassDefault"] ^ 1 | v10) & 1) == 0)
  {
LABEL_17:
    [v7 iconViewSize];
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v30, v31);
  }
LABEL_18:
}

- (SBIconViewProviding)iconViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  return (SBIconViewProviding *)WeakRetained;
}

- (unint64_t)iconViewUserVisibilityStatus
{
  if ([(SBIconListView *)self contentVisibility]) {
    return 1;
  }
  if ([(SBIconListView *)self isVisiblySettled]) {
    return 3;
  }
  return 2;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (unint64_t)iconColumnsForCurrentOrientation
{
  int64_t v3 = [(SBIconListView *)self layout];
  unint64_t v4 = objc_msgSend(v3, "numberOfColumnsForOrientation:", -[SBIconListView layoutOrientation](self, "layoutOrientation"));

  return v4;
}

- (int64_t)layoutOrientation
{
  int64_t v3 = [(SBIconListView *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];
  uint64_t v5 = [v3 verticalSizeClass];
  if ([(SBIconListView *)self adaptsOrientationToTraitCollection]
    && v4 == 1
    && v5 == 2)
  {
    int64_t v6 = 1;
  }
  else
  {
    int64_t v6 = [(SBIconListView *)self orientation];
  }

  return v6;
}

- (BOOL)adaptsOrientationToTraitCollection
{
  return 1;
}

- (BOOL)isVisiblySettled
{
  return self->_visiblySettled;
}

- (id)effectiveLayoutDelegateForSelector:(SEL)a3
{
  [(NSPointerArray *)self->_overridingLayoutDelegates compact];
  NSUInteger v4 = [(NSPointerArray *)self->_overridingLayoutDelegates count];
  if (v4)
  {
    NSUInteger v5 = v4 - 1;
    while (1)
    {
      id v6 = [(NSPointerArray *)self->_overridingLayoutDelegates pointerAtIndex:v5];
      id v7 = [v6 layoutDelegate];
      if (!v7)
      {
        id v8 = [v6 reason];
        NSLog(&cfstr_OverridingLayo.isa, v8);
      }
      if (objc_opt_respondsToSelector()) {
        break;
      }

      if (--v5 == -1) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    id v6 = [(SBIconListView *)self layoutDelegate];
    if (objc_opt_respondsToSelector())
    {
      id v6 = v6;
      id v7 = v6;
    }
    else
    {
      id v7 = 0;
    }
  }

  return v7;
}

- (SBIconListLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (SBIconListLayoutDelegate *)WeakRetained;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (void)setContentVisibility:(unint64_t)a3
{
  if (self->_contentVisibility != a3)
  {
    self->_contentVisibilitdouble y = a3;
    unint64_t v5 = [(SBIconListView *)self iconViewUserVisibilityStatus];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__SBIconListView_setContentVisibility___block_invoke;
    v6[3] = &__block_descriptor_48_e27_v32__0__SBIconView_8Q16_B24l;
    v6[4] = a3;
    void v6[5] = v5;
    [(SBIconListView *)self enumerateIconViewsUsingBlock:v6];
  }
}

- (void)setVisiblySettled:(BOOL)a3
{
  if (self->_visiblySettled != a3)
  {
    self->_visiblySettled = a3;
    unint64_t v4 = [(SBIconListView *)self iconViewUserVisibilityStatus];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __36__SBIconListView_setVisiblySettled___block_invoke;
    v5[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
    v5[4] = v4;
    [(SBIconListView *)self enumerateIconViewsUsingBlock:v5];
  }
}

- (NSArray)icons
{
  id v2 = [(SBIconListView *)self displayedModel];
  int64_t v3 = [v2 icons];

  return (NSArray *)v3;
}

- (void)_updateVisibleIconViewsWithOldVisibleGridCellIndexes:(id)a3 metrics:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v18 = [(SBIconListView *)self visibleGridCellIndexesWithMetrics:v6];
  char v17 = (void *)[v18 mutableCopy];
  [v17 removeIndexes:v7];
  id v8 = (void *)[v7 mutableCopy];
  [v8 removeIndexes:v18];
  uint64_t v9 = [v6 gridCellInfo];
  int v10 = [v6 listModel];
  uint64_t v11 = [v10 iconsAtGridCellIndexes:v17 gridCellInfo:v9];
  double v12 = (void *)[v11 mutableCopy];

  double v13 = [v10 iconsAtGridCellIndexes:v7 gridCellInfo:v9];

  [v12 removeObjectsInArray:v13];
  double v14 = [v10 iconsAtGridCellIndexes:v18 gridCellInfo:v9];
  double v15 = [v10 iconsAtGridCellIndexes:v8 gridCellInfo:v9];
  double v16 = (void *)[v15 mutableCopy];

  [v16 removeObjectsInArray:v14];
  [(SBIconListView *)self _removeIconViewsForIcons:v16];
  [(SBIconListView *)self _addIconViewsForIcons:v12 metrics:v6];
}

- (void)_removeIconViewsForIcons:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        int v10 = [(NSMapTable *)self->_iconViews objectForKey:v9];
        if (v10)
        {
          [(NSMapTable *)self->_iconViews removeObjectForKey:v9];
          [(SBIconListView *)self removeIconView:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)removeIconView:(id)a3 force:(BOOL)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!a4 && (([v6 isDragging] & 1) != 0 || objc_msgSend(v7, "isAddedToDrag")))
  {
    if (([v7 isCancelingDrag] & 1) == 0)
    {
      [v7 setAlpha:0.0];
      [(SBIconListView *)self centerForDraggedIconView:v7];
      objc_msgSend(v7, "setCenter:");
    }
    draggingIconViews = self->_draggingIconViews;
    if (!draggingIconViews)
    {
      uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      int v10 = self->_draggingIconViews;
      self->_draggingIconViews = v9;

      draggingIconViews = self->_draggingIconViews;
    }
    [(NSMutableSet *)draggingIconViews addObject:v7];
    [v7 addObserver:self];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v11 = self->_layoutObservers;
    uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v16, "iconListView:didRemoveIconView:", self, v7, (void)v19);
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [(NSHashTable *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    char v17 = [(SBIconListView *)self iconViewProvider];
    id v18 = v17;
    if (v17) {
      [v17 recycleIconView:v7];
    }
    if (objc_msgSend(v7, "isDescendantOfView:", self, (void)v19)) {
      [v7 removeFromSuperview];
    }
  }
}

- (void)removeIconView:(id)a3
{
}

- (BOOL)containsIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIconListView *)self displayedModel];
  char v6 = [v5 directlyContainsIcon:v4];

  return v6;
}

- (void)didAddSubview:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBIconListView;
  [(SBIconListView *)&v7 didAddSubview:v4];
  uint64_t v5 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [(SBIconListView *)self didAddIconView:v4];
  }
}

- (void)didAddIconView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_layoutObservers;
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
        int v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "iconListView:didAddIconView:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_widgetIntroductionPopover) {
    [(SBIconListView *)self bringWidgetIntroductionPopoverToFront];
  }
}

- (void)_insertOrRemoveCaptureOnlyBackgroundViewIfNecessaryForIconView:(id)a3
{
  id v6 = a3;
  id v4 = [v6 backgroundViewGroupNameBase];

  if (v4)
  {
    [(SBIconListView *)self _insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:v6];
  }
  else
  {
    uint64_t v5 = [v6 icon];

    [(SBIconListView *)self _removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:v5];
    id v6 = (id)v5;
  }
}

- (void)_removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = self;
    objc_sync_enter(v5);
    id v6 = [(NSMapTable *)v5->_iconsToCaptureOnlyBackgroundAssertions objectForKey:v7];
    [v6 invalidate];

    objc_sync_exit(v5);
    id v4 = v7;
  }
}

- (void)_updateEditingStateForIcons:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(SBIconListView *)self isEditing];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14);
        [v13 setEditing:v7 animated:v4];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)getLayoutMetricsParameters:(SBIconListLayoutMetricsParameters *)a3 orientation:(int64_t)a4
{
  id v24 = [(SBIconListView *)self layout];
  unint64_t v7 = [(SBIconListView *)self alignsIconsOnPixelBoundaries];
  if ([(SBIconListView *)self automaticallyAdjustsLayoutMetricsToFit]) {
    v7 |= 2uLL;
  }
  if ([(SBIconListView *)self isLayoutReversed]) {
    v7 |= 4uLL;
  }
  if ([(SBIconListView *)self isLayoutFlipped]) {
    v7 |= 0x20uLL;
  }
  if ([(SBIconListView *)self adjustsColumnPositionsForFullScreenWidth]) {
    v7 |= 8uLL;
  }
  if ([(SBIconListView *)self allowsGaps]) {
    v7 |= 0x10uLL;
  }
  [(SBIconListView *)self bounds];
  a3->var0.origin.double x = v8;
  a3->var0.origin.double y = v9;
  a3->var0.size.width = v10;
  a3->var0.size.height = v11;
  [(SBIconListView *)self layoutScale];
  a3->var1 = v12;
  a3->var4 = a4;
  [(SBIconListView *)self layoutInsetsForOrientation:a4];
  a3->var2.top = v13;
  a3->var2.left = v14;
  a3->var2.bottom = v15;
  a3->var2.right = v16;
  a3->var3 = [(SBIconListView *)self layoutInsetsMode];
  a3->var5 = [v24 numberOfColumnsForOrientation:a4];
  a3->var6 = [v24 numberOfRowsForOrientation:a4];
  a3->var7 = [v24 numberOfColumnsForOrientation:1];
  a3->var8 = [v24 numberOfRowsForOrientation:1];
  a3->var9 = [v24 numberOfColumnsForOrientation:3];
  a3->var10 = [v24 numberOfRowsForOrientation:3];
  [(SBIconListView *)self alignmentIconSize];
  a3->var11.width = v17;
  a3->var11.height = v18;
  [(SBIconListView *)self iconImageSize];
  a3->var12.width = v19;
  a3->var12.height = v20;
  [(SBIconListView *)self iconContentScale];
  a3->var13 = v21;
  [(SBIconListView *)self iconSpacing];
  a3->var14.width = v22;
  a3->var14.height = v23;
  a3->var15 = [(SBIconListView *)self effectiveIconSpacingAxisMatchingBehavior];
  a3->var16 = v7;
}

- (CGSize)iconImageSize
{
  [(SBIconListView *)self iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassDefault"];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  uint64_t v5 = [(SBIconListView *)self layout];
  [v5 layoutInsetsForOrientation:a3];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  CGFloat v14 = [(SBIconListView *)self currentIconLocationTransitionHandler];
  CGFloat v15 = v14;
  if (v14)
  {
    CGFloat v16 = [v14 iconLocation];
    CGFloat v17 = [(SBIconListView *)self layoutProvider];
    CGFloat v18 = [v17 layoutForIconLocation:v16];

    [v18 layoutInsetsForOrientation:a3];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [v15 progress];
    SBHInterpolateEdgeInsets(v7, v9, v11, v13, v20, v22, v24, v26, v27);
  }
  [(SBIconListView *)self additionalLayoutInsets];
  UIEdgeInsetsAdd();
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  double v36 = v29;
  double v37 = v31;
  double v38 = v33;
  double v39 = v35;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (UIEdgeInsets)additionalLayoutInsets
{
  double top = self->_additionalLayoutInsets.top;
  double left = self->_additionalLayoutInsets.left;
  double bottom = self->_additionalLayoutInsets.bottom;
  double right = self->_additionalLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (SBIconListViewIconLocationTransitionHandler)currentIconLocationTransitionHandler
{
  return self->_currentIconLocationTransitionHandler;
}

- (int64_t)layoutInsetsMode
{
  return self->_layoutInsetsMode;
}

- (CGSize)iconSpacing
{
  double width = self->_iconSpacing.width;
  double height = self->_iconSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (int64_t)effectiveIconSpacingAxisMatchingBehavior
{
  if ([(SBIconListView *)self hasSetIconSpacingAxisMatchingBehavior])
  {
    return [(SBIconListView *)self iconSpacingAxisMatchingBehavior];
  }
  else
  {
    BOOL v4 = [(SBIconListView *)self layout];
    int64_t v5 = SBHIconListLayoutIconSpacingAxisMatchingBehavior(v4);

    return v5;
  }
}

- (BOOL)hasSetIconSpacingAxisMatchingBehavior
{
  return self->_hasSetIconSpacingAxisMatchingBehavior;
}

- (BOOL)automaticallyAdjustsLayoutMetricsToFit
{
  return self->_automaticallyAdjustsLayoutMetricsToFit;
}

- (BOOL)adjustsColumnPositionsForFullScreenWidth
{
  return self->_adjustsColumnPositionsForFullScreenWidth;
}

+ (id)layoutMetricsForParameters:(SBIconListLayoutMetricsParameters *)a3 listModel:(id)a4
{
  id v88 = a4;
  CGFloat x = a3->var0.origin.x;
  CGFloat y = a3->var0.origin.y;
  CGFloat width = a3->var0.size.width;
  CGFloat height = a3->var0.size.height;
  double var1 = a3->var1;
  double left = a3->var2.left;
  double top = a3->var2.top;
  double right = a3->var2.right;
  double bottom = a3->var2.bottom;
  unint64_t var5 = a3->var5;
  unint64_t var6 = a3->var6;
  CGFloat v14 = a3->var11.height;
  double v91 = a3->var11.width;
  double var13 = a3->var13;
  int64_t var15 = a3->var15;
  unint64_t var16 = a3->var16;
  v101.origin.CGFloat x = a3->var0.origin.x;
  v101.origin.CGFloat y = y;
  v101.size.CGFloat width = width;
  v101.size.CGFloat height = height;
  CGFloat v18 = CGRectGetWidth(v101);
  double v82 = y;
  double v83 = x;
  v102.origin.CGFloat x = x;
  double v19 = v18;
  v102.origin.CGFloat y = y;
  double v84 = width;
  double v85 = height;
  v102.size.CGFloat width = width;
  double v20 = bottom;
  v102.size.CGFloat height = height;
  double v21 = CGRectGetHeight(v102);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke;
  aBlock[3] = &__block_descriptor_106_e39__CGSize_dd_48__0_UIEdgeInsets_dddd_8d40l;
  void aBlock[4] = var15;
  aBlock[5] = a3;
  *(double *)&aBlock[6] = v19;
  *(double *)&aBlock[7] = v91;
  double v90 = v14;
  *(CGFloat *)&aBlock[8] = v14;
  aBlock[9] = var5;
  char v98 = var16 & 1;
  BOOL v99 = (var16 & 8) != 0;
  *(double *)&aBlock[10] = var1;
  *(double *)&aBlock[11] = v21;
  aBlock[12] = var6;
  double v22 = (double (**)(double, double, double, double, double))_Block_copy(aBlock);
  double v23 = v22[2](top, left, bottom, right, var13);
  double v25 = v24;
  char v26 = 0;
  unint64_t v87 = var5;
  if ((var16 & 2) != 0 && v19 > 0.0 && v21 > 0.0)
  {
    double v80 = v19;
    char v26 = 0;
    double v27 = bottom;
    if (v23 >= 10.0 || (double v28 = left + -4.0, left + -4.0 < 20.0))
    {
      double v30 = right;
      double v29 = left;
    }
    else
    {
      char v26 = 0;
      do
      {
        double v29 = left;
        double v30 = right;
        double right = right + -4.0;
        if (right < 20.0) {
          break;
        }
        double left = v28;
        double v23 = ((double (*)(double (**)(double, double, double, double, double), double, double, double, double, double))v22[2])(v22, top, v28, bottom, right, var13);
        double v25 = v31;
        double v28 = left + -4.0;
        char v26 = 1;
        BOOL v32 = v23 >= 10.0 || v28 < 20.0;
        double v30 = right;
        double v29 = left;
      }
      while (!v32);
    }
    double v92 = v30;
    double v93 = v29;
    char v81 = var16;
    if (v25 >= 10.0)
    {
      double v38 = top;
      double v39 = bottom;
    }
    else
    {
      double v34 = top;
      double v35 = top + -4.0;
      if (top + -4.0 >= 20.0)
      {
        do
        {
          double v37 = v34;
          double v36 = v27;
          double v27 = v27 + -4.0;
          if (v27 < 20.0) {
            break;
          }
          double v34 = v35;
          double v23 = ((double (*)(double (**)(double, double, double, double, double)))v22[2])(v22);
          double v25 = v40;
          double v35 = v34 + -4.0;
          char v26 = 1;
          BOOL v41 = v40 >= 10.0 || v35 < 20.0;
          double v36 = v27;
          double v37 = v34;
        }
        while (!v41);
      }
      else
      {
        double v36 = bottom;
        double v37 = top;
      }
      double v38 = v37;
      double v39 = v36;
    }
    v96[0] = MEMORY[0x1E4F143A8];
    v96[1] = 3221225472;
    v96[2] = __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_2;
    v96[3] = &__block_descriptor_48_e18_B24__0_CGSize_dd_8l;
    v96[4] = var5;
    v96[5] = var6;
    unint64_t var16 = (unint64_t)_Block_copy(v96);
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_3;
    v95[3] = &__block_descriptor_88_e31_B40__0_CGSize_dd_8_CGSize_dd_24l;
    double top = v38;
    *(double *)&v95[4] = v38;
    *(double *)&v95[5] = v93;
    double v42 = v39;
    *(double *)&v95[6] = v39;
    *(double *)&v95[7] = v92;
    v95[8] = var5;
    *(double *)&v95[9] = var1;
    *(double *)&v95[10] = v80;
    id v43 = (uint64_t (**)(void, double, double, double, double))_Block_copy(v95);
    char v33 = 0;
    double v45 = v90;
    double v44 = v91;
    while (1)
    {
      if ((*(unsigned int (**)(unint64_t, double, double))(var16 + 16))(var16, v23, v25))
      {
        char v47 = v43[2](v43, v44, v45, v23, v25);
        v46.n128_f64[0] = v93;
        if ((v47 & 1) != 0 || var13 < 0.25)
        {
LABEL_34:

          double v20 = v42;
          unint64_t var5 = v87;
          LOBYTE(var16) = v81;
          goto LABEL_35;
        }
      }
      else
      {
        v46.n128_f64[0] = v93;
        if (var13 < 0.25) {
          goto LABEL_34;
        }
      }
      double var13 = var13 + -0.05;
      double v44 = v91 * var13;
      double v45 = v90 * var13;
      double v23 = ((double (*)(double (**)(double, double, double, double, double), double, __n128, double, double, double))v22[2])(v22, v38, v46, v42, v92, var13);
      double v25 = v48;
      char v33 = 1;
    }
  }
  double v92 = right;
  double v93 = left;
  char v33 = 0;
LABEL_35:
  uint64_t v49 = [a1 gridCellInfoOptionsWithInterfaceOrientation:a3->var4 reversedLayout:(a3->var16 >> 2) & 1 flippedLayout:(a3->var16 >> 5) & 1 allowGaps:(a3->var16 >> 4) & 1];
  uint64_t v50 = 0;
  double v51 = top;
  if (var6 && var5)
  {
    uint64_t v50 = [v88 gridCellInfoForGridSize:(var6 << 16) | (unint64_t)(unsigned __int16)var5 options:v49];
  }
  unint64_t v52 = var16 & 8;
  double v53 = v91 * var13;
  double v54 = v90 * var13;
  int64_t var3 = a3->var3;
  double v56 = v93;
  if (var3)
  {
    if (a3->var14.width == -123.0)
    {
      unint64_t v68 = var5;
    }
    else
    {
      unint64_t v57 = var5;
      if (var3 == 2)
      {
        uint64_t v58 = [v50 numberOfUsedColumns];
        double v56 = v93;
        unint64_t v57 = v58;
      }
      double v59 = v23;
      if (v52)
      {
        SBFFloatRoundForScale();
        double v56 = v93;
        double v59 = v60;
      }
      v103.origin.CGFloat x = v83 + v56;
      v103.origin.CGFloat y = v82 + top;
      double v61 = v92;
      double v62 = v56;
      v103.size.CGFloat width = v84 - (v92 + v56);
      v103.size.CGFloat height = v85 - (v20 + top);
      double v63 = CGRectGetWidth(v103);
      if (v57)
      {
        double v64 = var1 * (v59 * (double)(v57 - 1) + (double)v57 * (v91 * var13));
        double v65 = (var1 * v63 - (v64 - (double)((int)v64 % (int)var1))) * 0.5;
        double v66 = round(v65);
        if (v52) {
          double v65 = v66;
        }
        double v67 = v65 / a3->var1;
        double v56 = v62 + v67;
        double v61 = v92 + v67;
      }
      else
      {
        double v56 = v62;
      }
      double v92 = v61;
      if (a3->var3 == 2)
      {
        double v69 = v56;
        uint64_t v70 = [v50 numberOfUsedColumns];
        double v56 = v69;
        unint64_t v68 = v70;
      }
      else
      {
        unint64_t v68 = var5;
      }
      double v53 = v91 * var13;
    }
    double v93 = v56;
    if (a3->var14.height == -123.0)
    {
      double v51 = top;
      double v54 = v90 * var13;
    }
    else
    {
      unint64_t v71 = var6;
      double v51 = top;
      double v54 = v90 * var13;
      if (a3->var3 == 2)
      {
        double v72 = v56;
        uint64_t v73 = [v50 numberOfUsedRows];
        double v56 = v72;
        unint64_t v71 = v73;
      }
      double v74 = a3->var1;
      v104.origin.CGFloat x = v83 + v56;
      v104.origin.CGFloat y = v82 + top;
      v104.size.CGFloat width = v84 - (v92 + v56);
      v104.size.CGFloat height = v85 - (v20 + top);
      double v75 = CGRectGetHeight(v104);
      if (v71)
      {
        double v76 = (v75 * a3->var1 - v74 * (v25 * (double)(v71 - 1) + (double)v71 * (v90 * var13))) * 0.5 / a3->var1;
        double v51 = top + v76;
        double v20 = v20 + v76;
      }
    }
  }
  else
  {
    unint64_t v68 = var5;
  }
  uint64_t v77 = var6;
  if (var6 == -1) {
    uint64_t v77 = [v50 numberOfUsedRows];
  }
  v78 = objc_alloc_init(SBIconListViewLayoutMetrics);
  -[SBIconListViewLayoutMetrics setIconSpacing:](v78, "setIconSpacing:", v23, v25);
  [(SBIconListViewLayoutMetrics *)v78 setIconContentScale:var13];
  [(SBIconListViewLayoutMetrics *)v78 setColumns:v87];
  [(SBIconListViewLayoutMetrics *)v78 setRows:var6];
  [(SBIconListViewLayoutMetrics *)v78 setColumnsUsedForLayout:v68];
  [(SBIconListViewLayoutMetrics *)v78 setRowsUsedForLayout:v77];
  -[SBIconListViewLayoutMetrics setIconSize:](v78, "setIconSize:", v53, v54);
  -[SBIconListViewLayoutMetrics setAlignmentIconSize:](v78, "setAlignmentIconSize:", v91, v90);
  -[SBIconListViewLayoutMetrics setIconImageSize:](v78, "setIconImageSize:", a3->var12.width, a3->var12.height);
  -[SBIconListViewLayoutMetrics setIconInsets:](v78, "setIconInsets:", v51, v93, v20, v92);
  [(SBIconListViewLayoutMetrics *)v78 setListModel:v88];
  [(SBIconListViewLayoutMetrics *)v78 setGridCellInfo:v50];
  [(SBIconListViewLayoutMetrics *)v78 setAdjustedInsetsToFit:v26 & 1];
  [(SBIconListViewLayoutMetrics *)v78 setAdjustedIconContentScaleToFit:v33 & 1];
  [(SBIconListViewLayoutMetrics *)v78 setNeedsHorizontalColumnBumps:v52 != 0];

  return v78;
}

uint64_t __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32) != 2)
  {
    if (*(double *)(*(void *)(result + 40) + 176) == -123.0)
    {
      if (!*(unsigned char *)(result + 104)) {
        return result;
      }
    }
    else if (!*(unsigned char *)(result + 105))
    {
      return result;
    }
    return SBFFloatFloorForScale();
  }
  return result;
}

BOOL __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_3(uint64_t a1, double a2, double a3, double a4)
{
  SBFFloatFloorForScale();
  return a4 > 0.0 && v6 <= *(double *)(a1 + 80);
}

BOOL __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_2(uint64_t a1, double a2, double a3)
{
  return (a2 >= 10.0 || *(void *)(a1 + 32) <= 1uLL) && (a3 >= 10.0 || *(void *)(a1 + 40) <= 1uLL);
}

- (void)layoutIconsIfNeededWithAnimationType:(int64_t)a3 options:(unint64_t)a4
{
  int64_t v7 = [(SBHIconEditingSettings *)self->_iconEditingSettings overrideAnimationType];
  if (v7 != -1) {
    a3 = v7;
  }
  id v8 = [(id)objc_opt_class() builtInAnimatorForAnimationType:a3];
  [(SBIconListView *)self layoutIconsIfNeededUsingAnimator:v8 options:a4];
}

- (void)layoutIconsIfNeededUsingAnimator:(id)a3 options:(unint64_t)a4
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(SBIconListView *)self _teardownLayoutRunloopObserverIfNeeded];
  if (!self->_needsLayout || self->_purged || self->_rotating) {
    goto LABEL_89;
  }
  int64_t v7 = SBLogWidgets();
  if (os_signpost_enabled(v7))
  {
    id v8 = NSString;
    double v9 = (objc_class *)objc_opt_class();
    double v10 = NSStringFromClass(v9);
    double v11 = [v8 stringWithFormat:@"<%@: %p>", v10, self];
    *(_DWORD *)buf = 138543362;
    v191 = v11;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "iconListView=%{public}@", buf, 0xCu);
  }
  if (![(NSMapTable *)self->_specialIconAnimations count])
  {
LABEL_15:
    v135 = v6;
    self->_inLayout = 1;
    if ([(SBIconListView *)self boundsSizeTracksContentSize])
    {
      [(SBIconListView *)self iconSpacing];
      double v19 = v18;
      double v20 = v17;
      if (v18 != -123.0 || v17 != -123.0)
      {
        [(SBIconListView *)self bounds];
        double v24 = v23;
        double v26 = v25;
        double v27 = v21;
        double v28 = v22;
        double v29 = 30000.0;
        if (v19 == -123.0) {
          double v30 = v21;
        }
        else {
          double v30 = 30000.0;
        }
        if (v20 == -123.0) {
          double v29 = v22;
        }
        -[SBIconListView sizeThatFits:](self, "sizeThatFits:", v30, v29);
        if (v31 != v27 || v32 != v28)
        {
          -[SBIconListView setBounds:](self, "setBounds:", v24, v26, v31, v32);
          long long v182 = 0u;
          long long v183 = 0u;
          long long v180 = 0u;
          long long v181 = 0u;
          double v34 = self->_layoutObservers;
          uint64_t v35 = [(NSHashTable *)v34 countByEnumeratingWithState:&v180 objects:v189 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v181;
            do
            {
              for (uint64_t i = 0; i != v36; ++i)
              {
                if (*(void *)v181 != v37) {
                  objc_enumerationMutation(v34);
                }
                double v39 = *(void **)(*((void *)&v180 + 1) + 8 * i);
                if (objc_opt_respondsToSelector()) {
                  [v39 iconListViewDidChangeBoundsSize:self];
                }
              }
              uint64_t v36 = [(NSHashTable *)v34 countByEnumeratingWithState:&v180 objects:v189 count:16];
            }
            while (v36);
          }
        }
      }
    }
    v134 = [(SBIconListView *)self displayedModel];
    v138 = [v134 icons];
    v130 = [MEMORY[0x1E4F1CA48] array];
    v128 = [(SBIconListView *)self iconLocation];
    BOOL v136 = [(SBIconListView *)self pausesIconsForScrolling];
    BOOL v40 = [(SBIconListView *)self isLayoutReversed];
    uint64_t v41 = 2;
    if (!v40) {
      uint64_t v41 = 0;
    }
    uint64_t v124 = v41;
    double v42 = [(SBIconListView *)self layoutMetrics];
    v120 = [v42 gridCellInfo];
    uint64_t v132 = [v42 columnsUsedForLayout];
    [v42 iconContentScale];
    uint64_t v44 = v43;
    char v123 = [v42 adjustedIconContentScaleToFit];
    unint64_t v126 = [(SBIconListView *)self iconViewConfigurationOptions];
    uint64_t v45 = [(SBIconListView *)self visibleColumnRange];
    uint64_t v116 = v46;
    uint64_t v118 = v45;
    uint64_t v47 = [(SBIconListView *)self visibleRowRange];
    uint64_t v114 = v48;
    uint64_t v115 = v47;
    uint64_t v49 = [(SBIconListView *)self predictedVisibleColumn];
    uint64_t v110 = v50;
    uint64_t v111 = v49;
    uint64_t v51 = [(SBIconListView *)self predictedVisibleRow];
    uint64_t v112 = v52;
    uint64_t v113 = v51;
    BOOL v54 = (a4 & 2) == 0 && v135 != 0;
    BOOL v122 = v54;
    [(SBIconListView *)self layoutScale];
    uint64_t v56 = v55;
    int64_t v109 = [(SBIconListView *)self layoutOrientation];
    [v42 iconSpacing];
    -[SBIconListView cursorHitTestingInsetsForIconSpacing:](self, "cursorHitTestingInsetsForIconSpacing:");
    uint64_t v58 = v57;
    uint64_t v60 = v59;
    uint64_t v62 = v61;
    uint64_t v64 = v63;
    double v65 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_willLayoutIconView_];
    v108 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_animatorForLayingOutIconView_proposedAnimator_];
    id v66 = objc_alloc(MEMORY[0x1E4F1CA80]);
    double v67 = [(NSMapTable *)self->_iconViews keyEnumerator];
    unint64_t v68 = [v67 allObjects];
    double v69 = (void *)[v66 initWithArray:v68];

    v150[0] = MEMORY[0x1E4F143A8];
    v150[1] = 3221225472;
    v150[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2;
    v150[3] = &unk_1E6AB0D80;
    uint64_t v160 = v132;
    id v70 = v69;
    id v151 = v70;
    v152 = self;
    id v121 = v120;
    id v153 = v121;
    uint64_t v161 = v118;
    uint64_t v162 = v116;
    uint64_t v163 = v115;
    uint64_t v164 = v114;
    uint64_t v165 = v111;
    uint64_t v166 = v110;
    id v71 = v42;
    id v6 = v135;
    id v72 = v71;
    id v154 = v71;
    uint64_t v167 = v113;
    uint64_t v168 = v112;
    id v119 = v128;
    id v155 = v119;
    int64_t v169 = v109;
    uint64_t v170 = v58;
    uint64_t v171 = v60;
    uint64_t v172 = v62;
    uint64_t v173 = v64;
    unint64_t v174 = v126;
    id v131 = v130;
    id v156 = v131;
    uint64_t v175 = v56;
    uint64_t v176 = v44;
    id v73 = v65;
    id v157 = v73;
    id v74 = v135;
    id v158 = v74;
    id v127 = v108;
    id v159 = v127;
    BOOL v177 = v122;
    BOOL v178 = v136;
    char v179 = v123;
    [v138 enumerateObjectsWithOptions:v124 usingBlock:v150];
    id v75 = v74;
    double v76 = v75;
    id v77 = v75;
    v133 = v70;
    v129 = v73;
    if (v135)
    {
      id v77 = v75;
      if ((a4 & 1) == 0)
      {
        uint64_t v78 = [v70 count];
        id v77 = v76;
        if (v78)
        {
          v79 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_animatorForRemovingIcons_proposedAnimator_];
          double v80 = v76;
          id v117 = v72;
          if (v79)
          {
            char v81 = [v70 allObjects];
            uint64_t v82 = [v79 iconListView:self animatorForRemovingIcons:v81 proposedAnimator:v76];

            double v80 = (void *)v82;
            id v72 = v117;
          }
          v137 = v80;
          char v83 = objc_opt_respondsToSelector();

          if (v83)
          {
            v125 = v76;
            id v84 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v146 = 0u;
            long long v147 = 0u;
            long long v148 = 0u;
            long long v149 = 0u;
            id v85 = v70;
            uint64_t v86 = [v85 countByEnumeratingWithState:&v146 objects:v188 count:16];
            if (v86)
            {
              uint64_t v87 = v86;
              uint64_t v88 = *(void *)v147;
              do
              {
                for (uint64_t j = 0; j != v87; ++j)
                {
                  if (*(void *)v147 != v88) {
                    objc_enumerationMutation(v85);
                  }
                  uint64_t v90 = *(void *)(*((void *)&v146 + 1) + 8 * j);
                  double v91 = [(NSMapTable *)self->_iconViews objectForKey:v90];
                  if (v91)
                  {
                    [(NSMapTable *)self->_iconViews removeObjectForKey:v90];
                    double v92 = [v91 superview];

                    if (v92 == self) {
                      [v84 addObject:v91];
                    }
                  }
                }
                uint64_t v87 = [v85 countByEnumeratingWithState:&v146 objects:v188 count:16];
              }
              while (v87);
            }

            if ([v84 count])
            {
              v143[0] = MEMORY[0x1E4F143A8];
              v143[1] = 3221225472;
              v143[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_76;
              v143[3] = &unk_1E6AACA90;
              id v84 = v84;
              id v144 = v84;
              v145 = self;
              [v137 iconListView:self wantsAnimatedRemovalForIconViews:v84 completionHandler:v143];
            }
            id v6 = v135;
            goto LABEL_78;
          }
          id v77 = v137;
        }
      }
    }
    v137 = v77;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v84 = v70;
    uint64_t v94 = [v84 countByEnumeratingWithState:&v139 objects:v187 count:16];
    if (!v94)
    {
      CGRect v104 = v72;
      CGRect v101 = v138;
      CGRect v102 = v119;
      CGRect v103 = v121;
LABEL_80:

      removedIcons = self->_removedIcons;
      self->_removedIcons = 0;

      if ([(SBIconListView *)self showsEmptyGridCells]
        || [(NSMutableDictionary *)self->_emptyGridCells count])
      {
        [(SBIconListView *)self layOutEmptyGridCellViewsUsingAnimator:v76];
      }
      self->_inLayout = 0;
      self->_needsLayout = 0;
      [(SBIconListView *)self layoutFocusGuides];
      if ([(SBIconListView *)self isDisplayingWidgetIntroduction]) {
        [(SBIconListView *)self layoutWidgetIntroductionViews];
      }
      [(SBIconListView *)self _updateEditingStateForIcons:v131 animated:v6 != 0];
      v106 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListViewDidLayoutIcons_];
      [v106 iconListViewDidLayoutIcons:self];
      v107 = SBLogWidgets();
      if (os_signpost_enabled(v107))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v107, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", " isAnimation=YES ", buf, 2u);
      }

      double v93 = v134;
      goto LABEL_88;
    }
    uint64_t v95 = v94;
    v125 = v76;
    id v117 = v72;
    uint64_t v96 = *(void *)v140;
    do
    {
      for (uint64_t k = 0; k != v95; ++k)
      {
        if (*(void *)v140 != v96) {
          objc_enumerationMutation(v84);
        }
        uint64_t v98 = *(void *)(*((void *)&v139 + 1) + 8 * k);
        BOOL v99 = [(NSMapTable *)self->_iconViews objectForKey:v98];
        if (v99)
        {
          [(NSMapTable *)self->_iconViews removeObjectForKey:v98];
          v100 = [v99 superview];

          if (v100 == self) {
            [(SBIconListView *)self removeIconView:v99];
          }
        }
      }
      uint64_t v95 = [v84 countByEnumeratingWithState:&v139 objects:v187 count:16];
    }
    while (v95);
LABEL_78:
    CGRect v101 = v138;
    CGRect v102 = v119;
    CGRect v103 = v121;
    CGRect v104 = v117;
    double v76 = v125;
    goto LABEL_80;
  }
  if (!v6)
  {
    specialIconAnimations = self->_specialIconAnimations;
    self->_specialIconAnimations = 0;

    CGFloat v16 = SBLogWidgets();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "animator Nil isAnimation=YES ", buf, 2u);
    }

    goto LABEL_15;
  }
  BOOL performingSpecialIconAnimations = self->_performingSpecialIconAnimations;
  double v13 = SBLogWidgets();
  BOOL v14 = os_signpost_enabled(v13);
  if (!performingSpecialIconAnimations)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "performSpecialIconAnimations isAnimation=YES ", buf, 2u);
    }

    v184[0] = MEMORY[0x1E4F143A8];
    v184[1] = 3221225472;
    v184[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke;
    v184[3] = &unk_1E6AADF50;
    v184[4] = self;
    id v185 = v6;
    unint64_t v186 = a4;
    [(SBIconListView *)self performSpecialIconAnimationsWithCompletionHandler:v184];
    double v93 = v185;
LABEL_88:

    goto LABEL_89;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7F0A000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "EndedEarly=YES isAnimation=YES ", buf, 2u);
  }

LABEL_89:
}

- (void)_teardownLayoutRunloopObserverIfNeeded
{
  layoutRunLoopObserver = self->_layoutRunLoopObserver;
  if (layoutRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(layoutRunLoopObserver);
    CFRelease(self->_layoutRunLoopObserver);
    self->_layoutRunLoopObserver = 0;
  }
}

+ (id)builtInAnimatorForAnimationType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      int64_t v5 = objc_msgSend(a1, "defaultAnimator", v3);
      goto LABEL_9;
    case 1:
      int64_t v5 = objc_msgSend(a1, "clusterAnimator", v3);
      goto LABEL_9;
    case 2:
      int64_t v5 = objc_msgSend(a1, "dominoAnimator", v3);
      goto LABEL_9;
    case 3:
      int64_t v5 = objc_msgSend(a1, "multiStageAnimator", v3);
LABEL_9:
      break;
    default:
      int64_t v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)isDisplayingWidgetIntroduction
{
  return self->_pronouncedContainerView || self->_widgetIntroductionPopover != 0;
}

- (void)layoutFocusGuides
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_wrappingFocusGuideViews;
  if (![(SBIconListView *)self addsFocusGuidesForWrapping]
    || (unint64_t v4 = [(SBIconListView *)self iconRowsForCurrentOrientation],
        v4 - 2 > 0x7FFFFFFFFFFFFFFCLL))
  {
    uint64_t v43 = 0;
    if (!v3) {
      goto LABEL_18;
    }
    goto LABEL_10;
  }
  unint64_t v5 = v4;
  id v6 = [(SBIconListView *)self layoutMetrics];
  [(SBIconListView *)self iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassDefault"];
  uint64_t v8 = v7;
  unint64_t v9 = [(SBIconListView *)self iconColumnsForCurrentOrientation];
  [v6 iconInsets];
  double v11 = v10;
  double v13 = v12;
  [(SBIconListView *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  BOOL v22 = [(SBIconListView *)self isRTL];
  v71.origin.CGFloat x = v15;
  v71.origin.CGFloat y = v17;
  v71.size.CGFloat width = v19;
  v71.size.CGFloat height = v21;
  double v23 = v11 * 0.5 + CGRectGetMinX(v71);
  v72.origin.CGFloat x = v15;
  v72.origin.CGFloat y = v17;
  v72.size.CGFloat width = v19;
  v72.size.CGFloat height = v21;
  double v24 = CGRectGetMaxX(v72) - v13 * 0.5 + -10.0;
  double v25 = [MEMORY[0x1E4F1CA48] array];
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__SBIconListView_layoutFocusGuides__block_invoke;
  aBlock[3] = &unk_1E6AB0FB0;
  BOOL v54 = v3;
  id v66 = v54;
  double v67 = self;
  double v53 = v25;
  unint64_t v68 = v53;
  double v26 = _Block_copy(aBlock);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __35__SBIconListView_layoutFocusGuides__block_invoke_2;
  v59[3] = &unk_1E6AB0FD8;
  v59[4] = self;
  id v27 = v6;
  id v60 = v27;
  double v62 = v23;
  double v63 = v24;
  uint64_t v64 = v8;
  id v52 = v26;
  id v61 = v52;
  double v28 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, BOOL))_Block_copy(v59);
  uint64_t v29 = 0;
  do
  {
    uint64_t v30 = -[SBIconListView _coordinateBeforeCoordinate:rows:columns:metrics:](self, "_coordinateBeforeCoordinate:rows:columns:metrics:", 1, ++v29, v5, v9, v27);
    v28[2](v28, 1, v29, v30, v31, v22);
    uint64_t v32 = -[SBIconListView _coordinateAfterCoordinate:rows:columns:metrics:](self, "_coordinateAfterCoordinate:rows:columns:metrics:", v9, v29, v5, v9, v27);
    v28[2](v28, v9, v29, v32, v33, !v22);
  }
  while (v5 != v29);
  double v34 = [(SBIconListView *)self icons];
  uint64_t v35 = [v34 firstObject];
  uint64_t v36 = [(SBIconListView *)self coordinateForIcon:v35];
  uint64_t v50 = v37;
  uint64_t v51 = v36;

  double v38 = [(SBIconListView *)self icons];
  double v39 = [v38 lastObject];
  uint64_t v40 = [(SBIconListView *)self coordinateForIcon:v39];
  uint64_t v42 = v41;

  v28[2](v28, v51, v50, v40, v42, v22);
  v28[2](v28, v40, v42, v51, v50, !v22);

  uint64_t v3 = v54;
  uint64_t v43 = v53;
  if (v54)
  {
LABEL_10:
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v44 = v3;
    uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v55 objects:v69 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v56 != v47) {
            objc_enumerationMutation(v44);
          }
          objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "removeFromSuperview", v50, v51);
        }
        uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v55 objects:v69 count:16];
      }
      while (v46);
    }

    [(NSMutableArray *)v44 removeAllObjects];
  }
LABEL_18:
  wrappingFocusGuideViews = self->_wrappingFocusGuideViews;
  self->_wrappingFocusGuideViews = v43;
}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

- (id)visibleGridCellIndexesWithMetrics:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v6 = [v4 gridCellInfo];
  unint64_t v7 = [v6 numberOfUsedColumns];
  double v34 = v6;
  unint64_t v8 = [v6 numberOfUsedRows];
  uint64_t v35 = v4;
  uint64_t v9 = [v4 columnsUsedForLayout];
  unint64_t v10 = [(SBIconListView *)self visibleColumnRange];
  unint64_t v33 = v11;
  unint64_t v12 = [(SBIconListView *)self visibleRowRange];
  unint64_t v14 = v13;
  uint64_t v15 = [(SBIconListView *)self predictedVisibleColumn];
  double v17 = v16;
  uint64_t v18 = [(SBIconListView *)self predictedVisibleRow];
  unint64_t v32 = v7;
  if (v10 < v7 && v12 < v8)
  {
    double v20 = v17;
    uint64_t v30 = v18;
    double v31 = v19;
    if (v14 >= v8) {
      unint64_t v21 = v8;
    }
    else {
      unint64_t v21 = v14;
    }
    if (v33 >= v9 - v10) {
      unint64_t v22 = v9 - v10;
    }
    else {
      unint64_t v22 = v33;
    }
    if (v12 < v21 + v12)
    {
      unint64_t v23 = v10 + v12 * v9;
      do
      {
        objc_msgSend(v5, "addIndexesInRange:", v23, v22, v30);
        v23 += v9;
        --v21;
      }
      while (v21);
    }
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v24 = vcvtad_u64_f64((double)v8 * v20);
      for (unint64_t i = v24 >= v14 ? v14 : v24; i; --i)
      {
        objc_msgSend(v5, "addIndex:", v15, v30);
        v15 += v9;
      }
    }
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v26 = vcvtad_u64_f64((double)v32 * v31);
      unint64_t v27 = v26 >= v33 ? v33 : v26;
      if (v27)
      {
        uint64_t v28 = v30 * v9;
        do
        {
          objc_msgSend(v5, "addIndex:", v28++, v30);
          --v27;
        }
        while (v27);
      }
    }
  }

  return v5;
}

- (_NSRange)visibleColumnRange
{
  p_visibleColumnRange = &self->_visibleColumnRange;
  NSUInteger location = self->_visibleColumnRange.location;
  NSUInteger length = p_visibleColumnRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)visibleRowRange
{
  p_visibleRowRange = &self->_visibleRowRange;
  NSUInteger location = self->_visibleRowRange.location;
  NSUInteger length = p_visibleRowRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)hideAllIcons
{
}

- (void)setVisibleColumnRange:(_NSRange)a3 predictedVisibleColumn:(SBIconListPredictedVisibleColumn)a4 visibleRowRange:(_NSRange)a5 predictedVisibleRow:(SBIconListPredictedVisibleRow)a6
{
  NSUInteger length = a5.length;
  uint64_t location = a5.location;
  double confidence = a4.confidence;
  unint64_t column = a4.column;
  NSUInteger v10 = a3.length;
  NSUInteger v11 = a3.location;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_iconVisibilityAssertions count])
  {
    uint64_t location = [(SBIconListView *)self _allIconsVisibleColumnOrRowRange];
    NSUInteger length = v13;
    unint64_t row = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t column = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v11 = location;
    NSUInteger v10 = v13;
  }
  else
  {
    unint64_t row = a6.row;
  }
  NSUInteger v30 = v11;
  BOOL v16 = v11 != self->_visibleColumnRange.location || v10 != self->_visibleColumnRange.length;
  BOOL v17 = column != self->_predictedVisibleColumn.column || self->_predictedVisibleColumn.confidence != confidence;
  BOOL v19 = location != self->_visibleRowRange.location || length != self->_visibleRowRange.length;
  if (row == self->_predictedVisibleRow.row)
  {
    double v20 = self->_predictedVisibleRow.confidence;
    BOOL v29 = v20 != a6.confidence;
    if (!v16 && !v17 && !v19 && v20 == a6.confidence)
    {
      unint64_t v21 = SBLogIcon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:]();
      }
      goto LABEL_42;
    }
  }
  else
  {
    BOOL v29 = 1;
  }
  unint64_t v27 = row;
  double v28 = confidence;
  if (v16)
  {
    unint64_t v22 = SBLogIcon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v32 = self;
      __int16 v33 = 2048;
      NSUInteger v34 = v30;
      __int16 v35 = 2048;
      double v36 = *(double *)&v10;
      _os_log_debug_impl(&dword_1D7F0A000, v22, OS_LOG_TYPE_DEBUG, "%p: change visible columns to {%lu, %lu}", buf, 0x20u);
    }
  }
  if (v17)
  {
    unint64_t v23 = SBLogIcon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v32 = self;
      __int16 v33 = 2048;
      NSUInteger v34 = column;
      __int16 v35 = 2048;
      double v36 = v28;
      _os_log_debug_impl(&dword_1D7F0A000, v23, OS_LOG_TYPE_DEBUG, "%p: change predicted visible column to %lu (%f)", buf, 0x20u);
    }
  }
  if (v19)
  {
    unint64_t v24 = SBLogIcon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v32 = self;
      __int16 v33 = 2048;
      NSUInteger v34 = location;
      __int16 v35 = 2048;
      double v36 = *(double *)&length;
      _os_log_debug_impl(&dword_1D7F0A000, v24, OS_LOG_TYPE_DEBUG, "%p: change visible rows to {%lu, %lu}", buf, 0x20u);
    }
  }
  if (v29)
  {
    double v25 = SBLogIcon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v32 = self;
      __int16 v33 = 2048;
      NSUInteger v34 = v27;
      __int16 v35 = 2048;
      double v36 = a6.confidence;
      _os_log_debug_impl(&dword_1D7F0A000, v25, OS_LOG_TYPE_DEBUG, "%p: change predicted visible row to %lu (%f)", buf, 0x20u);
    }
  }
  unint64_t v21 = [(SBIconListView *)self layoutMetrics];
  unint64_t v26 = [(SBIconListView *)self visibleGridCellIndexesWithMetrics:v21];
  self->_visibleColumnRange.uint64_t location = v30;
  self->_visibleColumnRange.NSUInteger length = v10;
  self->_predictedVisibleColumn.unint64_t column = column;
  self->_predictedVisibleColumn.double confidence = v28;
  self->_visibleRowRange.uint64_t location = location;
  self->_visibleRowRange.NSUInteger length = length;
  self->_predictedVisibleRow.unint64_t row = v27;
  self->_predictedVisibleRow.double confidence = a6.confidence;
  [(SBIconListView *)self _updateVisibleIconViewsWithOldVisibleGridCellIndexes:v26 metrics:v21];

LABEL_42:
}

- (SBIconListPredictedVisibleRow)predictedVisibleRow
{
  p_predictedVisibleRow = &self->_predictedVisibleRow;
  unint64_t row = self->_predictedVisibleRow.row;
  double confidence = p_predictedVisibleRow->confidence;
  result.double confidence = confidence;
  result.unint64_t row = row;
  return result;
}

- (SBIconListPredictedVisibleColumn)predictedVisibleColumn
{
  p_predictedVisibleColumn = &self->_predictedVisibleColumn;
  unint64_t column = self->_predictedVisibleColumn.column;
  double confidence = p_predictedVisibleColumn->confidence;
  result.double confidence = confidence;
  result.unint64_t column = column;
  return result;
}

- (BOOL)showsEmptyGridCells
{
  return self->_showsEmptyGridCells;
}

- (BOOL)pausesIconsForScrolling
{
  return self->_pausesIconsForScrolling;
}

- (UIEdgeInsets)cursorHitTestingInsetsForIconSpacing:(CGSize)a3
{
  double desiredLaserPaddingX = fabs(a3.width) * 0.5;
  double desiredLaserPaddingY = fabs(a3.height) * 0.5;
  if (!self->_laserPadUsesAllAvailableSpace)
  {
    if (desiredLaserPaddingX > self->_desiredLaserPaddingX) {
      double desiredLaserPaddingX = self->_desiredLaserPaddingX;
    }
    if (desiredLaserPaddingY > self->_desiredLaserPaddingY) {
      double desiredLaserPaddingY = self->_desiredLaserPaddingY;
    }
  }
  double v5 = -desiredLaserPaddingY;
  double v6 = -desiredLaserPaddingX;
  double v7 = v5;
  double v8 = v6;
  result.double right = v8;
  result.double bottom = v7;
  result.double left = v6;
  result.double top = v5;
  return result;
}

- (BOOL)boundsSizeTracksContentSize
{
  return self->_boundsSizeTracksContentSize;
}

- (void)layoutIconsIfNeeded
{
}

- (void)setIconSpacing:(CGSize)a3
{
  if (a3.width != self->_iconSpacing.width || a3.height != self->_iconSpacing.height)
  {
    self->_iconSpacing = a3;
    [(SBIconListView *)self setIconsNeedLayout];
    [(SBIconListView *)self invalidateIntrinsicContentSize];
  }
}

- (void)showAllIcons
{
  uint64_t v3 = [(SBIconListView *)self _allIconsVisibleColumnOrRowRange];
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", v3, v4, 0x7FFFFFFFFFFFFFFFLL, 0, v3, v4, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (_NSRange)_allIconsVisibleColumnOrRowRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = -1;
  result.NSUInteger length = v3;
  result.uint64_t location = v2;
  return result;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void)updateEditingStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(NSMapTable *)self->_iconViews keyEnumerator];
  double v6 = [v5 allObjects];
  [(SBIconListView *)self _updateEditingStateForIcons:v6 animated:v3];

  if ([(SBIconListView *)self automaticallyShowsEmptyGridCellsWhileEditing])
  {
    BOOL v7 = [(SBIconListView *)self isEditing];
    [(SBIconListView *)self setShowsEmptyGridCells:v7 animated:v3];
  }
}

- (BOOL)automaticallyShowsEmptyGridCellsWhileEditing
{
  return self->_automaticallyShowsEmptyGridCellsWhileEditing;
}

- (void)addLayoutObserver:(id)a3
{
  id v4 = a3;
  layoutObservers = self->_layoutObservers;
  id v8 = v4;
  if (!layoutObservers)
  {
    double v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v7 = self->_layoutObservers;
    self->_layoutObservers = v6;

    id v4 = v8;
    layoutObservers = self->_layoutObservers;
  }
  [(NSHashTable *)layoutObservers addObject:v4];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBIconListView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SBIconListView;
  -[SBIconListView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (!self->_inLayout && (v9 != width || v11 != height)) {
    [(SBIconListView *)self layoutIconsNow];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SBIconListView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SBIconListView;
  -[SBIconListView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (!self->_inLayout && (v9 != width || v11 != height)) {
    [(SBIconListView *)self layoutIconsNow];
  }
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBIconListView;
  -[SBIconListView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (self->_ignoreNextWindowChange)
  {
    self->_ignoreNextWindowChange = 0;
  }
  else if (a3)
  {
    double v5 = [(SBIconListView *)self window];

    if (!v5) {
      [(SBIconListView *)self layoutIconsNow];
    }
  }
  else
  {
    [(SBIconListView *)self removeAllIconViews];
    [(SBIconListView *)self _teardownLayoutRunloopObserverIfNeeded];
  }
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v5 = (SBHIconImageAppearance *)[v4 copy];
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__SBIconListView_setOverrideIconImageAppearance___block_invoke;
    v7[3] = &unk_1E6AAD830;
    id v8 = v4;
    [(SBIconListView *)self enumerateDisplayedIconViewsUsingBlock:v7];
  }
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  [(SBIconListView *)self icons];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = [(SBIconListView *)self displayedIconViewForIcon:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        if (v10)
        {
          char v11 = 0;
          v4[2](v4, v10, &v11);
          if (v11)
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

uint64_t __49__SBIconListView_setOverrideIconImageAppearance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOverrideIconImageAppearance:*(void *)(a1 + 32)];
}

- (void)setUserInterfaceLayoutDirectionHandling:(unint64_t)a3
{
  if (self->_userInterfaceLayoutDirectionHandling != a3)
  {
    self->_userInterfaceLayoutDirectionHandling = a3;
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__SBIconListView_setLegibilitySettings___block_invoke;
    v6[3] = &unk_1E6AAEB78;
    uint64_t v7 = v5;
    [(SBIconListView *)self enumerateIconViewsUsingBlock:v6];
  }
}

- (void)setLayoutDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layoutDelegate, obj);
    if (!obj) {
      [(SBIconListView *)self layoutIconsNow];
    }
    [(SBIconListView *)self updateIconLocationWithNonDefaultSizedIcons];
    id v5 = obj;
  }
}

- (void)updateIconLocationWithNonDefaultSizedIcons
{
  BOOL v3 = [(SBIconListView *)self modelHasNonDefaultSizedIcons];
  [(SBIconListView *)self updateIconLocationWithNonDefaultSizedIcons:v3];
}

- (void)updateIconLocationWithNonDefaultSizedIcons:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_alternateIconLocationForListWithNonDefaultSizedIcons_];
  if (v5)
  {
    id v7 = v5;
    uint64_t v6 = [v5 iconListView:self alternateIconLocationForListWithNonDefaultSizedIcons:v3];
    if (v6) {
      [(SBIconListView *)self setIconLocation:v6];
    }

    id v5 = v7;
  }
}

- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3
{
  if (self->_iconSpacingAxisMatchingBehavior != a3)
  {
    self->_iconSpacingAxisMatchingBehavior = a3;
    [(SBIconListView *)self setHasSetIconSpacingAxisMatchingBehavior:1];
    [(SBIconListView *)self setIconsNeedLayout];
    [(SBIconListView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setIconImageCache:(id)a3
{
  id v5 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__SBIconListView_setIconImageCache___block_invoke;
    v6[3] = &unk_1E6AAEB78;
    id v7 = v5;
    [(SBIconListView *)self enumerateIconViewsUsingBlock:v6];
  }
}

- (void)setFolderIconImageCache:(id)a3
{
  id v5 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__SBIconListView_setFolderIconImageCache___block_invoke;
    v6[3] = &unk_1E6AAEB78;
    id v7 = v5;
    [(SBIconListView *)self enumerateIconViewsUsingBlock:v6];
  }
}

- (void)setDragDelegate:(id)a3
{
}

- (void)setAddsFocusGuidesForWrapping:(BOOL)a3
{
  if (self->_addsFocusGuidesForWrapping != a3)
  {
    self->_addsFocusGuidesForWrapping = a3;
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

- (BOOL)modelHasNonDefaultSizedIcons
{
  NSUInteger v2 = [(SBIconListView *)self displayedModel];
  char v3 = [v2 directlyContainsNonDefaultSizeClassIcon];

  return v3;
}

- (SBIconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  [(id)objc_opt_class() defaultFrameForOrientation:a6];
  v42.receiver = self;
  v42.super_class = (Class)SBIconListView;
  uint64_t v17 = -[SBIconListView initWithFrame:](&v42, sel_initWithFrame_);
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_model, a3);
    objc_storeStrong((id *)&v18->_layoutProvider, a4);
    uint64_t v19 = [v15 copy];
    iconLocation = v18->_iconLocation;
    v18->_iconLocation = (NSString *)v19;

    v18->_orientation = a6;
    objc_storeWeak((id *)&v18->_iconViewProvider, v16);
    v18->_iconContentScale = 1.0;
    v18->_iconViewConfigurationOptions = [(id)objc_opt_class() defaultIconViewConfigurationOptions];
    v18->_alignsIconsOnPixelBoundaries = 1;
    v18->_iconSpacing = (CGSize)vdupq_n_s64(0xC05EC00000000000);
    v18->_automaticallyAdjustsLayoutMetricsToFit = 1;
    uint64_t v21 = [(id)*MEMORY[0x1E4FA6E60] copy];
    iconDragTypeIdentifier = v18->_iconDragTypeIdentifier;
    v18->_iconDragTypeIdentifier = (NSString *)v21;

    v18->_visiblySettled = 1;
    v18->_dragSpringloadingEnabled = 1;
    v18->_contentVisibilitdouble y = 0;
    uint64_t v23 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    iconViews = v18->_iconViews;
    v18->_iconViews = (NSMapTable *)v23;

    [(SBIconListView *)v18 setAutoresizingMask:16];
    [v13 addListObserver:v18];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v25 = v13;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v39;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v39 != v28) {
            objc_enumerationMutation(v25);
          }
          objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * v29++), "addObserver:", v18, (void)v38);
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v27);
    }

    v18->_visibleColumnRange.NSUInteger length = -1;
    v18->_visibleRowRange.NSUInteger length = -1;
    v18->_predictedVisibleColumn.unint64_t column = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v30 = [[SBIconListViewDraggingDestinationDelegate alloc] initWithIconListView:v18];
    draggingDelegate = v18->_draggingDelegate;
    v18->_draggingDelegate = v30;

    unint64_t v32 = +[SBHHomeScreenDomain rootSettings];
    uint64_t v33 = [v32 iconSettings];
    iconSettings = v18->_iconSettings;
    v18->_iconSettings = (SBHIconSettings *)v33;

    [(PTSettings *)v18->_iconSettings addKeyObserver:v18];
    [(SBIconListView *)v18 _applyIconPaddingSettings];
    uint64_t v35 = [v32 iconEditingSettings];
    iconEditingSettings = v18->_iconEditingSettings;
    v18->_iconEditingSettings = (SBHIconEditingSettings *)v35;

    [(SBIconListView *)v18 _setupStateCaptureHandleIfNeeded];
  }

  return v18;
}

- (void)_setupStateCaptureHandleIfNeeded
{
  if (!self->_stateCaptureHandle)
  {
    objc_initWeak(&location, self);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v6, &location);
    BSLogAddStateCaptureBlockWithTitle();
    id v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = self->_stateCaptureHandle;
    self->_stateCaptureHandle = v4;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_applyIconPaddingSettings
{
  [(SBHIconSettings *)self->_iconSettings iconHitboxPaddingX];
  self->_double desiredLaserPaddingX = v3;
  [(SBHIconSettings *)self->_iconSettings iconHitboxPaddingY];
  self->_double desiredLaserPaddingY = v4;
  self->_laserPadUsesAllAvailableSpace = [(SBHIconSettings *)self->_iconSettings alwaysHitTestNearestIcon];
  [(SBIconListView *)self setIconsNeedLayout];
  [(SBIconListView *)self setNeedsLayout];
}

- (void)layoutIconsNow
{
  [(SBIconListView *)self setIconsNeedLayout];
  [(SBIconListView *)self layoutIconsIfNeeded];
}

- (void)setIconsNeedLayout
{
  self->_needsLayout = 1;
  cachedMetrics = self->_cachedMetrics;
  self->_cachedMetrics = 0;

  if (!self->_layoutRunLoopObserver)
  {
    [(SBIconListView *)self _setupLayoutRunLoopObserver];
  }
}

- (void)_setupLayoutRunLoopObserver
{
  if (!self->_layoutRunLoopObserver)
  {
    objc_initWeak(&location, self);
    CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __45__SBIconListView__setupLayoutRunLoopObserver__block_invoke;
    v5[3] = &unk_1E6AAD210;
    objc_copyWeak(&v6, &location);
    self->_layoutRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999900, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_layoutRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

+ (unint64_t)defaultIconViewConfigurationOptions
{
  return 0;
}

+ (CGRect)defaultFrameForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBIconListView;
  [(SBIconListView *)&v3 layoutSubviews];
  if (self->_widgetIntroductionPopover) {
    [(SBIconListView *)self bringWidgetIntroductionPopoverToFront];
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconListView;
  [(SBIconListView *)&v5 didMoveToWindow];
  objc_super v3 = [(SBIconListView *)self window];

  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __33__SBIconListView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E6AAEB78;
    v4[4] = self;
    [(SBIconListView *)self enumerateIconViewsUsingBlock:v4];
  }
}

+ (int64_t)rotationAnchor
{
  return 0;
}

- (void)dealloc
{
  [(SBIconListView *)self _teardownLayoutRunloopObserverIfNeeded];
  [(SBIconListView *)self _teardownStateCapture];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PTSettings *)self->_iconSettings removeKeyObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)SBIconListView;
  [(SBIconListView *)&v4 dealloc];
}

- (id)tintColor
{
  return 0;
}

- (void)removeAllIconViews
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[(NSMapTable *)self->_iconViews copy];
  [(NSMapTable *)self->_iconViews removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        double v9 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * v8), (void)v10);
        [(SBIconListView *)self removeIconView:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setModel:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (SBIconListModel *)a3;
  model = self->_model;
  if (model != v5)
  {
    [(SBIconListModel *)model removeListObserver:self];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = self->_model;
    uint64_t v8 = [(SBIconListModel *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) removeObserver:self];
        }
        uint64_t v9 = [(SBIconListModel *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    [(SBIconListView *)self removeAllIconViews];
    removedIcons = self->_removedIcons;
    self->_removedIcons = 0;

    objc_storeStrong((id *)&self->_model, a3);
    [(SBIconListModel *)v5 addListObserver:self];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v13 = v5;
    uint64_t v14 = [(SBIconListModel *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "addObserver:", self, (void)v18);
        }
        uint64_t v15 = [(SBIconListModel *)v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }

    [(SBIconListView *)self updateIconLocationWithNonDefaultSizedIcons];
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

uint64_t __42__SBIconListView_setFolderIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFolderIconImageCache:*(void *)(a1 + 32)];
}

uint64_t __36__SBIconListView_setIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIconImageCache:*(void *)(a1 + 32)];
}

- (void)setLayoutProvider:(id)a3
{
}

- (void)setLayoutProvider:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (SBIconListLayoutProvider *)a3;
  if (self->_layoutProvider != v7)
  {
    objc_storeStrong((id *)&self->_layoutProvider, a3);
    if (v4)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __45__SBIconListView_setLayoutProvider_animated___block_invoke;
      v18[3] = &unk_1E6AB0BD0;
      long long v19 = v7;
      BOOL v20 = v4;
      [(SBIconListView *)self enumerateDisplayedIconViewsUsingBlock:v18];
    }
    else
    {
      [(SBIconListView *)self removeAllIconViews];
    }
    [(SBIconListView *)self setIconsNeedLayout];
    [(SBIconListView *)self invalidateIntrinsicContentSize];
    if (v4) {
      [(SBIconListView *)self layoutIconsIfNeededWithAnimationType:0 options:0];
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = (void *)[(NSHashTable *)self->_layoutObservers copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v13 iconListViewDidChangeListLayoutProvider:self];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __45__SBIconListView_setLayoutProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setListLayoutProvider:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setIconLocation:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (NSString *)[v6 copy];
    iconLocation = self->_iconLocation;
    self->_iconLocation = v4;

    [(SBIconListView *)self setIconsNeedLayout];
    [(SBIconListView *)self invalidateIntrinsicContentSize];
  }
}

- (id)addOverridingLayoutDelegate:(id)a3 reason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[SBIconListViewIconOverridingLayoutDelegateAssertion alloc] initWithListView:self layoutDelegate:v7 reason:v6];

  overridingLayoutDelegates = self->_overridingLayoutDelegates;
  if (!overridingLayoutDelegates)
  {
    uint64_t v10 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    uint64_t v11 = self->_overridingLayoutDelegates;
    self->_overridingLayoutDelegates = v10;

    overridingLayoutDelegates = self->_overridingLayoutDelegates;
  }
  [(NSPointerArray *)overridingLayoutDelegates addPointer:v8];
  return v8;
}

- (void)removeOverridingLayoutDelegateAssertion:(id)a3
{
  id v7 = a3;
  [(NSPointerArray *)self->_overridingLayoutDelegates compact];
  NSUInteger v4 = [(NSPointerArray *)self->_overridingLayoutDelegates count];
  if (v4)
  {
    NSUInteger v5 = v4;
    uint64_t v6 = 0;
    while ([(NSPointerArray *)self->_overridingLayoutDelegates pointerAtIndex:v6] != v7)
    {
      if (v5 == ++v6) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_overridingLayoutDelegates removePointerAtIndex:v6];
  }
LABEL_7:
  [(SBIconListView *)self updateIconLocationWithNonDefaultSizedIcons];
  [(SBIconListView *)self setIconsNeedLayout];
}

- (BOOL)hasOverridingLayoutDelegates
{
  return [(NSPointerArray *)self->_overridingLayoutDelegates count] != 0;
}

- (void)setLayoutReversed:(BOOL)a3
{
  if (self->_layoutReversed != a3)
  {
    self->_layoutReversed = a3;
    [(SBIconListView *)self layoutIconsNow];
  }
}

- (void)setAllowsGaps:(BOOL)a3
{
  if (self->_allowsGaps != a3)
  {
    self->_allowsGaps = a3;
    [(SBIconListView *)self layoutIconsNow];
  }
}

- (void)setShowsEmptyGridCells:(BOOL)a3
{
}

- (void)setShowsEmptyGridCells:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsEmptyGridCells != a3)
  {
    BOOL v4 = a4;
    self->_showsEmptyGridCells = a3;
    [(SBIconListView *)self setIconsNeedLayout];
    if (v4)
    {
      [(SBIconListView *)self layoutIconsIfNeededWithAnimationType:0 options:0];
    }
  }
}

- (void)setAutomaticallyShowsEmptyGridCellsWhileEditing:(BOOL)a3
{
  if (self->_automaticallyShowsEmptyGridCellsWhileEditing != a3)
  {
    self->_automaticallyShowsEmptyGridCellsWhileEditing = a3;
    BOOL v4 = [(SBIconListView *)self isEditing];
    [(SBIconListView *)self setShowsEmptyGridCells:v4];
  }
}

- (void)setAutomaticallyReversedLayoutOrientations:(unint64_t)a3
{
  unint64_t automaticallyReversedLayoutOrientations = self->_automaticallyReversedLayoutOrientations;
  if (automaticallyReversedLayoutOrientations != a3)
  {
    self->_unint64_t automaticallyReversedLayoutOrientations = a3;
    if (a3)
    {
      [(SBIconListView *)self orientation];
      uint64_t v5 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
    }
    else
    {
      if (!automaticallyReversedLayoutOrientations) {
        return;
      }
      uint64_t v5 = 0;
    }
    [(SBIconListView *)self setLayoutReversed:v5];
  }
}

- (void)updateReversedLayoutBasedOnOrientation
{
  if ([(SBIconListView *)self automaticallyReversedLayoutOrientations])
  {
    [(SBIconListView *)self orientation];
    uint64_t v3 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
    [(SBIconListView *)self setLayoutReversed:v3];
  }
}

- (void)setIconViewConfigurationOptions:(unint64_t)a3
{
  if (self->_iconViewConfigurationOptions != a3)
  {
    self->_iconViewConfigurationOptions = a3;
    [(SBIconListView *)self layoutIconsNow];
    [(SBIconListView *)self invalidateIntrinsicContentSize];
  }
}

- (void)addIconViewConfigurationOption:(unint64_t)a3
{
  unint64_t v4 = [(SBIconListView *)self iconViewConfigurationOptions] | a3;
  [(SBIconListView *)self setIconViewConfigurationOptions:v4];
}

- (void)removeIconViewConfigurationOption:(unint64_t)a3
{
  unint64_t v4 = [(SBIconListView *)self iconViewConfigurationOptions] & ~a3;
  [(SBIconListView *)self setIconViewConfigurationOptions:v4];
}

uint64_t __40__SBIconListView_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLegibilitySettings:*(void *)(a1 + 32)];
}

- (void)setAlignsIconsOnPixelBoundaries:(BOOL)a3
{
  if (self->_alignsIconsOnPixelBoundaries != a3)
  {
    self->_alignsIconsOnPixelBoundaries = a3;
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

- (void)setLayoutInsetsMode:(int64_t)a3
{
  if (self->_layoutInsetsMode != a3)
  {
    self->_layoutInsetsMode = a3;
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

- (BOOL)isVertical
{
  return 0;
}

- (unint64_t)iconRowsForCurrentOrientation
{
  uint64_t v3 = [(SBIconListView *)self layout];
  unint64_t v4 = objc_msgSend(v3, "numberOfRowsForOrientation:", -[SBIconListView layoutOrientation](self, "layoutOrientation"));

  return v4;
}

- (SBHIconGridSize)gridSizeForCurrentOrientation
{
  unsigned __int16 v3 = [(SBIconListView *)self iconColumnsForCurrentOrientation];
  return (SBHIconGridSize)(v3 | ((unsigned __int16)[(SBIconListView *)self iconRowsForCurrentOrientation] << 16));
}

- (unint64_t)maximumIconCount
{
  NSUInteger v2 = [(SBIconListView *)self layout];
  unint64_t v3 = SBHIconListLayoutMaximumIconCount(v2);

  return v3;
}

- (void)setAdditionalLayoutInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalLayoutInsets.left
    || a3.top != self->_additionalLayoutInsets.top
    || a3.right != self->_additionalLayoutInsets.right
    || a3.bottom != self->_additionalLayoutInsets.bottom)
  {
    self->_additionalLayoutInsets = a3;
    [(SBIconListView *)self setIconsNeedLayout];
    [(SBIconListView *)self invalidateIntrinsicContentSize];
  }
}

- (CGRect)iconLayoutRect
{
  [(SBIconListView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SBIconListView *)self layoutInsetsForOrientation:[(SBIconListView *)self orientation]];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_widgetIconLayoutRect
{
  double v3 = [(SBIconListView *)self layout];
  [(SBIconListView *)self iconLayoutRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (objc_opt_respondsToSelector())
  {
    int64_t v12 = [(SBIconListView *)self orientation];
    double v13 = [(SBIconListView *)self layout];
    [v13 additionalWidgetLayoutInsetsForOrientation:v12];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    double v5 = v5 + v17;
    double v7 = v7 + v15;
    double v9 = v9 - (v17 + v21);
    double v11 = v11 - (v15 + v19);
  }

  double v22 = v5;
  double v23 = v7;
  double v24 = v9;
  double v25 = v11;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (BOOL)_shouldEnforceLayoutInsetsForAxis:(unint64_t)a3
{
  double v4 = [(SBIconListView *)self layout];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 enforceLayoutInsetsForAxis:a3];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)indexForCoordinate:(SBIconCoordinate)a3 forOrientation:(int64_t)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  double v8 = [(SBIconListView *)self layoutMetrics];
  unint64_t v9 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](self, "indexForCoordinate:forOrientation:metrics:", column, row, a4, v8);

  return v9;
}

- (unint64_t)indexForCoordinate:(SBIconCoordinate)a3 forOrientation:(int64_t)a4 metrics:(id)a5
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v9 = a5;
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (row && row != 0x7FFFFFFFFFFFFFFFLL && column != 0x7FFFFFFFFFFFFFFFLL && column)
  {
    double v11 = [(SBIconListView *)self layout];
    unint64_t v12 = [v11 numberOfRowsForOrientation:a4];

    double v13 = [(SBIconListView *)self layout];
    unint64_t v14 = [v13 numberOfColumnsForOrientation:a4];

    if (row > 0) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = v12;
    }
    if (column > 0) {
      uint64_t v16 = -1;
    }
    else {
      uint64_t v16 = v14;
    }
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v17 = v16 + column;
    if (v17 >= 0)
    {
      unint64_t v18 = v15 + row;
      if ((v18 & 0x8000000000000000) == 0 && v17 < v14 && v18 < v12) {
        unint64_t v10 = -[SBIconListView iconIndexForGridCellIndex:metrics:](self, "iconIndexForGridCellIndex:metrics:", -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9), v9);
      }
    }
  }

  return v10;
}

- (SBHIconGridRange)iconGridRangeForIndex:(unint64_t)a3 metrics:(id)a4
{
  char v5 = [a4 gridCellInfo];
  uint64_t v6 = objc_msgSend(v5, "gridRangeForGridCellIndex:", objc_msgSend(v5, "gridCellIndexForIconIndex:", a3));
  uint64_t v8 = v7;

  unint64_t v9 = v6;
  uint64_t v10 = v8;
  result.size = (SBHIconGridSize)v10;
  result.cellIndedouble x = v9;
  return result;
}

- (id)iconGridSizeClassForIconGridSize:(SBHIconGridSize)a3
{
  char v5 = [(SBIconListView *)self iconGridSizeClassSizes];
  uint64_t v6 = [(SBIconListView *)self displayedModel];
  uint64_t v7 = [v6 allowedGridSizeClasses];
  uint64_t v8 = [v5 bestGridSizeClassForGridSize:*(unsigned int *)&a3 allowedGridSizeClasses:v7];

  return v8;
}

- (double)continuousCornerRadiusForGridSizeClass:(id)a3
{
  [(SBIconListView *)self iconImageInfoForGridSizeClass:a3];
  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBIconListView *)self descriptionWithMultilinePrefix:0];
}

- (unint64_t)rowForIcon:(id)a3
{
  [(SBIconListView *)self coordinateForIcon:a3];
  return v3 - 1;
}

- (id)visibleIconIndexes
{
  uint64_t v3 = [(SBIconListView *)self visibleGridCellIndexes];
  double v4 = [(SBIconListView *)self gridCellInfo];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__SBIconListView_visibleIconIndexes__block_invoke;
  v11[3] = &unk_1E6AB0BF8;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [v3 enumerateIndexesUsingBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

uint64_t __36__SBIconListView_visibleIconIndexes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) iconIndexForGridCellIndex:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    id v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v4];
  }
  return result;
}

- (NSArray)visibleIcons
{
  uint64_t v3 = [(SBIconListView *)self visibleIconIndexes];
  uint64_t v4 = [(SBIconListView *)self displayedModel];
  id v5 = [v4 iconsAtIndexes:v3];

  return (NSArray *)v5;
}

- (void)regenerateTemporaryDisplayedModelIfNecessary
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  uint64_t v98 = [(SBIconListView *)self model];
  NSUInteger v2 = self;
  if ([(NSHashTable *)self->_layoutHidingAssertions count])
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    obuint64_t j = self->_layoutHidingAssertions;
    uint64_t v94 = [(NSHashTable *)obj countByEnumeratingWithState:&v143 objects:v153 count:16];
    if (v94)
    {
      char v3 = 0;
      char v4 = 0;
      uint64_t v92 = *(void *)v144;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v144 != v92)
          {
            uint64_t v6 = v5;
            objc_enumerationMutation(obj);
            uint64_t v5 = v6;
          }
          uint64_t v96 = v5;
          id v7 = *(void **)(*((void *)&v143 + 1) + 8 * v5);
          uint64_t v8 = [v7 icons];
          char v9 = [v7 options];
          long long v141 = 0u;
          long long v142 = 0u;
          long long v139 = 0u;
          long long v140 = 0u;
          id v10 = v8;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v139 objects:v152 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v140;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v140 != v12) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v14 = *(void *)(*((void *)&v139 + 1) + 8 * i);
                if ([v98 directlyContainsIcon:v14])
                {
                  char v4 = 1;
                }
                else if ((v3 & 1) == 0 && (v9 & 8) != 0)
                {
                  uint64_t v122 = 0;
                  char v123 = &v122;
                  uint64_t v124 = 0x2020000000;
                  LOBYTE(v125) = 0;
                  v138[0] = MEMORY[0x1E4F143A8];
                  v138[1] = 3221225472;
                  v138[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke;
                  v138[3] = &unk_1E6AB0C20;
                  v138[4] = v14;
                  v138[5] = &v122;
                  [v98 enumerateFolderIconsUsingBlock:v138];
                  char v3 = *((unsigned char *)v123 + 24);
                  _Block_object_dispose(&v122, 8);
                }
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v139 objects:v152 count:16];
            }
            while (v11);
          }

          uint64_t v5 = v96 + 1;
        }
        while (v96 + 1 != v94);
        uint64_t v94 = [(NSHashTable *)obj countByEnumeratingWithState:&v143 objects:v153 count:16];
      }
      while (v94);
    }
    else
    {
      char v3 = 0;
      char v4 = 0;
    }

    int v82 = v3 & 1;
    int v15 = v4 & 1;
    NSUInteger v2 = self;
  }
  else
  {
    int v82 = 0;
    int v15 = 0;
  }
  double v80 = [(SBIconListView *)v2 temporaryModel];
  v79 = [(SBIconListView *)self temporaryFolder];
  int v16 = v15 | v82;
  if ([(NSHashTable *)self->_placeholderAssertions count]) {
    int v17 = 1;
  }
  else {
    int v17 = v16;
  }
  if (!v80 && !v17)
  {
    id v18 = 0;
    double v19 = 0;
    uint64_t v95 = 0;
    goto LABEL_127;
  }
  if (!v17)
  {
    int v21 = 0;
    id v18 = 0;
    double v22 = 0;
    uint64_t v95 = 0;
    goto LABEL_116;
  }
  int v75 = v17;
  id v77 = [v98 folder];
  uint64_t v78 = [v98 uniqueIdentifier];
  if (v77 && ([v77 isExtraList:v98] & 1) == 0)
  {
    uint64_t v95 = (void *)[v77 copyWithOptions:12];
    v97 = [v95 listWithIdentifier:v78];
  }
  else
  {
    v97 = (void *)[v98 copy];
    double v20 = [v77 effectiveBadgeBehaviorProvider];
    [v97 setBadgeBehaviorProvider:v20];

    uint64_t v95 = 0;
  }
  unint64_t v93 = [(SBIconListView *)self gridCellInfoOptions];
  double v76 = [(NSHashTable *)self->_placeholderAssertions allObjects];
  double v23 = [v76 sortedArrayUsingComparator:&__block_literal_global_44];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  id obja = v23;
  uint64_t v24 = [obja countByEnumeratingWithState:&v134 objects:v151 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v135;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v135 != v25) {
          objc_enumerationMutation(obja);
        }
        uint64_t v27 = *(void **)(*((void *)&v134 + 1) + 8 * j);
        uint64_t v28 = [v27 representedIcon];
        if ([v28 isFolderIcon])
        {
          uint64_t v29 = [v28 nodeIdentifier];
          uint64_t v30 = [v97 directlyContainedIconWithIdentifier:v29];

          uint64_t v28 = (void *)v30;
        }
        if (v28)
        {
          double v31 = [v27 placeholderIcon];
          if ([v97 directlyContainsIcon:v28])
          {
            if (v95) {
              objc_msgSend(v95, "replaceIcon:withIcon:options:", v28, v31, objc_msgSend(v27, "folderMutationOptions"));
            }
            else {
              id v32 = (id)objc_msgSend(v97, "replaceIcon:withIcon:options:", v28, v31, objc_msgSend(v27, "listMutationOptions"));
            }
            [v18 addObject:v28];
          }
        }
      }
      uint64_t v24 = [obja countByEnumeratingWithState:&v134 objects:v151 count:16];
    }
    while (v24);
  }

  if (v16)
  {
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v85 = self->_layoutHidingAssertions;
    uint64_t v33 = [(NSHashTable *)v85 countByEnumeratingWithState:&v130 objects:v150 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v131;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v131 != v34) {
            objc_enumerationMutation(v85);
          }
          double v36 = *(void **)(*((void *)&v130 + 1) + 8 * k);
          uint64_t v37 = [v36 icons];
          v128[0] = MEMORY[0x1E4F143A8];
          v128[1] = 3221225472;
          v128[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3;
          v128[3] = &unk_1E6AB0C68;
          id v38 = v97;
          id v129 = v38;
          long long v39 = objc_msgSend(v37, "bs_compactMap:", v128);
          if (v95) {
            objc_msgSend(v95, "removeIcons:options:listGridCellInfoOptions:", v39, -[SBIconListView folderMutationOptionsForIconLayoutHidingAssertion:](self, "folderMutationOptionsForIconLayoutHidingAssertion:", v36), v93);
          }
          else {
            objc_msgSend(v38, "removeIcons:gridCellInfoOptions:mutationOptions:", v39, v93, -[SBIconListView listMutationOptionsForIconLayoutHidingAssertion:](self, "listMutationOptionsForIconLayoutHidingAssertion:", v36));
          }
          [v18 addObjectsFromArray:v37];
        }
        uint64_t v33 = [(NSHashTable *)v85 countByEnumeratingWithState:&v130 objects:v150 count:16];
      }
      while (v33);
    }

    if (v82)
    {
      uint64_t v122 = 0;
      char v123 = &v122;
      uint64_t v124 = 0x3032000000;
      v125 = __Block_byref_object_copy__10;
      unint64_t v126 = __Block_byref_object_dispose__10;
      id v127 = 0;
      v121[0] = MEMORY[0x1E4F143A8];
      v121[1] = 3221225472;
      v121[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_28;
      v121[3] = &unk_1E6AB0C90;
      v121[4] = &v122;
      [v97 enumerateFolderIconsUsingBlock:v121];
      if (v123[5])
      {
        long long v119 = 0u;
        long long v120 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v83 = (id)v123[5];
        uint64_t v40 = [v83 countByEnumeratingWithState:&v117 objects:v149 count:16];
        if (v40)
        {
          id v86 = *(id *)v118;
          do
          {
            for (uint64_t m = 0; m != v40; ++m)
            {
              if (*(id *)v118 != v86) {
                objc_enumerationMutation(v83);
              }
              objc_super v42 = *(void **)(*((void *)&v117 + 1) + 8 * m);
              uint64_t v43 = [v42 folder];
              if ([v43 isEmpty])
              {
                [v97 removeIcon:v42];
              }
              else
              {
                uint64_t v44 = [v43 firstIcon];
                uint64_t v45 = [(SBIconListView *)self displayedIconViewForIcon:v42];
                if (v45) {
                  uint64_t v46 = v42;
                }
                else {
                  uint64_t v46 = 0;
                }
                id v47 = v46;

                uint64_t v48 = v42;
                if (!v47)
                {
                  uint64_t v49 = [v42 uniqueIdentifier];
                  uint64_t v48 = [v98 directlyContainedIconWithIdentifier:v49];

                  if (!v48
                    || ([(SBIconListView *)self displayedIconViewForIcon:v48],
                        uint64_t v50 = objc_claimAutoreleasedReturnValue(),
                        BOOL v51 = v50 == 0,
                        v50,
                        v51))
                  {

                    uint64_t v48 = 0;
                  }
                }
                id v52 = (id)[v97 replaceIcon:v42 withIcon:v44 options:0];
                [(SBIconListView *)self markIcon:v48 asNeedingAnimation:2];
                [(SBIconListView *)self setExtraIconForFolderCollapseSpecialIconAnimation:v44];
              }
            }
            uint64_t v40 = [v83 countByEnumeratingWithState:&v117 objects:v149 count:16];
          }
          while (v40);
        }
      }
      _Block_object_dispose(&v122, 8);
    }
  }
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  id v81 = obja;
  id v87 = (id)[v81 countByEnumeratingWithState:&v113 objects:v148 count:16];
  if (!v87)
  {
LABEL_113:
    int v21 = 0;
    goto LABEL_115;
  }
  id v84 = *(id *)v114;
LABEL_87:
  uint64_t v53 = 0;
  while (2)
  {
    if (*(id *)v114 != v84) {
      objc_enumerationMutation(v81);
    }
    BOOL v54 = *(void **)(*((void *)&v113 + 1) + 8 * v53);
    id objb = [v54 placeholderIcon];
    long long v55 = [v54 positioningRelativeIcon];
    uint64_t v56 = [v54 gridCellIndex];
    uint64_t v57 = [v54 listMutationOptions];
    uint64_t v58 = [v54 positioningType];
    char v59 = [v54 options];
    [(SBIconListView *)self updateIconLocationWithNonDefaultSizedIcons];
    switch(v58)
    {
      case 0:
        if (v95)
        {
          id v60 = [v97 icons];
          id v61 = (void *)[v60 mutableCopy];

          uint64_t v62 = [v54 folderMutationOptions];
          double v63 = [[SBHIconGridPath alloc] initWithFolderIdentifier:0 listIdentifier:v78 gridCellIndex:v56 gridCellInfoOptions:v93];
          id v64 = (id)[v95 insertIcon:objb atGridPath:v63 options:v62];
          double v65 = [v97 icons];
          [v61 removeObjectsInArray:v65];
        }
        else
        {
          id v61 = [v97 insertIcon:objb atGridCellIndex:v56 gridCellInfoOptions:v93 mutationOptions:v57];
        }
        goto LABEL_99;
      case 1:
        [v97 swapContainedIcon:objb withContainedIcon:v55 gridCellInfoOptions:v93 mutationOptions:v57];
        goto LABEL_98;
      case 2:
        [v97 moveContainedIcon:objb afterIcon:v55 gridCellInfoOptions:v93 mutationOptions:v57];
        goto LABEL_98;
      case 3:
        [v97 moveContainedIcon:objb beforeIcon:v55 gridCellInfoOptions:v93 mutationOptions:v57];
        goto LABEL_98;
      case 4:
        [v97 moveContainedIcon:objb aboveIcon:v55 gridCellInfoOptions:v93 mutationOptions:v57];
        goto LABEL_98;
      case 5:
        [v97 moveContainedIcon:objb belowIcon:v55 gridCellInfoOptions:v93 mutationOptions:v57];
        goto LABEL_98;
      default:
LABEL_98:
        id v61 = 0;
LABEL_99:
        if (![v61 count]) {
          goto LABEL_109;
        }
        if ((v59 & 8) == 0)
        {
          long long v111 = 0u;
          long long v112 = 0u;
          long long v109 = 0u;
          long long v110 = 0u;
          id v66 = v61;
          uint64_t v67 = [v66 countByEnumeratingWithState:&v109 objects:v147 count:16];
          if (v67)
          {
            uint64_t v68 = *(void *)v110;
            do
            {
              for (uint64_t n = 0; n != v67; ++n)
              {
                if (*(void *)v110 != v68) {
                  objc_enumerationMutation(v66);
                }
                [v18 addObject:*(void *)(*((void *)&v109 + 1) + 8 * n)];
              }
              uint64_t v67 = [v66 countByEnumeratingWithState:&v109 objects:v147 count:16];
            }
            while (v67);
          }

LABEL_109:
          if ((id)++v53 != v87) {
            continue;
          }
          uint64_t v70 = [v81 countByEnumeratingWithState:&v113 objects:v148 count:16];
          id v87 = (id)v70;
          if (!v70) {
            goto LABEL_113;
          }
          goto LABEL_87;
        }

        int v21 = 1;
LABEL_115:

        double v22 = v97;
        int v17 = v75;
LABEL_116:
        if (v80 && (v21 & 1) == 0)
        {
          int v71 = v17;
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_2_30;
          v104[3] = &unk_1E6AB0CB8;
          id v105 = v98;
          id v106 = v79;
          v107 = self;
          char v108 = v71;
          [v80 enumerateFolderIconsUsingBlock:v104];

          int v17 = v71;
        }
        int v72 = v17 ^ 1;
        if (!v22) {
          int v72 = 1;
        }
        if ((v21 | v72))
        {
          double v19 = v22;
          if ((v17 & 1) == 0)
          {
            [(SBIconListView *)self setTemporaryModel:0];
            [(SBIconListView *)self setTemporaryFolder:0];
            v99[0] = MEMORY[0x1E4F143A8];
            v99[1] = 3221225472;
            v99[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_5;
            v99[3] = &unk_1E6AB0CE0;
            v99[4] = self;
            [v98 enumerateFolderIconsUsingBlock:v99];
            [(SBIconListView *)self updateIconLocationWithNonDefaultSizedIcons];
            [(SBIconListView *)self setIconsNeedLayout];
          }
        }
        else
        {
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3_31;
          v101[3] = &unk_1E6AADBC8;
          id v73 = v98;
          id v102 = v73;
          CGRect v103 = self;
          double v19 = v22;
          [v22 enumerateFolderIconsUsingBlock:v101];
          [(SBIconListView *)self setTemporaryFolder:v95];
          [(SBIconListView *)self setTemporaryModel:v22];
          -[SBIconListView updateIconLocationWithNonDefaultSizedIcons:](self, "updateIconLocationWithNonDefaultSizedIcons:", [v22 directlyContainsNonDefaultSizeClassIcon]);
          if (v18)
          {
            id v74 = [(SBIconListView *)self removedIcons];
            [v74 addObjectsFromArray:v18];
          }
          v100[0] = MEMORY[0x1E4F143A8];
          v100[1] = 3221225472;
          v100[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_4;
          v100[3] = &unk_1E6AB0CE0;
          v100[4] = self;
          [v73 enumerateFolderIconsUsingBlock:v100];
          [(SBIconListView *)self setIconsNeedLayout];
          [(SBIconListView *)self invalidateIntrinsicContentSize];
        }
LABEL_127:

        return;
    }
  }
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 folder];
  if ([v6 containsIcon:*(void *)(a1 + 32)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

BOOL __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 gridCellIndex];
  unint64_t v6 = [v4 gridCellIndex];

  return v5 < v6;
}

id __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isFolderIcon])
  {
    id v4 = *(void **)(a1 + 32);
    unint64_t v5 = [v3 nodeIdentifier];
    id v6 = [v4 directlyContainedIconWithIdentifier:v5];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_28(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 folder];
  char v4 = [v3 isEmpty];
  int v5 = [v3 containsOneIcon];
  if ((v4 & 1) != 0 || ([v3 isCancelable] & v5) == 1)
  {
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      char v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      id v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v6 addObject:v10];
  }
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_2_30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = [v3 uniqueIdentifier];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "directlyContainedIconWithIdentifier:");
  if (v4)
  {
    int v5 = (void *)v4;
  }
  else
  {
    int v5 = [*(id *)(a1 + 40) iconWithIdentifier:v9];
    if (v5)
    {
      id v7 = [*(id *)(a1 + 48) removedIcons];
      [v7 addObject:v5];

      char v6 = 1;
      goto LABEL_6;
    }
  }
  char v6 = 0;
LABEL_6:
  uint64_t v8 = [*(id *)(*(void *)(a1 + 48) + 424) objectForKey:v3];
  [*(id *)(*(void *)(a1 + 48) + 424) removeObjectForKey:v3];

  [*(id *)(*(void *)(a1 + 48) + 424) setObject:v8 forKey:v5];
  [v8 setOverrideBadgeNumberOrString:0];
  if ((v6 & 1) == 0 && !*(unsigned char *)(a1 + 56) && v5) {
    [v8 setIcon:v5];
  }
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3_31(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) directlyContainedIconWithIdentifier:v3];
  if (v4)
  {
    int v5 = [*(id *)(*(void *)(a1 + 40) + 424) objectForKey:v4];
    if (v5)
    {
      [*(id *)(*(void *)(a1 + 40) + 424) setObject:v5 forKey:v8];
      [*(id *)(*(void *)(a1 + 40) + 424) removeObjectForKey:v4];
      char v6 = [v8 badgeNumberOrString];
      if (v6)
      {
        [v5 setOverrideBadgeNumberOrString:v6];
      }
      else
      {
        id v7 = [MEMORY[0x1E4F1CA98] null];
        [v5 setOverrideBadgeNumberOrString:v7];
      }
    }
  }
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 folder];
  [v3 addFolderObserver:*(void *)(a1 + 32)];
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 folder];
  [v3 removeFolderObserver:*(void *)(a1 + 32)];
}

- (unint64_t)folderMutationOptionsForIconLayoutHidingAssertion:(id)a3
{
  unint64_t v4 = [a3 folderMutationOptions];
  if ([(SBIconListView *)self allowsGaps]) {
    return v4 | 0x400000;
  }
  else {
    return v4;
  }
}

- (unint64_t)listMutationOptionsForIconLayoutHidingAssertion:(id)a3
{
  uint64_t v4 = [a3 listMutationOptions];
  BOOL v5 = [(SBIconListView *)self allowsGaps];
  uint64_t v6 = v4 | 0x100000;
  if (!v5) {
    uint64_t v6 = v4;
  }
  return v6 | 0x8000;
}

- (BOOL)isEmpty
{
  NSUInteger v2 = [(SBIconListView *)self displayedModel];
  char v3 = [v2 isEmpty];

  return v3;
}

- (BOOL)isFull
{
  NSUInteger v2 = [(SBIconListView *)self displayedModel];
  char v3 = [v2 isFull];

  return v3;
}

- (BOOL)allowsAddingIconCount:(unint64_t)a3
{
  return 1;
}

- (void)markIcon:(id)a3 asNeedingAnimation:(int64_t)a4
{
  id v10 = a3;
  specialIconAnimations = self->_specialIconAnimations;
  if (!specialIconAnimations)
  {
    id v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v8 = self->_specialIconAnimations;
    self->_specialIconAnimations = v7;

    specialIconAnimations = self->_specialIconAnimations;
  }
  id v9 = [NSNumber numberWithInteger:a4];
  [(NSMapTable *)specialIconAnimations setObject:v9 forKey:v10];

  [(SBIconListView *)self setIconsNeedLayout];
}

- (id)pauseLayoutForIconView:(id)a3 forReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_pausedLayoutAssertionsForIconViews)
  {
    id v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    pausedLayoutAssertionsForIconViews = self->_pausedLayoutAssertionsForIconViews;
    self->_pausedLayoutAssertionsForIconViews = v8;
  }
  id v10 = [[SBIconListViewPauseLayoutAssertion alloc] initWithListView:self iconView:v6 reason:v7];
  uint64_t v11 = [(NSMapTable *)self->_pausedLayoutAssertionsForIconViews objectForKey:v6];
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(NSMapTable *)self->_pausedLayoutAssertionsForIconViews setObject:v11 forKey:v6];
  }
  [v11 addObject:v10];

  return v10;
}

- (void)removePauseLayoutAssertion:(id)a3
{
  id v4 = a3;
  id v7 = [v4 iconView];
  BOOL v5 = -[NSMapTable objectForKey:](self->_pausedLayoutAssertionsForIconViews, "objectForKey:");
  uint64_t v6 = [v5 count];
  [v5 removeObject:v4];

  if (![v5 count])
  {
    [(NSMapTable *)self->_pausedLayoutAssertionsForIconViews removeObjectForKey:v7];
    if (v6) {
      [(SBIconListView *)self setIconsNeedLayout];
    }
  }
}

- (void)setPausesIconsForScrolling:(BOOL)a3
{
  if (self->_pausesIconsForScrolling != a3)
  {
    self->_pausesIconsForScrolling = a3;
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

- (void)performSpecialIconAnimationsWithCompletionHandler:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  BOOL v5 = self->_specialIconAnimations;
  specialIconAnimations = self->_specialIconAnimations;
  self->_specialIconAnimations = 0;

  uint64_t v7 = [(NSMapTable *)v5 count];
  if (v7)
  {
    uint64_t v8 = v7;
    self->_BOOL performingSpecialIconAnimations = 1;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E6AAC8E8;
    void aBlock[4] = self;
    uint64_t v29 = v4;
    double v19 = v4;
    blocuint64_t k = _Block_copy(aBlock);
    if (v8 == 1) {
      id v9 = 0;
    }
    else {
      id v9 = dispatch_group_create();
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v5;
    id v10 = v5;
    uint64_t v11 = [(NSMapTable *)v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          int v16 = [(NSMapTable *)v10 objectForKey:v15];
          uint64_t v17 = [v16 integerValue];

          if (v9) {
            dispatch_group_enter(v9);
          }
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke_2;
          v21[3] = &unk_1E6AAC8E8;
          double v22 = v9;
          id v23 = block;
          [(SBIconListView *)self performSpecialIconAnimation:v17 icon:v15 completionHandler:v21];
        }
        uint64_t v12 = [(NSMapTable *)v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v12);
    }

    if (v9) {
      dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);
    }

    BOOL v5 = v18;
    id v4 = v19;
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 421) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSUInteger v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_group_leave(v2);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)performSpecialIconAnimation:(int64_t)a3 icon:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v8 = a5;
  switch(a3)
  {
    case 2:
      [(SBIconListView *)self performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:v9 completionHandler:v8];
      break;
    case 1:
      [(SBIconListView *)self performZoomInSpecialIconAnimationWithIcon:v9 completionHandler:v8];
      break;
    case 0:
      [(SBIconListView *)self performZoomOutSpecialIconAnimationWithIcon:v9 completionHandler:v8];
      break;
  }
}

- (void)performZoomInSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBIconListView *)self iconViewForIcon:a3];
  CGAffineTransformMakeScale(&v15, 0.001, 0.001);
  [v7 setTransform:&v15];
  [v7 setAlpha:0.0];
  id v8 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke;
  v13[3] = &unk_1E6AAC810;
  id v14 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6AADF78;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 animateWithDuration:v13 animations:v11 completion:0.2];
}

uint64_t __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke(uint64_t a1)
{
  NSUInteger v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performZoomOutSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBIconListView *)self displayedIconViewForIcon:a3];
  id v8 = (void *)MEMORY[0x1E4FB1EB0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke;
  v13[3] = &unk_1E6AAC810;
  id v14 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6AADF78;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 animateWithDuration:v13 animations:v11 completion:0.2];
}

uint64_t __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke(uint64_t a1)
{
  NSUInteger v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.001, 0.001);
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v53 = a4;
  uint64_t v7 = [(SBIconListView *)self iconViewForIcon:v6];
  id v8 = [v7 matchingIconViewWithConfigurationOptions:6];
  [v7 frameForMiniIconAtIndex:0];
  double v47 = v10;
  double v48 = v9;
  double v12 = v11;
  double v14 = v13;
  CGAffineTransform v15 = [(SBIconListView *)self extraIconForFolderCollapseSpecialIconAnimation];
  if (!v15)
  {
    int v16 = SBLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SBIconListView performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:completionHandler:]();
    }
  }
  uint64_t v17 = [(SBIconListView *)self iconViewForIcon:v15];
  uint64_t v18 = [(SBIconListView *)self effectiveIconImageAppearance];
  double v19 = [(SBIconListView *)self layout];
  [v19 iconImageInfo];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  id v52 = v19;
  double v28 = SBHIconListLayoutFolderIconGridCellSize(v19);
  double v30 = v29;
  id v31 = objc_alloc(MEMORY[0x1E4FB1838]);
  id v32 = [v17 iconImageSnapshot];
  uint64_t v33 = (void *)[v31 initWithImage:v32];

  uint64_t v50 = (void *)v18;
  BOOL v51 = v7;
  if (v15)
  {
    uint64_t v34 = [v7 folderIconImageCache];
    uint64_t v35 = objc_msgSend(v34, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:", v15, v18, v28, v30, v21, v23, v25, v27);
  }
  else
  {
    uint64_t v35 = 0;
  }
  double v36 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v35];
  uint64_t v37 = [v8 folderIconBackgroundView];
  [v17 setIconImageAndAccessoryAlpha:0.0];
  [v17 setIconLabelAlpha:0.0];
  [v17 setRefusesRecipientStatus:1];
  [v33 layer];
  id v38 = v49 = v8;
  [v38 setAllowsEdgeAntialiasing:1];

  long long v39 = [v36 layer];
  [v39 setAllowsEdgeAntialiasing:1];

  [v17 iconImageCenter];
  objc_msgSend(v37, "setCenter:");
  objc_msgSend(v33, "setFrame:", v48, v47, v12, v14);
  objc_msgSend(v36, "setFrame:", v48, v47, v12, v14);
  [v17 addSubview:v37];
  [v17 addSubview:v33];
  [v17 addSubview:v36];
  uint64_t v40 = (void *)MEMORY[0x1E4FB1EB0];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke;
  v60[3] = &unk_1E6AADD48;
  id v61 = v17;
  id v62 = v33;
  id v63 = v36;
  id v64 = v37;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_4;
  v54[3] = &unk_1E6AB0D08;
  v54[4] = self;
  id v55 = v15;
  id v56 = v64;
  id v57 = v62;
  id v58 = v63;
  id v59 = v53;
  id v41 = v17;
  id v42 = v15;
  id v43 = v64;
  id v44 = v62;
  id v45 = v63;
  id v46 = v53;
  [v40 animateKeyframesWithDuration:0 delay:v60 options:v54 animations:0.5 completion:0.0];
  [(SBIconListView *)self setExtraIconForFolderCollapseSpecialIconAnimation:0];
}

void __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke(id *a1)
{
  NSUInteger v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_2;
  v6[3] = &unk_1E6AADD48;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  [v2 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:1.0];
  long long v3 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_3;
  v4[3] = &unk_1E6AAC810;
  id v5 = a1[4];
  [v3 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.7 animations:0.3];
}

uint64_t __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_2(id *a1)
{
  [a1[4] iconImageFrame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(a1[5], "setFrame:");
  objc_msgSend(a1[6], "setFrame:", v3, v5, v7, v9);
  [a1[6] setAlpha:0.0];
  [a1[7] setAlpha:0.0];
  id v10 = a1[7];
  CGAffineTransformMakeScale(&v12, 0.01, 0.01);
  return [v10 setTransform:&v12];
}

uint64_t __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconLabelAlpha:1.0];
}

void __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];
  [v2 setIconImageAlpha:1.0];
  [v2 setIconAccessoryAlpha:0.0];
  [v2 setRefusesRecipientStatus:0];
  double v3 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_5;
  _OWORD v5[3] = &unk_1E6AAC810;
  id v6 = v2;
  id v4 = v2;
  [v3 animateWithDuration:v5 animations:0.15];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) removeFromSuperview];
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

uint64_t __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconAccessoryAlpha:1.0];
}

- (void)layoutAndCreateIcon:(id)a3
{
  id v6 = a3;
  id v4 = [(SBIconListView *)self displayedModel];
  uint64_t v5 = [v4 indexForIcon:v6];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [(SBIconListView *)self layoutAndCreateIcon:v6 atIndex:v5];
  }
}

- (void)layoutAndCreateIcon:(id)a3 atIndex:(unint64_t)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(SBIconListView *)self iconViewForIcon:v6];
  [v7 setAlpha:1.0];
  [(SBIconListView *)self setIconsNeedLayout];
  if (v7)
  {
    [(SBIconListView *)self centerForIconAtIndex:a4];
    [(SBIconListView *)self layoutScale];
    UIPointRoundToScale();
    double v9 = v8;
    double v11 = v10;
    long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v17[0] = *MEMORY[0x1E4F1DAB8];
    v17[1] = v12;
    v17[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [v7 setTransform:v17];
    objc_msgSend(v7, "setCenter:", v9, v11);
    double v13 = [v7 superview];
    if (v13 == self)
    {
    }
    else
    {
      double v14 = v13;
      BOOL v15 = [(SBIconListView *)self shouldReparentView:v7];

      if (v15)
      {
        [(SBIconListView *)self _insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:v7];
        [(SBIconListView *)self addSubview:v7];
      }
    }
    v18[0] = v6;
    int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(SBIconListView *)self _updateEditingStateForIcons:v16 animated:0];
  }
}

- (id)removedIcons
{
  removedIcons = self->_removedIcons;
  if (!removedIcons)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v5 = self->_removedIcons;
    self->_removedIcons = v4;

    removedIcons = self->_removedIcons;
  }
  return removedIcons;
}

- (void)setAlphaForAllIcons:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SBIconListView *)self displayedModel];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = objc_msgSend(v5, "icons", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        double v11 = [(SBIconListView *)self displayedIconViewForIcon:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        [v11 setAlpha:a3];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)removeAllIconAnimations
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = [(SBIconListView *)self displayedModel];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "icons", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        uint64_t v9 = [(SBIconListView *)self displayedIconViewForIcon:*(void *)(*((void *)&v10 + 1) + 8 * v8)];
        [v9 removeAllIconAnimations];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (CGSize)alignmentIconViewSize
{
  double v3 = [(SBIconListView *)self baseIconViewClass];
  [(SBIconListView *)self iconImageSize];
  double v5 = v4;
  double v7 = v6;
  unint64_t v8 = [(SBIconListView *)self iconViewConfigurationOptions];
  -[objc_class defaultIconViewSizeForIconImageSize:configurationOptions:](v3, "defaultIconViewSizeForIconImageSize:configurationOptions:", v8, v5, v7);
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGPoint)originForIconAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBIconListView *)self iconCoordinateForIndex:a3 forOrientation:[(SBIconListView *)self layoutOrientation]];
  -[SBIconListView originForIconAtCoordinate:](self, "originForIconAtCoordinate:", v5, v4);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)originForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIconListView *)self displayedModel];
  uint64_t v6 = [v5 indexForIcon:v4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SBIconListView originForIcon:]();
    }

    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(SBIconListView *)self originForIconAtIndex:v6];
    double v8 = v10;
    double v9 = v11;
  }

  double v12 = v8;
  double v13 = v9;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (CGPoint)centerForIcon:(id)a3
{
  uint64_t v5 = [(SBIconListView *)self coordinateForIcon:a3];
  -[SBIconListView centerForIconCoordinate:](self, "centerForIconCoordinate:", v5, v4);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)centerForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  double v6 = [(SBIconListView *)self layoutMetrics];
  -[SBIconListView centerForIconCoordinate:metrics:](self, "centerForIconCoordinate:metrics:", column, row, v6);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (CGRect)rectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  -[SBIconListView rectForCellAtIconCoordinate:metrics:options:](self, "rectForCellAtIconCoordinate:metrics:options:", a3.column, a3.row, a4, 0);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)rectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v9 = a4;
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    unint64_t v18 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9);
    uint64_t v19 = [(SBIconListView *)self iconGridRangeForGridCellIndex:v18 metrics:v9 options:a5];
    double v20 = [(SBIconListView *)self iconAtGridCellIndex:v18 metrics:v9];
    id v55 = v20;
    if (v20)
    {
      double v21 = [v20 gridSizeClass];
    }
    else
    {
      double v21 = @"SBHIconGridSizeClassDefault";
    }
    double v22 = v21;
    SBHIconGridSize v23 = (SBHIconGridSize)[(SBIconListView *)self iconGridSizeForClass:v21];
    uint64_t v24 = column;
    int64_t v25 = row;
    if (v19 != v18)
    {
      uint64_t v24 = [(SBIconListView *)self iconCoordinateForGridCellIndex:v19 metrics:v9];
      int64_t v25 = v26;
    }
    -[SBIconListView rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:](self, "rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:", *(unsigned int *)&v23, v24, v25, v9);
    UIRectGetCenter();
    double v28 = v27;
    double v30 = v29;
    [(SBIconListView *)self iconImageSizeForGridSizeClass:v22];
    double v32 = v31;
    double v34 = v33;
    [v9 iconContentScale];
    double v36 = v35;
    int IsOne = BSFloatIsOne();
    double v38 = 1.0;
    if (!IsOne) {
      double v38 = v36;
    }
    -[SBIconListView _enforceLayoutInsetsOnRectForCellAtIconCoordinate:gridSizeClass:proposedFrame:metrics:](self, "_enforceLayoutInsetsOnRectForCellAtIconCoordinate:gridSizeClass:proposedFrame:metrics:", v24, v25, v22, v9, v28 - v32 * v38 * 0.5, v30 - v34 * v38 * 0.5);
    double v12 = v39;
    double v13 = v40;
    -[SBIconListView _alignedIconPointForPoint:](self, "_alignedIconPointForPoint:");
    double v10 = v41;
    double v11 = v42;
    id v43 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_centerForIconCoordinate_metrics_proposedCenter_];
    if (v43)
    {
      UIRectGetCenter();
      double v45 = v44;
      double v47 = v46;
      [v43 iconListView:self centerForIconCoordinate:column metrics:row proposedCenter:v9];
      if (v49 != v45 || v48 != v47)
      {
        UIRectCenteredAboutPoint();
        double v10 = v51;
        double v11 = v52;
        double v12 = v53;
        double v13 = v54;
      }
    }
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)_enforceLayoutInsetsOnRectForCellAtIconCoordinate:(SBIconCoordinate)a3 gridSizeClass:(id)a4 proposedFrame:(CGRect)a5 metrics:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  double x = a5.origin.x;
  int64_t column = a3.column;
  double v13 = (__CFString *)a4;
  id v14 = a6;
  if ([(SBIconListView *)self _shouldEnforceLayoutInsetsForAxis:1])
  {
    if (@"SBHIconGridSizeClassDefault" == v13
      || [@"SBHIconGridSizeClassDefault" isEqualToString:v13])
    {
      [(SBIconListView *)self iconLayoutRect];
      uint64_t v16 = v15;
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      char v23 = 1;
    }
    else
    {
      [(SBIconListView *)self _widgetIconLayoutRect];
      uint64_t v16 = v24;
      uint64_t v18 = v25;
      uint64_t v20 = v26;
      uint64_t v22 = v27;
      char v23 = 0;
    }
    unsigned __int16 v28 = (unsigned __int16)[(SBIconListView *)self iconGridSizeForClass:v13];
    uint64_t v29 = [v14 columns];
    if ((v23 & 1) == 0 && (column == 1 || column + v28 - 1 == v29))
    {
      BOOL v30 = [(SBIconListView *)self isRTL];
      uint64_t v31 = v16;
      uint64_t v32 = v18;
      uint64_t v33 = v20;
      uint64_t v34 = v22;
      if ((column == 1) == v30)
      {
        double MaxX = CGRectGetMaxX(*(CGRect *)&v31);
        v40.origin.double x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        double x = MaxX - CGRectGetWidth(v40);
      }
      else
      {
        double x = CGRectGetMinX(*(CGRect *)&v31);
      }
    }
  }

  double v36 = x;
  double v37 = y;
  double v38 = width;
  double v39 = height;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v37;
  result.origin.double x = v36;
  return result;
}

- (CGRect)fullRectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v9 = a4;
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    uint64_t v18 = -[SBIconListView iconGridRangeForGridCellIndex:metrics:options:](self, "iconGridRangeForGridCellIndex:metrics:options:", -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9), v9, a5);
    -[SBIconListView fullRectForGridRange:metrics:](self, "fullRectForGridRange:metrics:", v18, v19, v9);
    double v10 = v20;
    double v11 = v21;
    double v12 = v22;
    double v13 = v23;
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)fullRectForGridRange:(SBHIconGridRange)a3 metrics:(id)a4
{
  int size = (int)a3.size;
  cellIndedouble x = a3.cellIndex;
  id v7 = a4;
  uint64_t v23 = 0;
  uint64_t v24 = (double *)&v23;
  uint64_t v25 = 0x4010000000;
  uint64_t v26 = &unk_1D821E08B;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v27 = *MEMORY[0x1E4F1DB20];
  long long v28 = v8;
  id v9 = [v7 gridCellInfo];
  unsigned __int16 v10 = [v9 gridSize];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__SBIconListView_fullRectForGridRange_metrics___block_invoke;
  v20[3] = &unk_1E6AB0D30;
  v20[4] = self;
  id v11 = v7;
  id v21 = v11;
  double v22 = &v23;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v10, v20);

  double v12 = v24[4];
  double v13 = v24[5];
  double v14 = v24[6];
  double v15 = v24[7];

  _Block_object_dispose(&v23, 8);
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

void __47__SBIconListView_fullRectForGridRange_metrics___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) iconCoordinateForGridCellIndex:a2 metrics:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "fullRectForDefaultSizedCellAtCoordinate:metrics:", v3, v4, *(void *)(a1 + 40));
  CGFloat v6 = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
  double v14 = *(CGRect **)(*(void *)(a1 + 48) + 8);
  if (IsNull)
  {
    v14[1].origin.double x = v6;
  }
  else
  {
    v16.origin.double x = v6;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGRect v15 = CGRectUnion(v14[1], v16);
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
    double v14 = *(CGRect **)(*(void *)(a1 + 48) + 8);
    v14[1].origin.double x = v15.origin.x;
  }
  v14[1].origin.CGFloat y = y;
  v14[1].size.CGFloat width = width;
  v14[1].size.CGFloat height = height;
}

- (CGPoint)centerForIconAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBIconListView *)self iconCoordinateForIndex:a3 forOrientation:[(SBIconListView *)self layoutOrientation]];
  -[SBIconListView centerForIconCoordinate:](self, "centerForIconCoordinate:", v5, v4);
  result.CGFloat y = v7;
  result.double x = v6;
  return result;
}

- (CGPoint)centerForIconAtIndex:(unint64_t)a3 metrics:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SBIconListView *)self iconCoordinateForIndex:a3 metrics:v6];
  -[SBIconListView centerForIconCoordinate:metrics:](self, "centerForIconCoordinate:metrics:", v7, v8, v6);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.CGFloat y = v14;
  result.double x = v13;
  return result;
}

- (CGRect)rectForIconAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBIconListView *)self layoutMetrics];
  uint64_t v6 = [(SBIconListView *)self iconCoordinateForIndex:a3 metrics:v5];
  -[SBIconListView rectForIconCoordinate:metrics:](self, "rectForIconCoordinate:metrics:", v6, v7, v5);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)rectForIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBIconListView *)self displayedModel];
  uint64_t v6 = [v5 indexForIcon:v4];

  [(SBIconListView *)self rectForIconAtIndex:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)rectForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  uint64_t v6 = [(SBIconListView *)self layoutMetrics];
  -[SBIconListView rectForIconCoordinate:metrics:](self, "rectForIconCoordinate:metrics:", column, row, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)rectForIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v7 = a4;
  unint64_t v8 = -[SBIconListView iconIndexForCoordinate:metrics:](self, "iconIndexForCoordinate:metrics:", column, row, v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    unint64_t v13 = v8;
    double v14 = [(SBIconListView *)self displayedModel];
    double v15 = [v14 iconAtIndex:v13];
    double v16 = [v15 gridSizeClass];
    -[SBIconListView originForIconAtCoordinate:metrics:](self, "originForIconAtCoordinate:metrics:", column, row, v7);
    double v9 = v17;
    double v10 = v18;
    [(SBIconListView *)self iconImageSizeForGridSizeClass:v16];
    double v11 = v19;
    double v12 = v20;
  }
  double v21 = v9;
  double v22 = v10;
  double v23 = v11;
  double v24 = v12;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.double x = v21;
  return result;
}

- (unint64_t)numberOfDisplayedIconViews
{
  return [(NSMapTable *)self->_iconViews count];
}

BOOL __34__SBIconListView_iconViewForIcon___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 icon];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)makeIconView
{
  unint64_t v3 = [(SBIconListView *)self iconViewConfigurationOptions];
  BOOL v4 = [(SBIconListView *)self layoutProvider];
  uint64_t v5 = objc_msgSend(objc_alloc(-[SBIconListView baseIconViewClass](self, "baseIconViewClass")), "initWithConfigurationOptions:listLayoutProvider:", v3, v4);

  return v5;
}

- (SBIconCoordinate)coordinateForIconAtIndex:(unint64_t)a3
{
  int64_t v5 = [(SBIconListView *)self layoutOrientation];
  int64_t v6 = [(SBIconListView *)self iconCoordinateForIndex:a3 forOrientation:v5];
  result.int64_t row = v7;
  result.int64_t column = v6;
  return result;
}

- (unint64_t)gridCellIndexForIcon:(id)a3
{
  uint64_t v4 = [(SBIconListView *)self coordinateForIcon:a3];
  uint64_t v6 = v5;
  unsigned __int16 v7 = (unsigned __int16)[(SBIconListView *)self gridSizeForCurrentOrientation];
  return SBIconCoordinateGetGridCellIndex(v4, v6, v7);
}

- (unint64_t)gridCellIndexForIconView:(id)a3
{
  uint64_t v4 = [a3 icon];
  unint64_t v5 = [(SBIconListView *)self gridCellIndexForIcon:v4];

  return v5;
}

- (SBHIconGridRange)gridRangeForIconAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBIconListView *)self layoutMetrics];
  uint64_t v6 = [(SBIconListView *)self iconGridRangeForIndex:a3 metrics:v5];
  uint64_t v8 = v7;

  unint64_t v9 = v6;
  uint64_t v10 = v8;
  result.int size = (SBHIconGridSize)v10;
  result.cellIndedouble x = v9;
  return result;
}

- (id)iconViewForCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  uint64_t v6 = [(SBIconListView *)self layoutMetrics];
  uint64_t v7 = -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v6);
  if (v7)
  {
    uint64_t v8 = [(SBIconListView *)self iconViewForIcon:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)iconViewForGridCellIndex:(unint64_t)a3
{
  unint64_t v5 = [(SBIconListView *)self layoutMetrics];
  uint64_t v6 = [(SBIconListView *)self iconAtGridCellIndex:a3 metrics:v5];
  if (v6)
  {
    uint64_t v7 = [(SBIconListView *)self iconViewForIcon:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)indexOfIcon:(id)a3
{
  uint64_t v4 = [(SBIconListView *)self temporarilyMappedIconForIcon:a3];
  unint64_t v5 = [(SBIconListView *)self displayedModel];
  unint64_t v6 = [v5 indexForIcon:v4];

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return [a3 isDescendantOfView:self];
}

- (BOOL)shouldReparentView:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 superview];
  if (v5
    && ([(SBIconListView *)self iconViewProvider],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isIconViewRecycled:v4],
        v6,
        (v7 & 1) == 0))
  {
    pronouncedContainerView = self->_pronouncedContainerView;
    if (pronouncedContainerView) {
      BOOL v11 = v5 == (SBIconListView *)pronouncedContainerView;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      BOOL v8 = 0;
    }
    else
    {
      int v12 = ![(SBIconListView *)self hasOverridingLayoutDelegates];
      if (v5 == self) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = v12;
      }
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

+ (id)defaultAnimator
{
  double v2 = (void *)defaultAnimator_animator;
  if (!defaultAnimator_animator)
  {
    unint64_t v3 = objc_alloc_init(SBIconListViewDefaultAnimator);
    id v4 = (void *)defaultAnimator_animator;
    defaultAnimator_animator = (uint64_t)v3;

    double v2 = (void *)defaultAnimator_animator;
  }
  return v2;
}

+ (id)dominoAnimator
{
  double v2 = (void *)dominoAnimator_animator;
  if (!dominoAnimator_animator)
  {
    unint64_t v3 = objc_alloc_init(SBIconListViewDominoAnimator);
    id v4 = (void *)dominoAnimator_animator;
    dominoAnimator_animator = (uint64_t)v3;

    double v2 = (void *)dominoAnimator_animator;
  }
  [v2 reset];
  unint64_t v5 = (void *)dominoAnimator_animator;
  return v5;
}

+ (id)clusterAnimator
{
  double v2 = (void *)clusterAnimator_animator;
  if (!clusterAnimator_animator)
  {
    unint64_t v3 = objc_alloc_init(SBIconListViewClusterAnimator);
    id v4 = (void *)clusterAnimator_animator;
    clusterAnimator_animator = (uint64_t)v3;

    double v2 = (void *)clusterAnimator_animator;
  }
  return v2;
}

+ (id)multiStageAnimator
{
  double v2 = (void *)multiStageAnimator_animator;
  if (!multiStageAnimator_animator)
  {
    unint64_t v3 = objc_alloc_init(SBIconListViewMultiStageAnimator);
    id v4 = (void *)multiStageAnimator_animator;
    multiStageAnimator_animator = (uint64_t)v3;

    double v2 = (void *)multiStageAnimator_animator;
  }
  return v2;
}

- (void)layoutIconsIfNeeded:(double)a3
{
  if (a3 > 0.0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = -1;
  }
  [(SBIconListView *)self layoutIconsIfNeededWithAnimationType:v3 options:0];
}

uint64_t __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIconsIfNeededUsingAnimator:*(void *)(a1 + 40) options:*(void *)(a1 + 48)];
}

void __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_76(uint64_t a1)
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
        objc_msgSend(*(id *)(a1 + 40), "removeIconView:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)layOutEmptyGridCellViewsUsingAnimator:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  BOOL v4 = [(SBIconListView *)self showsEmptyGridCells];
  if (v4 || [(NSMutableDictionary *)self->_emptyGridCells count])
  {
    uint64_t v5 = [(SBIconListView *)self layoutMetrics];
    uint64_t v6 = [v5 gridCellInfo];
    long long v7 = (void *)v6;
    if (v4) {
      long long v8 = (void *)v6;
    }
    else {
      long long v8 = 0;
    }
    id v9 = v8;
    long long v10 = [(NSMutableDictionary *)self->_emptyGridCells allKeys];
    BOOL v11 = (void *)[v10 mutableCopy];

    LODWORD(v10) = [v7 gridSize];
    [(SBIconListView *)self iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassDefault"];
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke;
    v55[3] = &unk_1E6AB0DA8;
    id v20 = v11;
    int v63 = (int)v10;
    id v56 = v20;
    id v57 = self;
    id v21 = v5;
    id v58 = v21;
    BOOL v64 = v38 != 0;
    uint64_t v59 = v13;
    uint64_t v60 = v15;
    uint64_t v61 = v17;
    uint64_t v62 = v19;
    [v9 enumerateEmptyGridCellIndexesUsingBlock:v55];
    emptyGridCells = self->_emptyGridCells;
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_5;
    v51[3] = &unk_1E6AB0DD0;
    int v53 = (int)v10;
    v51[4] = self;
    id v23 = v21;
    id v52 = v23;
    BOOL v54 = v38 != 0;
    [(NSMutableDictionary *)emptyGridCells enumerateKeysAndObjectsUsingBlock:v51];
    if ([v20 count])
    {
      id v34 = v23;
      id v35 = v20;
      id v36 = v9;
      double v37 = v7;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      obuint64_t j = v20;
      uint64_t v24 = [obj countByEnumeratingWithState:&v47 objects:v65 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v48 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v28 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            uint64_t v29 = [(NSMutableDictionary *)self->_emptyGridCells objectForKey:v28];
            if (([v29 isRemoved] & 1) == 0)
            {
              BOOL v30 = [v29 cellView];
              [v29 setRemoved:1];
              if (v38)
              {
                uint64_t v31 = (void *)MEMORY[0x1E4FB1EB0];
                v45[0] = MEMORY[0x1E4F143A8];
                v45[1] = 3221225472;
                v45[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_7;
                v45[3] = &unk_1E6AAC810;
                id v32 = v30;
                id v46 = v32;
                v40[0] = MEMORY[0x1E4F143A8];
                v40[1] = 3221225472;
                v40[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_8;
                v40[3] = &unk_1E6AB0DF8;
                id v41 = v29;
                double v42 = self;
                uint64_t v43 = v28;
                id v44 = v32;
                [v31 animateWithDuration:v45 animations:v40 completion:0.2];
              }
              else
              {
                [v30 removeFromSuperview];
                [(NSMutableDictionary *)self->_emptyGridCells removeObjectForKey:v28];
              }
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v65 count:16];
        }
        while (v25);
      }

      id v9 = v36;
      long long v7 = v37;
      id v23 = v34;
      id v20 = v35;
    }
    if (![(NSMutableDictionary *)self->_emptyGridCells count])
    {
      uint64_t v33 = self->_emptyGridCells;
      self->_emptyGridCells = 0;
    }
  }
}

void __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke(uint64_t a1, unint64_t a2)
{
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a2];
  [v4 removeObject:v5];

  unint64_t v6 = SBIconCoordinateMakeWithGridCellIndex(a2, *(_DWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "rectForDefaultSizedCellAtCoordinate:metrics:", v6, v7, *(void *)(a1 + 48));
  UIRectGetCenter();
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 496);
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v14 = [v12 objectForKey:v13];

  if (!v14)
  {
    uint64_t v18 = [*(id *)(a1 + 40) makeEmptyGridCellView];
    id v15 = v18;
    if (v18)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4FB1EB0];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_3;
      v28[3] = &unk_1E6AAFE30;
      id v15 = v18;
      id v29 = v15;
      long long v30 = *(_OWORD *)(a1 + 56);
      long long v31 = *(_OWORD *)(a1 + 72);
      uint64_t v32 = v9;
      uint64_t v33 = v11;
      [v19 performWithoutAnimation:v28];
      [*(id *)(a1 + 40) insertSubview:v15 atIndex:0];
      uint64_t v14 = [[SBIconListViewEmptyCell alloc] initWithCellView:v15];
      id v20 = *(void **)(*(void *)(a1 + 40) + 496);
      if (!v20)
      {
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v22 = *(void *)(a1 + 40);
        id v23 = *(void **)(v22 + 496);
        *(void *)(v22 + 496) = v21;

        id v20 = *(void **)(*(void *)(a1 + 40) + 496);
      }
      uint64_t v24 = [NSNumber numberWithUnsignedInteger:a2];
      [v20 setObject:v14 forKey:v24];

      if (*(unsigned char *)(a1 + 92))
      {
        [v15 setAlpha:0.0];
        uint64_t v25 = (void *)MEMORY[0x1E4FB1EB0];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_4;
        v26[3] = &unk_1E6AAC810;
        id v27 = v15;
        [v25 animateWithDuration:v26 animations:0.2];
      }
      else
      {
        [v15 setAlpha:1.0];
      }
      uint64_t v17 = v29;
      goto LABEL_14;
    }
    uint64_t v14 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if ([(SBIconListViewEmptyCell *)v14 isRemoved])
  {
    id v15 = [(SBIconListViewEmptyCell *)v14 cellView];
    [(SBIconListViewEmptyCell *)v14 setRemoved:0];
    if (*(unsigned char *)(a1 + 92))
    {
      uint64_t v16 = (void *)MEMORY[0x1E4FB1EB0];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_2;
      v34[3] = &unk_1E6AAC810;
      id v15 = v15;
      id v35 = v15;
      [v16 animateWithDuration:v34 animations:0.2];
      uint64_t v17 = v35;
LABEL_14:

      goto LABEL_15;
    }
    [v15 setAlpha:1.0];
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  [*(id *)(a1 + 32) _setContinuousCornerRadius:*(double *)(a1 + 64)];
  id v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 72);
  double v4 = *(double *)(a1 + 80);
  return objc_msgSend(v2, "setCenter:", v3, v4);
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  unint64_t v6 = [a3 cellView];
  unint64_t v7 = [v5 unsignedIntegerValue];

  unint64_t v8 = SBIconCoordinateMakeWithGridCellIndex(v7, *(_DWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellAtCoordinate:metrics:", v8, v9, *(void *)(a1 + 40));
  UIRectGetCenter();
  double v12 = v10;
  double v13 = v11;
  if (*(unsigned char *)(a1 + 52))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_6;
    v15[3] = &unk_1E6AAFD70;
    id v16 = v6;
    double v17 = v12;
    double v18 = v13;
    [v14 animateWithDuration:v15 animations:0.2];
  }
  else
  {
    objc_msgSend(v6, "setCenter:", v10, v11);
  }
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_8(uint64_t a1, int a2)
{
  if (a2)
  {
    if ([*(id *)(a1 + 32) isRemoved])
    {
      double v3 = [*(id *)(*(void *)(a1 + 40) + 496) objectForKey:*(void *)(a1 + 48)];
      double v4 = *(void **)(a1 + 32);

      if (v3 == v4)
      {
        [*(id *)(a1 + 56) removeFromSuperview];
        uint64_t v5 = *(void *)(a1 + 48);
        unint64_t v6 = *(void **)(*(void *)(a1 + 40) + 496);
        [v6 removeObjectForKey:v5];
      }
    }
  }
}

- (id)makeEmptyGridCellView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  double v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (void)performDefaultAnimatedRemovalForIconViews:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke;
  v12[3] = &unk_1E6AAC810;
  id v13 = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke_2;
  v10[3] = &unk_1E6AADF78;
  id v11 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 animateWithDuration:0 delay:v12 options:v10 animations:0.3 completion:0.0];
}

void __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "setAlpha:", 0.0, (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)iconRemovalAnimationDestinationEdge
{
  uint64_t v3 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconRemovalAnimationDestinationEdgeForIconListView_];
  uint64_t v4 = v3;
  if (v3) {
    int64_t v5 = [v3 iconRemovalAnimationDestinationEdgeForIconListView:self];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)iconInsertionAnimationOriginatingEdge
{
  uint64_t v3 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconInsertionAnimationOriginatingEdgeForIconListView_];
  uint64_t v4 = v3;
  if (v3) {
    int64_t v5 = [v3 iconInsertionAnimationOriginatingEdgeForIconListView:self];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)iconsNeedLayout
{
  return self->_needsLayout;
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  long long v6 = [(SBIconListView *)self layoutMetrics];
  long long v7 = -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v6);

  return v7;
}

- (unint64_t)iconIndexForCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v7 = a4;
  unint64_t v8 = -[SBIconListView iconIndexForGridCellIndex:metrics:](self, "iconIndexForGridCellIndex:metrics:", -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v7), v7);

  return v8;
}

- (id)iconAtPoint:(CGPoint)a3 index:(unint64_t *)a4
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v8 = [(SBIconListView *)self layoutMetrics];
  [(SBIconListView *)self bounds];
  v17.double x = x;
  v17.double y = y;
  if (CGRectContainsPoint(v18, v17) || [v8 columnOffset])
  {
    uint64_t v9 = -[SBIconListView coordinateAtPoint:metrics:](self, "coordinateAtPoint:metrics:", v8, x, y);
    unint64_t v11 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](self, "indexForCoordinate:forOrientation:metrics:", v9, v10, [(SBIconListView *)self layoutOrientation], v8);
    unint64_t v12 = v11;
    if (a4) {
      *a4 = v11;
    }
    id v13 = [(SBIconListView *)self displayedModel];
    if (v12 >= [v13 numberOfIcons])
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v14 = [v13 iconAtIndex:v12];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)dragHitRegionForPoint:(CGPoint)a3 icon:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!v7)
  {
    -[SBIconListView iconAtPoint:index:](self, "iconAtPoint:index:", 0, x, y);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7) {
      return 0;
    }
  }
  unint64_t v8 = [(SBIconListView *)self iconViewForIcon:v7];
  memset(v11, 0, sizeof(v11));
  [(SBIconListView *)self _getDragRegionRects:v11 forIconView:v8];
  v12.double x = x;
  v12.double y = y;
  unint64_t v9 = CGRectContainsPoint(v11[0], v12);
  v13.double x = x;
  v13.double y = y;
  if (CGRectContainsPoint(v11[1], v13)) {
    v9 |= 2uLL;
  }
  v14.double x = x;
  v14.double y = y;
  if (CGRectContainsPoint(v11[2], v14)) {
    v9 |= 0x10uLL;
  }
  v15.double x = x;
  v15.double y = y;
  if (CGRectContainsPoint(v11[3], v15)) {
    v9 |= 0x20uLL;
  }
  v16.double x = x;
  v16.double y = y;
  if (CGRectContainsPoint(v11[4], v16)) {
    v9 |= 4uLL;
  }
  v17.double x = x;
  v17.double y = y;
  if (CGRectContainsPoint(v11[5], v17)) {
    v9 |= 8uLL;
  }

  return v9;
}

- (void)_getDragRegionRects:(SBIconListViewCellDragRegionRects *)a3 forIconView:(id)a4
{
  id v6 = a4;
  id v20 = [(SBIconListView *)self layoutMetrics];
  id v7 = [v6 icon];
  [v6 iconImageFrame];
  -[SBIconListView convertRect:fromView:](self, "convertRect:fromView:", v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  uint64_t v16 = [(SBIconListView *)self coordinateForIcon:v7];
  uint64_t v18 = v17;
  if ([v7 isFolderIcon])
  {
    double v19 = 0.833333333;
  }
  else if ([v7 isWidgetIcon])
  {
    double v19 = 0.7;
  }
  else
  {
    double v19 = 0.666666667;
  }
  -[SBIconListView _getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:](self, "_getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:", a3, v16, v18, v20, 0, v9, v11, v13, v15, v19);
}

- (void)_getDragRegionRects:(SBIconListViewCellDragRegionRects *)a3 forIconCoordinate:(SBIconCoordinate)a4 iconImageFrame:(CGRect)a5 overlapWindowFraction:(double)a6 metrics:(id)a7 options:(unint64_t)a8
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  -[SBIconListView fullRectForCellAtIconCoordinate:metrics:options:](self, "fullRectForCellAtIconCoordinate:metrics:options:", a4.column, a4.row, a7, a8);
  CGFloat v30 = v14;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  double v21 = 1.0 - a6;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGFloat v34 = v21 * CGRectGetWidth(v45) * 0.5;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v32 = v21 * CGRectGetHeight(v46) * 0.5;
  a3->var0.origin.CGFloat x = x;
  a3->var0.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  a3->var0.size.CGFloat width = width;
  a3->var0.size.CGFloat height = height;
  v47.size.CGFloat height = height;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  CGFloat v22 = y;
  CGFloat v23 = v47.size.width;
  CGFloat v29 = v47.size.width;
  double MinX = CGRectGetMinX(v47);
  v48.origin.CGFloat x = v30;
  v48.origin.CGFloat y = v16;
  v48.size.CGFloat width = v18;
  v48.size.CGFloat height = v20;
  CGFloat amount = v34 + MinX - CGRectGetMinX(v48);
  memset(&remainder, 0, sizeof(remainder));
  v49.origin.CGFloat x = v30;
  v49.origin.CGFloat y = v16;
  v49.size.CGFloat width = v18;
  v49.size.CGFloat height = v20;
  CGRectDivide(v49, &a3->var2, &remainder, amount, CGRectMinXEdge);
  v50.origin.CGFloat x = v30;
  v50.origin.CGFloat y = v16;
  v50.size.CGFloat width = v18;
  v50.size.CGFloat height = v20;
  double MaxX = CGRectGetMaxX(v50);
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = v22;
  v51.size.CGFloat width = v23;
  v51.size.CGFloat height = height;
  CGFloat v35 = v34 + MaxX - CGRectGetMaxX(v51);
  memset(&v43, 0, sizeof(v43));
  v52.origin.CGFloat x = v30;
  v52.origin.CGFloat y = v16;
  v52.size.CGFloat width = v18;
  v52.size.CGFloat height = v20;
  CGRectDivide(v52, &a3->var3, &v43, v35, CGRectMaxXEdge);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = v22;
  v53.size.CGFloat width = v29;
  v53.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v53);
  v54.origin.CGFloat x = v30;
  v54.origin.CGFloat y = v16;
  v54.size.CGFloat width = v18;
  v54.size.CGFloat height = v20;
  double v31 = v32 + MinY - CGRectGetMinY(v54);
  memset(&v42, 0, sizeof(v42));
  v55.origin.CGFloat x = v30;
  v55.origin.CGFloat y = v16;
  v55.size.CGFloat width = v18;
  v55.size.CGFloat height = v20;
  CGRectDivide(v55, &a3->var4, &v42, v31, CGRectMinYEdge);
  v56.origin.CGFloat x = v30;
  v56.origin.CGFloat y = v16;
  v56.size.CGFloat width = v18;
  v56.size.CGFloat height = v20;
  double MaxY = CGRectGetMaxY(v56);
  v57.origin.CGFloat y = v22;
  v57.origin.CGFloat x = x;
  v57.size.CGFloat width = v29;
  v57.size.CGFloat height = height;
  CGFloat v28 = v32 + MaxY - CGRectGetMaxY(v57);
  memset(&v41, 0, sizeof(v41));
  v58.origin.CGFloat x = v30;
  v58.origin.CGFloat y = v16;
  v58.size.CGFloat width = v18;
  v58.size.CGFloat height = v20;
  CGRectDivide(v58, &a3->var5, &v41, v28, CGRectMaxYEdge);
  v40.origin.CGFloat x = v30;
  v40.origin.CGFloat y = v16;
  v40.size.CGFloat width = v18;
  v40.size.CGFloat height = v20;
  memset(&slice, 0, sizeof(slice));
  v59.origin.CGFloat x = v30;
  v59.origin.CGFloat y = v16;
  v59.size.CGFloat width = v18;
  v59.size.CGFloat height = v20;
  CGRectDivide(v59, &slice, &v40, amount, CGRectMinXEdge);
  memset(&v38, 0, sizeof(v38));
  CGRectDivide(v40, &v38, &v40, v35, CGRectMaxXEdge);
  memset(&v37, 0, sizeof(v37));
  CGRectDivide(v40, &v37, &v40, v31, CGRectMinYEdge);
  memset(&v36, 0, sizeof(v36));
  CGRectDivide(v40, &v36, &a3->var1, v28, CGRectMaxYEdge);
}

- (CGRect)rectForDragHitRegion:(unint64_t)a3 forDefaultSizedCellAtCoordinate:(SBIconCoordinate)a4
{
  -[SBIconListView rectForDragHitRegion:forCellAtCoordinate:options:](self, "rectForDragHitRegion:forCellAtCoordinate:options:", a3, a4.column, a4.row, 1);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)rectForDragHitRegion:(unint64_t)a3 forIconAtCoordinate:(SBIconCoordinate)a4
{
  -[SBIconListView rectForDragHitRegion:forCellAtCoordinate:options:](self, "rectForDragHitRegion:forCellAtCoordinate:options:", a3, a4.column, a4.row, 0);
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)rectForDragHitRegion:(unint64_t)a3 forCellAtCoordinate:(SBIconCoordinate)a4 options:(unint64_t)a5
{
  int64_t row = a4.row;
  int64_t column = a4.column;
  double v10 = [(SBIconListView *)self layoutMetrics];
  -[SBIconListView rectForCellAtIconCoordinate:metrics:options:](self, "rectForCellAtIconCoordinate:metrics:options:", column, row, v10, a5);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  -[SBIconListView _getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:](self, "_getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:", &v28, column, row, v10, a5);
  uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.i32[0] < 3u)
  {
    if ((~(_BYTE)a3 & 0x14) != 0)
    {
      if ((~(_BYTE)a3 & 0x24) != 0)
      {
        if ((~(_BYTE)a3 & 3) != 0)
        {
          if ((a3 & 4) != 0)
          {
            CGFloat y = *((double *)&v36 + 1);
            CGFloat x = *(double *)&v36;
            CGFloat height = *((double *)&v37 + 1);
            CGFloat width = *(double *)&v37;
            goto LABEL_10;
          }
          if ((a3 & 0x20) != 0)
          {
            CGFloat y = *((double *)&v34 + 1);
            CGFloat x = *(double *)&v34;
            CGFloat height = *((double *)&v35 + 1);
            CGFloat width = *(double *)&v35;
            goto LABEL_10;
          }
          if ((a3 & 8) != 0)
          {
            CGFloat y = *((double *)&v38 + 1);
            CGFloat x = *(double *)&v38;
            CGFloat height = *((double *)&v39 + 1);
            CGFloat width = *(double *)&v39;
            goto LABEL_10;
          }
          if ((a3 & 0x10) != 0)
          {
            CGFloat y = *((double *)&v32 + 1);
            CGFloat x = *(double *)&v32;
            CGFloat height = *((double *)&v33 + 1);
            CGFloat width = *(double *)&v33;
            goto LABEL_10;
          }
          if ((a3 & 2) != 0)
          {
            CGFloat y = *((double *)&v30 + 1);
            CGFloat x = *(double *)&v30;
            CGFloat height = *((double *)&v31 + 1);
            CGFloat width = *(double *)&v31;
            goto LABEL_10;
          }
          if (a3)
          {
            CGFloat y = *((double *)&v28 + 1);
            CGFloat x = *(double *)&v28;
            CGFloat height = *((double *)&v29 + 1);
            CGFloat width = *(double *)&v29;
            goto LABEL_10;
          }
          goto LABEL_2;
        }
        uint64_t v17 = *((void *)&v28 + 1);
        uint64_t v16 = v28;
        uint64_t v19 = *((void *)&v29 + 1);
        uint64_t v18 = v29;
        uint64_t v21 = *((void *)&v30 + 1);
        uint64_t v20 = v30;
        uint64_t v23 = *((void *)&v31 + 1);
        uint64_t v22 = v31;
      }
      else
      {
        uint64_t v17 = *((void *)&v36 + 1);
        uint64_t v16 = v36;
        uint64_t v19 = *((void *)&v37 + 1);
        uint64_t v18 = v37;
        uint64_t v21 = *((void *)&v34 + 1);
        uint64_t v20 = v34;
        uint64_t v23 = *((void *)&v35 + 1);
        uint64_t v22 = v35;
      }
    }
    else
    {
      uint64_t v17 = *((void *)&v36 + 1);
      uint64_t v16 = v36;
      uint64_t v19 = *((void *)&v37 + 1);
      uint64_t v18 = v37;
      uint64_t v21 = *((void *)&v32 + 1);
      uint64_t v20 = v32;
      uint64_t v23 = *((void *)&v33 + 1);
      uint64_t v22 = v33;
    }
    CGRect v40 = CGRectIntersection(*(CGRect *)&v16, *(CGRect *)&v20);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
    goto LABEL_10;
  }
LABEL_2:
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_10:

  double v24 = x;
  double v25 = y;
  double v26 = width;
  double v27 = height;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (BOOL)isShowingAllIcons
{
  uint64_t v3 = [(SBIconListView *)self _allIconsVisibleColumnOrRowRange];
  NSUInteger location = self->_visibleColumnRange.location;
  NSUInteger length = self->_visibleColumnRange.length;
  if (location != v3 || length != v4) {
    return 0;
  }
  return self->_visibleRowRange.location == location && self->_visibleRowRange.length == length;
}

- (void)setVisibleColumnRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  p_predictedVisibleColumuint64_t n = &self->_predictedVisibleColumn;
  uint64_t v7 = [(SBIconListView *)self _allIconsVisibleColumnOrRowRange];
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", location, length, p_predictedVisibleColumn->column, *(void *)&p_predictedVisibleColumn->confidence, v7, v8, self->_predictedVisibleRow.row, *(void *)&self->_predictedVisibleRow.confidence);
}

- (void)setVisibleColumnRange:(_NSRange)a3 predictedVisibleColumn:(SBIconListPredictedVisibleColumn)a4
{
  double confidence = a4.confidence;
  unint64_t column = a4.column;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v9 = [(SBIconListView *)self _allIconsVisibleColumnOrRowRange];
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", location, length, column, *(void *)&confidence, v9, v10, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setVisibleRowRange:(_NSRange)a3 predictedVisibleRow:(SBIconListPredictedVisibleRow)a4
{
  double confidence = a4.confidence;
  unint64_t row = a4.row;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v9 = [(SBIconListView *)self _allIconsVisibleColumnOrRowRange];
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", v9, v10, 0x7FFFFFFFFFFFFFFFLL, 0, location, length, row, *(void *)&confidence);
}

- (void)setVisibleRowRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(SBIconListView *)self _allIconsVisibleColumnOrRowRange];
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", v6, v7, self->_predictedVisibleColumn.column, *(void *)&self->_predictedVisibleColumn.confidence, location, length, self->_predictedVisibleRow.row, *(void *)&self->_predictedVisibleRow.confidence);
}

- (void)setPredictedVisibleColumn:(SBIconListPredictedVisibleColumn)a3
{
}

- (void)setPredictedVisibleRow:(SBIconListPredictedVisibleRow)a3
{
}

- (SBHIconGridRange)visibleGridRange
{
  uint64_t v3 = [(SBIconListView *)self layoutMetrics];
  uint64_t v4 = [v3 gridCellInfo];
  unsigned int v5 = [v4 gridSize];
  unsigned __int16 v6 = v5;
  unsigned int v7 = HIWORD(v5);
  unsigned int v8 = [v4 usedGridSize];
  unint64_t v9 = [(SBIconListView *)self visibleColumnRange];
  unint64_t v11 = v10;
  uint64_t v12 = [(SBIconListView *)self visibleRowRange];
  unsigned int v14 = (unsigned __int16)v8;
  if (v11 >= (unsigned __int16)v8) {
    int v15 = (unsigned __int16)v8;
  }
  else {
    int v15 = v11;
  }
  if (v7 >= HIWORD(v8)) {
    unsigned int v16 = HIWORD(v8);
  }
  else {
    unsigned int v16 = v7;
  }
  int v17 = v15 | (v16 << 16);
  if (v7 < (unsigned __int16)v8) {
    unsigned int v14 = v7;
  }
  if (v13 >= HIWORD(v8)) {
    int v18 = HIWORD(v8);
  }
  else {
    int v18 = v13;
  }
  uint64_t v19 = SBHIconGridRangeIntersection(v9, v17, v12 * v6, v14 | (v18 << 16), v6);
  uint64_t v21 = v20;

  unint64_t v22 = v19;
  uint64_t v23 = v21;
  result.int size = (SBHIconGridSize)v23;
  result.cellIndeCGFloat x = v22;
  return result;
}

- (NSIndexSet)visibleGridCellIndexes
{
  uint64_t v3 = [(SBIconListView *)self layoutMetrics];
  uint64_t v4 = [(SBIconListView *)self visibleGridCellIndexesWithMetrics:v3];

  return (NSIndexSet *)v4;
}

- (id)requireAllIconsShownForReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [[SBIconListViewIconVisibilityAssertion alloc] initWithListView:self reason:v4];

  iconVisibilityAssertions = self->_iconVisibilityAssertions;
  if (!iconVisibilityAssertions)
  {
    unsigned int v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    unsigned int v8 = self->_iconVisibilityAssertions;
    self->_iconVisibilityAssertions = v7;

    iconVisibilityAssertions = self->_iconVisibilityAssertions;
  }
  [(NSHashTable *)iconVisibilityAssertions addObject:v5];
  [(SBIconListView *)self showAllIcons];
  return v5;
}

- (void)removeShowAllIconsAssertion:(id)a3
{
  [(NSHashTable *)self->_iconVisibilityAssertions removeObject:a3];
  if (![(NSHashTable *)self->_iconVisibilityAssertions count])
  {
    iconVisibilityAssertions = self->_iconVisibilityAssertions;
    self->_iconVisibilityAssertions = 0;
  }
}

- (id)iconVisibilityInfoForRect:(CGRect)a3 normalized:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v6 = objc_alloc_init(SBIconListViewIconVisibilityInfo);
  [(SBIconListViewIconVisibilityInfo *)v6 setNormalized:v4];
  unsigned int v7 = [(SBIconListView *)self icons];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        [(SBIconListView *)self rectForIcon:v12];
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        v47.origin.CGFloat x = v13;
        v47.origin.CGFloat y = v15;
        v47.size.CGFloat width = v17;
        v47.size.CGFloat height = v19;
        CGRect v42 = CGRectIntersection(a3, v47);
        CGFloat x = v42.origin.x;
        CGFloat y = v42.origin.y;
        CGFloat width = v42.size.width;
        CGFloat height = v42.size.height;
        if (!CGRectIsNull(v42))
        {
          v43.origin.CGFloat x = x;
          v43.origin.CGFloat y = y;
          v43.size.CGFloat width = width;
          v43.size.CGFloat height = height;
          double MinX = CGRectGetMinX(v43);
          v44.origin.CGFloat x = v14;
          v44.origin.CGFloat y = v16;
          v44.size.CGFloat width = v18;
          v44.size.CGFloat height = v20;
          double v33 = MinX - CGRectGetMinX(v44);
          v45.origin.CGFloat x = x;
          v45.origin.CGFloat y = y;
          v45.size.CGFloat width = width;
          v45.size.CGFloat height = height;
          double MinY = CGRectGetMinY(v45);
          v46.origin.CGFloat x = v14;
          v46.origin.CGFloat y = v16;
          v46.size.CGFloat width = v18;
          v46.size.CGFloat height = v20;
          double v26 = MinY - CGRectGetMinY(v46);
          if (v4)
          {
            double v27 = SBHNormalizedRectFromSubRect(v14, v16, v18, v20, v33, v26, width, height);
            double v26 = v28;
            CGFloat width = v29;
            CGFloat height = v30;
          }
          else
          {
            double v27 = v33;
          }
          -[SBIconListViewIconVisibilityInfo setVisibleRect:forIcon:](v6, "setVisibleRect:forIcon:", v12, v27, v26, width, height);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)enumerateVisibleIconsUsingBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SBIconListView *)self visibleIcons];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SBIconListView_enumerateVisibleIconsUsingBlock___block_invoke;
  v7[3] = &unk_1E6AB0E40;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

uint64_t __50__SBIconListView_enumerateVisibleIconsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateKnownIconViewsUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  CGFloat v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke;
  v10[3] = &unk_1E6AAE5A8;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = &v13;
  [(SBIconListView *)self enumerateIconViewsUsingBlock:v10];
  if (!*((unsigned char *)v14 + 24))
  {
    draggingIconViews = self->_draggingIconViews;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke_2;
    v7[3] = &unk_1E6AAE5F8;
    id v8 = v5;
    uint64_t v9 = &v13;
    [(NSMutableSet *)draggingIconViews enumerateObjectsUsingBlock:v7];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char v7 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  char v6 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDock
{
  return 0;
}

- (void)setIconsLabelAlpha:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __37__SBIconListView_setIconsLabelAlpha___block_invoke;
  v3[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  *(double *)&v3[4] = a3;
  [(SBIconListView *)self enumerateIconViewsUsingBlock:v3];
}

uint64_t __37__SBIconListView_setIconsLabelAlpha___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIconLabelAlpha:*(double *)(a1 + 32)];
}

- (void)setIconContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_iconContentScale = a3;
    [(SBIconListView *)self layoutIconsNow];
  }
}

- (void)addDragObserver:(id)a3 forDropSession:(id)a4
{
}

- (void)setAllowsReordering:(BOOL)a3
{
  if (self->_allowsReordering != a3)
  {
    self->_allowsReordering = a3;
    if (a3)
    {
      id v4 = [[SBIconListViewReorderingManager alloc] initWithIconListView:self];
      reorderingManager = self->_reorderingManager;
      self->_reorderingManager = v4;
    }
    else
    {
      [(SBIconListViewReorderingManager *)self->_reorderingManager invalidate];
      reorderingManager = self->_reorderingManager;
      self->_reorderingManager = 0;
    }
  }
}

- (NSString)iconDragTypeIdentifier
{
  if ([(SBIconListView *)self allowsReordering])
  {
    uint64_t v3 = [(SBIconListViewReorderingManager *)self->_reorderingManager uniqueDragTypeIdentifier];
  }
  else
  {
    uint64_t v3 = self->_iconDragTypeIdentifier;
  }
  return v3;
}

- (void)setOccluded:(BOOL)a3
{
}

- (id)layoutMetricsForOrientation:(int64_t)a3
{
  memset(v7, 0, sizeof(v7));
  [(SBIconListView *)self getLayoutMetricsParameters:v7 orientation:a3];
  id v4 = [(SBIconListView *)self displayedModel];
  id v5 = [(id)objc_opt_class() layoutMetricsForParameters:v7 listModel:v4];

  return v5;
}

- (id)layoutMetricsForModel:(id)a3
{
  memset(v7, 0, sizeof(v7));
  id v4 = a3;
  [(SBIconListView *)self getLayoutMetricsParameters:v7];
  id v5 = [(id)objc_opt_class() layoutMetricsForParameters:v7 listModel:v4];

  return v5;
}

- (void)setAutomaticallyAdjustsLayoutMetricsToFit:(BOOL)a3
{
  if (self->_automaticallyAdjustsLayoutMetricsToFit != a3)
  {
    self->_automaticallyAdjustsLayoutMetricsToFit = a3;
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

- (double)horizontalIconPadding
{
  uint64_t v2 = [(SBIconListView *)self layoutMetrics];
  [v2 iconSpacing];
  double v4 = v3;

  return v4;
}

- (double)verticalIconPadding
{
  uint64_t v2 = [(SBIconListView *)self layoutMetrics];
  [v2 iconSpacing];
  double v4 = v3;

  return v4;
}

- (CGPoint)_alignedIconPointForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if ([(SBIconListView *)self alignsIconsOnPixelBoundaries])
  {
    [(SBIconListView *)self layoutScale];
    SBFFloatFloorForScale();
    CGFloat x = v6;
    SBFFloatFloorForScale();
    CGFloat y = v7;
  }
  double v8 = x;
  double v9 = y;
  result.CGFloat y = v9;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  double v6 = [(SBIconListView *)self layoutMetrics];
  -[SBIconListView originForIconAtCoordinate:metrics:](self, "originForIconAtCoordinate:metrics:", column, row, v6);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (CGRect)rectForDefaultSizedCellsOfSize:(SBHIconGridSize)a3 startingAtCoordinate:(SBIconCoordinate)a4 metrics:(id)a5
{
  int64_t row = a4.row;
  int64_t column = a4.column;
  id v9 = a5;
  CGFloat v10 = *MEMORY[0x1E4F1DB20];
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (a3.rows)
  {
    uint64_t v14 = 0;
    do
    {
      if (a3.columns)
      {
        int64_t v15 = column;
        uint64_t columns = a3.columns;
        do
        {
          -[SBIconListView rectForDefaultSizedCellAtCoordinate:metrics:](self, "rectForDefaultSizedCellAtCoordinate:metrics:", v15, v14 + row, v9);
          CGFloat x = v17;
          CGFloat y = v19;
          CGFloat width = v21;
          CGFloat height = v23;
          v29.origin.CGFloat x = v10;
          v29.origin.CGFloat y = v11;
          v29.size.CGFloat width = v12;
          v29.size.CGFloat height = v13;
          if (!CGRectIsNull(v29))
          {
            v30.origin.CGFloat x = v10;
            v30.origin.CGFloat y = v11;
            v30.size.CGFloat width = v12;
            v30.size.CGFloat height = v13;
            v33.origin.CGFloat x = x;
            v33.origin.CGFloat y = y;
            v33.size.CGFloat width = width;
            v33.size.CGFloat height = height;
            CGRect v31 = CGRectUnion(v30, v33);
            CGFloat x = v31.origin.x;
            CGFloat y = v31.origin.y;
            CGFloat width = v31.size.width;
            CGFloat height = v31.size.height;
          }
          ++v15;
          CGFloat v10 = x;
          CGFloat v11 = y;
          CGFloat v12 = width;
          CGFloat v13 = height;
          --columns;
        }
        while (columns);
      }
      else
      {
        CGFloat height = v13;
        CGFloat width = v12;
        CGFloat y = v11;
        CGFloat x = v10;
      }
      ++v14;
      CGFloat v10 = x;
      CGFloat v11 = y;
      CGFloat v12 = width;
      CGFloat v13 = height;
    }
    while (v14 != a3.rows);
  }
  else
  {
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat x = *MEMORY[0x1E4F1DB20];
  }

  double v25 = x;
  double v26 = y;
  double v27 = width;
  double v28 = height;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (CGRect)rectForDefaultSizedCellsOfSizeClass:(id)a3 startingAtCoordinate:(SBIconCoordinate)a4 metrics:(id)a5
{
  int64_t row = a4.row;
  int64_t column = a4.column;
  id v9 = a5;
  -[SBIconListView rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:](self, "rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:", [(SBIconListView *)self iconGridSizeForClass:a3], column, row, v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)fullRectForDefaultSizedCellAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v7 = a4;
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    double v16 = [(SBIconListView *)self layout];
    [v16 iconImageInfo];
    double v42 = v17;
    double v19 = v18;
    [v7 iconInsets];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [v7 iconSpacing];
    double v29 = v28;
    double v31 = v30;
    [(SBIconListView *)self bounds];
    v43.origin.CGFloat x = v23 + v32;
    v43.origin.CGFloat y = v21 + v33;
    v43.size.CGFloat width = v34 - (v23 + v27);
    v43.size.CGFloat height = v35 - (v21 + v25);
    CGRect v44 = CGRectInset(v43, v29 * -0.5, v31 * -0.5);
    CGFloat x = v44.origin.x;
    CGFloat y = v44.origin.y;
    CGFloat width = v44.size.width;
    CGFloat height = v44.size.height;
    uint64_t v40 = [v7 columnsUsedForLayout];
    double v10 = v19 + v31;
    double v11 = v42 + v29;
    if ([(SBIconListView *)self isRTL]) {
      uint64_t v41 = v40 - column;
    }
    else {
      uint64_t v41 = column - 1;
    }
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    double v8 = CGRectGetMinX(v45) + (double)v41 * v11;
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.CGFloat height = height;
    double v9 = CGRectGetMinY(v46) + (double)(row - 1) * v10;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v12 = v8;
  double v13 = v9;
  double v14 = v11;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)getIconStartGridCellIndex:(unint64_t *)a3 gridSize:(SBHIconGridSize *)a4 forGridCellIndex:(unint64_t)a5 metrics:(id)a6
{
  id v10 = a6;
  double v11 = [(SBIconListView *)self displayedModel];
  unint64_t v16 = 0;
  uint64_t v17 = 0;
  double v12 = [v10 gridCellInfo];

  int v13 = [v11 getIconGridRange:&v16 forGridCellIndex:a5 gridCellInfo:v12];
  if (a3 && v13) {
    *a3 = v16;
  }
  char v14 = v13 ^ 1;
  if (!a4) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    *a4 = (SBHIconGridSize)v17;
  }

  return v13;
}

- (BOOL)getIconGridRange:(SBHIconGridRange *)a3 forGridCellIndex:(unint64_t)a4 metrics:(id)a5
{
  id v8 = a5;
  double v9 = [(SBIconListView *)self displayedModel];
  id v10 = [v8 gridCellInfo];

  LOBYTE(a4) = [v9 getIconGridRange:a3 forGridCellIndex:a4 gridCellInfo:v10];
  return a4;
}

- (SBHIconGridRange)iconGridRangeForGridCellIndex:(unint64_t)a3 metrics:(id)a4 options:(unint64_t)a5
{
  if ((a5 & 1) != 0
    || (unint64_t v8 = 0,
        uint64_t v9 = 0,
        ![(SBIconListView *)self getIconGridRange:&v8 forGridCellIndex:a3 metrics:a4]))
  {
    unint64_t v8 = a3;
    LODWORD(v9) = 65537;
  }
  unint64_t v6 = v8;
  uint64_t v7 = v9;
  result.int size = (SBHIconGridSize)v7;
  result.cellIndeCGFloat x = v6;
  return result;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4
{
  int64_t row = a4.row;
  int64_t column = a4.column;
  id v7 = a3;
  unint64_t v8 = [(SBIconListView *)self displayedModel];
  uint64_t v9 = [(SBIconListView *)self layoutMetrics];
  unint64_t v10 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9);
  double v11 = [v9 gridCellInfo];
  unint64_t v12 = [v8 bestGridCellIndexForInsertingIcon:v7 atGridCellIndex:v10 gridCellInfo:v11];

  return v12;
}

- (unint64_t)bestIndexForInsertingIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4
{
  unint64_t v5 = -[SBIconListView bestGridCellIndexForInsertingIcon:atCoordinate:](self, "bestGridCellIndexForInsertingIcon:atCoordinate:", a3, a4.column, a4.row);
  unint64_t v6 = [(SBIconListView *)self layoutMetrics];
  unint64_t v7 = [(SBIconListView *)self iconIndexForGridCellIndex:v5 metrics:v6];

  return v7;
}

+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4
{
  return [a1 gridCellInfoOptionsWithInterfaceOrientation:a3 reversedLayout:a4 allowGaps:0];
}

+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4 allowGaps:(BOOL)a5
{
  return [a1 gridCellInfoOptionsWithInterfaceOrientation:a3 reversedLayout:a4 flippedLayout:0 allowGaps:a5];
}

- (id)gridCellInfo
{
  uint64_t v2 = [(SBIconListView *)self layoutMetrics];
  double v3 = [v2 gridCellInfo];

  return v3;
}

- (NSString)layoutDescription
{
  uint64_t v2 = [(SBIconListView *)self gridCellInfo];
  double v3 = [v2 layoutDescription];

  return (NSString *)v3;
}

- (unint64_t)columnAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(SBIconListView *)self layoutMetrics];
  unint64_t v7 = -[SBIconListView columnAtPoint:metrics:fractionOfDistanceThroughColumn:](self, "columnAtPoint:metrics:fractionOfDistanceThroughColumn:", v6, 0, x, y);

  return v7;
}

- (unint64_t)rowAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(SBIconListView *)self layoutMetrics];
  unint64_t v7 = -[SBIconListView rowAtPoint:metrics:fractionOfDistanceThroughRow:](self, "rowAtPoint:metrics:fractionOfDistanceThroughRow:", v6, 0, x, y);

  return v7;
}

- (unint64_t)rowAtPoint:(CGPoint)a3 fractionOfDistanceThroughRow:(double *)a4
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v8 = [(SBIconListView *)self layoutMetrics];
  unint64_t v9 = -[SBIconListView rowAtPoint:metrics:fractionOfDistanceThroughRow:](self, "rowAtPoint:metrics:fractionOfDistanceThroughRow:", v8, a4, x, y);

  return v9;
}

- (unint64_t)rowAtPoint:(CGPoint)a3 metrics:(id)a4 fractionOfDistanceThroughRow:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  [v9 iconInsets];
  double v11 = v10;
  [v9 iconSize];
  double v13 = v12;
  [v9 iconSpacing];
  double v15 = v14;
  uint64_t v16 = [v9 rows];
  if (y >= v11) {
    unint64_t v17 = vcvtmd_u64_f64((y - v11 + v15 * 0.5) / (v13 + v15));
  }
  else {
    unint64_t v17 = 0;
  }
  if (v16 - 1 >= v17) {
    unint64_t v18 = v17;
  }
  else {
    unint64_t v18 = v16 - 1;
  }
  -[SBIconListView fullRectForDefaultSizedCellAtCoordinate:metrics:](self, "fullRectForDefaultSizedCellAtCoordinate:metrics:", 1, v18 + 1, v9);
  CGFloat v19 = v29.origin.x;
  CGFloat v20 = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double v23 = y - CGRectGetMinY(v29);
  v30.origin.double x = v19;
  v30.origin.double y = v20;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double v24 = v23 / CGRectGetHeight(v30);
  double v25 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_rowAtPoint_metrics_proposedRow_];
  double v26 = v25;
  if (v25)
  {
    uint64_t v27 = objc_msgSend(v25, "iconListView:rowAtPoint:metrics:proposedRow:", self, v9, v18, x, y);
    if (v27 != v18) {
      double v24 = 0.0;
    }
    unint64_t v18 = v27;
  }
  if (a5) {
    *a5 = v24;
  }

  return v18;
}

- (CGPoint)fractionalCoordinateAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v5 = [(SBIconListView *)self layoutMetrics];
  unint64_t v6 = (void *)[v5 copy];

  unint64_t v7 = [v6 gridCellInfo];
  [v7 clearAllIconAndGridCellIndexes];
  unint64_t v8 = [(SBIconListView *)self displayedModel];
  uint64_t v9 = [v8 numberOfIcons];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      [v7 setIconIndex:i forGridCellIndex:i];
      [v7 setGridCellIndex:i forIconIndex:i];
    }
  }
  [(SBIconListView *)self iconImageSizeForGridSizeClass:@"SBHIconGridSizeClassDefault"];
  -[objc_class defaultIconImageCenterForIconImageSize:]([(SBIconListView *)self baseIconViewClass], "defaultIconImageCenterForIconImageSize:", v12, v13);
  double v15 = v14;
  double v17 = v16;
  [v6 iconContentScale];
  double v19 = v15 * v18;
  [v6 iconContentScale];
  double v21 = v17 * v20;
  -[SBIconListView originForIconAtCoordinate:metrics:options:](self, "originForIconAtCoordinate:metrics:options:", 1, 1, v6, 1);
  double v23 = v22;
  double v25 = v19 + v24;
  double v26 = (double)(unint64_t)[v6 rows];
  if (v26 == 1.84467441e19) {
    double v26 = (double)(unint64_t)[v8 numberOfUsedRows];
  }
  double v27 = v21 + v23;
  -[SBIconListView originForIconAtCoordinate:metrics:options:](self, "originForIconAtCoordinate:metrics:options:", [v6 columns], (uint64_t)v26, v6, 1);
  double v30 = v21 + v29;
  double v31 = v19 + v28 - v25;
  double v32 = 0.0;
  double v33 = 0.0;
  if ((BSFloatIsZero() & 1) == 0) {
    double v33 = (x - v25) / v31;
  }
  uint64_t v34 = [v6 columns];
  if ((BSFloatIsZero() & 1) == 0) {
    double v32 = (y - v27) / (v30 - v27);
  }

  double v35 = v33 * (double)(unint64_t)(v34 - 1) + 1.0;
  double v36 = v32 * (v26 + -1.0) + 1.0;
  result.double y = v36;
  result.double x = v35;
  return result;
}

- (SBIconCoordinate)coordinateAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  unint64_t v6 = [(SBIconListView *)self layoutMetrics];
  uint64_t v7 = -[SBIconListView coordinateAtPoint:metrics:](self, "coordinateAtPoint:metrics:", v6, x, y);
  int64_t v9 = v8;

  int64_t v10 = v7;
  int64_t v11 = v9;
  result.int64_t row = v11;
  result.int64_t column = v10;
  return result;
}

- (SBIconCoordinate)coordinateAtPoint:(CGPoint)a3 metrics:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  unint64_t v8 = -[SBIconListView columnAtPoint:metrics:fractionOfDistanceThroughColumn:](self, "columnAtPoint:metrics:fractionOfDistanceThroughColumn:", v7, 0, x, y);
  unint64_t v9 = -[SBIconListView rowAtPoint:metrics:fractionOfDistanceThroughRow:](self, "rowAtPoint:metrics:fractionOfDistanceThroughRow:", v7, 0, x, y);

  int64_t v10 = v8 + 1;
  int64_t v11 = v9 + 1;
  result.int64_t row = v11;
  result.int64_t column = v10;
  return result;
}

- (SBHIconGridRange)gridRangeForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unsigned __int16 v8 = (unsigned __int16)[(SBIconListView *)self gridSizeForCurrentOrientation];
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.CGFloat y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  uint64_t v10 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", MinX, CGRectGetMinY(v44));
  uint64_t v12 = v11;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v45);
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  uint64_t v14 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", MaxX, CGRectGetMinY(v46));
  uint64_t v16 = v15;
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  double v17 = CGRectGetMinX(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  uint64_t v18 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", v17, CGRectGetMaxY(v48));
  uint64_t v20 = v19;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.CGFloat width = width;
  v49.size.CGFloat height = height;
  double v21 = CGRectGetMaxX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  uint64_t v22 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", v21, CGRectGetMaxY(v50));
  uint64_t v24 = v23;
  GridCellIndeCGFloat x = SBIconCoordinateGetGridCellIndex(v10, v12, v8);
  unint64_t v26 = SBIconCoordinateGetGridCellIndex(v14, v16, v8);
  unint64_t v27 = SBHIconGridRangeAddCellIndex(GridCellIndex, 65537, v26, v8);
  uint64_t v29 = v28;
  unint64_t v30 = SBIconCoordinateGetGridCellIndex(v14, v16, v8);
  unint64_t v31 = SBHIconGridRangeAddCellIndex(v27, v29, v30, v8);
  uint64_t v33 = v32;
  unint64_t v34 = SBIconCoordinateGetGridCellIndex(v18, v20, v8);
  unint64_t v35 = SBHIconGridRangeAddCellIndex(v31, v33, v34, v8);
  uint64_t v37 = v36;
  unint64_t v38 = SBIconCoordinateGetGridCellIndex(v22, v24, v8);
  unint64_t v39 = SBHIconGridRangeAddCellIndex(v35, v37, v38, v8);
  result.int size = (SBHIconGridSize)v40;
  result.cellIndeCGFloat x = v39;
  return result;
}

- (CGRect)rectForGridRange:(SBHIconGridRange)a3
{
  uint64_t v3 = *(void *)&a3.size.columns;
  cellIndeCGFloat x = a3.cellIndex;
  unint64_t v6 = [(SBIconListView *)self layoutMetrics];
  -[SBIconListView fullRectForGridRange:metrics:](self, "fullRectForGridRange:metrics:", cellIndex, v3, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (SBHIconGridRange)closestGridRangeForIconOfSize:(SBHIconGridSize)a3 centeredAtPoint:(CGPoint)a4
{
  unint64_t v6 = [(SBIconListView *)self layoutMetrics];
  -[SBIconListView rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:](self, "rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:", *(unsigned int *)&a3, 1, 1, v6);

  UIRectCenteredAboutPoint();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  double v12 = v11;
  double v14 = v13;
  unint64_t v15 = -[SBIconListView gridRangeForRect:](self, "gridRangeForRect:");
  int v17 = v16;
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x3010000000;
  uint64_t v28 = &unk_1D821E08B;
  long long v29 = xmmword_1D81E5560;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  unsigned __int16 v18 = (unsigned __int16)[(SBIconListView *)self gridSizeForCurrentOrientation];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__SBIconListView_closestGridRangeForIconOfSize_centeredAtPoint___block_invoke;
  v23[3] = &unk_1E6AB0F10;
  v23[7] = v8;
  v23[8] = v10;
  *(double *)&v23[9] = v12;
  *(double *)&v23[10] = v14;
  *(double *)&v23[11] = v12 * v14;
  v23[4] = self;
  v23[5] = v24;
  v23[6] = &v25;
  SBHIconGridRangeEnumerateSubranges(v15, v17, *(_DWORD *)&a3, v18, 1, v23);
  unint64_t v19 = v26[4];
  uint64_t v20 = v26[5];
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  unint64_t v21 = v19;
  uint64_t v22 = v20;
  result.int size = (SBHIconGridSize)v22;
  result.cellIndeCGFloat x = v21;
  return result;
}

uint64_t __64__SBIconListView_closestGridRangeForIconOfSize_centeredAtPoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "rectForGridRange:", a2, a3);
  v15.origin.CGFloat x = v6;
  v15.origin.CGFloat y = v7;
  v15.size.CGFloat width = v8;
  v15.size.CGFloat height = v9;
  double v10 = v8 * v9;
  CGRect v14 = CGRectIntersection(*(CGRect *)(a1 + 56), v15);
  double v11 = 1.0
      - (v10 + *(double *)(a1 + 88) - v14.size.width * v14.size.height - v14.size.width * v14.size.height)
      / (v10 + *(double *)(a1 + 88));
  uint64_t result = BSFloatGreaterThanFloat();
  if (result)
  {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v13 + 32) = a2;
    *(void *)(v13 + 40) = a3;
  }
  return result;
}

- (CGSize)effectiveIconSpacing
{
  uint64_t v2 = [(SBIconListView *)self layoutMetrics];
  [v2 iconSpacing];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  [(SBIconListView *)self getLayoutMetricsParameters:&v19];
  double v6 = [(SBIconListView *)self displayedModel];
  [v6 gridSize];
  uint64_t v7 = [v6 numberOfUsedRows];
  *(double *)&long long v20 = width;
  *((double *)&v20 + 1) = height;
  *(void *)&long long v25 = v7;
  *((void *)&v23 + 1) = 0;
  double v8 = [(id)objc_opt_class() layoutMetricsForParameters:&v19 listModel:v6];
  [v8 alignmentIconSize];
  [v8 iconContentScale];
  [v8 alignmentIconSize];
  [v8 iconContentScale];
  [v8 iconInsets];
  [v8 iconSpacing];
  [v8 iconInsets];
  [v8 iconInsets];
  [v8 iconSpacing];
  [v8 iconInsets];
  UISizeRoundToViewScale();
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = [(SBIconListView *)self effectiveLayoutDelegateForSelector:sel_iconListView_sizeThatFits_metrics_proposedSize_];
  CGRect v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "iconListView:sizeThatFits:metrics:proposedSize:", self, v8, width, height, v10, v12);
    double v10 = v15;
    double v12 = v16;
  }

  double v17 = v10;
  double v18 = v12;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(SBIconListView *)self iconSpacing];
  double v5 = v4;
  if (v3 == -123.0 && v4 == -123.0)
  {
    double v6 = *MEMORY[0x1E4FB30D8];
    double v7 = *MEMORY[0x1E4FB30D8];
  }
  else if (v3 == -123.0)
  {
    double v7 = *MEMORY[0x1E4FB30D8];
    -[SBIconListView sizeThatFits:](self, "sizeThatFits:", 10000.0, 10000.0);
  }
  else
  {
    -[SBIconListView sizeThatFits:](self, "sizeThatFits:", 10000.0, 10000.0);
    double v7 = v6;
    if (v5 == -123.0) {
      double v6 = *MEMORY[0x1E4FB30D8];
    }
    else {
      double v7 = v8;
    }
  }
  double v9 = v7;
  result.double height = v6;
  result.double width = v9;
  return result;
}

- (void)ignoreNextWindowChange
{
  self->_ignoreNextWindowChange = 1;
}

- (void)removeLayoutObserver:(id)a3
{
}

- (id)gridSizeClassDomain
{
  uint64_t v2 = [(SBIconListView *)self model];
  double v3 = [v2 effectiveGridSizeClassDomain];

  return v3;
}

- (id)effectiveIconImageAppearance
{
  double v3 = [(SBIconListView *)self overrideIconImageAppearance];
  double v4 = [(SBIconListView *)self traitCollection];
  double v5 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);

  return v5;
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  id v4 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    double v5 = (SBHIconImageStyleConfiguration *)[v4 copy];
    overrideIconImageStyleConfiguratiouint64_t n = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguratiouint64_t n = v5;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SBIconListView_setOverrideIconImageStyleConfiguration___block_invoke;
    v7[3] = &unk_1E6AAD830;
    id v8 = v4;
    [(SBIconListView *)self enumerateDisplayedIconViewsUsingBlock:v7];
  }
}

uint64_t __57__SBIconListView_setOverrideIconImageStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setOverrideIconImageStyleConfiguration:*(void *)(a1 + 32)];
}

- (BOOL)containsWidget
{
  uint64_t v2 = [(SBIconListView *)self displayedModel];
  double v3 = self;
  char v4 = [v2 directlyContainsIconOfClass:v3];

  return v4;
}

- (id)widgetIconsForIntroductionContainerView
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(SBIconListView *)self displayedModel];
  double v5 = [v4 icons];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isWidgetIcon]) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)addPronouncedContainerViewWithDelegate:(id)a3 vertical:(BOOL)a4
{
  void v45[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  pronouncedContainerView = self->_pronouncedContainerView;
  if (pronouncedContainerView)
  {
    [(SBIconWidgetIntroductionView *)pronouncedContainerView removeFromSuperview];
    uint64_t v8 = self->_pronouncedContainerView;
    self->_pronouncedContainerView = 0;
  }
  double v9 = [(SBIconListView *)self widgetIconsForIntroductionContainerView];
  if ([v9 count])
  {
    id v42 = v6;
    objc_storeWeak((id *)&self->_widgetIntroductionDelegate, v6);
    self->_isWidgetIntroductionVertical = a4;
    uint64_t v41 = v9;
    double v10 = [[SBIconWidgetIntroductionView alloc] initWithWidgetIcons:v9];
    double v11 = self->_pronouncedContainerView;
    self->_pronouncedContainerView = v10;

    [(SBIconListView *)self addSubview:self->_pronouncedContainerView];
    [(SBIconListView *)self sendSubviewToBack:self->_pronouncedContainerView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetIntroductionDelegate);
    +[SBIconWidgetIntroductionPopoverView contentSize:self->_isWidgetIntroductionVertical];
    double v14 = v13;
    double v16 = v15;
    uint64_t v17 = [[SBIconWidgetIntroductionPopoverView alloc] initWithDelegate:WeakRetained vertical:self->_isWidgetIntroductionVertical];
    widgetIntroductionPopover = self->_widgetIntroductionPopover;
    self->_widgetIntroductionPopover = v17;

    [(SBIconListView *)self addSubview:self->_widgetIntroductionPopover];
    [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBIconListView *)self _introductionContainerViewFrameForView:self->_pronouncedContainerView];
    self->_widgetIntroductionPopOverTopAnchorOffset = v19;
    long long v20 = [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover topAnchor];
    long long v21 = [(SBIconListView *)self topAnchor];
    [(SBIconListView *)self _topSpacingForWidgetIntroductionPopoverView];
    objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v21);
    long long v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    widgetIntroductionPopoverTopAnchorConstraint = self->_widgetIntroductionPopoverTopAnchorConstraint;
    self->_widgetIntroductionPopoverTopAnchorConstraint = v22;

    long long v24 = [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover leadingAnchor];
    long long v25 = [(SBIconListView *)self leadingAnchor];
    [(SBIconListView *)self _leadingSpacingForWidgetIntroductionPopoverView];
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25);
    long long v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    widgetIntroductionPopoverLeadingAnchorConstraint = self->_widgetIntroductionPopoverLeadingAnchorConstraint;
    self->_widgetIntroductionPopoverLeadingAnchorConstraint = v26;

    uint64_t v40 = (void *)MEMORY[0x1E4F28DC8];
    long long v28 = self->_widgetIntroductionPopover;
    if (self->_isWidgetIntroductionVertical)
    {
      long long v29 = [(SBIconWidgetIntroductionPopoverView *)v28 topAnchor];
      long long v30 = [(SBIconListView *)self topAnchor];
      [(SBIconListView *)self _topSpacingForWidgetIntroductionPopoverView];
      long long v31 = objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);
      uint64_t v32 = self->_widgetIntroductionPopoverLeadingAnchorConstraint;
      v45[0] = v31;
      v45[1] = v32;
      uint64_t v33 = [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover widthAnchor];
      unint64_t v34 = [v33 constraintEqualToConstant:v14];
      v45[2] = v34;
      unint64_t v35 = [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover heightAnchor];
      uint64_t v36 = [v35 constraintEqualToConstant:v16];
      v45[3] = v36;
      uint64_t v37 = v45;
    }
    else
    {
      long long v29 = [(SBIconWidgetIntroductionPopoverView *)v28 centerXAnchor];
      long long v30 = [(SBIconListView *)self centerXAnchor];
      long long v31 = [v29 constraintEqualToAnchor:v30];
      v44[0] = v31;
      uint64_t v33 = [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover widthAnchor];
      unint64_t v34 = [v33 constraintEqualToConstant:v14];
      v44[1] = v34;
      unint64_t v35 = [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover heightAnchor];
      uint64_t v36 = [v35 constraintEqualToConstant:v16];
      unint64_t v38 = self->_widgetIntroductionPopoverTopAnchorConstraint;
      v44[2] = v36;
      v44[3] = v38;
      uint64_t v37 = v44;
    }
    unint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v40 activateConstraints:v39];

    [(SBIconListView *)self bringSubviewToFront:self->_widgetIntroductionPopover];
    [(SBIconListView *)self layoutWidgetIntroductionViews];
    [(SBIconListView *)self setNeedsLayout];
    [(SBIconListView *)self layoutIfNeeded];
    [(SBIconListView *)self startAnimatingPronouncedContainerAndPopoverView];
    [(SBIconWidgetIntroductionPopoverView *)self->_widgetIntroductionPopover setAlpha:0.0];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __66__SBIconListView_addPronouncedContainerViewWithDelegate_vertical___block_invoke;
    v43[3] = &unk_1E6AAC810;
    v43[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v43 animations:0.225];

    double v9 = v41;
    id v6 = v42;
  }
}

uint64_t __66__SBIconListView_addPronouncedContainerViewWithDelegate_vertical___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 832) setAlpha:1.0];
}

- (CGRect)_introductionContainerViewFrameForView:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  char v4 = [a3 widgetIcons];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v29;
    double width = 1.0;
    CGFloat x = 0.0;
    *(void *)&long long v6 = 138412290;
    long long v27 = v6;
    CGFloat y = 0.0;
    double height = 1.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        double v15 = -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v14, v27);
        double v16 = SBLogWidgetDiscoverabilityMigration();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v27;
          uint64_t v33 = v15;
          _os_log_impl(&dword_1D7F0A000, v16, OS_LOG_TYPE_DEFAULT, "introductionContainerView contained icon view %@", buf, 0xCu);
        }

        if (v15)
        {
          [(SBIconListView *)self rectForIcon:v14];
          v40.origin.CGFloat x = v17;
          v40.origin.CGFloat y = v18;
          v40.size.double width = v19;
          v40.size.double height = v20;
          v36.origin.CGFloat x = x;
          v36.origin.CGFloat y = y;
          v36.size.double width = width;
          v36.size.double height = height;
          CGRect v37 = CGRectUnion(v36, v40);
          CGFloat x = v37.origin.x;
          CGFloat y = v37.origin.y;
          double width = v37.size.width;
          double height = v37.size.height;
          long long v21 = SBLogWidgetDiscoverabilityMigration();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v38.origin.CGFloat x = x;
            v38.origin.CGFloat y = y;
            v38.size.double width = width;
            v38.size.double height = height;
            long long v22 = NSStringFromCGRect(v38);
            *(_DWORD *)buf = v27;
            uint64_t v33 = v22;
            _os_log_impl(&dword_1D7F0A000, v21, OS_LOG_TYPE_DEFAULT, "introductionContainerView union frame %@", buf, 0xCu);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    double width = 1.0;
    CGFloat x = 0.0;
    CGFloat y = 0.0;
    double height = 1.0;
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (void)layoutWidgetIntroductionViews
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  double v3 = self->_pronouncedContainerView;
  char v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(SBIconWidgetIntroductionView *)v3 widgetIcons];
    [(SBIconListView *)self _introductionContainerViewFrameForView:v4];
    -[SBIconWidgetIntroductionView sbf_setBoundsAndPositionFromFrame:](v4, "sbf_setBoundsAndPositionFromFrame:");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v29;
      *(void *)&long long v8 = 138412290;
      long long v27 = v8;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          double v13 = -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v12, v27, (void)v28);
          uint64_t v14 = v13;
          if (v13)
          {
            double v15 = [v13 superview];

            if (v15 == self)
            {
              [(SBIconWidgetIntroductionView *)v4 addSubview:v14];
              [(SBIconListView *)self centerForIcon:v12];
              double v17 = v16;
              double v19 = v18;
              CGFloat v20 = [v14 superview];
              -[SBIconListView convertPoint:toView:](self, "convertPoint:toView:", v20, v17, v19);
              double v22 = v21;
              double v24 = v23;

              double v25 = SBLogWidgetDiscoverabilityMigration();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v36.CGFloat x = v22;
                v36.CGFloat y = v24;
                double v26 = NSStringFromCGPoint(v36);
                *(_DWORD *)buf = v27;
                uint64_t v33 = v26;
                _os_log_impl(&dword_1D7F0A000, v25, OS_LOG_TYPE_DEFAULT, "introductionContainerView contained icon view reparent center(%@)", buf, 0xCu);
              }
              objc_msgSend(v14, "setCenter:", v22, v24);
            }
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v9);
    }
  }
  if (self->_widgetIntroductionPopover) {
    [(SBIconListView *)self bringWidgetIntroductionPopoverToFront];
  }
}

- (double)_topSpacingForWidgetIntroductionPopoverView
{
  if ([(SBIconListView *)self isWidgetIntroductionVertical])
  {
    int64_t v3 = [(SBIconListView *)self layoutOrientation];
    double result = 70.0;
    if ((unint64_t)(v3 - 1) < 2) {
      return 50.0;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    double v7 = 33.0;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v7 = 15.0;
    }
    return self->_widgetIntroductionPopOverTopAnchorOffset + v7;
  }
  return result;
}

- (double)_leadingSpacingForWidgetIntroductionPopoverView
{
  unint64_t v3 = [(SBIconListView *)self layoutOrientation] - 1;
  [(SBIconListView *)self frame];
  double result = v4 / 3.0 + 50.0;
  if (v3 <= 1) {
    return v4 * 0.5 + 15.0;
  }
  return result;
}

- (void)removePronouncedContainerView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(SBIconListView *)self stopAnimatingPronouncedContainerAndPopoverView];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v3 = [(SBIconWidgetIntroductionView *)self->_pronouncedContainerView subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SBIconListView *)self addSubview:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  widgetIntroductionPopover = self->_widgetIntroductionPopover;
  if (widgetIntroductionPopover)
  {
    [(SBIconWidgetIntroductionPopoverView *)widgetIntroductionPopover removeFromSuperview];
    uint64_t v10 = self->_widgetIntroductionPopover;
    self->_widgetIntroductionPopover = 0;
  }
  pronouncedContainerView = self->_pronouncedContainerView;
  if (pronouncedContainerView)
  {
    [(SBIconWidgetIntroductionView *)pronouncedContainerView removeFromSuperview];
    uint64_t v12 = self->_pronouncedContainerView;
    self->_pronouncedContainerView = 0;
  }
  objc_storeWeak((id *)&self->_widgetIntroductionDelegate, 0);
  [(SBIconListView *)self setIconsNeedLayout];
}

- (void)bringWidgetIntroductionPopoverToFront
{
}

- (void)startAnimatingPronouncedContainerAndPopoverView
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__SBIconListView_startAnimatingPronouncedContainerAndPopoverView__block_invoke;
  v2[3] = &unk_1E6AAC810;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:30 delay:v2 options:0 animations:0.65 completion:0.0];
}

uint64_t __65__SBIconListView_startAnimatingPronouncedContainerAndPopoverView__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pronouncedContainerView];
  CGAffineTransformMakeScale(&v8, 1.01, 1.01);
  [v2 setTransform:&v8];

  int v3 = [*(id *)(a1 + 32) isWidgetIntroductionVertical];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 widgetIntroductionPopoverLeadingAnchorConstraint];
    [*(id *)(a1 + 32) _leadingSpacingForWidgetIntroductionPopoverView];
  }
  else
  {
    uint64_t v5 = [v4 widgetIntroductionPopoverTopAnchorConstraint];
    [*(id *)(a1 + 32) _topSpacingForWidgetIntroductionPopoverView];
  }
  [v5 setConstant:v6 + 2.0];

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)stopAnimatingPronouncedContainerAndPopoverView
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__SBIconListView_stopAnimatingPronouncedContainerAndPopoverView__block_invoke;
  v2[3] = &unk_1E6AAC810;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v2 options:0 animations:0.5 completion:0.0];
}

uint64_t __64__SBIconListView_stopAnimatingPronouncedContainerAndPopoverView__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pronouncedContainerView];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v8];

  int v4 = [*(id *)(a1 + 32) isWidgetIntroductionVertical];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    double v6 = [v5 widgetIntroductionPopoverLeadingAnchorConstraint];
    [*(id *)(a1 + 32) _leadingSpacingForWidgetIntroductionPopoverView];
  }
  else
  {
    double v6 = [v5 widgetIntroductionPopoverTopAnchorConstraint];
    [*(id *)(a1 + 32) _topSpacingForWidgetIntroductionPopoverView];
  }
  objc_msgSend(v6, "setConstant:");

  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (SBIconListViewDragDelegate)effectiveDragDelegate
{
  long long v3 = [(SBIconListView *)self dragDelegate];
  if (!v3)
  {
    long long v3 = [(SBIconListViewReorderingManager *)self->_reorderingManager reorderingDragDelegate];
  }
  return (SBIconListViewDragDelegate *)v3;
}

- (id)beginTransitionToIconLocation:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGAffineTransform v8 = [(SBIconListView *)self iconLocation];
  char v9 = BSEqualObjects();

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [[SBIconListViewIconLocationTransitionHandler alloc] initWithIconLocation:v6 reason:v7 iconListView:self];
    [(SBIconListView *)self setCurrentIconLocationTransitionHandler:v10];
    [(SBIconListView *)self setAlignsIconsOnPixelBoundaries:0];
    [(SBIconListView *)self setIconsNeedLayout];
  }

  return v10;
}

- (BOOL)isTransitioningIconLocation
{
  uint64_t v2 = [(SBIconListView *)self currentIconLocationTransitionHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)iconLocationTransitionHandler:(id)a3 setProgress:(double)a4
{
  id v5 = a3;
  id v6 = [(SBIconListView *)self currentIconLocationTransitionHandler];

  if (v6 == v5)
  {
    [(SBIconListView *)self layoutIconsNow];
  }
}

- (void)iconLocationTransitionHandler:(id)a3 completeTransition:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  id v6 = [(SBIconListView *)self currentIconLocationTransitionHandler];

  id v7 = v9;
  if (v6 == v9)
  {
    if (v4)
    {
      CGAffineTransform v8 = [v9 iconLocation];
      [(SBIconListView *)self setIconLocation:v8];
    }
    [(SBIconListView *)self setCurrentIconLocationTransitionHandler:0];
    [(SBIconListView *)self setAlignsIconsOnPixelBoundaries:1];
    [(SBIconListView *)self layoutIconsNow];
    id v7 = v9;
  }
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientatiouint64_t n = a3;
    if (!self->_rotating)
    {
      [(SBIconListView *)self setIconsNeedLayout];
      [(SBIconListView *)self updateReversedLayoutBasedOnOrientation];
    }
  }
}

- (void)willRotateWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListView *)self _window];
  uint64_t v70 = [v5 _toWindowOrientation];
  if (v70 == [(SBIconListView *)self orientation])
  {
    id v6 = SBLogIcon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7F0A000, v6, OS_LOG_TYPE_INFO, "Trying to rotate an icon list view to the orientation it already is; ignoring",
        buf,
        2u);
    }

    goto LABEL_59;
  }
  if (!self->_rotating)
  {
    CGAffineTransform v8 = [(SBIconListView *)self layout];
    BOOL v9 = [(SBIconListView *)self isDisplayingWidgetIntroduction];
    uint64_t v10 = [(SBIconListView *)self widgetIntroductionDelegate];
    if (v9) {
      [(SBIconListView *)self removePronouncedContainerView];
    }
    double v11 = _os_activity_create(&dword_1D7F0A000, "IconListView rotation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    *(void *)buf = 0;
    uint64_t v94 = buf;
    uint64_t v95 = 0x3010000000;
    v97.opaque[0] = 0;
    v97.opaque[1] = 0;
    uint64_t v96 = &unk_1D821E08B;
    os_activity_scope_enter(v11, &v97);
    self->_rotating = 1;
    uint64_t v66 = [(SBIconListView *)self displayedModel];
    unint64_t v12 = [v8 numberOfColumnsForOrientation:self->_orientation];
    CGRect v53 = v5;
    CGRect v54 = (void *)v10;
    BOOL v55 = v9;
    CGRect v52 = v11;
    unint64_t v13 = [v8 numberOfColumnsForOrientation:v70];
    unint64_t v14 = v13;
    if (v12 <= v13) {
      unint64_t v15 = v13;
    }
    else {
      unint64_t v15 = v12;
    }
    unint64_t v59 = v15;
    uint64_t v68 = self;
    unint64_t v16 = [v8 numberOfRowsForOrientation:self->_orientation];
    CGRect v51 = v8;
    unint64_t v17 = [v8 numberOfRowsForOrientation:v70];
    unint64_t v18 = v17;
    if (v16 <= v17) {
      unint64_t v19 = v17;
    }
    else {
      unint64_t v19 = v16;
    }
    unint64_t v60 = v19;
    unint64_t v72 = [v66 numberOfIcons];
    CGFloat v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v72];
    id v63 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v62 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    BOOL v57 = [(SBIconListView *)v68 isRTL];
    unint64_t v21 = [(id)objc_opt_class() rotationAnchor];
    uint64_t v22 = 1;
    if ((v21 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
      uint64_t v22 = -1;
    }
    uint64_t v58 = v22;
    uint64_t v23 = -1;
    if (v21 <= 1) {
      uint64_t v23 = 1;
    }
    uint64_t v69 = v23;
    CGRect v56 = [(SBIconListView *)v68 iconLocation];
    double v24 = [(SBIconListView *)v68 layoutMetrics];
    uint64_t v67 = (void *)[v24 copy];

    double v65 = [(SBIconListView *)v68 layoutMetricsForOrientation:v70];
    double v25 = (void *)[v67 copy];
    CGRect v50 = v4;
    uint64_t v26 = [v25 columns];
    uint64_t v27 = [v25 rows];
    unint64_t v28 = v59 - v26;
    if ((uint64_t)(v59 - v26) >= 1)
    {
      long long v29 = [v25 gridCellInfo];
      [v29 addEmptyColumns:v28];
    }
    if ((uint64_t)(v60 - v27) >= 1)
    {
      long long v30 = [v25 gridCellInfo];
      objc_msgSend(v30, "addEmptyRows:", v60 - objc_msgSend(v25, "rows"));
    }
    [v25 setColumns:v59];
    [v25 setRows:v60];
    if (v57) {
      uint64_t v31 = -(uint64_t)v28;
    }
    else {
      uint64_t v31 = 0;
    }
    [v25 setColumnOffset:v31];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke;
    aBlock[3] = &unk_1E6AB0F38;
    unint64_t v90 = v12;
    unint64_t v91 = v18;
    unint64_t v92 = v14;
    unint64_t v89 = v16;
    void aBlock[4] = v68;
    id v48 = v25;
    id v86 = v48;
    id v87 = v56;
    id v49 = v20;
    id v88 = v49;
    BOOL v64 = (void (**)(void *, void *, void *, uint64_t, uint64_t))_Block_copy(aBlock);
    if (!v60) {
      goto LABEL_58;
    }
    uint64_t v32 = 0;
    unint64_t v71 = 0;
    unint64_t v33 = 0;
    uint64_t v34 = v58;
    while (1)
    {
      if (v33 == v71 && v33 >= v72) {
        goto LABEL_58;
      }
      uint64_t v61 = v32;
      unint64_t v35 = v59;
      uint64_t v36 = v69;
      if (!v59) {
        goto LABEL_57;
      }
      while (v33 != v71 || v33 < v72)
      {
        unint64_t v37 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](v68, "indexForCoordinate:forOrientation:metrics:", v36, v34, v68->_orientation, v67, v48, v49);
        unint64_t v38 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](v68, "indexForCoordinate:forOrientation:metrics:", v36, v34, v70, v65);
        if (v37 >= v72) {
          goto LABEL_39;
        }
        unint64_t v39 = [v66 iconAtIndex:v37];
        if (v39)
        {
          if (![v63 containsObject:v39])
          {
            [v63 addObject:v39];
            ++v33;
            goto LABEL_40;
          }

LABEL_39:
          unint64_t v39 = 0;
        }
LABEL_40:
        if (v38 < v72)
        {
          CGRect v40 = [v66 iconAtIndex:v38];
          if (v40)
          {
            if (![v62 containsObject:v40])
            {
              [v62 addObject:v40];
              ++v71;
              BOOL v42 = v39 != 0;
              int v41 = 1;
LABEL_48:
              CGRect v43 = [v39 gridSizeClass];
              uint64_t v44 = [v40 gridSizeClass];
              CGRect v45 = (void *)v44;
              if ((v41 & v42) != 1 || v43 == (void *)v44 || [v43 isEqualToString:v44])
              {
                v64[2](v64, v39, v40, v36, v34);
              }
              else
              {
                v64[2](v64, v39, 0, v36, v34);
                v64[2](v64, 0, v40, v36, v34);
              }

              goto LABEL_54;
            }
          }
        }
        if (v39)
        {
          int v41 = 0;
          CGRect v40 = 0;
          BOOL v42 = 1;
          goto LABEL_48;
        }
LABEL_54:

        v36 += v69;
        if (!--v35) {
          goto LABEL_57;
        }
      }
      unint64_t v33 = v71;
LABEL_57:
      uint64_t v32 = v61 + 1;
      v34 += v58;
      if (v61 + 1 == v60)
      {
LABEL_58:
        v79[0] = MEMORY[0x1E4F143A8];
        v79[1] = 3221225472;
        v79[2] = __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_2;
        v79[3] = &unk_1E6AB0F60;
        v79[4] = v68;
        uint64_t v81 = v70;
        unint64_t v82 = v59;
        unint64_t v83 = v60;
        BOOL v84 = v57;
        id v80 = v49;
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_3;
        v73[3] = &unk_1E6AB0F88;
        id v46 = v80;
        id v74 = v46;
        int v75 = v68;
        BOOL v78 = v55;
        id v47 = v54;
        id v76 = v47;
        id v77 = buf;
        id v4 = v50;
        [v50 animateAlongsideTransition:v79 completion:v73];

        _Block_object_dispose(buf, 8);
        id v5 = v53;
        goto LABEL_59;
      }
    }
  }
  id v7 = SBLogIcon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7F0A000, v7, OS_LOG_TYPE_DEFAULT, "Trying to rotate an icon list view that is already rotating; ignoring",
      buf,
      2u);
  }

  [(SBIconListView *)self setOrientation:v70];
  [(SBIconListView *)self setIconsNeedLayout];
LABEL_59:
}

void __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke(uint64_t a1, void *a2, void *a3, unint64_t a4, unint64_t a5)
{
  id v27 = a2;
  id v9 = a3;
  if (v27 == v9)
  {
    uint64_t v11 = 0;
    BOOL v10 = 0;
    if (v27) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v27)
    {
      if (v9)
      {
        BOOL v10 = 0;
        uint64_t v11 = 3;
      }
      else if (a5 >= *(void *)(a1 + 80))
      {
        uint64_t v11 = 1;
        BOOL v10 = 1;
      }
      else
      {
        BOOL v10 = a4 >= *(void *)(a1 + 88);
        uint64_t v11 = 1;
      }
LABEL_16:
      unint64_t v12 = [v27 gridSizeClass];
      if (v9) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    BOOL v10 = a5 >= *(void *)(a1 + 64) || a4 >= *(void *)(a1 + 72);
    uint64_t v11 = 2;
  }
  unint64_t v12 = [v9 gridSizeClass];
  if (!v9) {
    goto LABEL_20;
  }
LABEL_17:
  if (v12 == @"SBHIconGridSizeClassDefault"
    || -[__CFString isEqualToString:](v12, "isEqualToString:"))
  {
    objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellAtCoordinate:metrics:", a4, a5, *(void *)(a1 + 40));
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "originForIconAtCoordinate:metrics:", a4, a5, *(void *)(a1 + 40));
  double v14 = v21;
  double v16 = v22;
  [*(id *)(a1 + 32) iconImageSizeForGridSizeClass:v12];
  double v18 = v23;
  double v20 = v24;
LABEL_21:
  LOBYTE(v26) = v10;
  double v25 = -[SBIconRotationContainer initWithFrame:startIcon:endIcon:listView:coordinate:location:transitionAnimation:offscreen:]([SBIconRotationContainer alloc], "initWithFrame:startIcon:endIcon:listView:coordinate:location:transitionAnimation:offscreen:", v27, v9, *(void *)(a1 + 32), a4, a5, *(void *)(a1 + 48), v14, v16, v18, v20, v11, v26);
  [(SBIconRotationContainer *)v25 prepareToTransition];
  [*(id *)(a1 + 56) addObject:v25];
  [*(id *)(a1 + 32) addSubview:v25];
}

void __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setOrientation:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 544);
  *(void *)(v2 + 544) = 0;

  id v4 = [*(id *)(a1 + 32) layoutMetrics];
  id v5 = (void *)[v4 copy];

  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = v6 - [v5 columns];
  CGAffineTransform v8 = [v5 gridCellInfo];
  [v8 addEmptyColumns:v7];

  id v9 = [v5 gridCellInfo];
  objc_msgSend(v9, "addEmptyRows:", *(void *)(a1 + 64) - objc_msgSend(v5, "rows"));

  [v5 setColumns:*(void *)(a1 + 56)];
  [v5 setRows:*(void *)(a1 + 64)];
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v10 = -v7;
  }
  else {
    uint64_t v10 = 0;
  }
  [v5 setColumnOffset:v10];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = *(id *)(a1 + 40);
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
        double v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v17 = objc_msgSend(v16, "startIcon", (void)v23);
        double v18 = [v16 endIcon];
        double v19 = v18;
        if (v17)
        {
          double v20 = [v17 gridSizeClass];
          uint64_t v22 = [v16 coordinate];
          if (v19) {
            goto LABEL_11;
          }
        }
        else
        {
          double v20 = [v18 gridSizeClass];
          uint64_t v22 = [v16 coordinate];
          if (!v19)
          {
LABEL_11:
            objc_msgSend(*(id *)(a1 + 32), "centerForIconCoordinate:metrics:", v22, v21, v5);
            goto LABEL_14;
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellsOfSizeClass:startingAtCoordinate:metrics:", v20, v22, v21, v5);
        UIRectGetCenter();
LABEL_14:
        objc_msgSend(v16, "setCenter:");
        [v16 performTransition];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

void __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "concludeTransition", (void)v8);
        [v7 removeFromSuperview];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  *(unsigned char *)(*(void *)(a1 + 40) + 418) = 0;
  [*(id *)(a1 + 40) layoutIconsNow];
  if (*(unsigned char *)(a1 + 64)) {
    objc_msgSend(*(id *)(a1 + 40), "addPronouncedContainerViewWithDelegate:vertical:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "isWidgetIntroductionVertical"));
  }
  os_activity_scope_leave((os_activity_scope_state_t)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
}

- (BOOL)_allowsFocusToLeaveViaHeading:(unint64_t)a3
{
  return (a3 & 0x330) == 0;
}

SBHFocusGuideView *__35__SBIconListView_layoutFocusGuides__block_invoke(id *a1)
{
  if ([a1[4] count])
  {
    id v2 = [a1[4] lastObject];
    [a1[4] removeLastObject];
  }
  else
  {
    id v2 = objc_alloc_init(SBHFocusGuideView);
    [a1[5] addSubview:v2];
  }
  [a1[6] addObject:v2];
  return v2;
}

void __35__SBIconListView_layoutFocusGuides__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellAtCoordinate:metrics:", a2, a3, *(void *)(a1 + 40));
  double v11 = v10;
  uint64_t v12 = 56;
  if (a6) {
    uint64_t v12 = 64;
  }
  double v13 = *(double *)(a1 + v12);
  double v14 = *(double *)(a1 + 72);
  double v15 = objc_msgSend(*(id *)(a1 + 32), "iconAtCoordinate:metrics:", a4, a5, *(void *)(a1 + 40));
  if (v15)
  {
    double v19 = v15;
    uint64_t v16 = [*(id *)(a1 + 32) displayedIconViewForIcon:v15];
    double v15 = v19;
    if (v16)
    {
      double v17 = (void *)v16;
      double v18 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      objc_msgSend(v18, "setFrame:", v13, v11, 10.0, v14);
      [v18 setTargetView:v17];

      double v15 = v19;
    }
  }
}

- (BOOL)_iconMatchingCoordinateBeginsInThatRow:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row = a3.row;
  uint64_t v6 = -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", a3.column, a3.row, a4);
  [(SBIconListView *)self coordinateForIcon:v6];
  LOBYTE(row) = v7 == row;

  return row;
}

- (SBIconCoordinate)_coordinateBeforeCoordinate:(SBIconCoordinate)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 metrics:(id)a6
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  id v10 = a6;
  if (column < 2)
  {
    if (row < 2)
    {
      int64_t row = 0x7FFFFFFFFFFFFFFFLL;
      a5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (!-[SBIconListView _iconMatchingCoordinateBeginsInThatRow:metrics:](self, "_iconMatchingCoordinateBeginsInThatRow:metrics:", a5, --row, v10))
    {
      double v11 = -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", a5, row, v10);
      uint64_t v12 = v11;
      if (v11)
      {
        double v13 = [v11 gridSizeClass];
        uint64_t v14 = (unsigned __int16)[(SBIconListView *)self iconGridSizeForClass:v13];
      }
      else
      {
        uint64_t v14 = 1;
      }
      a5 -= v14;
    }
  }
  else
  {
    a5 = column - 1;
  }

  unint64_t v15 = a5;
  int64_t v16 = row;
  result.int64_t row = v16;
  result.int64_t column = v15;
  return result;
}

- (SBIconCoordinate)_coordinateAfterCoordinate:(SBIconCoordinate)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 metrics:(id)a6
{
  unint64_t row = a3.row;
  unint64_t column = a3.column;
  id v11 = a6;
  if (column >= a5)
  {
    if (row >= a4)
    {
      unint64_t row = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      ++row;
      uint64_t v12 = 1;
      if (!-[SBIconListView _iconMatchingCoordinateBeginsInThatRow:metrics:](self, "_iconMatchingCoordinateBeginsInThatRow:metrics:", 1, row, v11))
      {
        double v13 = -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", 1, row, v11);
        uint64_t v14 = v13;
        if (v13)
        {
          unint64_t v15 = [v13 gridSizeClass];
          uint64_t v12 = (unsigned __int16)[(SBIconListView *)self iconGridSizeForClass:v15]+ 1;
        }
        else
        {
          uint64_t v12 = 2;
        }
      }
    }
  }
  else
  {
    uint64_t v12 = column + 1;
  }

  int64_t v16 = v12;
  int64_t v17 = row;
  result.unint64_t row = v17;
  result.unint64_t column = v16;
  return result;
}

- (id)addPlaceholderAtGridCellIndex:(unint64_t)a3 gridSizeClass:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(SBIconListView *)self model];
  [(SBIconListView *)self gridCellInfoOptions];
  double v13 = SBLogIcon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(SBIconListView *)self gridSizeClassDomain];
    unint64_t v15 = [v14 descriptionForGridSizeClass:v10];
    int v21 = 134218754;
    uint64_t v22 = self;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2114;
    long long v26 = v15;
    __int16 v27 = 2114;
    id v28 = v11;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%p: add placeholder at grid cell index %lu size '%{public}@ reason %{public}@", (uint8_t *)&v21, 0x2Au);
  }
  int64_t v16 = [[SBIconListViewPlaceholderAssertion alloc] initWithGridCellIndex:a3 gridSizeClass:v10 reason:v11 options:a6 listView:self];
  placeholderAssertions = self->_placeholderAssertions;
  if (!placeholderAssertions)
  {
    double v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v19 = self->_placeholderAssertions;
    self->_placeholderAssertions = v18;

    placeholderAssertions = self->_placeholderAssertions;
  }
  [(NSHashTable *)placeholderAssertions addObject:v16];
  [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  [(SBIconListView *)self _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged];

  return v16;
}

- (id)addPlaceholderRepresentingIcon:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(SBIconListView *)self displayedModel];
  uint64_t v11 = [v10 indexForIcon:v8];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [(SBIconListView *)self model];
    uint64_t v13 = [v12 indexForIcon:v8];
    uint64_t v14 = objc_msgSend(v12, "gridCellInfoWithOptions:", -[SBIconListView gridCellInfoOptions](self, "gridCellInfoOptions"));
    uint64_t v15 = [v14 gridCellIndexForIconIndex:v13];
  }
  else
  {
    uint64_t v16 = v11;
    uint64_t v12 = [(SBIconListView *)self gridCellInfo];
    uint64_t v15 = [v12 gridCellIndexForIconIndex:v16];
  }

  int64_t v17 = [(SBIconListView *)self addPlaceholderAtGridCellIndex:v15 representingIcon:v8 reason:v9 options:a5];

  return v17;
}

- (id)addPlaceholderAtGridCellIndex:(unint64_t)a3 representingIcon:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(SBIconListView *)self model];
  [(SBIconListView *)self gridCellInfoOptions];
  uint64_t v13 = SBLogIcon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218754;
    double v20 = self;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2114;
    id v26 = v11;
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%p: add placeholder for icon %@ at grid cell index %lu reason %{public}@", (uint8_t *)&v19, 0x2Au);
  }

  uint64_t v14 = [[SBIconListViewPlaceholderAssertion alloc] initWithGridCellIndex:a3 representedIcon:v10 reason:v11 options:a6 listView:self];
  placeholderAssertions = self->_placeholderAssertions;
  if (!placeholderAssertions)
  {
    uint64_t v16 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int64_t v17 = self->_placeholderAssertions;
    self->_placeholderAssertions = v16;

    placeholderAssertions = self->_placeholderAssertions;
  }
  [(NSHashTable *)placeholderAssertions addObject:v14];
  [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  [(SBIconListView *)self _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged];

  return v14;
}

- (void)placeholderAssertionDidChangePosition:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    id v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = [v4 gridCellIndex];
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%p: placeholder %p did change position to grid cell index %lu", (uint8_t *)&v6, 0x20u);
  }

  if ([(NSHashTable *)self->_placeholderAssertions containsObject:v4]) {
    [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  }
}

- (void)removePlaceholderAssertion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134218496;
    __int16 v10 = self;
    __int16 v11 = 2048;
    id v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = [v4 gridCellIndex];
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%p: remove placeholder %p from grid cell index %lu", (uint8_t *)&v9, 0x20u);
  }

  if ([(NSHashTable *)self->_placeholderAssertions containsObject:v4])
  {
    int v6 = [v4 placeholderIcon];
    if (v6)
    {
      uint64_t v7 = [(SBIconListView *)self removedIcons];
      [v7 addObject:v6];
    }
    [(NSHashTable *)self->_placeholderAssertions removeObject:v4];
    if (![(NSHashTable *)self->_placeholderAssertions count])
    {
      placeholderAssertions = self->_placeholderAssertions;
      self->_placeholderAssertions = 0;
    }
    [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
    [(SBIconListView *)self _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged];
  }
}

- (void)_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_layoutObservers;
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
        __int16 v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v8, "iconListViewDidChangeNumberOfPlaceholdersOrLayoutHiddenIcons:", self, (void)v9);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (unint64_t)gridCellIndexForFirstPlaceholder
{
  id v2 = [(NSHashTable *)self->_placeholderAssertions objectEnumerator];
  uint64_t v3 = [v2 nextObject];

  if (v3) {
    unint64_t v4 = [v3 effectiveGridCellIndex];
  }
  else {
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v10 = SBLogIcon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v9;
    __int16 v33 = 2048;
    unint64_t v34 = a5;
    _os_log_impl(&dword_1D7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%p: begin hiding icons %@ for reason '%{public}@' options: %lx", buf, 0x2Au);
  }

  long long v11 = [[SBHIconLayoutHidingAssertion alloc] initWithDelegate:self icons:v8 reason:v9 options:a5];
  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    __int16 v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v14 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v13;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  [(NSHashTable *)layoutHidingAssertions addObject:v11];
  [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  if (a5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          [v20 setAlpha:0.0];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v17);
    }
  }
  if ((a5 & 2) != 0) {
    [(SBIconListView *)self layoutIconsIfNeededWithAnimationType:0 options:0];
  }
  [(SBIconListView *)self _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged];

  return v11;
}

- (void)layoutHidingAssertionDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 icons];
    int v7 = 134218498;
    id v8 = self;
    __int16 v9 = 2048;
    id v10 = v4;
    __int16 v11 = 2112;
    long long v12 = v6;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%p: icon hiding assertion %p did change icons %@", (uint8_t *)&v7, 0x20u);
  }
  if ([(NSHashTable *)self->_layoutHidingAssertions containsObject:v4])
  {
    [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
    [(SBIconListView *)self _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged];
  }
}

- (void)layoutHidingAssertionDidInvalidate:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SBLogIcon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    id v8 = self;
    __int16 v9 = 2048;
    id v10 = v4;
    _os_log_impl(&dword_1D7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%p: remove icon hiding assertion %p", (uint8_t *)&v7, 0x16u);
  }

  if ([(NSHashTable *)self->_layoutHidingAssertions containsObject:v4])
  {
    [(NSHashTable *)self->_layoutHidingAssertions removeObject:v4];
    if (![(NSHashTable *)self->_layoutHidingAssertions count])
    {
      layoutHidingAssertions = self->_layoutHidingAssertions;
      self->_layoutHidingAssertions = 0;
    }
    [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
    [(SBIconListView *)self _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged];
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_iconSettings == a3) {
    [(SBIconListView *)self _applyIconPaddingSettings];
  }
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5 = a4;
  [v5 addObserver:self];
  uint64_t v6 = [(SBIconListView *)self removedIcons];
  [v6 removeObject:v5];

  [(SBIconListView *)self updateIconViewForIcon:v5 toIcon:v5];
  [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  [(SBIconListView *)self setIconsNeedLayout];
  [(SBIconListView *)self invalidateIntrinsicContentSize];
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  __int16 v9 = [(SBIconListView *)self removedIcons];
  [v9 addObject:v8];

  id v10 = [(SBIconListView *)self removedIcons];
  [v10 removeObject:v7];

  [v8 removeObserver:self];
  [(SBIconListView *)self updateIconViewForIcon:v8 toIcon:v7];

  [v7 addObserver:self];
  [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  [(SBIconListView *)self setIconsNeedLayout];
  [(SBIconListView *)self invalidateIntrinsicContentSize];
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [v5 removeObserver:self];
  uint64_t v6 = [(SBIconListView *)self removedIcons];
  [v6 addObject:v5];

  [(SBIconListView *)self _removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:v5];
  [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  [(SBIconListView *)self setIconsNeedLayout];
  [(SBIconListView *)self invalidateIntrinsicContentSize];
  v8[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [(SBIconListView *)self _cleanupIconViewsForRemovedIcons:v7];
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  [(SBIconListView *)self regenerateTemporaryDisplayedModelIfNecessary];
  [(SBIconListView *)self setIconsNeedLayout];
}

- (void)iconView:(id)a3 willCancelDragForItem:(id)a4
{
  id v5 = a3;
  if (-[NSMutableSet containsObject:](self->_draggingIconViews, "containsObject:"))
  {
    [(SBIconListView *)self setCanceledDraggingIconView:v5];
    [(SBIconListView *)self restoreDraggedIconView:v5];
  }
}

- (void)iconViewDidEndDrag:(id)a3
{
  id v8 = a3;
  if (-[NSMutableSet containsObject:](self->_draggingIconViews, "containsObject:"))
  {
    [(NSMutableSet *)self->_draggingIconViews removeObject:v8];
    id v4 = [v8 superview];

    if (v4 == self)
    {
      [v8 setAlpha:1.0];
      id v5 = [v8 icon];
      id v6 = [(SBIconListView *)self canceledDraggingIconView];

      if (v6 == v8)
      {
        [(SBIconListView *)self setCanceledDraggingIconView:0];
      }
      else if (!v5 {
             || ([(SBIconListView *)self displayedIconViewForIcon:v5],
      }
                 id v7 = (id)objc_claimAutoreleasedReturnValue(),
                 v7,
                 v7 != v8))
      {
        [(SBIconListView *)self removeIconView:v8];
      }
    }
  }
}

- (void)_captureOnlyBackgroundAssertionDidInvalidate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v17 = v4;
    id v5 = self;
    objc_sync_enter(v5);
    iconsToCaptureOnlyBackgroundAssertions = v5->_iconsToCaptureOnlyBackgroundAssertions;
    id v7 = [v17 icon];
    [(NSMapTable *)iconsToCaptureOnlyBackgroundAssertions removeObjectForKey:v7];

    id v8 = [v17 groupName];
    __int16 v9 = [(NSMapTable *)v5->_iconsToCaptureOnlyBackgroundAssertions objectEnumerator];
    id v10 = 0;
    do
    {
      uint64_t v11 = [v9 nextObject];

      if (!v11) {
        break;
      }
      long long v12 = [v11 groupName];
      char v13 = [v12 isEqualToString:v8];

      id v10 = v11;
    }
    while ((v13 & 1) == 0);
    if ([(NSMapTable *)v5->_iconsToCaptureOnlyBackgroundAssertions count])
    {
      if (!v11) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v14 = v5->_iconsToCaptureOnlyBackgroundAssertions;
      v5->_iconsToCaptureOnlyBackgroundAssertions = 0;

      if (!v11)
      {
LABEL_9:
        id v15 = [(NSMutableDictionary *)v5->_groupNamesToCaptureOnlyBackgroundViews objectForKey:v8];
        [v15 removeFromSuperview];
        [(NSMutableDictionary *)v5->_groupNamesToCaptureOnlyBackgroundViews removeObjectForKey:v8];
        if (![(NSMutableDictionary *)v5->_groupNamesToCaptureOnlyBackgroundViews count])
        {
          groupNamesToCaptureOnlyBackgroundViews = v5->_groupNamesToCaptureOnlyBackgroundViews;
          v5->_groupNamesToCaptureOnlyBackgroundViews = 0;
        }
      }
    }

    objc_sync_exit(v5);
    id v4 = v17;
  }
}

void __82__SBIconListView__insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _captureOnlyBackgroundAssertionDidInvalidate:v3];
}

- (void)_addIconViewsForIcons:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconListView *)self layoutMetrics];
  [(SBIconListView *)self _addIconViewsForIcons:v4 metrics:v5];
}

- (void)_cleanupIconViewsForRemovedIcons:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(NSMapTable *)self->_iconViews objectForKey:v9];
        uint64_t v11 = v10;
        if (v10)
        {
          long long v12 = [v10 superview];

          if (!v12)
          {
            [(NSMapTable *)self->_iconViews removeObjectForKey:v9];
            [(SBIconListView *)self removeIconView:v11];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __45__SBIconListView__setupLayoutRunLoopObserver__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained layoutIconsIfNeeded];
}

- (void)updateIconViewForIcon:(id)a3 toIcon:(id)a4
{
  id v6 = a4;
  id v11 = [(SBIconListView *)self temporarilyMappedIconForIcon:a3];
  id v7 = [(SBIconListView *)self temporarilyMappedIconForIcon:v6];

  id v8 = [(NSMapTable *)self->_iconViews objectForKey:v11];
  if (v7 == v11)
  {
    BOOL v10 = 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v9 = [(NSMapTable *)self->_iconViews objectForKey:v7];

    BOOL v10 = v9 != 0;
    if (!v8) {
      goto LABEL_7;
    }
  }
  if (!v10)
  {
    [(NSMapTable *)self->_iconViews removeObjectForKey:v11];
    [(SBIconListView *)self configureIconView:v8 forIcon:v7];
    [(NSMapTable *)self->_iconViews setObject:v8 forKey:v7];
  }
LABEL_7:
}

- (void)forgetIconView:(id)a3
{
  id v5 = a3;
  if (-[SBIconListView isDisplayingIconView:](self, "isDisplayingIconView:"))
  {
    id v4 = [v5 icon];
    [(NSMapTable *)self->_iconViews removeObjectForKey:v4];
    [(NSMutableSet *)self->_draggingIconViews removeObject:v5];
    [(SBIconListView *)self setIconsNeedLayout];
  }
}

- (id)_iconForDragItem:(id)a3
{
  id v4 = objc_msgSend(a3, "sbh_appDragLocalContext");
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 droppedIconIdentifier];
    if (!v6)
    {
      id v6 = [v5 uniqueIdentifier];
    }
    id v7 = [(SBIconListView *)self model];
    id v8 = [v7 iconWithIdentifier:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)restoreDraggedIconView:(id)a3
{
  id v4 = a3;
  id v5 = [v4 superview];

  if (v5 == self)
  {
    id v7 = [v4 icon];
    if (v7)
    {
      uint64_t v8 = [(SBIconListView *)self displayedIconViewForIcon:v7];
      uint64_t v9 = (void *)v8;
      BOOL v6 = v8 != (void)v4;
      if ((id)v8 != v4)
      {
        if (v8) {
          [(SBIconListView *)self removeIconView:v8];
        }
        [(SBIconListView *)self configureIconView:v4 forIcon:v7];
        [(NSMapTable *)self->_iconViews setObject:v4 forKey:v7];
        [v4 setAlpha:1.0];
        [(SBIconListView *)self centerForDraggedIconView:v4];
        objc_msgSend(v4, "setCenter:");
        [(NSMutableSet *)self->_draggingIconViews removeObject:v4];
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (CGPoint)centerForDraggedIconView:(id)a3
{
  id v4 = [a3 icon];
  id v5 = [(SBIconListView *)self model];
  BOOL v6 = [(SBIconListView *)self layoutMetricsForModel:v5];
  id v7 = [v6 gridCellInfo];
  uint64_t v8 = -[SBIconListView iconGridRangeForGridCellIndex:metrics:options:](self, "iconGridRangeForGridCellIndex:metrics:options:", objc_msgSend(v7, "gridCellIndexForIconIndex:", objc_msgSend(v5, "indexForIcon:", v4)), v6, 0);
  -[SBIconListView fullRectForGridRange:metrics:](self, "fullRectForGridRange:metrics:", v8, v9, v6);
  UIRectGetCenter();
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.CGFloat y = v15;
  result.CGFloat x = v14;
  return result;
}

- (void)clearDraggedIconViews
{
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  [(SBIconListView *)self clearDraggedIconViewsExcludingSet:v3];
}

- (void)clearDraggedIconViewsExcludingSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(NSMutableSet *)self->_draggingIconViews mutableCopy];
  [v5 intersectSet:v4];
  BOOL v6 = (void *)[(NSMutableSet *)self->_draggingIconViews mutableCopy];
  [v6 minusSet:v4];
  if ([v5 count]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong((id *)&self->_draggingIconViews, v7);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v14 = objc_msgSend(v13, "icon", (void)v16);
        if (!v14
          || ([(SBIconListView *)self displayedIconViewForIcon:v14],
              double v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              v15 != v13))
        {
          [(SBIconListView *)self removeIconView:v13 force:1];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [(SBIconListView *)self setCanceledDraggingIconView:0];
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListView *)self iconLocation];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [(SBIconListView *)self displayedIconViewForIcon:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListView *)self iconLocation];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    uint64_t v10 = [(SBIconListView *)self displayedIconViewForIcon:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListView *)self iconLocation];
  char v9 = [v7 containsObject:v8];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [(SBIconListView *)self displayedIconViewForIcon:v6];
  }

  return v10;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListView *)self iconLocation];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [(SBIconListView *)self displayedIconViewForIcon:v6];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListView *)self iconLocation];
  int v9 = [v7 containsObject:v8];

  if (v9)
  {
    uint64_t v10 = [(SBIconListView *)self displayedIconViewForIcon:v6];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v3 = [(SBIconListView *)self displayedIconViewForIcon:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SBIconListView *)self iconLocation];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [v6 superview];
    BOOL v11 = v10 == self;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v6 = [(SBIconListView *)self displayedIconViewForIcon:a3];
  if (v6) {
    v7[2](v7, v6);
  }
}

- (id)succinctDescription
{
  id v2 = [(SBIconListView *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIconListView *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = [(SBIconListView *)self succinctDescriptionBuilder];
  [(SBIconListView *)self frame];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"frame");
  id v6 = [(SBIconListView *)self model];
  id v7 = (id)[v4 appendObject:v6 withName:@"model"];

  id v8 = [(SBIconListView *)self temporaryModel];
  id v9 = (id)[v4 appendObject:v8 withName:@"temporaryModel" skipIfNil:1];

  id v10 = (id)[v4 appendObject:self->_iconLocation withName:@"iconLocation"];
  orientatiouint64_t n = self->_orientation;
  switch(orientation)
  {
    case 1:
      double v12 = @"UIInterfaceOrientationPortrait";
      break;
    case 3:
      double v12 = @"UIInterfaceOrientationLandscapeRight";
      break;
    case 4:
      double v12 = @"UIInterfaceOrientationLandscapeLeft";
      break;
    case 2:
      double v12 = @"UIInterfaceOrientationPortraitUpsideDown";
      break;
    default:
      double v12 = 0;
      break;
  }
  id v13 = (id)[v4 appendObject:v12 withName:@"orientation"];
  int64_t v14 = [(SBIconListView *)self layoutOrientation];
  if (v14 != self->_orientation)
  {
    double v15 = @"UIInterfaceOrientationLandscapeRight";
    long long v16 = @"UIInterfaceOrientationLandscapeLeft";
    long long v17 = @"UIInterfaceOrientationPortraitUpsideDown";
    if (v14 != 2) {
      long long v17 = 0;
    }
    if (v14 != 4) {
      long long v16 = v17;
    }
    if (v14 != 3) {
      double v15 = v16;
    }
    if (v14 == 1) {
      long long v18 = @"UIInterfaceOrientationPortrait";
    }
    else {
      long long v18 = v15;
    }
    id v19 = (id)[v4 appendObject:v18 withName:@"layoutOrientation"];
  }
  id v20 = (id)[v4 appendFloat:@"iconContentScale" withName:2 decimalPrecision:self->_iconContentScale];
  id v21 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListView iconRowsForCurrentOrientation](self, "iconRowsForCurrentOrientation"), @"iconRowsForCurrentOrientation");
  id v22 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListView iconColumnsForCurrentOrientation](self, "iconColumnsForCurrentOrientation"), @"iconColumnsForCurrentOrientation");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  id v24 = (id)[v4 appendObject:WeakRetained withName:@"layoutDelegate" skipIfNil:1];

  id v25 = (id)[v4 appendBool:self->_needsLayout withName:@"needsLayout" ifEqualTo:1];
  id v26 = (id)[v4 appendBool:self->_inLayout withName:@"inLayout" ifEqualTo:1];
  id v27 = (id)[v4 appendBool:self->_performingSpecialIconAnimations withName:@"performingSpecialIconAnimations" ifEqualTo:1];
  id v28 = (id)[v4 appendBool:self->_rotating withName:@"rotating" ifEqualTo:1];
  id v29 = (id)[v4 appendBool:self->_layoutReversed withName:@"layoutReversed" ifEqualTo:1];
  id v30 = (id)[v4 appendBool:self->_purged withName:@"purged" ifEqualTo:1];
  id v31 = (id)[v4 appendBool:self->_alignsIconsOnPixelBoundaries withName:@"alignsIconsOnPixelBoundaries" ifEqualTo:0];
  v43.NSUInteger location = [(SBIconListView *)self visibleColumnRange];
  id v32 = NSStringFromRange(v43);
  id v33 = (id)[v4 appendObject:v32 withName:@"visibleColumns"];

  v44.NSUInteger location = [(SBIconListView *)self visibleRowRange];
  unint64_t v34 = NSStringFromRange(v44);
  id v35 = (id)[v4 appendObject:v34 withName:@"visibleRows"];

  unint64_t column = self->_predictedVisibleColumn.column;
  if (column != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v37 = (id)[v4 appendUnsignedInteger:column withName:@"predictedVisibleColumn"];
    id v38 = (id)[v4 appendFloat:@"predictedVisibleColumnConfidence" withName:self->_predictedVisibleColumn.confidence];
  }
  unint64_t v39 = [(SBIconListView *)self currentIconLocationTransitionHandler];
  id v40 = (id)[v4 appendObject:v39 withName:@"currentIconLocationTransitionHandler" skipIfNil:1];

  return v4;
}

__CFString *__50__SBIconListView__setupStateCaptureHandleIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained _stateCaptureString];
  }
  else
  {
    id v3 = @"nil";
  }

  return v3;
}

- (id)_stateCaptureString
{
  id v3 = [(SBIconListView *)self descriptionBuilderWithMultilinePrefix:&stru_1F2FA0300];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SBIconListView__stateCaptureString__block_invoke;
  v7[3] = &unk_1E6AAEB78;
  id v8 = v3;
  id v4 = v3;
  [(SBIconListView *)self enumerateIconViewsUsingBlock:v7];
  id v5 = [v4 build];

  return v5;
}

void __37__SBIconListView__stateCaptureString__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__SBIconListView__stateCaptureString__block_invoke_2;
  v9[3] = &unk_1E6AACA90;
  id v10 = v7;
  id v11 = v6;
  id v8 = v6;
  [v10 appendBodySectionWithName:0 multilinePrefix:0 block:v9];
  *a4 = 1;
}

void __37__SBIconListView__stateCaptureString__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) icon];
  id v4 = [v3 displayName];
  [v2 appendString:v4 withName:@"Display Name"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) listLayout];
  id v7 = (id)[v5 appendObject:v6 withName:@"List Layout"];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) _labelHidingReason];
  [v8 appendString:v9 withName:@"Label Hiding Reason"];
}

- (void)_teardownStateCapture
{
  stateCaptureHandle = self->_stateCaptureHandle;
  if (stateCaptureHandle)
  {
    [(BSInvalidatable *)stateCaptureHandle invalidate];
    id v4 = self->_stateCaptureHandle;
    self->_stateCaptureHandle = 0;
  }
}

- (BOOL)isPurged
{
  return self->_purged;
}

- (void)setPurged:(BOOL)a3
{
  self->_purged = a3;
}

- (unint64_t)automaticallyReversedLayoutOrientations
{
  return self->_automaticallyReversedLayoutOrientations;
}

- (void)setAdjustsColumnPositionsForFullScreenWidth:(BOOL)a3
{
  self->_adjustsColumnPositionsForFullScreenWidth = a3;
}

- (void)setIconViewProvider:(id)a3
{
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (void)setBoundsSizeTracksContentSize:(BOOL)a3
{
  self->_boundsSizeTracksContentSize = a3;
}

- (BOOL)isDragSpringloadingEnabled
{
  return self->_dragSpringloadingEnabled;
}

- (void)setDragSpringloadingEnabled:(BOOL)a3
{
  self->_dragSpringloadingEnabled = a3;
}

- (SBIconListViewDragDelegate)dragDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragDelegate);
  return (SBIconListViewDragDelegate *)WeakRetained;
}

- (BOOL)allowsReordering
{
  return self->_allowsReordering;
}

- (SBIconListViewReorderingDelegate)reorderingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reorderingDelegate);
  return (SBIconListViewReorderingDelegate *)WeakRetained;
}

- (void)setReorderingDelegate:(id)a3
{
}

- (void)setIconDragTypeIdentifier:(id)a3
{
}

- (BOOL)wantsFastIconReordering
{
  return self->_wantsFastIconReordering;
}

- (void)setWantsFastIconReordering:(BOOL)a3
{
  self->_wantsFastIconReordering = a3;
}

- (BOOL)isOccluded
{
  return self->_occluded;
}

- (void)setCurrentIconLocationTransitionHandler:(id)a3
{
}

- (SBIconWidgetIntroductionDelegate)widgetIntroductionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetIntroductionDelegate);
  return (SBIconWidgetIntroductionDelegate *)WeakRetained;
}

- (void)setWidgetIntroductionDelegate:(id)a3
{
}

- (SBIconWidgetIntroductionView)pronouncedContainerView
{
  return self->_pronouncedContainerView;
}

- (void)setPronouncedContainerView:(id)a3
{
}

- (SBIconWidgetIntroductionPopoverView)widgetIntroductionPopover
{
  return self->_widgetIntroductionPopover;
}

- (void)setWidgetIntroductionPopover:(id)a3
{
}

- (NSLayoutConstraint)widgetIntroductionPopoverTopAnchorConstraint
{
  return self->_widgetIntroductionPopoverTopAnchorConstraint;
}

- (void)setWidgetIntroductionPopoverTopAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)widgetIntroductionPopoverLeadingAnchorConstraint
{
  return self->_widgetIntroductionPopoverLeadingAnchorConstraint;
}

- (void)setWidgetIntroductionPopoverLeadingAnchorConstraint:(id)a3
{
}

- (BOOL)isWidgetIntroductionVertical
{
  return self->_isWidgetIntroductionVertical;
}

- (void)setIsWidgetIntroductionVertical:(BOOL)a3
{
  self->_isWidgetIntroductionVertical = a3;
}

- (SBFolder)temporaryFolder
{
  return self->_temporaryFolder;
}

- (void)setTemporaryFolder:(id)a3
{
}

- (void)setTemporaryModel:(id)a3
{
}

- (NSString)iconLocationWithoutWidgets
{
  return self->_iconLocationWithoutWidgets;
}

- (void)setIconLocationWithoutWidgets:(id)a3
{
}

- (NSString)iconLocationWithWidgets
{
  return self->_iconLocationWithWidgets;
}

- (void)setIconLocationWithWidgets:(id)a3
{
}

- (SBIconView)canceledDraggingIconView
{
  return self->_canceledDraggingIconView;
}

- (void)setCanceledDraggingIconView:(id)a3
{
}

- (SBIcon)extraIconForFolderCollapseSpecialIconAnimation
{
  return self->_extraIconForFolderCollapseSpecialIconAnimation;
}

- (void)setExtraIconForFolderCollapseSpecialIconAnimation:(id)a3
{
}

- (void)setHasSetIconSpacingAxisMatchingBehavior:(BOOL)a3
{
  self->_hasSetIconSpacingAxisMatchingBehavior = a3;
}

- (void)setDisplayedModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedModel, 0);
  objc_storeStrong((id *)&self->_extraIconForFolderCollapseSpecialIconAnimation, 0);
  objc_storeStrong((id *)&self->_canceledDraggingIconView, 0);
  objc_storeStrong((id *)&self->_iconLocationWithWidgets, 0);
  objc_storeStrong((id *)&self->_iconLocationWithoutWidgets, 0);
  objc_storeStrong((id *)&self->_temporaryModel, 0);
  objc_storeStrong((id *)&self->_temporaryFolder, 0);
  objc_storeStrong((id *)&self->_widgetIntroductionPopoverLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_widgetIntroductionPopoverTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_widgetIntroductionPopover, 0);
  objc_storeStrong((id *)&self->_pronouncedContainerView, 0);
  objc_destroyWeak((id *)&self->_widgetIntroductionDelegate);
  objc_storeStrong((id *)&self->_currentIconLocationTransitionHandler, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconDragTypeIdentifier, 0);
  objc_destroyWeak((id *)&self->_reorderingDelegate);
  objc_destroyWeak((id *)&self->_dragDelegate);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_iconSettings, 0);
  objc_storeStrong((id *)&self->_wrappingFocusGuideViews, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_overridingLayoutDelegates, 0);
  objc_storeStrong((id *)&self->_layoutObservers, 0);
  objc_storeStrong((id *)&self->_reorderingManager, 0);
  objc_storeStrong((id *)&self->_draggingDelegate, 0);
  objc_storeStrong((id *)&self->_emptyGridCells, 0);
  objc_storeStrong((id *)&self->_draggingIconViews, 0);
  objc_storeStrong((id *)&self->_iconsToCaptureOnlyBackgroundAssertions, 0);
  objc_storeStrong((id *)&self->_groupNamesToCaptureOnlyBackgroundViews, 0);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_placeholderAssertions, 0);
  objc_storeStrong((id *)&self->_iconVisibilityAssertions, 0);
  objc_storeStrong((id *)&self->_pausedLayoutAssertionsForIconViews, 0);
  objc_storeStrong((id *)&self->_specialIconAnimations, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
}

- (void)performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "No extra icon found for collapsing folder special animation: %@", v1, 0xCu);
}

- (void)originForIcon:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_ERROR, "Can't return an origin for icon not in this list: %@", v1, 0xCu);
}

- (void)iconViewForIcon:(void *)a1 .cold.1(void *a1)
{
  id v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D7F0A000, v2, v3, "Configuring icon view for icon %@", v4, v5, v6, v7, v8);
}

void __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_cold_1(void *a1)
{
  id v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_1D7F0A000, v2, v3, "Removing icon view from screen for icon %@", v4, v5, v6, v7, v8);
}

- (void)setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D7F0A000, v0, OS_LOG_TYPE_DEBUG, "%p: No change in visible column range; skipping work.",
    v1,
    0xCu);
}

@end